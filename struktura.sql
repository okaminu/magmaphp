-- phpMyAdmin SQL Dump
-- version 3.5.0
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 08, 2012 at 12:59 AM
-- Server version: 5.5.20-log
-- PHP Version: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bakalauras`
--

-- --------------------------------------------------------

--
-- Table structure for table `imokos`
--

CREATE TABLE IF NOT EXISTS `imokos` (
  `ID` int(20) NOT NULL COMMENT 'Lentelės pirminis raktas',
  `Dok_numeris` varchar(20) NOT NULL COMMENT 'Mokėjimo dokumento numeris',
  `Operacijos_data` date NOT NULL COMMENT 'Mokėjimo operacijos data banke',
  `Dok_data` date NOT NULL COMMENT 'Mokėjimo dokumento data',
  `Moka_mm_kodas` varchar(30) NOT NULL COMMENT 'Mokesčio mokėtojo, kuris sumokėjo lėšas, kodas',
  `Moka_mm_pavadinimas` varchar(250) NOT NULL COMMENT 'Mokesčio mokėtojo, kuris sumokėjo lėšas, pavadinimas',
  `Mokescio_moketojai_kodas` int(20) NOT NULL COMMENT 'Mokesčio mokėtojo, kuriam skirta įmoka, kodas',
  `Mokescio_moketojai_pav` varchar(200) NOT NULL COMMENT 'Mokesčio mokėtojo, kuriam skirta įmoka, pavadinimas',
  `Savivaldybes_id` int(3) NOT NULL COMMENT 'Savivaldybės kodas',
  `Imokos_kodas` int(5) NOT NULL COMMENT 'Įmokos kodas',
  `Op_tipas` varchar(3) NOT NULL COMMENT 'Mokėjimo operacijos tipo kodas',
  `Suma_BV` int(20) NOT NULL COMMENT 'Sumokėta įmokos suma bazine valiuta',
  `Suma` int(20) NOT NULL COMMENT 'Sumokėta suma',
  `Valiuta` varchar(3) NOT NULL COMMENT 'Valiutos kodas nurodantis, kokia valiuta sumokėta įmoka',
  `Mokejimo_paskirtis` varchar(400) NOT NULL COMMENT 'Mokėjimo paskirtis iš mokėjimo dokumento',
  `Irs_upd_data` date NOT NULL COMMENT 'Paskutinio įrašo atnaujinimo data',
  `Irs_ins_data` date NOT NULL COMMENT 'Įrašo įterpimo data',
  PRIMARY KEY (`ID`),
  KEY `Savivaldybes_id` (`Savivaldybes_id`,`Imokos_kodas`),
  KEY `Imokos_kodas` (`Imokos_kodas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `imoku_kodai`
--

CREATE TABLE IF NOT EXISTS `imoku_kodai` (
  `Imokos_kodas` int(5) NOT NULL COMMENT 'Įmokos kodas',
  `Imokos_pavadinimas` varchar(200) NOT NULL COMMENT 'Įmokos pavadinimas',
  PRIMARY KEY (`Imokos_kodas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `savivaldybes`
--

CREATE TABLE IF NOT EXISTS `savivaldybes` (
  `Savivaldybes_id` int(3) NOT NULL COMMENT 'Savivaldybės kodas',
  `Savivaldybes_pavadinimas` varchar(50) NOT NULL COMMENT 'Savivaldybės pavadinimas',
  PRIMARY KEY (`Savivaldybes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `imokos`
--
ALTER TABLE `imokos`
  ADD CONSTRAINT `imokos_ibfk_2` FOREIGN KEY (`Imokos_kodas`) REFERENCES `imoku_kodai` (`Imokos_kodas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `imokos_ibfk_1` FOREIGN KEY (`Savivaldybes_id`) REFERENCES `savivaldybes` (`Savivaldybes_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
