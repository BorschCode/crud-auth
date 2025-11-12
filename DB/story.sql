-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 23, 2017 at 10:58 AM
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
-- Table structure for table `story`
--

CREATE TABLE `story` (
                         `id` int(10) NOT NULL COMMENT 'unique record number - taken from the DB.',
                         `id_item` int(10) NOT NULL,
                         `owner` varchar(40) NOT NULL DEFAULT 'Start Log' COMMENT 'where the cartridge is installed or to whom it belongs according to the inventory database',
                         `weight_before` int(10) NOT NULL COMMENT 'weight before sending to the service center',
                         `weight_after` int(10) NOT NULL COMMENT 'weight after refill',
                         `date_outcome` date NOT NULL COMMENT 'when it was sent to the service center (departure date)',
                         `date_income` date NOT NULL COMMENT 'when it was received from the service center (arrival date)',
                         `servicename` varchar(50) NOT NULL DEFAULT 'Start Log' COMMENT 'service center that performed the repair/refill/restoration',
                         `technical_life` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'technical condition of the cartridge (in operation or decommissioned)',
                         `log` text NOT NULL COMMENT '- contains a brief history of key changes: specifically, it only lists keys and the information that changed in those keys',
                         `log_full` text NOT NULL COMMENT 'Upon each edit and data change, it records all data before editing and the data that resulted after editing.',
                         `date_of_changes` date NOT NULL COMMENT 'Date the changes were made'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `story`
--
ALTER TABLE `story`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `story`
--
ALTER TABLE `story`
    MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'unique record number - taken from the DB.';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;