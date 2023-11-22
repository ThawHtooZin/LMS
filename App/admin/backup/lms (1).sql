-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2023 at 08:38 AM
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
(18, 'admin', 'admin', 'admin@gmail.com', 1);

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
(77, '4000/T01', 28, 'Thaing Gi'),
(78, '4000/B01', 28, 'Bo Bo Lwin'),
(79, '4000/A01', 28, 'Aung Aung '),
(80, '4000/K01', 28, 'Kyi Sin'),
(81, '4000/P01', 28, 'Parti'),
(83, '3300/002', 29, 'CANADA'),
(84, '3300/003', 29, 'DAKA'),
(85, '3300/004', 29, 'BRUNAI'),
(86, '3300/005', 29, 'JAPAN'),
(87, '9100/000', 31, 'Administration '),
(88, '9100/001', 31, 'Staff Salary'),
(89, '9100/002', 31, 'Transportation'),
(90, '9100/003', 31, 'Diesel & Petrol '),
(91, '9100/004', 31, 'Food & Refreshment'),
(92, '3600/001', 29, 'Main Cash'),
(93, '5000/001', 30, 'Revenue'),
(97, '4000/M01', 28, 'MgMg'),
(101, '3300/001', 29, 'USA'),
(102, '3300/006', 29, 'jamuna');

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
(22, '1', '2up', '20', 30, '600', '0', '0', 8, 29),
(23, '1', '3up', '23', 30, '690', '0', '0', 8, 30),
(24, '1', '5up', '23', 30, '690', '', '', 8, 31),
(25, '1', '3up', '22', 23, '506', '', '', 8, 32),
(26, '1', '2up', '23', 43, '989', '0', '0', 8, 33),
(27, '2', '3up', '21', 23, '483', '0', '0', 8, 34),
(28, '2', '4up', '22', 29, '638', '', '', 8, 35),
(30, '7', '2up', '21', 32, '672', '', '', 8, 37),
(31, '1', '2up', '20', 30, '600', '2.00', '1200', 9, 38),
(32, '7', '3up', '22', 43, '946', '', '', 9, 39),
(33, '1', '3up', '22', 43, '946', '', '', 9, 40);

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
(28, 'Current Liability'),
(29, 'Current Asset'),
(30, 'Sale'),
(31, 'Expense'),
(32, 'Capital'),
(33, 'Long Term Liability');

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

--
-- Dumping data for table `cashbook`
--

INSERT INTO `cashbook` (`id`, `date`, `sr_no`, `ac_name`, `particular`, `debit`, `credit`, `balance`, `voucher_no`) VALUES
(143, '2023-11-09', '', '3600/001', 'asdfasdf', 0, 100000, -100000, 'A0001'),
(145, '2023-11-09', '', '3600/001', 'GET PAID BABY', 270000, 0, 170000, 'A0005'),
(147, '2023-11-09', '', '3600/001', 'HEHE', 0, 10000, 160000, 'D0001'),
(149, '2023-11-09', '', '3600/001', 'paid to Kyi Sin', 0, 20000, 140000, 'B0001');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_id` varchar(22) COLLATE utf8_unicode_ci NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_id`, `category_name`) VALUES
(7, '1', 'Fish'),
(8, '2', 'IQF'),
(9, '3', 'Block'),
(10, '4', 'Pujanut');

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

--
-- Dumping data for table `coldstore`
--

INSERT INTO `coldstore` (`id`, `indate`, `outdate`, `commondity_id`, `mc`, `total_mc`, `kg`, `total_kg`, `day`, `rate`, `charges`, `total_charges`) VALUES
(109, '2023-11-01', '2023-11-02', '1', 10, 10, '90', '90', 2, '3', 540, 540);

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

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `dollar_rate`, `debitorcredit`, `mmk_amount`, `usd_amount`, `voucher_no`) VALUES
(311, 0, 'debit', 100000, 0, 'A0001'),
(312, 0, 'credit', 100000, 0, 'A0001'),
(313, 3000, 'debit', 300000, 100, 'A0002'),
(314, 3000, 'credit', 300000, 100, 'A0002'),
(317, 3000, 'debit', 300000, 100, 'A0005'),
(318, 3000, 'credit', 300000, 100, 'A0005'),
(319, 0, 'debit', 20000, 0, 'B0001'),
(320, 0, 'credit', 20000, 0, 'B0001'),
(321, 0, 'debit', 10000, 0, 'D0001'),
(322, 0, 'credit', 10000, 0, 'D0001');

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
('3300/001', 'USA', '', ''),
('3300/002', 'CANADA', '', ''),
('3300/003', 'DAKA', '', ''),
('3300/004', 'BRUNAI', '\r\n', ''),
('3300/005', 'JAPAN', '\r\n', ''),
('3300/006', 'jamuna', 'importer & whsaler', 'can');

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
(161, '2023-11-01', '3', '4000/T01', 'NY', 'frozen', '2up', '100', '163.4', '', 50, 152),
(162, '2023-11-01', '2', '4000/T01', NULL, 'frozen', '3up', '100', '163.4', '', 0, 153),
(163, '2023-11-01', '4', '4000/T01', NULL, 'frozen', '4up', '50', '81.7', '', 0, 154),
(164, '2023-11-01', '5', '4000/P01', NULL, 'frozen', '2up', '50', '81.7', '', 0, 155),
(165, '2023-11-01', '1', '4000/P01', 'NY', 'frozen', '2up', '100', '163.4', '', 10, 156),
(166, '0000-00-00', '3', '4000/T01', 'NY', 'frozen', '3up', '', '', '', 11, 152),
(167, '0000-00-00', '3', '4000/T01', 'NY', 'frozen', '4up', '', '', '', 11, 152),
(168, '0000-00-00', '1', '4000/P01', 'NY', 'frozen', '1up', '', '', '', 5, 156),
(169, '0000-00-00', '1', '4000/P01', 'NY', 'frozen', '3up', '', '', '', 2, 156),
(172, '2023-11-02', '1', '4000/K01', NULL, 'frozen', '2up', '100', '163.4', '', 0, 159),
(173, '2023-11-02', '5', '4000/A01', NULL, 'frozen', '3up', '100', '163.4', '', 0, 160),
(175, '2023-11-05', '7', '4000/A01', 'Can', 'frozen', '2up', '100', '163.4', '', 21, 162);

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
(70, '2023-11-09', '1', '4000/A01', 'DAKA', 'tcl', '2up', 100, 100, '900', 100, '', 0, '', 0, '900', ''),
(71, '2023-11-09', '2', '4000/A01', 'DAKA', 'tcl', '4up', 100, 100, '900', 100, '', 0, '', 0, '900', ''),
(72, '2023-11-01', '1', '4000/P01', 'NY', 'frozen', '2up', 19, 20, '60', 18, '3', 1, '', 0, '63', ''),
(73, '2023-11-01', '1', '4000/P01', 'NY', 'frozen', '1up', 5, 20, '120', 5, '', 0, '', 0, '120', ''),
(74, '2023-11-01', '1', '4000/P01', 'NY', 'frozen', '3up', 4, 6, '12', 4, '', 0, '', 0, '12', ''),
(75, '2023-11-10', '7', '4000/A01', 'Can', 'frozen', '2up', 20, 12, '150', 20, '', 0, '', 0, '150', '');

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
(724, '2023-11-02', '8013', '4000/K01', 0, 100000, -100000, '', '', '', 0, 0),
(725, '2023-11-02', '3524', '4000/A01', 0, 220000, -220000, '', '', '', 0, 0),
(726, '2023-11-09', 'A0001', '4000/P01', 100000, 0, 100000, 'IDK', '', '', 0, 28),
(727, '2023-11-09', 'A0001', '3600/001', 0, 100000, -100000, 'asdfasdf', '', '', 0, 29),
(728, '2023-11-09', 'A0002', '3300/001', 300000, 0, 300000, 'SALEE', 'uuoop', 'ac-321', 0, 29),
(729, '2023-11-09', 'A0002', '5000/001', 0, 300000, -300000, 'SALEE', '', '', 0, 30),
(730, '2023-11-09', 'A0005', '3600/001', 270000, 0, 170000, 'GET PAID BABY', '', '', 10, 29),
(731, '2023-11-09', 'A0005', '3300/001', 0, 300000, 0, 'PAID U ', 'hehe', 'ac-323', 0, 29),
(734, '2023-11-09', 'D0001', '4000/K01', 10000, 0, -40000, 'HEHE', '', '', 0, 28),
(735, '2023-11-09', 'D0001', '3600/001', 0, 10000, 110000, 'HEHE', '', '', 0, 29),
(738, '2023-11-09', 'B0001', '4000/K01', 20000, 0, -20000, 'paid to supplier', '', '', 0, 28),
(739, '2023-11-09', 'B0001', '3600/001', 0, 20000, 90000, 'paid to Kyi Sin', '', '', 0, 29),
(740, '2023-11-01', '1710', '4000/B01', 0, 0, 0, '', '', '', 0, 0),
(741, '2023-11-05', '111111', '4000/A01', 0, 2100000, -2100000, '', '', '', 0, 0);

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

--
-- Dumping data for table `gfcfishcoldstore`
--

INSERT INTO `gfcfishcoldstore` (`id`, `date`, `ite`, `mc`, `total_mc`, `kg`, `total_kg`, `rate`, `charges`, `total_charges`, `remark`) VALUES
(399, '2023-11-01', 'balance', 100, 100, '900', '900', '1.5', 1350, 1350, ''),
(400, '2023-11-01', 'export', 10, 90, '90', '810', '1.5', 0, 0, ''),
(401, '2023-11-02', 'export', 40, 50, '360', '450', '1.5', 675, 2025, ''),
(406, '2023-11-03', 'balance', 0, 50, '', '450', '1.5', 675, 2700, '');

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

--
-- Dumping data for table `gfcfishlabour`
--

INSERT INTO `gfcfishlabour` (`id`, `date`, `ite`, `kg`, `rate`, `charges`, `total_charges`, `remark`) VALUES
(292, '2023-11-01', 'export', '90', '3', 270, 270, ''),
(293, '2023-11-02', 'export', '360', '3', 1080, 1350, '');

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
(36, 'DAKA', 'HHK To GFC', '2023-11-02', '1', '1up', '100', 50, 50, '', '', '', '', '', '', ''),
(37, 'NY', 'HHK To GFC', '2023-11-02', '2', '2up', '20', 20, 20, '', '', '', '', '', '', ''),
(38, 'NY', 'Ship/009', '2023-11-05', '2', '2up', '20', 20, 0, '', '', '', '', '', '', '');

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
(151, 'DAKA', 'From From-10', '2023-11-13', '1', '1up', '100', 100, 100, '', '', 0, '', '', 0, ''),
(157, 'DAKA', 'HHK To GFC', '2023-11-02', '1', '1up', '100', 50, 50, '', '', 0, '', '', 0, ''),
(158, 'NY', 'From From-10', '2023-11-01', '2', '2up', '20', 100, 100, '', '', 0, '', '', 0, ''),
(159, 'NY', 'HHK To GFC', '2023-11-02', '2', '2up', '20', 20, 80, '', '', 0, '', '', 0, ''),
(160, 'NY', 'From From-10', '2023-11-03', '2', '3up', '21', 52, 52, '', '', 0, '', '', 0, ''),
(161, 'NY', 'From From-10', '2023-11-04', '2', '3up', '25', 26, 26, '', '', 0, '', '', 0, '');

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

--
-- Dumping data for table `hhkstock`
--

INSERT INTO `hhkstock` (`id`, `indate`, `outdate`, `commondity_id`, `mc`, `total_mc`, `kg`, `total_kg`, `balance`, `link_id`) VALUES
(43, '2023-11-01', '0000-00-00', '1', 500, 500, '4500', '4500', '900', 0),
(48, '0000-00-00', '2023-11-02', '1', 10, 490, '90', '4410', '-2700', 109);

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
(12, '1', '2up', '20', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 8, 29),
(13, '1', '3up', '23', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 8, 30),
(14, '1', '5up', '23', '1100', '673.1946144', '4.5', '644.2053726', '0.214666666', '0.3', '0.04', '0.3', '0.3', '0.2', '1.354666666', '', '', '', '', '31.15733333', 8, 31),
(15, '1', '3up', '22', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 8, 32),
(16, '1', '2up', '23', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 8, 33),
(17, '2', '3up', '21', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '0', 8, 34),
(18, '2', '4up', '22', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '0', 8, 35),
(20, '7', '2up', '21', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 8, 37),
(21, '1', '2up', '20', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 9, 38),
(22, '7', '3up', '22', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 9, 39),
(23, '1', '3up', '22', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 9, 40);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `item_id` varchar(22) COLLATE utf8_unicode_ci NOT NULL,
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `item_id`, `item_name`) VALUES
(14, '1', 'Hilsa'),
(15, '2', 'D Puti'),
(16, '3', 'Rohu'),
(17, '4', 'Koral'),
(18, '5', 'Baby Koral'),
(19, '6', 'Puti'),
(20, '7', 'Balachaung(Block)'),
(21, '8', 'block');

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

--
-- Dumping data for table `labour`
--

INSERT INTO `labour` (`id`, `indate`, `outdate`, `commondity_id`, `mc`, `total_mc`, `kg`, `total_kg`, `rate`, `charges`, `total_charges`) VALUES
(109, '2023-11-01', '2023-11-02', '1', 10, 10, '90', '90', '4', 360, 360);

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
(8, '2023-11-01', '3300/004', 'USA', '01010101', 'KND', 'HEHE', 'HOHOHOHOH', 'FATHER'),
(9, '2023-11-20', '3300/006', 'Can', '111111', 'nm654', '2453656', 'VOYNAMEEEE', '14278338350');

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
(29, '1', '2up', 20, 30, 600, '630', '', '', 8),
(30, '1', '3up', 23, 30, 690, '720', '', '', 8),
(31, '1', '5up', 23, 30, 690, '720', '', '', 8),
(32, '1', '3up', 22, 23, 506, '529', '', '', 8),
(33, '1', '2up', 23, 43, 989, '1032', '', '', 8),
(34, '2', '3up', 21, 23, 483, '506', '', '', 8),
(35, '2', '4up', 22, 29, 638, '667', '', '', 8),
(37, '7', '2up', 21, 32, 672, '704', '', '', 8),
(38, '1', '2up', 20, 30, 600, '630', '', '', 9),
(39, '7', '3up', 22, 43, 946, '500', '', '', 9),
(40, '1', '3up', 22, 43, 946, '989', '', '', 9);

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
  `pcspermc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(240, '2023-11-01', '4000/T01', '178', 100000, '0000-00-00', '', '', 0, 100000, 152, 250000, '2023-11-10'),
(241, '2023-11-01', '4000/T01', '178', 50000, '0000-00-00', '', '', 0, 150000, 153, 0, '0000-00-00'),
(242, '2023-11-01', '4000/T01', '178', 100000, '0000-00-00', '', '', 0, 250000, 154, 0, '0000-00-00'),
(243, '2023-11-01', '4000/P01', '2581', 100000, '0000-00-00', '', '', 0, 100000, 155, 100000, '2023-11-10'),
(244, '2023-11-01', '4000/P01', '2581', 100000, '0000-00-00', '', '', 0, 200000, 156, 0, '0000-00-00'),
(245, '0000-00-00', '4000/P01', '', 0, '2023-11-09', 'A0001', 'IDK', 100000, 100000, 0, 0, '0000-00-00'),
(249, '2023-11-02', '4000/K01', '8013', 100000, '0000-00-00', '', '', 0, 150000, 159, 70000, '2023-11-10'),
(250, '2023-11-02', '4000/A01', '3524', 220000, '0000-00-00', '', '', 0, 220000, 160, 220000, '2023-11-10'),
(251, '0000-00-00', '4000/K01', '', 0, '2023-11-09', 'D0001', 'HEHE', 10000, 140000, 0, 0, '0000-00-00'),
(253, '0000-00-00', '4000/K01', '', 0, '2023-11-09', 'B0001', 'paid to supplier', 20000, 120000, 0, 0, '0000-00-00'),
(255, '2023-11-05', '4000/A01', '111111', 2100000, '0000-00-00', '', '', 0, 2320000, 162, 0, '0000-00-00');

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
(1, 1, 'manage_accounts,manage_role,manage_sale,manage_purchase,manage_cashbook,manage_acpayable,manage_accountreceivable,manage_transactionmanage_general_ledger,manage_customers,manage_supplier,manage_coldstoreitem,manage_item,manage_actype,manage_acname,manage_coldstorecharges,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport,manage_shippmentexport,manage_truckexport,manage_packingmaterial,purchase_report,payable_report');

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

--
-- Dumping data for table `processing`
--

INSERT INTO `processing` (`id`, `indate`, `outdate`, `commondity_id`, `mc`, `total_mc`, `kg`, `total_kg`, `rate`, `charges`, `total_charges`) VALUES
(107, '2023-11-01', '2023-11-02', '1', 10, 10, '90', '90', '270', 24300, 24300),
(109, '2023-11-01', '2023-11-02', '1', 10, 10, '90', '180', '270', 24300, 48600);

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
(152, '2023-11-01', 178, '4000/T01', 'frozen', '3', '2up', '100', 0, 1000, 100000),
(153, '2023-11-01', 178, '4000/T01', 'frozen', '2', '3up', '100', 0, 500, 50000),
(154, '2023-11-01', 178, '4000/T01', 'frozen', '4', '4up', '50', 0, 2000, 100000),
(155, '2023-11-01', 2581, '4000/P01', 'frozen', '5', '2up', '50', 0, 2000, 100000),
(156, '2023-11-01', 2581, '4000/P01', 'frozen', '1', '2up', '100', 0, 1000, 100000),
(159, '2023-11-02', 8013, '4000/K01', 'frozen', '1', '2up', '100', 0, 1000, 100000),
(160, '2023-11-02', 3524, '4000/A01', 'frozen', '5', '3up', '100', 0, 2200, 220000),
(162, '2023-11-05', 111111, '4000/A01', 'frozen', '7', '2up', '100', 0, 21000, 2100000);

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

--
-- Dumping data for table `receivable`
--

INSERT INTO `receivable` (`id`, `date`, `ac_code`, `sr_no`, `container_no`, `invoice_amount`, `paid_date`, `payment_no`, `particulars`, `paid_amount`, `balance`) VALUES
(238, '2023-11-09', '3300/001', 'uuoop', 'ac-321', '100', '0000-00-00', '', '', 0, 100),
(239, '0000-00-00', '3300/001', '', '', '', '2023-11-09', 'A0005', 'PAID U ', 100, 0);

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
(1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_id` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_name`, `supplier_phone`, `supplier_address`, `supplier_id`) VALUES
('Aung Aung ', '', '', '4000/A01'),
('Bo Bo Lwin', '', '', '4000/B01'),
('Kyi Sin', '', '', '4000/K01'),
('MgMg', '', '', '4000/M01'),
('Parti', '', '', '4000/P01'),
('Thaing Gi', '', '', '4000/T01');

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
  `total_charges` bigint(19) NOT NULL,
  `grand_total_charges` bigint(19) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_amount` bigint(19) NOT NULL,
  `balance_amount` bigint(19) NOT NULL,
  `remark` bigint(19) NOT NULL,
  `link_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `total_charges`
--

INSERT INTO `total_charges` (`id`, `date`, `commondity_id`, `total_coldstore_charges`, `total_labour_charges`, `total_processing_charges`, `repacking_charges`, `ice_charges`, `ot_charges`, `total_charges`, `grand_total_charges`, `payment_date`, `payment_amount`, `balance_amount`, `remark`, `link_id`) VALUES
(91, '2023-11-02', 1, 540, 360, 243000, 0, 0, 0, 900, 900, '0000-00-00', 0, 252000, 0, 109);

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
(326, '2023-11-09', 'A0001', '4000/P01', 'IDK', 100000, 0, 'mmk', '', '', 0),
(327, '2023-11-09', 'A0001', '3600/001', 'asdfasdf', 0, 100000, 'mmk', '', '', 0),
(328, '2023-11-09', 'A0002', '3300/001', 'SALEE', 300000, 0, 'usd', 'uuoop', 'ac-321', 0),
(329, '2023-11-09', 'A0002', '5000/001', 'SALEE', 0, 300000, 'usd', '', '', 0),
(332, '2023-11-09', 'A0005', '3600/001', 'GET PAID BABY', 300000, 0, 'usd', '', '', 10),
(333, '2023-11-09', 'A0005', '3300/001', 'PAID U ', 0, 300000, 'usd', 'hehe', 'ac-323', 0),
(334, '2023-11-09', 'B0001', '4000/K01', 'paid to supplier', 20000, 0, 'mmk', '', '', 0),
(335, '2023-11-09', 'B0001', '3600/001', 'paid to Kyi Sin', 0, 20000, 'mmk', '', '', 0),
(336, '2023-11-09', 'D0001', '4000/K01', 'HEHE', 10000, 0, 'mmk', '', '', 0),
(337, '2023-11-09', 'D0001', '3600/001', 'HEHE', 0, 10000, 'mmk', '', '', 0);

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
(43, '1', '2up', 10, 90, 10, 900, 0, 0, 'MOP001', 0),
(44, '1', '3up', 10, 90, 100, 9000, 0, 0, 'MOP001', 0),
(45, '1', '2up', 10, 90, 100, 9000, 0, 0, 'MOP001', 0),
(46, '1', '3up', 10, 10, 100, 1000, 0, 0, 'MOP001', 0),
(47, '1', '2up', 10, 10, 90, 900, 0, 0, 'MOP001', 0),
(48, '2', '2up', 10, 10, 10, 100, 0, 0, 'MOP001', 0),
(49, '1', '2up', 10, 10, 100, 1000, 0, 0, 'MOP001', 0),
(50, '1', '3up', 10, 10, 100, 1000, 0, 0, 'MOP001', 0),
(51, '2', '3up', 10, 10, 100, 1000, 0, 0, 'MOP001', 0),
(52, '2', '2up', 10, 10, 100, 1000, 0, 0, 'MOP001', 0),
(53, '2', '3up', 10, 10, 100, 1000, 0, 0, 'MOP001', 0),
(54, '1', '4up', 10, 10, 100, 1000, 0, 0, 'MOP001', 0),
(55, '2', '4up', 10, 10, 100, 1000, 0, 0, 'MOP001', 0),
(66, '1', '1up', 21, 23, 48, 1104, 0, 0, 'GW572', 0),
(67, '2', '3up', 30, 20, 30, 600, 0, 0, 'GW572', 69),
(68, '1', '2up', 10, 10, 10, 100, 0, 0, 'GW572', 70),
(69, '1', '1up', 10, 10, 10, 100, 0, 0, 'GW572', 71);

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
(33, '1', '2up', 10, 0, 10, 0, 'MOP001', 0),
(34, '1', '3up', 10, 0, 100, 0, 'MOP001', 0),
(35, '1', '2up', 10, 0, 100, 0, 'MOP001', 0),
(36, '1', '3up', 10, 0, 100, 0, 'MOP001', 0),
(37, '1', '2up', 10, 0, 90, 0, 'MOP001', 0),
(38, '2', '2up', 10, 0, 10, 0, 'MOP001', 0),
(39, '1', '2up', 10, 0, 100, 0, 'MOP001', 0),
(40, '1', '3up', 10, 0, 100, 0, 'MOP001', 0),
(41, '2', '3up', 10, 0, 100, 0, 'MOP001', 0),
(42, '2', '2up', 10, 0, 100, 0, 'MOP001', 0),
(43, '2', '3up', 10, 0, 100, 0, 'MOP001', 0),
(44, '1', '4up', 10, 0, 100, 0, 'MOP001', 0),
(45, '2', '4up', 10, 0, 100, 0, 'MOP001', 0),
(56, '1', '1up', 21, 10, 48, 480, 'GW572', 0),
(57, '2', '3up', 30, 10, 30, 300, 'GW572', 69),
(58, '1', '2up', 10, 0, 10, 0, 'GW572', 70),
(59, '1', '1up', 10, 0, 10, 0, 'GW572', 71);

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
(37, '1', '2up', 10, 90, 10, 900, '', '', 'MOP001', 0),
(38, '1', '3up', 10, 90, 100, 9000, '', '', 'MOP001', 0),
(39, '1', '2up', 10, 90, 100, 9000, '', '', 'MOP001', 0),
(40, '1', '3up', 10, 10, 100, 1000, '', '', 'MOP001', 0),
(41, '1', '2up', 10, 10, 90, 900, '', '', 'MOP001', 0),
(42, '2', '2up', 10, 10, 10, 100, '', '', 'MOP001', 0),
(43, '1', '2up', 10, 10, 100, 1000, '', '', 'MOP001', 0),
(44, '1', '3up', 10, 10, 100, 1000, '', '', 'MOP001', 0),
(45, '2', '3up', 10, 10, 100, 1000, '', '', 'MOP001', 0),
(46, '2', '2up', 10, 10, 100, 1000, '', '', 'MOP001', 0),
(47, '2', '3up', 10, 10, 100, 1000, '', '', 'MOP001', 0),
(48, '1', '4up', 10, 10, 100, 1000, '', '', 'MOP001', 0),
(49, '2', '4up', 10, 10, 100, 1000, '', '', 'MOP001', 0),
(60, '1', '1up', 21, 23, 48, 1104, '', '', 'GW572', 0),
(61, '2', '3up', 30, 20, 30, 600, '', '', 'GW572', 69),
(62, '1', '2up', 10, 10, 10, 100, '', '', 'GW572', 70),
(63, '1', '1up', 10, 10, 10, 100, '', '', 'GW572', 71);

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
(7, '2023-11-09', 'MOP001', '31'),
(8, '2023-11-10', 'GW572', '32');

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
(44, '1', '2up', 10, 90, 10, 900, 600, 'MOP001'),
(45, '1', '3up', 10, 90, 100, 9000, 6000, 'MOP001'),
(46, '1', '2up', 10, 90, 100, 9000, 6000, 'MOP001'),
(47, '1', '3up', 10, 10, 100, 1000, 6000, 'MOP001'),
(48, '1', '2up', 10, 10, 90, 900, 5400, 'MOP001'),
(49, '2', '2up', 10, 10, 10, 100, 600, 'MOP001'),
(50, '1', '2up', 10, 10, 100, 1000, 6000, 'MOP001'),
(51, '1', '3up', 10, 10, 100, 1000, 6000, 'MOP001'),
(52, '2', '3up', 10, 10, 100, 1000, 6000, 'MOP001'),
(53, '2', '2up', 10, 10, 100, 1000, 6000, 'MOP001'),
(54, '2', '3up', 10, 10, 100, 1000, 6000, 'MOP001'),
(55, '1', '4up', 10, 10, 100, 1000, 6000, 'MOP001'),
(56, '2', '4up', 10, 10, 100, 1000, 6000, 'MOP001'),
(67, '1', '1up', 21, 23, 48, 1104, 2880, 'GW572'),
(69, '2', '3up', 30, 20, 30, 600, 1800, 'GW572'),
(70, '1', '2up', 10, 10, 10, 100, 600, 'GW572'),
(71, '1', '1up', 10, 10, 10, 100, 600, 'GW572');

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
  `link_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trucktotalcosting`
--

INSERT INTO `trucktotalcosting` (`id`, `date`, `item_id`, `size`, `total_kg`, `priceperviss`, `priceperkg`, `percentage`, `packing_charges`, `ygntomt_charges`, `mttotechnck_charges`, `labour_charges`, `packingandtransport`, `total`, `grand_total`, `rate`, `costing_usd`, `selling_rate`, `profitperkg`, `original_cost`, `selling_amount`, `profit`, `invoice_no`, `link_id`) VALUES
(30, '0000-00-00', '1', '2up', 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'MOP001', 0),
(31, '0000-00-00', '1', '3up', 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'MOP001', 0),
(32, '0000-00-00', '1', '2up', 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'MOP001', 0),
(33, '0000-00-00', '1', '3up', 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'MOP001', 0),
(34, '0000-00-00', '1', '2up', 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'MOP001', 0),
(35, '0000-00-00', '2', '2up', 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'MOP001', 0),
(36, '0000-00-00', '1', '2up', 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'MOP001', 0),
(37, '0000-00-00', '1', '3up', 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'MOP001', 0),
(38, '0000-00-00', '2', '3up', 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'MOP001', 0),
(39, '0000-00-00', '2', '2up', 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'MOP001', 0),
(40, '0000-00-00', '2', '3up', 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'MOP001', 0),
(41, '0000-00-00', '1', '4up', 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'MOP001', 0),
(42, '0000-00-00', '2', '4up', 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'MOP001', 0),
(43, '0000-00-00', '1', '2up', 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'MOP001', 0),
(54, '0000-00-00', '1', '1up', 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'GW572', 0),
(55, '0000-00-00', '2', '3up', 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'GW572', 69),
(56, '0000-00-00', '1', '2up', 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'GW572', 70),
(57, '0000-00-00', '1', '1up', 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'GW572', 71);

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
(73, '10:25:28.000000', '2023-11-09', 'admin', 'admin', 'Login Success'),
(74, '10:44:09.000000', '2023-11-09', 'admin', 'admin', 'Login Success'),
(75, '10:49:53.000000', '2023-11-09', 'admin', 'admin', 'Login Success'),
(76, '12:10:03.000000', '2023-11-09', 'admin', 'admin', 'Login Success'),
(77, '12:14:41.000000', '2023-11-09', 'admin', 'admin', 'Login Success'),
(78, '02:48:17.000000', '2023-11-09', 'admin', 'admin', 'Login Success'),
(79, '05:03:14.000000', '2023-11-09', 'admin', 'admin', 'Login Success'),
(80, '05:52:25.000000', '2023-11-09', 'admin', 'admin', 'Login Success'),
(81, '07:26:02.000000', '2023-11-09', 'admin', 'admin', 'Login Success'),
(82, '09:47:49.000000', '2023-11-10', 'admin', 'admin', 'Login Success'),
(83, '01:05:10.000000', '2023-11-10', 'admin', 'admin', 'Login Success'),
(84, '02:49:06.000000', '2023-11-10', 'admin', 'admin', 'Login Success'),
(85, '11:06:38.000000', '2023-11-13', 'admin', 'admin', 'Login Success'),
(86, '03:07:10.000000', '2023-11-13', 'admin', 'admin', 'Login Success'),
(87, '07:22:28.000000', '2023-11-13', 'admin', 'admin', 'Login Success'),
(88, '07:32:28.000000', '2023-11-13', 'admin', 'admin', 'Login Success'),
(89, '08:59:52.000000', '2023-11-14', 'admin', 'admin', 'Login Success'),
(90, '10:39:18.000000', '2023-11-15', 'admin', 'admin', 'Login Success'),
(91, '10:56:49.000000', '2023-11-15', 'admin', 'admin', 'Login Success'),
(92, '01:59:53.000000', '2023-11-15', 'admin', 'admin', 'Login Success'),
(93, '09:33:11.000000', '2023-11-17', 'admin', 'admin', 'Login Success'),
(94, '01:25:27.000000', '2023-11-20', 'admin', 'admin', 'Login Success'),
(95, '07:03:33.000000', '2023-11-20', 'admin', 'admin', 'Login Success'),
(96, '09:03:07.000000', '2023-11-21', 'admin', 'admin', 'Login Success'),
(97, '01:46:16.000000', '2023-11-21', 'admin', 'admin', 'Login Success'),
(98, '10:00:47.000000', '2023-11-22', 'admin', 'admin', 'Login Success'),
(99, '01:45:30.000000', '2023-11-22', 'admin', 'admin', 'Login Success');

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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`supplier_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `acname`
--
ALTER TABLE `acname`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `actualinvoice`
--
ALTER TABLE `actualinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `actype`
--
ALTER TABLE `actype`
  MODIFY `acid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `bankdetail`
--
ALTER TABLE `bankdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cashbook`
--
ALTER TABLE `cashbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `coldstore`
--
ALTER TABLE `coldstore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `container`
--
ALTER TABLE `container`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=323;

--
-- AUTO_INCREMENT for table `form7stock`
--
ALTER TABLE `form7stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `form10stock`
--
ALTER TABLE `form10stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `general_ledger`
--
ALTER TABLE `general_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=742;

--
-- AUTO_INCREMENT for table `gfcdryfishcoldstore`
--
ALTER TABLE `gfcdryfishcoldstore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `gfcdryfishlabour`
--
ALTER TABLE `gfcdryfishlabour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `gfcfishcoldstore`
--
ALTER TABLE `gfcfishcoldstore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=409;

--
-- AUTO_INCREMENT for table `gfcfishlabour`
--
ALTER TABLE `gfcfishlabour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `gfcmcstock`
--
ALTER TABLE `gfcmcstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `gfctotal`
--
ALTER TABLE `gfctotal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `hhkmcstock`
--
ALTER TABLE `hhkmcstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `hhkstock`
--
ALTER TABLE `hhkstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `invoice_costing`
--
ALTER TABLE `invoice_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `labour`
--
ALTER TABLE `labour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `mslcoldstore`
--
ALTER TABLE `mslcoldstore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `mslexportcharges`
--
ALTER TABLE `mslexportcharges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `mslfreezing`
--
ALTER TABLE `mslfreezing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `mslrepacking`
--
ALTER TABLE `mslrepacking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mslstock`
--
ALTER TABLE `mslstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `msl_total_charges`
--
ALTER TABLE `msl_total_charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `packingliststock`
--
ALTER TABLE `packingliststock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `packingliststockinfo`
--
ALTER TABLE `packingliststockinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `packingmaterial`
--
ALTER TABLE `packingmaterial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payable`
--
ALTER TABLE `payable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `processing`
--
ALTER TABLE `processing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `receivable`
--
ALTER TABLE `receivable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT for table `repacking`
--
ALTER TABLE `repacking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `repackingout`
--
ALTER TABLE `repackingout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tclmcstock`
--
ALTER TABLE `tclmcstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `total_charges`
--
ALTER TABLE `total_charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=338;

--
-- AUTO_INCREMENT for table `truckactualinvoice`
--
ALTER TABLE `truckactualinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `truckdeclare`
--
ALTER TABLE `truckdeclare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `truckfoambox`
--
ALTER TABLE `truckfoambox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `truckpackingliststock`
--
ALTER TABLE `truckpackingliststock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `truckpackingliststockinfo`
--
ALTER TABLE `truckpackingliststockinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `truckpackingmaterial`
--
ALTER TABLE `truckpackingmaterial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `trucktotalcosting`
--
ALTER TABLE `trucktotalcosting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `userlogs`
--
ALTER TABLE `userlogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
