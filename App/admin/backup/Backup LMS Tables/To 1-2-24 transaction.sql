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
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `voucher_no` varchar(44) NOT NULL,
  `ac_code` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `debit` double NOT NULL,
  `credit` double NOT NULL,
  `currency` varchar(20) NOT NULL,
  `sr_no` varchar(25) NOT NULL,
  `container_no` varchar(25) NOT NULL,
  `bank_charges` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `date`, `voucher_no`, `ac_code`, `description`, `debit`, `credit`, `currency`, `sr_no`, `container_no`, `bank_charges`) VALUES
(54, '2024-02-01', 'Dr-Feb 24/001', '9100/003', 'Water 6 pk purchase for WH', 5400, 0, 'mmk', '', '', 0),
(55, '2024-02-01', 'Dr-Feb 24/001', '3600/001', 'Water 6 pk purchase for WH', 0, 5400, 'mmk', '', '', 0),
(58, '2024-02-01', 'Dr-Feb 24/002', '9100/004', 'Sir Phone Bill and Monthly/ Phone 6 pcs Bill/ Sir-6000 (Sir,Daw Nan,Lai-15000) (Office,Sandar,Mar)', 39000, 0, 'mmk', '', '', 0),
(59, '2024-02-01', 'Dr-Feb 24/002', '3600/001', 'Sir Phone Bill and Monthly/ Phone 6 pcs Bill/ Sir-6000 (Sir,Daw Nan,Lai-15000) (Office,Sandar,Mar)', 0, 39000, 'mmk', '', '', 0),
(60, '2024-02-01', 'Dr Feb\'24/003', '9100/005', 'Medicine and Taxi for sir', 14000, 0, 'mmk', '', '', 0),
(61, '2024-02-01', 'Dr Feb\'24/003', '3600/001', 'Medicine and Taxi for sir', 0, 14000, 'mmk', '', '', 0),
(62, '2024-02-01', 'Dr Feb\'24/004', '9100/006', 'Car Diesel for 5L-2848 (30.1.24-10000)(30.1.24-70000)', 80000, 0, 'mmk', '', '', 0),
(63, '2024-02-01', 'Dr Feb\'24/004', '3600/001', 'Car Diesel for 5L-2848 (30.1.24-10000)(30.1.24-70000)', 0, 80000, 'mmk', '', '', 0),
(64, '2024-02-01', 'Dr Feb\'24/005', '9100/006', 'Car Diesel for 6J-3015 (31.1.24-50000)', 50000, 0, 'mmk', '', '', 0),
(65, '2024-02-01', 'Dr Feb\'24/005', '3600/001', 'Car Diesel for 6J-3015 (31.1.24-50000)', 0, 50000, 'mmk', '', '', 0),
(66, '2024-02-01', 'Dr Feb\'24/006', '9100/007', 'Material and Taxi Charges for PK Machine', 50000, 0, 'mmk', '', '', 0),
(67, '2024-02-01', 'Dr Feb\'24/006', '3600/001', 'Material and Taxi Charges for PK Machine', 0, 50000, 'mmk', '', '', 0),
(68, '2024-02-01', 'Dr Feb\'24/007', '3300/001', 'Bejon Loan take from LM 2020ED Balance $25176*3572ks(Best Brand)', 89928700, 0, 'mmk', '', '', 0),
(69, '2024-02-01', 'Dr Feb\'24/007', '3600/001', 'Bejon Loan take from LM 2020ED Balance $25176*3572ks(Best Brand)', 0, 89928700, 'mmk', '', '', 0),
(70, '2024-02-01', 'Dr Feb\'24/008', '9100/008', 'DHL charges for Italy Document sent', 377000, 0, 'mmk', '', '', 0),
(71, '2024-02-01', 'Dr Feb\'24/008', '3600/001', 'DHL charges for Italy Document sent', 0, 377000, 'mmk', '', '', 0),
(76, '2024-02-01', 'Dr Feb\'24/009', '4000/K06', 'Paid to Ka Yin Lay for Vr No-11337', 100000, 0, 'mmk', '', '', 0),
(77, '2024-02-01', 'Dr Feb\'24/009', '3600/001', 'Paid to Ka Yin Lay for Vr No-11337', 0, 100000, 'mmk', '', '', 0),
(78, '2024-02-01', 'Dr Feb\'24/010', '9100/009', 'Wave Money charges for Ka Yin Lay Money sent', 1500, 0, 'mmk', '', '', 0),
(79, '2024-02-01', 'Dr Feb\'24/010', '3600/001', 'Wave Money charges for Ka Yin Lay Money sent', 0, 1500, 'mmk', '', '', 0),
(80, '2024-02-01', 'Dr Feb\'24/011', '9100/001', 'All people Salary Payment for Jan/24', 17754000, 0, 'mmk', '', '', 0),
(81, '2024-02-01', 'Dr Feb\'24/011', '3600/001', 'All people Salary Payment for Jan/24', 0, 17754000, 'mmk', '', '', 0),
(82, '2024-02-01', 'Dr Feb\'24/011', '9100/010', 'All people Annual Bonus Paid for Jan/24', 17351000, 0, 'mmk', '', '', 0),
(83, '2024-02-01', 'Dr Feb\'24/011', '3600/001', 'All people Annual Bonus Paid for Jan/24', 0, 17351000, 'mmk', '', '', 0),
(84, '2024-02-01', 'Dr Feb\'24/012', '9100/011', 'Donation for Bangladesh Embassy', 3000000, 0, 'mmk', '', '', 0),
(85, '2024-02-01', 'Dr Feb\'24/012', '3600/001', 'Donation for Bangladesh Embassy', 0, 3000000, 'mmk', '', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
