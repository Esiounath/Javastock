CREATE DATABASE IF NOT EXISTS `javastock`;
use `javastock`;
-- phpMyAdmin SQL Dump
-- version 5.1.4deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 29, 2023 at 12:38 PM
-- Server version: 8.0.32-0ubuntu0.22.10.2
-- PHP Version: 8.1.7-1ubuntu3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `javastock`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id_article` int NOT NULL,
  `type_epreuve` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coureur`
--

CREATE TABLE IF NOT EXISTS `coureur` (
  `id_coureur` int NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `adresse` varchar(200) DEFAULT NULL,
  `datenais` date DEFAULT NULL,
  `nationale` varchar(30) DEFAULT NULL,
  `sexe` int DEFAULT NULL,
  `numero` int NOT NULL,
  `email` varchar(180) DEFAULT NULL,
  `status` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `coureur`
--

INSERT INTO `coureur` (`id_coureur`, `nom`, `prenom`, `adresse`, `datenais`, `nationale`, `sexe`, `numero`, `email`, `status`) VALUES
(1, 'Siounath', 'Eden', '34 rue des pins', '1920-01-01', 'francais', 1, 659059577, 'eden.siounath@hotmail.com', 'A'),
(2, 'Eden', 'Siounath', '34 rue des pins', '1920-01-01', 'francais', 1, 659059577, 'eden.siounath@hotmail.com', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `denre_liquide`
--

CREATE TABLE IF NOT EXISTS `denre_liquide` (
  `id` int NOT NULL,
  `id_article` int NOT NULL,
  `volume` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `denre_solide`
--

CREATE TABLE IF NOT EXISTS `denre_solide` (
  `poids` int DEFAULT NULL,
  `id` int NOT NULL,
  `id_article` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `epreuve`
--

CREATE TABLE IF NOT EXISTS `epreuve` (
  `type_epreuve` varchar(50) DEFAULT NULL,
  `id_epreuve` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `historique`
--

CREATE TABLE IF NOT EXISTS `historique` (
  `log` varchar(150) DEFAULT NULL,
  `id_historique` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `repertorier`
--

CREATE TABLE IF NOT EXISTS `repertorier` (
  `log` varchar(100) NOT NULL,
  `id` int NOT NULL,
  `id_historique` int NOT NULL,
  `id_epreuve` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE IF NOT EXISTS `reservations` (
  `id_article` int NOT NULL,
  `id_epreuve` int NOT NULL,
  `id_coureur` int NOT NULL,
  `date_reservation` date DEFAULT NULL,
  `quantite` int DEFAULT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_shirt`
--

CREATE TABLE IF NOT EXISTS `t_shirt` (
  `taille` varchar(50) DEFAULT NULL,
  `couleur` varchar(50) DEFAULT NULL,
  `id` int NOT NULL,
  `id_article` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id_article`);

--
-- Indexes for table `coureur`
--
ALTER TABLE `coureur`
  ADD PRIMARY KEY (`id_coureur`);

--
-- Indexes for table `denre_liquide`
--
ALTER TABLE `denre_liquide`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_article` (`id_article`);

--
-- Indexes for table `denre_solide`
--
ALTER TABLE `denre_solide`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_article` (`id_article`);

--
-- Indexes for table `epreuve`
--
ALTER TABLE `epreuve`
  ADD PRIMARY KEY (`id_epreuve`);

--
-- Indexes for table `historique`
--
ALTER TABLE `historique`
  ADD PRIMARY KEY (`id_historique`);

--
-- Indexes for table `repertorier`
--
ALTER TABLE `repertorier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_historique` (`id_historique`),
  ADD KEY `id_epreuve` (`id_epreuve`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_article` (`id_article`),
  ADD KEY `id_epreuve` (`id_epreuve`),
  ADD KEY `id_coureur` (`id_coureur`);

--
-- Indexes for table `t_shirt`
--
ALTER TABLE `t_shirt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_article` (`id_article`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id_article` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coureur`
--
ALTER TABLE `coureur`
  MODIFY `id_coureur` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `denre_liquide`
--
ALTER TABLE `denre_liquide`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `denre_solide`
--
ALTER TABLE `denre_solide`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `epreuve`
--
ALTER TABLE `epreuve`
  MODIFY `id_epreuve` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `historique`
--
ALTER TABLE `historique`
  MODIFY `id_historique` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `repertorier`
--
ALTER TABLE `repertorier`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_shirt`
--
ALTER TABLE `t_shirt`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `denre_liquide`
--
ALTER TABLE `denre_liquide`
  ADD CONSTRAINT `denre_liquide_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`);

--
-- Constraints for table `denre_solide`
--
ALTER TABLE `denre_solide`
  ADD CONSTRAINT `denre_solide_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`);

--
-- Constraints for table `repertorier`
--
ALTER TABLE `repertorier`
  ADD CONSTRAINT `repertorier_ibfk_1` FOREIGN KEY (`id_historique`) REFERENCES `historique` (`id_historique`),
  ADD CONSTRAINT `repertorier_ibfk_2` FOREIGN KEY (`id_epreuve`) REFERENCES `epreuve` (`id_epreuve`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`id_epreuve`) REFERENCES `epreuve` (`id_epreuve`),
  ADD CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`id_coureur`) REFERENCES `coureur` (`id_coureur`);

--
-- Constraints for table `t_shirt`
--
ALTER TABLE `t_shirt`
  ADD CONSTRAINT `t_shirt_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
