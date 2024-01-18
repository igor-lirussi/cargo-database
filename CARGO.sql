-- phpMyAdmin SQL Dump
-- version 4.1.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Lug 02, 2018 alle 18:43
-- Versione del server: 5.6.33-log
-- PHP Version: 5.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `my_egoladventures`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Camion`
--

CREATE TABLE IF NOT EXISTS `Camion` (
  `Targa` varchar(7) CHARACTER SET latin1 NOT NULL,
  `Modello` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Marca` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Tipo` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Persona_CodFiscale` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`Targa`),
  KEY `Persona_CodFiscale` (`Persona_CodFiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `Camion`
--

INSERT INTO `Camion` (`Targa`, `Modello`, `Marca`, `Tipo`, `Persona_CodFiscale`) VALUES
('CM001', 'Speede', 'Volvo', 'Bilico', 'AUT25'),
('CM002', 'Cargo', 'BMW', 'Autobotte', 'AUT50'),
('CM003', 'Pegaso', 'Volvo', 'Autobotte', 'AUT75'),
('CM004', 'Gelid', 'Fiat', 'Refrigerato', 'AUT26'),
('CM005', 'Train', 'Fiat', 'Autotreno', 'AUT100');

-- --------------------------------------------------------

--
-- Struttura della tabella `compiere`
--

CREATE TABLE IF NOT EXISTS `compiere` (
  `Merce_idMerce` int(11) NOT NULL,
  `Movimentazioni_idMov` int(11) NOT NULL,
  PRIMARY KEY (`Merce_idMerce`,`Movimentazioni_idMov`),
  KEY `Merce_idMerce` (`Merce_idMerce`),
  KEY `Movimetazioni_idMov` (`Movimentazioni_idMov`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_latvian_ci;

--
-- Dump dei dati per la tabella `compiere`
--

INSERT INTO `compiere` (`Merce_idMerce`, `Movimentazioni_idMov`) VALUES
(1, 1),
(1, 5),
(2, 2),
(3, 3),
(4, 2),
(4, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `contenere`
--

CREATE TABLE IF NOT EXISTS `contenere` (
  `Merce_idMerce` int(11) NOT NULL,
  `Deposito_idDeposito` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Merce_idMerce`,`Deposito_idDeposito`),
  KEY `Merce_idMerce` (`Merce_idMerce`),
  KEY `Deposito_idDeposito` (`Deposito_idDeposito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_latvian_ci;

--
-- Dump dei dati per la tabella `contenere`
--

INSERT INTO `contenere` (`Merce_idMerce`, `Deposito_idDeposito`) VALUES
(1, 1),
(2, 1),
(2, 3),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(4, 4),
(5, 5),
(7, 1),
(7, 7),
(8, 1),
(9, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `Deposito`
--

CREATE TABLE IF NOT EXISTS `Deposito` (
  `idDeposito` int(16) NOT NULL,
  `Citta` varchar(45) NOT NULL,
  `Via` varchar(45) NOT NULL,
  `Numero` varchar(45) NOT NULL,
  `Metratura` float NOT NULL,
  PRIMARY KEY (`idDeposito`),
  KEY `idDeposito` (`idDeposito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `Deposito`
--

INSERT INTO `Deposito` (`idDeposito`, `Citta`, `Via`, `Numero`, `Metratura`) VALUES
(1, 'Valecia', 'macchi', '35', 5000),
(2, 'Reggio', 'folli', '33', 1000),
(3, 'Rimini', 'zolla', '39', 5000),
(4, 'Cesena', 'cavour', '39', 1000),
(5, 'Bologna', 'stalingrado', '33', 2000),
(7, 'Napoli', 'Sospetta', '2', 34);

-- --------------------------------------------------------

--
-- Struttura della tabella `Merce`
--

CREATE TABLE IF NOT EXISTS `Merce` (
  `idMerce` int(11) NOT NULL,
  `Nome` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Quantita` int(11) NOT NULL,
  PRIMARY KEY (`idMerce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `Merce`
--

INSERT INTO `Merce` (`idMerce`, `Nome`, `Quantita`) VALUES
(0, 'Maiali volanti', 7),
(1, 'Pesche', 2),
(2, 'Banane', 7),
(3, 'Albicocche', 1),
(4, 'Uva', 3),
(5, 'Ananas', 1),
(7, 'James Bond', 2),
(8, 'Egol', 2),
(9, 'Excalibur', 1),
(1234, 'Quentin', 12);

-- --------------------------------------------------------

--
-- Struttura della tabella `Movimentazioni`
--

CREATE TABLE IF NOT EXISTS `Movimentazioni` (
  `idMov` int(11) NOT NULL,
  `Tipomov` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Data` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Deposito_idDeposito` int(11) DEFAULT NULL,
  `Camion_Targa` varchar(7) CHARACTER SET latin1 DEFAULT NULL,
  `Persona_CodFiscale` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`idMov`),
  KEY `Persona_CodFiscale` (`Persona_CodFiscale`),
  KEY `Camion_Targa` (`Camion_Targa`),
  KEY `Deposito_idDeposito` (`Deposito_idDeposito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `Movimentazioni`
--

INSERT INTO `Movimentazioni` (`idMov`, `Tipomov`, `Data`, `Deposito_idDeposito`, `Camion_Targa`, `Persona_CodFiscale`) VALUES
(1, 'Carico', '2017-09-02', 1, 'CM001', 'MAG001'),
(2, 'Scarico', '2017-09-03', 2, 'CM002', 'MAG003'),
(3, 'Carico', '2017-08-23', 1, 'CM001', 'MAG001'),
(4, 'Scarico', '2017-09-08', 2, 'CM001', 'MAG002'),
(5, 'Carico', '2017-08-31', 2, 'CM001', 'MAG001');

-- --------------------------------------------------------

--
-- Struttura della tabella `Officina`
--

CREATE TABLE IF NOT EXISTS `Officina` (
  `Nome_Commerciale` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Via` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Citta` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Numero` int(11) NOT NULL,
  PRIMARY KEY (`Nome_Commerciale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `Officina`
--

INSERT INTO `Officina` (`Nome_Commerciale`, `Via`, `Citta`, `Numero`) VALUES
('AmmaccatureLiscie', 'Ranieri', 'Roma', 18),
('GommeCalde', 'Boatti', 'Genova', 39),
('MotoriNuovi', 'Ribetto', 'Catanie', 37);

-- --------------------------------------------------------

--
-- Struttura della tabella `Persona`
--

CREATE TABLE IF NOT EXISTS `Persona` (
  `CodFiscale` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Nome` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Cognome` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Citta` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Via` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Numero` int(11) NOT NULL,
  `Tipo` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Specializzazione` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Patente` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Badge` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`CodFiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `Persona`
--

INSERT INTO `Persona` (`CodFiscale`, `Nome`, `Cognome`, `Citta`, `Via`, `Numero`, `Tipo`, `Specializzazione`, `Patente`, `Badge`) VALUES
('AUT100', 'Geraldo', 'Brusa', 'Firenze', 'Torchi', 5, 'Autista', '', 'PAT100', ''),
('AUT25', 'Francesco', 'Rino', 'Milano', 'Bonvicini', 12, 'Autista', '', 'PAT125', ''),
('AUT26', 'Guido', 'Vespa', 'Monza', 'Guzzu', 33, 'Autista', '', 'PAT26', ''),
('AUT50', 'Giovanni', 'Gucci', 'Roma', 'Ranieri', 78, 'Autista', '', 'PAT150', ''),
('AUT75', 'Renzo', 'Garri', 'Parma', 'Eynard', 51, 'Autista', '', 'PAT175', ''),
('MAG001', 'Aldo', 'Fabbri', 'Terni', 'Reggi', 3, 'Magazziniere', '', '', 'BM001'),
('MAG002', 'Zino', 'Maga', 'Verona', 'mazzi', 38, 'Magazziniere', '', '', 'BM002'),
('MAG003', 'Pino', 'Calessi', 'Vicenza', 'Bulle', 36, 'Magazziniere', '', '', 'BM003'),
('MEC001', 'Luigi', 'Vespucci', 'Roma', 'Narco', 38, 'Meccanico', 'Carrozziere', '', ''),
('MEC002', 'Lino', 'Balli', 'Venzone', 'Kiwi', 36, 'Meccanico', 'Gommista', '', ''),
('MEC003', 'Ken', 'Blocco', 'Porica', 'Zilli', 34, 'Meccanico', 'Componentista', '', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `Riparazione`
--

CREATE TABLE IF NOT EXISTS `Riparazione` (
  `Tipo` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Data` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Persona_CodFiscale` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `Officina_Nome_Commerciale` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`Data`),
  KEY `Persona_CodFiscale` (`Persona_CodFiscale`),
  KEY `Officina_Nome_Commerciale` (`Officina_Nome_Commerciale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `Riparazione`
--

INSERT INTO `Riparazione` (`Tipo`, `Data`, `Persona_CodFiscale`, `Officina_Nome_Commerciale`) VALUES
('Batteria', '2017-08-21', 'MEC003', 'MotoriNuovi'),
('Pistoni', '2017-08-23', 'MEC003', 'MotoriNuovi'),
('Freni', '2017-08-28', 'MEC003', 'MotoriNuovi'),
('Portiera', '2017-08-30', 'MEC001', 'AmmaccatureLiscie'),
('Gomme', '2017-08-31', 'MAG002', 'GommeCalde'),
('Gomme', '2017-09-02', 'MEC002', 'GommeCalde'),
('Cofano', '2017-09-03', 'MEC001', 'AmmaccatureLiscie');

-- --------------------------------------------------------

--
-- Struttura della tabella `svolta`
--

CREATE TABLE IF NOT EXISTS `svolta` (
  `Riparazione_Tipo` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Riparazione_Data` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Camion_Targa` varchar(7) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`Riparazione_Data`,`Camion_Targa`),
  KEY `svolta_fkCAMTAR` (`Camion_Targa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `svolta`
--

INSERT INTO `svolta` (`Riparazione_Tipo`, `Riparazione_Data`, `Camion_Targa`) VALUES
('Batteria', '2017-08-21', 'CM002'),
('Pistoni', '2017-08-23', 'CM001'),
('Freni', '2017-08-28', 'CM001'),
('Freni', '2017-08-28', 'CM004'),
('Freni', '2017-08-28', 'CM005'),
('Portiera', '2017-08-30', 'CM003'),
('Gomme', '2017-08-31', 'CM004'),
('Gomme', '2017-09-02', 'CM003'),
('Cofano', '2017-09-03', 'CM001');

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Camion`
--
ALTER TABLE `Camion`
  ADD CONSTRAINT `Camion_fkCF` FOREIGN KEY (`Persona_CodFiscale`) REFERENCES `Persona` (`CodFiscale`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `compiere`
--
ALTER TABLE `compiere`
  ADD CONSTRAINT `compiere_fkIDMER` FOREIGN KEY (`Merce_idMerce`) REFERENCES `Merce` (`idMerce`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compiere_fkIDMOV` FOREIGN KEY (`Movimentazioni_idMov`) REFERENCES `Movimentazioni` (`idMov`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `contenere`
--
ALTER TABLE `contenere`
  ADD CONSTRAINT `contenere_fkIDDEP` FOREIGN KEY (`Deposito_idDeposito`) REFERENCES `Deposito` (`idDeposito`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contenere_fkIDMER` FOREIGN KEY (`Merce_idMerce`) REFERENCES `Merce` (`idMerce`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `Movimentazioni`
--
ALTER TABLE `Movimentazioni`
  ADD CONSTRAINT `Movimentazioni_fkCAMTAR` FOREIGN KEY (`Camion_Targa`) REFERENCES `Camion` (`Targa`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Movimentazioni_fkCODFIS` FOREIGN KEY (`Persona_CodFiscale`) REFERENCES `Persona` (`CodFiscale`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Movimentazioni_fkIDDEP` FOREIGN KEY (`Deposito_idDeposito`) REFERENCES `Deposito` (`idDeposito`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `Riparazione`
--
ALTER TABLE `Riparazione`
  ADD CONSTRAINT `Riparazione_fkCODFIS` FOREIGN KEY (`Persona_CodFiscale`) REFERENCES `Persona` (`CodFiscale`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Riparazione_fkOFFNOMCOM` FOREIGN KEY (`Officina_Nome_Commerciale`) REFERENCES `Officina` (`Nome_Commerciale`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `svolta`
--
ALTER TABLE `svolta`
  ADD CONSTRAINT `svolta_fkCAMTAR` FOREIGN KEY (`Camion_Targa`) REFERENCES `Camion` (`Targa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `svolta_fkDAT` FOREIGN KEY (`Riparazione_Data`) REFERENCES `Riparazione` (`Data`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
