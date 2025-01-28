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
#include "system_config.h"       // Configuration du système (Harmony)
#include "system_definitions.h"  // Définitions du système (Harmony)
#include "bsp.h"                 // Board Support Package Harmony

// --------------- Inclusions supplémentaires ---------------
// (Écran LCD, ADC, etc.)
#include "Mc32DriverLcd.h"       // Pilote pour écran LCD
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
 * @brief Callback pour le Timer 1. Gère les actions périodiques de l'application.
 * @author LMS - VCO
 * @date 2025-01-02
 *
 * @details Cette fonction est appelée à chaque interruption du Timer 1. Elle gère
 *          un compteur pour les 3 premières secondes, met à jour l'état de l'application
 *          et exécute des tâches spécifiques après cette période.
 */
void App_Timer1Callback()
{
    // Compteur pour les 3 premières secondes (approximation basée sur une période du timer)
    static uint8_t threeSecondCounter = 0;

    // Pendant les 3 premières secondes
    if (threeSecondCounter < 149)
    {
        threeSecondCounter++; // Incrémente le compteur
    }
    else
    {
        // Après les 3 premières secondes, exécute les tâches de service
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
 * @brief Nettoie l'écran LCD en effaçant toutes ses lignes (1 à 4).
 * 
 * @author LMS- VCO
 * @date 2025-01-02
 *
 * @details
 * Cette fonction appelle successivement la routine `lcd_ClearLine()` pour
 * chaque ligne de l'écran (de la 1 à la 4), permettant ainsi de réinitialiser
 * complètement l'affichage avant d'y écrire de nouvelles informations.
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
 *          pour forcer les broches correspondantes à l'état bas (0), allumant ainsi
 *          les LEDs connectées.
 */
void TurnOnAllLEDs(void) {
    // Allumer les LEDs sur PORTA et PORTB
    PLIB_PORTS_Write(PORTS_ID_0, PORT_CHANNEL_A, 
                     PLIB_PORTS_Read(PORTS_ID_0, PORT_CHANNEL_A) & ~LEDS_PORTA_MASK);
    PLIB_PORTS_Write(PORTS_ID_0, PORT_CHANNEL_B, 
                     PLIB_PORTS_Read(PORTS_ID_0, PORT_CHANNEL_B) & ~LEDS_PORTB_MASK);
}

/**
 * @brief Éteint toutes les LEDs (actives bas).
 * @author LMS - VCO
 * @date 2025-01-02
 *
 * @details Cette fonction utilise les masques `LEDS_PORTA_MASK` et `LEDS_PORTB_MASK`
 *          pour forcer les broches correspondantes à l'état haut (1), éteignant ainsi
 *          les LEDs connectées.
 */
void TurnOffAllLEDs(void) {
    // Éteindre les LEDs sur PORTA et PORTB
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
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Tasks ( void )
{
    /* Check the application's current state. */
    switch ( appData.state )
    {
        /* Initial application state */
        case APP_STATE_INIT:
        {
            static uint8_t firstInit = 1; // Ensure one-time initialization
            if (firstInit == 1)
            {
                firstInit = 0; // Prevent reinitialization

                // Initialize LCD and display introduction
                lcd_init(); 
                lcd_bl_on(); 
                lcd_gotoxy(1, 1); 
                printf_lcd("Local Setting"); 
                lcd_gotoxy(1, 2); 
                printf_lcd("TP2 PWM%UART 2025"); 
                lcd_gotoxy(1, 3); 
                printf_lcd("Besson Nicolas"); 
                lcd_gotoxy(1, 4); 
                printf_lcd("Vitor Coelho");           

                // Initialize PWM settings
                GPWM_Initialize(&pData); 

                // Initialize ADC
                BSP_InitADC10(); 
                DRV_USART0_Initialize();
                InitFifoComm();

                // Turn off all LEDs initially
                TurnOffAllLEDs();
            }
            break; 
        }

        /* Waiting state */
        case APP_STATE_WAIT:
        {
            // Transition logic or placeholder
            break;
        }

        /* Service tasks state */
        case APP_STATE_SERVICE_TASKS:
        {
            static uint8_t CommStatus = 0;
            static int8_t inter = 0;

            // Receive communication parameters
            CommStatus = GetMessage(&pData);

            if (CommStatus == 0) // Local mode
            {
                GPWM_GetSettings(&pData); // Retrieve local settings
            } 
            else // Remote mode
            {
                GPWM_GetSettings(&PWMDataToSend); // Retrieve remote settings
            }

            // Display parameters on LCD
            GPWM_DispSettings(&pData, CommStatus);

            // Execute PWM and motor control based on retrieved settings
            GPWM_ExecPWM(&pData);

            if (inter == 5) 
            {
                // Send data via RS232
                if (CommStatus == 0) 
                {
                    SendMessage(&pData); // Send local settings
                } 
                else 
                {
                    SendMessage(&PWMDataToSend); // Send remote settings
                }
                inter = 0;
            } 
            else 
            {
                inter++;
            }

            // Transition back to wait state
            appData.state = APP_STATE_WAIT;
            break; 
        }

        /* Default state - should never be executed */
        default:
        {
            /* Error handling for invalid state */
            break;
        }
    }
}


/**
 * @brief Met à jour l'état actuel de l'application.
 * @author LMS - VCO
 * @date 2025-01-02
 * 
 * @param Newstate Nouveau état à affecter à l'application (type APP_STATES).
 * 
 * @details Cette fonction met à jour la variable globale `appData.state` avec
 *          la valeur de l'état fourni en paramètre.
 */
void APP_UpdateState(APP_STATES Newstate)
{
    // Met à jour l'état de l'application avec le nouvel état spécifié
    appData.state = Newstate;
}

/*******************************************************************************
 End of File
 */
