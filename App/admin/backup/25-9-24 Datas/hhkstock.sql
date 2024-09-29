-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2024 at 08:23 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `hhkstock`
--

CREATE TABLE `hhkstock` (
  `id` int(11) NOT NULL,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `commondity_id` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `balance` varchar(11) NOT NULL,
  `balance_kg` varchar(11) NOT NULL,
  `balance_mc` int(11) DEFAULT NULL,
  `link_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hhkstock`
--

INSERT INTO `hhkstock` (`id`, `indate`, `outdate`, `commondity_id`, `mc`, `total_mc`, `kg`, `total_kg`, `balance`, `balance_kg`, `balance_mc`, `link_id`) VALUES
(27, '2024-03-05', '0000-00-00', '1', 0, 0, '848.6', '848.6', '848.6', '848.6', 0, 0),
(28, '2024-03-06', '0000-00-00', '1', 146, 146, '3229.9', '4078.5', '4927.1', '3229.9', 146, 0),
(29, '2024-12-18', '0000-00-00', '2', 0, 0, '237.0', '237.0', '331.8', '331.8', 21, 0),
(30, '2024-03-08', '0000-00-00', '1', 28, 174, '642.7', '4721.2', '9648.3', '642.7', 28, 0),
(31, '2024-03-09', '0000-00-00', '1', 400, 574, '8682.8', '13404', '23052.3', '8682.8', 400, 0),
(32, '2024-03-13', '0000-00-00', '1', 78, 652, '1596.0', '15000', '38052.3', '1596.0', 78, 0),
(33, '2024-03-13', '0000-00-00', '1', 191, 843, '4136.6', '19136.6', '57188.9', '4136.6', 191, 0),
(34, '2024-03-15', '0000-00-00', '1', 66, 909, '1383.7', '20520.3', '77709.2', '1383.7', 66, 0),
(35, '2024-03-19', '0000-00-00', '2', 15, 15, '295', '532', '884.6', '221.0', 14, 0),
(36, '2024-03-12', '0000-00-00', '3', 54, 54, '388', '388', '388', '388', 54, 0),
(37, '2024-03-09', '0000-00-00', '3', 14, 68, '294.2', '682.2', '1070.2', '294.2', 14, 0),
(38, '2024-12-20', '0000-00-00', '2', 0, 15, '34.9', '566.9', '1451.5', '34.9', 0, 0),
(39, '2024-12-21', '0000-00-00', '2', 0, 15, '13.1', '580', '2031.5', '13.1', 0, 0),
(40, '2024-12-23', '0000-00-00', '2', 6, 21, '138.5', '718.5', '2750', '138.5', 6, 0),
(41, '2024-12-26', '0000-00-00', '2', 0, 21, '3.6', '722.1', '3472.1', '3.6', 0, 0),
(42, '2024-12-28', '0000-00-00', '2', 6, 27, '102.9', '825', '4297.1', '102.9', 6, 0),
(43, '2024-12-30', '0000-00-00', '2', 3, 30, '57.3', '882.3', '5179.4', '57.3', 3, 0),
(44, '2024-01-01', '0000-00-00', '2', 4, 34, '75.6', '957.9', '6137.3', '75.6', 4, 0),
(46, '0024-01-02', '0000-00-00', '2', 13, 47, '232.1', '1190', '8436.4', '232.1', 13, 0),
(47, '2024-01-05', '0000-00-00', '2', 5, 52, '129.8', '1319.8', '9831.8', '129.8', 5, 0),
(48, '2024-01-08', '0000-00-00', '2', 1, 53, '15', '1334.8', '11242.8', '15.6', 1, 0),
(49, '2024-01-12', '0000-00-00', '2', 1, 54, '15.6', '1350.4', '12670.6', '16.8', 1, 0),
(50, '2024-01-15', '0000-00-00', '2', 1, 55, '16.8', '1367.2', '14113.4', '15.0', 1, 0),
(51, '2024-01-23', '0000-00-00', '2', 1, 56, '15', '1382.2', '15571.2', '15.0', 1, 0),
(52, '2024-03-04', '0000-00-00', '2', 9, 65, '180.5', '1562.7', '17133.9', '180.5', 9, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hhkstock`
--
ALTER TABLE `hhkstock`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hhkstock`
--
ALTER TABLE `hhkstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
