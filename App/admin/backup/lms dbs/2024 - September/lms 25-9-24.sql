-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2024 at 08:37 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

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
(1, 'Administrator', 'protechadmin2024***', 'admin@gmail.com', 1),
(2, 'Ma Sandar Aung', '12341234', 'sandaraung@gmail.com', 1),
(3, 'Ma Soe Soe Khaing', 'stockstock', 'masoesoekhaing@gmail.com', 2),
(4, 'Lwin Mi Khaing', 'shippment', 'lwinmikhaing@gmail.com', 3),
(6, 'Lin Lin Naing', 'coldstore', 'linlinnaing@gmail.com', 5),
(7, 'Su Thiri Kyaw', 'su122333', 'suthirikyaw@gmail.com', 4);

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
(229, '3600/001', 35, 'Main Cash Kyats A/C'),
(230, '5000/001', 36, 'Revenue-South Asia Food (USA) A/C'),
(231, '5000/002', 36, 'Revenue-Jamuna Food (Canada) A/C'),
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
(321, '3300/003', 35, 'Jamuna Food-Canada A/C'),
(322, '9100/009', 39, 'Bank Charges'),
(323, '9100/010', 39, 'Bonus Expense'),
(324, '9100/011', 39, 'Donation Expense'),
(326, '9100/012', 39, 'Food & Refreshment Expense'),
(327, '9100/013', 39, 'Water Bill'),
(328, '9100/014', 39, 'Upkeep of Motor Vehicle'),
(329, '9100/015', 39, 'Gift & Present Expense'),
(330, '3300/004', 35, 'ITALY'),
(331, '3300/005', 35, 'Western Trader (Kolkata)'),
(333, '9100/016', 39, 'Printing and Stationery Expense A/C'),
(334, '9100/017', 39, 'Management Expense A/C'),
(335, '9100/018', 39, 'Electricity Expense'),
(336, '4000/K08', 40, 'Ko Ma Noe'),
(337, '4000/D01', 40, 'Dry Fish (Shwe Hinn Thar)'),
(338, '4000/D02', 40, 'Dry Fish (Myo Thant)'),
(340, '9100/019', 39, 'Computer Accessories Expense'),
(342, '9100/020', 39, 'Agent Fees Expense'),
(343, '9100/021', 39, 'DOF Charges Expense'),
(344, '9100/022', 39, 'Ocean Pacific Expense'),
(345, '9100/023', 39, 'Household Expense'),
(346, '9100/024', 39, 'Penity Fees'),
(347, '9100/025', 39, 'Car Parking '),
(348, '4000/k09', 40, 'Kyaw Thein Than'),
(349, '4000/G02', 40, 'GM'),
(351, '9100/026', 39, 'Company Registration Expense'),
(352, '9100/027', 39, 'Service Charges'),
(353, '9100/028', 39, 'Operating Expense'),
(354, '9100/029', 39, 'Undertaken Expense'),
(355, '9100/030', 39, 'YCDC Expense'),
(356, '9100/031', 39, 'Machinery & Equipment Expense'),
(357, '4000/D03', 40, 'Dry Fish (Zabu Thein)'),
(358, '4000/k10', 40, 'Ko Myo'),
(359, '4000/M08', 40, 'Market By'),
(360, '4000/T13', 40, 'Tun Tun'),
(361, '4000/M09', 40, 'Min Lwin'),
(362, '4000/k11', 40, 'Khaing Lay'),
(363, '4000/T08', 40, 'Thet Lwin'),
(364, '4000/N03', 40, 'Nay Lin'),
(365, '4000/T14', 40, 'Tun Naing'),
(366, '4000/k12', 40, 'Ko Pan'),
(367, '4000/A08', 40, 'Aye Ko'),
(368, '4000/N04', 40, 'Nyan Tun'),
(369, '4000/T15', 40, 'Thet Oo (TCL)'),
(370, '4000/A09', 40, 'Aung Zaw Oo (TCL)'),
(371, '4000/A10', 40, 'Aye Htike Ko'),
(372, '4000/M10', 40, 'Mg Mg Nyunt (TCL)'),
(373, '4000/A11', 40, 'Arr Kae (TCL)'),
(374, '4000/T16', 40, 'Thiha'),
(375, '4000/K13', 40, 'Ko Hlawn'),
(376, '4000/A12', 40, 'Aung Kyaw Moe (TCL)'),
(377, '4000/A13', 40, 'Aye Htike Ko (TCL)'),
(378, '4000/K14', 40, 'Kaung Myat Tun'),
(379, '4000/T12', 40, 'Than Soe'),
(380, '7000/001', 38, 'Apple Fruit Income A/C'),
(381, '4000/T17', 40, 'Than Than Myint'),
(382, '4000/S12', 40, 'San San Yee'),
(383, '9100/032', 39, 'Office Supply'),
(384, '9100/033', 39, 'Technak Expense'),
(385, '5000/003', 36, 'Revenue-SC Trader (TCL) A/C'),
(386, '9100/034', 39, 'Global Lucky Fish(Htun Nay Lin)'),
(387, '9100/035', 39, 'Rental Charges'),
(389, '4000/T18', 40, 'Tin Ohine'),
(391, '3800/001', 35, 'USD Transit A/C'),
(393, '3400/001', 35, 'Temporary Loan'),
(394, '9100/036', 39, 'Discount Allowed A/C'),
(395, '6100/008', 37, 'Material Purchase'),
(396, '6100/0008', 37, 'Material Purchase'),
(397, '4000/099', 40, 'Tommy');

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
(18, '1002', '3up', '10', 5, '50', '', '', 11, 18);

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
  `particular` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `debit` text COLLATE utf8_unicode_ci NOT NULL,
  `credit` text COLLATE utf8_unicode_ci NOT NULL,
  `balance` text COLLATE utf8_unicode_ci NOT NULL,
  `voucher_no` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crossac_name` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transactionid` int(11) NOT NULL,
  `interfacerowid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_id` varchar(22) COLLATE utf8_unicode_ci NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rate` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_id`, `category_name`, `rate`) VALUES
(1, '1', 'Fish', 320),
(2, '2', 'IQF', 470),
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
  `mmk_amount` text NOT NULL,
  `usd_amount` text NOT NULL,
  `voucher_no` varchar(255) NOT NULL,
  `transactionid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `dollar_rate`, `debitorcredit`, `mmk_amount`, `usd_amount`, `voucher_no`, `transactionid`) VALUES
(54, 0, 'debit', '5400', '0', 'Dr-Feb 24/001', 54),
(55, 0, 'credit', '5400', '0', 'Dr-Feb 24/001', 55),
(58, 0, 'debit', '39000', '0', 'Dr-Feb 24/002', 58),
(59, 0, 'credit', '39000', '0', 'Dr-Feb 24/002', 59),
(60, 0, 'debit', '14000', '0', 'Dr Feb\'24/003', 60),
(61, 0, 'credit', '14000', '0', 'Dr Feb\'24/003', 61),
(62, 0, 'debit', '80000', '0', 'Dr Feb\'24/004', 62),
(63, 0, 'credit', '80000', '0', 'Dr Feb\'24/004', 63),
(64, 0, 'debit', '50000', '0', 'Dr Feb\'24/005', 64),
(65, 0, 'credit', '50000', '0', 'Dr Feb\'24/005', 65),
(66, 0, 'debit', '50000', '0', 'Dr Feb\'24/006', 66),
(67, 0, 'credit', '50000', '0', 'Dr Feb\'24/006', 67),
(68, 0, 'debit', '89928700', '0', 'Dr Feb\'24/007', 68),
(69, 0, 'credit', '89928700', '0', 'Dr Feb\'24/007', 69),
(70, 0, 'debit', '377000', '0', 'Dr Feb\'24/008', 70),
(71, 0, 'credit', '377000', '0', 'Dr Feb\'24/008', 71),
(76, 0, 'debit', '100000', '0', 'Dr Feb\'24/009', 76),
(77, 0, 'credit', '100000', '0', 'Dr Feb\'24/009', 77),
(78, 0, 'debit', '1500', '0', 'Dr Feb\'24/010', 78),
(79, 0, 'credit', '1500', '0', 'Dr Feb\'24/010', 79),
(80, 0, 'debit', '17754000', '0', 'Dr Feb\'24/011', 80),
(81, 0, 'credit', '17754000', '0', 'Dr Feb\'24/011', 81),
(82, 0, 'debit', '17351000', '0', 'Dr Feb\'24/011', 82),
(83, 0, 'credit', '17351000', '0', 'Dr Feb\'24/011', 83),
(84, 0, 'debit', '3000000', '0', 'Dr Feb\'24/012', 84),
(85, 0, 'credit', '3000000', '0', 'Dr Feb\'24/012', 85),
(86, 1, 'debit', '75000', '75000', 'Cr-Feb 24/001', 86),
(87, 1, 'credit', '75000', '75000', 'Cr-Feb 24/001', 87),
(90, 3480, 'debit', '130369500', '37462.5', 'Cr-Feb 24/001', 90),
(91, 3480, 'credit', '130369500', '37462.5', 'Cr-Feb 24/001', 91),
(92, 2100, 'debit', '78828750', '37537.5', 'Cr-Feb 24/001', 92),
(93, 2100, 'credit', '78828750', '37537.5', 'Cr-Feb 24/001', 93),
(94, 0, 'debit', '15000', '0', 'Dr Feb\'24/013', 94),
(95, 0, 'credit', '15000', '0', 'Dr Feb\'24/013', 95),
(96, 0, 'debit', '52500', '0', 'Dr Feb\'24/014', 96),
(97, 0, 'credit', '52500', '0', 'Dr Feb\'24/014', 97),
(98, 0, 'debit', '289000', '0', 'Dr Feb\'24/015', 98),
(99, 0, 'credit', '289000', '0', 'Dr Feb\'24/015', 99),
(100, 0, 'debit', '90000', '0', 'Dr Feb\'24/016', 100),
(101, 0, 'credit', '90000', '0', 'Dr Feb\'24/016', 101),
(102, 0, 'debit', '170000', '0', 'Dr Feb\'24/017', 102),
(103, 0, 'credit', '170000', '0', 'Dr Feb\'24/017', 103),
(104, 0, 'debit', '43000', '0', 'Dr Feb\'24/018', 104),
(105, 0, 'credit', '43000', '0', 'Dr Feb\'24/018', 105),
(106, 0, 'debit', '130000', '0', 'Dr Feb\'24/019', 106),
(107, 0, 'credit', '130000', '0', 'Dr Feb\'24/019', 107),
(108, 0, 'debit', '62000', '0', 'Dr Feb\'24/020', 108),
(109, 0, 'credit', '62000', '0', 'Dr Feb\'24/020', 109),
(110, 0, 'debit', '85000', '0', 'Dr Feb\'24/021', 110),
(111, 0, 'credit', '85000', '0', 'Dr Feb\'24/021', 111),
(112, 0, 'debit', '7000', '0', 'Dr Feb\'24/022', 112),
(113, 0, 'credit', '7000', '0', 'Dr Feb\'24/022', 113),
(114, 0, 'debit', '814500', '0', 'Dr Feb\'24/023', 114),
(115, 0, 'credit', '814500', '0', 'Dr Feb\'24/023', 115),
(116, 0, 'debit', '42000', '0', 'Dr Feb\'24/024', 116),
(117, 0, 'credit', '42000', '0', 'Dr Feb\'24/024', 117),
(118, 0, 'debit', '4000000', '0', 'Dr Feb\'24/025', 118),
(119, 0, 'credit', '4000000', '0', 'Dr Feb\'24/025', 119),
(120, 0, 'debit', '5000000', '0', 'Dr-Feb\'24/026', 120),
(121, 0, 'credit', '5000000', '0', 'Dr-Feb\'24/026', 121),
(122, 0, 'debit', '3400000', '0', 'Dr-Fed 24/027', 122),
(123, 0, 'credit', '3400000', '0', 'Dr-Fed 24/027', 123),
(124, 0, 'debit', '5000000', '0', 'Dr-Fed 24/028', 124),
(125, 0, 'credit', '5000000', '0', 'Dr-Feb 24/028', 125),
(126, 0, 'debit', '5000000', '0', 'Dr-Feb 24/029', 126),
(127, 0, 'credit', '5000000', '0', 'Dr-Feb 24/029', 127),
(128, 0, 'debit', '444200', '0', 'Dr-Feb 24/030', 128),
(129, 0, 'credit', '444200', '0', 'Dr-Feb 24/030', 129),
(130, 0, 'debit', '3500000', '0', 'Dr-Feb 24/031', 130),
(131, 0, 'credit', '3500000', '0', 'Dr-Feb 24/031', 131),
(132, 0, 'debit', '4000000', '0', 'Dr-Feb 24/032', 132),
(133, 0, 'credit', '4000000', '0', 'Dr-Feb 24/032', 133),
(134, 0, 'debit', '39500', '0', 'Dr Feb\'24/033', 134),
(135, 0, 'credit', '39500', '0', 'Dr Feb\'24/033', 135),
(136, 0, 'debit', '10000', '0', 'Dr-Feb 24/034', 136),
(137, 0, 'credit', '10000', '0', 'Dr-Feb 24/034', 137),
(138, 0, 'debit', '80000', '0', 'Dr-Feb 24/035', 138),
(139, 0, 'credit', '80000', '0', 'Dr-Feb 24/035', 139),
(140, 0, 'debit', '1697000', '0', 'Dr-Feb 24/036', 140),
(141, 0, 'credit', '1697000', '0', 'Dr-Feb 24/036', 141),
(142, 0, 'debit', '6000', '0', 'Dr-Feb 24/037', 142),
(143, 0, 'credit', '6000', '0', 'Dr-Feb 24/037', 143),
(144, 0, 'debit', '4000000', '0', 'Dr-Feb 24/038', 144),
(145, 0, 'credit', '4000000', '0', 'Dr-Feb 24/038', 145),
(146, 0, 'debit', '4000000', '0', 'Dr-Feb 24/039', 146),
(147, 0, 'credit', '4000000', '0', 'Dr-Feb 24/039', 147),
(148, 0, 'debit', '7000000', '0', 'Dr-Feb 24/040', 148),
(149, 0, 'credit', '7000000', '0', 'Dr-Feb 24/040', 149),
(150, 0, 'debit', '100000', '0', 'Dr-Feb 24/041', 150),
(151, 0, 'credit', '100000', '0', 'Dr-Feb 24/041', 151),
(152, 0, 'debit', '10000', '0', 'Dr-Feb 24/042', 152),
(153, 0, 'credit', '10000', '0', 'Dr-Feb 24/042', 153),
(154, 0, 'debit', '8000', '0', 'Dr-Feb 24/043', 154),
(155, 0, 'credit', '8000', '0', 'Dr-Feb 24/043', 155),
(156, 0, 'debit', '2112000', '0', 'Dr-Feb 24/044', 156),
(157, 0, 'credit', '2112000', '0', 'Dr-Feb 24/044', 157),
(158, 0, 'debit', '2193960', '0', 'Dr-Feb 24/045', 158),
(159, 0, 'credit', '2193960', '0', 'Dr-Feb 24/045', 159),
(160, 0, 'debit', '10000000', '0', 'Dr-Feb 24/046', 160),
(161, 0, 'credit', '10000000', '0', 'Dr-Feb 24/046', 161),
(162, 0, 'debit', '5730540', '0', 'Dr-Feb 24/047', 162),
(163, 0, 'credit', '5730540', '0', 'Dr-Feb 24/047', 163),
(164, 0, 'debit', '435000', '0', 'Dr-Feb 24/048', 164),
(165, 0, 'credit', '435000', '0', 'Dr-Feb 24/048', 165),
(166, 0, 'debit', '2000000', '0', 'Dr-Feb 24/049', 166),
(167, 0, 'credit', '2000000', '0', 'Dr-Feb 24/049', 167),
(168, 0, 'debit', '1800', '0', 'Dr-Feb 24/050', 168),
(169, 0, 'credit', '1800', '0', 'Dr-Feb 24/050', 169),
(170, 0, 'debit', '27000', '0', 'Dr-Feb 24/051', 170),
(171, 0, 'credit', '27000', '0', 'Dr-Feb 24/051', 171),
(172, 0, 'debit', '124200', '0', 'Dr-Feb 24/052', 172),
(173, 0, 'credit', '124200', '0', 'Dr-Feb 24/052', 173),
(174, 0, 'debit', '17000', '0', 'Dr-Feb 24/053', 174),
(175, 0, 'credit', '17000', '0', 'Dr-Feb 24/053', 175),
(176, 0, 'debit', '106800', '0', 'Dr-Feb 24/054', 176),
(177, 0, 'credit', '106800', '0', 'Dr-Feb 24/054', 177),
(178, 0, 'debit', '36000', '0', 'Dr-Feb 24/055', 178),
(179, 0, 'credit', '36000', '0', 'Dr-Feb 24/055', 179),
(180, 0, 'debit', '17000', '0', 'Dr-Feb 24/056', 180),
(181, 0, 'credit', '17000', '0', 'Dr-Feb 24/056', 181),
(182, 0, 'debit', '30000', '0', 'Dr-Feb 24/057', 182),
(183, 0, 'credit', '30000', '0', 'Dr-Feb 24/057', 183),
(184, 0, 'debit', '10000', '0', 'Dr-Feb 24/058', 184),
(185, 0, 'credit', '10000', '0', 'Dr-Feb 24/058', 185),
(186, 0, 'debit', '519600', '0', 'Dr-Feb 24/059', 186),
(187, 0, 'credit', '519600', '0', 'Dr-Feb 24/059', 187),
(188, 0, 'debit', '95850', '0', 'Dr-Feb 24/060', 188),
(189, 0, 'credit', '95850', '0', 'Dr-Feb 24/060', 189),
(190, 1, 'debit', '0', '151492.37', 'SAF-001', 190),
(191, 1, 'credit', '0', '151492.37', 'SAF-001', 191),
(192, 1, 'debit', '0', '116818.20', 'SAF-002', 192),
(193, 1, 'credit', '0', '116818.20', 'SAF-002', 193),
(194, 1, 'debit', '0', '87343.73', 'SAF-003', 194),
(195, 1, 'credit', '0', '87343.73', 'SAF-003', 195),
(196, 1, 'debit', '0', '92746.57', 'SAF-004', 196),
(197, 1, 'credit', '0', '92746.57', 'SAF-004', 197),
(198, 1, 'debit', '0', '98874.20', 'SAF-005', 198),
(199, 1, 'credit', '0', '98874.20', 'SAF-005', 199),
(200, 1, 'debit', '0', '95217.11', 'SAF-006', 200),
(201, 1, 'credit', '0', '95217.11', 'SAF-006', 201),
(202, 1, 'debit', '0', '66774.05', 'SAF-007', 202),
(203, 1, 'credit', '0', '66774.05', 'SAF-007', 203),
(204, 1, 'debit', '0', '91268.45', 'SAF-008', 204),
(205, 1, 'credit', '0', '91268.45', 'SAF-008', 205),
(206, 1, 'debit', '0', '105649.44', 'SAF-009', 206),
(207, 1, 'credit', '0', '105649.44', 'SAF-009', 207),
(208, 0, 'debit', '200000', '0', 'Cr-Feb 24/002', 208),
(209, 0, 'credit', '200000', '0', 'Cr-Feb 24/002', 209),
(210, 0, 'debit', '1800', '0', 'Dr-Feb 24/061', 210),
(211, 0, 'credit', '1800', '0', 'Dr-Feb 24/061', 211),
(212, 0, 'debit', '100000', '0', 'Dr-Feb 24/062', 212),
(213, 0, 'credit', '100000', '0', 'Dr-Feb 24/062', 213),
(214, 0, 'debit', '5000', '0', 'Dr-Feb 24/063', 214),
(215, 0, 'credit', '5000', '0', 'Dr-Feb 24/063', 215),
(216, 0, 'debit', '17000', '0', 'Dr-Feb 24/064', 216),
(217, 0, 'credit', '17000', '0', 'Dr-Feb 24/064', 217),
(218, 0, 'debit', '31500', '0', 'Dr-Feb 24/065', 218),
(219, 0, 'credit', '31500', '0', 'Dr-Feb 24/065', 219),
(220, 0, 'debit', '107500', '0', 'Dr-Feb 24/066', 220),
(221, 0, 'credit', '107500', '0', 'Dr-Feb 24/066', 221),
(222, 0, 'debit', '15000', '0', 'Dr-Feb 24/067', 222),
(223, 0, 'credit', '15000', '0', 'Dr-Feb 24/067', 223),
(224, 0, 'debit', '24000', '0', 'Dr-Feb 24/068', 224),
(225, 0, 'credit', '24000', '0', 'Dr-Feb 24/068', 225),
(226, 0, 'debit', '12503950', '0', 'Dr-Feb 24/069', 226),
(227, 0, 'credit', '12503950', '0', 'Dr-Feb 24/069', 227),
(228, 1, 'debit', '41000', '41000', 'Cr-Feb 24/003', 228),
(229, 1, 'credit', '41000', '41000', 'Cr-Feb 24/003', 229),
(230, 2100, 'debit', '43194186', '20568.66', 'Cr-Feb 24/003', 230),
(231, 2100, 'credit', '43194186', '20568.66', 'Cr-Feb 24/003', 231),
(232, 3475, 'debit', '70998906.5', '20431.34', 'Cr-Feb 24/003', 232),
(233, 3475, 'credit', '70998906.5', '20431.34', 'Cr-Feb 24/003', 233),
(234, 1, 'debit', '91728.97', '91728.97', 'CAN-02/2024', 234),
(235, 1, 'credit', '91728.97', '91728.97', 'CAN-02/2024', 235),
(236, 1, 'debit', '46960', '46960', 'Cr-Feb 24/004', 236),
(237, 1, 'credit', '46960', '46960', 'Cr-Feb 24/004', 237),
(238, 2100, 'debit', '49344750', '23497.5', 'Cr-Feb 24/004', 238),
(239, 2100, 'credit', '49344750', '23497.5', 'Cr-Feb 24/004', 239),
(240, 1, 'debit', '75000', '75000', 'Cr-Feb 24/005', 240),
(241, 1, 'credit', '75000', '75000', 'Cr-Feb 24/005', 241),
(242, 2100, 'debit', '34557222', '16455.82', 'Cr-Feb 24/005', 242),
(243, 2100, 'credit', '34557222', '16455.82', 'Cr-Feb 24/005', 243),
(244, 3475, 'debit', '56923349.5', '16380.82', 'Cr-Feb 24/005', 244),
(245, 3475, 'credit', '56923349.5', '16380.82', 'Cr-Feb 24/005', 245),
(246, 2100, 'debit', '30990078', '14757.18', 'Cr-Feb 24/005', 246),
(247, 2100, 'credit', '30990078', '14757.18', 'Cr-Feb 24/005', 247),
(248, 0, 'debit', '117800', '0', 'Dr-Feb 24/070', 248),
(249, 0, 'credit', '117800', '0', 'Dr-Feb 24/070', 249),
(250, 0, 'debit', '137000', '0', 'Dr-Feb 24/071', 250),
(251, 0, 'credit', '137000', '0', 'Dr-Feb 24/071', 251),
(252, 0, 'debit', '93000', '0', 'Dr-Feb 24/072', 252),
(253, 0, 'credit', '93000', '0', 'Dr-Feb 24/072', 253),
(254, 0, 'debit', '27000', '0', 'Dr-Feb 24/073', 254),
(255, 0, 'credit', '27000', '0', 'Dr-Feb 24/073', 255),
(256, 0, 'debit', '24000', '0', 'Dr-Feb 24/074', 256),
(257, 0, 'credit', '24000', '0', 'Dr-Feb 24/074', 257),
(258, 0, 'debit', '7000', '0', 'Dr-Feb 24/075', 258),
(259, 0, 'credit', '7000', '0', 'Dr-Feb 24/075', 259),
(260, 0, 'debit', '10000', '0', 'Dr-Feb 24/076', 260),
(261, 0, 'credit', '10000', '0', 'Dr-Feb 24/076', 261),
(262, 0, 'debit', '6000', '0', 'Dr-Feb 24/077', 262),
(263, 0, 'credit', '6000', '0', 'Dr-Feb 24/077', 263),
(264, 0, 'debit', '60375', '0', 'Dr-Feb 24/078', 264),
(265, 0, 'credit', '60375', '0', 'Dr-Feb 24/078', 265),
(266, 0, 'debit', '79800', '0', 'Dr-Feb 24/079', 266),
(267, 0, 'credit', '79800', '0', 'Dr-Feb 24/079', 267),
(268, 0, 'debit', '50000', '0', 'Dr-Feb 24/080', 268),
(269, 0, 'credit', '50000', '0', 'Dr-Feb 24/080', 269),
(270, 0, 'debit', '20000', '0', 'Dr-Feb 24/081', 270),
(271, 0, 'credit', '20000', '0', 'Dr-Feb 24/081', 271),
(272, 0, 'debit', '138000', '0', 'Dr-Feb 24/082', 272),
(273, 0, 'credit', '138000', '0', 'Dr-Feb 24/082', 273),
(274, 0, 'debit', '9000', '0', 'Dr-Feb 24/083', 274),
(275, 0, 'credit', '9000', '0', 'Dr-Feb 24/083', 275),
(276, 0, 'debit', '17000', '0', 'Dr-Feb 24/084', 276),
(277, 0, 'credit', '17000', '0', 'Dr-Feb 24/084', 277),
(278, 0, 'debit', '160000', '0', 'Dr-Feb 24/085', 278),
(279, 0, 'credit', '160000', '0', 'Dr-Feb 24/085', 279),
(280, 0, 'debit', '10000', '0', 'Dr-Feb 24/086', 280),
(281, 0, 'credit', '10000', '0', 'Dr-Feb 24/086', 281),
(282, 0, 'debit', '4000000', '0', 'Dr-Feb 24/087', 282),
(283, 0, 'credit', '4000000', '0', 'Dr-Feb 24/087', 283),
(284, 0, 'debit', '6754402', '0', 'Dr-Feb 24/088', 284),
(285, 0, 'credit', '6754402', '0', 'Dr-Feb 24/088', 285),
(286, 0, 'debit', '24000', '0', 'Dr-Feb 24/089', 286),
(287, 0, 'credit', '24000', '0', 'Dr-Feb 24/089', 287),
(288, 0, 'debit', '60000000', '0', 'Dr-Feb 24/090', 288),
(289, 0, 'credit', '60000000', '0', 'Dr-Feb 24/090', 289),
(290, 0, 'debit', '30000000', '0', 'Dr-Feb 24/091', 290),
(291, 0, 'credit', '30000000', '0', 'Dr-Feb 24/091', 291),
(292, 0, 'debit', '5000000', '0', 'Dr-Feb 24/092', 292),
(293, 0, 'credit', '5000000', '0', 'Dr-Feb 24/092', 293),
(294, 0, 'debit', '4000000', '0', 'Dr-Feb 24/093', 294),
(295, 0, 'credit', '4000000', '0', 'Dr-Feb 24/093', 295),
(296, 0, 'debit', '3000000', '0', 'Dr-Feb 24/094', 296),
(297, 0, 'credit', '3000000', '0', 'Dr-Feb 24/094', 297),
(298, 0, 'debit', '7000000', '0', 'Dr-Feb 24/095', 298),
(299, 0, 'credit', '7000000', '0', 'Dr-Feb 24/095', 299),
(300, 0, 'debit', '5000000', '0', 'Dr-Feb 24/096', 300),
(301, 0, 'credit', '5000000', '0', 'Dr-Feb 24/096', 301),
(302, 0, 'debit', '3000000', '0', 'Dr-Feb 24/097', 302),
(303, 0, 'credit', '3000000', '0', 'Dr-Feb 24/097', 303),
(304, 0, 'debit', '4000000', '0', 'Dr-Feb 24/098', 304),
(305, 0, 'credit', '4000000', '0', 'Dr-Feb 24/098', 305),
(306, 0, 'debit', '3000000', '0', 'Dr-Feb 24/099', 306),
(307, 0, 'credit', '3000000', '0', 'Dr-Feb 24/099', 307),
(308, 0, 'debit', '5000000', '0', 'Dr-Feb 24/100', 308),
(309, 0, 'credit', '5000000', '0', 'Dr-Feb 24/100', 309),
(310, 0, 'debit', '3000000', '0', 'Dr-Feb 24/101', 310),
(311, 0, 'credit', '3000000', '0', 'Dr-Feb 24/101', 311),
(312, 0, 'debit', '7000000', '0', 'Dr-Feb 24/102', 312),
(313, 0, 'credit', '7000000', '0', 'Dr-Feb 24/102', 313),
(314, 0, 'debit', '4000000', '0', 'Dr-Feb 24/103', 314),
(315, 0, 'credit', '4000000', '0', 'Dr-Feb 24/103', 315),
(316, 0, 'debit', '4000000', '0', 'Dr-Feb 24/104', 316),
(317, 0, 'credit', '4000000', '0', 'Dr-Feb 24/104', 317),
(318, 0, 'debit', '4000000', '0', 'Dr-Feb 24/105', 318),
(319, 0, 'credit', '4000000', '0', 'Dr-Feb 24/105', 319),
(320, 0, 'debit', '5000000', '0', 'Dr-Feb 24/106', 320),
(321, 0, 'credit', '5000000', '0', 'Dr-Feb 24/106', 321),
(322, 0, 'debit', '20000000', '0', 'Dr-Feb 24/107', 322),
(323, 0, 'credit', '20000000', '0', 'Dr-Feb 24/107', 323),
(324, 0, 'debit', '5000000', '0', 'Dr-Feb 24/108', 324),
(325, 0, 'credit', '5000000', '0', 'Dr-Feb 24/108', 325),
(326, 0, 'debit', '30000000', '0', 'Dr-Feb 24/109', 326),
(327, 0, 'credit', '30000000', '0', 'Dr-Feb 24/109', 327),
(328, 0, 'debit', '4000000', '0', 'Dr-Feb 24/110', 328),
(329, 0, 'credit', '4000000', '0', 'Dr-Feb 24/110', 329),
(330, 0, 'debit', '30000000', '0', 'Dr-Feb 24/111', 330),
(331, 0, 'credit', '30000000', '0', 'Dr-Feb 24/111', 331),
(332, 0, 'debit', '3352700', '0', 'Dr-Feb 24/112', 332),
(333, 0, 'credit', '3352700', '0', 'Dr-Feb 24/112', 333),
(334, 0, 'debit', '4000000', '0', 'Dr-Feb 24/113', 334),
(335, 0, 'credit', '4000000', '0', 'Dr-Feb 24/113', 335),
(336, 0, 'debit', '5472850', '0', 'Dr-Feb 24/114', 336),
(337, 0, 'credit', '5472850', '0', 'Dr-Feb 24/114', 337),
(338, 0, 'debit', '18000', '0', 'Dr-Feb 24/115', 338),
(339, 0, 'credit', '18000', '0', 'Dr-Feb 24/115', 339),
(340, 0, 'debit', '8000', '0', 'Dr-Feb 24/116', 340),
(341, 0, 'credit', '8000', '0', 'Dr-Feb 24/116', 341),
(342, 0, 'debit', '13000', '0', 'Dr-Feb 24/117', 342),
(343, 0, 'credit', '13000', '0', 'Dr-Feb 24/117', 343),
(344, 0, 'debit', '55000', '0', 'Dr-Feb 24/118', 344),
(345, 0, 'credit', '55000', '0', 'Dr-Feb 24/118', 345),
(346, 0, 'debit', '40000', '0', 'Dr-Feb 24/119', 346),
(347, 0, 'credit', '40000', '0', 'Dr-Feb 24/119', 347),
(348, 0, 'debit', '1438250', '0', 'Dr-Feb 24/120340', 348),
(349, 0, 'credit', '1438250', '0', 'Dr-Feb 24/120340', 349),
(350, 0, 'debit', '3600', '0', 'Dr-Feb 24/121', 350),
(351, 0, 'credit', '3600', '0', 'Dr-Feb 24/121', 351),
(352, 0, 'debit', '69000', '0', 'Dr-Feb 24/122', 352),
(353, 0, 'credit', '69000', '0', 'Dr-Feb 24/122', 353),
(354, 0, 'debit', '50000', '0', 'Dr-Feb 24/123', 354),
(355, 0, 'credit', '50000', '0', 'Dr-Feb 24/123', 355),
(356, 0, 'debit', '5000', '0', 'Dr-Feb 24/124', 356),
(357, 0, 'credit', '5000', '0', 'Dr-Feb 24/124', 357),
(358, 0, 'debit', '100000', '0', 'Dr-Feb 24/125', 358),
(359, 0, 'credit', '100000', '0', 'Dr-Feb 24/125', 359),
(360, 0, 'debit', '6000', '0', 'Dr-Feb 24/126', 360),
(361, 0, 'credit', '6000', '0', 'Dr-Feb 24/126', 361),
(362, 0, 'debit', '16000', '0', 'Dr-Feb 24/127', 362),
(363, 0, 'credit', '16000', '0', 'Dr-Feb 24/127', 363),
(364, 0, 'debit', '77000', '0', 'Dr-Feb 24/128', 364),
(365, 0, 'credit', '77000', '0', 'Dr-Feb 24/128', 365),
(366, 0, 'debit', '2000', '0', 'Dr-Feb 24/129', 366),
(367, 0, 'credit', '2000', '0', 'Dr-Feb 24/129', 367),
(368, 0, 'debit', '3000', '0', 'Dr-Feb 24/130', 368),
(369, 0, 'credit', '3000', '0', 'Dr-Feb 24/130', 369),
(370, 0, 'debit', '6000000', '0', 'Dr-Feb 24/131', 370),
(371, 0, 'credit', '6000000', '0', 'Dr-Feb 24/131', 371),
(372, 0, 'debit', '120000', '0', 'Dr-Feb 24/132', 372),
(373, 0, 'credit', '120000', '0', 'Dr-Feb 24/132', 373),
(374, 0, 'debit', '26000', '0', 'Dr-Feb 24/133', 374),
(375, 0, 'credit', '26000', '0', 'Dr-Feb 24/133', 375),
(376, 0, 'debit', '50000', '0', 'Dr-Feb 24/134', 376),
(377, 0, 'credit', '50000', '0', 'Dr-Feb 24/134', 377),
(378, 0, 'debit', '10000', '0', 'Dr-Feb 24/135', 378),
(379, 0, 'credit', '10000', '0', 'Dr-Feb 24/135', 379),
(380, 0, 'debit', '111000', '0', 'Dr-Feb 24/136', 380),
(381, 0, 'credit', '111000', '0', 'Dr-Feb 24/136', 381),
(382, 0, 'debit', '36000', '0', 'Dr-Feb 24/137', 382),
(383, 0, 'credit', '36000', '0', 'Dr-Feb 24/137', 383),
(384, 0, 'debit', '17000', '0', 'Dr-Feb 24/138', 384),
(385, 0, 'credit', '17000', '0', 'Dr-Feb 24/138', 385),
(386, 0, 'debit', '2000', '0', 'Dr-Feb 24/139', 386),
(387, 0, 'credit', '2000', '0', 'Dr-Feb 24/139', 387),
(388, 0, 'debit', '6000', '0', 'Dr-Feb 24/140', 388),
(389, 0, 'credit', '6000', '0', 'Dr-Feb 24/140', 389),
(390, 0, 'debit', '16000', '0', 'Dr-Feb 24/141', 390),
(391, 0, 'credit', '16000', '0', 'Dr-Feb 24/141', 391),
(392, 0, 'debit', '33000', '0', 'Dr-Feb 24/142', 392),
(393, 0, 'credit', '33000', '0', 'Dr-Feb 24/142', 393),
(394, 0, 'debit', '50000', '0', 'Dr-Feb 24/143', 394),
(395, 0, 'credit', '50000', '0', 'Dr-Feb 24/143', 395),
(396, 0, 'debit', '22000', '0', 'Dr-Feb 24/144', 396),
(397, 0, 'credit', '22000', '0', 'Dr-Feb 24/144', 397),
(398, 0, 'debit', '3000', '0', 'Dr-Feb 24/145', 398),
(399, 0, 'credit', '3000', '0', 'Dr-Feb 24/145', 399),
(400, 0, 'debit', '5000', '0', 'Dr-Feb 24/146', 400),
(401, 0, 'credit', '5000', '0', 'Dr-Feb 24/146', 401),
(402, 0, 'debit', '5000', '0', 'Dr-Feb 24/147', 402),
(403, 0, 'credit', '5000', '0', 'Dr-Feb 24/147', 403),
(404, 0, 'debit', '13000', '0', 'Dr-Feb 24/148', 404),
(405, 0, 'credit', '13000', '0', 'Dr-Feb 24/148', 405),
(406, 0, 'debit', '15000', '0', 'Dr-Feb 24/149', 406),
(407, 0, 'credit', '15000', '0', 'Dr-Feb 24/149', 407),
(408, 0, 'debit', '4000', '0', 'Dr-Feb 24/150', 408),
(409, 0, 'credit', '4000', '0', 'Dr-Feb 24/150', 409),
(410, 0, 'debit', '158000', '0', 'Dr-Feb 24/151', 410),
(411, 0, 'credit', '158000', '0', 'Dr-Feb 24/151', 411),
(412, 0, 'debit', '18000', '0', 'Dr-Feb 24/152', 412),
(413, 0, 'credit', '18000', '0', 'Dr-Feb 24/152', 413),
(414, 0, 'debit', '12000', '0', 'Dr-Feb 24/153', 414),
(415, 0, 'credit', '12000', '0', 'Dr-Feb 24/153', 415),
(416, 0, 'debit', '40000000', '0', 'Dr-Feb 24/154', 416),
(417, 0, 'credit', '40000000', '0', 'Dr-Feb 24/154', 417),
(418, 0, 'debit', '27000', '0', 'Dr-Feb 24/155', 418),
(419, 0, 'credit', '27000', '0', 'Dr-Feb 24/155', 419),
(420, 0, 'debit', '10500', '0', 'Dr-Feb 24/156', 420),
(421, 0, 'credit', '10500', '0', 'Dr-Feb 24/156', 421),
(422, 0, 'debit', '23000', '0', 'Dr-Feb 24/157', 422),
(423, 0, 'credit', '23000', '0', 'Dr-Feb 24/157', 423),
(424, 0, 'debit', '66000', '0', 'Dr-Feb 24/158', 424),
(425, 0, 'credit', '66000', '0', 'Dr-Feb 24/158', 425),
(426, 0, 'debit', '7000', '0', 'Dr-Feb 24/159', 426),
(427, 0, 'credit', '7000', '0', 'Dr-Feb 24/159', 427),
(428, 0, 'debit', '150000', '0', 'Dr-Feb 24/160', 428),
(429, 0, 'credit', '150000', '0', 'Dr-Feb 24/160', 429),
(430, 0, 'debit', '1112614', '0', 'Dr-Feb 24/161', 430),
(431, 0, 'credit', '1112614', '0', 'Dr-Feb 24/161', 431),
(432, 0, 'debit', '306000', '0', 'Dr-Feb 24/162', 432),
(433, 0, 'credit', '306000', '0', 'Dr-Feb 24/162', 433),
(434, 0, 'debit', '473750', '0', 'Dr-Feb 24/163', 434),
(435, 0, 'credit', '473750', '0', 'Dr-Feb 24/163', 435),
(436, 0, 'debit', '4500', '0', 'Dr-Feb 24/164', 436),
(437, 0, 'credit', '4500', '0', 'Dr-Feb 24/164', 437),
(438, 0, 'debit', '2163000', '0', 'Dr-Feb 24/165', 438),
(439, 0, 'credit', '2163000', '0', 'Dr-Feb 24/165', 439),
(440, 0, 'debit', '34000', '0', 'Dr-Feb 24/166', 440),
(441, 0, 'credit', '34000', '0', 'Dr-Feb 24/166', 441),
(442, 0, 'debit', '832250', '0', 'Dr-Feb 24/167', 442),
(443, 0, 'credit', '832250', '0', 'Dr-Feb 24/167', 443),
(444, 0, 'debit', '20000', '0', 'Dr-Feb 24/168', 444),
(445, 0, 'credit', '20000', '0', 'Dr-Feb 24/168', 445),
(446, 0, 'debit', '160000', '0', 'Dr-Feb 24/169', 446),
(447, 0, 'credit', '160000', '0', 'Dr-Feb 24/169', 447),
(448, 0, 'debit', '70000', '0', 'Dr-Feb 24/170', 448),
(449, 0, 'credit', '70000', '0', 'Dr-Feb 24/170', 449),
(450, 0, 'debit', '31600', '0', 'Dr-Feb 24/171', 450),
(451, 0, 'credit', '31600', '0', 'Dr-Feb 24/171', 451),
(452, 0, 'debit', '10500', '0', 'Dr-Feb 24/172', 452),
(453, 0, 'credit', '10500', '0', 'Dr-Feb 24/172', 453),
(454, 0, 'debit', '2000', '0', 'Dr-Feb 24/173', 454),
(455, 0, 'credit', '2000', '0', 'Dr-Feb 24/173', 455),
(456, 0, 'debit', '12500', '0', 'Dr-Feb 24/174', 456),
(457, 0, 'credit', '12500', '0', 'Dr-Feb 24/174', 457),
(458, 0, 'debit', '38500', '0', 'Dr-Feb 24/175', 458),
(459, 0, 'credit', '38500', '0', 'Dr-Feb 24/175', 459),
(460, 0, 'debit', '3000', '0', 'Dr-Feb 24/176', 460),
(461, 0, 'credit', '3000', '0', 'Dr-Feb 24/176', 461),
(462, 0, 'debit', '5000', '0', 'Dr-Feb 24/177', 462),
(463, 0, 'credit', '5000', '0', 'Dr-Feb 24/177', 463),
(464, 0, 'debit', '8883000', '0', 'Dr-Feb 24/178', 464),
(465, 0, 'credit', '8883000', '0', 'Dr-Feb 24/178', 465),
(466, 0, 'debit', '62000', '0', 'Dr-Feb 24/179', 466),
(467, 0, 'credit', '62000', '0', 'Dr-Feb 24/179', 467),
(468, 0, 'debit', '21000', '0', 'Dr-Feb 24/180', 468),
(469, 0, 'credit', '21000', '0', 'Dr-Feb 24/180', 469),
(470, 0, 'debit', '200000', '0', 'Dr-Feb 24/181', 470),
(471, 0, 'credit', '200000', '0', 'Dr-Feb 24/181', 471),
(472, 0, 'debit', '40000000', '0', 'Dr-Feb 24/182', 472),
(473, 0, 'credit', '40000000', '0', 'Dr-Feb 24/182', 473),
(474, 0, 'debit', '6000000', '0', 'Dr-Feb 24/183', 474),
(475, 0, 'credit', '6000000', '0', 'Dr-Feb 24/183', 475),
(476, 0, 'debit', '10500', '0', 'Dr-Feb 24/184', 476),
(477, 0, 'credit', '10500', '0', 'Dr-Feb 24/184', 477),
(478, 0, 'debit', '2000', '0', 'Dr-Feb 24/185', 478),
(479, 0, 'credit', '2000', '0', 'Dr-Feb 24/185', 479),
(480, 0, 'debit', '8000', '0', 'Dr-Feb 24/186', 480),
(481, 0, 'credit', '8000', '0', 'Dr-Feb 24/186', 481),
(482, 0, 'debit', '22000', '0', 'Dr-Feb 24/187', 482),
(483, 0, 'credit', '22000', '0', 'Dr-Feb 24/187', 483),
(484, 3475, 'debit', '81532187.5', '23462.5', 'Cr-Feb 24/006', 484),
(485, 3475, 'credit', '81532187.5', '23462.5', 'Cr-Feb 24/006', 485),
(488, 3475, 'debit', '95236475.5', '27406.18', 'Cr-Feb 24/006', 488),
(489, 3475, 'credit', '95236475.5', '27406.18', 'Cr-Feb 24/006', 489),
(490, 1, 'debit', '75000', '75000', 'Cr-Feb 24/007', 490),
(491, 1, 'credit', '75000', '75000', 'Cr-Feb 24/007', 491),
(492, 2100, 'debit', '55227375', '26298.75', 'Cr-Feb 24/007', 492),
(493, 2100, 'credit', '55227375', '26298.75', 'Cr-Feb 24/007', 493),
(494, 3475, 'debit', '169236843.75', '48701.25', 'Cr-Feb 24/007', 494),
(495, 3475, 'credit', '169236843.75', '48701.25', 'Cr-Feb 24/007', 495),
(496, 1, 'debit', '1000', '1000', 'Cr-Feb 24/008', 496),
(497, 1, 'credit', '1000', '1000', 'Cr-Feb 24/008', 497),
(498, 2100, 'debit', '788949', '375.69', 'Cr-Feb 24/008', 498),
(499, 2100, 'credit', '788949', '375.69', 'Cr-Feb 24/008', 499),
(500, 0, 'debit', '50000000', '0', 'Dr-Feb 24/188', 500),
(501, 0, 'credit', '50000000', '0', 'Dr-Feb 24/188', 501),
(502, 0, 'debit', '4000000', '0', 'Dr-Feb 24/189', 502),
(503, 0, 'credit', '4000000', '0', 'Dr-Feb 24/189', 503),
(504, 0, 'debit', '10000000', '0', 'Dr-Feb 24/190', 504),
(505, 0, 'credit', '10000000', '0', 'Dr-Feb 24/190', 505),
(506, 0, 'debit', '20000000', '0', 'Dr-Feb 24/191', 506),
(507, 0, 'credit', '20000000', '0', 'Dr-Feb 24/191', 507),
(508, 0, 'debit', '30000000', '0', 'Dr-Feb 24/192', 508),
(509, 0, 'credit', '30000000', '0', 'Dr-Feb 24/192', 509),
(510, 0, 'debit', '6000000', '0', 'Dr-Feb 24/193', 510),
(511, 0, 'credit', '6000000', '0', 'Dr-Feb 24/193', 511),
(512, 0, 'debit', '5000000', '0', 'Dr-Feb 24/194', 512),
(513, 0, 'credit', '5000000', '0', 'Dr-Feb 24/194', 513),
(514, 0, 'debit', '3000000', '0', 'Dr-Feb 24/195', 514),
(515, 0, 'credit', '3000000', '0', 'Dr-Feb 24/195', 515),
(516, 0, 'debit', '5000000', '0', 'Dr-Feb 24/196', 516),
(517, 0, 'credit', '5000000', '0', 'Dr-Feb 24/196', 517),
(518, 0, 'debit', '12000000', '0', 'Dr-Feb 24/197', 518),
(519, 0, 'credit', '12000000', '0', 'Dr-Feb 24/197', 519),
(520, 0, 'debit', '50000000', '0', 'Dr-Feb 24/198', 520),
(521, 0, 'credit', '50000000', '0', 'Dr-Feb 24/198', 521),
(522, 0, 'debit', '7000000', '0', 'Dr-Feb 24/199', 522),
(523, 0, 'credit', '7000000', '0', 'Dr-Feb 24/199', 523),
(524, 0, 'debit', '4000000', '0', 'Dr-Feb 24/200', 524),
(525, 0, 'credit', '4000000', '0', 'Dr-Feb 24/200', 525),
(526, 0, 'debit', '4000000', '0', 'Dr-Feb 24/201', 526),
(527, 0, 'credit', '4000000', '0', 'Dr-Feb 24/201', 527),
(528, 0, 'debit', '3000000', '0', 'Dr-Feb 24/202', 528),
(529, 0, 'credit', '3000000', '0', 'Dr-Feb 24/202', 529),
(530, 0, 'debit', '5000000', '0', 'Dr-Feb 24/203', 530),
(531, 0, 'credit', '5000000', '0', 'Dr-Feb 24/203', 531),
(532, 0, 'debit', '4000000', '0', 'Dr-Feb 24/204', 532),
(533, 0, 'credit', '4000000', '0', 'Dr-Feb 24/204', 533),
(534, 0, 'debit', '4000000', '0', 'Dr-Feb 24/205', 534),
(535, 0, 'credit', '4000000', '0', 'Dr-Feb 24/205', 535),
(536, 0, 'debit', '7000000', '0', 'Dr-Feb 24/206', 536),
(537, 0, 'credit', '7000000', '0', 'Dr-Feb 24/206', 537),
(538, 0, 'debit', '6000000', '0', 'Dr-Feb 24/207', 538),
(539, 0, 'credit', '6000000', '0', 'Dr-Feb 24/207', 539),
(540, 0, 'debit', '3000000', '0', 'Dr-Feb 24/208', 540),
(541, 0, 'credit', '3000000', '0', 'Dr-Feb 24/208', 541),
(542, 0, 'debit', '6000000', '0', 'Dr-Feb 24/209', 542),
(543, 0, 'credit', '6000000', '0', 'Dr-Feb 24/209', 543),
(544, 0, 'debit', '6000000', '0', 'Dr-Feb 24/210', 544),
(545, 0, 'credit', '6000000', '0', 'Dr-Feb 24/210', 545),
(546, 0, 'debit', '20500', '0', 'Dr-Feb 24/211', 546),
(547, 0, 'credit', '20500', '0', 'Dr-Feb 24/211', 547),
(548, 0, 'debit', '10000', '0', 'Dr-Feb 24/212', 548),
(549, 0, 'credit', '10000', '0', 'Dr-Feb 24/212', 549),
(550, 0, 'debit', '29000', '0', 'Dr-Feb 24/213', 550),
(551, 0, 'credit', '29000', '0', 'Dr-Feb 24/213', 551),
(552, 0, 'debit', '1193500', '0', 'Dr-Feb 24/214', 552),
(553, 0, 'credit', '1193500', '0', 'Dr-Feb 24/214', 553),
(554, 0, 'debit', '4500', '0', 'Dr-Feb 24/215', 554),
(555, 0, 'credit', '4500', '0', 'Dr-Feb 24/215', 555),
(556, 0, 'debit', '60000', '0', 'Dr-Feb 24/216', 556),
(557, 0, 'credit', '60000', '0', 'Dr-Feb 24/216', 557),
(558, 0, 'debit', '55500', '0', 'Dr-Feb 24/217', 558),
(559, 0, 'credit', '55500', '0', 'Dr-Feb 24/217', 559),
(560, 0, 'debit', '38500', '0', 'Dr-Feb 24/218', 560),
(561, 0, 'credit', '38500', '0', 'Dr-Feb 24/218', 561),
(562, 0, 'debit', '22000', '0', 'Dr-Feb 24/219', 562),
(563, 0, 'credit', '22000', '0', 'Dr-Feb 24/219', 563),
(564, 0, 'debit', '10500', '0', 'Dr-Feb 24/220', 564),
(565, 0, 'credit', '10500', '0', 'Dr-Feb 24/220', 565),
(566, 0, 'debit', '100000', '0', 'Dr-Feb 24/221', 566),
(567, 0, 'credit', '100000', '0', 'Dr-Feb 24/221', 567),
(568, 0, 'debit', '111000', '0', 'Dr-Feb 24/222', 568),
(569, 0, 'credit', '111000', '0', 'Dr-Feb 24/222', 569),
(570, 0, 'debit', '51000', '0', 'Dr-Feb 24/223', 570),
(571, 0, 'credit', '51000', '0', 'Dr-Feb 24/223', 571),
(572, 0, 'debit', '100000', '0', 'Dr-Feb 24/224', 572),
(573, 0, 'credit', '100000', '0', 'Dr-Feb 24/224', 573),
(574, 0, 'debit', '25000', '0', 'Dr-Feb 24/225', 574),
(575, 0, 'credit', '25000', '0', 'Dr-Feb 24/225', 575),
(576, 0, 'debit', '36500', '0', 'Dr-Feb 24/226', 576),
(577, 0, 'credit', '36500', '0', 'Dr-Feb 24/226', 577),
(578, 0, 'debit', '22000', '0', 'Dr-Feb 24/227', 578),
(579, 0, 'credit', '22000', '0', 'Dr-Feb 24/227', 579),
(580, 0, 'debit', '202250', '0', 'Dr-Feb 24/228', 580),
(581, 0, 'credit', '202250', '0', 'Dr-Feb 24/228', 581),
(582, 0, 'debit', '63000', '0', 'Dr-Feb 24/228', 582),
(583, 0, 'credit', '63000', '0', 'Dr-Feb 24/228', 583),
(584, 0, 'debit', '11000', '0', 'Dr-Feb 24/229', 584),
(585, 0, 'credit', '11000', '0', 'Dr-Feb 24/229', 585),
(586, 0, 'debit', '1158820', '0', 'Dr-Feb 24/230', 586),
(587, 0, 'credit', '1158820', '0', 'Dr-Feb 24/230', 587),
(588, 3475, 'debit', '347500', '100', 'Dr-Feb 24/231', 588),
(589, 3475, 'credit', '347500', '100', 'Dr-Feb 24/231', 589),
(590, 0, 'debit', '4300000', '0', 'Dr-Feb 24/232', 590),
(591, 0, 'credit', '4300000', '0', 'Dr-Feb 24/232', 591),
(592, 0, 'debit', '300000', '0', 'Dr-Feb 24/233', 592),
(593, 0, 'credit', '300000', '0', 'Dr-Feb 24/233', 593),
(594, 0, 'debit', '400000', '0', 'Dr-Feb 24/234', 594),
(595, 0, 'credit', '400000', '0', 'Dr-Feb 24/234', 595),
(596, 0, 'debit', '10000', '0', 'Dr-Feb 24/235', 596),
(597, 0, 'credit', '10000', '0', 'Dr-Feb 24/235', 597),
(598, 0, 'debit', '10000', '0', 'Dr-Feb 24/236', 598),
(599, 0, 'credit', '10000', '0', 'Dr-Feb 24/236', 599),
(600, 0, 'debit', '33000', '0', 'Dr-Feb 24/237', 660),
(601, 0, 'credit', '33000', '0', 'Dr-Feb 24/237', 601),
(602, 0, 'debit', '8000', '0', 'Dr-Feb 24/238', 602),
(603, 0, 'credit', '8000', '0', 'Dr-Feb 24/238', 603),
(604, 0, 'debit', '4000000', '0', 'Dr-Feb 24/239', 604),
(605, 0, 'credit', '4000000', '0', 'Dr-Feb 24/239', 605),
(606, 0, 'debit', '5370700', '0', 'Dr-Feb 24/240', 606),
(607, 0, 'credit', '5370700', '0', 'Dr-Feb 24/240', 607),
(608, 0, 'debit', '4000000', '0', 'Dr-Feb 24/241', 608),
(609, 0, 'credit', '4000000', '0', 'Dr-Feb 24/241', 609),
(610, 0, 'debit', '565400', '0', 'Dr-Feb 24/242', 610),
(611, 0, 'credit', '565400', '0', 'Dr-Feb 24/242', 611),
(612, 0, 'debit', '6000000', '0', 'Dr-Feb 24/243', 612),
(613, 0, 'credit', '6000000', '0', 'Dr-Feb 24/243', 613),
(614, 0, 'debit', '2692000', '0', 'Dr-Feb 24/244', 614),
(615, 0, 'credit', '2692000', '0', 'Dr-Feb 24/244', 615),
(616, 0, 'debit', '18000', '0', 'Dr-Feb 24/245', 616),
(617, 0, 'credit', '18000', '0', 'Dr-Feb 24/245', 617),
(618, 0, 'debit', '2700', '0', 'Dr-Feb 24/246', 618),
(619, 0, 'credit', '2700', '0', 'Dr-Feb 24/246', 619),
(620, 0, 'debit', '5960000', '0', 'Dr-Feb 24/247', 620),
(621, 0, 'credit', '5960000', '0', 'Dr-Feb 24/247', 621),
(622, 0, 'debit', '550000', '0', 'Dr-Feb 24/248', 622),
(623, 0, 'credit', '550000', '0', 'Dr-Feb 24/248', 623),
(624, 0, 'debit', '2272500', '0', 'Dr-Feb 24/250', 624),
(625, 0, 'credit', '2272500', '0', 'Dr-Feb 24/250', 625),
(626, 0, 'debit', '9000000', '0', 'Dr-Feb 24/251', 626),
(627, 0, 'credit', '9000000', '0', 'Dr-Feb 24/251', 627),
(628, 0, 'debit', '5000000', '0', 'Dr-Feb 24/252', 628),
(629, 0, 'credit', '5000000', '0', 'Dr-Feb 24/252', 629),
(630, 0, 'debit', '450200', '0', 'Dr-Feb 24/253', 630),
(631, 0, 'credit', '450200', '0', 'Dr-Feb 24/253', 631),
(632, 0, 'debit', '5400', '0', 'Dr-Feb 24/254', 632),
(633, 0, 'credit', '5400', '0', 'Dr-Feb 24/254', 633),
(634, 0, 'debit', '43700', '0', 'Dr-Feb 24/255', 634),
(635, 0, 'credit', '43700', '0', 'Dr-Feb 24/255', 635),
(636, 0, 'debit', '2000', '0', 'Dr-Feb 24/256', 636),
(637, 0, 'credit', '2000', '0', 'Dr-Feb 24/256', 637),
(638, 0, 'debit', '7000', '0', 'Dr-Feb 24/257', 638),
(639, 0, 'credit', '7000', '0', 'Dr-Feb 24/257', 639),
(640, 0, 'debit', '10000', '0', 'Dr-Feb 24/258', 640),
(641, 0, 'credit', '10000', '0', 'Dr-Feb 24/258', 641),
(642, 0, 'debit', '27000', '0', 'Dr-Feb 24/259', 642),
(643, 0, 'credit', '27000', '0', 'Dr-Feb 24/259', 643),
(644, 0, 'debit', '860000', '0', 'Dr-Feb 24/259', 644),
(645, 0, 'credit', '860000', '0', 'Dr-Feb 24/259', 645),
(646, 0, 'debit', '3000', '0', 'Dr-Feb 24/260', 646),
(647, 0, 'credit', '3000', '0', 'Dr-Feb 24/260', 647),
(648, 0, 'debit', '63000', '0', 'Dr-Feb 24/261', 648),
(649, 0, 'credit', '63000', '0', 'Dr-Feb 24/261', 649),
(650, 0, 'debit', '5400', '0', 'Dr-Feb 24/262', 650),
(651, 0, 'credit', '5400', '0', 'Dr-Feb 24/262', 651),
(652, 0, 'debit', '100000', '0', 'Dr-Feb 24/263', 652),
(653, 0, 'credit', '100000', '0', 'Dr-Feb 24/263', 653),
(654, 0, 'debit', '145000', '0', 'Dr-Feb 24/264', 654),
(655, 0, 'credit', '145000', '0', 'Dr-Feb 24/264', 655),
(656, 0, 'debit', '10000', '0', 'Dr-Feb 24/265', 656),
(657, 0, 'credit', '10000', '0', 'Dr-Feb 24/265', 657),
(658, 0, 'debit', '3298466', '0', 'Dr-Feb 24/266', 658),
(659, 0, 'credit', '3298466', '0', 'Dr-Feb 24/266', 659),
(660, 0, 'debit', '4000', '0', 'Dr-Feb 24/267', 660),
(661, 0, 'credit', '4000', '0', 'Dr-Feb 24/267', 661),
(662, 0, 'debit', '21000', '0', 'Dr-Feb 24/268', 662),
(663, 0, 'credit', '21000', '0', 'Dr-Feb 24/268', 663),
(664, 0, 'debit', '2000', '0', 'Dr-Feb 24/269', 664),
(665, 0, 'credit', '2000', '0', 'Dr-Feb 24/269', 665),
(666, 0, 'debit', '6000', '0', 'Dr-Feb 24/270', 666),
(667, 0, 'credit', '6000', '0', 'Dr-Feb 24/270', 667),
(668, 0, 'debit', '5000', '0', 'Dr-Feb 24/271', 668),
(669, 0, 'credit', '5000', '0', 'Dr-Feb 24/271', 669),
(670, 0, 'debit', '85000', '0', 'Dr-Feb 24/272', 670),
(671, 0, 'credit', '85000', '0', 'Dr-Feb 24/272', 671),
(672, 0, 'debit', '2500', '0', 'Dr-Feb 24/273', 672),
(673, 0, 'credit', '2500', '0', 'Dr-Feb 24/273', 673),
(674, 0, 'debit', '4500', '0', 'Dr-Feb 24/274', 674),
(675, 0, 'credit', '4500', '0', 'Dr-Feb 24/274', 675),
(676, 0, 'debit', '12000', '0', 'Dr-Feb 24/275', 676),
(677, 0, 'credit', '12000', '0', 'Dr-Feb 24/275', 677),
(678, 0, 'debit', '35000', '0', 'Dr-Feb 24/276', 678),
(679, 0, 'credit', '35000', '0', 'Dr-Feb 24/276', 679),
(680, 0, 'debit', '6000', '0', 'Dr-Feb 24/277', 680),
(681, 0, 'credit', '6000', '0', 'Dr-Feb 24/277', 681),
(682, 0, 'debit', '2000', '0', 'Dr-Feb 24/278', 682),
(683, 0, 'credit', '2000', '0', 'Dr-Feb 24/278', 683),
(684, 0, 'debit', '15000', '0', 'Dr-Feb 24/279', 684),
(685, 0, 'credit', '15000', '0', 'Dr-Feb 24/279', 685),
(686, 0, 'debit', '55000', '0', 'Dr-Feb 24/280', 686),
(687, 0, 'credit', '55000', '0', 'Dr-Feb 24/280', 687),
(688, 0, 'debit', '25400', '0', 'Dr-Feb 24/281', 688),
(689, 0, 'credit', '25400', '0', 'Dr-Feb 24/281', 689),
(690, 0, 'debit', '47300', '0', 'Dr-Feb 24/282', 690),
(691, 0, 'credit', '47300', '0', 'Dr-Feb 24/282', 691),
(692, 0, 'debit', '132670', '0', 'Dr-Feb 24/283', 692),
(693, 0, 'credit', '132670', '0', 'Dr-Feb 24/283', 693),
(694, 0, 'debit', '7000', '0', 'Dr-Feb 24/284', 694),
(695, 0, 'credit', '7000', '0', 'Dr-Feb 24/284', 695),
(696, 0, 'debit', '15000', '0', 'Dr-Feb 24/285', 696),
(697, 0, 'credit', '15000', '0', 'Dr-Feb 24/285', 697),
(698, 0, 'debit', '3500', '0', 'Dr-Feb 24/286', 698),
(699, 0, 'credit', '3500', '0', 'Dr-Feb 24/286', 699),
(700, 0, 'debit', '1330000', '0', 'Dr-Feb 24/287', 700),
(701, 0, 'credit', '1330000', '0', 'Dr-Feb 24/287', 701),
(702, 0, 'debit', '21000', '0', 'Dr-Feb 24/288', 702),
(703, 0, 'credit', '21000', '0', 'Dr-Feb 24/288', 703),
(704, 0, 'debit', '15000', '0', 'Dr-Feb 24/289', 704),
(705, 0, 'credit', '15000', '0', 'Dr-Feb 24/289', 705),
(706, 0, 'debit', '78000', '0', 'Dr-Feb 24/290', 706),
(707, 0, 'credit', '78000', '0', 'Dr-Feb 24/290', 707),
(708, 0, 'debit', '206000', '0', 'Dr-Feb 24/291', 708),
(709, 0, 'credit', '206000', '0', 'Dr-Feb 24/291', 709),
(710, 0, 'debit', '840000', '0', 'Dr-Feb 24/292', 710),
(711, 0, 'credit', '840000', '0', 'Dr-Feb 24/292', 711),
(712, 0, 'debit', '125100', '0', 'Dr-Feb 24/293', 712),
(713, 0, 'credit', '125100', '0', 'Dr-Feb 24/293', 713),
(714, 0, 'debit', '2116280', '0', 'Dr-Feb 24/294', 714),
(715, 0, 'credit', '2116280', '0', 'Dr-Feb 24/294', 715),
(716, 0, 'debit', '1320000', '0', 'Dr-Feb 24/295', 716),
(717, 0, 'credit', '1320000', '0', 'Dr-Feb 24/295', 717),
(718, 0, 'debit', '100000', '0', 'Dr-Feb 24/296', 718),
(719, 0, 'credit', '100000', '0', 'Dr-Feb 24/296', 719),
(720, 0, 'debit', '1000000', '0', 'Dr-Feb 24/297', 720),
(721, 0, 'credit', '1000000', '0', 'Dr-Feb 24/297', 721),
(722, 0, 'debit', '7000000', '0', 'Dr-Feb 24/298', 722),
(723, 0, 'credit', '7000000', '0', 'Dr-Feb 24/298', 723),
(724, 0, 'debit', '20000', '0', 'Dr-Feb 24/299', 724),
(725, 0, 'credit', '20000', '0', 'Dr-Feb 24/299', 725),
(726, 0, 'debit', '86000', '0', 'Dr-Feb 24/300', 726),
(727, 0, 'credit', '86000', '0', 'Dr-Feb 24/300', 727),
(728, 0, 'debit', '10000000', '0', 'Dr-Feb 24/301', 728),
(729, 0, 'credit', '10000000', '0', 'Dr-Feb 24/301', 729),
(730, 0, 'debit', '600000', '0', 'Dr-Feb 24/302', 730),
(731, 0, 'credit', '600000', '0', 'Dr-Feb 24/302', 731),
(732, 0, 'debit', '800000', '0', 'Dr-Feb 24/303', 732),
(733, 0, 'credit', '800000', '0', 'Dr-Feb 24/303', 733),
(734, 0, 'debit', '3721000', '0', 'Dr-Feb 24/304', 734),
(735, 0, 'credit', '3721000', '0', 'Dr-Feb 24/304', 735),
(736, 0, 'debit', '16000', '0', 'Dr-Feb 24/305', 736),
(737, 0, 'credit', '16000', '0', 'Dr-Feb 24/305', 737),
(738, 0, 'debit', '1000000', '0', 'Dr-Feb 24/306', 738),
(739, 0, 'credit', '1000000', '0', 'Dr-Feb 24/306', 739),
(740, 0, 'debit', '7500', '0', 'Dr-Feb 24/307', 740),
(741, 0, 'credit', '7500', '0', 'Dr-Feb 24/307', 741),
(742, 0, 'debit', '26000', '0', 'Dr-Feb 24/308', 742),
(743, 0, 'credit', '26000', '0', 'Dr-Feb 24/308', 743),
(744, 0, 'debit', '50000', '0', 'Dr-Feb 24/309', 744),
(745, 0, 'credit', '50000', '0', 'Dr-Feb 24/309', 745),
(746, 0, 'debit', '4000', '0', 'Dr-Feb 24/310', 746),
(747, 0, 'credit', '4000', '0', 'Dr-Feb 24/310', 747),
(748, 0, 'debit', '40000', '0', 'Dr-Feb 24/311', 748),
(749, 0, 'credit', '40000', '0', 'Dr-Feb 24/311', 749),
(750, 0, 'debit', '86000', '0', 'Dr-Feb 24/312', 750),
(751, 0, 'credit', '86000', '0', 'Dr-Feb 24/312', 751),
(752, 0, 'debit', '670000', '0', 'Cr-Feb 24/009', 752),
(753, 0, 'credit', '670000', '0', 'Cr-Feb 24/009', 753),
(754, 0, 'debit', '87528227', '0', 'Cr-Feb 24/010', 754),
(755, 0, 'credit', '87528227', '0', 'Cr-Feb 24/010', 755),
(756, 0, 'debit', '27000', '0', 'Dr-Feb 24/313', 756),
(757, 0, 'credit', '27000', '0', 'Dr-Feb 24/313', 757),
(758, 0, 'debit', '18000', '0', 'Dr-Feb 24/314', 758),
(759, 0, 'credit', '18000', '0', 'Dr-Feb 24/314', 759),
(760, 0, 'debit', '2700', '0', 'Dr-Feb 24/315', 760),
(761, 0, 'credit', '2700', '0', 'Dr-Feb 24/315', 761),
(762, 0, 'debit', '40000', '0', 'Dr-Feb 24/316', 762),
(763, 0, 'credit', '40000', '0', 'Dr-Feb 24/316', 763),
(764, 0, 'debit', '16000', '0', 'Dr-Feb 24/317', 764),
(765, 0, 'credit', '16000', '0', 'Dr-Feb 24/317', 765),
(766, 0, 'debit', '2000', '0', 'Dr-Feb 24/318', 766),
(767, 0, 'credit', '2000', '0', 'Dr-Feb 24/318', 767),
(768, 0, 'debit', '582100', '0', 'Dr-Feb 24/319', 768),
(769, 0, 'credit', '582100', '0', 'Dr-Feb 24/319', 769),
(770, 0, 'debit', '2000', '0', 'Dr-Feb 24/320', 770),
(771, 0, 'credit', '2000', '0', 'Dr-Feb 24/320', 771),
(772, 0, 'debit', '4000000', '0', 'Dr-Feb 24/321', 772),
(773, 0, 'credit', '4000000', '0', 'Dr-Feb 24/321', 773),
(774, 0, 'debit', '3000000', '0', 'Dr-Feb 24/322', 774),
(775, 0, 'credit', '3000000', '0', 'Dr-Feb 24/322', 775),
(776, 0, 'debit', '10000000', '0', 'Dr-Feb 24/323', 776),
(777, 0, 'credit', '10000000', '0', 'Dr-Feb 24/323', 777),
(778, 0, 'debit', '3000000', '0', 'Dr-Feb 24/324', 778),
(779, 0, 'credit', '3000000', '0', 'Dr-Feb 24/324', 779),
(780, 0, 'debit', '24000', '0', 'Dr-Feb 24/325', 780),
(781, 0, 'credit', '24000', '0', 'Dr-Feb 24/325', 781),
(782, 0, 'debit', '11000', '0', 'Dr-Feb 24/326', 782),
(783, 0, 'credit', '11000', '0', 'Dr-Feb 24/326', 783),
(784, 0, 'debit', '6000', '0', 'Dr-Feb 24/327', 784),
(785, 0, 'credit', '6000', '0', 'Dr-Feb 24/327', 785),
(786, 0, 'debit', '22000', '0', 'Dr-Feb 24/328', 786),
(787, 0, 'credit', '22000', '0', 'Dr-Feb 24/328', 787),
(788, 0, 'debit', '4000', '0', 'Dr-Feb 24/329', 788),
(789, 0, 'credit', '4000', '0', 'Dr-Feb 24/329', 789),
(790, 0, 'debit', '2700', '0', 'Dr-Feb 24/330', 790),
(791, 0, 'credit', '2700', '0', 'Dr-Feb 24/330', 791),
(792, 0, 'debit', '93500', '0', 'Dr-Feb 24/331', 792),
(793, 0, 'credit', '93500', '0', 'Dr-Feb 24/331', 793),
(794, 0, 'debit', '1600', '0', 'Dr-Feb 24/332', 794),
(795, 0, 'credit', '1600', '0', 'Dr-Feb 24/332', 795),
(796, 0, 'debit', '60000', '0', 'Dr-Feb 24/333', 796),
(797, 0, 'credit', '60000', '0', 'Dr-Feb 24/333', 797),
(798, 0, 'debit', '4500', '0', 'Dr-Feb 24/334', 798),
(799, 0, 'credit', '4500', '0', 'Dr-Feb 24/334', 799),
(800, 0, 'debit', '1924500', '0', 'Dr-Feb 24/335', 800),
(801, 0, 'credit', '1924500', '0', 'Dr-Feb 24/335', 801),
(802, 0, 'debit', '30000', '0', 'Dr-Feb 24/336', 802),
(803, 0, 'credit', '30000', '0', 'Dr-Feb 24/336', 803),
(804, 0, 'debit', '50000', '0', 'Dr-Feb 24/337', 804),
(805, 0, 'credit', '50000', '0', 'Dr-Feb 24/337', 805),
(806, 0, 'debit', '50000', '0', 'Dr-Feb 24/338', 806),
(807, 0, 'credit', '50000', '0', 'Dr-Feb 24/338', 807),
(808, 0, 'debit', '50000', '0', 'Dr-Feb 24/339', 808),
(809, 0, 'credit', '50000', '0', 'Dr-Feb 24/339', 809),
(810, 0, 'debit', '17000', '0', 'Dr-Feb 24/340', 810),
(811, 0, 'credit', '17000', '0', 'Dr-Feb 24/340', 811),
(812, 0, 'debit', '20000', '0', 'Dr-Feb 24/341', 812),
(813, 0, 'credit', '20000', '0', 'Dr-Feb 24/341', 813),
(814, 0, 'debit', '116000', '0', 'Dr-Feb 24/342', 814),
(815, 0, 'credit', '116000', '0', 'Dr-Feb 24/342', 815),
(816, 0, 'debit', '239690', '0', 'Dr-Feb 24/343', 816),
(817, 0, 'credit', '239690', '0', 'Dr-Feb 24/343', 817),
(818, 0, 'debit', '7417050', '0', 'Dr-Feb 24/344', 818),
(819, 0, 'credit', '7417050', '0', 'Dr-Feb 24/344', 819),
(820, 0, 'debit', '12726550', '0', 'Dr-Feb 24/344', 820),
(821, 0, 'credit', '12726550', '0', 'Dr-Feb 24/344', 821),
(822, 0, 'debit', '6000000', '0', 'Dr-Feb 24/345', 822),
(823, 0, 'credit', '6000000', '0', 'Dr-Feb 24/345', 823),
(824, 1, 'debit', '21000', '21000', 'Cr-Feb 24/011', 824),
(825, 1, 'credit', '21000', '21000', 'Cr-Feb 24/011', 825),
(826, 2100, 'debit', '15370929', '7319.49', 'Cr-Feb 24/011', 826),
(827, 2100, 'credit', '15370929', '7319.49', 'Cr-Feb 24/011', 827),
(828, 3483, 'debit', '47649216.33', '13680.51', 'Cr-Feb 24/011', 828),
(829, 3483, 'credit', '47649216.33', '13680.51', 'Cr-Feb 24/011', 829),
(830, 1, 'debit', '75000', '75000', 'Cr-Feb 24/012', 830),
(831, 1, 'credit', '75000', '75000', 'Cr-Feb 24/012', 831),
(838, 1, 'debit', '85000', '85000', 'RV-SAF-0001', 838),
(839, 1, 'credit', '85000', '85000', 'RV-SAF-0001', 839),
(840, 1, 'debit', '85000', '85000', 'RV-SAF-0002', 840),
(841, 1, 'credit', '85000', '85000', 'RV-SAF-0002', 841),
(842, 1, 'debit', '13000', '13000', 'JV02-0001', 842),
(843, 1, 'credit', '13000', '13000', 'JV02-0001', 843),
(844, 1, 'debit', '22000', '22000', 'JV02-0001', 844),
(845, 1, 'credit', '22000', '22000', 'JV02-0001', 845),
(846, 1, 'debit', '137554.28', '137554.28', 'SAF-01/2024', 846),
(847, 1, 'credit', '137554.28', '137554.28', 'SAF-01/2024', 847),
(848, 1, 'debit', '193462.28', '193462.28', 'SAF-02/2024', 848),
(849, 1, 'credit', '193462.28', '193462.28', 'SAF-02/2024', 849),
(850, 1, 'debit', '148334.84', '148334.84', 'SAF-03/2024', 850),
(851, 1, 'credit', '148334.84', '148334.84', 'SAF-03/2024', 851),
(852, 1, 'debit', '128300.05', '128300.05', 'SAF-04/2024', 852),
(853, 1, 'credit', '128300.05', '128300.05', 'SAF-04/2024', 853),
(854, 1, 'debit', '85000', '85000', 'RV-SAF-0003', 854),
(855, 1, 'credit', '85000', '85000', 'RV-SAF-0003', 855),
(856, 1, 'debit', '130898.6', '130898.60', 'Can-03/24', 856),
(857, 1, 'credit', '130898.6', '130898.60', 'Can-03/24', 857),
(858, 1, 'debit', '171571.75', '171571.75', 'Can-04/24', 858),
(859, 1, 'credit', '171571.75', '171571.75', 'Can-04/24', 859),
(860, 1, 'debit', '23000', '23000', 'RV-CAN-0001', 860),
(861, 1, 'credit', '23000', '23000', 'RV-CAN-0001', 861);

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
('3300/001', 'Other Receivable-Best Brand A/C', 'Best Brand Company', ''),
('3300/002', 'South Asia Food-USA A/C', 'SAF (USA) Company Ltd', ''),
('3300/003', 'Jamuna Food-Canada A/C', 'CAN (Jamuna Food) Company Ltd', ''),
('3300/004', 'ITALY', '', ''),
('3300/005', 'Western Trader (Kolkata)', '', '');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `general_ledger`
--

CREATE TABLE `general_ledger` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `voucherno` varchar(255) NOT NULL,
  `ac_code` varchar(25) NOT NULL,
  `debit` text NOT NULL,
  `credit` text NOT NULL,
  `balance` text NOT NULL,
  `narration` text NOT NULL,
  `sr_no` varchar(25) NOT NULL,
  `container_no` varchar(25) NOT NULL,
  `bank_charges` float NOT NULL,
  `acid` int(11) NOT NULL,
  `transactionid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `remark` text NOT NULL,
  `hhk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `remark` text NOT NULL,
  `fish_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(18, '1002', '3up', '10', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 11, 18);

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
(1017, 'Katla'),
(1018, 'Keski'),
(1019, 'Koi'),
(1020, 'Koral'),
(1021, 'Lakka'),
(1022, 'Lotia'),
(1023, 'Mrigal'),
(1024, 'Pangush'),
(1025, 'Pujanut'),
(1026, 'Puti (W)'),
(1027, 'Red Snapper'),
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
(1038, 'PPP'),
(1039, 'Puti (G)'),
(1042, 'Grass Carp'),
(1043, 'Poa'),
(1044, 'Moila'),
(1045, 'Baga Ayer');

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
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `unit` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `material_purchase`
--

CREATE TABLE `material_purchase` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `voucher_no` int(11) NOT NULL,
  `supplier_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `material_id` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `material_store_house`
--

CREATE TABLE `material_store_house` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT current_timestamp(),
  `voucher_no` text COLLATE utf8_unicode_ci NOT NULL,
  `supplier_id` text COLLATE utf8_unicode_ci NOT NULL,
  `material_id` int(11) NOT NULL,
  `in` int(11) DEFAULT NULL,
  `out` int(11) DEFAULT NULL,
  `output_group` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 1, 'manage_accounts,manage_role,manage_sale,manage_purchase,manage_cashbook,manage_acpayable,manage_accountreceivable,manage_transactionmanage_general_ledger,manage_customers,manage_supplier,manage_coldstoreitem,manage_item,manage_actype,manage_acname,manage_coldstorecharges,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport,manage_shippmentexport,manage_truckexport,sale_report,purchase_report,payable_report,manage_mcreport,manage_tclmcstock,material_list,manage_material_purchase,material_store_house,material_output,packing_material_report'),
(2, 2, ',manage_item,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_mcreport,manage_tclmcstock'),
(3, 3, ',manage_coldstoreitem,manage_coldstorecharges,manage_shippmentexport,manage_truckexport'),
(4, 4, ',manage_purchase,manage_cashbook,manage_acpayable,manage_accountreceivable,manage_transactionmanage_general_ledger,manage_customers,manage_supplier,manage_coldstoreitem,manage_item,manage_actype,manage_acname,manage_unit,manage_coldstorecharges,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport,manage_shippmentexport,manage_truckexport,manage_packingmaterial,sale_report,purchase_report,payable_report,manage_mcreport,manage_tclmcstock'),
(5, 5, ',manage_coldstoreitem,manage_coldstorecharges');

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
  `invoice_amount` text NOT NULL,
  `paid_date` date NOT NULL,
  `payment_no` varchar(25) NOT NULL,
  `particulars` varchar(255) NOT NULL,
  `paid_amount` text NOT NULL,
  `balance` text NOT NULL,
  `transactionid` int(11) NOT NULL
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
(1, 'Admin'),
(2, 'Stock'),
(3, 'Shippment'),
(4, 'TCL'),
(5, 'Coldstore');

-- --------------------------------------------------------

--
-- Table structure for table `stock_output_group`
--

CREATE TABLE `stock_output_group` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT current_timestamp(),
  `time` time DEFAULT current_timestamp(),
  `stock_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `voucher_no` int(11) DEFAULT NULL,
  `group_name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `material_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(121, '4000/Z03', 'Zaw Myat Thu', '', ''),
(123, '4000/K08', 'Ko Ma Noe', '', ''),
(124, '4000/D01', 'Dry Fish (Shwe Hinn Thar)', '', ''),
(125, '4000/D02', 'Dry Fish (Myo Thant)', '', ''),
(126, '4000/k09', 'Kyaw Thein Than', '', ''),
(127, '4000/G02', 'GM', '', ''),
(129, '4000/D03', 'Dry Fish (Zabu Thein)', '', ''),
(130, '4000/k10', 'Ko Myo', '', ''),
(131, '4000/M08', 'Market By', '', ''),
(132, '4000/T13', 'Tun Tun', '', ''),
(133, '4000/M09', 'Min Lwin', '', ''),
(134, '4000/k11', 'Khaing Lay', '', ''),
(135, '4000/T08', 'Thet Lwin', '', ''),
(136, '4000/N03', 'Nay Lin', '', ''),
(137, '4000/T14', 'Tun Naing', '', ''),
(138, '4000/k12', 'Ko Pan', '', ''),
(139, '4000/A08', 'Aye Ko', '', ''),
(140, '4000/N04', 'Nyan Tun', '', ''),
(141, '4000/T15', 'Thet Oo (TCL)', '', ''),
(142, '4000/A09', 'Aung Zaw Oo (TCL)', '', ''),
(143, '4000/A10', 'Aye Htike Ko', '', ''),
(144, '4000/M10', 'Mg Mg Nyunt (TCL)', '', ''),
(145, '4000/A11', 'Arr Kae (TCL)', '', ''),
(146, '4000/T16', 'Thiha', '', ''),
(147, '4000/K13', 'Ko Hlawn', '', ''),
(148, '4000/A12', 'Aung Kyaw Moe (TCL)', '', ''),
(149, '4000/A13', 'Aye Htike Ko (TCL)', '', ''),
(150, '4000/K14', 'Kaung Myat Tun', '', ''),
(151, '4000/T12', 'Than Soe', '', ''),
(152, '4000/T17', 'Than Than Myint', '', ''),
(153, '4000/S12', 'San San Yee', '', ''),
(154, '4000/T18', 'Tin Ohine', '', ''),
(156, '4000/099', 'Tommy', '09977221152', 'Yangon');

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
  `debit` text NOT NULL,
  `credit` text NOT NULL,
  `currency` varchar(20) NOT NULL,
  `sr_no` varchar(25) NOT NULL,
  `container_no` varchar(25) NOT NULL,
  `bank_charges` float NOT NULL,
  `status` varchar(25) NOT NULL DEFAULT 'selected'
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(197, '02:19:15.000000', '2024-03-19', 'admin', 'admin', 'Login Success'),
(198, '06:02:28.000000', '2024-03-19', 'admin', 'admin', 'Login Success'),
(199, '12:30:55.000000', '2024-03-22', 'admin', 'admin', 'Login Success'),
(200, '12:32:52.000000', '2024-03-22', 'admin', 'admin', 'Login Success'),
(201, '01:19:36.000000', '2024-03-22', 'admin', '', 'Logout Success'),
(202, '01:19:43.000000', '2024-03-22', 'admin', 'admin', 'Login Success'),
(203, '01:23:46.000000', '2024-03-22', 'admin', 'admin', 'Login Success'),
(204, '01:24:32.000000', '2024-03-22', 'admin', 'admin', 'Login Success'),
(205, '01:26:15.000000', '2024-03-22', 'admin', '', 'Logout Success'),
(206, '01:26:42.000000', '2024-03-22', 'admin', 'admin', 'Login Success'),
(207, '01:34:46.000000', '2024-03-22', 'admin', '', 'Logout Success'),
(208, '01:35:04.000000', '2024-03-22', 'Lin Lin Naing', 'coldstore', 'Login Success'),
(209, '01:35:18.000000', '2024-03-22', 'Lin Lin Naing', '', 'Logout Success'),
(210, '01:35:24.000000', '2024-03-22', 'admin', 'admin', 'Login Success'),
(211, '01:39:25.000000', '2024-03-22', 'admin', 'admin', 'Login Failed'),
(212, '01:39:43.000000', '2024-03-22', 'Lin Lin Naing', 'coldstore', 'Login Success'),
(213, '01:40:55.000000', '2024-03-22', 'Lin Lin Naing', '', 'Logout Success'),
(214, '01:41:28.000000', '2024-03-22', 'Lin Lin Naing', 'coldstore', 'Login Success'),
(215, '01:41:51.000000', '2024-03-22', 'Lin Lin Naing', '', 'Logout Success'),
(216, '01:42:06.000000', '2024-03-22', 'Lin Lin Naing', 'coldstore', 'Login Success'),
(217, '01:54:26.000000', '2024-03-22', 'Lin Lin Naing', 'coldstore', 'Login Success'),
(218, '01:55:41.000000', '2024-03-22', 'Lin Lin Naing', 'coldstore', 'Login Success'),
(219, '02:17:27.000000', '2024-03-22', 'Lin Lin Naing', 'coldstore', 'Login Success'),
(220, '02:20:11.000000', '2024-03-22', 'Lin Lin Naing', 'coldstore', 'Login Success'),
(221, '03:24:34.000000', '2024-03-22', 'Lin Lin Naing', 'coldstore', 'Login Success'),
(222, '03:35:51.000000', '2024-03-22', 'Lin Lin Naing', '', 'Logout Success'),
(223, '03:36:09.000000', '2024-03-22', 'Lin Lin Naing', 'coldstore', 'Login Success'),
(224, '03:48:36.000000', '2024-03-22', 'admin', '', 'Logout Success'),
(225, '03:48:52.000000', '2024-03-22', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(226, '03:49:21.000000', '2024-03-22', 'Thin Zar Kyaw', '', 'Logout Success'),
(227, '03:49:38.000000', '2024-03-22', 'Adminstrator', 'protechadmin2024***', 'Login Failed'),
(228, '03:50:01.000000', '2024-03-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(229, '03:51:08.000000', '2024-03-22', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(230, '04:55:34.000000', '2024-03-22', 'Administrator', '', 'Logout Success'),
(231, '09:59:30.000000', '2024-03-23', 'admin', 'admin', 'Login Failed'),
(232, '09:59:57.000000', '2024-03-23', 'Administrator', 'protechadmin2024***', 'Login Success'),
(233, '10:06:27.000000', '2024-03-23', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(234, '10:53:08.000000', '2024-03-23', 'Administrator', '', 'Logout Success'),
(235, '10:53:18.000000', '2024-03-23', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(236, '10:53:25.000000', '2024-03-23', 'Thin Zar Kyaw', '', 'Logout Success'),
(237, '10:53:45.000000', '2024-03-23', 'Administrator', 'protechadmin2024***', 'Login Success'),
(238, '01:18:27.000000', '2024-03-23', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(239, '03:44:14.000000', '2024-03-23', 'Administrator', '', 'Logout Success'),
(240, '03:44:27.000000', '2024-03-23', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(241, '03:45:12.000000', '2024-03-23', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(242, '03:05:37.000000', '2024-03-25', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(243, '03:47:48.000000', '2024-03-25', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(244, '05:30:11.000000', '2024-03-25', 'Administrator', 'protechadmin***', 'Login Password Invalid'),
(245, '05:30:41.000000', '2024-03-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(246, '05:53:19.000000', '2024-03-25', 'Administrator', '', 'Logout Success'),
(247, '05:56:12.000000', '2024-03-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(248, '02:00:03.000000', '2024-03-26', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(249, '03:37:25.000000', '2024-03-26', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(250, '10:57:10.000000', '2024-03-28', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(251, '11:35:37.000000', '2024-03-28', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(252, '01:25:18.000000', '2024-03-28', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(253, '03:02:41.000000', '2024-03-28', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(254, '03:36:09.000000', '2024-03-28', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(255, '03:52:22.000000', '2024-03-28', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(256, '05:05:11.000000', '2024-03-28', 'Thin Zar Kyaw', '', 'Logout Success'),
(257, '02:43:12.000000', '2024-03-30', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(258, '03:33:51.000000', '2024-03-30', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(259, '07:37:32.000000', '2024-04-01', 'admin', 'admin', 'Login Failed'),
(260, '07:37:46.000000', '2024-04-01', 'Administrator', 'protechadmin2008***', 'Login Password Invalid'),
(261, '07:37:57.000000', '2024-04-01', 'Administrator', 'protechadmin2024***', 'Login Success'),
(262, '09:16:21.000000', '2024-04-01', 'Administrator', 'protechadmin2024***', 'Login Success'),
(263, '09:17:28.000000', '2024-04-01', 'Administrator', 'protechadmin2024***', 'Login Success'),
(264, '10:37:39.000000', '2024-04-01', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(265, '10:57:03.000000', '2024-04-01', 'Administrator', '', 'Logout Success'),
(266, '11:10:34.000000', '2024-04-01', 'Administrator', 'protechadmin2024***', 'Login Success'),
(267, '11:23:45.000000', '2024-04-01', 'admin', 'admin', 'Login Failed'),
(268, '11:23:53.000000', '2024-04-01', 'Administrator', 'protechadmin2024***', 'Login Success'),
(269, '11:31:00.000000', '2024-04-01', 'Administrator', '', 'Logout Success'),
(270, '11:31:34.000000', '2024-04-01', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(271, '01:15:27.000000', '2024-04-01', 'Thin Zar Kyaw', '', 'Logout Success'),
(272, '01:24:15.000000', '2024-04-01', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(273, '10:22:11.000000', '2024-04-02', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(274, '03:25:00.000000', '2024-04-02', 'Thin Zar Kyaw', '', 'Logout Success'),
(275, '03:26:00.000000', '2024-04-02', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(276, '04:54:07.000000', '2024-04-02', 'Thin Zar Kyaw', '', 'Logout Success'),
(277, '09:37:40.000000', '2024-04-03', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(278, '11:34:46.000000', '2024-04-03', 'Thin Zar Kyaw', '', 'Logout Success'),
(279, '12:58:46.000000', '2024-04-03', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(280, '04:54:09.000000', '2024-04-03', 'Thin Zar Kyaw', '', 'Logout Success'),
(281, '10:21:05.000000', '2024-04-05', 'Administrator', 'protechadmin2024***', 'Login Success'),
(282, '10:21:58.000000', '2024-04-05', 'Administrator', '', 'Logout Success'),
(283, '09:21:39.000000', '2024-04-10', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(284, '09:30:34.000000', '2024-04-10', 'Thin Zar Kyaw', '', 'Logout Success'),
(285, '09:32:19.000000', '2024-04-10', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(286, '04:50:48.000000', '2024-04-10', 'Thin Zar Kyaw', '', 'Logout Success'),
(287, '09:18:23.000000', '2024-04-11', 'Thin Zar Kyaw', 'thinzarkyaw', 'Login Success'),
(288, '04:56:27.000000', '2024-04-11', 'Thin Zar Kyaw', '', 'Logout Success'),
(289, '01:17:06.000000', '2024-04-25', 'admin', 'admin', 'Login Failed'),
(290, '01:34:07.000000', '2024-04-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(291, '05:51:59.000000', '2024-04-27', 'Administrator', 'protechadmin2024***', 'Login Success'),
(292, '11:14:19.000000', '2024-05-10', 'Administrator', 'protechadmin2024***', 'Login Success'),
(293, '11:25:11.000000', '2024-05-10', 'Administrator', '', 'Logout Success'),
(294, '11:25:29.000000', '2024-05-10', 'Su Thiri Kyaw', '122333', 'Login Password Invalid'),
(295, '11:25:39.000000', '2024-05-10', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(296, '11:25:45.000000', '2024-05-10', 'Su Thiri Kyaw', '', 'Logout Success'),
(297, '11:25:57.000000', '2024-05-10', 'Administrator', 'protechadmin2024***', 'Login Success'),
(298, '11:30:30.000000', '2024-05-10', 'Ma Soe Soe Khaing', 'Stock Stock', 'Login Password Invalid'),
(299, '11:30:46.000000', '2024-05-10', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(300, '01:29:06.000000', '2024-05-10', 'Administrator', 'protechadmin2024***', 'Login Success'),
(301, '01:30:48.000000', '2024-05-10', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(302, '03:47:27.000000', '2024-05-10', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(303, '04:59:04.000000', '2024-05-10', 'Administrator', '', 'Logout Success'),
(304, '09:20:46.000000', '2024-05-10', 'Administrator', 'protechadmin20204***', 'Login Password Invalid'),
(305, '09:20:56.000000', '2024-05-10', 'Administrator', 'protechadmin2024***', 'Login Success'),
(306, '09:52:17.000000', '2024-05-11', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(307, '01:13:49.000000', '2024-05-24', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(308, '11:05:41.000000', '2024-05-28', 'su thiri kyaw', 'su122333', 'Login Success'),
(309, '11:09:46.000000', '2024-05-28', 'su thiri kyaw', '', 'Logout Success'),
(310, '11:13:08.000000', '2024-05-28', 'su thiri kyaw', 'su122333', 'Login Success'),
(311, '11:46:59.000000', '2024-05-28', 'su thiri kyaw', '', 'Logout Success'),
(312, '12:54:02.000000', '2024-05-28', 'suthirikyaw', 'su122333', 'Login Failed'),
(313, '12:54:35.000000', '2024-05-28', 'suthirikyaw', 'su122333', 'Login Failed'),
(314, '12:54:53.000000', '2024-05-28', 'suthirikyaw', 'su122333', 'Login Failed'),
(315, '12:55:48.000000', '2024-05-28', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(316, '02:37:16.000000', '2024-05-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(317, '04:09:02.000000', '2024-05-28', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(318, '04:46:57.000000', '2024-05-28', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(319, '04:50:40.000000', '2024-05-28', 'Su Thiri Kyaw', '', 'Logout Success'),
(320, '10:47:50.000000', '2024-05-29', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(321, '11:07:09.000000', '2024-05-29', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(322, '01:38:11.000000', '2024-05-29', 'Su Thiri Kyaw', 'SU122333', 'Login Password Invalid'),
(323, '01:38:29.000000', '2024-05-29', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(324, '02:14:32.000000', '2024-05-29', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(325, '03:50:52.000000', '2024-05-29', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(326, '09:27:42.000000', '2024-05-30', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(327, '01:21:59.000000', '2024-05-30', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(328, '02:06:13.000000', '2024-05-30', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(329, '02:55:00.000000', '2024-05-30', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(330, '03:51:45.000000', '2024-05-30', 'Su Thiri Kyaw', '', 'Logout Success'),
(331, '02:49:39.000000', '2024-05-31', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(332, '09:17:56.000000', '2024-06-01', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(333, '10:44:10.000000', '2024-06-01', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(334, '11:49:34.000000', '2024-06-01', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(335, '01:53:26.000000', '2024-06-01', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(336, '02:11:43.000000', '2024-06-01', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(337, '02:24:06.000000', '2024-06-01', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(338, '03:19:37.000000', '2024-06-01', 'Su Thiri Kyaw', '', 'Logout Success'),
(339, '04:05:18.000000', '2024-06-01', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(340, '10:47:48.000000', '2024-06-04', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(341, '11:59:10.000000', '2024-06-04', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(342, '01:26:40.000000', '2024-06-04', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(343, '02:54:24.000000', '2024-06-04', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(344, '03:29:00.000000', '2024-06-04', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(345, '09:05:36.000000', '2024-06-05', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(346, '09:09:05.000000', '2024-06-05', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(347, '09:57:55.000000', '2024-06-05', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(348, '12:34:30.000000', '2024-06-05', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(349, '12:47:20.000000', '2024-06-05', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(350, '01:02:33.000000', '2024-06-05', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(351, '01:10:46.000000', '2024-06-05', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(352, '01:32:11.000000', '2024-06-05', 'su thiri kyaw', 'su122333', 'Login Success'),
(353, '01:32:27.000000', '2024-06-05', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(354, '02:37:49.000000', '2024-06-05', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(355, '03:22:42.000000', '2024-06-05', 'su thiri kyaw', 'su122333', 'Login Success'),
(356, '03:37:57.000000', '2024-06-05', 'su thiri kyaw', '', 'Logout Success'),
(357, '06:35:54.000000', '2024-06-14', 'Administrator', 'admin2024***', 'Login Password Invalid'),
(358, '06:36:02.000000', '2024-06-14', 'Administrator', 'protechadmin2024***', 'Login Success'),
(359, '06:58:43.000000', '2024-06-14', 'Administrator', 'protechadmin2024***', 'Login Success'),
(360, '07:00:41.000000', '2024-06-14', 'Administrator', 'protechadmin2024***', 'Login Success'),
(361, '10:50:04.000000', '2024-06-15', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(362, '10:57:10.000000', '2024-06-15', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(363, '11:08:40.000000', '2024-06-15', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(364, '01:09:12.000000', '2024-06-15', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(365, '02:15:18.000000', '2024-06-15', 'Su Thiri Kyaw', '', 'Logout Success'),
(366, '02:15:29.000000', '2024-06-15', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(367, '11:28:19.000000', '2024-06-17', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(368, '12:25:54.000000', '2024-06-17', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(369, '12:36:36.000000', '2024-06-17', 'Ma Sandar Aung', '12341234', 'Login Success'),
(370, '01:14:55.000000', '2024-06-17', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(371, '01:43:03.000000', '2024-06-19', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(372, '01:10:48.000000', '2024-06-20', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(373, '01:31:59.000000', '2024-06-20', 'Su Thiri Kyaw', 'su12233', 'Login Password Invalid'),
(374, '01:32:13.000000', '2024-06-20', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(375, '03:16:09.000000', '2024-06-20', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(376, '04:15:59.000000', '2024-06-20', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(377, '04:38:21.000000', '2024-06-20', 'Su Thiri Kyaw', '', 'Logout Success'),
(378, '04:38:32.000000', '2024-06-20', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(379, '04:45:32.000000', '2024-06-20', 'Su Thiri Kyaw', '', 'Logout Success'),
(380, '08:37:17.000000', '2024-06-21', 'Ma Sandar Aung', '12341234', 'Login Success'),
(381, '08:43:37.000000', '2024-06-21', 'Ma Sandar Aung', '', 'Logout Success'),
(382, '08:53:04.000000', '2024-06-21', 'Ma Sandar Aung', '12341234', 'Login Success'),
(383, '08:59:38.000000', '2024-06-21', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(384, '09:16:05.000000', '2024-06-21', 'Ma Sandar Aung', '', 'Logout Success'),
(385, '12:42:16.000000', '2024-06-21', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(386, '12:43:43.000000', '2024-06-21', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(387, '01:32:48.000000', '2024-06-21', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(388, '02:18:18.000000', '2024-06-21', 'Ma Soe Soe Khaing', 'Stockstock', 'Login Password Invalid'),
(389, '02:18:54.000000', '2024-06-21', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(390, '02:21:41.000000', '2024-06-21', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(391, '02:27:52.000000', '2024-06-21', 'Ma Sandar Aung', '12341234', 'Login Success'),
(392, '02:27:56.000000', '2024-06-21', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(393, '02:29:05.000000', '2024-06-21', 'Su Thiri Kyaw', '', 'Logout Success'),
(394, '04:52:21.000000', '2024-06-21', 'Ma Sandar Aung', '', 'Logout Success'),
(395, '06:04:51.000000', '2024-06-21', 'Ma Sandar Aung', '12341234', 'Login Success'),
(396, '07:52:19.000000', '2024-06-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(397, '09:12:26.000000', '2024-06-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(398, '10:22:56.000000', '2024-06-23', 'Administrator', 'protechadmin2024***', 'Login Success'),
(399, '06:18:15.000000', '2024-06-23', 'Administrator', 'protechadmin2024***', 'Login Success'),
(400, '09:30:04.000000', '2024-06-23', 'Administrator', 'protechadmin2024***', 'Login Success'),
(401, '10:09:15.000000', '2024-06-23', 'Ma Sandar Aung', '', 'Logout Success'),
(402, '09:02:56.000000', '2024-06-24', 'Ma Sandar Aung', '12341234', 'Login Success'),
(403, '09:54:40.000000', '2024-06-24', 'Ma Sandar Aung', '', 'Logout Success'),
(404, '10:18:54.000000', '2024-06-24', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(405, '11:00:59.000000', '2024-06-24', 'Ma Sandar Aung', '12341234', 'Login Success'),
(406, '12:31:42.000000', '2024-06-24', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(407, '12:36:51.000000', '2024-06-24', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(408, '12:43:28.000000', '2024-06-24', 'Ma Sandar Aung', '', 'Logout Success'),
(409, '02:02:14.000000', '2024-06-24', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(410, '09:27:30.000000', '2024-06-26', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(411, '10:49:28.000000', '2024-06-26', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(412, '12:52:35.000000', '2024-06-26', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(413, '12:55:18.000000', '2024-06-26', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(414, '01:10:31.000000', '2024-06-26', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(415, '01:44:09.000000', '2024-06-26', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(416, '09:10:57.000000', '2024-06-27', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(417, '09:35:03.000000', '2024-06-27', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(418, '12:06:45.000000', '2024-06-27', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(419, '12:50:26.000000', '2024-06-27', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(420, '01:09:33.000000', '2024-06-27', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(421, '02:17:53.000000', '2024-06-27', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(422, '02:49:10.000000', '2024-06-27', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(423, '09:03:47.000000', '2024-06-28', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(424, '11:39:53.000000', '2024-06-28', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(425, '11:55:56.000000', '2024-06-28', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(426, '12:21:31.000000', '2024-06-28', 'Su Thiri Kyaw', 'SU!@@###', 'Login Password Invalid'),
(427, '01:09:16.000000', '2024-06-28', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(428, '09:50:03.000000', '2024-06-29', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(429, '04:07:34.000000', '2024-06-29', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(430, '09:19:21.000000', '2024-07-02', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(431, '11:31:23.000000', '2024-07-02', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(432, '01:15:36.000000', '2024-07-02', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(433, '01:51:53.000000', '2024-07-02', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(434, '02:25:32.000000', '2024-07-02', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(435, '10:31:30.000000', '2024-07-03', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(436, '10:48:40.000000', '2024-07-03', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(437, '12:58:02.000000', '2024-07-03', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(438, '12:58:02.000000', '2024-07-03', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(439, '01:02:09.000000', '2024-07-03', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(440, '05:24:38.000000', '2024-07-05', 'Administrator', 'protechadmin2024***', 'Login Success'),
(441, '01:26:06.000000', '2024-07-06', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(442, '02:12:14.000000', '2024-07-06', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(443, '03:38:47.000000', '2024-07-06', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(444, '09:31:20.000000', '2024-07-08', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(445, '09:35:50.000000', '2024-07-08', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(446, '09:36:39.000000', '2024-07-08', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(447, '09:41:37.000000', '2024-07-08', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(448, '10:03:50.000000', '2024-07-08', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(449, '10:04:41.000000', '2024-07-08', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(450, '10:04:52.000000', '2024-07-08', 'Su Thiri Kyaw', '', 'Logout Success'),
(451, '10:04:59.000000', '2024-07-08', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(452, '10:05:15.000000', '2024-07-08', 'Su Thiri Kyaw', '', 'Logout Success'),
(453, '10:05:21.000000', '2024-07-08', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(454, '10:17:05.000000', '2024-07-08', 'Su Thiri Kyaw', '', 'Logout Success'),
(455, '10:17:12.000000', '2024-07-08', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(456, '12:18:52.000000', '2024-07-08', 'Administrator', 'protechamin2024***', 'Login Password Invalid'),
(457, '12:19:18.000000', '2024-07-08', 'Administrator', 'protechadmin2024***', 'Login Success'),
(458, '12:40:44.000000', '2024-07-08', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(459, '12:50:53.000000', '2024-07-08', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(460, '02:21:49.000000', '2024-07-08', 'Su Thiri Kyaw', '', 'Logout Success'),
(461, '02:56:53.000000', '2024-07-08', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(462, '03:49:12.000000', '2024-07-08', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(463, '04:35:46.000000', '2024-07-08', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(464, '01:50:28.000000', '2024-07-10', 'Administrator', 'protechadmin2024', 'Login Password Invalid'),
(465, '01:50:41.000000', '2024-07-10', 'Administrator', 'protechadmin2024***', 'Login Success'),
(466, '08:34:26.000000', '2024-07-11', 'Administrator', 'protechadmin2024***', 'Login Success'),
(467, '05:14:13.000000', '2024-07-12', 'Administrator', 'protechadmin2024***', 'Login Success'),
(468, '06:48:46.000000', '2024-07-12', 'Administrator', 'protechadmin2024***', 'Login Success'),
(469, '12:00:32.000000', '2024-07-13', 'Administrator', 'protechadmin2024***', 'Login Success'),
(470, '01:04:49.000000', '2024-07-14', 'Administrator', 'protechadmin2024***', 'Login Success'),
(471, '01:44:27.000000', '2024-07-14', 'Administrator', 'protechadmin2024***', 'Login Success'),
(472, '01:46:27.000000', '2024-07-14', 'Administrator', 'protechadmin2024***', 'Login Success'),
(473, '01:47:48.000000', '2024-07-14', 'Administrator', 'protechadmin2024***', 'Login Success'),
(474, '03:50:32.000000', '2024-07-14', 'Administrator', 'protechadmin2024***', 'Login Success'),
(475, '08:07:28.000000', '2024-07-16', 'Administrator', 'protechadmin2024***', 'Login Success'),
(476, '08:12:27.000000', '2024-07-16', 'Administrator', 'protechadmin2024***', 'Login Success'),
(477, '08:28:16.000000', '2024-07-16', 'Administrator', '', 'Logout Success'),
(478, '08:28:24.000000', '2024-07-16', 'Administrator', 'protechadmin2024***', 'Login Success'),
(479, '01:16:59.000000', '2024-07-17', 'Administrator', 'protechadmin2024***', 'Login Success'),
(480, '12:17:42.000000', '2024-07-19', 'Administrator', 'protechadmin2024***', 'Login Success'),
(481, '08:44:09.000000', '2024-07-18', 'Administrator', 'protechadmin2024***', 'Login Success'),
(482, '12:13:13.000000', '2024-07-23', 'Administrator', 'protechadmin2024***', 'Login Success'),
(483, '08:38:38.000000', '2024-07-23', 'Administrator', 'protechadmin2024***', 'Login Success'),
(484, '11:23:31.000000', '2024-07-23', 'Administrator', 'protechadmin2024***', 'Login Success'),
(485, '11:53:42.000000', '2024-07-23', 'Administrator', '', 'Logout Success'),
(486, '05:35:54.000000', '2024-07-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(487, '02:00:46.000000', '2024-07-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(488, '02:08:10.000000', '2024-07-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(489, '02:13:15.000000', '2024-07-26', 'Administrator', '', 'Logout Success'),
(490, '02:15:38.000000', '2024-07-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(491, '02:15:39.000000', '2024-07-26', 'Administrator', '', 'Logout Success'),
(492, '02:16:04.000000', '2024-07-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(493, '02:23:58.000000', '2024-07-26', 'Administrator', '', 'Logout Success'),
(494, '02:24:58.000000', '2024-07-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(495, '02:38:54.000000', '2024-07-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(496, '02:39:17.000000', '2024-07-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(497, '02:51:54.000000', '2024-07-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(498, '02:52:39.000000', '2024-07-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(499, '02:52:39.000000', '2024-07-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(500, '02:53:41.000000', '2024-07-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(501, '02:54:59.000000', '2024-07-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(502, '08:56:17.000000', '2024-09-05', 'Administrator', 'protechadmin2024*', 'Login Password Invalid'),
(503, '08:57:01.000000', '2024-09-05', 'Administrator', 'protechadmin2024*', 'Login Password Invalid'),
(504, '08:57:10.000000', '2024-09-05', 'Administrator', 'protechadmin2024***', 'Login Success'),
(505, '03:07:13.000000', '2024-09-05', 'Administrator', 'protechadmin2024*', 'Login Password Invalid'),
(506, '03:07:19.000000', '2024-09-05', 'Administrator', 'protechadmin2024***', 'Login Success'),
(507, '06:17:29.000000', '2024-09-16', 'Administrator', 'protechadmin2024***', 'Login Success'),
(508, '04:50:29.000000', '2024-09-17', 'Administrator', 'protechadmin2024***', 'Login Success'),
(509, '07:33:34.000000', '2024-09-17', 'Administrator', 'protechadmin2024***', 'Login Success'),
(510, '12:23:54.000000', '2024-09-18', 'Administrator', 'protechadmin2024***', 'Login Success'),
(511, '01:12:09.000000', '2024-09-18', 'Administrator', 'protechadmin2024***', 'Login Success'),
(512, '02:11:08.000000', '2024-09-18', 'Administrator', 'protechadmin2024***', 'Login Success'),
(513, '05:40:58.000000', '2024-09-18', 'Administrator', 'protechadmin2024***', 'Login Success'),
(514, '08:33:11.000000', '2024-09-18', 'Administrator', 'protechadmin2024***', 'Login Success'),
(515, '09:10:05.000000', '2024-09-19', 'Administrator', 'protechadmin2024***', 'Login Success'),
(516, '09:56:28.000000', '2024-09-19', 'Administrator', '', 'Logout Success'),
(517, '09:57:54.000000', '2024-09-19', 'Administrator', 'protechadmin2024***', 'Login Success'),
(518, '10:17:51.000000', '2024-09-19', 'Administrator', 'protechadmin2024***', 'Login Success'),
(519, '10:37:22.000000', '2024-09-19', 'Administrator', 'protechadmin2024***', 'Login Success'),
(520, '10:10:18.000000', '2024-09-20', 'Administrator', 'protechadmin2024***', 'Login Success'),
(521, '04:34:38.000000', '2024-09-20', 'Administrator', 'protechadmin2024***', 'Login Success'),
(522, '09:12:13.000000', '2024-09-23', 'Administrator', 'protechadmin2024***', 'Login Success'),
(523, '11:10:45.000000', '2024-09-23', 'Administrator', 'protechadmin2024***', 'Login Success'),
(524, '05:59:56.000000', '2024-09-23', 'Administrator', 'protechadmin2024***', 'Login Success'),
(525, '06:11:09.000000', '2024-09-23', 'Administrator', 'protechadmin2024***', 'Login Success'),
(526, '06:31:18.000000', '2024-09-23', 'Administrator', 'protechadmin2024***', 'Login Success'),
(527, '10:04:23.000000', '2024-09-24', 'Administrator', 'protechadmin2024***', 'Login Success');

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
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material_purchase`
--
ALTER TABLE `material_purchase`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `material_store_house`
--
ALTER TABLE `material_store_house`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
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
-- Indexes for table `stock_output_group`
--
ALTER TABLE `stock_output_group`
  ADD UNIQUE KEY `id` (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `acname`
--
ALTER TABLE `acname`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=398;

--
-- AUTO_INCREMENT for table `actualinvoice`
--
ALTER TABLE `actualinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `coldstore`
--
ALTER TABLE `coldstore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `container`
--
ALTER TABLE `container`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=862;

--
-- AUTO_INCREMENT for table `form7stock`
--
ALTER TABLE `form7stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form7stocktcl`
--
ALTER TABLE `form7stocktcl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form10stock`
--
ALTER TABLE `form10stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form10stocktcl`
--
ALTER TABLE `form10stocktcl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `general_ledger`
--
ALTER TABLE `general_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gfctotal`
--
ALTER TABLE `gfctotal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hhkmcstock`
--
ALTER TABLE `hhkmcstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hhkstock`
--
ALTER TABLE `hhkstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_costing`
--
ALTER TABLE `invoice_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1047;

--
-- AUTO_INCREMENT for table `labour`
--
ALTER TABLE `labour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `material_purchase`
--
ALTER TABLE `material_purchase`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `material_store_house`
--
ALTER TABLE `material_store_house`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packingliststockinfo`
--
ALTER TABLE `packingliststockinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packingmaterial`
--
ALTER TABLE `packingmaterial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payable`
--
ALTER TABLE `payable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `processing`
--
ALTER TABLE `processing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receivable`
--
ALTER TABLE `receivable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `repacking`
--
ALTER TABLE `repacking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- AUTO_INCREMENT for table `stock_output_group`
--
ALTER TABLE `stock_output_group`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `tclmcstock`
--
ALTER TABLE `tclmcstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `total_charges`
--
ALTER TABLE `total_charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `truckactualinvoice`
--
ALTER TABLE `truckactualinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `truckdeclare`
--
ALTER TABLE `truckdeclare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `truckfoambox`
--
ALTER TABLE `truckfoambox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `truckpackingliststock`
--
ALTER TABLE `truckpackingliststock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `truckpackingliststockinfo`
--
ALTER TABLE `truckpackingliststockinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `truckpackingmaterial`
--
ALTER TABLE `truckpackingmaterial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trucktotalcosting`
--
ALTER TABLE `trucktotalcosting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userlogs`
--
ALTER TABLE `userlogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=528;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
