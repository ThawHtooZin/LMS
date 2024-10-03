-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2024 at 06:50 AM
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
(397, '4000/099', 40, 'Tommy'),
(398, '4000/P03', 40, 'Carton Box (Pan Thazin)'),
(399, '4000/D04', 40, 'Dalian Ice'),
(400, '4000/G03', 40, 'Plastic (Golden Fish)'),
(401, '9100/037', 39, 'Tender Expense'),
(402, '3300/006', 35, 'Bangladesh (Frozen)'),
(403, '3300/007', 35, 'Bangladesh (Chill/Technak)');

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

--
-- Dumping data for table `cashbook`
--

INSERT INTO `cashbook` (`id`, `date`, `sr_no`, `ac_name`, `particular`, `debit`, `credit`, `balance`, `voucher_no`, `crossac_name`, `transactionid`, `interfacerowid`) VALUES
(1, '2024-09-16', '', '3600/001', 'Opining Balance of Sep-16-24', '0', '0', '260688072', NULL, NULL, 0, 1),
(2, '2024-09-16', '', '3600/001', 'Water 5pcs*900ks Purchase for W/H', '0', '4500', '260683572', 'Dr-Sep 24/332', '9100/003', 3, 0),
(3, '2024-09-16', '', '3600/001', 'Taxi Charges For Printer Sent For W/H', '0', '10000', '260673572', 'Dr-Sep 24/333', '9100/002', 5, 0),
(4, '2024-09-16', '', '3600/001', 'Printer Ink Purchase For Office (2pcs*6000ks)', '0', '12000', '260661572', 'Dr-Sep 24/334', '9100/016', 7, 0),
(5, '2024-09-16', '', '3600/001', 'Taxi Charges For MC Tally People For GFC to W/H', '0', '5000', '260656572', 'Dr-Sep 24/335', '9100/002', 9, 0),
(6, '2024-09-16', '', '3600/001', 'Wasting Carry Charges For New Factory Cleaning', '0', '20000', '260636572', 'Dr-Sep 24/336', '9100/005', 11, 0),
(7, '2024-09-16', '', '3600/001', 'Taxi Charges For W/H to HHK For Biryani', '0', '18000', '260618572', 'Dr-Sep 24/337', '9100/002', 13, 0),
(8, '2024-09-16', '', '3600/001', 'Car Repair For 3K-1574 For Brake (Need Material 40000+ Repair Charges 25000)', '0', '65000', '260553572', 'Dr-Sep 24/338', '9100/014', 15, 0),
(9, '2024-09-16', '', '3600/001', 'Purchase UPS Changing and Service For Office Soe Soe Computer (UPS 98000+Service Charge 30000)', '0', '128000', '260425572', 'Dr-Sep 24/339', '9100/019', 17, 0),
(10, '2024-09-16', '', '3600/001', 'Sugar 1 pcs*1500ks Purchase For Sir', '0', '1500', '260424072', 'Dr-Sep 24/340', '9100/012', 19, 0),
(11, '2024-09-16', '', '3600/001', 'Dummy Air Ticket For Sir Singapore Visa', '0', '30000', '260394072', 'Dr-Sep 24/341', '9100/017', 21, 0),
(12, '2024-09-16', '', '3600/001', 'MC Charges For HHK To GFC (14.9.24=500000,16.9.24=500000)', '0', '1000000', '259394072', 'Dr-Sep 24/342', '6100/005', 23, 0),
(13, '2024-09-16', '', '3600/001', 'Labour Charges and Taxi For W/H (Baila 19Vissx350ks,D Puti 103Vissx600ks,Batashi 17.5Viss)', '0', '115950', '259278122', 'Dr-Sep 24/343', '6100/001', 25, 0),
(14, '2024-09-16', '', '3600/001', 'Car Charges For Tender Go To Nay Pyi Taw 12.9.24 to 14.9.24 LM Factory', '0', '1120000', '258158122', 'Dr-Sep 24/344', '9100/037', 27, 0),
(15, '2024-09-16', '', '3600/001', 'K-pay Charges For Car Charges Transfer NPT LM Factory', '0', '2000', '258156122', 'Dr-Sep 24/345', '9100/009', 29, 0),
(16, '2024-09-16', '', '3600/001', 'Hotal Charges For Factory Contract go D.Nan+2pcs LM Factory', '0', '326000', '257830122', 'Dr-Sep 24/346', '9100/037', 31, 0),
(17, '2024-09-16', '', '3600/001', 'Bank Guarantee 1 Month for LM Factory', '0', '15966000', '241864122', 'Dr-Sep 24/347', '9100/037', 33, 0),
(18, '2024-09-16', '', '3600/001', 'Rental Contract 1year for for LM Factory Sep\'24 to Sep\'25 (15700000*12month)', '0', '188400000', '53464122', 'Dr-Sep 24/348', '9100/037', 35, 0),
(19, '2024-09-16', '', '3600/001', 'Paid to Goverment NPT People For Tender MD-100 Lakh,D.Nan 50 Lakh,Ko Phyoe 10 Lakh', '0', '17362000', '36102122', 'Dr-Sep 24/349', '9100/037', 37, 0),
(20, '2024-09-16', '', '3600/001', 'Paid To Government People (YGN) For Tender U Aung Kyaw 3 Lakh, Daw Ohn Mar 10 Lakh, D', '0', '2300000', '33802122', 'Dr-Sep 24/350', '9100/037', 39, 0),
(21, '2024-09-16', '', '3600/001', 'Stamp Duty fees For Factory Contract (188400000\r\n*0.5%)+(BG 15700000*2%) LM Factory', '0', '1256000', '32546122', 'Dr-Sep 24/351', '9100/037', 41, 0),
(22, '2024-09-16', '', '3600/001', 'Under Taking For Tax Darpartment for Stamp Duty LM Factory', '0', '10000', '32536122', 'Dr-Sep 24/352', '9100/037', 43, 0),
(23, '2024-09-16', '', '3600/001', 'Copy For Tender Tax Document all LM Factory', '0', '7300', '32528822', 'Dr-Sep 24/353', '9100/037', 45, 0),
(24, '2024-09-16', '', '3600/001', 'Meal Allowance For Tender go 12.9.24 to 14.9.24 Daw Nan+2pcs LM Factory', '0', '288375', '32240447', 'Dr-Sep 24/354', '9100/037', 47, 0),
(25, '2024-09-16', '', '3600/001', 'Paid to Tun Naing For Vr no 12148', '0', '346500', '31893947', 'Dr-Sep 24/355', '4000/T14', 49, 0),
(26, '2024-09-16', '', '3600/001', 'Taxi Charges For W/H to Market to W/H and Boy 1 pcs house go', '0', '33000', '31860947', 'Dr-Sep 24/356', '9100/002', 51, 0),
(27, '2024-09-16', '', '3600/001', 'Meal allowance For Market Boys Am4pcs, Lunch4pcs', '0', '14000', '31846947', 'Dr-Sep 24/357', '9100/012', 53, 0),
(28, '2024-09-16', '', '3600/001', 'Labour Charges For Market Fish', '0', '26500', '31820447', 'Dr-Sep 24/358', '6100/001', 55, 0),
(29, '2024-09-16', '', '3600/001', 'Car Packing For Market', '0', '2000', '31818447', 'Dr-Sep 24/359', '9100/025', 57, 0),
(30, '2024-09-16', '', '3600/001', 'Ice 6pcs*15000ks For Market Fish', '0', '90000', '31728447', 'Dr-Sep 24/360', '6100/002', 59, 0),
(31, '2024-09-18', '', '3600/001', 'Ice 9 pcs*15000 Purchase For Market Fish', '0', '135000', '31136947', 'Dr-Sep 24/376', '6100/002', 91, 0),
(32, '2024-09-18', '', '3600/001', 'Car Diesel For 3K-1574(15.9/18.9/19.9)', '0', '150000', '30986947', 'Dr-Sep 24/377', '9100/006', 93, 0),
(33, '2024-09-18', '', '3600/001', 'Taxi Charges For W/H to UAB to W/H', '0', '4000', '30982947', 'Dr-Sep 24/378', '9100/002', 95, 0),
(34, '2024-09-18', '', '3600/001', 'Sir Carry Charges For 19.9.24 AM', '0', '3000', '30979947', 'Dr-Sep 24/379', '9100/002', 97, 0),
(35, '2024-09-18', '', '3600/001', 'Taxi charges For W/H to Market to W/H', '0', '30000', '30949947', 'Dr-Sep 24/380', '9100/002', 99, 0),
(36, '2024-09-18', '', '3600/001', 'Meal Allowance For Am4pcs, Lunch4pcs', '0', '14000', '30935947', 'Dr-Sep 24/381', '9100/012', 101, 0),
(37, '2024-09-18', '', '3600/001', 'Cable Tie Purchase For Market Fish Pk', '0', '18000', '30917947', 'Dr-Sep 24/382', '9100/005', 103, 0),
(38, '2024-09-18', '', '3600/001', 'Car Packing For Market', '0', '2000', '30915947', 'Dr-Sep 24/383', '9100/025', 106, 0),
(39, '2024-09-18', '', '3600/001', 'Ice 3 pcs*15000ks Purchase For Rohu', '0', '45000', '30870947', 'Dr-Sep 24/384', '6100/002', 108, 0),
(40, '2024-09-18', '', '3600/001', 'Labour Charges For Rohu', '0', '9000', '30861947', 'Dr-Sep 24/385', '6100/001', 110, 0),
(41, '2024-09-18', '', '3600/001', 'Labour Charges For Market', '0', '38000', '30823947', 'Dr-Sep 24/386', '6100/001', 112, 0),
(42, '2024-09-18', '', '3600/001', 'Ice 9 Pcs*15000ks Purchase For Market Fish', '0', '135000', '30688947', 'Dr-Sep 24/387', '6100/002', 116, 0),
(43, '2024-09-17', '', '3600/001', 'Car Diesel For 3k-1574 (15.9.24=50000,17.9.24=500000)30.54 Liters*3275ks', '0', '100000', '31628447', 'Dr-Sep 24/361', '9100/006', 61, 0),
(44, '2024-09-17', '', '3600/001', 'Taxi Charges For Mindama to Lai Lai house For Fish Goverment', '0', '5500', '31622947', 'Dr-Sep 24/362', '9100/002', 63, 0),
(45, '2024-09-17', '', '3600/001', 'Labour Charges and Taxi For W/H Batashi 9viss*1000ks, Taxi 20000ks', '0', '29000', '31593947', 'Dr-Sep 24/363', '6100/001', 65, 0),
(46, '2024-09-17', '', '3600/001', 'Taxi Charges For W/H to UAB For Lai Lai for A/C Check', '0', '3000', '31590947', 'Dr-Sep 24/364', '9100/002', 67, 0),
(47, '2024-09-17', '', '3600/001', 'Cutter 5 pcs Purchase and Taxi For Batashi Clean (20000+4000)', '0', '24000', '31566947', 'Dr-Sep 24/365', '9100/005', 69, 0),
(48, '2024-09-17', '', '3600/001', 'Taxi Charges For HHK to W/H For 16.9.24', '0', '30000', '31536947', 'Dr-Sep 24/366', '9100/002', 71, 0),
(49, '2024-09-17', '', '3600/001', 'Workers 5pcs*2000ks Dinner For HHK OT', '0', '10000', '31526947', 'Dr-Sep 24/367', '9100/012', 73, 0),
(50, '2024-09-17', '', '3600/001', 'Ice 8pcs*10500ks Purchase and Carry For HHK', '0', '96000', '31430947', 'Dr-Sep 24/368', '6100/002', 75, 0),
(51, '2024-09-17', '', '3600/001', 'Taxi Charges For W/H to OP', '0', '13000', '31417947', 'Dr-Sep 24/369', '9100/002', 77, 0),
(52, '2024-09-17', '', '3600/001', 'Taxi Charges For W/H to HHK Carton Box Carry Charges', '0', '35000', '31382947', 'Dr-Sep 24/370', '9100/002', 79, 0),
(53, '2024-09-17', '', '3600/001', 'Labour Charges For OP Raw', '0', '30000', '31352947', 'Dr-Sep 24/371', '6100/001', 81, 0),
(54, '2024-09-17', '', '3600/001', 'Taxi Charges For W/H to Market to W/H', '0', '25000', '31327947', 'Dr-Sep 24/372', '9100/002', 83, 0),
(55, '2024-09-17', '', '3600/001', 'Meal allowance For Market Boys Am3pcs,Lunch 3pcs', '0', '10500', '31317447', 'Dr-Sep 24/373', '9100/012', 85, 0),
(56, '2024-09-17', '', '3600/001', 'Labour charges For Market Fish', '0', '42500', '31274947', 'Dr-Sep 24/374', '6100/001', 87, 0),
(57, '2024-09-17', '', '3600/001', 'Car Packing For Market', '0', '3000', '31271947', 'Dr-Sep 24/375', '9100/025', 89, 0);

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
(121, 1, 'balance', '', '8823.19', '', 0);

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
(25, '2024-09-16', 'Dr-Sep 24/332', '9100/003', '4500', '0', '4500', 'Water 5pcs*900ks Purchase for W/H', '', '', 0, 39, 2),
(26, '2024-09-16', 'Dr-Sep 24/332', '3600/001', '0', '4500', '-4500', 'Water 5pcs*900ks Purchase for W/H', '', '', 0, 35, 3),
(27, '2024-09-16', 'Dr-Sep 24/333', '9100/002', '10000', '0', '10000', 'Taxi Charges For Printer Sent For W/H', '', '', 0, 39, 4),
(28, '2024-09-16', 'Dr-Sep 24/333', '3600/001', '0', '10000', '-14500', 'Taxi Charges For Printer Sent For W/H', '', '', 0, 35, 5),
(29, '2024-09-16', 'Dr-Sep 24/334', '9100/016', '12000', '0', '12000', 'Printer Ink Purchase For Office (2pcs*6000ks)', '', '', 0, 39, 6),
(30, '2024-09-16', 'Dr-Sep 24/334', '3600/001', '0', '12000', '-26500', 'Printer Ink Purchase For Office (2pcs*6000ks)', '', '', 0, 35, 7),
(31, '2024-09-16', 'Dr-Sep 24/335', '9100/002', '5000', '0', '15000', 'Taxi Charges For MC Tally People For GFC to W/H', '', '', 0, 39, 8),
(32, '2024-09-16', 'Dr-Sep 24/335', '3600/001', '0', '5000', '-31500', 'Taxi Charges For MC Tally People For GFC to W/H', '', '', 0, 35, 9),
(33, '2024-09-16', 'Dr-Sep 24/336', '9100/005', '20000', '0', '20000', 'Wasting Carry Charges For New Factory Cleaning', '', '', 0, 39, 10),
(34, '2024-09-16', 'Dr-Sep 24/336', '3600/001', '0', '20000', '-51500', 'Wasting Carry Charges For New Factory Cleaning', '', '', 0, 35, 11),
(35, '2024-09-16', 'Dr-Sep 24/337', '9100/002', '18000', '0', '33000', 'Taxi Charges For W/H to HHK For Biryani', '', '', 0, 39, 12),
(36, '2024-09-16', 'Dr-Sep 24/337', '3600/001', '0', '18000', '-69500', 'Taxi Charges For W/H to HHK For Biryani', '', '', 0, 35, 13),
(37, '2024-09-16', 'Dr-Sep 24/338', '9100/014', '65000', '0', '65000', 'Car Repair For 3K-1574 For Brake (Need Material 40000+ Repair Charges 25000)', '', '', 0, 39, 14),
(38, '2024-09-16', 'Dr-Sep 24/338', '3600/001', '0', '65000', '-134500', 'Car Repair For 3K-1574 For Brake (Need Material 40000+ Repair Charges 25000)', '', '', 0, 35, 15),
(39, '2024-09-16', 'Dr-Sep 24/339', '9100/019', '128000', '0', '128000', 'Purchase UPS Changing and Service For Office Soe Soe Computer (UPS 98000+Service Charge 30000)', '', '', 0, 39, 16),
(40, '2024-09-16', 'Dr-Sep 24/339', '3600/001', '0', '128000', '-262500', 'Purchase UPS Changing and Service For Office Soe Soe Computer (UPS 98000+Service Charge 30000)', '', '', 0, 35, 17),
(41, '2024-09-16', 'Dr-Sep 24/340', '9100/012', '1500', '0', '1500', 'Sugar 1 pcs*1500ks Purchase For Sir', '', '', 0, 39, 18),
(42, '2024-09-16', 'Dr-Sep 24/340', '3600/001', '0', '1500', '-264000', 'Sugar 1 pcs*1500ks Purchase For Sir', '', '', 0, 35, 19),
(43, '2024-09-16', 'Dr-Sep 24/341', '9100/017', '30000', '0', '30000', 'Dummy Air Ticket For Sir Singapore Visa', '', '', 0, 39, 20),
(44, '2024-09-16', 'Dr-Sep 24/341', '3600/001', '0', '30000', '-294000', 'Dummy Air Ticket For Sir Singapore Visa', '', '', 0, 35, 21),
(45, '2024-09-16', 'Dr-Sep 24/342', '6100/005', '1000000', '0', '1000000', 'MC Charges For HHK To GFC (14.9.24=500000,16.9.24=500000)', '', '', 0, 37, 22),
(46, '2024-09-16', 'Dr-Sep 24/342', '3600/001', '0', '1000000', '-1294000', 'MC Charges For HHK To GFC (14.9.24=500000,16.9.24=500000)', '', '', 0, 35, 23),
(47, '2024-09-16', 'Dr-Sep 24/343', '6100/001', '115950', '0', '115950', 'Labour Charges and Taxi For W/H (Baila 19Vissx350ks,D Puti 103Vissx600ks,Batashi 17.5Viss)', '', '', 0, 37, 24),
(48, '2024-09-16', 'Dr-Sep 24/343', '3600/001', '0', '115950', '-1409950', 'Labour Charges and Taxi For W/H (Baila 19Vissx350ks,D Puti 103Vissx600ks,Batashi 17.5Viss)', '', '', 0, 35, 25),
(49, '2024-09-16', 'Dr-Sep 24/344', '9100/037', '1120000', '0', '1120000', 'Car Charges For Tender Go To Nay Pyi Taw 12.9.24 to 14.9.24 LM Factory', '', '', 0, 39, 26),
(50, '2024-09-16', 'Dr-Sep 24/344', '3600/001', '0', '1120000', '-2529950', 'Car Charges For Tender Go To Nay Pyi Taw 12.9.24 to 14.9.24 LM Factory', '', '', 0, 35, 27),
(51, '2024-09-16', 'Dr-Sep 24/345', '9100/009', '2000', '0', '2000', 'K-pay Charges For Car Charges Transfer NPT LM Factory', '', '', 0, 39, 28),
(52, '2024-09-16', 'Dr-Sep 24/345', '3600/001', '0', '2000', '-2531950', 'K-pay Charges For Car Charges Transfer NPT LM Factory', '', '', 0, 35, 29),
(53, '2024-09-16', 'Dr-Sep 24/346', '9100/037', '326000', '0', '1446000', 'Hotal Charges For Factory Contract go D.Nan+2pcs LM Factory', '', '', 0, 39, 30),
(54, '2024-09-16', 'Dr-Sep 24/346', '3600/001', '0', '326000', '-2857950', 'Hotal Charges For Factory Contract go D.Nan+2pcs LM Factory', '', '', 0, 35, 31),
(55, '2024-09-16', 'Dr-Sep 24/347', '9100/037', '15966000', '0', '17412000', 'Bank Guarantee 1 Month for LM Factory', '', '', 0, 39, 32),
(56, '2024-09-16', 'Dr-Sep 24/347', '3600/001', '0', '15966000', '-18823950', 'Bank Guarantee 1 Month for LM Factory', '', '', 0, 35, 33),
(57, '2024-09-16', 'Dr-Sep 24/348', '9100/037', '188400000', '0', '205812000', 'Rental Contract 1year for for LM Factory Sep\'24 to Sep\'25 (15700000*12month)', '', '', 0, 39, 34),
(58, '2024-09-16', 'Dr-Sep 24/348', '3600/001', '0', '188400000', '-207223950', 'Rental Contract 1year for for LM Factory Sep\'24 to Sep\'25 (15700000*12month)', '', '', 0, 35, 35),
(59, '2024-09-16', 'Dr-Sep 24/349', '9100/037', '17362000', '0', '223174000', 'Paid to Goverment NPT People For Tender MD-100 Lakh,D.Nan 50 Lakh,Ko Phyoe 10 Lakh', '', '', 0, 39, 36),
(60, '2024-09-16', 'Dr-Sep 24/349', '3600/001', '0', '17362000', '-224585950', 'Paid to Goverment NPT People For Tender MD-100 Lakh,D.Nan 50 Lakh,Ko Phyoe 10 Lakh', '', '', 0, 35, 37),
(61, '2024-09-16', 'Dr-Sep 24/350', '9100/037', '2300000', '0', '225474000', 'Paid To Government People (YGN) For Tender U Aung Kyaw 3 Lakh, Daw Ohn Mar 10 Lakh, D', '', '', 0, 39, 38),
(62, '2024-09-16', 'Dr-Sep 24/350', '3600/001', '0', '2300000', '-226885950', 'Paid To Government People (YGN) For Tender U Aung Kyaw 3 Lakh, Daw Ohn Mar 10 Lakh, D', '', '', 0, 35, 39),
(63, '2024-09-16', 'Dr-Sep 24/351', '9100/037', '1256000', '0', '226730000', 'Stamp Duty fees For Factory Contract (188400000\r\n*0.5%)+(BG 15700000*2%) LM Factory', '', '', 0, 39, 40),
(64, '2024-09-16', 'Dr-Sep 24/351', '3600/001', '0', '1256000', '-228141950', 'Stamp Duty fees For Factory Contract (188400000\r\n*0.5%)+(BG 15700000*2%) LM Factory', '', '', 0, 35, 41),
(65, '2024-09-16', 'Dr-Sep 24/352', '9100/037', '10000', '0', '226740000', 'Under Taking For Tax Darpartment for Stamp Duty LM Factory', '', '', 0, 39, 42),
(66, '2024-09-16', 'Dr-Sep 24/352', '3600/001', '0', '10000', '-228151950', 'Under Taking For Tax Darpartment for Stamp Duty LM Factory', '', '', 0, 35, 43),
(67, '2024-09-16', 'Dr-Sep 24/353', '9100/037', '7300', '0', '226747300', 'Copy For Tender Tax Document all LM Factory', '', '', 0, 39, 44),
(68, '2024-09-16', 'Dr-Sep 24/353', '3600/001', '0', '7300', '-228159250', 'Copy For Tender Tax Document all LM Factory', '', '', 0, 35, 45),
(69, '2024-09-16', 'Dr-Sep 24/354', '9100/037', '288375', '0', '227035675', 'Meal Allowance For Tender go 12.9.24 to 14.9.24 Daw Nan+2pcs LM Factory', '', '', 0, 39, 46),
(70, '2024-09-16', 'Dr-Sep 24/354', '3600/001', '0', '288375', '-228447625', 'Meal Allowance For Tender go 12.9.24 to 14.9.24 Daw Nan+2pcs LM Factory', '', '', 0, 35, 47),
(71, '2024-09-16', 'Dr-Sep 24/355', '4000/T14', '346500', '0', '346500', 'Paid to Tun Naing For Vr no 12148', '', '', 0, 40, 48),
(72, '2024-09-16', 'Dr-Sep 24/355', '3600/001', '0', '346500', '-228794125', 'Paid to Tun Naing For Vr no 12148', '', '', 0, 35, 49),
(73, '2024-09-16', 'Dr-Sep 24/356', '9100/002', '33000', '0', '66000', 'Taxi Charges For W/H to Market to W/H and Boy 1 pcs house go', '', '', 0, 39, 50),
(74, '2024-09-16', 'Dr-Sep 24/356', '3600/001', '0', '33000', '-228827125', 'Taxi Charges For W/H to Market to W/H and Boy 1 pcs house go', '', '', 0, 35, 51),
(75, '2024-09-16', 'Dr-Sep 24/357', '9100/012', '14000', '0', '15500', 'Meal allowance For Market Boys Am4pcs, Lunch4pcs', '', '', 0, 39, 52),
(76, '2024-09-16', 'Dr-Sep 24/357', '3600/001', '0', '14000', '-228841125', 'Meal allowance For Market Boys Am4pcs, Lunch4pcs', '', '', 0, 35, 53),
(77, '2024-09-16', 'Dr-Sep 24/358', '6100/001', '26500', '0', '142450', 'Labour Charges For Market Fish', '', '', 0, 37, 54),
(78, '2024-09-16', 'Dr-Sep 24/358', '3600/001', '0', '26500', '-228867625', 'Labour Charges For Market Fish', '', '', 0, 35, 55),
(79, '2024-09-16', 'Dr-Sep 24/359', '9100/025', '2000', '0', '2000', 'Car Packing For Market', '', '', 0, 39, 56),
(80, '2024-09-16', 'Dr-Sep 24/359', '3600/001', '0', '2000', '-228869625', 'Car Packing For Market', '', '', 0, 35, 57),
(81, '2024-09-16', 'Dr-Sep 24/360', '6100/002', '90000', '0', '90000', 'Ice 6pcs*15000ks For Market Fish', '', '', 0, 37, 58),
(82, '2024-09-16', 'Dr-Sep 24/360', '3600/001', '0', '90000', '-228959625', 'Ice 6pcs*15000ks For Market Fish', '', '', 0, 35, 59),
(83, '2024-09-18', 'Dr-Sep 24/376', '6100/002', '135000', '0', '225000', 'Ice 9 pcs*15000 Purchase For Market Fish', '', '', 0, 37, 90),
(84, '2024-09-18', 'Dr-Sep 24/376', '3600/001', '0', '135000', '-229094625', 'Ice 9 pcs*15000 Purchase For Market Fish', '', '', 0, 35, 91),
(85, '2024-09-18', 'Dr-Sep 24/377', '9100/006', '150000', '0', '150000', 'Car Diesel For 3K-1574(15.9/18.9/19.9)', '', '', 0, 39, 92),
(86, '2024-09-18', 'Dr-Sep 24/377', '3600/001', '0', '150000', '-229244625', 'Car Diesel For 3K-1574(15.9/18.9/19.9)', '', '', 0, 35, 93),
(87, '2024-09-18', 'Dr-Sep 24/378', '9100/002', '4000', '0', '70000', 'Taxi Charges For W/H to UAB to W/H', '', '', 0, 39, 94),
(88, '2024-09-18', 'Dr-Sep 24/378', '3600/001', '0', '4000', '-229248625', 'Taxi Charges For W/H to UAB to W/H', '', '', 0, 35, 95),
(89, '2024-09-18', 'Dr-Sep 24/379', '9100/002', '3000', '0', '73000', 'Sir Carry Charges For 19.9.24 AM', '', '', 0, 39, 96),
(90, '2024-09-18', 'Dr-Sep 24/379', '3600/001', '0', '3000', '-229251625', 'Sir Carry Charges For 19.9.24 AM', '', '', 0, 35, 97),
(91, '2024-09-18', 'Dr-Sep 24/380', '9100/002', '30000', '0', '103000', 'Taxi charges For W/H to Market to W/H', '', '', 0, 39, 98),
(92, '2024-09-18', 'Dr-Sep 24/380', '3600/001', '0', '30000', '-229281625', 'Taxi charges For W/H to Market to W/H', '', '', 0, 35, 99),
(93, '2024-09-18', 'Dr-Sep 24/381', '9100/012', '14000', '0', '29500', 'Meal Allowance For Am4pcs, Lunch4pcs', '', '', 0, 39, 100),
(94, '2024-09-18', 'Dr-Sep 24/381', '3600/001', '0', '14000', '-229295625', 'Meal Allowance For Am4pcs, Lunch4pcs', '', '', 0, 35, 101),
(95, '2024-09-18', 'Dr-Sep 24/382', '9100/005', '18000', '0', '38000', 'Cable Tie Purchase For Market Fish Pk', '', '', 0, 39, 102),
(96, '2024-09-18', 'Dr-Sep 24/382', '3600/001', '0', '18000', '-229313625', 'Cable Tie Purchase For Market Fish Pk', '', '', 0, 35, 103),
(97, '2024-09-18', 'Dr-Sep 24/383', '9100/025', '2000', '0', '4000', 'Car Packing For Market', '', '', 0, 39, 105),
(98, '2024-09-18', 'Dr-Sep 24/383', '3600/001', '0', '2000', '-229315625', 'Car Packing For Market', '', '', 0, 35, 106),
(99, '2024-09-18', 'Dr-Sep 24/384', '6100/002', '45000', '0', '270000', 'Ice 3 pcs*15000ks Purchase For Rohu', '', '', 0, 37, 107),
(100, '2024-09-18', 'Dr-Sep 24/384', '3600/001', '0', '45000', '-229360625', 'Ice 3 pcs*15000ks Purchase For Rohu', '', '', 0, 35, 108),
(101, '2024-09-18', 'Dr-Sep 24/385', '6100/001', '9000', '0', '151450', 'Labour Charges For Rohu', '', '', 0, 37, 109),
(102, '2024-09-18', 'Dr-Sep 24/385', '3600/001', '0', '9000', '-229369625', 'Labour Charges For Rohu', '', '', 0, 35, 110),
(103, '2024-09-18', 'Dr-Sep 24/386', '6100/001', '38000', '0', '189450', 'Labour Charges For Market', '', '', 0, 37, 111),
(104, '2024-09-18', 'Dr-Sep 24/386', '3600/001', '0', '38000', '-229407625', 'Labour Charges For Market', '', '', 0, 35, 112),
(105, '2024-09-18', 'Dr-Sep 24/387', '6100/002', '135000', '0', '405000', 'Ice 9 Pcs*15000ks Purchase For Market Fish', '', '', 0, 37, 115),
(106, '2024-09-18', 'Dr-Sep 24/387', '3600/001', '0', '135000', '-229542625', 'Ice 9 Pcs*15000ks Purchase For Market Fish', '', '', 0, 35, 116),
(107, '2024-09-17', 'Dr-Sep 24/361', '9100/006', '100000', '0', '250000', 'Car Diesel For 3k-1574 (15.9.24=50000,17.9.24=500000)30.54 Liters*3275ks', '', '', 0, 39, 60),
(108, '2024-09-17', 'Dr-Sep 24/361', '3600/001', '0', '100000', '-229642625', 'Car Diesel For 3k-1574 (15.9.24=50000,17.9.24=500000)30.54 Liters*3275ks', '', '', 0, 35, 61),
(109, '2024-09-17', 'Dr-Sep 24/362', '9100/002', '5500', '0', '108500', 'Taxi Charges For Mindama to Lai Lai house For Fish Goverment', '', '', 0, 39, 62),
(110, '2024-09-17', 'Dr-Sep 24/362', '3600/001', '0', '5500', '-229648125', 'Taxi Charges For Mindama to Lai Lai house For Fish Goverment', '', '', 0, 35, 63),
(111, '2024-09-17', 'Dr-Sep 24/363', '6100/001', '29000', '0', '218450', 'Labour Charges and Taxi For W/H Batashi 9viss*1000ks, Taxi 20000ks', '', '', 0, 37, 64),
(112, '2024-09-17', 'Dr-Sep 24/363', '3600/001', '0', '29000', '-229677125', 'Labour Charges and Taxi For W/H Batashi 9viss*1000ks, Taxi 20000ks', '', '', 0, 35, 65),
(113, '2024-09-17', 'Dr-Sep 24/364', '9100/002', '3000', '0', '111500', 'Taxi Charges For W/H to UAB For Lai Lai for A/C Check', '', '', 0, 39, 66),
(114, '2024-09-17', 'Dr-Sep 24/364', '3600/001', '0', '3000', '-229680125', 'Taxi Charges For W/H to UAB For Lai Lai for A/C Check', '', '', 0, 35, 67),
(115, '2024-09-17', 'Dr-Sep 24/365', '9100/005', '24000', '0', '62000', 'Cutter 5 pcs Purchase and Taxi For Batashi Clean (20000+4000)', '', '', 0, 39, 68),
(116, '2024-09-17', 'Dr-Sep 24/365', '3600/001', '0', '24000', '-229704125', 'Cutter 5 pcs Purchase and Taxi For Batashi Clean (20000+4000)', '', '', 0, 35, 69),
(117, '2024-09-17', 'Dr-Sep 24/366', '9100/002', '30000', '0', '141500', 'Taxi Charges For HHK to W/H For 16.9.24', '', '', 0, 39, 70),
(118, '2024-09-17', 'Dr-Sep 24/366', '3600/001', '0', '30000', '-229734125', 'Taxi Charges For HHK to W/H For 16.9.24', '', '', 0, 35, 71),
(119, '2024-09-17', 'Dr-Sep 24/367', '9100/012', '10000', '0', '39500', 'Workers 5pcs*2000ks Dinner For HHK OT', '', '', 0, 39, 72),
(120, '2024-09-17', 'Dr-Sep 24/367', '3600/001', '0', '10000', '-229744125', 'Workers 5pcs*2000ks Dinner For HHK OT', '', '', 0, 35, 73),
(121, '2024-09-17', 'Dr-Sep 24/368', '6100/002', '96000', '0', '501000', 'Ice 8pcs*10500ks Purchase and Carry For HHK', '', '', 0, 37, 74),
(122, '2024-09-17', 'Dr-Sep 24/368', '3600/001', '0', '96000', '-229840125', 'Ice 8pcs*10500ks Purchase and Carry For HHK', '', '', 0, 35, 75),
(123, '2024-09-17', 'Dr-Sep 24/369', '9100/002', '13000', '0', '154500', 'Taxi Charges For W/H to OP', '', '', 0, 39, 76),
(124, '2024-09-17', 'Dr-Sep 24/369', '3600/001', '0', '13000', '-229853125', 'Taxi Charges For W/H to OP', '', '', 0, 35, 77),
(125, '2024-09-17', 'Dr-Sep 24/370', '9100/002', '35000', '0', '189500', 'Taxi Charges For W/H to HHK Carton Box Carry Charges', '', '', 0, 39, 78),
(126, '2024-09-17', 'Dr-Sep 24/370', '3600/001', '0', '35000', '-229888125', 'Taxi Charges For W/H to HHK Carton Box Carry Charges', '', '', 0, 35, 79),
(127, '2024-09-17', 'Dr-Sep 24/371', '6100/001', '30000', '0', '248450', 'Labour Charges For OP Raw', '', '', 0, 37, 80),
(128, '2024-09-17', 'Dr-Sep 24/371', '3600/001', '0', '30000', '-229918125', 'Labour Charges For OP Raw', '', '', 0, 35, 81),
(129, '2024-09-17', 'Dr-Sep 24/372', '9100/002', '25000', '0', '214500', 'Taxi Charges For W/H to Market to W/H', '', '', 0, 39, 82),
(130, '2024-09-17', 'Dr-Sep 24/372', '3600/001', '0', '25000', '-229943125', 'Taxi Charges For W/H to Market to W/H', '', '', 0, 35, 83),
(131, '2024-09-17', 'Dr-Sep 24/373', '9100/012', '10500', '0', '50000', 'Meal allowance For Market Boys Am3pcs,Lunch 3pcs', '', '', 0, 39, 84),
(132, '2024-09-17', 'Dr-Sep 24/373', '3600/001', '0', '10500', '-229953625', 'Meal allowance For Market Boys Am3pcs,Lunch 3pcs', '', '', 0, 35, 85),
(133, '2024-09-17', 'Dr-Sep 24/374', '6100/001', '42500', '0', '290950', 'Labour charges For Market Fish', '', '', 0, 37, 86),
(134, '2024-09-17', 'Dr-Sep 24/374', '3600/001', '0', '42500', '-229996125', 'Labour charges For Market Fish', '', '', 0, 35, 87),
(135, '2024-09-17', 'Dr-Sep 24/375', '9100/025', '3000', '0', '7000', 'Car Packing For Market', '', '', 0, 39, 88),
(136, '2024-09-17', 'Dr-Sep 24/375', '3600/001', '0', '3000', '-229999125', 'Car Packing For Market', '', '', 0, 35, 89),
(137, '2024-09-12', 'Teacher sent to Prime Fashion 2,300,000/- Taka@122', '3300/006', '', '', '58093.88', 'Teacher sent to Prime Fashion 2,300,000/- Taka@122', '', '', 0, 0, 0),
(138, '2024-09-12', 'Teacher sent to Prince Fashion A/C 1700,000@ 122', '3300/007', '', '', '7914.21', 'Teacher sent to Prince Fashion A/C 1700,000@ 122', '', '', 0, 0, 0),
(139, '2024-03-22', '', '3300/005', '', '', '33410.00', '', '', '', 0, 0, 0),
(140, '2024-08-29', '', '3300/004', '', '', '42763.90', '', '', '', 0, 0, 0),
(141, '2024-09-13', '', '3300/002', '', '', '86222.43', '', '', '', 0, 0, 0),
(142, '2024-09-05', '', '3300/003', '', '', '8823.19', '', '', '', 0, 0, 0);

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
(25, '0000-00-00', '4000/T14', '390217878', 0, '2024-09-16', 'Dr-Sep 24/355', 'Paid to Tun Naing For Vr no 12148', 346500, 0, 0, 0, '0000-00-00');

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

--
-- Dumping data for table `receivable`
--

INSERT INTO `receivable` (`id`, `date`, `ac_code`, `sr_no`, `container_no`, `invoice_amount`, `paid_date`, `payment_no`, `particulars`, `paid_amount`, `balance`, `transactionid`) VALUES
(1, '2024-09-12', '3300/006', '', '', '', '0000-00-00', '', '', '', '58093.88', 0),
(2, '2024-09-12', '3300/007', '', '', '', '0000-00-00', '', '', '', '7914.21', 0),
(3, '2024-03-22', '3300/005', '', '', '', '0000-00-00', '', '', '', '33410.00', 0),
(4, '2024-08-29', '3300/004', '', '', '', '0000-00-00', '', '', '', '42763.90', 0),
(5, '2024-09-13', '3300/002', '', '', '', '0000-00-00', '', '', '', '86222.43', 0),
(6, '2024-09-05', '3300/003', '', '', '', '0000-00-00', '', '', '', '8823.19', 0);

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
(156, '4000/099', 'Tommy', '09977221152', 'Yangon'),
(157, '4000/P03', 'Carton Box (Pan Thazin)', '', ''),
(158, '4000/D04', 'Dalian Ice', '', ''),
(159, '4000/G03', 'Plastic (Golden Fish)', '', '');

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
(26, '2024-09-16', 'Dr-Sep 24/344', '9100/037', 'Car Charges For Tender Go To Nay Pyi Taw 12.9.24 to 14.9.24 LM Factory', '1120000', '0', 'mmk', '', '', 0, 'accepted'),
(27, '2024-09-16', 'Dr-Sep 24/344', '3600/001', 'Car Charges For Tender Go To Nay Pyi Taw 12.9.24 to 14.9.24 LM Factory', '0', '1120000', 'mmk', '', '', 0, 'accepted'),
(28, '2024-09-16', 'Dr-Sep 24/345', '9100/009', 'K-pay Charges For Car Charges Transfer NPT LM Factory', '2000', '0', 'mmk', '', '', 0, 'accepted'),
(29, '2024-09-16', 'Dr-Sep 24/345', '3600/001', 'K-pay Charges For Car Charges Transfer NPT LM Factory', '0', '2000', 'mmk', '', '', 0, 'accepted'),
(30, '2024-09-16', 'Dr-Sep 24/346', '9100/037', 'Hotal Charges For Factory Contract go D.Nan+2pcs LM Factory', '326000', '0', 'mmk', '', '', 0, 'accepted'),
(31, '2024-09-16', 'Dr-Sep 24/346', '3600/001', 'Hotal Charges For Factory Contract go D.Nan+2pcs LM Factory', '0', '326000', 'mmk', '', '', 0, 'accepted'),
(32, '2024-09-16', 'Dr-Sep 24/347', '9100/037', 'Bank Guarantee 1 Month for LM Factory', '15966000', '0', 'mmk', '', '', 0, 'accepted'),
(33, '2024-09-16', 'Dr-Sep 24/347', '3600/001', 'Bank Guarantee 1 Month for LM Factory', '0', '15966000', 'mmk', '', '', 0, 'accepted'),
(34, '2024-09-16', 'Dr-Sep 24/348', '9100/037', 'Rental Contract 1year for for LM Factory Sep\'24 to Sep\'25 (15700000*12month)', '188400000', '0', 'mmk', '', '', 0, 'accepted'),
(35, '2024-09-16', 'Dr-Sep 24/348', '3600/001', 'Rental Contract 1year for for LM Factory Sep\'24 to Sep\'25 (15700000*12month)', '0', '188400000', 'mmk', '', '', 0, 'accepted'),
(36, '2024-09-16', 'Dr-Sep 24/349', '9100/037', 'Paid to Goverment NPT People For Tender MD-100 Lakh,D.Nan 50 Lakh,Ko Phyoe 10 Lakh', '17362000', '0', 'mmk', '', '', 0, 'accepted'),
(37, '2024-09-16', 'Dr-Sep 24/349', '3600/001', 'Paid to Goverment NPT People For Tender MD-100 Lakh,D.Nan 50 Lakh,Ko Phyoe 10 Lakh', '0', '17362000', 'mmk', '', '', 0, 'accepted'),
(38, '2024-09-16', 'Dr-Sep 24/350', '9100/037', 'Paid To Government People (YGN) For Tender U Aung Kyaw 3 Lakh, Daw Ohn Mar 10 Lakh, D', '2300000', '0', 'mmk', '', '', 0, 'accepted'),
(39, '2024-09-16', 'Dr-Sep 24/350', '3600/001', 'Paid To Government People (YGN) For Tender U Aung Kyaw 3 Lakh, Daw Ohn Mar 10 Lakh, D', '0', '2300000', 'mmk', '', '', 0, 'accepted'),
(40, '2024-09-16', 'Dr-Sep 24/351', '9100/037', 'Stamp Duty fees For Factory Contract (188400000\r\n*0.5%)+(BG 15700000*2%) LM Factory', '1256000', '0', 'mmk', '', '', 0, 'accepted'),
(41, '2024-09-16', 'Dr-Sep 24/351', '3600/001', 'Stamp Duty fees For Factory Contract (188400000\r\n*0.5%)+(BG 15700000*2%) LM Factory', '0', '1256000', 'mmk', '', '', 0, 'accepted'),
(42, '2024-09-16', 'Dr-Sep 24/352', '9100/037', 'Under Taking For Tax Darpartment for Stamp Duty LM Factory', '10000', '0', 'mmk', '', '', 0, 'accepted'),
(43, '2024-09-16', 'Dr-Sep 24/352', '3600/001', 'Under Taking For Tax Darpartment for Stamp Duty LM Factory', '0', '10000', 'mmk', '', '', 0, 'accepted'),
(44, '2024-09-16', 'Dr-Sep 24/353', '9100/037', 'Copy For Tender Tax Document all LM Factory', '7300', '0', 'mmk', '', '', 0, 'accepted'),
(45, '2024-09-16', 'Dr-Sep 24/353', '3600/001', 'Copy For Tender Tax Document all LM Factory', '0', '7300', 'mmk', '', '', 0, 'accepted'),
(46, '2024-09-16', 'Dr-Sep 24/354', '9100/037', 'Meal Allowance For Tender go 12.9.24 to 14.9.24 Daw Nan+2pcs LM Factory', '288375', '0', 'mmk', '', '', 0, 'accepted'),
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
(116, '2024-09-18', 'Dr-Sep 24/387', '3600/001', 'Ice 9 Pcs*15000ks Purchase For Market Fish', '0', '135000', 'mmk', '', '', 0, 'accepted');

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
(527, '10:04:23.000000', '2024-09-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(528, '02:32:10.000000', '2024-09-25', 'Administrator', 'protechadmin2024***', 'Login Success'),
(529, '01:37:18.000000', '2024-09-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(530, '11:01:54.000000', '2024-09-29', 'Administrator', 'protechadmin2024***', 'Login Success');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=404;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=531;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
