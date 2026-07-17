-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2026 at 08:30 AM
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
(1, 'Administrator', 'protechadmin2024***', 'admin@gmail.com', 1),
(2, 'Ma Sandar Aung', '12341234', 'sandaraung@gmail.com', 1),
(3, 'Ma Soe Soe Khaing', 'stockstock', 'masoesoekhaing@gmail.com', 2),
(4, 'Lwin Mi Khaing', 'shippment', 'lwinmikhaing@gmail.com', 3),
(6, 'Lin Lin Naing', 'coldstore', 'linlinnaing@gmail.com', 5),
(7, 'Su Thiri Kyaw', 'su122333', 'suthirikyaw@gmail.com', 4),
(8, 'UMyoWinSwe', 'password', 'testing@gmail.com', 6);

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
(230, '5000/001', 36, 'Credit Sale-South Asia Food (USA) A/C'),
(231, '5000/002', 36, 'Credit Sale-Jamuna Food (Canada) A/C'),
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
(285, '4000/S10', 40, 'Shwe Myay'),
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
(385, '5000/003', 36, 'Credit Sale-SC Trader (TCL) A/C'),
(386, '9100/034', 39, 'Global Lucky Fish(Htun Nay Lin)'),
(387, '9100/035', 39, 'Rental Charges'),
(389, '4000/T18', 40, 'Tun Kyaw'),
(391, '3800/001', 35, 'USD Transit A/C'),
(393, '3400/001', 35, 'Temporary Loan'),
(394, '9100/036', 39, 'Discount Allowed A/C'),
(395, '6100/008', 37, 'Material Purchase'),
(397, '4000/099', 40, 'Tommy'),
(398, '4000/P03', 40, 'Carton Box (Pan Thazin)'),
(399, '4000/D04', 40, 'Dalian Ice'),
(400, '4000/G03', 40, 'Plastic (Golden Fish)'),
(401, '9100/037', 39, 'Factory Setup Expense'),
(402, '3300/006', 35, 'Bangladesh (Frozen)'),
(403, '3300/007', 35, 'Bangladesh (Chill/Technak)'),
(404, '3400/002', 35, 'Prepaid Link Mark Factory'),
(405, '3400/003', 35, 'Deposit Account'),
(406, '3400/004', 35, 'Prepaid Rental Expense'),
(407, '4000/K15', 40, 'Ko Ka Lar'),
(408, '4000/A14', 40, 'Ar Kar'),
(409, '5000/004', 36, 'Credit Sale-SC Trader (Frozen) A/C'),
(410, '5000/005', 36, 'Credit Sale-SC Trader (Fruit) A/C'),
(411, '5000/006', 36, 'Credit Sale-ITALY A/C'),
(412, '4000/W03', 40, 'Win Aye'),
(413, '4000/B02', 40, 'Bar Bu Lay (TCL)'),
(414, '4000/P04', 40, 'Promise (Inner Box)'),
(415, '7000/002', 38, 'General Income'),
(416, '3700/001', 35, 'TD Account (Can) '),
(417, '3400/005', 35, 'Temporary Loan-LM Global'),
(418, '3700/002', 35, 'UAB Bank (USD) A/C'),
(419, '3400/006', 35, 'Temporary Loan-ACE (Thai) A/C'),
(421, '3700/003', 35, 'UAB Bank (WPL) A/C'),
(422, '4000/K16', 40, 'Kyaw Min Lat'),
(423, '4000/K17', 40, 'Kyaw Lin Tun'),
(424, '4000/K18', 40, 'Kyi Lwin'),
(425, '9100/038', 39, ' Licence & Permits '),
(426, '9100/039', 39, ' Audit & Accountancy Fee '),
(427, '9100/040', 39, ' Taxation and Documentation  '),
(428, '9100/041', 39, 'BL Charges'),
(429, '9100/042', 39, ' IT Expenses-Internet '),
(430, '9100/043', 39, 'Staff Uniform'),
(431, '4000/G04', 40, 'Golden Bag'),
(432, '9100/044', 39, 'Hotel Charges'),
(433, '9100/045', 39, 'Cleaning Expense'),
(434, '4000/C03', 40, 'Chit Ko'),
(435, '4000/O01', 40, 'O.D.A'),
(436, '4000/T19', 40, 'Tin Hlaing'),
(437, '4000/K19', 40, 'Ko Min'),
(438, '4000/A15', 40, 'Aung Kyaw'),
(439, '4000/Z04', 40, 'Zaw Win Naing'),
(440, '4000/Z05', 40, 'Zay Yar Lin'),
(441, '4000/T20', 40, 'Thein Linn Oo'),
(442, '4000/S13', 40, 'Soe Min (TCL)'),
(443, '9100/046', 39, 'Advance Personal'),
(444, '4000/W04', 40, 'Carton Box (Win Pyae)'),
(445, '4000/K20', 40, 'Kyaw Min Latt (TCL)'),
(446, '4000/A16', 40, 'Aung Kyaw (TCL)'),
(447, '4000/T21', 40, 'Tin Hlaing (TCL)'),
(448, '4000/A17', 40, 'A Nge Lay'),
(449, '4000/A18', 40, 'A.K (TCL)'),
(450, '4000/Y02', 40, 'Ye Yint (TCL)'),
(451, '7000/003', 38, 'Discount Received'),
(452, '4000/Z06', 40, 'Zaw Win Naing (TCL)'),
(453, '6100/009', 37, 'China Plastic A/C '),
(455, '4000/P05', 40, 'Phoe Zaw'),
(456, '3600/003', 35, 'Transit Account'),
(457, '3200/001', 34, 'Computer, Printer & Projector'),
(458, '9100/047', 39, 'Staff Welfare '),
(459, '4000/M11', 40, 'Carton Box (May Kha San)'),
(460, '4000/A19', 40, 'Aye Aye Maw'),
(461, '4000/A20', 40, 'Aung Tun'),
(462, '4000/W05', 40, 'Win Thein'),
(463, '4000/T22', 40, 'Thet Paing (TCL)'),
(464, '4000/A21', 40, 'Aung Naing Oo (TCL)'),
(465, '4000/A22', 40, 'A Nge Lay (TCL)'),
(466, '4000/P06', 40, 'Phoe Zaw (TCL)'),
(467, '3200/002', 34, 'Furniture & Fittings'),
(468, '9100/048', 39, 'Entertainment Expense'),
(469, '4000/999', 40, 'Peter');

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
  `debit` text NOT NULL,
  `credit` text NOT NULL,
  `balance` text NOT NULL,
  `voucher_no` varchar(25) DEFAULT NULL,
  `crossac_name` varchar(25) DEFAULT NULL,
  `transactionid` int(11) NOT NULL,
  `interfacerowid` int(11) NOT NULL
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
  `mmk_amount` text NOT NULL,
  `usd_amount` text NOT NULL,
  `voucher_no` varchar(255) NOT NULL,
  `transactionid` int(11) NOT NULL
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
('3300/003', 'Jamuna Food-Canada A/C', 'CAN (Jamuna Food) Company Ltd', ''),
('3300/004', 'ITALY', '', ''),
('3300/005', 'Western Trader (Kolkata)', '', ''),
('3300/006', 'Bangladesh (Frozen)', '', ''),
('3300/007', 'Bangladesh (Chill/Technak)', '', '');

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
  `water_kg` int(11) NOT NULL,
  `fish_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `form7stock`
--

INSERT INTO `form7stock` (`id`, `date`, `item_id`, `supplier_name`, `country`, `type`, `size`, `viss`, `kg`, `pcspervr`, `pcsperf7`, `link_id`, `water_kg`, `fish_type`) VALUES
(2625, '2026-07-15', '1023', '4000/A10', 'NY', 'Frozen', '3up', '250', '408.5', '0', 89, 2724, 0, 'G'),
(2626, '2026-07-15', '1023', '4000/A10', 'NY', 'Frozen', '4up', '400', '653.6', '0', 79, 2725, 0, 'G'),
(2633, '2026-07-15', '1023', '4000/A10', 'NY', 'Frozen', '5up', '', '', '', 50, 2725, 0, 'G'),
(2634, '2026-07-15', '1023', '4000/A10', 'NY', 'Frozen', '6up', '', '', '', 30, 2725, 0, 'G'),
(2635, '2026-07-15', '1002', '4000/A10', NULL, 'Frozen', '2up', '500', '817', '0', 0, 2726, 0, '');

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

--
-- Dumping data for table `form7stocktcl`
--

INSERT INTO `form7stocktcl` (`id`, `date`, `item_id`, `supplier_name`, `country`, `type`, `size`, `viss`, `kg`, `pcspervr`, `pcsperf7`, `link_id`) VALUES
(121, '2026-07-16', '1002', '4000/A01', 'DAKA', 'TCl', '2up', '500', '817', '10', 5, 2727),
(122, '2026-07-16', '1015', '4000/A01', 'DAKA', 'TCl', '3up', '400', '653.6', '10', 10, 2728),
(123, '0000-00-00', '1002', '4000/A01', 'DAKA', 'TCl', '3up', '', '', '', 2, 2727),
(124, '0000-00-00', '1002', '4000/A01', 'DAKA', 'TCl', '4up', '', '', '', 3, 2727);

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
  `percentage` varchar(11) NOT NULL,
  `fish_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `form10stock`
--

INSERT INTO `form10stock` (`id`, `date`, `item_id`, `supplier_id`, `country`, `type`, `size`, `pcsform10`, `mc`, `kg`, `pcs`, `looseinkg`, `looseinpcs`, `looseoutkg`, `looseoutpcs`, `total_kg`, `percentage`, `fish_type`) VALUES
(110, '2026-07-16', '1001', '4000/001', 'NY', 'frozen', '2up', 0, 1, '5', 0, '', 0, '', 0, '5', '', 'G'),
(111, '2026-07-16', '1015', '4000/001', 'CAN', 'frozen', '3up', 0, 1, '9', 0, '', 0, '', 0, '9', '', 'G'),
(112, '2026-07-19', '1023', '4000/A10', 'NY', 'frozen', '3up', 89, 14, '327', 84, '23.1', 6, '4.1', 1, '346', '', 'G'),
(113, '2026-07-19', '1023', '4000/A10', 'NY', 'frozen', '4up', 79, 16, '379', 80, '18.8', 4, '22.9', 5, '374.9', '', 'G'),
(114, '2026-07-19', '1023', '4000/A10', 'NY', 'frozen', '5up', 20, 5, '114', 20, '', 0, '', 0, '114', '', 'G'),
(115, '2026-07-19', '1023', '4000/A10', 'NY', 'frozen', '6up', 1, 1, '19', 3, '', 0, '13.2', 2, '5.8', '', 'G'),
(116, '2026-07-19', '1023', '4000/A10', 'NY', 'frozen', '7up', 1, 0, '', 0, '7.7', 1, '', 0, '7.7', '', 'G'),
(117, '2026-07-19', '1023', '4000/A10', 'NY', 'frozen', '8up', 7, 2, '54', 6, '8.8', 1, '', 0, '62.8', '', 'G'),
(118, '2026-07-19', '1023', '4000/A10', 'NY', 'frozen', '10up', 2, 1, '21', 2, '', 0, '', 0, '21', '', 'G'),
(119, '2026-07-19', '1023', '4000/A10', 'NY', 'frozen', '12up', 4, 2, '49', 4, '', 0, '', 0, '49', '', 'G');

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

--
-- Dumping data for table `form10stocktcl`
--

INSERT INTO `form10stocktcl` (`id`, `date`, `item_id`, `supplier_id`, `country`, `type`, `size`, `pcsform10`, `mc`, `kg`, `pcs`, `looseinkg`, `looseinpcs`, `looseoutkg`, `looseoutpcs`, `cc_pcs`, `cc_kg`, `msl_pcs`, `msl_kg`, `hhk_pcs`, `hhk_kg`, `lanfish_pcs`, `lanfish_kg`, `cutpiece_pcs`, `cutpiece_kg`, `total_kg`, `percentage`) VALUES
(14, '2026-07-19', '1002', '', 'DAKA', 'TCL', '2up', 0, 5, '500', 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '500', '');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `general_ledger`
--

INSERT INTO `general_ledger` (`id`, `date`, `voucherno`, `ac_code`, `debit`, `credit`, `balance`, `narration`, `sr_no`, `container_no`, `bank_charges`, `acid`, `transactionid`) VALUES
(6078, '2026-07-01', '', '4000/001', '', '', '300000', 'OPENING AMOUNT FOR 4 Zaw', '', '', 0, 0, 0),
(6079, '2026-07-01', '', '4000/001', '', '', '300000', 'DESCRIPTION', '', '', 0, 0, 0),
(6080, '2026-07-01', '', '4000/A10', '', '', '100000', 'DESCRIPTION', '', '', 0, 0, 0);

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
  `fish_type` varchar(255) NOT NULL,
  `loosein_size` varchar(20) NOT NULL,
  `loosein_kg` varchar(20) NOT NULL,
  `loosein_pcs` varchar(20) NOT NULL,
  `looseout_size` varchar(20) NOT NULL,
  `looseout_kg` varchar(20) NOT NULL,
  `looseout_pcs` varchar(20) NOT NULL,
  `remark` text NOT NULL,
  `hhk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gfcmcstock`
--

INSERT INTO `gfcmcstock` (`id`, `country`, `particular`, `date`, `commondity_id`, `size`, `kg`, `mc`, `balance_mc`, `fish_type`, `loosein_size`, `loosein_kg`, `loosein_pcs`, `looseout_size`, `looseout_kg`, `looseout_pcs`, `remark`, `hhk_id`) VALUES
(2, 'Can', 'Balance', '2024-10-04', '1031', '1.5up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(3, 'Can', 'Balance', '2024-10-04', '1031', '1.5up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(4, 'Can', 'Balance', '2024-10-04', '1031', '2up', '20', 211, 211, 'G', '', '', '', '', '', '', '', 0),
(5, 'Can', 'Balance', '2024-10-04', '1031', '2up', '21', 73, 73, 'G', '', '', '', '', '', '', '', 0),
(6, 'Can', 'Balance', '2024-10-04', '1031', '3up', '20', 51, 51, 'G', '', '', '', '', '', '', '', 0),
(7, 'Can', 'Balance', '2024-10-04', '1031', '3up', '21', 85, 85, 'G', '', '', '', '', '', '', '', 0),
(8, 'Can', 'Balance', '2024-10-04', '1031', '3up', '22', 53, 53, 'G', '', '', '', '', '', '', '', 0),
(9, 'Can', 'Balance', '2024-10-04', '1031', '3up', '23', 11, 11, 'G', '', '', '', '', '', '', '', 0),
(10, 'Can', 'Balance', '2024-10-04', '1031', '3up', '24', 9, 9, 'G', '', '', '', '', '', '', '', 0),
(11, 'Can', 'Balance', '2024-10-04', '1031', '3up', '19', 19, 19, 'G', '', '', '', '', '', '', '', 0),
(12, 'Can', 'Balance', '2024-10-04', '1031', '4up', '20', 20, 20, 'G', '', '', '', '', '', '', '', 0),
(13, 'Can', 'Balance', '2024-10-04', '1031', '4up', '21', 12, 12, 'G', '', '', '', '', '', '', '', 0),
(14, 'Can', 'Balance', '2024-10-04', '1031', '4up', '22', 114, 114, 'G', '', '', '', '', '', '', '', 0),
(15, 'can', 'Balance', '2024-10-04', '1031', '4up', '23', 194, 194, 'G', '', '', '', '', '', '', '', 0),
(16, 'can', 'Balance', '2024-10-04', '1031', '4up', '24', 107, 107, 'G', '', '', '', '', '', '', '', 0),
(17, 'can', 'Balance', '2024-10-04', '1031', '5up', '22', 111, 111, 'G', '', '', '', '', '', '', '', 0),
(18, 'can', 'Balance', '2024-10-04', '1031', '5up', '23', 172, 172, 'G', '', '', '', '', '', '', '', 0),
(19, 'can', 'Balance', '2024-10-04', '1031', '5up', '24', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(20, 'can', 'Balance', '2024-10-04', '1031', '6up', '19', 23, 23, 'G', '', '', '', '', '', '', '', 0),
(21, 'can', 'Balance', '2024-10-04', '1031', '6up', '20', 99, 99, 'G', '', '', '', '', '', '', '', 0),
(22, 'can', 'Balance', '2024-10-04', '1031', '6up', '21', 6, 6, 'G', '', '', '', '', '', '', '', 0),
(23, 'can', 'Balance', '2024-10-04', '1031', '7up', '22', 8, 8, 'G', '', '', '', '', '', '', '', 0),
(24, 'can', 'Balance', '2024-10-04', '1031', '7up', '23', 25, 25, 'G', '', '', '', '', '', '', '', 0),
(25, 'can', 'Balance', '2024-10-04', '1031', '7up', '26', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(26, 'can', 'Balance', '2024-10-04', '1031', '8up', '25', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(27, 'can', 'Balance', '2024-10-04', '1031', '8up', '26', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(28, 'can', 'Balance', '2024-10-04', '1023', '2up', '20', 75, 75, 'G', '', '', '', '', '', '', '', 0),
(29, 'can', 'Balance', '2024-10-04', '1023', '2up', '21', 19, 19, 'G', '', '', '', '', '', '', '', 0),
(30, 'Can', 'Balance', '2024-10-04', '1023', '3up', '20', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(31, 'Can', 'Balance', '2024-10-04', '1023', '3up', '21', 18, 18, 'G', '', '', '', '', '', '', '', 0),
(32, 'Can', 'Balance', '2024-10-04', '1023', '3up', '22', 29, 29, 'G', '', '', '', '', '', '', '', 0),
(33, 'Can', 'Balance', '2024-10-04', '1023', '3up', '23', 9, 9, 'G', '', '', '', '', '', '', '', 0),
(34, 'Can', 'Balance', '2024-10-04', '1023', '4up', '20', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(35, 'Can', 'Balance', '2024-10-04', '1023', '4up', '21', 8, 8, 'G', '', '', '', '', '', '', '', 0),
(36, 'Can', 'Balance', '2024-10-04', '1023', '4up', '22', 41, 41, 'G', '', '', '', '', '', '', '', 0),
(37, 'Can', 'Balance', '2024-10-04', '1023', '4up', '23', 186, 186, 'G', '', '', '', '', '', '', '', 0),
(38, 'Can', 'Balance', '2024-10-04', '1023', '4up', '24', 80, 80, 'G', '', '', '', '', '', '', '', 0),
(39, 'can', 'Balance', '2024-10-04', '1023', '', '', 0, 0, 'G', '', '', '', '', '', '', '', 0),
(40, 'Can', 'Balance', '2024-10-04', '1023', '4up', '23.5', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(41, 'Can', 'Balance', '2024-10-04', '1023', '5up', '21', 13, 13, 'G', '', '', '', '', '', '', '', 0),
(42, 'Can', 'Balance', '2024-10-04', '1023', '5up', '22', 30, 30, 'G', '', '', '', '', '', '', '', 0),
(43, 'Can', 'Balance', '2024-10-04', '1023', '5up', '23', 6, 6, 'G', '', '', '', '', '', '', '', 0),
(44, 'Can', 'Balance', '2024-10-04', '1023', '6up', '19', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(45, 'Can', 'Balance', '2024-10-04', '1023', '6up', '20', 5, 5, 'G', '', '', '', '', '', '', '', 0),
(46, 'Can', 'Balance', '2024-10-04', '1023', '6up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(47, 'Can', 'Balance', '2024-10-04', '1023', '7up', '22', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(48, 'Can', 'Balance', '2024-10-04', '1023', '7up', '22.5', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(49, 'Can', 'Balance', '2024-10-04', '1017', '3up', '22', 20, 20, 'G', '', '', '', '', '', '', '', 0),
(50, 'Can', 'Balance', '2024-10-04', '1017', '3up', '21', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(51, 'Can', 'Balance', '2024-10-04', '1017', '4up', '22', 23, 23, 'G', '', '', '', '', '', '', '', 0),
(52, 'Can', 'Balance', '2024-10-04', '1017', '4up', '23', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(53, 'Can', 'Balance', '2024-10-04', '1017', '4up', '24', 10, 10, 'G', '', '', '', '', '', '', '', 0),
(54, 'Can', 'Balance', '2024-10-04', '1017', '4up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(55, 'Can', 'Balance', '2024-10-04', '1017', '4up', '21', 6, 6, 'G', '', '', '', '', '', '', '', 0),
(56, 'Can', 'Balance', '2024-10-04', '1017', '5up', '22', 9, 9, 'G', '', '', '', '', '', '', '', 0),
(57, 'Can', 'Balance', '2024-10-04', '1017', '5up', '23', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(58, 'Can', 'Balance', '2024-10-04', '1017', '5up', '21', 5, 5, 'G', '', '', '', '', '', '', '', 0),
(59, 'Can', 'Balance', '2024-10-04', '1017', '6up', '19', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(60, 'Can', 'Balance', '2024-10-04', '1017', '6up', '20', 5, 5, 'G', '', '', '', '', '', '', '', 0),
(61, 'Can', 'Balance', '2024-10-04', '1017', '2up', '20', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(62, 'Can', 'Balance', '2024-10-03', '1020', '2up', '20', 30, 30, 'G', '', '', '', '', '', '', '', 0),
(63, 'Can', 'Balance', '2024-10-03', '1020', '2up', '21', 8, 8, 'G', '', '', '', '', '', '', '', 0),
(64, 'Can', 'Balance', '2024-10-03', '1020', '3up', '21', 23, 23, 'G', '', '', '', '', '', '', '', 0),
(65, 'Can', 'Balance', '2024-10-03', '1020', '3up', '22', 20, 20, 'G', '', '', '', '', '', '', '', 0),
(66, 'Can', 'Balance', '2024-10-03', '1020', '3up', '23', 7, 7, 'G', '', '', '', '', '', '', '', 0),
(67, 'Can', 'Balance', '2024-10-03', '1020', '4up', '22', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(68, 'Can', 'Balance', '2024-10-03', '1020', '4up', '23', 15, 15, 'G', '', '', '', '', '', '', '', 0),
(69, 'Can', 'Balance', '2024-10-03', '1020', '4up', '24', 5, 5, 'G', '', '', '', '', '', '', '', 0),
(70, 'Can', 'Balance', '2024-10-03', '1020', '4up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(71, 'Can', 'Balance', '2024-10-03', '1020', '5up', '22', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(72, 'Can', 'Balance', '2024-10-03', '1020', '5up', '23', 11, 11, 'G', '', '', '', '', '', '', '', 0),
(73, 'Can', 'Balance', '2024-10-03', '1020', '5up', '24', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(74, 'Can', 'Balance', '2024-10-03', '1020', '5up', '23.5', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(75, 'Can', 'Balance', '2024-10-03', '1020', '6up', '19', 5, 5, 'G', '', '', '', '', '', '', '', 0),
(76, 'Can', 'Balance', '2024-10-03', '1020', '6up', '20', 9, 9, 'G', '', '', '', '', '', '', '', 0),
(77, 'Can', 'Balance', '2024-10-03', '1020', '6up', '21', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(78, 'Can', 'Balance', '2024-10-03', '1020', '7up', '22', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(79, 'Can', 'Balance', '2024-10-03', '1020', '7up', '23', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(80, 'Can', 'Balance', '2024-10-03', '1020', '7up', '22.5', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(81, 'Can', 'Balance', '2024-10-03', '1020', '8up', '25', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(82, 'Can', 'Balance', '2024-10-03', '1020', '8up', '26', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(83, 'Can', 'Balance', '2024-10-03', '1020', '9up', '20', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(84, 'Can', 'Balance', '2024-10-03', '1020', '10up', '23', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(85, 'Can', 'Balance', '2024-10-04', '1027', '3up', '21', 3, 3, 'egg', '', '', '', '', '', '', '', 0),
(86, 'Can', 'Balance', '2024-10-04', '1027', '3up', '22', 1, 1, 'egg', '', '', '', '', '', '', '', 0),
(87, 'Can', 'Balance', '2024-10-04', '1027', '5up', '23', 1, 1, 'egg', '', '', '', '', '', '', '', 0),
(88, 'Can', 'Balance', '2024-10-04', '1002', '1up', '20', 5, 5, 'G', '', '', '', '', '', '', '', 0),
(89, 'Can', 'Balance', '2024-10-04', '1001', '1up', '20', 38, 38, 'G', '', '', '', '', '', '', '', 0),
(90, 'Can', 'Balance', '2024-10-04', '1001', '800', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(91, 'NY', 'Balance', '2024-08-01', '1027', '3up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(92, 'NY', 'Balance', '2024-08-01', '1027', '3up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(93, 'NY', 'Balance', '2024-08-01', '1027', '4up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(94, 'NY', 'Balance', '2024-08-01', '1027', '4up', '22', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(95, 'NY', 'Balance', '2024-08-01', '1027', '4up', '23', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(96, 'NY', 'Balance', '2024-09-25', '1020', '2up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(97, 'NY', 'Balance', '2024-09-25', '1020', '2up', '21', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(98, 'NY', 'Balance', '2024-09-25', '1020', '3up', '21', 8, 8, 'G', '', '', '', '', '', '', '', 0),
(99, 'NY', 'Balance', '2024-09-25', '1020', '3up', '22', 10, 10, 'G', '', '', '', '', '', '', '', 0),
(100, 'NY', 'Balance', '2024-09-25', '1020', '5up', '22', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(101, 'NY', 'Balance', '2024-09-25', '1020', '5up', '23', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(102, 'NY', 'Balance', '2024-09-25', '1020', '6up', '20', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(103, 'NY', 'Balance', '2024-09-25', '1020', '6up', '19', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(104, 'NY', 'Balance', '2024-09-25', '1020', '6up', '20.5', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(105, 'NY', 'Balance', '2024-09-25', '1020', '7up', '22', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(106, 'NY', 'Balance', '2024-09-25', '1020', '4up', '23', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(107, 'NY', 'Balance', '2024-09-25', '1020', '4up', '24', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(108, 'NY', 'Balance', '2024-09-25', '1020', '12up', '13', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(109, 'NY', 'Balance', '2024-09-25', '1026', '1up', '20', 3, 3, 'W', '', '', '', '', '', '', '', 0),
(110, 'NY', 'Balance', '2024-09-25', '1026', '1up', '18.5', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(111, 'NY', 'Balance', '2024-09-25', '1026', '1.5up', '20', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(112, 'NY', 'Balance', '2024-10-04', '1017', '3up', '23', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(113, 'NY', 'Balance', '2024-10-04', '1017', '4up', '20', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(114, 'NY', 'Balance', '2024-10-04', '1017', '4up', '22', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(115, 'NY', 'Balance', '2024-10-04', '1017', '4up', '23', 36, 36, 'G', '', '', '', '', '', '', '', 0),
(116, 'NY', 'Balance', '2024-10-04', '1017', '4up', '24', 53, 53, 'G', '', '', '', '', '', '', '', 0),
(117, 'NY', 'Balance', '2024-10-04', '1017', '5up', '22', 61, 61, 'G', '', '', '', '', '', '', '', 0),
(118, 'NY', 'Balance', '2024-10-04', '1017', '5up', '23', 114, 114, 'G', '', '', '', '', '', '', '', 0),
(119, 'NY', 'Balance', '2024-10-04', '1017', '5up', '21', 7, 7, 'G', '', '', '', '', '', '', '', 0),
(120, 'NY', 'Balance', '2024-10-04', '1017', '5up', '24', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(121, 'NY', 'Balance', '2024-10-04', '1017', '6up', '19', 7, 7, 'G', '', '', '', '', '', '', '', 0),
(122, 'NY', 'Balance', '2024-10-04', '1017', '6up', '20', 27, 27, 'G', '', '', '', '', '', '', '', 0),
(123, 'NY', 'Balance', '2024-10-04', '1017', '6up', '21', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(124, 'NY', 'Balance', '2024-10-04', '1017', '7up', '22', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(125, 'NY', 'Balance', '2024-10-04', '1017', '7up', '23', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(126, 'NY', 'Balance', '2024-10-04', '1017', '1.5up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(127, 'NY', 'Balance', '2024-10-04', '1017', '1.5up', '21', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(128, 'NY', 'Balance', '2024-10-04', '1017', '19up', '19', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(129, 'NY', 'Balance', '2024-08-20', '1021', '2up', '20', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(130, 'NY', 'Balance', '2024-08-20', '1021', '4up', '23', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(131, 'NY', 'Balance', '2024-09-30', '1010', '500G x12Bls', '6', 18, 18, 'G', '', '', '', '', '', '', '', 0),
(132, 'NY', 'Balance', '2024-08-23', '1034', '500G x12Bls', '6', 7, 7, 'G', '', '', '', '', '', '', '', 0),
(133, 'NY', 'Balance', '2024-10-03', '1023', '2up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(134, 'NY', 'Balance', '2024-10-03', '1023', '3up', '20', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(135, 'NY', 'Balance', '2024-10-03', '1023', '3up', '21', 50, 50, 'G', '', '', '', '', '', '', '', 0),
(136, 'NY', 'Balance', '2024-10-03', '1023', '3up', '22', 118, 118, 'G', '', '', '', '', '', '', '', 0),
(137, 'NY', 'Balance', '2024-10-03', '1023', '3up', '23', 14, 14, 'G', '', '', '', '', '', '', '', 0),
(138, 'NY', 'Balance', '2024-10-03', '1023', '4up', '20', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(139, 'NY', 'Balance', '2024-10-03', '1023', '4up', '21', 16, 16, 'G', '', '', '', '', '', '', '', 0),
(140, 'NY', 'Balance', '2024-10-03', '1023', '4up', '22', 39, 39, 'G', '', '', '', '', '', '', '', 0),
(141, 'NY', 'Balance', '2024-10-03', '1023', '4up', '23', 43, 43, 'G', '', '', '', '', '', '', '', 0),
(142, 'NY', 'Balance', '2024-10-03', '1023', '4up', '24', 66, 66, 'G', '', '', '', '', '', '', '', 0),
(143, 'NY', 'Balance', '2024-10-03', '1023', '4up', '19', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(144, 'NY', 'Balance', '2024-10-03', '1023', '5up', '22', 19, 19, 'G', '', '', '', '', '', '', '', 0),
(145, 'NY', 'Balance', '2024-10-03', '1023', '5up', '23', 14, 14, 'G', '', '', '', '', '', '', '', 0),
(146, 'NY', 'Balance', '2024-10-03', '1023', '5up', '24', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(147, 'LM', 'Balance', '2024-09-30', '1031', '3up', '22', 1, 52, 'G', '', '', '', '', '', '', '', 0),
(148, 'LM', 'Balance', '2024-09-30', '1031', '4up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(149, 'LM', 'Balance', '2024-09-30', '1031', '4up', '22', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(150, 'LM', 'Balance', '2024-09-30', '1031', '4up', '23', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(151, 'LM', 'Balance', '2024-09-30', '1031', '4up', '24', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(152, 'LM', 'Balance', '2024-09-30', '1031', '5up', '21', 9, 9, 'G', '', '', '', '', '', '', '', 0),
(153, 'LM', 'Balance', '2024-09-30', '1031', '5up', '22', 16, 16, 'G', '', '', '', '', '', '', '', 0),
(154, 'LM', 'Balance', '2024-09-30', '1031', '5up', '23', 5, 5, 'G', '', '', '', '', '', '', '', 0),
(155, 'NY', 'Balance', '2024-10-04', '1031', '1.5up', '20', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(156, 'NY', 'Balance', '2024-10-04', '1031', '1.5up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(157, 'NY', 'Balance', '2024-10-04', '1031', '2up', '20', 100, 100, 'G', '', '', '', '', '', '', '', 0),
(158, 'NY', 'Balance', '2024-10-04', '1031', '2up', '21', 31, 31, 'G', '', '', '', '', '', '', '', 0),
(159, 'NY', 'Balance', '2024-10-04', '1031', '3up', '17.5', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(160, 'NY', 'Balance', '2024-10-04', '1031', '3up', '20', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(161, 'NY', 'Balance', '2024-10-04', '1031', '3up', '21', 64, 21, 'G', '', '', '', '', '', '', '', 0),
(162, 'NY', 'Balance', '2024-10-04', '1031', '3up', '22', 26, 26, 'G', '', '', '', '', '', '', '', 0),
(163, 'NY', 'Balance', '2024-10-04', '1031', '4up', '17.5', 0, 0, 'G', '', '', '', '', '', '', '', 0),
(164, 'NY', 'Balance', '2024-10-04', '1031', '4up', '20', 9, 9, 'G', '', '', '', '', '', '', '', 0),
(165, 'NY', 'Balance', '2024-10-04', '1031', '4up', '21', 7, 7, 'G', '', '', '', '', '', '', '', 0),
(166, 'NY', 'Balance', '2024-10-04', '1031', '4up', '22', 29, 29, 'G', '', '', '', '', '', '', '', 0),
(167, 'NY', 'Balance', '2024-10-04', '1031', '4up', '23', 244, -241, 'G', '', '', '', '', '', '', '', 0),
(168, 'NY', 'Balance', '2024-10-04', '1031', '4up', '24', 78, 78, 'G', '', '', '', '', '', '', '', 0),
(169, 'NY', 'Balance', '2024-10-04', '1031', '5up', '21', 3, 6, 'G', '', '', '', '', '', '', '', 0),
(170, 'NY', 'Balance', '2024-10-04', '1031', '5up', '22', 23, 23, 'G', '', '', '', '', '', '', '', 0),
(171, 'NY', 'Balance', '2024-10-04', '1031', '5up', '23', 16, 16, 'G', '', '', '', '', '', '', '', 0),
(172, 'NY', 'Balance', '2024-10-04', '1031', '5up', '24', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(173, 'NY', 'Balance', '2024-10-04', '1031', '6up', '19', 11, 11, 'G', '', '', '', '', '', '', '', 0),
(174, 'NY', 'Balance', '2024-10-04', '1031', '6up', '20', 7, 7, 'G', '', '', '', '', '', '', '', 0),
(175, 'NY', 'Balance', '2024-10-04', '1031', '7up', '23', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(176, 'NY', 'Balance', '2024-10-04', '1031', '8up', '25.5', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(177, 'NY', 'Balance', '2024-10-04', '1031', '7up', '24', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(178, 'can', 'HHK To GFC', '2024-10-08', '1002', '1up', '20', 2, 7, '', '', '', '', '', '', '', '', 129),
(179, 'can', 'HHK To GFC', '2024-10-08', '1002', '1.5up', '20', 1, 1, '', '', '', '', '', '', '', '', 130),
(180, 'can', 'HHK To GFC', '2024-10-08', '1002', '2up', '20', 6, 6, '', '', '', '', '', '', '', '', 131),
(183, 'can', 'HHK To GFC', '2024-10-08', '1002', '4up', '20', 1, 1, '', '', '', '', '', '', '', '', 134),
(184, 'can', 'HHK To GFC', '2024-10-08', '1002', '4up', '23', 2, 2, '', '', '', '', '', '', '', '', 135),
(185, 'can', 'HHK To GFC', '2024-10-08', '1002', '5up', '22', 3, 3, 'G', '', '', '', '', '', '', '', 136),
(186, 'can', 'HHK To GFC', '2024-10-08', '1002', '6up', '20', 1, 1, '', '', '', '', '', '', '', '', 137),
(187, 'can', 'HHK To GFC', '2024-10-08', '1002', '7up', '24', 1, 1, '', '', '', '', '', '', '', '', 138),
(188, 'NY', 'Balance', '2024-09-25', '1031', '1kgx15pks', '15', 7, 7, 'Cut_piece', '', '', '', '', '', '', '', 0),
(189, 'NY', 'Repacking in', '2024-10-08', '1037', '150/200', '20', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(190, 'NY', 'Repacking in', '2024-10-08', '1037', '200/300', '20', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(191, 'NY', 'Balance', '2024-08-03', '1036', '80/100', '20', 2, 2, 'W', '', '', '', '', '', '', '', 0),
(192, 'NY', 'Balance', '2024-08-03', '1036', '2up', '21', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(193, 'NY', 'Balance', '2024-10-03', '1023', '6up', '19', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(194, 'NY', 'Balance', '2024-10-03', '1023', '6up', '20', 11, 11, 'G', '', '', '', '', '', '', '', 0),
(195, 'NY', 'Balance', '2024-10-04', '1023', '6up', '21', 7, 7, 'G', '', '', '', '', '', '', '', 0),
(196, 'NY', 'Balance', '2024-10-03', '1023', '7up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(197, 'NY', 'Balance', '2024-10-03', '1023', '7up', '23', 6, 6, 'G', '', '', '', '', '', '', '', 0),
(198, 'NY', 'Balance', '2024-10-03', '1023', '7up', '24', 9, 9, 'G', '', '', '', '', '', '', '', 0),
(199, 'NY', 'Balance', '2024-10-03', '1023', '7up', '21.6', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(200, 'NY', 'Balance', '2024-10-03', '1023', '8up', '25', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(201, 'NY', 'Balance', '2024-10-03', '1023', '8up', '26', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(202, 'NY', 'Balance', '2024-10-03', '1023', '8up', '27', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(203, 'NY', 'Balance', '2024-10-03', '1023', '9up', '19.5', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(204, 'NY', 'Balance', '2024-10-03', '1023', '9up', '20', 6, 6, 'G', '', '', '', '', '', '', '', 0),
(205, 'NY', 'Balance', '2024-10-03', '1023', '9up', '19', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(206, 'NY', 'Balance', '2024-10-03', '1023', '10up', '21.5', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(207, 'NY', 'Balance', '2024-10-03', '1023', '10up', '22', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(208, 'NY', 'Balance', '2024-10-03', '1023', '10up', '23', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(209, 'NY', 'Balance', '2024-10-03', '1023', '12up', '25', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(210, 'Can', 'Balance', '2024-08-23', '1035', '500G x12Bls', '6', 39, 39, 'G', '', '', '', '', '', '', '', 0),
(211, 'Can', 'Balance', '2024-09-12', '1005', '250G x12Bls', '6', 6, 6, 'G', '', '', '', '', '', '', '', 0),
(212, 'Can', 'Balance', '2024-08-02', '1010', '500G x12Bls', '6', 123, 123, 'G', '', '', '', '', '', '', '', 0),
(213, 'Can', 'Balance', '2024-10-04', '1019', '500G x12Bls', '6', 7, 7, 'G', '', '', '', '', '', '', '', 0),
(214, 'can', 'Balance', '2024-10-04', '1030', '800g', '20', 16, 16, 'G', '', '', '', '', '', '', '', 0),
(215, 'can', 'Balance', '2024-10-04', '1030', '1up', '20', 9, 9, 'G', '', '', '', '', '', '', '', 0),
(216, 'Can', 'Balance', '2024-10-04', '1030', '1.5up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(217, 'Can', 'Balance', '2024-10-04', '1030', '2up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(218, 'can', 'Balance', '2024-10-04', '1031', '3up', '20', 30, -27, 'Scaless', '', '', '', '', '', '', '', 0),
(219, 'can', 'Balance', '2024-10-04', '1031', '3up', '21', 76, -55, 'Scaless', '', '', '', '', '', '', '', 0),
(220, 'can', 'Balance', '2024-10-04', '1001', '3up', '23', 0, 0, 'G', '', '', '', '', '', '', '', 0),
(221, 'can', 'Balance', '2024-10-04', '1031', '3up', '22', 33, -7, 'Scaless', '', '', '', '', '', '', '', 0),
(222, 'can', 'Balance', '2024-10-04', '1031', '3up', '19', 1, 18, 'Scaless', '', '', '', '', '', '', '', 0),
(223, 'Can', 'Balance', '2024-09-13', '1031', '250g x24bls', '6', 23, 23, 'egg', '', '', '', '', '', '', '', 0),
(224, 'Can', 'Balance', '2024-10-04', '1004', '500g x12bls', '6', 72, 72, 'G', '', '', '', '', '', '', '', 0),
(225, 'Can', 'Balance', '2024-08-22', '1036', '8/10', '20', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(226, 'Can', 'Balance', '2024-08-22', '1036', '1up', '20', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(227, 'Can', 'Balance', '2024-08-22', '1036', '1.5up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(228, 'LM', 'Balance', '2024-08-02', '1031', '3up', '20', 9, -36, 'W', '', '', '', '', '', '', '', 0),
(229, 'LM', 'Balance', '2024-08-02', '1031', '3up', '21', 7, -62, 'W', '', '', '', '', '', '', '', 0),
(230, 'LM', 'Balance', '2024-08-02', '1031', '3up', '22', 1, -8, 'W', '', '', '', '', '', '', '', 0),
(231, 'LM', 'Balance', '2024-08-02', '1031', '4up', '22', 1, 3, 'W', '', '', '', '', '', '', '', 0),
(232, 'LM', 'Balance', '2024-08-02', '1031', '4up', '24', 1, 2, 'W', '', '', '', '', '', '', '', 0),
(233, 'LM', 'Balance', '2024-08-02', '1031', '5up', '22', 1, 17, 'W', '', '', '', '', '', '', '', 0),
(234, 'LM', 'Balance', '2024-09-13', '1023', '2up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(235, 'LM', 'Balance', '2024-09-13', '1023', '5up', '22', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(236, 'LM', 'Balance', '2024-08-02', '1028', 'JB', '20', 74, 74, 'W', '', '', '', '', '', '', '', 0),
(237, 'LM', 'Balance', '2024-08-02', '1028', 'JB', '23.6', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(238, 'LM', 'Balance', '2024-08-02', '1028', 'JB', '19.6', 3, 3, 'W', '', '', '', '', '', '', '', 0),
(239, 'LM', 'Balance', '2024-08-02', '1028', 'JB', '11.8', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(240, 'LM', 'Balance', '2024-08-02', '1028', 'JB', '7.5', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(241, 'LM', 'Balance', '2024-08-02', '1028', 'JB', '19', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(242, 'LM', 'Balance', '2024-08-02', '1028', 'JB', '19.5', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(243, 'LM', 'Balance', '2024-08-02', '1028', 'JB', '19.3', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(244, 'LM', 'Balance', '2024-08-02', '1028', 'JB', '19.8', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(245, 'LM', 'Balance', '2024-08-02', '1028', 'JB', '19.4', 5, 5, 'W', '', '', '', '', '', '', '', 0),
(246, 'LM', 'Balance', '2024-08-02', '1028', 'JB', '19.7', 3, 3, 'W', '', '', '', '', '', '', '', 0),
(247, 'LM', 'Balance', '2024-08-02', '1028', 'JB', '16.8', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(248, 'LM', 'Balance', '2024-08-29', '1010', '500gx24bls', '12', 45, 45, 'W', '', '', '', '', '', '', '', 0),
(249, 'LM', 'Balance', '2024-08-29', '1010', '250gx50bls', '12.5', 6, 6, 'W', '', '', '', '', '', '', '', 0),
(250, 'LM', 'Balance', '2024-09-12', '1031', 'J', '20', 7, 7, 'egg', '', '', '', '', '', '', '', 0),
(251, 'LM', 'Balance', '2024-09-12', '1031', '250G x44bls', '11', 2, 2, 'egg', '', '', '', '', '', '', '', 0),
(252, 'LM', 'Balance', '2024-09-12', '1031', '250G x40bls', '10', 20, 20, 'egg', '', '', '', '', '', '', '', 0),
(253, 'LM', 'Balance', '2024-10-04', '1019', '500G x24bls', '12', 21, 21, 'egg', '', '', '', '', '', '', '', 0),
(254, 'LM', 'Balance', '2024-10-04', '1019', '500G x12bls', '6', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(255, 'LM', 'Balance', '2024-10-04', '1019', 'IQf', '20', 41, 41, 'G', '', '', '', '', '', '', '', 0),
(256, 'LM', 'Balance', '2024-09-25', '1005', '250G x48bls', '12', 23, 23, 'G', '', '', '', '', '', '', '', 0),
(257, 'LM', 'Balance', '2024-09-25', '1005', '250G x46bls', '11.5', 6, 6, 'G', '', '', '', '', '', '', '', 0),
(258, 'LM', 'Balance', '2024-09-25', '1005', '250G x42bls', '10.5', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(259, 'LM', 'Balance', '2024-10-04', '1027', '3/5', '20', 35, 35, 'W', '', '', '', '', '', '', '', 0),
(260, 'LM', 'Balance', '2024-10-04', '1027', '5/8', '20', 31, 31, 'W', '', '', '', '', '', '', '', 0),
(261, 'LM', 'Balance', '2024-10-04', '1027', '8/10', '20', 5, 5, 'W', '', '', '', '', '', '', '', 0),
(262, 'LM', 'Balance', '2024-10-04', '1027', '1up', '20', 19, 19, 'W', '', '', '', '', '', '', '', 0),
(263, 'LM', 'Balance', '2024-10-04', '1027', '1.5up', '20', 21, 21, 'W', '', '', '', '', '', '', '', 0),
(264, 'LM', 'Balance', '2024-10-04', '1027', '1.5up', '21', 7, 7, 'W', '', '', '', '', '', '', '', 0),
(265, 'LM', 'Balance', '2024-10-04', '1027', '2up', '20', 39, 39, 'W', '', '', '', '', '', '', '', 0),
(266, 'LM', 'Balance', '2024-10-04', '1027', '2up', '21', 8, 8, 'W', '', '', '', '', '', '', '', 0),
(267, 'LM', 'Balance', '2024-10-04', '1027', 'IQF', '15', 4, 4, 'W', '', '', '', '', '', '', '', 0),
(268, 'LM', 'Balance', '2024-10-04', '1027', '3up', '21', 6, 6, 'W', '', '', '', '', '', '', '', 0),
(269, 'LM', 'Balance', '2024-10-04', '1027', '3up', '22', 4, 4, 'W', '', '', '', '', '', '', '', 0),
(270, 'LM', 'Balance', '2024-10-04', '1027', '3up', '20', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(271, 'LM', 'Balance', '2024-10-04', '1027', '4up', '22.6', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(272, 'LM', 'Balance', '2024-10-04', '1027', '4up', '22', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(273, 'LM', 'Balance', '2024-09-16', '1025', 'IQF', '20', 47, 47, 'W', '', '', '', '', '', '', '', 0),
(274, 'LM', 'Balance', '2024-09-16', '1025', 'IQF', '15', 3, 3, 'W', '', '', '', '', '', '', '', 0),
(275, 'LM', 'Balance', '2024-09-19', '1026', '8/10', '20', 48, 48, 'W', '', '', '', '', '', '', '', 0),
(276, 'LM', 'Balance', '2024-09-19', '1026', '5/8', '20', 22, 22, 'W', '', '', '', '', '', '', '', 0),
(277, 'LM', 'Balance', '2024-09-10', '1035', '250 G x48Bl', '12', 4, 4, 'W', '', '', '', '', '', '', '', 0),
(278, 'LM', 'Balance', '2024-09-10', '1035', '250 G', '10.5', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(279, 'LM', 'Balance', '2024-10-04', '1004', 'IQF', '15', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(280, 'LM', 'Balance', '2024-10-04', '1004', 'IQF', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(281, 'LM', 'Balance', '2024-10-04', '1004', 'IQF', '15', 2, 3, 'G', '', '', '', '', '', '', '', 0),
(282, 'LM', 'Balance', '2024-10-04', '1004', 'IQF', '19', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(283, 'LM', 'Balance', '2024-10-04', '1004', 'IQF', '19', 1, 2, 'W', '', '', '', '', '', '', '', 0),
(284, 'LM', 'Balance', '2024-10-04', '1004', 'IQF', '20', 4, 5, 'W', '', '', '', '', '', '', '', 0),
(285, 'LM', 'Balance', '2024-10-04', '1004', 'IQF', '17.5', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(286, 'LM', 'Balance', '2024-10-04', '1004', '500gx24bls', '12', 20, 20, 'W', '', '', '', '', '', '', '', 0),
(287, 'LM', 'Balance', '2024-10-04', '1004', '250gx40bls', '10', 10, 10, 'W', '', '', '', '', '', '', '', 0),
(288, 'LM', 'Balance', '2024-10-04', '1004', '250gx44bls', '11', 51, 51, 'W', '', '', '', '', '', '', '', 0),
(289, 'LM', 'Balance', '2024-10-04', '1004', '250g', '8.5', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(290, 'LM', 'Balance', '2024-10-04', '1004', '250g', '6.75', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(291, 'LM', 'Balance', '2024-10-04', '1004', '250gx48bls', '12', 33, 33, 'W', '', '', '', '', '', '', '', 0),
(292, 'LM', 'Balance', '2024-09-14', '1043', 'IQF', '20', 171, 171, 'W', '', '', '', '', '', '', '', 0),
(293, 'LM', 'Balance', '2024-09-14', '1043', 'IQF', '16', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(294, 'LM', 'Balance', '2024-09-14', '1043', 'IQF', '16', 0, 1, 'W', '', '', '', '', '', '', '', 0),
(295, 'LM', 'Balance', '2024-09-14', '1043', 'IQF', '20', 4, 175, 'W', '', '', '', '', '', '', '', 0),
(296, 'LM', 'Balance', '2024-09-14', '1043', 'IQF', '11.5', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(297, 'LM', 'Balance', '2024-09-14', '1043', 'IQF', '11.5', 0, 1, 'W', '', '', '', '', '', '', '', 0),
(298, 'LM', 'Balance', '2024-09-14', '1043', 'IQF', '22', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(299, 'LM', 'Balance', '2024-09-14', '1043', '1D', '20', 14, 14, 'W', '', '', '', '', '', '', '', 0),
(300, 'LM', 'Balance', '2024-09-14', '1043', '1D', '16', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(301, 'LM', 'Balance', '2024-09-14', '1043', '1D', '15', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(302, 'LM', 'Balance', '2024-09-14', '1043', '1D', '14', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(303, 'LM', 'Balance', '2024-09-14', '1043', '1D', '14', 1, 2, 'W', '', '', '', '', '', '', '', 0),
(304, 'LM', 'Balance', '2024-09-14', '1043', '100/200', '20', 32, 32, 'W', '', '', '', '', '', '', '', 0),
(305, 'LM', 'Balance', '2024-09-14', '1043', '100/200', '14', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(306, 'LM', 'Balance', '2024-09-14', '1043', '200/300', '20', 3, 3, 'W', '', '', '', '', '', '', '', 0),
(307, 'LM', 'Balance', '2024-09-14', '1043', '200/300', '12.6', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(308, 'LM', 'Balance', '2024-10-10', '1037', '60/80', '20', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(309, 'LM', 'Balance', '2024-10-10', '1037', '60/80', '10.3', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(310, 'LM', 'Balance', '2024-10-10', '1037', '80/100', '20', 183, 183, 'W', '', '', '', '', '', '', '', 0),
(311, 'LM', 'Balance', '2024-10-10', '1037', '80/100', '17.8', 2, 2, 'W', '', '', '', '', '', '', '', 0),
(312, 'LM', 'Balance', '2024-10-10', '1037', '150/200', '20', 28, -26, 'W', '', '', '', '', '', '', '', 0),
(313, 'LM', 'Balance', '2024-10-10', '1037', '100/150', '20', 76, 76, 'W', '', '', '', '', '', '', '', 0),
(314, 'LM', 'Balance', '2024-10-10', '1037', '100/150', '21', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(315, 'LM', 'Balance', '2024-10-10', '1037', '100/200', '20', 220, 220, 'W', '', '', '', '', '', '', '', 0),
(316, 'LM', 'Balance', '2024-10-10', '1037', '100/200', '21', 3, 3, 'W', '', '', '', '', '', '', '', 0),
(317, 'LM', 'Balance', '2024-10-10', '1037', '100/200', '10.5', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(318, 'LM', 'Balance', '2024-10-10', '1037', '', '', 0, 0, 'W', '', '', '', '', '', '', '', 0),
(319, 'LM', 'Balance', '2024-10-10', '1037', '80/100', '15', 3, 3, 'W', '', '', '', '', '', '', '', 0),
(320, 'LM', 'Balance', '2024-10-10', '1037', 'Mix', '20', 18, 18, 'W', '', '', '', '', '', '', '', 0),
(321, 'LM', 'Balance', '2024-10-10', '1037', 'Mix', '24', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(322, 'can', 'HHK To GFC', '2024-10-08', '1002', '1.5up', '20', 1, 2, '', '', '', '', '', '', '', '', 139),
(323, 'can', 'HHK To GFC', '2024-10-10', '1002', '2up', '20', 5, 6, 'G', '', '', '', '', '', '', '', 140),
(324, 'can', 'HHK To GFC', '2024-10-08', '1002', '3up', '21', 10, 10, '', '', '', '', '', '', '', '', 141),
(325, 'can', 'HHK To GFC', '2024-10-08', '1002', '3up', '22', 1, 1, '', '', '', '', '', '', '', '', 142),
(326, 'can', 'HHK To GFC', '2024-10-10', '1002', '4up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 143),
(327, 'can', 'HHK To GFC', '2024-10-10', '1002', '4up', '23', 3, 2, 'G', '', '', '', '', '', '', '', 144),
(328, 'can', 'HHK To GFC', '2024-10-08', '1002', '', '', 0, 0, 'G', '', '', '', '', '', '', '', 145),
(329, 'can', 'HHK To GFC', '2024-10-10', '1002', '6up', '20', 2, 1, 'G', '', '', '', '', '', '', '', 146),
(330, 'can', 'HHK To GFC', '2024-10-23', '1036', '800g', '20', 7, 7, '', '', '', '', '', '', '', '', 150),
(331, 'can', 'HHK To GFC', '2024-10-23', '1036', '1up', '20', 11, 14, '', '', '', '', '', '', '', '', 151),
(332, 'can', 'HHK To GFC', '2024-10-23', '1036', '500g', '20', 1, 1, '', '', '', '', '', '', '', '', 152),
(333, 'can', 'HHK To GFC', '2024-10-10', '1002', '2up', '21', 1, 1, '', '', '', '', '', '', '', '', 156),
(334, 'can', 'HHK To GFC', '2024-10-08', '1002', '3up', '22', 1, 2, '', '', '', '', '', '', '', '', 158),
(335, 'can', 'HHK To GFC', '2024-10-10', '1002', '5up', '22', 1, 4, '', '', '', '', '', '', '', '', 159),
(336, 'can', 'HHK To GFC', '2024-10-10', '1002', '5up', '23', 2, 2, '', '', '', '', '', '', '', '', 160),
(337, 'can', 'HHK To GFC', '2024-10-08', '1001', '2up', '20', 4, 4, '', '', '', '', '', '', '', '', 161),
(338, 'can', 'HHK To GFC', '2024-10-08', '1001', '3up', '21', 1, 1, '', '', '', '', '', '', '', '', 162),
(339, 'can', 'HHK To GFC', '2024-10-08', '1001', '3up', '22', 1, 1, '', '', '', '', '', '', '', '', 163),
(340, 'can', 'HHK To GFC', '2024-10-08', '1001', '3up', '20', 1, 1, '', '', '', '', '', '', '', '', 164),
(341, 'can', 'HHK To GFC', '2024-10-08', '1001', '4up', '23', 1, 1, '', '', '', '', '', '', '', '', 165),
(342, 'can', 'HHK To GFC', '2024-10-10', '1001', '1.5up', '21', 1, 1, '', '', '', '', '', '', '', '', 166),
(343, 'can', 'HHK To GFC', '2024-10-10', '1001', '2up', '20', 8, 12, '', '', '', '', '', '', '', '', 167),
(344, 'can', 'HHK To GFC', '2024-10-10', '1001', '3up', '21', 2, 3, '', '', '', '', '', '', '', '', 168),
(345, 'can', 'HHK To GFC', '2024-10-10', '1002', '3up', '22', 1, 3, '', '', '', '', '', '', '', '', 169),
(346, 'can', 'HHK To GFC', '2024-10-10', '1001', '4up', '23', 1, 2, '', '', '', '', '', '', '', '', 170),
(347, 'can', 'HHK To GFC', '2024-10-10', '1001', '5up', '23', 1, 1, '', '', '', '', '', '', '', '', 171),
(348, 'can', 'HHK To GFC', '2024-10-10', '1001', '6up', '19', 1, 1, '', '', '', '', '', '', '', '', 172),
(349, 'can', 'HHK To GFC', '2024-10-10', '1001', '3up', '22', 1, 2, '', '', '', '', '', '', '', '', 173),
(350, 'can', 'HHK To GFC', '2024-10-10', '1002', '10up', '22', 1, 1, '', '', '', '', '', '', '', '', 174),
(351, 'can', 'HHK To GFC', '2024-10-08', '1020', '3up', '22', 4, 24, '', '', '', '', '', '', '', '', 175),
(352, 'can', 'HHK To GFC', '2024-10-08', '1020', '3up', '23', 2, 9, '', '', '', '', '', '', '', '', 176),
(353, 'can', 'HHK To GFC', '2024-10-08', '1020', '4up', '23', 3, 18, '', '', '', '', '', '', '', '', 177),
(354, 'can', 'HHK To GFC', '2024-10-08', '1020', '4up', '24', 1, 6, '', '', '', '', '', '', '', '', 178),
(355, 'can', 'HHK To GFC', '2024-10-08', '1020', '5up', '23', 1, 12, '', '', '', '', '', '', '', '', 179),
(356, 'can', 'HHK To GFC', '2024-10-08', '1020', '5up', '22', 1, 4, '', '', '', '', '', '', '', '', 180),
(357, 'can', 'HHK To GFC', '2024-10-08', '1020', '2up', '20', 3, 33, '', '', '', '', '', '', '', '', 181),
(358, 'can', 'HHK To GFC', '2024-10-08', '1020', '2up', '21', 1, 5, '', '', '', '', '', '', '', '', 182),
(359, 'can', 'HHK To GFC', '2024-10-10', '1020', '3up', '22', 2, 26, '', '', '', '', '', '', '', '', 183),
(360, 'can', 'HHK To GFC', '2024-10-10', '1020', '3up', '23', 1, 10, '', '', '', '', '', '', '', '', 184),
(361, 'can', 'HHK To GFC', '2024-10-10', '1020', '3up', '20', 1, 1, '', '', '', '', '', '', '', '', 185),
(362, 'can', 'HHK To GFC', '2024-10-10', '1020', '4up', '23', 2, 20, '', '', '', '', '', '', '', '', 186),
(363, 'can', 'HHK To GFC', '2024-10-10', '1020', '4up', '22', 1, 5, '', '', '', '', '', '', '', '', 187),
(364, 'can', 'HHK To GFC', '2024-10-10', '1020', '4up', '21', 1, 1, '', '', '', '', '', '', '', '', 188),
(365, 'can', 'HHK To GFC', '2024-10-10', '1020', '5up', '23', 2, 14, '', '', '', '', '', '', '', '', 189),
(366, 'can', 'HHK To GFC', '2024-10-10', '1020', '2up', '20', 4, 37, '', '', '', '', '', '', '', '', 190),
(367, 'can', 'HHK To GFC', '2024-10-10', '1020', '9up', '20', 1, 3, '', '', '', '', '', '', '', '', 191),
(368, 'can', 'HHK To GFC', '2024-10-12', '1020', '3up', '22', 3, 29, '', '', '', '', '', '', '', '', 206),
(369, 'can', 'HHK To GFC', '2024-10-12', '1020', '3up', '23', 1, 11, '', '', '', '', '', '', '', '', 207),
(370, 'can', 'HHK To GFC', '2024-10-12', '1020', '3up', '21', 5, 28, '', '', '', '', '', '', '', '', 208),
(371, 'can', 'HHK To GFC', '2024-10-12', '1020', '4up', '23', 2, 22, '', '', '', '', '', '', '', '', 209),
(372, 'can', 'HHK To GFC', '2024-10-12', '1020', '4up', '24', 1, 7, '', '', '', '', '', '', '', '', 210),
(373, 'can', 'HHK To GFC', '2024-10-12', '1020', '5up', '23', 1, 15, '', '', '', '', '', '', '', '', 211),
(374, 'can', 'HHK To GFC', '2024-10-12', '1020', '5up', '22', 2, 4, 'G', '', '', '', '', '', '', '', 212),
(375, 'can', 'HHK To GFC', '2024-10-12', '1020', '5up', '24', 1, 2, '', '', '', '', '', '', '', '', 213),
(376, 'can', 'HHK To GFC', '2024-10-12', '1020', '2up', '20', 8, 45, '', '', '', '', '', '', '', '', 214),
(377, 'can', 'HHK To GFC', '2024-10-12', '1020', '2up', '21', 1, 6, '', '', '', '', '', '', '', '', 215),
(378, 'can', 'HHK To GFC', '2024-10-12', '1020', '7up', '22.5', 1, 2, '', '', '', '', '', '', '', '', 216),
(379, 'can', 'HHK To GFC', '2024-10-12', '1020', '7up', '23', 1, 3, '', '', '', '', '', '', '', '', 217),
(380, 'can', 'HHK To GFC', '2024-10-12', '1020', '7up', '24', 1, 1, '', '', '', '', '', '', '', '', 218),
(381, 'can', 'HHK To GFC', '2024-10-12', '1020', '6up', '19', 1, 6, '', '', '', '', '', '', '', '', 219),
(382, 'can', 'HHK To GFC(SL)', '2024-10-14', '1023', '3up', '21', 12, 30, '', '', '', '', '', '', '', '', 225),
(383, 'can', 'HHK To GFC(sl)', '2024-10-14', '1002', '3up', '22', 11, 14, '', '', '', '', '', '', '', '', 226),
(384, 'can', 'HHK To GFC(sl)', '2024-10-14', '1023', '3up', '22', 11, 40, '', '', '', '', '', '', '', '', 227),
(385, 'can', 'HHK To GFC (sl)', '2024-10-23', '1023', '3up', '21', 12, 42, '', '', '', '', '', '', '', '', 228),
(386, 'can', 'HHK To GFC(sl)', '2024-10-23', '1023', '3up', '22', 19, 59, '', '', '', '', '', '', '', '', 229),
(387, 'can', 'HHK To GFC', '2024-10-23', '1026', '8/10', '20', 2, 2, '', '', '', '', '', '', '', '', 238),
(388, 'can', 'HHK To GFC', '2024-10-23', '1026', '1up', '20', 5, 5, '', '', '', '', '', '', '', '', 239),
(389, 'can', 'HHK To GFC', '2024-10-23', '1026', '1.5up', '20', 2, 2, '', '', '', '', '', '', '', '', 240),
(390, 'can', 'HHK To GFC', '2024-10-23', '1026', '1.5up', '21', 1, 1, '', '', '', '', '', '', '', '', 241),
(391, 'can', 'HHK To GFC', '2024-10-23', '1026', '2up', '20', 2, 2, '', '', '', '', '', '', '', '', 242),
(392, 'can', 'HHK To GFC (G)', '2024-10-23', '1036', '800g', '20', 7, 14, '', '', '', '', '', '', '', '', 243),
(393, 'can', 'HHK To GFC sl', '2024-10-08', '1027', '4up', '23', 1, 1, '', '', '', '', '', '', '', '', 244),
(394, 'can', 'HHK To GFC sl', '2024-10-08', '1027', '5up', '23', 1, 2, '', '', '', '', '', '', '', '', 245),
(395, 'can', 'HHK To GFC sl', '2024-10-08', '1027', '3up', '23', 1, 1, '', '', '', '', '', '', '', '', 246),
(396, 'can', 'HHK To GFCsl', '2024-10-08', '1027', '3up', '24', 1, 1, '', '', '', '', '', '', '', '', 247),
(397, 'can', 'HHK To GFC', '2024-10-12', '1031', '500G x12bls', '6', 27, 27, '', '', '', '', '', '', '', '', 248),
(398, 'can', 'HHK To GFC', '2024-10-14', '1031', '500G x12bls', '6', 78, 105, '', '', '', '', '', '', '', '', 250),
(399, 'can', 'HHK To GFC', '2024-10-23', '1031', '500G x12bls', '6', 41, 146, '', '', '', '', '', '', '', '', 252),
(400, 'Can', 'Ship/ rp out', '2024-10-19', '1031', '500G x12bls', '6', 41, 105, '', '', '', '', '', '', '', '', 0),
(401, 'Can', 'Ship/ rp out', '2024-10-22', '1031', '500G x12bls', '6', 15, 90, '', '', '', '', '', '', '', '', 0),
(402, 'can', 'Ship/ rp out', '2024-10-23', '1031', '500G x12bls', '6', 16, 74, 'G', '', '', '', '', '', '', '', 0),
(403, 'can', 'Ship/ rp out\r\n', '2024-10-24', '1031', '500G x12bls', '6', 24, 50, 'G', '', '', '', '', '', '', '', 0),
(404, 'NY', 'Balance rp in', '2024-10-19', '1031', '500gx12bls', '6', 41, 41, 'Cut_piece', '', '', '', '', '', '', '', 0),
(405, 'NY', 'Balance rp in', '2024-10-22', '1031', '500gx12bls', '6', 15, 56, 'Cut_piece', '', '', '', '', '', '', '', 0),
(406, 'NY', 'HHK To GFC', '2024-10-23', '1031', '500G x12bls', '6', 16, 66, '', '', '', '', '', '', '', '', 256),
(407, 'NY', 'HHK To GFC', '2024-10-23', '1031', '500G x24bls', '12', 4, 4, '', '', '', '', '', '', '', '', 257),
(408, 'LM', 'HHK To GFC', '2024-10-14', '1031', '500G x24bls', '12', 2, 2, '', '', '', '', '', '', '', '', 259),
(409, 'LM', 'Ship/rp out', '2024-10-23', '1031', '500G x24bls', '12', 2, 0, '', '', '', '', '', '', '', '', 0),
(410, 'NY', 'Balance rp in', '2024-10-23', '1031', '500gx12bls', '6', 20, 76, 'Cut_piece', '', '', '', '', '', '', '', 0),
(411, 'NY', 'Balance rp in', '2024-10-24', '1031', '500gx12bls', '6', 24, 100, 'Cut_piece', '', '', '', '', '', '', '', 0),
(412, 'NY', 'Ship/23', '2024-10-24', '1031', '500G x12bls', '6', 100, -34, '', '', '', '', '', '', '', '', 0),
(413, 'NY', 'Ship/23', '2024-10-24', '1031', '500G x12bls', '6', 100, -134, '', '', '', '', '', '', '', '', 0),
(414, 'NY', 'Balance', '2024-10-12', '1019', '500G x12Bls', '6', 17, 17, 'Bls', '', '', '', '', '', '', '', 0),
(415, 'LM', 'Balance', '2024-10-25', '1015', '5/8', '20', 122, 122, 'W', '', '', '', '', '', '', '', 0),
(416, 'LM', 'Balance', '2024-10-25', '1015', '8/10', '20', 47, 47, 'W', '', '', '', '', '', '', '', 0),
(417, 'NY', 'Balance', '2024-10-25', '1015', '500g x12bls', '6', 13, 13, 'Cut_piece', '', '', '', '', '', '', '', 0),
(418, 'NY', 'HHK To GFC', '2024-10-12', '1017', '7up', '22', 1, 2, '', '', '', '', '', '', '', '', 369),
(419, 'NY', 'HHK To GFC', '2024-10-12', '1017', '7up', '23', 3, 4, '', '', '', '', '', '', '', '', 370),
(420, 'NY', 'Ship/23', '2024-10-24', '1017', '3up', '23', 1, 0, '', '', '', '', '', '', '', '', 0),
(421, 'NY', 'Ship/', '2024-10-24', '1017', '4up', '20', 2, 0, '', '', '', '', '', '', '', '', 0),
(422, 'NY', 'Ship/23', '2024-10-24', '1017', '4up', '22', 1, 1, '', '', '', '', '', '', '', '', 0),
(423, 'NY', 'Ship/23', '2024-10-24', '1017', '4up', '23', 26, 10, '', '', '', '', '', '', '', '', 0),
(424, 'NY', 'Ship/', '2024-10-24', '1017', '4up', '24', 40, 13, '', '', '', '', '', '', '', '', 0),
(425, 'NY', 'Ship/', '2024-10-24', '1017', '5up', '22', 16, 45, '', '', '', '', '', '', '', '', 0),
(426, 'NY', 'Ship/', '2024-10-24', '1017', '5up', '23', 9, 105, '', '', '', '', '', '', '', '', 0),
(427, 'NY', 'Ship/23', '2024-10-24', '1017', '5up', '21', 1, 6, '', '', '', '', '', '', '', '', 0),
(428, 'NY', 'Ship/23', '2024-10-24', '1017', '6up', '19', 1, 6, '', '', '', '', '', '', '', '', 0),
(429, 'NY', 'Ship/', '2024-10-24', '1017', '6up', '20', 5, 22, '', '', '', '', '', '', '', '', 0),
(430, 'NY', 'Ship/', '2024-10-24', '1017', '6up', '21', 2, 0, '', '', '', '', '', '', '', '', 0),
(431, 'NY', 'Ship/', '2024-10-24', '1017', '7up', '23', 3, 1, '', '', '', '', '', '', '', '', 0),
(432, 'NY', 'Ship/', '2024-10-24', '1017', '7up', '22', 2, 0, '', '', '', '', '', '', '', '', 0),
(433, 'NY', 'Ship/23', '2024-10-24', '1017', '9up', '19', 1, -1, '', '', '', '', '', '', '', '', 0),
(434, 'NY', 'HHK To GFC (NT to GFC)', '2024-10-23', '1027', '3up', '21', 4, 5, '', '', '', '', '', '', '', '', 379),
(435, 'NY', 'HHK To GFC (NT to GFC)', '2024-10-23', '1027', '3up', '22', 5, 5, '', '', '', '', '', '', '', '', 380),
(436, 'NY', 'HHK To GFC (NT to GFC)', '2024-10-23', '1027', '4up', '23', 6, 7, '', '', '', '', '', '', '', '', 381),
(437, 'NY', 'HHK To GFC (NT to GFC)', '2024-10-23', '1027', '4up', '24', 1, 1, '', '', '', '', '', '', '', '', 382),
(438, 'NY', 'HHK To GFC(NT to GFC)', '2024-10-23', '1027', '5up', '21', 1, 1, '', '', '', '', '', '', '', '', 383),
(439, 'NY', 'HHK To GFC (NT to GFC)', '2024-10-23', '1027', '5up', '22', 1, 1, '', '', '', '', '', '', '', '', 384),
(440, 'NY', 'HHK To GFC (NT to GFC)', '2024-10-23', '1027', '5up', '23', 1, 1, '', '', '', '', '', '', '', '', 385),
(441, 'NY', 'HHK To GFC (NT to GFC)', '2024-10-23', '1027', '7up', '22.5', 1, 1, '', '', '', '', '', '', '', '', 386),
(442, 'Can', 'Ship/17', '2024-10-25', '1031', '2up', '20', 151, 60, '', '', '', '', '', '', '', '', 0),
(443, 'can', 'Ship/17', '2024-10-25', '1031', '', '', 0, 0, 'G', '', '', '', '', '', '', '', 0),
(444, 'Can', 'Ship/17', '2024-10-25', '1031', '2up', '21', 49, 24, '', '', '', '', '', '', '', '', 0),
(445, 'can', 'Ship/', '2024-10-25', '1031', '3up', '20', 33, -69, 'G', '', '', '', '', '', '', '', 0),
(446, 'Can', 'Ship/17', '2024-10-25', '1031', '3up', '21', 37, -99, '', '', '', '', '', '', '', '', 0),
(447, 'Can', 'Ship/17', '2024-10-25', '1031', '3up', '22', 8, -16, '', '', '', '', '', '', '', '', 0),
(448, 'Can', 'Ship/17', '2024-10-25', '1031', '3up', '23', 3, 8, '', '', '', '', '', '', '', '', 0),
(449, 'Can', 'Ship/17', '2024-10-25', '1031', '3up', '24', 2, 7, '', '', '', '', '', '', '', '', 0),
(450, 'Can', 'Ship/17', '2024-10-25', '1031', '3up', '19', 17, 1, '', '', '', '', '', '', '', '', 0),
(451, 'can', 'Ship/', '2024-10-25', '1017', '3up', '22', 5, 15, 'G', '', '', '', '', '', '', '', 0),
(452, 'can', 'Ship/', '2024-10-25', '1017', '3up', '22', 2, 13, 'G', '', '', '', '', '', '', '', 0),
(453, 'Can', 'Ship/', '2024-10-25', '1017', '3up', '21', 1, 2, '', '', '', '', '', '', '', '', 0),
(454, 'can', 'Ship/T/O', '2024-10-11', '1001', '1up', '20', 38, 0, 'G', '', '', '', '', '', '', '', 0),
(455, 'Can', 'Ship/T/O', '2024-10-11', '1001', '800g', '20', 1, -1, '', '', '', '', '', '', '', '', 0),
(456, 'Can', 'Ship/17', '2024-10-25', '1031', '500G x12bls', '6', 50, 0, '', '', '', '', '', '', '', '', 0),
(457, 'can', 'HHK To GFC', '2024-10-08', '1023', '5up', '22', 9, 39, '', '', '', '', '', '', '', '', 430),
(458, 'can', 'HHK To GFC', '2024-10-08', '1023', '5up', '23', 1, 7, '', '', '', '', '', '', '', '', 431),
(459, 'can', 'HHK To GFC', '2024-10-08', '1023', '6up', '20', 3, 8, '', '', '', '', '', '', '', '', 432),
(460, 'can', 'HHK To GFC', '2024-10-08', '1023', '6up', '19', 5, 4, 'G', '', '', '', '', '', '', '', 433),
(461, 'can', 'HHK To GFC', '2024-10-08', '1023', '7up', '22', 1, 2, '', '', '', '', '', '', '', '', 434),
(462, 'can', 'HHK To GFC', '2024-10-08', '1023', '7up', '23', 2, 2, '', '', '', '', '', '', '', '', 435),
(463, 'NY', 'HHK To GFC', '2024-10-08', '1023', '4up', '20', 2, 6, '', '', '', '', '', '', '', '', 436),
(464, 'NY', 'HHK To GFC', '2024-10-08', '1023', '4up', '23', 37, 80, 'G', '', '', '', '', '', '', '', 437),
(465, 'NY', 'HHK To GFC', '2024-10-08', '1023', '4up', '24', 49, 115, 'G', '', '', '', '', '', '', '', 438),
(466, 'NY', 'HHK To GFC', '2024-10-08', '1023', '5up', '22', 23, 24, 'G', '', '', '', '', '', '', '', 439),
(467, 'NY', 'HHK To GFC', '2024-10-08', '1023', '5up', '23', 17, 31, '', '', '', '', '', '', '', '', 440),
(468, 'NY', 'HHK To GFC', '2024-10-08', '1023', '5up', '21', 1, 1, '', '', '', '', '', '', '', '', 441),
(469, 'NY', 'HHK To GFC', '2024-10-08', '1023', '6up', '20', 4, 15, '', '', '', '', '', '', '', '', 442),
(470, 'NY', 'HHK To GFC', '2024-10-08', '1023', '6up', '19', 2, 6, '', '', '', '', '', '', '', '', 443),
(471, 'NY', 'HHK To GFC', '2024-10-08', '1023', '7up', '24', 1, 10, '', '', '', '', '', '', '', '', 444),
(472, 'NY', 'HHK To GFC', '2024-10-10', '1023', '4up', '20', 2, 8, '', '', '', '', '', '', '', '', 445),
(473, 'NY', 'HHK To GFC', '2024-10-10', '1023', '4up', '23', 13, 93, 'G', '', '', '', '', '', '', '', 446),
(474, 'NY', 'HHK To GFC', '2024-10-10', '1023', '4up', '24', 42, 157, 'G', '', '', '', '', '', '', '', 447),
(475, 'NY', 'HHK To GFC', '2024-10-10', '1023', '5up', '22', 19, 43, 'G', '', '', '', '', '', '', '', 448),
(476, 'NY', 'HHK To GFC', '2024-10-10', '1023', '5up', '23', 21, 52, '', '', '', '', '', '', '', '', 449),
(477, 'NY', 'HHK To GFC', '2024-10-10', '1023', '6up', '20', 6, 21, '', '', '', '', '', '', '', '', 450),
(478, 'NY', 'HHK To GFC', '2024-10-10', '1023', '6up', '19', 4, 10, '', '', '', '', '', '', '', '', 451),
(479, 'NY', 'HHK To GFC', '2024-10-10', '1023', '7up', '22', 1, 1, '', '', '', '', '', '', '', '', 452),
(480, 'NY', 'HHK To GFC', '2024-10-10', '1023', '7up', '23', 1, 7, '', '', '', '', '', '', '', '', 453),
(481, 'NY', 'HHK To GFC', '2024-10-12', '1023', '4up', '20', 4, 12, '', '', '', '', '', '', '', '', 454),
(482, 'NY', 'HHK To GFC', '2024-10-12', '1023', '4up', '23', 2, 95, 'G', '', '', '', '', '', '', '', 455),
(483, 'NY', 'HHK To GFC', '2024-10-12', '1023', '4up', '24', 1, 158, 'G', '', '', '', '', '', '', '', 456),
(484, 'NY', 'HHK To GFC', '2024-10-12', '1023', '4up', '22', 1, 40, '', '', '', '', '', '', '', '', 457),
(485, 'NY', 'HHK To GFC', '2024-10-12', '1023', '4up', '21', 1, 17, '', '', '', '', '', '', '', '', 458),
(486, 'NY', 'HHK To GFC', '2024-10-12', '1023', '5up', '22', 11, 54, 'G', '', '', '', '', '', '', '', 459),
(487, 'NY', 'HHK To GFC', '2024-10-12', '1023', '5up', '23', 15, 67, '', '', '', '', '', '', '', '', 460),
(488, 'NY', 'HHK To GFC', '2024-10-12', '1023', '6up', '20', 13, 34, '', '', '', '', '', '', '', '', 461);
INSERT INTO `gfcmcstock` (`id`, `country`, `particular`, `date`, `commondity_id`, `size`, `kg`, `mc`, `balance_mc`, `fish_type`, `loosein_size`, `loosein_kg`, `loosein_pcs`, `looseout_size`, `looseout_kg`, `looseout_pcs`, `remark`, `hhk_id`) VALUES
(489, 'NY', 'HHK To GFC', '2024-10-12', '1023', '6up', '19', 4, 14, '', '', '', '', '', '', '', '', 462),
(490, 'NY', 'HHK To GFC', '2024-10-12', '1023', '7up', '22', 1, 2, '', '', '', '', '', '', '', '', 463),
(491, 'NY', 'HHK To GFC', '2024-10-12', '1023', '7up', '23', 3, 10, '', '', '', '', '', '', '', '', 464),
(492, 'NY', 'HHK To GFC', '2024-10-12', '1023', '8up', '27', 1, 3, '', '', '', '', '', '', '', '', 465),
(493, 'NY', 'HHK To GFC', '2024-10-12', '1023', '9up', '19', 1, 5, '', '', '', '', '', '', '', '', 466),
(494, 'NY', 'HHK To GFC', '2024-10-12', '1023', '10up', '21', 1, 1, '', '', '', '', '', '', '', '', 467),
(495, 'NY', 'HHK To GFC', '2024-10-12', '1023', '2up', '20', 13, 13, '', '', '', '', '', '', '', '', 468),
(496, 'NY', 'HHK To GFC', '2024-10-12', '1023', '2up', '21', 7, 8, '', '', '', '', '', '', '', '', 469),
(497, 'NY', 'Ship/T/O', '2024-10-19', '1023', '3up', '20', 1, 2, '', '', '', '', '', '', '', '', 0),
(498, 'NY', 'Ship/T/O', '2024-10-19', '1023', '', '21', 18, -18, '', '', '', '', '', '', '', '', 0),
(499, 'NY', 'Ship/T/O', '2024-10-19', '1023', '3up', '22', 13, 105, '', '', '', '', '', '', '', '', 0),
(500, 'NY', 'Ship/T/O', '2024-10-19', '1023', '3up', '23', 7, 7, '', '', '', '', '', '', '', '', 0),
(501, 'NY', 'Ship/', '2024-10-19', '1023', '3up', '21', 18, 32, '', '', '', '', '', '', '', '', 0),
(502, 'NY', 'HHK To GFC', '2024-10-23', '1023', '4up', '20', 1, 13, '', '', '', '', '', '', '', '', 470),
(504, 'NY', 'HHK To GFC', '2024-10-23', '1023', '4up', '22', 1, 41, '', '', '', '', '', '', '', '', 472),
(506, 'NY', 'HHK To GFC', '2024-10-23', '1023', '5up', '22', 32, 86, 'G', '', '', '', '', '', '', '', 474),
(507, 'NY', 'HHK To GFC', '2024-10-23', '1023', '5up', '23', 9, 76, '', '', '', '', '', '', '', '', 475),
(508, 'NY', 'HHK To GFC', '2024-10-23', '1023', '5up', '21', 3, 4, '', '', '', '', '', '', '', '', 476),
(509, 'NY', 'HHK To GFC', '2024-10-23', '1023', '6up', '20', 9, 43, '', '', '', '', '', '', '', '', 477),
(510, 'NY', 'HHK To GFC', '2024-10-23', '1023', '6up', '19', 5, 19, '', '', '', '', '', '', '', '', 478),
(511, 'NY', 'HHK To GFC', '2024-10-23', '1023', '7up', '22', 1, 3, '', '', '', '', '', '', '', '', 479),
(512, 'NY', 'HHK To GFC', '2024-10-23', '1023', '2up', '20', 53, 66, '', '', '', '', '', '', '', '', 480),
(513, 'NY', 'Ship/23', '2024-10-24', '1023', '3up', '20', 1, 1, '', '', '', '', '', '', '', '', 0),
(514, 'NY', 'Ship/23', '2024-10-24', '1023', '3up', '21', 21, 11, '', '', '', '', '', '', '', '', 0),
(515, 'NY', 'Ship/23', '2024-10-24', '1023', '3up', '22', 74, 31, '', '', '', '', '', '', '', '', 0),
(516, 'Can', 'Ship/17', '2024-10-25', '1017', '3up', '22', 5, 8, '', '', '', '', '', '', '', '', 0),
(517, 'Can', 'Ship/17', '2024-10-25', '1017', '3up', '22', 2, 6, '', '', '', '', '', '', '', '', 0),
(518, 'NY', 'Ship/23', '2024-11-24', '1023', '3up', '23', 4, 3, 'G', '', '', '', '', '', '', '', 0),
(519, 'NY', 'Ship/23', '2024-10-24', '1023', '4up', '20', 2, 11, 'G', '', '', '', '', '', '', '', 0),
(520, 'NY', 'Ship/23', '2024-10-24', '1023', '4up', '21', 9, 8, 'G', '', '', '', '', '', '', '', 0),
(521, 'NY', 'Ship/23', '2024-10-24', '1023', '4up', '22', 28, 13, 'G', '', '', '', '', '', '', '', 0),
(522, 'NY', 'Ship/23', '2024-10-24', '1023', '4up', '23', 30, 65, 'G', '', '', '', '', '', '', '', 0),
(523, 'NY', 'Ship/23', '2024-10-24', '1023', '4up', '24', 31, 127, 'G', '', '', '', '', '', '', '', 0),
(524, 'NY', 'Ship/23', '2024-10-24', '1023', '5up', '21', 4, 0, 'G', '', '', '', '', '', '', '', 0),
(525, 'NY', 'Ship/23', '2024-10-24', '1023', '5up', '22', 46, 40, 'G', '', '', '', '', '', '', '', 0),
(526, 'NY', 'Ship/23', '2024-10-24', '1023', '5up', '23', 30, 46, 'G', '', '', '', '', '', '', '', 0),
(527, 'NY', 'Ship/23', '2024-10-24', '1023', '6up', '19', 8, 11, 'G', '', '', '', '', '', '', '', 0),
(528, 'NY', 'Ship/23', '2024-10-24', '1023', '6up', '20', 17, 26, 'G', '', '', '', '', '', '', '', 0),
(529, 'NY', 'Ship/23', '2024-10-24', '1023', '7up', '22', 2, 1, 'G', '', '', '', '', '', '', '', 0),
(530, 'NY', 'Ship/23', '2024-10-24', '1023', '7up', '23', 2, 8, 'G', '', '', '', '', '', '', '', 0),
(531, 'NY', 'Ship/23', '2024-10-24', '1023', '8up', '27', 1, 2, 'G', '', '', '', '', '', '', '', 0),
(532, 'NY', 'Ship/24', '2024-10-25', '1023', '3up', '21', 8, 3, 'G', '', '', '', '', '', '', '', 0),
(533, 'NY', 'Ship/24', '2024-10-25', '1023', '3up', '22', 34, -3, 'G', '', '', '', '', '', '', '', 0),
(534, 'NY', 'Ship/24', '2024-10-25', '1023', '3up', '23', 2, 1, 'G', '', '', '', '', '', '', '', 0),
(535, 'NY', 'Ship/24', '2024-10-25', '1023', '4up', '20', 3, 8, 'G', '', '', '', '', '', '', '', 0),
(536, 'Can', 'Ship/24', '2024-10-25', '1023', '4up', '21', 7, 1, 'G', '', '', '', '', '', '', '', 0),
(537, 'NY', 'Ship/24', '2024-10-25', '1023', '4up', '22', 13, 0, 'G', '', '', '', '', '', '', '', 0),
(538, 'NY', 'Ship/24', '2024-10-25', '1023', '4up', '23', 28, 37, 'G', '', '', '', '', '', '', '', 0),
(539, 'NY', 'Ship/24', '2024-10-25', '1023', '4up', '24', 49, 78, 'G', '', '', '', '', '', '', '', 0),
(540, 'NY', 'Ship/24', '2024-10-25', '1023', '4up', '21', 7, 1, 'G', '', '', '', '', '', '', '', 0),
(541, 'NY', 'Ship/24', '2024-10-25', '1023', '5up', '21', 1, -1, 'G', '', '', '', '', '', '', '', 0),
(542, 'NY', 'Ship/24', '2024-10-25', '1023', '5up', '22', 22, 18, 'G', '', '', '', '', '', '', '', 0),
(543, 'NY', 'Ship/24', '2024-10-25', '1023', '5up', '23', 21, 25, 'G', '', '', '', '', '', '', '', 0),
(544, 'NY', 'Ship/24', '2024-10-25', '1023', '6up', '19', 7, 4, 'G', '', '', '', '', '', '', '', 0),
(545, 'NY', 'Ship/24', '2024-10-25', '1023', '6up', '20', 14, 12, 'G', '', '', '', '', '', '', '', 0),
(546, 'NY', 'Ship/24', '2024-10-25', '1023', '7up', '22', 1, 0, 'G', '', '', '', '', '', '', '', 0),
(547, 'NY', 'Ship/24', '2024-10-25', '1023', '7up', '23', 8, 0, 'G', '', '', '', '', '', '', '', 0),
(548, 'NY', 'Ship/24', '2024-10-25', '1023', '7up', '24', 5, 5, 'G', '', '', '', '', '', '', '', 0),
(549, 'NY', 'Ship/24', '2024-10-25', '1023', '7up', '21.6', 1, 0, 'G', '', '', '', '', '', '', '', 0),
(550, 'NY', 'Ship/24', '2024-10-25', '1023', '8up', '25', 2, 0, 'G', '', '', '', '', '', '', '', 0),
(551, 'NY', 'Ship/24', '2024-10-25', '1023', '8up', '26', 3, 1, 'G', '', '', '', '', '', '', '', 0),
(552, 'NY', 'Ship/24', '2024-10-25', '1023', '8up', '27', 2, 0, 'G', '', '', '', '', '', '', '', 0),
(553, 'NY', 'Ship/24', '2024-10-25', '1023', '9up', '19.5', 1, 0, 'G', '', '', '', '', '', '', '', 0),
(554, 'NY', 'Ship/24', '2024-10-25', '1023', '9up', '20', 2, 4, 'G', '', '', '', '', '', '', '', 0),
(555, 'NY', 'Ship/24', '2024-10-25', '1023', '9up', '19', 3, 2, 'G', '', '', '', '', '', '', '', 0),
(556, 'NY', 'Ship/24', '2024-10-25', '1023', '10up', '21.5', 1, 0, 'G', '', '', '', '', '', '', '', 0),
(557, 'NY', 'Ship/24', '2024-10-25', '1023', '10up', '22', 3, 1, 'G', '', '', '', '', '', '', '', 0),
(558, 'NY', 'Ship/24', '2024-10-25', '1023', '10up', '23', 1, 3, 'G', '', '', '', '', '', '', '', 0),
(559, 'NY', 'Ship/24', '2024-10-25', '1023', '10up', '21', 1, 0, 'G', '', '', '', '', '', '', '', 0),
(560, 'NY', 'Ship/24', '2024-10-25', '1023', '12up', '25', 1, 0, 'G', '', '', '', '', '', '', '', 0),
(561, 'NY', 'HHK To GFC', '2024-10-23', '1023', '4up', '24', 1, 79, 'G', '', '', '', '', '', '', '', 485),
(562, 'NY', 'HHK To GFC', '2024-10-21', '1020', '2up', '20', 3, 4, 'G', '', '', '', '', '', '', '', 501),
(563, 'NY', 'HHK To GFC', '2024-10-21', '1020', '2up', '21', 1, 7, 'G', '', '', '', '', '', '', '', 502),
(564, 'NY', 'HHK To GFC', '2024-10-21', '1020', '3up', '21', 1, 9, 'G', '', '', '', '', '', '', '', 503),
(565, 'NY', 'HHK To GFC', '2024-10-21', '1020', '3up', '19.5', 1, 1, 'G', '', '', '', '', '', '', '', 504),
(566, 'NY', 'HHK To GFC', '2024-10-21', '1020', '4up', '22.5', 1, 1, 'G', '', '', '', '', '', '', '', 505),
(567, 'NY', 'HHK To GFC', '2024-10-23', '1020', '2up', '21', 2, 9, 'G', '', '', '', '', '', '', '', 507),
(568, 'NY', 'HHK To GFC', '2024-10-23', '1020', '3up', '21', 2, 11, 'G', '', '', '', '', '', '', '', 508),
(569, 'NY', 'HHK To GFC', '2024-10-23', '1020', '3up', '22', 13, 23, 'G', '', '', '', '', '', '', '', 509),
(570, 'NY', 'HHK To GFC', '2024-10-23', '1020', '3up', '23', 6, 6, 'G', '', '', '', '', '', '', '', 510),
(571, 'NY', 'HHK To GFC', '2024-10-23', '1020', '4up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 511),
(572, 'NY', 'HHK To GFC', '2024-10-23', '1020', '4up', '22', 3, 3, 'G', '', '', '', '', '', '', '', 512),
(573, 'NY', 'HHK To GFC', '2024-10-23', '1020', '4up', '23', 12, 13, 'G', '', '', '', '', '', '', '', 513),
(574, 'NY', 'HHK To GFC', '2024-10-23', '1020', '4up', '24', 3, 4, 'G', '', '', '', '', '', '', '', 514),
(575, 'NY', 'HHK To GFC', '2024-10-23', '1020', '5up', '23', 5, 7, 'G', '', '', '', '', '', '', '', 515),
(576, 'NY', 'HHK To GFC', '2024-10-23', '1020', '5up', '22', 1, 2, 'G', '', '', '', '', '', '', '', 516),
(577, 'NY', 'HHK To GFC', '2024-10-23', '1020', '6up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 517),
(578, 'NY', 'HHK To GFC', '2024-10-23', '1020', '6up', '20', 4, 6, 'G', '', '', '', '', '', '', '', 518),
(579, 'NY', 'HHK To GFC', '2024-10-23', '1020', '6up', '19', 1, 2, 'G', '', '', '', '', '', '', '', 519),
(580, 'NY', 'HHK To GFC', '2024-10-25', '1020', '2up', '20', 4, 8, 'G', '', '', '', '', '', '', '', 520),
(581, 'NY', 'HHK To GFC', '2024-10-25', '1020', '3up', '22', 1, 24, 'G', '', '', '', '', '', '', '', 521),
(582, 'NY', 'HHK To GFC', '2024-10-25', '1020', '4up', '23', 1, 14, 'G', '', '', '', '', '', '', '', 522),
(583, 'NY', 'HHK To GFC', '2024-10-25', '1020', '5up', '22', 1, 3, 'G', '', '', '', '', '', '', '', 523),
(584, 'NY', 'HHK To GFC', '2024-10-25', '1020', '8up', '26', 1, 1, 'G', '', '', '', '', '', '', '', 524),
(585, 'NY', 'HHK To GFC', '2024-10-25', '1020', '12up', '13', 1, 2, 'G', '', '', '', '', '', '', '', 525),
(586, 'NY', 'HHK To GFC', '2024-11-05', '1020', '2up', '20', 8, 16, 'G', '', '', '', '', '', '', '', 530),
(587, 'NY', 'HHK To GFC', '2024-11-05', '1020', '2up', '21', 1, 10, 'G', '', '', '', '', '', '', '', 531),
(588, 'NY', 'HHK To GFC', '2024-11-05', '1020', '3up', '22', 4, 28, 'G', '', '', '', '', '', '', '', 532),
(589, 'NY', 'HHK To GFC', '2024-11-05', '1020', '4up', '22', 1, 4, 'G', '', '', '', '', '', '', '', 533),
(590, 'NY', 'HHK To GFC', '2024-11-05', '1020', '4up', '23', 1, 15, 'G', '', '', '', '', '', '', '', 534),
(591, 'NY', 'HHK To GFC', '2024-11-05', '1020', '5up', '23', 1, 8, 'G', '', '', '', '', '', '', '', 535),
(592, 'NY', 'HHK To GFC', '2024-11-05', '1020', '6up', '20.5', 1, 2, 'G', '', '', '', '', '', '', '', 536),
(593, 'NY', 'HHK To GFC', '2024-11-05', '1020', '6up', '20', 1, 7, 'G', '', '', '', '', '', '', '', 537),
(594, 'NY', 'HHK To GFC', '2024-11-05', '1020', '8up', '25', 1, 1, 'G', '', '', '', '', '', '', '', 538),
(595, 'NY', 'HHK To GFC', '2024-11-05', '1020', '10up', '23', 1, 1, 'G', '', '', '', '', '', '', '', 539),
(596, 'NY', 'HHK To GFC', '2024-11-05', '1002', '3up', '24', 1, 1, 'G', '', '', '', '', '', '', '', 540),
(597, 'NY', 'Ship/23', '2024-10-24', '1020', '2up', '20', 10, 6, 'G', '', '', '', '', '', '', '', 0),
(598, 'NY', 'Ship/23', '2024-10-24', '1020', '2up', '21', 3, 7, 'G', '', '', '', '', '', '', '', 0),
(599, 'NY', 'Ship/', '2024-10-24', '1020', '3up', '21', 1, 10, 'G', '', '', '', '', '', '', '', 0),
(600, 'NY', 'Ship/', '2024-10-24', '1020', '3up', '22', 13, 15, 'G', '', '', '', '', '', '', '', 0),
(601, 'NY', 'Ship/', '2024-10-24', '1031', '3up', '23', 1, -1, 'G', '', '', '', '', '', '', '', 0),
(602, 'NY', 'Ship/', '2024-10-24', '1020', '5up', '22', 1, 2, 'G', '', '', '', '', '', '', '', 0),
(603, 'NY', 'Ship/', '2024-10-24', '1020', '5up', '23', 5, 3, 'G', '', '', '', '', '', '', '', 0),
(604, 'NY', 'Ship/23', '2024-10-24', '1020', '6up', '20', 4, 3, 'G', '', '', '', '', '', '', '', 0),
(605, 'NY', 'Ship/23', '2024-10-24', '1020', '6up', '19', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(606, 'NY', 'Ship/23', '2024-10-24', '1020', '4up', '23', 6, 9, 'G', '', '', '', '', '', '', '', 0),
(607, 'NY', 'Ship/23', '2024-10-24', '1020', '4up', '24', 1, 3, 'G', '', '', '', '', '', '', '', 0),
(608, 'NY', 'Ship/23', '2024-10-24', '1020', '4up', '22', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(609, 'NY', 'Ship/23', '2024-10-24', '1020', '6up', '21', 1, 0, 'G', '', '', '', '', '', '', '', 0),
(610, 'NY', 'Ship/23', '2024-10-24', '1020', '4up', '20', 1, 0, 'G', '', '', '', '', '', '', '', 0),
(611, 'NY', 'Ship/23', '2024-10-24', '1020', '4up', '20', 1, -1, 'G', '', '', '', '', '', '', '', 0),
(612, 'NY', 'HHK To GFC NT--GFC', '2024-10-23', '1020', '2up', '21', 1, 8, 'G', '', '', '', '', '', '', '', 547),
(613, 'NY', 'HHK To GFC Nt--GFC', '2024-10-23', '1020', '3up', '22', 1, 16, 'G', '', '', '', '', '', '', '', 548),
(614, 'NY', 'HHK To GFC NT--GFC', '2024-10-23', '1020', '4up', '22', 2, 4, 'G', '', '', '', '', '', '', '', 549),
(615, 'NY', 'HHK To GFC NT--GFC', '2024-10-23', '1020', '4up', '23', 1, 10, 'G', '', '', '', '', '', '', '', 550),
(616, 'NY', 'HHK To GFC NT--GFC', '2024-10-23', '1020', '5up', '23', 2, 5, 'G', '', '', '', '', '', '', '', 551),
(617, 'NY', 'HHK To GFC NT--GFC', '2024-10-23', '1020', '5up', '22.5', 1, 1, 'G', '', '', '', '', '', '', '', 552),
(618, 'NY', 'HHK To GFC', '2024-11-05', '1020', '3up', '24', 1, 1, 'G', '', '', '', '', '', '', '', 553),
(619, 'NY', 'Ship/24', '2024-10-25', '1020', '3up', '21', 10, 0, 'G', '', '', '', '', '', '', '', 0),
(620, 'NY', 'Ship/24', '2024-10-25', '1020', '3up', '22', 11, 5, 'G', '', '', '', '', '', '', '', 0),
(621, 'NY', 'Ship/23', '2024-10-24', '1020', '3up', '23', 1, 5, 'G', '', '', '', '', '', '', '', 0),
(622, 'NY', 'Ship/24', '2024-10-25', '1020', '3up', '23', 5, 0, 'G', '', '', '', '', '', '', '', 0),
(623, 'NY', 'Ship/24', '2024-10-25', '1020', '5up', '22', 2, 0, 'G', '', '', '', '', '', '', '', 0),
(624, 'NY', 'Ship/24', '2024-10-25', '1020', '5up', '23', 3, 2, 'G', '', '', '', '', '', '', '', 0),
(625, 'NY', 'Ship/24', '2024-10-25', '1020', '6up', '20', 2, 1, 'G', '', '', '', '', '', '', '', 0),
(626, 'NY', 'Ship/24', '2024-10-25', '1020', '6up', '19', 1, 0, 'G', '', '', '', '', '', '', '', 0),
(627, 'NY', 'Ship/24', '2024-10-25', '1020', '4up', '23', 8, 2, 'G', '', '', '', '', '', '', '', 0),
(628, 'NY', 'Ship/24', '2024-10-25', '1020', '4up', '24', 2, 1, 'G', '', '', '', '', '', '', '', 0),
(629, 'NY', 'Ship/24', '2024-10-25', '1020', '4up', '22', 3, 1, 'G', '', '', '', '', '', '', '', 0),
(630, 'NY', 'Ship/24', '2024-10-25', '1020', '8up', '26', 1, 0, 'G', '', '', '', '', '', '', '', 0),
(631, 'NY', 'Ship/24', '2024-10-25', '1020', '3up', '19.5', 1, 0, 'G', '', '', '', '', '', '', '', 0),
(632, 'NY', 'Ship/24', '2024-10-25', '1020', '6up', '21', 1, -1, 'G', '', '', '', '', '', '', '', 0),
(633, 'NY', 'Ship/24', '2024-10-25', '1020', '12up', '13', 2, 0, 'G', '', '', '', '', '', '', '', 0),
(634, 'NY', 'Ship/24', '2024-10-25', '1020', '4up', '22.5', 1, 0, 'G', '', '', '', '', '', '', '', 0),
(635, 'NY', 'Ship/24', '2024-10-25', '1020', '5up', '22.5', 1, 0, 'G', '', '', '', '', '', '', '', 0),
(636, 'NY', 'HHK To GFC NT--GFC', '2024-10-23', '1027', '3up', '21', 4, 5, 'G', '', '', '', '', '', '', '', 562),
(637, 'NY', 'HHK To GFC NT--GFC', '2024-10-23', '1027', '3up', '22', 5, 5, 'G', '', '', '', '', '', '', '', 563),
(638, 'NY', 'HHK To GFC', '2024-10-23', '1027', '4up', '23', 6, 7, 'G', '', '', '', '', '', '', '', 564),
(639, 'NY', 'HHK To GFC', '2024-10-23', '1027', '4up', '24', 1, 1, 'G', '', '', '', '', '', '', '', 565),
(640, 'NY', 'HHK To GFC', '2024-10-23', '1027', '5up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 566),
(641, 'NY', 'HHK To GFC', '2024-10-23', '1027', '5up', '22', 1, 1, 'G', '', '', '', '', '', '', '', 567),
(642, 'NY', 'HHK To GFC', '2024-10-23', '1027', '5up', '23', 1, 1, 'G', '', '', '', '', '', '', '', 568),
(643, 'NY', 'HHK To GFC', '2024-10-23', '1027', '7up', '22.5', 1, 1, 'G', '', '', '', '', '', '', '', 569),
(644, 'NY', 'Balance (R/P in)', '2024-10-08', '1037', '100/200 1kg', '20', 20, 20, 'W', '', '', '', '', '', '', '', 0),
(645, 'NY', 'Balance (R/P in)', '2024-10-19', '1037', '150/200', '20', 5, 7, 'W', '', '', '', '', '', '', '', 0),
(646, 'NY', 'Balance (R/P in)', '2024-10-19', '1037', '200/300', '20', 2, 3, 'W', '', '', '', '', '', '', '', 0),
(647, 'NY', 'Balance (R/P in)', '2024-10-22', '1037', '150/200', '20', 23, 30, 'W', '', '', '', '', '', '', '', 0),
(648, 'NY', 'Ship/23', '2024-10-24', '1037', '150/200', '20', 30, 0, 'W', '', '', '', '', '', '', '', 0),
(649, 'NY', 'Ship/23', '2024-10-24', '1037', '200/300', '20', 3, 0, 'W', '', '', '', '', '', '', '', 0),
(650, 'NY', 'Ship/23', '2024-10-24', '1037', '100/200 1kg', '20', 20, -20, 'W', '', '', '', '', '', '', '', 0),
(651, 'NY', 'HHK To GFC cc to GFc', '2024-10-25', '1037', '150/200', '20', 16, 16, 'W', '', '', '', '', '', '', '', 573),
(652, 'NY', 'HHK To GFC cc to gfc', '2024-10-25', '1037', '200/300', '20', 3, 3, 'W', '', '', '', '', '', '', '', 574),
(653, 'NY', 'HHK To GFC CC to GFC', '2024-10-25', '1037', '100/200 1kg', '20', 25, 25, 'W', '', '', '', '', '', '', '', 575),
(654, 'NY', 'Ship/24', '2024-10-25', '1037', '150/200', '20', 16, 0, 'W', '', '', '', '', '', '', '', 0),
(655, 'NY', 'Ship/24', '2024-10-25', '1037', '200/300', '20', 3, 0, 'W', '', '', '', '', '', '', '', 0),
(656, 'NY', 'Ship/24', '2024-10-25', '1037', '100/200 1kg', '20', 25, -25, 'fillet', '', '', '', '', '', '', '', 0),
(657, 'NY', 'Balance', '2024-11-06', '1004', '500g x12bls', '6', 29, 29, 'Bls', '', '', '', '', '', '', '', 0),
(658, 'NY', 'HHK To GFC', '2024-11-05', '1023', '4up', '22', 1, 1, 'G', '', '', '', '', '', '', '', 584),
(659, 'NY', 'HHK To GFC', '2024-11-05', '1023', '4up', '23', 52, 89, 'G', '', '', '', '', '', '', '', 585),
(660, 'NY', 'HHK To GFC', '2024-11-05', '1023', '4up', '24', 14, 93, 'G', '', '', '', '', '', '', '', 586),
(661, 'NY', 'HHK To GFC', '2024-11-05', '1023', '5up', '22', 22, 40, 'G', '', '', '', '', '', '', '', 587),
(662, 'NY', 'HHK To GFC', '2024-11-05', '1023', '5up', '23', 22, 47, 'G', '', '', '', '', '', '', '', 588),
(663, 'NY', 'HHK To GFC', '2024-11-05', '1023', '6up', '19', 10, 14, 'G', '', '', '', '', '', '', '', 589),
(664, 'NY', 'HHK To GFC', '2024-11-05', '1023', '6up', '20', 11, 23, 'G', '', '', '', '', '', '', '', 590),
(665, 'NY', 'HHK To GFC', '2024-11-05', '1023', '7up', '22', 2, 2, 'G', '', '', '', '', '', '', '', 591),
(666, 'NY', 'Balance (R/P in)', '2024-10-08', '1031', '4up', '20', 1, 10, 'G', '', '', '', '', '', '', '', 0),
(667, 'NY', 'Balance (R/P in)', '2024-10-08', '1031', '4up', '22', 1, 30, 'G', '', '', '', '', '', '', '', 0),
(668, 'NY', 'Balance (R/P in)', '2024-10-08', '1031', '4up', '23', 3, -244, 'G', '', '', '', '', '', '', '', 0),
(669, 'NY', 'Balance (r/P in)', '2024-10-08', '1031', '5up', '21', 15, 21, 'G', '', '', '', '', '', '', '', 0),
(670, 'NY', 'Balance (R/P in)', '2024-10-08', '1031', '5up', '23', 13, 29, 'G', '', '', '', '', '', '', '', 0),
(671, 'NY', 'Balance', '2024-10-08', '1031', '5up', '21.8', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(672, 'can', 'HHK To GFC', '2024-11-05', '1031', '3up', '21', 6, 91, 'G', '', '', '', '', '', '', '', 594),
(673, 'can', 'HHK To GFC', '2024-11-05', '1031', '3up', '20', 6, -63, 'G', '', '', '', '', '', '', '', 595),
(674, 'can', 'HHK To GFC NT to GFC', '2024-11-06', '1031', '3up', '20', 5, -58, 'G', '', '', '', '', '', '', '', 596),
(675, 'can', 'HHK To GFC N:T to GFC', '2024-11-06', '1031', '2up', '20', 10, 221, 'G', '', '', '', '', '', '', '', 612),
(676, 'can', 'HHK To GFC NT to GFC', '2024-11-06', '1031', '2up', '21', 15, 88, 'G', '', '', '', '', '', '', '', 613),
(677, 'can', 'HHK To GFC', '2024-11-06', '1031', '3up', '22', 6, 59, 'G', '', '', '', '', '', '', '', 614),
(678, 'can', 'HHK To GFC NT toGFC', '2024-11-06', '1031', '3up', '23', 1, 12, 'G', '', '', '', '', '', '', '', 615);

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
  `remark` text NOT NULL,
  `fish_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hhkmcstock`
--

INSERT INTO `hhkmcstock` (`id`, `country`, `particular`, `date`, `commondity_id`, `size`, `kg`, `mc`, `balance_mc`, `loosein_size`, `loosein_kg`, `loosein_pcs`, `looseout_size`, `looseout_kg`, `looseout_pcs`, `remark`, `fish_type`) VALUES
(1, 'can', 'From Form-10', '2024-10-05', '1002', '1up', '20', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(2, 'can', 'From Form-10', '2024-10-05', '1002', '1.5up', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(3, 'can', 'From Form-10', '2024-10-05', '1002', '2up', '20', 6, 6, '', '', 0, '', '', 0, '', 'G'),
(6, 'can', 'From Form-10', '2024-10-05', '1002', '4up', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(7, 'can', 'From Form-10', '2024-10-05', '1002', '4up', '23', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(8, 'can', 'From Form-10', '2024-10-05', '1002', '5up', '22', 3, 3, '', '', 0, '', '', 0, '', 'G'),
(9, 'can', 'From Form-10', '2024-10-05', '1002', '6up', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(10, 'can', 'From Form-10', '2024-10-05', '1002', '7up', '24', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(11, 'can', 'From Form-10', '2024-10-05', '1001', '1.5up', '20', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(12, 'can', 'From Form-10', '2024-10-05', '1001', '2up', '20', 4, 4, '', '', 0, '', '', 0, '', 'G'),
(13, 'can', 'From Form-10', '2024-10-05', '1001', '3up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(14, 'can', 'From Form-10', '2024-10-05', '1001', '3up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(15, 'can', 'From Form-10', '2024-10-05', '1001', '3up', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(16, 'can', 'From Form-10', '2024-10-05', '1001', '4up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(17, 'can', 'Balance', '2024-10-04', '1020', '3up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(18, 'can', 'Balance', '2024-10-04', '1020', '3up', '23', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(19, 'can', 'Balance', '2024-10-04', '1020', '4up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(20, 'can', 'Balance', '2024-10-04', '1020', '4up', '24', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(21, 'can', 'Balance', '2024-10-04', '1020', '5up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(22, 'can', 'From Form-10', '2024-10-05', '1020', '3up', '22', 3, 4, '', '', 0, '', '', 0, '', 'G'),
(23, 'can', 'From Form-10', '2024-10-05', '1020', '4up', '23', 2, 3, '', '', 0, '', '', 0, '', 'G'),
(24, 'can', 'From Form-10', '2024-10-05', '1020', '5up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(25, 'can', 'From Form-10', '2024-10-05', '1020', '2up', '20', 3, 3, '', '', 0, '', '', 0, '', 'G'),
(26, 'can', 'From Form-10', '2024-10-05', '1020', '2up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(27, 'can', 'Balance', '2024-10-05', '1027', '4up', '23', 1, 1, '', '', 0, '', '', 0, '', 'Scaless'),
(28, 'can', 'Balance', '2024-10-05', '1027', '5up', '23', 1, 1, '', '', 0, '', '', 0, '', 'Scaless'),
(29, 'can', 'Balance', '2024-10-05', '1027', '3up', '23', 1, 1, '', '', 0, '', '', 0, '', 'Scaless'),
(30, 'can', 'Balance', '2024-10-05', '1027', '3up', '24', 1, 1, '', '', 0, '', '', 0, '', 'Scaless'),
(31, 'NY', 'Balance', '2024-10-05', '1023', '4up', '23', 18, 18, '', '', 0, '', '', 0, '', 'G'),
(32, 'NY', 'Balance', '2024-10-05', '1023', '4up', '24', 16, 16, '', '', 0, '', '', 0, '', 'G'),
(33, 'NY', 'Balance', '2024-10-05', '1023', '5up', '22', 14, 14, '', '', 0, '', '', 0, '', 'G'),
(34, 'NY', 'Balance', '2024-10-05', '1023', '5up', '23', 9, 9, '', '', 0, '', '', 0, '', 'G'),
(35, 'NY', 'Balance', '2024-10-05', '1023', '5up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(36, 'NY', 'Balance', '2024-10-05', '1023', '6up', '20', 4, 4, '', '', 0, '', '', 0, '', 'G'),
(37, 'NY', 'Balance', '2024-10-05', '1023', '6up', '19', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(38, 'NY', 'Balance', '2024-10-05', '1023', '7up', '24', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(39, 'NY', 'From Form-10', '2024-10-05', '1023', '4up', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(40, 'NY', 'From Form-10', '2024-10-05', '1023', '4up', '23', 1, 19, '', '', 0, '', '', 0, '', 'G'),
(41, 'NY', 'From Form-10', '2024-10-05', '1023', '4up', '24', 9, 25, '', '', 0, '', '', 0, '', 'G'),
(42, 'can', 'From Form-10', '2024-10-06', '1023', '6up', '20', 3, 7, '', '', 0, '', '', 0, '', 'G'),
(43, 'can', 'From Form-10', '2024-10-06', '1023', '6up', '19', 5, 7, '', '', 0, '', '', 0, '', 'G'),
(44, 'can', 'From Form-10', '2024-10-12', '1031', '500G x12bls', '6', 61, 61, '', '', 0, '', '', 0, '', 'Cut_piece'),
(45, 'NY', 'Balance', '2024-10-05', '1031', '4up', '24', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(46, 'NY', 'Balance', '2024-10-05', '1031', '4up', '20', 3, 3, '', '', 0, '', '', 0, '', 'G'),
(47, 'NY', 'Balance', '2024-10-05', '1031', '5up', '23', 14, 14, '', '', 0, '', '', 0, '', 'G'),
(48, 'NY', 'Balance', '2024-10-05', '1031', '6up', '20', 4, 4, '', '', 0, '', '', 0, '', 'G'),
(49, 'NY', 'Balance', '2024-10-05', '1031', '6up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(50, 'NY', 'Balance', '2024-10-05', '1031', '7up', '23', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(51, 'NY', 'From Form-10', '2024-10-05', '1031', '4up', '24', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(52, 'NY', 'From Form-10', '2024-10-05', '1031', '4up', '20', 10, 13, '', '', 0, '', '', 0, '', 'G'),
(53, 'NY', 'From Form-10', '2024-10-05', '1031', '5up', '22', 8, 8, '', '', 0, '', '', 0, '', 'G'),
(54, 'NY', 'From Form-10', '2024-10-05', '1031', '5up', '23', 40, 54, '', '', 0, '', '', 0, '', 'G'),
(55, 'NY', 'From Form-10', '2024-10-05', '1031', '6up', '19', 3, 3, '', '', 0, '', '', 0, '', 'G'),
(56, 'NY', 'From Form-10', '2024-10-05', '1031', '6up', '20', 28, 32, '', '', 0, '', '', 0, '', 'G'),
(57, 'NY', 'From Form-10', '2024-10-05', '1031', '7up', '22', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(58, 'NY', 'From Form-10', '2024-10-05', '1031', '7up', '23', 6, 8, '', '', 0, '', '', 0, '', 'G'),
(59, 'NY', 'From Form-10', '2024-10-05', '1031', '8up', '27', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(60, 'NY', 'From Form-10', '2024-10-05', '1031', '9up', '19', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(62, 'LM', 'Balance', '2024-10-05', '1005', '250g x 44 b', '11', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(63, 'LM', 'Balance', '2024-10-05', '1005', 'JB', '19.8', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(64, 'LM', 'Balance', '2024-10-05', '1005', 'Nocl JB', '20', 8, 8, '', '', 0, '', '', 0, '', 'G'),
(65, 'LM', 'Balance', '2024-10-05', '1043', '200/300', '20', 6, 6, '', '', 0, '', '', 0, '', 'G'),
(66, 'LM', 'Balance', '2024-10-05', '1043', '200/300', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(67, 'LM', 'Balance', '2024-10-05', '1019', 'JB', '20', 32, 32, '', '', 0, '', '', 0, '', 'G'),
(68, 'LM', 'Balance', '2024-10-05', '1019', '500g x 24 b', '12', 20, 20, '', '', 0, '', '', 0, '', 'G'),
(69, 'LM', 'Balance', '2024-10-05', '1019', 'IQF', '20', 9, 9, '', '', 0, '', '', 0, '', 'G'),
(70, 'LM', 'Balance', '2024-10-05', '1019', 'IQF', '15', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(71, 'LM', 'Balance', '2024-10-05', '1019', '500g x 12 b', '6', 9, 9, '', '', 0, '', '', 0, '', 'G'),
(72, 'LM', 'Balance', '2024-10-05', '1010', 'JB', '15', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(73, 'LM', 'Balance', '2024-10-05', '1010', 'JB', '20', 7, 7, '', '', 0, '', '', 0, '', 'G'),
(74, 'LM', 'Balance', '2024-10-05', '1025', 'mix', '20', 28, 28, '', '', 0, '', '', 0, '', 'W'),
(75, 'LM', 'Balance', '2024-10-05', '1025', 'mix', '18', 1, 1, '', '', 0, '', '', 0, '', 'W'),
(76, 'LM', 'Balance', '2024-10-05', '1001', 'IQF', '22.5', 1, 1, '', '', 0, '', '', 0, '', 'Cut_piece'),
(77, 'LM', 'Balance', '2024-10-05', '1001', 'JB', '18.6', 1, 1, '', '', 0, '', '', 0, '', 'Cut_piece'),
(78, 'LM', 'Balance', '2024-10-05', '1001', '500g x 24 b', '12', 1, 1, '', '', 0, '', '', 0, '', 'Cut_piece'),
(79, 'LM', 'Balance', '2024-10-05', '1035', 'JB', '20', 6, 6, '', '', 0, '', '', 0, '', 'G'),
(80, 'LM', 'Balance', '2024-10-05', '1035', 'JB', '18', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(81, 'LM', 'Balance', '2024-10-05', '1004', '250g', '9', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(82, 'LM', 'Balance', '2024-10-05', '1004', '250g x 44 b', '11', 19, 19, '', '', 0, '', '', 0, '', 'G'),
(83, 'LM', 'Balance', '2024-10-05', '1004', '500g x 24 b', '12', 72, 72, '', '', 0, '', '', 0, '', 'G'),
(84, 'LM', 'Balance', '2024-10-05', '1004', 'JB', '20', 15, 15, '', '', 0, '', '', 0, '', 'G'),
(85, 'LM', 'Balance', '2024-10-05', '1004', 'JB', '11.5', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(86, 'LM', 'Balance', '2024-10-05', '1004', 'IQF', '21.4', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(87, 'LM', 'Balance', '2024-10-05', '1004', 'IQF', '16', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(88, 'LM', 'Balance', '2024-10-05', '1004', 'Big JB', '20', 22, 22, '', '', 0, '', '', 0, '', 'G'),
(89, 'LM', 'Balance', '2024-10-05', '1004', 'JB', '22.4', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(90, 'LM', 'Balance', '2024-10-05', '1004', '500g x 17 b', '8.5', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(92, 'can', 'From Form-10', '2024-10-08', '1002', '1.5up', '20', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(93, 'can', 'From Form-10', '2024-10-08', '1002', '1.5up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(94, 'can', 'From Form-10', '2024-10-08', '1002', '2up', '20', 5, 11, '', '', 0, '', '', 0, '', 'G'),
(95, 'can', 'From Form-10', '2024-10-08', '1002', '2up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(97, 'can', 'From Form-10', '2024-10-08', '1002', '3up', '22', 3, 3, '', '', 0, '', '', 0, '', 'G'),
(98, 'can', 'From Form-10', '2024-10-08', '1002', '4up', '20', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(99, 'can', 'From Form-10', '2024-10-08', '1002', '4up', '23', 3, 5, '', '', 0, '', '', 0, '', 'G'),
(100, 'can', 'From Form-10', '2024-10-08', '1002', '5up', '22', 1, 4, '', '', 0, '', '', 0, '', 'G'),
(101, 'can', 'From Form-10', '2024-10-08', '1002', '5up', '23', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(102, 'can', 'From Form-10', '2024-10-08', '1002', '6up', '20', 2, 3, '', '', 0, '', '', 0, '', 'G'),
(103, 'can', 'From Form-10', '2024-10-08', '1002', '8up', '27', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(104, 'can', 'From Form-10', '2024-10-08', '1002', '10up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(105, 'can', 'From Form-10', '2024-10-08', '1002', '9up', '19.5', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(106, 'can', 'From Form-10', '2024-10-08', '1001', '1.5up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(107, 'can', 'From Form-10', '2024-10-08', '1001', '2up', '20', 8, 12, '', '', 0, '', '', 0, '', 'G'),
(108, 'can', 'From Form-10', '2024-10-08', '1001', '3up', '21', 2, 3, '', '', 0, '', '', 0, '', 'G'),
(109, 'can', 'From Form-10', '2024-10-08', '1001', '3up', '22', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(110, 'can', 'From Form-10', '2024-10-08', '1001', '4up', '23', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(111, 'can', 'From Form-10', '2024-10-08', '1001', '5up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(112, 'can', 'From Form-10', '2024-10-08', '1001', '6up', '19', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(113, 'can', 'From Form-10', '2024-10-08', '1020', '3up', '22', 2, 6, '', '', 0, '', '', 0, '', 'G'),
(114, 'can', 'From Form-10', '2024-10-08', '1020', '3up', '23', 1, 3, '', '', 0, '', '', 0, '', 'G'),
(115, 'can', 'From Form-10', '2024-10-08', '1020', '3up', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(116, 'can', 'From Form-10', '2024-10-08', '1020', '4up', '23', 2, 5, '', '', 0, '', '', 0, '', 'G'),
(117, 'can', 'From Form-10', '2024-10-08', '1020', '4up', '24', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(118, 'can', 'From Form-10', '2024-10-08', '1020', '4up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(119, 'can', 'From Form-10', '2024-10-08', '1020', '5up', '23', 2, 3, '', '', 0, '', '', 0, '', 'G'),
(120, 'can', 'From Form-10', '2024-10-08', '1020', '2up', '20', 4, 7, '', '', 0, '', '', 0, '', 'G'),
(121, 'can', 'From Form-10', '2024-10-08', '1020', '9up', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(122, 'can', 'From Form-10', '2024-10-06', '1023', '5up', '22', 9, 26, '', '', 0, '', '', 0, '', 'G'),
(123, 'can', 'From Form-10', '2024-10-06', '1023', '5up', '23', 1, 14, '', '', 0, '', '', 0, '', 'G'),
(124, 'can', 'balance (Hilsa bls)', '2024-10-14', '1015', '500G x12bls', '6', 14, 14, '', '', 0, '', '', 0, '', 'Bls'),
(125, 'can', 'From Form-10', '2024-10-12', '1031', '500G x12bls', '6', 27, 88, '', '', 0, '', '', 0, '', 'Cut_piece'),
(126, 'can', 'From Form-10', '2024-10-06', '1023', '7up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(127, 'can', 'From Form-10', '2024-10-06', '1023', '7up', '23', 2, 3, '', '', 0, '', '', 0, '', 'G'),
(129, 'can', 'HHK To GFC', '2024-10-08', '1002', '1up', '20', 2, 0, '', '', 0, '', '', 0, '', ''),
(130, 'can', 'HHK To GFC', '2024-10-08', '1002', '1.5up', '20', 1, 1, '', '', 0, '', '', 0, '', ''),
(131, 'can', 'HHK To GFC', '2024-10-08', '1002', '2up', '20', 6, 5, '', '', 0, '', '', 0, '', ''),
(134, 'can', 'HHK To GFC', '2024-10-08', '1002', '4up', '20', 1, 1, '', '', 0, '', '', 0, '', ''),
(135, 'can', 'HHK To GFC', '2024-10-08', '1002', '4up', '23', 2, 3, '', '', 0, '', '', 0, '', ''),
(136, 'can', 'HHK To GFC', '2024-10-08', '1002', '5up', '22', 3, 1, '', '', 0, '', '', 0, '', 'G'),
(137, 'can', 'HHK To GFC', '2024-10-08', '1002', '6up', '20', 1, 2, '', '', 0, '', '', 0, '', ''),
(138, 'can', 'HHK To GFC', '2024-10-08', '1002', '7up', '24', 1, 0, '', '', 0, '', '', 0, '', ''),
(139, 'can', 'HHK To GFC', '2024-10-08', '1002', '1.5up', '20', 1, 0, '', '', 0, '', '', 0, '', ''),
(140, 'can', 'HHK To GFC', '2024-10-10', '1002', '2up', '20', 5, 0, '', '', 0, '', '', 0, '', 'G'),
(141, 'can', 'From Form 10', '2024-10-05', '1002', '3up', '21', 10, 10, '', '', 0, '', '', 0, '', 'G'),
(142, 'can', 'From Form 10', '2024-10-08', '1002', '3up', '21', 3, 13, '', '', 0, '', '', 0, '', 'G'),
(143, 'can', 'HHK To GFC', '2024-10-10', '1002', '4up', '20', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(144, 'can', 'HHK To GFC', '2024-10-10', '1002', '4up', '23', 3, 0, '', '', 0, '', '', 0, '', 'G'),
(145, 'can', 'HHK To GFC', '2024-10-08', '1002', '', '', 0, 0, '', '', 0, '', '', 0, '', 'G'),
(146, 'can', 'HHK To GFC', '2024-10-10', '1002', '6up', '20', 2, 0, '', '', 0, '', '', 0, '', 'G'),
(147, 'can', 'From Form-10', '2024-10-15', '1036', '500g', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(148, 'can', 'HHK to GFC', '2024-10-08', '1001', '1.5up', '20', 2, 0, '', '', 0, '', '', 0, '', 'G'),
(149, 'can', 'From Form-10', '2024-10-15', '1036', '1up', '20', 11, 11, '', '', 0, '', '', 0, '', 'G'),
(150, 'can', 'From Form 10', '2024-10-23', '1036', '800g', '20', 7, 7, '', '', 0, '', '', 0, '', 'G'),
(151, 'can', 'HHK To GFC', '2024-10-23', '1036', '1up', '20', 11, 0, '', '', 0, '', '', 0, '', ''),
(152, 'can', 'HHK To GFC', '2024-10-23', '1036', '500g', '20', 1, 0, '', '', 0, '', '', 0, '', ''),
(153, 'can', 'From Form-10', '2024-10-05', '1002', '3up', '22', 1, 4, '', '', 0, '', '', 0, '', 'G'),
(154, 'can', 'From Form-10', '2024-10-05', '1002', '1.5up', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(155, 'can', 'From Form-10', '2024-10-05', '1002', '1.5up', '20', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(156, 'can', 'HHK To GFC', '2024-10-10', '1002', '2up', '21', 1, 0, '', '', 0, '', '', 0, '', ''),
(157, 'can', 'HHK to GFC', '2024-10-08', '1002', '3up', '21', 10, 3, '', '', 0, '', '', 0, '', 'G'),
(158, 'can', 'HHK To GFC', '2024-10-08', '1002', '3up', '22', 1, 3, '', '', 0, '', '', 0, '', ''),
(159, 'can', 'HHK To GFC', '2024-10-10', '1002', '5up', '22', 1, 0, '', '', 0, '', '', 0, '', ''),
(160, 'can', 'HHK To GFC', '2024-10-10', '1002', '5up', '23', 2, 0, '', '', 0, '', '', 0, '', ''),
(161, 'can', 'HHK To GFC', '2024-10-08', '1001', '2up', '20', 4, 8, '', '', 0, '', '', 0, '', ''),
(162, 'can', 'HHK To GFC', '2024-10-08', '1001', '3up', '21', 1, 2, '', '', 0, '', '', 0, '', ''),
(163, 'can', 'HHK To GFC', '2024-10-08', '1001', '3up', '22', 1, 1, '', '', 0, '', '', 0, '', ''),
(164, 'can', 'HHK To GFC', '2024-10-08', '1001', '3up', '20', 1, 0, '', '', 0, '', '', 0, '', ''),
(165, 'can', 'HHK To GFC', '2024-10-08', '1001', '4up', '23', 1, 1, '', '', 0, '', '', 0, '', ''),
(166, 'can', 'HHK To GFC', '2024-10-10', '1001', '1.5up', '21', 1, 0, '', '', 0, '', '', 0, '', ''),
(167, 'can', 'HHK To GFC', '2024-10-10', '1001', '2up', '20', 8, 0, '', '', 0, '', '', 0, '', ''),
(168, 'can', 'HHK To GFC', '2024-10-10', '1001', '3up', '21', 2, 0, '', '', 0, '', '', 0, '', ''),
(169, 'can', 'HHK To GFC', '2024-10-10', '1002', '3up', '22', 1, 2, '', '', 0, '', '', 0, '', ''),
(170, 'can', 'HHK To GFC', '2024-10-10', '1001', '4up', '23', 1, 0, '', '', 0, '', '', 0, '', ''),
(171, 'can', 'HHK To GFC', '2024-10-10', '1001', '5up', '23', 1, 0, '', '', 0, '', '', 0, '', ''),
(172, 'can', 'HHK To GFC', '2024-10-10', '1001', '6up', '19', 1, 0, '', '', 0, '', '', 0, '', ''),
(173, 'can', 'HHK To GFC', '2024-10-10', '1001', '3up', '22', 1, 0, '', '', 0, '', '', 0, '', ''),
(174, 'can', 'HHK To GFC', '2024-10-10', '1002', '10up', '22', 1, 0, '', '', 0, '', '', 0, '', ''),
(175, 'can', 'HHK To GFC', '2024-10-08', '1020', '3up', '22', 4, 2, '', '', 0, '', '', 0, '', ''),
(176, 'can', 'HHK To GFC', '2024-10-08', '1020', '3up', '23', 2, 1, '', '', 0, '', '', 0, '', ''),
(177, 'can', 'HHK To GFC', '2024-10-08', '1020', '4up', '23', 3, 2, '', '', 0, '', '', 0, '', ''),
(178, 'can', 'HHK To GFC', '2024-10-08', '1020', '4up', '24', 1, 1, '', '', 0, '', '', 0, '', ''),
(179, 'can', 'HHK To GFC', '2024-10-08', '1020', '5up', '23', 1, 2, '', '', 0, '', '', 0, '', ''),
(180, 'can', 'HHK To GFC', '2024-10-08', '1020', '5up', '22', 1, 0, '', '', 0, '', '', 0, '', ''),
(181, 'can', 'HHK To GFC', '2024-10-08', '1020', '2up', '20', 3, 4, '', '', 0, '', '', 0, '', ''),
(182, 'can', 'HHK To GFC', '2024-10-08', '1020', '2up', '21', 1, 0, '', '', 0, '', '', 0, '', ''),
(183, 'can', 'HHK To GFC', '2024-10-10', '1020', '3up', '22', 2, 0, '', '', 0, '', '', 0, '', ''),
(184, 'can', 'HHK To GFC', '2024-10-10', '1020', '3up', '23', 1, 0, '', '', 0, '', '', 0, '', ''),
(185, 'can', 'HHK To GFC', '2024-10-10', '1020', '3up', '20', 1, 0, '', '', 0, '', '', 0, '', ''),
(186, 'can', 'HHK To GFC', '2024-10-10', '1020', '4up', '23', 2, 0, '', '', 0, '', '', 0, '', ''),
(187, 'can', 'HHK To GFC', '2024-10-10', '1020', '4up', '22', 1, 0, '', '', 0, '', '', 0, '', ''),
(188, 'can', 'HHK To GFC', '2024-10-10', '1020', '4up', '21', 1, -1, '', '', 0, '', '', 0, '', ''),
(189, 'can', 'HHK To GFC', '2024-10-10', '1020', '5up', '23', 2, 0, '', '', 0, '', '', 0, '', ''),
(190, 'can', 'HHK To GFC', '2024-10-10', '1020', '2up', '20', 4, 0, '', '', 0, '', '', 0, '', ''),
(191, 'can', 'HHK To GFC', '2024-10-10', '1020', '9up', '20', 1, 0, '', '', 0, '', '', 0, '', ''),
(192, 'can', 'From Form-10', '2024-10-11', '1020', '3up', '22', 3, 3, '', '', 0, '', '', 0, '', 'G'),
(193, 'can', 'From Form-10', '2024-10-11', '1020', '3up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(194, 'can', 'From Form-10', '2024-10-11', '1020', '3up', '21', 5, 5, '', '', 0, '', '', 0, '', 'G'),
(195, 'can', 'From Form-10', '2024-10-11', '1020', '4up', '23', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(196, 'can', 'From Form-10', '2024-10-11', '1020', '4up', '24', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(197, 'can', 'From Form-10', '2024-10-11', '1020', '5up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(198, 'can', 'From Form-10', '2024-10-11', '1020', '5up', '22', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(199, 'can', 'From Form-10', '2024-10-11', '1020', '5up', '24', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(200, 'can', 'From Form-10', '2024-10-11', '1020', '2up', '20', 8, 8, '', '', 0, '', '', 0, '', 'G'),
(201, 'can', 'From Form-10', '2024-10-11', '1020', '2up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(202, 'can', 'From Form-10', '2024-10-11', '1020', '7up', '22.5', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(203, 'can', 'From Form-10', '2024-10-11', '1020', '7up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(204, 'can', 'From Form-10', '2024-10-11', '1020', '7up', '24', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(205, 'can', 'From Form-10', '2024-10-11', '1020', '6up', '19', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(206, 'can', 'HHK To GFC', '2024-10-12', '1020', '3up', '22', 3, 0, '', '', 0, '', '', 0, '', ''),
(207, 'can', 'HHK To GFC', '2024-10-12', '1020', '3up', '23', 1, 0, '', '', 0, '', '', 0, '', ''),
(208, 'can', 'HHK To GFC', '2024-10-12', '1020', '3up', '21', 5, 0, '', '', 0, '', '', 0, '', ''),
(209, 'can', 'HHK To GFC', '2024-10-12', '1020', '4up', '23', 2, 0, '', '', 0, '', '', 0, '', ''),
(210, 'can', 'HHK To GFC', '2024-10-12', '1020', '4up', '24', 1, 1, '', '', 0, '', '', 0, '', ''),
(211, 'can', 'HHK To GFC', '2024-10-12', '1020', '5up', '23', 1, 0, '', '', 0, '', '', 0, '', ''),
(212, 'can', 'HHK To GFC', '2024-10-12', '1020', '5up', '22', 2, 0, '', '', 0, '', '', 0, '', 'G'),
(213, 'can', 'HHK To GFC', '2024-10-12', '1020', '5up', '24', 1, 0, '', '', 0, '', '', 0, '', ''),
(214, 'can', 'HHK To GFC', '2024-10-12', '1020', '2up', '20', 8, 0, '', '', 0, '', '', 0, '', ''),
(215, 'can', 'HHK To GFC', '2024-10-12', '1020', '2up', '21', 1, 0, '', '', 0, '', '', 0, '', ''),
(216, 'can', 'HHK To GFC', '2024-10-12', '1020', '7up', '22.5', 1, 0, '', '', 0, '', '', 0, '', ''),
(217, 'can', 'HHK To GFC', '2024-10-12', '1020', '7up', '23', 1, 0, '', '', 0, '', '', 0, '', ''),
(218, 'can', 'HHK To GFC', '2024-10-12', '1020', '7up', '24', 1, 0, '', '', 0, '', '', 0, '', ''),
(219, 'can', 'HHK To GFC', '2024-10-12', '1020', '6up', '19', 1, 0, '', '', 0, '', '', 0, '', ''),
(220, 'can', 'From Form-10(SL)', '2024-10-11', '1023', '3up', '21', 11, 11, '', '', 0, '', '', 0, '', 'G'),
(221, 'can', 'From Form-10(SL)', '2024-10-11', '1002', '3up', '22', 12, 14, '', '', 0, '', '', 0, '', 'G'),
(222, 'can', 'From Form-10(SL)', '2024-10-11', '1023', '3up', '22', 12, 12, '', '', 0, '', '', 0, '', 'G'),
(223, 'can', 'From Form-10(SL)', '2024-10-14', '1023', '3up', '21', 12, 23, '', '', 0, '', '', 0, '', 'G'),
(224, 'can', 'From Form-10(SL)', '2024-10-14', '1023', '3up', '22', 19, 31, '', '', 0, '', '', 0, '', 'G'),
(225, 'can', 'HHK To GFC(SL)', '2024-10-14', '1023', '3up', '21', 12, 11, '', '', 0, '', '', 0, '', ''),
(226, 'can', 'HHK To GFC(sl)', '2024-10-14', '1002', '3up', '22', 11, 3, '', '', 0, '', '', 0, '', ''),
(227, 'can', 'HHK To GFC(sl)', '2024-10-14', '1023', '3up', '22', 11, 20, '', '', 0, '', '', 0, '', ''),
(228, 'can', 'HHK To GFC (sl)', '2024-10-23', '1023', '3up', '21', 12, -1, '', '', 0, '', '', 0, '', ''),
(229, 'can', 'HHK To GFC(sl)', '2024-10-23', '1023', '3up', '22', 19, 1, '', '', 0, '', '', 0, '', ''),
(230, 'can', 'From Form-10', '2024-10-14', '1026', '8/10', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(231, 'can', 'From Form-10', '2024-10-14', '1026', '1up', '20', 4, 4, '', '', 0, '', '', 0, '', 'G'),
(232, 'can', 'From Form-10', '2024-10-14', '1026', '1.5up', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(233, 'can', 'From Form-10', '2024-10-15', '1026', '8/10', '20', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(234, 'can', 'From Form-10', '2024-10-15', '1026', '1up', '20', 1, 5, '', '', 0, '', '', 0, '', 'G'),
(235, 'can', 'From Form-10', '2024-10-15', '1026', '1.5up', '20', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(236, 'can', 'From Form-10', '2024-10-15', '1026', '1.5up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(237, 'can', 'From Form-10', '2024-10-15', '1026', '2up', '20', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(238, 'can', 'HHK To GFC', '2024-10-23', '1026', '8/10', '20', 2, 0, '', '', 0, '', '', 0, '', ''),
(239, 'can', 'HHK To GFC', '2024-10-23', '1026', '1up', '20', 5, 0, '', '', 0, '', '', 0, '', ''),
(240, 'can', 'HHK To GFC', '2024-10-23', '1026', '1.5up', '20', 2, 0, '', '', 0, '', '', 0, '', ''),
(241, 'can', 'HHK To GFC', '2024-10-23', '1026', '1.5up', '21', 1, 0, '', '', 0, '', '', 0, '', ''),
(242, 'can', 'HHK To GFC', '2024-10-23', '1026', '2up', '20', 2, 0, '', '', 0, '', '', 0, '', ''),
(243, 'can', 'HHK To GFC (G)', '2024-10-23', '1036', '800g', '20', 7, 0, '', '', 0, '', '', 0, '', ''),
(244, 'can', 'HHK To GFC sl', '2024-10-08', '1027', '4up', '23', 1, 0, '', '', 0, '', '', 0, '', ''),
(245, 'can', 'HHK To GFC sl', '2024-10-08', '1027', '5up', '23', 1, 0, '', '', 0, '', '', 0, '', ''),
(246, 'can', 'HHK To GFC sl', '2024-10-08', '1027', '3up', '23', 1, 0, '', '', 0, '', '', 0, '', ''),
(247, 'can', 'HHK To GFCsl', '2024-10-08', '1027', '3up', '24', 1, 0, '', '', 0, '', '', 0, '', ''),
(248, 'can', 'HHK To GFC', '2024-10-12', '1031', '500G x12bls', '6', 27, 61, '', '', 0, '', '', 0, '', ''),
(249, 'can', 'From Form-10', '2024-10-14', '1031', '500G x12bls', '6', 41, 102, '', '', 0, '', '', 0, '', 'Cut_piece'),
(250, 'can', 'HHK To GFC', '2024-10-14', '1031', '500G x12bls', '6', 78, 24, '', '', 0, '', '', 0, '', ''),
(251, 'can', 'From Form-10', '2024-10-14', '1031', '500G x12bls', '6', 17, 41, '', '', 0, '', '', 0, '', 'G'),
(252, 'can', 'HHK To GFC', '2024-10-23', '1031', '500G x12bls', '6', 41, 0, '', '', 0, '', '', 0, '', ''),
(253, 'NY', 'From Form-10', '2024-10-14', '1031', '500G x12bls', '6', 16, 16, '', '', 0, '', '', 0, '', 'Cut_piece'),
(254, 'NY', 'From Form-10', '2024-10-14', '1031', '500G x24bls', '12', 4, 4, '', '', 0, '', '', 0, '', 'Cut_piece'),
(255, 'NY', 'From Form-10', '2024-10-15', '1031', '500G x24bls', '12', 12, 16, '', '', 0, '', '', 0, '', 'Cut_piece'),
(256, 'NY', 'HHK To GFC', '2024-10-23', '1031', '500G x12bls', '6', 16, 0, '', '', 0, '', '', 0, '', ''),
(257, 'NY', 'HHK To GFC', '2024-10-23', '1031', '500G x24bls', '12', 4, 12, '', '', 0, '', '', 0, '', ''),
(258, 'LM', 'From Form-10', '2024-10-12', '1031', '500G x24bls', '12', 2, 2, '', '', 0, '', '', 0, '', 'Cut_piece'),
(259, 'LM', 'HHK To GFC', '2024-10-14', '1031', '500G x24bls', '12', 2, 0, '', '', 0, '', '', 0, '', ''),
(260, 'NY', 'From Form-10', '2024-10-05', '1023', '5up', '22', 3, 17, '', '', 0, '', '', 0, '', 'G'),
(261, 'NY', 'From Form-10', '2024-10-05', '1023', '5up', '23', 4, 13, '', '', 0, '', '', 0, '', 'G'),
(262, 'NY', 'From Form-10', '2024-10-05', '1023', '6up', '20', 3, 7, '', '', 0, '', '', 0, '', 'G'),
(263, 'NY', 'From Form-10', '2024-10-06', '1023', '4up', '20', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(264, 'NY', 'From Form-10', '2024-10-06', '1023', '4up', '23', 18, 37, '', '', 0, '', '', 0, '', 'G'),
(265, 'NY', 'From Form-10', '2024-10-06', '1023', '4up', '24', 24, 49, '', '', 0, '', '', 0, '', 'G'),
(266, 'NY', 'From Form-10', '2024-10-06', '1023', '5up', '22', 9, 26, '', '', 0, '', '', 0, '', 'G'),
(267, 'NY', 'From Form-10', '2024-10-06', '1023', '5up', '23', 8, 21, '', '', 0, '', '', 0, '', 'G'),
(268, 'NY', 'From Form-10', '2024-10-08', '1023', '4up', '20', 2, 4, '', '', 0, '', '', 0, '', 'G'),
(269, 'NY', 'From Form-10', '2024-10-08', '1023', '4up', '23', 6, 43, '', '', 0, '', '', 0, '', 'G'),
(270, 'NY', 'From Form-10', '2024-10-08', '1023', '4up', '24', 19, 68, '', '', 0, '', '', 0, '', 'G'),
(271, 'NY', 'From Form-10', '2024-10-08', '1023', '5up', '22', 9, 35, '', '', 0, '', '', 0, '', 'G'),
(272, 'NY', 'From Form-10', '2024-10-08', '1023', '5up', '23', 11, 32, '', '', 0, '', '', 0, '', 'G'),
(273, 'NY', 'From Form-10', '2024-10-08', '1023', '6up', '20', 4, 11, '', '', 0, '', '', 0, '', 'G'),
(274, 'NY', 'From Form-10', '2024-10-08', '1023', '6up', '19', 3, 5, '', '', 0, '', '', 0, '', 'G'),
(275, 'NY', 'From Form-10', '2024-10-08', '1023', '7up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(276, 'NY', 'From Form-10', '2024-10-09', '1023', '4up', '23', 7, 50, '', '', 0, '', '', 0, '', 'G'),
(277, 'NY', 'From Form-10', '2024-10-09', '1023', '4up', '24', 23, 91, '', '', 0, '', '', 0, '', 'G'),
(278, 'NY', 'From Form-10', '2024-10-09', '1023', '5up', '22', 10, 45, '', '', 0, '', '', 0, '', 'G'),
(279, 'NY', 'From Form-10', '2024-10-09', '1023', '5up', '23', 10, 42, '', '', 0, '', '', 0, '', 'G'),
(280, 'NY', 'From Form-10', '2024-10-09', '1023', '6up', '20', 2, 13, '', '', 0, '', '', 0, '', 'G'),
(281, 'NY', 'From Form-10', '2024-10-09', '1023', '6up', '19', 1, 6, '', '', 0, '', '', 0, '', 'G'),
(282, 'NY', 'From Form-10', '2024-10-09', '1023', '7up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(283, 'NY', 'From Form-10', '2024-10-11', '1023', '4up', '20', 4, 8, '', '', 0, '', '', 0, '', 'G'),
(284, 'NY', 'From Form-10', '2024-10-11', '1023', '4up', '23', 2, 52, '', '', 0, '', '', 0, '', 'G'),
(285, 'NY', 'From Form-10', '2024-10-11', '1023', '4up', '24', 1, 92, '', '', 0, '', '', 0, '', 'G'),
(286, 'NY', 'From Form-10', '2024-10-11', '1023', '4up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(287, 'NY', 'From Form-10', '2024-10-11', '1023', '4up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(288, 'NY', 'From Form-10', '2024-10-11', '1023', '5up', '22', 11, 56, '', '', 0, '', '', 0, '', 'G'),
(289, 'NY', 'From Form-10', '2024-10-11', '1023', '5up', '23', 15, 57, '', '', 0, '', '', 0, '', 'G'),
(290, 'NY', 'From Form-10', '2024-10-11', '1023', '6up', '20', 13, 26, '', '', 0, '', '', 0, '', 'G'),
(291, 'NY', 'From Form-10', '2024-10-11', '1023', '6up', '19', 4, 10, '', '', 0, '', '', 0, '', 'G'),
(292, 'NY', 'From Form-10', '2024-10-11', '1023', '7up', '22', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(293, 'NY', 'From Form-10', '2024-10-11', '1023', '7up', '23', 3, 4, '', '', 0, '', '', 0, '', 'G'),
(294, 'NY', 'From Form-10', '2024-10-11', '1023', '8up', '27', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(295, 'NY', 'From Form-10', '2024-10-11', '1023', '9up', '19', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(296, 'NY', 'From Form-10', '2024-10-11', '1023', '10up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(297, 'NY', 'From Form-10', '2024-10-12', '1023', '2up', '20', 13, 13, '', '', 0, '', '', 0, '', 'G'),
(298, 'NY', 'From Form-10', '2024-10-12', '1023', '2up', '21', 7, 7, '', '', 0, '', '', 0, '', 'G'),
(299, 'NY', 'From Form-10', '2024-10-14', '1023', '4up', '22', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(300, 'NY', 'From Form-10', '2024-10-14', '1023', '5up', '22', 5, 61, '', '', 0, '', '', 0, '', 'G'),
(301, 'NY', 'From Form-10', '2024-10-14', '1023', '5up', '23', 3, 60, '', '', 0, '', '', 0, '', 'G'),
(302, 'NY', 'From Form-10', '2024-10-14', '1023', '6up', '20', 1, 27, '', '', 0, '', '', 0, '', 'G'),
(303, 'NY', 'From Form-10', '2024-10-14', '1023', '6up', '19', 3, 13, '', '', 0, '', '', 0, '', 'G'),
(304, 'NY', 'From Form-10', '2024-10-14', '1023', '2up', '20', 53, 66, '', '', 0, '', '', 0, '', 'G'),
(305, 'NY', 'From Form-10', '2024-10-15', '1023', '4up', '20', 1, 9, '', '', 0, '', '', 0, '', 'G'),
(306, 'NY', 'From Form-10', '2024-10-15', '1023', '4up', '24', 1, 93, '', '', 0, '', '', 0, '', 'G'),
(307, 'NY', 'From Form-10', '2024-10-15', '1023', '5up', '22', 26, 87, '', '', 0, '', '', 0, '', 'G'),
(308, 'NY', 'From Form-10', '2024-10-15', '1023', '5up', '23', 6, 66, '', '', 0, '', '', 0, '', 'G'),
(309, 'NY', 'From Form-10', '2024-10-15', '1023', '5up', '21', 4, 5, '', '', 0, '', '', 0, '', 'G'),
(310, 'NY', 'From Form-10', '2024-10-15', '1023', '6up', '20', 8, 35, '', '', 0, '', '', 0, '', 'G'),
(311, 'NY', 'From Form-10', '2024-10-15', '1023', '6up', '19', 2, 15, '', '', 0, '', '', 0, '', 'G'),
(312, 'NY', 'From Form-10', '2024-10-15', '1023', '7up', '22', 1, 3, '', '', 0, '', '', 0, '', 'G'),
(313, 'NY', 'From Form-10', '2024-10-06', '1031', '4up', '20', 3, 16, '', '', 0, '', '', 0, '', 'G'),
(314, 'NY', 'From Form-10', '2024-10-06', '1031', '5up', '22', 4, 12, '', '', 0, '', '', 0, '', 'G'),
(315, 'NY', 'From Form-10', '2024-10-06', '1031', '5up', '23', 8, 62, '', '', 0, '', '', 0, '', 'G'),
(316, 'NY', 'From Form-10', '2024-10-06', '1031', '6up', '19', 1, 4, '', '', 0, '', '', 0, '', 'G'),
(317, 'NY', 'From Form-10', '2024-10-06', '1031', '6up', '20', 2, 34, '', '', 0, '', '', 0, '', 'G'),
(318, 'NY', 'From Form-10', '2024-10-08', '1031', '4up', '24', 2, 4, '', '', 0, '', '', 0, '', 'G'),
(319, 'NY', 'From Form-10', '2024-10-08', '1031', '4up', '20', 10, 26, '', '', 0, '', '', 0, '', 'G'),
(321, 'NY', 'From Form-10', '2024-10-08', '1031', '5up', '23', 31, 93, '', '', 0, '', '', 0, '', 'G'),
(322, 'NY', 'From Form-10', '2024-10-08', '1031', '6up', '19', 3, 7, '', '', 0, '', '', 0, '', 'G'),
(323, 'NY', 'From Form-10', '2024-10-08', '1031', '6up', '20', 21, 55, '', '', 0, '', '', 0, '', 'G'),
(324, 'NY', 'From Form-10', '2024-10-08', '1031', '7up', '23', 6, 14, '', '', 0, '', '', 0, '', 'G'),
(325, 'NY', 'From Form-10', '2024-10-08', '1031', '8up', '25', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(326, 'NY', 'From Form-10', '2024-10-08', '1031', '9up', '19.5', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(327, 'NY', 'From Form-10', '2024-10-08', '1031', '8up', '26', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(328, 'NY', 'From Form-10', '2024-10-08', '1031', '5up', '22', 30, 42, '', '', 0, '', '', 0, '', 'G'),
(329, 'NY', 'From Form-10', '2024-10-08', '1031', '4up', '24', 2, 6, '', '', 0, '', '', 0, '', 'G'),
(330, 'NY', 'From Form-10', '2024-10-08', '1031', '4up', '20', 2, 28, '', '', 0, '', '', 0, '', 'G'),
(331, 'NY', 'From Form-10', '2024-10-09', '1031', '5up', '22', 14, 56, '', '', 0, '', '', 0, '', 'G'),
(332, 'NY', 'From Form-10', '2024-10-09', '1031', '5up', '23', 18, 111, '', '', 0, '', '', 0, '', 'G'),
(333, 'NY', 'From Form-10', '2024-10-09', '1031', '6up', '19', 4, 11, '', '', 0, '', '', 0, '', 'G'),
(334, 'NY', 'From Form-10', '2024-10-09', '1031', '6up', '20', 14, 69, '', '', 0, '', '', 0, '', 'G'),
(335, 'NY', 'From Form-10', '2024-10-09', '1031', '6up', '21', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(336, 'NY', 'From Form-10', '2024-10-09', '1031', '7up', '23', 10, 24, '', '', 0, '', '', 0, '', 'G'),
(337, 'NY', 'From Form-10', '2024-10-09', '1031', '7up', '22', 2, 4, '', '', 0, '', '', 0, '', 'G'),
(338, 'NY', 'From Form-10', '2024-10-09', '1031', '8up', '25', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(339, 'NY', 'From Form-10', '2024-10-09', '1031', '9up', '19.5', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(340, 'NY', 'From Form-10', '2024-10-11', '1031', '4up', '23', 6, 6, '', '', 0, '', '', 0, '', 'G'),
(341, 'NY', 'From Form-10', '2024-10-11', '1031', '4up', '24', 4, 10, '', '', 0, '', '', 0, '', 'G'),
(342, 'NY', 'From Form-10', '2024-10-11', '1031', '4up', '20', 3, 31, '', '', 0, '', '', 0, '', 'G'),
(343, 'NY', 'From Form-10', '2024-10-11', '1031', '5up', '21', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(344, 'NY', 'From Form-10', '2024-10-11', '1031', '5up', '22', 16, 72, '', '', 0, '', '', 0, '', 'G'),
(345, 'NY', 'From Form-10', '2024-10-11', '1031', '5up', '23', 9, 120, '', '', 0, '', '', 0, '', 'G'),
(346, 'NY', 'From Form-10', '2024-10-11', '1031', '6up', '19', 4, 15, '', '', 0, '', '', 0, '', 'G'),
(347, 'NY', 'From Form-10', '2024-10-11', '1031', '6up', '20', 5, 74, '', '', 0, '', '', 0, '', 'G'),
(348, 'NY', 'From Form-10', '2024-10-12', '1031', '2up', '20', 21, 21, '', '', 0, '', '', 0, '', 'G'),
(349, 'NY', 'From Form-10', '2024-10-12', '1031', '2up', '21', 26, 26, '', '', 0, '', '', 0, '', 'G'),
(350, 'NY', 'From Form-10', '2024-10-12', '1031', '3up', '21', 31, 31, '', '', 0, '', '', 0, '', 'G'),
(351, 'NY', 'From Form-10', '2024-10-12', '1031', '3up', '22', 6, 6, '', '', 0, '', '', 0, '', 'G'),
(352, 'NY', 'From Form-10', '2024-10-11', '1031', '7up', '22', 1, 5, '', '', 0, '', '', 0, '', 'G'),
(353, 'NY', 'From Form-10', '2024-10-11', '1031', '7up', '22.5', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(354, 'NY', 'From Form-10', '2024-10-12', '1031', '4up', '23', 1, 7, '', '', 0, '', '', 0, '', 'G'),
(355, 'NY', 'From Form-10', '2024-10-12', '1031', '4up', '20', 2, 33, '', '', 0, '', '', 0, '', 'G'),
(356, 'NY', 'From Form-10', '2024-10-12', '1031', '5up', '22', 7, 79, '', '', 0, '', '', 0, '', 'G'),
(357, 'NY', 'From Form-10', '2024-10-12', '1031', '5up', '23', 19, 139, '', '', 0, '', '', 0, '', 'G'),
(358, 'NY', 'From Form-10', '2024-10-12', '1031', '6up', '19', 2, 17, '', '', 0, '', '', 0, '', 'G'),
(359, 'NY', 'From Form-10', '2024-10-14', '1031', '500G x12bls', '6', 16, 16, '', '', 0, '', '', 0, '', 'Cut_piece'),
(360, 'NY', 'From Form-10', '2024-10-12', '1031', '6up', '21', 1, 3, '', '', 0, '', '', 0, '', 'G'),
(361, 'NY', 'From Form-10', '2024-10-12', '1031', '7up', '22', 1, 6, '', '', 0, '', '', 0, '', 'G'),
(362, 'NY', 'From Form-10', '2024-10-12', '1031', '7up', '23', 3, 27, '', '', 0, '', '', 0, '', 'G'),
(363, 'NY', 'From Form-10', '2024-10-12', '1031', '8up', '25', 1, 3, '', '', 0, '', '', 0, '', 'G'),
(364, 'NY', 'From Form-10', '2024-10-12', '1031', '8up', '26', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(365, 'NY', 'From Form-10', '2024-10-12', '1031', '6up', '20', 12, 86, '', '', 0, '', '', 0, '', 'G'),
(366, 'NY', 'Balance', '2024-10-25', '1019', '500G x12Bls', '6', 33, 33, '', '', 0, '', '', 0, '', 'W'),
(367, 'NY', 'Balance', '2024-10-11', '1017', '7up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(368, 'NY', 'Balance', '2024-10-11', '1017', '7up', '23', 3, 3, '', '', 0, '', '', 0, '', 'G'),
(369, 'NY', 'HHK To GFC', '2024-10-12', '1017', '7up', '22', 1, 0, '', '', 0, '', '', 0, '', ''),
(370, 'NY', 'HHK To GFC', '2024-10-12', '1017', '7up', '23', 3, 0, '', '', 0, '', '', 0, '', ''),
(371, 'NY', 'Balance (NT)', '2024-10-22', '1027', '3up', '21', 4, 4, '', '', 0, '', '', 0, '', 'G'),
(372, 'NY', 'Balance (NT)', '2024-10-22', '1027', '3up', '22', 5, 5, '', '', 0, '', '', 0, '', 'G'),
(373, 'NY', 'Balance (NT)', '2024-10-22', '1027', '4up', '23', 6, 6, '', '', 0, '', '', 0, '', 'G'),
(374, 'NY', 'Balance  (NT)', '2024-10-22', '1027', '4up', '24', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(375, 'NY', 'Balance  (NT)', '2024-10-22', '1027', '5up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(376, 'NY', 'Balance (NT)', '2024-10-22', '1027', '5up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(377, 'NY', 'Balance (NT)', '2024-10-22', '1027', '5up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(378, 'NY', 'Balance (NT)', '2024-10-22', '1027', '7up', '22.5', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(379, 'NY', 'HHK To GFC (NT to GFC)', '2024-10-23', '1027', '3up', '21', 4, 0, '', '', 0, '', '', 0, '', ''),
(380, 'NY', 'HHK To GFC (NT to GFC)', '2024-10-23', '1027', '3up', '22', 5, 0, '', '', 0, '', '', 0, '', ''),
(381, 'NY', 'HHK To GFC (NT to GFC)', '2024-10-23', '1027', '4up', '23', 6, 0, '', '', 0, '', '', 0, '', ''),
(382, 'NY', 'HHK To GFC (NT to GFC)', '2024-10-23', '1027', '4up', '24', 1, 0, '', '', 0, '', '', 0, '', ''),
(383, 'NY', 'HHK To GFC(NT to GFC)', '2024-10-23', '1027', '5up', '21', 1, 0, '', '', 0, '', '', 0, '', ''),
(384, 'NY', 'HHK To GFC (NT to GFC)', '2024-10-23', '1027', '5up', '22', 1, 0, '', '', 0, '', '', 0, '', ''),
(385, 'NY', 'HHK To GFC (NT to GFC)', '2024-10-23', '1027', '5up', '23', 1, 0, '', '', 0, '', '', 0, '', ''),
(386, 'NY', 'HHK To GFC (NT to GFC)', '2024-10-23', '1027', '7up', '22.5', 1, 0, '', '', 0, '', '', 0, '', ''),
(387, 'NY', 'Balance', '2024-10-14', '1020', '2up', '20', 6, 6, '', '', 0, '', '', 0, '', 'G'),
(388, '', 'Balance', '2024-10-14', '1001', '2up', '21', 3, 3, '', '', 0, '', '', 0, '', 'G'),
(389, '', 'Balance', '2024-10-14', '1001', '3up', '21', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(390, '', 'Balance', '2024-10-14', '1001', '3up', '22', 8, 8, '', '', 0, '', '', 0, '', 'G'),
(391, '', 'Balance', '2024-10-14', '1001', '3up', '23', 6, 6, '', '', 0, '', '', 0, '', 'G'),
(392, '', 'Balance', '2024-10-14', '1001', '4up', '22', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(393, '', 'Balance', '2024-10-14', '1001', '4up', '23', 10, 10, '', '', 0, '', '', 0, '', 'G'),
(394, '', 'Balance', '2024-10-14', '1001', '4up', '24', 3, 3, '', '', 0, '', '', 0, '', 'G'),
(395, '', 'Balance', '2024-10-14', '1001', '4up', '23', 4, 14, '', '', 0, '', '', 0, '', 'G'),
(396, '', 'Balance', '2024-10-14', '1001', '5up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(397, '', 'Balance', '2024-10-14', '1001', '3up', '21', 2, 4, '', '', 0, '', '', 0, '', 'G'),
(398, '', 'Balance', '2024-10-14', '1001', '3up', '22', 8, 16, '', '', 0, '', '', 0, '', 'G'),
(399, 'NY', 'Balance', '2024-10-14', '1020', '2up', '21', 3, 3, '', '', 0, '', '', 0, '', 'G'),
(400, 'NY', 'Balance', '2024-10-14', '1020', '3up', '21', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(401, 'NY', 'Balance', '2024-10-14', '1020', '3up', '22', 8, 8, '', '', 0, '', '', 0, '', 'G'),
(402, 'NY', 'Balance', '2024-10-14', '1020', '3up', '23', 6, 6, '', '', 0, '', '', 0, '', 'G'),
(403, 'NY', 'From Form-10', '2024-10-14', '1020', '4up', '22', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(404, 'NY', 'From Form-10', '2024-10-14', '1020', '4up', '23', 10, 10, '', '', 0, '', '', 0, '', 'G'),
(405, 'NY', 'From Form-10', '2024-10-14', '1020', '4up', '24', 3, 3, '', '', 0, '', '', 0, '', 'G'),
(406, 'NY', 'From Form-10', '2024-10-14', '1020', '5up', '23', 4, 4, '', '', 0, '', '', 0, '', 'G'),
(407, 'NY', 'From Form-10', '2024-10-14', '1020', '5up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(408, 'NY', 'From Form-10', '2024-10-14', '1020', '6up', '20', 4, 4, '', '', 0, '', '', 0, '', 'G'),
(409, 'NY', 'From Form-10', '2024-10-14', '1020', '6up', '19', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(410, 'NY', 'From Form-10', '2024-10-15', '1020', '2up', '20', 5, 11, '', '', 0, '', '', 0, '', 'G'),
(411, 'NY', 'From Form-10', '2024-10-15', '1020', '3up', '22', 5, 13, '', '', 0, '', '', 0, '', 'G'),
(412, 'NY', 'From Form-10', '2024-10-15', '1020', '4up', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(413, 'NY', 'From Form-10', '2024-10-15', '1020', '4up', '22', 1, 3, '', '', 0, '', '', 0, '', 'G'),
(414, 'NY', 'From Form-10', '2024-10-15', '1020', '4up', '23', 2, 12, '', '', 0, '', '', 0, '', 'G'),
(415, 'NY', 'From Form-10', '2024-10-15', '1020', '5up', '23', 1, 5, '', '', 0, '', '', 0, '', 'G'),
(416, 'NY', 'From Form-10', '2024-10-15', '1020', '6up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(417, 'NY', 'From Form-10', '2024-10-24', '1020', '2up', '20', 4, 15, '', '', 0, '', '', 0, '', 'G'),
(418, 'NY', 'From Form-10', '2024-10-24', '1020', '3up', '22', 1, 14, '', '', 0, '', '', 0, '', 'G'),
(419, 'NY', 'From Form-10', '2024-10-24', '1020', '4up', '23', 1, 13, '', '', 0, '', '', 0, '', 'G'),
(420, 'NY', 'From Form-10', '2024-10-24', '1020', '5up', '22', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(421, 'NY', 'From Form-10', '2024-10-24', '1020', '8up', '26', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(422, 'NY', 'From Form-10', '2024-10-24', '1020', '12up', '13', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(423, 'NY', 'From Form-10', '2024-10-28', '1020', '2up', '20', 1, 16, '', '', 0, '', '', 0, '', 'G'),
(424, 'NY', 'From Form-10', '2024-10-28', '1020', '3up', '23', 1, 7, '', '', 0, '', '', 0, '', 'G'),
(425, 'NY', 'From Form-10', '2024-10-28', '1020', '4up', '24', 1, 4, '', '', 0, '', '', 0, '', 'G'),
(426, 'NY', 'From Form-10', '2024-10-28', '1020', '5up', '22', 1, 3, '', '', 0, '', '', 0, '', 'G'),
(427, 'NY', 'From Form-10', '2024-10-28', '1020', '6up', '20', 2, 6, '', '', 0, '', '', 0, '', 'G'),
(428, 'NY', 'From Form-10', '2024-10-28', '1020', '7up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(429, 'NY', 'From Form-10', '2024-10-28', '1020', '7up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(430, 'can', 'HHK To GFC', '2024-10-08', '1023', '5up', '22', 9, 17, '', '', 0, '', '', 0, '', ''),
(431, 'can', 'HHK To GFC', '2024-10-08', '1023', '5up', '23', 1, 13, '', '', 0, '', '', 0, '', ''),
(432, 'can', 'HHK To GFC', '2024-10-08', '1023', '6up', '20', 3, 4, '', '', 0, '', '', 0, '', ''),
(433, 'can', 'HHK To GFC', '2024-10-08', '1023', '6up', '19', 5, 10, '', '', 0, '', '', 0, '', 'G'),
(434, 'can', 'HHK To GFC', '2024-10-08', '1023', '7up', '22', 1, 0, '', '', 0, '', '', 0, '', ''),
(435, 'can', 'HHK To GFC', '2024-10-08', '1023', '7up', '23', 2, 1, '', '', 0, '', '', 0, '', ''),
(436, 'NY', 'HHK To GFC', '2024-10-08', '1023', '4up', '20', 2, 7, '', '', 0, '', '', 0, '', ''),
(437, 'NY', 'HHK To GFC', '2024-10-08', '1023', '4up', '23', 37, 15, '', '', 0, '', '', 0, '', 'G'),
(438, 'NY', 'HHK To GFC', '2024-10-08', '1023', '4up', '24', 49, 44, '', '', 0, '', '', 0, '', 'G'),
(439, 'NY', 'HHK To GFC', '2024-10-08', '1023', '5up', '22', 23, 64, '', '', 0, '', '', 0, '', 'G'),
(440, 'NY', 'HHK To GFC', '2024-10-08', '1023', '5up', '23', 17, 49, '', '', 0, '', '', 0, '', ''),
(441, 'NY', 'HHK To GFC', '2024-10-08', '1023', '5up', '21', 1, 4, '', '', 0, '', '', 0, '', ''),
(442, 'NY', 'HHK To GFC', '2024-10-08', '1023', '6up', '20', 4, 31, '', '', 0, '', '', 0, '', ''),
(443, 'NY', 'HHK To GFC', '2024-10-08', '1023', '6up', '19', 2, 13, '', '', 0, '', '', 0, '', ''),
(444, 'NY', 'HHK To GFC', '2024-10-08', '1023', '7up', '24', 1, 0, '', '', 0, '', '', 0, '', ''),
(445, 'NY', 'HHK To GFC', '2024-10-10', '1023', '4up', '20', 2, 5, '', '', 0, '', '', 0, '', ''),
(446, 'NY', 'HHK To GFC', '2024-10-10', '1023', '4up', '23', 13, 2, '', '', 0, '', '', 0, '', 'G'),
(447, 'NY', 'HHK To GFC', '2024-10-10', '1023', '4up', '24', 42, 2, '', '', 0, '', '', 0, '', 'G'),
(448, 'NY', 'HHK To GFC', '2024-10-10', '1023', '5up', '22', 19, 45, '', '', 0, '', '', 0, '', 'G'),
(449, 'NY', 'HHK To GFC', '2024-10-10', '1023', '5up', '23', 21, 28, '', '', 0, '', '', 0, '', ''),
(450, 'NY', 'HHK To GFC', '2024-10-10', '1023', '6up', '20', 6, 25, '', '', 0, '', '', 0, '', ''),
(451, 'NY', 'HHK To GFC', '2024-10-10', '1023', '6up', '19', 4, 9, '', '', 0, '', '', 0, '', ''),
(452, 'NY', 'HHK To GFC', '2024-10-10', '1023', '7up', '22', 1, 2, '', '', 0, '', '', 0, '', ''),
(453, 'NY', 'HHK To GFC', '2024-10-10', '1023', '7up', '23', 1, 3, '', '', 0, '', '', 0, '', ''),
(454, 'NY', 'HHK To GFC', '2024-10-12', '1023', '4up', '20', 4, 1, '', '', 0, '', '', 0, '', ''),
(455, 'NY', 'HHK To GFC', '2024-10-12', '1023', '4up', '23', 2, 0, '', '', 0, '', '', 0, '', 'G'),
(456, 'NY', 'HHK To GFC', '2024-10-12', '1023', '4up', '24', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(457, 'NY', 'HHK To GFC', '2024-10-12', '1023', '4up', '22', 1, 1, '', '', 0, '', '', 0, '', ''),
(458, 'NY', 'HHK To GFC', '2024-10-12', '1023', '4up', '21', 1, 0, '', '', 0, '', '', 0, '', ''),
(459, 'NY', 'HHK To GFC', '2024-10-12', '1023', '5up', '22', 11, 34, '', '', 0, '', '', 0, '', 'G'),
(460, 'NY', 'HHK To GFC', '2024-10-12', '1023', '5up', '23', 15, 13, '', '', 0, '', '', 0, '', ''),
(461, 'NY', 'HHK To GFC', '2024-10-12', '1023', '6up', '20', 13, 12, '', '', 0, '', '', 0, '', ''),
(462, 'NY', 'HHK To GFC', '2024-10-12', '1023', '6up', '19', 4, 5, '', '', 0, '', '', 0, '', ''),
(463, 'NY', 'HHK To GFC', '2024-10-12', '1023', '7up', '22', 1, 1, '', '', 0, '', '', 0, '', ''),
(464, 'NY', 'HHK To GFC', '2024-10-12', '1023', '7up', '23', 3, 0, '', '', 0, '', '', 0, '', ''),
(465, 'NY', 'HHK To GFC', '2024-10-12', '1023', '8up', '27', 1, 0, '', '', 0, '', '', 0, '', ''),
(466, 'NY', 'HHK To GFC', '2024-10-12', '1023', '9up', '19', 1, 0, '', '', 0, '', '', 0, '', ''),
(467, 'NY', 'HHK To GFC', '2024-10-12', '1023', '10up', '21', 1, 0, '', '', 0, '', '', 0, '', ''),
(468, 'NY', 'HHK To GFC', '2024-10-12', '1023', '2up', '20', 13, 53, '', '', 0, '', '', 0, '', ''),
(469, 'NY', 'HHK To GFC', '2024-10-12', '1023', '2up', '21', 7, 0, '', '', 0, '', '', 0, '', ''),
(470, 'NY', 'HHK To GFC', '2024-10-23', '1023', '4up', '20', 1, 0, '', '', 0, '', '', 0, '', ''),
(472, 'NY', 'HHK To GFC', '2024-10-23', '1023', '4up', '22', 1, 0, '', '', 0, '', '', 0, '', ''),
(474, 'NY', 'HHK To GFC', '2024-10-23', '1023', '5up', '22', 32, 2, '', '', 0, '', '', 0, '', 'G'),
(475, 'NY', 'HHK To GFC', '2024-10-23', '1023', '5up', '23', 9, 4, '', '', 0, '', '', 0, '', ''),
(476, 'NY', 'HHK To GFC', '2024-10-23', '1023', '5up', '21', 3, 1, '', '', 0, '', '', 0, '', ''),
(477, 'NY', 'HHK To GFC', '2024-10-23', '1023', '6up', '20', 9, 3, '', '', 0, '', '', 0, '', ''),
(478, 'NY', 'HHK To GFC', '2024-10-23', '1023', '6up', '19', 5, 0, '', '', 0, '', '', 0, '', ''),
(479, 'NY', 'HHK To GFC', '2024-10-23', '1023', '7up', '22', 1, 0, '', '', 0, '', '', 0, '', ''),
(480, 'NY', 'HHK To GFC', '2024-10-23', '1023', '2up', '20', 53, 0, '', '', 0, '', '', 0, '', ''),
(481, 'Can', 'Balance (5star)', '2024-10-20', '1026', '800g', '20', 5, 5, '', '', 0, '', '', 0, '', 'G'),
(482, '', 'Balance (5star)', '2024-10-20', '1001', '500g', '20', 10, 10, '', '', 0, '', '', 0, '', 'G'),
(483, '', 'Balance (5star)', '2024-10-20', '1001', '1up', '20', 10, 10, '', '', 0, '', '', 0, '', 'G'),
(484, '', 'Balance (5star)', '2024-10-20', '1001', '1up', '20', 10, 20, '', '', 0, '', '', 0, '', 'G'),
(485, 'NY', 'HHK To GFC', '2024-10-23', '1023', '4up', '24', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(486, 'NY', 'From Form-10', '2024-10-30', '1020', '2up', '20', 4, 20, '', '', 0, '', '', 0, '', 'G'),
(487, 'NY', 'From Form-10', '2024-10-31', '1020', '2up', '20', 2, 22, '', '', 0, '', '', 0, '', 'G'),
(488, 'NY', 'From Form-10', '2024-10-31', '1020', '2up', '21', 1, 4, '', '', 0, '', '', 0, '', 'G'),
(489, 'NY', 'From Form-10', '2024-10-30', '1020', '3up', '22', 1, 15, '', '', 0, '', '', 0, '', 'G'),
(490, 'NY', 'From Form-10', '2024-10-31', '1020', '4up', '22', 1, 4, '', '', 0, '', '', 0, '', 'G'),
(491, 'NY', 'From Form-10', '2024-10-31', '1020', '4up', '23', 1, 14, '', '', 0, '', '', 0, '', 'G'),
(492, 'NY', 'From Form-10', '2024-10-31', '1020', '6up', '20', 1, 7, '', '', 0, '', '', 0, '', 'G'),
(493, 'NY', 'From Form-10', '2024-10-31', '1020', '3up', '24', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(494, 'NY', 'From Form-10', '2024-10-30', '1020', '10up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(495, 'NY', 'From Form-10', '2024-10-31', '1020', '8up', '25', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(496, 'NY', 'From Form-10', '2024-10-16', '1020', '2up', '21', 1, 5, '', '', 0, '', '', 0, '', 'G'),
(497, 'NY', 'From Form-10', '2024-10-16', '1020', '3up', '21', 1, 3, '', '', 0, '', '', 0, '', 'G'),
(498, 'NY', 'From Form-10', '2024-10-16', '1020', '3up', '19.5', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(499, 'NY', 'From Form-10', '2024-10-16', '1020', '4up', '22.5', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(500, 'NY', 'From Form-10', '2024-10-18', '1020', '2up', '20', 3, 25, '', '', 0, '', '', 0, '', 'G'),
(501, 'NY', 'HHK To GFC', '2024-10-21', '1020', '2up', '20', 3, 22, '', '', 0, '', '', 0, '', 'G'),
(502, 'NY', 'HHK To GFC', '2024-10-21', '1020', '2up', '21', 1, 4, '', '', 0, '', '', 0, '', 'G'),
(503, 'NY', 'HHK To GFC', '2024-10-21', '1020', '3up', '21', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(504, 'NY', 'HHK To GFC', '2024-10-21', '1020', '3up', '19.5', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(505, 'NY', 'HHK To GFC', '2024-10-21', '1020', '4up', '22.5', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(506, 'NY', 'HHK to GFC', '2024-10-23', '1020', '2up', '20', 12, 10, '', '', 0, '', '', 0, '', 'G'),
(507, 'NY', 'HHK To GFC', '2024-10-23', '1020', '2up', '21', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(508, 'NY', 'HHK To GFC', '2024-10-23', '1020', '3up', '21', 2, 0, '', '', 0, '', '', 0, '', 'G'),
(509, 'NY', 'HHK To GFC', '2024-10-23', '1020', '3up', '22', 13, 2, '', '', 0, '', '', 0, '', 'G'),
(510, 'NY', 'HHK To GFC', '2024-10-23', '1020', '3up', '23', 6, 1, '', '', 0, '', '', 0, '', 'G'),
(511, 'NY', 'HHK To GFC', '2024-10-23', '1020', '4up', '20', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(512, 'NY', 'HHK To GFC', '2024-10-23', '1020', '4up', '22', 3, 1, '', '', 0, '', '', 0, '', 'G'),
(513, 'NY', 'HHK To GFC', '2024-10-23', '1020', '4up', '23', 12, 2, '', '', 0, '', '', 0, '', 'G');
INSERT INTO `hhkmcstock` (`id`, `country`, `particular`, `date`, `commondity_id`, `size`, `kg`, `mc`, `balance_mc`, `loosein_size`, `loosein_kg`, `loosein_pcs`, `looseout_size`, `looseout_kg`, `looseout_pcs`, `remark`, `fish_type`) VALUES
(514, 'NY', 'HHK To GFC', '2024-10-23', '1020', '4up', '24', 3, 1, '', '', 0, '', '', 0, '', 'G'),
(515, 'NY', 'HHK To GFC', '2024-10-23', '1020', '5up', '23', 5, 0, '', '', 0, '', '', 0, '', 'G'),
(516, 'NY', 'HHK To GFC', '2024-10-23', '1020', '5up', '22', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(517, 'NY', 'HHK To GFC', '2024-10-23', '1020', '6up', '21', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(518, 'NY', 'HHK To GFC', '2024-10-23', '1020', '6up', '20', 4, 3, '', '', 0, '', '', 0, '', 'G'),
(519, 'NY', 'HHK To GFC', '2024-10-23', '1020', '6up', '19', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(520, 'NY', 'HHK To GFC', '2024-10-25', '1020', '2up', '20', 4, 6, '', '', 0, '', '', 0, '', 'G'),
(521, 'NY', 'HHK To GFC', '2024-10-25', '1020', '3up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(522, 'NY', 'HHK To GFC', '2024-10-25', '1020', '4up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(523, 'NY', 'HHK To GFC', '2024-10-25', '1020', '5up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(524, 'NY', 'HHK To GFC', '2024-10-25', '1020', '8up', '26', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(525, 'NY', 'HHK To GFC', '2024-10-25', '1020', '12up', '13', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(526, 'NY', 'From Form-10', '2024-10-30', '1020', '6up', '20.5', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(527, 'NY', 'From Form-10', '2024-11-04', '1020', '2up', '20', 2, 8, '', '', 0, '', '', 0, '', 'G'),
(528, 'NY', 'From Form-10', '2024-11-04', '1020', '3up', '22', 3, 4, '', '', 0, '', '', 0, '', 'G'),
(529, 'NY', 'From Form-10', '2024-11-04', '1020', '5up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(530, 'NY', 'HHK To GFC', '2024-11-05', '1020', '2up', '20', 8, 0, '', '', 0, '', '', 0, '', 'G'),
(531, 'NY', 'HHK To GFC', '2024-11-05', '1020', '2up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(532, 'NY', 'HHK To GFC', '2024-11-05', '1020', '3up', '22', 4, 0, '', '', 0, '', '', 0, '', 'G'),
(533, 'NY', 'HHK To GFC', '2024-11-05', '1020', '4up', '22', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(534, 'NY', 'HHK To GFC', '2024-11-05', '1020', '4up', '23', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(535, 'NY', 'HHK To GFC', '2024-11-05', '1020', '5up', '23', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(536, 'NY', 'HHK To GFC', '2024-11-05', '1020', '6up', '20.5', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(537, 'NY', 'HHK To GFC', '2024-11-05', '1020', '6up', '20', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(538, 'NY', 'HHK To GFC', '2024-11-05', '1020', '8up', '25', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(539, 'NY', 'HHK To GFC', '2024-11-05', '1020', '10up', '23', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(540, 'NY', 'HHK To GFC', '2024-11-05', '1002', '3up', '24', 1, -1, '', '', 0, '', '', 0, '', 'G'),
(541, 'NY', 'From Form-10(NT)', '2024-10-21', '1020', '2up', '21', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(542, 'NY', 'From Form-10(NT)', '2024-10-21', '1020', '3up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(543, 'NY', 'From Form-10(NT)', '2024-10-21', '1020', '4up', '22', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(544, 'NY', 'From Form-10(NT)', '2024-10-21', '1020', '4up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(545, 'NY', 'From Form-10(NT)', '2024-10-21', '1020', '5up', '23', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(546, 'NY', 'From Form-10(NT)', '2024-10-21', '1020', '5up', '22.5', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(547, 'NY', 'HHK To GFC NT--GFC', '2024-10-23', '1020', '2up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(548, 'NY', 'HHK To GFC Nt--GFC', '2024-10-23', '1020', '3up', '22', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(549, 'NY', 'HHK To GFC NT--GFC', '2024-10-23', '1020', '4up', '22', 2, 0, '', '', 0, '', '', 0, '', 'G'),
(550, 'NY', 'HHK To GFC NT--GFC', '2024-10-23', '1020', '4up', '23', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(551, 'NY', 'HHK To GFC NT--GFC', '2024-10-23', '1020', '5up', '23', 2, 0, '', '', 0, '', '', 0, '', 'G'),
(552, 'NY', 'HHK To GFC NT--GFC', '2024-10-23', '1020', '5up', '22.5', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(553, 'NY', 'HHK To GFC', '2024-11-05', '1020', '3up', '24', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(554, 'NY', 'Balance', '2024-10-22', '1027', '3up', '21', 4, 4, '', '', 0, '', '', 0, '', 'G'),
(555, 'NY', 'Balance', '2024-10-22', '1027', '3up', '22', 5, 5, '', '', 0, '', '', 0, '', 'G'),
(556, 'NY', 'Balance', '2024-10-22', '1027', '4up', '23', 6, 6, '', '', 0, '', '', 0, '', 'G'),
(557, 'NY', 'Balance', '2024-10-22', '1027', '4up', '24', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(558, 'NY', 'Balance', '2024-10-22', '1027', '5up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(559, 'NY', 'Balance', '2024-10-22', '1027', '5up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(560, 'NY', 'Balance', '2024-10-22', '1027', '5up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(561, 'NY', 'Balance', '2024-10-22', '1027', '7up', '22.5', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(562, 'NY', 'HHK To GFC NT--GFC', '2024-10-23', '1027', '3up', '21', 4, 0, '', '', 0, '', '', 0, '', 'G'),
(563, 'NY', 'HHK To GFC NT--GFC', '2024-10-23', '1027', '3up', '22', 5, 0, '', '', 0, '', '', 0, '', 'G'),
(564, 'NY', 'HHK To GFC', '2024-10-23', '1027', '4up', '23', 6, 0, '', '', 0, '', '', 0, '', 'G'),
(565, 'NY', 'HHK To GFC', '2024-10-23', '1027', '4up', '24', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(566, 'NY', 'HHK To GFC', '2024-10-23', '1027', '5up', '21', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(567, 'NY', 'HHK To GFC', '2024-10-23', '1027', '5up', '22', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(568, 'NY', 'HHK To GFC', '2024-10-23', '1027', '5up', '23', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(569, 'NY', 'HHK To GFC', '2024-10-23', '1027', '7up', '22.5', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(570, 'NY', 'Balance', '2024-10-25', '1037', '150/200', '20', 16, 16, '', '', 0, '', '', 0, '', 'W'),
(571, 'NY', 'Balance', '2024-10-25', '1037', '200/300', '20', 3, 3, '', '', 0, '', '', 0, '', 'W'),
(572, 'NY', 'Balance', '2024-10-25', '1037', '100/200 1kg', '20', 25, 25, '', '', 0, '', '', 0, '', 'W'),
(573, 'NY', 'HHK To GFC cc to GFc', '2024-10-25', '1037', '150/200', '20', 16, 0, '', '', 0, '', '', 0, '', 'W'),
(574, 'NY', 'HHK To GFC cc to gfc', '2024-10-25', '1037', '200/300', '20', 3, 0, '', '', 0, '', '', 0, '', 'W'),
(575, 'NY', 'HHK To GFC CC to GFC', '2024-10-25', '1037', '100/200 1kg', '20', 25, -25, '', '', 0, '', '', 0, '', 'W'),
(576, 'NY', 'From-10 From-10', '2024-11-04', '1023', '4up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(577, 'NY', 'From-10 From-10', '2024-11-04', '1023', '4up', '23', 52, 52, '', '', 0, '', '', 0, '', 'G'),
(578, 'NY', 'From-10 From-10', '2024-11-04', '1023', '4up', '24', 14, 14, '', '', 0, '', '', 0, '', 'G'),
(579, 'NY', 'From-10 From-10', '2024-11-04', '1023', '5up', '22', 22, 24, '', '', 0, '', '', 0, '', 'G'),
(580, 'NY', 'From-10 From-10', '2024-11-04', '1023', '5up', '23', 22, 26, '', '', 0, '', '', 0, '', 'G'),
(581, 'NY', 'From-10 From-10', '2024-11-04', '1023', '6up', '19', 10, 10, '', '', 0, '', '', 0, '', 'G'),
(582, 'NY', 'From-10 From-10', '2024-11-04', '1023', '6up', '20', 11, 14, '', '', 0, '', '', 0, '', 'G'),
(583, 'NY', 'From-10 From-10', '2024-11-04', '1023', '7up', '22', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(584, 'NY', 'HHK To GFC', '2024-11-05', '1023', '4up', '22', 1, 0, '', '', 0, '', '', 0, '', 'G'),
(585, 'NY', 'HHK To GFC', '2024-11-05', '1023', '4up', '23', 52, 0, '', '', 0, '', '', 0, '', 'G'),
(586, 'NY', 'HHK To GFC', '2024-11-05', '1023', '4up', '24', 14, 0, '', '', 0, '', '', 0, '', 'G'),
(587, 'NY', 'HHK To GFC', '2024-11-05', '1023', '5up', '22', 22, 2, '', '', 0, '', '', 0, '', 'G'),
(588, 'NY', 'HHK To GFC', '2024-11-05', '1023', '5up', '23', 22, 4, '', '', 0, '', '', 0, '', 'G'),
(589, 'NY', 'HHK To GFC', '2024-11-05', '1023', '6up', '19', 10, 0, '', '', 0, '', '', 0, '', 'G'),
(590, 'NY', 'HHK To GFC', '2024-11-05', '1023', '6up', '20', 11, 3, '', '', 0, '', '', 0, '', 'G'),
(591, 'NY', 'HHK To GFC', '2024-11-05', '1023', '7up', '22', 2, 0, '', '', 0, '', '', 0, '', 'G'),
(592, 'can', 'From Form-10', '2024-10-31', '1031', '3up', '21', 7, 7, '', '', 0, '', '', 0, '', 'G'),
(593, 'can', 'From Form-10', '2024-10-31', '1031', '3up', '20', 5, 5, '', '', 0, '', '', 0, '', 'G'),
(594, 'can', 'HHK To GFC', '2024-11-05', '1031', '3up', '21', 6, 1, '', '', 0, '', '', 0, '', 'G'),
(595, 'can', 'HHK To GFC', '2024-11-05', '1031', '3up', '20', 6, -1, '', '', 0, '', '', 0, '', 'G'),
(596, 'can', 'HHK To GFC NT to GFC', '2024-11-06', '1031', '3up', '20', 5, -6, '', '', 0, '', '', 0, '', 'G'),
(597, 'can', 'From Form-10', '2024-11-05', '1031', '2up', '20', 10, 10, '', '', 0, '', '', 0, '', 'G'),
(598, 'can', 'From Form-10', '2024-11-05', '1031', '2up', '21', 15, 15, '', '', 0, '', '', 0, '', 'G'),
(599, 'can', 'From Form-10', '2024-11-05', '1031', '3up', '20', 5, -1, '', '', 0, '', '', 0, '', 'G'),
(600, 'can', 'From Form-10', '2024-11-05', '1031', '3up', '22', 6, 6, '', '', 0, '', '', 0, '', 'G'),
(601, 'can', 'From Form-10', '2024-11-05', '1031', '3up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(602, 'can', 'From Form-10', '2024-11-05', '1031', '3up', '21', 7, 8, '', '', 0, '', '', 0, '', 'G'),
(603, 'can', 'From Form-10', '2024-11-05', '1031', '4up', '20', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(604, 'can', 'From Form-10', '2024-11-05', '1031', '4up', '22', 3, 3, '', '', 0, '', '', 0, '', 'G'),
(605, 'can', 'From Form-10', '2024-11-05', '1031', '4up', '23', 13, 13, '', '', 0, '', '', 0, '', 'G'),
(606, 'can', 'From Form-10', '2024-11-05', '1031', '4up', '24', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(607, 'can', 'From Form-10', '2024-11-05', '1031', '4up', '19.5', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(608, 'can', 'From Form-10', '2024-11-05', '1031', '5up', '21', 3, 3, '', '', 0, '', '', 0, '', 'G'),
(609, 'can', 'From Form-10', '2024-11-05', '1031', '5up', '22', 11, 11, '', '', 0, '', '', 0, '', 'G'),
(610, 'can', 'From Form-10', '2024-11-05', '1031', '5up', '23', 5, 5, '', '', 0, '', '', 0, '', 'G'),
(611, 'can', 'From Form-10', '2024-11-05', '1031', '6up', '19', 7, 7, '', '', 0, '', '', 0, '', 'G'),
(612, 'can', 'HHK To GFC N:T to GFC', '2024-11-06', '1031', '2up', '20', 10, 0, '', '', 0, '', '', 0, '', 'G'),
(613, 'can', 'HHK To GFC NT to GFC', '2024-11-06', '1031', '2up', '21', 15, 0, '', '', 0, '', '', 0, '', 'G'),
(614, 'can', 'HHK To GFC', '2024-11-06', '1031', '3up', '22', 6, 0, '', '', 0, '', '', 0, '', 'G'),
(615, 'can', 'HHK To GFC NT toGFC', '2024-11-06', '1031', '3up', '23', 1, 0, '', '', 0, '', '', 0, '', 'G');

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
(1017, 'Katla'),
(1018, 'Keski'),
(1019, 'Koi'),
(1020, 'Koral'),
(1021, 'Lakka'),
(1022, 'Lotia'),
(1023, 'Mrigal'),
(1024, 'Pangush'),
(1025, 'Pujanut'),
(1026, 'Puti'),
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
(1045, 'Baga Ayer'),
(1047, 'Taki'),
(1048, 'Rohu Scaless'),
(1049, 'Haluwa'),
(1050, 'Baby Koral');

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
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `unit` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `name`, `description`, `unit`) VALUES
(1, 'Normal Carton Box', 'Normal Size-25 x 14 x 7 1/2 , 25 1/2 x 14 x 7 , 44 x 9 x 9', 'pcs'),
(2, 'Medium Carton Box', 'Medium Size-32 x 14 x 7', 'pcs'),
(3, 'Large Carton Box', 'Large Size-44 x 9 x 9', 'pcs'),
(4, 'SAF 20kg Printed Polly', 'SAF 20kg Printed polly (635*356*191)', 'pcs'),
(5, 'Rose 20kg Printed Polly', 'Rose 20kg Printed Polly (635*356*191)', 'pcs'),
(6, 'SAF 10kg Block', 'SAF 10kg Block (432*279*178)', 'pcs'),
(7, 'Rose 10kg Block', 'Rose 10kg Block (470*279*191)', 'pcs'),
(8, 'Italy 20kg (PBI)', 'Italy 20kg (PBI)', 'pcs'),
(9, 'Italy 10kg (PBI) Block', 'Italy 10 kg (17*11*7) PBI Block', 'pcs'),
(11, 'Plastic Packing Strap JCV (3000W)', 'JCV 3000W', 'pcs'),
(12, 'Paper Box (500g)', 'Paper Box 500g', 'pcs'),
(13, 'Paper Box (250g)', 'Paper Box 250g', 'pcs'),
(23, 'Label Sticker', 'Label Sticker', 'pcs'),
(25, 'Barcode Sticker ', 'Barcode Sticker', 'pcs'),
(26, '9x30 (22)', '9x30 (22)\r\n', 'Lb'),
(27, '11x34 (22)', '11x34 (22)\r\n', 'Lb'),
(28, '40x30 (8)', '40x30 (8)\r\n', 'Lb'),
(30, '12x36 (22)', '12x36 (22)\r\n', 'Lb'),
(31, '11x36 (22)', '11x36 (22)\r\n', 'Lb'),
(32, '10x32 (22)', '10x32 (22)\r\n', 'Lb'),
(33, '7x23 (8)', '7x23 (8)\r\n', 'Lb'),
(34, '5x16 (8)', '5x16 (8)\r\n', 'Lb'),
(35, '38x44 (s)', '38x44 (s)\r\n', 'Lb'),
(36, '7x12 (8)', '7x12 (8)\r\n', 'Lb'),
(37, '11x40 (22)', '11x40 (22)\r\n', 'Lb'),
(38, '33x25 (s)', '33x25 (s)\r\n', 'Lb'),
(39, '15x50 (22)', '15x50 (22)\r\n', 'Lb'),
(40, '8x27 (22)', '8x27 (22)\r\n', 'Lb'),
(41, '7.5x25 (22)', '7.5x25 (22)\r\n', 'Lb'),
(42, '7x21 (8)', '7x21 (8)\r\n', 'Lb'),
(43, '6x18 (8)', '6x18 (8)\r\n', 'Lb'),
(44, '6.5x20 (8)', '6.5x20 (8)\r\n', 'Lb'),
(45, '6.5x9 (8)', '6.5x9 (8)\r\n', 'Lb'),
(46, '6x9.5 (8)', '6x9.5 (8)\r\n', 'Lb'),
(47, '9x22 (22)', '9x22 (22)\r\n', 'Lb'),
(48, '7 1/2x17 (22) Flat', '7 1/2x17 (22) Flat\r\n', 'Lb'),
(49, '8 1/2x17 1/2 (22) Flat', '8 1/2x17 1/2 (22) Flat\r\n', 'Lb'),
(50, '7 1/2x28 (22)', '7 1/2x28 (22)\r\n', 'Lb'),
(51, '9x27 (22) F', '9x27 (22) F\r\n', 'Lb'),
(52, '7.5x22 (22) F', '7.5x22 (22) F\r\n', 'Lb'),
(53, '12x45 (22)', '12x45 (22)\r\n', 'Lb'),
(54, '8x20(22)', '8x20(22)\r\n', 'Lb'),
(55, '12x55 (22)', '12x55 (22)\r\n', 'Lb'),
(56, 'Test material', '', 'pcs');

-- --------------------------------------------------------

--
-- Table structure for table `material_purchase`
--

CREATE TABLE `material_purchase` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `voucher_no` int(11) NOT NULL,
  `supplier_id` varchar(255) DEFAULT NULL,
  `material_id` text DEFAULT NULL,
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
  `voucher_no` text NOT NULL,
  `description` varchar(255) NOT NULL,
  `supplier_id` text NOT NULL,
  `material_id` int(11) NOT NULL,
  `in_quantity` int(11) DEFAULT NULL,
  `out_quantity` int(11) DEFAULT NULL,
  `output_group` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
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

--
-- Dumping data for table `packingliststock`
--

INSERT INTO `packingliststock` (`id`, `date`, `customer_id`, `country`, `invoiceno`, `containerno`, `vessel_name`, `voyname`, `fda`) VALUES
(1, '2025-05-15', '3300/004', 'italy', '45454', 'KND', 'HEHE', 'YOYOYO', 'abcdefg');

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

--
-- Dumping data for table `packingliststockinfo`
--

INSERT INTO `packingliststockinfo` (`id`, `commondity_id`, `size`, `packingkgperbox`, `mc`, `totalnetweight`, `totalgrossweight`, `usd`, `total_usd`, `infoid`) VALUES
(1, '1002', '3up', 10, 20, 200, '220', '', '', 1);

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

--
-- Dumping data for table `packingmaterial`
--

INSERT INTO `packingmaterial` (`id`, `commondity_id`, `fish_size`, `plastic`, `jcv`, `inner_box`, `sticker`, `mc_plastic`, `carton_box`, `tape`, `penon`, `p_sticker`, `plastic_rope`, `micellion`, `processing`, `total`, `perkgcost`, `plastic_size`, `pcsperlb`, `pcspermc`, `link_id`, `infoid`) VALUES
(1, '1002', '3up', '122.5', '13.57425', '50', '87.5', '24.5', '72', 3, 16, 4, '4.571428571', 50, 350, 797, '0.18', '50', 50, 50, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payable`
--

CREATE TABLE `payable` (
  `id` int(11) NOT NULL,
  `purchase_voucher_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `supplier_id` varchar(255) NOT NULL,
  `purchase_voucher_no` varchar(50) DEFAULT NULL,
  `purchase_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `paid_date` date DEFAULT NULL,
  `paid_voucher` varchar(50) DEFAULT NULL,
  `paid_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `remark` varchar(255) DEFAULT NULL,
  `closing_balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `report_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payable`
--

INSERT INTO `payable` (`id`, `purchase_voucher_id`, `date`, `supplier_id`, `purchase_voucher_no`, `purchase_amount`, `balance`, `paid_date`, `paid_voucher`, `paid_amount`, `remark`, `closing_balance`, `report_date`) VALUES
(3554, 3, '2026-07-15', '4000/A10', 'VC001', 1175000.00, 1175000.00, NULL, NULL, 0.00, NULL, 0.00, NULL),
(3555, NULL, '2026-07-01', '4000/A10', NULL, 0.00, 0.00, NULL, NULL, 0.00, 'DESCRIPTION', 100000.00, NULL),
(3556, 4, '2026-07-15', '4000/A10', 'VC002', 1500000.00, 1500000.00, NULL, NULL, 0.00, NULL, 0.00, NULL),
(3557, 5, '2026-07-16', '4000/A01', 'vr75656', 13500000.00, 13500000.00, NULL, NULL, 0.00, NULL, 0.00, NULL);

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
(1, 1, 'manage_accounts,manage_role,manage_sale,manage_purchase,manage_cashbook,manage_acpayable,manage_accountreceivable,manage_transactionmanage_general_ledger,manage_customers,manage_supplier,manage_coldstoreitem,manage_item,manage_actype,manage_acname,manage_coldstorecharges,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport,manage_shippmentexport,manage_truckexport,sale_report,purchase_report,payable_report,manage_mcreport,manage_tclmcstock,material_list,manage_material_purchase,material_store_house,material_gatepass,packing_material_report'),
(2, 2, ',manage_item,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_mcreport,manage_tclmcstock'),
(3, 3, ',manage_coldstoreitem,manage_coldstorecharges,manage_shippmentexport,manage_truckexport'),
(4, 4, ',manage_purchase,manage_cashbook,manage_acpayable,manage_accountreceivable,manage_transactionmanage_general_ledger,manage_customers,manage_supplier,manage_coldstoreitem,manage_item,manage_actype,manage_acname,manage_unit,manage_coldstorecharges,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport,manage_shippmentexport,manage_truckexport,manage_packingmaterial,sale_report,purchase_report,payable_report,manage_mcreport,manage_tclmcstock'),
(5, 5, ',manage_coldstoreitem,manage_coldstorecharges'),
(6, 6, ',manage_stockreport,sale_report,purchase_report,payable_report,manage_mcreport,manage_generalledger,packing_material_report');

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
  `purchase_voucher_id` int(11) NOT NULL,
  `commodity` varchar(255) NOT NULL,
  `size` varchar(11) NOT NULL,
  `viss` varchar(11) NOT NULL,
  `pcs` int(11) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `amount` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`no`, `purchase_voucher_id`, `commodity`, `size`, `viss`, `pcs`, `price`, `amount`) VALUES
(2724, 3, '1023', '3up', '250', 0, 1500.00, 375000.00),
(2725, 3, '1023', '4up', '400', 0, 2000.00, 800000.00),
(2726, 4, '1002', '2up', '500', 0, 3000.00, 1500000.00),
(2727, 5, '1002', '2up', '500', 10, 15000.00, 7500000.00),
(2728, 5, '1015', '3up', '400', 10, 15000.00, 6000000.00);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_voucher`
--

CREATE TABLE `purchase_voucher` (
  `id` int(11) NOT NULL,
  `voucher_no` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `supplier_id` varchar(255) NOT NULL,
  `tclfrozen` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `total_amount` decimal(15,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `purchase_voucher`
--

INSERT INTO `purchase_voucher` (`id`, `voucher_no`, `date`, `supplier_id`, `tclfrozen`, `notes`, `total_amount`) VALUES
(3, 'VC001', '2026-07-15', '4000/A10', 'frozen', NULL, 1175000.00),
(4, 'VC002', '2026-07-15', '4000/A10', 'frozen', NULL, 1500000.00),
(5, 'vr75656', '2026-07-16', '4000/A01', 'tcl', NULL, 13500000.00);

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
(5, 'Coldstore'),
(6, 'Visitor');

-- --------------------------------------------------------

--
-- Table structure for table `stock_output_group`
--

CREATE TABLE `stock_output_group` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT current_timestamp(),
  `time` time DEFAULT current_timestamp(),
  `stock_to` varchar(255) DEFAULT NULL,
  `voucher_no` int(11) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `group_name` text DEFAULT NULL,
  `material_id` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(95, '4000/T09', 'Than Than Myint (TCL)', '', ''),
(96, '4000/T10', 'Tun Zaw Min (TCL)', '', ''),
(97, '4000/W01', 'Win Bo', '', ''),
(98, '4000/W02', 'Win Bo (TCL)', '', ''),
(99, '4000/Y01', 'Ye Yint', '', ''),
(100, '4000/Z01', 'Zaw Zaw Latt', '', ''),
(101, '4000/Z02', 'Zaw Zaw Latt (TCL)', '', ''),
(102, '4000/S10', 'Shwe Myay', '', ''),
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
(154, '4000/T18', 'Tun Kyaw', '', ''),
(156, '4000/099', 'Tommy', '09977221152', 'Yangon'),
(157, '4000/P03', 'Carton Box (Pan Thazin)', '', ''),
(158, '4000/D04', 'Dalian Ice', '', ''),
(159, '4000/G03', 'Plastic (Golden Fish)', '', ''),
(160, '4000/K15', 'Ko Ka Lar', '', ''),
(161, '4000/A14', 'Ar Kar', '', ''),
(162, '4000/W03', 'Win Aye', '', ''),
(163, '4000/B02', 'Bar Bu Lay (TCL)', '', ''),
(164, '4000/P04', 'Promise (Inner Box)', '', ''),
(166, '4000/K16', 'Kyaw Min Lat', '', ''),
(167, '4000/K17', 'Kyaw Lin Tun', '', ''),
(168, '4000/K18', 'Kyi Lwin', '', ''),
(169, '4000/G04', 'Golden Bag', '', ''),
(170, '4000/C03', 'Chit Ko', '', ''),
(171, '4000/O01', 'O.D.A', '', ''),
(172, '4000/T19', 'Tin Hlaing', '', ''),
(173, '4000/K19', 'Ko Min', '', ''),
(174, '4000/A15', 'Aung Kyaw', '', ''),
(175, '4000/Z04', 'Zaw Win Naing', '', ''),
(176, '4000/Z05', 'Zay Yar Lin', '', ''),
(177, '4000/T20', 'Thein Linn Oo', '', ''),
(178, '4000/S13', 'Soe Min (TCL)', '', ''),
(179, '4000/W04', 'Carton Box (Win Pyae)', '', ''),
(180, '4000/K20', 'Kyaw Min Latt (TCL)', '', ''),
(181, '4000/A16', 'Aung Kyaw (TCL)', '', ''),
(182, '4000/T21', 'Tin Hlaing (TCL)', '', ''),
(183, '4000/A17', 'A Nge Lay', '', ''),
(184, '4000/A18', 'A.K (TCL)', '', ''),
(185, '4000/Y02', 'Ye Yint (TCL)', '', ''),
(186, '4000/Z06', 'Zaw Win Naing (TCL)', '', ''),
(188, '4000/P05', 'Phoe Zaw', '', ''),
(189, '4000/M11', 'Carton Box (May Kha San)', '', ''),
(190, '4000/A19', 'Aye Aye Maw', '', ''),
(191, '4000/A20', 'Aung Tun', '', ''),
(192, '4000/W05', 'Win Thein', '', ''),
(193, '4000/T22', 'Thet Paing (TCL)', '', ''),
(194, '4000/A21', 'Aung Naing Oo (TCL)', '', ''),
(195, '4000/A22', 'A Nge Lay (TCL)', '', ''),
(196, '4000/P06', 'Phoe Zaw (TCL)', '', ''),
(197, '4000/999', 'Peter', '', '');

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
  `debit` text NOT NULL,
  `credit` text NOT NULL,
  `currency` varchar(20) NOT NULL,
  `sr_no` varchar(25) NOT NULL,
  `container_no` varchar(25) NOT NULL,
  `bank_charges` float NOT NULL,
  `status` varchar(25) NOT NULL DEFAULT 'selected'
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
(870, '10:40:59.000000', '2026-06-22', 'admin@gmail.com', 'protechadmin', 'Login Failed'),
(871, '10:41:02.000000', '2026-06-22', 'admin@gmail.com', 'password', 'Login Failed'),
(872, '10:41:15.000000', '2026-06-22', 'admin@gmail.com', 'protechadmin', 'Login Failed'),
(873, '10:41:23.000000', '2026-06-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(874, '08:48:10.000000', '2026-06-25', 'Administrator', '', 'Logout Success'),
(875, '12:57:23.000000', '2026-06-29', 'Administrator', 'protechadmin2024***', 'Login Success'),
(876, '03:30:48.000000', '2026-07-02', 'Administrator', '', 'Logout Success'),
(877, '03:30:56.000000', '2026-07-02', 'UMyoWinSwe', 'password', 'Login Success'),
(878, '03:31:05.000000', '2026-07-02', 'UMyoWinSwe', '', 'Logout Success'),
(879, '03:31:06.000000', '2026-07-02', 'Administrator', 'protechadmin2024***', 'Login Success'),
(880, '03:31:39.000000', '2026-07-02', 'Administrator', '', 'Logout Success'),
(881, '03:31:46.000000', '2026-07-02', 'Administrator', 'protechadmin2024***', 'Login Success'),
(882, '03:31:57.000000', '2026-07-02', 'Administrator', '', 'Logout Success'),
(883, '03:32:04.000000', '2026-07-02', 'UMyoWinSwe', 'password', 'Login Success'),
(884, '03:35:52.000000', '2026-07-02', 'UMyoWinSwe', '', 'Logout Success'),
(885, '03:35:53.000000', '2026-07-02', 'Administrator', 'protechadmin2024***', 'Login Success'),
(886, '01:34:48.000000', '2026-07-16', 'Administrator', 'protechadmin2024***', 'Login Success');

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
  ADD PRIMARY KEY (`id`) USING BTREE;

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_payable_purchase_voucher_id` (`purchase_voucher_id`);

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
  ADD PRIMARY KEY (`no`),
  ADD KEY `idx_purchase_voucher_id` (`purchase_voucher_id`);

--
-- Indexes for table `purchase_voucher`
--
ALTER TABLE `purchase_voucher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_voucher_no` (`voucher_no`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `acname`
--
ALTER TABLE `acname`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=470;

--
-- AUTO_INCREMENT for table `actualinvoice`
--
ALTER TABLE `actualinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2833;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6152;

--
-- AUTO_INCREMENT for table `form7stock`
--
ALTER TABLE `form7stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2636;

--
-- AUTO_INCREMENT for table `form7stocktcl`
--
ALTER TABLE `form7stocktcl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `form10stock`
--
ALTER TABLE `form10stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `form10stocktcl`
--
ALTER TABLE `form10stocktcl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `general_ledger`
--
ALTER TABLE `general_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6081;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=679;

--
-- AUTO_INCREMENT for table `gfctotal`
--
ALTER TABLE `gfctotal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hhkmcstock`
--
ALTER TABLE `hhkmcstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=616;

--
-- AUTO_INCREMENT for table `hhkstock`
--
ALTER TABLE `hhkstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice_costing`
--
ALTER TABLE `invoice_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1051;

--
-- AUTO_INCREMENT for table `labour`
--
ALTER TABLE `labour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `material_purchase`
--
ALTER TABLE `material_purchase`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;

--
-- AUTO_INCREMENT for table `material_store_house`
--
ALTER TABLE `material_store_house`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=276;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `packingliststockinfo`
--
ALTER TABLE `packingliststockinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `packingmaterial`
--
ALTER TABLE `packingmaterial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payable`
--
ALTER TABLE `payable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3558;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `processing`
--
ALTER TABLE `processing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2729;

--
-- AUTO_INCREMENT for table `purchase_voucher`
--
ALTER TABLE `purchase_voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `receivable`
--
ALTER TABLE `receivable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

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
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stock_output_group`
--
ALTER TABLE `stock_output_group`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6147;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=887;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payable`
--
ALTER TABLE `payable`
  ADD CONSTRAINT `fk_payable_purchase_voucher` FOREIGN KEY (`purchase_voucher_id`) REFERENCES `purchase_voucher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `fk_purchase_voucher` FOREIGN KEY (`purchase_voucher_id`) REFERENCES `purchase_voucher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
