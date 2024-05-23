-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2024 at 10:23 AM
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
-- Database: `online tax planning courses platform`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryName`, `Description`) VALUES
(1, 'Tax Basics', 'Fundamental concepts of taxation'),
(2, 'Advanced Tax Strategies', 'Complex tax planning techniques'),
(3, 'Business Taxation', 'Tax strategies for businesses');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `CourseID` int(11) NOT NULL,
  `CourseName` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Duration` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `InstructorID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`CourseID`, `CourseName`, `Description`, `Duration`, `Price`, `InstructorID`) VALUES
(1, 'Introduction to Tax Basics', 'Learn fundamental concepts of taxation.', 4, 99.99, 1),
(2, 'Advanced Tax Strategies', 'Explore complex tax planning techniques.', 6, 149.99, 2),
(3, 'Business Tax Planning', 'Focus on tax strategies for businesses.', 8, 199.99, 3);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `EnrollmentID` int(11) NOT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `EnrollmentDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`EnrollmentID`, `StudentID`, `CourseID`, `EnrollmentDate`) VALUES
(1, 1, 1, '2024-05-01'),
(2, 2, 2, '2024-05-02'),
(3, 3, 3, '2024-05-03'),
(4, 1, 2, '2024-05-04'),
(5, 2, 3, '2024-05-05'),
(6, 3, 1, '2024-05-06');

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `InstructorID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Expertise` varchar(100) DEFAULT NULL,
  `Experience` int(11) DEFAULT NULL,
  `Rating` decimal(3,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`InstructorID`, `Name`, `Expertise`, `Experience`, `Rating`) VALUES
(1, 'John Smith', 'Taxation, Accounting', 10, 4.8),
(2, 'Emily Johnson', 'Tax Planning, Law', 8, 4.9),
(3, 'David Lee', 'Business Taxation', 12, 4.7);

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `LessonID` int(11) NOT NULL,
  `ModuleID` int(11) DEFAULT NULL,
  `LessonName` varchar(100) DEFAULT NULL,
  `Content` text DEFAULT NULL,
  `Duration` int(11) DEFAULT NULL,
  `OrderInCourse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`LessonID`, `ModuleID`, `LessonName`, `Content`, `Duration`, `OrderInCourse`) VALUES
(1, 1, 'Introduction to Taxation', 'This lesson covers basic concepts of taxation including types of taxes and tax obligations.', 60, 1),
(2, 1, 'Taxable Income', 'Learn about what constitutes taxable income and how it is calculated for individuals and businesses.', 45, 2),
(3, 2, 'Tax Planning Strategies', 'Explore various tax planning strategies to minimize tax liabilities and maximize savings.', 75, 1),
(4, 2, 'Tax Credits and Deductions', 'Understand different tax credits and deductions available to taxpayers to reduce their tax burden.', 60, 2),
(5, 3, 'Taxation for Businesses', 'This lesson focuses on tax implications for businesses including corporate taxes and deductions.', 90, 1),
(6, 3, 'International Taxation', 'Learn about taxation issues related to international business operations and cross-border transactions.', 60, 2);

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `ModuleID` int(11) NOT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `ModuleName` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `OrderInCourse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`ModuleID`, `CourseID`, `ModuleName`, `Description`, `OrderInCourse`) VALUES
(1, 1, 'Introduction to Taxation', 'This module covers basic concepts of taxation including types of taxes and tax obligations.', 1),
(2, 1, 'Taxable Income', 'Learn about what constitutes taxable income and how it is calculated for individuals and businesses.', 2),
(3, 2, 'Tax Planning Strategies', 'Explore various tax planning strategies to minimize tax liabilities and maximize savings.', 1),
(4, 2, 'Tax Credits and Deductions', 'Understand different tax credits and deductions available to taxpayers to reduce their tax burden.', 2),
(5, 3, 'Taxation for Businesses', 'This module focuses on tax implications for businesses including corporate taxes and deductions.', 1),
(6, 3, 'International Taxation', 'Learn about taxation issues related to international business operations and cross-border transactions.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `StudentID`, `CourseID`, `Amount`, `PaymentDate`, `PaymentMethod`) VALUES
(1, 1, 1, 99.99, '2024-05-01', 'Credit Card'),
(2, 2, 2, 149.99, '2024-05-02', 'PayPal'),
(3, 3, 3, 199.99, '2024-05-03', 'Bank Transfer'),
(4, 1, 2, 149.99, '2024-05-04', 'Credit Card'),
(5, 2, 3, 199.99, '2024-05-05', 'PayPal'),
(6, 3, 1, 99.99, '2024-05-06', 'Credit Card');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `StudentID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `EnrollmentDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentID`, `Name`, `Email`, `Password`, `EnrollmentDate`) VALUES
(1, 'Alice Johnson', 'alice@example.com', 'password123', '2024-05-01'),
(2, 'Bob Smith', 'bob@example.com', 'securepass', '2024-05-02'),
(3, 'Charlie Brown', 'charlie@example.com', 'letmein', '2024-05-03');

-- --------------------------------------------------------

--
-- Table structure for table `taxplanningresources`
--

CREATE TABLE `taxplanningresources` (
  `ResourceID` int(11) NOT NULL,
  `ResourceName` varchar(100) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `taxplanningresources`
--

INSERT INTO `taxplanningresources` (`ResourceID`, `ResourceName`, `URL`, `Description`, `CategoryID`) VALUES
(1, 'Tax Planning Guide', 'https://example.com/tax-planning-guide', 'Comprehensive guide covering various tax planning strategies for individuals and businesses.', 1),
(2, 'IRS Tax Forms', 'https://irs.gov/forms', 'Official IRS forms for tax filings and reporting.', 1),
(3, 'Small Business Tax Deductions', 'https://example.com/small-business-deductions', 'List of common tax deductions available to small businesses.', 3),
(4, 'Tax Planning Videos', 'https://example.com/tax-planning-videos', 'Collection of educational videos on tax planning topics.', 2),
(5, 'Estate Planning Resources', 'https://example.com/estate-planning-resources', 'Guides and tools for estate planning and wealth preservation.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `UserType` enum('Student','Instructor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Password`, `UserType`) VALUES
(1, 'john_doe', 'password123', 'Instructor'),
(2, 'alice_smith', 'securepass', 'Student'),
(3, 'bob_johnson', 'letmein', 'Student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`CourseID`),
  ADD KEY `InstructorID` (`InstructorID`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`EnrollmentID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`InstructorID`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`LessonID`),
  ADD KEY `ModuleID` (`ModuleID`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`ModuleID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentID`);

--
-- Indexes for table `taxplanningresources`
--
ALTER TABLE `taxplanningresources`
  ADD PRIMARY KEY (`ResourceID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`InstructorID`) REFERENCES `instructors` (`InstructorID`);

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`);

--
-- Constraints for table `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `lesson_ibfk_1` FOREIGN KEY (`ModuleID`) REFERENCES `module` (`ModuleID`);

--
-- Constraints for table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `module_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`);

--
-- Constraints for table `taxplanningresources`
--
ALTER TABLE `taxplanningresources`
  ADD CONSTRAINT `taxplanningresources_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
