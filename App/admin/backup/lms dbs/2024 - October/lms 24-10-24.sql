-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2024 at 10:38 AM
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
(385, '5000/003', 36, 'Credit Sale-SC Trader (TCL) A/C'),
(386, '9100/034', 39, 'Global Lucky Fish(Htun Nay Lin)'),
(387, '9100/035', 39, 'Rental Charges'),
(389, '4000/T18', 40, 'Tin Ohine'),
(391, '3800/001', 35, 'USD Transit A/C'),
(393, '3400/001', 35, 'Temporary Loan'),
(394, '9100/036', 39, 'Discount Allowed A/C'),
(395, '6100/008', 37, 'Material Purchase'),
(396, '6100/0008', 37, 'Material Purchase'),
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
(420, '4000/003', 40, 'China Plastic A/C'),
(421, '3700/003', 35, 'UAB Bank (WPL) A/C');

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

--
-- Dumping data for table `cashbook`
--

INSERT INTO `cashbook` (`id`, `date`, `sr_no`, `ac_name`, `particular`, `debit`, `credit`, `balance`, `voucher_no`, `crossac_name`, `transactionid`, `interfacerowid`) VALUES
(1, '2024-09-16', '', '3600/001', 'Opining Balance of Sep-16-24', '0', '0', '260688072', NULL, NULL, 0, 1),
(58, '2024-09-18', '', '3600/001', 'Ice 9 pcs*15000 Purchase For Market Fish', '0', '135000', '31136947', 'Dr-Sep 24/376', '6100/002', 91, 0),
(59, '2024-09-18', '', '3600/001', 'Car Diesel For 3K-1574(15.9/18.9/19.9)', '0', '150000', '30986947', 'Dr-Sep 24/377', '9100/006', 93, 0),
(60, '2024-09-18', '', '3600/001', 'Taxi Charges For W/H to UAB to W/H', '0', '4000', '30982947', 'Dr-Sep 24/378', '9100/002', 95, 0),
(61, '2024-09-18', '', '3600/001', 'Sir Carry Charges For 19.9.24 AM', '0', '3000', '30979947', 'Dr-Sep 24/379', '9100/002', 97, 0),
(62, '2024-09-18', '', '3600/001', 'Taxi charges For W/H to Market to W/H', '0', '30000', '30949947', 'Dr-Sep 24/380', '9100/002', 99, 0),
(63, '2024-09-18', '', '3600/001', 'Meal Allowance For Am4pcs, Lunch4pcs', '0', '14000', '30935947', 'Dr-Sep 24/381', '9100/012', 101, 0),
(64, '2024-09-18', '', '3600/001', 'Cable Tie Purchase For Market Fish Pk', '0', '18000', '30917947', 'Dr-Sep 24/382', '9100/005', 103, 0),
(65, '2024-09-18', '', '3600/001', 'Car Packing For Market', '0', '2000', '30915947', 'Dr-Sep 24/383', '9100/025', 106, 0),
(66, '2024-09-18', '', '3600/001', 'Ice 3 pcs*15000ks Purchase For Rohu', '0', '45000', '30870947', 'Dr-Sep 24/384', '6100/002', 108, 0),
(67, '2024-09-18', '', '3600/001', 'Labour Charges For Rohu', '0', '9000', '30861947', 'Dr-Sep 24/385', '6100/001', 110, 0),
(68, '2024-09-18', '', '3600/001', 'Labour Charges For Market', '0', '38000', '30823947', 'Dr-Sep 24/386', '6100/001', 112, 0),
(69, '2024-09-18', '', '3600/001', 'Ice 9 Pcs*15000ks Purchase For Market Fish', '0', '135000', '30688947', 'Dr-Sep 24/387', '6100/002', 116, 0),
(70, '2024-09-17', '', '3600/001', 'Car Diesel For 3k-1574 (15.9.24=50000,17.9.24=500000)30.54 Liters*3275ks', '0', '100000', '31628447', 'Dr-Sep 24/361', '9100/006', 61, 0),
(71, '2024-09-17', '', '3600/001', 'Taxi Charges For Mindama to Lai Lai house For Fish Goverment', '0', '5500', '31622947', 'Dr-Sep 24/362', '9100/002', 63, 0),
(72, '2024-09-17', '', '3600/001', 'Labour Charges and Taxi For W/H Batashi 9viss*1000ks, Taxi 20000ks', '0', '29000', '31593947', 'Dr-Sep 24/363', '6100/001', 65, 0),
(73, '2024-09-17', '', '3600/001', 'Taxi Charges For W/H to UAB For Lai Lai for A/C Check', '0', '3000', '31590947', 'Dr-Sep 24/364', '9100/002', 67, 0),
(74, '2024-09-17', '', '3600/001', 'Cutter 5 pcs Purchase and Taxi For Batashi Clean (20000+4000)', '0', '24000', '31566947', 'Dr-Sep 24/365', '9100/005', 69, 0),
(75, '2024-09-17', '', '3600/001', 'Taxi Charges For HHK to W/H For 16.9.24', '0', '30000', '31536947', 'Dr-Sep 24/366', '9100/002', 71, 0),
(76, '2024-09-17', '', '3600/001', 'Workers 5pcs*2000ks Dinner For HHK OT', '0', '10000', '31526947', 'Dr-Sep 24/367', '9100/012', 73, 0),
(77, '2024-09-17', '', '3600/001', 'Ice 8pcs*10500ks Purchase and Carry For HHK', '0', '96000', '31430947', 'Dr-Sep 24/368', '6100/002', 75, 0),
(78, '2024-09-17', '', '3600/001', 'Taxi Charges For W/H to OP', '0', '13000', '31417947', 'Dr-Sep 24/369', '9100/002', 77, 0),
(79, '2024-09-17', '', '3600/001', 'Taxi Charges For W/H to HHK Carton Box Carry Charges', '0', '35000', '31382947', 'Dr-Sep 24/370', '9100/002', 79, 0),
(80, '2024-09-17', '', '3600/001', 'Labour Charges For OP Raw', '0', '30000', '31352947', 'Dr-Sep 24/371', '6100/001', 81, 0),
(81, '2024-09-17', '', '3600/001', 'Taxi Charges For W/H to Market to W/H', '0', '25000', '31327947', 'Dr-Sep 24/372', '9100/002', 83, 0),
(82, '2024-09-17', '', '3600/001', 'Meal allowance For Market Boys Am3pcs,Lunch 3pcs', '0', '10500', '31317447', 'Dr-Sep 24/373', '9100/012', 85, 0),
(83, '2024-09-17', '', '3600/001', 'Labour charges For Market Fish', '0', '42500', '31274947', 'Dr-Sep 24/374', '6100/001', 87, 0),
(84, '2024-09-17', '', '3600/001', 'Car Packing For Market', '0', '3000', '31271947', 'Dr-Sep 24/375', '9100/025', 89, 0),
(85, '2024-09-16', '', '3600/001', 'Water 5pcs*900ks Purchase for W/H', '0', '4500', '260683572', 'Dr-Sep 24/332', '9100/003', 3, 0),
(86, '2024-09-16', '', '3600/001', 'Taxi Charges For Printer Sent For W/H', '0', '10000', '260673572', 'Dr-Sep 24/333', '9100/002', 5, 0),
(87, '2024-09-16', '', '3600/001', 'Printer Ink Purchase For Office (2pcs*6000ks)', '0', '12000', '260661572', 'Dr-Sep 24/334', '9100/016', 7, 0),
(88, '2024-09-16', '', '3600/001', 'Taxi Charges For MC Tally People For GFC to W/H', '0', '5000', '260656572', 'Dr-Sep 24/335', '9100/002', 9, 0),
(89, '2024-09-16', '', '3600/001', 'Wasting Carry Charges For New Factory Cleaning', '0', '20000', '260636572', 'Dr-Sep 24/336', '9100/005', 11, 0),
(90, '2024-09-16', '', '3600/001', 'Taxi Charges For W/H to HHK For Biryani', '0', '18000', '260618572', 'Dr-Sep 24/337', '9100/002', 13, 0),
(91, '2024-09-16', '', '3600/001', 'Car Repair For 3K-1574 For Brake (Need Material 40000+ Repair Charges 25000)', '0', '65000', '260553572', 'Dr-Sep 24/338', '9100/014', 15, 0),
(92, '2024-09-16', '', '3600/001', 'Purchase UPS Changing and Service For Office Soe Soe Computer (UPS 98000+Service Charge 30000)', '0', '128000', '260425572', 'Dr-Sep 24/339', '9100/019', 17, 0),
(93, '2024-09-16', '', '3600/001', 'Sugar 1 pcs*1500ks Purchase For Sir', '0', '1500', '260424072', 'Dr-Sep 24/340', '9100/012', 19, 0),
(94, '2024-09-16', '', '3600/001', 'Dummy Air Ticket For Sir Singapore Visa', '0', '30000', '260394072', 'Dr-Sep 24/341', '9100/017', 21, 0),
(95, '2024-09-16', '', '3600/001', 'MC Charges For HHK To GFC (14.9.24=500000,16.9.24=500000)', '0', '1000000', '259394072', 'Dr-Sep 24/342', '6100/005', 23, 0),
(96, '2024-09-16', '', '3600/001', 'Labour Charges and Taxi For W/H (Baila 19Vissx350ks,D Puti 103Vissx600ks,Batashi 17.5Viss)', '0', '115950', '259278122', 'Dr-Sep 24/343', '6100/001', 25, 0),
(97, '2024-09-16', '', '3600/001', 'Car Charges For Tender Go To Nay Pyi Taw 12.9.24 to 14.9.24 LM Factory', '0', '1120000', '258158122', 'Dr-Sep 24/344', '3400/002', 27, 0),
(98, '2024-09-16', '', '3600/001', 'K-pay Charges For Car Charges Transfer NPT LM Factory', '0', '2000', '258156122', 'Dr-Sep 24/345', '9100/009', 29, 0),
(99, '2024-09-16', '', '3600/001', 'Hotal Charges For Factory Contract go D.Nan+2pcs LM Factory', '0', '326000', '257830122', 'Dr-Sep 24/346', '3400/002', 31, 0),
(100, '2024-09-16', '', '3600/001', 'Bank Guarantee 1 Month for LM Factory', '0', '15966000', '241864122', 'Dr-Sep 24/347', '3400/003', 33, 0),
(101, '2024-09-16', '', '3600/001', 'Rental Contract 1year for for LM Factory Sep\'24 to Sep\'25 (15700000*12month)', '0', '188400000', '53464122', 'Dr-Sep 24/348', '3400/004', 35, 0),
(102, '2024-09-16', '', '3600/001', 'Paid to Goverment NPT People For Tender MD-100 Lakh,D.Nan 50 Lakh,Ko Phyoe 10 Lakh', '0', '17362000', '36102122', 'Dr-Sep 24/349', '3400/002', 37, 0),
(103, '2024-09-16', '', '3600/001', 'Paid To Government People (YGN) For Tender U Aung Kyaw 3 Lakh, Daw Ohn Mar 10 Lakh, D', '0', '2300000', '33802122', 'Dr-Sep 24/350', '3400/002', 39, 0),
(104, '2024-09-16', '', '3600/001', 'Stamp Duty fees For Factory Contract (188400000\r\n*0.5%)+(BG 15700000*2%) LM Factory', '0', '1256000', '32546122', 'Dr-Sep 24/351', '3400/002', 41, 0),
(105, '2024-09-16', '', '3600/001', 'Under Taking For Tax Darpartment for Stamp Duty LM Factory', '0', '10000', '32536122', 'Dr-Sep 24/352', '3400/002', 43, 0),
(106, '2024-09-16', '', '3600/001', 'Copy For Tender Tax Document all LM Factory', '0', '7300', '32528822', 'Dr-Sep 24/353', '3400/002', 45, 0),
(107, '2024-09-16', '', '3600/001', 'Meal Allowance For Tender go 12.9.24 to 14.9.24 Daw Nan+2pcs LM Factory', '0', '288375', '32240447', 'Dr-Sep 24/354', '3400/002', 47, 0),
(108, '2024-09-16', '', '3600/001', 'Paid to Tun Naing For Vr no 12148', '0', '346500', '31893947', 'Dr-Sep 24/355', '4000/T14', 49, 0),
(109, '2024-09-16', '', '3600/001', 'Taxi Charges For W/H to Market to W/H and Boy 1 pcs house go', '0', '33000', '31860947', 'Dr-Sep 24/356', '9100/002', 51, 0),
(110, '2024-09-16', '', '3600/001', 'Meal allowance For Market Boys Am4pcs, Lunch4pcs', '0', '14000', '31846947', 'Dr-Sep 24/357', '9100/012', 53, 0),
(111, '2024-09-16', '', '3600/001', 'Labour Charges For Market Fish', '0', '26500', '31820447', 'Dr-Sep 24/358', '6100/001', 55, 0),
(112, '2024-09-16', '', '3600/001', 'Car Packing For Market', '0', '2000', '31818447', 'Dr-Sep 24/359', '9100/025', 57, 0),
(113, '2024-09-16', '', '3600/001', 'Ice 6pcs*15000ks For Market Fish', '0', '90000', '31728447', 'Dr-Sep 24/360', '6100/002', 59, 0),
(114, '2024-09-19', '', '3600/001', 'Paid To Aung Naing Oo For Vr no 12091,12096,12154 , Cheque no 109452\r\n', '0', '7942750', '22746197', 'Dr-Sep 24/388', '4000/a03', 128, 0),
(115, '2024-09-19', '', '3600/001', 'Paid to A.K For Vr no 12097,12119 Cheque no 109455\r\n\r\n', '0', '1240800', '21505397', 'Dr-Sep 24/389', '4000/a01', 130, 0),
(116, '2024-09-19', '', '3600/001', 'Paid to Bar Bu Lay For Vr no 12019,12020,12027,12028,12029,12039,12040,12041,12048,12059 Cheque no 109453\r\n\r\n\r\n\r\n', '0', '100000000', '-78494603', 'Dr-Sep 24/390', '4000/b01', 132, 0),
(117, '2024-09-19', '', '3600/001', 'Paid to Min Lwin For Vr no 12044,12103,12118,12146,12152 Cheque no 109456\r\n\r\n\r\n\r\n\r\n\r\n', '0', '14565375', '-93059978', 'Dr-Sep 24/391', '4000/m09', 134, 0),
(118, '2024-09-19', '', '3600/001', 'Paid to MA For Vr no 12068,12014,12038,12047 Cheque no 109467\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '5889650', '-98949628', 'Dr-Sep 24/392', '4000/m01', 136, 0),
(119, '2024-09-19', '', '3600/001', 'Paid to Nyan Tun For Vr no 12131,12135,12138 Cheque no 109459\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '10000000', '-108949628', 'Dr-Sep 24/393', '4000/n04', 138, 0),
(120, '2024-09-19', '', '3600/001', 'Paid to Soe Min For Vr no 11893,11898,11914 Cheque no 109462\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '50000000', '-158949628', 'Dr-Sep 24/394', '4000/s03', 140, 0),
(121, '2024-09-19', '', '3600/001', 'Paid to Soe Thein For Vr no 12114 Cheque no 109457\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '4501200', '-163450828', 'Dr-Sep 24/395', '4000/s06', 142, 0),
(122, '2024-09-19', '', '3600/001', 'Paid to Thaung Tun For Vr no 12032,12045,12052,12064\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '10000000', '-173450828', 'Dr-Sep 24/396', '4000/t07', 144, 0),
(123, '2024-09-19', '', '3600/001', 'Paid to Thein Htay For Vr no 12105,12107,12123,12130 Cheque no 109464\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '25000000', '-198450828', 'Dr-Sep 24/397', '4000/t02', 146, 0),
(124, '2024-09-19', '', '3600/001', 'Paid to Thet Oo For Vr no 11881,11888,11897,11903,11904 Cheque no 109469\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '48100375', '-246551203', 'Dr-Sep 24/398', '4000/t05', 148, 0),
(125, '2024-09-19', '', '3600/001', 'Paid to Thet Oo (TCL) For Vr no 00155,00156 Cheque no 109469\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '41899625', '-288450828', 'Dr-Sep 24/399', '4000/t15', 150, 0),
(126, '2024-09-19', '', '3600/001', 'Paid to Thin Thin Yee For Vr no 12065,12098 Cheque no 109454\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '6167260', '-294618088', 'Dr-Sep 24/400', '4000/t03', 152, 0),
(127, '2024-09-19', '', '3600/001', 'Paid to Than Than Myint For Vr no 12104,12093 Cheque no 109463\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '7658840', '-302276928', 'Dr-Sep 24/401', '4000/t17', 154, 0),
(128, '2024-09-19', '', '3600/001', 'Paid to Khin Maung Myint For Vr no 12121,12108 Cheque no 109461\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '6710900', '-308987828', 'Dr-Sep 24/402', '4000/k07', 156, 0),
(129, '2024-09-19', '', '3600/001', 'Paid to Ko Myo For Vr no 12137 Cheque no 109465\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '734700', '-309722528', 'Dr-Sep 24/403', '4000/k10', 158, 0),
(130, '2024-09-19', '', '3600/001', 'Paid to Zaw Myat Thu For Vr no 12092,12115,12149,12160 Cheque no 109460\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '35169800', '-344892328', 'Dr-Sep 24/404', '4000/z03', 160, 0),
(131, '2024-09-19', '', '3600/001', 'Paid to Thet Paing For Vr no 12159 Cheque no 109458\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '18749100', '-363641428', 'Dr-Sep 24/405', '4000/t01', 162, 0),
(132, '2024-09-19', '', '3600/001', 'Paid to Carton Box Shwe Myay For Vr Date 27.8.24 Cheque no 109471\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '7000000', '-370641428', 'Dr-Sep 24/406', '4000/s10', 164, 0),
(133, '2024-09-19', '', '3600/001', 'Paid to Carton Box MMMO Cheque no 109472\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '1876800', '-372518228', 'Dr-Sep 24/407', '4000/m04', 166, 0),
(134, '2024-09-19', '', '3600/001', 'Paid to Carton Box Pan Thazin For Vr Date 26.8.24,27.8.24 Cheque no 109473\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '2000000', '-374518228', 'Dr-Sep 24/408', '4000/p03', 168, 0),
(135, '2024-09-19', '', '3600/001', 'Paid to Dalian Ice For Vr Date 29.8.24,13.9.24 Cheque no 109474\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '2920000', '-377438228', 'Dr-Sep 24/409', '4000/d04', 170, 0),
(136, '2024-09-19', '', '3600/001', 'Paid to Plastic Golden Fish For Vr Date 12.9.24,13.9.24,18.9.24 Cheque no 109475\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '3760900', '-381199128', 'Dr-Sep 24/410', '4000/g03', 172, 0),
(138, '2024-09-19', '', '3600/001', 'Can Money from UAB Bank $42000-Bank Chg; 150.18 = $41849.82 100%selling @4300 ($41849.82*4300ks)', '179954226', '0', '-201244902', 'Cr-Sep 24/006', '3700/002', 237, 0),
(139, '2024-09-19', '', '3600/001', 'USA Money from UAB Bank (Sarmad Transfer) 17.9.24 $70000- Bank chg;220.26 = $69779.74 100%selling @4280 ($69779.74*3900ks LM / $69779.74*380ks Nan)', '298657287.2', '0', '97412385', 'Cr-Sep 24/007', '3700/001', 239, 0),
(140, '2024-09-19', '', '3600/001', 'Technak Deposit Money Surplus Received for TCL.14 (Rohu 5203.8V*5525ks = 28750995ks-Adv; 30000000 = Surplus 1249005', '1249005', '0', '98661390', 'Cr-Sep 24/008', '9100/033', 241, 0),
(143, '2024-09-27', '', '3600/001', 'USA money from NNS (Sarmad Transfer) $20000- Bank chg; 28.05 = $19971.95 * 4670ks', '93269006.5', '0', '386266187', 'Cr-Sep 24/010', '3700/001', 249, 0),
(144, '2024-09-27', '', '3600/001', 'Money Received from Border Trade-TCL (taka 1200000/122) / 1200000taka*38.1ks / $9836.07*4648.2ks', '45720020.574', '0', '431986207', 'Cr-Sep 24/011', '3800/001', 251, 0),
(145, '2024-09-27', '', '3600/001', 'Money Received from Frozen-Bangladesh (taka 2600000/122) / 2600000taka*38.1ks / $21311.48*4648.2ks', '99060021.336', '0', '531046228', 'Cr-Sep 24/012', '3800/001', 253, 0),
(146, '2024-10-03', '', '3600/001', 'USA Money from NNS (Sarmad Transfer) $35000-Bank chg; 40.27 = $34959.73 * 4415ks', '154347207.95', '0', '685393435', 'Cr-Sep 24/010', '3700/001', 265, 0),
(147, '2024-10-03', '', '3600/001', 'Money Received from Frozen-Container (taka 3500000/122) / 3500000taka*36.2ks / $28688.52*4416.4ks	', '126688504.32', '0', '812081939', 'Cr-Sep 24/011', '3800/001', 267, 0),
(148, '2024-10-03', '', '3600/001', 'Money Received from Border Trade-TCL (taka 500000/122) / 500000taka*36.2ks / $4098.36*4416.4ks', '18098357.76', '0', '830180296', 'Cr-Sep 24/012', '3800/001', 269, 0),
(149, '2024-09-26', '', '3600/001', 'Can Money Received from UAB 19.9.24 $50000- Bank chg; 170.31 = $49829.69 100%selling @4290 ($49829.69*3900ks LM / Balance @390 )', '194335791', '0', '292997181', 'Cr-Sep 24/009', '3700/003', 273, 0),
(150, '2024-10-07', '', '3600/001', 'Can Money Received from UAB 19.9.24 $50000- Bank chg; 170.31 = $49829.69 100%selling @4290 26.9.24 Balance Money 49829.69*390ks (Cr-Sep 24/009)', '19433579.1', '0', '849613875', 'Cr-Sep 24/013', '3700/003', 275, 0);

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

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `dollar_rate`, `debitorcredit`, `mmk_amount`, `usd_amount`, `voucher_no`, `transactionid`) VALUES
(1, 0, 'debit', '4500', '0', 'Dr-Sep 24/332', 2),
(2, 0, 'credit', '4500', '0', 'Dr-Sep 24/332', 3),
(3, 0, 'debit', '10000', '0', 'Dr-Sep 24/333', 4),
(4, 0, 'credit', '10000', '0', 'Dr-Sep 24/333', 5),
(5, 0, 'debit', '12000', '0', 'Dr-Sep 24/334', 6),
(6, 0, 'credit', '12000', '0', 'Dr-Sep 24/334', 7),
(7, 0, 'debit', '5000', '0', 'Dr-Sep 24/335', 8),
(8, 0, 'credit', '5000', '0', 'Dr-Sep 24/335', 9),
(9, 0, 'debit', '20000', '0', 'Dr-Sep 24/336', 10),
(10, 0, 'credit', '20000', '0', 'Dr-Sep 24/336', 11),
(11, 0, 'debit', '18000', '0', 'Dr-Sep 24/337', 12),
(12, 0, 'credit', '18000', '0', 'Dr-Sep 24/337', 13),
(13, 0, 'debit', '65000', '0', 'Dr-Sep 24/338', 14),
(14, 0, 'credit', '65000', '0', 'Dr-Sep 24/338', 15),
(15, 0, 'debit', '128000', '0', 'Dr-Sep 24/339', 16),
(16, 0, 'credit', '128000', '0', 'Dr-Sep 24/339', 17),
(17, 0, 'debit', '1500', '0', 'Dr-Sep 24/340', 18),
(18, 0, 'credit', '1500', '0', 'Dr-Sep 24/340', 19),
(19, 0, 'debit', '30000', '0', 'Dr-Sep 24/341', 20),
(20, 0, 'credit', '30000', '0', 'Dr-Sep 24/341', 21),
(21, 0, 'debit', '1000000', '0', 'Dr-Sep 24/342', 22),
(22, 0, 'credit', '1000000', '0', 'Dr-Sep 24/342', 23),
(23, 0, 'debit', '115950', '0', 'Dr-Sep 24/343', 24),
(24, 0, 'credit', '115950', '0', 'Dr-Sep 24/343', 25),
(25, 0, 'debit', '1120000', '0', 'Dr-Sep 24/344', 26),
(26, 0, 'credit', '1120000', '0', 'Dr-Sep 24/344', 27),
(27, 0, 'debit', '2000', '0', 'Dr-Sep 24/345', 28),
(28, 0, 'credit', '2000', '0', 'Dr-Sep 24/345', 29),
(29, 0, 'debit', '326000', '0', 'Dr-Sep 24/346', 30),
(30, 0, 'credit', '326000', '0', 'Dr-Sep 24/346', 31),
(31, 0, 'debit', '15966000', '0', 'Dr-Sep 24/347', 32),
(32, 0, 'credit', '15966000', '0', 'Dr-Sep 24/347', 33),
(33, 0, 'debit', '188400000', '0', 'Dr-Sep 24/348', 34),
(34, 0, 'credit', '188400000', '0', 'Dr-Sep 24/348', 35),
(35, 0, 'debit', '17362000', '0', 'Dr-Sep 24/349', 36),
(36, 0, 'credit', '17362000', '0', 'Dr-Sep 24/349', 37),
(37, 0, 'debit', '2300000', '0', 'Dr-Sep 24/350', 38),
(38, 0, 'credit', '2300000', '0', 'Dr-Sep 24/350', 39),
(39, 0, 'debit', '1256000', '0', 'Dr-Sep 24/351', 40),
(40, 0, 'credit', '1256000', '0', 'Dr-Sep 24/351', 41),
(41, 0, 'debit', '10000', '0', 'Dr-Sep 24/352', 42),
(42, 0, 'credit', '10000', '0', 'Dr-Sep 24/352', 43),
(43, 0, 'debit', '7300', '0', 'Dr-Sep 24/353', 44),
(44, 0, 'credit', '7300', '0', 'Dr-Sep 24/353', 45),
(45, 0, 'debit', '288375', '0', 'Dr-Sep 24/354', 46),
(46, 0, 'credit', '288375', '0', 'Dr-Sep 24/354', 47),
(47, 0, 'debit', '346500', '0', 'Dr-Sep 24/355', 48),
(48, 0, 'credit', '346500', '0', 'Dr-Sep 24/355', 49),
(49, 0, 'debit', '33000', '0', 'Dr-Sep 24/356', 50),
(50, 0, 'credit', '33000', '0', 'Dr-Sep 24/356', 51),
(51, 0, 'debit', '14000', '0', 'Dr-Sep 24/357', 52),
(52, 0, 'credit', '14000', '0', 'Dr-Sep 24/357', 53),
(53, 0, 'debit', '26500', '0', 'Dr-Sep 24/358', 54),
(54, 0, 'credit', '26500', '0', 'Dr-Sep 24/358', 55),
(55, 0, 'debit', '2000', '0', 'Dr-Sep 24/359', 56),
(56, 0, 'credit', '2000', '0', 'Dr-Sep 24/359', 57),
(57, 0, 'debit', '90000', '0', 'Dr-Sep 24/360', 58),
(58, 0, 'credit', '90000', '0', 'Dr-Sep 24/360', 59),
(59, 0, 'debit', '100000', '0', 'Dr-Sep 24/361', 60),
(60, 0, 'credit', '100000', '0', 'Dr-Sep 24/361', 61),
(61, 0, 'debit', '5500', '0', 'Dr-Sep 24/362', 62),
(62, 0, 'credit', '5500', '0', 'Dr-Sep 24/362', 63),
(63, 0, 'debit', '29000', '0', 'Dr-Sep 24/363', 64),
(64, 0, 'credit', '29000', '0', 'Dr-Sep 24/363', 65),
(65, 0, 'debit', '3000', '0', 'Dr-Sep 24/364', 66),
(66, 0, 'credit', '3000', '0', 'Dr-Sep 24/364', 67),
(67, 0, 'debit', '24000', '0', 'Dr-Sep 24/365', 68),
(68, 0, 'credit', '24000', '0', 'Dr-Sep 24/365', 69),
(69, 0, 'debit', '30000', '0', 'Dr-Sep 24/366', 70),
(70, 0, 'credit', '30000', '0', 'Dr-Sep 24/366', 71),
(71, 0, 'debit', '10000', '0', 'Dr-Sep 24/367', 72),
(72, 0, 'credit', '10000', '0', 'Dr-Sep 24/367', 73),
(73, 0, 'debit', '96000', '0', 'Dr-Sep 24/368', 74),
(74, 0, 'credit', '96000', '0', 'Dr-Sep 24/368', 75),
(75, 0, 'debit', '13000', '0', 'Dr-Sep 24/369', 76),
(76, 0, 'credit', '13000', '0', 'Dr-Sep 24/369', 77),
(77, 0, 'debit', '35000', '0', 'Dr-Sep 24/370', 78),
(78, 0, 'credit', '35000', '0', 'Dr-Sep 24/370', 79),
(79, 0, 'debit', '30000', '0', 'Dr-Sep 24/371', 80),
(80, 0, 'credit', '30000', '0', 'Dr-Sep 24/371', 81),
(81, 0, 'debit', '25000', '0', 'Dr-Sep 24/372', 82),
(82, 0, 'credit', '25000', '0', 'Dr-Sep 24/372', 83),
(83, 0, 'debit', '10500', '0', 'Dr-Sep 24/373', 84),
(84, 0, 'credit', '10500', '0', 'Dr-Sep 24/373', 85),
(85, 0, 'debit', '42500', '0', 'Dr-Sep 24/374', 86),
(86, 0, 'credit', '42500', '0', 'Dr-Sep 24/374', 87),
(87, 0, 'debit', '3000', '0', 'Dr-Sep 24/375', 88),
(88, 0, 'credit', '3000', '0', 'Dr-Sep 24/375', 89),
(89, 0, 'debit', '135000', '0', 'Dr-Sep 24/376', 90),
(90, 0, 'credit', '135000', '0', 'Dr-Sep 24/376', 91),
(91, 0, 'debit', '150000', '0', 'Dr-Sep 24/377', 92),
(92, 0, 'credit', '150000', '0', 'Dr-Sep 24/377', 93),
(93, 0, 'debit', '4000', '0', 'Dr-Sep 24/378', 94),
(94, 0, 'credit', '4000', '0', 'Dr-Sep 24/378', 95),
(95, 0, 'debit', '3000', '0', 'Dr-Sep 24/379', 96),
(96, 0, 'credit', '3000', '0', 'Dr-Sep 24/379', 97),
(97, 0, 'debit', '30000', '0', 'Dr-Sep 24/380', 98),
(98, 0, 'credit', '30000', '0', 'Dr-Sep 24/380', 99),
(99, 0, 'debit', '14000', '0', 'Dr-Sep 24/381', 100),
(100, 0, 'credit', '14000', '0', 'Dr-Sep 24/381', 101),
(101, 0, 'debit', '18000', '0', 'Dr-Sep 24/382', 102),
(102, 0, 'credit', '18000', '0', 'Dr-Sep 24/382', 103),
(104, 0, 'debit', '2000', '0', 'Dr-Sep 24/383', 105),
(105, 0, 'credit', '2000', '0', 'Dr-Sep 24/383', 106),
(106, 0, 'debit', '45000', '0', 'Dr-Sep 24/384', 107),
(107, 0, 'credit', '45000', '0', 'Dr-Sep 24/384', 108),
(108, 0, 'debit', '9000', '0', 'Dr-Sep 24/385', 109),
(109, 0, 'credit', '9000', '0', 'Dr-Sep 24/385', 110),
(110, 0, 'debit', '38000', '0', 'Dr-Sep 24/386', 111),
(111, 0, 'credit', '38000', '0', 'Dr-Sep 24/386', 112),
(114, 0, 'debit', '135000', '0', 'Dr-Sep 24/387', 115),
(115, 0, 'credit', '135000', '0', 'Dr-Sep 24/387', 116),
(116, 1, 'balance', '', '58093.88', 'Teacher sent to Prime Fashion 2,300,000/- Taka@122', 0),
(117, 1, 'balance', '', '7914.21', 'Teacher sent to Prince Fashion A/C 1700,000@ 122', 0),
(118, 1, 'balance', '', '33410.00', '', 0),
(119, 1, 'balance', '', '42763.90', '', 0),
(120, 1, 'balance', '', '86222.43', '', 0),
(121, 1, 'balance', '', '8823.19', '', 0),
(122, 1, 'debit', '147805.93', '147805.93', 'JV09-001', 117),
(123, 1, 'credit', '147805.93', '147805.93', 'JV09-001', 118),
(124, 1, 'debit', '118444.32', '118444.32', 'JV09-001', 119),
(125, 1, 'credit', '118444.32', '118444.32', 'JV09-001', 120),
(126, 1, 'debit', '119522.71', '119522.71', 'JV09-001', 121),
(127, 1, 'credit', '119522.71', '119522.71', 'JV09-001', 122),
(128, 1, 'debit', '114437.18', '114437.18', 'JV09-001', 123),
(129, 1, 'credit', '114437.18', '114437.18', 'JV09-001', 124),
(130, 1, 'debit', '136682.63', '136682.63', 'JV09-001', 125),
(131, 1, 'credit', '136682.63', '136682.63', 'JV09-001', 126),
(132, 0, 'debit', '7942750', '0', 'Dr-Sep 24/388', 127),
(133, 0, 'credit', '7942750', '0', 'Dr-Sep 24/388', 128),
(134, 0, 'debit', '1240800', '0', 'Dr-Sep 24/389', 129),
(135, 0, 'credit', '1240800', '0', 'Dr-Sep 24/389', 130),
(136, 0, 'debit', '100000000', '0', 'Dr-Sep 24/390', 131),
(137, 0, 'credit', '100000000', '0', 'Dr-Sep 24/390', 132),
(138, 0, 'debit', '14565375', '0', 'Dr-Sep 24/391', 133),
(139, 0, 'credit', '14565375', '0', 'Dr-Sep 24/391', 134),
(140, 0, 'debit', '5889650', '0', 'Dr-Sep 24/392', 135),
(141, 0, 'credit', '5889650', '0', 'Dr-Sep 24/392', 136),
(142, 0, 'debit', '10000000', '0', 'Dr-Sep 24/393', 137),
(143, 0, 'credit', '10000000', '0', 'Dr-Sep 24/393', 138),
(144, 0, 'debit', '50000000', '0', 'Dr-Sep 24/394', 139),
(145, 0, 'credit', '50000000', '0', 'Dr-Sep 24/394', 140),
(146, 0, 'debit', '4501200', '0', 'Dr-Sep 24/395', 141),
(147, 0, 'credit', '4501200', '0', 'Dr-Sep 24/395', 142),
(148, 0, 'debit', '10000000', '0', 'Dr-Sep 24/396', 143),
(149, 0, 'credit', '10000000', '0', 'Dr-Sep 24/396', 144),
(150, 0, 'debit', '25000000', '0', 'Dr-Sep 24/397', 145),
(151, 0, 'credit', '25000000', '0', 'Dr-Sep 24/397', 146),
(152, 0, 'debit', '48100375', '0', 'Dr-Sep 24/398', 147),
(153, 0, 'credit', '48100375', '0', 'Dr-Sep 24/398', 148),
(154, 0, 'debit', '41899625', '0', 'Dr-Sep 24/399', 149),
(155, 0, 'credit', '41899625', '0', 'Dr-Sep 24/399', 150),
(156, 0, 'debit', '6167260', '0', 'Dr-Sep 24/400', 151),
(157, 0, 'credit', '6167260', '0', 'Dr-Sep 24/400', 152),
(158, 0, 'debit', '7658840', '0', 'Dr-Sep 24/401', 153),
(159, 0, 'credit', '7658840', '0', 'Dr-Sep 24/401', 154),
(160, 0, 'debit', '6710900', '0', 'Dr-Sep 24/402', 155),
(161, 0, 'credit', '6710900', '0', 'Dr-Sep 24/402', 156),
(162, 0, 'debit', '734700', '0', 'Dr-Sep 24/403', 157),
(163, 0, 'credit', '734700', '0', 'Dr-Sep 24/403', 158),
(164, 0, 'debit', '35169800', '0', 'Dr-Sep 24/404', 159),
(165, 0, 'credit', '35169800', '0', 'Dr-Sep 24/404', 160),
(166, 0, 'debit', '18749100', '0', 'Dr-Sep 24/405', 161),
(167, 0, 'credit', '18749100', '0', 'Dr-Sep 24/405', 162),
(168, 0, 'debit', '7000000', '0', 'Dr-Sep 24/406', 163),
(169, 0, 'credit', '7000000', '0', 'Dr-Sep 24/406', 164),
(170, 0, 'debit', '1876800', '0', 'Dr-Sep 24/407', 165),
(171, 0, 'credit', '1876800', '0', 'Dr-Sep 24/407', 166),
(172, 0, 'debit', '2000000', '0', 'Dr-Sep 24/408', 167),
(173, 0, 'credit', '2000000', '0', 'Dr-Sep 24/408', 168),
(174, 0, 'debit', '2920000', '0', 'Dr-Sep 24/409', 169),
(175, 0, 'credit', '2920000', '0', 'Dr-Sep 24/409', 170),
(176, 0, 'debit', '3760900', '0', 'Dr-Sep 24/410', 171),
(177, 0, 'credit', '3760900', '0', 'Dr-Sep 24/410', 172),
(178, 1, 'debit', '160251.06', '160251.06', 'JV09-002', 173),
(179, 1, 'credit', '160251.06', '160251.06', 'JV09-002', 174),
(180, 1, 'debit', '161919.92', '161919.92', 'JV09-002', 175),
(181, 1, 'credit', '161919.92', '161919.92', 'JV09-002', 176),
(182, 1, 'debit', '191655.35', '191655.35', 'JV09-002', 177),
(183, 1, 'credit', '191655.35', '191655.35', 'JV09-002', 178),
(184, 1, 'debit', '207412.5', '207412.5', 'JV09-002', 179),
(185, 1, 'credit', '207412.5', '207412.5', 'JV09-002', 180),
(186, 1, 'debit', '71877.63', '71877.63', 'JV09-002', 181),
(187, 1, 'credit', '71877.63', '71877.63', 'JV09-002', 182),
(188, 1, 'debit', '79575.81', '79575.81', 'JV09-002', 183),
(189, 1, 'credit', '79575.81', '79575.81', 'JV09-002', 184),
(190, 1, 'debit', '74139.39', '74139.39', 'JV09-002', 185),
(191, 1, 'credit', '74139.39', '74139.39', 'JV09-002', 186),
(196, 1, 'debit', '28480', '28480', 'JV09-003', 191),
(197, 1, 'credit', '28480', '28480', 'JV09-003', 192),
(198, 1, 'debit', '4930', '4930', 'JV09-003', 193),
(199, 1, 'credit', '4930', '4930', 'JV09-003', 194),
(200, 1, 'debit', '514727.02', '514727.02', 'JV09-004', 195),
(201, 1, 'credit', '514727.02', '514727.02', 'JV09-004', 196),
(202, 1, 'debit', '482932.6', '482932.6', 'JV09-005', 197),
(203, 1, 'credit', '482932.6', '482932.6', 'JV09-005', 198),
(204, 1, 'debit', '55000', '55000', 'JV09-006', 199),
(205, 1, 'credit', '55000', '55000', 'JV09-006', 200),
(206, 1, 'debit', '47.5', '47.5', 'JV09-006', 201),
(207, 1, 'credit', '47.5', '47.5', 'JV09-006', 202),
(208, 1, 'debit', '55000', '55000', 'JV09-007', 203),
(209, 1, 'credit', '55000', '55000', 'JV09-007', 204),
(210, 1, 'debit', '167667.27', '167667.27', 'JV09-008', 205),
(211, 1, 'credit', '167667.27', '167667.27', 'JV09-008', 206),
(212, 1, 'debit', '137000', '137000', 'JV09-009', 207),
(213, 1, 'credit', '137000', '137000', 'JV09-009', 208),
(214, 1, 'debit', '77508.9', '77508.9', 'JV10-001', 209),
(215, 1, 'credit', '77508.9', '77508.9', 'JV10-001', 210),
(216, 1, 'debit', '147256.52', '147256.52', 'JV10-002', 211),
(217, 1, 'credit', '147256.52', '147256.52', 'JV10-002', 212),
(218, 1, 'debit', '60000', '60000', 'JV10-003', 213),
(219, 1, 'credit', '60000', '60000', 'JV10-003', 214),
(220, 1, 'debit', '65000', '65000', 'JV10-004', 215),
(221, 1, 'credit', '65000', '65000', 'JV10-004', 216),
(222, 1, 'debit', '47.5', '47.5', 'JV10-004', 217),
(223, 1, 'credit', '47.5', '47.5', 'JV10-004', 218),
(224, 1, 'debit', '65000', '65000', 'JV10-005', 219),
(225, 1, 'credit', '65000', '65000', 'JV10-005', 220),
(226, 1, 'debit', '47.5', '47.5', 'JV10-005', 221),
(227, 1, 'credit', '47.5', '47.5', 'JV10-005', 222),
(228, 1, 'debit', '47000', '47000', 'JV10-006', 223),
(229, 1, 'credit', '47000', '47000', 'JV10-006', 224),
(230, 1, 'debit', '9836.07', '9836.07', 'JV09-010', 225),
(231, 1, 'credit', '9836.07', '9836.07', 'JV09-010', 226),
(232, 1, 'debit', '22279.22', '22279.22', 'JV09-011', 227),
(233, 1, 'credit', '22279.22', '22279.22', 'JV09-011', 228),
(234, 1, 'debit', '4098.36', '4098.36', 'JV10-007', 229),
(235, 1, 'credit', '4098.36', '4098.36', 'JV10-007', 230),
(236, 1, 'debit', '28688.52', '28688.52', 'JV10-008', 231),
(237, 1, 'credit', '28688.52', '28688.52', 'JV10-008', 232),
(238, 1, 'debit', '16232.17', '16232.17', 'JV10-009', 233),
(239, 1, 'credit', '16232.17', '16232.17', 'JV10-009', 234),
(242, 4300, 'debit', '180600000', '42000', 'Cr-Sep 24/006', 237),
(243, 4300, 'credit', '180600000', '42000', 'Cr-Sep 24/006', 238),
(244, 4280, 'debit', '299600000', '70000', 'Cr-Sep 24/007', 239),
(245, 4280, 'credit', '299600000', '70000', 'Cr-Sep 24/007', 240),
(246, 0, 'debit', '1249005', '0', 'Cr-Sep 24/008', 241),
(247, 0, 'credit', '1249005', '0', 'Cr-Sep 24/008', 242),
(250, 1, 'debit', '264.11', '264.11', 'JV09-012', 245),
(251, 1, 'credit', '264.11', '264.11', 'JV09-012', 246),
(254, 4670, 'debit', '93400000', '20000', 'Cr-Sep 24/010', 249),
(255, 4670, 'credit', '93400000', '20000', 'Cr-Sep 24/010', 250),
(256, 4648.2, 'debit', '45720020.574', '9836.07', 'Cr-Sep 24/011', 251),
(257, 4648.2, 'credit', '45720020.574', '9836.07', 'Cr-Sep 24/011', 252),
(258, 4648.2, 'debit', '99060021.336', '21311.48', 'Cr-Sep 24/012', 253),
(259, 4648.2, 'credit', '99060021.336', '21311.48', 'Cr-Sep 24/012', 254),
(260, 1, 'debit', '967.74', '967.74', 'JV09-013', 255),
(261, 1, 'credit', '967.74', '967.74', 'JV09-013', 256),
(262, 1, 'debit', '1363.98', '1363.98', 'JV10-010', 257),
(263, 1, 'credit', '1363.98', '1363.98', 'JV10-010', 258),
(264, 1, 'debit', '1513.32', '1513.32', 'JV10-011', 259),
(265, 1, 'credit', '1513.32', '1513.32', 'JV10-011', 260),
(266, 1, 'debit', '8000', '8000', 'JV10-012', 261),
(267, 1, 'credit', '8000', '8000', 'JV10-012', 262),
(268, 1, 'debit', '113.58', '113.58', 'JV10-013', 263),
(269, 1, 'credit', '113.58', '113.58', 'JV10-013', 264),
(270, 4415, 'debit', '154525000', '35000', 'Cr-Sep 24/010', 265),
(271, 4415, 'credit', '154525000', '35000', 'Cr-Sep 24/010', 266),
(272, 4416, 'debit', '126688504.32', '28688.52', 'Cr-Sep 24/011', 267),
(273, 4416, 'credit', '126688504.32', '28688.52', 'Cr-Sep 24/011', 268),
(274, 4416, 'debit', '18098357.76', '4098.36', 'Cr-Sep 24/012', 269),
(275, 4416, 'credit', '18098357.76', '4098.36', 'Cr-Sep 24/012', 270),
(276, 4290, 'debit', '214500000', '50000', 'JV09-014', 271),
(277, 4290, 'credit', '214500000', '50000', 'JV09-014', 272),
(278, 3900, 'debit', '195000000', '50000', 'Cr-Sep 24/009', 273),
(279, 3900, 'credit', '195000000', '50000', 'Cr-Sep 24/009', 274),
(280, 390, 'debit', '19500000', '50000', 'Cr-Sep 24/013', 275),
(281, 390, 'credit', '19500000', '50000', 'Cr-Sep 24/013', 276);

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
  `water_kg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `form7stock`
--

INSERT INTO `form7stock` (`id`, `date`, `item_id`, `supplier_name`, `country`, `type`, `size`, `viss`, `kg`, `pcspervr`, `pcsperf7`, `link_id`, `water_kg`) VALUES
(1, '2024-09-16', '1001', '4000/b01', NULL, 'Frozen', '3up', '6.6', '10.7844', '3', 0, 1, 0),
(2, '2024-09-16', '1001', '4000/b01', NULL, 'Frozen', '2up', '6', '9.804', '4', 0, 2, 0),
(3, '2024-09-16', '1001', '4000/b01', NULL, 'Frozen', '1.5up', '9.2', '15.0328', '9', 0, 3, 0),
(4, '2024-09-16', '1001', '4000/b01', NULL, 'Frozen', '1up', '10.3', '16.8302', '13', 0, 4, 0),
(5, '2024-09-16', '1002', '4000/b01', NULL, 'Frozen', '4up', '31', '50.654', '9', 0, 5, 0),
(6, '2024-09-16', '1002', '4000/b01', NULL, 'Frozen', '2up', '5.2', '8.4968', '3', 0, 6, 0),
(7, '2024-09-16', '1002', '4000/b01', NULL, 'Frozen', '1.5up', '4.6', '7.5164', '4', 0, 7, 0),
(8, '2024-09-16', '1020', '4000/b01', NULL, 'Frozen', '3/4', '65.9', '107.6806', '', 0, 8, 0),
(9, '2024-09-16', '1020', '4000/b01', NULL, 'Frozen', '2up', '54.4', '88.8896', '', 0, 9, 0),
(10, '2024-09-16', '1023', '4000/b01', NULL, 'Frozen', '4/5up', '216.9', '354.4146', '', 0, 10, 0),
(11, '2024-09-16', '1031', '4000/b01', NULL, 'Frozen', 'J', '7', '11.438', '', 0, 11, 0),
(12, '2024-09-16', '1002', '4000/n04', NULL, 'Frozen', '3up', '37.35', '61.0299', '15', 0, 12, 0),
(13, '2024-09-16', '1002', '4000/n04', NULL, 'Frozen', '2up', '30.4', '49.6736', '19', 0, 13, 0),
(14, '2024-09-16', '1002', '4000/n04', NULL, 'Frozen', '1.5up', '12.3', '20.0982', '11', 0, 14, 0),
(15, '2024-09-16', '1001', '4000/n04', NULL, 'Frozen', '3up', '19.8', '32.3532', '10', 0, 15, 0),
(16, '2024-09-16', '1001', '4000/n04', NULL, 'Frozen', '2up', '8.8', '14.3792', '6', 0, 16, 0),
(17, '2024-09-16', '1001', '4000/n04', NULL, 'Frozen', '1.5up', '12', '19.608', '13', 0, 17, 0),
(18, '2024-09-16', '1001', '4000/n04', NULL, 'Frozen', '1up', '21', '34.314', '23', 0, 18, 0),
(19, '2024-09-17', '1031', '4000/t05', NULL, 'Frozen', '18/24', '61.4', '100.3276', '42', 0, 19, 0),
(20, '2024-09-17', '1031', '4000/t05', NULL, 'Frozen', '2up', '1102.1', '1800.8314', '579', 0, 20, 0),
(21, '2024-09-17', '1031', '4000/t05', NULL, 'Frozen', '3up', '1072.6', '1752.6284', '428', 0, 21, 0),
(22, '2024-09-17', '1031', '4000/t05', NULL, 'Frozen', '4up', '709.2', '1158.8328', '228', 0, 22, 0),
(23, '2024-09-17', '1031', '4000/t05', NULL, 'Frozen', '5up', '532.3', '869.7782', '133', 0, 23, 0),
(24, '2024-09-17', '1004', '4000/m09', NULL, 'Frozen', 'J', '282.25', '461.1965', '', 0, 24, 0),
(25, '2024-09-17', '1001', '4000/t02', NULL, 'Frozen', '3up', '22', '35.948', '10', 0, 25, 0),
(26, '2024-09-17', '1001', '4000/t02', NULL, 'Frozen', '2up', '17', '27.778', '12', 0, 26, 0),
(27, '2024-09-17', '1001', '4000/t02', NULL, 'Frozen', '1.5up', '26.4', '43.1376', '24', 0, 27, 0),
(28, '2024-09-17', '1001', '4000/t02', NULL, 'Frozen', '1up', '33.2', '54.2488', '43', 0, 28, 0),
(29, '2024-09-17', '1002', '4000/t02', NULL, 'Frozen', '3up', '76.4', '124.8376', '29', 0, 29, 0),
(30, '2024-09-17', '1002', '4000/t02', NULL, 'Frozen', '2up', '7.9', '12.9086', '5', 0, 30, 0),
(31, '2024-09-17', '1002', '4000/t02', NULL, 'Frozen', '1.5up', '7.5', '12.255', '7', 0, 31, 0),
(32, '2024-09-17', '1001', '4000/t02', NULL, 'Frozen', '1D', '9.5', '15.523', '', 0, 32, 0),
(33, '2024-09-17', '1037', '4000/a03', NULL, 'Frozen', '1/2', '98.15', '160.3771', '', 0, 33, 0),
(34, '2024-09-17', '1037', '4000/a03', NULL, 'Frozen', '8/10', '93', '151.962', '', 0, 34, 0),
(35, '2024-09-17', '1001', '4000/b01', NULL, 'Frozen', '3up', '10.5', '17.157', '5', 0, 35, 0),
(36, '2024-09-17', '1001', '4000/b01', NULL, 'Frozen', '2up', '18', '29.412', '12', 0, 36, 0),
(37, '2024-09-17', '1001', '4000/b01', NULL, 'Frozen', '1.5up', '15.5', '25.327', '13', 0, 37, 0),
(38, '2024-09-17', '1001', '4000/b01', NULL, 'Frozen', '1up', '7.2', '11.7648', '9', 0, 38, 0),
(39, '2024-09-17', '1002', '4000/b01', NULL, 'Frozen', '4up', '48.45', '79.1673', '16', 0, 39, 0),
(40, '2024-09-17', '1002', '4000/b01', NULL, 'Frozen', '2up', '3', '4.902', '2', 0, 40, 0),
(41, '2024-09-17', '1002', '4000/b01', NULL, 'Frozen', '1.5up', '1.1', '1.7974', '1', 0, 41, 0),
(42, '2024-09-17', '1020', '4000/b01', NULL, 'Frozen', '2up', '12.9', '21.0786', '', 0, 42, 0),
(43, '2024-09-17', '1020', '4000/b01', NULL, 'Frozen', '3/4', '21.5', '35.131', '', 0, 43, 0),
(44, '2024-09-17', '1004', '4000/t07', NULL, 'Frozen', 'J', '220.3', '359.9702', '', 0, 44, 0),
(45, '2024-09-18', '1031', '4000/t05', NULL, 'Frozen', '4up', '394.5', '644.613', '', 0, 45, 0),
(46, '2024-09-18', '1031', '4000/t05', NULL, 'Frozen', '5up', '321.75', '525.7395', '', 0, 46, 0),
(47, '2024-09-18', '1023', '4000/t05', NULL, 'Frozen', '4up', '18', '29.412', '', 0, 47, 0),
(48, '2024-09-18', '1023', '4000/t05', NULL, 'Frozen', '5/6', '139.75', '228.3515', '', 0, 48, 0),
(49, '2024-09-18', '1010', '4000/t16', NULL, 'Frozen', 'J', '57.2', '93.4648', '', 0, 49, 0),
(50, '2024-09-18', '1015', '4000/t01', NULL, 'Frozen', '3/5', '222.55', '363.6467', '', 0, 50, 0),
(51, '2024-09-18', '1015', '4000/t01', NULL, 'Frozen', '5/8', '230.15', '376.0651', '', 0, 51, 0),
(52, '2024-09-18', '1015', '4000/t01', NULL, 'Frozen', '10/12', '20.4', '33.3336', '', 0, 52, 0),
(53, '2024-09-18', '1015', '4000/t01', NULL, 'Frozen', '500', '16.8', '27.4512', '', 0, 53, 0),
(54, '2024-09-18', '1001', '4000/z03', NULL, 'Frozen', '3up', '37', '60.458', '16', 0, 54, 0),
(55, '2024-09-18', '1001', '4000/z03', NULL, 'Frozen', '2up', '4', '6.536', '3', 0, 55, 0),
(56, '2024-09-18', '1001', '4000/z03', NULL, 'Frozen', '1.5up', '45.25', '73.9385', '50', 0, 56, 0),
(57, '2024-09-18', '1001', '4000/z03', NULL, 'Frozen', '1D', '15.25', '24.9185', '25', 0, 57, 0),
(58, '2024-09-18', '1002', '4000/z03', NULL, 'Frozen', '3/4', '68.75', '112.3375', '31', 0, 58, 0),
(59, '2024-09-18', '1002', '4000/z03', NULL, 'Frozen', '2up', '47', '76.798', '34', 0, 59, 0),
(60, '2024-09-18', '1002', '4000/z03', NULL, 'Frozen', '1.5up', '16', '26.144', '16', 0, 60, 0),
(61, '2024-09-18', '1027', '4000/s04', NULL, 'Frozen', '1up', '183.8', '300.3292', '', 0, 61, 0),
(62, '2024-09-18', '1020', '4000/b01', NULL, 'Frozen', '3/4', '32', '52.288', '', 0, 62, 0),
(63, '2024-09-18', '1020', '4000/b01', NULL, 'Frozen', '2up', '34.3', '56.0462', '', 0, 63, 0),
(64, '2024-09-18', '1015', '4000/a06', NULL, 'Frozen', '3/5', '27.5', '44.935', '', 0, 64, 0),
(65, '2024-09-18', '1015', '4000/a06', NULL, 'Frozen', '5/8', '3.15', '5.1471', '', 0, 65, 0),
(66, '2024-09-18', '1015', '4000/a06', NULL, 'Frozen', '10/12', '3.35', '5.4739', '', 0, 66, 0),
(67, '2024-09-19', '1044', '4000/t16', NULL, 'Frozen', 'J', '27.5', '44.935', '', 0, 67, 0),
(68, '2024-09-19', '1010', '4000/t16', NULL, 'Frozen', 'J', '20.5', '33.497', '', 0, 68, 0),
(69, '2024-09-19', '1004', '4000/t07', NULL, 'Frozen', 'J', '126', '205.884', '', 0, 69, 0),
(70, '2024-09-19', '1027', '4000/a01', NULL, 'Frozen', '1up', '122.5', '200.165', '', 0, 70, 0),
(71, '2024-09-19', '1002', '4000/b01', NULL, 'Frozen', '4up', '191.7', '313.2378', '62', 0, 71, 0),
(72, '2024-09-19', '1002', '4000/b01', NULL, 'Frozen', '2up', '42.6', '69.6084', '26', 0, 72, 0),
(73, '2024-09-19', '1002', '4000/b01', NULL, 'Frozen', '1.5up', '10.8', '17.6472', '9', 0, 73, 0),
(74, '2024-09-19', '1001', '4000/b01', NULL, 'Frozen', '3up', '25.2', '41.1768', '10', 0, 74, 0),
(75, '2024-09-19', '1001', '4000/b01', NULL, 'Frozen', '2up', '20.9', '34.1506', '14', 0, 75, 0),
(76, '2024-09-19', '1001', '4000/b01', NULL, 'Frozen', '1.5up', '16.7', '27.2878', '16', 0, 76, 0),
(77, '2024-09-19', '1001', '4000/b01', NULL, 'Frozen', '1up', '8.4', '13.7256', '10', 0, 77, 0),
(78, '2024-09-19', '1020', '4000/b01', NULL, 'Frozen', '2up', '110.6', '180.7204', '', 0, 78, 0),
(79, '2024-09-19', '1020', '4000/b01', NULL, 'Frozen', '3up', '305', '498.37', '', 0, 79, 0),
(80, '2024-09-19', '1026', '4000/b01', NULL, 'Frozen', 'J', '6.5', '10.621', '', 0, 80, 0),
(81, '2024-09-19', '1001', '4000/t02', NULL, 'Frozen', '3up', '21', '34.314', '8', 0, 81, 0),
(82, '2024-09-19', '1001', '4000/t02', NULL, 'Frozen', '2up', '45.1', '73.6934', '32', 0, 82, 0),
(83, '2024-09-19', '1001', '4000/t02', NULL, 'Frozen', '1.5up', '47.7', '77.9418', '47', 0, 83, 0),
(84, '2024-09-19', '1001', '4000/t02', NULL, 'Frozen', '1up', '38.5', '62.909', '48', 0, 84, 0),
(85, '2024-09-19', '1002', '4000/t02', NULL, 'Frozen', '3up', '59.2', '96.7328', '24', 0, 85, 0),
(86, '2024-09-19', '1002', '4000/t02', NULL, 'Frozen', '2up', '9.9', '16.1766', '7', 0, 86, 0),
(87, '2024-09-19', '1002', '4000/t02', NULL, 'Frozen', '1.5up', '6.8', '11.1112', '6', 0, 87, 0),
(88, '2024-09-20', '1031', '4000/s03', NULL, 'Frozen', '18/24', '233.6', '381.7024', '310', 0, 88, 0),
(89, '2024-09-20', '1031', '4000/s03', NULL, 'Frozen', '2up', '2053.8', '3355.9092', '1110', 0, 89, 0),
(90, '2024-09-20', '1031', '4000/s03', NULL, 'Frozen', '3up', '1694.9', '2769.4666', '670', 0, 90, 0),
(91, '2024-09-20', '1031', '4000/s03', NULL, 'Frozen', '4up', '598.2', '977.4588', '185', 0, 91, 0),
(92, '2024-09-20', '1001', '4000/b01', NULL, 'Frozen', '3up', '9.3', '15.1962', '3', 0, 92, 0),
(93, '2024-09-20', '1001', '4000/b01', NULL, 'Frozen', '2up', '8.3', '13.5622', '5', 0, 93, 0),
(94, '2024-09-20', '1001', '4000/b01', NULL, 'Frozen', '1.5up', '5.2', '8.4968', '5', 0, 94, 0),
(95, '2024-09-20', '1001', '4000/b01', NULL, 'Frozen', '1up', '2.6', '4.2484', '3', 0, 95, 0),
(96, '2024-09-20', '1002', '4000/b01', NULL, 'Frozen', '3/4', '100.45', '164.1353', '33', 0, 96, 0),
(97, '2024-09-20', '1002', '4000/b01', NULL, 'Frozen', '2up', '14.7', '24.0198', '9', 0, 97, 0),
(98, '2024-09-20', '1002', '4000/b01', NULL, 'Frozen', '1.5up', '4.6', '7.5164', '4', 0, 98, 0),
(99, '2024-09-20', '1020', '4000/b01', NULL, 'Frozen', '3/4', '219.25', '358.2545', '', 0, 99, 0),
(100, '2024-09-20', '1020', '4000/b01', NULL, 'Frozen', '2up', '50', '81.7', '', 0, 100, 0),
(101, '2024-09-20', '1037', '4000/a06', NULL, 'Frozen', '1/2', '27.3', '44.6082', '', 0, 101, 0),
(102, '2024-09-20', '1037', '4000/a06', NULL, 'Frozen', '1D', '19', '31.046', '', 0, 102, 0),
(103, '2024-09-20', '1015', '4000/a06', NULL, 'Frozen', '3/5', '15.7', '25.6538', '', 0, 103, 0),
(104, '2024-09-20', '1004', '4000/m09', NULL, 'Frozen', 'J', '425.25', '694.8585', '', 0, 104, 0),
(105, '2024-09-21', '1015', '4000/t11', NULL, 'Frozen', '5/8', '211.5', '345.591', '0', 0, 105, 0),
(106, '2024-09-21', '1027', '4000/s04', NULL, 'Frozen', '1up', '3.55', '5.8007', '0', 0, 106, 0),
(107, '2024-09-21', '1015', '4000/k10', NULL, 'Frozen', '3/5', '139.5', '227.943', '0', 0, 107, 0),
(108, '2024-09-21', '1037', '4000/k07', NULL, 'Frozen', '1/2', '56.8', '92.8112', '0', 0, 108, 0),
(109, '2024-09-21', '1037', '4000/k07', NULL, 'Frozen', '80up', '360.2', '588.5668', '0', 0, 109, 0),
(110, '2024-09-21', '1001', '4000/b01', NULL, 'Frozen', '3up', '14.65', '23.9381', '5', 0, 110, 0),
(111, '2024-09-21', '1001', '4000/b01', NULL, 'Frozen', '2up', '13.5', '22.059', '9', 0, 111, 0),
(112, '2024-09-21', '1001', '4000/b01', NULL, 'Frozen', '1.5up', '13', '21.242', '11', 0, 112, 0),
(113, '2024-09-21', '1001', '4000/b01', NULL, 'Frozen', '1up', '11.7', '19.1178', '12', 0, 113, 0),
(114, '2024-09-21', '1002', '4000/b01', NULL, 'Frozen', '3/4', '70.65', '115.4421', '27', 0, 114, 0),
(115, '2024-09-21', '1002', '4000/b01', NULL, 'Frozen', '2up', '49.1', '80.2294', '31', 0, 115, 0),
(116, '2024-09-21', '1002', '4000/b01', NULL, 'Frozen', '1.5up', '12.2', '19.9348', '10', 0, 116, 0),
(117, '2024-09-21', '1026', '4000/b01', NULL, 'Frozen', '8/10', '31.7', '51.7978', '', 0, 117, 0),
(118, '2024-09-21', '1020', '4000/b01', NULL, 'Frozen', '3/4', '39.7', '64.8698', '', 0, 118, 0),
(119, '2024-09-21', '1020', '4000/b01', NULL, 'Frozen', '2up', '19.5', '31.863', '', 0, 119, 0),
(120, '2024-09-21', '1001', '4000/n04', NULL, 'Frozen', '3up', '2', '3.268', '1', 0, 120, 0),
(121, '2024-09-21', '1001', '4000/n04', NULL, 'Frozen', '2up', '5.7', '9.3138', '4', 0, 121, 0),
(122, '2024-09-21', '1001', '4000/n04', NULL, 'Frozen', '1.5up', '6', '9.804', '6', 0, 122, 0),
(123, '2024-09-21', '1001', '4000/n04', NULL, 'Frozen', '1up', '16.2', '26.4708', '21', 0, 123, 0),
(124, '2024-09-21', '1002', '4000/n04', NULL, 'Frozen', '3up', '22.6', '36.9284', '8', 0, 124, 0),
(125, '2024-09-21', '1002', '4000/n04', NULL, 'Frozen', '2up', '12.4', '20.2616', '8', 0, 125, 0),
(126, '2024-09-21', '1002', '4000/n04', NULL, 'Frozen', '1.5up', '5.7', '9.3138', '5', 0, 126, 0),
(127, '2024-09-21', '1004', '4000/t07', NULL, 'Frozen', 'J', '275', '449.35', '', 0, 127, 0),
(128, '2024-09-21', '1031', '4000/s03', NULL, 'Frozen', '4up', '3216.1', '5255.1074', '790', 0, 128, 0),
(129, '2024-09-21', '1031', '4000/s03', NULL, 'Frozen', '3up', '15.8', '25.8172', '8', 0, 129, 0),
(130, '2024-09-22', '1015', '4000/t11', NULL, 'Frozen', '3/5', '25.9', '42.3206', '112', 0, 130, 0),
(131, '2024-09-22', '1015', '4000/t11', NULL, 'Frozen', '5/8', '406.1', '663.5674', '1055', 0, 131, 0),
(132, '2024-09-22', '1015', '4000/t11', NULL, 'Frozen', '10/12', '15.4', '25.1636', '23', 0, 132, 0),
(133, '2024-09-22', '1001', '4000/t02', NULL, 'Frozen', '3up', '30', '49.02', '13', 0, 133, 0),
(134, '2024-09-22', '1001', '4000/t02', NULL, 'Frozen', '2up', '16.2', '26.4708', '12', 0, 134, 0),
(135, '2024-09-22', '1001', '4000/t02', NULL, 'Frozen', '1.5up', '25.8', '42.1572', '23', 0, 135, 0),
(136, '2024-09-22', '1001', '4000/t02', NULL, 'Frozen', '1up', '26.2', '42.8108', '36', 0, 136, 0),
(137, '2024-09-22', '1001', '4000/t02', NULL, 'Frozen', '1D', '9', '14.706', '0', 0, 137, 0),
(138, '2024-09-22', '1002', '4000/t02', NULL, 'Frozen', '3up', '68.6', '112.0924', '28', 0, 138, 0),
(139, '2024-09-22', '1002', '4000/t02', NULL, 'Frozen', '2up', '16.7', '27.2878', '11', 0, 139, 0),
(140, '2024-09-22', '1002', '4000/t02', NULL, 'Frozen', '1.5up', '10.4', '16.9936', '10', 0, 140, 0),
(141, '2024-09-22', '1001', '4000/b01', NULL, 'Frozen', '3up', '12.5', '20.425', '6', 0, 141, 0),
(142, '2024-09-22', '1001', '4000/b01', NULL, 'Frozen', '2up', '9.2', '15.0328', '6', 0, 142, 0),
(143, '2024-09-22', '1001', '4000/b01', NULL, 'Frozen', '15/20', '8', '13.072', '7', 0, 143, 0),
(144, '2024-09-22', '1001', '4000/b01', NULL, 'Frozen', '1up', '4.1', '6.6994', '5', 0, 144, 0),
(145, '2024-09-22', '1002', '4000/b01', NULL, 'Frozen', '4up', '49.75', '81.2915', '16', 0, 145, 0),
(146, '2024-09-22', '1002', '4000/b01', NULL, 'Frozen', '2up', '4.6', '7.5164', '3', 0, 146, 0),
(147, '2024-09-22', '1020', '4000/b01', NULL, 'Frozen', '3up', '29.25', '47.7945', '10', 0, 147, 0),
(148, '2024-09-22', '1020', '4000/b01', NULL, 'Frozen', '2up', '10.4', '16.9936', '6', 0, 148, 0),
(149, '2024-09-22', '1004', '4000/t07', NULL, 'Frozen', 'J', '159.55', '260.7047', '0', 0, 149, 0),
(150, '2024-09-22', '1015', '4000/k15', NULL, 'Frozen', '3/5', '92.8', '151.6352', '450', 0, 150, 0),
(151, '2024-09-22', '1015', '4000/t01', NULL, 'Frozen', '3/5', '138.6', '226.4724', '', 0, 151, 0),
(152, '2024-09-22', '1015', '4000/t01', NULL, 'Frozen', '5/8', '258', '421.572', '', 0, 152, 0),
(153, '2024-09-22', '1015', '4000/t01', NULL, 'Frozen', '10/12', '202.7', '331.2118', '', 0, 153, 0),
(154, '2024-09-22', '1015', '4000/t01', NULL, 'Frozen', '5/8D', '10.2', '16.6668', '', 0, 154, 0),
(155, '2024-09-22', '1015', '4000/t01', NULL, 'Frozen', '10/12D', '27.4', '44.7716', '', 0, 155, 0),
(156, '2024-09-22', '1004', '4000/s06', NULL, 'Frozen', 'J', '46.3', '75.6542', '', 0, 156, 0),
(157, '2024-09-22', '1015', '4000/a03', NULL, 'Frozen', '3/5', '274.95', '449.2683', '', 0, 157, 0),
(158, '2024-09-22', '1037', '4000/a03', NULL, 'Frozen', '1/2', '49.2', '80.3928', '', 0, 158, 0),
(159, '2024-09-22', '1037', '4000/a03', NULL, 'Frozen', '8/10', '33', '53.922', '', 0, 159, 0),
(160, '2024-09-23', '1002', '4000/b01', NULL, 'Frozen', '4up', '29.1', '47.5494', '10', 0, 160, 0),
(161, '2024-09-23', '1002', '4000/b01', NULL, 'Frozen', '2up', '20.5', '33.497', '13', 0, 161, 0),
(162, '2024-09-23', '1002', '4000/b01', NULL, 'Frozen', '1.5up', '2.2', '3.5948', '2', 0, 162, 0),
(163, '2024-09-23', '1001', '4000/b01', NULL, 'Frozen', '3up', '10.9', '17.8106', '5', 0, 163, 0),
(164, '2024-09-23', '1001', '4000/b01', NULL, 'Frozen', '2up', '11.3', '18.4642', '7', 0, 164, 0),
(165, '2024-09-23', '1001', '4000/b01', NULL, 'Frozen', '1.5up', '12', '19.608', '10', 0, 165, 0),
(166, '2024-09-23', '1030', '4000/b01', NULL, 'Frozen', 'J', '262.4', '428.7616', '', 0, 166, 0),
(167, '2024-09-23', '1006', '4000/p02', NULL, 'Frozen', 'pcs', '2500', '4085', '0', 0, 167, 0),
(168, '2024-09-23', '1031', '4000/s03', NULL, 'Frozen', '2up', '144.3', '235.7862', '', 0, 168, 0),
(169, '2024-09-23', '1031', '4000/s03', NULL, 'Frozen', '3up', '1325.2', '2165.3768', '', 0, 169, 0),
(170, '2024-09-23', '1031', '4000/s03', NULL, 'Frozen', '4up', '2770.6', '4527.1604', '', 0, 170, 0),
(171, '2024-09-23', '1023', '4000/t05', NULL, 'Frozen', '3up', '177.3', '289.7082', '', 0, 171, 0),
(172, '2024-09-23', '1023', '4000/t05', NULL, 'Frozen', '4up', '197.1', '322.0614', '', 0, 172, 0),
(173, '2024-09-23', '1023', '4000/t05', NULL, 'Frozen', '5/6', '138.5', '226.309', '', 0, 173, 0),
(174, '2024-09-23', '1031', '4000/t05', NULL, 'Frozen', '2/3', '827', '1351.318', '', 0, 174, 0),
(175, '2024-09-23', '1031', '4000/t05', NULL, 'Frozen', '4up', '1025.1', '1675.0134', '', 0, 175, 0),
(176, '2024-09-23', '1031', '4000/t05', NULL, 'Frozen', '5/6', '3755.4', '6136.3236', '', 0, 176, 0),
(177, '2024-09-24', '1015', '4000/k10', NULL, 'Frozen', 'J', '26.3', '42.9742', '', 0, 177, 0),
(178, '2024-09-24', '1001', '4000/t02', NULL, 'Frozen', '3up', '30.2', '49.3468', '11', 0, 178, 0),
(179, '2024-09-24', '1001', '4000/t02', NULL, 'Frozen', '2up', '21.6', '35.2944', '15', 0, 179, 0),
(180, '2024-09-24', '1001', '4000/t02', NULL, 'Frozen', '1.5up', '7.2', '11.7648', '7', 0, 180, 0),
(181, '2024-09-24', '1001', '4000/t02', NULL, 'Frozen', '1up', '22.8', '37.2552', '29', 0, 181, 0),
(182, '2024-09-24', '1001', '4000/t02', NULL, 'Frozen', '1D', '8.8', '14.3792', '', 0, 182, 0),
(183, '2024-09-24', '1002', '4000/t02', NULL, 'Frozen', '3up', '75.6', '123.5304', '31', 0, 183, 0),
(184, '2024-09-24', '1002', '4000/t02', NULL, 'Frozen', '2up', '12.3', '20.0982', '9', 0, 184, 0),
(185, '2024-09-24', '1002', '4000/t02', NULL, 'Frozen', '1.5up', '17.1', '27.9414', '16', 0, 185, 0),
(186, '2024-09-24', '1002', '4000/b01', NULL, 'Frozen', '3/4', '97.35', '159.0699', '32', 0, 186, 0),
(187, '2024-09-24', '1002', '4000/b01', NULL, 'Frozen', '2up', '33.5', '54.739', '21', 0, 187, 0),
(188, '2024-09-24', '1002', '4000/b01', NULL, 'Frozen', '1.5up', '11.25', '18.3825', '10', 0, 188, 0),
(189, '2024-09-24', '1001', '4000/b01', NULL, 'Frozen', '3up', '18.6', '30.3924', '6', 0, 189, 0),
(190, '2024-09-24', '1001', '4000/b01', NULL, 'Frozen', '2up', '5.6', '9.1504', '4', 0, 190, 0),
(191, '2024-09-24', '1001', '4000/b01', NULL, 'Frozen', '1.5up', '13.2', '21.5688', '13', 0, 191, 0),
(192, '2024-09-24', '1001', '4000/b01', NULL, 'Frozen', '1up', '8.4', '13.7256', '10', 0, 192, 0),
(193, '2024-09-24', '1020', '4000/b01', NULL, 'Frozen', '3/4', '196.95', '321.8163', '', 0, 193, 0),
(194, '2024-09-24', '1020', '4000/b01', NULL, 'Frozen', '2up', '35.7', '58.3338', '', 0, 194, 0),
(195, '2024-09-24', '1037', '4000/a03', NULL, 'Frozen', '1/2', '439.3', '717.8162', '', 0, 195, 0),
(196, '2024-09-24', '1037', '4000/a03', NULL, 'Frozen', '8/10', '176', '287.584', '', 0, 196, 0),
(197, '2024-09-24', '1037', '4000/a03', NULL, 'Frozen', '1/2', '198', '323.532', '', 0, 197, 0),
(198, '2024-09-24', '1037', '4000/a03', NULL, 'Frozen', '8/10', '164.9', '269.4466', '', 0, 198, 0),
(199, '2024-09-24', '1015', '4000/y01', NULL, 'Frozen', 'J', '33.5', '54.739', '', 0, 199, 0),
(200, '2024-09-24', '1015', '4000/t03', NULL, 'Frozen', '10/12', '56.6', '92.4844', '87', 0, 200, 0),
(201, '2024-09-24', '1015', '4000/s01', NULL, 'Frozen', '5/8', '172.8', '282.3552', '450', 0, 201, 0),
(202, '2024-09-24', '1015', '4000/s01', NULL, 'Frozen', '10/12', '96.6', '157.8444', '149', 0, 202, 0),
(203, '2024-09-24', '1019', '4000/a14', NULL, 'Frozen', 'J', '940', '1535.96', '', 0, 203, 0),
(204, '2024-09-25', '1037', '4000/a03', NULL, 'Frozen', '1/2', '304.9', '498.2066', '', 0, 204, 0),
(205, '2024-09-25', '1037', '4000/a03', NULL, 'Frozen', '8/10', '250.7', '409.6438', '', 0, 205, 0),
(206, '2024-09-25', '1037', '4000/h01', NULL, 'Frozen', '1/2', '28.4', '46.4056', '', 0, 206, 0),
(207, '2024-09-25', '1037', '4000/h01', NULL, 'Frozen', '8/10', '63.6', '103.9224', '', 0, 207, 0),
(208, '2024-09-25', '1002', '4000/b01', NULL, 'Frozen', '3/4', '47.2', '77.1248', '16', 0, 208, 0),
(209, '2024-09-25', '1002', '4000/b01', NULL, 'Frozen', '2up', '12.7', '20.7518', '8', 0, 209, 0),
(210, '2024-09-25', '1002', '4000/b01', NULL, 'Frozen', '1up', '3.3', '5.3922', '3', 0, 210, 0),
(211, '2024-09-25', '1001', '4000/b01', NULL, 'Frozen', '3up', '27.5', '44.935', '11', 0, 211, 0),
(212, '2024-09-25', '1001', '4000/b01', NULL, 'Frozen', '2up', '12.8', '20.9152', '8', 0, 212, 0),
(213, '2024-09-25', '1001', '4000/b01', NULL, 'Frozen', '1.5up', '15.3', '25.0002', '14', 0, 213, 0),
(214, '2024-09-25', '1001', '4000/b01', NULL, 'Frozen', '1.5up', '5', '8.17', '6', 0, 214, 0),
(215, '2024-09-25', '1020', '4000/b01', NULL, 'Frozen', '3/4', '33.5', '54.739', '', 0, 215, 0),
(216, '2024-09-25', '1020', '4000/b01', NULL, 'Frozen', '2up', '12', '19.608', '', 0, 216, 0),
(217, '2024-09-25', '1037', '4000/a01', NULL, 'Frozen', '8/10', '18.3', '29.9022', '', 0, 217, 0),
(218, '2024-09-25', '1037', '4000/a01', NULL, 'Frozen', '1/2', '37.9', '61.9286', '', 0, 218, 0),
(219, '2024-09-25', '1015', '4000/a01', NULL, 'Frozen', '5/8', '102.7', '167.8118', '261', 0, 219, 0),
(220, '2024-09-25', '1015', '4000/a01', NULL, 'Frozen', '10/12', '62', '101.308', '93', 0, 220, 0),
(221, '2024-09-25', '1015', '4000/s01', NULL, 'Frozen', '5/8', '127.5', '208.335', '337', 0, 221, 0),
(222, '2024-09-25', '1015', '4000/s01', NULL, 'Frozen', '10/12', '46.5', '75.981', '69', 0, 222, 0),
(223, '2024-09-26', '1019', '4000/a14', NULL, 'Frozen', 'J', '337.8', '551.9652', '', 0, 223, 0),
(224, '2024-09-26', '1037', '4000/a02', NULL, 'Frozen', '1/2', '80.4', '131.3736', '0', 0, 224, 0),
(225, '2024-09-26', '1027', '4000/a02', NULL, 'Frozen', 'J', '4.9', '8.0066', '', 0, 225, 0),
(226, '2024-09-26', '1027', '4000/s04', NULL, 'Frozen', '1up', '27.6', '45.0984', '', 0, 226, 0),
(227, '2024-09-26', '1001', '4000/t02', NULL, 'Frozen', '3up', '25.8', '42.1572', '11', 0, 227, 0),
(228, '2024-09-26', '1001', '4000/t02', NULL, 'Frozen', '2up', '13.6', '22.2224', '10', 0, 228, 0),
(229, '2024-09-26', '1001', '4000/t02', NULL, 'Frozen', '1.5up', '13.4', '21.8956', '13', 0, 229, 0),
(230, '2024-09-26', '1002', '4000/t02', NULL, 'Frozen', '3up', '47.5', '77.615', '18', 0, 230, 0),
(231, '2024-09-26', '1002', '4000/t02', NULL, 'Frozen', '2up', '10', '16.34', '6', 0, 231, 0),
(232, '2024-09-26', '1002', '4000/t02', NULL, 'Frozen', '1.5up', '13.8', '22.5492', '13', 0, 232, 0),
(233, '2024-09-26', '1002', '4000/n04', NULL, 'Frozen', '3up', '44.1', '72.0594', '19', 0, 233, 0),
(234, '2024-09-26', '1002', '4000/n04', NULL, 'Frozen', '2up', '19.1', '31.2094', '12', 0, 234, 0),
(235, '2024-09-26', '1002', '4000/n04', NULL, 'Frozen', '1.5up', '4.2', '6.8628', '4', 0, 235, 0),
(236, '2024-09-26', '1001', '4000/n04', NULL, 'Frozen', '3up', '9.4', '15.3596', '3', 0, 236, 0),
(237, '2024-09-26', '1001', '4000/n04', NULL, 'Frozen', '2up', '2.7', '4.4118', '2', 0, 237, 0),
(238, '2024-09-26', '1001', '4000/n04', NULL, 'Frozen', '1.5up', '1.8', '2.9412', '2', 0, 238, 0),
(239, '2024-09-26', '1001', '4000/n04', NULL, 'Frozen', '1up', '9.8', '16.0132', '14', 0, 239, 0),
(240, '2024-09-26', '1015', '4000/s01', NULL, 'Frozen', '5/8', '131.5', '214.871', '330', 0, 240, 0),
(241, '2024-09-26', '1015', '4000/s01', NULL, 'Frozen', '10/12', '18.8', '30.7192', '27', 0, 241, 0),
(242, '2024-09-26', '1015', '4000/s01', NULL, 'Frozen', '12/15', '10.5', '17.157', '12', 0, 242, 0),
(243, '2024-09-26', '1002', '4000/b01', NULL, 'Frozen', '3/4', '40.1', '65.5234', '14', 0, 243, 0),
(244, '2024-09-26', '1002', '4000/b01', NULL, 'Frozen', '2up', '20.5', '33.497', '12', 0, 244, 0),
(245, '2024-09-26', '1002', '4000/b01', NULL, 'Frozen', '1up', '4.7', '7.6798', '4', 0, 245, 0),
(246, '2024-09-26', '1001', '4000/b01', NULL, 'Frozen', '3up', '22.8', '37.2552', '9', 0, 246, 0),
(247, '2024-09-26', '1001', '4000/b01', NULL, 'Frozen', '2up', '16.4', '26.7976', '11', 0, 247, 0),
(248, '2024-09-26', '1001', '4000/b01', NULL, 'Frozen', '1.5up', '21.75', '35.5395', '20', 0, 248, 0),
(249, '2024-09-26', '1001', '4000/b01', NULL, 'Frozen', '1up', '11.7', '19.1178', '14', 0, 249, 0),
(250, '2024-09-26', '1020', '4000/b01', NULL, 'Frozen', '3/4', '42.1', '68.7914', '', 0, 250, 0),
(251, '2024-09-26', '1020', '4000/b01', NULL, 'Frozen', '2up', '7', '11.438', '', 0, 251, 0),
(252, '2024-09-26', '1037', '4000/k07', NULL, 'Frozen', '1/2', '71.4', '116.6676', '', 0, 252, 0),
(253, '2024-09-26', '1037', '4000/k07', NULL, 'Frozen', '8/10', '489.3', '799.5162', '', 0, 253, 0),
(254, '2024-09-25', '1037', '4000/k07', NULL, 'Frozen', '1/2', '120', '196.08', '', 0, 254, 0),
(255, '2024-09-25', '1037', '4000/k07', NULL, 'Frozen', '80up', '193', '315.362', '', 0, 255, 0),
(256, '2024-09-27', '1037', '4000/a03', NULL, 'Frozen', '1/2', '280.2', '457.8468', '', 0, 256, 0),
(257, '2024-09-27', '1037', '4000/a03', NULL, 'Frozen', '8/10', '106.9', '174.6746', '', 0, 257, 0),
(258, '2024-09-27', '1004', '4000/t07', NULL, 'Frozen', 'J', '214.7', '350.8198', '', 0, 258, 0),
(259, '2024-09-27', '1002', '4000/b01', NULL, 'Frozen', '3/4', '133.25', '217.7305', '41', 0, 259, 0),
(260, '2024-09-27', '1002', '4000/b01', NULL, 'Frozen', '2up', '30.5', '49.837', '20', 0, 260, 0),
(261, '2024-09-27', '1002', '4000/b01', NULL, 'Frozen', '1up', '7', '11.438', '6', 0, 261, 0),
(262, '2024-09-27', '1001', '4000/b01', NULL, 'Frozen', '3up', '19.2', '31.3728', '8', 0, 262, 0),
(263, '2024-09-27', '1001', '4000/b01', NULL, 'Frozen', '2up', '20.3', '33.1702', '12', 0, 263, 0),
(264, '2024-09-27', '1001', '4000/b01', NULL, 'Frozen', '1.5up', '20', '32.68', '21', 0, 264, 0),
(265, '2024-09-27', '1001', '4000/b01', NULL, 'Frozen', '1up', '12.8', '20.9152', '15', 0, 265, 0),
(266, '2024-09-27', '1015', '4000/k11', NULL, 'Frozen', '3/5', '234.6', '383.3364', '1063', 0, 266, 0),
(267, '2024-09-27', '1015', '4000/k11', NULL, 'Frozen', '5/8', '28.7', '46.8958', '79', 0, 267, 0),
(268, '2024-09-27', '1015', '4000/t11', NULL, 'Frozen', '5/8', '216.1', '353.1074', '569', 0, 268, 0),
(269, '2024-09-27', '1015', '4000/t11', NULL, 'Frozen', '5/8D', '32.9', '53.7586', '107', 0, 269, 0),
(270, '2024-09-27', '1015', '4000/t11', NULL, 'Frozen', '10/12', '49.8', '81.3732', '75', 0, 270, 0),
(271, '2024-09-27', '1002', '4000/z03', NULL, 'Frozen', '3/4', '94.3', '154.0862', '35', 0, 271, 0),
(272, '2024-09-27', '1002', '4000/z03', NULL, 'Frozen', '2up', '40', '65.36', '26', 0, 272, 0),
(273, '2024-09-27', '1002', '4000/z03', NULL, 'Frozen', '1.5up', '18.1', '29.5754', '17', 0, 273, 0),
(274, '2024-09-27', '1002', '4000/z03', NULL, 'Frozen', '1up', '6.5', '10.621', '8', 0, 274, 0),
(275, '2024-09-27', '1001', '4000/z03', NULL, 'Frozen', '3up', '63', '102.942', '29', 0, 275, 0),
(276, '2024-09-27', '1001', '4000/z03', NULL, 'Frozen', '2up', '27.25', '44.5265', '17', 0, 276, 0),
(277, '2024-09-27', '1001', '4000/z03', NULL, 'Frozen', '1.5up', '24.25', '39.6245', '26', 0, 277, 0),
(278, '2024-09-27', '1001', '4000/z03', NULL, 'Frozen', '1D', '5.4', '8.8236', '9', 0, 278, 0),
(279, '2024-09-28', '1037', '4000/a03', NULL, 'Frozen', '8/10', '64.1', '104.7394', '', 0, 279, 0),
(280, '2024-09-28', '1037', '4000/a03', NULL, 'Frozen', '1/2', '172.2', '281.3748', '', 0, 280, 0),
(281, '2024-09-28', '1037', '4000/k07', NULL, 'Frozen', '1/2', '2.6', '4.2484', '', 0, 281, 0),
(282, '2024-09-28', '1037', '4000/k07', NULL, 'Frozen', '8/10', '31', '50.654', '', 0, 282, 0),
(283, '2024-09-28', '1001', '4000/n04', NULL, 'Frozen', '3up', '24.8', '40.5232', '11', 0, 283, 0),
(284, '2024-09-28', '1001', '4000/n04', NULL, 'Frozen', '2up', '14.3', '23.3662', '9', 0, 284, 0),
(285, '2024-09-28', '1001', '4000/n04', NULL, 'Frozen', '1.5up', '6', '9.804', '6', 0, 285, 0),
(286, '2024-09-28', '1001', '4000/n04', NULL, 'Frozen', '1up', '6', '9.804', '8', 0, 286, 0),
(287, '2024-09-28', '1002', '4000/n04', NULL, 'Frozen', '3up', '35.2', '57.5168', '13', 0, 287, 0),
(288, '2024-09-28', '1002', '4000/n04', NULL, 'Frozen', '2up', '19.2', '31.3728', '12', 0, 288, 0),
(289, '2024-09-28', '1002', '4000/n04', NULL, 'Frozen', '1.5up', '2', '3.268', '2', 0, 289, 0),
(290, '2024-09-28', '1001', '4000/b01', NULL, 'Frozen', '3up', '44.4', '72.5496', '19', 0, 290, 0),
(291, '2024-09-28', '1001', '4000/b01', NULL, 'Frozen', '2up', '22', '35.948', '14', 0, 291, 0),
(292, '2024-09-28', '1001', '4000/b01', NULL, 'Frozen', '1.5up', '33.9', '55.3926', '32', 0, 292, 0),
(293, '2024-09-28', '1001', '4000/b01', NULL, 'Frozen', '1up', '12.6', '20.5884', '14', 0, 293, 0),
(294, '2024-09-28', '1002', '4000/b01', NULL, 'Frozen', '3/4', '86.05', '140.6057', '32', 0, 294, 0),
(295, '2024-09-28', '1002', '4000/b01', NULL, 'Frozen', '2up', '20.1', '32.8434', '13', 0, 295, 0),
(297, '2024-09-28', '1002', '4000/b01', NULL, 'Frozen', '1.5up', '12.4', '20.2616', '12', 0, 297, 0),
(298, '2024-09-28', '1020', '4000/b01', NULL, 'Frozen', '3/4', '139.3', '227.6162', '', 0, 298, 0),
(299, '2024-09-28', '1020', '4000/b01', NULL, 'Frozen', '2up', '19.8', '32.3532', '', 0, 299, 0),
(300, '2024-09-28', '1037', '4000/h01', NULL, 'Frozen', '8/10', '69.6', '113.7264', '', 0, 300, 0),
(301, '2024-09-28', '1037', '4000/h01', NULL, 'Frozen', '1/2', '88.1', '143.9554', '', 0, 301, 0),
(302, '2024-09-28', '1027', '4000/s04', NULL, 'Frozen', '1up', '88.8', '145.0992', '', 0, 302, 0),
(303, '2024-09-28', '1004', '4000/t07', NULL, 'Frozen', 'J', '224.85', '367.4049', '', 0, 303, 0),
(304, '2024-09-28', '1001', '4000/t02', NULL, 'Frozen', '3up', '19.2', '31.3728', '7', 0, 304, 0),
(305, '2024-09-28', '1001', '4000/t02', NULL, 'Frozen', '2up', '21', '34.314', '19', 0, 305, 0),
(306, '2024-09-28', '1001', '4000/t02', NULL, 'Frozen', '1.5up', '10.4', '16.9936', '8', 0, 306, 0),
(307, '2024-09-28', '1001', '4000/t02', NULL, 'Frozen', '1up', '22.3', '36.4382', '28', 0, 307, 0),
(308, '2024-09-28', '1002', '4000/t02', NULL, 'Frozen', '3up', '49.7', '81.2098', '18', 0, 308, 0),
(309, '2024-09-28', '1002', '4000/t02', NULL, 'Frozen', '2up', '13.3', '21.7322', '10', 0, 309, 0),
(310, '2024-09-28', '1002', '4000/t02', NULL, 'Frozen', '1.5up', '8.1', '13.2354', '8', 0, 310, 0),
(311, '2024-09-29', '1019', '4000/a14', NULL, 'Frozen', 'J', '959.4', '1567.6596', '', 0, 311, 0),
(312, '2024-09-29', '1004', '4000/t07', NULL, 'Frozen', 'J', '384.85', '628.8449', '', 0, 312, 0),
(313, '2024-09-29', '1030', '4000/t07', NULL, 'Frozen', 'J', '154', '251.636', '', 0, 313, 0),
(314, '2024-09-29', '1015', '4000/k15', NULL, 'Frozen', '4/5', '93.1', '152.1254', '', 0, 314, 0),
(315, '2024-09-29', '1001', '4000/b01', NULL, 'Frozen', '3up', '25.4', '41.5036', '10', 0, 315, 0),
(316, '2024-09-29', '1001', '4000/b01', NULL, 'Frozen', '2up', '26.8', '43.7912', '17', 0, 316, 0),
(317, '2024-09-29', '1001', '4000/b01', NULL, 'Frozen', '1.5up', '28', '45.752', '22', 0, 317, 0),
(318, '2024-09-29', '1001', '4000/b01', NULL, 'Frozen', '1up', '7.2', '11.7648', '1', 0, 318, 0),
(319, '2024-09-29', '1002', '4000/b01', NULL, 'Frozen', '3/4', '116.3', '190.0342', '39', 0, 319, 0),
(320, '2024-09-29', '1002', '4000/b01', NULL, 'Frozen', '2up', '15.8', '25.8172', '10', 0, 320, 0),
(321, '2024-09-29', '1002', '4000/b01', NULL, 'Frozen', '1.5up', '12.3', '20.0982', '11', 0, 321, 0),
(322, '2024-09-29', '1020', '4000/b01', NULL, 'Frozen', '3up', '144.9', '236.7666', '', 0, 322, 0),
(323, '2024-09-29', '1020', '4000/b01', NULL, 'Frozen', '2up', '14.8', '24.1832', '', 0, 323, 0),
(324, '2024-09-29', '1015', '4000/t11', NULL, 'Frozen', '5/8', '285.2', '466.0168', '774', 0, 324, 0),
(325, '2024-09-29', '1015', '4000/t11', NULL, 'Frozen', '5/8D', '13.3', '21.7322', '43', 0, 325, 0),
(326, '2024-09-29', '1015', '4000/t11', NULL, 'Frozen', '10/12', '49', '80.066', '75', 0, 326, 0),
(327, '2024-09-30', '1015', '4000/k15', NULL, 'Frozen', '4/5', '56.5', '92.321', '211', 0, 327, 0),
(328, '2024-09-30', '1015', '4000/k15', NULL, 'Frozen', 'J', '20.8', '33.9872', '0', 0, 328, 0),
(329, '2024-09-30', '1002', '4000/n04', NULL, 'Frozen', '3up', '53.6', '87.5824', '22', 0, 329, 0),
(330, '2024-09-30', '1002', '4000/n04', NULL, 'Frozen', '2up', '23.8', '38.8892', '18', 0, 330, 0),
(331, '2024-09-30', '1002', '4000/n04', NULL, 'Frozen', '1.5up', '7', '11.438', '6', 0, 331, 0),
(332, '2024-09-30', '1001', '4000/n04', NULL, 'Frozen', '3up', '19.3', '31.5362', '8', 0, 332, 0),
(333, '2024-09-30', '1001', '4000/n04', NULL, 'Frozen', '2up', '10.7', '17.4838', '7', 0, 333, 0),
(334, '2024-09-30', '1001', '4000/n04', NULL, 'Frozen', '1.5up', '3.9', '6.3726', '4', 0, 334, 0),
(335, '2024-09-30', '1001', '4000/n04', NULL, 'Frozen', '1up', '16.9', '27.6146', '23', 0, 335, 0),
(336, '2024-09-30', '1017', '4000/b01', NULL, 'Frozen', '7up', '480.1', '784.4834', '0', 0, 336, 0),
(337, '2024-09-30', '1001', '4000/b01', NULL, 'Frozen', '3up', '25.4', '41.5036', '0', 0, 337, 0),
(338, '2024-09-30', '1001', '4000/b01', NULL, 'Frozen', '2up', '19.5', '31.863', '0', 0, 338, 0),
(339, '2024-09-30', '1001', '4000/b01', NULL, 'Frozen', '1.5up', '21.3', '34.8042', '0', 0, 339, 0),
(340, '2024-09-30', '1001', '4000/b01', NULL, 'Frozen', '1up', '4', '6.536', '0', 0, 340, 0),
(341, '2024-09-30', '1002', '4000/b01', NULL, 'Frozen', '3/4', '103.3', '168.7922', '0', 0, 341, 0),
(342, '2024-09-30', '1002', '4000/b01', NULL, 'Frozen', '2up', '33', '53.922', '0', 0, 342, 0),
(343, '2024-09-30', '1002', '4000/b01', NULL, 'Frozen', '1.5up', '20.3', '33.1702', '0', 0, 343, 0),
(344, '2024-09-30', '1020', '4000/b01', NULL, 'Frozen', '3/4', '63.7', '104.0858', '0', 0, 344, 0),
(345, '2024-09-30', '1020', '4000/b01', NULL, 'Frozen', '2up', '30.9', '50.4906', '0', 0, 345, 0),
(346, '2024-09-30', '1001', '4000/t02', NULL, 'Frozen', '3up', '28.2', '46.0788', '14', 0, 346, 0),
(347, '2024-09-30', '1001', '4000/t02', NULL, 'Frozen', '2up', '49.5', '80.883', '35', 0, 347, 0),
(348, '2024-09-30', '1001', '4000/t02', NULL, 'Frozen', '1.5up', '41.3', '67.4842', '42', 0, 348, 0),
(349, '2024-09-30', '1001', '4000/t02', NULL, 'Frozen', '1up', '51.8', '84.6412', '73', 0, 349, 0),
(350, '2024-09-30', '1001', '4000/t02', NULL, 'Frozen', '1D', '25', '40.85', '0', 0, 350, 0),
(351, '2024-09-30', '1002', '4000/t02', NULL, 'Frozen', '3up', '50.4', '82.3536', '22', 0, 351, 0),
(352, '2024-09-30', '1002', '4000/t02', NULL, 'Frozen', '2up', '18.3', '29.9022', '14', 0, 352, 0),
(353, '2024-09-30', '1002', '4000/t02', NULL, 'Frozen', '1.5up', '23', '37.582', '20', 0, 353, 0),
(354, '2024-09-30', '1023', '4000/t05', NULL, 'Frozen', '2up', '13.3', '21.7322', '7', 0, 354, 0),
(355, '2024-09-30', '1023', '4000/t05', NULL, 'Frozen', '3up', '669.4', '1093.7996', '296', 0, 355, 0),
(356, '2024-09-30', '1023', '4000/t05', NULL, 'Frozen', '4up', '477.1', '779.5814', '174', 0, 356, 0),
(357, '2024-09-30', '1023', '4000/t05', NULL, 'Frozen', '5up', '304.4', '497.3896', '90', 0, 357, 0),
(358, '2024-09-30', '1031', '4000/t05', NULL, 'Frozen', '3up', '112.5', '183.825', '40', 0, 358, 0),
(359, '2024-09-30', '1031', '4000/t05', NULL, 'Frozen', '4up', '2023', '3305.582', '648', 0, 359, 0),
(360, '2024-09-30', '1031', '4000/t05', NULL, 'Frozen', '5up', '968.6', '1582.6924', '255', 0, 360, 0),
(361, '2024-09-30', '1030', '4000/t07', NULL, 'Frozen', 'J', '63.25', '103.3505', '', 0, 366, 0),
(362, '2024-10-01', '1030', '4000/t07', NULL, 'Frozen', 'J', '46.75', '76.3895', '', 0, 367, 0),
(363, '2024-10-01', '1004', '4000/t07', NULL, 'Frozen', 'J', '108.3', '176.9622', '', 0, 368, 0),
(364, '2024-10-01', '1037', '4000/a03', NULL, 'Frozen', '80/110', '44.8', '73.2032', '0', 0, 369, 0),
(365, '2024-10-01', '1037', '4000/a03', NULL, 'Frozen', '110/210', '40.1', '65.5234', '0', 0, 370, 0),
(366, '2024-10-01', '1015', '4000/s01', NULL, 'Frozen', '5/8', '73', '119.282', '', 0, 371, 0),
(367, '2024-10-01', '1001', '4000/b01', NULL, 'Frozen', '3up', '29.4', '48.0396', '16', 0, 372, 0),
(368, '2024-10-01', '1001', '4000/b01', NULL, 'Frozen', '2up', '30', '49.02', '20', 0, 373, 0),
(369, '2024-10-01', '1001', '4000/b01', NULL, 'Frozen', '1.5up', '23.4', '38.2356', '', 0, 374, 0),
(370, '2024-10-01', '1001', '4000/b01', NULL, 'Frozen', '1up', '5', '8.17', '6', 0, 375, 0),
(371, '2024-10-01', '1002', '4000/b01', NULL, 'Frozen', '3/4', '103.9', '169.7726', '31', 0, 376, 0),
(372, '2024-10-01', '1002', '4000/b01', NULL, 'Frozen', '2up', '51.2', '83.6608', '34', 0, 377, 0),
(373, '2024-10-01', '1002', '4000/b01', NULL, 'Frozen', '1.5up', '10', '16.34', '9', 0, 378, 0),
(374, '2024-10-01', '1020', '4000/b01', NULL, 'Frozen', '3/4', '79.3', '129.5762', '', 0, 379, 0),
(375, '2024-10-01', '1020', '4000/b01', NULL, 'Frozen', '2up', '41.1', '67.1574', '', 0, 380, 0),
(376, '2024-10-01', '1027', '4000/k03', NULL, 'Frozen', 'J', '236.9', '387.0946', '', 0, 381, 0),
(377, '2024-10-02', '1031', '4000/t05', NULL, 'Frozen', '4up', '73.6', '120.2624', '', 0, 383, 0),
(378, '2024-10-02', '1031', '4000/t05', NULL, 'Frozen', '5up', '1023.2', '1671.9088', '', 0, 384, 0),
(379, '2024-10-02', '1023', '4000/t05', NULL, 'Frozen', '3up', '5', '8.17', '', 0, 385, 0),
(380, '2024-10-02', '1023', '4000/t05', NULL, 'Frozen', '4up', '282.4', '461.4416', '', 0, 386, 0),
(381, '2024-10-02', '1023', '4000/t05', NULL, 'Frozen', '5up', '121.3', '198.2042', '', 0, 387, 0),
(382, '2024-10-02', '1015', '4000/s04', NULL, 'Frozen', '5/8', '88.7', '144.9358', '220', 0, 388, 0),
(383, '2024-10-02', '1015', '4000/s04', NULL, 'Frozen', '10/12', '35.4', '57.8436', '59', 0, 389, 0),
(384, '2024-10-02', '1015', '4000/t01', NULL, 'Frozen', '5/8', '76.4', '124.8376', '175', 0, 390, 0),
(385, '2024-10-02', '1015', '4000/t01', NULL, 'Frozen', '10/12', '149.25', '243.8745', '215', 0, 391, 0),
(386, '2024-10-02', '1037', '4000/a03', NULL, 'Frozen', '1/2', '18.7', '30.5558', '', 0, 392, 0),
(387, '2024-10-02', '1037', '4000/a03', NULL, 'Frozen', '8/10', '13.3', '21.7322', '', 0, 393, 0),
(388, '2024-10-02', '1004', '4000/t07', NULL, 'Frozen', 'J', '74.5', '121.733', '', 0, 394, 0),
(389, '2024-10-02', '1002', '4000/z03', NULL, 'Frozen', '3/4', '121.25', '198.1225', '50', 0, 395, 0),
(390, '2024-10-02', '1002', '4000/z03', NULL, 'Frozen', '2up', '54.5', '89.053', '38', 0, 396, 0),
(391, '2024-10-02', '1002', '4000/z03', NULL, 'Frozen', '1.5up', '36.5', '59.641', '45', 0, 397, 0),
(392, '2024-10-02', '1002', '4000/z03', NULL, 'Frozen', '1up', '7.25', '11.8465', '', 0, 398, 0),
(393, '2024-10-02', '1001', '4000/z03', NULL, 'Frozen', '3up', '19.75', '32.2715', '10', 0, 399, 0),
(394, '2024-10-02', '1001', '4000/z03', NULL, 'Frozen', '2up', '48', '78.432', '35', 0, 400, 0),
(395, '2024-10-02', '1001', '4000/z03', NULL, 'Frozen', '1.5up', '54.25', '88.6445', '53', 0, 401, 0),
(396, '2024-10-02', '1001', '4000/z03', NULL, 'Frozen', '1up', '7.5', '12.255', '12', 0, 402, 0),
(397, '2024-10-02', '1015', '4000/t11', NULL, 'Frozen', '5/8', '168.7', '275.6558', '426', 0, 403, 0),
(398, '2024-10-02', '1002', '4000/b01', NULL, 'Frozen', '3/4', '27.7', '45.2618', '10', 0, 404, 0),
(399, '2024-10-02', '1002', '4000/b01', NULL, 'Frozen', '2up', '3', '4.902', '2', 0, 405, 0),
(400, '2024-10-02', '1002', '4000/b01', NULL, 'Frozen', '1.5up', '8.7', '14.2158', '8', 0, 406, 0),
(401, '2024-10-02', '1001', '4000/b01', NULL, 'Frozen', '3up', '18.6', '30.3924', '8', 0, 407, 0),
(402, '2024-10-02', '1001', '4000/b01', NULL, 'Frozen', '2up', '12.8', '20.9152', '8', 0, 408, 0),
(403, '2024-10-02', '1001', '4000/b01', NULL, 'Frozen', '1.5up', '11.75', '19.1995', '11', 0, 409, 0),
(404, '2024-10-02', '1001', '4000/b01', NULL, 'Frozen', '1up', '4.8', '7.8432', '6', 0, 410, 0),
(405, '2024-10-02', '1020', '4000/b01', NULL, 'Frozen', '3/4', '99.75', '162.9915', '', 0, 411, 0),
(406, '2024-10-02', '1020', '4000/b01', NULL, 'Frozen', '2up', '4.8', '7.8432', '', 0, 412, 0),
(407, '2024-10-02', '1027', '4000/a01', NULL, 'Frozen', '1up', '71.1', '116.1774', '', 0, 413, 0),
(408, '2024-10-02', '1027', '4000/a01', NULL, 'Frozen', '1up', '4.3', '7.0262', '', 0, 414, 0),
(409, '2024-10-02', '1002', '4000/n04', NULL, 'Frozen', '3up', '40.2', '65.6868', '17', 0, 415, 0),
(410, '2024-10-02', '1002', '4000/n04', NULL, 'Frozen', '2up', '15', '24.51', '9', 0, 416, 0),
(411, '2024-10-02', '1001', '4000/n04', NULL, 'Frozen', '3up', '15.2', '24.8368', '6', 0, 417, 0),
(412, '2024-10-02', '1001', '4000/n04', NULL, 'Frozen', '2up', '9.1', '14.8694', '6', 0, 418, 0),
(413, '2024-10-02', '1001', '4000/n04', NULL, 'Frozen', '1.5up', '4', '6.536', '4', 0, 419, 0),
(414, '2024-10-02', '1001', '4000/n04', NULL, 'Frozen', '1up', '15.4', '25.1636', '22', 0, 420, 0),
(415, '2024-10-02', '1025', '4000/w03', NULL, 'Frozen', 'J', '344.6', '563.0764', '', 0, 421, 0),
(416, '2024-10-03', '1023', '4000/t05', NULL, 'Frozen', '4up', '596.4', '974.5176', '', 0, 422, 0),
(417, '2024-10-03', '1023', '4000/t05', NULL, 'Frozen', '5up', '256.8', '419.6112', '', 0, 423, 0),
(418, '2024-10-03', '1031', '4000/t05', NULL, 'Frozen', '4up', '33.1', '54.0854', '', 0, 424, 0),
(419, '2024-10-03', '1031', '4000/t05', NULL, 'Frozen', '5up', '327.3', '534.8082', '', 0, 425, 0),
(420, '2024-10-03', '1015', '4000/t11', NULL, 'Frozen', '5/8', '223.3', '364.8722', '554', 0, 426, 0),
(421, '2024-10-03', '1015', '4000/t11', NULL, 'Frozen', '5/8D', '61.5', '100.491', '200', 0, 427, 0),
(422, '2024-10-03', '1015', '4000/t11', NULL, 'Frozen', '10/12', '13.3', '21.7322', '20', 0, 428, 0),
(423, '2024-10-03', '1037', '4000/a03', NULL, 'Frozen', '1/2', '7.2', '11.7648', '', 0, 429, 0),
(424, '2024-10-03', '1037', '4000/a03', NULL, 'Frozen', '8/10', '61.7', '100.8178', '', 0, 430, 0),
(425, '2024-10-03', '1037', '4000/a03', NULL, 'Frozen', '1/2', '36.7', '59.9678', '', 0, 431, 0),
(426, '2024-10-03', '1037', '4000/a03', NULL, 'Frozen', '8/10', '18.7', '30.5558', '', 0, 432, 0),
(427, '2024-10-03', '1027', '4000/s04', NULL, 'Frozen', '1up', '65.6', '107.1904', '', 0, 433, 0),
(428, '2024-10-03', '1002', '4000/b01', NULL, 'Frozen', '3/4', '64.55', '105.4747', '', 0, 434, 0),
(429, '2024-10-03', '1002', '4000/b01', NULL, 'Frozen', '2up', '22', '35.948', '', 0, 435, 0),
(430, '2024-10-03', '1002', '4000/b01', NULL, 'Frozen', '1.5up', '4.3', '7.0262', '', 0, 436, 0),
(431, '2024-10-03', '1001', '4000/b01', NULL, 'Frozen', '3up', '8.5', '13.889', '', 0, 437, 0),
(432, '2024-10-03', '1001', '4000/b01', NULL, 'Frozen', '2up', '8', '13.072', '', 0, 438, 0),
(433, '2024-10-03', '1001', '4000/b01', NULL, 'Frozen', '1.5up', '9.2', '15.0328', '', 0, 439, 0),
(434, '2024-10-03', '1020', '4000/b01', NULL, 'Frozen', '3/4', '73.1', '119.4454', '', 0, 440, 0),
(435, '2024-10-03', '1020', '4000/b01', NULL, 'Frozen', '2up', '14.7', '24.0198', '', 0, 441, 0),
(436, '2024-10-03', '1001', '4000/t02', NULL, 'Frozen', '3up', '13.4', '21.8956', '6', 0, 442, 0),
(437, '2024-10-03', '1001', '4000/t02', NULL, 'Frozen', '2up', '22.9', '37.4186', '15', 0, 443, 0),
(438, '2024-10-03', '1001', '4000/t02', NULL, 'Frozen', '1.5up', '12.1', '19.7714', '12', 0, 444, 0),
(439, '2024-10-03', '1001', '4000/t02', NULL, 'Frozen', '1D', '12.7', '20.7518', '', 0, 445, 0),
(440, '2024-10-03', '1002', '4000/t02', NULL, 'Frozen', '3up', '83.6', '136.6024', '34', 0, 446, 0),
(441, '2024-10-03', '1002', '4000/t02', NULL, 'Frozen', '2up', '28', '45.752', '20', 0, 447, 0),
(442, '2024-10-03', '1002', '4000/t02', NULL, 'Frozen', '1.5up', '43.5', '71.079', '42', 0, 448, 0),
(443, '2024-10-04', '1031', '4000/t05', NULL, 'Frozen', '4up', '26.8', '43.7912', '', 0, 449, 0),
(444, '2024-10-04', '1031', '4000/t05', NULL, 'Frozen', '5up', '1422.8', '2324.8552', '', 0, 450, 0),
(445, '2024-10-04', '1023', '4000/t05', NULL, 'Frozen', '4up', '181.9', '297.2246', '', 0, 451, 0),
(446, '2024-10-04', '1023', '4000/t05', NULL, 'Frozen', '5up', '102.2', '166.9948', '', 0, 452, 0),
(447, '2024-10-04', '1002', '4000/n04', NULL, 'Frozen', '3up', '49.4', '80.7196', '19', 0, 453, 0),
(448, '2024-10-04', '1002', '4000/n04', NULL, 'Frozen', '2up', '9', '14.706', '6', 0, 454, 0),
(449, '2024-10-04', '1001', '4000/n04', NULL, 'Frozen', '3up', '9.4', '15.3596', '4', 0, 455, 0),
(450, '2024-10-04', '1001', '4000/n04', NULL, 'Frozen', '2up', '5.6', '9.1504', '4', 0, 456, 0),
(451, '2024-10-04', '1002', '4000/b01', NULL, 'Frozen', '3/4', '38.2', '62.4188', '15', 0, 457, 0),
(452, '2024-10-04', '1002', '4000/b01', NULL, 'Frozen', '2up', '11.4', '18.6276', '7', 0, 458, 0),
(453, '2024-10-04', '1001', '4000/b01', NULL, 'Frozen', '3up', '27', '44.118', '12', 0, 459, 0),
(454, '2024-10-04', '1001', '4000/b01', NULL, 'Frozen', '2up', '20', '32.68', '13', 0, 460, 0),
(455, '2024-10-04', '1020', '4000/b01', NULL, 'Frozen', '3/4', '14.5', '23.693', '', 0, 461, 0),
(456, '2024-10-04', '1020', '4000/b01', NULL, 'Frozen', '2up', '28.8', '47.0592', '', 0, 462, 0),
(457, '2024-10-04', '1015', '4000/s04', NULL, 'Frozen', '5/8', '83.4', '136.2756', '149', 0, 463, 0),
(458, '2024-10-04', '1015', '4000/s04', NULL, 'Frozen', '10/12', '31.4', '51.3076', '47', 0, 464, 0),
(459, '2024-10-04', '1015', '4000/t11', NULL, 'Frozen', '5/8', '564.7', '922.7198', '1422', 0, 465, 0),
(460, '2024-10-04', '1015', '4000/t11', NULL, 'Frozen', '10/12', '36.9', '60.2946', '55', 0, 466, 0),
(461, '2024-10-04', '1037', '4000/a03', NULL, 'Frozen', '80/110', '73.4', '119.9356', '', 0, 467, 0),
(462, '2024-10-04', '1019', '4000/a14', NULL, 'Frozen', 'J', '1251.5', '2044.951', '0', 0, 468, 0),
(463, '2024-10-05', '1031', '4000/t05', NULL, 'Frozen', '4up', '24.9', '40.6866', '', 0, 469, 0),
(464, '2024-10-05', '1031', '4000/t05', NULL, 'Frozen', '5up', '252.8', '413.0752', '', 0, 470, 0),
(465, '2024-10-05', '1023', '4000/t05', NULL, 'Frozen', '3up', '2.4', '3.9216', '', 0, 471, 0),
(466, '2024-10-05', '1023', '4000/t05', NULL, 'Frozen', '4up', '687.5', '1123.375', '', 0, 472, 0),
(467, '2024-10-05', '1023', '4000/t05', NULL, 'Frozen', '5up', '375.7', '613.8938', '', 0, 473, 0),
(468, '2024-10-05', '1002', '4000/b01', NULL, 'Frozen', '3/4', '37.4', '61.1116', '10', 0, 474, 0),
(469, '2024-10-05', '1002', '4000/b01', NULL, 'Frozen', '2up', '6.2', '10.1308', '4', 0, 475, 0),
(470, '2024-10-05', '1001', '4000/b01', NULL, 'Frozen', '3up', '15.3', '25.0002', '4', 0, 476, 0),
(471, '2024-10-05', '1001', '4000/b01', NULL, 'Frozen', '2up', '18.4', '30.0656', '12', 0, 477, 0),
(472, '2024-10-05', '1020', '4000/b01', NULL, 'Frozen', '3/4', '64.4', '105.2296', '', 0, 478, 0),
(473, '2024-10-05', '1020', '4000/b01', NULL, 'Frozen', '2up', '17', '27.778', '', 0, 479, 0),
(474, '2024-10-05', '1001', '4000/t02', NULL, 'Frozen', '3up', '20.4', '33.3336', '8', 0, 480, 0),
(475, '2024-10-05', '1001', '4000/t02', NULL, 'Frozen', '2up', '26.1', '42.6474', '18', 0, 481, 0),
(476, '2024-10-05', '1001', '4000/t02', NULL, 'Frozen', '1D', '21', '34.314', '', 0, 482, 0),
(477, '2024-10-05', '1002', '4000/t02', NULL, 'Frozen', '3up', '62.3', '101.7982', '26', 0, 483, 0),
(478, '2024-10-05', '1002', '4000/t02', NULL, 'Frozen', '2up', '22.1', '36.1114', '14', 0, 484, 0),
(479, '2024-10-05', '1002', '4000/b01', NULL, 'Frozen', '3/4', '68.6', '112.0924', '22', 0, 485, 0),
(480, '2024-10-05', '1002', '4000/b01', NULL, 'Frozen', '2up', '18.5', '30.229', '11', 0, 486, 0),
(481, '2024-10-05', '1001', '4000/b01', NULL, 'Frozen', '3up', '23', '37.582', '9', 0, 487, 0),
(482, '2024-10-05', '1001', '4000/b01', NULL, 'Frozen', '2up', '29.25', '47.7945', '19', 0, 488, 0),
(483, '2024-10-05', '1020', '4000/b01', NULL, 'Frozen', '3/4', '64.5', '105.393', '', 0, 489, 0),
(484, '2024-10-05', '1020', '4000/b01', NULL, 'Frozen', '2up', '8.2', '13.3988', '', 0, 490, 0),
(485, '2024-10-05', '1004', '4000/t07', NULL, 'Frozen', 'J', '241.4', '394.4476', '', 0, 491, 0),
(486, '2024-10-07', '1031', '4000/t05', NULL, 'Frozen', '4up', '136.6', '223.2044', '45', 0, 492, 0),
(487, '2024-10-07', '1031', '4000/t05', NULL, 'Frozen', '5up', '1389.2', '2269.9528', '351', 0, 493, 0),
(488, '2024-10-07', '1023', '4000/t05', NULL, 'Frozen', '4up', '440.6', '719.9404', '155', 0, 494, 0),
(489, '2024-10-07', '1023', '4000/t05', NULL, 'Frozen', '5up', '297', '485.298', '84', 0, 495, 0),
(490, '2024-10-07', '1015', '4000/t03', NULL, 'Frozen', 'J', '21.5', '35.131', '', 0, 496, 0),
(491, '2024-10-07', '1037', '4000/t03', NULL, 'Frozen', '1/2', '8.2', '13.3988', '', 0, 497, 0),
(492, '2024-10-07', '1037', '4000/t03', NULL, 'Frozen', '80/100', '29.2', '47.7128', '', 0, 498, 0),
(493, '2024-10-07', '1004', '4000/m09', NULL, 'Frozen', 'J', '270', '441.18', '', 0, 499, 0),
(494, '2024-10-07', '1015', '4000/k15', NULL, 'Frozen', '4/5', '74.1', '121.0794', '', 0, 500, 0),
(495, '2024-10-07', '1015', '4000/k15', NULL, 'Frozen', 'J', '23', '37.582', '', 0, 501, 0),
(496, '2024-10-07', '1001', '4000/b01', NULL, 'Frozen', '3up', '26.25', '42.8925', '11', 0, 502, 0),
(497, '2024-10-07', '1001', '4000/b01', NULL, 'Frozen', '2up', '13.7', '22.3858', '9', 0, 503, 0),
(498, '2024-10-07', '1002', '4000/b01', NULL, 'Frozen', '3/4', '104.55', '170.8347', '35', 0, 504, 0),
(499, '2024-10-07', '1002', '4000/b01', NULL, 'Frozen', '2up', '16.5', '26.961', '10', 0, 505, 0),
(500, '2024-10-07', '1020', '4000/b01', NULL, 'Frozen', '3/4', '41.6', '67.9744', '', 0, 506, 0),
(501, '2024-10-07', '1020', '4000/b01', NULL, 'Frozen', '2up', '14', '22.876', '', 0, 507, 0),
(502, '2024-10-08', '1023', '4000/t05', NULL, 'Frozen', '4up', '505.75', '826.3955', '0', 0, 508, 0),
(503, '2024-10-08', '1023', '4000/t05', NULL, 'Frozen', '5up', '237', '387.258', '0', 0, 509, 0),
(504, '2024-10-08', '1031', '4000/t05', NULL, 'Frozen', '5up', '994.5', '1625.013', '0', 0, 510, 0),
(505, '2024-10-08', '1037', '4000/t08', NULL, 'Frozen', '8/10', '31.7', '51.7978', '0', 0, 511, 0),
(506, '2024-10-08', '1037', '4000/t08', NULL, 'Frozen', '1/2', '1.5', '2.451', '0', 0, 512, 0),
(507, '2024-10-08', '1004', '4000/t07', NULL, 'Frozen', 'J', '266.4', '435.2976', '', 0, 513, 0),
(508, '2024-10-08', '1037', '4000/t03', NULL, 'Frozen', '80/100', '74.2', '121.2428', '', 0, 514, 0),
(509, '2024-10-08', '1037', '4000/t03', NULL, 'Frozen', '1/2', '20.3', '33.1702', '', 0, 515, 0),
(510, '2024-10-08', '1015', '4000/t03', NULL, 'Frozen', 'J', '3.8', '6.2092', '', 0, 516, 0),
(511, '2024-10-08', '1023', '4000/b01', NULL, 'Frozen', 'J', '309.35', '505.4779', '', 0, 517, 0),
(512, '2024-10-08', '1019', '4000/a14', NULL, 'Frozen', 'J', '581.2', '949.6808', '', 0, 518, 0),
(513, '2024-10-09', '1031', '4000/t05', NULL, 'Frozen', '13/18', '362', '591.508', '', 0, 525, 0),
(514, '2024-10-09', '1001', '4000/t05', NULL, 'Frozen', '18/24', '858', '1401.972', '', 0, 526, 0),
(515, '2024-10-09', '1031', '4000/t05', NULL, 'Frozen', '5up', '227.75', '372.1435', '', 0, 527, 0);
INSERT INTO `form7stock` (`id`, `date`, `item_id`, `supplier_name`, `country`, `type`, `size`, `viss`, `kg`, `pcspervr`, `pcsperf7`, `link_id`, `water_kg`) VALUES
(516, '2024-10-09', '1023', '4000/t05', NULL, 'Frozen', '3up', '335.75', '548.6155', '', 0, 528, 0),
(517, '2024-10-09', '1023', '4000/t05', NULL, 'Frozen', '5up', '418.75', '684.2375', '', 0, 529, 0),
(518, '2024-10-09', '1020', '4000/b01', NULL, 'Frozen', '3/4', '90.25', '147.4685', '', 0, 530, 0),
(519, '2024-10-09', '1020', '4000/b01', NULL, 'Frozen', '2up', '8.3', '13.5622', '', 0, 531, 0),
(520, '2024-10-09', '1015', '4000/a01', NULL, 'Frozen', '4/5', '166', '271.244', '614', 0, 532, 0),
(521, '2024-10-09', '1004', '4000/t07', NULL, 'Frozen', 'J', '267.8', '437.5852', '', 0, 533, 0),
(522, '2024-10-09', '1037', '4000/a03', NULL, 'Frozen', '80/110', '171.9', '280.8846', '', 0, 534, 0),
(523, '2024-10-09', '1037', '4000/a03', NULL, 'Frozen', '110/210', '182.2', '297.7148', '0', 0, 535, 0),
(524, '2024-10-09', '1001', '4000/t02', NULL, 'Frozen', '1D', '22.4', '36.6016', '', 0, 536, 0),
(525, '2024-10-09', '1002', '4000/t02', NULL, 'Frozen', '1D', '23.2', '37.9088', '', 0, 537, 0),
(526, '2024-10-10', '1031', '4000/t05', NULL, 'Frozen', '5up', '443.25', '724.2705', '', 0, 538, 0),
(527, '2024-10-10', '1004', '4000/t07', NULL, 'Frozen', 'J', '61.5', '100.491', '', 0, 539, 0),
(528, '2024-10-10', '1020', '4000/b01', NULL, 'Frozen', '3/4', '295.6', '483.0104', '', 0, 540, 0),
(529, '2024-10-10', '1020', '4000/b01', NULL, 'Frozen', '2up', '88.8', '145.0992', '', 0, 541, 0),
(530, '2024-10-10', '1001', '4000/t02', NULL, 'Frozen', '1D', '4.4', '7.1896', '', 0, 542, 0),
(531, '2024-10-10', '1002', '4000/t02', NULL, 'Frozen', '1D', '84.6', '138.2364', '', 0, 543, 0),
(532, '2024-10-10', '1027', '4000/s04', NULL, 'Frozen', 'J', '78.4', '128.1056', '', 0, 544, 0),
(533, '2024-10-11', '1020', '4000/b01', NULL, 'Frozen', '3/4', '160.3', '261.9302', '', 0, 546, 0),
(534, '2024-10-11', '1020', '4000/b01', NULL, 'Frozen', '2up', '59.8', '97.7132', '', 0, 547, 0),
(535, '2024-10-10', '1037', '4000/a03', NULL, 'Frozen', '1/2', '83.1', '135.7854', '', 0, 548, 0),
(536, '2024-10-10', '1037', '4000/a03', NULL, 'Frozen', '8/10', '60.1', '98.2034', '', 0, 549, 0),
(537, '2024-10-11', '1023', '4000/t05', NULL, 'Frozen', '2up', '915.75', '1496.3355', '0', 0, 550, 0),
(538, '2024-10-11', '1023', '4000/t05', NULL, 'Frozen', '3up', '492.75', '805.1535', '0', 0, 551, 0),
(539, '2024-10-11', '1023', '4000/t05', NULL, 'Frozen', '5/6', '160.75', '262.6655', '0', 0, 552, 0),
(540, '2024-10-11', '1031', '4000/t05', NULL, 'Frozen', '5/6', '712', '1163.408', '0', 0, 553, 0),
(541, '2024-10-12', '1020', '4000/a03', NULL, 'Frozen', 'J', '5.7', '9.3138', '', 0, 554, 0),
(542, '2024-10-12', '1002', '4000/t02', NULL, 'Frozen', '1D', '94.1', '153.7594', '', 0, 555, 0),
(543, '2024-10-12', '1020', '4000/b01', NULL, 'Frozen', '3/4', '394.25', '644.2045', '', 0, 556, 0),
(544, '2024-10-12', '1020', '4000/b01', NULL, 'Frozen', '2up', '24.2', '39.5428', '', 0, 557, 0),
(545, '2024-10-12', '1026', '4000/b01', NULL, 'Frozen', 'J', '88.1', '143.9554', '', 0, 558, 0),
(546, '2024-10-12', '1004', '4000/t07', NULL, 'Frozen', 'J', '150', '245.1', '', 0, 559, 0),
(547, '2024-10-12', '1037', '4000/a03', NULL, 'Frozen', '1/2', '248.9', '406.7026', '', 0, 560, 0),
(548, '2024-10-12', '1037', '4000/a03', NULL, 'Frozen', '80/110', '342.2', '559.1548', '', 0, 561, 0),
(549, '2024-10-13', '1020', '4000/b01', NULL, 'Frozen', '3/4', '134.4', '219.6096', '', 0, 562, 0),
(550, '2024-10-13', '1020', '4000/b01', NULL, 'Frozen', '2up', '44.3', '72.3862', '', 0, 563, 0),
(551, '2024-10-13', '1037', '4000/a06', NULL, 'Frozen', '8/10', '57.1', '93.3014', '', 0, 564, 0),
(552, '2024-10-13', '1004', '4000/t07', NULL, 'Frozen', 'J', '124.4', '203.2696', '', 0, 565, 0),
(553, '2024-10-13', '1037', '4000/a02', NULL, 'Frozen', '80/100', '81.5', '133.171', '', 0, 566, 0),
(554, '2024-10-13', '1037', '4000/a02', NULL, 'Frozen', '1/2', '3.5', '5.719', '', 0, 567, 0),
(555, '2024-10-13', '1037', '4000/a03', NULL, 'Frozen', '1/2', '36.5', '59.641', '', 0, 568, 0),
(556, '2024-10-13', '1037', '4000/a03', NULL, 'Frozen', '8/10', '17.9', '29.2486', '', 0, 569, 0),
(557, '2024-10-14', '1036', '4000/b01', NULL, 'Frozen', 'J', '258.2', '421.8988', '', 0, 570, 0),
(558, '2024-10-14', '1026', '4000/b01', NULL, 'Frozen', 'J', '89.8', '146.7332', '', 0, 571, 0),
(559, '2024-10-14', '1023', '4000/b01', NULL, 'Frozen', 'J', '638.4', '1043.1456', '', 0, 572, 0),
(560, '2024-10-14', '1020', '4000/b01', NULL, 'Frozen', '3/4', '46.1', '75.3274', '', 0, 573, 0),
(561, '2024-10-14', '1020', '4000/b01', NULL, 'Frozen', '2up', '11.9', '19.4446', '', 0, 574, 0),
(562, '2024-10-14', '1015', '4000/a01', NULL, 'Frozen', '4/5', '78.2', '127.7788', '', 0, 575, 0),
(563, '2024-10-14', '1015', '4000/a01', NULL, 'Frozen', 'J', '170.6', '278.7604', '', 0, 576, 0);

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
(1, '2024-09-30', '1031', '4000/t15', 'DAKA', 'TCl', '2up', '1011.25', '1652.3825', '', 0, 361),
(2, '2024-09-30', '1031', '4000/t15', 'DAKA', 'TCl', '3up', '2160.25', '3529.8485', '', 0, 362),
(3, '2024-09-30', '1017', '4000/t15', 'DAKA', 'TCl', '7up', '98.75', '161.3575', '', 0, 363),
(4, '2024-09-30', '1031', '4000/t15', 'DAKA', 'TCl', '3up', '917.25', '1498.7865', '', 0, 364),
(5, '2024-09-30', '1017', '4000/t15', 'DAKA', 'TCl', '7up', '474.25', '774.9245', '', 0, 365),
(6, '2024-10-01', '1017', '4000/b01', 'DAKA', 'TCl', '7up', '478.95', '782.6043', '', 0, 382),
(7, '2024-10-08', '1017', '4000/t15', 'DAKA', 'TCl', '7up', '287', '468.958', '0', 0, 519),
(8, '2024-10-08', '1017', '4000/b02', 'DAKA', 'TCl', 'J', '528.15', '862.9971', '0', 0, 520),
(9, '2024-10-09', '1031', '4000/t15', 'DAKA', 'TCl', '2/3', '2398', '3918.332', '0', 0, 521),
(10, '2024-10-09', '1031', '4000/t15', 'DAKA', 'TCl', '3up', '167.75', '274.1035', '0', 0, 522),
(11, '2024-10-09', '1031', '4000/t15', 'DAKA', 'TCl', '2/3', '2506.5', '4095.621', '0', 0, 523),
(12, '2024-10-09', '1017', '4000/b02', 'DAKA', 'TCl', 'J', '357.3', '583.8282', '0', 0, 524),
(13, '2024-10-10', '1017', '4000/b02', 'DAKA', 'TCl', 'J', '355.7', '581.2138', '', 0, 545);

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

--
-- Dumping data for table `form10stock`
--

INSERT INTO `form10stock` (`id`, `date`, `item_id`, `supplier_id`, `country`, `type`, `size`, `pcsform10`, `mc`, `kg`, `pcs`, `looseinkg`, `looseinpcs`, `looseoutkg`, `looseoutpcs`, `total_kg`, `percentage`) VALUES
(1, '2024-10-05', '1002', '4000/B01', 'can', 'frozen', '1up', 39, 2, '40', 31, '11.7', 8, '', 0, '51.7', ''),
(2, '2024-10-05', '1002', '4000/B01', 'can', 'frozen', '1.5up', 19, 1, '20', 11, '15.1', 8, '', 0, '35.1', ''),
(3, '2024-10-05', '1002', '4000/B01', 'can', 'frozen', '2up', 45, 6, '120', 46, '', 0, '2.1', 1, '117.9', ''),
(4, '2024-10-05', '1002', '4000/B01', 'can', 'frozen', '3up', 61, 11, '232', 66, '', 0, '18.1', 5, '213.9', ''),
(5, '2024-10-05', '1002', '4000/B01', 'can', 'frozen', '4up', 14, 3, '66', 14, '', 0, '', 0, '66', ''),
(6, '2024-10-05', '1002', '4000/B01', 'can', 'frozen', '5up', 9, 3, '66', 12, '', 0, '16.1', 3, '49.9', ''),
(7, '2024-10-05', '1002', '4000/B01', 'can', 'frozen', '6up', 4, 1, '20', 3, '6.7', 1, '', 0, '26.7', ''),
(8, '2024-10-05', '1002', '4000/B01', 'can', 'frozen', '7up', 2, 1, '24', 3, '', 0, '7.6', 1, '16.4', ''),
(9, '2024-10-05', '1002', '4000/B01', 'can', 'frozen', '8up', -1, 0, '', 0, '', 0, '8.7', 1, '-8.7', ''),
(10, '2024-10-05', '1001', '4000/B01', 'can', 'frozen', '1.5up', 21, 2, '40', 21, '1.6', 1, '1.9', 1, '39.7', ''),
(11, '2024-10-05', '1001', '4000/B01', 'can', 'frozen', '1up', 6, 0, '', 0, '11.6', 8, '2.7', 2, '8.9', ''),
(12, '2024-10-05', '1001', '4000/B01', 'can', 'frozen', '2up', 34, 4, '80', 32, '9.5', 4, '4.5', 2, '85', ''),
(13, '2024-10-05', '1001', '4000/B01', 'can', 'frozen', '3up', 19, 3, '63', 18, '3.7', 1, '', 0, '66.7', ''),
(14, '2024-10-05', '1001', '4000/B01', 'can', 'frozen', '4up', 3, 1, '23', 5, '', 0, '9.3', 2, '13.7', ''),
(15, '2024-10-05', '1001', '4000/B01', 'can', 'frozen', '5up', 1, 0, '', 0, '5.4', 1, '', 0, '5.4', ''),
(16, '2024-10-05', '1001', '4000/B01', 'can', 'frozen', '6up', 1, 0, '', 0, '12.6', 2, '6.3', 1, '6.3', ''),
(17, '2024-10-05', '1020', '4000/B01', 'can', 'frozen', '2up', 30, 4, '81', 32, '7.2', 3, '11.6', 5, '76.6', ''),
(18, '2024-10-05', '1020', '4000/B01', 'can', 'frozen', '3up', 16, 3, '66', 18, '', 0, '7.3', 2, '58.7', ''),
(19, '2024-10-05', '1020', '4000/B01', 'can', 'frozen', '4up', 11, 2, '46', 10, '19.3', 4, '14.3', 3, '51', ''),
(20, '2024-10-05', '1020', '4000/B01', 'can', 'frozen', '5up', 3, 1, '22', 4, '5.7', 1, '11.2', 2, '16.5', ''),
(21, '2024-10-05', '1023', '4000/T05', 'NY', 'frozen', '4up', 54, 11, '259', 54, '', 0, '', 0, '259', ''),
(22, '2024-10-05', '1023', '4000/T05', 'NY', 'frozen', '5up', 30, 7, '158', 28, '11.5', 2, '', 0, '169.5', ''),
(23, '2024-10-05', '1023', '4000/T05', 'NY', 'frozen', '6up', 9, 3, '60', 9, '', 0, '', 0, '60', ''),
(24, '2024-10-05', '1031', '4000/T05', 'NY', 'frozen', '4up', 45, 11, '224', 45, '', 0, '', 0, '224', ''),
(25, '2024-10-05', '1031', '4000/T05', 'NY', 'frozen', '5up', 194, 48, '1096', 192, '12.5', 2, '', 0, '1108.5', ''),
(26, '2024-10-05', '1031', '4000/T05', 'NY', 'frozen', '6up', 93, 31, '617', 93, '', 0, '', 0, '617', ''),
(27, '2024-10-05', '1031', '4000/T05', 'NY', 'frozen', '7up', 24, 8, '182', 24, '', 0, '', 0, '182', ''),
(28, '2024-10-05', '1031', '4000/T05', 'NY', 'frozen', '8up', 3, 1, '27', 3, '', 0, '', 0, '27', ''),
(29, '2024-10-05', '1031', '4000/T05', 'NY', 'frozen', '9up', 2, 1, '19', 2, '', 0, '', 0, '19', ''),
(30, '2024-10-08', '1002', '4000/B01', 'Can', 'frozen', '1.5up', 8, 2, '41', 22, '16', 8, '41.7', 22, '15.3', ''),
(31, '2024-10-08', '1002', '4000/B01', 'Can', 'frozen', '2up', 45, 6, '121', 43, '5.6', 2, '', 0, '126.6', ''),
(32, '2024-10-08', '1002', '4000/B01', 'Can', 'frozen', '3up', 39, 6, '129', 36, '11.2', 3, '', 0, '140.2', ''),
(33, '2024-10-08', '1002', '4000/B01', 'Can', 'frozen', '4up', 19, 4, '89', 19, '', 0, '', 0, '89', ''),
(34, '2024-10-08', '1002', '4000/B01', 'Can', 'frozen', '5up', 14, 3, '68', 12, '10.4', 2, '', 0, '78.4', ''),
(35, '2024-10-08', '1002', '4000/B01', 'Can', 'frozen', '6up', 5, 2, '40', 6, '', 0, '6.7', 1, '33.3', ''),
(36, '2024-10-08', '1002', '4000/B01', 'Can', 'frozen', '7up', 2, 0, '', 0, '14.8', 2, '', 0, '14.8', ''),
(37, '2024-10-08', '1002', '4000/B01', 'Can', 'frozen', '8up', 2, 1, '27', 3, '', 0, '8.8', 1, '18.2', ''),
(38, '2024-10-08', '1002', '4000/B01', 'Can', 'frozen', '9up', 2, 1, '19.5', 2, '9.7', 1, '9.7', 1, '19.5', ''),
(39, '2024-10-08', '1002', '4000/B01', 'Can', 'frozen', '10up', 1, 1, '22', 2, '11.1', 1, '22.2', 2, '10.9', ''),
(40, '2024-10-08', '1001', '4000/B01', 'Can', 'frozen', '1.5up', 1, 1, '21', 11, '1.6', 1, '18.7', 11, '3.9', ''),
(41, '2024-10-08', '1001', '4000/B01', 'Can', 'frozen', '2up', 58, 8, '160', 62, '', 0, '9.5', 4, '150.5', ''),
(42, '2024-10-08', '1001', '4000/B01', 'Can', 'frozen', '3up', 18, 3, '64', 18, '3.1', 1, '3.7', 1, '63.4', ''),
(43, '0000-00-00', '1001', '4000/B01', '', 'frozen', '4up', 4, 1, '23', 5, '', 0, '4.5', 1, '18.5', ''),
(44, '2024-10-08', '1001', '4000/B01', '', 'frozen', '5up', 5, 1, '23', 4, '11.1', 2, '5.4', 1, '28.7', ''),
(45, '2024-10-08', '1001', '4000/B01', '', 'frozen', '6up', 0, 1, '19', 3, '6.7', 1, '26.1', 4, '-0.4', ''),
(46, '2024-10-08', '1001', '4000/B01', '', 'frozen', '12up', 1, 0, '', 0, '11.8', 1, '', 0, '11.8', ''),
(47, '2024-10-08', '1020', '4000/B01', 'Can', 'frozen', '2up', 31, 4, '80', 30, '9.5', 4, '7.2', 3, '82.3', ''),
(48, '2024-10-08', '1020', '4000/B01', 'Can', 'frozen', '3up', 23, 4, '87', 23, '', 0, '', 0, '87', ''),
(49, '2024-10-08', '1020', '4000/B01', 'Can', 'frozen', '4up', 16, 4, '92', 20, '', 0, '19.3', 4, '72.7', ''),
(50, '2024-10-08', '1020', '4000/B01', 'Can', 'frozen', '5up', 7, 2, '46', 8, '', 0, '5.7', 1, '40.3', ''),
(51, '2024-10-08', '1020', '4000/B01', 'Can', 'frozen', '7up', 2, 0, '', 0, '15.5', 2, '', 0, '15.5', ''),
(52, '2024-10-08', '1020', '4000/B01', 'Can', 'frozen', '9up', 2, 1, '20', 2, '', 0, '', 0, '20', ''),
(53, '2024-10-06', '1023', '4000/T05', 'Ny/Can', 'frozen', '4up', 210, 43, '1010', 214, '', 0, '18.9', 4, '991.1', ''),
(54, '2024-10-06', '1023', '4000/T05', 'NY/Can', 'frozen', '5up', 106, 27, '603', 108, '', 0, '11.5', 2, '591.5', ''),
(55, '2024-10-06', '1023', '4000/T05', 'NY/Can', 'frozen', '6up', 24, 8, '155', 24, '', 0, '', 0, '155', ''),
(56, '2024-10-06', '1023', '4000/T05', 'NY/Can', 'frozen', '7up', 8, 3, '68', 9, '7.6', 1, '15.5', 2, '60.1', '');

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
(1, '2024-09-15', '', '4000/A03', '', '', '4094000', '', '', '', 0, 0, 0),
(2, '2024-09-15', '', '4000/A01', '', '', '1240800', '', '', '', 0, 0, 0),
(3, '2024-09-15', '', '4000/B01', '', '', '371597395', '', '', '', 0, 0, 0),
(4, '2024-09-15', '', '4000/H01', '', '', '817650', '', '', '', 0, 0, 0),
(5, '2024-09-15', '', '4000/M09', '', '', '10049375', '', '', '', 0, 0, 0),
(6, '2024-09-15', '', '4000/M01', '', '', '5889650', '', '', '', 0, 0, 0),
(7, '2024-09-15', '', '4000/N04', '', '', '10403200', '', '', '', 0, 0, 0),
(8, '2024-09-15', '', '4000/S03', '', '', '220676231', '', '', '', 0, 0, 0),
(9, '2024-09-15', '', '4000/S06', '', '', '4501200', '', '', '', 0, 0, 0),
(10, '2024-09-15', '', '4000/T07', '', '', '32369880', '', '', '', 0, 0, 0),
(11, '2024-09-15', '', '4000/T02', '', '', '49847625', '', '', '', 0, 0, 0),
(12, '2024-09-15', '', '4000/T05', '', '', '414899625', '', '', '', 0, 0, 0),
(13, '2024-09-15', '', '4000/T15', '', '', '41899625', '', '', '', 0, 0, 0),
(14, '2024-09-15', '', '4000/T03', '', '', '6167260', '', '', '', 0, 0, 0),
(15, '2024-09-15', '', '4000/T17', '', '', '7658840', '', '', '', 0, 0, 0),
(16, '2024-09-15', '', '4000/K07', '', '', '6710900', '', '', '', 0, 0, 0),
(17, '2024-09-15', '', '4000/k10', '', '', '734700', '', '', '', 0, 0, 0),
(18, '2024-09-15', '', '4000/Z03', '', '', '25685175', '', '', '', 0, 0, 0),
(19, '2024-09-15', '', '4000/S10', '', '', '18507300', '', '', '', 0, 0, 0),
(20, '2024-09-15', '', '4000/M04', '', '', '1876800', '', '', '', 0, 0, 0),
(21, '2024-09-15', '', '4000/P03', '', '', '4527000', '', '', '', 0, 0, 0),
(22, '2024-09-15', '', '4000/D04', '', '', '2920000', '', '', '', 0, 0, 0),
(23, '2024-09-15', '', '4000/G03', '', '', '2976700', '', '', '', 0, 0, 0),
(24, '2024-09-15', '', '4000/H03', '', '', '26820334', '', '', '', 0, 0, 0),
(144, '2024-09-18', 'Dr-Sep 24/376', '6100/002', '135000', '0', '135000', 'Ice 9 pcs*15000 Purchase For Market Fish', '', '', 0, 37, 90),
(145, '2024-09-18', 'Dr-Sep 24/376', '3600/001', '0', '135000', '-135000', 'Ice 9 pcs*15000 Purchase For Market Fish', '', '', 0, 35, 91),
(146, '2024-09-18', 'Dr-Sep 24/377', '9100/006', '150000', '0', '150000', 'Car Diesel For 3K-1574(15.9/18.9/19.9)', '', '', 0, 39, 92),
(147, '2024-09-18', 'Dr-Sep 24/377', '3600/001', '0', '150000', '-285000', 'Car Diesel For 3K-1574(15.9/18.9/19.9)', '', '', 0, 35, 93),
(148, '2024-09-18', 'Dr-Sep 24/378', '9100/002', '4000', '0', '4000', 'Taxi Charges For W/H to UAB to W/H', '', '', 0, 39, 94),
(149, '2024-09-18', 'Dr-Sep 24/378', '3600/001', '0', '4000', '-289000', 'Taxi Charges For W/H to UAB to W/H', '', '', 0, 35, 95),
(150, '2024-09-18', 'Dr-Sep 24/379', '9100/002', '3000', '0', '7000', 'Sir Carry Charges For 19.9.24 AM', '', '', 0, 39, 96),
(151, '2024-09-18', 'Dr-Sep 24/379', '3600/001', '0', '3000', '-292000', 'Sir Carry Charges For 19.9.24 AM', '', '', 0, 35, 97),
(152, '2024-09-18', 'Dr-Sep 24/380', '9100/002', '30000', '0', '37000', 'Taxi charges For W/H to Market to W/H', '', '', 0, 39, 98),
(153, '2024-09-18', 'Dr-Sep 24/380', '3600/001', '0', '30000', '-322000', 'Taxi charges For W/H to Market to W/H', '', '', 0, 35, 99),
(154, '2024-09-18', 'Dr-Sep 24/381', '9100/012', '14000', '0', '14000', 'Meal Allowance For Am4pcs, Lunch4pcs', '', '', 0, 39, 100),
(155, '2024-09-18', 'Dr-Sep 24/381', '3600/001', '0', '14000', '-336000', 'Meal Allowance For Am4pcs, Lunch4pcs', '', '', 0, 35, 101),
(156, '2024-09-18', 'Dr-Sep 24/382', '9100/005', '18000', '0', '18000', 'Cable Tie Purchase For Market Fish Pk', '', '', 0, 39, 102),
(157, '2024-09-18', 'Dr-Sep 24/382', '3600/001', '0', '18000', '-354000', 'Cable Tie Purchase For Market Fish Pk', '', '', 0, 35, 103),
(158, '2024-09-18', 'Dr-Sep 24/383', '9100/025', '2000', '0', '2000', 'Car Packing For Market', '', '', 0, 39, 105),
(159, '2024-09-18', 'Dr-Sep 24/383', '3600/001', '0', '2000', '-356000', 'Car Packing For Market', '', '', 0, 35, 106),
(160, '2024-09-18', 'Dr-Sep 24/384', '6100/002', '45000', '0', '180000', 'Ice 3 pcs*15000ks Purchase For Rohu', '', '', 0, 37, 107),
(161, '2024-09-18', 'Dr-Sep 24/384', '3600/001', '0', '45000', '-401000', 'Ice 3 pcs*15000ks Purchase For Rohu', '', '', 0, 35, 108),
(162, '2024-09-18', 'Dr-Sep 24/385', '6100/001', '9000', '0', '9000', 'Labour Charges For Rohu', '', '', 0, 37, 109),
(163, '2024-09-18', 'Dr-Sep 24/385', '3600/001', '0', '9000', '-410000', 'Labour Charges For Rohu', '', '', 0, 35, 110),
(164, '2024-09-18', 'Dr-Sep 24/386', '6100/001', '38000', '0', '47000', 'Labour Charges For Market', '', '', 0, 37, 111),
(165, '2024-09-18', 'Dr-Sep 24/386', '3600/001', '0', '38000', '-448000', 'Labour Charges For Market', '', '', 0, 35, 112),
(166, '2024-09-18', 'Dr-Sep 24/387', '6100/002', '135000', '0', '315000', 'Ice 9 Pcs*15000ks Purchase For Market Fish', '', '', 0, 37, 115),
(167, '2024-09-18', 'Dr-Sep 24/387', '3600/001', '0', '135000', '-583000', 'Ice 9 Pcs*15000ks Purchase For Market Fish', '', '', 0, 35, 116),
(168, '2024-09-17', 'Dr-Sep 24/361', '9100/006', '100000', '0', '250000', 'Car Diesel For 3k-1574 (15.9.24=50000,17.9.24=500000)30.54 Liters*3275ks', '', '', 0, 39, 60),
(169, '2024-09-17', 'Dr-Sep 24/361', '3600/001', '0', '100000', '-683000', 'Car Diesel For 3k-1574 (15.9.24=50000,17.9.24=500000)30.54 Liters*3275ks', '', '', 0, 35, 61),
(170, '2024-09-17', 'Dr-Sep 24/362', '9100/002', '5500', '0', '42500', 'Taxi Charges For Mindama to Lai Lai house For Fish Goverment', '', '', 0, 39, 62),
(171, '2024-09-17', 'Dr-Sep 24/362', '3600/001', '0', '5500', '-688500', 'Taxi Charges For Mindama to Lai Lai house For Fish Goverment', '', '', 0, 35, 63),
(172, '2024-09-17', 'Dr-Sep 24/363', '6100/001', '29000', '0', '76000', 'Labour Charges and Taxi For W/H Batashi 9viss*1000ks, Taxi 20000ks', '', '', 0, 37, 64),
(173, '2024-09-17', 'Dr-Sep 24/363', '3600/001', '0', '29000', '-717500', 'Labour Charges and Taxi For W/H Batashi 9viss*1000ks, Taxi 20000ks', '', '', 0, 35, 65),
(174, '2024-09-17', 'Dr-Sep 24/364', '9100/002', '3000', '0', '45500', 'Taxi Charges For W/H to UAB For Lai Lai for A/C Check', '', '', 0, 39, 66),
(175, '2024-09-17', 'Dr-Sep 24/364', '3600/001', '0', '3000', '-720500', 'Taxi Charges For W/H to UAB For Lai Lai for A/C Check', '', '', 0, 35, 67),
(176, '2024-09-17', 'Dr-Sep 24/365', '9100/005', '24000', '0', '42000', 'Cutter 5 pcs Purchase and Taxi For Batashi Clean (20000+4000)', '', '', 0, 39, 68),
(177, '2024-09-17', 'Dr-Sep 24/365', '3600/001', '0', '24000', '-744500', 'Cutter 5 pcs Purchase and Taxi For Batashi Clean (20000+4000)', '', '', 0, 35, 69),
(178, '2024-09-17', 'Dr-Sep 24/366', '9100/002', '30000', '0', '75500', 'Taxi Charges For HHK to W/H For 16.9.24', '', '', 0, 39, 70),
(179, '2024-09-17', 'Dr-Sep 24/366', '3600/001', '0', '30000', '-774500', 'Taxi Charges For HHK to W/H For 16.9.24', '', '', 0, 35, 71),
(180, '2024-09-17', 'Dr-Sep 24/367', '9100/012', '10000', '0', '24000', 'Workers 5pcs*2000ks Dinner For HHK OT', '', '', 0, 39, 72),
(181, '2024-09-17', 'Dr-Sep 24/367', '3600/001', '0', '10000', '-784500', 'Workers 5pcs*2000ks Dinner For HHK OT', '', '', 0, 35, 73),
(182, '2024-09-17', 'Dr-Sep 24/368', '6100/002', '96000', '0', '411000', 'Ice 8pcs*10500ks Purchase and Carry For HHK', '', '', 0, 37, 74),
(183, '2024-09-17', 'Dr-Sep 24/368', '3600/001', '0', '96000', '-880500', 'Ice 8pcs*10500ks Purchase and Carry For HHK', '', '', 0, 35, 75),
(184, '2024-09-17', 'Dr-Sep 24/369', '9100/002', '13000', '0', '88500', 'Taxi Charges For W/H to OP', '', '', 0, 39, 76),
(185, '2024-09-17', 'Dr-Sep 24/369', '3600/001', '0', '13000', '-893500', 'Taxi Charges For W/H to OP', '', '', 0, 35, 77),
(186, '2024-09-17', 'Dr-Sep 24/370', '9100/002', '35000', '0', '123500', 'Taxi Charges For W/H to HHK Carton Box Carry Charges', '', '', 0, 39, 78),
(187, '2024-09-17', 'Dr-Sep 24/370', '3600/001', '0', '35000', '-928500', 'Taxi Charges For W/H to HHK Carton Box Carry Charges', '', '', 0, 35, 79),
(188, '2024-09-17', 'Dr-Sep 24/371', '6100/001', '30000', '0', '106000', 'Labour Charges For OP Raw', '', '', 0, 37, 80),
(189, '2024-09-17', 'Dr-Sep 24/371', '3600/001', '0', '30000', '-958500', 'Labour Charges For OP Raw', '', '', 0, 35, 81),
(190, '2024-09-17', 'Dr-Sep 24/372', '9100/002', '25000', '0', '148500', 'Taxi Charges For W/H to Market to W/H', '', '', 0, 39, 82),
(191, '2024-09-17', 'Dr-Sep 24/372', '3600/001', '0', '25000', '-983500', 'Taxi Charges For W/H to Market to W/H', '', '', 0, 35, 83),
(192, '2024-09-17', 'Dr-Sep 24/373', '9100/012', '10500', '0', '34500', 'Meal allowance For Market Boys Am3pcs,Lunch 3pcs', '', '', 0, 39, 84),
(193, '2024-09-17', 'Dr-Sep 24/373', '3600/001', '0', '10500', '-994000', 'Meal allowance For Market Boys Am3pcs,Lunch 3pcs', '', '', 0, 35, 85),
(194, '2024-09-17', 'Dr-Sep 24/374', '6100/001', '42500', '0', '148500', 'Labour charges For Market Fish', '', '', 0, 37, 86),
(195, '2024-09-17', 'Dr-Sep 24/374', '3600/001', '0', '42500', '-1036500', 'Labour charges For Market Fish', '', '', 0, 35, 87),
(196, '2024-09-17', 'Dr-Sep 24/375', '9100/025', '3000', '0', '5000', 'Car Packing For Market', '', '', 0, 39, 88),
(197, '2024-09-17', 'Dr-Sep 24/375', '3600/001', '0', '3000', '-1039500', 'Car Packing For Market', '', '', 0, 35, 89),
(198, '2024-09-16', 'Dr-Sep 24/332', '9100/003', '4500', '0', '4500', 'Water 5pcs*900ks Purchase for W/H', '', '', 0, 39, 2),
(199, '2024-09-16', 'Dr-Sep 24/332', '3600/001', '0', '4500', '-1044000', 'Water 5pcs*900ks Purchase for W/H', '', '', 0, 35, 3),
(200, '2024-09-16', 'Dr-Sep 24/333', '9100/002', '10000', '0', '158500', 'Taxi Charges For Printer Sent For W/H', '', '', 0, 39, 4),
(201, '2024-09-16', 'Dr-Sep 24/333', '3600/001', '0', '10000', '-1054000', 'Taxi Charges For Printer Sent For W/H', '', '', 0, 35, 5),
(202, '2024-09-16', 'Dr-Sep 24/334', '9100/016', '12000', '0', '12000', 'Printer Ink Purchase For Office (2pcs*6000ks)', '', '', 0, 39, 6),
(203, '2024-09-16', 'Dr-Sep 24/334', '3600/001', '0', '12000', '-1066000', 'Printer Ink Purchase For Office (2pcs*6000ks)', '', '', 0, 35, 7),
(204, '2024-09-16', 'Dr-Sep 24/335', '9100/002', '5000', '0', '163500', 'Taxi Charges For MC Tally People For GFC to W/H', '', '', 0, 39, 8),
(205, '2024-09-16', 'Dr-Sep 24/335', '3600/001', '0', '5000', '-1071000', 'Taxi Charges For MC Tally People For GFC to W/H', '', '', 0, 35, 9),
(206, '2024-09-16', 'Dr-Sep 24/336', '9100/005', '20000', '0', '62000', 'Wasting Carry Charges For New Factory Cleaning', '', '', 0, 39, 10),
(207, '2024-09-16', 'Dr-Sep 24/336', '3600/001', '0', '20000', '-1091000', 'Wasting Carry Charges For New Factory Cleaning', '', '', 0, 35, 11),
(208, '2024-09-16', 'Dr-Sep 24/337', '9100/002', '18000', '0', '181500', 'Taxi Charges For W/H to HHK For Biryani', '', '', 0, 39, 12),
(209, '2024-09-16', 'Dr-Sep 24/337', '3600/001', '0', '18000', '-1109000', 'Taxi Charges For W/H to HHK For Biryani', '', '', 0, 35, 13),
(210, '2024-09-16', 'Dr-Sep 24/338', '9100/014', '65000', '0', '65000', 'Car Repair For 3K-1574 For Brake (Need Material 40000+ Repair Charges 25000)', '', '', 0, 39, 14),
(211, '2024-09-16', 'Dr-Sep 24/338', '3600/001', '0', '65000', '-1174000', 'Car Repair For 3K-1574 For Brake (Need Material 40000+ Repair Charges 25000)', '', '', 0, 35, 15),
(212, '2024-09-16', 'Dr-Sep 24/339', '9100/019', '128000', '0', '128000', 'Purchase UPS Changing and Service For Office Soe Soe Computer (UPS 98000+Service Charge 30000)', '', '', 0, 39, 16),
(213, '2024-09-16', 'Dr-Sep 24/339', '3600/001', '0', '128000', '-1302000', 'Purchase UPS Changing and Service For Office Soe Soe Computer (UPS 98000+Service Charge 30000)', '', '', 0, 35, 17),
(214, '2024-09-16', 'Dr-Sep 24/340', '9100/012', '1500', '0', '36000', 'Sugar 1 pcs*1500ks Purchase For Sir', '', '', 0, 39, 18),
(215, '2024-09-16', 'Dr-Sep 24/340', '3600/001', '0', '1500', '-1303500', 'Sugar 1 pcs*1500ks Purchase For Sir', '', '', 0, 35, 19),
(216, '2024-09-16', 'Dr-Sep 24/341', '9100/017', '30000', '0', '30000', 'Dummy Air Ticket For Sir Singapore Visa', '', '', 0, 39, 20),
(217, '2024-09-16', 'Dr-Sep 24/341', '3600/001', '0', '30000', '-1333500', 'Dummy Air Ticket For Sir Singapore Visa', '', '', 0, 35, 21),
(218, '2024-09-16', 'Dr-Sep 24/342', '6100/005', '1000000', '0', '1000000', 'MC Charges For HHK To GFC (14.9.24=500000,16.9.24=500000)', '', '', 0, 37, 22),
(219, '2024-09-16', 'Dr-Sep 24/342', '3600/001', '0', '1000000', '-2333500', 'MC Charges For HHK To GFC (14.9.24=500000,16.9.24=500000)', '', '', 0, 35, 23),
(220, '2024-09-16', 'Dr-Sep 24/343', '6100/001', '115950', '0', '264450', 'Labour Charges and Taxi For W/H (Baila 19Vissx350ks,D Puti 103Vissx600ks,Batashi 17.5Viss)', '', '', 0, 37, 24),
(221, '2024-09-16', 'Dr-Sep 24/343', '3600/001', '0', '115950', '-2449450', 'Labour Charges and Taxi For W/H (Baila 19Vissx350ks,D Puti 103Vissx600ks,Batashi 17.5Viss)', '', '', 0, 35, 25),
(222, '2024-09-16', 'Dr-Sep 24/344', '3400/002', '1120000', '0', '24078050', 'Car Charges For Tender Go To Nay Pyi Taw 12.9.24 to 14.9.24 LM Factory', '', '', 0, 35, 26),
(223, '2024-09-16', 'Dr-Sep 24/344', '3600/001', '0', '1120000', '-3569450', 'Car Charges For Tender Go To Nay Pyi Taw 12.9.24 to 14.9.24 LM Factory', '', '', 0, 35, 27),
(224, '2024-09-16', 'Dr-Sep 24/345', '9100/009', '2000', '0', '2000', 'K-pay Charges For Car Charges Transfer NPT LM Factory', '', '', 0, 39, 28),
(225, '2024-09-16', 'Dr-Sep 24/345', '3600/001', '0', '2000', '-3571450', 'K-pay Charges For Car Charges Transfer NPT LM Factory', '', '', 0, 35, 29),
(226, '2024-09-16', 'Dr-Sep 24/346', '3400/002', '326000', '0', '23284050', 'Hotal Charges For Factory Contract go D.Nan+2pcs LM Factory', '', '', 0, 35, 30),
(227, '2024-09-16', 'Dr-Sep 24/346', '3600/001', '0', '326000', '-3897450', 'Hotal Charges For Factory Contract go D.Nan+2pcs LM Factory', '', '', 0, 35, 31),
(228, '2024-09-16', 'Dr-Sep 24/347', '3400/003', '15966000', '0', '15966000', 'Bank Guarantee 1 Month for LM Factory', '', '', 0, 35, 32),
(229, '2024-09-16', 'Dr-Sep 24/347', '3600/001', '0', '15966000', '-19863450', 'Bank Guarantee 1 Month for LM Factory', '', '', 0, 35, 33),
(230, '2024-09-16', 'Dr-Sep 24/348', '3400/004', '188400000', '0', '188400000', 'Rental Contract 1year for for LM Factory Sep\'24 to Sep\'25 (15700000*12month)', '', '', 0, 35, 34),
(231, '2024-09-16', 'Dr-Sep 24/348', '3600/001', '0', '188400000', '-208263450', 'Rental Contract 1year for for LM Factory Sep\'24 to Sep\'25 (15700000*12month)', '', '', 0, 35, 35),
(232, '2024-09-16', 'Dr-Sep 24/349', '3400/002', '17362000', '0', '40320050', 'Paid to Goverment NPT People For Tender MD-100 Lakh,D.Nan 50 Lakh,Ko Phyoe 10 Lakh', '', '', 0, 35, 36),
(233, '2024-09-16', 'Dr-Sep 24/349', '3600/001', '0', '17362000', '-225625450', 'Paid to Goverment NPT People For Tender MD-100 Lakh,D.Nan 50 Lakh,Ko Phyoe 10 Lakh', '', '', 0, 35, 37),
(234, '2024-09-16', 'Dr-Sep 24/350', '3400/002', '2300000', '0', '25258050', 'Paid To Government People (YGN) For Tender U Aung Kyaw 3 Lakh, Daw Ohn Mar 10 Lakh, D', '', '', 0, 35, 38),
(235, '2024-09-16', 'Dr-Sep 24/350', '3600/001', '0', '2300000', '-227925450', 'Paid To Government People (YGN) For Tender U Aung Kyaw 3 Lakh, Daw Ohn Mar 10 Lakh, D', '', '', 0, 35, 39),
(236, '2024-09-16', 'Dr-Sep 24/351', '3400/002', '1256000', '0', '24214050', 'Stamp Duty fees For Factory Contract (188400000\r\n*0.5%)+(BG 15700000*2%) LM Factory', '', '', 0, 35, 40),
(237, '2024-09-16', 'Dr-Sep 24/351', '3600/001', '0', '1256000', '-229181450', 'Stamp Duty fees For Factory Contract (188400000\r\n*0.5%)+(BG 15700000*2%) LM Factory', '', '', 0, 35, 41),
(238, '2024-09-16', 'Dr-Sep 24/352', '3400/002', '10000', '0', '22968050', 'Under Taking For Tax Darpartment for Stamp Duty LM Factory', '', '', 0, 35, 42),
(239, '2024-09-16', 'Dr-Sep 24/352', '3600/001', '0', '10000', '-229191450', 'Under Taking For Tax Darpartment for Stamp Duty LM Factory', '', '', 0, 35, 43),
(240, '2024-09-16', 'Dr-Sep 24/353', '3400/002', '7300', '0', '22965350', 'Copy For Tender Tax Document all LM Factory', '', '', 0, 35, 44),
(241, '2024-09-16', 'Dr-Sep 24/353', '3600/001', '0', '7300', '-229198750', 'Copy For Tender Tax Document all LM Factory', '', '', 0, 35, 45),
(242, '2024-09-16', 'Dr-Sep 24/354', '3400/002', '288375', '0', '23246425', 'Meal Allowance For Tender go 12.9.24 to 14.9.24 Daw Nan+2pcs LM Factory', '', '', 0, 35, 46),
(243, '2024-09-16', 'Dr-Sep 24/354', '3600/001', '0', '288375', '-229487125', 'Meal Allowance For Tender go 12.9.24 to 14.9.24 Daw Nan+2pcs LM Factory', '', '', 0, 35, 47),
(244, '2024-09-16', 'Dr-Sep 24/355', '4000/T14', '346500', '0', '346500', 'Paid to Tun Naing For Vr no 12148', '', '', 0, 40, 48),
(245, '2024-09-16', 'Dr-Sep 24/355', '3600/001', '0', '346500', '-229833625', 'Paid to Tun Naing For Vr no 12148', '', '', 0, 35, 49),
(246, '2024-09-16', 'Dr-Sep 24/356', '9100/002', '33000', '0', '214500', 'Taxi Charges For W/H to Market to W/H and Boy 1 pcs house go', '', '', 0, 39, 50),
(247, '2024-09-16', 'Dr-Sep 24/356', '3600/001', '0', '33000', '-229866625', 'Taxi Charges For W/H to Market to W/H and Boy 1 pcs house go', '', '', 0, 35, 51),
(248, '2024-09-16', 'Dr-Sep 24/357', '9100/012', '14000', '0', '50000', 'Meal allowance For Market Boys Am4pcs, Lunch4pcs', '', '', 0, 39, 52),
(249, '2024-09-16', 'Dr-Sep 24/357', '3600/001', '0', '14000', '-229880625', 'Meal allowance For Market Boys Am4pcs, Lunch4pcs', '', '', 0, 35, 53),
(250, '2024-09-16', 'Dr-Sep 24/358', '6100/001', '26500', '0', '290950', 'Labour Charges For Market Fish', '', '', 0, 37, 54),
(251, '2024-09-16', 'Dr-Sep 24/358', '3600/001', '0', '26500', '-229907125', 'Labour Charges For Market Fish', '', '', 0, 35, 55),
(252, '2024-09-16', 'Dr-Sep 24/359', '9100/025', '2000', '0', '7000', 'Car Packing For Market', '', '', 0, 39, 56),
(253, '2024-09-16', 'Dr-Sep 24/359', '3600/001', '0', '2000', '-229909125', 'Car Packing For Market', '', '', 0, 35, 57),
(254, '2024-09-16', 'Dr-Sep 24/360', '6100/002', '90000', '0', '501000', 'Ice 6pcs*15000ks For Market Fish', '', '', 0, 37, 58),
(255, '2024-09-16', 'Dr-Sep 24/360', '3600/001', '0', '90000', '-229999125', 'Ice 6pcs*15000ks For Market Fish', '', '', 0, 35, 59),
(256, '2024-09-16', '12149', '4000/b01', '', '10139580', '-9793080', '', '', '', 0, 0, 0),
(257, '2024-09-16', '12150', '4000/n04', '', '5099150', '-14892230', '', '', '', 0, 0, 0),
(258, '2024-09-17', '12151', '4000/t05', '', '28417785', '-43310015', '', '', '', 0, 0, 0),
(259, '2024-09-17', '12152', '4000/m09', '', '4516000', '-38794015', '', '', '', 0, 0, 0),
(260, '2024-09-17', '12153', '4000/t02', '', '8577800', '-47371815', '', '', '', 0, 0, 0),
(261, '2024-09-17', '12154', '4000/a03', '', '3848750', '-51220565', '', '', '', 0, 0, 0),
(262, '2024-09-17', '12155', '4000/b01', '', '5523050', '-56743615', '', '', '', 0, 0, 0),
(263, '2024-09-17', '12156', '4000/t07', '', '4185700', '-52557915', '', '', '', 0, 0, 0),
(264, '2024-09-18', '12157', '4000/t05', '', '8795475', '-61353390', '', '', '', 0, 0, 0),
(265, '2024-09-18', '12158', '4000/t16', '', '331760', '-61021630', '', '', '', 0, 0, 0),
(266, '2024-09-18', '12159', '4000/t01', '', '18749100', '-79770730', '', '', '', 0, 0, 0),
(267, '2024-09-18', '12160', '4000/z03', '', '9484625', '-89255355', '', '', '', 0, 0, 0),
(268, '2024-09-18', '12161', '4000/s04', '', '2573200', '-86682155', '', '', '', 0, 0, 0),
(269, '2024-09-18', '12162', '4000/b01', '', '1753500', '-88435655', '', '', '', 0, 0, 0),
(270, '2024-09-18', '12163', '4000/a06', '', '1116300', '-89551955', '', '', '', 0, 0, 0),
(271, '2024-09-19', '12164', '4000/t16', '', '311400', '-89863355', '', '', '', 0, 0, 0),
(272, '2024-09-19', '12165', '4000/t07', '', '2394000', '-87469355', '', '', '', 0, 0, 0),
(273, '2024-09-19', '12166', '4000/a01', '', '1837500', '-85631855', '', '', '', 0, 0, 0),
(274, '2024-09-19', '12167', '4000/b01', '', '25767200', '-111399055', '', '', '', 0, 0, 0),
(275, '2024-09-19', '12168', '4000/t02', '', '10021400', '-121420455', '', '', '', 0, 0, 0),
(276, '2024-09-20', '12169', '4000/s03', '', '37131955', '-158552410', '', '', '', 0, 0, 0),
(277, '2024-09-20', '12170', '4000/b01', '', '14018350', '-172570760', '', '', '', 0, 0, 0),
(278, '2024-09-20', '12171', '4000/a06', '', '1337650', '-173908410', '', '', '', 0, 0, 0),
(279, '2024-09-20', '12172', '4000/m09', '', '6804000', '-167104410', '', '', '', 0, 0, 0),
(280, '2024-09-20', '12173', '4000/t11', '', '10152000', '-156952410', '', '', '', 0, 0, 0),
(281, '2024-09-20', '12174', '4000/s04', '', '49700', '-156902710', '', '', '', 0, 0, 0),
(282, '2024-09-20', '12175', '4000/k10', '', '3906000', '-152996710', '', '', '', 0, 0, 0),
(283, '2024-09-20', '12176', '4000/k07', '', '6197500', '-159194210', '', '', '', 0, 0, 0),
(284, '2024-09-20', '12177', '4000/b01', '', '10129190', '-169323400', '', '', '', 0, 0, 0),
(285, '2024-09-21', '12178', '4000/n04', '', '2412500', '-171735900', '', '', '', 0, 0, 0),
(286, '2024-09-21', '12179', '4000/t07', '', '4675000', '-167060900', '', '', '', 0, 0, 0),
(287, '2024-09-21', '12180', '4000/s03', '', '27788020', '-194848920', '', '', '', 0, 0, 0),
(288, '2024-09-21', '12181', '4000/t11', '', '21198700', '-216047620', '', '', '', 0, 0, 0),
(289, '2024-09-21', '12182', '4000/t02', '', '9010500', '-225058120', '', '', '', 0, 0, 0),
(290, '2024-09-22', '12183', '4000/b01', '', '2712350', '-227770470', '', '', '', 0, 0, 0),
(291, '2024-09-22', '12185', '4000/k15', '', '2598400', '-225172070', '', '', '', 0, 0, 0),
(292, '2024-09-22', '12186', '4000/t01', '', '30964200', '-256136270', '', '', '', 0, 0, 0),
(293, '2024-09-22', '12187', '4000/s06', '', '717650', '-255418620', '', '', '', 0, 0, 0),
(294, '2024-09-22', '12188', '4000/a03', '', '9423600', '-264842220', '', '', '', 0, 0, 0),
(295, '2024-09-22', '12189', '4000/b01', '', '10076350', '-274918570', '', '', '', 0, 0, 0),
(296, '2024-09-23', '12190', '4000/p02', '', '9500000', '-265418570', '', '', '', 0, 0, 0),
(297, '2024-09-23', '12191', '4000/s03', '', '35877060', '-301295630', '', '', '', 0, 0, 0),
(298, '2024-09-23', '12192', '4000/t05', '', '56571930', '-357867560', '', '', '', 0, 0, 0),
(299, '2024-09-24', '12193', '4000/k10', '', '815300', '-357052260', '', '', '', 0, 0, 0),
(300, '2024-09-24', '12194', '4000/t02', '', '8794750', '-365847010', '', '', '', 0, 0, 0),
(301, '2024-09-24', '12195', '4000/b01', '', '15107750', '-380954760', '', '', '', 0, 0, 0),
(302, '2024-09-24', '12196', '4000/a03', '', '13622500', '-394577260', '', '', '', 0, 0, 0),
(303, '2024-09-24', '12197', '4000/a03', '', '7423500', '-402000760', '', '', '', 0, 0, 0),
(304, '2024-09-24', '12198', '4000/y01', '', '837500', '-401163260', '', '', '', 0, 0, 0),
(305, '2024-09-24', '12199', '4000/t03', '', '3509200', '-397654060', '', '', '', 0, 0, 0),
(306, '2024-09-24', '12200', '4000/s01', '', '14283600', '-411937660', '', '', '', 0, 0, 0),
(307, '2024-09-24', '12201', '4000/a14', '', '12220000', '-399717660', '', '', '', 0, 0, 0),
(308, '2024-09-25', '12202', '4000/a03', '', '11383000', '-411100660', '', '', '', 0, 0, 0),
(309, '2024-09-25', '12203', '4000/h01', '', '2171200', '-413271860', '', '', '', 0, 0, 0),
(310, '2024-09-25', '12204', '4000/b01', '', '4863550', '-418135410', '', '', '', 0, 0, 0),
(311, '2024-09-25', '12205', '4000/a01', '', '9865450', '-428000860', '', '', '', 0, 0, 0),
(312, '2024-09-25', '12206', '4000/s01', '', '9003000', '-437003860', '', '', '', 0, 0, 0),
(313, '2024-09-26', '12207', '4000/a14', '', '2010000', '-439013860', '', '', '', 0, 0, 0),
(314, '2024-09-26', '12208', '4000/a02', '', '68600', '-438945260', '', '', '', 0, 0, 0),
(315, '2024-09-26', '12209', '4000/s04', '', '386400', '-438558860', '', '', '', 0, 0, 0),
(316, '2024-09-26', '12210', '4000/t02', '', '5839100', '-444397960', '', '', '', 0, 0, 0),
(317, '2024-09-26', '12211', '4000/n04', '', '3402300', '-447800260', '', '', '', 0, 0, 0),
(318, '2024-09-26', '12212', '4000/s01', '', '8233600', '-456033860', '', '', '', 0, 0, 0),
(319, '2024-09-26', '12213', '4000/b01', '', '7613800', '-463647660', '', '', '', 0, 0, 0),
(320, '2024-09-26', '12214', '4000/k07', '', '8283450', '-471931110', '', '', '', 0, 0, 0),
(321, '2024-09-25', '12215', '4000/k07', '', '5425500', '-477356610', '', '', '', 0, 0, 0),
(322, '2024-09-27', '12216', '4000/a03', '', '8608500', '-485965110', '', '', '', 0, 0, 0),
(323, '2024-09-27', '12217', '4000/t07', '', '3757250', '-482207860', '', '', '', 0, 0, 0),
(324, '2024-09-27', '12218', '4000/b01', '', '10965050', '-493172910', '', '', '', 0, 0, 0),
(325, '2024-09-27', '12219', '4000/k11', '', '7683100', '-500856010', '', '', '', 0, 0, 0),
(326, '2024-09-27', '12220', '4000/t11', '', '14990250', '-515846260', '', '', '', 0, 0, 0),
(327, '2024-09-27', '12221', '4000/z03', '', '12263600', '-528109860', '', '', '', 0, 0, 0),
(328, '2024-09-28', '12222', '4000/a03', '', '5266500', '-533376360', '', '', '', 0, 0, 0),
(329, '2024-09-28', '12223', '4000/k07', '', '479600', '-533855960', '', '', '', 0, 0, 0),
(330, '2024-09-28', '12224', '4000/n04', '', '4653800', '-538509760', '', '', '', 0, 0, 0),
(331, '2024-09-28', '12225', '4000/b01', '', '16245950', '-554755710', '', '', '', 0, 0, 0),
(332, '2024-09-28', '12226', '4000/h01', '', '3142100', '-557897810', '', '', '', 0, 0, 0),
(333, '2024-09-28', '12227', '4000/s04', '', '1243200', '-556654610', '', '', '', 0, 0, 0),
(334, '2024-09-16', 'JV09-001', '3300/003', '147805.93', '0', '147805.93', 'Credit Sale to Jamuna (Canada) INV No. Can-11 OERU 4236159', 'Can.11/2024', 'OERU4236159', 0, 35, 117),
(335, '2024-09-16', 'JV09-001', '5000/002', '0', '147805.93', '-147805.93', 'Credit Sale to Jamuna (Canada) INV No. Can-11 OERU 4236159', '', '', 0, 36, 118),
(336, '2024-09-16', 'JV09-001', '3300/003', '118444.32', '0', '266250.25', 'Credit Sale to Jamuna (Canada) INV No. Can-12 SEGU 9973040', 'Can.12/2024', 'SEGU9973040', 0, 35, 119),
(337, '2024-09-16', 'JV09-001', '5000/002', '0', '118444.32', '-266250.25', 'Credit Sale to Jamuna (Canada) INV No. Can-12 SEGU 9973040', '', '', 0, 36, 120),
(338, '2024-09-16', 'JV09-001', '3300/003', '119522.71', '0', '385772.96', 'Credit Sale to Jamuna (Canada) INV No. Can-13 FBIU 5349800', 'Can.13/2024', 'FBIU5349800', 0, 35, 121),
(339, '2024-09-16', 'JV09-001', '5000/002', '0', '119522.71', '-385772.96', 'Credit Sale to Jamuna (Canada) INV No. Can-13 FBIU 5349800', '', '', 0, 36, 122),
(340, '2024-09-16', 'JV09-001', '3300/003', '114437.18', '0', '500210.14', 'Credit Sale to Jamuna (Canada) INV No. Can-14 FBIU 5175062', 'Can.14/2024', 'FBIU5175062', 0, 35, 123),
(341, '2024-09-16', 'JV09-001', '5000/002', '0', '114437.18', '-500210.14', 'Credit Sale to Jamuna (Canada) INV No. Can-14 FBIU 5175062', '', '', 0, 36, 124),
(342, '2024-09-16', 'JV09-001', '3300/003', '136682.63', '0', '636892.77', 'Credit Sale to Jamuna (Canada) INV No. Can-15 CXRU 1500578', 'Can.15/2024', 'CXRU1500578', 0, 35, 125),
(343, '2024-09-16', 'JV09-001', '5000/002', '0', '136682.63', '-636892.77', 'Credit Sale to Jamuna (Canada) INV No. Can-15 CXRU 1500578', '', '', 0, 36, 126),
(344, '2024-09-28', '12228', '4000/t07', '', '3934875', '-552719735', '', '', '', 0, 0, 0),
(345, '2024-09-28', '12229', '4000/t02', '', '6555450', '-559275185', '', '', '', 0, 0, 0),
(346, '2024-09-29', '12230', '4000/a14', '', '12472200', '-546802985', '', '', '', 0, 0, 0),
(347, '2024-09-29', '12231', '4000/t07', '', '10122875', '-556925860', '', '', '', 0, 0, 0),
(348, '2024-09-29', '12232', '4000/k15', '', '3072300', '-553853560', '', '', '', 0, 0, 0),
(349, '2024-09-29', '12233', '4000/b01', '', '15317300', '-569170860', '', '', '', 0, 0, 0),
(350, '2024-09-29', '12234', '4000/t11', '', '17346050', '-586516910', '', '', '', 0, 0, 0),
(351, '2024-09-29', '12235', '4000/k15', '', '2509300', '-589026210', '', '', '', 0, 0, 0),
(352, '2024-09-29', '12236', '4000/n04', '', '5598600', '-594624810', '', '', '', 0, 0, 0),
(353, '2024-09-29', '12237', '4000/b01', '', '17670950', '-612295760', '', '', '', 0, 0, 0),
(354, '2024-09-29', '12238', '4000/t02', '', '12086650', '-624382410', '', '', '', 0, 0, 0),
(355, '2024-09-29', '12239', '4000/t05', '', '49207460', '-673589870', '', '', '', 0, 0, 0),
(356, '2024-09-30', '00157', '4000/t15', '', '26865425', '-700455295', '', '', '', 0, 0, 0),
(357, '2024-09-30', '00158', '4000/t15', '', '11742275', '-712197570', '', '', '', 0, 0, 0),
(358, '2024-09-30', '12240', '4000/t07', '', '1391500', '-710806070', '', '', '', 0, 0, 0),
(359, '2024-10-01', '12241', '4000/t07', '', '1002500', '-711808570', '', '', '', 0, 0, 0),
(360, '2024-10-01', '12243', '4000/s01', '', '3504000', '-708304570', '', '', '', 0, 0, 0),
(361, '2024-10-01', '12244', '4000/b01', '', '15116800', '-723421370', '', '', '', 0, 0, 0),
(362, '2024-10-01', '12245', '4000/k03', '', '3316600', '-720104770', '', '', '', 0, 0, 0),
(363, '2024-10-01', '159', '4000/b01', '', '4645815', '-715458955', '', '', '', 0, 0, 0),
(364, '2024-10-02', '12246', '4000/t05', '', '16317960', '-731776915', '', '', '', 0, 0, 0),
(365, '2024-10-02', '12247', '4000/s04', '', '6452400', '-738229315', '', '', '', 0, 0, 0),
(366, '2024-10-02', '12248', '4000/t01', '', '12920700', '-751150015', '', '', '', 0, 0, 0),
(367, '2024-10-02', '12249', '4000/a03', '', '667000', '-751817015', '', '', '', 0, 0, 0),
(368, '2024-10-02', '12250', '4000/t07', '', '1303750', '-750513265', '', '', '', 0, 0, 0),
(369, '2024-10-02', '12251', '4000/z03', '', '14231625', '-764744890', '', '', '', 0, 0, 0),
(370, '2024-10-02', '12252', '4000/t11', '', '8097600', '-756647290', '', '', '', 0, 0, 0),
(371, '2024-10-02', '12253', '4000/b01', '', '7092950', '-763740240', '', '', '', 0, 0, 0),
(372, '2024-10-02', '12254', '4000/a01', '', '1131000', '-764871240', '', '', '', 0, 0, 0),
(373, '2024-10-02', '12255', '4000/n04', '', '4125400', '-768996640', '', '', '', 0, 0, 0),
(374, '2024-10-02', '12256', '4000/w03', '', '1309480', '-767687160', '', '', '', 0, 0, 0),
(375, '2024-10-03', '12257', '4000/t05', '', '17145790', '-784832950', '', '', '', 0, 0, 0),
(376, '2024-10-03', '12258', '4000/t11', '', '14402750', '-799235700', '', '', '', 0, 0, 0),
(377, '2024-10-03', '12259', '4000/a03', '', '2303500', '-801539200', '', '', '', 0, 0, 0),
(378, '2024-10-03', '12260', '4000/s04', '', '918400', '-800620800', '', '', '', 0, 0, 0),
(379, '2024-10-03', '12261', '4000/b01', '', '7906850', '-808527650', '', '', '', 0, 0, 0),
(380, '2024-10-03', '12262', '4000/t02', '', '9606300', '-818133950', '', '', '', 0, 0, 0),
(381, '2024-10-04', '12263', '4000/t05', '', '17409930', '-835543880', '', '', '', 0, 0, 0),
(382, '2024-10-04', '12264', '4000/n04', '', '3226600', '-838770480', '', '', '', 0, 0, 0),
(383, '2024-10-04', '12265', '4000/b01', '', '5951000', '-844721480', '', '', '', 0, 0, 0),
(384, '2024-10-04', '12266', '4000/s04', '', '5950000', '-850671480', '', '', '', 0, 0, 0),
(385, '2024-10-04', '12267', '4000/t11', '', '29393400', '-880064880', '', '', '', 0, 0, 0),
(386, '2024-10-04', '12268', '4000/a03', '', '1101000', '-878963880', '', '', '', 0, 0, 0),
(387, '2024-10-04', '12269', '4000/a14', '', '16264300', '-862699580', '', '', '', 0, 0, 0),
(388, '2024-10-05', '12270', '4000/t05', '', '19913480', '-882613060', '', '', '', 0, 0, 0),
(389, '2024-10-05', '12271', '4000/b01', '', '6080200', '-888693260', '', '', '', 0, 0, 0),
(390, '2024-10-05', '12272', '4000/t02', '', '7056900', '-895750160', '', '', '', 0, 0, 0),
(391, '2024-10-05', '12273', '4000/b01', '', '8816900', '-904567060', '', '', '', 0, 0, 0),
(392, '2024-10-05', '12274', '4000/t07', '', '4224500', '-900342560', '', '', '', 0, 0, 0),
(393, '2024-10-07', '12275', '4000/t05', '', '25498040', '-925840600', '', '', '', 0, 0, 0),
(394, '2024-10-07', '12276', '4000/t03', '', '1227800', '-927068400', '', '', '', 0, 0, 0),
(395, '2024-10-07', '12277', '4000/m09', '', '4455000', '-922613400', '', '', '', 0, 0, 0),
(396, '2024-10-07', '12278', '4000/k15', '', '3084200', '-925697600', '', '', '', 0, 0, 0),
(397, '2024-10-07', '12279', '4000/b01', '', '9358650', '-935056250', '', '', '', 0, 0, 0),
(398, '2024-10-07', '12280', '4000/t05', '', '20929525', '-955985775', '', '', '', 0, 0, 0),
(399, '2024-10-07', '12281', '4000/t08', '', '434600', '-956420375', '', '', '', 0, 0, 0),
(400, '2024-10-08', '12282', '4000/t07', '', '4662000', '-951758375', '', '', '', 0, 0, 0),
(401, '2024-10-08', '12283', '4000/t03', '', '1567100', '-953325475', '', '', '', 0, 0, 0),
(402, '2024-10-08', '12284', '4000/b01', '', '5258950', '-948066525', '', '', '', 0, 0, 0),
(403, '2024-10-08', '12285', '4000/a14', '', '7555600', '-940510925', '', '', '', 0, 0, 0),
(404, '2024-10-08', '160', '4000/t05', '', '2812600', '-937698325', '', '', '', 0, 0, 0),
(405, '2024-10-08', '161', '4000/b01', '', '5281500', '-932416825', '', '', '', 0, 0, 0),
(406, '2024-10-09', '00162', '4000/t05', '', '21663812.5', '-954080637.5', '', '', '', 0, 0, 0),
(407, '2024-10-09', '163', '4000/t05', '', '21179925', '-932900712.5', '', '', '', 0, 0, 0),
(408, '2024-10-09', '164', '4000/b01', '', '3573000', '-929327712.5', '', '', '', 0, 0, 0),
(409, '2024-10-09', '12286', '4000/t05', '', '8788000', '-938115712.5', '', '', '', 0, 0, 0),
(410, '2024-10-09', '12287', '4000/t05', '', '13756675', '-951872387.5', '', '', '', 0, 0, 0),
(411, '2024-10-09', '12288', '4000/b01', '', '2833050', '-954705437.5', '', '', '', 0, 0, 0),
(412, '2024-10-09', '12289', '4000/a01', '', '5146000', '-949559437.5', '', '', '', 0, 0, 0),
(413, '2024-10-09', '12290', '4000/t07', '', '4686500', '-944872937.5', '', '', '', 0, 0, 0),
(414, '2024-10-09', '12291', '4000/a03', '', '5311500', '-950184437.5', '', '', '', 0, 0, 0),
(415, '2024-10-09', '12292', '4000/t02', '', '1025200', '-951209637.5', '', '', '', 0, 0, 0),
(416, '2024-10-10', '12293', '4000/t05', '', '3900600', '-947309037.5', '', '', '', 0, 0, 0),
(417, '2024-10-10', '12294', '4000/t07', '', '1076250', '-946232787.5', '', '', '', 0, 0, 0),
(418, '2024-10-10', '12295', '4000/b01', '', '10881200', '-957113987.5', '', '', '', 0, 0, 0),
(419, '2024-10-10', '12296', '4000/t02', '', '1922300', '-959036287.5', '', '', '', 0, 0, 0),
(420, '2024-10-10', '12297', '4000/s04', '', '1097600', '-957938687.5', '', '', '', 0, 0, 0),
(421, '2024-10-10', '165', '4000/b02', '', '3557000', '-954381687.5', '', '', '', 0, 0, 0),
(422, '2024-10-11', '12299', '4000/b01', '', '6203500', '-960585187.5', '', '', '', 0, 0, 0),
(423, '2024-10-10', '12298', '4000/a03', '', '2979000', '-963564187.5', '', '', '', 0, 0, 0),
(424, '2024-10-10', '12300', '4000/t05', '', '27335675', '-990899862.5', '', '', '', 0, 0, 0),
(425, '2024-10-12', '12301', '4000/a03', '', '131100', '-990768762.5', '', '', '', 0, 0, 0),
(426, '2024-10-12', '12302', '4000/t02', '', '2023150', '-988745612.5', '', '', '', 0, 0, 0),
(427, '2024-10-12', '12303', '4000/b01', '', '12961070', '-1001706682.5', '', '', '', 0, 0, 0),
(428, '2024-10-12', '12304', '4000/t07', '', '2625000', '-999081682.5', '', '', '', 0, 0, 0),
(429, '2024-10-12', '12305', '4000/a03', '', '11355500', '-1010437182.5', '', '', '', 0, 0, 0),
(430, '2024-10-13', '12306', '4000/b01', '', '5049400', '-1015486582.5', '', '', '', 0, 0, 0),
(431, '2024-10-13', '12307', '4000/a06', '', '742300', '-1014744282.5', '', '', '', 0, 0, 0),
(432, '2024-10-13', '12308', '4000/t07', '', '2177000', '-1012567282.5', '', '', '', 0, 0, 0),
(433, '2024-10-13', '12309', '4000/a02', '', '1187750', '-1013755032.5', '', '', '', 0, 0, 0),
(434, '2024-10-13', '12310', '4000/a03', '', '1181000', '-1014936032.5', '', '', '', 0, 0, 0),
(435, '2024-10-14', '12311', '4000/b01', '', '15896320', '-1030832352.5', '', '', '', 0, 0, 0),
(436, '2024-10-14', '12312', '4000/a01', '', '7712800', '-1038545152.5', '', '', '', 0, 0, 0),
(437, '2024-09-19', 'Dr-Sep 24/388', '4000/a03', '7942750', '0', '-1006993282.5', 'Paid To Aung Naing Oo For Vr no 12091,12096,12154 , Cheque no 109452\r\n', '', '', 0, 40, 127),
(438, '2024-09-19', 'Dr-Sep 24/388', '3600/001', '0', '7942750', '-237941875', 'Paid To Aung Naing Oo For Vr no 12091,12096,12154 , Cheque no 109452\r\n', '', '', 0, 35, 128),
(439, '2024-09-19', 'Dr-Sep 24/389', '4000/a01', '1240800', '0', '-1037304352.5', 'Paid to A.K For Vr no 12097,12119 Cheque no 109455\r\n', '', '', 0, 40, 129),
(440, '2024-09-19', 'Dr-Sep 24/389', '3600/001', '0', '1240800', '-239182675', 'Paid to A.K For Vr no 12097,12119 Cheque no 109455\r\n\r\n', '', '', 0, 35, 130),
(441, '2024-09-19', 'Dr-Sep 24/390', '4000/b01', '100000000', '0', '-930832352.5', 'Paid to Bar Bu Lay For Vr no 12019,12020,12027,12028,12029,12039,12040,12041,12048,12059 Cheque no 109453\r\n\r\n\r\n', '', '', 0, 40, 131),
(442, '2024-09-19', 'Dr-Sep 24/390', '3600/001', '0', '100000000', '-339182675', 'Paid to Bar Bu Lay For Vr no 12019,12020,12027,12028,12029,12039,12040,12041,12048,12059 Cheque no 109453\r\n\r\n\r\n\r\n', '', '', 0, 35, 132),
(443, '2024-09-19', 'Dr-Sep 24/391', '4000/m09', '14565375', '0', '-908048025', 'Paid to Min Lwin For Vr no 12044,12103,12118,12146,12152 Cheque no 109456\r\n\r\n\r\n\r\n\r\n', '', '', 0, 40, 133),
(444, '2024-09-19', 'Dr-Sep 24/391', '3600/001', '0', '14565375', '-353748050', 'Paid to Min Lwin For Vr no 12044,12103,12118,12146,12152 Cheque no 109456\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 35, 134),
(445, '2024-09-19', 'Dr-Sep 24/392', '4000/m01', '5889650', '0', '11779300', 'Paid to MA For Vr no 12068,12014,12038,12047 Cheque no 109467\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 40, 135),
(446, '2024-09-19', 'Dr-Sep 24/392', '3600/001', '0', '5889650', '-359637700', 'Paid to MA For Vr no 12068,12014,12038,12047 Cheque no 109467\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 35, 136),
(447, '2024-09-19', 'Dr-Sep 24/393', '4000/n04', '10000000', '0', '-828770480', 'Paid to Nyan Tun For Vr no 12131,12135,12138 Cheque no 109459\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 40, 137),
(448, '2024-09-19', 'Dr-Sep 24/393', '3600/001', '0', '10000000', '-369637700', 'Paid to Nyan Tun For Vr no 12131,12135,12138 Cheque no 109459\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 35, 138),
(449, '2024-09-19', 'Dr-Sep 24/394', '4000/s03', '50000000', '0', '-251295630', 'Paid to Soe Min For Vr no 11893,11898,11914 Cheque no 109462\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 40, 139),
(450, '2024-09-19', 'Dr-Sep 24/394', '3600/001', '0', '50000000', '-419637700', 'Paid to Soe Min For Vr no 11893,11898,11914 Cheque no 109462\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 35, 140),
(451, '2024-09-19', 'Dr-Sep 24/395', '4000/s06', '4501200', '0', '-250917420', 'Paid to Soe Thein For Vr no 12114 Cheque no 109457\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 40, 141),
(452, '2024-09-19', 'Dr-Sep 24/395', '3600/001', '0', '4501200', '-424138900', 'Paid to Soe Thein For Vr no 12114 Cheque no 109457\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 35, 142),
(453, '2024-09-19', 'Dr-Sep 24/396', '4000/t07', '10000000', '0', '-1002567282.5', 'Paid to Thaung Tun For Vr no 12032,12045,12052,12064\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 40, 143),
(454, '2024-09-19', 'Dr-Sep 24/396', '3600/001', '0', '10000000', '-434138900', 'Paid to Thaung Tun For Vr no 12032,12045,12052,12064\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 35, 144),
(455, '2024-09-19', 'Dr-Sep 24/397', '4000/t02', '25000000', '0', '-963745612.5', 'Paid to Thein Htay For Vr no 12105,12107,12123,12130 Cheque no 109464\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 40, 145),
(456, '2024-09-19', 'Dr-Sep 24/397', '3600/001', '0', '25000000', '-459138900', 'Paid to Thein Htay For Vr no 12105,12107,12123,12130 Cheque no 109464\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 35, 146),
(457, '2024-09-19', 'Dr-Sep 24/398', '4000/t05', '48100375', '0', '-942799487.5', 'Paid to Thet Oo For Vr no 11881,11888,11897,11903,11904 Cheque no 109469\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 40, 147),
(458, '2024-09-19', 'Dr-Sep 24/398', '3600/001', '0', '48100375', '-507239275', 'Paid to Thet Oo For Vr no 11881,11888,11897,11903,11904 Cheque no 109469\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 35, 148),
(459, '2024-09-19', 'Dr-Sep 24/399', '4000/t15', '41899625', '0', '-670297945', 'Paid to Thet Oo (TCL) For Vr no 00155,00156 Cheque no 109469\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 40, 149),
(460, '2024-09-19', 'Dr-Sep 24/399', '3600/001', '0', '41899625', '-549138900', 'Paid to Thet Oo (TCL) For Vr no 00155,00156 Cheque no 109469\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 35, 150),
(461, '2024-09-19', 'Dr-Sep 24/400', '4000/t03', '6167260', '0', '-947158215', 'Paid to Thin Thin Yee For Vr no 12065,12098 Cheque no 109454\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 40, 151),
(462, '2024-09-19', 'Dr-Sep 24/400', '3600/001', '0', '6167260', '-555306160', 'Paid to Thin Thin Yee For Vr no 12065,12098 Cheque no 109454\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 35, 152),
(463, '2024-09-19', 'Dr-Sep 24/401', '4000/t17', '7658840', '0', '15317680', 'Paid to Than Than Myint For Vr no 12104,12093 Cheque no 109463\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 40, 153),
(464, '2024-09-19', 'Dr-Sep 24/401', '3600/001', '0', '7658840', '-562965000', 'Paid to Than Than Myint For Vr no 12104,12093 Cheque no 109463\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 35, 154),
(465, '2024-09-19', 'Dr-Sep 24/402', '4000/k07', '6710900', '0', '-527145060', 'Paid to Khin Maung Myint For Vr no 12121,12108 Cheque no 109461\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 40, 155),
(466, '2024-09-19', 'Dr-Sep 24/402', '3600/001', '0', '6710900', '-569675900', 'Paid to Khin Maung Myint For Vr no 12121,12108 Cheque no 109461\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 35, 156),
(467, '2024-09-19', 'Dr-Sep 24/403', '4000/k10', '734700', '0', '-356317560', 'Paid to Ko Myo For Vr no 12137 Cheque no 109465\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 40, 157),
(468, '2024-09-19', 'Dr-Sep 24/403', '3600/001', '0', '734700', '-570410600', 'Paid to Ko Myo For Vr no 12137 Cheque no 109465\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 35, 158),
(469, '2024-09-19', 'Dr-Sep 24/404', '4000/z03', '35169800', '0', '-729575090', 'Paid to Zaw Myat Thu For Vr no 12092,12115,12149,12160 Cheque no 109460\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 40, 159),
(470, '2024-09-19', 'Dr-Sep 24/404', '3600/001', '0', '35169800', '-605580400', 'Paid to Zaw Myat Thu For Vr no 12092,12115,12149,12160 Cheque no 109460\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 35, 160),
(471, '2024-09-19', 'Dr-Sep 24/405', '4000/t01', '18749100', '0', '-732400915', 'Paid to Thet Paing For Vr no 12159 Cheque no 109458\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 40, 161),
(472, '2024-09-19', 'Dr-Sep 24/405', '3600/001', '0', '18749100', '-624329500', 'Paid to Thet Paing For Vr no 12159 Cheque no 109458\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 35, 162),
(473, '2024-09-19', 'Dr-Sep 24/406', '4000/s10', '7000000', '0', '25507300', 'Paid to Carton Box Shwe Myay For Vr Date 27.8.24 Cheque no 109471\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 40, 163),
(474, '2024-09-19', 'Dr-Sep 24/406', '3600/001', '0', '7000000', '-631329500', 'Paid to Carton Box Shwe Myay For Vr Date 27.8.24 Cheque no 109471\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 35, 164),
(475, '2024-09-19', 'Dr-Sep 24/407', '4000/m04', '1876800', '0', '3753600', 'Paid to Carton Box MMMO Cheque no 109472\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 40, 165),
(476, '2024-09-19', 'Dr-Sep 24/407', '3600/001', '0', '1876800', '-633206300', 'Paid to Carton Box MMMO Cheque no 109472\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 35, 166),
(477, '2024-09-19', 'Dr-Sep 24/408', '4000/p03', '2000000', '0', '6527000', 'Paid to Carton Box Pan Thazin For Vr Date 26.8.24,27.8.24 Cheque no 109473\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 40, 167),
(478, '2024-09-19', 'Dr-Sep 24/408', '3600/001', '0', '2000000', '-635206300', 'Paid to Carton Box Pan Thazin For Vr Date 26.8.24,27.8.24 Cheque no 109473\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 35, 168),
(479, '2024-09-19', 'Dr-Sep 24/409', '4000/d04', '2920000', '0', '5840000', 'Paid to Dalian Ice For Vr Date 29.8.24,13.9.24 Cheque no 109474\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 40, 169),
(480, '2024-09-19', 'Dr-Sep 24/409', '3600/001', '0', '2920000', '-638126300', 'Paid to Dalian Ice For Vr Date 29.8.24,13.9.24 Cheque no 109474\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 35, 170),
(481, '2024-09-19', 'Dr-Sep 24/410', '4000/g03', '3760900', '0', '6737600', 'Paid to Plastic Golden Fish For Vr Date 12.9.24,13.9.24,18.9.24 Cheque no 109475\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 40, 171),
(482, '2024-09-19', 'Dr-Sep 24/410', '3600/001', '0', '3760900', '-641887200', 'Paid to Plastic Golden Fish For Vr Date 12.9.24,13.9.24,18.9.24 Cheque no 109475\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', '', 0, 35, 172),
(483, '2024-09-16', 'JV09-002', '3300/002', '160251.06', '0', '160251.06', 'Credit Sale to USA Buyer for SAF-13/2024', 'SAF.13/24', 'SZLU9619489', 0, 35, 173),
(484, '2024-09-16', 'JV09-002', '5000/001', '0', '160251.06', '-160251.06', 'Credit Sale to USA Buyer for SAF-13/2024', '', '', 0, 36, 174),
(485, '2024-09-16', 'JV09-002', '3300/002', '161919.92', '0', '322170.98', 'Credit Sale to USA Buyer for SAF-14/2024', 'SAF.14/24', 'FBIU5416339', 0, 35, 175),
(486, '2024-09-16', 'JV09-002', '5000/001', '0', '161919.92', '-322170.98', 'Credit Sale to USA Buyer for SAF-14/2024', '', '', 0, 36, 176),
(487, '2024-09-16', 'JV09-002', '3300/002', '191655.35', '0', '513826.33', 'Credit Sale to USA Buyer for SAF-15/2024', 'SAF.15/24', 'FBIU5417612', 0, 35, 177),
(488, '2024-09-16', 'JV09-002', '5000/001', '0', '191655.35', '-513826.33', 'Credit Sale to USA Buyer for SAF-15/2024', '', '', 0, 36, 178),
(489, '2024-09-16', 'JV09-002', '3300/002', '207412.5', '0', '721238.83', 'Credit Sale to USA Buyer for SAF-16/2024', 'SAF.16/24', 'OERU4242955', 0, 35, 179),
(490, '2024-09-16', 'JV09-002', '5000/001', '0', '207412.5', '-721238.83', 'Credit Sale to USA Buyer for SAF-16/2024', '', '', 0, 36, 180),
(491, '2024-09-16', 'JV09-002', '3300/002', '71877.63', '0', '793116.46', 'Credit Sale to USA Buyer for SAF-17/2024', 'SAF.17/24', 'OERU4216933', 0, 35, 181),
(492, '2024-09-16', 'JV09-002', '5000/001', '0', '71877.63', '-793116.46', 'Credit Sale to USA Buyer for SAF-17/2024', '', '', 0, 36, 182),
(493, '2024-09-16', 'JV09-002', '3300/002', '79575.81', '0', '872692.27', 'Credit Sale to USA Buyer for SAF-18/2024', 'SAF.18/24', 'SEKU9020043', 0, 35, 183),
(494, '2024-09-16', 'JV09-002', '5000/001', '0', '79575.81', '-872692.27', 'Credit Sale to USA Buyer for SAF-18/2024', '', '', 0, 36, 184),
(495, '2024-09-16', 'JV09-002', '3300/002', '74139.39', '0', '946831.66', 'Credit Sale to USA Buyer for SAF-19/2024', 'SAF.19/24', 'FBIU5007881', 0, 35, 185),
(496, '2024-09-16', 'JV09-002', '5000/001', '0', '74139.39', '-946831.66', 'Credit Sale to USA Buyer for SAF-19/2024', '', '', 0, 36, 186),
(501, '2024-09-16', 'JV09-003', '3300/005', '28480', '0', '28480', 'Adv; money transfer to All Vietnan Sense Ltd', '', '', 0, 35, 191),
(502, '2024-09-16', 'JV09-003', '3700/001', '0', '28480', '-28480', 'Adv; money transfer to All Vietnan Sense Ltd', '', '', 0, 35, 192),
(503, '2024-09-16', 'JV09-003', '3300/005', '4930', '0', '33410', 'Cold Store, Packing Material and Freezing Charges adjusted with Adv; Money', '', '', 0, 35, 193),
(504, '2024-09-16', 'JV09-003', '7000/002', '0', '4930', '-4930', 'Cold Store, Packing Material and Freezing Charges adjusted with Adv; Money', '', '', 0, 38, 194),
(505, '2024-09-16', 'JV09-004', '3300/007', '514727.02', '0', '514727.02', 'Credit Sale to SC Trader INV.35/23 to INV.15/24', 'Inv.35/23-15/24', 'Rohu,Katla', 0, 35, 195),
(506, '2024-09-16', 'JV09-004', '5000/003', '0', '514727.02', '-514727.02', 'Credit Sale to SC Trader INV.35/23 to INV.15/24', '', '', 0, 36, 196),
(507, '2024-09-16', 'JV09-005', '3300/006', '482932.6', '0', '482932.6', 'Credit Sale to Bangladesh (Frozen) Container', 'SC.5/22,6/22,1/24,2/24', 'Frozen Container', 0, 35, 197),
(508, '2024-09-16', 'JV09-005', '5000/004', '0', '482932.6', '-482932.6', 'Credit Sale to Bangladesh (Frozen) Container', '', '', 0, 36, 198),
(509, '2024-09-30', 'JV09-006', '3700/001', '55000', '0', '26520', 'USA Money Received to TD Account-Can', '', '', 0, 35, 199),
(510, '2024-09-30', 'JV09-006', '3300/002', '0', '55000', '891831.66', 'USA Money Received to TD Account-Can', '', '', 0, 35, 200),
(511, '2024-09-30', 'JV09-006', '9100/009', '47.5', '0', '2047.5', 'Bank Charges for USA Money Received to TD Account-Can', '', '', 0, 39, 201),
(512, '2024-09-30', 'JV09-006', '3700/001', '0', '47.5', '26472.5', 'Bank Charges for USA Money Received to TD Account-Can', '', '', 0, 35, 202);
INSERT INTO `general_ledger` (`id`, `date`, `voucherno`, `ac_code`, `debit`, `credit`, `balance`, `narration`, `sr_no`, `container_no`, `bank_charges`, `acid`, `transactionid`) VALUES
(513, '2024-09-30', 'JV09-007', '3400/005', '55000', '0', '55000', 'USA Money Received to RBC Account-Can and that money temporary loan to LM Global for Freight in and out', '', '', 0, 35, 203),
(514, '2024-09-30', 'JV09-007', '3300/002', '0', '55000', '836831.66', 'USA Money Received to RBC Account-Can and that money temporary loan to LM Global for Freight in and out', '', '', 0, 35, 204),
(515, '2024-09-30', 'JV09-008', '3300/002', '167667.27', '0', '1004498.93', 'Credit Sale to USA Buyer for SAF.20/24 and SAF.21//24', 'SAF.20/24 & 21/24', 'HLBU9522593/9538590', 0, 35, 205),
(516, '2024-09-30', 'JV09-008', '5000/001', '0', '167667.27', '-1114498.93', 'Credit Sale to USA Buyer for SAF.20/24 and SAF.21//24', '', '', 0, 36, 206),
(517, '2024-09-30', 'JV09-009', '3700/002', '137000', '0', '137000', 'Money Received from Can Buyer for Can No.11', '', '', 0, 35, 207),
(518, '2024-09-30', 'JV09-009', '3300/003', '0', '137000', '499892.77', 'Money Received from Can Buyer for Can No.11', '', '', 0, 35, 208),
(519, '2024-10-03', 'JV10-001', '3300/002', '77508.9', '0', '1082007.83', 'Credit Sale to USA Buyer for SAF.22/2024', 'SAF.22/24', 'HLBU9629935', 0, 35, 209),
(520, '2024-10-03', 'JV10-001', '5000/001', '0', '77508.9', '-1192007.83', 'Credit Sale to USA Buyer for SAF.22/2024', '', '', 0, 36, 210),
(521, '2024-10-04', 'JV10-002', '3300/003', '147256.52', '0', '647149.29', 'Credit Sale to Can Buyer for Can.16/2024', 'Can.16/24', 'FBIU5059817', 0, 35, 211),
(522, '2024-10-04', 'JV10-002', '5000/002', '0', '147256.52', '-784149.29', 'Credit Sale to Can Buyer for Can.16/2024', '', '', 0, 36, 212),
(523, '2024-10-04', 'JV10-003', '3700/002', '60000', '0', '197000', 'Money Received from Can for Can.11 and 12', '', '', 0, 35, 213),
(524, '2024-10-04', 'JV10-003', '3300/003', '0', '60000', '587149.29', 'Money Received from Can for Can.11 and 12', '', '', 0, 35, 214),
(525, '2024-10-07', 'JV10-004', '3700/001', '65000', '0', '91472.5', 'Money Received from USA for SAF.13/24', '', '', 0, 35, 215),
(526, '2024-10-07', 'JV10-004', '3300/002', '0', '65000', '1017007.83', 'Money Received from USA for SAF.13/24', '', '', 0, 35, 216),
(527, '2024-10-07', 'JV10-004', '9100/009', '47.5', '0', '2095', 'Bank Charges for Money Received from USA for SAF.13/24', '', '', 0, 39, 217),
(528, '2024-10-07', 'JV10-004', '3700/001', '0', '47.5', '91425', 'Bank Charges for Money Received from USA for SAF.13/24', '', '', 0, 35, 218),
(529, '2024-10-11', 'JV10-005', '3700/001', '65000', '0', '156425', 'Money Received from USA for SAF.13/24', '', '', 0, 35, 219),
(530, '2024-10-11', 'JV10-005', '3300/002', '0', '65000', '952007.83', 'Money Received from USA for SAF.13/24', '', '', 0, 35, 220),
(531, '2024-10-11', 'JV10-005', '9100/009', '47.5', '0', '2142.5', 'Bank Charges for Money Received from USA for SAF.13/24', '', '', 0, 39, 221),
(532, '2024-10-11', 'JV10-005', '3700/001', '0', '47.5', '156377.5', 'Bank Charges for Money Received from USA for SAF.13/24', '', '', 0, 35, 222),
(533, '2024-10-12', 'JV10-006', '3700/002', '47000', '0', '244000', 'Money Received from Can Buyer for Can.12', '', '', 0, 35, 223),
(534, '2024-10-12', 'JV10-006', '3300/003', '0', '47000', '540149.29', 'Money Received from Can Buyer for Can.12', '', '', 0, 35, 224),
(535, '2024-09-30', 'JV09-010', '3800/001', '9836.07', '0', '9836.07', 'Money Received from Border Trade-TCL (taka 1200000/122) / 1200000taka*38.1ks / $9836.07*4648.2ks', '', '', 0, 35, 225),
(536, '2024-09-30', 'JV09-010', '3300/007', '0', '9836.07', '504890.95', 'Money Received from Border Trade-TCL (taka 1200000/122) / 1200000taka*38.1ks / $9836.07*4648.2ks', '', '', 0, 35, 226),
(537, '2024-09-30', 'JV09-011', '3800/001', '22279.22', '0', '32115.29', 'Money Received from Frozen-Bangladesh (taka 2600000/122) / 2600000taka*38.1ks / $21311.48*4648.2ks and Teacher Transfer to Thai Law FIrm for ACE (Thai) baht 30000/31', '', '', 0, 35, 227),
(538, '2024-09-30', 'JV09-011', '3300/006', '0', '22279.22', '460653.38', 'Money Received from Frozen-Bangladesh (taka 2600000/122) / 2600000taka*38.1ks / $21311.48*4648.2ks and Teacher Transfer to Thai Law FIrm for ACE (Thai) baht 30000/31', '', '', 0, 35, 228),
(539, '2024-10-03', 'JV10-007', '3800/001', '4098.36', '0', '36213.65', 'Money Received from Border Trade-TCL (taka 500000/122) / 500000taka*36.2ks / $4098.36*4416.4ks', '', '', 0, 35, 229),
(540, '2024-10-03', 'JV10-007', '3300/007', '0', '4098.36', '500792.59', 'Money Received from Border Trade-TCL (taka 500000/122) / 500000taka*36.2ks / $4098.36*4416.4ks', '', '', 0, 35, 230),
(541, '2024-10-03', 'JV10-008', '3800/001', '28688.52', '0', '64902.17', 'Money Received from Frozen-Container (taka 3500000/122) / 3500000taka*36.2ks / $28688.52*4416.4ks', '', '', 0, 35, 231),
(542, '2024-10-03', 'JV10-008', '3300/006', '0', '28688.52', '431964.86', 'Money Received from Frozen-Container (taka 3500000/122) / 3500000taka*36.2ks / $28688.52*4416.4ks', '', '', 0, 35, 232),
(543, '2024-10-10', 'JV10-009', '3300/007', '16232.17', '0', '517024.76', 'Credit Sale to Border Trade-TCL for TCL.16/24', 'TCL.16/24', 'Rohu,Katla', 0, 35, 233),
(544, '2024-10-10', 'JV10-009', '5000/003', '0', '16232.17', '-530959.19', 'Credit Sale to Border Trade-TCL for TCL.16/24', '', '', 0, 36, 234),
(547, '2024-09-19', 'Cr-Sep 24/006', '3600/001', '179954226', '0', '-461932974', 'Can Money from UAB Bank $42000-Bank Chg; 150.18 = $41849.82 100%selling @4300 ($41849.82*4300ks)', '', '', 150.18, 35, 237),
(548, '2024-09-19', 'Cr-Sep 24/006', '3700/002', '0', '42000', '202000', 'Can Money from UAB Bank $42000-Bank Chg; 150.18 = $41849.82 100%selling @4300 ($41849.82*4300ks)', '', '', 0, 35, 238),
(549, '2024-09-19', 'Cr-Sep 24/007', '3600/001', '298657287.2', '0', '-163275686.8', 'USA Money from UAB Bank (Sarmad Transfer) 17.9.24 $70000- Bank chg;220.26 = $69779.74 100%selling @4280 ($69779.74*3900ks LM / $69779.74*380ks Nan)', '', '', 220.26, 35, 239),
(550, '2024-09-19', 'Cr-Sep 24/007', '3700/001', '0', '70000', '86377.5', 'USA Money from UAB Bank (Sarmad Transfer) 17.9.24 $70000- Bank chg;220.26 = $69779.74 100%selling @4280 ($69779.74*3900ks LM / $69779.74*380ks Nan)', '', '', 0, 35, 240),
(551, '2024-09-19', 'Cr-Sep 24/008', '3600/001', '1249005', '0', '-162026681.8', 'Technak Deposit Money Surplus Received for TCL.14 (Rohu 5203.8V*5525ks = 28750995ks-Adv; 30000000 = Surplus 1249005', '', '', 0, 35, 241),
(552, '2024-09-19', 'Cr-Sep 24/008', '9100/033', '0', '1249005', '-1249005', 'Technak Deposit Money Surplus Received for TCL.14 (Rohu 5203.8V*5525ks = 28750995ks-Adv; 30000000 = Surplus 1249005', '', '', 0, 39, 242),
(555, '2024-09-30', 'JV09-012', '9100/009', '264.11', '0', '2406.61', 'Bank Charges for 16.9.24 UAB 70000(37.81)+25.9.24 NNS 20000(38.15)+Kolkata 28480(38.15)+ WPS Billing 150', '', '', 0, 39, 245),
(556, '2024-09-30', 'JV09-012', '3700/001', '0', '264.11', '86113.39', 'Bank Charges for 16.9.24 UAB 70000(37.81)+25.9.24 NNS 20000(38.15)+Kolkata 28480(38.15)+ WPS Billing 150', '', '', 0, 35, 246),
(559, '2024-09-27', 'Cr-Sep 24/010', '3600/001', '93269006.5', '0', '125578115.7', 'USA money from NNS (Sarmad Transfer) $20000- Bank chg; 28.05 = $19971.95 * 4670ks', '', '', 28.05, 35, 249),
(560, '2024-09-27', 'Cr-Sep 24/010', '3700/001', '0', '20000', '66113.39', 'USA money from NNS (Sarmad Transfer) $20000- Bank chg; 28.05 = $19971.95 * 4670ks', '', '', 0, 35, 250),
(561, '2024-09-27', 'Cr-Sep 24/011', '3600/001', '45720020.574', '0', '171298136.274', 'Money Received from Border Trade-TCL (taka 1200000/122) / 1200000taka*38.1ks / $9836.07*4648.2ks', '', '', 0, 35, 251),
(562, '2024-09-27', 'Cr-Sep 24/011', '3800/001', '0', '9836.07', '55066.1', 'Money Received from Border Trade-TCL (taka 1200000/122) / 1200000taka*38.1ks / $9836.07*4648.2ks', '', '', 0, 35, 252),
(563, '2024-09-27', 'Cr-Sep 24/012', '3600/001', '99060021.336', '0', '270358157.61', 'Money Received from Frozen-Bangladesh (taka 2600000/122) / 2600000taka*38.1ks / $21311.48*4648.2ks', '', '', 0, 35, 253),
(564, '2024-09-27', 'Cr-Sep 24/012', '3800/001', '0', '21311.48', '33754.62', 'Money Received from Frozen-Bangladesh (taka 2600000/122) / 2600000taka*38.1ks / $21311.48*4648.2ks', '', '', 0, 35, 254),
(565, '2024-09-30', 'JV09-013', '3400/006', '967.74', '0', '967.74', 'Teacher Transfer to Thai Law Firm for ACE (Thai) baht 30000/31, that money adjusted with Frozen Account', '', '', 0, 35, 255),
(566, '2024-09-30', 'JV09-013', '3800/001', '0', '967.74', '32786.88', 'Teacher Transfer to Thai Law Firm for ACE (Thai) baht 30000/31, that money adjusted with Frozen Account', '', '', 0, 35, 256),
(567, '2024-10-01', 'JV10-010', '9100/017', '1363.98', '0', '31363.98', 'Air Ticket Fees for Sir Sarmad CAD 1795@1.316 (Can to Bangladesh)', '', '', 0, 39, 257),
(568, '2024-10-01', 'JV10-010', '3700/001', '0', '1363.98', '64749.41', 'Air Ticket Fees for Sir Sarmad CAD 1795@1.316 (Can to Bangladesh)', '', '', 0, 35, 258),
(569, '2024-10-04', 'JV10-011', '9100/001', '1513.32', '0', '1513.32', 'Sir Sarmad Salary Taken for Oct\'24 CAD 2000/1.3216', '', '', 0, 39, 259),
(570, '2024-10-04', 'JV10-011', '3700/001', '0', '1513.32', '63236.09', 'Sir Sarmad Salary Taken for Oct\'24 CAD 2000/1.3216', '', '', 0, 35, 260),
(571, '2024-10-07', 'JV10-012', '4000/003', '8000', '0', '8000', 'Paid to Jiangyin Junnan Packaging Co.,Ltd for China Plastic (1st time ADV;)', '', '', 0, 40, 261),
(572, '2024-10-07', 'JV10-012', '3700/001', '0', '8000', '55236.09', 'Paid to Jiangyin Junnan Packaging Co.,Ltd for China Plastic (1st time ADV;)', '', '', 0, 35, 262),
(573, '2024-10-10', 'JV10-013', '9100/009', '113.58', '0', '2520.19', 'Bank Charges for 2.10.24 NNS 35000(38.19)+7.10.24 China Plastic 8000(37.8)+9.10.24 UAB 50000(37.59)', '', '', 0, 39, 263),
(574, '2024-10-10', 'JV10-013', '3700/001', '0', '113.58', '55122.51', 'Bank Charges for 2.10.24 NNS 35000(38.19)+7.10.24 China Plastic 8000(37.8)+9.10.24 UAB 50000(37.59)', '', '', 0, 35, 264),
(575, '2024-10-03', 'Cr-Sep 24/010', '3600/001', '154347207.95', '0', '424705365.56', 'USA Money from NNS (Sarmad Transfer) $35000-Bank chg; 40.27 = $34959.73 * 4415ks', '', '', 40.27, 35, 265),
(576, '2024-10-03', 'Cr-Sep 24/010', '3700/001', '0', '35000', '20122.51', 'USA Money from NNS (Sarmad Transfer) $35000-Bank chg; 40.27 = $34959.73 * 4415ks', '', '', 0, 35, 266),
(577, '2024-10-03', 'Cr-Sep 24/011', '3600/001', '126688504.32', '0', '551393869.88', 'Money Received from Frozen-Container (taka 3500000/122) / 3500000taka*36.2ks / $28688.52*4416.4ks	', '', '', 0, 35, 267),
(578, '2024-10-03', 'Cr-Sep 24/011', '3800/001', '0', '28688.52', '4098.36', 'Money Received from Frozen-Container (taka 3500000/122) / 3500000taka*36.2ks / $28688.52*4416.4ks	', '', '', 0, 35, 268),
(579, '2024-10-03', 'Cr-Sep 24/012', '3600/001', '18098357.76', '0', '569492227.64', 'Money Received from Border Trade-TCL (taka 500000/122) / 500000taka*36.2ks / $4098.36*4416.4ks', '', '', 0, 35, 269),
(580, '2024-10-03', 'Cr-Sep 24/012', '3800/001', '0', '4098.36', '-9.0949470177293E-13', 'Money Received from Border Trade-TCL (taka 500000/122) / 500000taka*36.2ks / $4098.36*4416.4ks', '', '', 0, 35, 270),
(581, '2024-09-26', 'JV09-014', '3700/003', '50000', '0', '50000', 'Can Money Received from UAB 19.9.24 $50000- Bank chg; 170.31 = $49829.69 100%selling @4290 ', '', '', 0, 35, 271),
(582, '2024-09-26', 'JV09-014', '3700/002', '0', '50000', '152000', 'Can Money Received from UAB 19.9.24 $50000- Bank chg; 170.31 = $49829.69 100%selling @4290 ', '', '', 0, 35, 272),
(583, '2024-09-26', 'Cr-Sep 24/009', '3600/001', '194335791', '0', '763828018.64', 'Can Money Received from UAB 19.9.24 $50000- Bank chg; 170.31 = $49829.69 100%selling @4290 ($49829.69*3900ks LM / Balance @390 )', '', '', 170.31, 35, 273),
(584, '2024-09-26', 'Cr-Sep 24/009', '3700/003', '0', '50000', '0', 'Can Money Received from UAB 19.9.24 $50000- Bank chg; 170.31 = $49829.69 100%selling @4290 ($49829.69*3900ks LM / Balance @390 )', '', '', 0, 35, 274),
(585, '2024-10-07', 'Cr-Sep 24/013', '3600/001', '19433579.1', '0', '783261597.74', 'Can Money Received from UAB 19.9.24 $50000- Bank chg; 170.31 = $49829.69 100%selling @4290 26.9.24 Balance Money 49829.69*390ks (Cr-Sep 24/009)', '', '', 170.31, 35, 275),
(586, '2024-10-07', 'Cr-Sep 24/013', '3700/003', '0', '50000', '-50000', 'Can Money Received from UAB 19.9.24 $50000- Bank chg; 170.31 = $49829.69 100%selling @4290 26.9.24 Balance Money 49829.69*390ks (Cr-Sep 24/009)', '', '', 0, 35, 276);

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
(97, 'NY', 'Balance', '2024-09-25', '1020', '2up', '24', 4, 4, 'G', '', '', '', '', '', '', '', 0),
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
(142, 'NY', 'Balance', '2024-10-03', '1023', '4up', '24', 66, 14, 'G', '', '', '', '', '', '', '', 0),
(143, 'NY', 'Balance', '2024-10-03', '1023', '4up', '19', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(144, 'NY', 'Balance', '2024-10-03', '1023', '5up', '22', 19, 19, 'G', '', '', '', '', '', '', '', 0),
(145, 'NY', 'Balance', '2024-10-03', '1023', '5up', '23', 14, 14, 'G', '', '', '', '', '', '', '', 0),
(146, 'NY', 'Balance', '2024-10-03', '1023', '5up', '24', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(147, 'LM', 'Balance', '2024-09-30', '1031', '3up', '22', 1, 1, 'G', '', '', '', '', '', '', '', 0),
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
(161, 'NY', 'Balance', '2024-10-04', '1031', '3up', '1', 64, 64, 'G', '', '', '', '', '', '', '', 0),
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
(185, 'can', 'HHK To GFC', '2024-10-08', '1002', '5up', '22', 3, 3, '', '', '', '', '', '', '', '', 136),
(186, 'can', 'HHK To GFC', '2024-10-08', '1002', '6up', '20', 1, 1, '', '', '', '', '', '', '', '', 137),
(187, 'can', 'HHK To GFC', '2024-10-08', '1002', '7up', '24', 1, 1, '', '', '', '', '', '', '', '', 138),
(188, 'NY', 'Balance', '2024-09-25', '1031', '1kgx15pks', '15', 7, 7, 'Cut_piece', '', '', '', '', '', '', '', 0),
(189, 'NY', 'Repacking in', '2024-10-08', '1037', '150/200', '20', 1, 1, 'W', '', '', '', '', '', '', '', 0),
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
(218, 'Can', 'Balance', '2024-10-04', '1031', '3up', '20', 30, 81, 'fillet', '', '', '', '', '', '', '', 0),
(219, 'Can', 'Balance', '2024-10-04', '1031', '3up', '21', 76, 161, 'fillet', '', '', '', '', '', '', '', 0),
(220, 'can', 'Balance', '2024-10-04', '1001', '3up', '23', 0, 0, 'G', '', '', '', '', '', '', '', 0),
(221, 'Can', 'Balance', '2024-10-04', '1031', '3up', '22', 33, 86, 'fillet', '', '', '', '', '', '', '', 0),
(222, 'Can', 'Balance', '2024-10-04', '1031', '3up', '19', 1, 20, 'fillet', '', '', '', '', '', '', '', 0),
(223, 'Can', 'Balance', '2024-09-13', '1031', '250g x24bls', '6', 23, 23, 'egg', '', '', '', '', '', '', '', 0),
(224, 'Can', 'Balance', '2024-10-04', '1004', '500g x12bls', '6', 72, 72, 'G', '', '', '', '', '', '', '', 0),
(225, 'Can', 'Balance', '2024-08-22', '1036', '8/10', '20', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(226, 'Can', 'Balance', '2024-08-22', '1036', '1up', '20', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(227, 'Can', 'Balance', '2024-08-22', '1036', '1.5up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(228, 'LM', 'Balance', '2024-08-02', '1031', '3up', '20', 9, 9, 'W', '', '', '', '', '', '', '', 0),
(229, 'LM', 'Balance', '2024-08-02', '1031', '3up', '21', 7, 7, 'W', '', '', '', '', '', '', '', 0),
(230, 'LM', 'Balance', '2024-08-02', '1031', '3up', '22', 1, 2, 'W', '', '', '', '', '', '', '', 0),
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
(312, 'LM', 'Balance', '2024-10-10', '1037', '150/200', '20', 28, 28, 'W', '', '', '', '', '', '', '', 0),
(313, 'LM', 'Balance', '2024-10-10', '1037', '100/150', '20', 76, 76, 'W', '', '', '', '', '', '', '', 0),
(314, 'LM', 'Balance', '2024-10-10', '1037', '100/150', '21', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(315, 'LM', 'Balance', '2024-10-10', '1037', '100/200', '20', 220, 220, 'W', '', '', '', '', '', '', '', 0),
(316, 'LM', 'Balance', '2024-10-10', '1037', '100/200', '21', 3, 3, 'W', '', '', '', '', '', '', '', 0),
(317, 'LM', 'Balance', '2024-10-10', '1037', '100/200', '10.5', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(318, 'LM', 'Balance', '2024-10-10', '1037', '', '', 0, 0, 'W', '', '', '', '', '', '', '', 0),
(319, 'LM', 'Balance', '2024-10-10', '1037', '80/100', '15', 3, 3, 'W', '', '', '', '', '', '', '', 0),
(320, 'LM', 'Balance', '2024-10-10', '1037', 'Mix', '20', 18, 18, 'W', '', '', '', '', '', '', '', 0),
(321, 'LM', 'Balance', '2024-10-10', '1037', 'Mix', '24', 1, 1, 'W', '', '', '', '', '', '', '', 0);

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
(11, 'can', 'From Form-10', '2024-10-05', '1001', '1.5up', '30', 2, 2, '', '', 0, '', '', 0, '', 'G'),
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
(27, 'can', 'Balance', '2024-10-05', '1027', '4up', '23', 1, 1, '', '', 0, '', '', 0, '', 'egg'),
(28, 'can', 'Balance', '2024-10-05', '1027', '5up', '23', 1, 1, '', '', 0, '', '', 0, '', 'egg'),
(29, 'can', 'Balance', '2024-10-05', '1027', '3up', '23', 1, 1, '', '', 0, '', '', 0, '', 'egg'),
(30, 'can', 'Balance', '2024-10-05', '1027', '3up', '24', 1, 1, '', '', 0, '', '', 0, '', 'egg'),
(31, 'NY', 'Balance', '2024-10-05', '1023', '4up', '23', 18, 18, '', '', 0, '', '', 0, '', 'G'),
(32, 'NY', 'Balance', '2024-10-05', '1023', '4up', '24', 16, 16, '', '', 0, '', '', 0, '', 'G'),
(33, 'NY', 'Balance', '2024-10-05', '1023', '5up', '22', 14, 14, '', '', 0, '', '', 0, '', 'G'),
(34, 'NY', 'Balance', '2024-10-05', '1023', '5up', '23', 9, 9, '', '', 0, '', '', 0, '', 'G'),
(35, 'NY', 'Balance', '2024-10-05', '1023', '5up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(36, 'NY', 'Balance', '2024-10-05', '1023', '6up', '20', 4, 4, '', '', 0, '', '', 0, '', 'G'),
(37, 'NY', 'Balance', '2024-10-05', '1023', '6up', '19', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(38, 'NY', 'Balance', '2024-10-05', '1023', '7up', '24', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(39, 'NY', 'From Form-10', '2024-10-05', '1023', '4up', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(40, 'NY', 'From Form-10', '2024-10-05', '1023', '4up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(41, 'NY', 'From Form-10', '2024-10-05', '1023', '4up', '24', 9, 9, '', '', 0, '', '', 0, '', 'G'),
(42, 'can', 'From Form-10', '2024-10-05', '1023', '5up', '22', 3, 17, '', '', 0, '', '', 0, '', 'G'),
(43, 'can', 'From Form-10', '2024-10-05', '1023', '5up', '23', 4, 13, '', '', 0, '', '', 0, '', 'G'),
(44, 'can', 'From Form-10', '2024-10-05', '1023', '6up', '20', 3, 7, '', '', 0, '', '', 0, '', 'G'),
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
(124, 'can', 'From Form-10', '2024-10-06', '1023', '6up', '20', 3, 10, '', '', 0, '', '', 0, '', 'G'),
(125, 'can', 'From Form-10', '2024-10-06', '1023', '6up', '19', 5, 5, '', '', 0, '', '', 0, '', 'G'),
(126, 'can', 'From Form-10', '2024-10-06', '1023', '7up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(127, 'can', 'From Form-10', '2024-10-06', '1023', '7up', '23', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(129, 'can', 'HHK To GFC', '2024-10-08', '1002', '1up', '20', 2, 0, '', '', 0, '', '', 0, '', ''),
(130, 'can', 'HHK To GFC', '2024-10-08', '1002', '1.5up', '20', 1, 1, '', '', 0, '', '', 0, '', ''),
(131, 'can', 'HHK To GFC', '2024-10-08', '1002', '2up', '20', 6, 5, '', '', 0, '', '', 0, '', ''),
(134, 'can', 'HHK To GFC', '2024-10-08', '1002', '4up', '20', 1, 1, '', '', 0, '', '', 0, '', ''),
(135, 'can', 'HHK To GFC', '2024-10-08', '1002', '4up', '23', 2, 3, '', '', 0, '', '', 0, '', ''),
(136, 'can', 'HHK To GFC', '2024-10-08', '1002', '5up', '22', 3, 1, '', '', 0, '', '', 0, '', ''),
(137, 'can', 'HHK To GFC', '2024-10-08', '1002', '6up', '20', 1, 2, '', '', 0, '', '', 0, '', ''),
(138, 'can', 'HHK To GFC', '2024-10-08', '1002', '7up', '24', 1, 0, '', '', 0, '', '', 0, '', '');

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
  `supplier_id` text NOT NULL,
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
(1, '2024-09-15', '4000/A03', '', 0, '0000-00-00', '', '', 0, 0, 0, 4094000, '0000-00-00'),
(2, '2024-09-15', '4000/A01', '', 0, '0000-00-00', '', '', 0, 0, 0, 1240800, '0000-00-00'),
(3, '2024-09-15', '4000/B01', '', 0, '0000-00-00', '', '', 0, 0, 0, 371597395, '0000-00-00'),
(4, '2024-09-15', '4000/H01', '', 0, '0000-00-00', '', '', 0, 0, 0, 817650, '0000-00-00'),
(5, '2024-09-15', '4000/M09', '', 0, '0000-00-00', '', '', 0, 0, 0, 10049375, '0000-00-00'),
(6, '2024-09-15', '4000/M01', '', 0, '0000-00-00', '', '', 0, 0, 0, 5889650, '0000-00-00'),
(7, '2024-09-15', '4000/N04', '', 0, '0000-00-00', '', '', 0, 0, 0, 10403200, '0000-00-00'),
(8, '2024-09-15', '4000/S03', '', 0, '0000-00-00', '', '', 0, 0, 0, 220676231, '0000-00-00'),
(9, '2024-09-15', '4000/S06', '', 0, '0000-00-00', '', '', 0, 0, 0, 4501200, '0000-00-00'),
(10, '2024-09-15', '4000/T07', '', 0, '0000-00-00', '', '', 0, 0, 0, 32369880, '0000-00-00'),
(11, '2024-09-15', '4000/T02', '', 0, '0000-00-00', '', '', 0, 0, 0, 49847625, '0000-00-00'),
(12, '2024-09-15', '4000/T05', '', 0, '0000-00-00', '', '', 0, 0, 0, 414635429, '0000-00-00'),
(13, '2024-09-15', '4000/T15', '', 0, '0000-00-00', '', '', 0, 0, 0, 41899625, '0000-00-00'),
(14, '2024-09-15', '4000/T03', '', 0, '0000-00-00', '', '', 0, 0, 0, 6167260, '0000-00-00'),
(15, '2024-09-15', '4000/T17', '', 0, '0000-00-00', '', '', 0, 0, 0, 7658840, '0000-00-00'),
(16, '2024-09-15', '4000/K07', '', 0, '0000-00-00', '', '', 0, 0, 0, 6710900, '0000-00-00'),
(17, '2024-09-15', '4000/k10', '', 0, '0000-00-00', '', '', 0, 0, 0, 734700, '0000-00-00'),
(18, '2024-09-15', '4000/Z03', '', 0, '0000-00-00', '', '', 0, 0, 0, 25685175, '0000-00-00'),
(19, '2024-09-15', '4000/S10', '', 0, '0000-00-00', '', '', 0, 0, 0, 18507300, '0000-00-00'),
(20, '2024-09-15', '4000/M04', '', 0, '0000-00-00', '', '', 0, 0, 0, 1876800, '0000-00-00'),
(21, '2024-09-15', '4000/P03', '', 0, '0000-00-00', '', '', 0, 0, 0, 4527000, '0000-00-00'),
(22, '2024-09-15', '4000/D04', '', 0, '0000-00-00', '', '', 0, 0, 0, 2920000, '0000-00-00'),
(23, '2024-09-15', '4000/G03', '', 0, '0000-00-00', '', '', 0, 0, 0, 2976700, '0000-00-00'),
(24, '2024-09-15', '4000/H03', '', 0, '0000-00-00', '', '', 0, 0, 0, 26820334, '0000-00-00'),
(27, '0000-00-00', '4000/T14', '941790549', 0, '2024-09-16', 'Dr-Sep 24/355', 'Paid to Tun Naing For Vr no 12148', 346500, 0, 0, 0, '0000-00-00'),
(28, '2024-09-16', '4000/b01', '12149', 363000, '0000-00-00', '', '', 0, 363000, 1, 0, '0000-00-00'),
(29, '2024-09-16', '4000/b01', '12149', 270000, '0000-00-00', '', '', 0, 633000, 2, 0, '0000-00-00'),
(30, '2024-09-16', '4000/b01', '12149', 358800, '0000-00-00', '', '', 0, 991800, 3, 0, '0000-00-00'),
(31, '2024-09-16', '4000/b01', '12149', 370800, '0000-00-00', '', '', 0, 1362600, 4, 0, '0000-00-00'),
(32, '2024-09-16', '4000/b01', '12149', 1395000, '0000-00-00', '', '', 0, 2757600, 5, 0, '0000-00-00'),
(33, '2024-09-16', '4000/b01', '12149', 221000, '0000-00-00', '', '', 0, 2978600, 6, 0, '0000-00-00'),
(34, '2024-09-16', '4000/b01', '12149', 165600, '0000-00-00', '', '', 0, 3144200, 7, 0, '0000-00-00'),
(35, '2024-09-16', '4000/b01', '12149', 1845200, '0000-00-00', '', '', 0, 4989400, 8, 0, '0000-00-00'),
(36, '2024-09-16', '4000/b01', '12149', 1360000, '0000-00-00', '', '', 0, 6349400, 9, 0, '0000-00-00'),
(37, '2024-09-16', '4000/b01', '12149', 3730680, '0000-00-00', '', '', 0, 10080080, 10, 0, '0000-00-00'),
(38, '2024-09-16', '4000/b01', '12149', 59500, '0000-00-00', '', '', 0, 10139580, 11, 0, '0000-00-00'),
(39, '2024-09-16', '4000/n04', '12150', 1456650, '0000-00-00', '', '', 0, 1456650, 12, 0, '0000-00-00'),
(40, '2024-09-16', '4000/n04', '12150', 1094400, '0000-00-00', '', '', 0, 2551050, 13, 0, '0000-00-00'),
(41, '2024-09-16', '4000/n04', '12150', 307500, '0000-00-00', '', '', 0, 2858550, 14, 0, '0000-00-00'),
(42, '2024-09-16', '4000/n04', '12150', 970200, '0000-00-00', '', '', 0, 3828750, 15, 0, '0000-00-00'),
(43, '2024-09-16', '4000/n04', '12150', 334400, '0000-00-00', '', '', 0, 4163150, 16, 0, '0000-00-00'),
(44, '2024-09-16', '4000/n04', '12150', 348000, '0000-00-00', '', '', 0, 4511150, 17, 0, '0000-00-00'),
(45, '2024-09-16', '4000/n04', '12150', 588000, '0000-00-00', '', '', 0, 5099150, 18, 0, '0000-00-00'),
(46, '2024-09-17', '4000/t05', '12151', 469710, '0000-00-00', '', '', 0, 469710, 19, 0, '0000-00-00'),
(47, '2024-09-17', '4000/t05', '12151', 8761695, '0000-00-00', '', '', 0, 9231405, 20, 0, '0000-00-00'),
(48, '2024-09-17', '4000/t05', '12151', 8527170, '0000-00-00', '', '', 0, 17758575, 21, 0, '0000-00-00'),
(49, '2024-09-17', '4000/t05', '12151', 6028200, '0000-00-00', '', '', 0, 23786775, 22, 0, '0000-00-00'),
(50, '2024-09-17', '4000/t05', '12151', 4631010, '0000-00-00', '', '', 0, 28417785, 23, 0, '0000-00-00'),
(51, '2024-09-17', '4000/m09', '12152', 4516000, '0000-00-00', '', '', 0, 4516000, 24, 0, '0000-00-00'),
(52, '2024-09-17', '4000/t02', '12153', 1232000, '0000-00-00', '', '', 0, 1232000, 25, 0, '0000-00-00'),
(53, '2024-09-17', '4000/t02', '12153', 782000, '0000-00-00', '', '', 0, 2014000, 26, 0, '0000-00-00'),
(54, '2024-09-17', '4000/t02', '12153', 1029600, '0000-00-00', '', '', 0, 3043600, 27, 0, '0000-00-00'),
(55, '2024-09-17', '4000/t02', '12153', 1195200, '0000-00-00', '', '', 0, 4238800, 28, 0, '0000-00-00'),
(56, '2024-09-17', '4000/t02', '12153', 3514400, '0000-00-00', '', '', 0, 7753200, 29, 0, '0000-00-00'),
(57, '2024-09-17', '4000/t02', '12153', 347600, '0000-00-00', '', '', 0, 8100800, 30, 0, '0000-00-00'),
(58, '2024-09-17', '4000/t02', '12153', 277500, '0000-00-00', '', '', 0, 8378300, 31, 0, '0000-00-00'),
(59, '2024-09-17', '4000/t02', '12153', 199500, '0000-00-00', '', '', 0, 8577800, 32, 0, '0000-00-00'),
(60, '2024-09-17', '4000/a03', '12154', 2453750, '0000-00-00', '', '', 0, 2453750, 33, 0, '0000-00-00'),
(61, '2024-09-17', '4000/a03', '12154', 1395000, '0000-00-00', '', '', 0, 3848750, 34, 0, '0000-00-00'),
(62, '2024-09-17', '4000/b01', '12155', 577500, '0000-00-00', '', '', 0, 10717080, 35, 0, '0000-00-00'),
(63, '2024-09-17', '4000/b01', '12155', 810000, '0000-00-00', '', '', 0, 11527080, 36, 0, '0000-00-00'),
(64, '2024-09-17', '4000/b01', '12155', 604500, '0000-00-00', '', '', 0, 12131580, 37, 0, '0000-00-00'),
(65, '2024-09-17', '4000/b01', '12155', 259200, '0000-00-00', '', '', 0, 12390780, 38, 0, '0000-00-00'),
(66, '2024-09-17', '4000/b01', '12155', 2180250, '0000-00-00', '', '', 0, 14571030, 39, 0, '0000-00-00'),
(67, '2024-09-17', '4000/b01', '12155', 127500, '0000-00-00', '', '', 0, 14698530, 40, 0, '0000-00-00'),
(68, '2024-09-17', '4000/b01', '12155', 39600, '0000-00-00', '', '', 0, 14738130, 41, 0, '0000-00-00'),
(69, '2024-09-17', '4000/b01', '12155', 322500, '0000-00-00', '', '', 0, 15060630, 42, 0, '0000-00-00'),
(70, '2024-09-17', '4000/b01', '12155', 602000, '0000-00-00', '', '', 0, 15662630, 43, 0, '0000-00-00'),
(71, '2024-09-17', '4000/t07', '12156', 4185700, '0000-00-00', '', '', 0, 4185700, 44, 0, '0000-00-00'),
(72, '2024-09-18', '4000/t05', '12157', 3353250, '0000-00-00', '', '', 0, 31771035, 45, 0, '0000-00-00'),
(73, '2024-09-18', '4000/t05', '12157', 2799225, '0000-00-00', '', '', 0, 34570260, 46, 0, '0000-00-00'),
(74, '2024-09-18', '4000/t05', '12157', 295200, '0000-00-00', '', '', 0, 34865460, 47, 0, '0000-00-00'),
(75, '2024-09-18', '4000/t05', '12157', 2347800, '0000-00-00', '', '', 0, 37213260, 48, 0, '0000-00-00'),
(76, '2024-09-18', '4000/t16', '12158', 331760, '0000-00-00', '', '', 0, 331760, 49, 0, '0000-00-00'),
(77, '2024-09-18', '4000/t01', '12159', 6231400, '0000-00-00', '', '', 0, 6231400, 50, 0, '0000-00-00'),
(78, '2024-09-18', '4000/t01', '12159', 10586900, '0000-00-00', '', '', 0, 16818300, 51, 0, '0000-00-00'),
(79, '2024-09-18', '4000/t01', '12159', 1183200, '0000-00-00', '', '', 0, 18001500, 52, 0, '0000-00-00'),
(80, '2024-09-18', '4000/t01', '12159', 747600, '0000-00-00', '', '', 0, 18749100, 53, 0, '0000-00-00'),
(81, '2024-09-18', '4000/z03', '12160', 1998000, '0000-00-00', '', '', 0, 1998000, 54, 0, '0000-00-00'),
(82, '2024-09-18', '4000/z03', '12160', 176000, '0000-00-00', '', '', 0, 2174000, 55, 0, '0000-00-00'),
(83, '2024-09-18', '4000/z03', '12160', 1448000, '0000-00-00', '', '', 0, 3622000, 56, 0, '0000-00-00'),
(84, '2024-09-18', '4000/z03', '12160', 457500, '0000-00-00', '', '', 0, 4079500, 57, 0, '0000-00-00'),
(85, '2024-09-18', '4000/z03', '12160', 2990625, '0000-00-00', '', '', 0, 7070125, 58, 0, '0000-00-00'),
(86, '2024-09-18', '4000/z03', '12160', 1950500, '0000-00-00', '', '', 0, 9020625, 59, 0, '0000-00-00'),
(87, '2024-09-18', '4000/z03', '12160', 464000, '0000-00-00', '', '', 0, 9484625, 60, 0, '0000-00-00'),
(88, '2024-09-18', '4000/s04', '12161', 2573200, '0000-00-00', '', '', 0, 2573200, 61, 0, '0000-00-00'),
(89, '2024-09-18', '4000/b01', '12162', 896000, '0000-00-00', '', '', 0, 16558630, 62, 0, '0000-00-00'),
(90, '2024-09-18', '4000/b01', '12162', 857500, '0000-00-00', '', '', 0, 17416130, 63, 0, '0000-00-00'),
(91, '2024-09-18', '4000/a06', '12163', 770000, '0000-00-00', '', '', 0, 770000, 64, 0, '0000-00-00'),
(92, '2024-09-18', '4000/a06', '12163', 138600, '0000-00-00', '', '', 0, 908600, 65, 0, '0000-00-00'),
(93, '2024-09-18', '4000/a06', '12163', 207700, '0000-00-00', '', '', 0, 1116300, 66, 0, '0000-00-00'),
(94, '2024-09-19', '4000/t16', '12164', 192500, '0000-00-00', '', '', 0, 524260, 67, 0, '0000-00-00'),
(95, '2024-09-19', '4000/t16', '12164', 118900, '0000-00-00', '', '', 0, 643160, 68, 0, '0000-00-00'),
(96, '2024-09-19', '4000/t07', '12165', 2394000, '0000-00-00', '', '', 0, 6579700, 69, 0, '0000-00-00'),
(97, '2024-09-19', '4000/a01', '12166', 1837500, '0000-00-00', '', '', 0, 1837500, 70, 0, '0000-00-00'),
(98, '2024-09-19', '4000/b01', '12167', 8818200, '0000-00-00', '', '', 0, 26234330, 71, 0, '0000-00-00'),
(99, '2024-09-19', '4000/b01', '12167', 1853100, '0000-00-00', '', '', 0, 28087430, 72, 0, '0000-00-00'),
(100, '2024-09-19', '4000/b01', '12167', 399600, '0000-00-00', '', '', 0, 28487030, 73, 0, '0000-00-00'),
(101, '2024-09-19', '4000/b01', '12167', 1411200, '0000-00-00', '', '', 0, 29898230, 74, 0, '0000-00-00'),
(102, '2024-09-19', '4000/b01', '12167', 961400, '0000-00-00', '', '', 0, 30859630, 75, 0, '0000-00-00'),
(103, '2024-09-19', '4000/b01', '12167', 651300, '0000-00-00', '', '', 0, 31510930, 76, 0, '0000-00-00'),
(104, '2024-09-19', '4000/b01', '12167', 302400, '0000-00-00', '', '', 0, 31813330, 77, 0, '0000-00-00'),
(105, '2024-09-19', '4000/b01', '12167', 2765000, '0000-00-00', '', '', 0, 34578330, 78, 0, '0000-00-00'),
(106, '2024-09-19', '4000/b01', '12167', 8540000, '0000-00-00', '', '', 0, 43118330, 79, 0, '0000-00-00'),
(107, '2024-09-19', '4000/b01', '12167', 65000, '0000-00-00', '', '', 0, 43183330, 80, 0, '0000-00-00'),
(108, '2024-09-19', '4000/t02', '12168', 1186500, '0000-00-00', '', '', 0, 9764300, 81, 0, '0000-00-00'),
(109, '2024-09-19', '4000/t02', '12168', 2097150, '0000-00-00', '', '', 0, 11861450, 82, 0, '0000-00-00'),
(110, '2024-09-19', '4000/t02', '12168', 1884150, '0000-00-00', '', '', 0, 13745600, 83, 0, '0000-00-00'),
(111, '2024-09-19', '4000/t02', '12168', 1405250, '0000-00-00', '', '', 0, 15150850, 84, 0, '0000-00-00'),
(112, '2024-09-19', '4000/t02', '12168', 2752800, '0000-00-00', '', '', 0, 17903650, 85, 0, '0000-00-00'),
(113, '2024-09-19', '4000/t02', '12168', 440550, '0000-00-00', '', '', 0, 18344200, 86, 0, '0000-00-00'),
(114, '2024-09-19', '4000/t02', '12168', 255000, '0000-00-00', '', '', 0, 18599200, 87, 0, '0000-00-00'),
(115, '2024-09-20', '4000/s03', '12169', 1810400, '0000-00-00', '', '', 0, 1810400, 88, 0, '0000-00-00'),
(116, '2024-09-20', '4000/s03', '12169', 16533090, '0000-00-00', '', '', 0, 18343490, 89, 0, '0000-00-00'),
(117, '2024-09-20', '4000/s03', '12169', 13643945, '0000-00-00', '', '', 0, 31987435, 90, 0, '0000-00-00'),
(118, '2024-09-20', '4000/s03', '12169', 5144520, '0000-00-00', '', '', 0, 37131955, 91, 0, '0000-00-00'),
(119, '2024-09-20', '4000/b01', '12170', 520800, '0000-00-00', '', '', 0, 43704130, 92, 0, '0000-00-00'),
(120, '2024-09-20', '4000/b01', '12170', 381800, '0000-00-00', '', '', 0, 44085930, 93, 0, '0000-00-00'),
(121, '2024-09-20', '4000/b01', '12170', 202800, '0000-00-00', '', '', 0, 44288730, 94, 0, '0000-00-00'),
(122, '2024-09-20', '4000/b01', '12170', 93600, '0000-00-00', '', '', 0, 44382330, 95, 0, '0000-00-00'),
(123, '2024-09-20', '4000/b01', '12170', 4620700, '0000-00-00', '', '', 0, 49003030, 96, 0, '0000-00-00'),
(124, '2024-09-20', '4000/b01', '12170', 639450, '0000-00-00', '', '', 0, 49642480, 97, 0, '0000-00-00'),
(125, '2024-09-20', '4000/b01', '12170', 170200, '0000-00-00', '', '', 0, 49812680, 98, 0, '0000-00-00'),
(126, '2024-09-20', '4000/b01', '12170', 6139000, '0000-00-00', '', '', 0, 55951680, 99, 0, '0000-00-00'),
(127, '2024-09-20', '4000/b01', '12170', 1250000, '0000-00-00', '', '', 0, 57201680, 100, 0, '0000-00-00'),
(128, '2024-09-20', '4000/a06', '12171', 641550, '0000-00-00', '', '', 0, 1757850, 101, 0, '0000-00-00'),
(129, '2024-09-20', '4000/a06', '12171', 256500, '0000-00-00', '', '', 0, 2014350, 102, 0, '0000-00-00'),
(130, '2024-09-20', '4000/a06', '12171', 439600, '0000-00-00', '', '', 0, 2453950, 103, 0, '0000-00-00'),
(131, '2024-09-20', '4000/m09', '12172', 6804000, '0000-00-00', '', '', 0, 11320000, 104, 0, '0000-00-00'),
(132, '2024-09-21', '4000/t11', '12173', 10152000, '0000-00-00', '', '', 0, 10152000, 105, 0, '0000-00-00'),
(133, '2024-09-21', '4000/s04', '12174', 49700, '0000-00-00', '', '', 0, 2622900, 106, 0, '0000-00-00'),
(134, '2024-09-21', '4000/k10', '12175', 3906000, '0000-00-00', '', '', 0, 3906000, 107, 0, '0000-00-00'),
(135, '2024-09-21', '4000/k07', '12176', 1334800, '0000-00-00', '', '', 0, 1334800, 108, 0, '0000-00-00'),
(136, '2024-09-21', '4000/k07', '12176', 4862700, '0000-00-00', '', '', 0, 6197500, 109, 0, '0000-00-00'),
(137, '2024-09-21', '4000/b01', '12177', 820400, '0000-00-00', '', '', 0, 58022080, 110, 0, '0000-00-00'),
(138, '2024-09-21', '4000/b01', '12177', 621000, '0000-00-00', '', '', 0, 58643080, 111, 0, '0000-00-00'),
(139, '2024-09-21', '4000/b01', '12177', 507000, '0000-00-00', '', '', 0, 59150080, 112, 0, '0000-00-00'),
(140, '2024-09-21', '4000/b01', '12177', 421200, '0000-00-00', '', '', 0, 59571280, 113, 0, '0000-00-00'),
(141, '2024-09-21', '4000/b01', '12177', 3249900, '0000-00-00', '', '', 0, 62821180, 114, 0, '0000-00-00'),
(142, '2024-09-21', '4000/b01', '12177', 2135850, '0000-00-00', '', '', 0, 64957030, 115, 0, '0000-00-00'),
(143, '2024-09-21', '4000/b01', '12177', 451400, '0000-00-00', '', '', 0, 65408430, 116, 0, '0000-00-00'),
(144, '2024-09-21', '4000/b01', '12177', 323340, '0000-00-00', '', '', 0, 65731770, 117, 0, '0000-00-00'),
(145, '2024-09-21', '4000/b01', '12177', 1111600, '0000-00-00', '', '', 0, 66843370, 118, 0, '0000-00-00'),
(146, '2024-09-21', '4000/b01', '12177', 487500, '0000-00-00', '', '', 0, 67330870, 119, 0, '0000-00-00'),
(147, '2024-09-21', '4000/n04', '12178', 98000, '0000-00-00', '', '', 0, 5197150, 120, 0, '0000-00-00'),
(148, '2024-09-21', '4000/n04', '12178', 216600, '0000-00-00', '', '', 0, 5413750, 121, 0, '0000-00-00'),
(149, '2024-09-21', '4000/n04', '12178', 174000, '0000-00-00', '', '', 0, 5587750, 122, 0, '0000-00-00'),
(150, '2024-09-21', '4000/n04', '12178', 453600, '0000-00-00', '', '', 0, 6041350, 123, 0, '0000-00-00'),
(151, '2024-09-21', '4000/n04', '12178', 881400, '0000-00-00', '', '', 0, 6922750, 124, 0, '0000-00-00'),
(152, '2024-09-21', '4000/n04', '12178', 446400, '0000-00-00', '', '', 0, 7369150, 125, 0, '0000-00-00'),
(153, '2024-09-21', '4000/n04', '12178', 142500, '0000-00-00', '', '', 0, 7511650, 126, 0, '0000-00-00'),
(154, '2024-09-21', '4000/t07', '12179', 4675000, '0000-00-00', '', '', 0, 11254700, 127, 0, '0000-00-00'),
(155, '2024-09-21', '4000/s03', '12180', 27658460, '0000-00-00', '', '', 0, 64790415, 128, 0, '0000-00-00'),
(156, '2024-09-21', '4000/s03', '12180', 129560, '0000-00-00', '', '', 0, 64919975, 129, 0, '0000-00-00'),
(157, '2024-09-22', '4000/t11', '12181', 751100, '0000-00-00', '', '', 0, 10903100, 130, 0, '0000-00-00'),
(158, '2024-09-22', '4000/t11', '12181', 19492800, '0000-00-00', '', '', 0, 30395900, 131, 0, '0000-00-00'),
(159, '2024-09-22', '4000/t11', '12181', 954800, '0000-00-00', '', '', 0, 31350700, 132, 0, '0000-00-00'),
(160, '2024-09-22', '4000/t02', '12182', 1710000, '0000-00-00', '', '', 0, 20309200, 133, 0, '0000-00-00'),
(161, '2024-09-22', '4000/t02', '12182', 761400, '0000-00-00', '', '', 0, 21070600, 134, 0, '0000-00-00'),
(162, '2024-09-22', '4000/t02', '12182', 1019100, '0000-00-00', '', '', 0, 22089700, 135, 0, '0000-00-00'),
(163, '2024-09-22', '4000/t02', '12182', 956300, '0000-00-00', '', '', 0, 23046000, 136, 0, '0000-00-00'),
(164, '2024-09-22', '4000/t02', '12182', 198000, '0000-00-00', '', '', 0, 23244000, 137, 0, '0000-00-00'),
(165, '2024-09-22', '4000/t02', '12182', 3224200, '0000-00-00', '', '', 0, 26468200, 138, 0, '0000-00-00'),
(166, '2024-09-22', '4000/t02', '12182', 751500, '0000-00-00', '', '', 0, 27219700, 139, 0, '0000-00-00'),
(167, '2024-09-22', '4000/t02', '12182', 390000, '0000-00-00', '', '', 0, 27609700, 140, 0, '0000-00-00'),
(168, '2024-09-22', '4000/b01', '12183', 700000, '0000-00-00', '', '', 0, 68030870, 141, 0, '0000-00-00'),
(169, '2024-09-22', '4000/b01', '12183', 423200, '0000-00-00', '', '', 0, 68454070, 142, 0, '0000-00-00'),
(170, '2024-09-22', '4000/b01', '12183', 312000, '0000-00-00', '', '', 0, 68766070, 143, 0, '0000-00-00'),
(171, '2024-09-22', '4000/b01', '12183', 147600, '0000-00-00', '', '', 0, 68913670, 144, 0, '0000-00-00'),
(172, '2024-09-22', '4000/b01', '12183', 2288500, '0000-00-00', '', '', 0, 71202170, 145, 0, '0000-00-00'),
(173, '2024-09-22', '4000/b01', '12183', 200100, '0000-00-00', '', '', 0, 71402270, 146, 0, '0000-00-00'),
(174, '2024-09-22', '4000/b01', '12183', 819000, '0000-00-00', '', '', 0, 72221270, 147, 0, '0000-00-00'),
(175, '2024-09-22', '4000/b01', '12183', 260000, '0000-00-00', '', '', 0, 72481270, 148, 0, '0000-00-00'),
(176, '2024-09-22', '4000/t07', '12184', 2712350, '0000-00-00', '', '', 0, 13967050, 149, 0, '0000-00-00'),
(177, '2024-09-22', '4000/k15', '12185', 2598400, '0000-00-00', '', '', 0, 2598400, 150, 0, '0000-00-00'),
(178, '2024-09-22', '4000/t01', '12186', 3880800, '0000-00-00', '', '', 0, 22629900, 151, 0, '0000-00-00'),
(179, '2024-09-22', '4000/t01', '12186', 12384000, '0000-00-00', '', '', 0, 35013900, 152, 0, '0000-00-00'),
(180, '2024-09-22', '4000/t01', '12186', 12567400, '0000-00-00', '', '', 0, 47581300, 153, 0, '0000-00-00'),
(181, '2024-09-22', '4000/t01', '12186', 474300, '0000-00-00', '', '', 0, 48055600, 154, 0, '0000-00-00'),
(182, '2024-09-22', '4000/t01', '12186', 1657700, '0000-00-00', '', '', 0, 49713300, 155, 0, '0000-00-00'),
(183, '2024-09-22', '4000/s06', '12187', 717650, '0000-00-00', '', '', 0, 717650, 156, 0, '0000-00-00'),
(184, '2024-09-22', '4000/a03', '12188', 7698600, '0000-00-00', '', '', 0, 11547350, 157, 0, '0000-00-00'),
(185, '2024-09-22', '4000/a03', '12188', 1230000, '0000-00-00', '', '', 0, 12777350, 158, 0, '0000-00-00'),
(186, '2024-09-22', '4000/a03', '12188', 495000, '0000-00-00', '', '', 0, 13272350, 159, 0, '0000-00-00'),
(187, '2024-09-23', '4000/b01', '12189', 1338600, '0000-00-00', '', '', 0, 73819870, 160, 0, '0000-00-00'),
(188, '2024-09-23', '4000/b01', '12189', 891750, '0000-00-00', '', '', 0, 74711620, 161, 0, '0000-00-00'),
(189, '2024-09-23', '4000/b01', '12189', 81400, '0000-00-00', '', '', 0, 74793020, 162, 0, '0000-00-00'),
(190, '2024-09-23', '4000/b01', '12189', 610400, '0000-00-00', '', '', 0, 75403420, 163, 0, '0000-00-00'),
(191, '2024-09-23', '4000/b01', '12189', 519800, '0000-00-00', '', '', 0, 75923220, 164, 0, '0000-00-00'),
(192, '2024-09-23', '4000/b01', '12189', 468000, '0000-00-00', '', '', 0, 76391220, 165, 0, '0000-00-00'),
(193, '2024-09-23', '4000/b01', '12189', 6166400, '0000-00-00', '', '', 0, 82557620, 166, 0, '0000-00-00'),
(194, '2024-09-23', '4000/p02', '12190', 9500000, '0000-00-00', '', '', 0, 9500000, 167, 0, '0000-00-00'),
(195, '2024-09-23', '4000/s03', '12191', 1183260, '0000-00-00', '', '', 0, 66103235, 168, 0, '0000-00-00'),
(196, '2024-09-23', '4000/s03', '12191', 10866640, '0000-00-00', '', '', 0, 76969875, 169, 0, '0000-00-00'),
(197, '2024-09-23', '4000/s03', '12191', 23827160, '0000-00-00', '', '', 0, 100797035, 170, 0, '0000-00-00'),
(198, '2024-09-23', '4000/t05', '12192', 2553120, '0000-00-00', '', '', 0, 39766380, 171, 0, '0000-00-00'),
(199, '2024-09-23', '4000/t05', '12192', 3232440, '0000-00-00', '', '', 0, 42998820, 172, 0, '0000-00-00'),
(200, '2024-09-23', '4000/t05', '12192', 2326800, '0000-00-00', '', '', 0, 45325620, 173, 0, '0000-00-00'),
(201, '2024-09-23', '4000/t05', '12192', 6698700, '0000-00-00', '', '', 0, 52024320, 174, 0, '0000-00-00'),
(202, '2024-09-23', '4000/t05', '12192', 8713350, '0000-00-00', '', '', 0, 60737670, 175, 0, '0000-00-00'),
(203, '2024-09-23', '4000/t05', '12192', 33047520, '0000-00-00', '', '', 0, 93785190, 176, 0, '0000-00-00'),
(204, '2024-09-24', '4000/k10', '12193', 815300, '0000-00-00', '', '', 0, 4721300, 177, 0, '0000-00-00'),
(205, '2024-09-24', '4000/t02', '12194', 1721400, '0000-00-00', '', '', 0, 29331100, 178, 0, '0000-00-00'),
(206, '2024-09-24', '4000/t02', '12194', 1015200, '0000-00-00', '', '', 0, 30346300, 179, 0, '0000-00-00'),
(207, '2024-09-24', '4000/t02', '12194', 284400, '0000-00-00', '', '', 0, 30630700, 180, 0, '0000-00-00'),
(208, '2024-09-24', '4000/t02', '12194', 832200, '0000-00-00', '', '', 0, 31462900, 181, 0, '0000-00-00'),
(209, '2024-09-24', '4000/t02', '12194', 193600, '0000-00-00', '', '', 0, 31656500, 182, 0, '0000-00-00'),
(210, '2024-09-24', '4000/t02', '12194', 3553200, '0000-00-00', '', '', 0, 35209700, 183, 0, '0000-00-00'),
(211, '2024-09-24', '4000/t02', '12194', 553500, '0000-00-00', '', '', 0, 35763200, 184, 0, '0000-00-00'),
(212, '2024-09-24', '4000/t02', '12194', 641250, '0000-00-00', '', '', 0, 36404450, 185, 0, '0000-00-00'),
(213, '2024-09-24', '4000/b01', '12195', 4478100, '0000-00-00', '', '', 0, 87035720, 186, 0, '0000-00-00'),
(214, '2024-09-24', '4000/b01', '12195', 1457250, '0000-00-00', '', '', 0, 88492970, 187, 0, '0000-00-00'),
(215, '2024-09-24', '4000/b01', '12195', 416250, '0000-00-00', '', '', 0, 88909220, 188, 0, '0000-00-00'),
(216, '2024-09-24', '4000/b01', '12195', 1041600, '0000-00-00', '', '', 0, 89950820, 189, 0, '0000-00-00'),
(217, '2024-09-24', '4000/b01', '12195', 257600, '0000-00-00', '', '', 0, 90208420, 190, 0, '0000-00-00'),
(218, '2024-09-24', '4000/b01', '12195', 514800, '0000-00-00', '', '', 0, 90723220, 191, 0, '0000-00-00'),
(219, '2024-09-24', '4000/b01', '12195', 302400, '0000-00-00', '', '', 0, 91025620, 192, 0, '0000-00-00'),
(220, '2024-09-24', '4000/b01', '12195', 5711550, '0000-00-00', '', '', 0, 96737170, 193, 0, '0000-00-00'),
(221, '2024-09-24', '4000/b01', '12195', 928200, '0000-00-00', '', '', 0, 97665370, 194, 0, '0000-00-00'),
(222, '2024-09-24', '4000/a03', '12196', 10982500, '0000-00-00', '', '', 0, 24254850, 195, 0, '0000-00-00'),
(223, '2024-09-24', '4000/a03', '12196', 2640000, '0000-00-00', '', '', 0, 26894850, 196, 0, '0000-00-00'),
(224, '2024-09-24', '4000/a03', '12197', 4950000, '0000-00-00', '', '', 0, 31844850, 197, 0, '0000-00-00'),
(225, '2024-09-24', '4000/a03', '12197', 2473500, '0000-00-00', '', '', 0, 34318350, 198, 0, '0000-00-00'),
(226, '2024-09-24', '4000/y01', '12198', 837500, '0000-00-00', '', '', 0, 837500, 199, 0, '0000-00-00'),
(227, '2024-09-24', '4000/t03', '12199', 3509200, '0000-00-00', '', '', 0, 3509200, 200, 0, '0000-00-00'),
(228, '2024-09-24', '4000/s01', '12200', 8294400, '0000-00-00', '', '', 0, 8294400, 201, 0, '0000-00-00'),
(229, '2024-09-24', '4000/s01', '12200', 5989200, '0000-00-00', '', '', 0, 14283600, 202, 0, '0000-00-00'),
(230, '2024-09-24', '4000/a14', '12201', 12220000, '0000-00-00', '', '', 0, 12220000, 203, 0, '0000-00-00'),
(231, '2024-09-25', '4000/a03', '12202', 7622500, '0000-00-00', '', '', 0, 41940850, 204, 0, '0000-00-00'),
(232, '2024-09-25', '4000/a03', '12202', 3760500, '0000-00-00', '', '', 0, 45701350, 205, 0, '0000-00-00'),
(233, '2024-09-25', '4000/h01', '12203', 710000, '0000-00-00', '', '', 0, 710000, 206, 0, '0000-00-00'),
(234, '2024-09-25', '4000/h01', '12203', 858600, '0000-00-00', '', '', 0, 1568600, 207, 0, '0000-00-00'),
(235, '2024-09-25', '4000/b01', '12204', 2171200, '0000-00-00', '', '', 0, 99836570, 208, 0, '0000-00-00'),
(236, '2024-09-25', '4000/b01', '12204', 552450, '0000-00-00', '', '', 0, 100389020, 209, 0, '0000-00-00'),
(237, '2024-09-25', '4000/b01', '12204', 122100, '0000-00-00', '', '', 0, 100511120, 210, 0, '0000-00-00'),
(238, '2024-09-25', '4000/b01', '12204', 1540000, '0000-00-00', '', '', 0, 102051120, 211, 0, '0000-00-00'),
(239, '2024-09-25', '4000/b01', '12204', 588800, '0000-00-00', '', '', 0, 102639920, 212, 0, '0000-00-00'),
(240, '2024-09-25', '4000/b01', '12204', 596700, '0000-00-00', '', '', 0, 103236620, 213, 0, '0000-00-00'),
(241, '2024-09-25', '4000/b01', '12204', 180000, '0000-00-00', '', '', 0, 103416620, 214, 0, '0000-00-00'),
(242, '2024-09-25', '4000/b01', '12204', 971500, '0000-00-00', '', '', 0, 104388120, 215, 0, '0000-00-00'),
(243, '2024-09-25', '4000/b01', '12204', 312000, '0000-00-00', '', '', 0, 104700120, 216, 0, '0000-00-00'),
(244, '2024-09-25', '4000/a01', '12205', 247050, '0000-00-00', '', '', 0, 2084550, 217, 0, '0000-00-00'),
(245, '2024-09-25', '4000/a01', '12205', 947500, '0000-00-00', '', '', 0, 3032050, 218, 0, '0000-00-00'),
(246, '2024-09-25', '4000/a01', '12205', 4826900, '0000-00-00', '', '', 0, 7858950, 219, 0, '0000-00-00'),
(247, '2024-09-25', '4000/a01', '12205', 3844000, '0000-00-00', '', '', 0, 11702950, 220, 0, '0000-00-00'),
(248, '2024-09-25', '4000/s01', '12206', 6120000, '0000-00-00', '', '', 0, 20403600, 221, 0, '0000-00-00'),
(249, '2024-09-25', '4000/s01', '12206', 2883000, '0000-00-00', '', '', 0, 23286600, 222, 0, '0000-00-00'),
(250, '2024-09-26', '4000/a14', '12207', 4391400, '0000-00-00', '', '', 0, 16611400, 223, 0, '0000-00-00'),
(251, '2024-09-26', '4000/a02', '12208', 2010000, '0000-00-00', '', '', 0, 2010000, 224, 0, '0000-00-00'),
(252, '2024-09-26', '4000/a02', '12208', 68600, '0000-00-00', '', '', 0, 2078600, 225, 0, '0000-00-00'),
(253, '2024-09-26', '4000/s04', '12209', 386400, '0000-00-00', '', '', 0, 3009300, 226, 0, '0000-00-00'),
(254, '2024-09-26', '4000/t02', '12210', 1470600, '0000-00-00', '', '', 0, 37875050, 227, 0, '0000-00-00'),
(255, '2024-09-26', '4000/t02', '12210', 639200, '0000-00-00', '', '', 0, 38514250, 228, 0, '0000-00-00'),
(256, '2024-09-26', '4000/t02', '12210', 529300, '0000-00-00', '', '', 0, 39043550, 229, 0, '0000-00-00'),
(257, '2024-09-26', '4000/t02', '12210', 2232500, '0000-00-00', '', '', 0, 41276050, 230, 0, '0000-00-00'),
(258, '2024-09-26', '4000/t02', '12210', 450000, '0000-00-00', '', '', 0, 41726050, 231, 0, '0000-00-00'),
(259, '2024-09-26', '4000/t02', '12210', 517500, '0000-00-00', '', '', 0, 42243550, 232, 0, '0000-00-00'),
(260, '2024-09-26', '4000/n04', '12211', 1719900, '0000-00-00', '', '', 0, 9231550, 233, 0, '0000-00-00'),
(261, '2024-09-26', '4000/n04', '12211', 687600, '0000-00-00', '', '', 0, 9919150, 234, 0, '0000-00-00'),
(262, '2024-09-26', '4000/n04', '12211', 105000, '0000-00-00', '', '', 0, 10024150, 235, 0, '0000-00-00'),
(263, '2024-09-26', '4000/n04', '12211', 460600, '0000-00-00', '', '', 0, 10484750, 236, 0, '0000-00-00'),
(264, '2024-09-26', '4000/n04', '12211', 102600, '0000-00-00', '', '', 0, 10587350, 237, 0, '0000-00-00'),
(265, '2024-09-26', '4000/n04', '12211', 52200, '0000-00-00', '', '', 0, 10639550, 238, 0, '0000-00-00'),
(266, '2024-09-26', '4000/n04', '12211', 274400, '0000-00-00', '', '', 0, 10913950, 239, 0, '0000-00-00'),
(267, '2024-09-26', '4000/s01', '12212', 6312000, '0000-00-00', '', '', 0, 29598600, 240, 0, '0000-00-00'),
(268, '2024-09-26', '4000/s01', '12212', 1165600, '0000-00-00', '', '', 0, 30764200, 241, 0, '0000-00-00'),
(269, '2024-09-26', '4000/s01', '12212', 756000, '0000-00-00', '', '', 0, 31520200, 242, 0, '0000-00-00'),
(270, '2024-09-26', '4000/b01', '12213', 1844600, '0000-00-00', '', '', 0, 106544720, 243, 0, '0000-00-00'),
(271, '2024-09-26', '4000/b01', '12213', 891750, '0000-00-00', '', '', 0, 107436470, 244, 0, '0000-00-00'),
(272, '2024-09-26', '4000/b01', '12213', 173900, '0000-00-00', '', '', 0, 107610370, 245, 0, '0000-00-00'),
(273, '2024-09-26', '4000/b01', '12213', 1276800, '0000-00-00', '', '', 0, 108887170, 246, 0, '0000-00-00'),
(274, '2024-09-26', '4000/b01', '12213', 754400, '0000-00-00', '', '', 0, 109641570, 247, 0, '0000-00-00'),
(275, '2024-09-26', '4000/b01', '12213', 848250, '0000-00-00', '', '', 0, 110489820, 248, 0, '0000-00-00'),
(276, '2024-09-26', '4000/b01', '12213', 421200, '0000-00-00', '', '', 0, 110911020, 249, 0, '0000-00-00'),
(277, '2024-09-26', '4000/b01', '12213', 1220900, '0000-00-00', '', '', 0, 112131920, 250, 0, '0000-00-00'),
(278, '2024-09-26', '4000/b01', '12213', 182000, '0000-00-00', '', '', 0, 112313920, 251, 0, '0000-00-00'),
(279, '2024-09-26', '4000/k07', '12214', 1677900, '0000-00-00', '', '', 0, 7875400, 252, 0, '0000-00-00'),
(280, '2024-09-26', '4000/k07', '12214', 6605550, '0000-00-00', '', '', 0, 14480950, 253, 0, '0000-00-00'),
(281, '2024-09-25', '4000/k07', '12215', 2820000, '0000-00-00', '', '', 0, 17300950, 254, 0, '0000-00-00'),
(282, '2024-09-25', '4000/k07', '12215', 2605500, '0000-00-00', '', '', 0, 19906450, 255, 0, '0000-00-00'),
(283, '2024-09-27', '4000/a03', '12216', 7005000, '0000-00-00', '', '', 0, 52706350, 256, 0, '0000-00-00'),
(284, '2024-09-27', '4000/a03', '12216', 1603500, '0000-00-00', '', '', 0, 54309850, 257, 0, '0000-00-00'),
(285, '2024-09-27', '4000/t07', '12217', 3757250, '0000-00-00', '', '', 0, 17724300, 258, 0, '0000-00-00'),
(286, '2024-09-27', '4000/b01', '12218', 6129500, '0000-00-00', '', '', 0, 118443420, 259, 0, '0000-00-00'),
(287, '2024-09-27', '4000/b01', '12218', 1326750, '0000-00-00', '', '', 0, 119770170, 260, 0, '0000-00-00'),
(288, '2024-09-27', '4000/b01', '12218', 259000, '0000-00-00', '', '', 0, 120029170, 261, 0, '0000-00-00'),
(289, '2024-09-27', '4000/b01', '12218', 1075200, '0000-00-00', '', '', 0, 121104370, 262, 0, '0000-00-00'),
(290, '2024-09-27', '4000/b01', '12218', 933800, '0000-00-00', '', '', 0, 122038170, 263, 0, '0000-00-00'),
(291, '2024-09-27', '4000/b01', '12218', 780000, '0000-00-00', '', '', 0, 122818170, 264, 0, '0000-00-00'),
(292, '2024-09-27', '4000/b01', '12218', 460800, '0000-00-00', '', '', 0, 123278970, 265, 0, '0000-00-00'),
(293, '2024-09-27', '4000/k11', '12219', 6334200, '0000-00-00', '', '', 0, 6334200, 266, 0, '0000-00-00'),
(294, '2024-09-27', '4000/k11', '12219', 1348900, '0000-00-00', '', '', 0, 7683100, 267, 0, '0000-00-00'),
(295, '2024-09-27', '4000/t11', '12220', 10372800, '0000-00-00', '', '', 0, 41723500, 268, 0, '0000-00-00'),
(296, '2024-09-27', '4000/t11', '12220', 1529850, '0000-00-00', '', '', 0, 43253350, 269, 0, '0000-00-00'),
(297, '2024-09-27', '4000/t11', '12220', 3087600, '0000-00-00', '', '', 0, 46340950, 270, 0, '0000-00-00'),
(298, '2024-09-27', '4000/z03', '12221', 4196350, '0000-00-00', '', '', 0, 13680975, 271, 0, '0000-00-00'),
(299, '2024-09-27', '4000/z03', '12221', 1700000, '0000-00-00', '', '', 0, 15380975, 272, 0, '0000-00-00'),
(300, '2024-09-27', '4000/z03', '12221', 543000, '0000-00-00', '', '', 0, 15923975, 273, 0, '0000-00-00'),
(301, '2024-09-27', '4000/z03', '12221', 195000, '0000-00-00', '', '', 0, 16118975, 274, 0, '0000-00-00'),
(302, '2024-09-27', '4000/z03', '12221', 3465000, '0000-00-00', '', '', 0, 19583975, 275, 0, '0000-00-00'),
(303, '2024-09-27', '4000/z03', '12221', 1226250, '0000-00-00', '', '', 0, 20810225, 276, 0, '0000-00-00'),
(304, '2024-09-27', '4000/z03', '12221', 776000, '0000-00-00', '', '', 0, 21586225, 277, 0, '0000-00-00'),
(305, '2024-09-27', '4000/z03', '12221', 162000, '0000-00-00', '', '', 0, 21748225, 278, 0, '0000-00-00'),
(306, '2024-09-28', '4000/a03', '12222', 961500, '0000-00-00', '', '', 0, 55271350, 279, 0, '0000-00-00'),
(307, '2024-09-28', '4000/a03', '12222', 4305000, '0000-00-00', '', '', 0, 59576350, 280, 0, '0000-00-00'),
(308, '2024-09-28', '4000/k07', '12223', 61100, '0000-00-00', '', '', 0, 19967550, 281, 0, '0000-00-00'),
(309, '2024-09-28', '4000/k07', '12223', 418500, '0000-00-00', '', '', 0, 20386050, 282, 0, '0000-00-00'),
(310, '2024-09-28', '4000/n04', '12224', 1314400, '0000-00-00', '', '', 0, 12228350, 283, 0, '0000-00-00'),
(311, '2024-09-28', '4000/n04', '12224', 600600, '0000-00-00', '', '', 0, 12828950, 284, 0, '0000-00-00'),
(312, '2024-09-28', '4000/n04', '12224', 198000, '0000-00-00', '', '', 0, 13026950, 285, 0, '0000-00-00'),
(313, '2024-09-28', '4000/n04', '12224', 180000, '0000-00-00', '', '', 0, 13206950, 286, 0, '0000-00-00'),
(314, '2024-09-28', '4000/n04', '12224', 1513600, '0000-00-00', '', '', 0, 14720550, 287, 0, '0000-00-00'),
(315, '2024-09-28', '4000/n04', '12224', 787200, '0000-00-00', '', '', 0, 15507750, 288, 0, '0000-00-00'),
(316, '2024-09-28', '4000/n04', '12224', 60000, '0000-00-00', '', '', 0, 15567750, 289, 0, '0000-00-00'),
(317, '2024-09-28', '4000/b01', '12225', 2530800, '0000-00-00', '', '', 0, 125809770, 290, 0, '0000-00-00'),
(318, '2024-09-28', '4000/b01', '12225', 1034000, '0000-00-00', '', '', 0, 126843770, 291, 0, '0000-00-00'),
(319, '2024-09-28', '4000/b01', '12225', 1356000, '0000-00-00', '', '', 0, 128199770, 292, 0, '0000-00-00'),
(320, '2024-09-28', '4000/b01', '12225', 466200, '0000-00-00', '', '', 0, 128665970, 293, 0, '0000-00-00'),
(321, '2024-09-28', '4000/b01', '12225', 4044350, '0000-00-00', '', '', 0, 132710320, 294, 0, '0000-00-00'),
(322, '2024-09-28', '4000/b01', '12225', 894450, '0000-00-00', '', '', 0, 133604770, 295, 0, '0000-00-00'),
(324, '2024-09-28', '4000/b01', '12225', 471200, '0000-00-00', '', '', 0, 134075970, 297, 0, '0000-00-00'),
(325, '2024-09-28', '4000/b01', '12225', 4039700, '0000-00-00', '', '', 0, 138115670, 298, 0, '0000-00-00'),
(326, '2024-09-28', '4000/b01', '12225', 514800, '0000-00-00', '', '', 0, 138630470, 299, 0, '0000-00-00'),
(327, '2024-09-28', '4000/h01', '12226', 939600, '0000-00-00', '', '', 0, 2508200, 300, 0, '0000-00-00'),
(328, '2024-09-28', '4000/h01', '12226', 2202500, '0000-00-00', '', '', 0, 4710700, 301, 0, '0000-00-00'),
(329, '2024-09-28', '4000/s04', '12227', 1243200, '0000-00-00', '', '', 0, 4252500, 302, 0, '0000-00-00'),
(330, '2024-09-28', '4000/t07', '12228', 3934875, '0000-00-00', '', '', 0, 21659175, 303, 0, '0000-00-00'),
(331, '2024-09-28', '4000/t02', '12229', 1094400, '0000-00-00', '', '', 0, 43337950, 304, 0, '0000-00-00'),
(332, '2024-09-28', '4000/t02', '12229', 987000, '0000-00-00', '', '', 0, 44324950, 305, 0, '0000-00-00'),
(333, '2024-09-28', '4000/t02', '12229', 410800, '0000-00-00', '', '', 0, 44735750, 306, 0, '0000-00-00'),
(334, '2024-09-28', '4000/t02', '12229', 825100, '0000-00-00', '', '', 0, 45560850, 307, 0, '0000-00-00'),
(335, '2024-09-28', '4000/t02', '12229', 2335900, '0000-00-00', '', '', 0, 47896750, 308, 0, '0000-00-00'),
(336, '2024-09-28', '4000/t02', '12229', 598500, '0000-00-00', '', '', 0, 48495250, 309, 0, '0000-00-00'),
(337, '2024-09-28', '4000/t02', '12229', 303750, '0000-00-00', '', '', 0, 48799000, 310, 0, '0000-00-00'),
(338, '2024-09-29', '4000/a14', '12230', 12472200, '0000-00-00', '', '', 0, 29083600, 311, 0, '0000-00-00'),
(339, '2024-09-29', '4000/t07', '12231', 6734875, '0000-00-00', '', '', 0, 28394050, 312, 0, '0000-00-00'),
(340, '2024-09-29', '4000/t07', '12231', 3388000, '0000-00-00', '', '', 0, 31782050, 313, 0, '0000-00-00'),
(341, '2024-09-29', '4000/k15', '12232', 3072300, '0000-00-00', '', '', 0, 5670700, 314, 0, '0000-00-00'),
(342, '2024-09-29', '4000/b01', '12233', 1447800, '0000-00-00', '', '', 0, 140078270, 315, 0, '0000-00-00'),
(343, '2024-09-29', '4000/b01', '12233', 1259600, '0000-00-00', '', '', 0, 141337870, 316, 0, '0000-00-00'),
(344, '2024-09-29', '4000/b01', '12233', 1120000, '0000-00-00', '', '', 0, 142457870, 317, 0, '0000-00-00'),
(345, '2024-09-29', '4000/b01', '12233', 266400, '0000-00-00', '', '', 0, 142724270, 318, 0, '0000-00-00'),
(346, '2024-09-29', '4000/b01', '12233', 5466100, '0000-00-00', '', '', 0, 148190370, 319, 0, '0000-00-00'),
(347, '2024-09-29', '4000/b01', '12233', 703100, '0000-00-00', '', '', 0, 148893470, 320, 0, '0000-00-00'),
(348, '2024-09-29', '4000/b01', '12233', 467400, '0000-00-00', '', '', 0, 149360870, 321, 0, '0000-00-00'),
(349, '2024-09-29', '4000/b01', '12233', 4202100, '0000-00-00', '', '', 0, 153562970, 322, 0, '0000-00-00'),
(350, '2024-09-29', '4000/b01', '12233', 384800, '0000-00-00', '', '', 0, 153947770, 323, 0, '0000-00-00'),
(351, '2024-09-29', '4000/t11', '12234', 13689600, '0000-00-00', '', '', 0, 60030550, 324, 0, '0000-00-00'),
(352, '2024-09-29', '4000/t11', '12234', 618450, '0000-00-00', '', '', 0, 60649000, 325, 0, '0000-00-00'),
(353, '2024-09-29', '4000/t11', '12234', 3038000, '0000-00-00', '', '', 0, 63687000, 326, 0, '0000-00-00'),
(354, '2024-09-30', '4000/k15', '12235', 1864500, '0000-00-00', '', '', 0, 7535200, 327, 0, '0000-00-00'),
(355, '2024-09-30', '4000/k15', '12235', 644800, '0000-00-00', '', '', 0, 8180000, 328, 0, '0000-00-00'),
(356, '2024-09-30', '4000/n04', '12236', 2304800, '0000-00-00', '', '', 0, 17872550, 329, 0, '0000-00-00'),
(357, '2024-09-30', '4000/n04', '12236', 975800, '0000-00-00', '', '', 0, 18848350, 330, 0, '0000-00-00'),
(358, '2024-09-30', '4000/n04', '12236', 210000, '0000-00-00', '', '', 0, 19058350, 331, 0, '0000-00-00'),
(359, '2024-09-30', '4000/n04', '12236', 1022900, '0000-00-00', '', '', 0, 20081250, 332, 0, '0000-00-00'),
(360, '2024-09-30', '4000/n04', '12236', 449400, '0000-00-00', '', '', 0, 20530650, 333, 0, '0000-00-00'),
(361, '2024-09-30', '4000/n04', '12236', 128700, '0000-00-00', '', '', 0, 20659350, 334, 0, '0000-00-00'),
(362, '2024-09-30', '4000/n04', '12236', 507000, '0000-00-00', '', '', 0, 21166350, 335, 0, '0000-00-00'),
(363, '2024-09-30', '4000/b01', '12237', 4560950, '0000-00-00', '', '', 0, 158508720, 336, 0, '0000-00-00'),
(364, '2024-09-30', '4000/b01', '12237', 1447800, '0000-00-00', '', '', 0, 159956520, 337, 0, '0000-00-00'),
(365, '2024-09-30', '4000/b01', '12237', 916500, '0000-00-00', '', '', 0, 160873020, 338, 0, '0000-00-00'),
(366, '2024-09-30', '4000/b01', '12237', 852000, '0000-00-00', '', '', 0, 161725020, 339, 0, '0000-00-00'),
(367, '2024-09-30', '4000/b01', '12237', 148000, '0000-00-00', '', '', 0, 161873020, 340, 0, '0000-00-00'),
(368, '2024-09-30', '4000/b01', '12237', 4855100, '0000-00-00', '', '', 0, 166728120, 341, 0, '0000-00-00'),
(369, '2024-09-30', '4000/b01', '12237', 1468500, '0000-00-00', '', '', 0, 168196620, 342, 0, '0000-00-00'),
(370, '2024-09-30', '4000/b01', '12237', 771400, '0000-00-00', '', '', 0, 168968020, 343, 0, '0000-00-00'),
(371, '2024-09-30', '4000/b01', '12237', 1847300, '0000-00-00', '', '', 0, 170815320, 344, 0, '0000-00-00'),
(372, '2024-09-30', '4000/b01', '12237', 803400, '0000-00-00', '', '', 0, 171618720, 345, 0, '0000-00-00'),
(373, '2024-09-30', '4000/t02', '12238', 1607400, '0000-00-00', '', '', 0, 50406400, 346, 0, '0000-00-00'),
(374, '2024-09-30', '4000/t02', '12238', 2326500, '0000-00-00', '', '', 0, 52732900, 347, 0, '0000-00-00'),
(375, '2024-09-30', '4000/t02', '12238', 1631350, '0000-00-00', '', '', 0, 54364250, 348, 0, '0000-00-00'),
(376, '2024-09-30', '4000/t02', '12238', 1916600, '0000-00-00', '', '', 0, 56280850, 349, 0, '0000-00-00'),
(377, '2024-09-30', '4000/t02', '12238', 550000, '0000-00-00', '', '', 0, 56830850, 350, 0, '0000-00-00'),
(378, '2024-09-30', '4000/t02', '12238', 2368800, '0000-00-00', '', '', 0, 59199650, 351, 0, '0000-00-00'),
(379, '2024-09-30', '4000/t02', '12238', 823500, '0000-00-00', '', '', 0, 60023150, 352, 0, '0000-00-00'),
(380, '2024-09-30', '4000/t02', '12238', 862500, '0000-00-00', '', '', 0, 60885650, 353, 0, '0000-00-00'),
(381, '2024-09-30', '4000/t05', '12239', 163590, '0000-00-00', '', '', 0, 93948780, 354, 0, '0000-00-00'),
(382, '2024-09-30', '4000/t05', '12239', 9572420, '0000-00-00', '', '', 0, 103521200, 355, 0, '0000-00-00'),
(383, '2024-09-30', '4000/t05', '12239', 7776730, '0000-00-00', '', '', 0, 111297930, 356, 0, '0000-00-00'),
(384, '2024-09-30', '4000/t05', '12239', 5053040, '0000-00-00', '', '', 0, 116350970, 357, 0, '0000-00-00'),
(385, '2024-09-30', '4000/t05', '12239', 922500, '0000-00-00', '', '', 0, 117273470, 358, 0, '0000-00-00'),
(386, '2024-09-30', '4000/t05', '12239', 17195500, '0000-00-00', '', '', 0, 134468970, 359, 0, '0000-00-00'),
(387, '2024-09-30', '4000/t05', '12239', 8523680, '0000-00-00', '', '', 0, 142992650, 360, 0, '0000-00-00'),
(388, '2024-09-30', '4000/t15', '00157', 8292250, '0000-00-00', '', '', 0, 8292250, 361, 0, '0000-00-00'),
(389, '2024-09-30', '4000/t15', '00157', 17714050, '0000-00-00', '', '', 0, 26006300, 362, 0, '0000-00-00'),
(390, '2024-09-30', '4000/t15', '00157', 859125, '0000-00-00', '', '', 0, 26865425, 363, 0, '0000-00-00'),
(391, '2024-09-30', '4000/t15', '00158', 7521450, '0000-00-00', '', '', 0, 34386875, 364, 0, '0000-00-00'),
(392, '2024-09-30', '4000/t15', '00158', 4220825, '0000-00-00', '', '', 0, 38607700, 365, 0, '0000-00-00'),
(393, '2024-09-30', '4000/t07', '12240', 1391500, '0000-00-00', '', '', 0, 33173550, 366, 0, '0000-00-00'),
(394, '2024-10-01', '4000/t07', '12241', 1028500, '0000-00-00', '', '', 0, 34202050, 367, 0, '0000-00-00'),
(395, '2024-10-01', '4000/t07', '12241', 1895250, '0000-00-00', '', '', 0, 36097300, 368, 0, '0000-00-00'),
(396, '2024-10-01', '4000/a03', '12242', 672000, '0000-00-00', '', '', 0, 60248350, 369, 0, '0000-00-00'),
(397, '2024-10-01', '4000/a03', '12242', 1002500, '0000-00-00', '', '', 0, 61250850, 370, 0, '0000-00-00'),
(398, '2024-10-01', '4000/s01', '12243', 3504000, '0000-00-00', '', '', 0, 35024200, 371, 0, '0000-00-00'),
(399, '2024-10-01', '4000/b01', '12244', 1675800, '0000-00-00', '', '', 0, 173294520, 372, 0, '0000-00-00'),
(400, '2024-10-01', '4000/b01', '12244', 1410000, '0000-00-00', '', '', 0, 174704520, 373, 0, '0000-00-00'),
(401, '2024-10-01', '4000/b01', '12244', 936000, '0000-00-00', '', '', 0, 175640520, 374, 0, '0000-00-00'),
(402, '2024-10-01', '4000/b01', '12244', 185000, '0000-00-00', '', '', 0, 175825520, 375, 0, '0000-00-00'),
(403, '2024-10-01', '4000/b01', '12244', 4883300, '0000-00-00', '', '', 0, 180708820, 376, 0, '0000-00-00'),
(404, '2024-10-01', '4000/b01', '12244', 2278400, '0000-00-00', '', '', 0, 182987220, 377, 0, '0000-00-00'),
(405, '2024-10-01', '4000/b01', '12244', 380000, '0000-00-00', '', '', 0, 183367220, 378, 0, '0000-00-00'),
(406, '2024-10-01', '4000/b01', '12244', 2299700, '0000-00-00', '', '', 0, 185666920, 379, 0, '0000-00-00'),
(407, '2024-10-01', '4000/b01', '12244', 1068600, '0000-00-00', '', '', 0, 186735520, 380, 0, '0000-00-00'),
(408, '2024-10-01', '4000/k03', '12245', 3316600, '0000-00-00', '', '', 0, 3316600, 381, 0, '0000-00-00'),
(409, '2024-10-01', '4000/b01', '159', 4645815, '0000-00-00', '', '', 0, 191381335, 382, 0, '0000-00-00'),
(410, '2024-10-02', '4000/t05', '12246', 625600, '0000-00-00', '', '', 0, 143618250, 383, 0, '0000-00-00'),
(411, '2024-10-02', '4000/t05', '12246', 9004160, '0000-00-00', '', '', 0, 152622410, 384, 0, '0000-00-00'),
(412, '2024-10-02', '4000/t05', '12246', 71500, '0000-00-00', '', '', 0, 152693910, 385, 0, '0000-00-00'),
(413, '2024-10-02', '4000/t05', '12246', 4603120, '0000-00-00', '', '', 0, 157297030, 386, 0, '0000-00-00'),
(414, '2024-10-02', '4000/t05', '12246', 2013580, '0000-00-00', '', '', 0, 159310610, 387, 0, '0000-00-00'),
(415, '2024-10-02', '4000/s04', '12247', 4257600, '0000-00-00', '', '', 0, 8510100, 388, 0, '0000-00-00'),
(416, '2024-10-02', '4000/s04', '12247', 2194800, '0000-00-00', '', '', 0, 10704900, 389, 0, '0000-00-00'),
(417, '2024-10-02', '4000/t01', '12248', 3667200, '0000-00-00', '', '', 0, 53380500, 390, 0, '0000-00-00'),
(418, '2024-10-02', '4000/t01', '12248', 9253500, '0000-00-00', '', '', 0, 62634000, 391, 0, '0000-00-00'),
(419, '2024-10-02', '4000/a03', '12249', 467500, '0000-00-00', '', '', 0, 61718350, 392, 0, '0000-00-00'),
(420, '2024-10-02', '4000/a03', '12249', 199500, '0000-00-00', '', '', 0, 61917850, 393, 0, '0000-00-00'),
(421, '2024-10-02', '4000/t07', '12250', 1303750, '0000-00-00', '', '', 0, 37401050, 394, 0, '0000-00-00'),
(422, '2024-10-02', '4000/z03', '12251', 5395625, '0000-00-00', '', '', 0, 27143850, 395, 0, '0000-00-00'),
(423, '2024-10-02', '4000/z03', '12251', 2316250, '0000-00-00', '', '', 0, 29460100, 396, 0, '0000-00-00'),
(424, '2024-10-02', '4000/z03', '12251', 1095000, '0000-00-00', '', '', 0, 30555100, 397, 0, '0000-00-00'),
(425, '2024-10-02', '4000/z03', '12251', 217500, '0000-00-00', '', '', 0, 30772600, 398, 0, '0000-00-00'),
(426, '2024-10-02', '4000/z03', '12251', 1086250, '0000-00-00', '', '', 0, 31858850, 399, 0, '0000-00-00'),
(427, '2024-10-02', '4000/z03', '12251', 2160000, '0000-00-00', '', '', 0, 34018850, 400, 0, '0000-00-00'),
(428, '2024-10-02', '4000/z03', '12251', 1736000, '0000-00-00', '', '', 0, 35754850, 401, 0, '0000-00-00'),
(429, '2024-10-02', '4000/z03', '12251', 225000, '0000-00-00', '', '', 0, 35979850, 402, 0, '0000-00-00'),
(430, '2024-10-02', '4000/t11', '12252', 8097600, '0000-00-00', '', '', 0, 71784600, 403, 0, '0000-00-00'),
(431, '2024-10-02', '4000/b01', '12253', 1301900, '0000-00-00', '', '', 0, 192683235, 404, 0, '0000-00-00'),
(432, '2024-10-02', '4000/b01', '12253', 133500, '0000-00-00', '', '', 0, 192816735, 405, 0, '0000-00-00'),
(433, '2024-10-02', '4000/b01', '12253', 330600, '0000-00-00', '', '', 0, 193147335, 406, 0, '0000-00-00'),
(434, '2024-10-02', '4000/b01', '12253', 1060200, '0000-00-00', '', '', 0, 194207535, 407, 0, '0000-00-00'),
(435, '2024-10-02', '4000/b01', '12253', 601600, '0000-00-00', '', '', 0, 194809135, 408, 0, '0000-00-00'),
(436, '2024-10-02', '4000/b01', '12253', 470000, '0000-00-00', '', '', 0, 195279135, 409, 0, '0000-00-00'),
(437, '2024-10-02', '4000/b01', '12253', 177600, '0000-00-00', '', '', 0, 195456735, 410, 0, '0000-00-00'),
(438, '2024-10-02', '4000/b01', '12253', 2892750, '0000-00-00', '', '', 0, 198349485, 411, 0, '0000-00-00'),
(439, '2024-10-02', '4000/b01', '12253', 124800, '0000-00-00', '', '', 0, 198474285, 412, 0, '0000-00-00'),
(440, '2024-10-02', '4000/a01', '12254', 1066500, '0000-00-00', '', '', 0, 12769450, 413, 0, '0000-00-00'),
(441, '2024-10-02', '4000/a01', '12254', 64500, '0000-00-00', '', '', 0, 12833950, 414, 0, '0000-00-00'),
(442, '2024-10-02', '4000/n04', '12255', 1728600, '0000-00-00', '', '', 0, 22894950, 415, 0, '0000-00-00'),
(443, '2024-10-02', '4000/n04', '12255', 615000, '0000-00-00', '', '', 0, 23509950, 416, 0, '0000-00-00'),
(444, '2024-10-02', '4000/n04', '12255', 805600, '0000-00-00', '', '', 0, 24315550, 417, 0, '0000-00-00'),
(445, '2024-10-02', '4000/n04', '12255', 382200, '0000-00-00', '', '', 0, 24697750, 418, 0, '0000-00-00'),
(446, '2024-10-02', '4000/n04', '12255', 132000, '0000-00-00', '', '', 0, 24829750, 419, 0, '0000-00-00'),
(447, '2024-10-02', '4000/n04', '12255', 462000, '0000-00-00', '', '', 0, 25291750, 420, 0, '0000-00-00'),
(448, '2024-10-02', '4000/w03', '12256', 1309480, '0000-00-00', '', '', 0, 1309480, 421, 0, '0000-00-00'),
(449, '2024-10-03', '4000/t05', '12257', 9721320, '0000-00-00', '', '', 0, 169031930, 422, 0, '0000-00-00'),
(450, '2024-10-03', '4000/t05', '12257', 4262880, '0000-00-00', '', '', 0, 173294810, 423, 0, '0000-00-00'),
(451, '2024-10-03', '4000/t05', '12257', 281350, '0000-00-00', '', '', 0, 173576160, 424, 0, '0000-00-00'),
(452, '2024-10-03', '4000/t05', '12257', 2880240, '0000-00-00', '', '', 0, 176456400, 425, 0, '0000-00-00'),
(453, '2024-10-03', '4000/t11', '12258', 10718400, '0000-00-00', '', '', 0, 82503000, 426, 0, '0000-00-00'),
(454, '2024-10-03', '4000/t11', '12258', 2859750, '0000-00-00', '', '', 0, 85362750, 427, 0, '0000-00-00'),
(455, '2024-10-03', '4000/t11', '12258', 824600, '0000-00-00', '', '', 0, 86187350, 428, 0, '0000-00-00'),
(456, '2024-10-03', '4000/a03', '12259', 180000, '0000-00-00', '', '', 0, 62097850, 429, 0, '0000-00-00'),
(457, '2024-10-03', '4000/a03', '12259', 925500, '0000-00-00', '', '', 0, 63023350, 430, 0, '0000-00-00'),
(458, '2024-10-03', '4000/a03', '12259', 917500, '0000-00-00', '', '', 0, 63940850, 431, 0, '0000-00-00'),
(459, '2024-10-03', '4000/a03', '12259', 280500, '0000-00-00', '', '', 0, 64221350, 432, 0, '0000-00-00'),
(460, '2024-10-03', '4000/s04', '12260', 918400, '0000-00-00', '', '', 0, 11623300, 433, 0, '0000-00-00'),
(461, '2024-10-03', '4000/b01', '12261', 3033850, '0000-00-00', '', '', 0, 201508135, 434, 0, '0000-00-00'),
(462, '2024-10-03', '4000/b01', '12261', 979000, '0000-00-00', '', '', 0, 202487135, 435, 0, '0000-00-00'),
(463, '2024-10-03', '4000/b01', '12261', 163400, '0000-00-00', '', '', 0, 202650535, 436, 0, '0000-00-00'),
(464, '2024-10-03', '4000/b01', '12261', 484500, '0000-00-00', '', '', 0, 203135035, 437, 0, '0000-00-00'),
(465, '2024-10-03', '4000/b01', '12261', 376000, '0000-00-00', '', '', 0, 203511035, 438, 0, '0000-00-00'),
(466, '2024-10-03', '4000/b01', '12261', 368000, '0000-00-00', '', '', 0, 203879035, 439, 0, '0000-00-00'),
(467, '2024-10-03', '4000/b01', '12261', 2119900, '0000-00-00', '', '', 0, 205998935, 440, 0, '0000-00-00'),
(468, '2024-10-03', '4000/b01', '12261', 382200, '0000-00-00', '', '', 0, 206381135, 441, 0, '0000-00-00'),
(469, '2024-10-03', '4000/t02', '12262', 777200, '0000-00-00', '', '', 0, 61662850, 442, 0, '0000-00-00'),
(470, '2024-10-03', '4000/t02', '12262', 1099200, '0000-00-00', '', '', 0, 62762050, 443, 0, '0000-00-00'),
(471, '2024-10-03', '4000/t02', '12262', 484000, '0000-00-00', '', '', 0, 63246050, 444, 0, '0000-00-00'),
(472, '2024-10-03', '4000/t02', '12262', 292100, '0000-00-00', '', '', 0, 63538150, 445, 0, '0000-00-00'),
(473, '2024-10-03', '4000/t02', '12262', 4012800, '0000-00-00', '', '', 0, 67550950, 446, 0, '0000-00-00'),
(474, '2024-10-03', '4000/t02', '12262', 1288000, '0000-00-00', '', '', 0, 68838950, 447, 0, '0000-00-00'),
(475, '2024-10-03', '4000/t02', '12262', 1653000, '0000-00-00', '', '', 0, 70491950, 448, 0, '0000-00-00'),
(476, '2024-10-04', '4000/t05', '12263', 227800, '0000-00-00', '', '', 0, 176684200, 449, 0, '0000-00-00'),
(477, '2024-10-04', '4000/t05', '12263', 12520640, '0000-00-00', '', '', 0, 189204840, 450, 0, '0000-00-00'),
(478, '2024-10-04', '4000/t05', '12263', 2964970, '0000-00-00', '', '', 0, 192169810, 451, 0, '0000-00-00'),
(479, '2024-10-04', '4000/t05', '12263', 1696520, '0000-00-00', '', '', 0, 193866330, 452, 0, '0000-00-00');
INSERT INTO `payable` (`id`, `date`, `supplier_id`, `purchase_voucher_no`, `purchase_amount`, `paid_date`, `paid_voucher`, `remark`, `paid_amount`, `balance`, `link_id`, `closing_balance`, `report_date`) VALUES
(480, '2024-10-04', '4000/n04', '12264', 2124200, '0000-00-00', '', '', 0, 27415950, 453, 0, '0000-00-00'),
(481, '2024-10-04', '4000/n04', '12264', 369000, '0000-00-00', '', '', 0, 27784950, 454, 0, '0000-00-00'),
(482, '2024-10-04', '4000/n04', '12264', 498200, '0000-00-00', '', '', 0, 28283150, 455, 0, '0000-00-00'),
(483, '2024-10-04', '4000/n04', '12264', 235200, '0000-00-00', '', '', 0, 28518350, 456, 0, '0000-00-00'),
(484, '2024-10-04', '4000/b01', '12265', 1795400, '0000-00-00', '', '', 0, 208176535, 457, 0, '0000-00-00'),
(485, '2024-10-04', '4000/b01', '12265', 507300, '0000-00-00', '', '', 0, 208683835, 458, 0, '0000-00-00'),
(486, '2024-10-04', '4000/b01', '12265', 1539000, '0000-00-00', '', '', 0, 210222835, 459, 0, '0000-00-00'),
(487, '2024-10-04', '4000/b01', '12265', 940000, '0000-00-00', '', '', 0, 211162835, 460, 0, '0000-00-00'),
(488, '2024-10-04', '4000/b01', '12265', 420500, '0000-00-00', '', '', 0, 211583335, 461, 0, '0000-00-00'),
(489, '2024-10-04', '4000/b01', '12265', 748800, '0000-00-00', '', '', 0, 212332135, 462, 0, '0000-00-00'),
(490, '2024-10-04', '4000/s04', '12266', 4003200, '0000-00-00', '', '', 0, 15626500, 463, 0, '0000-00-00'),
(491, '2024-10-04', '4000/s04', '12266', 1946800, '0000-00-00', '', '', 0, 17573300, 464, 0, '0000-00-00'),
(492, '2024-10-04', '4000/t11', '12267', 27105600, '0000-00-00', '', '', 0, 113292950, 465, 0, '0000-00-00'),
(493, '2024-10-04', '4000/t11', '12267', 2287800, '0000-00-00', '', '', 0, 115580750, 466, 0, '0000-00-00'),
(494, '2024-10-04', '4000/a03', '12268', 1101000, '0000-00-00', '', '', 0, 65322350, 467, 0, '0000-00-00'),
(495, '2024-10-04', '4000/a14', '12269', 16269500, '0000-00-00', '', '', 0, 45347900, 468, 0, '0000-00-00'),
(496, '2024-10-05', '4000/t05', '12270', 211650, '0000-00-00', '', '', 0, 194077980, 469, 0, '0000-00-00'),
(497, '2024-10-05', '4000/t05', '12270', 2224640, '0000-00-00', '', '', 0, 196302620, 470, 0, '0000-00-00'),
(498, '2024-10-05', '4000/t05', '12270', 34320, '0000-00-00', '', '', 0, 196336940, 471, 0, '0000-00-00'),
(499, '2024-10-05', '4000/t05', '12270', 11206250, '0000-00-00', '', '', 0, 207543190, 472, 0, '0000-00-00'),
(500, '2024-10-05', '4000/t05', '12270', 6236620, '0000-00-00', '', '', 0, 213779810, 473, 0, '0000-00-00'),
(501, '2024-10-05', '4000/b01', '12271', 1757800, '0000-00-00', '', '', 0, 214089935, 474, 0, '0000-00-00'),
(502, '2024-10-05', '4000/b01', '12271', 275900, '0000-00-00', '', '', 0, 214365835, 475, 0, '0000-00-00'),
(503, '2024-10-05', '4000/b01', '12271', 872100, '0000-00-00', '', '', 0, 215237935, 476, 0, '0000-00-00'),
(504, '2024-10-05', '4000/b01', '12271', 864800, '0000-00-00', '', '', 0, 216102735, 477, 0, '0000-00-00'),
(505, '2024-10-05', '4000/b01', '12271', 1867600, '0000-00-00', '', '', 0, 217970335, 478, 0, '0000-00-00'),
(506, '2024-10-05', '4000/b01', '12271', 442000, '0000-00-00', '', '', 0, 218412335, 479, 0, '0000-00-00'),
(507, '2024-10-05', '4000/t02', '12272', 1203600, '0000-00-00', '', '', 0, 71695550, 480, 0, '0000-00-00'),
(508, '2024-10-05', '4000/t02', '12272', 1278900, '0000-00-00', '', '', 0, 72974450, 481, 0, '0000-00-00'),
(509, '2024-10-05', '4000/t02', '12272', 483000, '0000-00-00', '', '', 0, 73457450, 482, 0, '0000-00-00'),
(510, '2024-10-05', '4000/t02', '12272', 3052700, '0000-00-00', '', '', 0, 76510150, 483, 0, '0000-00-00'),
(511, '2024-10-05', '4000/t02', '12272', 1038700, '0000-00-00', '', '', 0, 77548850, 484, 0, '0000-00-00'),
(512, '2024-10-05', '4000/b01', '12273', 3224200, '0000-00-00', '', '', 0, 221636535, 485, 0, '0000-00-00'),
(513, '2024-10-05', '4000/b01', '12273', 823250, '0000-00-00', '', '', 0, 222459785, 486, 0, '0000-00-00'),
(514, '2024-10-05', '4000/b01', '12273', 1311000, '0000-00-00', '', '', 0, 223770785, 487, 0, '0000-00-00'),
(515, '2024-10-05', '4000/b01', '12273', 1374750, '0000-00-00', '', '', 0, 225145535, 488, 0, '0000-00-00'),
(516, '2024-10-05', '4000/b01', '12273', 1870500, '0000-00-00', '', '', 0, 227016035, 489, 0, '0000-00-00'),
(517, '2024-10-05', '4000/b01', '12273', 213200, '0000-00-00', '', '', 0, 227229235, 490, 0, '0000-00-00'),
(518, '2024-10-05', '4000/t07', '12274', 4224500, '0000-00-00', '', '', 0, 41625550, 491, 0, '0000-00-00'),
(519, '2024-10-07', '4000/t05', '12275', 1161100, '0000-00-00', '', '', 0, 214940910, 492, 0, '0000-00-00'),
(520, '2024-10-07', '4000/t05', '12275', 12224960, '0000-00-00', '', '', 0, 227165870, 493, 0, '0000-00-00'),
(521, '2024-10-07', '4000/t05', '12275', 7181780, '0000-00-00', '', '', 0, 234347650, 494, 0, '0000-00-00'),
(522, '2024-10-07', '4000/t05', '12275', 4930200, '0000-00-00', '', '', 0, 239277850, 495, 0, '0000-00-00'),
(523, '2024-10-07', '4000/t03', '12276', 645000, '0000-00-00', '', '', 0, 4154200, 496, 0, '0000-00-00'),
(524, '2024-10-07', '4000/t03', '12276', 188600, '0000-00-00', '', '', 0, 4342800, 497, 0, '0000-00-00'),
(525, '2024-10-07', '4000/t03', '12276', 394200, '0000-00-00', '', '', 0, 4737000, 498, 0, '0000-00-00'),
(526, '2024-10-07', '4000/m09', '12277', 4455000, '0000-00-00', '', '', 0, 15775000, 499, 0, '0000-00-00'),
(527, '2024-10-07', '4000/k15', '12278', 2371200, '0000-00-00', '', '', 0, 10551200, 500, 0, '0000-00-00'),
(528, '2024-10-07', '4000/k15', '12278', 713000, '0000-00-00', '', '', 0, 11264200, 501, 0, '0000-00-00'),
(529, '2024-10-07', '4000/b01', '12279', 1496250, '0000-00-00', '', '', 0, 228725485, 502, 0, '0000-00-00'),
(530, '2024-10-07', '4000/b01', '12279', 643900, '0000-00-00', '', '', 0, 229369385, 503, 0, '0000-00-00'),
(531, '2024-10-07', '4000/b01', '12279', 4913850, '0000-00-00', '', '', 0, 234283235, 504, 0, '0000-00-00'),
(532, '2024-10-07', '4000/b01', '12279', 734250, '0000-00-00', '', '', 0, 235017485, 505, 0, '0000-00-00'),
(533, '2024-10-07', '4000/b01', '12279', 1206400, '0000-00-00', '', '', 0, 236223885, 506, 0, '0000-00-00'),
(534, '2024-10-07', '4000/b01', '12279', 364000, '0000-00-00', '', '', 0, 236587885, 507, 0, '0000-00-00'),
(535, '2024-10-08', '4000/t05', '12280', 8243725, '0000-00-00', '', '', 0, 247521575, 508, 0, '0000-00-00'),
(536, '2024-10-08', '4000/t05', '12280', 3934200, '0000-00-00', '', '', 0, 251455775, 509, 0, '0000-00-00'),
(537, '2024-10-08', '4000/t05', '12280', 8751600, '0000-00-00', '', '', 0, 260207375, 510, 0, '0000-00-00'),
(538, '2024-10-08', '4000/t08', '12281', 412100, '0000-00-00', '', '', 0, 412100, 511, 0, '0000-00-00'),
(539, '2024-10-08', '4000/t08', '12281', 37500, '0000-00-00', '', '', 0, 434600, 512, 0, '0000-00-00'),
(540, '2024-10-08', '4000/t07', '12282', 4662000, '0000-00-00', '', '', 0, 46287550, 513, 0, '0000-00-00'),
(541, '2024-10-08', '4000/t03', '12283', 964600, '0000-00-00', '', '', 0, 5701600, 514, 0, '0000-00-00'),
(542, '2024-10-08', '4000/t03', '12283', 507500, '0000-00-00', '', '', 0, 6209100, 515, 0, '0000-00-00'),
(543, '2024-10-08', '4000/t03', '12283', 95000, '0000-00-00', '', '', 0, 6304100, 516, 0, '0000-00-00'),
(544, '2024-10-08', '4000/b01', '12284', 5258950, '0000-00-00', '', '', 0, 241846835, 517, 0, '0000-00-00'),
(545, '2024-10-08', '4000/a14', '12285', 7555600, '0000-00-00', '', '', 0, 52903500, 518, 0, '0000-00-00'),
(546, '2024-10-08', '4000/t15', '160', 2812600, '0000-00-00', '', '', 0, 263019975, 519, 0, '0000-00-00'),
(547, '2024-10-08', '4000/b02', '161', 5281500, '0000-00-00', '', '', 0, 247128335, 520, 0, '0000-00-00'),
(548, '2024-10-09', '4000/t15', '162', 20263100, '0000-00-00', '', '', 0, 283283075, 521, 0, '0000-00-00'),
(549, '2024-10-09', '4000/t15', '162', 1400713, '0000-00-00', '', '', 0, 284683788, 522, 0, '0000-00-00'),
(550, '2024-10-09', '4000/t15', '163', 21179925, '0000-00-00', '', '', 0, 305863713, 523, 0, '0000-00-00'),
(551, '2024-10-09', '4000/b02', '164', 3573000, '0000-00-00', '', '', 0, 250701335, 524, 0, '0000-00-00'),
(552, '2024-10-09', '4000/t05', '12286', 2353000, '0000-00-00', '', '', 0, 308216713, 525, 0, '0000-00-00'),
(553, '2024-10-09', '4000/t05', '12286', 6435000, '0000-00-00', '', '', 0, 314651713, 526, 0, '0000-00-00'),
(554, '2024-10-09', '4000/t05', '12287', 2004200, '0000-00-00', '', '', 0, 316655913, 527, 0, '0000-00-00'),
(555, '2024-10-09', '4000/t05', '12287', 4801225, '0000-00-00', '', '', 0, 321457138, 528, 0, '0000-00-00'),
(556, '2024-10-09', '4000/t05', '12287', 6951250, '0000-00-00', '', '', 0, 328408388, 529, 0, '0000-00-00'),
(557, '2024-10-09', '4000/b01', '12288', 2617250, '0000-00-00', '', '', 0, 244464085, 530, 0, '0000-00-00'),
(558, '2024-10-09', '4000/b01', '12288', 215800, '0000-00-00', '', '', 0, 244679885, 531, 0, '0000-00-00'),
(559, '2024-10-09', '4000/a01', '12289', 5146000, '0000-00-00', '', '', 0, 17979950, 532, 0, '0000-00-00'),
(560, '2024-10-09', '4000/t07', '12290', 4686500, '0000-00-00', '', '', 0, 50974050, 533, 0, '0000-00-00'),
(561, '2024-10-09', '4000/a03', '12291', 2578500, '0000-00-00', '', '', 0, 67900850, 534, 0, '0000-00-00'),
(562, '2024-10-09', '4000/a03', '12291', 4555000, '0000-00-00', '', '', 0, 70633850, 535, 0, '0000-00-00'),
(563, '2024-10-09', '4000/t02', '12292', 526400, '0000-00-00', '', '', 0, 78075250, 536, 0, '0000-00-00'),
(564, '2024-10-09', '4000/t02', '12292', 498800, '0000-00-00', '', '', 0, 78574050, 537, 0, '0000-00-00'),
(565, '2024-10-10', '4000/t05', '12293', 3900600, '0000-00-00', '', '', 0, 332308988, 538, 0, '0000-00-00'),
(566, '2024-10-10', '4000/t07', '12294', 1076250, '0000-00-00', '', '', 0, 52050300, 539, 0, '0000-00-00'),
(567, '2024-10-10', '4000/b01', '12295', 8572400, '0000-00-00', '', '', 0, 253252285, 540, 0, '0000-00-00'),
(568, '2024-10-10', '4000/b01', '12295', 2308800, '0000-00-00', '', '', 0, 255561085, 541, 0, '0000-00-00'),
(569, '2024-10-10', '4000/t02', '12296', 103400, '0000-00-00', '', '', 0, 78677450, 542, 0, '0000-00-00'),
(570, '2024-10-10', '4000/t02', '12296', 1818900, '0000-00-00', '', '', 0, 80496350, 543, 0, '0000-00-00'),
(571, '2024-10-10', '4000/s04', '12297', 1097600, '0000-00-00', '', '', 0, 18670900, 544, 0, '0000-00-00'),
(572, '2024-10-10', '4000/b02', '165', 3557000, '0000-00-00', '', '', 0, 254258335, 545, 0, '0000-00-00'),
(573, '2024-10-11', '4000/b01', '12299', 4648700, '0000-00-00', '', '', 0, 260209785, 546, 0, '0000-00-00'),
(574, '2024-10-11', '4000/b01', '12299', 1554800, '0000-00-00', '', '', 0, 261764585, 547, 0, '0000-00-00'),
(575, '2024-10-10', '4000/a03', '12298', 2077500, '0000-00-00', '', '', 0, 72711350, 548, 0, '0000-00-00'),
(576, '2024-10-10', '4000/a03', '12298', 901500, '0000-00-00', '', '', 0, 73612850, 549, 0, '0000-00-00'),
(577, '2024-10-11', '4000/t05', '12300', 11355300, '0000-00-00', '', '', 0, 343664288, 550, 0, '0000-00-00'),
(578, '2024-10-11', '4000/t05', '12300', 7046325, '0000-00-00', '', '', 0, 350710613, 551, 0, '0000-00-00'),
(579, '2024-10-11', '4000/t05', '12300', 2668450, '0000-00-00', '', '', 0, 353379063, 552, 0, '0000-00-00'),
(580, '2024-10-11', '4000/t05', '12300', 6265600, '0000-00-00', '', '', 0, 359644663, 553, 0, '0000-00-00'),
(581, '2024-10-12', '4000/a03', '12301', 131100, '0000-00-00', '', '', 0, 73743950, 554, 0, '0000-00-00'),
(582, '2024-10-12', '4000/t02', '12302', 2023150, '0000-00-00', '', '', 0, 82519500, 555, 0, '0000-00-00'),
(583, '2024-10-12', '4000/b01', '12303', 11433250, '0000-00-00', '', '', 0, 273197835, 556, 0, '0000-00-00'),
(584, '2024-10-12', '4000/b01', '12303', 629200, '0000-00-00', '', '', 0, 273827035, 557, 0, '0000-00-00'),
(585, '2024-10-12', '4000/b01', '12303', 898620, '0000-00-00', '', '', 0, 274725655, 558, 0, '0000-00-00'),
(586, '2024-10-12', '4000/t07', '12304', 2625000, '0000-00-00', '', '', 0, 54675300, 559, 0, '0000-00-00'),
(587, '2024-10-12', '4000/a03', '12305', 6222500, '0000-00-00', '', '', 0, 79966450, 560, 0, '0000-00-00'),
(588, '2024-10-12', '4000/a03', '12305', 5133000, '0000-00-00', '', '', 0, 85099450, 561, 0, '0000-00-00'),
(589, '2024-10-13', '4000/b01', '12306', 3897600, '0000-00-00', '', '', 0, 278623255, 562, 0, '0000-00-00'),
(590, '2024-10-13', '4000/b01', '12306', 1151800, '0000-00-00', '', '', 0, 279775055, 563, 0, '0000-00-00'),
(591, '2024-10-13', '4000/a06', '12307', 742300, '0000-00-00', '', '', 0, 3196250, 564, 0, '0000-00-00'),
(592, '2024-10-13', '4000/t07', '12308', 2177000, '0000-00-00', '', '', 0, 56852300, 565, 0, '0000-00-00'),
(593, '2024-10-13', '4000/a02', '12309', 1100250, '0000-00-00', '', '', 0, 3178850, 566, 0, '0000-00-00'),
(594, '2024-10-13', '4000/a02', '12309', 87500, '0000-00-00', '', '', 0, 3266350, 567, 0, '0000-00-00'),
(595, '2024-10-13', '4000/a03', '12310', 912500, '0000-00-00', '', '', 0, 86011950, 568, 0, '0000-00-00'),
(596, '2024-10-13', '4000/a03', '12310', 268500, '0000-00-00', '', '', 0, 86280450, 569, 0, '0000-00-00'),
(597, '2024-10-14', '4000/b01', '12311', 2582000, '0000-00-00', '', '', 0, 282357055, 570, 0, '0000-00-00'),
(598, '2024-10-14', '4000/b01', '12311', 942900, '0000-00-00', '', '', 0, 283299955, 571, 0, '0000-00-00'),
(599, '2024-10-14', '4000/b01', '12311', 10725120, '0000-00-00', '', '', 0, 294025075, 572, 0, '0000-00-00'),
(600, '2024-10-14', '4000/b01', '12311', 1336900, '0000-00-00', '', '', 0, 295361975, 573, 0, '0000-00-00'),
(601, '2024-10-14', '4000/b01', '12311', 309400, '0000-00-00', '', '', 0, 295671375, 574, 0, '0000-00-00'),
(602, '2024-10-14', '4000/a01', '12312', 2424200, '0000-00-00', '', '', 0, 20404150, 575, 0, '0000-00-00'),
(603, '2024-10-14', '4000/a01', '12312', 5288600, '0000-00-00', '', '', 0, 25692750, 576, 0, '0000-00-00'),
(604, '0000-00-00', '4000/a03', '962090019', 0, '2024-09-19', 'Dr-Sep 24/388', 'Paid To Aung Naing Oo For Vr no 12091,12096,12154 , Cheque no 109452\r\n', 7942750, 82431700, 0, 0, '0000-00-00'),
(605, '0000-00-00', '4000/a01', '965875994', 0, '2024-09-19', 'Dr-Sep 24/389', 'Paid to A.K For Vr no 12097,12119 Cheque no 109455\r\n', 1240800, 25692750, 0, 0, '0000-00-00'),
(606, '0000-00-00', '4000/b01', '236670104', 0, '2024-09-19', 'Dr-Sep 24/390', 'Paid to Bar Bu Lay For Vr no 12019,12020,12027,12028,12029,12039,12040,12041,12048,12059 Cheque no 109453\r\n\r\n\r\n', 100000000, 567268770, 0, 0, '0000-00-00'),
(607, '0000-00-00', '4000/m09', '164898084', 0, '2024-09-19', 'Dr-Sep 24/391', 'Paid to Min Lwin For Vr no 12044,12103,12118,12146,12152 Cheque no 109456\r\n\r\n\r\n\r\n\r\n', 14565375, 11259000, 0, 0, '0000-00-00'),
(608, '0000-00-00', '4000/m01', '999074619', 0, '2024-09-19', 'Dr-Sep 24/392', 'Paid to MA For Vr no 12068,12014,12038,12047 Cheque no 109467\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 5889650, 0, 0, 0, '0000-00-00'),
(609, '0000-00-00', '4000/n04', '362420526', 0, '2024-09-19', 'Dr-Sep 24/393', 'Paid to Nyan Tun For Vr no 12131,12135,12138 Cheque no 109459\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 10000000, 28921550, 0, 0, '0000-00-00'),
(610, '0000-00-00', '4000/s03', '927304758', 0, '2024-09-19', 'Dr-Sep 24/394', 'Paid to Soe Min For Vr no 11893,11898,11914 Cheque no 109462\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 50000000, 271473266, 0, 0, '0000-00-00'),
(611, '0000-00-00', '4000/s06', '492278859', 0, '2024-09-19', 'Dr-Sep 24/395', 'Paid to Soe Thein For Vr no 12114 Cheque no 109457\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 4501200, 717650, 0, 0, '0000-00-00'),
(612, '0000-00-00', '4000/t07', '408828739', 0, '2024-09-19', 'Dr-Sep 24/396', 'Paid to Thaung Tun For Vr no 12032,12045,12052,12064\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 10000000, 79222180, 0, 0, '0000-00-00'),
(613, '0000-00-00', '4000/t02', '913075723', 0, '2024-09-19', 'Dr-Sep 24/397', 'Paid to Thein Htay For Vr no 12105,12107,12123,12130 Cheque no 109464\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 25000000, 107367125, 0, 0, '0000-00-00'),
(614, '0000-00-00', '4000/t05', '581629390', 0, '2024-09-19', 'Dr-Sep 24/398', 'Paid to Thet Oo For Vr no 11881,11888,11897,11903,11904 Cheque no 109469\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 48100375, 726179717, 0, 0, '0000-00-00'),
(615, '0000-00-00', '4000/t15', '130014036', 0, '2024-09-19', 'Dr-Sep 24/399', 'Paid to Thet Oo (TCL) For Vr no 00155,00156 Cheque no 109469\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 41899625, 305863713, 0, 0, '0000-00-00'),
(616, '0000-00-00', '4000/t03', '895951108', 0, '2024-09-19', 'Dr-Sep 24/400', 'Paid to Thin Thin Yee For Vr no 12065,12098 Cheque no 109454\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 6167260, 6304100, 0, 0, '0000-00-00'),
(617, '0000-00-00', '4000/t17', '138935862', 0, '2024-09-19', 'Dr-Sep 24/401', 'Paid to Than Than Myint For Vr no 12104,12093 Cheque no 109463\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 7658840, 0, 0, 0, '0000-00-00'),
(618, '0000-00-00', '4000/k07', '680967203', 0, '2024-09-19', 'Dr-Sep 24/402', 'Paid to Khin Maung Myint For Vr no 12121,12108 Cheque no 109461\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 6710900, 20386050, 0, 0, '0000-00-00'),
(619, '0000-00-00', '4000/k10', '958297283', 0, '2024-09-19', 'Dr-Sep 24/403', 'Paid to Ko Myo For Vr no 12137 Cheque no 109465\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 734700, 4721300, 0, 0, '0000-00-00'),
(620, '0000-00-00', '4000/z03', '891529893', 0, '2024-09-19', 'Dr-Sep 24/404', 'Paid to Zaw Myat Thu For Vr no 12092,12115,12149,12160 Cheque no 109460\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 35169800, 26495225, 0, 0, '0000-00-00'),
(621, '0000-00-00', '4000/t01', '934079851', 0, '2024-09-19', 'Dr-Sep 24/405', 'Paid to Thet Paing For Vr no 12159 Cheque no 109458\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 18749100, 43884900, 0, 0, '0000-00-00'),
(622, '0000-00-00', '4000/s10', '56687412', 0, '2024-09-19', 'Dr-Sep 24/406', 'Paid to Carton Box Shwe Myay For Vr Date 27.8.24 Cheque no 109471\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 7000000, 11507300, 0, 0, '0000-00-00'),
(623, '0000-00-00', '4000/m04', '368191225', 0, '2024-09-19', 'Dr-Sep 24/407', 'Paid to Carton Box MMMO Cheque no 109472\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 1876800, 0, 0, 0, '0000-00-00'),
(624, '0000-00-00', '4000/p03', '105925190', 0, '2024-09-19', 'Dr-Sep 24/408', 'Paid to Carton Box Pan Thazin For Vr Date 26.8.24,27.8.24 Cheque no 109473\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 2000000, 2527000, 0, 0, '0000-00-00'),
(625, '0000-00-00', '4000/d04', '588879264', 0, '2024-09-19', 'Dr-Sep 24/409', 'Paid to Dalian Ice For Vr Date 29.8.24,13.9.24 Cheque no 109474\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 2920000, 0, 0, 0, '0000-00-00'),
(626, '0000-00-00', '4000/g03', '109193201', 0, '2024-09-19', 'Dr-Sep 24/410', 'Paid to Plastic Golden Fish For Vr Date 12.9.24,13.9.24,18.9.24 Cheque no 109475\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 3760900, -784200, 0, 0, '0000-00-00'),
(627, '0000-00-00', '4000/003', '106585246', 0, '2024-10-07', 'JV10-012', 'Paid to Jiangyin Junnan Packaging Co.,Ltd for China Plastic (1st time ADV;)', 8000, 0, 0, 0, '0000-00-00');

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
(1, '2024-09-16', 12149, '4000/b01', 'frozen', '1001', '3up', '6.6', 3, 55000, 363000),
(2, '2024-09-16', 12149, '4000/b01', 'frozen', '1001', '2up', '6', 4, 45000, 270000),
(3, '2024-09-16', 12149, '4000/b01', 'frozen', '1001', '1.5up', '9.2', 9, 39000, 358800),
(4, '2024-09-16', 12149, '4000/b01', 'frozen', '1001', '1up', '10.3', 13, 36000, 370800),
(5, '2024-09-16', 12149, '4000/b01', 'frozen', '1002', '4up', '31', 9, 45000, 1395000),
(6, '2024-09-16', 12149, '4000/b01', 'frozen', '1002', '2up', '5.2', 3, 42500, 221000),
(7, '2024-09-16', 12149, '4000/b01', 'frozen', '1002', '1.5up', '4.6', 4, 36000, 165600),
(8, '2024-09-16', 12149, '4000/b01', 'frozen', '1020', '3/4', '65.9', 0, 28000, 1845200),
(9, '2024-09-16', 12149, '4000/b01', 'frozen', '1020', '2up', '54.4', 0, 25000, 1360000),
(10, '2024-09-16', 12149, '4000/b01', 'frozen', '1023', '4/5up', '216.9', 0, 17200, 3730680),
(11, '2024-09-16', 12149, '4000/b01', 'frozen', '1031', 'J', '7', 0, 8500, 59500),
(12, '2024-09-16', 12150, '4000/n04', 'frozen', '1002', '3up', '37.35', 15, 39000, 1456650),
(13, '2024-09-16', 12150, '4000/n04', 'frozen', '1002', '2up', '30.4', 19, 36000, 1094400),
(14, '2024-09-16', 12150, '4000/n04', 'frozen', '1002', '1.5up', '12.3', 11, 25000, 307500),
(15, '2024-09-16', 12150, '4000/n04', 'frozen', '1001', '3up', '19.8', 10, 49000, 970200),
(16, '2024-09-16', 12150, '4000/n04', 'frozen', '1001', '2up', '8.8', 6, 38000, 334400),
(17, '2024-09-16', 12150, '4000/n04', 'frozen', '1001', '1.5up', '12', 13, 29000, 348000),
(18, '2024-09-16', 12150, '4000/n04', 'frozen', '1001', '1up', '21', 23, 28000, 588000),
(19, '2024-09-17', 12151, '4000/t05', 'frozen', '1031', '18/24', '61.4', 42, 7650, 469710),
(20, '2024-09-17', 12151, '4000/t05', 'frozen', '1031', '2up', '1102.1', 579, 7950, 8761695),
(21, '2024-09-17', 12151, '4000/t05', 'frozen', '1031', '3up', '1072.6', 428, 7950, 8527170),
(22, '2024-09-17', 12151, '4000/t05', 'frozen', '1031', '4up', '709.2', 228, 8500, 6028200),
(23, '2024-09-17', 12151, '4000/t05', 'frozen', '1031', '5up', '532.3', 133, 8700, 4631010),
(24, '2024-09-17', 12152, '4000/m09', 'frozen', '1004', 'J', '282.25', 0, 16000, 4516000),
(25, '2024-09-17', 12153, '4000/t02', 'frozen', '1001', '3up', '22', 10, 56000, 1232000),
(26, '2024-09-17', 12153, '4000/t02', 'frozen', '1001', '2up', '17', 12, 46000, 782000),
(27, '2024-09-17', 12153, '4000/t02', 'frozen', '1001', '1.5up', '26.4', 24, 39000, 1029600),
(28, '2024-09-17', 12153, '4000/t02', 'frozen', '1001', '1up', '33.2', 43, 36000, 1195200),
(29, '2024-09-17', 12153, '4000/t02', 'frozen', '1002', '3up', '76.4', 29, 46000, 3514400),
(30, '2024-09-17', 12153, '4000/t02', 'frozen', '1002', '2up', '7.9', 5, 44000, 347600),
(31, '2024-09-17', 12153, '4000/t02', 'frozen', '1002', '1.5up', '7.5', 7, 37000, 277500),
(32, '2024-09-17', 12153, '4000/t02', 'frozen', '1001', '1D', '9.5', 0, 21000, 199500),
(33, '2024-09-17', 12154, '4000/a03', 'frozen', '1037', '1/2', '98.15', 0, 25000, 2453750),
(34, '2024-09-17', 12154, '4000/a03', 'frozen', '1037', '8/10', '93', 0, 15000, 1395000),
(35, '2024-09-17', 12155, '4000/b01', 'frozen', '1001', '3up', '10.5', 5, 55000, 577500),
(36, '2024-09-17', 12155, '4000/b01', 'frozen', '1001', '2up', '18', 12, 45000, 810000),
(37, '2024-09-17', 12155, '4000/b01', 'frozen', '1001', '1.5up', '15.5', 13, 39000, 604500),
(38, '2024-09-17', 12155, '4000/b01', 'frozen', '1001', '1up', '7.2', 9, 36000, 259200),
(39, '2024-09-17', 12155, '4000/b01', 'frozen', '1002', '4up', '48.45', 16, 45000, 2180250),
(40, '2024-09-17', 12155, '4000/b01', 'frozen', '1002', '2up', '3', 2, 42500, 127500),
(41, '2024-09-17', 12155, '4000/b01', 'frozen', '1002', '1.5up', '1.1', 1, 36000, 39600),
(42, '2024-09-17', 12155, '4000/b01', 'frozen', '1020', '2up', '12.9', 0, 25000, 322500),
(43, '2024-09-17', 12155, '4000/b01', 'frozen', '1020', '3/4', '21.5', 0, 28000, 602000),
(44, '2024-09-17', 12156, '4000/t07', 'frozen', '1004', 'J', '220.3', 0, 19000, 4185700),
(45, '2024-09-18', 12157, '4000/t05', 'frozen', '1031', '4up', '394.5', 0, 8500, 3353250),
(46, '2024-09-18', 12157, '4000/t05', 'frozen', '1031', '5up', '321.75', 0, 8700, 2799225),
(47, '2024-09-18', 12157, '4000/t05', 'frozen', '1023', '4up', '18', 0, 16400, 295200),
(48, '2024-09-18', 12157, '4000/t05', 'frozen', '1023', '5/6', '139.75', 0, 16800, 2347800),
(49, '2024-09-18', 12158, '4000/t16', 'frozen', '1010', 'J', '57.2', 0, 5800, 331760),
(50, '2024-09-18', 12159, '4000/t01', 'frozen', '1015', '3/5', '222.55', 0, 28000, 6231400),
(51, '2024-09-18', 12159, '4000/t01', 'frozen', '1015', '5/8', '230.15', 0, 46000, 10586900),
(52, '2024-09-18', 12159, '4000/t01', 'frozen', '1015', '10/12', '20.4', 0, 58000, 1183200),
(53, '2024-09-18', 12159, '4000/t01', 'frozen', '1015', '500', '16.8', 0, 44500, 747600),
(54, '2024-09-18', 12160, '4000/z03', 'frozen', '1001', '3up', '37', 16, 54000, 1998000),
(55, '2024-09-18', 12160, '4000/z03', 'frozen', '1001', '2up', '4', 3, 44000, 176000),
(56, '2024-09-18', 12160, '4000/z03', 'frozen', '1001', '1.5up', '45.25', 50, 32000, 1448000),
(57, '2024-09-18', 12160, '4000/z03', 'frozen', '1001', '1D', '15.25', 25, 30000, 457500),
(58, '2024-09-18', 12160, '4000/z03', 'frozen', '1002', '3/4', '68.75', 31, 43500, 2990625),
(59, '2024-09-18', 12160, '4000/z03', 'frozen', '1002', '2up', '47', 34, 41500, 1950500),
(60, '2024-09-18', 12160, '4000/z03', 'frozen', '1002', '1.5up', '16', 16, 29000, 464000),
(61, '2024-09-18', 12161, '4000/s04', 'frozen', '1027', '1up', '183.8', 0, 14000, 2573200),
(62, '2024-09-18', 12162, '4000/b01', 'frozen', '1020', '3/4', '32', 0, 28000, 896000),
(63, '2024-09-18', 12162, '4000/b01', 'frozen', '1020', '2up', '34.3', 0, 25000, 857500),
(64, '2024-09-18', 12163, '4000/a06', 'frozen', '1015', '3/5', '27.5', 0, 28000, 770000),
(65, '2024-09-18', 12163, '4000/a06', 'frozen', '1015', '5/8', '3.15', 0, 44000, 138600),
(66, '2024-09-18', 12163, '4000/a06', 'frozen', '1015', '10/12', '3.35', 0, 62000, 207700),
(67, '2024-09-19', 12164, '4000/t16', 'frozen', '1044', 'J', '27.5', 0, 7000, 192500),
(68, '2024-09-19', 12164, '4000/t16', 'frozen', '1010', 'J', '20.5', 0, 5800, 118900),
(69, '2024-09-19', 12165, '4000/t07', 'frozen', '1004', 'J', '126', 0, 19000, 2394000),
(70, '2024-09-19', 12166, '4000/a01', 'frozen', '1027', '1up', '122.5', 0, 15000, 1837500),
(71, '2024-09-19', 12167, '4000/b01', 'frozen', '1002', '4up', '191.7', 62, 46000, 8818200),
(72, '2024-09-19', 12167, '4000/b01', 'frozen', '1002', '2up', '42.6', 26, 43500, 1853100),
(73, '2024-09-19', 12167, '4000/b01', 'frozen', '1002', '1.5up', '10.8', 9, 37000, 399600),
(74, '2024-09-19', 12167, '4000/b01', 'frozen', '1001', '3up', '25.2', 10, 56000, 1411200),
(75, '2024-09-19', 12167, '4000/b01', 'frozen', '1001', '2up', '20.9', 14, 46000, 961400),
(76, '2024-09-19', 12167, '4000/b01', 'frozen', '1001', '1.5up', '16.7', 16, 39000, 651300),
(77, '2024-09-19', 12167, '4000/b01', 'frozen', '1001', '1up', '8.4', 10, 36000, 302400),
(78, '2024-09-19', 12167, '4000/b01', 'frozen', '1020', '2up', '110.6', 0, 25000, 2765000),
(79, '2024-09-19', 12167, '4000/b01', 'frozen', '1020', '3up', '305', 0, 28000, 8540000),
(80, '2024-09-19', 12167, '4000/b01', 'frozen', '1026', 'J', '6.5', 0, 10000, 65000),
(81, '2024-09-19', 12168, '4000/t02', 'frozen', '1001', '3up', '21', 8, 56500, 1186500),
(82, '2024-09-19', 12168, '4000/t02', 'frozen', '1001', '2up', '45.1', 32, 46500, 2097150),
(83, '2024-09-19', 12168, '4000/t02', 'frozen', '1001', '1.5up', '47.7', 47, 39500, 1884150),
(84, '2024-09-19', 12168, '4000/t02', 'frozen', '1001', '1up', '38.5', 48, 36500, 1405250),
(85, '2024-09-19', 12168, '4000/t02', 'frozen', '1002', '3up', '59.2', 24, 46500, 2752800),
(86, '2024-09-19', 12168, '4000/t02', 'frozen', '1002', '2up', '9.9', 7, 44500, 440550),
(87, '2024-09-19', 12168, '4000/t02', 'frozen', '1002', '1.5up', '6.8', 6, 37500, 255000),
(88, '2024-09-20', 12169, '4000/s03', 'frozen', '1031', '18/24', '233.6', 310, 7750, 1810400),
(89, '2024-09-20', 12169, '4000/s03', 'frozen', '1031', '2up', '2053.8', 1110, 8050, 16533090),
(90, '2024-09-20', 12169, '4000/s03', 'frozen', '1031', '3up', '1694.9', 670, 8050, 13643945),
(91, '2024-09-20', 12169, '4000/s03', 'frozen', '1031', '4up', '598.2', 185, 8600, 5144520),
(92, '2024-09-20', 12170, '4000/b01', 'frozen', '1001', '3up', '9.3', 3, 56000, 520800),
(93, '2024-09-20', 12170, '4000/b01', 'frozen', '1001', '2up', '8.3', 5, 46000, 381800),
(94, '2024-09-20', 12170, '4000/b01', 'frozen', '1001', '1.5up', '5.2', 5, 39000, 202800),
(95, '2024-09-20', 12170, '4000/b01', 'frozen', '1001', '1up', '2.6', 3, 36000, 93600),
(96, '2024-09-20', 12170, '4000/b01', 'frozen', '1002', '3/4', '100.45', 33, 46000, 4620700),
(97, '2024-09-20', 12170, '4000/b01', 'frozen', '1002', '2up', '14.7', 9, 43500, 639450),
(98, '2024-09-20', 12170, '4000/b01', 'frozen', '1002', '1.5up', '4.6', 4, 37000, 170200),
(99, '2024-09-20', 12170, '4000/b01', 'frozen', '1020', '3/4', '219.25', 0, 28000, 6139000),
(100, '2024-09-20', 12170, '4000/b01', 'frozen', '1020', '2up', '50', 0, 25000, 1250000),
(101, '2024-09-20', 12171, '4000/a06', 'frozen', '1037', '1/2', '27.3', 0, 23500, 641550),
(102, '2024-09-20', 12171, '4000/a06', 'frozen', '1037', '1D', '19', 0, 13500, 256500),
(103, '2024-09-20', 12171, '4000/a06', 'frozen', '1015', '3/5', '15.7', 0, 28000, 439600),
(104, '2024-09-20', 12172, '4000/m09', 'frozen', '1004', 'J', '425.25', 0, 16000, 6804000),
(105, '2024-09-21', 12173, '4000/t11', 'frozen', '1015', '5/8', '211.5', 0, 48000, 10152000),
(106, '2024-09-21', 12174, '4000/s04', 'frozen', '1027', '1up', '3.55', 0, 14000, 49700),
(107, '2024-09-21', 12175, '4000/k10', 'frozen', '1015', '3/5', '139.5', 0, 28000, 3906000),
(108, '2024-09-21', 12176, '4000/k07', 'frozen', '1037', '1/2', '56.8', 0, 23500, 1334800),
(109, '2024-09-21', 12176, '4000/k07', 'frozen', '1037', '80up', '360.2', 0, 13500, 4862700),
(110, '2024-09-21', 12177, '4000/b01', 'frozen', '1001', '3up', '14.65', 5, 56000, 820400),
(111, '2024-09-21', 12177, '4000/b01', 'frozen', '1001', '2up', '13.5', 9, 46000, 621000),
(112, '2024-09-21', 12177, '4000/b01', 'frozen', '1001', '1.5up', '13', 11, 39000, 507000),
(113, '2024-09-21', 12177, '4000/b01', 'frozen', '1001', '1up', '11.7', 12, 36000, 421200),
(114, '2024-09-21', 12177, '4000/b01', 'frozen', '1002', '3/4', '70.65', 27, 46000, 3249900),
(115, '2024-09-21', 12177, '4000/b01', 'frozen', '1002', '2up', '49.1', 31, 43500, 2135850),
(116, '2024-09-21', 12177, '4000/b01', 'frozen', '1002', '1.5up', '12.2', 10, 37000, 451400),
(117, '2024-09-21', 12177, '4000/b01', 'frozen', '1026', '8/10', '31.7', 0, 10200, 323340),
(118, '2024-09-21', 12177, '4000/b01', 'frozen', '1020', '3/4', '39.7', 0, 28000, 1111600),
(119, '2024-09-21', 12177, '4000/b01', 'frozen', '1020', '2up', '19.5', 0, 25000, 487500),
(120, '2024-09-21', 12178, '4000/n04', 'frozen', '1001', '3up', '2', 1, 49000, 98000),
(121, '2024-09-21', 12178, '4000/n04', 'frozen', '1001', '2up', '5.7', 4, 38000, 216600),
(122, '2024-09-21', 12178, '4000/n04', 'frozen', '1001', '1.5up', '6', 6, 29000, 174000),
(123, '2024-09-21', 12178, '4000/n04', 'frozen', '1001', '1up', '16.2', 21, 28000, 453600),
(124, '2024-09-21', 12178, '4000/n04', 'frozen', '1002', '3up', '22.6', 8, 39000, 881400),
(125, '2024-09-21', 12178, '4000/n04', 'frozen', '1002', '2up', '12.4', 8, 36000, 446400),
(126, '2024-09-21', 12178, '4000/n04', 'frozen', '1002', '1.5up', '5.7', 5, 25000, 142500),
(127, '2024-09-21', 12179, '4000/t07', 'frozen', '1004', 'J', '275', 0, 17000, 4675000),
(128, '2024-09-21', 12180, '4000/s03', 'frozen', '1031', '4up', '3216.1', 790, 8600, 27658460),
(129, '2024-09-21', 12180, '4000/s03', 'frozen', '1031', '3up', '15.8', 8, 8200, 129560),
(130, '2024-09-22', 12181, '4000/t11', 'frozen', '1015', '3/5', '25.9', 112, 29000, 751100),
(131, '2024-09-22', 12181, '4000/t11', 'frozen', '1015', '5/8', '406.1', 1055, 48000, 19492800),
(132, '2024-09-22', 12181, '4000/t11', 'frozen', '1015', '10/12', '15.4', 23, 62000, 954800),
(133, '2024-09-22', 12182, '4000/t02', 'frozen', '1001', '3up', '30', 13, 57000, 1710000),
(134, '2024-09-22', 12182, '4000/t02', 'frozen', '1001', '2up', '16.2', 12, 47000, 761400),
(135, '2024-09-22', 12182, '4000/t02', 'frozen', '1001', '1.5up', '25.8', 23, 39500, 1019100),
(136, '2024-09-22', 12182, '4000/t02', 'frozen', '1001', '1up', '26.2', 36, 36500, 956300),
(137, '2024-09-22', 12182, '4000/t02', 'frozen', '1001', '1D', '9', 0, 22000, 198000),
(138, '2024-09-22', 12182, '4000/t02', 'frozen', '1002', '3up', '68.6', 28, 47000, 3224200),
(139, '2024-09-22', 12182, '4000/t02', 'frozen', '1002', '2up', '16.7', 11, 45000, 751500),
(140, '2024-09-22', 12182, '4000/t02', 'frozen', '1002', '1.5up', '10.4', 10, 37500, 390000),
(141, '2024-09-22', 12183, '4000/b01', 'frozen', '1001', '3up', '12.5', 6, 56000, 700000),
(142, '2024-09-22', 12183, '4000/b01', 'frozen', '1001', '2up', '9.2', 6, 46000, 423200),
(143, '2024-09-22', 12183, '4000/b01', 'frozen', '1001', '15/20', '8', 7, 39000, 312000),
(144, '2024-09-22', 12183, '4000/b01', 'frozen', '1001', '1up', '4.1', 5, 36000, 147600),
(145, '2024-09-22', 12183, '4000/b01', 'frozen', '1002', '4up', '49.75', 16, 46000, 2288500),
(146, '2024-09-22', 12183, '4000/b01', 'frozen', '1002', '2up', '4.6', 3, 43500, 200100),
(147, '2024-09-22', 12183, '4000/b01', 'frozen', '1020', '3up', '29.25', 10, 28000, 819000),
(148, '2024-09-22', 12183, '4000/b01', 'frozen', '1020', '2up', '10.4', 6, 25000, 260000),
(149, '2024-09-22', 12184, '4000/t07', 'frozen', '1004', 'J', '159.55', 0, 17000, 2712350),
(150, '2024-09-22', 12185, '4000/k15', 'frozen', '1015', '3/5', '92.8', 450, 28000, 2598400),
(151, '2024-09-22', 12186, '4000/t01', 'frozen', '1015', '3/5', '138.6', 0, 28000, 3880800),
(152, '2024-09-22', 12186, '4000/t01', 'frozen', '1015', '5/8', '258', 0, 48000, 12384000),
(153, '2024-09-22', 12186, '4000/t01', 'frozen', '1015', '10/12', '202.7', 0, 62000, 12567400),
(154, '2024-09-22', 12186, '4000/t01', 'frozen', '1015', '5/8D', '10.2', 0, 46500, 474300),
(155, '2024-09-22', 12186, '4000/t01', 'frozen', '1015', '10/12D', '27.4', 0, 60500, 1657700),
(156, '2024-09-22', 12187, '4000/s06', 'frozen', '1004', 'J', '46.3', 0, 15500, 717650),
(157, '2024-09-22', 12188, '4000/a03', 'frozen', '1015', '3/5', '274.95', 0, 28000, 7698600),
(158, '2024-09-22', 12188, '4000/a03', 'frozen', '1037', '1/2', '49.2', 0, 25000, 1230000),
(159, '2024-09-22', 12188, '4000/a03', 'frozen', '1037', '8/10', '33', 0, 15000, 495000),
(160, '2024-09-23', 12189, '4000/b01', 'frozen', '1002', '4up', '29.1', 10, 46000, 1338600),
(161, '2024-09-23', 12189, '4000/b01', 'frozen', '1002', '2up', '20.5', 13, 43500, 891750),
(162, '2024-09-23', 12189, '4000/b01', 'frozen', '1002', '1.5up', '2.2', 2, 37000, 81400),
(163, '2024-09-23', 12189, '4000/b01', 'frozen', '1001', '3up', '10.9', 5, 56000, 610400),
(164, '2024-09-23', 12189, '4000/b01', 'frozen', '1001', '2up', '11.3', 7, 46000, 519800),
(165, '2024-09-23', 12189, '4000/b01', 'frozen', '1001', '1.5up', '12', 10, 39000, 468000),
(166, '2024-09-23', 12189, '4000/b01', 'frozen', '1030', 'J', '262.4', 0, 23500, 6166400),
(167, '2024-09-23', 12190, '4000/p02', 'frozen', '1006', 'pcs', '2500', 0, 3800, 9500000),
(168, '2024-09-23', 12191, '4000/s03', 'frozen', '1031', '2up', '144.3', 0, 8200, 1183260),
(169, '2024-09-23', 12191, '4000/s03', 'frozen', '1031', '3up', '1325.2', 0, 8200, 10866640),
(170, '2024-09-23', 12191, '4000/s03', 'frozen', '1031', '4up', '2770.6', 0, 8600, 23827160),
(171, '2024-09-23', 12192, '4000/t05', 'frozen', '1023', '3up', '177.3', 0, 14400, 2553120),
(172, '2024-09-23', 12192, '4000/t05', 'frozen', '1023', '4up', '197.1', 0, 16400, 3232440),
(173, '2024-09-23', 12192, '4000/t05', 'frozen', '1023', '5/6', '138.5', 0, 16800, 2326800),
(174, '2024-09-23', 12192, '4000/t05', 'frozen', '1031', '2/3', '827', 0, 8100, 6698700),
(175, '2024-09-23', 12192, '4000/t05', 'frozen', '1031', '4up', '1025.1', 0, 8500, 8713350),
(176, '2024-09-23', 12192, '4000/t05', 'frozen', '1031', '5/6', '3755.4', 0, 8800, 33047520),
(177, '2024-09-24', 12193, '4000/k10', 'frozen', '1015', 'J', '26.3', 0, 31000, 815300),
(178, '2024-09-24', 12194, '4000/t02', 'frozen', '1001', '3up', '30.2', 11, 57000, 1721400),
(179, '2024-09-24', 12194, '4000/t02', 'frozen', '1001', '2up', '21.6', 15, 47000, 1015200),
(180, '2024-09-24', 12194, '4000/t02', 'frozen', '1001', '1.5up', '7.2', 7, 39500, 284400),
(181, '2024-09-24', 12194, '4000/t02', 'frozen', '1001', '1up', '22.8', 29, 36500, 832200),
(182, '2024-09-24', 12194, '4000/t02', 'frozen', '1001', '1D', '8.8', 0, 22000, 193600),
(183, '2024-09-24', 12194, '4000/t02', 'frozen', '1002', '3up', '75.6', 31, 47000, 3553200),
(184, '2024-09-24', 12194, '4000/t02', 'frozen', '1002', '2up', '12.3', 9, 45000, 553500),
(185, '2024-09-24', 12194, '4000/t02', 'frozen', '1002', '1.5up', '17.1', 16, 37500, 641250),
(186, '2024-09-24', 12195, '4000/b01', 'frozen', '1002', '3/4', '97.35', 32, 46000, 4478100),
(187, '2024-09-24', 12195, '4000/b01', 'frozen', '1002', '2up', '33.5', 21, 43500, 1457250),
(188, '2024-09-24', 12195, '4000/b01', 'frozen', '1002', '1.5up', '11.25', 10, 37000, 416250),
(189, '2024-09-24', 12195, '4000/b01', 'frozen', '1001', '3up', '18.6', 6, 56000, 1041600),
(190, '2024-09-24', 12195, '4000/b01', 'frozen', '1001', '2up', '5.6', 4, 46000, 257600),
(191, '2024-09-24', 12195, '4000/b01', 'frozen', '1001', '1.5up', '13.2', 13, 39000, 514800),
(192, '2024-09-24', 12195, '4000/b01', 'frozen', '1001', '1up', '8.4', 10, 36000, 302400),
(193, '2024-09-24', 12195, '4000/b01', 'frozen', '1020', '3/4', '196.95', 0, 29000, 5711550),
(194, '2024-09-24', 12195, '4000/b01', 'frozen', '1020', '2up', '35.7', 0, 26000, 928200),
(195, '2024-09-24', 12196, '4000/a03', 'frozen', '1037', '1/2', '439.3', 0, 25000, 10982500),
(196, '2024-09-24', 12196, '4000/a03', 'frozen', '1037', '8/10', '176', 0, 15000, 2640000),
(197, '2024-09-24', 12197, '4000/a03', 'frozen', '1037', '1/2', '198', 0, 25000, 4950000),
(198, '2024-09-24', 12197, '4000/a03', 'frozen', '1037', '8/10', '164.9', 0, 15000, 2473500),
(199, '2024-09-24', 12198, '4000/y01', 'frozen', '1015', 'J', '33.5', 0, 25000, 837500),
(200, '2024-09-24', 12199, '4000/t03', 'frozen', '1015', '10/12', '56.6', 87, 62000, 3509200),
(201, '2024-09-24', 12200, '4000/s01', 'frozen', '1015', '5/8', '172.8', 450, 48000, 8294400),
(202, '2024-09-24', 12200, '4000/s01', 'frozen', '1015', '10/12', '96.6', 149, 62000, 5989200),
(203, '2024-09-24', 12201, '4000/a14', 'frozen', '1019', 'J', '940', 0, 13000, 12220000),
(204, '2024-09-25', 12202, '4000/a03', 'frozen', '1037', '1/2', '304.9', 0, 25000, 7622500),
(205, '2024-09-25', 12202, '4000/a03', 'frozen', '1037', '8/10', '250.7', 0, 15000, 3760500),
(206, '2024-09-25', 12203, '4000/h01', 'frozen', '1037', '1/2', '28.4', 0, 25000, 710000),
(207, '2024-09-25', 12203, '4000/h01', 'frozen', '1037', '8/10', '63.6', 0, 13500, 858600),
(208, '2024-09-25', 12204, '4000/b01', 'frozen', '1002', '3/4', '47.2', 16, 46000, 2171200),
(209, '2024-09-25', 12204, '4000/b01', 'frozen', '1002', '2up', '12.7', 8, 43500, 552450),
(210, '2024-09-25', 12204, '4000/b01', 'frozen', '1002', '1up', '3.3', 3, 37000, 122100),
(211, '2024-09-25', 12204, '4000/b01', 'frozen', '1001', '3up', '27.5', 11, 56000, 1540000),
(212, '2024-09-25', 12204, '4000/b01', 'frozen', '1001', '2up', '12.8', 8, 46000, 588800),
(213, '2024-09-25', 12204, '4000/b01', 'frozen', '1001', '1.5up', '15.3', 14, 39000, 596700),
(214, '2024-09-25', 12204, '4000/b01', 'frozen', '1001', '1.5up', '5', 6, 36000, 180000),
(215, '2024-09-25', 12204, '4000/b01', 'frozen', '1020', '3/4', '33.5', 0, 29000, 971500),
(216, '2024-09-25', 12204, '4000/b01', 'frozen', '1020', '2up', '12', 0, 26000, 312000),
(217, '2024-09-25', 12205, '4000/a01', 'frozen', '1037', '8/10', '18.3', 0, 13500, 247050),
(218, '2024-09-25', 12205, '4000/a01', 'frozen', '1037', '1/2', '37.9', 0, 25000, 947500),
(219, '2024-09-25', 12205, '4000/a01', 'frozen', '1015', '5/8', '102.7', 261, 47000, 4826900),
(220, '2024-09-25', 12205, '4000/a01', 'frozen', '1015', '10/12', '62', 93, 62000, 3844000),
(221, '2024-09-25', 12206, '4000/s01', 'frozen', '1015', '5/8', '127.5', 337, 48000, 6120000),
(222, '2024-09-25', 12206, '4000/s01', 'frozen', '1015', '10/12', '46.5', 69, 62000, 2883000),
(223, '2024-09-26', 12207, '4000/a14', 'frozen', '1019', 'J', '337.8', 0, 13000, 4391400),
(224, '2024-09-26', 12208, '4000/a02', 'frozen', '1037', '1/2', '80.4', 0, 25000, 2010000),
(225, '2024-09-26', 12208, '4000/a02', 'frozen', '1027', 'J', '4.9', 0, 14000, 68600),
(226, '2024-09-26', 12209, '4000/s04', 'frozen', '1027', '1up', '27.6', 0, 14000, 386400),
(227, '2024-09-26', 12210, '4000/t02', 'frozen', '1001', '3up', '25.8', 11, 57000, 1470600),
(228, '2024-09-26', 12210, '4000/t02', 'frozen', '1001', '2up', '13.6', 10, 47000, 639200),
(229, '2024-09-26', 12210, '4000/t02', 'frozen', '1001', '1.5up', '13.4', 13, 39500, 529300),
(230, '2024-09-26', 12210, '4000/t02', 'frozen', '1002', '3up', '47.5', 18, 47000, 2232500),
(231, '2024-09-26', 12210, '4000/t02', 'frozen', '1002', '2up', '10', 6, 45000, 450000),
(232, '2024-09-26', 12210, '4000/t02', 'frozen', '1002', '1.5up', '13.8', 13, 37500, 517500),
(233, '2024-09-26', 12211, '4000/n04', 'frozen', '1002', '3up', '44.1', 19, 39000, 1719900),
(234, '2024-09-26', 12211, '4000/n04', 'frozen', '1002', '2up', '19.1', 12, 36000, 687600),
(235, '2024-09-26', 12211, '4000/n04', 'frozen', '1002', '1.5up', '4.2', 4, 25000, 105000),
(236, '2024-09-26', 12211, '4000/n04', 'frozen', '1001', '3up', '9.4', 3, 49000, 460600),
(237, '2024-09-26', 12211, '4000/n04', 'frozen', '1001', '2up', '2.7', 2, 38000, 102600),
(238, '2024-09-26', 12211, '4000/n04', 'frozen', '1001', '1.5up', '1.8', 2, 29000, 52200),
(239, '2024-09-26', 12211, '4000/n04', 'frozen', '1001', '1up', '9.8', 14, 28000, 274400),
(240, '2024-09-26', 12212, '4000/s01', 'frozen', '1015', '5/8', '131.5', 330, 48000, 6312000),
(241, '2024-09-26', 12212, '4000/s01', 'frozen', '1015', '10/12', '18.8', 27, 62000, 1165600),
(242, '2024-09-26', 12212, '4000/s01', 'frozen', '1015', '12/15', '10.5', 12, 72000, 756000),
(243, '2024-09-26', 12213, '4000/b01', 'frozen', '1002', '3/4', '40.1', 14, 46000, 1844600),
(244, '2024-09-26', 12213, '4000/b01', 'frozen', '1002', '2up', '20.5', 12, 43500, 891750),
(245, '2024-09-26', 12213, '4000/b01', 'frozen', '1002', '1up', '4.7', 4, 37000, 173900),
(246, '2024-09-26', 12213, '4000/b01', 'frozen', '1001', '3up', '22.8', 9, 56000, 1276800),
(247, '2024-09-26', 12213, '4000/b01', 'frozen', '1001', '2up', '16.4', 11, 46000, 754400),
(248, '2024-09-26', 12213, '4000/b01', 'frozen', '1001', '1.5up', '21.75', 20, 39000, 848250),
(249, '2024-09-26', 12213, '4000/b01', 'frozen', '1001', '1up', '11.7', 14, 36000, 421200),
(250, '2024-09-26', 12213, '4000/b01', 'frozen', '1020', '3/4', '42.1', 0, 29000, 1220900),
(251, '2024-09-26', 12213, '4000/b01', 'frozen', '1020', '2up', '7', 0, 26000, 182000),
(252, '2024-09-26', 12214, '4000/k07', 'frozen', '1037', '1/2', '71.4', 0, 23500, 1677900),
(253, '2024-09-26', 12214, '4000/k07', 'frozen', '1037', '8/10', '489.3', 0, 13500, 6605550),
(254, '2024-09-25', 12215, '4000/k07', 'frozen', '1037', '1/2', '120', 0, 23500, 2820000),
(255, '2024-09-25', 12215, '4000/k07', 'frozen', '1037', '80up', '193', 0, 13500, 2605500),
(256, '2024-09-27', 12216, '4000/a03', 'frozen', '1037', '1/2', '280.2', 0, 25000, 7005000),
(257, '2024-09-27', 12216, '4000/a03', 'frozen', '1037', '8/10', '106.9', 0, 15000, 1603500),
(258, '2024-09-27', 12217, '4000/t07', 'frozen', '1004', 'J', '214.7', 0, 17500, 3757250),
(259, '2024-09-27', 12218, '4000/b01', 'frozen', '1002', '3/4', '133.25', 41, 46000, 6129500),
(260, '2024-09-27', 12218, '4000/b01', 'frozen', '1002', '2up', '30.5', 20, 43500, 1326750),
(261, '2024-09-27', 12218, '4000/b01', 'frozen', '1002', '1up', '7', 6, 37000, 259000),
(262, '2024-09-27', 12218, '4000/b01', 'frozen', '1001', '3up', '19.2', 8, 56000, 1075200),
(263, '2024-09-27', 12218, '4000/b01', 'frozen', '1001', '2up', '20.3', 12, 46000, 933800),
(264, '2024-09-27', 12218, '4000/b01', 'frozen', '1001', '1.5up', '20', 21, 39000, 780000),
(265, '2024-09-27', 12218, '4000/b01', 'frozen', '1001', '1up', '12.8', 15, 36000, 460800),
(266, '2024-09-27', 12219, '4000/k11', 'frozen', '1015', '3/5', '234.6', 1063, 27000, 6334200),
(267, '2024-09-27', 12219, '4000/k11', 'frozen', '1015', '5/8', '28.7', 79, 47000, 1348900),
(268, '2024-09-27', 12220, '4000/t11', 'frozen', '1015', '5/8', '216.1', 569, 48000, 10372800),
(269, '2024-09-27', 12220, '4000/t11', 'frozen', '1015', '5/8D', '32.9', 107, 46500, 1529850),
(270, '2024-09-27', 12220, '4000/t11', 'frozen', '1015', '10/12', '49.8', 75, 62000, 3087600),
(271, '2024-09-27', 12221, '4000/z03', 'frozen', '1002', '3/4', '94.3', 35, 44500, 4196350),
(272, '2024-09-27', 12221, '4000/z03', 'frozen', '1002', '2up', '40', 26, 42500, 1700000),
(273, '2024-09-27', 12221, '4000/z03', 'frozen', '1002', '1.5up', '18.1', 17, 30000, 543000),
(274, '2024-09-27', 12221, '4000/z03', 'frozen', '1002', '1up', '6.5', 8, 30000, 195000),
(275, '2024-09-27', 12221, '4000/z03', 'frozen', '1001', '3up', '63', 29, 55000, 3465000),
(276, '2024-09-27', 12221, '4000/z03', 'frozen', '1001', '2up', '27.25', 17, 45000, 1226250),
(277, '2024-09-27', 12221, '4000/z03', 'frozen', '1001', '1.5up', '24.25', 26, 32000, 776000),
(278, '2024-09-27', 12221, '4000/z03', 'frozen', '1001', '1D', '5.4', 9, 30000, 162000),
(279, '2024-09-28', 12222, '4000/a03', 'frozen', '1037', '8/10', '64.1', 0, 15000, 961500),
(280, '2024-09-28', 12222, '4000/a03', 'frozen', '1037', '1/2', '172.2', 0, 25000, 4305000),
(281, '2024-09-28', 12223, '4000/k07', 'frozen', '1037', '1/2', '2.6', 0, 23500, 61100),
(282, '2024-09-28', 12223, '4000/k07', 'frozen', '1037', '8/10', '31', 0, 13500, 418500),
(283, '2024-09-28', 12224, '4000/n04', 'frozen', '1001', '3up', '24.8', 11, 53000, 1314400),
(284, '2024-09-28', 12224, '4000/n04', 'frozen', '1001', '2up', '14.3', 9, 42000, 600600),
(285, '2024-09-28', 12224, '4000/n04', 'frozen', '1001', '1.5up', '6', 6, 33000, 198000),
(286, '2024-09-28', 12224, '4000/n04', 'frozen', '1001', '1up', '6', 8, 30000, 180000),
(287, '2024-09-28', 12224, '4000/n04', 'frozen', '1002', '3up', '35.2', 13, 43000, 1513600),
(288, '2024-09-28', 12224, '4000/n04', 'frozen', '1002', '2up', '19.2', 12, 41000, 787200),
(289, '2024-09-28', 12224, '4000/n04', 'frozen', '1002', '1.5up', '2', 2, 30000, 60000),
(290, '2024-09-28', 12225, '4000/b01', 'frozen', '1001', '3up', '44.4', 19, 57000, 2530800),
(291, '2024-09-28', 12225, '4000/b01', 'frozen', '1001', '2up', '22', 14, 47000, 1034000),
(292, '2024-09-28', 12225, '4000/b01', 'frozen', '1001', '1.5up', '33.9', 32, 40000, 1356000),
(293, '2024-09-28', 12225, '4000/b01', 'frozen', '1001', '1up', '12.6', 14, 37000, 466200),
(294, '2024-09-28', 12225, '4000/b01', 'frozen', '1002', '3/4', '86.05', 32, 47000, 4044350),
(295, '2024-09-28', 12225, '4000/b01', 'frozen', '1002', '2up', '20.1', 13, 44500, 894450),
(297, '2024-09-28', 12225, '4000/b01', 'frozen', '1002', '1.5up', '12.4', 12, 38000, 471200),
(298, '2024-09-28', 12225, '4000/b01', 'frozen', '1020', '3/4', '139.3', 0, 29000, 4039700),
(299, '2024-09-28', 12225, '4000/b01', 'frozen', '1020', '2up', '19.8', 0, 26000, 514800),
(300, '2024-09-28', 12226, '4000/h01', 'frozen', '1037', '8/10', '69.6', 0, 13500, 939600),
(301, '2024-09-28', 12226, '4000/h01', 'frozen', '1037', '1/2', '88.1', 0, 25000, 2202500),
(302, '2024-09-28', 12227, '4000/s04', 'frozen', '1027', '1up', '88.8', 0, 14000, 1243200),
(303, '2024-09-28', 12228, '4000/t07', 'frozen', '1004', 'J', '224.85', 0, 17500, 3934875),
(304, '2024-09-28', 12229, '4000/t02', 'frozen', '1001', '3up', '19.2', 7, 57000, 1094400),
(305, '2024-09-28', 12229, '4000/t02', 'frozen', '1001', '2up', '21', 19, 47000, 987000),
(306, '2024-09-28', 12229, '4000/t02', 'frozen', '1001', '1.5up', '10.4', 8, 39500, 410800),
(307, '2024-09-28', 12229, '4000/t02', 'frozen', '1001', '1up', '22.3', 28, 37000, 825100),
(308, '2024-09-28', 12229, '4000/t02', 'frozen', '1002', '3up', '49.7', 18, 47000, 2335900),
(309, '2024-09-28', 12229, '4000/t02', 'frozen', '1002', '2up', '13.3', 10, 45000, 598500),
(310, '2024-09-28', 12229, '4000/t02', 'frozen', '1002', '1.5up', '8.1', 8, 37500, 303750),
(311, '2024-09-29', 12230, '4000/a14', 'frozen', '1019', 'J', '959.4', 0, 13000, 12472200),
(312, '2024-09-29', 12231, '4000/t07', 'frozen', '1004', 'J', '384.85', 0, 17500, 6734875),
(313, '2024-09-29', 12231, '4000/t07', 'frozen', '1030', 'J', '154', 0, 22000, 3388000),
(314, '2024-09-29', 12232, '4000/k15', 'frozen', '1015', '4/5', '93.1', 0, 33000, 3072300),
(315, '2024-09-29', 12233, '4000/b01', 'frozen', '1001', '3up', '25.4', 10, 57000, 1447800),
(316, '2024-09-29', 12233, '4000/b01', 'frozen', '1001', '2up', '26.8', 17, 47000, 1259600),
(317, '2024-09-29', 12233, '4000/b01', 'frozen', '1001', '1.5up', '28', 22, 40000, 1120000),
(318, '2024-09-29', 12233, '4000/b01', 'frozen', '1001', '1up', '7.2', 1, 37000, 266400),
(319, '2024-09-29', 12233, '4000/b01', 'frozen', '1002', '3/4', '116.3', 39, 47000, 5466100),
(320, '2024-09-29', 12233, '4000/b01', 'frozen', '1002', '2up', '15.8', 10, 44500, 703100),
(321, '2024-09-29', 12233, '4000/b01', 'frozen', '1002', '1.5up', '12.3', 11, 38000, 467400),
(322, '2024-09-29', 12233, '4000/b01', 'frozen', '1020', '3up', '144.9', 0, 29000, 4202100),
(323, '2024-09-29', 12233, '4000/b01', 'frozen', '1020', '2up', '14.8', 0, 26000, 384800),
(324, '2024-09-29', 12234, '4000/t11', 'frozen', '1015', '5/8', '285.2', 774, 48000, 13689600),
(325, '2024-09-29', 12234, '4000/t11', 'frozen', '1015', '5/8D', '13.3', 43, 46500, 618450),
(326, '2024-09-29', 12234, '4000/t11', 'frozen', '1015', '10/12', '49', 75, 62000, 3038000),
(327, '2024-09-30', 12235, '4000/k15', 'frozen', '1015', '4/5', '56.5', 211, 33000, 1864500),
(328, '2024-09-30', 12235, '4000/k15', 'frozen', '1015', 'J', '20.8', 0, 31000, 644800),
(329, '2024-09-30', 12236, '4000/n04', 'frozen', '1002', '3up', '53.6', 22, 43000, 2304800),
(330, '2024-09-30', 12236, '4000/n04', 'frozen', '1002', '2up', '23.8', 18, 41000, 975800),
(331, '2024-09-30', 12236, '4000/n04', 'frozen', '1002', '1.5up', '7', 6, 30000, 210000),
(332, '2024-09-30', 12236, '4000/n04', 'frozen', '1001', '3up', '19.3', 8, 53000, 1022900),
(333, '2024-09-30', 12236, '4000/n04', 'frozen', '1001', '2up', '10.7', 7, 42000, 449400),
(334, '2024-09-30', 12236, '4000/n04', 'frozen', '1001', '1.5up', '3.9', 4, 33000, 128700),
(335, '2024-09-30', 12236, '4000/n04', 'frozen', '1001', '1up', '16.9', 23, 30000, 507000),
(336, '2024-09-30', 12237, '4000/b01', 'frozen', '1017', '7up', '480.1', 0, 9500, 4560950),
(337, '2024-09-30', 12237, '4000/b01', 'frozen', '1001', '3up', '25.4', 0, 57000, 1447800),
(338, '2024-09-30', 12237, '4000/b01', 'frozen', '1001', '2up', '19.5', 0, 47000, 916500),
(339, '2024-09-30', 12237, '4000/b01', 'frozen', '1001', '1.5up', '21.3', 0, 40000, 852000),
(340, '2024-09-30', 12237, '4000/b01', 'frozen', '1001', '1up', '4', 0, 37000, 148000),
(341, '2024-09-30', 12237, '4000/b01', 'frozen', '1002', '3/4', '103.3', 0, 47000, 4855100),
(342, '2024-09-30', 12237, '4000/b01', 'frozen', '1002', '2up', '33', 0, 44500, 1468500),
(343, '2024-09-30', 12237, '4000/b01', 'frozen', '1002', '1.5up', '20.3', 0, 38000, 771400),
(344, '2024-09-30', 12237, '4000/b01', 'frozen', '1020', '3/4', '63.7', 0, 29000, 1847300),
(345, '2024-09-30', 12237, '4000/b01', 'frozen', '1020', '2up', '30.9', 0, 26000, 803400),
(346, '2024-09-30', 12238, '4000/t02', 'frozen', '1001', '3up', '28.2', 14, 57000, 1607400),
(347, '2024-09-30', 12238, '4000/t02', 'frozen', '1001', '2up', '49.5', 35, 47000, 2326500),
(348, '2024-09-30', 12238, '4000/t02', 'frozen', '1001', '1.5up', '41.3', 42, 39500, 1631350),
(349, '2024-09-30', 12238, '4000/t02', 'frozen', '1001', '1up', '51.8', 73, 37000, 1916600),
(350, '2024-09-30', 12238, '4000/t02', 'frozen', '1001', '1D', '25', 0, 22000, 550000),
(351, '2024-09-30', 12238, '4000/t02', 'frozen', '1002', '3up', '50.4', 22, 47000, 2368800),
(352, '2024-09-30', 12238, '4000/t02', 'frozen', '1002', '2up', '18.3', 14, 45000, 823500),
(353, '2024-09-30', 12238, '4000/t02', 'frozen', '1002', '1.5up', '23', 20, 37500, 862500),
(354, '2024-09-30', 12239, '4000/t05', 'frozen', '1023', '2up', '13.3', 7, 12300, 163590),
(355, '2024-09-30', 12239, '4000/t05', 'frozen', '1023', '3up', '669.4', 296, 14300, 9572420),
(356, '2024-09-30', 12239, '4000/t05', 'frozen', '1023', '4up', '477.1', 174, 16300, 7776730),
(357, '2024-09-30', 12239, '4000/t05', 'frozen', '1023', '5up', '304.4', 90, 16600, 5053040),
(358, '2024-09-30', 12239, '4000/t05', 'frozen', '1031', '3up', '112.5', 40, 8200, 922500),
(359, '2024-09-30', 12239, '4000/t05', 'frozen', '1031', '4up', '2023', 648, 8500, 17195500),
(360, '2024-09-30', 12239, '4000/t05', 'frozen', '1031', '5up', '968.6', 255, 8800, 8523680),
(361, '2024-09-30', 157, '4000/t15', 'tcl', '1031', '2up', '1011.25', 0, 8200, 8292250),
(362, '2024-09-30', 157, '4000/t15', 'tcl', '1031', '3up', '2160.25', 0, 8200, 17714050),
(363, '2024-09-30', 157, '4000/t15', 'tcl', '1017', '7up', '98.75', 0, 8700, 859125),
(364, '2024-09-30', 158, '4000/t15', 'tcl', '1031', '3up', '917.25', 0, 8200, 7521450),
(365, '2024-09-30', 158, '4000/t15', 'tcl', '1017', '7up', '474.25', 0, 8900, 4220825),
(366, '2024-09-30', 12240, '4000/t07', 'frozen', '1030', 'J', '63.25', 0, 22000, 1391500),
(367, '2024-10-01', 12241, '4000/t07', 'frozen', '1030', 'J', '46.75', 0, 22000, 1028500),
(368, '2024-10-01', 12241, '4000/t07', 'frozen', '1004', 'J', '108.3', 0, 17500, 1895250),
(369, '2024-10-01', 12242, '4000/a03', 'frozen', '1037', '80/110', '44.8', 0, 15000, 672000),
(370, '2024-10-01', 12242, '4000/a03', 'frozen', '1037', '110/210', '40.1', 0, 25000, 1002500),
(371, '2024-10-01', 12243, '4000/s01', 'frozen', '1015', '5/8', '73', 0, 48000, 3504000),
(372, '2024-10-01', 12244, '4000/b01', 'frozen', '1001', '3up', '29.4', 16, 57000, 1675800),
(373, '2024-10-01', 12244, '4000/b01', 'frozen', '1001', '2up', '30', 20, 47000, 1410000),
(374, '2024-10-01', 12244, '4000/b01', 'frozen', '1001', '1.5up', '23.4', 0, 40000, 936000),
(375, '2024-10-01', 12244, '4000/b01', 'frozen', '1001', '1up', '5', 6, 37000, 185000),
(376, '2024-10-01', 12244, '4000/b01', 'frozen', '1002', '3/4', '103.9', 31, 47000, 4883300),
(377, '2024-10-01', 12244, '4000/b01', 'frozen', '1002', '2up', '51.2', 34, 44500, 2278400),
(378, '2024-10-01', 12244, '4000/b01', 'frozen', '1002', '1.5up', '10', 9, 38000, 380000),
(379, '2024-10-01', 12244, '4000/b01', 'frozen', '1020', '3/4', '79.3', 0, 29000, 2299700),
(380, '2024-10-01', 12244, '4000/b01', 'frozen', '1020', '2up', '41.1', 0, 26000, 1068600),
(381, '2024-10-01', 12245, '4000/k03', 'frozen', '1027', 'J', '236.9', 0, 14000, 3316600),
(382, '2024-10-01', 159, '4000/b01', 'tcl', '1017', '7up', '478.95', 0, 9700, 4645815),
(383, '2024-10-02', 12246, '4000/t05', 'frozen', '1031', '4up', '73.6', 0, 8500, 625600),
(384, '2024-10-02', 12246, '4000/t05', 'frozen', '1031', '5up', '1023.2', 0, 8800, 9004160),
(385, '2024-10-02', 12246, '4000/t05', 'frozen', '1023', '3up', '5', 0, 14300, 71500),
(386, '2024-10-02', 12246, '4000/t05', 'frozen', '1023', '4up', '282.4', 0, 16300, 4603120),
(387, '2024-10-02', 12246, '4000/t05', 'frozen', '1023', '5up', '121.3', 0, 16600, 2013580),
(388, '2024-10-02', 12247, '4000/s04', 'frozen', '1015', '5/8', '88.7', 220, 48000, 4257600),
(389, '2024-10-02', 12247, '4000/s04', 'frozen', '1015', '10/12', '35.4', 59, 62000, 2194800),
(390, '2024-10-02', 12248, '4000/t01', 'frozen', '1015', '5/8', '76.4', 175, 48000, 3667200),
(391, '2024-10-02', 12248, '4000/t01', 'frozen', '1015', '10/12', '149.25', 215, 62000, 9253500),
(392, '2024-10-02', 12249, '4000/a03', 'frozen', '1037', '1/2', '18.7', 0, 25000, 467500),
(393, '2024-10-02', 12249, '4000/a03', 'frozen', '1037', '8/10', '13.3', 0, 15000, 199500),
(394, '2024-10-02', 12250, '4000/t07', 'frozen', '1004', 'J', '74.5', 0, 17500, 1303750),
(395, '2024-10-02', 12251, '4000/z03', 'frozen', '1002', '3/4', '121.25', 50, 44500, 5395625),
(396, '2024-10-02', 12251, '4000/z03', 'frozen', '1002', '2up', '54.5', 38, 42500, 2316250),
(397, '2024-10-02', 12251, '4000/z03', 'frozen', '1002', '1.5up', '36.5', 45, 30000, 1095000),
(398, '2024-10-02', 12251, '4000/z03', 'frozen', '1002', '1up', '7.25', 0, 30000, 217500),
(399, '2024-10-02', 12251, '4000/z03', 'frozen', '1001', '3up', '19.75', 10, 55000, 1086250),
(400, '2024-10-02', 12251, '4000/z03', 'frozen', '1001', '2up', '48', 35, 45000, 2160000),
(401, '2024-10-02', 12251, '4000/z03', 'frozen', '1001', '1.5up', '54.25', 53, 32000, 1736000),
(402, '2024-10-02', 12251, '4000/z03', 'frozen', '1001', '1up', '7.5', 12, 30000, 225000),
(403, '2024-10-02', 12252, '4000/t11', 'frozen', '1015', '5/8', '168.7', 426, 48000, 8097600),
(404, '2024-10-02', 12253, '4000/b01', 'frozen', '1002', '3/4', '27.7', 10, 47000, 1301900),
(405, '2024-10-02', 12253, '4000/b01', 'frozen', '1002', '2up', '3', 2, 44500, 133500),
(406, '2024-10-02', 12253, '4000/b01', 'frozen', '1002', '1.5up', '8.7', 8, 38000, 330600),
(407, '2024-10-02', 12253, '4000/b01', 'frozen', '1001', '3up', '18.6', 8, 57000, 1060200),
(408, '2024-10-02', 12253, '4000/b01', 'frozen', '1001', '2up', '12.8', 8, 47000, 601600),
(409, '2024-10-02', 12253, '4000/b01', 'frozen', '1001', '1.5up', '11.75', 11, 40000, 470000),
(410, '2024-10-02', 12253, '4000/b01', 'frozen', '1001', '1up', '4.8', 6, 37000, 177600),
(411, '2024-10-02', 12253, '4000/b01', 'frozen', '1020', '3/4', '99.75', 0, 29000, 2892750),
(412, '2024-10-02', 12253, '4000/b01', 'frozen', '1020', '2up', '4.8', 0, 26000, 124800),
(413, '2024-10-02', 12254, '4000/a01', 'frozen', '1027', '1up', '71.1', 0, 15000, 1066500),
(414, '2024-10-02', 12254, '4000/a01', 'frozen', '1027', '1up', '4.3', 0, 15000, 64500),
(415, '2024-10-02', 12255, '4000/n04', 'frozen', '1002', '3up', '40.2', 17, 43000, 1728600),
(416, '2024-10-02', 12255, '4000/n04', 'frozen', '1002', '2up', '15', 9, 41000, 615000),
(417, '2024-10-02', 12255, '4000/n04', 'frozen', '1001', '3up', '15.2', 6, 53000, 805600),
(418, '2024-10-02', 12255, '4000/n04', 'frozen', '1001', '2up', '9.1', 6, 42000, 382200),
(419, '2024-10-02', 12255, '4000/n04', 'frozen', '1001', '1.5up', '4', 4, 33000, 132000),
(420, '2024-10-02', 12255, '4000/n04', 'frozen', '1001', '1up', '15.4', 22, 30000, 462000),
(421, '2024-10-02', 12256, '4000/w03', 'frozen', '1025', 'J', '344.6', 0, 3800, 1309480),
(422, '2024-10-03', 12257, '4000/t05', 'frozen', '1023', '4up', '596.4', 0, 16300, 9721320),
(423, '2024-10-03', 12257, '4000/t05', 'frozen', '1023', '5up', '256.8', 0, 16600, 4262880),
(424, '2024-10-03', 12257, '4000/t05', 'frozen', '1031', '4up', '33.1', 0, 8500, 281350),
(425, '2024-10-03', 12257, '4000/t05', 'frozen', '1031', '5up', '327.3', 0, 8800, 2880240),
(426, '2024-10-03', 12258, '4000/t11', 'frozen', '1015', '5/8', '223.3', 554, 48000, 10718400),
(427, '2024-10-03', 12258, '4000/t11', 'frozen', '1015', '5/8D', '61.5', 200, 46500, 2859750),
(428, '2024-10-03', 12258, '4000/t11', 'frozen', '1015', '10/12', '13.3', 20, 62000, 824600),
(429, '2024-10-03', 12259, '4000/a03', 'frozen', '1037', '1/2', '7.2', 0, 25000, 180000),
(430, '2024-10-03', 12259, '4000/a03', 'frozen', '1037', '8/10', '61.7', 0, 15000, 925500),
(431, '2024-10-03', 12259, '4000/a03', 'frozen', '1037', '1/2', '36.7', 0, 25000, 917500),
(432, '2024-10-03', 12259, '4000/a03', 'frozen', '1037', '8/10', '18.7', 0, 15000, 280500),
(433, '2024-10-03', 12260, '4000/s04', 'frozen', '1027', '1up', '65.6', 0, 14000, 918400),
(434, '2024-10-03', 12261, '4000/b01', 'frozen', '1002', '3/4', '64.55', 0, 47000, 3033850),
(435, '2024-10-03', 12261, '4000/b01', 'frozen', '1002', '2up', '22', 0, 44500, 979000),
(436, '2024-10-03', 12261, '4000/b01', 'frozen', '1002', '1.5up', '4.3', 0, 38000, 163400),
(437, '2024-10-03', 12261, '4000/b01', 'frozen', '1001', '3up', '8.5', 0, 57000, 484500),
(438, '2024-10-03', 12261, '4000/b01', 'frozen', '1001', '2up', '8', 0, 47000, 376000),
(439, '2024-10-03', 12261, '4000/b01', 'frozen', '1001', '1.5up', '9.2', 0, 40000, 368000),
(440, '2024-10-03', 12261, '4000/b01', 'frozen', '1020', '3/4', '73.1', 0, 29000, 2119900),
(441, '2024-10-03', 12261, '4000/b01', 'frozen', '1020', '2up', '14.7', 0, 26000, 382200),
(442, '2024-10-03', 12262, '4000/t02', 'frozen', '1001', '3up', '13.4', 6, 58000, 777200),
(443, '2024-10-03', 12262, '4000/t02', 'frozen', '1001', '2up', '22.9', 15, 48000, 1099200),
(444, '2024-10-03', 12262, '4000/t02', 'frozen', '1001', '1.5up', '12.1', 12, 40000, 484000),
(445, '2024-10-03', 12262, '4000/t02', 'frozen', '1001', '1D', '12.7', 0, 23000, 292100),
(446, '2024-10-03', 12262, '4000/t02', 'frozen', '1002', '3up', '83.6', 34, 48000, 4012800),
(447, '2024-10-03', 12262, '4000/t02', 'frozen', '1002', '2up', '28', 20, 46000, 1288000),
(448, '2024-10-03', 12262, '4000/t02', 'frozen', '1002', '1.5up', '43.5', 42, 38000, 1653000),
(449, '2024-10-04', 12263, '4000/t05', 'frozen', '1031', '4up', '26.8', 0, 8500, 227800),
(450, '2024-10-04', 12263, '4000/t05', 'frozen', '1031', '5up', '1422.8', 0, 8800, 12520640),
(451, '2024-10-04', 12263, '4000/t05', 'frozen', '1023', '4up', '181.9', 0, 16300, 2964970),
(452, '2024-10-04', 12263, '4000/t05', 'frozen', '1023', '5up', '102.2', 0, 16600, 1696520),
(453, '2024-10-04', 12264, '4000/n04', 'frozen', '1002', '3up', '49.4', 19, 43000, 2124200),
(454, '2024-10-04', 12264, '4000/n04', 'frozen', '1002', '2up', '9', 6, 41000, 369000),
(455, '2024-10-04', 12264, '4000/n04', 'frozen', '1001', '3up', '9.4', 4, 53000, 498200),
(456, '2024-10-04', 12264, '4000/n04', 'frozen', '1001', '2up', '5.6', 4, 42000, 235200),
(457, '2024-10-04', 12265, '4000/b01', 'frozen', '1002', '3/4', '38.2', 15, 47000, 1795400),
(458, '2024-10-04', 12265, '4000/b01', 'frozen', '1002', '2up', '11.4', 7, 44500, 507300),
(459, '2024-10-04', 12265, '4000/b01', 'frozen', '1001', '3up', '27', 12, 57000, 1539000),
(460, '2024-10-04', 12265, '4000/b01', 'frozen', '1001', '2up', '20', 13, 47000, 940000),
(461, '2024-10-04', 12265, '4000/b01', 'frozen', '1020', '3/4', '14.5', 0, 29000, 420500),
(462, '2024-10-04', 12265, '4000/b01', 'frozen', '1020', '2up', '28.8', 0, 26000, 748800),
(463, '2024-10-04', 12266, '4000/s04', 'frozen', '1015', '5/8', '83.4', 149, 48000, 4003200),
(464, '2024-10-04', 12266, '4000/s04', 'frozen', '1015', '10/12', '31.4', 47, 62000, 1946800),
(465, '2024-10-04', 12267, '4000/t11', 'frozen', '1015', '5/8', '564.7', 1422, 48000, 27105600),
(466, '2024-10-04', 12267, '4000/t11', 'frozen', '1015', '10/12', '36.9', 55, 62000, 2287800),
(467, '2024-10-04', 12268, '4000/a03', 'frozen', '1037', '80/110', '73.4', 0, 15000, 1101000),
(468, '2024-10-04', 12269, '4000/a14', 'frozen', '1019', 'J', '1251.5', 0, 13000, 16269500),
(469, '2024-10-05', 12270, '4000/t05', 'frozen', '1031', '4up', '24.9', 0, 8500, 211650),
(470, '2024-10-05', 12270, '4000/t05', 'frozen', '1031', '5up', '252.8', 0, 8800, 2224640),
(471, '2024-10-05', 12270, '4000/t05', 'frozen', '1023', '3up', '2.4', 0, 14300, 34320),
(472, '2024-10-05', 12270, '4000/t05', 'frozen', '1023', '4up', '687.5', 0, 16300, 11206250),
(473, '2024-10-05', 12270, '4000/t05', 'frozen', '1023', '5up', '375.7', 0, 16600, 6236620),
(474, '2024-10-05', 12271, '4000/b01', 'frozen', '1002', '3/4', '37.4', 10, 47000, 1757800),
(475, '2024-10-05', 12271, '4000/b01', 'frozen', '1002', '2up', '6.2', 4, 44500, 275900),
(476, '2024-10-05', 12271, '4000/b01', 'frozen', '1001', '3up', '15.3', 4, 57000, 872100),
(477, '2024-10-05', 12271, '4000/b01', 'frozen', '1001', '2up', '18.4', 12, 47000, 864800),
(478, '2024-10-05', 12271, '4000/b01', 'frozen', '1020', '3/4', '64.4', 0, 29000, 1867600),
(479, '2024-10-05', 12271, '4000/b01', 'frozen', '1020', '2up', '17', 0, 26000, 442000),
(480, '2024-10-05', 12272, '4000/t02', 'frozen', '1001', '3up', '20.4', 8, 59000, 1203600),
(481, '2024-10-05', 12272, '4000/t02', 'frozen', '1001', '2up', '26.1', 18, 49000, 1278900),
(482, '2024-10-05', 12272, '4000/t02', 'frozen', '1001', '1D', '21', 0, 23000, 483000),
(483, '2024-10-05', 12272, '4000/t02', 'frozen', '1002', '3up', '62.3', 26, 49000, 3052700),
(484, '2024-10-05', 12272, '4000/t02', 'frozen', '1002', '2up', '22.1', 14, 47000, 1038700),
(485, '2024-10-05', 12273, '4000/b01', 'frozen', '1002', '3/4', '68.6', 22, 47000, 3224200),
(486, '2024-10-05', 12273, '4000/b01', 'frozen', '1002', '2up', '18.5', 11, 44500, 823250),
(487, '2024-10-05', 12273, '4000/b01', 'frozen', '1001', '3up', '23', 9, 57000, 1311000),
(488, '2024-10-05', 12273, '4000/b01', 'frozen', '1001', '2up', '29.25', 19, 47000, 1374750),
(489, '2024-10-05', 12273, '4000/b01', 'frozen', '1020', '3/4', '64.5', 0, 29000, 1870500),
(490, '2024-10-05', 12273, '4000/b01', 'frozen', '1020', '2up', '8.2', 0, 26000, 213200),
(491, '2024-10-05', 12274, '4000/t07', 'frozen', '1004', 'J', '241.4', 0, 17500, 4224500),
(492, '2024-10-07', 12275, '4000/t05', 'frozen', '1031', '4up', '136.6', 45, 8500, 1161100),
(493, '2024-10-07', 12275, '4000/t05', 'frozen', '1031', '5up', '1389.2', 351, 8800, 12224960),
(494, '2024-10-07', 12275, '4000/t05', 'frozen', '1023', '4up', '440.6', 155, 16300, 7181780),
(495, '2024-10-07', 12275, '4000/t05', 'frozen', '1023', '5up', '297', 84, 16600, 4930200),
(496, '2024-10-07', 12276, '4000/t03', 'frozen', '1015', 'J', '21.5', 0, 30000, 645000),
(497, '2024-10-07', 12276, '4000/t03', 'frozen', '1037', '1/2', '8.2', 0, 23000, 188600),
(498, '2024-10-07', 12276, '4000/t03', 'frozen', '1037', '80/100', '29.2', 0, 13500, 394200),
(499, '2024-10-07', 12277, '4000/m09', 'frozen', '1004', 'J', '270', 0, 16500, 4455000),
(500, '2024-10-07', 12278, '4000/k15', 'frozen', '1015', '4/5', '74.1', 0, 32000, 2371200),
(501, '2024-10-07', 12278, '4000/k15', 'frozen', '1015', 'J', '23', 0, 31000, 713000),
(502, '2024-10-07', 12279, '4000/b01', 'frozen', '1001', '3up', '26.25', 11, 57000, 1496250),
(503, '2024-10-07', 12279, '4000/b01', 'frozen', '1001', '2up', '13.7', 9, 47000, 643900),
(504, '2024-10-07', 12279, '4000/b01', 'frozen', '1002', '3/4', '104.55', 35, 47000, 4913850),
(505, '2024-10-07', 12279, '4000/b01', 'frozen', '1002', '2up', '16.5', 10, 44500, 734250),
(506, '2024-10-07', 12279, '4000/b01', 'frozen', '1020', '3/4', '41.6', 0, 29000, 1206400),
(507, '2024-10-07', 12279, '4000/b01', 'frozen', '1020', '2up', '14', 0, 26000, 364000),
(508, '2024-10-08', 12280, '4000/t05', 'frozen', '1023', '4up', '505.75', 0, 16300, 8243725),
(509, '2024-10-08', 12280, '4000/t05', 'frozen', '1023', '5up', '237', 0, 16600, 3934200),
(510, '2024-10-08', 12280, '4000/t05', 'frozen', '1031', '5up', '994.5', 0, 8800, 8751600),
(511, '2024-10-08', 12281, '4000/t08', 'frozen', '1037', '8/10', '31.7', 0, 13000, 412100),
(512, '2024-10-08', 12281, '4000/t08', 'frozen', '1037', '1/2', '1.5', 0, 25000, 37500),
(513, '2024-10-08', 12282, '4000/t07', 'frozen', '1004', 'J', '266.4', 0, 17500, 4662000),
(514, '2024-10-08', 12283, '4000/t03', 'frozen', '1037', '80/100', '74.2', 0, 13000, 964600),
(515, '2024-10-08', 12283, '4000/t03', 'frozen', '1037', '1/2', '20.3', 0, 25000, 507500),
(516, '2024-10-08', 12283, '4000/t03', 'frozen', '1015', 'J', '3.8', 0, 25000, 95000),
(517, '2024-10-08', 12284, '4000/b01', 'frozen', '1023', 'J', '309.35', 0, 17000, 5258950),
(518, '2024-10-08', 12285, '4000/a14', 'frozen', '1019', 'J', '581.2', 0, 13000, 7555600),
(519, '2024-10-08', 160, '4000/t15', 'tcl', '1017', '7up', '287', 0, 9800, 2812600),
(520, '2024-10-08', 161, '4000/b02', 'tcl', '1017', 'J', '528.15', 0, 10000, 5281500),
(521, '2024-10-09', 162, '4000/t15', 'tcl', '1031', '2/3', '2398', 0, 8450, 20263100),
(522, '2024-10-09', 162, '4000/t15', 'tcl', '1031', '3up', '167.75', 0, 8350, 1400713),
(523, '2024-10-09', 163, '4000/t15', 'tcl', '1031', '2/3', '2506.5', 0, 8450, 21179925),
(524, '2024-10-09', 164, '4000/b02', 'tcl', '1017', 'J', '357.3', 0, 10000, 3573000),
(525, '2024-10-09', 12286, '4000/t05', 'frozen', '1031', '13/18', '362', 0, 6500, 2353000),
(526, '2024-10-09', 12286, '4000/t05', 'frozen', '1001', '18/24', '858', 0, 7500, 6435000),
(527, '2024-10-09', 12287, '4000/t05', 'frozen', '1031', '5up', '227.75', 0, 8800, 2004200),
(528, '2024-10-09', 12287, '4000/t05', 'frozen', '1023', '3up', '335.75', 0, 14300, 4801225),
(529, '2024-10-09', 12287, '4000/t05', 'frozen', '1023', '5up', '418.75', 0, 16600, 6951250),
(530, '2024-10-09', 12288, '4000/b01', 'frozen', '1020', '3/4', '90.25', 0, 29000, 2617250),
(531, '2024-10-09', 12288, '4000/b01', 'frozen', '1020', '2up', '8.3', 0, 26000, 215800),
(532, '2024-10-09', 12289, '4000/a01', 'frozen', '1015', '4/5', '166', 614, 31000, 5146000),
(533, '2024-10-09', 12290, '4000/t07', 'frozen', '1004', 'J', '267.8', 0, 17500, 4686500),
(534, '2024-10-09', 12291, '4000/a03', 'frozen', '1037', '80/110', '171.9', 0, 15000, 2578500),
(535, '2024-10-09', 12291, '4000/a03', 'frozen', '1037', '110/210', '182.2', 0, 25000, 4555000),
(536, '2024-10-09', 12292, '4000/t02', 'frozen', '1001', '1D', '22.4', 0, 23500, 526400),
(537, '2024-10-09', 12292, '4000/t02', 'frozen', '1002', '1D', '23.2', 0, 21500, 498800),
(538, '2024-10-10', 12293, '4000/t05', 'frozen', '1031', '5up', '443.25', 0, 8800, 3900600),
(539, '2024-10-10', 12294, '4000/t07', 'frozen', '1004', 'J', '61.5', 0, 17500, 1076250),
(540, '2024-10-10', 12295, '4000/b01', 'frozen', '1020', '3/4', '295.6', 0, 29000, 8572400),
(541, '2024-10-10', 12295, '4000/b01', 'frozen', '1020', '2up', '88.8', 0, 26000, 2308800),
(542, '2024-10-10', 12296, '4000/t02', 'frozen', '1001', '1D', '4.4', 0, 23500, 103400),
(543, '2024-10-10', 12296, '4000/t02', 'frozen', '1002', '1D', '84.6', 0, 21500, 1818900),
(544, '2024-10-10', 12297, '4000/s04', 'frozen', '1027', 'J', '78.4', 0, 14000, 1097600),
(545, '2024-10-10', 165, '4000/b02', 'tcl', '1017', 'J', '355.7', 0, 10000, 3557000),
(546, '2024-10-11', 12299, '4000/b01', 'frozen', '1020', '3/4', '160.3', 0, 29000, 4648700),
(547, '2024-10-11', 12299, '4000/b01', 'frozen', '1020', '2up', '59.8', 0, 26000, 1554800),
(548, '2024-10-10', 12298, '4000/a03', 'frozen', '1037', '1/2', '83.1', 0, 25000, 2077500),
(549, '2024-10-10', 12298, '4000/a03', 'frozen', '1037', '8/10', '60.1', 0, 15000, 901500),
(550, '2024-10-11', 12300, '4000/t05', 'frozen', '1023', '2up', '915.75', 0, 12400, 11355300),
(551, '2024-10-11', 12300, '4000/t05', 'frozen', '1023', '3up', '492.75', 0, 14300, 7046325),
(552, '2024-10-11', 12300, '4000/t05', 'frozen', '1023', '5/6', '160.75', 0, 16600, 2668450),
(553, '2024-10-11', 12300, '4000/t05', 'frozen', '1031', '5/6', '712', 0, 8800, 6265600),
(554, '2024-10-12', 12301, '4000/a03', 'frozen', '1020', 'J', '5.7', 0, 23000, 131100),
(555, '2024-10-12', 12302, '4000/t02', 'frozen', '1002', '1D', '94.1', 0, 21500, 2023150),
(556, '2024-10-12', 12303, '4000/b01', 'frozen', '1020', '3/4', '394.25', 0, 29000, 11433250);
INSERT INTO `purchase` (`no`, `date`, `voucher_no`, `supplier_id`, `tclfrozen`, `commodity`, `size`, `viss`, `pcs`, `price`, `amount`) VALUES
(557, '2024-10-12', 12303, '4000/b01', 'frozen', '1020', '2up', '24.2', 0, 26000, 629200),
(558, '2024-10-12', 12303, '4000/b01', 'frozen', '1026', 'J', '88.1', 0, 10200, 898620),
(559, '2024-10-12', 12304, '4000/t07', 'frozen', '1004', 'J', '150', 0, 17500, 2625000),
(560, '2024-10-12', 12305, '4000/a03', 'frozen', '1037', '1/2', '248.9', 0, 25000, 6222500),
(561, '2024-10-12', 12305, '4000/a03', 'frozen', '1037', '80/110', '342.2', 0, 15000, 5133000),
(562, '2024-10-13', 12306, '4000/b01', 'frozen', '1020', '3/4', '134.4', 0, 29000, 3897600),
(563, '2024-10-13', 12306, '4000/b01', 'frozen', '1020', '2up', '44.3', 0, 26000, 1151800),
(564, '2024-10-13', 12307, '4000/a06', 'frozen', '1037', '8/10', '57.1', 0, 13000, 742300),
(565, '2024-10-13', 12308, '4000/t07', 'frozen', '1004', 'J', '124.4', 0, 17500, 2177000),
(566, '2024-10-13', 12309, '4000/a02', 'frozen', '1037', '80/100', '81.5', 0, 13500, 1100250),
(567, '2024-10-13', 12309, '4000/a02', 'frozen', '1037', '1/2', '3.5', 0, 25000, 87500),
(568, '2024-10-13', 12310, '4000/a03', 'frozen', '1037', '1/2', '36.5', 0, 25000, 912500),
(569, '2024-10-13', 12310, '4000/a03', 'frozen', '1037', '8/10', '17.9', 0, 15000, 268500),
(570, '2024-10-14', 12311, '4000/b01', 'frozen', '1036', 'J', '258.2', 0, 10000, 2582000),
(571, '2024-10-14', 12311, '4000/b01', 'frozen', '1026', 'J', '89.8', 0, 10500, 942900),
(572, '2024-10-14', 12311, '4000/b01', 'frozen', '1023', 'J', '638.4', 0, 16800, 10725120),
(573, '2024-10-14', 12311, '4000/b01', 'frozen', '1020', '3/4', '46.1', 0, 29000, 1336900),
(574, '2024-10-14', 12311, '4000/b01', 'frozen', '1020', '2up', '11.9', 0, 26000, 309400),
(575, '2024-10-14', 12312, '4000/a01', 'frozen', '1015', '4/5', '78.2', 0, 31000, 2424200),
(576, '2024-10-14', 12312, '4000/a01', 'frozen', '1015', 'J', '170.6', 0, 31000, 5288600);

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

--
-- Dumping data for table `receivable`
--

INSERT INTO `receivable` (`id`, `date`, `ac_code`, `sr_no`, `container_no`, `invoice_amount`, `paid_date`, `payment_no`, `particulars`, `paid_amount`, `balance`, `transactionid`) VALUES
(1, '2024-09-15', '3300/006', '', '', '', '0000-00-00', '', '', '', '58093.88', 0),
(2, '2024-09-15', '3300/007', '', '', '', '0000-00-00', '', '', '', '7914.21', 0),
(3, '2024-03-15', '3300/005', '', '', '', '0000-00-00', '', '', '', '-33410.00', 0),
(4, '2024-09-15', '3300/004', '', '', '', '0000-00-00', '', '', '', '42763.90', 0),
(5, '2024-09-15', '3300/002', '', '', '', '0000-00-00', '', '', '', '86222.43', 0),
(6, '2024-09-15', '3300/003', '', '', '', '0000-00-00', '', '', '', '8823.19', 0),
(7, '2024-09-16', '3300/003', 'Can.11/2024', 'OERU4236159', '147805.93', '0000-00-00', '', '', '', '156629.12', 117),
(8, '2024-09-16', '3300/003', 'Can.12/2024', 'SEGU9973040', '118444.32', '0000-00-00', '', '', '', '275073.44', 119),
(9, '2024-09-16', '3300/003', 'Can.13/2024', 'FBIU5349800', '119522.71', '0000-00-00', '', '', '', '394596.15', 121),
(10, '2024-09-16', '3300/003', 'Can.14/2024', 'FBIU5175062', '114437.18', '0000-00-00', '', '', '', '509033.33', 123),
(11, '2024-09-16', '3300/003', 'Can.15/2024', 'CXRU1500578', '136682.63', '0000-00-00', '', '', '', '645715.96', 125),
(12, '2024-09-16', '3300/002', 'SAF.13/24', 'SZLU9619489', '160251.06', '0000-00-00', '', '', '', '246473.49', 173),
(13, '2024-09-16', '3300/002', 'SAF.14/24', 'FBIU5416339', '161919.92', '0000-00-00', '', '', '', '408393.41', 175),
(14, '2024-09-16', '3300/002', 'SAF.15/24', 'FBIU5417612', '191655.35', '0000-00-00', '', '', '', '600048.76', 177),
(15, '2024-09-16', '3300/002', 'SAF.16/24', 'OERU4242955', '207412.5', '0000-00-00', '', '', '', '807461.26', 179),
(16, '2024-09-16', '3300/002', 'SAF.17/24', 'OERU4216933', '71877.63', '0000-00-00', '', '', '', '879338.89', 181),
(17, '2024-09-16', '3300/002', 'SAF.18/24', 'SEKU9020043', '79575.81', '0000-00-00', '', '', '', '958914.7', 183),
(18, '2024-09-16', '3300/002', 'SAF.19/24', 'FBIU5007881', '74139.39', '0000-00-00', '', '', '', '1033054.09', 185),
(19, '2024-09-16', '3300/005', 'LM/WT-01/23', 'FSCU5226052', '28480', '0000-00-00', '', '', '', '-4930', 191),
(20, '2024-09-16', '3300/007', 'Inv.35/23-15/24', 'Rohu,Katla', '514727.02', '0000-00-00', '', '', '', '522641.23', 195),
(21, '2024-09-16', '3300/006', 'SC.5/22,6/22,1/24,2/24', 'Frozen Container', '482932.6', '0000-00-00', '', '', '', '541026.48', 197),
(22, '0000-00-00', '3300/002', '', '', '', '2024-09-30', 'JV09-006', 'USA Money Received to TD Account-Can', '55000', '978054.09', 200),
(23, '0000-00-00', '3300/002', '', '', '', '2024-09-30', 'JV09-007', 'USA Money Received to RBC Account-Can and that money temporary loan to LM Global for Freight in and out', '55000', '923054.09', 204),
(24, '2024-09-30', '3300/002', 'SAF.20/24 & 21/24', 'HLBU9522593/9538590', '167667.27', '0000-00-00', '', '', '', '1090721.36', 205),
(25, '0000-00-00', '3300/003', '', '', '', '2024-09-30', 'JV09-009', 'Money Received from Can Buyer for Can No.11', '137000', '508715.96', 208),
(26, '2024-10-03', '3300/002', 'SAF.22/24', 'HLBU9629935', '77508.9', '0000-00-00', '', '', '', '1168230.26', 209),
(27, '2024-10-04', '3300/003', 'Can.16/24', 'FBIU5059817', '147256.52', '0000-00-00', '', '', '', '655972.48', 211),
(28, '0000-00-00', '3300/003', '', '', '', '2024-10-04', 'JV10-003', 'Money Received from Can for Can.11 and 12', '60000', '595972.48', 214),
(29, '0000-00-00', '3300/002', '', '', '', '2024-10-07', 'JV10-004', 'Money Received from USA for SAF.13/24', '65000', '1103230.26', 216),
(30, '0000-00-00', '3300/002', '', '', '', '2024-10-11', 'JV10-005', 'Money Received from USA for SAF.13/24', '65000', '1038230.26', 220),
(31, '0000-00-00', '3300/003', '', '', '', '2024-10-12', 'JV10-006', 'Money Received from Can Buyer for Can.12', '47000', '548972.48', 224),
(32, '0000-00-00', '3300/007', '', '', '', '2024-09-30', 'JV09-010', 'Money Received from Border Trade-TCL (taka 1200000/122) / 1200000taka*38.1ks / $9836.07*4648.2ks', '9836.07', '512805.16', 226),
(33, '0000-00-00', '3300/006', '', '', '', '2024-09-30', 'JV09-011', 'Money Received from Frozen-Bangladesh (taka 2600000/122) / 1200000taka*38.1ks / $9836.07*4648.2ks and Teacher Transfer to Thai Law FIrm for ACE (Thai)', '22279.22', '518747.26', 228),
(34, '0000-00-00', '3300/007', '', '', '', '2024-10-03', 'JV10-007', 'Money Received from Border Trade-TCL (taka 500000/122) / 500000taka*36.2ks / $4098.36*4416.4ks', '4098.36', '508706.8', 230),
(35, '0000-00-00', '3300/006', '', '', '', '2024-10-03', 'JV10-008', 'Money Received from Frozen-Container (taka 3500000/122) / 3500000taka*36.2ks / $28688.52*4416.4ks', '28688.52', '490058.74', 232),
(36, '2024-10-10', '3300/007', 'TCL.16/24', 'Rohu,Katla', '16232.17', '0000-00-00', '', '', '', '524938.97', 233);

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
-- Table structure for table `stock_output_group`
--

CREATE TABLE `stock_output_group` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT current_timestamp(),
  `time` time DEFAULT current_timestamp(),
  `stock_to` varchar(255) DEFAULT NULL,
  `voucher_no` int(11) DEFAULT NULL,
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
(156, '4000/099', 'Tommy', '09977221152', 'Yangon'),
(157, '4000/P03', 'Carton Box (Pan Thazin)', '', ''),
(158, '4000/D04', 'Dalian Ice', '', ''),
(159, '4000/G03', 'Plastic (Golden Fish)', '', ''),
(160, '4000/K15', 'Ko Ka Lar', '', ''),
(161, '4000/A14', 'Ar Kar', '', ''),
(162, '4000/W03', 'Win Aye', '', ''),
(163, '4000/B02', 'Bar Bu Lay (TCL)', '', ''),
(164, '4000/P04', 'Promise (Inner Box)', '', ''),
(165, '4000/003', 'China Plastic A/C', '', '');

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

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `date`, `voucher_no`, `ac_code`, `description`, `debit`, `credit`, `currency`, `sr_no`, `container_no`, `bank_charges`, `status`) VALUES
(2, '2024-09-16', 'Dr-Sep 24/332', '9100/003', 'Water 5pcs*900ks Purchase for W/H', '4500', '0', 'mmk', '', '', 0, 'accepted'),
(3, '2024-09-16', 'Dr-Sep 24/332', '3600/001', 'Water 5pcs*900ks Purchase for W/H', '0', '4500', 'mmk', '', '', 0, 'accepted'),
(4, '2024-09-16', 'Dr-Sep 24/333', '9100/002', 'Taxi Charges For Printer Sent For W/H', '10000', '0', 'mmk', '', '', 0, 'accepted'),
(5, '2024-09-16', 'Dr-Sep 24/333', '3600/001', 'Taxi Charges For Printer Sent For W/H', '0', '10000', 'mmk', '', '', 0, 'accepted'),
(6, '2024-09-16', 'Dr-Sep 24/334', '9100/016', 'Printer Ink Purchase For Office (2pcs*6000ks)', '12000', '0', 'mmk', '', '', 0, 'accepted'),
(7, '2024-09-16', 'Dr-Sep 24/334', '3600/001', 'Printer Ink Purchase For Office (2pcs*6000ks)', '0', '12000', 'mmk', '', '', 0, 'accepted'),
(8, '2024-09-16', 'Dr-Sep 24/335', '9100/002', 'Taxi Charges For MC Tally People For GFC to W/H', '5000', '0', 'mmk', '', '', 0, 'accepted'),
(9, '2024-09-16', 'Dr-Sep 24/335', '3600/001', 'Taxi Charges For MC Tally People For GFC to W/H', '0', '5000', 'mmk', '', '', 0, 'accepted'),
(10, '2024-09-16', 'Dr-Sep 24/336', '9100/005', 'Wasting Carry Charges For New Factory Cleaning', '20000', '0', 'mmk', '', '', 0, 'accepted'),
(11, '2024-09-16', 'Dr-Sep 24/336', '3600/001', 'Wasting Carry Charges For New Factory Cleaning', '0', '20000', 'mmk', '', '', 0, 'accepted'),
(12, '2024-09-16', 'Dr-Sep 24/337', '9100/002', 'Taxi Charges For W/H to HHK For Biryani', '18000', '0', 'mmk', '', '', 0, 'accepted'),
(13, '2024-09-16', 'Dr-Sep 24/337', '3600/001', 'Taxi Charges For W/H to HHK For Biryani', '0', '18000', 'mmk', '', '', 0, 'accepted'),
(14, '2024-09-16', 'Dr-Sep 24/338', '9100/014', 'Car Repair For 3K-1574 For Brake (Need Material 40000+ Repair Charges 25000)', '65000', '0', 'mmk', '', '', 0, 'accepted'),
(15, '2024-09-16', 'Dr-Sep 24/338', '3600/001', 'Car Repair For 3K-1574 For Brake (Need Material 40000+ Repair Charges 25000)', '0', '65000', 'mmk', '', '', 0, 'accepted'),
(16, '2024-09-16', 'Dr-Sep 24/339', '9100/019', 'Purchase UPS Changing and Service For Office Soe Soe Computer (UPS 98000+Service Charge 30000)', '128000', '0', 'mmk', '', '', 0, 'accepted'),
(17, '2024-09-16', 'Dr-Sep 24/339', '3600/001', 'Purchase UPS Changing and Service For Office Soe Soe Computer (UPS 98000+Service Charge 30000)', '0', '128000', 'mmk', '', '', 0, 'accepted'),
(18, '2024-09-16', 'Dr-Sep 24/340', '9100/012', 'Sugar 1 pcs*1500ks Purchase For Sir', '1500', '0', 'mmk', '', '', 0, 'accepted'),
(19, '2024-09-16', 'Dr-Sep 24/340', '3600/001', 'Sugar 1 pcs*1500ks Purchase For Sir', '0', '1500', 'mmk', '', '', 0, 'accepted'),
(20, '2024-09-16', 'Dr-Sep 24/341', '9100/017', 'Dummy Air Ticket For Sir Singapore Visa', '30000', '0', 'mmk', '', '', 0, 'accepted'),
(21, '2024-09-16', 'Dr-Sep 24/341', '3600/001', 'Dummy Air Ticket For Sir Singapore Visa', '0', '30000', 'mmk', '', '', 0, 'accepted'),
(22, '2024-09-16', 'Dr-Sep 24/342', '6100/005', 'MC Charges For HHK To GFC (14.9.24=500000,16.9.24=500000)', '1000000', '0', 'mmk', '', '', 0, 'accepted'),
(23, '2024-09-16', 'Dr-Sep 24/342', '3600/001', 'MC Charges For HHK To GFC (14.9.24=500000,16.9.24=500000)', '0', '1000000', 'mmk', '', '', 0, 'accepted'),
(24, '2024-09-16', 'Dr-Sep 24/343', '6100/001', 'Labour Charges and Taxi For W/H (Baila 19Vissx350ks,D Puti 103Vissx600ks,Batashi 17.5Viss)', '115950', '0', 'mmk', '', '', 0, 'accepted'),
(25, '2024-09-16', 'Dr-Sep 24/343', '3600/001', 'Labour Charges and Taxi For W/H (Baila 19Vissx350ks,D Puti 103Vissx600ks,Batashi 17.5Viss)', '0', '115950', 'mmk', '', '', 0, 'accepted'),
(26, '2024-09-16', 'Dr-Sep 24/344', '3400/002', 'Car Charges For Tender Go To Nay Pyi Taw 12.9.24 to 14.9.24 LM Factory', '1120000', '0', 'mmk', '', '', 0, 'accepted'),
(27, '2024-09-16', 'Dr-Sep 24/344', '3600/001', 'Car Charges For Tender Go To Nay Pyi Taw 12.9.24 to 14.9.24 LM Factory', '0', '1120000', 'mmk', '', '', 0, 'accepted'),
(28, '2024-09-16', 'Dr-Sep 24/345', '9100/009', 'K-pay Charges For Car Charges Transfer NPT LM Factory', '2000', '0', 'mmk', '', '', 0, 'accepted'),
(29, '2024-09-16', 'Dr-Sep 24/345', '3600/001', 'K-pay Charges For Car Charges Transfer NPT LM Factory', '0', '2000', 'mmk', '', '', 0, 'accepted'),
(30, '2024-09-16', 'Dr-Sep 24/346', '3400/002', 'Hotal Charges For Factory Contract go D.Nan+2pcs LM Factory', '326000', '0', 'mmk', '', '', 0, 'accepted'),
(31, '2024-09-16', 'Dr-Sep 24/346', '3600/001', 'Hotal Charges For Factory Contract go D.Nan+2pcs LM Factory', '0', '326000', 'mmk', '', '', 0, 'accepted'),
(32, '2024-09-16', 'Dr-Sep 24/347', '3400/003', 'Bank Guarantee 1 Month for LM Factory', '15966000', '0', 'mmk', '', '', 0, 'accepted'),
(33, '2024-09-16', 'Dr-Sep 24/347', '3600/001', 'Bank Guarantee 1 Month for LM Factory', '0', '15966000', 'mmk', '', '', 0, 'accepted'),
(34, '2024-09-16', 'Dr-Sep 24/348', '3400/004', 'Rental Contract 1year for for LM Factory Sep\'24 to Sep\'25 (15700000*12month)', '188400000', '0', 'mmk', '', '', 0, 'accepted'),
(35, '2024-09-16', 'Dr-Sep 24/348', '3600/001', 'Rental Contract 1year for for LM Factory Sep\'24 to Sep\'25 (15700000*12month)', '0', '188400000', 'mmk', '', '', 0, 'accepted'),
(36, '2024-09-16', 'Dr-Sep 24/349', '3400/002', 'Paid to Goverment NPT People For Tender MD-100 Lakh,D.Nan 50 Lakh,Ko Phyoe 10 Lakh', '17362000', '0', 'mmk', '', '', 0, 'accepted'),
(37, '2024-09-16', 'Dr-Sep 24/349', '3600/001', 'Paid to Goverment NPT People For Tender MD-100 Lakh,D.Nan 50 Lakh,Ko Phyoe 10 Lakh', '0', '17362000', 'mmk', '', '', 0, 'accepted'),
(38, '2024-09-16', 'Dr-Sep 24/350', '3400/002', 'Paid To Government People (YGN) For Tender U Aung Kyaw 3 Lakh, Daw Ohn Mar 10 Lakh, D', '2300000', '0', 'mmk', '', '', 0, 'accepted'),
(39, '2024-09-16', 'Dr-Sep 24/350', '3600/001', 'Paid To Government People (YGN) For Tender U Aung Kyaw 3 Lakh, Daw Ohn Mar 10 Lakh, D', '0', '2300000', 'mmk', '', '', 0, 'accepted'),
(40, '2024-09-16', 'Dr-Sep 24/351', '3400/002', 'Stamp Duty fees For Factory Contract (188400000\r\n*0.5%)+(BG 15700000*2%) LM Factory', '1256000', '0', 'mmk', '', '', 0, 'accepted'),
(41, '2024-09-16', 'Dr-Sep 24/351', '3600/001', 'Stamp Duty fees For Factory Contract (188400000\r\n*0.5%)+(BG 15700000*2%) LM Factory', '0', '1256000', 'mmk', '', '', 0, 'accepted'),
(42, '2024-09-16', 'Dr-Sep 24/352', '3400/002', 'Under Taking For Tax Darpartment for Stamp Duty LM Factory', '10000', '0', 'mmk', '', '', 0, 'accepted'),
(43, '2024-09-16', 'Dr-Sep 24/352', '3600/001', 'Under Taking For Tax Darpartment for Stamp Duty LM Factory', '0', '10000', 'mmk', '', '', 0, 'accepted'),
(44, '2024-09-16', 'Dr-Sep 24/353', '3400/002', 'Copy For Tender Tax Document all LM Factory', '7300', '0', 'mmk', '', '', 0, 'accepted'),
(45, '2024-09-16', 'Dr-Sep 24/353', '3600/001', 'Copy For Tender Tax Document all LM Factory', '0', '7300', 'mmk', '', '', 0, 'accepted'),
(46, '2024-09-16', 'Dr-Sep 24/354', '3400/002', 'Meal Allowance For Tender go 12.9.24 to 14.9.24 Daw Nan+2pcs LM Factory', '288375', '0', 'mmk', '', '', 0, 'accepted'),
(47, '2024-09-16', 'Dr-Sep 24/354', '3600/001', 'Meal Allowance For Tender go 12.9.24 to 14.9.24 Daw Nan+2pcs LM Factory', '0', '288375', 'mmk', '', '', 0, 'accepted'),
(48, '2024-09-16', 'Dr-Sep 24/355', '4000/T14', 'Paid to Tun Naing For Vr no 12148', '346500', '0', 'mmk', '', '', 0, 'accepted'),
(49, '2024-09-16', 'Dr-Sep 24/355', '3600/001', 'Paid to Tun Naing For Vr no 12148', '0', '346500', 'mmk', '', '', 0, 'accepted'),
(50, '2024-09-16', 'Dr-Sep 24/356', '9100/002', 'Taxi Charges For W/H to Market to W/H and Boy 1 pcs house go', '33000', '0', 'mmk', '', '', 0, 'accepted'),
(51, '2024-09-16', 'Dr-Sep 24/356', '3600/001', 'Taxi Charges For W/H to Market to W/H and Boy 1 pcs house go', '0', '33000', 'mmk', '', '', 0, 'accepted'),
(52, '2024-09-16', 'Dr-Sep 24/357', '9100/012', 'Meal allowance For Market Boys Am4pcs, Lunch4pcs', '14000', '0', 'mmk', '', '', 0, 'accepted'),
(53, '2024-09-16', 'Dr-Sep 24/357', '3600/001', 'Meal allowance For Market Boys Am4pcs, Lunch4pcs', '0', '14000', 'mmk', '', '', 0, 'accepted'),
(54, '2024-09-16', 'Dr-Sep 24/358', '6100/001', 'Labour Charges For Market Fish', '26500', '0', 'mmk', '', '', 0, 'accepted'),
(55, '2024-09-16', 'Dr-Sep 24/358', '3600/001', 'Labour Charges For Market Fish', '0', '26500', 'mmk', '', '', 0, 'accepted'),
(56, '2024-09-16', 'Dr-Sep 24/359', '9100/025', 'Car Packing For Market', '2000', '0', 'mmk', '', '', 0, 'accepted'),
(57, '2024-09-16', 'Dr-Sep 24/359', '3600/001', 'Car Packing For Market', '0', '2000', 'mmk', '', '', 0, 'accepted'),
(58, '2024-09-16', 'Dr-Sep 24/360', '6100/002', 'Ice 6pcs*15000ks For Market Fish', '90000', '0', 'mmk', '', '', 0, 'accepted'),
(59, '2024-09-16', 'Dr-Sep 24/360', '3600/001', 'Ice 6pcs*15000ks For Market Fish', '0', '90000', 'mmk', '', '', 0, 'accepted'),
(60, '2024-09-17', 'Dr-Sep 24/361', '9100/006', 'Car Diesel For 3k-1574 (15.9.24=50000,17.9.24=500000)30.54 Liters*3275ks', '100000', '0', 'mmk', '', '', 0, 'accepted'),
(61, '2024-09-17', 'Dr-Sep 24/361', '3600/001', 'Car Diesel For 3k-1574 (15.9.24=50000,17.9.24=500000)30.54 Liters*3275ks', '0', '100000', 'mmk', '', '', 0, 'accepted'),
(62, '2024-09-17', 'Dr-Sep 24/362', '9100/002', 'Taxi Charges For Mindama to Lai Lai house For Fish Goverment', '5500', '0', 'mmk', '', '', 0, 'accepted'),
(63, '2024-09-17', 'Dr-Sep 24/362', '3600/001', 'Taxi Charges For Mindama to Lai Lai house For Fish Goverment', '0', '5500', 'mmk', '', '', 0, 'accepted'),
(64, '2024-09-17', 'Dr-Sep 24/363', '6100/001', 'Labour Charges and Taxi For W/H Batashi 9viss*1000ks, Taxi 20000ks', '29000', '0', 'mmk', '', '', 0, 'accepted'),
(65, '2024-09-17', 'Dr-Sep 24/363', '3600/001', 'Labour Charges and Taxi For W/H Batashi 9viss*1000ks, Taxi 20000ks', '0', '29000', 'mmk', '', '', 0, 'accepted'),
(66, '2024-09-17', 'Dr-Sep 24/364', '9100/002', 'Taxi Charges For W/H to UAB For Lai Lai for A/C Check', '3000', '0', 'mmk', '', '', 0, 'accepted'),
(67, '2024-09-17', 'Dr-Sep 24/364', '3600/001', 'Taxi Charges For W/H to UAB For Lai Lai for A/C Check', '0', '3000', 'mmk', '', '', 0, 'accepted'),
(68, '2024-09-17', 'Dr-Sep 24/365', '9100/005', 'Cutter 5 pcs Purchase and Taxi For Batashi Clean (20000+4000)', '24000', '0', 'mmk', '', '', 0, 'accepted'),
(69, '2024-09-17', 'Dr-Sep 24/365', '3600/001', 'Cutter 5 pcs Purchase and Taxi For Batashi Clean (20000+4000)', '0', '24000', 'mmk', '', '', 0, 'accepted'),
(70, '2024-09-17', 'Dr-Sep 24/366', '9100/002', 'Taxi Charges For HHK to W/H For 16.9.24', '30000', '0', 'mmk', '', '', 0, 'accepted'),
(71, '2024-09-17', 'Dr-Sep 24/366', '3600/001', 'Taxi Charges For HHK to W/H For 16.9.24', '0', '30000', 'mmk', '', '', 0, 'accepted'),
(72, '2024-09-17', 'Dr-Sep 24/367', '9100/012', 'Workers 5pcs*2000ks Dinner For HHK OT', '10000', '0', 'mmk', '', '', 0, 'accepted'),
(73, '2024-09-17', 'Dr-Sep 24/367', '3600/001', 'Workers 5pcs*2000ks Dinner For HHK OT', '0', '10000', 'mmk', '', '', 0, 'accepted'),
(74, '2024-09-17', 'Dr-Sep 24/368', '6100/002', 'Ice 8pcs*10500ks Purchase and Carry For HHK', '96000', '0', 'mmk', '', '', 0, 'accepted'),
(75, '2024-09-17', 'Dr-Sep 24/368', '3600/001', 'Ice 8pcs*10500ks Purchase and Carry For HHK', '0', '96000', 'mmk', '', '', 0, 'accepted'),
(76, '2024-09-17', 'Dr-Sep 24/369', '9100/002', 'Taxi Charges For W/H to OP', '13000', '0', 'mmk', '', '', 0, 'accepted'),
(77, '2024-09-17', 'Dr-Sep 24/369', '3600/001', 'Taxi Charges For W/H to OP', '0', '13000', 'mmk', '', '', 0, 'accepted'),
(78, '2024-09-17', 'Dr-Sep 24/370', '9100/002', 'Taxi Charges For W/H to HHK Carton Box Carry Charges', '35000', '0', 'mmk', '', '', 0, 'accepted'),
(79, '2024-09-17', 'Dr-Sep 24/370', '3600/001', 'Taxi Charges For W/H to HHK Carton Box Carry Charges', '0', '35000', 'mmk', '', '', 0, 'accepted'),
(80, '2024-09-17', 'Dr-Sep 24/371', '6100/001', 'Labour Charges For OP Raw', '30000', '0', 'mmk', '', '', 0, 'accepted'),
(81, '2024-09-17', 'Dr-Sep 24/371', '3600/001', 'Labour Charges For OP Raw', '0', '30000', 'mmk', '', '', 0, 'accepted'),
(82, '2024-09-17', 'Dr-Sep 24/372', '9100/002', 'Taxi Charges For W/H to Market to W/H', '25000', '0', 'mmk', '', '', 0, 'accepted'),
(83, '2024-09-17', 'Dr-Sep 24/372', '3600/001', 'Taxi Charges For W/H to Market to W/H', '0', '25000', 'mmk', '', '', 0, 'accepted'),
(84, '2024-09-17', 'Dr-Sep 24/373', '9100/012', 'Meal allowance For Market Boys Am3pcs,Lunch 3pcs', '10500', '0', 'mmk', '', '', 0, 'accepted'),
(85, '2024-09-17', 'Dr-Sep 24/373', '3600/001', 'Meal allowance For Market Boys Am3pcs,Lunch 3pcs', '0', '10500', 'mmk', '', '', 0, 'accepted'),
(86, '2024-09-17', 'Dr-Sep 24/374', '6100/001', 'Labour charges For Market Fish', '42500', '0', 'mmk', '', '', 0, 'accepted'),
(87, '2024-09-17', 'Dr-Sep 24/374', '3600/001', 'Labour charges For Market Fish', '0', '42500', 'mmk', '', '', 0, 'accepted'),
(88, '2024-09-17', 'Dr-Sep 24/375', '9100/025', 'Car Packing For Market', '3000', '0', 'mmk', '', '', 0, 'accepted'),
(89, '2024-09-17', 'Dr-Sep 24/375', '3600/001', 'Car Packing For Market', '0', '3000', 'mmk', '', '', 0, 'accepted'),
(90, '2024-09-18', 'Dr-Sep 24/376', '6100/002', 'Ice 9 pcs*15000 Purchase For Market Fish', '135000', '0', 'mmk', '', '', 0, 'accepted'),
(91, '2024-09-18', 'Dr-Sep 24/376', '3600/001', 'Ice 9 pcs*15000 Purchase For Market Fish', '0', '135000', 'mmk', '', '', 0, 'accepted'),
(92, '2024-09-18', 'Dr-Sep 24/377', '9100/006', 'Car Diesel For 3K-1574(15.9/18.9/19.9)', '150000', '0', 'mmk', '', '', 0, 'accepted'),
(93, '2024-09-18', 'Dr-Sep 24/377', '3600/001', 'Car Diesel For 3K-1574(15.9/18.9/19.9)', '0', '150000', 'mmk', '', '', 0, 'accepted'),
(94, '2024-09-18', 'Dr-Sep 24/378', '9100/002', 'Taxi Charges For W/H to UAB to W/H', '4000', '0', 'mmk', '', '', 0, 'accepted'),
(95, '2024-09-18', 'Dr-Sep 24/378', '3600/001', 'Taxi Charges For W/H to UAB to W/H', '0', '4000', 'mmk', '', '', 0, 'accepted'),
(96, '2024-09-18', 'Dr-Sep 24/379', '9100/002', 'Sir Carry Charges For 19.9.24 AM', '3000', '0', 'mmk', '', '', 0, 'accepted'),
(97, '2024-09-18', 'Dr-Sep 24/379', '3600/001', 'Sir Carry Charges For 19.9.24 AM', '0', '3000', 'mmk', '', '', 0, 'accepted'),
(98, '2024-09-18', 'Dr-Sep 24/380', '9100/002', 'Taxi charges For W/H to Market to W/H', '30000', '0', 'mmk', '', '', 0, 'accepted'),
(99, '2024-09-18', 'Dr-Sep 24/380', '3600/001', 'Taxi charges For W/H to Market to W/H', '0', '30000', 'mmk', '', '', 0, 'accepted'),
(100, '2024-09-18', 'Dr-Sep 24/381', '9100/012', 'Meal Allowance For Am4pcs, Lunch4pcs', '14000', '0', 'mmk', '', '', 0, 'accepted'),
(101, '2024-09-18', 'Dr-Sep 24/381', '3600/001', 'Meal Allowance For Am4pcs, Lunch4pcs', '0', '14000', 'mmk', '', '', 0, 'accepted'),
(102, '2024-09-18', 'Dr-Sep 24/382', '9100/005', 'Cable Tie Purchase For Market Fish Pk', '18000', '0', 'mmk', '', '', 0, 'accepted'),
(103, '2024-09-18', 'Dr-Sep 24/382', '3600/001', 'Cable Tie Purchase For Market Fish Pk', '0', '18000', 'mmk', '', '', 0, 'accepted'),
(105, '2024-09-18', 'Dr-Sep 24/383', '9100/025', 'Car Packing For Market', '2000', '0', 'mmk', '', '', 0, 'accepted'),
(106, '2024-09-18', 'Dr-Sep 24/383', '3600/001', 'Car Packing For Market', '0', '2000', 'mmk', '', '', 0, 'accepted'),
(107, '2024-09-18', 'Dr-Sep 24/384', '6100/002', 'Ice 3 pcs*15000ks Purchase For Rohu', '45000', '0', 'mmk', '', '', 0, 'accepted'),
(108, '2024-09-18', 'Dr-Sep 24/384', '3600/001', 'Ice 3 pcs*15000ks Purchase For Rohu', '0', '45000', 'mmk', '', '', 0, 'accepted'),
(109, '2024-09-18', 'Dr-Sep 24/385', '6100/001', 'Labour Charges For Rohu', '9000', '0', 'mmk', '', '', 0, 'accepted'),
(110, '2024-09-18', 'Dr-Sep 24/385', '3600/001', 'Labour Charges For Rohu', '0', '9000', 'mmk', '', '', 0, 'accepted'),
(111, '2024-09-18', 'Dr-Sep 24/386', '6100/001', 'Labour Charges For Market', '38000', '0', 'mmk', '', '', 0, 'accepted'),
(112, '2024-09-18', 'Dr-Sep 24/386', '3600/001', 'Labour Charges For Market', '0', '38000', 'mmk', '', '', 0, 'accepted'),
(115, '2024-09-18', 'Dr-Sep 24/387', '6100/002', 'Ice 9 Pcs*15000ks Purchase For Market Fish', '135000', '0', 'mmk', '', '', 0, 'accepted'),
(116, '2024-09-18', 'Dr-Sep 24/387', '3600/001', 'Ice 9 Pcs*15000ks Purchase For Market Fish', '0', '135000', 'mmk', '', '', 0, 'accepted'),
(117, '2024-09-16', 'JV09-001', '3300/003', 'Credit Sale to Jamuna (Canada) INV No. Can-11 OERU 4236159', '147805.93', '0', 'usd', 'Can.11/2024', 'OERU4236159', 0, 'accepted'),
(118, '2024-09-16', 'JV09-001', '5000/002', 'Credit Sale to Jamuna (Canada) INV No. Can-11 OERU 4236159', '0', '147805.93', 'usd', '', '', 0, 'accepted'),
(119, '2024-09-16', 'JV09-001', '3300/003', 'Credit Sale to Jamuna (Canada) INV No. Can-12 SEGU 9973040', '118444.32', '0', 'usd', 'Can.12/2024', 'SEGU9973040', 0, 'accepted'),
(120, '2024-09-16', 'JV09-001', '5000/002', 'Credit Sale to Jamuna (Canada) INV No. Can-12 SEGU 9973040', '0', '118444.32', 'usd', '', '', 0, 'accepted'),
(121, '2024-09-16', 'JV09-001', '3300/003', 'Credit Sale to Jamuna (Canada) INV No. Can-13 FBIU 5349800', '119522.71', '0', 'usd', 'Can.13/2024', 'FBIU5349800', 0, 'accepted'),
(122, '2024-09-16', 'JV09-001', '5000/002', 'Credit Sale to Jamuna (Canada) INV No. Can-13 FBIU 5349800', '0', '119522.71', 'usd', '', '', 0, 'accepted'),
(123, '2024-09-16', 'JV09-001', '3300/003', 'Credit Sale to Jamuna (Canada) INV No. Can-14 FBIU 5175062', '114437.18', '0', 'usd', 'Can.14/2024', 'FBIU5175062', 0, 'accepted'),
(124, '2024-09-16', 'JV09-001', '5000/002', 'Credit Sale to Jamuna (Canada) INV No. Can-14 FBIU 5175062', '0', '114437.18', 'usd', '', '', 0, 'accepted'),
(125, '2024-09-16', 'JV09-001', '3300/003', 'Credit Sale to Jamuna (Canada) INV No. Can-15 CXRU 1500578', '136682.63', '0', 'usd', 'Can.15/2024', 'CXRU1500578', 0, 'accepted'),
(126, '2024-09-16', 'JV09-001', '5000/002', 'Credit Sale to Jamuna (Canada) INV No. Can-15 CXRU 1500578', '0', '136682.63', 'usd', '', '', 0, 'accepted'),
(127, '2024-09-19', 'Dr-Sep 24/388', '4000/a03', 'Paid To Aung Naing Oo For Vr no 12091,12096,12154 , Cheque no 109452\r\n', '7942750', '0', 'mmk', '', '', 0, 'accepted'),
(128, '2024-09-19', 'Dr-Sep 24/388', '3600/001', 'Paid To Aung Naing Oo For Vr no 12091,12096,12154 , Cheque no 109452\r\n', '0', '7942750', 'mmk', '', '', 0, 'accepted'),
(129, '2024-09-19', 'Dr-Sep 24/389', '4000/a01', 'Paid to A.K For Vr no 12097,12119 Cheque no 109455\r\n', '1240800', '0', 'mmk', '', '', 0, 'accepted'),
(130, '2024-09-19', 'Dr-Sep 24/389', '3600/001', 'Paid to A.K For Vr no 12097,12119 Cheque no 109455\r\n\r\n', '0', '1240800', 'mmk', '', '', 0, 'accepted'),
(131, '2024-09-19', 'Dr-Sep 24/390', '4000/b01', 'Paid to Bar Bu Lay For Vr no 12019,12020,12027,12028,12029,12039,12040,12041,12048,12059 Cheque no 109453\r\n\r\n\r\n', '100000000', '0', 'mmk', '', '', 0, 'accepted'),
(132, '2024-09-19', 'Dr-Sep 24/390', '3600/001', 'Paid to Bar Bu Lay For Vr no 12019,12020,12027,12028,12029,12039,12040,12041,12048,12059 Cheque no 109453\r\n\r\n\r\n\r\n', '0', '100000000', 'mmk', '', '', 0, 'accepted'),
(133, '2024-09-19', 'Dr-Sep 24/391', '4000/m09', 'Paid to Min Lwin For Vr no 12044,12103,12118,12146,12152 Cheque no 109456\r\n\r\n\r\n\r\n\r\n', '14565375', '0', 'mmk', '', '', 0, 'accepted'),
(134, '2024-09-19', 'Dr-Sep 24/391', '3600/001', 'Paid to Min Lwin For Vr no 12044,12103,12118,12146,12152 Cheque no 109456\r\n\r\n\r\n\r\n\r\n\r\n', '0', '14565375', 'mmk', '', '', 0, 'accepted'),
(135, '2024-09-19', 'Dr-Sep 24/392', '4000/m01', 'Paid to MA For Vr no 12068,12014,12038,12047 Cheque no 109467\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '5889650', '0', 'mmk', '', '', 0, 'accepted'),
(136, '2024-09-19', 'Dr-Sep 24/392', '3600/001', 'Paid to MA For Vr no 12068,12014,12038,12047 Cheque no 109467\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '5889650', 'mmk', '', '', 0, 'accepted'),
(137, '2024-09-19', 'Dr-Sep 24/393', '4000/n04', 'Paid to Nyan Tun For Vr no 12131,12135,12138 Cheque no 109459\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '10000000', '0', 'mmk', '', '', 0, 'accepted'),
(138, '2024-09-19', 'Dr-Sep 24/393', '3600/001', 'Paid to Nyan Tun For Vr no 12131,12135,12138 Cheque no 109459\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '10000000', 'mmk', '', '', 0, 'accepted'),
(139, '2024-09-19', 'Dr-Sep 24/394', '4000/s03', 'Paid to Soe Min For Vr no 11893,11898,11914 Cheque no 109462\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '50000000', '0', 'mmk', '', '', 0, 'accepted'),
(140, '2024-09-19', 'Dr-Sep 24/394', '3600/001', 'Paid to Soe Min For Vr no 11893,11898,11914 Cheque no 109462\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '50000000', 'mmk', '', '', 0, 'accepted'),
(141, '2024-09-19', 'Dr-Sep 24/395', '4000/s06', 'Paid to Soe Thein For Vr no 12114 Cheque no 109457\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '4501200', '0', 'mmk', '', '', 0, 'accepted'),
(142, '2024-09-19', 'Dr-Sep 24/395', '3600/001', 'Paid to Soe Thein For Vr no 12114 Cheque no 109457\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '4501200', 'mmk', '', '', 0, 'accepted'),
(143, '2024-09-19', 'Dr-Sep 24/396', '4000/t07', 'Paid to Thaung Tun For Vr no 12032,12045,12052,12064\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '10000000', '0', 'mmk', '', '', 0, 'accepted'),
(144, '2024-09-19', 'Dr-Sep 24/396', '3600/001', 'Paid to Thaung Tun For Vr no 12032,12045,12052,12064\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '10000000', 'mmk', '', '', 0, 'accepted'),
(145, '2024-09-19', 'Dr-Sep 24/397', '4000/t02', 'Paid to Thein Htay For Vr no 12105,12107,12123,12130 Cheque no 109464\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '25000000', '0', 'mmk', '', '', 0, 'accepted'),
(146, '2024-09-19', 'Dr-Sep 24/397', '3600/001', 'Paid to Thein Htay For Vr no 12105,12107,12123,12130 Cheque no 109464\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '25000000', 'mmk', '', '', 0, 'accepted'),
(147, '2024-09-19', 'Dr-Sep 24/398', '4000/t05', 'Paid to Thet Oo For Vr no 11881,11888,11897,11903,11904 Cheque no 109469\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '48100375', '0', 'mmk', '', '', 0, 'accepted'),
(148, '2024-09-19', 'Dr-Sep 24/398', '3600/001', 'Paid to Thet Oo For Vr no 11881,11888,11897,11903,11904 Cheque no 109469\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '48100375', 'mmk', '', '', 0, 'accepted'),
(149, '2024-09-19', 'Dr-Sep 24/399', '4000/t15', 'Paid to Thet Oo (TCL) For Vr no 00155,00156 Cheque no 109469\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '41899625', '0', 'mmk', '', '', 0, 'accepted'),
(150, '2024-09-19', 'Dr-Sep 24/399', '3600/001', 'Paid to Thet Oo (TCL) For Vr no 00155,00156 Cheque no 109469\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '41899625', 'mmk', '', '', 0, 'accepted'),
(151, '2024-09-19', 'Dr-Sep 24/400', '4000/t03', 'Paid to Thin Thin Yee For Vr no 12065,12098 Cheque no 109454\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '6167260', '0', 'mmk', '', '', 0, 'accepted'),
(152, '2024-09-19', 'Dr-Sep 24/400', '3600/001', 'Paid to Thin Thin Yee For Vr no 12065,12098 Cheque no 109454\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '6167260', 'mmk', '', '', 0, 'accepted'),
(153, '2024-09-19', 'Dr-Sep 24/401', '4000/t17', 'Paid to Than Than Myint For Vr no 12104,12093 Cheque no 109463\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '7658840', '0', 'mmk', '', '', 0, 'accepted'),
(154, '2024-09-19', 'Dr-Sep 24/401', '3600/001', 'Paid to Than Than Myint For Vr no 12104,12093 Cheque no 109463\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '7658840', 'mmk', '', '', 0, 'accepted'),
(155, '2024-09-19', 'Dr-Sep 24/402', '4000/k07', 'Paid to Khin Maung Myint For Vr no 12121,12108 Cheque no 109461\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '6710900', '0', 'mmk', '', '', 0, 'accepted'),
(156, '2024-09-19', 'Dr-Sep 24/402', '3600/001', 'Paid to Khin Maung Myint For Vr no 12121,12108 Cheque no 109461\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '6710900', 'mmk', '', '', 0, 'accepted'),
(157, '2024-09-19', 'Dr-Sep 24/403', '4000/k10', 'Paid to Ko Myo For Vr no 12137 Cheque no 109465\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '734700', '0', 'mmk', '', '', 0, 'accepted'),
(158, '2024-09-19', 'Dr-Sep 24/403', '3600/001', 'Paid to Ko Myo For Vr no 12137 Cheque no 109465\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '734700', 'mmk', '', '', 0, 'accepted'),
(159, '2024-09-19', 'Dr-Sep 24/404', '4000/z03', 'Paid to Zaw Myat Thu For Vr no 12092,12115,12149,12160 Cheque no 109460\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '35169800', '0', 'mmk', '', '', 0, 'accepted'),
(160, '2024-09-19', 'Dr-Sep 24/404', '3600/001', 'Paid to Zaw Myat Thu For Vr no 12092,12115,12149,12160 Cheque no 109460\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '35169800', 'mmk', '', '', 0, 'accepted'),
(161, '2024-09-19', 'Dr-Sep 24/405', '4000/t01', 'Paid to Thet Paing For Vr no 12159 Cheque no 109458\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '18749100', '0', 'mmk', '', '', 0, 'accepted'),
(162, '2024-09-19', 'Dr-Sep 24/405', '3600/001', 'Paid to Thet Paing For Vr no 12159 Cheque no 109458\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '18749100', 'mmk', '', '', 0, 'accepted'),
(163, '2024-09-19', 'Dr-Sep 24/406', '4000/s10', 'Paid to Carton Box Shwe Myay For Vr Date 27.8.24 Cheque no 109471\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '7000000', '0', 'mmk', '', '', 0, 'accepted'),
(164, '2024-09-19', 'Dr-Sep 24/406', '3600/001', 'Paid to Carton Box Shwe Myay For Vr Date 27.8.24 Cheque no 109471\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '7000000', 'mmk', '', '', 0, 'accepted'),
(165, '2024-09-19', 'Dr-Sep 24/407', '4000/m04', 'Paid to Carton Box MMMO Cheque no 109472\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '1876800', '0', 'mmk', '', '', 0, 'accepted'),
(166, '2024-09-19', 'Dr-Sep 24/407', '3600/001', 'Paid to Carton Box MMMO Cheque no 109472\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '1876800', 'mmk', '', '', 0, 'accepted'),
(167, '2024-09-19', 'Dr-Sep 24/408', '4000/p03', 'Paid to Carton Box Pan Thazin For Vr Date 26.8.24,27.8.24 Cheque no 109473\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '2000000', '0', 'mmk', '', '', 0, 'accepted'),
(168, '2024-09-19', 'Dr-Sep 24/408', '3600/001', 'Paid to Carton Box Pan Thazin For Vr Date 26.8.24,27.8.24 Cheque no 109473\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '2000000', 'mmk', '', '', 0, 'accepted'),
(169, '2024-09-19', 'Dr-Sep 24/409', '4000/d04', 'Paid to Dalian Ice For Vr Date 29.8.24,13.9.24 Cheque no 109474\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '2920000', '0', 'mmk', '', '', 0, 'accepted'),
(170, '2024-09-19', 'Dr-Sep 24/409', '3600/001', 'Paid to Dalian Ice For Vr Date 29.8.24,13.9.24 Cheque no 109474\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '2920000', 'mmk', '', '', 0, 'accepted'),
(171, '2024-09-19', 'Dr-Sep 24/410', '4000/g03', 'Paid to Plastic Golden Fish For Vr Date 12.9.24,13.9.24,18.9.24 Cheque no 109475\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '3760900', '0', 'mmk', '', '', 0, 'accepted'),
(172, '2024-09-19', 'Dr-Sep 24/410', '3600/001', 'Paid to Plastic Golden Fish For Vr Date 12.9.24,13.9.24,18.9.24 Cheque no 109475\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '0', '3760900', 'mmk', '', '', 0, 'accepted'),
(173, '2024-09-16', 'JV09-002', '3300/002', 'Credit Sale to USA Buyer for SAF-13/2024', '160251.06', '0', 'usd', 'SAF.13/24', 'SZLU9619489', 0, 'accepted'),
(174, '2024-09-16', 'JV09-002', '5000/001', 'Credit Sale to USA Buyer for SAF-13/2024', '0', '160251.06', 'usd', '', '', 0, 'accepted'),
(175, '2024-09-16', 'JV09-002', '3300/002', 'Credit Sale to USA Buyer for SAF-14/2024', '161919.92', '0', 'usd', 'SAF.14/24', 'FBIU5416339', 0, 'accepted'),
(176, '2024-09-16', 'JV09-002', '5000/001', 'Credit Sale to USA Buyer for SAF-14/2024', '0', '161919.92', 'usd', '', '', 0, 'accepted'),
(177, '2024-09-16', 'JV09-002', '3300/002', 'Credit Sale to USA Buyer for SAF-15/2024', '191655.35', '0', 'usd', 'SAF.15/24', 'FBIU5417612', 0, 'accepted'),
(178, '2024-09-16', 'JV09-002', '5000/001', 'Credit Sale to USA Buyer for SAF-15/2024', '0', '191655.35', 'usd', '', '', 0, 'accepted'),
(179, '2024-09-16', 'JV09-002', '3300/002', 'Credit Sale to USA Buyer for SAF-16/2024', '207412.5', '0', 'usd', 'SAF.16/24', 'OERU4242955', 0, 'accepted'),
(180, '2024-09-16', 'JV09-002', '5000/001', 'Credit Sale to USA Buyer for SAF-16/2024', '0', '207412.5', 'usd', '', '', 0, 'accepted'),
(181, '2024-09-16', 'JV09-002', '3300/002', 'Credit Sale to USA Buyer for SAF-17/2024', '71877.63', '0', 'usd', 'SAF.17/24', 'OERU4216933', 0, 'accepted'),
(182, '2024-09-16', 'JV09-002', '5000/001', 'Credit Sale to USA Buyer for SAF-17/2024', '0', '71877.63', 'usd', '', '', 0, 'accepted'),
(183, '2024-09-16', 'JV09-002', '3300/002', 'Credit Sale to USA Buyer for SAF-18/2024', '79575.81', '0', 'usd', 'SAF.18/24', 'SEKU9020043', 0, 'accepted'),
(184, '2024-09-16', 'JV09-002', '5000/001', 'Credit Sale to USA Buyer for SAF-18/2024', '0', '79575.81', 'usd', '', '', 0, 'accepted'),
(185, '2024-09-16', 'JV09-002', '3300/002', 'Credit Sale to USA Buyer for SAF-19/2024', '74139.39', '0', 'usd', 'SAF.19/24', 'FBIU5007881', 0, 'accepted'),
(186, '2024-09-16', 'JV09-002', '5000/001', 'Credit Sale to USA Buyer for SAF-19/2024', '0', '74139.39', 'usd', '', '', 0, 'accepted'),
(191, '2024-09-16', 'JV09-003', '3300/005', 'Adv; money transfer to All Vietnan Sense Ltd', '28480', '0', 'usd', '', '', 0, 'accepted'),
(192, '2024-09-16', 'JV09-003', '3700/001', 'Adv; money transfer to All Vietnan Sense Ltd', '0', '28480', 'usd', '', '', 0, 'accepted'),
(193, '2024-09-16', 'JV09-003', '3300/005', 'Cold Store, Packing Material and Freezing Charges adjusted with Adv; Money', '4930', '0', 'usd', '', '', 0, 'accepted'),
(194, '2024-09-16', 'JV09-003', '7000/002', 'Cold Store, Packing Material and Freezing Charges adjusted with Adv; Money', '0', '4930', 'usd', '', '', 0, 'accepted'),
(195, '2024-09-16', 'JV09-004', '3300/007', 'Credit Sale to SC Trader INV.35/23 to INV.15/24', '514727.02', '0', 'usd', 'Inv.35/23-15/24', 'Rohu,Katla', 0, 'accepted'),
(196, '2024-09-16', 'JV09-004', '5000/003', 'Credit Sale to SC Trader INV.35/23 to INV.15/24', '0', '514727.02', 'usd', '', '', 0, 'accepted'),
(197, '2024-09-16', 'JV09-005', '3300/006', 'Credit Sale to Bangladesh (Frozen) Container', '482932.6', '0', 'usd', 'SC.5/22,6/22,1/24,2/24', 'Frozen Container', 0, 'accepted'),
(198, '2024-09-16', 'JV09-005', '5000/004', 'Credit Sale to Bangladesh (Frozen) Container', '0', '482932.6', 'usd', '', '', 0, 'accepted'),
(199, '2024-09-30', 'JV09-006', '3700/001', 'USA Money Received to TD Account-Can', '55000', '0', 'usd', '', '', 0, 'accepted'),
(200, '2024-09-30', 'JV09-006', '3300/002', 'USA Money Received to TD Account-Can', '0', '55000', 'usd', '', '', 0, 'accepted'),
(201, '2024-09-30', 'JV09-006', '9100/009', 'Bank Charges for USA Money Received to TD Account-Can', '47.5', '0', 'usd', '', '', 0, 'accepted'),
(202, '2024-09-30', 'JV09-006', '3700/001', 'Bank Charges for USA Money Received to TD Account-Can', '0', '47.5', 'usd', '', '', 0, 'accepted'),
(203, '2024-09-30', 'JV09-007', '3400/005', 'USA Money Received to RBC Account-Can and that money temporary loan to LM Global for Freight in and out', '55000', '0', 'usd', '', '', 0, 'accepted'),
(204, '2024-09-30', 'JV09-007', '3300/002', 'USA Money Received to RBC Account-Can and that money temporary loan to LM Global for Freight in and out', '0', '55000', 'usd', '', '', 0, 'accepted'),
(205, '2024-09-30', 'JV09-008', '3300/002', 'Credit Sale to USA Buyer for SAF.20/24 and SAF.21//24', '167667.27', '0', 'usd', 'SAF.20/24 & 21/24', 'HLBU9522593/9538590', 0, 'accepted'),
(206, '2024-09-30', 'JV09-008', '5000/001', 'Credit Sale to USA Buyer for SAF.20/24 and SAF.21//24', '0', '167667.27', 'usd', '', '', 0, 'accepted'),
(207, '2024-09-30', 'JV09-009', '3700/002', 'Money Received from Can Buyer for Can No.11', '137000', '0', 'usd', '', '', 0, 'accepted'),
(208, '2024-09-30', 'JV09-009', '3300/003', 'Money Received from Can Buyer for Can No.11', '0', '137000', 'usd', '', '', 0, 'accepted'),
(209, '2024-10-03', 'JV10-001', '3300/002', 'Credit Sale to USA Buyer for SAF.22/2024', '77508.9', '0', 'usd', 'SAF.22/24', 'HLBU9629935', 0, 'accepted'),
(210, '2024-10-03', 'JV10-001', '5000/001', 'Credit Sale to USA Buyer for SAF.22/2024', '0', '77508.9', 'usd', '', '', 0, 'accepted'),
(211, '2024-10-04', 'JV10-002', '3300/003', 'Credit Sale to Can Buyer for Can.16/2024', '147256.52', '0', 'usd', 'Can.16/24', 'FBIU5059817', 0, 'accepted'),
(212, '2024-10-04', 'JV10-002', '5000/002', 'Credit Sale to Can Buyer for Can.16/2024', '0', '147256.52', 'usd', '', '', 0, 'accepted'),
(213, '2024-10-04', 'JV10-003', '3700/002', 'Money Received from Can for Can.11 and 12', '60000', '0', 'usd', '', '', 0, 'accepted'),
(214, '2024-10-04', 'JV10-003', '3300/003', 'Money Received from Can for Can.11 and 12', '0', '60000', 'usd', '', '', 0, 'accepted'),
(215, '2024-10-07', 'JV10-004', '3700/001', 'Money Received from USA for SAF.13/24', '65000', '0', 'usd', '', '', 0, 'accepted'),
(216, '2024-10-07', 'JV10-004', '3300/002', 'Money Received from USA for SAF.13/24', '0', '65000', 'usd', '', '', 0, 'accepted'),
(217, '2024-10-07', 'JV10-004', '9100/009', 'Bank Charges for Money Received from USA for SAF.13/24', '47.5', '0', 'usd', '', '', 0, 'accepted'),
(218, '2024-10-07', 'JV10-004', '3700/001', 'Bank Charges for Money Received from USA for SAF.13/24', '0', '47.5', 'usd', '', '', 0, 'accepted'),
(219, '2024-10-11', 'JV10-005', '3700/001', 'Money Received from USA for SAF.13/24', '65000', '0', 'usd', '', '', 0, 'accepted'),
(220, '2024-10-11', 'JV10-005', '3300/002', 'Money Received from USA for SAF.13/24', '0', '65000', 'usd', '', '', 0, 'accepted'),
(221, '2024-10-11', 'JV10-005', '9100/009', 'Bank Charges for Money Received from USA for SAF.13/24', '47.5', '0', 'usd', '', '', 0, 'accepted'),
(222, '2024-10-11', 'JV10-005', '3700/001', 'Bank Charges for Money Received from USA for SAF.13/24', '0', '47.5', 'usd', '', '', 0, 'accepted'),
(223, '2024-10-12', 'JV10-006', '3700/002', 'Money Received from Can Buyer for Can.12', '47000', '0', 'usd', '', '', 0, 'accepted'),
(224, '2024-10-12', 'JV10-006', '3300/003', 'Money Received from Can Buyer for Can.12', '0', '47000', 'usd', '', '', 0, 'accepted'),
(225, '2024-09-30', 'JV09-010', '3800/001', 'Money Received from Border Trade-TCL (taka 1200000/122) / 1200000taka*38.1ks / $9836.07*4648.2ks', '9836.07', '0', 'usd', '', '', 0, 'accepted'),
(226, '2024-09-30', 'JV09-010', '3300/007', 'Money Received from Border Trade-TCL (taka 1200000/122) / 1200000taka*38.1ks / $9836.07*4648.2ks', '0', '9836.07', 'usd', '', '', 0, 'accepted'),
(227, '2024-09-30', 'JV09-011', '3800/001', 'Money Received from Frozen-Bangladesh (taka 2600000/122) / 2600000taka*38.1ks / $21311.48*4648.2ks and Teacher Transfer to Thai Law FIrm for ACE (Thai) baht 30000/31', '22279.22', '0', 'usd', '', '', 0, 'accepted'),
(228, '2024-09-30', 'JV09-011', '3300/006', 'Money Received from Frozen-Bangladesh (taka 2600000/122) / 2600000taka*38.1ks / $21311.48*4648.2ks and Teacher Transfer to Thai Law FIrm for ACE (Thai) baht 30000/31', '0', '22279.22', 'usd', '', '', 0, 'accepted'),
(229, '2024-10-03', 'JV10-007', '3800/001', 'Money Received from Border Trade-TCL (taka 500000/122) / 500000taka*36.2ks / $4098.36*4416.4ks', '4098.36', '0', 'usd', '', '', 0, 'accepted'),
(230, '2024-10-03', 'JV10-007', '3300/007', 'Money Received from Border Trade-TCL (taka 500000/122) / 500000taka*36.2ks / $4098.36*4416.4ks', '0', '4098.36', 'usd', '', '', 0, 'accepted'),
(231, '2024-10-03', 'JV10-008', '3800/001', 'Money Received from Frozen-Container (taka 3500000/122) / 3500000taka*36.2ks / $28688.52*4416.4ks', '28688.52', '0', 'usd', '', '', 0, 'accepted'),
(232, '2024-10-03', 'JV10-008', '3300/006', 'Money Received from Frozen-Container (taka 3500000/122) / 3500000taka*36.2ks / $28688.52*4416.4ks', '0', '28688.52', 'usd', '', '', 0, 'accepted'),
(233, '2024-10-10', 'JV10-009', '3300/007', 'Credit Sale to Border Trade-TCL for TCL.16/24', '16232.17', '0', 'usd', 'TCL.16/24', 'Rohu,Katla', 0, 'accepted'),
(234, '2024-10-10', 'JV10-009', '5000/003', 'Credit Sale to Border Trade-TCL for TCL.16/24', '0', '16232.17', 'usd', '', '', 0, 'accepted'),
(237, '2024-09-19', 'Cr-Sep 24/006', '3600/001', 'Can Money from UAB Bank $42000-Bank Chg; 150.18 = $41849.82 100%selling @4300 ($41849.82*4300ks)', '180600000', '0', 'usd', '', '', 150.18, 'accepted'),
(238, '2024-09-19', 'Cr-Sep 24/006', '3700/002', 'Can Money from UAB Bank $42000-Bank Chg; 150.18 = $41849.82 100%selling @4300 ($41849.82*4300ks)', '0', '180600000', 'usd', '', '', 0, 'accepted'),
(239, '2024-09-19', 'Cr-Sep 24/007', '3600/001', 'USA Money from UAB Bank (Sarmad Transfer) 17.9.24 $70000- Bank chg;220.26 = $69779.74 100%selling @4280 ($69779.74*3900ks LM / $69779.74*380ks Nan)', '299600000', '0', 'usd', '', '', 220.26, 'accepted'),
(240, '2024-09-19', 'Cr-Sep 24/007', '3700/001', 'USA Money from UAB Bank (Sarmad Transfer) 17.9.24 $70000- Bank chg;220.26 = $69779.74 100%selling @4280 ($69779.74*3900ks LM / $69779.74*380ks Nan)', '0', '299600000', 'usd', '', '', 0, 'accepted'),
(241, '2024-09-19', 'Cr-Sep 24/008', '3600/001', 'Technak Deposit Money Surplus Received for TCL.14 (Rohu 5203.8V*5525ks = 28750995ks-Adv; 30000000 = Surplus 1249005', '1249005', '0', 'mmk', '', '', 0, 'accepted'),
(242, '2024-09-19', 'Cr-Sep 24/008', '9100/033', 'Technak Deposit Money Surplus Received for TCL.14 (Rohu 5203.8V*5525ks = 28750995ks-Adv; 30000000 = Surplus 1249005', '0', '1249005', 'mmk', '', '', 0, 'accepted'),
(245, '2024-09-30', 'JV09-012', '9100/009', 'Bank Charges for 16.9.24 UAB 70000(37.81)+25.9.24 NNS 20000(38.15)+Kolkata 28480(38.15)+ WPS Billing 150', '264.11', '0', 'usd', '', '', 0, 'accepted'),
(246, '2024-09-30', 'JV09-012', '3700/001', 'Bank Charges for 16.9.24 UAB 70000(37.81)+25.9.24 NNS 20000(38.15)+Kolkata 28480(38.15)+ WPS Billing 150', '0', '264.11', 'usd', '', '', 0, 'accepted'),
(249, '2024-09-27', 'Cr-Sep 24/010', '3600/001', 'USA money from NNS (Sarmad Transfer) $20000- Bank chg; 28.05 = $19971.95 * 4670ks', '93400000', '0', 'usd', '', '', 28.05, 'accepted'),
(250, '2024-09-27', 'Cr-Sep 24/010', '3700/001', 'USA money from NNS (Sarmad Transfer) $20000- Bank chg; 28.05 = $19971.95 * 4670ks', '0', '93400000', 'usd', '', '', 0, 'accepted'),
(251, '2024-09-27', 'Cr-Sep 24/011', '3600/001', 'Money Received from Border Trade-TCL (taka 1200000/122) / 1200000taka*38.1ks / $9836.07*4648.2ks', '45720020.574', '0', 'usd', '', '', 0, 'accepted'),
(252, '2024-09-27', 'Cr-Sep 24/011', '3800/001', 'Money Received from Border Trade-TCL (taka 1200000/122) / 1200000taka*38.1ks / $9836.07*4648.2ks', '0', '45720020.574', 'usd', '', '', 0, 'accepted'),
(253, '2024-09-27', 'Cr-Sep 24/012', '3600/001', 'Money Received from Frozen-Bangladesh (taka 2600000/122) / 2600000taka*38.1ks / $21311.48*4648.2ks', '99060021.336', '0', 'usd', '', '', 0, 'accepted'),
(254, '2024-09-27', 'Cr-Sep 24/012', '3800/001', 'Money Received from Frozen-Bangladesh (taka 2600000/122) / 2600000taka*38.1ks / $21311.48*4648.2ks', '0', '99060021.336', 'usd', '', '', 0, 'accepted'),
(255, '2024-09-30', 'JV09-013', '3400/006', 'Teacher Transfer to Thai Law Firm for ACE (Thai) baht 30000/31, that money adjusted with Frozen Account', '967.74', '0', 'usd', '', '', 0, 'accepted'),
(256, '2024-09-30', 'JV09-013', '3800/001', 'Teacher Transfer to Thai Law Firm for ACE (Thai) baht 30000/31, that money adjusted with Frozen Account', '0', '967.74', 'usd', '', '', 0, 'accepted'),
(257, '2024-10-01', 'JV10-010', '9100/017', 'Air Ticket Fees for Sir Sarmad CAD 1795@1.316 (Can to Bangladesh)', '1363.98', '0', 'usd', '', '', 0, 'accepted'),
(258, '2024-10-01', 'JV10-010', '3700/001', 'Air Ticket Fees for Sir Sarmad CAD 1795@1.316 (Can to Bangladesh)', '0', '1363.98', 'usd', '', '', 0, 'accepted'),
(259, '2024-10-04', 'JV10-011', '9100/001', 'Sir Sarmad Salary Taken for Oct\'24 CAD 2000/1.3216', '1513.32', '0', 'usd', '', '', 0, 'accepted'),
(260, '2024-10-04', 'JV10-011', '3700/001', 'Sir Sarmad Salary Taken for Oct\'24 CAD 2000/1.3216', '0', '1513.32', 'usd', '', '', 0, 'accepted'),
(261, '2024-10-07', 'JV10-012', '4000/003', 'Paid to Jiangyin Junnan Packaging Co.,Ltd for China Plastic (1st time ADV;)', '8000', '0', 'usd', '', '', 0, 'accepted'),
(262, '2024-10-07', 'JV10-012', '3700/001', 'Paid to Jiangyin Junnan Packaging Co.,Ltd for China Plastic (1st time ADV;)', '0', '8000', 'usd', '', '', 0, 'accepted'),
(263, '2024-10-10', 'JV10-013', '9100/009', 'Bank Charges for 2.10.24 NNS 35000(38.19)+7.10.24 China Plastic 8000(37.8)+9.10.24 UAB 50000(37.59)', '113.58', '0', 'usd', '', '', 0, 'accepted'),
(264, '2024-10-10', 'JV10-013', '3700/001', 'Bank Charges for 2.10.24 NNS 35000(38.19)+7.10.24 China Plastic 8000(37.8)+9.10.24 UAB 50000(37.59)', '0', '113.58', 'usd', '', '', 0, 'accepted'),
(265, '2024-10-03', 'Cr-Sep 24/010', '3600/001', 'USA Money from NNS (Sarmad Transfer) $35000-Bank chg; 40.27 = $34959.73 * 4415ks', '154525000', '0', 'usd', '', '', 40.27, 'accepted'),
(266, '2024-10-03', 'Cr-Sep 24/010', '3700/001', 'USA Money from NNS (Sarmad Transfer) $35000-Bank chg; 40.27 = $34959.73 * 4415ks', '0', '154525000', 'usd', '', '', 0, 'accepted'),
(267, '2024-10-03', 'Cr-Sep 24/011', '3600/001', 'Money Received from Frozen-Container (taka 3500000/122) / 3500000taka*36.2ks / $28688.52*4416.4ks	', '126688504.32', '0', 'usd', '', '', 0, 'accepted'),
(268, '2024-10-03', 'Cr-Sep 24/011', '3800/001', 'Money Received from Frozen-Container (taka 3500000/122) / 3500000taka*36.2ks / $28688.52*4416.4ks	', '0', '126688504.32', 'usd', '', '', 0, 'accepted'),
(269, '2024-10-03', 'Cr-Sep 24/012', '3600/001', 'Money Received from Border Trade-TCL (taka 500000/122) / 500000taka*36.2ks / $4098.36*4416.4ks', '18098357.76', '0', 'usd', '', '', 0, 'accepted'),
(270, '2024-10-03', 'Cr-Sep 24/012', '3800/001', 'Money Received from Border Trade-TCL (taka 500000/122) / 500000taka*36.2ks / $4098.36*4416.4ks', '0', '18098357.76', 'usd', '', '', 0, 'accepted'),
(271, '2024-09-26', 'JV09-014', '3700/003', 'Can Money Received from UAB 19.9.24 $50000- Bank chg; 170.31 = $49829.69 100%selling @4290 ', '214500000', '0', 'mmk', '', '', 0, 'accepted'),
(272, '2024-09-26', 'JV09-014', '3700/002', 'Can Money Received from UAB 19.9.24 $50000- Bank chg; 170.31 = $49829.69 100%selling @4290 ', '0', '214500000', 'usd', '', '', 0, 'accepted'),
(273, '2024-09-26', 'Cr-Sep 24/009', '3600/001', 'Can Money Received from UAB 19.9.24 $50000- Bank chg; 170.31 = $49829.69 100%selling @4290 ($49829.69*3900ks LM / Balance @390 )', '195000000', '0', 'usd', '', '', 170.31, 'accepted'),
(274, '2024-09-26', 'Cr-Sep 24/009', '3700/003', 'Can Money Received from UAB 19.9.24 $50000- Bank chg; 170.31 = $49829.69 100%selling @4290 ($49829.69*3900ks LM / Balance @390 )', '0', '195000000', 'usd', '', '', 0, 'accepted'),
(275, '2024-10-07', 'Cr-Sep 24/013', '3600/001', 'Can Money Received from UAB 19.9.24 $50000- Bank chg; 170.31 = $49829.69 100%selling @4290 26.9.24 Balance Money 49829.69*390ks (Cr-Sep 24/009)', '19500000', '0', 'usd', '', '', 170.31, 'accepted'),
(276, '2024-10-07', 'Cr-Sep 24/013', '3700/003', 'Can Money Received from UAB 19.9.24 $50000- Bank chg; 170.31 = $49829.69 100%selling @4290 26.9.24 Balance Money 49829.69*390ks (Cr-Sep 24/009)', '0', '19500000', 'usd', '', '', 0, 'accepted');

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
(527, '10:04:23.000000', '2024-09-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(528, '02:32:10.000000', '2024-09-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(529, '01:37:18.000000', '2024-09-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(530, '11:01:54.000000', '2024-09-29', 'Administrator', 'protechadmin2024***', 'Login Success'),
(531, '02:29:27.000000', '2024-10-03', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(532, '02:51:51.000000', '2024-10-03', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(533, '10:33:52.000000', '2024-10-04', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(534, '11:58:46.000000', '2024-10-04', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(535, '12:31:33.000000', '2024-10-04', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(536, '01:56:54.000000', '2024-10-04', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(537, '11:27:58.000000', '2024-10-05', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(538, '12:12:08.000000', '2024-10-05', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(539, '12:50:50.000000', '2024-10-05', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(540, '02:06:30.000000', '2024-10-05', 'Ma Sandar Aung', '12341234', 'Login Success'),
(541, '04:46:27.000000', '2024-10-05', 'Ma Sandar Aung', '', 'Logout Success'),
(542, '02:17:21.000000', '2024-10-07', 'Administrator', 'protechadmin2024***', 'Login Success'),
(543, '02:27:46.000000', '2024-10-07', 'Ma Soe Soe Khaing', 'Stockstock', 'Login Password Invalid'),
(544, '02:27:46.000000', '2024-10-07', 'Ma Soe Soe Khaing', 'Stockstock', 'Login Password Invalid'),
(545, '02:28:23.000000', '2024-10-07', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(546, '02:33:15.000000', '2024-10-07', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(547, '02:34:42.000000', '2024-10-07', 'Ma Soe Soe Khaing', 'stocksrock', 'Login Password Invalid'),
(548, '02:35:10.000000', '2024-10-07', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(549, '02:54:11.000000', '2024-10-07', 'Administrator', 'protechadmin2024***', 'Login Success'),
(550, '02:54:41.000000', '2024-10-07', 'Administrator', 'protechadmin2024***', 'Login Success'),
(551, '02:54:42.000000', '2024-10-07', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(552, '04:54:55.000000', '2024-10-07', 'Administrator', 'protechadmin2024***', 'Login Success'),
(553, '12:45:56.000000', '2024-10-08', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(554, '01:05:57.000000', '2024-10-08', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(555, '01:26:04.000000', '2024-10-08', 'Ma Soe Soe Khaing', 'stocktock', 'Login Password Invalid'),
(556, '02:08:50.000000', '2024-10-08', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(557, '03:01:45.000000', '2024-10-08', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(558, '03:06:30.000000', '2024-10-08', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(559, '03:12:05.000000', '2024-10-08', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(560, '04:14:36.000000', '2024-10-08', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(561, '10:02:02.000000', '2024-10-09', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(562, '11:24:22.000000', '2024-10-09', 'Su Thiri Kyaw', 'su1223', 'Login Password Invalid'),
(563, '11:24:32.000000', '2024-10-09', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(564, '02:33:37.000000', '2024-10-09', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(565, '02:42:51.000000', '2024-10-09', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(566, '03:08:49.000000', '2024-10-09', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(567, '03:15:36.000000', '2024-10-09', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(568, '03:17:44.000000', '2024-10-09', 'Administrator', 'protechadmin2024***', 'Login Success'),
(569, '04:20:39.000000', '2024-10-09', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(570, '09:41:45.000000', '2024-10-10', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(571, '09:44:55.000000', '2024-10-10', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(572, '12:57:09.000000', '2024-10-10', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(573, '12:57:24.000000', '2024-10-10', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(574, '01:01:55.000000', '2024-10-10', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(575, '01:06:38.000000', '2024-10-10', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(576, '01:51:41.000000', '2024-10-10', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(577, '02:32:40.000000', '2024-10-10', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(578, '02:32:40.000000', '2024-10-10', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(579, '09:18:36.000000', '2024-10-11', 'Ma Sandar Aung', '12341234', 'Login Success'),
(580, '11:13:47.000000', '2024-10-11', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(581, '11:58:33.000000', '2024-10-11', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(582, '12:16:49.000000', '2024-10-11', 'Ma Sandar Aung', '', 'Logout Success'),
(583, '01:05:22.000000', '2024-10-11', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(584, '01:39:27.000000', '2024-10-11', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(585, '03:14:29.000000', '2024-10-11', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(586, '03:54:23.000000', '2024-10-11', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(587, '11:08:53.000000', '2024-10-12', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(588, '12:36:51.000000', '2024-10-12', 'Ma Sandar Aung', '12341234', 'Login Success'),
(589, '12:13:30.000000', '2024-10-14', 'administrator', 'protechadmin2024***', 'Login Success'),
(590, '12:14:04.000000', '2024-10-14', 'administrator', '', 'Logout Success'),
(591, '12:14:24.000000', '2024-10-14', 'lin lin naing', 'coldstore', 'Login Success'),
(592, '12:14:34.000000', '2024-10-14', 'lin lin naing', '', 'Logout Success'),
(593, '12:14:41.000000', '2024-10-14', 'lin lin naing', 'coldstore', 'Login Success'),
(594, '12:14:46.000000', '2024-10-14', 'lin lin naing', '', 'Logout Success'),
(595, '12:15:08.000000', '2024-10-14', 'lin lin naing', 'coldstore', 'Login Success'),
(596, '12:15:13.000000', '2024-10-14', 'lin lin naing', '', 'Logout Success'),
(597, '12:15:21.000000', '2024-10-14', 'lin lin naing', 'coldstore', 'Login Success'),
(598, '12:15:27.000000', '2024-10-14', 'lin lin naing', '', 'Logout Success'),
(599, '12:18:48.000000', '2024-10-14', 'lin lin naing', 'coldstore', 'Login Success'),
(600, '12:19:23.000000', '2024-10-14', 'lin lin naing', 'coldstore', 'Login Success'),
(601, '12:20:04.000000', '2024-10-14', 'lin lin naing', 'coldstore', 'Login Success'),
(602, '12:20:53.000000', '2024-10-14', 'lin lin naing', 'coldstore', 'Login Success'),
(603, '12:20:54.000000', '2024-10-14', 'lin lin naing', 'coldstore', 'Login Success'),
(604, '01:52:16.000000', '2024-10-14', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(605, '02:13:45.000000', '2024-10-14', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(606, '01:55:16.000000', '2024-10-15', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(607, '02:24:36.000000', '2024-10-15', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(608, '12:25:09.000000', '2024-10-19', 'Administrator', 'protechadmin2024***', 'Login Success'),
(609, '05:42:17.000000', '2024-10-19', 'Administrator', '', 'Logout Success'),
(610, '02:08:36.000000', '2024-10-20', 'Administrator', 'protechadmin2024***', 'Login Success');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=422;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;

--
-- AUTO_INCREMENT for table `form7stock`
--
ALTER TABLE `form7stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=564;

--
-- AUTO_INCREMENT for table `form7stocktcl`
--
ALTER TABLE `form7stocktcl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `form10stock`
--
ALTER TABLE `form10stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `form10stocktcl`
--
ALTER TABLE `form10stocktcl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `general_ledger`
--
ALTER TABLE `general_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=587;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322;

--
-- AUTO_INCREMENT for table `gfctotal`
--
ALTER TABLE `gfctotal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hhkmcstock`
--
ALTER TABLE `hhkmcstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=628;

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
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=577;

--
-- AUTO_INCREMENT for table `receivable`
--
ALTER TABLE `receivable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=611;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
