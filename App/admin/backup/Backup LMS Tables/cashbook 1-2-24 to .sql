-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2024 at 04:52 AM
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
-- Table structure for table `cashbook`
--

CREATE TABLE `cashbook` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `sr_no` varchar(25) NOT NULL,
  `ac_name` varchar(25) NOT NULL,
  `particular` text DEFAULT NULL,
  `debit` bigint(20) NOT NULL,
  `credit` bigint(20) NOT NULL,
  `balance` bigint(25) NOT NULL,
  `voucher_no` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cashbook`
--

INSERT INTO `cashbook` (`id`, `date`, `sr_no`, `ac_name`, `particular`, `debit`, `credit`, `balance`, `voucher_no`) VALUES
(23, '2024-01-31', '', '3600/001', 'Opening Balance of Jan\'24', 0, 0, 213847883, NULL),
(26, '2024-02-01', '', '3600/001', 'Water 6 pk purchase for WH', 0, 5400, 213842483, 'Dr-Feb 24/001'),
(27, '2024-02-01', '', '3600/001', 'Sir Phone Bill and Monthly/ Phone 6 pcs Bill/ Sir-6000 (Sir,Daw Nan,Lai-15000) (Office,Sandar,Mar)', 0, 39000, 213803483, 'Dr-Feb 24/002'),
(28, '2024-02-01', '', '3600/001', 'Medicine and Taxi for sir', 0, 14000, 213789483, 'Dr Feb\'24/003'),
(29, '2024-02-01', '', '3600/001', 'Car Diesel for 5L-2848 (30.1.24-10000)(30.1.24-70000)', 0, 80000, 213709483, 'Dr Feb\'24/004'),
(30, '2024-02-01', '', '3600/001', 'Car Diesel for 6J-3015 (31.1.24-50000)', 0, 50000, 213659483, 'Dr Feb\'24/005'),
(31, '2024-02-01', '', '3600/001', 'Material and Taxi Charges for PK Machine', 0, 50000, 213609483, 'Dr Feb\'24/006'),
(32, '2024-02-01', '', '3600/001', 'Bejon Loan take from LM 2020ED Balance $25176*3572ks(Best Brand)', 0, 89928700, 123680783, 'Dr Feb\'24/007'),
(33, '2024-02-01', '', '3600/001', 'DHL charges for Italy Document sent', 0, 377000, 123303783, 'Dr Feb\'24/008'),
(34, '2024-02-01', '', '3600/001', 'Paid to Ka Yin Lay Vr No-11337', 0, 100000, 123203783, 'Dr Feb\'24/009');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cashbook`
--
ALTER TABLE `cashbook`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cashbook`
--
ALTER TABLE `cashbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
