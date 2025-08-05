-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2025 at 08:09 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_number` char(5) DEFAULT NULL,
  `branch_name` varchar(16) DEFAULT NULL,
  `balance` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_number`, `branch_name`, `balance`) VALUES
('A-101', 'Downtown', 500),
('A-102', 'Perryridge', 400),
('A-201', 'Brighton', 900),
('A-215', 'Mianus', 700),
('A-217', 'Brighton', 750),
('A-222', 'Redwood', 700),
('A-305', 'Round Hill', 350);

-- --------------------------------------------------------

--
-- Table structure for table `borrower`
--

CREATE TABLE `borrower` (
  `customer_name` varchar(16) DEFAULT NULL,
  `loan_number` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrower`
--

INSERT INTO `borrower` (`customer_name`, `loan_number`) VALUES
('Adams', 'L-16'),
('Curry', 'L-93'),
('Hayes', 'L-15'),
('Johnson', 'L-14'),
('Jones', 'L-17'),
('Smith', 'L-11'),
('Smith', 'L-23'),
('Williams', 'L-17');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_name` varchar(16) DEFAULT NULL,
  `branch_city` varchar(16) DEFAULT NULL,
  `assets` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_name`, `branch_city`, `assets`) VALUES
('Brighton', 'Brooklyn', 7100000),
('Downtown', 'Brooklyn', 9000000),
('Mianus', 'Horseneck', 400000),
('North Town', 'Rye', 3700000),
('Perryridge', 'Horseneck', 1700000),
('Pownal', 'Bennington', 300000),
('Redwood', 'Palo Alto', 2100000),
('Round Hill', 'Horseneck', 8000000);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_name` varchar(16) DEFAULT NULL,
  `customer_street` varchar(32) DEFAULT NULL,
  `customer_city` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_name`, `customer_street`, `customer_city`) VALUES
('Adams', 'Spring', 'Pittsfield'),
('Brooks', 'Senator', 'Brooklyn'),
('Curry', 'North', 'Rye'),
('Glenn', 'Sand Hill', 'Woodside'),
('Green', 'Walnut', 'Stamford'),
('Hayes', 'Main', 'Harrison'),
('Johnson', 'Alma', 'Palo Alto'),
('Jones', 'Main', 'Harrison'),
('Lindsay', 'Park', 'Pittsfield'),
('Smith', 'North', 'Rye'),
('Turner', 'Putnam', 'Stamford'),
('Williams', 'Nassau', 'Princeton');

-- --------------------------------------------------------

--
-- Table structure for table `depositor`
--

CREATE TABLE `depositor` (
  `customer_name` varchar(16) DEFAULT NULL,
  `account_number` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `depositor`
--

INSERT INTO `depositor` (`customer_name`, `account_number`) VALUES
('Hayes', 'A-102'),
('Johnson', 'A-101'),
('Johnson', 'A-201'),
('Jones', 'A-217'),
('Lindsay', 'A-222'),
('Smith', 'A-215'),
('Turner', 'A-305');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loan_number` char(5) DEFAULT NULL,
  `branch_name` varchar(16) DEFAULT NULL,
  `amount` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loan_number`, `branch_name`, `amount`) VALUES
('L-11', 'Round Hill', 900),
('L-14', 'Downtown', 1500),
('L-15', 'Perryridge', 1500),
('L-16', 'Perryridge', 1300),
('L-17', 'Downtown', 1000),
('L-23', 'Redwoord', 2000),
('L-93', 'Mianus', 500);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
