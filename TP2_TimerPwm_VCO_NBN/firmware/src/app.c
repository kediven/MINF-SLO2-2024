/*******************************************************************************
  MPLAB Harmony Application Source File
  
  Company:
    Microchip Technology Inc.
  
  File Name:
    app.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It 
    implements the logic of the application's state machine and it may call 
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2013-2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
 *******************************************************************************/
// DOM-IGNORE-END


// *****************************************************************************
// *****************************************************************************
// Section: Included Files 
// *****************************************************************************
// *****************************************************************************
#include "app.h"
// --------------- Inclusions standard ---------------
#include <stdint.h>              // Types entiers (uint8_t, etc.)

// --------------- Inclusions Harmony ---------------
#include "system_config.h"       // Configuration du syst�me (Harmony)
#include "system_definitions.h"  // D�finitions du syst�me (Harmony)
#include "bsp.h"                 // Board Support Package Harmony

// --------------- Inclusions suppl�mentaires ---------------
// (�cran LCD, ADC, etc.)
#include "Mc32DriverLcd.h"       // Pilote pour �cran LCD
#include "Mc32DriverAdc.h"       // Pilote pour ADC
#include "peripheral/ports/plib_ports.h" //Gestion des ports
#include "gestPWM.h"            // gestion des pwm
#include "Mc32gest_RS232.h"
// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_Initialize function.
    
    Application strings and buffers are be defined outside this structure.
*/

APP_DATA appData;
S_pwmSettings pData;
S_pwmSettings PWMDataToSend; 

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************
/**
 * @brief Callback pour le Timer 1. G�re les actions p�riodiques de l'application.
 * @author LMS - VCO
 * @date 2025-01-02
 *
 * @details Cette fonction est appel�e � chaque interruption du Timer 1. Elle g�re
 *          un compteur pour les 3 premi�res secondes, met � jour l'�tat de l'application
 *          et ex�cute des t�ches sp�cifiques apr�s cette p�riode.
 */
void App_Timer1Callback()
{
    // Compteur pour les 3 premi�res secondes (approximation bas�e sur une p�riode du timer)
    static uint8_t threeSecondCounter = 0;

    // Pendant les 3 premi�res secondes
    if (threeSecondCounter < 149)
    {
        threeSecondCounter++; // Incr�mente le compteur
    }
    else
    {
        // Apr�s les 3 premi�res secondes, ex�cute les t�ches de service
        APP_UpdateState(APP_STATE_SERVICE_TASKS);
        
        // Clear le LCD
        ClearLcd();
    }
}

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************

/**
 * @brief Nettoie l'�cran LCD en effa�ant toutes ses lignes (1 � 4).
 * 
 * @author LMS- VCO
 * @date 2025-01-02
 *
 * @details
 * Cette fonction appelle successivement la routine `lcd_ClearLine()` pour
 * chaque ligne de l'�cran (de la 1 � la 4), permettant ainsi de r�initialiser
 * compl�tement l'affichage avant d'y �crire de nouvelles informations.
 */
void ClearLcd()
{
    lcd_ClearLine(1);
    lcd_ClearLine(2);
    lcd_ClearLine(3);
    lcd_ClearLine(4);
}
/**
 * @brief Allume toutes les LEDs (actives bas).
 * @author LMS - VCO
 * @date 2025-01-02
 *
 * @details Cette fonction utilise les masques `LEDS_PORTA_MASK` et `LEDS_PORTB_MASK`
 *          pour forcer les broches correspondantes � l'�tat bas (0), allumant ainsi
 *          les LEDs connect�es.
 */
void TurnOnAllLEDs(void) {
    // Allumer les LEDs sur PORTA et PORTB
    PLIB_PORTS_Write(PORTS_ID_0, PORT_CHANNEL_A, 
                     PLIB_PORTS_Read(PORTS_ID_0, PORT_CHANNEL_A) & ~LEDS_PORTA_MASK);
    PLIB_PORTS_Write(PORTS_ID_0, PORT_CHANNEL_B, 
                     PLIB_PORTS_Read(PORTS_ID_0, PORT_CHANNEL_B) & ~LEDS_PORTB_MASK);
}

/**
 * @brief �teint toutes les LEDs (actives bas).
 * @author LMS - VCO
 * @date 2025-01-02
 *
 * @details Cette fonction utilise les masques `LEDS_PORTA_MASK` et `LEDS_PORTB_MASK`
 *          pour forcer les broches correspondantes � l'�tat haut (1), �teignant ainsi
 *          les LEDs connect�es.
 */
void TurnOffAllLEDs(void) {
    // �teindre les LEDs sur PORTA et PORTB
    PLIB_PORTS_Write(PORTS_ID_0, PORT_CHANNEL_A, 
                     PLIB_PORTS_Read(PORTS_ID_0, PORT_CHANNEL_A) | LEDS_PORTA_MASK);
    PLIB_PORTS_Write(PORTS_ID_0, PORT_CHANNEL_B, 
                     PLIB_PORTS_Read(PORTS_ID_0, PORT_CHANNEL_B) | LEDS_PORTB_MASK);
}

// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_Initialize ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    appData.state = APP_STATE_INIT;
}


/******************************************************************************
  Fonction:
    void APP_Tasks ( void )

  Remarque:
    Voir le prototype dans app.h.
 */

void APP_Tasks ( void )
{
    /* V�rifie l'�tat actuel de l'application. */
    switch ( appData.state )
    {
        /* �tat initial de l'application */
        case APP_STATE_INIT:
        {
            static uint8_t firstInit = 1; // Assure une initialisation unique
            if (firstInit == 1)
            {
                firstInit = 0; // Emp�che la r�initialisation multiple

                // Initialisation de l'affichage LCD et affichage du texte d'introduction
                lcd_init(); 
                lcd_bl_on(); // Active le r�tro�clairage de l'�cran
                lcd_gotoxy(1, 1); 
                printf_lcd("Local Setting"); // Affichage du titre
                lcd_gotoxy(1, 2); 
                printf_lcd("TP2 PWM%UART 2025"); // Informations sur le projet
                lcd_gotoxy(1, 3); 
                printf_lcd("Besson Nicolas"); // Nom de l'auteur
                lcd_gotoxy(1, 4); 
                printf_lcd("Vitor Coelho"); // Nom du second auteur           

                // Initialisation des param�tres PWM
                GPWM_Initialize(&pData); 

                // Initialisation du module ADC
                BSP_InitADC10(); 

                // Initialisation du module UART pour la communication s�rie
                DRV_USART0_Initialize();
                InitFifoComm();

                // �teint tous les LED au d�marrage
                TurnOffAllLEDs();
            }
            break; 
        }

        /* �tat d'attente */
        case APP_STATE_WAIT:
        {
            // �tat interm�diaire, en attente d'�v�nements ou d'instructions
            break;
        }

        /* �tat d'ex�cution des t�ches */
        case APP_STATE_SERVICE_TASKS:
        {
            static uint8_t CommStatus = 0; // Indique le mode de communication (local ou distant)
            static int8_t inter = 0; // Compteur d'it�rations

            // R�cup�ration des param�tres de communication
            CommStatus = GetMessage(&pData);

            if (CommStatus == 0) // Mode local
            {
                GPWM_GetSettings(&pData); // R�cup�re les param�tres locaux
            } 
            else // Mode distant
            {
                GPWM_GetSettings(&PWMDataToSend); // R�cup�re les param�tres pour transmission
            }

            // Affichage des param�tres sur l'�cran LCD
            GPWM_DispSettings(&pData, CommStatus);

            // Ex�cution du contr�le PWM et du moteur en fonction des param�tres r�cup�r�s
            GPWM_ExecPWM(&pData);

            if (inter == 5) // Envoie des donn�es toutes les 5 it�rations
            {
                // Transmission des donn�es via RS232
                if (CommStatus == 0) 
                {
                    SendMessage(&pData); // Envoi des param�tres locaux
                } 
                else 
                {
                    SendMessage(&PWMDataToSend); // Envoi des param�tres distants
                }
                inter = 0; // R�initialisation du compteur
            } 
            else 
            {
                inter++; // Incr�mentation du compteur
            }

            // Retour � l'�tat d'attente apr�s traitement des t�ches
            appData.state = APP_STATE_WAIT;
            break; 
        }

        /* �tat par d�faut - ne devrait jamais �tre ex�cut� */
        default:
        {
            /* Gestion d'erreur en cas d'�tat invalide */
            break;
        }
    }
}



/**
 * @brief Met � jour l'�tat actuel de l'application.
 * @author LMS - VCO
 * @date 2025-01-02
 * 
 * @param Newstate Nouveau �tat � affecter � l'application (type APP_STATES).
 * 
 * @details Cette fonction met � jour la variable globale `appData.state` avec
 *          la valeur de l'�tat fourni en param�tre.
 */
void APP_UpdateState(APP_STATES Newstate)
{
    // Met � jour l'�tat de l'application avec le nouvel �tat sp�cifi�
    appData.state = Newstate;
}

/*******************************************************************************
 End of File
 */
