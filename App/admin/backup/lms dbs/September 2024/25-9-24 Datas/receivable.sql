-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2024 at 08:29 AM
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
(171, '0000-00-00', '3300/002', '', '', '', '2024-02-01', 'Cr-Feb 24/001', 'Money Transfer From USA to UAB Bank', '75000', '967934.81', 87),
(172, '0000-00-00', '3300/003', '', '', '', '2024-02-06', 'Cr-Feb 24/003', 'Money Received from Canada to UAB Bank', '41000', '-75007.64', 229),
(173, '2024-02-14', '3300/003', 'CAN-02/24', 'OOLU6249050', '91728.97', '0000-00-00', '', '', '', '16721.33', 234),
(174, '0000-00-00', '3300/004', '', '', '', '2024-02-06', 'Cr-Feb 24/004', 'Money Received from ITALY to UAB Bank for InvNo. Italy-01/2024', '46960', '9.3600000000006', 237),
(175, '0000-00-00', '3300/002', '', '', '', '2024-02-06', 'Cr-Feb 24/005', 'Money Received from USA to UAB Bank for Inv No. SAF-19/2023', '75000', '892934.81', 241),
(176, '0000-00-00', '3300/002', '', '', '', '2024-02-14', 'Cr-Feb 24/007', 'Money Received from USA to UAB Bank', '75000', '817934.81', 491),
(177, '0000-00-00', '3300/002', '', '', '', '2024-02-14', 'Cr-Feb 24/008', 'Money Received from Mr Sarmad for USA Money to UAB Bank', '1000', '816934.81', 497),
(178, '0000-00-00', '3300/001', '', '', '', '2024-02-20', 'Cr-Feb 24/010', 'Loan Retrun from Best Brand (Bejon) transfer to UAB (Actual $25176*3480ks=87612480-87528227=Bank chg;8753+Different75500)', '0', '0', 755),
(179, '0000-00-00', '3300/003', '', '', '', '2024-02-22', 'Cr-Feb 24/011', 'Money Received from Canada to UAB Bank for Can-02/2024', '21000', '-4278.67', 825),
(180, '0000-00-00', '3300/002', '', '', '', '2024-02-22', 'Cr-Feb 24/012', 'USA Money Received from USA to UAB Bank for SAF-19/24 & SAF-20/24', '75000', '741934.81', 831),
(181, '0000-00-00', '3300/002', '', '', '', '2024-02-29', 'RV-SAF-0002', 'USA Money Received from USA for SAF-20/2023 & SAF-21/2024', '85000', '656934.81', 841),
(182, '0000-00-00', '3300/002', '', '', '', '2024-02-22', 'RV-SAF-0001', 'USA Money Received from USA for SAF-20/2023', '85000', '656934.81', 839),
(183, '0000-00-00', '3300/002', '', '', '', '2024-02-29', 'JV02-0001', 'As per Sir and Mr. Mihir MaMa aggrement Pujanut Value+Destruction=26000 we paid 50%  discount share $13000', '13000', '643934.81', 843),
(184, '0000-00-00', '3300/002', '', '', '', '2024-02-29', 'JV02-0001', 'As per Sir and Mr. Mihir MaMa aggrement Total Annual Discount Paid for March to March', '22000', '621934.81', 845),
(185, '2024-02-14', '3300/002', 'SAF-01/2024', 'TEMU9301700', '137554.28', '0000-00-00', '', '', '', '759489.09', 846),
(186, '2024-02-22', '3300/002', 'SAF-02/2024', 'MSCU7326910', '193462.28', '0000-00-00', '', '', '', '952951.37', 848),
(189, '0000-00-00', '3300/002', '', '', '', '2024-03-08', 'RV-SAF-0003', 'USA Money Received from USA for SAF-21/24 & SAF-22/24', '85000', '867951.37', 855),
(190, '2024-02-29', '3300/002', 'SAF-04/2024', 'CRSU6010316', '128300.05', '0000-00-00', '', '', '', '996251.42', 852),
(191, '2024-02-24', '3300/002', 'SAF-03/2024', 'OOLU6284046', '148334.84', '0000-00-00', '', '', '', '1144586.26', 850),
(192, '2024-02-21', '3300/003', 'Can-03/24', 'OOLU6338034', '130898.60', '0000-00-00', '', '', '', '126619.93', 856),
(193, '2024-02-21', '3300/003', 'Can-04/24', 'OTPU6128392', '171571.75', '0000-00-00', '', '', '', '298191.68', 858),
(194, '0000-00-00', '3300/003', '', '', '', '2024-02-23', 'RV-CAN-0001', 'Can Money Received from Canada for Can.02/24 & Can.03/24', '23000', '275191.68', 861);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `receivable`
--
ALTER TABLE `receivable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `receivable`
--
ALTER TABLE `receivable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
