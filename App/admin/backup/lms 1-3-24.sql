-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2024 at 08:19 AM
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
(338, '4000/D02', 40, 'Dry Fish (Myo Thant)');

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
  `transactionid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cashbook`
--

INSERT INTO `cashbook` (`id`, `date`, `sr_no`, `ac_name`, `particular`, `debit`, `credit`, `balance`, `voucher_no`, `crossac_name`, `transactionid`) VALUES
(479, '2024-01-31', '', '3600/001', 'Opining Balance of Jan\'24', '0', '0', '213847883', NULL, NULL, 0),
(1213, '2024-02-01', '', '3600/001', 'Water 6 pk purchase for WH', '0', '5400', '213842483', 'Dr-Feb 24/001', '9100/003', 55),
(1214, '2024-02-01', '', '3600/001', 'Sir Phone Bill and Monthly/ Phone 6 pcs Bill/ Sir-6000 (Sir,Daw Nan,Lai-15000) (Office,Sandar,Mar)', '0', '39000', '213803483', 'Dr-Feb 24/002', '9100/004', 59),
(1215, '2024-02-01', '', '3600/001', 'Medicine and Taxi for sir', '0', '14000', '213789483', 'Dr Feb\'24/003', '9100/005', 61),
(1216, '2024-02-01', '', '3600/001', 'Car Diesel for 5L-2848 (30.1.24-10000)(30.1.24-70000)', '0', '80000', '213709483', 'Dr Feb\'24/004', '9100/006', 63),
(1217, '2024-02-01', '', '3600/001', 'Car Diesel for 6J-3015 (31.1.24-50000)', '0', '50000', '213659483', 'Dr Feb\'24/005', '9100/006', 65),
(1218, '2024-02-01', '', '3600/001', 'Material and Taxi Charges for PK Machine', '0', '50000', '213609483', 'Dr Feb\'24/006', '9100/007', 67),
(1219, '2024-02-01', '', '3600/001', 'Bejon Loan take from LM 2020ED Balance $25176*3572ks(Best Brand)', '0', '89928700', '123680783', 'Dr Feb\'24/007', '3300/001', 69),
(1220, '2024-02-01', '', '3600/001', 'DHL charges for Italy Document sent', '0', '377000', '123303783', 'Dr Feb\'24/008', '9100/008', 71),
(1221, '2024-02-01', '', '3600/001', 'Paid to Ka Yin Lay for Vr No-11337', '0', '100000', '123203783', 'Dr Feb\'24/009', '4000/K06', 77),
(1222, '2024-02-01', '', '3600/001', 'Wave Money charges for Ka Yin Lay Money sent', '0', '1500', '123202283', 'Dr Feb\'24/010', '9100/009', 79),
(1223, '2024-02-01', '', '3600/001', 'All people Salary Payment for Jan/24', '0', '17754000', '105448283', 'Dr Feb\'24/011', '9100/001', 81),
(1224, '2024-02-01', '', '3600/001', 'All people Annual Bonus Paid for Jan/24', '0', '17351000', '88097283', 'Dr Feb\'24/011', '9100/010', 83),
(1225, '2024-02-01', '', '3600/001', 'Donation for Bangladesh Embassy', '0', '3000000', '85097283', 'Dr Feb\'24/012', '9100/011', 85),
(1226, '2024-02-02', '', '3600/001', 'Taxi charges for Ocean Pacfic to WH', '0', '15000', '85082283', 'Dr Feb\'24/013', '9100/002', 87),
(1227, '2024-02-02', '', '3600/001', 'Carton Box purchase for Ocean Pacfic pk', '0', '52500', '85029783', 'Dr Feb\'24/014', '6100/003', 89),
(1228, '2024-02-02', '', '3600/001', 'Labour Charges and Taxi Charges for (Rohu)', '0', '289000', '84740783', 'Dr Feb\'24/015', '6100/001', 91),
(1229, '2024-02-02', '', '3600/001', 'Ice 10 pcs purchase for HHK (D-Puti,Rohu,Ayer)', '0', '90000', '84650783', 'Dr Feb\'24/016', '6100/002', 93),
(1230, '2024-02-02', '', '3600/001', 'JCV Rope purchase for HHK pk pcs*85000', '0', '170000', '84480783', 'Dr Feb\'24/017', '6100/003', 95),
(1231, '2024-02-02', '', '3600/001', 'Taxi Charges for HHK to WH and WH to GFC', '0', '43000', '84437783', 'Dr Feb\'24/018', '9100/002', 97),
(1232, '2024-02-02', '', '3600/001', 'WH to HHK Fish carry car charges', '0', '130000', '84307783', 'Dr Feb\'24/019', '6100/004', 99),
(1233, '2024-02-02', '', '3600/001', 'Workers 31 pcs Dinner for (OT) (Rohu)', '0', '62000', '84245783', 'Dr Feb\'24/020', '9100/012', 101),
(1234, '2024-02-02', '', '3600/001', 'Material purchase and service charges for WH (Boy Tiolet)', '0', '85000', '84160783', 'Dr Feb\'24/021', '9100/007', 103),
(1235, '2024-02-02', '', '3600/001', 'Fruit purchase for Sir', '0', '7000', '84153783', 'Dr Feb\'24/022', '9100/012', 105),
(1236, '2024-02-02', '', '3600/001', 'Penam and other purchase for WH', '0', '814500', '83339283', 'Dr Feb\'24/023', '6100/003', 107),
(1237, '2024-02-02', '', '3600/001', 'Ice 4 pcs and car pk for D-Puti', '0', '42000', '83297283', 'Dr Feb\'24/024', '6100/002', 109),
(1238, '2024-02-02', '', '3600/001', 'Paid to Mg Mg Soe for Vr No-11152,11185', '0', '4000000', '79297283', 'Dr Feb\'24/025', '4000/M06', 111),
(1239, '2024-02-02', '', '3600/001', 'Paid to Mg Mg Nyunt for Vr-11183,11192', '0', '5000000', '74297283', 'Dr-Feb\'24/026', '4000/M03', 116),
(1240, '2024-02-02', '', '3600/001', 'Paid to BLC (PYM) for Vr No-11221', '0', '3400000', '70897283', 'Dr-Feb 24/027', '4000/P02', 118),
(1241, '2024-02-02', '', '3600/001', 'Paid to Than Than Myint for Vr No-107788 (10810-2696450)', '0', '5000000', '65897283', 'Dr-Feb 24/028', '4000/T08', 120),
(1242, '2024-02-02', '', '3600/001', 'Paid to  Ye Yint for Vr No-11115,11133', '0', '5000000', '60897283', 'Dr-Feb 24/029', '4000/Y01', 123),
(1243, '2024-02-02', '', '3600/001', 'Paid to Htet Aung Lin for Vr No-10877', '0', '444200', '60453083', 'Dr-Feb 24/030', '4000/H01', 128),
(1244, '2024-02-02', '', '3600/001', 'Paid to Phone Naing for Vr No-11249,11268', '0', '3500000', '56953083', 'Dr-Feb 24/031', '4000/P01', 135),
(1245, '2024-02-02', '', '3600/001', 'Paid to Thein Htay for Vr No-11269', '0', '4000000', '52953083', 'Dr-Feb 24/032', '4000/T02', 138),
(1246, '2024-02-02', '', '3600/001', 'Taxi Charges For Office 5 pcs Payment Day (6:30) PM', '0', '39500', '52913583', 'Dr Feb\'24/033', '9100/002', 150),
(1247, '2024-02-02', '', '3600/001', 'Meal Allowance for Office 5pcs Payment Day', '0', '10000', '52903583', 'Dr-Feb 24/034', '9100/012', 152),
(1248, '2024-02-02', '', '3600/001', 'Water Bill and services for WH (Dec/23) (78000+2000)', '0', '80000', '52823583', 'Dr-Feb 24/035', '9100/013', 154),
(1249, '2024-02-02', '', '3600/001', 'Paid to Sticker 5 colour for penam-sticker+other', '0', '1697000', '51126583', 'Dr-Feb 24/036', '6100/006', 156),
(1250, '2024-02-02', '', '3600/001', 'Taxi Charges for WH to Daw Nan house go for (Htet Paing Aye)', '0', '6000', '51120583', 'Dr-Feb 24/037', '9100/002', 158),
(1270, '2024-02-01', '', '3600/001', 'USA Money Received from UAB ($74925) 50%34762.5-10=$37452.5*2100ks $37462.5', '78650250', '0', '129770833', 'Cr-Feb 24/001', '3300/002', 188),
(1271, '2024-02-01', '', '3600/001', 'USA Money Received from UAB ($74925) 50%34762.5-10=$37452.5*2100ks $37462.5', '130369500', '0', '260140333', 'Cr-Feb 24/001', '3300/002', 190),
(1272, '2024-02-03', '', '3600/001', 'Paid to MA for Vr No-10586', '0', '4000000', '256140333', 'Dr-Feb 24/038', '4000/M01', 193),
(1273, '2024-02-03', '', '3600/001', 'Paid to Soe Naing for Vr No-10534,10542', '0', '4000000', '252140333', 'Dr-Feb 24/039', '4000/S08', 195),
(1274, '2024-02-03', '', '3600/001', 'paid to Khin Mg Myint for Vr No-11189', '0', '7000000', '245140333', 'Dr-Feb 24/040', '4000/K07', 197),
(1275, '2024-02-03', '', '3600/001', 'Car Diesel for 6J-3015(1.2)-50000/ (3.2)-50000', '0', '100000', '245040333', 'Dr-Feb 24/041', '9100/006', 199),
(1276, '2024-02-03', '', '3600/001', 'Engin Oil purchase for 6J-3015', '0', '10000', '245030333', 'Dr-Feb 24/042', '9100/014', 201),
(1277, '2024-02-03', '', '3600/001', 'Car police catch for 6J-3015(2.2)(3.2)', '0', '8000', '245022333', 'Dr-Feb 24/043', '9100/014', 203),
(1278, '2024-02-03', '', '3600/001', 'Paid to plastic (G/F)for Vr No-(31.1.24)(30.1.24)(30.1.24)', '0', '2112000', '242910333', 'Dr-Feb 24/044', '6100/003', 205),
(1279, '2024-02-03', '', '3600/001', 'Paid to Carton Box (MMMO)for (31.1.24)Vr 3 pcs', '0', '2193960', '240716373', 'Dr-Feb 24/045', '6100/003', 207),
(1280, '2024-02-03', '', '3600/001', 'Paid to HHK Cold Store', '0', '10000000', '230716373', 'Dr-Feb 24/046', '6100/007', 209),
(1281, '2024-02-03', '', '3600/001', 'Paid to Carton Box (Swan Pyae) for Vr No-(19.12.23 to 22.12.23)(26.12.23)(27.12.23)(27.12.23)', '0', '5730540', '224985833', 'Dr-Feb 24/047', '6100/003', 211),
(1282, '2024-02-03', '', '3600/001', 'Plastic Packing Strap 3000 M W 5*87000ks', '0', '435000', '224550833', 'Dr-Feb 24/048', '6100/003', 213),
(1283, '2024-02-03', '', '3600/001', 'Paid to Carton Box (Shwe Myay) for (2.12)(12.12)(14.12)', '0', '2000000', '222550833', 'Dr-Feb 24/049', '6100/003', 215),
(1284, '2024-02-03', '', '3600/001', 'Water 2 pk purchase for WH', '0', '1800', '222549033', 'Dr-Feb 24/050', '9100/003', 217),
(1285, '2024-02-03', '', '3600/001', 'lce 3 pcs purchase for HHk(Puti)', '0', '27000', '222522033', 'Dr-Feb 24/051', '6100/002', 219),
(1286, '2024-02-03', '', '3600/001', 'Labour Charges and Taxi Charges for (D-Puti) (109200+15000)', '0', '124200', '222397833', 'Dr-Feb 24/052', '6100/001', 221),
(1287, '2024-02-03', '', '3600/001', 'Taxi charges for HHK to WH pk', '0', '17000', '222380833', 'Dr-Feb 24/053', '9100/002', 223),
(1288, '2024-02-03', '', '3600/001', 'labour and Taxi Charges for (D-Puit)', '0', '106800', '222274033', 'Dr-Feb 24/054', '6100/001', 225),
(1289, '2024-02-03', '', '3600/001', 'lce 4 pcs purchase for (D-Puit)', '0', '36000', '222238033', 'Dr-Feb 24/055', '6100/002', 227),
(1290, '2024-02-03', '', '3600/001', 'Taxi Charges for HHK to WH', '0', '17000', '222221033', 'Dr-Feb 24/056', '9100/002', 229),
(1291, '2024-02-03', '', '3600/001', 'Ice 3pcs purchase for ( Ocean - Rohn )', '0', '30000', '222191033', 'Dr-Feb 24/057', '6100/002', 231),
(1292, '2024-02-03', '', '3600/001', 'Labour Charges for (Rohn)', '0', '10000', '222181033', 'Dr-Feb 24/058', '6100/001', 233),
(1293, '2024-02-03', '', '3600/001', 'Sir present purchase for ( Cambodia go ) wallet and bags (Yangoods)\r\n\r\n', '0', '519600', '221661433', 'Dr-Feb 24/059', '9100/015', 235),
(1294, '2024-02-03', '', '3600/001', 'Meal Allowance for Sir +2 pcs', '0', '95850', '221565583', 'Dr-Feb 24/060', '9100/012', 237),
(1332, '2024-02-05', '', '3600/001', 'Water 2 pk purchase for WH', '0', '1800', '221563783', 'Dr-Feb 24/061', '9100/003', 239),
(1333, '2024-02-05', '', '3600/001', 'Car Diesel for 6J-3015 (4.2)-50000/ (5.2)-50000', '0', '100000', '221463783', 'Dr-Feb 24/062', '9100/006', 241),
(1334, '2024-02-05', '', '3600/001', 'Car police catch for 6J-3015 (Market)', '0', '5000', '221458783', 'Dr-Feb 24/063', '9100/014', 243),
(1335, '2024-02-05', '', '3600/001', 'Taxi Charges for HHK to WH (pk)', '0', '17000', '221441783', 'Dr-Feb 24/064', '9100/002', 245),
(1336, '2024-02-05', '', '3600/001', 'Material purchase for WH', '0', '31500', '221410283', 'Dr-Feb 24/065', '9100/007', 247),
(1337, '2024-02-05', '', '3600/001', 'Photo paper and A4 purchase for WH', '0', '107500', '221302783', 'Dr-Feb 24/066', '9100/016', 249),
(1338, '2024-02-05', '', '3600/001', 'Battery 2 pcs charging charges and carry charges for (office)', '0', '15000', '221287783', 'Dr-Feb 24/067', '9100/007', 251),
(1339, '2024-02-05', '', '3600/001', 'Taxi charges for Ocean Pacific go workers', '0', '24000', '221263783', 'Dr-Feb 24/068', '9100/002', 253),
(1340, '2024-02-05', '', '3600/001', 'Paid to Moe Kyaw for Vr No-11332, 11339, Cheque No-052402', '0', '12503950', '208759833', 'Dr-Feb 24/069', '4000/M07', 255),
(1341, '2024-02-06', '', '3600/001', 'Canda Money $40862.68 from UAB 50% $20431.34-10=20421.34*2100ks $20431.34*3370ks $20431.34*105ks', '42884814', '0', '251644647', 'Cr-Feb 24/003', '3300/003', 256),
(1342, '2024-02-06', '', '3600/001', 'Canda Money $40862.68 from UAB 50% $20431.34-10=20421.34*2100ks $20431.34*3370ks $20431.34*105ks', '70998907', '0', '322643554', 'Cr-Feb 24/003', '3300/003', 258),
(1343, '2024-02-06', '', '3600/001', '$23462.5 in UAB Bank', '49250250', '0', '371893804', 'Cr-Feb 24/004', '3300/004', 260),
(1344, '2024-02-06', '', '3600/001', 'A4 paper, Pen, Debit voucher Charging Rope and Taxi for (office)', '0', '117800', '371776004', 'Dr Feb 24/070', '9100/016', 267),
(1345, '2024-02-06', '', '3600/001', 'Donation for Industry Zone', '0', '137000', '371639004', 'Dr Feb 24/071', '9100/011', 269),
(1346, '2024-02-06', '', '3600/001', 'Labour charges and Taxi for D-Puti', '0', '93000', '371546004', 'Dr Feb 24/072', '6100/001', 271),
(1347, '2024-02-06', '', '3600/001', 'Ice 3 pcs purchase for D-Puti', '0', '27000', '371519004', 'Dr Feb 24/073', '6100/002', 273),
(1348, '2024-02-06', '', '3600/001', 'Taxi Charges For WH to GFC and GFC to WH', '0', '24000', '371495004', 'Dr Feb 24/074', '9100/002', 275),
(1349, '2024-02-06', '', '3600/001', 'Car Pk and OT for 6J-3015 (Market)', '0', '7000', '371488004', 'Dr Feb 24/075', '6100/003', 277),
(1350, '2024-02-06', '', '3600/001', 'Taxi Charges For WH to GFC and GFC To SPD', '0', '10000', '371478004', 'Dr Feb 24/076', '9100/002', 279),
(1351, '2024-02-06', '', '3600/001', 'Ice 1 pcs purchase for (Rohu)', '0', '6000', '371472004', 'Dr Feb 24/077', '6100/002', 281),
(1352, '2024-02-06', '', '3600/001', 'YTP Bill for House (Jan/24)', '0', '60375', '371411629', 'Dr Feb 24/078', '9100/004', 283),
(1353, '2024-02-06', '', '3600/001', 'Hi-Internet Bill for office and WH office (Feb/24)', '0', '79800', '371331829', 'Dr Feb 24/079', '9100/004', 285),
(1354, '2024-02-06', '', '3600/001', 'Car Diesel for 6J-3015', '0', '50000', '371281829', 'Dr Feb 24/080', '9100/006', 287),
(1355, '2024-02-06', '', '3600/001', 'Battery purchase for WH Digital', '0', '20000', '371261829', 'Dr Feb 24/081', '9100/005', 289),
(1356, '2024-02-06', '', '3600/001', 'LAbour Charges and Taxi for D-Puti', '0', '138000', '371123829', 'Dr Feb 24/082', '6100/001', 291),
(1357, '2024-02-06', '', '3600/001', 'Ice 1 pcs purchase for D-Puti', '0', '9000', '371114829', 'Dr Feb 24/083', '6100/002', 293),
(1358, '2024-02-06', '', '3600/001', 'Taxi Charges For HHK to WH', '0', '17000', '371097829', 'Dr Feb 24/084', '9100/002', 295),
(1359, '2024-02-06', '', '3600/001', 'HHK to GFC MC carry for 2 Trucks', '0', '160000', '370937829', 'Dr Feb 24/085', '6100/005', 297),
(1360, '2024-02-06', '', '3600/001', 'ဧည့်စာရင်း(Boys)', '0', '10000', '370927829', 'Dr Feb 24/086', '9100/005', 299),
(1361, '2024-02-06', '', '3600/001', 'Paid to Ocean Pacific Cold Store', '0', '4000000', '366927829', 'Dr Feb 24/087', '6100/007', 301),
(1362, '2024-02-06', '', '3600/001', 'Paid to GFC Cold Store Charges', '0', '6754402', '360173427', 'Dr Feb 24/088', '6100/007', 303),
(1363, '2024-02-06', '', '3600/001', 'Taxi Charges for WH to GFC Money sent', '0', '24000', '360149427', 'Dr Feb 24/089', '9100/002', 305),
(1364, '2024-02-06', '', '3600/001', 'Paid to Thin Thin Yee for Vr No-11163,11176 Cheque No-039001', '0', '60000000', '300149427', 'Dr Feb 24/090', '4000/T03', 307),
(1365, '2024-02-06', '', '3600/001', 'Paid to Soe Thein (TCL) for Vr No-00113,00123 Cheque No-039003', '0', '30000000', '270149427', 'Dr Feb 24/091', '4000/S07', 309),
(1366, '2024-02-06', '', '3600/001', 'Paid to 4 Zaw for Vr No-11030,11042,11054 Cheque No-039004', '0', '5000000', '265149427', 'Dr Feb 24/092', '4000/001', 311),
(1367, '2024-02-06', '', '3600/001', 'Paid to AK for Vr No-11009,11023 Cheque No-039005', '0', '4000000', '261149427', 'Dr Feb 24/093', '4000/A01', 313),
(1368, '2024-02-06', '', '3600/001', 'Paid to Arr Kae for Vr No-11170,11199 Cheque No-039006', '0', '3000000', '258149427', 'Dr Feb 24/094', '4000/A02', 315),
(1369, '2024-02-06', '', '3600/001', 'Paid to Aung Naing Oo for Vr No-10891,10930,10980,11021 Cheque No-039007', '0', '7000000', '251149427', 'Dr Feb 24/095', '4000/A03', 317),
(1370, '2024-02-06', '', '3600/001', 'Paid to Myo Min for Vr No-10891,10930,10980,11021 Cheque No-039007', '0', '5000000', '246149427', 'Dr Feb 24/096', '4000/A05', 319),
(1371, '2024-02-06', '', '3600/001', 'Paid to Aung Zaw Oo for Vr No-11172 Cheque No-039009', '0', '3000000', '243149427', 'Dr Feb 24/097', '4000/A06', 321),
(1372, '2024-02-06', '', '3600/001', 'Paid to A Thay Lay for Vr No-11222,11237 Cheque No-0390010', '0', '4000000', '239149427', 'Dr Feb 24/098', '4000/A07', 323),
(1373, '2024-02-06', '', '3600/001', 'Paid to Bar Bu Lay for Vr No-11263 Cheque No-0390011', '0', '3000000', '236149427', 'Dr Feb 24/099', '4000/B01', 325),
(1374, '2024-02-06', '', '3600/001', 'Paid to Cho Mg for Vr No-11155,11161 Cheque No-0390012', '0', '5000000', '231149427', 'Dr Feb 24/100', '4000/C02', 327),
(1375, '2024-02-06', '', '3600/001', 'Paid to Htay Win for Vr No-  Cheque No-0390013', '0', '3000000', '228149427', 'Dr Feb 24/101', '4000/H02', 329),
(1376, '2024-02-06', '', '3600/001', 'Paid to Kyaw Zay Ya for Vr No-11097 Cheque No-0390014', '0', '7000000', '221149427', 'Dr Feb 24/102', '4000/K05', 331),
(1377, '2024-02-06', '', '3600/001', 'Paid to KTO for Vr No-10608,11322 Cheque No-0390015', '0', '4000000', '217149427', 'Dr Feb 24/103', '4000/K03', 333),
(1378, '2024-02-06', '', '3600/001', 'Paid to Kaung Myat for Vr No-11341 Cheque No-0390016', '0', '4000000', '213149427', 'Dr Feb 24/104', '4000/K04', 335),
(1379, '2024-02-06', '', '3600/001', 'Paid to Moe Kyaw for Vr No-11332 Cheque No-0390017', '0', '4000000', '209149427', 'Dr Feb 24/105', '4000/M07', 337),
(1380, '2024-02-06', '', '3600/001', 'Paid to Shwe Late for Vr No-10871,10842,10892,10902 Cheque No-0390018', '0', '5000000', '204149427', 'Dr Feb 24/106', '4000/S01', 339),
(1381, '2024-02-06', '', '3600/001', 'Paid to Soe Min for Vr No-10929,10997,11020 Cheque No-0390019', '0', '20000000', '184149427', 'Dr Feb 24/107', '4000/S03', 341),
(1382, '2024-02-06', '', '3600/001', 'Paid to Si Thu for Vr No-10845, 10857, 10858 Cheque No-0390020', '0', '5000000', '179149427', 'Dr Feb 24/108', '4000/S04', 343),
(1383, '2024-02-06', '', '3600/001', 'Paid to Thet Oo for Vr No-11120,11132 Cheque No-039021', '0', '30000000', '149149427', 'Dr Feb 24/109', '4000/T05', 345),
(1384, '2024-02-06', '', '3600/001', 'Paid to Thet Paing for Vr No-11327 Cheque No-039022', '0', '4000000', '145149427', 'Dr Feb 24/110', '4000/T01', 347),
(1385, '2024-02-06', '', '3600/001', 'Paid to Tun Zaw Min for Vr No-11074 Cheque No-039023', '0', '30000000', '115149427', 'Dr Feb 24/111', '4000/T11', 349),
(1386, '2024-02-06', '', '3600/001', 'Paid to Win Bo for Vr No-11283 Cheque No-039024', '0', '3352700', '111796727', 'Dr Feb 24/112', '4000/W01', 351),
(1387, '2024-02-06', '', '3600/001', 'Paid to Zaw Latt for Vr No-10966,11008 Cheque No-039025', '0', '4000000', '107796727', 'Dr Feb 24/113', '4000/Z01', 353),
(1388, '2024-02-06', '', '3600/001', 'Paid to Aung Kyaw Moe for Vr No-10944 Cheque No-052401', '0', '5472850', '102323877', 'Dr Feb 24/114', '4000/A04', 355),
(1389, '2024-02-06', '', '3600/001', 'Taxi Charges for WH to Market', '0', '18000', '102305877', 'Dr Feb 24/115', '9100/002', 357),
(1390, '2024-02-06', '', '3600/001', 'Car Pk and OT Charges for (Market)', '0', '8000', '102297877', 'Dr Feb 24/116', '6100/003', 359),
(1391, '2024-02-06', '', '3600/001', 'Labour Charges for Market', '0', '13000', '102284877', 'Dr Feb 24/117', '6100/001', 361),
(1392, '2024-02-06', '', '3600/001', 'Ice 5 pcs purchase for Market Fish', '0', '55000', '102229877', 'Dr Feb 24/118', '6100/002', 363),
(1393, '2024-02-07', '', '3600/001', 'WH to GFC Carton Box carry', '0', '40000', '102189877', 'Dr Feb 24/119', '6100/005', 365),
(1394, '2024-02-07', '', '3600/001', 'Paid to Plastic (G/F) for Vr  No-(6.2.24)(6.2.24)', '0', '1438250', '100751627', 'Dr Feb 24/120', '6100/003', 367),
(1395, '2024-02-07', '', '3600/001', 'Water 4 pk purchase for WH', '0', '3600', '100748027', 'Dr Feb 24/121', '9100/003', 369),
(1396, '2024-02-07', '', '3600/001', 'Photo paper purchase and Taxi Charges for WH', '0', '69000', '100679027', 'Dr Feb 24/122', '9100/016', 371),
(1397, '2024-02-07', '', '3600/001', 'Car Diesel for 6J-3015', '0', '50000', '100629027', 'Dr Feb 24/123', '9100/006', 373),
(1398, '2024-02-07', '', '3600/001', 'Car police catch for 6J-3015', '0', '5000', '100624027', 'Dr Feb 24/124', '9100/014', 375),
(1399, '2024-02-07', '', '3600/001', 'Sir take from Daw Nan (Cambodia go)', '0', '100000', '100524027', 'Dr Feb 24/125', '9100/017', 377),
(1400, '2024-02-07', '', '3600/001', 'Meal allowance for Market Boy 3 pcs', '0', '6000', '100518027', 'Dr Feb 24/126', '9100/012', 379),
(1401, '2024-02-07', '', '3600/001', 'Labour Charges for Market Boy 3 pcs', '0', '16000', '100502027', 'Dr Feb 24/127', '6100/001', 381),
(1402, '2024-02-07', '', '3600/001', 'Ice 7 pcs purchase for Market Fish', '0', '77000', '100425027', 'Dr Feb 24/128', '6100/002', 383),
(1403, '2024-02-07', '', '3600/001', 'Car PK for (Market)', '0', '2000', '100423027', 'Dr Feb 24/129', '6100/003', 385),
(1404, '2024-02-07', '', '3600/001', 'Taxi Charges for Boy 1 pcs house go', '0', '3000', '100420027', 'Dr Feb 24/130', '9100/002', 387),
(1405, '2024-02-08', '', '3600/001', 'Paid to Zaw Myat Thu for Vr No-11357', '0', '6000000', '94420027', 'Dr Feb 24/131', '4000/Z03', 389),
(1406, '2024-02-08', '', '3600/001', 'Safe Guard purchase and Lighting Repair for office', '0', '120000', '94300027', 'Dr Feb 24/132', '9100/018', 391),
(1407, '2024-02-08', '', '3600/001', 'Taxi Charges For HHK to WH and Ice 1 pcs ', '0', '26000', '94274027', 'Dr Feb 24/133', '9100/002', 393),
(1408, '2024-02-08', '', '3600/001', 'Car Diesel for 6J-3015', '0', '50000', '94224027', 'Dr Feb 24/134', '9100/006', 395),
(1409, '2024-02-08', '', '3600/001', 'Engin Oil purchase for 6J-3015', '0', '10000', '94214027', 'Dr Feb 24/135', '9100/014', 397),
(1410, '2024-02-08', '', '3600/001', 'Labour Charges and Taxi Charges for (D-Puti)', '0', '111000', '94103027', 'Dr Feb 24/136', '6100/001', 399),
(1411, '2024-02-08', '', '3600/001', 'Ice 4 pcs purchase for (D-Puti)', '0', '36000', '94067027', 'Dr Feb 24/137', '6100/002', 401),
(1412, '2024-02-08', '', '3600/001', 'Taxi Charges for HHK to GFC', '0', '17000', '94050027', 'Dr Feb 24/138', '9100/002', 403),
(1413, '2024-02-08', '', '3600/001', 'Car PK for 6J-3015 (Market)', '0', '2000', '94048027', 'Dr Feb 24/139', '6100/003', 405),
(1414, '2024-02-08', '', '3600/001', 'Market Boys 3 pcs Lunch', '0', '6000', '94042027', 'Dr Feb 24/140', '9100/012', 407),
(1415, '2024-02-08', '', '3600/001', 'Labour Charges for Market Fish', '0', '16000', '94026027', 'Dr Feb 24/141', '6100/001', 409),
(1416, '2024-02-08', '', '3600/001', 'Ice 3 pcs purchase for WH', '0', '33000', '93993027', 'Dr Feb 24/142', '6100/002', 411),
(1417, '2024-02-09', '', '3600/001', 'Car Diesel for 6J-3015', '0', '50000', '93943027', 'Dr Feb 24/143', '9100/006', 413),
(1418, '2024-02-09', '', '3600/001', 'Taxi Charges for WH to GFC', '0', '22000', '93921027', 'Dr Feb 24/144', '9100/002', 415),
(1419, '2024-02-09', '', '3600/001', 'Taxi Charges for WH to Goverment for (Lai Lai and May Zin Myo)', '0', '3000', '93918027', 'Dr Feb 24/145', '9100/002', 417),
(1420, '2024-02-09', '', '3600/001', 'Taxi Charges for Car Car Driver for (9.2) 8:30 PM', '0', '5000', '93913027', 'Dr Feb 24/146', '9100/002', 419),
(1421, '2024-02-09', '', '3600/001', 'Car police catch for 6J-3015 (Market)', '0', '5000', '93908027', 'Dr Feb 24/147', '9100/014', 421),
(1422, '2024-02-09', '', '3600/001', 'Labour Charges for Ocean Pacific (Raw)', '0', '13000', '93895027', 'Dr Feb 24/148', '6100/001', 423),
(1423, '2024-02-09', '', '3600/001', '', '0', '15000', '93880027', 'Dr Feb 24/149', '9100/002', 425),
(1424, '2024-02-09', '', '3600/001', 'Boy 2 pcs Lunch for Ocean (Pk)', '0', '4000', '93876027', 'Dr Feb 24/150', '9100/012', 427),
(1425, '2024-02-09', '', '3600/001', 'Labour Charges for D-Puti (230viss*600) and Taxi Charges (20000)', '0', '158000', '93718027', 'Dr Feb 24/151', '6100/001', 429),
(1426, '2024-02-09', '', '3600/001', 'Ice 2 pcs purchase for D-Puti', '0', '18000', '93700027', 'Dr Feb 24/152', '6100/002', 431),
(1427, '2024-02-09', '', '3600/001', 'Boys 2 pcs Lunch and Dinner for (HHK)', '0', '12000', '93688027', 'Dr Feb 24/153', '9100/012', 433),
(1428, '2024-02-09', '', '3600/001', 'Paid to Tun Zaw Min for Vr No-11074, 11079 Cheque No-052403', '0', '40000000', '53688027', 'Dr Feb 24/154', '4000/T11', 435),
(1429, '2024-02-09', '', '3600/001', 'Taxi Charges for WH to Market and WH', '0', '27000', '53661027', 'Dr Feb 24/155', '9100/002', 437),
(1430, '2024-02-09', '', '3600/001', 'Meal allowance for Market Boy', '0', '10500', '53650527', 'Dr Feb 24/156', '9100/012', 439),
(1431, '2024-02-09', '', '3600/001', 'Labour Charges for Market Fish', '0', '23000', '53627527', 'Dr Feb 24/157', '6100/001', 441),
(1432, '2024-02-09', '', '3600/001', 'Ice 6 pcs purchase for Market Fish', '0', '66000', '53561527', 'Dr Feb 24/158', '6100/002', 443),
(1433, '2024-02-09', '', '3600/001', 'Car PK and OT for Market', '0', '7000', '53554527', 'Dr Feb 24/159', '6100/003', 445),
(1436, '2024-02-06', '', '3600/002', '$23462.5 in UAB Bank', '23462.5', '0', '23462.5', 'Cr-Feb 24/004', '3300/004', 446),
(1439, '2024-02-06', '', '3600/002', '$27406.18 in UAB USD Bank', '27406.18', '0', '50868.68', 'Cr-Feb 24/005', '3300/002', 448);

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
(467, 1, 'debit', '27406.18', '27406.18', 'Cr-Feb 24/005', 448),
(468, 1, 'credit', '27406.18', '27406.18', 'Cr-Feb 24/005', 449);

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
(312, '1970-01-01', '1023', '4000/S03', NULL, 'Frozen', '1up', '24.5', '40.033', '0', 0, 294, 0),
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
(348, '0000-00-00', '1002', '4000/Z03', 'can', 'Frozen', '8up', '', '', '', 3, 86, 0);

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
(566, '2024-01-31', '', '3600/001', '0', '0', '213847883', 'Opening Balance of Jan\'24', '', '', 0, 0, 0),
(567, '2024-02-10', 'Closing Balance From SAF-18/2023', '3300/002', '0', '0', '136750.69', 'Closing Balance From SAF-18/2023', '', '', 0, 0, 0),
(568, '2024-02-16', 'Closing Balance Adv; Received from 01/2024', '3300/003', '0', '0', '-34007.64', 'Closing Balance Adv; Received from 01/2024', '', '', 0, 0, 0),
(569, '2024-02-03', 'Closing Balance From Italy -01/2024', '3300/004', '0', '0', '46969.36', 'Closing Balance From Italy -01/2024', '', '', 0, 0, 0),
(570, '2024-02-19', 'Closing Balance Adv; From KOLKATA', '3300/005', '0', '0', '-33410.00', 'Closing Balance Adv; From KOLKATA', '', '', 0, 0, 0),
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
(1164, '2024-02-06', 'Dr Feb 24/075', '6100/003', '7000', '0', '13515500', 'Car Pk and OT for 6J-3015 (Market)', '', '', 0, 37, 276),
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
(1246, '2024-02-06', 'Dr Feb 24/116', '6100/003', '8000', '0', '13523500', 'Car Pk and OT Charges for (Market)', '', '', 0, 37, 358),
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
(1272, '2024-02-07', 'Dr Feb 24/129', '6100/003', '2000', '0', '14963750', 'Car PK for (Market)', '', '', 0, 37, 384),
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
(1292, '2024-02-08', 'Dr Feb 24/139', '6100/003', '2000', '0', '14965750', 'Car PK for 6J-3015 (Market)', '', '', 0, 37, 404),
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
(1332, '2024-02-09', 'Dr Feb 24/159', '6100/003', '7000', '0', '14972750', 'Car PK and OT for Market', '', '', 0, 37, 444),
(1333, '2024-02-09', 'Dr Feb 24/159', '3600/001', '0', '7000', '53554526.5', 'Car PK and OT for Market', '', '', 0, 35, 445),
(1334, '2024-02-06', 'Cr-Feb 24/004', '3600/002', '23462.5', '0', '23462.5', '$23462.5 in UAB Bank', '', '', 0, 35, 446),
(1335, '2024-02-06', 'Cr-Feb 24/004', '3300/004', '0', '23462.5', '-49226743.14', '$23462.5 in UAB Bank', '', '', 0, 35, 447),
(1336, '2024-02-06', 'Cr-Feb 24/005', '3600/002', '27406.18', '0', '50868.68', '$27406.18 in UAB USD Bank', '', '', 0, 35, 448),
(1337, '2024-02-06', 'Cr-Feb 24/005', '3300/002', '0', '27406.18', '-208300021.37', '$27406.18 in UAB USD Bank', '', '', 0, 35, 449),
(1342, '2024-02-02', 'Dr-Feb 24/027', '4000/P02', '3400000', '0', '3400000', 'Paid to BLC (PYM) for Vr No-11221', '', '', 0, 40, 117);

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
(391, '1970-01-01', '4000/S03', '11410', 257250, '0000-00-00', '', '', 0, 358881476, 294, 0, '0000-00-00'),
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
(423, '2024-02-24', '4000/S03', '11417', 1908810, '0000-00-00', '', '', 0, 425135256, 326, 0, '0000-00-00');

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
(294, '1970-01-01', 11410, '4000/S03', 'Frozen', '1023', '1up', '24.5', 0, 10500, 257250),
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
(326, '2024-02-24', 11417, '4000/S03', 'Frozen', '1023', '4up', '114.3', 0, 16700, 1908810);

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
(127, '0000-00-00', '3300/002', '', '', '', '2024-02-06', 'Cr-Feb 24/005', '$27406.18 in UAB USD Bank', '27406.18', '940528.63', 449),
(128, '0000-00-00', '3300/002', '', '', '', '2024-02-06', 'Cr-Feb 24/008', 'in UAB', '3210.5', '937318.13', 451);

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
(125, '4000/D02', 'Dry Fish (Myo Thant)', '', '');

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
(276, '2024-02-06', 'Dr Feb 24/075', '6100/003', 'Car Pk and OT for 6J-3015 (Market)', '7000', '0', 'mmk', '', '', 0),
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
(358, '2024-02-06', 'Dr Feb 24/116', '6100/003', 'Car Pk and OT Charges for (Market)', '8000', '0', 'mmk', '', '', 0),
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
(384, '2024-02-07', 'Dr Feb 24/129', '6100/003', 'Car PK for (Market)', '2000', '0', 'mmk', '', '', 0),
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
(404, '2024-02-08', 'Dr Feb 24/139', '6100/003', 'Car PK for 6J-3015 (Market)', '2000', '0', 'mmk', '', '', 0),
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
(444, '2024-02-09', 'Dr Feb 24/159', '6100/003', 'Car PK and OT for Market', '7000', '0', 'mmk', '', '', 0),
(445, '2024-02-09', 'Dr Feb 24/159', '3600/001', 'Car PK and OT for Market', '0', '7000', 'mmk', '', '', 0),
(446, '2024-02-06', 'Cr-Feb 24/004', '3600/002', '$23462.5 in UAB Bank', '23462.5', '0', 'usd', '', '', 0),
(447, '2024-02-06', 'Cr-Feb 24/004', '3300/004', '$23462.5 in UAB Bank', '0', '23462.5', 'usd', '', '', 0),
(448, '2024-02-06', 'Cr-Feb 24/005', '3600/002', '$27406.18 in UAB USD Bank', '27406.18', '0', 'usd', '', '', 0),
(449, '2024-02-06', 'Cr-Feb 24/005', '3300/002', '$27406.18 in UAB USD Bank', '0', '27406.18', 'usd', '', '', 0);

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
(175, '10:44:05.000000', '2024-02-29', 'admin', 'admin', 'Login Success');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=339;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1440;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=473;

--
-- AUTO_INCREMENT for table `form7stock`
--
ALTER TABLE `form7stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=349;

--
-- AUTO_INCREMENT for table `form7stocktcl`
--
ALTER TABLE `form7stocktcl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `form10stock`
--
ALTER TABLE `form10stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `form10stocktcl`
--
ALTER TABLE `form10stocktcl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `general_ledger`
--
ALTER TABLE `general_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1343;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=424;

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
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=327;

--
-- AUTO_INCREMENT for table `receivable`
--
ALTER TABLE `receivable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=454;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
