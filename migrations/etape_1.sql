CREATE TABLE plats(
    id_plat INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    categorie VARCHAR(100),
    prix INT    
);

INSERT INTO plats (nom, categorie, prix) VALUES
('Romazava', 'Plat malagasy', 7000),
('Ravitoto sy henakisoa', 'Plat malagasy', 8000),
('Akoho sy voanio', 'Plat malagasy', 8500),
('Mi sao', 'Plat chinois', 6000),
('Soupe chinoise', 'Soupe', 5000),
('Mofo gase (les 4)', 'Dessert et goûter', 1000),
('Ranon''ampango', 'Boisson', 500);

-- Piege
-- Je choisis INT pour le type du prix car les prix sont toujours arrondis en ariary
-- Je choisis id_plat pour l'identifiant unique de chaque plat