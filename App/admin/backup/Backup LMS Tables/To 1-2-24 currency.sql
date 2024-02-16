-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2024 at 02:01 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `dollar_rate`, `debitorcredit`, `mmk_amount`, `usd_amount`, `voucher_no`) VALUES
(54, 0, 'debit', 5400, 0, 'Dr-Feb 24/001'),
(55, 0, 'credit', 5400, 0, 'Dr-Feb 24/001'),
(58, 0, 'debit', 39000, 0, 'Dr-Feb 24/002'),
(59, 0, 'credit', 39000, 0, 'Dr-Feb 24/002'),
(60, 0, 'debit', 14000, 0, 'Dr Feb\'24/003'),
(61, 0, 'credit', 14000, 0, 'Dr Feb\'24/003'),
(62, 0, 'debit', 80000, 0, 'Dr Feb\'24/004'),
(63, 0, 'credit', 80000, 0, 'Dr Feb\'24/004'),
(64, 0, 'debit', 50000, 0, 'Dr Feb\'24/005'),
(65, 0, 'credit', 50000, 0, 'Dr Feb\'24/005'),
(66, 0, 'debit', 50000, 0, 'Dr Feb\'24/006'),
(67, 0, 'credit', 50000, 0, 'Dr Feb\'24/006'),
(68, 0, 'debit', 89928700, 0, 'Dr Feb\'24/007'),
(69, 0, 'credit', 89928700, 0, 'Dr Feb\'24/007'),
(70, 0, 'debit', 377000, 0, 'Dr Feb\'24/008'),
(71, 0, 'credit', 377000, 0, 'Dr Feb\'24/008'),
(76, 0, 'debit', 100000, 0, 'Dr Feb\'24/009'),
(77, 0, 'credit', 100000, 0, 'Dr Feb\'24/009'),
(78, 0, 'debit', 1500, 0, 'Dr Feb\'24/010'),
(79, 0, 'credit', 1500, 0, 'Dr Feb\'24/010'),
(80, 0, 'debit', 17754000, 0, 'Dr Feb\'24/011'),
(81, 0, 'credit', 17754000, 0, 'Dr Feb\'24/011'),
(82, 0, 'debit', 17351000, 0, 'Dr Feb\'24/011'),
(83, 0, 'credit', 17351000, 0, 'Dr Feb\'24/011'),
(84, 0, 'debit', 3000000, 0, 'Dr Feb\'24/012'),
(85, 0, 'credit', 3000000, 0, 'Dr Feb\'24/012');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
