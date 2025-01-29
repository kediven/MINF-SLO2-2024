/******************************************************************************
 * Fichier : Mc32Gest_RS232.h
 * Objet   : Déclarations pour la gestion de la communication RS232 
 *           (gestion FIFO, fonctions d'envoi et de réception).
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
#define STX_code    (-86)    // Code de synchronisation (STX), -86 correspond à 0xAA en hexadécimal.

#define FIFO_RX_SIZE ((4 * MESS_SIZE) + 1)   // Taille du buffer FIFO RX (capacité de 4 messages + 1 octet de sécurité).
#define FIFO_TX_SIZE ((4 * MESS_SIZE) + 1)   // Taille du buffer FIFO TX (capacité de 4 messages + 1 octet de sécurité).

#define COMM_TIMEOUT_ITERATION    10       // Nombre de d'iteration avant expiration du timeout de communication.

#define RX_FIFO_START_THRESHOLD   (2 * MESS_SIZE)  // Seuil de remplissage du FIFO RX pour débuter le traitement des messages.
#define RX_FIFO_STOP_THRESHOLD    6               // Seuil de remplissage du FIFO RX pour stopper temporairement la réception.

//--------------------------  Structures de données  --------------------------//
/**
 * @brief Structure représentant le format d'un message transmis via RS232.
 *
 * - Start  : Octet de synchronisation (STX_code).
 * - Speed  : Valeur de consigne de vitesse.
 * - Angle  : Valeur de consigne d'angle.
 * - MsbCrc : Octet de poids fort du code de contrôle CRC.
 * - LsbCrc : Octet de poids faible du code de contrôle CRC.
 */
typedef struct {
    uint8_t Start;  // Code de départ pour synchroniser la réception.
    int8_t  Speed;  // Valeur de consigne de la vitesse.
    int8_t  Angle;  // Valeur de consigne de l'angle.
    uint8_t MsbCrc; // Octet de poids fort du CRC pour vérifier l'intégrité des données.
    uint8_t LsbCrc; // Octet de poids faible du CRC.
} StruMess;

/**
 * @brief Union permettant d'accéder à une valeur 16 bits (uint16_t)
 *        soit globalement, soit séparément via ses octets de poids faible et fort.
 */
typedef union {
    uint16_t val;   // Valeur 16 bits entière.
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
 * @brief Récupère un message de la file FIFO RX et met à jour les paramètres PWM.
 *
 * @param[in,out] pData Pointeur vers la structure contenant les paramètres PWM.
 * @return Renvoie 0 si en mode local, autre valeur si en mode distant.
 */
int GetMessage(S_pwmSettings *pData);

/**
 * @brief Envoie un message via la file FIFO TX.
 *
 * @param[in] pData Pointeur vers la structure contenant les paramètres PWM à envoyer.
 */
void SendMessage(S_pwmSettings *pData);

//--------------------------  Descripteurs externes  --------------------------//
extern S_fifo descrFifoRX; // Descripteur du buffer FIFO de réception.
extern S_fifo descrFifoTX; // Descripteur du buffer FIFO de transmission.

#endif /* MC32GEST_RS232_H */
