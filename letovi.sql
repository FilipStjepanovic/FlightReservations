-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2020 at 04:54 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `letovi`
--

-- --------------------------------------------------------

--
-- Table structure for table `klasa`
--

CREATE TABLE `klasa` (
  `idKlase` int(11) NOT NULL,
  `nazivKlase` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `klasa`
--

INSERT INTO `klasa` (`idKlase`, `nazivKlase`) VALUES
(1, 'ekonomska'),
(2, 'prva'),
(3, 'biznis');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `idKorisnik` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `admin` int(11) NOT NULL,
  `telefon` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`idKorisnik`, `name`, `username`, `password`, `admin`, `telefon`) VALUES
(1, 'Filip Stjepanovic', 'fiko', 'fiko', 1, '0629690293'),
(2, 'Lazar Knezevic', 'laza', 'laza', 1, '064458965'),
(3, 'Milos Mutavdzic', 'misa', 'misa', 1, '065966563'),
(4, 'Petar', 'Petrovic', 'heVeagUG', 0, '0623231314'),
(5, 'Pera', 'pera', 'pera', 0, '064112312'),
(6, 'Miki', 'miki', 'miki', 0, '06412132131');

-- --------------------------------------------------------

--
-- Table structure for table `let`
--

CREATE TABLE `let` (
  `id` int(11) NOT NULL,
  `mestoOd` varchar(50) NOT NULL,
  `mestoDo` varchar(50) NOT NULL,
  `klasa` int(11) NOT NULL,
  `cena` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `let`
--

INSERT INTO `let` (`id`, `mestoOd`, `mestoDo`, `klasa`, `cena`) VALUES
(1, 'Beograd', 'Amsterdam', 2, 6866),
(2, 'Beograd', 'Atina', 1, 5500),
(3, 'Beograd', 'Barselona', 3, 58722),
(4, 'Beograd', 'Frankfurt', 1, 18744),
(5, 'Beograd', 'Helsinki', 2, 30452),
(6, 'Beograd', 'Kopenhagen', 1, 10052),
(7, 'Beograd', 'Pariz', 3, 36014),
(8, 'Beograd', 'Rim', 1, 5332),
(9, 'Beograd', 'Dizeldorf', 3, 26810),
(10, 'Beograd', 'Istanbul', 2, 15682),
(11, 'Nis', 'Atina', 3, 55000),
(12, 'Nis', 'Berlin', 1, 6000),
(13, 'Nis', 'Malme', 3, 10250),
(14, 'Budimpesta', 'Milano', 1, 5560),
(15, 'Budimpesta', 'Barselona', 3, 60582),
(16, 'Budimpesta', 'Pariz', 1, 25870),
(17, 'Temisvar', 'Dortmund', 1, 3250),
(18, 'Temisvar', 'Tel-Aviv', 1, 8258);

-- --------------------------------------------------------

--
-- Table structure for table `rezervacija`
--

CREATE TABLE `rezervacija` (
  `rezervacijaID` int(11) NOT NULL,
  `datum` date NOT NULL,
  `let` int(11) NOT NULL,
  `korisnik` int(11) NOT NULL,
  `brojSedista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rezervacija`
--

INSERT INTO `rezervacija` (`rezervacijaID`, `datum`, `let`, `korisnik`, `brojSedista`) VALUES
(1, '2020-01-28', 2, 1, 23);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`idKorisnik`);

--
-- Indexes for table `let`
--
ALTER TABLE `let`
  ADD PRIMARY KEY (`id`),
  ADD KEY `klasa` (`klasa`);

--
-- Indexes for table `rezervacija`
--
ALTER TABLE `rezervacija`
  ADD PRIMARY KEY (`rezervacijaID`),
  ADD KEY `let` (`let`),
  ADD KEY `korisnik` (`korisnik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `idKorisnik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `let`
--
ALTER TABLE `let`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `rezervacija`
--
ALTER TABLE `rezervacija`
  MODIFY `rezervacijaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
