-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2024 at 05:05 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.17

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
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `dollar_rate` double NOT NULL,
  `debitorcredit` varchar(255) NOT NULL,
  `mmk_amount` bigint(25) NOT NULL,
  `usd_amount` bigint(25) NOT NULL,
  `voucher_no` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `dollar_rate`, `debitorcredit`, `mmk_amount`, `usd_amount`, `voucher_no`) VALUES
(54, 0, 'debit', 500, 0, '6756576'),
(55, 0, 'credit', 500, 0, '6756576'),
(56, 0, 'debit', 10000, 0, '6756484'),
(57, 0, 'credit', 10000, 0, '6756484'),
(58, 0, '', 0, 0, 'Dr-Feb 24/038'),
(59, 0, '', 0, 0, 'Dr-Feb 24/038'),
(60, 0, 'debit', 4000000, 0, 'Dr-Feb 24/038'),
(61, 0, 'credit', 4000000, 0, 'Dr-Feb 24/038'),
(62, 0, '', 0, 0, 'Dr-Feb 24/039'),
(63, 0, '', 0, 0, 'Dr-Feb 24/039'),
(64, 0, '', 0, 0, 'Dr-Feb 24/039'),
(65, 0, 'debit', 4000000, 0, 'Dr-Feb 24/039'),
(66, 0, 'credit', 4000000, 0, 'Dr-Feb 24/039'),
(67, 0, 'debit', 7000000, 0, 'Dr-Feb 24/040'),
(68, 0, 'credit', 7000000, 0, 'Dr-Feb 24/040'),
(69, 0, 'debit', 100000, 0, 'Dr-Feb 24/041'),
(70, 0, 'credit', 100000, 0, 'Dr-Feb 24/041'),
(71, 0, 'debit', 10000, 0, 'Dr-Feb 24/042'),
(72, 0, 'credit', 10000, 0, 'Dr-Feb 24/042'),
(73, 0, 'debit', 8000, 0, 'Dr-Feb 24/043'),
(74, 0, 'credit', 8000, 0, 'Dr-Feb 24/043'),
(75, 0, 'debit', 2112000, 0, 'Dr-Feb 24/044'),
(76, 0, 'credit', 2112000, 0, 'Dr-Feb 24/044'),
(77, 0, 'debit', 2193960, 0, 'Dr-Feb 24/045'),
(78, 0, 'credit', 2193960, 0, 'Dr-Feb 24/045'),
(79, 0, 'debit', 10000000, 0, 'Dr-Feb 24/046'),
(80, 0, 'credit', 10000000, 0, 'Dr-Feb 24/046'),
(81, 0, 'debit', 5730540, 0, 'Dr-Feb 24/047'),
(82, 0, 'credit', 5730540, 0, 'Dr-Feb 24/047'),
(83, 0, 'debit', 435000, 0, 'Dr-Feb 24/048'),
(84, 0, 'credit', 435000, 0, 'Dr-Feb 24/048'),
(85, 0, 'debit', 2000000, 0, 'Dr-Feb 24/049'),
(86, 0, 'credit', 2000000, 0, 'Dr-Feb 24/049'),
(87, 0, 'debit', 1800, 0, 'Dr-Feb 24/050'),
(88, 0, 'credit', 1800, 0, 'Dr-Feb 24/050'),
(89, 0, 'debit', 27000, 0, 'Dr-Feb 24/051'),
(90, 0, 'credit', 27000, 0, 'Dr-Feb 24/051'),
(91, 0, 'debit', 124200, 0, 'Dr-Feb 24/052'),
(92, 0, 'credit', 124200, 0, 'Dr-Feb 24/052'),
(93, 0, 'debit', 17000, 0, 'Dr-Feb 24/053'),
(94, 0, 'credit', 17000, 0, 'Dr-Feb 24/053'),
(95, 0, 'debit', 106800, 0, 'Dr-Feb 24/054'),
(96, 0, 'credit', 106800, 0, 'Dr-Feb 24/054'),
(97, 0, '', 0, 0, 'Dr-Feb 24/055'),
(98, 0, 'debit', 36000, 0, 'Dr-Feb 24/055'),
(99, 0, 'credit', 36000, 0, 'Dr-Feb 24/055'),
(100, 0, 'debit', 17000, 0, 'Dr-Feb 24/056'),
(101, 0, 'credit', 17000, 0, 'Dr-Feb 24/056'),
(102, 0, 'debit', 30000, 0, 'Dr-Feb 24/057'),
(103, 0, 'credit', 30000, 0, 'Dr-Feb 24/057'),
(104, 0, 'debit', 10000, 0, 'Dr-Feb 24/058'),
(105, 0, 'credit', 10000, 0, 'Dr-Feb 24/058'),
(106, 0, 'debit', 519600, 0, 'Dr-Feb 24/059'),
(107, 0, 'credit', 519600, 0, 'Dr-Feb 24/059'),
(108, 0, 'debit', 95850, 0, 'Dr-Feb 24/060'),
(109, 0, '', 0, 0, 'Dr-Feb 24/060'),
(110, 0, 'credit', 95850, 0, 'Dr-Feb 24/060');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
