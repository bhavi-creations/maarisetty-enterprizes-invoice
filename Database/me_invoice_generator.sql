-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2024 at 01:21 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `me_invoice_generator`
--

-- --------------------------------------------------------

--
-- Table structure for table `advancehistory`
--

CREATE TABLE `advancehistory` (
  `id` int(11) NOT NULL,
  `Invoice_no` int(150) NOT NULL,
  `Date` date NOT NULL,
  `advance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advancehistory`
--

INSERT INTO `advancehistory` (`id`, `Invoice_no`, `Date`, `advance`) VALUES
(1, 116, '2024-01-13', 500),
(2, 118, '2024-01-13', 50),
(3, 0, '2024-01-19', 500),
(4, 121, '2024-01-13', 786),
(5, 47, '2024-01-13', 500),
(6, 19, '2024-01-13', 5),
(7, 19, '2024-01-13', 5),
(8, 49, '2024-01-17', 500),
(9, 49, '2024-01-17', 500),
(10, 49, '2024-01-17', 250),
(11, 51, '2024-01-23', 0),
(12, 53, '1970-01-01', 200),
(13, 54, '1970-01-01', 50),
(14, 55, '2024-01-11', 50),
(15, 19, '2024-01-31', 5),
(16, 19, '2024-01-31', 5),
(17, 19, '2024-01-31', 8),
(18, 1, '2024-02-16', 500),
(19, 1, '2024-02-01', 500),
(20, 1, '2024-02-01', 500),
(21, 1, '2024-02-01', 500),
(22, 1, '2024-02-01', 500),
(23, 1, '2024-02-01', 500),
(24, 1, '2024-02-01', 500),
(25, 1, '1970-01-01', 500),
(26, 1, '1970-01-01', 500),
(27, 1, '2024-02-01', 500),
(28, 1, '2024-02-01', 500),
(29, 1, '2024-02-01', 500),
(30, 1, '2024-02-01', 500),
(31, 1, '2024-02-01', 500),
(32, 0, '0000-00-00', 0),
(33, 0, '0000-00-00', 0),
(34, 1, '2024-02-02', 500),
(35, 1, '2024-02-02', 500),
(36, 1, '2024-02-15', 500),
(37, 1, '2024-02-15', 500),
(38, 1, '2024-02-15', 500),
(39, 1, '2024-02-15', 500),
(40, 1, '2024-02-01', 500),
(41, 2, '2024-02-01', 100),
(42, 3, '2024-02-01', 0),
(43, 4, '2024-02-23', 500),
(44, 5, '2024-02-23', 500),
(45, 5, '2024-02-23', 500),
(46, 5, '2024-02-23', 500),
(47, 5, '2024-02-23', 500),
(48, 6, '2024-02-23', 0),
(49, 6, '2024-02-23', 0),
(50, 7, '1970-01-01', 100),
(51, 8, '1970-01-01', 0),
(52, 8, '1970-01-01', 0),
(53, 8, '1970-01-01', 0),
(54, 8, '1970-01-01', 0),
(55, 8, '1970-01-01', 0),
(56, 9, '1970-01-01', 0),
(57, 10, '2024-02-01', 100),
(58, 1, '2024-02-01', 500),
(59, 2, '2024-02-02', 100),
(60, 1, '2024-02-02', 500),
(61, 1, '2024-02-02', 500),
(62, 1, '2024-02-02', 500),
(63, 2, '2024-02-02', 100),
(64, 3, '2024-02-02', 100),
(65, 5, '2024-02-03', 500);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Id` int(11) NOT NULL,
  `Company_name` varchar(150) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Address` text NOT NULL,
  `Gst_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Id`, `Company_name`, `Name`, `Phone`, `Email`, `Address`, `Gst_no`) VALUES
(2, 'abhinaya', 'raj kumar', '07498188555', 'raj@gmail.com', '5-155 ysr colony madhavapatnam eg dist kakinada ap india 533005', '38GN58POMVDJGJG'),
(3, 'Bhavi Creations', 'Rajkumar Giduthuri', '09848012555', 'ram@gmail.com', 'kakinada', 'EWQRWEREW'),
(4, 'smart physiocare', 'pawan', '7730000000000', 'phanichalikonda@gmail.com', 'apsp', '2245452JNDKLWSAFC'),
(5, 'smart physiocare', 'pawan', '7730000000000', '', 'apsp', ''),
(6, 'Bhavi Creations', 'Rajkumar Giduthuri', '09848012555', 'ram@gmail.com', 'KKD', '37AN89852'),
(11, 'smart physiocare', 'pawan', '7730000000000', 'phanichalikonda@gmail.com', 'apsp', '');

-- --------------------------------------------------------

--
-- Table structure for table `expenditure_desc_tbl`
--

CREATE TABLE `expenditure_desc_tbl` (
  `id` int(11) NOT NULL,
  `main_expenditure_id` int(11) NOT NULL,
  `exp_name` varchar(255) NOT NULL,
  `exp_description` text NOT NULL,
  `mode_payment` text NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenditure_desc_tbl`
--

INSERT INTO `expenditure_desc_tbl` (`id`, `main_expenditure_id`, `exp_name`, `exp_description`, `mode_payment`, `amount`) VALUES
(1, 1, 'Rajkumar Giduthuri', 'asdsad', 'Phone-pay', 50),
(2, 1, 'Rajkumar Giduthuri', 'sadsad', 'Google-pay', 50),
(3, 3, 'Rajkumar Giduthuri', 'asdsads', 'select', 50);

-- --------------------------------------------------------

--
-- Table structure for table `expenditure_tbl`
--

CREATE TABLE `expenditure_tbl` (
  `id` int(11) NOT NULL,
  `total_amount` int(225) NOT NULL,
  `amount_in_words` text NOT NULL,
  `exp_note` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_name`
--

CREATE TABLE `exp_name` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exp_name`
--

INSERT INTO `exp_name` (`id`, `name`, `address`, `phone`) VALUES
(1, 'Rajkumar Giduthuri', 'KITS college, Ramachandrapuram.', '07981885538');

-- --------------------------------------------------------

--
-- Table structure for table `exp_type`
--

CREATE TABLE `exp_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exp_type`
--

INSERT INTO `exp_type` (`id`, `name`) VALUES
(1, 'BOOKS'),
(2, 'Printing');

-- --------------------------------------------------------

--
-- Table structure for table `gst_no`
--

CREATE TABLE `gst_no` (
  `si_No` int(11) NOT NULL,
  `gst` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gst_no`
--

INSERT INTO `gst_no` (`si_No`, `gst`) VALUES
(1, 0),
(2, 5),
(3, 12),
(4, 18);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `Sid` int(11) NOT NULL,
  `Invoice_no` int(11) NOT NULL,
  `Invoice_date` date NOT NULL,
  `Company_name` varchar(150) NOT NULL,
  `Cname` varchar(50) NOT NULL,
  `Cphone` varchar(150) NOT NULL,
  `Caddress` text NOT NULL,
  `Cmail` varchar(150) NOT NULL,
  `Cgst` varchar(150) NOT NULL,
  `total_amount` double(10,2) NOT NULL,
  `total_taxable_value` double(10,2) NOT NULL,
  `total_value` double(10,2) NOT NULL,
  `c_gst` int(20) NOT NULL,
  `s_gst` int(11) NOT NULL,
  `i_gst` int(11) NOT NULL,
  `cgst_total` double(10,2) NOT NULL,
  `sgst_total` double(10,2) NOT NULL,
  `igst_total` double(10,2) NOT NULL,
  `total_tax_amount` double(10,2) NOT NULL,
  `total_amount_after_tax` double(10,2) NOT NULL,
  `Totalinwords` text NOT NULL,
  `Terms` text NOT NULL,
  `Note` text NOT NULL,
  `advance` double(10,2) NOT NULL,
  `balance` double(10,2) NOT NULL,
  `balancewords` text NOT NULL,
  `status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`Sid`, `Invoice_no`, `Invoice_date`, `Company_name`, `Cname`, `Cphone`, `Caddress`, `Cmail`, `Cgst`, `total_amount`, `total_taxable_value`, `total_value`, `c_gst`, `s_gst`, `i_gst`, `cgst_total`, `sgst_total`, `igst_total`, `total_tax_amount`, `total_amount_after_tax`, `Totalinwords`, `Terms`, `Note`, `advance`, `balance`, `balancewords`, `status`) VALUES
(7, 1, '2024-02-02', 'Bhavi Creations', 'Rajkumar Giduthuri', '09848012555', 'kakinada', 'ram@gmail.com', 'EWQRWEREW', 99600.00, 10202.00, 109802.00, 12, 18, 18, 11952.00, 17928.00, 17928.00, 47808.00, 147408.00, 'one lakh forty seven thousand four hundred and eight rupees only ', 'TEST raj', 'Raj TEST NOTE', 500.00, 146908.00, 'one lakh forty six thousand nine hundred and eight rupees only ', 'paid'),
(8, 2, '2024-02-02', 'smart physiocare', 'pawan', '7730000000000', 'apsp', 'phanichalikonda@gmail.com', '2245452JNDKLWSAFC', 8900.00, 0.00, 8900.00, 0, 0, 0, 1068.00, 1068.00, 1068.00, 3204.00, 8900.00, 'eight thousand nine hundred only ', '', '', 1100.00, 7800.00, 'seven thousand eight hundred only ', 'paid'),
(9, 3, '2024-02-02', 'smart physiocare', 'pawan', '7730000000000', 'apsp', 'phanichalikonda@gmail.com', '2245452JNDKLWSAFC', 8900.00, 0.00, 8900.00, 0, 0, 0, 1068.00, 1068.00, 1068.00, 3204.00, 8900.00, 'eight thousand nine hundred only ', '', '', 1100.00, 7800.00, 'seven thousand eight hundred only ', 'paid'),
(10, 4, '2024-02-02', 'Bhavi Creations', 'Rajkumar Giduthuri', '09848012555', 'kakinada', 'ram@gmail.com', 'EWQRWEREW', 3300.00, 396.00, 3696.00, 5, 5, 5, 165.00, 165.00, 165.00, 495.00, 3795.00, 'three thousand seven hundred and ninety five rupees only ', 'test term   ', 'test note', 500.00, 3295.00, 'three thousand two hundred and ninety five rupees only ', ''),
(11, 5, '2024-02-03', 'smart physiocare', 'pawan', '7730000000000', 'apsp', '', '', 52200.00, 6264.00, 58464.00, 12, 5, 5, 6264.00, 2610.00, 2610.00, 11484.00, 63684.00, 'sixty three thousand six hundred and eighty four rupees only ', 'test ', 'test', 500.00, 63184.00, 'sixty three thousand one hundred and eighty four rupees only ', ''),
(12, 6, '2024-02-02', 'smart physiocare', 'pawan', '7730000000000', 'apsp', 'phanichalikonda@gmail.com', '2245452JNDKLWSAFC', 8900.00, 0.00, 8900.00, 0, 0, 0, 1068.00, 1068.00, 1068.00, 3204.00, 8900.00, 'eight thousand nine hundred only ', '', '', 1000.00, 7900.00, 'seven thousand nine hundred only ', ' ');

-- --------------------------------------------------------

--
-- Table structure for table `lgtable`
--

CREATE TABLE `lgtable` (
  `Id` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lgtable`
--

INSERT INTO `lgtable` (`Id`, `email`, `password`) VALUES
(1, 'rajkumar16371@gmail.com', '6e46595a57e6d7219340d2c163273ab9'),
(3, 'bhavicreations', 'e10adc3949ba59abbe56e057f20f883e');

-- --------------------------------------------------------

--
-- Table structure for table `quotation`
--

CREATE TABLE `quotation` (
  `Sid` int(11) NOT NULL,
  `quotation_no` int(11) NOT NULL,
  `quotation_date` date NOT NULL,
  `Company_name` varchar(150) NOT NULL,
  `Cname` varchar(50) NOT NULL,
  `Cphone` varchar(150) NOT NULL,
  `Caddress` text NOT NULL,
  `Cmail` varchar(150) NOT NULL,
  `Cgst` varchar(150) NOT NULL,
  `total_amount` double(10,2) NOT NULL,
  `total_taxable_value` double(10,2) NOT NULL,
  `total_value` double(10,2) NOT NULL,
  `c_gst` int(20) NOT NULL,
  `s_gst` int(11) NOT NULL,
  `i_gst` int(11) NOT NULL,
  `cgst_total` double(10,2) NOT NULL,
  `sgst_total` double(10,2) NOT NULL,
  `igst_total` double(10,2) NOT NULL,
  `total_tax_amount` double(10,2) NOT NULL,
  `total_amount_after_tax` double(10,2) NOT NULL,
  `Totalinwords` text NOT NULL,
  `Terms` text NOT NULL,
  `Note` text NOT NULL,
  `advance` double(10,2) NOT NULL,
  `balance` double(10,2) NOT NULL,
  `balancewords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quotation`
--

INSERT INTO `quotation` (`Sid`, `quotation_no`, `quotation_date`, `Company_name`, `Cname`, `Cphone`, `Caddress`, `Cmail`, `Cgst`, `total_amount`, `total_taxable_value`, `total_value`, `c_gst`, `s_gst`, `i_gst`, `cgst_total`, `sgst_total`, `igst_total`, `total_tax_amount`, `total_amount_after_tax`, `Totalinwords`, `Terms`, `Note`, `advance`, `balance`, `balancewords`) VALUES
(2, 2, '2024-02-02', 'Bhavi Creations', 'Rajkumar Giduthuri', '09848012555', 'kakinada', 'ram@gmail.com', 'EWQRWEREW', 76600.00, 552.00, 77152.00, 5, 12, 18, 3830.00, 9192.00, 13788.00, 26810.00, 103410.00, 'one lakh three thousand four hundred and ten rupees only ', 'test term ', 'test note', 100.00, 103310.00, 'one lakh three thousand three hundred and ten rupees only '),
(3, 3, '2024-02-02', 'smart physiocare', 'pawan', '7730000000000', 'apsp', 'phanichalikonda@gmail.com', '2245452JNDKLWSAFC', 8900.00, 0.00, 8900.00, 0, 0, 0, 1068.00, 1068.00, 1068.00, 3204.00, 8900.00, 'eight thousand nine hundred only ', '', '', 1000.00, 7900.00, 'seven thousand nine hundred only ');

-- --------------------------------------------------------

--
-- Table structure for table `quservice`
--

CREATE TABLE `quservice` (
  `Id` int(11) NOT NULL,
  `Sid` int(11) NOT NULL,
  `description` text NOT NULL,
  `HSN` varchar(255) NOT NULL,
  `UOM` varchar(255) NOT NULL,
  `Qty` int(11) NOT NULL,
  `price` double(10,2) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `rate_of_tax` int(20) NOT NULL,
  `taxable_value` int(150) NOT NULL,
  `total_value_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quservice`
--

INSERT INTO `quservice` (`Id`, `Sid`, `description`, `HSN`, `UOM`, `Qty`, `price`, `amount`, `rate_of_tax`, `taxable_value`, `total_value_amount`) VALUES
(1, 1, 'sdfdsf', 'ci5', 'Bags', 4, 20.00, 80.00, 0, 0, 80),
(2, 2, 'raj', 'ci5', 'Bags', 30, 20.00, 600.00, 12, 72, 672),
(3, 2, 'ram', 'c14', 'Bags', 80, 50.00, 4000.00, 12, 480, 4480),
(4, 3, 'test', 'test1', 'Bags', 50, 50.00, 2500.00, 0, 0, 2500),
(5, 3, 'test', 'test2', 'Bags', 80, 80.00, 6400.00, 0, 0, 6400),
(6, 2, 'test', 'ci5', 'kgs', 90, 800.00, 72000.00, 0, 0, 72000);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `Id` int(11) NOT NULL,
  `Sid` int(11) NOT NULL,
  `description` text NOT NULL,
  `HSN` varchar(255) NOT NULL,
  `UOM` varchar(255) NOT NULL,
  `Qty` int(11) NOT NULL,
  `price` double(10,2) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `rate_of_tax` int(20) NOT NULL,
  `taxable_value` int(150) NOT NULL,
  `total_value_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`Id`, `Sid`, `description`, `HSN`, `UOM`, `Qty`, `price`, `amount`, `rate_of_tax`, `taxable_value`, `total_value_amount`) VALUES
(2, 2, 'raj', 'ci5', 'Bags', 90, 900.00, 800.00, 12, 96, 896),
(3, 2, 'ram', 'c14', 'Bags', 80, 800.00, 2500.00, 12, 300, 2800),
(7, 7, 'raj', 'ci6', 'Tins', 50, 50.00, 2500.00, 12, 300, 2800),
(8, 7, 'ram', 'ci6', 'kgs', 90, 90.00, 8100.00, 12, 972, 9072),
(9, 8, 'test', 'test1', 'Bags', 50, 50.00, 2500.00, 0, 0, 2500),
(10, 8, 'test', 'test2', 'Bags', 80, 80.00, 6400.00, 0, 0, 6400),
(11, 9, 'test', 'test1', 'Bags', 50, 50.00, 2500.00, 0, 0, 2500),
(12, 9, 'test', 'test2', 'Bags', 80, 80.00, 6400.00, 0, 0, 6400),
(13, 10, 'test', 'ci5', 'Bags', 40, 20.00, 800.00, 12, 96, 896),
(14, 10, 'test', 'c14', 'Bags', 50, 50.00, 2500.00, 12, 300, 2800),
(17, 7, 'test', 'ci6', 'Bags', 50, 500.00, 25000.00, 5, 1250, 26250),
(18, 7, 'test3', 'ci7', 'kgs', 80, 800.00, 64000.00, 12, 7680, 71680),
(19, 10, '0', '0', 'kgs', 0, 0.00, 0.00, 18, 0, 0),
(20, 11, 'test', '50', 'Bags', 50, 100.00, 5000.00, 12, 600, 5600),
(21, 11, 'test', '80', 'Bags', 80, 500.00, 40000.00, 12, 4800, 44800),
(22, 11, 'test2', '90', 'Tins', 80, 90.00, 7200.00, 12, 864, 8064),
(23, 12, 'test', 'test1', 'Bags', 50, 50.00, 2500.00, 0, 0, 2500),
(24, 12, 'test', 'test2', 'Bags', 80, 80.00, 6400.00, 0, 0, 6400),
(25, 2, 'test', 'ci6', 'kgs', 90, 9000.00, 810000.00, 18, 145800, 955800);

-- --------------------------------------------------------

--
-- Table structure for table `service_names`
--

CREATE TABLE `service_names` (
  `si_No` int(11) NOT NULL,
  `service_Name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_names`
--

INSERT INTO `service_names` (`si_No`, `service_Name`) VALUES
(1, 'Bags'),
(2, 'Tins'),
(3, 'kgs');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` int(11) NOT NULL,
  `stock_name` text NOT NULL,
  `stock_desc` text NOT NULL,
  `stock_qty` int(11) NOT NULL,
  `stock_details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advancehistory`
--
ALTER TABLE `advancehistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `expenditure_desc_tbl`
--
ALTER TABLE `expenditure_desc_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenditure_tbl`
--
ALTER TABLE `expenditure_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exp_name`
--
ALTER TABLE `exp_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exp_type`
--
ALTER TABLE `exp_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gst_no`
--
ALTER TABLE `gst_no`
  ADD PRIMARY KEY (`si_No`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`Sid`);

--
-- Indexes for table `lgtable`
--
ALTER TABLE `lgtable`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `quotation`
--
ALTER TABLE `quotation`
  ADD PRIMARY KEY (`Sid`);

--
-- Indexes for table `quservice`
--
ALTER TABLE `quservice`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `service_names`
--
ALTER TABLE `service_names`
  ADD PRIMARY KEY (`si_No`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advancehistory`
--
ALTER TABLE `advancehistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `expenditure_desc_tbl`
--
ALTER TABLE `expenditure_desc_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expenditure_tbl`
--
ALTER TABLE `expenditure_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_name`
--
ALTER TABLE `exp_name`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_type`
--
ALTER TABLE `exp_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gst_no`
--
ALTER TABLE `gst_no`
  MODIFY `si_No` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `Sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `lgtable`
--
ALTER TABLE `lgtable`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quotation`
--
ALTER TABLE `quotation`
  MODIFY `Sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quservice`
--
ALTER TABLE `quservice`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `service_names`
--
ALTER TABLE `service_names`
  MODIFY `si_No` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
