-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2024 at 07:10 AM
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
(332, '4000/B02', 40, 'BLC(PYM)'),
(333, '9100/016', 39, 'Printing and Stationery Expense A/C'),
(334, '9100/017', 39, 'Management Expense A/C'),
(335, '9100/018', 39, 'Electricity Expense'),
(336, '4000/K08', 40, 'Ko Ma Noe'),
(337, '4000/D01', 40, 'Dry Fish (Shwe Hinn Thar)'),
(338, '4000/D02', 40, 'Dry Fish (Myo Thant)'),
(340, '9100/019', 39, 'Computer Accessories Expense'),
(341, '3600/003', 35, 'USD Transfer'),
(342, '9100/020', 39, 'Agent Fees Expense'),
(343, '9100/021', 39, 'DOF Charges Expense'),
(344, '9100/022', 39, 'Ocean Pacific Expense'),
(345, '9100/023', 39, 'Household Expense'),
(346, '9100/024', 39, 'Penity Fees'),
(347, '9100/025', 39, 'Car Parking '),
(348, '4000/k09', 40, 'Kyaw Thein Than'),
(349, '4000/G02', 40, 'GM'),
(350, '4000/T12', 40, 'Than Soe');

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
(21, '1002', '3up', '25', 10, '250', '5', '125', 66, 21),
(22, '1023', '5up', '20', 15, '300', '4', '80', 67, 22);

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
  `transactionid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cashbook`
--

INSERT INTO `cashbook` (`id`, `date`, `sr_no`, `ac_name`, `particular`, `debit`, `credit`, `balance`, `voucher_no`, `crossac_name`, `transactionid`) VALUES
(479, '2024-01-31', '', '3600/001', 'Opining Balance of Jan\'24', '0', '0', '213847883', NULL, NULL, 0),
(1442, '2024-02-01', '', '3600/001', 'Water 6 pk purchase for WH', '0', '5400', '213842483', 'Dr-Feb 24/001', '9100/003', 55),
(1443, '2024-02-01', '', '3600/001', 'Sir Phone Bill and Monthly/ Phone 6 pcs Bill/ Sir-6000 (Sir,Daw Nan,Lai-15000) (Office,Sandar,Mar)', '0', '39000', '213803483', 'Dr-Feb 24/002', '9100/004', 59),
(1444, '2024-02-01', '', '3600/001', 'Medicine and Taxi for sir', '0', '14000', '213789483', 'Dr Feb\'24/003', '9100/005', 61),
(1445, '2024-02-01', '', '3600/001', 'Car Diesel for 5L-2848 (30.1.24-10000)(30.1.24-70000)', '0', '80000', '213709483', 'Dr Feb\'24/004', '9100/006', 63),
(1446, '2024-02-01', '', '3600/001', 'Car Diesel for 6J-3015 (31.1.24-50000)', '0', '50000', '213659483', 'Dr Feb\'24/005', '9100/006', 65),
(1447, '2024-02-01', '', '3600/001', 'Material and Taxi Charges for PK Machine', '0', '50000', '213609483', 'Dr Feb\'24/006', '9100/007', 67),
(1448, '2024-02-01', '', '3600/001', 'Bejon Loan take from LM 2020ED Balance $25176*3572ks(Best Brand)', '0', '89928700', '123680783', 'Dr Feb\'24/007', '3300/001', 69),
(1449, '2024-02-01', '', '3600/001', 'DHL charges for Italy Document sent', '0', '377000', '123303783', 'Dr Feb\'24/008', '9100/008', 71),
(1450, '2024-02-01', '', '3600/001', 'Paid to Ka Yin Lay for Vr No-11337', '0', '100000', '123203783', 'Dr Feb\'24/009', '4000/K06', 77),
(1451, '2024-02-01', '', '3600/001', 'Wave Money charges for Ka Yin Lay Money sent', '0', '1500', '123202283', 'Dr Feb\'24/010', '9100/009', 79),
(1452, '2024-02-01', '', '3600/001', 'All people Salary Payment for Jan/24', '0', '17754000', '105448283', 'Dr Feb\'24/011', '9100/001', 81),
(1453, '2024-02-01', '', '3600/001', 'All people Annual Bonus Paid for Jan/24', '0', '17351000', '88097283', 'Dr Feb\'24/011', '9100/010', 83),
(1454, '2024-02-01', '', '3600/001', 'Donation for Bangladesh Embassy', '0', '3000000', '85097283', 'Dr Feb\'24/012', '9100/011', 85),
(1455, '2024-02-01', '', '3600/001', 'USA Money Received from UAB ($74925) 50%34762.5-10=$37452.5*2100ks $37462.5', '78650250', '0', '163747533', 'Cr-Feb 24/001', '3300/002', 188),
(1456, '2024-02-01', '', '3600/001', 'USA Money Received from UAB ($74925) 50%34762.5-10=$37452.5*2100ks $37462.5', '130369500', '0', '294117033', 'Cr-Feb 24/001', '3300/002', 190),
(1457, '2024-02-02', '', '3600/001', 'Taxi charges for Ocean Pacfic to WH', '0', '15000', '294102033', 'Dr Feb\'24/013', '9100/002', 87),
(1458, '2024-02-02', '', '3600/001', 'Carton Box purchase for Ocean Pacfic pk', '0', '52500', '294049533', 'Dr Feb\'24/014', '6100/003', 89),
(1459, '2024-02-02', '', '3600/001', 'Labour Charges and Taxi Charges for (Rohu)', '0', '289000', '293760533', 'Dr Feb\'24/015', '6100/001', 91),
(1460, '2024-02-02', '', '3600/001', 'Ice 10 pcs purchase for HHK (D-Puti,Rohu,Ayer)', '0', '90000', '293670533', 'Dr Feb\'24/016', '6100/002', 93),
(1461, '2024-02-02', '', '3600/001', 'JCV Rope purchase for HHK pk pcs*85000', '0', '170000', '293500533', 'Dr Feb\'24/017', '6100/003', 95),
(1462, '2024-02-02', '', '3600/001', 'Taxi Charges for HHK to WH and WH to GFC', '0', '43000', '293457533', 'Dr Feb\'24/018', '9100/002', 97),
(1463, '2024-02-02', '', '3600/001', 'WH to HHK Fish carry car charges', '0', '130000', '293327533', 'Dr Feb\'24/019', '6100/004', 99),
(1464, '2024-02-02', '', '3600/001', 'Workers 31 pcs Dinner for (OT) (Rohu)', '0', '62000', '293265533', 'Dr Feb\'24/020', '9100/012', 101),
(1465, '2024-02-02', '', '3600/001', 'Material purchase and service charges for WH (Boy Tiolet)', '0', '85000', '293180533', 'Dr Feb\'24/021', '9100/007', 103),
(1466, '2024-02-02', '', '3600/001', 'Fruit purchase for Sir', '0', '7000', '293173533', 'Dr Feb\'24/022', '9100/012', 105),
(1467, '2024-02-02', '', '3600/001', 'Penam and other purchase for WH', '0', '814500', '292359033', 'Dr Feb\'24/023', '6100/003', 107),
(1468, '2024-02-02', '', '3600/001', 'Ice 4 pcs and car pk for D-Puti', '0', '42000', '292317033', 'Dr Feb\'24/024', '6100/002', 109),
(1469, '2024-02-02', '', '3600/001', 'Paid to Mg Mg Soe for Vr No-11152,11185', '0', '4000000', '288317033', 'Dr Feb\'24/025', '4000/M06', 111),
(1470, '2024-02-02', '', '3600/001', 'Paid to Mg Mg Nyunt for Vr-11183,11192', '0', '5000000', '283317033', 'Dr-Feb\'24/026', '4000/M03', 116),
(1471, '2024-02-02', '', '3600/001', 'Paid to BLC (PYM) for Vr No-11221', '0', '3400000', '279917033', 'Dr-Feb 24/027', '4000/P02', 118),
(1472, '2024-02-02', '', '3600/001', 'Paid to Than Than Myint for Vr No-107788 (10810-2696450)', '0', '5000000', '274917033', 'Dr-Feb 24/028', '4000/T08', 120),
(1473, '2024-02-02', '', '3600/001', 'Paid to  Ye Yint for Vr No-11115,11133', '0', '5000000', '269917033', 'Dr-Feb 24/029', '4000/Y01', 123),
(1474, '2024-02-02', '', '3600/001', 'Paid to Htet Aung Lin for Vr No-10877', '0', '444200', '269472833', 'Dr-Feb 24/030', '4000/H01', 128),
(1475, '2024-02-02', '', '3600/001', 'Paid to Phone Naing for Vr No-11249,11268', '0', '3500000', '265972833', 'Dr-Feb 24/031', '4000/P01', 135),
(1476, '2024-02-02', '', '3600/001', 'Paid to Thein Htay for Vr No-11269', '0', '4000000', '261972833', 'Dr-Feb 24/032', '4000/T02', 138),
(1477, '2024-02-02', '', '3600/001', 'Taxi Charges For Office 5 pcs Payment Day (6:30) PM', '0', '39500', '261933333', 'Dr Feb\'24/033', '9100/002', 150),
(1478, '2024-02-02', '', '3600/001', 'Meal Allowance for Office 5pcs Payment Day', '0', '10000', '261923333', 'Dr-Feb 24/034', '9100/012', 152),
(1479, '2024-02-02', '', '3600/001', 'Water Bill and services for WH (Dec/23) (78000+2000)', '0', '80000', '261843333', 'Dr-Feb 24/035', '9100/013', 154),
(1480, '2024-02-02', '', '3600/001', 'Paid to Sticker 5 colour for penam-sticker+other', '0', '1697000', '260146333', 'Dr-Feb 24/036', '6100/006', 156),
(1481, '2024-02-02', '', '3600/001', 'Taxi Charges for WH to Daw Nan house go for (Htet Paing Aye)', '0', '6000', '260140333', 'Dr-Feb 24/037', '9100/002', 158),
(1482, '2024-02-03', '', '3600/001', 'Paid to MA for Vr No-10586', '0', '4000000', '256140333', 'Dr-Feb 24/038', '4000/M01', 193),
(1483, '2024-02-03', '', '3600/001', 'Paid to Soe Naing for Vr No-10534,10542', '0', '4000000', '252140333', 'Dr-Feb 24/039', '4000/S08', 195),
(1484, '2024-02-03', '', '3600/001', 'paid to Khin Mg Myint for Vr No-11189', '0', '7000000', '245140333', 'Dr-Feb 24/040', '4000/K07', 197),
(1485, '2024-02-03', '', '3600/001', 'Car Diesel for 6J-3015(1.2)-50000/ (3.2)-50000', '0', '100000', '245040333', 'Dr-Feb 24/041', '9100/006', 199),
(1486, '2024-02-03', '', '3600/001', 'Engin Oil purchase for 6J-3015', '0', '10000', '245030333', 'Dr-Feb 24/042', '9100/014', 201),
(1487, '2024-02-03', '', '3600/001', 'Car police catch for 6J-3015(2.2)(3.2)', '0', '8000', '245022333', 'Dr-Feb 24/043', '9100/014', 203),
(1488, '2024-02-03', '', '3600/001', 'Paid to plastic (G/F)for Vr No-(31.1.24)(30.1.24)(30.1.24)', '0', '2112000', '242910333', 'Dr-Feb 24/044', '6100/003', 205),
(1489, '2024-02-03', '', '3600/001', 'Paid to Carton Box (MMMO)for (31.1.24)Vr 3 pcs', '0', '2193960', '240716373', 'Dr-Feb 24/045', '6100/003', 207),
(1490, '2024-02-03', '', '3600/001', 'Paid to HHK Cold Store', '0', '10000000', '230716373', 'Dr-Feb 24/046', '6100/007', 209),
(1491, '2024-02-03', '', '3600/001', 'Paid to Carton Box (Swan Pyae) for Vr No-(19.12.23 to 22.12.23)(26.12.23)(27.12.23)(27.12.23)', '0', '5730540', '224985833', 'Dr-Feb 24/047', '6100/003', 211),
(1492, '2024-02-03', '', '3600/001', 'Plastic Packing Strap 3000 M W 5*87000ks', '0', '435000', '224550833', 'Dr-Feb 24/048', '6100/003', 213),
(1493, '2024-02-03', '', '3600/001', 'Paid to Carton Box (Shwe Myay) for (2.12)(12.12)(14.12)', '0', '2000000', '222550833', 'Dr-Feb 24/049', '6100/003', 215),
(1494, '2024-02-03', '', '3600/001', 'Water 2 pk purchase for WH', '0', '1800', '222549033', 'Dr-Feb 24/050', '9100/003', 217),
(1495, '2024-02-03', '', '3600/001', 'lce 3 pcs purchase for HHk(Puti)', '0', '27000', '222522033', 'Dr-Feb 24/051', '6100/002', 219),
(1496, '2024-02-03', '', '3600/001', 'Labour Charges and Taxi Charges for (D-Puti) (109200+15000)', '0', '124200', '222397833', 'Dr-Feb 24/052', '6100/001', 221),
(1497, '2024-02-03', '', '3600/001', 'Taxi charges for HHK to WH pk', '0', '17000', '222380833', 'Dr-Feb 24/053', '9100/002', 223),
(1498, '2024-02-03', '', '3600/001', 'labour and Taxi Charges for (D-Puit)', '0', '106800', '222274033', 'Dr-Feb 24/054', '6100/001', 225),
(1499, '2024-02-03', '', '3600/001', 'lce 4 pcs purchase for (D-Puit)', '0', '36000', '222238033', 'Dr-Feb 24/055', '6100/002', 227),
(1500, '2024-02-03', '', '3600/001', 'Taxi Charges for HHK to WH', '0', '17000', '222221033', 'Dr-Feb 24/056', '9100/002', 229),
(1501, '2024-02-03', '', '3600/001', 'Ice 3pcs purchase for ( Ocean - Rohn )', '0', '30000', '222191033', 'Dr-Feb 24/057', '6100/002', 231),
(1502, '2024-02-03', '', '3600/001', 'Labour Charges for (Rohn)', '0', '10000', '222181033', 'Dr-Feb 24/058', '6100/001', 233),
(1503, '2024-02-03', '', '3600/001', 'Sir present purchase for ( Cambodia go ) wallet and bags (Yangoods)\r\n\r\n', '0', '519600', '221661433', 'Dr-Feb 24/059', '9100/015', 235),
(1504, '2024-02-03', '', '3600/001', 'Meal Allowance for Sir +2 pcs', '0', '95850', '221565583', 'Dr-Feb 24/060', '9100/012', 237),
(1505, '2024-02-05', '', '3600/001', 'Water 2 pk purchase for WH', '0', '1800', '221563783', 'Dr-Feb 24/061', '9100/003', 239),
(1506, '2024-02-05', '', '3600/001', 'Car Diesel for 6J-3015 (4.2)-50000/ (5.2)-50000', '0', '100000', '221463783', 'Dr-Feb 24/062', '9100/006', 241),
(1507, '2024-02-05', '', '3600/001', 'Car police catch for 6J-3015 (Market)', '0', '5000', '221458783', 'Dr-Feb 24/063', '9100/014', 243),
(1508, '2024-02-05', '', '3600/001', 'Taxi Charges for HHK to WH (pk)', '0', '17000', '221441783', 'Dr-Feb 24/064', '9100/002', 245),
(1509, '2024-02-05', '', '3600/001', 'Material purchase for WH', '0', '31500', '221410283', 'Dr-Feb 24/065', '9100/007', 247),
(1510, '2024-02-05', '', '3600/001', 'Photo paper and A4 purchase for WH', '0', '107500', '221302783', 'Dr-Feb 24/066', '9100/016', 249),
(1511, '2024-02-05', '', '3600/001', 'Battery 2 pcs charging charges and carry charges for (office)', '0', '15000', '221287783', 'Dr-Feb 24/067', '9100/007', 251),
(1512, '2024-02-05', '', '3600/001', 'Taxi charges for Ocean Pacific go workers', '0', '24000', '221263783', 'Dr-Feb 24/068', '9100/002', 253),
(1513, '2024-02-05', '', '3600/001', 'Paid to Moe Kyaw for Vr No-11332, 11339, Cheque No-052402', '0', '12503950', '208759833', 'Dr-Feb 24/069', '4000/M07', 255),
(1514, '2024-02-06', '', '3600/001', 'Canda Money $40862.68 from UAB 50% $20431.34-10=20421.34*2100ks $20431.34*3370ks $20431.34*105ks', '42884814', '0', '251644647', 'Cr-Feb 24/003', '3300/003', 256),
(1515, '2024-02-06', '', '3600/001', 'Canda Money $40862.68 from UAB 50% $20431.34-10=20421.34*2100ks $20431.34*3370ks $20431.34*105ks', '70998906.5', '0', '322643553.5', 'Cr-Feb 24/003', '3300/003', 258),
(1516, '2024-02-06', '', '3600/001', '$23462.5 in UAB Bank', '49250250', '0', '371893803.5', 'Cr-Feb 24/004', '3300/004', 260),
(1517, '2024-02-06', '', '3600/001', 'A4 paper, Pen, Debit voucher Charging Rope and Taxi for (office)', '0', '117800', '371776003.5', 'Dr Feb 24/070', '9100/016', 267),
(1518, '2024-02-06', '', '3600/001', 'Donation for Industry Zone', '0', '137000', '371639003.5', 'Dr Feb 24/071', '9100/011', 269),
(1519, '2024-02-06', '', '3600/001', 'Labour charges and Taxi for D-Puti', '0', '93000', '371546003.5', 'Dr Feb 24/072', '6100/001', 271),
(1520, '2024-02-06', '', '3600/001', 'Ice 3 pcs purchase for D-Puti', '0', '27000', '371519003.5', 'Dr Feb 24/073', '6100/002', 273),
(1521, '2024-02-06', '', '3600/001', 'Taxi Charges For WH to GFC and GFC to WH', '0', '24000', '371495003.5', 'Dr Feb 24/074', '9100/002', 275),
(1522, '2024-02-06', '', '3600/001', 'Car Pk and OT for 6J-3015 (Market)', '0', '7000', '371488003.5', 'Dr Feb 24/075', '9100/025', 277),
(1523, '2024-02-06', '', '3600/001', 'Taxi Charges For WH to GFC and GFC To SPD', '0', '10000', '371478003.5', 'Dr Feb 24/076', '9100/002', 279),
(1524, '2024-02-06', '', '3600/001', 'Ice 1 pcs purchase for (Rohu)', '0', '6000', '371472003.5', 'Dr Feb 24/077', '6100/002', 281),
(1525, '2024-02-06', '', '3600/001', 'YTP Bill for House (Jan/24)', '0', '60375', '371411628.5', 'Dr Feb 24/078', '9100/004', 283),
(1526, '2024-02-06', '', '3600/001', 'Hi-Internet Bill for office and WH office (Feb/24)', '0', '79800', '371331828.5', 'Dr Feb 24/079', '9100/004', 285),
(1527, '2024-02-06', '', '3600/001', 'Car Diesel for 6J-3015', '0', '50000', '371281828.5', 'Dr Feb 24/080', '9100/006', 287),
(1528, '2024-02-06', '', '3600/001', 'Battery purchase for WH Digital', '0', '20000', '371261828.5', 'Dr Feb 24/081', '9100/005', 289),
(1529, '2024-02-06', '', '3600/001', 'LAbour Charges and Taxi for D-Puti', '0', '138000', '371123828.5', 'Dr Feb 24/082', '6100/001', 291),
(1530, '2024-02-06', '', '3600/001', 'Ice 1 pcs purchase for D-Puti', '0', '9000', '371114828.5', 'Dr Feb 24/083', '6100/002', 293),
(1531, '2024-02-06', '', '3600/001', 'Taxi Charges For HHK to WH', '0', '17000', '371097828.5', 'Dr Feb 24/084', '9100/002', 295),
(1532, '2024-02-06', '', '3600/001', 'HHK to GFC MC carry for 2 Trucks', '0', '160000', '370937828.5', 'Dr Feb 24/085', '6100/005', 297),
(1533, '2024-02-06', '', '3600/001', 'ဧည့်စာရင်း(Boys)', '0', '10000', '370927828.5', 'Dr Feb 24/086', '9100/005', 299),
(1534, '2024-02-06', '', '3600/001', 'Paid to Ocean Pacific Cold Store', '0', '4000000', '366927828.5', 'Dr Feb 24/087', '6100/007', 301),
(1535, '2024-02-06', '', '3600/001', 'Paid to GFC Cold Store Charges', '0', '6754402', '360173426.5', 'Dr Feb 24/088', '6100/007', 303),
(1536, '2024-02-06', '', '3600/001', 'Taxi Charges for WH to GFC Money sent', '0', '24000', '360149426.5', 'Dr Feb 24/089', '9100/002', 305),
(1537, '2024-02-06', '', '3600/001', 'Paid to Thin Thin Yee for Vr No-11163,11176 Cheque No-039001', '0', '60000000', '300149426.5', 'Dr Feb 24/090', '4000/T03', 307),
(1538, '2024-02-06', '', '3600/001', 'Paid to Soe Thein (TCL) for Vr No-00113,00123 Cheque No-039003', '0', '30000000', '270149426.5', 'Dr Feb 24/091', '4000/S07', 309),
(1539, '2024-02-06', '', '3600/001', 'Paid to 4 Zaw for Vr No-11030,11042,11054 Cheque No-039004', '0', '5000000', '265149426.5', 'Dr Feb 24/092', '4000/001', 311),
(1540, '2024-02-06', '', '3600/001', 'Paid to AK for Vr No-11009,11023 Cheque No-039005', '0', '4000000', '261149426.5', 'Dr Feb 24/093', '4000/A01', 313),
(1541, '2024-02-06', '', '3600/001', 'Paid to Arr Kae for Vr No-11170,11199 Cheque No-039006', '0', '3000000', '258149426.5', 'Dr Feb 24/094', '4000/A02', 315),
(1542, '2024-02-06', '', '3600/001', 'Paid to Aung Naing Oo for Vr No-10891,10930,10980,11021 Cheque No-039007', '0', '7000000', '251149426.5', 'Dr Feb 24/095', '4000/A03', 317),
(1543, '2024-02-06', '', '3600/001', 'Paid to Myo Min for Vr No-10891,10930,10980,11021 Cheque No-039007', '0', '5000000', '246149426.5', 'Dr Feb 24/096', '4000/A05', 319),
(1544, '2024-02-06', '', '3600/001', 'Paid to Aung Zaw Oo for Vr No-11172 Cheque No-039009', '0', '3000000', '243149426.5', 'Dr Feb 24/097', '4000/A06', 321),
(1545, '2024-02-06', '', '3600/001', 'Paid to A Thay Lay for Vr No-11222,11237 Cheque No-0390010', '0', '4000000', '239149426.5', 'Dr Feb 24/098', '4000/A07', 323),
(1546, '2024-02-06', '', '3600/001', 'Paid to Bar Bu Lay for Vr No-11263 Cheque No-0390011', '0', '3000000', '236149426.5', 'Dr Feb 24/099', '4000/B01', 325),
(1547, '2024-02-06', '', '3600/001', 'Paid to Cho Mg for Vr No-11155,11161 Cheque No-0390012', '0', '5000000', '231149426.5', 'Dr Feb 24/100', '4000/C02', 327),
(1548, '2024-02-06', '', '3600/001', 'Paid to Htay Win for Vr No-  Cheque No-0390013', '0', '3000000', '228149426.5', 'Dr Feb 24/101', '4000/H02', 329),
(1549, '2024-02-06', '', '3600/001', 'Paid to Kyaw Zay Ya for Vr No-11097 Cheque No-0390014', '0', '7000000', '221149426.5', 'Dr Feb 24/102', '4000/K05', 331),
(1550, '2024-02-06', '', '3600/001', 'Paid to KTO for Vr No-10608,11322 Cheque No-0390015', '0', '4000000', '217149426.5', 'Dr Feb 24/103', '4000/K03', 333),
(1551, '2024-02-06', '', '3600/001', 'Paid to Kaung Myat for Vr No-11341 Cheque No-0390016', '0', '4000000', '213149426.5', 'Dr Feb 24/104', '4000/K04', 335),
(1552, '2024-02-06', '', '3600/001', 'Paid to Moe Kyaw for Vr No-11332 Cheque No-0390017', '0', '4000000', '209149426.5', 'Dr Feb 24/105', '4000/M07', 337),
(1553, '2024-02-06', '', '3600/001', 'Paid to Shwe Late for Vr No-10871,10842,10892,10902 Cheque No-0390018', '0', '5000000', '204149426.5', 'Dr Feb 24/106', '4000/S01', 339),
(1554, '2024-02-06', '', '3600/001', 'Paid to Soe Min for Vr No-10929,10997,11020 Cheque No-0390019', '0', '20000000', '184149426.5', 'Dr Feb 24/107', '4000/S03', 341),
(1555, '2024-02-06', '', '3600/001', 'Paid to Si Thu for Vr No-10845, 10857, 10858 Cheque No-0390020', '0', '5000000', '179149426.5', 'Dr Feb 24/108', '4000/S04', 343),
(1556, '2024-02-06', '', '3600/001', 'Paid to Thet Oo for Vr No-11120,11132 Cheque No-039021', '0', '30000000', '149149426.5', 'Dr Feb 24/109', '4000/T05', 345),
(1557, '2024-02-06', '', '3600/001', 'Paid to Thet Paing for Vr No-11327 Cheque No-039022', '0', '4000000', '145149426.5', 'Dr Feb 24/110', '4000/T01', 347),
(1558, '2024-02-06', '', '3600/001', 'Paid to Tun Zaw Min for Vr No-11074 Cheque No-039023', '0', '30000000', '115149426.5', 'Dr Feb 24/111', '4000/T11', 349),
(1559, '2024-02-06', '', '3600/001', 'Paid to Win Bo for Vr No-11283 Cheque No-039024', '0', '3352700', '111796726.5', 'Dr Feb 24/112', '4000/W01', 351),
(1560, '2024-02-06', '', '3600/001', 'Paid to Zaw Latt for Vr No-10966,11008 Cheque No-039025', '0', '4000000', '107796726.5', 'Dr Feb 24/113', '4000/Z01', 353),
(1561, '2024-02-06', '', '3600/001', 'Paid to Aung Kyaw Moe for Vr No-10944 Cheque No-052401', '0', '5472850', '102323876.5', 'Dr Feb 24/114', '4000/A04', 355),
(1562, '2024-02-06', '', '3600/001', 'Taxi Charges for WH to Market', '0', '18000', '102305876.5', 'Dr Feb 24/115', '9100/002', 357),
(1563, '2024-02-06', '', '3600/001', 'Car Pk and OT Charges for (Market)', '0', '8000', '102297876.5', 'Dr Feb 24/116', '9100/025', 359),
(1564, '2024-02-06', '', '3600/001', 'Labour Charges for Market', '0', '13000', '102284876.5', 'Dr Feb 24/117', '6100/001', 361),
(1565, '2024-02-06', '', '3600/001', 'Ice 5 pcs purchase for Market Fish', '0', '55000', '102229876.5', 'Dr Feb 24/118', '6100/002', 363),
(1566, '2024-02-06', '', '3600/002', '$23462.5 in UAB Bank', '23462.5', '0', '23462.5', 'Cr-Feb 24/004', '3300/004', 446),
(1567, '2024-02-06', '', '3600/001', 'USA Money from UAB ($74925=50 50-$32761.64,65 35-$42163.36) $32761.64=>$16380.82-10=$16370.82*2100ks $16380.82*3370ks $16380.82*105ks and $42163.36=> $14757.18*2100ks, $27406.18 in UAB USD Bank', '65368800', '0', '167598676.5', 'Cr-Feb 24/005', '3300/002', 454),
(1568, '2024-02-06', '', '3600/001', 'USA Money from UAB ($74925=50 50-$32761.64,65 35-$42163.36) $32761.64=>$16380.82-10=$16370.82*2100ks $16380.82*3370ks $16380.82*105ks and $42163.36=> $14757.18*2100ks, $27406.18 in UAB USD Bank', '56923349.5', '0', '224522026', 'Cr-Feb 24/005', '3300/002', 456),
(1569, '2024-02-07', '', '3600/001', 'WH to GFC Carton Box carry', '0', '40000', '224482026', 'Dr Feb 24/119', '6100/005', 365),
(1570, '2024-02-07', '', '3600/001', 'Paid to Plastic (G/F) for Vr  No-(6.2.24)(6.2.24)', '0', '1438250', '223043776', 'Dr Feb 24/120', '6100/003', 367),
(1571, '2024-02-07', '', '3600/001', 'Water 4 pk purchase for WH', '0', '3600', '223040176', 'Dr Feb 24/121', '9100/003', 369),
(1572, '2024-02-07', '', '3600/001', 'Photo paper purchase and Taxi Charges for WH', '0', '69000', '222971176', 'Dr Feb 24/122', '9100/016', 371),
(1573, '2024-02-07', '', '3600/001', 'Car Diesel for 6J-3015', '0', '50000', '222921176', 'Dr Feb 24/123', '9100/006', 373),
(1574, '2024-02-07', '', '3600/001', 'Car police catch for 6J-3015', '0', '5000', '222916176', 'Dr Feb 24/124', '9100/014', 375),
(1575, '2024-02-07', '', '3600/001', 'Sir take from Daw Nan (Cambodia go)', '0', '100000', '222816176', 'Dr Feb 24/125', '9100/017', 377),
(1576, '2024-02-07', '', '3600/001', 'Meal allowance for Market Boy 3 pcs', '0', '6000', '222810176', 'Dr Feb 24/126', '9100/012', 379),
(1577, '2024-02-07', '', '3600/001', 'Labour Charges for Market Boy 3 pcs', '0', '16000', '222794176', 'Dr Feb 24/127', '6100/001', 381),
(1578, '2024-02-07', '', '3600/001', 'Ice 7 pcs purchase for Market Fish', '0', '77000', '222717176', 'Dr Feb 24/128', '6100/002', 383),
(1579, '2024-02-07', '', '3600/001', 'Car PK for (Market)', '0', '2000', '222715176', 'Dr Feb 24/129', '9100/025', 385),
(1580, '2024-02-07', '', '3600/001', 'Taxi Charges for Boy 1 pcs house go', '0', '3000', '222712176', 'Dr Feb 24/130', '9100/002', 387),
(1581, '2024-02-08', '', '3600/001', 'Paid to Zaw Myat Thu for Vr No-11357', '0', '6000000', '216712176', 'Dr Feb 24/131', '4000/Z03', 389),
(1582, '2024-02-08', '', '3600/001', 'Safe Guard purchase and Lighting Repair for office', '0', '120000', '216592176', 'Dr Feb 24/132', '9100/018', 391),
(1583, '2024-02-08', '', '3600/001', 'Taxi Charges For HHK to WH and Ice 1 pcs ', '0', '26000', '216566176', 'Dr Feb 24/133', '9100/002', 393),
(1584, '2024-02-08', '', '3600/001', 'Car Diesel for 6J-3015', '0', '50000', '216516176', 'Dr Feb 24/134', '9100/006', 395),
(1585, '2024-02-08', '', '3600/001', 'Engin Oil purchase for 6J-3015', '0', '10000', '216506176', 'Dr Feb 24/135', '9100/014', 397),
(1586, '2024-02-08', '', '3600/001', 'Labour Charges and Taxi Charges for (D-Puti)', '0', '111000', '216395176', 'Dr Feb 24/136', '6100/001', 399),
(1587, '2024-02-08', '', '3600/001', 'Ice 4 pcs purchase for (D-Puti)', '0', '36000', '216359176', 'Dr Feb 24/137', '6100/002', 401),
(1588, '2024-02-08', '', '3600/001', 'Taxi Charges for HHK to GFC', '0', '17000', '216342176', 'Dr Feb 24/138', '9100/002', 403),
(1589, '2024-02-08', '', '3600/001', 'Car PK for 6J-3015 (Market)', '0', '2000', '216340176', 'Dr Feb 24/139', '9100/025', 405),
(1590, '2024-02-08', '', '3600/001', 'Market Boys 3 pcs Lunch', '0', '6000', '216334176', 'Dr Feb 24/140', '9100/012', 407),
(1591, '2024-02-08', '', '3600/001', 'Labour Charges for Market Fish', '0', '16000', '216318176', 'Dr Feb 24/141', '6100/001', 409),
(1592, '2024-02-08', '', '3600/001', 'Ice 3 pcs purchase for WH', '0', '33000', '216285176', 'Dr Feb 24/142', '6100/002', 411),
(1593, '2024-02-09', '', '3600/001', 'Car Diesel for 6J-3015', '0', '50000', '216235176', 'Dr Feb 24/143', '9100/006', 413),
(1594, '2024-02-09', '', '3600/001', 'Taxi Charges for WH to GFC', '0', '22000', '216213176', 'Dr Feb 24/144', '9100/002', 415),
(1595, '2024-02-09', '', '3600/001', 'Taxi Charges for WH to Goverment for (Lai Lai and May Zin Myo)', '0', '3000', '216210176', 'Dr Feb 24/145', '9100/002', 417),
(1596, '2024-02-09', '', '3600/001', 'Taxi Charges for Car Car Driver for (9.2) 8:30 PM', '0', '5000', '216205176', 'Dr Feb 24/146', '9100/002', 419),
(1597, '2024-02-09', '', '3600/001', 'Car police catch for 6J-3015 (Market)', '0', '5000', '216200176', 'Dr Feb 24/147', '9100/014', 421),
(1598, '2024-02-09', '', '3600/001', 'Labour Charges for Ocean Pacific (Raw)', '0', '13000', '216187176', 'Dr Feb 24/148', '6100/001', 423),
(1599, '2024-02-09', '', '3600/001', '', '0', '15000', '216172176', 'Dr Feb 24/149', '9100/002', 425),
(1600, '2024-02-09', '', '3600/001', 'Boy 2 pcs Lunch for Ocean (Pk)', '0', '4000', '216168176', 'Dr Feb 24/150', '9100/012', 427),
(1601, '2024-02-09', '', '3600/001', 'Labour Charges for D-Puti (230viss*600) and Taxi Charges (20000)', '0', '158000', '216010176', 'Dr Feb 24/151', '6100/001', 429),
(1602, '2024-02-09', '', '3600/001', 'Ice 2 pcs purchase for D-Puti', '0', '18000', '215992176', 'Dr Feb 24/152', '6100/002', 431),
(1603, '2024-02-09', '', '3600/001', 'Boys 2 pcs Lunch and Dinner for (HHK)', '0', '12000', '215980176', 'Dr Feb 24/153', '9100/012', 433),
(1604, '2024-02-09', '', '3600/001', 'Paid to Tun Zaw Min for Vr No-11074, 11079 Cheque No-052403', '0', '40000000', '175980176', 'Dr Feb 24/154', '4000/T11', 435),
(1605, '2024-02-09', '', '3600/001', 'Taxi Charges for WH to Market and WH', '0', '27000', '175953176', 'Dr Feb 24/155', '9100/002', 437),
(1606, '2024-02-09', '', '3600/001', 'Meal allowance for Market Boy', '0', '10500', '175942676', 'Dr Feb 24/156', '9100/012', 439),
(1607, '2024-02-09', '', '3600/001', 'Labour Charges for Market Fish', '0', '23000', '175919676', 'Dr Feb 24/157', '6100/001', 441),
(1608, '2024-02-09', '', '3600/001', 'Ice 6 pcs purchase for Market Fish', '0', '66000', '175853676', 'Dr Feb 24/158', '6100/002', 443),
(1609, '2024-02-09', '', '3600/001', 'Car PK and OT for Market', '0', '7000', '175846676', 'Dr Feb 24/159', '9100/025', 445),
(1610, '2024-02-12', '', '3600/001', 'Car Petrol for 6J-3015 10.2.24,11.2.24,12.2.24', '0', '150000', '175696676', 'Dr-Feb 24/160', '9100/006', 459),
(1611, '2024-02-12', '', '3600/001', 'Paid to Ocean Pacific Cold Store Charges Balance Amt ', '0', '1112614', '174584062', 'Dr-Feb 24/161', '6100/007', 461),
(1612, '2024-02-12', '', '3600/001', 'Machine Repair for W/H PK Machine', '0', '306000', '174278062', 'Dr-Feb 24/162', '9100/007', 463),
(1613, '2024-02-12', '', '3600/001', 'Paid to Plastic (G/F) for 7.2.2024,8.2.24,9.2.24', '0', '473750', '173804312', 'Dr-Feb 24/163', '6100/003', 465),
(1614, '2024-02-12', '', '3600/001', 'Water 5Pk Purchase for W/H', '0', '4500', '173799812', 'Dr-Feb 24/164', '9100/003', 467),
(1615, '2024-02-12', '', '3600/001', 'Paid to Sticker 5 Colour and Taxi Charges', '0', '2163000', '171636812', 'Dr-Feb 24/165', '6100/006', 469),
(1616, '2024-02-12', '', '3600/001', 'Taxi Charges for Ocean to W/H for 11.2.24-12000,12.2.24-22000', '0', '34000', '171602812', 'Dr-Feb 24/166', '9100/002', 471),
(1617, '2024-02-12', '', '3600/001', 'Penam Bag,Rubber Ring and Photo Sticker Purchase for W/H\r\n', '0', '832250', '170770562', 'Dr-Feb 24/167', '6100/003', 473),
(1618, '2024-02-12', '', '3600/001', 'Taxi Charges for Ocean to W/H 10.2.24\r\n', '0', '20000', '170750562', 'Dr-Feb 24/168', '9100/002', 475),
(1619, '2024-02-12', '', '3600/001', 'Car Petrol for 5L-2848\r\n', '0', '160000', '170590562', 'Dr-Feb 24/169', '9100/006', 477),
(1620, '2024-02-12', '', '3600/001', 'Gas Filling for Sir House\r\n', '0', '70000', '170520562', 'Dr-Feb 24/170', '9100/007', 479),
(1621, '2024-02-12', '', '3600/001', 'Fish Sample Purchase \r\n', '0', '31600', '170488962', 'Dr-Feb 24/171', '9100/005', 481),
(1622, '2024-02-12', '', '3600/001', 'Meal Allowance for Market Boy\r\n', '0', '10500', '170478462', 'Dr-Feb 24/172', '9100/012', 483),
(1623, '2024-02-12', '', '3600/001', 'Car Parking for Market \r\n', '0', '2000', '170476462', 'Dr-Feb 24/173', '9100/025', 485),
(1624, '2024-02-12', '', '3600/001', 'Labour Charges for Market Fish\r\n', '0', '12500', '170463962', 'Dr-Feb 24/174', '6100/001', 487),
(1625, '2024-02-12', '', '3600/001', 'Ice 3.5pcs Purchase for Market Fish\r\n', '0', '38500', '170425462', 'Dr-Feb 24/175', '6100/002', 489),
(1626, '2024-02-13', '', '3600/001', 'Phone Bill for Sir', '0', '3000', '170422462', 'Dr-Feb 24/176', '9100/004', 491),
(1627, '2024-02-13', '', '3600/001', 'Taxi Charges for W/H to UAB to Café shop\r\n', '0', '5000', '170417462', 'Dr-Feb 24/177', '9100/002', 493),
(1628, '2024-02-13', '', '3600/001', 'Rice 60*89000ks,Beam 10*120000ks/10*148500 and Oil-30*26500ks and Car Charges, Taxi for Mingalar Charity Donation\r\n', '0', '8883000', '161534462', 'Dr-Feb 24/178', '9100/011', 495),
(1629, '2024-02-13', '', '3600/001', 'Safe Guard 2pcs Purchase for W/H\r\n', '0', '62000', '161472462', 'Dr-Feb 24/179', '9100/018', 497),
(1630, '2024-02-13', '', '3600/001', 'Taxi Charges for GFC To W/H\r\n', '0', '21000', '161451462', 'Dr-Feb 24/180', '9100/002', 499),
(1631, '2024-02-13', '', '3600/001', 'Car Rental Charges for Mingalar Charity Donation (ADV;)\r\n', '0', '200000', '161251462', 'Dr-Feb 24/181', '9100/011', 501),
(1632, '2024-02-13', '', '3600/001', 'Paid to Thet Oo for Vr No-11132,11202,11215,11242,11265,11279 Cheque No-052404\r\n', '0', '40000000', '121251462', 'Dr-Feb 24/182', '4000/T05', 503),
(1633, '2024-02-13', '', '3600/001', 'Paid to Thein Htay for Vr No-11269,11344,11359 Cheque No-052405\r\n', '0', '6000000', '115251462', 'Dr-Feb 24/183', '4000/T02', 505),
(1634, '2024-02-13', '', '3600/001', 'Meal Allownace for Market Boys \r\n', '0', '10500', '115240962', 'Dr-Feb 24/184', '9100/012', 507),
(1635, '2024-02-13', '', '3600/001', 'Car Parking for Market \r\n', '0', '2000', '115238962', 'Dr-Feb 24/185', '9100/025', 509),
(1636, '2024-02-13', '', '3600/001', 'Labour Charges for Market Fish\r\n', '0', '8000', '115230962', 'Dr-Feb 24/186', '6100/001', 511),
(1637, '2024-02-13', '', '3600/001', 'Ice 2pcs Purchase for Market Fish\r\n', '0', '22000', '115208962', 'Dr-Feb 24/187', '6100/002', 513),
(1683, '2024-02-14', '', '3600/001', 'UAB Bank Bal money for ($50868.68) (9.2.24)- $12000*3475 (13.2.24)-11462.5*3475 Italy Money 65%Balance\r\n', '41700000', '0', '156908962', 'Cr-Feb 24/006', '3300/004', 524),
(1684, '2024-02-14', '', '3600/001', 'UAB Bank Bal money for ($50868.68) (9.2.24)- $12000*3475 (13.2.24)-11462.5*3475 Italy Money 65%Balance\r\n', '39832187.5', '0', '196741149.5', 'Cr-Feb 24/006', '3300/004', 526),
(1685, '2024-02-14', '', '3600/001', 'UAB Bank Bal money for ($50868.68) (13.2.24)-27406.18*3475ks USA Money 74925 (65%Balance of 42163.36)\r\n', '95236475.5', '0', '291977625', 'Cr-Feb 24/006', '3300/002', 528),
(1688, '2024-02-14', '', '3600/001', 'USA Money Received from UAB ($74925) 65% , 35% $26223.75-10=26213.75*2100ks $48701.25*3475\r\n', '55048875', '0', '347026500', 'Cr-Feb 24/007', '3300/002', 530),
(1689, '2024-02-14', '', '3600/001', 'USA Money (Mr-Sarmad ) Test Transfer form UAB 65% , 35% ($960.48) $336.17-10=$326.17*2100ks ($624.31 Balance in UAB USD A/C)\r\n', '169236843.75', '0', '516263343.75', 'Cr-Feb 24/007', '3300/002', 532),
(1690, '2024-02-14', '', '3600/001', 'USA Money (Mr-Sarmad ) Test Transfer form UAB 65% , 35% ($960.48) $336.17-10=$326.17*2100ks ($624.31 Balance in UAB USD A/C)\r\n', '684957', '0', '516948300.75', 'Cr-Feb 24/008', '3300/002', 534),
(1692, '2024-02-14', '', '3600/002', 'USA Money (Mr-Sarmad ) Test Transfer form UAB 65% , 35% ($960.48) $336.17-10=$326.17*2100ks ($624.31 Balance in UAB USD A/C)\r\n', '624.31', '0', '24086.81', 'Cr-Feb 24/008', '3300/002', 536),
(1807, '2024-02-14', '', '3600/001', 'Paid to Thin Thin Yee for Vr No-11176,11177\r\n', '0', '50000000', '466948300.75', 'Dr-Feb 24/188', '4000/T03', 539),
(1808, '2024-02-14', '', '3600/001', 'Paid to Ye Yint for Vr No-11133,11135\r\n', '0', '4000000', '462948300.75', 'Dr-Feb 24/189', '4000/Y01', 541),
(1809, '2024-02-14', '', '3600/001', 'Paid to Zaw Myat Thu for Vr No-11357,11361\r\n', '0', '10000000', '452948300.75', 'Dr-Feb 24/190', '4000/Z03', 543),
(1810, '2024-02-14', '', '3600/001', 'Paid to Soe Min for Vr No-11020,11069,11121\r\n', '0', '20000000', '432948300.75', 'Dr-Feb 24/191', '4000/S03', 545),
(1811, '2024-02-14', '', '3600/001', 'Paid to Tun Zaw Min for Vr No-11079\r\n', '0', '30000000', '402948300.75', 'Dr-Feb 24/192', '4000/T11', 547),
(1812, '2024-02-14', '', '3600/001', 'Paid to Si Thu (D-22) for Vr No\r\n', '0', '6000000', '396948300.75', 'Dr-Feb 24/193', '4000/S05', 549),
(1813, '2024-02-14', '', '3600/001', 'Paid to Mg Mg Nyunt for Vr No-11192\r\n', '0', '5000000', '391948300.75', 'Dr-Feb 24/194', '4000/M03', 551),
(1814, '2024-02-14', '', '3600/001', 'Paid to Phone Naing for Vr No-11268\r\n', '0', '3000000', '388948300.75', 'Dr-Feb 24/195', '4000/P01', 553),
(1815, '2024-02-14', '', '3600/001', 'Paid to Mg Mg Soe for Vr No-11185,11198\r\n', '0', '5000000', '383948300.75', 'Dr-Feb 24/196', '4000/M06', 555),
(1816, '2024-02-14', '', '3600/001', 'Paid to Soe Thein (TCL) for Vr No-00123\r\n', '0', '12000000', '371948300.75', 'Dr-Feb 24/197', '4000/S07', 557),
(1817, '2024-02-14', '', '3600/001', 'Paid to Thet Oo for Vr No-11279,11328,11348\r\n', '0', '50000000', '321948300.75', 'Dr-Feb 24/198', '4000/T05', 559),
(1818, '2024-02-14', '', '3600/001', 'Paid to Khin Mg Myint for Vr No-11189\r\n', '0', '7000000', '314948300.75', 'Dr-Feb 24/199', '4000/K07', 561),
(1819, '2024-02-14', '', '3600/001', 'Paid to Cho Mg for Vr No-11161\r\n', '0', '4000000', '310948300.75', 'Dr-Feb 24/200', '4000/C02', 563),
(1820, '2024-02-14', '', '3600/001', 'Paid to Bar Bu Lay for Vr No-11263,11323\r\n', '0', '4000000', '306948300.75', 'Dr-Feb 24/201', '4000/B01', 565),
(1821, '2024-02-14', '', '3600/001', 'Paid to A Thay Lay for Vr No-11237\r\n', '0', '3000000', '303948300.75', 'Dr-Feb 24/202', '4000/A07', 567),
(1822, '2024-02-14', '', '3600/001', 'Paid to Soe Naing for Vr No-10542\r\n', '0', '5000000', '298948300.75', 'Dr-Feb 24/203', '4000/S08', 569),
(1823, '2024-02-14', '', '3600/001', 'Paid to Kaung Myat for Vr No-11341\r\n', '0', '4000000', '294948300.75', 'Dr-Feb 24/204', '4000/K04', 571),
(1824, '2024-02-14', '', '3600/001', 'Paid to Arr Kae for Vr No-11199,11248\r\n', '0', '4000000', '290948300.75', 'Dr-Feb 24/205', '4000/A02', 573),
(1825, '2024-02-14', '', '3600/001', 'Paid to Aung Naing Oo for Vr No-11021,11049,11067,11085\r\n', '0', '7000000', '283948300.75', 'Dr-Feb 24/206', '4000/A03', 575),
(1826, '2024-02-14', '', '3600/001', 'Paid to AK for Vr No-11023,11082,11128\r\n', '0', '6000000', '277948300.75', 'Dr-Feb 24/207', '4000/A01', 577),
(1827, '2024-02-14', '', '3600/001', 'Paid to Aung Zaw Oo for Vr No-11172,11184\r\n', '0', '3000000', '274948300.75', 'Dr-Feb 24/208', '4000/A06', 579),
(1828, '2024-02-14', '', '3600/001', 'Paid to Shwe Late for Vr No-10902,10923,10937,10941\r\n', '0', '6000000', '268948300.75', 'Dr-Feb 24/209', '4000/S01', 581),
(1829, '2024-02-14', '', '3600/001', 'Paid to 4 Zaw for Vr No-11054\r\n', '0', '6000000', '262948300.75', 'Dr-Feb 24/210', '4000/001', 583),
(1830, '2024-02-14', '', '3600/001', 'Penam Bag and Taxi Charges for WH\r\n', '0', '20500', '262927800.75', 'Dr-Feb 24/211', '6100/003', 585),
(1831, '2024-02-14', '', '3600/001', 'Meal Allowance for Office 5pcs Payment Day\r\n', '0', '10000', '262917800.75', 'Dr-Feb 24/212', '9100/012', 587),
(1832, '2024-02-14', '', '3600/001', 'Taxi Charges for Office 5 pcs Payment Day  \r\n', '0', '29000', '262888800.75', 'Dr-Feb 24/213', '9100/002', 589),
(1833, '2024-02-14', '', '3600/001', 'Paid to Plastic (G/F) for (12.2)\r\n', '0', '1193500', '261695300.75', 'Dr-Feb 24/214', '6100/003', 591),
(1834, '2024-02-14', '', '3600/001', 'Water 5pcs Purchase for W/H\r\n', '0', '4500', '261690800.75', 'Dr-Feb 24/215', '9100/003', 593),
(1835, '2024-02-14', '', '3600/001', 'Kit Box Carry Charges for W/H to Ocean\r\n', '0', '60000', '261630800.75', 'Dr-Feb 24/216', '6100/004', 595),
(1836, '2024-02-14', '', '3600/001', 'Roller Rope Purchase for PK Machine\r\n', '0', '55500', '261575300.75', 'Dr-Feb 24/217', '9100/007', 597),
(1837, '2024-02-14', '', '3600/001', 'Candy Purchase for Mingalar Charity Donation \r\n', '0', '38500', '261536800.75', 'Dr-Feb 24/218', '9100/011', 599),
(1838, '2024-02-14', '', '3600/001', 'Taxi Charges for W/H to GFC RP Change\r\n', '0', '22000', '261514800.75', 'Dr-Feb 24/219', '9100/002', 601),
(1839, '2024-02-14', '', '3600/001', 'Digital Battery Purchase for W/H\r\n', '0', '10500', '261504300.75', 'Dr-Feb 24/220', '9100/007', 603),
(1840, '2024-02-14', '', '3600/001', 'Ice 10 pcs for Raw\r\n', '0', '100000', '261404300.75', 'Dr-Feb 24/221', '6100/002', 605),
(1841, '2024-02-14', '', '3600/001', 'Labour Charges for D-Puti (160 viss*600) and Taxi Charges -15000\r\n', '0', '111000', '261293300.75', 'Dr-Feb 24/222', '6100/001', 607),
(1842, '2024-02-14', '', '3600/001', 'Ice purchase and Carry for (D-Puti)\r\n', '0', '51000', '261242300.75', 'Dr-Feb 24/223', '6100/002', 609),
(1843, '2024-02-14', '', '3600/001', 'Car Petrol for 6J-3015 13.2.24/14.2.24\r\n', '0', '100000', '261142300.75', 'Dr-Feb 24/224', '9100/006', 611),
(1844, '2024-02-14', '', '3600/001', 'Taxi Charges for W/H to GFC to W/H RP Change\r\n', '0', '25000', '261117300.75', 'Dr-Feb 24/225', '9100/002', 613),
(1845, '2024-02-14', '', '3600/001', 'Kaspersky and Services Charges for Daw Nan (New Computer)\r\n', '0', '36500', '261080800.75', 'Dr-Feb 24/226', '9100/019', 615),
(1846, '2024-02-14', '', '3600/001', 'Taxi Charges for HHK to W/H\r\n', '0', '22000', '261058800.75', 'Dr-Feb 24/227', '9100/002', 617),
(1847, '2024-02-14', '', '3600/001', 'Labour Charges for D-Puti (260 viss*600) Mrigal (SL) (125 viss*130) and Taxi Charges\r\n', '0', '202250', '260856550.75', 'Dr-Feb 24/228', '6100/001', 619),
(1848, '2024-02-14', '', '3600/001', 'Ice 7pcs Purchase for Dputi,Boal,Ayar,Rohu,Mrigal 7*9000ks\r\n', '0', '63000', '260793550.75', 'Dr-Feb 24/228', '6100/001', 621),
(1849, '2024-02-14', '', '3600/001', 'Extention 1 pcs purchase for WH\r\n', '0', '11000', '260782550.75', 'Dr-Feb 24/229', '9100/018', 623),
(1850, '2024-02-14', '', '3600/001', 'Paid to Sticker 5 colour\r\n', '0', '1158820', '259623730.75', 'Dr-Feb 24/230', '6100/006', 625),
(1851, '2024-02-14', '', '3600/001', 'Taxi Charges for Market to W/H\r\n', '0', '10000', '259613730.75', 'Dr-Feb 24/236', '9100/002', 631),
(1852, '2024-02-14', '', '3600/001', 'Ice 3pcs Purchase for Market Fish\r\n', '0', '33000', '259580730.75', 'Dr-Feb 24/237', '6100/002', 633),
(1853, '2024-02-14', '', '3600/001', 'Meal Allowance for Market Boys 4pcs\r\n', '0', '8000', '259572730.75', 'Dr-Feb 24/238', '9100/012', 635),
(1854, '2024-02-14', '', '3600/001', 'Paid to Agent Aung Myat Zaw Adv for USA No-1/24, Can No 2/24\r\n', '0', '4300000', '255272730.75', 'Dr-Feb 24/232', '9100/020', 679),
(1855, '2024-02-14', '', '3600/001', 'DOF Charges for USA 1/24, Can 2/24\r\n', '0', '300000', '254972730.75', 'Dr-Feb 24/233', '9100/021', 681),
(1856, '2024-02-14', '', '3600/001', 'Paid to Ocean Pacific for USA 1/24 and Can 2/24 Loading\r\n', '0', '400000', '254572730.75', 'Dr-Feb 24/234', '9100/022', 683),
(1857, '2024-02-14', '', '3600/001', 'Car Parking Charges for Market 6J\r\n', '0', '10000', '254562730.75', 'Dr-Feb 24/235', '9100/025', 685),
(1858, '2024-02-15', '', '3600/001', 'Paid to Than Than Myint for Vr No\r\n', '0', '4000000', '250562730.75', 'Dr-Feb 24/239', '4000/T08', 637),
(1859, '2024-02-15', '', '3600/001', 'Paid to MA for Vr No-10586,10603,10757\r\n', '0', '5370700', '245192030.75', 'Dr-Feb 24/240', '4000/M01', 639),
(1860, '2024-02-15', '', '3600/001', 'Paid to Thet Paing for Vr No-11327 \r\n', '0', '4000000', '241192030.75', 'Dr-Feb 24/241', '4000/T01', 641),
(1861, '2024-02-15', '', '3600/001', 'Paid to Ka Yin Lay for Vr No-11372\r\n', '0', '565400', '240626630.75', 'Dr-Feb 24/242', '4000/K06', 643),
(1862, '2024-02-15', '', '3600/001', 'Paid to Zaw Zaw Latt for Vr No-11008,11191\r\n', '0', '6000000', '234626630.75', 'Dr-Feb 24/243', '4000/Z01', 645),
(1863, '2024-02-15', '', '3600/001', 'Paid to Sticker 5 colour\r\n', '0', '2692000', '231934630.75', 'Dr-Feb 24/244', '6100/006', 647),
(1864, '2024-02-15', '', '3600/001', 'Taxi Charges for W/H to Ocean\r\n', '0', '18000', '231916630.75', 'Dr-Feb 24/245', '9100/002', 649),
(1865, '2024-02-15', '', '3600/001', 'Water 3pcs Purhcase for W/H\r\n', '0', '2700', '231913930.75', 'Dr-Feb 24/246', '9100/003', 651),
(1866, '2024-02-15', '', '3600/001', 'Paid to GFC Cold Store Charges \r\n', '0', '5960000', '225953930.75', 'Dr-Feb 24/247', '6100/007', 653),
(1867, '2024-02-15', '', '3600/001', 'Car Charges for Rice,Beam and Oil of Mingalar Charity Donation 150000+Car Rental Balance 400000\r\n', '0', '550000', '225403930.75', 'Dr-Feb 24/248', '9100/011', 655),
(1868, '2024-02-15', '', '3600/001', 'Paid to Foam Box (YC) for (24.1) (25.1)\r\n', '0', '2272500', '223131430.75', 'Dr-Feb 24/250', '6100/003', 657),
(1869, '2024-02-15', '', '3600/001', 'Paid to Kyaw Zay Ya for Vr No-11097\r\n', '0', '9000000', '214131430.75', 'Dr-Feb 24/251', '4000/K05', 659),
(1870, '2024-02-15', '', '3600/001', 'Paid to Aung Myo Min for Vr No-11052\r\n', '0', '5000000', '209131430.75', 'Dr-Feb 24/252', '4000/A05', 661),
(1871, '2024-02-15', '', '3600/001', 'Penam Bag purchase for WH\r\n', '0', '450200', '208681230.75', 'Dr-Feb 24/253', '6100/003', 663),
(1872, '2024-02-15', '', '3600/001', 'Wave Money Transfer Charges for KaYinLay \r\n', '0', '5400', '208675830.75', 'Dr-Feb 24/254', '9100/009', 665),
(1873, '2024-02-15', '', '3600/001', 'Broom and Taxi Charges for W/H\r\n', '0', '43700', '208632130.75', 'Dr-Feb 24/255', '9100/005', 667),
(1874, '2024-02-15', '', '3600/001', 'Car Parking for Market 6J\r\n', '0', '2000', '208630130.75', 'Dr-Feb 24/256', '9100/025', 669),
(1875, '2024-02-15', '', '3600/001', 'Labour Charges for Market Fish\r\n', '0', '7000', '208623130.75', 'Dr-Feb 24/257', '6100/001', 671),
(1876, '2024-02-15', '', '3600/001', 'Taxi Charges for Market to W/H\r\n', '0', '10000', '208613130.75', 'Dr-Feb 24/258', '9100/002', 673),
(1877, '2024-02-15', '', '3600/001', 'Ice 2.5pcs Purchase for Market Fish\r\n', '0', '27000', '208586130.75', 'Dr-Feb 24/259', '6100/002', 675),
(2051, '2024-02-16', '', '3600/001', 'Paid to Dalian Ice for Packing Strap JCV (13.2) (16.2)\r\n', '0', '860000', '207726130.75', 'Dr-Feb 24/259', '6100/003', 687),
(2052, '2024-02-16', '', '3600/001', 'Sir Phone Bill\r\n', '0', '3000', '207723130.75', 'Dr-Feb 24/260', '9100/004', 689),
(2053, '2024-02-16', '', '3600/001', 'Birthday Cake for (Mr-Sarmad)\r\n', '0', '63000', '207660130.75', 'Dr-Feb 24/261', '9100/012', 691),
(2054, '2024-02-16', '', '3600/001', 'Water 6 pk purchase for WH\r\n', '0', '5400', '207654730.75', 'Dr-Feb 24/262', '9100/003', 693),
(2055, '2024-02-16', '', '3600/001', 'Car Diesel for 6J-3015 (15.2)-50000/ (16.2)-50000\r\n', '0', '100000', '207554730.75', 'Dr-Feb 24/263', '9100/006', 695),
(2056, '2024-02-16', '', '3600/001', 'Car Diesel for 5L-2848\r\n', '0', '145000', '207409730.75', 'Dr-Feb 24/264', '9100/006', 697),
(2057, '2024-02-16', '', '3600/001', 'Engin Oil purchase for 6J-3015\r\n', '0', '10000', '207399730.75', 'Dr-Feb 24/265', '9100/014', 699),
(2058, '2024-02-16', '', '3600/001', 'Paid to Ocean Pacific Cold Store\r\n', '0', '3298466', '204101264.75', 'Dr-Feb 24/266', '6100/007', 701),
(2059, '2024-02-16', '', '3600/001', 'Taxi Charges Car Driver for (Night)\r\n', '0', '4000', '204097264.75', 'Dr-Feb 24/267', '9100/002', 703),
(2060, '2024-02-16', '', '3600/001', 'Taxi Charges WH to GFC for (R.P)\r\n', '0', '21000', '204076264.75', 'Dr-Feb 24/268', '9100/002', 705),
(2061, '2024-02-16', '', '3600/001', 'Key 2 pcs purchase for Can 2\r\n', '0', '2000', '204074264.75', 'Dr-Feb 24/269', '9100/005', 707),
(2062, '2024-02-16', '', '3600/001', 'Labour Charges for Ocean (Raw)\r\n', '0', '6000', '204068264.75', 'Dr-Feb 24/270', '6100/001', 709),
(2063, '2024-02-16', '', '3600/001', 'Taxi Charges for Thuzar (14,15) 8:30 PM\r\n', '0', '5000', '204063264.75', 'Dr-Feb 24/271', '9100/002', 711),
(2064, '2024-02-16', '', '3600/001', 'Penam Bag purchase and Taxi Charges\r\n', '0', '85000', '203978264.75', 'Dr-Feb 24/272', '6100/003', 713),
(2065, '2024-02-16', '', '3600/001', 'Taxi Charges for Thuzar (16.2)\r\n', '0', '2500', '203975764.75', 'Dr-Feb 24/273', '9100/002', 715),
(2066, '2024-02-16', '', '3600/001', 'Labour Charges for (Ocean Raw)\r\n', '0', '4500', '203971264.75', 'Dr-Feb 24/274', '6100/001', 717),
(2067, '2024-02-16', '', '3600/001', 'Taxi Charges for WH to Ocean (Pk)\r\n', '0', '12000', '203959264.75', 'Dr-Feb 24/275', '9100/002', 719),
(2068, '2024-02-16', '', '3600/001', 'Taxi Chrges for Market to GFC to WH\r\n', '0', '35000', '203924264.75', 'Dr-Feb 24/276', '9100/002', 721),
(2069, '2024-02-16', '', '3600/001', 'Meal allowance for Market Boys 3 pcs\r\n', '0', '6000', '203918264.75', 'Dr-Feb 24/277', '9100/012', 723),
(2070, '2024-02-16', '', '3600/001', 'Car PK for (Market)\r\n', '0', '2000', '203916264.75', 'Dr-Feb 24/278', '9100/025', 725),
(2071, '2024-02-16', '', '3600/001', 'Labour Charges for Market Fish\r\n', '0', '15000', '203901264.75', 'Dr-Feb 24/279', '6100/001', 727),
(2072, '2024-02-16', '', '3600/001', 'Ice 5 pcs purchase for Market Fish\r\n', '0', '55000', '203846264.75', 'Dr-Feb 24/280', '6100/002', 729),
(2093, '2024-02-18', '', '3600/001', 'Ledger 6 pcs purchase for (office)\r\n', '0', '25400', '203820864.75', 'Dr-Feb 24/281', '9100/016', 733),
(2094, '2024-02-18', '', '3600/001', 'Meter Bill for Wai Pon La office -500/ Sir house-46800 (Jan/2024)\r\n', '0', '47300', '203773564.75', 'Dr-Feb 24/282', '9100/018', 735),
(2095, '2024-02-18', '', '3600/001', 'Meter Bill for WH (Jan/2024)\r\n', '0', '132670', '203640894.75', 'Dr-Feb 24/283', '9100/018', 737),
(2096, '2024-02-18', '', '3600/001', 'Meter service and Bank charges for WH\r\n', '0', '7000', '203633894.75', 'Dr-Feb 24/284', '9100/009', 739),
(2097, '2024-02-18', '', '3600/001', 'Maintenance for Sir house (Feb/2024)\r\n', '0', '15000', '203618894.75', 'Dr-Feb 24/285', '9100/023', 741),
(2098, '2024-02-18', '', '3600/001', 'Taxi Charges for WH to Wai Pon La to WH\r\n', '0', '3500', '203615394.75', 'Dr-Feb 24/286', '9100/002', 743),
(2099, '2024-02-18', '', '3600/001', 'Sir take from Daw Nan No 1, 30000/ No 2, 300000/ No 3, 10 -Lakh\r\n', '0', '1330000', '202285394.75', 'Dr-Feb 24/287', '9100/017', 745),
(2100, '2024-02-18', '', '3600/001', 'Labour Charges for Ocean Rohu and (Raw)\r\n', '0', '21000', '202264394.75', 'Dr-Feb 24/288', '6100/001', 747),
(2101, '2024-02-18', '', '3600/001', 'Taxi Charges WH to Ocean for Sticker\r\n', '0', '15000', '202249394.75', 'Dr-Feb 24/289', '9100/002', 749),
(2102, '2024-02-18', '', '3600/001', 'Ice purchase for Ocean (Pk) (15.2)-9000/ (17.2)-69000\r\n', '0', '78000', '202171394.75', 'Dr-Feb 24/290', '6100/002', 751),
(2103, '2024-02-18', '', '3600/001', 'Wedding present for (17.2)\r\n', '0', '206000', '201965394.75', 'Dr-Feb 24/291', '9100/015', 753),
(2104, '2024-02-18', '', '3600/001', 'Penam Bag purchase and Carry for WH (824000+16000)\r\n', '0', '840000', '201125394.75', 'Dr-Feb 24/292', '6100/003', 755),
(2105, '2024-02-18', '', '3600/001', 'Photo Sticker/Pen/Caculator purchase for WH\r\n', '0', '125100', '201000294.75', 'Dr-Feb 24/293', '9100/016', 757),
(2106, '2024-02-18', '', '3600/001', 'Sticker purchase from 5 colour  Voucher 3 pcs\r\n', '0', '2116280', '198884014.75', 'Dr-Feb 24/294', '6100/006', 759),
(2107, '2024-02-18', '', '3600/001', 'Paid to Plastic (G/F) for (15.2.24)\r\n', '0', '1320000', '197564014.75', 'Dr-Feb 24/295', '6100/003', 761),
(2108, '2024-02-18', '', '3600/001', 'Car Diesel for 6J-3015 (17.2)-50000/ (18.2)-50000\r\n', '0', '100000', '197464014.75', 'Dr-Feb 24/296', '9100/006', 763),
(2109, '2024-02-18', '', '3600/001', 'Donation for (15.2.24) Mingalar Charity\r\n', '0', '1000000', '196464014.75', 'Dr-Feb 24/297', '9100/011', 765),
(2110, '2024-02-18', '', '3600/001', 'Paid to Ocean Pacific Cold Store\r\n', '0', '7000000', '189464014.75', 'Dr-Feb 24/298', '6100/007', 767),
(2111, '2024-02-18', '', '3600/001', 'Taxi Charges for WH to GFC\r\n', '0', '20000', '189444014.75', 'Dr-Feb 24/299', '9100/002', 769),
(2112, '2024-02-18', '', '3600/001', 'Labour Charges for GFC R.P\r\n', '0', '86000', '189358014.75', 'Dr-Feb 24/300', '6100/001', 771),
(2129, '2024-02-19', '', '3600/001', 'Paid to Ko Aung Myat Zaw 2 % and Adv for Can 3/24 and 4/24, USA 2/24 and 3/24', '0', '10000000', '179358014.75', 'Dr-Feb 24/301', '9100/020', 795),
(2130, '2024-02-19', '', '3600/001', 'DOF Charges for Can 3/24 and 4/24, USA 2/24 and 3/24', '0', '600000', '178758014.75', 'Dr-Feb 24/302', '9100/021', 797),
(2131, '2024-02-19', '', '3600/001', 'Paid to Ocean Pacific for MMk Can 3/24 and 4/24, USA 2/24 and 3/24 Laoding', '0', '800000', '177958014.75', 'Dr-Feb 24/303', '9100/022', 799),
(2132, '2024-02-19', '', '3600/001', 'Paid to Sticker 5 colour', '0', '3721000', '174237014.75', 'Dr-Feb 24/304', '6100/006', 801),
(2133, '2024-02-19', '', '3600/001', 'Taxi Charges WH to Insein to WH for Office 2 pcs Meeting', '0', '16000', '174221014.75', 'Dr-Feb 24/305', '9100/002', 803),
(2134, '2024-02-19', '', '3600/001', 'HHK to GFC MC carry for 2 Trucks *400000/ 1 Truck *200000', '0', '1000000', '173221014.75', 'Dr-Feb 24/306', '6100/005', 805),
(2135, '2024-02-19', '', '3600/001', 'Taxi Charges for Thuzar (16.17.18) Ocean (OT)', '0', '7500', '173213514.75', 'Dr-Feb 24/307', '9100/002', 807),
(2136, '2024-02-19', '', '3600/001', 'Workers 13 pcs Dinner for Ocean (OT) 13*2000 ks', '0', '26000', '173187514.75', 'Dr-Feb 24/308', '9100/012', 809),
(2137, '2024-02-19', '', '3600/001', 'Car Diesel for 6J-3015', '0', '50000', '173137514.75', 'Dr-Feb 24/309', '9100/006', 811),
(2138, '2024-02-19', '', '3600/001', 'Taxi Charges Car Driver for (19.2) 9:30 PM', '0', '4000', '173133514.75', 'Dr-Feb 24/310', '9100/002', 813),
(2139, '2024-02-19', '', '3600/001', 'Taxi Charges for WH to GFC for 2 Trucks (R.P) change', '0', '40000', '173093514.75', 'Dr-Feb 24/311', '9100/002', 815),
(2140, '2024-02-19', '', '3600/001', 'Labour 5 pcs and Taxi Charges for GFC (R.P) (56000+30000)', '0', '86000', '173007514.75', 'Dr-Feb 24/312', '6100/001', 817),
(2141, '2024-02-20', '', '3600/001', 'Sir Return paid to Daw Nan (1300000-630000=670000)', '670000', '0', '172677514.75', 'Cr-Feb 24/009', '9100/017', 819),
(2142, '2024-02-20', '', '3600/001', 'Loan Return from Best Brand (Bejon) transfer to UAB (Actual $25176*3480ks=87612480-8758227=Bank Chg;8753+Different 75500)', '87528227', '0', '260205741.75', 'Cr-Feb 24/010', '3300/001', 821),
(2143, '2024-02-20', '', '3600/001', 'Ice 3 pcs purchase for WH', '0', '27000', '260178741.75', 'Dr-Feb 24/313', '6100/002', 823),
(2144, '2024-02-20', '', '3600/001', 'Worker 9 pcs (OT) from Ocean Pacific', '0', '18000', '260160741.75', 'Dr-Feb 24/314', '6100/001', 825),
(2145, '2024-02-20', '', '3600/001', 'Water Purchase for WH', '0', '2700', '260158041.75', 'Dr-Feb 24/315', '9100/003', 827),
(2146, '2024-02-20', '', '3600/001', 'Car Charges for WH to GFC for Material Carry', '0', '40000', '260118041.75', 'Dr-Feb 24/316', '9100/002', 829),
(2147, '2024-02-20', '', '3600/001', 'Taxi Charges for WH to DOF office Meeting go', '0', '16000', '260102041.75', 'Dr-Feb 24/317', '9100/002', 831),
(2148, '2024-02-20', '', '3600/001', 'Document Copy Charges from DOF office', '0', '2000', '260100041.75', 'Dr-Feb 24/318', '9100/016', 833),
(2149, '2024-02-20', '', '3600/001', 'Penan Bag-345 ks and Other purchase and Taxi for WH', '0', '582100', '259517941.75', 'Dr-Feb 24/319', '6100/003', 835);
INSERT INTO `cashbook` (`id`, `date`, `sr_no`, `ac_name`, `particular`, `debit`, `credit`, `balance`, `voucher_no`, `crossac_name`, `transactionid`) VALUES
(2150, '2024-02-20', '', '3600/001', 'Phone Bill for Office', '0', '2000', '259515941.75', 'Dr-Feb 24/320', '9100/004', 837),
(2151, '2024-02-20', '', '3600/001', 'Paid to Thein Htay for Vr No-11359,11366 (Cheque No-052406)', '0', '4000000', '255515941.75', 'Dr-Feb 24/321', '4000/T02', 839),
(2152, '2024-02-20', '', '3600/001', 'Paid to Htay Win for Vr No-11010,11011,11060 (Cheque No-052407)', '0', '3000000', '252515941.75', 'Dr-Feb 24/322', '4000/H02', 841),
(2153, '2024-02-20', '', '3600/001', 'Paid to Zaw Myat Thu for Vr No-11361,11376 (Cheque No-052408)', '0', '10000000', '242515941.75', 'Dr-Feb 24/323', '4000/Z03', 843),
(2154, '2024-02-20', '', '3600/001', 'Paid to Plastic (G/F) for 16.2.24/17.2.24-165000/17.2.24-343500', '0', '3000000', '239515941.75', 'Dr-Feb 24/324', '6100/003', 845),
(2155, '2024-02-20', '', '3600/001', 'Taxi Charges for WH to Market go 18.2.24/20.2.24', '0', '24000', '239491941.75', 'Dr-Feb 24/325', '9100/002', 847),
(2156, '2024-02-20', '', '3600/001', 'Meal allowance for Market Boys', '0', '11000', '239480941.75', 'Dr-Feb 24/326', '9100/012', 849),
(2157, '2024-02-20', '', '3600/001', 'Labour Charges for Market Fish', '0', '6000', '239474941.75', 'Dr-Feb 24/327', '6100/001', 851),
(2158, '2024-02-20', '', '3600/001', 'Ice 2 pcs purchase for Market Fish', '0', '22000', '239452941.75', 'Dr-Feb 24/328', '6100/002', 853),
(2159, '2024-02-20', '', '3600/001', 'Labour Charges for Market Fish 18.2.24/20.2.24', '0', '4000', '239448941.75', 'Dr-Feb 24/329', '6100/001', 855),
(2160, '2024-02-19', '', '3600/001', 'asdfasdf', '0', '1000000', '172007514.75', 'JJJJJ', '6100/001', 857);

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
(54, 0, 'debit', '5400', '0', 'Dr-Feb 24/001', 0),
(55, 0, 'credit', '5400', '0', 'Dr-Feb 24/001', 0),
(58, 0, 'debit', '39000', '0', 'Dr-Feb 24/002', 0),
(59, 0, 'credit', '39000', '0', 'Dr-Feb 24/002', 0),
(60, 0, 'debit', '14000', '0', 'Dr Feb\'24/003', 0),
(61, 0, 'credit', '14000', '0', 'Dr Feb\'24/003', 0),
(62, 0, 'debit', '80000', '0', 'Dr Feb\'24/004', 0),
(63, 0, 'credit', '80000', '0', 'Dr Feb\'24/004', 0),
(64, 0, 'debit', '50000', '0', 'Dr Feb\'24/005', 0),
(65, 0, 'credit', '50000', '0', 'Dr Feb\'24/005', 0),
(66, 0, 'debit', '50000', '0', 'Dr Feb\'24/006', 0),
(67, 0, 'credit', '50000', '0', 'Dr Feb\'24/006', 0),
(68, 0, 'debit', '89928700', '0', 'Dr Feb\'24/007', 0),
(69, 0, 'credit', '89928700', '0', 'Dr Feb\'24/007', 0),
(70, 0, 'debit', '377000', '0', 'Dr Feb\'24/008', 0),
(71, 0, 'credit', '377000', '0', 'Dr Feb\'24/008', 0),
(76, 0, 'debit', '100000', '0', 'Dr Feb\'24/009', 0),
(77, 0, 'credit', '100000', '0', 'Dr Feb\'24/009', 0),
(78, 0, 'debit', '1500', '0', 'Dr Feb\'24/010', 0),
(79, 0, 'credit', '1500', '0', 'Dr Feb\'24/010', 0),
(80, 0, 'debit', '17754000', '0', 'Dr Feb\'24/011', 0),
(81, 0, 'credit', '17754000', '0', 'Dr Feb\'24/011', 0),
(82, 0, 'debit', '17351000', '0', 'Dr Feb\'24/011', 0),
(83, 0, 'credit', '17351000', '0', 'Dr Feb\'24/011', 0),
(84, 0, 'debit', '3000000', '0', 'Dr Feb\'24/012', 0),
(85, 0, 'credit', '3000000', '0', 'Dr Feb\'24/012', 0),
(86, 0, 'debit', '15000', '0', 'Dr Feb\'24/013', 0),
(87, 0, 'credit', '15000', '0', 'Dr Feb\'24/013', 0),
(88, 0, 'debit', '52500', '0', 'Dr Feb\'24/014', 0),
(89, 0, 'credit', '52500', '0', 'Dr Feb\'24/014', 0),
(90, 0, 'debit', '289000', '0', 'Dr Feb\'24/014', 0),
(91, 0, 'credit', '289000', '0', 'Dr Feb\'24/014', 0),
(92, 0, 'debit', '90000', '0', 'Dr Feb\'24/016', 0),
(93, 0, 'credit', '90000', '0', 'Dr Feb\'24/016', 0),
(94, 0, 'debit', '170000', '0', 'Dr Feb\'24/017', 0),
(95, 0, 'credit', '170000', '0', 'Dr Feb\'24/017', 0),
(96, 0, 'debit', '43000', '0', 'Dr Feb\'24/018', 0),
(97, 0, 'credit', '43000', '0', 'Dr Feb\'24/018', 0),
(98, 0, 'debit', '130000', '0', 'Dr Feb\'24/019', 0),
(99, 0, 'credit', '130000', '0', 'Dr Feb\'24/019', 0),
(100, 0, 'debit', '62000', '0', 'Dr Feb\'24/020', 0),
(101, 0, 'credit', '62000', '0', 'Dr Feb\'24/020', 0),
(102, 0, 'debit', '85000', '0', 'Dr Feb\'24/021', 0),
(103, 0, 'credit', '85000', '0', 'Dr Feb\'24/021', 0),
(104, 0, 'debit', '7000', '0', 'Dr Feb\'24/022', 0),
(105, 0, 'credit', '7000', '0', 'Dr Feb\'24/022', 0),
(106, 0, 'debit', '814500', '0', 'Dr Feb\'24/023', 0),
(107, 0, 'credit', '814500', '0', 'Dr Feb\'24/023', 0),
(108, 0, 'debit', '42000', '0', 'Dr Feb\'24/024', 0),
(109, 0, 'credit', '42000', '0', 'Dr Feb\'24/024', 0),
(110, 0, 'debit', '4000000', '0', 'Dr Feb\'24/025', 0),
(111, 0, 'credit', '4000000', '0', 'Dr Feb\'24/025', 0),
(112, 0, '', '0', '0', '', 0),
(115, 0, 'debit', '5000000', '0', 'Dr-Feb\'24/026', 0),
(116, 0, 'credit', '5000000', '0', 'Dr-Feb\'24/026', 0),
(117, 0, 'debit', '3400000', '0', 'Dr-Fed 24/027', 0),
(118, 0, 'credit', '3400000', '0', 'Dr-Fed 24/027', 0),
(119, 0, 'debit', '5000000', '0', 'Dr-Fed 24/028', 0),
(120, 0, 'credit', '5000000', '0', 'Dr-Feb 24/028', 0),
(121, 0, '', '0', '0', 'Dr-Feb 24/028', 0),
(122, 0, 'debit', '5000000', '0', 'Dr-Feb 24/029', 0),
(123, 0, 'credit', '5000000', '0', 'Dr-Feb 24/029', 0),
(124, 1, 'debit', '151492', '151492.37', 'SAF-001', 0),
(125, 1, 'credit', '151492', '151492.37', 'SAF-001', 0),
(126, 0, 'debit', '444200', '0', 'Dr-Feb 24/030', 0),
(127, 1, 'debit', '116818', '116818.20', 'SAF-002', 0),
(128, 0, 'credit', '444200', '0', 'Dr-Feb 24/030', 0),
(129, 1, 'credit', '116818', '116818.20', 'SAF-002', 0),
(130, 0, 'debit', '3500000', '0', 'Dr-Feb 24/031', 0),
(131, 0, '', '0', '0', 'Dr-Feb 24/031', 0),
(132, 1, 'debit', '87343', '87343.73', 'SAF-003', 0),
(133, 1, 'credit', '87343', '87343.73', 'SAF-003', 0),
(134, 1, 'debit', '92746', '92746.57', 'SAF-004', 0),
(135, 0, 'credit', '3500000', '0', 'Dr-Feb 24/031', 0),
(136, 1, 'credit', '92746', '92746.57', 'SAF-004', 0),
(137, 0, 'debit', '4000000', '0', 'Dr-Feb 24/032', 0),
(138, 0, 'credit', '4000000', '0', 'Dr-Feb 24/032', 0),
(139, 1, 'debit', '98874', '98874.20', 'SAF-005', 0),
(140, 1, 'credit', '98874', '98874.20', 'SAF-005', 0),
(141, 1, 'debit', '95217', '95217.11', 'SAF-006', 0),
(142, 1, 'credit', '95217', '95217.11', 'SAF-006', 0),
(143, 1, 'debit', '66774', '66774.05', 'SAF-007', 0),
(144, 1, 'credit', '66774', '66774.05', 'SAF-007', 0),
(145, 1, 'debit', '91268', '91268.45', 'SAF-008', 0),
(146, 1, 'credit', '91268', '91268.45', 'SAF-008', 0),
(147, 1, 'debit', '105649', '105649.44', 'SAF-009', 0),
(148, 1, 'credit', '105649', '105649.44', 'SAF-009', 0),
(149, 0, 'debit', '39500', '0', 'Dr Feb\'24/033', 0),
(150, 0, 'credit', '39500', '0', 'Dr Feb\'24/033', 0),
(151, 0, 'debit', '10000', '0', 'Dr-Feb 24/034', 0),
(152, 0, 'credit', '10000', '0', 'Dr-Feb 24/034', 0),
(153, 0, 'debit', '80000', '0', 'Dr-Feb 24/035', 0),
(154, 0, 'credit', '80000', '0', 'Dr-Feb 24/035', 0),
(155, 0, 'debit', '1697000', '0', 'Dr-Feb 24/036', 0),
(156, 0, 'credit', '1697000', '0', 'Dr-Feb 24/036', 0),
(157, 0, 'debit', '6000', '0', 'Dr-Feb 24/037', 0),
(158, 0, 'credit', '6000', '0', 'Dr-Feb 24/037', 0),
(162, 1, 'balance', '0', '136750.69', 'Closing Balance From SAF-18/2023', 0),
(164, 1, 'balance', '0', '-34007.64', 'Closing Balance Adv; Received From 01/2024', 0),
(165, 1, 'balance', '0', '46969.36', 'Closing Balance from Italy -01/2024', 0),
(166, 1, 'balance', '0', '-33410', 'Closing Balance Adv;from KOLKATA', 0),
(200, 2100, 'debit', '78650250', '37452.5', 'Cr-Feb 24/001', 188),
(201, 3480, 'credit', '130665300', '37547.5', 'Cr-Feb 24/001', 189),
(202, 3480, 'debit', '130665300', '37547.5', 'Cr-Feb 24/001', 190),
(203, 3480, 'credit', '130665300', '37547.5', 'Cr-Feb 24/001', 191),
(206, 0, 'debit', '4000000', '0', 'Dr-Feb 24/038', 192),
(207, 0, 'credit', '4000000', '0', 'Dr-Feb 24/038', 193),
(211, 0, 'debit', '4000000', '0', 'Dr-Feb 24/039', 194),
(212, 0, 'credit', '4000000', '0', 'Dr-Feb 24/039', 195),
(213, 0, 'debit', '7000000', '0', 'Dr-Feb 24/040', 196),
(214, 0, 'credit', '7000000', '0', 'Dr-Feb 24/040', 197),
(215, 0, 'debit', '100000', '0', 'Dr-Feb 24/041', 198),
(216, 0, 'credit', '100000', '0', 'Dr-Feb 24/041', 199),
(217, 0, 'debit', '10000', '0', 'Dr-Feb 24/042', 200),
(218, 0, 'credit', '10000', '0', 'Dr-Feb 24/042', 201),
(219, 0, 'debit', '8000', '0', 'Dr-Feb 24/043', 202),
(220, 0, 'credit', '8000', '0', 'Dr-Feb 24/043', 203),
(221, 0, 'debit', '2112000', '0', 'Dr-Feb 24/044', 204),
(222, 0, 'credit', '2112000', '0', 'Dr-Feb 24/044', 205),
(223, 0, 'debit', '2193960', '0', 'Dr-Feb 24/045', 206),
(224, 0, 'credit', '2193960', '0', 'Dr-Feb 24/045', 207),
(225, 0, 'debit', '10000000', '0', 'Dr-Feb 24/046', 208),
(226, 0, 'credit', '10000000', '0', 'Dr-Feb 24/046', 209),
(227, 0, 'debit', '5730540', '0', 'Dr-Feb 24/047', 210),
(228, 0, 'credit', '5730540', '0', 'Dr-Feb 24/047', 211),
(229, 0, 'debit', '435000', '0', 'Dr-Feb 24/048', 212),
(230, 0, 'credit', '435000', '0', 'Dr-Feb 24/048', 213),
(231, 0, 'debit', '2000000', '0', 'Dr-Feb 24/049', 214),
(232, 0, 'credit', '2000000', '0', 'Dr-Feb 24/049', 215),
(233, 0, 'debit', '1800', '0', 'Dr-Feb 24/050', 216),
(234, 0, 'credit', '1800', '0', 'Dr-Feb 24/050', 217),
(235, 0, 'debit', '27000', '0', 'Dr-Feb 24/051', 218),
(236, 0, 'credit', '27000', '0', 'Dr-Feb 24/051', 219),
(237, 0, 'debit', '124200', '0', 'Dr-Feb 24/052', 220),
(238, 0, 'credit', '124200', '0', 'Dr-Feb 24/052', 221),
(239, 0, 'debit', '17000', '0', 'Dr-Feb 24/053', 222),
(240, 0, 'credit', '17000', '0', 'Dr-Feb 24/053', 223),
(241, 0, 'debit', '106800', '0', 'Dr-Feb 24/054', 224),
(242, 0, 'credit', '106800', '0', 'Dr-Feb 24/054', 225),
(244, 0, 'debit', '36000', '0', 'Dr-Feb 24/055', 226),
(245, 0, 'credit', '36000', '0', 'Dr-Feb 24/055', 227),
(246, 0, 'debit', '17000', '0', 'Dr-Feb 24/056', 228),
(247, 0, 'credit', '17000', '0', 'Dr-Feb 24/056', 229),
(248, 0, 'debit', '30000', '0', 'Dr-Feb 24/057', 230),
(249, 0, 'credit', '30000', '0', 'Dr-Feb 24/057', 231),
(250, 0, 'debit', '10000', '0', 'Dr-Feb 24/058', 232),
(251, 0, 'credit', '10000', '0', 'Dr-Feb 24/058', 233),
(252, 0, 'debit', '519600', '0', 'Dr-Feb 24/059', 234),
(253, 0, 'credit', '519600', '0', 'Dr-Feb 24/059', 235),
(254, 0, 'debit', '95850', '0', 'Dr-Feb 24/060', 236),
(255, 0, 'credit', '95850', '0', 'Dr-Feb 24/060', 237),
(257, 0, 'debit', '1800', '0', 'Dr-Feb 24/061', 238),
(258, 0, 'credit', '1800', '0', 'Dr-Feb 24/061', 239),
(259, 0, 'debit', '100000', '0', 'Dr-Feb 24/062', 240),
(260, 0, 'credit', '100000', '0', 'Dr-Feb 24/062', 241),
(261, 0, 'debit', '5000', '0', 'Dr-Feb 24/063', 242),
(262, 0, 'credit', '5000', '0', 'Dr-Feb 24/063', 243),
(263, 0, 'debit', '17000', '0', 'Dr-Feb 24/064', 244),
(264, 0, 'credit', '17000', '0', 'Dr-Feb 24/064', 245),
(265, 0, 'debit', '31500', '0', 'Dr-Feb 24/065', 246),
(266, 0, 'credit', '31500', '0', 'Dr-Feb 24/065', 247),
(267, 0, 'debit', '107500', '0', 'Dr-Feb 24/066', 248),
(268, 0, 'credit', '107500', '0', 'Dr-Feb 24/066', 249),
(269, 0, 'debit', '15000', '0', 'Dr-Feb 24/067', 250),
(270, 0, 'credit', '15000', '0', 'Dr-Feb 24/067', 251),
(271, 0, 'debit', '24000', '0', 'Dr-Feb 24/068', 252),
(272, 0, 'credit', '24000', '0', 'Dr-Feb 24/068', 253),
(273, 0, 'debit', '12503950', '0', 'Dr-Feb 24/069', 254),
(274, 0, 'credit', '12503950', '0', 'Dr-Feb 24/069', 255),
(275, 2100, 'debit', '42884814', '20421.34', 'Cr-Feb 24/003', 256),
(276, 2100, 'credit', '42884814', '20421.34', 'Cr-Feb 24/003', 257),
(277, 3475, 'debit', '71033656.5', '20441.34', 'Cr-Feb 24/003', 258),
(278, 3475, 'credit', '71033656.5', '20441.34', 'Cr-Feb 24/003', 259),
(279, 2100, 'debit', '49250250', '23452.5', 'Cr-Feb 24/004', 260),
(280, 2100, 'credit', '49250250', '23452.5', 'Cr-Feb 24/004', 261),
(285, 0, 'debit', '117800', '0', 'Dr Feb 24/070', 266),
(286, 0, 'credit', '117800', '0', 'Dr Feb 24/070', 267),
(287, 0, 'debit', '137000', '0', 'Dr Feb 24/071', 268),
(288, 0, 'credit', '137000', '0', 'Dr Feb 24/071', 269),
(289, 0, 'debit', '93000', '0', 'Dr Feb 24/072', 270),
(290, 0, 'credit', '93000', '0', 'Dr Feb 24/072', 271),
(291, 0, 'debit', '27000', '0', 'Dr Feb 24/073', 272),
(292, 0, 'credit', '27000', '0', 'Dr Feb 24/073', 273),
(293, 0, 'debit', '24000', '0', 'Dr Feb 24/074', 274),
(294, 0, 'credit', '24000', '0', 'Dr Feb 24/074', 275),
(295, 0, 'debit', '7000', '0', 'Dr Feb 24/075', 276),
(296, 0, 'credit', '7000', '0', 'Dr Feb 24/075', 277),
(297, 0, 'debit', '10000', '0', 'Dr Feb 24/076', 278),
(298, 0, 'credit', '10000', '0', 'Dr Feb 24/076', 279),
(299, 0, 'debit', '6000', '0', 'Dr Feb 24/077', 280),
(300, 0, 'credit', '6000', '0', 'Dr Feb 24/077', 281),
(301, 0, 'debit', '60375', '0', 'Dr Feb 24/078', 282),
(302, 0, 'credit', '60375', '0', 'Dr Feb 24/078', 283),
(303, 0, 'debit', '79800', '0', 'Dr Feb 24/079', 284),
(304, 0, 'credit', '79800', '0', 'Dr Feb 24/079', 285),
(305, 0, 'debit', '50000', '0', 'Dr Feb 24/080', 286),
(306, 0, 'credit', '50000', '0', 'Dr Feb 24/080', 287),
(307, 0, 'debit', '20000', '0', 'Dr Feb 24/081', 288),
(308, 0, 'credit', '20000', '0', 'Dr Feb 24/081', 289),
(309, 0, 'debit', '138000', '0', 'Dr Feb 24/082', 290),
(310, 0, 'credit', '138000', '0', 'Dr Feb 24/082', 291),
(311, 0, 'debit', '9000', '0', 'Dr Feb 24/083', 292),
(312, 0, 'credit', '9000', '0', 'Dr Feb 24/083', 293),
(313, 0, 'debit', '17000', '0', 'Dr Feb 24/084', 294),
(314, 0, 'credit', '17000', '0', 'Dr Feb 24/084', 295),
(315, 0, 'debit', '160000', '0', 'Dr Feb 24/085', 296),
(316, 0, 'credit', '160000', '0', 'Dr Feb 24/085', 297),
(317, 0, 'debit', '10000', '0', 'Dr Feb 24/086', 298),
(318, 0, 'credit', '10000', '0', 'Dr Feb 24/086', 299),
(319, 0, 'debit', '4000000', '0', 'Dr Feb 24/087', 300),
(320, 0, 'credit', '4000000', '0', 'Dr Feb 24/087', 301),
(321, 0, 'debit', '6754402', '0', 'Dr Feb 24/088', 302),
(322, 0, 'credit', '6754402', '0', 'Dr Feb 24/088', 303),
(323, 0, 'debit', '24000', '0', 'Dr Feb 24/089', 304),
(324, 0, 'credit', '24000', '0', 'Dr Feb 24/089', 305),
(325, 0, 'debit', '60000000', '0', 'Dr Feb 24/090', 306),
(326, 0, 'credit', '60000000', '0', 'Dr Feb 24/090', 307),
(327, 0, 'debit', '30000000', '0', 'Dr Feb 24/091', 308),
(328, 0, 'credit', '30000000', '0', 'Dr Feb 24/091', 309),
(329, 0, 'debit', '5000000', '0', 'Dr Feb 24/092', 310),
(330, 0, 'credit', '5000000', '0', 'Dr Feb 24/092', 311),
(331, 0, 'debit', '4000000', '0', 'Dr Feb 24/093', 312),
(332, 0, 'credit', '4000000', '0', 'Dr Feb 24/093', 313),
(333, 0, 'debit', '3000000', '0', 'Dr Feb 24/094', 314),
(334, 0, 'credit', '3000000', '0', 'Dr Feb 24/094', 315),
(335, 0, 'debit', '7000000', '0', 'Dr Feb 24/095', 316),
(336, 0, 'credit', '7000000', '0', 'Dr Feb 24/095', 317),
(337, 0, 'debit', '5000000', '0', 'Dr Feb 24/096', 318),
(338, 0, 'credit', '5000000', '0', 'Dr Feb 24/096', 319),
(339, 0, 'debit', '3000000', '0', 'Dr Feb 24/097', 320),
(340, 0, 'credit', '3000000', '0', 'Dr Feb 24/097', 321),
(341, 0, 'debit', '4000000', '0', 'Dr Feb 24/098', 322),
(342, 0, 'credit', '4000000', '0', 'Dr Feb 24/098', 323),
(343, 0, 'debit', '3000000', '0', 'Dr Feb 24/099', 324),
(344, 0, 'credit', '3000000', '0', 'Dr Feb 24/099', 325),
(345, 0, 'debit', '5000000', '0', 'Dr Feb 24/100', 326),
(346, 0, 'credit', '5000000', '0', 'Dr Feb 24/100', 327),
(347, 0, 'debit', '3000000', '0', 'Dr Feb 24/101', 328),
(348, 0, 'credit', '3000000', '0', 'Dr Feb 24/101', 329),
(349, 0, 'debit', '7000000', '0', 'Dr Feb 24/102', 330),
(350, 0, 'credit', '7000000', '0', 'Dr Feb 24/102', 331),
(351, 0, 'debit', '4000000', '0', 'Dr Feb 24/103', 332),
(352, 0, 'credit', '4000000', '0', 'Dr Feb 24/103', 333),
(353, 0, 'debit', '4000000', '0', 'Dr Feb 24/104', 334),
(354, 0, 'credit', '4000000', '0', 'Dr Feb 24/104', 335),
(355, 0, 'debit', '4000000', '0', 'Dr Feb 24/105', 336),
(356, 0, 'credit', '4000000', '0', 'Dr Feb 24/105', 337),
(357, 0, 'debit', '5000000', '0', 'Dr Feb 24/106', 338),
(358, 0, 'credit', '5000000', '0', 'Dr Feb 24/106', 339),
(359, 0, 'debit', '20000000', '0', 'Dr Feb 24/107', 340),
(360, 0, 'credit', '20000000', '0', 'Dr Feb 24/107', 341),
(361, 0, 'debit', '5000000', '0', 'Dr Feb 24/108', 342),
(362, 0, 'credit', '5000000', '0', 'Dr Feb 24/108', 343),
(363, 0, 'debit', '30000000', '0', 'Dr Feb 24/109', 344),
(364, 0, 'credit', '30000000', '0', 'Dr Feb 24/109', 345),
(365, 0, 'debit', '4000000', '0', 'Dr Feb 24/110', 346),
(366, 0, 'credit', '4000000', '0', 'Dr Feb 24/110', 347),
(367, 0, 'debit', '30000000', '0', 'Dr Feb 24/111', 348),
(368, 0, 'credit', '30000000', '0', 'Dr Feb 24/111', 349),
(369, 0, 'debit', '3352700', '0', 'Dr Feb 24/112', 350),
(370, 0, 'credit', '3352700', '0', 'Dr Feb 24/112', 351),
(371, 0, 'debit', '4000000', '0', 'Dr Feb 24/113', 352),
(372, 0, 'credit', '4000000', '0', 'Dr Feb 24/113', 353),
(373, 0, 'debit', '5472850', '0', 'Dr Feb 24/114', 354),
(374, 0, 'credit', '5472850', '0', 'Dr Feb 24/114', 355),
(375, 0, 'debit', '18000', '0', 'Dr Feb 24/115', 356),
(376, 0, 'credit', '18000', '0', 'Dr Feb 24/115', 357),
(377, 0, 'debit', '8000', '0', 'Dr Feb 24/116', 358),
(378, 0, 'credit', '8000', '0', 'Dr Feb 24/116', 359),
(379, 0, 'debit', '13000', '0', 'Dr Feb 24/117', 360),
(380, 0, 'credit', '13000', '0', 'Dr Feb 24/117', 361),
(381, 0, 'debit', '55000', '0', 'Dr Feb 24/118', 362),
(382, 0, 'credit', '55000', '0', 'Dr Feb 24/118', 363),
(383, 0, 'debit', '40000', '0', 'Dr Feb 24/119', 364),
(384, 0, 'credit', '40000', '0', 'Dr Feb 24/119', 365),
(385, 0, 'debit', '1438250', '0', 'Dr Feb 24/120', 366),
(386, 0, 'credit', '1438250', '0', 'Dr Feb 24/120', 367),
(387, 0, 'debit', '3600', '0', 'Dr Feb 24/121', 368),
(388, 0, 'credit', '3600', '0', 'Dr Feb 24/121', 369),
(389, 0, 'debit', '69000', '0', 'Dr Feb 24/122', 370),
(390, 0, 'credit', '69000', '0', 'Dr Feb 24/122', 371),
(391, 0, 'debit', '50000', '0', 'Dr Feb 24/123', 372),
(392, 0, 'credit', '50000', '0', 'Dr Feb 24/123', 373),
(393, 0, 'debit', '5000', '0', 'Dr Feb 24/124', 374),
(394, 0, 'credit', '5000', '0', 'Dr Feb 24/124', 375),
(395, 0, 'debit', '100000', '0', 'Dr Feb 24/125', 376),
(396, 0, 'credit', '100000', '0', 'Dr Feb 24/125', 377),
(397, 0, 'debit', '6000', '0', 'Dr Feb 24/126', 378),
(398, 0, 'credit', '6000', '0', 'Dr Feb 24/126', 379),
(399, 0, 'debit', '16000', '0', 'Dr Feb 24/127', 380),
(400, 0, 'credit', '16000', '0', 'Dr Feb 24/127', 381),
(401, 0, 'debit', '77000', '0', 'Dr Feb 24/128', 382),
(402, 0, 'credit', '77000', '0', 'Dr Feb 24/128', 383),
(403, 0, 'debit', '2000', '0', 'Dr Feb 24/129', 384),
(404, 0, 'credit', '2000', '0', 'Dr Feb 24/129', 385),
(405, 0, 'debit', '3000', '0', 'Dr Feb 24/130', 386),
(406, 0, 'credit', '3000', '0', 'Dr Feb 24/130', 387),
(407, 0, 'debit', '6000000', '0', 'Dr Feb 24/131', 388),
(408, 0, 'credit', '6000000', '0', 'Dr Feb 24/131', 389),
(409, 0, 'debit', '120000', '0', 'Dr Feb 24/132', 390),
(410, 0, 'credit', '120000', '0', 'Dr Feb 24/132', 391),
(411, 0, 'debit', '26000', '0', 'Dr Feb 24/133', 392),
(412, 0, 'credit', '26000', '0', 'Dr Feb 24/133', 393),
(413, 0, 'debit', '50000', '0', 'Dr Feb 24/134', 394),
(414, 0, 'credit', '50000', '0', 'Dr Feb 24/134', 395),
(415, 0, 'debit', '10000', '0', 'Dr Feb 24/135', 396),
(416, 0, 'credit', '10000', '0', 'Dr Feb 24/135', 397),
(417, 0, 'debit', '111000', '0', 'Dr Feb 24/136', 398),
(418, 0, 'credit', '111000', '0', 'Dr Feb 24/136', 399),
(419, 0, 'debit', '36000', '0', 'Dr Feb 24/137', 400),
(420, 0, 'credit', '36000', '0', 'Dr Feb 24/137', 401),
(421, 0, 'debit', '17000', '0', 'Dr Feb 24/138', 402),
(422, 0, 'credit', '17000', '0', 'Dr Feb 24/138', 403),
(423, 0, 'debit', '2000', '0', 'Dr Feb 24/139', 404),
(424, 0, 'credit', '2000', '0', 'Dr Feb 24/139', 405),
(425, 0, 'debit', '6000', '0', 'Dr Feb 24/140', 406),
(426, 0, 'credit', '6000', '0', 'Dr Feb 24/140', 407),
(427, 0, 'debit', '16000', '0', 'Dr Feb 24/141', 408),
(428, 0, 'credit', '16000', '0', 'Dr Feb 24/141', 409),
(429, 0, 'debit', '33000', '0', 'Dr Feb 24/142', 410),
(430, 0, 'credit', '33000', '0', 'Dr Feb 24/142', 411),
(431, 0, 'debit', '50000', '0', 'Dr Feb 24/143', 412),
(432, 0, 'credit', '50000', '0', 'Dr Feb 24/143', 413),
(433, 0, 'debit', '22000', '0', 'Dr Feb 24/144', 414),
(434, 0, 'credit', '22000', '0', 'Dr Feb 24/144', 415),
(435, 0, 'debit', '3000', '0', 'Dr Feb 24/145', 416),
(436, 0, 'credit', '3000', '0', 'Dr Feb 24/145', 417),
(437, 0, 'debit', '5000', '0', 'Dr Feb 24/146', 418),
(438, 0, 'credit', '5000', '0', 'Dr Feb 24/146', 419),
(439, 0, 'debit', '5000', '0', 'Dr Feb 24/147', 420),
(440, 0, 'credit', '5000', '0', 'Dr Feb 24/147', 421),
(441, 0, 'debit', '13000', '0', 'Dr Feb 24/148', 422),
(442, 0, 'credit', '13000', '0', 'Dr Feb 24/148', 423),
(443, 0, 'debit', '15000', '0', 'Dr Feb 24/149', 424),
(444, 0, 'credit', '15000', '0', 'Dr Feb 24/149', 425),
(445, 0, 'debit', '4000', '0', 'Dr Feb 24/150', 426),
(446, 0, 'credit', '4000', '0', 'Dr Feb 24/150', 427),
(447, 0, 'debit', '158000', '0', 'Dr Feb 24/151', 428),
(448, 0, 'credit', '158000', '0', 'Dr Feb 24/151', 429),
(449, 0, 'debit', '18000', '0', 'Dr Feb 24/152', 430),
(450, 0, 'credit', '18000', '0', 'Dr Feb 24/152', 431),
(451, 0, 'debit', '12000', '0', 'Dr Feb 24/153', 432),
(452, 0, 'credit', '12000', '0', 'Dr Feb 24/153', 433),
(453, 0, 'debit', '40000000', '0', 'Dr Feb 24/154', 434),
(454, 0, 'credit', '40000000', '0', 'Dr Feb 24/154', 435),
(455, 0, 'debit', '27000', '0', 'Dr Feb 24/155', 436),
(456, 0, 'credit', '27000', '0', 'Dr Feb 24/155', 437),
(457, 0, 'debit', '10500', '0', 'Dr Feb 24/156', 438),
(458, 0, 'credit', '10500', '0', 'Dr Feb 24/156', 439),
(459, 0, 'debit', '23000', '0', 'Dr Feb 24/157', 440),
(460, 0, 'credit', '23000', '0', 'Dr Feb 24/157', 441),
(461, 0, 'debit', '66000', '0', 'Dr Feb 24/158', 442),
(462, 0, 'credit', '66000', '0', 'Dr Feb 24/158', 443),
(463, 0, 'debit', '7000', '0', 'Dr Feb 24/159', 444),
(464, 0, 'credit', '7000', '0', 'Dr Feb 24/159', 445),
(465, 1, 'debit', '23462.5', '23462.5', 'Cr-Feb 24/004', 446),
(466, 1, 'credit', '23462.5', '23462.5', 'Cr-Feb 24/004', 447),
(473, 2100, 'debit', '65368800', '31128', 'Cr-Feb 24/005', 454),
(474, 2100, 'credit', '65368800', '31128', 'Cr-Feb 24/005', 455),
(475, 3475, 'debit', '56923349.5', '16380.82', 'Cr-Feb 24/005', 456),
(476, 3475, 'credit', '56923349.5', '16380.82', 'Cr-Feb 24/005', 457),
(477, 0, 'debit', '150000', '0', 'Dr-Feb 24/160', 458),
(478, 0, 'credit', '150000', '0', 'Dr-Feb 24/160', 459),
(479, 0, 'debit', '1112614', '0', 'Dr-Feb 24/161', 460),
(480, 0, 'credit', '1112614', '0', 'Dr-Feb 24/161', 461),
(481, 0, 'debit', '306000', '0', 'Dr-Feb 24/162', 462),
(482, 0, 'credit', '306000', '0', 'Dr-Feb 24/162', 463),
(483, 0, 'debit', '473750', '0', 'Dr-Feb 24/163', 464),
(484, 0, 'credit', '473750', '0', 'Dr-Feb 24/163', 465),
(485, 0, 'debit', '4500', '0', 'Dr-Feb 24/164', 466),
(486, 0, 'credit', '4500', '0', 'Dr-Feb 24/164', 467),
(487, 0, 'debit', '2163000', '0', 'Dr-Feb 24/165', 468),
(488, 0, 'credit', '2163000', '0', 'Dr-Feb 24/165', 469),
(489, 0, 'debit', '34000', '0', 'Dr-Feb 24/166', 470),
(490, 0, 'credit', '34000', '0', 'Dr-Feb 24/166', 471),
(491, 0, 'debit', '832250', '0', 'Dr-Feb 24/167', 472),
(492, 0, 'credit', '832250', '0', 'Dr-Feb 24/167', 473),
(493, 0, 'debit', '20000', '0', 'Dr-Feb 24/168', 474),
(494, 0, 'credit', '20000', '0', 'Dr-Feb 24/168', 475),
(495, 0, 'debit', '160000', '0', 'Dr-Feb 24/169', 476),
(496, 0, 'credit', '160000', '0', 'Dr-Feb 24/169', 477),
(497, 0, 'debit', '70000', '0', 'Dr-Feb 24/170', 478),
(498, 0, 'credit', '70000', '0', 'Dr-Feb 24/170', 479),
(499, 0, 'debit', '31600', '0', 'Dr-Feb 24/171', 480),
(500, 0, 'credit', '31600', '0', 'Dr-Feb 24/171', 481),
(501, 0, 'debit', '10500', '0', 'Dr-Feb 24/172', 482),
(502, 0, 'credit', '10500', '0', 'Dr-Feb 24/172', 483),
(503, 0, 'debit', '2000', '0', 'Dr-Feb 24/173', 484),
(504, 0, 'credit', '2000', '0', 'Dr-Feb 24/173', 485),
(505, 0, 'debit', '12500', '0', 'Dr-Feb 24/174', 486),
(506, 0, 'credit', '12500', '0', 'Dr-Feb 24/174', 487),
(507, 0, 'debit', '38500', '0', 'Dr-Feb 24/175', 488),
(508, 0, 'credit', '38500', '0', 'Dr-Feb 24/175', 489),
(509, 0, 'debit', '3000', '0', 'Dr-Feb 24/176', 490),
(510, 0, 'credit', '3000', '0', 'Dr-Feb 24/176', 491),
(511, 0, 'debit', '5000', '0', 'Dr-Feb 24/177', 492),
(512, 0, 'credit', '5000', '0', 'Dr-Feb 24/177', 493),
(513, 0, 'debit', '8883000', '0', 'Dr-Feb 24/178', 494),
(514, 0, 'credit', '8883000', '0', 'Dr-Feb 24/178', 495),
(515, 0, 'debit', '62000', '0', 'Dr-Feb 24/179', 496),
(516, 0, 'credit', '62000', '0', 'Dr-Feb 24/179', 497),
(517, 0, 'debit', '21000', '0', 'Dr-Feb 24/180', 498),
(518, 0, 'credit', '21000', '0', 'Dr-Feb 24/180', 499),
(519, 0, 'debit', '200000', '0', 'Dr-Feb 24/181', 500),
(520, 0, 'credit', '200000', '0', 'Dr-Feb 24/181', 501),
(521, 0, 'debit', '40000000', '0', 'Dr-Feb 24/182', 502),
(522, 0, 'credit', '40000000', '0', 'Dr-Feb 24/182', 503),
(523, 0, 'debit', '6000000', '0', 'Dr-Feb 24/183', 504),
(524, 0, 'credit', '6000000', '0', 'Dr-Feb 24/183', 505),
(525, 0, 'debit', '10500', '0', 'Dr-Feb 24/184', 506),
(526, 0, 'credit', '10500', '0', 'Dr-Feb 24/184', 507),
(527, 0, 'debit', '2000', '0', 'Dr-Feb 24/185', 508),
(528, 0, 'credit', '2000', '0', 'Dr-Feb 24/185', 509),
(529, 0, 'debit', '8000', '0', 'Dr-Feb 24/186', 510),
(530, 0, 'credit', '8000', '0', 'Dr-Feb 24/186', 511),
(531, 0, 'debit', '22000', '0', 'Dr-Feb 24/187', 512),
(532, 0, 'credit', '22000', '0', 'Dr-Feb 24/187', 513),
(543, 3475, 'debit', '41700000', '12000', 'Cr-Feb 24/006', 524),
(544, 3475, 'credit', '41700000', '12000', 'Cr-Feb 24/006', 525),
(545, 3475, 'debit', '39832187.5', '11462.5', 'Cr-Feb 24/006', 526),
(546, 3475, 'credit', '39832187.5', '11462.5', 'Cr-Feb 24/006', 527),
(547, 3475, 'debit', '95236475.5', '27406.18', 'Cr-Feb 24/006', 528),
(548, 3475, 'credit', '95236475.5', '27406.18', 'Cr-Feb 24/006', 529),
(549, 2100, 'debit', '55048875', '26213.75', 'Cr-Feb 24/007', 530),
(550, 2100, 'credit', '55048875', '26213.75', 'Cr-Feb 24/007', 531),
(551, 3475, 'debit', '169236843.75', '48701.25', 'Cr-Feb 24/007', 532),
(552, 3475, 'credit', '169236843.75', '48701.25', 'Cr-Feb 24/007', 533),
(553, 2100, 'debit', '684957', '326.17', 'Cr-Feb 24/008', 534),
(554, 2100, 'credit', '684957', '326.17', 'Cr-Feb 24/008', 535),
(555, 1, 'debit', '634.31', '634.31', 'Cr-Feb 24/008', 536),
(556, 1, 'credit', '634.31', '634.31', 'Cr-Feb 24/008', 537),
(557, 0, 'debit', '50000000', '0', 'Dr-Feb 24/188', 538),
(558, 0, 'credit', '50000000', '0', 'Dr-Feb 24/188', 539),
(559, 0, 'debit', '4000000', '0', 'Dr-Feb 24/189', 540),
(560, 0, 'credit', '4000000', '0', 'Dr-Feb 24/189', 541),
(561, 0, 'debit', '10000000', '0', 'Dr-Feb 24/190', 542),
(562, 0, 'credit', '10000000', '0', 'Dr-Feb 24/190', 543),
(563, 0, 'debit', '20000000', '0', 'Dr-Feb 24/191', 544),
(564, 0, 'credit', '20000000', '0', 'Dr-Feb 24/191', 545),
(565, 0, 'debit', '30000000', '0', 'Dr-Feb 24/192', 546),
(566, 0, 'credit', '30000000', '0', 'Dr-Feb 24/192', 547),
(567, 0, 'debit', '6000000', '0', 'Dr-Feb 24/193', 548),
(568, 0, 'credit', '6000000', '0', 'Dr-Feb 24/193', 549),
(569, 0, 'debit', '5000000', '0', 'Dr-Feb 24/194', 550),
(570, 0, 'credit', '5000000', '0', 'Dr-Feb 24/194', 551),
(571, 0, 'debit', '3000000', '0', 'Dr-Feb 24/195', 552),
(572, 0, 'credit', '3000000', '0', 'Dr-Feb 24/195', 553),
(573, 0, 'debit', '5000000', '0', 'Dr-Feb 24/196', 554),
(574, 0, 'credit', '5000000', '0', 'Dr-Feb 24/196', 555),
(575, 0, 'debit', '12000000', '0', 'Dr-Feb 24/197', 556),
(576, 0, 'credit', '12000000', '0', 'Dr-Feb 24/197', 557),
(577, 0, 'debit', '50000000', '0', 'Dr-Feb 24/198', 558),
(578, 0, 'credit', '50000000', '0', 'Dr-Feb 24/198', 559),
(579, 0, 'debit', '7000000', '0', 'Dr-Feb 24/199', 560),
(580, 0, 'credit', '7000000', '0', 'Dr-Feb 24/199', 561),
(581, 0, 'debit', '4000000', '0', 'Dr-Feb 24/200', 562),
(582, 0, 'credit', '4000000', '0', 'Dr-Feb 24/200', 563),
(583, 0, 'debit', '4000000', '0', 'Dr-Feb 24/201', 564),
(584, 0, 'credit', '4000000', '0', 'Dr-Feb 24/201', 565),
(585, 0, 'debit', '3000000', '0', 'Dr-Feb 24/202', 566),
(586, 0, 'credit', '3000000', '0', 'Dr-Feb 24/202', 567),
(587, 0, 'debit', '5000000', '0', 'Dr-Feb 24/203', 568),
(588, 0, 'credit', '5000000', '0', 'Dr-Feb 24/203', 569),
(589, 0, 'debit', '4000000', '0', 'Dr-Feb 24/204', 570),
(590, 0, 'credit', '4000000', '0', 'Dr-Feb 24/204', 571),
(591, 0, 'debit', '4000000', '0', 'Dr-Feb 24/205', 572),
(592, 0, 'credit', '4000000', '0', 'Dr-Feb 24/205', 573),
(593, 0, 'debit', '7000000', '0', 'Dr-Feb 24/206', 574),
(594, 0, 'credit', '7000000', '0', 'Dr-Feb 24/206', 575),
(595, 0, 'debit', '6000000', '0', 'Dr-Feb 24/207', 576),
(596, 0, 'credit', '6000000', '0', 'Dr-Feb 24/207', 577),
(597, 0, 'debit', '3000000', '0', 'Dr-Feb 24/208', 578),
(598, 0, 'credit', '3000000', '0', 'Dr-Feb 24/208', 579),
(599, 0, 'debit', '6000000', '0', 'Dr-Feb 24/209', 580),
(600, 0, 'credit', '6000000', '0', 'Dr-Feb 24/209', 581),
(601, 0, 'debit', '6000000', '0', 'Dr-Feb 24/210', 582),
(602, 0, 'credit', '6000000', '0', 'Dr-Feb 24/210', 583),
(603, 0, 'debit', '20500', '0', 'Dr-Feb 24/211', 584),
(604, 0, 'credit', '20500', '0', 'Dr-Feb 24/211', 585),
(605, 0, 'debit', '10000', '0', 'Dr-Feb 24/212', 586),
(606, 0, 'credit', '10000', '0', 'Dr-Feb 24/212', 587),
(607, 0, 'debit', '29000', '0', 'Dr-Feb 24/213', 588),
(608, 0, 'credit', '29000', '0', 'Dr-Feb 24/213', 589),
(609, 0, 'debit', '1193500', '0', 'Dr-Feb 24/214', 590),
(610, 0, 'credit', '1193500', '0', 'Dr-Feb 24/214', 591),
(611, 0, 'debit', '4500', '0', 'Dr-Feb 24/215', 592),
(612, 0, 'credit', '4500', '0', 'Dr-Feb 24/215', 593),
(613, 0, 'debit', '60000', '0', 'Dr-Feb 24/216', 594),
(614, 0, 'credit', '60000', '0', 'Dr-Feb 24/216', 595),
(615, 0, 'debit', '55500', '0', 'Dr-Feb 24/217', 596),
(616, 0, 'credit', '55500', '0', 'Dr-Feb 24/217', 597),
(617, 0, 'debit', '38500', '0', 'Dr-Feb 24/218', 598),
(618, 0, 'credit', '38500', '0', 'Dr-Feb 24/218', 599),
(619, 0, 'debit', '22000', '0', 'Dr-Feb 24/219', 600),
(620, 0, 'credit', '22000', '0', 'Dr-Feb 24/219', 601),
(621, 0, 'debit', '10500', '0', 'Dr-Feb 24/220', 602),
(622, 0, 'credit', '10500', '0', 'Dr-Feb 24/220', 603),
(623, 0, 'debit', '100000', '0', 'Dr-Feb 24/221', 604),
(624, 0, 'credit', '100000', '0', 'Dr-Feb 24/221', 605),
(625, 0, 'debit', '111000', '0', 'Dr-Feb 24/222', 606),
(626, 0, 'credit', '111000', '0', 'Dr-Feb 24/222', 607),
(627, 0, 'debit', '51000', '0', 'Dr-Feb 24/223', 608),
(628, 0, 'credit', '51000', '0', 'Dr-Feb 24/223', 609),
(629, 0, 'debit', '100000', '0', 'Dr-Feb 24/224', 610),
(630, 0, 'credit', '100000', '0', 'Dr-Feb 24/224', 611),
(631, 0, 'debit', '25000', '0', 'Dr-Feb 24/225', 612),
(632, 0, 'credit', '25000', '0', 'Dr-Feb 24/225', 613),
(633, 0, 'debit', '36500', '0', 'Dr-Feb 24/226', 614),
(634, 0, 'credit', '36500', '0', 'Dr-Feb 24/226', 615),
(635, 0, 'debit', '22000', '0', 'Dr-Feb 24/227', 616),
(636, 0, 'credit', '22000', '0', 'Dr-Feb 24/227', 617),
(637, 0, 'debit', '202250', '0', 'Dr-Feb 24/228', 618),
(638, 0, 'credit', '202250', '0', 'Dr-Feb 24/228', 619),
(639, 0, 'debit', '63000', '0', 'Dr-Feb 24/228', 620),
(640, 0, 'credit', '63000', '0', 'Dr-Feb 24/228', 621),
(641, 0, 'debit', '11000', '0', 'Dr-Feb 24/229', 622),
(642, 0, 'credit', '11000', '0', 'Dr-Feb 24/229', 623),
(643, 0, 'debit', '1158820', '0', 'Dr-Feb 24/230', 624),
(644, 0, 'credit', '1158820', '0', 'Dr-Feb 24/230', 625),
(649, 0, 'debit', '10000', '0', 'Dr-Feb 24/236', 630),
(650, 0, 'credit', '10000', '0', 'Dr-Feb 24/236', 631),
(651, 0, 'debit', '33000', '0', 'Dr-Feb 24/237', 632),
(652, 0, 'credit', '33000', '0', 'Dr-Feb 24/237', 633),
(653, 0, 'debit', '8000', '0', 'Dr-Feb 24/238', 634),
(654, 0, 'credit', '8000', '0', 'Dr-Feb 24/238', 635),
(655, 0, 'debit', '4000000', '0', 'Dr-Feb 24/239', 636),
(656, 0, 'credit', '4000000', '0', 'Dr-Feb 24/239', 637),
(657, 0, 'debit', '5370700', '0', 'Dr-Feb 24/240', 638),
(658, 0, 'credit', '5370700', '0', 'Dr-Feb 24/240', 639),
(659, 0, 'debit', '4000000', '0', 'Dr-Feb 24/241', 640),
(660, 0, 'credit', '4000000', '0', 'Dr-Feb 24/241', 641),
(661, 0, 'debit', '565400', '0', 'Dr-Feb 24/242', 642),
(662, 0, 'credit', '565400', '0', 'Dr-Feb 24/242', 643),
(663, 0, 'debit', '6000000', '0', 'Dr-Feb 24/243', 644),
(664, 0, 'credit', '6000000', '0', 'Dr-Feb 24/243', 645),
(665, 0, 'debit', '2692000', '0', 'Dr-Feb 24/244', 646),
(666, 0, 'credit', '2692000', '0', 'Dr-Feb 24/244', 647),
(667, 0, 'debit', '18000', '0', 'Dr-Feb 24/245', 648),
(668, 0, 'credit', '18000', '0', 'Dr-Feb 24/245', 649),
(669, 0, 'debit', '2700', '0', 'Dr-Feb 24/246', 650),
(670, 0, 'credit', '2700', '0', 'Dr-Feb 24/246', 651),
(671, 0, 'debit', '5960000', '0', 'Dr-Feb 24/247', 652),
(672, 0, 'credit', '5960000', '0', 'Dr-Feb 24/247', 653),
(673, 0, 'debit', '550000', '0', 'Dr-Feb 24/248', 654),
(674, 0, 'credit', '550000', '0', 'Dr-Feb 24/248', 655),
(675, 0, 'debit', '2272500', '0', 'Dr-Feb 24/250', 656),
(676, 0, 'credit', '2272500', '0', 'Dr-Feb 24/250', 657),
(677, 0, 'debit', '9000000', '0', 'Dr-Feb 24/251', 658),
(678, 0, 'credit', '9000000', '0', 'Dr-Feb 24/251', 659),
(679, 0, 'debit', '5000000', '0', 'Dr-Feb 24/252', 660),
(680, 0, 'credit', '5000000', '0', 'Dr-Feb 24/252', 661),
(681, 0, 'debit', '450200', '0', 'Dr-Feb 24/253', 662),
(682, 0, 'credit', '450200', '0', 'Dr-Feb 24/253', 663),
(683, 0, 'debit', '5400', '0', 'Dr-Feb 24/254', 664),
(684, 0, 'credit', '5400', '0', 'Dr-Feb 24/254', 665),
(685, 0, 'debit', '43700', '0', 'Dr-Feb 24/255', 666),
(686, 0, 'credit', '43700', '0', 'Dr-Feb 24/255', 667),
(687, 0, 'debit', '2000', '0', 'Dr-Feb 24/256', 668),
(688, 0, 'credit', '2000', '0', 'Dr-Feb 24/256', 669),
(689, 0, 'debit', '7000', '0', 'Dr-Feb 24/257', 670),
(690, 0, 'credit', '7000', '0', 'Dr-Feb 24/257', 671),
(691, 0, 'debit', '10000', '0', 'Dr-Feb 24/258', 672),
(692, 0, 'credit', '10000', '0', 'Dr-Feb 24/258', 673),
(693, 0, 'debit', '27000', '0', 'Dr-Feb 24/259', 674),
(694, 0, 'credit', '27000', '0', 'Dr-Feb 24/259', 675),
(697, 0, 'debit', '4300000', '0', 'Dr-Feb 24/232', 678),
(698, 0, 'credit', '4300000', '0', 'Dr-Feb 24/232', 679),
(699, 0, 'debit', '300000', '0', 'Dr-Feb 24/233', 680),
(700, 0, 'credit', '300000', '0', 'Dr-Feb 24/233', 681),
(701, 0, 'debit', '400000', '0', 'Dr-Feb 24/234', 682),
(702, 0, 'credit', '400000', '0', 'Dr-Feb 24/234', 683),
(703, 0, 'debit', '10000', '0', 'Dr-Feb 24/235', 684),
(704, 0, 'credit', '10000', '0', 'Dr-Feb 24/235', 685),
(705, 0, 'debit', '860000', '0', 'Dr-Feb 24/259', 686),
(706, 0, 'credit', '860000', '0', 'Dr-Feb 24/259', 687),
(707, 0, 'debit', '3000', '0', 'Dr-Feb 24/260', 688),
(708, 0, 'credit', '3000', '0', 'Dr-Feb 24/260', 689),
(709, 0, 'debit', '63000', '0', 'Dr-Feb 24/261', 690),
(710, 0, 'credit', '63000', '0', 'Dr-Feb 24/261', 691),
(711, 0, 'debit', '5400', '0', 'Dr-Feb 24/262', 692),
(712, 0, 'credit', '5400', '0', 'Dr-Feb 24/262', 693),
(713, 0, 'debit', '100000', '0', 'Dr-Feb 24/263', 694),
(714, 0, 'credit', '100000', '0', 'Dr-Feb 24/263', 695),
(715, 0, 'debit', '145000', '0', 'Dr-Feb 24/264', 696),
(716, 0, 'credit', '145000', '0', 'Dr-Feb 24/264', 697),
(717, 0, 'debit', '10000', '0', 'Dr-Feb 24/265', 698),
(718, 0, 'credit', '10000', '0', 'Dr-Feb 24/265', 699),
(719, 0, 'debit', '3298466', '0', 'Dr-Feb 24/266', 700),
(720, 0, 'credit', '3298466', '0', 'Dr-Feb 24/266', 701),
(721, 0, 'debit', '4000', '0', 'Dr-Feb 24/267', 702),
(722, 0, 'credit', '4000', '0', 'Dr-Feb 24/267', 703),
(723, 0, 'debit', '21000', '0', 'Dr-Feb 24/268', 704),
(724, 0, 'credit', '21000', '0', 'Dr-Feb 24/268', 705),
(725, 0, 'debit', '2000', '0', 'Dr-Feb 24/269', 706),
(726, 0, 'credit', '2000', '0', 'Dr-Feb 24/269', 707),
(727, 0, 'debit', '6000', '0', 'Dr-Feb 24/270', 708),
(728, 0, 'credit', '6000', '0', 'Dr-Feb 24/270', 709),
(729, 0, 'debit', '5000', '0', 'Dr-Feb 24/271', 710),
(730, 0, 'credit', '5000', '0', 'Dr-Feb 24/271', 711),
(731, 0, 'debit', '85000', '0', 'Dr-Feb 24/272', 712),
(732, 0, 'credit', '85000', '0', 'Dr-Feb 24/272', 713),
(733, 0, 'debit', '2500', '0', 'Dr-Feb 24/273', 714),
(734, 0, 'credit', '2500', '0', 'Dr-Feb 24/273', 715),
(735, 0, 'debit', '4500', '0', 'Dr-Feb 24/274', 716),
(736, 0, 'credit', '4500', '0', 'Dr-Feb 24/274', 717),
(737, 0, 'debit', '12000', '0', 'Dr-Feb 24/275', 718),
(738, 0, 'credit', '12000', '0', 'Dr-Feb 24/275', 719),
(739, 0, 'debit', '35000', '0', 'Dr-Feb 24/276', 720),
(740, 0, 'credit', '35000', '0', 'Dr-Feb 24/276', 721),
(741, 0, 'debit', '6000', '0', 'Dr-Feb 24/277', 722),
(742, 0, 'credit', '6000', '0', 'Dr-Feb 24/277', 723),
(743, 0, 'debit', '2000', '0', 'Dr-Feb 24/278', 724),
(744, 0, 'credit', '2000', '0', 'Dr-Feb 24/278', 725),
(745, 0, 'debit', '15000', '0', 'Dr-Feb 24/279', 726),
(746, 0, 'credit', '15000', '0', 'Dr-Feb 24/279', 727),
(751, 0, 'debit', '25400', '0', 'Dr-Feb 24/281', 732),
(752, 0, 'credit', '25400', '0', 'Dr-Feb 24/281', 733),
(753, 0, 'debit', '47300', '0', 'Dr-Feb 24/282', 734),
(754, 0, 'credit', '47300', '0', 'Dr-Feb 24/282', 735),
(755, 0, 'debit', '132670', '0', 'Dr-Feb 24/283', 736),
(756, 0, 'credit', '132670', '0', 'Dr-Feb 24/283', 737),
(757, 0, 'debit', '7000', '0', 'Dr-Feb 24/284', 738),
(758, 0, 'credit', '7000', '0', 'Dr-Feb 24/284', 739),
(759, 0, 'debit', '15000', '0', 'Dr-Feb 24/285', 740),
(760, 0, 'credit', '15000', '0', 'Dr-Feb 24/285', 741),
(761, 0, 'debit', '3500', '0', 'Dr-Feb 24/286', 742),
(762, 0, 'credit', '3500', '0', 'Dr-Feb 24/286', 743),
(763, 0, 'debit', '1330000', '0', 'Dr-Feb 24/287', 744),
(764, 0, 'credit', '1330000', '0', 'Dr-Feb 24/287', 745),
(765, 0, 'debit', '21000', '0', 'Dr-Feb 24/288', 746),
(766, 0, 'credit', '21000', '0', 'Dr-Feb 24/288', 747),
(767, 0, 'debit', '15000', '0', 'Dr-Feb 24/289', 748),
(768, 0, 'credit', '15000', '0', 'Dr-Feb 24/289', 749),
(769, 0, 'debit', '78000', '0', 'Dr-Feb 24/290', 750),
(770, 0, 'credit', '78000', '0', 'Dr-Feb 24/290', 751),
(771, 0, 'debit', '206000', '0', 'Dr-Feb 24/291', 752),
(772, 0, 'credit', '206000', '0', 'Dr-Feb 24/291', 753),
(773, 0, 'debit', '840000', '0', 'Dr-Feb 24/292', 754),
(774, 0, 'credit', '840000', '0', 'Dr-Feb 24/292', 755),
(775, 0, 'debit', '125100', '0', 'Dr-Feb 24/293', 756),
(776, 0, 'credit', '125100', '0', 'Dr-Feb 24/293', 757),
(777, 0, 'debit', '2116280', '0', 'Dr-Feb 24/294', 758),
(778, 0, 'credit', '2116280', '0', 'Dr-Feb 24/294', 759),
(779, 0, 'debit', '1320000', '0', 'Dr-Feb 24/295', 760),
(780, 0, 'credit', '1320000', '0', 'Dr-Feb 24/295', 761),
(781, 0, 'debit', '100000', '0', 'Dr-Feb 24/296', 762),
(782, 0, 'credit', '100000', '0', 'Dr-Feb 24/296', 763),
(783, 0, 'debit', '1000000', '0', 'Dr-Feb 24/297', 764),
(784, 0, 'credit', '1000000', '0', 'Dr-Feb 24/297', 765),
(785, 0, 'debit', '7000000', '0', 'Dr-Feb 24/298', 766),
(786, 0, 'credit', '7000000', '0', 'Dr-Feb 24/298', 767),
(787, 0, 'debit', '20000', '0', 'Dr-Feb 24/299', 768),
(788, 0, 'credit', '20000', '0', 'Dr-Feb 24/299', 769),
(789, 0, 'debit', '86000', '0', 'Dr-Feb 24/300', 770),
(790, 0, 'credit', '86000', '0', 'Dr-Feb 24/300', 771),
(813, 0, 'debit', '10000000', '0', 'Dr-Feb 24/301', 794),
(814, 0, 'credit', '10000000', '0', 'Dr-Feb 24/301', 795),
(815, 0, 'debit', '600000', '0', 'Dr-Feb 24/302', 796),
(816, 0, 'credit', '600000', '0', 'Dr-Feb 24/302', 797),
(817, 0, 'debit', '800000', '0', 'Dr-Feb 24/303', 798),
(818, 0, 'credit', '800000', '0', 'Dr-Feb 24/303', 799),
(819, 0, 'debit', '3721000', '0', 'Dr-Feb 24/304', 800),
(820, 0, 'credit', '3721000', '0', 'Dr-Feb 24/304', 801),
(821, 0, 'debit', '16000', '0', 'Dr-Feb 24/305', 802),
(822, 0, 'credit', '16000', '0', 'Dr-Feb 24/305', 803),
(823, 0, 'debit', '1000000', '0', 'Dr-Feb 24/306', 804),
(824, 0, 'credit', '1000000', '0', 'Dr-Feb 24/306', 805),
(825, 0, 'debit', '7500', '0', 'Dr-Feb 24/307', 806),
(826, 0, 'credit', '7500', '0', 'Dr-Feb 24/307', 807),
(827, 0, 'debit', '26000', '0', 'Dr-Feb 24/308', 808),
(828, 0, 'credit', '26000', '0', 'Dr-Feb 24/308', 809),
(829, 0, 'debit', '50000', '0', 'Dr-Feb 24/309', 810),
(830, 0, 'credit', '50000', '0', 'Dr-Feb 24/309', 811),
(831, 0, 'debit', '4000', '0', 'Dr-Feb 24/310', 812),
(832, 0, 'credit', '4000', '0', 'Dr-Feb 24/310', 813),
(833, 0, 'debit', '40000', '0', 'Dr-Feb 24/311', 814),
(834, 0, 'credit', '40000', '0', 'Dr-Feb 24/311', 815),
(835, 0, 'debit', '86000', '0', 'Dr-Feb 24/312', 816),
(836, 0, 'credit', '86000', '0', 'Dr-Feb 24/312', 817),
(837, 0, 'credit', '670000', '0', 'Cr-Feb 24/009', 818),
(838, 0, 'debit', '670000', '0', 'Cr-Feb 24/009', 819),
(839, 0, 'credit', '87528227', '0', 'Cr-Feb 24/010', 820),
(840, 0, 'debit', '87528227', '0', 'Cr-Feb 24/010', 821),
(841, 0, 'debit', '27000', '0', 'Dr-Feb 24/313', 822),
(842, 0, 'credit', '27000', '0', 'Dr-Feb 24/313', 823),
(843, 0, 'debit', '18000', '0', 'Dr-Feb 24/314', 824),
(844, 0, 'credit', '18000', '0', 'Dr-Feb 24/314', 825),
(845, 0, 'debit', '2700', '0', 'Dr-Feb 24/315', 826),
(846, 0, 'credit', '2700', '0', 'Dr-Feb 24/315', 827),
(847, 0, 'debit', '40000', '0', 'Dr-Feb 24/316', 828),
(848, 0, 'credit', '40000', '0', 'Dr-Feb 24/316', 829),
(849, 0, 'debit', '16000', '0', 'Dr-Feb 24/317', 830),
(850, 0, 'credit', '16000', '0', 'Dr-Feb 24/317', 831),
(851, 0, 'debit', '2000', '0', 'Dr-Feb 24/318', 832),
(852, 0, 'credit', '2000', '0', 'Dr-Feb 24/318', 833),
(853, 0, 'debit', '582100', '0', 'Dr-Feb 24/319', 834),
(854, 0, 'credit', '582100', '0', 'Dr-Feb 24/319', 835),
(855, 0, 'debit', '2000', '0', 'Dr-Feb 24/320', 836),
(856, 0, 'credit', '2000', '0', 'Dr-Feb 24/320', 837),
(857, 0, 'debit', '4000000', '0', 'Dr-Feb 24/321', 838),
(858, 0, 'credit', '4000000', '0', 'Dr-Feb 24/321', 839),
(859, 0, 'debit', '3000000', '0', 'Dr-Feb 24/322', 840),
(860, 0, 'credit', '3000000', '0', 'Dr-Feb 24/322', 841),
(861, 0, 'debit', '10000000', '0', 'Dr-Feb 24/323', 842),
(862, 0, 'credit', '10000000', '0', 'Dr-Feb 24/323', 843),
(863, 0, 'debit', '3000000', '0', 'Dr-Feb 24/324', 844),
(864, 0, 'credit', '3000000', '0', 'Dr-Feb 24/324', 845),
(865, 0, 'debit', '24000', '0', 'Dr-Feb 24/325', 846),
(866, 0, 'credit', '24000', '0', 'Dr-Feb 24/325', 847),
(867, 0, 'debit', '11000', '0', 'Dr-Feb 24/326', 848),
(868, 0, 'credit', '11000', '0', 'Dr-Feb 24/326', 849),
(869, 0, 'debit', '6000', '0', 'Dr-Feb 24/327', 850),
(870, 0, 'credit', '6000', '0', 'Dr-Feb 24/327', 851),
(871, 0, 'debit', '22000', '0', 'Dr-Feb 24/328', 852),
(872, 0, 'credit', '22000', '0', 'Dr-Feb 24/328', 853),
(873, 0, 'debit', '4000', '0', 'Dr-Feb 24/329', 854),
(874, 0, 'credit', '4000', '0', 'Dr-Feb 24/329', 855),
(875, 0, 'debit', '1000000', '0', 'JJJJJ', 856),
(876, 0, 'credit', '1000000', '0', 'JJJJJ', 857);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `form7stock`
--

INSERT INTO `form7stock` (`id`, `date`, `item_id`, `supplier_name`, `country`, `type`, `size`, `viss`, `kg`, `pcspervr`, `pcsperf7`, `link_id`, `water_kg`) VALUES
(77, '2024-02-02', '1010', '4000/T07', NULL, 'Frozen', 'J', '220.1', '359.6434', '', 0, 59, 0),
(78, '2024-02-02', '1002', '4000/Z03', NULL, 'Frozen', '2 D', '19.7', '32.1898', '16', 12, 60, 0),
(79, '2024-02-02', '1002', '4000/Z03', NULL, 'Frozen', '2 up', '38.9', '63.5626', '26', 41, 61, 0),
(80, '2024-02-02', '1002', '4000/Z03', NULL, 'Frozen', '3 up', '104.7', '171.0798', '33', 6, 62, 0),
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
(102, '2024-02-05', '1002', '4000/Z03', 'can', 'Frozen', '2up', '61.1', '99.0374', '42', 0, 84, 1),
(103, '2024-02-05', '1002', '4000/Z03', 'can', 'Frozen', '2 D', '12.8', '19.9152', '11', 0, 85, 1),
(104, '2024-02-05', '1002', '4000/Z03', 'can', 'Frozen', '3up', '57.7', '93.4818', '17', 0, 86, 1),
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
(126, '2024-02-07', '1020', '4000/T07', NULL, 'Frozen', '3up', '30.8', '50.3272', '12', 0, 108, 0),
(127, '2024-02-07', '1010', '4000/T07', NULL, 'Frozen', 'J', '171.5', '280.231', '', 0, 109, 0),
(128, '2024-02-08', '1010', '4000/T07', NULL, 'Frozen', 'J', '236.75', '386.8495', '', 0, 110, 0),
(129, '2024-02-08', '1020', '4000/T07', NULL, 'Frozen', '5up', '10.3', '16.8302', '3', 0, 111, 0),
(130, '2024-02-08', '1020', '4000/T07', NULL, 'Frozen', '3up', '32.7', '53.4318', '13', 0, 112, 0),
(131, '2024-02-08', '1001', '4000/T02', NULL, 'Frozen', '3up', '17.7', '28.9218', '6', 0, 113, 0),
(132, '2024-02-08', '1001', '4000/T02', NULL, 'Frozen', '2up', '18.2', '29.7388', '12', 0, 114, 0),
(133, '2024-02-08', '1001', '4000/T02', NULL, 'Frozen', '1.5up', '43.1', '70.4254', '41', 0, 115, 0),
(134, '2024-02-08', '1001', '4000/T02', NULL, 'Frozen', '1up', '29.8', '48.6932', '36', 0, 116, 0),
(135, '2024-02-08', '1002', '4000/T02', NULL, 'Frozen', '3up', '31.4', '51.3076', '16', 0, 117, 0),
(136, '2024-02-08', '1002', '4000/T02', NULL, 'Frozen', '2up', '48.1', '78.5954', '31', 0, 118, 0),
(137, '2024-02-08', '1016', '4000/T02', NULL, 'Frozen', 'J', '1.4', '2.2876', '1', 0, 119, 0),
(138, '2024-02-08', '1031', '4000/T05', NULL, 'Frozen', '3up', '88', '143.792', '31', 0, 120, 0),
(139, '2024-02-08', '1031', '4000/T05', NULL, 'Frozen', '4up', '1346.4', '2200.0176', '433', 0, 121, 0),
(140, '2024-02-08', '1031', '4000/T05', NULL, 'Frozen', '5up', '678.9', '1109.3226', '183', 0, 122, 0),
(141, '2024-02-08', '1031', '4000/T05', NULL, 'Frozen', '6up', '266.3', '435.1342', '60', 0, 123, 0),
(142, '2024-02-09', '1017', '4000/T05', NULL, 'Frozen', '2up', '8', '13.072', '', 0, 124, 0),
(143, '2024-02-09', '1017', '4000/T05', NULL, 'Frozen', '3up', '413.75', '676.0675', '', 0, 125, 0),
(144, '2024-02-09', '1031', '4000/T05', NULL, 'Frozen', '4up', '759.25', '1240.6145', '', 0, 126, 0),
(145, '2024-02-09', '1031', '4000/T05', NULL, 'Frozen', '5/6up', '1351.25', '2207.9425', '', 0, 127, 0),
(146, '2024-02-10', '1031', '4000/T05', NULL, 'Frozen', '4up', '636.6', '1040.2044', '', 0, 128, 0),
(147, '2024-02-10', '1031', '4000/T05', NULL, 'Frozen', '5up', '500.3', '817.4902', '', 0, 129, 0),
(148, '2024-02-10', '1031', '4000/T05', NULL, 'Frozen', '6up', '175.2', '286.2768', '', 0, 130, 0),
(149, '2024-02-10', '1023', '4000/T05', 'Can/NY', 'Frozen', '2up', '354.1', '578.5994', '', 200, 131, 0),
(150, '2024-02-10', '1023', '4000/T05', 'Can/NY', 'Frozen', '3up', '114', '186.276', '', 72, 132, 0),
(151, '2024-02-10', '1023', '4000/T05', 'Can/NY', 'Frozen', '4up', '5.7', '9.3138', '', 2, 133, 0),
(152, '2024-02-10', '1017', '4000/T05', NULL, 'Frozen', '2up', '3.9', '6.3726', '', 0, 134, 0),
(153, '2024-02-10', '1017', '4000/T05', NULL, 'Frozen', '3up', '66.2', '108.1708', '', 0, 135, 0),
(154, '2024-02-11', '1016', '4000/K06', NULL, 'Frozen', '8/10', '51.4', '83.9876', '1', 0, 136, 0),
(155, '2024-02-11', '1020', '4000/T07', NULL, 'Frozen', '3up', '56.15', '91.7491', '22', 0, 137, 0),
(156, '2024-02-11', '1020', '4000/T07', NULL, 'Frozen', '5up', '51.6', '84.3144', '11', 0, 138, 0),
(157, '2024-02-11', '1010', '4000/T07', NULL, 'Frozen', 'J', '252', '411.768', '', 0, 139, 0),
(158, '2024-02-12', '1010', '4000/T07', NULL, 'Frozen', 'J', '219.5', '358.663', '', 0, 140, 0),
(159, '2024-02-13', '1001', '4000/Z03', NULL, 'Frozen', '1up', '30.5', '49.837', '26', 0, 141, 0),
(160, '2024-02-13', '1001', '4000/Z03', NULL, 'Frozen', '2up', '46.9', '76.6346', '27', 0, 142, 0),
(161, '2024-02-13', '1001', '4000/Z03', NULL, 'Frozen', '2 D', '23.9', '39.0526', '20', 0, 143, 0),
(162, '2024-02-13', '1001', '4000/Z03', NULL, 'Frozen', '3up', '54', '88.236', '19', 0, 144, 0),
(163, '2024-02-13', '1002', '4000/Z03', NULL, 'Frozen', '2up', '65.6', '107.1904', '43', 0, 145, 0),
(164, '2024-02-13', '1002', '4000/Z03', NULL, 'Frozen', '2 D', '42.9', '70.0986', '36', 0, 146, 0),
(165, '2024-02-13', '1002', '4000/Z03', NULL, 'Frozen', '3up', '53.8', '87.9092', '17', 0, 147, 0),
(166, '2024-02-13', '1031', '4000/T05', NULL, 'Frozen', '2up', '671.7', '1097.5578', '0', 0, 148, 0),
(167, '2024-02-13', '1031', '4000/T05', NULL, 'Frozen', '3up', '2395.8', '3914.7372', '0', 0, 149, 0),
(168, '2024-02-13', '1031', '4000/T05', NULL, 'Frozen', '4up', '3585.3', '5858.3802', '0', 0, 150, 0),
(169, '2024-02-13', '1023', '4000/T05', NULL, 'Frozen', '3up', '130.3', '212.9102', '0', 0, 151, 0),
(170, '2024-02-13', '1023', '4000/T05', NULL, 'Frozen', '4up', '121.7', '198.8578', '0', 0, 152, 0),
(171, '2024-02-14', '1017', '4000/T05', NULL, 'Frozen', '2up', '22', '35.948', '0', 0, 153, 0),
(172, '2024-02-14', '1017', '4000/T05', NULL, 'Frozen', '3up', '728.5', '1190.369', '0', 0, 154, 0),
(173, '2024-02-14', '1023', '4000/T05', NULL, 'Frozen', '4up', '101.5', '165.851', '0', 0, 155, 0),
(174, '2024-02-14', '1023', '4000/T05', NULL, 'Frozen', '5/6 up', '235', '383.99', '0', 0, 156, 0),
(175, '2024-02-14', '1031', '4000/T05', NULL, 'Frozen', '2up', '475.2', '776.4768', '0', 0, 157, 0),
(176, '2024-02-14', '1031', '4000/T05', NULL, 'Frozen', '3up', '1572.4', '2569.3016', '0', 0, 158, 0),
(177, '2024-02-14', '1031', '4000/T05', NULL, 'Frozen', '4up', '4362.2', '7127.8348', '0', 0, 159, 0),
(178, '2024-02-14', '1031', '4000/T05', NULL, 'Frozen', '5up', '809.5', '1322.723', '0', 0, 160, 0),
(179, '2024-02-14', '1031', '4000/T05', NULL, 'Frozen', '6up', '92.5', '151.145', '0', 0, 161, 0),
(180, '2024-02-14', '1023', '4000/T05', NULL, 'Frozen', '3up', '45.9', '75.0006', '0', 0, 162, 0),
(181, '2024-02-14', '1023', '4000/T05', NULL, 'Frozen', '4up', '29.9', '48.8566', '0', 0, 163, 0),
(182, '2024-02-14', '1023', '4000/T05', NULL, 'Frozen', '5up', '17.1', '27.9414', '0', 0, 164, 0),
(183, '2024-02-14', '1031', '4000/S03', NULL, 'Frozen', '3up', '383', '625.822', '0', 0, 165, 0),
(184, '2024-02-14', '1031', '4000/S03', NULL, 'Frozen', '4up', '2144.7', '3504.4398', '0', 0, 166, 0),
(185, '2024-02-14', '1031', '4000/S03', NULL, 'Frozen', '5up', '1941.4', '3172.2476', '0', 0, 167, 0),
(186, '2024-02-14', '1031', '4000/S03', NULL, 'Frozen', '6up', '804.9', '1315.2066', '0', 0, 168, 0),
(187, '2024-02-15', '1016', '4000/K06', NULL, 'Frozen', 'J', '8.5', '13.889', '10', 0, 169, 0),
(188, '2024-02-15', '1001', '4000/T02', NULL, 'Frozen', '3up', '28.2', '46.0788', '12', 0, 170, 0),
(189, '2024-02-15', '1001', '4000/T02', NULL, 'Frozen', '2up', '27.7', '45.2618', '19', 0, 171, 0),
(190, '2024-02-15', '1001', '4000/T02', NULL, 'Frozen', '1.5up', '117.2', '191.5048', '115', 0, 172, 0),
(191, '2024-02-15', '1002', '4000/T02', NULL, 'Frozen', '3up', '26.2', '42.8108', '11', 0, 173, 0),
(192, '2024-02-15', '1002', '4000/T02', NULL, 'Frozen', '2up', '75.5', '123.367', '51', 0, 174, 0),
(193, '2024-02-15', '1016', '4000/T02', NULL, 'Frozen', 'J', '2.4', '3.9216', '2', 0, 175, 0),
(194, '2024-02-15', '1030', '4000/T06', NULL, 'Frozen', '2up', '420.7', '687.4238', '0', 0, 176, 0),
(195, '2024-02-15', '1031', '4000/T05', NULL, 'Frozen', '2up', '1204', '1967.336', '0', 0, 177, 0),
(196, '2024-02-15', '1031', '4000/T05', NULL, 'Frozen', '3up', '3287.8', '5372.2652', '0', 0, 178, 0),
(197, '2024-02-15', '1031', '4000/T05', NULL, 'Frozen', '4up', '1498', '2447.732', '0', 0, 179, 0),
(198, '2024-02-15', '1031', '4000/T05', NULL, 'Frozen', '5up', '1093.7', '1787.1058', '0', 0, 180, 0),
(199, '2024-02-16', '1031', '4000/S03', NULL, 'Frozen', '2up', '24.7', '40.3598', '0', 0, 181, 0),
(200, '2024-02-16', '1031', '4000/S03', NULL, 'Frozen', '3up', '1034.1', '1689.7194', '0', 0, 182, 0),
(201, '2024-02-16', '1031', '4000/S03', NULL, 'Frozen', '4up', '1848.6', '3020.6124', '0', 0, 183, 0),
(202, '2024-02-16', '1031', '4000/S03', NULL, 'Frozen', '5up', '2593.5', '4237.779', '0', 0, 184, 0),
(203, '2024-02-16', '1031', '4000/T05', NULL, 'Frozen', '2up', '739.5', '1208.343', '0', 0, 185, 0),
(204, '2024-02-16', '1031', '4000/T05', NULL, 'Frozen', '3up', '1798.8', '2939.2392', '0', 0, 186, 0),
(205, '2024-02-16', '1031', '4000/T05', NULL, 'Frozen', '4up', '991.8', '1620.6012', '0', 0, 187, 0),
(206, '2024-02-16', '1031', '4000/T05', NULL, 'Frozen', '5up', '512.3', '837.0982', '0', 0, 188, 0),
(207, '2024-02-16', '1023', '4000/T05', NULL, 'Frozen', '3up', '124.8', '203.9232', '0', 0, 189, 0),
(208, '2024-02-16', '1023', '4000/T05', NULL, 'Frozen', '4up', '44', '71.896', '0', 0, 190, 0),
(209, '2024-02-16', '1023', '4000/T05', NULL, 'Frozen', '5up', '16.2', '26.4708', '0', 0, 191, 0),
(210, '2024-02-16', '1023', '4000/T05', NULL, 'Frozen', '6up', '5.1', '8.3334', '0', 0, 192, 0),
(211, '2024-02-16', '1020', '4000/T07', NULL, 'Frozen', '3up', '85.6', '139.8704', '35', 0, 193, 0),
(212, '2024-02-16', '1020', '4000/T07', NULL, 'Frozen', '5up', '38', '62.092', '9', 0, 194, 0),
(213, '2024-02-16', '1002', '4000/B01', NULL, 'Frozen', '3/4up', '120.25', '196.4885', '49', 0, 195, 0),
(214, '2024-02-16', '1002', '4000/B01', NULL, 'Frozen', '2up', '103', '168.302', '74', 0, 196, 0),
(215, '2024-02-16', '1001', '4000/B01', NULL, 'Frozen', '3up', '23', '37.582', '8', 0, 197, 0),
(216, '2024-02-16', '1001', '4000/B01', NULL, 'Frozen', '2up', '8.5', '13.889', '6', 0, 198, 0),
(217, '2024-02-16', '1020', '4000/B01', NULL, 'Frozen', '2up', '48.4', '79.0856', '43', 0, 199, 0),
(218, '2024-02-16', '1020', '4000/B01', NULL, 'Frozen', '3/4up', '51', '83.334', '38', 0, 200, 0),
(219, '2024-02-16', '1020', '4000/B01', NULL, 'Frozen', '5up', '187.2', '305.8848', '42', 0, 201, 0),
(220, '2024-02-16', '1023', '4000/S03', NULL, 'Frozen', '1up', '20.1', '32.8434', '0', 0, 202, 0),
(221, '2024-02-16', '1023', '4000/S03', NULL, 'Frozen', '2up', '658.4', '1075.8256', '0', 0, 203, 0),
(222, '2024-02-16', '1023', '4000/S03', NULL, 'Frozen', '3up', '171.5', '280.231', '0', 0, 204, 0),
(223, '2024-02-16', '1023', '4000/S03', NULL, 'Frozen', '4up', '225.8', '368.9572', '0', 0, 205, 0),
(224, '2024-02-17', '1031', '4000/T05', NULL, 'Frozen', '2up', '66.8', '109.1512', '0', 0, 206, 0),
(225, '2024-02-17', '1031', '4000/T05', NULL, 'Frozen', '3up', '3611.4', '5901.0276', '0', 0, 207, 0),
(226, '2024-02-17', '1031', '4000/T05', NULL, 'Frozen', '4up', '803', '1312.102', '0', 0, 208, 0),
(227, '2024-02-17', '1031', '4000/T05', NULL, 'Frozen', '5up', '466.3', '761.9342', '0', 0, 209, 0),
(228, '2024-02-17', '1023', '4000/T05', NULL, 'Frozen', '3up', '489.8', '800.3332', '0', 0, 210, 0),
(229, '2024-02-17', '1023', '4000/T05', NULL, 'Frozen', '4up', '112', '183.008', '0', 0, 211, 0),
(230, '2024-02-17', '1023', '4000/T05', NULL, 'Frozen', '5/6 up', '40.8', '66.6672', '0', 0, 212, 0),
(231, '2024-02-17', '1031', '4000/S03', NULL, 'Frozen', '3up', '914.8', '1494.7832', '0', 0, 213, 0),
(232, '2024-02-17', '1031', '4000/S03', NULL, 'Frozen', '4up', '1714.8', '2801.9832', '0', 0, 214, 0),
(233, '2024-02-17', '1031', '4000/S03', NULL, 'Frozen', '5up', '2891', '4723.894', '0', 0, 215, 0),
(234, '2024-02-18', '1023', '4000/S03', NULL, 'Frozen', '2up', '255.6', '417.6504', '0', 0, 216, 0),
(235, '2024-02-18', '1023', '4000/S03', NULL, 'Frozen', '3up', '453.9', '741.6726', '0', 0, 217, 0),
(236, '2024-02-18', '1023', '4000/S03', NULL, 'Frozen', '4up', '238.6', '389.8724', '0', 0, 218, 0),
(237, '2024-02-18', '1023', '4000/S03', NULL, 'Frozen', '1up', '7.8', '12.7452', '0', 0, 219, 0),
(238, '2024-02-18', '1031', '4000/S03', NULL, 'Frozen', '3up', '737.3', '1204.7482', '0', 0, 220, 0),
(239, '2024-02-18', '1031', '4000/S03', NULL, 'Frozen', '4up', '1588.5', '2595.609', '0', 0, 221, 0),
(240, '2024-02-18', '1031', '4000/S03', NULL, 'Frozen', '5up', '2798.5', '4572.749', '0', 0, 222, 0),
(241, '2024-02-19', '1020', '4000/T07', NULL, 'Frozen', '2up', '72.7', '118.7918', '0', 0, 223, 0),
(242, '2024-02-19', '1020', '4000/T07', NULL, 'Frozen', '3up', '56', '91.504', '0', 0, 224, 0),
(243, '2024-02-19', '1020', '4000/T07', NULL, 'Frozen', '5up', '26.4', '43.1376', '0', 0, 225, 0),
(244, '2024-02-19', '1001', '4000/Z03', NULL, 'Frozen', '1 D', '23', '37.582', '0', 0, 226, 0),
(245, '2024-02-19', '1001', '4000/Z03', NULL, 'Frozen', '1up', '18', '29.412', '0', 0, 227, 0),
(246, '2024-02-19', '1001', '4000/Z03', NULL, 'Frozen', '2 D', '7.3', '11.9282', '0', 0, 228, 0),
(247, '2024-02-19', '1001', '4000/Z03', NULL, 'Frozen', '2up', '25.3', '41.3402', '0', 0, 229, 0),
(248, '2024-02-19', '1001', '4000/Z03', NULL, 'Frozen', '3up', '64.7', '105.7198', '0', 0, 230, 0),
(249, '2024-02-19', '1002', '4000/Z03', NULL, 'Frozen', '1up', '19.6', '32.0264', '0', 0, 231, 0),
(250, '2024-02-19', '1002', '4000/Z03', NULL, 'Frozen', '2 D', '8.3', '13.5622', '0', 0, 232, 0),
(251, '2024-02-19', '1002', '4000/Z03', NULL, 'Frozen', '2up', '27.5', '44.935', '0', 0, 233, 0),
(252, '2024-02-19', '1002', '4000/Z03', NULL, 'Frozen', '3up', '53.1', '86.7654', '0', 0, 234, 0),
(253, '2024-02-19', '1023', '4000/S03', NULL, 'Frozen', '2up', '10.4', '16.9936', '0', 0, 235, 0),
(254, '2024-02-19', '1023', '4000/S03', NULL, 'Frozen', '3up', '471.4', '770.2676', '0', 0, 236, 0),
(255, '2024-02-19', '1023', '4000/S03', NULL, 'Frozen', '4up', '463.8', '757.8492', '0', 0, 237, 0),
(256, '2024-02-19', '1017', '4000/S03', NULL, 'Frozen', '1up', '2.7', '4.4118', '0', 0, 238, 0),
(257, '2024-02-19', '1017', '4000/S03', NULL, 'Frozen', '2up', '246', '401.964', '0', 0, 239, 0),
(258, '2024-02-19', '1017', '4000/S03', NULL, 'Frozen', '3up', '74.3', '121.4062', '0', 0, 240, 0),
(259, '2024-02-20', '1001', '4000/T02', NULL, 'Frozen', '3up', '24.6', '40.1964', '11', 0, 241, 0),
(260, '2024-02-20', '1001', '4000/T02', NULL, 'Frozen', '2up', '24.6', '40.1964', '17', 0, 242, 0),
(261, '2024-02-20', '1001', '4000/T02', NULL, 'Frozen', '1.5up', '60.1', '98.2034', '58', 0, 243, 0),
(262, '2024-02-20', '1002', '4000/T02', NULL, 'Frozen', '3up', '62.3', '101.7982', '29', 0, 244, 0),
(263, '2024-02-20', '1002', '4000/T02', NULL, 'Frozen', '2up', '60.2', '98.3668', '40', 0, 245, 0),
(264, '2024-02-20', '1031', '4000/S03', NULL, 'Frozen', '2up', '39.9', '65.1966', '0', 0, 246, 0),
(265, '2024-02-20', '1031', '4000/S03', NULL, 'Frozen', '3up', '945.3', '1544.6202', '0', 0, 247, 0),
(266, '2024-02-20', '1031', '4000/S03', NULL, 'Frozen', '4up', '1641', '2681.394', '0', 0, 248, 0),
(267, '2024-02-20', '1031', '4000/S03', NULL, 'Frozen', '5up', '2386', '3898.724', '0', 0, 249, 0),
(268, '2024-02-20', '1023', '4000/S03', NULL, 'Frozen', '2up', '64.9', '106.0466', '0', 0, 250, 0),
(269, '2024-02-20', '1023', '4000/S03', NULL, 'Frozen', '3up', '300.4', '490.8536', '0', 0, 251, 0),
(270, '2024-02-20', '1023', '4000/S03', NULL, 'Frozen', '4up', '279.2', '456.2128', '0', 0, 252, 0),
(271, '2024-02-20', '1023', '4000/T05', NULL, 'Frozen', '2up', '9.4', '15.3596', '0', 0, 253, 0),
(272, '2024-02-20', '1023', '4000/T05', NULL, 'Frozen', '3up', '693.2', '1132.6888', '0', 0, 254, 0),
(273, '2024-02-20', '1023', '4000/T05', NULL, 'Frozen', '4up', '392', '640.528', '0', 0, 255, 0),
(274, '2024-02-20', '1023', '4000/T05', NULL, 'Frozen', '5up', '70.7', '115.5238', '0', 0, 256, 0),
(275, '2024-02-20', '1017', '4000/T05', NULL, 'Frozen', '2up', '75.2', '122.8768', '0', 0, 257, 0),
(276, '2024-02-21', '1006', '4000/P02', NULL, 'Frozen', 'J', '3500', '5719', '0', 0, 258, 0),
(277, '2024-02-21', '1020', '4000/K08', NULL, 'Frozen', '2up', '80.8', '132.0272', '0', 0, 259, 0),
(278, '2024-02-21', '1020', '4000/K08', NULL, 'Frozen', '3up', '205.4', '335.6236', '0', 0, 260, 0),
(279, '2024-02-21', '1023', '4000/T05', NULL, 'Frozen', '1up', '9.8', '16.0132', '0', 0, 261, 0),
(280, '2024-02-21', '1023', '4000/T05', NULL, 'Frozen', '2up', '23.5', '38.399', '0', 0, 262, 0),
(281, '2024-02-21', '1023', '4000/T05', NULL, 'Frozen', '3up', '12.7', '20.7518', '0', 0, 263, 0),
(282, '2024-02-21', '1023', '4000/T05', NULL, 'Frozen', '3up', '953', '1557.202', '0', 0, 264, 0),
(283, '2024-02-21', '1023', '4000/T05', NULL, 'Frozen', '4up', '131.3', '214.5442', '0', 0, 265, 0),
(284, '2024-02-21', '1023', '4000/T05', NULL, 'Frozen', '5/6up', '21.6', '35.2944', '0', 0, 266, 0),
(285, '2024-02-21', '1023', '4000/S03', NULL, 'Frozen', '2up', '12.5', '20.425', '0', 0, 267, 0),
(286, '2024-02-21', '1023', '4000/S03', NULL, 'Frozen', '3up', '390.9', '638.7306', '0', 0, 268, 0),
(287, '2024-02-21', '1023', '4000/S03', NULL, 'Frozen', '4up', '415.4', '678.7636', '0', 0, 269, 0),
(288, '2024-02-21', '1012', '4000/D01', NULL, 'Frozen', 'J', '186', '303.924', '0', 0, 270, 0),
(289, '2024-02-21', '1012', '4000/D01', NULL, 'Frozen', 'J', '17.25', '28.1865', '0', 0, 271, 0),
(290, '2024-02-21', '1012', '4000/D01', NULL, 'Frozen', 'J', '150.25', '245.5085', '0', 0, 272, 0),
(291, '2024-02-21', '1012', '4000/D01', NULL, 'Frozen', 'J', '89.75', '146.6515', '0', 0, 273, 0),
(292, '2024-02-21', '1012', '4000/D02', NULL, 'Frozen', 'J', '14.35', '23.4479', '0', 0, 274, 0),
(293, '2024-02-21', '1012', '4000/D02', NULL, 'Frozen', 'J', '22.5', '36.765', '0', 0, 275, 0),
(294, '2024-02-21', '1012', '4000/D02', NULL, 'Frozen', 'J', '201.7', '329.5778', '0', 0, 276, 0),
(295, '2024-02-21', '1012', '4000/D02', NULL, 'Frozen', 'J', '209.25', '341.9145', '0', 0, 277, 0),
(296, '2024-02-22', '1017', '4000/T05', NULL, 'Frozen', '2up', '96.6', '157.8444', '0', 0, 278, 0),
(297, '2024-02-22', '1017', '4000/T05', NULL, 'Frozen', '3up', '237.5', '388.075', '0', 0, 279, 0),
(298, '2024-02-22', '1031', '4000/T05', NULL, 'Frozen', '18/24', '44.7', '73.0398', '0', 0, 280, 0),
(299, '2024-02-22', '1031', '4000/T05', NULL, 'Frozen', '2up', '1003', '1638.902', '0', 0, 281, 0),
(300, '2024-02-22', '1031', '4000/T05', NULL, 'Frozen', '3up', '488.8', '798.6992', '0', 0, 282, 0),
(301, '2024-02-22', '1031', '4000/T05', NULL, 'Frozen', '4up', '18.2', '29.7388', '0', 0, 283, 0),
(302, '2024-02-22', '1020', '4000/T07', NULL, 'Frozen', '2up', '74.5', '121.733', '47', 0, 284, 0),
(303, '2024-02-22', '1020', '4000/T07', NULL, 'Frozen', '3up', '54.1', '88.3994', '23', 0, 285, 0),
(304, '2024-02-22', '1020', '4000/K08', NULL, 'Frozen', '1up', '8.9', '14.5426', '0', 0, 286, 0),
(305, '2024-02-22', '1020', '4000/K08', NULL, 'Frozen', '2up', '132.4', '216.3416', '0', 0, 287, 0),
(306, '2024-02-22', '1020', '4000/K08', NULL, 'Frozen', '3up', '94.6', '154.5764', '0', 0, 288, 0),
(307, '2024-02-22', '1020', '4000/K08', NULL, 'Frozen', '5up', '22.9', '37.4186', '0', 0, 289, 0),
(308, '2024-02-22', '1020', '4000/B01', NULL, 'Frozen', '1up', '4.4', '7.1896', '0', 0, 290, 0),
(309, '2024-02-22', '1020', '4000/B01', NULL, 'Frozen', '2up', '63.8', '104.2492', '0', 0, 291, 0),
(310, '2024-02-22', '1020', '4000/B01', NULL, 'Frozen', '3up', '7.2', '11.7648', '0', 0, 292, 0),
(311, '2024-02-22', '1020', '4000/B01', NULL, 'Frozen', '5up', '211.9', '346.2446', '0', 0, 293, 0),
(312, '2024-02-22', '1023', '4000/S03', NULL, 'Frozen', '1up', '24.5', '40.033', '0', 0, 294, 0),
(313, '2024-02-22', '1023', '4000/S03', NULL, 'Frozen', '2up', '686.5', '1121.741', '0', 0, 295, 0),
(314, '2024-02-22', '1023', '4000/S03', NULL, 'Frozen', '3up', '30.2', '49.3468', '0', 0, 296, 0),
(315, '2024-02-22', '1023', '4000/S03', NULL, 'Frozen', '4up', '260.4', '425.4936', '0', 0, 297, 0),
(316, '2024-02-23', '1020', '4000/K08', NULL, 'Frozen', '2up', '117.4', '191.8316', '0', 0, 298, 0),
(317, '2024-02-23', '1020', '4000/K08', NULL, 'Frozen', '3up', '48.6', '79.4124', '0', 0, 299, 0),
(318, '2024-02-23', '1020', '4000/K08', NULL, 'Frozen', '5up', '43.6', '71.2424', '0', 0, 300, 0),
(319, '2024-02-23', '1016', '4000/K08', NULL, 'Frozen', 'J', '19.8', '32.3532', '0', 0, 301, 0),
(320, '2024-02-23', '1023', '4000/S03', NULL, 'Frozen', '1up', '5.6', '9.1504', '0', 0, 302, 0),
(321, '2024-02-23', '1023', '4000/S03', NULL, 'Frozen', '2up', '367.3', '600.1682', '0', 0, 303, 0),
(322, '2024-02-23', '1023', '4000/S03', NULL, 'Frozen', '3up', '1480.5', '2419.137', '0', 0, 304, 0),
(323, '2024-02-23', '1023', '4000/S03', NULL, 'Frozen', '4up', '535.1', '874.3534', '0', 0, 305, 0),
(324, '2024-02-24', '1002', '4000/Z03', NULL, 'Frozen', '2up D', '28.3', '46.2422', '0', 0, 306, 0),
(325, '2024-02-24', '1002', '4000/Z03', NULL, 'Frozen', '2up', '134.5', '219.773', '0', 0, 307, 0),
(326, '2024-02-24', '1002', '4000/Z03', NULL, 'Frozen', '1up', '101.5', '165.851', '0', 0, 308, 0),
(327, '2024-02-24', '1001', '4000/Z03', NULL, 'Frozen', '1up D', '17.2', '28.1048', '0', 0, 309, 0),
(328, '2024-02-24', '1001', '4000/Z03', NULL, 'Frozen', '1up', '175', '285.95', '0', 0, 310, 0),
(329, '2024-02-24', '1001', '4000/Z03', NULL, 'Frozen', '2up D', '11.1', '18.1374', '0', 0, 311, 0),
(330, '2024-02-24', '1001', '4000/Z03', NULL, 'Frozen', '2up', '29.2', '47.7128', '0', 0, 312, 0),
(331, '2024-02-24', '1020', '4000/K08', NULL, 'Frozen', '2up', '150.7', '246.2438', '0', 0, 313, 0),
(332, '2024-02-24', '1020', '4000/K08', NULL, 'Frozen', '3up', '130.3', '212.9102', '0', 0, 314, 0),
(333, '2024-02-24', '1020', '4000/K08', NULL, 'Frozen', '6up', '4.5', '7.353', '0', 0, 315, 0),
(334, '2024-02-24', '1031', '4000/T05', NULL, 'Frozen', '18/24', '36.5', '59.641', '0', 0, 316, 0),
(335, '2024-02-24', '1031', '4000/T05', NULL, 'Frozen', '2up', '3931.4', '6423.9076', '0', 0, 317, 0),
(336, '2024-02-24', '1031', '4000/T05', NULL, 'Frozen', '3up', '1299.4', '2123.2196', '0', 0, 318, 0),
(337, '2024-02-24', '1031', '4000/T05', NULL, 'Frozen', '4up', '673.1', '1099.8454', '0', 0, 319, 0),
(338, '2024-02-24', '1023', '4000/T05', NULL, 'Frozen', '2up', '207.1', '338.4014', '0', 0, 320, 0),
(339, '2024-02-24', '1023', '4000/T05', NULL, 'Frozen', '3up', '155.9', '254.7406', '0', 0, 321, 0),
(340, '2024-02-24', '1023', '4000/T05', NULL, 'Frozen', '4up', '37.5', '61.275', '0', 0, 322, 0),
(341, '2024-02-24', '1023', '4000/T05', NULL, 'Frozen', '5/6up', '87.2', '142.4848', '0', 0, 323, 0),
(342, '2024-02-24', '1023', '4000/S03', NULL, 'Frozen', '2up', '705.8', '1153.2772', '0', 0, 324, 0),
(343, '2024-02-24', '1023', '4000/S03', NULL, 'Frozen', '3up', '516.9', '844.6146', '0', 0, 325, 0),
(344, '2024-02-24', '1023', '4000/S03', NULL, 'Frozen', '4up', '114.3', '186.7662', '0', 0, 326, 0),
(345, '0000-00-00', '1002', '4000/Z03', 'can', 'Frozen', '4up', '', '', '', 4, 86, 0),
(346, '0000-00-00', '1002', '4000/Z03', 'can', 'Frozen', '5up', '', '', '', 2, 86, 0),
(347, '0000-00-00', '1002', '4000/Z03', 'can', 'Frozen', '7up', '', '', '', 2, 86, 0),
(348, '0000-00-00', '1002', '4000/Z03', 'can', 'Frozen', '8up', '', '', '', 3, 86, 0),
(350, '0000-00-00', '1012', '4000/D02', '', 'Frozen', '3up', '', '', '', 0, 277, 0),
(351, '2024-02-26', '1020', '4000/k08', NULL, 'Frozen', '2 up', '170.4', '278.4336', '102', 0, 328, 0),
(352, '2024-02-26', '1020', '4000/k08', NULL, 'Frozen', '3 up', '38', '62.092', '16', 0, 329, 0),
(353, '2024-02-26', '1020', '4000/k08', NULL, 'Frozen', '5 up', '36.9', '60.2946', '9', 0, 330, 0),
(354, '2024-02-26', '1020', '4000/k09', NULL, 'Frozen', '2 up', '133.5', '218.139', '82', 0, 331, 0),
(355, '2024-02-26', '1020', '4000/k09', NULL, 'Frozen', '3 up', '250.4', '409.1536', '69', 0, 332, 0),
(356, '2024-02-26', '1002', '4000/Z03', NULL, 'Frozen', '1 up', '41.1', '67.1574', '43', 0, 333, 0),
(357, '2024-02-26', '1002', '4000/Z03', NULL, 'Frozen', '1 D', '1.2', '1.9608', '2', 0, 334, 0),
(358, '2024-02-26', '1002', '4000/Z03', NULL, 'Frozen', '2 up', '7.7', '12.5818', '5', 0, 335, 0),
(359, '2024-02-26', '1002', '4000/Z03', NULL, 'Frozen', '2 D', '8', '13.072', '7', 0, 336, 0),
(360, '2024-02-26', '1002', '4000/Z03', NULL, 'Frozen', '3 up', '41.6', '67.9744', '14', 0, 337, 0),
(361, '2024-02-26', '1001', '4000/Z03', NULL, 'Frozen', '1 up', '29.4', '48.0396', '33', 0, 338, 0),
(362, '2024-02-26', '1001', '4000/Z03', NULL, 'Frozen', '1 D', '17.5', '28.595', '30', 0, 339, 0),
(363, '2024-02-26', '1001', '4000/Z03', NULL, 'Frozen', '2 up', '72.8', '118.9552', '49', 0, 340, 0),
(364, '2024-02-26', '1001', '4000/Z03', NULL, 'Frozen', '2 D', '78.5', '128.269', '67', 0, 341, 0),
(365, '2024-02-26', '1001', '4000/Z03', NULL, 'Frozen', '3 up', '34.9', '57.0266', '13', 0, 342, 0),
(366, '2024-02-26', '1015', '4000/Y01', NULL, 'Frozen', '5/8', '29.8', '48.6932', '80', 0, 343, 0),
(367, '2024-02-26', '1015', '4000/T11', NULL, 'Frozen', '5/8', '118.3', '193.3022', '306', 0, 344, 0),
(368, '2024-02-26', '1015', '4000/S04', NULL, 'Frozen', '5/8', '129.25', '211.1945', '348', 0, 345, 0),
(370, '2024-02-26', '1020', '4000/T07', NULL, 'Frozen', '2 up', '98.6', '161.1124', '63', 0, 347, 0),
(371, '2024-02-26', '1020', '4000/T07', NULL, 'Frozen', '3 up', '77.9', '127.2886', '32', 0, 348, 0),
(372, '2024-02-26', '1020', '4000/T07', NULL, 'Frozen', '5 up', '46.9', '76.6346', '9', 0, 349, 0),
(373, '2024-02-26', '1030', '4000/T07', NULL, 'Frozen', 'J', '66.4', '108.4976', '56', 0, 350, 0),
(374, '2024-02-27', '1031', '4000/T05', NULL, 'Frozen', '2 up', '1263.8', '2065.0492', '585', 0, 351, 0),
(375, '2024-02-27', '1031', '4000/T05', NULL, 'Frozen', '3 up', '1930.7', '3154.7638', '959', 0, 352, 0),
(376, '2024-02-27', '1031', '4000/T05', NULL, 'Frozen', '4 up', '112.2', '183.3348', '20', 0, 353, 0),
(377, '2024-02-27', '1031', '4000/T05', NULL, 'Frozen', '18/24', '4.3', '7.0262', '', 0, 354, 0),
(378, '2024-02-27', '1017', '4000/T05', NULL, 'Frozen', '2 up', '34.8', '56.8632', '16', 0, 355, 0),
(379, '2024-02-27', '1017', '4000/T05', NULL, 'Frozen', '3 up', '112.3', '183.4982', '46', 0, 356, 0),
(380, '2024-02-27', '1026', '4000/T05', NULL, 'Frozen', '8/10', '22.8', '37.2552', '40', 0, 357, 0),
(381, '2024-02-27', '1039', '4000/T05', NULL, 'Frozen', '1 up', '95', '155.23', '128', 0, 358, 0),
(382, '2024-02-27', '1036', '4000/T05', NULL, 'Frozen', '8/10', '11.3', '18.4642', '20', 0, 359, 0),
(383, '2024-02-27', '1023', '4000/S03', NULL, 'Frozen', '1 up', '127.9', '208.9886', '92', 0, 360, 0),
(384, '2024-02-27', '1023', '4000/S03', NULL, 'Frozen', '2 up', '837.7', '1368.8018', '536', 0, 361, 0),
(385, '2024-02-27', '1023', '4000/S03', NULL, 'Frozen', '3 up', '20.9', '34.1506', '10', 0, 362, 0),
(386, '2024-02-27', '1001', '4000/Z03', NULL, 'Frozen', '1 up', '17.4', '28.4316', '16', 0, 363, 0),
(387, '2024-02-27', '1001', '4000/Z03', NULL, 'Frozen', '2 up D', '45.7', '74.6738', '23', 0, 364, 0),
(388, '2024-02-27', '1001', '4000/Z03', NULL, 'Frozen', '2 up', '67.9', '110.9486', '69', 0, 365, 0),
(389, '2024-02-27', '1001', '4000/Z03', NULL, 'Frozen', '3 up', '50.5', '82.517', '63', 0, 366, 0),
(390, '2024-02-27', '1002', '4000/Z03', NULL, 'Frozen', '1 up', '16.5', '26.961', '28', 0, 367, 0),
(392, '2024-02-27', '1002', '4000/Z03', NULL, 'Frozen', '2 D', '27.2', '44.4448', '43', 0, 369, 0),
(393, '2024-02-27', '1002', '4000/Z03', NULL, 'Frozen', '2 up', '121.6', '198.6944', '49', 0, 370, 0),
(394, '2024-02-27', '1002', '4000/Z03', NULL, 'Frozen', '3 up', '139.9', '228.5966', '20', 0, 371, 0),
(395, '2024-02-27', '1001', '4000/T02', NULL, 'Frozen', '3 up', '41.7', '68.1378', '18', 0, 372, 0),
(396, '2024-02-27', '1001', '4000/T02', NULL, 'Frozen', '2 up', '27.3', '44.6082', '19', 0, 373, 0),
(397, '2024-02-27', '1001', '4000/T02', NULL, 'Frozen', '1.5 up', '93', '151.962', '91', 0, 374, 0),
(398, '2024-02-27', '1002', '4000/T02', NULL, 'Frozen', '3 up', '31.5', '51.471', '13', 0, 375, 0),
(399, '2024-02-27', '1002', '4000/T02', NULL, 'Frozen', '2 up', '30.2', '49.3468', '19', 0, 376, 0),
(400, '2024-02-27', '1015', '4000/001', NULL, 'Frozen', '5/8', '115.7', '189.0538', '317', 0, 377, 0),
(401, '2024-02-28', '1015', '4000/G02', NULL, 'Frozen', '5/8', '93.55', '152.8607', '249', 0, 378, 0),
(402, '2024-02-28', '1015', '4000/G02', NULL, 'Frozen', '500', '19.6', '32.0264', '57', 0, 379, 0),
(403, '2024-02-28', '1020', '4000/K09', NULL, 'Frozen', '2 up', '69', '112.746', '43', 0, 380, 0),
(404, '2024-02-28', '1020', '4000/K09', NULL, 'Frozen', '3 up', '238.3', '389.3822', '78', 0, 381, 0),
(405, '2024-02-28', '1036', '4000/T12', NULL, 'Frozen', 'J', '649.5', '1061.283', '', 0, 382, 0),
(406, '2024-02-28', '1026', '4000/T12', NULL, 'Frozen', 'J', '641.5', '1048.211', '', 0, 383, 0),
(407, '2024-02-28', '1015', '4000/T11', NULL, 'Frozen', '5/8', '140.4', '229.4136', '387', 0, 384, 0),
(408, '2024-02-28', '1030', '4000/T07', NULL, 'Frozen', 'J', '114.9', '187.7466', '109', 0, 385, 0),
(409, '2024-02-28', '1020', '4000/T07', NULL, 'Frozen', '2 up', '35.4', '57.8436', '22', 0, 386, 0),
(410, '2024-02-28', '1020', '4000/T07', NULL, 'Frozen', '3 up', '9.8', '16.0132', '4', 0, 387, 0),
(411, '2024-02-28', '1020', '4000/T07', NULL, 'Frozen', '5 up', '101.2', '165.3608', '22', 0, 388, 0),
(412, '2024-02-28', '1031', '4000/T05', NULL, 'Frozen', '2 up', '33.1', '54.0854', '', 0, 389, 0),
(413, '2024-02-28', '1031', '4000/T05', NULL, 'Frozen', '3 up', '1200.4', '1961.4536', '', 0, 390, 0),
(414, '2024-02-28', '1031', '4000/T05', NULL, 'Frozen', '4 up', '103.6', '169.2824', '', 0, 391, 0),
(415, '2024-02-28', '1023', '4000/T05', NULL, 'Frozen', '2 up', '91.6', '149.6744', '', 0, 392, 0),
(416, '2024-02-28', '1023', '4000/T05', NULL, 'Frozen', '3 up', '128.9', '210.6226', '', 0, 393, 0),
(417, '2024-02-28', '1023', '4000/T05', NULL, 'Frozen', '4 up', '19.1', '31.2094', '', 0, 394, 0),
(418, '2024-02-28', '1017', '4000/T05', NULL, 'Frozen', '2 up', '279.1', '456.0494', '', 0, 395, 0),
(419, '2024-02-28', '1026', '4000/T05', NULL, 'Frozen', '8/10', '64.7', '105.7198', '', 0, 396, 0),
(420, '2024-02-28', '1026', '4000/T05', NULL, 'Frozen', '1 up', '152.3', '248.8582', '', 0, 397, 0),
(421, '2024-02-28', '1036', '4000/T05', NULL, 'Frozen', '1 up', '20.6', '33.6604', '', 0, 398, 0),
(422, '2024-02-28', '1002', '4000/Z03', NULL, 'Frozen', '1 up', '6.4', '10.4576', '', 0, 399, 0),
(423, '2024-02-28', '1002', '4000/Z03', NULL, 'Frozen', '2 up', '16.9', '27.6146', '', 0, 400, 0),
(424, '2024-02-28', '1002', '4000/Z03', NULL, 'Frozen', '3 up', '64.6', '105.5564', '', 0, 401, 0),
(426, '2024-02-28', '1001', '4000/Z03', NULL, 'Frozen', '1 up D', '6.5', '10.621', '', 0, 403, 0),
(427, '2024-02-28', '1001', '4000/Z03', NULL, 'Frozen', '1 up', '86.4', '141.1776', '', 0, 404, 0),
(428, '2024-02-28', '1001', '4000/Z03', NULL, 'Frozen', '2 up D', '12.2', '19.9348', '', 0, 405, 0),
(429, '2024-02-28', '1001', '4000/Z03', NULL, 'Frozen', '2 up', '33.5', '54.739', '', 0, 406, 0),
(430, '2024-02-28', '1001', '4000/Z03', NULL, 'Frozen', '3 up', '38.1', '62.2554', '', 0, 407, 0),
(431, '2024-02-28', '1020', '4000/K08', NULL, 'Frozen', '2 up', '61.7', '100.8178', '', 0, 408, 0),
(432, '2024-02-28', '1020', '4000/K08', NULL, 'Frozen', '3 up', '225.6', '368.6304', '', 0, 409, 0),
(433, '2024-02-28', '1020', '4000/K08', NULL, 'Frozen', '5 up', '225', '367.65', '', 0, 410, 0),
(434, '2024-02-28', '1016', '4000/K08', NULL, 'Frozen', 'J', '42.6', '69.6084', '', 0, 411, 0),
(435, '2024-02-28', '1020', '4000/B01', NULL, 'Frozen', '1 up', '25', '40.85', '', 0, 412, 0),
(436, '2024-02-28', '1020', '4000/B01', NULL, 'Frozen', '2 up', '108.9', '177.9426', '', 0, 413, 0),
(437, '2024-02-28', '1020', '4000/B01', NULL, 'Frozen', '3 up', '353', '576.802', '', 0, 414, 0),
(438, '2024-02-28', '1020', '4000/B01', NULL, 'Frozen', '5 up', '272.1', '444.6114', '', 0, 415, 0),
(439, '2024-02-29', '1015', '4000/P01', NULL, 'Frozen', '5/8', '37.7', '61.6018', '103', 0, 416, 0),
(440, '2024-02-29', '1015', '4000/P01', NULL, 'Frozen', '5/8 D', '15.9', '25.9806', '53', 0, 417, 0),
(441, '2024-02-29', '1015', '4000/W01', NULL, 'Frozen', '5/8', '63.8', '104.2492', '186', 0, 418, 0),
(442, '2024-02-29', '1031', '4000/T05', NULL, 'Frozen', '2 up', '1440.3', '2353.4502', '', 0, 419, 0),
(443, '2024-02-29', '1031', '4000/T05', NULL, 'Frozen', '3 up', '2296.3', '3752.1542', '', 0, 420, 0),
(444, '2024-02-29', '1031', '4000/T05', NULL, 'Frozen', '4 up', '614.3', '1003.7662', '', 0, 421, 0),
(445, '2024-02-29', '1031', '4000/T05', NULL, 'Frozen', '18/24', '25.3', '41.3402', '', 0, 422, 0),
(446, '2024-02-29', '1036', '4000/T05', NULL, 'Frozen', '8/10', '182.2', '297.7148', '', 0, 423, 0),
(447, '2024-02-29', '1036', '4000/T05', NULL, 'Frozen', '1 up', '280.9', '458.9906', '', 0, 424, 0),
(448, '2024-02-29', '1023', '4000/T05', NULL, 'Frozen', '2 up', '92.2', '150.6548', '', 0, 425, 0),
(449, '2024-02-29', '1023', '4000/T05', NULL, 'Frozen', '3 up', '118', '192.812', '', 0, 426, 0),
(450, '2024-02-29', '1017', '4000/S03', NULL, 'Frozen', '2 up', '386.4', '631.3776', '', 0, 427, 0),
(451, '2024-02-29', '1017', '4000/S03', NULL, 'Frozen', '3 up', '301.9', '493.3046', '', 0, 428, 0),
(452, '2024-02-29', '1023', '4000/S03', NULL, 'Frozen', '1 up', '444.1', '725.6594', '', 0, 429, 0),
(453, '2024-02-29', '1023', '4000/S03', NULL, 'Frozen', '2 up', '923.3', '1508.6722', '', 0, 430, 0),
(454, '2024-02-29', '1023', '4000/S03', NULL, 'Frozen', '3 up', '551.6', '901.3144', '', 0, 431, 0),
(455, '2024-02-29', '1023', '4000/S03', NULL, 'Frozen', '4 up', '659.9', '1078.2766', '', 0, 432, 0);

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

--
-- Dumping data for table `form10stock`
--

INSERT INTO `form10stock` (`id`, `date`, `item_id`, `supplier_id`, `country`, `type`, `size`, `pcsform10`, `mc`, `kg`, `pcs`, `looseinkg`, `looseinpcs`, `looseoutkg`, `looseoutpcs`, `total_kg`, `percentage`) VALUES
(24, '2024-02-07', '1002', '4000/Z03', 'can', 'frozen', '2 D', 13, 1, '20', 11, '8.3', 4, '4.2', 2, '24.1', ''),
(25, '2024-02-07', '1002', '4000/Z03', 'can', 'frozen', '2up', 41, 5, '101', 41, '10.8', 4, '9.9', 4, '101.9', ''),
(26, '2024-02-07', '1002', '4000/Z03', 'can', 'frozen', '3up', 6, 1, '22', 6, '6.9', 2, '6.9', 2, '22', ''),
(27, '2024-02-07', '1002', '4000/Z03', 'can', 'frozen', '4up', 1, 0, '', 0, '4.7', 1, '', 0, '4.7', ''),
(28, '2024-02-07', '1002', '4000/Z03', 'can', 'frozen', '5up', 4, 1, '23', 4, '', 0, '', 0, '23', ''),
(29, '2024-02-07', '1002', '4000/Z03', 'can', 'frozen', '7up', 2, 0, '', 0, '15', 2, '', 0, '15', ''),
(30, '2024-02-07', '1002', '4000/Z03', 'can', 'frozen', '8up', 3, 1, '26', 3, '17.3', 2, '17.6', 2, '25.7', ''),
(31, '2024-02-11', '1023', '4000/T05', 'Can/NY', 'frozen', '2up', 202, 26, '523', 200, '5.5', 2, '', 0, '528.5', ''),
(32, '2024-02-11', '1023', '4000/T05', 'Can/NY', 'frozen', '3up', 74, 12, '245', 72, '7', 2, '', 0, '252', ''),
(33, '2024-02-11', '1023', '4000/T05', 'Can/NY', 'frozen', '4up', 2, 0, '', 0, '9', 2, '', 0, '9', '');

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
(566, '2024-01-31', '', '3600/001', '0', '0', '213847883', '', '', '', 0, 0, 0),
(567, '2024-02-10', 'Closing Balance From SAF-18/2023', '3300/002', '0', '0', '136750.69', '', '', '', 0, 0, 0),
(568, '2024-02-16', 'Closing Balance Adv; Received from 01/2024', '3300/003', '0', '0', '-34007.64', '', '', '', 0, 0, 0),
(569, '2024-02-03', 'Closing Balance From Italy -01/2024', '3300/004', '0', '0', '46969.36', '', '', '', 0, 0, 0),
(570, '2024-02-19', 'Closing Balance Adv; From KOLKATA', '3300/005', '0', '0', '-33410.00', '', '', '', 0, 0, 0),
(853, '2023-09-08', 'SAF-001', '3300/002', '151492', '0', '288243.06', '', 'SAF-19/2023', ':FBIU-5271600', 0, 35, 124),
(854, '2023-09-08', 'SAF-001', '5000/001', '0', '151492', '-151492.37', '', '', '', 0, 36, 125),
(855, '2023-09-26', 'SAF-002', '3300/002', '116818', '0', '405061.26', '', 'SAF-20/2023', ':FSCU-5300057', 0, 35, 127),
(856, '2023-09-26', 'SAF-002', '5000/001', '0', '116818', '-268310.57', '', '', '', 0, 36, 129),
(857, '2023-10-26', 'SAF-003', '3300/002', '87344', '0', '492404.99', '', 'SAF-21/2023', ':TTNU-8730235', 0, 35, 132),
(858, '2023-10-26', 'SAF-003', '5000/001', '0', '87343.7', '-355654.3', '', '', '', 0, 36, 133),
(859, '2023-10-26', 'SAF-004', '3300/002', '92747', '0', '585151.56', '', 'SAF-22/2023', ':OOLU-6250426', 0, 35, 134),
(860, '2023-10-26', 'SAF-004', '5000/001', '0', '92746.6', '-448400.87', '', '', '', 0, 36, 136),
(861, '2023-11-22', 'SAF-005', '3300/002', '98874', '0', '684025.76', '', 'SAF-23/2023', ':CRSU-6118527', 0, 35, 139),
(862, '2023-11-22', 'SAF-005', '5000/001', '0', '98874.2', '-547275.07', '', '', '', 0, 36, 140),
(863, '2023-11-23', 'SAF-006', '3300/002', '95217', '0', '779242.87', '', 'SAF-24/2023', ':CXRU-1440458', 0, 35, 141),
(864, '2023-11-23', 'SAF-006', '5000/001', '0', '95217.1', '-642492.18', '', '', '', 0, 36, 142),
(865, '2023-12-15', 'SAF-007', '3300/002', '66774', '0', '846016.92', '', 'SAF-25/2023', ':OERU-4219167', 0, 35, 143),
(866, '2023-12-15', 'SAF-007', '5000/001', '0', '66774', '-709266.23', '', '', '', 0, 36, 144),
(867, '2023-12-21', 'SAF-008', '3300/002', '91268', '0', '937285.37', '', 'SAF-26/2023', ':TTNU-8059533', 0, 35, 145),
(868, '2023-12-21', 'SAF-008', '5000/001', '0', '91268.5', '-800534.68', '', '', '', 0, 36, 146),
(869, '2023-12-28', 'SAF-009', '3300/002', '105649', '0', '1042934.81', '', 'SAF-27/2023', ':SEGU-9662141', 0, 35, 147),
(870, '2023-12-28', 'SAF-009', '5000/001', '0', '105649', '-906184.12', '', '', '', 0, 36, 148),
(871, '2024-02-01', 'Dr-Feb 24/001', '9100/003', '5400', '0', '5400', 'Water 6 pk purchase for WH', '', '', 0, 39, 54),
(872, '2024-02-01', 'Dr-Feb 24/001', '3600/001', '0', '5400', '213842483', 'Water 6 pk purchase for WH', '', '', 0, 35, 55),
(873, '2024-02-01', 'Dr-Feb 24/002', '9100/004', '39000', '0', '39000', 'Sir Phone Bill and Monthly/ Phone 6 pcs Bill/ Sir-6000 (Sir,Daw Nan,Lai-15000) (Office,Sandar,Mar)', '', '', 0, 39, 58),
(874, '2024-02-01', 'Dr-Feb 24/002', '3600/001', '0', '39000', '213803483', 'Sir Phone Bill and Monthly/ Phone 6 pcs Bill/ Sir-6000 (Sir,Daw Nan,Lai-15000) (Office,Sandar,Mar)', '', '', 0, 35, 59),
(875, '2024-02-01', 'Dr Feb\'24/003', '9100/005', '14000', '0', '14000', 'Medicine and Taxi for sir', '', '', 0, 39, 60),
(876, '2024-02-01', 'Dr Feb\'24/003', '3600/001', '0', '14000', '213789483', 'Medicine and Taxi for sir', '', '', 0, 35, 61),
(877, '2024-02-01', 'Dr Feb\'24/004', '9100/006', '80000', '0', '80000', 'Car Diesel for 5L-2848 (30.1.24-10000)(30.1.24-70000)', '', '', 0, 39, 62),
(878, '2024-02-01', 'Dr Feb\'24/004', '3600/001', '0', '80000', '213709483', 'Car Diesel for 5L-2848 (30.1.24-10000)(30.1.24-70000)', '', '', 0, 35, 63),
(879, '2024-02-01', 'Dr Feb\'24/005', '9100/006', '50000', '0', '130000', 'Car Diesel for 6J-3015 (31.1.24-50000)', '', '', 0, 39, 64),
(880, '2024-02-01', 'Dr Feb\'24/005', '3600/001', '0', '50000', '213659483', 'Car Diesel for 6J-3015 (31.1.24-50000)', '', '', 0, 35, 65),
(881, '2024-02-01', 'Dr Feb\'24/006', '9100/007', '50000', '0', '50000', 'Material and Taxi Charges for PK Machine', '', '', 0, 39, 66),
(882, '2024-02-01', 'Dr Feb\'24/006', '3600/001', '0', '50000', '213609483', 'Material and Taxi Charges for PK Machine', '', '', 0, 35, 67),
(883, '2024-02-01', 'Dr Feb\'24/007', '3300/001', '89928700', '0', '89928700', 'Bejon Loan take from LM 2020ED Balance $25176*3572ks(Best Brand)', '', '', 0, 35, 68),
(884, '2024-02-01', 'Dr Feb\'24/007', '3600/001', '0', '89928700', '123680783', 'Bejon Loan take from LM 2020ED Balance $25176*3572ks(Best Brand)', '', '', 0, 35, 69),
(885, '2024-02-01', 'Dr Feb\'24/008', '9100/008', '377000', '0', '377000', 'DHL charges for Italy Document sent', '', '', 0, 39, 70),
(886, '2024-02-01', 'Dr Feb\'24/008', '3600/001', '0', '377000', '123303783', 'DHL charges for Italy Document sent', '', '', 0, 35, 71),
(887, '2024-02-01', 'Dr Feb\'24/009', '4000/K06', '100000', '0', '100000', 'Paid to Ka Yin Lay for Vr No-11337', '', '', 0, 40, 76),
(888, '2024-02-01', 'Dr Feb\'24/009', '3600/001', '0', '100000', '123203783', 'Paid to Ka Yin Lay for Vr No-11337', '', '', 0, 35, 77),
(889, '2024-02-01', 'Dr Feb\'24/010', '9100/009', '1500', '0', '1500', 'Wave Money charges for Ka Yin Lay Money sent', '', '', 0, 39, 78),
(890, '2024-02-01', 'Dr Feb\'24/010', '3600/001', '0', '1500', '123202283', 'Wave Money charges for Ka Yin Lay Money sent', '', '', 0, 35, 79),
(891, '2024-02-01', 'Dr Feb\'24/011', '9100/001', '17754000', '0', '17754000', 'All people Salary Payment for Jan/24', '', '', 0, 39, 80),
(892, '2024-02-01', 'Dr Feb\'24/011', '3600/001', '0', '17754000', '105448283', 'All people Salary Payment for Jan/24', '', '', 0, 35, 81),
(893, '2024-02-01', 'Dr Feb\'24/011', '9100/010', '17351000', '0', '17351000', 'All people Annual Bonus Paid for Jan/24', '', '', 0, 39, 82),
(894, '2024-02-01', 'Dr Feb\'24/011', '3600/001', '0', '17351000', '88097283', 'All people Annual Bonus Paid for Jan/24', '', '', 0, 35, 83),
(895, '2024-02-01', 'Dr Feb\'24/012', '9100/011', '3000000', '0', '3000000', 'Donation for Bangladesh Embassy', '', '', 0, 39, 84),
(896, '2024-02-01', 'Dr Feb\'24/012', '3600/001', '0', '3000000', '85097283', 'Donation for Bangladesh Embassy', '', '', 0, 35, 85),
(897, '2024-02-02', 'Dr Feb\'24/013', '9100/002', '15000', '0', '15000', 'Taxi charges for Ocean Pacfic to WH', '', '', 0, 39, 86),
(898, '2024-02-02', 'Dr Feb\'24/013', '3600/001', '0', '15000', '85082283', 'Taxi charges for Ocean Pacfic to WH', '', '', 0, 35, 87),
(899, '2024-02-02', 'Dr Feb\'24/014', '6100/003', '52500', '0', '52500', 'Carton Box purchase for Ocean Pacfic pk', '', '', 0, 37, 88),
(900, '2024-02-02', 'Dr Feb\'24/014', '3600/001', '0', '52500', '85029783', 'Carton Box purchase for Ocean Pacfic pk', '', '', 0, 35, 89),
(901, '2024-02-02', 'Dr Feb\'24/015', '6100/001', '289000', '0', '289000', 'Labour Charges and Taxi Charges for (Rohu)', '', '', 0, 37, 90),
(902, '2024-02-02', 'Dr Feb\'24/015', '3600/001', '0', '289000', '84740783', 'Labour Charges and Taxi Charges for (Rohu)', '', '', 0, 35, 91),
(903, '2024-02-02', 'Dr Feb\'24/016', '6100/002', '90000', '0', '90000', 'Ice 10 pcs purchase for HHK (D-Puti,Rohu,Ayer)', '', '', 0, 37, 92),
(904, '2024-02-02', 'Dr Feb\'24/016', '3600/001', '0', '90000', '84650783', 'Ice 10 pcs purchase for HHK (D-Puti,Rohu,Ayer)', '', '', 0, 35, 93),
(905, '2024-02-02', 'Dr Feb\'24/017', '6100/003', '170000', '0', '222500', 'JCV Rope purchase for HHK pk pcs*85000', '', '', 0, 37, 94),
(906, '2024-02-02', 'Dr Feb\'24/017', '3600/001', '0', '170000', '84480783', 'JCV Rope purchase for HHK pk pcs*85000', '', '', 0, 35, 95),
(907, '2024-02-02', 'Dr Feb\'24/018', '9100/002', '43000', '0', '58000', 'Taxi Charges for HHK to WH and WH to GFC', '', '', 0, 39, 96),
(908, '2024-02-02', 'Dr Feb\'24/018', '3600/001', '0', '43000', '84437783', 'Taxi Charges for HHK to WH and WH to GFC', '', '', 0, 35, 97),
(909, '2024-02-02', 'Dr Feb\'24/019', '6100/004', '130000', '0', '130000', 'WH to HHK Fish carry car charges', '', '', 0, 37, 98),
(910, '2024-02-02', 'Dr Feb\'24/019', '3600/001', '0', '130000', '84307783', 'WH to HHK Fish carry car charges', '', '', 0, 35, 99),
(911, '2024-02-02', 'Dr Feb\'24/020', '9100/012', '62000', '0', '62000', 'Workers 31 pcs Dinner for (OT) (Rohu)', '', '', 0, 39, 100),
(912, '2024-02-02', 'Dr Feb\'24/020', '3600/001', '0', '62000', '84245783', 'Workers 31 pcs Dinner for (OT) (Rohu)', '', '', 0, 35, 101),
(913, '2024-02-02', 'Dr Feb\'24/021', '9100/007', '85000', '0', '135000', 'Material purchase and service charges for WH (Boy Tiolet)', '', '', 0, 39, 102),
(914, '2024-02-02', 'Dr Feb\'24/021', '3600/001', '0', '85000', '84160783', 'Material purchase and service charges for WH (Boy Tiolet)', '', '', 0, 35, 103),
(915, '2024-02-02', 'Dr Feb\'24/022', '9100/012', '7000', '0', '69000', 'Fruit purchase for Sir', '', '', 0, 39, 104),
(916, '2024-02-02', 'Dr Feb\'24/022', '3600/001', '0', '7000', '84153783', 'Fruit purchase for Sir', '', '', 0, 35, 105),
(917, '2024-02-02', 'Dr Feb\'24/023', '6100/003', '814500', '0', '1037000', 'Penam and other purchase for WH', '', '', 0, 37, 106),
(918, '2024-02-02', 'Dr Feb\'24/023', '3600/001', '0', '814500', '83339283', 'Penam and other purchase for WH', '', '', 0, 35, 107),
(919, '2024-02-02', 'Dr Feb\'24/024', '6100/002', '42000', '0', '132000', 'Ice 4 pcs and car pk for D-Puti', '', '', 0, 37, 108),
(920, '2024-02-02', 'Dr Feb\'24/024', '3600/001', '0', '42000', '83297283', 'Ice 4 pcs and car pk for D-Puti', '', '', 0, 35, 109),
(921, '2024-02-02', 'Dr Feb\'24/025', '4000/M06', '4000000', '0', '4000000', 'Paid to Mg Mg Soe for Vr No-11152,11185', '', '', 0, 40, 110),
(922, '2024-02-02', 'Dr Feb\'24/025', '3600/001', '0', '4000000', '79297283', 'Paid to Mg Mg Soe for Vr No-11152,11185', '', '', 0, 35, 111),
(923, '2024-02-02', 'Dr-Feb\'24/026', '4000/M03', '5000000', '0', '5000000', 'Paid to Mg Mg Nyunt for Vr-11183,11192', '', '', 0, 40, 115),
(924, '2024-02-02', 'Dr-Feb\'24/026', '3600/001', '0', '5000000', '74297283', 'Paid to Mg Mg Nyunt for Vr-11183,11192', '', '', 0, 35, 116),
(925, '2024-02-02', 'Dr-Feb 24/027', '4000/B02', '3400000', '0', '3400000', 'Paid to BLC (PYM) for Vr No-11221', '', '', 0, 40, 117),
(926, '2024-02-02', 'Dr-Feb 24/027', '3600/001', '0', '3400000', '70897283', 'Paid to BLC (PYM) for Vr No-11221', '', '', 0, 35, 118),
(927, '2024-02-02', 'Dr-Feb 24/028', '4000/T08', '5000000', '0', '5000000', 'Paid to Than Than Myint for Vr No-107788 (10810-2696450)', '', '', 0, 40, 119),
(928, '2024-02-02', 'Dr-Feb 24/028', '3600/001', '0', '5000000', '65897283', 'Paid to Than Than Myint for Vr No-107788 (10810-2696450)', '', '', 0, 35, 120),
(929, '2024-02-02', 'Dr-Feb 24/029', '4000/Y01', '5000000', '0', '5000000', 'Paid to Ye Yint for Vr No-11115,11133', '', '', 0, 40, 122),
(930, '2024-02-02', 'Dr-Feb 24/029', '3600/001', '0', '5000000', '60897283', 'Paid to  Ye Yint for Vr No-11115,11133', '', '', 0, 35, 123),
(931, '2024-02-02', 'Dr-Feb 24/030', '4000/H01', '444200', '0', '444200', 'Paid to Htet Aung Lin for Vr No-10877', '', '', 0, 40, 126),
(932, '2024-02-02', 'Dr-Feb 24/030', '3600/001', '0', '444200', '60453083', 'Paid to Htet Aung Lin for Vr No-10877', '', '', 0, 35, 128),
(933, '2024-02-02', 'Dr-Feb 24/031', '4000/P01', '3500000', '0', '3500000', 'Paid to Phone Naing for Vr No-11249,11268', '', '', 0, 40, 130),
(934, '2024-02-02', 'Dr-Feb 24/031', '3600/001', '0', '3500000', '56953083', 'Paid to Phone Naing for Vr No-11249,11268', '', '', 0, 35, 135),
(935, '2024-02-02', 'Dr-Feb 24/032', '4000/T02', '4000000', '0', '4000000', 'Paid to Thein Htay for Vr No-11269', '', '', 0, 40, 137),
(936, '2024-02-02', 'Dr-Feb 24/032', '3600/001', '0', '4000000', '52953083', 'Paid to Thein Htay for Vr No-11269', '', '', 0, 35, 138),
(937, '2024-02-02', 'Dr Feb\'24/033', '9100/002', '39500', '0', '97500', 'Taxi Charges For Office 5 pcs Payment Day (6:30) PM', '', '', 0, 39, 149),
(938, '2024-02-02', 'Dr Feb\'24/033', '3600/001', '0', '39500', '52913583', 'Taxi Charges For Office 5 pcs Payment Day (6:30) PM', '', '', 0, 35, 150),
(939, '2024-02-02', 'Dr-Feb 24/034', '9100/012', '10000', '0', '79000', 'Meal Allowance for Office 5pcs Payment Day', '', '', 0, 39, 151),
(940, '2024-02-02', 'Dr-Feb 24/034', '3600/001', '0', '10000', '52903583', 'Meal Allowance for Office 5pcs Payment Day', '', '', 0, 35, 152),
(941, '2024-02-02', 'Dr-Feb 24/035', '9100/013', '80000', '0', '80000', 'Water Bill and services for WH (Dec/23) (78000+2000)', '', '', 0, 39, 153),
(942, '2024-02-02', 'Dr-Feb 24/035', '3600/001', '0', '80000', '52823583', 'Water Bill and services for WH (Dec/23) (78000+2000)', '', '', 0, 35, 154),
(943, '2024-02-02', 'Dr-Feb 24/036', '6100/006', '1697000', '0', '1697000', 'Paid to Sticker 5 colour for penam-sticker+other', '', '', 0, 37, 155),
(944, '2024-02-02', 'Dr-Feb 24/036', '3600/001', '0', '1697000', '51126583', 'Paid to Sticker 5 colour for penam-sticker+other', '', '', 0, 35, 156),
(945, '2024-02-02', 'Dr-Feb 24/037', '9100/002', '6000', '0', '103500', 'Taxi Charges for WH to Daw Nan house go for (Htet Paing Aye)', '', '', 0, 39, 157),
(946, '2024-02-02', 'Dr-Feb 24/037', '3600/001', '0', '6000', '51120583', 'Taxi Charges for WH to Daw Nan house go for (Htet Paing Aye)', '', '', 0, 35, 158),
(1006, '2024-02-01', 'Cr-Feb 24/001', '3600/001', '78650250', '0', '129770833', 'USA Money Received from UAB ($74925) 50%34762.5-10=$37452.5*2100ks $37462.5', '', '', 0, 35, 188),
(1007, '2024-02-01', 'Cr-Feb 24/001', '3300/002', '0', '78650250', '-77607315.19', 'USA Money Received from UAB ($74925) 50%34762.5-10=$37452.5*2100ks $37462.5', '', '', 0, 35, 189),
(1008, '2024-02-01', 'Cr-Feb 24/001', '3600/001', '130369500', '0', '260140333', 'USA Money Received from UAB ($74925) 50%34762.5-10=$37452.5*2100ks $37462.5', '', '', 85, 35, 190),
(1009, '2024-02-01', 'Cr-Feb 24/001', '3300/002', '0', '130665300', '-208272615.19', 'USA Money Received from UAB ($74925) 50%34762.5-10=$37452.5*2100ks $37462.5', '', '', 0, 35, 191),
(1010, '2024-02-03', 'Dr-Feb 24/038', '4000/M01', '4000000', '0', '4000000', 'Paid to MA for Vr No-10586', '', '', 0, 40, 192),
(1011, '2024-02-03', 'Dr-Feb 24/038', '3600/001', '0', '4000000', '256140333', 'Paid to MA for Vr No-10586', '', '', 0, 35, 193),
(1012, '2024-02-03', 'Dr-Feb 24/039', '4000/S08', '4000000', '0', '4000000', 'Paid to Soe Naing for Vr No-10534,10542', '', '', 0, 40, 194),
(1013, '2024-02-03', 'Dr-Feb 24/039', '3600/001', '0', '4000000', '252140333', 'Paid to Soe Naing for Vr No-10534,10542', '', '', 0, 35, 195),
(1014, '2024-02-03', 'Dr-Feb 24/040', '4000/K07', '7000000', '0', '7000000', 'Paid to Khin Mg Myint for Vr N0-11189', '', '', 0, 40, 196),
(1015, '2024-02-03', 'Dr-Feb 24/040', '3600/001', '0', '7000000', '245140333', 'paid to Khin Mg Myint for Vr No-11189', '', '', 0, 35, 197),
(1016, '2024-02-03', 'Dr-Feb 24/041', '9100/006', '100000', '0', '230000', 'Car Diesel for 6J-3015(1.2)-50000/ (3.2)-50000', '', '', 0, 39, 198),
(1017, '2024-02-03', 'Dr-Feb 24/041', '3600/001', '0', '100000', '245040333', 'Car Diesel for 6J-3015(1.2)-50000/ (3.2)-50000', '', '', 0, 35, 199),
(1018, '2024-02-03', 'Dr-Feb 24/042', '9100/014', '10000', '0', '10000', 'Engin Oil purchase for 6J-3015', '', '', 0, 39, 200),
(1019, '2024-02-03', 'Dr-Feb 24/042', '3600/001', '0', '10000', '245030333', 'Engin Oil purchase for 6J-3015', '', '', 0, 35, 201),
(1020, '2024-02-03', 'Dr-Feb 24/043', '9100/014', '8000', '0', '18000', 'Car police catch for 6J-3015(2.2)(3.2)', '', '', 0, 39, 202),
(1021, '2024-02-03', 'Dr-Feb 24/043', '3600/001', '0', '8000', '245022333', 'Car police catch for 6J-3015(2.2)(3.2)', '', '', 0, 35, 203),
(1022, '2024-02-03', 'Dr-Feb 24/044', '6100/003', '2112000', '0', '3149000', 'paid to plastic (G/F) for Vr No-(31.1.24)(30.1.24)(30.1.24)', '', '', 0, 37, 204),
(1023, '2024-02-03', 'Dr-Feb 24/044', '3600/001', '0', '2112000', '242910333', 'Paid to plastic (G/F)for Vr No-(31.1.24)(30.1.24)(30.1.24)', '', '', 0, 35, 205),
(1024, '2024-02-03', 'Dr-Feb 24/045', '6100/003', '2193960', '0', '5342960', 'Paid to Carton Box (MMMO)for (31.1.24)Vr 3 pcs', '', '', 0, 37, 206),
(1025, '2024-02-03', 'Dr-Feb 24/045', '3600/001', '0', '2193960', '240716373', 'Paid to Carton Box (MMMO)for (31.1.24)Vr 3 pcs', '', '', 0, 35, 207),
(1026, '2024-02-03', 'Dr-Feb 24/046', '6100/007', '10000000', '0', '10000000', 'Paid to HHK Cold Store', '', '', 0, 37, 208),
(1027, '2024-02-03', 'Dr-Feb 24/046', '3600/001', '0', '10000000', '230716373', 'Paid to HHK Cold Store', '', '', 0, 35, 209),
(1028, '2024-02-03', 'Dr-Feb 24/047', '6100/003', '5730540', '0', '11073500', 'Paid to Carton Box (Swan Pyae) for Vr No-(19.12.23 to 22.12.23)(26.12.23)(27.12.23)(27.12.23)', '', '', 0, 37, 210),
(1029, '2024-02-03', 'Dr-Feb 24/047', '3600/001', '0', '5730540', '224985833', 'Paid to Carton Box (Swan Pyae) for Vr No-(19.12.23 to 22.12.23)(26.12.23)(27.12.23)(27.12.23)', '', '', 0, 35, 211),
(1030, '2024-02-03', 'Dr-Feb 24/048', '6100/003', '435000', '0', '11508500', 'Plastic Packing Strap 3000 M W 5*87000ks', '', '', 0, 37, 212),
(1031, '2024-02-03', 'Dr-Feb 24/048', '3600/001', '0', '435000', '224550833', 'Plastic Packing Strap 3000 M W 5*87000ks', '', '', 0, 35, 213),
(1032, '2024-02-03', 'Dr-Feb 24/049', '6100/003', '2000000', '0', '13508500', 'Paid to Carton Box (Shwe Myay) for (2.12)(12.12)(14.12)', '', '', 0, 37, 214),
(1033, '2024-02-03', 'Dr-Feb 24/049', '3600/001', '0', '2000000', '222550833', 'Paid to Carton Box (Shwe Myay) for (2.12)(12.12)(14.12)', '', '', 0, 35, 215),
(1034, '2024-02-03', 'Dr-Feb 24/050', '9100/003', '1800', '0', '7200', 'Water 2 pk purchase for WH', '', '', 0, 39, 216),
(1035, '2024-02-03', 'Dr-Feb 24/050', '3600/001', '0', '1800', '222549033', 'Water 2 pk purchase for WH', '', '', 0, 35, 217),
(1036, '2024-02-03', 'Dr-Feb 24/051', '6100/002', '27000', '0', '159000', 'lce 3 pcs purchase for HHk(Puti)', '', '', 0, 37, 218),
(1037, '2024-02-03', 'Dr-Feb 24/051', '3600/001', '0', '27000', '222522033', 'lce 3 pcs purchase for HHk(Puti)', '', '', 0, 35, 219),
(1038, '2024-02-03', 'Dr-Feb 24/052', '6100/001', '124200', '0', '413200', 'Labour Charges and Taxi Charges for (D-Puti) (109200+15000)', '', '', 0, 37, 220),
(1039, '2024-02-03', 'Dr-Feb 24/052', '3600/001', '0', '124200', '222397833', 'Labour Charges and Taxi Charges for (D-Puti) (109200+15000)', '', '', 0, 35, 221),
(1040, '2024-02-03', 'Dr-Feb 24/053', '9100/002', '17000', '0', '120500', 'Taxi charges for HHK to WH pk', '', '', 0, 39, 222),
(1041, '2024-02-03', 'Dr-Feb 24/053', '3600/001', '0', '17000', '222380833', 'Taxi charges for HHK to WH pk', '', '', 0, 35, 223),
(1042, '2024-02-03', 'Dr-Feb 24/054', '6100/001', '106800', '0', '520000', 'labour and Taxi Charges for (D-Puit)', '', '', 0, 37, 224),
(1043, '2024-02-03', 'Dr-Feb 24/054', '3600/001', '0', '106800', '222274033', 'labour and Taxi Charges for (D-Puit)', '', '', 0, 35, 225),
(1044, '2024-02-03', 'Dr-Feb 24/055', '6100/002', '36000', '0', '195000', 'lce 4 pcs purchase for (D-Puit)', '', '', 0, 37, 226),
(1045, '2024-02-03', 'Dr-Feb 24/055', '3600/001', '0', '36000', '222238033', 'lce 4 pcs purchase for (D-Puit)', '', '', 0, 35, 227),
(1046, '2024-02-03', 'Dr-Feb 24/056', '9100/002', '17000', '0', '137500', 'Taxi Charges for HHK to WH', '', '', 0, 39, 228),
(1047, '2024-02-03', 'Dr-Feb 24/056', '3600/001', '0', '17000', '222221033', 'Taxi Charges for HHK to WH', '', '', 0, 35, 229),
(1048, '2024-02-03', 'Dr-Feb 24/057', '6100/002', '30000', '0', '225000', 'Ice 3pcs purchase for ( Ocean - Rohn )', '', '', 0, 37, 230),
(1049, '2024-02-03', 'Dr-Feb 24/057', '3600/001', '0', '30000', '222191033', 'Ice 3pcs purchase for ( Ocean - Rohn )', '', '', 0, 35, 231),
(1050, '2024-02-03', 'Dr-Feb 24/058', '6100/001', '10000', '0', '530000', 'Labour Charges for (Rohn)', '', '', 0, 37, 232),
(1051, '2024-02-03', 'Dr-Feb 24/058', '3600/001', '0', '10000', '222181033', 'Labour Charges for (Rohn)', '', '', 0, 35, 233),
(1052, '2024-02-03', 'Dr-Feb 24/059', '9100/015', '519600', '0', '519600', 'Sir present purchase for ( Cambodia go ) wallet and bags (Yangoods)\r\n\r\n', '', '', 0, 39, 234),
(1053, '2024-02-03', 'Dr-Feb 24/059', '3600/001', '0', '519600', '221661433', 'Sir present purchase for ( Cambodia go ) wallet and bags (Yangoods)\r\n\r\n', '', '', 0, 35, 235),
(1054, '2024-02-03', 'Dr-Feb 24/060', '9100/012', '95850', '0', '174850', 'Meal Allowance for Sir +2 pcs', '', '', 0, 39, 236),
(1055, '2024-02-03', 'Dr-Feb 24/060', '3600/001', '0', '95850', '221565583', 'Meal Allowance for Sir +2 pcs', '', '', 0, 35, 237),
(1130, '2024-02-05', 'Dr-Feb 24/061', '9100/003', '1800', '0', '9000', 'Water 2 pk purchase for WH', '', '', 0, 39, 238),
(1131, '2024-02-05', 'Dr-Feb 24/061', '3600/001', '0', '1800', '221563783', 'Water 2 pk purchase for WH', '', '', 0, 35, 239),
(1132, '2024-02-05', 'Dr-Feb 24/062', '9100/006', '100000', '0', '330000', 'Car Diesel for 6J-3015 (4.2)-50000/ (5.2)-50000', '', '', 0, 39, 240),
(1133, '2024-02-05', 'Dr-Feb 24/062', '3600/001', '0', '100000', '221463783', 'Car Diesel for 6J-3015 (4.2)-50000/ (5.2)-50000', '', '', 0, 35, 241),
(1134, '2024-02-05', 'Dr-Feb 24/063', '9100/014', '5000', '0', '23000', 'Car police catch for 6J-3015 (Market)', '', '', 0, 39, 242),
(1135, '2024-02-05', 'Dr-Feb 24/063', '3600/001', '0', '5000', '221458783', 'Car police catch for 6J-3015 (Market)', '', '', 0, 35, 243),
(1136, '2024-02-05', 'Dr-Feb 24/064', '9100/002', '17000', '0', '154500', 'Taxi Charges for HHK to WH (pk)', '', '', 0, 39, 244),
(1137, '2024-02-05', 'Dr-Feb 24/064', '3600/001', '0', '17000', '221441783', 'Taxi Charges for HHK to WH (pk)', '', '', 0, 35, 245),
(1138, '2024-02-05', 'Dr-Feb 24/065', '9100/007', '31500', '0', '166500', 'Material purchase for WH', '', '', 0, 39, 246),
(1139, '2024-02-05', 'Dr-Feb 24/065', '3600/001', '0', '31500', '221410283', 'Material purchase for WH', '', '', 0, 35, 247),
(1140, '2024-02-05', 'Dr-Feb 24/066', '9100/016', '107500', '0', '107500', 'Photo paper and A4 purchase for WH', '', '', 0, 39, 248),
(1141, '2024-02-05', 'Dr-Feb 24/066', '3600/001', '0', '107500', '221302783', 'Photo paper and A4 purchase for WH', '', '', 0, 35, 249),
(1142, '2024-02-05', 'Dr-Feb 24/067', '9100/007', '15000', '0', '181500', 'Battery 2 pcs charging charges and carry charges for (office)', '', '', 0, 39, 250),
(1143, '2024-02-05', 'Dr-Feb 24/067', '3600/001', '0', '15000', '221287783', 'Battery 2 pcs charging charges and carry charges for (office)', '', '', 0, 35, 251),
(1144, '2024-02-05', 'Dr-Feb 24/068', '9100/002', '24000', '0', '178500', 'Taxi charges for Ocean Pacific go workers', '', '', 0, 39, 252),
(1145, '2024-02-05', 'Dr-Feb 24/068', '3600/001', '0', '24000', '221263783', 'Taxi charges for Ocean Pacific go workers', '', '', 0, 35, 253),
(1146, '2024-02-05', 'Dr-Feb 24/069', '4000/M07', '12503950', '0', '12503950', 'Paid to Moe Kyaw for Vr No-11332, 11339, Cheque No-052402', '', '', 0, 40, 254),
(1147, '2024-02-05', 'Dr-Feb 24/069', '3600/001', '0', '12503950', '208759833', 'Paid to Moe Kyaw for Vr No-11332, 11339, Cheque No-052402', '', '', 0, 35, 255),
(1148, '2024-02-06', 'Cr-Feb 24/003', '3600/001', '42884814', '0', '251644647', 'Canda Money $40862.68 from UAB 50% $20431.34-10=20421.34*2100ks $20431.34*3370ks $20431.34*105ks', '', '', 0, 35, 256),
(1149, '2024-02-06', 'Cr-Feb 24/003', '3300/003', '0', '42884814', '-42918821.64', 'Canda Money $40862.68 from UAB 50% $20431.34-10=20421.34*2100ks $20431.34*3370ks $20431.34*105ks', '', '', 0, 35, 257),
(1150, '2024-02-06', 'Cr-Feb 24/003', '3600/001', '70998906.5', '0', '322643553.5', 'Canda Money $40862.68 from UAB 50% $20431.34-10=20421.34*2100ks $20431.34*3370ks $20431.34*105ks', '', '', 10, 35, 258),
(1151, '2024-02-06', 'Cr-Feb 24/003', '3300/003', '0', '71033656.5', '-113952478.14', 'Canda Money $40862.68 from UAB 50% $20431.34-10=20421.34*2100ks $20431.34*3370ks $20431.34*105ks', '', '', 0, 35, 259),
(1152, '2024-02-06', 'Cr-Feb 24/004', '3600/001', '49250250', '0', '371893803.5', '$23462.5 in UAB Bank', '', '', 0, 35, 260),
(1153, '2024-02-06', 'Cr-Feb 24/004', '3300/004', '0', '49250250', '-49203280.64', '$23462.5 in UAB Bank', '', '', 0, 35, 261),
(1154, '2024-02-06', 'Dr Feb 24/070', '9100/016', '117800', '0', '225300', 'A4 paper, Pen, Debit voucher Charging Rope and Taxi for (office)', '', '', 0, 39, 266),
(1155, '2024-02-06', 'Dr Feb 24/070', '3600/001', '0', '117800', '371776003.5', 'A4 paper, Pen, Debit voucher Charging Rope and Taxi for (office)', '', '', 0, 35, 267),
(1156, '2024-02-06', 'Dr Feb 24/071', '9100/011', '137000', '0', '3137000', 'Donation for Industry Zone', '', '', 0, 39, 268),
(1157, '2024-02-06', 'Dr Feb 24/071', '3600/001', '0', '137000', '371639003.5', 'Donation for Industry Zone', '', '', 0, 35, 269),
(1158, '2024-02-06', 'Dr Feb 24/072', '6100/001', '93000', '0', '623000', 'Labour charges and Taxi for D-Puti', '', '', 0, 37, 270),
(1159, '2024-02-06', 'Dr Feb 24/072', '3600/001', '0', '93000', '371546003.5', 'Labour charges and Taxi for D-Puti', '', '', 0, 35, 271),
(1160, '2024-02-06', 'Dr Feb 24/073', '6100/002', '27000', '0', '252000', 'Ice 3 pcs purchase for D-Puti', '', '', 0, 37, 272),
(1161, '2024-02-06', 'Dr Feb 24/073', '3600/001', '0', '27000', '371519003.5', 'Ice 3 pcs purchase for D-Puti', '', '', 0, 35, 273),
(1162, '2024-02-06', 'Dr Feb 24/074', '9100/002', '24000', '0', '202500', 'Taxi Charges For WH to GFC and GFC to WH', '', '', 0, 39, 274),
(1163, '2024-02-06', 'Dr Feb 24/074', '3600/001', '0', '24000', '371495003.5', 'Taxi Charges For WH to GFC and GFC to WH', '', '', 0, 35, 275),
(1164, '2024-02-06', 'Dr Feb 24/075', '9100/025', '7000', '0', '13515500', 'Car Pk and OT for 6J-3015 (Market)', '', '', 0, 37, 276),
(1165, '2024-02-06', 'Dr Feb 24/075', '3600/001', '0', '7000', '371488003.5', 'Car Pk and OT for 6J-3015 (Market)', '', '', 0, 35, 277),
(1166, '2024-02-06', 'Dr Feb 24/076', '9100/002', '10000', '0', '212500', 'Taxi Charges For WH to GFC and GFC To SPD', '', '', 0, 39, 278),
(1167, '2024-02-06', 'Dr Feb 24/076', '3600/001', '0', '10000', '371478003.5', 'Taxi Charges For WH to GFC and GFC To SPD', '', '', 0, 35, 279),
(1168, '2024-02-06', 'Dr Feb 24/077', '6100/002', '6000', '0', '258000', 'Ice 1 pcs purchase for (Rohu)', '', '', 0, 37, 280),
(1169, '2024-02-06', 'Dr Feb 24/077', '3600/001', '0', '6000', '371472003.5', 'Ice 1 pcs purchase for (Rohu)', '', '', 0, 35, 281),
(1170, '2024-02-06', 'Dr Feb 24/078', '9100/004', '60375', '0', '99375', 'YTP Bill for House (Jan/24)', '', '', 0, 39, 282),
(1171, '2024-02-06', 'Dr Feb 24/078', '3600/001', '0', '60375', '371411628.5', 'YTP Bill for House (Jan/24)', '', '', 0, 35, 283),
(1172, '2024-02-06', 'Dr Feb 24/079', '9100/004', '79800', '0', '179175', 'Hi-Internet Bill for office and WH office (Feb/24)', '', '', 0, 39, 284),
(1173, '2024-02-06', 'Dr Feb 24/079', '3600/001', '0', '79800', '371331828.5', 'Hi-Internet Bill for office and WH office (Feb/24)', '', '', 0, 35, 285),
(1174, '2024-02-06', 'Dr Feb 24/080', '9100/006', '50000', '0', '380000', 'Car Diesel for 6J-3015', '', '', 0, 39, 286),
(1175, '2024-02-06', 'Dr Feb 24/080', '3600/001', '0', '50000', '371281828.5', 'Car Diesel for 6J-3015', '', '', 0, 35, 287),
(1176, '2024-02-06', 'Dr Feb 24/081', '9100/005', '20000', '0', '34000', 'Battery purchase for WH Digital', '', '', 0, 39, 288),
(1177, '2024-02-06', 'Dr Feb 24/081', '3600/001', '0', '20000', '371261828.5', 'Battery purchase for WH Digital', '', '', 0, 35, 289),
(1178, '2024-02-06', 'Dr Feb 24/082', '6100/001', '138000', '0', '761000', 'LAbour Charges and Taxi for D-Puti', '', '', 0, 37, 290),
(1179, '2024-02-06', 'Dr Feb 24/082', '3600/001', '0', '138000', '371123828.5', 'LAbour Charges and Taxi for D-Puti', '', '', 0, 35, 291),
(1180, '2024-02-06', 'Dr Feb 24/083', '6100/002', '9000', '0', '267000', 'Ice 1 pcs purchase for D-Puti', '', '', 0, 37, 292),
(1181, '2024-02-06', 'Dr Feb 24/083', '3600/001', '0', '9000', '371114828.5', 'Ice 1 pcs purchase for D-Puti', '', '', 0, 35, 293),
(1182, '2024-02-06', 'Dr Feb 24/084', '9100/002', '17000', '0', '229500', 'Taxi Charges For HHK to WH', '', '', 0, 39, 294),
(1183, '2024-02-06', 'Dr Feb 24/084', '3600/001', '0', '17000', '371097828.5', 'Taxi Charges For HHK to WH', '', '', 0, 35, 295),
(1184, '2024-02-06', 'Dr Feb 24/085', '6100/005', '160000', '0', '160000', 'HHK to GFC MC carry for 2 Trucks', '', '', 0, 37, 296),
(1185, '2024-02-06', 'Dr Feb 24/085', '3600/001', '0', '160000', '370937828.5', 'HHK to GFC MC carry for 2 Trucks', '', '', 0, 35, 297),
(1186, '2024-02-06', 'Dr Feb 24/086', '9100/005', '10000', '0', '44000', 'ဧည့်စာရင်း(Boys)', '', '', 0, 39, 298),
(1187, '2024-02-06', 'Dr Feb 24/086', '3600/001', '0', '10000', '370927828.5', 'ဧည့်စာရင်း(Boys)', '', '', 0, 35, 299),
(1188, '2024-02-06', 'Dr Feb 24/087', '6100/007', '4000000', '0', '14000000', 'Paid to Ocean Pacific Cold Store', '', '', 0, 37, 300),
(1189, '2024-02-06', 'Dr Feb 24/087', '3600/001', '0', '4000000', '366927828.5', 'Paid to Ocean Pacific Cold Store', '', '', 0, 35, 301),
(1190, '2024-02-06', 'Dr Feb 24/088', '6100/007', '6754402', '0', '20754402', 'Paid to GFC Cold Store Charges', '', '', 0, 37, 302),
(1191, '2024-02-06', 'Dr Feb 24/088', '3600/001', '0', '6754402', '360173426.5', 'Paid to GFC Cold Store Charges', '', '', 0, 35, 303),
(1192, '2024-02-06', 'Dr Feb 24/089', '9100/002', '24000', '0', '253500', 'Taxi Charges for WH to GFC Money sent', '', '', 0, 39, 304),
(1193, '2024-02-06', 'Dr Feb 24/089', '3600/001', '0', '24000', '360149426.5', 'Taxi Charges for WH to GFC Money sent', '', '', 0, 35, 305),
(1194, '2024-02-06', 'Dr Feb 24/090', '4000/T03', '60000000', '0', '60000000', 'Paid to Thin Thin Yee for Vr No-11163,11176 Cheque No-039001', '', '', 0, 40, 306),
(1195, '2024-02-06', 'Dr Feb 24/090', '3600/001', '0', '60000000', '300149426.5', 'Paid to Thin Thin Yee for Vr No-11163,11176 Cheque No-039001', '', '', 0, 35, 307),
(1196, '2024-02-06', 'Dr Feb 24/091', '4000/S07', '30000000', '0', '30000000', 'Paid to Soe Thein (TCL) for Vr No-00113,00123 Cheque No-039003', '', '', 0, 40, 308),
(1197, '2024-02-06', 'Dr Feb 24/091', '3600/001', '0', '30000000', '270149426.5', 'Paid to Soe Thein (TCL) for Vr No-00113,00123 Cheque No-039003', '', '', 0, 35, 309),
(1198, '2024-02-06', 'Dr Feb 24/092', '4000/001', '5000000', '0', '5000000', 'Paid to 4 Zaw for Vr No-11030,11042,11054 Cheque No-039004', '', '', 0, 40, 310),
(1199, '2024-02-06', 'Dr Feb 24/092', '3600/001', '0', '5000000', '265149426.5', 'Paid to 4 Zaw for Vr No-11030,11042,11054 Cheque No-039004', '', '', 0, 35, 311),
(1200, '2024-02-06', 'Dr Feb 24/093', '4000/A01', '4000000', '0', '4000000', 'Paid to AK for Vr No-11009,11023 Cheque No-039005', '', '', 0, 40, 312),
(1201, '2024-02-06', 'Dr Feb 24/093', '3600/001', '0', '4000000', '261149426.5', 'Paid to AK for Vr No-11009,11023 Cheque No-039005', '', '', 0, 35, 313),
(1202, '2024-02-06', 'Dr Feb 24/094', '4000/A02', '3000000', '0', '3000000', 'Paid to Arr Kae for Vr No-11170,11199 Cheque No-039006', '', '', 0, 40, 314),
(1203, '2024-02-06', 'Dr Feb 24/094', '3600/001', '0', '3000000', '258149426.5', 'Paid to Arr Kae for Vr No-11170,11199 Cheque No-039006', '', '', 0, 35, 315),
(1204, '2024-02-06', 'Dr Feb 24/095', '4000/A03', '7000000', '0', '7000000', 'Paid to Aung Naing Oo for Vr No-10891,10930,10980,11021 Cheque No-039007', '', '', 0, 40, 316),
(1205, '2024-02-06', 'Dr Feb 24/095', '3600/001', '0', '7000000', '251149426.5', 'Paid to Aung Naing Oo for Vr No-10891,10930,10980,11021 Cheque No-039007', '', '', 0, 35, 317),
(1206, '2024-02-06', 'Dr Feb 24/096', '4000/A05', '5000000', '0', '5000000', 'Paid to Myo Min for Vr No-10891,10930,10980,11021 Cheque No-039007', '', '', 0, 40, 318),
(1207, '2024-02-06', 'Dr Feb 24/096', '3600/001', '0', '5000000', '246149426.5', 'Paid to Myo Min for Vr No-10891,10930,10980,11021 Cheque No-039007', '', '', 0, 35, 319),
(1208, '2024-02-06', 'Dr Feb 24/097', '4000/A06', '3000000', '0', '3000000', 'Paid to Aung Zaw Oo for Vr No-11172 Cheque No-039009', '', '', 0, 40, 320),
(1209, '2024-02-06', 'Dr Feb 24/097', '3600/001', '0', '3000000', '243149426.5', 'Paid to Aung Zaw Oo for Vr No-11172 Cheque No-039009', '', '', 0, 35, 321),
(1210, '2024-02-06', 'Dr Feb 24/098', '4000/A07', '4000000', '0', '4000000', '', '', '', 0, 40, 322),
(1211, '2024-02-06', 'Dr Feb 24/098', '3600/001', '0', '4000000', '239149426.5', 'Paid to A Thay Lay for Vr No-11222,11237 Cheque No-0390010', '', '', 0, 35, 323),
(1212, '2024-02-06', 'Dr Feb 24/099', '4000/B01', '3000000', '0', '3000000', 'Paid to Bar Bu Lay for Vr No-11263 Cheque No-0390011', '', '', 0, 40, 324),
(1213, '2024-02-06', 'Dr Feb 24/099', '3600/001', '0', '3000000', '236149426.5', 'Paid to Bar Bu Lay for Vr No-11263 Cheque No-0390011', '', '', 0, 35, 325),
(1214, '2024-02-06', 'Dr Feb 24/100', '4000/C02', '5000000', '0', '5000000', 'Paid to Cho Mg for Vr No-11155,11161 Cheque No-0390012', '', '', 0, 40, 326),
(1215, '2024-02-06', 'Dr Feb 24/100', '3600/001', '0', '5000000', '231149426.5', 'Paid to Cho Mg for Vr No-11155,11161 Cheque No-0390012', '', '', 0, 35, 327),
(1216, '2024-02-06', 'Dr Feb 24/101', '4000/H02', '3000000', '0', '3000000', 'Paid to Htay Win for Vr No-  Cheque No-0390013', '', '', 0, 40, 328),
(1217, '2024-02-06', 'Dr Feb 24/101', '3600/001', '0', '3000000', '228149426.5', 'Paid to Htay Win for Vr No-  Cheque No-0390013', '', '', 0, 35, 329),
(1218, '2024-02-06', 'Dr Feb 24/102', '4000/K05', '7000000', '0', '7000000', 'Paid to Kyaw Zay Ya for Vr No-11097 Cheque No-0390014', '', '', 0, 40, 330),
(1219, '2024-02-06', 'Dr Feb 24/102', '3600/001', '0', '7000000', '221149426.5', 'Paid to Kyaw Zay Ya for Vr No-11097 Cheque No-0390014', '', '', 0, 35, 331),
(1220, '2024-02-06', 'Dr Feb 24/103', '4000/K03', '4000000', '0', '4000000', 'Paid to KTO for Vr No-10608,11322 Cheque No-0390015', '', '', 0, 40, 332),
(1221, '2024-02-06', 'Dr Feb 24/103', '3600/001', '0', '4000000', '217149426.5', 'Paid to KTO for Vr No-10608,11322 Cheque No-0390015', '', '', 0, 35, 333),
(1222, '2024-02-06', 'Dr Feb 24/104', '4000/K04', '4000000', '0', '4000000', 'Paid to Kaung Myat for Vr No-11341 Cheque No-0390016', '', '', 0, 40, 334),
(1223, '2024-02-06', 'Dr Feb 24/104', '3600/001', '0', '4000000', '213149426.5', 'Paid to Kaung Myat for Vr No-11341 Cheque No-0390016', '', '', 0, 35, 335),
(1224, '2024-02-06', 'Dr Feb 24/105', '4000/M07', '4000000', '0', '16503950', 'Paid to Moe Kyaw for Vr No-11332 Cheque No-0390017', '', '', 0, 40, 336),
(1225, '2024-02-06', 'Dr Feb 24/105', '3600/001', '0', '4000000', '209149426.5', 'Paid to Moe Kyaw for Vr No-11332 Cheque No-0390017', '', '', 0, 35, 337),
(1226, '2024-02-06', 'Dr Feb 24/106', '4000/S01', '5000000', '0', '5000000', 'Paid to Shwe Late for Vr No-10871,10842,10892,10902 Cheque No-0390018', '', '', 0, 40, 338),
(1227, '2024-02-06', 'Dr Feb 24/106', '3600/001', '0', '5000000', '204149426.5', 'Paid to Shwe Late for Vr No-10871,10842,10892,10902 Cheque No-0390018', '', '', 0, 35, 339),
(1228, '2024-02-06', 'Dr Feb 24/107', '4000/S03', '20000000', '0', '20000000', 'Paid to Soe Min for Vr No-10929,10997,11020 Cheque No-0390019', '', '', 0, 40, 340),
(1229, '2024-02-06', 'Dr Feb 24/107', '3600/001', '0', '20000000', '184149426.5', 'Paid to Soe Min for Vr No-10929,10997,11020 Cheque No-0390019', '', '', 0, 35, 341),
(1230, '2024-02-06', 'Dr Feb 24/108', '4000/S04', '5000000', '0', '5000000', 'Paid to Si Thu for Vr No-10845, 10857, 10858 Cheque No-0390020', '', '', 0, 40, 342),
(1231, '2024-02-06', 'Dr Feb 24/108', '3600/001', '0', '5000000', '179149426.5', 'Paid to Si Thu for Vr No-10845, 10857, 10858 Cheque No-0390020', '', '', 0, 35, 343),
(1232, '2024-02-06', 'Dr Feb 24/109', '4000/T05', '30000000', '0', '30000000', 'Paid to Thet Oo for Vr No-11120,11132 Cheque No-039021', '', '', 0, 40, 344),
(1233, '2024-02-06', 'Dr Feb 24/109', '3600/001', '0', '30000000', '149149426.5', 'Paid to Thet Oo for Vr No-11120,11132 Cheque No-039021', '', '', 0, 35, 345),
(1234, '2024-02-06', 'Dr Feb 24/110', '4000/T01', '4000000', '0', '4000000', 'Paid to Thet Paing for Vr No-11327 Cheque No-039022', '', '', 0, 40, 346),
(1235, '2024-02-06', 'Dr Feb 24/110', '3600/001', '0', '4000000', '145149426.5', 'Paid to Thet Paing for Vr No-11327 Cheque No-039022', '', '', 0, 35, 347),
(1236, '2024-02-06', 'Dr Feb 24/111', '4000/T11', '30000000', '0', '30000000', 'Paid to Tun Zaw Min for Vr No-11074 Cheque No-039023', '', '', 0, 40, 348),
(1237, '2024-02-06', 'Dr Feb 24/111', '3600/001', '0', '30000000', '115149426.5', 'Paid to Tun Zaw Min for Vr No-11074 Cheque No-039023', '', '', 0, 35, 349),
(1238, '2024-02-06', 'Dr Feb 24/112', '4000/W01', '3352700', '0', '3352700', 'Paid to Win Bo for Vr No-11283 Cheque No-039024', '', '', 0, 40, 350),
(1239, '2024-02-06', 'Dr Feb 24/112', '3600/001', '0', '3352700', '111796726.5', 'Paid to Win Bo for Vr No-11283 Cheque No-039024', '', '', 0, 35, 351),
(1240, '2024-02-06', 'Dr Feb 24/113', '4000/Z01', '4000000', '0', '4000000', 'Paid to Zaw Latt for Vr No-10966,11008 Cheque No-039025', '', '', 0, 40, 352),
(1241, '2024-02-06', 'Dr Feb 24/113', '3600/001', '0', '4000000', '107796726.5', 'Paid to Zaw Latt for Vr No-10966,11008 Cheque No-039025', '', '', 0, 35, 353),
(1242, '2024-02-06', 'Dr Feb 24/114', '4000/A04', '5472850', '0', '5472850', 'Paid to Aung Kyaw Moe for Vr No-10944 Cheque No-052401', '', '', 0, 40, 354),
(1243, '2024-02-06', 'Dr Feb 24/114', '3600/001', '0', '5472850', '102323876.5', 'Paid to Aung Kyaw Moe for Vr No-10944 Cheque No-052401', '', '', 0, 35, 355),
(1244, '2024-02-06', 'Dr Feb 24/115', '9100/002', '18000', '0', '271500', 'Taxi Charges for WH to Market', '', '', 0, 39, 356),
(1245, '2024-02-06', 'Dr Feb 24/115', '3600/001', '0', '18000', '102305876.5', 'Taxi Charges for WH to Market', '', '', 0, 35, 357),
(1246, '2024-02-06', 'Dr Feb 24/116', '9100/025', '8000', '0', '13523500', 'Car Pk and OT Charges for (Market)', '', '', 0, 37, 358),
(1247, '2024-02-06', 'Dr Feb 24/116', '3600/001', '0', '8000', '102297876.5', 'Car Pk and OT Charges for (Market)', '', '', 0, 35, 359),
(1248, '2024-02-06', 'Dr Feb 24/117', '6100/001', '13000', '0', '774000', 'Labour Charges for Market', '', '', 0, 37, 360),
(1249, '2024-02-06', 'Dr Feb 24/117', '3600/001', '0', '13000', '102284876.5', 'Labour Charges for Market', '', '', 0, 35, 361),
(1250, '2024-02-06', 'Dr Feb 24/118', '6100/002', '55000', '0', '322000', 'Ice 5 pcs purchase for Market Fish', '', '', 0, 37, 362),
(1251, '2024-02-06', 'Dr Feb 24/118', '3600/001', '0', '55000', '102229876.5', 'Ice 5 pcs purchase for Market Fish', '', '', 0, 35, 363),
(1252, '2024-02-07', 'Dr Feb 24/119', '6100/005', '40000', '0', '200000', 'WH to GFC Carton Box carry', '', '', 0, 37, 364),
(1253, '2024-02-07', 'Dr Feb 24/119', '3600/001', '0', '40000', '102189876.5', 'WH to GFC Carton Box carry', '', '', 0, 35, 365),
(1254, '2024-02-07', 'Dr Feb 24/120', '6100/003', '1438250', '0', '14961750', 'Paid to Plastic (G/F) for Vr  No-(6.2.24)(6.2.24)', '', '', 0, 37, 366),
(1255, '2024-02-07', 'Dr Feb 24/120', '3600/001', '0', '1438250', '100751626.5', 'Paid to Plastic (G/F) for Vr  No-(6.2.24)(6.2.24)', '', '', 0, 35, 367),
(1256, '2024-02-07', 'Dr Feb 24/121', '9100/003', '3600', '0', '12600', 'Water 4 pk purchase for WH', '', '', 0, 39, 368),
(1257, '2024-02-07', 'Dr Feb 24/121', '3600/001', '0', '3600', '100748026.5', 'Water 4 pk purchase for WH', '', '', 0, 35, 369),
(1258, '2024-02-07', 'Dr Feb 24/122', '9100/016', '69000', '0', '294300', 'Photo paper purchase and Taxi Charges for WH', '', '', 0, 39, 370),
(1259, '2024-02-07', 'Dr Feb 24/122', '3600/001', '0', '69000', '100679026.5', 'Photo paper purchase and Taxi Charges for WH', '', '', 0, 35, 371),
(1260, '2024-02-07', 'Dr Feb 24/123', '9100/006', '50000', '0', '430000', 'Car Diesel for 6J-3015', '', '', 0, 39, 372),
(1261, '2024-02-07', 'Dr Feb 24/123', '3600/001', '0', '50000', '100629026.5', 'Car Diesel for 6J-3015', '', '', 0, 35, 373),
(1262, '2024-02-07', 'Dr Feb 24/124', '9100/014', '5000', '0', '28000', 'Car police catch for 6J-3015', '', '', 0, 39, 374),
(1263, '2024-02-07', 'Dr Feb 24/124', '3600/001', '0', '5000', '100624026.5', 'Car police catch for 6J-3015', '', '', 0, 35, 375),
(1264, '2024-02-07', 'Dr Feb 24/125', '9100/017', '100000', '0', '100000', 'Sir take from Daw Nan (Cambodia go)', '', '', 0, 39, 376),
(1265, '2024-02-07', 'Dr Feb 24/125', '3600/001', '0', '100000', '100524026.5', 'Sir take from Daw Nan (Cambodia go)', '', '', 0, 35, 377),
(1266, '2024-02-07', 'Dr Feb 24/126', '9100/012', '6000', '0', '180850', 'Meal allowance for Market Boy 3 pcs', '', '', 0, 39, 378),
(1267, '2024-02-07', 'Dr Feb 24/126', '3600/001', '0', '6000', '100518026.5', 'Meal allowance for Market Boy 3 pcs', '', '', 0, 35, 379),
(1268, '2024-02-07', 'Dr Feb 24/127', '6100/001', '16000', '0', '790000', 'Labour Charges for Market Boy 3 pcs', '', '', 0, 37, 380),
(1269, '2024-02-07', 'Dr Feb 24/127', '3600/001', '0', '16000', '100502026.5', 'Labour Charges for Market Boy 3 pcs', '', '', 0, 35, 381),
(1270, '2024-02-07', 'Dr Feb 24/128', '6100/002', '77000', '0', '399000', 'Ice 7 pcs purchase for Market Fish', '', '', 0, 37, 382),
(1271, '2024-02-07', 'Dr Feb 24/128', '3600/001', '0', '77000', '100425026.5', 'Ice 7 pcs purchase for Market Fish', '', '', 0, 35, 383),
(1272, '2024-02-07', 'Dr Feb 24/129', '9100/025', '2000', '0', '14963750', 'Car PK for (Market)', '', '', 0, 37, 384),
(1273, '2024-02-07', 'Dr Feb 24/129', '3600/001', '0', '2000', '100423026.5', 'Car PK for (Market)', '', '', 0, 35, 385),
(1274, '2024-02-07', 'Dr Feb 24/130', '9100/002', '3000', '0', '274500', 'Taxi Charges for Boy 1 pcs house go', '', '', 0, 39, 386),
(1275, '2024-02-07', 'Dr Feb 24/130', '3600/001', '0', '3000', '100420026.5', 'Taxi Charges for Boy 1 pcs house go', '', '', 0, 35, 387),
(1276, '2024-02-08', 'Dr Feb 24/131', '4000/Z03', '6000000', '0', '6000000', 'Paid to Zaw Myat Thu for Vr No-11357', '', '', 0, 40, 388),
(1277, '2024-02-08', 'Dr Feb 24/131', '3600/001', '0', '6000000', '94420026.5', 'Paid to Zaw Myat Thu for Vr No-11357', '', '', 0, 35, 389),
(1278, '2024-02-08', 'Dr Feb 24/132', '9100/018', '120000', '0', '120000', 'Safe Guard purchase and Lighting Repair for office', '', '', 0, 39, 390),
(1279, '2024-02-08', 'Dr Feb 24/132', '3600/001', '0', '120000', '94300026.5', 'Safe Guard purchase and Lighting Repair for office', '', '', 0, 35, 391),
(1280, '2024-02-08', 'Dr Feb 24/133', '9100/002', '26000', '0', '300500', 'Taxi Charges For HHK to WH and Ice 1 pcs ', '', '', 0, 39, 392),
(1281, '2024-02-08', 'Dr Feb 24/133', '3600/001', '0', '26000', '94274026.5', 'Taxi Charges For HHK to WH and Ice 1 pcs ', '', '', 0, 35, 393),
(1282, '2024-02-08', 'Dr Feb 24/134', '9100/006', '50000', '0', '480000', 'Car Diesel for 6J-3015', '', '', 0, 39, 394),
(1283, '2024-02-08', 'Dr Feb 24/134', '3600/001', '0', '50000', '94224026.5', 'Car Diesel for 6J-3015', '', '', 0, 35, 395),
(1284, '2024-02-08', 'Dr Feb 24/135', '9100/014', '10000', '0', '38000', 'Engin Oil purchase for 6J-3015', '', '', 0, 39, 396),
(1285, '2024-02-08', 'Dr Feb 24/135', '3600/001', '0', '10000', '94214026.5', 'Engin Oil purchase for 6J-3015', '', '', 0, 35, 397),
(1286, '2024-02-08', 'Dr Feb 24/136', '6100/001', '111000', '0', '901000', 'Labour Charges and Taxi Charges for (D-Puti)', '', '', 0, 37, 398),
(1287, '2024-02-08', 'Dr Feb 24/136', '3600/001', '0', '111000', '94103026.5', 'Labour Charges and Taxi Charges for (D-Puti)', '', '', 0, 35, 399),
(1288, '2024-02-08', 'Dr Feb 24/137', '6100/002', '36000', '0', '435000', 'Ice 4 pcs purchase for (D-Puti)', '', '', 0, 37, 400),
(1289, '2024-02-08', 'Dr Feb 24/137', '3600/001', '0', '36000', '94067026.5', 'Ice 4 pcs purchase for (D-Puti)', '', '', 0, 35, 401),
(1290, '2024-02-08', 'Dr Feb 24/138', '9100/002', '17000', '0', '317500', 'Taxi Charges for HHK to GFC', '', '', 0, 39, 402),
(1291, '2024-02-08', 'Dr Feb 24/138', '3600/001', '0', '17000', '94050026.5', 'Taxi Charges for HHK to GFC', '', '', 0, 35, 403),
(1292, '2024-02-08', 'Dr Feb 24/139', '9100/025', '2000', '0', '14965750', 'Car PK for 6J-3015 (Market)', '', '', 0, 37, 404),
(1293, '2024-02-08', 'Dr Feb 24/139', '3600/001', '0', '2000', '94048026.5', 'Car PK for 6J-3015 (Market)', '', '', 0, 35, 405),
(1294, '2024-02-08', 'Dr Feb 24/140', '9100/012', '6000', '0', '186850', 'Market Boys 3 pcs Lunch', '', '', 0, 39, 406),
(1295, '2024-02-08', 'Dr Feb 24/140', '3600/001', '0', '6000', '94042026.5', 'Market Boys 3 pcs Lunch', '', '', 0, 35, 407),
(1296, '2024-02-08', 'Dr Feb 24/141', '6100/001', '16000', '0', '917000', 'Labour Charges for Market Fish', '', '', 0, 37, 408),
(1297, '2024-02-08', 'Dr Feb 24/141', '3600/001', '0', '16000', '94026026.5', 'Labour Charges for Market Fish', '', '', 0, 35, 409),
(1298, '2024-02-08', 'Dr Feb 24/142', '6100/002', '33000', '0', '468000', 'Ice 3 pcs purchase for WH', '', '', 0, 37, 410),
(1299, '2024-02-08', 'Dr Feb 24/142', '3600/001', '0', '33000', '93993026.5', 'Ice 3 pcs purchase for WH', '', '', 0, 35, 411),
(1300, '2024-02-09', 'Dr Feb 24/143', '9100/006', '50000', '0', '530000', 'Car Diesel for 6J-3015', '', '', 0, 39, 412),
(1301, '2024-02-09', 'Dr Feb 24/143', '3600/001', '0', '50000', '93943026.5', 'Car Diesel for 6J-3015', '', '', 0, 35, 413),
(1302, '2024-02-09', 'Dr Feb 24/144', '9100/002', '22000', '0', '339500', 'Taxi Charges for WH to GFC', '', '', 0, 39, 414),
(1303, '2024-02-09', 'Dr Feb 24/144', '3600/001', '0', '22000', '93921026.5', 'Taxi Charges for WH to GFC', '', '', 0, 35, 415),
(1304, '2024-02-09', 'Dr Feb 24/145', '9100/002', '3000', '0', '342500', 'Taxi Charges for WH to Goverment for (Lai Lai and May Zin Myo)', '', '', 0, 39, 416),
(1305, '2024-02-09', 'Dr Feb 24/145', '3600/001', '0', '3000', '93918026.5', 'Taxi Charges for WH to Goverment for (Lai Lai and May Zin Myo)', '', '', 0, 35, 417),
(1306, '2024-02-09', 'Dr Feb 24/146', '9100/002', '5000', '0', '347500', 'Taxi Charges for Car Car Driver for (9.2) 8:30 PM', '', '', 0, 39, 418),
(1307, '2024-02-09', 'Dr Feb 24/146', '3600/001', '0', '5000', '93913026.5', 'Taxi Charges for Car Car Driver for (9.2) 8:30 PM', '', '', 0, 35, 419),
(1308, '2024-02-09', 'Dr Feb 24/147', '9100/014', '5000', '0', '43000', 'Car police catch for 6J-3015 (Market)', '', '', 0, 39, 420),
(1309, '2024-02-09', 'Dr Feb 24/147', '3600/001', '0', '5000', '93908026.5', 'Car police catch for 6J-3015 (Market)', '', '', 0, 35, 421),
(1310, '2024-02-09', 'Dr Feb 24/148', '6100/001', '13000', '0', '930000', 'Labour Charges for Ocean Pacific (Raw)', '', '', 0, 37, 422),
(1311, '2024-02-09', 'Dr Feb 24/148', '3600/001', '0', '13000', '93895026.5', 'Labour Charges for Ocean Pacific (Raw)', '', '', 0, 35, 423),
(1312, '2024-02-09', 'Dr Feb 24/149', '9100/002', '15000', '0', '362500', 'Taxi Charges for Ocean to WH', '', '', 0, 39, 424),
(1313, '2024-02-09', 'Dr Feb 24/149', '3600/001', '0', '15000', '93880026.5', '', '', '', 0, 35, 425),
(1314, '2024-02-09', 'Dr Feb 24/150', '9100/012', '4000', '0', '190850', 'Boy 2 pcs Lunch for Ocean (Pk)', '', '', 0, 39, 426),
(1315, '2024-02-09', 'Dr Feb 24/150', '3600/001', '0', '4000', '93876026.5', 'Boy 2 pcs Lunch for Ocean (Pk)', '', '', 0, 35, 427),
(1316, '2024-02-09', 'Dr Feb 24/151', '6100/001', '158000', '0', '1088000', 'Labour Charges for D-Puti (230viss*600) and Taxi Charges (20000)', '', '', 0, 37, 428),
(1317, '2024-02-09', 'Dr Feb 24/151', '3600/001', '0', '158000', '93718026.5', 'Labour Charges for D-Puti (230viss*600) and Taxi Charges (20000)', '', '', 0, 35, 429),
(1318, '2024-02-09', 'Dr Feb 24/152', '6100/002', '18000', '0', '486000', 'Ice 2 pcs purchase for D-Puti', '', '', 0, 37, 430),
(1319, '2024-02-09', 'Dr Feb 24/152', '3600/001', '0', '18000', '93700026.5', 'Ice 2 pcs purchase for D-Puti', '', '', 0, 35, 431),
(1320, '2024-02-09', 'Dr Feb 24/153', '9100/012', '12000', '0', '202850', 'Boys 2 pcs Lunch and Dinner for (HHK)', '', '', 0, 39, 432),
(1321, '2024-02-09', 'Dr Feb 24/153', '3600/001', '0', '12000', '93688026.5', 'Boys 2 pcs Lunch and Dinner for (HHK)', '', '', 0, 35, 433),
(1322, '2024-02-09', 'Dr Feb 24/154', '4000/T11', '40000000', '0', '70000000', 'Paid to Tun Zaw Min for Vr No-11074, 11079 Cheque No-052403', '', '', 0, 40, 434),
(1323, '2024-02-09', 'Dr Feb 24/154', '3600/001', '0', '40000000', '53688026.5', 'Paid to Tun Zaw Min for Vr No-11074, 11079 Cheque No-052403', '', '', 0, 35, 435),
(1324, '2024-02-09', 'Dr Feb 24/155', '9100/002', '27000', '0', '389500', 'Taxi Charges for WH to Market and WH', '', '', 0, 39, 436),
(1325, '2024-02-09', 'Dr Feb 24/155', '3600/001', '0', '27000', '53661026.5', 'Taxi Charges for WH to Market and WH', '', '', 0, 35, 437),
(1326, '2024-02-09', 'Dr Feb 24/156', '9100/012', '10500', '0', '213350', 'Meal allowance for MArket and WH', '', '', 0, 39, 438),
(1327, '2024-02-09', 'Dr Feb 24/156', '3600/001', '0', '10500', '53650526.5', 'Meal allowance for Market Boy', '', '', 0, 35, 439),
(1328, '2024-02-09', 'Dr Feb 24/157', '6100/001', '23000', '0', '1111000', 'Labour Charges for Market Fish', '', '', 0, 37, 440),
(1329, '2024-02-09', 'Dr Feb 24/157', '3600/001', '0', '23000', '53627526.5', 'Labour Charges for Market Fish', '', '', 0, 35, 441),
(1330, '2024-02-09', 'Dr Feb 24/158', '6100/002', '66000', '0', '552000', 'Ice 6 pcs purchase for Market Fish', '', '', 0, 37, 442),
(1331, '2024-02-09', 'Dr Feb 24/158', '3600/001', '0', '66000', '53561526.5', 'Ice 6 pcs purchase for Market Fish', '', '', 0, 35, 443),
(1332, '2024-02-09', 'Dr Feb 24/159', '9100/025', '7000', '0', '14972750', 'Car PK and OT for Market', '', '', 0, 37, 444),
(1333, '2024-02-09', 'Dr Feb 24/159', '3600/001', '0', '7000', '53554526.5', 'Car PK and OT for Market', '', '', 0, 35, 445),
(1334, '2024-02-06', 'Cr-Feb 24/004', '3600/002', '23462.5', '0', '23462.5', '$23462.5 in UAB Bank', '', '', 0, 35, 446),
(1335, '2024-02-06', 'Cr-Feb 24/004', '3300/004', '0', '23462.5', '-49226743.14', '$23462.5 in UAB Bank', '', '', 0, 35, 447),
(1342, '2024-02-02', 'Dr-Feb 24/027', '4000/P02', '3400000', '0', '3400000', 'Paid to BLC (PYM) for Vr No-11221', '', '', 0, 40, 117),
(1343, '2024-02-06', 'Cr-Feb 24/005', '3600/001', '65368800', '0', '118923326.5', 'USA Money from UAB ($74925=50 50-$32761.64,65 35-$42163.36) $32761.64=>$16380.82-10=$16370.82*2100ks $16380.82*3370ks $16380.82*105ks and $42163.36=> $14757.18*2100ks, $27406.18 in UAB USD Bank', '', '', 0, 35, 454);
INSERT INTO `general_ledger` (`id`, `date`, `voucherno`, `ac_code`, `debit`, `credit`, `balance`, `narration`, `sr_no`, `container_no`, `bank_charges`, `acid`, `transactionid`) VALUES
(1344, '2024-02-06', 'Cr-Feb 24/005', '3300/002', '0', '65368800', '-273641415.19', 'USA Money from UAB ($74925=50 50-$32761.64,65 35-$42163.36) $32761.64=>$16380.82-10=$16370.82*2100ks $16380.82*3370ks $16380.82*105ks and $42163.36=> $14757.18*2100ks, $27406.18 in UAB USD Bank', '', '', 0, 35, 455),
(1345, '2024-02-06', 'Cr-Feb 24/005', '3600/001', '56923349.5', '0', '175846676', 'USA Money from UAB ($74925=50 50-$32761.64,65 35-$42163.36) $32761.64=>$16380.82-10=$16370.82*2100ks $16380.82*3370ks $16380.82*105ks and $42163.36=> $14757.18*2100ks, $27406.18 in UAB USD Bank', '', '', 0, 35, 456),
(1346, '2024-02-06', 'Cr-Feb 24/005', '3300/002', '0', '56923349.5', '-330564764.69', 'USA Money from UAB ($74925=50 50-$32761.64,65 35-$42163.36) $32761.64=>$16380.82-10=$16370.82*2100ks $16380.82*3370ks $16380.82*105ks and $42163.36=> $14757.18*2100ks, $27406.18 in UAB USD Bank', '', '', 0, 35, 457),
(1347, '2024-02-12', 'Dr-Feb 24/160', '9100/006', '150000', '0', '680000', 'Car Petrol for 6J-3015 10.2.24,11.2.24,12.2.24', '', '', 0, 39, 458),
(1348, '2024-02-12', 'Dr-Feb 24/160', '3600/001', '0', '150000', '175696676', 'Car Petrol for 6J-3015 10.2.24,11.2.24,12.2.24', '', '', 0, 35, 459),
(1349, '2024-02-12', 'Dr-Feb 24/161', '6100/007', '1112614', '0', '21867016', 'Paid to Ocean Pacific Cold Store Charges Balance Amt ', '', '', 0, 37, 460),
(1350, '2024-02-12', 'Dr-Feb 24/161', '3600/001', '0', '1112614', '174584062', 'Paid to Ocean Pacific Cold Store Charges Balance Amt ', '', '', 0, 35, 461),
(1351, '2024-02-12', 'Dr-Feb 24/162', '9100/007', '306000', '0', '487500', 'Machine Repair for W/H PK Machine', '', '', 0, 39, 462),
(1352, '2024-02-12', 'Dr-Feb 24/162', '3600/001', '0', '306000', '174278062', 'Machine Repair for W/H PK Machine', '', '', 0, 35, 463),
(1353, '2024-02-12', 'Dr-Feb 24/163', '6100/003', '473750', '0', '15446500', 'Paid to Plastic (G/F) for 7.2.2024,8.2.24,9.2.24', '', '', 0, 37, 464),
(1354, '2024-02-12', 'Dr-Feb 24/163', '3600/001', '0', '473750', '173804312', 'Paid to Plastic (G/F) for 7.2.2024,8.2.24,9.2.24', '', '', 0, 35, 465),
(1355, '2024-02-12', 'Dr-Feb 24/164', '9100/003', '4500', '0', '17100', 'Water 5Pk Purchase for W/H', '', '', 0, 39, 466),
(1356, '2024-02-12', 'Dr-Feb 24/164', '3600/001', '0', '4500', '173799812', 'Water 5Pk Purchase for W/H', '', '', 0, 35, 467),
(1357, '2024-02-12', 'Dr-Feb 24/165', '6100/006', '2163000', '0', '3860000', 'Paid to Sticker 5 Colour and Taxi Charges', '', '', 0, 37, 468),
(1358, '2024-02-12', 'Dr-Feb 24/165', '3600/001', '0', '2163000', '171636812', 'Paid to Sticker 5 Colour and Taxi Charges', '', '', 0, 35, 469),
(1359, '2024-02-12', 'Dr-Feb 24/166', '9100/002', '34000', '0', '423500', 'Taxi Charges for Ocean to W/H for 11.2.24-12000,12.2.24-22000', '', '', 0, 39, 470),
(1360, '2024-02-12', 'Dr-Feb 24/166', '3600/001', '0', '34000', '171602812', 'Taxi Charges for Ocean to W/H for 11.2.24-12000,12.2.24-22000', '', '', 0, 35, 471),
(1361, '2024-02-12', 'Dr-Feb 24/167', '6100/003', '832250', '0', '16278750', 'Penam Bag,Rubber Ring and Photo Sticker Purchase for W/H\r\n', '', '', 0, 37, 472),
(1362, '2024-02-12', 'Dr-Feb 24/167', '3600/001', '0', '832250', '170770562', 'Penam Bag,Rubber Ring and Photo Sticker Purchase for W/H\r\n', '', '', 0, 35, 473),
(1363, '2024-02-12', 'Dr-Feb 24/168', '9100/002', '20000', '0', '443500', 'Taxi Charges for Ocean to W/H 10.2.24\r\n', '', '', 0, 39, 474),
(1364, '2024-02-12', 'Dr-Feb 24/168', '3600/001', '0', '20000', '170750562', 'Taxi Charges for Ocean to W/H 10.2.24\r\n', '', '', 0, 35, 475),
(1365, '2024-02-12', 'Dr-Feb 24/169', '9100/006', '160000', '0', '840000', 'Car Petrol for 5L-2848\r\n', '', '', 0, 39, 476),
(1366, '2024-02-12', 'Dr-Feb 24/169', '3600/001', '0', '160000', '170590562', 'Car Petrol for 5L-2848\r\n', '', '', 0, 35, 477),
(1367, '2024-02-12', 'Dr-Feb 24/170', '9100/007', '70000', '0', '557500', 'Gas Filling for Sir House\r\n', '', '', 0, 39, 478),
(1368, '2024-02-12', 'Dr-Feb 24/170', '3600/001', '0', '70000', '170520562', 'Gas Filling for Sir House\r\n', '', '', 0, 35, 479),
(1369, '2024-02-12', 'Dr-Feb 24/171', '9100/005', '31600', '0', '31600', 'Fish Sample Purchase \r\n', '', '', 0, 39, 480),
(1370, '2024-02-12', 'Dr-Feb 24/171', '3600/001', '0', '31600', '170488962', 'Fish Sample Purchase \r\n', '', '', 0, 35, 481),
(1371, '2024-02-12', 'Dr-Feb 24/172', '9100/012', '10500', '0', '223850', 'Meal Allowance for Market Boy\r\n', '', '', 0, 39, 482),
(1372, '2024-02-12', 'Dr-Feb 24/172', '3600/001', '0', '10500', '170478462', 'Meal Allowance for Market Boy\r\n', '', '', 0, 35, 483),
(1373, '2024-02-12', 'Dr-Feb 24/173', '9100/025', '2000', '0', '16280750', 'Car Parking for Market \r\n', '', '', 0, 37, 484),
(1374, '2024-02-12', 'Dr-Feb 24/173', '3600/001', '0', '2000', '170476462', 'Car Parking for Market \r\n', '', '', 0, 35, 485),
(1375, '2024-02-12', 'Dr-Feb 24/174', '6100/001', '12500', '0', '1123500', 'Labour Charges for Market Fish\r\n', '', '', 0, 37, 486),
(1376, '2024-02-12', 'Dr-Feb 24/174', '3600/001', '0', '12500', '170463962', 'Labour Charges for Market Fish\r\n', '', '', 0, 35, 487),
(1377, '2024-02-12', 'Dr-Feb 24/175', '6100/002', '38500', '0', '590500', 'Ice 3.5pcs Purchase for Market Fish\r\n', '', '', 0, 37, 488),
(1378, '2024-02-12', 'Dr-Feb 24/175', '3600/001', '0', '38500', '170425462', 'Ice 3.5pcs Purchase for Market Fish\r\n', '', '', 0, 35, 489),
(1379, '2024-02-13', 'Dr-Feb 24/176', '9100/004', '3000', '0', '182175', 'Phone Bill for Sir', '', '', 0, 39, 490),
(1380, '2024-02-13', 'Dr-Feb 24/176', '3600/001', '0', '3000', '170422462', 'Phone Bill for Sir', '', '', 0, 35, 491),
(1381, '2024-02-13', 'Dr-Feb 24/177', '9100/002', '5000', '0', '448500', 'Taxi Charges for W/H to UAB to Café shop\r\n', '', '', 0, 39, 492),
(1382, '2024-02-13', 'Dr-Feb 24/177', '3600/001', '0', '5000', '170417462', 'Taxi Charges for W/H to UAB to Café shop\r\n', '', '', 0, 35, 493),
(1383, '2024-02-13', 'Dr-Feb 24/178', '9100/011', '8883000', '0', '12020000', 'Rice 60*89000ks,Beam 10*120000ks/10*148500 and Oil-30*26500ks and Car Charges, Taxi for Mingalar Charity Donation\r\n', '', '', 0, 39, 494),
(1384, '2024-02-13', 'Dr-Feb 24/178', '3600/001', '0', '8883000', '161534462', 'Rice 60*89000ks,Beam 10*120000ks/10*148500 and Oil-30*26500ks and Car Charges, Taxi for Mingalar Charity Donation\r\n', '', '', 0, 35, 495),
(1385, '2024-02-13', 'Dr-Feb 24/179', '9100/018', '62000', '0', '182000', 'Safe Guard 2pcs Purchase for W/H\r\n', '', '', 0, 39, 496),
(1386, '2024-02-13', 'Dr-Feb 24/179', '3600/001', '0', '62000', '161472462', 'Safe Guard 2pcs Purchase for W/H\r\n', '', '', 0, 35, 497),
(1387, '2024-02-13', 'Dr-Feb 24/180', '9100/002', '21000', '0', '469500', 'Taxi Charges for GFC To W/H\r\n', '', '', 0, 39, 498),
(1388, '2024-02-13', 'Dr-Feb 24/180', '3600/001', '0', '21000', '161451462', 'Taxi Charges for GFC To W/H\r\n', '', '', 0, 35, 499),
(1389, '2024-02-13', 'Dr-Feb 24/181', '9100/011', '200000', '0', '12220000', 'Car Rental Charges for Mingalar Charity Donation (ADV;)\r\n', '', '', 0, 39, 500),
(1390, '2024-02-13', 'Dr-Feb 24/181', '3600/001', '0', '200000', '161251462', 'Car Rental Charges for Mingalar Charity Donation (ADV;)\r\n', '', '', 0, 35, 501),
(1391, '2024-02-13', 'Dr-Feb 24/182', '4000/T05', '40000000', '0', '70000000', 'Paid to Thet Oo for Vr No-11132,11202,11215,11242,11265,11279 Cheque No-052404\r\n', '', '', 0, 40, 502),
(1392, '2024-02-13', 'Dr-Feb 24/182', '3600/001', '0', '40000000', '121251462', 'Paid to Thet Oo for Vr No-11132,11202,11215,11242,11265,11279 Cheque No-052404\r\n', '', '', 0, 35, 503),
(1393, '2024-02-13', 'Dr-Feb 24/183', '4000/T02', '6000000', '0', '10000000', 'Paid to Thein Htay for Vr No-11269,11344,11359 Cheque No-052405\r\n', '', '', 0, 40, 504),
(1394, '2024-02-13', 'Dr-Feb 24/183', '3600/001', '0', '6000000', '115251462', 'Paid to Thein Htay for Vr No-11269,11344,11359 Cheque No-052405\r\n', '', '', 0, 35, 505),
(1395, '2024-02-13', 'Dr-Feb 24/184', '9100/012', '10500', '0', '234350', 'Meal Allownace for Market Boys \r\n', '', '', 0, 39, 506),
(1396, '2024-02-13', 'Dr-Feb 24/184', '3600/001', '0', '10500', '115240962', 'Meal Allownace for Market Boys \r\n', '', '', 0, 35, 507),
(1397, '2024-02-13', 'Dr-Feb 24/185', '9100/025', '2000', '0', '16282750', 'Car Parking for Market \r\n', '', '', 0, 37, 508),
(1398, '2024-02-13', 'Dr-Feb 24/185', '3600/001', '0', '2000', '115238962', 'Car Parking for Market \r\n', '', '', 0, 35, 509),
(1399, '2024-02-13', 'Dr-Feb 24/186', '6100/001', '8000', '0', '1131500', 'Labour Charges for Market Fish\r\n', '', '', 0, 37, 510),
(1400, '2024-02-13', 'Dr-Feb 24/186', '3600/001', '0', '8000', '115230962', 'Labour Charges for Market Fish\r\n', '', '', 0, 35, 511),
(1401, '2024-02-13', 'Dr-Feb 24/187', '6100/002', '22000', '0', '612500', 'Ice 2pcs Purchase for Market Fish\r\n', '', '', 0, 37, 512),
(1402, '2024-02-13', 'Dr-Feb 24/187', '3600/001', '0', '22000', '115208962', 'Ice 2pcs Purchase for Market Fish\r\n', '', '', 0, 35, 513),
(1421, '2024-02-14', 'Cr-Feb 24/006', '3600/001', '41700000', '0', '156908962', 'UAB Bank Bal money for ($50868.68) (9.2.24)- $12000*3475 (13.2.24)-11462.5*3475 Italy Money 65%Balance\r\n', '', '', 0, 35, 524),
(1422, '2024-02-14', 'Cr-Feb 24/006', '3300/004', '0', '41700000', '-90926743.14', 'UAB Bank Bal money for ($50868.68) (9.2.24)- $12000*3475 (13.2.24)-11462.5*3475 Italy Money 65%Balance\r\n', '', '', 0, 35, 525),
(1423, '2024-02-14', 'Cr-Feb 24/006', '3600/001', '39832187.5', '0', '196741149.5', 'UAB Bank Bal money for ($50868.68) (9.2.24)- $12000*3475 (13.2.24)-11462.5*3475 Italy Money 65%Balance\r\n', '', '', 0, 35, 526),
(1424, '2024-02-14', 'Cr-Feb 24/006', '3300/004', '0', '39832187.5', '-130758930.64', 'UAB Bank Bal money for ($50868.68) (9.2.24)- $12000*3475 (13.2.24)-11462.5*3475 Italy Money 65%Balance\r\n', '', '', 0, 35, 527),
(1425, '2024-02-14', 'Cr-Feb 24/006', '3600/001', '95236475.5', '0', '291977625', 'UAB Bank Bal money for ($50868.68) (13.2.24)-27406.18*3475ks USA Money 74925 (65%Balance of 42163.36)\r\n', '', '', 0, 35, 528),
(1426, '2024-02-14', 'Cr-Feb 24/006', '3300/002', '0', '95236475.5', '-425801240.19', 'UAB Bank Bal money for ($50868.68) (13.2.24)-27406.18*3475ks USA Money 74925 (65%Balance of 42163.36)\r\n', '', '', 0, 35, 529),
(1432, '2024-02-14', 'Cr-Feb 24/007', '3600/001', '55048875', '0', '347026500', 'USA Money Received from UAB ($74925) 65% , 35% $26223.75-10=26213.75*2100ks $48701.25*3475\r\n', '', '', 0, 35, 530),
(1433, '2024-02-14', 'Cr-Feb 24/007', '3300/002', '0', '55048875', '-480850115.19', 'USA Money Received from UAB ($74925) 65% , 35% $26223.75-10=26213.75*2100ks $48701.25*3475\r\n', '', '', 0, 35, 531),
(1434, '2024-02-14', 'Cr-Feb 24/007', '3600/001', '169236843.75', '0', '516263343.75', 'USA Money (Mr-Sarmad ) Test Transfer form UAB 65% , 35% ($960.48) $336.17-10=$326.17*2100ks ($624.31 Balance in UAB USD A/C)\r\n', '', '', 0, 35, 532),
(1435, '2024-02-14', 'Cr-Feb 24/007', '3300/002', '0', '169236843.75', '-650086958.94', 'USA Money Received from UAB ($74925) 65% , 35% $26223.75-10=26213.75*2100ks $48701.25*3475\r\n', '', '', 0, 35, 533),
(1436, '2024-02-14', 'Cr-Feb 24/008', '3600/001', '684957', '0', '516948300.75', 'USA Money (Mr-Sarmad ) Test Transfer form UAB 65% , 35% ($960.48) $336.17-10=$326.17*2100ks ($624.31 Balance in UAB USD A/C)\r\n', '', '', 0, 35, 534),
(1437, '2024-02-14', 'Cr-Feb 24/008', '3300/002', '0', '684957', '-650771915.94', 'USA Money (Mr-Sarmad ) Test Transfer form UAB 65% , 35% ($960.48) $336.17-10=$326.17*2100ks ($624.31 Balance in UAB USD A/C)\r\n', '', '', 0, 35, 535),
(1438, '2024-02-14', 'Cr-Feb 24/008', '3600/002', '614.31', '0', '24076.81', 'USA Money (Mr-Sarmad ) Test Transfer form UAB 65% , 35% ($960.48) $336.17-10=$326.17*2100ks ($624.31 Balance in UAB USD A/C)\r\n', '', '', 10, 35, 536),
(1439, '2024-02-14', 'Cr-Feb 24/008', '3300/002', '0', '624.31', '-650772540.25', 'USA Money (Mr-Sarmad ) Test Transfer form UAB 65% , 35% ($960.48) $336.17-10=$326.17*2100ks ($624.31 Balance in UAB USD A/C)\r\n', '', '', 0, 35, 537),
(1440, '2024-02-14', 'Dr-Feb 24/188', '4000/T03', '50000000', '0', '110000000', 'Paid to Thin Thin Yee for Vr No-11176,11177\r\n', '', '', 0, 40, 538),
(1528, '2024-02-14', 'Dr-Feb 24/188', '3600/001', '0', '50000000', '466948300.75', 'Paid to Thin Thin Yee for Vr No-11176,11177\r\n', '', '', 0, 35, 539),
(1529, '2024-02-14', 'Dr-Feb 24/189', '4000/Y01', '4000000', '0', '9000000', 'Paid to Ye Yint for Vr No-11133,11135\r\n', '', '', 0, 40, 540),
(1530, '2024-02-14', 'Dr-Feb 24/189', '3600/001', '0', '4000000', '462948300.75', 'Paid to Ye Yint for Vr No-11133,11135\r\n', '', '', 0, 35, 541),
(1531, '2024-02-14', 'Dr-Feb 24/190', '4000/Z03', '10000000', '0', '16000000', 'Paid to Zaw Myat Thu for Vr No-11357,11361\r\n', '', '', 0, 40, 542),
(1532, '2024-02-14', 'Dr-Feb 24/190', '3600/001', '0', '10000000', '452948300.75', 'Paid to Zaw Myat Thu for Vr No-11357,11361\r\n', '', '', 0, 35, 543),
(1533, '2024-02-14', 'Dr-Feb 24/191', '4000/S03', '20000000', '0', '40000000', 'Paid to Soe Min for Vr No-11020,11069,11121\r\n', '', '', 0, 40, 544),
(1534, '2024-02-14', 'Dr-Feb 24/191', '3600/001', '0', '20000000', '432948300.75', 'Paid to Soe Min for Vr No-11020,11069,11121\r\n', '', '', 0, 35, 545),
(1535, '2024-02-14', 'Dr-Feb 24/192', '4000/T11', '30000000', '0', '100000000', 'Paid to Tun Zaw Min for Vr No-11079\r\n', '', '', 0, 40, 546),
(1536, '2024-02-14', 'Dr-Feb 24/192', '3600/001', '0', '30000000', '402948300.75', 'Paid to Tun Zaw Min for Vr No-11079\r\n', '', '', 0, 35, 547),
(1537, '2024-02-14', 'Dr-Feb 24/193', '4000/S05', '6000000', '0', '6000000', 'Paid to Si Thu (D-22) for Vr No\r\n', '', '', 0, 40, 548),
(1538, '2024-02-14', 'Dr-Feb 24/193', '3600/001', '0', '6000000', '396948300.75', 'Paid to Si Thu (D-22) for Vr No\r\n', '', '', 0, 35, 549),
(1539, '2024-02-14', 'Dr-Feb 24/194', '4000/M03', '5000000', '0', '10000000', 'Paid to Mg Mg Nyunt for Vr No-11192\r\n', '', '', 0, 40, 550),
(1540, '2024-02-14', 'Dr-Feb 24/194', '3600/001', '0', '5000000', '391948300.75', 'Paid to Mg Mg Nyunt for Vr No-11192\r\n', '', '', 0, 35, 551),
(1541, '2024-02-14', 'Dr-Feb 24/195', '4000/P01', '3000000', '0', '6500000', 'Paid to Phone Naing for Vr No-11268\r\n', '', '', 0, 40, 552),
(1542, '2024-02-14', 'Dr-Feb 24/195', '3600/001', '0', '3000000', '388948300.75', 'Paid to Phone Naing for Vr No-11268\r\n', '', '', 0, 35, 553),
(1543, '2024-02-14', 'Dr-Feb 24/196', '4000/M06', '5000000', '0', '9000000', 'Paid to Mg Mg Soe for Vr No-11185,11198\r\n', '', '', 0, 40, 554),
(1544, '2024-02-14', 'Dr-Feb 24/196', '3600/001', '0', '5000000', '383948300.75', 'Paid to Mg Mg Soe for Vr No-11185,11198\r\n', '', '', 0, 35, 555),
(1545, '2024-02-14', 'Dr-Feb 24/197', '4000/S07', '12000000', '0', '42000000', 'Paid to Soe Thein (TCL) for Vr No-00123\r\n', '', '', 0, 40, 556),
(1546, '2024-02-14', 'Dr-Feb 24/197', '3600/001', '0', '12000000', '371948300.75', 'Paid to Soe Thein (TCL) for Vr No-00123\r\n', '', '', 0, 35, 557),
(1547, '2024-02-14', 'Dr-Feb 24/198', '4000/T05', '50000000', '0', '120000000', 'Paid to Thet Oo for Vr No-11279,11328,11348\r\n', '', '', 0, 40, 558),
(1548, '2024-02-14', 'Dr-Feb 24/198', '3600/001', '0', '50000000', '321948300.75', 'Paid to Thet Oo for Vr No-11279,11328,11348\r\n', '', '', 0, 35, 559),
(1549, '2024-02-14', 'Dr-Feb 24/199', '4000/K07', '7000000', '0', '14000000', 'Paid to Khin Mg Myint for Vr No-11189\r\n', '', '', 0, 40, 560),
(1550, '2024-02-14', 'Dr-Feb 24/199', '3600/001', '0', '7000000', '314948300.75', 'Paid to Khin Mg Myint for Vr No-11189\r\n', '', '', 0, 35, 561),
(1551, '2024-02-14', 'Dr-Feb 24/200', '4000/C02', '4000000', '0', '9000000', 'Paid to Cho Mg for Vr No-11161\r\n', '', '', 0, 40, 562),
(1552, '2024-02-14', 'Dr-Feb 24/200', '3600/001', '0', '4000000', '310948300.75', 'Paid to Cho Mg for Vr No-11161\r\n', '', '', 0, 35, 563),
(1553, '2024-02-14', 'Dr-Feb 24/201', '4000/B01', '4000000', '0', '7000000', 'Paid to Bar Bu Lay for Vr No-11263,11323\r\n', '', '', 0, 40, 564),
(1554, '2024-02-14', 'Dr-Feb 24/201', '3600/001', '0', '4000000', '306948300.75', 'Paid to Bar Bu Lay for Vr No-11263,11323\r\n', '', '', 0, 35, 565),
(1555, '2024-02-14', 'Dr-Feb 24/202', '4000/A07', '3000000', '0', '7000000', 'Paid to A Thay Lay for Vr No-11237\r\n', '', '', 0, 40, 566),
(1556, '2024-02-14', 'Dr-Feb 24/202', '3600/001', '0', '3000000', '303948300.75', 'Paid to A Thay Lay for Vr No-11237\r\n', '', '', 0, 35, 567),
(1557, '2024-02-14', 'Dr-Feb 24/203', '4000/S08', '5000000', '0', '9000000', 'Paid to Soe Naing for Vr No-10542\r\n', '', '', 0, 40, 568),
(1558, '2024-02-14', 'Dr-Feb 24/203', '3600/001', '0', '5000000', '298948300.75', 'Paid to Soe Naing for Vr No-10542\r\n', '', '', 0, 35, 569),
(1559, '2024-02-14', 'Dr-Feb 24/204', '4000/K04', '4000000', '0', '8000000', 'Paid to Kaung Myat for Vr No-11341\r\n', '', '', 0, 40, 570),
(1560, '2024-02-14', 'Dr-Feb 24/204', '3600/001', '0', '4000000', '294948300.75', 'Paid to Kaung Myat for Vr No-11341\r\n', '', '', 0, 35, 571),
(1561, '2024-02-14', 'Dr-Feb 24/205', '4000/A02', '4000000', '0', '7000000', 'Paid to Arr Kae for Vr No-11199,11248\r\n', '', '', 0, 40, 572),
(1562, '2024-02-14', 'Dr-Feb 24/205', '3600/001', '0', '4000000', '290948300.75', 'Paid to Arr Kae for Vr No-11199,11248\r\n', '', '', 0, 35, 573),
(1563, '2024-02-14', 'Dr-Feb 24/206', '4000/A03', '7000000', '0', '14000000', 'Paid to Aung Naing Oo for Vr No-11021,11049,11067,11085\r\n', '', '', 0, 40, 574),
(1564, '2024-02-14', 'Dr-Feb 24/206', '3600/001', '0', '7000000', '283948300.75', 'Paid to Aung Naing Oo for Vr No-11021,11049,11067,11085\r\n', '', '', 0, 35, 575),
(1565, '2024-02-14', 'Dr-Feb 24/207', '4000/A01', '6000000', '0', '10000000', 'Paid to AK for Vr No-11023,11082,11128\r\n', '', '', 0, 40, 576),
(1566, '2024-02-14', 'Dr-Feb 24/207', '3600/001', '0', '6000000', '277948300.75', 'Paid to AK for Vr No-11023,11082,11128\r\n', '', '', 0, 35, 577),
(1567, '2024-02-14', 'Dr-Feb 24/208', '4000/A06', '3000000', '0', '6000000', 'Paid to Aung Zaw Oo for Vr No-11172,11184\r\n', '', '', 0, 40, 578),
(1568, '2024-02-14', 'Dr-Feb 24/208', '3600/001', '0', '3000000', '274948300.75', 'Paid to Aung Zaw Oo for Vr No-11172,11184\r\n', '', '', 0, 35, 579),
(1569, '2024-02-14', 'Dr-Feb 24/209', '4000/S01', '6000000', '0', '11000000', 'Paid to Shwe Late for Vr No-10902,10923,10937,10941\r\n', '', '', 0, 40, 580),
(1570, '2024-02-14', 'Dr-Feb 24/209', '3600/001', '0', '6000000', '268948300.75', 'Paid to Shwe Late for Vr No-10902,10923,10937,10941\r\n', '', '', 0, 35, 581),
(1571, '2024-02-14', 'Dr-Feb 24/210', '4000/001', '6000000', '0', '11000000', 'Paid to 4 Zaw for Vr No-11054\r\n', '', '', 0, 40, 582),
(1572, '2024-02-14', 'Dr-Feb 24/210', '3600/001', '0', '6000000', '262948300.75', 'Paid to 4 Zaw for Vr No-11054\r\n', '', '', 0, 35, 583),
(1573, '2024-02-14', 'Dr-Feb 24/211', '6100/003', '20500', '0', '16303250', 'Penam Bag and Taxi Charges for WH\r\n', '', '', 0, 37, 584),
(1574, '2024-02-14', 'Dr-Feb 24/211', '3600/001', '0', '20500', '262927800.75', 'Penam Bag and Taxi Charges for WH\r\n', '', '', 0, 35, 585),
(1575, '2024-02-14', 'Dr-Feb 24/212', '9100/012', '10000', '0', '244350', 'Meal Allowance for Office 5pcs Payment Day\r\n', '', '', 0, 39, 586),
(1576, '2024-02-14', 'Dr-Feb 24/212', '3600/001', '0', '10000', '262917800.75', 'Meal Allowance for Office 5pcs Payment Day\r\n', '', '', 0, 35, 587),
(1577, '2024-02-14', 'Dr-Feb 24/213', '9100/002', '29000', '0', '498500', 'Taxi Charges for Office 5 pcs Payment Day  \r\n', '', '', 0, 39, 588),
(1578, '2024-02-14', 'Dr-Feb 24/213', '3600/001', '0', '29000', '262888800.75', 'Taxi Charges for Office 5 pcs Payment Day  \r\n', '', '', 0, 35, 589),
(1579, '2024-02-14', 'Dr-Feb 24/214', '6100/003', '1193500', '0', '17496750', 'Paid to Plastic (G/F) for (12.2)\r\n', '', '', 0, 37, 590),
(1580, '2024-02-14', 'Dr-Feb 24/214', '3600/001', '0', '1193500', '261695300.75', 'Paid to Plastic (G/F) for (12.2)\r\n', '', '', 0, 35, 591),
(1581, '2024-02-14', 'Dr-Feb 24/215', '9100/003', '4500', '0', '21600', 'Water 5pcs Purchase for W/H\r\n', '', '', 0, 39, 592),
(1582, '2024-02-14', 'Dr-Feb 24/215', '3600/001', '0', '4500', '261690800.75', 'Water 5pcs Purchase for W/H\r\n', '', '', 0, 35, 593),
(1583, '2024-02-14', 'Dr-Feb 24/216', '6100/004', '60000', '0', '190000', 'Kit Box Carry Charges for W/H to Ocean\r\n', '', '', 0, 37, 594),
(1584, '2024-02-14', 'Dr-Feb 24/216', '3600/001', '0', '60000', '261630800.75', 'Kit Box Carry Charges for W/H to Ocean\r\n', '', '', 0, 35, 595),
(1585, '2024-02-14', 'Dr-Feb 24/217', '9100/007', '55500', '0', '613000', 'Roller Rope Purchase for PK Machine\r\n', '', '', 0, 39, 596),
(1586, '2024-02-14', 'Dr-Feb 24/217', '3600/001', '0', '55500', '261575300.75', 'Roller Rope Purchase for PK Machine\r\n', '', '', 0, 35, 597),
(1587, '2024-02-14', 'Dr-Feb 24/218', '9100/011', '38500', '0', '12258500', 'Candy Purchase for Mingalar Charity Donation \r\n', '', '', 0, 39, 598),
(1588, '2024-02-14', 'Dr-Feb 24/218', '3600/001', '0', '38500', '261536800.75', 'Candy Purchase for Mingalar Charity Donation \r\n', '', '', 0, 35, 599),
(1589, '2024-02-14', 'Dr-Feb 24/219', '9100/002', '22000', '0', '520500', 'Taxi Charges for W/H to GFC RP Change\r\n', '', '', 0, 39, 600),
(1590, '2024-02-14', 'Dr-Feb 24/219', '3600/001', '0', '22000', '261514800.75', 'Taxi Charges for W/H to GFC RP Change\r\n', '', '', 0, 35, 601),
(1591, '2024-02-14', 'Dr-Feb 24/220', '9100/007', '10500', '0', '623500', 'Digital Battery Purchase for W/H\r\n', '', '', 0, 39, 602),
(1592, '2024-02-14', 'Dr-Feb 24/220', '3600/001', '0', '10500', '261504300.75', 'Digital Battery Purchase for W/H\r\n', '', '', 0, 35, 603),
(1593, '2024-02-14', 'Dr-Feb 24/221', '6100/002', '100000', '0', '712500', 'Ice 10 pcs for Raw\r\n', '', '', 0, 37, 604),
(1594, '2024-02-14', 'Dr-Feb 24/221', '3600/001', '0', '100000', '261404300.75', 'Ice 10 pcs for Raw\r\n', '', '', 0, 35, 605),
(1595, '2024-02-14', 'Dr-Feb 24/222', '6100/001', '111000', '0', '1242500', 'Labour Charges for D-Puti (160 viss*600) and Taxi Charges -15000\r\n', '', '', 0, 37, 606),
(1596, '2024-02-14', 'Dr-Feb 24/222', '3600/001', '0', '111000', '261293300.75', 'Labour Charges for D-Puti (160 viss*600) and Taxi Charges -15000\r\n', '', '', 0, 35, 607),
(1597, '2024-02-14', 'Dr-Feb 24/223', '6100/002', '51000', '0', '763500', 'Ice purchase and Carry for (D-Puti)\r\n', '', '', 0, 37, 608),
(1598, '2024-02-14', 'Dr-Feb 24/223', '3600/001', '0', '51000', '261242300.75', 'Ice purchase and Carry for (D-Puti)\r\n', '', '', 0, 35, 609),
(1599, '2024-02-14', 'Dr-Feb 24/224', '9100/006', '100000', '0', '940000', 'Car Petrol for 6J-3015 13.2.24/14.2.24\r\n', '', '', 0, 39, 610),
(1600, '2024-02-14', 'Dr-Feb 24/224', '3600/001', '0', '100000', '261142300.75', 'Car Petrol for 6J-3015 13.2.24/14.2.24\r\n', '', '', 0, 35, 611),
(1601, '2024-02-14', 'Dr-Feb 24/225', '9100/002', '25000', '0', '545500', 'Taxi Charges for W/H to GFC to W/H RP Change\r\n', '', '', 0, 39, 612),
(1602, '2024-02-14', 'Dr-Feb 24/225', '3600/001', '0', '25000', '261117300.75', 'Taxi Charges for W/H to GFC to W/H RP Change\r\n', '', '', 0, 35, 613),
(1603, '2024-02-14', 'Dr-Feb 24/226', '9100/019', '36500', '0', '36500', 'Kaspersky and Services Charges for Daw Nan (New Computer)\r\n', '', '', 0, 39, 614),
(1604, '2024-02-14', 'Dr-Feb 24/226', '3600/001', '0', '36500', '261080800.75', 'Kaspersky and Services Charges for Daw Nan (New Computer)\r\n', '', '', 0, 35, 615),
(1605, '2024-02-14', 'Dr-Feb 24/227', '9100/002', '22000', '0', '567500', 'Taxi Charges for HHK to W/H\r\n', '', '', 0, 39, 616),
(1606, '2024-02-14', 'Dr-Feb 24/227', '3600/001', '0', '22000', '261058800.75', 'Taxi Charges for HHK to W/H\r\n', '', '', 0, 35, 617),
(1607, '2024-02-14', 'Dr-Feb 24/228', '6100/001', '202250', '0', '1444750', 'Labour Charges for D-Puti (260 viss*600) Mrigal (SL) (125 viss*130) and Taxi Charges\r\n', '', '', 0, 37, 618),
(1608, '2024-02-14', 'Dr-Feb 24/228', '3600/001', '0', '202250', '260856550.75', 'Labour Charges for D-Puti (260 viss*600) Mrigal (SL) (125 viss*130) and Taxi Charges\r\n', '', '', 0, 35, 619),
(1609, '2024-02-14', 'Dr-Feb 24/228', '6100/002', '63000', '0', '826500', 'Ice 7pcs Purchase for Dputi,Boal,Ayar,Rohu,Mrigal 7*9000ks\r\n', '', '', 0, 37, 620),
(1610, '2024-02-14', 'Dr-Feb 24/228', '3600/001', '0', '63000', '260793550.75', 'Ice 7pcs Purchase for Dputi,Boal,Ayar,Rohu,Mrigal 7*9000ks\r\n', '', '', 0, 35, 621),
(1611, '2024-02-14', 'Dr-Feb 24/229', '9100/018', '11000', '0', '193000', 'Extention 1 pcs purchase for WH\r\n', '', '', 0, 39, 622),
(1612, '2024-02-14', 'Dr-Feb 24/229', '3600/001', '0', '11000', '260782550.75', 'Extention 1 pcs purchase for WH\r\n', '', '', 0, 35, 623),
(1613, '2024-02-14', 'Dr-Feb 24/230', '6100/006', '1158820', '0', '5018820', 'Paid to Sticker 5 colour\r\n', '', '', 0, 37, 624),
(1614, '2024-02-14', 'Dr-Feb 24/230', '3600/001', '0', '1158820', '259623730.75', 'Paid to Sticker 5 colour\r\n', '', '', 0, 35, 625),
(1619, '2024-02-14', 'Dr-Feb 24/236', '9100/002', '10000', '0', '577500', 'Taxi Charges for Market to W/H\r\n', '', '', 0, 39, 630),
(1620, '2024-02-14', 'Dr-Feb 24/236', '3600/001', '0', '10000', '259613730.75', 'Taxi Charges for Market to W/H\r\n', '', '', 0, 35, 631),
(1621, '2024-02-14', 'Dr-Feb 24/237', '6100/002', '33000', '0', '859500', 'Ice 3pcs Purchase for Market Fish\r\n', '', '', 0, 37, 632),
(1622, '2024-02-14', 'Dr-Feb 24/237', '3600/001', '0', '33000', '259580730.75', 'Ice 3pcs Purchase for Market Fish\r\n', '', '', 0, 35, 633),
(1623, '2024-02-14', 'Dr-Feb 24/238', '9100/012', '8000', '0', '252350', 'Meal Allowance for Market Boys 4pcs\r\n', '', '', 0, 39, 634),
(1624, '2024-02-14', 'Dr-Feb 24/238', '3600/001', '0', '8000', '259572730.75', 'Meal Allowance for Market Boys 4pcs\r\n', '', '', 0, 35, 635),
(1625, '2024-02-15', 'Dr-Feb 24/239', '4000/T08', '4000000', '0', '9000000', 'Paid to Than Than Myint for Vr No\r\n', '', '', 0, 40, 636),
(1626, '2024-02-15', 'Dr-Feb 24/239', '3600/001', '0', '4000000', '255572730.75', 'Paid to Than Than Myint for Vr No\r\n', '', '', 0, 35, 637),
(1627, '2024-02-15', 'Dr-Feb 24/240', '4000/M01', '5370700', '0', '9370700', 'Paid to MA for Vr No-10586,10603,10757\r\n', '', '', 0, 40, 638),
(1628, '2024-02-15', 'Dr-Feb 24/240', '3600/001', '0', '5370700', '250202030.75', 'Paid to MA for Vr No-10586,10603,10757\r\n', '', '', 0, 35, 639),
(1629, '2024-02-15', 'Dr-Feb 24/241', '4000/T01', '4000000', '0', '8000000', 'Paid to Thet Paing for Vr No-11327 \r\n', '', '', 0, 40, 640),
(1630, '2024-02-15', 'Dr-Feb 24/241', '3600/001', '0', '4000000', '246202030.75', 'Paid to Thet Paing for Vr No-11327 \r\n', '', '', 0, 35, 641),
(1631, '2024-02-15', 'Dr-Feb 24/242', '4000/K06', '565400', '0', '665400', 'Paid to Ka Yin Lay for Vr No-11372\r\n', '', '', 0, 40, 642),
(1632, '2024-02-15', 'Dr-Feb 24/242', '3600/001', '0', '565400', '245636630.75', 'Paid to Ka Yin Lay for Vr No-11372\r\n', '', '', 0, 35, 643),
(1633, '2024-02-15', 'Dr-Feb 24/243', '4000/Z01', '6000000', '0', '10000000', 'Paid to Zaw Zaw Latt for Vr No-11008,11191\r\n', '', '', 0, 40, 644),
(1634, '2024-02-15', 'Dr-Feb 24/243', '3600/001', '0', '6000000', '239636630.75', 'Paid to Zaw Zaw Latt for Vr No-11008,11191\r\n', '', '', 0, 35, 645),
(1635, '2024-02-15', 'Dr-Feb 24/244', '6100/006', '2692000', '0', '7710820', 'Paid to Sticker 5 colour\r\n', '', '', 0, 37, 646),
(1636, '2024-02-15', 'Dr-Feb 24/244', '3600/001', '0', '2692000', '236944630.75', 'Paid to Sticker 5 colour\r\n', '', '', 0, 35, 647),
(1637, '2024-02-15', 'Dr-Feb 24/245', '9100/002', '18000', '0', '595500', 'Taxi Charges for W/H to Ocean\r\n', '', '', 0, 39, 648),
(1638, '2024-02-15', 'Dr-Feb 24/245', '3600/001', '0', '18000', '236926630.75', 'Taxi Charges for W/H to Ocean\r\n', '', '', 0, 35, 649),
(1639, '2024-02-15', 'Dr-Feb 24/246', '9100/003', '2700', '0', '24300', 'Water 3pcs Purhcase for W/H\r\n', '', '', 0, 39, 650),
(1640, '2024-02-15', 'Dr-Feb 24/246', '3600/001', '0', '2700', '236923930.75', 'Water 3pcs Purhcase for W/H\r\n', '', '', 0, 35, 651),
(1641, '2024-02-15', 'Dr-Feb 24/247', '6100/007', '5960000', '0', '27827016', 'Paid to GFC Cold Store Charges \r\n', '', '', 0, 37, 652),
(1642, '2024-02-15', 'Dr-Feb 24/247', '3600/001', '0', '5960000', '230963930.75', 'Paid to GFC Cold Store Charges \r\n', '', '', 0, 35, 653),
(1643, '2024-02-15', 'Dr-Feb 24/248', '9100/011', '550000', '0', '12808500', 'Car Charges for Rice,Beam and Oil of Mingalar Charity Donation 150000+Car Rental Balance 400000\r\n', '', '', 0, 39, 654),
(1644, '2024-02-15', 'Dr-Feb 24/248', '3600/001', '0', '550000', '230413930.75', 'Car Charges for Rice,Beam and Oil of Mingalar Charity Donation 150000+Car Rental Balance 400000\r\n', '', '', 0, 35, 655),
(1645, '2024-02-15', 'Dr-Feb 24/250', '6100/003', '2272500', '0', '19769250', 'Paid to Foam Box (YC) for (24.1) (25.1)\r\n', '', '', 0, 37, 656),
(1646, '2024-02-15', 'Dr-Feb 24/250', '3600/001', '0', '2272500', '228141430.75', 'Paid to Foam Box (YC) for (24.1) (25.1)\r\n', '', '', 0, 35, 657),
(1647, '2024-02-15', 'Dr-Feb 24/251', '4000/K05', '9000000', '0', '16000000', 'Paid to Kyaw Zay Ya for Vr No-11097\r\n', '', '', 0, 40, 658),
(1648, '2024-02-15', 'Dr-Feb 24/251', '3600/001', '0', '9000000', '219141430.75', 'Paid to Kyaw Zay Ya for Vr No-11097\r\n', '', '', 0, 35, 659),
(1649, '2024-02-15', 'Dr-Feb 24/252', '4000/A05', '5000000', '0', '10000000', 'Paid to Aung Myo Min for Vr No-11052\r\n', '', '', 0, 40, 660),
(1650, '2024-02-15', 'Dr-Feb 24/252', '3600/001', '0', '5000000', '214141430.75', 'Paid to Aung Myo Min for Vr No-11052\r\n', '', '', 0, 35, 661),
(1651, '2024-02-15', 'Dr-Feb 24/253', '6100/003', '450200', '0', '20219450', 'Penam Bag purchase for WH\r\n', '', '', 0, 37, 662),
(1652, '2024-02-15', 'Dr-Feb 24/253', '3600/001', '0', '450200', '213691230.75', 'Penam Bag purchase for WH\r\n', '', '', 0, 35, 663),
(1653, '2024-02-15', 'Dr-Feb 24/254', '9100/009', '5400', '0', '6900', 'Wave Money Transfer Charges for KaYinLay \r\n', '', '', 0, 39, 664),
(1654, '2024-02-15', 'Dr-Feb 24/254', '3600/001', '0', '5400', '213685830.75', 'Wave Money Transfer Charges for KaYinLay \r\n', '', '', 0, 35, 665),
(1655, '2024-02-15', 'Dr-Feb 24/255', '9100/005', '43700', '0', '87700', 'Broom and Taxi Charges for W/H\r\n', '', '', 0, 39, 666),
(1656, '2024-02-15', 'Dr-Feb 24/255', '3600/001', '0', '43700', '213642130.75', 'Broom and Taxi Charges for W/H\r\n', '', '', 0, 35, 667),
(1657, '2024-02-15', 'Dr-Feb 24/256', '9100/025', '2000', '0', '20221450', 'Car Parking for Market 6J\r\n', '', '', 0, 37, 668),
(1658, '2024-02-15', 'Dr-Feb 24/256', '3600/001', '0', '2000', '213640130.75', 'Car Parking for Market 6J\r\n', '', '', 0, 35, 669),
(1659, '2024-02-15', 'Dr-Feb 24/257', '6100/001', '7000', '0', '1451750', 'Labour Charges for Market Fish\r\n', '', '', 0, 37, 670),
(1660, '2024-02-15', 'Dr-Feb 24/257', '3600/001', '0', '7000', '213633130.75', 'Labour Charges for Market Fish\r\n', '', '', 0, 35, 671),
(1661, '2024-02-15', 'Dr-Feb 24/258', '9100/002', '10000', '0', '605500', 'Taxi Charges for Market to W/H\r\n', '', '', 0, 39, 672),
(1662, '2024-02-15', 'Dr-Feb 24/258', '3600/001', '0', '10000', '213623130.75', 'Taxi Charges for Market to W/H\r\n', '', '', 0, 35, 673),
(1663, '2024-02-15', 'Dr-Feb 24/259', '6100/002', '27000', '0', '886500', 'Ice 2.5pcs Purchase for Market Fish\r\n', '', '', 0, 37, 674),
(1664, '2024-02-15', 'Dr-Feb 24/259', '3600/001', '0', '27000', '213596130.75', 'Ice 2.5pcs Purchase for Market Fish\r\n', '', '', 0, 35, 675),
(1667, '2024-02-14', 'Dr-Feb 24/232', '9100/020', '4300000', '0', '4300000', 'Paid to Agent Aung Myat Zaw Adv for USA No-1/24, Can No 2/24\r\n', '', '', 0, 39, 678),
(1668, '2024-02-14', 'Dr-Feb 24/232', '3600/001', '0', '4300000', '209296130.75', 'Paid to Agent Aung Myat Zaw Adv for USA No-1/24, Can No 2/24\r\n', '', '', 0, 35, 679),
(1669, '2024-02-14', 'Dr-Feb 24/233', '9100/021', '300000', '0', '300000', 'DOF Charges for USA 1/24, Can 2/24\r\n', '', '', 0, 39, 680),
(1670, '2024-02-14', 'Dr-Feb 24/233', '3600/001', '0', '300000', '208996130.75', 'DOF Charges for USA 1/24, Can 2/24\r\n', '', '', 0, 35, 681),
(1671, '2024-02-14', 'Dr-Feb 24/234', '9100/022', '400000', '0', '400000', 'Paid to Ocean Pacific for USA 1/24 and Can 2/24 Loading\r\n', '', '', 0, 39, 682),
(1672, '2024-02-14', 'Dr-Feb 24/234', '3600/001', '0', '400000', '208596130.75', 'Paid to Ocean Pacific for USA 1/24 and Can 2/24 Loading\r\n', '', '', 0, 35, 683),
(1673, '2024-02-14', 'Dr-Feb 24/235', '9100/025', '10000', '0', '20231450', 'Car Parking Charges for Market 6J\r\n', '', '', 0, 39, 684),
(1674, '2024-02-14', 'Dr-Feb 24/235', '3600/001', '0', '10000', '208586130.75', 'Car Parking Charges for Market 6J\r\n', '', '', 0, 35, 685),
(1766, '2024-02-16', 'Dr-Feb 24/259', '6100/003', '860000', '0', '21079450', 'Paid to Dalian Ice for Packing Strap JCV (13.2) (16.2)\r\n', '', '', 0, 37, 686),
(1767, '2024-02-16', 'Dr-Feb 24/259', '3600/001', '0', '860000', '207726130.75', 'Paid to Dalian Ice for Packing Strap JCV (13.2) (16.2)\r\n', '', '', 0, 35, 687),
(1768, '2024-02-16', 'Dr-Feb 24/260', '9100/004', '3000', '0', '185175', 'Sir Phone Bill\r\n', '', '', 0, 39, 688),
(1769, '2024-02-16', 'Dr-Feb 24/260', '3600/001', '0', '3000', '207723130.75', 'Sir Phone Bill\r\n', '', '', 0, 35, 689),
(1770, '2024-02-16', 'Dr-Feb 24/261', '9100/012', '63000', '0', '315350', 'Birthday Cake for (Mr-Sarmad)\r\n', '', '', 0, 39, 690),
(1771, '2024-02-16', 'Dr-Feb 24/261', '3600/001', '0', '63000', '207660130.75', 'Birthday Cake for (Mr-Sarmad)\r\n', '', '', 0, 35, 691),
(1772, '2024-02-16', 'Dr-Feb 24/262', '9100/003', '5400', '0', '29700', 'Water 6 pk purchase for WH\r\n', '', '', 0, 39, 692),
(1773, '2024-02-16', 'Dr-Feb 24/262', '3600/001', '0', '5400', '207654730.75', 'Water 6 pk purchase for WH\r\n', '', '', 0, 35, 693),
(1774, '2024-02-16', 'Dr-Feb 24/263', '9100/006', '100000', '0', '1040000', 'Car Diesel for 6J-3015 (15.2)-50000/ (16.2)-50000\r\n', '', '', 0, 39, 694),
(1775, '2024-02-16', 'Dr-Feb 24/263', '3600/001', '0', '100000', '207554730.75', 'Car Diesel for 6J-3015 (15.2)-50000/ (16.2)-50000\r\n', '', '', 0, 35, 695),
(1776, '2024-02-16', 'Dr-Feb 24/264', '9100/006', '145000', '0', '1185000', 'Car Diesel for 5L-2848\r\n', '', '', 0, 39, 696),
(1777, '2024-02-16', 'Dr-Feb 24/264', '3600/001', '0', '145000', '207409730.75', 'Car Diesel for 5L-2848\r\n', '', '', 0, 35, 697),
(1778, '2024-02-16', 'Dr-Feb 24/265', '9100/014', '10000', '0', '53000', 'Engin Oil purchase for 6J-3015\r\n', '', '', 0, 39, 698),
(1779, '2024-02-16', 'Dr-Feb 24/265', '3600/001', '0', '10000', '207399730.75', 'Engin Oil purchase for 6J-3015\r\n', '', '', 0, 35, 699),
(1780, '2024-02-16', 'Dr-Feb 24/266', '6100/007', '3298466', '0', '31125482', 'Paid to Ocean Pacific Cold Store\r\n', '', '', 0, 37, 700),
(1781, '2024-02-16', 'Dr-Feb 24/266', '3600/001', '0', '3298466', '204101264.75', 'Paid to Ocean Pacific Cold Store\r\n', '', '', 0, 35, 701),
(1782, '2024-02-16', 'Dr-Feb 24/267', '9100/002', '4000', '0', '609500', 'Taxi Charges Car Driver for (Night)\r\n', '', '', 0, 39, 702),
(1783, '2024-02-16', 'Dr-Feb 24/267', '3600/001', '0', '4000', '204097264.75', 'Taxi Charges Car Driver for (Night)\r\n', '', '', 0, 35, 703),
(1784, '2024-02-16', 'Dr-Feb 24/268', '9100/002', '21000', '0', '630500', 'Taxi Charges WH to GFC for (R.P)\r\n', '', '', 0, 39, 704),
(1785, '2024-02-16', 'Dr-Feb 24/268', '3600/001', '0', '21000', '204076264.75', 'Taxi Charges WH to GFC for (R.P)\r\n', '', '', 0, 35, 705),
(1786, '2024-02-16', 'Dr-Feb 24/269', '9100/005', '2000', '0', '89700', 'Key 2 pcs purchase for Can 2\r\n', '', '', 0, 39, 706),
(1787, '2024-02-16', 'Dr-Feb 24/269', '3600/001', '0', '2000', '204074264.75', 'Key 2 pcs purchase for Can 2\r\n', '', '', 0, 35, 707),
(1788, '2024-02-16', 'Dr-Feb 24/270', '6100/001', '6000', '0', '1457750', 'Labour Charges for Ocean (Raw)\r\n', '', '', 0, 37, 708),
(1789, '2024-02-16', 'Dr-Feb 24/270', '3600/001', '0', '6000', '204068264.75', 'Labour Charges for Ocean (Raw)\r\n', '', '', 0, 35, 709),
(1790, '2024-02-16', 'Dr-Feb 24/271', '9100/002', '5000', '0', '635500', 'Taxi Charges for Thuzar (14,15) 8:30 PM\r\n', '', '', 0, 39, 710),
(1791, '2024-02-16', 'Dr-Feb 24/271', '3600/001', '0', '5000', '204063264.75', 'Taxi Charges for Thuzar (14,15) 8:30 PM\r\n', '', '', 0, 35, 711),
(1792, '2024-02-16', 'Dr-Feb 24/272', '6100/003', '85000', '0', '21164450', 'Penam Bag purchase and Taxi Charges\r\n', '', '', 0, 37, 712),
(1793, '2024-02-16', 'Dr-Feb 24/272', '3600/001', '0', '85000', '203978264.75', 'Penam Bag purchase and Taxi Charges\r\n', '', '', 0, 35, 713),
(1794, '2024-02-16', 'Dr-Feb 24/273', '9100/002', '2500', '0', '638000', 'Taxi Charges for Thuzar (16.2)\r\n', '', '', 0, 39, 714),
(1795, '2024-02-16', 'Dr-Feb 24/273', '3600/001', '0', '2500', '203975764.75', 'Taxi Charges for Thuzar (16.2)\r\n', '', '', 0, 35, 715),
(1796, '2024-02-16', 'Dr-Feb 24/274', '6100/001', '4500', '0', '1462250', 'Labour Charges for (Ocean Raw)\r\n', '', '', 0, 37, 716),
(1797, '2024-02-16', 'Dr-Feb 24/274', '3600/001', '0', '4500', '203971264.75', 'Labour Charges for (Ocean Raw)\r\n', '', '', 0, 35, 717),
(1798, '2024-02-16', 'Dr-Feb 24/275', '9100/002', '12000', '0', '650000', 'Taxi Charges for WH to Ocean (Pk)\r\n', '', '', 0, 39, 718),
(1799, '2024-02-16', 'Dr-Feb 24/275', '3600/001', '0', '12000', '203959264.75', 'Taxi Charges for WH to Ocean (Pk)\r\n', '', '', 0, 35, 719),
(1800, '2024-02-16', 'Dr-Feb 24/276', '9100/002', '35000', '0', '685000', 'Taxi Chrges for Market to GFC to WH\r\n', '', '', 0, 39, 720),
(1801, '2024-02-16', 'Dr-Feb 24/276', '3600/001', '0', '35000', '203924264.75', 'Taxi Chrges for Market to GFC to WH\r\n', '', '', 0, 35, 721),
(1802, '2024-02-16', 'Dr-Feb 24/277', '9100/012', '6000', '0', '321350', 'Meal allowance for Market Boys 3 pcs\r\n', '', '', 0, 39, 722),
(1803, '2024-02-16', 'Dr-Feb 24/277', '3600/001', '0', '6000', '203918264.75', 'Meal allowance for Market Boys 3 pcs\r\n', '', '', 0, 35, 723),
(1804, '2024-02-16', 'Dr-Feb 24/278', '9100/025', '2000', '0', '20233450', 'Car PK for (Market)\r\n', '', '', 0, 39, 724),
(1805, '2024-02-16', 'Dr-Feb 24/278', '3600/001', '0', '2000', '203916264.75', 'Car PK for (Market)\r\n', '', '', 0, 35, 725),
(1806, '2024-02-16', 'Dr-Feb 24/279', '6100/001', '15000', '0', '1477250', 'Labour Charges for Market Fish\r\n', '', '', 0, 37, 726),
(1807, '2024-02-16', 'Dr-Feb 24/279', '3600/001', '0', '15000', '203901264.75', 'Labour Charges for Market Fish\r\n', '', '', 0, 35, 727),
(1808, '2024-02-16', 'Dr-Feb 24/280', '6100/002', '55000', '0', '941500', 'Ice 5 pcs purchase for Market Fish\r\n', '', '', 0, 37, 728),
(1809, '2024-02-16', 'Dr-Feb 24/280', '3600/001', '0', '55000', '203846264.75', 'Ice 5 pcs purchase for Market Fish\r\n', '', '', 0, 35, 729),
(1890, '2024-02-18', 'Dr-Feb 24/281', '9100/016', '25400', '0', '319700', 'Ledger 6 pcs purchase for (office)\r\n', '', '', 0, 39, 732),
(1891, '2024-02-18', 'Dr-Feb 24/281', '3600/001', '0', '25400', '203820864.75', 'Ledger 6 pcs purchase for (office)\r\n', '', '', 0, 35, 733),
(1892, '2024-02-18', 'Dr-Feb 24/282', '9100/018', '47300', '0', '240300', 'Meter Bill for Wai Pon La office -500/ Sir house-46800 (Jan/2024)\r\n', '', '', 0, 39, 734),
(1893, '2024-02-18', 'Dr-Feb 24/282', '3600/001', '0', '47300', '203773564.75', 'Meter Bill for Wai Pon La office -500/ Sir house-46800 (Jan/2024)\r\n', '', '', 0, 35, 735),
(1894, '2024-02-18', 'Dr-Feb 24/283', '9100/018', '132670', '0', '372970', 'Meter Bill for WH (Jan/2024)\r\n', '', '', 0, 39, 736),
(1895, '2024-02-18', 'Dr-Feb 24/283', '3600/001', '0', '132670', '203640894.75', 'Meter Bill for WH (Jan/2024)\r\n', '', '', 0, 35, 737),
(1896, '2024-02-18', 'Dr-Feb 24/284', '9100/009', '7000', '0', '13900', 'Meter service and Bank charges for WH\r\n', '', '', 0, 39, 738),
(1897, '2024-02-18', 'Dr-Feb 24/284', '3600/001', '0', '7000', '203633894.75', 'Meter service and Bank charges for WH\r\n', '', '', 0, 35, 739),
(1898, '2024-02-18', 'Dr-Feb 24/285', '9100/023', '15000', '0', '15000', 'Maintenance for Sir house (Feb/2024)\r\n', '', '', 0, 39, 740),
(1899, '2024-02-18', 'Dr-Feb 24/285', '3600/001', '0', '15000', '203618894.75', 'Maintenance for Sir house (Feb/2024)\r\n', '', '', 0, 35, 741),
(1900, '2024-02-18', 'Dr-Feb 24/286', '9100/002', '3500', '0', '688500', 'Taxi Charges for WH to Wai Pon La to WH\r\n', '', '', 0, 39, 742),
(1901, '2024-02-18', 'Dr-Feb 24/286', '3600/001', '0', '3500', '203615394.75', 'Taxi Charges for WH to Wai Pon La to WH\r\n', '', '', 0, 35, 743),
(1902, '2024-02-18', 'Dr-Feb 24/287', '9100/017', '1330000', '0', '1430000', 'Sir take from Daw Nan No 1, 30000/ No 2, 300000/ No 3, 10 -Lakh\r\n', '', '', 0, 39, 744),
(1903, '2024-02-18', 'Dr-Feb 24/287', '3600/001', '0', '1330000', '202285394.75', 'Sir take from Daw Nan No 1, 30000/ No 2, 300000/ No 3, 10 -Lakh\r\n', '', '', 0, 35, 745),
(1904, '2024-02-18', 'Dr-Feb 24/288', '6100/001', '21000', '0', '1498250', 'Labour Charges for Ocean Rohu and (Raw)\r\n', '', '', 0, 37, 746),
(1905, '2024-02-18', 'Dr-Feb 24/288', '3600/001', '0', '21000', '202264394.75', 'Labour Charges for Ocean Rohu and (Raw)\r\n', '', '', 0, 35, 747),
(1906, '2024-02-18', 'Dr-Feb 24/289', '9100/002', '15000', '0', '703500', 'Taxi Charges WH to Ocean for Sticker\r\n', '', '', 0, 39, 748),
(1907, '2024-02-18', 'Dr-Feb 24/289', '3600/001', '0', '15000', '202249394.75', 'Taxi Charges WH to Ocean for Sticker\r\n', '', '', 0, 35, 749),
(1908, '2024-02-18', 'Dr-Feb 24/290', '6100/002', '78000', '0', '1019500', 'Ice purchase for Ocean (Pk) (15.2)-9000/ (17.2)-69000\r\n', '', '', 0, 37, 750),
(1909, '2024-02-18', 'Dr-Feb 24/290', '3600/001', '0', '78000', '202171394.75', 'Ice purchase for Ocean (Pk) (15.2)-9000/ (17.2)-69000\r\n', '', '', 0, 35, 751),
(1910, '2024-02-18', 'Dr-Feb 24/291', '9100/015', '206000', '0', '725600', 'Wedding present for (17.2)\r\n', '', '', 0, 39, 752),
(1911, '2024-02-18', 'Dr-Feb 24/291', '3600/001', '0', '206000', '201965394.75', 'Wedding present for (17.2)\r\n', '', '', 0, 35, 753),
(1912, '2024-02-18', 'Dr-Feb 24/292', '6100/003', '840000', '0', '22004450', 'Penam Bag purchase and Carry for WH (824000+16000)\r\n', '', '', 0, 37, 754),
(1913, '2024-02-18', 'Dr-Feb 24/292', '3600/001', '0', '840000', '201125394.75', 'Penam Bag purchase and Carry for WH (824000+16000)\r\n', '', '', 0, 35, 755),
(1914, '2024-02-18', 'Dr-Feb 24/293', '9100/016', '125100', '0', '444800', 'Photo Sticker/Pen/Caculator purchase for WH\r\n', '', '', 0, 39, 756),
(1915, '2024-02-18', 'Dr-Feb 24/293', '3600/001', '0', '125100', '201000294.75', 'Photo Sticker/Pen/Caculator purchase for WH\r\n', '', '', 0, 35, 757),
(1916, '2024-02-18', 'Dr-Feb 24/294', '6100/006', '2116280', '0', '9827100', 'Sticker purchase from 5 colour  Voucher 3 pcs\r\n', '', '', 0, 37, 758),
(1917, '2024-02-18', 'Dr-Feb 24/294', '3600/001', '0', '2116280', '198884014.75', 'Sticker purchase from 5 colour  Voucher 3 pcs\r\n', '', '', 0, 35, 759),
(1918, '2024-02-18', 'Dr-Feb 24/295', '6100/003', '1320000', '0', '23324450', 'Paid to Plastic (G/F) for (15.2.24)\r\n', '', '', 0, 37, 760),
(1919, '2024-02-18', 'Dr-Feb 24/295', '3600/001', '0', '1320000', '197564014.75', 'Paid to Plastic (G/F) for (15.2.24)\r\n', '', '', 0, 35, 761),
(1920, '2024-02-18', 'Dr-Feb 24/296', '9100/006', '100000', '0', '1285000', 'Car Diesel for 6J-3015 (17.2)-50000/ (18.2)-50000\r\n', '', '', 0, 39, 762),
(1921, '2024-02-18', 'Dr-Feb 24/296', '3600/001', '0', '100000', '197464014.75', 'Car Diesel for 6J-3015 (17.2)-50000/ (18.2)-50000\r\n', '', '', 0, 35, 763),
(1922, '2024-02-18', 'Dr-Feb 24/297', '9100/011', '1000000', '0', '13808500', 'Donation for (15.2.24) Mingalar Charity\r\n', '', '', 0, 39, 764),
(1923, '2024-02-18', 'Dr-Feb 24/297', '3600/001', '0', '1000000', '196464014.75', 'Donation for (15.2.24) Mingalar Charity\r\n', '', '', 0, 35, 765),
(1924, '2024-02-18', 'Dr-Feb 24/298', '6100/007', '7000000', '0', '38125482', 'Paid to Ocean Pacific Cold Store\r\n', '', '', 0, 37, 766),
(1925, '2024-02-18', 'Dr-Feb 24/298', '3600/001', '0', '7000000', '189464014.75', 'Paid to Ocean Pacific Cold Store\r\n', '', '', 0, 35, 767),
(1926, '2024-02-18', 'Dr-Feb 24/299', '9100/002', '20000', '0', '723500', 'Taxi Charges for WH to GFC\r\n', '', '', 0, 39, 768),
(1927, '2024-02-18', 'Dr-Feb 24/299', '3600/001', '0', '20000', '189444014.75', 'Taxi Charges for WH to GFC\r\n', '', '', 0, 35, 769),
(1928, '2024-02-18', 'Dr-Feb 24/300', '6100/001', '86000', '0', '1584250', 'Labour Charges for GFC R.P\r\n', '', '', 0, 37, 770),
(1929, '2024-02-18', 'Dr-Feb 24/300', '3600/001', '0', '86000', '189358014.75', 'Labour Charges for GFC R.P\r\n', '', '', 0, 35, 771),
(1944, '2024-02-26', '11418', '4000/k08', '', '4809400', '10390600', '', '', '', 0, 0, 0),
(1945, '2024-02-26', '11419', '4000/k09', '', '7794900', '2595700', '', '', '', 0, 0, 0),
(1946, '2024-02-26', '11420', '4000/Z03', '', '10325900', '-7730200', '', '', '', 0, 0, 0),
(1947, '2024-02-26', '11421', '4000/Y01', '', '804600', '-6925600', '', '', '', 0, 0, 0),
(1948, '2024-02-26', '11422', '4000/T11', '', '3253250', '-3672350', '', '', '', 0, 0, 0),
(1949, '2024-02-26', '11423', '4000/S04', '', '6979500', '-10651850', '', '', '', 0, 0, 0),
(1950, '2024-02-26', '11424', '4000/T07', '', '5454450', '-16106300', '', '', '', 0, 0, 0),
(1951, '2024-02-27', '11427', '4000/T05', '', '23970080', '-40076380', '', '', '', 0, 0, 0),
(1952, '2024-02-27', '11429', '4000/S03', '', '11393590', '-51469970', '', '', '', 0, 0, 0),
(1953, '2024-02-27', '11430', '4000/Z03', '', '16376000', '-67845970', '', '', '', 0, 0, 0),
(1954, '2024-02-27', '11431', '4000/T02', '', '7423250', '-75269220', '', '', '', 0, 0, 0),
(1955, '2024-02-27', '11432', '4000/001', '', '3181750', '-72087470', '', '', '', 0, 0, 0),
(1956, '2024-02-28', '11433', '4000/G02', '', '3092025', '-75179495', '', '', '', 0, 0, 0),
(1957, '2024-02-28', '11434', '4000/K09', '', '6315300', '-81494795', '', '', '', 0, 0, 0),
(1958, '2024-02-28', '11435', '4000/T12', '', '8525400', '-90020195', '', '', '', 0, 0, 0),
(1959, '2024-02-28', '11436', '4000/T11', '', '3861000', '-86159195', '', '', '', 0, 0, 0),
(1960, '2024-02-28', '11437', '4000/T07', '', '5008000', '-91167195', '', '', '', 0, 0, 0),
(1961, '2024-02-28', '11438', '4000/T05', '', '15508370', '-106675565', '', '', '', 0, 0, 0),
(1962, '2024-02-28', '11439', '4000/Z03', '', '10347350', '-117022915', '', '', '', 0, 0, 0),
(1963, '2024-02-28', '11440', '4000/K08', '', '10652900', '-127675815', '', '', '', 0, 0, 0),
(1964, '2024-02-28', '11441', '4000/B01', '', '16706600', '-144382415', '', '', '', 0, 0, 0),
(1965, '2024-02-29', '11442', '4000/P01', '', '1431300', '-145813715', '', '', '', 0, 0, 0),
(1966, '2024-02-29', '11443', '4000/W01', '', '1754500', '-144059215', '', '', '', 0, 0, 0),
(1967, '2024-02-29', '11444', '4000/T05', '', '37073950', '-181133165', '', '', '', 0, 0, 0),
(1968, '2024-02-29', '11445', '4000/S03', '', '38565200', '-219698365', '', '', '', 0, 0, 0),
(1983, '2024-02-19', 'Dr-Feb 24/301', '9100/020', '10000000', '0', '14300000', 'Paid to Ko Aung Myat Zaw 2 % and Adv for Can 3/24 and 4/24, USA 2/24 and 3/24', '', '', 0, 39, 794),
(1984, '2024-02-19', 'Dr-Feb 24/301', '3600/001', '0', '10000000', '179358014.75', 'Paid to Ko Aung Myat Zaw 2 % and Adv for Can 3/24 and 4/24, USA 2/24 and 3/24', '', '', 0, 35, 795),
(1985, '2024-02-19', 'Dr-Feb 24/302', '9100/021', '600000', '0', '900000', 'DOF Charges for Can 3/24 and 4/24, USA 2/24 and 3/24', '', '', 0, 39, 796),
(1986, '2024-02-19', 'Dr-Feb 24/302', '3600/001', '0', '600000', '178758014.75', 'DOF Charges for Can 3/24 and 4/24, USA 2/24 and 3/24', '', '', 0, 35, 797),
(1987, '2024-02-19', 'Dr-Feb 24/303', '9100/022', '800000', '0', '1200000', 'Paid to Ocean Pacific for MMk Can 3/24 and 4/24, USA 2/24 and 3/24 Laoding', '', '', 0, 39, 798),
(1988, '2024-02-19', 'Dr-Feb 24/303', '3600/001', '0', '800000', '177958014.75', 'Paid to Ocean Pacific for MMk Can 3/24 and 4/24, USA 2/24 and 3/24 Laoding', '', '', 0, 35, 799),
(1989, '2024-02-19', 'Dr-Feb 24/304', '6100/006', '3721000', '0', '13548100', 'Paid to Sticker 5 colour', '', '', 0, 37, 800),
(1990, '2024-02-19', 'Dr-Feb 24/304', '3600/001', '0', '3721000', '174237014.75', 'Paid to Sticker 5 colour', '', '', 0, 35, 801),
(1991, '2024-02-19', 'Dr-Feb 24/305', '9100/002', '16000', '0', '739500', 'Taxi Charges WH to Insein to WH for Office 2 pcs Meeting', '', '', 0, 39, 802),
(1992, '2024-02-19', 'Dr-Feb 24/305', '3600/001', '0', '16000', '174221014.75', 'Taxi Charges WH to Insein to WH for Office 2 pcs Meeting', '', '', 0, 35, 803),
(1993, '2024-02-19', 'Dr-Feb 24/306', '6100/005', '1000000', '0', '1200000', 'HHK to GFC MC carry for 2 Trucks *400000/ 1 Truck *200000', '', '', 0, 37, 804),
(1994, '2024-02-19', 'Dr-Feb 24/306', '3600/001', '0', '1000000', '173221014.75', 'HHK to GFC MC carry for 2 Trucks *400000/ 1 Truck *200000', '', '', 0, 35, 805),
(1995, '2024-02-19', 'Dr-Feb 24/307', '9100/002', '7500', '0', '747000', 'Taxi Charges for Thuzar (16.17.18) Ocean (OT)', '', '', 0, 39, 806),
(1996, '2024-02-19', 'Dr-Feb 24/307', '3600/001', '0', '7500', '173213514.75', 'Taxi Charges for Thuzar (16.17.18) Ocean (OT)', '', '', 0, 35, 807),
(1997, '2024-02-19', 'Dr-Feb 24/308', '9100/012', '26000', '0', '347350', 'Workers 13 pcs Dinner for Ocean (OT) 13*2000 ks', '', '', 0, 39, 808),
(1998, '2024-02-19', 'Dr-Feb 24/308', '3600/001', '0', '26000', '173187514.75', 'Workers 13 pcs Dinner for Ocean (OT) 13*2000 ks', '', '', 0, 35, 809),
(1999, '2024-02-19', 'Dr-Feb 24/309', '9100/006', '50000', '0', '1335000', 'Car Diesel for 6J-3015', '', '', 0, 39, 810),
(2000, '2024-02-19', 'Dr-Feb 24/309', '3600/001', '0', '50000', '173137514.75', 'Car Diesel for 6J-3015', '', '', 0, 35, 811),
(2001, '2024-02-19', 'Dr-Feb 24/310', '9100/002', '4000', '0', '751000', 'Taxi Charges Car Driver for (19.2) 9:30 PM', '', '', 0, 39, 812),
(2002, '2024-02-19', 'Dr-Feb 24/310', '3600/001', '0', '4000', '173133514.75', 'Taxi Charges Car Driver for (19.2) 9:30 PM', '', '', 0, 35, 813),
(2003, '2024-02-19', 'Dr-Feb 24/311', '9100/002', '40000', '0', '791000', 'Taxi Charges for WH to GFC for 2 Trucks (R.P) change', '', '', 0, 39, 814),
(2004, '2024-02-19', 'Dr-Feb 24/311', '3600/001', '0', '40000', '173093514.75', 'Taxi Charges for WH to GFC for 2 Trucks (R.P) change', '', '', 0, 35, 815);
INSERT INTO `general_ledger` (`id`, `date`, `voucherno`, `ac_code`, `debit`, `credit`, `balance`, `narration`, `sr_no`, `container_no`, `bank_charges`, `acid`, `transactionid`) VALUES
(2005, '2024-02-19', 'Dr-Feb 24/312', '6100/001', '86000', '0', '1670250', 'Labour 5 pcs and Taxi Charges for GFC (R.P) (56000+30000)', '', '', 0, 37, 816),
(2006, '2024-02-19', 'Dr-Feb 24/312', '3600/001', '0', '86000', '173007514.75', 'Labour 5 pcs and Taxi Charges for GFC (R.P) (56000+30000)', '', '', 0, 35, 817),
(2007, '2024-02-20', 'Cr-Feb 24/009', '9100/017', '0', '670000', '760000', 'Sir Return paid to Daw Nan (1300000-630000=670000)', '', '', 0, 39, 818),
(2008, '2024-02-20', 'Cr-Feb 24/009', '3600/001', '670000', '0', '173677514.75', 'Sir Return paid to Daw Nan (1300000-630000=670000)', '', '', 0, 35, 819),
(2009, '2024-02-20', 'Cr-Feb 24/010', '3300/001', '0', '87528227', '2400473', 'Loan Return from Best Brand (Bejon) transfer to UAB (Actual $25176*3480ks=87612480-8758227=Bank Chg;8753+Different 75500)', '', '', 0, 35, 820),
(2010, '2024-02-20', 'Cr-Feb 24/010', '3600/001', '87528227', '0', '261205741.75', 'Loan Return from Best Brand (Bejon) transfer to UAB (Actual $25176*3480ks=87612480-8758227=Bank Chg;8753+Different 75500)', '', '', 0, 35, 821),
(2011, '2024-02-20', 'Dr-Feb 24/313', '6100/002', '27000', '0', '1046500', 'Ice 3 pcs purchase for WH', '', '', 0, 37, 822),
(2012, '2024-02-20', 'Dr-Feb 24/313', '3600/001', '0', '27000', '261178741.75', 'Ice 3 pcs purchase for WH', '', '', 0, 35, 823),
(2013, '2024-02-20', 'Dr-Feb 24/314', '6100/001', '18000', '0', '1688250', 'Worker 9 pcs (OT) from Ocean Pacific', '', '', 0, 37, 824),
(2014, '2024-02-20', 'Dr-Feb 24/314', '3600/001', '0', '18000', '261160741.75', 'Worker 9 pcs (OT) from Ocean Pacific', '', '', 0, 35, 825),
(2015, '2024-02-20', 'Dr-Feb 24/315', '9100/003', '2700', '0', '32400', 'Water Purchase for WH', '', '', 0, 39, 826),
(2016, '2024-02-20', 'Dr-Feb 24/315', '3600/001', '0', '2700', '261158041.75', 'Water Purchase for WH', '', '', 0, 35, 827),
(2017, '2024-02-20', 'Dr-Feb 24/316', '9100/002', '40000', '0', '831000', 'Car Charges for WH to GFC for Material Carry', '', '', 0, 39, 828),
(2018, '2024-02-20', 'Dr-Feb 24/316', '3600/001', '0', '40000', '261118041.75', 'Car Charges for WH to GFC for Material Carry', '', '', 0, 35, 829),
(2019, '2024-02-20', 'Dr-Feb 24/317', '9100/002', '16000', '0', '847000', 'Taxi Charges for WH to DOF office Meeting go', '', '', 0, 39, 830),
(2020, '2024-02-20', 'Dr-Feb 24/317', '3600/001', '0', '16000', '261102041.75', 'Taxi Charges for WH to DOF office Meeting go', '', '', 0, 35, 831),
(2021, '2024-02-20', 'Dr-Feb 24/318', '9100/016', '2000', '0', '446800', 'Document Copy Charges from DOF office', '', '', 0, 39, 832),
(2022, '2024-02-20', 'Dr-Feb 24/318', '3600/001', '0', '2000', '261100041.75', 'Document Copy Charges from DOF office', '', '', 0, 35, 833),
(2023, '2024-02-20', 'Dr-Feb 24/319', '6100/003', '582100', '0', '23906550', 'Penan Bag-345 ks and Other purchase and Taxi for WH', '', '', 0, 37, 834),
(2024, '2024-02-20', 'Dr-Feb 24/319', '3600/001', '0', '582100', '260517941.75', 'Penan Bag-345 ks and Other purchase and Taxi for WH', '', '', 0, 35, 835),
(2025, '2024-02-20', 'Dr-Feb 24/320', '9100/004', '2000', '0', '187175', 'Phone Bill for Office', '', '', 0, 39, 836),
(2026, '2024-02-20', 'Dr-Feb 24/320', '3600/001', '0', '2000', '260515941.75', 'Phone Bill for Office', '', '', 0, 35, 837),
(2027, '2024-02-20', 'Dr-Feb 24/321', '4000/T02', '4000000', '0', '-71269220', 'Paid to Thein Htay for Vr No-11359,11366 (Cheque No-052406)', '', '', 0, 40, 838),
(2028, '2024-02-20', 'Dr-Feb 24/321', '3600/001', '0', '4000000', '256515941.75', 'Paid to Thein Htay for Vr No-11359,11366 (Cheque No-052406)', '', '', 0, 35, 839),
(2029, '2024-02-20', 'Dr-Feb 24/322', '4000/H02', '3000000', '0', '6000000', 'Paid to Htay Win for Vr No-11010,11011,11060 (Cheque No-052407)', '', '', 0, 40, 840),
(2030, '2024-02-20', 'Dr-Feb 24/322', '3600/001', '0', '3000000', '253515941.75', 'Paid to Htay Win for Vr No-11010,11011,11060 (Cheque No-052407)', '', '', 0, 35, 841),
(2031, '2024-02-20', 'Dr-Feb 24/323', '4000/Z03', '10000000', '0', '-107022915', 'Paid to Zaw Myat Thu for Vr No-11361,11376 (Cheque No-052408)', '', '', 0, 40, 842),
(2032, '2024-02-20', 'Dr-Feb 24/323', '3600/001', '0', '10000000', '243515941.75', 'Paid to Zaw Myat Thu for Vr No-11361,11376 (Cheque No-052408)', '', '', 0, 35, 843),
(2033, '2024-02-20', 'Dr-Feb 24/324', '6100/003', '3000000', '0', '26906550', 'Paid to Plastic (G/F) for 16.2.24/17.2.24-165000/17.2.24-343500', '', '', 0, 37, 844),
(2034, '2024-02-20', 'Dr-Feb 24/324', '3600/001', '0', '3000000', '240515941.75', 'Paid to Plastic (G/F) for 16.2.24/17.2.24-165000/17.2.24-343500', '', '', 0, 35, 845),
(2035, '2024-02-20', 'Dr-Feb 24/325', '9100/002', '24000', '0', '871000', 'Taxi Charges for WH to Market go 18.2.24/20.2.24', '', '', 0, 39, 846),
(2036, '2024-02-20', 'Dr-Feb 24/325', '3600/001', '0', '24000', '240491941.75', 'Taxi Charges for WH to Market go 18.2.24/20.2.24', '', '', 0, 35, 847),
(2037, '2024-02-20', 'Dr-Feb 24/326', '9100/012', '11000', '0', '358350', 'Meal allowance for Market Boys', '', '', 0, 39, 848),
(2038, '2024-02-20', 'Dr-Feb 24/326', '3600/001', '0', '11000', '240480941.75', 'Meal allowance for Market Boys', '', '', 0, 35, 849),
(2039, '2024-02-20', 'Dr-Feb 24/327', '6100/001', '6000', '0', '1694250', 'Labour Charges for Market Fish', '', '', 0, 37, 850),
(2040, '2024-02-20', 'Dr-Feb 24/327', '3600/001', '0', '6000', '240474941.75', 'Labour Charges for Market Fish', '', '', 0, 35, 851),
(2041, '2024-02-20', 'Dr-Feb 24/328', '6100/002', '22000', '0', '1068500', 'Ice 2 pcs purchase for Market Fish', '', '', 0, 37, 852),
(2042, '2024-02-20', 'Dr-Feb 24/328', '3600/001', '0', '22000', '240452941.75', 'Ice 2 pcs purchase for Market Fish', '', '', 0, 35, 853),
(2043, '2024-02-20', 'Dr-Feb 24/329', '6100/001', '4000', '0', '1698250', 'Labour Charges for Market Fish 18.2.24/20.2.24', '', '', 0, 37, 854),
(2044, '2024-02-20', 'Dr-Feb 24/329', '3600/001', '0', '4000', '240448941.75', 'Labour Charges for Market Fish 18.2.24/20.2.24', '', '', 0, 35, 855),
(2045, '2024-03-26', '11356', '4000/A01', '', '700000', '-107722915', '', '', '', 0, 0, 0),
(2046, '2024-02-19', 'JJJJJ', '6100/001', '1000000', '0', '2698250', 'sfgdhjkl', '', '', 0, 37, 856),
(2047, '2024-02-19', 'JJJJJ', '3600/001', '0', '1000000', '239448941.75', 'asdfasdf', '', '', 0, 35, 857);

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
  `remark` text NOT NULL,
  `fish_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hhkmcstock`
--

INSERT INTO `hhkmcstock` (`id`, `country`, `particular`, `date`, `commondity_id`, `size`, `kg`, `mc`, `balance_mc`, `loosein_size`, `loosein_kg`, `loosein_pcs`, `looseout_size`, `looseout_kg`, `looseout_pcs`, `remark`, `fish_type`) VALUES
(51, 'Can', 'balance (F-10)', '2024-02-23', '1017', '2up', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(52, 'Can', 'balance (F-10)', '2024-02-23', '1017', '2up', '21', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(53, 'Can', 'balance (F-10)', '2024-02-23', '1017', '3up', '21', 12, 12, '', '', 0, '', '', 0, '', 'G'),
(54, 'Can', 'balance (F-10)', '2024-02-23', '1017', '3up', '22', 7, 7, '', '', 0, '', '', 0, '', 'G'),
(55, 'Can', 'balance (F-10)', '2024-02-23', '1017', '4up', '22', 3, 3, '', '', 0, '', '', 0, '', 'G'),
(56, 'Can', 'balance (F-10)', '2024-02-23', '1017', '4up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(57, 'Can', 'balance (F-10)', '2024-02-23', '1031', '2up', '20', 73, 73, '', '', 0, '', '', 0, '', 'G'),
(58, 'Can', 'balance (F-10)', '2024-02-23', '1031', '3up', '20', 6, 6, '', '', 0, '', '', 0, '', 'G'),
(59, 'Can', 'balance (F-10)', '2024-02-23', '1031', '3up', '21', 32, 32, '', '', 0, '', '', 0, '', 'G'),
(60, 'Can', 'balance (F-10)', '2024-02-23', '1031', '3up', '22', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(61, 'Can', 'balance (F-10)', '2024-02-23', '1031', '4up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(62, 'Can', 'balance (F-10)', '2024-02-24', '1023', '2up', '20', 46, 46, '', '', 0, '', '', 0, '', 'G'),
(63, 'Can', 'balance (F-10)', '2024-02-24', '1023', '2up', '21', 10, 10, '', '', 0, '', '', 0, '', 'G'),
(64, 'Can', 'balance (F-10)', '2024-02-24', '1023', '3up', '20', 4, 4, '', '', 0, '', '', 0, '', 'G'),
(65, 'Can', 'balance (F-10)', '2024-02-24', '1023', '3up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(66, 'Can', 'balance (F-10)', '2024-02-24', '1023', '4up', '24', 7, 7, '', '', 0, '', '', 0, '', 'G'),
(67, 'Can', 'balance (F-10)', '2024-02-24', '1023', '5up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(68, 'Can', 'balance (F-10)', '2024-02-24', '1023', '6up', '19', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(69, 'Can', 'balance (F-10)', '2024-02-24', '1023', '7up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(70, 'Can', 'balance (F-10)', '2024-02-24', '1023', '7up', '24', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(71, 'Can', 'balance (F-10)', '2024-02-28', '1020', '2up', '20', 33, 33, '', '', 0, '', '', 0, '', 'G'),
(72, 'Can', 'balance (F-10)', '2024-02-28', '1020', '2up', '21', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(73, 'Can', 'balance (F-10)', '2024-02-28', '1020', '3up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(74, 'Can', 'balance (F-10)', '2024-02-28', '1020', '3up', '22', 5, 5, '', '', 0, '', '', 0, '', 'G'),
(75, 'Can', 'balance (F-10)', '2024-02-28', '1020', '3up', '23', 3, 3, '', '', 0, '', '', 0, '', 'G'),
(76, 'Can', 'balance (F-10)', '2024-02-28', '1020', '4up', '23', 3, 3, '', '', 0, '', '', 0, '', 'G'),
(77, 'Can', 'balance (F-10)', '2024-02-28', '1020', '4up', '24', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(78, 'Can', 'balance (F-10)', '2024-02-28', '1020', '5up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(79, 'Can', 'balance (F-10)', '2024-02-28', '1020', '5up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(80, 'Can', 'balance (F-10)', '2024-02-28', '1020', '6up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(81, 'Can', 'balance (F-10)', '2024-02-28', '1020', '7up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(82, 'Can', 'balance (F-10)', '2024-02-28', '1020', '7up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(83, 'Can', 'balance (F-10)', '2024-02-28', '1020', '7up', '24', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(84, 'Can', 'balance (F-10)', '2024-02-28', '1020', '8up', '25', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(85, 'Can', 'balance (F-10)', '2024-02-28', '1020', '9up', '19', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(86, 'Can', 'balance (F-10)', '2024-02-28', '1020', '9up', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(87, 'Can', 'balance (F-10)', '2024-02-28', '1020', '10up', '21', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(88, 'Can', 'balance (F-10)', '2024-02-28', '1020', '10up', '22', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(89, 'Can', 'balance (F-10) ', '2024-02-28', '1020', '12up', '25', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(90, 'Can', 'balance (F-10)  ', '2024-02-28', '1020', '12up', '27.5', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(91, 'Can', 'balance (F-10)', '2024-02-28', '1030', '1.5up', '20', 4, 4, '', '', 0, '', '', 0, '', 'G'),
(92, 'Can', 'balance (F-10) ', '2024-02-28', '1030', '2up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(93, 'Can', 'balance (F-10) ', '2024-02-29', '1030', '1.5up', '20', 3, 7, '', '', 0, '', '', 0, '', 'G'),
(94, 'Can', 'balance (F-10) ', '2024-02-29', '1030', '1.5up', '21', 3, 3, '', '', 0, '', '', 0, '', 'G'),
(95, 'Can', 'balance (F-10) ', '2024-02-29', '1030', '2up', '20', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(96, 'Can', 'balance (F-10)', '2024-02-29', '1029', '1up', '20', 24, 24, '', '', 0, '', '', 0, '', 'G'),
(97, 'Can', 'balance (F-10)', '2024-02-29', '1029', '1.4up', '20', 12, 12, '', '', 0, '', '', 0, '', 'G'),
(98, 'Can', 'balance (F-10)', '2024-02-29', '1029', '1.4up', '21', 6, 6, '', '', 0, '', '', 0, '', 'G'),
(99, 'Can', 'balance (F-10)', '2024-02-29', '1036', '1up', '20', 23, 23, '', '', 0, '', '', 0, '', 'G'),
(100, 'Can', 'balance (F-10)', '2024-02-29', '1036', '1.5up', '20', 8, 8, '', '', 0, '', '', 0, '', 'G'),
(104, 'Can', 'balance (F-10)', '2024-02-29', '1001', '800', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(105, 'Can', 'balance (F-10)', '2024-02-29', '1001', '1up', '20', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(106, 'Can', 'balance (F-10)', '2024-02-29', '1001', '1.5up', '20', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(107, 'Can', 'balance (F-10)', '2024-02-29', '1001', '3up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(108, 'Can', 'balance (F-10)', '2024-02-29', '1001', '3up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(109, 'Can', 'balance (F-10)', '2024-02-29', '1001', '4up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(110, 'Can', 'balance (F-10)', '2024-02-29', '1001', '5up', '22.5', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(111, 'Can', 'balance (F-10)', '2024-02-29', '1001', '7up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(112, 'Can', 'balance (F-10)', '2024-02-08', '1001', '500 * 12 by', '6', 27, 27, '', '', 0, '', '', 0, '', 'Cut_piece'),
(113, 'Can', 'balance (F-10)', '2024-02-29', '1002', '1up', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(114, 'Can', 'balance (F-10)', '2024-02-29', '1002', '1.5up', '20', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(115, 'Can', 'balance (F-10)', '2024-02-29', '1002', '3up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(116, 'Can', 'balance (F-10)', '2024-02-29', '1002', '4up', '23', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(117, 'Can', 'balance (F-10)', '2024-02-29', '1001', '7up', '23', 1, 2, '', '', 0, '', '', 0, '', 'G'),
(118, 'Can', 'balance (F-10)', '2024-02-28', '1002', '500 * 12 by', '6', 5, 5, '', '', 0, '', '', 0, '', 'Cut_piece');

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

--
-- Dumping data for table `hhkstock`
--

INSERT INTO `hhkstock` (`id`, `indate`, `outdate`, `commondity_id`, `mc`, `total_mc`, `kg`, `total_kg`, `balance`, `balance_kg`, `balance_mc`, `link_id`) VALUES
(27, '2024-03-05', '0000-00-00', '1', 0, 0, '848.6', '848.6', '848.6', '848.6', 0, 0),
(28, '2024-03-06', '0000-00-00', '1', 146, 146, '3229.9', '4078.5', '4927.1', '3229.9', 146, 0),
(29, '2024-12-18', '0000-00-00', '2', 0, 0, '237.0', '237.0', '331.8', '331.8', 21, 0),
(30, '2024-03-08', '0000-00-00', '1', 28, 174, '642.7', '4721.2', '9648.3', '642.7', 28, 0),
(31, '2024-03-09', '0000-00-00', '1', 400, 574, '8682.8', '13404', '23052.3', '8682.8', 400, 0),
(32, '2024-03-13', '0000-00-00', '1', 78, 652, '1596.0', '15000', '38052.3', '1596.0', 78, 0),
(33, '2024-03-13', '0000-00-00', '1', 191, 843, '4136.6', '19136.6', '57188.9', '4136.6', 191, 0),
(34, '2024-03-15', '0000-00-00', '1', 66, 909, '1383.7', '20520.3', '77709.2', '1383.7', 66, 0),
(35, '2024-03-19', '0000-00-00', '2', 15, 15, '295', '532', '884.6', '221.0', 14, 0),
(36, '2024-03-12', '0000-00-00', '3', 54, 54, '388', '388', '388', '388', 54, 0),
(37, '2024-03-09', '0000-00-00', '3', 14, 68, '294.2', '682.2', '1070.2', '294.2', 14, 0),
(38, '2024-12-20', '0000-00-00', '2', 0, 15, '34.9', '566.9', '1451.5', '34.9', 0, 0),
(39, '2024-12-21', '0000-00-00', '2', 0, 15, '13.1', '580', '2031.5', '13.1', 0, 0),
(40, '2024-12-23', '0000-00-00', '2', 6, 21, '138.5', '718.5', '2750', '138.5', 6, 0),
(41, '2024-12-26', '0000-00-00', '2', 0, 21, '3.6', '722.1', '3472.1', '3.6', 0, 0),
(42, '2024-12-28', '0000-00-00', '2', 6, 27, '102.9', '825', '4297.1', '102.9', 6, 0),
(43, '2024-12-30', '0000-00-00', '2', 3, 30, '57.3', '882.3', '5179.4', '57.3', 3, 0),
(44, '2024-01-01', '0000-00-00', '2', 4, 34, '75.6', '957.9', '6137.3', '75.6', 4, 0),
(46, '0024-01-02', '0000-00-00', '2', 13, 47, '232.1', '1190', '8436.4', '232.1', 13, 0),
(47, '2024-01-05', '0000-00-00', '2', 5, 52, '129.8', '1319.8', '9831.8', '129.8', 5, 0),
(48, '2024-01-08', '0000-00-00', '2', 1, 53, '15', '1334.8', '11242.8', '15.6', 1, 0),
(49, '2024-01-12', '0000-00-00', '2', 1, 54, '15.6', '1350.4', '12670.6', '16.8', 1, 0),
(50, '2024-01-15', '0000-00-00', '2', 1, 55, '16.8', '1367.2', '14113.4', '15.0', 1, 0),
(51, '2024-01-23', '0000-00-00', '2', 1, 56, '15', '1382.2', '15571.2', '15.0', 1, 0),
(52, '2024-03-04', '0000-00-00', '2', 9, 65, '180.5', '1562.7', '17133.9', '180.5', 9, 0);

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
(1039, 'Puti (G)');

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
(124, '2024-02-04', '4000/T02', '11359', 1056000, '0000-00-00', '', '', 0, 1056000, 72, 0, '0000-00-00'),
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
(152, '2024-02-07', '4000/T02', '11366', 1949200, '0000-00-00', '', '', 0, 8327200, 100, 0, '0000-00-00'),
(153, '2024-02-07', '4000/T02', '11366', 1536800, '0000-00-00', '', '', 0, 9864000, 101, 0, '0000-00-00'),
(154, '2024-02-07', '4000/T02', '11366', 1277100, '0000-00-00', '', '', 0, 11141100, 102, 0, '0000-00-00'),
(155, '2024-02-07', '4000/T02', '11366', 1156800, '0000-00-00', '', '', 0, 12293100, 103, 0, '0000-00-00'),
(156, '2024-02-07', '4000/T02', '11366', 2543200, '0000-00-00', '', '', 0, 14836300, 104, 0, '0000-00-00'),
(157, '2024-02-07', '4000/T02', '11366', 1472000, '0000-00-00', '', '', 0, 16308300, 105, 0, '0000-00-00'),
(158, '2024-02-07', '4000/T02', '11366', 72450, '0000-00-00', '', '', 0, 16380750, 106, 0, '0000-00-00'),
(159, '2024-02-07', '4000/T07', '11367', 1766100, '0000-00-00', '', '', 0, 7646180, 107, 0, '0000-00-00'),
(160, '2024-02-07', '4000/T07', '11367', 600600, '0000-00-00', '', '', 0, 8246780, 108, 0, '0000-00-00'),
(161, '2024-02-07', '4000/T07', '11367', 908950, '0000-00-00', '', '', 0, 9155730, 109, 0, '0000-00-00'),
(162, '2024-02-08', '4000/T07', '11368', 1254775, '0000-00-00', '', '', 0, 10410505, 110, 0, '0000-00-00'),
(163, '2024-02-08', '4000/T07', '11368', 216300, '0000-00-00', '', '', 0, 10626805, 111, 0, '0000-00-00'),
(164, '2024-02-08', '4000/T07', '11368', 637650, '0000-00-00', '', '', 0, 11264455, 112, 0, '0000-00-00'),
(165, '2024-02-08', '4000/T02', '11369', 778800, '0000-00-00', '', '', 0, 17159550, 113, 0, '0000-00-00'),
(166, '2024-02-08', '4000/T02', '11369', 618800, '0000-00-00', '', '', 0, 17778350, 114, 0, '0000-00-00'),
(167, '2024-02-08', '4000/T02', '11369', 1163700, '0000-00-00', '', '', 0, 18942050, 115, 0, '0000-00-00'),
(168, '2024-02-08', '4000/T02', '11369', 715200, '0000-00-00', '', '', 0, 19657250, 116, 0, '0000-00-00'),
(169, '2024-02-08', '4000/T02', '11369', 1067600, '0000-00-00', '', '', 0, 20724850, 117, 0, '0000-00-00'),
(170, '2024-02-08', '4000/T02', '11369', 1539200, '0000-00-00', '', '', 0, 22264050, 118, 0, '0000-00-00'),
(171, '2024-02-08', '4000/T02', '11369', 16100, '0000-00-00', '', '', 0, 22280150, 119, 0, '0000-00-00'),
(172, '2024-02-08', '4000/T05', '11370', 598400, '0000-00-00', '', '', 0, 70468195, 120, 0, '0000-00-00'),
(173, '2024-02-08', '4000/T05', '11370', 13733280, '0000-00-00', '', '', 0, 84201475, 121, 0, '0000-00-00'),
(174, '2024-02-08', '4000/T05', '11370', 6924780, '0000-00-00', '', '', 0, 91126255, 122, 0, '0000-00-00'),
(175, '2024-02-08', '4000/T05', '11370', 2716260, '0000-00-00', '', '', 0, 93842515, 123, 0, '0000-00-00'),
(176, '2024-02-09', '4000/T05', '11371', 46400, '0000-00-00', '', '', 0, 93888915, 124, 0, '0000-00-00'),
(177, '2024-02-09', '4000/T05', '11371', 2606625, '0000-00-00', '', '', 0, 96495540, 125, 0, '0000-00-00'),
(178, '2024-02-09', '4000/T05', '11371', 7744350, '0000-00-00', '', '', 0, 104239890, 126, 0, '0000-00-00'),
(179, '2024-02-09', '4000/T05', '11371', 13782750, '0000-00-00', '', '', 0, 118022640, 127, 0, '0000-00-00'),
(180, '2024-02-10', '4000/T05', '11375', 6493320, '0000-00-00', '', '', 0, 124515960, 128, 0, '0000-00-00'),
(181, '2024-02-10', '4000/T05', '11375', 5103060, '0000-00-00', '', '', 0, 129619020, 129, 0, '0000-00-00'),
(182, '2024-02-10', '4000/T05', '11375', 1787040, '0000-00-00', '', '', 0, 131406060, 130, 0, '0000-00-00'),
(183, '2024-02-10', '4000/T05', '11375', 3895100, '0000-00-00', '', '', 0, 135301160, 131, 0, '0000-00-00'),
(184, '2024-02-10', '4000/T05', '11375', 1710000, '0000-00-00', '', '', 0, 137011160, 132, 0, '0000-00-00'),
(185, '2024-02-10', '4000/T05', '11375', 94050, '0000-00-00', '', '', 0, 137105210, 133, 0, '0000-00-00'),
(186, '2024-02-10', '4000/T05', '11375', 22620, '0000-00-00', '', '', 0, 137127830, 134, 0, '0000-00-00'),
(187, '2024-02-10', '4000/T05', '11375', 417060, '0000-00-00', '', '', 0, 137544890, 135, 0, '0000-00-00'),
(188, '2024-02-11', '4000/K06', '11372', 565400, '0000-00-00', '', '', 0, 565400, 136, 0, '0000-00-00'),
(189, '2024-02-11', '4000/T07', '11373', 1094925, '0000-00-00', '', '', 0, 12359380, 137, 0, '0000-00-00'),
(190, '2024-02-11', '4000/T07', '11373', 1083600, '0000-00-00', '', '', 0, 13442980, 138, 0, '0000-00-00'),
(191, '2024-02-11', '4000/T07', '11373', 1335600, '0000-00-00', '', '', 0, 14778580, 139, 0, '0000-00-00'),
(192, '2024-02-12', '4000/T07', '11374', 1163350, '0000-00-00', '', '', 0, 15941930, 140, 0, '0000-00-00'),
(195, '0000-00-00', '4000/K06', '999999999', 0, '2024-02-01', 'Dr Feb\'24/009', 'Paid to Ka Yin Lay for Vr No-11337', 100000, 465400, 0, 0, '0000-00-00'),
(197, '0000-00-00', '4000/M06', '999999999', 0, '2024-02-02', 'Dr Feb\'24/025', 'Paid to Mg Mg Soe for Vr No-11152,11185', 4000000, -4000000, 0, 0, '0000-00-00'),
(198, '0000-00-00', '4000/M03', '999999999', 0, '2024-02-02', 'Dr-Feb\'24/026', 'Paid to Mg Mg Nyunt for Vr-11183,11192', 5000000, -5000000, 0, 0, '0000-00-00'),
(200, '0000-00-00', '4000/T08', '999999999', 0, '2024-02-02', 'Dr-Feb 24/028', 'Paid to Than Than Myint for Vr No-107788 (10810-2696450)', 5000000, -5000000, 0, 0, '0000-00-00'),
(201, '0000-00-00', '4000/Y01', '999999999', 0, '2024-02-02', 'Dr-Feb 24/029', 'Paid to Ye Yint for Vr No-11115,11133', 5000000, -5000000, 0, 0, '0000-00-00'),
(202, '0000-00-00', '4000/H01', '999999999', 0, '2024-02-02', 'Dr-Feb 24/030', 'Paid to Htet Aung Lin for Vr No-10877', 444200, -444200, 0, 0, '0000-00-00'),
(203, '0000-00-00', '4000/P01', '999999999', 0, '2024-02-02', 'Dr-Feb 24/031', 'Paid to Phone Naing for Vr No-11249,11268', 3500000, -3500000, 0, 0, '0000-00-00'),
(204, '0000-00-00', '4000/T02', '999999999', 0, '2024-02-02', 'Dr-Feb 24/032', 'Paid to Thein Htay for Vr No-11269', 4000000, 18280150, 0, 0, '0000-00-00'),
(206, '0000-00-00', '4000/M01', '688664275', 0, '2024-02-03', 'Dr-Feb 24/038', 'Paid to MA for Vr No-10586', 4000000, 5370700, 0, 0, '0000-00-00'),
(207, '0000-00-00', '4000/S08', '180194221', 0, '2024-02-03', 'Dr-Feb 24/039', 'Paid to Soe Naing for Vr No-10534,10542', 4000000, 23026300, 0, 0, '0000-00-00'),
(208, '0000-00-00', '4000/K07', '610542484', 0, '2024-02-03', 'Dr-Feb 24/040', 'Paid to Khin Mg Myint for Vr N0-11189', 7000000, 76504000, 0, 0, '0000-00-00'),
(209, '0000-00-00', '4000/M07', '683765926', 0, '2024-02-05', 'Dr-Feb 24/069', 'Paid to Moe Kyaw for Vr No-11332, 11339, Cheque No-052402', 12503950, 4000000, 0, 0, '0000-00-00'),
(210, '0000-00-00', '4000/T03', '832137393', 0, '2024-02-06', 'Dr Feb 24/090', 'Paid to Thin Thin Yee for Vr No-11163,11176 Cheque No-039001', 60000000, 600774210, 0, 0, '0000-00-00'),
(211, '0000-00-00', '4000/S07', '656558491', 0, '2024-02-06', 'Dr Feb 24/091', 'Paid to Soe Thein (TCL) for Vr No-00113,00123 Cheque No-039003', 30000000, 29055000, 0, 0, '0000-00-00'),
(212, '0000-00-00', '4000/001', '324107380', 0, '2024-02-06', 'Dr Feb 24/092', 'Paid to 4 Zaw for Vr No-11030,11042,11054 Cheque No-039004', 5000000, 71660500, 0, 0, '0000-00-00'),
(213, '0000-00-00', '4000/A01', '812121395', 0, '2024-02-06', 'Dr Feb 24/093', 'Paid to AK for Vr No-11009,11023 Cheque No-039005', 4000000, 39681850, 0, 0, '0000-00-00'),
(214, '0000-00-00', '4000/A02', '681859060', 0, '2024-02-06', 'Dr Feb 24/094', 'Paid to Arr Kae for Vr No-11170,11199 Cheque No-039006', 3000000, 9876500, 0, 0, '0000-00-00'),
(215, '0000-00-00', '4000/A03', '358906477', 0, '2024-02-06', 'Dr Feb 24/095', 'Paid to Aung Naing Oo for Vr No-10891,10930,10980,11021 Cheque No-039007', 7000000, 81877950, 0, 0, '0000-00-00'),
(216, '0000-00-00', '4000/A05', '275235958', 0, '2024-02-06', 'Dr Feb 24/096', 'Paid to Myo Min for Vr No-10891,10930,10980,11021 Cheque No-039007', 5000000, 54740800, 0, 0, '0000-00-00'),
(217, '0000-00-00', '4000/A06', '590609925', 0, '2024-02-06', 'Dr Feb 24/097', 'Paid to Aung Zaw Oo for Vr No-11172 Cheque No-039009', 3000000, 7866450, 0, 0, '0000-00-00'),
(218, '0000-00-00', '4000/A07', '361022968', 0, '2024-02-06', 'Dr Feb 24/098', '', 4000000, 22024300, 0, 0, '0000-00-00'),
(219, '0000-00-00', '4000/B01', '390434563', 0, '2024-02-06', 'Dr Feb 24/099', 'Paid to Bar Bu Lay for Vr No-11263 Cheque No-0390011', 3000000, 29117275, 0, 0, '0000-00-00'),
(220, '0000-00-00', '4000/C02', '161379892', 0, '2024-02-06', 'Dr Feb 24/100', 'Paid to Cho Mg for Vr No-11155,11161 Cheque No-0390012', 5000000, 35388800, 0, 0, '0000-00-00'),
(221, '0000-00-00', '4000/H02', '659013912', 0, '2024-02-06', 'Dr Feb 24/101', 'Paid to Htay Win for Vr No-  Cheque No-0390013', 3000000, 10716150, 0, 0, '0000-00-00'),
(222, '0000-00-00', '4000/K05', '49084585', 0, '2024-02-06', 'Dr Feb 24/102', 'Paid to Kyaw Zay Ya for Vr No-11097 Cheque No-0390014', 7000000, 122455450, 0, 0, '0000-00-00'),
(223, '0000-00-00', '4000/K03', '35082785', 0, '2024-02-06', 'Dr Feb 24/103', 'Paid to KTO for Vr No-10608,11322 Cheque No-0390015', 4000000, 3946250, 0, 0, '0000-00-00'),
(224, '0000-00-00', '4000/K04', '605261569', 0, '2024-02-06', 'Dr Feb 24/104', 'Paid to Kaung Myat for Vr No-11341 Cheque No-0390016', 4000000, 11518675, 0, 0, '0000-00-00'),
(225, '0000-00-00', '4000/M07', '349836488', 0, '2024-02-06', 'Dr Feb 24/105', 'Paid to Moe Kyaw for Vr No-11332 Cheque No-0390017', 4000000, 16503950, 0, 0, '0000-00-00'),
(226, '0000-00-00', '4000/S01', '924902489', 0, '2024-02-06', 'Dr Feb 24/106', 'Paid to Shwe Late for Vr No-10871,10842,10892,10902 Cheque No-0390018', 5000000, 84761675, 0, 0, '0000-00-00'),
(227, '0000-00-00', '4000/S03', '135625221', 0, '2024-02-06', 'Dr Feb 24/107', 'Paid to Soe Min for Vr No-10929,10997,11020 Cheque No-0390019', 20000000, 39993131, 0, 0, '0000-00-00'),
(228, '0000-00-00', '4000/S04', '910283665', 0, '2024-02-06', 'Dr Feb 24/108', 'Paid to Si Thu for Vr No-10845, 10857, 10858 Cheque No-0390020', 5000000, 69864800, 0, 0, '0000-00-00'),
(229, '0000-00-00', '4000/T05', '454234414', 0, '2024-02-06', 'Dr Feb 24/109', 'Paid to Thet Oo for Vr No-11120,11132 Cheque No-039021', 30000000, 286000305, 0, 0, '0000-00-00'),
(230, '0000-00-00', '4000/T01', '422681790', 0, '2024-02-06', 'Dr Feb 24/110', 'Paid to Thet Paing for Vr No-11327 Cheque No-039022', 4000000, 14018750, 0, 0, '0000-00-00'),
(231, '0000-00-00', '4000/T11', '561505430', 0, '2024-02-06', 'Dr Feb 24/111', 'Paid to Tun Zaw Min for Vr No-11074 Cheque No-039023', 30000000, 468013255, 0, 0, '0000-00-00'),
(232, '0000-00-00', '4000/W01', '402872185', 0, '2024-02-06', 'Dr Feb 24/112', 'Paid to Win Bo for Vr No-11283 Cheque No-039024', 3352700, 0, 0, 0, '0000-00-00'),
(233, '0000-00-00', '4000/Z01', '209216723', 0, '2024-02-06', 'Dr Feb 24/113', 'Paid to Zaw Latt for Vr No-10966,11008 Cheque No-039025', 4000000, 35175400, 0, 0, '0000-00-00'),
(234, '0000-00-00', '4000/A04', '357508052', 0, '2024-02-06', 'Dr Feb 24/114', 'Paid to Aung Kyaw Moe for Vr No-10944 Cheque No-052401', 5472850, 0, 0, 0, '0000-00-00'),
(235, '0000-00-00', '4000/Z03', '361953082', 0, '2024-02-08', 'Dr Feb 24/131', 'Paid to Zaw Myat Thu for Vr No-11357', 6000000, 13655000, 0, 0, '0000-00-00'),
(236, '0000-00-00', '4000/T11', '65209177', 0, '2024-02-09', 'Dr Feb 24/154', 'Paid to Tun Zaw Min for Vr No-11074, 11079 Cheque No-052403', 40000000, 926026510, 0, 0, '0000-00-00'),
(237, '0000-00-00', '4000/P02', '999999999', 0, '2024-02-02', 'Dr-Feb 24/027', 'Paid to BLC (PYM) for Vr No-11221', 3400000, 0, 0, 0, '0000-00-00'),
(238, '2024-02-13', '4000/Z03', '11376', 701500, '0000-00-00', '', '', 0, 14356500, 141, 0, '0000-00-00'),
(239, '2024-02-13', '4000/Z03', '11376', 1547700, '0000-00-00', '', '', 0, 15904200, 142, 0, '0000-00-00'),
(240, '2024-02-13', '4000/Z03', '11376', 752850, '0000-00-00', '', '', 0, 16657050, 143, 0, '0000-00-00'),
(241, '2024-02-13', '4000/Z03', '11376', 2322000, '0000-00-00', '', '', 0, 18979050, 144, 0, '0000-00-00'),
(242, '2024-02-13', '4000/Z03', '11376', 2033600, '0000-00-00', '', '', 0, 21012650, 145, 0, '0000-00-00'),
(243, '2024-02-13', '4000/Z03', '11376', 1244100, '0000-00-00', '', '', 0, 22256750, 146, 0, '0000-00-00'),
(244, '2024-02-13', '4000/Z03', '11376', 1748500, '0000-00-00', '', '', 0, 24005250, 147, 0, '0000-00-00'),
(245, '2024-02-13', '4000/T05', '11377', 4433220, '0000-00-00', '', '', 0, 290433525, 148, 0, '0000-00-00'),
(246, '2024-02-13', '4000/T05', '11377', 160518860, '0000-00-00', '', '', 0, 450952385, 149, 0, '0000-00-00'),
(247, '2024-02-13', '4000/T05', '11377', 35853000, '0000-00-00', '', '', 0, 486805385, 150, 0, '0000-00-00'),
(248, '2024-02-13', '4000/T05', '11377', 1954500, '0000-00-00', '', '', 0, 488759885, 151, 0, '0000-00-00'),
(249, '2024-02-13', '4000/T05', '11377', 2008050, '0000-00-00', '', '', 0, 490767935, 152, 0, '0000-00-00'),
(250, '2024-02-14', '4000/T05', '11378', 127600, '0000-00-00', '', '', 0, 490895535, 153, 0, '0000-00-00'),
(251, '2024-02-14', '4000/T05', '11378', 4589550, '0000-00-00', '', '', 0, 495485085, 154, 0, '0000-00-00'),
(252, '2024-02-14', '4000/T05', '11378', 1674750, '0000-00-00', '', '', 0, 497159835, 155, 0, '0000-00-00'),
(253, '2024-02-14', '4000/T05', '11378', 3995000, '0000-00-00', '', '', 0, 501154835, 156, 0, '0000-00-00'),
(254, '2024-02-14', '4000/T05', '11379', 3136320, '0000-00-00', '', '', 0, 504291155, 157, 0, '0000-00-00'),
(255, '2024-02-14', '4000/T05', '11379', 10535080, '0000-00-00', '', '', 0, 514826235, 158, 0, '0000-00-00'),
(256, '2024-02-14', '4000/T05', '11379', 43185780, '0000-00-00', '', '', 0, 558012015, 159, 0, '0000-00-00'),
(257, '2024-02-14', '4000/T05', '11379', 8014050, '0000-00-00', '', '', 0, 566026065, 160, 0, '0000-00-00'),
(258, '2024-02-14', '4000/T05', '11379', 915750, '0000-00-00', '', '', 0, 566941815, 161, 0, '0000-00-00'),
(259, '2024-02-14', '4000/T05', '11379', 688500, '0000-00-00', '', '', 0, 567630315, 162, 0, '0000-00-00'),
(260, '2024-02-14', '4000/T05', '11379', 493350, '0000-00-00', '', '', 0, 568123665, 163, 0, '0000-00-00'),
(261, '2024-02-14', '4000/T05', '11379', 290700, '0000-00-00', '', '', 0, 568414365, 164, 0, '0000-00-00'),
(262, '2024-02-14', '4000/S03', '11380', 2566100, '0000-00-00', '', '', 0, 42559231, 165, 0, '0000-00-00'),
(263, '2024-02-14', '4000/S03', '11380', 21447000, '0000-00-00', '', '', 0, 64006231, 166, 0, '0000-00-00'),
(264, '2024-02-14', '4000/S03', '11380', 19414000, '0000-00-00', '', '', 0, 83420231, 167, 0, '0000-00-00'),
(265, '2024-02-14', '4000/S03', '11380', 8049000, '0000-00-00', '', '', 0, 91469231, 168, 0, '0000-00-00'),
(266, '2024-02-15', '4000/K06', '11381', 93500, '0000-00-00', '', '', 0, 558900, 169, 0, '0000-00-00'),
(267, '2024-02-15', '4000/T02', '11381', 1240800, '0000-00-00', '', '', 0, 19520950, 170, 0, '0000-00-00'),
(268, '2024-02-15', '4000/T02', '11382', 941800, '0000-00-00', '', '', 0, 20462750, 171, 0, '0000-00-00'),
(269, '2024-02-15', '4000/T02', '11382', 3164400, '0000-00-00', '', '', 0, 23627150, 172, 0, '0000-00-00'),
(270, '2024-02-15', '4000/T02', '11382', 890800, '0000-00-00', '', '', 0, 24517950, 173, 0, '0000-00-00'),
(271, '2024-02-15', '4000/T02', '11382', 2416000, '0000-00-00', '', '', 0, 26933950, 174, 0, '0000-00-00'),
(272, '2024-02-15', '4000/T02', '11382', 27600, '0000-00-00', '', '', 0, 26961550, 175, 0, '0000-00-00'),
(273, '2024-02-15', '4000/T06', '11383', 7278110, '0000-00-00', '', '', 0, 7278110, 176, 0, '0000-00-00'),
(274, '2024-02-15', '4000/T05', '11384', 7946400, '0000-00-00', '', '', 0, 576360765, 177, 0, '0000-00-00'),
(275, '2024-02-15', '4000/T05', '11384', 22028260, '0000-00-00', '', '', 0, 598389025, 178, 0, '0000-00-00'),
(276, '2024-02-15', '4000/T05', '11384', 14830200, '0000-00-00', '', '', 0, 613219225, 179, 0, '0000-00-00'),
(277, '2024-02-15', '4000/T05', '11384', 10827630, '0000-00-00', '', '', 0, 624046855, 180, 0, '0000-00-00'),
(278, '2024-02-16', '4000/S03', '11385', 161785, '0000-00-00', '', '', 0, 91631016, 181, 0, '0000-00-00'),
(279, '2024-02-16', '4000/S03', '11385', 6928470, '0000-00-00', '', '', 0, 98559486, 182, 0, '0000-00-00'),
(280, '2024-02-16', '4000/S03', '11385', 18486000, '0000-00-00', '', '', 0, 117045486, 183, 0, '0000-00-00'),
(281, '2024-02-16', '4000/S03', '11385', 25935000, '0000-00-00', '', '', 0, 142980486, 184, 0, '0000-00-00'),
(282, '2024-02-16', '4000/T05', '11386', 4880700, '0000-00-00', '', '', 0, 628927555, 185, 0, '0000-00-00'),
(283, '2024-02-16', '4000/T05', '11386', 12051960, '0000-00-00', '', '', 0, 640979515, 186, 0, '0000-00-00'),
(284, '2024-02-16', '4000/T05', '11386', 9818820, '0000-00-00', '', '', 0, 650798335, 187, 0, '0000-00-00'),
(285, '2024-02-16', '4000/T05', '11386', 5071770, '0000-00-00', '', '', 0, 655870105, 188, 0, '0000-00-00'),
(286, '2024-02-16', '4000/T05', '11386', 1872000, '0000-00-00', '', '', 0, 657742105, 189, 0, '0000-00-00'),
(287, '2024-02-16', '4000/T05', '11386', 726000, '0000-00-00', '', '', 0, 658468105, 190, 0, '0000-00-00'),
(288, '2024-02-16', '4000/T05', '11386', 275400, '0000-00-00', '', '', 0, 658743505, 191, 0, '0000-00-00'),
(289, '2024-02-16', '4000/T05', '11386', 86700, '0000-00-00', '', '', 0, 658830205, 192, 0, '0000-00-00'),
(290, '2024-02-16', '4000/T07', '11386', 1669200, '0000-00-00', '', '', 0, 17611130, 193, 0, '0000-00-00'),
(291, '2024-02-16', '4000/T07', '11387', 798000, '0000-00-00', '', '', 0, 18409130, 194, 0, '0000-00-00'),
(292, '2024-02-16', '4000/B01', '11388', 4088500, '0000-00-00', '', '', 0, 33205775, 195, 0, '0000-00-00'),
(293, '2024-02-16', '4000/B01', '11388', 3244500, '0000-00-00', '', '', 0, 36450275, 196, 0, '0000-00-00'),
(294, '2024-02-16', '4000/B01', '11388', 1012000, '0000-00-00', '', '', 0, 37462275, 197, 0, '0000-00-00'),
(295, '2024-02-16', '4000/B01', '11388', 289000, '0000-00-00', '', '', 0, 37751275, 198, 0, '0000-00-00'),
(296, '2024-02-16', '4000/B01', '11388', 871200, '0000-00-00', '', '', 0, 38622475, 199, 0, '0000-00-00'),
(297, '2024-02-16', '4000/B01', '11388', 1071000, '0000-00-00', '', '', 0, 39693475, 200, 0, '0000-00-00'),
(298, '2024-02-16', '4000/B01', '11388', 4305600, '0000-00-00', '', '', 0, 43999075, 201, 0, '0000-00-00'),
(299, '2024-02-16', '4000/S03', '11411', 211050, '0000-00-00', '', '', 0, 143191536, 202, 0, '0000-00-00'),
(300, '2024-02-16', '4000/S03', '11411', 7703280, '0000-00-00', '', '', 0, 150894816, 203, 0, '0000-00-00'),
(301, '2024-02-16', '4000/S03', '11411', 2572500, '0000-00-00', '', '', 0, 153467316, 204, 0, '0000-00-00'),
(302, '2024-02-16', '4000/S03', '11411', 3725700, '0000-00-00', '', '', 0, 157193016, 205, 0, '0000-00-00'),
(303, '2024-02-17', '4000/T05', '11389', 440880, '0000-00-00', '', '', 0, 659271085, 206, 0, '0000-00-00'),
(304, '2024-02-17', '4000/T05', '11389', 24196380, '0000-00-00', '', '', 0, 683467465, 207, 0, '0000-00-00'),
(305, '2024-02-17', '4000/T05', '11389', 7949700, '0000-00-00', '', '', 0, 691417165, 208, 0, '0000-00-00'),
(306, '2024-02-17', '4000/T05', '11389', 4616370, '0000-00-00', '', '', 0, 696033535, 209, 0, '0000-00-00'),
(307, '2024-02-17', '4000/T05', '11389', 7347000, '0000-00-00', '', '', 0, 703380535, 210, 0, '0000-00-00'),
(308, '2024-02-17', '4000/T05', '11389', 1848000, '0000-00-00', '', '', 0, 705228535, 211, 0, '0000-00-00'),
(309, '2024-02-17', '4000/T05', '11389', 693600, '0000-00-00', '', '', 0, 705922135, 212, 0, '0000-00-00'),
(310, '2024-02-17', '4000/S03', '11390', 6129160, '0000-00-00', '', '', 0, 163322176, 213, 0, '0000-00-00'),
(311, '2024-02-17', '4000/S03', '11390', 17148000, '0000-00-00', '', '', 0, 180470176, 214, 0, '0000-00-00'),
(312, '2024-02-17', '4000/S03', '11390', 28910000, '0000-00-00', '', '', 0, 209380176, 215, 0, '0000-00-00'),
(313, '2024-02-18', '4000/S03', '11391', 2990520, '0000-00-00', '', '', 0, 212370696, 216, 0, '0000-00-00'),
(314, '2024-02-18', '4000/S03', '11391', 6808500, '0000-00-00', '', '', 0, 219179196, 217, 0, '0000-00-00'),
(315, '2024-02-18', '4000/S03', '11391', 3936900, '0000-00-00', '', '', 0, 223116096, 218, 0, '0000-00-00'),
(316, '2024-02-18', '4000/S03', '11391', 81900, '0000-00-00', '', '', 0, 223197996, 219, 0, '0000-00-00'),
(317, '2024-02-18', '4000/S03', '11392', 4939910, '0000-00-00', '', '', 0, 228137906, 220, 0, '0000-00-00'),
(318, '2024-02-18', '4000/S03', '11392', 15885000, '0000-00-00', '', '', 0, 244022906, 221, 0, '0000-00-00'),
(319, '2024-02-18', '4000/S03', '11392', 27985000, '0000-00-00', '', '', 0, 272007906, 222, 0, '0000-00-00'),
(320, '2024-02-19', '4000/T07', '11392', 1272250, '0000-00-00', '', '', 0, 19681380, 223, 0, '0000-00-00'),
(321, '2024-02-19', '4000/T07', '11393', 1092000, '0000-00-00', '', '', 0, 20773380, 224, 0, '0000-00-00'),
(322, '2024-02-19', '4000/T07', '11393', 554400, '0000-00-00', '', '', 0, 21327780, 225, 0, '0000-00-00'),
(323, '2024-02-19', '4000/Z03', '11394', 494500, '0000-00-00', '', '', 0, 24499750, 226, 0, '0000-00-00'),
(324, '2024-02-19', '4000/Z03', '11394', 414000, '0000-00-00', '', '', 0, 24913750, 227, 0, '0000-00-00'),
(325, '2024-02-19', '4000/Z03', '11394', 229950, '0000-00-00', '', '', 0, 25143700, 228, 0, '0000-00-00'),
(326, '2024-02-19', '4000/Z03', '11394', 834900, '0000-00-00', '', '', 0, 25978600, 229, 0, '0000-00-00'),
(327, '2024-02-19', '4000/Z03', '11394', 2782100, '0000-00-00', '', '', 0, 28760700, 230, 0, '0000-00-00'),
(328, '2024-02-19', '4000/Z03', '11394', 431200, '0000-00-00', '', '', 0, 29191900, 231, 0, '0000-00-00'),
(329, '2024-02-19', '4000/Z03', '11394', 240700, '0000-00-00', '', '', 0, 29432600, 232, 0, '0000-00-00'),
(330, '2024-02-19', '4000/Z03', '11394', 852500, '0000-00-00', '', '', 0, 30285100, 233, 0, '0000-00-00'),
(331, '2024-02-19', '4000/Z03', '11394', 1725750, '0000-00-00', '', '', 0, 32010850, 234, 0, '0000-00-00'),
(332, '2024-02-19', '4000/S03', '11398', 121680, '0000-00-00', '', '', 0, 272129586, 235, 0, '0000-00-00'),
(333, '2024-02-19', '4000/S03', '11398', 7071000, '0000-00-00', '', '', 0, 279200586, 236, 0, '0000-00-00'),
(334, '2024-02-19', '4000/S03', '11398', 7745460, '0000-00-00', '', '', 0, 286946046, 237, 0, '0000-00-00'),
(335, '2024-02-19', '4000/S03', '11398', 13500, '0000-00-00', '', '', 0, 286959546, 238, 0, '0000-00-00'),
(336, '2024-02-19', '4000/S03', '11398', 1451400, '0000-00-00', '', '', 0, 288410946, 239, 0, '0000-00-00'),
(337, '2024-02-19', '4000/S03', '11398', 475520, '0000-00-00', '', '', 0, 288886466, 240, 0, '0000-00-00'),
(338, '2024-02-20', '4000/T02', '11395', 1094700, '0000-00-00', '', '', 0, 28056250, 241, 0, '0000-00-00'),
(339, '2024-02-20', '4000/T02', '11395', 848700, '0000-00-00', '', '', 0, 28904950, 242, 0, '0000-00-00'),
(340, '2024-02-20', '4000/T02', '11395', 1652750, '0000-00-00', '', '', 0, 30557700, 243, 0, '0000-00-00'),
(341, '2024-02-20', '4000/T02', '11395', 2149350, '0000-00-00', '', '', 0, 32707050, 244, 0, '0000-00-00'),
(342, '2024-02-20', '4000/T02', '11395', 1956500, '0000-00-00', '', '', 0, 34663550, 245, 0, '0000-00-00'),
(343, '2024-02-20', '4000/S03', '11396', 259350, '0000-00-00', '', '', 0, 289145816, 246, 0, '0000-00-00'),
(344, '2024-02-20', '4000/S03', '11396', 6333510, '0000-00-00', '', '', 0, 295479326, 247, 0, '0000-00-00'),
(345, '2024-02-20', '4000/S03', '11396', 16410000, '0000-00-00', '', '', 0, 311889326, 248, 0, '0000-00-00'),
(346, '2024-02-20', '4000/S03', '11396', 23860000, '0000-00-00', '', '', 0, 335749326, 249, 0, '0000-00-00'),
(347, '2024-02-20', '4000/S03', '11396', 759330, '0000-00-00', '', '', 0, 336508656, 250, 0, '0000-00-00'),
(348, '2024-02-20', '4000/S03', '11396', 4506000, '0000-00-00', '', '', 0, 341014656, 251, 0, '0000-00-00'),
(349, '2024-02-20', '4000/S03', '11396', 4662640, '0000-00-00', '', '', 0, 345677296, 252, 0, '0000-00-00'),
(350, '2024-02-20', '4000/T05', '11397', 103400, '0000-00-00', '', '', 0, 706025535, 253, 0, '0000-00-00'),
(351, '2024-02-20', '4000/T05', '11397', 10398000, '0000-00-00', '', '', 0, 716423535, 254, 0, '0000-00-00'),
(352, '2024-02-20', '4000/T05', '11397', 6468000, '0000-00-00', '', '', 0, 722891535, 255, 0, '0000-00-00'),
(353, '2024-02-20', '4000/T05', '11397', 1201900, '0000-00-00', '', '', 0, 724093435, 256, 0, '0000-00-00'),
(354, '2024-02-20', '4000/T05', '11397', 436160, '0000-00-00', '', '', 0, 724529595, 257, 0, '0000-00-00'),
(355, '2024-02-21', '4000/P02', '11399', 11550000, '0000-00-00', '', '', 0, 11550000, 258, 0, '0000-00-00'),
(356, '2024-02-21', '4000/K08', '11400', 1535200, '0000-00-00', '', '', 0, 1535200, 259, 0, '0000-00-00'),
(357, '2024-02-21', '4000/K08', '11400', 4108000, '0000-00-00', '', '', 0, 5643200, 260, 0, '0000-00-00'),
(358, '2024-02-21', '4000/T05', '11401', 98000, '0000-00-00', '', '', 0, 724627595, 261, 0, '0000-00-00'),
(359, '2024-02-21', '4000/T05', '11401', 258500, '0000-00-00', '', '', 0, 724886095, 262, 0, '0000-00-00'),
(360, '2024-02-21', '4000/T05', '11401', 190500, '0000-00-00', '', '', 0, 725076595, 263, 0, '0000-00-00'),
(361, '2024-02-21', '4000/T05', '11402', 14295000, '0000-00-00', '', '', 0, 739371595, 264, 0, '0000-00-00'),
(362, '2024-02-21', '4000/T05', '11402', 2166450, '0000-00-00', '', '', 0, 741538045, 265, 0, '0000-00-00'),
(363, '2024-02-21', '4000/T05', '11402', 367200, '0000-00-00', '', '', 0, 741905245, 266, 0, '0000-00-00'),
(364, '2024-02-21', '4000/S03', '11402', 146250, '0000-00-00', '', '', 0, 345823546, 267, 0, '0000-00-00'),
(365, '2024-02-21', '4000/S03', '11403', 5863500, '0000-00-00', '', '', 0, 351687046, 268, 0, '0000-00-00'),
(366, '2024-02-21', '4000/S03', '11403', 6937180, '0000-00-00', '', '', 0, 358624226, 269, 0, '0000-00-00'),
(367, '2024-02-21', '4000/D01', '11404', 5580000, '0000-00-00', '', '', 0, 5580000, 270, 0, '0000-00-00'),
(368, '2024-02-21', '4000/D01', '11404', 379500, '0000-00-00', '', '', 0, 5959500, 271, 0, '0000-00-00'),
(369, '2024-02-21', '4000/D01', '11404', 4056750, '0000-00-00', '', '', 0, 10016250, 272, 0, '0000-00-00'),
(370, '2024-02-21', '4000/D01', '11404', 2692500, '0000-00-00', '', '', 0, 12708750, 273, 0, '0000-00-00'),
(371, '2024-02-21', '4000/D02', '11405', 602700, '0000-00-00', '', '', 0, 602700, 274, 0, '0000-00-00'),
(372, '2024-02-21', '4000/D02', '11405', 978750, '0000-00-00', '', '', 0, 1581450, 275, 0, '0000-00-00'),
(373, '2024-02-21', '4000/D02', '11405', 2218700, '0000-00-00', '', '', 0, 3800150, 276, 0, '0000-00-00'),
(374, '2024-02-21', '4000/D02', '11405', 3599100, '0000-00-00', '', '', 0, 7399250, 277, 0, '0000-00-00'),
(375, '2024-02-22', '4000/T05', '11406', 560280, '0000-00-00', '', '', 0, 742465525, 278, 0, '0000-00-00'),
(376, '2024-02-22', '4000/T05', '11406', 1496250, '0000-00-00', '', '', 0, 743961775, 279, 0, '0000-00-00'),
(377, '2024-02-22', '4000/T05', '11406', 274905, '0000-00-00', '', '', 0, 744236680, 280, 0, '0000-00-00'),
(378, '2024-02-22', '4000/T05', '11406', 6619800, '0000-00-00', '', '', 0, 750856480, 281, 0, '0000-00-00'),
(379, '2024-02-22', '4000/T05', '11406', 3250520, '0000-00-00', '', '', 0, 754107000, 282, 0, '0000-00-00'),
(380, '2024-02-22', '4000/T05', '11406', 176540, '0000-00-00', '', '', 0, 754283540, 283, 0, '0000-00-00'),
(381, '2024-02-22', '4000/T07', '11407', 1341000, '0000-00-00', '', '', 0, 22668780, 284, 0, '0000-00-00'),
(382, '2024-02-22', '4000/T07', '11407', 1054950, '0000-00-00', '', '', 0, 23723730, 285, 0, '0000-00-00'),
(383, '2024-02-22', '4000/K08', '11408', 133500, '0000-00-00', '', '', 0, 5776700, 286, 0, '0000-00-00'),
(384, '2024-02-22', '4000/K08', '11408', 2515600, '0000-00-00', '', '', 0, 8292300, 287, 0, '0000-00-00'),
(385, '2024-02-22', '4000/K08', '11408', 1892000, '0000-00-00', '', '', 0, 10184300, 288, 0, '0000-00-00'),
(386, '2024-02-22', '4000/K08', '11408', 503800, '0000-00-00', '', '', 0, 10688100, 289, 0, '0000-00-00'),
(387, '2024-02-22', '4000/B01', '11409', 79200, '0000-00-00', '', '', 0, 44078275, 290, 0, '0000-00-00'),
(388, '2024-02-22', '4000/B01', '11409', 1148400, '0000-00-00', '', '', 0, 45226675, 291, 0, '0000-00-00'),
(389, '2024-02-22', '4000/B01', '11409', 158400, '0000-00-00', '', '', 0, 45385075, 292, 0, '0000-00-00'),
(390, '2024-02-22', '4000/B01', '11409', 5085600, '0000-00-00', '', '', 0, 50470675, 293, 0, '0000-00-00'),
(391, '2024-02-22', '4000/S03', '11410', 257250, '0000-00-00', '', '', 0, 358881476, 294, 0, '0000-00-00'),
(392, '2024-02-22', '4000/S03', '11410', 8032050, '0000-00-00', '', '', 0, 366913526, 295, 0, '0000-00-00'),
(393, '2024-02-22', '4000/S03', '11410', 453000, '0000-00-00', '', '', 0, 367366526, 296, 0, '0000-00-00'),
(394, '2024-02-22', '4000/S03', '11410', 4348680, '0000-00-00', '', '', 0, 371715206, 297, 0, '0000-00-00'),
(395, '2024-02-23', '4000/K08', '11412', 2230600, '0000-00-00', '', '', 0, 12918700, 298, 0, '0000-00-00'),
(396, '2024-02-23', '4000/K08', '11412', 972000, '0000-00-00', '', '', 0, 13890700, 299, 0, '0000-00-00'),
(397, '2024-02-23', '4000/K08', '11412', 959200, '0000-00-00', '', '', 0, 14849900, 300, 0, '0000-00-00'),
(398, '2024-02-23', '4000/K08', '11412', 217800, '0000-00-00', '', '', 0, 15067700, 301, 0, '0000-00-00'),
(399, '2024-02-23', '4000/S03', '11413', 58800, '0000-00-00', '', '', 0, 371774006, 302, 0, '0000-00-00'),
(400, '2024-02-23', '4000/S03', '11413', 4297410, '0000-00-00', '', '', 0, 376071416, 303, 0, '0000-00-00'),
(401, '2024-02-23', '4000/S03', '11413', 22207500, '0000-00-00', '', '', 0, 398278916, 304, 0, '0000-00-00'),
(402, '2024-02-23', '4000/S03', '11413', 8936170, '0000-00-00', '', '', 0, 407215086, 305, 0, '0000-00-00'),
(403, '2024-02-24', '4000/Z03', '11414', 820700, '0000-00-00', '', '', 0, 32831550, 306, 0, '0000-00-00'),
(404, '2024-02-24', '4000/Z03', '11414', 4236750, '0000-00-00', '', '', 0, 37068300, 307, 0, '0000-00-00'),
(405, '2024-02-24', '4000/Z03', '11414', 2334500, '0000-00-00', '', '', 0, 39402800, 308, 0, '0000-00-00'),
(406, '2024-02-24', '4000/Z03', '11414', 378400, '0000-00-00', '', '', 0, 39781200, 309, 0, '0000-00-00'),
(407, '2024-02-24', '4000/Z03', '11414', 4112500, '0000-00-00', '', '', 0, 43893700, 310, 0, '0000-00-00'),
(408, '2024-02-24', '4000/Z03', '11414', 344100, '0000-00-00', '', '', 0, 44237800, 311, 0, '0000-00-00'),
(409, '2024-02-24', '4000/Z03', '11414', 963600, '0000-00-00', '', '', 0, 45201400, 312, 0, '0000-00-00'),
(410, '2024-02-24', '4000/K08', '11415', 2863300, '0000-00-00', '', '', 0, 17931000, 313, 0, '0000-00-00'),
(411, '2024-02-24', '4000/K08', '11415', 2606000, '0000-00-00', '', '', 0, 20537000, 314, 0, '0000-00-00'),
(412, '2024-02-24', '4000/K08', '11415', 99000, '0000-00-00', '', '', 0, 20636000, 315, 0, '0000-00-00'),
(413, '2024-02-24', '4000/T05', '11416', 224475, '0000-00-00', '', '', 0, 754508015, 316, 0, '0000-00-00'),
(414, '2024-02-24', '4000/T05', '11416', 25947240, '0000-00-00', '', '', 0, 780455255, 317, 0, '0000-00-00'),
(415, '2024-02-24', '4000/T05', '11416', 8641010, '0000-00-00', '', '', 0, 789096265, 318, 0, '0000-00-00'),
(416, '2024-02-24', '4000/T05', '11416', 6529070, '0000-00-00', '', '', 0, 795625335, 319, 0, '0000-00-00'),
(417, '2024-02-24', '4000/T05', '11416', 2319520, '0000-00-00', '', '', 0, 797944855, 320, 0, '0000-00-00'),
(418, '2024-02-24', '4000/T05', '11416', 2338500, '0000-00-00', '', '', 0, 800283355, 321, 0, '0000-00-00'),
(419, '2024-02-24', '4000/T05', '11416', 618750, '0000-00-00', '', '', 0, 800902105, 322, 0, '0000-00-00'),
(420, '2024-02-24', '4000/T05', '11416', 1482400, '0000-00-00', '', '', 0, 802384505, 323, 0, '0000-00-00'),
(421, '2024-02-24', '4000/S03', '11417', 8257860, '0000-00-00', '', '', 0, 415472946, 324, 0, '0000-00-00'),
(422, '2024-02-24', '4000/S03', '11417', 7753500, '0000-00-00', '', '', 0, 423226446, 325, 0, '0000-00-00'),
(423, '2024-02-24', '4000/S03', '11417', 1908810, '0000-00-00', '', '', 0, 425135256, 326, 0, '0000-00-00'),
(424, '0000-00-00', '4000/T05', '864322715', 0, '2024-02-13', 'Dr-Feb 24/182', 'Paid to Thet Oo for Vr No-11132,11202,11215,11242,11265,11279 Cheque No-052404\r\n', 40000000, 940839920, 0, 0, '0000-00-00'),
(425, '0000-00-00', '4000/T02', '98873117', 0, '2024-02-13', 'Dr-Feb 24/183', 'Paid to Thein Htay for Vr No-11269,11344,11359 Cheque No-052405\r\n', 6000000, 35393200, 0, 0, '0000-00-00'),
(427, '0000-00-00', '4000/T03', '310313466', 0, '2024-02-14', 'Dr-Feb 24/188', 'Paid to Thin Thin Yee for Vr No-11176,11177\r\n', 50000000, 1211548420, 0, 0, '0000-00-00'),
(428, '0000-00-00', '4000/Y01', '572566528', 0, '2024-02-14', 'Dr-Feb 24/189', 'Paid to Ye Yint for Vr No-11133,11135\r\n', 4000000, 17697900, 0, 0, '0000-00-00'),
(429, '0000-00-00', '4000/Z03', '248087336', 0, '2024-02-14', 'Dr-Feb 24/190', 'Paid to Zaw Myat Thu for Vr No-11357,11361\r\n', 10000000, 35201400, 0, 0, '0000-00-00'),
(430, '0000-00-00', '4000/S03', '539088617', 0, '2024-02-14', 'Dr-Feb 24/191', 'Paid to Soe Min for Vr No-11020,11069,11121\r\n', 20000000, 465128387, 0, 0, '0000-00-00'),
(431, '0000-00-00', '4000/T11', '520792379', 0, '2024-02-14', 'Dr-Feb 24/192', 'Paid to Tun Zaw Min for Vr No-11079\r\n', 30000000, 1394039765, 0, 0, '0000-00-00'),
(432, '0000-00-00', '4000/S05', '26664804', 0, '2024-02-14', 'Dr-Feb 24/193', 'Paid to Si Thu (D-22) for Vr No\r\n', 6000000, 0, 0, 0, '0000-00-00'),
(433, '0000-00-00', '4000/M03', '684795018', 0, '2024-02-14', 'Dr-Feb 24/194', 'Paid to Mg Mg Nyunt for Vr No-11192\r\n', 5000000, 49159500, 0, 0, '0000-00-00'),
(434, '0000-00-00', '4000/P01', '811289679', 0, '2024-02-14', 'Dr-Feb 24/195', 'Paid to Phone Naing for Vr No-11268\r\n', 3000000, 4751350, 0, 0, '0000-00-00'),
(435, '0000-00-00', '4000/M06', '567907806', 0, '2024-02-14', 'Dr-Feb 24/196', 'Paid to Mg Mg Soe for Vr No-11185,11198\r\n', 5000000, 13150800, 0, 0, '0000-00-00'),
(436, '0000-00-00', '4000/S07', '529905849', 0, '2024-02-14', 'Dr-Feb 24/197', 'Paid to Soe Thein (TCL) for Vr No-00123\r\n', 12000000, 76110000, 0, 0, '0000-00-00'),
(437, '0000-00-00', '4000/T05', '895517630', 0, '2024-02-14', 'Dr-Feb 24/198', 'Paid to Thet Oo for Vr No-11279,11328,11348\r\n', 50000000, 1069295335, 0, 0, '0000-00-00'),
(438, '0000-00-00', '4000/K07', '88898225', 0, '2024-02-14', 'Dr-Feb 24/199', 'Paid to Khin Mg Myint for Vr No-11189\r\n', 7000000, 153008000, 0, 0, '0000-00-00'),
(439, '0000-00-00', '4000/C02', '998590395', 0, '2024-02-14', 'Dr-Feb 24/200', 'Paid to Cho Mg for Vr No-11161\r\n', 4000000, 71777600, 0, 0, '0000-00-00'),
(440, '0000-00-00', '4000/B01', '888604041', 0, '2024-02-14', 'Dr-Feb 24/201', 'Paid to Bar Bu Lay for Vr No-11263,11323\r\n', 4000000, 66711800, 0, 0, '0000-00-00'),
(441, '0000-00-00', '4000/A07', '174113251', 0, '2024-02-14', 'Dr-Feb 24/202', 'Paid to A Thay Lay for Vr No-11237\r\n', 3000000, 45048600, 0, 0, '0000-00-00'),
(442, '0000-00-00', '4000/S08', '759115391', 0, '2024-02-14', 'Dr-Feb 24/203', 'Paid to Soe Naing for Vr No-10542\r\n', 5000000, 45052600, 0, 0, '0000-00-00'),
(443, '0000-00-00', '4000/K04', '345734522', 0, '2024-02-14', 'Dr-Feb 24/204', 'Paid to Kaung Myat for Vr No-11341\r\n', 4000000, 23037350, 0, 0, '0000-00-00'),
(444, '0000-00-00', '4000/A02', '355086444', 0, '2024-02-14', 'Dr-Feb 24/205', 'Paid to Arr Kae for Vr No-11199,11248\r\n', 4000000, 18753000, 0, 0, '0000-00-00'),
(445, '0000-00-00', '4000/A03', '310779577', 0, '2024-02-14', 'Dr-Feb 24/206', 'Paid to Aung Naing Oo for Vr No-11021,11049,11067,11085\r\n', 7000000, 163755900, 0, 0, '0000-00-00'),
(446, '0000-00-00', '4000/A01', '199228809', 0, '2024-02-14', 'Dr-Feb 24/207', 'Paid to AK for Vr No-11023,11082,11128\r\n', 6000000, 77363700, 0, 0, '0000-00-00'),
(447, '0000-00-00', '4000/A06', '76716340', 0, '2024-02-14', 'Dr-Feb 24/208', 'Paid to Aung Zaw Oo for Vr No-11172,11184\r\n', 3000000, 15732900, 0, 0, '0000-00-00'),
(448, '0000-00-00', '4000/S01', '963524511', 0, '2024-02-14', 'Dr-Feb 24/209', 'Paid to Shwe Late for Vr No-10902,10923,10937,10941\r\n', 6000000, 168523350, 0, 0, '0000-00-00'),
(449, '0000-00-00', '4000/001', '694483570', 0, '2024-02-14', 'Dr-Feb 24/210', 'Paid to 4 Zaw for Vr No-11054\r\n', 6000000, 142321000, 0, 0, '0000-00-00'),
(450, '0000-00-00', '4000/T08', '757327909', 0, '2024-02-15', 'Dr-Feb 24/239', 'Paid to Than Than Myint for Vr No\r\n', 4000000, 36999350, 0, 0, '0000-00-00'),
(451, '0000-00-00', '4000/M01', '154455464', 0, '2024-02-15', 'Dr-Feb 24/240', 'Paid to MA for Vr No-10586,10603,10757\r\n', 5370700, 9370700, 0, 0, '0000-00-00'),
(452, '0000-00-00', '4000/T01', '613006234', 0, '2024-02-15', 'Dr-Feb 24/241', 'Paid to Thet Paing for Vr No-11327 \r\n', 4000000, 28037500, 0, 0, '0000-00-00'),
(453, '0000-00-00', '4000/K06', '515254889', 0, '2024-02-15', 'Dr-Feb 24/242', 'Paid to Ka Yin Lay for Vr No-11372\r\n', 565400, 93500, 0, 0, '0000-00-00'),
(454, '0000-00-00', '4000/Z01', '659017495', 0, '2024-02-15', 'Dr-Feb 24/243', 'Paid to Zaw Zaw Latt for Vr No-11008,11191\r\n', 6000000, 68350800, 0, 0, '0000-00-00'),
(459, '2024-02-26', '4000/k08', '11418', 3237600, '0000-00-00', '', '', 0, 23873600, 328, 0, '0000-00-00'),
(460, '2024-02-26', '4000/k08', '11418', 760000, '0000-00-00', '', '', 0, 24633600, 329, 0, '0000-00-00'),
(461, '2024-02-26', '4000/k08', '11418', 811800, '0000-00-00', '', '', 0, 25445400, 330, 0, '0000-00-00'),
(462, '2024-02-26', '4000/k09', '11419', 2536500, '0000-00-00', '', '', 0, 2536500, 331, 14110200, '2024-03-23'),
(463, '2024-02-26', '4000/k09', '11419', 5258400, '0000-00-00', '', '', 0, 7794900, 332, 0, '0000-00-00'),
(464, '2024-02-26', '4000/Z03', '11420', 945300, '0000-00-00', '', '', 0, 36146700, 333, 0, '0000-00-00'),
(465, '2024-02-26', '4000/Z03', '11420', 25800, '0000-00-00', '', '', 0, 36172500, 334, 0, '0000-00-00'),
(466, '2024-02-26', '4000/Z03', '11420', 242550, '0000-00-00', '', '', 0, 36415050, 335, 0, '0000-00-00'),
(467, '2024-02-26', '4000/Z03', '11420', 232000, '0000-00-00', '', '', 0, 36647050, 336, 0, '0000-00-00'),
(468, '2024-02-26', '4000/Z03', '11420', 1393600, '0000-00-00', '', '', 0, 38040650, 337, 0, '0000-00-00'),
(469, '2024-02-26', '4000/Z03', '11420', 690900, '0000-00-00', '', '', 0, 38731550, 338, 0, '0000-00-00'),
(470, '2024-02-26', '4000/Z03', '11420', 385000, '0000-00-00', '', '', 0, 39116550, 339, 0, '0000-00-00'),
(471, '2024-02-26', '4000/Z03', '11420', 2402400, '0000-00-00', '', '', 0, 41518950, 340, 0, '0000-00-00'),
(472, '2024-02-26', '4000/Z03', '11420', 2472750, '0000-00-00', '', '', 0, 43991700, 341, 0, '0000-00-00'),
(473, '2024-02-26', '4000/Z03', '11420', 1535600, '0000-00-00', '', '', 0, 45527300, 342, 0, '0000-00-00'),
(474, '2024-02-26', '4000/Y01', '11421', 804600, '0000-00-00', '', '', 0, 18502500, 343, 0, '0000-00-00'),
(475, '2024-02-26', '4000/T11', '11422', 3253250, '0000-00-00', '', '', 0, 1397293015, 344, 0, '0000-00-00'),
(476, '2024-02-26', '4000/S04', '11423', 3489750, '0000-00-00', '', '', 0, 73354550, 345, 0, '0000-00-00'),
(478, '2024-02-26', '4000/T07', '11424', 1774800, '0000-00-00', '', '', 0, 25498530, 347, 0, '0000-00-00'),
(479, '2024-02-26', '4000/T07', '11424', 1519050, '0000-00-00', '', '', 0, 27017580, 348, 0, '0000-00-00'),
(480, '2024-02-26', '4000/T07', '11424', 1031800, '0000-00-00', '', '', 0, 28049380, 349, 0, '0000-00-00'),
(481, '2024-02-26', '4000/T07', '11424', 1128800, '0000-00-00', '', '', 0, 29178180, 350, 0, '0000-00-00'),
(482, '2024-02-27', '4000/T05', '11427', 8341080, '0000-00-00', '', '', 0, 1077636415, 351, 0, '0000-00-00'),
(483, '2024-02-27', '4000/T05', '11427', 12839155, '0000-00-00', '', '', 0, 1090475570, 352, 0, '0000-00-00'),
(484, '2024-02-27', '4000/T05', '11427', 1088340, '0000-00-00', '', '', 0, 1091563910, 353, 0, '0000-00-00'),
(485, '2024-02-27', '4000/T05', '11427', 26445, '0000-00-00', '', '', 0, 1091590355, 354, 0, '0000-00-00'),
(486, '2024-02-27', '4000/T05', '11427', 201840, '0000-00-00', '', '', 0, 1091792195, 355, 0, '0000-00-00'),
(487, '2024-02-27', '4000/T05', '11427', 707490, '0000-00-00', '', '', 0, 1092499685, 356, 0, '0000-00-00'),
(488, '2024-02-27', '4000/T05', '11427', 132240, '0000-00-00', '', '', 0, 1092631925, 357, 0, '0000-00-00'),
(489, '2024-02-27', '4000/T05', '11427', 551000, '0000-00-00', '', '', 0, 1093182925, 358, 0, '0000-00-00'),
(490, '2024-02-27', '4000/T05', '11427', 82490, '0000-00-00', '', '', 0, 1093265415, 359, 0, '0000-00-00'),
(491, '2024-02-27', '4000/S03', '11429', 1279000, '0000-00-00', '', '', 0, 466407387, 360, 0, '0000-00-00'),
(492, '2024-02-27', '4000/S03', '11429', 9801090, '0000-00-00', '', '', 0, 476208477, 361, 0, '0000-00-00'),
(493, '2024-02-27', '4000/S03', '11429', 313500, '0000-00-00', '', '', 0, 476521977, 362, 0, '0000-00-00'),
(494, '2024-02-27', '4000/Z03', '11430', 408900, '0000-00-00', '', '', 0, 45936200, 363, 0, '0000-00-00'),
(495, '2024-02-27', '4000/Z03', '11430', 1439550, '0000-00-00', '', '', 0, 47375750, 364, 0, '0000-00-00'),
(496, '2024-02-27', '4000/Z03', '11430', 2240700, '0000-00-00', '', '', 0, 49616450, 365, 0, '0000-00-00'),
(497, '2024-02-27', '4000/Z03', '11430', 2222000, '0000-00-00', '', '', 0, 51838450, 366, 0, '0000-00-00'),
(498, '2024-02-27', '4000/Z03', '11430', 379500, '0000-00-00', '', '', 0, 52217950, 367, 0, '0000-00-00'),
(500, '2024-02-27', '4000/Z03', '11430', 788800, '0000-00-00', '', '', 0, 53006750, 369, 0, '0000-00-00'),
(501, '2024-02-27', '4000/Z03', '11430', 3830400, '0000-00-00', '', '', 0, 56837150, 370, 0, '0000-00-00'),
(502, '2024-02-27', '4000/Z03', '11430', 4686650, '0000-00-00', '', '', 0, 61523800, 371, 0, '0000-00-00'),
(503, '2024-02-27', '4000/T02', '11431', 1855650, '0000-00-00', '', '', 0, 37248850, 372, 0, '0000-00-00'),
(504, '2024-02-27', '4000/T02', '11431', 941850, '0000-00-00', '', '', 0, 38190700, 373, 0, '0000-00-00'),
(505, '2024-02-27', '4000/T02', '11431', 2557500, '0000-00-00', '', '', 0, 40748200, 374, 0, '0000-00-00'),
(506, '2024-02-27', '4000/T02', '11431', 1086750, '0000-00-00', '', '', 0, 41834950, 375, 0, '0000-00-00'),
(507, '2024-02-27', '4000/T02', '11431', 981500, '0000-00-00', '', '', 0, 42816450, 376, 0, '0000-00-00'),
(508, '2024-02-27', '4000/001', '11432', 3181750, '0000-00-00', '', '', 0, 145502750, 377, 0, '0000-00-00'),
(509, '2024-02-28', '4000/G02', '11433', 2572625, '0000-00-00', '', '', 0, 2572625, 378, 3092025, '2024-03-23'),
(510, '2024-02-28', '4000/G02', '11433', 519400, '0000-00-00', '', '', 0, 3092025, 379, 0, '0000-00-00'),
(511, '2024-02-28', '4000/K09', '11434', 1311000, '0000-00-00', '', '', 0, 9105900, 380, 0, '0000-00-00'),
(512, '2024-02-28', '4000/K09', '11434', 5004300, '0000-00-00', '', '', 0, 14110200, 381, 0, '0000-00-00'),
(513, '2024-02-28', '4000/T12', '11435', 4676400, '0000-00-00', '', '', 0, 4676400, 382, 8525400, '2024-03-23'),
(514, '2024-02-28', '4000/T12', '11435', 3849000, '0000-00-00', '', '', 0, 8525400, 383, 0, '0000-00-00'),
(515, '2024-02-28', '4000/T11', '11436', 3861000, '0000-00-00', '', '', 0, 1401154015, 384, 0, '0000-00-00'),
(516, '2024-02-28', '4000/T07', '11437', 1953300, '0000-00-00', '', '', 0, 31131480, 385, 0, '0000-00-00'),
(517, '2024-02-28', '4000/T07', '11437', 637200, '0000-00-00', '', '', 0, 31768680, 386, 0, '0000-00-00'),
(518, '2024-02-28', '4000/T07', '11437', 191100, '0000-00-00', '', '', 0, 31959780, 387, 0, '0000-00-00');
INSERT INTO `payable` (`id`, `date`, `supplier_id`, `purchase_voucher_no`, `purchase_amount`, `paid_date`, `paid_voucher`, `remark`, `paid_amount`, `balance`, `link_id`, `closing_balance`, `report_date`) VALUES
(519, '2024-02-28', '4000/T07', '11437', 2226400, '0000-00-00', '', '', 0, 34186180, 388, 0, '0000-00-00'),
(520, '2024-02-28', '4000/T05', '11438', 218460, '0000-00-00', '', '', 0, 1093483875, 389, 0, '0000-00-00'),
(521, '2024-02-28', '4000/T05', '11438', 7982660, '0000-00-00', '', '', 0, 1101466535, 390, 0, '0000-00-00'),
(522, '2024-02-28', '4000/T05', '11438', 1004920, '0000-00-00', '', '', 0, 1102471455, 391, 0, '0000-00-00'),
(523, '2024-02-28', '4000/T05', '11438', 1025920, '0000-00-00', '', '', 0, 1103497375, 392, 0, '0000-00-00'),
(524, '2024-02-28', '4000/T05', '11438', 1933500, '0000-00-00', '', '', 0, 1105430875, 393, 0, '0000-00-00'),
(525, '2024-02-28', '4000/T05', '11438', 315150, '0000-00-00', '', '', 0, 1105746025, 394, 0, '0000-00-00'),
(526, '2024-02-28', '4000/T05', '11438', 1618780, '0000-00-00', '', '', 0, 1107364805, 395, 0, '0000-00-00'),
(527, '2024-02-28', '4000/T05', '11438', 375260, '0000-00-00', '', '', 0, 1107740065, 396, 0, '0000-00-00'),
(528, '2024-02-28', '4000/T05', '11438', 883340, '0000-00-00', '', '', 0, 1108623405, 397, 0, '0000-00-00'),
(529, '2024-02-28', '4000/T05', '11438', 150380, '0000-00-00', '', '', 0, 1108773785, 398, 0, '0000-00-00'),
(530, '2024-02-28', '4000/Z03', '11439', 147200, '0000-00-00', '', '', 0, 61671000, 399, 0, '0000-00-00'),
(531, '2024-02-28', '4000/Z03', '11439', 532350, '0000-00-00', '', '', 0, 62203350, 400, 0, '0000-00-00'),
(532, '2024-02-28', '4000/Z03', '11439', 2164100, '0000-00-00', '', '', 0, 64367450, 401, 0, '0000-00-00'),
(534, '2024-02-28', '4000/Z03', '11439', 143000, '0000-00-00', '', '', 0, 64510450, 403, 0, '0000-00-00'),
(535, '2024-02-28', '4000/Z03', '11439', 2030400, '0000-00-00', '', '', 0, 66540850, 404, 0, '0000-00-00'),
(536, '2024-02-28', '4000/Z03', '11439', 384300, '0000-00-00', '', '', 0, 66925150, 405, 0, '0000-00-00'),
(537, '2024-02-28', '4000/Z03', '11439', 1105500, '0000-00-00', '', '', 0, 68030650, 406, 0, '0000-00-00'),
(538, '2024-02-28', '4000/Z03', '11439', 1676400, '0000-00-00', '', '', 0, 69707050, 407, 0, '0000-00-00'),
(539, '2024-02-28', '4000/K08', '11440', 1172300, '0000-00-00', '', '', 0, 26617700, 408, 0, '0000-00-00'),
(540, '2024-02-28', '4000/K08', '11440', 4512000, '0000-00-00', '', '', 0, 31129700, 409, 0, '0000-00-00'),
(541, '2024-02-28', '4000/K08', '11440', 4500000, '0000-00-00', '', '', 0, 35629700, 410, 0, '0000-00-00'),
(542, '2024-02-28', '4000/K08', '11440', 468600, '0000-00-00', '', '', 0, 36098300, 411, 0, '0000-00-00'),
(543, '2024-02-28', '4000/B01', '11441', 450000, '0000-00-00', '', '', 0, 67161800, 412, 0, '0000-00-00'),
(544, '2024-02-28', '4000/B01', '11441', 1960200, '0000-00-00', '', '', 0, 69122000, 413, 0, '0000-00-00'),
(545, '2024-02-28', '4000/B01', '11441', 7766000, '0000-00-00', '', '', 0, 76888000, 414, 0, '0000-00-00'),
(546, '2024-02-28', '4000/B01', '11441', 6530400, '0000-00-00', '', '', 0, 83418400, 415, 0, '0000-00-00'),
(547, '2024-02-29', '4000/P01', '11442', 1017900, '0000-00-00', '', '', 0, 5769250, 416, 0, '0000-00-00'),
(548, '2024-02-29', '4000/P01', '11442', 413400, '0000-00-00', '', '', 0, 6182650, 417, 0, '0000-00-00'),
(549, '2024-02-29', '4000/W01', '11443', 1754500, '0000-00-00', '', '', 0, 1754500, 418, 0, '0000-00-00'),
(550, '2024-02-29', '4000/T05', '11444', 9505980, '0000-00-00', '', '', 0, 1118279765, 419, 0, '0000-00-00'),
(551, '2024-02-29', '4000/T05', '11444', 15270395, '0000-00-00', '', '', 0, 1133550160, 420, 0, '0000-00-00'),
(552, '2024-02-29', '4000/T05', '11444', 5958710, '0000-00-00', '', '', 0, 1139508870, 421, 0, '0000-00-00'),
(553, '2024-02-29', '4000/T05', '11444', 155595, '0000-00-00', '', '', 0, 1139664465, 422, 0, '0000-00-00'),
(554, '2024-02-29', '4000/T05', '11444', 1330060, '0000-00-00', '', '', 0, 1140994525, 423, 0, '0000-00-00'),
(555, '2024-02-29', '4000/T05', '11444', 2050570, '0000-00-00', '', '', 0, 1143045095, 424, 0, '0000-00-00'),
(556, '2024-02-29', '4000/T05', '11444', 1032640, '0000-00-00', '', '', 0, 1144077735, 425, 0, '0000-00-00'),
(557, '2024-02-29', '4000/T05', '11444', 1770000, '0000-00-00', '', '', 0, 1145847735, 426, 0, '0000-00-00'),
(558, '2024-02-29', '4000/S03', '11445', 2279760, '0000-00-00', '', '', 0, 478801737, 427, 0, '0000-00-00'),
(559, '2024-02-29', '4000/S03', '11445', 1932160, '0000-00-00', '', '', 0, 480733897, 428, 0, '0000-00-00'),
(560, '2024-02-29', '4000/S03', '11445', 4441000, '0000-00-00', '', '', 0, 485174897, 429, 0, '0000-00-00'),
(561, '2024-02-29', '4000/S03', '11445', 10617950, '0000-00-00', '', '', 0, 495792847, 430, 0, '0000-00-00'),
(562, '2024-02-29', '4000/S03', '11445', 8274000, '0000-00-00', '', '', 0, 504066847, 431, 0, '0000-00-00'),
(563, '2024-02-29', '4000/S03', '11445', 11020330, '0000-00-00', '', '', 0, 515087177, 432, 0, '0000-00-00'),
(564, '0000-00-00', '4000/K05', '121969279', 0, '2024-02-15', 'Dr-Feb 24/251', 'Paid to Kyaw Zay Ya for Vr No-11097\r\n', 9000000, 242910900, 0, 0, '0000-00-00'),
(565, '0000-00-00', '4000/A05', '683138576', 0, '2024-02-15', 'Dr-Feb 24/252', 'Paid to Aung Myo Min for Vr No-11052\r\n', 5000000, 109481600, 0, 0, '0000-00-00'),
(566, '0000-00-00', '4000/T02', '795897255', 0, '2024-02-20', 'Dr-Feb 24/321', 'Paid to Thein Htay for Vr No-11359,11366 (Cheque No-052406)', 4000000, 45546100, 0, 0, '0000-00-00'),
(567, '0000-00-00', '4000/H02', '234027313', 0, '2024-02-20', 'Dr-Feb 24/322', 'Paid to Htay Win for Vr No-11010,11011,11060 (Cheque No-052407)', 3000000, 21432300, 0, 0, '0000-00-00'),
(568, '0000-00-00', '4000/Z03', '769462339', 0, '2024-02-20', 'Dr-Feb 24/323', 'Paid to Zaw Myat Thu for Vr No-11361,11376 (Cheque No-052408)', 10000000, 59707050, 0, 0, '0000-00-00'),
(570, '2024-03-28', '4000/C01', '11356', 700000, '0000-00-00', '', '', 0, 700000, 434, 0, '0000-00-00');

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
(1, 1, 'manage_accounts,manage_role,manage_sale,manage_purchase,manage_cashbook,manage_acpayable,manage_accountreceivable,manage_transactionmanage_general_ledger,manage_customers,manage_supplier,manage_coldstoreitem,manage_item,manage_actype,manage_acname,manage_coldstorecharges,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport,manage_shippmentexport,manage_truckexport,manage_packingmaterial,sale_report,purchase_report,payable_report,manage_mcreport,manage_tclmcstock'),
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
(108, '2024-02-07', 11367, '4000/T07', 'frozen', '1020', '3up', '30.8', 12, 19500, 600600),
(109, '2024-02-07', 11367, '4000/T07', 'frozen', '1010', 'J', '171.5', 0, 5300, 908950),
(110, '2024-02-08', 11368, '4000/T07', 'frozen', '1010', 'J', '236.75', 0, 5300, 1254775),
(111, '2024-02-08', 11368, '4000/T07', 'frozen', '1020', '5up', '10.3', 3, 21000, 216300),
(112, '2024-02-08', 11368, '4000/T07', 'frozen', '1020', '3up', '32.7', 13, 19500, 637650),
(113, '2024-02-08', 11369, '4000/T02', 'frozen', '1001', '3up', '17.7', 6, 44000, 778800),
(114, '2024-02-08', 11369, '4000/T02', 'frozen', '1001', '2up', '18.2', 12, 34000, 618800),
(115, '2024-02-08', 11369, '4000/T02', 'frozen', '1001', '1.5up', '43.1', 41, 27000, 1163700),
(116, '2024-02-08', 11369, '4000/T02', 'frozen', '1001', '1up', '29.8', 36, 24000, 715200),
(117, '2024-02-08', 11369, '4000/T02', 'frozen', '1002', '3up', '31.4', 16, 34000, 1067600),
(118, '2024-02-08', 11369, '4000/T02', 'frozen', '1002', '2up', '48.1', 31, 32000, 1539200),
(119, '2024-02-08', 11369, '4000/T02', 'frozen', '1016', 'J', '1.4', 1, 11500, 16100),
(120, '2024-02-08', 11370, '4000/T05', 'frozen', '1031', '3up', '88', 31, 6800, 598400),
(121, '2024-02-08', 11370, '4000/T05', 'frozen', '1031', '4up', '1346.4', 433, 10200, 13733280),
(122, '2024-02-08', 11370, '4000/T05', 'frozen', '1031', '5up', '678.9', 183, 10200, 6924780),
(123, '2024-02-08', 11370, '4000/T05', 'frozen', '1031', '6up', '266.3', 60, 10200, 2716260),
(124, '2024-02-09', 11371, '4000/T05', 'frozen', '1017', '2up', '8', 0, 5800, 46400),
(125, '2024-02-09', 11371, '4000/T05', 'frozen', '1017', '3up', '413.75', 0, 6300, 2606625),
(126, '2024-02-09', 11371, '4000/T05', 'frozen', '1031', '4up', '759.25', 0, 10200, 7744350),
(127, '2024-02-09', 11371, '4000/T05', 'frozen', '1031', '5/6up', '1351.25', 0, 10200, 13782750),
(128, '2024-02-10', 11375, '4000/T05', 'frozen', '1031', '4up', '636.6', 0, 10200, 6493320),
(129, '2024-02-10', 11375, '4000/T05', 'frozen', '1031', '5up', '500.3', 0, 10200, 5103060),
(130, '2024-02-10', 11375, '4000/T05', 'frozen', '1031', '6up', '175.2', 0, 10200, 1787040),
(131, '2024-02-10', 11375, '4000/T05', 'frozen', '1023', '2up', '354.1', 0, 11000, 3895100),
(132, '2024-02-10', 11375, '4000/T05', 'frozen', '1023', '3up', '114', 0, 15000, 1710000),
(133, '2024-02-10', 11375, '4000/T05', 'frozen', '1023', '4up', '5.7', 0, 16500, 94050),
(134, '2024-02-10', 11375, '4000/T05', 'frozen', '1017', '2up', '3.9', 0, 5800, 22620),
(135, '2024-02-10', 11375, '4000/T05', 'frozen', '1017', '3up', '66.2', 0, 6300, 417060),
(136, '2024-02-11', 11372, '4000/K06', 'frozen', '1016', '8/10', '51.4', 1, 11000, 565400),
(137, '2024-02-11', 11373, '4000/T07', 'frozen', '1020', '3up', '56.15', 22, 19500, 1094925),
(138, '2024-02-11', 11373, '4000/T07', 'frozen', '1020', '5up', '51.6', 11, 21000, 1083600),
(139, '2024-02-11', 11373, '4000/T07', 'frozen', '1010', 'J', '252', 0, 5300, 1335600),
(140, '2024-02-12', 11374, '4000/T07', 'frozen', '1010', 'J', '219.5', 0, 5300, 1163350),
(141, '2024-02-13', 11376, '4000/Z03', 'Frozen', '1001', '1up', '30.5', 26, 23000, 701500),
(142, '2024-02-13', 11376, '4000/Z03', 'Frozen', '1001', '2up', '46.9', 27, 33000, 1547700),
(143, '2024-02-13', 11376, '4000/Z03', 'Frozen', '1001', '2 D', '23.9', 20, 31500, 752850),
(144, '2024-02-13', 11376, '4000/Z03', 'Frozen', '1001', '3up', '54', 19, 43000, 2322000),
(145, '2024-02-13', 11376, '4000/Z03', 'Frozen', '1002', '2up', '65.6', 43, 31000, 2033600),
(146, '2024-02-13', 11376, '4000/Z03', 'Frozen', '1002', '2 D', '42.9', 36, 29000, 1244100),
(147, '2024-02-13', 11376, '4000/Z03', 'Frozen', '1002', '3up', '53.8', 17, 32500, 1748500),
(148, '2024-02-13', 11377, '4000/T05', 'Frozen', '1031', '2up', '671.7', 0, 6600, 4433220),
(149, '2024-02-13', 11377, '4000/T05', 'Frozen', '1031', '3up', '2395.8', 0, 6700, 160518860),
(150, '2024-02-13', 11377, '4000/T05', 'Frozen', '1031', '4up', '3585.3', 0, 10000, 35853000),
(151, '2024-02-13', 11377, '4000/T05', 'Frozen', '1023', '3up', '130.3', 0, 15000, 1954500),
(152, '2024-02-13', 11377, '4000/T05', 'Frozen', '1023', '4up', '121.7', 0, 16500, 2008050),
(153, '2024-02-14', 11378, '4000/T05', 'Frozen', '1017', '2up', '22', 0, 5800, 127600),
(154, '2024-02-14', 11378, '4000/T05', 'Frozen', '1017', '3up', '728.5', 0, 6300, 4589550),
(155, '2024-02-14', 11378, '4000/T05', 'Frozen', '1023', '4up', '101.5', 0, 16500, 1674750),
(156, '2024-02-14', 11378, '4000/T05', 'Frozen', '1023', '5/6 up', '235', 0, 17000, 3995000),
(157, '2024-02-14', 11379, '4000/T05', 'Frozen', '1031', '2up', '475.2', 0, 6600, 3136320),
(158, '2024-02-14', 11379, '4000/T05', 'Frozen', '1031', '3up', '1572.4', 0, 6700, 10535080),
(159, '2024-02-14', 11379, '4000/T05', 'Frozen', '1031', '4up', '4362.2', 0, 9900, 43185780),
(160, '2024-02-14', 11379, '4000/T05', 'Frozen', '1031', '5up', '809.5', 0, 9900, 8014050),
(161, '2024-02-14', 11379, '4000/T05', 'Frozen', '1031', '6up', '92.5', 0, 9900, 915750),
(162, '2024-02-14', 11379, '4000/T05', 'Frozen', '1023', '3up', '45.9', 0, 15000, 688500),
(163, '2024-02-14', 11379, '4000/T05', 'Frozen', '1023', '4up', '29.9', 0, 16500, 493350),
(164, '2024-02-14', 11379, '4000/T05', 'Frozen', '1023', '5up', '17.1', 0, 17000, 290700),
(165, '2024-02-14', 11380, '4000/S03', 'Frozen', '1031', '3up', '383', 0, 6700, 2566100),
(166, '2024-02-14', 11380, '4000/S03', 'Frozen', '1031', '4up', '2144.7', 0, 10000, 21447000),
(167, '2024-02-14', 11380, '4000/S03', 'Frozen', '1031', '5up', '1941.4', 0, 10000, 19414000),
(168, '2024-02-14', 11380, '4000/S03', 'Frozen', '1031', '6up', '804.9', 0, 10000, 8049000),
(169, '2024-02-15', 11381, '4000/K06', 'Frozen', '1016', 'J', '8.5', 10, 11000, 93500),
(170, '2024-02-15', 11381, '4000/T02', 'Frozen', '1001', '3up', '28.2', 12, 44000, 1240800),
(171, '2024-02-15', 11382, '4000/T02', 'Frozen', '1001', '2up', '27.7', 19, 34000, 941800),
(172, '2024-02-15', 11382, '4000/T02', 'Frozen', '1001', '1.5up', '117.2', 115, 27000, 3164400),
(173, '2024-02-15', 11382, '4000/T02', 'Frozen', '1002', '3up', '26.2', 11, 34000, 890800),
(174, '2024-02-15', 11382, '4000/T02', 'Frozen', '1002', '2up', '75.5', 51, 32000, 2416000),
(175, '2024-02-15', 11382, '4000/T02', 'Frozen', '1016', 'J', '2.4', 2, 11500, 27600),
(176, '2024-02-15', 11383, '4000/T06', 'Frozen', '1030', '2up', '420.7', 0, 17300, 7278110),
(177, '2024-02-15', 11384, '4000/T05', 'Frozen', '1031', '2up', '1204', 0, 6600, 7946400),
(178, '2024-02-15', 11384, '4000/T05', 'Frozen', '1031', '3up', '3287.8', 0, 6700, 22028260),
(179, '2024-02-15', 11384, '4000/T05', 'Frozen', '1031', '4up', '1498', 0, 9900, 14830200),
(180, '2024-02-15', 11384, '4000/T05', 'Frozen', '1031', '5up', '1093.7', 0, 9900, 10827630),
(181, '2024-02-16', 11385, '4000/S03', 'Frozen', '1031', '2up', '24.7', 0, 6550, 161785),
(182, '2024-02-16', 11385, '4000/S03', 'Frozen', '1031', '3up', '1034.1', 0, 6700, 6928470),
(183, '2024-02-16', 11385, '4000/S03', 'Frozen', '1031', '4up', '1848.6', 0, 10000, 18486000),
(184, '2024-02-16', 11385, '4000/S03', 'Frozen', '1031', '5up', '2593.5', 0, 10000, 25935000),
(185, '2024-02-16', 11386, '4000/T05', 'Frozen', '1031', '2up', '739.5', 0, 6600, 4880700),
(186, '2024-02-16', 11386, '4000/T05', 'Frozen', '1031', '3up', '1798.8', 0, 6700, 12051960),
(187, '2024-02-16', 11386, '4000/T05', 'Frozen', '1031', '4up', '991.8', 0, 9900, 9818820),
(188, '2024-02-16', 11386, '4000/T05', 'Frozen', '1031', '5up', '512.3', 0, 9900, 5071770),
(189, '2024-02-16', 11386, '4000/T05', 'Frozen', '1023', '3up', '124.8', 0, 15000, 1872000),
(190, '2024-02-16', 11386, '4000/T05', 'Frozen', '1023', '4up', '44', 0, 16500, 726000),
(191, '2024-02-16', 11386, '4000/T05', 'Frozen', '1023', '5up', '16.2', 0, 17000, 275400),
(192, '2024-02-16', 11386, '4000/T05', 'Frozen', '1023', '6up', '5.1', 0, 17000, 86700),
(193, '2024-02-16', 11386, '4000/T07', 'Frozen', '1020', '3up', '85.6', 35, 19500, 1669200),
(194, '2024-02-16', 11387, '4000/T07', 'Frozen', '1020', '5up', '38', 9, 21000, 798000),
(195, '2024-02-16', 11388, '4000/B01', 'Frozen', '1002', '3/4up', '120.25', 49, 34000, 4088500),
(196, '2024-02-16', 11388, '4000/B01', 'Frozen', '1002', '2up', '103', 74, 31500, 3244500),
(197, '2024-02-16', 11388, '4000/B01', 'Frozen', '1001', '3up', '23', 8, 44000, 1012000),
(198, '2024-02-16', 11388, '4000/B01', 'Frozen', '1001', '2up', '8.5', 6, 34000, 289000),
(199, '2024-02-16', 11388, '4000/B01', 'Frozen', '1020', '2up', '48.4', 43, 18000, 871200),
(200, '2024-02-16', 11388, '4000/B01', 'Frozen', '1020', '3/4up', '51', 38, 21000, 1071000),
(201, '2024-02-16', 11388, '4000/B01', 'Frozen', '1020', '5up', '187.2', 42, 23000, 4305600),
(202, '2024-02-16', 11411, '4000/S03', 'Frozen', '1023', '1up', '20.1', 0, 10500, 211050),
(203, '2024-02-16', 11411, '4000/S03', 'Frozen', '1023', '2up', '658.4', 0, 11700, 7703280),
(204, '2024-02-16', 11411, '4000/S03', 'Frozen', '1023', '3up', '171.5', 0, 15000, 2572500),
(205, '2024-02-16', 11411, '4000/S03', 'Frozen', '1023', '4up', '225.8', 0, 16500, 3725700),
(206, '2024-02-17', 11389, '4000/T05', 'Frozen', '1031', '2up', '66.8', 0, 6600, 440880),
(207, '2024-02-17', 11389, '4000/T05', 'Frozen', '1031', '3up', '3611.4', 0, 6700, 24196380),
(208, '2024-02-17', 11389, '4000/T05', 'Frozen', '1031', '4up', '803', 0, 9900, 7949700),
(209, '2024-02-17', 11389, '4000/T05', 'Frozen', '1031', '5up', '466.3', 0, 9900, 4616370),
(210, '2024-02-17', 11389, '4000/T05', 'Frozen', '1023', '3up', '489.8', 0, 15000, 7347000),
(211, '2024-02-17', 11389, '4000/T05', 'Frozen', '1023', '4up', '112', 0, 16500, 1848000),
(212, '2024-02-17', 11389, '4000/T05', 'Frozen', '1023', '5/6 up', '40.8', 0, 17000, 693600),
(213, '2024-02-17', 11390, '4000/S03', 'Frozen', '1031', '3up', '914.8', 0, 6700, 6129160),
(214, '2024-02-17', 11390, '4000/S03', 'Frozen', '1031', '4up', '1714.8', 0, 10000, 17148000),
(215, '2024-02-17', 11390, '4000/S03', 'Frozen', '1031', '5up', '2891', 0, 10000, 28910000),
(216, '2024-02-18', 11391, '4000/S03', 'Frozen', '1023', '2up', '255.6', 0, 11700, 2990520),
(217, '2024-02-18', 11391, '4000/S03', 'Frozen', '1023', '3up', '453.9', 0, 15000, 6808500),
(218, '2024-02-18', 11391, '4000/S03', 'Frozen', '1023', '4up', '238.6', 0, 16500, 3936900),
(219, '2024-02-18', 11391, '4000/S03', 'Frozen', '1023', '1up', '7.8', 0, 10500, 81900),
(220, '2024-02-18', 11392, '4000/S03', 'Frozen', '1031', '3up', '737.3', 0, 6700, 4939910),
(221, '2024-02-18', 11392, '4000/S03', 'Frozen', '1031', '4up', '1588.5', 0, 10000, 15885000),
(222, '2024-02-18', 11392, '4000/S03', 'Frozen', '1031', '5up', '2798.5', 0, 10000, 27985000),
(223, '2024-02-19', 11392, '4000/T07', 'Frozen', '1020', '2up', '72.7', 0, 17500, 1272250),
(224, '2024-02-19', 11393, '4000/T07', 'Frozen', '1020', '3up', '56', 0, 19500, 1092000),
(225, '2024-02-19', 11393, '4000/T07', 'Frozen', '1020', '5up', '26.4', 0, 21000, 554400),
(226, '2024-02-19', 11394, '4000/Z03', 'Frozen', '1001', '1 D', '23', 0, 21500, 494500),
(227, '2024-02-19', 11394, '4000/Z03', 'Frozen', '1001', '1up', '18', 0, 23000, 414000),
(228, '2024-02-19', 11394, '4000/Z03', 'Frozen', '1001', '2 D', '7.3', 0, 31500, 229950),
(229, '2024-02-19', 11394, '4000/Z03', 'Frozen', '1001', '2up', '25.3', 0, 33000, 834900),
(230, '2024-02-19', 11394, '4000/Z03', 'Frozen', '1001', '3up', '64.7', 0, 43000, 2782100),
(231, '2024-02-19', 11394, '4000/Z03', 'Frozen', '1002', '1up', '19.6', 0, 22000, 431200),
(232, '2024-02-19', 11394, '4000/Z03', 'Frozen', '1002', '2 D', '8.3', 0, 29000, 240700),
(233, '2024-02-19', 11394, '4000/Z03', 'Frozen', '1002', '2up', '27.5', 0, 31000, 852500),
(234, '2024-02-19', 11394, '4000/Z03', 'Frozen', '1002', '3up', '53.1', 0, 32500, 1725750),
(235, '2024-02-19', 11398, '4000/S03', 'Frozen', '1023', '2up', '10.4', 0, 11700, 121680),
(236, '2024-02-19', 11398, '4000/S03', 'Frozen', '1023', '3up', '471.4', 0, 15000, 7071000),
(237, '2024-02-19', 11398, '4000/S03', 'Frozen', '1023', '4up', '463.8', 0, 16700, 7745460),
(238, '2024-02-19', 11398, '4000/S03', 'Frozen', '1017', '1up', '2.7', 0, 5000, 13500),
(239, '2024-02-19', 11398, '4000/S03', 'Frozen', '1017', '2up', '246', 0, 5900, 1451400),
(240, '2024-02-19', 11398, '4000/S03', 'Frozen', '1017', '3up', '74.3', 0, 6400, 475520),
(241, '2024-02-20', 11395, '4000/T02', 'Frozen', '1001', '3up', '24.6', 11, 44500, 1094700),
(242, '2024-02-20', 11395, '4000/T02', 'Frozen', '1001', '2up', '24.6', 17, 34500, 848700),
(243, '2024-02-20', 11395, '4000/T02', 'Frozen', '1001', '1.5up', '60.1', 58, 27500, 1652750),
(244, '2024-02-20', 11395, '4000/T02', 'Frozen', '1002', '3up', '62.3', 29, 34500, 2149350),
(245, '2024-02-20', 11395, '4000/T02', 'Frozen', '1002', '2up', '60.2', 40, 32500, 1956500),
(246, '2024-02-20', 11396, '4000/S03', 'Frozen', '1031', '2up', '39.9', 0, 6500, 259350),
(247, '2024-02-20', 11396, '4000/S03', 'Frozen', '1031', '3up', '945.3', 0, 6700, 6333510),
(248, '2024-02-20', 11396, '4000/S03', 'Frozen', '1031', '4up', '1641', 0, 10000, 16410000),
(249, '2024-02-20', 11396, '4000/S03', 'Frozen', '1031', '5up', '2386', 0, 10000, 23860000),
(250, '2024-02-20', 11396, '4000/S03', 'Frozen', '1023', '2up', '64.9', 0, 11700, 759330),
(251, '2024-02-20', 11396, '4000/S03', 'Frozen', '1023', '3up', '300.4', 0, 15000, 4506000),
(252, '2024-02-20', 11396, '4000/S03', 'Frozen', '1023', '4up', '279.2', 0, 16700, 4662640),
(253, '2024-02-20', 11397, '4000/T05', 'Frozen', '1023', '2up', '9.4', 0, 11000, 103400),
(254, '2024-02-20', 11397, '4000/T05', 'Frozen', '1023', '3up', '693.2', 0, 15000, 10398000),
(255, '2024-02-20', 11397, '4000/T05', 'Frozen', '1023', '4up', '392', 0, 16500, 6468000),
(256, '2024-02-20', 11397, '4000/T05', 'Frozen', '1023', '5up', '70.7', 0, 17000, 1201900),
(257, '2024-02-20', 11397, '4000/T05', 'Frozen', '1017', '2up', '75.2', 0, 5800, 436160),
(258, '2024-02-21', 11399, '4000/P02', 'Frozen', '1006', 'J', '3500', 0, 3300, 11550000),
(259, '2024-02-21', 11400, '4000/K08', 'Frozen', '1020', '2up', '80.8', 0, 19000, 1535200),
(260, '2024-02-21', 11400, '4000/K08', 'Frozen', '1020', '3up', '205.4', 0, 20000, 4108000),
(261, '2024-02-21', 11401, '4000/T05', 'Frozen', '1023', '1up', '9.8', 0, 10000, 98000),
(262, '2024-02-21', 11401, '4000/T05', 'Frozen', '1023', '2up', '23.5', 0, 11000, 258500),
(263, '2024-02-21', 11401, '4000/T05', 'Frozen', '1023', '3up', '12.7', 0, 15000, 190500),
(264, '2024-02-21', 11402, '4000/T05', 'Frozen', '1023', '3up', '953', 0, 15000, 14295000),
(265, '2024-02-21', 11402, '4000/T05', 'Frozen', '1023', '4up', '131.3', 0, 16500, 2166450),
(266, '2024-02-21', 11402, '4000/T05', 'Frozen', '1023', '5/6up', '21.6', 0, 17000, 367200),
(267, '2024-02-21', 11402, '4000/S03', 'Frozen', '1023', '2up', '12.5', 0, 11700, 146250),
(268, '2024-02-21', 11403, '4000/S03', 'Frozen', '1023', '3up', '390.9', 0, 15000, 5863500),
(269, '2024-02-21', 11403, '4000/S03', 'Frozen', '1023', '4up', '415.4', 0, 16700, 6937180),
(270, '2024-02-21', 11404, '4000/D01', 'Frozen', '1012', 'J', '186', 0, 30000, 5580000),
(271, '2024-02-21', 11404, '4000/D01', 'Frozen', '1012', 'J', '17.25', 0, 22000, 379500),
(272, '2024-02-21', 11404, '4000/D01', 'Frozen', '1012', 'J', '150.25', 0, 27000, 4056750),
(273, '2024-02-21', 11404, '4000/D01', 'Frozen', '1012', 'J', '89.75', 0, 30000, 2692500),
(274, '2024-02-21', 11405, '4000/D02', 'Frozen', '1012', 'J', '14.35', 0, 42000, 602700),
(275, '2024-02-21', 11405, '4000/D02', 'Frozen', '1012', 'J', '22.5', 0, 43500, 978750),
(276, '2024-02-21', 11405, '4000/D02', 'Frozen', '1012', 'J', '201.7', 0, 11000, 2218700),
(277, '2024-02-21', 11405, '4000/D02', 'Frozen', '1012', 'J', '209.25', 0, 17200, 3599100),
(278, '2024-02-22', 11406, '4000/T05', 'Frozen', '1017', '2up', '96.6', 0, 5800, 560280),
(279, '2024-02-22', 11406, '4000/T05', 'Frozen', '1017', '3up', '237.5', 0, 6300, 1496250),
(280, '2024-02-22', 11406, '4000/T05', 'Frozen', '1031', '18/24', '44.7', 0, 6150, 274905),
(281, '2024-02-22', 11406, '4000/T05', 'Frozen', '1031', '2up', '1003', 0, 6600, 6619800),
(282, '2024-02-22', 11406, '4000/T05', 'Frozen', '1031', '3up', '488.8', 0, 6650, 3250520),
(283, '2024-02-22', 11406, '4000/T05', 'Frozen', '1031', '4up', '18.2', 0, 9700, 176540),
(284, '2024-02-22', 11407, '4000/T07', 'Frozen', '1020', '2up', '74.5', 47, 18000, 1341000),
(285, '2024-02-22', 11407, '4000/T07', 'Frozen', '1020', '3up', '54.1', 23, 19500, 1054950),
(286, '2024-02-22', 11408, '4000/K08', 'Frozen', '1020', '1up', '8.9', 0, 15000, 133500),
(287, '2024-02-22', 11408, '4000/K08', 'Frozen', '1020', '2up', '132.4', 0, 19000, 2515600),
(288, '2024-02-22', 11408, '4000/K08', 'Frozen', '1020', '3up', '94.6', 0, 20000, 1892000),
(289, '2024-02-22', 11408, '4000/K08', 'Frozen', '1020', '5up', '22.9', 0, 22000, 503800),
(290, '2024-02-22', 11409, '4000/B01', 'Frozen', '1020', '1up', '4.4', 0, 18000, 79200),
(291, '2024-02-22', 11409, '4000/B01', 'Frozen', '1020', '2up', '63.8', 0, 18000, 1148400),
(292, '2024-02-22', 11409, '4000/B01', 'Frozen', '1020', '3up', '7.2', 0, 22000, 158400),
(293, '2024-02-22', 11409, '4000/B01', 'Frozen', '1020', '5up', '211.9', 0, 24000, 5085600),
(294, '2024-02-22', 11410, '4000/S03', 'Frozen', '1023', '1up', '24.5', 0, 10500, 257250),
(295, '2024-02-22', 11410, '4000/S03', 'Frozen', '1023', '2up', '686.5', 0, 11700, 8032050),
(296, '2024-02-22', 11410, '4000/S03', 'Frozen', '1023', '3up', '30.2', 0, 15000, 453000),
(297, '2024-02-22', 11410, '4000/S03', 'Frozen', '1023', '4up', '260.4', 0, 16700, 4348680),
(298, '2024-02-23', 11412, '4000/K08', 'Frozen', '1020', '2up', '117.4', 0, 19000, 2230600),
(299, '2024-02-23', 11412, '4000/K08', 'Frozen', '1020', '3up', '48.6', 0, 20000, 972000),
(300, '2024-02-23', 11412, '4000/K08', 'Frozen', '1020', '5up', '43.6', 0, 22000, 959200),
(301, '2024-02-23', 11412, '4000/K08', 'Frozen', '1016', 'J', '19.8', 0, 11000, 217800),
(302, '2024-02-23', 11413, '4000/S03', 'Frozen', '1023', '1up', '5.6', 0, 10500, 58800),
(303, '2024-02-23', 11413, '4000/S03', 'Frozen', '1023', '2up', '367.3', 0, 11700, 4297410),
(304, '2024-02-23', 11413, '4000/S03', 'Frozen', '1023', '3up', '1480.5', 0, 15000, 22207500),
(305, '2024-02-23', 11413, '4000/S03', 'Frozen', '1023', '4up', '535.1', 0, 16700, 8936170),
(306, '2024-02-24', 11414, '4000/Z03', 'Frozen', '1002', '2up D', '28.3', 0, 29000, 820700),
(307, '2024-02-24', 11414, '4000/Z03', 'Frozen', '1002', '2up', '134.5', 0, 31500, 4236750),
(308, '2024-02-24', 11414, '4000/Z03', 'Frozen', '1002', '1up', '101.5', 0, 23000, 2334500),
(309, '2024-02-24', 11414, '4000/Z03', 'Frozen', '1001', '1up D', '17.2', 0, 22000, 378400),
(310, '2024-02-24', 11414, '4000/Z03', 'Frozen', '1001', '1up', '175', 0, 23500, 4112500),
(311, '2024-02-24', 11414, '4000/Z03', 'Frozen', '1001', '2up D', '11.1', 0, 31000, 344100),
(312, '2024-02-24', 11414, '4000/Z03', 'Frozen', '1001', '2up', '29.2', 0, 33000, 963600),
(313, '2024-02-24', 11415, '4000/K08', 'Frozen', '1020', '2up', '150.7', 0, 19000, 2863300),
(314, '2024-02-24', 11415, '4000/K08', 'Frozen', '1020', '3up', '130.3', 0, 20000, 2606000),
(315, '2024-02-24', 11415, '4000/K08', 'Frozen', '1020', '6up', '4.5', 0, 22000, 99000),
(316, '2024-02-24', 11416, '4000/T05', 'Frozen', '1031', '18/24', '36.5', 0, 6150, 224475),
(317, '2024-02-24', 11416, '4000/T05', 'Frozen', '1031', '2up', '3931.4', 0, 6600, 25947240),
(318, '2024-02-24', 11416, '4000/T05', 'Frozen', '1031', '3up', '1299.4', 0, 6650, 8641010),
(319, '2024-02-24', 11416, '4000/T05', 'Frozen', '1031', '4up', '673.1', 0, 9700, 6529070),
(320, '2024-02-24', 11416, '4000/T05', 'Frozen', '1023', '2up', '207.1', 0, 11200, 2319520),
(321, '2024-02-24', 11416, '4000/T05', 'Frozen', '1023', '3up', '155.9', 0, 15000, 2338500),
(322, '2024-02-24', 11416, '4000/T05', 'Frozen', '1023', '4up', '37.5', 0, 16500, 618750),
(323, '2024-02-24', 11416, '4000/T05', 'Frozen', '1023', '5/6up', '87.2', 0, 17000, 1482400),
(324, '2024-02-24', 11417, '4000/S03', 'Frozen', '1023', '2up', '705.8', 0, 11700, 8257860),
(325, '2024-02-24', 11417, '4000/S03', 'Frozen', '1023', '3up', '516.9', 0, 15000, 7753500),
(326, '2024-02-24', 11417, '4000/S03', 'Frozen', '1023', '4up', '114.3', 0, 16700, 1908810),
(328, '2024-02-26', 11418, '4000/k08', 'frozen', '1020', '2 up', '170.4', 102, 19000, 3237600),
(329, '2024-02-26', 11418, '4000/k08', 'frozen', '1020', '3 up', '38', 16, 20000, 760000),
(330, '2024-02-26', 11418, '4000/k08', 'frozen', '1020', '5 up', '36.9', 9, 22000, 811800),
(331, '2024-02-26', 11419, '4000/k09', 'frozen', '1020', '2 up', '133.5', 82, 19000, 2536500),
(332, '2024-02-26', 11419, '4000/k09', 'frozen', '1020', '3 up', '250.4', 69, 21000, 5258400),
(333, '2024-02-26', 11420, '4000/Z03', 'frozen', '1002', '1 up', '41.1', 43, 23000, 945300),
(334, '2024-02-26', 11420, '4000/Z03', 'frozen', '1002', '1 D', '1.2', 2, 21500, 25800),
(335, '2024-02-26', 11420, '4000/Z03', 'frozen', '1002', '2 up', '7.7', 5, 31500, 242550),
(336, '2024-02-26', 11420, '4000/Z03', 'frozen', '1002', '2 D', '8', 7, 29000, 232000),
(337, '2024-02-26', 11420, '4000/Z03', 'frozen', '1002', '3 up', '41.6', 14, 33500, 1393600),
(338, '2024-02-26', 11420, '4000/Z03', 'frozen', '1001', '1 up', '29.4', 33, 23500, 690900),
(339, '2024-02-26', 11420, '4000/Z03', 'frozen', '1001', '1 D', '17.5', 30, 22000, 385000),
(340, '2024-02-26', 11420, '4000/Z03', 'frozen', '1001', '2 up', '72.8', 49, 33000, 2402400),
(341, '2024-02-26', 11420, '4000/Z03', 'frozen', '1001', '2 D', '78.5', 67, 31500, 2472750),
(342, '2024-02-26', 11420, '4000/Z03', 'frozen', '1001', '3 up', '34.9', 13, 44000, 1535600),
(343, '2024-02-26', 11421, '4000/Y01', 'frozen', '1015', '5/8', '29.8', 80, 27000, 804600),
(344, '2024-02-26', 11422, '4000/T11', 'frozen', '1015', '5/8', '118.3', 306, 27500, 3253250),
(345, '2024-02-26', 11423, '4000/S04', 'frozen', '1015', '5/8', '129.25', 348, 27000, 3489750),
(347, '2024-02-26', 11424, '4000/T07', 'frozen', '1020', '2 up', '98.6', 63, 18000, 1774800),
(348, '2024-02-26', 11424, '4000/T07', 'frozen', '1020', '3 up', '77.9', 32, 19500, 1519050),
(349, '2024-02-26', 11424, '4000/T07', 'frozen', '1020', '5 up', '46.9', 9, 22000, 1031800),
(350, '2024-02-26', 11424, '4000/T07', 'frozen', '1030', 'J', '66.4', 56, 17000, 1128800),
(351, '2024-02-27', 11427, '4000/T05', 'frozen', '1031', '2 up', '1263.8', 585, 6600, 8341080),
(352, '2024-02-27', 11427, '4000/T05', 'frozen', '1031', '3 up', '1930.7', 959, 6650, 12839155),
(353, '2024-02-27', 11427, '4000/T05', 'frozen', '1031', '4 up', '112.2', 20, 9700, 1088340),
(354, '2024-02-27', 11427, '4000/T05', 'frozen', '1031', '18/24', '4.3', 0, 6150, 26445),
(355, '2024-02-27', 11427, '4000/T05', 'frozen', '1017', '2 up', '34.8', 16, 5800, 201840),
(356, '2024-02-27', 11427, '4000/T05', 'frozen', '1017', '3 up', '112.3', 46, 6300, 707490),
(357, '2024-02-27', 11427, '4000/T05', 'frozen', '1026', '8/10', '22.8', 40, 5800, 132240),
(358, '2024-02-27', 11427, '4000/T05', 'frozen', '1039', '1 up', '95', 128, 5800, 551000),
(359, '2024-02-27', 11427, '4000/T05', 'frozen', '1036', '8/10', '11.3', 20, 7300, 82490),
(360, '2024-02-27', 11429, '4000/S03', 'frozen', '1023', '1 up', '127.9', 92, 10000, 1279000),
(361, '2024-02-27', 11429, '4000/S03', 'frozen', '1023', '2 up', '837.7', 536, 11700, 9801090),
(362, '2024-02-27', 11429, '4000/S03', 'frozen', '1023', '3 up', '20.9', 10, 15000, 313500),
(363, '2024-02-27', 11430, '4000/Z03', 'frozen', '1001', '1 up', '17.4', 16, 23500, 408900),
(364, '2024-02-27', 11430, '4000/Z03', 'frozen', '1001', '2 up D', '45.7', 23, 31500, 1439550),
(365, '2024-02-27', 11430, '4000/Z03', 'frozen', '1001', '2 up', '67.9', 69, 33000, 2240700),
(366, '2024-02-27', 11430, '4000/Z03', 'frozen', '1001', '3 up', '50.5', 63, 44000, 2222000),
(367, '2024-02-27', 11430, '4000/Z03', 'frozen', '1002', '1 up', '16.5', 28, 23000, 379500),
(369, '2024-02-27', 11430, '4000/Z03', 'frozen', '1002', '2 D', '27.2', 43, 29000, 788800),
(370, '2024-02-27', 11430, '4000/Z03', 'frozen', '1002', '2 up', '121.6', 49, 31500, 3830400),
(371, '2024-02-27', 11430, '4000/Z03', 'frozen', '1002', '3 up', '139.9', 20, 33500, 4686650),
(372, '2024-02-27', 11431, '4000/T02', 'frozen', '1001', '3 up', '41.7', 18, 44500, 1855650),
(373, '2024-02-27', 11431, '4000/T02', 'frozen', '1001', '2 up', '27.3', 19, 34500, 941850),
(374, '2024-02-27', 11431, '4000/T02', 'frozen', '1001', '1.5 up', '93', 91, 27500, 2557500),
(375, '2024-02-27', 11431, '4000/T02', 'frozen', '1002', '3 up', '31.5', 13, 34500, 1086750),
(376, '2024-02-27', 11431, '4000/T02', 'frozen', '1002', '2 up', '30.2', 19, 32500, 981500),
(377, '2024-02-27', 11432, '4000/001', 'frozen', '1015', '5/8', '115.7', 317, 27500, 3181750),
(378, '2024-02-28', 11433, '4000/G02', 'frozen', '1015', '5/8', '93.55', 249, 27500, 2572625),
(379, '2024-02-28', 11433, '4000/G02', 'frozen', '1015', '500', '19.6', 57, 26500, 519400),
(380, '2024-02-28', 11434, '4000/K09', 'frozen', '1020', '2 up', '69', 43, 19000, 1311000),
(381, '2024-02-28', 11434, '4000/K09', 'frozen', '1020', '3 up', '238.3', 78, 21000, 5004300),
(382, '2024-02-28', 11435, '4000/T12', 'frozen', '1036', 'J', '649.5', 0, 7200, 4676400),
(383, '2024-02-28', 11435, '4000/T12', 'frozen', '1026', 'J', '641.5', 0, 6000, 3849000),
(384, '2024-02-28', 11436, '4000/T11', 'frozen', '1015', '5/8', '140.4', 387, 27500, 3861000),
(385, '2024-02-28', 11437, '4000/T07', 'frozen', '1030', 'J', '114.9', 109, 17000, 1953300),
(386, '2024-02-28', 11437, '4000/T07', 'frozen', '1020', '2 up', '35.4', 22, 18000, 637200),
(387, '2024-02-28', 11437, '4000/T07', 'frozen', '1020', '3 up', '9.8', 4, 19500, 191100),
(388, '2024-02-28', 11437, '4000/T07', 'frozen', '1020', '5 up', '101.2', 22, 22000, 2226400),
(389, '2024-02-28', 11438, '4000/T05', 'frozen', '1031', '2 up', '33.1', 0, 6600, 218460),
(390, '2024-02-28', 11438, '4000/T05', 'frozen', '1031', '3 up', '1200.4', 0, 6650, 7982660),
(391, '2024-02-28', 11438, '4000/T05', 'frozen', '1031', '4 up', '103.6', 0, 9700, 1004920),
(392, '2024-02-28', 11438, '4000/T05', 'frozen', '1023', '2 up', '91.6', 0, 11200, 1025920),
(393, '2024-02-28', 11438, '4000/T05', 'frozen', '1023', '3 up', '128.9', 0, 15000, 1933500),
(394, '2024-02-28', 11438, '4000/T05', 'frozen', '1023', '4 up', '19.1', 0, 16500, 315150),
(395, '2024-02-28', 11438, '4000/T05', 'frozen', '1017', '2 up', '279.1', 0, 5800, 1618780),
(396, '2024-02-28', 11438, '4000/T05', 'frozen', '1026', '8/10', '64.7', 0, 5800, 375260),
(397, '2024-02-28', 11438, '4000/T05', 'frozen', '1026', '1 up', '152.3', 0, 5800, 883340),
(398, '2024-02-28', 11438, '4000/T05', 'frozen', '1036', '1 up', '20.6', 0, 7300, 150380),
(399, '2024-02-28', 11439, '4000/Z03', 'frozen', '1002', '1 up', '6.4', 0, 23000, 147200),
(400, '2024-02-28', 11439, '4000/Z03', 'frozen', '1002', '2 up', '16.9', 0, 31500, 532350),
(401, '2024-02-28', 11439, '4000/Z03', 'frozen', '1002', '3 up', '64.6', 0, 33500, 2164100),
(403, '2024-02-28', 11439, '4000/Z03', 'frozen', '1001', '1 up D', '6.5', 0, 22000, 143000),
(404, '2024-02-28', 11439, '4000/Z03', 'frozen', '1001', '1 up', '86.4', 0, 23500, 2030400),
(405, '2024-02-28', 11439, '4000/Z03', 'frozen', '1001', '2 up D', '12.2', 0, 31500, 384300),
(406, '2024-02-28', 11439, '4000/Z03', 'frozen', '1001', '2 up', '33.5', 0, 33000, 1105500),
(407, '2024-02-28', 11439, '4000/Z03', 'frozen', '1001', '3 up', '38.1', 0, 44000, 1676400),
(408, '2024-02-28', 11440, '4000/K08', 'frozen', '1020', '2 up', '61.7', 0, 19000, 1172300),
(409, '2024-02-28', 11440, '4000/K08', 'frozen', '1020', '3 up', '225.6', 0, 20000, 4512000),
(410, '2024-02-28', 11440, '4000/K08', 'frozen', '1020', '5 up', '225', 0, 20000, 4500000),
(411, '2024-02-28', 11440, '4000/K08', 'frozen', '1016', 'J', '42.6', 0, 11000, 468600),
(412, '2024-02-28', 11441, '4000/B01', 'frozen', '1020', '1 up', '25', 0, 18000, 450000),
(413, '2024-02-28', 11441, '4000/B01', 'frozen', '1020', '2 up', '108.9', 0, 18000, 1960200),
(414, '2024-02-28', 11441, '4000/B01', 'frozen', '1020', '3 up', '353', 0, 22000, 7766000),
(415, '2024-02-28', 11441, '4000/B01', 'frozen', '1020', '5 up', '272.1', 0, 24000, 6530400),
(416, '2024-02-29', 11442, '4000/P01', 'frozen', '1015', '5/8', '37.7', 103, 27000, 1017900),
(417, '2024-02-29', 11442, '4000/P01', 'frozen', '1015', '5/8 D', '15.9', 53, 26000, 413400),
(418, '2024-02-29', 11443, '4000/W01', 'frozen', '1015', '5/8', '63.8', 186, 27500, 1754500),
(419, '2024-02-29', 11444, '4000/T05', 'frozen', '1031', '2 up', '1440.3', 0, 6600, 9505980),
(420, '2024-02-29', 11444, '4000/T05', 'frozen', '1031', '3 up', '2296.3', 0, 6650, 15270395),
(421, '2024-02-29', 11444, '4000/T05', 'frozen', '1031', '4 up', '614.3', 0, 9700, 5958710),
(422, '2024-02-29', 11444, '4000/T05', 'frozen', '1031', '18/24', '25.3', 0, 6150, 155595),
(423, '2024-02-29', 11444, '4000/T05', 'frozen', '1036', '8/10', '182.2', 0, 7300, 1330060),
(424, '2024-02-29', 11444, '4000/T05', 'frozen', '1036', '1 up', '280.9', 0, 7300, 2050570),
(425, '2024-02-29', 11444, '4000/T05', 'frozen', '1023', '2 up', '92.2', 0, 11200, 1032640),
(426, '2024-02-29', 11444, '4000/T05', 'frozen', '1023', '3 up', '118', 0, 15000, 1770000),
(427, '2024-02-29', 11445, '4000/S03', 'frozen', '1017', '2 up', '386.4', 0, 5900, 2279760),
(428, '2024-02-29', 11445, '4000/S03', 'frozen', '1017', '3 up', '301.9', 0, 6400, 1932160),
(429, '2024-02-29', 11445, '4000/S03', 'frozen', '1023', '1 up', '444.1', 0, 10000, 4441000),
(430, '2024-02-29', 11445, '4000/S03', 'frozen', '1023', '2 up', '923.3', 0, 11500, 10617950),
(431, '2024-02-29', 11445, '4000/S03', 'frozen', '1023', '3 up', '551.6', 0, 15000, 8274000),
(432, '2024-02-29', 11445, '4000/S03', 'frozen', '1023', '4 up', '659.9', 0, 16700, 11020330);

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
(60, '2024-02-10', '3300/002', '', '', '', '0000-00-00', '', 'Closing Balance From SAF-18/2023', '0', '136750.69', 0),
(61, '2024-02-16', '3300/003', '', '', '', '0000-00-00', '', 'Closing Balance Adv; Received from 01/2024', '0', '-34007.64', 0),
(62, '2024-02-03', '3300/004', '', '', '', '0000-00-00', '', 'Closing Balance From Italy -01/2024', '0', '46969.36', 0),
(63, '2024-02-19', '3300/005', '', '', '', '0000-00-00', '', 'Closing Balance Adv; From KOLKATA', '0', '-33410.00', 0),
(64, '2023-09-08', '3300/002', 'SAF-19/2023', ':FBIU-5271600', '151492.37', '0000-00-00', '', '', '0', '288243.06', 0),
(65, '2023-09-26', '3300/002', 'SAF-20/2023', ':FSCU-5300057', '116818.20', '0000-00-00', '', '', '0', '405061.26', 0),
(66, '2023-10-26', '3300/002', 'SAF-21/2023', ':TTNU-8730235', '87343.73', '0000-00-00', '', '', '0', '492404.99', 0),
(67, '2023-10-26', '3300/002', 'SAF-22/2023', ':OOLU-6250426', '92746.57', '0000-00-00', '', '', '0', '585151.56', 0),
(68, '2023-11-22', '3300/002', 'SAF-23/2023', ':CRSU-6118527', '98874.20', '0000-00-00', '', '', '0', '684025.76', 0),
(69, '2023-11-23', '3300/002', 'SAF-24/2023', ':CXRU-1440458', '95217.11', '0000-00-00', '', '', '0', '779242.87', 0),
(70, '2023-12-15', '3300/002', 'SAF-25/2023', ':OERU-4219167', '66774.05', '0000-00-00', '', '', '0', '846016.92', 0),
(71, '2023-12-21', '3300/002', 'SAF-26/2023', ':TTNU-8059533', '91268.45', '0000-00-00', '', '', '0', '937285.37', 0),
(72, '2023-12-28', '3300/002', 'SAF-27/2023', ':SEGU-9662141', '105649.44', '0000-00-00', '', '', '0', '1042934.81', 0),
(118, '0000-00-00', '3300/002', '', '', '', '2024-02-01', 'Cr-Feb 24/001', 'USA Money Received from UAB ($74925) 50%34762.5-10=$37452.5*2100ks $37462.5', '37452.5', '1005482.31', 189),
(119, '0000-00-00', '3300/002', '', '', '', '2024-02-01', 'Cr-Feb 24/001', 'USA Money Received from UAB ($74925) 50%34762.5-10=$37452.5*2100ks $37462.5', '37547.5', '967934.81', 191),
(120, '0000-00-00', '3300/003', '', '', '', '2024-02-06', 'Cr-Feb 24/003', 'Canda Money $40862.68 from UAB 50% $20431.34-10=20421.34*2100ks $20431.34*3370ks $20431.34*105ks', '20421.34', '-54428.98', 257),
(121, '0000-00-00', '3300/003', '', '', '', '2024-02-06', 'Cr-Feb 24/003', 'Canda Money $40862.68 from UAB 50% $20431.34-10=20421.34*2100ks $20431.34*3370ks $20431.34*105ks', '20441.34', '-74870.32', 259),
(124, '0000-00-00', '3300/004', '', '', '', '2024-02-06', 'Cr-Feb 24/004', '$23462.5 in UAB Bank', '23452.5', '23516.86', 261),
(126, '0000-00-00', '3300/004', '', '', '', '2024-02-06', 'Cr-Feb 24/004', '$23462.5 in UAB Bank', '23462.5', '54.360000000001', 447),
(131, '0000-00-00', '3300/002', '', '', '', '2024-02-06', 'Cr-Feb 24/005', 'USA Money from UAB ($74925=50 50-$32761.64,65 35-$42163.36) $32761.64=>$16380.82-10=$16370.82*2100ks $16380.82*3370ks $16380.82*105ks and $42163.36=> $14757.18*2100ks, $27406.18 in UAB USD Bank', '31128', '936806.81', 455),
(132, '0000-00-00', '3300/002', '', '', '', '2024-02-06', 'Cr-Feb 24/005', 'USA Money from UAB ($74925=50 50-$32761.64,65 35-$42163.36) $32761.64=>$16380.82-10=$16370.82*2100ks $16380.82*3370ks $16380.82*105ks and $42163.36=> $14757.18*2100ks, $27406.18 in UAB USD Bank', '16380.82', '920425.99', 457),
(150, '0000-00-00', '3300/004', '', '', '', '2024-02-14', 'Cr-Feb 24/006', 'UAB Bank Bal money for ($50868.68) (9.2.24)- $12000*3475 (13.2.24)-11462.5*3475 Italy Money 65%Balance\r\n', '12000', '-11945.64', 525),
(151, '0000-00-00', '3300/004', '', '', '', '2024-02-14', 'Cr-Feb 24/006', 'UAB Bank Bal money for ($50868.68) (9.2.24)- $12000*3475 (13.2.24)-11462.5*3475 Italy Money 65%Balance\r\n', '11462.5', '-23408.14', 527),
(152, '0000-00-00', '3300/002', '', '', '', '2024-02-14', 'Cr-Feb 24/006', 'UAB Bank Bal money for ($50868.68) (13.2.24)-27406.18*3475ks USA Money 74925 (65%Balance of 42163.36)\r\n', '27406.18', '893019.81', 529),
(155, '0000-00-00', '3300/002', '', '', '', '2024-02-14', 'Cr-Feb 24/007', 'USA Money Received from UAB ($74925) 65% , 35% $26223.75-10=26213.75*2100ks $48701.25*3475\r\n', '26213.75', '866806.06', 531),
(156, '0000-00-00', '3300/002', '', '', '', '2024-02-14', 'Cr-Feb 24/007', 'USA Money Received from UAB ($74925) 65% , 35% $26223.75-10=26213.75*2100ks $48701.25*3475\r\n', '48701.25', '818104.81', 533),
(157, '0000-00-00', '3300/002', '', '', '', '2024-02-14', 'Cr-Feb 24/008', 'USA Money (Mr-Sarmad ) Test Transfer form UAB 65% , 35% ($960.48) $336.17-10=$326.17*2100ks ($624.31 Balance in UAB USD A/C)\r\n', '326.17', '817778.64', 535),
(158, '0000-00-00', '3300/002', '', '', '', '2024-02-14', 'Cr-Feb 24/008', 'USA Money (Mr-Sarmad ) Test Transfer form UAB 65% , 35% ($960.48) $336.17-10=$326.17*2100ks ($624.31 Balance in UAB USD A/C)\r\n', '624.31', '817154.33', 537),
(159, '0000-00-00', '3300/001', '', '', '', '2024-02-20', 'Cr-Feb 24/010', 'Loan Return from Best Brand (Bejon) transfer to UAB (Actual $25176*3480ks=87612480-8758227=Bank Chg;8753+Different 75500)', '0', '0', 820);

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
(121, '4000/Z03', 'Zaw Myat Thu', '', ''),
(122, '4000/B02', 'BLC(PYM)', '', ''),
(123, '4000/K08', 'Ko Ma Noe', '', ''),
(124, '4000/D01', 'Dry Fish (Shwe Hinn Thar)', '', ''),
(125, '4000/D02', 'Dry Fish (Myo Thant)', '', ''),
(126, '4000/k09', 'Kyaw Thein Than', '', ''),
(127, '4000/G02', 'GM', '', ''),
(128, '4000/T12', 'Than Soe', '', '');

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
  `bank_charges` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `date`, `voucher_no`, `ac_code`, `description`, `debit`, `credit`, `currency`, `sr_no`, `container_no`, `bank_charges`) VALUES
(54, '2024-02-01', 'Dr-Feb 24/001', '9100/003', 'Water 6 pk purchase for WH', '5400', '0', 'mmk', '', '', 0),
(55, '2024-02-01', 'Dr-Feb 24/001', '3600/001', 'Water 6 pk purchase for WH', '0', '5400', 'mmk', '', '', 0),
(58, '2024-02-01', 'Dr-Feb 24/002', '9100/004', 'Sir Phone Bill and Monthly/ Phone 6 pcs Bill/ Sir-6000 (Sir,Daw Nan,Lai-15000) (Office,Sandar,Mar)', '39000', '0', 'mmk', '', '', 0),
(59, '2024-02-01', 'Dr-Feb 24/002', '3600/001', 'Sir Phone Bill and Monthly/ Phone 6 pcs Bill/ Sir-6000 (Sir,Daw Nan,Lai-15000) (Office,Sandar,Mar)', '0', '39000', 'mmk', '', '', 0),
(60, '2024-02-01', 'Dr Feb\'24/003', '9100/005', 'Medicine and Taxi for sir', '14000', '0', 'mmk', '', '', 0),
(61, '2024-02-01', 'Dr Feb\'24/003', '3600/001', 'Medicine and Taxi for sir', '0', '14000', 'mmk', '', '', 0),
(62, '2024-02-01', 'Dr Feb\'24/004', '9100/006', 'Car Diesel for 5L-2848 (30.1.24-10000)(30.1.24-70000)', '80000', '0', 'mmk', '', '', 0),
(63, '2024-02-01', 'Dr Feb\'24/004', '3600/001', 'Car Diesel for 5L-2848 (30.1.24-10000)(30.1.24-70000)', '0', '80000', 'mmk', '', '', 0),
(64, '2024-02-01', 'Dr Feb\'24/005', '9100/006', 'Car Diesel for 6J-3015 (31.1.24-50000)', '50000', '0', 'mmk', '', '', 0),
(65, '2024-02-01', 'Dr Feb\'24/005', '3600/001', 'Car Diesel for 6J-3015 (31.1.24-50000)', '0', '50000', 'mmk', '', '', 0),
(66, '2024-02-01', 'Dr Feb\'24/006', '9100/007', 'Material and Taxi Charges for PK Machine', '50000', '0', 'mmk', '', '', 0),
(67, '2024-02-01', 'Dr Feb\'24/006', '3600/001', 'Material and Taxi Charges for PK Machine', '0', '50000', 'mmk', '', '', 0),
(68, '2024-02-01', 'Dr Feb\'24/007', '3300/001', 'Bejon Loan take from LM 2020ED Balance $25176*3572ks(Best Brand)', '89928700', '0', 'mmk', '', '', 0),
(69, '2024-02-01', 'Dr Feb\'24/007', '3600/001', 'Bejon Loan take from LM 2020ED Balance $25176*3572ks(Best Brand)', '0', '89928700', 'mmk', '', '', 0),
(70, '2024-02-01', 'Dr Feb\'24/008', '9100/008', 'DHL charges for Italy Document sent', '377000', '0', 'mmk', '', '', 0),
(71, '2024-02-01', 'Dr Feb\'24/008', '3600/001', 'DHL charges for Italy Document sent', '0', '377000', 'mmk', '', '', 0),
(76, '2024-02-01', 'Dr Feb\'24/009', '4000/K06', 'Paid to Ka Yin Lay for Vr No-11337', '100000', '0', 'mmk', '', '', 0),
(77, '2024-02-01', 'Dr Feb\'24/009', '3600/001', 'Paid to Ka Yin Lay for Vr No-11337', '0', '100000', 'mmk', '', '', 0),
(78, '2024-02-01', 'Dr Feb\'24/010', '9100/009', 'Wave Money charges for Ka Yin Lay Money sent', '1500', '0', 'mmk', '', '', 0),
(79, '2024-02-01', 'Dr Feb\'24/010', '3600/001', 'Wave Money charges for Ka Yin Lay Money sent', '0', '1500', 'mmk', '', '', 0),
(80, '2024-02-01', 'Dr Feb\'24/011', '9100/001', 'All people Salary Payment for Jan/24', '17754000', '0', 'mmk', '', '', 0),
(81, '2024-02-01', 'Dr Feb\'24/011', '3600/001', 'All people Salary Payment for Jan/24', '0', '17754000', 'mmk', '', '', 0),
(82, '2024-02-01', 'Dr Feb\'24/011', '9100/010', 'All people Annual Bonus Paid for Jan/24', '17351000', '0', 'mmk', '', '', 0),
(83, '2024-02-01', 'Dr Feb\'24/011', '3600/001', 'All people Annual Bonus Paid for Jan/24', '0', '17351000', 'mmk', '', '', 0),
(84, '2024-02-01', 'Dr Feb\'24/012', '9100/011', 'Donation for Bangladesh Embassy', '3000000', '0', 'mmk', '', '', 0),
(85, '2024-02-01', 'Dr Feb\'24/012', '3600/001', 'Donation for Bangladesh Embassy', '0', '3000000', 'mmk', '', '', 0),
(86, '2024-02-02', 'Dr Feb\'24/013', '9100/002', 'Taxi charges for Ocean Pacfic to WH', '15000', '0', 'mmk', '', '', 0),
(87, '2024-02-02', 'Dr Feb\'24/013', '3600/001', 'Taxi charges for Ocean Pacfic to WH', '0', '15000', 'mmk', '', '', 0),
(88, '2024-02-02', 'Dr Feb\'24/014', '6100/003', 'Carton Box purchase for Ocean Pacfic pk', '52500', '0', 'mmk', '', '', 0),
(89, '2024-02-02', 'Dr Feb\'24/014', '3600/001', 'Carton Box purchase for Ocean Pacfic pk', '0', '52500', 'mmk', '', '', 0),
(90, '2024-02-02', 'Dr Feb\'24/015', '6100/001', 'Labour Charges and Taxi Charges for (Rohu)', '289000', '0', 'mmk', '', '', 0),
(91, '2024-02-02', 'Dr Feb\'24/015', '3600/001', 'Labour Charges and Taxi Charges for (Rohu)', '0', '289000', 'mmk', '', '', 0),
(92, '2024-02-02', 'Dr Feb\'24/016', '6100/002', 'Ice 10 pcs purchase for HHK (D-Puti,Rohu,Ayer)', '90000', '0', 'mmk', '', '', 0),
(93, '2024-02-02', 'Dr Feb\'24/016', '3600/001', 'Ice 10 pcs purchase for HHK (D-Puti,Rohu,Ayer)', '0', '90000', 'mmk', '', '', 0),
(94, '2024-02-02', 'Dr Feb\'24/017', '6100/003', 'JCV Rope purchase for HHK pk pcs*85000', '170000', '0', 'mmk', '', '', 0),
(95, '2024-02-02', 'Dr Feb\'24/017', '3600/001', 'JCV Rope purchase for HHK pk pcs*85000', '0', '170000', 'mmk', '', '', 0),
(96, '2024-02-02', 'Dr Feb\'24/018', '9100/002', 'Taxi Charges for HHK to WH and WH to GFC', '43000', '0', 'mmk', '', '', 0),
(97, '2024-02-02', 'Dr Feb\'24/018', '3600/001', 'Taxi Charges for HHK to WH and WH to GFC', '0', '43000', 'mmk', '', '', 0),
(98, '2024-02-02', 'Dr Feb\'24/019', '6100/004', 'WH to HHK Fish carry car charges', '130000', '0', 'mmk', '', '', 0),
(99, '2024-02-02', 'Dr Feb\'24/019', '3600/001', 'WH to HHK Fish carry car charges', '0', '130000', 'mmk', '', '', 0),
(100, '2024-02-02', 'Dr Feb\'24/020', '9100/012', 'Workers 31 pcs Dinner for (OT) (Rohu)', '62000', '0', 'mmk', '', '', 0),
(101, '2024-02-02', 'Dr Feb\'24/020', '3600/001', 'Workers 31 pcs Dinner for (OT) (Rohu)', '0', '62000', 'mmk', '', '', 0),
(102, '2024-02-02', 'Dr Feb\'24/021', '9100/007', 'Material purchase and service charges for WH (Boy Tiolet)', '85000', '0', 'mmk', '', '', 0),
(103, '2024-02-02', 'Dr Feb\'24/021', '3600/001', 'Material purchase and service charges for WH (Boy Tiolet)', '0', '85000', 'mmk', '', '', 0),
(104, '2024-02-02', 'Dr Feb\'24/022', '9100/012', 'Fruit purchase for Sir', '7000', '0', 'mmk', '', '', 0),
(105, '2024-02-02', 'Dr Feb\'24/022', '3600/001', 'Fruit purchase for Sir', '0', '7000', 'mmk', '', '', 0),
(106, '2024-02-02', 'Dr Feb\'24/023', '6100/003', 'Penam and other purchase for WH', '814500', '0', 'mmk', '', '', 0),
(107, '2024-02-02', 'Dr Feb\'24/023', '3600/001', 'Penam and other purchase for WH', '0', '814500', 'mmk', '', '', 0),
(108, '2024-02-02', 'Dr Feb\'24/024', '6100/002', 'Ice 4 pcs and car pk for D-Puti', '42000', '0', 'mmk', '', '', 0),
(109, '2024-02-02', 'Dr Feb\'24/024', '3600/001', 'Ice 4 pcs and car pk for D-Puti', '0', '42000', 'mmk', '', '', 0),
(110, '2024-02-02', 'Dr Feb\'24/025', '4000/M06', 'Paid to Mg Mg Soe for Vr No-11152,11185', '4000000', '0', 'mmk', '', '', 0),
(111, '2024-02-02', 'Dr Feb\'24/025', '3600/001', 'Paid to Mg Mg Soe for Vr No-11152,11185', '0', '4000000', 'mmk', '', '', 0),
(115, '2024-02-02', 'Dr-Feb\'24/026', '4000/M03', 'Paid to Mg Mg Nyunt for Vr-11183,11192', '5000000', '0', 'mmk', '', '', 0),
(116, '2024-02-02', 'Dr-Feb\'24/026', '3600/001', 'Paid to Mg Mg Nyunt for Vr-11183,11192', '0', '5000000', 'mmk', '', '', 0),
(117, '2024-02-02', 'Dr-Feb 24/027', '4000/P02', 'Paid to BLC (PYM) for Vr No-11221', '3400000', '0', 'mmk', '', '', 0),
(118, '2024-02-02', 'Dr-Feb 24/027', '3600/001', 'Paid to BLC (PYM) for Vr No-11221', '0', '3400000', 'mmk', '', '', 0),
(119, '2024-02-02', 'Dr-Feb 24/028', '4000/T08', 'Paid to Than Than Myint for Vr No-107788 (10810-2696450)', '5000000', '0', 'mmk', '', '', 0),
(120, '2024-02-02', 'Dr-Feb 24/028', '3600/001', 'Paid to Than Than Myint for Vr No-107788 (10810-2696450)', '0', '5000000', 'mmk', '', '', 0),
(122, '2024-02-02', 'Dr-Feb 24/029', '4000/Y01', 'Paid to Ye Yint for Vr No-11115,11133', '5000000', '0', 'mmk', '', '', 0),
(123, '2024-02-02', 'Dr-Feb 24/029', '3600/001', 'Paid to  Ye Yint for Vr No-11115,11133', '0', '5000000', 'mmk', '', '', 0),
(124, '2023-09-08', 'SAF-001', '3300/002', '', '151492.37', '0', 'usd', 'SAF-19/2023', ':FBIU-5271600', 0),
(125, '2023-09-08', 'SAF-001', '5000/001', '', '0', '151492.37', 'usd', '', '', 0),
(126, '2024-02-02', 'Dr-Feb 24/030', '4000/H01', 'Paid to Htet Aung Lin for Vr No-10877', '444200', '0', 'mmk', '', '', 0),
(127, '2023-09-26', 'SAF-002', '3300/002', '', '116818.20', '0', 'usd', 'SAF-20/2023', ':FSCU-5300057', 0),
(128, '2024-02-02', 'Dr-Feb 24/030', '3600/001', 'Paid to Htet Aung Lin for Vr No-10877', '0', '444200', 'mmk', '', '', 0),
(129, '2023-09-26', 'SAF-002', '5000/001', '', '0', '116818.20', 'usd', '', '', 0),
(130, '2024-02-02', 'Dr-Feb 24/031', '4000/P01', 'Paid to Phone Naing for Vr No-11249,11268', '3500000', '0', 'mmk', '', '', 0),
(132, '2023-10-26', 'SAF-003', '3300/002', '', '87343.73', '0', 'usd', 'SAF-21/2023', ':TTNU-8730235', 0),
(133, '2023-10-26', 'SAF-003', '5000/001', '', '0', '87343.73', 'usd', '', '', 0),
(134, '2023-10-26', 'SAF-004', '3300/002', '', '92746.57', '0', 'usd', 'SAF-22/2023', ':OOLU-6250426', 0),
(135, '2024-02-02', 'Dr-Feb 24/031', '3600/001', 'Paid to Phone Naing for Vr No-11249,11268', '0', '3500000', 'mmk', '', '', 0),
(136, '2023-10-26', 'SAF-004', '5000/001', '', '0', '92746.57', 'usd', '', '', 0),
(137, '2024-02-02', 'Dr-Feb 24/032', '4000/T02', 'Paid to Thein Htay for Vr No-11269', '4000000', '0', 'mmk', '', '', 0),
(138, '2024-02-02', 'Dr-Feb 24/032', '3600/001', 'Paid to Thein Htay for Vr No-11269', '0', '4000000', 'mmk', '', '', 0),
(139, '2023-11-22', 'SAF-005', '3300/002', '', '98874.20', '0', 'usd', 'SAF-23/2023', ':CRSU-6118527', 0),
(140, '2023-11-22', 'SAF-005', '5000/001', '', '0', '98874.20', 'usd', '', '', 0),
(141, '2023-11-23', 'SAF-006', '3300/002', '', '95217.11', '0', 'usd', 'SAF-24/2023', ':CXRU-1440458', 0),
(142, '2023-11-23', 'SAF-006', '5000/001', '', '0', '95217.11', 'usd', '', '', 0),
(143, '2023-12-15', 'SAF-007', '3300/002', '', '66774.05', '0', 'usd', 'SAF-25/2023', ':OERU-4219167', 0),
(144, '2023-12-15', 'SAF-007', '5000/001', '', '0', '66774.05', 'usd', '', '', 0),
(145, '2023-12-21', 'SAF-008', '3300/002', '', '91268.45', '0', 'usd', 'SAF-26/2023', ':TTNU-8059533', 0),
(146, '2023-12-21', 'SAF-008', '5000/001', '', '0', '91268.45', 'usd', '', '', 0),
(147, '2023-12-28', 'SAF-009', '3300/002', '', '105649.44', '0', 'usd', 'SAF-27/2023', ':SEGU-9662141', 0),
(148, '2023-12-28', 'SAF-009', '5000/001', '', '0', '105649.44', 'usd', '', '', 0),
(149, '2024-02-02', 'Dr Feb\'24/033', '9100/002', 'Taxi Charges For Office 5 pcs Payment Day (6:30) PM', '39500', '0', 'mmk', '', '', 0),
(150, '2024-02-02', 'Dr Feb\'24/033', '3600/001', 'Taxi Charges For Office 5 pcs Payment Day (6:30) PM', '0', '39500', 'mmk', '', '', 0),
(151, '2024-02-02', 'Dr-Feb 24/034', '9100/012', 'Meal Allowance for Office 5pcs Payment Day', '10000', '0', 'mmk', '', '', 0),
(152, '2024-02-02', 'Dr-Feb 24/034', '3600/001', 'Meal Allowance for Office 5pcs Payment Day', '0', '10000', 'mmk', '', '', 0),
(153, '2024-02-02', 'Dr-Feb 24/035', '9100/013', 'Water Bill and services for WH (Dec/23) (78000+2000)', '80000', '0', 'mmk', '', '', 0),
(154, '2024-02-02', 'Dr-Feb 24/035', '3600/001', 'Water Bill and services for WH (Dec/23) (78000+2000)', '0', '80000', 'mmk', '', '', 0),
(155, '2024-02-02', 'Dr-Feb 24/036', '6100/006', 'Paid to Sticker 5 colour for penam-sticker+other', '1697000', '0', 'mmk', '', '', 0),
(156, '2024-02-02', 'Dr-Feb 24/036', '3600/001', 'Paid to Sticker 5 colour for penam-sticker+other', '0', '1697000', 'mmk', '', '', 0),
(157, '2024-02-02', 'Dr-Feb 24/037', '9100/002', 'Taxi Charges for WH to Daw Nan house go for (Htet Paing Aye)', '6000', '0', 'mmk', '', '', 0),
(158, '2024-02-02', 'Dr-Feb 24/037', '3600/001', 'Taxi Charges for WH to Daw Nan house go for (Htet Paing Aye)', '0', '6000', 'mmk', '', '', 0),
(188, '2024-02-01', 'Cr-Feb 24/001', '3600/001', 'USA Money Received from UAB ($74925) 50%34762.5-10=$37452.5*2100ks $37462.5', '78650250', '0', 'usd', '', '', 0),
(189, '2024-02-01', 'Cr-Feb 24/001', '3300/002', 'USA Money Received from UAB ($74925) 50%34762.5-10=$37452.5*2100ks $37462.5', '0', '78650250', 'usd', '', '', 0),
(190, '2024-02-01', 'Cr-Feb 24/001', '3600/001', 'USA Money Received from UAB ($74925) 50%34762.5-10=$37452.5*2100ks $37462.5', '130665300', '0', 'usd', '', '', 85),
(191, '2024-02-01', 'Cr-Feb 24/001', '3300/002', 'USA Money Received from UAB ($74925) 50%34762.5-10=$37452.5*2100ks $37462.5', '0', '130665300', 'usd', '', '', 0),
(192, '2024-02-03', 'Dr-Feb 24/038', '4000/M01', 'Paid to MA for Vr No-10586', '4000000', '0', 'mmk', '', '', 0),
(193, '2024-02-03', 'Dr-Feb 24/038', '3600/001', 'Paid to MA for Vr No-10586', '0', '4000000', 'mmk', '', '', 0),
(194, '2024-02-03', 'Dr-Feb 24/039', '4000/S08', 'Paid to Soe Naing for Vr No-10534,10542', '4000000', '0', 'mmk', '', '', 0),
(195, '2024-02-03', 'Dr-Feb 24/039', '3600/001', 'Paid to Soe Naing for Vr No-10534,10542', '0', '4000000', 'mmk', '', '', 0),
(196, '2024-02-03', 'Dr-Feb 24/040', '4000/K07', 'Paid to Khin Mg Myint for Vr N0-11189', '7000000', '0', 'mmk', '', '', 0),
(197, '2024-02-03', 'Dr-Feb 24/040', '3600/001', 'paid to Khin Mg Myint for Vr No-11189', '0', '7000000', 'mmk', '', '', 0),
(198, '2024-02-03', 'Dr-Feb 24/041', '9100/006', 'Car Diesel for 6J-3015(1.2)-50000/ (3.2)-50000', '100000', '0', 'mmk', '', '', 0),
(199, '2024-02-03', 'Dr-Feb 24/041', '3600/001', 'Car Diesel for 6J-3015(1.2)-50000/ (3.2)-50000', '0', '100000', 'mmk', '', '', 0),
(200, '2024-02-03', 'Dr-Feb 24/042', '9100/014', 'Engin Oil purchase for 6J-3015', '10000', '0', 'mmk', '', '', 0),
(201, '2024-02-03', 'Dr-Feb 24/042', '3600/001', 'Engin Oil purchase for 6J-3015', '0', '10000', 'mmk', '', '', 0),
(202, '2024-02-03', 'Dr-Feb 24/043', '9100/014', 'Car police catch for 6J-3015(2.2)(3.2)', '8000', '0', 'mmk', '', '', 0),
(203, '2024-02-03', 'Dr-Feb 24/043', '3600/001', 'Car police catch for 6J-3015(2.2)(3.2)', '0', '8000', 'mmk', '', '', 0),
(204, '2024-02-03', 'Dr-Feb 24/044', '6100/003', 'paid to plastic (G/F) for Vr No-(31.1.24)(30.1.24)(30.1.24)', '2112000', '0', 'mmk', '', '', 0),
(205, '2024-02-03', 'Dr-Feb 24/044', '3600/001', 'Paid to plastic (G/F)for Vr No-(31.1.24)(30.1.24)(30.1.24)', '0', '2112000', 'mmk', '', '', 0),
(206, '2024-02-03', 'Dr-Feb 24/045', '6100/003', 'Paid to Carton Box (MMMO)for (31.1.24)Vr 3 pcs', '2193960', '0', 'mmk', '', '', 0),
(207, '2024-02-03', 'Dr-Feb 24/045', '3600/001', 'Paid to Carton Box (MMMO)for (31.1.24)Vr 3 pcs', '0', '2193960', 'mmk', '', '', 0),
(208, '2024-02-03', 'Dr-Feb 24/046', '6100/007', 'Paid to HHK Cold Store', '10000000', '0', 'mmk', '', '', 0),
(209, '2024-02-03', 'Dr-Feb 24/046', '3600/001', 'Paid to HHK Cold Store', '0', '10000000', 'mmk', '', '', 0),
(210, '2024-02-03', 'Dr-Feb 24/047', '6100/003', 'Paid to Carton Box (Swan Pyae) for Vr No-(19.12.23 to 22.12.23)(26.12.23)(27.12.23)(27.12.23)', '5730540', '0', 'mmk', '', '', 0),
(211, '2024-02-03', 'Dr-Feb 24/047', '3600/001', 'Paid to Carton Box (Swan Pyae) for Vr No-(19.12.23 to 22.12.23)(26.12.23)(27.12.23)(27.12.23)', '0', '5730540', 'mmk', '', '', 0),
(212, '2024-02-03', 'Dr-Feb 24/048', '6100/003', 'Plastic Packing Strap 3000 M W 5*87000ks', '435000', '0', 'mmk', '', '', 0),
(213, '2024-02-03', 'Dr-Feb 24/048', '3600/001', 'Plastic Packing Strap 3000 M W 5*87000ks', '0', '435000', 'mmk', '', '', 0),
(214, '2024-02-03', 'Dr-Feb 24/049', '6100/003', 'Paid to Carton Box (Shwe Myay) for (2.12)(12.12)(14.12)', '2000000', '0', 'mmk', '', '', 0),
(215, '2024-02-03', 'Dr-Feb 24/049', '3600/001', 'Paid to Carton Box (Shwe Myay) for (2.12)(12.12)(14.12)', '0', '2000000', 'mmk', '', '', 0),
(216, '2024-02-03', 'Dr-Feb 24/050', '9100/003', 'Water 2 pk purchase for WH', '1800', '0', 'mmk', '', '', 0),
(217, '2024-02-03', 'Dr-Feb 24/050', '3600/001', 'Water 2 pk purchase for WH', '0', '1800', 'mmk', '', '', 0),
(218, '2024-02-03', 'Dr-Feb 24/051', '6100/002', 'lce 3 pcs purchase for HHk(Puti)', '27000', '0', 'mmk', '', '', 0),
(219, '2024-02-03', 'Dr-Feb 24/051', '3600/001', 'lce 3 pcs purchase for HHk(Puti)', '0', '27000', 'mmk', '', '', 0),
(220, '2024-02-03', 'Dr-Feb 24/052', '6100/001', 'Labour Charges and Taxi Charges for (D-Puti) (109200+15000)', '124200', '0', 'mmk', '', '', 0),
(221, '2024-02-03', 'Dr-Feb 24/052', '3600/001', 'Labour Charges and Taxi Charges for (D-Puti) (109200+15000)', '0', '124200', 'mmk', '', '', 0),
(222, '2024-02-03', 'Dr-Feb 24/053', '9100/002', 'Taxi charges for HHK to WH pk', '17000', '0', 'mmk', '', '', 0),
(223, '2024-02-03', 'Dr-Feb 24/053', '3600/001', 'Taxi charges for HHK to WH pk', '0', '17000', 'mmk', '', '', 0),
(224, '2024-02-03', 'Dr-Feb 24/054', '6100/001', 'labour and Taxi Charges for (D-Puit)', '106800', '0', 'mmk', '', '', 0),
(225, '2024-02-03', 'Dr-Feb 24/054', '3600/001', 'labour and Taxi Charges for (D-Puit)', '0', '106800', 'mmk', '', '', 0),
(226, '2024-02-03', 'Dr-Feb 24/055', '6100/002', 'lce 4 pcs purchase for (D-Puit)', '36000', '0', 'mmk', '', '', 0),
(227, '2024-02-03', 'Dr-Feb 24/055', '3600/001', 'lce 4 pcs purchase for (D-Puit)', '0', '36000', 'mmk', '', '', 0),
(228, '2024-02-03', 'Dr-Feb 24/056', '9100/002', 'Taxi Charges for HHK to WH', '17000', '0', 'mmk', '', '', 0),
(229, '2024-02-03', 'Dr-Feb 24/056', '3600/001', 'Taxi Charges for HHK to WH', '0', '17000', 'mmk', '', '', 0),
(230, '2024-02-03', 'Dr-Feb 24/057', '6100/002', 'Ice 3pcs purchase for ( Ocean - Rohn )', '30000', '0', 'mmk', '', '', 0),
(231, '2024-02-03', 'Dr-Feb 24/057', '3600/001', 'Ice 3pcs purchase for ( Ocean - Rohn )', '0', '30000', 'mmk', '', '', 0),
(232, '2024-02-03', 'Dr-Feb 24/058', '6100/001', 'Labour Charges for (Rohn)', '10000', '0', 'mmk', '', '', 0),
(233, '2024-02-03', 'Dr-Feb 24/058', '3600/001', 'Labour Charges for (Rohn)', '0', '10000', 'mmk', '', '', 0),
(234, '2024-02-03', 'Dr-Feb 24/059', '9100/015', 'Sir present purchase for ( Cambodia go ) wallet and bags (Yangoods)\r\n\r\n', '519600', '0', 'mmk', '', '', 0),
(235, '2024-02-03', 'Dr-Feb 24/059', '3600/001', 'Sir present purchase for ( Cambodia go ) wallet and bags (Yangoods)\r\n\r\n', '0', '519600', 'mmk', '', '', 0),
(236, '2024-02-03', 'Dr-Feb 24/060', '9100/012', 'Meal Allowance for Sir +2 pcs', '95850', '0', 'mmk', '', '', 0),
(237, '2024-02-03', 'Dr-Feb 24/060', '3600/001', 'Meal Allowance for Sir +2 pcs', '0', '95850', 'mmk', '', '', 0),
(238, '2024-02-05', 'Dr-Feb 24/061', '9100/003', 'Water 2 pk purchase for WH', '1800', '0', 'mmk', '', '', 0),
(239, '2024-02-05', 'Dr-Feb 24/061', '3600/001', 'Water 2 pk purchase for WH', '0', '1800', 'mmk', '', '', 0),
(240, '2024-02-05', 'Dr-Feb 24/062', '9100/006', 'Car Diesel for 6J-3015 (4.2)-50000/ (5.2)-50000', '100000', '0', 'mmk', '', '', 0),
(241, '2024-02-05', 'Dr-Feb 24/062', '3600/001', 'Car Diesel for 6J-3015 (4.2)-50000/ (5.2)-50000', '0', '100000', 'mmk', '', '', 0),
(242, '2024-02-05', 'Dr-Feb 24/063', '9100/014', 'Car police catch for 6J-3015 (Market)', '5000', '0', 'mmk', '', '', 0),
(243, '2024-02-05', 'Dr-Feb 24/063', '3600/001', 'Car police catch for 6J-3015 (Market)', '0', '5000', 'mmk', '', '', 0),
(244, '2024-02-05', 'Dr-Feb 24/064', '9100/002', 'Taxi Charges for HHK to WH (pk)', '17000', '0', 'mmk', '', '', 0),
(245, '2024-02-05', 'Dr-Feb 24/064', '3600/001', 'Taxi Charges for HHK to WH (pk)', '0', '17000', 'mmk', '', '', 0),
(246, '2024-02-05', 'Dr-Feb 24/065', '9100/007', 'Material purchase for WH', '31500', '0', 'mmk', '', '', 0),
(247, '2024-02-05', 'Dr-Feb 24/065', '3600/001', 'Material purchase for WH', '0', '31500', 'mmk', '', '', 0),
(248, '2024-02-05', 'Dr-Feb 24/066', '9100/016', 'Photo paper and A4 purchase for WH', '107500', '0', 'mmk', '', '', 0),
(249, '2024-02-05', 'Dr-Feb 24/066', '3600/001', 'Photo paper and A4 purchase for WH', '0', '107500', 'mmk', '', '', 0),
(250, '2024-02-05', 'Dr-Feb 24/067', '9100/007', 'Battery 2 pcs charging charges and carry charges for (office)', '15000', '0', 'mmk', '', '', 0),
(251, '2024-02-05', 'Dr-Feb 24/067', '3600/001', 'Battery 2 pcs charging charges and carry charges for (office)', '0', '15000', 'mmk', '', '', 0),
(252, '2024-02-05', 'Dr-Feb 24/068', '9100/002', 'Taxi charges for Ocean Pacific go workers', '24000', '0', 'mmk', '', '', 0),
(253, '2024-02-05', 'Dr-Feb 24/068', '3600/001', 'Taxi charges for Ocean Pacific go workers', '0', '24000', 'mmk', '', '', 0),
(254, '2024-02-05', 'Dr-Feb 24/069', '4000/M07', 'Paid to Moe Kyaw for Vr No-11332, 11339, Cheque No-052402', '12503950', '0', 'mmk', '', '', 0),
(255, '2024-02-05', 'Dr-Feb 24/069', '3600/001', 'Paid to Moe Kyaw for Vr No-11332, 11339, Cheque No-052402', '0', '12503950', 'mmk', '', '', 0),
(256, '2024-02-06', 'Cr-Feb 24/003', '3600/001', 'Canda Money $40862.68 from UAB 50% $20431.34-10=20421.34*2100ks $20431.34*3370ks $20431.34*105ks', '42884814', '0', 'usd', '', '', 0),
(257, '2024-02-06', 'Cr-Feb 24/003', '3300/003', 'Canda Money $40862.68 from UAB 50% $20431.34-10=20421.34*2100ks $20431.34*3370ks $20431.34*105ks', '0', '42884814', 'usd', '', '', 0),
(258, '2024-02-06', 'Cr-Feb 24/003', '3600/001', 'Canda Money $40862.68 from UAB 50% $20431.34-10=20421.34*2100ks $20431.34*3370ks $20431.34*105ks', '71033656.5', '0', 'usd', '', '', 10),
(259, '2024-02-06', 'Cr-Feb 24/003', '3300/003', 'Canda Money $40862.68 from UAB 50% $20431.34-10=20421.34*2100ks $20431.34*3370ks $20431.34*105ks', '0', '71033656.5', 'usd', '', '', 0),
(260, '2024-02-06', 'Cr-Feb 24/004', '3600/001', '$23462.5 in UAB Bank', '49250250', '0', 'usd', '', '', 0),
(261, '2024-02-06', 'Cr-Feb 24/004', '3300/004', '$23462.5 in UAB Bank', '0', '49250250', 'usd', '', '', 0),
(266, '2024-02-06', 'Dr Feb 24/070', '9100/016', 'A4 paper, Pen, Debit voucher Charging Rope and Taxi for (office)', '117800', '0', 'mmk', '', '', 0),
(267, '2024-02-06', 'Dr Feb 24/070', '3600/001', 'A4 paper, Pen, Debit voucher Charging Rope and Taxi for (office)', '0', '117800', 'mmk', '', '', 0),
(268, '2024-02-06', 'Dr Feb 24/071', '9100/011', 'Donation for Industry Zone', '137000', '0', 'mmk', '', '', 0),
(269, '2024-02-06', 'Dr Feb 24/071', '3600/001', 'Donation for Industry Zone', '0', '137000', 'mmk', '', '', 0),
(270, '2024-02-06', 'Dr Feb 24/072', '6100/001', 'Labour charges and Taxi for D-Puti', '93000', '0', 'mmk', '', '', 0),
(271, '2024-02-06', 'Dr Feb 24/072', '3600/001', 'Labour charges and Taxi for D-Puti', '0', '93000', 'mmk', '', '', 0),
(272, '2024-02-06', 'Dr Feb 24/073', '6100/002', 'Ice 3 pcs purchase for D-Puti', '27000', '0', 'mmk', '', '', 0),
(273, '2024-02-06', 'Dr Feb 24/073', '3600/001', 'Ice 3 pcs purchase for D-Puti', '0', '27000', 'mmk', '', '', 0),
(274, '2024-02-06', 'Dr Feb 24/074', '9100/002', 'Taxi Charges For WH to GFC and GFC to WH', '24000', '0', 'mmk', '', '', 0),
(275, '2024-02-06', 'Dr Feb 24/074', '3600/001', 'Taxi Charges For WH to GFC and GFC to WH', '0', '24000', 'mmk', '', '', 0),
(276, '2024-02-06', 'Dr Feb 24/075', '9100/025', 'Car Pk and OT for 6J-3015 (Market)', '7000', '0', 'mmk', '', '', 0),
(277, '2024-02-06', 'Dr Feb 24/075', '3600/001', 'Car Pk and OT for 6J-3015 (Market)', '0', '7000', 'mmk', '', '', 0),
(278, '2024-02-06', 'Dr Feb 24/076', '9100/002', 'Taxi Charges For WH to GFC and GFC To SPD', '10000', '0', 'mmk', '', '', 0),
(279, '2024-02-06', 'Dr Feb 24/076', '3600/001', 'Taxi Charges For WH to GFC and GFC To SPD', '0', '10000', 'mmk', '', '', 0),
(280, '2024-02-06', 'Dr Feb 24/077', '6100/002', 'Ice 1 pcs purchase for (Rohu)', '6000', '0', 'mmk', '', '', 0),
(281, '2024-02-06', 'Dr Feb 24/077', '3600/001', 'Ice 1 pcs purchase for (Rohu)', '0', '6000', 'mmk', '', '', 0),
(282, '2024-02-06', 'Dr Feb 24/078', '9100/004', 'YTP Bill for House (Jan/24)', '60375', '0', 'mmk', '', '', 0),
(283, '2024-02-06', 'Dr Feb 24/078', '3600/001', 'YTP Bill for House (Jan/24)', '0', '60375', 'mmk', '', '', 0),
(284, '2024-02-06', 'Dr Feb 24/079', '9100/004', 'Hi-Internet Bill for office and WH office (Feb/24)', '79800', '0', 'mmk', '', '', 0),
(285, '2024-02-06', 'Dr Feb 24/079', '3600/001', 'Hi-Internet Bill for office and WH office (Feb/24)', '0', '79800', 'mmk', '', '', 0),
(286, '2024-02-06', 'Dr Feb 24/080', '9100/006', 'Car Diesel for 6J-3015', '50000', '0', 'mmk', '', '', 0),
(287, '2024-02-06', 'Dr Feb 24/080', '3600/001', 'Car Diesel for 6J-3015', '0', '50000', 'mmk', '', '', 0),
(288, '2024-02-06', 'Dr Feb 24/081', '9100/005', 'Battery purchase for WH Digital', '20000', '0', 'mmk', '', '', 0),
(289, '2024-02-06', 'Dr Feb 24/081', '3600/001', 'Battery purchase for WH Digital', '0', '20000', 'mmk', '', '', 0),
(290, '2024-02-06', 'Dr Feb 24/082', '6100/001', 'LAbour Charges and Taxi for D-Puti', '138000', '0', 'mmk', '', '', 0),
(291, '2024-02-06', 'Dr Feb 24/082', '3600/001', 'LAbour Charges and Taxi for D-Puti', '0', '138000', 'mmk', '', '', 0),
(292, '2024-02-06', 'Dr Feb 24/083', '6100/002', 'Ice 1 pcs purchase for D-Puti', '9000', '0', 'mmk', '', '', 0),
(293, '2024-02-06', 'Dr Feb 24/083', '3600/001', 'Ice 1 pcs purchase for D-Puti', '0', '9000', 'mmk', '', '', 0),
(294, '2024-02-06', 'Dr Feb 24/084', '9100/002', 'Taxi Charges For HHK to WH', '17000', '0', 'mmk', '', '', 0),
(295, '2024-02-06', 'Dr Feb 24/084', '3600/001', 'Taxi Charges For HHK to WH', '0', '17000', 'mmk', '', '', 0),
(296, '2024-02-06', 'Dr Feb 24/085', '6100/005', 'HHK to GFC MC carry for 2 Trucks', '160000', '0', 'mmk', '', '', 0),
(297, '2024-02-06', 'Dr Feb 24/085', '3600/001', 'HHK to GFC MC carry for 2 Trucks', '0', '160000', 'mmk', '', '', 0),
(298, '2024-02-06', 'Dr Feb 24/086', '9100/005', 'ဧည့်စာရင်း(Boys)', '10000', '0', 'mmk', '', '', 0),
(299, '2024-02-06', 'Dr Feb 24/086', '3600/001', 'ဧည့်စာရင်း(Boys)', '0', '10000', 'mmk', '', '', 0),
(300, '2024-02-06', 'Dr Feb 24/087', '6100/007', 'Paid to Ocean Pacific Cold Store', '4000000', '0', 'mmk', '', '', 0),
(301, '2024-02-06', 'Dr Feb 24/087', '3600/001', 'Paid to Ocean Pacific Cold Store', '0', '4000000', 'mmk', '', '', 0),
(302, '2024-02-06', 'Dr Feb 24/088', '6100/007', 'Paid to GFC Cold Store Charges', '6754402', '0', 'mmk', '', '', 0),
(303, '2024-02-06', 'Dr Feb 24/088', '3600/001', 'Paid to GFC Cold Store Charges', '0', '6754402', 'mmk', '', '', 0),
(304, '2024-02-06', 'Dr Feb 24/089', '9100/002', 'Taxi Charges for WH to GFC Money sent', '24000', '0', 'mmk', '', '', 0),
(305, '2024-02-06', 'Dr Feb 24/089', '3600/001', 'Taxi Charges for WH to GFC Money sent', '0', '24000', 'mmk', '', '', 0),
(306, '2024-02-06', 'Dr Feb 24/090', '4000/T03', 'Paid to Thin Thin Yee for Vr No-11163,11176 Cheque No-039001', '60000000', '0', 'mmk', '', '', 0),
(307, '2024-02-06', 'Dr Feb 24/090', '3600/001', 'Paid to Thin Thin Yee for Vr No-11163,11176 Cheque No-039001', '0', '60000000', 'mmk', '', '', 0),
(308, '2024-02-06', 'Dr Feb 24/091', '4000/S07', 'Paid to Soe Thein (TCL) for Vr No-00113,00123 Cheque No-039003', '30000000', '0', 'mmk', '', '', 0),
(309, '2024-02-06', 'Dr Feb 24/091', '3600/001', 'Paid to Soe Thein (TCL) for Vr No-00113,00123 Cheque No-039003', '0', '30000000', 'mmk', '', '', 0),
(310, '2024-02-06', 'Dr Feb 24/092', '4000/001', 'Paid to 4 Zaw for Vr No-11030,11042,11054 Cheque No-039004', '5000000', '0', 'mmk', '', '', 0),
(311, '2024-02-06', 'Dr Feb 24/092', '3600/001', 'Paid to 4 Zaw for Vr No-11030,11042,11054 Cheque No-039004', '0', '5000000', 'mmk', '', '', 0),
(312, '2024-02-06', 'Dr Feb 24/093', '4000/A01', 'Paid to AK for Vr No-11009,11023 Cheque No-039005', '4000000', '0', 'mmk', '', '', 0),
(313, '2024-02-06', 'Dr Feb 24/093', '3600/001', 'Paid to AK for Vr No-11009,11023 Cheque No-039005', '0', '4000000', 'mmk', '', '', 0),
(314, '2024-02-06', 'Dr Feb 24/094', '4000/A02', 'Paid to Arr Kae for Vr No-11170,11199 Cheque No-039006', '3000000', '0', 'mmk', '', '', 0),
(315, '2024-02-06', 'Dr Feb 24/094', '3600/001', 'Paid to Arr Kae for Vr No-11170,11199 Cheque No-039006', '0', '3000000', 'mmk', '', '', 0),
(316, '2024-02-06', 'Dr Feb 24/095', '4000/A03', 'Paid to Aung Naing Oo for Vr No-10891,10930,10980,11021 Cheque No-039007', '7000000', '0', 'mmk', '', '', 0),
(317, '2024-02-06', 'Dr Feb 24/095', '3600/001', 'Paid to Aung Naing Oo for Vr No-10891,10930,10980,11021 Cheque No-039007', '0', '7000000', 'mmk', '', '', 0),
(318, '2024-02-06', 'Dr Feb 24/096', '4000/A05', 'Paid to Myo Min for Vr No-10891,10930,10980,11021 Cheque No-039007', '5000000', '0', 'mmk', '', '', 0),
(319, '2024-02-06', 'Dr Feb 24/096', '3600/001', 'Paid to Myo Min for Vr No-10891,10930,10980,11021 Cheque No-039007', '0', '5000000', 'mmk', '', '', 0),
(320, '2024-02-06', 'Dr Feb 24/097', '4000/A06', 'Paid to Aung Zaw Oo for Vr No-11172 Cheque No-039009', '3000000', '0', 'mmk', '', '', 0),
(321, '2024-02-06', 'Dr Feb 24/097', '3600/001', 'Paid to Aung Zaw Oo for Vr No-11172 Cheque No-039009', '0', '3000000', 'mmk', '', '', 0),
(322, '2024-02-06', 'Dr Feb 24/098', '4000/A07', '', '4000000', '0', 'mmk', '', '', 0),
(323, '2024-02-06', 'Dr Feb 24/098', '3600/001', 'Paid to A Thay Lay for Vr No-11222,11237 Cheque No-0390010', '0', '4000000', 'mmk', '', '', 0),
(324, '2024-02-06', 'Dr Feb 24/099', '4000/B01', 'Paid to Bar Bu Lay for Vr No-11263 Cheque No-0390011', '3000000', '0', 'mmk', '', '', 0),
(325, '2024-02-06', 'Dr Feb 24/099', '3600/001', 'Paid to Bar Bu Lay for Vr No-11263 Cheque No-0390011', '0', '3000000', 'mmk', '', '', 0),
(326, '2024-02-06', 'Dr Feb 24/100', '4000/C02', 'Paid to Cho Mg for Vr No-11155,11161 Cheque No-0390012', '5000000', '0', 'mmk', '', '', 0),
(327, '2024-02-06', 'Dr Feb 24/100', '3600/001', 'Paid to Cho Mg for Vr No-11155,11161 Cheque No-0390012', '0', '5000000', 'mmk', '', '', 0),
(328, '2024-02-06', 'Dr Feb 24/101', '4000/H02', 'Paid to Htay Win for Vr No-  Cheque No-0390013', '3000000', '0', 'mmk', '', '', 0),
(329, '2024-02-06', 'Dr Feb 24/101', '3600/001', 'Paid to Htay Win for Vr No-  Cheque No-0390013', '0', '3000000', 'mmk', '', '', 0),
(330, '2024-02-06', 'Dr Feb 24/102', '4000/K05', 'Paid to Kyaw Zay Ya for Vr No-11097 Cheque No-0390014', '7000000', '0', 'mmk', '', '', 0),
(331, '2024-02-06', 'Dr Feb 24/102', '3600/001', 'Paid to Kyaw Zay Ya for Vr No-11097 Cheque No-0390014', '0', '7000000', 'mmk', '', '', 0),
(332, '2024-02-06', 'Dr Feb 24/103', '4000/K03', 'Paid to KTO for Vr No-10608,11322 Cheque No-0390015', '4000000', '0', 'mmk', '', '', 0),
(333, '2024-02-06', 'Dr Feb 24/103', '3600/001', 'Paid to KTO for Vr No-10608,11322 Cheque No-0390015', '0', '4000000', 'mmk', '', '', 0),
(334, '2024-02-06', 'Dr Feb 24/104', '4000/K04', 'Paid to Kaung Myat for Vr No-11341 Cheque No-0390016', '4000000', '0', 'mmk', '', '', 0),
(335, '2024-02-06', 'Dr Feb 24/104', '3600/001', 'Paid to Kaung Myat for Vr No-11341 Cheque No-0390016', '0', '4000000', 'mmk', '', '', 0),
(336, '2024-02-06', 'Dr Feb 24/105', '4000/M07', 'Paid to Moe Kyaw for Vr No-11332 Cheque No-0390017', '4000000', '0', 'mmk', '', '', 0),
(337, '2024-02-06', 'Dr Feb 24/105', '3600/001', 'Paid to Moe Kyaw for Vr No-11332 Cheque No-0390017', '0', '4000000', 'mmk', '', '', 0),
(338, '2024-02-06', 'Dr Feb 24/106', '4000/S01', 'Paid to Shwe Late for Vr No-10871,10842,10892,10902 Cheque No-0390018', '5000000', '0', 'mmk', '', '', 0),
(339, '2024-02-06', 'Dr Feb 24/106', '3600/001', 'Paid to Shwe Late for Vr No-10871,10842,10892,10902 Cheque No-0390018', '0', '5000000', 'mmk', '', '', 0),
(340, '2024-02-06', 'Dr Feb 24/107', '4000/S03', 'Paid to Soe Min for Vr No-10929,10997,11020 Cheque No-0390019', '20000000', '0', 'mmk', '', '', 0),
(341, '2024-02-06', 'Dr Feb 24/107', '3600/001', 'Paid to Soe Min for Vr No-10929,10997,11020 Cheque No-0390019', '0', '20000000', 'mmk', '', '', 0),
(342, '2024-02-06', 'Dr Feb 24/108', '4000/S04', 'Paid to Si Thu for Vr No-10845, 10857, 10858 Cheque No-0390020', '5000000', '0', 'mmk', '', '', 0),
(343, '2024-02-06', 'Dr Feb 24/108', '3600/001', 'Paid to Si Thu for Vr No-10845, 10857, 10858 Cheque No-0390020', '0', '5000000', 'mmk', '', '', 0),
(344, '2024-02-06', 'Dr Feb 24/109', '4000/T05', 'Paid to Thet Oo for Vr No-11120,11132 Cheque No-039021', '30000000', '0', 'mmk', '', '', 0),
(345, '2024-02-06', 'Dr Feb 24/109', '3600/001', 'Paid to Thet Oo for Vr No-11120,11132 Cheque No-039021', '0', '30000000', 'mmk', '', '', 0),
(346, '2024-02-06', 'Dr Feb 24/110', '4000/T01', 'Paid to Thet Paing for Vr No-11327 Cheque No-039022', '4000000', '0', 'mmk', '', '', 0),
(347, '2024-02-06', 'Dr Feb 24/110', '3600/001', 'Paid to Thet Paing for Vr No-11327 Cheque No-039022', '0', '4000000', 'mmk', '', '', 0),
(348, '2024-02-06', 'Dr Feb 24/111', '4000/T11', 'Paid to Tun Zaw Min for Vr No-11074 Cheque No-039023', '30000000', '0', 'mmk', '', '', 0),
(349, '2024-02-06', 'Dr Feb 24/111', '3600/001', 'Paid to Tun Zaw Min for Vr No-11074 Cheque No-039023', '0', '30000000', 'mmk', '', '', 0),
(350, '2024-02-06', 'Dr Feb 24/112', '4000/W01', 'Paid to Win Bo for Vr No-11283 Cheque No-039024', '3352700', '0', 'mmk', '', '', 0),
(351, '2024-02-06', 'Dr Feb 24/112', '3600/001', 'Paid to Win Bo for Vr No-11283 Cheque No-039024', '0', '3352700', 'mmk', '', '', 0),
(352, '2024-02-06', 'Dr Feb 24/113', '4000/Z01', 'Paid to Zaw Latt for Vr No-10966,11008 Cheque No-039025', '4000000', '0', 'mmk', '', '', 0),
(353, '2024-02-06', 'Dr Feb 24/113', '3600/001', 'Paid to Zaw Latt for Vr No-10966,11008 Cheque No-039025', '0', '4000000', 'mmk', '', '', 0),
(354, '2024-02-06', 'Dr Feb 24/114', '4000/A04', 'Paid to Aung Kyaw Moe for Vr No-10944 Cheque No-052401', '5472850', '0', 'mmk', '', '', 0),
(355, '2024-02-06', 'Dr Feb 24/114', '3600/001', 'Paid to Aung Kyaw Moe for Vr No-10944 Cheque No-052401', '0', '5472850', 'mmk', '', '', 0),
(356, '2024-02-06', 'Dr Feb 24/115', '9100/002', 'Taxi Charges for WH to Market', '18000', '0', 'mmk', '', '', 0),
(357, '2024-02-06', 'Dr Feb 24/115', '3600/001', 'Taxi Charges for WH to Market', '0', '18000', 'mmk', '', '', 0),
(358, '2024-02-06', 'Dr Feb 24/116', '9100/025', 'Car Pk and OT Charges for (Market)', '8000', '0', 'mmk', '', '', 0),
(359, '2024-02-06', 'Dr Feb 24/116', '3600/001', 'Car Pk and OT Charges for (Market)', '0', '8000', 'mmk', '', '', 0),
(360, '2024-02-06', 'Dr Feb 24/117', '6100/001', 'Labour Charges for Market', '13000', '0', 'mmk', '', '', 0),
(361, '2024-02-06', 'Dr Feb 24/117', '3600/001', 'Labour Charges for Market', '0', '13000', 'mmk', '', '', 0),
(362, '2024-02-06', 'Dr Feb 24/118', '6100/002', 'Ice 5 pcs purchase for Market Fish', '55000', '0', 'mmk', '', '', 0),
(363, '2024-02-06', 'Dr Feb 24/118', '3600/001', 'Ice 5 pcs purchase for Market Fish', '0', '55000', 'mmk', '', '', 0),
(364, '2024-02-07', 'Dr Feb 24/119', '6100/005', 'WH to GFC Carton Box carry', '40000', '0', 'mmk', '', '', 0),
(365, '2024-02-07', 'Dr Feb 24/119', '3600/001', 'WH to GFC Carton Box carry', '0', '40000', 'mmk', '', '', 0),
(366, '2024-02-07', 'Dr Feb 24/120', '6100/003', 'Paid to Plastic (G/F) for Vr  No-(6.2.24)(6.2.24)', '1438250', '0', 'mmk', '', '', 0),
(367, '2024-02-07', 'Dr Feb 24/120', '3600/001', 'Paid to Plastic (G/F) for Vr  No-(6.2.24)(6.2.24)', '0', '1438250', 'mmk', '', '', 0),
(368, '2024-02-07', 'Dr Feb 24/121', '9100/003', 'Water 4 pk purchase for WH', '3600', '0', 'mmk', '', '', 0),
(369, '2024-02-07', 'Dr Feb 24/121', '3600/001', 'Water 4 pk purchase for WH', '0', '3600', 'mmk', '', '', 0),
(370, '2024-02-07', 'Dr Feb 24/122', '9100/016', 'Photo paper purchase and Taxi Charges for WH', '69000', '0', 'mmk', '', '', 0),
(371, '2024-02-07', 'Dr Feb 24/122', '3600/001', 'Photo paper purchase and Taxi Charges for WH', '0', '69000', 'mmk', '', '', 0),
(372, '2024-02-07', 'Dr Feb 24/123', '9100/006', 'Car Diesel for 6J-3015', '50000', '0', 'mmk', '', '', 0),
(373, '2024-02-07', 'Dr Feb 24/123', '3600/001', 'Car Diesel for 6J-3015', '0', '50000', 'mmk', '', '', 0),
(374, '2024-02-07', 'Dr Feb 24/124', '9100/014', 'Car police catch for 6J-3015', '5000', '0', 'mmk', '', '', 0),
(375, '2024-02-07', 'Dr Feb 24/124', '3600/001', 'Car police catch for 6J-3015', '0', '5000', 'mmk', '', '', 0),
(376, '2024-02-07', 'Dr Feb 24/125', '9100/017', 'Sir take from Daw Nan (Cambodia go)', '100000', '0', 'mmk', '', '', 0),
(377, '2024-02-07', 'Dr Feb 24/125', '3600/001', 'Sir take from Daw Nan (Cambodia go)', '0', '100000', 'mmk', '', '', 0),
(378, '2024-02-07', 'Dr Feb 24/126', '9100/012', 'Meal allowance for Market Boy 3 pcs', '6000', '0', 'mmk', '', '', 0),
(379, '2024-02-07', 'Dr Feb 24/126', '3600/001', 'Meal allowance for Market Boy 3 pcs', '0', '6000', 'mmk', '', '', 0),
(380, '2024-02-07', 'Dr Feb 24/127', '6100/001', 'Labour Charges for Market Boy 3 pcs', '16000', '0', 'mmk', '', '', 0),
(381, '2024-02-07', 'Dr Feb 24/127', '3600/001', 'Labour Charges for Market Boy 3 pcs', '0', '16000', 'mmk', '', '', 0),
(382, '2024-02-07', 'Dr Feb 24/128', '6100/002', 'Ice 7 pcs purchase for Market Fish', '77000', '0', 'mmk', '', '', 0),
(383, '2024-02-07', 'Dr Feb 24/128', '3600/001', 'Ice 7 pcs purchase for Market Fish', '0', '77000', 'mmk', '', '', 0),
(384, '2024-02-07', 'Dr Feb 24/129', '9100/025', 'Car PK for (Market)', '2000', '0', 'mmk', '', '', 0),
(385, '2024-02-07', 'Dr Feb 24/129', '3600/001', 'Car PK for (Market)', '0', '2000', 'mmk', '', '', 0),
(386, '2024-02-07', 'Dr Feb 24/130', '9100/002', 'Taxi Charges for Boy 1 pcs house go', '3000', '0', 'mmk', '', '', 0),
(387, '2024-02-07', 'Dr Feb 24/130', '3600/001', 'Taxi Charges for Boy 1 pcs house go', '0', '3000', 'mmk', '', '', 0),
(388, '2024-02-08', 'Dr Feb 24/131', '4000/Z03', 'Paid to Zaw Myat Thu for Vr No-11357', '6000000', '0', 'mmk', '', '', 0),
(389, '2024-02-08', 'Dr Feb 24/131', '3600/001', 'Paid to Zaw Myat Thu for Vr No-11357', '0', '6000000', 'mmk', '', '', 0),
(390, '2024-02-08', 'Dr Feb 24/132', '9100/018', 'Safe Guard purchase and Lighting Repair for office', '120000', '0', 'mmk', '', '', 0),
(391, '2024-02-08', 'Dr Feb 24/132', '3600/001', 'Safe Guard purchase and Lighting Repair for office', '0', '120000', 'mmk', '', '', 0),
(392, '2024-02-08', 'Dr Feb 24/133', '9100/002', 'Taxi Charges For HHK to WH and Ice 1 pcs ', '26000', '0', 'mmk', '', '', 0),
(393, '2024-02-08', 'Dr Feb 24/133', '3600/001', 'Taxi Charges For HHK to WH and Ice 1 pcs ', '0', '26000', 'mmk', '', '', 0),
(394, '2024-02-08', 'Dr Feb 24/134', '9100/006', 'Car Diesel for 6J-3015', '50000', '0', 'mmk', '', '', 0),
(395, '2024-02-08', 'Dr Feb 24/134', '3600/001', 'Car Diesel for 6J-3015', '0', '50000', 'mmk', '', '', 0),
(396, '2024-02-08', 'Dr Feb 24/135', '9100/014', 'Engin Oil purchase for 6J-3015', '10000', '0', 'mmk', '', '', 0),
(397, '2024-02-08', 'Dr Feb 24/135', '3600/001', 'Engin Oil purchase for 6J-3015', '0', '10000', 'mmk', '', '', 0),
(398, '2024-02-08', 'Dr Feb 24/136', '6100/001', 'Labour Charges and Taxi Charges for (D-Puti)', '111000', '0', 'mmk', '', '', 0),
(399, '2024-02-08', 'Dr Feb 24/136', '3600/001', 'Labour Charges and Taxi Charges for (D-Puti)', '0', '111000', 'mmk', '', '', 0),
(400, '2024-02-08', 'Dr Feb 24/137', '6100/002', 'Ice 4 pcs purchase for (D-Puti)', '36000', '0', 'mmk', '', '', 0),
(401, '2024-02-08', 'Dr Feb 24/137', '3600/001', 'Ice 4 pcs purchase for (D-Puti)', '0', '36000', 'mmk', '', '', 0),
(402, '2024-02-08', 'Dr Feb 24/138', '9100/002', 'Taxi Charges for HHK to GFC', '17000', '0', 'mmk', '', '', 0),
(403, '2024-02-08', 'Dr Feb 24/138', '3600/001', 'Taxi Charges for HHK to GFC', '0', '17000', 'mmk', '', '', 0),
(404, '2024-02-08', 'Dr Feb 24/139', '9100/025', 'Car PK for 6J-3015 (Market)', '2000', '0', 'mmk', '', '', 0),
(405, '2024-02-08', 'Dr Feb 24/139', '3600/001', 'Car PK for 6J-3015 (Market)', '0', '2000', 'mmk', '', '', 0),
(406, '2024-02-08', 'Dr Feb 24/140', '9100/012', 'Market Boys 3 pcs Lunch', '6000', '0', 'mmk', '', '', 0),
(407, '2024-02-08', 'Dr Feb 24/140', '3600/001', 'Market Boys 3 pcs Lunch', '0', '6000', 'mmk', '', '', 0),
(408, '2024-02-08', 'Dr Feb 24/141', '6100/001', 'Labour Charges for Market Fish', '16000', '0', 'mmk', '', '', 0),
(409, '2024-02-08', 'Dr Feb 24/141', '3600/001', 'Labour Charges for Market Fish', '0', '16000', 'mmk', '', '', 0),
(410, '2024-02-08', 'Dr Feb 24/142', '6100/002', 'Ice 3 pcs purchase for WH', '33000', '0', 'mmk', '', '', 0),
(411, '2024-02-08', 'Dr Feb 24/142', '3600/001', 'Ice 3 pcs purchase for WH', '0', '33000', 'mmk', '', '', 0),
(412, '2024-02-09', 'Dr Feb 24/143', '9100/006', 'Car Diesel for 6J-3015', '50000', '0', 'mmk', '', '', 0),
(413, '2024-02-09', 'Dr Feb 24/143', '3600/001', 'Car Diesel for 6J-3015', '0', '50000', 'mmk', '', '', 0),
(414, '2024-02-09', 'Dr Feb 24/144', '9100/002', 'Taxi Charges for WH to GFC', '22000', '0', 'mmk', '', '', 0),
(415, '2024-02-09', 'Dr Feb 24/144', '3600/001', 'Taxi Charges for WH to GFC', '0', '22000', 'mmk', '', '', 0),
(416, '2024-02-09', 'Dr Feb 24/145', '9100/002', 'Taxi Charges for WH to Goverment for (Lai Lai and May Zin Myo)', '3000', '0', 'mmk', '', '', 0),
(417, '2024-02-09', 'Dr Feb 24/145', '3600/001', 'Taxi Charges for WH to Goverment for (Lai Lai and May Zin Myo)', '0', '3000', 'mmk', '', '', 0),
(418, '2024-02-09', 'Dr Feb 24/146', '9100/002', 'Taxi Charges for Car Car Driver for (9.2) 8:30 PM', '5000', '0', 'mmk', '', '', 0),
(419, '2024-02-09', 'Dr Feb 24/146', '3600/001', 'Taxi Charges for Car Car Driver for (9.2) 8:30 PM', '0', '5000', 'mmk', '', '', 0),
(420, '2024-02-09', 'Dr Feb 24/147', '9100/014', 'Car police catch for 6J-3015 (Market)', '5000', '0', 'mmk', '', '', 0),
(421, '2024-02-09', 'Dr Feb 24/147', '3600/001', 'Car police catch for 6J-3015 (Market)', '0', '5000', 'mmk', '', '', 0),
(422, '2024-02-09', 'Dr Feb 24/148', '6100/001', 'Labour Charges for Ocean Pacific (Raw)', '13000', '0', 'mmk', '', '', 0),
(423, '2024-02-09', 'Dr Feb 24/148', '3600/001', 'Labour Charges for Ocean Pacific (Raw)', '0', '13000', 'mmk', '', '', 0),
(424, '2024-02-09', 'Dr Feb 24/149', '9100/002', 'Taxi Charges for Ocean to WH', '15000', '0', 'mmk', '', '', 0),
(425, '2024-02-09', 'Dr Feb 24/149', '3600/001', '', '0', '15000', 'mmk', '', '', 0),
(426, '2024-02-09', 'Dr Feb 24/150', '9100/012', 'Boy 2 pcs Lunch for Ocean (Pk)', '4000', '0', 'mmk', '', '', 0),
(427, '2024-02-09', 'Dr Feb 24/150', '3600/001', 'Boy 2 pcs Lunch for Ocean (Pk)', '0', '4000', 'mmk', '', '', 0),
(428, '2024-02-09', 'Dr Feb 24/151', '6100/001', 'Labour Charges for D-Puti (230viss*600) and Taxi Charges (20000)', '158000', '0', 'mmk', '', '', 0),
(429, '2024-02-09', 'Dr Feb 24/151', '3600/001', 'Labour Charges for D-Puti (230viss*600) and Taxi Charges (20000)', '0', '158000', 'mmk', '', '', 0),
(430, '2024-02-09', 'Dr Feb 24/152', '6100/002', 'Ice 2 pcs purchase for D-Puti', '18000', '0', 'mmk', '', '', 0),
(431, '2024-02-09', 'Dr Feb 24/152', '3600/001', 'Ice 2 pcs purchase for D-Puti', '0', '18000', 'mmk', '', '', 0),
(432, '2024-02-09', 'Dr Feb 24/153', '9100/012', 'Boys 2 pcs Lunch and Dinner for (HHK)', '12000', '0', 'mmk', '', '', 0),
(433, '2024-02-09', 'Dr Feb 24/153', '3600/001', 'Boys 2 pcs Lunch and Dinner for (HHK)', '0', '12000', 'mmk', '', '', 0),
(434, '2024-02-09', 'Dr Feb 24/154', '4000/T11', 'Paid to Tun Zaw Min for Vr No-11074, 11079 Cheque No-052403', '40000000', '0', 'mmk', '', '', 0),
(435, '2024-02-09', 'Dr Feb 24/154', '3600/001', 'Paid to Tun Zaw Min for Vr No-11074, 11079 Cheque No-052403', '0', '40000000', 'mmk', '', '', 0),
(436, '2024-02-09', 'Dr Feb 24/155', '9100/002', 'Taxi Charges for WH to Market and WH', '27000', '0', 'mmk', '', '', 0),
(437, '2024-02-09', 'Dr Feb 24/155', '3600/001', 'Taxi Charges for WH to Market and WH', '0', '27000', 'mmk', '', '', 0),
(438, '2024-02-09', 'Dr Feb 24/156', '9100/012', 'Meal allowance for MArket and WH', '10500', '0', 'mmk', '', '', 0),
(439, '2024-02-09', 'Dr Feb 24/156', '3600/001', 'Meal allowance for Market Boy', '0', '10500', 'mmk', '', '', 0),
(440, '2024-02-09', 'Dr Feb 24/157', '6100/001', 'Labour Charges for Market Fish', '23000', '0', 'mmk', '', '', 0),
(441, '2024-02-09', 'Dr Feb 24/157', '3600/001', 'Labour Charges for Market Fish', '0', '23000', 'mmk', '', '', 0),
(442, '2024-02-09', 'Dr Feb 24/158', '6100/002', 'Ice 6 pcs purchase for Market Fish', '66000', '0', 'mmk', '', '', 0),
(443, '2024-02-09', 'Dr Feb 24/158', '3600/001', 'Ice 6 pcs purchase for Market Fish', '0', '66000', 'mmk', '', '', 0),
(444, '2024-02-09', 'Dr Feb 24/159', '9100/025', 'Car PK and OT for Market', '7000', '0', 'mmk', '', '', 0),
(445, '2024-02-09', 'Dr Feb 24/159', '3600/001', 'Car PK and OT for Market', '0', '7000', 'mmk', '', '', 0),
(446, '2024-02-06', 'Cr-Feb 24/004', '3600/002', '$23462.5 in UAB Bank', '23462.5', '0', 'usd', '', '', 0),
(447, '2024-02-06', 'Cr-Feb 24/004', '3300/004', '$23462.5 in UAB Bank', '0', '23462.5', 'usd', '', '', 0),
(454, '2024-02-06', 'Cr-Feb 24/005', '3600/001', 'USA Money from UAB ($74925=50 50-$32761.64,65 35-$42163.36) $32761.64=>$16380.82-10=$16370.82*2100ks $16380.82*3370ks $16380.82*105ks and $42163.36=> $14757.18*2100ks, $27406.18 in UAB USD Bank', '65368800', '0', 'usd', '', '', 0),
(455, '2024-02-06', 'Cr-Feb 24/005', '3300/002', 'USA Money from UAB ($74925=50 50-$32761.64,65 35-$42163.36) $32761.64=>$16380.82-10=$16370.82*2100ks $16380.82*3370ks $16380.82*105ks and $42163.36=> $14757.18*2100ks, $27406.18 in UAB USD Bank', '0', '65368800', 'usd', '', '', 0),
(456, '2024-02-06', 'Cr-Feb 24/005', '3600/001', 'USA Money from UAB ($74925=50 50-$32761.64,65 35-$42163.36) $32761.64=>$16380.82-10=$16370.82*2100ks $16380.82*3370ks $16380.82*105ks and $42163.36=> $14757.18*2100ks, $27406.18 in UAB USD Bank', '56923349.5', '0', 'usd', '', '', 0),
(457, '2024-02-06', 'Cr-Feb 24/005', '3300/002', 'USA Money from UAB ($74925=50 50-$32761.64,65 35-$42163.36) $32761.64=>$16380.82-10=$16370.82*2100ks $16380.82*3370ks $16380.82*105ks and $42163.36=> $14757.18*2100ks, $27406.18 in UAB USD Bank', '0', '56923349.5', 'usd', '', '', 0),
(458, '2024-02-12', 'Dr-Feb 24/160', '9100/006', 'Car Petrol for 6J-3015 10.2.24,11.2.24,12.2.24', '150000', '0', 'mmk', '', '', 0),
(459, '2024-02-12', 'Dr-Feb 24/160', '3600/001', 'Car Petrol for 6J-3015 10.2.24,11.2.24,12.2.24', '0', '150000', 'mmk', '', '', 0),
(460, '2024-02-12', 'Dr-Feb 24/161', '6100/007', 'Paid to Ocean Pacific Cold Store Charges Balance Amt ', '1112614', '0', 'mmk', '', '', 0),
(461, '2024-02-12', 'Dr-Feb 24/161', '3600/001', 'Paid to Ocean Pacific Cold Store Charges Balance Amt ', '0', '1112614', 'mmk', '', '', 0),
(462, '2024-02-12', 'Dr-Feb 24/162', '9100/007', 'Machine Repair for W/H PK Machine', '306000', '0', 'mmk', '', '', 0),
(463, '2024-02-12', 'Dr-Feb 24/162', '3600/001', 'Machine Repair for W/H PK Machine', '0', '306000', 'mmk', '', '', 0),
(464, '2024-02-12', 'Dr-Feb 24/163', '6100/003', 'Paid to Plastic (G/F) for 7.2.2024,8.2.24,9.2.24', '473750', '0', 'mmk', '', '', 0),
(465, '2024-02-12', 'Dr-Feb 24/163', '3600/001', 'Paid to Plastic (G/F) for 7.2.2024,8.2.24,9.2.24', '0', '473750', 'mmk', '', '', 0),
(466, '2024-02-12', 'Dr-Feb 24/164', '9100/003', 'Water 5Pk Purchase for W/H', '4500', '0', 'mmk', '', '', 0),
(467, '2024-02-12', 'Dr-Feb 24/164', '3600/001', 'Water 5Pk Purchase for W/H', '0', '4500', 'mmk', '', '', 0),
(468, '2024-02-12', 'Dr-Feb 24/165', '6100/006', 'Paid to Sticker 5 Colour and Taxi Charges', '2163000', '0', 'mmk', '', '', 0),
(469, '2024-02-12', 'Dr-Feb 24/165', '3600/001', 'Paid to Sticker 5 Colour and Taxi Charges', '0', '2163000', 'mmk', '', '', 0),
(470, '2024-02-12', 'Dr-Feb 24/166', '9100/002', 'Taxi Charges for Ocean to W/H for 11.2.24-12000,12.2.24-22000', '34000', '0', 'mmk', '', '', 0),
(471, '2024-02-12', 'Dr-Feb 24/166', '3600/001', 'Taxi Charges for Ocean to W/H for 11.2.24-12000,12.2.24-22000', '0', '34000', 'mmk', '', '', 0),
(472, '2024-02-12', 'Dr-Feb 24/167', '6100/003', 'Penam Bag,Rubber Ring and Photo Sticker Purchase for W/H\r\n', '832250', '0', 'mmk', '', '', 0),
(473, '2024-02-12', 'Dr-Feb 24/167', '3600/001', 'Penam Bag,Rubber Ring and Photo Sticker Purchase for W/H\r\n', '0', '832250', 'mmk', '', '', 0),
(474, '2024-02-12', 'Dr-Feb 24/168', '9100/002', 'Taxi Charges for Ocean to W/H 10.2.24\r\n', '20000', '0', 'mmk', '', '', 0),
(475, '2024-02-12', 'Dr-Feb 24/168', '3600/001', 'Taxi Charges for Ocean to W/H 10.2.24\r\n', '0', '20000', 'mmk', '', '', 0),
(476, '2024-02-12', 'Dr-Feb 24/169', '9100/006', 'Car Petrol for 5L-2848\r\n', '160000', '0', 'mmk', '', '', 0),
(477, '2024-02-12', 'Dr-Feb 24/169', '3600/001', 'Car Petrol for 5L-2848\r\n', '0', '160000', 'mmk', '', '', 0),
(478, '2024-02-12', 'Dr-Feb 24/170', '9100/007', 'Gas Filling for Sir House\r\n', '70000', '0', 'mmk', '', '', 0),
(479, '2024-02-12', 'Dr-Feb 24/170', '3600/001', 'Gas Filling for Sir House\r\n', '0', '70000', 'mmk', '', '', 0),
(480, '2024-02-12', 'Dr-Feb 24/171', '9100/005', 'Fish Sample Purchase \r\n', '31600', '0', 'mmk', '', '', 0),
(481, '2024-02-12', 'Dr-Feb 24/171', '3600/001', 'Fish Sample Purchase \r\n', '0', '31600', 'mmk', '', '', 0),
(482, '2024-02-12', 'Dr-Feb 24/172', '9100/012', 'Meal Allowance for Market Boy\r\n', '10500', '0', 'mmk', '', '', 0),
(483, '2024-02-12', 'Dr-Feb 24/172', '3600/001', 'Meal Allowance for Market Boy\r\n', '0', '10500', 'mmk', '', '', 0),
(484, '2024-02-12', 'Dr-Feb 24/173', '9100/025', 'Car Parking for Market \r\n', '2000', '0', 'mmk', '', '', 0),
(485, '2024-02-12', 'Dr-Feb 24/173', '3600/001', 'Car Parking for Market \r\n', '0', '2000', 'mmk', '', '', 0),
(486, '2024-02-12', 'Dr-Feb 24/174', '6100/001', 'Labour Charges for Market Fish\r\n', '12500', '0', 'mmk', '', '', 0),
(487, '2024-02-12', 'Dr-Feb 24/174', '3600/001', 'Labour Charges for Market Fish\r\n', '0', '12500', 'mmk', '', '', 0),
(488, '2024-02-12', 'Dr-Feb 24/175', '6100/002', 'Ice 3.5pcs Purchase for Market Fish\r\n', '38500', '0', 'mmk', '', '', 0),
(489, '2024-02-12', 'Dr-Feb 24/175', '3600/001', 'Ice 3.5pcs Purchase for Market Fish\r\n', '0', '38500', 'mmk', '', '', 0),
(490, '2024-02-13', 'Dr-Feb 24/176', '9100/004', 'Phone Bill for Sir', '3000', '0', 'mmk', '', '', 0),
(491, '2024-02-13', 'Dr-Feb 24/176', '3600/001', 'Phone Bill for Sir', '0', '3000', 'mmk', '', '', 0),
(492, '2024-02-13', 'Dr-Feb 24/177', '9100/002', 'Taxi Charges for W/H to UAB to Café shop\r\n', '5000', '0', 'mmk', '', '', 0),
(493, '2024-02-13', 'Dr-Feb 24/177', '3600/001', 'Taxi Charges for W/H to UAB to Café shop\r\n', '0', '5000', 'mmk', '', '', 0),
(494, '2024-02-13', 'Dr-Feb 24/178', '9100/011', 'Rice 60*89000ks,Beam 10*120000ks/10*148500 and Oil-30*26500ks and Car Charges, Taxi for Mingalar Charity Donation\r\n', '8883000', '0', 'mmk', '', '', 0),
(495, '2024-02-13', 'Dr-Feb 24/178', '3600/001', 'Rice 60*89000ks,Beam 10*120000ks/10*148500 and Oil-30*26500ks and Car Charges, Taxi for Mingalar Charity Donation\r\n', '0', '8883000', 'mmk', '', '', 0),
(496, '2024-02-13', 'Dr-Feb 24/179', '9100/018', 'Safe Guard 2pcs Purchase for W/H\r\n', '62000', '0', 'mmk', '', '', 0),
(497, '2024-02-13', 'Dr-Feb 24/179', '3600/001', 'Safe Guard 2pcs Purchase for W/H\r\n', '0', '62000', 'mmk', '', '', 0),
(498, '2024-02-13', 'Dr-Feb 24/180', '9100/002', 'Taxi Charges for GFC To W/H\r\n', '21000', '0', 'mmk', '', '', 0);
INSERT INTO `transaction` (`id`, `date`, `voucher_no`, `ac_code`, `description`, `debit`, `credit`, `currency`, `sr_no`, `container_no`, `bank_charges`) VALUES
(499, '2024-02-13', 'Dr-Feb 24/180', '3600/001', 'Taxi Charges for GFC To W/H\r\n', '0', '21000', 'mmk', '', '', 0),
(500, '2024-02-13', 'Dr-Feb 24/181', '9100/011', 'Car Rental Charges for Mingalar Charity Donation (ADV;)\r\n', '200000', '0', 'mmk', '', '', 0),
(501, '2024-02-13', 'Dr-Feb 24/181', '3600/001', 'Car Rental Charges for Mingalar Charity Donation (ADV;)\r\n', '0', '200000', 'mmk', '', '', 0),
(502, '2024-02-13', 'Dr-Feb 24/182', '4000/T05', 'Paid to Thet Oo for Vr No-11132,11202,11215,11242,11265,11279 Cheque No-052404\r\n', '40000000', '0', 'mmk', '', '', 0),
(503, '2024-02-13', 'Dr-Feb 24/182', '3600/001', 'Paid to Thet Oo for Vr No-11132,11202,11215,11242,11265,11279 Cheque No-052404\r\n', '0', '40000000', 'mmk', '', '', 0),
(504, '2024-02-13', 'Dr-Feb 24/183', '4000/T02', 'Paid to Thein Htay for Vr No-11269,11344,11359 Cheque No-052405\r\n', '6000000', '0', 'mmk', '', '', 0),
(505, '2024-02-13', 'Dr-Feb 24/183', '3600/001', 'Paid to Thein Htay for Vr No-11269,11344,11359 Cheque No-052405\r\n', '0', '6000000', 'mmk', '', '', 0),
(506, '2024-02-13', 'Dr-Feb 24/184', '9100/012', 'Meal Allownace for Market Boys \r\n', '10500', '0', 'mmk', '', '', 0),
(507, '2024-02-13', 'Dr-Feb 24/184', '3600/001', 'Meal Allownace for Market Boys \r\n', '0', '10500', 'mmk', '', '', 0),
(508, '2024-02-13', 'Dr-Feb 24/185', '9100/025', 'Car Parking for Market \r\n', '2000', '0', 'mmk', '', '', 0),
(509, '2024-02-13', 'Dr-Feb 24/185', '3600/001', 'Car Parking for Market \r\n', '0', '2000', 'mmk', '', '', 0),
(510, '2024-02-13', 'Dr-Feb 24/186', '6100/001', 'Labour Charges for Market Fish\r\n', '8000', '0', 'mmk', '', '', 0),
(511, '2024-02-13', 'Dr-Feb 24/186', '3600/001', 'Labour Charges for Market Fish\r\n', '0', '8000', 'mmk', '', '', 0),
(512, '2024-02-13', 'Dr-Feb 24/187', '6100/002', 'Ice 2pcs Purchase for Market Fish\r\n', '22000', '0', 'mmk', '', '', 0),
(513, '2024-02-13', 'Dr-Feb 24/187', '3600/001', 'Ice 2pcs Purchase for Market Fish\r\n', '0', '22000', 'mmk', '', '', 0),
(524, '2024-02-14', 'Cr-Feb 24/006', '3600/001', 'UAB Bank Bal money for ($50868.68) (9.2.24)- $12000*3475 (13.2.24)-11462.5*3475 Italy Money 65%Balance\r\n', '41700000', '0', 'usd', '', '', 0),
(525, '2024-02-14', 'Cr-Feb 24/006', '3300/004', 'UAB Bank Bal money for ($50868.68) (9.2.24)- $12000*3475 (13.2.24)-11462.5*3475 Italy Money 65%Balance\r\n', '0', '41700000', 'usd', '', '', 0),
(526, '2024-02-14', 'Cr-Feb 24/006', '3600/001', 'UAB Bank Bal money for ($50868.68) (9.2.24)- $12000*3475 (13.2.24)-11462.5*3475 Italy Money 65%Balance\r\n', '39832187.5', '0', 'usd', '', '', 0),
(527, '2024-02-14', 'Cr-Feb 24/006', '3300/004', 'UAB Bank Bal money for ($50868.68) (9.2.24)- $12000*3475 (13.2.24)-11462.5*3475 Italy Money 65%Balance\r\n', '0', '39832187.5', 'usd', '', '', 0),
(528, '2024-02-14', 'Cr-Feb 24/006', '3600/001', 'UAB Bank Bal money for ($50868.68) (13.2.24)-27406.18*3475ks USA Money 74925 (65%Balance of 42163.36)\r\n', '95236475.5', '0', 'usd', '', '', 0),
(529, '2024-02-14', 'Cr-Feb 24/006', '3300/002', 'UAB Bank Bal money for ($50868.68) (13.2.24)-27406.18*3475ks USA Money 74925 (65%Balance of 42163.36)\r\n', '0', '95236475.5', 'usd', '', '', 0),
(530, '2024-02-14', 'Cr-Feb 24/007', '3600/001', 'USA Money Received from UAB ($74925) 65% , 35% $26223.75-10=26213.75*2100ks $48701.25*3475\r\n', '55048875', '0', 'usd', '', '', 0),
(531, '2024-02-14', 'Cr-Feb 24/007', '3300/002', 'USA Money Received from UAB ($74925) 65% , 35% $26223.75-10=26213.75*2100ks $48701.25*3475\r\n', '0', '55048875', 'usd', '', '', 0),
(532, '2024-02-14', 'Cr-Feb 24/007', '3600/001', 'USA Money (Mr-Sarmad ) Test Transfer form UAB 65% , 35% ($960.48) $336.17-10=$326.17*2100ks ($624.31 Balance in UAB USD A/C)\r\n', '169236843.75', '0', 'usd', '', '', 0),
(533, '2024-02-14', 'Cr-Feb 24/007', '3300/002', 'USA Money Received from UAB ($74925) 65% , 35% $26223.75-10=26213.75*2100ks $48701.25*3475\r\n', '0', '169236843.75', 'usd', '', '', 0),
(534, '2024-02-14', 'Cr-Feb 24/008', '3600/001', 'USA Money (Mr-Sarmad ) Test Transfer form UAB 65% , 35% ($960.48) $336.17-10=$326.17*2100ks ($624.31 Balance in UAB USD A/C)\r\n', '684957', '0', 'usd', '', '', 0),
(535, '2024-02-14', 'Cr-Feb 24/008', '3300/002', 'USA Money (Mr-Sarmad ) Test Transfer form UAB 65% , 35% ($960.48) $336.17-10=$326.17*2100ks ($624.31 Balance in UAB USD A/C)\r\n', '0', '684957', 'usd', '', '', 0),
(536, '2024-02-14', 'Cr-Feb 24/008', '3600/002', 'USA Money (Mr-Sarmad ) Test Transfer form UAB 65% , 35% ($960.48) $336.17-10=$326.17*2100ks ($624.31 Balance in UAB USD A/C)\r\n', '634.31', '0', 'usd', '', '', 10),
(537, '2024-02-14', 'Cr-Feb 24/008', '3300/002', 'USA Money (Mr-Sarmad ) Test Transfer form UAB 65% , 35% ($960.48) $336.17-10=$326.17*2100ks ($624.31 Balance in UAB USD A/C)\r\n', '0', '634.31', 'usd', '', '', 0),
(538, '2024-02-14', 'Dr-Feb 24/188', '4000/T03', 'Paid to Thin Thin Yee for Vr No-11176,11177\r\n', '50000000', '0', 'mmk', '', '', 0),
(539, '2024-02-14', 'Dr-Feb 24/188', '3600/001', 'Paid to Thin Thin Yee for Vr No-11176,11177\r\n', '0', '50000000', 'mmk', '', '', 0),
(540, '2024-02-14', 'Dr-Feb 24/189', '4000/Y01', 'Paid to Ye Yint for Vr No-11133,11135\r\n', '4000000', '0', 'mmk', '', '', 0),
(541, '2024-02-14', 'Dr-Feb 24/189', '3600/001', 'Paid to Ye Yint for Vr No-11133,11135\r\n', '0', '4000000', 'mmk', '', '', 0),
(542, '2024-02-14', 'Dr-Feb 24/190', '4000/Z03', 'Paid to Zaw Myat Thu for Vr No-11357,11361\r\n', '10000000', '0', 'mmk', '', '', 0),
(543, '2024-02-14', 'Dr-Feb 24/190', '3600/001', 'Paid to Zaw Myat Thu for Vr No-11357,11361\r\n', '0', '10000000', 'mmk', '', '', 0),
(544, '2024-02-14', 'Dr-Feb 24/191', '4000/S03', 'Paid to Soe Min for Vr No-11020,11069,11121\r\n', '20000000', '0', 'mmk', '', '', 0),
(545, '2024-02-14', 'Dr-Feb 24/191', '3600/001', 'Paid to Soe Min for Vr No-11020,11069,11121\r\n', '0', '20000000', 'mmk', '', '', 0),
(546, '2024-02-14', 'Dr-Feb 24/192', '4000/T11', 'Paid to Tun Zaw Min for Vr No-11079\r\n', '30000000', '0', 'mmk', '', '', 0),
(547, '2024-02-14', 'Dr-Feb 24/192', '3600/001', 'Paid to Tun Zaw Min for Vr No-11079\r\n', '0', '30000000', 'mmk', '', '', 0),
(548, '2024-02-14', 'Dr-Feb 24/193', '4000/S05', 'Paid to Si Thu (D-22) for Vr No\r\n', '6000000', '0', 'mmk', '', '', 0),
(549, '2024-02-14', 'Dr-Feb 24/193', '3600/001', 'Paid to Si Thu (D-22) for Vr No\r\n', '0', '6000000', 'mmk', '', '', 0),
(550, '2024-02-14', 'Dr-Feb 24/194', '4000/M03', 'Paid to Mg Mg Nyunt for Vr No-11192\r\n', '5000000', '0', 'mmk', '', '', 0),
(551, '2024-02-14', 'Dr-Feb 24/194', '3600/001', 'Paid to Mg Mg Nyunt for Vr No-11192\r\n', '0', '5000000', 'mmk', '', '', 0),
(552, '2024-02-14', 'Dr-Feb 24/195', '4000/P01', 'Paid to Phone Naing for Vr No-11268\r\n', '3000000', '0', 'mmk', '', '', 0),
(553, '2024-02-14', 'Dr-Feb 24/195', '3600/001', 'Paid to Phone Naing for Vr No-11268\r\n', '0', '3000000', 'mmk', '', '', 0),
(554, '2024-02-14', 'Dr-Feb 24/196', '4000/M06', 'Paid to Mg Mg Soe for Vr No-11185,11198\r\n', '5000000', '0', 'mmk', '', '', 0),
(555, '2024-02-14', 'Dr-Feb 24/196', '3600/001', 'Paid to Mg Mg Soe for Vr No-11185,11198\r\n', '0', '5000000', 'mmk', '', '', 0),
(556, '2024-02-14', 'Dr-Feb 24/197', '4000/S07', 'Paid to Soe Thein (TCL) for Vr No-00123\r\n', '12000000', '0', 'mmk', '', '', 0),
(557, '2024-02-14', 'Dr-Feb 24/197', '3600/001', 'Paid to Soe Thein (TCL) for Vr No-00123\r\n', '0', '12000000', 'mmk', '', '', 0),
(558, '2024-02-14', 'Dr-Feb 24/198', '4000/T05', 'Paid to Thet Oo for Vr No-11279,11328,11348\r\n', '50000000', '0', 'mmk', '', '', 0),
(559, '2024-02-14', 'Dr-Feb 24/198', '3600/001', 'Paid to Thet Oo for Vr No-11279,11328,11348\r\n', '0', '50000000', 'mmk', '', '', 0),
(560, '2024-02-14', 'Dr-Feb 24/199', '4000/K07', 'Paid to Khin Mg Myint for Vr No-11189\r\n', '7000000', '0', 'mmk', '', '', 0),
(561, '2024-02-14', 'Dr-Feb 24/199', '3600/001', 'Paid to Khin Mg Myint for Vr No-11189\r\n', '0', '7000000', 'mmk', '', '', 0),
(562, '2024-02-14', 'Dr-Feb 24/200', '4000/C02', 'Paid to Cho Mg for Vr No-11161\r\n', '4000000', '0', 'mmk', '', '', 0),
(563, '2024-02-14', 'Dr-Feb 24/200', '3600/001', 'Paid to Cho Mg for Vr No-11161\r\n', '0', '4000000', 'mmk', '', '', 0),
(564, '2024-02-14', 'Dr-Feb 24/201', '4000/B01', 'Paid to Bar Bu Lay for Vr No-11263,11323\r\n', '4000000', '0', 'mmk', '', '', 0),
(565, '2024-02-14', 'Dr-Feb 24/201', '3600/001', 'Paid to Bar Bu Lay for Vr No-11263,11323\r\n', '0', '4000000', 'mmk', '', '', 0),
(566, '2024-02-14', 'Dr-Feb 24/202', '4000/A07', 'Paid to A Thay Lay for Vr No-11237\r\n', '3000000', '0', 'mmk', '', '', 0),
(567, '2024-02-14', 'Dr-Feb 24/202', '3600/001', 'Paid to A Thay Lay for Vr No-11237\r\n', '0', '3000000', 'mmk', '', '', 0),
(568, '2024-02-14', 'Dr-Feb 24/203', '4000/S08', 'Paid to Soe Naing for Vr No-10542\r\n', '5000000', '0', 'mmk', '', '', 0),
(569, '2024-02-14', 'Dr-Feb 24/203', '3600/001', 'Paid to Soe Naing for Vr No-10542\r\n', '0', '5000000', 'mmk', '', '', 0),
(570, '2024-02-14', 'Dr-Feb 24/204', '4000/K04', 'Paid to Kaung Myat for Vr No-11341\r\n', '4000000', '0', 'mmk', '', '', 0),
(571, '2024-02-14', 'Dr-Feb 24/204', '3600/001', 'Paid to Kaung Myat for Vr No-11341\r\n', '0', '4000000', 'mmk', '', '', 0),
(572, '2024-02-14', 'Dr-Feb 24/205', '4000/A02', 'Paid to Arr Kae for Vr No-11199,11248\r\n', '4000000', '0', 'mmk', '', '', 0),
(573, '2024-02-14', 'Dr-Feb 24/205', '3600/001', 'Paid to Arr Kae for Vr No-11199,11248\r\n', '0', '4000000', 'mmk', '', '', 0),
(574, '2024-02-14', 'Dr-Feb 24/206', '4000/A03', 'Paid to Aung Naing Oo for Vr No-11021,11049,11067,11085\r\n', '7000000', '0', 'mmk', '', '', 0),
(575, '2024-02-14', 'Dr-Feb 24/206', '3600/001', 'Paid to Aung Naing Oo for Vr No-11021,11049,11067,11085\r\n', '0', '7000000', 'mmk', '', '', 0),
(576, '2024-02-14', 'Dr-Feb 24/207', '4000/A01', 'Paid to AK for Vr No-11023,11082,11128\r\n', '6000000', '0', 'mmk', '', '', 0),
(577, '2024-02-14', 'Dr-Feb 24/207', '3600/001', 'Paid to AK for Vr No-11023,11082,11128\r\n', '0', '6000000', 'mmk', '', '', 0),
(578, '2024-02-14', 'Dr-Feb 24/208', '4000/A06', 'Paid to Aung Zaw Oo for Vr No-11172,11184\r\n', '3000000', '0', 'mmk', '', '', 0),
(579, '2024-02-14', 'Dr-Feb 24/208', '3600/001', 'Paid to Aung Zaw Oo for Vr No-11172,11184\r\n', '0', '3000000', 'mmk', '', '', 0),
(580, '2024-02-14', 'Dr-Feb 24/209', '4000/S01', 'Paid to Shwe Late for Vr No-10902,10923,10937,10941\r\n', '6000000', '0', 'mmk', '', '', 0),
(581, '2024-02-14', 'Dr-Feb 24/209', '3600/001', 'Paid to Shwe Late for Vr No-10902,10923,10937,10941\r\n', '0', '6000000', 'mmk', '', '', 0),
(582, '2024-02-14', 'Dr-Feb 24/210', '4000/001', 'Paid to 4 Zaw for Vr No-11054\r\n', '6000000', '0', 'mmk', '', '', 0),
(583, '2024-02-14', 'Dr-Feb 24/210', '3600/001', 'Paid to 4 Zaw for Vr No-11054\r\n', '0', '6000000', 'mmk', '', '', 0),
(584, '2024-02-14', 'Dr-Feb 24/211', '6100/003', 'Penam Bag and Taxi Charges for WH\r\n', '20500', '0', 'mmk', '', '', 0),
(585, '2024-02-14', 'Dr-Feb 24/211', '3600/001', 'Penam Bag and Taxi Charges for WH\r\n', '0', '20500', 'mmk', '', '', 0),
(586, '2024-02-14', 'Dr-Feb 24/212', '9100/012', 'Meal Allowance for Office 5pcs Payment Day\r\n', '10000', '0', 'mmk', '', '', 0),
(587, '2024-02-14', 'Dr-Feb 24/212', '3600/001', 'Meal Allowance for Office 5pcs Payment Day\r\n', '0', '10000', 'mmk', '', '', 0),
(588, '2024-02-14', 'Dr-Feb 24/213', '9100/002', 'Taxi Charges for Office 5 pcs Payment Day  \r\n', '29000', '0', 'mmk', '', '', 0),
(589, '2024-02-14', 'Dr-Feb 24/213', '3600/001', 'Taxi Charges for Office 5 pcs Payment Day  \r\n', '0', '29000', 'mmk', '', '', 0),
(590, '2024-02-14', 'Dr-Feb 24/214', '6100/003', 'Paid to Plastic (G/F) for (12.2)\r\n', '1193500', '0', 'mmk', '', '', 0),
(591, '2024-02-14', 'Dr-Feb 24/214', '3600/001', 'Paid to Plastic (G/F) for (12.2)\r\n', '0', '1193500', 'mmk', '', '', 0),
(592, '2024-02-14', 'Dr-Feb 24/215', '9100/003', 'Water 5pcs Purchase for W/H\r\n', '4500', '0', 'mmk', '', '', 0),
(593, '2024-02-14', 'Dr-Feb 24/215', '3600/001', 'Water 5pcs Purchase for W/H\r\n', '0', '4500', 'mmk', '', '', 0),
(594, '2024-02-14', 'Dr-Feb 24/216', '6100/004', 'Kit Box Carry Charges for W/H to Ocean\r\n', '60000', '0', 'mmk', '', '', 0),
(595, '2024-02-14', 'Dr-Feb 24/216', '3600/001', 'Kit Box Carry Charges for W/H to Ocean\r\n', '0', '60000', 'mmk', '', '', 0),
(596, '2024-02-14', 'Dr-Feb 24/217', '9100/007', 'Roller Rope Purchase for PK Machine\r\n', '55500', '0', 'mmk', '', '', 0),
(597, '2024-02-14', 'Dr-Feb 24/217', '3600/001', 'Roller Rope Purchase for PK Machine\r\n', '0', '55500', 'mmk', '', '', 0),
(598, '2024-02-14', 'Dr-Feb 24/218', '9100/011', 'Candy Purchase for Mingalar Charity Donation \r\n', '38500', '0', 'mmk', '', '', 0),
(599, '2024-02-14', 'Dr-Feb 24/218', '3600/001', 'Candy Purchase for Mingalar Charity Donation \r\n', '0', '38500', 'mmk', '', '', 0),
(600, '2024-02-14', 'Dr-Feb 24/219', '9100/002', 'Taxi Charges for W/H to GFC RP Change\r\n', '22000', '0', 'mmk', '', '', 0),
(601, '2024-02-14', 'Dr-Feb 24/219', '3600/001', 'Taxi Charges for W/H to GFC RP Change\r\n', '0', '22000', 'mmk', '', '', 0),
(602, '2024-02-14', 'Dr-Feb 24/220', '9100/007', 'Digital Battery Purchase for W/H\r\n', '10500', '0', 'mmk', '', '', 0),
(603, '2024-02-14', 'Dr-Feb 24/220', '3600/001', 'Digital Battery Purchase for W/H\r\n', '0', '10500', 'mmk', '', '', 0),
(604, '2024-02-14', 'Dr-Feb 24/221', '6100/002', 'Ice 10 pcs for Raw\r\n', '100000', '0', 'mmk', '', '', 0),
(605, '2024-02-14', 'Dr-Feb 24/221', '3600/001', 'Ice 10 pcs for Raw\r\n', '0', '100000', 'mmk', '', '', 0),
(606, '2024-02-14', 'Dr-Feb 24/222', '6100/001', 'Labour Charges for D-Puti (160 viss*600) and Taxi Charges -15000\r\n', '111000', '0', 'mmk', '', '', 0),
(607, '2024-02-14', 'Dr-Feb 24/222', '3600/001', 'Labour Charges for D-Puti (160 viss*600) and Taxi Charges -15000\r\n', '0', '111000', 'mmk', '', '', 0),
(608, '2024-02-14', 'Dr-Feb 24/223', '6100/002', 'Ice purchase and Carry for (D-Puti)\r\n', '51000', '0', 'mmk', '', '', 0),
(609, '2024-02-14', 'Dr-Feb 24/223', '3600/001', 'Ice purchase and Carry for (D-Puti)\r\n', '0', '51000', 'mmk', '', '', 0),
(610, '2024-02-14', 'Dr-Feb 24/224', '9100/006', 'Car Petrol for 6J-3015 13.2.24/14.2.24\r\n', '100000', '0', 'mmk', '', '', 0),
(611, '2024-02-14', 'Dr-Feb 24/224', '3600/001', 'Car Petrol for 6J-3015 13.2.24/14.2.24\r\n', '0', '100000', 'mmk', '', '', 0),
(612, '2024-02-14', 'Dr-Feb 24/225', '9100/002', 'Taxi Charges for W/H to GFC to W/H RP Change\r\n', '25000', '0', 'mmk', '', '', 0),
(613, '2024-02-14', 'Dr-Feb 24/225', '3600/001', 'Taxi Charges for W/H to GFC to W/H RP Change\r\n', '0', '25000', 'mmk', '', '', 0),
(614, '2024-02-14', 'Dr-Feb 24/226', '9100/019', 'Kaspersky and Services Charges for Daw Nan (New Computer)\r\n', '36500', '0', 'mmk', '', '', 0),
(615, '2024-02-14', 'Dr-Feb 24/226', '3600/001', 'Kaspersky and Services Charges for Daw Nan (New Computer)\r\n', '0', '36500', 'mmk', '', '', 0),
(616, '2024-02-14', 'Dr-Feb 24/227', '9100/002', 'Taxi Charges for HHK to W/H\r\n', '22000', '0', 'mmk', '', '', 0),
(617, '2024-02-14', 'Dr-Feb 24/227', '3600/001', 'Taxi Charges for HHK to W/H\r\n', '0', '22000', 'mmk', '', '', 0),
(618, '2024-02-14', 'Dr-Feb 24/228', '6100/001', 'Labour Charges for D-Puti (260 viss*600) Mrigal (SL) (125 viss*130) and Taxi Charges\r\n', '202250', '0', 'mmk', '', '', 0),
(619, '2024-02-14', 'Dr-Feb 24/228', '3600/001', 'Labour Charges for D-Puti (260 viss*600) Mrigal (SL) (125 viss*130) and Taxi Charges\r\n', '0', '202250', 'mmk', '', '', 0),
(620, '2024-02-14', 'Dr-Feb 24/228', '6100/002', 'Ice 7pcs Purchase for Dputi,Boal,Ayar,Rohu,Mrigal 7*9000ks\r\n', '63000', '0', 'mmk', '', '', 0),
(621, '2024-02-14', 'Dr-Feb 24/228', '3600/001', 'Ice 7pcs Purchase for Dputi,Boal,Ayar,Rohu,Mrigal 7*9000ks\r\n', '0', '63000', 'mmk', '', '', 0),
(622, '2024-02-14', 'Dr-Feb 24/229', '9100/018', 'Extention 1 pcs purchase for WH\r\n', '11000', '0', 'mmk', '', '', 0),
(623, '2024-02-14', 'Dr-Feb 24/229', '3600/001', 'Extention 1 pcs purchase for WH\r\n', '0', '11000', 'mmk', '', '', 0),
(624, '2024-02-14', 'Dr-Feb 24/230', '6100/006', 'Paid to Sticker 5 colour\r\n', '1158820', '0', 'mmk', '', '', 0),
(625, '2024-02-14', 'Dr-Feb 24/230', '3600/001', 'Paid to Sticker 5 colour\r\n', '0', '1158820', 'mmk', '', '', 0),
(630, '2024-02-14', 'Dr-Feb 24/236', '9100/002', 'Taxi Charges for Market to W/H\r\n', '10000', '0', 'mmk', '', '', 0),
(631, '2024-02-14', 'Dr-Feb 24/236', '3600/001', 'Taxi Charges for Market to W/H\r\n', '0', '10000', 'mmk', '', '', 0),
(632, '2024-02-14', 'Dr-Feb 24/237', '6100/002', 'Ice 3pcs Purchase for Market Fish\r\n', '33000', '0', 'mmk', '', '', 0),
(633, '2024-02-14', 'Dr-Feb 24/237', '3600/001', 'Ice 3pcs Purchase for Market Fish\r\n', '0', '33000', 'mmk', '', '', 0),
(634, '2024-02-14', 'Dr-Feb 24/238', '9100/012', 'Meal Allowance for Market Boys 4pcs\r\n', '8000', '0', 'mmk', '', '', 0),
(635, '2024-02-14', 'Dr-Feb 24/238', '3600/001', 'Meal Allowance for Market Boys 4pcs\r\n', '0', '8000', 'mmk', '', '', 0),
(636, '2024-02-15', 'Dr-Feb 24/239', '4000/T08', 'Paid to Than Than Myint for Vr No\r\n', '4000000', '0', 'mmk', '', '', 0),
(637, '2024-02-15', 'Dr-Feb 24/239', '3600/001', 'Paid to Than Than Myint for Vr No\r\n', '0', '4000000', 'mmk', '', '', 0),
(638, '2024-02-15', 'Dr-Feb 24/240', '4000/M01', 'Paid to MA for Vr No-10586,10603,10757\r\n', '5370700', '0', 'mmk', '', '', 0),
(639, '2024-02-15', 'Dr-Feb 24/240', '3600/001', 'Paid to MA for Vr No-10586,10603,10757\r\n', '0', '5370700', 'mmk', '', '', 0),
(640, '2024-02-15', 'Dr-Feb 24/241', '4000/T01', 'Paid to Thet Paing for Vr No-11327 \r\n', '4000000', '0', 'mmk', '', '', 0),
(641, '2024-02-15', 'Dr-Feb 24/241', '3600/001', 'Paid to Thet Paing for Vr No-11327 \r\n', '0', '4000000', 'mmk', '', '', 0),
(642, '2024-02-15', 'Dr-Feb 24/242', '4000/K06', 'Paid to Ka Yin Lay for Vr No-11372\r\n', '565400', '0', 'mmk', '', '', 0),
(643, '2024-02-15', 'Dr-Feb 24/242', '3600/001', 'Paid to Ka Yin Lay for Vr No-11372\r\n', '0', '565400', 'mmk', '', '', 0),
(644, '2024-02-15', 'Dr-Feb 24/243', '4000/Z01', 'Paid to Zaw Zaw Latt for Vr No-11008,11191\r\n', '6000000', '0', 'mmk', '', '', 0),
(645, '2024-02-15', 'Dr-Feb 24/243', '3600/001', 'Paid to Zaw Zaw Latt for Vr No-11008,11191\r\n', '0', '6000000', 'mmk', '', '', 0),
(646, '2024-02-15', 'Dr-Feb 24/244', '6100/006', 'Paid to Sticker 5 colour\r\n', '2692000', '0', 'mmk', '', '', 0),
(647, '2024-02-15', 'Dr-Feb 24/244', '3600/001', 'Paid to Sticker 5 colour\r\n', '0', '2692000', 'mmk', '', '', 0),
(648, '2024-02-15', 'Dr-Feb 24/245', '9100/002', 'Taxi Charges for W/H to Ocean\r\n', '18000', '0', 'mmk', '', '', 0),
(649, '2024-02-15', 'Dr-Feb 24/245', '3600/001', 'Taxi Charges for W/H to Ocean\r\n', '0', '18000', 'mmk', '', '', 0),
(650, '2024-02-15', 'Dr-Feb 24/246', '9100/003', 'Water 3pcs Purhcase for W/H\r\n', '2700', '0', 'mmk', '', '', 0),
(651, '2024-02-15', 'Dr-Feb 24/246', '3600/001', 'Water 3pcs Purhcase for W/H\r\n', '0', '2700', 'mmk', '', '', 0),
(652, '2024-02-15', 'Dr-Feb 24/247', '6100/007', 'Paid to GFC Cold Store Charges \r\n', '5960000', '0', 'mmk', '', '', 0),
(653, '2024-02-15', 'Dr-Feb 24/247', '3600/001', 'Paid to GFC Cold Store Charges \r\n', '0', '5960000', 'mmk', '', '', 0),
(654, '2024-02-15', 'Dr-Feb 24/248', '9100/011', 'Car Charges for Rice,Beam and Oil of Mingalar Charity Donation 150000+Car Rental Balance 400000\r\n', '550000', '0', 'mmk', '', '', 0),
(655, '2024-02-15', 'Dr-Feb 24/248', '3600/001', 'Car Charges for Rice,Beam and Oil of Mingalar Charity Donation 150000+Car Rental Balance 400000\r\n', '0', '550000', 'mmk', '', '', 0),
(656, '2024-02-15', 'Dr-Feb 24/250', '6100/003', 'Paid to Foam Box (YC) for (24.1) (25.1)\r\n', '2272500', '0', 'mmk', '', '', 0),
(657, '2024-02-15', 'Dr-Feb 24/250', '3600/001', 'Paid to Foam Box (YC) for (24.1) (25.1)\r\n', '0', '2272500', 'mmk', '', '', 0),
(658, '2024-02-15', 'Dr-Feb 24/251', '4000/K05', 'Paid to Kyaw Zay Ya for Vr No-11097\r\n', '9000000', '0', 'mmk', '', '', 0),
(659, '2024-02-15', 'Dr-Feb 24/251', '3600/001', 'Paid to Kyaw Zay Ya for Vr No-11097\r\n', '0', '9000000', 'mmk', '', '', 0),
(660, '2024-02-15', 'Dr-Feb 24/252', '4000/A05', 'Paid to Aung Myo Min for Vr No-11052\r\n', '5000000', '0', 'mmk', '', '', 0),
(661, '2024-02-15', 'Dr-Feb 24/252', '3600/001', 'Paid to Aung Myo Min for Vr No-11052\r\n', '0', '5000000', 'mmk', '', '', 0),
(662, '2024-02-15', 'Dr-Feb 24/253', '6100/003', 'Penam Bag purchase for WH\r\n', '450200', '0', 'mmk', '', '', 0),
(663, '2024-02-15', 'Dr-Feb 24/253', '3600/001', 'Penam Bag purchase for WH\r\n', '0', '450200', 'mmk', '', '', 0),
(664, '2024-02-15', 'Dr-Feb 24/254', '9100/009', 'Wave Money Transfer Charges for KaYinLay \r\n', '5400', '0', 'mmk', '', '', 0),
(665, '2024-02-15', 'Dr-Feb 24/254', '3600/001', 'Wave Money Transfer Charges for KaYinLay \r\n', '0', '5400', 'mmk', '', '', 0),
(666, '2024-02-15', 'Dr-Feb 24/255', '9100/005', 'Broom and Taxi Charges for W/H\r\n', '43700', '0', 'mmk', '', '', 0),
(667, '2024-02-15', 'Dr-Feb 24/255', '3600/001', 'Broom and Taxi Charges for W/H\r\n', '0', '43700', 'mmk', '', '', 0),
(668, '2024-02-15', 'Dr-Feb 24/256', '9100/025', 'Car Parking for Market 6J\r\n', '2000', '0', 'mmk', '', '', 0),
(669, '2024-02-15', 'Dr-Feb 24/256', '3600/001', 'Car Parking for Market 6J\r\n', '0', '2000', 'mmk', '', '', 0),
(670, '2024-02-15', 'Dr-Feb 24/257', '6100/001', 'Labour Charges for Market Fish\r\n', '7000', '0', 'mmk', '', '', 0),
(671, '2024-02-15', 'Dr-Feb 24/257', '3600/001', 'Labour Charges for Market Fish\r\n', '0', '7000', 'mmk', '', '', 0),
(672, '2024-02-15', 'Dr-Feb 24/258', '9100/002', 'Taxi Charges for Market to W/H\r\n', '10000', '0', 'mmk', '', '', 0),
(673, '2024-02-15', 'Dr-Feb 24/258', '3600/001', 'Taxi Charges for Market to W/H\r\n', '0', '10000', 'mmk', '', '', 0),
(674, '2024-02-15', 'Dr-Feb 24/259', '6100/002', 'Ice 2.5pcs Purchase for Market Fish\r\n', '27000', '0', 'mmk', '', '', 0),
(675, '2024-02-15', 'Dr-Feb 24/259', '3600/001', 'Ice 2.5pcs Purchase for Market Fish\r\n', '0', '27000', 'mmk', '', '', 0),
(678, '2024-02-14', 'Dr-Feb 24/232', '9100/020', 'Paid to Agent Aung Myat Zaw Adv for USA No-1/24, Can No 2/24\r\n', '4300000', '0', 'mmk', '', '', 0),
(679, '2024-02-14', 'Dr-Feb 24/232', '3600/001', 'Paid to Agent Aung Myat Zaw Adv for USA No-1/24, Can No 2/24\r\n', '0', '4300000', 'mmk', '', '', 0),
(680, '2024-02-14', 'Dr-Feb 24/233', '9100/021', 'DOF Charges for USA 1/24, Can 2/24\r\n', '300000', '0', 'mmk', '', '', 0),
(681, '2024-02-14', 'Dr-Feb 24/233', '3600/001', 'DOF Charges for USA 1/24, Can 2/24\r\n', '0', '300000', 'mmk', '', '', 0),
(682, '2024-02-14', 'Dr-Feb 24/234', '9100/022', 'Paid to Ocean Pacific for USA 1/24 and Can 2/24 Loading\r\n', '400000', '0', 'mmk', '', '', 0),
(683, '2024-02-14', 'Dr-Feb 24/234', '3600/001', 'Paid to Ocean Pacific for USA 1/24 and Can 2/24 Loading\r\n', '0', '400000', 'mmk', '', '', 0),
(684, '2024-02-14', 'Dr-Feb 24/235', '9100/025', 'Car Parking Charges for Market 6J\r\n', '10000', '0', 'mmk', '', '', 0),
(685, '2024-02-14', 'Dr-Feb 24/235', '3600/001', 'Car Parking Charges for Market 6J\r\n', '0', '10000', 'mmk', '', '', 0),
(686, '2024-02-16', 'Dr-Feb 24/259', '6100/003', 'Paid to Dalian Ice for Packing Strap JCV (13.2) (16.2)\r\n', '860000', '0', 'mmk', '', '', 0),
(687, '2024-02-16', 'Dr-Feb 24/259', '3600/001', 'Paid to Dalian Ice for Packing Strap JCV (13.2) (16.2)\r\n', '0', '860000', 'mmk', '', '', 0),
(688, '2024-02-16', 'Dr-Feb 24/260', '9100/004', 'Sir Phone Bill\r\n', '3000', '0', 'mmk', '', '', 0),
(689, '2024-02-16', 'Dr-Feb 24/260', '3600/001', 'Sir Phone Bill\r\n', '0', '3000', 'mmk', '', '', 0),
(690, '2024-02-16', 'Dr-Feb 24/261', '9100/012', 'Birthday Cake for (Mr-Sarmad)\r\n', '63000', '0', 'mmk', '', '', 0),
(691, '2024-02-16', 'Dr-Feb 24/261', '3600/001', 'Birthday Cake for (Mr-Sarmad)\r\n', '0', '63000', 'mmk', '', '', 0),
(692, '2024-02-16', 'Dr-Feb 24/262', '9100/003', 'Water 6 pk purchase for WH\r\n', '5400', '0', 'mmk', '', '', 0),
(693, '2024-02-16', 'Dr-Feb 24/262', '3600/001', 'Water 6 pk purchase for WH\r\n', '0', '5400', 'mmk', '', '', 0),
(694, '2024-02-16', 'Dr-Feb 24/263', '9100/006', 'Car Diesel for 6J-3015 (15.2)-50000/ (16.2)-50000\r\n', '100000', '0', 'mmk', '', '', 0),
(695, '2024-02-16', 'Dr-Feb 24/263', '3600/001', 'Car Diesel for 6J-3015 (15.2)-50000/ (16.2)-50000\r\n', '0', '100000', 'mmk', '', '', 0),
(696, '2024-02-16', 'Dr-Feb 24/264', '9100/006', 'Car Diesel for 5L-2848\r\n', '145000', '0', 'mmk', '', '', 0),
(697, '2024-02-16', 'Dr-Feb 24/264', '3600/001', 'Car Diesel for 5L-2848\r\n', '0', '145000', 'mmk', '', '', 0),
(698, '2024-02-16', 'Dr-Feb 24/265', '9100/014', 'Engin Oil purchase for 6J-3015\r\n', '10000', '0', 'mmk', '', '', 0),
(699, '2024-02-16', 'Dr-Feb 24/265', '3600/001', 'Engin Oil purchase for 6J-3015\r\n', '0', '10000', 'mmk', '', '', 0),
(700, '2024-02-16', 'Dr-Feb 24/266', '6100/007', 'Paid to Ocean Pacific Cold Store\r\n', '3298466', '0', 'mmk', '', '', 0),
(701, '2024-02-16', 'Dr-Feb 24/266', '3600/001', 'Paid to Ocean Pacific Cold Store\r\n', '0', '3298466', 'mmk', '', '', 0),
(702, '2024-02-16', 'Dr-Feb 24/267', '9100/002', 'Taxi Charges Car Driver for (Night)\r\n', '4000', '0', 'mmk', '', '', 0),
(703, '2024-02-16', 'Dr-Feb 24/267', '3600/001', 'Taxi Charges Car Driver for (Night)\r\n', '0', '4000', 'mmk', '', '', 0),
(704, '2024-02-16', 'Dr-Feb 24/268', '9100/002', 'Taxi Charges WH to GFC for (R.P)\r\n', '21000', '0', 'mmk', '', '', 0),
(705, '2024-02-16', 'Dr-Feb 24/268', '3600/001', 'Taxi Charges WH to GFC for (R.P)\r\n', '0', '21000', 'mmk', '', '', 0),
(706, '2024-02-16', 'Dr-Feb 24/269', '9100/005', 'Key 2 pcs purchase for Can 2\r\n', '2000', '0', 'mmk', '', '', 0),
(707, '2024-02-16', 'Dr-Feb 24/269', '3600/001', 'Key 2 pcs purchase for Can 2\r\n', '0', '2000', 'mmk', '', '', 0),
(708, '2024-02-16', 'Dr-Feb 24/270', '6100/001', 'Labour Charges for Ocean (Raw)\r\n', '6000', '0', 'mmk', '', '', 0),
(709, '2024-02-16', 'Dr-Feb 24/270', '3600/001', 'Labour Charges for Ocean (Raw)\r\n', '0', '6000', 'mmk', '', '', 0),
(710, '2024-02-16', 'Dr-Feb 24/271', '9100/002', 'Taxi Charges for Thuzar (14,15) 8:30 PM\r\n', '5000', '0', 'mmk', '', '', 0),
(711, '2024-02-16', 'Dr-Feb 24/271', '3600/001', 'Taxi Charges for Thuzar (14,15) 8:30 PM\r\n', '0', '5000', 'mmk', '', '', 0),
(712, '2024-02-16', 'Dr-Feb 24/272', '6100/003', 'Penam Bag purchase and Taxi Charges\r\n', '85000', '0', 'mmk', '', '', 0),
(713, '2024-02-16', 'Dr-Feb 24/272', '3600/001', 'Penam Bag purchase and Taxi Charges\r\n', '0', '85000', 'mmk', '', '', 0),
(714, '2024-02-16', 'Dr-Feb 24/273', '9100/002', 'Taxi Charges for Thuzar (16.2)\r\n', '2500', '0', 'mmk', '', '', 0),
(715, '2024-02-16', 'Dr-Feb 24/273', '3600/001', 'Taxi Charges for Thuzar (16.2)\r\n', '0', '2500', 'mmk', '', '', 0),
(716, '2024-02-16', 'Dr-Feb 24/274', '6100/001', 'Labour Charges for (Ocean Raw)\r\n', '4500', '0', 'mmk', '', '', 0),
(717, '2024-02-16', 'Dr-Feb 24/274', '3600/001', 'Labour Charges for (Ocean Raw)\r\n', '0', '4500', 'mmk', '', '', 0),
(718, '2024-02-16', 'Dr-Feb 24/275', '9100/002', 'Taxi Charges for WH to Ocean (Pk)\r\n', '12000', '0', 'mmk', '', '', 0),
(719, '2024-02-16', 'Dr-Feb 24/275', '3600/001', 'Taxi Charges for WH to Ocean (Pk)\r\n', '0', '12000', 'mmk', '', '', 0),
(720, '2024-02-16', 'Dr-Feb 24/276', '9100/002', 'Taxi Chrges for Market to GFC to WH\r\n', '35000', '0', 'mmk', '', '', 0),
(721, '2024-02-16', 'Dr-Feb 24/276', '3600/001', 'Taxi Chrges for Market to GFC to WH\r\n', '0', '35000', 'mmk', '', '', 0),
(722, '2024-02-16', 'Dr-Feb 24/277', '9100/012', 'Meal allowance for Market Boys 3 pcs\r\n', '6000', '0', 'mmk', '', '', 0),
(723, '2024-02-16', 'Dr-Feb 24/277', '3600/001', 'Meal allowance for Market Boys 3 pcs\r\n', '0', '6000', 'mmk', '', '', 0),
(724, '2024-02-16', 'Dr-Feb 24/278', '9100/025', 'Car PK for (Market)\r\n', '2000', '0', 'mmk', '', '', 0),
(725, '2024-02-16', 'Dr-Feb 24/278', '3600/001', 'Car PK for (Market)\r\n', '0', '2000', 'mmk', '', '', 0),
(726, '2024-02-16', 'Dr-Feb 24/279', '6100/001', 'Labour Charges for Market Fish\r\n', '15000', '0', 'mmk', '', '', 0),
(727, '2024-02-16', 'Dr-Feb 24/279', '3600/001', 'Labour Charges for Market Fish\r\n', '0', '15000', 'mmk', '', '', 0),
(728, '2024-02-16', 'Dr-Feb 24/280', '6100/002', 'Ice 5 pcs purchase for Market Fish\r\n', '55000', '0', 'mmk', '', '', 0),
(729, '2024-02-16', 'Dr-Feb 24/280', '3600/001', 'Ice 5 pcs purchase for Market Fish\r\n', '0', '55000', 'mmk', '', '', 0),
(732, '2024-02-18', 'Dr-Feb 24/281', '9100/016', 'Ledger 6 pcs purchase for (office)\r\n', '25400', '0', 'mmk', '', '', 0),
(733, '2024-02-18', 'Dr-Feb 24/281', '3600/001', 'Ledger 6 pcs purchase for (office)\r\n', '0', '25400', 'mmk', '', '', 0),
(734, '2024-02-18', 'Dr-Feb 24/282', '9100/018', 'Meter Bill for Wai Pon La office -500/ Sir house-46800 (Jan/2024)\r\n', '47300', '0', 'mmk', '', '', 0),
(735, '2024-02-18', 'Dr-Feb 24/282', '3600/001', 'Meter Bill for Wai Pon La office -500/ Sir house-46800 (Jan/2024)\r\n', '0', '47300', 'mmk', '', '', 0),
(736, '2024-02-18', 'Dr-Feb 24/283', '9100/018', 'Meter Bill for WH (Jan/2024)\r\n', '132670', '0', 'mmk', '', '', 0),
(737, '2024-02-18', 'Dr-Feb 24/283', '3600/001', 'Meter Bill for WH (Jan/2024)\r\n', '0', '132670', 'mmk', '', '', 0),
(738, '2024-02-18', 'Dr-Feb 24/284', '9100/009', 'Meter service and Bank charges for WH\r\n', '7000', '0', 'mmk', '', '', 0),
(739, '2024-02-18', 'Dr-Feb 24/284', '3600/001', 'Meter service and Bank charges for WH\r\n', '0', '7000', 'mmk', '', '', 0),
(740, '2024-02-18', 'Dr-Feb 24/285', '9100/023', 'Maintenance for Sir house (Feb/2024)\r\n', '15000', '0', 'mmk', '', '', 0),
(741, '2024-02-18', 'Dr-Feb 24/285', '3600/001', 'Maintenance for Sir house (Feb/2024)\r\n', '0', '15000', 'mmk', '', '', 0),
(742, '2024-02-18', 'Dr-Feb 24/286', '9100/002', 'Taxi Charges for WH to Wai Pon La to WH\r\n', '3500', '0', 'mmk', '', '', 0),
(743, '2024-02-18', 'Dr-Feb 24/286', '3600/001', 'Taxi Charges for WH to Wai Pon La to WH\r\n', '0', '3500', 'mmk', '', '', 0),
(744, '2024-02-18', 'Dr-Feb 24/287', '9100/017', 'Sir take from Daw Nan No 1, 30000/ No 2, 300000/ No 3, 10 -Lakh\r\n', '1330000', '0', 'mmk', '', '', 0),
(745, '2024-02-18', 'Dr-Feb 24/287', '3600/001', 'Sir take from Daw Nan No 1, 30000/ No 2, 300000/ No 3, 10 -Lakh\r\n', '0', '1330000', 'mmk', '', '', 0),
(746, '2024-02-18', 'Dr-Feb 24/288', '6100/001', 'Labour Charges for Ocean Rohu and (Raw)\r\n', '21000', '0', 'mmk', '', '', 0),
(747, '2024-02-18', 'Dr-Feb 24/288', '3600/001', 'Labour Charges for Ocean Rohu and (Raw)\r\n', '0', '21000', 'mmk', '', '', 0),
(748, '2024-02-18', 'Dr-Feb 24/289', '9100/002', 'Taxi Charges WH to Ocean for Sticker\r\n', '15000', '0', 'mmk', '', '', 0),
(749, '2024-02-18', 'Dr-Feb 24/289', '3600/001', 'Taxi Charges WH to Ocean for Sticker\r\n', '0', '15000', 'mmk', '', '', 0),
(750, '2024-02-18', 'Dr-Feb 24/290', '6100/002', 'Ice purchase for Ocean (Pk) (15.2)-9000/ (17.2)-69000\r\n', '78000', '0', 'mmk', '', '', 0),
(751, '2024-02-18', 'Dr-Feb 24/290', '3600/001', 'Ice purchase for Ocean (Pk) (15.2)-9000/ (17.2)-69000\r\n', '0', '78000', 'mmk', '', '', 0),
(752, '2024-02-18', 'Dr-Feb 24/291', '9100/015', 'Wedding present for (17.2)\r\n', '206000', '0', 'mmk', '', '', 0),
(753, '2024-02-18', 'Dr-Feb 24/291', '3600/001', 'Wedding present for (17.2)\r\n', '0', '206000', 'mmk', '', '', 0),
(754, '2024-02-18', 'Dr-Feb 24/292', '6100/003', 'Penam Bag purchase and Carry for WH (824000+16000)\r\n', '840000', '0', 'mmk', '', '', 0),
(755, '2024-02-18', 'Dr-Feb 24/292', '3600/001', 'Penam Bag purchase and Carry for WH (824000+16000)\r\n', '0', '840000', 'mmk', '', '', 0),
(756, '2024-02-18', 'Dr-Feb 24/293', '9100/016', 'Photo Sticker/Pen/Caculator purchase for WH\r\n', '125100', '0', 'mmk', '', '', 0),
(757, '2024-02-18', 'Dr-Feb 24/293', '3600/001', 'Photo Sticker/Pen/Caculator purchase for WH\r\n', '0', '125100', 'mmk', '', '', 0),
(758, '2024-02-18', 'Dr-Feb 24/294', '6100/006', 'Sticker purchase from 5 colour  Voucher 3 pcs\r\n', '2116280', '0', 'mmk', '', '', 0),
(759, '2024-02-18', 'Dr-Feb 24/294', '3600/001', 'Sticker purchase from 5 colour  Voucher 3 pcs\r\n', '0', '2116280', 'mmk', '', '', 0),
(760, '2024-02-18', 'Dr-Feb 24/295', '6100/003', 'Paid to Plastic (G/F) for (15.2.24)\r\n', '1320000', '0', 'mmk', '', '', 0),
(761, '2024-02-18', 'Dr-Feb 24/295', '3600/001', 'Paid to Plastic (G/F) for (15.2.24)\r\n', '0', '1320000', 'mmk', '', '', 0),
(762, '2024-02-18', 'Dr-Feb 24/296', '9100/006', 'Car Diesel for 6J-3015 (17.2)-50000/ (18.2)-50000\r\n', '100000', '0', 'mmk', '', '', 0),
(763, '2024-02-18', 'Dr-Feb 24/296', '3600/001', 'Car Diesel for 6J-3015 (17.2)-50000/ (18.2)-50000\r\n', '0', '100000', 'mmk', '', '', 0),
(764, '2024-02-18', 'Dr-Feb 24/297', '9100/011', 'Donation for (15.2.24) Mingalar Charity\r\n', '1000000', '0', 'mmk', '', '', 0),
(765, '2024-02-18', 'Dr-Feb 24/297', '3600/001', 'Donation for (15.2.24) Mingalar Charity\r\n', '0', '1000000', 'mmk', '', '', 0),
(766, '2024-02-18', 'Dr-Feb 24/298', '6100/007', 'Paid to Ocean Pacific Cold Store\r\n', '7000000', '0', 'mmk', '', '', 0),
(767, '2024-02-18', 'Dr-Feb 24/298', '3600/001', 'Paid to Ocean Pacific Cold Store\r\n', '0', '7000000', 'mmk', '', '', 0),
(768, '2024-02-18', 'Dr-Feb 24/299', '9100/002', 'Taxi Charges for WH to GFC\r\n', '20000', '0', 'mmk', '', '', 0),
(769, '2024-02-18', 'Dr-Feb 24/299', '3600/001', 'Taxi Charges for WH to GFC\r\n', '0', '20000', 'mmk', '', '', 0),
(770, '2024-02-18', 'Dr-Feb 24/300', '6100/001', 'Labour Charges for GFC R.P\r\n', '86000', '0', 'mmk', '', '', 0),
(771, '2024-02-18', 'Dr-Feb 24/300', '3600/001', 'Labour Charges for GFC R.P\r\n', '0', '86000', 'mmk', '', '', 0),
(794, '2024-02-19', 'Dr-Feb 24/301', '9100/020', 'Paid to Ko Aung Myat Zaw 2 % and Adv for Can 3/24 and 4/24, USA 2/24 and 3/24', '10000000', '0', 'mmk', '', '', 0),
(795, '2024-02-19', 'Dr-Feb 24/301', '3600/001', 'Paid to Ko Aung Myat Zaw 2 % and Adv for Can 3/24 and 4/24, USA 2/24 and 3/24', '0', '10000000', 'mmk', '', '', 0),
(796, '2024-02-19', 'Dr-Feb 24/302', '9100/021', 'DOF Charges for Can 3/24 and 4/24, USA 2/24 and 3/24', '600000', '0', 'mmk', '', '', 0),
(797, '2024-02-19', 'Dr-Feb 24/302', '3600/001', 'DOF Charges for Can 3/24 and 4/24, USA 2/24 and 3/24', '0', '600000', 'mmk', '', '', 0),
(798, '2024-02-19', 'Dr-Feb 24/303', '9100/022', 'Paid to Ocean Pacific for MMk Can 3/24 and 4/24, USA 2/24 and 3/24 Laoding', '800000', '0', 'mmk', '', '', 0),
(799, '2024-02-19', 'Dr-Feb 24/303', '3600/001', 'Paid to Ocean Pacific for MMk Can 3/24 and 4/24, USA 2/24 and 3/24 Laoding', '0', '800000', 'mmk', '', '', 0),
(800, '2024-02-19', 'Dr-Feb 24/304', '6100/006', 'Paid to Sticker 5 colour', '3721000', '0', 'mmk', '', '', 0),
(801, '2024-02-19', 'Dr-Feb 24/304', '3600/001', 'Paid to Sticker 5 colour', '0', '3721000', 'mmk', '', '', 0),
(802, '2024-02-19', 'Dr-Feb 24/305', '9100/002', 'Taxi Charges WH to Insein to WH for Office 2 pcs Meeting', '16000', '0', 'mmk', '', '', 0),
(803, '2024-02-19', 'Dr-Feb 24/305', '3600/001', 'Taxi Charges WH to Insein to WH for Office 2 pcs Meeting', '0', '16000', 'mmk', '', '', 0),
(804, '2024-02-19', 'Dr-Feb 24/306', '6100/005', 'HHK to GFC MC carry for 2 Trucks *400000/ 1 Truck *200000', '1000000', '0', 'mmk', '', '', 0),
(805, '2024-02-19', 'Dr-Feb 24/306', '3600/001', 'HHK to GFC MC carry for 2 Trucks *400000/ 1 Truck *200000', '0', '1000000', 'mmk', '', '', 0),
(806, '2024-02-19', 'Dr-Feb 24/307', '9100/002', 'Taxi Charges for Thuzar (16.17.18) Ocean (OT)', '7500', '0', 'mmk', '', '', 0),
(807, '2024-02-19', 'Dr-Feb 24/307', '3600/001', 'Taxi Charges for Thuzar (16.17.18) Ocean (OT)', '0', '7500', 'mmk', '', '', 0),
(808, '2024-02-19', 'Dr-Feb 24/308', '9100/012', 'Workers 13 pcs Dinner for Ocean (OT) 13*2000 ks', '26000', '0', 'mmk', '', '', 0),
(809, '2024-02-19', 'Dr-Feb 24/308', '3600/001', 'Workers 13 pcs Dinner for Ocean (OT) 13*2000 ks', '0', '26000', 'mmk', '', '', 0),
(810, '2024-02-19', 'Dr-Feb 24/309', '9100/006', 'Car Diesel for 6J-3015', '50000', '0', 'mmk', '', '', 0),
(811, '2024-02-19', 'Dr-Feb 24/309', '3600/001', 'Car Diesel for 6J-3015', '0', '50000', 'mmk', '', '', 0),
(812, '2024-02-19', 'Dr-Feb 24/310', '9100/002', 'Taxi Charges Car Driver for (19.2) 9:30 PM', '4000', '0', 'mmk', '', '', 0),
(813, '2024-02-19', 'Dr-Feb 24/310', '3600/001', 'Taxi Charges Car Driver for (19.2) 9:30 PM', '0', '4000', 'mmk', '', '', 0),
(814, '2024-02-19', 'Dr-Feb 24/311', '9100/002', 'Taxi Charges for WH to GFC for 2 Trucks (R.P) change', '40000', '0', 'mmk', '', '', 0),
(815, '2024-02-19', 'Dr-Feb 24/311', '3600/001', 'Taxi Charges for WH to GFC for 2 Trucks (R.P) change', '0', '40000', 'mmk', '', '', 0),
(816, '2024-02-19', 'Dr-Feb 24/312', '6100/001', 'Labour 5 pcs and Taxi Charges for GFC (R.P) (56000+30000)', '86000', '0', 'mmk', '', '', 0),
(817, '2024-02-19', 'Dr-Feb 24/312', '3600/001', 'Labour 5 pcs and Taxi Charges for GFC (R.P) (56000+30000)', '0', '86000', 'mmk', '', '', 0),
(818, '2024-02-20', 'Cr-Feb 24/009', '9100/017', 'Sir Return paid to Daw Nan (1300000-630000=670000)', '0', '670000', 'mmk', '', '', 0),
(819, '2024-02-20', 'Cr-Feb 24/009', '3600/001', 'Sir Return paid to Daw Nan (1300000-630000=670000)', '670000', '0', 'mmk', '', '', 0),
(820, '2024-02-20', 'Cr-Feb 24/010', '3300/001', 'Loan Return from Best Brand (Bejon) transfer to UAB (Actual $25176*3480ks=87612480-8758227=Bank Chg;8753+Different 75500)', '0', '87528227', 'mmk', '', '', 0),
(821, '2024-02-20', 'Cr-Feb 24/010', '3600/001', 'Loan Return from Best Brand (Bejon) transfer to UAB (Actual $25176*3480ks=87612480-8758227=Bank Chg;8753+Different 75500)', '87528227', '0', 'mmk', '', '', 0),
(822, '2024-02-20', 'Dr-Feb 24/313', '6100/002', 'Ice 3 pcs purchase for WH', '27000', '0', 'mmk', '', '', 0),
(823, '2024-02-20', 'Dr-Feb 24/313', '3600/001', 'Ice 3 pcs purchase for WH', '0', '27000', 'mmk', '', '', 0),
(824, '2024-02-20', 'Dr-Feb 24/314', '6100/001', 'Worker 9 pcs (OT) from Ocean Pacific', '18000', '0', 'mmk', '', '', 0),
(825, '2024-02-20', 'Dr-Feb 24/314', '3600/001', 'Worker 9 pcs (OT) from Ocean Pacific', '0', '18000', 'mmk', '', '', 0),
(826, '2024-02-20', 'Dr-Feb 24/315', '9100/003', 'Water Purchase for WH', '2700', '0', 'mmk', '', '', 0),
(827, '2024-02-20', 'Dr-Feb 24/315', '3600/001', 'Water Purchase for WH', '0', '2700', 'mmk', '', '', 0),
(828, '2024-02-20', 'Dr-Feb 24/316', '9100/002', 'Car Charges for WH to GFC for Material Carry', '40000', '0', 'mmk', '', '', 0),
(829, '2024-02-20', 'Dr-Feb 24/316', '3600/001', 'Car Charges for WH to GFC for Material Carry', '0', '40000', 'mmk', '', '', 0),
(830, '2024-02-20', 'Dr-Feb 24/317', '9100/002', 'Taxi Charges for WH to DOF office Meeting go', '16000', '0', 'mmk', '', '', 0),
(831, '2024-02-20', 'Dr-Feb 24/317', '3600/001', 'Taxi Charges for WH to DOF office Meeting go', '0', '16000', 'mmk', '', '', 0),
(832, '2024-02-20', 'Dr-Feb 24/318', '9100/016', 'Document Copy Charges from DOF office', '2000', '0', 'mmk', '', '', 0),
(833, '2024-02-20', 'Dr-Feb 24/318', '3600/001', 'Document Copy Charges from DOF office', '0', '2000', 'mmk', '', '', 0),
(834, '2024-02-20', 'Dr-Feb 24/319', '6100/003', 'Penan Bag-345 ks and Other purchase and Taxi for WH', '582100', '0', 'mmk', '', '', 0),
(835, '2024-02-20', 'Dr-Feb 24/319', '3600/001', 'Penan Bag-345 ks and Other purchase and Taxi for WH', '0', '582100', 'mmk', '', '', 0),
(836, '2024-02-20', 'Dr-Feb 24/320', '9100/004', 'Phone Bill for Office', '2000', '0', 'mmk', '', '', 0),
(837, '2024-02-20', 'Dr-Feb 24/320', '3600/001', 'Phone Bill for Office', '0', '2000', 'mmk', '', '', 0),
(838, '2024-02-20', 'Dr-Feb 24/321', '4000/T02', 'Paid to Thein Htay for Vr No-11359,11366 (Cheque No-052406)', '4000000', '0', 'mmk', '', '', 0),
(839, '2024-02-20', 'Dr-Feb 24/321', '3600/001', 'Paid to Thein Htay for Vr No-11359,11366 (Cheque No-052406)', '0', '4000000', 'mmk', '', '', 0),
(840, '2024-02-20', 'Dr-Feb 24/322', '4000/H02', 'Paid to Htay Win for Vr No-11010,11011,11060 (Cheque No-052407)', '3000000', '0', 'mmk', '', '', 0),
(841, '2024-02-20', 'Dr-Feb 24/322', '3600/001', 'Paid to Htay Win for Vr No-11010,11011,11060 (Cheque No-052407)', '0', '3000000', 'mmk', '', '', 0),
(842, '2024-02-20', 'Dr-Feb 24/323', '4000/Z03', 'Paid to Zaw Myat Thu for Vr No-11361,11376 (Cheque No-052408)', '10000000', '0', 'mmk', '', '', 0),
(843, '2024-02-20', 'Dr-Feb 24/323', '3600/001', 'Paid to Zaw Myat Thu for Vr No-11361,11376 (Cheque No-052408)', '0', '10000000', 'mmk', '', '', 0),
(844, '2024-02-20', 'Dr-Feb 24/324', '6100/003', 'Paid to Plastic (G/F) for 16.2.24/17.2.24-165000/17.2.24-343500', '3000000', '0', 'mmk', '', '', 0),
(845, '2024-02-20', 'Dr-Feb 24/324', '3600/001', 'Paid to Plastic (G/F) for 16.2.24/17.2.24-165000/17.2.24-343500', '0', '3000000', 'mmk', '', '', 0),
(846, '2024-02-20', 'Dr-Feb 24/325', '9100/002', 'Taxi Charges for WH to Market go 18.2.24/20.2.24', '24000', '0', 'mmk', '', '', 0),
(847, '2024-02-20', 'Dr-Feb 24/325', '3600/001', 'Taxi Charges for WH to Market go 18.2.24/20.2.24', '0', '24000', 'mmk', '', '', 0),
(848, '2024-02-20', 'Dr-Feb 24/326', '9100/012', 'Meal allowance for Market Boys', '11000', '0', 'mmk', '', '', 0),
(849, '2024-02-20', 'Dr-Feb 24/326', '3600/001', 'Meal allowance for Market Boys', '0', '11000', 'mmk', '', '', 0),
(850, '2024-02-20', 'Dr-Feb 24/327', '6100/001', 'Labour Charges for Market Fish', '6000', '0', 'mmk', '', '', 0),
(851, '2024-02-20', 'Dr-Feb 24/327', '3600/001', 'Labour Charges for Market Fish', '0', '6000', 'mmk', '', '', 0),
(852, '2024-02-20', 'Dr-Feb 24/328', '6100/002', 'Ice 2 pcs purchase for Market Fish', '22000', '0', 'mmk', '', '', 0),
(853, '2024-02-20', 'Dr-Feb 24/328', '3600/001', 'Ice 2 pcs purchase for Market Fish', '0', '22000', 'mmk', '', '', 0),
(854, '2024-02-20', 'Dr-Feb 24/329', '6100/001', 'Labour Charges for Market Fish 18.2.24/20.2.24', '4000', '0', 'mmk', '', '', 0),
(855, '2024-02-20', 'Dr-Feb 24/329', '3600/001', 'Labour Charges for Market Fish 18.2.24/20.2.24', '0', '4000', 'mmk', '', '', 0),
(856, '2024-02-19', 'JJJJJ', '6100/001', 'sfgdhjkl', '1000000', '0', 'mmk', '', '', 0),
(857, '2024-02-19', 'JJJJJ', '3600/001', 'asdfasdf', '0', '1000000', 'mmk', '', '', 0);

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
(6, '2024-03-12', 'SH473', '31');

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
(137, '09:37:12.000000', '2024-02-15', 'admin', 'admin', 'Login Success'),
(138, '02:21:34.000000', '2024-02-15', 'admin', 'ေိာငည', 'Login Password Invalid'),
(139, '02:21:38.000000', '2024-02-15', '‌ေိာငည', 'ေိာငည', 'Login Failed'),
(140, '02:21:50.000000', '2024-02-15', 'admin', 'admin', 'Login Success'),
(141, '04:47:41.000000', '2024-02-15', 'admin', 'admin', 'Login Success'),
(142, '07:11:47.000000', '2024-02-15', 'admin', 'admin', 'Login Success'),
(143, '09:50:33.000000', '2024-02-16', 'admin', 'admin', 'Login Success'),
(144, '10:42:18.000000', '2024-02-16', 'admin', 'admin', 'Login Success'),
(145, '05:08:14.000000', '2024-02-16', 'admin', 'admin', 'Login Success'),
(146, '09:58:37.000000', '2024-02-17', 'admin', 'admin', 'Login Success'),
(147, '10:37:24.000000', '2024-02-17', 'admin', 'admin', 'Login Success'),
(148, '10:43:53.000000', '2024-02-17', 'admin', 'admin', 'Login Success'),
(149, '11:30:26.000000', '2024-02-17', 'admin', 'admin', 'Login Success'),
(150, '02:54:33.000000', '2024-02-17', 'admin', 'admin', 'Login Success'),
(151, '01:16:58.000000', '2024-02-19', 'admin', 'admin', 'Login Success'),
(152, '01:38:02.000000', '2024-02-19', 'admin', 'admin', 'Login Success'),
(153, '02:14:27.000000', '2024-02-19', 'admin', 'admin', 'Login Success'),
(154, '03:30:30.000000', '2024-02-19', 'admin', 'admin', 'Login Success'),
(155, '03:31:56.000000', '2024-02-19', 'admin', 'admin', 'Login Success'),
(156, '03:44:41.000000', '2024-02-19', 'admin', '', 'Logout Success'),
(157, '03:40:39.000000', '2024-02-21', 'admin', 'admin', 'Login Success'),
(158, '03:57:02.000000', '2024-02-21', 'admin', '', 'Logout Success'),
(159, '06:48:19.000000', '2024-02-21', 'admin', 'admin', 'Login Success'),
(160, '06:52:49.000000', '2024-02-21', 'admin', 'admin', 'Login Success'),
(161, '06:58:23.000000', '2024-02-21', 'admin', 'admin', 'Login Success'),
(162, '07:49:58.000000', '2024-02-21', 'admin', '', 'Logout Success'),
(163, '07:50:01.000000', '2024-02-21', '', '', 'Logout Success'),
(164, '09:13:32.000000', '2024-02-22', 'admin', 'admin', 'Login Success'),
(165, '01:32:20.000000', '2024-02-22', 'admin', 'admin', 'Login Success'),
(166, '05:22:18.000000', '2024-02-22', 'admin', 'admin', 'Login Success'),
(167, '06:06:53.000000', '2024-02-22', 'admin', 'admin', 'Login Success'),
(168, '07:36:06.000000', '2024-02-22', 'admin', 'admin', 'Login Success'),
(169, '09:45:56.000000', '2024-02-24', 'admin', 'admin', 'Login Success'),
(170, '01:42:39.000000', '2024-02-24', 'admin', 'admin', 'Login Success'),
(171, '10:09:29.000000', '2024-02-26', 'admin', 'admin', 'Login Success'),
(172, '01:50:09.000000', '2024-02-26', 'admin', 'admin', 'Login Success'),
(173, '09:40:51.000000', '2024-02-27', 'admin', 'admin', 'Login Success'),
(174, '03:53:47.000000', '2024-02-28', 'admin', 'admin', 'Login Success'),
(175, '10:44:05.000000', '2024-02-29', 'admin', 'admin', 'Login Success'),
(176, '12:10:30.000000', '2024-03-02', 'admin', 'admin', 'Login Success'),
(177, '02:07:06.000000', '2024-03-02', 'admin', 'admn', 'Login Password Invalid'),
(178, '02:07:11.000000', '2024-03-02', 'admin', 'admin', 'Login Success'),
(179, '09:11:07.000000', '2024-03-05', 'admin', 'admin', 'Login Success'),
(180, '02:31:33.000000', '2024-03-05', 'admin', 'admin', 'Login Success'),
(181, '10:30:08.000000', '2024-03-06', 'admin', 'admin', 'Login Success'),
(182, '10:31:17.000000', '2024-03-06', 'admin', '', 'Logout Success'),
(183, '10:32:23.000000', '2024-03-06', 'admin', 'admin', 'Login Success'),
(184, '03:30:20.000000', '2024-03-06', 'admin', 'admin', 'Login Success'),
(185, '01:58:40.000000', '2024-03-07', 'admin', 'admin', 'Login Success'),
(186, '03:13:58.000000', '2024-03-07', 'admin', 'admin', 'Login Success'),
(187, '10:13:06.000000', '2024-03-09', 'admin', 'admin', 'Login Success'),
(188, '01:41:09.000000', '2024-03-12', 'admin', 'qemin', 'Login Password Invalid'),
(189, '01:41:19.000000', '2024-03-12', 'admin', 'admin', 'Login Success'),
(190, '10:49:32.000000', '2024-03-13', 'admin', 'admin', 'Login Success'),
(191, '07:27:34.000000', '2024-03-13', 'admin', '', 'Logout Success'),
(192, '07:28:03.000000', '2024-03-13', 'admin', 'admin', 'Login Success'),
(193, '11:46:20.000000', '2024-03-14', 'admin', 'admin', 'Login Success'),
(194, '03:14:41.000000', '2024-03-14', 'admin', 'admin', 'Login Success'),
(195, '11:34:14.000000', '2024-03-15', 'admin', 'admin', 'Login Success'),
(196, '01:51:46.000000', '2024-03-18', 'admin', 'admin', 'Login Success'),
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
(248, '09:38:16.000000', '2024-03-26', 'admin', 'admin', 'Login Failed'),
(249, '09:38:22.000000', '2024-03-26', 'admin', 'admin', 'Login Failed'),
(250, '09:38:41.000000', '2024-03-26', 'Adminstrator', 'protechadmin2024***', 'Login Failed'),
(251, '09:38:59.000000', '2024-03-26', 'Administrator', 'protechadmin2024***', 'Login Success'),
(252, '11:02:28.000000', '2024-03-27', 'Administrator', 'protechadmin2024***', 'Login Success'),
(253, '02:29:40.000000', '2024-03-28', 'Administrator', 'protechadmin2024***', 'Login Success'),
(254, '01:24:18.000000', '2024-03-29', 'Administrator', 'protechadmin2024***', 'Login Success');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=351;

--
-- AUTO_INCREMENT for table `actualinvoice`
--
ALTER TABLE `actualinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2161;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=877;

--
-- AUTO_INCREMENT for table `form7stock`
--
ALTER TABLE `form7stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=461;

--
-- AUTO_INCREMENT for table `form7stocktcl`
--
ALTER TABLE `form7stocktcl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `form10stock`
--
ALTER TABLE `form10stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `form10stocktcl`
--
ALTER TABLE `form10stocktcl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `general_ledger`
--
ALTER TABLE `general_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2048;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `gfctotal`
--
ALTER TABLE `gfctotal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hhkmcstock`
--
ALTER TABLE `hhkmcstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `hhkstock`
--
ALTER TABLE `hhkstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `invoice_costing`
--
ALTER TABLE `invoice_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1042;

--
-- AUTO_INCREMENT for table `labour`
--
ALTER TABLE `labour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `packingliststockinfo`
--
ALTER TABLE `packingliststockinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `packingmaterial`
--
ALTER TABLE `packingmaterial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `payable`
--
ALTER TABLE `payable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=571;

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
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=435;

--
-- AUTO_INCREMENT for table `receivable`
--
ALTER TABLE `receivable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

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
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=858;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
