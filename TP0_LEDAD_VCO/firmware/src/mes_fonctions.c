/******************************************************************************* 
 * Nom du Projet       : [TP0]
 * Nom du Fichier      : [mesfonctions].c
 * Auteur              : [Vitor Coelho]
 * Date de Cr�ation    : [19.11.2024]]
 * Version             : [0.0]
 *******************************************************************************/

#include "mes_fonctions.h"
APP_DATA appData;


/* 
Fonction :
void EteindreLEDS(void)

Description :
Cette fonction �teint chaque LED individuellement en appelant la fonction
BSP_LEDOff avec l'identifiant de chaque LED (de BSP_LED_0 � BSP_LED_7).
Elle peut �tre utilis�e pour mettre tous les indicateurs lumineux dans un
�tat �teint.
 */
void EteindreLEDS(void)
{
    BSP_LEDOff(BSP_LED_0);
    BSP_LEDOff(BSP_LED_1);
    BSP_LEDOff(BSP_LED_2);
    BSP_LEDOff(BSP_LED_3);
    BSP_LEDOff(BSP_LED_4);
    BSP_LEDOff(BSP_LED_5);
    BSP_LEDOff(BSP_LED_6);
    BSP_LEDOff(BSP_LED_7);
}

/* 
Fonction :
void AllumerLEDS(void)
Description :
Cette fonction active chaque LED de la carte en appelant la fonction
BSP_LEDOn avec l'identifiant de chaque LED (de BSP_LED_0 � BSP_LED_7).
*/
void AllumerLEDS(void)
{
    BSP_LEDOn(BSP_LED_0);
    BSP_LEDOn(BSP_LED_1);
    BSP_LEDOn(BSP_LED_2);
    BSP_LEDOn(BSP_LED_3);
    BSP_LEDOn(BSP_LED_4);
    BSP_LEDOn(BSP_LED_5);
    BSP_LEDOn(BSP_LED_6);
    BSP_LEDOn(BSP_LED_7);
}

/*
 Fonction :
 void Chenillard(void)

 Description :
 Cette fonction impl�mente un effet de chenillard en faisant d�filer
 l'allumage des LED sur la carte. Elle utilise deux compteurs statiques,
 compteurLed et compteurEteint, pour g�rer l'�tat du chenillard. Les LED
 sont allum�es une � une dans l'ordre, puis �teintes simultan�ment avant
 de recommencer le cycle.
*/
void Chenillard(void)
{
    static uint8_t current_led = 0;
    static uint8_t compteurEteint = 0;

    if (compteurEteint == 0)
    {
        EteindreLEDS(); // �teint toutes les LEDs
        compteurEteint++;
    }

    // Tableau contenant les LEDs dans l'ordre
    BSP_LED leds[] = {
        BSP_LED_0,
        BSP_LED_1,
        BSP_LED_2,
        BSP_LED_3,
        BSP_LED_4,
        BSP_LED_5,
        BSP_LED_6,
        BSP_LED_7
    };

    // �teindre la LED pr�c�dente
    BSP_LEDOff(leds[(current_led == 0 ? 7 : current_led - 1)]);

    // Allumer la LED actuelle
    BSP_LEDOn(leds[current_led]);

    // Passer � la LED suivante
    current_led = (current_led + 1) % 8; // Cycle entre 0 et 7
}

/* 
 Fonction :
 void initPeriph(void)

 Description :
 Cette fonction initialise les p�riph�riques n�cessaires pour le projet.
 Elle utilise les fonctions sp�cifiques � l'�cran LCD (lcd_init,
 lcd_gotoxy, printf_lcd, lcd_bl_on) pour afficher des informations
 d'identification et active le bloc d'ADC (convertisseur analogique-num�rique)
 avec la fonction BSP_InitADC10.
*/
void Initialisation (void)
{
            lcd_init();
            lcd_gotoxy(1,1);
            printf_lcd("Tp0 Led+AD 2024");
            lcd_gotoxy(1,2);
            printf_lcd("Vitor Coelho");
            lcd_bl_on();
            BSP_InitADC10();
}
/*
 Fonction :
 void lectureEtAffichageADC(void)

 Description :
 Cette fonction lit les valeurs ADC pour les canaux 0 et 1 � l'aide de
 la fonction BSP_ReadAllADC. Elle affiche ensuite ces valeurs sur l'�cran
 LCD � des positions sp�cifiques � l'aide des fonctions lcd_gotoxy et
 printf_lcd.
*/

void AffichageLCD (void)  
{
            appData.AdcRes = BSP_ReadAllADC();
            lcd_gotoxy(1,3);
            printf_lcd("Ch0: %4d", appData.AdcRes.Chan0);
            lcd_gotoxy(11,3);
            printf_lcd("Ch1: %4d", appData.AdcRes.Chan1);
}

