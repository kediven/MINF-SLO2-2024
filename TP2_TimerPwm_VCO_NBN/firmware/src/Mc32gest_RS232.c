// Mc32Gest_RS232.C
// Canevas manipulatio TP2 RS232 SLO2 2017-18
// Fonctions d'émission et de réception des message
// CHR 20.12.2016 ajout traitement int error
// CHR 22.12.2016 evolution des marquers observation int Usart
// SCA 03.01.2018 nettoyé réponse interrupt pour ne laisser que les 3 ifs

#include <xc.h>
#include <sys/attribs.h>
#include "system_definitions.h"
// Ajout CHR
#include <GenericTypeDefs.h>
#include "app.h"
#include "GesFifoTh32.h"
#include "Mc32gest_RS232.h"
#include "gestPWM.h"
#include "Mc32CalCrc16.h"


typedef union {
        uint16_t val;
        struct {uint8_t lsb;
                uint8_t msb;} shl;
} U_manip16;


// Definition pour les messages
#define MESS_SIZE  5
// avec int8_t besoin -86 au lieu de 0xAA
#define STX_code  (-86)

// Structure décrivant le message
typedef struct {
    uint8_t Start;
    int8_t  Speed;
    int8_t  Angle;
    uint8_t MsbCrc;
    uint8_t LsbCrc;
} StruMess;


// Struct pour émission des messages
StruMess TxMess;
// Struct pour réception des messages
StruMess RxMess;

// Declaration des FIFO pour réception et émission
#define FIFO_RX_SIZE ( (4*MESS_SIZE) + 1)  // 4 messages
#define FIFO_TX_SIZE ( (4*MESS_SIZE) + 1)  // 4 messages

int8_t fifoRX[FIFO_RX_SIZE];
// Declaration du descripteur du FIFO de réception
S_fifo descrFifoRX;


int8_t fifoTX[FIFO_TX_SIZE];
// Declaration du descripteur du FIFO d'émission
S_fifo descrFifoTX;


// Initialisation de la communication sérielle
void InitFifoComm(void)
{    
    // Initialisation du fifo de réception
    InitFifo ( &descrFifoRX, FIFO_RX_SIZE, fifoRX, 0 );
    // Initialisation du fifo d'émission
    InitFifo ( &descrFifoTX, FIFO_TX_SIZE, fifoTX, 0 );
    
    // Init RTS 
    RS232_RTS = 1;   // interdit émission par l'autre
   
} // InitComm

 
// Valeur de retour 0  = pas de message reçu donc local (data non modifié)
// Valeur de retour 1  = message reçu donc en remote (data mis à jour)
int GetMessage(S_pwmSettings *pData)
{
    bool commStatus = 0;
    int32_t NbCharToRead;
    uint8_t TailleChar= 0;
    
    uint16_t OLD_CRC = 0XFFFF;
    uint16_t NEW_CRC;
    uint8_t controle_LCB;
    uint8_t controle_MCB;
    
    // Retourne le nombre de caractères à lire
    NbCharToRead = GetReadSize(&descrFifoRX);
    if(NbCharToRead >= MESS_SIZE)
    {
        
       // Traitement de réception à introduire ICI 
        
        TailleChar = GetCharFromFifo(&descrFifoRX,&RxMess.Start );
        if(TailleChar != 0)
        {
           commStatus = 0; 
        }
        TailleChar = GetCharFromFifo(&descrFifoRX,&RxMess.Speed );
        if(TailleChar != 0)
        {
           commStatus = 0; 
        }
        TailleChar = GetCharFromFifo(&descrFifoRX,&RxMess.Angle);
        if(TailleChar != 0)
        {
           commStatus = 0; 
        }
        TailleChar = GetCharFromFifo(&descrFifoRX,&RxMess.MsbCrc);
        if(TailleChar != 0)
        {
           commStatus = 0; 
        }
        TailleChar = GetCharFromFifo(&descrFifoRX,&RxMess.LsbCrc);
        if(TailleChar != 0)
        {
           commStatus = 0; 
        }
    }
    else
    {
        commStatus = 0;
    }

    // Lecture et décodage fifo réception
    if(RxMess.Start == 0xAA)
    {
        
        //Calcul de CRC à 0xFFFF et soustraire le message start
        NEW_CRC = updateCRC16(OLD_CRC, RxMess.Start );
        OLD_CRC = NEW_CRC;
        //Soustraire le message speed au CRC
        NEW_CRC = updateCRC16(OLD_CRC, RxMess.Speed );
        OLD_CRC = NEW_CRC;
        //Soustraire le message angle au CRC
        NEW_CRC = updateCRC16(OLD_CRC, RxMess.Angle );
        //extraire du CRC le MSB 
        controle_MCB = (NEW_CRC>>8)& 0xFF;
        //extraire du CRC le LSB 
        controle_LCB = NEW_CRC & 0XFF;
        
        if((RxMess.MsbCrc == controle_MCB) && (RxMess.LsbCrc == controle_LCB))
        {
            pData->absAngle = RxMess.Angle;
            pData->SpeedSetting = RxMess.Speed;
            commStatus = 1;
        }
        else
        {
            commStatus =0;
        }
    }
    else
    {
        commStatus = 0;
    }   

    // Gestion controle de flux de la réception
    if(GetWriteSpace ( &descrFifoRX) >= (2*MESS_SIZE)) 
    {
        // autorise émission par l'autre
        RS232_RTS = 0;
        
    }
    return commStatus;
} // GetMessage


// Fonction d'envoi des messages, appel cyclique
void SendMessage(S_pwmSettings *pData)
{
    int8_t freeSize;
    uint32_t CRC = 0xFFFF;
    uint8_t msbCrc;
    uint8_t lsbCrc; 
    // Traitement émission à introduire ICI
    // Formatage message et remplissage fifo émission
    // ...
    freeSize = GetWriteSpace(&descrFifoTX);
    
    // test pour savoir si il reste de la place dans la pile
    if(freeSize >= MESS_SIZE)    
    {
        // Calcule le nouveau CRC16 à partir des paramètres de vitesse et d'angle.
        CRC = updateCRC16(CRC, STX_code);
        CRC = updateCRC16(CRC, pData->SpeedSetting);
        CRC = updateCRC16(CRC, pData-> absAngle);
        
        // Calcule le MSB (octet de poids fort) et le LSB (octet de poids faible) du CRC16.
        uint8_t msbCrc = (CRC >> 8) & 0xFF;  // Extrait les 8 bits de poids fort.
        uint8_t lsbCrc = CRC & 0xFF;        // Extrait les 8 bits de poids faible.

        // Affecte les valeurs au message de transmission.
        TxMess.MsbCrc = msbCrc;
        TxMess.LsbCrc = lsbCrc;
        
        TxMess.Start = STX_code;
        TxMess.Speed = pData->SpeedSetting;
        TxMess.Angle = pData->absAngle;
        
        // Dépose le code de démarrage dans la FIFO TX
        PutCharInFifo(&descrFifoTX, TxMess.Start);
        // Dépose la vitesse dans la FIFO TX
        PutCharInFifo(&descrFifoTX, TxMess.Speed);
        // Dépose l'angle dans la FIFO TX
        PutCharInFifo(&descrFifoTX, TxMess.Angle);
        // Dépose le MSB du CRC dans la FIFO TX
        PutCharInFifo(&descrFifoTX, TxMess.MsbCrc);
        // Dépose le LSB du CRC dans la FIFO TX
        PutCharInFifo(&descrFifoTX, TxMess.LsbCrc);
    }
    // Gestion du controle de flux
    // si on a un caractère à envoyer et que CTS = 0
    freeSize = GetReadSize(&descrFifoTX);
    if ((RS232_CTS == 0) && (freeSize > 0))
    {
        // Autorise int émission    
        PLIB_INT_SourceEnable(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT);                
    }
}


// Interruption USART1
// !!!!!!!!
// Attention ne pas oublier de supprimer la réponse générée dans system_interrupt
// !!!!!!!!
 void __ISR(_UART_1_VECTOR, ipl5AUTO) _IntHandlerDrvUsartInstance0(void)
{
    static int8_t CharUsart; // Donnée reçue de l'UART qui sera transférée au FIFO
    USART_ERROR UsartStatus;
    int8_t freeSize; // Espace libre dans le FIFO de réception
    int8_t TxSize;   // Taille des données restantes dans le FIFO d'émission

    // Marque le début de l'interruption avec LED3
    LED3_W = 1;

    // *****************************
    // Gestion des erreurs UART
    // *****************************
    // Vérifie si une interruption liée à une erreur UART (comme parité, framing ou overrun) a été déclenchée
    if (PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_1_ERROR) &&
        PLIB_INT_SourceIsEnabled(INT_ID_0, INT_SOURCE_USART_1_ERROR))
    {
        // Nettoie le flag d'interruption d'erreur
        PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_1_ERROR);

        // Lecture pour vider les données corrompues dans le buffer matériel
        while (PLIB_USART_ReceiverDataIsAvailable(USART_ID_1))
        {
            PLIB_USART_ReceiverByteReceive(USART_ID_1);
        }
    }

    // *****************************
    // Gestion de la réception (RX)
    // *****************************
    if (PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_1_RECEIVE) &&
        PLIB_INT_SourceIsEnabled(INT_ID_0, INT_SOURCE_USART_1_RECEIVE))
    {
        // Vérifie s'il y a des erreurs de réception
        UsartStatus = PLIB_USART_ErrorsGet(USART_ID_1);
        if ((UsartStatus & (USART_ERROR_PARITY | USART_ERROR_FRAMING | USART_ERROR_RECEIVER_OVERRUN)) == 0)
        {
            // Pas d'erreur détectée, traite les données reçues
            while (PLIB_USART_ReceiverDataIsAvailable(USART_ID_1))
            {
                // Lecture des données depuis le buffer matériel UART
                CharUsart = PLIB_USART_ReceiverByteReceive(USART_ID_1);

                // Ajout des caractères reçus au FIFO logiciel
                if (!PutCharInFifo(&descrFifoRX, CharUsart))
                {
                    // Si le FIFO logiciel est plein, vous pouvez gérer ici une erreur ou ignorer les données.
                }
            }

            // Gestion du contrôle de flux RTS
            freeSize = GetWriteSpace(&descrFifoRX);
            if (freeSize <= 6)
            {
                RS232_RTS = 1; // Indique que le FIFO RX est presque plein
            }
            else
            {
                RS232_RTS = 0; // Indique qu'il y a de la place pour recevoir
            }

            // Inverse l'état de LED4 pour signaler l'activité de réception
            LED4_W = !LED4_R;

            // Nettoie le flag d'interruption RX
            PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_1_RECEIVE);
        }
        else
        {
            // Gestion des erreurs spécifiques, notamment Receiver Overrun
            if (UsartStatus & USART_ERROR_RECEIVER_OVERRUN)
            {
                PLIB_USART_ReceiverOverrunErrorClear(USART_ID_1);
            }
        }
    }

    // *****************************
    // Gestion de la transmission (TX)
    // *****************************
    // Vérifie si une interruption TX a été déclenchée et est activée
    if (PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT) &&
        PLIB_INT_SourceIsEnabled(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT))
    {
        // Taille des données à transmettre
        TxSize = GetReadSize(&descrFifoTX);

        // Si des données doivent être transmises
        if (RS232_CTS == 0 && TxSize > 0)
        {
            // Tant qu'il y a des données à transmettre et que le buffer UART a de la place
            while (!PLIB_USART_TransmitterBufferIsFull(USART_ID_1) && TxSize > 0)
            {
                // Lecture des caractères depuis le FIFO logiciel
                if (GetCharFromFifo(&descrFifoTX, &CharUsart))
                {
                    // Envoi des données via le buffer matériel UART
                    PLIB_USART_TransmitterByteSend(USART_ID_1, CharUsart);

                    // Met à jour la taille restante
                    TxSize = GetReadSize(&descrFifoTX);
                }
            }
        }

        // Inverse l'état de LED5 pour signaler l'activité de transmission
        LED5_W = !LED5_R;

        // Désactive l'interruption TX si plus rien à transmettre
        if (TxSize == 0 || RS232_CTS != 0)
        {
            PLIB_INT_SourceDisable(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT);
        }

        // Nettoie le flag d'interruption TX
        PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT);
    }

    // Marque la fin de l'interruption avec LED3
    LED3_W = 0;
 }




