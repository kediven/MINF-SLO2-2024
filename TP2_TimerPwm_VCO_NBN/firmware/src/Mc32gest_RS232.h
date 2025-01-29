/******************************************************************************
 * Fichier : Mc32Gest_RS232.h
 * Objet   : D�clarations pour la gestion de la communication RS232 
 *           (gestion FIFO, fonctions d'envoi et de r�ception).
 *
 * Auteur  : CHR
 * Version : V1.3
 * Note    : Compatible avec XC32 et Harmony.
 *****************************************************************************/

#ifndef MC32GEST_RS232_H
#define MC32GEST_RS232_H

#include <stdint.h>
#include "GesFifoTh32.h"
#include "gestPWM.h"

//--------------------------  Constantes et macros  --------------------------//

#define MESS_SIZE    5       // Taille d'un message complet en octets.
#define STX_code    (-86)    // Code de synchronisation (STX), -86 correspond � 0xAA en hexad�cimal.

#define FIFO_RX_SIZE ((4 * MESS_SIZE) + 1)   // Taille du buffer FIFO RX (capacit� de 4 messages + 1 octet de s�curit�).
#define FIFO_TX_SIZE ((4 * MESS_SIZE) + 1)   // Taille du buffer FIFO TX (capacit� de 4 messages + 1 octet de s�curit�).

#define COMM_TIMEOUT_ITERATION    10       // Nombre de d'iteration avant expiration du timeout de communication.

#define RX_FIFO_START_THRESHOLD   (2 * MESS_SIZE)  // Seuil de remplissage du FIFO RX pour d�buter le traitement des messages.
#define RX_FIFO_STOP_THRESHOLD    6               // Seuil de remplissage du FIFO RX pour stopper temporairement la r�ception.

//--------------------------  Structures de donn�es  --------------------------//
/**
 * @brief Structure repr�sentant le format d'un message transmis via RS232.
 *
 * - Start  : Octet de synchronisation (STX_code).
 * - Speed  : Valeur de consigne de vitesse.
 * - Angle  : Valeur de consigne d'angle.
 * - MsbCrc : Octet de poids fort du code de contr�le CRC.
 * - LsbCrc : Octet de poids faible du code de contr�le CRC.
 */
typedef struct {
    uint8_t Start;  // Code de d�part pour synchroniser la r�ception.
    int8_t  Speed;  // Valeur de consigne de la vitesse.
    int8_t  Angle;  // Valeur de consigne de l'angle.
    uint8_t MsbCrc; // Octet de poids fort du CRC pour v�rifier l'int�grit� des donn�es.
    uint8_t LsbCrc; // Octet de poids faible du CRC.
} StruMess;

/**
 * @brief Union permettant d'acc�der � une valeur 16 bits (uint16_t)
 *        soit globalement, soit s�par�ment via ses octets de poids faible et fort.
 */
typedef union {
    uint16_t val;   // Valeur 16 bits enti�re.
    struct {
        uint8_t lsb; // Octet de poids faible (Least Significant Byte).
        uint8_t msb; // Octet de poids fort (Most Significant Byte).
    } shl;
} U_manip16;

//--------------------------  Prototypes des fonctions  --------------------------//
/**
 * @brief Initialise les files FIFO pour la communication RS232.
 */
void InitFifoComm(void);

/**
 * @brief R�cup�re un message de la file FIFO RX et met � jour les param�tres PWM.
 *
 * @param[in,out] pData Pointeur vers la structure contenant les param�tres PWM.
 * @return Renvoie 0 si en mode local, autre valeur si en mode distant.
 */
int GetMessage(S_pwmSettings *pData);

/**
 * @brief Envoie un message via la file FIFO TX.
 *
 * @param[in] pData Pointeur vers la structure contenant les param�tres PWM � envoyer.
 */
void SendMessage(S_pwmSettings *pData);

//--------------------------  Descripteurs externes  --------------------------//
extern S_fifo descrFifoRX; // Descripteur du buffer FIFO de r�ception.
extern S_fifo descrFifoTX; // Descripteur du buffer FIFO de transmission.

#endif /* MC32GEST_RS232_H */
