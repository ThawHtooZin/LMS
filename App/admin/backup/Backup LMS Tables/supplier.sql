-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2023 at 06:06 AM
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
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `supplier_id` varchar(255) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `supplier_phone` varchar(255) NOT NULL,
  `supplier_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `supplier_id`, `supplier_name`, `supplier_phone`, `supplier_address`) VALUES
(1, '4000/001', '4 Zaw', '', ''),
(2, '4000/002', '4 Zaw (TCL)', '', ''),
(3, '4000/A01', 'AK', '', ''),
(4, '4000/A02', 'Arr Kae', '', ''),
(5, '4000/A03', 'Aung Naing Oo', '', ''),
(6, '4000/B01', 'Bar Bu Lay', '', ''),
(7, '4000/C01', 'Chit Oo (D51)', '', ''),
(8, '4000/H01', 'Htet Aung Lin', '', ''),
(9, '4000/H02', 'Htay Win', '', ''),
(10, '4000/K01', 'Kyaw Zay Ya (TCL)', '', ''),
(11, '4000/K02', 'Kyaw Zin', '', ''),
(12, '4000/K03', 'KTO', '', ''),
(13, '4000/K04', 'Kaung Myat', '', ''),
(14, '4000/L01', 'Lie Chit', '', ''),
(15, '4000/M01', 'M.A', '', ''),
(16, '4000/M02', 'Maung Soe', '', ''),
(17, '4000/M03', 'Mg Mg Nyunt', '', ''),
(18, '4000/N01', 'Nanda', '', ''),
(19, '4000/N02', 'Naing Win', '', ''),
(20, '4000/P01', 'Phone Naing', '', ''),
(21, '4000/S01', 'Shwe Late', '', ''),
(22, '4000/S02', 'Shwe Late (TCL)', '', ''),
(23, '4000/S03', 'Soe Min', '', ''),
(24, '4000/S04', 'Si Thu (22)', '', ''),
(25, '4000/S05', 'Si Thu (22) (TCL)', '', ''),
(26, '4000/S06', 'Soe Thein', '', ''),
(27, '4000/S07', 'Soe Thein (TCL)', '', ''),
(28, '4000/S08', 'Soe Naing', '', ''),
(29, '4000/S09', 'Soe Naing (TCL)', '', ''),
(30, '4000/T01', 'Thet Paing', '', ''),
(31, '4000/T02', 'Thein Htay', '', ''),
(32, '4000/T03', 'Thin Thin Yee', '', ''),
(33, '4000/T04', 'Thin Thin Yee (TCL)', '', ''),
(34, '4000/T05', 'Thet Oo', '', ''),
(35, '4000/T06', 'Thar Hla', '', ''),
(36, '4000/T07', 'Thaung Tun', '', ''),
(37, '4000/T08', 'Than Than Myint', '', ''),
(38, '4000/T09', 'Than Than Myint (TCL)', '', ''),
(39, '4000/T10', 'Tun Zaw Min (TCL)', '', ''),
(40, '4000/W01', 'Win Bo', '', ''),
(41, '4000/W02', 'Win Bo (TCL)', '', ''),
(42, '4000/Y01', 'Ye Yint', '', ''),
(43, '4000/Z01', 'Zaw Zaw Latt', '', ''),
(44, '4000/Z02', 'Zaw Zaw Latt (TCL)', '', ''),
(45, '4000/S10', 'Shwe Myay', '', ''),
(46, '4000/M04', 'Carton Box (Myo Myint Mo Oo)', '', ''),
(47, '4000/M05', 'Carton Box (Myanmar HJ)', '', ''),
(48, '4000/S11', 'Carton Box (Syan Pyae)', '', ''),
(49, '4000/H03', 'Hlaing Htake Khaung', '', ''),
(50, '4000/G01', 'GFC', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
