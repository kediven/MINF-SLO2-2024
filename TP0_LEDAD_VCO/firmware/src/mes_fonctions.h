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
void Initialisation (void);
void AffichageLCD ();
void AllumerLEDS(void);
void EteindreLEDS(void);
void Chenillard(void);

//Constantes numériques
#define VRAI 1 
#define FAUX 0
#defien NBLEDS 8


#ifdef	__cplusplus
}
#endif

#endif
