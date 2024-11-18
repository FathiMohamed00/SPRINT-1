/* Création de la base de données "sae23" */
CREATE DATABASE `project`;
USE `project`;

/* Création de la table client */
CREATE TABLE IF NOT EXISTS `project`.`UserAccounts` (
  `id_client` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `nom` CHAR(40) NOT NULL,
  `mail` CHAR(40) NOT NULL,
  'password' CHAR(20) NOT NULL,
  PRIMARY KEY (`id_client`)
);

/* Insertion de données dans la table Users */
INSERT INTO `project`.`UserAccounts` (`id_client`, `nom`, `mail`, `password`)
VALUES
  (NULL, 'Arezki', 'dias@gmail.com', 'V1trygtr*');
