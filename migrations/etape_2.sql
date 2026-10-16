CREATE TABLE categorie (
    id_categorie INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

ALTER TABLE plats RENAME COLUMN categorie TO id_categorie;

INSERT INTO categorie (nom) VALUES
('Plats Malagasy'),
('Plats Chinois'),
('Soupes'),
('Desserts'),
('Boissons');

UPDATE plats 
SET id_categorie = CASE
    WHEN id_categorie = 'Plat malagasy' THEN '1'
    WHEN id_categorie = 'Plat chinois' THEN '2'
    WHEN id_categorie = 'Soupe' THEN '3'
    WHEN id_categorie = 'Dessert et goûter' THEN '4'
    WHEN id_categorie = 'Boisson' THEN '5'
    ELSE id_categorie
END;

ALTER TABLE plats ALTER COLUMN id_categorie TYPE INT USING id_categorie::INT;
ALTER TABLE plats ALTER COLUMN id_categorie SET NOT NULL;
ALTER TABLE plats ADD CONSTRAINT fk_plats_categorie FOREIGN KEY (id_categorie) REFERENCES categorie(id_categorie);


-- On ne me pas simplement categorie VARCHAR(100) dans plats car il peut y
-- avoir des erreurs de syntaxes pour un meme categorie, ce qui conduirait a 3 differents categories mais meme noms.
-- Ex: un plat peut etre "plat malagasy", un autre "Plat malagasy", ou bien aussi "plats Malagasy"
