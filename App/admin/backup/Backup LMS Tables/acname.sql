-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2023 at 06:07 AM
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
-- Table structure for table `acname`
--

CREATE TABLE `acname` (
  `id` int(11) NOT NULL,
  `code_no` varchar(255) NOT NULL,
  `ac_type` int(11) NOT NULL,
  `ac_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `acname`
--

INSERT INTO `acname` (`id`, `code_no`, `ac_type`, `ac_name`) VALUES
(87, '9100/000', 1, 'Administration '),
(88, '9100/001', 1, 'Staff Salary'),
(89, '9100/002', 1, 'Transportation'),
(90, '9100/003', 1, 'Diesel & Petrol '),
(91, '9100/004', 1, 'Food & Refreshment'),
(92, '3600/001', 5, 'Main Cash'),
(93, '5000/001', 2, 'Revenue'),
(155, '3300/000', 5, 'Account Receivable'),
(156, '3300/SAF', 5, 'South Asia Food (SAF)'),
(157, '3300/CAN', 5, 'Jamuna Food (Can)'),
(158, '3300/KLKT', 5, 'Kolkata'),
(159, '3300/UTI', 5, 'Poland (France)'),
(160, '3300/BRN', 5, 'Brunei'),
(161, '3300/SC1', 5, 'Border Trade Technak (SC Trader)'),
(162, '3300/SC2', 5, 'Frozen Account (SC Trader)'),
(163, '3300/SC3', 5, 'SC Apple Account (SC Trader)'),
(164, '3300/SC4', 5, 'SC Fruit Account (SC Trader)'),
(166, '4000/001', 3, '4 Zaw'),
(167, '4000/002', 3, '4 Zaw (TCL)'),
(168, '4000/A01', 3, 'AK'),
(169, '4000/A02', 3, 'Arr Kae'),
(170, '4000/A03', 3, 'Aung Naing Oo'),
(171, '4000/B01', 3, 'Bar Bu Lay'),
(172, '4000/C01', 3, 'Chit Oo (D51)'),
(173, '4000/H01', 3, 'Htet Aung Lin'),
(174, '4000/H02', 3, 'Htay Win'),
(175, '4000/K01', 3, 'Kyaw Zay Ya (TCL)'),
(176, '4000/K02', 3, 'Kyaw Zin'),
(177, '4000/K03', 3, 'KTO'),
(178, '4000/K04', 3, 'Kaung Myat'),
(179, '4000/L01', 3, 'Lie Chit'),
(180, '4000/M01', 3, 'M.A'),
(181, '4000/M02', 3, 'Maung Soe'),
(182, '4000/M03', 3, 'Mg Mg Nyunt'),
(183, '4000/N01', 3, 'Nanda'),
(184, '4000/N02', 3, 'Naing Win'),
(185, '4000/P01', 3, 'Phone Naing'),
(186, '4000/S01', 3, 'Shwe Late'),
(187, '4000/S02', 3, 'Shwe Late (TCL)'),
(188, '4000/S03', 3, 'Soe Min'),
(189, '4000/S04', 3, 'Si Thu (22)'),
(190, '4000/S05', 3, 'Si Thu (22) (TCL)'),
(191, '4000/S06', 3, 'Soe Thein'),
(192, '4000/S07', 3, 'Soe Thein (TCL)'),
(193, '4000/S08', 3, 'Soe Naing'),
(194, '4000/S09', 3, 'Soe Naing (TCL)'),
(195, '4000/T01', 3, 'Thet Paing'),
(196, '4000/T02', 3, 'Thein Htay'),
(197, '4000/T03', 3, 'Thin Thin Yee'),
(198, '4000/T04', 3, 'Thin Thin Yee (TCL)'),
(199, '4000/T05', 3, 'Thet Oo'),
(200, '4000/T06', 3, 'Thar Hla'),
(201, '4000/T07', 3, 'Thaung Tun'),
(202, '4000/T08', 3, 'Than Than Myint'),
(203, '4000/T09', 3, 'Than Than Myint (TCL)'),
(204, '4000/T10', 3, 'Tun Zaw Min (TCL)'),
(205, '4000/W01', 3, 'Win Bo'),
(206, '4000/W02', 3, 'Win Bo (TCL)'),
(207, '4000/Y01', 3, 'Ye Yint'),
(208, '4000/Z01', 3, 'Zaw Zaw Latt'),
(209, '4000/Z02', 3, 'Zaw Zaw Latt (TCL)'),
(210, '4000/S10', 3, 'Shwe Myay'),
(211, '4000/M04', 3, 'Carton Box (Myo Myint Mo Oo)'),
(212, '4000/M05', 3, 'Carton Box (Myanmar HJ)'),
(213, '4000/S11', 3, 'Carton Box (Syan Pyae)'),
(214, '4000/H03', 3, 'Hlaing Htake Khaung'),
(215, '4000/G01', 3, 'GFC');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acname`
--
ALTER TABLE `acname`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acname`
--
ALTER TABLE `acname`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
