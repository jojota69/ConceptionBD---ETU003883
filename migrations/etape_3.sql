CREATE TABLE commandes (
    id_commande INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    daty DATE
);

CREATE TABLE detail_commande (
    id_detail INT GENERATED ALWAYS AS IDENTITY,
    id_commande INT,
    id_plat INT,
    quantite INT,

    CONSTRAINT pk_detail_commande
        PRIMARY KEY (id_commande, id_plat),

    CONSTRAINT fk_detail_commande
        FOREIGN KEY (id_commande) REFERENCES commandes(id_commande),

    CONSTRAINT fk_detail_plat
        FOREIGN KEY (id_plat) REFERENCES plats(id_plat)
);


INSERT INTO commandes (daty) VALUES
('2024-01-15'),
('2024-02-20'),
('2024-03-25');

INSERT INTO detail_commande (id_commande, id_plat, quantite) VALUES 
(1, 1, 2),
(1, 2, 1),
(2, 1, 1),
(2, 3, 2),
(3, 2, 3),
(3, 4, 1);


-- Je place la quantite dans une table detail_commande car une commande peut avoir plusieurs 
-- plats.