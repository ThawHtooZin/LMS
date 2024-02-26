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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `date`, `voucher_no`, `ac_code`, `description`, `debit`, `credit`, `currency`, `sr_no`, `container_no`, `bank_charges`) VALUES
(54, '2024-02-01', '6756576', '9100/001', 'igi', 500, 0, 'mmk', '', '', 0),
(55, '2024-02-01', '6756576', '3600/001', 'iuyhiu', 0, 500, 'mmk', '', '', 0),
(56, '2024-02-01', '6756484', '9100/003', 'jihjhjhgjh', 10000, 0, 'mmk', '', '', 0),
(57, '2024-02-01', '6756484', '3600/001', 'jhgjhgjhgjhgjh', 0, 10000, 'mmk', '', '', 0),
(60, '2024-02-03', 'Dr-Feb 24/038', '4000/M01', 'Paid to MA for Vr No-10586', 4000000, 0, 'mmk', '', '', 0),
(61, '2024-02-03', 'Dr-Feb 24/038', '3600/001', 'Paid to MA for Vr No-10586', 0, 4000000, 'mmk', '', '', 0),
(65, '2024-02-03', 'Dr-Feb 24/039', '4000/S08', 'Paid to Soe Naing for Vr No-10534,10542', 4000000, 0, 'mmk', '', '', 0),
(66, '2024-02-03', 'Dr-Feb 24/039', '3600/001', 'Paid to Soe Naing for Vr No-10534,10542', 0, 4000000, 'mmk', '', '', 0),
(67, '2024-02-03', 'Dr-Feb 24/040', '4000/K07', 'Paid to Khin Mg Myint for Vr N0-11189', 7000000, 0, 'mmk', '', '', 0),
(68, '2024-02-03', 'Dr-Feb 24/040', '3600/001', 'paid to Khin Mg Myint for Vr No-11189', 0, 7000000, 'mmk', '', '', 0),
(69, '2024-02-03', 'Dr-Feb 24/041', '9100/006', 'Car Diesel for 6J-3015(1.2)-50000/ (3.2)-50000', 100000, 0, 'mmk', '', '', 0),
(70, '2024-02-03', 'Dr-Feb 24/041', '3600/001', 'Car Diesel for 6J-3015(1.2)-50000/ (3.2)-50000', 0, 100000, 'mmk', '', '', 0),
(71, '2024-02-03', 'Dr-Feb 24/042', '9100/014', 'Engin Oil purchase for 6J-3015', 10000, 0, 'mmk', '', '', 0),
(72, '2024-02-03', 'Dr-Feb 24/042', '3600/001', 'Engin Oil purchase for 6J-3015', 0, 10000, 'mmk', '', '', 0),
(73, '2024-02-03', 'Dr-Feb 24/043', '9100/014', 'Car police catch for 6J-3015(2.2)(3.2)', 8000, 0, 'mmk', '', '', 0),
(74, '2024-02-03', 'Dr-Feb 24/043', '3600/001', 'Car police catch for 6J-3015(2.2)(3.2)', 0, 8000, 'mmk', '', '', 0),
(75, '2024-02-03', 'Dr-Feb 24/044', '6100/003', 'paid to plastic (G/F) for Vr No-(31.1.24)(30.1.24)(30.1.24)', 2112000, 0, 'mmk', '', '', 0),
(76, '2024-02-03', 'Dr-Feb 24/044', '3600/001', 'Paid to plastic (G/F)for Vr No-(31.1.24)(30.1.24)(30.1.24)', 0, 2112000, 'mmk', '', '', 0),
(77, '2024-02-03', 'Dr-Feb 24/045', '6100/003', 'Paid to Carton Box (MMMO)for (31.1.24)Vr 3 pcs', 2193960, 0, 'mmk', '', '', 0),
(78, '2024-02-03', 'Dr-Feb 24/045', '3600/001', 'Paid to Carton Box (MMMO)for (31.1.24)Vr 3 pcs', 0, 2193960, 'mmk', '', '', 0),
(79, '2024-02-03', 'Dr-Feb 24/046', '6100/007', 'Paid to HHK Cold Store', 10000000, 0, 'mmk', '', '', 0),
(80, '2024-02-03', 'Dr-Feb 24/046', '3600/001', 'Paid to HHK Cold Store', 0, 10000000, 'mmk', '', '', 0),
(81, '2024-02-03', 'Dr-Feb 24/047', '6100/003', 'Paid to Carton Box (Swan Pyae) for Vr No-(19.12.23 to 22.12.23)(26.12.23)(27.12.23)(27.12.23)', 5730540, 0, 'mmk', '', '', 0),
(82, '2024-02-03', 'Dr-Feb 24/047', '3600/001', 'Paid to Carton Box (Swan Pyae) for Vr No-(19.12.23 to 22.12.23)(26.12.23)(27.12.23)(27.12.23)', 0, 5730540, 'mmk', '', '', 0),
(83, '2024-02-03', 'Dr-Feb 24/048', '6100/003', 'Plastic Packing Strap 3000 M W 5*87000ks', 435000, 0, 'mmk', '', '', 0),
(84, '2024-02-03', 'Dr-Feb 24/048', '3600/001', 'Plastic Packing Strap 3000 M W 5*87000ks', 0, 435000, 'mmk', '', '', 0),
(85, '2024-02-03', 'Dr-Feb 24/049', '6100/003', 'Paid to Carton Box (Shwe Myay) for (2.12)(12.12)(14.12)', 2000000, 0, 'mmk', '', '', 0),
(86, '2024-02-03', 'Dr-Feb 24/049', '3600/001', 'Paid to Carton Box (Shwe Myay) for (2.12)(12.12)(14.12)', 0, 2000000, 'mmk', '', '', 0),
(87, '2024-02-03', 'Dr-Feb 24/050', '9100/003', 'Water 2 pk purchase for WH', 1800, 0, 'mmk', '', '', 0),
(88, '2024-02-03', 'Dr-Feb 24/050', '3600/001', 'Water 2 pk purchase for WH', 0, 1800, 'mmk', '', '', 0),
(89, '2024-02-03', 'Dr-Feb 24/051', '6100/002', 'lce 3 pcs purchase for HHk(Puti)', 27000, 0, 'mmk', '', '', 0),
(90, '2024-02-03', 'Dr-Feb 24/051', '3600/001', 'lce 3 pcs purchase for HHk(Puti)', 0, 27000, 'mmk', '', '', 0),
(91, '2024-02-03', 'Dr-Feb 24/052', '6100/001', 'Labour Charges and Taxi Charges for (D-Puti) (109200+15000)', 124200, 0, 'mmk', '', '', 0),
(92, '2024-02-03', 'Dr-Feb 24/052', '3600/001', 'Labour Charges and Taxi Charges for (D-Puti) (109200+15000)', 0, 124200, 'mmk', '', '', 0),
(93, '2024-02-03', 'Dr-Feb 24/053', '9100/002', 'Taxi charges for HHK to WH pk', 17000, 0, 'mmk', '', '', 0),
(94, '2024-02-03', 'Dr-Feb 24/053', '3600/001', 'Taxi charges for HHK to WH pk', 0, 17000, 'mmk', '', '', 0),
(95, '2024-02-03', 'Dr-Feb 24/054', '6100/001', 'labour and Taxi Charges for (D-Puit)', 106800, 0, 'mmk', '', '', 0),
(96, '2024-02-03', 'Dr-Feb 24/054', '3600/001', 'labour and Taxi Charges for (D-Puit)', 0, 106800, 'mmk', '', '', 0),
(98, '2024-02-03', 'Dr-Feb 24/055', '6100/002', 'lce 4 pcs purchase for (D-Puit)', 36000, 0, 'mmk', '', '', 0),
(99, '2024-02-03', 'Dr-Feb 24/055', '3600/001', 'lce 4 pcs purchase for (D-Puit)', 0, 36000, 'mmk', '', '', 0),
(100, '2024-02-03', 'Dr-Feb 24/056', '9100/002', 'Taxi Charges for HHK to WH', 17000, 0, 'mmk', '', '', 0),
(101, '2024-02-03', 'Dr-Feb 24/056', '3600/001', 'Taxi Charges for HHK to WH', 0, 17000, 'mmk', '', '', 0),
(102, '2024-02-03', 'Dr-Feb 24/057', '6100/002', 'Ice 3pcs purchase for ( Ocean - Rohn )', 30000, 0, 'mmk', '', '', 0),
(103, '2024-02-03', 'Dr-Feb 24/057', '3600/001', 'Ice 3pcs purchase for ( Ocean - Rohn )', 0, 30000, 'mmk', '', '', 0),
(104, '2024-02-03', 'Dr-Feb 24/058', '6100/001', 'Labour Charges for (Rohn)', 10000, 0, 'mmk', '', '', 0),
(105, '2024-02-03', 'Dr-Feb 24/058', '3600/001', 'Labour Charges for (Rohn)', 0, 10000, 'mmk', '', '', 0),
(106, '2024-02-03', 'Dr-Feb 24/059', '9100/015', 'Sir present purchase for ( Cambodia go ) wallet and bags (Yangoods)\r\n\r\n', 519600, 0, 'mmk', '', '', 0),
(107, '2024-02-03', 'Dr-Feb 24/059', '3600/001', 'Sir present purchase for ( Cambodia go ) wallet and bags (Yangoods)\r\n\r\n', 0, 519600, 'mmk', '', '', 0),
(108, '2024-02-03', 'Dr-Feb 24/060', '9100/016', 'Meal Allowance for Sir +2 pcs', 95850, 0, 'mmk', '', '', 0),
(110, '2024-02-03', 'Dr-Feb 24/060', '3600/001', 'Meal Allowance for Sir +2 pcs', 0, 95850, 'mmk', '', '', 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
