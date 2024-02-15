-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2024 at 04:07 AM
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
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `password`, `email`, `role`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', 1),
(2, 'Ma Sandar Aung', '12341234', 'sandaraung@gmail.com', 1),
(3, 'Ma Soe Soe Khaing', 'stockstock', 'masoesoekhaing@gmail.com', 2),
(4, 'Lwin Mi Khaing', 'shippment', 'lwinmikhaing@gmail.com', 1),
(5, 'Thin Zar Kyaw', 'thinzarkyaw', 'thinzarkyaw@gmail.com', 4),
(6, 'Lin Lin Naing', 'coldstore', 'linlinnaing@gmail.com', 5);

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
(229, '3600/001', 35, 'Main Cash Kyats A/C'),
(230, '5000/001', 36, 'USA A/C'),
(231, '5000/002', 36, 'Canada A/C'),
(232, '3600/002', 35, 'Main Cash USD A/C'),
(233, '9100/000', 39, 'Administrative Expense'),
(234, '9100/001', 39, 'Staff Salary A/C'),
(235, '9100/002', 39, 'Transportation A/C'),
(240, '4000/000', 40, 'Account Payable'),
(241, '4000/001', 40, '4 Zaw'),
(242, '4000/002', 40, '4 Zaw (TCL)'),
(243, '4000/A01', 40, 'AK'),
(244, '4000/A02', 40, 'Arr Kae'),
(245, '4000/A03', 40, 'Aung Naing Oo'),
(246, '4000/B01', 40, 'Bar Bu lay'),
(247, '4000/C01', 40, 'Chit Oo (D51)'),
(248, '4000/H01', 40, 'Htet Aung Lin'),
(249, '4000/H02', 40, 'Htay Win'),
(250, '4000/K01', 40, 'Kyaw Zay Ya (TCL)'),
(251, '4000/K02', 40, 'Kyaw Zin'),
(252, '4000/K03', 40, 'KTO'),
(253, '4000/K04', 40, 'Kaung Myat'),
(254, '4000/L01', 40, 'Lie Chit'),
(255, '4000/M01', 40, 'M.A'),
(256, '4000/M02', 40, 'Maung Soe'),
(257, '4000/M03', 40, 'Mg Mg Nyunt'),
(258, '4000/N01', 40, 'Nanda'),
(259, '4000/N02', 40, 'Naing Win'),
(260, '4000/P01', 40, 'Phone Naing'),
(261, '4000/S01', 40, 'Shwe Late'),
(262, '4000/S02', 40, 'Shwe Late (TCL)'),
(263, '4000/S03', 40, 'Soe Min'),
(264, '4000/S04', 40, 'Si Thu (22)'),
(265, '4000/S05', 40, 'Si Thu (22) (TCL)'),
(266, '4000/S06', 40, 'Soe Thein'),
(267, '4000/S07', 40, 'Soe Thein (TCL)'),
(268, '4000/S08', 40, 'Soe Naing'),
(269, '4000/S09', 40, 'Soe Naing (TCL)'),
(270, '4000/T01', 40, 'Thet Paing'),
(271, '4000/T02', 40, 'Thein Htay'),
(272, '4000/T03', 40, 'Thin Thin Yee'),
(273, '4000/T04', 40, 'Thin Thin Yee (TCL)'),
(274, '4000/T05', 40, 'Thet Oo'),
(275, '4000/T06', 40, 'Thar Hla'),
(276, '4000/T07', 40, 'Thaung Tun'),
(277, '4000/T08', 40, 'Than Than Myint'),
(278, '4000/T09', 40, 'Than Than Myint (TCL)'),
(279, '4000/T10', 40, 'Tun Zaw Min (TCL)'),
(280, '4000/W01', 40, 'Win Bo'),
(281, '4000/W02', 40, 'Win Bo (TCL)'),
(282, '4000/Y01', 40, 'Ye Yint'),
(283, '4000/Z01', 40, 'Zaw Zaw Latt'),
(284, '4000/Z02', 40, 'Zaw Zaw Latt (TCL)'),
(285, '4000/S10', 40, 'Shaw Myay'),
(286, '4000/M04', 40, 'Carton Box (Myo Myint Mo Oo)'),
(287, '4000/M05', 40, 'Carton Box (Myanmar HJ)'),
(288, '4000/S11', 40, 'Carton Box( Syan Pyae)'),
(289, '4000/H03', 40, 'Hlaing Htake Khaung'),
(290, '4000/G01', 40, 'GFC'),
(292, '4000/A04', 40, 'Aung Kyaw Moe'),
(293, '4000/A05', 40, 'Aung Myo Min'),
(294, '4000/A06', 40, 'Aung Zaw Oo'),
(295, '4000/A07', 40, 'A Thay Lay'),
(296, '4000/C02', 40, 'Cho Mg'),
(297, '4000/K05', 40, 'Kyaw Zay Ya'),
(298, '4000/K06', 40, 'Ka Yin Lay'),
(299, '4000/K07', 40, 'Khin Mg Myint'),
(300, '4000/M06', 40, 'Mg Mg Soe'),
(301, '4000/M07', 40, 'Moe Kyaw'),
(302, '4000/P02', 40, 'Parami (Balachaung)'),
(303, '4000/T11', 40, 'Tun Zaw Min'),
(304, '4000/Z03', 40, 'Zaw Myat Thu'),
(305, '6100/000', 37, 'Direct Expense'),
(306, '6100/001', 37, 'Labour Charges'),
(307, '6100/002', 37, 'Ice Charges'),
(308, '6100/003', 37, 'Packing Expense'),
(309, '6100/004', 37, 'Kit Box Carry Charges'),
(310, '6100/005', 37, 'MC Box Carry Charges'),
(311, '6100/006', 37, 'Sticker Expense'),
(312, '6100/007', 37, 'Cold Store Charges'),
(313, '9100/003', 39, 'Water Supply Expense'),
(314, '9100/004', 39, 'Phone, Fax & Internet A/C'),
(315, '9100/005', 39, 'Miscellaneous Expense A/C'),
(316, '9100/006', 39, 'Petrol & Diesel Expense A/C'),
(317, '9100/007', 39, 'Maintenance Expense A/C'),
(318, '9100/008', 39, 'Documentation Expense A/C'),
(319, '3300/001', 35, 'Other Receivable-Best Brand A/C'),
(320, '3300/002', 35, 'South Asia Food-USA A/C'),
(321, '3300/003', 35, 'Jamuna Food-Canada A/C');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `actype`
--

CREATE TABLE `actype` (
  `acid` int(11) NOT NULL,
  `ac_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `actype`
--

INSERT INTO `actype` (`acid`, `ac_type`) VALUES
(33, 'Capital'),
(34, 'Fixed Asset'),
(35, 'Current Asset'),
(36, 'Revenue'),
(37, 'Cost of Good Sold'),
(38, 'Other Income'),
(39, 'Expense'),
(40, 'Current Liabilities');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_id` varchar(22) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `rate` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_id`, `category_name`, `rate`) VALUES
(1, '1', 'Fish', 320),
(2, '2', 'IQF', NULL),
(3, '3', 'Block', NULL),
(4, '4', 'Pujanut', NULL),
(5, '5', 'rohu', 320);

-- --------------------------------------------------------

--
-- Table structure for table `coldstore`
--

CREATE TABLE `coldstore` (
  `id` int(11) NOT NULL,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `commondity_id` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(12) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `day` int(11) NOT NULL,
  `rate` varchar(12) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` varchar(100) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_detail` text NOT NULL,
  `customer_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_detail`, `customer_address`) VALUES
('3300/001', 'Other Receivable-Best Brand A/C', 'Best Brand Company', ''),
('3300/002', 'South Asia Food-USA A/C', 'SAF (USA) Company Ltd', ''),
('3300/003', 'Jamuna Food-Canada A/C', 'CAN (Jamuna Food) Company Ltd', '');

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
  `link_id` int(11) NOT NULL,
  `water_kg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `form7stock`
--

INSERT INTO `form7stock` (`id`, `date`, `item_id`, `supplier_name`, `country`, `type`, `size`, `viss`, `kg`, `pcspervr`, `pcsperf7`, `link_id`, `water_kg`) VALUES
(77, '2024-02-02', '1010', '4000/T07', NULL, 'Frozen', 'J', '220.1', '359.6434', '', 0, 59, 0),
(78, '2024-02-02', '1002', '4000/Z03', NULL, 'Frozen', '2 D', '19.7', '32.1898', '16', 0, 60, 0),
(79, '2024-02-02', '1002', '4000/Z03', NULL, 'Frozen', '2 up', '38.9', '63.5626', '26', 0, 61, 0),
(80, '2024-02-02', '1002', '4000/Z03', NULL, 'Frozen', '3 up', '104.7', '171.0798', '33', 0, 62, 0),
(81, '2024-02-02', '1001', '4000/Z03', NULL, 'Frozen', '1 D', '1.2', '1.9608', '2', 0, 63, 0),
(82, '2024-02-02', '1001', '4000/Z03', NULL, 'Frozen', '1 up', '12', '19.608', '14', 0, 64, 0),
(83, '2024-02-02', '1001', '4000/Z03', NULL, 'Frozen', '2 D', '37.5', '61.275', '31', 0, 65, 0),
(85, '2024-02-02', '1001', '4000/Z03', NULL, 'Frozen', '2 up', '28.6', '46.7324', '19', 0, 67, 0),
(86, '2024-02-02', '1001', '4000/Z03', NULL, 'Frozen', '3up', '85.3', '139.3802', '28', 0, 68, 0),
(87, '2024-02-03', '1031', '4000/T05', NULL, 'Frozen', '3up', '293.1', '478.9254', '', 0, 69, 0),
(88, '2024-02-03', '1031', '4000/T05', NULL, 'Frozen', '4up', '3369.9', '5506.4166', '', 0, 70, 0),
(89, '2024-02-03', '1031', '4000/T05', NULL, 'Frozen', '5up', '1775.4', '2901.0036', '', 0, 71, 0),
(90, '2024-02-04', '1001', '4000/T02', NULL, 'Frozen', '3up', '24', '39.216', '10', 0, 72, 0),
(91, '2024-02-04', '1001', '4000/T02', NULL, 'Frozen', '2up', '19.1', '31.2094', '13', 0, 73, 0),
(92, '2024-02-04', '1001', '4000/T02', NULL, 'Frozen', '1.5up', '40.2', '65.6868', '39', 0, 74, 0),
(93, '2024-02-04', '1002', '4000/T02', NULL, 'Frozen', '3up', '41.4', '67.6476', '17', 0, 75, 0),
(94, '2024-02-04', '1002', '4000/T02', NULL, 'Frozen', '2up', '74.2', '121.2428', '49', 0, 76, 0),
(95, '2024-02-04', '1020', '4000/T07', NULL, 'Frozen', '5up', '132.3', '216.1782', '30', 0, 77, 0),
(96, '2024-02-04', '1020', '4000/T07', NULL, 'Frozen', '3up', '29.8', '48.6932', '12', 0, 78, 0),
(97, '2024-02-04', '1010', '4000/T07', NULL, 'Frozen', 'J', '255.5', '417.487', '', 0, 79, 0),
(98, '2024-02-05', '1001', '4000/Z03', NULL, 'Frozen', '1up', '35.2', '57.5168', '41', 0, 80, 0),
(99, '2024-02-05', '1001', '4000/Z03', NULL, 'Frozen', '2up', '40.8', '66.6672', '27', 0, 81, 0),
(100, '2024-02-05', '1001', '4000/Z03', NULL, 'Frozen', '2 D', '18.9', '30.8826', '16', 0, 82, 0),
(101, '2024-02-05', '1001', '4000/Z03', NULL, 'Frozen', '3up', '34.6', '56.5364', '11', 0, 83, 0),
(102, '2024-02-05', '1002', '4000/Z03', NULL, 'Frozen', '2up', '61.1', '99.8374', '42', 0, 84, 0),
(103, '2024-02-05', '1002', '4000/Z03', NULL, 'Frozen', '2 D', '12.8', '20.9152', '11', 0, 85, 0),
(104, '2024-02-05', '1002', '4000/Z03', NULL, 'Frozen', '3up', '57.7', '94.2818', '17', 0, 86, 0),
(105, '2024-02-06', '1031', '4000/T05', NULL, 'Frozen', '18/24', '350', '571.9', '', 0, 87, 0),
(106, '2024-02-06', '1014', '4000/K03', NULL, 'Frozen', 'J', '4.8', '7.8432', '3', 0, 88, 0),
(107, '2024-02-06', '1027', '4000/K03', NULL, 'Frozen', 'J', '69.4', '113.3996', '41', 0, 89, 0),
(108, '2024-02-06', '1031', '4000/T05', NULL, 'Frozen', '4/5up', '1321', '2158.514', '', 0, 90, 0),
(110, '2024-02-07', '1001', '4000/B01', NULL, 'Frozen', '3up', '39.25', '64.1345', '17', 0, 92, 0),
(111, '2024-02-07', '1001', '4000/B01', NULL, 'Frozen', '2up', '33.9', '55.3926', '23', 0, 93, 0),
(112, '2024-02-07', '1001', '4000/B01', NULL, 'Frozen', '1.5up', '9.8', '16.0132', '11', 0, 94, 0),
(113, '2024-02-07', '1001', '4000/B01', NULL, 'Frozen', '1up', '7.5', '12.255', '11', 0, 95, 0),
(114, '2024-02-07', '1002', '4000/B01', NULL, 'Frozen', '3/4up', '109.75', '179.3315', '46', 0, 96, 0),
(115, '2024-02-07', '1002', '4000/B01', NULL, 'Frozen', '2up', '65.75', '107.4355', '57', 0, 97, 0),
(116, '2024-02-07', '1002', '4000/B01', NULL, 'Frozen', '1up', '55.55', '90.7687', '61', 0, 98, 0),
(117, '2024-02-07', '1020', '4000/B01', NULL, 'Frozen', '3up', '76', '124.184', '33', 0, 99, 0),
(118, '2024-02-07', '1001', '4000/T02', NULL, 'Frozen', '3up', '44.3', '72.3862', '19', 0, 100, 0),
(119, '2024-02-07', '1001', '4000/T02', NULL, 'Frozen', '2up', '45.2', '73.8568', '32', 0, 101, 0),
(120, '2024-02-07', '1001', '4000/T02', NULL, 'Frozen', '1.5up', '47.3', '77.2882', '47', 0, 102, 0),
(121, '2024-02-07', '1001', '4000/T02', NULL, 'Frozen', '1up', '48.2', '78.7588', '60', 0, 103, 0),
(122, '2024-02-07', '1002', '4000/T02', NULL, 'Frozen', '3up', '74.8', '122.2232', '30', 0, 104, 0),
(123, '2024-02-07', '1002', '4000/T02', NULL, 'Frozen', '2up', '46', '75.164', '30', 0, 105, 0),
(124, '2024-02-07', '1016', '4000/T02', NULL, 'Frozen', 'J', '6.3', '10.2942', '6', 0, 106, 0),
(125, '2024-02-07', '1020', '4000/T07', NULL, 'Frozen', '5up', '84.1', '137.4194', '20', 0, 107, 0),
(126, '2024-02-07', '1020', '4000/T07', NULL, 'Frozen', '3up', '30.8', '50.3272', '12', 0, 108, 0);

-- --------------------------------------------------------

--
-- Table structure for table `form7stocktcl`
--

CREATE TABLE `form7stocktcl` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form10stocktcl`
--

CREATE TABLE `form10stocktcl` (
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
  `cc_pcs` int(11) DEFAULT NULL,
  `cc_kg` float DEFAULT NULL,
  `msl_pcs` int(11) DEFAULT NULL,
  `msl_kg` float DEFAULT NULL,
  `hhk_pcs` int(11) DEFAULT NULL,
  `hhk_kg` float DEFAULT NULL,
  `lanfish_pcs` int(11) DEFAULT NULL,
  `lanfish_kg` float DEFAULT NULL,
  `cutpiece_pcs` int(11) DEFAULT NULL,
  `cutpiece_kg` float DEFAULT NULL,
  `total_kg` varchar(11) NOT NULL,
  `percentage` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `general_ledger`
--

INSERT INTO `general_ledger` (`id`, `date`, `voucherno`, `ac_code`, `debit`, `credit`, `balance`, `narration`, `sr_no`, `container_no`, `bank_charges`, `acid`) VALUES
(63, '2024-02-13', '11111', '4000/001', 0, 3036000, -3036000, '', '', '', 0, 0),
(64, '2024-02-08', '11369', '4000/T01', 0, 778800, -778800, '', '', '', 0, 0),
(65, '2024-02-02', '11356', '4000/T07', 0, 1166530, -1166530, '', '', '', 0, 0),
(66, '2024-02-02', '11357', '4000/Z03', 0, 14943200, -16109730, '', '', '', 0, 0),
(67, '2024-02-03', '11358', '4000/T05', 0, 54489795, -70599525, '', '', '', 0, 0),
(68, '2024-02-04', '11359', '4000/T02', 0, 6378000, -76977525, '', '', '', 0, 0),
(69, '2024-02-04', '11360', '4000/T07', 0, 4713550, -81691075, '', '', '', 0, 0),
(70, '2024-02-05', '11361', '4000/Z03', 0, 8379700, -90070775, '', '', '', 0, 0),
(71, '2024-02-06', '11362', '4000/T05', 0, 27322200, -117392975, '', '', '', 0, 0),
(72, '2024-02-07', '11365', '4000/B01', 0, 11876150, -129269125, '', '', '', 0, 0),
(73, '2024-02-07', '11366', '4000/T02', 0, 10002750, -139271875, '', '', '', 0, 0),
(74, '2024-02-07', '11367', '4000/T07', 0, 2366700, -141638575, '', '', '', 0, 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gfcfishcoldstore`
--

INSERT INTO `gfcfishcoldstore` (`id`, `date`, `ite`, `mc`, `total_mc`, `kg`, `total_kg`, `rate`, `charges`, `total_charges`, `remark`) VALUES
(34, '2024-02-01', 'import', 100, 100, '2000', '2000', '1.5', 3000, 3000, ''),
(35, '2024-02-01', 'takeout', 50, 50, '1000', '1000', '1.5', 0, 0, ''),
(42, '2024-02-02', 'export', 20, 30, '180', '820', '1.5', 1500, 4500, ''),
(43, '2024-02-03', 'import', 100, 130, '2000', '2820', '1.5', 4230, 8730, '');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gfcfishlabour`
--

INSERT INTO `gfcfishlabour` (`id`, `date`, `ite`, `kg`, `rate`, `charges`, `total_charges`, `remark`) VALUES
(25, '2024-02-01', 'import', '2000', '3', 6000, 6000, ''),
(26, '2024-02-01', 'takeout', '1000', '3', 3000, 9000, ''),
(31, '2024-02-02', 'export', '180', '3', 540, 9540, ''),
(32, '2024-02-03', 'import', '2000', '3', 6000, 15540, '');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL
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
(1037, 'WP'),
(1038, 'PPP');

-- --------------------------------------------------------

--
-- Table structure for table `labour`
--

CREATE TABLE `labour` (
  `id` int(11) NOT NULL,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `commondity_id` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
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
  `item_id` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(12) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `day` int(11) NOT NULL,
  `rate` varchar(12) NOT NULL,
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
  `item_id` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(15) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `rate` varchar(15) NOT NULL,
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
  `item_id` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payable`
--

CREATE TABLE `payable` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `supplier_id` varchar(15) NOT NULL,
  `purchase_voucher_no` varchar(25) NOT NULL,
  `purchase_amount` bigint(19) NOT NULL,
  `paid_date` date NOT NULL,
  `paid_voucher` varchar(25) NOT NULL,
  `remark` varchar(255) NOT NULL,
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
(70, '2024-01-31', '4000/001', '', 0, '0000-00-00', '', '', 0, 0, 0, 76660500, '0000-00-00'),
(71, '2024-01-31', '4000/A01', '', 0, '0000-00-00', '', '', 0, 0, 0, 43681850, '0000-00-00'),
(72, '2024-01-31', '4000/A02', '', 0, '0000-00-00', '', '', 0, 0, 0, 12876500, '0000-00-00'),
(74, '2024-01-31', '4000/A03', '', 0, '0000-00-00', '', '', 0, 0, 0, 88877950, '0000-00-00'),
(75, '2024-01-31', '4000/A04', '', 0, '0000-00-00', '', '', 0, 0, 0, 5472850, '0000-00-00'),
(76, '2024-01-31', '4000/A05', '', 0, '0000-00-00', '', '', 0, 0, 0, 59740800, '0000-00-00'),
(77, '2024-01-31', '4000/A06', '', 0, '0000-00-00', '', '', 0, 0, 0, 10866450, '0000-00-00'),
(78, '2024-01-31', '4000/A07', '', 0, '0000-00-00', '', '', 0, 0, 0, 26024300, '0000-00-00'),
(79, '2024-01-31', '4000/B01', '', 0, '0000-00-00', '', '', 0, 0, 0, 20241125, '0000-00-00'),
(80, '2024-01-31', '4000/C02', '', 0, '0000-00-00', '', '', 0, 0, 0, 40388800, '0000-00-00'),
(81, '2024-01-31', '4000/H01', '', 0, '0000-00-00', '', '', 0, 0, 0, 444200, '0000-00-00'),
(82, '2024-01-31', '4000/H02', '', 0, '0000-00-00', '', '', 0, 0, 0, 13716150, '0000-00-00'),
(83, '2024-01-31', '4000/K05', '', 0, '0000-00-00', '', '', 0, 0, 0, 129455450, '0000-00-00'),
(84, '2024-01-31', '4000/K03', '', 0, '0000-00-00', '', '', 0, 0, 0, 6972050, '0000-00-00'),
(85, '2024-01-31', '4000/K06', '', 0, '0000-00-00', '', '', 0, 0, 0, 100000, '0000-00-00'),
(86, '2024-01-31', '4000/K04', '', 0, '0000-00-00', '', '', 0, 0, 0, 15518675, '0000-00-00'),
(87, '2024-01-31', '4000/K07', '', 0, '0000-00-00', '', '', 0, 0, 0, 83504000, '0000-00-00'),
(88, '2024-01-31', '4000/M01', '', 0, '0000-00-00', '', '', 0, 0, 0, 9370700, '0000-00-00'),
(89, '2024-01-31', '4000/M06', '', 0, '0000-00-00', '', '', 0, 0, 0, 22150800, '0000-00-00'),
(90, '2024-01-31', '4000/M03', '', 0, '0000-00-00', '', '', 0, 0, 0, 59159500, '0000-00-00'),
(91, '2024-01-31', '4000/M07', '', 0, '0000-00-00', '', '', 0, 0, 0, 16503950, '0000-00-00'),
(92, '2024-01-31', '4000/P01', '', 0, '0000-00-00', '', '', 0, 0, 0, 11251350, '0000-00-00'),
(93, '2024-01-31', '4000/P02', '', 0, '0000-00-00', '', '', 0, 0, 0, 3400000, '0000-00-00'),
(94, '2024-01-31', '4000/S01', '', 0, '0000-00-00', '', '', 0, 0, 0, 89761675, '0000-00-00'),
(95, '2024-01-31', '4000/S03', '', 0, '0000-00-00', '', '', 0, 0, 0, 59993131, '0000-00-00'),
(96, '2024-01-31', '4000/S04', '', 0, '0000-00-00', '', '', 0, 0, 0, 74864800, '0000-00-00'),
(97, '2024-01-31', '4000/S06', '', 0, '0000-00-00', '', '', 0, 0, 0, 229962200, '0000-00-00'),
(98, '2024-01-31', '4000/S07', '', 0, '0000-00-00', '', '', 0, 0, 0, 59055000, '0000-00-00'),
(99, '2024-01-31', '4000/S08', '', 0, '0000-00-00', '', '', 0, 0, 0, 27026300, '0000-00-00'),
(100, '2024-01-31', '4000/T02', '', 0, '0000-00-00', '', '', 0, 0, 0, 6729650, '0000-00-00'),
(101, '2024-01-31', '4000/T03', '', 0, '0000-00-00', '', '', 0, 0, 0, 660774210, '0000-00-00'),
(102, '2024-01-31', '4000/T05', '', 0, '0000-00-00', '', '', 0, 0, 0, 178455415, '0000-00-00'),
(103, '2024-01-31', '4000/T08', '', 0, '0000-00-00', '', '', 0, 0, 0, 45999350, '0000-00-00'),
(104, '2024-01-31', '4000/T01', '', 0, '0000-00-00', '', '', 0, 0, 0, 18018750, '0000-00-00'),
(105, '2024-01-31', '4000/T01', '', 0, '0000-00-00', '', '', 0, 0, 0, 18018750, '0000-00-00'),
(106, '2024-01-31', '4000/T11', '', 0, '0000-00-00', '', '', 0, 0, 0, 498013255, '0000-00-00'),
(107, '2024-01-31', '4000/T07', '', 0, '0000-00-00', '', '', 0, 0, 0, 1041450, '0000-00-00'),
(108, '2024-01-31', '4000/W01', '', 0, '0000-00-00', '', '', 0, 0, 0, 3352700, '0000-00-00'),
(109, '2024-01-31', '4000/Y01', '', 0, '0000-00-00', '', '', 0, 0, 0, 26697900, '0000-00-00'),
(110, '2024-01-31', '4000/Z01', '', 0, '0000-00-00', '', '', 0, 0, 0, 39175400, '0000-00-00'),
(111, '2024-02-02', '4000/T07', '11356', 1166530, '0000-00-00', '', '', 0, 1166530, 59, 0, '0000-00-00'),
(112, '2024-02-02', '4000/Z03', '11357', 571300, '0000-00-00', '', '', 0, 571300, 60, 0, '0000-00-00'),
(113, '2024-02-02', '4000/Z03', '11357', 1205900, '0000-00-00', '', '', 0, 1777200, 61, 0, '0000-00-00'),
(114, '2024-02-02', '4000/Z03', '11357', 3402750, '0000-00-00', '', '', 0, 5179950, 62, 0, '0000-00-00'),
(115, '2024-02-02', '4000/Z03', '11357', 26400, '0000-00-00', '', '', 0, 5206350, 63, 0, '0000-00-00'),
(116, '2024-02-02', '4000/Z03', '11357', 276000, '0000-00-00', '', '', 0, 5482350, 64, 0, '0000-00-00'),
(117, '2024-02-02', '4000/Z03', '11357', 1181250, '0000-00-00', '', '', 0, 6663600, 65, 0, '0000-00-00'),
(119, '2024-02-02', '4000/Z03', '11357', 943800, '0000-00-00', '', '', 0, 7607400, 67, 0, '0000-00-00'),
(120, '2024-02-02', '4000/Z03', '11357', 3667900, '0000-00-00', '', '', 0, 11275300, 68, 0, '0000-00-00'),
(121, '2024-02-03', '4000/T05', '11358', 2007735, '0000-00-00', '', '', 0, 13283035, 69, 0, '0000-00-00'),
(122, '2024-02-03', '4000/T05', '11358', 34372980, '0000-00-00', '', '', 0, 36380715, 70, 0, '0000-00-00'),
(123, '2024-02-03', '4000/T05', '11358', 18109080, '0000-00-00', '', '', 0, 54489795, 71, 0, '0000-00-00'),
(124, '2024-02-04', '4000/T02', '11359', 1056000, '0000-00-00', '', '', 0, 55545795, 72, 0, '0000-00-00'),
(125, '2024-02-04', '4000/T02', '11359', 649400, '0000-00-00', '', '', 0, 1705400, 73, 0, '0000-00-00'),
(126, '2024-02-04', '4000/T02', '11359', 964800, '0000-00-00', '', '', 0, 2670200, 74, 0, '0000-00-00'),
(127, '2024-02-04', '4000/T02', '11359', 1407600, '0000-00-00', '', '', 0, 4077800, 75, 0, '0000-00-00'),
(128, '2024-02-04', '4000/T02', '11359', 2300200, '0000-00-00', '', '', 0, 6378000, 76, 0, '0000-00-00'),
(129, '2024-02-04', '4000/T07', '11360', 2778300, '0000-00-00', '', '', 0, 3944830, 77, 0, '0000-00-00'),
(130, '2024-02-04', '4000/T07', '11360', 581100, '0000-00-00', '', '', 0, 4525930, 78, 0, '0000-00-00'),
(131, '2024-02-04', '4000/T07', '11360', 1354150, '0000-00-00', '', '', 0, 5880080, 79, 0, '0000-00-00'),
(132, '2024-02-05', '4000/Z03', '11361', 809600, '0000-00-00', '', '', 0, 12084900, 80, 0, '0000-00-00'),
(133, '2024-02-05', '4000/Z03', '11361', 1346400, '0000-00-00', '', '', 0, 13431300, 81, 0, '0000-00-00'),
(134, '2024-02-05', '4000/Z03', '11361', 595350, '0000-00-00', '', '', 0, 14026650, 82, 0, '0000-00-00'),
(135, '2024-02-05', '4000/Z03', '11361', 1487800, '0000-00-00', '', '', 0, 15514450, 83, 0, '0000-00-00'),
(136, '2024-02-05', '4000/Z03', '11361', 1894100, '0000-00-00', '', '', 0, 17408550, 84, 0, '0000-00-00'),
(137, '2024-02-05', '4000/Z03', '11361', 371200, '0000-00-00', '', '', 0, 17779750, 85, 0, '0000-00-00'),
(138, '2024-02-05', '4000/Z03', '11361', 1875250, '0000-00-00', '', '', 0, 19655000, 86, 0, '0000-00-00'),
(139, '2024-02-06', '4000/T05', '11362', 2170000, '0000-00-00', '', '', 0, 21825000, 87, 0, '0000-00-00'),
(140, '2024-02-06', '4000/K03', '11362', 72000, '0000-00-00', '', '', 0, 72000, 88, 0, '0000-00-00'),
(141, '2024-02-06', '4000/K03', '11362', 902200, '0000-00-00', '', '', 0, 974200, 89, 0, '0000-00-00'),
(142, '2024-02-06', '4000/T05', '11362', 13210000, '0000-00-00', '', '', 0, 69869795, 90, 0, '0000-00-00'),
(144, '2024-02-07', '4000/B01', '11365', 1707375, '0000-00-00', '', '', 0, 1707375, 92, 0, '0000-00-00'),
(145, '2024-02-07', '4000/B01', '11365', 1135650, '0000-00-00', '', '', 0, 2843025, 93, 0, '0000-00-00'),
(146, '2024-02-07', '4000/B01', '11365', 264600, '0000-00-00', '', '', 0, 3107625, 94, 0, '0000-00-00'),
(147, '2024-02-07', '4000/B01', '11365', 180000, '0000-00-00', '', '', 0, 3287625, 95, 0, '0000-00-00'),
(148, '2024-02-07', '4000/B01', '11365', 3676625, '0000-00-00', '', '', 0, 6964250, 96, 0, '0000-00-00'),
(149, '2024-02-07', '4000/B01', '11365', 2038250, '0000-00-00', '', '', 0, 9002500, 97, 0, '0000-00-00'),
(150, '2024-02-07', '4000/B01', '11365', 1277650, '0000-00-00', '', '', 0, 10280150, 98, 0, '0000-00-00'),
(151, '2024-02-07', '4000/B01', '11365', 1596000, '0000-00-00', '', '', 0, 11876150, 99, 0, '0000-00-00'),
(152, '2024-02-07', '4000/T02', '11366', 1949200, '0000-00-00', '', '', 0, 13825350, 100, 0, '0000-00-00'),
(153, '2024-02-07', '4000/T02', '11366', 1536800, '0000-00-00', '', '', 0, 9864000, 101, 0, '0000-00-00'),
(154, '2024-02-07', '4000/T02', '11366', 1277100, '0000-00-00', '', '', 0, 11141100, 102, 0, '0000-00-00'),
(155, '2024-02-07', '4000/T02', '11366', 1156800, '0000-00-00', '', '', 0, 12293100, 103, 0, '0000-00-00'),
(156, '2024-02-07', '4000/T02', '11366', 2543200, '0000-00-00', '', '', 0, 14836300, 104, 0, '0000-00-00'),
(157, '2024-02-07', '4000/T02', '11366', 1472000, '0000-00-00', '', '', 0, 16308300, 105, 0, '0000-00-00'),
(158, '2024-02-07', '4000/T02', '11366', 72450, '0000-00-00', '', '', 0, 16380750, 106, 0, '0000-00-00'),
(159, '2024-02-07', '4000/T07', '11367', 1766100, '0000-00-00', '', '', 0, 7646180, 107, 0, '0000-00-00'),
(160, '2024-02-07', '4000/T07', '11367', 600600, '0000-00-00', '', '', 0, 8246780, 108, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `role_id`, `permission`) VALUES
(1, 1, 'manage_accounts,manage_role,manage_sale,manage_purchase,manage_cashbook,manage_acpayable,manage_accountreceivable,manage_transactionmanage_general_ledger,manage_customers,manage_supplier,manage_coldstoreitem,manage_item,manage_actype,manage_acname,manage_coldstorecharges,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport,manage_shippmentexport,manage_truckexport,sale_report,purchase_report,payable_report,manage_mcreport,manage_tclmcstock'),
(2, 2, ',manage_item,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_mcreport,manage_tclmcstock'),
(3, 3, ',manage_coldstoreitem,manage_coldstorecharges,manage_shippmentexport,manage_truckexport'),
(4, 4, ',manage_item,manage_form7,manage_form10,manage_truckexport,manage_mcreport,manage_tclmcstock'),
(5, 5, ',manage_coldstoreitem,manage_coldstorecharges');

-- --------------------------------------------------------

--
-- Table structure for table `processing`
--

CREATE TABLE `processing` (
  `id` int(11) NOT NULL,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `commondity_id` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(15) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `rate` varchar(15) NOT NULL,
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
  `supplier_id` varchar(255) NOT NULL,
  `tclfrozen` varchar(255) NOT NULL,
  `commodity` varchar(255) NOT NULL,
  `size` varchar(11) NOT NULL,
  `viss` varchar(11) NOT NULL,
  `pcs` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`no`, `date`, `voucher_no`, `supplier_id`, `tclfrozen`, `commodity`, `size`, `viss`, `pcs`, `price`, `amount`) VALUES
(59, '2024-02-02', 11356, '4000/T07', 'frozen', '1010', 'J', '220.1', 0, 5300, 1166530),
(60, '2024-02-02', 11357, '4000/Z03', 'frozen', '1002', '2 D', '19.7', 16, 29000, 571300),
(61, '2024-02-02', 11357, '4000/Z03', 'frozen', '1002', '2 up', '38.9', 26, 31000, 1205900),
(62, '2024-02-02', 11357, '4000/Z03', 'frozen', '1002', '3 up', '104.7', 33, 32500, 3402750),
(63, '2024-02-02', 11357, '4000/Z03', 'frozen', '1001', '1 D', '1.2', 2, 22000, 26400),
(64, '2024-02-02', 11357, '4000/Z03', 'frozen', '1001', '1 up', '12', 14, 23000, 276000),
(65, '2024-02-02', 11357, '4000/Z03', 'frozen', '1001', '2 D', '37.5', 31, 31500, 1181250),
(67, '2024-02-02', 11357, '4000/Z03', 'frozen', '1001', '2 up', '28.6', 19, 33000, 943800),
(68, '2024-02-02', 11357, '4000/Z03', 'frozen', '1001', '3up', '85.3', 28, 43000, 3667900),
(69, '2024-02-03', 11358, '4000/T05', 'frozen', '1031', '3up', '293.1', 0, 6850, 2007735),
(70, '2024-02-03', 11358, '4000/T05', 'frozen', '1031', '4up', '3369.9', 0, 10200, 34372980),
(71, '2024-02-03', 11358, '4000/T05', 'frozen', '1031', '5up', '1775.4', 0, 10200, 18109080),
(72, '2024-02-04', 11359, '4000/T02', 'frozen', '1001', '3up', '24', 10, 44000, 1056000),
(73, '2024-02-04', 11359, '4000/T02', 'frozen', '1001', '2up', '19.1', 13, 34000, 649400),
(74, '2024-02-04', 11359, '4000/T02', 'frozen', '1001', '1.5up', '40.2', 39, 24000, 964800),
(75, '2024-02-04', 11359, '4000/T02', 'frozen', '1002', '3up', '41.4', 17, 34000, 1407600),
(76, '2024-02-04', 11359, '4000/T02', 'frozen', '1002', '2up', '74.2', 49, 31000, 2300200),
(77, '2024-02-04', 11360, '4000/T07', 'frozen', '1020', '5up', '132.3', 30, 21000, 2778300),
(78, '2024-02-04', 11360, '4000/T07', 'frozen', '1020', '3up', '29.8', 12, 19500, 581100),
(79, '2024-02-04', 11360, '4000/T07', 'frozen', '1010', 'J', '255.5', 0, 5300, 1354150),
(80, '2024-02-05', 11361, '4000/Z03', 'frozen', '1001', '1up', '35.2', 41, 23000, 809600),
(81, '2024-02-05', 11361, '4000/Z03', 'frozen', '1001', '2up', '40.8', 27, 33000, 1346400),
(82, '2024-02-05', 11361, '4000/Z03', 'frozen', '1001', '2 D', '18.9', 16, 31500, 595350),
(83, '2024-02-05', 11361, '4000/Z03', 'frozen', '1001', '3up', '34.6', 11, 43000, 1487800),
(84, '2024-02-05', 11361, '4000/Z03', 'frozen', '1002', '2up', '61.1', 42, 31000, 1894100),
(85, '2024-02-05', 11361, '4000/Z03', 'frozen', '1002', '2 D', '12.8', 11, 29000, 371200),
(86, '2024-02-05', 11361, '4000/Z03', 'frozen', '1002', '3up', '57.7', 17, 32500, 1875250),
(87, '2024-02-06', 11362, '4000/T05', 'frozen', '1031', '18/24', '350', 0, 6200, 2170000),
(88, '2024-02-06', 11362, '4000/K03', 'frozen', '1014', 'J', '4.8', 3, 15000, 72000),
(89, '2024-02-06', 11362, '4000/K03', 'frozen', '1027', 'J', '69.4', 41, 13000, 902200),
(90, '2024-02-06', 11362, '4000/T05', 'frozen', '1031', '4/5up', '1321', 0, 10000, 13210000),
(92, '2024-02-07', 11365, '4000/B01', 'frozen', '1001', '3up', '39.25', 17, 43500, 1707375),
(93, '2024-02-07', 11365, '4000/B01', 'frozen', '1001', '2up', '33.9', 23, 33500, 1135650),
(94, '2024-02-07', 11365, '4000/B01', 'frozen', '1001', '1.5up', '9.8', 11, 27000, 264600),
(95, '2024-02-07', 11365, '4000/B01', 'frozen', '1001', '1up', '7.5', 11, 24000, 180000),
(96, '2024-02-07', 11365, '4000/B01', 'frozen', '1002', '3/4up', '109.75', 46, 33500, 3676625),
(97, '2024-02-07', 11365, '4000/B01', 'frozen', '1002', '2up', '65.75', 57, 31000, 2038250),
(98, '2024-02-07', 11365, '4000/B01', 'frozen', '1002', '1up', '55.55', 61, 23000, 1277650),
(99, '2024-02-07', 11365, '4000/B01', 'frozen', '1020', '3up', '76', 33, 21000, 1596000),
(100, '2024-02-07', 11366, '4000/T02', 'frozen', '1001', '3up', '44.3', 19, 44000, 1949200),
(101, '2024-02-07', 11366, '4000/T02', 'frozen', '1001', '2up', '45.2', 32, 34000, 1536800),
(102, '2024-02-07', 11366, '4000/T02', 'frozen', '1001', '1.5up', '47.3', 47, 27000, 1277100),
(103, '2024-02-07', 11366, '4000/T02', 'frozen', '1001', '1up', '48.2', 60, 24000, 1156800),
(104, '2024-02-07', 11366, '4000/T02', 'frozen', '1002', '3up', '74.8', 30, 34000, 2543200),
(105, '2024-02-07', 11366, '4000/T02', 'frozen', '1002', '2up', '46', 30, 32000, 1472000),
(106, '2024-02-07', 11366, '4000/T02', 'frozen', '1016', 'J', '6.3', 6, 11500, 72450),
(107, '2024-02-07', 11367, '4000/T07', 'frozen', '1020', '5up', '84.1', 20, 21000, 1766100),
(108, '2024-02-07', 11367, '4000/T07', 'frozen', '1020', '3up', '30.8', 12, 19500, 600600);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Stock'),
(3, 'Shippment'),
(4, 'TCL'),
(5, 'Coldstore');

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
(58, '4000/001', '4 Zaw', '', ''),
(59, '4000/002', '4 Zaw (TCL)', '', ''),
(60, '4000/A01', 'AK', '', ''),
(61, '4000/A02', 'Arr Kae', '', ''),
(62, '4000/A03', 'Aung Naing Oo', '', ''),
(63, '4000/B01', 'Bar Bu lay', '', ''),
(64, '4000/C01', 'Chit Oo (D51)', '', ''),
(65, '4000/H01', 'Htet Aung Lin', '', ''),
(66, '4000/H02', 'Htay Win', '', ''),
(67, '4000/K01', 'Kyaw Zay Ya (TCL)', '', ''),
(68, '4000/K02', 'Kyaw Zin', '', ''),
(69, '4000/K03', 'KTO', '', ''),
(70, '4000/K04', 'Kaung Myat', '', ''),
(71, '4000/L01', 'Lie Chit', '', ''),
(72, '4000/M01', 'M.A', '', ''),
(73, '4000/M02', 'Maung Soe', '', ''),
(74, '4000/M03', 'Mg Mg Nyunt', '', ''),
(75, '4000/N01', 'Nanda', '', ''),
(76, '4000/N02', 'Naing Win', '', ''),
(77, '4000/P01', 'Phone Naing', '', ''),
(78, '4000/S01', 'Shwe Late', '', ''),
(79, '4000/S02', 'Shwe Late (TCL)', '', ''),
(80, '4000/S03', 'Soe Min', '', ''),
(81, '4000/S04', 'Si Thu (22)', '', ''),
(82, '4000/S05', 'Si Thu (22) (TCL)', '', ''),
(83, '4000/S06', 'Soe Thein', '', ''),
(84, '4000/S07', 'Soe Thein (TCL)', '', ''),
(85, '4000/S08', 'Soe Naing', '', ''),
(86, '4000/S09', 'Soe Naing (TCL)', '', ''),
(87, '4000/T01', 'Thet Paing', '', ''),
(88, '4000/T02', 'Thein Htay', '', ''),
(89, '4000/T03', 'Thin Thin Yee', '', ''),
(90, '4000/T04', 'Thin Thin Yee (TCL)', '', ''),
(91, '4000/T05', 'Thet Oo', '', ''),
(92, '4000/T06', 'Thar Hla', '', ''),
(93, '4000/T07', 'Thaung Tun', '', ''),
(94, '4000/T08', 'Than Than Myint', '', ''),
(95, '4000/T09', 'Than Than Myint (TCL)', '', ''),
(96, '4000/T10', 'Tun Zaw Min (TCL)', '', ''),
(97, '4000/W01', 'Win Bo', '', ''),
(98, '4000/W02', 'Win Bo (TCL)', '', ''),
(99, '4000/Y01', 'Ye Yint', '', ''),
(100, '4000/Z01', 'Zaw Zaw Latt', '', ''),
(101, '4000/Z02', 'Zaw Zaw Latt (TCL)', '', ''),
(102, '4000/S10', 'Shaw Myay', '', ''),
(103, '4000/M04', 'Carton Box (Myo Myint Mo Oo)', '', ''),
(104, '4000/M05', 'Carton Box (Myanmar HJ)', '', ''),
(105, '4000/S11', 'Carton Box( Syan Pyae)', '', ''),
(106, '4000/H03', 'Hlaing Htake Khaung', '', ''),
(107, '4000/G01', 'GFC', '', ''),
(109, '4000/A04', 'Aung Kyaw Moe', '', ''),
(110, '4000/A05', 'Aung Myo Min', '', ''),
(111, '4000/A06', 'Aung Zaw Oo', '', ''),
(112, '4000/A07', 'A Thay Lay', '', ''),
(113, '4000/C02', 'Cho Mg', '', ''),
(114, '4000/K05', 'Kyaw Zay Ya', '', ''),
(115, '4000/K06', 'Ka Yin Lay', '', ''),
(116, '4000/K07', 'Khin Mg Myint', '', ''),
(117, '4000/M06', 'Mg Mg Soe', '', ''),
(118, '4000/M07', 'Moe Kyaw', '', ''),
(119, '4000/P02', 'Parami (Balachaung)', '', ''),
(120, '4000/T11', 'Tun Zaw Min', '', ''),
(121, '4000/Z03', 'Zaw Myat Thu', '', '');

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
  `loading_no` text NOT NULL,
  `loading_mc` int(11) NOT NULL,
  `grandtotal_mc` bigint(77) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `truckfoambox`
--

INSERT INTO `truckfoambox` (`id`, `item_id`, `size`, `pcsperbox`, `kgperbox`, `mc`, `netweight`, `foambox_no`, `total_foambox_no`, `invoice_no`, `link_id`) VALUES
(1, '1023', '3up', 100, 100, 10, 1000, '1,2,3,4,5', '5', 'MOP001', 1),
(5, '1023', '2up', 100, 100, 20, 2000, '1,2,3,11,22,33,44,55', '8', 'AS121', 5),
(6, '1029', '6up', 20, 300, 10, 3000, '1,2,3,4,5,6,7,8,9,10', '10', '6767', 6),
(12, '1010', '3up', 21, 30, 20, 600, '', '', 'OPO-001', 12),
(13, '1037', '100/200 G', 240, 40, 1, 40, '', '', 'MOP001', 13),
(14, '1037', '100/200 G', 319, 40, 1, 40, '', '', 'MOP001', 14),
(15, '1037', '100/200 G', 333, 40, 1, 40, '', '', 'MOP001', 15),
(16, '1023', '4up', 240, 40, 1, 40, '6,7,8,9,10', '5', 'MOP001', 16),
(17, '1023', '5up', 319, 40, 1, 40, '11,12,13,14,15', '5', 'MOP001', 17);

-- --------------------------------------------------------

--
-- Table structure for table `truckpackingliststock`
--

CREATE TABLE `truckpackingliststock` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `invoice_no` varchar(11) NOT NULL,
  `truck_no` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `truckpackingliststock`
--

INSERT INTO `truckpackingliststock` (`id`, `date`, `invoice_no`, `truck_no`) VALUES
(1, '2023-11-25', 'MOP001', '31'),
(3, '2023-12-14', 'AS121', '40'),
(4, '2023-12-12', '6767', '5964'),
(5, '2023-12-22', 'OPO-001', '29');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `truckpackingliststockinfo`
--

INSERT INTO `truckpackingliststockinfo` (`id`, `item_id`, `size`, `pcsperbox`, `kgperbox`, `mc`, `netweight`, `totalgrossweight`, `invoice_no`) VALUES
(1, '1023', '3up', 100, 100, 10, 1000, 600, 'MOP001'),
(5, '1023', '2up', 100, 100, 20, 2000, 1200, 'AS121'),
(6, '1029', '6up', 20, 300, 10, 3000, 600, '6767'),
(12, '1010', '3up', 21, 30, 20, 600, 1200, 'OPO-001'),
(13, '1037', '100/200 G', 240, 40, 1, 40, 60, 'MOP001'),
(14, '1037', '100/200 G', 319, 40, 1, 40, 60, 'MOP001'),
(15, '1037', '100/200 G', 333, 40, 1, 40, 60, 'MOP001'),
(16, '1023', '4up', 240, 40, 1, 40, 60, 'MOP001'),
(17, '1023', '5up', 319, 40, 1, 40, 60, 'MOP001');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `truckpackingmaterial`
--

INSERT INTO `truckpackingmaterial` (`id`, `date`, `remark`, `ice`, `miscellous`, `tape`, `foam_box`, `plastic`, `total_charges`, `total_viss`, `form10kg`, `costperkg`, `invoice_no`) VALUES
(2, '2023-12-10', 'Hilsa Marical', 25, 30, 23, 10, 22, 110, 0, 600, 0.183333, 'AS121'),
(3, '2023-12-12', 'hello', 100, 50, 100, 200, 200, 650, 0, 200, 3.25, '6767'),
(4, '2023-12-22', 'diputi', 100, 30000, 100, 100, 100, 30400, 0, 100, 304, 'OPO-001'),
(5, '2024-01-04', 'Rohu-20', 475000, 30000, 266800, 1767500, 118800, 2658100, 0, 7167, 370.88, 'MOP001');

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
  `mtorst` varchar(11) NOT NULL,
  `ygntomtorst_charges` int(11) NOT NULL,
  `mtorsttotechnck_charges` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trucktotalcosting`
--

INSERT INTO `trucktotalcosting` (`id`, `date`, `item_id`, `size`, `total_kg`, `priceperviss`, `priceperkg`, `percentage`, `packing_charges`, `mtorst`, `ygntomtorst_charges`, `mtorsttotechnck_charges`, `labour_charges`, `packingandtransport`, `total`, `grand_total`, `rate`, `costing_usd`, `selling_rate`, `profitperkg`, `original_cost`, `selling_amount`, `profit`, `invoice_no`, `link_id`, `infoid`) VALUES
(1, '0000-00-00', '1023', '3up', 100, 35000, 21419.8, 22082.3, 0, 'To MT', 300000, 500000, 30000, 830000, 830000, 852082, 3000, 284.027, 300, 15.973, 28402.7, 30000, 1597.3, 'MOP001', 1, 0),
(4, '0000-00-00', '1023', '2up', 100, 1100, 673.195, 686.933, 0, '', 100000, 150000, 100000, 350000, 300000, 300687, 3000, 100.229, 120, 19.771, 10022.9, 12000, 1977.1, 'AS121', 5, 3),
(5, '0000-00-00', '1029', '6up', 300, 1000, 611.995, 624.485, 3, '', 20000, 250000, 100000, 370003, 350000, 350624, 3000, 116.875, 130, 13.125, 35062.5, 39000, 3937.5, '6767', 6, 4),
(11, '0000-00-00', '1010', '3up', 600, 1100, 673.195, 686.933, 272, 'To ST', 300, 300, 100, 972, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'OPO-001', 12, 5),
(12, '0000-00-00', '1037', '100/200 G', 40, 35000, 21419.8, 22082.3, 0, 'To ST', 300000, 500000, 30000, 830000, 830000, 852082, 3000, 284.027, 300, 15.973, 34083.2, 36000, 1916.76, 'MOP001', 13, 1),
(13, '0000-00-00', '1037', '100/200 G', 40, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'MOP001', 14, 1),
(14, '0000-00-00', '1037', '100/200 G', 40, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'MOP001', 15, 1),
(15, '0000-00-00', '1023', '4up', 40, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'MOP001', 16, 1),
(16, '0000-00-00', '1023', '5up', 40, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'MOP001', 17, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(18, '04:28:18.000000', '2023-12-08', 'admin', 'admin', 'Login Success'),
(19, '05:20:45.000000', '2023-12-11', 'admin', 'admin', 'Login Success'),
(20, '05:41:53.000000', '2023-12-11', 'admin', '', 'Logout Success'),
(21, '05:47:25.000000', '2023-12-11', 'admin', 'admin', 'Login Success'),
(22, '04:36:30.000000', '2023-12-13', 'admin', 'admin', 'Login Success'),
(23, '05:06:37.000000', '2023-12-14', 'admin', 'admin', 'Login Success'),
(24, '11:49:21.000000', '2023-12-22', 'admin', 'admin', 'Login Success'),
(25, '10:12:31.000000', '2023-12-28', 'admin', 'admin', 'Login Success'),
(26, '05:51:05.000000', '2023-12-28', 'admin', 'admin', 'Login Success'),
(27, '09:29:01.000000', '2023-12-29', 'admin', 'admin', 'Login Success'),
(28, '05:58:12.000000', '2023-12-29', 'admin', 'admin', 'Login Success'),
(29, '09:48:13.000000', '2023-12-29', 'admin', '', 'Logout Success'),
(30, '10:55:27.000000', '2023-12-30', 'admin', 'admin', 'Login Success'),
(31, '11:23:25.000000', '2023-12-30', 'admin', 'admin', 'Login Success'),
(32, '10:34:41.000000', '2024-01-02', 'admin', 'admin', 'Login Success'),
(33, '05:32:01.000000', '2024-01-02', 'admin', 'admin', 'Login Success'),
(34, '07:46:59.000000', '2024-01-03', 'admin', 'admin', 'Login Success'),
(35, '08:06:22.000000', '2024-01-03', 'admin', '', 'Logout Success'),
(36, '08:06:27.000000', '2024-01-03', 'Ma Soe Soe Khaing	', 'stockstock', 'Login Failed'),
(37, '08:06:42.000000', '2024-01-03', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(38, '08:06:57.000000', '2024-01-03', 'Ma Soe Soe Khaing', '', 'Logout Success'),
(39, '08:07:14.000000', '2024-01-03', 'Ma Sandar Aung', 'sandaraung', 'Login Password Invalid'),
(40, '08:07:17.000000', '2024-01-03', 'admin', 'admin', 'Login Success'),
(41, '08:07:24.000000', '2024-01-03', 'admin', '', 'Logout Success'),
(42, '08:07:29.000000', '2024-01-03', 'Ma Sandar Aung', '12341234', 'Login Success'),
(43, '08:09:57.000000', '2024-01-03', 'Ma Sandar Aung', '', 'Logout Success'),
(44, '08:10:06.000000', '2024-01-03', 'Lwin Mi Khaing', 'shippment', 'Login Success'),
(45, '08:10:20.000000', '2024-01-03', 'Lwin Mi Khaing', '', 'Logout Success'),
(46, '08:10:27.000000', '2024-01-03', 'Lwin Mi Khaing', 'shippment', 'Login Success'),
(47, '08:10:45.000000', '2024-01-03', 'Lwin Mi Khaing', '', 'Logout Success'),
(48, '08:10:56.000000', '2024-01-03', 'Ma Sandar Aung', 'sandaraung', 'Login Password Invalid'),
(49, '08:11:06.000000', '2024-01-03', 'Ma Sandar Aung', '12341234', 'Login Success'),
(50, '08:13:04.000000', '2024-01-03', 'Ma Sandar Aung', '', 'Logout Success'),
(51, '08:13:09.000000', '2024-01-03', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(52, '08:13:20.000000', '2024-01-03', 'Thin Zar Kyaw', '', 'Logout Success'),
(53, '08:13:27.000000', '2024-01-03', 'Ma Sandar Aung', '12341234', 'Login Success'),
(54, '08:13:50.000000', '2024-01-03', 'Ma Sandar Aung', '', 'Logout Success'),
(55, '08:14:00.000000', '2024-01-03', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(56, '08:14:10.000000', '2024-01-03', 'Thin Zar Kyaw', '', 'Logout Success'),
(57, '08:14:18.000000', '2024-01-03', 'Ma Sandar Aung', '12341234', 'Login Success'),
(58, '08:14:28.000000', '2024-01-03', 'Ma Sandar Aung', '', 'Logout Success'),
(59, '08:14:33.000000', '2024-01-03', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(60, '08:14:38.000000', '2024-01-03', 'Thin Zar Kyaw', '', 'Logout Success'),
(61, '08:14:42.000000', '2024-01-03', 'Ma Sandar Aung', '12341234', 'Login Success'),
(62, '05:34:16.000000', '2024-01-03', 'admin', 'admin', 'Login Success'),
(63, '10:31:25.000000', '2024-01-04', 'admin', 'admin', 'Login Success'),
(64, '01:55:39.000000', '2024-01-04', 'admin', 'admin', 'Login Success'),
(65, '10:53:29.000000', '2024-01-05', 'admin', 'admin', 'Login Success'),
(66, '09:40:48.000000', '2024-01-05', 'admin', 'admin', 'Login Success'),
(67, '11:11:53.000000', '2024-01-06', 'admin', 'admin', 'Login Success'),
(68, '12:29:42.000000', '2024-01-06', 'admin', 'admin', 'Login Success'),
(69, '04:58:32.000000', '2024-01-06', 'admin', '', 'Logout Success'),
(70, '10:33:57.000000', '2024-02-05', 'admin', 'admin', 'Login Success'),
(71, '12:11:37.000000', '2024-02-05', 'admin', '', 'Logout Success'),
(72, '11:05:32.000000', '2024-02-06', 'admin', 'admin', 'Login Success'),
(73, '12:29:03.000000', '2024-02-06', 'admin', 'admin', 'Login Success'),
(74, '12:55:47.000000', '2024-02-06', 'admin', '', 'Logout Success'),
(75, '01:45:33.000000', '2024-02-06', 'admin', 'ad,in', 'Login Password Invalid'),
(76, '01:45:41.000000', '2024-02-06', 'admin', 'admin', 'Login Success'),
(77, '02:22:09.000000', '2024-02-06', 'admin', 'admin', 'Login Success'),
(78, '02:34:32.000000', '2024-02-06', 'admin', 'admin', 'Login Success'),
(79, '02:35:00.000000', '2024-02-06', 'admin', '', 'Logout Success'),
(80, '02:35:22.000000', '2024-02-06', 'admin', '', 'Logout Success'),
(81, '03:28:47.000000', '2024-02-06', 'admin', '', 'Logout Success'),
(82, '11:22:08.000000', '2024-02-07', 'admin', 'admin', 'Login Success'),
(83, '11:39:19.000000', '2024-02-07', 'admin', 'admin', 'Login Success'),
(84, '01:40:37.000000', '2024-02-07', 'admin', '', 'Logout Success'),
(85, '08:57:44.000000', '2024-02-08', 'admin', 'admin', 'Login Success'),
(86, '11:30:56.000000', '2024-02-08', 'admin', 'admin', 'Login Success'),
(87, '01:06:58.000000', '2024-02-08', 'admin', '', 'Logout Success'),
(88, '01:11:35.000000', '2024-02-08', 'admin', '', 'Logout Success'),
(89, '01:11:53.000000', '2024-02-08', '', '', 'Logout Success'),
(90, '06:49:59.000000', '2024-02-08', 'admin', 'admin', 'Login Success'),
(91, '07:04:16.000000', '2024-02-08', 'admin', 'admin', 'Login Success'),
(92, '07:31:38.000000', '2024-02-08', 'admin', '', 'Logout Success'),
(93, '08:15:15.000000', '2024-02-08', 'admin', 'admin', 'Login Success'),
(94, '08:21:39.000000', '2024-02-08', 'admin', 'admi', 'Login Password Invalid'),
(95, '08:21:41.000000', '2024-02-08', 'admin', 'admn', 'Login Password Invalid'),
(96, '08:21:45.000000', '2024-02-08', 'admin', 'admin', 'Login Success'),
(97, '09:10:28.000000', '2024-02-08', 'admin', '', 'Logout Success'),
(98, '09:43:40.000000', '2024-02-08', 'admin', 'admin', 'Login Success'),
(99, '10:15:13.000000', '2024-02-08', 'admin', '', 'Logout Success'),
(100, '01:07:33.000000', '2024-02-09', 'admin', 'admin', 'Login Success'),
(101, '01:16:36.000000', '2024-02-09', 'admin', '', 'Logout Success'),
(102, '01:16:50.000000', '2024-02-09', 'admin', 'admin', 'Login Success'),
(103, '01:48:16.000000', '2024-02-09', 'admin', 'admin', 'Login Success'),
(104, '01:48:25.000000', '2024-02-09', 'admin', '', 'Logout Success'),
(105, '01:59:00.000000', '2024-02-09', 'admin', 'admin', 'Login Success'),
(106, '01:59:41.000000', '2024-02-09', 'admin', '', 'Logout Success'),
(107, '02:11:58.000000', '2024-02-09', 'admin', 'admin', 'Login Success'),
(108, '02:17:06.000000', '2024-02-09', 'admin', 'admin', 'Login Success'),
(109, '02:27:12.000000', '2024-02-09', 'admin', 'admin', 'Login Success'),
(110, '02:46:27.000000', '2024-02-09', 'admin', 'admin', 'Login Success'),
(111, '03:10:30.000000', '2024-02-09', 'admin', 'admin', 'Login Success'),
(112, '03:13:14.000000', '2024-02-09', 'admin', 'admin', 'Login Success'),
(113, '04:25:48.000000', '2024-02-09', 'admin', '', 'Logout Success'),
(114, '04:25:50.000000', '2024-02-09', '', '', 'Logout Success'),
(115, '04:25:59.000000', '2024-02-09', 'admin', 'admin', 'Login Success'),
(116, '04:52:33.000000', '2024-02-09', 'admin', '', 'Logout Success'),
(117, '04:55:34.000000', '2024-02-09', 'admin', '', 'Logout Success'),
(118, '01:31:36.000000', '2024-02-13', 'admin', 'admin', 'Login Success'),
(119, '02:17:57.000000', '2024-02-13', 'admin', 'admin', 'Login Success'),
(120, '09:57:17.000000', '2024-02-14', 'admin', 'admin', 'Login Success'),
(121, '10:01:48.000000', '2024-02-14', 'admin', 'admin', 'Login Success'),
(122, '10:17:04.000000', '2024-02-14', 'admin', 'admin', 'Login Success'),
(123, '10:30:36.000000', '2024-02-14', 'admin', 'admin', 'Login Success'),
(124, '10:53:02.000000', '2024-02-14', 'admin', '', 'Logout Success'),
(125, '11:35:44.000000', '2024-02-14', 'admin', 'admin', 'Login Success'),
(126, '01:42:35.000000', '2024-02-14', 'admin', 'admin', 'Login Success'),
(127, '01:44:47.000000', '2024-02-14', 'admin', 'admin', 'Login Success'),
(128, '01:46:08.000000', '2024-02-14', 'admin', '', 'Logout Success'),
(129, '01:46:10.000000', '2024-02-14', 'admin', '', 'Logout Success'),
(130, '01:46:47.000000', '2024-02-14', 'admin', 'admin', 'Login Success'),
(131, '02:49:05.000000', '2024-02-14', 'admin', 'admin', 'Login Success'),
(132, '07:33:50.000000', '2024-02-14', 'admin', 'admin', 'Login Success'),
(133, '07:59:20.000000', '2024-02-14', 'admin', 'admin', 'Login Success'),
(134, '08:05:55.000000', '2024-02-14', 'admin', '', 'Logout Success'),
(135, '08:06:03.000000', '2024-02-14', 'admin', 'admin', 'Login Success'),
(136, '08:25:33.000000', '2024-02-14', 'admin', '', 'Logout Success'),
(137, '09:37:12.000000', '2024-02-15', 'admin', 'admin', 'Login Success');

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
-- Indexes for table `form7stocktcl`
--
ALTER TABLE `form7stocktcl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form10stock`
--
ALTER TABLE `form10stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form10stocktcl`
--
ALTER TABLE `form10stocktcl`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `acname`
--
ALTER TABLE `acname`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322;

--
-- AUTO_INCREMENT for table `actualinvoice`
--
ALTER TABLE `actualinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `actype`
--
ALTER TABLE `actype`
  MODIFY `acid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `bankdetail`
--
ALTER TABLE `bankdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cashbook`
--
ALTER TABLE `cashbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `coldstore`
--
ALTER TABLE `coldstore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `container`
--
ALTER TABLE `container`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `form7stock`
--
ALTER TABLE `form7stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `form7stocktcl`
--
ALTER TABLE `form7stocktcl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `form10stock`
--
ALTER TABLE `form10stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `form10stocktcl`
--
ALTER TABLE `form10stocktcl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `general_ledger`
--
ALTER TABLE `general_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `gfcfishlabour`
--
ALTER TABLE `gfcfishlabour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `gfcmcstock`
--
ALTER TABLE `gfcmcstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `gfctotal`
--
ALTER TABLE `gfctotal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hhkmcstock`
--
ALTER TABLE `hhkmcstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `hhkstock`
--
ALTER TABLE `hhkstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `invoice_costing`
--
ALTER TABLE `invoice_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1039;

--
-- AUTO_INCREMENT for table `labour`
--
ALTER TABLE `labour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `packingmaterial`
--
ALTER TABLE `packingmaterial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payable`
--
ALTER TABLE `payable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `processing`
--
ALTER TABLE `processing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `receivable`
--
ALTER TABLE `receivable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `repacking`
--
ALTER TABLE `repacking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `repackingout`
--
ALTER TABLE `repackingout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `tclmcstock`
--
ALTER TABLE `tclmcstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `total_charges`
--
ALTER TABLE `total_charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `truckactualinvoice`
--
ALTER TABLE `truckactualinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `truckdeclare`
--
ALTER TABLE `truckdeclare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `truckfoambox`
--
ALTER TABLE `truckfoambox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `truckpackingliststock`
--
ALTER TABLE `truckpackingliststock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `truckpackingliststockinfo`
--
ALTER TABLE `truckpackingliststockinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `truckpackingmaterial`
--
ALTER TABLE `truckpackingmaterial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `trucktotalcosting`
--
ALTER TABLE `trucktotalcosting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `userlogs`
--
ALTER TABLE `userlogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
