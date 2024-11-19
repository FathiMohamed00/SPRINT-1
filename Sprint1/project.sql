-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 19 nov. 2024 à 16:57
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
  `id` mediumint(9) NOT NULL,
  `nom` char(40) NOT NULL,
  `prenom` char(40) NOT NULL,
  `email` char(40) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `useraccounts`
--

INSERT INTO `useraccounts` (`id`, `nom`, `prenom`, `email`, `password`) VALUES
(3, 'pelies', 'lafraude', 'peliesbabinks@gmail.com', 'scrypt:32768:8:1$9X1DMiTCdnnRbFde$a50bfbaef8fb1c0b3ba0a001a7f001d2bf0e2ddc186ed2e3b9400aa6db9c533de338820a5edb7cafe6711e19f521cf50ab884a3be053644bd70249341df8259f'),
(5, 'Fathi', 'Mohamed', 'fathimohamed93400@gmail.com', 'scrypt:32768:8:1$39LXQoorwNnVVsq5$a9681a167d1a85b172318a268ad2122795d75f40eac7f25aefc8bd3a4d76200c8db49ef437184fce8e8b4923aabb6b87a2b49431420c44ae25ad08745dbd783b'),
(6, 'Bamba', 'Ted', 'tedbabinksdu13@gmail.com', 'scrypt:32768:8:1$ZDWfSgz3AcYVdNHa$98760166608334601a1c46fa4e9c8293ec0423eb5646d8045feb875140b87fd2b2e74b8e2f4bc7efc655a53d83084d80d836493a644a3e268e59e80705b2662e'),
(7, 'babinks', 'ravus', 'ravusbabinks@gmail.com', 'scrypt:32768:8:1$fcmZySmWv7FWOSNv$66ba2953e75364b4ad566791dd05dda2ae535cc3e918b0d0987417bde68f3df8188bd3131b562413d2c2dc87a02fb49f6b04e9fbe9ae6682b2489d07b0b1316b');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `useraccounts`
--
ALTER TABLE `useraccounts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `useraccounts`
--
ALTER TABLE `useraccounts`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
