## Etape 1

PLATS(**id_plat**, nom, categorie?, prix?) (nouveau)

## Etape 2

PLATS(**id_plat**, nom, #id_categorie, prix?) (modifié)
CATEGORIE(**id_categorie**, nom) (nouveau)

## Etape 3

COMMANDES(**id_commande**, daty) (nouveau)
DETAIL_COMMANDE(**#id_commande, #id_plat**, id_detail, quantite) (nouveau)

## ETAPE 4

COMMANDES(**id_commande**, #id_client, daty) (modifié)
CLIENTS(**id_client**, nom, telephone) (nouveau)

