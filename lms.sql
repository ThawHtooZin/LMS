-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2023 at 06:28 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

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
(2, 'user', 'user', 'user@gmail.com', 2),
(3, 'saleperson', 'saleperson', 'saleperson@gmail.com', 3),
(5, 'uzinlinoo', 'uzinlinoo', 'uzinlinoo@gmail.com', 1),
(16, 'Lwing Paing Oo', 'lpo', 'lpo@gmail.com', 3),
(17, 'Myat Thu', 'mt', 'mt@gmail.com', 4),
(18, 'admin', 'admin', 'admin@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cashbook`
--

CREATE TABLE `cashbook` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `account_no` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `voucher_no` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `account_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `debit` bigint(20) NOT NULL,
  `credit` bigint(20) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `balance` bigint(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cashbook`
--

INSERT INTO `cashbook` (`id`, `date`, `account_no`, `voucher_no`, `account_type`, `debit`, `credit`, `description`, `balance`) VALUES
(3, '2023-08-16', 'AS112', 'BS121', 'general', 1000, 100, 'desc', 0);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(4, 'Fish'),
(5, 'Crab'),
(8, 'Cold Drinks'),
(9, 'Snack');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `customer_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_phone` bigint(14) NOT NULL,
  `customer_address` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_phone`, `customer_address`) VALUES
('B133', 'U KoKo', 911111111, 'mandalay'),
('e3333', 'ssss', 344544, 'sssss');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `category_id`, `item_name`) VALUES
('BJ123', 4, 'Baby Koral'),
('BJ536', 4, 'Boal'),
('HG184', 4, 'D-Puti'),
('HJ275', 4, 'Taboshi'),
('HL123', 4, 'Hilsa'),
('JK167', 4, 'Tilapia'),
('KJ243', 4, 'Poa'),
('LK123', 4, 'Batashi'),
('OJ247', 4, 'Puti'),
('UT216', 4, 'Rohu');

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
  `size` int(11) NOT NULL,
  `viss` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `pcs` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`no`, `date`, `voucher_no`, `supplier_id`, `tclfrozen`, `commodity`, `size`, `viss`, `pcs`, `price`, `amount`) VALUES
(3, '2023-08-01', 230001, 'DK123', 'frozen', 'HL123', 10, '289.6', 0, 28000, 8108800),
(4, '2023-08-01', 230001, 'DK123', 'frozen', 'HL123', 10, '50', 0, 280, 14000),
(5, '2023-08-01', 230001, 'DK123', 'frozen', 'OJ247', 8, '10', 0, 5000, 50000),
(6, '2023-08-01', 230001, 'DK123', 'frozen', 'OJ247', 9, '100', 0, 5000, 500000),
(7, '2023-08-01', 230002, 'NS123', 'frozen', 'HL123', 10, '10', 0, 36000, 360000),
(8, '2023-08-01', 230002, 'NS123', 'frozen', 'HL123', 10, '50', 0, 36000, 1800000),
(9, '2023-08-01', 230002, 'NS123', 'frozen', 'LK123', 15, '10', 0, 7000, 70000),
(10, '2023-08-01', 230002, 'NS123', 'frozen', 'LK123', 15, '100', 0, 7000, 700000),
(11, '2023-08-22', 111, 'KJ122', 'frozen', 'HL123', 10, '257', 12, 1000, 257000),
(12, '2023-08-23', 264, 'DG214', 'frozen', 'HL123', 10, '275', 25, 1900, 522500);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `supplier_name`, `supplier_phone`, `supplier_address`) VALUES
('DK123', 'Naung Naung', '09123123', 'Mandalay'),
('NS123', 'Tun Naing', '0923423423', 'Yangon'),
('DG214', 'Thaung Htun', '09234234', 'Mandalay'),
('KJ122', 'Soe Naing', '09342124', 'Nay Pyi Daw'),
('OP123', 'Pho Zaw', '092342342', 'Ayar Wa Di'),
('HE132', 'Bar Bulay', '09123123', 'India'),
('KJ126', 'Soe Thain', '091324124', 'Na Kya Pa Noung'),
('JK909', 'Phyo Lay', '09976476', 'Nay Pyi Daw'),
('KJ234', 'Ko Myo', '0938757878', 'Ka Chin'),
('KH122', 'Soe Myint', '09234234', 'Mandalay'),
('JH123', 'Thar Hla', '0924234345', 'Thi Li Lin Kar');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
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
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `cashbook`
--
ALTER TABLE `cashbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
