-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2025 at 10:54 AM
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
(418, '3700/002', 35, 'UAB Bank (USD) A/C'),
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
(469, '4000/999', 40, 'Peter'),
(470, '4000/Y03', 40, 'Ye Ko'),
(471, '4000/A23', 40, 'Aung Kyaw Thant'),
(472, '4000/K21', 40, 'Kyaw Zin Phyo '),
(473, '4000/H04', 40, 'Hman Kyi'),
(474, '4000/O02', 40, 'Oak Kar'),
(475, '3300/008', 35, 'BRUNEI A/C'),
(476, '5000/007', 36, 'Credit Sale - Brunei A/C'),
(477, '3700/004', 35, 'AYA USD A/C'),
(478, '3700/005', 35, 'AYA MMK A/C'),
(479, '3300/008', 35, 'BRUNEI A/C'),
(480, '4000/H05', 40, 'Hla Hla Win'),
(481, '4000/T23', 40, 'Thin Zar'),
(482, '3300/009', 35, 'SC Fruit A/C - Mango A/C'),
(483, '3300/009', 35, 'SC Fruit A/C - Mango A/C'),
(484, '3300/010', 35, 'SC Fruit A/C - Apple A/C'),
(485, '3300/011', 35, 'H - Trader A/C'),
(486, '4000/A24', 40, 'ACE (Myanmar) USD A/C'),
(489, '3400/005', 35, 'Receivable from LM Global (USD) A/C'),
(490, '3400/006', 35, 'Receivable from LM Global (MMK) A/C'),
(491, '3700/006', 35, 'UAB Bank (Nan) A/C'),
(492, '3300/012', 35, 'Link Mark Impex');

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
(1, '2025-04-01', '', '3600/001', 'Opening Balance of Apr\'2025', '0', '0', '16703814', NULL, NULL, 0, 0),
(2, '2025-04-01', '', '3600/001', 'ADV; money Return from Ma Pyone for 31.3.2025\r\n', '200000', '0', '16903814', 'Cr-Apr\'25/001', '9100/046', 1, 0),
(3, '2025-04-01', '', '3600/001', 'Monthly Phone Bill for 5000ks*4pcs/6000ks*4pcs for Apr\'25\r\n', '0', '44000', '16859814', 'Dr-Apr\'25/001', '9100/004', 4, 0),
(4, '2025-04-01', '', '3600/001', 'YTP Internet Bill for Sir House of Mar\'25\r\n', '0', '60375', '16799439', 'Dr-Apr\'25/002', '9100/004', 6, 0),
(5, '2025-04-01', '', '3600/001', ' Hi Internet Bill for W/H and Office of Apr\'25 \r\n', '0', '84125', '16715314', 'Dr-Apr\'25/003', '9100/004', 8, 0),
(6, '2025-04-01', '', '3600/001', 'Paid to MM Clare BL and Seal Charges for H Trader HT-01/25\r\n', '0', '76000', '16639314', 'Dr-Apr\'25/004', '9100/041', 10, 0),
(7, '2025-04-01', '', '3600/001', 'Inbound and Outbound Tour Licence Renew Form Charges\r\n', '0', '6000', '16633314', 'Dr-Apr\'25/005', '9100/040', 12, 0),
(8, '2025-04-01', '', '3600/001', 'Taxi Charges for W/H to MM Clare to Time Square to W/H for BL Charges money sent\r\n', '0', '45300', '16588014', 'Dr-Apr\'25/006', '9100/002', 14, 0),
(9, '2025-04-01', '', '3600/001', 'Coffee and Other Purchase for Eid Festival Donation\r\n', '0', '119000', '16469014', 'Dr-Apr\'25/007', '9100/011', 16, 0),
(10, '2025-04-01', '', '3600/001', 'Rice,Fruit and Other Purchase for Eid Festival Donation\r\n', '0', '201300', '16267714', 'Dr-Apr\'25/008', '9100/011', 18, 0),
(11, '2025-04-01', '', '3600/001', 'Labour Charges for MSL Chito (70V*600ks)\r\n', '0', '42000', '16225714', 'Dr-Apr\'25/009', '6100/001', 20, 0),
(12, '2025-04-01', '', '3600/001', 'Taxi Charges for W/H to MSL to Ocean Pacific\r\n', '0', '13300', '16212414', 'Dr-Apr\'25/010', '9100/002', 22, 0),
(13, '2025-04-02', '', '3600/001', 'Water Bill Received from ACE \r\n', '5000', '0', '16217414', 'Cr-Apr\'25/002', '9100/013', 23, 0),
(14, '2025-04-02', '', '3600/001', 'Money Return from Thoon Set Paing for Spare Licence \r\n', '35000', '0', '16252414', 'Cr-Apr\'25/003', '9100/014', 25, 0),
(15, '2025-04-02', '', '3600/001', 'Account Adjustment for Mar\'25 Salary (Mar\'25 Salary ကို Apr\'25 တွင် Charge လုပ်ထားသောကြောင့် စာရင်းညွှိနှိုင်းမှု လုပ်ခြင်းဖြစ်သည်)\r\n', '22455240', '0', '38707654', 'Cr-Apr\'25/004', '9100/001', 27, 0),
(16, '2025-04-02', '', '3600/001', 'Taxi Charges for W/H to ACE Office\r\n', '0', '4500', '38703154', 'Dr-Apr\'25/036', '9100/002', 30, 0),
(17, '2025-04-02', '', '3600/001', 'Taxi Charges for W/H to LMG by Sandar\r\n', '0', '2000', '38701154', 'Dr-Apr\'25/037', '9100/002', 32, 0),
(18, '2025-04-02', '', '3600/001', 'Sir Phone Bill for 1.4.25\r\n', '0', '3000', '38698154', 'Dr-Apr\'25/038', '9100/004', 34, 0),
(19, '2025-04-02', '', '3600/001', 'BL,Seal and Document Fees for Can.03/25\r\n', '0', '215880', '38482274', 'Dr-Apr\'25/039', '9100/041', 36, 0),
(20, '2025-04-02', '', '3600/001', 'Airticket 2pcs Purchase for Sir and Daw Nan(YGN-BKK) 14.4.25-23.4.25\r\n', '0', '3110000', '35372274', 'Dr-Apr\'25/040', '9100/017', 38, 0),
(21, '2025-04-02', '', '3600/001', 'Taxi Charges for W/H to KBZ Bank go\r\n', '0', '5000', '35367274', 'Dr-Apr\'25/041', '9100/002', 40, 0),
(22, '2025-04-02', '', '3600/001', 'Taxi Charges for Eid Donation\r\n', '0', '9000', '35358274', 'Dr-Apr\'25/042', '9100/002', 42, 0),
(23, '2025-04-02', '', '3600/001', 'Donation for W/H Dogs\r\n', '0', '5000', '35353274', 'Dr-Apr\'25/043', '9100/011', 44, 0),
(24, '2025-04-02', '', '3600/001', 'Staff Salary for Mar\'25\r\n', '0', '22455240', '12898034', 'Dr-Apr\'25/044', '9100/001', 46, 0),
(25, '2025-04-02', '', '3600/001', 'Earthquake Donation for NPT-500000+YGN-300000 (28.3.25)\r\n', '0', '800000', '12098034', 'Dr-Apr\'25/045', '9100/011', 48, 0),
(26, '2025-04-03', '', '3600/001', 'Canada Money Received from May Yu (31.3.2025)$25000-$25 = $24975*4380ks\r\n', '109390500', '0', '121488534', 'Cr-Apr\'25/005', '3300/003', 49, 0),
(27, '2025-04-03', '', '3600/001', 'Taxi Charges for W/H to Sir House for Fish sent\r\n', '0', '4000', '121484534', 'Dr-Apr\'25/046', '9100/002', 52, 0),
(28, '2025-04-03', '', '3600/001', 'Paid to KMM for Vr.12924\r\n', '0', '20000000', '101484534', 'Dr-Apr\'25/047', '4000/k07', 54, 0),
(29, '2025-04-03', '', '3600/001', 'Paid to Thet Oo for Vr.12702,12758\r\n', '0', '20000000', '81484534', 'Dr-Apr\'25/048', '4000/t05', 56, 0),
(30, '2025-04-03', '', '3600/001', 'Paid to Kyaw Zay Ya for Vr.12448\r\n', '0', '30000000', '51484534', 'Dr-Apr\'25/049', '4000/k05', 58, 0),
(31, '2025-04-03', '', '3600/001', 'Paid to Tun Zaw Min for Vr.12636,12646,12652\r\n', '0', '30000000', '21484534', 'Dr-Apr\'25/050', '4000/t11', 60, 0),
(32, '2025-04-04', '', '3600/001', 'Paid to Plastic (Golden Fish) for 29.3.25,1.4.25,2.4.25\r\n', '0', '2694600', '18789934', 'Dr-Apr\'25/051', '4000/G03', 62, 0),
(33, '2025-04-04', '', '3600/001', 'DHL Charges for H Trader Documents sent to Bangladesh\r\n', '0', '277600', '18512334', 'Dr-Apr\'25/052', '9100/040', 64, 0),
(34, '2025-04-04', '', '3600/001', 'MC Box Carry Charges for Ocean Pacific to GFC 2Trucks\r\n', '0', '430000', '18082334', 'Dr-Apr\'25/053', '6100/005', 66, 0),
(35, '2025-04-04', '', '3600/001', 'Salt Purchase and Carry for Dry WP\r\n', '0', '27000', '18055334', 'Dr-Apr\'25/054', '9100/005', 68, 0),
(36, '2025-04-04', '', '3600/001', 'Guest List Charges \r\n', '0', '10000', '18045334', 'Dr-Apr\'25/055', '9100/005', 70, 0),
(37, '2025-04-04', '', '3600/001', 'Water 10pcs Purchase for W/H\r\n', '0', '11000', '18034334', 'Dr-Apr\'25/056', '9100/003', 72, 0),
(38, '2025-04-04', '', '3600/001', 'Taxi Charges for Ocean Pacific to W/H\r\n', '0', '5000', '18029334', 'Dr-Apr\'25/057', '9100/002', 74, 0),
(39, '2025-04-04', '', '3600/001', 'Kpay Charges for MC Box Carry money transfer\r\n', '0', '500', '18028834', 'Dr-Apr\'25/058', '9100/009', 76, 0),
(40, '2025-04-04', '', '3600/001', 'Roller Rope Purchase for W/H PK Machine\r\n\r\n', '0', '112000', '17916834', 'Dr-Apr\'25/059', '9100/007', 78, 0),
(41, '2025-04-04', '', '3600/001', 'Photo Sticker,Ledger, Knife Purchase and Taxi for W/H\r\n', '0', '188800', '17728034', 'Dr-Apr\'25/060', '6100/006', 80, 0),
(42, '2025-04-04', '', '3600/001', 'Bamboo Purchase for Dry WP\r\n', '0', '42000', '17686034', 'Dr-Apr\'25/061', '9100/005', 82, 0),
(43, '2025-04-04', '', '3600/001', 'Tissue 2pk Purchase for Office\r\n', '0', '7000', '17679034', 'Dr-Apr\'25/062', '9100/032', 84, 0),
(44, '2025-04-04', '', '3600/001', 'Bucket 1pcs Purchase for Office\r\n', '0', '3500', '17675534', 'Dr-Apr\'25/063', '9100/032', 86, 0),
(45, '2025-04-04', '', '3600/001', 'Water 10pcs Purchase for W/H\r\n', '0', '11000', '17664534', 'Dr-Apr\'25/064', '9100/003', 88, 0),
(46, '2025-04-04', '', '3600/001', 'Car Petrol for 3K-1574 5.4.25\r\n', '0', '50000', '17614534', 'Dr-Apr\'25/065', '9100/006', 90, 0),
(47, '2025-04-04', '', '3600/001', 'Sticker (LMH) and Kpay Charges\r\n', '0', '2380500', '15234034', 'Dr-Apr\'25/066', '6100/006', 92, 0),
(48, '2025-04-04', '', '3600/001', 'Car Break Oil Purchase for 3K-1574\r\n', '0', '16000', '15218034', 'Dr-Apr\'25/067', '9100/014', 94, 0),
(49, '2025-04-04', '', '3600/001', 'Sir Take from Daw Nan\r\n', '0', '50000', '15168034', 'Dr-Apr\'25/068', '9100/017', 96, 0),
(50, '2025-04-04', '', '3600/001', 'Car Petrol for 5L-2848\r\n', '0', '100000', '15068034', 'Dr-Apr\'25/069', '9100/006', 98, 0),
(51, '2025-04-06', '', '3600/001', 'Stabilizar Repair and Service Charges Adv For W/H\r\n', '0', '500000', '14568034', 'Dr-Apr\'25/070', '9100/027', 100, 0),
(52, '2025-04-06', '', '3600/001', 'Paid to Ocean Pacific Cold Store Charges\r\n', '0', '10000000', '4568034', 'Dr-Apr\'25/071', '6100/007', 102, 0),
(53, '2025-04-06', '', '3600/001', 'Labour Charges For GFC R.P (5.4.25)11000*11pcs,15000*5pcs\r\n', '0', '196000', '4372034', 'Dr-Apr\'25/072', '6100/001', 104, 0),
(54, '2025-04-06', '', '3600/001', 'Packing Machine 4 pcs Purchase For W/H\r\n', '0', '242200', '4129834', 'Dr-Apr\'25/073', '9100/031', 106, 0),
(55, '2025-04-06', '', '3600/001', 'Extention 2 pcs Purchase For W/H\r\n', '0', '50000', '4079834', 'Dr-Apr\'25/074', '9100/018', 108, 0),
(56, '2025-04-06', '', '3600/001', 'Maintenance For Sir House (March 25)\r\n', '0', '20000', '4059834', 'Dr-Apr\'25/075', '9100/007', 110, 0),
(57, '2025-04-06', '', '3600/001', 'Water Bill For Sir House (Feb 25)\r\n', '0', '5000', '4054834', 'Dr-Apr\'25/076', '9100/013', 112, 0),
(58, '2025-04-06', '', '3600/001', 'Labour Charges For GFC R.P (6.4.25)11000*13pcs,15000*5pcs\r\n', '0', '218000', '3836834', 'Dr-Apr\'25/077', '6100/001', 114, 0),
(59, '2025-04-06', '', '3600/001', 'Workers 16 pcs Dinner For (5.4) W/H OT\r\n', '0', '40000', '3796834', 'Dr-Apr\'25/078', '9100/012', 116, 0),
(60, '2025-04-06', '', '3600/001', 'Car Petro For 3K-1574 (6.4.25)\r\n', '0', '50000', '3746834', 'Dr-Apr\'25/079', '9100/006', 118, 0),
(61, '2025-04-06', '', '3600/001', 'Taxi Charges For Market Boys (4.5.6)\r\n', '0', '60000', '3686834', 'Dr-Apr\'25/080', '9100/002', 120, 0),
(62, '2025-04-06', '', '3600/001', 'Meal Allowance For Market Boy (4.5.6)\r\n', '0', '19500', '3667334', 'Dr-Apr\'25/081', '9100/012', 122, 0),
(63, '2025-04-07', '', '3600/001', 'Agent Adv,2% and X Ray For USA 7,8\r\n', '0', '8700000', '-5032666', 'Dr-Apr\'25/082', '9100/020', 124, 0),
(64, '2025-04-07', '', '3600/001', 'DOF Charges For USA 7,8\r\n', '0', '300000', '-5332666', 'Dr-Apr\'25/083', '9100/021', 126, 0),
(65, '2025-04-07', '', '3600/001', 'Sir Phone Bill For 7.4.25\r\n', '0', '3000', '-5335666', 'Dr-Apr\'25/084', '9100/004', 128, 0),
(66, '2025-04-07', '', '3600/001', 'Sir Take From Lai Lai For Meeting Go\r\n', '0', '20000', '-5355666', 'Dr-Apr\'25/085', '9100/017', 130, 0),
(67, '2025-04-07', '', '3600/001', 'Taxi Charges For W/H to Ocean Pacific go \r\n', '0', '13000', '-5368666', 'Dr-Apr\'25/086', '9100/002', 132, 0),
(68, '2025-04-07', '', '3600/001', 'Taxi Charges For Labour From Hlaing Thar Yar For GFC\r\n', '0', '25000', '-5393666', 'Dr-Apr\'25/087', '9100/002', 134, 0),
(69, '2025-04-07', '', '3600/001', 'Taxi Charges For Bamboo Purchase go For W/H (Dry-WP)\r\n', '0', '3000', '-5396666', 'Dr-Apr\'25/088', '9100/002', 136, 0),
(70, '2025-04-07', '', '3600/001', 'Taxi Charges For Battery Purchase For Hilsa Machine\r\n', '0', '10000', '-5406666', 'Dr-Apr\'25/089', '9100/002', 138, 0),
(71, '2025-04-07', '', '3600/001', '3 Pin 1 pcs Purchase For W/H\r\n', '0', '6000', '-5412666', 'Dr-Apr\'25/090', '9100/005', 140, 0),
(72, '2025-04-07', '', '3600/001', 'Paid to LMH-Sticker and K Pay Charges For W/H\r\n', '0', '3439200', '-8851866', 'Dr-Apr\'25/091', '6100/006', 142, 0),
(73, '2025-04-07', '', '3600/001', 'Taxi Charges For W/H to Ocean Pacific go (6.4.25,7.4.25)\r\n', '0', '48000', '-8899866', 'Dr-Apr\'25/092', '9100/002', 144, 0),
(74, '2025-04-07', '', '3600/001', 'Penan Bag Carry Charges For Ocean Pacific Pk\r\n', '0', '7000', '-8906866', 'Dr-Apr\'25/093', '9100/002', 146, 0),
(75, '2025-04-07', '', '3600/001', 'Paid to LMH-Sticker and Car Charges and K-Pay Charges For W/H\r\n', '0', '623500', '-9530366', 'Dr-Apr\'25/094', '6100/006', 148, 0),
(76, '2025-04-07', '', '3600/001', 'Battery 5 pcs Purchase For Hilsa Machine\r\n', '0', '15000', '-9545366', 'Dr-Apr\'25/095', '9100/005', 150, 0),
(77, '2025-04-07', '', '3600/001', 'Labour Charges and Taxi Charges For GFC-RP \r\n', '0', '217000', '-9762366', 'Dr-Apr\'25/096', '6100/001', 152, 0),
(78, '2025-04-08', '', '3600/001', 'Received Money From UAB MMK A/C\r\n', '20000000', '0', '10237634', 'Cr-Apr\'25/009', '3700/003', 153, 0),
(79, '2025-04-08', '', '3600/001', 'Paid to Agent Adv 2%, X Ray USA 7,8\r\n', '0', '5000000', '5237634', 'Dr-Apr\'25/103', '9100/020', 156, 0),
(80, '2025-04-08', '', '3600/001', 'Sir Phone Bill\r\n', '0', '3000', '5234634', 'Dr-Apr\'25/104', '9100/004', 158, 0),
(81, '2025-04-08', '', '3600/001', 'Paid to GFC Cold Store Charges\r\n', '0', '10000000', '-4765366', 'Dr-Apr\'25/105', '4000/G01', 160, 0),
(82, '2025-04-08', '', '3600/001', 'Car Diesel For 3K-1574 (15.674 Liters*3190ks)(19.380 Liters*2580ks)\r\n', '0', '100000', '-4865366', 'Dr-Apr\'25/106', '9100/006', 162, 0),
(83, '2025-04-08', '', '3600/001', 'Car Diesel For 5L-2848\r\n', '0', '100000', '-4965366', 'Dr-Apr\'25/107', '9100/006', 164, 0),
(84, '2025-04-08', '', '3600/001', 'Key 2 pcs*4000ks Purchase For Loading\r\n', '0', '8000', '-4973366', 'Dr-Apr\'25/108', '9100/005', 166, 0),
(85, '2025-04-08', '', '3600/001', 'Meal Allowance For U Aung Kyaw \r\n', '0', '3500', '-4976866', 'Dr-Apr\'25/109', '9100/012', 168, 0),
(86, '2025-04-08', '', '3600/001', 'Taxi Charges For Wai Pon La go 4000ks+Nyi Nyi W/H Comeback 20000ks\r\n', '0', '24000', '-5000866', 'Dr-Apr\'25/110', '9100/002', 170, 0),
(87, '2025-04-08', '', '3600/001', 'Water Purchase For W/H 15pcs*1100ks\r\n', '0', '16500', '-5017366', 'Dr-Apr\'25/111', '9100/003', 172, 0),
(88, '2025-04-08', '', '3600/001', 'Penam Bag 1000pcs*585ks and JCV 1pcs*108000ks Purchase For W/H\r\n', '0', '693000', '-5710366', 'Dr-Apr\'25/112', '6100/003', 174, 0),
(89, '2025-04-08', '', '3600/001', 'K-Pay Charges For Penam Bag Money Sent\r\n', '0', '1500', '-5711866', 'Dr-Apr\'25/113', '9100/009', 176, 0),
(90, '2025-04-08', '', '3600/001', 'Donation For Daily 5000ks+ Dogs Rice 2000ks\r\n', '0', '7000', '-5718866', 'Dr-Apr\'25/114', '9100/011', 178, 0),
(91, '2025-04-08', '', '3600/001', 'Guest List Charges For W/H\r\n', '0', '5000', '-5723866', 'Dr-Apr\'25/115', '9100/005', 180, 0),
(92, '2025-04-08', '', '3600/001', 'Sir Melia Yangon Dinner \r\n', '0', '388605', '-6112471', 'Dr-Apr\'25/116', '9100/017', 182, 0),
(93, '2025-04-09', '', '3600/001', 'Canada Money Received From May Yu ($25000)(3.4.25)($25000-$17)=$24983*4380ks\r\n', '109425540', '0', '103313069', 'Cr-Apr\'25/012', '3300/003', 183, 0),
(94, '2025-04-09', '', '3600/001', 'Thuzar Adv take For MSL Cold Store Charges\r\n', '0', '600000', '102713069', 'Dr-Apr\'25/123', '6100/007', 186, 0),
(95, '2025-04-09', '', '3600/001', 'Car Petro For 3K-1574 (9.4.25) 15.674 Liters*3190ks\r\n', '0', '50000', '102663069', 'Dr-Apr\'25/124', '9100/006', 188, 0),
(96, '2025-04-09', '', '3600/001', 'Car Police Catch For 3K-1574\r\n', '0', '12000', '102651069', 'Dr-Apr\'25/125', '9100/014', 190, 0),
(97, '2025-04-09', '', '3600/001', 'Taxi Charges For Office People 5 pcs For Payment 6:00pm\r\n', '0', '32500', '102618569', 'Dr-Apr\'25/126', '9100/002', 192, 0),
(98, '2025-04-09', '', '3600/001', 'Meal Allowance For Office 5 pcs Payment 6:00pm\r\n', '0', '12500', '102606069', 'Dr-Apr\'25/127', '9100/012', 194, 0),
(99, '2025-04-09', '', '3600/001', 'Paid to Kyaw Zay Ya For Vr no-12448,12466\r\n', '0', '50000000', '52606069', 'Dr-Apr\'25/128', '4000/k05', 196, 0),
(100, '2025-04-09', '', '3600/001', 'Paid to Ocean Pacific Cold Store Charges\r\n', '0', '10000000', '42606069', 'Dr-Apr\'25/129', '6100/007', 198, 0),
(101, '2025-04-09', '', '3600/001', 'Paid to Lawer For USA 10 (2024)(2.4-50000)(9.4-50000)\r\n', '0', '100000', '42506069', 'Dr-Apr\'25/130', '9100/027', 200, 0),
(102, '2025-04-10', '', '3600/001', 'LMG Loan Return From Link Mark For (23.3=4000000,9.4.=50000000)\r\n', '54000000', '0', '96506069', 'Cr-Apr\'25/013', '3400/006', 201, 0),
(103, '2025-04-10', '', '3600/001', 'Cash With Draw From UAB MMK A/C,Chq no-221676\r\n', '44000000', '0', '140506069', 'Cr-Apr\'25/014', '3700/003', 203, 0),
(104, '2025-04-10', '', '3600/001', 'Paid to MMMO For Vr Date-27.2,20.3,25.3(2)\r\n', '0', '6000000', '134506069', 'Dr-Apr\'25/138', '4000/m04', 206, 0),
(105, '2025-04-10', '', '3600/001', 'Taxi Charges For W/H to AYA to UAB to W/H\r\n', '0', '6000', '134500069', 'Dr-Apr\'25/139', '9100/002', 208, 0),
(106, '2025-04-10', '', '3600/001', 'Booking Cancellation charges For USA Container 2 pcs\r\n', '0', '80000', '134420069', 'Dr-Apr\'25/140', '9100/040', 210, 0),
(107, '2025-04-10', '', '3600/001', 'BL and Seal Charges For USA 5,6\r\n', '0', '112000', '134308069', 'Dr-Apr\'25/141', '9100/041', 212, 0),
(108, '2025-04-10', '', '3600/001', 'Paid to Nanda For Vr no-12922\r\n', '0', '3000000', '131308069', 'Dr-Apr\'25/142', '4000/n01', 214, 0),
(109, '2025-04-10', '', '3600/001', 'Paid to Thin Zar For Vr-13091\r\n', '0', '2000000', '129308069', 'Dr-Apr\'25/143', '4000/t23', 216, 0),
(110, '2025-04-10', '', '3600/001', 'Paid to Pan Thazin For Vr Date-28.3,4.4,5.4\r\n', '0', '5000000', '124308069', 'Dr-Apr\'25/144', '4000/p03', 218, 0),
(111, '2025-04-10', '', '3600/001', 'Paid to Golden Fish For Vr Date-6.4.25\r\n', '0', '756000', '123552069', 'Dr-Apr\'25/145', '4000/G03', 220, 0),
(112, '2025-04-10', '', '3600/001', 'Paid to Tin Hlaing For Vr no-12597,12599\r\n', '0', '15000000', '108552069', 'Dr-Apr\'25/146', '4000/t19', 222, 0),
(113, '2025-04-10', '', '3600/001', 'Paid to Aung Naing Oo For Vr no-12837,12856,12861\r\n', '0', '15000000', '93552069', 'Dr-Apr\'25/147', '4000/A03', 224, 0),
(114, '2025-04-10', '', '3600/001', 'Paid to Khin Maung Myint For Vr no-12924\r\n', '0', '20000000', '73552069', 'Dr-Apr\'25/148', '4000/k07', 226, 0),
(115, '2025-04-10', '', '3600/001', 'Paid to Nyan Tun For Vr no-13051,13054,13061,13063,13068\r\n', '0', '8897900', '64654169', 'Dr-Apr\'25/149', '4000/n04', 228, 0),
(116, '2025-04-10', '', '3600/001', 'Paid to Phone Naing For Vr no-12934,12986\r\n', '0', '5000000', '59654169', 'Dr-Apr\'25/150', '4000/p01', 230, 0),
(117, '2025-04-10', '', '3600/001', 'Paid to Promise For Vr Date-24.11,28.11,30.11\r\n', '0', '1510000', '58144169', 'Dr-Apr\'25/151', '4000/p04', 232, 0),
(118, '2025-04-13', '', '3600/001', 'Paid to Agent Bal Money for HT No1 Can-3, USA-5,6\r\n\r\n', '0', '4875250', '53268919', 'Dr-Apr\'25/152', '9100/020', 234, 0),
(119, '2025-04-13', '', '3600/001', 'Taxi charhges for W/H to UAB go for Chq A/C Money Putting\r\n', '0', '3000', '53265919', 'Dr-Apr\'25/153', '9100/002', 236, 0),
(120, '2025-04-13', '', '3600/001', 'Car petrol for 5L-2848 (32.154Liter*3110ks) 12.4\r\n', '0', '100000', '53165919', 'Dr-Apr\'25/154', '9100/006', 238, 0),
(121, '2025-04-13', '', '3600/001', 'Donation for Daily W/H (12.4)-5000 and (13.4)-5000\r\n', '0', '10000', '53155919', 'Dr-Apr\'25/155', '9100/011', 240, 0),
(122, '2025-04-13', '', '3600/001', 'Sir paid to GFC for April Bonus \r\n', '0', '300000', '52855919', 'Dr-Apr\'25/156', '9100/010', 242, 0),
(123, '2025-04-13', '', '3600/001', 'Sir paid to Police for April Bonus\r\n', '0', '200000', '52655919', 'Dr-Apr\'25/157', '9100/010', 244, 0),
(124, '2025-04-13', '', '3600/001', 'Sir Donation paid to All worker (12.4)\r\n', '0', '100000', '52555919', 'Dr-Apr\'25/158', '9100/011', 246, 0),
(125, '2025-04-22', '', '3600/001', 'Car Diesel for 3K-1574 (18.47) 16.892Liter*2960ks\r\n', '0', '50000', '52505919', 'Dr-Apr\'25/159', '9100/006', 248, 0),
(126, '2025-04-22', '', '3600/001', 'Engion Oil purchase for 3K-1574\r\n', '0', '15000', '52490919', 'Dr-Apr\'25/160', '9100/014', 250, 0),
(127, '2025-04-22', '', '3600/001', 'Battery Repair charges for 3K-1574\r\n', '0', '10000', '52480919', 'Dr-Apr\'25/161', '9100/014', 252, 0),
(128, '2025-04-22', '', '3600/001', 'Taxi charges for Battery repair go/back\r\n', '0', '6000', '52474919', 'Dr-Apr\'25/162', '9100/002', 254, 0),
(129, '2025-04-22', '', '3600/001', 'Cleaning Material purchase for EO\r\n', '0', '44000', '52430919', 'Dr-Apr\'25/163', '9100/045', 256, 0),
(130, '2025-04-22', '', '3600/001', 'Taxi charges for cleaning material purchase \r\n', '0', '4000', '52426919', 'Dr-Apr\'25/164', '9100/002', 258, 0),
(131, '2025-04-22', '', '3600/001', 'Taxi charges for Market\r\n', '0', '30000', '52396919', 'Dr-Apr\'25/165', '9100/002', 260, 0),
(132, '2025-04-22', '', '3600/001', 'Water purchase for EO+CC\r\n', '0', '11000', '52385919', 'Dr-Apr\'25/166', '9100/003', 262, 0),
(133, '2025-04-22', '', '3600/001', 'Donation for Dogs (15,16)\r\n', '0', '15000', '52370919', 'Dr-Apr\'25/167', '9100/011', 264, 0),
(134, '2025-04-22', '', '3600/001', 'Water purchase for EO (13.4.25)\r\n', '0', '5500', '52365419', 'Dr-Apr\'25/168', '9100/003', 266, 0),
(135, '2025-04-22', '', '3600/001', 'Ice charges for Market (19.4.25)\r\n', '0', '30000', '52335419', 'Dr-Apr\'25/169', '6100/002', 268, 0),
(136, '2025-04-22', '', '3600/001', 'Labour charges for Market (19.4.25)\r\n', '0', '2000', '52333419', 'Dr-Apr\'25/170', '6100/001', 270, 0),
(137, '2025-04-22', '', '3600/001', 'Ice charge for Hilsa Cutpiece\r\n', '0', '262500', '52070919', 'Dr-Apr\'25/171', '6100/002', 272, 0),
(138, '2025-04-22', '', '3600/001', 'Donation for Dogs purchase chicken for 2days(17,18)\r\n', '0', '15000', '52055919', 'Dr-Apr\'25/172', '9100/011', 274, 0),
(139, '2025-04-22', '', '3600/001', 'Water purchase for W/H 6pcs*1100ks\r\n', '0', '6600', '52049319', 'Dr-Apr\'25/173', '9100/003', 276, 0),
(140, '2025-04-22', '', '3600/001', 'Taxi charges for Market (19.4.25) \r\n', '0', '30000', '52019319', 'Dr-Apr\'25/174', '9100/002', 278, 0),
(141, '2025-04-22', '', '3600/001', 'Taxi charges for Market (20.4.25)\r\n', '0', '30000', '51989319', 'Dr-Apr\'25/175', '9100/002', 280, 0),
(142, '2025-04-22', '', '3600/001', 'Taxi charges for Battery Take ( Thandar 13 st, Wai Pon La)\r\n', '0', '8000', '51981319', 'Dr-Apr\'25/176', '9100/002', 282, 0),
(143, '2025-04-22', '', '3600/001', 'Car Diesel for 3K-1574 (21.4.25)16.892Liter*2960ks\r\n', '0', '50000', '51931319', 'Dr-Apr\'25/177', '9100/006', 284, 0),
(144, '2025-04-22', '', '3600/001', 'Donation for Dogs (19,20)\r\n', '0', '14900', '51916419', 'Dr-Apr\'25/178', '9100/011', 286, 0),
(145, '2025-04-22', '', '3600/001', 'Taxi charges for Kaymarti to W/H (Ice money take)20.4.25\r\n', '0', '6000', '51910419', 'Dr-Apr\'25/179', '9100/002', 288, 0),
(146, '2025-04-22', '', '3600/001', 'Purchase Soap for CC Cleaning\r\n', '0', '6000', '51904419', 'Dr-Apr\'25/180', '9100/045', 290, 0),
(147, '2025-04-22', '', '3600/001', 'All  people April \'25 Bonus\r\n', '0', '23485240', '28419179', 'Dr-Apr\'25/181', '9100/010', 292, 0),
(148, '2025-04-22', '', '3600/001', 'Taxi charges for Market (16.4.25)\r\n\r\n', '0', '34000', '28385179', 'Dr-Apr\'25/182', '9100/002', 294, 0),
(149, '2025-04-22', '', '3600/001', 'Meal Allowance for Market (16.4.25) Am 2pcs+Lunch 2pcs\r\n', '0', '7000', '28378179', 'Dr-Apr\'25/183', '9100/012', 296, 0),
(150, '2025-04-23', '', '3600/001', 'Cash Withdraw  from LM UAB (MMK),Chq-221677\r\n', '20000000', '0', '48378179', 'Dr-Apr\'25/185', '3700/003', 297, 0),
(151, '2025-04-23', '', '3600/001', 'Taxi Charges for W/H to Sir House \r\n', '0', '5000', '48373179', 'Dr-Apr\'25/186', '9100/002', 300, 0),
(152, '2025-04-23', '', '3600/001', 'BL & Seal charges for USA -07,08/2025 Ref=6414516650, 6414516370, 2*56000MMK (Pr-016)\r\n', '0', '112000', '48261179', 'Dr-Apr\'25/187', '9100/041', 302, 0),
(153, '2025-04-23', '', '3600/001', 'Taxi charges for House Air Way Bill\r\n', '0', '37000', '48224179', 'Dr-Apr\'25/188', '9100/002', 304, 0),
(154, '2025-04-23', '', '3600/001', 'House Air Way Renew KBZ charges and Bank charges (700000+2600)\r\n', '0', '702600', '47521579', 'Dr-Apr\'25/189', '9100/026', 306, 0),
(155, '2025-04-23', '', '3600/001', 'House Air Way Renew copy+file charges\r\n', '0', '20000', '47501579', 'Dr-Apr\'25/190', '9100/016', 308, 0),
(156, '2025-04-23', '', '3600/001', 'Meal  Allowance for Office 2pcs\r\n', '0', '2700', '47498879', 'Dr-Apr\'25/191', '9100/012', 310, 0),
(157, '2025-04-23', '', '3600/001', 'Taxi charges for W/H to UAB Money Take\r\n', '0', '5000', '47493879', 'Dr-Apr\'25/192', '9100/002', 312, 0),
(158, '2025-04-23', '', '3600/001', 'Car Diesel  for 3K-1574 (Pr-017)\r\n', '0', '50000', '47443879', 'Dr-Apr\'25/193', '9100/006', 314, 0),
(159, '2025-04-23', '', '3600/001', 'Water purchase 15pcs*1100ks for (Eo+CC) Pr-017\r\n', '0', '16500', '47427379', 'Dr-Apr\'25/194', '9100/003', 316, 0),
(160, '2025-04-23', '', '3600/001', 'Purchase chicken and Fruit for Sir House (21500+2000) Pr-017\r\n', '0', '23500', '47403879', 'Dr-Apr\'25/195', '9100/012', 318, 0),
(161, '2025-04-23', '', '3600/001', 'Donation for Dogs Chicken purchase (Pr-017)\r\n', '0', '18000', '47385879', 'Dr-Apr\'25/196', '9100/011', 320, 0),
(162, '2025-04-23', '', '3600/001', 'Purchase Mosquito Spary for Sir House (Pr-017)\r\n', '0', '10500', '47375379', 'Dr-Apr\'25/197', '9100/005', 322, 0),
(163, '2025-04-23', '', '3600/001', 'Taxi charges for HHK to CC (Pr-017)\r\n', '0', '16500', '47358879', 'Dr-Apr\'25/198', '9100/002', 324, 0),
(164, '2025-04-24', '', '3600/001', 'Taxi Charges For In Bound Renew\r\n', '0', '33000', '47325879', 'Dr-Apr\'25/200', '9100/002', 326, 0),
(165, '2025-04-24', '', '3600/001', 'Undertaken Charges For InBound Received Paper People For 2 pcs (Inbound Tour License Renew)\r\n', '0', '42000', '47283879', 'Dr-Apr\'25/201', '9100/029', 328, 0),
(166, '2025-04-24', '', '3600/001', 'Hilsa Micro Test For Chill (Aircargo)\r\n', '0', '225000', '47058879', 'Dr-Apr\'25/202', '9100/040', 330, 0),
(167, '2025-04-24', '', '3600/001', 'Car Diesel For 3K-1574 (24.4.25)(Pr-018)16.892 Liters*2960ks\r\n', '0', '50000', '47008879', 'Dr-Apr\'25/203', '9100/006', 332, 0),
(168, '2025-04-24', '', '3600/001', 'Material Purchase For Cleaning For EO (Pr-018) (သံဂေါ်ပြား ၁ခု+သစ်သားရိုး ၁ခု)\r\n', '0', '40000', '46968879', 'Dr-Apr\'25/204', '9100/045', 334, 0),
(169, '2025-04-24', '', '3600/001', 'Northokkalapa Industry Zone Fees For W/H(Jan\'25 to March\'25) (Pr-018)\r\n', '0', '30000', '46938879', 'Dr-Apr\'25/205', '9100/005', 336, 0),
(170, '2025-04-24', '', '3600/001', 'Meter Bill For Sir March\'25 (Pr-018)\r\n', '0', '65000', '46873879', 'Dr-Apr\'25/206', '9100/018', 338, 0),
(171, '2025-04-24', '', '3600/001', 'Meter Bill For EO March\'25 (Pr-018)\r\n', '0', '48500', '46825379', 'Dr-Apr\'25/207', '9100/018', 340, 0),
(172, '2025-04-24', '', '3600/001', 'Meter Bill For W/H March\'25 (Pr-018)\r\n', '0', '316500', '46508879', 'Dr-Apr\'25/208', '9100/018', 342, 0),
(173, '2025-04-24', '', '3600/001', 'Northokkalapa Industry Zones Fees For EO (Jan\'25 to March\'25) (Pr-018)\r\n', '0', '30000', '46478879', 'Dr-Apr\'25/209', '9100/005', 344, 0),
(174, '2025-04-24', '', '3600/001', 'Taxi Charges For Meter Bill + Zone Fees (Pr-018)\r\n', '0', '6000', '46472879', 'Dr-Apr\'25/210', '9100/002', 346, 0),
(175, '2025-04-24', '', '3600/001', 'Police Catch For 5L-2848 (Pr-018) မီးပွိုင့် ကျော် ရဲဖမ်း \r\n', '0', '40000', '46432879', 'Dr-Apr\'25/211', '9100/014', 348, 0),
(176, '2025-04-24', '', '3600/001', 'Car Washing Charges For 5L-2848 (Pr-018) ကားရေဆေး+အမွှေးဆီ\r\n', '0', '30000', '46402879', 'Dr-Apr\'25/212', '9100/014', 350, 0),
(177, '2025-04-24', '', '3600/001', 'Car Parking Charges For Airport (Pr-018)\r\n', '0', '10000', '46392879', 'Dr-Apr\'25/213', '9100/025', 352, 0),
(178, '2025-04-24', '', '3600/001', 'Air Put Charges For 5L-2848 (Pr-018)\r\n', '0', '3000', '46389879', 'Dr-Apr\'25/214', '9100/014', 354, 0),
(179, '2025-04-24', '', '3600/001', 'Car Diesel Charges For 5L-2848 (Pr-018) 23.4.2025 , 28.571 Liters*2800ks\r\n', '0', '80000', '46309879', 'Dr-Apr\'25/215', '9100/006', 356, 0),
(180, '2025-04-24', '', '3600/001', 'Car Diesel For 5L-2848 (Pr-018) 22.4.2025 , 16.071 Liters*2800ks\r\n', '0', '45000', '46264879', 'Dr-Apr\'25/216', '9100/006', 358, 0),
(181, '2025-04-24', '', '3600/001', 'Car Police Catch For 3K-1574 (Pr-018) လေဆိပ်အကျော်ရဲဖမ်း \r\n', '0', '15000', '46249879', 'Dr-Apr\'25/217', '9100/014', 360, 0),
(182, '2025-04-24', '', '3600/001', 'Car Parking Charges For 3K-1574 (Pr-018)\r\n', '0', '2000', '46247879', 'Dr-Apr\'25/218', '9100/025', 362, 0),
(183, '2025-04-24', '', '3600/001', 'Plastic Rope 3 pcs Purchase For W/H (Pr-018)\r\n', '0', '38000', '46209879', 'Dr-Apr\'25/219', '6100/003', 364, 0),
(184, '2025-04-24', '', '3600/001', 'Salt,Knife and Big Knife Purchase For WP (Pr-018)\r\n', '0', '58600', '46151279', 'Dr-Apr\'25/220', '6100/003', 366, 0),
(185, '2025-04-24', '', '3600/001', 'Taxi Charges For Knife Purchase (Pr-018)\r\n', '0', '8000', '46143279', 'Dr-Apr\'25/221', '9100/002', 368, 0),
(186, '2025-04-24', '', '3600/001', 'Guest List Charges For W/H (Pr-018)\r\n', '0', '2000', '46141279', 'Dr-Apr\'25/222', '9100/005', 370, 0),
(187, '2025-04-24', '', '3600/001', 'Meal Allowance For U Aung Kyaw (Pr-018)\r\n', '0', '3000', '46138279', 'Dr-Apr\'25/223', '9100/012', 372, 0),
(188, '2025-04-24', '', '3600/001', 'Link Mark Global Take From Link Mark Office for Loan\r\n', '0', '10000000', '36138279', 'Dr-Apr\'25/224', '3400/006', 374, 0),
(189, '2025-04-07', '', '3600/003', 'USA Money Selling from USD A/C $49945*75% $37448.75 * 4418ks (37448.75*3599ks)LM and 37448.75*819ks Nan\r\n', '0', '134778051.25', '-134778051.25', 'Cr-Apr\'25/006', '3700/003', 432, 0),
(190, '2025-04-07', '', '3600/003', 'USA Money Selling from USD A/C $49945*75% $37448.75 * 4418ks (37448.75*3599ks)LM and 37448.75*819ks Nan\r\n', '0', '30670526.25', '-30670526.25', 'Cr-Apr25/006', '3700/006', 492, 0),
(191, '2025-04-22', '', '3600/002', 'LM Loan from ACE Office for Sir (BKK go) 13.4.25 to 23.4.25\r\n', '11000', '0', '11000', 'Cr-Apr\'25/015', '4000/A24', 501, 0),
(192, '2025-04-22', '', '3600/002', 'Sir Take for BKK go\r\n', '0', '11000', '0', 'Dr-Apr\'25/184', '9100/017', 504, 0),
(193, '2025-04-08', '', '3600/002', '5000 Loan Received From ACE BD By Chairman\r\n', '5010', '0', '5010', 'Cr-Apr\'25/008', '4000/A24', 497, 0),
(194, '2025-04-08', '', '3600/002', 'Paid Undertaken Charges ACE BD Money\r\n', '0', '5010', '0', 'Dr-Apr\'25/117', '9100/029', 500, 0),
(195, '2025-04-08', '', '3600/002', '5000 Loan Received From ACE BD By Chairman\r\n', '5010', '0', '5010', 'Cr-Apr\'25/008', '4000/a24', 505, 0),
(196, '2025-04-08', '', '3600/002', 'Paid Undertaken Charges ACE BD Money\r\n\r\n', '0', '5010', '0', 'Dr-Apr\'25/117', '9100/029', 508, 0),
(197, '2025-04-07', '', '3600/003', ' USA Money Selling from USD A/C 25% 2106ks/ 75% 4418ks (3599ks LM A/C and 819ks Nan A/C) \r\n', '165448577.5', '0', '165448577.5', 'Dr-Apr\'25/098', '3700/002', 515, 0);

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
(1, 1, 'balance', '', '981167.97', '', 999),
(2, 1, 'balance', '', '165167.66', 'Opening Balance', 0),
(3, 1, 'balance', '', '375566.05', 'Opening Balance', 0),
(4, 1, 'balance', '', '510407.23', 'Opening Balance', 0),
(5, 1, 'balance', '', '36524.94', 'Opening Balance', 0),
(6, 1, 'balance', '', '16903.53', 'Opening Balance', 0),
(7, 1, 'balance', '', '109681.7', 'Opening Balance', 0),
(9, 0, 'debit', '200000', '0', 'Cr-Apr\'25/001', 1),
(10, 0, 'credit', '200000', '0', 'Cr-Apr\'25/001', 2),
(11, 0, 'debit', '44000', '0', 'Dr-Apr\'25/001', 3),
(12, 0, 'credit', '44000', '0', 'Dr-Apr\'25/001', 4),
(13, 0, 'debit', '60375', '0', 'Dr-Apr\'25/002', 5),
(14, 0, 'credit', '60375', '0', 'Dr-Apr\'25/002', 6),
(15, 0, 'debit', '84125', '0', 'Dr-Apr\'25/003', 7),
(16, 0, 'credit', '84125', '0', 'Dr-Apr\'25/003', 8),
(17, 0, 'debit', '76000', '0', 'Dr-Apr\'25/004', 9),
(18, 0, 'credit', '76000', '0', 'Dr-Apr\'25/004', 10),
(19, 0, 'debit', '6000', '0', 'Dr-Apr\'25/005', 11),
(20, 0, 'credit', '6000', '0', 'Dr-Apr\'25/005', 12),
(21, 0, 'debit', '45300', '0', 'Dr-Apr\'25/006', 13),
(22, 0, 'credit', '45300', '0', 'Dr-Apr\'25/006', 14),
(23, 0, 'debit', '119000', '0', 'Dr-Apr\'25/007', 15),
(24, 0, 'credit', '119000', '0', 'Dr-Apr\'25/007', 16),
(25, 0, 'debit', '201300', '0', 'Dr-Apr\'25/008', 17),
(26, 0, 'credit', '201300', '0', 'Dr-Apr\'25/008', 18),
(27, 0, 'debit', '42000', '0', 'Dr-Apr\'25/009', 19),
(28, 0, 'credit', '42000', '0', 'Dr-Apr\'25/009', 20),
(29, 0, 'debit', '13300', '0', 'Dr-Apr\'25/010', 21),
(30, 0, 'credit', '13300', '0', 'Dr-Apr\'25/010', 22),
(31, 0, 'debit', '5000', '0', 'Cr-Apr\'25/002', 23),
(32, 0, 'credit', '5000', '0', 'Cr-Apr\'25/002', 24),
(33, 0, 'debit', '35000', '0', 'Cr-Apr\'25/003', 25),
(34, 0, 'credit', '35000', '0', 'Cr-Apr\'25/003', 26),
(35, 0, 'debit', '22455240', '0', 'Cr-Apr\'25/004', 27),
(36, 0, 'credit', '22455240', '0', 'Cr-Apr\'25/004', 28),
(37, 0, 'debit', '4500', '0', 'Dr-Apr\'25/036', 29),
(38, 0, 'credit', '4500', '0', 'Dr-Apr\'25/036', 30),
(39, 0, 'debit', '2000', '0', 'Dr-Apr\'25/037', 31),
(40, 0, 'credit', '2000', '0', 'Dr-Apr\'25/037', 32),
(41, 0, 'debit', '3000', '0', 'Dr-Apr\'25/038', 33),
(42, 0, 'credit', '3000', '0', 'Dr-Apr\'25/038', 34),
(43, 0, 'debit', '215880', '0', 'Dr-Apr\'25/039', 35),
(44, 0, 'credit', '215880', '0', 'Dr-Apr\'25/039', 36),
(45, 0, 'debit', '3110000', '0', 'Dr-Apr\'25/040', 37),
(46, 0, 'credit', '3110000', '0', 'Dr-Apr\'25/040', 38),
(47, 0, 'debit', '5000', '0', 'Dr-Apr\'25/041', 39),
(48, 0, 'credit', '5000', '0', 'Dr-Apr\'25/041', 40),
(49, 0, 'debit', '9000', '0', 'Dr-Apr\'25/042', 41),
(50, 0, 'credit', '9000', '0', 'Dr-Apr\'25/042', 42),
(51, 0, 'debit', '5000', '0', 'Dr-Apr\'25/043', 43),
(52, 0, 'credit', '5000', '0', 'Dr-Apr\'25/043', 44),
(53, 0, 'debit', '22455240', '0', 'Dr-Apr\'25/044', 45),
(54, 0, 'credit', '22455240', '0', 'Dr-Apr\'25/044', 46),
(55, 0, 'debit', '800000', '0', 'Dr-Apr\'25/045', 47),
(56, 0, 'credit', '800000', '0', 'Dr-Apr\'25/045', 48),
(57, 4380, 'debit', '109390500', '24975', 'Cr-Apr\'25/005', 49),
(58, 4380, 'credit', '109390500', '24975', 'Cr-Apr\'25/005', 50),
(59, 0, 'debit', '4000', '0', 'Dr-Apr\'25/046', 51),
(60, 0, 'credit', '4000', '0', 'Dr-Apr\'25/046', 52),
(61, 0, 'debit', '20000000', '0', 'Dr-Apr\'25/047', 53),
(62, 0, 'credit', '20000000', '0', 'Dr-Apr\'25/047', 54),
(63, 0, 'debit', '20000000', '0', 'Dr-Apr\'25/048', 55),
(64, 0, 'credit', '20000000', '0', 'Dr-Apr\'25/048', 56),
(65, 0, 'debit', '30000000', '0', 'Dr-Apr\'25/049', 57),
(66, 0, 'credit', '30000000', '0', 'Dr-Apr\'25/049', 58),
(67, 0, 'debit', '30000000', '0', 'Dr-Apr\'25/050', 59),
(68, 0, 'credit', '30000000', '0', 'Dr-Apr\'25/050', 60),
(69, 0, 'debit', '2694600', '0', 'Dr-Apr\'25/051', 61),
(70, 0, 'credit', '2694600', '0', 'Dr-Apr\'25/051', 62),
(71, 0, 'debit', '277600', '0', 'Dr-Apr\'25/052', 63),
(72, 0, 'credit', '277600', '0', 'Dr-Apr\'25/052', 64),
(73, 0, 'debit', '430000', '0', 'Dr-Apr\'25/053', 65),
(74, 0, 'credit', '430000', '0', 'Dr-Apr\'25/053', 66),
(75, 0, 'debit', '27000', '0', 'Dr-Apr\'25/054', 67),
(76, 0, 'credit', '27000', '0', 'Dr-Apr\'25/054', 68),
(77, 0, 'debit', '10000', '0', 'Dr-Apr\'25/055', 69),
(78, 0, 'credit', '10000', '0', 'Dr-Apr\'25/055', 70),
(79, 0, 'debit', '11000', '0', 'Dr-Apr\'25/056', 71),
(80, 0, 'credit', '11000', '0', 'Dr-Apr\'25/056', 72),
(81, 0, 'debit', '5000', '0', 'Dr-Apr\'25/057', 73),
(82, 0, 'credit', '5000', '0', 'Dr-Apr\'25/057', 74),
(83, 0, 'debit', '500', '0', 'Dr-Apr\'25/058', 75),
(84, 0, 'credit', '500', '0', 'Dr-Apr\'25/058', 76),
(85, 0, 'debit', '112000', '0', 'Dr-Apr\'25/059', 77),
(86, 0, 'credit', '112000', '0', 'Dr-Apr\'25/059', 78),
(87, 0, 'debit', '188800', '0', 'Dr-Apr\'25/060', 79),
(88, 0, 'credit', '188800', '0', 'Dr-Apr\'25/060', 80),
(89, 0, 'debit', '42000', '0', 'Dr-Apr\'25/061', 81),
(90, 0, 'credit', '42000', '0', 'Dr-Apr\'25/061', 82),
(91, 0, 'debit', '7000', '0', 'Dr-Apr\'25/062', 83),
(92, 0, 'credit', '7000', '0', 'Dr-Apr\'25/062', 84),
(93, 0, 'debit', '3500', '0', 'Dr-Apr\'25/063', 85),
(94, 0, 'credit', '3500', '0', 'Dr-Apr\'25/063', 86),
(95, 0, 'debit', '11000', '0', 'Dr-Apr\'25/064', 87),
(96, 0, 'credit', '11000', '0', 'Dr-Apr\'25/064', 88),
(97, 0, 'debit', '50000', '0', 'Dr-Apr\'25/065', 89),
(98, 0, 'credit', '50000', '0', 'Dr-Apr\'25/065', 90),
(99, 0, 'debit', '2380500', '0', 'Dr-Apr\'25/066', 91),
(100, 0, 'credit', '2380500', '0', 'Dr-Apr\'25/066', 92),
(101, 0, 'debit', '16000', '0', 'Dr-Apr\'25/067', 93),
(102, 0, 'credit', '16000', '0', 'Dr-Apr\'25/067', 94),
(103, 0, 'debit', '50000', '0', 'Dr-Apr\'25/068', 95),
(104, 0, 'credit', '50000', '0', 'Dr-Apr\'25/068', 96),
(105, 0, 'debit', '100000', '0', 'Dr-Apr\'25/069', 97),
(106, 0, 'credit', '100000', '0', 'Dr-Apr\'25/069', 98),
(107, 0, 'debit', '500000', '0', 'Dr-Apr\'25/070', 99),
(108, 0, 'credit', '500000', '0', 'Dr-Apr\'25/070', 100),
(109, 0, 'debit', '10000000', '0', 'Dr-Apr\'25/071', 101),
(110, 0, 'credit', '10000000', '0', 'Dr-Apr\'25/071', 102),
(111, 0, 'debit', '196000', '0', 'Dr-Apr\'25/072', 103),
(112, 0, 'credit', '196000', '0', 'Dr-Apr\'25/072', 104),
(113, 0, 'debit', '242200', '0', 'Dr-Apr\'25/073', 105),
(114, 0, 'credit', '242200', '0', 'Dr-Apr\'25/073', 106),
(115, 0, 'debit', '50000', '0', 'Dr-Apr\'25/074', 107),
(116, 0, 'credit', '50000', '0', 'Dr-Apr\'25/074', 108),
(117, 0, 'debit', '20000', '0', 'Dr-Apr\'25/075', 109),
(118, 0, 'credit', '20000', '0', 'Dr-Apr\'25/075', 110),
(119, 0, 'debit', '5000', '0', 'Dr-Apr\'25/076', 111),
(120, 0, 'credit', '5000', '0', 'Dr-Apr\'25/076', 112),
(121, 0, 'debit', '218000', '0', 'Dr-Apr\'25/077', 113),
(122, 0, 'credit', '218000', '0', 'Dr-Apr\'25/077', 114),
(123, 0, 'debit', '40000', '0', 'Dr-Apr\'25/078', 115),
(124, 0, 'credit', '40000', '0', 'Dr-Apr\'25/078', 116),
(125, 0, 'debit', '50000', '0', 'Dr-Apr\'25/079', 117),
(126, 0, 'credit', '50000', '0', 'Dr-Apr\'25/079', 118),
(127, 0, 'debit', '60000', '0', 'Dr-Apr\'25/080', 119),
(128, 0, 'credit', '60000', '0', 'Dr-Apr\'25/080', 120),
(129, 0, 'debit', '19500', '0', 'Dr-Apr\'25/081', 121),
(130, 0, 'credit', '19500', '0', 'Dr-Apr\'25/081', 122),
(131, 0, 'debit', '8700000', '0', 'Dr-Apr\'25/082', 123),
(132, 0, 'credit', '8700000', '0', 'Dr-Apr\'25/082', 124),
(133, 0, 'debit', '300000', '0', 'Dr-Apr\'25/083', 125),
(134, 0, 'credit', '300000', '0', 'Dr-Apr\'25/083', 126),
(135, 0, 'debit', '3000', '0', 'Dr-Apr\'25/084', 127),
(136, 0, 'credit', '3000', '0', 'Dr-Apr\'25/084', 128),
(137, 0, 'debit', '20000', '0', 'Dr-Apr\'25/085', 129),
(138, 0, 'credit', '20000', '0', 'Dr-Apr\'25/085', 130),
(139, 0, 'debit', '13000', '0', 'Dr-Apr\'25/086', 131),
(140, 0, 'credit', '13000', '0', 'Dr-Apr\'25/086', 132),
(141, 0, 'debit', '25000', '0', 'Dr-Apr\'25/087', 133),
(142, 0, 'credit', '25000', '0', 'Dr-Apr\'25/087', 134),
(143, 0, 'debit', '3000', '0', 'Dr-Apr\'25/088', 135),
(144, 0, 'credit', '3000', '0', 'Dr-Apr\'25/088', 136),
(145, 0, 'debit', '10000', '0', 'Dr-Apr\'25/089', 137),
(146, 0, 'credit', '10000', '0', 'Dr-Apr\'25/089', 138),
(147, 0, 'debit', '6000', '0', 'Dr-Apr\'25/090', 139),
(148, 0, 'credit', '6000', '0', 'Dr-Apr\'25/090', 140),
(149, 0, 'debit', '3439200', '0', 'Dr-Apr\'25/091', 141),
(150, 0, 'credit', '3439200', '0', 'Dr-Apr\'25/091', 142),
(151, 0, 'debit', '48000', '0', 'Dr-Apr\'25/092', 143),
(152, 0, 'credit', '48000', '0', 'Dr-Apr\'25/092', 144),
(153, 0, 'debit', '7000', '0', 'Dr-Apr\'25/093', 145),
(154, 0, 'credit', '7000', '0', 'Dr-Apr\'25/093', 146),
(155, 0, 'debit', '623500', '0', 'Dr-Apr\'25/094', 147),
(156, 0, 'credit', '623500', '0', 'Dr-Apr\'25/094', 148),
(157, 0, 'debit', '15000', '0', 'Dr-Apr\'25/095', 149),
(158, 0, 'credit', '15000', '0', 'Dr-Apr\'25/095', 150),
(159, 0, 'debit', '217000', '0', 'Dr-Apr\'25/096', 151),
(160, 0, 'credit', '217000', '0', 'Dr-Apr\'25/096', 152),
(161, 0, 'debit', '20000000', '0', 'Cr-Apr\'25/009', 153),
(162, 0, 'credit', '20000000', '0', 'Cr-Apr\'25/009', 154),
(163, 0, 'debit', '5000000', '0', 'Dr-Apr\'25/103', 155),
(164, 0, 'credit', '5000000', '0', 'Dr-Apr\'25/103', 156),
(165, 0, 'debit', '3000', '0', 'Dr-Apr\'25/104', 157),
(166, 0, 'credit', '3000', '0', 'Dr-Apr\'25/104', 158),
(167, 0, 'debit', '10000000', '0', 'Dr-Apr\'25/105', 159),
(168, 0, 'credit', '10000000', '0', 'Dr-Apr\'25/105', 160),
(169, 0, 'debit', '100000', '0', 'Dr-Apr\'25/106', 161),
(170, 0, 'credit', '100000', '0', 'Dr-Apr\'25/106', 162),
(171, 0, 'debit', '100000', '0', 'Dr-Apr\'25/107', 163),
(172, 0, 'credit', '100000', '0', 'Dr-Apr\'25/107', 164),
(173, 0, 'debit', '8000', '0', 'Dr-Apr\'25/108', 165),
(174, 0, 'credit', '8000', '0', 'Dr-Apr\'25/108', 166),
(175, 0, 'debit', '3500', '0', 'Dr-Apr\'25/109', 167),
(176, 0, 'credit', '3500', '0', 'Dr-Apr\'25/109', 168),
(177, 0, 'debit', '24000', '0', 'Dr-Apr\'25/110', 169),
(178, 0, 'credit', '24000', '0', 'Dr-Apr\'25/110', 170),
(179, 0, 'debit', '16500', '0', 'Dr-Apr\'25/111', 171),
(180, 0, 'credit', '16500', '0', 'Dr-Apr\'25/111', 172),
(181, 0, 'debit', '693000', '0', 'Dr-Apr\'25/112', 173),
(182, 0, 'credit', '693000', '0', 'Dr-Apr\'25/112', 174),
(183, 0, 'debit', '1500', '0', 'Dr-Apr\'25/113', 175),
(184, 0, 'credit', '1500', '0', 'Dr-Apr\'25/113', 176),
(185, 0, 'debit', '7000', '0', 'Dr-Apr\'25/114', 177),
(186, 0, 'credit', '7000', '0', 'Dr-Apr\'25/114', 178),
(187, 0, 'debit', '5000', '0', 'Dr-Apr\'25/115', 179),
(188, 0, 'credit', '5000', '0', 'Dr-Apr\'25/115', 180),
(189, 0, 'debit', '388605', '0', 'Dr-Apr\'25/116', 181),
(190, 0, 'credit', '388605', '0', 'Dr-Apr\'25/116', 182),
(191, 4380, 'debit', '109425540', '24983', 'Cr-Apr\'25/012', 183),
(192, 4380, 'credit', '109425540', '24983', 'Cr-Apr\'25/012', 184),
(193, 0, 'debit', '600000', '0', 'Dr-Apr\'25/123', 185),
(194, 0, 'credit', '600000', '0', 'Dr-Apr\'25/123', 186),
(195, 0, 'debit', '50000', '0', 'Dr-Apr\'25/124', 187),
(196, 0, 'credit', '50000', '0', 'Dr-Apr\'25/124', 188),
(197, 0, 'debit', '12000', '0', 'Dr-Apr\'25/125', 189),
(198, 0, 'credit', '12000', '0', 'Dr-Apr\'25/125', 190),
(199, 0, 'debit', '32500', '0', 'Dr-Apr\'25/126', 191),
(200, 0, 'credit', '32500', '0', 'Dr-Apr\'25/126', 192),
(201, 0, 'debit', '12500', '0', 'Dr-Apr\'25/127', 193),
(202, 0, 'credit', '12500', '0', 'Dr-Apr\'25/127', 194),
(203, 0, 'debit', '50000000', '0', 'Dr-Apr\'25/128', 195),
(204, 0, 'credit', '50000000', '0', 'Dr-Apr\'25/128', 196),
(205, 0, 'debit', '10000000', '0', 'Dr-Apr\'25/129', 197),
(206, 0, 'credit', '10000000', '0', 'Dr-Apr\'25/129', 198),
(207, 0, 'debit', '100000', '0', 'Dr-Apr\'25/130', 199),
(208, 0, 'credit', '100000', '0', 'Dr-Apr\'25/130', 200),
(209, 0, 'debit', '54000000', '0', 'Cr-Apr\'25/013', 201),
(210, 0, 'credit', '54000000', '0', 'Cr-Apr\'25/013', 202),
(211, 0, 'debit', '44000000', '0', 'Cr-Apr\'25/014', 203),
(212, 0, 'credit', '44000000', '0', 'Cr-Apr\'25/014', 204),
(213, 0, 'debit', '6000000', '0', 'Dr-Apr\'25/138', 205),
(214, 0, 'credit', '6000000', '0', 'Dr-Apr\'25/138', 206),
(215, 0, 'debit', '6000', '0', 'Dr-Apr\'25/139', 207),
(216, 0, 'credit', '6000', '0', 'Dr-Apr\'25/139', 208),
(217, 0, 'debit', '80000', '0', 'Dr-Apr\'25/140', 209),
(218, 0, 'credit', '80000', '0', 'Dr-Apr\'25/140', 210),
(219, 0, 'debit', '112000', '0', 'Dr-Apr\'25/141', 211),
(220, 0, 'credit', '112000', '0', 'Dr-Apr\'25/141', 212),
(221, 0, 'debit', '3000000', '0', 'Dr-Apr\'25/142', 213),
(222, 0, 'credit', '3000000', '0', 'Dr-Apr\'25/142', 214),
(223, 0, 'debit', '2000000', '0', 'Dr-Apr\'25/143', 215),
(224, 0, 'credit', '2000000', '0', 'Dr-Apr\'25/143', 216),
(225, 0, 'debit', '5000000', '0', 'Dr-Apr\'25/144', 217),
(226, 0, 'credit', '5000000', '0', 'Dr-Apr\'25/144', 218),
(227, 0, 'debit', '756000', '0', 'Dr-Apr\'25/145', 219),
(228, 0, 'credit', '756000', '0', 'Dr-Apr\'25/145', 220),
(229, 0, 'debit', '15000000', '0', 'Dr-Apr\'25/146', 221),
(230, 0, 'credit', '15000000', '0', 'Dr-Apr\'25/146', 222),
(231, 0, 'debit', '15000000', '0', 'Dr-Apr\'25/147', 223),
(232, 0, 'credit', '15000000', '0', 'Dr-Apr\'25/147', 224),
(233, 0, 'debit', '20000000', '0', 'Dr-Apr\'25/148', 225),
(234, 0, 'credit', '20000000', '0', 'Dr-Apr\'25/148', 226),
(235, 0, 'debit', '8897900', '0', 'Dr-Apr\'25/149', 227),
(236, 0, 'credit', '8897900', '0', 'Dr-Apr\'25/149', 228),
(237, 0, 'debit', '5000000', '0', 'Dr-Apr\'25/150', 229),
(238, 0, 'credit', '5000000', '0', 'Dr-Apr\'25/150', 230),
(239, 0, 'debit', '1510000', '0', 'Dr-Apr\'25/151', 231),
(240, 0, 'credit', '1510000', '0', 'Dr-Apr\'25/151', 232),
(241, 0, 'debit', '4875250', '0', 'Dr-Apr\'25/152', 233),
(242, 0, 'credit', '4875250', '0', 'Dr-Apr\'25/152', 234),
(243, 0, 'debit', '3000', '0', 'Dr-Apr\'25/153', 235),
(244, 0, 'credit', '3000', '0', 'Dr-Apr\'25/153', 236),
(245, 0, 'debit', '100000', '0', 'Dr-Apr\'25/154', 237),
(246, 0, 'credit', '100000', '0', 'Dr-Apr\'25/154', 238),
(247, 0, 'debit', '10000', '0', 'Dr-Apr\'25/155', 239),
(248, 0, 'credit', '10000', '0', 'Dr-Apr\'25/155', 240),
(249, 0, 'debit', '300000', '0', 'Dr-Apr\'25/156', 241),
(250, 0, 'credit', '300000', '0', 'Dr-Apr\'25/156', 242),
(251, 0, 'debit', '200000', '0', 'Dr-Apr\'25/157', 243),
(252, 0, 'credit', '200000', '0', 'Dr-Apr\'25/157', 244),
(253, 0, 'debit', '100000', '0', 'Dr-Apr\'25/158', 245),
(254, 0, 'credit', '100000', '0', 'Dr-Apr\'25/158', 246),
(255, 0, 'debit', '50000', '0', 'Dr-Apr\'25/159', 247),
(256, 0, 'credit', '50000', '0', 'Dr-Apr\'25/159', 248),
(257, 0, 'debit', '15000', '0', 'Dr-Apr\'25/160', 249),
(258, 0, 'credit', '15000', '0', 'Dr-Apr\'25/160', 250),
(259, 0, 'debit', '10000', '0', 'Dr-Apr\'25/161', 251),
(260, 0, 'credit', '10000', '0', 'Dr-Apr\'25/161', 252),
(261, 0, 'debit', '6000', '0', 'Dr-Apr\'25/162', 253),
(262, 0, 'credit', '6000', '0', 'Dr-Apr\'25/162', 254),
(263, 0, 'debit', '44000', '0', 'Dr-Apr\'25/163', 255),
(264, 0, 'credit', '44000', '0', 'Dr-Apr\'25/163', 256),
(265, 0, 'debit', '4000', '0', 'Dr-Apr\'25/164', 257),
(266, 0, 'credit', '4000', '0', 'Dr-Apr\'25/164', 258),
(267, 0, 'debit', '30000', '0', 'Dr-Apr\'25/165', 259),
(268, 0, 'credit', '30000', '0', 'Dr-Apr\'25/165', 260),
(269, 0, 'debit', '11000', '0', 'Dr-Apr\'25/166', 261),
(270, 0, 'credit', '11000', '0', 'Dr-Apr\'25/166', 262),
(271, 0, 'debit', '15000', '0', 'Dr-Apr\'25/167', 263),
(272, 0, 'credit', '15000', '0', 'Dr-Apr\'25/167', 264),
(273, 0, 'debit', '5500', '0', 'Dr-Apr\'25/168', 265),
(274, 0, 'credit', '5500', '0', 'Dr-Apr\'25/168', 266),
(275, 0, 'debit', '30000', '0', 'Dr-Apr\'25/169', 267),
(276, 0, 'credit', '30000', '0', 'Dr-Apr\'25/169', 268),
(277, 0, 'debit', '2000', '0', 'Dr-Apr\'25/170', 269),
(278, 0, 'credit', '2000', '0', 'Dr-Apr\'25/170', 270),
(279, 0, 'debit', '262500', '0', 'Dr-Apr\'25/171', 271),
(280, 0, 'credit', '262500', '0', 'Dr-Apr\'25/171', 272),
(281, 0, 'debit', '15000', '0', 'Dr-Apr\'25/172', 273),
(282, 0, 'credit', '15000', '0', 'Dr-Apr\'25/172', 274),
(283, 0, 'debit', '6600', '0', 'Dr-Apr\'25/173', 275),
(284, 0, 'credit', '6600', '0', 'Dr-Apr\'25/173', 276),
(285, 0, 'debit', '30000', '0', 'Dr-Apr\'25/174', 277),
(286, 0, 'credit', '30000', '0', 'Dr-Apr\'25/174', 278),
(287, 0, 'debit', '30000', '0', 'Dr-Apr\'25/175', 279),
(288, 0, 'credit', '30000', '0', 'Dr-Apr\'25/175', 280),
(289, 0, 'debit', '8000', '0', 'Dr-Apr\'25/176', 281),
(290, 0, 'credit', '8000', '0', 'Dr-Apr\'25/176', 282),
(291, 0, 'debit', '50000', '0', 'Dr-Apr\'25/177', 283),
(292, 0, 'credit', '50000', '0', 'Dr-Apr\'25/177', 284),
(293, 0, 'debit', '14900', '0', 'Dr-Apr\'25/178', 285),
(294, 0, 'credit', '14900', '0', 'Dr-Apr\'25/178', 286),
(295, 0, 'debit', '6000', '0', 'Dr-Apr\'25/179', 287),
(296, 0, 'credit', '6000', '0', 'Dr-Apr\'25/179', 288),
(297, 0, 'debit', '6000', '0', 'Dr-Apr\'25/180', 289),
(298, 0, 'credit', '6000', '0', 'Dr-Apr\'25/180', 290),
(299, 0, 'debit', '23485240', '0', 'Dr-Apr\'25/181', 291),
(300, 0, 'credit', '23485240', '0', 'Dr-Apr\'25/181', 292),
(301, 0, 'debit', '34000', '0', 'Dr-Apr\'25/182', 293),
(302, 0, 'credit', '34000', '0', 'Dr-Apr\'25/182', 294),
(303, 0, 'debit', '7000', '0', 'Dr-Apr\'25/183', 295),
(304, 0, 'credit', '7000', '0', 'Dr-Apr\'25/183', 296),
(305, 0, 'debit', '20000000', '0', 'Dr-Apr\'25/185', 297),
(306, 0, 'credit', '20000000', '0', 'Dr-Apr\'25/185', 298),
(307, 0, 'debit', '5000', '0', 'Dr-Apr\'25/186', 299),
(308, 0, 'credit', '5000', '0', 'Dr-Apr\'25/186', 300),
(309, 0, 'debit', '112000', '0', 'Dr-Apr\'25/187', 301),
(310, 0, 'credit', '112000', '0', 'Dr-Apr\'25/187', 302),
(311, 0, 'debit', '37000', '0', 'Dr-Apr\'25/188', 303),
(312, 0, 'credit', '37000', '0', 'Dr-Apr\'25/188', 304),
(313, 0, 'debit', '702600', '0', 'Dr-Apr\'25/189', 305),
(314, 0, 'credit', '702600', '0', 'Dr-Apr\'25/189', 306),
(315, 0, 'debit', '20000', '0', 'Dr-Apr\'25/190', 307),
(316, 0, 'credit', '20000', '0', 'Dr-Apr\'25/190', 308),
(317, 0, 'debit', '2700', '0', 'Dr-Apr\'25/191', 309),
(318, 0, 'credit', '2700', '0', 'Dr-Apr\'25/191', 310),
(319, 0, 'debit', '5000', '0', 'Dr-Apr\'25/192', 311),
(320, 0, 'credit', '5000', '0', 'Dr-Apr\'25/192', 312),
(321, 0, 'debit', '50000', '0', 'Dr-Apr\'25/193', 313),
(322, 0, 'credit', '50000', '0', 'Dr-Apr\'25/193', 314),
(323, 0, 'debit', '16500', '0', 'Dr-Apr\'25/194', 315),
(324, 0, 'credit', '16500', '0', 'Dr-Apr\'25/194', 316),
(325, 0, 'debit', '23500', '0', 'Dr-Apr\'25/195', 317),
(326, 0, 'credit', '23500', '0', 'Dr-Apr\'25/195', 318),
(327, 0, 'debit', '18000', '0', 'Dr-Apr\'25/196', 319),
(328, 0, 'credit', '18000', '0', 'Dr-Apr\'25/196', 320),
(329, 0, 'debit', '10500', '0', 'Dr-Apr\'25/197', 321),
(330, 0, 'credit', '10500', '0', 'Dr-Apr\'25/197', 322),
(331, 0, 'debit', '16500', '0', 'Dr-Apr\'25/198', 323),
(332, 0, 'credit', '16500', '0', 'Dr-Apr\'25/198', 324),
(333, 0, 'debit', '33000', '0', 'Dr-Apr\'25/200', 325),
(334, 0, 'credit', '33000', '0', 'Dr-Apr\'25/200', 326),
(335, 0, 'debit', '42000', '0', 'Dr-Apr\'25/201', 327),
(336, 0, 'credit', '42000', '0', 'Dr-Apr\'25/201', 328),
(337, 0, 'debit', '225000', '0', 'Dr-Apr\'25/202', 329),
(338, 0, 'credit', '225000', '0', 'Dr-Apr\'25/202', 330),
(339, 0, 'debit', '50000', '0', 'Dr-Apr\'25/203', 331),
(340, 0, 'credit', '50000', '0', 'Dr-Apr\'25/203', 332),
(341, 0, 'debit', '40000', '0', 'Dr-Apr\'25/204', 333),
(342, 0, 'credit', '40000', '0', 'Dr-Apr\'25/204', 334),
(343, 0, 'debit', '30000', '0', 'Dr-Apr\'25/205', 335),
(344, 0, 'credit', '30000', '0', 'Dr-Apr\'25/205', 336),
(345, 0, 'debit', '65000', '0', 'Dr-Apr\'25/206', 337),
(346, 0, 'credit', '65000', '0', 'Dr-Apr\'25/206', 338),
(347, 0, 'debit', '48500', '0', 'Dr-Apr\'25/207', 339),
(348, 0, 'credit', '48500', '0', 'Dr-Apr\'25/207', 340),
(349, 0, 'debit', '316500', '0', 'Dr-Apr\'25/208', 341),
(350, 0, 'credit', '316500', '0', 'Dr-Apr\'25/208', 342),
(351, 0, 'debit', '30000', '0', 'Dr-Apr\'25/209', 343),
(352, 0, 'credit', '30000', '0', 'Dr-Apr\'25/209', 344),
(353, 0, 'debit', '6000', '0', 'Dr-Apr\'25/210', 345),
(354, 0, 'credit', '6000', '0', 'Dr-Apr\'25/210', 346),
(355, 0, 'debit', '40000', '0', 'Dr-Apr\'25/211', 347),
(356, 0, 'credit', '40000', '0', 'Dr-Apr\'25/211', 348),
(357, 0, 'debit', '30000', '0', 'Dr-Apr\'25/212', 349),
(358, 0, 'credit', '30000', '0', 'Dr-Apr\'25/212', 350),
(359, 0, 'debit', '10000', '0', 'Dr-Apr\'25/213', 351),
(360, 0, 'credit', '10000', '0', 'Dr-Apr\'25/213', 352),
(361, 0, 'debit', '3000', '0', 'Dr-Apr\'25/214', 353),
(362, 0, 'credit', '3000', '0', 'Dr-Apr\'25/214', 354),
(363, 0, 'debit', '80000', '0', 'Dr-Apr\'25/215', 355),
(364, 0, 'credit', '80000', '0', 'Dr-Apr\'25/215', 356),
(365, 0, 'debit', '45000', '0', 'Dr-Apr\'25/216', 357),
(366, 0, 'credit', '45000', '0', 'Dr-Apr\'25/216', 358),
(367, 0, 'debit', '15000', '0', 'Dr-Apr\'25/217', 359),
(368, 0, 'credit', '15000', '0', 'Dr-Apr\'25/217', 360),
(369, 0, 'debit', '2000', '0', 'Dr-Apr\'25/218', 361),
(370, 0, 'credit', '2000', '0', 'Dr-Apr\'25/218', 362),
(371, 0, 'debit', '38000', '0', 'Dr-Apr\'25/219', 363),
(372, 0, 'credit', '38000', '0', 'Dr-Apr\'25/219', 364),
(373, 0, 'debit', '58600', '0', 'Dr-Apr\'25/220', 365),
(374, 0, 'credit', '58600', '0', 'Dr-Apr\'25/220', 366),
(375, 0, 'debit', '8000', '0', 'Dr-Apr\'25/221', 367),
(376, 0, 'credit', '8000', '0', 'Dr-Apr\'25/221', 368),
(377, 0, 'debit', '2000', '0', 'Dr-Apr\'25/222', 369),
(378, 0, 'credit', '2000', '0', 'Dr-Apr\'25/222', 370),
(379, 0, 'debit', '3000', '0', 'Dr-Apr\'25/223', 371),
(380, 0, 'credit', '3000', '0', 'Dr-Apr\'25/223', 372),
(381, 0, 'debit', '10000000', '0', 'Dr-Apr\'25/224', 373),
(382, 0, 'credit', '10000000', '0', 'Dr-Apr\'25/224', 374),
(383, 0, 'debit', '20000000', '0', 'Dr-Apr\'25/011', 375),
(384, 0, 'credit', '20000000', '0', 'Dr-Apr\'25/011', 376),
(385, 0, 'debit', '7000000', '0', 'Dr-Apr\'25/012', 377),
(386, 0, 'credit', '7000000', '0', 'Dr-Apr\'25/012', 378),
(387, 0, 'debit', '5000000', '0', 'Dr-Apr\'25/013', 379),
(388, 0, 'credit', '5000000', '0', 'Dr-Apr\'25/013', 380),
(389, 0, 'debit', '10000000', '0', 'Dr-Apr\'25/014', 381),
(390, 0, 'credit', '10000000', '0', 'Dr-Apr\'25/014', 382),
(391, 0, 'debit', '20000000', '0', 'Dr-Apr\'25/015', 383),
(392, 0, 'credit', '20000000', '0', 'Dr-Apr\'25/015', 384),
(393, 0, 'debit', '30000000', '0', 'Dr-Apr\'25/016', 385),
(394, 0, 'credit', '30000000', '0', 'Dr-Apr\'25/016', 386),
(395, 0, 'debit', '10000000', '0', 'Dr-Apr\'25/017', 387),
(396, 0, 'credit', '10000000', '0', 'Dr-Apr\'25/017', 388),
(397, 0, 'debit', '25000000', '0', 'Dr-Apr\'25/018', 389),
(398, 0, 'credit', '25000000', '0', 'Dr-Apr\'25/018', 390),
(399, 0, 'debit', '5000000', '0', 'Dr-Apr\'25/019', 391),
(400, 0, 'credit', '5000000', '0', 'Dr-Apr\'25/019', 392),
(401, 0, 'debit', '6000000', '0', 'Dr-Apr\'25/020', 393),
(402, 0, 'credit', '6000000', '0', 'Dr-Apr\'25/020', 394),
(403, 0, 'debit', '5000000', '0', 'Dr-Apr\'25/021', 395),
(404, 0, 'credit', '5000000', '0', 'Dr-Apr\'25/021', 396),
(405, 0, 'debit', '10000000', '0', 'Dr-Apr\'25/022', 397),
(406, 0, 'credit', '10000000', '0', 'Dr-Apr\'25/022', 398),
(407, 0, 'debit', '7000000', '0', 'Dr-Apr\'25/023', 399),
(408, 0, 'credit', '7000000', '0', 'Dr-Apr\'25/023', 400),
(409, 0, 'debit', '7000000', '0', 'Dr-Apr\'25/024', 401),
(410, 0, 'credit', '7000000', '0', 'Dr-Apr\'25/024', 402),
(411, 0, 'debit', '7000000', '0', 'Dr-Apr\'25/025', 403),
(412, 0, 'credit', '7000000', '0', 'Dr-Apr\'25/025', 404),
(413, 0, 'debit', '7000000', '0', 'Dr-Apr\'25/026', 405),
(414, 0, 'credit', '7000000', '0', 'Dr-Apr\'25/026', 406),
(415, 0, 'debit', '5000000', '0', 'Dr-Apr\'25/027', 407),
(416, 0, 'credit', '5000000', '0', 'Dr-Apr\'25/027', 408),
(417, 0, 'debit', '10000000', '0', 'Dr-Apr\'25/028', 409),
(418, 0, 'credit', '10000000', '0', 'Dr-Apr\'25/028', 410),
(419, 0, 'debit', '6000000', '0', 'Dr-Apr\'25/029', 411),
(420, 0, 'credit', '6000000', '0', 'Dr-Apr\'25/029', 412),
(421, 0, 'debit', '5000000', '0', 'Dr-Apr\'25/030', 413),
(422, 0, 'credit', '5000000', '0', 'Dr-Apr\'25/030', 414),
(423, 0, 'debit', '15000000', '0', 'Dr-Apr\'25/031', 415),
(424, 0, 'credit', '15000000', '0', 'Dr-Apr\'25/031', 416),
(425, 0, 'debit', '5000000', '0', 'Dr-Apr\'25/032', 417),
(426, 0, 'credit', '5000000', '0', 'Dr-Apr\'25/032', 418),
(427, 0, 'debit', '10000000', '0', 'Dr-Apr\'25/033', 419),
(428, 0, 'credit', '10000000', '0', 'Dr-Apr\'25/033', 420),
(429, 0, 'debit', '7000000', '0', 'Dr-Apr\'25/034', 421),
(430, 0, 'credit', '7000000', '0', 'Dr-Apr\'25/034', 422),
(431, 0, 'debit', '20000000', '0', 'Dr-Apr\'25/035', 423),
(432, 0, 'credit', '20000000', '0', 'Dr-Apr\'25/035', 424),
(433, 2106, 'debit', '26296042.5', '12486.25', 'Cr-Apr\'25/006', 425),
(434, 2106, 'credit', '26296042.5', '12486.25', 'Cr-Apr\'25/006', 426),
(435, 0, 'debit', '5000', '0', 'Cr-Apr\'25/006', 427),
(436, 0, 'credit', '5000', '0', 'Cr-Apr\'25/006', 428),
(437, 0, 'debit', '20000000', '0', 'Dr-Apr\'25/011', 429),
(438, 0, 'credit', '20000000', '0', 'Dr-Apr\'25/011', 430),
(439, 0, 'debit', '134778051.25', '0', 'Cr-Apr\'25/006', 431),
(440, 0, 'credit', '134778051.25', '0', 'Cr-Apr\'25/006', 432),
(441, 0, 'debit', '25000000', '0', 'Dr-Apr\'25/099', 433),
(442, 0, 'credit', '25000000', '0', 'Dr-Apr\'25/099', 434),
(443, 0, 'debit', '6000000', '0', 'Dr-Apr\'25/100', 435),
(444, 0, 'credit', '6000000', '0', 'Dr-Apr\'25/100', 436),
(445, 0, 'debit', '6000000', '0', 'Dr-Apr\'25/101', 437),
(446, 0, 'credit', '6000000', '0', 'Dr-Apr\'25/101', 438),
(447, 0, 'debit', '30000000', '0', 'Dr-Apr\'25/102', 439),
(448, 0, 'credit', '30000000', '0', 'Dr-Apr\'25/102', 440),
(449, 0, 'debit', '30000000', '0', 'Cr-Apr\'25/010', 441),
(450, 0, 'credit', '30000000', '0', 'Cr-Apr\'25/010', 442),
(451, 4360, 'debit', '174182000', '39950', 'Cr-Apr\'25/011', 443),
(452, 4360, 'credit', '174182000', '39950', 'Cr-Apr\'25/011', 444),
(453, 0, 'debit', '800', '0', 'Dr-Apr\'25/120', 445),
(454, 0, 'credit', '800', '0', 'Dr-Apr\'25/120', 446),
(455, 0, 'debit', '1600', '0', 'Dr-Apr\'25/121', 447),
(456, 0, 'credit', '1600', '0', 'Dr-Apr\'25/121', 448),
(457, 0, 'debit', '50000000', '0', 'Dr-Apr\'25/122', 449),
(458, 0, 'credit', '50000000', '0', 'Dr-Apr\'25/122', 450),
(459, 0, 'debit', '10000000', '0', 'Dr-Apr\'25/130', 451),
(460, 0, 'credit', '10000000', '0', 'Dr-Apr\'25/130', 452),
(461, 0, 'debit', '10000000', '0', 'Dr-Apr\'25/131', 453),
(462, 0, 'credit', '10000000', '0', 'Dr-Apr\'25/131', 454),
(463, 0, 'debit', '10000000', '0', 'Dr-Apr\'25/132', 455),
(464, 0, 'credit', '10000000', '0', 'Dr-Apr\'25/132', 456),
(465, 0, 'debit', '5000000', '0', 'Dr-Apr\'25/133', 457),
(466, 0, 'credit', '5000000', '0', 'Dr-Apr\'25/133', 458),
(467, 0, 'debit', '10000000', '0', 'Dr-Apr\'25/134', 459),
(468, 0, 'credit', '10000000', '0', 'Dr-Apr\'25/134', 460),
(469, 0, 'debit', '10000000', '0', 'Dr-Apr\'25/152', 461),
(470, 0, 'credit', '10000000', '0', 'Dr-Apr\'25/152', 462),
(471, 0, 'debit', '7000000', '0', 'Dr-Apr\'25/153', 463),
(472, 0, 'credit', '7000000', '0', 'Dr-Apr\'25/153', 464),
(473, 0, 'debit', '20000000', '0', 'Dr-Apr\'25/154', 465),
(474, 0, 'credit', '20000000', '0', 'Dr-Apr\'25/154', 466),
(475, 0, 'debit', '5000000', '0', 'Dr-Apr\'25/155', 467),
(476, 0, 'credit', '5000000', '0', 'Dr-Apr\'25/155', 468),
(477, 0, 'debit', '7000000', '0', 'Dr-Apr\'25/156', 469),
(478, 0, 'credit', '7000000', '0', 'Dr-Apr\'25/156', 470),
(479, 0, 'debit', '10000000', '0', 'Dr-Apr\'25/157', 471),
(480, 0, 'credit', '10000000', '0', 'Dr-Apr\'25/157', 472),
(481, 0, 'debit', '7000000', '0', 'Dr-Apr\'25/158', 473),
(482, 0, 'credit', '7000000', '0', 'Dr-Apr\'25/158', 474),
(483, 0, 'debit', '10000000', '0', 'Dr-Apr\'25/159', 475),
(484, 0, 'credit', '10000000', '0', 'Dr-Apr\'25/159', 476),
(485, 0, 'debit', '30000000', '0', 'Dr-Apr\'25/160', 477),
(486, 0, 'credit', '30000000', '0', 'Dr-Apr\'25/160', 478),
(487, 0, 'debit', '5000000', '0', 'Dr-Apr\'25/161', 479),
(488, 0, 'credit', '5000000', '0', 'Dr-Apr\'25/161', 480),
(489, 0, 'debit', '10000000', '0', 'Dr-Apr\'25/162', 481),
(490, 0, 'credit', '10000000', '0', 'Dr-Apr\'25/162', 482),
(491, 0, 'debit', '6000000', '0', 'Dr-Apr\'25/163', 483),
(492, 0, 'credit', '6000000', '0', 'Dr-Apr\'25/163', 484),
(493, 0, 'debit', '20000000', '0', 'Dr-Apr\'25/164', 485),
(494, 0, 'credit', '20000000', '0', 'Dr-Apr\'25/164', 486),
(495, 2106, 'debit', '26296042.5', '12486.25', 'Cr-Apr\'25/016', 487),
(496, 2106, 'credit', '26296042.5', '12486.25', 'Cr-Apr\'25/016', 488),
(497, 2106, 'debit', '26296042.5', '12486.25', 'Cr-Apr\'25/017', 489),
(498, 2106, 'credit', '26296042.5', '12486.25', 'Cr-Apr\'25/017', 490),
(499, 0, 'debit', '30670526.25', '0', 'Cr-Apr25/006', 491),
(500, 0, 'credit', '30670526.25', '0', 'Cr-Apr25/006', 492),
(501, 0, 'debit', '110000', '0', 'Dr-Apr\'25/136', 493),
(502, 0, 'credit', '110000', '0', 'Dr-Apr\'25/136', 494),
(503, 0, 'debit', '2000', '0', 'Dr-Apr\'25/136', 495),
(504, 0, 'credit', '2000', '0', 'Dr-Apr\'25/136', 496),
(505, 1, 'debit', '5010', '5010', 'Cr-Apr\'25/008', 497),
(506, 1, 'credit', '5010', '5010', 'Cr-Apr\'25/008', 498),
(507, 1, 'debit', '5010', '5010', 'Dr-Apr\'25/117', 499),
(508, 1, 'credit', '5010', '5010', 'Dr-Apr\'25/117', 500),
(509, 1, 'debit', '11000', '11000', 'Cr-Apr\'25/015', 501),
(510, 1, 'credit', '11000', '11000', 'Cr-Apr\'25/015', 502),
(511, 1, 'debit', '11000', '11000', 'Dr-Apr\'25/184', 503),
(512, 1, 'credit', '11000', '11000', 'Dr-Apr\'25/184', 504),
(513, 1, 'debit', '5010', '5010', 'Cr-Apr\'25/008', 505),
(514, 1, 'credit', '5010', '5010', 'Cr-Apr\'25/008', 506),
(515, 1, 'debit', '5010', '5010', 'Dr-Apr\'25/117', 507),
(516, 1, 'credit', '5010', '5010', 'Dr-Apr\'25/117', 508),
(517, 1, 'debit', '49945', '49945', 'Cr-Apr\'25/007', 509),
(518, 1, 'credit', '49945', '49945', 'Cr-Apr\'25/007', 510),
(519, 1, 'debit', '10', '10', 'Dr-Apr\'25/097', 511),
(520, 1, 'credit', '10', '10', 'Dr-Apr\'25/097', 512),
(521, 2106, 'debit', '26296042.5', '12486.25', 'Dr-Apr\'25/098', 513),
(522, 2106, 'credit', '26296042.5', '12486.25', 'Dr-Apr\'25/098', 514),
(523, 4418, 'debit', '165448577.5', '37448.75', 'Dr-Apr\'25/098', 515),
(524, 4418, 'credit', '165448577.5', '37448.75', 'Dr-Apr\'25/098', 516),
(525, 1, 'debit', '49945', '49945', 'Cr-Apr\'25/016', 517),
(526, 1, 'credit', '49945', '49945', 'Cr-Apr\'25/016', 518),
(527, 1, 'debit', '49945', '49945', 'Cr-Apr\'25/017', 519),
(528, 1, 'credit', '49945', '49945', 'Cr-Apr\'25/017', 520),
(529, 2106, 'debit', '26296042.5', '12486.25', 'Cr-Apr\'25/016', 521),
(530, 2106, 'credit', '26296042.5', '12486.25', 'Cr-Apr\'25/016', 522),
(531, 2106, 'debit', '26296042.5', '12486.25', 'Cr-Apr\'25/017', 523),
(532, 1, 'debit', '5010', '5010', 'Dr-Apr\'25/118', 524),
(533, 1, 'credit', '5010', '5010', 'Dr-Apr\'25/118', 525),
(534, 1, 'debit', '36.22', '36.22', 'Jv04-009', 526),
(535, 1, 'credit', '36.22', '36.22', 'Jv04-009', 527),
(536, 1, 'debit', '36.22', '36.22', 'Jv04-010', 528),
(537, 1, 'credit', '36.22', '36.22', 'Jv04-010', 529),
(538, 1, 'debit', '50', '50', 'Jv04-003', 530),
(539, 1, 'credit', '50', '50', 'Jv04-003', 531),
(540, 1, 'debit', '1481.59', '1481.59', 'Jv04-011', 532),
(541, 1, 'credit', '1481.59', '1481.59', 'Jv04-011', 533),
(542, 1, 'debit', '5000', '5000', 'Jv04-012', 534),
(543, 1, 'credit', '5000', '5000', 'Jv04-012', 535),
(544, 1, 'debit', '3845', '3845', 'Jv04-013', 536),
(545, 1, 'credit', '3845', '3845', 'Jv04-013', 537),
(546, 1, 'debit', '122.81', '122.81', 'Jv04-014', 538),
(547, 1, 'credit', '122.81', '122.81', 'Jv04-014', 539),
(548, 1, 'debit', '8845', '8845', 'Jv04-016', 540),
(549, 1, 'credit', '8845', '8845', 'Jv04-016', 541),
(550, 1, 'debit', '7.43', '7.43', 'Jv04-017', 542),
(551, 1, 'credit', '7.43', '7.43', 'Jv04-017', 543),
(552, 1, 'debit', '2416.15', '2416.15', 'Jv04-015', 544),
(553, 1, 'credit', '2416.15', '2416.15', 'Jv04-015', 545),
(556, 1, 'debit', '55', '55', 'Jv04-007', 548),
(557, 1, 'credit', '55', '55', 'Jv04-007', 549),
(558, 1, 'debit', '55', '55', 'JV04-008', 550),
(559, 1, 'credit', '55', '55', 'JV04-008', 551),
(560, 1, 'debit', '275750.5', '275750.50', 'Jv04-005', 552),
(561, 1, 'credit', '275750.5', '275750.5', 'Jv04-005', 553),
(562, 1, 'debit', '311755.9', '311755.9', 'Jv04-006', 554),
(563, 1, 'credit', '311755.9', '311755.9', 'Jv04-006', 555),
(566, 1, 'debit', '55', '55', 'Jv04-002', 558),
(567, 1, 'credit', '55', '55', 'Jv04-002', 559);

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
('3300/007', 'Bangladesh (Chill/Technak)', '', ''),
('3300/008', 'BRUNEI A/C', '', ''),
('3300/009', 'SC Fruit A/C - Mango A/C', '', ''),
('3300/010', 'SC Fruit A/C - Apple A/C', '', ''),
('3300/011', 'H - Trader A/C', '', ''),
('3300/012', 'Link Mark Impex', '', '');

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
(5, '2025-03-24', '1015', '4000/T23', NULL, 'Frozen', '5/8', '1223', '1998.382', '', 0, 5, 0),
(6, '2025-04-05', '1023', '4000/s03', NULL, 'Frozen', '1up', '58', '94.772', '34', 0, 6, 0),
(7, '2025-04-05', '1023', '4000/s03', NULL, 'Frozen', '2up', '1603.8', '2620.6092', '1045', 0, 7, 0),
(8, '2025-04-05', '1023', '4000/s03', NULL, 'Frozen', '3up', '492', '803.928', '225', 0, 8, 0),
(9, '2025-04-05', '1023', '4000/s03', NULL, 'Frozen', '4up', '27.5', '44.935', '10', 0, 9, 0),
(10, '2025-04-19', '1037', '4000/a01', NULL, 'Frozen', '1D', '12.7', '20.7518', '', 0, 10, 0),
(11, '2025-04-19', '1037', '4000/a01', NULL, 'Frozen', '1/2', '6', '9.804', '', 0, 11, 0),
(12, '2025-04-19', '1037', '4000/a01', NULL, 'Frozen', '2/3', '1.3', '2.1242', '', 0, 12, 0),
(13, '2025-04-19', '1037', '4000/a01', NULL, 'Frozen', '3/4', '0.9', '1.4706', '', 0, 13, 0),
(14, '2025-04-19', '1037', '4000/a01', NULL, 'Frozen', '4up', '3.8', '6.2092', '', 0, 14, 0),
(15, '2025-04-25', '1031', '4000/s03', 'lm', 'Frozen', '18/24', '109', '178.106', '', 0, 15, 0),
(16, '2025-04-25', '1031', '4000/s03', 'lm', 'Frozen', '13/18', '300', '490.2', '', 0, 16, 0),
(17, '2025-04-26', '1023', '4000/s03', 'can', 'Frozen', '2up', '65.3', '106.7002', '30', 30, 17, 0),
(18, '2025-04-26', '1023', '4000/s03', 'can', 'Frozen', '3up', '572.8', '935.9552', '241', 127, 18, 0),
(19, '2025-04-26', '1023', '4000/s03', 'can', 'Frozen', '4up', '162.9', '266.1786', '48', 152, 19, 0),
(20, '2025-04-27', '1015', '4000/t11', NULL, 'Frozen', '5/8', '1.5', '2.451', '', 0, 20, 0),
(21, '2025-04-28', '1002', '4000/n04', NULL, 'Frozen', '2up', '289.1', '472.3894', '161', 0, 21, 0),
(22, '2025-04-28', '1002', '4000/t02', NULL, 'Frozen', '2up', '120.4', '196.7336', '67', 0, 22, 0),
(23, '2025-04-28', '1023', '4000/s03', 'can', 'Frozen', '2up', '547.2', '894.1248', '', 210, 23, 0),
(24, '2025-04-28', '1023', '4000/s03', 'can', 'Frozen', '3up', '463.6', '757.5224', '', 289, 24, 0),
(25, '2025-04-28', '1017', '4000/b01', NULL, 'Frozen', '3up', '379.75', '620.5115', '', 0, 25, 0),
(26, '2025-04-28', '1017', '4000/b01', NULL, 'Frozen', '2up', '323', '527.782', '', 0, 26, 0),
(27, '2025-04-26', '1023', '4000/s03', 'can', 'Frozen', '5up', '', '', '', 20, 19, 0),
(28, '2025-04-28', '1023', '4000/s03', 'can', 'Frozen', '4up', '', '', '', 29, 24, 0);

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
  `percentage` varchar(11) NOT NULL,
  `fish_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `form10stock`
--

INSERT INTO `form10stock` (`id`, `date`, `item_id`, `supplier_id`, `country`, `type`, `size`, `pcsform10`, `mc`, `kg`, `pcs`, `looseinkg`, `looseinpcs`, `looseoutkg`, `looseoutpcs`, `total_kg`, `percentage`, `fish_type`) VALUES
(1, '2025-04-28', '1023', '4000/S03', 'Can', 'frozen', '2up', 30, 4, '82', 30, '', 0, '', 0, '82', '', 'G'),
(2, '2025-04-28', '1023', '4000/S03', 'Can', 'frozen', '3up', 126, 21, '453.5', 126, '', 0, '', 0, '453.5', '', 'G'),
(3, '2025-04-28', '1023', '4000/S03', 'Can', 'frozen', '4up', 157, 31, '687', 154, '12.9', 3, '', 0, '699.9', '', 'G'),
(4, '2025-04-28', '1023', '4000/S03', 'Can', 'frozen', '5up', 16, 4, '85', 16, '', 0, '', 0, '85', '', 'G'),
(5, '2025-04-29', '1023', '4000/S03', 'can', 'frozen', '2up', 210, 28, '571', 207, '8.8', 3, '', 0, '579.8', '', 'G'),
(6, '2025-04-29', '1023', '4000/S03', 'can', 'frozen', '3up', 289, 48, '1021', 288, '3.4', 1, '', 0, '1024.4', '', 'G'),
(7, '2025-04-29', '1023', '4000/S03', 'can', 'frozen', '4up', 29, 5, '107', 25, '17.6', 4, '', 0, '124.6', '', 'G'),
(8, '2025-04-28', '1031', '4000/S03', 'lm', 'frozen', '18/24 - 13/', 789, 33, '394.5', 789, '18.6', 0, '', 0, '413.1', '', 'Cut_piece');

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
(1, '2025-04-05', '13090', '4000/S03', '', '54820000', '-54820000', '', '', '', 0, 0, 0),
(2, '2025-03-24', '13091', '4000/T23', '', '37913000', '10503000', '', '', '', 0, 0, 0),
(3, '2025-04-01', '', '3300/002', '', '', '0', 'Opening Balance', '', '', 0, 0, 0),
(4, '2025-04-01', 'Opening Balance', '3300/003', '', '', '0', 'Opening Balance', '', '', 0, 0, 0),
(5, '2025-04-01', 'Opening Balance', '3300/006', '', '', '375566.05', 'Opening Balance', '', '', 0, 0, 0),
(6, '2025-04-01', 'Opening Balance', '3300/007', '', '', '510407.23', 'Opening Balance', '', '', 0, 0, 0),
(7, '2025-04-01', '', '4000/001', '', '', '47389150', 'Opening Balance', '', '', 0, 0, 0),
(8, '2025-04-01', '', '4000/A03', '', '', '321325350', 'Opening Balance', '', '', 0, 0, 0),
(9, '2025-04-01', '', '4000/A06', '', '', '85468550', 'Opening Balance', '', '', 0, 0, 0),
(10, '2025-04-01', '', '4000/A01', '', '', '163037025', 'Opening Balance', '', '', 0, 0, 0),
(11, '2025-04-01', '', '4000/A19', '', '', '59930600', 'Opening Balance', '', '', 0, 0, 0),
(12, '2025-04-01', '', '4000/A07', '', '', '39229800', 'Opening Balance', '', '', 0, 0, 0),
(13, '2025-04-01', '', '4000/B01', '', '', '29099465', 'Opening Balance', '', '', 0, 0, 0),
(14, '2025-04-01', '', '4000/C03', '', '', '55497325', 'Opening Balance', '', '', 0, 0, 0),
(15, '2025-04-01', '', '4000/N01', '', '', '24621900', 'Opening Balance', '', '', 0, 0, 0),
(16, '2025-04-01', '', '4000/N04', '', '', '14897900', 'Opening Balance', '', '', 0, 0, 0),
(17, '2025-04-01', '', '4000/P05', '', '', '95525700', 'Opening Balance', '', '', 0, 0, 0),
(18, '2025-04-01', '', '4000/P01', '', '', '29413150', 'Opening Balance', '', '', 0, 0, 0),
(19, '2025-04-01', '', '4000/S03', '', '', '220472876', 'Opening Balance', '', '', 0, 0, 0),
(20, '2025-04-01', '', '4000/S04', '', '', '163162650', 'Opening Balance', '', '', 0, 0, 0),
(21, '2025-04-01', '', '4000/S01', '', '', '79008150', 'Opening Balance', '', '', 0, 0, 0),
(22, '2025-04-01', '', '4000/S06', '', '', '425863820', 'Opening Balance', '', '', 0, 0, 0),
(23, '2025-04-01', '', '4000/T07', '', '', '10000000', 'Opening Balance', '', '', 0, 0, 0),
(24, '2025-04-01', '', '4000/T05', '', '', '222942798', 'Opening Balance', '', '', 0, 0, 0),
(25, '2025-04-01', '', '4000/T11', '', '', '567858275', 'Opening Balance', '', '', 0, 0, 0),
(26, '2025-04-01', '', '4000/T17', '', '', '142021845', 'Opening Balance', '', '', 0, 0, 0),
(27, '2025-04-01', '', '4000/T19', '', '', '134583800', 'Opening Balance', '', '', 0, 0, 0),
(28, '2025-04-01', '', '4000/T03', '', '', '50724525', 'Opening Balance', '', '', 0, 0, 0),
(29, '2025-04-01', '', '4000/T01', '', '', '40990550', 'Opening Balance', '', '', 0, 0, 0),
(30, '2025-04-01', '', '4000/T02', '', '', '38059100', 'Opening Balance', '', '', 0, 0, 0),
(31, '2025-04-01', '', '4000/K16', '', '', '17310400', 'Opening Balance', '', '', 0, 0, 0),
(32, '2025-04-01', '', '4000/K07', '', '', '139611400', 'Opening Balance', '', '', 0, 0, 0),
(33, '2025-04-01', '', '4000/K05', '', '', '731601650', 'Opening Balance', '', '', 0, 0, 0),
(34, '2025-04-01', '', '4000/W01', '', '', '21698175', 'Opening Balance', '', '', 0, 0, 0),
(35, '2025-04-01', '', '4000/Y01', '', '', '43628000', 'Opening Balance', '', '', 0, 0, 0),
(36, '2025-04-01', '', '4000/Z03', '', '', '20257925', 'Opening Balance', '', '', 0, 0, 0),
(37, '2025-04-01', '', '4000/G03', '', '', '1212000', 'Opening Balance', '', '', 0, 0, 0),
(38, '2025-04-01', '', '4000/M04', '', '', '10765260', 'Opening Balance', '', '', 0, 0, 0),
(39, '2025-04-01', '', '4000/P03', '', '', '2220500', 'Opening Balance', '', '', 0, 0, 0),
(40, '2025-04-01', '', '4000/H03', '', '', '10521788', 'Opening Balance', '', '', 0, 0, 0),
(41, '2025-04-01', '', '4000/G01', '', '', '339628', 'Opening Balance', '', '', 0, 0, 0),
(42, '2025-04-01', 'Opening Balance', '3300/009', '', '', '36524.94', 'Opening Balance', '', '', 0, 0, 0),
(43, '2025-04-01', 'Opening Balance', '3300/010', '', '', '16903.53', 'Opening Balance', '', '', 0, 0, 0),
(44, '2025-04-01', 'Opening Balance', '3300/011', '', '', '109681.7', 'Opening Balance', '', '', 0, 0, 0),
(45, '2025-04-01', '', '4000/A24', '', '', '0', 'Opening Balance', '', '', 0, 0, 0),
(46, '2025-04-01', '', '3700/001', '0', '0', '0', 'Opening Balance of Apr\'2025', '', '', 0, 0, 0),
(47, '2025-04-01', '', '3700/002', '0', '0', '0', 'Opening Balance of Apr\'2025', '', '', 0, 0, 0),
(48, '2025-04-01', '', '3700/003', '0', '0', '0', 'Opening Balance of Apr\'2025', '', '', 0, 0, 0),
(50, '2025-04-01', '', '3400/005', '0', '0', '0', 'Opening Balance of Apr\'2025', '', '', 0, 0, 0),
(51, '2025-04-01', '', '3400/006', '0', '0', '0', 'Opening Balance of Apr\'25', '', '', 0, 0, 0),
(52, '2025-04-19', '13092', '4000/a01', '', '798700', '-772089', '', '', '', 0, 0, 0),
(53, '2025-04-25', '13093', '4000/s03', '', '3176500', '-3948589', '', '', '', 0, 0, 0),
(54, '2025-04-26', '13094', '4000/s03', '', '12284900', '-16233489', '', '', '', 0, 0, 0),
(55, '2025-04-27', '13095', '4000/t11', '', '63000', '-16170489', '', '', '', 0, 0, 0),
(56, '2025-04-28', '13096', '4000/n04', '', '4914700', '-11255789', '', '', '', 0, 0, 0),
(57, '2025-04-28', '13097', '4000/t02', '', '2046800', '-9208989', '', '', '', 0, 0, 0),
(58, '2025-04-28', '13098', '4000/s03', '', '14573000', '-23781989', '', '', '', 0, 0, 0),
(59, '2025-04-28', '13099', '4000/b01', '', '6634225', '-30416214', '', '', '', 0, 0, 0),
(60, '2025-04-01', 'Cr-Apr\'25/001', '3600/001', '200000', '0', '200000', 'ADV; money Return from Ma Pyone for 31.3.2025\r\n', '', '', 0, 35, 1),
(61, '2025-04-01', 'Cr-Apr\'25/001', '9100/046', '0', '200000', '-200000', 'ADV; money Return from Ma Pyone for 31.3.2025\r\n', '', '', 0, 39, 2),
(62, '2025-04-01', 'Dr-Apr\'25/001', '9100/004', '44000', '0', '44000', 'Monthly Phone Bill for 5000ks*4pcs/6000ks*4pcs for Apr\'25\r\n', '', '', 0, 39, 3),
(63, '2025-04-01', 'Dr-Apr\'25/001', '3600/001', '0', '44000', '156000', 'Monthly Phone Bill for 5000ks*4pcs/6000ks*4pcs for Apr\'25\r\n', '', '', 0, 35, 4),
(64, '2025-04-01', 'Dr-Apr\'25/002', '9100/004', '60375', '0', '104375', 'YTP Internet Bill for Sir House of Mar\'25\r\n', '', '', 0, 39, 5),
(65, '2025-04-01', 'Dr-Apr\'25/002', '3600/001', '0', '60375', '95625', 'YTP Internet Bill for Sir House of Mar\'25\r\n', '', '', 0, 35, 6),
(66, '2025-04-01', 'Dr-Apr\'25/003', '9100/004', '84125', '0', '188500', ' Hi Internet Bill for W/H and Office of Apr\'25 \r\n', '', '', 0, 39, 7),
(67, '2025-04-01', 'Dr-Apr\'25/003', '3600/001', '0', '84125', '11500', ' Hi Internet Bill for W/H and Office of Apr\'25 \r\n', '', '', 0, 35, 8),
(68, '2025-04-01', 'Dr-Apr\'25/004', '9100/041', '76000', '0', '76000', 'Paid to MM Clare BL and Seal Charges for H Trader HT-01/25\r\n', '', '', 0, 39, 9),
(69, '2025-04-01', 'Dr-Apr\'25/004', '3600/001', '0', '76000', '-64500', 'Paid to MM Clare BL and Seal Charges for H Trader HT-01/25\r\n', '', '', 0, 35, 10),
(70, '2025-04-01', 'Dr-Apr\'25/005', '9100/040', '6000', '0', '6000', 'Inbound and Outbound Tour Licence Renew Form Charges\r\n', '', '', 0, 39, 11),
(71, '2025-04-01', 'Dr-Apr\'25/005', '3600/001', '0', '6000', '-70500', 'Inbound and Outbound Tour Licence Renew Form Charges\r\n', '', '', 0, 35, 12),
(72, '2025-04-01', 'Dr-Apr\'25/006', '9100/002', '45300', '0', '45300', 'Taxi Charges for W/H to MM Clare to Time Square to W/H for BL Charges money sent\r\n', '', '', 0, 39, 13),
(73, '2025-04-01', 'Dr-Apr\'25/006', '3600/001', '0', '45300', '-115800', 'Taxi Charges for W/H to MM Clare to Time Square to W/H for BL Charges money sent\r\n', '', '', 0, 35, 14),
(74, '2025-04-01', 'Dr-Apr\'25/007', '9100/011', '119000', '0', '119000', 'Coffee and Other Purchase for Eid Festival Donation\r\n', '', '', 0, 39, 15),
(75, '2025-04-01', 'Dr-Apr\'25/007', '3600/001', '0', '119000', '-234800', 'Coffee and Other Purchase for Eid Festival Donation\r\n', '', '', 0, 35, 16),
(76, '2025-04-01', 'Dr-Apr\'25/008', '9100/011', '201300', '0', '320300', 'Rice,Fruit and Other Purchase for Eid Festival Donation\r\n', '', '', 0, 39, 17),
(77, '2025-04-01', 'Dr-Apr\'25/008', '3600/001', '0', '201300', '-436100', 'Rice,Fruit and Other Purchase for Eid Festival Donation\r\n', '', '', 0, 35, 18),
(78, '2025-04-01', 'Dr-Apr\'25/009', '6100/001', '42000', '0', '42000', 'Labour Charges for MSL Chito (70V*600ks)\r\n', '', '', 0, 37, 19),
(79, '2025-04-01', 'Dr-Apr\'25/009', '3600/001', '0', '42000', '-478100', 'Labour Charges for MSL Chito (70V*600ks)\r\n', '', '', 0, 35, 20),
(80, '2025-04-01', 'Dr-Apr\'25/010', '9100/002', '13300', '0', '58600', 'Taxi Charges for W/H to MSL to Ocean Pacific\r\n', '', '', 0, 39, 21),
(81, '2025-04-01', 'Dr-Apr\'25/010', '3600/001', '0', '13300', '-491400', 'Taxi Charges for W/H to MSL to Ocean Pacific\r\n', '', '', 0, 35, 22),
(82, '2025-04-02', 'Cr-Apr\'25/002', '3600/001', '5000', '0', '-486400', 'Water Bill Received from ACE \r\n', '', '', 0, 35, 23),
(83, '2025-04-02', 'Cr-Apr\'25/002', '9100/013', '0', '5000', '-5000', 'Water Bill Received from ACE \r\n', '', '', 0, 39, 24),
(84, '2025-04-02', 'Cr-Apr\'25/003', '3600/001', '35000', '0', '-451400', 'Money Return from Thoon Set Paing for Spare Licence \r\n', '', '', 0, 35, 25),
(85, '2025-04-02', 'Cr-Apr\'25/003', '9100/014', '0', '35000', '-35000', 'Money Return from Thoon Set Paing for Spare Licence \r\n', '', '', 0, 39, 26),
(86, '2025-04-02', 'Cr-Apr\'25/004', '3600/001', '22455240', '0', '22003840', 'Account Adjustment for Mar\'25 Salary (Mar\'25 Salary ကို Apr\'25 တွင် Charge လုပ်ထားသောကြောင့် စာရင်းညွှိနှိုင်းမှု လုပ်ခြင်းဖြစ်သည်)\r\n', '', '', 0, 35, 27),
(87, '2025-04-02', 'Cr-Apr\'25/004', '9100/001', '0', '22455240', '-22455240', 'Account Adjustment for Mar\'25 Salary (Mar\'25 Salary ကို Apr\'25 တွင် Charge လုပ်ထားသောကြောင့် စာရင်းညွှိနှိုင်းမှု လုပ်ခြင်းဖြစ်သည်)\r\n', '', '', 0, 39, 28),
(88, '2025-04-02', 'Dr-Apr\'25/036', '9100/002', '4500', '0', '63100', 'Taxi Charges for W/H to ACE Office\r\n', '', '', 0, 39, 29),
(89, '2025-04-02', 'Dr-Apr\'25/036', '3600/001', '0', '4500', '21999340', 'Taxi Charges for W/H to ACE Office\r\n', '', '', 0, 35, 30),
(90, '2025-04-02', 'Dr-Apr\'25/037', '9100/002', '2000', '0', '65100', 'Taxi Charges for W/H to LMG by Sandar\r\n', '', '', 0, 39, 31),
(91, '2025-04-02', 'Dr-Apr\'25/037', '3600/001', '0', '2000', '21997340', 'Taxi Charges for W/H to LMG by Sandar\r\n', '', '', 0, 35, 32),
(92, '2025-04-02', 'Dr-Apr\'25/038', '9100/004', '3000', '0', '191500', 'Sir Phone Bill for 1.4.25\r\n', '', '', 0, 39, 33),
(93, '2025-04-02', 'Dr-Apr\'25/038', '3600/001', '0', '3000', '21994340', 'Sir Phone Bill for 1.4.25\r\n', '', '', 0, 35, 34),
(94, '2025-04-02', 'Dr-Apr\'25/039', '9100/041', '215880', '0', '291880', 'BL,Seal and Document Fees for Can.03/25\r\n', '', '', 0, 39, 35),
(95, '2025-04-02', 'Dr-Apr\'25/039', '3600/001', '0', '215880', '21778460', 'BL,Seal and Document Fees for Can.03/25\r\n', '', '', 0, 35, 36),
(96, '2025-04-02', 'Dr-Apr\'25/040', '9100/017', '3110000', '0', '3110000', 'Airticket 2pcs Purchase for Sir and Daw Nan(YGN-BKK) 14.4.25-23.4.25\r\n', '', '', 0, 39, 37),
(97, '2025-04-02', 'Dr-Apr\'25/040', '3600/001', '0', '3110000', '18668460', 'Airticket 2pcs Purchase for Sir and Daw Nan(YGN-BKK) 14.4.25-23.4.25\r\n', '', '', 0, 35, 38),
(98, '2025-04-02', 'Dr-Apr\'25/041', '9100/002', '5000', '0', '70100', 'Taxi Charges for W/H to KBZ Bank go\r\n', '', '', 0, 39, 39),
(99, '2025-04-02', 'Dr-Apr\'25/041', '3600/001', '0', '5000', '18663460', 'Taxi Charges for W/H to KBZ Bank go\r\n', '', '', 0, 35, 40),
(100, '2025-04-02', 'Dr-Apr\'25/042', '9100/002', '9000', '0', '79100', 'Taxi Charges for Eid Donation\r\n', '', '', 0, 39, 41),
(101, '2025-04-02', 'Dr-Apr\'25/042', '3600/001', '0', '9000', '18654460', 'Taxi Charges for Eid Donation\r\n', '', '', 0, 35, 42),
(102, '2025-04-02', 'Dr-Apr\'25/043', '9100/011', '5000', '0', '325300', 'Donation for W/H Dogs\r\n', '', '', 0, 39, 43),
(103, '2025-04-02', 'Dr-Apr\'25/043', '3600/001', '0', '5000', '18649460', 'Donation for W/H Dogs\r\n', '', '', 0, 35, 44),
(104, '2025-04-02', 'Dr-Apr\'25/044', '9100/001', '22455240', '0', '0', 'Staff Salary for Mar\'25\r\n', '', '', 0, 39, 45),
(105, '2025-04-02', 'Dr-Apr\'25/044', '3600/001', '0', '22455240', '-3805780', 'Staff Salary for Mar\'25\r\n', '', '', 0, 35, 46),
(106, '2025-04-02', 'Dr-Apr\'25/045', '9100/011', '800000', '0', '1125300', 'Earthquake Donation for NPT-500000+YGN-300000 (28.3.25)\r\n', '', '', 0, 39, 47),
(107, '2025-04-02', 'Dr-Apr\'25/045', '3600/001', '0', '800000', '-4605780', 'Earthquake Donation for NPT-500000+YGN-300000 (28.3.25)\r\n', '', '', 0, 35, 48),
(108, '2025-04-03', 'Cr-Apr\'25/005', '3600/001', '109390500', '0', '104784720', 'Canada Money Received from May Yu (31.3.2025)$25000-$25 = $24975*4380ks\r\n', '', '', 0, 35, 49),
(109, '2025-04-03', 'Cr-Apr\'25/005', '3300/003', '0', '24975', '-24975', 'Canada Money Received from May Yu (31.3.2025)$25000-$25 = $24975*4380ks\r\n', '', '', 0, 35, 50),
(110, '2025-04-03', 'Dr-Apr\'25/046', '9100/002', '4000', '0', '83100', 'Taxi Charges for W/H to Sir House for Fish sent\r\n', '', '', 0, 39, 51),
(111, '2025-04-03', 'Dr-Apr\'25/046', '3600/001', '0', '4000', '104780720', 'Taxi Charges for W/H to Sir House for Fish sent\r\n', '', '', 0, 35, 52),
(112, '2025-04-03', 'Dr-Apr\'25/047', '4000/k07', '20000000', '0', '159611400', 'Paid to KMM for Vr.12924\r\n', '', '', 0, 40, 53),
(113, '2025-04-03', 'Dr-Apr\'25/047', '3600/001', '0', '20000000', '84780720', 'Paid to KMM for Vr.12924\r\n', '', '', 0, 35, 54),
(114, '2025-04-03', 'Dr-Apr\'25/048', '4000/t05', '20000000', '0', '242942798', 'Paid to Thet Oo for Vr.12702,12758\r\n', '', '', 0, 40, 55),
(115, '2025-04-03', 'Dr-Apr\'25/048', '3600/001', '0', '20000000', '64780720', 'Paid to Thet Oo for Vr.12702,12758\r\n', '', '', 0, 35, 56),
(116, '2025-04-03', 'Dr-Apr\'25/049', '4000/k05', '30000000', '0', '761601650', 'Paid to Kyaw Zay Ya for Vr.12448\r\n', '', '', 0, 40, 57),
(117, '2025-04-03', 'Dr-Apr\'25/049', '3600/001', '0', '30000000', '34780720', 'Paid to Kyaw Zay Ya for Vr.12448\r\n', '', '', 0, 35, 58),
(118, '2025-04-03', 'Dr-Apr\'25/050', '4000/t11', '30000000', '0', '13829511', 'Paid to Tun Zaw Min for Vr.12636,12646,12652\r\n', '', '', 0, 40, 59),
(119, '2025-04-03', 'Dr-Apr\'25/050', '3600/001', '0', '30000000', '4780720', 'Paid to Tun Zaw Min for Vr.12636,12646,12652\r\n', '', '', 0, 35, 60),
(120, '2025-04-04', 'Dr-Apr\'25/051', '4000/G03', '2694600', '0', '3906600', 'Paid to Plastic (Golden Fish) for 29.3.25,1.4.25,2.4.25\r\n', '', '', 0, 40, 61),
(121, '2025-04-04', 'Dr-Apr\'25/051', '3600/001', '0', '2694600', '2086120', 'Paid to Plastic (Golden Fish) for 29.3.25,1.4.25,2.4.25\r\n', '', '', 0, 35, 62),
(122, '2025-04-04', 'Dr-Apr\'25/052', '9100/040', '277600', '0', '283600', 'DHL Charges for H Trader Documents sent to Bangladesh\r\n', '', '', 0, 39, 63),
(123, '2025-04-04', 'Dr-Apr\'25/052', '3600/001', '0', '277600', '1808520', 'DHL Charges for H Trader Documents sent to Bangladesh\r\n', '', '', 0, 35, 64),
(124, '2025-04-04', 'Dr-Apr\'25/053', '6100/005', '430000', '0', '430000', 'MC Box Carry Charges for Ocean Pacific to GFC 2Trucks\r\n', '', '', 0, 37, 65),
(125, '2025-04-04', 'Dr-Apr\'25/053', '3600/001', '0', '430000', '1378520', 'MC Box Carry Charges for Ocean Pacific to GFC 2Trucks\r\n', '', '', 0, 35, 66),
(126, '2025-04-04', 'Dr-Apr\'25/054', '9100/005', '27000', '0', '27000', 'Salt Purchase and Carry for Dry WP\r\n', '', '', 0, 39, 67),
(127, '2025-04-04', 'Dr-Apr\'25/054', '3600/001', '0', '27000', '1351520', 'Salt Purchase and Carry for Dry WP\r\n', '', '', 0, 35, 68),
(128, '2025-04-04', 'Dr-Apr\'25/055', '9100/005', '10000', '0', '37000', 'Guest List Charges \r\n', '', '', 0, 39, 69),
(129, '2025-04-04', 'Dr-Apr\'25/055', '3600/001', '0', '10000', '1341520', 'Guest List Charges \r\n', '', '', 0, 35, 70),
(130, '2025-04-04', 'Dr-Apr\'25/056', '9100/003', '11000', '0', '11000', 'Water 10pcs Purchase for W/H\r\n', '', '', 0, 39, 71),
(131, '2025-04-04', 'Dr-Apr\'25/056', '3600/001', '0', '11000', '1330520', 'Water 10pcs Purchase for W/H\r\n', '', '', 0, 35, 72),
(132, '2025-04-04', 'Dr-Apr\'25/057', '9100/002', '5000', '0', '88100', 'Taxi Charges for Ocean Pacific to W/H\r\n', '', '', 0, 39, 73),
(133, '2025-04-04', 'Dr-Apr\'25/057', '3600/001', '0', '5000', '1325520', 'Taxi Charges for Ocean Pacific to W/H\r\n', '', '', 0, 35, 74),
(134, '2025-04-04', 'Dr-Apr\'25/058', '9100/009', '500', '0', '500', 'Kpay Charges for MC Box Carry money transfer\r\n', '', '', 0, 39, 75),
(135, '2025-04-04', 'Dr-Apr\'25/058', '3600/001', '0', '500', '1325020', 'Kpay Charges for MC Box Carry money transfer\r\n', '', '', 0, 35, 76),
(136, '2025-04-04', 'Dr-Apr\'25/059', '9100/007', '112000', '0', '112000', 'Roller Rope Purchase for W/H PK Machine\r\n\r\n', '', '', 0, 39, 77),
(137, '2025-04-04', 'Dr-Apr\'25/059', '3600/001', '0', '112000', '1213020', 'Roller Rope Purchase for W/H PK Machine\r\n\r\n', '', '', 0, 35, 78),
(138, '2025-04-04', 'Dr-Apr\'25/060', '6100/006', '188800', '0', '188800', 'Photo Sticker,Ledger, Knife Purchase and Taxi for W/H\r\n', '', '', 0, 37, 79),
(139, '2025-04-04', 'Dr-Apr\'25/060', '3600/001', '0', '188800', '1024220', 'Photo Sticker,Ledger, Knife Purchase and Taxi for W/H\r\n', '', '', 0, 35, 80),
(140, '2025-04-04', 'Dr-Apr\'25/061', '9100/005', '42000', '0', '79000', 'Bamboo Purchase for Dry WP\r\n', '', '', 0, 39, 81),
(141, '2025-04-04', 'Dr-Apr\'25/061', '3600/001', '0', '42000', '982220', 'Bamboo Purchase for Dry WP\r\n', '', '', 0, 35, 82),
(142, '2025-04-04', 'Dr-Apr\'25/062', '9100/032', '7000', '0', '7000', 'Tissue 2pk Purchase for Office\r\n', '', '', 0, 39, 83),
(143, '2025-04-04', 'Dr-Apr\'25/062', '3600/001', '0', '7000', '975220', 'Tissue 2pk Purchase for Office\r\n', '', '', 0, 35, 84),
(144, '2025-04-04', 'Dr-Apr\'25/063', '9100/032', '3500', '0', '10500', 'Bucket 1pcs Purchase for Office\r\n', '', '', 0, 39, 85),
(145, '2025-04-04', 'Dr-Apr\'25/063', '3600/001', '0', '3500', '971720', 'Bucket 1pcs Purchase for Office\r\n', '', '', 0, 35, 86),
(146, '2025-04-04', 'Dr-Apr\'25/064', '9100/003', '11000', '0', '22000', 'Water 10pcs Purchase for W/H\r\n', '', '', 0, 39, 87),
(147, '2025-04-04', 'Dr-Apr\'25/064', '3600/001', '0', '11000', '960720', 'Water 10pcs Purchase for W/H\r\n', '', '', 0, 35, 88),
(148, '2025-04-04', 'Dr-Apr\'25/065', '9100/006', '50000', '0', '50000', 'Car Petrol for 3K-1574 5.4.25\r\n', '', '', 0, 39, 89),
(149, '2025-04-04', 'Dr-Apr\'25/065', '3600/001', '0', '50000', '910720', 'Car Petrol for 3K-1574 5.4.25\r\n', '', '', 0, 35, 90),
(150, '2025-04-04', 'Dr-Apr\'25/066', '6100/006', '2380500', '0', '2569300', 'Sticker (LMH) and Kpay Charges\r\n', '', '', 0, 37, 91),
(151, '2025-04-04', 'Dr-Apr\'25/066', '3600/001', '0', '2380500', '-1469780', 'Sticker (LMH) and Kpay Charges\r\n', '', '', 0, 35, 92),
(152, '2025-04-04', 'Dr-Apr\'25/067', '9100/014', '16000', '0', '-19000', 'Car Break Oil Purchase for 3K-1574\r\n', '', '', 0, 39, 93),
(153, '2025-04-04', 'Dr-Apr\'25/067', '3600/001', '0', '16000', '-1485780', 'Car Break Oil Purchase for 3K-1574\r\n', '', '', 0, 35, 94),
(154, '2025-04-04', 'Dr-Apr\'25/068', '9100/017', '50000', '0', '3160000', 'Sir Take from Daw Nan\r\n', '', '', 0, 39, 95),
(155, '2025-04-04', 'Dr-Apr\'25/068', '3600/001', '0', '50000', '-1535780', 'Sir Take from Daw Nan\r\n', '', '', 0, 35, 96),
(156, '2025-04-04', 'Dr-Apr\'25/069', '9100/006', '100000', '0', '150000', 'Car Petrol for 5L-2848\r\n', '', '', 0, 39, 97),
(157, '2025-04-04', 'Dr-Apr\'25/069', '3600/001', '0', '100000', '-1635780', 'Car Petrol for 5L-2848\r\n', '', '', 0, 35, 98),
(158, '2025-04-06', 'Dr-Apr\'25/070', '9100/027', '500000', '0', '500000', 'Stabilizar Repair and Service Charges Adv For W/H\r\n', '', '', 0, 39, 99),
(159, '2025-04-06', 'Dr-Apr\'25/070', '3600/001', '0', '500000', '-2135780', 'Stabilizar Repair and Service Charges Adv For W/H\r\n', '', '', 0, 35, 100),
(160, '2025-04-06', 'Dr-Apr\'25/071', '6100/007', '10000000', '0', '10000000', 'Paid to Ocean Pacific Cold Store Charges\r\n', '', '', 0, 37, 101),
(161, '2025-04-06', 'Dr-Apr\'25/071', '3600/001', '0', '10000000', '-12135780', 'Paid to Ocean Pacific Cold Store Charges\r\n', '', '', 0, 35, 102),
(162, '2025-04-06', 'Dr-Apr\'25/072', '6100/001', '196000', '0', '238000', 'Labour Charges For GFC R.P (5.4.25)11000*11pcs,15000*5pcs\r\n', '', '', 0, 37, 103),
(163, '2025-04-06', 'Dr-Apr\'25/072', '3600/001', '0', '196000', '-12331780', 'Labour Charges For GFC R.P (5.4.25)11000*11pcs,15000*5pcs\r\n', '', '', 0, 35, 104),
(164, '2025-04-06', 'Dr-Apr\'25/073', '9100/031', '242200', '0', '242200', 'Packing Machine 4 pcs Purchase For W/H\r\n', '', '', 0, 39, 105),
(165, '2025-04-06', 'Dr-Apr\'25/073', '3600/001', '0', '242200', '-12573980', 'Packing Machine 4 pcs Purchase For W/H\r\n', '', '', 0, 35, 106),
(166, '2025-04-06', 'Dr-Apr\'25/074', '9100/018', '50000', '0', '50000', 'Extention 2 pcs Purchase For W/H\r\n', '', '', 0, 39, 107),
(167, '2025-04-06', 'Dr-Apr\'25/074', '3600/001', '0', '50000', '-12623980', 'Extention 2 pcs Purchase For W/H\r\n', '', '', 0, 35, 108),
(168, '2025-04-06', 'Dr-Apr\'25/075', '9100/007', '20000', '0', '132000', 'Maintenance For Sir House (March 25)\r\n', '', '', 0, 39, 109),
(169, '2025-04-06', 'Dr-Apr\'25/075', '3600/001', '0', '20000', '-12643980', 'Maintenance For Sir House (March 25)\r\n', '', '', 0, 35, 110),
(170, '2025-04-06', 'Dr-Apr\'25/076', '9100/013', '5000', '0', '0', 'Water Bill For Sir House (Feb 25)\r\n', '', '', 0, 39, 111),
(171, '2025-04-06', 'Dr-Apr\'25/076', '3600/001', '0', '5000', '-12648980', 'Water Bill For Sir House (Feb 25)\r\n', '', '', 0, 35, 112),
(172, '2025-04-06', 'Dr-Apr\'25/077', '6100/001', '218000', '0', '456000', 'Labour Charges For GFC R.P (6.4.25)11000*13pcs,15000*5pcs\r\n', '', '', 0, 37, 113),
(173, '2025-04-06', 'Dr-Apr\'25/077', '3600/001', '0', '218000', '-12866980', 'Labour Charges For GFC R.P (6.4.25)11000*13pcs,15000*5pcs\r\n', '', '', 0, 35, 114),
(174, '2025-04-06', 'Dr-Apr\'25/078', '9100/012', '40000', '0', '40000', 'Workers 16 pcs Dinner For (5.4) W/H OT\r\n', '', '', 0, 39, 115),
(175, '2025-04-06', 'Dr-Apr\'25/078', '3600/001', '0', '40000', '-12906980', 'Workers 16 pcs Dinner For (5.4) W/H OT\r\n', '', '', 0, 35, 116),
(176, '2025-04-06', 'Dr-Apr\'25/079', '9100/006', '50000', '0', '200000', 'Car Petro For 3K-1574 (6.4.25)\r\n', '', '', 0, 39, 117),
(177, '2025-04-06', 'Dr-Apr\'25/079', '3600/001', '0', '50000', '-12956980', 'Car Petro For 3K-1574 (6.4.25)\r\n', '', '', 0, 35, 118),
(178, '2025-04-06', 'Dr-Apr\'25/080', '9100/002', '60000', '0', '148100', 'Taxi Charges For Market Boys (4.5.6)\r\n', '', '', 0, 39, 119),
(179, '2025-04-06', 'Dr-Apr\'25/080', '3600/001', '0', '60000', '-13016980', 'Taxi Charges For Market Boys (4.5.6)\r\n', '', '', 0, 35, 120),
(180, '2025-04-06', 'Dr-Apr\'25/081', '9100/012', '19500', '0', '59500', 'Meal Allowance For Market Boy (4.5.6)\r\n', '', '', 0, 39, 121),
(181, '2025-04-06', 'Dr-Apr\'25/081', '3600/001', '0', '19500', '-13036480', 'Meal Allowance For Market Boy (4.5.6)\r\n', '', '', 0, 35, 122),
(182, '2025-04-07', 'Dr-Apr\'25/082', '9100/020', '8700000', '0', '8700000', 'Agent Adv,2% and X Ray For USA 7,8\r\n', '', '', 0, 39, 123),
(183, '2025-04-07', 'Dr-Apr\'25/082', '3600/001', '0', '8700000', '-21736480', 'Agent Adv,2% and X Ray For USA 7,8\r\n', '', '', 0, 35, 124),
(184, '2025-04-07', 'Dr-Apr\'25/083', '9100/021', '300000', '0', '300000', 'DOF Charges For USA 7,8\r\n', '', '', 0, 39, 125),
(185, '2025-04-07', 'Dr-Apr\'25/083', '3600/001', '0', '300000', '-22036480', 'DOF Charges For USA 7,8\r\n', '', '', 0, 35, 126),
(186, '2025-04-07', 'Dr-Apr\'25/084', '9100/004', '3000', '0', '194500', 'Sir Phone Bill For 7.4.25\r\n', '', '', 0, 39, 127),
(187, '2025-04-07', 'Dr-Apr\'25/084', '3600/001', '0', '3000', '-22039480', 'Sir Phone Bill For 7.4.25\r\n', '', '', 0, 35, 128),
(188, '2025-04-07', 'Dr-Apr\'25/085', '9100/017', '20000', '0', '3180000', 'Sir Take From Lai Lai For Meeting Go\r\n', '', '', 0, 39, 129),
(189, '2025-04-07', 'Dr-Apr\'25/085', '3600/001', '0', '20000', '-22059480', 'Sir Take From Lai Lai For Meeting Go\r\n', '', '', 0, 35, 130),
(190, '2025-04-07', 'Dr-Apr\'25/086', '9100/002', '13000', '0', '161100', 'Taxi Charges For W/H to Ocean Pacific go \r\n', '', '', 0, 39, 131),
(191, '2025-04-07', 'Dr-Apr\'25/086', '3600/001', '0', '13000', '-22072480', 'Taxi Charges For W/H to Ocean Pacific go \r\n', '', '', 0, 35, 132),
(192, '2025-04-07', 'Dr-Apr\'25/087', '9100/002', '25000', '0', '186100', 'Taxi Charges For Labour From Hlaing Thar Yar For GFC\r\n', '', '', 0, 39, 133),
(193, '2025-04-07', 'Dr-Apr\'25/087', '3600/001', '0', '25000', '-22097480', 'Taxi Charges For Labour From Hlaing Thar Yar For GFC\r\n', '', '', 0, 35, 134),
(194, '2025-04-07', 'Dr-Apr\'25/088', '9100/002', '3000', '0', '189100', 'Taxi Charges For Bamboo Purchase go For W/H (Dry-WP)\r\n', '', '', 0, 39, 135),
(195, '2025-04-07', 'Dr-Apr\'25/088', '3600/001', '0', '3000', '-22100480', 'Taxi Charges For Bamboo Purchase go For W/H (Dry-WP)\r\n', '', '', 0, 35, 136),
(196, '2025-04-07', 'Dr-Apr\'25/089', '9100/002', '10000', '0', '199100', 'Taxi Charges For Battery Purchase For Hilsa Machine\r\n', '', '', 0, 39, 137),
(197, '2025-04-07', 'Dr-Apr\'25/089', '3600/001', '0', '10000', '-22110480', 'Taxi Charges For Battery Purchase For Hilsa Machine\r\n', '', '', 0, 35, 138),
(198, '2025-04-07', 'Dr-Apr\'25/090', '9100/005', '6000', '0', '85000', '3 Pin 1 pcs Purchase For W/H\r\n', '', '', 0, 39, 139),
(199, '2025-04-07', 'Dr-Apr\'25/090', '3600/001', '0', '6000', '-22116480', '3 Pin 1 pcs Purchase For W/H\r\n', '', '', 0, 35, 140),
(200, '2025-04-07', 'Dr-Apr\'25/091', '6100/006', '3439200', '0', '6008500', 'Paid to LMH-Sticker and K Pay Charges For W/H\r\n', '', '', 0, 37, 141),
(201, '2025-04-07', 'Dr-Apr\'25/091', '3600/001', '0', '3439200', '-25555680', 'Paid to LMH-Sticker and K Pay Charges For W/H\r\n', '', '', 0, 35, 142),
(202, '2025-04-07', 'Dr-Apr\'25/092', '9100/002', '48000', '0', '247100', 'Taxi Charges For W/H to Ocean Pacific go (6.4.25,7.4.25)\r\n', '', '', 0, 39, 143),
(203, '2025-04-07', 'Dr-Apr\'25/092', '3600/001', '0', '48000', '-25603680', 'Taxi Charges For W/H to Ocean Pacific go (6.4.25,7.4.25)\r\n', '', '', 0, 35, 144),
(204, '2025-04-07', 'Dr-Apr\'25/093', '9100/002', '7000', '0', '254100', 'Penan Bag Carry Charges For Ocean Pacific Pk\r\n', '', '', 0, 39, 145),
(205, '2025-04-07', 'Dr-Apr\'25/093', '3600/001', '0', '7000', '-25610680', 'Penan Bag Carry Charges For Ocean Pacific Pk\r\n', '', '', 0, 35, 146),
(206, '2025-04-07', 'Dr-Apr\'25/094', '6100/006', '623500', '0', '6632000', 'Paid to LMH-Sticker and Car Charges and K-Pay Charges For W/H\r\n', '', '', 0, 37, 147),
(207, '2025-04-07', 'Dr-Apr\'25/094', '3600/001', '0', '623500', '-26234180', 'Paid to LMH-Sticker and Car Charges and K-Pay Charges For W/H\r\n', '', '', 0, 35, 148),
(208, '2025-04-07', 'Dr-Apr\'25/095', '9100/005', '15000', '0', '100000', 'Battery 5 pcs Purchase For Hilsa Machine\r\n', '', '', 0, 39, 149),
(209, '2025-04-07', 'Dr-Apr\'25/095', '3600/001', '0', '15000', '-26249180', 'Battery 5 pcs Purchase For Hilsa Machine\r\n', '', '', 0, 35, 150),
(210, '2025-04-07', 'Dr-Apr\'25/096', '6100/001', '217000', '0', '673000', 'Labour Charges and Taxi Charges For GFC-RP \r\n', '', '', 0, 37, 151),
(211, '2025-04-07', 'Dr-Apr\'25/096', '3600/001', '0', '217000', '-26466180', 'Labour Charges and Taxi Charges For GFC-RP \r\n', '', '', 0, 35, 152),
(212, '2025-04-08', 'Cr-Apr\'25/009', '3600/001', '20000000', '0', '-6466180', 'Received Money From UAB MMK A/C\r\n', '', '', 0, 35, 153),
(213, '2025-04-08', 'Cr-Apr\'25/009', '3700/003', '0', '20000000', '-20000000', 'Received Money From UAB MMK A/C\r\n', '', '', 0, 35, 154),
(214, '2025-04-08', 'Dr-Apr\'25/103', '9100/020', '5000000', '0', '13700000', 'Paid to Agent Adv 2%, X Ray USA 7,8\r\n', '', '', 0, 39, 155),
(215, '2025-04-08', 'Dr-Apr\'25/103', '3600/001', '0', '5000000', '-11466180', 'Paid to Agent Adv 2%, X Ray USA 7,8\r\n', '', '', 0, 35, 156),
(216, '2025-04-08', 'Dr-Apr\'25/104', '9100/004', '3000', '0', '197500', 'Sir Phone Bill\r\n', '', '', 0, 39, 157),
(217, '2025-04-08', 'Dr-Apr\'25/104', '3600/001', '0', '3000', '-11469180', 'Sir Phone Bill\r\n', '', '', 0, 35, 158),
(218, '2025-04-08', 'Dr-Apr\'25/105', '4000/G01', '10000000', '0', '10339628', 'Paid to GFC Cold Store Charges\r\n', '', '', 0, 40, 159),
(219, '2025-04-08', 'Dr-Apr\'25/105', '3600/001', '0', '10000000', '-21469180', 'Paid to GFC Cold Store Charges\r\n', '', '', 0, 35, 160),
(220, '2025-04-08', 'Dr-Apr\'25/106', '9100/006', '100000', '0', '300000', 'Car Diesel For 3K-1574 (15.674 Liters*3190ks)(19.380 Liters*2580ks)\r\n', '', '', 0, 39, 161),
(221, '2025-04-08', 'Dr-Apr\'25/106', '3600/001', '0', '100000', '-21569180', 'Car Diesel For 3K-1574 (15.674 Liters*3190ks)(19.380 Liters*2580ks)\r\n', '', '', 0, 35, 162),
(222, '2025-04-08', 'Dr-Apr\'25/107', '9100/006', '100000', '0', '400000', 'Car Diesel For 5L-2848\r\n', '', '', 0, 39, 163),
(223, '2025-04-08', 'Dr-Apr\'25/107', '3600/001', '0', '100000', '-21669180', 'Car Diesel For 5L-2848\r\n', '', '', 0, 35, 164),
(224, '2025-04-08', 'Dr-Apr\'25/108', '9100/005', '8000', '0', '108000', 'Key 2 pcs*4000ks Purchase For Loading\r\n', '', '', 0, 39, 165),
(225, '2025-04-08', 'Dr-Apr\'25/108', '3600/001', '0', '8000', '-21677180', 'Key 2 pcs*4000ks Purchase For Loading\r\n', '', '', 0, 35, 166),
(226, '2025-04-08', 'Dr-Apr\'25/109', '9100/012', '3500', '0', '63000', 'Meal Allowance For U Aung Kyaw \r\n', '', '', 0, 39, 167),
(227, '2025-04-08', 'Dr-Apr\'25/109', '3600/001', '0', '3500', '-21680680', 'Meal Allowance For U Aung Kyaw \r\n', '', '', 0, 35, 168),
(228, '2025-04-08', 'Dr-Apr\'25/110', '9100/002', '24000', '0', '278100', 'Taxi Charges For Wai Pon La go 4000ks+Nyi Nyi W/H Comeback 20000ks\r\n', '', '', 0, 39, 169),
(229, '2025-04-08', 'Dr-Apr\'25/110', '3600/001', '0', '24000', '-21704680', 'Taxi Charges For Wai Pon La go 4000ks+Nyi Nyi W/H Comeback 20000ks\r\n', '', '', 0, 35, 170),
(230, '2025-04-08', 'Dr-Apr\'25/111', '9100/003', '16500', '0', '38500', 'Water Purchase For W/H 15pcs*1100ks\r\n', '', '', 0, 39, 171),
(231, '2025-04-08', 'Dr-Apr\'25/111', '3600/001', '0', '16500', '-21721180', 'Water Purchase For W/H 15pcs*1100ks\r\n', '', '', 0, 35, 172),
(232, '2025-04-08', 'Dr-Apr\'25/112', '6100/003', '693000', '0', '693000', 'Penam Bag 1000pcs*585ks and JCV 1pcs*108000ks Purchase For W/H\r\n', '', '', 0, 37, 173),
(233, '2025-04-08', 'Dr-Apr\'25/112', '3600/001', '0', '693000', '-22414180', 'Penam Bag 1000pcs*585ks and JCV 1pcs*108000ks Purchase For W/H\r\n', '', '', 0, 35, 174),
(234, '2025-04-08', 'Dr-Apr\'25/113', '9100/009', '1500', '0', '2000', 'K-Pay Charges For Penam Bag Money Sent\r\n', '', '', 0, 39, 175),
(235, '2025-04-08', 'Dr-Apr\'25/113', '3600/001', '0', '1500', '-22415680', 'K-Pay Charges For Penam Bag Money Sent\r\n', '', '', 0, 35, 176),
(236, '2025-04-08', 'Dr-Apr\'25/114', '9100/011', '7000', '0', '1132300', 'Donation For Daily 5000ks+ Dogs Rice 2000ks\r\n', '', '', 0, 39, 177),
(237, '2025-04-08', 'Dr-Apr\'25/114', '3600/001', '0', '7000', '-22422680', 'Donation For Daily 5000ks+ Dogs Rice 2000ks\r\n', '', '', 0, 35, 178),
(238, '2025-04-08', 'Dr-Apr\'25/115', '9100/005', '5000', '0', '113000', 'Guest List Charges For W/H\r\n', '', '', 0, 39, 179),
(239, '2025-04-08', 'Dr-Apr\'25/115', '3600/001', '0', '5000', '-22427680', 'Guest List Charges For W/H\r\n', '', '', 0, 35, 180),
(240, '2025-04-08', 'Dr-Apr\'25/116', '9100/017', '388605', '0', '3568605', 'Sir Melia Yangon Dinner \r\n', '', '', 0, 39, 181),
(241, '2025-04-08', 'Dr-Apr\'25/116', '3600/001', '0', '388605', '-22816285', 'Sir Melia Yangon Dinner \r\n', '', '', 0, 35, 182),
(242, '2025-04-09', 'Cr-Apr\'25/012', '3600/001', '109425540', '0', '86609255', 'Canada Money Received From May Yu ($25000)(3.4.25)($25000-$17)=$24983*4380ks\r\n', '', '', 0, 35, 183),
(243, '2025-04-09', 'Cr-Apr\'25/012', '3300/003', '0', '24983', '-49958', 'Canada Money Received From May Yu ($25000)(3.4.25)($25000-$17)=$24983*4380ks\r\n', '', '', 0, 35, 184),
(244, '2025-04-09', 'Dr-Apr\'25/123', '6100/007', '600000', '0', '10600000', 'Thuzar Adv take For MSL Cold Store Charges\r\n', '', '', 0, 37, 185),
(245, '2025-04-09', 'Dr-Apr\'25/123', '3600/001', '0', '600000', '86009255', 'Thuzar Adv take For MSL Cold Store Charges\r\n', '', '', 0, 35, 186),
(246, '2025-04-09', 'Dr-Apr\'25/124', '9100/006', '50000', '0', '450000', 'Car Petro For 3K-1574 (9.4.25) 15.674 Liters*3190ks\r\n', '', '', 0, 39, 187),
(247, '2025-04-09', 'Dr-Apr\'25/124', '3600/001', '0', '50000', '85959255', 'Car Petro For 3K-1574 (9.4.25) 15.674 Liters*3190ks\r\n', '', '', 0, 35, 188),
(248, '2025-04-09', 'Dr-Apr\'25/125', '9100/014', '12000', '0', '-7000', 'Car Police Catch For 3K-1574\r\n', '', '', 0, 39, 189),
(249, '2025-04-09', 'Dr-Apr\'25/125', '3600/001', '0', '12000', '85947255', 'Car Police Catch For 3K-1574\r\n', '', '', 0, 35, 190),
(250, '2025-04-09', 'Dr-Apr\'25/126', '9100/002', '32500', '0', '310600', 'Taxi Charges For Office People 5 pcs For Payment 6:00pm\r\n', '', '', 0, 39, 191),
(251, '2025-04-09', 'Dr-Apr\'25/126', '3600/001', '0', '32500', '85914755', 'Taxi Charges For Office People 5 pcs For Payment 6:00pm\r\n', '', '', 0, 35, 192),
(252, '2025-04-09', 'Dr-Apr\'25/127', '9100/012', '12500', '0', '75500', 'Meal Allowance For Office 5 pcs Payment 6:00pm\r\n', '', '', 0, 39, 193),
(253, '2025-04-09', 'Dr-Apr\'25/127', '3600/001', '0', '12500', '85902255', 'Meal Allowance For Office 5 pcs Payment 6:00pm\r\n', '', '', 0, 35, 194),
(254, '2025-04-09', 'Dr-Apr\'25/128', '4000/k05', '50000000', '0', '811601650', 'Paid to Kyaw Zay Ya For Vr no-12448,12466\r\n', '', '', 0, 40, 195),
(255, '2025-04-09', 'Dr-Apr\'25/128', '3600/001', '0', '50000000', '35902255', 'Paid to Kyaw Zay Ya For Vr no-12448,12466\r\n', '', '', 0, 35, 196),
(256, '2025-04-09', 'Dr-Apr\'25/129', '6100/007', '10000000', '0', '20600000', 'Paid to Ocean Pacific Cold Store Charges\r\n', '', '', 0, 37, 197),
(257, '2025-04-09', 'Dr-Apr\'25/129', '3600/001', '0', '10000000', '25902255', 'Paid to Ocean Pacific Cold Store Charges\r\n', '', '', 0, 35, 198),
(258, '2025-04-09', 'Dr-Apr\'25/130', '9100/027', '100000', '0', '600000', 'Paid to Lawer For USA 10 (2024)(2.4-50000)(9.4-50000)\r\n', '', '', 0, 39, 199),
(259, '2025-04-09', 'Dr-Apr\'25/130', '3600/001', '0', '100000', '25802255', 'Paid to Lawer For USA 10 (2024)(2.4-50000)(9.4-50000)\r\n', '', '', 0, 35, 200),
(260, '2025-04-10', 'Cr-Apr\'25/013', '3600/001', '54000000', '0', '79802255', 'LMG Loan Return From Link Mark For (23.3=4000000,9.4.=50000000)\r\n', '', '', 0, 35, 201),
(261, '2025-04-10', 'Cr-Apr\'25/013', '3400/006', '0', '54000000', '-54000000', 'LMG Loan Return From Link Mark For (23.3=4000000,9.4.=50000000)\r\n', '', '', 0, 35, 202),
(262, '2025-04-10', 'Cr-Apr\'25/014', '3600/001', '44000000', '0', '123802255', 'Cash With Draw From UAB MMK A/C,Chq no-221676\r\n', '', '', 0, 35, 203),
(263, '2025-04-10', 'Cr-Apr\'25/014', '3700/003', '0', '44000000', '-64000000', 'Cash With Draw From UAB MMK A/C,Chq no-221676\r\n', '', '', 0, 35, 204),
(264, '2025-04-10', 'Dr-Apr\'25/138', '4000/m04', '6000000', '0', '16765260', 'Paid to MMMO For Vr Date-27.2,20.3,25.3(2)\r\n', '', '', 0, 40, 205),
(265, '2025-04-10', 'Dr-Apr\'25/138', '3600/001', '0', '6000000', '117802255', 'Paid to MMMO For Vr Date-27.2,20.3,25.3(2)\r\n', '', '', 0, 35, 206),
(266, '2025-04-10', 'Dr-Apr\'25/139', '9100/002', '6000', '0', '316600', 'Taxi Charges For W/H to AYA to UAB to W/H\r\n', '', '', 0, 39, 207),
(267, '2025-04-10', 'Dr-Apr\'25/139', '3600/001', '0', '6000', '117796255', 'Taxi Charges For W/H to AYA to UAB to W/H\r\n', '', '', 0, 35, 208),
(268, '2025-04-10', 'Dr-Apr\'25/140', '9100/040', '80000', '0', '363600', 'Booking Cancellation charges For USA Container 2 pcs\r\n', '', '', 0, 39, 209),
(269, '2025-04-10', 'Dr-Apr\'25/140', '3600/001', '0', '80000', '117716255', 'Booking Cancellation charges For USA Container 2 pcs\r\n', '', '', 0, 35, 210),
(270, '2025-04-10', 'Dr-Apr\'25/141', '9100/041', '112000', '0', '403880', 'BL and Seal Charges For USA 5,6\r\n', '', '', 0, 39, 211),
(271, '2025-04-10', 'Dr-Apr\'25/141', '3600/001', '0', '112000', '117604255', 'BL and Seal Charges For USA 5,6\r\n', '', '', 0, 35, 212),
(272, '2025-04-10', 'Dr-Apr\'25/142', '4000/n01', '3000000', '0', '27621900', 'Paid to Nanda For Vr no-12922\r\n', '', '', 0, 40, 213),
(273, '2025-04-10', 'Dr-Apr\'25/142', '3600/001', '0', '3000000', '114604255', 'Paid to Nanda For Vr no-12922\r\n', '', '', 0, 35, 214),
(274, '2025-04-10', 'Dr-Apr\'25/143', '4000/t23', '2000000', '0', '12503000', 'Paid to Thin Zar For Vr-13091\r\n', '', '', 0, 40, 215),
(275, '2025-04-10', 'Dr-Apr\'25/143', '3600/001', '0', '2000000', '112604255', 'Paid to Thin Zar For Vr-13091\r\n', '', '', 0, 35, 216),
(276, '2025-04-10', 'Dr-Apr\'25/144', '4000/p03', '5000000', '0', '7220500', 'Paid to Pan Thazin For Vr Date-28.3,4.4,5.4\r\n', '', '', 0, 40, 217),
(277, '2025-04-10', 'Dr-Apr\'25/144', '3600/001', '0', '5000000', '107604255', 'Paid to Pan Thazin For Vr Date-28.3,4.4,5.4\r\n', '', '', 0, 35, 218),
(278, '2025-04-10', 'Dr-Apr\'25/145', '4000/G03', '756000', '0', '4662600', 'Paid to Golden Fish For Vr Date-6.4.25\r\n', '', '', 0, 40, 219),
(279, '2025-04-10', 'Dr-Apr\'25/145', '3600/001', '0', '756000', '106848255', 'Paid to Golden Fish For Vr Date-6.4.25\r\n', '', '', 0, 35, 220),
(280, '2025-04-10', 'Dr-Apr\'25/146', '4000/t19', '15000000', '0', '149583800', 'Paid to Tin Hlaing For Vr no-12597,12599\r\n', '', '', 0, 40, 221),
(281, '2025-04-10', 'Dr-Apr\'25/146', '3600/001', '0', '15000000', '91848255', 'Paid to Tin Hlaing For Vr no-12597,12599\r\n', '', '', 0, 35, 222),
(282, '2025-04-10', 'Dr-Apr\'25/147', '4000/A03', '15000000', '0', '336325350', 'Paid to Aung Naing Oo For Vr no-12837,12856,12861\r\n', '', '', 0, 40, 223),
(283, '2025-04-10', 'Dr-Apr\'25/147', '3600/001', '0', '15000000', '76848255', 'Paid to Aung Naing Oo For Vr no-12837,12856,12861\r\n', '', '', 0, 35, 224),
(284, '2025-04-10', 'Dr-Apr\'25/148', '4000/k07', '20000000', '0', '179611400', 'Paid to Khin Maung Myint For Vr no-12924\r\n', '', '', 0, 40, 225),
(285, '2025-04-10', 'Dr-Apr\'25/148', '3600/001', '0', '20000000', '56848255', 'Paid to Khin Maung Myint For Vr no-12924\r\n', '', '', 0, 35, 226),
(286, '2025-04-10', 'Dr-Apr\'25/149', '4000/n04', '8897900', '0', '-2357889', 'Paid to Nyan Tun For Vr no-13051,13054,13061,13063,13068\r\n', '', '', 0, 40, 227),
(287, '2025-04-10', 'Dr-Apr\'25/149', '3600/001', '0', '8897900', '47950355', 'Paid to Nyan Tun For Vr no-13051,13054,13061,13063,13068\r\n', '', '', 0, 35, 228),
(288, '2025-04-10', 'Dr-Apr\'25/150', '4000/p01', '5000000', '0', '34413150', 'Paid to Phone Naing For Vr no-12934,12986\r\n', '', '', 0, 40, 229),
(289, '2025-04-10', 'Dr-Apr\'25/150', '3600/001', '0', '5000000', '42950355', 'Paid to Phone Naing For Vr no-12934,12986\r\n', '', '', 0, 35, 230),
(290, '2025-04-10', 'Dr-Apr\'25/151', '4000/p04', '1510000', '0', '1510000', 'Paid to Promise For Vr Date-24.11,28.11,30.11\r\n', '', '', 0, 40, 231),
(291, '2025-04-10', 'Dr-Apr\'25/151', '3600/001', '0', '1510000', '41440355', 'Paid to Promise For Vr Date-24.11,28.11,30.11\r\n', '', '', 0, 35, 232),
(292, '2025-04-13', 'Dr-Apr\'25/152', '9100/020', '4875250', '0', '18575250', 'Paid to Agent Bal Money for HT No1 Can-3, USA-5,6\r\n\r\n', '', '', 0, 39, 233),
(293, '2025-04-13', 'Dr-Apr\'25/152', '3600/001', '0', '4875250', '36565105', 'Paid to Agent Bal Money for HT No1 Can-3, USA-5,6\r\n\r\n', '', '', 0, 35, 234),
(294, '2025-04-13', 'Dr-Apr\'25/153', '9100/002', '3000', '0', '319600', 'Taxi charhges for W/H to UAB go for Chq A/C Money Putting\r\n', '', '', 0, 39, 235),
(295, '2025-04-13', 'Dr-Apr\'25/153', '3600/001', '0', '3000', '36562105', 'Taxi charhges for W/H to UAB go for Chq A/C Money Putting\r\n', '', '', 0, 35, 236),
(296, '2025-04-13', 'Dr-Apr\'25/154', '9100/006', '100000', '0', '550000', 'Car petrol for 5L-2848 (32.154Liter*3110ks) 12.4\r\n', '', '', 0, 39, 237),
(297, '2025-04-13', 'Dr-Apr\'25/154', '3600/001', '0', '100000', '36462105', 'Car petrol for 5L-2848 (32.154Liter*3110ks) 12.4\r\n', '', '', 0, 35, 238),
(298, '2025-04-13', 'Dr-Apr\'25/155', '9100/011', '10000', '0', '1142300', 'Donation for Daily W/H (12.4)-5000 and (13.4)-5000\r\n', '', '', 0, 39, 239),
(299, '2025-04-13', 'Dr-Apr\'25/155', '3600/001', '0', '10000', '36452105', 'Donation for Daily W/H (12.4)-5000 and (13.4)-5000\r\n', '', '', 0, 35, 240),
(300, '2025-04-13', 'Dr-Apr\'25/156', '9100/010', '300000', '0', '300000', 'Sir paid to GFC for April Bonus \r\n', '', '', 0, 39, 241),
(301, '2025-04-13', 'Dr-Apr\'25/156', '3600/001', '0', '300000', '36152105', 'Sir paid to GFC for April Bonus \r\n', '', '', 0, 35, 242),
(302, '2025-04-13', 'Dr-Apr\'25/157', '9100/010', '200000', '0', '500000', 'Sir paid to Police for April Bonus\r\n', '', '', 0, 39, 243),
(303, '2025-04-13', 'Dr-Apr\'25/157', '3600/001', '0', '200000', '35952105', 'Sir paid to Police for April Bonus\r\n', '', '', 0, 35, 244),
(304, '2025-04-13', 'Dr-Apr\'25/158', '9100/011', '100000', '0', '1242300', 'Sir Donation paid to All worker (12.4)\r\n', '', '', 0, 39, 245),
(305, '2025-04-13', 'Dr-Apr\'25/158', '3600/001', '0', '100000', '35852105', 'Sir Donation paid to All worker (12.4)\r\n', '', '', 0, 35, 246),
(306, '2025-04-22', 'Dr-Apr\'25/159', '9100/006', '50000', '0', '600000', 'Car Diesel for 3K-1574 (18.47) 16.892Liter*2960ks\r\n', '', '', 0, 39, 247),
(307, '2025-04-22', 'Dr-Apr\'25/159', '3600/001', '0', '50000', '35802105', 'Car Diesel for 3K-1574 (18.47) 16.892Liter*2960ks\r\n', '', '', 0, 35, 248),
(308, '2025-04-22', 'Dr-Apr\'25/160', '9100/014', '15000', '0', '8000', 'Engion Oil purchase for 3K-1574\r\n', '', '', 0, 39, 249),
(309, '2025-04-22', 'Dr-Apr\'25/160', '3600/001', '0', '15000', '35787105', 'Engion Oil purchase for 3K-1574\r\n', '', '', 0, 35, 250),
(310, '2025-04-22', 'Dr-Apr\'25/161', '9100/014', '10000', '0', '18000', 'Battery Repair charges for 3K-1574\r\n', '', '', 0, 39, 251),
(311, '2025-04-22', 'Dr-Apr\'25/161', '3600/001', '0', '10000', '35777105', 'Battery Repair charges for 3K-1574\r\n', '', '', 0, 35, 252),
(312, '2025-04-22', 'Dr-Apr\'25/162', '9100/002', '6000', '0', '325600', 'Taxi charges for Battery repair go/back\r\n', '', '', 0, 39, 253),
(313, '2025-04-22', 'Dr-Apr\'25/162', '3600/001', '0', '6000', '35771105', 'Taxi charges for Battery repair go/back\r\n', '', '', 0, 35, 254),
(314, '2025-04-22', 'Dr-Apr\'25/163', '9100/045', '44000', '0', '44000', 'Cleaning Material purchase for EO\r\n', '', '', 0, 39, 255),
(315, '2025-04-22', 'Dr-Apr\'25/163', '3600/001', '0', '44000', '35727105', 'Cleaning Material purchase for EO\r\n', '', '', 0, 35, 256),
(316, '2025-04-22', 'Dr-Apr\'25/164', '9100/002', '4000', '0', '329600', 'Taxi charges for cleaning material purchase \r\n', '', '', 0, 39, 257),
(317, '2025-04-22', 'Dr-Apr\'25/164', '3600/001', '0', '4000', '35723105', 'Taxi charges for cleaning material purchase \r\n', '', '', 0, 35, 258),
(318, '2025-04-22', 'Dr-Apr\'25/165', '9100/002', '30000', '0', '359600', 'Taxi charges for Market\r\n', '', '', 0, 39, 259),
(319, '2025-04-22', 'Dr-Apr\'25/165', '3600/001', '0', '30000', '35693105', 'Taxi charges for Market\r\n', '', '', 0, 35, 260),
(320, '2025-04-22', 'Dr-Apr\'25/166', '9100/003', '11000', '0', '49500', 'Water purchase for EO+CC\r\n', '', '', 0, 39, 261),
(321, '2025-04-22', 'Dr-Apr\'25/166', '3600/001', '0', '11000', '35682105', 'Water purchase for EO+CC\r\n', '', '', 0, 35, 262),
(322, '2025-04-22', 'Dr-Apr\'25/167', '9100/011', '15000', '0', '1257300', 'Donation for Dogs (15,16)\r\n', '', '', 0, 39, 263),
(323, '2025-04-22', 'Dr-Apr\'25/167', '3600/001', '0', '15000', '35667105', 'Donation for Dogs (15,16)\r\n', '', '', 0, 35, 264),
(324, '2025-04-22', 'Dr-Apr\'25/168', '9100/003', '5500', '0', '55000', 'Water purchase for EO (13.4.25)\r\n', '', '', 0, 39, 265),
(325, '2025-04-22', 'Dr-Apr\'25/168', '3600/001', '0', '5500', '35661605', 'Water purchase for EO (13.4.25)\r\n', '', '', 0, 35, 266),
(326, '2025-04-22', 'Dr-Apr\'25/169', '6100/002', '30000', '0', '30000', 'Ice charges for Market (19.4.25)\r\n', '', '', 0, 37, 267),
(327, '2025-04-22', 'Dr-Apr\'25/169', '3600/001', '0', '30000', '35631605', 'Ice charges for Market (19.4.25)\r\n', '', '', 0, 35, 268),
(328, '2025-04-22', 'Dr-Apr\'25/170', '6100/001', '2000', '0', '675000', 'Labour charges for Market (19.4.25)\r\n', '', '', 0, 37, 269),
(329, '2025-04-22', 'Dr-Apr\'25/170', '3600/001', '0', '2000', '35629605', 'Labour charges for Market (19.4.25)\r\n', '', '', 0, 35, 270),
(330, '2025-04-22', 'Dr-Apr\'25/171', '6100/002', '262500', '0', '292500', 'Ice charge for Hilsa Cutpiece\r\n', '', '', 0, 37, 271),
(331, '2025-04-22', 'Dr-Apr\'25/171', '3600/001', '0', '262500', '35367105', 'Ice charge for Hilsa Cutpiece\r\n', '', '', 0, 35, 272),
(332, '2025-04-22', 'Dr-Apr\'25/172', '9100/011', '15000', '0', '1272300', 'Donation for Dogs purchase chicken for 2days(17,18)\r\n', '', '', 0, 39, 273),
(333, '2025-04-22', 'Dr-Apr\'25/172', '3600/001', '0', '15000', '35352105', 'Donation for Dogs purchase chicken for 2days(17,18)\r\n', '', '', 0, 35, 274),
(334, '2025-04-22', 'Dr-Apr\'25/173', '9100/003', '6600', '0', '61600', 'Water purchase for W/H 6pcs*1100ks\r\n', '', '', 0, 39, 275),
(335, '2025-04-22', 'Dr-Apr\'25/173', '3600/001', '0', '6600', '35345505', 'Water purchase for W/H 6pcs*1100ks\r\n', '', '', 0, 35, 276),
(336, '2025-04-22', 'Dr-Apr\'25/174', '9100/002', '30000', '0', '389600', 'Taxi charges for Market (19.4.25) \r\n', '', '', 0, 39, 277),
(337, '2025-04-22', 'Dr-Apr\'25/174', '3600/001', '0', '30000', '35315505', 'Taxi charges for Market (19.4.25) \r\n', '', '', 0, 35, 278),
(338, '2025-04-22', 'Dr-Apr\'25/175', '9100/002', '30000', '0', '419600', 'Taxi charges for Market (20.4.25)\r\n', '', '', 0, 39, 279),
(339, '2025-04-22', 'Dr-Apr\'25/175', '3600/001', '0', '30000', '35285505', 'Taxi charges for Market (20.4.25)\r\n', '', '', 0, 35, 280),
(340, '2025-04-22', 'Dr-Apr\'25/176', '9100/002', '8000', '0', '427600', 'Taxi charges for Battery Take ( Thandar 13 st, Wai Pon La)\r\n', '', '', 0, 39, 281),
(341, '2025-04-22', 'Dr-Apr\'25/176', '3600/001', '0', '8000', '35277505', 'Taxi charges for Battery Take ( Thandar 13 st, Wai Pon La)\r\n', '', '', 0, 35, 282),
(342, '2025-04-22', 'Dr-Apr\'25/177', '9100/006', '50000', '0', '650000', 'Car Diesel for 3K-1574 (21.4.25)16.892Liter*2960ks\r\n', '', '', 0, 39, 283),
(343, '2025-04-22', 'Dr-Apr\'25/177', '3600/001', '0', '50000', '35227505', 'Car Diesel for 3K-1574 (21.4.25)16.892Liter*2960ks\r\n', '', '', 0, 35, 284),
(344, '2025-04-22', 'Dr-Apr\'25/178', '9100/011', '14900', '0', '1287200', 'Donation for Dogs (19,20)\r\n', '', '', 0, 39, 285),
(345, '2025-04-22', 'Dr-Apr\'25/178', '3600/001', '0', '14900', '35212605', 'Donation for Dogs (19,20)\r\n', '', '', 0, 35, 286),
(346, '2025-04-22', 'Dr-Apr\'25/179', '9100/002', '6000', '0', '433600', 'Taxi charges for Kaymarti to W/H (Ice money take)20.4.25\r\n', '', '', 0, 39, 287),
(347, '2025-04-22', 'Dr-Apr\'25/179', '3600/001', '0', '6000', '35206605', 'Taxi charges for Kaymarti to W/H (Ice money take)20.4.25\r\n', '', '', 0, 35, 288),
(348, '2025-04-22', 'Dr-Apr\'25/180', '9100/045', '6000', '0', '50000', 'Purchase Soap for CC Cleaning\r\n', '', '', 0, 39, 289),
(349, '2025-04-22', 'Dr-Apr\'25/180', '3600/001', '0', '6000', '35200605', 'Purchase Soap for CC Cleaning\r\n', '', '', 0, 35, 290),
(350, '2025-04-22', 'Dr-Apr\'25/181', '9100/010', '23485240', '0', '23985240', 'All  people April \'25 Bonus\r\n', '', '', 0, 39, 291),
(351, '2025-04-22', 'Dr-Apr\'25/181', '3600/001', '0', '23485240', '11715365', 'All  people April \'25 Bonus\r\n', '', '', 0, 35, 292),
(352, '2025-04-22', 'Dr-Apr\'25/182', '9100/002', '34000', '0', '467600', 'Taxi charges for Market (16.4.25)\r\n\r\n', '', '', 0, 39, 293),
(353, '2025-04-22', 'Dr-Apr\'25/182', '3600/001', '0', '34000', '11681365', 'Taxi charges for Market (16.4.25)\r\n\r\n', '', '', 0, 35, 294),
(354, '2025-04-22', 'Dr-Apr\'25/183', '9100/012', '7000', '0', '82500', 'Meal Allowance for Market (16.4.25) Am 2pcs+Lunch 2pcs\r\n', '', '', 0, 39, 295),
(355, '2025-04-22', 'Dr-Apr\'25/183', '3600/001', '0', '7000', '11674365', 'Meal Allowance for Market (16.4.25) Am 2pcs+Lunch 2pcs\r\n', '', '', 0, 35, 296),
(356, '2025-04-23', 'Dr-Apr\'25/185', '3600/001', '20000000', '0', '31674365', 'Cash Withdraw  from LM UAB (MMK),Chq-221677\r\n', '', '', 0, 35, 297),
(357, '2025-04-23', 'Dr-Apr\'25/185', '3700/003', '0', '20000000', '-84000000', 'Cash Withdraw  from LM UAB (MMK),Chq-221677\r\n', '', '', 0, 35, 298),
(358, '2025-04-23', 'Dr-Apr\'25/186', '9100/002', '5000', '0', '472600', 'Taxi Charges for W/H to Sir House \r\n', '', '', 0, 39, 299),
(359, '2025-04-23', 'Dr-Apr\'25/186', '3600/001', '0', '5000', '31669365', 'Taxi Charges for W/H to Sir House \r\n', '', '', 0, 35, 300),
(360, '2025-04-23', 'Dr-Apr\'25/187', '9100/041', '112000', '0', '515880', 'BL & Seal charges for USA -07,08/2025 Ref=6414516650, 6414516370, 2*56000MMK (Pr-016)\r\n', '', '', 0, 39, 301),
(361, '2025-04-23', 'Dr-Apr\'25/187', '3600/001', '0', '112000', '31557365', 'BL & Seal charges for USA -07,08/2025 Ref=6414516650, 6414516370, 2*56000MMK (Pr-016)\r\n', '', '', 0, 35, 302),
(362, '2025-04-23', 'Dr-Apr\'25/188', '9100/002', '37000', '0', '509600', 'Taxi charges for House Air Way Bill\r\n', '', '', 0, 39, 303),
(363, '2025-04-23', 'Dr-Apr\'25/188', '3600/001', '0', '37000', '31520365', 'Taxi charges for House Air Way Bill\r\n', '', '', 0, 35, 304),
(364, '2025-04-23', 'Dr-Apr\'25/189', '9100/026', '702600', '0', '702600', 'House Air Way Renew KBZ charges and Bank charges (700000+2600)\r\n', '', '', 0, 39, 305),
(365, '2025-04-23', 'Dr-Apr\'25/189', '3600/001', '0', '702600', '30817765', 'House Air Way Renew KBZ charges and Bank charges (700000+2600)\r\n', '', '', 0, 35, 306),
(366, '2025-04-23', 'Dr-Apr\'25/190', '9100/016', '20000', '0', '20000', 'House Air Way Renew copy+file charges\r\n', '', '', 0, 39, 307),
(367, '2025-04-23', 'Dr-Apr\'25/190', '3600/001', '0', '20000', '30797765', 'House Air Way Renew copy+file charges\r\n', '', '', 0, 35, 308),
(368, '2025-04-23', 'Dr-Apr\'25/191', '9100/012', '2700', '0', '85200', 'Meal  Allowance for Office 2pcs\r\n', '', '', 0, 39, 309);
INSERT INTO `general_ledger` (`id`, `date`, `voucherno`, `ac_code`, `debit`, `credit`, `balance`, `narration`, `sr_no`, `container_no`, `bank_charges`, `acid`, `transactionid`) VALUES
(369, '2025-04-23', 'Dr-Apr\'25/191', '3600/001', '0', '2700', '30795065', 'Meal  Allowance for Office 2pcs\r\n', '', '', 0, 35, 310),
(370, '2025-04-23', 'Dr-Apr\'25/192', '9100/002', '5000', '0', '514600', 'Taxi charges for W/H to UAB Money Take\r\n', '', '', 0, 39, 311),
(371, '2025-04-23', 'Dr-Apr\'25/192', '3600/001', '0', '5000', '30790065', 'Taxi charges for W/H to UAB Money Take\r\n', '', '', 0, 35, 312),
(372, '2025-04-23', 'Dr-Apr\'25/193', '9100/006', '50000', '0', '700000', 'Car Diesel  for 3K-1574 (Pr-017)\r\n', '', '', 0, 39, 313),
(373, '2025-04-23', 'Dr-Apr\'25/193', '3600/001', '0', '50000', '30740065', 'Car Diesel  for 3K-1574 (Pr-017)\r\n', '', '', 0, 35, 314),
(374, '2025-04-23', 'Dr-Apr\'25/194', '9100/003', '16500', '0', '78100', 'Water purchase 15pcs*1100ks for (Eo+CC) Pr-017\r\n', '', '', 0, 39, 315),
(375, '2025-04-23', 'Dr-Apr\'25/194', '3600/001', '0', '16500', '30723565', 'Water purchase 15pcs*1100ks for (Eo+CC) Pr-017\r\n', '', '', 0, 35, 316),
(376, '2025-04-23', 'Dr-Apr\'25/195', '9100/012', '23500', '0', '108700', 'Purchase chicken and Fruit for Sir House (21500+2000) Pr-017\r\n', '', '', 0, 39, 317),
(377, '2025-04-23', 'Dr-Apr\'25/195', '3600/001', '0', '23500', '30700065', 'Purchase chicken and Fruit for Sir House (21500+2000) Pr-017\r\n', '', '', 0, 35, 318),
(378, '2025-04-23', 'Dr-Apr\'25/196', '9100/011', '18000', '0', '1305200', 'Donation for Dogs Chicken purchase (Pr-017)\r\n', '', '', 0, 39, 319),
(379, '2025-04-23', 'Dr-Apr\'25/196', '3600/001', '0', '18000', '30682065', 'Donation for Dogs Chicken purchase (Pr-017)\r\n', '', '', 0, 35, 320),
(380, '2025-04-23', 'Dr-Apr\'25/197', '9100/005', '10500', '0', '123500', 'Purchase Mosquito Spary for Sir House (Pr-017)\r\n', '', '', 0, 39, 321),
(381, '2025-04-23', 'Dr-Apr\'25/197', '3600/001', '0', '10500', '30671565', 'Purchase Mosquito Spary for Sir House (Pr-017)\r\n', '', '', 0, 35, 322),
(382, '2025-04-23', 'Dr-Apr\'25/198', '9100/002', '16500', '0', '531100', 'Taxi charges for HHK to CC (Pr-017)\r\n', '', '', 0, 39, 323),
(383, '2025-04-23', 'Dr-Apr\'25/198', '3600/001', '0', '16500', '30655065', 'Taxi charges for HHK to CC (Pr-017)\r\n', '', '', 0, 35, 324),
(384, '2025-04-24', 'Dr-Apr\'25/200', '9100/002', '33000', '0', '564100', 'Taxi Charges For In Bound Renew\r\n', '', '', 0, 39, 325),
(385, '2025-04-24', 'Dr-Apr\'25/200', '3600/001', '0', '33000', '30622065', 'Taxi Charges For In Bound Renew\r\n', '', '', 0, 35, 326),
(386, '2025-04-24', 'Dr-Apr\'25/201', '9100/029', '42000', '0', '42000', 'Undertaken Charges For InBound Received Paper People For 2 pcs (Inbound Tour License Renew)\r\n', '', '', 0, 39, 327),
(387, '2025-04-24', 'Dr-Apr\'25/201', '3600/001', '0', '42000', '30580065', 'Undertaken Charges For InBound Received Paper People For 2 pcs (Inbound Tour License Renew)\r\n', '', '', 0, 35, 328),
(388, '2025-04-24', 'Dr-Apr\'25/202', '9100/040', '225000', '0', '588600', 'Hilsa Micro Test For Chill (Aircargo)\r\n', '', '', 0, 39, 329),
(389, '2025-04-24', 'Dr-Apr\'25/202', '3600/001', '0', '225000', '30355065', 'Hilsa Micro Test For Chill (Aircargo)\r\n', '', '', 0, 35, 330),
(390, '2025-04-24', 'Dr-Apr\'25/203', '9100/006', '50000', '0', '750000', 'Car Diesel For 3K-1574 (24.4.25)(Pr-018)16.892 Liters*2960ks\r\n', '', '', 0, 39, 331),
(391, '2025-04-24', 'Dr-Apr\'25/203', '3600/001', '0', '50000', '30305065', 'Car Diesel For 3K-1574 (24.4.25)(Pr-018)16.892 Liters*2960ks\r\n', '', '', 0, 35, 332),
(392, '2025-04-24', 'Dr-Apr\'25/204', '9100/045', '40000', '0', '90000', 'Material Purchase For Cleaning For EO (Pr-018) (သံဂေါ်ပြား ၁ခု+သစ်သားရိုး ၁ခု)\r\n', '', '', 0, 39, 333),
(393, '2025-04-24', 'Dr-Apr\'25/204', '3600/001', '0', '40000', '30265065', 'Material Purchase For Cleaning For EO (Pr-018) (သံဂေါ်ပြား ၁ခု+သစ်သားရိုး ၁ခု)\r\n', '', '', 0, 35, 334),
(394, '2025-04-24', 'Dr-Apr\'25/205', '9100/005', '30000', '0', '153500', 'Northokkalapa Industry Zone Fees For W/H(Jan\'25 to March\'25) (Pr-018)\r\n', '', '', 0, 39, 335),
(395, '2025-04-24', 'Dr-Apr\'25/205', '3600/001', '0', '30000', '30235065', 'Northokkalapa Industry Zone Fees For W/H(Jan\'25 to March\'25) (Pr-018)\r\n', '', '', 0, 35, 336),
(396, '2025-04-24', 'Dr-Apr\'25/206', '9100/018', '65000', '0', '115000', 'Meter Bill For Sir March\'25 (Pr-018)\r\n', '', '', 0, 39, 337),
(397, '2025-04-24', 'Dr-Apr\'25/206', '3600/001', '0', '65000', '30170065', 'Meter Bill For Sir March\'25 (Pr-018)\r\n', '', '', 0, 35, 338),
(398, '2025-04-24', 'Dr-Apr\'25/207', '9100/018', '48500', '0', '163500', 'Meter Bill For EO March\'25 (Pr-018)\r\n', '', '', 0, 39, 339),
(399, '2025-04-24', 'Dr-Apr\'25/207', '3600/001', '0', '48500', '30121565', 'Meter Bill For EO March\'25 (Pr-018)\r\n', '', '', 0, 35, 340),
(400, '2025-04-24', 'Dr-Apr\'25/208', '9100/018', '316500', '0', '480000', 'Meter Bill For W/H March\'25 (Pr-018)\r\n', '', '', 0, 39, 341),
(401, '2025-04-24', 'Dr-Apr\'25/208', '3600/001', '0', '316500', '29805065', 'Meter Bill For W/H March\'25 (Pr-018)\r\n', '', '', 0, 35, 342),
(402, '2025-04-24', 'Dr-Apr\'25/209', '9100/005', '30000', '0', '183500', 'Northokkalapa Industry Zones Fees For EO (Jan\'25 to March\'25) (Pr-018)\r\n', '', '', 0, 39, 343),
(403, '2025-04-24', 'Dr-Apr\'25/209', '3600/001', '0', '30000', '29775065', 'Northokkalapa Industry Zones Fees For EO (Jan\'25 to March\'25) (Pr-018)\r\n', '', '', 0, 35, 344),
(404, '2025-04-24', 'Dr-Apr\'25/210', '9100/002', '6000', '0', '570100', 'Taxi Charges For Meter Bill + Zone Fees (Pr-018)\r\n', '', '', 0, 39, 345),
(405, '2025-04-24', 'Dr-Apr\'25/210', '3600/001', '0', '6000', '29769065', 'Taxi Charges For Meter Bill + Zone Fees (Pr-018)\r\n', '', '', 0, 35, 346),
(406, '2025-04-24', 'Dr-Apr\'25/211', '9100/014', '40000', '0', '58000', 'Police Catch For 5L-2848 (Pr-018) မီးပွိုင့် ကျော် ရဲဖမ်း \r\n', '', '', 0, 39, 347),
(407, '2025-04-24', 'Dr-Apr\'25/211', '3600/001', '0', '40000', '29729065', 'Police Catch For 5L-2848 (Pr-018) မီးပွိုင့် ကျော် ရဲဖမ်း \r\n', '', '', 0, 35, 348),
(408, '2025-04-24', 'Dr-Apr\'25/212', '9100/014', '30000', '0', '88000', 'Car Washing Charges For 5L-2848 (Pr-018) ကားရေဆေး+အမွှေးဆီ\r\n', '', '', 0, 39, 349),
(409, '2025-04-24', 'Dr-Apr\'25/212', '3600/001', '0', '30000', '29699065', 'Car Washing Charges For 5L-2848 (Pr-018) ကားရေဆေး+အမွှေးဆီ\r\n', '', '', 0, 35, 350),
(410, '2025-04-24', 'Dr-Apr\'25/213', '9100/025', '10000', '0', '10000', 'Car Parking Charges For Airport (Pr-018)\r\n', '', '', 0, 39, 351),
(411, '2025-04-24', 'Dr-Apr\'25/213', '3600/001', '0', '10000', '29689065', 'Car Parking Charges For Airport (Pr-018)\r\n', '', '', 0, 35, 352),
(412, '2025-04-24', 'Dr-Apr\'25/214', '9100/014', '3000', '0', '91000', 'Air Put Charges For 5L-2848 (Pr-018)\r\n', '', '', 0, 39, 353),
(413, '2025-04-24', 'Dr-Apr\'25/214', '3600/001', '0', '3000', '29686065', 'Air Put Charges For 5L-2848 (Pr-018)\r\n', '', '', 0, 35, 354),
(414, '2025-04-24', 'Dr-Apr\'25/215', '9100/006', '80000', '0', '830000', 'Car Diesel Charges For 5L-2848 (Pr-018) 23.4.2025 , 28.571 Liters*2800ks\r\n', '', '', 0, 39, 355),
(415, '2025-04-24', 'Dr-Apr\'25/215', '3600/001', '0', '80000', '29606065', 'Car Diesel Charges For 5L-2848 (Pr-018) 23.4.2025 , 28.571 Liters*2800ks\r\n', '', '', 0, 35, 356),
(416, '2025-04-24', 'Dr-Apr\'25/216', '9100/006', '45000', '0', '875000', 'Car Diesel For 5L-2848 (Pr-018) 22.4.2025 , 16.071 Liters*2800ks\r\n', '', '', 0, 39, 357),
(417, '2025-04-24', 'Dr-Apr\'25/216', '3600/001', '0', '45000', '29561065', 'Car Diesel For 5L-2848 (Pr-018) 22.4.2025 , 16.071 Liters*2800ks\r\n', '', '', 0, 35, 358),
(418, '2025-04-24', 'Dr-Apr\'25/217', '9100/014', '15000', '0', '106000', 'Car Police Catch For 3K-1574 (Pr-018) လေဆိပ်အကျော်ရဲဖမ်း \r\n', '', '', 0, 39, 359),
(419, '2025-04-24', 'Dr-Apr\'25/217', '3600/001', '0', '15000', '29546065', 'Car Police Catch For 3K-1574 (Pr-018) လေဆိပ်အကျော်ရဲဖမ်း \r\n', '', '', 0, 35, 360),
(420, '2025-04-24', 'Dr-Apr\'25/218', '9100/025', '2000', '0', '12000', 'Car Parking Charges For 3K-1574 (Pr-018)\r\n', '', '', 0, 39, 361),
(421, '2025-04-24', 'Dr-Apr\'25/218', '3600/001', '0', '2000', '29544065', 'Car Parking Charges For 3K-1574 (Pr-018)\r\n', '', '', 0, 35, 362),
(422, '2025-04-24', 'Dr-Apr\'25/219', '6100/003', '38000', '0', '731000', 'Plastic Rope 3 pcs Purchase For W/H (Pr-018)\r\n', '', '', 0, 37, 363),
(423, '2025-04-24', 'Dr-Apr\'25/219', '3600/001', '0', '38000', '29506065', 'Plastic Rope 3 pcs Purchase For W/H (Pr-018)\r\n', '', '', 0, 35, 364),
(424, '2025-04-24', 'Dr-Apr\'25/220', '6100/003', '58600', '0', '789600', 'Salt,Knife and Big Knife Purchase For WP (Pr-018)\r\n', '', '', 0, 37, 365),
(425, '2025-04-24', 'Dr-Apr\'25/220', '3600/001', '0', '58600', '29447465', 'Salt,Knife and Big Knife Purchase For WP (Pr-018)\r\n', '', '', 0, 35, 366),
(426, '2025-04-24', 'Dr-Apr\'25/221', '9100/002', '8000', '0', '578100', 'Taxi Charges For Knife Purchase (Pr-018)\r\n', '', '', 0, 39, 367),
(427, '2025-04-24', 'Dr-Apr\'25/221', '3600/001', '0', '8000', '29439465', 'Taxi Charges For Knife Purchase (Pr-018)\r\n', '', '', 0, 35, 368),
(428, '2025-04-24', 'Dr-Apr\'25/222', '9100/005', '2000', '0', '185500', 'Guest List Charges For W/H (Pr-018)\r\n', '', '', 0, 39, 369),
(429, '2025-04-24', 'Dr-Apr\'25/222', '3600/001', '0', '2000', '29437465', 'Guest List Charges For W/H (Pr-018)\r\n', '', '', 0, 35, 370),
(430, '2025-04-24', 'Dr-Apr\'25/223', '9100/012', '3000', '0', '111700', 'Meal Allowance For U Aung Kyaw (Pr-018)\r\n', '', '', 0, 39, 371),
(431, '2025-04-24', 'Dr-Apr\'25/223', '3600/001', '0', '3000', '29434465', 'Meal Allowance For U Aung Kyaw (Pr-018)\r\n', '', '', 0, 35, 372),
(432, '2025-04-24', 'Dr-Apr\'25/224', '3400/006', '10000000', '0', '-44000000', 'Link Mark Global Take From Link Mark Office for Loan\r\n', '', '', 0, 35, 373),
(433, '2025-04-24', 'Dr-Apr\'25/224', '3600/001', '0', '10000000', '19434465', 'Link Mark Global Take From Link Mark Office for Loan\r\n', '', '', 0, 35, 374),
(434, '2025-04-01', 'Dr-Apr\'25/011', '4000/A03', '20000000', '0', '356325350', 'Paid to ANO for Vr.12816,12820,12821,12831,12837 (Ch No.206424)\r\n\r\n', '', '', 0, 40, 375),
(435, '2025-04-01', 'Dr-Apr\'25/011', '3700/003', '0', '20000000', '-104000000', 'Paid to ANO for Vr.12816,12820,12821,12831,12837 (Ch No.206424)\r\n', '', '', 0, 35, 376),
(436, '2025-04-01', 'Dr-Apr\'25/012', '4000/A19', '7000000', '0', '66930600', 'Paid to Aye Aye Maw for Vr.12911 (Ch No.206425)\r\n', '', '', 0, 40, 377),
(437, '2025-04-01', 'Dr-Apr\'25/012', '3700/003', '0', '7000000', '-111000000', 'Paid to Aye Aye Maw for Vr.12911 (Ch No.206425)\r\n', '', '', 0, 35, 378),
(438, '2025-04-01', 'Dr-Apr\'25/013', '4000/k16', '5000000', '0', '22310400', ' Paid to Kyaw Min Latt for Vr.12869,12877 (Ch No.221601) \r\n', '', '', 0, 40, 379),
(439, '2025-04-01', 'Dr-Apr\'25/013', '3700/003', '0', '5000000', '-116000000', ' Paid to Kyaw Min Latt for Vr.12869,12877 (Ch No.221601) \r\n', '', '', 0, 35, 380),
(440, '2025-04-01', 'Dr-Apr\'25/014', '4000/t07', '10000000', '0', '20000000', 'Paid to Thaung Tun for Vr.12896,12902,12929,13042 (Ch No.221604)\r\n', '', '', 0, 40, 381),
(441, '2025-04-01', 'Dr-Apr\'25/014', '3700/003', '0', '10000000', '-126000000', 'Paid to Thaung Tun for Vr.12896,12902,12929,13042 (Ch No.221604)\r\n', '', '', 0, 35, 382),
(442, '2025-04-01', 'Dr-Apr\'25/015', '4000/S06', '20000000', '0', '445863820', 'Paid to Soe Thein for Vr.12596 (Ch No.221605)\r\n', '', '', 0, 40, 383),
(443, '2025-04-01', 'Dr-Apr\'25/015', '3700/003', '0', '20000000', '-146000000', 'Paid to Soe Thein for Vr.12596 (Ch No.221605)\r\n', '', '', 0, 35, 384),
(444, '2025-04-01', 'Dr-Apr\'25/016', '4000/k05', '30000000', '0', '841601650', 'Paid to Kyaw Zay Ya for Vr. (Ch No.221606)\r\n', '', '', 0, 40, 385),
(445, '2025-04-01', 'Dr-Apr\'25/016', '3700/003', '0', '30000000', '-176000000', 'Paid to Kyaw Zay Ya for Vr. (Ch No.221606)\r\n', '', '', 0, 35, 386),
(446, '2025-04-01', 'Dr-Apr\'25/017', '4000/A01', '10000000', '0', '9227911', 'Paid to AK for Vr.12785 (Ch No.221607)\r\n', '', '', 0, 40, 387),
(447, '2025-04-01', 'Dr-Apr\'25/017', '3700/003', '0', '10000000', '-186000000', 'Paid to AK for Vr.12785 (Ch No.221607)\r\n', '', '', 0, 35, 388),
(448, '2025-04-01', 'Dr-Apr\'25/018', '4000/t11', '25000000', '0', '38829511', 'Paid to Tun Zaw Min for Vr.12623,12636 (Ch No.221608)\r\n', '', '', 0, 40, 389),
(449, '2025-04-01', 'Dr-Apr\'25/018', '3700/003', '0', '25000000', '-211000000', 'Paid to Tun Zaw Min for Vr.12623,12636 (Ch No.221608)\r\n', '', '', 0, 35, 390),
(450, '2025-04-01', 'Dr-Apr\'25/019', '4000/C03', '5000000', '0', '60497325', 'Paid to Chit Ko for Vr.12905 (Ch No.221613)\r\n', '', '', 0, 40, 391),
(451, '2025-04-01', 'Dr-Apr\'25/019', '3700/003', '0', '5000000', '-216000000', 'Paid to Chit Ko for Vr.12905 (Ch No.221613)\r\n', '', '', 0, 35, 392),
(452, '2025-04-01', 'Dr-Apr\'25/020', '4000/N04', '6000000', '0', '3642111', 'Paid to Nyan Tun for Vr.13048,13051 (Ch No.221614)\r\n', '', '', 0, 40, 393),
(453, '2025-04-01', 'Dr-Apr\'25/020', '3700/003', '0', '6000000', '-222000000', 'Paid to Nyan Tun for Vr.13048,13051 (Ch No.221614)\r\n', '', '', 0, 35, 394),
(454, '2025-04-01', 'Dr-Apr\'25/021', '4000/001', '5000000', '0', '52389150', 'Paid to 4 Zaw for Vr.12913 (Ch No.221615)\r\n', '', '', 0, 40, 395),
(455, '2025-04-01', 'Dr-Apr\'25/021', '3700/003', '0', '5000000', '-227000000', 'Paid to 4 Zaw for Vr.12913 (Ch No.221615)\r\n', '', '', 0, 35, 396),
(456, '2025-04-01', 'Dr-Apr\'25/022', '4000/t02', '10000000', '0', '791011', 'Paid to Thein Htay for Vr.13023,13028 (Ch No.221609)\r\n', '', '', 0, 40, 397),
(457, '2025-04-01', 'Dr-Apr\'25/022', '3700/003', '0', '10000000', '-237000000', 'Paid to Thein Htay for Vr.13023,13028 (Ch No.221609)\r\n', '', '', 0, 35, 398),
(458, '2025-04-01', 'Dr-Apr\'25/023', '4000/t03', '7000000', '0', '57724525', 'Paid to Thin Thin Yee for Vr.12789\r\n', '', '', 0, 40, 399),
(459, '2025-04-01', 'Dr-Apr\'25/023', '3700/003', '0', '7000000', '-244000000', 'Paid to Thin Thin Yee for Vr.12789\r\n', '', '', 0, 35, 400),
(460, '2025-04-01', 'Dr-Apr\'25/024', '4000/S01', '7000000', '0', '86008150', 'Paid to Shwe Late for Vr.12730 (Ch No.221611)\r\n', '', '', 0, 40, 401),
(461, '2025-04-01', 'Dr-Apr\'25/024', '3700/003', '0', '7000000', '-251000000', 'Paid to Shwe Late for Vr.12730 (Ch No.221611)\r\n', '', '', 0, 35, 402),
(462, '2025-04-01', 'Dr-Apr\'25/025', '4000/t01', '7000000', '0', '47990550', 'Paid to Thet Paing for Vr.12910,12937 (Ch No.221612)\r\n', '', '', 0, 40, 403),
(463, '2025-04-01', 'Dr-Apr\'25/025', '3700/003', '0', '7000000', '-258000000', 'Paid to Thet Paing for Vr.12910,12937 (Ch No.221612)\r\n', '', '', 0, 35, 404),
(464, '2025-04-01', 'Dr-Apr\'25/026', '4000/s04', '7000000', '0', '170162650', 'Paid to Si Thu for Vr.12622,12669 (Ch No.221616)\r\n', '', '', 0, 40, 405),
(465, '2025-04-01', 'Dr-Apr\'25/026', '3700/003', '0', '7000000', '-265000000', 'Paid to Si Thu for Vr.12622,12669 (Ch No.221616)\r\n', '', '', 0, 35, 406),
(466, '2025-04-01', 'Dr-Apr\'25/027', '4000/y01', '5000000', '0', '48628000', 'Paid to Ye Yint for Vr.12517,12568 (Ch No.221617)\r\n', '', '', 0, 40, 407),
(467, '2025-04-01', 'Dr-Apr\'25/027', '3700/003', '0', '5000000', '-270000000', 'Paid to Ye Yint for Vr.12517,12568 (Ch No.221617)\r\n', '', '', 0, 35, 408),
(468, '2025-04-01', 'Dr-Apr\'25/028', '4000/S06', '10000000', '0', '455863820', 'Paid to Soe Thein for Vr.12596 (Ch No.221618)\r\n', '', '', 0, 40, 409),
(469, '2025-04-01', 'Dr-Apr\'25/028', '3700/003', '0', '10000000', '-280000000', 'Paid to Soe Thein for Vr.12596 (Ch No.221618)\r\n', '', '', 0, 35, 410),
(470, '2025-04-01', 'Dr-Apr\'25/029', '4000/A07', '6000000', '0', '45229800', 'Paid to A Thay Lay for Vr.13069 (Ch no.221620)\r\n', '', '', 0, 40, 411),
(471, '2025-04-01', 'Dr-Apr\'25/029', '3700/003', '0', '6000000', '-286000000', 'Paid to A Thay Lay for Vr.13069 (Ch no.221620)\r\n', '', '', 0, 35, 412),
(472, '2025-04-01', 'Dr-Apr\'25/030', '4000/W01', '5000000', '0', '26698175', 'Paid to Win Bo for Vr.12700 (Ch No.221621)\r\n', '', '', 0, 40, 413),
(473, '2025-04-01', 'Dr-Apr\'25/030', '3700/003', '0', '5000000', '-291000000', 'Paid to Win Bo for Vr.12700 (Ch No.221621)\r\n', '', '', 0, 35, 414),
(474, '2025-04-01', 'Dr-Apr\'25/031', '4000/t19', '15000000', '0', '164583800', 'Paid to Tin Hlaing for Vr.12597 (Ch No.221622)\r\n', '', '', 0, 40, 415),
(475, '2025-04-01', 'Dr-Apr\'25/031', '3700/003', '0', '15000000', '-306000000', 'Paid to Tin Hlaing for Vr.12597 (Ch No.221622)\r\n', '', '', 0, 35, 416),
(476, '2025-04-01', 'Dr-Apr\'25/032', '4000/n01', '5000000', '0', '32621900', 'Paid to Nanda for Vr.12922 (Ch No.221623)\r\n', '', '', 0, 40, 417),
(477, '2025-04-01', 'Dr-Apr\'25/032', '3700/003', '0', '5000000', '-311000000', 'Paid to Nanda for Vr.12922 (Ch No.221623)\r\n', '', '', 0, 35, 418),
(478, '2025-04-01', 'Dr-Apr\'25/033', '4000/p05', '10000000', '0', '105525700', 'Paid to Phoe Zaw for Vr.12800,12807,12823 (Ch No.221624)\r\n', '', '', 0, 40, 419),
(479, '2025-04-01', 'Dr-Apr\'25/033', '3700/003', '0', '10000000', '-321000000', 'Paid to Phoe Zaw for Vr.12800,12807,12823 (Ch No.221624)\r\n', '', '', 0, 35, 420),
(480, '2025-04-01', 'Dr-Apr\'25/034', '4000/A06', '7000000', '0', '92468550', 'Paid to Aung Zaw Oo for Vr.12867,12891 (Ch No.221625)\r\n', '', '', 0, 40, 421),
(481, '2025-04-01', 'Dr-Apr\'25/034', '3700/003', '0', '7000000', '-328000000', 'Paid to Aung Zaw Oo for Vr.12867,12891 (Ch No.221625)\r\n', '', '', 0, 35, 422),
(482, '2025-04-01', 'Dr-Apr\'25/035', '4000/t05', '20000000', '0', '262942798', 'Paid to Thet Oo for Vr.12627,12633,12702 (Ch No.221651)\r\n', '', '', 0, 40, 423),
(483, '2025-04-01', 'Dr-Apr\'25/035', '3700/003', '0', '20000000', '-348000000', 'Paid to Thet Oo for Vr.12627,12633,12702 (Ch No.221651)\r\n', '', '', 0, 35, 424),
(484, '2025-04-07', 'Cr-Apr\'25/006', '3700/003', '26296042.5', '0', '-321703957.5', 'USA Money Selling from USD A/C $49945*25% $12486.25 * 2106ks\r\n', '', '', 0, 35, 425),
(485, '2025-04-07', 'Cr-Apr\'25/006', '3700/002', '0', '12486.25', '-12486.25', 'USA Money Selling from USD A/C $49945*25% $12486.25 * 2106ks\r\n', '', '', 0, 35, 426),
(486, '2025-04-01', 'Dr-Apr\'25/011', '4000/A03', '20000000', '0', '376325350', 'Paid to ANO for Vr.12816,12820,12821,12831,12837 (Ch No.206424)\r\n', '', '', 0, 40, 429),
(487, '2025-04-01', 'Dr-Apr\'25/011', '3700/003', '0', '20000000', '-341703957.5', 'Paid to ANO for Vr.12816,12820,12821,12831,12837 (Ch No.206424)\r\n', '', '', 0, 35, 430),
(488, '2025-04-07', 'Cr-Apr\'25/006', '3700/003', '134778051.25', '0', '-206925906.25', 'USA Money Selling from USD A/C $49945*75% $37448.75 * 4418ks (37448.75*3599ks)LM and 37448.75*819ks Nan\r\n', '', '', 0, 35, 431),
(489, '2025-04-07', 'Cr-Apr\'25/006', '3600/003', '0', '134778051.25', '-134778051.25', 'USA Money Selling from USD A/C $49945*75% $37448.75 * 4418ks (37448.75*3599ks)LM and 37448.75*819ks Nan\r\n', '', '', 0, 35, 432),
(490, '2025-04-08', 'Dr-Apr\'25/099', '4000/S03', '25000000', '0', '1218011', 'Paid to Soe Min For Vr no-12610,12680,Chq no-221655\r\n', '', '', 0, 40, 433),
(491, '2025-04-08', 'Dr-Apr\'25/099', '3700/003', '0', '25000000', '-231925906.25', 'Paid to Soe Min For Vr no-12610,12680,Chq no-221655\r\n', '', '', 0, 35, 434),
(492, '2025-04-08', 'Dr-Apr\'25/100', '4000/A19', '6000000', '0', '72930600', 'Paid to Aye Aye Maw For Vr no-12911,Chq no-221653\r\n', '', '', 0, 40, 435),
(493, '2025-04-08', 'Dr-Apr\'25/100', '3700/003', '0', '6000000', '-237925906.25', 'Paid to Aye Aye Maw For Vr no-12911,Chq no-221653\r\n', '', '', 0, 35, 436),
(494, '2025-04-08', 'Dr-Apr\'25/101', '4000/k16', '6000000', '0', '28310400', 'Paid to Kyaw Min Latt For Vr no-12877,12881,Chq no-221654\r\n', '', '', 0, 40, 437),
(495, '2025-04-08', 'Dr-Apr\'25/101', '3700/003', '0', '6000000', '-243925906.25', 'Paid to Kyaw Min Latt For Vr no-12877,12881,Chq no-221654\r\n', '', '', 0, 35, 438),
(496, '2025-04-08', 'Dr-Apr\'25/102', '4000/S06', '30000000', '0', '485863820', 'Paid to Soe Thein For Vr no-12596,12605,Chq no-221656\r\n', '', '', 0, 40, 439),
(497, '2025-04-08', 'Dr-Apr\'25/102', '3700/003', '0', '30000000', '-273925906.25', 'Paid to Soe Thein For Vr no-12596,12605,Chq no-221656\r\n', '', '', 0, 35, 440),
(498, '2025-04-09', 'Cr-Apr\'25/010', '3700/003', '30000000', '0', '-243925906.25', 'Daw Nan (UAB) Transfer to UAB MMK A/C\r\n', '', '', 0, 35, 441),
(499, '2025-04-09', 'Cr-Apr\'25/010', '3700/006', '0', '30000000', '-30000000', 'Daw Nan (UAB) Transfer to UAB MMK A/C\r\n', '', '', 0, 35, 442),
(500, '2025-04-09', 'Cr-Apr\'25/011', '3700/003', '174182000', '0', '-69743906.25', 'Mr Sarmad NNS (TD) to UAB MMK A/C $40000-$50=$39950*4360ks\r\n', '', '', 0, 35, 443),
(501, '2025-04-09', 'Cr-Apr\'25/011', '3700/001', '0', '39950', '-39950', 'Mr Sarmad NNS (TD) to UAB MMK A/C $40000-$50=$39950*4360ks\r\n', '', '', 0, 35, 444),
(502, '2025-04-09', 'Dr-Apr\'25/120', '9100/009', '800', '0', '2800', 'Bank Statement Charges For UAB MMK A/C (2.4.25)\r\n', '', '', 0, 39, 445),
(503, '2025-04-09', 'Dr-Apr\'25/120', '3700/003', '0', '800', '-69744706.25', 'Bank Statement Charges For UAB MMK A/C (2.4.25)\r\n', '', '', 0, 35, 446),
(504, '2025-04-09', 'Dr-Apr\'25/121', '9100/009', '1600', '0', '4400', 'Bank Statement Charges For UAB MMK A/C (4.4.25)\r\n', '', '', 0, 39, 447),
(505, '2025-04-09', 'Dr-Apr\'25/121', '3700/003', '0', '1600', '-69746306.25', 'Bank Statement Charges For UAB MMK A/C (4.4.25)\r\n', '', '', 0, 35, 448),
(506, '2025-04-09', 'Dr-Apr\'25/122', '3400/006', '50000000', '0', '6000000', 'Paid to LMG Loan,Chq no-221660\r\n', '', '', 0, 35, 449),
(507, '2025-04-09', 'Dr-Apr\'25/122', '3700/003', '0', '50000000', '-119746306.25', 'Paid to LMG Loan,Chq no-221660\r\n', '', '', 0, 35, 450),
(508, '2025-04-09', 'Dr-Apr\'25/130', '4000/A01', '10000000', '0', '19227911', 'Paid to A.K For Vr no-12785,12805,12813,12824,Chq no-221657\r\n', '', '', 0, 40, 451),
(509, '2025-04-09', 'Dr-Apr\'25/130', '3700/003', '0', '10000000', '-129746306.25', 'Paid to A.K For Vr no-12785,12805,12813,12824,Chq no-221657\r\n', '', '', 0, 35, 452),
(510, '2025-04-09', 'Dr-Apr\'25/131', '4000/t02', '10000000', '0', '10791011', 'Paid to Thein Htay For Vr no-13028,13033,Chq no-221658\r\n', '', '', 0, 40, 453),
(511, '2025-04-09', 'Dr-Apr\'25/131', '3700/003', '0', '10000000', '-139746306.25', 'Paid to Thein Htay For Vr no-13028,13033,Chq no-221658\r\n', '', '', 0, 35, 454),
(512, '2025-04-09', 'Dr-Apr\'25/132', '4000/P05', '10000000', '0', '115525700', 'Paid to Phoe Zaw For Vr no- 12823,Chq no-221659\r\n', '', '', 0, 40, 455),
(513, '2025-04-09', 'Dr-Apr\'25/132', '3700/003', '0', '10000000', '-149746306.25', 'Paid to Phoe Zaw For Vr no- 12823,Chq no-221659\r\n', '', '', 0, 35, 456),
(514, '2025-04-09', 'Dr-Apr\'25/133', '4000/a07', '5000000', '0', '50229800', 'Paid to A Thay Lay For Vr no-13069,Chq no-221661\r\n', '', '', 0, 40, 457),
(515, '2025-04-09', 'Dr-Apr\'25/133', '3700/003', '0', '5000000', '-154746306.25', 'Paid to A Thay Lay For Vr no-13069,Chq no-221661\r\n', '', '', 0, 35, 458),
(516, '2025-04-09', 'Dr-Apr\'25/134', '4000/h03', '10000000', '0', '20521788', 'Paid to HHK Cold Store Charges,Chq no-221662\r\n', '', '', 0, 40, 459),
(517, '2025-04-09', 'Dr-Apr\'25/134', '3700/003', '0', '10000000', '-164746306.25', 'Paid to HHK Cold Store Charges,Chq no-221662\r\n', '', '', 0, 35, 460),
(518, '2025-04-10', 'Dr-Apr\'25/152', '4000/s01', '10000000', '0', '96008150', 'Paid to Shwe Late For Vr no-12740,12852,12863,Chq no-221663\r\n', '', '', 0, 40, 461),
(519, '2025-04-10', 'Dr-Apr\'25/152', '3700/003', '0', '10000000', '-174746306.25', 'Paid to Shwe Late For Vr no-12740,12852,12863,Chq no-221663\r\n', '', '', 0, 35, 462),
(520, '2025-04-10', 'Dr-Apr\'25/153', '4000/t01', '7000000', '0', '54990550', 'Paid to Thet Paing For Vr no-12937,Chq no-221664\r\n', '', '', 0, 40, 463),
(521, '2025-04-10', 'Dr-Apr\'25/153', '3700/003', '0', '7000000', '-181746306.25', 'Paid to Thet Paing For Vr no-12937,Chq no-221664\r\n', '', '', 0, 35, 464),
(522, '2025-04-10', 'Dr-Apr\'25/154', '4000/t17', '20000000', '0', '162021845', 'Paid to Than Than Myint For Vr no-12756,12760,Chq no-221665\r\n', '', '', 0, 40, 465),
(523, '2025-04-10', 'Dr-Apr\'25/154', '3700/003', '0', '20000000', '-201746306.25', 'Paid to Than Than Myint For Vr no-12756,12760,Chq no-221665\r\n', '', '', 0, 35, 466),
(524, '2025-04-10', 'Dr-Apr\'25/155', '4000/001', '5000000', '0', '57389150', 'Paid to 4 Zaw For Vr no-12913,Chq no-221666\r\n', '', '', 0, 40, 467),
(525, '2025-04-10', 'Dr-Apr\'25/155', '3700/003', '0', '5000000', '-206746306.25', 'Paid to 4 Zaw For Vr no-12913,Chq no-221666\r\n', '', '', 0, 35, 468),
(526, '2025-04-10', 'Dr-Apr\'25/156', '4000/y01', '7000000', '0', '55628000', 'Paid to Ye Yint For Vr no-12568,12958,Chq no-221667\r\n', '', '', 0, 40, 469),
(527, '2025-04-10', 'Dr-Apr\'25/156', '3700/003', '0', '7000000', '-213746306.25', 'Paid to Ye Yint For Vr no-12568,12958,Chq no-221667\r\n', '', '', 0, 35, 470),
(528, '2025-04-10', 'Dr-Apr\'25/157', '4000/z03', '10000000', '0', '30257925', 'Paid to Zaw Myat Thu For Vr no-12990,13020,13036,Chq no-221668\r\n', '', '', 0, 40, 471),
(529, '2025-04-10', 'Dr-Apr\'25/157', '3700/003', '0', '10000000', '-223746306.25', 'Paid to Zaw Myat Thu For Vr no-12990,13020,13036,Chq no-221668\r\n', '', '', 0, 35, 472),
(530, '2025-04-10', 'Dr-Apr\'25/158', '4000/w01', '7000000', '0', '33698175', 'Paid to Win Bo For Vr no-12700,12718,Chq no-221669\r\n', '', '', 0, 40, 473),
(531, '2025-04-10', 'Dr-Apr\'25/158', '3700/003', '0', '7000000', '-230746306.25', 'Paid to Win Bo For Vr no-12700,12718,Chq no-221669\r\n', '', '', 0, 35, 474),
(532, '2025-04-10', 'Dr-Apr\'25/159', '4000/s04', '10000000', '0', '180162650', 'Paid to Si Thu For Vr no-12669,Chq no-221671\r\n', '', '', 0, 40, 475),
(533, '2025-04-10', 'Dr-Apr\'25/159', '3700/003', '0', '10000000', '-240746306.25', 'Paid to Si Thu For Vr no-12669,Chq no-221671\r\n', '', '', 0, 35, 476),
(534, '2025-04-10', 'Dr-Apr\'25/160', '4000/t11', '30000000', '0', '68829511', 'Paid to Tun Zaw Min For Vr no-12652,12662,12674,12690,Chq no-221673\r\n', '', '', 0, 40, 477),
(535, '2025-04-10', 'Dr-Apr\'25/160', '3700/003', '0', '30000000', '-270746306.25', 'Paid to Tun Zaw Min For Vr no-12652,12662,12674,12690,Chq no-221673\r\n', '', '', 0, 35, 478),
(536, '2025-04-10', 'Dr-Apr\'25/161', '4000/c03', '5000000', '0', '65497325', 'Paid to Chit Ko For Vr no-12905,Chq no-221670\r\n', '', '', 0, 40, 479),
(537, '2025-04-10', 'Dr-Apr\'25/161', '3700/003', '0', '5000000', '-275746306.25', 'Paid to Chit Ko For Vr no-12905,Chq no-221670\r\n', '', '', 0, 35, 480),
(538, '2025-04-10', 'Dr-Apr\'25/162', '4000/t03', '10000000', '0', '67724525', 'Paid to Thin Thin Yee For Vr no-12789,12809,Chq no-221672\r\n', '', '', 0, 40, 481),
(539, '2025-04-10', 'Dr-Apr\'25/162', '3700/003', '0', '10000000', '-285746306.25', 'Paid to Thin Thin Yee For Vr no-12789,12809,Chq no-221672\r\n', '', '', 0, 35, 482),
(540, '2025-04-10', 'Dr-Apr\'25/163', '4000/A06', '6000000', '0', '98468550', 'Paid to Aung Zaw Oo For Vr no-12891,Chq no-221675\r\n', '', '', 0, 40, 483),
(541, '2025-04-10', 'Dr-Apr\'25/163', '3700/003', '0', '6000000', '-291746306.25', 'Paid to Aung Zaw Oo For Vr no-12891,Chq no-221675\r\n', '', '', 0, 35, 484),
(542, '2025-04-10', 'Dr-Apr\'25/164', '4000/t05', '20000000', '0', '282942798', 'Paid to Thet Oo For Vr no-12758,12790,Chq no-221674\r\n', '', '', 0, 40, 485),
(543, '2025-04-10', 'Dr-Apr\'25/164', '3700/003', '0', '20000000', '-311746306.25', 'Paid to Thet Oo For Vr no-12758,12790,Chq no-221674\r\n', '', '', 0, 35, 486),
(544, '2025-04-23', 'Cr-Apr\'25/016', '3700/003', '26296042.5', '0', '-285450263.75', 'USA Money Received From UAB $50000 (4.4.25)$49945,25% $12486.25*2106ks,(75% $37458.75-$10=$37448.75 UAB USD Balance)\r\n', '', '', 0, 35, 487),
(545, '2025-04-23', 'Cr-Apr\'25/016', '3700/002', '0', '12486.25', '-24972.5', 'USA Money Received From UAB $50000 (4.4.25)$49945,25% $12486.25*2106ks,(75% $37458.75-$10=$37448.75 UAB USD Balance)\r\n', '', '', 0, 35, 488),
(546, '2025-04-23', 'Cr-Apr\'25/017', '3700/003', '26296042.5', '0', '-259154221.25', 'USA Money Received From UAB $50000 (11.4.25)$49945,25% $12486.25*2106ks,(75% $37458.75-$10=$37448.75 UAB USD Balance)\r\n', '', '', 0, 35, 489),
(547, '2025-04-23', 'Cr-Apr\'25/017', '3700/002', '0', '12486.25', '-37458.75', 'USA Money Received From UAB $50000 (11.4.25)$49945,25% $12486.25*2106ks,(75% $37458.75-$10=$37448.75 UAB USD Balance)\r\n', '', '', 0, 35, 490),
(548, '2025-04-07', 'Cr-Apr25/006', '3700/006', '30670526.25', '0', '670526.25', 'USA Money Selling from USD A/C $49945*75% $37448.75 * 4418ks (37448.75*3599ks)LM and 37448.75*819ks Nan\r\n', '', '', 0, 35, 491),
(549, '2025-04-07', 'Cr-Apr25/006', '3600/003', '0', '30670526.25', '-165448577.5', 'USA Money Selling from USD A/C $49945*75% $37448.75 * 4418ks (37448.75*3599ks)LM and 37448.75*819ks Nan\r\n', '', '', 0, 35, 492),
(550, '2025-04-09', 'Dr-Apr\'25/136', '9100/040', '110000', '0', '698600', ' Sir Income Tax For Mar\'25 \r\n', '', '', 0, 39, 493),
(551, '2025-04-09', 'Dr-Apr\'25/136', '3700/006', '0', '110000', '560526.25', ' Sir Income Tax For Mar\'25 \r\n', '', '', 0, 35, 494),
(552, '2025-04-09', 'Dr-Apr\'25/136', '9100/009', '2000', '0', '6400', 'Bank Charges For Sir Income Tax For Mar\'25\r\n', '', '', 0, 39, 495),
(553, '2025-04-09', 'Dr-Apr\'25/136', '3700/006', '0', '2000', '558526.25', 'Bank Charges For Sir Income Tax For Mar\'25\r\n', '', '', 0, 35, 496),
(554, '2025-04-22', 'Cr-Apr\'25/015', '3600/002', '11000', '0', '11000', 'LM Loan from ACE Office for Sir (BKK go) 13.4.25 to 23.4.25\r\n', '', '', 0, 35, 501),
(555, '2025-04-22', 'Cr-Apr\'25/015', '4000/A24', '0', '11000', '-11000', 'LM Loan from ACE Office for Sir (BKK go) 13.4.25 to 23.4.25\r\n', '', '', 0, 40, 502),
(556, '2025-04-22', 'Dr-Apr\'25/184', '9100/017', '11000', '0', '3579605', 'Sir Take for BKK go\r\n', '', '', 0, 39, 503),
(557, '2025-04-22', 'Dr-Apr\'25/184', '3600/002', '0', '11000', '0', 'Sir Take for BKK go\r\n', '', '', 0, 35, 504),
(558, '2025-04-08', 'Cr-Apr\'25/008', '3600/002', '5010', '0', '5010', '5000 Loan Received From ACE BD By Chairman\r\n', '', '', 0, 35, 505),
(559, '2025-04-08', 'Cr-Apr\'25/008', '4000/a24', '0', '5010', '-16010', '5000 Loan Received From ACE BD By Chairman\r\n', '', '', 0, 40, 506),
(560, '2025-04-08', 'Dr-Apr\'25/117', '9100/029', '5010', '0', '47010', 'Paid Undertaken Charges ACE BD Money\r\n\r\n', '', '', 0, 39, 507),
(561, '2025-04-08', 'Dr-Apr\'25/117', '3600/002', '0', '5010', '0', 'Paid Undertaken Charges ACE BD Money\r\n\r\n', '', '', 0, 35, 508),
(562, '2025-04-07', 'Cr-Apr\'25/007', '3700/002', '49945', '0', '12486.25', 'USA Money Received from UAB (28.3.25)-$50000\r\n', '', '', 0, 35, 509),
(563, '2025-04-07', 'Cr-Apr\'25/007', '3300/002', '0', '49945', '-49945', 'USA Money Received from UAB (28.3.25)-$50000\r\n', '', '', 0, 35, 510),
(564, '2025-04-07', 'Dr-Apr\'25/097', '9100/009', '10', '0', '6410', 'Bank Charges for USA Money 75% ($50000-$55=$49945)\r\n', '', '', 0, 39, 511),
(565, '2025-04-07', 'Dr-Apr\'25/097', '3700/002', '0', '10', '12476.25', 'Bank Charges for USA Money 75% ($50000-$55=$49945)\r\n', '', '', 0, 35, 512),
(566, '2025-04-07', 'Dr-Apr\'25/098', '3700/003', '26296042.5', '0', '-232858178.75', ' USA Money Selling from USD A/C 25% 2106ks/ 75% 4418ks (3599ks LM A/C and 819ks Nan A/C) \r\n', '', '', 0, 35, 513),
(567, '2025-04-07', 'Dr-Apr\'25/098', '3700/002', '0', '12486.25', '-10', ' USA Money Selling from USD A/C 25% 2106ks/ 75% 4418ks (3599ks LM A/C and 819ks Nan A/C) \r\n', '', '', 0, 35, 514),
(568, '2025-04-07', 'Dr-Apr\'25/098', '3600/003', '165448577.5', '0', '0', ' USA Money Selling from USD A/C 25% 2106ks/ 75% 4418ks (3599ks LM A/C and 819ks Nan A/C) \r\n', '', '', 0, 35, 515),
(569, '2025-04-07', 'Dr-Apr\'25/098', '3700/002', '0', '37448.75', '-37458.75', ' USA Money Selling from USD A/C 25% 2106ks/ 75% 4418ks (3599ks LM A/C and 819ks Nan A/C) \r\n', '', '', 0, 35, 516),
(570, '2025-04-23', 'Cr-Apr\'25/016', '3700/002', '49945', '0', '12486.25', 'USA Money Received From UAB USD A/C (4.4.25) For SAF-27/24 & SAF-01/25\r\n', '', '', 0, 35, 517),
(571, '2025-04-23', 'Cr-Apr\'25/016', '3300/002', '0', '49945', '-99890', 'USA Money Received From UAB USD A/C (4.4.25) For SAF-27/24 & SAF-01/25\r\n', '', '', 0, 35, 518),
(572, '2025-04-23', 'Cr-Apr\'25/017', '3700/002', '49945', '0', '62431.25', 'USA Money Received From UAB USD A/C (11.4.25) For SAF-01/25\r\n', '', '', 0, 35, 519),
(573, '2025-04-23', 'Cr-Apr\'25/017', '3300/002', '0', '49945', '-149835', 'USA Money Received From UAB USD A/C (11.4.25) For SAF-01/25\r\n', '', '', 0, 35, 520),
(574, '2025-04-08', 'Dr-Apr\'25/118', '4000/A24', '5010', '0', '-11000', 'Transfer to Gulf Air instead of ACE (MM), that money adjust with Chairman Loan from ACE(BD) \r\n', '', '', 0, 40, 524),
(575, '2025-04-08', 'Dr-Apr\'25/118', '3700/001', '0', '5010', '-44960', 'Transfer to Gulf Air instead of ACE (MM), that money adjust with Chairman Loan from ACE(BD) \r\n', '', '', 0, 35, 525),
(576, '2025-04-08', 'Jv04-009', '9100/009', '36.22', '0', '6446.22', 'Bank Charges For Money Transfer to NNS $40000 (8.4.25)\r\n', '', '', 0, 39, 526),
(577, '2025-04-08', 'Jv04-009', '3700/001', '0', '36.22', '-44996.22', 'Bank Charges For Money Transfer to NNS $40000 (8.4.25)\r\n', '', '', 0, 35, 527),
(578, '2025-04-08', 'Jv04-010', '9100/009', '36.22', '0', '6482.44', 'Bank Charges For Gulf Air Money Transfer\r\n\r\n', '', '', 0, 39, 528),
(579, '2025-04-08', 'Jv04-010', '3700/001', '0', '36.22', '-45032.44', 'Bank Charges For Gulf Air Money Transfer\r\n\r\n', '', '', 0, 35, 529),
(580, '2025-04-09', 'Jv04-003', '9100/009', '50', '0', '6532.44', ' Bank Inward Charges of $40000-$50=$39950,Cr-Apr\'25/011 \r\n', '', '', 0, 39, 530),
(581, '2025-04-09', 'Jv04-003', '3700/001', '0', '50', '-45082.44', ' Bank Inward Charges of $40000-$50=$39950,Cr-Apr\'25/011 \r\n', '', '', 0, 35, 531),
(582, '2025-04-14', 'Jv04-011', '9100/001', '1481.59', '0', '1481.59', 'Mr Sarmad Salary For April\'25 (CAD 2000//USD 1481.59)\r\n', '', '', 0, 39, 532),
(583, '2025-04-14', 'Jv04-011', '3700/001', '0', '1481.59', '-46564.03', 'Mr Sarmad Salary For April\'25 (CAD 2000//USD 1481.59)\r\n', '', '', 0, 35, 533),
(584, '2025-04-17', 'Jv04-012', '3700/001', '5000', '0', '-41564.03', 'Ocean Freight Received For Can-02/25 (BL-OOLU2755928300)Need to Transfer to RBC\r\n', '', '', 0, 35, 534),
(585, '2025-04-17', 'Jv04-012', '7000/002', '0', '5000', '-5000', 'Ocean Freight Received For Can-02/25 (BL-OOLU2755928300)Need to Transfer to RBC\r\n', '', '', 0, 38, 535),
(586, '2025-04-22', 'Jv04-013', '3700/001', '3845', '0', '-37719.03', 'Ocean Freight Received For Can-02/25 (BL-OOLU2755928300)need to Transfer to RBC\r\n', '', '', 0, 35, 536),
(587, '2025-04-22', 'Jv04-013', '7000/002', '0', '3845', '-8845', 'Ocean Freight Received For Can-02/25 (BL-OOLU2755928300)need to Transfer to RBC\r\n', '', '', 0, 38, 537),
(588, '2025-04-22', 'Jv04-014', '9100/009', '122.81', '0', '6655.25', 'Bank charges For Money going out and then in for Error $2416.15-$2293.34=$122.81\r\n', '', '', 0, 39, 538),
(589, '2025-04-22', 'Jv04-014', '3700/001', '0', '122.81', '-37841.84', 'Bank charges For Money going out and then in for Error $2416.15-$2293.34=$122.81\r\n', '', '', 0, 35, 539),
(590, '2025-04-22', 'Jv04-016', '7000/002', '8845', '0', '0', 'Ocean Freight Transfer to RBC For Can-02/25 BL_OOLU2755928300\r\n', '', '', 0, 38, 540),
(591, '2025-04-22', 'Jv04-016', '3700/001', '0', '8845', '-46686.84', 'Ocean Freight Transfer to RBC For Can-02/25 BL_OOLU2755928300\r\n', '', '', 0, 35, 541),
(592, '2025-04-22', 'Jv04-017', '9100/009', '7.43', '0', '6662.68', 'Bank Charges For Ocean Freight Transfer to RBC For Can-02/25\r\n', '', '', 0, 39, 542),
(593, '2025-04-22', 'Jv04-017', '3700/001', '0', '7.43', '-46694.27', 'Bank Charges For Ocean Freight Transfer to RBC For Can-02/25\r\n', '', '', 0, 35, 543),
(594, '2025-04-22', 'Jv04-015', '3300/012', '2416.15', '0', '2416.15', 'Temporary Loan to LM Impex For Import License (CAD 3248.75 Equivalent $2416.15)\r\n', '', '', 0, 35, 544),
(595, '2025-04-22', 'Jv04-015', '3700/001', '0', '2416.15', '-49110.42', 'Temporary Loan to LM Impex For Import License (CAD 3248.75 Equivalent $2416.15)\r\n', '', '', 0, 35, 545),
(596, '2025-04-07', 'Jv04-002', '9100/009', '55', '0', '6717.68', 'Bank Charge for USA Money (28.3.25) $50000-$55=$49945,Cr-Apr\'25/006\r\n', '', '', 0, 39, 546),
(597, '2025-04-07', 'Jv04-002', '3300/002', '0', '55', '-149890', 'Bank Charge for USA Money (28.3.25) $50000-$55=$49945,Cr-Apr\'25/006\r\n', '', '', 0, 35, 547),
(598, '2025-04-04', 'Jv04-007', '9100/009', '55', '0', '6772.68', 'Bank Charges For USA Money From UAB USD A/C For (4.4.25) Money\r\n', '', '', 0, 39, 548),
(599, '2025-04-04', 'Jv04-007', '3300/002', '0', '55', '-149945', 'Bank Charges For USA Money From UAB USD A/C For (4.4.25) Money\r\n', '', '', 0, 35, 549),
(600, '2025-04-11', 'JV04-008', '9100/009', '55', '0', '6827.68', 'Bank Charges For USA Money From UAB USD A/C For (11.4.25) Money\r\n', '', '', 0, 39, 550),
(601, '2025-04-11', 'JV04-008', '3300/002', '0', '55', '-150000', 'Bank Charges For USA Money From UAB USD A/C For (11.4.25) Money\r\n', '', '', 0, 35, 551),
(602, '2025-04-08', 'Jv04-005', '3300/002', '275750.5', '0', '125750.5', ' Credit Sale to USA Buyer SAF-07/2025 ,OERU:406498 \r\n', 'SAF-07/2025', 'OERU:406498', 0, 35, 552),
(603, '2025-04-08', 'Jv04-005', '5000/001', '0', '275750.5', '-275750.5', ' Credit Sale to USA Buyer SAF-07/2025 ,OERU:406498 \r\n', '', '', 0, 36, 553),
(604, '2025-04-08', 'Jv04-006', '3300/002', '311755.9', '0', '437506.4', ' Credit Sale to USA Buyer SAF-08/2025,FSCU:5761613 \r\n', 'SAF-08/2025', 'FSCU:5761613', 0, 35, 554),
(605, '2025-04-08', 'Jv04-006', '5000/001', '0', '311755.9', '-587506.4', ' Credit Sale to USA Buyer SAF-08/2025,FSCU:5761613 \r\n', '', '', 0, 36, 555),
(608, '2025-04-07', 'Jv04-002', '9100/009', '55', '0', '6882.68', 'Bank Charge for USA Money (28.3.25) $50000-$55=$49945,Cr-Apr\'25/006\r\n', '', '', 0, 39, 558),
(609, '2025-04-07', 'Jv04-002', '3300/002', '0', '55', '437451.4', 'Bank Charge for USA Money (28.3.25) $50000-$55=$49945,Cr-Apr\'25/006\r\n', '', '', 0, 35, 559);

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
(1, 'NY', 'Balance', '2025-04-28', '1031', '3up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(2, 'NY', 'Balance', '2025-04-28', '1031', '4up', '20', 75, 75, 'G', '', '', '', '', '', '', '', 0),
(3, 'NY', 'Balance', '2025-04-28', '1031', '4up', '20.5', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(4, 'NY', 'Balance', '2025-04-28', '1031', '4up', '21', 6, 6, 'G', '', '', '', '', '', '', '', 0),
(5, 'NY', 'Balance', '2025-04-28', '1031', '4up', '22', 43, 43, 'G', '', '', '', '', '', '', '', 0),
(7, 'NY', 'Balance', '2025-04-28', '1031', '4up', '23', 39, 39, 'G', '', '', '', '', '', '', '', 0),
(8, 'NY', 'Balance', '2025-04-28', '1031', '4up', '24', 28, 28, 'G', '', '', '', '', '', '', '', 0),
(9, 'NY', 'Balance', '2025-04-28', '1031', '5up', '21', 16, 16, 'G', '', '', '', '', '', '', '', 0),
(10, 'NY', 'Balance', '2025-04-28', '1031', '5up', '22', 289, 289, 'G', '', '', '', '', '', '', '', 0),
(11, 'NY', 'Balance', '2025-04-28', '1031', '5up', '23', 364, 364, 'G', '', '', '', '', '', '', '', 0),
(12, 'NY', 'Balance', '2025-04-28', '1031', '5up', '24', 35, 35, 'G', '', '', '', '', '', '', '', 0),
(13, 'NY', 'Balance', '2025-04-28', '1031', '6up', '19', 133, 133, 'G', '', '', '', '', '', '', '', 0),
(14, 'NY', 'Balance', '2025-04-28', '1031', '6up', '20', 223, 223, 'G', '', '', '', '', '', '', '', 0),
(15, 'NY', 'Balance', '2025-04-28', '1031', '6up', '21', 15, 15, 'G', '', '', '', '', '', '', '', 0),
(16, 'NY', 'Balance', '2025-04-28', '1031', '7up', '22', 9, 9, 'G', '', '', '', '', '', '', '', 0),
(17, 'NY', 'Balance', '2025-04-28', '1031', '7up', '23', 22, 22, 'G', '', '', '', '', '', '', '', 0),
(18, 'NY', 'Balance', '2025-04-28', '1031', '7up', '24', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(19, 'NY', 'Balance', '2025-04-28', '1031', '1.5up', '20', 54, 54, 'G', '', '', '', '', '', '', '', 0),
(20, 'NY', 'Balance', '2025-04-28', '1031', '1.5up', '21', 17, 17, 'G', '', '', '', '', '', '', '', 0),
(21, 'NY', 'Balance', '2025-04-28', '1031', '1up', '20', 21, 21, 'G', '', '', '', '', '', '', '', 0),
(22, 'NY', 'Balance', '2025-04-28', '1023', '2up', '20', 21, 21, 'G', '', '', '', '', '', '', '', 0),
(23, 'NY', 'Balance', '2025-04-28', '1023', '2up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(24, 'NY', 'Balance', '2025-04-28', '1023', '3up', '20', 7, 7, 'G', '', '', '', '', '', '', '', 0),
(26, 'NY', 'Balance', '2025-04-28', '1023', '3up', '22', 9, 9, 'G', '', '', '', '', '', '', '', 0),
(27, 'NY', 'Balance', '2025-04-28', '1023', '3up', '23', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(28, 'NY', 'Balance', '2025-04-28', '1023', '3up', '19', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(29, 'NY', 'Balance', '2025-04-28', '1023', '3up', '24', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(30, 'NY', 'Balance', '2025-04-28', '1023', '4up', '20', 10, 10, 'G', '', '', '', '', '', '', '', 0),
(31, 'NY', 'Balance', '2025-04-28', '1023', '4up', '21', 23, 23, 'G', '', '', '', '', '', '', '', 0),
(32, 'NY', 'Balance', '2025-04-28', '1023', '4up', '22', 56, 56, 'G', '', '', '', '', '', '', '', 0),
(33, 'NY', 'Balance', '2025-04-28', '1023', '4up', '23', 103, 103, 'G', '', '', '', '', '', '', '', 0),
(35, 'NY', 'Balance', '2025-04-28', '1023', '4up', '24', 62, 62, 'G', '', '', '', '', '', '', '', 0),
(36, 'NY', 'Balance', '2025-04-28', '1023', '5up', '21', 19, 19, 'G', '', '', '', '', '', '', '', 0),
(37, 'NY', 'Balance', '2025-04-28', '1023', '5up', '22', 93, 93, 'G', '', '', '', '', '', '', '', 0),
(38, 'NY', 'Balance', '2025-04-28', '1023', '5up', '23', 165, 165, 'G', '', '', '', '', '', '', '', 0),
(39, 'NY', 'Balance', '2025-04-28', '1023', '5up', '24', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(40, 'NY', 'Balance', '2025-04-28', '1023', '3up', '21', 5, 5, 'G', '', '', '', '', '', '', '', 0),
(41, 'NY', 'Balance', '2025-04-28', '1023', '5up', '22.5', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(42, 'NY', 'Balance', '2025-04-28', '1023', '6up', '19', 6, 6, 'G', '', '', '', '', '', '', '', 0),
(43, 'NY', 'Balance', '2025-04-28', '1023', '6up', '20', 106, 106, 'G', '', '', '', '', '', '', '', 0),
(44, 'NY', 'Balance', '2025-04-28', '1023', '6up', '21', 12, 12, 'G', '', '', '', '', '', '', '', 0),
(45, 'NY', 'Balance', '2025-04-28', '1023', '6up', '21.5', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(46, 'NY', 'Balance', '2025-04-28', '1023', '7up', '22', 8, 8, 'G', '', '', '', '', '', '', '', 0),
(47, 'NY', 'Balance', '2025-04-28', '1023', '7up', '23', 21, 21, 'G', '', '', '', '', '', '', '', 0),
(49, 'NY', 'Balance', '2025-04-28', '1023', '8up', '26', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(50, 'NY', 'Balance', '2025-04-28', '1017', '2up', '20', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(51, 'NY', 'Balance', '2025-04-28', '1017', '3up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(52, 'NY', 'Balance', '2025-04-28', '1017', '3up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(53, 'NY', 'Balance', '2025-04-28', '1017', '3up', '22', 8, 8, 'G', '', '', '', '', '', '', '', 0),
(54, 'NY', 'Balance', '2025-04-28', '1017', '3up', '23', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(55, 'NY', 'Balance', '2025-04-28', '1017', '4up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(56, 'NY', 'Balance', '2025-04-28', '1017', '4up', '22', 34, 34, 'G', '', '', '', '', '', '', '', 0),
(57, 'NY', 'Balance', '2025-04-28', '1017', '4up', '23', 17, 17, 'G', '', '', '', '', '', '', '', 0),
(58, 'NY', 'Balance', '2025-04-28', '1017', '5up', '21', 5, 5, 'G', '', '', '', '', '', '', '', 0),
(60, 'NY', 'Balance', '2025-04-28', '1017', '5up', '22', 8, 8, 'G', '', '', '', '', '', '', '', 0),
(61, 'NY', 'Balance', '2025-04-28', '1017', '5up', '24', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(62, 'NY', 'Balance', '2025-04-28', '1017', '6up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(63, 'NY', 'Balance', '2025-04-28', '1017', '7up', '23', 21, 21, 'G', '', '', '', '', '', '', '', 0),
(64, 'NY', 'Balance', '2025-04-28', '1017', '7up', '24', 7, 7, 'G', '', '', '', '', '', '', '', 0),
(65, 'NY', 'Balance', '2025-04-28', '1017', '8up', '25', 6, 6, 'G', '', '', '', '', '', '', '', 0),
(66, 'NY', 'Balance', '2025-04-28', '1017', '8up', '26', 11, 11, 'G', '', '', '', '', '', '', '', 0),
(67, 'NY', 'Balance', '2025-04-28', '1017', '9up', '19', 8, 8, 'G', '', '', '', '', '', '', '', 0),
(68, 'NY', 'Balance', '2025-04-28', '1017', '9up', '20', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(69, 'NY', 'Balance', '2025-04-28', '1017', '2up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(72, 'NY', 'Balance', '2025-04-28', '1015', '18up', '21', 3, 3, 'W', '', '', '', '', '', '', '', 0),
(73, 'NY', 'Balance', '2025-04-28', '1015', '2up', '20', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(75, 'NY', 'Balance', '2025-04-28', '1020', '2up', '20', 89, 89, 'G', '', '', '', '', '', '', '', 0),
(76, 'NY', 'Balance', '2025-04-28', '1020', '2up', '21', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(79, 'NY', 'Balance', '2025-04-28', '1020', '3up', '20', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(80, 'NY', 'Balance', '2025-04-28', '1020', '3up', '21', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(81, 'NY', 'Balance', '2025-04-28', '1015', '12/15up', '20', 11, 11, 'W', '', '', '', '', '', '', '', 0),
(82, 'NY', 'Balance', '2025-04-28', '1020', '3up', '22', 6, 6, 'G', '', '', '', '', '', '', '', 0),
(83, 'NY', 'Balance', '2025-04-28', '1020', '3up', '23', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(84, 'NY', 'Balance', '2025-04-28', '1020', '4up', '22', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(85, 'NY', 'Balance', '2025-04-28', '1020', '4up', '23', 10, 10, 'G', '', '', '', '', '', '', '', 0),
(86, 'NY', 'Balance', '2025-04-28', '1020', '4up', '24', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(87, 'NY', 'Balance', '2025-04-28', '1020', '5up', '22', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(88, 'NY', 'Balance', '2025-04-28', '1020', '5up', '21', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(89, 'NY', 'Balance', '2025-04-28', '1020', '5up', '23', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(90, 'NY', 'Balance', '2025-04-28', '1020', '5up', '24', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(91, 'NY', 'Balance', '2025-04-28', '1020', '6up', '19', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(92, 'NY', 'Balance', '2025-04-28', '1020', '6up', '20', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(93, 'NY', 'Balance', '2025-04-28', '1020', '6up', '21', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(94, 'NY', 'Balance', '2025-04-28', '1020', '7up', '23', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(95, 'NY', 'Balance', '2025-04-28', '1020', '4up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(96, 'NY', 'Balance', '2025-04-28', '1020', '4up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(98, 'NY', 'Balance', '2025-04-28', '1030', '1.5up', '20', 29, 29, 'W', '', '', '', '', '', '', '', 0),
(99, 'NY', 'Balance', '2025-04-28', '1030', '1.5up', '21', 5, 5, 'W', '', '', '', '', '', '', '', 0),
(100, 'NY', 'Balance', '2025-04-28', '1030', '2up', '20', 13, 13, 'W', '', '', '', '', '', '', '', 0),
(101, 'NY', 'Balance', '2025-04-28', '1026', '8/10up', '20', 41, 41, 'W', '', '', '', '', '', '', '', 0),
(102, 'NY', 'Balance', '2025-04-28', '1026', '1up', '20', 73, 73, 'W', '', '', '', '', '', '', '', 0),
(108, 'NY', 'Balance', '2025-04-28', '1030', '1up', '20', 13, 13, 'W', '', '', '', '', '', '', '', 0),
(109, 'NY', 'Balance', '2025-04-28', '1026', '1.5up', '20', 26, 26, 'W', '', '', '', '', '', '', '', 0),
(110, 'NY', 'Balance', '2025-04-28', '1026', '2up', '20', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(111, 'NY', 'Balance', '2025-04-28', '1026', '2up', '21', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(112, 'NY', 'Balance', '2025-04-28', '1026', '1up', '18.5', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(113, 'NY', 'Balance', '2025-04-28', '1036', '8/10up', '20', 14, 14, 'W', '', '', '', '', '', '', '', 0),
(114, 'NY', 'Balance', '2025-04-28', '1036', '1up', '20', 78, 78, 'W', '', '', '', '', '', '', '', 0),
(115, 'NY', 'Balance', '2025-04-28', '1036', '1.5up', '20', 20, 20, 'W', '', '', '', '', '', '', '', 0),
(116, 'NY', 'Balance', '2025-04-28', '1036', '1.5up', '21', 2, 2, 'W', '', '', '', '', '', '', '', 0),
(117, 'NY', 'Balance', '2025-04-28', '1036', '2up', '20', 8, 8, 'W', '', '', '', '', '', '', '', 0),
(118, 'NY', 'Balance', '2025-04-28', '1036', '2up', '21', 2, 2, 'W', '', '', '', '', '', '', '', 0),
(119, 'NY', 'Balance', '2025-04-28', '1027', '8/10up', '20', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(120, 'NY', 'Balance', '2025-04-28', '1019', '500gx12bls', '6', 17, 17, 'Bls', '', '', '', '', '', '', '', 0),
(121, 'NY', 'Balance', '2025-04-28', '1043', '1kgx15pks(1', '15', 8, 8, 'Cut_piece', '', '', '', '', '', '', '', 0),
(122, 'NY', 'Balance', '2025-04-28', '1043', '1kgx15pks(2', '15', 151, 151, 'Cut_piece', '', '', '', '', '', '', '', 0),
(123, 'NY', 'Balance', '2025-04-28', '1043', '1kgx15pks(3', '15', 31, 31, 'Cut_piece', '', '', '', '', '', '', '', 0),
(124, 'NY', 'Balance', '2025-04-28', '1043', '1kgx15pks', '15', 8, 8, 'Cut_piece', '', '', '', '', '', '', '', 0),
(125, 'NY', 'Balance', '2025-04-28', '1004', '500gx12bls', '6', 1, 1, 'Bls', '', '', '', '', '', '', '', 0),
(126, 'Can', 'Balance', '2025-04-28', '1031', '1.5up', '20', 11, 11, 'G', '', '', '', '', '', '', '', 0),
(127, 'Can', 'Balance', '2025-04-28', '1031', '1.5up', '21', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(128, 'Can', 'Balance', '2025-04-28', '1031', '2up', '20', 26, 26, 'G', '', '', '', '', '', '', '', 0),
(131, 'Can', 'Balance', '2025-04-28', '1031', '4up', '20', 8, 8, 'G', '', '', '', '', '', '', '', 0),
(132, 'Can', 'Balance', '2025-04-28', '1031', '4up', '21', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(133, 'Can', 'Balance', '2025-04-28', '1031', '4up', '22', 54, 54, 'G', '', '', '', '', '', '', '', 0),
(134, 'Can', 'Balance', '2025-04-28', '1031', '4up', '23', 78, 78, 'G', '', '', '', '', '', '', '', 0),
(135, 'Can', 'Balance', '2025-04-28', '1031', '4up', '24', 30, 30, 'G', '', '', '', '', '', '', '', 0),
(136, 'Can', 'Balance', '2025-04-28', '1031', '5up', '21', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(137, 'Can', 'Balance', '2025-04-28', '1031', '5up', '22', 65, 65, 'G', '', '', '', '', '', '', '', 0),
(138, 'Can', 'Balance', '2025-04-28', '1031', '5up', '23', 84, 84, 'G', '', '', '', '', '', '', '', 0),
(139, 'Can', 'Balance', '2025-04-28', '1031', '5up', '24', 19, 19, 'G', '', '', '', '', '', '', '', 0),
(140, 'Can', 'Balance', '2025-04-28', '1031', '6up', '19', 27, 27, 'G', '', '', '', '', '', '', '', 0),
(141, 'Can', 'Balance', '2025-04-28', '1031', '6up', '20', 51, 51, 'G', '', '', '', '', '', '', '', 0),
(142, 'Can', 'Balance', '2025-04-28', '1031', '7up', '22', 9, 9, 'G', '', '', '', '', '', '', '', 0),
(143, 'Can', 'Balance', '2025-04-28', '1031', '7up', '23', 16, 16, 'G', '', '', '', '', '', '', '', 0),
(144, 'Can', 'Balance', '2025-04-28', '1031', '8up', '25', 6, 6, 'G', '', '', '', '', '', '', '', 0),
(145, 'Can', 'Balance', '2025-04-28', '1031', '8up', '26', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(146, 'Can', 'Balance', '2025-04-28', '1031', '9up', '19', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(147, 'Can', 'Balance', '2025-04-28', '1031', '9up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(148, 'Can', 'Balance', '2025-04-28', '1031', '7up', '24', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(149, 'Can', 'Balance', '2025-04-28', '1031', '8up', '27', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(150, 'Can', 'Balance', '2025-04-28', '1031', '8up', '24.5', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(151, 'Can', 'Balance', '2025-04-28', '1031', '8up', '26.5', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(152, 'Can', 'Balance', '2025-04-28', '1031', '9up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(153, 'Can', 'Balance', '2025-04-28', '1037', '300G', '20', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(154, 'Can', 'Balance', '2025-04-28', '1037', '200G', '20', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(155, 'Can', 'Balance', '2025-04-28', '1004', '500gx12bls', '6', 125, 125, 'Bls', '', '', '', '', '', '', '', 0),
(156, 'Can', 'Balance', '2025-04-28', '1027', '5up', '23', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(157, 'Can', 'Balance', '2025-04-28', '1002', '2up', '20', 158, 158, 'G', '', '', '', '', '', '', '', 0),
(158, 'Can', 'Balance', '2025-04-28', '1002', '2up', '21', 56, 56, 'G', '', '', '', '', '', '', '', 0),
(159, 'Can', 'Balance', '2025-04-28', '1002', '1up', '20', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(160, 'Can', 'Balance', '2025-04-28', '1002', '3up', '21', 13, 13, 'G', '', '', '', '', '', '', '', 0),
(161, 'Can', 'Balance', '2025-04-28', '1004', '3up', '22', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(162, 'Can', 'Balance', '2025-04-28', '1002', '3up', '20', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(163, 'Can', 'Balance', '2025-04-28', '1002', '3up', '19', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(164, 'Can', 'Balance', '2025-04-28', '1002', '4up', '20', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(165, 'Can', 'Balance', '2025-04-28', '1002', '4up', '23', 5, 5, 'G', '', '', '', '', '', '', '', 0),
(166, 'Can', 'Balance', '2025-04-28', '1002', '5up', '22', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(167, 'Can', 'Balance', '2025-04-28', '1002', '5up', '23', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(168, 'Can', 'Balance', '2025-04-28', '1002', '6up', '20', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(169, 'Can', 'Balance', '2025-04-28', '1002', '7up', '24', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(171, 'Can', 'Balance', '2025-04-28', '1002', '1.5up', '21', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(172, 'Can', 'Balance', '2025-04-28', '1002', '9up', '19.5', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(173, 'Can', 'Balance', '2025-04-28', '1002', '10up', '22', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(174, 'Can', 'Balance', '2025-04-28', '1002', '8up', '27', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(175, 'Can', 'Balance', '2025-04-28', '1002', '1.5up', '20', 30, 30, 'G', '', '', '', '', '', '', '', 0),
(176, 'Can', 'Balance', '2025-04-28', '1002', '3up', '22', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(177, 'Can', 'Balance', '2025-04-28', '1001', '1.5up', '20', 32, 32, 'G', '', '', '', '', '', '', '', 0),
(178, 'Can', 'Balance', '2025-04-28', '1001', '1.5up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(180, 'Can', 'Balance', '2025-04-28', '1008', '8up', '26', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(181, 'Can', 'Balance', '2025-04-28', '1008', '2up', '20', 2, 2, 'Scaless', '', '', '', '', '', '', '', 0),
(182, 'Can', 'Balance', '2025-04-28', '1008', '6up', '21', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(183, 'Can', 'Balance', '2025-04-28', '1008', 'Mix', '15', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(184, 'Can', 'Balance', '2025-04-28', '1008', '1.5up', '20', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(185, 'Can', 'Balance', '2025-04-28', '1008', '7up', '23', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(186, 'Can', 'Balance', '2025-04-28', '1008', '5up', '22', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(187, 'Can', 'Balance', '2025-04-28', '1008', '5up', '23', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(188, 'Can', 'Balance', '2025-04-28', '1008', '3up', '22', 2, 2, 'Scaless', '', '', '', '', '', '', '', 0),
(189, 'Can', 'Balance', '2025-04-28', '1008', '3up', '21', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(190, 'Can', 'Balance', '2025-04-28', '1008', '4up', '22', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(191, 'Can', 'Balance', '2025-04-28', '1008', '4up', '23', 3, 3, 'Scaless', '', '', '', '', '', '', '', 0),
(192, 'Can', 'Balance', '2025-04-28', '1008', '4up', '24', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(193, 'Can', 'Balance', '2025-04-28', '1005', '250g x24bls', '6', 3, 3, 'Bls', '', '', '', '', '', '', '', 0),
(195, 'Can', 'Balance', '2025-04-28', '1031', '3up', '22', 1, 0, 'Scaless', '', '', '', '', '', '', '', 0),
(196, 'Can', 'Balance', '2025-04-28', '1023', '2up', '20', 115, 115, 'G', '', '', '', '', '', '', '', 0),
(197, 'Can', 'Balance', '2025-04-28', '1023', '2up', '21', 50, 50, 'G', '', '', '', '', '', '', '', 0),
(198, 'Can', 'Balance', '2025-04-28', '1023', '3up', '19', 5, 5, 'G', '', '', '', '', '', '', '', 0),
(199, 'Can', 'Balance', '2025-04-28', '1023', '3up', '20', 25, 25, 'G', '', '', '', '', '', '', '', 0),
(200, 'Can', 'Balance', '2025-04-28', '1023', '3up', '21', 32, 32, 'G', '', '', '', '', '', '', '', 0),
(201, 'Can', 'Balance', '2025-04-28', '1023', '3up', '22', 16, 16, 'G', '', '', '', '', '', '', '', 0),
(202, 'Can', 'Balance', '2025-04-28', '1023', '3up', '23', 5, 5, 'G', '', '', '', '', '', '', '', 0),
(203, 'Can', 'Balance', '2025-04-28', '1023', '4up', '20', 17, 17, 'G', '', '', '', '', '', '', '', 0),
(204, 'Can', 'Balance', '2025-04-28', '1023', '4up', '21', 19, 19, 'G', '', '', '', '', '', '', '', 0),
(205, 'Can', 'Balance', '2025-04-28', '1023', '4up', '22', 42, 42, 'G', '', '', '', '', '', '', '', 0),
(206, 'Can', 'Balance', '2025-04-28', '1023', '4up', '23', 178, 178, 'G', '', '', '', '', '', '', '', 0),
(207, 'Can', 'Balance', '2025-04-28', '1023', '4up', '24', 121, 121, 'G', '', '', '', '', '', '', '', 0),
(208, 'Can', 'Balance', '2025-04-28', '1023', '5up', '21', 5, 5, 'G', '', '', '', '', '', '', '', 0),
(209, 'Can', 'Balance', '2025-04-28', '1023', '5up', '22', 11, 11, 'G', '', '', '', '', '', '', '', 0),
(210, 'Can', 'Balance', '2025-04-28', '1023', '6up', '19', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(211, 'Can', 'Balance', '2025-04-28', '1023', '6up', '20', 10, 10, 'G', '', '', '', '', '', '', '', 0),
(212, 'Can', 'Balance', '2025-04-28', '1023', '7up', '23', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(213, 'Can', 'Balance', '2025-04-28', '1023', '8up', '27', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(214, 'Can', 'Balance', '2025-04-28', '1023', '2up', '15.8', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(215, 'Can', 'Balance', '2025-04-28', '1023', '7up', '24', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(216, 'Can', 'Balance', '2025-04-28', '1023', '5up', '23', 11, 11, 'G', '', '', '', '', '', '', '', 0),
(217, 'Can', 'Balance', '2025-04-28', '1002', '500gx12bls', '6', 2, 2, 'Cut_piece', '', '', '', '', '', '', '', 0),
(218, 'Can', 'Balance', '2025-04-28', '1003', '500G x12Bls', '6', 35, 35, 'Bls', '', '', '', '', '', '', '', 0),
(219, 'Can', 'Balance', '2025-04-28', '1017', '8up', '25', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(220, 'Can', 'Balance', '2025-04-28', '1017', '8up', '26', 5, 5, 'G', '', '', '', '', '', '', '', 0),
(221, 'Can', 'Balance', '2025-04-28', '1017', '8up', '27', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(222, 'Can', 'Balance', '2025-04-28', '1017', '7up', '24', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(223, 'Can', 'Balance', '2025-04-28', '1017', '9up', '19', 21, 21, 'G', '', '', '', '', '', '', '', 0),
(224, 'Can', 'Balance', '2025-04-28', '1017', '9up', '20', 7, 7, 'G', '', '', '', '', '', '', '', 0),
(225, 'Can', 'Balance', '2025-04-28', '1017', '9up', '18.5', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(226, 'Can', 'Balance', '2025-04-28', '1017', '9up', '20.5', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(227, 'Can', 'Balance', '2025-04-28', '1017', '10up', '22', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(228, 'Can', 'Balance', '2025-04-28', '1017', '10up', '23', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(229, 'Can', 'Balance', '2025-04-28', '1017', '10up', '21', 6, 6, 'G', '', '', '', '', '', '', '', 0),
(230, 'Can', 'Balance', '2025-04-28', '1017', '12up', '30', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(231, 'Can', 'Balance', '2025-04-28', '1020', '1.5up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(232, 'Can', 'Balance', '2025-04-28', '1020', '2up', '20', 56, 56, 'G', '', '', '', '', '', '', '', 0),
(233, 'Can', 'Balance', '2025-04-28', '1020', '2up', '21', 8, 8, 'G', '', '', '', '', '', '', '', 0),
(234, 'Can', 'Balance', '2025-04-28', '1020', '3up', '20', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(235, 'Can', 'Balance', '2025-04-28', '1020', '3up', '21', 17, 17, 'G', '', '', '', '', '', '', '', 0),
(236, 'Can', 'Balance', '2025-04-28', '1020', '3up', '22', 22, 22, 'G', '', '', '', '', '', '', '', 0),
(237, 'Can', 'Balance', '2025-04-28', '1020', '3up', '23', 10, 10, 'G', '', '', '', '', '', '', '', 0),
(238, 'Can', 'Balance', '2025-04-28', '1020', '4up', '22', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(239, 'Can', 'Balance', '2025-04-28', '1020', '4up', '23', 9, 9, 'G', '', '', '', '', '', '', '', 0),
(240, 'Can', 'Balance', '2025-04-28', '1020', '4up', '24', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(241, 'Can', 'Balance', '2025-04-28', '1020', '5up', '22', 6, 6, 'G', '', '', '', '', '', '', '', 0),
(242, 'Can', 'Balance', '2025-04-28', '1020', '5up', '23', 12, 12, 'G', '', '', '', '', '', '', '', 0),
(243, 'Can', 'Balance', '2025-04-28', '1020', '5up', '24', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(244, 'Can', 'Balance', '2025-04-28', '1020', '6up', '19', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(245, 'Can', 'Balance', '2025-04-28', '1020', '6up', '20', 5, 5, 'G', '', '', '', '', '', '', '', 0),
(246, 'Can', 'Balance', '2025-04-28', '1020', '6up', '21', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(247, 'Can', 'Balance', '2025-04-28', '1020', '7up', '22', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(248, 'Can', 'Balance', '2025-04-28', '1020', '7up', '23', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(249, 'Can', 'Balance', '2025-04-28', '1020', '7up', '24', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(250, 'Can', 'Balance', '2025-04-28', '1020', '7up', '22.5', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(251, 'Can', 'Balance', '2025-04-28', '1020', '5up', '23.5', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(252, 'Can', 'Balance', '2025-04-28', '1020', '8up', '25', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(253, 'Can', 'Balance', '2025-04-28', '1020', '8up', '26', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(254, 'Can', 'Balance', '2025-04-28', '1020', '9up', '20', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(255, 'Can', 'Balance', '2025-04-28', '1020', '10up', '23', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(256, 'Can', 'Balance', '2025-04-28', '1019', '500gx12bls', '6', 55, 55, 'Bls', '', '', '', '', '', '', '', 0),
(257, 'Can', 'Balance', '2025-04-28', '1019', '800g', '13.6', 30, 30, 'Bls', '', '', '', '', '', '', '', 0),
(258, 'Can', 'Balance', '2025-04-28', '1030', '800g', '20', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(259, 'Can', 'Balance', '2025-04-28', '1030', '1up', '20', 87, 87, 'G', '', '', '', '', '', '', '', 0),
(260, 'Can', 'Balance', '2025-04-28', '1030', '1.5up', '20', 100, 100, 'G', '', '', '', '', '', '', '', 0),
(261, 'Can', 'Balance', '2025-04-28', '1030', '1.5up', '21', 18, 18, 'G', '', '', '', '', '', '', '', 0),
(262, 'Can', 'Balance', '2025-04-28', '1030', '2up', '20', 20, 20, 'G', '', '', '', '', '', '', '', 0),
(263, 'Can', 'Balance', '2025-04-28', '1030', '2up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(264, 'Can', 'Balance', '2025-04-28', '1026', '5/8up', '20', 13, 13, 'G', '', '', '', '', '', '', '', 0),
(265, 'Can', 'Balance', '2025-04-28', '1026', '8/10up', '20', 6, 6, 'G', '', '', '', '', '', '', '', 0),
(266, 'Can', 'Balance', '2025-04-28', '1026', '1up', '20', 8, 8, 'G', '', '', '', '', '', '', '', 0),
(267, 'Can', 'Balance', '2025-04-28', '1026', '1.5up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(268, 'Can', 'Balance', '2025-04-28', '1026', '800g', '20', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(269, 'Can', 'Balance', '2025-04-28', '1026', '5/8up', '20', 21, 34, 'G', '', '', '', '', '', '', '', 0),
(270, 'Can', 'Balance', '2025-04-28', '1036', '5/8up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(271, 'Can', 'Balance', '2025-04-28', '1036', '1up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(272, 'Can', 'Balance', '2025-04-28', '1010', '500gx12bls', '6', 21, 21, 'Bls', '', '', '', '', '', '', '', 0),
(273, 'Can', 'Balance', '2025-04-28', '1015', '500gx12bls', '6', 100, 100, 'Bls', '', '', '', '', '', '', '', 0),
(274, 'Can', 'Balance', '2025-04-28', '1051', '2up', '20', 10, 10, 'G', '', '', '', '', '', '', '', 0),
(275, 'Can', 'Balance', '2025-04-28', '1051', '2up', '21', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(276, 'Can', 'Balance', '2025-04-28', '1021', '3up', '22', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(277, 'Can', 'Balance', '2025-04-28', '1035', '500gx12bls', '6', 39, 39, 'Bls', '', '', '', '', '', '', '', 0),
(278, 'LM', 'Balance', '2025-04-29', '1015', '3/5', '20', 151, 151, 'W', '', '', '', '', '', '', '', 0),
(279, 'LM', 'Balance', '2025-04-29', '1015', '5/8', '20', 47, 47, 'W', '', '', '', '', '', '', '', 0),
(280, 'LM', 'Balance', '2025-04-29', '1015', '7/8', '20', 25, 25, 'W', '', '', '', '', '', '', '', 0),
(281, 'LM', 'Balance', '2025-04-29', '1015', '8/10', '20', 135, 135, 'W', '', '', '', '', '', '', '', 0),
(282, 'LM', 'Balance', '2025-04-29', '1015', '1/2', '20', 66, 66, 'W', '', '', '', '', '', '', '', 0),
(283, 'LM', 'Balance', '2025-04-29', '1015', '1/2', '21', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(284, 'LM', 'Balance', '2025-04-29', '1015', '1/2', '22', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(285, 'LM', 'Balance', '2025-04-29', '1027', '5/8', '20', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(286, 'LM', 'Balance', '2025-04-29', '1027', '2up', '21', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(287, 'LM', 'Balance', '2025-04-29', '1027', 'Mix', '15', 4, 4, 'W', '', '', '', '', '', '', '', 0),
(288, 'LM', 'Balance', '2025-04-29', '1027', '3up', '21', 11, 11, 'W', '', '', '', '', '', '', '', 0),
(289, 'LM', 'Balance', '2025-04-29', '1027', '3up', '22', 5, 5, 'W', '', '', '', '', '', '', '', 0),
(290, 'LM', 'Balance', '2025-04-29', '1027', '3up', '20', 5, 5, 'W', '', '', '', '', '', '', '', 0),
(291, 'LM', 'Balance', '2025-04-29', '1027', '4up', '22.6', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(292, 'LM', 'Balance', '2025-04-29', '1027', '4up', '22', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(293, 'LM', 'Balance', '2025-04-29', '1027', '4up', '23', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(294, 'LM', 'Balance', '2025-04-29', '1021', '9up', '19', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(295, 'LM', 'Balance', '2025-04-29', '1025', 'IQF', '20', 74, 74, 'W', '', '', '', '', '', '', '', 0),
(296, 'LM', 'Balance', '2025-04-29', '1025', 'IQF', '15', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(297, 'LM', 'Balance', '2025-04-29', '1025', 'IQF', '16', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(298, 'LM', 'Balance', '2025-04-29', '1025', 'IQF', '23', 2, 2, 'W', '', '', '', '', '', '', '', 0),
(299, 'LM', 'Balance', '2025-04-29', '1025', 'IQF', '8', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(300, 'LM', 'Balance', '2025-04-29', '1026', '8/10up', '20', 43, 43, 'W', '', '', '', '', '', '', '', 0),
(301, 'LM', 'Balance', '2025-04-29', '1026', '5/8up', '20', 22, 22, 'W', '', '', '', '', '', '', '', 0),
(302, 'LM', 'Balance', '2025-04-29', '1043', 'IQF', '20', 177, 177, 'Cut_piece', '', '', '', '', '', '', '', 0),
(303, 'LM', 'Balance', '2025-04-29', '1043', 'IQF', '16', 1, 1, 'Cut_piece', '', '', '', '', '', '', '', 0),
(305, 'LM', 'Balance', '2025-04-29', '1043', 'IQF', '11.5', 1, 1, 'Cut_piece', '', '', '', '', '', '', '', 0),
(306, 'LM', 'Balance', '2025-04-29', '1043', 'IQF', '22', 1, 1, 'Cut_piece', '', '', '', '', '', '', '', 0),
(307, 'LM', 'Balance', '2025-04-29', '1043', '1D', '20', 14, 14, 'Cut_piece', '', '', '', '', '', '', '', 0),
(308, 'LM', 'Balance', '2025-04-29', '1043', '1D', '16', 1, 1, 'Cut_piece', '', '', '', '', '', '', '', 0),
(313, 'LM', 'Balance', '2025-04-29', '1043', 'IQF', '21', 1, 1, 'Cut_piece', '', '', '', '', '', '', '', 0),
(314, 'LM', 'Balance', '2025-04-29', '1043', 'IQF', '15', 1, 3, 'Cut_piece', '', '', '', '', '', '', '', 0),
(315, 'LM', 'Balance', '2025-04-29', '1043', '200/300', '20', 6, 6, 'Cut_piece', '', '', '', '', '', '', '', 0),
(316, 'LM', 'Balance', '2025-04-29', '1043', 'IQF', '17.6', 1, 1, 'Cut_piece', '', '', '', '', '', '', '', 0),
(317, 'LM', 'Balance', '2025-04-29', '1043', 'IQF', '12.7', 1, 1, 'Cut_piece', '', '', '', '', '', '', '', 0),
(318, 'LM', 'Balance', '2025-04-29', '1043', 'IQF', '10.5', 1, 1, 'Cut_piece', '', '', '', '', '', '', '', 0),
(319, 'LM', 'Balance', '2025-04-29', '1043', 'IQF', '20.6', 1, 1, 'Cut_piece', '', '', '', '', '', '', '', 0),
(320, 'LM', 'Balance', '2025-04-29', '1043', '3/4', '20', 33, 33, 'Cut_piece', '', '', '', '', '', '', '', 0),
(321, 'LM', 'Balance', '2025-04-29', '1043', '3/4', '18.8', 1, 1, 'Cut_piece', '', '', '', '', '', '', '', 0),
(322, 'LM', 'Balance', '2025-04-29', '1043', '3/4', '12', 1, 1, 'Cut_piece', '', '', '', '', '', '', '', 0),
(323, 'LM', 'Balance', '2025-04-29', '1043', '3/4', '14', 1, 1, 'Cut_piece', '', '', '', '', '', '', '', 0),
(324, 'LM', 'Balance', '2025-04-29', '1043', '2/3', '23.5', 1, 1, 'Cut_piece', '', '', '', '', '', '', '', 0),
(325, 'LM', 'Balance', '2025-04-29', '1043', 'Mix', '20', 4, 8, 'Cut_piece', '', '', '', '', '', '', '', 0),
(326, 'LM', 'Balance', '2025-04-29', '1043', 'IQF', '14', 1, 1, 'Cut_piece', '', '', '', '', '', '', '', 0),
(327, 'LM', 'Balance', '2025-04-29', '1043', '100/200', '20', 107, 107, 'Cut_piece', '', '', '', '', '', '', '', 0),
(328, 'LM', 'Balance', '2025-04-29', '1043', 'IQF(100/200', '14', 2, 2, 'Cut_piece', '', '', '', '', '', '', '', 0),
(329, 'LM', 'Balance', '2025-04-29', '1024', '4up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(330, 'LM', 'Balance', '2025-04-29', '1024', '4up', '23', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(331, 'LM', 'Balance', '2025-04-29', '1024', '4up', '24', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(332, 'LM', 'Balance', '2025-04-29', '1030', '8/10up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(333, 'LM', 'Balance', '2025-04-29', '1030', '1up', '20', 29, 29, 'G', '', '', '', '', '', '', '', 0),
(334, 'LM', 'Balance', '2025-04-29', '1030', '1.5up', '20', 46, 46, 'G', '', '', '', '', '', '', '', 0),
(335, 'LM', 'Balance', '2025-04-29', '1030', '1.5up', '21', 8, 8, 'G', '', '', '', '', '', '', '', 0),
(336, 'LM', 'Balance', '2025-04-29', '1030', '2up', '20.5', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(337, 'LM', 'Balance', '2025-04-29', '1030', '2up', '20', 24, 24, 'G', '', '', '', '', '', '', '', 0),
(338, 'LM', 'Balance', '2025-04-29', '1023', '2up', '20', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(339, 'LM', 'Balance', '2025-04-29', '1023', '2up', '18.6', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(340, 'LM', 'Balance', '2025-04-29', '1028', 'JB', '11.8', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(341, 'LM', 'Balance', '2025-04-29', '1028', 'JB', '7.5', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(342, 'LM', 'Balance', '2025-04-29', '1031', '5up', '22', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(343, 'LM', 'Balance', '2025-04-29', '1037', '60/80', '20', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(344, 'LM', 'Balance', '2025-04-29', '1037', '60/80', '10.3', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(345, 'LM', 'Balance', '2025-04-29', '1037', '80/100', '20', 132, 132, 'W', '', '', '', '', '', '', '', 0),
(346, 'LM', 'Balance', '2025-04-29', '1037', '80/100', '17.8', 2, 2, 'W', '', '', '', '', '', '', '', 0),
(347, 'LM', 'Balance', '2025-04-29', '1037', '150/200', '20', 5, 5, 'W', '', '', '', '', '', '', '', 0),
(348, 'LM', 'Balance', '2025-04-29', '1037', '100/150', '20', 70, 70, 'W', '', '', '', '', '', '', '', 0),
(349, 'LM', 'Balance', '2025-04-29', '1037', '100/150', '21', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(350, 'LM', 'Balance', '2025-04-29', '1037', '100/150', '11', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(351, 'LM', 'Balance', '2025-04-29', '1037', '100/200', '20', 228, 228, 'W', '', '', '', '', '', '', '', 0),
(352, 'LM', 'Balance', '2025-04-29', '1037', '100/200', '21', 4, 4, 'W', '', '', '', '', '', '', '', 0),
(353, 'LM', 'Balance', '2025-04-29', '1037', '100/200', '10.5', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(354, 'LM', 'Balance', '2025-04-29', '1037', '100/200', '22', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(355, 'LM', 'Balance', '2025-04-29', '1037', '200/300', '10.6', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(356, 'LM', 'Balance', '2025-04-29', '1037', '80/100', '21', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(357, 'LM', 'Balance', '2025-04-29', '1037', '80/100', '18', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(358, 'LM', 'Balance', '2025-04-29', '1037', 'Mix', '20', 36, 36, 'W', '', '', '', '', '', '', '', 0),
(359, 'LM', 'Balance', '2025-04-29', '1037', 'Mix', '24', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(360, 'LM', 'Balance', '2025-04-29', '1037', '100/150', '20.7', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(361, 'LM', 'Balance', '2025-04-29', '1037', '100/200', '10.3', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(362, 'LM', 'Balance', '2025-04-29', '1037', '100/200', '20.4', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(363, 'LM', 'Balance', '2025-04-29', '1045', '2up', '20', 5, 5, 'G', '', '', '', '', '', '', '', 0),
(364, 'LM', 'Balance', '2025-04-29', '1045', '2up', '21', 6, 6, 'G', '', '', '', '', '', '', '', 0),
(365, 'LM', 'Balance', '2025-04-29', '1045', '3up', '21', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(366, 'LM', 'Balance', '2025-04-29', '1045', '3up', '22', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(367, 'LM', 'Balance', '2025-04-29', '1045', '4up', '20', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(368, 'LM', 'Balance', '2025-04-29', '1045', '4up', '23', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(369, 'LM', 'Balance', '2025-04-29', '1045', '4up', '22', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(370, 'LM', 'Balance', '2025-04-29', '1045', '4up', '24', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(371, 'LM', 'Balance', '2025-04-29', '1045', '5up', '22', 8, 8, 'G', '', '', '', '', '', '', '', 0),
(372, 'LM', 'Balance', '2025-04-29', '1045', '5up', '23', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(373, 'LM', 'Balance', '2025-04-29', '1045', '6up', '19', 5, 5, 'G', '', '', '', '', '', '', '', 0),
(374, 'LM', 'Balance', '2025-04-29', '1045', '6up', '20', 7, 7, 'G', '', '', '', '', '', '', '', 0),
(375, 'LM', 'Balance', '2025-04-29', '1045', '7up', '22', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(376, 'LM', 'Balance', '2025-04-29', '1045', '7up', '23', 6, 6, 'G', '', '', '', '', '', '', '', 0),
(377, 'LM', 'Balance', '2025-04-29', '1045', '7up', '24', 4, 4, 'G', '', '', '', '', '', '', '', 0),
(378, 'LM', 'Balance', '2025-04-29', '1045', '8up', '25', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(379, 'LM', 'Balance', '2025-04-29', '1045', '8up', '27', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(380, 'LM', 'Balance', '2025-04-29', '1045', '8up', '26', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(381, 'LM', 'Balance', '2025-04-29', '1045', '9up', '19', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(382, 'LM', 'Balance', '2025-04-29', '1045', '10up', '21', 6, 6, 'G', '', '', '', '', '', '', '', 0),
(383, 'LM', 'Balance', '2025-04-29', '1045', '10up', '22', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(384, 'LM', 'Balance', '2025-04-29', '1045', '10up', '24', 2, 2, 'G', '', '', '', '', '', '', '', 0),
(385, 'LM', 'Balance', '2025-04-29', '1045', '10up', '23', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(386, 'LM', 'Balance', '2025-04-29', '1045', '12up', '30.1', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(387, 'LM', 'Balance', '2025-04-29', '1045', '12up', '28.6', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(388, 'LM', 'Balance', '2025-04-29', '1045', '12up', '27.7', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(389, 'LM', 'Balance', '2025-04-29', '1016', '8/10', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(390, 'LM', 'Balance', '2025-04-29', '1016', '1up', '18', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(391, 'LM', 'Balance', '2025-04-29', '1029', '1.5up', '21', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(392, 'LM', 'Balance', '2025-04-29', '1029', '1.5up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(394, 'LM', 'Balance', '2025-04-29', '1008', '3up', '21', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(395, 'LM', 'Balance', '2025-04-29', '1008', '3up', '22', 2, 2, 'Scaless', '', '', '', '', '', '', '', 0),
(396, 'LM', 'Balance', '2025-04-29', '1008', '5up', '23', 2, 2, 'Scaless', '', '', '', '', '', '', '', 0),
(397, 'LM', 'Balance', '2025-04-29', '1008', '5up', '22', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(398, 'LM', 'Balance', '2025-04-29', '1008', '2up', '20', 3, 3, 'Scaless', '', '', '', '', '', '', '', 0),
(399, 'LM', 'Balance', '2025-04-29', '1008', '1up', '20', 5, 5, 'Scaless', '', '', '', '', '', '', '', 0),
(400, 'LM', 'Balance', '2025-04-29', '1008', '5/8', '16.6', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(401, 'LM', 'Balance', '2025-04-29', '1008', '4up', '22', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(402, 'LM', 'Balance', '2025-04-29', '1008', '4up', '24', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(403, 'LM', 'Balance', '2025-04-29', '1008', '4up', '23', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(404, 'LM', 'Balance', '2025-04-29', '1008', '6up', '19', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(405, 'LM', 'Balance', '2025-04-29', '1008', '6up', '21', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(406, 'LM', 'Balance', '2025-04-29', '1008', '6up', '21.6', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(407, 'LM', 'Balance', '2025-04-29', '1008', '6up', '20', 2, 2, 'Scaless', '', '', '', '', '', '', '', 0),
(408, 'LM', 'Balance', '2025-04-29', '1008', '4up', '20', 1, 1, 'Scaless', '', '', '', '', '', '', '', 0),
(409, 'LM', 'Balance', '2025-04-29', '1017', '4up', '20', 1, 1, 'G', '', '', '', '', '', '', '', 0),
(410, 'LM', 'Balance', '2025-04-29', '1017', '4up', '24', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(411, 'LM', 'Balance', '2025-04-29', '1017', '5up', '21', 3, 3, 'G', '', '', '', '', '', '', '', 0),
(412, 'LM', 'Balance', '2025-04-29', '1015', '8/10', '26.1', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(413, 'LM', 'Balance', '2025-04-29', '1015', '12/15up', '20', 1067, 1067, 'W', '', '', '', '', '', '', '', 0),
(414, 'LM', 'Balance', '2025-04-29', '1015', '12/15up', '21', 209, 209, 'W', '', '', '', '', '', '', '', 0),
(415, 'LM', 'Balance', '2025-04-29', '1015', '12/15up', '19.8', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(416, 'LM', 'Balance', '2025-04-29', '1015', '12/15up', '20.9', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(417, 'LM', 'Balance', '2025-04-29', '1015', '12/15up', '19.7', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(418, 'LM', 'Balance', '2025-04-29', '1015', '12/15up', '16.4', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(419, 'LM', 'Balance', '2025-04-29', '1015', '12/15up', '22.4', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(420, 'LM', 'Balance', '2025-04-29', '1015', '12/15up', '22.1', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(421, 'LM', 'Balance', '2025-04-29', '1015', '15/20up', '20', 904, 904, 'W', '', '', '', '', '', '', '', 0),
(422, 'LM', 'Balance', '2025-04-29', '1015', '15/20up', '21', 314, 314, 'W', '', '', '', '', '', '', '', 0),
(423, 'LM', 'Balance', '2025-04-29', '1015', '15/20up', '19.7', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(424, 'LM', 'Balance', '2025-04-29', '1015', '18up', '20', 177, 177, 'W', '', '', '', '', '', '', '', 0),
(425, 'LM', 'Balance', '2025-04-29', '1015', '18up', '21', 105, 105, 'W', '', '', '', '', '', '', '', 0),
(426, 'LM', 'Balance', '2025-04-29', '1015', '18up', '20.7', 2, 2, 'W', '', '', '', '', '', '', '', 0),
(427, 'LM', 'Balance', '2025-04-29', '1015', '18up', '18.8', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(428, 'LM', 'Balance', '2025-04-29', '1015', '18up', '20.5', 2, 2, 'W', '', '', '', '', '', '', '', 0),
(429, 'LM', 'Balance', '2025-04-29', '1015', '18up', '21.5', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(430, 'LM', 'Balance', '2025-04-29', '1015', '2up', '20', 18, 18, 'W', '', '', '', '', '', '', '', 0),
(431, 'LM', 'Balance', '2025-04-29', '1015', '2up', '21', 3, 3, 'W', '', '', '', '', '', '', '', 0),
(432, 'LM', 'Balance', '2025-04-29', '1015', '2up', '20.6', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(433, 'LM', 'Balance', '2025-04-29', '1015', '2up', '21.8', 1, 1, 'W', '', '', '', '', '', '', '', 0),
(434, 'LM', 'Balance', '2025-04-29', '1015', '15/20up', '20.4', 1, 1, 'W', '', '', '', '', '', '', '', 0);

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
(2, 'Can', 'From From-10', '2025-04-28', '1023', '2up', '20', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(4, 'Can', 'From From-10', '2025-04-28', '1023', '2up', '21', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(5, 'Can', 'From From-10 nt', '2025-04-28', '1023', '3up', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(6, 'Can', 'From From-10 nt', '2025-04-28', '1023', '3up', '21', 7, 7, '', '', 0, '', '', 0, '', 'G'),
(7, 'Can', 'From From-10 nt', '2025-04-28', '1023', '3up', '22', 12, 12, '', '', 0, '', '', 0, '', 'G'),
(8, 'Can', 'From From-10 nt', '2025-04-28', '1023', '3up', '22.5', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(9, 'Can', 'From From-10 nt', '2025-04-28', '1023', '4up', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(10, 'Can', 'From From-10 nt', '2025-04-28', '1023', '4up', '21', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(11, 'Can', 'From From-10 nt', '2025-04-28', '1023', '4up', '22', 19, 19, '', '', 0, '', '', 0, '', 'G'),
(12, 'Can', 'From From-10 nt', '2025-04-28', '1023', '4up', '23', 9, 9, '', '', 0, '', '', 0, '', 'G'),
(13, 'Can', 'From From-10 nt', '2025-04-28', '1023', '5up', '21', 3, 3, '', '', 0, '', '', 0, '', 'G'),
(14, 'Can', 'From From-10 nt', '2025-04-28', '1023', '5up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(15, 'lm', 'From From-10 nt', '2025-04-28', '1031', '500g x 24 b', '12', 32, 32, '', '', 0, '', '', 0, '', 'Cut_piece'),
(16, 'lm', 'From From-10 ', '2025-04-28', '1031', '500g x 21bl', '10.5', 1, 1, '', '', 0, '', '', 0, '', 'Cut_piece'),
(17, 'Can', 'From From-10 ', '2025-04-29', '1023', '2up', '20', 17, 19, '', '', 0, '', '', 0, '', 'G'),
(18, 'Can', 'From From-10 ', '2025-04-29', '1023', '2up', '21', 11, 13, '', '', 0, '', '', 0, '', 'G'),
(19, 'Can', 'From From-10 ', '2025-04-29', '1023', '3up', '22', 15, 27, '', '', 0, '', '', 0, '', 'G'),
(21, 'Can', 'From From-10 ', '2025-04-29', '1023', '3up', '21', 31, 38, '', '', 0, '', '', 0, '', 'G'),
(22, 'Can', 'From From-10 ', '2025-04-29', '1023', '3up', '20', 2, 3, '', '', 0, '', '', 0, '', 'G'),
(23, 'Can', 'From From-10 ', '2025-04-29', '1023', '4up', '22', 2, 21, '', '', 0, '', '', 0, '', 'G'),
(24, 'Can', 'From From-10 ', '2025-04-29', '1023', '4up', '21', 3, 5, '', '', 0, '', '', 0, '', 'G'),
(25, 'NY', 'balance', '2025-04-30', '1023', '2up', '20', 4, 4, '', '', 0, '', '', 0, '', 'G'),
(26, 'NY', 'balance', '2025-04-30', '1023', '2up', '21', 11, 11, '', '', 0, '', '', 0, '', 'G'),
(27, 'NY', 'balance', '2025-04-30', '1023', '3up', '22', 41, 41, '', '', 0, '', '', 0, '', 'G'),
(28, 'NY', 'balance', '2025-04-30', '1023', '3up', '23', 10, 10, '', '', 0, '', '', 0, '', 'G'),
(29, 'NY', 'balance', '2025-04-30', '1023', '3up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(30, 'NY', 'balance', '2025-04-30', '1023', '4up', '21', 6, 6, '', '', 0, '', '', 0, '', 'G'),
(31, 'NY', 'balance', '2025-04-30', '1023', '4up', '22', 26, 26, '', '', 0, '', '', 0, '', 'G'),
(32, 'Can', 'balance', '2025-04-30', '1015', '500g x 24 b', '12', 28, 28, '', '', 0, '', '', 0, '', 'G'),
(33, 'LM', 'balance', '2025-04-30', '1015', '500g x 16bl', '8', 1, 1, '', '', 0, '', '', 0, '', 'Cut_piece'),
(34, 'LM', 'balance', '2025-04-30', '1002', '500g x 24bl', '12', 2, 2, '', '', 0, '', '', 0, '', 'Cut_piece'),
(35, 'LM', 'balance', '2025-04-30', '1031', '500g x 17bl', '8.5', 1, 1, '', '', 0, '', '', 0, '', 'Cut_piece'),
(36, 'can', 'balance', '2025-04-28', '1017', '2up', '20', 9, 9, '', '', 0, '', '', 0, '', 'G'),
(37, 'can', 'balance', '2025-04-28', '1017', '2up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(38, 'can', 'balance', '2025-04-28', '1017', '3up', '21', 24, 24, '', '', 0, '', '', 0, '', 'G'),
(39, 'can', 'balance', '2025-04-28', '1017', '3up', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(40, 'can', 'balance', '2025-04-28', '1017', '3up', '22', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(41, 'can', 'balance', '2025-04-28', '1017', '4up', '23', 3, 3, '', '', 0, '', '', 0, '', 'G'),
(42, 'can', 'balance', '2025-04-28', '1017', '4up', '22', 2, 2, '', '', 0, '', '', 0, '', 'G');

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
(1050, 'Baby Koral'),
(1051, 'River Pangush');

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
(57, '8x27 (8)', '8x27 (8)', 'Lb'),
(58, '7 3/4*12 (8)', '7 3/4*12 (8)\r\n', 'Lb'),
(59, '5x15 (8)', '5x15 (8)\r\n', 'Lb'),
(60, '64x20(8)', '64x20(8)\r\n', 'Lb'),
(61, '7x23(8)', '7x23(8)\r\n', 'Lb'),
(62, 'Logo Sticker SAF', 'Logo Sticker SAF\r\n', 'pcs'),
(63, 'Logo Sticker Rose', 'Logo Sticker Rose\r\n', 'pcs'),
(64, 'Rose paper box (500g)', 'Rose paper box (500g)', 'pcs'),
(65, '8x17 1/2 (22)', '8x17 1/2 (22)\r\n', 'Lb'),
(66, '7 1/2x11(22)', '7 1/2x11(22)\r\n', 'Lb'),
(67, '7 1/2x17(22)', '7 1/2x17(22)\r\n', 'Lb'),
(68, '9x15(22F)', '9x15(22F)\r\n', 'lb');

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
(5, '2025-03-24', '4000/T23', '13091', 37913000, '0000-00-00', '', '', 0, 37913000, 5, 0, '0000-00-00'),
(6, '2025-04-01', '4000/001', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 47389150, '0000-00-00'),
(7, '2025-04-01', '4000/A03', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 321325350, '0000-00-00'),
(8, '2025-04-01', '4000/A06', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 85468550, '0000-00-00'),
(9, '2025-04-01', '4000/A01', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 163037025, '0000-00-00'),
(10, '2025-04-01', '4000/A19', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 59930600, '0000-00-00'),
(11, '2025-04-01', '4000/A07', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 39229800, '0000-00-00'),
(12, '2025-04-01', '4000/B01', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 29099465, '0000-00-00'),
(13, '2025-04-01', '4000/C03', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 55497325, '0000-00-00'),
(14, '2025-04-01', '4000/N01', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 24621900, '0000-00-00'),
(15, '2025-04-01', '4000/N04', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 14897900, '0000-00-00'),
(16, '2025-04-01', '4000/P05', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 95525700, '0000-00-00'),
(17, '2025-04-01', '4000/P01', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 29413150, '0000-00-00'),
(18, '2025-04-01', '4000/S03', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 220472876, '0000-00-00'),
(19, '2025-04-01', '4000/S04', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 163162650, '0000-00-00'),
(20, '2025-04-01', '4000/S01', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 79008150, '0000-00-00'),
(21, '2025-04-01', '4000/S06', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 425863820, '0000-00-00'),
(22, '2025-04-01', '4000/T07', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 10000000, '0000-00-00'),
(23, '2025-04-01', '4000/T05', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 222942798, '0000-00-00'),
(24, '2025-04-01', '4000/T11', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 567858275, '0000-00-00'),
(25, '2025-04-01', '4000/T17', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 142021845, '0000-00-00'),
(26, '2025-04-01', '4000/T19', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 134583800, '0000-00-00'),
(27, '2025-04-01', '4000/T03', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 50724525, '0000-00-00'),
(28, '2025-04-01', '4000/T01', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 40990550, '0000-00-00'),
(29, '2025-04-01', '4000/T02', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 38059100, '0000-00-00'),
(30, '2025-04-01', '4000/K16', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 17310400, '0000-00-00'),
(31, '2025-04-01', '4000/K07', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 139611400, '0000-00-00'),
(32, '2025-04-01', '4000/K05', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 731601650, '0000-00-00'),
(33, '2025-04-01', '4000/W01', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 21698175, '0000-00-00'),
(34, '2025-04-01', '4000/Y01', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 43628000, '0000-00-00'),
(35, '2025-04-01', '4000/Z03', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 20257925, '0000-00-00'),
(36, '2025-04-01', '4000/G03', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 1212000, '0000-00-00'),
(37, '2025-04-01', '4000/M04', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 10765260, '0000-00-00'),
(38, '2025-04-01', '4000/P03', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 2220500, '0000-00-00'),
(39, '2025-04-01', '4000/H03', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 10521788, '0000-00-00'),
(40, '2025-04-01', '4000/G01', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 339628, '0000-00-00'),
(41, '2025-04-01', '4000/A24', '', 0, '0000-00-00', '', 'Opening Balance', 0, 0, 0, 26611, '0000-00-00'),
(42, '2025-04-05', '4000/s03', '13090', 609000, '0000-00-00', '', '', 0, 609000, 6, 0, '0000-00-00'),
(43, '2025-04-05', '4000/s03', '13090', 20047500, '0000-00-00', '', '', 0, 20656500, 7, 0, '0000-00-00'),
(44, '2025-04-05', '4000/s03', '13090', 6396000, '0000-00-00', '', '', 0, 27052500, 8, 0, '0000-00-00'),
(45, '2025-04-05', '4000/s03', '13090', 357500, '0000-00-00', '', '', 0, 27410000, 9, 0, '0000-00-00'),
(46, '2025-04-19', '4000/a01', '13092', 215900, '0000-00-00', '', '', 0, 215900, 10, 0, '0000-00-00'),
(47, '2025-04-19', '4000/a01', '13092', 144000, '0000-00-00', '', '', 0, 359900, 11, 0, '0000-00-00'),
(48, '2025-04-19', '4000/a01', '13092', 53300, '0000-00-00', '', '', 0, 413200, 12, 0, '0000-00-00'),
(49, '2025-04-19', '4000/a01', '13092', 54900, '0000-00-00', '', '', 0, 468100, 13, 0, '0000-00-00'),
(50, '2025-04-19', '4000/a01', '13092', 330600, '0000-00-00', '', '', 0, 798700, 14, 0, '0000-00-00'),
(51, '2025-04-25', '4000/s03', '13093', 926500, '0000-00-00', '', '', 0, 28336500, 15, 0, '0000-00-00'),
(52, '2025-04-25', '4000/s03', '13093', 2250000, '0000-00-00', '', '', 0, 30586500, 16, 0, '0000-00-00'),
(53, '2025-04-26', '4000/s03', '13094', 881550, '0000-00-00', '', '', 0, 31468050, 17, 0, '0000-00-00'),
(54, '2025-04-26', '4000/s03', '13094', 8878400, '0000-00-00', '', '', 0, 40346450, 18, 0, '0000-00-00'),
(55, '2025-04-26', '4000/s03', '13094', 2524950, '0000-00-00', '', '', 0, 42871400, 19, 0, '0000-00-00'),
(56, '2025-04-27', '4000/t11', '13095', 63000, '0000-00-00', '', '', 0, 63000, 20, 0, '0000-00-00'),
(57, '2025-04-28', '4000/n04', '13096', 4914700, '0000-00-00', '', '', 0, 4914700, 21, 0, '0000-00-00'),
(58, '2025-04-28', '4000/t02', '13097', 2046800, '0000-00-00', '', '', 0, 2046800, 22, 0, '0000-00-00'),
(59, '2025-04-28', '4000/s03', '13098', 7387200, '0000-00-00', '', '', 0, 50258600, 23, 0, '0000-00-00'),
(60, '2025-04-28', '4000/s03', '13098', 7185800, '0000-00-00', '', '', 0, 57444400, 24, 0, '0000-00-00'),
(61, '2025-04-28', '4000/b01', '13099', 3759525, '0000-00-00', '', '', 0, 3759525, 25, 0, '0000-00-00'),
(62, '2025-04-28', '4000/b01', '13099', 2874700, '0000-00-00', '', '', 0, 6634225, 26, 0, '0000-00-00'),
(63, '0000-00-00', '4000/k07', '31350548', 0, '2025-04-03', 'Dr-Apr\'25/047', 'Paid to KMM for Vr.12924\r\n', 20000000, 119611400, 0, 0, '0000-00-00'),
(64, '0000-00-00', '4000/t05', '452529763', 0, '2025-04-03', 'Dr-Apr\'25/048', 'Paid to Thet Oo for Vr.12702,12758\r\n', 20000000, 202942798, 0, 0, '0000-00-00'),
(65, '0000-00-00', '4000/k05', '279413712', 0, '2025-04-03', 'Dr-Apr\'25/049', 'Paid to Kyaw Zay Ya for Vr.12448\r\n', 30000000, 701601650, 0, 0, '0000-00-00'),
(66, '0000-00-00', '4000/t11', '429332600', 0, '2025-04-03', 'Dr-Apr\'25/050', 'Paid to Tun Zaw Min for Vr.12636,12646,12652\r\n', 30000000, 537921275, 0, 0, '0000-00-00'),
(67, '0000-00-00', '4000/G03', '115539510', 0, '2025-04-04', 'Dr-Apr\'25/051', 'Paid to Plastic (Golden Fish) for 29.3.25,1.4.25,2.4.25\r\n', 2694600, -1482600, 0, 0, '0000-00-00'),
(68, '0000-00-00', '4000/G01', '504603909', 0, '2025-04-08', 'Dr-Apr\'25/105', 'Paid to GFC Cold Store Charges\r\n', 10000000, -9660372, 0, 0, '0000-00-00'),
(69, '0000-00-00', '4000/k05', '562375586', 0, '2025-04-09', 'Dr-Apr\'25/128', 'Paid to Kyaw Zay Ya For Vr no-12448,12466\r\n', 50000000, 1383203300, 0, 0, '0000-00-00'),
(70, '0000-00-00', '4000/m04', '835702979', 0, '2025-04-10', 'Dr-Apr\'25/138', 'Paid to MMMO For Vr Date-27.2,20.3,25.3(2)\r\n', 6000000, 4765260, 0, 0, '0000-00-00'),
(71, '0000-00-00', '4000/n01', '275511524', 0, '2025-04-10', 'Dr-Apr\'25/142', 'Paid to Nanda For Vr no-12922\r\n', 3000000, 21621900, 0, 0, '0000-00-00'),
(72, '0000-00-00', '4000/t23', '389312018', 0, '2025-04-10', 'Dr-Apr\'25/143', 'Paid to Thin Zar For Vr-13091\r\n', 2000000, 35913000, 0, 0, '0000-00-00'),
(73, '0000-00-00', '4000/p03', '172332390', 0, '2025-04-10', 'Dr-Apr\'25/144', 'Paid to Pan Thazin For Vr Date-28.3,4.4,5.4\r\n', 5000000, -2779500, 0, 0, '0000-00-00'),
(74, '0000-00-00', '4000/G03', '948500065', 0, '2025-04-10', 'Dr-Apr\'25/145', 'Paid to Golden Fish For Vr Date-6.4.25\r\n', 756000, -1026600, 0, 0, '0000-00-00'),
(75, '0000-00-00', '4000/t19', '818782268', 0, '2025-04-10', 'Dr-Apr\'25/146', 'Paid to Tin Hlaing For Vr no-12597,12599\r\n', 15000000, 119583800, 0, 0, '0000-00-00'),
(76, '0000-00-00', '4000/A03', '715506252', 0, '2025-04-10', 'Dr-Apr\'25/147', 'Paid to Aung Naing Oo For Vr no-12837,12856,12861\r\n', 15000000, 306325350, 0, 0, '0000-00-00'),
(77, '0000-00-00', '4000/k07', '513850227', 0, '2025-04-10', 'Dr-Apr\'25/148', 'Paid to Khin Maung Myint For Vr no-12924\r\n', 20000000, 239222800, 0, 0, '0000-00-00'),
(78, '0000-00-00', '4000/n04', '663297941', 0, '2025-04-10', 'Dr-Apr\'25/149', 'Paid to Nyan Tun For Vr no-13051,13054,13061,13063,13068\r\n', 8897900, 10914700, 0, 0, '0000-00-00'),
(79, '0000-00-00', '4000/p01', '923654466', 0, '2025-04-10', 'Dr-Apr\'25/150', 'Paid to Phone Naing For Vr no-12934,12986\r\n', 5000000, 24413150, 0, 0, '0000-00-00'),
(80, '0000-00-00', '4000/p04', '317900069', 0, '2025-04-10', 'Dr-Apr\'25/151', 'Paid to Promise For Vr Date-24.11,28.11,30.11\r\n', 1510000, 0, 0, 0, '0000-00-00'),
(81, '0000-00-00', '4000/A03', '453040406', 0, '2025-04-01', 'Dr-Apr\'25/011', 'Paid to ANO for Vr.12816,12820,12821,12831,12837 (Ch No.206424)\r\n\r\n', 20000000, 607650700, 0, 0, '0000-00-00'),
(82, '0000-00-00', '4000/A19', '637566071', 0, '2025-04-01', 'Dr-Apr\'25/012', 'Paid to Aye Aye Maw for Vr.12911 (Ch No.206425)\r\n', 7000000, 52930600, 0, 0, '0000-00-00'),
(83, '0000-00-00', '4000/k16', '127859128', 0, '2025-04-01', 'Dr-Apr\'25/013', ' Paid to Kyaw Min Latt for Vr.12869,12877 (Ch No.221601) \r\n', 5000000, 12310400, 0, 0, '0000-00-00'),
(84, '0000-00-00', '4000/t07', '731037739', 0, '2025-04-01', 'Dr-Apr\'25/014', 'Paid to Thaung Tun for Vr.12896,12902,12929,13042 (Ch No.221604)\r\n', 10000000, 0, 0, 0, '0000-00-00'),
(85, '0000-00-00', '4000/S06', '168436935', 0, '2025-04-01', 'Dr-Apr\'25/015', 'Paid to Soe Thein for Vr.12596 (Ch No.221605)\r\n', 20000000, 405863820, 0, 0, '0000-00-00'),
(86, '0000-00-00', '4000/k05', '282271822', 0, '2025-04-01', 'Dr-Apr\'25/016', 'Paid to Kyaw Zay Ya for Vr. (Ch No.221606)\r\n', 30000000, 2084804950, 0, 0, '0000-00-00'),
(87, '0000-00-00', '4000/A01', '633584848', 0, '2025-04-01', 'Dr-Apr\'25/017', 'Paid to AK for Vr.12785 (Ch No.221607)\r\n', 10000000, 153835725, 0, 0, '0000-00-00'),
(88, '0000-00-00', '4000/t11', '646600642', 0, '2025-04-01', 'Dr-Apr\'25/018', 'Paid to Tun Zaw Min for Vr.12623,12636 (Ch No.221608)\r\n', 25000000, 1080779550, 0, 0, '0000-00-00'),
(89, '0000-00-00', '4000/C03', '831847898', 0, '2025-04-01', 'Dr-Apr\'25/019', 'Paid to Chit Ko for Vr.12905 (Ch No.221613)\r\n', 5000000, 50497325, 0, 0, '0000-00-00'),
(90, '0000-00-00', '4000/N04', '590371884', 0, '2025-04-01', 'Dr-Apr\'25/020', 'Paid to Nyan Tun for Vr.13048,13051 (Ch No.221614)\r\n', 6000000, 19812600, 0, 0, '0000-00-00'),
(91, '0000-00-00', '4000/001', '289979490', 0, '2025-04-01', 'Dr-Apr\'25/021', 'Paid to 4 Zaw for Vr.12913 (Ch No.221615)\r\n', 5000000, 42389150, 0, 0, '0000-00-00'),
(92, '0000-00-00', '4000/t02', '455210539', 0, '2025-04-01', 'Dr-Apr\'25/022', 'Paid to Thein Htay for Vr.13023,13028 (Ch No.221609)\r\n', 10000000, 30105900, 0, 0, '0000-00-00'),
(93, '0000-00-00', '4000/t03', '552293161', 0, '2025-04-01', 'Dr-Apr\'25/023', 'Paid to Thin Thin Yee for Vr.12789\r\n', 7000000, 43724525, 0, 0, '0000-00-00'),
(94, '0000-00-00', '4000/S01', '157241754', 0, '2025-04-01', 'Dr-Apr\'25/024', 'Paid to Shwe Late for Vr.12730 (Ch No.221611)\r\n', 7000000, 72008150, 0, 0, '0000-00-00'),
(95, '0000-00-00', '4000/t01', '274856890', 0, '2025-04-01', 'Dr-Apr\'25/025', 'Paid to Thet Paing for Vr.12910,12937 (Ch No.221612)\r\n', 7000000, 33990550, 0, 0, '0000-00-00'),
(96, '0000-00-00', '4000/s04', '92328287', 0, '2025-04-01', 'Dr-Apr\'25/026', 'Paid to Si Thu for Vr.12622,12669 (Ch No.221616)\r\n', 7000000, 156162650, 0, 0, '0000-00-00'),
(97, '0000-00-00', '4000/y01', '122857456', 0, '2025-04-01', 'Dr-Apr\'25/027', 'Paid to Ye Yint for Vr.12517,12568 (Ch No.221617)\r\n', 5000000, 38628000, 0, 0, '0000-00-00'),
(98, '0000-00-00', '4000/S06', '933143205', 0, '2025-04-01', 'Dr-Apr\'25/028', 'Paid to Soe Thein for Vr.12596 (Ch No.221618)\r\n', 10000000, 821727640, 0, 0, '0000-00-00'),
(99, '0000-00-00', '4000/A07', '369999077', 0, '2025-04-01', 'Dr-Apr\'25/029', 'Paid to A Thay Lay for Vr.13069 (Ch no.221620)\r\n', 6000000, 33229800, 0, 0, '0000-00-00'),
(100, '0000-00-00', '4000/W01', '618128116', 0, '2025-04-01', 'Dr-Apr\'25/030', 'Paid to Win Bo for Vr.12700 (Ch No.221621)\r\n', 5000000, 16698175, 0, 0, '0000-00-00'),
(101, '0000-00-00', '4000/t19', '995601765', 0, '2025-04-01', 'Dr-Apr\'25/031', 'Paid to Tin Hlaing for Vr.12597 (Ch No.221622)\r\n', 15000000, 239167600, 0, 0, '0000-00-00'),
(102, '0000-00-00', '4000/n01', '355893734', 0, '2025-04-01', 'Dr-Apr\'25/032', 'Paid to Nanda for Vr.12922 (Ch No.221623)\r\n', 5000000, 41243800, 0, 0, '0000-00-00'),
(103, '0000-00-00', '4000/p05', '900561468', 0, '2025-04-01', 'Dr-Apr\'25/033', 'Paid to Phoe Zaw for Vr.12800,12807,12823 (Ch No.221624)\r\n', 10000000, 85525700, 0, 0, '0000-00-00'),
(104, '0000-00-00', '4000/A06', '648553799', 0, '2025-04-01', 'Dr-Apr\'25/034', 'Paid to Aung Zaw Oo for Vr.12867,12891 (Ch No.221625)\r\n', 7000000, 78468550, 0, 0, '0000-00-00'),
(105, '0000-00-00', '4000/t05', '884642007', 0, '2025-04-01', 'Dr-Apr\'25/035', 'Paid to Thet Oo for Vr.12627,12633,12702 (Ch No.221651)\r\n', 20000000, 405885596, 0, 0, '0000-00-00'),
(106, '0000-00-00', '4000/S03', '222499119', 0, '2025-04-08', 'Dr-Apr\'25/099', 'Paid to Soe Min For Vr no-12610,12680,Chq no-221655\r\n', 25000000, 252917276, 0, 0, '0000-00-00'),
(107, '0000-00-00', '4000/A19', '580160167', 0, '2025-04-08', 'Dr-Apr\'25/100', 'Paid to Aye Aye Maw For Vr no-12911,Chq no-221653\r\n', 6000000, 106861200, 0, 0, '0000-00-00'),
(108, '0000-00-00', '4000/k16', '620661593', 0, '2025-04-08', 'Dr-Apr\'25/101', 'Paid to Kyaw Min Latt For Vr no-12877,12881,Chq no-221654\r\n', 6000000, 23620800, 0, 0, '0000-00-00'),
(109, '0000-00-00', '4000/S06', '209059464', 0, '2025-04-08', 'Dr-Apr\'25/102', 'Paid to Soe Thein For Vr no-12596,12605,Chq no-221656\r\n', 30000000, 1217591460, 0, 0, '0000-00-00'),
(110, '0000-00-00', '4000/A01', '381023552', 0, '2025-04-09', 'Dr-Apr\'25/130', 'Paid to A.K For Vr no-12785,12805,12813,12824,Chq no-221657\r\n', 10000000, 306872750, 0, 0, '0000-00-00'),
(111, '0000-00-00', '4000/t02', '738739725', 0, '2025-04-09', 'Dr-Apr\'25/131', 'Paid to Thein Htay For Vr no-13028,13033,Chq no-221658\r\n', 10000000, 58165000, 0, 0, '0000-00-00'),
(112, '0000-00-00', '4000/P05', '294363581', 0, '2025-04-09', 'Dr-Apr\'25/132', 'Paid to Phoe Zaw For Vr no- 12823,Chq no-221659\r\n', 10000000, 171051400, 0, 0, '0000-00-00'),
(113, '0000-00-00', '4000/a07', '947209750', 0, '2025-04-09', 'Dr-Apr\'25/133', 'Paid to A Thay Lay For Vr no-13069,Chq no-221661\r\n', 5000000, 67459600, 0, 0, '0000-00-00'),
(114, '0000-00-00', '4000/h03', '582802939', 0, '2025-04-09', 'Dr-Apr\'25/134', 'Paid to HHK Cold Store Charges,Chq no-221662\r\n', 10000000, 521788, 0, 0, '0000-00-00'),
(115, '0000-00-00', '4000/s01', '926482699', 0, '2025-04-10', 'Dr-Apr\'25/152', 'Paid to Shwe Late For Vr no-12740,12852,12863,Chq no-221663\r\n', 10000000, 141016300, 0, 0, '0000-00-00'),
(116, '0000-00-00', '4000/t01', '827019132', 0, '2025-04-10', 'Dr-Apr\'25/153', 'Paid to Thet Paing For Vr no-12937,Chq no-221664\r\n', 7000000, 67981100, 0, 0, '0000-00-00'),
(117, '0000-00-00', '4000/t17', '705937269', 0, '2025-04-10', 'Dr-Apr\'25/154', 'Paid to Than Than Myint For Vr no-12756,12760,Chq no-221665\r\n', 20000000, 122021845, 0, 0, '0000-00-00'),
(118, '0000-00-00', '4000/001', '512442030', 0, '2025-04-10', 'Dr-Apr\'25/155', 'Paid to 4 Zaw For Vr no-12913,Chq no-221666\r\n', 5000000, 84778300, 0, 0, '0000-00-00'),
(119, '0000-00-00', '4000/y01', '221307225', 0, '2025-04-10', 'Dr-Apr\'25/156', 'Paid to Ye Yint For Vr no-12568,12958,Chq no-221667\r\n', 7000000, 75256000, 0, 0, '0000-00-00'),
(120, '0000-00-00', '4000/z03', '185080044', 0, '2025-04-10', 'Dr-Apr\'25/157', 'Paid to Zaw Myat Thu For Vr no-12990,13020,13036,Chq no-221668\r\n', 10000000, 10257925, 0, 0, '0000-00-00'),
(121, '0000-00-00', '4000/w01', '345946429', 0, '2025-04-10', 'Dr-Apr\'25/158', 'Paid to Win Bo For Vr no-12700,12718,Chq no-221669\r\n', 7000000, 31396350, 0, 0, '0000-00-00'),
(122, '0000-00-00', '4000/s04', '905493505', 0, '2025-04-10', 'Dr-Apr\'25/159', 'Paid to Si Thu For Vr no-12669,Chq no-221671\r\n', 10000000, 309325300, 0, 0, '0000-00-00'),
(123, '0000-00-00', '4000/t11', '818583785', 0, '2025-04-10', 'Dr-Apr\'25/160', 'Paid to Tun Zaw Min For Vr no-12652,12662,12674,12690,Chq no-221673\r\n', 30000000, 1618637825, 0, 0, '0000-00-00'),
(124, '0000-00-00', '4000/c03', '327805156', 0, '2025-04-10', 'Dr-Apr\'25/161', 'Paid to Chit Ko For Vr no-12905,Chq no-221670\r\n', 5000000, 100994650, 0, 0, '0000-00-00'),
(125, '0000-00-00', '4000/t03', '212461411', 0, '2025-04-10', 'Dr-Apr\'25/162', 'Paid to Thin Thin Yee For Vr no-12789,12809,Chq no-221672\r\n', 10000000, 84449050, 0, 0, '0000-00-00'),
(126, '0000-00-00', '4000/A06', '992478343', 0, '2025-04-10', 'Dr-Apr\'25/163', 'Paid to Aung Zaw Oo For Vr no-12891,Chq no-221675\r\n', 6000000, 157937100, 0, 0, '0000-00-00'),
(127, '0000-00-00', '4000/t05', '440889530', 0, '2025-04-10', 'Dr-Apr\'25/164', 'Paid to Thet Oo For Vr no-12758,12790,Chq no-221674\r\n', 20000000, 608828394, 0, 0, '0000-00-00'),
(128, '0000-00-00', '4000/A24', 'Cr-Apr\'25/015', 11000, '0000-00-00', '', '', 0, 11000, 0, 0, '0000-00-00'),
(129, '0000-00-00', '4000/A24', 'Cr-Apr\'25/008', 5010, '0000-00-00', '', '', 0, 5010, 0, 0, '0000-00-00'),
(130, '0000-00-00', '4000/A24', 'Cr-Apr\'25/008', 5010, '0000-00-00', '', '', 0, 5010, 0, 0, '0000-00-00'),
(131, '0000-00-00', '4000/a24', 'Cr-Apr\'25/008', 5010, '0000-00-00', '', '', 0, 5010, 0, 0, '0000-00-00'),
(132, '0000-00-00', '4000/A24', 'Cr-Apr\'25/008', 5010, '0000-00-00', '', '', 0, 5010, 0, 0, '0000-00-00'),
(133, '0000-00-00', '4000/a24', 'Cr-Apr\'25/008', 5010, '0000-00-00', '', '', 0, 5010, 0, 0, '0000-00-00'),
(134, '0000-00-00', '4000/A24', 'Cr-Apr\'25/008', 5010, '0000-00-00', '', '', 0, 5010, 0, 0, '0000-00-00'),
(135, '0000-00-00', '4000/a24', 'Cr-Apr\'25/008', 5010, '0000-00-00', '', '', 0, 5010, 0, 0, '0000-00-00'),
(136, '0000-00-00', '4000/A24', '919443489', 0, '2025-04-08', 'Dr-Apr\'25/118', 'Transfer to Gulf Air instead of ACE (MM), that money adjust with Chairman Loan from ACE(BD) \r\n', 5010, 26611, 0, 0, '0000-00-00'),
(137, '0000-00-00', '4000/A24', 'Cr-Apr\'25/015', 11000, '0000-00-00', '', '', 0, 11000, 0, 0, '0000-00-00'),
(138, '0000-00-00', '4000/A24', 'Cr-Apr\'25/015', 11000, '0000-00-00', '', '', 0, 11000, 0, 0, '0000-00-00'),
(139, '0000-00-00', '4000/A24', 'Cr-Apr\'25/015', 11000, '0000-00-00', '', '', 0, 11000, 0, 0, '0000-00-00'),
(140, '0000-00-00', '4000/A24', 'Cr-Apr\'25/008', 5010, '0000-00-00', '', '', 0, 5010, 0, 0, '0000-00-00'),
(141, '0000-00-00', '4000/a24', 'Cr-Apr\'25/008', 5010, '0000-00-00', '', '', 0, 5010, 0, 0, '0000-00-00');

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
(5, '2025-03-24', 13091, '4000/T23', 'frozen', '1015', '5/8', '1223', 0, 31000, 37913000),
(6, '2025-04-05', 13090, '4000/s03', 'frozen', '1023', '1up', '58', 34, 10500, 609000),
(7, '2025-04-05', 13090, '4000/s03', 'frozen', '1023', '2up', '1603.8', 1045, 12500, 20047500),
(8, '2025-04-05', 13090, '4000/s03', 'frozen', '1023', '3up', '492', 225, 13000, 6396000),
(9, '2025-04-05', 13090, '4000/s03', 'frozen', '1023', '4up', '27.5', 10, 13000, 357500),
(10, '2025-04-19', 13092, '4000/a01', 'frozen', '1037', '1D', '12.7', 0, 17000, 215900),
(11, '2025-04-19', 13092, '4000/a01', 'frozen', '1037', '1/2', '6', 0, 24000, 144000),
(12, '2025-04-19', 13092, '4000/a01', 'frozen', '1037', '2/3', '1.3', 0, 41000, 53300),
(13, '2025-04-19', 13092, '4000/a01', 'frozen', '1037', '3/4', '0.9', 0, 61000, 54900),
(14, '2025-04-19', 13092, '4000/a01', 'frozen', '1037', '4up', '3.8', 0, 87000, 330600),
(15, '2025-04-25', 13093, '4000/s03', 'frozen', '1031', '18/24', '109', 0, 8500, 926500),
(16, '2025-04-25', 13093, '4000/s03', 'frozen', '1031', '13/18', '300', 0, 7500, 2250000),
(17, '2025-04-26', 13094, '4000/s03', 'frozen', '1023', '2up', '65.3', 30, 13500, 881550),
(18, '2025-04-26', 13094, '4000/s03', 'frozen', '1023', '3up', '572.8', 241, 15500, 8878400),
(19, '2025-04-26', 13094, '4000/s03', 'frozen', '1023', '4up', '162.9', 48, 15500, 2524950),
(20, '2025-04-27', 13095, '4000/t11', 'frozen', '1015', '5/8', '1.5', 0, 42000, 63000),
(21, '2025-04-28', 13096, '4000/n04', 'frozen', '1002', '2up', '289.1', 161, 17000, 4914700),
(22, '2025-04-28', 13097, '4000/t02', 'frozen', '1002', '2up', '120.4', 67, 17000, 2046800),
(23, '2025-04-28', 13098, '4000/s03', 'frozen', '1023', '2up', '547.2', 0, 13500, 7387200),
(24, '2025-04-28', 13098, '4000/s03', 'frozen', '1023', '3up', '463.6', 0, 15500, 7185800),
(25, '2025-04-28', 13099, '4000/b01', 'frozen', '1017', '3up', '379.75', 0, 9900, 3759525),
(26, '2025-04-28', 13099, '4000/b01', 'frozen', '1017', '2up', '323', 0, 8900, 2874700);

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
(1, '2025-04-01', '3300/002', '', '', '', '0000-00-00', '', 'Opening Balance', '', '981167.97', 0),
(2, '2025-04-01', '3300/003', '', '', '', '0000-00-00', '', 'Opening Balance', '', '165167.66', 0),
(3, '2025-04-01', '3300/006', '', '', '', '0000-00-00', '', 'Opening Balance', '', '375566.05', 0),
(4, '2025-04-01', '3300/007', '', '', '', '0000-00-00', '', 'Opening Balance', '', '510407.23', 0),
(5, '2025-04-01', '3300/009', '', '', '', '0000-00-00', '', 'Opening Balance', '', '36524.94', 0),
(6, '2025-04-01', '3300/010', '', '', '', '0000-00-00', '', 'Opening Balance', '', '16903.53', 0),
(7, '2025-04-01', '3300/011', '', '', '', '0000-00-00', '', 'Opening Balance', '', '109681.7', 0),
(9, '0000-00-00', '3300/003', '', '', '', '2025-04-03', 'Cr-Apr\'25/005', 'Canada Money Received from May Yu (31.3.2025)$25000-$25 = $24975*4380ks\r\n', '24975', '140192.66', 50),
(10, '0000-00-00', '3300/003', '', '', '', '2025-04-09', 'Cr-Apr\'25/012', 'Canada Money Received From May Yu ($25000)(3.4.25)($25000-$17)=$24983*4380ks\r\n', '24983', '115209.66', 184),
(11, '0000-00-00', '3300/002', '', '', '', '2025-04-07', 'Cr-Apr\'25/007', 'USA Money Received from UAB (28.3.25)-$50000\r\n', '49945', '931222.97', 510),
(12, '0000-00-00', '3300/002', '', '', '', '2025-04-23', 'Cr-Apr\'25/016', 'USA Money Received From UAB USD A/C (4.4.25) For SAF-27/24 & SAF-01/25\r\n', '49945', '881277.97', 518),
(13, '0000-00-00', '3300/002', '', '', '', '2025-04-23', 'Cr-Apr\'25/017', 'USA Money Received From UAB USD A/C (11.4.25) For SAF-01/25\r\n', '49945', '831332.97', 520),
(14, '0000-00-00', '3300/002', '', '', '', '2025-04-04', 'Jv04-007', 'Bank Charges For USA Money From UAB USD A/C For (4.4.25) Money\r\n', '55', '831277.97', 549),
(15, '0000-00-00', '3300/002', '', '', '', '2025-04-11', 'JV04-008', 'Bank Charges For USA Money From UAB USD A/C For (11.4.25) Money\r\n', '55', '831222.97', 551),
(16, '2025-04-08', '3300/002', 'SAF-07/2025', 'OERU:406498', '275750.50', '0000-00-00', '', '', '', '1106973.47', 552),
(17, '2025-04-08', '3300/002', 'SAF-08/2025', 'FSCU:5761613', '311755.9', '0000-00-00', '', '', '', '1418729.37', 554);

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
(197, '4000/999', 'Peter', '', ''),
(198, '4000/Y03', 'Ye Ko', '', ''),
(199, '4000/A23', 'Aung Kyaw Thant', '', ''),
(200, '4000/K21', 'Kyaw Zin Phyo ', '', ''),
(201, '4000/H04', 'Hman Kyi', '', ''),
(202, '4000/O02', 'Oak Kar', '', ''),
(203, '4000/H05', 'Hla Hla Win', '', ''),
(204, '4000/T23', 'Thin Zar', '', ''),
(205, '4000/A24', 'ACE (Myanmar) USD A/C', '', '');

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
(1, '2025-04-01', 'Cr-Apr\'25/001', '3600/001', 'ADV; money Return from Ma Pyone for 31.3.2025\r\n', '200000', '0', 'mmk', '', '', 0, 'accepted'),
(2, '2025-04-01', 'Cr-Apr\'25/001', '9100/046', 'ADV; money Return from Ma Pyone for 31.3.2025\r\n', '0', '200000', 'mmk', '', '', 0, 'accepted'),
(3, '2025-04-01', 'Dr-Apr\'25/001', '9100/004', 'Monthly Phone Bill for 5000ks*4pcs/6000ks*4pcs for Apr\'25\r\n', '44000', '0', 'mmk', '', '', 0, 'accepted'),
(4, '2025-04-01', 'Dr-Apr\'25/001', '3600/001', 'Monthly Phone Bill for 5000ks*4pcs/6000ks*4pcs for Apr\'25\r\n', '0', '44000', 'mmk', '', '', 0, 'accepted'),
(5, '2025-04-01', 'Dr-Apr\'25/002', '9100/004', 'YTP Internet Bill for Sir House of Mar\'25\r\n', '60375', '0', 'mmk', '', '', 0, 'accepted'),
(6, '2025-04-01', 'Dr-Apr\'25/002', '3600/001', 'YTP Internet Bill for Sir House of Mar\'25\r\n', '0', '60375', 'mmk', '', '', 0, 'accepted'),
(7, '2025-04-01', 'Dr-Apr\'25/003', '9100/004', ' Hi Internet Bill for W/H and Office of Apr\'25 \r\n', '84125', '0', 'mmk', '', '', 0, 'accepted'),
(8, '2025-04-01', 'Dr-Apr\'25/003', '3600/001', ' Hi Internet Bill for W/H and Office of Apr\'25 \r\n', '0', '84125', 'mmk', '', '', 0, 'accepted'),
(9, '2025-04-01', 'Dr-Apr\'25/004', '9100/041', 'Paid to MM Clare BL and Seal Charges for H Trader HT-01/25\r\n', '76000', '0', 'mmk', '', '', 0, 'accepted'),
(10, '2025-04-01', 'Dr-Apr\'25/004', '3600/001', 'Paid to MM Clare BL and Seal Charges for H Trader HT-01/25\r\n', '0', '76000', 'mmk', '', '', 0, 'accepted'),
(11, '2025-04-01', 'Dr-Apr\'25/005', '9100/040', 'Inbound and Outbound Tour Licence Renew Form Charges\r\n', '6000', '0', 'mmk', '', '', 0, 'accepted'),
(12, '2025-04-01', 'Dr-Apr\'25/005', '3600/001', 'Inbound and Outbound Tour Licence Renew Form Charges\r\n', '0', '6000', 'mmk', '', '', 0, 'accepted'),
(13, '2025-04-01', 'Dr-Apr\'25/006', '9100/002', 'Taxi Charges for W/H to MM Clare to Time Square to W/H for BL Charges money sent\r\n', '45300', '0', 'mmk', '', '', 0, 'accepted'),
(14, '2025-04-01', 'Dr-Apr\'25/006', '3600/001', 'Taxi Charges for W/H to MM Clare to Time Square to W/H for BL Charges money sent\r\n', '0', '45300', 'mmk', '', '', 0, 'accepted'),
(15, '2025-04-01', 'Dr-Apr\'25/007', '9100/011', 'Coffee and Other Purchase for Eid Festival Donation\r\n', '119000', '0', 'mmk', '', '', 0, 'accepted'),
(16, '2025-04-01', 'Dr-Apr\'25/007', '3600/001', 'Coffee and Other Purchase for Eid Festival Donation\r\n', '0', '119000', 'mmk', '', '', 0, 'accepted'),
(17, '2025-04-01', 'Dr-Apr\'25/008', '9100/011', 'Rice,Fruit and Other Purchase for Eid Festival Donation\r\n', '201300', '0', 'mmk', '', '', 0, 'accepted'),
(18, '2025-04-01', 'Dr-Apr\'25/008', '3600/001', 'Rice,Fruit and Other Purchase for Eid Festival Donation\r\n', '0', '201300', 'mmk', '', '', 0, 'accepted'),
(19, '2025-04-01', 'Dr-Apr\'25/009', '6100/001', 'Labour Charges for MSL Chito (70V*600ks)\r\n', '42000', '0', 'mmk', '', '', 0, 'accepted'),
(20, '2025-04-01', 'Dr-Apr\'25/009', '3600/001', 'Labour Charges for MSL Chito (70V*600ks)\r\n', '0', '42000', 'mmk', '', '', 0, 'accepted'),
(21, '2025-04-01', 'Dr-Apr\'25/010', '9100/002', 'Taxi Charges for W/H to MSL to Ocean Pacific\r\n', '13300', '0', 'mmk', '', '', 0, 'accepted'),
(22, '2025-04-01', 'Dr-Apr\'25/010', '3600/001', 'Taxi Charges for W/H to MSL to Ocean Pacific\r\n', '0', '13300', 'mmk', '', '', 0, 'accepted'),
(23, '2025-04-02', 'Cr-Apr\'25/002', '3600/001', 'Water Bill Received from ACE \r\n', '5000', '0', 'mmk', '', '', 0, 'accepted'),
(24, '2025-04-02', 'Cr-Apr\'25/002', '9100/013', 'Water Bill Received from ACE \r\n', '0', '5000', 'mmk', '', '', 0, 'accepted'),
(25, '2025-04-02', 'Cr-Apr\'25/003', '3600/001', 'Money Return from Thoon Set Paing for Spare Licence \r\n', '35000', '0', 'mmk', '', '', 0, 'accepted'),
(26, '2025-04-02', 'Cr-Apr\'25/003', '9100/014', 'Money Return from Thoon Set Paing for Spare Licence \r\n', '0', '35000', 'mmk', '', '', 0, 'accepted'),
(27, '2025-04-02', 'Cr-Apr\'25/004', '3600/001', 'Account Adjustment for Mar\'25 Salary (Mar\'25 Salary ကို Apr\'25 တွင် Charge လုပ်ထားသောကြောင့် စာရင်းညွှိနှိုင်းမှု လုပ်ခြင်းဖြစ်သည်)\r\n', '22455240', '0', 'mmk', '', '', 0, 'accepted'),
(28, '2025-04-02', 'Cr-Apr\'25/004', '9100/001', 'Account Adjustment for Mar\'25 Salary (Mar\'25 Salary ကို Apr\'25 တွင် Charge လုပ်ထားသောကြောင့် စာရင်းညွှိနှိုင်းမှု လုပ်ခြင်းဖြစ်သည်)\r\n', '0', '22455240', 'mmk', '', '', 0, 'accepted'),
(29, '2025-04-02', 'Dr-Apr\'25/036', '9100/002', 'Taxi Charges for W/H to ACE Office\r\n', '4500', '0', 'mmk', '', '', 0, 'accepted'),
(30, '2025-04-02', 'Dr-Apr\'25/036', '3600/001', 'Taxi Charges for W/H to ACE Office\r\n', '0', '4500', 'mmk', '', '', 0, 'accepted'),
(31, '2025-04-02', 'Dr-Apr\'25/037', '9100/002', 'Taxi Charges for W/H to LMG by Sandar\r\n', '2000', '0', 'mmk', '', '', 0, 'accepted'),
(32, '2025-04-02', 'Dr-Apr\'25/037', '3600/001', 'Taxi Charges for W/H to LMG by Sandar\r\n', '0', '2000', 'mmk', '', '', 0, 'accepted'),
(33, '2025-04-02', 'Dr-Apr\'25/038', '9100/004', 'Sir Phone Bill for 1.4.25\r\n', '3000', '0', 'mmk', '', '', 0, 'accepted'),
(34, '2025-04-02', 'Dr-Apr\'25/038', '3600/001', 'Sir Phone Bill for 1.4.25\r\n', '0', '3000', 'mmk', '', '', 0, 'accepted'),
(35, '2025-04-02', 'Dr-Apr\'25/039', '9100/041', 'BL,Seal and Document Fees for Can.03/25\r\n', '215880', '0', 'mmk', '', '', 0, 'accepted'),
(36, '2025-04-02', 'Dr-Apr\'25/039', '3600/001', 'BL,Seal and Document Fees for Can.03/25\r\n', '0', '215880', 'mmk', '', '', 0, 'accepted'),
(37, '2025-04-02', 'Dr-Apr\'25/040', '9100/017', 'Airticket 2pcs Purchase for Sir and Daw Nan(YGN-BKK) 14.4.25-23.4.25\r\n', '3110000', '0', 'mmk', '', '', 0, 'accepted'),
(38, '2025-04-02', 'Dr-Apr\'25/040', '3600/001', 'Airticket 2pcs Purchase for Sir and Daw Nan(YGN-BKK) 14.4.25-23.4.25\r\n', '0', '3110000', 'mmk', '', '', 0, 'accepted'),
(39, '2025-04-02', 'Dr-Apr\'25/041', '9100/002', 'Taxi Charges for W/H to KBZ Bank go\r\n', '5000', '0', 'mmk', '', '', 0, 'accepted'),
(40, '2025-04-02', 'Dr-Apr\'25/041', '3600/001', 'Taxi Charges for W/H to KBZ Bank go\r\n', '0', '5000', 'mmk', '', '', 0, 'accepted'),
(41, '2025-04-02', 'Dr-Apr\'25/042', '9100/002', 'Taxi Charges for Eid Donation\r\n', '9000', '0', 'mmk', '', '', 0, 'accepted'),
(42, '2025-04-02', 'Dr-Apr\'25/042', '3600/001', 'Taxi Charges for Eid Donation\r\n', '0', '9000', 'mmk', '', '', 0, 'accepted'),
(43, '2025-04-02', 'Dr-Apr\'25/043', '9100/011', 'Donation for W/H Dogs\r\n', '5000', '0', 'mmk', '', '', 0, 'accepted'),
(44, '2025-04-02', 'Dr-Apr\'25/043', '3600/001', 'Donation for W/H Dogs\r\n', '0', '5000', 'mmk', '', '', 0, 'accepted'),
(45, '2025-04-02', 'Dr-Apr\'25/044', '9100/001', 'Staff Salary for Mar\'25\r\n', '22455240', '0', 'mmk', '', '', 0, 'accepted'),
(46, '2025-04-02', 'Dr-Apr\'25/044', '3600/001', 'Staff Salary for Mar\'25\r\n', '0', '22455240', 'mmk', '', '', 0, 'accepted'),
(47, '2025-04-02', 'Dr-Apr\'25/045', '9100/011', 'Earthquake Donation for NPT-500000+YGN-300000 (28.3.25)\r\n', '800000', '0', 'mmk', '', '', 0, 'accepted'),
(48, '2025-04-02', 'Dr-Apr\'25/045', '3600/001', 'Earthquake Donation for NPT-500000+YGN-300000 (28.3.25)\r\n', '0', '800000', 'mmk', '', '', 0, 'accepted'),
(49, '2025-04-03', 'Cr-Apr\'25/005', '3600/001', 'Canada Money Received from May Yu (31.3.2025)$25000-$25 = $24975*4380ks\r\n', '109390500', '0', 'usd', '', '', 0, 'accepted'),
(50, '2025-04-03', 'Cr-Apr\'25/005', '3300/003', 'Canada Money Received from May Yu (31.3.2025)$25000-$25 = $24975*4380ks\r\n', '0', '109390500', 'usd', '', '', 0, 'accepted'),
(51, '2025-04-03', 'Dr-Apr\'25/046', '9100/002', 'Taxi Charges for W/H to Sir House for Fish sent\r\n', '4000', '0', 'mmk', '', '', 0, 'accepted'),
(52, '2025-04-03', 'Dr-Apr\'25/046', '3600/001', 'Taxi Charges for W/H to Sir House for Fish sent\r\n', '0', '4000', 'mmk', '', '', 0, 'accepted'),
(53, '2025-04-03', 'Dr-Apr\'25/047', '4000/k07', 'Paid to KMM for Vr.12924\r\n', '20000000', '0', 'mmk', '', '', 0, 'accepted'),
(54, '2025-04-03', 'Dr-Apr\'25/047', '3600/001', 'Paid to KMM for Vr.12924\r\n', '0', '20000000', 'mmk', '', '', 0, 'accepted'),
(55, '2025-04-03', 'Dr-Apr\'25/048', '4000/t05', 'Paid to Thet Oo for Vr.12702,12758\r\n', '20000000', '0', 'mmk', '', '', 0, 'accepted'),
(56, '2025-04-03', 'Dr-Apr\'25/048', '3600/001', 'Paid to Thet Oo for Vr.12702,12758\r\n', '0', '20000000', 'mmk', '', '', 0, 'accepted'),
(57, '2025-04-03', 'Dr-Apr\'25/049', '4000/k05', 'Paid to Kyaw Zay Ya for Vr.12448\r\n', '30000000', '0', 'mmk', '', '', 0, 'accepted'),
(58, '2025-04-03', 'Dr-Apr\'25/049', '3600/001', 'Paid to Kyaw Zay Ya for Vr.12448\r\n', '0', '30000000', 'mmk', '', '', 0, 'accepted'),
(59, '2025-04-03', 'Dr-Apr\'25/050', '4000/t11', 'Paid to Tun Zaw Min for Vr.12636,12646,12652\r\n', '30000000', '0', 'mmk', '', '', 0, 'accepted'),
(60, '2025-04-03', 'Dr-Apr\'25/050', '3600/001', 'Paid to Tun Zaw Min for Vr.12636,12646,12652\r\n', '0', '30000000', 'mmk', '', '', 0, 'accepted'),
(61, '2025-04-04', 'Dr-Apr\'25/051', '4000/G03', 'Paid to Plastic (Golden Fish) for 29.3.25,1.4.25,2.4.25\r\n', '2694600', '0', 'mmk', '', '', 0, 'accepted'),
(62, '2025-04-04', 'Dr-Apr\'25/051', '3600/001', 'Paid to Plastic (Golden Fish) for 29.3.25,1.4.25,2.4.25\r\n', '0', '2694600', 'mmk', '', '', 0, 'accepted'),
(63, '2025-04-04', 'Dr-Apr\'25/052', '9100/040', 'DHL Charges for H Trader Documents sent to Bangladesh\r\n', '277600', '0', 'mmk', '', '', 0, 'accepted'),
(64, '2025-04-04', 'Dr-Apr\'25/052', '3600/001', 'DHL Charges for H Trader Documents sent to Bangladesh\r\n', '0', '277600', 'mmk', '', '', 0, 'accepted'),
(65, '2025-04-04', 'Dr-Apr\'25/053', '6100/005', 'MC Box Carry Charges for Ocean Pacific to GFC 2Trucks\r\n', '430000', '0', 'mmk', '', '', 0, 'accepted'),
(66, '2025-04-04', 'Dr-Apr\'25/053', '3600/001', 'MC Box Carry Charges for Ocean Pacific to GFC 2Trucks\r\n', '0', '430000', 'mmk', '', '', 0, 'accepted'),
(67, '2025-04-04', 'Dr-Apr\'25/054', '9100/005', 'Salt Purchase and Carry for Dry WP\r\n', '27000', '0', 'mmk', '', '', 0, 'accepted'),
(68, '2025-04-04', 'Dr-Apr\'25/054', '3600/001', 'Salt Purchase and Carry for Dry WP\r\n', '0', '27000', 'mmk', '', '', 0, 'accepted'),
(69, '2025-04-04', 'Dr-Apr\'25/055', '9100/005', 'Guest List Charges \r\n', '10000', '0', 'mmk', '', '', 0, 'accepted'),
(70, '2025-04-04', 'Dr-Apr\'25/055', '3600/001', 'Guest List Charges \r\n', '0', '10000', 'mmk', '', '', 0, 'accepted'),
(71, '2025-04-04', 'Dr-Apr\'25/056', '9100/003', 'Water 10pcs Purchase for W/H\r\n', '11000', '0', 'mmk', '', '', 0, 'accepted'),
(72, '2025-04-04', 'Dr-Apr\'25/056', '3600/001', 'Water 10pcs Purchase for W/H\r\n', '0', '11000', 'mmk', '', '', 0, 'accepted'),
(73, '2025-04-04', 'Dr-Apr\'25/057', '9100/002', 'Taxi Charges for Ocean Pacific to W/H\r\n', '5000', '0', 'mmk', '', '', 0, 'accepted'),
(74, '2025-04-04', 'Dr-Apr\'25/057', '3600/001', 'Taxi Charges for Ocean Pacific to W/H\r\n', '0', '5000', 'mmk', '', '', 0, 'accepted'),
(75, '2025-04-04', 'Dr-Apr\'25/058', '9100/009', 'Kpay Charges for MC Box Carry money transfer\r\n', '500', '0', 'mmk', '', '', 0, 'accepted'),
(76, '2025-04-04', 'Dr-Apr\'25/058', '3600/001', 'Kpay Charges for MC Box Carry money transfer\r\n', '0', '500', 'mmk', '', '', 0, 'accepted'),
(77, '2025-04-04', 'Dr-Apr\'25/059', '9100/007', 'Roller Rope Purchase for W/H PK Machine\r\n\r\n', '112000', '0', 'mmk', '', '', 0, 'accepted'),
(78, '2025-04-04', 'Dr-Apr\'25/059', '3600/001', 'Roller Rope Purchase for W/H PK Machine\r\n\r\n', '0', '112000', 'mmk', '', '', 0, 'accepted'),
(79, '2025-04-04', 'Dr-Apr\'25/060', '6100/006', 'Photo Sticker,Ledger, Knife Purchase and Taxi for W/H\r\n', '188800', '0', 'mmk', '', '', 0, 'accepted'),
(80, '2025-04-04', 'Dr-Apr\'25/060', '3600/001', 'Photo Sticker,Ledger, Knife Purchase and Taxi for W/H\r\n', '0', '188800', 'mmk', '', '', 0, 'accepted'),
(81, '2025-04-04', 'Dr-Apr\'25/061', '9100/005', 'Bamboo Purchase for Dry WP\r\n', '42000', '0', 'mmk', '', '', 0, 'accepted'),
(82, '2025-04-04', 'Dr-Apr\'25/061', '3600/001', 'Bamboo Purchase for Dry WP\r\n', '0', '42000', 'mmk', '', '', 0, 'accepted'),
(83, '2025-04-04', 'Dr-Apr\'25/062', '9100/032', 'Tissue 2pk Purchase for Office\r\n', '7000', '0', 'mmk', '', '', 0, 'accepted'),
(84, '2025-04-04', 'Dr-Apr\'25/062', '3600/001', 'Tissue 2pk Purchase for Office\r\n', '0', '7000', 'mmk', '', '', 0, 'accepted'),
(85, '2025-04-04', 'Dr-Apr\'25/063', '9100/032', 'Bucket 1pcs Purchase for Office\r\n', '3500', '0', 'mmk', '', '', 0, 'accepted'),
(86, '2025-04-04', 'Dr-Apr\'25/063', '3600/001', 'Bucket 1pcs Purchase for Office\r\n', '0', '3500', 'mmk', '', '', 0, 'accepted'),
(87, '2025-04-04', 'Dr-Apr\'25/064', '9100/003', 'Water 10pcs Purchase for W/H\r\n', '11000', '0', 'mmk', '', '', 0, 'accepted'),
(88, '2025-04-04', 'Dr-Apr\'25/064', '3600/001', 'Water 10pcs Purchase for W/H\r\n', '0', '11000', 'mmk', '', '', 0, 'accepted'),
(89, '2025-04-04', 'Dr-Apr\'25/065', '9100/006', 'Car Petrol for 3K-1574 5.4.25\r\n', '50000', '0', 'mmk', '', '', 0, 'accepted'),
(90, '2025-04-04', 'Dr-Apr\'25/065', '3600/001', 'Car Petrol for 3K-1574 5.4.25\r\n', '0', '50000', 'mmk', '', '', 0, 'accepted'),
(91, '2025-04-04', 'Dr-Apr\'25/066', '6100/006', 'Sticker (LMH) and Kpay Charges\r\n', '2380500', '0', 'mmk', '', '', 0, 'accepted'),
(92, '2025-04-04', 'Dr-Apr\'25/066', '3600/001', 'Sticker (LMH) and Kpay Charges\r\n', '0', '2380500', 'mmk', '', '', 0, 'accepted'),
(93, '2025-04-04', 'Dr-Apr\'25/067', '9100/014', 'Car Break Oil Purchase for 3K-1574\r\n', '16000', '0', 'mmk', '', '', 0, 'accepted'),
(94, '2025-04-04', 'Dr-Apr\'25/067', '3600/001', 'Car Break Oil Purchase for 3K-1574\r\n', '0', '16000', 'mmk', '', '', 0, 'accepted'),
(95, '2025-04-04', 'Dr-Apr\'25/068', '9100/017', 'Sir Take from Daw Nan\r\n', '50000', '0', 'mmk', '', '', 0, 'accepted'),
(96, '2025-04-04', 'Dr-Apr\'25/068', '3600/001', 'Sir Take from Daw Nan\r\n', '0', '50000', 'mmk', '', '', 0, 'accepted'),
(97, '2025-04-04', 'Dr-Apr\'25/069', '9100/006', 'Car Petrol for 5L-2848\r\n', '100000', '0', 'mmk', '', '', 0, 'accepted'),
(98, '2025-04-04', 'Dr-Apr\'25/069', '3600/001', 'Car Petrol for 5L-2848\r\n', '0', '100000', 'mmk', '', '', 0, 'accepted'),
(99, '2025-04-06', 'Dr-Apr\'25/070', '9100/027', 'Stabilizar Repair and Service Charges Adv For W/H\r\n', '500000', '0', 'mmk', '', '', 0, 'accepted'),
(100, '2025-04-06', 'Dr-Apr\'25/070', '3600/001', 'Stabilizar Repair and Service Charges Adv For W/H\r\n', '0', '500000', 'mmk', '', '', 0, 'accepted'),
(101, '2025-04-06', 'Dr-Apr\'25/071', '6100/007', 'Paid to Ocean Pacific Cold Store Charges\r\n', '10000000', '0', 'mmk', '', '', 0, 'accepted'),
(102, '2025-04-06', 'Dr-Apr\'25/071', '3600/001', 'Paid to Ocean Pacific Cold Store Charges\r\n', '0', '10000000', 'mmk', '', '', 0, 'accepted'),
(103, '2025-04-06', 'Dr-Apr\'25/072', '6100/001', 'Labour Charges For GFC R.P (5.4.25)11000*11pcs,15000*5pcs\r\n', '196000', '0', 'mmk', '', '', 0, 'accepted'),
(104, '2025-04-06', 'Dr-Apr\'25/072', '3600/001', 'Labour Charges For GFC R.P (5.4.25)11000*11pcs,15000*5pcs\r\n', '0', '196000', 'mmk', '', '', 0, 'accepted'),
(105, '2025-04-06', 'Dr-Apr\'25/073', '9100/031', 'Packing Machine 4 pcs Purchase For W/H\r\n', '242200', '0', 'mmk', '', '', 0, 'accepted'),
(106, '2025-04-06', 'Dr-Apr\'25/073', '3600/001', 'Packing Machine 4 pcs Purchase For W/H\r\n', '0', '242200', 'mmk', '', '', 0, 'accepted'),
(107, '2025-04-06', 'Dr-Apr\'25/074', '9100/018', 'Extention 2 pcs Purchase For W/H\r\n', '50000', '0', 'mmk', '', '', 0, 'accepted'),
(108, '2025-04-06', 'Dr-Apr\'25/074', '3600/001', 'Extention 2 pcs Purchase For W/H\r\n', '0', '50000', 'mmk', '', '', 0, 'accepted'),
(109, '2025-04-06', 'Dr-Apr\'25/075', '9100/007', 'Maintenance For Sir House (March 25)\r\n', '20000', '0', 'mmk', '', '', 0, 'accepted'),
(110, '2025-04-06', 'Dr-Apr\'25/075', '3600/001', 'Maintenance For Sir House (March 25)\r\n', '0', '20000', 'mmk', '', '', 0, 'accepted'),
(111, '2025-04-06', 'Dr-Apr\'25/076', '9100/013', 'Water Bill For Sir House (Feb 25)\r\n', '5000', '0', 'mmk', '', '', 0, 'accepted'),
(112, '2025-04-06', 'Dr-Apr\'25/076', '3600/001', 'Water Bill For Sir House (Feb 25)\r\n', '0', '5000', 'mmk', '', '', 0, 'accepted'),
(113, '2025-04-06', 'Dr-Apr\'25/077', '6100/001', 'Labour Charges For GFC R.P (6.4.25)11000*13pcs,15000*5pcs\r\n', '218000', '0', 'mmk', '', '', 0, 'accepted'),
(114, '2025-04-06', 'Dr-Apr\'25/077', '3600/001', 'Labour Charges For GFC R.P (6.4.25)11000*13pcs,15000*5pcs\r\n', '0', '218000', 'mmk', '', '', 0, 'accepted'),
(115, '2025-04-06', 'Dr-Apr\'25/078', '9100/012', 'Workers 16 pcs Dinner For (5.4) W/H OT\r\n', '40000', '0', 'mmk', '', '', 0, 'accepted'),
(116, '2025-04-06', 'Dr-Apr\'25/078', '3600/001', 'Workers 16 pcs Dinner For (5.4) W/H OT\r\n', '0', '40000', 'mmk', '', '', 0, 'accepted'),
(117, '2025-04-06', 'Dr-Apr\'25/079', '9100/006', 'Car Petro For 3K-1574 (6.4.25)\r\n', '50000', '0', 'mmk', '', '', 0, 'accepted'),
(118, '2025-04-06', 'Dr-Apr\'25/079', '3600/001', 'Car Petro For 3K-1574 (6.4.25)\r\n', '0', '50000', 'mmk', '', '', 0, 'accepted'),
(119, '2025-04-06', 'Dr-Apr\'25/080', '9100/002', 'Taxi Charges For Market Boys (4.5.6)\r\n', '60000', '0', 'mmk', '', '', 0, 'accepted'),
(120, '2025-04-06', 'Dr-Apr\'25/080', '3600/001', 'Taxi Charges For Market Boys (4.5.6)\r\n', '0', '60000', 'mmk', '', '', 0, 'accepted'),
(121, '2025-04-06', 'Dr-Apr\'25/081', '9100/012', 'Meal Allowance For Market Boy (4.5.6)\r\n', '19500', '0', 'mmk', '', '', 0, 'accepted'),
(122, '2025-04-06', 'Dr-Apr\'25/081', '3600/001', 'Meal Allowance For Market Boy (4.5.6)\r\n', '0', '19500', 'mmk', '', '', 0, 'accepted'),
(123, '2025-04-07', 'Dr-Apr\'25/082', '9100/020', 'Agent Adv,2% and X Ray For USA 7,8\r\n', '8700000', '0', 'mmk', '', '', 0, 'accepted'),
(124, '2025-04-07', 'Dr-Apr\'25/082', '3600/001', 'Agent Adv,2% and X Ray For USA 7,8\r\n', '0', '8700000', 'mmk', '', '', 0, 'accepted'),
(125, '2025-04-07', 'Dr-Apr\'25/083', '9100/021', 'DOF Charges For USA 7,8\r\n', '300000', '0', 'mmk', '', '', 0, 'accepted'),
(126, '2025-04-07', 'Dr-Apr\'25/083', '3600/001', 'DOF Charges For USA 7,8\r\n', '0', '300000', 'mmk', '', '', 0, 'accepted'),
(127, '2025-04-07', 'Dr-Apr\'25/084', '9100/004', 'Sir Phone Bill For 7.4.25\r\n', '3000', '0', 'mmk', '', '', 0, 'accepted'),
(128, '2025-04-07', 'Dr-Apr\'25/084', '3600/001', 'Sir Phone Bill For 7.4.25\r\n', '0', '3000', 'mmk', '', '', 0, 'accepted'),
(129, '2025-04-07', 'Dr-Apr\'25/085', '9100/017', 'Sir Take From Lai Lai For Meeting Go\r\n', '20000', '0', 'mmk', '', '', 0, 'accepted'),
(130, '2025-04-07', 'Dr-Apr\'25/085', '3600/001', 'Sir Take From Lai Lai For Meeting Go\r\n', '0', '20000', 'mmk', '', '', 0, 'accepted'),
(131, '2025-04-07', 'Dr-Apr\'25/086', '9100/002', 'Taxi Charges For W/H to Ocean Pacific go \r\n', '13000', '0', 'mmk', '', '', 0, 'accepted'),
(132, '2025-04-07', 'Dr-Apr\'25/086', '3600/001', 'Taxi Charges For W/H to Ocean Pacific go \r\n', '0', '13000', 'mmk', '', '', 0, 'accepted'),
(133, '2025-04-07', 'Dr-Apr\'25/087', '9100/002', 'Taxi Charges For Labour From Hlaing Thar Yar For GFC\r\n', '25000', '0', 'mmk', '', '', 0, 'accepted'),
(134, '2025-04-07', 'Dr-Apr\'25/087', '3600/001', 'Taxi Charges For Labour From Hlaing Thar Yar For GFC\r\n', '0', '25000', 'mmk', '', '', 0, 'accepted'),
(135, '2025-04-07', 'Dr-Apr\'25/088', '9100/002', 'Taxi Charges For Bamboo Purchase go For W/H (Dry-WP)\r\n', '3000', '0', 'mmk', '', '', 0, 'accepted'),
(136, '2025-04-07', 'Dr-Apr\'25/088', '3600/001', 'Taxi Charges For Bamboo Purchase go For W/H (Dry-WP)\r\n', '0', '3000', 'mmk', '', '', 0, 'accepted'),
(137, '2025-04-07', 'Dr-Apr\'25/089', '9100/002', 'Taxi Charges For Battery Purchase For Hilsa Machine\r\n', '10000', '0', 'mmk', '', '', 0, 'accepted'),
(138, '2025-04-07', 'Dr-Apr\'25/089', '3600/001', 'Taxi Charges For Battery Purchase For Hilsa Machine\r\n', '0', '10000', 'mmk', '', '', 0, 'accepted'),
(139, '2025-04-07', 'Dr-Apr\'25/090', '9100/005', '3 Pin 1 pcs Purchase For W/H\r\n', '6000', '0', 'mmk', '', '', 0, 'accepted'),
(140, '2025-04-07', 'Dr-Apr\'25/090', '3600/001', '3 Pin 1 pcs Purchase For W/H\r\n', '0', '6000', 'mmk', '', '', 0, 'accepted'),
(141, '2025-04-07', 'Dr-Apr\'25/091', '6100/006', 'Paid to LMH-Sticker and K Pay Charges For W/H\r\n', '3439200', '0', 'mmk', '', '', 0, 'accepted'),
(142, '2025-04-07', 'Dr-Apr\'25/091', '3600/001', 'Paid to LMH-Sticker and K Pay Charges For W/H\r\n', '0', '3439200', 'mmk', '', '', 0, 'accepted'),
(143, '2025-04-07', 'Dr-Apr\'25/092', '9100/002', 'Taxi Charges For W/H to Ocean Pacific go (6.4.25,7.4.25)\r\n', '48000', '0', 'mmk', '', '', 0, 'accepted'),
(144, '2025-04-07', 'Dr-Apr\'25/092', '3600/001', 'Taxi Charges For W/H to Ocean Pacific go (6.4.25,7.4.25)\r\n', '0', '48000', 'mmk', '', '', 0, 'accepted'),
(145, '2025-04-07', 'Dr-Apr\'25/093', '9100/002', 'Penan Bag Carry Charges For Ocean Pacific Pk\r\n', '7000', '0', 'mmk', '', '', 0, 'accepted'),
(146, '2025-04-07', 'Dr-Apr\'25/093', '3600/001', 'Penan Bag Carry Charges For Ocean Pacific Pk\r\n', '0', '7000', 'mmk', '', '', 0, 'accepted'),
(147, '2025-04-07', 'Dr-Apr\'25/094', '6100/006', 'Paid to LMH-Sticker and Car Charges and K-Pay Charges For W/H\r\n', '623500', '0', 'mmk', '', '', 0, 'accepted'),
(148, '2025-04-07', 'Dr-Apr\'25/094', '3600/001', 'Paid to LMH-Sticker and Car Charges and K-Pay Charges For W/H\r\n', '0', '623500', 'mmk', '', '', 0, 'accepted'),
(149, '2025-04-07', 'Dr-Apr\'25/095', '9100/005', 'Battery 5 pcs Purchase For Hilsa Machine\r\n', '15000', '0', 'mmk', '', '', 0, 'accepted'),
(150, '2025-04-07', 'Dr-Apr\'25/095', '3600/001', 'Battery 5 pcs Purchase For Hilsa Machine\r\n', '0', '15000', 'mmk', '', '', 0, 'accepted'),
(151, '2025-04-07', 'Dr-Apr\'25/096', '6100/001', 'Labour Charges and Taxi Charges For GFC-RP \r\n', '217000', '0', 'mmk', '', '', 0, 'accepted'),
(152, '2025-04-07', 'Dr-Apr\'25/096', '3600/001', 'Labour Charges and Taxi Charges For GFC-RP \r\n', '0', '217000', 'mmk', '', '', 0, 'accepted'),
(153, '2025-04-08', 'Cr-Apr\'25/009', '3600/001', 'Received Money From UAB MMK A/C\r\n', '20000000', '0', 'mmk', '', '', 0, 'accepted'),
(154, '2025-04-08', 'Cr-Apr\'25/009', '3700/003', 'Received Money From UAB MMK A/C\r\n', '0', '20000000', 'mmk', '', '', 0, 'accepted'),
(155, '2025-04-08', 'Dr-Apr\'25/103', '9100/020', 'Paid to Agent Adv 2%, X Ray USA 7,8\r\n', '5000000', '0', 'mmk', '', '', 0, 'accepted'),
(156, '2025-04-08', 'Dr-Apr\'25/103', '3600/001', 'Paid to Agent Adv 2%, X Ray USA 7,8\r\n', '0', '5000000', 'mmk', '', '', 0, 'accepted'),
(157, '2025-04-08', 'Dr-Apr\'25/104', '9100/004', 'Sir Phone Bill\r\n', '3000', '0', 'mmk', '', '', 0, 'accepted'),
(158, '2025-04-08', 'Dr-Apr\'25/104', '3600/001', 'Sir Phone Bill\r\n', '0', '3000', 'mmk', '', '', 0, 'accepted'),
(159, '2025-04-08', 'Dr-Apr\'25/105', '4000/G01', 'Paid to GFC Cold Store Charges\r\n', '10000000', '0', 'mmk', '', '', 0, 'accepted'),
(160, '2025-04-08', 'Dr-Apr\'25/105', '3600/001', 'Paid to GFC Cold Store Charges\r\n', '0', '10000000', 'mmk', '', '', 0, 'accepted'),
(161, '2025-04-08', 'Dr-Apr\'25/106', '9100/006', 'Car Diesel For 3K-1574 (15.674 Liters*3190ks)(19.380 Liters*2580ks)\r\n', '100000', '0', 'mmk', '', '', 0, 'accepted'),
(162, '2025-04-08', 'Dr-Apr\'25/106', '3600/001', 'Car Diesel For 3K-1574 (15.674 Liters*3190ks)(19.380 Liters*2580ks)\r\n', '0', '100000', 'mmk', '', '', 0, 'accepted'),
(163, '2025-04-08', 'Dr-Apr\'25/107', '9100/006', 'Car Diesel For 5L-2848\r\n', '100000', '0', 'mmk', '', '', 0, 'accepted'),
(164, '2025-04-08', 'Dr-Apr\'25/107', '3600/001', 'Car Diesel For 5L-2848\r\n', '0', '100000', 'mmk', '', '', 0, 'accepted'),
(165, '2025-04-08', 'Dr-Apr\'25/108', '9100/005', 'Key 2 pcs*4000ks Purchase For Loading\r\n', '8000', '0', 'mmk', '', '', 0, 'accepted'),
(166, '2025-04-08', 'Dr-Apr\'25/108', '3600/001', 'Key 2 pcs*4000ks Purchase For Loading\r\n', '0', '8000', 'mmk', '', '', 0, 'accepted'),
(167, '2025-04-08', 'Dr-Apr\'25/109', '9100/012', 'Meal Allowance For U Aung Kyaw \r\n', '3500', '0', 'mmk', '', '', 0, 'accepted'),
(168, '2025-04-08', 'Dr-Apr\'25/109', '3600/001', 'Meal Allowance For U Aung Kyaw \r\n', '0', '3500', 'mmk', '', '', 0, 'accepted'),
(169, '2025-04-08', 'Dr-Apr\'25/110', '9100/002', 'Taxi Charges For Wai Pon La go 4000ks+Nyi Nyi W/H Comeback 20000ks\r\n', '24000', '0', 'mmk', '', '', 0, 'accepted'),
(170, '2025-04-08', 'Dr-Apr\'25/110', '3600/001', 'Taxi Charges For Wai Pon La go 4000ks+Nyi Nyi W/H Comeback 20000ks\r\n', '0', '24000', 'mmk', '', '', 0, 'accepted'),
(171, '2025-04-08', 'Dr-Apr\'25/111', '9100/003', 'Water Purchase For W/H 15pcs*1100ks\r\n', '16500', '0', 'mmk', '', '', 0, 'accepted'),
(172, '2025-04-08', 'Dr-Apr\'25/111', '3600/001', 'Water Purchase For W/H 15pcs*1100ks\r\n', '0', '16500', 'mmk', '', '', 0, 'accepted'),
(173, '2025-04-08', 'Dr-Apr\'25/112', '6100/003', 'Penam Bag 1000pcs*585ks and JCV 1pcs*108000ks Purchase For W/H\r\n', '693000', '0', 'mmk', '', '', 0, 'accepted'),
(174, '2025-04-08', 'Dr-Apr\'25/112', '3600/001', 'Penam Bag 1000pcs*585ks and JCV 1pcs*108000ks Purchase For W/H\r\n', '0', '693000', 'mmk', '', '', 0, 'accepted'),
(175, '2025-04-08', 'Dr-Apr\'25/113', '9100/009', 'K-Pay Charges For Penam Bag Money Sent\r\n', '1500', '0', 'mmk', '', '', 0, 'accepted'),
(176, '2025-04-08', 'Dr-Apr\'25/113', '3600/001', 'K-Pay Charges For Penam Bag Money Sent\r\n', '0', '1500', 'mmk', '', '', 0, 'accepted'),
(177, '2025-04-08', 'Dr-Apr\'25/114', '9100/011', 'Donation For Daily 5000ks+ Dogs Rice 2000ks\r\n', '7000', '0', 'mmk', '', '', 0, 'accepted'),
(178, '2025-04-08', 'Dr-Apr\'25/114', '3600/001', 'Donation For Daily 5000ks+ Dogs Rice 2000ks\r\n', '0', '7000', 'mmk', '', '', 0, 'accepted'),
(179, '2025-04-08', 'Dr-Apr\'25/115', '9100/005', 'Guest List Charges For W/H\r\n', '5000', '0', 'mmk', '', '', 0, 'accepted'),
(180, '2025-04-08', 'Dr-Apr\'25/115', '3600/001', 'Guest List Charges For W/H\r\n', '0', '5000', 'mmk', '', '', 0, 'accepted'),
(181, '2025-04-08', 'Dr-Apr\'25/116', '9100/017', 'Sir Melia Yangon Dinner \r\n', '388605', '0', 'mmk', '', '', 0, 'accepted'),
(182, '2025-04-08', 'Dr-Apr\'25/116', '3600/001', 'Sir Melia Yangon Dinner \r\n', '0', '388605', 'mmk', '', '', 0, 'accepted'),
(183, '2025-04-09', 'Cr-Apr\'25/012', '3600/001', 'Canada Money Received From May Yu ($25000)(3.4.25)($25000-$17)=$24983*4380ks\r\n', '109425540', '0', 'usd', '', '', 0, 'accepted'),
(184, '2025-04-09', 'Cr-Apr\'25/012', '3300/003', 'Canada Money Received From May Yu ($25000)(3.4.25)($25000-$17)=$24983*4380ks\r\n', '0', '109425540', 'usd', '', '', 0, 'accepted'),
(185, '2025-04-09', 'Dr-Apr\'25/123', '6100/007', 'Thuzar Adv take For MSL Cold Store Charges\r\n', '600000', '0', 'mmk', '', '', 0, 'accepted'),
(186, '2025-04-09', 'Dr-Apr\'25/123', '3600/001', 'Thuzar Adv take For MSL Cold Store Charges\r\n', '0', '600000', 'mmk', '', '', 0, 'accepted'),
(187, '2025-04-09', 'Dr-Apr\'25/124', '9100/006', 'Car Petro For 3K-1574 (9.4.25) 15.674 Liters*3190ks\r\n', '50000', '0', 'mmk', '', '', 0, 'accepted'),
(188, '2025-04-09', 'Dr-Apr\'25/124', '3600/001', 'Car Petro For 3K-1574 (9.4.25) 15.674 Liters*3190ks\r\n', '0', '50000', 'mmk', '', '', 0, 'accepted'),
(189, '2025-04-09', 'Dr-Apr\'25/125', '9100/014', 'Car Police Catch For 3K-1574\r\n', '12000', '0', 'mmk', '', '', 0, 'accepted'),
(190, '2025-04-09', 'Dr-Apr\'25/125', '3600/001', 'Car Police Catch For 3K-1574\r\n', '0', '12000', 'mmk', '', '', 0, 'accepted'),
(191, '2025-04-09', 'Dr-Apr\'25/126', '9100/002', 'Taxi Charges For Office People 5 pcs For Payment 6:00pm\r\n', '32500', '0', 'mmk', '', '', 0, 'accepted'),
(192, '2025-04-09', 'Dr-Apr\'25/126', '3600/001', 'Taxi Charges For Office People 5 pcs For Payment 6:00pm\r\n', '0', '32500', 'mmk', '', '', 0, 'accepted'),
(193, '2025-04-09', 'Dr-Apr\'25/127', '9100/012', 'Meal Allowance For Office 5 pcs Payment 6:00pm\r\n', '12500', '0', 'mmk', '', '', 0, 'accepted'),
(194, '2025-04-09', 'Dr-Apr\'25/127', '3600/001', 'Meal Allowance For Office 5 pcs Payment 6:00pm\r\n', '0', '12500', 'mmk', '', '', 0, 'accepted'),
(195, '2025-04-09', 'Dr-Apr\'25/128', '4000/k05', 'Paid to Kyaw Zay Ya For Vr no-12448,12466\r\n', '50000000', '0', 'mmk', '', '', 0, 'accepted'),
(196, '2025-04-09', 'Dr-Apr\'25/128', '3600/001', 'Paid to Kyaw Zay Ya For Vr no-12448,12466\r\n', '0', '50000000', 'mmk', '', '', 0, 'accepted'),
(197, '2025-04-09', 'Dr-Apr\'25/129', '6100/007', 'Paid to Ocean Pacific Cold Store Charges\r\n', '10000000', '0', 'mmk', '', '', 0, 'accepted'),
(198, '2025-04-09', 'Dr-Apr\'25/129', '3600/001', 'Paid to Ocean Pacific Cold Store Charges\r\n', '0', '10000000', 'mmk', '', '', 0, 'accepted'),
(199, '2025-04-09', 'Dr-Apr\'25/130', '9100/027', 'Paid to Lawer For USA 10 (2024)(2.4-50000)(9.4-50000)\r\n', '100000', '0', 'mmk', '', '', 0, 'accepted'),
(200, '2025-04-09', 'Dr-Apr\'25/130', '3600/001', 'Paid to Lawer For USA 10 (2024)(2.4-50000)(9.4-50000)\r\n', '0', '100000', 'mmk', '', '', 0, 'accepted'),
(201, '2025-04-10', 'Cr-Apr\'25/013', '3600/001', 'LMG Loan Return From Link Mark For (23.3=4000000,9.4.=50000000)\r\n', '54000000', '0', 'mmk', '', '', 0, 'accepted'),
(202, '2025-04-10', 'Cr-Apr\'25/013', '3400/006', 'LMG Loan Return From Link Mark For (23.3=4000000,9.4.=50000000)\r\n', '0', '54000000', 'mmk', '', '', 0, 'accepted'),
(203, '2025-04-10', 'Cr-Apr\'25/014', '3600/001', 'Cash With Draw From UAB MMK A/C,Chq no-221676\r\n', '44000000', '0', 'mmk', '', '', 0, 'accepted'),
(204, '2025-04-10', 'Cr-Apr\'25/014', '3700/003', 'Cash With Draw From UAB MMK A/C,Chq no-221676\r\n', '0', '44000000', 'mmk', '', '', 0, 'accepted'),
(205, '2025-04-10', 'Dr-Apr\'25/138', '4000/m04', 'Paid to MMMO For Vr Date-27.2,20.3,25.3(2)\r\n', '6000000', '0', 'mmk', '', '', 0, 'accepted'),
(206, '2025-04-10', 'Dr-Apr\'25/138', '3600/001', 'Paid to MMMO For Vr Date-27.2,20.3,25.3(2)\r\n', '0', '6000000', 'mmk', '', '', 0, 'accepted'),
(207, '2025-04-10', 'Dr-Apr\'25/139', '9100/002', 'Taxi Charges For W/H to AYA to UAB to W/H\r\n', '6000', '0', 'mmk', '', '', 0, 'accepted'),
(208, '2025-04-10', 'Dr-Apr\'25/139', '3600/001', 'Taxi Charges For W/H to AYA to UAB to W/H\r\n', '0', '6000', 'mmk', '', '', 0, 'accepted'),
(209, '2025-04-10', 'Dr-Apr\'25/140', '9100/040', 'Booking Cancellation charges For USA Container 2 pcs\r\n', '80000', '0', 'mmk', '', '', 0, 'accepted'),
(210, '2025-04-10', 'Dr-Apr\'25/140', '3600/001', 'Booking Cancellation charges For USA Container 2 pcs\r\n', '0', '80000', 'mmk', '', '', 0, 'accepted'),
(211, '2025-04-10', 'Dr-Apr\'25/141', '9100/041', 'BL and Seal Charges For USA 5,6\r\n', '112000', '0', 'mmk', '', '', 0, 'accepted'),
(212, '2025-04-10', 'Dr-Apr\'25/141', '3600/001', 'BL and Seal Charges For USA 5,6\r\n', '0', '112000', 'mmk', '', '', 0, 'accepted'),
(213, '2025-04-10', 'Dr-Apr\'25/142', '4000/n01', 'Paid to Nanda For Vr no-12922\r\n', '3000000', '0', 'mmk', '', '', 0, 'accepted'),
(214, '2025-04-10', 'Dr-Apr\'25/142', '3600/001', 'Paid to Nanda For Vr no-12922\r\n', '0', '3000000', 'mmk', '', '', 0, 'accepted'),
(215, '2025-04-10', 'Dr-Apr\'25/143', '4000/t23', 'Paid to Thin Zar For Vr-13091\r\n', '2000000', '0', 'mmk', '', '', 0, 'accepted'),
(216, '2025-04-10', 'Dr-Apr\'25/143', '3600/001', 'Paid to Thin Zar For Vr-13091\r\n', '0', '2000000', 'mmk', '', '', 0, 'accepted'),
(217, '2025-04-10', 'Dr-Apr\'25/144', '4000/p03', 'Paid to Pan Thazin For Vr Date-28.3,4.4,5.4\r\n', '5000000', '0', 'mmk', '', '', 0, 'accepted'),
(218, '2025-04-10', 'Dr-Apr\'25/144', '3600/001', 'Paid to Pan Thazin For Vr Date-28.3,4.4,5.4\r\n', '0', '5000000', 'mmk', '', '', 0, 'accepted'),
(219, '2025-04-10', 'Dr-Apr\'25/145', '4000/G03', 'Paid to Golden Fish For Vr Date-6.4.25\r\n', '756000', '0', 'mmk', '', '', 0, 'accepted'),
(220, '2025-04-10', 'Dr-Apr\'25/145', '3600/001', 'Paid to Golden Fish For Vr Date-6.4.25\r\n', '0', '756000', 'mmk', '', '', 0, 'accepted'),
(221, '2025-04-10', 'Dr-Apr\'25/146', '4000/t19', 'Paid to Tin Hlaing For Vr no-12597,12599\r\n', '15000000', '0', 'mmk', '', '', 0, 'accepted'),
(222, '2025-04-10', 'Dr-Apr\'25/146', '3600/001', 'Paid to Tin Hlaing For Vr no-12597,12599\r\n', '0', '15000000', 'mmk', '', '', 0, 'accepted'),
(223, '2025-04-10', 'Dr-Apr\'25/147', '4000/A03', 'Paid to Aung Naing Oo For Vr no-12837,12856,12861\r\n', '15000000', '0', 'mmk', '', '', 0, 'accepted'),
(224, '2025-04-10', 'Dr-Apr\'25/147', '3600/001', 'Paid to Aung Naing Oo For Vr no-12837,12856,12861\r\n', '0', '15000000', 'mmk', '', '', 0, 'accepted'),
(225, '2025-04-10', 'Dr-Apr\'25/148', '4000/k07', 'Paid to Khin Maung Myint For Vr no-12924\r\n', '20000000', '0', 'mmk', '', '', 0, 'accepted'),
(226, '2025-04-10', 'Dr-Apr\'25/148', '3600/001', 'Paid to Khin Maung Myint For Vr no-12924\r\n', '0', '20000000', 'mmk', '', '', 0, 'accepted'),
(227, '2025-04-10', 'Dr-Apr\'25/149', '4000/n04', 'Paid to Nyan Tun For Vr no-13051,13054,13061,13063,13068\r\n', '8897900', '0', 'mmk', '', '', 0, 'accepted'),
(228, '2025-04-10', 'Dr-Apr\'25/149', '3600/001', 'Paid to Nyan Tun For Vr no-13051,13054,13061,13063,13068\r\n', '0', '8897900', 'mmk', '', '', 0, 'accepted'),
(229, '2025-04-10', 'Dr-Apr\'25/150', '4000/p01', 'Paid to Phone Naing For Vr no-12934,12986\r\n', '5000000', '0', 'mmk', '', '', 0, 'accepted'),
(230, '2025-04-10', 'Dr-Apr\'25/150', '3600/001', 'Paid to Phone Naing For Vr no-12934,12986\r\n', '0', '5000000', 'mmk', '', '', 0, 'accepted'),
(231, '2025-04-10', 'Dr-Apr\'25/151', '4000/p04', 'Paid to Promise For Vr Date-24.11,28.11,30.11\r\n', '1510000', '0', 'mmk', '', '', 0, 'accepted'),
(232, '2025-04-10', 'Dr-Apr\'25/151', '3600/001', 'Paid to Promise For Vr Date-24.11,28.11,30.11\r\n', '0', '1510000', 'mmk', '', '', 0, 'accepted'),
(233, '2025-04-13', 'Dr-Apr\'25/152', '9100/020', 'Paid to Agent Bal Money for HT No1 Can-3, USA-5,6\r\n\r\n', '4875250', '0', 'mmk', '', '', 0, 'accepted'),
(234, '2025-04-13', 'Dr-Apr\'25/152', '3600/001', 'Paid to Agent Bal Money for HT No1 Can-3, USA-5,6\r\n\r\n', '0', '4875250', 'mmk', '', '', 0, 'accepted'),
(235, '2025-04-13', 'Dr-Apr\'25/153', '9100/002', 'Taxi charhges for W/H to UAB go for Chq A/C Money Putting\r\n', '3000', '0', 'mmk', '', '', 0, 'accepted'),
(236, '2025-04-13', 'Dr-Apr\'25/153', '3600/001', 'Taxi charhges for W/H to UAB go for Chq A/C Money Putting\r\n', '0', '3000', 'mmk', '', '', 0, 'accepted'),
(237, '2025-04-13', 'Dr-Apr\'25/154', '9100/006', 'Car petrol for 5L-2848 (32.154Liter*3110ks) 12.4\r\n', '100000', '0', 'mmk', '', '', 0, 'accepted'),
(238, '2025-04-13', 'Dr-Apr\'25/154', '3600/001', 'Car petrol for 5L-2848 (32.154Liter*3110ks) 12.4\r\n', '0', '100000', 'mmk', '', '', 0, 'accepted'),
(239, '2025-04-13', 'Dr-Apr\'25/155', '9100/011', 'Donation for Daily W/H (12.4)-5000 and (13.4)-5000\r\n', '10000', '0', 'mmk', '', '', 0, 'accepted'),
(240, '2025-04-13', 'Dr-Apr\'25/155', '3600/001', 'Donation for Daily W/H (12.4)-5000 and (13.4)-5000\r\n', '0', '10000', 'mmk', '', '', 0, 'accepted'),
(241, '2025-04-13', 'Dr-Apr\'25/156', '9100/010', 'Sir paid to GFC for April Bonus \r\n', '300000', '0', 'mmk', '', '', 0, 'accepted'),
(242, '2025-04-13', 'Dr-Apr\'25/156', '3600/001', 'Sir paid to GFC for April Bonus \r\n', '0', '300000', 'mmk', '', '', 0, 'accepted'),
(243, '2025-04-13', 'Dr-Apr\'25/157', '9100/010', 'Sir paid to Police for April Bonus\r\n', '200000', '0', 'mmk', '', '', 0, 'accepted'),
(244, '2025-04-13', 'Dr-Apr\'25/157', '3600/001', 'Sir paid to Police for April Bonus\r\n', '0', '200000', 'mmk', '', '', 0, 'accepted'),
(245, '2025-04-13', 'Dr-Apr\'25/158', '9100/011', 'Sir Donation paid to All worker (12.4)\r\n', '100000', '0', 'mmk', '', '', 0, 'accepted'),
(246, '2025-04-13', 'Dr-Apr\'25/158', '3600/001', 'Sir Donation paid to All worker (12.4)\r\n', '0', '100000', 'mmk', '', '', 0, 'accepted'),
(247, '2025-04-22', 'Dr-Apr\'25/159', '9100/006', 'Car Diesel for 3K-1574 (18.47) 16.892Liter*2960ks\r\n', '50000', '0', 'mmk', '', '', 0, 'accepted'),
(248, '2025-04-22', 'Dr-Apr\'25/159', '3600/001', 'Car Diesel for 3K-1574 (18.47) 16.892Liter*2960ks\r\n', '0', '50000', 'mmk', '', '', 0, 'accepted'),
(249, '2025-04-22', 'Dr-Apr\'25/160', '9100/014', 'Engion Oil purchase for 3K-1574\r\n', '15000', '0', 'mmk', '', '', 0, 'accepted'),
(250, '2025-04-22', 'Dr-Apr\'25/160', '3600/001', 'Engion Oil purchase for 3K-1574\r\n', '0', '15000', 'mmk', '', '', 0, 'accepted'),
(251, '2025-04-22', 'Dr-Apr\'25/161', '9100/014', 'Battery Repair charges for 3K-1574\r\n', '10000', '0', 'mmk', '', '', 0, 'accepted'),
(252, '2025-04-22', 'Dr-Apr\'25/161', '3600/001', 'Battery Repair charges for 3K-1574\r\n', '0', '10000', 'mmk', '', '', 0, 'accepted'),
(253, '2025-04-22', 'Dr-Apr\'25/162', '9100/002', 'Taxi charges for Battery repair go/back\r\n', '6000', '0', 'mmk', '', '', 0, 'accepted'),
(254, '2025-04-22', 'Dr-Apr\'25/162', '3600/001', 'Taxi charges for Battery repair go/back\r\n', '0', '6000', 'mmk', '', '', 0, 'accepted'),
(255, '2025-04-22', 'Dr-Apr\'25/163', '9100/045', 'Cleaning Material purchase for EO\r\n', '44000', '0', 'mmk', '', '', 0, 'accepted'),
(256, '2025-04-22', 'Dr-Apr\'25/163', '3600/001', 'Cleaning Material purchase for EO\r\n', '0', '44000', 'mmk', '', '', 0, 'accepted'),
(257, '2025-04-22', 'Dr-Apr\'25/164', '9100/002', 'Taxi charges for cleaning material purchase \r\n', '4000', '0', 'mmk', '', '', 0, 'accepted'),
(258, '2025-04-22', 'Dr-Apr\'25/164', '3600/001', 'Taxi charges for cleaning material purchase \r\n', '0', '4000', 'mmk', '', '', 0, 'accepted'),
(259, '2025-04-22', 'Dr-Apr\'25/165', '9100/002', 'Taxi charges for Market\r\n', '30000', '0', 'mmk', '', '', 0, 'accepted'),
(260, '2025-04-22', 'Dr-Apr\'25/165', '3600/001', 'Taxi charges for Market\r\n', '0', '30000', 'mmk', '', '', 0, 'accepted'),
(261, '2025-04-22', 'Dr-Apr\'25/166', '9100/003', 'Water purchase for EO+CC\r\n', '11000', '0', 'mmk', '', '', 0, 'accepted'),
(262, '2025-04-22', 'Dr-Apr\'25/166', '3600/001', 'Water purchase for EO+CC\r\n', '0', '11000', 'mmk', '', '', 0, 'accepted'),
(263, '2025-04-22', 'Dr-Apr\'25/167', '9100/011', 'Donation for Dogs (15,16)\r\n', '15000', '0', 'mmk', '', '', 0, 'accepted'),
(264, '2025-04-22', 'Dr-Apr\'25/167', '3600/001', 'Donation for Dogs (15,16)\r\n', '0', '15000', 'mmk', '', '', 0, 'accepted'),
(265, '2025-04-22', 'Dr-Apr\'25/168', '9100/003', 'Water purchase for EO (13.4.25)\r\n', '5500', '0', 'mmk', '', '', 0, 'accepted'),
(266, '2025-04-22', 'Dr-Apr\'25/168', '3600/001', 'Water purchase for EO (13.4.25)\r\n', '0', '5500', 'mmk', '', '', 0, 'accepted'),
(267, '2025-04-22', 'Dr-Apr\'25/169', '6100/002', 'Ice charges for Market (19.4.25)\r\n', '30000', '0', 'mmk', '', '', 0, 'accepted'),
(268, '2025-04-22', 'Dr-Apr\'25/169', '3600/001', 'Ice charges for Market (19.4.25)\r\n', '0', '30000', 'mmk', '', '', 0, 'accepted'),
(269, '2025-04-22', 'Dr-Apr\'25/170', '6100/001', 'Labour charges for Market (19.4.25)\r\n', '2000', '0', 'mmk', '', '', 0, 'accepted'),
(270, '2025-04-22', 'Dr-Apr\'25/170', '3600/001', 'Labour charges for Market (19.4.25)\r\n', '0', '2000', 'mmk', '', '', 0, 'accepted'),
(271, '2025-04-22', 'Dr-Apr\'25/171', '6100/002', 'Ice charge for Hilsa Cutpiece\r\n', '262500', '0', 'mmk', '', '', 0, 'accepted'),
(272, '2025-04-22', 'Dr-Apr\'25/171', '3600/001', 'Ice charge for Hilsa Cutpiece\r\n', '0', '262500', 'mmk', '', '', 0, 'accepted'),
(273, '2025-04-22', 'Dr-Apr\'25/172', '9100/011', 'Donation for Dogs purchase chicken for 2days(17,18)\r\n', '15000', '0', 'mmk', '', '', 0, 'accepted'),
(274, '2025-04-22', 'Dr-Apr\'25/172', '3600/001', 'Donation for Dogs purchase chicken for 2days(17,18)\r\n', '0', '15000', 'mmk', '', '', 0, 'accepted'),
(275, '2025-04-22', 'Dr-Apr\'25/173', '9100/003', 'Water purchase for W/H 6pcs*1100ks\r\n', '6600', '0', 'mmk', '', '', 0, 'accepted'),
(276, '2025-04-22', 'Dr-Apr\'25/173', '3600/001', 'Water purchase for W/H 6pcs*1100ks\r\n', '0', '6600', 'mmk', '', '', 0, 'accepted'),
(277, '2025-04-22', 'Dr-Apr\'25/174', '9100/002', 'Taxi charges for Market (19.4.25) \r\n', '30000', '0', 'mmk', '', '', 0, 'accepted'),
(278, '2025-04-22', 'Dr-Apr\'25/174', '3600/001', 'Taxi charges for Market (19.4.25) \r\n', '0', '30000', 'mmk', '', '', 0, 'accepted'),
(279, '2025-04-22', 'Dr-Apr\'25/175', '9100/002', 'Taxi charges for Market (20.4.25)\r\n', '30000', '0', 'mmk', '', '', 0, 'accepted'),
(280, '2025-04-22', 'Dr-Apr\'25/175', '3600/001', 'Taxi charges for Market (20.4.25)\r\n', '0', '30000', 'mmk', '', '', 0, 'accepted'),
(281, '2025-04-22', 'Dr-Apr\'25/176', '9100/002', 'Taxi charges for Battery Take ( Thandar 13 st, Wai Pon La)\r\n', '8000', '0', 'mmk', '', '', 0, 'accepted'),
(282, '2025-04-22', 'Dr-Apr\'25/176', '3600/001', 'Taxi charges for Battery Take ( Thandar 13 st, Wai Pon La)\r\n', '0', '8000', 'mmk', '', '', 0, 'accepted'),
(283, '2025-04-22', 'Dr-Apr\'25/177', '9100/006', 'Car Diesel for 3K-1574 (21.4.25)16.892Liter*2960ks\r\n', '50000', '0', 'mmk', '', '', 0, 'accepted'),
(284, '2025-04-22', 'Dr-Apr\'25/177', '3600/001', 'Car Diesel for 3K-1574 (21.4.25)16.892Liter*2960ks\r\n', '0', '50000', 'mmk', '', '', 0, 'accepted'),
(285, '2025-04-22', 'Dr-Apr\'25/178', '9100/011', 'Donation for Dogs (19,20)\r\n', '14900', '0', 'mmk', '', '', 0, 'accepted'),
(286, '2025-04-22', 'Dr-Apr\'25/178', '3600/001', 'Donation for Dogs (19,20)\r\n', '0', '14900', 'mmk', '', '', 0, 'accepted'),
(287, '2025-04-22', 'Dr-Apr\'25/179', '9100/002', 'Taxi charges for Kaymarti to W/H (Ice money take)20.4.25\r\n', '6000', '0', 'mmk', '', '', 0, 'accepted'),
(288, '2025-04-22', 'Dr-Apr\'25/179', '3600/001', 'Taxi charges for Kaymarti to W/H (Ice money take)20.4.25\r\n', '0', '6000', 'mmk', '', '', 0, 'accepted'),
(289, '2025-04-22', 'Dr-Apr\'25/180', '9100/045', 'Purchase Soap for CC Cleaning\r\n', '6000', '0', 'mmk', '', '', 0, 'accepted'),
(290, '2025-04-22', 'Dr-Apr\'25/180', '3600/001', 'Purchase Soap for CC Cleaning\r\n', '0', '6000', 'mmk', '', '', 0, 'accepted'),
(291, '2025-04-22', 'Dr-Apr\'25/181', '9100/010', 'All  people April \'25 Bonus\r\n', '23485240', '0', 'mmk', '', '', 0, 'accepted'),
(292, '2025-04-22', 'Dr-Apr\'25/181', '3600/001', 'All  people April \'25 Bonus\r\n', '0', '23485240', 'mmk', '', '', 0, 'accepted'),
(293, '2025-04-22', 'Dr-Apr\'25/182', '9100/002', 'Taxi charges for Market (16.4.25)\r\n\r\n', '34000', '0', 'mmk', '', '', 0, 'accepted'),
(294, '2025-04-22', 'Dr-Apr\'25/182', '3600/001', 'Taxi charges for Market (16.4.25)\r\n\r\n', '0', '34000', 'mmk', '', '', 0, 'accepted'),
(295, '2025-04-22', 'Dr-Apr\'25/183', '9100/012', 'Meal Allowance for Market (16.4.25) Am 2pcs+Lunch 2pcs\r\n', '7000', '0', 'mmk', '', '', 0, 'accepted'),
(296, '2025-04-22', 'Dr-Apr\'25/183', '3600/001', 'Meal Allowance for Market (16.4.25) Am 2pcs+Lunch 2pcs\r\n', '0', '7000', 'mmk', '', '', 0, 'accepted'),
(297, '2025-04-23', 'Dr-Apr\'25/185', '3600/001', 'Cash Withdraw  from LM UAB (MMK),Chq-221677\r\n', '20000000', '0', 'mmk', '', '', 0, 'accepted'),
(298, '2025-04-23', 'Dr-Apr\'25/185', '3700/003', 'Cash Withdraw  from LM UAB (MMK),Chq-221677\r\n', '0', '20000000', 'mmk', '', '', 0, 'accepted'),
(299, '2025-04-23', 'Dr-Apr\'25/186', '9100/002', 'Taxi Charges for W/H to Sir House \r\n', '5000', '0', 'mmk', '', '', 0, 'accepted'),
(300, '2025-04-23', 'Dr-Apr\'25/186', '3600/001', 'Taxi Charges for W/H to Sir House \r\n', '0', '5000', 'mmk', '', '', 0, 'accepted'),
(301, '2025-04-23', 'Dr-Apr\'25/187', '9100/041', 'BL & Seal charges for USA -07,08/2025 Ref=6414516650, 6414516370, 2*56000MMK (Pr-016)\r\n', '112000', '0', 'mmk', '', '', 0, 'accepted'),
(302, '2025-04-23', 'Dr-Apr\'25/187', '3600/001', 'BL & Seal charges for USA -07,08/2025 Ref=6414516650, 6414516370, 2*56000MMK (Pr-016)\r\n', '0', '112000', 'mmk', '', '', 0, 'accepted'),
(303, '2025-04-23', 'Dr-Apr\'25/188', '9100/002', 'Taxi charges for House Air Way Bill\r\n', '37000', '0', 'mmk', '', '', 0, 'accepted'),
(304, '2025-04-23', 'Dr-Apr\'25/188', '3600/001', 'Taxi charges for House Air Way Bill\r\n', '0', '37000', 'mmk', '', '', 0, 'accepted'),
(305, '2025-04-23', 'Dr-Apr\'25/189', '9100/026', 'House Air Way Renew KBZ charges and Bank charges (700000+2600)\r\n', '702600', '0', 'mmk', '', '', 0, 'accepted'),
(306, '2025-04-23', 'Dr-Apr\'25/189', '3600/001', 'House Air Way Renew KBZ charges and Bank charges (700000+2600)\r\n', '0', '702600', 'mmk', '', '', 0, 'accepted'),
(307, '2025-04-23', 'Dr-Apr\'25/190', '9100/016', 'House Air Way Renew copy+file charges\r\n', '20000', '0', 'mmk', '', '', 0, 'accepted'),
(308, '2025-04-23', 'Dr-Apr\'25/190', '3600/001', 'House Air Way Renew copy+file charges\r\n', '0', '20000', 'mmk', '', '', 0, 'accepted'),
(309, '2025-04-23', 'Dr-Apr\'25/191', '9100/012', 'Meal  Allowance for Office 2pcs\r\n', '2700', '0', 'mmk', '', '', 0, 'accepted'),
(310, '2025-04-23', 'Dr-Apr\'25/191', '3600/001', 'Meal  Allowance for Office 2pcs\r\n', '0', '2700', 'mmk', '', '', 0, 'accepted'),
(311, '2025-04-23', 'Dr-Apr\'25/192', '9100/002', 'Taxi charges for W/H to UAB Money Take\r\n', '5000', '0', 'mmk', '', '', 0, 'accepted'),
(312, '2025-04-23', 'Dr-Apr\'25/192', '3600/001', 'Taxi charges for W/H to UAB Money Take\r\n', '0', '5000', 'mmk', '', '', 0, 'accepted'),
(313, '2025-04-23', 'Dr-Apr\'25/193', '9100/006', 'Car Diesel  for 3K-1574 (Pr-017)\r\n', '50000', '0', 'mmk', '', '', 0, 'accepted'),
(314, '2025-04-23', 'Dr-Apr\'25/193', '3600/001', 'Car Diesel  for 3K-1574 (Pr-017)\r\n', '0', '50000', 'mmk', '', '', 0, 'accepted'),
(315, '2025-04-23', 'Dr-Apr\'25/194', '9100/003', 'Water purchase 15pcs*1100ks for (Eo+CC) Pr-017\r\n', '16500', '0', 'mmk', '', '', 0, 'accepted'),
(316, '2025-04-23', 'Dr-Apr\'25/194', '3600/001', 'Water purchase 15pcs*1100ks for (Eo+CC) Pr-017\r\n', '0', '16500', 'mmk', '', '', 0, 'accepted'),
(317, '2025-04-23', 'Dr-Apr\'25/195', '9100/012', 'Purchase chicken and Fruit for Sir House (21500+2000) Pr-017\r\n', '23500', '0', 'mmk', '', '', 0, 'accepted'),
(318, '2025-04-23', 'Dr-Apr\'25/195', '3600/001', 'Purchase chicken and Fruit for Sir House (21500+2000) Pr-017\r\n', '0', '23500', 'mmk', '', '', 0, 'accepted'),
(319, '2025-04-23', 'Dr-Apr\'25/196', '9100/011', 'Donation for Dogs Chicken purchase (Pr-017)\r\n', '18000', '0', 'mmk', '', '', 0, 'accepted'),
(320, '2025-04-23', 'Dr-Apr\'25/196', '3600/001', 'Donation for Dogs Chicken purchase (Pr-017)\r\n', '0', '18000', 'mmk', '', '', 0, 'accepted'),
(321, '2025-04-23', 'Dr-Apr\'25/197', '9100/005', 'Purchase Mosquito Spary for Sir House (Pr-017)\r\n', '10500', '0', 'mmk', '', '', 0, 'accepted'),
(322, '2025-04-23', 'Dr-Apr\'25/197', '3600/001', 'Purchase Mosquito Spary for Sir House (Pr-017)\r\n', '0', '10500', 'mmk', '', '', 0, 'accepted'),
(323, '2025-04-23', 'Dr-Apr\'25/198', '9100/002', 'Taxi charges for HHK to CC (Pr-017)\r\n', '16500', '0', 'mmk', '', '', 0, 'accepted'),
(324, '2025-04-23', 'Dr-Apr\'25/198', '3600/001', 'Taxi charges for HHK to CC (Pr-017)\r\n', '0', '16500', 'mmk', '', '', 0, 'accepted'),
(325, '2025-04-24', 'Dr-Apr\'25/200', '9100/002', 'Taxi Charges For In Bound Renew\r\n', '33000', '0', 'mmk', '', '', 0, 'accepted'),
(326, '2025-04-24', 'Dr-Apr\'25/200', '3600/001', 'Taxi Charges For In Bound Renew\r\n', '0', '33000', 'mmk', '', '', 0, 'accepted'),
(327, '2025-04-24', 'Dr-Apr\'25/201', '9100/029', 'Undertaken Charges For InBound Received Paper People For 2 pcs (Inbound Tour License Renew)\r\n', '42000', '0', 'mmk', '', '', 0, 'accepted'),
(328, '2025-04-24', 'Dr-Apr\'25/201', '3600/001', 'Undertaken Charges For InBound Received Paper People For 2 pcs (Inbound Tour License Renew)\r\n', '0', '42000', 'mmk', '', '', 0, 'accepted'),
(329, '2025-04-24', 'Dr-Apr\'25/202', '9100/040', 'Hilsa Micro Test For Chill (Aircargo)\r\n', '225000', '0', 'mmk', '', '', 0, 'accepted'),
(330, '2025-04-24', 'Dr-Apr\'25/202', '3600/001', 'Hilsa Micro Test For Chill (Aircargo)\r\n', '0', '225000', 'mmk', '', '', 0, 'accepted'),
(331, '2025-04-24', 'Dr-Apr\'25/203', '9100/006', 'Car Diesel For 3K-1574 (24.4.25)(Pr-018)16.892 Liters*2960ks\r\n', '50000', '0', 'mmk', '', '', 0, 'accepted'),
(332, '2025-04-24', 'Dr-Apr\'25/203', '3600/001', 'Car Diesel For 3K-1574 (24.4.25)(Pr-018)16.892 Liters*2960ks\r\n', '0', '50000', 'mmk', '', '', 0, 'accepted'),
(333, '2025-04-24', 'Dr-Apr\'25/204', '9100/045', 'Material Purchase For Cleaning For EO (Pr-018) (သံဂေါ်ပြား ၁ခု+သစ်သားရိုး ၁ခု)\r\n', '40000', '0', 'mmk', '', '', 0, 'accepted'),
(334, '2025-04-24', 'Dr-Apr\'25/204', '3600/001', 'Material Purchase For Cleaning For EO (Pr-018) (သံဂေါ်ပြား ၁ခု+သစ်သားရိုး ၁ခု)\r\n', '0', '40000', 'mmk', '', '', 0, 'accepted'),
(335, '2025-04-24', 'Dr-Apr\'25/205', '9100/005', 'Northokkalapa Industry Zone Fees For W/H(Jan\'25 to March\'25) (Pr-018)\r\n', '30000', '0', 'mmk', '', '', 0, 'accepted'),
(336, '2025-04-24', 'Dr-Apr\'25/205', '3600/001', 'Northokkalapa Industry Zone Fees For W/H(Jan\'25 to March\'25) (Pr-018)\r\n', '0', '30000', 'mmk', '', '', 0, 'accepted'),
(337, '2025-04-24', 'Dr-Apr\'25/206', '9100/018', 'Meter Bill For Sir March\'25 (Pr-018)\r\n', '65000', '0', 'mmk', '', '', 0, 'accepted'),
(338, '2025-04-24', 'Dr-Apr\'25/206', '3600/001', 'Meter Bill For Sir March\'25 (Pr-018)\r\n', '0', '65000', 'mmk', '', '', 0, 'accepted'),
(339, '2025-04-24', 'Dr-Apr\'25/207', '9100/018', 'Meter Bill For EO March\'25 (Pr-018)\r\n', '48500', '0', 'mmk', '', '', 0, 'accepted'),
(340, '2025-04-24', 'Dr-Apr\'25/207', '3600/001', 'Meter Bill For EO March\'25 (Pr-018)\r\n', '0', '48500', 'mmk', '', '', 0, 'accepted'),
(341, '2025-04-24', 'Dr-Apr\'25/208', '9100/018', 'Meter Bill For W/H March\'25 (Pr-018)\r\n', '316500', '0', 'mmk', '', '', 0, 'accepted'),
(342, '2025-04-24', 'Dr-Apr\'25/208', '3600/001', 'Meter Bill For W/H March\'25 (Pr-018)\r\n', '0', '316500', 'mmk', '', '', 0, 'accepted'),
(343, '2025-04-24', 'Dr-Apr\'25/209', '9100/005', 'Northokkalapa Industry Zones Fees For EO (Jan\'25 to March\'25) (Pr-018)\r\n', '30000', '0', 'mmk', '', '', 0, 'accepted'),
(344, '2025-04-24', 'Dr-Apr\'25/209', '3600/001', 'Northokkalapa Industry Zones Fees For EO (Jan\'25 to March\'25) (Pr-018)\r\n', '0', '30000', 'mmk', '', '', 0, 'accepted'),
(345, '2025-04-24', 'Dr-Apr\'25/210', '9100/002', 'Taxi Charges For Meter Bill + Zone Fees (Pr-018)\r\n', '6000', '0', 'mmk', '', '', 0, 'accepted'),
(346, '2025-04-24', 'Dr-Apr\'25/210', '3600/001', 'Taxi Charges For Meter Bill + Zone Fees (Pr-018)\r\n', '0', '6000', 'mmk', '', '', 0, 'accepted'),
(347, '2025-04-24', 'Dr-Apr\'25/211', '9100/014', 'Police Catch For 5L-2848 (Pr-018) မီးပွိုင့် ကျော် ရဲဖမ်း \r\n', '40000', '0', 'mmk', '', '', 0, 'accepted');
INSERT INTO `transaction` (`id`, `date`, `voucher_no`, `ac_code`, `description`, `debit`, `credit`, `currency`, `sr_no`, `container_no`, `bank_charges`, `status`) VALUES
(348, '2025-04-24', 'Dr-Apr\'25/211', '3600/001', 'Police Catch For 5L-2848 (Pr-018) မီးပွိုင့် ကျော် ရဲဖမ်း \r\n', '0', '40000', 'mmk', '', '', 0, 'accepted'),
(349, '2025-04-24', 'Dr-Apr\'25/212', '9100/014', 'Car Washing Charges For 5L-2848 (Pr-018) ကားရေဆေး+အမွှေးဆီ\r\n', '30000', '0', 'mmk', '', '', 0, 'accepted'),
(350, '2025-04-24', 'Dr-Apr\'25/212', '3600/001', 'Car Washing Charges For 5L-2848 (Pr-018) ကားရေဆေး+အမွှေးဆီ\r\n', '0', '30000', 'mmk', '', '', 0, 'accepted'),
(351, '2025-04-24', 'Dr-Apr\'25/213', '9100/025', 'Car Parking Charges For Airport (Pr-018)\r\n', '10000', '0', 'mmk', '', '', 0, 'accepted'),
(352, '2025-04-24', 'Dr-Apr\'25/213', '3600/001', 'Car Parking Charges For Airport (Pr-018)\r\n', '0', '10000', 'mmk', '', '', 0, 'accepted'),
(353, '2025-04-24', 'Dr-Apr\'25/214', '9100/014', 'Air Put Charges For 5L-2848 (Pr-018)\r\n', '3000', '0', 'mmk', '', '', 0, 'accepted'),
(354, '2025-04-24', 'Dr-Apr\'25/214', '3600/001', 'Air Put Charges For 5L-2848 (Pr-018)\r\n', '0', '3000', 'mmk', '', '', 0, 'accepted'),
(355, '2025-04-24', 'Dr-Apr\'25/215', '9100/006', 'Car Diesel Charges For 5L-2848 (Pr-018) 23.4.2025 , 28.571 Liters*2800ks\r\n', '80000', '0', 'mmk', '', '', 0, 'accepted'),
(356, '2025-04-24', 'Dr-Apr\'25/215', '3600/001', 'Car Diesel Charges For 5L-2848 (Pr-018) 23.4.2025 , 28.571 Liters*2800ks\r\n', '0', '80000', 'mmk', '', '', 0, 'accepted'),
(357, '2025-04-24', 'Dr-Apr\'25/216', '9100/006', 'Car Diesel For 5L-2848 (Pr-018) 22.4.2025 , 16.071 Liters*2800ks\r\n', '45000', '0', 'mmk', '', '', 0, 'accepted'),
(358, '2025-04-24', 'Dr-Apr\'25/216', '3600/001', 'Car Diesel For 5L-2848 (Pr-018) 22.4.2025 , 16.071 Liters*2800ks\r\n', '0', '45000', 'mmk', '', '', 0, 'accepted'),
(359, '2025-04-24', 'Dr-Apr\'25/217', '9100/014', 'Car Police Catch For 3K-1574 (Pr-018) လေဆိပ်အကျော်ရဲဖမ်း \r\n', '15000', '0', 'mmk', '', '', 0, 'accepted'),
(360, '2025-04-24', 'Dr-Apr\'25/217', '3600/001', 'Car Police Catch For 3K-1574 (Pr-018) လေဆိပ်အကျော်ရဲဖမ်း \r\n', '0', '15000', 'mmk', '', '', 0, 'accepted'),
(361, '2025-04-24', 'Dr-Apr\'25/218', '9100/025', 'Car Parking Charges For 3K-1574 (Pr-018)\r\n', '2000', '0', 'mmk', '', '', 0, 'accepted'),
(362, '2025-04-24', 'Dr-Apr\'25/218', '3600/001', 'Car Parking Charges For 3K-1574 (Pr-018)\r\n', '0', '2000', 'mmk', '', '', 0, 'accepted'),
(363, '2025-04-24', 'Dr-Apr\'25/219', '6100/003', 'Plastic Rope 3 pcs Purchase For W/H (Pr-018)\r\n', '38000', '0', 'mmk', '', '', 0, 'accepted'),
(364, '2025-04-24', 'Dr-Apr\'25/219', '3600/001', 'Plastic Rope 3 pcs Purchase For W/H (Pr-018)\r\n', '0', '38000', 'mmk', '', '', 0, 'accepted'),
(365, '2025-04-24', 'Dr-Apr\'25/220', '6100/003', 'Salt,Knife and Big Knife Purchase For WP (Pr-018)\r\n', '58600', '0', 'mmk', '', '', 0, 'accepted'),
(366, '2025-04-24', 'Dr-Apr\'25/220', '3600/001', 'Salt,Knife and Big Knife Purchase For WP (Pr-018)\r\n', '0', '58600', 'mmk', '', '', 0, 'accepted'),
(367, '2025-04-24', 'Dr-Apr\'25/221', '9100/002', 'Taxi Charges For Knife Purchase (Pr-018)\r\n', '8000', '0', 'mmk', '', '', 0, 'accepted'),
(368, '2025-04-24', 'Dr-Apr\'25/221', '3600/001', 'Taxi Charges For Knife Purchase (Pr-018)\r\n', '0', '8000', 'mmk', '', '', 0, 'accepted'),
(369, '2025-04-24', 'Dr-Apr\'25/222', '9100/005', 'Guest List Charges For W/H (Pr-018)\r\n', '2000', '0', 'mmk', '', '', 0, 'accepted'),
(370, '2025-04-24', 'Dr-Apr\'25/222', '3600/001', 'Guest List Charges For W/H (Pr-018)\r\n', '0', '2000', 'mmk', '', '', 0, 'accepted'),
(371, '2025-04-24', 'Dr-Apr\'25/223', '9100/012', 'Meal Allowance For U Aung Kyaw (Pr-018)\r\n', '3000', '0', 'mmk', '', '', 0, 'accepted'),
(372, '2025-04-24', 'Dr-Apr\'25/223', '3600/001', 'Meal Allowance For U Aung Kyaw (Pr-018)\r\n', '0', '3000', 'mmk', '', '', 0, 'accepted'),
(373, '2025-04-24', 'Dr-Apr\'25/224', '3400/006', 'Link Mark Global Take From Link Mark Office for Loan\r\n', '10000000', '0', 'mmk', '', '', 0, 'accepted'),
(374, '2025-04-24', 'Dr-Apr\'25/224', '3600/001', 'Link Mark Global Take From Link Mark Office for Loan\r\n', '0', '10000000', 'mmk', '', '', 0, 'accepted'),
(377, '2025-04-01', 'Dr-Apr\'25/012', '4000/A19', 'Paid to Aye Aye Maw for Vr.12911 (Ch No.206425)\r\n', '7000000', '0', 'mmk', '', '', 0, 'accepted'),
(378, '2025-04-01', 'Dr-Apr\'25/012', '3700/003', 'Paid to Aye Aye Maw for Vr.12911 (Ch No.206425)\r\n', '0', '7000000', 'mmk', '', '', 0, 'accepted'),
(379, '2025-04-01', 'Dr-Apr\'25/013', '4000/k16', ' Paid to Kyaw Min Latt for Vr.12869,12877 (Ch No.221601) \r\n', '5000000', '0', 'mmk', '', '', 0, 'accepted'),
(380, '2025-04-01', 'Dr-Apr\'25/013', '3700/003', ' Paid to Kyaw Min Latt for Vr.12869,12877 (Ch No.221601) \r\n', '0', '5000000', 'mmk', '', '', 0, 'accepted'),
(381, '2025-04-01', 'Dr-Apr\'25/014', '4000/t07', 'Paid to Thaung Tun for Vr.12896,12902,12929,13042 (Ch No.221604)\r\n', '10000000', '0', 'mmk', '', '', 0, 'accepted'),
(382, '2025-04-01', 'Dr-Apr\'25/014', '3700/003', 'Paid to Thaung Tun for Vr.12896,12902,12929,13042 (Ch No.221604)\r\n', '0', '10000000', 'mmk', '', '', 0, 'accepted'),
(383, '2025-04-01', 'Dr-Apr\'25/015', '4000/S06', 'Paid to Soe Thein for Vr.12596 (Ch No.221605)\r\n', '20000000', '0', 'mmk', '', '', 0, 'accepted'),
(384, '2025-04-01', 'Dr-Apr\'25/015', '3700/003', 'Paid to Soe Thein for Vr.12596 (Ch No.221605)\r\n', '0', '20000000', 'mmk', '', '', 0, 'accepted'),
(385, '2025-04-01', 'Dr-Apr\'25/016', '4000/k05', 'Paid to Kyaw Zay Ya for Vr. (Ch No.221606)\r\n', '30000000', '0', 'mmk', '', '', 0, 'accepted'),
(386, '2025-04-01', 'Dr-Apr\'25/016', '3700/003', 'Paid to Kyaw Zay Ya for Vr. (Ch No.221606)\r\n', '0', '30000000', 'mmk', '', '', 0, 'accepted'),
(387, '2025-04-01', 'Dr-Apr\'25/017', '4000/A01', 'Paid to AK for Vr.12785 (Ch No.221607)\r\n', '10000000', '0', 'mmk', '', '', 0, 'accepted'),
(388, '2025-04-01', 'Dr-Apr\'25/017', '3700/003', 'Paid to AK for Vr.12785 (Ch No.221607)\r\n', '0', '10000000', 'mmk', '', '', 0, 'accepted'),
(389, '2025-04-01', 'Dr-Apr\'25/018', '4000/t11', 'Paid to Tun Zaw Min for Vr.12623,12636 (Ch No.221608)\r\n', '25000000', '0', 'mmk', '', '', 0, 'accepted'),
(390, '2025-04-01', 'Dr-Apr\'25/018', '3700/003', 'Paid to Tun Zaw Min for Vr.12623,12636 (Ch No.221608)\r\n', '0', '25000000', 'mmk', '', '', 0, 'accepted'),
(391, '2025-04-01', 'Dr-Apr\'25/019', '4000/C03', 'Paid to Chit Ko for Vr.12905 (Ch No.221613)\r\n', '5000000', '0', 'mmk', '', '', 0, 'accepted'),
(392, '2025-04-01', 'Dr-Apr\'25/019', '3700/003', 'Paid to Chit Ko for Vr.12905 (Ch No.221613)\r\n', '0', '5000000', 'mmk', '', '', 0, 'accepted'),
(393, '2025-04-01', 'Dr-Apr\'25/020', '4000/N04', 'Paid to Nyan Tun for Vr.13048,13051 (Ch No.221614)\r\n', '6000000', '0', 'mmk', '', '', 0, 'accepted'),
(394, '2025-04-01', 'Dr-Apr\'25/020', '3700/003', 'Paid to Nyan Tun for Vr.13048,13051 (Ch No.221614)\r\n', '0', '6000000', 'mmk', '', '', 0, 'accepted'),
(395, '2025-04-01', 'Dr-Apr\'25/021', '4000/001', 'Paid to 4 Zaw for Vr.12913 (Ch No.221615)\r\n', '5000000', '0', 'mmk', '', '', 0, 'accepted'),
(396, '2025-04-01', 'Dr-Apr\'25/021', '3700/003', 'Paid to 4 Zaw for Vr.12913 (Ch No.221615)\r\n', '0', '5000000', 'mmk', '', '', 0, 'accepted'),
(397, '2025-04-01', 'Dr-Apr\'25/022', '4000/t02', 'Paid to Thein Htay for Vr.13023,13028 (Ch No.221609)\r\n', '10000000', '0', 'mmk', '', '', 0, 'accepted'),
(398, '2025-04-01', 'Dr-Apr\'25/022', '3700/003', 'Paid to Thein Htay for Vr.13023,13028 (Ch No.221609)\r\n', '0', '10000000', 'mmk', '', '', 0, 'accepted'),
(399, '2025-04-01', 'Dr-Apr\'25/023', '4000/t03', 'Paid to Thin Thin Yee for Vr.12789\r\n', '7000000', '0', 'mmk', '', '', 0, 'accepted'),
(400, '2025-04-01', 'Dr-Apr\'25/023', '3700/003', 'Paid to Thin Thin Yee for Vr.12789\r\n', '0', '7000000', 'mmk', '', '', 0, 'accepted'),
(401, '2025-04-01', 'Dr-Apr\'25/024', '4000/S01', 'Paid to Shwe Late for Vr.12730 (Ch No.221611)\r\n', '7000000', '0', 'mmk', '', '', 0, 'accepted'),
(402, '2025-04-01', 'Dr-Apr\'25/024', '3700/003', 'Paid to Shwe Late for Vr.12730 (Ch No.221611)\r\n', '0', '7000000', 'mmk', '', '', 0, 'accepted'),
(403, '2025-04-01', 'Dr-Apr\'25/025', '4000/t01', 'Paid to Thet Paing for Vr.12910,12937 (Ch No.221612)\r\n', '7000000', '0', 'mmk', '', '', 0, 'accepted'),
(404, '2025-04-01', 'Dr-Apr\'25/025', '3700/003', 'Paid to Thet Paing for Vr.12910,12937 (Ch No.221612)\r\n', '0', '7000000', 'mmk', '', '', 0, 'accepted'),
(405, '2025-04-01', 'Dr-Apr\'25/026', '4000/s04', 'Paid to Si Thu for Vr.12622,12669 (Ch No.221616)\r\n', '7000000', '0', 'mmk', '', '', 0, 'accepted'),
(406, '2025-04-01', 'Dr-Apr\'25/026', '3700/003', 'Paid to Si Thu for Vr.12622,12669 (Ch No.221616)\r\n', '0', '7000000', 'mmk', '', '', 0, 'accepted'),
(407, '2025-04-01', 'Dr-Apr\'25/027', '4000/y01', 'Paid to Ye Yint for Vr.12517,12568 (Ch No.221617)\r\n', '5000000', '0', 'mmk', '', '', 0, 'accepted'),
(408, '2025-04-01', 'Dr-Apr\'25/027', '3700/003', 'Paid to Ye Yint for Vr.12517,12568 (Ch No.221617)\r\n', '0', '5000000', 'mmk', '', '', 0, 'accepted'),
(409, '2025-04-01', 'Dr-Apr\'25/028', '4000/S06', 'Paid to Soe Thein for Vr.12596 (Ch No.221618)\r\n', '10000000', '0', 'mmk', '', '', 0, 'accepted'),
(410, '2025-04-01', 'Dr-Apr\'25/028', '3700/003', 'Paid to Soe Thein for Vr.12596 (Ch No.221618)\r\n', '0', '10000000', 'mmk', '', '', 0, 'accepted'),
(411, '2025-04-01', 'Dr-Apr\'25/029', '4000/A07', 'Paid to A Thay Lay for Vr.13069 (Ch no.221620)\r\n', '6000000', '0', 'mmk', '', '', 0, 'accepted'),
(412, '2025-04-01', 'Dr-Apr\'25/029', '3700/003', 'Paid to A Thay Lay for Vr.13069 (Ch no.221620)\r\n', '0', '6000000', 'mmk', '', '', 0, 'accepted'),
(413, '2025-04-01', 'Dr-Apr\'25/030', '4000/W01', 'Paid to Win Bo for Vr.12700 (Ch No.221621)\r\n', '5000000', '0', 'mmk', '', '', 0, 'accepted'),
(414, '2025-04-01', 'Dr-Apr\'25/030', '3700/003', 'Paid to Win Bo for Vr.12700 (Ch No.221621)\r\n', '0', '5000000', 'mmk', '', '', 0, 'accepted'),
(415, '2025-04-01', 'Dr-Apr\'25/031', '4000/t19', 'Paid to Tin Hlaing for Vr.12597 (Ch No.221622)\r\n', '15000000', '0', 'mmk', '', '', 0, 'accepted'),
(416, '2025-04-01', 'Dr-Apr\'25/031', '3700/003', 'Paid to Tin Hlaing for Vr.12597 (Ch No.221622)\r\n', '0', '15000000', 'mmk', '', '', 0, 'accepted'),
(417, '2025-04-01', 'Dr-Apr\'25/032', '4000/n01', 'Paid to Nanda for Vr.12922 (Ch No.221623)\r\n', '5000000', '0', 'mmk', '', '', 0, 'accepted'),
(418, '2025-04-01', 'Dr-Apr\'25/032', '3700/003', 'Paid to Nanda for Vr.12922 (Ch No.221623)\r\n', '0', '5000000', 'mmk', '', '', 0, 'accepted'),
(419, '2025-04-01', 'Dr-Apr\'25/033', '4000/p05', 'Paid to Phoe Zaw for Vr.12800,12807,12823 (Ch No.221624)\r\n', '10000000', '0', 'mmk', '', '', 0, 'accepted'),
(420, '2025-04-01', 'Dr-Apr\'25/033', '3700/003', 'Paid to Phoe Zaw for Vr.12800,12807,12823 (Ch No.221624)\r\n', '0', '10000000', 'mmk', '', '', 0, 'accepted'),
(421, '2025-04-01', 'Dr-Apr\'25/034', '4000/A06', 'Paid to Aung Zaw Oo for Vr.12867,12891 (Ch No.221625)\r\n', '7000000', '0', 'mmk', '', '', 0, 'accepted'),
(422, '2025-04-01', 'Dr-Apr\'25/034', '3700/003', 'Paid to Aung Zaw Oo for Vr.12867,12891 (Ch No.221625)\r\n', '0', '7000000', 'mmk', '', '', 0, 'accepted'),
(423, '2025-04-01', 'Dr-Apr\'25/035', '4000/t05', 'Paid to Thet Oo for Vr.12627,12633,12702 (Ch No.221651)\r\n', '20000000', '0', 'mmk', '', '', 0, 'accepted'),
(424, '2025-04-01', 'Dr-Apr\'25/035', '3700/003', 'Paid to Thet Oo for Vr.12627,12633,12702 (Ch No.221651)\r\n', '0', '20000000', 'mmk', '', '', 0, 'accepted'),
(425, '2025-04-07', 'Cr-Apr\'25/006', '3700/003', 'USA Money Selling from USD A/C $49945*25% $12486.25 * 2106ks\r\n', '26296042.5', '0', 'usd', '', '', 0, 'accepted'),
(426, '2025-04-07', 'Cr-Apr\'25/006', '3700/002', 'USA Money Selling from USD A/C $49945*25% $12486.25 * 2106ks\r\n', '0', '26296042.5', 'usd', '', '', 0, 'accepted'),
(431, '2025-04-07', 'Cr-Apr\'25/006', '3700/003', 'USA Money Selling from USD A/C $49945*75% $37448.75 * 4418ks (37448.75*3599ks)LM and 37448.75*819ks Nan\r\n', '134778051.25', '0', 'mmk', '', '', 0, 'accepted'),
(432, '2025-04-07', 'Cr-Apr\'25/006', '3600/003', 'USA Money Selling from USD A/C $49945*75% $37448.75 * 4418ks (37448.75*3599ks)LM and 37448.75*819ks Nan\r\n', '0', '134778051.25', 'mmk', '', '', 0, 'accepted'),
(433, '2025-04-08', 'Dr-Apr\'25/099', '4000/S03', 'Paid to Soe Min For Vr no-12610,12680,Chq no-221655\r\n', '25000000', '0', 'mmk', '', '', 0, 'accepted'),
(434, '2025-04-08', 'Dr-Apr\'25/099', '3700/003', 'Paid to Soe Min For Vr no-12610,12680,Chq no-221655\r\n', '0', '25000000', 'mmk', '', '', 0, 'accepted'),
(435, '2025-04-08', 'Dr-Apr\'25/100', '4000/A19', 'Paid to Aye Aye Maw For Vr no-12911,Chq no-221653\r\n', '6000000', '0', 'mmk', '', '', 0, 'accepted'),
(436, '2025-04-08', 'Dr-Apr\'25/100', '3700/003', 'Paid to Aye Aye Maw For Vr no-12911,Chq no-221653\r\n', '0', '6000000', 'mmk', '', '', 0, 'accepted'),
(437, '2025-04-08', 'Dr-Apr\'25/101', '4000/k16', 'Paid to Kyaw Min Latt For Vr no-12877,12881,Chq no-221654\r\n', '6000000', '0', 'mmk', '', '', 0, 'accepted'),
(438, '2025-04-08', 'Dr-Apr\'25/101', '3700/003', 'Paid to Kyaw Min Latt For Vr no-12877,12881,Chq no-221654\r\n', '0', '6000000', 'mmk', '', '', 0, 'accepted'),
(439, '2025-04-08', 'Dr-Apr\'25/102', '4000/S06', 'Paid to Soe Thein For Vr no-12596,12605,Chq no-221656\r\n', '30000000', '0', 'mmk', '', '', 0, 'accepted'),
(440, '2025-04-08', 'Dr-Apr\'25/102', '3700/003', 'Paid to Soe Thein For Vr no-12596,12605,Chq no-221656\r\n', '0', '30000000', 'mmk', '', '', 0, 'accepted'),
(441, '2025-04-09', 'Cr-Apr\'25/010', '3700/003', 'Daw Nan (UAB) Transfer to UAB MMK A/C\r\n', '30000000', '0', 'mmk', '', '', 0, 'accepted'),
(442, '2025-04-09', 'Cr-Apr\'25/010', '3700/006', 'Daw Nan (UAB) Transfer to UAB MMK A/C\r\n', '0', '30000000', 'mmk', '', '', 0, 'accepted'),
(443, '2025-04-09', 'Cr-Apr\'25/011', '3700/003', 'Mr Sarmad NNS (TD) to UAB MMK A/C $40000-$50=$39950*4360ks\r\n', '174182000', '0', 'usd', '', '', 0, 'accepted'),
(444, '2025-04-09', 'Cr-Apr\'25/011', '3700/001', 'Mr Sarmad NNS (TD) to UAB MMK A/C $40000-$50=$39950*4360ks\r\n', '0', '174182000', 'usd', '', '', 0, 'accepted'),
(445, '2025-04-09', 'Dr-Apr\'25/120', '9100/009', 'Bank Statement Charges For UAB MMK A/C (2.4.25)\r\n', '800', '0', 'mmk', '', '', 0, 'accepted'),
(446, '2025-04-09', 'Dr-Apr\'25/120', '3700/003', 'Bank Statement Charges For UAB MMK A/C (2.4.25)\r\n', '0', '800', 'mmk', '', '', 0, 'accepted'),
(447, '2025-04-09', 'Dr-Apr\'25/121', '9100/009', 'Bank Statement Charges For UAB MMK A/C (4.4.25)\r\n', '1600', '0', 'mmk', '', '', 0, 'accepted'),
(448, '2025-04-09', 'Dr-Apr\'25/121', '3700/003', 'Bank Statement Charges For UAB MMK A/C (4.4.25)\r\n', '0', '1600', 'mmk', '', '', 0, 'accepted'),
(449, '2025-04-09', 'Dr-Apr\'25/122', '3400/006', 'Paid to LMG Loan,Chq no-221660\r\n', '50000000', '0', 'mmk', '', '', 0, 'accepted'),
(450, '2025-04-09', 'Dr-Apr\'25/122', '3700/003', 'Paid to LMG Loan,Chq no-221660\r\n', '0', '50000000', 'mmk', '', '', 0, 'accepted'),
(451, '2025-04-09', 'Dr-Apr\'25/130', '4000/A01', 'Paid to A.K For Vr no-12785,12805,12813,12824,Chq no-221657\r\n', '10000000', '0', 'mmk', '', '', 0, 'accepted'),
(452, '2025-04-09', 'Dr-Apr\'25/130', '3700/003', 'Paid to A.K For Vr no-12785,12805,12813,12824,Chq no-221657\r\n', '0', '10000000', 'mmk', '', '', 0, 'accepted'),
(453, '2025-04-09', 'Dr-Apr\'25/131', '4000/t02', 'Paid to Thein Htay For Vr no-13028,13033,Chq no-221658\r\n', '10000000', '0', 'mmk', '', '', 0, 'accepted'),
(454, '2025-04-09', 'Dr-Apr\'25/131', '3700/003', 'Paid to Thein Htay For Vr no-13028,13033,Chq no-221658\r\n', '0', '10000000', 'mmk', '', '', 0, 'accepted'),
(455, '2025-04-09', 'Dr-Apr\'25/132', '4000/P05', 'Paid to Phoe Zaw For Vr no- 12823,Chq no-221659\r\n', '10000000', '0', 'mmk', '', '', 0, 'accepted'),
(456, '2025-04-09', 'Dr-Apr\'25/132', '3700/003', 'Paid to Phoe Zaw For Vr no- 12823,Chq no-221659\r\n', '0', '10000000', 'mmk', '', '', 0, 'accepted'),
(457, '2025-04-09', 'Dr-Apr\'25/133', '4000/a07', 'Paid to A Thay Lay For Vr no-13069,Chq no-221661\r\n', '5000000', '0', 'mmk', '', '', 0, 'accepted'),
(458, '2025-04-09', 'Dr-Apr\'25/133', '3700/003', 'Paid to A Thay Lay For Vr no-13069,Chq no-221661\r\n', '0', '5000000', 'mmk', '', '', 0, 'accepted'),
(459, '2025-04-09', 'Dr-Apr\'25/134', '4000/h03', 'Paid to HHK Cold Store Charges,Chq no-221662\r\n', '10000000', '0', 'mmk', '', '', 0, 'accepted'),
(460, '2025-04-09', 'Dr-Apr\'25/134', '3700/003', 'Paid to HHK Cold Store Charges,Chq no-221662\r\n', '0', '10000000', 'mmk', '', '', 0, 'accepted'),
(461, '2025-04-10', 'Dr-Apr\'25/152', '4000/s01', 'Paid to Shwe Late For Vr no-12740,12852,12863,Chq no-221663\r\n', '10000000', '0', 'mmk', '', '', 0, 'accepted'),
(462, '2025-04-10', 'Dr-Apr\'25/152', '3700/003', 'Paid to Shwe Late For Vr no-12740,12852,12863,Chq no-221663\r\n', '0', '10000000', 'mmk', '', '', 0, 'accepted'),
(463, '2025-04-10', 'Dr-Apr\'25/153', '4000/t01', 'Paid to Thet Paing For Vr no-12937,Chq no-221664\r\n', '7000000', '0', 'mmk', '', '', 0, 'accepted'),
(464, '2025-04-10', 'Dr-Apr\'25/153', '3700/003', 'Paid to Thet Paing For Vr no-12937,Chq no-221664\r\n', '0', '7000000', 'mmk', '', '', 0, 'accepted'),
(465, '2025-04-10', 'Dr-Apr\'25/154', '4000/t17', 'Paid to Than Than Myint For Vr no-12756,12760,Chq no-221665\r\n', '20000000', '0', 'mmk', '', '', 0, 'accepted'),
(466, '2025-04-10', 'Dr-Apr\'25/154', '3700/003', 'Paid to Than Than Myint For Vr no-12756,12760,Chq no-221665\r\n', '0', '20000000', 'mmk', '', '', 0, 'accepted'),
(467, '2025-04-10', 'Dr-Apr\'25/155', '4000/001', 'Paid to 4 Zaw For Vr no-12913,Chq no-221666\r\n', '5000000', '0', 'mmk', '', '', 0, 'accepted'),
(468, '2025-04-10', 'Dr-Apr\'25/155', '3700/003', 'Paid to 4 Zaw For Vr no-12913,Chq no-221666\r\n', '0', '5000000', 'mmk', '', '', 0, 'accepted'),
(469, '2025-04-10', 'Dr-Apr\'25/156', '4000/y01', 'Paid to Ye Yint For Vr no-12568,12958,Chq no-221667\r\n', '7000000', '0', 'mmk', '', '', 0, 'accepted'),
(470, '2025-04-10', 'Dr-Apr\'25/156', '3700/003', 'Paid to Ye Yint For Vr no-12568,12958,Chq no-221667\r\n', '0', '7000000', 'mmk', '', '', 0, 'accepted'),
(471, '2025-04-10', 'Dr-Apr\'25/157', '4000/z03', 'Paid to Zaw Myat Thu For Vr no-12990,13020,13036,Chq no-221668\r\n', '10000000', '0', 'mmk', '', '', 0, 'accepted'),
(472, '2025-04-10', 'Dr-Apr\'25/157', '3700/003', 'Paid to Zaw Myat Thu For Vr no-12990,13020,13036,Chq no-221668\r\n', '0', '10000000', 'mmk', '', '', 0, 'accepted'),
(473, '2025-04-10', 'Dr-Apr\'25/158', '4000/w01', 'Paid to Win Bo For Vr no-12700,12718,Chq no-221669\r\n', '7000000', '0', 'mmk', '', '', 0, 'accepted'),
(474, '2025-04-10', 'Dr-Apr\'25/158', '3700/003', 'Paid to Win Bo For Vr no-12700,12718,Chq no-221669\r\n', '0', '7000000', 'mmk', '', '', 0, 'accepted'),
(475, '2025-04-10', 'Dr-Apr\'25/159', '4000/s04', 'Paid to Si Thu For Vr no-12669,Chq no-221671\r\n', '10000000', '0', 'mmk', '', '', 0, 'accepted'),
(476, '2025-04-10', 'Dr-Apr\'25/159', '3700/003', 'Paid to Si Thu For Vr no-12669,Chq no-221671\r\n', '0', '10000000', 'mmk', '', '', 0, 'accepted'),
(477, '2025-04-10', 'Dr-Apr\'25/160', '4000/t11', 'Paid to Tun Zaw Min For Vr no-12652,12662,12674,12690,Chq no-221673\r\n', '30000000', '0', 'mmk', '', '', 0, 'accepted'),
(478, '2025-04-10', 'Dr-Apr\'25/160', '3700/003', 'Paid to Tun Zaw Min For Vr no-12652,12662,12674,12690,Chq no-221673\r\n', '0', '30000000', 'mmk', '', '', 0, 'accepted'),
(479, '2025-04-10', 'Dr-Apr\'25/161', '4000/c03', 'Paid to Chit Ko For Vr no-12905,Chq no-221670\r\n', '5000000', '0', 'mmk', '', '', 0, 'accepted'),
(480, '2025-04-10', 'Dr-Apr\'25/161', '3700/003', 'Paid to Chit Ko For Vr no-12905,Chq no-221670\r\n', '0', '5000000', 'mmk', '', '', 0, 'accepted'),
(481, '2025-04-10', 'Dr-Apr\'25/162', '4000/t03', 'Paid to Thin Thin Yee For Vr no-12789,12809,Chq no-221672\r\n', '10000000', '0', 'mmk', '', '', 0, 'accepted'),
(482, '2025-04-10', 'Dr-Apr\'25/162', '3700/003', 'Paid to Thin Thin Yee For Vr no-12789,12809,Chq no-221672\r\n', '0', '10000000', 'mmk', '', '', 0, 'accepted'),
(483, '2025-04-10', 'Dr-Apr\'25/163', '4000/A06', 'Paid to Aung Zaw Oo For Vr no-12891,Chq no-221675\r\n', '6000000', '0', 'mmk', '', '', 0, 'accepted'),
(484, '2025-04-10', 'Dr-Apr\'25/163', '3700/003', 'Paid to Aung Zaw Oo For Vr no-12891,Chq no-221675\r\n', '0', '6000000', 'mmk', '', '', 0, 'accepted'),
(485, '2025-04-10', 'Dr-Apr\'25/164', '4000/t05', 'Paid to Thet Oo For Vr no-12758,12790,Chq no-221674\r\n', '20000000', '0', 'mmk', '', '', 0, 'accepted'),
(486, '2025-04-10', 'Dr-Apr\'25/164', '3700/003', 'Paid to Thet Oo For Vr no-12758,12790,Chq no-221674\r\n', '0', '20000000', 'mmk', '', '', 0, 'accepted'),
(487, '2025-04-23', 'Cr-Apr\'25/016', '3700/003', 'USA Money Received From UAB $50000 (4.4.25)$49945,25% $12486.25*2106ks,(75% $37458.75-$10=$37448.75 UAB USD Balance)\r\n', '26296042.5', '0', 'usd', '', '', 0, 'accepted'),
(488, '2025-04-23', 'Cr-Apr\'25/016', '3700/002', 'USA Money Received From UAB $50000 (4.4.25)$49945,25% $12486.25*2106ks,(75% $37458.75-$10=$37448.75 UAB USD Balance)\r\n', '0', '26296042.5', 'usd', '', '', 0, 'accepted'),
(489, '2025-04-23', 'Cr-Apr\'25/017', '3700/003', 'USA Money Received From UAB $50000 (11.4.25)$49945,25% $12486.25*2106ks,(75% $37458.75-$10=$37448.75 UAB USD Balance)\r\n', '26296042.5', '0', 'usd', '', '', 0, 'accepted'),
(490, '2025-04-23', 'Cr-Apr\'25/017', '3700/002', 'USA Money Received From UAB $50000 (11.4.25)$49945,25% $12486.25*2106ks,(75% $37458.75-$10=$37448.75 UAB USD Balance)\r\n', '0', '26296042.5', 'usd', '', '', 0, 'accepted'),
(491, '2025-04-07', 'Cr-Apr25/006', '3700/006', 'USA Money Selling from USD A/C $49945*75% $37448.75 * 4418ks (37448.75*3599ks)LM and 37448.75*819ks Nan\r\n', '30670526.25', '0', 'mmk', '', '', 0, 'accepted'),
(492, '2025-04-07', 'Cr-Apr25/006', '3600/003', 'USA Money Selling from USD A/C $49945*75% $37448.75 * 4418ks (37448.75*3599ks)LM and 37448.75*819ks Nan\r\n', '0', '30670526.25', 'mmk', '', '', 0, 'accepted'),
(493, '2025-04-09', 'Dr-Apr\'25/136', '9100/040', ' Sir Income Tax For Mar\'25 \r\n', '110000', '0', 'mmk', '', '', 0, 'accepted'),
(494, '2025-04-09', 'Dr-Apr\'25/136', '3700/006', ' Sir Income Tax For Mar\'25 \r\n', '0', '110000', 'mmk', '', '', 0, 'accepted'),
(495, '2025-04-09', 'Dr-Apr\'25/136', '9100/009', 'Bank Charges For Sir Income Tax For Mar\'25\r\n', '2000', '0', 'mmk', '', '', 0, 'accepted'),
(496, '2025-04-09', 'Dr-Apr\'25/136', '3700/006', 'Bank Charges For Sir Income Tax For Mar\'25\r\n', '0', '2000', 'mmk', '', '', 0, 'accepted'),
(497, '2025-04-08', 'Cr-Apr\'25/008', '3600/002', '5000 Loan Received From ACE BD By Chairman\r\n', '5010', '0', 'usd', '', '', 0, 'accepted'),
(498, '2025-04-08', 'Cr-Apr\'25/008', '4000/A24', '5000 Loan Received From ACE BD By Chairman\r\n', '0', '5010', 'usd', '', '', 0, 'accepted'),
(499, '2025-04-08', 'Dr-Apr\'25/117', '9100/029', 'Paid Undertaken Charges ACE BD Money\r\n', '5010', '0', 'usd', '', '', 0, 'accepted'),
(500, '2025-04-08', 'Dr-Apr\'25/117', '3600/002', 'Paid Undertaken Charges ACE BD Money\r\n', '0', '5010', 'usd', '', '', 0, 'accepted'),
(501, '2025-04-22', 'Cr-Apr\'25/015', '3600/002', 'LM Loan from ACE Office for Sir (BKK go) 13.4.25 to 23.4.25\r\n', '11000', '0', 'usd', '', '', 0, 'accepted'),
(502, '2025-04-22', 'Cr-Apr\'25/015', '4000/A24', 'LM Loan from ACE Office for Sir (BKK go) 13.4.25 to 23.4.25\r\n', '0', '11000', 'usd', '', '', 0, 'accepted'),
(503, '2025-04-22', 'Dr-Apr\'25/184', '9100/017', 'Sir Take for BKK go\r\n', '11000', '0', 'usd', '', '', 0, 'accepted'),
(504, '2025-04-22', 'Dr-Apr\'25/184', '3600/002', 'Sir Take for BKK go\r\n', '0', '11000', 'usd', '', '', 0, 'accepted'),
(505, '2025-04-08', 'Cr-Apr\'25/008', '3600/002', '5000 Loan Received From ACE BD By Chairman\r\n', '5010', '0', 'usd', '', '', 0, 'accepted'),
(506, '2025-04-08', 'Cr-Apr\'25/008', '4000/a24', '5000 Loan Received From ACE BD By Chairman\r\n', '0', '5010', 'usd', '', '', 0, 'accepted'),
(507, '2025-04-08', 'Dr-Apr\'25/117', '9100/029', 'Paid Undertaken Charges ACE BD Money\r\n\r\n', '5010', '0', 'usd', '', '', 0, 'accepted'),
(508, '2025-04-08', 'Dr-Apr\'25/117', '3600/002', 'Paid Undertaken Charges ACE BD Money\r\n\r\n', '0', '5010', 'usd', '', '', 0, 'accepted'),
(509, '2025-04-07', 'Cr-Apr\'25/007', '3700/002', 'USA Money Received from UAB (28.3.25)-$50000\r\n', '49945', '0', 'usd', '', '', 0, 'accepted'),
(510, '2025-04-07', 'Cr-Apr\'25/007', '3300/002', 'USA Money Received from UAB (28.3.25)-$50000\r\n', '0', '49945', 'usd', '', '', 0, 'accepted'),
(511, '2025-04-07', 'Dr-Apr\'25/097', '9100/009', 'Bank Charges for USA Money 75% ($50000-$55=$49945)\r\n', '10', '0', 'usd', '', '', 0, 'accepted'),
(512, '2025-04-07', 'Dr-Apr\'25/097', '3700/002', 'Bank Charges for USA Money 75% ($50000-$55=$49945)\r\n', '0', '10', 'usd', '', '', 0, 'accepted'),
(515, '2025-04-07', 'Dr-Apr\'25/098', '3600/003', ' USA Money Selling from USD A/C 25% 2106ks/ 75% 4418ks (3599ks LM A/C and 819ks Nan A/C) \r\n', '165448577.5', '0', 'usd', '', '', 0, 'accepted'),
(516, '2025-04-07', 'Dr-Apr\'25/098', '3700/002', ' USA Money Selling from USD A/C 25% 2106ks/ 75% 4418ks (3599ks LM A/C and 819ks Nan A/C) \r\n', '0', '165448577.5', 'usd', '', '', 0, 'accepted'),
(517, '2025-04-23', 'Cr-Apr\'25/016', '3700/002', 'USA Money Received From UAB USD A/C (4.4.25) For SAF-27/24 & SAF-01/25\r\n', '49945', '0', 'usd', '', '', 0, 'accepted'),
(518, '2025-04-23', 'Cr-Apr\'25/016', '3300/002', 'USA Money Received From UAB USD A/C (4.4.25) For SAF-27/24 & SAF-01/25\r\n', '0', '49945', 'usd', '', '', 0, 'accepted'),
(519, '2025-04-23', 'Cr-Apr\'25/017', '3700/002', 'USA Money Received From UAB USD A/C (11.4.25) For SAF-01/25\r\n', '49945', '0', 'usd', '', '', 0, 'accepted'),
(520, '2025-04-23', 'Cr-Apr\'25/017', '3300/002', 'USA Money Received From UAB USD A/C (11.4.25) For SAF-01/25\r\n', '0', '49945', 'usd', '', '', 0, 'accepted'),
(524, '2025-04-08', 'Dr-Apr\'25/118', '4000/A24', 'Transfer to Gulf Air instead of ACE (MM), that money adjust with Chairman Loan from ACE(BD) \r\n', '5010', '0', 'usd', '', '', 0, 'accepted'),
(525, '2025-04-08', 'Dr-Apr\'25/118', '3700/001', 'Transfer to Gulf Air instead of ACE (MM), that money adjust with Chairman Loan from ACE(BD) \r\n', '0', '5010', 'usd', '', '', 0, 'accepted'),
(526, '2025-04-08', 'Jv04-009', '9100/009', 'Bank Charges For Money Transfer to NNS $40000 (8.4.25)\r\n', '36.22', '0', 'usd', '', '', 0, 'accepted'),
(527, '2025-04-08', 'Jv04-009', '3700/001', 'Bank Charges For Money Transfer to NNS $40000 (8.4.25)\r\n', '0', '36.22', 'usd', '', '', 0, 'accepted'),
(528, '2025-04-08', 'Jv04-010', '9100/009', 'Bank Charges For Gulf Air Money Transfer\r\n\r\n', '36.22', '0', 'usd', '', '', 0, 'accepted'),
(529, '2025-04-08', 'Jv04-010', '3700/001', 'Bank Charges For Gulf Air Money Transfer\r\n\r\n', '0', '36.22', 'usd', '', '', 0, 'accepted'),
(530, '2025-04-09', 'Jv04-003', '9100/009', ' Bank Inward Charges of $40000-$50=$39950,Cr-Apr\'25/011 \r\n', '50', '0', 'usd', '', '', 0, 'accepted'),
(531, '2025-04-09', 'Jv04-003', '3700/001', ' Bank Inward Charges of $40000-$50=$39950,Cr-Apr\'25/011 \r\n', '0', '50', 'usd', '', '', 0, 'accepted'),
(532, '2025-04-14', 'Jv04-011', '9100/001', 'Mr Sarmad Salary For April\'25 (CAD 2000//USD 1481.59)\r\n', '1481.59', '0', 'usd', '', '', 0, 'accepted'),
(533, '2025-04-14', 'Jv04-011', '3700/001', 'Mr Sarmad Salary For April\'25 (CAD 2000//USD 1481.59)\r\n', '0', '1481.59', 'usd', '', '', 0, 'accepted'),
(534, '2025-04-17', 'Jv04-012', '3700/001', 'Ocean Freight Received For Can-02/25 (BL-OOLU2755928300)Need to Transfer to RBC\r\n', '5000', '0', 'usd', '', '', 0, 'accepted'),
(535, '2025-04-17', 'Jv04-012', '7000/002', 'Ocean Freight Received For Can-02/25 (BL-OOLU2755928300)Need to Transfer to RBC\r\n', '0', '5000', 'usd', '', '', 0, 'accepted'),
(536, '2025-04-22', 'Jv04-013', '3700/001', 'Ocean Freight Received For Can-02/25 (BL-OOLU2755928300)need to Transfer to RBC\r\n', '3845', '0', 'usd', '', '', 0, 'accepted'),
(537, '2025-04-22', 'Jv04-013', '7000/002', 'Ocean Freight Received For Can-02/25 (BL-OOLU2755928300)need to Transfer to RBC\r\n', '0', '3845', 'usd', '', '', 0, 'accepted'),
(538, '2025-04-22', 'Jv04-014', '9100/009', 'Bank charges For Money going out and then in for Error $2416.15-$2293.34=$122.81\r\n', '122.81', '0', 'usd', '', '', 0, 'accepted'),
(539, '2025-04-22', 'Jv04-014', '3700/001', 'Bank charges For Money going out and then in for Error $2416.15-$2293.34=$122.81\r\n', '0', '122.81', 'usd', '', '', 0, 'accepted'),
(540, '2025-04-22', 'Jv04-016', '7000/002', 'Ocean Freight Transfer to RBC For Can-02/25 BL_OOLU2755928300\r\n', '8845', '0', 'usd', '', '', 0, 'accepted'),
(541, '2025-04-22', 'Jv04-016', '3700/001', 'Ocean Freight Transfer to RBC For Can-02/25 BL_OOLU2755928300\r\n', '0', '8845', 'usd', '', '', 0, 'accepted'),
(542, '2025-04-22', 'Jv04-017', '9100/009', 'Bank Charges For Ocean Freight Transfer to RBC For Can-02/25\r\n', '7.43', '0', 'usd', '', '', 0, 'accepted'),
(543, '2025-04-22', 'Jv04-017', '3700/001', 'Bank Charges For Ocean Freight Transfer to RBC For Can-02/25\r\n', '0', '7.43', 'usd', '', '', 0, 'accepted'),
(544, '2025-04-22', 'Jv04-015', '3300/012', 'Temporary Loan to LM Impex For Import License (CAD 3248.75 Equivalent $2416.15)\r\n', '2416.15', '0', 'usd', '', '', 0, 'accepted'),
(545, '2025-04-22', 'Jv04-015', '3700/001', 'Temporary Loan to LM Impex For Import License (CAD 3248.75 Equivalent $2416.15)\r\n', '0', '2416.15', 'usd', '', '', 0, 'accepted'),
(548, '2025-04-04', 'Jv04-007', '9100/009', 'Bank Charges For USA Money From UAB USD A/C For (4.4.25) Money\r\n', '55', '0', 'usd', '', '', 0, 'accepted'),
(549, '2025-04-04', 'Jv04-007', '3300/002', 'Bank Charges For USA Money From UAB USD A/C For (4.4.25) Money\r\n', '0', '55', 'usd', '', '', 0, 'accepted'),
(550, '2025-04-11', 'JV04-008', '9100/009', 'Bank Charges For USA Money From UAB USD A/C For (11.4.25) Money\r\n', '55', '0', 'usd', '', '', 0, 'accepted'),
(551, '2025-04-11', 'JV04-008', '3300/002', 'Bank Charges For USA Money From UAB USD A/C For (11.4.25) Money\r\n', '0', '55', 'usd', '', '', 0, 'accepted'),
(552, '2025-04-08', 'Jv04-005', '3300/002', ' Credit Sale to USA Buyer SAF-07/2025 ,OERU:406498 \r\n', '275750.5', '0', 'usd', 'SAF-07/2025', 'OERU:406498', 0, 'accepted'),
(553, '2025-04-08', 'Jv04-005', '5000/001', ' Credit Sale to USA Buyer SAF-07/2025 ,OERU:406498 \r\n', '0', '275750.5', 'usd', '', '', 0, 'accepted'),
(554, '2025-04-08', 'Jv04-006', '3300/002', ' Credit Sale to USA Buyer SAF-08/2025,FSCU:5761613 \r\n', '311755.9', '0', 'usd', 'SAF-08/2025', 'FSCU:5761613', 0, 'accepted'),
(555, '2025-04-08', 'Jv04-006', '5000/001', ' Credit Sale to USA Buyer SAF-08/2025,FSCU:5761613 \r\n', '0', '311755.9', 'usd', '', '', 0, 'accepted'),
(558, '2025-04-07', 'Jv04-002', '9100/009', 'Bank Charge for USA Money (28.3.25) $50000-$55=$49945,Cr-Apr\'25/006\r\n', '55', '0', 'usd', '', '', 0, 'selected'),
(559, '2025-04-07', 'Jv04-002', '3300/002', 'Bank Charge for USA Money (28.3.25) $50000-$55=$49945,Cr-Apr\'25/006\r\n', '0', '55', 'usd', '', '', 0, 'selected');

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
(610, '02:08:36.000000', '2024-10-20', 'Administrator', 'protechadmin2024***', 'Login Success'),
(611, '05:35:40.000000', '2024-10-20', 'Administrator', 'protechadmin2024***', 'Login Success'),
(612, '05:44:43.000000', '2024-10-20', 'Administrator', '', 'Logout Success'),
(613, '05:44:48.000000', '2024-10-20', '', '', 'Logout Success'),
(614, '07:27:58.000000', '2024-10-20', 'Administrator', 'protechadmin2024***', 'Login Success'),
(615, '08:55:11.000000', '2024-10-20', 'Administrator', '', 'Logout Success'),
(616, '01:03:10.000000', '2024-10-21', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(617, '03:41:27.000000', '2024-10-21', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(618, '12:57:06.000000', '2024-10-22', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(619, '01:27:51.000000', '2024-10-22', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(620, '02:00:05.000000', '2024-10-22', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(621, '03:10:14.000000', '2024-10-22', 'lin lin naing', 'coldstore', 'Login Success'),
(622, '03:12:09.000000', '2024-10-22', 'lin lin naing', 'coldstore', 'Login Success'),
(623, '03:20:00.000000', '2024-10-22', 'lin lin naing', 'coldstore', 'Login Success'),
(624, '03:20:00.000000', '2024-10-22', 'lin lin naing', 'coldstore', 'Login Success'),
(625, '03:20:01.000000', '2024-10-22', 'lin lin naing', 'coldstore', 'Login Success'),
(626, '03:20:01.000000', '2024-10-22', 'lin lin naing', 'coldstore', 'Login Success'),
(627, '04:15:49.000000', '2024-10-22', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(628, '09:13:30.000000', '2024-10-23', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(629, '09:50:33.000000', '2024-10-23', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(630, '10:44:50.000000', '2024-10-23', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(631, '11:50:05.000000', '2024-10-23', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(632, '01:59:44.000000', '2024-10-23', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(633, '02:31:44.000000', '2024-10-23', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(634, '02:41:00.000000', '2024-10-23', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(635, '03:31:08.000000', '2024-10-23', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(636, '03:32:13.000000', '2024-10-23', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(637, '10:47:36.000000', '2024-10-24', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(638, '11:01:49.000000', '2024-10-24', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(639, '01:15:56.000000', '2024-10-24', 'Ma Sandar Aung', '12341234', 'Login Success'),
(640, '01:33:34.000000', '2024-10-24', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(641, '02:16:43.000000', '2024-10-24', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(642, '02:45:15.000000', '2024-10-24', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(643, '02:49:54.000000', '2024-10-24', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(644, '03:01:00.000000', '2024-10-24', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(645, '03:07:24.000000', '2024-10-24', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(646, '03:13:03.000000', '2024-10-24', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(647, '03:22:09.000000', '2024-10-24', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(648, '03:24:00.000000', '2024-10-24', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(649, '04:14:59.000000', '2024-10-24', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(650, '09:26:05.000000', '2024-10-25', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(651, '10:32:26.000000', '2024-10-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(652, '10:34:45.000000', '2024-10-25', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(653, '10:57:35.000000', '2024-10-25', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(654, '11:34:54.000000', '2024-10-25', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(655, '11:49:09.000000', '2024-10-25', 'Ma Soe Soe Khaing', '', 'Logout Success'),
(656, '11:50:55.000000', '2024-10-25', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(657, '12:39:29.000000', '2024-10-25', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(658, '12:52:52.000000', '2024-10-25', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(659, '01:01:19.000000', '2024-10-25', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(660, '01:05:24.000000', '2024-10-25', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(661, '02:10:21.000000', '2024-10-25', 'Ma Sandar Aung', '12341234', 'Login Success'),
(662, '02:11:20.000000', '2024-10-25', 'Ma Sandar Aung', '', 'Logout Success'),
(663, '02:47:47.000000', '2024-10-25', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(664, '03:27:23.000000', '2024-10-25', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(665, '03:35:11.000000', '2024-10-25', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(666, '03:43:36.000000', '2024-10-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(667, '03:48:19.000000', '2024-10-25', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(668, '04:16:26.000000', '2024-10-25', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(669, '09:09:29.000000', '2024-10-26', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(670, '12:16:14.000000', '2024-10-26', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(671, '01:02:40.000000', '2024-10-26', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(672, '01:06:29.000000', '2024-10-26', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(673, '01:34:29.000000', '2024-10-26', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(674, '09:52:41.000000', '2024-10-28', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(675, '09:57:53.000000', '2024-10-28', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(676, '11:59:32.000000', '2024-10-28', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(677, '11:59:40.000000', '2024-10-28', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(678, '12:00:14.000000', '2024-10-28', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(679, '12:04:53.000000', '2024-10-28', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(680, '12:12:28.000000', '2024-10-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(681, '12:12:36.000000', '2024-10-28', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(682, '12:18:16.000000', '2024-10-28', 'Ma Sandar Aung', '12341234', 'Login Success'),
(683, '01:06:39.000000', '2024-10-28', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(684, '01:25:56.000000', '2024-10-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(685, '02:08:11.000000', '2024-10-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(686, '03:01:33.000000', '2024-10-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(687, '03:44:15.000000', '2024-10-28', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(688, '04:10:23.000000', '2024-10-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(689, '12:55:56.000000', '2024-10-29', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(690, '01:02:02.000000', '2024-10-29', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(691, '01:25:31.000000', '2024-10-29', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(692, '02:06:29.000000', '2024-10-29', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(693, '02:24:17.000000', '2024-10-29', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(694, '10:31:11.000000', '2024-10-30', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(695, '11:32:23.000000', '2024-10-30', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(696, '01:10:41.000000', '2024-10-30', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(697, '01:55:51.000000', '2024-10-30', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(698, '02:16:13.000000', '2024-10-30', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(699, '03:23:34.000000', '2024-10-30', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(700, '03:54:02.000000', '2024-10-30', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(701, '09:38:39.000000', '2024-10-31', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(702, '10:26:49.000000', '2024-10-31', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(703, '11:36:33.000000', '2024-10-31', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(704, '10:40:19.000000', '2024-11-04', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(705, '10:49:22.000000', '2024-11-04', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(706, '01:28:58.000000', '2024-11-04', 'Administrator', 'protechadmin2024***', 'Login Success'),
(707, '01:44:03.000000', '2024-11-04', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(708, '01:45:51.000000', '2024-11-04', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(709, '03:38:10.000000', '2024-11-04', 'Administrator', '', 'Logout Success'),
(710, '03:38:48.000000', '2024-11-04', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(711, '03:39:10.000000', '2024-11-04', 'Administrator', 'protechadmin2024***', 'Login Success'),
(712, '03:45:24.000000', '2024-11-04', 'Administrator', '', 'Logout Success'),
(713, '03:46:25.000000', '2024-11-04', 'Administrator', 'protechadmin2024***', 'Login Success'),
(714, '04:13:32.000000', '2024-11-04', 'Administrator', '', 'Logout Success'),
(715, '04:13:48.000000', '2024-11-04', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(716, '04:18:35.000000', '2024-11-04', 'Ma Soe Soe Khaing', '', 'Logout Success'),
(717, '04:18:37.000000', '2024-11-04', 'Administrator', 'protechadmin2024***', 'Login Success'),
(718, '04:30:12.000000', '2024-11-04', 'Administrator', '', 'Logout Success'),
(719, '04:30:34.000000', '2024-11-04', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(720, '04:30:37.000000', '2024-11-04', 'Ma Soe Soe Khaing', '', 'Logout Success'),
(721, '04:30:38.000000', '2024-11-04', 'Administrator', 'protechadmin2024***', 'Login Success'),
(722, '01:45:07.000000', '2024-11-05', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(723, '02:02:40.000000', '2024-11-05', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(724, '02:42:35.000000', '2024-11-05', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(725, '09:58:55.000000', '2024-11-06', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(726, '01:41:17.000000', '2024-11-06', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(727, '02:12:07.000000', '2024-11-06', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(728, '04:28:09.000000', '2024-11-06', 'Su Thiri Kyaw', 'su122333', 'Login Success'),
(729, '03:10:38.000000', '2024-11-07', 'Ma Sandar Aung', '12341234', 'Login Success'),
(730, '03:20:15.000000', '2024-11-07', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(731, '04:55:29.000000', '2024-11-07', 'Ma Sandar Aung', '', 'Logout Success'),
(732, '12:46:03.000000', '2024-11-08', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(733, '12:59:34.000000', '2024-11-08', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(734, '02:08:32.000000', '2024-11-08', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(735, '03:55:46.000000', '2024-11-08', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(736, '04:12:02.000000', '2024-11-08', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(737, '02:36:24.000000', '2024-11-13', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(738, '02:51:04.000000', '2024-11-13', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(739, '03:25:41.000000', '2024-11-13', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(740, '01:40:21.000000', '2025-01-21', 'Administrator', 'protechadmin2024***', 'Login Success'),
(741, '01:40:58.000000', '2025-01-21', 'Administrator', '', 'Logout Success'),
(742, '01:45:45.000000', '2025-01-21', 'Ma Sandar Aung', '12341234', 'Login Success'),
(743, '09:40:26.000000', '2025-01-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(744, '10:31:58.000000', '2025-01-22', 'Ma Sandar Aung', '12341234', 'Login Success'),
(745, '10:39:35.000000', '2025-01-22', 'Ma Sandar Aung', '', 'Logout Success'),
(746, '02:51:30.000000', '2025-01-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(747, '04:54:49.000000', '2025-01-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(748, '04:57:48.000000', '2025-01-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(749, '02:00:01.000000', '2025-01-23', 'Administrator', 'protechadmin2024***', 'Login Success'),
(750, '02:05:54.000000', '2025-01-23', 'Administrator', 'protechadmin2024***', 'Login Success'),
(751, '02:27:49.000000', '2025-01-23', 'Ma Sandar Aung', '12341234', 'Login Success'),
(752, '09:06:43.000000', '2025-01-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(753, '11:19:41.000000', '2025-01-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(754, '11:25:38.000000', '2025-01-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(755, '11:25:54.000000', '2025-01-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(756, '11:35:17.000000', '2025-01-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(757, '11:47:50.000000', '2025-01-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(758, '03:07:33.000000', '2025-01-24', 'Ma Sandar Aung', '12341234', 'Login Success'),
(759, '03:30:25.000000', '2025-01-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(760, '04:52:33.000000', '2025-01-24', 'Ma Sandar Aung', '12341234', 'Login Success'),
(761, '09:03:07.000000', '2025-01-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(762, '10:32:27.000000', '2025-01-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(763, '12:37:31.000000', '2025-01-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(764, '12:49:00.000000', '2025-01-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(765, '12:51:42.000000', '2025-01-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(766, '12:57:07.000000', '2025-01-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(767, '12:58:07.000000', '2025-01-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(768, '01:01:57.000000', '2025-01-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(769, '01:07:28.000000', '2025-01-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(770, '01:29:45.000000', '2025-01-25', 'Ma Sandar Aung', '12341234', 'Login Success'),
(771, '01:49:57.000000', '2025-01-25', 'Ma Sandar Aung', '', 'Logout Success'),
(772, '02:04:46.000000', '2025-01-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(773, '03:14:32.000000', '2025-01-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(774, '04:52:45.000000', '2025-01-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(775, '09:01:25.000000', '2025-01-27', 'Administrator', 'protechadmin2024***', 'Login Success'),
(776, '09:01:25.000000', '2025-01-27', 'Administrator', 'protechadmin2024***', 'Login Success'),
(777, '10:04:57.000000', '2025-01-27', 'Administrator', 'protechadmin2024***', 'Login Success'),
(778, '10:15:45.000000', '2025-01-27', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(779, '10:16:52.000000', '2025-01-27', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(780, '11:13:08.000000', '2025-01-27', 'Administrator', 'protechadmin2024***', 'Login Success'),
(781, '11:25:16.000000', '2025-01-27', 'Administrator', 'protechadmin2024***', 'Login Success'),
(782, '12:11:05.000000', '2025-01-27', 'Ma Sandar Aung', '12341234', 'Login Success'),
(783, '04:30:29.000000', '2025-01-27', 'Ma Sandar Aung', '', 'Logout Success'),
(784, '04:49:09.000000', '2025-01-27', 'Administrator', '', 'Logout Success'),
(785, '11:15:27.000000', '2025-01-28', 'masandaraung', '12341234', 'Login Failed'),
(786, '11:15:47.000000', '2025-01-28', 'Ma Sandar Aung', '12341234', 'Login Success'),
(787, '11:16:20.000000', '2025-01-28', 'Ma Sandar Aung', '', 'Logout Success'),
(788, '11:19:06.000000', '2025-01-28', 'Ma Sandar Aung', '12341234', 'Login Success'),
(789, '12:53:20.000000', '2025-01-28', 'Administrator', 'protechadmin2024***', 'Login Success'),
(790, '02:13:31.000000', '2025-01-28', 'Administrator', 'protechadmin2024***', 'Login Success'),
(791, '04:23:51.000000', '2025-01-28', 'Ma Sandar Aung', '12341234', 'Login Success'),
(792, '02:22:13.000000', '2025-01-29', 'Administrator', 'protechadmin2024***', 'Login Success'),
(793, '03:29:17.000000', '2025-01-29', 'Administrator', '', 'Logout Success'),
(794, '08:59:37.000000', '2025-01-30', 'Administrator', 'protechadmin2024***', 'Login Success'),
(795, '08:56:33.000000', '2025-01-31', 'Administrator', 'protechadmin2024***', 'Login Success'),
(796, '03:12:38.000000', '2025-01-31', 'Ma Sandar Aung', '12341234', 'Login Success'),
(797, '09:10:58.000000', '2025-02-01', 'Administrator', 'protechadmin2024***', 'Login Success'),
(798, '10:53:04.000000', '2025-02-01', 'Ma Sandar Aung', '12341234', 'Login Success'),
(799, '11:32:52.000000', '2025-02-01', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(800, '11:34:34.000000', '2025-02-01', 'Ma Sandar Aung', '', 'Logout Success'),
(801, '11:34:36.000000', '2025-02-01', '', '', 'Logout Success'),
(802, '01:13:05.000000', '2025-02-01', 'Administrator', 'protechadmin2024***', 'Login Success'),
(803, '03:56:56.000000', '2025-02-01', 'Ma Sandar Aung', '12341234', 'Login Success'),
(804, '09:14:16.000000', '2025-02-03', 'Administrator', 'protechadmin2024***', 'Login Success'),
(805, '09:27:22.000000', '2025-02-03', 'Administrator', 'protechadmin2024***', 'Login Success'),
(806, '01:54:17.000000', '2025-02-03', 'Administrator', 'protechadmin2024***', 'Login Success'),
(807, '03:00:24.000000', '2025-02-03', 'Administrator', 'protechadmin2024***', 'Login Success'),
(808, '03:58:32.000000', '2025-02-03', 'Administrator', 'protechadmin2024***', 'Login Success'),
(809, '04:16:39.000000', '2025-02-03', 'Administrator', 'protechadmin2024***', 'Login Success'),
(810, '09:12:18.000000', '2025-02-04', 'Administrator', 'protechadmin2024***', 'Login Success'),
(811, '01:39:40.000000', '2025-02-04', 'Administrator', 'protechadmin2024***', 'Login Success'),
(812, '04:37:13.000000', '2025-02-04', 'Administrator', 'protechadmin2024***', 'Login Success'),
(813, '09:14:48.000000', '2025-02-05', 'Administrator', 'protechadmin2024***', 'Login Success'),
(814, '09:23:29.000000', '2025-02-05', 'Ma Sandar Aung', '12341234', 'Login Success'),
(815, '03:35:08.000000', '2025-02-05', 'Ma Sandar Aung', '', 'Logout Success'),
(816, '09:19:37.000000', '2025-02-06', 'Administrator', 'protechadmin2024***', 'Login Success'),
(817, '09:42:10.000000', '2025-02-06', 'Administrator', 'protechadmin2024***', 'Login Success'),
(818, '10:46:48.000000', '2025-02-06', 'Ma Sandar Aung', '12341234', 'Login Success'),
(819, '09:33:53.000000', '2025-02-07', 'Administrator', 'protechadmin2024***', 'Login Success'),
(820, '08:14:07.000000', '2025-02-09', 'Administrator', 'protechadmin2024***', 'Login Success'),
(821, '09:16:09.000000', '2025-02-10', 'Administrator', 'protechadmin2024***', 'Login Success'),
(822, '09:16:37.000000', '2025-02-11', 'Administrator', 'protechadmin2024***', 'Login Success'),
(823, '09:05:36.000000', '2025-02-13', 'Administrator', 'protechadmin2024***', 'Login Success'),
(824, '10:02:24.000000', '2025-02-13', 'Administrator', 'protechadmin2024***', 'Login Success'),
(825, '10:04:29.000000', '2025-02-13', 'Administrator', 'protechadmin2024***', 'Login Success'),
(826, '10:06:35.000000', '2025-02-13', 'Administrator', 'protechadmin2024***', 'Login Success'),
(827, '10:10:25.000000', '2025-02-13', 'Administrator', 'protechadmin2024***', 'Login Success'),
(828, '10:11:15.000000', '2025-02-13', 'Administrator', 'protechadmin2024***', 'Login Success'),
(829, '10:42:49.000000', '2025-02-13', 'Administrator', 'protechadmin2024***', 'Login Success'),
(830, '11:07:43.000000', '2025-02-13', 'Administrator', 'protechadmin2024***', 'Login Success'),
(831, '11:08:34.000000', '2025-02-13', 'Administrator', 'protechadmin2024***', 'Login Success'),
(832, '09:02:24.000000', '2025-02-14', 'Administrator', 'protechadmin2024***', 'Login Success'),
(833, '11:44:14.000000', '2025-02-14', 'Administrator', 'protechadmin2024***', 'Login Success'),
(834, '11:51:11.000000', '2025-02-14', 'Administrator', 'protechadmin2024***', 'Login Success'),
(835, '01:39:40.000000', '2025-02-15', 'Administrator', 'protechadmin2024***', 'Login Success'),
(836, '04:30:09.000000', '2025-02-15', 'Administrator', 'protechadmin2024***', 'Login Success'),
(837, '09:06:26.000000', '2025-02-17', 'Administrator', 'protechadmin2024***', 'Login Success'),
(838, '09:06:26.000000', '2025-02-17', 'Administrator', 'protechadmin2024***', 'Login Success'),
(839, '11:16:11.000000', '2025-02-17', 'Administrator', 'protechadmin2024***', 'Login Success'),
(840, '11:25:15.000000', '2025-02-17', 'Administrator', 'protechadmin2024***', 'Login Success'),
(841, '01:53:45.000000', '2025-02-17', 'Administrator', 'protechadmin2024***', 'Login Success'),
(842, '02:07:57.000000', '2025-02-17', 'Administrator', 'protechadmin2024***', 'Login Success'),
(843, '02:09:27.000000', '2025-02-17', 'Administrator', 'protechadmin2024***', 'Login Success'),
(844, '04:06:06.000000', '2025-02-17', 'Administrator', 'protechadmin2024***', 'Login Success'),
(845, '09:04:59.000000', '2025-02-19', 'Administrator', 'protechadmin2024***', 'Login Success'),
(846, '12:05:45.000000', '2025-02-19', 'Administrator', 'protechadmin2024***', 'Login Success'),
(847, '09:07:32.000000', '2025-02-20', 'Administrator', 'protechadmin2024***', 'Login Success'),
(848, '08:58:57.000000', '2025-02-21', 'Administrator', 'protechadmin2024***', 'Login Success'),
(849, '09:01:37.000000', '2025-02-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(850, '11:01:00.000000', '2025-02-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(851, '11:10:05.000000', '2025-02-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(852, '11:25:03.000000', '2025-02-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(853, '11:27:31.000000', '2025-02-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(854, '11:34:44.000000', '2025-02-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(855, '01:15:40.000000', '2025-02-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(856, '04:48:24.000000', '2025-02-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(857, '12:03:19.000000', '2025-02-23', 'Administrator', 'protechadmin2024***', 'Login Success'),
(858, '12:09:12.000000', '2025-02-23', 'Administrator', 'protechadmin2024***', 'Login Success'),
(859, '01:38:27.000000', '2025-02-23', 'Administrator', 'protechadmin2024***', 'Login Success'),
(860, '03:08:08.000000', '2025-02-23', 'Administrator', 'protechadmin2024***', 'Login Success'),
(861, '03:55:23.000000', '2025-02-23', 'Administrator', 'protechadmin2024***', 'Login Success'),
(862, '09:08:41.000000', '2025-02-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(863, '09:14:13.000000', '2025-02-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(864, '01:36:52.000000', '2025-02-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(865, '01:45:36.000000', '2025-02-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(866, '01:46:27.000000', '2025-02-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(867, '01:49:45.000000', '2025-02-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(868, '09:21:33.000000', '2025-02-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(869, '12:34:22.000000', '2025-02-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(870, '12:40:29.000000', '2025-02-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(871, '02:30:39.000000', '2025-02-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(872, '06:17:38.000000', '2025-02-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(873, '06:18:14.000000', '2025-02-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(874, '09:05:30.000000', '2025-02-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(875, '02:55:19.000000', '2025-02-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(876, '05:45:02.000000', '2025-02-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(877, '05:49:44.000000', '2025-02-26', 'Administrator', '', 'Logout Success'),
(878, '05:49:47.000000', '2025-02-26', '', '', 'Logout Success'),
(879, '10:45:34.000000', '2025-02-27', 'Administrator', 'protechadmin2024***', 'Login Success'),
(880, '09:03:17.000000', '2025-02-28', 'Administrator', 'protechadmin2024***', 'Login Success'),
(881, '10:59:43.000000', '2025-02-28', 'Administrator', 'protechadmin2024***', 'Login Success'),
(882, '11:03:17.000000', '2025-02-28', 'Administrator', 'protechadmin2024***', 'Login Success'),
(883, '12:24:34.000000', '2025-02-28', 'Administrator', 'protechadmin2024***', 'Login Success'),
(884, '09:12:59.000000', '2025-03-01', 'Administrator', 'protechadmin2024***', 'Login Success'),
(885, '09:22:42.000000', '2025-03-01', 'Administrator', 'protechadmin2024***', 'Login Success'),
(886, '12:05:58.000000', '2025-03-01', 'Administrator', 'protechadmin2024***', 'Login Success'),
(887, '04:44:29.000000', '2025-03-01', 'Administrator', 'protechadmin2024***', 'Login Success'),
(888, '09:09:29.000000', '2025-03-03', 'Administrator', 'protechadmin2024***', 'Login Success'),
(889, '09:12:01.000000', '2025-03-04', 'Administrator', 'protechadmin2024***', 'Login Success'),
(890, '09:45:57.000000', '2025-03-04', 'Administrator', 'protechadmin2024***', 'Login Success'),
(891, '02:44:22.000000', '2025-03-04', 'Administrator', 'protechadmin2024***', 'Login Success'),
(892, '03:29:52.000000', '2025-03-04', 'Administrator', 'protechadmin2024***', 'Login Success'),
(893, '03:48:49.000000', '2025-03-04', 'Administrator', 'protechadmin2024***', 'Login Success'),
(894, '09:09:13.000000', '2025-03-05', 'Administrator', 'protechadmin2024***', 'Login Success'),
(895, '10:10:54.000000', '2025-03-05', 'Administrator', 'protechadmin2024***', 'Login Success'),
(896, '10:11:45.000000', '2025-03-05', 'Administrator', 'protechadmin2024***', 'Login Success'),
(897, '10:13:59.000000', '2025-03-05', 'Administrator', 'protechadmin2024***', 'Login Success'),
(898, '10:14:32.000000', '2025-03-05', 'Administrator', 'protechadmin2024***', 'Login Success'),
(899, '04:31:32.000000', '2025-03-05', 'Administrator', 'protechadmin2024***', 'Login Success'),
(900, '04:36:14.000000', '2025-03-05', 'Administrator', 'protechadmin2024***', 'Login Success'),
(901, '04:37:47.000000', '2025-03-05', 'Administrator', 'protechadmin2024***', 'Login Success'),
(902, '09:03:35.000000', '2025-03-06', 'Administrator', 'protechadmin2024***', 'Login Success'),
(903, '12:18:30.000000', '2025-03-06', 'Administrator', 'protechadmin2024***', 'Login Success'),
(904, '01:38:55.000000', '2025-03-06', 'Administrator', 'protechadmin2024***', 'Login Success'),
(905, '02:08:58.000000', '2025-03-06', 'Administrator', 'protechadmin2024***', 'Login Success'),
(906, '02:48:01.000000', '2025-03-06', 'Administrator', 'protechadmin2024***', 'Login Success'),
(907, '02:57:42.000000', '2025-03-06', 'Administrator', 'protechadmin2024***', 'Login Success'),
(908, '02:59:49.000000', '2025-03-06', 'Administrator', 'protechadmin2024***', 'Login Success'),
(909, '03:19:22.000000', '2025-03-06', 'Administrator', 'protechadmin2024***', 'Login Success'),
(910, '09:00:01.000000', '2025-03-18', 'Administrator', 'protechadmin2024***', 'Login Success'),
(911, '01:10:45.000000', '2025-03-18', 'Administrator', 'protechadmin2024***', 'Login Success'),
(912, '03:42:42.000000', '2025-03-18', 'Administrator', 'protechadmin2024***', 'Login Success'),
(913, '09:32:18.000000', '2025-03-19', 'Administrator', 'protechadmin2024***', 'Login Success'),
(914, '01:25:47.000000', '2025-03-19', 'Administrator', 'protechadmin2024***', 'Login Success'),
(915, '01:29:08.000000', '2025-03-19', 'Administrator', 'protechadmin2024***', 'Login Success'),
(916, '01:41:12.000000', '2025-03-19', 'Administrator', 'protechadmin2024***', 'Login Success'),
(917, '02:44:54.000000', '2025-03-19', 'Administrator', '', 'Logout Success'),
(918, '02:44:55.000000', '2025-03-19', '', '', 'Logout Success'),
(919, '02:44:58.000000', '2025-03-19', '', '', 'Logout Success'),
(920, '03:12:25.000000', '2025-03-19', 'Administrator', 'protechadmin2024***', 'Login Success'),
(921, '03:28:55.000000', '2025-03-19', 'Administrator', '', 'Logout Success'),
(922, '10:44:13.000000', '2025-03-20', 'Administrator', 'protechadmin2024***', 'Login Success'),
(923, '11:35:50.000000', '2025-03-20', 'Administrator', 'protechadmin2024***', 'Login Success'),
(924, '01:50:11.000000', '2025-03-20', 'Administrator', 'protechadmin2024***', 'Login Success'),
(925, '01:59:34.000000', '2025-03-20', 'Administrator', 'protechadmin2024***', 'Login Success'),
(926, '03:08:41.000000', '2025-03-20', 'Administrator', 'protechadmin2024***', 'Login Success'),
(927, '03:49:32.000000', '2025-03-20', 'Administrator', 'protechadmin2024***', 'Login Success'),
(928, '06:58:32.000000', '2025-03-20', 'Administrator', 'protechadmin2024***', 'Login Success'),
(929, '11:13:50.000000', '2025-03-21', 'Administrator', 'protechadmin2024***', 'Login Success'),
(930, '11:18:18.000000', '2025-03-21', 'Administrator', 'protechadmin2024***', 'Login Success'),
(931, '11:18:56.000000', '2025-03-21', 'Administrator', 'protechadmin2024***', 'Login Success'),
(932, '11:36:51.000000', '2025-03-21', 'Administrator', 'protechadmin2024***', 'Login Success'),
(933, '04:19:39.000000', '2025-03-21', 'Administrator', '', 'Logout Success'),
(934, '12:59:38.000000', '2025-03-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(935, '01:00:49.000000', '2025-03-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(936, '01:01:22.000000', '2025-03-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(937, '01:01:22.000000', '2025-03-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(938, '05:20:19.000000', '2025-03-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(939, '09:07:36.000000', '2025-03-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(940, '01:26:20.000000', '2025-03-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(941, '01:33:22.000000', '2025-03-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(942, '03:09:47.000000', '2025-03-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(943, '11:49:52.000000', '2025-03-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(944, '04:23:41.000000', '2025-03-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(945, '11:18:21.000000', '2025-03-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(946, '09:06:02.000000', '2025-03-28', 'Administrator', 'protechadmin2024***', 'Login Success'),
(947, '09:06:25.000000', '2025-03-28', 'Administrator', 'protechadmin2024***', 'Login Success'),
(948, '10:24:40.000000', '2025-03-29', 'Administrator', 'protechadmin2024***', 'Login Success'),
(949, '10:30:33.000000', '2025-03-29', 'Administrator', 'protechadmin2024***', 'Login Success'),
(950, '01:27:29.000000', '2025-03-29', 'Administrator', 'protechadmin2024***', 'Login Success'),
(951, '01:09:30.000000', '2025-03-31', 'Administrator', 'protechadmin2024***', 'Login Success'),
(952, '01:09:30.000000', '2025-03-31', 'Administrator', 'protechadmin2024***', 'Login Success'),
(953, '09:04:46.000000', '2025-04-01', 'Administrator', 'protechadmin2024***', 'Login Success'),
(954, '10:40:56.000000', '2025-04-02', 'Administrator', 'protechadmin2024***', 'Login Success'),
(955, '03:12:03.000000', '2025-04-02', 'Administrator', 'protechadmin2024***', 'Login Success'),
(956, '04:24:47.000000', '2025-04-02', 'Administrator', 'protechadmin2024***', 'Login Success'),
(957, '02:21:09.000000', '2025-04-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(958, '02:21:09.000000', '2025-04-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(959, '03:51:07.000000', '2025-04-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(960, '04:22:45.000000', '2025-04-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(961, '09:10:52.000000', '2025-04-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(962, '07:17:24.000000', '2025-04-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(963, '09:17:52.000000', '2025-04-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(964, '09:19:56.000000', '2025-04-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(965, '12:09:10.000000', '2025-04-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(966, '12:26:32.000000', '2025-04-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(967, '08:18:53.000000', '2025-04-27', 'Administrator', 'protechadmin2024***', 'Login Success'),
(968, '09:25:37.000000', '2025-04-27', 'Administrator', '', 'Logout Success'),
(969, '08:56:13.000000', '2025-04-28', 'Administrator', 'protechadmin2024***', 'Login Success'),
(970, '09:17:14.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(971, '09:23:50.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(972, '09:32:59.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(973, '09:35:12.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(974, '09:42:44.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(975, '11:31:14.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(976, '11:32:25.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(977, '11:32:46.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(978, '11:33:11.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(979, '11:33:52.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(980, '11:36:49.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(981, '11:37:24.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(982, '11:38:16.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(983, '11:38:58.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(984, '11:39:31.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(985, '11:46:54.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(986, '11:47:29.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(987, '11:49:50.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(988, '11:50:09.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(989, '11:53:35.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(990, '12:58:39.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(991, '01:00:51.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(992, '01:02:25.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(993, '01:03:40.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(994, '01:05:02.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(995, '01:09:06.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(996, '01:11:06.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(997, '02:05:09.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(998, '02:36:40.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(999, '02:38:14.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1000, '02:40:48.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1001, '02:59:04.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1002, '03:05:11.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1003, '03:06:38.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1004, '03:10:34.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1005, '03:13:05.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1006, '03:14:15.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1007, '03:17:30.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1008, '03:19:27.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1009, '03:21:00.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1010, '03:21:26.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1011, '03:26:11.000000', '2025-04-28', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1012, '03:31:32.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1013, '03:49:41.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1014, '04:47:57.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1015, '04:49:08.000000', '2025-04-28', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1016, '09:51:08.000000', '2025-04-29', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1017, '09:53:17.000000', '2025-04-29', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1018, '09:58:06.000000', '2025-04-29', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1019, '10:21:21.000000', '2025-04-29', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1020, '11:04:46.000000', '2025-04-29', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1021, '11:21:18.000000', '2025-04-29', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1022, '11:44:00.000000', '2025-04-29', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1023, '12:53:51.000000', '2025-04-29', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1024, '12:54:32.000000', '2025-04-29', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1025, '01:04:06.000000', '2025-04-29', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1026, '01:52:59.000000', '2025-04-29', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1027, '02:04:16.000000', '2025-04-29', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1028, '02:39:00.000000', '2025-04-29', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1029, '02:43:27.000000', '2025-04-29', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1030, '03:49:12.000000', '2025-04-29', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1031, '04:23:51.000000', '2025-04-29', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1032, '01:46:27.000000', '2025-04-30', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1033, '02:11:13.000000', '2025-04-30', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1034, '02:59:33.000000', '2025-04-30', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1035, '02:59:47.000000', '2025-04-30', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1036, '03:21:20.000000', '2025-04-30', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1037, '03:22:42.000000', '2025-04-30', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1038, '03:23:11.000000', '2025-04-30', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1039, '03:24:22.000000', '2025-04-30', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1040, '03:38:10.000000', '2025-04-30', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1041, '04:29:53.000000', '2025-04-30', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1042, '05:01:51.000000', '2025-04-30', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1043, '05:08:47.000000', '2025-04-30', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1044, '05:12:25.000000', '2025-04-30', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1045, '05:24:19.000000', '2025-04-30', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1046, '05:26:48.000000', '2025-04-30', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1047, '05:27:05.000000', '2025-04-30', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1048, '05:28:04.000000', '2025-04-30', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1049, '05:28:32.000000', '2025-04-30', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1050, '10:47:24.000000', '2025-05-02', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1051, '10:53:20.000000', '2025-05-02', 'Administrator', '', 'Logout Success'),
(1052, '10:53:38.000000', '2025-05-02', 'Ma Soe Soe Khaing', 'stockstock', 'Login Success'),
(1053, '10:53:47.000000', '2025-05-02', 'Ma Soe Soe Khaing', '', 'Logout Success');
INSERT INTO `userlogs` (`id`, `login_time`, `login_date`, `login_username`, `login_password`, `status`) VALUES
(1054, '10:53:50.000000', '2025-05-02', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1055, '11:30:09.000000', '2025-05-02', 'Administrator', 'protechadmin2024***', 'Login Success'),
(1056, '01:18:53.000000', '2025-05-02', 'Administrator', 'protechadmin2024***', 'Login Success');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=493;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=568;

--
-- AUTO_INCREMENT for table `form7stock`
--
ALTER TABLE `form7stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `form7stocktcl`
--
ALTER TABLE `form7stocktcl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form10stock`
--
ALTER TABLE `form10stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `form10stocktcl`
--
ALTER TABLE `form10stocktcl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_ledger`
--
ALTER TABLE `general_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=610;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=438;

--
-- AUTO_INCREMENT for table `gfctotal`
--
ALTER TABLE `gfctotal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hhkmcstock`
--
ALTER TABLE `hhkmcstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `hhkstock`
--
ALTER TABLE `hhkstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice_costing`
--
ALTER TABLE `invoice_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1052;

--
-- AUTO_INCREMENT for table `labour`
--
ALTER TABLE `labour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

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
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `receivable`
--
ALTER TABLE `receivable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=560;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1057;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
