-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2023 at 01:08 PM
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
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `password`, `email`, `role`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `acname`
--

CREATE TABLE `acname` (
  `id` int(11) NOT NULL,
  `code_no` varchar(255) NOT NULL,
  `ac_type` int(11) NOT NULL,
  `ac_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(215, '4000/G01', 3, 'GFC'),
(216, '3300/SAF', 5, 'South Asian Food (SAF)'),
(217, '3300/CAN', 5, 'Jamuna Foods (Can)'),
(218, '3300/KLKT', 5, 'Kolkata'),
(219, '3300/UTI', 5, 'Poland (France)'),
(220, '3300/BRN', 5, 'Brunei'),
(221, '3300/SC1', 5, 'Border Trade Technak (SC Trader)'),
(222, '3300/SC2', 5, 'Frozen Account (SC Trader)'),
(223, '3300/SC3', 5, 'SC Apple Account (SC Trader)'),
(224, '3300/SC4', 5, 'SC Fruit Account (SC Trader)'),
(225, '4000/M10', 3, 'Market'),
(226, '4000/K09', 3, 'Kyi Nue Kha');

-- --------------------------------------------------------

--
-- Table structure for table `actualinvoice`
--

CREATE TABLE `actualinvoice` (
  `id` int(11) NOT NULL,
  `commondity_id` varchar(11) NOT NULL,
  `size` varchar(11) NOT NULL,
  `packingkgperbox` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `totalnetweight` varchar(11) NOT NULL,
  `usd` varchar(11) NOT NULL,
  `total_usd` varchar(11) NOT NULL,
  `infoid` int(11) NOT NULL,
  `link_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `actualinvoice`
--

INSERT INTO `actualinvoice` (`id`, `commondity_id`, `size`, `packingkgperbox`, `mc`, `totalnetweight`, `usd`, `total_usd`, `infoid`, `link_id`) VALUES
(8, '1023', '1up', '21', 23, '483', '', '', 1, 8),
(9, '1023', '2up', '22', 23, '506', '', '', 1, 9),
(10, '1033', 'j', '49', 3, '147', '2', '98', 4, 10),
(11, '1015', '9up', '20', 5, '100', '1.95', '39', 5, 11),
(13, '1010', '3up', '20', 5, '100', '2.9', '58', 7, 13),
(14, '1015', '6up', '100', 10, '1000', '2', '40', 8, 14);

-- --------------------------------------------------------

--
-- Table structure for table `actype`
--

CREATE TABLE `actype` (
  `acid` int(11) NOT NULL,
  `ac_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `actype`
--

INSERT INTO `actype` (`acid`, `ac_type`) VALUES
(1, 'Expense'),
(2, 'Sale'),
(3, 'Current Liability'),
(4, 'Capital'),
(5, 'Current Asset');

-- --------------------------------------------------------

--
-- Table structure for table `bankdetail`
--

CREATE TABLE `bankdetail` (
  `id` int(11) NOT NULL,
  `infoid` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_address` varchar(255) NOT NULL,
  `usd` varchar(200) NOT NULL,
  `account_type` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `swift_code` varchar(200) NOT NULL,
  `bank_branch_address` varchar(200) NOT NULL,
  `branch_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bankdetail`
--

INSERT INTO `bankdetail` (`id`, `infoid`, `company_name`, `company_address`, `usd`, `account_type`, `bank_name`, `swift_code`, `bank_branch_address`, `branch_name`) VALUES
(1, 1, 'South Asian Foods', '111 North Bridge Road, #08-26A Peninsula Plaza, Singapore 179098', '123456789', 'payment', 'YOMA', 'sss123', 'North Okkalapa', ''),
(2, 4, 'HMS GLOBAL PTE LTD', '111 North Bridge Road, #08-26A Peninsula Plaza, Singapore 179098', '2.00', 'USD Current  Account', 'United Overseas Bank Ltd (UOB) , Singapore', 'UOVBSGSG', '1 Coleman Street , #01-14 the Adelphi, Singapore 179803', ''),
(3, 5, 'HMS GLOBAL PTE LTD', '111 North Bridge Road, #08-26A Peninsula Plaza, Singapore 179098', '2.00', 'USD Current  Account', 'United Overseas Bank Ltd (UOB) , Singapore', 'UOVBSGSG', '1 Coleman Street , #01-14 the Adelphi, Singapore 179803', '');

-- --------------------------------------------------------

--
-- Table structure for table `cashbook`
--

CREATE TABLE `cashbook` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `sr_no` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `ac_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `particular` text COLLATE utf8_unicode_ci NOT NULL,
  `debit` bigint(20) DEFAULT NULL,
  `credit` bigint(20) DEFAULT NULL,
  `balance` bigint(25) NOT NULL,
  `voucher_no` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_id` varchar(22) COLLATE utf8_unicode_ci NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coldstore`
--

CREATE TABLE `coldstore` (
  `id` int(11) NOT NULL,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `commondity_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `total_kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `day` int(11) NOT NULL,
  `rate` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `container`
--

CREATE TABLE `container` (
  `id` int(11) NOT NULL,
  `container_no` int(11) NOT NULL,
  `country` varchar(20) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `customer_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `customer_address` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_detail`, `customer_address`) VALUES
('3300/BRN', 'Brunei', '', ''),
('3300/CAN', 'Jamuna Foods (Can)', '', ''),
('3300/KLKT', 'Kolkata', '', ''),
('3300/SAF', 'South Asian Food (SAF)', '', ''),
('3300/SC1', 'Border Trade Technak (SC Trader)', '', ''),
('3300/SC2', 'Frozen Account (SC Trader)', '', ''),
('3300/SC3', 'SC Apple Account (SC Trader)', '', ''),
('3300/SC4', 'SC Fruit Account (SC Trader)', '', ''),
('3300/UTI', 'Poland (France)', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `form7stock`
--

CREATE TABLE `form7stock` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `item_id` varchar(11) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `country` varchar(155) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `size` varchar(11) NOT NULL,
  `viss` varchar(11) NOT NULL,
  `kg` varchar(15) NOT NULL,
  `pcspervr` varchar(15) NOT NULL,
  `pcsperf7` int(11) NOT NULL,
  `link_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `form7stock`
--

INSERT INTO `form7stock` (`id`, `date`, `item_id`, `supplier_name`, `country`, `type`, `size`, `viss`, `kg`, `pcspervr`, `pcsperf7`, `link_id`) VALUES
(1, '2023-11-20', '1023', '4000/A01', 'NY', 'frozen', '3up', '209.4', '342.1596', '', 89, 1),
(2, '2023-11-20', '1023', '4000/A01', 'NY', 'frozen', '4up', '357.5', '584.155', '', 79, 2),
(3, '0000-00-00', '1023', '4000/A01', 'NY', 'frozen', '5up', '', '', '', 20, 2),
(4, '0000-00-00', '1023', '4000/A01', 'NY', 'frozen', '6up', '', '', '', 1, 2),
(5, '0000-00-00', '1023', '4000/A01', 'NY', 'frozen', '7up', '', '', '', 1, 2),
(6, '0000-00-00', '1023', '4000/A01', 'NY', 'frozen', '8up', '', '', '', 7, 2),
(7, '0000-00-00', '1023', '4000/A01', 'NY', 'frozen', '10up', '', '', '', 2, 2),
(8, '0000-00-00', '1023', '4000/A01', 'NY', 'frozen', '12up', '', '', '', 4, 2),
(9, '2023-11-30', '1010', '4000/k01', 'NY', 'frozen', '5up', '200', '326.8', '', 10, 3),
(10, '0000-00-00', '1010', '4000/k01', NULL, 'frozen', '6up', '', '', '', 4, 3),
(15, '2023-11-30', '1017', '4000/S01', 'NY', 'frozen', '3up', '100', '163.4', '20', 13, 5),
(16, '0000-00-00', '1017', '4000/S01', 'NY', 'frozen', '5up', '', '', '', 5, 5),
(17, '0000-00-00', '1017', '4000/S01', 'NY', 'frozen', '7up', '', '', '', 2, 5),
(18, '2023-11-28', '1010', '4000/A01', 'NY', 'frozen', '4up', '100', '163.4', '', 20, 0),
(19, '2023-11-30', '1011', '4000/K01', 'NY', 'frozen', '5up', '200', '326.8', '20', 0, 6),
(20, '0000-00-00', '1011', '4000/K01', 'NY', 'frozen', '6up', '', '', '', 5, 6),
(22, '0000-00-00', '1011', '4000/K01', 'NY', 'frozen', '2up', '', '', '', 2, 6),
(23, '2023-08-10', '1033', '4000/M10', 'LM', 'frozen', 'J', '19.86', '32.45124', '', 0, 7),
(24, '2023-01-12', '1037', '4000/A03', 'DAKA', 'tcl', '4up', '100', '163.4', '', 10, 8),
(25, '0000-00-00', '1037', '4000/A03', 'DAKA', 'tcl', '5up', '', '', '', 2, 8),
(27, '2023-12-07', '1010', '4000/K02', 'NY', 'frozen', '4up', '100', '163.4', '', 20, 0),
(28, '2023-12-07', '1015', '4000/K09', 'NY', 'frozen', '6up', '60', '98.04', '20', 20, 10),
(29, '2023-12-07', '1029', '4000/K09', 'DAKA', 'tcl', '9up', '200', '326.8', '', 800, 11),
(30, '2023-12-09', '1010', '4000/A01', 'Japan', 'frozen', '3up', '100', '163.4', '', 20, 12);

-- --------------------------------------------------------

--
-- Table structure for table `form10stock`
--

CREATE TABLE `form10stock` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `item_id` varchar(11) NOT NULL,
  `supplier_id` varchar(20) NOT NULL,
  `country` varchar(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `size` varchar(11) NOT NULL,
  `pcsform10` int(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `pcs` int(11) NOT NULL,
  `looseinkg` varchar(11) NOT NULL,
  `looseinpcs` int(11) NOT NULL,
  `looseoutkg` varchar(11) NOT NULL,
  `looseoutpcs` int(11) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `percentage` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `form10stock`
--

INSERT INTO `form10stock` (`id`, `date`, `item_id`, `supplier_id`, `country`, `type`, `size`, `pcsform10`, `mc`, `kg`, `pcs`, `looseinkg`, `looseinpcs`, `looseoutkg`, `looseoutpcs`, `total_kg`, `percentage`) VALUES
(1, '2023-11-21', '1023', '4000/A01', 'NY', 'frozen', '3up', 89, 14, '327', 84, '23.1', 6, '4.1', 1, '346', ''),
(2, '2023-11-21', '1023', '4000/A01', 'NY', 'frozen', '4up', 79, 16, '379', 80, '18.8', 4, '22.9', 5, '374.9', ''),
(3, '2023-11-21', '1023', '4000/A01', 'NY', 'frozen', '5up', 20, 5, '114', 20, '', 0, '', 0, '114', ''),
(4, '2023-11-21', '1023', '4000/A01', 'NY', 'frozen', '6up', 1, 1, '19', 3, '', 0, '13.2', 2, '5.8', ''),
(5, '2023-11-21', '1023', '4000/A01', 'NY', 'frozen', '7up', 1, 0, '', 0, '7.7', 1, '', 0, '7.7', ''),
(6, '2023-11-21', '1023', '4000/A01', 'NY', 'frozen', '8up', 7, 2, '54', 6, '8.8', 1, '', 0, '62.8', ''),
(7, '2023-11-21', '1023', '4000/A01', 'NY', 'frozen', '10up', 2, 1, '21', 2, '', 0, '', 0, '21', ''),
(8, '2023-11-21', '1023', '4000/A01', 'NY', 'frozen', '12up', 4, 2, '49', 4, '', 0, '', 0, '49', ''),
(9, '2023-11-28', '1010', '4000/A01', 'NY', 'frozen', '4up', 10, 5, '100', 10, '', 5, '', 5, '100', ''),
(10, '2023-11-28', '1010', '4000/K01', 'NY', 'frozen', '4up', 88, 5, '100', 88, '', 5, '', 5, '100', ''),
(11, '2023-08-11', '1033', '4000/M10', 'LM', 'frozen', 'j', 0, 3, '49', 0, '', 0, '15', 0, '34', ''),
(12, '2023-12-01', '1037', '4000/A03', 'DAKA', 'tcl', '4up', 12, 2, '165', 12, '', 0, '', 0, '165', ''),
(13, '2023-12-07', '1015', '4000/K09', 'NY', 'frozen', '6up', 20, 10, '100', 20, '', 0, '', 0, '100', ''),
(14, '2023-12-10', '1023', '4000/A01', 'NY', 'tcl', '9up', 800, 30, '325', 800, '', 0, '', 0, '325', ''),
(15, '2023-12-10', '1029', '4000/K09', 'DAKA', 'tcl', '9up', 800, 30, '325', 800, '', 0, '', 0, '325', ''),
(16, '2023-09-12', '1010', '4000/A01', 'Japan', 'frozen', '3up', 0, 10, '100', 0, '', 0, '', 0, '100', '');

-- --------------------------------------------------------

--
-- Table structure for table `general_ledger`
--

CREATE TABLE `general_ledger` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `voucherno` varchar(25) NOT NULL,
  `ac_code` varchar(25) NOT NULL,
  `debit` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `narration` text NOT NULL,
  `sr_no` varchar(25) NOT NULL,
  `container_no` varchar(25) NOT NULL,
  `bank_charges` float NOT NULL,
  `acid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `general_ledger`
--

INSERT INTO `general_ledger` (`id`, `date`, `voucherno`, `ac_code`, `debit`, `credit`, `balance`, `narration`, `sr_no`, `container_no`, `bank_charges`, `acid`) VALUES
(1, '2023-11-20', '12345', '4000/A01', 0, 566900, -566900, '', '', '', 0, 0),
(2, '2023-11-30', '3313542', '4000/k01', 0, 200000, -200000, '', '', '', 0, 0),
(3, '2023-11-30', '326437437', '4000/A01', 0, 200000, -200000, '', '', '', 0, 0),
(4, '2023-11-30', '244322', '4000/S01', 0, 100000, -100000, '', '', '', 0, 0),
(5, '2023-11-30', '54846', '4000/K01', 0, 600000, -600000, '', '', '', 0, 0),
(6, '2023-08-10', '8765432', '4000/M10', 0, 19860, -19860, '', '', '', 0, 0),
(7, '2023-01-12', '2274', '4000/A03', 0, 200000, -200000, '', '', '', 0, 0),
(8, '2023-12-07', '44435', '4000/K02', 0, 200000, -200000, '', '', '', 0, 0),
(9, '2023-12-07', '7954', '4000/K09', 0, 200000, -200000, '', '', '', 0, 0),
(10, '2023-12-07', '09347', '4000/K09', 0, 400000, -400000, '', '', '', 0, 0),
(11, '2023-12-09', '3455', '4000/A01', 0, 100000, -100000, '', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `gfcdryfishcoldstore`
--

CREATE TABLE `gfcdryfishcoldstore` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `ite` varchar(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `charges` bigint(15) NOT NULL,
  `total_charges` bigint(15) NOT NULL,
  `remark` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gfcdryfishlabour`
--

CREATE TABLE `gfcdryfishlabour` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `ite` varchar(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `charges` bigint(15) NOT NULL,
  `total_charges` bigint(15) NOT NULL,
  `remark` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gfcfishcoldstore`
--

CREATE TABLE `gfcfishcoldstore` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `ite` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `charges` bigint(13) NOT NULL,
  `total_charges` bigint(14) NOT NULL,
  `remark` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gfcfishlabour`
--

CREATE TABLE `gfcfishlabour` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `ite` varchar(12) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `charges` bigint(15) NOT NULL,
  `total_charges` bigint(15) NOT NULL,
  `remark` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gfcmcstock`
--

CREATE TABLE `gfcmcstock` (
  `id` int(11) NOT NULL,
  `country` varchar(19) NOT NULL,
  `particular` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `commondity_id` varchar(11) NOT NULL,
  `size` varchar(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `balance_mc` bigint(17) NOT NULL,
  `loosein_size` varchar(20) NOT NULL,
  `loosein_kg` varchar(20) NOT NULL,
  `loosein_pcs` varchar(20) NOT NULL,
  `looseout_size` varchar(20) NOT NULL,
  `looseout_kg` varchar(20) NOT NULL,
  `looseout_pcs` varchar(20) NOT NULL,
  `remark` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gfcmcstock`
--

INSERT INTO `gfcmcstock` (`id`, `country`, `particular`, `date`, `commondity_id`, `size`, `kg`, `mc`, `balance_mc`, `loosein_size`, `loosein_kg`, `loosein_pcs`, `looseout_size`, `looseout_kg`, `looseout_pcs`, `remark`) VALUES
(1, 'NY', 'HHK To GFC', '2023-11-23', '1023', '3up', '346', 14, 14, '', '', '', '', '', '', ''),
(2, 'NY', 'Ship/123', '2023-11-25', '1023', '3up', '346', 14, 0, '', '', '', '', '', '', ''),
(3, 'NY', 'HHK To GFC', '2023-11-23', '1023', '4up', '374.9', 15, 15, '', '', '', '', '', '', ''),
(4, 'NY', 'Ship/', '2023-11-25', '1023', '4up', '374.9', 15, 0, '', '', '', '1/2', '20', '1', ''),
(5, 'NY', 'HHK To GFC', '2023-12-01', '1023', '4up', '374.9', 1, 1, '', '', '', '', '', '', ''),
(7, 'NY', 'HHK To GFC', '2023-12-01', '1033', '2up', '25', 20, 20, '', '', '', '', '', '', ''),
(8, 'NY', 'HHK To GFC', '2023-12-01', '1033', '2up', '25', 80, 100, '', '', '', '', '', '', ''),
(13, 'LM', 'HHK To GFC', '2023-11-09', '1033', 'j', '49', 1, 1, '', '', '', '', '', '', ''),
(14, 'LM', 'HHK To GFC', '2023-11-09', '1033', 'j', '49', 2, 3, '', '', '', '', '', '', ''),
(15, 'LM', 'Ship/', '2023-12-11', '1033', 'j', '49', 3, 0, '', '', '', '', '', '', ''),
(16, 'NY', 'HHK To GFC', '2023-09-12', '1015', '6up', '100', 5, 5, '', '', '', '', '', '', ''),
(17, 'NY', 'Ship/09797', '2023-12-10', '1015', '6up', '100', 5, 0, '', '', '', '', '', '', ''),
(18, 'NY', 'HHK To GFC', '2023-12-08', '1015', '6up', '100', 4, 4, '', '', '', '', '', '', ''),
(19, 'Japan', 'HHK To GFC', '2023-12-13', '1010', '3up', '100', 5, 5, '', '', '', '', '', '', ''),
(20, 'Japan', 'Ship/', '2023-12-14', '1010', '3up', '100', 5, 0, '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `gfctotal`
--

CREATE TABLE `gfctotal` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `totalfishcoldstorecharges` bigint(15) NOT NULL,
  `totalfishlabourcharges` bigint(15) NOT NULL,
  `totalrepackingcharges` bigint(15) NOT NULL,
  `totaldryfishcoldstorecharges` bigint(15) NOT NULL,
  `totaldryfishlabourcharges` bigint(15) NOT NULL,
  `plugoncharges` bigint(15) NOT NULL,
  `total_charges` bigint(15) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_amount` bigint(15) NOT NULL,
  `balance_amount` bigint(15) NOT NULL,
  `remark` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hhkmcstock`
--

CREATE TABLE `hhkmcstock` (
  `id` int(11) NOT NULL,
  `country` varchar(19) NOT NULL,
  `particular` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `commondity_id` varchar(11) NOT NULL,
  `size` varchar(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `balance_mc` bigint(17) NOT NULL,
  `loosein_size` varchar(20) NOT NULL,
  `loosein_kg` varchar(20) NOT NULL,
  `loosein_pcs` bigint(15) NOT NULL,
  `looseout_size` varchar(20) NOT NULL,
  `looseout_kg` varchar(20) NOT NULL,
  `looseout_pcs` bigint(15) NOT NULL,
  `remark` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hhkmcstock`
--

INSERT INTO `hhkmcstock` (`id`, `country`, `particular`, `date`, `commondity_id`, `size`, `kg`, `mc`, `balance_mc`, `loosein_size`, `loosein_kg`, `loosein_pcs`, `looseout_size`, `looseout_kg`, `looseout_pcs`, `remark`) VALUES
(1, 'NY', 'From From-10', '2023-11-22', '1023', '3up', '346', 14, 14, '', '', 0, '', '', 0, ''),
(2, 'NY', 'HHK To GFC', '2023-11-23', '1023', '3up', '346', 14, 0, '', '', 0, '', '', 0, ''),
(3, 'NY', 'From From-10', '2023-11-22', '1023', '4up', '374.9', 16, 16, '', '', 0, '', '', 0, ''),
(4, 'NY', 'HHK To GFC', '2023-11-23', '1023', '4up', '374.9', 15, 1, '1/2', '20', 1, '', '', 0, ''),
(5, 'NY', 'From From-10', '2023-11-23', '1023', '5up', '21', 20, 20, '', '', 0, '', '', 0, ''),
(6, 'NY', 'From From-10', '2023-11-25', '1023', '5up', '25', 10, 10, '', '', 0, '', '', 0, ''),
(7, 'NY', 'HHK To GFC', '2023-12-01', '1023', '4up', '374.9', 1, 0, '', '', 0, '', '', 0, ''),
(14, 'NY', 'From From-10', '2023-12-01', '1033', '2up', '25', 100, 100, '', '', 0, '', '', 0, ''),
(15, 'NY', 'From From-10', '2023-12-01', '1033', '3up', '20', 30, 30, '', '', 0, '', '', 0, ''),
(16, 'NY', 'HHK To GFC', '2023-12-01', '1033', '2up', '25', 20, 80, '', '', 0, '', '', 0, ''),
(17, 'NY', 'HHK To GFC', '2023-12-01', '1033', '2up', '25', 80, 0, '', '', 0, '', '', 0, ''),
(25, 'LM', 'From From-10', '2023-11-08', '1033', 'j', '49', 3, 3, '', '', 0, '', '', 0, ''),
(26, 'LM', 'HHK To GFC', '2023-11-09', '1033', 'j', '49', 1, 2, '', '', 0, '', '', 0, ''),
(27, 'LM', 'HHK To GFC', '2023-11-09', '1033', 'j', '49', 2, 0, '', '', 0, '', '', 0, ''),
(28, 'NY', 'From From-10', '2023-12-07', '1015', '6up', '100', 9, 9, '', '', 0, '', '', 0, ''),
(29, 'NY', 'HHK To GFC', '2023-09-12', '1015', '6up', '100', 5, 4, '', '', 0, '', '', 0, ''),
(30, 'NY', 'HHK To GFC', '2023-12-08', '1015', '6up', '100', 4, 0, '', '', 0, '', '', 0, ''),
(31, 'Japan', 'From From-10', '2023-12-10', '1010', '3up', '100', 10, 10, '', '', 0, '', '', 0, ''),
(32, 'Japan', 'HHK To GFC', '2023-12-13', '1010', '3up', '100', 5, 5, '', '', 0, '', '', 0, '');

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
  `link_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_costing`
--

CREATE TABLE `invoice_costing` (
  `id` int(11) NOT NULL,
  `commondity_id` varchar(11) NOT NULL,
  `size` varchar(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `priceperviss` varchar(11) NOT NULL,
  `priceperkg` varchar(11) NOT NULL,
  `yield` varchar(11) NOT NULL,
  `total_price` varchar(11) NOT NULL,
  `usd` varchar(11) NOT NULL,
  `packing_material` varchar(11) NOT NULL,
  `ocean_pacific` varchar(11) NOT NULL,
  `tax` varchar(11) NOT NULL,
  `agent` varchar(11) NOT NULL,
  `transport` varchar(11) NOT NULL,
  `total_usd` varchar(11) NOT NULL,
  `sellingpriceperkg` varchar(11) NOT NULL,
  `total_selling_price` varchar(11) NOT NULL,
  `profitorlossperkg` varchar(11) NOT NULL,
  `profit_amount` varchar(11) NOT NULL,
  `total_kg_price` varchar(11) NOT NULL,
  `infoid` int(11) NOT NULL,
  `link_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice_costing`
--

INSERT INTO `invoice_costing` (`id`, `commondity_id`, `size`, `kg`, `priceperviss`, `priceperkg`, `yield`, `total_price`, `usd`, `packing_material`, `ocean_pacific`, `tax`, `agent`, `transport`, `total_usd`, `sellingpriceperkg`, `total_selling_price`, `profitorlossperkg`, `profit_amount`, `total_kg_price`, `infoid`, `link_id`) VALUES
(8, '1023', '1up', '21', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 8),
(9, '1023', '2up', '22', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 9),
(10, '1033', 'j', '49', '1100', '673.1946144', '4.5', '644.2053726', '0.214666666', '0.3', '0.04', '0.3', '0.3', '0.2', '1.354666666', '2', '98', '0.645333334', '31.62133336', '66.37866666', 4, 10),
(11, '1015', '9up', '20', '1100', '673.1946144', '4.5', '644.2053726', '0.214666666', '0.3', '0.04', '0.3', '0.3', '0.2', '1.354666666', '1.95', '39', '0.595333334', '11.90666668', '27.09333333', 5, 11),
(13, '1010', '3up', '20', '1000', '611.9951040', '-38.8', '618.1768727', '0.206', '0.25', '0.4', '0.3', '0.3', '0.2', '1.656', '2.9', '58', '1.244', '24.88', '33.12', 7, 13),
(14, '1015', '6up', '100', '1000', '611.9951040', '4.5', '585.6412478', '0.195', '0.3', '0.4', '0.3', '0.3', '0.2', '1.695', '2', '200', '0.305', '30.5', '169.5', 8, 14);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `item_name`) VALUES
(1001, 'Ayer'),
(1002, 'Boal'),
(1003, 'Bata'),
(1004, 'Baila'),
(1005, 'Batashi'),
(1006, 'Balachaung'),
(1007, 'Black Pomfret'),
(1008, 'Chitol'),
(1009, 'CP'),
(1010, 'D Puti'),
(1011, 'Dry Anchovy'),
(1012, 'Dry Lotia'),
(1013, 'Dry Shoil'),
(1014, 'Grouper'),
(1015, 'Hilsa'),
(1016, 'Kalibouse'),
(1017, 'Katala'),
(1018, 'Keski'),
(1019, 'Koi'),
(1020, 'Koral'),
(1021, 'Lakka'),
(1022, 'Lotia'),
(1023, 'Mrigal (G)'),
(1024, 'Pangush'),
(1025, 'Pujanut'),
(1026, 'Puti'),
(1027, 'Res Snapper'),
(1028, 'Ribbon Fish'),
(1029, 'Rita'),
(1030, 'Shoil'),
(1031, 'Rohu'),
(1032, 'Spanish Mackreal'),
(1033, 'Star Baim'),
(1034, 'Taposhi'),
(1035, 'Tengra'),
(1036, 'Tilapia'),
(1037, 'WP');

-- --------------------------------------------------------

--
-- Table structure for table `labour`
--

CREATE TABLE `labour` (
  `id` int(11) NOT NULL,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `commondity_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `total_kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `rate` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mslcoldstore`
--

CREATE TABLE `mslcoldstore` (
  `id` int(11) NOT NULL,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `item_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `total_kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `day` int(11) NOT NULL,
  `rate` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mslexportcharges`
--

CREATE TABLE `mslexportcharges` (
  `id` int(11) NOT NULL,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `item_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `total_kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `rate` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mslfreezing`
--

CREATE TABLE `mslfreezing` (
  `id` int(11) NOT NULL,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `item_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `total_kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `rate` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mslrepacking`
--

CREATE TABLE `mslrepacking` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) NOT NULL,
  `sheet` int(11) NOT NULL,
  `plastic` varchar(11) NOT NULL,
  `price` varchar(11) NOT NULL,
  `amount` varchar(11) NOT NULL,
  `total_charges` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mslstock`
--

CREATE TABLE `mslstock` (
  `id` int(11) NOT NULL,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `item_id` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `balance` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `msl_total_charges`
--

CREATE TABLE `msl_total_charges` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `item_id` varchar(11) NOT NULL,
  `total_coldstore_charges` bigint(19) NOT NULL,
  `total_freezing_charges` bigint(19) NOT NULL,
  `total_export_charges` bigint(19) NOT NULL,
  `repacking_charges` bigint(19) NOT NULL,
  `ice_charges` bigint(19) NOT NULL,
  `total_charges` bigint(19) NOT NULL,
  `grand_total_charges` bigint(19) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_amount` bigint(19) NOT NULL,
  `balance_amount` bigint(19) NOT NULL,
  `remark` bigint(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `packingliststock`
--

CREATE TABLE `packingliststock` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `customer_id` varchar(11) NOT NULL,
  `country` varchar(11) NOT NULL,
  `invoiceno` varchar(11) NOT NULL,
  `containerno` varchar(11) NOT NULL,
  `vessel_name` varchar(33) NOT NULL,
  `voyname` varchar(55) NOT NULL,
  `fda` varchar(56) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packingliststock`
--

INSERT INTO `packingliststock` (`id`, `date`, `customer_id`, `country`, `invoiceno`, `containerno`, `vessel_name`, `voyname`, `fda`) VALUES
(1, '2023-11-25', '3300/SAF', 'NY', '12345', '123', 'HEHE', 'ac0007', 'abcdefg'),
(2, '2023-11-25', '3300/SAF', 'NY', '112244', 'KND', 'HEHE', 'YOYOYO', 'abcdefg'),
(3, '2023-11-25', '3300/CAN', 'CAN', '12222', 'KND', 'HEHE', 'YOYOYO', 'abcdefg'),
(4, '2023-12-01', '3300/SAF', 'NY', '975Btgt', 'Ac004', 'haha', 'hoho', '12345678'),
(5, '2023-12-20', '3300/BRN', 'NY', '975B2', 'AJ733', 'peter', 'my name is peter', '463465454734'),
(7, '2023-12-14', '3300/BRN', 'Japan', '111111', '21', 'PPPP', '[k[', '12345678'),
(8, '2023-12-18', '3300/UTI', 'NY', 'LMCan-09/20', 'LJ734', 'peter', 'hoho', '234342'),
(9, '2023-12-18', '3300/UTI', 'NY', 'LMCan-09/20', 'LJ734', 'peter', 'hoho', '234342');

-- --------------------------------------------------------

--
-- Table structure for table `packingliststockinfo`
--

CREATE TABLE `packingliststockinfo` (
  `id` int(11) NOT NULL,
  `commondity_id` varchar(11) NOT NULL,
  `size` varchar(11) NOT NULL,
  `packingkgperbox` int(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `totalnetweight` int(11) NOT NULL,
  `totalgrossweight` varchar(11) NOT NULL,
  `usd` varchar(11) NOT NULL,
  `total_usd` varchar(11) NOT NULL,
  `infoid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packingliststockinfo`
--

INSERT INTO `packingliststockinfo` (`id`, `commondity_id`, `size`, `packingkgperbox`, `mc`, `totalnetweight`, `totalgrossweight`, `usd`, `total_usd`, `infoid`) VALUES
(8, '1023', '1up', 21, 23, 483, '506', '', '', 1),
(9, '1023', '2up', 22, 23, 506, '529', '', '', 1),
(10, '1033', 'j', 49, 3, 147, '150', '', '', 4),
(11, '1015', '9up', 20, 5, 100, '105', '', '', 5),
(13, '1010', '3up', 20, 5, 100, '105', '', '', 7),
(14, '1015', '6up', 100, 10, 1000, '1010', '', '', 8);

-- --------------------------------------------------------

--
-- Table structure for table `packingmaterial`
--

CREATE TABLE `packingmaterial` (
  `id` int(11) NOT NULL,
  `commondity_id` varchar(11) NOT NULL,
  `fish_size` varchar(11) NOT NULL,
  `plastic` varchar(11) NOT NULL,
  `jcv` varchar(11) NOT NULL,
  `inner_box` varchar(11) NOT NULL,
  `sticker` varchar(11) NOT NULL,
  `mc_plastic` varchar(11) NOT NULL,
  `carton_box` varchar(11) NOT NULL,
  `tape` int(11) NOT NULL,
  `penon` int(11) NOT NULL,
  `p_sticker` int(11) NOT NULL,
  `plastic_rope` varchar(11) NOT NULL,
  `micellion` int(11) NOT NULL,
  `processing` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `perkgcost` varchar(11) NOT NULL,
  `plastic_size` varchar(11) NOT NULL,
  `pcsperlb` int(11) NOT NULL,
  `pcspermc` int(11) NOT NULL,
  `link_id` int(11) NOT NULL,
  `infoid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packingmaterial`
--

INSERT INTO `packingmaterial` (`id`, `commondity_id`, `fish_size`, `plastic`, `jcv`, `inner_box`, `sticker`, `mc_plastic`, `carton_box`, `tape`, `penon`, `p_sticker`, `plastic_rope`, `micellion`, `processing`, `total`, `perkgcost`, `plastic_size`, `pcsperlb`, `pcspermc`, `link_id`, `infoid`) VALUES
(6, '1023', '1up', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 0, '', '', 0, 0, 8, 1),
(7, '1023', '2up', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 0, '', '', 0, 0, 9, 1),
(8, '1033', 'j', '122.5', '9', '', '36.75', '24.5', '72', 3, 16, 4, '4.571428571', 50, 350, 688, '0.23', '21', 21, 21, 10, 4),
(9, '1015', '9up', '61.25', '9', '', '194.25', '24.5', '72', 3, 16, 4, '4.571428571', 50, 350, 785, '0.26', '333', 222, 111, 11, 5),
(11, '1010', '3up', '183.75', '9', '', '31.5', '24.5', '72', 3, 16, 4, '4.571428571', 50, 350, 744, '0.25', '124', 12, 18, 13, 7),
(12, '1015', '6up', '1634.804804', '9', '', '7777', '24.5', '72', 3, 16, 4, '4.571428571', 50, 350, 9941, '3.31', '222', 333, 4444, 14, 8);

-- --------------------------------------------------------

--
-- Table structure for table `payable`
--

CREATE TABLE `payable` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `supplier_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `purchase_voucher_no` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `purchase_amount` bigint(19) NOT NULL,
  `paid_date` date NOT NULL,
  `paid_voucher` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `paid_amount` bigint(25) NOT NULL,
  `balance` bigint(25) NOT NULL,
  `link_id` int(11) NOT NULL,
  `closing_balance` int(11) NOT NULL,
  `report_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payable`
--

INSERT INTO `payable` (`id`, `date`, `supplier_id`, `purchase_voucher_no`, `purchase_amount`, `paid_date`, `paid_voucher`, `remark`, `paid_amount`, `balance`, `link_id`, `closing_balance`, `report_date`) VALUES
(1, '2023-11-20', '4000/A01', '12345', 209400, '0000-00-00', '', '', 0, 209400, 1, 566900, '2023-12-01'),
(2, '2023-11-20', '4000/A01', '12345', 357500, '0000-00-00', '', '', 0, 566900, 2, 0, '0000-00-00'),
(3, '2023-11-30', '4000/k01', '3313542', 200000, '0000-00-00', '', '', 0, 200000, 3, 800000, '2023-12-01'),
(5, '2023-11-30', '4000/S01', '244322', 100000, '0000-00-00', '', '', 0, 100000, 5, 100000, '2023-12-01'),
(6, '2023-11-30', '4000/K01', '54846', 600000, '0000-00-00', '', '', 0, 800000, 6, 0, '0000-00-00'),
(7, '2023-08-10', '4000/M10', '8765432', 19860, '0000-00-00', '', '', 0, 19860, 7, 19860, '2023-12-01'),
(8, '2023-01-12', '4000/A03', '2274', 200000, '0000-00-00', '', '', 0, 200000, 8, 0, '0000-00-00'),
(10, '2023-12-07', '4000/K09', '7954', 200000, '0000-00-00', '', '', 0, 200000, 10, 0, '0000-00-00'),
(11, '2023-12-07', '4000/K09', '09347', 400000, '0000-00-00', '', '', 0, 600000, 11, 0, '0000-00-00'),
(12, '2023-12-09', '4000/A01', '3455', 100000, '0000-00-00', '', '', 0, 666900, 12, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `role_id`, `permission`) VALUES
(1, 1, 'manage_accounts,manage_role,manage_sale,manage_purchase,manage_cashbook,manage_accountpayable,manage_acpayable,manage_accountreceivable,manage_transactionmanage_general_ledger,manage_customers,manage_supplier,manage_coldstoreitem,manage_item,manage_actype,manage_acname,manage_coldstorecharges,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport,manage_shippmentexport,manage_truckexport,sale_report,purchase_report,payable_report,manage_mcreport,manage_tclmcstock');

-- --------------------------------------------------------

--
-- Table structure for table `processing`
--

CREATE TABLE `processing` (
  `id` int(11) NOT NULL,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `commondity_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `total_kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `rate` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `no` int(11) NOT NULL,
  `date` date NOT NULL,
  `voucher_no` int(11) NOT NULL,
  `supplier_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tclfrozen` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `commodity` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `viss` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `pcs` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`no`, `date`, `voucher_no`, `supplier_id`, `tclfrozen`, `commodity`, `size`, `viss`, `pcs`, `price`, `amount`) VALUES
(1, '2023-11-20', 12345, '4000/A01', 'frozen', '1023', '3up', '209.4', 0, 1000, 209400),
(2, '2023-11-20', 12345, '4000/A01', 'frozen', '1023', '4up', '357.5', 0, 1000, 357500),
(3, '2023-11-30', 3313542, '4000/k01', 'frozen', '1010', '5up', '200', 0, 1000, 200000),
(5, '2023-11-30', 244322, '4000/S01', 'frozen', '1017', '3up', '100', 20, 1000, 100000),
(6, '2023-11-30', 54846, '4000/K01', 'frozen', '1010', '5up', '200', 20, 3000, 600000),
(7, '2023-08-10', 8765432, '4000/M10', 'frozen', '1033', 'J', '19.86', 0, 1000, 19860),
(8, '2023-01-12', 2274, '4000/A03', 'tcl', '1037', '4up', '100', 0, 2000, 200000),
(10, '2023-12-07', 7954, '4000/K09', 'frozen', '1015', '6up', '100', 20, 2000, 200000),
(11, '2023-12-07', 9347, '4000/K09', 'tcl', '1029', '9up', '200', 0, 2000, 400000),
(12, '2023-12-09', 3455, '4000/A01', 'frozen', '1010', '3up', '100', 0, 1000, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `receivable`
--

CREATE TABLE `receivable` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `ac_code` varchar(25) NOT NULL,
  `sr_no` varchar(25) NOT NULL,
  `container_no` varchar(25) NOT NULL,
  `invoice_amount` varchar(25) NOT NULL,
  `paid_date` date NOT NULL,
  `payment_no` varchar(25) NOT NULL,
  `particulars` varchar(255) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `balance` bigint(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `repacking`
--

CREATE TABLE `repacking` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `in_mc` int(10) NOT NULL,
  `in_kg` varchar(10) NOT NULL,
  `out_mc` int(11) NOT NULL,
  `out_kg` varchar(11) NOT NULL,
  `diff_mc` int(11) NOT NULL,
  `diff_kg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `charges` varchar(11) NOT NULL,
  `total_charges` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `repackingout`
--

CREATE TABLE `repackingout` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `outkg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `charges` bigint(15) NOT NULL,
  `total_charges` bigint(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
(1, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `supplier_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL
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
(50, '4000/G01', 'GFC', '', ''),
(51, '4000/M10', 'Market', '', ''),
(52, '4000/K09', 'Kyi Nue Kha', '09234567858', 'djhf jf ');

-- --------------------------------------------------------

--
-- Table structure for table `tclmcstock`
--

CREATE TABLE `tclmcstock` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `item_id` varchar(9) NOT NULL,
  `size` varchar(9) NOT NULL,
  `pcs` int(9) NOT NULL,
  `kg` float NOT NULL,
  `opening_mc` int(11) NOT NULL,
  `form10mc` int(11) NOT NULL,
  `transfer_to_where` varchar(11) NOT NULL,
  `transfer_mc` int(11) NOT NULL,
  `loading_no` int(11) NOT NULL,
  `loading_mc` int(11) NOT NULL,
  `grandtotal_mc` bigint(77) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tclmcstock`
--

INSERT INTO `tclmcstock` (`id`, `date`, `item_id`, `size`, `pcs`, `kg`, `opening_mc`, `form10mc`, `transfer_to_where`, `transfer_mc`, `loading_no`, `loading_mc`, `grandtotal_mc`) VALUES
(3, '2023-12-12', '1037', '4up', 12, 165, 0, 2, 'HHK', 2, 0, 0, 0),
(4, '2023-12-10', '1029', '9up', 800, 325, 0, 30, 'HHK', 10, 302, 20, 0);

-- --------------------------------------------------------

--
-- Table structure for table `total_charges`
--

CREATE TABLE `total_charges` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `commondity_id` int(11) NOT NULL,
  `total_coldstore_charges` bigint(19) NOT NULL,
  `total_labour_charges` bigint(19) NOT NULL,
  `total_processing_charges` bigint(19) NOT NULL,
  `repacking_charges` bigint(19) NOT NULL,
  `ice_charges` bigint(19) NOT NULL,
  `ot_charges` bigint(22) NOT NULL,
  `extra_charges` bigint(20) NOT NULL,
  `total_charges` bigint(19) NOT NULL,
  `grand_total_charges` bigint(19) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_amount` bigint(19) NOT NULL,
  `balance_amount` bigint(19) NOT NULL,
  `remark` text NOT NULL,
  `link_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Table structure for table `truckactualinvoice`
--

CREATE TABLE `truckactualinvoice` (
  `id` int(11) NOT NULL,
  `item_id` varchar(24) NOT NULL,
  `size` varchar(24) NOT NULL,
  `pcsperbox` bigint(20) NOT NULL,
  `kgperbox` float NOT NULL,
  `mc` bigint(20) NOT NULL,
  `netweight` float NOT NULL,
  `usd` float NOT NULL,
  `total_usd` float NOT NULL,
  `invoice_no` varchar(15) NOT NULL,
  `link_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `truckactualinvoice`
--

INSERT INTO `truckactualinvoice` (`id`, `item_id`, `size`, `pcsperbox`, `kgperbox`, `mc`, `netweight`, `usd`, `total_usd`, `invoice_no`, `link_id`) VALUES
(1, '1023', '3up', 100, 100, 10, 1000, 8, 800, 'MOP001', 1),
(5, '1023', '2up', 100, 100, 20, 2000, 120, 12000, 'AS121', 5),
(6, '1029', '6up', 20, 300, 10, 3000, 130, 39000, '6767', 6);

-- --------------------------------------------------------

--
-- Table structure for table `truckdeclare`
--

CREATE TABLE `truckdeclare` (
  `id` int(11) NOT NULL,
  `item_id` varchar(24) NOT NULL,
  `size` varchar(24) NOT NULL,
  `pcsperbox` bigint(20) NOT NULL,
  `kgperbox` float NOT NULL,
  `mc` bigint(20) NOT NULL,
  `netweight` float NOT NULL,
  `invoice_no` varchar(15) NOT NULL,
  `link_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `truckdeclare`
--

INSERT INTO `truckdeclare` (`id`, `item_id`, `size`, `pcsperbox`, `kgperbox`, `mc`, `netweight`, `invoice_no`, `link_id`) VALUES
(1, '1023', '3up', 100, 0, 10, 0, 'MOP001', 1),
(5, '1023', '2up', 100, 200, 20, 4000, 'AS121', 5),
(6, '1029', '6up', 20, 250, 10, 2500, '6767', 6);

-- --------------------------------------------------------

--
-- Table structure for table `truckfoambox`
--

CREATE TABLE `truckfoambox` (
  `id` int(11) NOT NULL,
  `item_id` varchar(24) NOT NULL,
  `size` varchar(24) NOT NULL,
  `pcsperbox` bigint(20) NOT NULL,
  `kgperbox` float NOT NULL,
  `mc` bigint(20) NOT NULL,
  `netweight` float NOT NULL,
  `foambox_no` varchar(225) NOT NULL,
  `total_foambox_no` varchar(255) NOT NULL,
  `invoice_no` varchar(15) DEFAULT NULL,
  `link_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `truckfoambox`
--

INSERT INTO `truckfoambox` (`id`, `item_id`, `size`, `pcsperbox`, `kgperbox`, `mc`, `netweight`, `foambox_no`, `total_foambox_no`, `invoice_no`, `link_id`) VALUES
(1, '1023', '3up', 100, 100, 10, 1000, '', '', 'MOP001', 1),
(5, '1023', '2up', 100, 100, 20, 2000, '1,2,3,11,22,33,44,55', '8', 'AS121', 5),
(6, '1029', '6up', 20, 300, 10, 3000, '1,2,3,4,5,6,7,8,9,10', '10', '6767', 6);

-- --------------------------------------------------------

--
-- Table structure for table `truckpackingliststock`
--

CREATE TABLE `truckpackingliststock` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `invoice_no` varchar(11) NOT NULL,
  `truck_no` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `truckpackingliststock`
--

INSERT INTO `truckpackingliststock` (`id`, `date`, `invoice_no`, `truck_no`) VALUES
(1, '2023-11-25', 'MOP001', '31'),
(3, '2023-12-14', 'AS121', '40'),
(4, '2023-12-12', '6767', '5964');

-- --------------------------------------------------------

--
-- Table structure for table `truckpackingliststockinfo`
--

CREATE TABLE `truckpackingliststockinfo` (
  `id` int(11) NOT NULL,
  `item_id` varchar(11) NOT NULL,
  `size` varchar(11) NOT NULL,
  `pcsperbox` int(11) NOT NULL,
  `kgperbox` float NOT NULL,
  `mc` int(11) NOT NULL,
  `netweight` float NOT NULL,
  `totalgrossweight` float NOT NULL,
  `invoice_no` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `truckpackingliststockinfo`
--

INSERT INTO `truckpackingliststockinfo` (`id`, `item_id`, `size`, `pcsperbox`, `kgperbox`, `mc`, `netweight`, `totalgrossweight`, `invoice_no`) VALUES
(1, '1023', '3up', 100, 100, 10, 1000, 600, 'MOP001'),
(5, '1023', '2up', 100, 100, 20, 2000, 1200, 'AS121'),
(6, '1029', '6up', 20, 300, 10, 3000, 600, '6767');

-- --------------------------------------------------------

--
-- Table structure for table `truckpackingmaterial`
--

CREATE TABLE `truckpackingmaterial` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `remark` varchar(255) NOT NULL,
  `ice` int(11) NOT NULL,
  `miscellous` bigint(17) NOT NULL,
  `tape` bigint(19) NOT NULL,
  `foam_box` bigint(19) NOT NULL,
  `plastic` bigint(19) NOT NULL,
  `total_charges` bigint(19) NOT NULL,
  `total_viss` bigint(19) NOT NULL,
  `form10kg` float NOT NULL,
  `costperkg` float NOT NULL,
  `invoice_no` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `truckpackingmaterial`
--

INSERT INTO `truckpackingmaterial` (`id`, `date`, `remark`, `ice`, `miscellous`, `tape`, `foam_box`, `plastic`, `total_charges`, `total_viss`, `form10kg`, `costperkg`, `invoice_no`) VALUES
(2, '2023-12-10', 'Hilsa Marical', 25, 30, 23, 10, 22, 110, 0, 600, 0.183333, 'AS121'),
(3, '2023-12-12', 'hello', 100, 50, 100, 200, 200, 650, 0, 200, 3.25, '6767');

-- --------------------------------------------------------

--
-- Table structure for table `trucktotalcosting`
--

CREATE TABLE `trucktotalcosting` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `item_id` varchar(11) NOT NULL,
  `size` varchar(11) NOT NULL,
  `total_kg` float NOT NULL,
  `priceperviss` float NOT NULL,
  `priceperkg` float NOT NULL,
  `percentage` float NOT NULL,
  `packing_charges` int(11) NOT NULL,
  `ygntomt_charges` int(11) NOT NULL,
  `mttotechnck_charges` int(11) NOT NULL,
  `labour_charges` int(11) NOT NULL,
  `packingandtransport` int(11) NOT NULL,
  `total` float NOT NULL,
  `grand_total` float NOT NULL,
  `rate` int(11) NOT NULL,
  `costing_usd` float NOT NULL,
  `selling_rate` int(11) NOT NULL,
  `profitperkg` float NOT NULL,
  `original_cost` float NOT NULL,
  `selling_amount` float NOT NULL,
  `profit` float NOT NULL,
  `invoice_no` varchar(11) NOT NULL,
  `link_id` int(11) NOT NULL,
  `infoid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trucktotalcosting`
--

INSERT INTO `trucktotalcosting` (`id`, `date`, `item_id`, `size`, `total_kg`, `priceperviss`, `priceperkg`, `percentage`, `packing_charges`, `ygntomt_charges`, `mttotechnck_charges`, `labour_charges`, `packingandtransport`, `total`, `grand_total`, `rate`, `costing_usd`, `selling_rate`, `profitperkg`, `original_cost`, `selling_amount`, `profit`, `invoice_no`, `link_id`, `infoid`) VALUES
(1, '0000-00-00', '1023', '3up', 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 0, 800, 800, 'MOP001', 1, 0),
(4, '0000-00-00', '1023', '2up', 100, 1100, 673.195, 686.933, 0, 100000, 150000, 100000, 350000, 300000, 300687, 3000, 100.229, 120, 19.771, 10022.9, 12000, 1977.1, 'AS121', 5, 3),
(5, '0000-00-00', '1029', '6up', 300, 1000, 611.995, 624.485, 3, 20000, 250000, 100000, 370003, 350000, 350624, 3000, 116.875, 130, 13.125, 35062.5, 39000, 3937.5, '6767', 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `userlogs`
--

CREATE TABLE `userlogs` (
  `id` int(11) NOT NULL,
  `login_time` time(6) NOT NULL,
  `login_date` date NOT NULL,
  `login_username` varchar(125) NOT NULL,
  `login_password` varchar(125) NOT NULL,
  `status` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userlogs`
--

INSERT INTO `userlogs` (`id`, `login_time`, `login_date`, `login_username`, `login_password`, `status`) VALUES
(1, '01:09:54.000000', '2023-11-28', 'admin', 'admin', 'Login Success'),
(2, '01:19:21.000000', '2023-11-28', 'admin', 'admin', 'Login Success'),
(3, '11:14:10.000000', '2023-11-29', 'admin', 'admin', 'Login Success'),
(4, '04:03:23.000000', '2023-11-29', 'admin', 'admin', 'Login Success'),
(5, '12:15:20.000000', '2023-11-30', 'admin', 'admin', 'Login Success'),
(6, '02:32:56.000000', '2023-11-30', 'admin', 'admin', 'Login Success'),
(7, '10:00:44.000000', '2023-12-01', 'admin', 'admin', 'Login Success'),
(8, '12:25:17.000000', '2023-12-01', 'admin', 'admin', 'Login Success'),
(9, '12:31:49.000000', '2023-12-01', 'admin', 'admi ', 'Login Password Invalid'),
(10, '12:32:32.000000', '2023-12-01', 'admin', 'admin', 'Login Success'),
(11, '01:58:13.000000', '2023-12-01', 'admin', 'admin', 'Login Success'),
(12, '04:22:12.000000', '2023-12-01', 'admin', 'adimin', 'Login Password Invalid'),
(13, '04:22:24.000000', '2023-12-01', 'admin', 'admin', 'Login Success'),
(14, '11:03:23.000000', '2023-12-04', 'admin', 'admin', 'Login Success'),
(15, '12:41:20.000000', '2023-12-07', 'admin', 'admin', 'Login Success'),
(16, '01:46:24.000000', '2023-12-07', 'admin', 'admin', 'Login Success'),
(17, '04:04:56.000000', '2023-12-07', 'admin', 'admin', 'Login Success'),
(18, '04:28:18.000000', '2023-12-08', 'admin', 'admin', 'Login Success');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acname`
--
ALTER TABLE `acname`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `actualinvoice`
--
ALTER TABLE `actualinvoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `actype`
--
ALTER TABLE `actype`
  ADD PRIMARY KEY (`acid`);

--
-- Indexes for table `bankdetail`
--
ALTER TABLE `bankdetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cashbook`
--
ALTER TABLE `cashbook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coldstore`
--
ALTER TABLE `coldstore`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `container`
--
ALTER TABLE `container`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `form7stock`
--
ALTER TABLE `form7stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form10stock`
--
ALTER TABLE `form10stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_ledger`
--
ALTER TABLE `general_ledger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gfcdryfishcoldstore`
--
ALTER TABLE `gfcdryfishcoldstore`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gfcdryfishlabour`
--
ALTER TABLE `gfcdryfishlabour`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gfcfishcoldstore`
--
ALTER TABLE `gfcfishcoldstore`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gfcfishlabour`
--
ALTER TABLE `gfcfishlabour`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gfcmcstock`
--
ALTER TABLE `gfcmcstock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gfctotal`
--
ALTER TABLE `gfctotal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hhkmcstock`
--
ALTER TABLE `hhkmcstock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hhkstock`
--
ALTER TABLE `hhkstock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_costing`
--
ALTER TABLE `invoice_costing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `labour`
--
ALTER TABLE `labour`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mslcoldstore`
--
ALTER TABLE `mslcoldstore`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mslexportcharges`
--
ALTER TABLE `mslexportcharges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mslfreezing`
--
ALTER TABLE `mslfreezing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mslrepacking`
--
ALTER TABLE `mslrepacking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mslstock`
--
ALTER TABLE `mslstock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `msl_total_charges`
--
ALTER TABLE `msl_total_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packingliststock`
--
ALTER TABLE `packingliststock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packingliststockinfo`
--
ALTER TABLE `packingliststockinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packingmaterial`
--
ALTER TABLE `packingmaterial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payable`
--
ALTER TABLE `payable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `processing`
--
ALTER TABLE `processing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `receivable`
--
ALTER TABLE `receivable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repacking`
--
ALTER TABLE `repacking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repackingout`
--
ALTER TABLE `repackingout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tclmcstock`
--
ALTER TABLE `tclmcstock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `total_charges`
--
ALTER TABLE `total_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `truckactualinvoice`
--
ALTER TABLE `truckactualinvoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `truckdeclare`
--
ALTER TABLE `truckdeclare`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `truckfoambox`
--
ALTER TABLE `truckfoambox`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `truckpackingliststock`
--
ALTER TABLE `truckpackingliststock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `truckpackingliststockinfo`
--
ALTER TABLE `truckpackingliststockinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `truckpackingmaterial`
--
ALTER TABLE `truckpackingmaterial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trucktotalcosting`
--
ALTER TABLE `trucktotalcosting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlogs`
--
ALTER TABLE `userlogs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `acname`
--
ALTER TABLE `acname`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT for table `actualinvoice`
--
ALTER TABLE `actualinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `actype`
--
ALTER TABLE `actype`
  MODIFY `acid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `bankdetail`
--
ALTER TABLE `bankdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cashbook`
--
ALTER TABLE `cashbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coldstore`
--
ALTER TABLE `coldstore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `container`
--
ALTER TABLE `container`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form7stock`
--
ALTER TABLE `form7stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `form10stock`
--
ALTER TABLE `form10stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `general_ledger`
--
ALTER TABLE `general_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `gfcdryfishcoldstore`
--
ALTER TABLE `gfcdryfishcoldstore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gfcdryfishlabour`
--
ALTER TABLE `gfcdryfishlabour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gfcfishcoldstore`
--
ALTER TABLE `gfcfishcoldstore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gfcfishlabour`
--
ALTER TABLE `gfcfishlabour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gfcmcstock`
--
ALTER TABLE `gfcmcstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `gfctotal`
--
ALTER TABLE `gfctotal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hhkmcstock`
--
ALTER TABLE `hhkmcstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `hhkstock`
--
ALTER TABLE `hhkstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_costing`
--
ALTER TABLE `invoice_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1038;

--
-- AUTO_INCREMENT for table `labour`
--
ALTER TABLE `labour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mslcoldstore`
--
ALTER TABLE `mslcoldstore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mslexportcharges`
--
ALTER TABLE `mslexportcharges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mslfreezing`
--
ALTER TABLE `mslfreezing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mslrepacking`
--
ALTER TABLE `mslrepacking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mslstock`
--
ALTER TABLE `mslstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `msl_total_charges`
--
ALTER TABLE `msl_total_charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packingliststock`
--
ALTER TABLE `packingliststock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `packingliststockinfo`
--
ALTER TABLE `packingliststockinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `packingmaterial`
--
ALTER TABLE `packingmaterial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payable`
--
ALTER TABLE `payable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `processing`
--
ALTER TABLE `processing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `receivable`
--
ALTER TABLE `receivable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `repacking`
--
ALTER TABLE `repacking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `repackingout`
--
ALTER TABLE `repackingout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `tclmcstock`
--
ALTER TABLE `tclmcstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `total_charges`
--
ALTER TABLE `total_charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `truckactualinvoice`
--
ALTER TABLE `truckactualinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `truckdeclare`
--
ALTER TABLE `truckdeclare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `truckfoambox`
--
ALTER TABLE `truckfoambox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `truckpackingliststock`
--
ALTER TABLE `truckpackingliststock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `truckpackingliststockinfo`
--
ALTER TABLE `truckpackingliststockinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `truckpackingmaterial`
--
ALTER TABLE `truckpackingmaterial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trucktotalcosting`
--
ALTER TABLE `trucktotalcosting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `userlogs`
--
ALTER TABLE `userlogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
