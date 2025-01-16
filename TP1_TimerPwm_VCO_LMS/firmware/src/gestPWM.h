#ifndef GestPWM_H
#define GestPWM_H

/*--------------------------------------------------------*/
// GestPWM.h
/*--------------------------------------------------------*/
// Description : Gestion des PWM 
//               pour TP1 2016-2017
//
// Auteur       : C. HUBER
//
// Version      : V1.1
// Compilateur  : XC32 V1.42 + Harmony 1.08
//
// Modification : 1.12.2023 SCA : enlev� decl. PWMData extern
//
/*--------------------------------------------------------*/
// --------------- Inclusions suppl�mentaires ---------------
#include "app.h"                    // D�pendances applicatives

/*--------------------------------------------------------*/
// D�finitions des constantes
/*--------------------------------------------------------*/

// D�finitions constantes ADC1
#define ADC_SAMPLING_SIZE 10  // Taille des buffers pour moyennes glissantes
#define ADC1_MAX 1023         // R�solution maximale de l'ADC (10 bits)
#define ADC1_VALUE_MAX 198    // Plage mapp�e pour vitesse (0 � 198)

// D�finitions constantes ADC2
#define ADC2_MAX 1023         // R�solution maximale de l'ADC (10 bits)
#define ADC2_ANGLE_MAX 180    // Plage angulaire (0� � 180�)
#define ADC2_ANGLE_OFFSET 90  // D�calage pour angle (-90� � +90�)

// Gestions des Output compare 
#define PWM_OC2_SCALE 125    // �chelle pour le calcul de la largeur d'impulsion OC2
#define PWM_OC2_DIV 99       // Diviseur pour normaliser la largeur d'impulsion OC2

#define PWM_OC3_MIN 749      // Valeur minimale pour la largeur d'impulsion OC3
#define PWM_OC3_MAX 2999     // Valeur maximale pour la largeur d'impulsion OC3
#define PWM_OC3_DIV 180      // Diviseur pour normaliser la largeur d'impulsion OC3
/*--------------------------------------------------------*/
// D�finition de la structure S_pwmSettings
/*--------------------------------------------------------*/

/**
 * @brief Structure contenant les param�tres pour la gestion des PWM.
 */
typedef struct {
    uint8_t absSpeed;    // Vitesse absolue (0 � 99)
    uint8_t absAngle;    // Angle absolu (0 � 180)
    int8_t SpeedSetting; // Consigne de vitesse (-99 � +99)
} S_pwmSettings;

/*--------------------------------------------------------*/
// Prototypes des fonctions
/*--------------------------------------------------------*/

/**
 * @brief Initialise la structure PWM et configure le mat�riel associ�.
 * @param pData Pointeur vers la structure S_pwmSettings � initialiser.
 */
void GPWM_Initialize(S_pwmSettings *pData);

/**
 * @brief Lit les donn�es des ADC pour calculer la vitesse et l'angle.
 * @param pData Pointeur vers la structure S_pwmSettings � mettre � jour.
 */
void GPWM_GetSettings(S_pwmSettings *pData);

/**
 * @brief Affiche les param�tres PWM (vitesse et angle) sur un �cran LCD.
 * @param pData Pointeur vers la structure S_pwmSettings � afficher.
 */
void GPWM_DispSettings(S_pwmSettings *pData);

/**
 * @brief Ex�cute la PWM pour le contr�le du moteur en fonction des consignes.
 * @param pData Pointeur vers la structure S_pwmSettings utilis�e pour le contr�le.
 */
void GPWM_ExecPWM(S_pwmSettings *pData);

/**
 * @brief G�n�re une PWM logicielle pour simuler un signal PWM.
 * @param pData Pointeur vers la structure S_pwmSettings utilis�e pour la g�n�ration.
 */
void GPWM_ExecPWMSoft(S_pwmSettings *pData);

#endif // GestPWM_H
