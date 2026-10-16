-- Etape 1
-- Afficher les plats du plus cher au moins cher
SELECT * FROM plats ORDER BY prix DESC;

-- Etape 2
-- Nombre de plats par categorie
SELECT c.nom, COUNT(p.idCategorie) AS nombre
FROM categorie AS c
JOIN plats AS p ON c.idCategorie = p.idCategorie
GROUP BY c.idCategorie, c.nom;


