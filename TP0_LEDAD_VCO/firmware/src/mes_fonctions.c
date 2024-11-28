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
 * Fonction : void EteindreLEDS(void)
 * Description :
 * Cette fonction �teint toutes les LEDs connect�es au microcontr�leur. 
 * Elle utilise la fonction `BSP_LEDOff` pour chaque LED individuelle.
 */
void EteindreLEDS(void)
{
    BSP_LEDOff(BSP_LED_0); // �teint la LED 0
    BSP_LEDOff(BSP_LED_1); // �teint la LED 1
    BSP_LEDOff(BSP_LED_2); // �teint la LED 2
    BSP_LEDOff(BSP_LED_3); // �teint la LED 3
    BSP_LEDOff(BSP_LED_4); // �teint la LED 4
    BSP_LEDOff(BSP_LED_5); // �teint la LED 5
    BSP_LEDOff(BSP_LED_6); // �teint la LED 6
    BSP_LEDOff(BSP_LED_7); // �teint la LED 7
}

/* 
 * Fonction : void AllumerLEDS(void)
 * Description :
 * Cette fonction allume toutes les LEDs connect�es au microcontr�leur. 
 * Elle utilise la fonction `BSP_LEDOn` pour chaque LED individuelle.
 */

void AllumerLEDS(void)
{
    BSP_LEDOn(BSP_LED_0); // Allume la LED 0
    BSP_LEDOn(BSP_LED_1); // Allume la LED 1
    BSP_LEDOn(BSP_LED_2); // Allume la LED 2
    BSP_LEDOn(BSP_LED_3); // Allume la LED 3
    BSP_LEDOn(BSP_LED_4); // Allume la LED 4
    BSP_LEDOn(BSP_LED_5); // Allume la LED 5
    BSP_LEDOn(BSP_LED_6); // Allume la LED 6
    BSP_LEDOn(BSP_LED_7); // Allume la LED 7
}

/* 
 * Fonction : void Initialisation(void)
 * Description :
 * Cette fonction initialise les p�riph�riques utilis�s dans le projet :
 * - L'�cran LCD pour l'affichage.
 * - Le r�tro�clairage de l'�cran.
 * - Le convertisseur (ADC).
 * Elle affiche �galement un message d'accueil sur le LCD.
 */

void Initialisation(void)
{
    lcd_init(); // Initialise l'�cran LCD
    lcd_gotoxy(1, 1); // Positionne le curseur � la ligne 1, colonne 1
    printf_lcd("TP0 Led+AD 2024"); // Affiche un titre sur la ligne 1
    lcd_gotoxy(1, 2); // Positionne le curseur � la ligne 2, colonne 1
    printf_lcd("Vitor Coelho"); // Affiche le nom de l'auteur sur la ligne 2
    lcd_bl_on(); // Active le r�tro�clairage de l'�cran LCD
    BSP_InitADC10(); // Initialise les convertisseurs ADC
}

/*
 Fonction :
 void Chenillard(void)

 Description :

*/
/*
 * Fonction : void Chenillard(void)
 * Description :
 * Cette fonction impl�mente un effet chenillard sur les LEDs.
 * Les LEDs s?allument et s?�teignent successivement dans un ordre cyclique de
 * LED0 � LED7
 */

void Chenillard(void)
{
    static uint8_t current_led = 0; // Compteur pour suivre quelle LED doit s'allumer

    // �teindre toutes les LEDs
    EteindreLEDS();

    // Utiliser un switch pour allumer une LED sp�cifique en fonction du compteur
    switch (current_led)
    {
        case 0:
            BSP_LEDOn(BSP_LED_0);
            break;
        case 1:
            BSP_LEDOn(BSP_LED_1);
            break;
        case 2:
            BSP_LEDOn(BSP_LED_2);
            break;
        case 3:
            BSP_LEDOn(BSP_LED_3);
            break;
        case 4:
            BSP_LEDOn(BSP_LED_4);
            break;
        case 5:
            BSP_LEDOn(BSP_LED_5);
            break;
        case 6:
            BSP_LEDOn(BSP_LED_6);
            break;
        case 7:
            BSP_LEDOn(BSP_LED_7);
            break;
    }

    // Passer � la LED suivante
    current_led++;

    // Revenir � la premi�re LED apr�s la derni�re
    if (current_led > 7)
    {
        current_led = 0;
    }
}

/*
 * Fonction : void AffichageLCD(void)
 * Description :
 * Cette fonction lit les valeurs des canaux ADC et les affiche sur l'�cran LCD.
 * Elle affiche deux valeurs (canaux 0 et 1) sur la ligne 3 du LCD.
 */
void AffichageLCD(void)
{
    appData.AdcRes = BSP_ReadAllADC(); // Lit toutes les valeurs des ADC
    lcd_gotoxy(1, 3); // Positionne le curseur � la ligne 3, colonne 1
    printf_lcd("Ch0: %4d", appData.AdcRes.Chan0); // Affiche la valeur du canal 0
    lcd_gotoxy(11, 3); // Positionne le curseur � la ligne 3, colonne 11
    printf_lcd("Ch1: %4d", appData.AdcRes.Chan1); // Affiche la valeur du canal 1
}

