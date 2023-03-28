CREATE DEFINER=`root`@`localhost` FUNCTION `quantite_disponible` () RETURNS INT READS SQL DATA
BEGIN 
    DECLARE v_quantite INT;
    
    SELECT COUNT(quantite) INTO v_quantite FROM article WHERE quantite > 1;
    
    IF v_quantite IS NOT NULL THEN
        RETURN v_quantite;
    ELSE
        RETURN 0;
    END IF;
END$$CREATE TABLE IF NOT EXISTS `denre_liquide` (
  `id_article` int NOT NULL,
  `volume` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `denre_solide`
--

CREATE TABLE IF NOT EXISTS `denre_solide` (
  `id_article` int NOT NULL,
  `poids` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE IF NOT EXISTS `historique` (
  `id_historique` int NOT NULL,
  `log` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE IF NOT EXISTS `repertorier` (
  `id_epreuve` int NOT NULL,
  `id_historique` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE IF NOT EXISTS `t_shirt` (
  `id_article` int NOT NULL,
  `taille` varchar(50) DEFAULT NULL,
  `couleur` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE `denre_liquide`
  ADD PRIMARY KEY (`id_article`);
ALTER TABLE `denre_liquide`
  MODIFY `id_article` int NOT NULL AUTO_INCREMENT;
  ALTER TABLE `denre_liquide`
  ADD CONSTRAINT `denre_liquide_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`);
  ALTER TABLE `denre_solide`
  ADD PRIMARY KEY (`id_article`);
ALTER TABLE `denre_solide`
  MODIFY `id_article` int NOT NULL AUTO_INCREMENT;
  ALTER TABLE `denre_solide`
  ADD CONSTRAINT `denre_solide_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`);
  ALTER TABLE `historique`
  ADD PRIMARY KEY (`id_historique`);
  ALTER TABLE `historique`
  MODIFY `id_historique` int NOT NULL AUTO_INCREMENT;
  ALTER TABLE `reglement`
  ADD CONSTRAINT `reglement_ibfk_1` FOREIGN KEY (`typreg_code`) REFERENCES `type_reglement` (`typreg_code`) ON DELETE CASCADE;

--
-- Constraints for table `repertorier`
--
ALTER TABLE `repertorier`
  ADD CONSTRAINT `repertorier_ibfk_1` FOREIGN KEY (`id_epreuve`) REFERENCES `epreuve` (`ep_id`),
  ADD CONSTRAINT `repertorier_ibfk_2` FOREIGN KEY (`id_historique`) REFERENCES `historique` (`id_historique`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`id_coureur`) REFERENCES `coureur` (`co_id`),
  ADD CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`id_epreuve`) REFERENCES `epreuve` (`ep_id`);

--
-- Constraints for table `t_shirt`
--
ALTER TABLE `t_shirt`
  ADD CONSTRAINT `t_shirt_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`);
COMMIT;
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id_reservation` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_shirt`
--
ALTER TABLE `t_shirt`
  MODIFY `id_article` int NOT NULL AUTO_INCREMENT;
  ALTER TABLE `t_shirt`
  ADD PRIMARY KEY (`id_article`);
  ALTER TABLE `repertorier`
  ADD PRIMARY KEY (`id_epreuve`,`id_historique`),
  ADD KEY `id_historique` (`id_historique`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id_reservation`),
  ADD KEY `id_article` (`id_article`),
  ADD KEY `id_coureur` (`id_coureur`),
  ADD KEY `id_epreuve` (`id_epreuve`);
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);
  CREATE TABLE IF NOT EXISTS `reservations` (
  `id_reservation` int NOT NULL,
  `id_article` int NOT NULL,
  `id_epreuve` int NOT NULL,
  `id_coureur` int NOT NULL,
  `date_reservation` date DEFAULT NULL,
  `quantite` int DEFAULT NULL,
  `libelle` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

