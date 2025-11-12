-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 23, 2017 at 10:54 AM
-- Server version: 5.5.53
-- PHP Version: 5.6.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cartridge`
--

-- --------------------------------------------------------

--
-- Table structure for table `cartridgedb`
--

CREATE TABLE `cartridgedb` (
                               `id` int(11) NOT NULL COMMENT 'unique item number - taken from the DB.',
                               `owner` varchar(50) NOT NULL COMMENT 'where the cartridge is installed or to whom it belongs according to the inventory database',
                               `brand` varchar(50) NOT NULL COMMENT 'cartridge manufacturer',
                               `marks` varchar(50) NOT NULL COMMENT 'cartridge model assigned by the manufacturer',
                               `weight_before` int(10) NOT NULL COMMENT 'weight before sending to the service center',
                               `weight_after` int(10) NOT NULL COMMENT 'weight after refill',
                               `date_outcome` date NOT NULL COMMENT 'when it was sent to the service center (departure date)',
                               `date_income` date NOT NULL COMMENT 'when it was received from the service center (arrival date)',
                               `servicename` varchar(30) NOT NULL COMMENT 'service center that performed the repair/refill/restoration',
                               `comments` varchar(50) NOT NULL COMMENT 'comments explaining a particular situation with the cartridge',
                               `technical_life` tinyint(4) NOT NULL COMMENT 'technical condition of the cartridge (in operation or decommissioned)',
                               `code` varchar(30) NOT NULL COMMENT 'unique cartridge code / inventory number',
                               `inservice` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'In Service (1) or not (0) is calculated automatically: when the Arrival Date field is less than the Departure Date field, the value 1 (In Service) is assigned.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cartridgedb`
--
ALTER TABLE `cartridgedb`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cartridgedb`
--
ALTER TABLE `cartridgedb`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique item number - taken from the DB.';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;