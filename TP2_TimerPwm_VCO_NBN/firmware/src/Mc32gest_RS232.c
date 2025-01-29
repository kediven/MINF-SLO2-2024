/******************************************************************************
 * Fichier : Mc32Gest_RS232.c
 * Objet   : Gestion de la communication série (RS232) avec CRC et FIFO
 *           - Initialisation des FIFOs de réception et d'émission
 *           - Lecture/écriture de messages structurés (vitesse, angle, CRC)
 *           - Gestion d'interruptions (erreurs, RX, TX)
 *
 * Auteur  : CHR / SCA 
 * Année   : 2017-2018 (Mise à jour des commentaires : 2023)
 *****************************************************************************/

#include <xc.h>
#include <sys/attribs.h>
#include "system_definitions.h"

#include "GesFifoTh32.h"
#include "Mc32gest_RS232.h"
#include "gestPWM.h"
#include "Mc32CalCrc16.h"


// Struct pour émission des messages
StruMess TxMess;
// Struct pour réception des messages
StruMess RxMess;  
/*----------------------------------------------------------------------------*/
/*                  Descripteurs de FIFO (Réception et Émission)              */
/*----------------------------------------------------------------------------*/

S_fifo descrFifoRX; /**< Descripteur du FIFO de réception (RX).            */
S_fifo descrFifoTX; /**< Descripteur du FIFO d'émission (TX).             */

/* Allocation mémoire pour les deux FIFOs */
static int8_t fifoRX[FIFO_RX_SIZE];
static int8_t fifoTX[FIFO_TX_SIZE];


/*----------------------------------------------------------------------------*/
/*                          Initialisation FIFO et RTS                         */
/*----------------------------------------------------------------------------*/

/**
 * @brief Initialise les deux FIFOs (RX et TX) et positionne la ligne RTS.
 *        - FIFO RX et FIFO TX sont alloués localement.
 *        - RTS = 1 pour interdire l?émission distante (flow control).
 */
void InitFifoComm(void) 
{

    // Initialisation du fifo de réception
    InitFifo(&descrFifoRX, FIFO_RX_SIZE, fifoRX, 0);
    // Initialisation du fifo d'émission
    InitFifo(&descrFifoTX, FIFO_TX_SIZE, fifoTX, 0);

    // Init RTS 
    RS232_RTS = 1;   // interdit émission par l'autre
}

/*----------------------------------------------------------------------------*/
/*            Lecture d'un message complet depuis le FIFO de réception        */
/*----------------------------------------------------------------------------*/

/**
 * description Récupère et traite un message complet depuis le FIFO RX.
 *
 * Cette fonction extrait un message composé des éléments suivants :
 * - STX (Start Transmission Byte)
 * - Speed (Vitesse)
 * - Angle
 * - CRC (Code de Redondance Cyclique pour l'intégrité des données)
 *
 * Si le message est valide (CRC correct), les paramètres PWM sont mis à jour
 * et le mode de communication passe en "remote". Sinon, le mode reste en "local".
 *
 * param[in,out] pData Pointeur vers la structure S_pwmSettings,
 *                      contenant les valeurs de vitesse et d'angle.
 *
 * return
 *         - 0 : Aucun message valide reçu ? mode local
 *         - 1 : Message valide reçu ? mode remote
 */
int GetMessage(S_pwmSettings* pData) {
    static uint8_t iter = 0; // Compteur d'itérations sans réception de message
    static uint8_t commStatus = 0; // État de communication : 0 = local, 1 = remote
    uint8_t NbCharToRead = GetReadSize(&descrFifoRX); // Nombre d'octets disponibles dans le buffer RX
    int8_t RxChar; // Octet reçu via la communication série
    uint16_t Crc = 0xFFFF; // Valeur initiale du CRC
    U_manip16 receivedCRC; // Union pour assembler le CRC reçu (MSB + LSB)

    // Vérifie si suffisamment d'octets sont disponibles pour un message complet
    if (NbCharToRead >= MESS_SIZE)
    {
        // Lecture du premier octet et vérification du code de début (STX_code)
        GetCharFromFifo(&descrFifoRX, &RxChar);
        if (RxChar == STX_code) {
            // Extraction des valeurs du message reçu
            RxMess.Start = RxChar;
            GetCharFromFifo(&descrFifoRX, &RxMess.Speed); // Vitesse
            GetCharFromFifo(&descrFifoRX, &RxMess.Angle); // Angle
            GetCharFromFifo(&descrFifoRX, (int8_t*)&RxMess.MsbCrc); // Octet de poids fort du CRC
            GetCharFromFifo(&descrFifoRX, (int8_t*)&RxMess.LsbCrc); // Octet de poids faible du CRC

            // Calcul du CRC sur les données reçues (hors CRC)
            Crc = updateCRC16(Crc, RxMess.Start);
            Crc = updateCRC16(Crc, RxMess.Speed);
            Crc = updateCRC16(Crc, RxMess.Angle);

            // Reconstruction du CRC reçu (conversion des 2 octets en une valeur 16 bits)
            receivedCRC.shl.msb = RxMess.MsbCrc;
            receivedCRC.shl.lsb = RxMess.LsbCrc;

            // Vérification du CRC : comparaison entre le CRC calculé et celui reçu
            if (Crc == receivedCRC.val)
            {
                // CRC valide => mise à jour des paramètres PWM
                pData->SpeedSetting = RxMess.Speed;
                pData->absSpeed = abs(RxMess.Speed); // Valeur absolue de la vitesse

                pData->AngleSetting = RxMess.Angle;
                pData->absAngle = abs(RxMess.Angle-90); // Valeur absolue de l'angle

                // Réinitialisation du compteur d'absence de messages et passage en mode remote
                iter = 0;
                commStatus = 1;
            }
            else
            {
                // CRC invalide => Indicateur d'erreur (clignotement de la LED6)
                BSP_LEDToggle(BSP_LED_6);
            }
        }
    }
    else
    {
        // Pas assez d'octets dans le buffer => incrémentation du compteur d'absence de message
        iter++;
        if (iter >= COMM_TIMEOUT_ITERATION) {
            // Si aucune réception pendant un certain temps => retour au mode local
            commStatus = 0;
            iter = COMM_TIMEOUT_ITERATION; // Évite tout dépassement du compteur
        }
    }

    // Gestion du contrôle de flux : si l'espace disponible dans le FIFO RX est suffisant, on permet la transmission
    if (GetWriteSpace(&descrFifoRX) >= RX_FIFO_START_THRESHOLD) {
        RS232_RTS = 0; // Active la transmission depuis le périphérique distant
    }

    return commStatus; // Retourne l'état de la communication (local ou remote)
}


/*----------------------------------------------------------------------------*/
/*           Construction et mise en FIFO d?un message à envoyer (TX)         */
/*----------------------------------------------------------------------------*/

/**
 * @brief Construit et envoie un message via le FIFO TX.
 *
 * Cette fonction génère un message contenant les éléments suivants :
 * - STX (Start Transmission Byte)
 * - Speed (Vitesse)
 * - Angle
 * - CRC (Code de Redondance Cyclique pour l'intégrité des données)
 *
 * Le message est inséré dans le FIFO de transmission (TX) si suffisamment d'espace est disponible.
 * Si le buffer TX contient des données et que le signal CTS est bas, l'interruption TX est activée.
 *
 * @param[in] pData Pointeur vers la structure S_pwmSettings contenant les valeurs
 *                  de vitesse et d'angle à envoyer.
 */
void SendMessage(S_pwmSettings* pData) {
    int8_t spaceLeft;
    uint16_t Crc = 0xFFFF;

    // Vérification de l'espace disponible dans le FIFO TX avant d'envoyer un message
    spaceLeft = GetWriteSpace(&descrFifoTX);
    if (spaceLeft >= MESS_SIZE) {
        // Calcul du CRC sur les données du message (Start, Speed, Angle)
        Crc = updateCRC16(Crc, (int8_t)STX_code);
        Crc = updateCRC16(Crc, pData->SpeedSetting);
        Crc = updateCRC16(Crc, pData->AngleSetting);

        // Extraction des octets de poids fort et faible du CRC 16 bits
        TxMess.MsbCrc = (uint8_t)((Crc & 0xFF00) >> 8); // Octet de poids fort
        TxMess.LsbCrc = (uint8_t)(Crc & 0x00FF);        // Octet de poids faible

        // Construction du message avec les données fournies
        TxMess.Start = (uint8_t)STX_code;
        TxMess.Speed = pData->SpeedSetting;
        TxMess.Angle = pData->AngleSetting;

        // Ajout du message dans le FIFO d'émission
        PutCharInFifo(&descrFifoTX, (int8_t)TxMess.Start);
        PutCharInFifo(&descrFifoTX, TxMess.Speed);
        PutCharInFifo(&descrFifoTX, TxMess.Angle);
        PutCharInFifo(&descrFifoTX, (int8_t)TxMess.MsbCrc);
        PutCharInFifo(&descrFifoTX, (int8_t)TxMess.LsbCrc);
    }

    // Vérification du signal CTS et activation de l'interruption TX si nécessaire
    if ((RS232_CTS == 0) && (GetReadSize(&descrFifoTX) > 0)) {
        PLIB_INT_SourceEnable(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT);
    }
}

/**
 * @brief Gère les interruptions de l'UART1 (erreurs, réception et émission).
 *
 * Cette fonction traite les erreurs de communication, réceptionne les données
 * entrantes et gère l?envoi des données sortantes via le FIFO TX.
 */
void __ISR(_UART_1_VECTOR, ipl5AUTO) UART1_InterruptHandler(void) {
    int8_t receivedByte; // Variable pour stocker temporairement un octet reçu.

    // Indicateur de début d'interruption : éteindre LED3 pour signaler l'entrée dans l'interruption
    LED3_W = 1;

    /* === Gestion des erreurs UART === */
    if (PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_1_ERROR)) {
        // Vérifie si un drapeau d'erreur d'UART1 est levé

        PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_1_ERROR);
        // Efface le flag d'erreur pour indiquer qu'il a été traité

        if (PLIB_USART_ErrorsGet(USART_ID_1) & USART_ERROR_RECEIVER_OVERRUN) {
            // Vérifie s'il y a une erreur d'overflow (dépassement de buffer RX)

            PLIB_USART_ReceiverOverrunErrorClear(USART_ID_1);
            // Efface l'erreur d'overflow pour permettre la réception de nouveaux octets
        }

        // Vider le buffer RX matériel en cas de données résiduelles à cause d'une erreur
        while (PLIB_USART_ReceiverDataIsAvailable(USART_ID_1)) {
            (void)PLIB_USART_ReceiverByteReceive(USART_ID_1);
            // Lire et ignorer les données dans le buffer pour le vider
        }
    }

    /* === Réception des données UART === */
    if (PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_1_RECEIVE)) {
        // Vérifie si un drapeau d'interruption de réception est levé

        while (PLIB_USART_ReceiverDataIsAvailable(USART_ID_1)) {
            // Tant qu'il y a des données à lire dans le buffer RX de l'UART1

            receivedByte = (int8_t)PLIB_USART_ReceiverByteReceive(USART_ID_1);
            // Lire un octet de données du buffer matériel RX

            PutCharInFifo(&descrFifoRX, receivedByte);
            // Placer l'octet reçu dans le FIFO RX logiciel
        }

        LED4_W = !LED4_R;
        // Inverse l'état de LED4 pour indiquer qu'une réception de données a eu lieu

        if (GetWriteSpace(&descrFifoRX) <= RX_FIFO_STOP_THRESHOLD) {
            // Vérifie si l'espace disponible dans le FIFO RX est inférieur au seuil critique

            RS232_RTS = 1;
            // Active RTS (Request To Send) pour signaler à l'émetteur distant d'arrêter l'envoi
        }

        PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_1_RECEIVE);
        // Efface le flag d'interruption de réception pour indiquer qu'il a été traité
    }

    /* === Transmission des données UART === */
    if (PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT)) {
        // Vérifie si un drapeau d'interruption de transmission est levé

        while ((RS232_CTS == 0) && GetReadSize(&descrFifoTX) > 0 &&
            !PLIB_USART_TransmitterBufferIsFull(USART_ID_1)) {
            // Tant que CTS (Clear To Send) est bas, qu'il y a des données à envoyer
            // dans le FIFO TX et que le buffer matériel TX de l'UART1 n'est pas plein

            GetCharFromFifo(&descrFifoTX, &receivedByte);
            // Récupère un octet du FIFO TX logiciel

            PLIB_USART_TransmitterByteSend(USART_ID_1, (uint8_t)receivedByte);
            // Envoie l'octet via l'UART1

            BSP_LEDToggle(BSP_LED_6);
            // Toggle LED6 pour indiquer l'envoi d'un octet
        }

        if (GetReadSize(&descrFifoTX) == 0) {
            // Vérifie s'il n'y a plus de données à envoyer dans le FIFO TX

            PLIB_INT_SourceDisable(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT);
            // Désactive l'interruption de transmission pour économiser les ressources
        }

        PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT);
        // Efface le flag d'interruption de transmission pour indiquer qu'il a été traité

        LED5_W = !LED5_R;
        // Inverse l'état de LED5 pour indiquer une activité de transmission
    }

    LED3_W = 0;
    // Rallume LED3 pour indiquer la fin de l'interruption
}

