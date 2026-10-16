CREATE TABLE categorie (
    idCategorie INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

ALTER TABLE plats RENAME COLUMN categorie TO idCategorie;

INSERT INTO categorie (nom) VALUES
('Plats Malagasy'),
('Plats Chinois'),
('Soupes'),
('Desserts'),
('Boissons');

UPDATE plats 
SET idCategorie = CASE
    WHEN idCategorie = 'Plat malagasy' THEN '1'
    WHEN idCategorie = 'Plat chinois' THEN '2'
    WHEN idCategorie = 'Soupe' THEN '3'
    WHEN idCategorie = 'Dessert et goûter' THEN '4'
    WHEN idCategorie = 'Boisson' THEN '5'
    ELSE idCategorie
END;

ALTER TABLE plats ALTER COLUMN idCategorie TYPE INT USING idCategorie::INT;
ALTER TABLE plats ALTER COLUMN idCategorie SET NOT NULL;
ALTER TABLE plats ADD CONSTRAINT fk_plats_categorie FOREIGN KEY (idCategorie) REFERENCES categorie(idCategorie);


-- On ne me pas simplement categorie VARCHAR(100) dans plats car il peut y
-- avoir des erreurs de syntaxes pour un meme categorie, ce qui conduirait a 3 differents categories mais meme noms.
-- Ex: un plat peut etre "plat malagasy", un autre "Plat malagasy", ou bien aussi "plats Malagasy"
