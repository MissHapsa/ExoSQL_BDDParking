-- insertion du 1er client du parking via la requête SQL

INSERT INTO 
`tab_clients` (`idClient`, `nomClient`, `prenomClient`, `statutClient`, `nfcClient`, `plaqueClient`, `dateAbonnementclient`) 
VALUES 
(NULL, 'LOUSISSARD', 'Joel', 'p', '1805', 'AA123AA', CURRENT_TIMESTAMP);

-- insertion du 2eme client du parking via la requête SQL
INSERT INTO
`tab_clients` (`idClient`, `nomClient`, `prenomClient`, `statutClient`, `nfcClient`, `plaqueClient`, `dateAbonnementclient`)
VALUES
(NULL, 'BERNARD', 'Louise', 'p', '1135', 'CC456AA', CURRENT_TIMESTAMP);

-- insertion du 3eme client du parking via la requête SQL
INSERT INTO
`tab_clients` (`idClient`, `nomClient`, `prenomClient`, `statutClient`, `nfcClient`, `plaqueClient`, `dateAbonnementclient`)
VALUES
(NULL, 'BONNET', 'Jean', 'p', '0823', 'GB112KK', CURRENT_TIMESTAMP);

-- insertion du 4eme client du parking via la requête SQL
INSERT INTO
`tab_clients` (`idClient`, `nomClient`, `prenomClient`, `statutClient`, `nfcClient`, `plaqueClient`, `dateAbonnementclient`)
VALUES
(NULL, 'MARTIN', 'Simon', 'p', '4515', 'BH413AA', CURRENT_TIMESTAMP);

-- insertion du 5eme au 10eme client du parking via une seule requête SQL 
INSERT INTO
`tab_clients` (`idClient`, `nomClient`, `prenomClient`, `statutClient`, `nfcClient`, `plaqueClient`, `dateAbonnementclient`)
VALUES
(NULL, 'MAGOT', 'Sylvain', 'p', '1620', 'AC123CA', CURRENT_TIMESTAMP), 
(NULL, 'TREB', 'Louisa', 'p', '1245', 'CC098GH', CURRENT_TIMESTAMP),
(NULL, 'SIMON', 'William', 'p', '1930', 'GD678VK', CURRENT_TIMESTAMP),
(NULL, 'BOURGEOIS', 'Fabien', 'p', '2045', 'LM654FD', CURRENT_TIMESTAMP),
(NULL, 'CLAUSS', 'Moise', 'p', '1200', 'SX078BN', CURRENT_TIMESTAMP),
(NULL, 'BELLALO', 'Louis', 'p', '0730', 'ZE234HK', CURRENT_TIMESTAMP),
(NULL, 'BRUNNET', 'Jeanne','p', '0845', 'AC687AA', CURRENT_TIMESTAMP);

-- creation de la table des places du parking
CREATE TABLE `tab_acces` (
    `idAcces` INT NOT NULL AUTO_INCREMENT,
    `plaqueCamera` VARCHAR(20) NOT NULL,
    `nomCamera` VARCHAR(20) NOT NULL,
   `dateEntree` DATETIME NOT NULL,
   `dateSortie` DATETIME NOT NULL,
   `heureEntree` TIME NOT NULL,
   `heureSortie` TIME NOT NULL,
   `autorisation` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`idAcces`),
    CONSTRAINT `fk_places_clients` FOREIGN KEY (`nomCamera`) REFERENCES `tab_clients` (`idClient`)
    ON DELETE CASCADE ON UPDATE CASCADE);

    -- CREATE TABLE utilisateur
-- (
-- id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
-- nom VARCHAR(100),
-- prenom VARCHAR(100),
-- email VARCHAR(255),
-- dateNaissance DATE,
-- adresse VARCHAR(255),
-- pays VARCHAR(255),
-- ville VARCHAR(255),
-- codePostal VARCHAR(5)
-- )

    -- insertion d autorisation de la place du parking via la requête SQL
    INSERT INTO
    `tab_acces` (`idAcces`, `plaqueCamera`, `nomCamera`, `dateEntree`, `dateSortie`,`heureEntree`, `heureSortie`, `autorisation`)
    VALUES
    (NULL, 'AA123AA', '1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
    (NULL, 'CC456AA', '2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
    (NULL, 'GB112KK', '3', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
    (NULL, 'BH413AA', '4', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI');

-- demander le nom des 4 derniers clients a voir acceder au parking
SELECT nomClient, prenomClient, dateEntree, dateSortie, heureEntree, heureSortie, autorisation
FROM tab_acces
INNER JOIN tab_clients
ON tab_acces.nomCamera = tab_clients.idClient
ORDER BY dateEntree DESC
LIMIT 4;

-- entrer des personnes qui n'ont pas autorisation dans le parking

INSERT INTO
`tab_acces` (`idAcces`, `plaqueCamera`, `nomCamera`, `dateEntree`, `dateSortie`,`heureEntree`, `heureSortie`, `autorisation`)
VALUES
(NULL, 'AC123CA', '5', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'CC098GH', '6', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'GD678VK', '7', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'LM654FD', '8', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'SX078BN', '9', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'ZE234HK', '10', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'AC687AA', '11', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON');

-- entrer 30 entrees de personnes dans le parking, 16 sorties et 12 entrées non autorisées de maniere aleatoire
INSERT INTO
`tab_acces` (`idAcces`, `plaqueCamera`, `nomCamera`, `dateEntree`, `dateSortie`,`heureEntree`, `heureSortie`, `autorisation`)
VALUES
(NULL, 'AA123AA', '1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
(NULL, 'CC456AA', '2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),   
(NULL, 'GB112KK', '3', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00' , '00:00:00', 'OUI'),
(NULL, 'BH413AA', '4', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
(NULL, 'AC123CA', '5', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'CC098GH', '6', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'GD678VK', '7', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'LM654FD', '8', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'SX078BN', '9', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'ZE234HK', '10', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'AC687AA', '11', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'AA123AA', '1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
(NULL, 'CC456AA', '2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
(NULL, 'GB112KK', '3', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
(NULL, 'BH413AA', '4', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
(NULL, 'AC123CA', '5', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'CC098GH', '6', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'GD678VK', '7', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'LM654FD', '8', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'SX078BN', '9', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'ZE234HK', '10', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'AC687AA', '11', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'AA123AA', '1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
(NULL, 'CC456AA', '2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
(NULL, 'GB112KK', '3', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
(NULL, 'BH413AA', '4', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
(NULL, 'AC123CA', '5', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'CC098GH', '6', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'GD678VK', '7', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'LM654FD', '8', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'SX078BN', '9', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'ZE234HK', '10', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'AC687AA', '11', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'AA123AA', '1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
(NULL, 'CC456AA', '2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
(NULL, 'GB112KK', '3', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
(NULL, 'BH413AA', '4', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
(NULL, 'AC123CA', '5', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'CC098GH', '6', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'GD678VK', '7', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'LM654FD', '8', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'SX078BN', '9', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'ZE234HK', '10', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'AC687AA', '11', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'AA123AA', '1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
(NULL, 'CC456AA', '2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
(NULL, 'GB112KK', '3', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
(NULL, 'BH413AA', '4', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'OUI'),
(NULL, 'AC123CA', '5', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'CC098GH', '6', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'GD678VK', '7', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'LM654FD', '8', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'SX078BN', '9', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON'),
(NULL, 'ZE234HK', '10', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:00:00', '00:00:00', 'NON');

-- une requete pour savoir le nombre d acces au parking refusés
SELECT COUNT(*) FROM tab_acces WHERE autorisation = 'NON';

-- une requete pour savoir le nombre d acces au parking autorisés
SELECT COUNT(*) FROM tab_acces WHERE autorisation = 'OUI';

-- une requete pour savoir le nombre d acces au parking total
SELECT COUNT(*) FROM tab_acces;

-- une requete pour savoir le nombre d acces au parking par jour
SELECT COUNT(*) FROM tab_acces WHERE dateEntree BETWEEN '2024-01-17 00:00:00' AND '2024-01-19 00:00:00';

-- une requete pour savoir le nombre d acces au parking par mois        
SELECT COUNT(*) FROM tab_acces WHERE dateEntree BETWEEN '2020-01-01 00:00:00' AND '2020-01-31 23:59:59';

-- une requete pour savoir le nombre d acces au parking par année
SELECT COUNT(*) FROM tab_acces WHERE dateEntree BETWEEN '2020-01-01 00:00:00' AND '2024-12-31 23:59:59';

-- une requete pour savoir le nombre d acces au parking par heure
SELECT COUNT(*) FROM tab_acces WHERE dateEntree BETWEEN '2020-01-01 00:00:00' AND '2024-12-31 23:59:59';

-- une jointure pour lier les tables
SELECT * FROM tab_acces INNER JOIN tab_clients ON tab_acces.plaqueCamera = tab_clients.plaqueClient;    

