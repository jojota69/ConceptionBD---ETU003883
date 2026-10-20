CREATE TABLE clients (
    id_user INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom VARCHAR(100),
    telephone VARCHAR(100) --pour les differencier
);

ALTER TABLE commandes ADD COLUMN id_client INT;

ALTER TABLE commandes 
ADD CONSTRAINT fk_commandes_client 
FOREIGN KEY (id_client) REFERENCES clients(id_user);

INSERT INTO clients (nom, telephone)
VALUES
('Rasoa', '0341234567'),
('Rakoto', '0329876543'),
('Rabe', '0334567890');

UPDATE commandes 
SET id_client = CASE
    WHEN id_commande = 1 THEN 1
    WHEN id_commande = 2 THEN 2
    WHEN id_commande = 3 THEN 3
    ELSE NULL
END;

INSERT INTO commandes (id_client, daty) VALUES
(null, '2024-01-15'),
(null, '2024-02-20'),
(2, '2024-03-25'),
(3, '2024-03-25'),
(2, '2024-03-25'),
(null, '2024-03-25');
