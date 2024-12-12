-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2024 at 05:19 PM
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
-- Database: `mvch`
--

-- --------------------------------------------------------

--
-- Table structure for table `diagnostic_unit`
--

CREATE TABLE `diagnostic_unit` (
  `DiagnosticUnitID` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Type` varchar(100) DEFAULT NULL CHECK (`Type` in ('Radiology','Laboratory','Cardiac Diagnostic Unit','Psychiatric testing')),
  `FacilityID_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

CREATE TABLE `facility` (
  `FacilityID` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL CHECK (`Capacity` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicalorder`
--

CREATE TABLE `medicalorder` (
  `OrderID` bigint(20) UNSIGNED NOT NULL,
  `PatientID_FK` int(11) NOT NULL,
  `PhysicianID_FK` int(11) NOT NULL,
  `OrderType` enum('Drugs','Diagnostic') DEFAULT NULL,
  `OrderDate` date DEFAULT curdate(),
  `Status` enum('COMPLETED','PENDING','CANCELLED') DEFAULT NULL,
  `Item_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicalorder`
--

INSERT INTO `medicalorder` (`OrderID`, `PatientID_FK`, `PhysicianID_FK`, `OrderType`, `OrderDate`, `Status`, `Item_FK`) VALUES
(1, 1, 2, 'Drugs', '2024-12-11', 'PENDING', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medicalsurgicalitem`
--

CREATE TABLE `medicalsurgicalitem` (
  `ItemID` bigint(20) UNSIGNED NOT NULL,
  `ItemName` varchar(100) DEFAULT NULL,
  `Type` enum('Surgical','Medical','Medicine') DEFAULT NULL,
  `VendorID` int(11) DEFAULT NULL,
  `Quantity` int(11) NOT NULL,
  `cost` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicalsurgicalitem`
--

INSERT INTO `medicalsurgicalitem` (`ItemID`, `ItemName`, `Type`, `VendorID`, `Quantity`, `cost`) VALUES
(1, 'Scalpel', 'Surgical', 1, 200, 100),
(2, 'Stethoscope', 'Medical', 3, 20, 200),
(3, 'Surgical Gloves', 'Surgical', 4, 30, 200),
(4, 'Surgical Scissors', 'Surgical', 2, 10, 500),
(5, 'Forceps', 'Surgical', 2, 30, 300),
(6, 'Needle Holders', 'Surgical', 1, 30, 300),
(7, 'Bandage', 'Medical', 4, 15, 300),
(8, 'Masks', 'Medical', 3, 50, 100),
(9, 'WheelChairs', 'Medical', 1, 100, 1000),
(10, 'Blood Pressure Monitor', 'Medical', 1, 100, 1000),
(11, 'Amoxicillin', 'Medicine', 5, 1000, 10),
(12, 'BioFlu', 'Medicine', 6, 1000, 10),
(13, 'Neozep', 'Medicine', 6, 1000, 15);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `PatientID` bigint(20) UNSIGNED NOT NULL,
  `PatientName` varchar(100) DEFAULT NULL,
  `DateOfBirth` date NOT NULL,
  `Gender` char(1) DEFAULT NULL CHECK (`Gender` in ('M','F')),
  `WardID` int(11) DEFAULT NULL,
  `Status` enum('discharge','admitted') DEFAULT NULL,
  `Symptoms` text NOT NULL,
  `Allergies` text NOT NULL,
  `Medication` text NOT NULL,
  `MedicalHistory` text NOT NULL,
  `Events` text NOT NULL,
  `DischargeDetails` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`PatientID`, `PatientName`, `DateOfBirth`, `Gender`, `WardID`, `Status`, `Symptoms`, `Allergies`, `Medication`, `MedicalHistory`, `Events`, `DischargeDetails`) VALUES
(1, 'Danisa Biliran', '2003-07-14', 'F', 1, 'admitted', '', '', '', '', '', ''),
(2, 'Ombre Hamsirani', '2004-03-24', 'M', 3, 'admitted', '', '', '', '', '', ''),
(3, 'Viktor Greg Lim', '2002-05-31', 'M', 9, 'admitted', '', '', '', '', '', ''),
(4, 'Lady Melodi', '2004-01-10', 'M', 4, 'discharge', '', '', '', '', '', ''),
(5, 'Ethan Miller', '2003-03-23', 'M', 8, 'admitted', '', '', '', '', '', ''),
(6, 'Mia Johnson', '2002-08-13', 'F', 7, 'admitted', '', '', '', '', '', ''),
(7, 'Aiden Davis', '2003-10-06', 'M', 11, 'admitted', '', '', '', '', '', ''),
(8, 'Lucas Wilson', '2003-09-26', 'M', 10, 'discharge', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `contact` varchar(255) NOT NULL,
  `sex` enum('Male','Female') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `name`, `birthdate`, `contact`, `sex`) VALUES
(25, 'John Doe', '0000-00-00', '094558688528', 'Male'),
(27, 'Manawara Lim', '2024-12-12', '09261023632', 'Female'),
(28, 'Danisa Biliran', '2024-12-12', '76943768', 'Female'),
(29, 'Viktor Greg Lim', '2024-12-24', '095386676133', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `physician`
--

CREATE TABLE `physician` (
  `PhysicianID` bigint(20) UNSIGNED NOT NULL,
  `PhysicianName` varchar(100) DEFAULT NULL,
  `Specialty` varchar(50) DEFAULT NULL,
  `FacilityID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `physician`
--

INSERT INTO `physician` (`PhysicianID`, `PhysicianName`, `Specialty`, `FacilityID`) VALUES
(1, 'DR. Viktor Greg Lim', 'Oncology', 1),
(2, 'DR. Tappy Amatorio', 'Pediatrics', 2),
(3, 'DR. Oliver Smith', 'Obstetrics', 2),
(4, 'DR. Emma', 'Cardiology', 2),
(5, 'DR. Liam Jones', 'Nuerology', 2),
(6, 'DR. Sophia Taylow', 'Orthopedics', 2),
(7, 'DR. Henry Moore', 'Intensive Care Unit', 1),
(8, 'DR. Ava Johnson', 'Emergency Department', 1),
(9, 'DR. Ryan Cavill', 'General Medicine', 1),
(10, 'DR. Danisa Biliran', 'Radiology', 1);

-- --------------------------------------------------------

--
-- Table structure for table `physicianpatient`
--

CREATE TABLE `physicianpatient` (
  `PhysicianID` int(11) NOT NULL,
  `PatientID` int(11) NOT NULL,
  `DiagnosisDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scheduling`
--

CREATE TABLE `scheduling` (
  `schedule_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('Scheduled','Completed','Cancelled') NOT NULL DEFAULT 'Scheduled',
  `ward_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scheduling`
--

INSERT INTO `scheduling` (`schedule_id`, `patient_id`, `start_date`, `end_date`, `status`, `ward_id`) VALUES
(4, 25, '2024-12-12', '2024-12-14', 'Scheduled', 5),
(5, 29, '2024-12-25', '2024-12-26', 'Scheduled', 6);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffID` bigint(20) UNSIGNED NOT NULL,
  `StaffName` varchar(200) DEFAULT NULL,
  `Role` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `StaffName`, `Role`) VALUES
(13, 'Jacob Martini', 'Nurse'),
(14, 'Emily Hernandez', 'Nurse'),
(15, 'Benjamin Carter', 'Nurse'),
(16, 'Lily Adams', 'Nurse'),
(17, 'Noah Gray', 'IT'),
(18, 'Avery Lee', 'Nurse'),
(19, 'Logan James', 'IT'),
(20, 'Chloe Nelson', 'IT'),
(21, 'Caleb King', 'Registrar'),
(22, 'Layla Anderson', 'Registrar'),
(23, 'Luke Evans', 'Nurse'),
(24, 'Riley Cooper', 'Nurse');

-- --------------------------------------------------------

--
-- Table structure for table `staffward`
--

CREATE TABLE `staffward` (
  `StaffID_FK` int(11) NOT NULL,
  `WardID_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('USER','STAFF','ADMIN') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `role`) VALUES
(1, 'admin', '$2y$10$E2IclCl4mhDQNySKO8hove666oSCPYq3LVkQ8Ftb1yxQS3QO3bBiW', 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `VendorID` bigint(20) UNSIGNED NOT NULL,
  `VendorName` varchar(100) DEFAULT NULL,
  `ContactInfo` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`VendorID`, `VendorName`, `ContactInfo`, `Address`) VALUES
(1, 'PhilMedical Supplies', '09451948527', 'Metro Manila'),
(2, 'RespiCare', '09175342117', '23 Fisheries Street Barangay Vasra Quezon City,'),
(3, 'Rumex', '09338115707', 'Metro Manila'),
(4, 'MedShop', '09158455440', 'Metro Manila'),
(5, 'Bambang Pharmaceutical Depot Inc', '09175550326', 'Sta. Cruz, Manila Bacoor, Cavite'),
(6, 'DynaDrug', '0279107172', 'Felipe Pike cor. Lanite cor. Banner Sts., Bagong Ilog, Pasig City 1600');

-- --------------------------------------------------------

--
-- Table structure for table `ward`
--

CREATE TABLE `ward` (
  `WardID` bigint(20) UNSIGNED NOT NULL,
  `WardName` varchar(100) DEFAULT NULL,
  `Specialty` varchar(200) DEFAULT NULL,
  `FacilityID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ward`
--

INSERT INTO `ward` (`WardID`, `WardName`, `Specialty`, `FacilityID`) VALUES
(1, 'Obstetrics Ward', 'Maternal and childbirth care', 0),
(3, 'Oncology Ward', 'Cancer treatment and supportive care', 0),
(4, 'Geriatrics Ward', 'Elderly patient care and management', 0),
(5, 'Cardiology Ward', 'Heart-related care and treatment', 0),
(6, 'Nuerology Ward', 'Nervous system and brain-related care', 0),
(7, 'Pediatrics Ward', 'Child and adolescent medical care', 0),
(8, 'Orthopedics Ward', 'Musculoskeletal care and surgery', 0),
(9, 'General Medicine Ward', 'Treatment for a variety of non-surgical medical conditions', 0),
(10, 'Intensive Care Unit', 'Critical and life-support care', 0),
(11, 'Emergency Department', 'Immediate treatment for acute and life-threatening conditions', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wards`
--

CREATE TABLE `wards` (
  `ward_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `capacity` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wards`
--

INSERT INTO `wards` (`ward_id`, `name`, `capacity`, `type`, `created_at`) VALUES
(6, 'Samsung', 10, 'Emergency Ward', '2024-12-12 23:05:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `diagnostic_unit`
--
ALTER TABLE `diagnostic_unit`
  ADD PRIMARY KEY (`DiagnosticUnitID`);

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`FacilityID`);

--
-- Indexes for table `medicalorder`
--
ALTER TABLE `medicalorder`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `medicalsurgicalitem`
--
ALTER TABLE `medicalsurgicalitem`
  ADD PRIMARY KEY (`ItemID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`PatientID`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `physician`
--
ALTER TABLE `physician`
  ADD PRIMARY KEY (`PhysicianID`);

--
-- Indexes for table `physicianpatient`
--
ALTER TABLE `physicianpatient`
  ADD PRIMARY KEY (`PhysicianID`,`PatientID`,`DiagnosisDate`);

--
-- Indexes for table `scheduling`
--
ALTER TABLE `scheduling`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`);

--
-- Indexes for table `staffward`
--
ALTER TABLE `staffward`
  ADD PRIMARY KEY (`StaffID_FK`,`WardID_FK`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`VendorID`);

--
-- Indexes for table `ward`
--
ALTER TABLE `ward`
  ADD PRIMARY KEY (`WardID`);

--
-- Indexes for table `wards`
--
ALTER TABLE `wards`
  ADD PRIMARY KEY (`ward_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `diagnostic_unit`
--
ALTER TABLE `diagnostic_unit`
  MODIFY `DiagnosticUnitID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `facility`
--
ALTER TABLE `facility`
  MODIFY `FacilityID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicalorder`
--
ALTER TABLE `medicalorder`
  MODIFY `OrderID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `medicalsurgicalitem`
--
ALTER TABLE `medicalsurgicalitem`
  MODIFY `ItemID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `PatientID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `physician`
--
ALTER TABLE `physician`
  MODIFY `PhysicianID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `scheduling`
--
ALTER TABLE `scheduling`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `StaffID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `VendorID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ward`
--
ALTER TABLE `ward`
  MODIFY `WardID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wards`
--
ALTER TABLE `wards`
  MODIFY `ward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
