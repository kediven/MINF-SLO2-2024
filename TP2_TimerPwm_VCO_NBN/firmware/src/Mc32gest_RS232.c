// Mc32Gest_RS232.C
// Canevas manipulatio TP2 RS232 SLO2 2017-18
// Fonctions d'�mission et de r�ception des message
// CHR 20.12.2016 ajout traitement int error
// CHR 22.12.2016 evolution des marquers observation int Usart
// SCA 03.01.2018 nettoy� r�ponse interrupt pour ne laisser que les 3 ifs

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

// Structure d�crivant le message
typedef struct {
    uint8_t Start;
    int8_t  Speed;
    int8_t  Angle;
    uint8_t MsbCrc;
    uint8_t LsbCrc;
} StruMess;


// Struct pour �mission des messages
StruMess TxMess;
// Struct pour r�ception des messages
StruMess RxMess;

// Declaration des FIFO pour r�ception et �mission
#define FIFO_RX_SIZE ( (4*MESS_SIZE) + 1)  // 4 messages
#define FIFO_TX_SIZE ( (4*MESS_SIZE) + 1)  // 4 messages

int8_t fifoRX[FIFO_RX_SIZE];
// Declaration du descripteur du FIFO de r�ception
S_fifo descrFifoRX;


int8_t fifoTX[FIFO_TX_SIZE];
// Declaration du descripteur du FIFO d'�mission
S_fifo descrFifoTX;


// Initialisation de la communication s�rielle
void InitFifoComm(void)
{    
    // Initialisation du fifo de r�ception
    InitFifo ( &descrFifoRX, FIFO_RX_SIZE, fifoRX, 0 );
    // Initialisation du fifo d'�mission
    InitFifo ( &descrFifoTX, FIFO_TX_SIZE, fifoTX, 0 );
    
    // Init RTS 
    RS232_RTS = 1;   // interdit �mission par l'autre
   
} // InitComm

 
// Valeur de retour 0  = pas de message re�u donc local (data non modifi�)
// Valeur de retour 1  = message re�u donc en remote (data mis � jour)
int GetMessage(S_pwmSettings *pData)
{
    bool commStatus = 0;
    int32_t NbCharToRead;
    uint8_t TailleChar= 0;
    
    uint16_t OLD_CRC = 0XFFFF;
    uint16_t NEW_CRC;
    uint8_t controle_LCB;
    uint8_t controle_MCB;
    
    // Retourne le nombre de caract�res � lire
    NbCharToRead = GetReadSize(&descrFifoRX);
    if(NbCharToRead >= MESS_SIZE)
    {
        
       // Traitement de r�ception � introduire ICI 
        
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

    // Lecture et d�codage fifo r�ception
    if(RxMess.Start == 0xAA)
    {
        
        //Calcul de CRC � 0xFFFF et soustraire le message start
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

    // Gestion controle de flux de la r�ception
    if(GetWriteSpace ( &descrFifoRX) >= (2*MESS_SIZE)) 
    {
        // autorise �mission par l'autre
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
    // Traitement �mission � introduire ICI
    // Formatage message et remplissage fifo �mission
    // ...
    freeSize = GetWriteSpace(&descrFifoTX);
    
    // test pour savoir si il reste de la place dans la pile
    if(freeSize >= MESS_SIZE)    
    {
        // Calcule le nouveau CRC16 � partir des param�tres de vitesse et d'angle.
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
        
        // D�pose le code de d�marrage dans la FIFO TX
        PutCharInFifo(&descrFifoTX, TxMess.Start);
        // D�pose la vitesse dans la FIFO TX
        PutCharInFifo(&descrFifoTX, TxMess.Speed);
        // D�pose l'angle dans la FIFO TX
        PutCharInFifo(&descrFifoTX, TxMess.Angle);
        // D�pose le MSB du CRC dans la FIFO TX
        PutCharInFifo(&descrFifoTX, TxMess.MsbCrc);
        // D�pose le LSB du CRC dans la FIFO TX
        PutCharInFifo(&descrFifoTX, TxMess.LsbCrc);
    }
    // Gestion du controle de flux
    // si on a un caract�re � envoyer et que CTS = 0
    freeSize = GetReadSize(&descrFifoTX);
    if ((RS232_CTS == 0) && (freeSize > 0))
    {
        // Autorise int �mission    
        PLIB_INT_SourceEnable(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT);                
    }
}


// Interruption USART1
// !!!!!!!!
// Attention ne pas oublier de supprimer la r�ponse g�n�r�e dans system_interrupt
// !!!!!!!!
 void __ISR(_UART_1_VECTOR, ipl5AUTO) _IntHandlerDrvUsartInstance0(void)
{
    static int8_t CharUsart; // Donn�e re�ue de l'UART qui sera transf�r�e au FIFO
    USART_ERROR UsartStatus;
    int8_t freeSize; // Espace libre dans le FIFO de r�ception
    int8_t TxSize;   // Taille des donn�es restantes dans le FIFO d'�mission

    // Marque le d�but de l'interruption avec LED3
    LED3_W = 1;

    // *****************************
    // Gestion des erreurs UART
    // *****************************
    // V�rifie si une interruption li�e � une erreur UART (comme parit�, framing ou overrun) a �t� d�clench�e
    if (PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_1_ERROR) &&
        PLIB_INT_SourceIsEnabled(INT_ID_0, INT_SOURCE_USART_1_ERROR))
    {
        // Nettoie le flag d'interruption d'erreur
        PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_1_ERROR);

        // Lecture pour vider les donn�es corrompues dans le buffer mat�riel
        while (PLIB_USART_ReceiverDataIsAvailable(USART_ID_1))
        {
            PLIB_USART_ReceiverByteReceive(USART_ID_1);
        }
    }

    // *****************************
    // Gestion de la r�ception (RX)
    // *****************************
    if (PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_1_RECEIVE) &&
        PLIB_INT_SourceIsEnabled(INT_ID_0, INT_SOURCE_USART_1_RECEIVE))
    {
        // V�rifie s'il y a des erreurs de r�ception
        UsartStatus = PLIB_USART_ErrorsGet(USART_ID_1);
        if ((UsartStatus & (USART_ERROR_PARITY | USART_ERROR_FRAMING | USART_ERROR_RECEIVER_OVERRUN)) == 0)
        {
            // Pas d'erreur d�tect�e, traite les donn�es re�ues
            while (PLIB_USART_ReceiverDataIsAvailable(USART_ID_1))
            {
                // Lecture des donn�es depuis le buffer mat�riel UART
                CharUsart = PLIB_USART_ReceiverByteReceive(USART_ID_1);

                // Ajout des caract�res re�us au FIFO logiciel
                if (!PutCharInFifo(&descrFifoRX, CharUsart))
                {
                    // Si le FIFO logiciel est plein, vous pouvez g�rer ici une erreur ou ignorer les donn�es.
                }
            }

            // Gestion du contr�le de flux RTS
            freeSize = GetWriteSpace(&descrFifoRX);
            if (freeSize <= 6)
            {
                RS232_RTS = 1; // Indique que le FIFO RX est presque plein
            }
            else
            {
                RS232_RTS = 0; // Indique qu'il y a de la place pour recevoir
            }

            // Inverse l'�tat de LED4 pour signaler l'activit� de r�ception
            LED4_W = !LED4_R;

            // Nettoie le flag d'interruption RX
            PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_1_RECEIVE);
        }
        else
        {
            // Gestion des erreurs sp�cifiques, notamment Receiver Overrun
            if (UsartStatus & USART_ERROR_RECEIVER_OVERRUN)
            {
                PLIB_USART_ReceiverOverrunErrorClear(USART_ID_1);
            }
        }
    }

    // *****************************
    // Gestion de la transmission (TX)
    // *****************************
    // V�rifie si une interruption TX a �t� d�clench�e et est activ�e
    if (PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT) &&
        PLIB_INT_SourceIsEnabled(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT))
    {
        // Taille des donn�es � transmettre
        TxSize = GetReadSize(&descrFifoTX);

        // Si des donn�es doivent �tre transmises
        if (RS232_CTS == 0 && TxSize > 0)
        {
            // Tant qu'il y a des donn�es � transmettre et que le buffer UART a de la place
            while (!PLIB_USART_TransmitterBufferIsFull(USART_ID_1) && TxSize > 0)
            {
                // Lecture des caract�res depuis le FIFO logiciel
                if (GetCharFromFifo(&descrFifoTX, &CharUsart))
                {
                    // Envoi des donn�es via le buffer mat�riel UART
                    PLIB_USART_TransmitterByteSend(USART_ID_1, CharUsart);

                    // Met � jour la taille restante
                    TxSize = GetReadSize(&descrFifoTX);
                }
            }
        }

        // Inverse l'�tat de LED5 pour signaler l'activit� de transmission
        LED5_W = !LED5_R;

        // D�sactive l'interruption TX si plus rien � transmettre
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




