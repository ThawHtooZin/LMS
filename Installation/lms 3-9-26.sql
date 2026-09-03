-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2026 at 07:01 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

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
-- Table structure for table `accodes`
--

CREATE TABLE `accodes` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `class` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `system_tag` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accodes`
--

INSERT INTO `accodes` (`id`, `code`, `name`, `type`, `class`, `description`, `system_tag`) VALUES
(1, '1501', 'Main Cash Kyats', 'Current Asset', 'ASSETS', 'Primary cash on hand', 'main_cash'),
(2, '2000', 'Accounts Payable', 'Current Liability', 'LIABILITIES', 'Master control account for all unpaid bills', 'accounts_payable'),
(3, '5000', 'Fish Purchases', 'Direct Costs', 'EXPENSES', 'Raw fish inventory purchases', NULL),
(4, '5010', 'Packing Materials', 'Direct Costs', 'EXPENSES', 'Cartons, foam boxes, tapes, etc.', NULL),
(5, '200', 'Sales', 'Revenue', 'REVENUE', 'Income from any normal business activity', NULL),
(6, '260', 'Other Revenue', 'Revenue', 'REVENUE', 'Any other income that does not relate to normal business activities and is not recurring', NULL),
(7, '270', 'Interest Income', 'Revenue', 'REVENUE', 'Interest income', NULL),
(8, '310', 'Cost of Goods Sold', 'Direct Costs', 'EXPENSES', 'Cost of goods sold by the business', NULL),
(9, '400', 'Advertising', 'Expense', 'EXPENSES', 'Expenses incurred for advertising while trying to increase sales', NULL),
(10, '404', 'Bank Fees', 'Expense', 'EXPENSES', 'Fees charged by your bank for transactions regarding your bank account(s).', NULL),
(11, '408', 'Cleaning', 'Expense', 'EXPENSES', 'Expenses incurred for cleaning  business property.', NULL),
(12, '412', 'Consulting & Accounting', 'Expense', 'EXPENSES', 'Expenses related to paying consultants', NULL),
(13, '416', 'Depreciation', 'Expense', 'EXPENSES', 'The amount of the asset\'s cost (based on the useful life) that was consumed during the period', NULL),
(14, '420', 'Entertainment', 'Expense', 'EXPENSES', 'Expenses paid by company for the business but are not deductable for income tax purposes.', NULL),
(15, '425', 'Freight & Courier', 'Expense', 'EXPENSES', 'Expenses incurred on courier & freight costs', NULL),
(16, '429', 'General Expenses', 'Expense', 'EXPENSES', 'Any other expenses incurred that does not relate to normal business activities and is not recurring', NULL),
(17, '433', 'Insurance', 'Expense', 'EXPENSES', 'Expenses incurred for insurance of business assets', NULL),
(18, '437', 'Interest Expense', 'Expense', 'EXPENSES', 'Interest to be paid on money borrowed by the business', NULL),
(19, '441', 'Legal expenses', 'Expense', 'EXPENSES', 'Expenses related to paying lawyers', NULL),
(20, '445', 'Light, Power, Heating', 'Expense', 'EXPENSES', 'Expenses incurred for electricity and heating.', NULL),
(21, '449', 'Motor Vehicle Expenses', 'Expense', 'EXPENSES', 'Expenses incurred for Motor Vehicles', NULL),
(22, '453', 'Office Expenses', 'Expense', 'EXPENSES', 'Expenses incurred for office equipment.', NULL),
(23, '461', 'Printing & Stationery', 'Expense', 'EXPENSES', 'Expenses incurred for printing & stationery', NULL),
(24, '469', 'Rent', 'Expense', 'EXPENSES', 'Expenses incurred for renting business property.', NULL),
(25, '473', 'Repairs and Maintenance', 'Expense', 'EXPENSES', 'Expenses incurred for Repair and Maintanence of business assets', NULL),
(26, '477', 'Wages and Salaries', 'Expense', 'EXPENSES', 'Wages & Salaries', NULL),
(27, '485', 'Subscriptions', 'Expense', 'EXPENSES', 'Expenses incurred for subscriptions.', NULL),
(28, '489', 'Telephone & Internet', 'Expense', 'EXPENSES', 'Expenses incurred for telephone and internet.', NULL),
(29, '493', 'Travel - National', 'Expense', 'EXPENSES', 'Expenses incurred for National Travel.', NULL),
(30, '497', 'Travel - International', 'Expense', 'EXPENSES', 'Expenses incurred for International Travel.', NULL),
(31, '498', 'Unrealized Currency Gains', 'Unrealized Currency Gains', 'REVENUE', 'Unrealized Currency Gains', NULL),
(32, '499', 'Realized Currency Gains', 'Realized Currency Gains', 'REVENUE', 'Realized Currency Gains', NULL),
(33, '500', 'Costs of Capital', 'Expense', 'EXPENSES', 'Cost of Capital', NULL),
(34, '600', 'Accounts Receivable', 'Accounts Receivable', 'ASSETS', 'Outstanding balances for sales made to customers', NULL),
(35, '610', 'Accounts Receivable (Import)', 'Accounts Receivable', 'ASSETS', 'Outstanding balances for sales made to customers', NULL),
(36, '611', 'Prepayments', 'Current Asset', 'ASSETS', 'Prepayments', NULL),
(37, '630', 'Inventory', 'Inventory', 'ASSETS', 'The value of the inventory on hand', NULL),
(38, '710', 'Office Equipment', 'Fixed Asset', 'ASSETS', 'The value of the Office Equipment', NULL),
(39, '711', 'Less Accumulated Depreciation on Office Equipment', 'Fixed Asset', 'ASSETS', 'The depreciation of the Office Equipment', NULL),
(40, '720', 'Computer Equipment', 'Fixed Asset', 'ASSETS', 'The value of the Computer Equipment', NULL),
(41, '721', 'Less Accumulated Depreciation on Computer Equipment', 'Fixed Asset', 'ASSETS', 'The depreciation of the Computer Equipment', NULL),
(42, '730', 'Motor Vehicles', 'Fixed Asset', 'ASSETS', 'The value of the Motor Vehicles', NULL),
(43, '731', 'Less Accumulated Depreciation on Motor Vehicles', 'Fixed Asset', 'ASSETS', 'The depreciation of the Motor Vehicles', NULL),
(44, '800', 'Accounts Payable', 'Accounts Payable', 'LIABILITIES', 'Outstanding balances for bills from suppliers', NULL),
(45, '801', 'Unpaid Expense Claims', 'Unpaid Expense Claims', 'LIABILITIES', 'Unpaid Expense Claims', NULL),
(46, '804', 'Wages Payable', 'Wages Payable', 'LIABILITIES', 'Wages Payable', NULL),
(47, '820', 'Sales Tax', 'Sales Tax', 'LIABILITIES', 'The balance of the sales tax owing to the Tax Authority', NULL),
(48, '825', 'Historical Adjustment', 'Historical Adjustment', 'EQUITY', 'Historical Adjustment', NULL),
(49, '826', 'Rounding', 'Rounding', 'EQUITY', 'Rounding', NULL),
(50, '830', 'Income Tax Payable', 'Current Liability', 'LIABILITIES', 'The balance of the income tax owing to the Tax Authority', NULL),
(51, '840', 'Historical Adjustment (Import)', 'Historical Adjustment', 'EQUITY', 'Historical Adjustment', NULL),
(52, '850', 'Suspense', 'Current Liability', 'LIABILITIES', 'Suspense', NULL),
(53, '860', 'Rounding (Import)', 'Rounding', 'EQUITY', 'Rounding', NULL),
(54, '880', 'Owner A Drawings', 'Current Liability', 'LIABILITIES', 'Withdrawals by the owners', NULL),
(55, '881', 'Owner A Funds Introduced', 'Current Liability', 'LIABILITIES', 'Funds contributed by the owner', NULL),
(56, '900', 'Loan', 'Non-current Liability', 'LIABILITIES', 'Money that has been borrowed from a creditor', NULL),
(57, '960', 'Retained Earnings', 'Retained Earnings', 'EQUITY', 'Do not Use', NULL),
(58, '970', 'Owner A Share Capital', 'Equity', 'EQUITY', 'The value of shares purchased by the shareholders', NULL),
(59, '5001', 'Material Purchase', 'Direct Costs', 'Expenses', 'MC packaging materials', NULL);

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
(7, 'Su Thiri Kyaw', 'su122333', 'suthirikyaw@gmail.com', 4),
(8, 'UMyoWinSwe', 'password', 'testing@gmail.com', 6);

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
(3, '3', '2up', '21', 10, '210', '', '', 3, 4),
(4, '3', '3up', '23', 10, '230', '', '', 3, 5),
(5, '2', '6up', '25', 20, '500', '', '', 3, 6),
(6, '2', '7up', '23', 8, '184', '', '', 3, 7);

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

--
-- Dumping data for table `coldstore`
--

INSERT INTO `coldstore` (`id`, `indate`, `outdate`, `commondity_id`, `mc`, `total_mc`, `kg`, `total_kg`, `day`, `rate`, `charges`, `total_charges`) VALUES
(1, '2026-09-01', '2026-09-03', '3', 20, 20, '60', '60', 3, '3', 540, 540);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_type` varchar(50) NOT NULL DEFAULT 'Fish Supplier',
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `is_supplier` tinyint(1) NOT NULL DEFAULT 0,
  `is_customer` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `contact_type`, `email`, `phone`, `address`, `is_supplier`, `is_customer`) VALUES
(2, 'Tommy', 'Fish Supplier', '', '0987654321', '', 1, 0),
(3, 'Ko Myo', 'Fish Supplier', '', '234567890324567', '', 1, 0),
(4, 'Ko Myo Naing', 'Fish Supplier', '', '123456543234', '', 1, 0),
(5, 'Ko Aung Naing', 'Fish Supplier', '', '67766754565', '', 1, 0),
(6, 'Shwe Myay', 'Material Supplier', '', '', '', 1, 0),
(7, 'Tommy', 'Fish Supplier', '', '', '', 0, 1),
(8, 'ThawHtooZin', 'Fish Supplier', '', '', '', 1, 0),
(9, 'Mg Mg (TCL)', 'Fish Supplier', '', '', '', 1, 0);

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
-- Table structure for table `exchange_rates`
--

CREATE TABLE `exchange_rates` (
  `id` int(11) NOT NULL,
  `currency_code` varchar(10) NOT NULL,
  `rate` decimal(15,4) NOT NULL,
  `effective_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exchange_rates`
--

INSERT INTO `exchange_rates` (`id`, `currency_code`, `rate`, `effective_date`) VALUES
(1, 'USD', 4500.0000, '2026-07-27'),
(2, 'USD', 4000.0000, '2026-08-07'),
(3, 'USD', 4500.0000, '2026-08-01'),
(4, 'USD', 4300.0000, '2026-08-24'),
(5, 'USD', 4500.0000, '2026-08-23');

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
  `water_kg` int(11) NOT NULL,
  `fish_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `form7stock`
--

INSERT INTO `form7stock` (`id`, `date`, `item_id`, `supplier_name`, `country`, `type`, `size`, `viss`, `kg`, `pcspervr`, `pcsperf7`, `link_id`, `water_kg`, `fish_type`) VALUES
(34, '2026-09-01', '3', 'Tommy', 'Can', 'Frozen', '1up', '100', '163.4', '100', 0, 39, 0, 'G'),
(42, '2026-09-01', '2', 'ThawHtooZin', 'NY', 'Frozen', '6up', '80', '130.72', '100', 0, 47, 0, 'G'),
(43, '2026-09-01', '2', 'ThawHtooZin', 'NY', 'Frozen', '7up', '10', '16.34', '10', 0, 48, 0, 'G'),
(44, '2026-09-01', '5', 'Ko Myo', 'Can', 'Frozen', '1up', '85', '138.89', '100', 0, 49, 0, 'G'),
(46, '2026-09-02', '2', 'Ko Aung Naing', NULL, 'Frozen', '3up', '10', '16.34', '0', 0, 57, 0, '');

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
(1, '2026-09-02', '1', 'Mg Mg (TCL)', 'Daka', 'TCl', '5up', '75', '122.55', '100', 0, 50),
(5, '2026-09-02', '5', 'Ko Myo Naing', 'DAKA', 'TCl', '2up', '20', '32.68', '0', 0, 62);

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
(6, '2026-09-03', '3', '2', 'Can', 'frozen', '2up', 100, 100, '100', 100, '', 0, '', 0, '100', '', 'G'),
(7, '2026-09-03', '2', '8', 'NY', 'frozen', '6up', 100, 100, '100', 100, '', 0, '', 0, '100', '', 'G');

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
  `narration` text NOT NULL,
  `sr_no` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `general_ledger`
--

INSERT INTO `general_ledger` (`id`, `date`, `voucherno`, `ac_code`, `debit`, `credit`, `narration`, `sr_no`) VALUES
(89, '2026-09-01', '789', '5000', '2100000', '0', 'Purchase Line Item', 'PR-1788325799'),
(90, '2026-09-01', '789', '2000', '0', '2100000', 'Total Bill - Tommy', 'PR-1788325799'),
(102, '2026-09-02', '111', '2000', '1100000', '0', 'Payment to Tommy - Ref: 111', 'PAY-1788334254'),
(103, '2026-09-02', '111', '1501', '0', '1100000', 'Payment to Tommy - Ref: 111', 'PAY-1788334254'),
(104, '2026-09-03', '79878', '2000', '500000', '0', 'Payment to Tommy - Ref: 79878', 'PAY-1788334307'),
(105, '2026-09-03', '79878', '1501', '0', '500000', 'Payment to Tommy - Ref: 79878', 'PAY-1788334307'),
(106, '2026-09-04', '9898', '2000', '500000', '0', 'Payment to Tommy - Ref: 9898', 'PAY-1788334333'),
(107, '2026-09-04', '9898', '1501', '0', '500000', 'Payment to Tommy - Ref: 9898', 'PAY-1788334333'),
(108, '2026-09-01', '122', '5000', '2800000', '0', 'Purchase Line Item', 'PR-1788334509'),
(109, '2026-09-01', '122', '5000', '500000', '0', 'Purchase Line Item', 'PR-1788334509'),
(110, '2026-09-01', '122', '2000', '0', '3300000', 'Total Bill - ThawHtooZin', 'PR-1788334509'),
(111, '2026-09-01', '87', '5000', '2975000', '0', 'Purchase Line Item', 'PR-1788334684'),
(112, '2026-09-01', '87', '2000', '0', '2975000', 'Total Bill - Ko Myo', 'PR-1788334684'),
(113, '2026-09-01', '1165', '2000', '500000', '0', 'Payment to Ko Myo - Ref: 1165', 'PAY-1788334761'),
(114, '2026-09-01', '1165', '1501', '0', '500000', 'Payment to Ko Myo - Ref: 1165', 'PAY-1788334761'),
(115, '2026-09-02', '88', '2000', '475000', '0', 'Payment to Ko Myo - Ref: 88', 'PAY-1788334952'),
(116, '2026-09-02', '88', '1501', '0', '475000', 'Payment to Ko Myo - Ref: 88', 'PAY-1788334952'),
(117, '2026-09-02', '8844', '5000', '1875000', '0', 'Purchase Line Item', 'PR-1788336617'),
(118, '2026-09-02', '8844', '2000', '0', '1875000', 'Total Bill - Mg Mg (TCL)', 'PR-1788336617'),
(127, '2026-09-02', '12242', '5000', '210000', '0', 'Purchase Line Item', 'PR-1788339402'),
(128, '2026-09-02', '12242', '2000', '0', '210000', 'Total Bill - Ko Aung Naing', 'PR-1788339402'),
(129, '2026-09-02', '1166', '2000', '100000', '0', 'Payment to Ko Aung Naing - Ref: 1166', 'PAY-1788339437'),
(130, '2026-09-02', '1166', '1501', '0', '100000', 'Payment to Ko Aung Naing - Ref: 1166', 'PAY-1788339437'),
(137, '2026-09-02', '12254', '5000', '400000', '0', 'Purchase Line Item', 'PR-1788410192'),
(138, '2026-09-02', '12254', '2000', '0', '400000', 'Total Bill - Ko Myo Naing', 'PR-1788410192');

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
(5, '2026-09-01', 'balance', 100, 100, '21', '21', '3', 63, 63, ''),
(6, '2026-09-02', 'import', 20, 120, '21', '42', '3', 126, 0, ''),
(7, '2026-09-02', 'import', 0, 120, '2', '44', '3', 132, 195, ''),
(8, '2026-09-02', 'takeout', 10, 110, '21', '23', '3', 0, 0, ''),
(12, '2026-09-03', 'import', 20, 130, '50', '73', '3', 219, 0, ''),
(13, '2026-09-03', 'export', 30, 100, '20', '53', '3', 0, 0, ''),
(14, '2026-09-03', 'import', 10, 110, '10', '63', '3', 189, 384, '');

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
(3, '2026-09-02', 'import', '21', '5', 105, 105, ''),
(4, '2026-09-02', 'takeout', '21', '5', 105, 210, ''),
(8, '2026-09-03', 'import', '50', '5', 250, 460, ''),
(9, '2026-09-03', 'export', '20', '5', 100, 560, ''),
(10, '2026-09-03', 'import', '10', '5', 50, 610, '');

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
(1, 'Can', 'HHK To GFC', '2026-09-03', '2', '6up', '27', 30, 30, 'G', '', '', '', '', '', '', '', 6),
(2, 'NY', 'HHK To GFC', '2026-09-04', '3', '6up', '21', 5, 5, 'G', '', '', '', '', '', '', '', 7);

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
(3, 'Can', 'From Form-10', '2026-09-03', '3', '2up', '26', 50, 50, '', '', 0, '', '', 0, '', 'G'),
(4, 'Can', 'From Form-10', '2026-09-03', '2', '6up', '27', 100, 100, '', '', 0, '', '', 0, '', 'G'),
(5, 'NY', 'From Form-10', '2026-09-03', '3', '6up', '21', 10, 10, '', '', 0, '', '', 0, '', 'G'),
(6, 'Can', 'HHK To GFC', '2026-09-03', '2', '6up', '27', 30, 70, '', '', 0, '', '', 0, '', 'G'),
(7, 'NY', 'HHK To GFC', '2026-09-04', '3', '6up', '21', 5, 5, '', '', 0, '', '', 0, '', 'G');

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
(2, '2026-09-01', '0000-00-00', '3', 150, 150, '350', '350', '300', '360', 120, 0),
(3, '2026-09-01', '2026-09-03', '3', 20, 130, '60', '290', '60', '', NULL, 1);

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
(3, '3', '2up', '21', '12000', '7343.941248', '20', '6119.951040', '1.359989120', '0.22', '1200', '1200', '1200', '1200', '4801.579989', '', '', '', '', '100833.1797', 3, 4),
(4, '3', '3up', '23', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 5),
(5, '2', '6up', '25', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 6),
(6, '2', '7up', '23', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 7);

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
-- Table structure for table `manual_journals`
--

CREATE TABLE `manual_journals` (
  `id` int(11) NOT NULL,
  `journal_date` date NOT NULL,
  `narration` varchar(255) NOT NULL,
  `status` enum('DRAFT','POSTED','VOIDED') DEFAULT 'DRAFT',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manual_journal_lines`
--

CREATE TABLE `manual_journal_lines` (
  `id` int(11) NOT NULL,
  `journal_id` int(11) NOT NULL,
  `account_code` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `debit` decimal(15,2) DEFAULT 0.00,
  `credit` decimal(15,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

--
-- Dumping data for table `material_store_house`
--

INSERT INTO `material_store_house` (`id`, `date`, `time`, `voucher_no`, `description`, `supplier_id`, `material_id`, `in_quantity`, `out_quantity`, `output_group`, `action`) VALUES
(1, '2026-08-08', '10:27:20', 'Dr 24/Feb111', '', '2', 4, 20, NULL, NULL, ''),
(2, '2026-08-08', '10:32:56', 'SV-001', '', '2', 4, 20, NULL, NULL, ''),
(5, '2026-08-10', '12:30:52', '123123', '', '6', 4, 20, NULL, NULL, '');

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

--
-- Dumping data for table `packingliststock`
--

INSERT INTO `packingliststock` (`id`, `date`, `customer_id`, `country`, `invoiceno`, `containerno`, `vessel_name`, `voyname`, `fda`) VALUES
(3, '2026-09-01', '7', 'Can', '2026001', 'PPN001', 'Blank', 'Test', '09420494');

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

--
-- Dumping data for table `packingliststockinfo`
--

INSERT INTO `packingliststockinfo` (`id`, `commondity_id`, `size`, `packingkgperbox`, `mc`, `totalnetweight`, `totalgrossweight`, `usd`, `total_usd`, `infoid`) VALUES
(2, '1', '1up', 100, 2, 200, '202', '', '', 2),
(3, '1', '5up', 20, 8, 160, '168', '', '', 2),
(4, '3', '2up', 21, 10, 210, '220', '', '', 3),
(5, '3', '3up', 23, 10, 230, '240', '', '', 3),
(6, '2', '6up', 25, 20, 500, '520', '', '', 3),
(7, '2', '7up', 23, 8, 184, '192', '', '', 3);

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

--
-- Dumping data for table `packingmaterial`
--

INSERT INTO `packingmaterial` (`id`, `commondity_id`, `fish_size`, `plastic`, `jcv`, `inner_box`, `sticker`, `mc_plastic`, `carton_box`, `tape`, `penon`, `p_sticker`, `plastic_rope`, `micellion`, `processing`, `total`, `perkgcost`, `plastic_size`, `pcsperlb`, `pcspermc`, `link_id`, `infoid`) VALUES
(4, '3', '2up', '5', '66.66666666', '100', '500', '1', '5', 0, 5, 5, '0.071428571', 100, 100, 888, '0.22', '100', 100, 100, 4, 3),
(5, '3', '3up', '5', '75', '100', '600', '1', '6', 0, 6, 5, '0.072857142', 120, 120, 1038, '0.23', '12', 120, 120, 5, 3),
(6, '2', '6up', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 0, '', '', 0, 0, 6, 3),
(7, '2', '7up', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 0, '', '', 0, 0, 7, 3);

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
(1, 1, 'manage_accounts,manage_role,manage_sale,manage_purchase,manage_acpayable,manage_accountreceivable,manage_general_ledger,manage_contacts,manage_products,manage_product_types,manage_currency,manage_coa,manage_coldstoreitem,manage_coldstorecharges,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport,manage_shippmentexport,manage_truckexport,sale_report,purchase_report,payable_report,manage_mcreport,manage_tclmcstock,manage_generalledger,manage_material_purchase,material_store_house,material_gatepass,configuration_coldstore,packing_material_report,temp_pm_stock,profit_loss_report,manage_manual_journals'),
(2, 2, ',manage_products,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_mcreport,manage_tclmcstock'),
(3, 3, ',manage_coldstoreitem,manage_coldstorecharges,manage_shippmentexport,manage_truckexport'),
(4, 4, ',manage_purchase,manage_cashbook,manage_acpayable,manage_accountreceivable,manage_transaction,manage_general_ledger,manage_contacts,manage_coldstoreitem,manage_products,manage_coa,manage_unit,manage_coldstorecharges,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport,manage_shippmentexport,manage_truckexport,manage_packingmaterial,sale_report,purchase_report,payable_report,manage_mcreport,manage_tclmcstock,profit_loss_report,manage_manual_journals'),
(5, 5, ',manage_coldstoreitem,manage_coldstorecharges'),
(6, 6, ',manage_stockreport,sale_report,purchase_report,payable_report,manage_mcreport,manage_generalledger,packing_material_report,profit_loss_report');

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

--
-- Dumping data for table `processing`
--

INSERT INTO `processing` (`id`, `indate`, `outdate`, `commondity_id`, `mc`, `total_mc`, `kg`, `total_kg`, `rate`, `charges`, `total_charges`) VALUES
(1, '2026-09-01', '2026-09-03', '3', 20, 20, '60', '60', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `is_purchased` tinyint(1) NOT NULL DEFAULT 0,
  `purchase_account` varchar(50) DEFAULT NULL,
  `is_sold` tinyint(1) NOT NULL DEFAULT 0,
  `sales_account` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `code`, `name`, `description`, `type_id`, `unit`, `is_purchased`, `purchase_account`, `is_sold`, `sales_account`) VALUES
(1, 'h001', 'HILSA', 'Fish here can be tested anytime', 1, '', 1, '5000', 1, '200'),
(2, 'r001', 'rohu', 'This fish is rly good taste ngl', 1, '', 1, '5000', 1, '200'),
(3, 'bbb01', 'Boal', '', 1, '', 1, '', 0, NULL),
(4, 'MT001', 'Cotton Box', 'Cotton box for packaging MC', 2, '', 1, '5001', 1, '200'),
(5, 'M001', 'Marigal', '', 1, '', 1, '', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `product_types`
--

CREATE TABLE `product_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rate` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_types`
--

INSERT INTO `product_types` (`id`, `name`, `rate`) VALUES
(1, 'Fish', 3),
(2, 'Packing Material', 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `voucher_no` varchar(255) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `tclfrozen` varchar(20) NOT NULL DEFAULT 'Frozen',
  `due_date` date DEFAULT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'MMK',
  `exchange_rate` decimal(15,4) NOT NULL DEFAULT 1.0000,
  `status` enum('DRAFT','AWAITING_APPROVAL','AWAITING_PAYMENT','PAID','VOIDED') DEFAULT 'DRAFT',
  `subtotal` decimal(15,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(15,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `voucher_no`, `contact_id`, `date`, `tclfrozen`, `due_date`, `currency`, `exchange_rate`, `status`, `subtotal`, `grand_total`, `paid_amount`, `created_at`) VALUES
(15, '789', 2, '2026-09-01', 'Frozen', NULL, 'MMK', 1.0000, 'PAID', 2100000.00, 2100000.00, 2100000.00, '2026-09-02 05:09:44'),
(16, '122', 8, '2026-09-01', 'Frozen', NULL, 'MMK', 1.0000, 'AWAITING_PAYMENT', 3300000.00, 3300000.00, 0.00, '2026-09-02 05:11:16'),
(18, '87', 3, '2026-09-01', 'Frozen', NULL, 'MMK', 1.0000, 'AWAITING_PAYMENT', 2975000.00, 2975000.00, 975000.00, '2026-09-02 07:38:04'),
(19, '8844', 9, '2026-09-02', 'tcl', NULL, 'MMK', 1.0000, 'AWAITING_PAYMENT', 1875000.00, 1875000.00, 0.00, '2026-09-02 08:10:17'),
(21, '12254', 4, '2026-09-02', 'tcl', NULL, 'MMK', 1.0000, 'AWAITING_PAYMENT', 400000.00, 400000.00, 0.00, '2026-09-02 08:52:59'),
(22, '12242', 5, '2026-09-02', 'Frozen', NULL, 'MMK', 1.0000, 'AWAITING_PAYMENT', 210000.00, 210000.00, 100000.00, '2026-09-02 08:56:15'),
(25, '12287', 6, '2026-09-02', 'Frozen', NULL, 'MMK', 1.0000, 'VOIDED', 600000.00, 600000.00, 0.00, '2026-09-02 09:01:01');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `size` varchar(50) NOT NULL,
  `viss` decimal(10,2) NOT NULL DEFAULT 0.00,
  `pcs` int(11) NOT NULL DEFAULT 0,
  `unit_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `line_amount` decimal(15,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `purchase_id`, `product_id`, `account_id`, `description`, `size`, `viss`, `pcs`, `unit_price`, `line_amount`) VALUES
(39, 15, 3, 5000, '', '1up', 100.00, 100, 21000.00, 2100000.00),
(47, 16, 2, 5000, '', '6up', 80.00, 100, 35000.00, 2800000.00),
(48, 16, 2, 5000, '', '7up', 10.00, 10, 50000.00, 500000.00),
(49, 18, 5, 5000, '', '1up', 85.00, 100, 35000.00, 2975000.00),
(50, 19, 1, 5000, '', '5up', 75.00, 100, 25000.00, 1875000.00),
(57, 22, 2, 5000, '', '3up', 10.00, 0, 21000.00, 210000.00),
(61, 25, 3, 5000, '', '2up', 30.00, 0, 20000.00, 600000.00),
(62, 21, 5, 5000, '', '2up', 20.00, 0, 20000.00, 400000.00);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_payments`
--

CREATE TABLE `purchase_payments` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_account` varchar(50) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_payments`
--

INSERT INTO `purchase_payments` (`id`, `purchase_id`, `payment_date`, `payment_account`, `reference`, `amount`, `created_at`) VALUES
(9, 15, '2026-09-02', '1501', '111', 1100000.00, '2026-09-02 07:30:54'),
(10, 15, '2026-09-03', '1501', '79878', 500000.00, '2026-09-02 07:31:47'),
(11, 15, '2026-09-04', '1501', '9898', 500000.00, '2026-09-02 07:32:13'),
(12, 18, '2026-09-01', '1501', '1165', 500000.00, '2026-09-02 07:39:21'),
(13, 18, '2026-09-02', '1501', '88', 475000.00, '2026-09-02 07:42:32'),
(14, 22, '2026-09-02', '1501', '1166', 100000.00, '2026-09-02 08:57:17');

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
(5, 'Coldstore'),
(6, 'Visitor');

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
-- Table structure for table `system_currencies`
--

CREATE TABLE `system_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_currencies`
--

INSERT INTO `system_currencies` (`id`, `code`, `name`) VALUES
(1, 'USD', 'US Dollar');

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

--
-- Dumping data for table `total_charges`
--

INSERT INTO `total_charges` (`id`, `date`, `commondity_id`, `total_coldstore_charges`, `total_labour_charges`, `total_processing_charges`, `repacking_charges`, `ice_charges`, `ot_charges`, `extra_charges`, `total_charges`, `grand_total_charges`, `payment_date`, `payment_amount`, `balance_amount`, `remark`, `link_id`) VALUES
(1, '2026-09-03', 3, 540, 0, 0, 0, 0, 0, 0, 540, 540, '0000-00-00', 0, 540, '', 1);

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

--
-- Dumping data for table `truckactualinvoice`
--

INSERT INTO `truckactualinvoice` (`id`, `item_id`, `size`, `pcsperbox`, `kgperbox`, `mc`, `netweight`, `usd`, `total_usd`, `invoice_no`, `link_id`) VALUES
(2, '2', '2up', 20, 26, 20, 520, 0, 0, '221', 2);

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

--
-- Dumping data for table `truckdeclare`
--

INSERT INTO `truckdeclare` (`id`, `item_id`, `size`, `pcsperbox`, `kgperbox`, `mc`, `netweight`, `invoice_no`, `link_id`) VALUES
(2, '2', '2up', 20, 0, 20, 0, '221', 2);

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
(2, '2', '2up', 20, 26, 20, 520, '', '', '221', 2);

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
(1, '2026-09-01', '221', '22231');

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
(2, '2', '2up', 20, 26, 20, 520, 1200, '221');

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

--
-- Dumping data for table `trucktotalcosting`
--

INSERT INTO `trucktotalcosting` (`id`, `date`, `item_id`, `size`, `total_kg`, `priceperviss`, `priceperkg`, `percentage`, `packing_charges`, `mtorst`, `ygntomtorst_charges`, `mtorsttotechnck_charges`, `labour_charges`, `packingandtransport`, `total`, `grand_total`, `rate`, `costing_usd`, `selling_rate`, `profitperkg`, `original_cost`, `selling_amount`, `profit`, `invoice_no`, `link_id`, `infoid`) VALUES
(1, '0000-00-00', '', '2up', 210, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '221', 1, 1),
(2, '0000-00-00', '', '2up', 520, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '221', 2, 1);

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
(870, '10:40:59.000000', '2026-06-22', 'admin@gmail.com', 'protechadmin', 'Login Failed'),
(871, '10:41:02.000000', '2026-06-22', 'admin@gmail.com', 'password', 'Login Failed'),
(872, '10:41:15.000000', '2026-06-22', 'admin@gmail.com', 'protechadmin', 'Login Failed'),
(873, '10:41:23.000000', '2026-06-22', 'Administrator', 'protechadmin2024***', 'Login Success'),
(874, '08:48:10.000000', '2026-06-25', 'Administrator', '', 'Logout Success'),
(875, '12:57:23.000000', '2026-06-29', 'Administrator', 'protechadmin2024***', 'Login Success'),
(876, '03:30:48.000000', '2026-07-02', 'Administrator', '', 'Logout Success'),
(877, '03:30:56.000000', '2026-07-02', 'UMyoWinSwe', 'password', 'Login Success'),
(878, '03:31:05.000000', '2026-07-02', 'UMyoWinSwe', '', 'Logout Success'),
(879, '03:31:06.000000', '2026-07-02', 'Administrator', 'protechadmin2024***', 'Login Success'),
(880, '03:31:39.000000', '2026-07-02', 'Administrator', '', 'Logout Success'),
(881, '03:31:46.000000', '2026-07-02', 'Administrator', 'protechadmin2024***', 'Login Success'),
(882, '03:31:57.000000', '2026-07-02', 'Administrator', '', 'Logout Success'),
(883, '03:32:04.000000', '2026-07-02', 'UMyoWinSwe', 'password', 'Login Success'),
(884, '03:35:52.000000', '2026-07-02', 'UMyoWinSwe', '', 'Logout Success'),
(885, '03:35:53.000000', '2026-07-02', 'Administrator', 'protechadmin2024***', 'Login Success'),
(886, '02:02:45.000000', '2026-08-11', 'Administrator', '', 'Logout Success'),
(887, '02:02:49.000000', '2026-08-11', 'Administrator', 'protechadmin2024***', 'Login Success'),
(888, '05:26:32.000000', '2026-08-24', 'Administrator', '', 'Logout Success'),
(889, '05:26:49.000000', '2026-08-24', 'UMyoWinSwe', 'password', 'Login Success'),
(890, '05:27:06.000000', '2026-08-24', 'UMyoWinSwe', '', 'Logout Success'),
(891, '05:27:08.000000', '2026-08-24', 'Administrator', 'protechadmin2024***', 'Login Success'),
(892, '10:00:01.000000', '2026-09-03', 'Administrator', '', 'Logout Success'),
(893, '10:00:32.000000', '2026-09-03', 'Administrator', 'protechadmin2024***', 'Login Success'),
(894, '10:33:05.000000', '2026-09-03', 'Administrator', '', 'Logout Success'),
(895, '10:33:07.000000', '2026-09-03', 'admin@gmail.com', 'admin', 'Login Failed'),
(896, '10:33:11.000000', '2026-09-03', 'Administrator', 'protechadmin2024***', 'Login Success'),
(897, '10:33:50.000000', '2026-09-03', 'Administrator', '', 'Logout Success'),
(898, '10:33:55.000000', '2026-09-03', 'Administrator', 'protechadmin2024***', 'Login Success'),
(899, '11:21:29.000000', '2026-09-03', 'Administrator', '', 'Logout Success'),
(900, '11:23:55.000000', '2026-09-03', 'admin@gmail.com', 'admin', 'Login Failed'),
(901, '11:23:56.000000', '2026-09-03', 'admin@gmail.com', 'admin', 'Login Failed'),
(902, '11:23:59.000000', '2026-09-03', 'Administrator', 'protechadmin2024***', 'Login Success'),
(903, '11:24:01.000000', '2026-09-03', 'Administrator', '', 'Logout Success'),
(904, '11:24:04.000000', '2026-09-03', 'admin@gmail.com', 'admin', 'Login Failed'),
(905, '11:24:04.000000', '2026-09-03', 'admin@gmail.com', 'admin', 'Login Failed'),
(906, '11:24:12.000000', '2026-09-03', 'Administrator', 'protechadmin2', 'Login Password Invalid'),
(907, '11:24:13.000000', '2026-09-03', 'admin@gmail.com', 'admin', 'Login Failed'),
(908, '11:24:26.000000', '2026-09-03', 'Administrator', 'protechadmin2024***', 'Login Success');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accodes`
--
ALTER TABLE `accodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `actualinvoice`
--
ALTER TABLE `actualinvoice`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `container`
--
ALTER TABLE `container`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exchange_rates`
--
ALTER TABLE `exchange_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_rate_date` (`currency_code`,`effective_date`);

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
-- Indexes for table `labour`
--
ALTER TABLE `labour`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manual_journals`
--
ALTER TABLE `manual_journals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manual_journal_lines`
--
ALTER TABLE `manual_journal_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journal_id` (`journal_id`);

--
-- Indexes for table `material_purchase`
--
ALTER TABLE `material_purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material_store_house`
--
ALTER TABLE `material_store_house`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_product_code` (`code`);

--
-- Indexes for table `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_voucher` (`voucher_no`),
  ADD KEY `fk_purchases_contact` (`contact_id`);

--
-- Indexes for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pl_purchase` (`purchase_id`),
  ADD KEY `fk_pl_product` (`product_id`),
  ADD KEY `fk_pl_account` (`account_id`);

--
-- Indexes for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_payment_purchase` (`purchase_id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_currencies`
--
ALTER TABLE `system_currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_currency_code` (`code`);

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
-- AUTO_INCREMENT for table `accodes`
--
ALTER TABLE `accodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `actualinvoice`
--
ALTER TABLE `actualinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bankdetail`
--
ALTER TABLE `bankdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cashbook`
--
ALTER TABLE `cashbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coldstore`
--
ALTER TABLE `coldstore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `container`
--
ALTER TABLE `container`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exchange_rates`
--
ALTER TABLE `exchange_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `form7stock`
--
ALTER TABLE `form7stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `form7stocktcl`
--
ALTER TABLE `form7stocktcl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `form10stock`
--
ALTER TABLE `form10stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `form10stocktcl`
--
ALTER TABLE `form10stocktcl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `general_ledger`
--
ALTER TABLE `general_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `gfcfishlabour`
--
ALTER TABLE `gfcfishlabour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `gfcmcstock`
--
ALTER TABLE `gfcmcstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gfctotal`
--
ALTER TABLE `gfctotal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hhkmcstock`
--
ALTER TABLE `hhkmcstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hhkstock`
--
ALTER TABLE `hhkstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice_costing`
--
ALTER TABLE `invoice_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `labour`
--
ALTER TABLE `labour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manual_journals`
--
ALTER TABLE `manual_journals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `manual_journal_lines`
--
ALTER TABLE `manual_journal_lines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `material_purchase`
--
ALTER TABLE `material_purchase`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `material_store_house`
--
ALTER TABLE `material_store_house`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `packingliststockinfo`
--
ALTER TABLE `packingliststockinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `packingmaterial`
--
ALTER TABLE `packingmaterial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `processing`
--
ALTER TABLE `processing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_types`
--
ALTER TABLE `product_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `receivable`
--
ALTER TABLE `receivable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `repacking`
--
ALTER TABLE `repacking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `repackingout`
--
ALTER TABLE `repackingout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stock_output_group`
--
ALTER TABLE `stock_output_group`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_currencies`
--
ALTER TABLE `system_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tclmcstock`
--
ALTER TABLE `tclmcstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `total_charges`
--
ALTER TABLE `total_charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `truckactualinvoice`
--
ALTER TABLE `truckactualinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `truckdeclare`
--
ALTER TABLE `truckdeclare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `truckfoambox`
--
ALTER TABLE `truckfoambox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `truckpackingliststock`
--
ALTER TABLE `truckpackingliststock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `truckpackingliststockinfo`
--
ALTER TABLE `truckpackingliststockinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `truckpackingmaterial`
--
ALTER TABLE `truckpackingmaterial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trucktotalcosting`
--
ALTER TABLE `trucktotalcosting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `userlogs`
--
ALTER TABLE `userlogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=909;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `manual_journal_lines`
--
ALTER TABLE `manual_journal_lines`
  ADD CONSTRAINT `fk_journal_lines` FOREIGN KEY (`journal_id`) REFERENCES `manual_journals` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
