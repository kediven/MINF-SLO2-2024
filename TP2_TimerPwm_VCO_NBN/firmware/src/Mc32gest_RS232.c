/******************************************************************************
 * Fichier : Mc32Gest_RS232.c
 * Objet   : Gestion de la communication s�rie (RS232) avec CRC et FIFO
 *           - Initialisation des FIFOs de r�ception et d'�mission
 *           - Lecture/�criture de messages structur�s (vitesse, angle, CRC)
 *           - Gestion d'interruptions (erreurs, RX, TX)
 *
 * Auteur  : CHR / SCA 
 * Ann�e   : 2017-2018 (Mise � jour des commentaires : 2023)
 * Eleve   : NEG / Ann�e 2025
 *****************************************************************************/

#include <xc.h>
#include <sys/attribs.h>
#include "system_definitions.h"

#include "GesFifoTh32.h"
#include "Mc32gest_RS232.h"
#include "gestPWM.h"
#include "Mc32CalCrc16.h"

/*----------------------------------------------------------------------------*/
/*                  Descripteurs de FIFO (R�ception et �mission)              */
/*----------------------------------------------------------------------------*/
S_fifo descrFifoRX; /**< Descripteur du FIFO de r�ception (RX).            */
S_fifo descrFifoTX; /**< Descripteur du FIFO d'�mission (TX).             */

/*----------------------------------------------------------------------------*/
/*                          Initialisation FIFO et RTS                         */
/*----------------------------------------------------------------------------*/

/**
 * @brief Initialise les deux FIFOs (RX et TX) et positionne la ligne RTS.
 *        - FIFO RX et FIFO TX sont allou�s localement.
 *        - RTS = 1 pour interdire l?�mission distante (flow control).
 */
void InitFifoComm(void) {
    /* Allocation m�moire pour les deux FIFOs */
    static int8_t fifoRX[FIFO_RX_SIZE];
    static int8_t fifoTX[FIFO_TX_SIZE];

    /* Initialisation des FIFOs (RX et TX) */
    InitFifo(&descrFifoRX, FIFO_RX_SIZE, fifoRX, 0);
    InitFifo(&descrFifoTX, FIFO_TX_SIZE, fifoTX, 0);

    /* RTS = 1 => on bloque l'�mission du p�riph�rique distant */
    RS232_RTS = 1;
}

/*----------------------------------------------------------------------------*/
/*            Lecture d'un message complet depuis le FIFO de r�ception        */
/*----------------------------------------------------------------------------*/

/**
 * @brief R�cup�re un message complet (STX, Speed, Angle, CRC) dans le FIFO RX.
 *        Met � jour la structure PWM si le message est valide (CRC correct).
 *
 * @param[in,out] pData : Pointeur vers la structure S_pwmSettings
 *                        (vitesse, angle, etc.)
 * @return
 *         - 0 : Aucun message valide re�u => mode local
 *         - 1 : Message valide re�u => mode remote
 */
int GetMessage(S_pwmSettings *pData) {
    StruMess RxMess; /* Structure temporaire pour le message */
    static uint8_t cycles = 0; /* Compteur de "non-r�ception" pour repasser en local */
    static uint8_t commStatus = 0; /* 0 = local, 1 = remote                */
    uint8_t NbCharToRead = GetReadSize(&descrFifoRX);
    int8_t RxC;
    uint16_t computedCRC = 0xFFFF;
    U_manip16 tempUnion;

    /* V�rifie si assez d'octets pour un message complet */
    if (NbCharToRead >= MESS_SIZE) 
    {
        /* Lecture du premier octet (doit �tre STX_code) */
        GetCharFromFifo(&descrFifoRX, &RxC);
        if (RxC == STX_code) {
            /* R�cup�ration des champs (Speed, Angle, MSB CRC, LSB CRC) */
            RxMess.Start = RxC;
            GetCharFromFifo(&descrFifoRX, &RxMess.Speed);
            GetCharFromFifo(&descrFifoRX, &RxMess.Angle);
            GetCharFromFifo(&descrFifoRX, (int8_t*) & RxMess.MsbCrc);
            GetCharFromFifo(&descrFifoRX, (int8_t*) & RxMess.LsbCrc);

            /* Calcul du CRC local */
            computedCRC = updateCRC16(computedCRC, RxMess.Start);
            computedCRC = updateCRC16(computedCRC, RxMess.Speed);
            computedCRC = updateCRC16(computedCRC, RxMess.Angle);

            /* Reconstruction du CRC re�u (16 bits) */
            tempUnion.shl.msb = RxMess.MsbCrc;
            tempUnion.shl.lsb = RxMess.LsbCrc;

            /* V�rification du CRC */
            if (computedCRC == tempUnion.val) {
                /* CRC valide => Mise � jour des r�glages PWM */
                pData->SpeedSetting = RxMess.Speed;
                pData->absSpeed = abs(RxMess.Speed);
                
                pData->AngleSetting = RxMess.Angle;
                pData->absAngle  = abs(RxMess.Angle);

                /* Reset du compteur + Passage en mode remote */
                cycles = 0;
                commStatus = 1;
            } else {
                /* CRC invalide => LED6 Toggle (indicateur erreur) */
                BSP_LEDToggle(BSP_LED_6);
            }
        }
    } 
    else 
    {
        /* Pas assez d'octets => on incr�mente le compteur */
        cycles++;
        if (cycles >= COMM_TIMEOUT_CYCLES) {
            /* Apr�s 10 tours sans message => on repasse en local */
            commStatus = 0;
            cycles = COMM_TIMEOUT_CYCLES; /* Limite pour �viter le d�passement */
        }
    }

    /* Contr�le de flux : si le FIFO RX a suffisamment d'espace => RTS = 0 */
    if (GetWriteSpace(&descrFifoRX) >= RX_FIFO_START_THRESHOLD) {
        RS232_RTS = 0; /* Autorise l?�mission du p�riph�rique distant */
    }

    return commStatus;
}

/*----------------------------------------------------------------------------*/
/*           Construction et mise en FIFO d?un message � envoyer (TX)         */
/*----------------------------------------------------------------------------*/

/**
 * @brief Construit un message complet (STX, Speed, Angle, CRC) � partir de pData,
 *        et l?ajoute dans le FIFO d?�mission (TX).
 *
 * @param[in] pData : Pointeur vers la structure S_pwmSettings
 *                    contenant les valeurs de vitesse et d?angle.
 */
void SendMessage(S_pwmSettings *pData) {
    StruMess TxMess;
    int8_t spaceLeft;
    uint16_t newCrc = 0xFFFF;

    /* V�rification de l'espace libre dans le FIFO TX */
    spaceLeft = GetWriteSpace(&descrFifoTX);
    if (spaceLeft >= MESS_SIZE) {
        /* Calcul du CRC sur Start, Speed, Angle */
        newCrc = updateCRC16(newCrc, (int8_t) STX_code);
        newCrc = updateCRC16(newCrc, pData->SpeedSetting);
        newCrc = updateCRC16(newCrc, pData->AngleSetting);

        /* D�composition du CRC 16 bits en MSB / LSB */
        TxMess.MsbCrc = (uint8_t) ((newCrc & 0xFF00) >> 8);
        TxMess.LsbCrc = (uint8_t) (newCrc & 0x00FF);

        /* Pr�paration du message */
        TxMess.Start = (uint8_t) STX_code;
        TxMess.Speed = pData->SpeedSetting;
        TxMess.Angle = pData->AngleSetting;

        /* Insertion dans le FIFO d'�mission */
        PutCharInFifo(&descrFifoTX, (int8_t) TxMess.Start);
        PutCharInFifo(&descrFifoTX, TxMess.Speed);
        PutCharInFifo(&descrFifoTX, TxMess.Angle);
        PutCharInFifo(&descrFifoTX, (int8_t) TxMess.MsbCrc);
        PutCharInFifo(&descrFifoTX, (int8_t) TxMess.LsbCrc);
    }

    /* Si le FIFO n'est pas vide et que CTS=0 => on active l'interruption TX */
    if ((RS232_CTS == 0) && (GetReadSize(&descrFifoTX) > 0)) {
        PLIB_INT_SourceEnable(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT);
    }
}

/*----------------------------------------------------------------------------*/
/*                     Routine d'interruption USART1                          */
/*----------------------------------------------------------------------------*/

/**
 * @brief G�re les interruptions de l'UART1 : erreurs, r�ception et �mission.
 *
 * Vecteur      : _UART_1_VECTOR
 * Priorit� IPL : ipl5AUTO
 */
void __ISR(_UART_1_VECTOR, ipl5AUTO) _IntHandlerDrvUsartInstance0(void) {
    USART_ERROR currentError;
    bool hwBufferFull;
    uint8_t rxAvailable;
    int8_t oneByte;
    uint8_t neededToSend;

    /* Indicateur de d�but d'interruption : LED3 OFF */
    LED3_W = 1;

    /* --- Gestion des erreurs (USART_1_ERROR) --- */
    if (PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_1_ERROR) &&
            PLIB_INT_SourceIsEnabled(INT_ID_0, INT_SOURCE_USART_1_ERROR)) {
        /* Efface le flag d'interruption d'erreur */
        PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_1_ERROR);

        /* R�cup�re l'erreur courante (overrun, framing, parit�) */
        currentError = PLIB_USART_ErrorsGet(USART_ID_1);

        /* Si overrun => on le clear */
        if ((currentError & USART_ERROR_RECEIVER_OVERRUN) == USART_ERROR_RECEIVER_OVERRUN) {
            PLIB_USART_ReceiverOverrunErrorClear(USART_ID_1);
        }

        /* Vider le buffer RX mat�riel en cas de donn�es r�siduelles */
        while (PLIB_USART_ReceiverDataIsAvailable(USART_ID_1)) {
            (void) PLIB_USART_ReceiverByteReceive(USART_ID_1);
        }
    }

    /* --- Gestion de la r�ception (USART_1_RECEIVE) --- */
    if (PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_1_RECEIVE) &&
            PLIB_INT_SourceIsEnabled(INT_ID_0, INT_SOURCE_USART_1_RECEIVE)) {
        currentError = PLIB_USART_ErrorsGet(USART_ID_1);

        /* Pas d'erreurs de framing/parit�/overrun ? */
        if ((currentError & (USART_ERROR_PARITY
                | USART_ERROR_FRAMING
                | USART_ERROR_RECEIVER_OVERRUN)) == 0) {
            /* Transfert des donn�es du buffer RX mat�riel vers le FIFO RX */
            rxAvailable = (uint8_t) PLIB_USART_ReceiverDataIsAvailable(USART_ID_1);
            while (rxAvailable) {
                oneByte = (int8_t) PLIB_USART_ReceiverByteReceive(USART_ID_1);
                PutCharInFifo(&descrFifoRX, oneByte);
                rxAvailable = (uint8_t) PLIB_USART_ReceiverDataIsAvailable(USART_ID_1);
            }

            /* Toggle LED4 pour indiquer une r�ception */
            LED4_W = !LED4_R;

            /* Nettoyage du flag d'interruption RX */
            PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_1_RECEIVE);
        } else {
            /* Si overrun => clear */
            if ((currentError & USART_ERROR_RECEIVER_OVERRUN) == USART_ERROR_RECEIVER_OVERRUN) {
                PLIB_USART_ReceiverOverrunErrorClear(USART_ID_1);
            }
        }

        /* Contr�le de flux : si le FIFO RX est presque plein => RTS = 1 */
        if (GetWriteSpace(&descrFifoRX) <= RX_FIFO_STOP_THRESHOLD) {
            RS232_RTS = 1;
        }
    }

    /* --- Gestion de l'�mission (USART_1_TRANSMIT) --- */
    if (PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT) &&
            PLIB_INT_SourceIsEnabled(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT)) {
        neededToSend = (uint8_t) GetReadSize(&descrFifoTX);
        hwBufferFull = PLIB_USART_TransmitterBufferIsFull(USART_ID_1);

        /* Tant qu'il y a des donn�es et que CTS=0 et que le buffer mat�riel TX n'est pas plein */
        if ((RS232_CTS == 0) && (neededToSend > 0) && (!hwBufferFull)) {
            do {
                /* Envoi d'un octet depuis le FIFO TX vers le mat�riel */
                GetCharFromFifo(&descrFifoTX, &oneByte);
                PLIB_USART_TransmitterByteSend(USART_ID_1, (uint8_t) oneByte);

                /* Indicateur : LED6 Toggle pour visualiser l'�mission */
                BSP_LEDToggle(BSP_LED_6);

                /* Mise � jour des conditions */
                neededToSend = (uint8_t) GetReadSize(&descrFifoTX);
                hwBufferFull = PLIB_USART_TransmitterBufferIsFull(USART_ID_1);

            } while ((RS232_CTS == 0) && (neededToSend > 0) && (!hwBufferFull));

            /* Plus rien � �mettre => on d�sactive l'interruption TX pour �conomiser des ressources */
            if (GetReadSize(&descrFifoTX) == 0) {
                PLIB_INT_SourceDisable(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT);
            }
        } else {
            /* Sinon, on coupe l'interruption d'�mission */
            PLIB_INT_SourceDisable(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT);
        }

        /* Nettoyage du flag d'interruption TX */
        PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT);

        /* Toggle LED5 pour indiquer l'activit� TX */
        LED5_W = !LED5_R;
    }

    /* Fin d'interruption : LED3 ON */
    LED3_W = 0;
}
