-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 18 nov. 2024 à 00:27
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `project`
--

-- --------------------------------------------------------

--
-- Structure de la table `useraccounts`
--

CREATE TABLE `useraccounts` (
  `id_client` mediumint(9) NOT NULL,
  `nom` char(40) NOT NULL,
  `prenom` char(40) NOT NULL,
  `email` char(40) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `useraccounts`
--

INSERT INTO `useraccounts` (`id_client`, `nom`, `prenom`, `email`, `password`) VALUES
(2, 'Fathi', 'Mohamed', 'fathimohamed93400@gmail.com', 'scrypt:32768:8:1$RhAMYgiqkQUtfj42$bed428627332c56c2a3e61ce38c2d2e6568e825daf663234e8188882bc1f04effd21698ea2de5201fe8d04c24945302601967ebac179c76043077c5e1d8c6023'),
(3, 'pelies', 'lafraude', 'peliesbabinks@gmail.com', 'scrypt:32768:8:1$9X1DMiTCdnnRbFde$a50bfbaef8fb1c0b3ba0a001a7f001d2bf0e2ddc186ed2e3b9400aa6db9c533de338820a5edb7cafe6711e19f521cf50ab884a3be053644bd70249341df8259f');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `useraccounts`
--
ALTER TABLE `useraccounts`
  ADD PRIMARY KEY (`id_client`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `useraccounts`
--
ALTER TABLE `useraccounts`
  MODIFY `id_client` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
