/******************************************************************************* 
 * Nom du Projet       : [TP0]
 * Nom du Fichier      : [mesfonctions].h
 * Auteur              : [Vitor Coelho]
 * Date de Création    : [19.11.2024]]
 * Version             : [0.0]
 *******************************************************************************/

#ifndef MES_FONCTIONS_H
#define	MES_FONCTIONS_H

#include "app.h"

//Prototype des fonctions utilisées  
/**
 * @brief Initialise les périphériques et affiche le message de bienvenue.
 * 
 * Cette fonction initialise l'écran LCD, le rétroéclairage, les LEDs,
 * et le convertisseur ADC. Elle affiche un message sur l'écran LCD.
 */
void Initialisation(void);

/**
 * @brief Affiche les valeurs des ADC sur l'écran LCD.
 * 
 * Cette fonction lit les valeurs des deux canaux ADC et les affiche
 * sur la troisième ligne de l'écran LCD.
 */
void AffichageLCD(void);

/**
 * @brief Allume toutes les LEDs connectées.
 * 
 * Cette fonction active toutes les LEDs du kit en utilisant les fonctions
 * BSP correspondantes.
 */
void AllumerLEDS(void);

/**
 * @brief Éteint toutes les LEDs connectées.
 * 
 * Cette fonction désactive toutes les LEDs du kit en utilisant les fonctions
 * BSP correspondantes.
 */
void EteindreLEDS(void);

/**
 * @brief Implémente l'effet chenillard sur les LEDs.
 * 
 * Cette fonction allume une seule LED à la fois, dans un ordre cyclique,
 * pour créer un effet visuel de chenillard.
 */
void Chenillard(void);

//Constantes numériques
#define VRAI 1 
#define FAUX 0
#defien NBLEDS 8


#ifdef	__cplusplus
}
#endif

#endif
