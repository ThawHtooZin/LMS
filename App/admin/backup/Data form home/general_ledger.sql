-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2024 at 04:48 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.17

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(74, '2024-02-07', '11367', '4000/T07', 0, 2366700, -141638575, '', '', '', 0, 0),
(75, '2024-02-01', '6756576', '9100/001', 5000, 0, 5000, 'igi', '', '', 0, 39),
(76, '2024-02-01', '6756576', '3600/001', 0, 5000, -5000, 'iuyhiu', '', '', 0, 35),
(77, '2024-02-01', '6756484', '9100/003', 10000, 0, 10000, 'jihjhjhgjh', '', '', 0, 39),
(78, '2024-02-01', '6756484', '3600/001', 0, 10000, -15000, 'jhgjhgjhgjhgjh', '', '', 0, 35),
(79, '2024-02-17', '988787', '4000/K011', 0, 200000, -200000, '', '', '', 0, 0),
(80, '2024-02-03', 'Dr-Feb 24/038', '4000/M01', 4000000, 0, 4000000, 'Paid to MA for Vr No-10586', '', '', 0, 40),
(81, '2024-02-03', 'Dr-Feb 24/038', '3600/001', 0, 4000000, -4015000, 'Paid to MA for Vr No-10586', '', '', 0, 35),
(82, '2024-02-03', 'Dr-Feb 24/039', '4000/S08', 4000000, 0, 4000000, 'Paid to Soe Naing for Vr No-10534,10542', '', '', 0, 40),
(83, '2024-02-03', 'Dr-Feb 24/039', '3600/001', 0, 4000000, -8015000, 'Paid to Soe Naing for Vr No-10534,10542', '', '', 0, 35),
(84, '2024-02-03', 'Dr-Feb 24/040', '4000/K07', 7000000, 0, 7000000, 'Paid to Khin Mg Myint for Vr N0-11189', '', '', 0, 40),
(85, '2024-02-03', 'Dr-Feb 24/040', '3600/001', 0, 7000000, -15015000, 'paid to Khin Mg Myint for Vr No-11189', '', '', 0, 35),
(86, '2024-02-03', 'Dr-Feb 24/041', '9100/006', 100000, 0, 100000, 'Car Diesel for 6J-3015(1.2)-50000/ (3.2)-50000', '', '', 0, 39),
(87, '2024-02-03', 'Dr-Feb 24/041', '3600/001', 0, 100000, -15115000, 'Car Diesel for 6J-3015(1.2)-50000/ (3.2)-50000', '', '', 0, 35),
(88, '2024-02-03', 'Dr-Feb 24/042', '9100/014', 10000, 0, 10000, 'Engin Oil purchase for 6J-3015', '', '', 0, 39),
(89, '2024-02-03', 'Dr-Feb 24/042', '3600/001', 0, 10000, -15125000, 'Engin Oil purchase for 6J-3015', '', '', 0, 35),
(90, '2024-02-03', 'Dr-Feb 24/043', '9100/014', 8000, 0, 18000, 'Car police catch for 6J-3015(2.2)(3.2)', '', '', 0, 39),
(91, '2024-02-03', 'Dr-Feb 24/043', '3600/001', 0, 8000, -15133000, 'Car police catch for 6J-3015(2.2)(3.2)', '', '', 0, 35),
(92, '2024-02-03', 'Dr-Feb 24/044', '6100/003', 2112000, 0, 2112000, 'paid to plastic (G/F) for Vr No-(31.1.24)(30.1.24)(30.1.24)', '', '', 0, 37),
(93, '2024-02-03', 'Dr-Feb 24/044', '3600/001', 0, 2112000, -17245000, 'Paid to plastic (G/F)for Vr No-(31.1.24)(30.1.24)(30.1.24)', '', '', 0, 35),
(94, '2024-02-03', 'Dr-Feb 24/045', '6100/003', 2193960, 0, 4305960, 'Paid to Carton Box (MMMO)for (31.1.24)Vr 3 pcs', '', '', 0, 37),
(95, '2024-02-03', 'Dr-Feb 24/045', '3600/001', 0, 2193960, -19438960, 'Paid to Carton Box (MMMO)for (31.1.24)Vr 3 pcs', '', '', 0, 35),
(96, '2024-02-03', 'Dr-Feb 24/046', '6100/007', 10000000, 0, 10000000, 'Paid to HHK Cold Store', '', '', 0, 37),
(97, '2024-02-03', 'Dr-Feb 24/046', '3600/001', 0, 10000000, -29438960, 'Paid to HHK Cold Store', '', '', 0, 35),
(98, '2024-02-03', 'Dr-Feb 24/047', '6100/003', 5730540, 0, 10036500, 'Paid to Carton Box (Swan Pyae) for Vr No-(19.12.23 to 22.12.23)(26.12.23)(27.12.23)(27.12.23)', '', '', 0, 37),
(99, '2024-02-03', 'Dr-Feb 24/047', '3600/001', 0, 5730540, -35169500, 'Paid to Carton Box (Swan Pyae) for Vr No-(19.12.23 to 22.12.23)(26.12.23)(27.12.23)(27.12.23)', '', '', 0, 35),
(100, '2024-02-03', 'Dr-Feb 24/048', '6100/003', 435000, 0, 10471500, 'Plastic Packing Strap 3000 M W 5*87000ks', '', '', 0, 37),
(101, '2024-02-03', 'Dr-Feb 24/048', '3600/001', 0, 435000, -35604500, 'Plastic Packing Strap 3000 M W 5*87000ks', '', '', 0, 35),
(102, '2024-02-03', 'Dr-Feb 24/049', '6100/003', 2000000, 0, 12471500, 'Paid to Carton Box (Shwe Myay) for (2.12)(12.12)(14.12)', '', '', 0, 37),
(103, '2024-02-03', 'Dr-Feb 24/049', '3600/001', 0, 2000000, -37604500, 'Paid to Carton Box (Shwe Myay) for (2.12)(12.12)(14.12)', '', '', 0, 35),
(104, '2024-02-03', 'Dr-Feb 24/050', '9100/003', 1800, 0, 11800, 'Water 2 pk purchase for WH', '', '', 0, 39),
(105, '2024-02-03', 'Dr-Feb 24/050', '3600/001', 0, 1800, -37606300, 'Water 2 pk purchase for WH', '', '', 0, 35),
(106, '2024-02-03', 'Dr-Feb 24/051', '6100/002', 27000, 0, 27000, 'lce 3 pcs purchase for HHk(Puti)', '', '', 0, 37),
(107, '2024-02-03', 'Dr-Feb 24/051', '3600/001', 0, 27000, -37633300, 'lce 3 pcs purchase for HHk(Puti)', '', '', 0, 35),
(108, '2024-02-03', 'Dr-Feb 24/052', '6100/001', 124200, 0, 124200, 'Labour Charges and Taxi Charges for (D-Puti) (109200+15000)', '', '', 0, 37),
(109, '2024-02-03', 'Dr-Feb 24/052', '3600/001', 0, 124200, -37757500, 'Labour Charges and Taxi Charges for (D-Puti) (109200+15000)', '', '', 0, 35),
(110, '2024-02-03', 'Dr-Feb 24/053', '9100/002', 17000, 0, 17000, 'Taxi charges for HHK to WH pk', '', '', 0, 39),
(111, '2024-02-03', 'Dr-Feb 24/053', '3600/001', 0, 17000, -37774500, 'Taxi charges for HHK to WH pk', '', '', 0, 35),
(112, '2024-02-03', 'Dr-Feb 24/054', '6100/001', 106800, 0, 231000, 'labour and Taxi Charges for (D-Puit)', '', '', 0, 37),
(113, '2024-02-03', 'Dr-Feb 24/054', '3600/001', 0, 106800, -37881300, 'labour and Taxi Charges for (D-Puit)', '', '', 0, 35),
(114, '2024-02-03', 'Dr-Feb 24/055', '6100/002', 36000, 0, 63000, 'lce 4 pcs purchase for (D-Puit)', '', '', 0, 37),
(115, '2024-02-03', 'Dr-Feb 24/055', '3600/001', 0, 36000, -37917300, 'lce 4 pcs purchase for (D-Puit)', '', '', 0, 35),
(116, '2024-02-03', 'Dr-Feb 24/056', '9100/002', 17000, 0, 34000, 'Taxi Charges for HHK to WH', '', '', 0, 39),
(117, '2024-02-03', 'Dr-Feb 24/056', '3600/001', 0, 17000, -37934300, 'Taxi Charges for HHK to WH', '', '', 0, 35),
(118, '2024-02-03', 'Dr-Feb 24/057', '6100/002', 30000, 0, 93000, 'Ice 3pcs purchase for ( Ocean - Rohn )', '', '', 0, 37),
(119, '2024-02-03', 'Dr-Feb 24/057', '3600/001', 0, 30000, -37964300, 'Ice 3pcs purchase for ( Ocean - Rohn )', '', '', 0, 35),
(120, '2024-02-03', 'Dr-Feb 24/058', '6100/001', 10000, 0, 241000, 'Labour Charges for (Rohn)', '', '', 0, 37),
(121, '2024-02-03', 'Dr-Feb 24/058', '3600/001', 0, 10000, -37974300, 'Labour Charges for (Rohn)', '', '', 0, 35),
(122, '2024-02-03', 'Dr-Feb 24/059', '9100/015', 519600, 0, 519600, 'Sir present purchase for ( Cambodia go ) wallet and bags (Yangoods)\r\n\r\n', '', '', 0, 39),
(123, '2024-02-03', 'Dr-Feb 24/059', '3600/001', 0, 519600, -38493900, 'Sir present purchase for ( Cambodia go ) wallet and bags (Yangoods)\r\n\r\n', '', '', 0, 35),
(124, '2024-02-03', 'Dr-Feb 24/060', '9100/016', 95850, 0, 95850, 'Meal Allowance for Sir +2 pcs', '', '', 0, 39),
(125, '2024-02-03', 'Dr-Feb 24/060', '3600/001', 0, 95850, -38589750, 'Meal Allowance for Sir +2 pcs', '', '', 0, 35);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
