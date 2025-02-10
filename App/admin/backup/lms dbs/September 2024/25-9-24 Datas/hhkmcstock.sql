-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2024 at 08:23 AM
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

--
-- Dumping data for table `hhkmcstock`
--

INSERT INTO `hhkmcstock` (`id`, `country`, `particular`, `date`, `commondity_id`, `size`, `kg`, `mc`, `balance_mc`, `loosein_size`, `loosein_kg`, `loosein_pcs`, `looseout_size`, `looseout_kg`, `looseout_pcs`, `remark`, `fish_type`) VALUES
(119, 'NY', 'From Form-10', '2024-07-06', '1023', '3up', '22', 78, 78, '', '', 0, '', '', 0, '', 'G'),
(120, 'NY', 'From Form-10', '2024-07-06', '1023', '3up', '23', 50, 50, '', '', 0, '', '', 0, '', 'G'),
(123, 'NY', 'Balance', '2024-07-03', '1030', '1up', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(124, 'NY', 'Balance', '2024-07-03', '1030', '1.5up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(125, 'NY', 'F-10', '2024-07-05', '1030', '1up', '20', 18, 19, '', '', 0, '', '', 0, '', 'G'),
(126, 'NY', 'F-10', '2024-07-05', '1030', '1.5up', '20', 9, 9, '', '', 0, '', '', 0, '', 'G'),
(127, 'NY', 'F-10', '2024-07-05', '1030', '2up', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(128, 'NY', 'F-10', '2024-07-05', '1030', '2up', '21', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(129, 'NY', 'F-10', '2024-07-05', '1030', '8/10', '20', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(130, 'NY', 'F-10', '2024-07-06', '1030', '1up', '20', 3, 22, '', '', 0, '', '', 0, '', 'G'),
(131, 'NY', 'F-10', '2024-07-06', '1030', '1.5up', '20', 2, 11, '', '', 0, '', '', 0, '', 'G'),
(132, 'NY', 'F-10', '2024-07-06', '1030', '2up', '21', 1, 3, '', '', 0, '', '', 0, '', 'G'),
(133, 'can', 'F-10', '2024-07-05', '1016', '2up', '21', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(134, 'can', 'F-10', '2024-07-06', '1016', '1.5up', '20', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(135, 'can', 'F-10', '2024-07-06', '1016', '1up', '20', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(136, 'can', 'F-10', '2024-07-06', '1016', '800g', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(137, 'Can', 'Balance', '2024-07-06', '1001', '1up', '20', 3, 3, '', '', 0, '', '', 0, '', 'G'),
(138, 'can', 'F-10', '2024-07-05', '1001', '1up', '20', 2, 5, '', '', 0, '', '', 0, '', 'G'),
(139, 'can', 'F-10', '2024-07-05', '1001', '1.5up', '20', 1, 1, '', '', 0, '', '', 0, '', 'G'),
(140, 'can', 'F-10', '2024-07-05', '1001', '2up', '20', 2, 2, '', '', 0, '', '', 0, '', 'G'),
(141, 'can', 'F-10', '2024-07-06', '1001', '1up', '20', 7, 12, '', '', 0, '', '', 0, '', 'G'),
(142, 'can', 'F-10', '2024-07-06', '1001', '1.5up', '20', 3, 4, '', '', 0, '', '', 0, '', 'G'),
(143, 'can', 'F-10', '2024-07-06', '1001', '2up', '20', 2, 4, '', '', 0, '', '', 0, '', 'G'),
(144, 'can', 'F-10', '2024-07-06', '1001', '3up', '20', 2, 2, '', '', 0, '', '', 0, '', 'G');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hhkmcstock`
--
ALTER TABLE `hhkmcstock`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hhkmcstock`
--
ALTER TABLE `hhkmcstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
