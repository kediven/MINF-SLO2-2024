/******************************************************************************
 * Fichier : Mc32Gest_RS232.h
 * Objet   : Déclarations pour la gestion RS232 (FIFO, fonctions d'envoi/réception)
 *
 * Auteur  : CHR
 * Version : V1.3
 * Note    : Compatible XC32 + Harmony
 *****************************************************************************/

#ifndef MC32GEST_RS232_H
#define MC32GEST_RS232_H

#include <stdint.h>
#include "GesFifoTh32.h"
#include "gestPWM.h"

/*----------------------------------------------------------------------------*/
/*                        Constantes et macros                                */
/*----------------------------------------------------------------------------*/
#define MESS_SIZE    5       /**< Taille d'un message complet (en octets).           */
#define STX_code    (-86)    /**< Code de départ (STX), -86 correspond à 0xAA en hex. */

#define FIFO_RX_SIZE ((4 * MESS_SIZE) + 1)   /**< Taille FIFO RX (4 messages + 1).  */
#define FIFO_TX_SIZE ((4 * MESS_SIZE) + 1)   /**< Taille FIFO TX (4 messages + 1).  */

#define COMM_TIMEOUT_CYCLES    10       /**< taille d'un cycle. */

#define RX_FIFO_START_THRESHOLD   (2 * MESS_SIZE)
#define RX_FIFO_STOP_THRESHOLD    6

/*----------------------------------------------------------------------------*/
/*                      Structures de données                                 */
/*----------------------------------------------------------------------------*/
/**
 * @brief Structure représentant le format d'un message échangé.
 *        - Start  : octet de synchronisation (STX_code)
 *        - Speed  : consigne de vitesse
 *        - Angle  : consigne d'angle
 *        - MsbCrc : octet de poids fort du CRC
 *        - LsbCrc : octet de poids faible du CRC
 */
typedef struct {
    uint8_t Start;
    int8_t  Speed;
    int8_t  Angle;
    uint8_t MsbCrc;
    uint8_t LsbCrc;
} StruMess;

/**
 * @brief Union pour gérer une valeur 16 bits (uint16_t)
 *        en accédant séparément à l'octet faible (lsb) et fort (msb).
 */
typedef union {
    uint16_t val;
    struct {
        uint8_t lsb;
        uint8_t msb;
    } shl;
} U_manip16;

/*----------------------------------------------------------------------------*/
/*                Prototypes des fonctions                                    */
/*----------------------------------------------------------------------------*/
void InitFifoComm(void);
int  GetMessage(S_pwmSettings *pData);
void SendMessage(S_pwmSettings *pData);

/*----------------------------------------------------------------------------*/
/*                Descripteurs externes (définis dans le .c)                  */
/*----------------------------------------------------------------------------*/
extern S_fifo descrFifoRX;
extern S_fifo descrFifoTX;

#endif /* MC32GEST_RS232_H */
