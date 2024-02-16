-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2024 at 04:47 AM
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
(64, '2024-02-08', '11369', '4000/T01', 0, 16100, -3052100, '', '', '', 0, 0),
(65, '2024-02-02', '11356', '4000/T07', 0, 1166530, -1166530, '', '', '', 0, 0),
(66, '2024-02-02', '11357', '4000/Z03', 0, 14943200, -16109730, '', '', '', 0, 0),
(67, '2024-02-03', '11358', '4000/T05', 0, 54489795, -70599525, '', '', '', 0, 0),
(68, '2024-02-04', '11359', '4000/T02', 0, 6378000, -76977525, '', '', '', 0, 0),
(69, '2024-02-04', '11360', '4000/T07', 0, 4713550, -81691075, '', '', '', 0, 0),
(70, '2024-02-05', '11361', '4000/Z03', 0, 8379700, -90070775, '', '', '', 0, 0),
(71, '2024-02-06', '11362', '4000/T05', 0, 27322200, -117392975, '', '', '', 0, 0),
(72, '2024-02-07', '11365', '4000/B01', 0, 11876150, -129269125, '', '', '', 0, 0),
(73, '2024-02-07', '11366', '4000/T02', 0, 10002750, -139271875, '', '', '', 0, 0),
(74, '2024-02-07', '11367', '4000/T07', 0, 3275650, -142547525, '', '', '', 0, 0),
(75, '2024-02-08', '11368', '4000/T07', 0, 2108725, -144656250, '', '', '', 0, 0),
(76, '2024-02-08', '11370', '4000/T05', 0, 23972720, -168628970, '', '', '', 0, 0),
(77, '2024-02-09', '11371', '4000/T05', 0, 24180125, -192809095, '', '', '', 0, 0),
(78, '2024-02-10', '11375', '4000/T05', 0, 19522250, -212331345, '', '', '', 0, 0),
(79, '2024-02-11', '11372', '4000/K06', 0, 565400, -565400, '', '', '', 0, 0),
(80, '2024-02-11', '11373', '4000/T07', 0, 3514125, -4079525, '', '', '', 0, 0),
(81, '2024-02-12', '11374', '4000/T07', 0, 1163350, -1163350, '', '', '', 0, 0),
(82, '2024-02-01', 'Dr-Feb 24/001', '9100/003', 5400, 0, 5400, 'Water 6 pk purchase for WH', '', '', 0, 39),
(83, '2024-02-01', 'Dr-Feb 24/001', '3600/001', 0, 5400, -5400, 'Water 6 pk purchase for WH', '', '', 0, 35),
(86, '2024-02-01', 'Dr-Feb 24/002', '9100/004', 39000, 0, 39000, 'Sir Phone Bill and Monthly/ Phone 6 pcs Bill/ Sir-6000 (Sir,Daw Nan,Lai-15000) (Office,Sandar,Mar)', '', '', 0, 39),
(87, '2024-02-01', 'Dr-Feb 24/002', '3600/001', 0, 39000, -44400, 'Sir Phone Bill and Monthly/ Phone 6 pcs Bill/ Sir-6000 (Sir,Daw Nan,Lai-15000) (Office,Sandar,Mar)', '', '', 0, 35),
(88, '2024-02-01', 'Dr Feb\'24/003', '9100/005', 14000, 0, 14000, 'Medicine and Taxi for sir', '', '', 0, 39),
(89, '2024-02-01', 'Dr Feb\'24/003', '3600/001', 0, 14000, -58400, 'Medicine and Taxi for sir', '', '', 0, 35),
(90, '2024-02-01', 'Dr Feb\'24/004', '9100/006', 80000, 0, 80000, 'Car Diesel for 5L-2848 (30.1.24-10000)(30.1.24-70000)', '', '', 0, 39),
(91, '2024-02-01', 'Dr Feb\'24/004', '3600/001', 0, 80000, -138400, 'Car Diesel for 5L-2848 (30.1.24-10000)(30.1.24-70000)', '', '', 0, 35),
(92, '2024-02-01', 'Dr Feb\'24/005', '9100/006', 50000, 0, 130000, 'Car Diesel for 6J-3015 (31.1.24-50000)', '', '', 0, 39),
(93, '2024-02-01', 'Dr Feb\'24/005', '3600/001', 0, 50000, -188400, 'Car Diesel for 6J-3015 (31.1.24-50000)', '', '', 0, 35),
(94, '2024-02-01', 'Dr Feb\'24/006', '9100/007', 50000, 0, 50000, 'Material and Taxi Charges for PK Machine', '', '', 0, 39),
(95, '2024-02-01', 'Dr Feb\'24/006', '3600/001', 0, 50000, -238400, 'Material and Taxi Charges for PK Machine', '', '', 0, 35),
(96, '2024-02-01', 'Dr Feb\'24/007', '3300/001', 89928700, 0, 89928700, 'Bejon Loan take from LM 2020ED Balance $25176*3572ks(Best Brand)', '', '', 0, 35),
(97, '2024-02-01', 'Dr Feb\'24/007', '3600/001', 0, 89928700, -90167100, 'Bejon Loan take from LM 2020ED Balance $25176*3572ks(Best Brand)', '', '', 0, 35),
(98, '2024-02-01', 'Dr Feb\'24/008', '9100/008', 377000, 0, 377000, 'DHL charges for Italy Document sent', '', '', 0, 39),
(99, '2024-02-01', 'Dr Feb\'24/008', '3600/001', 0, 377000, -90544100, 'DHL charges for Italy Document sent', '', '', 0, 35),
(100, '2024-02-01', 'Dr Feb\'24/009', '4000/K06', 100000, 0, -465400, 'Paid to Ka Yin Lay Vr No-11337', '', '', 0, 40),
(101, '2024-02-01', 'Dr Feb\'24/009', '3600/001', 0, 100000, -90644100, 'Paid to Ka Yin Lay Vr No-11337', '', '', 0, 35);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `general_ledger`
--
ALTER TABLE `general_ledger`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `general_ledger`
--
ALTER TABLE `general_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
