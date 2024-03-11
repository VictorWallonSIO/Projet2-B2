-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 11 mars 2024 à 17:56
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sio1_tp5`
--

-- --------------------------------------------------------

--
-- Structure de la table `adherent`
--

CREATE TABLE `adherent` (
  `idadherent` int(11) NOT NULL,
  `nom_adherent` varchar(20) DEFAULT NULL,
  `prenom_adherent` varchar(20) DEFAULT NULL,
  `rue` varchar(30) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `code_postal` int(5) DEFAULT NULL,
  `telephone` decimal(10,0) DEFAULT NULL,
  `identifiant` varchar(50) NOT NULL,
  `mdp` varchar(100) NOT NULL,
  `date_inscription` date DEFAULT NULL,
  `bibliotheque_idbibliotheque` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `adherent`
--

INSERT INTO `adherent` (`idadherent`, `nom_adherent`, `prenom_adherent`, `rue`, `ville`, `code_postal`, `telephone`, `identifiant`, `mdp`, `date_inscription`, `bibliotheque_idbibliotheque`) VALUES
(1, 'Dupont', 'Simon', 'Lomprez', 'Lille', 59300, '625262728', '', '', '2018-09-12', 'L59003'),
(2, 'Dumont', 'Andy', 'Manuel', 'Wazemmes', 59800, '635435432', '', '', '2015-06-03', 'L59003'),
(3, 'Cauet', 'Martin', 'du Marché', 'Wazemmes', 59800, '699884455', '', '', '2008-01-10', 'L59003'),
(4, 'Ribeau', 'Philippe', 'Louis Faure', 'Wazemmes', 59800, '745659821', '', '', '2009-06-01', 'L59003'),
(5, 'Lemaitre', 'Elodie', 'Liberté', 'Lille', 59000, '798652011', '', '', '2010-05-09', 'L59003'),
(6, 'Fresnoy', 'Lisa', 'Malpart', 'Lille', 59000, '665552214', '', '', '2013-09-02', 'L59003'),
(7, 'Amar', 'André', 'Camille Guérin', 'Lille', 59000, '665552215', '', '', '2018-10-25', 'L59003'),
(8, 'Durant', 'Sandra', 'Paul Duez', 'Lille', 59000, '665552216', '', '', '2017-02-15', 'L59003'),
(9, 'Blandy', 'Jessica', 'Chiba', 'Lille', 59000, '798652018', '', '', '2017-03-30', 'L59003'),
(10, 'Barr', 'Jason', 'Valmy', 'Lille', 59000, '798652021', '', '', '2019-01-15', 'L59003'),
(11, 'Brazil', 'Bruno', 'Gutenberg', 'Helemmes', 59260, '798652020', '', '', '2018-04-23', 'L59003'),
(12, 'Grolleau', 'Jacques', 'Royale', 'Helemmes', 59260, '702336895', '', '', '2018-10-25', 'L59003'),
(13, 'Cesbron', 'Michelle', 'Fives', 'Villeneuve-d Ascq', 59491, '766481120', '', '', '2019-02-02', 'L59003'),
(14, 'Chrétien', 'David', 'Tressin', 'Villeneuve-d Ascq', 59491, '658930201', '', '', '2016-11-22', 'L59003'),
(15, 'Bouloc', 'Jean', 'Lille', 'Villeneuve-d Ascq', 59491, '609362545', '', '', '2018-11-18', 'L59003'),
(16, 'Richou', 'Jeanne', 'Talma', 'Villeneuve-d Ascq', 59491, '796256458', '', '', '2019-02-03', 'L59003'),
(17, 'Bessoneau', 'Laurent', 'Tourcoing', 'Roubaix', 59170, '601572236', '', '', '2009-08-25', 'L59003'),
(18, 'Ouvrard', 'Louise', 'Emile Zola', 'Roubaix', 59170, '689451212', '', '', '2013-09-10', 'L59003'),
(19, 'Lataye', 'André', 'des Champs', 'Lannoy', 59390, '765465432', '', '', '2010-04-09', 'L59003'),
(20, 'Robert', 'Sébastien', 'Pouchain', 'Lannoy', 59390, '659020501', '', '', '2014-07-06', 'L59003');

-- --------------------------------------------------------

--
-- Structure de la table `bibliotheque`
--

CREATE TABLE `bibliotheque` (
  `idbibliotheque` varchar(15) NOT NULL,
  `nom` varchar(15) DEFAULT NULL,
  `rue` varchar(45) DEFAULT NULL,
  `ville` varchar(30) DEFAULT NULL,
  `code_postal` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `bibliotheque`
--

INSERT INTO `bibliotheque` (`idbibliotheque`, `nom`, `rue`, `ville`, `code_postal`) VALUES
('L59003', 'BM Lille', 'Edouard Delesalle', 'Lille', 59300);

-- --------------------------------------------------------

--
-- Structure de la table `documentaliste`
--

CREATE TABLE `documentaliste` (
  `iddocumentaliste` int(2) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `mdp` varchar(100) DEFAULT NULL,
  `matricule` int(5) DEFAULT NULL,
  `idbibliotheque` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

CREATE TABLE `emprunt` (
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `adherent_idadherent` int(11) NOT NULL,
  `livre_idlivre` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `emprunt`
--

INSERT INTO `emprunt` (`date_debut`, `date_fin`, `adherent_idadherent`, `livre_idlivre`) VALUES
('2021-12-06', '2022-06-06', 1, '001_001'),
('2021-06-10', '2021-12-10', 12, '002_001'),
('2021-12-21', '2022-06-21', 20, '002_003'),
('2021-09-01', '2022-03-01', 12, '003_001'),
('2021-09-01', '2022-03-01', 7, '004_002'),
('2021-01-18', '2021-09-18', 3, '005_001'),
('2021-06-21', '2021-12-21', 16, '006_001'),
('2021-03-28', '2022-03-28', 7, '008_001'),
('2021-03-15', '2021-12-15', 9, '010_001'),
('2022-01-05', '2022-04-05', 11, '010_002'),
('2021-12-20', '2022-06-20', 9, '011_001'),
('2021-11-06', '2022-05-06', 18, '012_001');

-- --------------------------------------------------------

--
-- Structure de la table `etat_livre`
--

CREATE TABLE `etat_livre` (
  `disponible` binary(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etat_livre`
--

INSERT INTO `etat_livre` (`disponible`) VALUES
(0x30),
(0x31);

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `idlivre` varchar(10) NOT NULL,
  `oeuvre_idoeuvre` int(3) UNSIGNED ZEROFILL NOT NULL,
  `etat_livre_disponible` binary(1) NOT NULL,
  `bibliotheque_idbibliotheque` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`idlivre`, `oeuvre_idoeuvre`, `etat_livre_disponible`, `bibliotheque_idbibliotheque`) VALUES
('001_001', 001, 0x30, 'L59003'),
('001_002', 001, 0x31, 'L59003'),
('001_003', 001, 0x31, 'L59003'),
('001_004', 001, 0x31, 'L59003'),
('001_005', 001, 0x31, 'L59003'),
('002_001', 002, 0x30, 'L59003'),
('002_002', 002, 0x31, 'L59003'),
('002_003', 002, 0x30, 'L59003'),
('003_001', 003, 0x30, 'L59003'),
('003_002', 003, 0x31, 'L59003'),
('004_001', 004, 0x31, 'L59003'),
('004_002', 004, 0x30, 'L59003'),
('005_001', 005, 0x30, 'L59003'),
('005_002', 005, 0x31, 'L59003'),
('006_001', 006, 0x30, 'L59003'),
('006_002', 006, 0x31, 'L59003'),
('007_001', 007, 0x31, 'L59003'),
('008_001', 008, 0x30, 'L59003'),
('009_001', 009, 0x31, 'L59003'),
('010_001', 010, 0x30, 'L59003'),
('010_002', 010, 0x30, 'L59003'),
('010_003', 010, 0x31, 'L59003'),
('011_001', 011, 0x30, 'L59003'),
('011_002', 011, 0x31, 'L59003'),
('012_001', 012, 0x30, 'L59003');

-- --------------------------------------------------------

--
-- Structure de la table `oeuvre`
--

CREATE TABLE `oeuvre` (
  `idoeuvre` int(3) UNSIGNED ZEROFILL NOT NULL,
  `titre` varchar(45) DEFAULT NULL,
  `auteur` varchar(45) DEFAULT NULL,
  `nb_exemplaires` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `oeuvre`
--

INSERT INTO `oeuvre` (`idoeuvre`, `titre`, `auteur`, `nb_exemplaires`) VALUES
(001, 'Les Misérables', 'Victor Hugo', 5),
(002, 'Harry Potter à l école des sorciers, tome 1', 'JK Rowling', 3),
(003, 'Harry Potter et la Chambre des Secrets, tome ', 'JK Rowling', 2),
(004, 'Harry Potter et le Prisonnier d Azkaban, tome', 'JK Rowling', 2),
(005, 'Le Petit Prince', 'Antoine de Saint-Exupéry', 2),
(006, 'Alice au pays des merveilles', 'Lewis Caroll', 2),
(007, 'Da Vinci Code', 'Dan Brown', 1),
(008, 'L alchimiste', 'Paulo Coelho', 1),
(009, 'Vingt mille lieues sous les mers', 'Jules Verne', 1),
(010, 'Twilight: Fascination, tome 1', 'Stephenie Meyer ', 3),
(011, 'Twilight: Tentation, tome 2', 'Stephenie Meyer ', 2),
(012, 'L île mystérieuse', 'Jules Verne', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adherent`
--
ALTER TABLE `adherent`
  ADD PRIMARY KEY (`idadherent`),
  ADD KEY `fk_adherent_bibliotheque_idx` (`bibliotheque_idbibliotheque`);

--
-- Index pour la table `bibliotheque`
--
ALTER TABLE `bibliotheque`
  ADD PRIMARY KEY (`idbibliotheque`);

--
-- Index pour la table `documentaliste`
--
ALTER TABLE `documentaliste`
  ADD PRIMARY KEY (`iddocumentaliste`),
  ADD KEY `fk_bibliotheque` (`idbibliotheque`);

--
-- Index pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD KEY `fk_emprunt_adherent1_idx` (`adherent_idadherent`),
  ADD KEY `fk_emprunt_livre1_idx` (`livre_idlivre`);

--
-- Index pour la table `etat_livre`
--
ALTER TABLE `etat_livre`
  ADD PRIMARY KEY (`disponible`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`idlivre`),
  ADD KEY `fk_livre_oeuvre1_idx` (`oeuvre_idoeuvre`),
  ADD KEY `fk_livre_etat_livre1_idx` (`etat_livre_disponible`),
  ADD KEY `fk_livre_bibliotheque1_idx` (`bibliotheque_idbibliotheque`);

--
-- Index pour la table `oeuvre`
--
ALTER TABLE `oeuvre`
  ADD PRIMARY KEY (`idoeuvre`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adherent`
--
ALTER TABLE `adherent`
  MODIFY `idadherent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adherent`
--
ALTER TABLE `adherent`
  ADD CONSTRAINT `fk_adherent_bibliotheque` FOREIGN KEY (`bibliotheque_idbibliotheque`) REFERENCES `bibliotheque` (`idbibliotheque`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `documentaliste`
--
ALTER TABLE `documentaliste`
  ADD CONSTRAINT `fk_bibliotheque` FOREIGN KEY (`idbibliotheque`) REFERENCES `bibliotheque` (`idbibliotheque`);

--
-- Contraintes pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `fk_emprunt_adherent1` FOREIGN KEY (`adherent_idadherent`) REFERENCES `adherent` (`idadherent`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emprunt_livre1` FOREIGN KEY (`livre_idlivre`) REFERENCES `livre` (`idlivre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `fk_livre_bibliotheque1` FOREIGN KEY (`bibliotheque_idbibliotheque`) REFERENCES `bibliotheque` (`idbibliotheque`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livre_etat_livre1` FOREIGN KEY (`etat_livre_disponible`) REFERENCES `etat_livre` (`disponible`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livre_oeuvre1` FOREIGN KEY (`oeuvre_idoeuvre`) REFERENCES `oeuvre` (`idoeuvre`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
