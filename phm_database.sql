-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2024 at 06:05 PM
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
-- Database: `phm_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `childeren`
--

CREATE TABLE `childeren` (
  `childid` int(11) NOT NULL,
  `familyid` int(11) NOT NULL,
  `motherid` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `birthweight` int(11) NOT NULL,
  `hasspecialneeds` tinyint(1) DEFAULT NULL,
  `specialeeds` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `development`
--

CREATE TABLE `development` (
  `childid` int(11) NOT NULL,
  `stageid` int(11) NOT NULL,
  `accomplisheddate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `developmentstages`
--

CREATE TABLE `developmentstages` (
  `stageid` int(11) NOT NULL,
  `stagename` varchar(100) NOT NULL,
  `expectedmothlow` int(11) NOT NULL,
  `expectedmothhigh` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eligibility_family`
--

CREATE TABLE `eligibility_family` (
  `familyid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `motherid` int(11) DEFAULT NULL,
  `noofchildren` int(11) NOT NULL DEFAULT 0,
  `address` varchar(255) NOT NULL,
  `other` varchar(500) DEFAULT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `growth`
--

CREATE TABLE `growth` (
  `childid` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `datemeasured` date NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mothers`
--

CREATE TABLE `mothers` (
  `motherid` int(11) NOT NULL,
  `familyid` int(11) NOT NULL,
  `firstame` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `agemarried` int(11) NOT NULL,
  `educationlevel` varchar(50) NOT NULL,
  `occupation` varchar(50) DEFAULT 'stay at home',
  `nicnumber` char(10) DEFAULT NULL,
  `phone` char(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pregnancies`
--

CREATE TABLE `pregnancies` (
  `pregnancyid` int(11) NOT NULL,
  `familyid` int(11) NOT NULL,
  `motherid` int(11) NOT NULL,
  `registereddate` date NOT NULL DEFAULT current_timestamp(),
  `lastmensus` date NOT NULL,
  `estageofpregancy` int(11) NOT NULL,
  `estdateofbirth` date NOT NULL,
  `dateadmitted` date DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `birthlocation` varchar(50) DEFAULT NULL,
  `outcome` varchar(20) DEFAULT NULL,
  `islivebirth` tinyint(1) DEFAULT NULL,
  `dateterminated` date DEFAULT NULL,
  `riskfactors` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `spouses`
--

CREATE TABLE `spouses` (
  `spouseid` int(11) NOT NULL,
  `familyid` int(11) NOT NULL,
  `firstame` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `educationlevel` varchar(50) NOT NULL,
  `occupation` varchar(50) DEFAULT 'stay at home',
  `nicnumber` char(10) DEFAULT NULL,
  `phone` char(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `threposhadist`
--

CREATE TABLE `threposhadist` (
  `rowid` int(11) NOT NULL,
  `childid` int(11) NOT NULL,
  `lotid` int(11) NOT NULL,
  `noofpackets` int(11) NOT NULL,
  `datereceived` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` char(10) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nicnumber` char(10) DEFAULT NULL,
  `dateregistered` date NOT NULL DEFAULT current_timestamp(),
  `isactive` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vaccinations`
--

CREATE TABLE `vaccinations` (
  `vaccinationid` int(11) NOT NULL,
  `childid` int(11) NOT NULL,
  `vaccineid` int(11) NOT NULL,
  `vialid` int(11) NOT NULL,
  `batchid` int(11) NOT NULL,
  `dategiven` date NOT NULL,
  `sideeffects` varchar(50) NOT NULL DEFAULT 'None'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vaccines`
--

CREATE TABLE `vaccines` (
  `vaccineid` int(11) NOT NULL,
  `vaccinename` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `childeren`
--
ALTER TABLE `childeren`
  ADD PRIMARY KEY (`childid`),
  ADD KEY `familyid` (`familyid`),
  ADD KEY `motherid` (`motherid`);

--
-- Indexes for table `development`
--
ALTER TABLE `development`
  ADD KEY `childid` (`childid`),
  ADD KEY `stageid` (`stageid`);

--
-- Indexes for table `developmentstages`
--
ALTER TABLE `developmentstages`
  ADD PRIMARY KEY (`stageid`);

--
-- Indexes for table `eligibility_family`
--
ALTER TABLE `eligibility_family`
  ADD PRIMARY KEY (`familyid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `motherid` (`motherid`);

--
-- Indexes for table `growth`
--
ALTER TABLE `growth`
  ADD KEY `childid` (`childid`);

--
-- Indexes for table `mothers`
--
ALTER TABLE `mothers`
  ADD PRIMARY KEY (`motherid`),
  ADD KEY `familyid` (`familyid`),
  ADD KEY `nicnumber` (`nicnumber`);

--
-- Indexes for table `pregnancies`
--
ALTER TABLE `pregnancies`
  ADD PRIMARY KEY (`pregnancyid`),
  ADD KEY `familyid` (`familyid`),
  ADD KEY `motherid` (`motherid`);

--
-- Indexes for table `spouses`
--
ALTER TABLE `spouses`
  ADD PRIMARY KEY (`spouseid`),
  ADD KEY `familyid` (`familyid`),
  ADD KEY `nicnumber` (`nicnumber`);

--
-- Indexes for table `threposhadist`
--
ALTER TABLE `threposhadist`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `childid` (`childid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `nicnumber` (`nicnumber`);

--
-- Indexes for table `vaccinations`
--
ALTER TABLE `vaccinations`
  ADD PRIMARY KEY (`vaccinationid`,`sideeffects`),
  ADD KEY `childid` (`childid`),
  ADD KEY `vaccineid` (`vaccineid`);

--
-- Indexes for table `vaccines`
--
ALTER TABLE `vaccines`
  ADD PRIMARY KEY (`vaccineid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `childeren`
--
ALTER TABLE `childeren`
  MODIFY `childid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `developmentstages`
--
ALTER TABLE `developmentstages`
  MODIFY `stageid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eligibility_family`
--
ALTER TABLE `eligibility_family`
  MODIFY `familyid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mothers`
--
ALTER TABLE `mothers`
  MODIFY `motherid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pregnancies`
--
ALTER TABLE `pregnancies`
  MODIFY `pregnancyid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `spouses`
--
ALTER TABLE `spouses`
  MODIFY `spouseid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `threposhadist`
--
ALTER TABLE `threposhadist`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vaccinations`
--
ALTER TABLE `vaccinations`
  MODIFY `vaccinationid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vaccines`
--
ALTER TABLE `vaccines`
  MODIFY `vaccineid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `childeren`
--
ALTER TABLE `childeren`
  ADD CONSTRAINT `childeren_ibfk_1` FOREIGN KEY (`familyid`) REFERENCES `eligibility_family` (`familyid`),
  ADD CONSTRAINT `childeren_ibfk_2` FOREIGN KEY (`motherid`) REFERENCES `mothers` (`motherid`);

--
-- Constraints for table `development`
--
ALTER TABLE `development`
  ADD CONSTRAINT `development_ibfk_1` FOREIGN KEY (`childid`) REFERENCES `childeren` (`childid`),
  ADD CONSTRAINT `development_ibfk_2` FOREIGN KEY (`stageid`) REFERENCES `developmentstages` (`stageid`);

--
-- Constraints for table `eligibility_family`
--
ALTER TABLE `eligibility_family`
  ADD CONSTRAINT `eligibility_family_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Constraints for table `growth`
--
ALTER TABLE `growth`
  ADD CONSTRAINT `growth_ibfk_1` FOREIGN KEY (`childid`) REFERENCES `childeren` (`childid`);

--
-- Constraints for table `mothers`
--
ALTER TABLE `mothers`
  ADD CONSTRAINT `mothers_ibfk_1` FOREIGN KEY (`familyid`) REFERENCES `eligibility_family` (`familyid`);

--
-- Constraints for table `pregnancies`
--
ALTER TABLE `pregnancies`
  ADD CONSTRAINT `pregnancies_ibfk_1` FOREIGN KEY (`motherid`) REFERENCES `mothers` (`motherid`),
  ADD CONSTRAINT `pregnancies_ibfk_2` FOREIGN KEY (`familyid`) REFERENCES `eligibility_family` (`familyid`);

--
-- Constraints for table `spouses`
--
ALTER TABLE `spouses`
  ADD CONSTRAINT `spouses_ibfk_1` FOREIGN KEY (`spouseid`) REFERENCES `eligibility_family` (`familyid`);

--
-- Constraints for table `threposhadist`
--
ALTER TABLE `threposhadist`
  ADD CONSTRAINT `threposhadist_ibfk_1` FOREIGN KEY (`childid`) REFERENCES `childeren` (`childid`);

--
-- Constraints for table `vaccinations`
--
ALTER TABLE `vaccinations`
  ADD CONSTRAINT `vaccinations_ibfk_1` FOREIGN KEY (`childid`) REFERENCES `childeren` (`childid`),
  ADD CONSTRAINT `vaccinations_ibfk_2` FOREIGN KEY (`vaccineid`) REFERENCES `vaccines` (`vaccineid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
