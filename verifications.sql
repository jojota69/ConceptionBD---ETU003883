-- Etape 1
-- Afficher les plats du plus cher au moins cher
SELECT * FROM plats ORDER BY prix DESC;

-- Etape 2
-- Nombre de plats par categorie
SELECT c.nom, COUNT(p.id_categorie) AS nombre
FROM categorie AS c
JOIN plats AS p ON c.id_categorie = p.id_categorie
GROUP BY c.id_categorie, c.nom;

-- Etape 3
-- Montant total de chaque commande

SELECT c.id_commande,
	   c.daty,
	   SUM(p.prix * dc.quantite) AS montant_total
FROM commandes AS c
JOIN detail_commande AS dc ON c.id_commande = dc.id_commande
JOIN plats AS p ON p.id_plat = dc.id_plat
GROUP BY c.id_commande, c.daty
ORDER BY c.id_commande;


-- Etape 4
-- Liste des commandes avec le nom du client , en affichant "client de passage" si il'y en a pas

SELECT C.id_commande, C.daty, COALESCE(cl.nom, 'client de passage') AS nom_client
FROM commandes AS C
LEFT JOIN clients AS cl ON C.id_client = cl.id_user
ORDER BY C.id_commande;	