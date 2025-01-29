/******************************************************************************
 * Fichier : Mc32Gest_RS232.c
 * Objet   : Gestion de la communication s�rie (RS232) avec CRC et FIFO
 *           - Initialisation des FIFOs de r�ception et d'�mission
 *           - Lecture/�criture de messages structur�s (vitesse, angle, CRC)
 *           - Gestion d'interruptions (erreurs, RX, TX)
 *
 * Auteur  : CHR / SCA 
 * Ann�e   : 2017-2018 (Mise � jour des commentaires : 2023)
 *****************************************************************************/

#include <xc.h>
#include <sys/attribs.h>
#include "system_definitions.h"

#include "GesFifoTh32.h"
#include "Mc32gest_RS232.h"
#include "gestPWM.h"
#include "Mc32CalCrc16.h"


// Struct pour �mission des messages
StruMess TxMess;
// Struct pour r�ception des messages
StruMess RxMess;  
/*----------------------------------------------------------------------------*/
/*                  Descripteurs de FIFO (R�ception et �mission)              */
/*----------------------------------------------------------------------------*/

S_fifo descrFifoRX; /**< Descripteur du FIFO de r�ception (RX).            */
S_fifo descrFifoTX; /**< Descripteur du FIFO d'�mission (TX).             */

/* Allocation m�moire pour les deux FIFOs */
static int8_t fifoRX[FIFO_RX_SIZE];
static int8_t fifoTX[FIFO_TX_SIZE];


/*----------------------------------------------------------------------------*/
/*                          Initialisation FIFO et RTS                         */
/*----------------------------------------------------------------------------*/

/**
 * @brief Initialise les deux FIFOs (RX et TX) et positionne la ligne RTS.
 *        - FIFO RX et FIFO TX sont allou�s localement.
 *        - RTS = 1 pour interdire l?�mission distante (flow control).
 */
void InitFifoComm(void) 
{

    // Initialisation du fifo de r�ception
    InitFifo(&descrFifoRX, FIFO_RX_SIZE, fifoRX, 0);
    // Initialisation du fifo d'�mission
    InitFifo(&descrFifoTX, FIFO_TX_SIZE, fifoTX, 0);

    // Init RTS 
    RS232_RTS = 1;   // interdit �mission par l'autre
}

/*----------------------------------------------------------------------------*/
/*            Lecture d'un message complet depuis le FIFO de r�ception        */
/*----------------------------------------------------------------------------*/

/**
 * description R�cup�re et traite un message complet depuis le FIFO RX.
 *
 * Cette fonction extrait un message compos� des �l�ments suivants :
 * - STX (Start Transmission Byte)
 * - Speed (Vitesse)
 * - Angle
 * - CRC (Code de Redondance Cyclique pour l'int�grit� des donn�es)
 *
 * Si le message est valide (CRC correct), les param�tres PWM sont mis � jour
 * et le mode de communication passe en "remote". Sinon, le mode reste en "local".
 *
 * param[in,out] pData Pointeur vers la structure S_pwmSettings,
 *                      contenant les valeurs de vitesse et d'angle.
 *
 * return
 *         - 0 : Aucun message valide re�u ? mode local
 *         - 1 : Message valide re�u ? mode remote
 */
int GetMessage(S_pwmSettings* pData) {
    static uint8_t iter = 0; // Compteur d'it�rations sans r�ception de message
    static uint8_t commStatus = 0; // �tat de communication : 0 = local, 1 = remote
    uint8_t NbCharToRead = GetReadSize(&descrFifoRX); // Nombre d'octets disponibles dans le buffer RX
    int8_t RxChar; // Octet re�u via la communication s�rie
    uint16_t Crc = 0xFFFF; // Valeur initiale du CRC
    U_manip16 receivedCRC; // Union pour assembler le CRC re�u (MSB + LSB)

    // V�rifie si suffisamment d'octets sont disponibles pour un message complet
    if (NbCharToRead >= MESS_SIZE)
    {
        // Lecture du premier octet et v�rification du code de d�but (STX_code)
        GetCharFromFifo(&descrFifoRX, &RxChar);
        if (RxChar == STX_code) {
            // Extraction des valeurs du message re�u
            RxMess.Start = RxChar;
            GetCharFromFifo(&descrFifoRX, &RxMess.Speed); // Vitesse
            GetCharFromFifo(&descrFifoRX, &RxMess.Angle); // Angle
            GetCharFromFifo(&descrFifoRX, (int8_t*)&RxMess.MsbCrc); // Octet de poids fort du CRC
            GetCharFromFifo(&descrFifoRX, (int8_t*)&RxMess.LsbCrc); // Octet de poids faible du CRC

            // Calcul du CRC sur les donn�es re�ues (hors CRC)
            Crc = updateCRC16(Crc, RxMess.Start);
            Crc = updateCRC16(Crc, RxMess.Speed);
            Crc = updateCRC16(Crc, RxMess.Angle);

            // Reconstruction du CRC re�u (conversion des 2 octets en une valeur 16 bits)
            receivedCRC.shl.msb = RxMess.MsbCrc;
            receivedCRC.shl.lsb = RxMess.LsbCrc;

            // V�rification du CRC : comparaison entre le CRC calcul� et celui re�u
            if (Crc == receivedCRC.val)
            {
                // CRC valide => mise � jour des param�tres PWM
                pData->SpeedSetting = RxMess.Speed;
                pData->absSpeed = abs(RxMess.Speed); // Valeur absolue de la vitesse

                pData->AngleSetting = RxMess.Angle;
                pData->absAngle = abs(RxMess.Angle-90); // Valeur absolue de l'angle

                // R�initialisation du compteur d'absence de messages et passage en mode remote
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
        // Pas assez d'octets dans le buffer => incr�mentation du compteur d'absence de message
        iter++;
        if (iter >= COMM_TIMEOUT_ITERATION) {
            // Si aucune r�ception pendant un certain temps => retour au mode local
            commStatus = 0;
            iter = COMM_TIMEOUT_ITERATION; // �vite tout d�passement du compteur
        }
    }

    // Gestion du contr�le de flux : si l'espace disponible dans le FIFO RX est suffisant, on permet la transmission
    if (GetWriteSpace(&descrFifoRX) >= RX_FIFO_START_THRESHOLD) {
        RS232_RTS = 0; // Active la transmission depuis le p�riph�rique distant
    }

    return commStatus; // Retourne l'�tat de la communication (local ou remote)
}


/*----------------------------------------------------------------------------*/
/*           Construction et mise en FIFO d?un message � envoyer (TX)         */
/*----------------------------------------------------------------------------*/

/**
 * @brief Construit et envoie un message via le FIFO TX.
 *
 * Cette fonction g�n�re un message contenant les �l�ments suivants :
 * - STX (Start Transmission Byte)
 * - Speed (Vitesse)
 * - Angle
 * - CRC (Code de Redondance Cyclique pour l'int�grit� des donn�es)
 *
 * Le message est ins�r� dans le FIFO de transmission (TX) si suffisamment d'espace est disponible.
 * Si le buffer TX contient des donn�es et que le signal CTS est bas, l'interruption TX est activ�e.
 *
 * @param[in] pData Pointeur vers la structure S_pwmSettings contenant les valeurs
 *                  de vitesse et d'angle � envoyer.
 */
void SendMessage(S_pwmSettings* pData) {
    int8_t spaceLeft;
    uint16_t Crc = 0xFFFF;

    // V�rification de l'espace disponible dans le FIFO TX avant d'envoyer un message
    spaceLeft = GetWriteSpace(&descrFifoTX);
    if (spaceLeft >= MESS_SIZE) {
        // Calcul du CRC sur les donn�es du message (Start, Speed, Angle)
        Crc = updateCRC16(Crc, (int8_t)STX_code);
        Crc = updateCRC16(Crc, pData->SpeedSetting);
        Crc = updateCRC16(Crc, pData->AngleSetting);

        // Extraction des octets de poids fort et faible du CRC 16 bits
        TxMess.MsbCrc = (uint8_t)((Crc & 0xFF00) >> 8); // Octet de poids fort
        TxMess.LsbCrc = (uint8_t)(Crc & 0x00FF);        // Octet de poids faible

        // Construction du message avec les donn�es fournies
        TxMess.Start = (uint8_t)STX_code;
        TxMess.Speed = pData->SpeedSetting;
        TxMess.Angle = pData->AngleSetting;

        // Ajout du message dans le FIFO d'�mission
        PutCharInFifo(&descrFifoTX, (int8_t)TxMess.Start);
        PutCharInFifo(&descrFifoTX, TxMess.Speed);
        PutCharInFifo(&descrFifoTX, TxMess.Angle);
        PutCharInFifo(&descrFifoTX, (int8_t)TxMess.MsbCrc);
        PutCharInFifo(&descrFifoTX, (int8_t)TxMess.LsbCrc);
    }

    // V�rification du signal CTS et activation de l'interruption TX si n�cessaire
    if ((RS232_CTS == 0) && (GetReadSize(&descrFifoTX) > 0)) {
        PLIB_INT_SourceEnable(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT);
    }
}

/**
 * @brief G�re les interruptions de l'UART1 (erreurs, r�ception et �mission).
 *
 * Cette fonction traite les erreurs de communication, r�ceptionne les donn�es
 * entrantes et g�re l?envoi des donn�es sortantes via le FIFO TX.
 */
void __ISR(_UART_1_VECTOR, ipl5AUTO) UART1_InterruptHandler(void) {
    int8_t receivedByte; // Variable pour stocker temporairement un octet re�u.

    // Indicateur de d�but d'interruption : �teindre LED3 pour signaler l'entr�e dans l'interruption
    LED3_W = 1;

    /* === Gestion des erreurs UART === */
    if (PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_1_ERROR)) {
        // V�rifie si un drapeau d'erreur d'UART1 est lev�

        PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_1_ERROR);
        // Efface le flag d'erreur pour indiquer qu'il a �t� trait�

        if (PLIB_USART_ErrorsGet(USART_ID_1) & USART_ERROR_RECEIVER_OVERRUN) {
            // V�rifie s'il y a une erreur d'overflow (d�passement de buffer RX)

            PLIB_USART_ReceiverOverrunErrorClear(USART_ID_1);
            // Efface l'erreur d'overflow pour permettre la r�ception de nouveaux octets
        }

        // Vider le buffer RX mat�riel en cas de donn�es r�siduelles � cause d'une erreur
        while (PLIB_USART_ReceiverDataIsAvailable(USART_ID_1)) {
            (void)PLIB_USART_ReceiverByteReceive(USART_ID_1);
            // Lire et ignorer les donn�es dans le buffer pour le vider
        }
    }

    /* === R�ception des donn�es UART === */
    if (PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_1_RECEIVE)) {
        // V�rifie si un drapeau d'interruption de r�ception est lev�

        while (PLIB_USART_ReceiverDataIsAvailable(USART_ID_1)) {
            // Tant qu'il y a des donn�es � lire dans le buffer RX de l'UART1

            receivedByte = (int8_t)PLIB_USART_ReceiverByteReceive(USART_ID_1);
            // Lire un octet de donn�es du buffer mat�riel RX

            PutCharInFifo(&descrFifoRX, receivedByte);
            // Placer l'octet re�u dans le FIFO RX logiciel
        }

        LED4_W = !LED4_R;
        // Inverse l'�tat de LED4 pour indiquer qu'une r�ception de donn�es a eu lieu

        if (GetWriteSpace(&descrFifoRX) <= RX_FIFO_STOP_THRESHOLD) {
            // V�rifie si l'espace disponible dans le FIFO RX est inf�rieur au seuil critique

            RS232_RTS = 1;
            // Active RTS (Request To Send) pour signaler � l'�metteur distant d'arr�ter l'envoi
        }

        PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_1_RECEIVE);
        // Efface le flag d'interruption de r�ception pour indiquer qu'il a �t� trait�
    }

    /* === Transmission des donn�es UART === */
    if (PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT)) {
        // V�rifie si un drapeau d'interruption de transmission est lev�

        while ((RS232_CTS == 0) && GetReadSize(&descrFifoTX) > 0 &&
            !PLIB_USART_TransmitterBufferIsFull(USART_ID_1)) {
            // Tant que CTS (Clear To Send) est bas, qu'il y a des donn�es � envoyer
            // dans le FIFO TX et que le buffer mat�riel TX de l'UART1 n'est pas plein

            GetCharFromFifo(&descrFifoTX, &receivedByte);
            // R�cup�re un octet du FIFO TX logiciel

            PLIB_USART_TransmitterByteSend(USART_ID_1, (uint8_t)receivedByte);
            // Envoie l'octet via l'UART1

            BSP_LEDToggle(BSP_LED_6);
            // Toggle LED6 pour indiquer l'envoi d'un octet
        }

        if (GetReadSize(&descrFifoTX) == 0) {
            // V�rifie s'il n'y a plus de donn�es � envoyer dans le FIFO TX

            PLIB_INT_SourceDisable(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT);
            // D�sactive l'interruption de transmission pour �conomiser les ressources
        }

        PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT);
        // Efface le flag d'interruption de transmission pour indiquer qu'il a �t� trait�

        LED5_W = !LED5_R;
        // Inverse l'�tat de LED5 pour indiquer une activit� de transmission
    }

    LED3_W = 0;
    // Rallume LED3 pour indiquer la fin de l'interruption
}

