-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2021 at 12:12 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `futsal`
--

-- --------------------------------------------------------

--
-- Table structure for table `court`
--

CREATE DATABASE futsal;

CREATE TABLE `court` (
  `courtID` int(11) NOT NULL,
  `courtType` varchar(15) NOT NULL,
  `courtName` varchar(10) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(150) NOT NULL DEFAULT 'default.png',
  `courtStat` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `court`
--

INSERT INTO `court` (`courtID`, `courtType`, `courtName`, `price`, `image`, `courtStat`) VALUES
(1, 'Indoor Court', 'Court A', 103, 'default.png', 'Inactive'),
(2, 'Indoor Court', 'Court B', 80, 'default.png', 'Inactive'),
(4, 'Outdoor Court', 'Court A', 150, 'default.png', 'Active'),
(5, 'Outdoor Court', 'Court B', 111, 'default.png', 'Active'),
(6, 'Outdoor Court', 'Court C', 150, 'default.png', 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `itemID` int(11) NOT NULL,
  `itemType` varchar(15) NOT NULL,
  `itemName` varchar(10) NOT NULL,
  `price` double NOT NULL,
  `itemStat` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`itemID`, `itemType`, `itemName`, `price`, `itemStat`) VALUES
(1, 'Badminton', 'Racquet', 5, 'active'),
(2, 'Tennis', 'Ball', 6, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `fullname` varchar(50) NOT NULL,
  `username` varchar(10) NOT NULL,
  `phoneNo` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `usertype` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`fullname`, `username`, `phoneNo`, `email`, `password`, `usertype`) VALUES
('Amira Atikah', 'amira', '01112152923', 'amira@utm.my', '1234567890', 0),
('Afiqah Zaini', 'nafiqah237', '0199023149', 'afqhzni@gmail.com', '1234567890', 0),
('Akilah Nazifa', 'nazifa24', '0123456789', 'nazifanshr@gmail.com', '1234567890', 0),
('Aiman', 'aiman12', '0199023149', 'aiman12@gmail.com', '1234567890', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `court`
--
ALTER TABLE `court`
  ADD PRIMARY KEY (`courtID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `court`
--
ALTER TABLE `court`
  MODIFY `courtID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
