-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 26, 2022 at 04:10 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.3.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fs_classroom`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `name`, `date_start`, `date_end`) VALUES
(1, 'Bootcamp Fullstack', '2021-02-01', '2021-05-01'),
(2, 'Bootcamp Data Science', '2021-02-14', '2021-05-27'),
(3, 'Bootcamp Digital Marketing', '2021-02-13', '2021-06-13'),
(4, 'Data Engineer', '2021-02-07', '2021-07-13');

-- --------------------------------------------------------

--
-- Table structure for table `joins`
--

CREATE TABLE `joins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `role` enum('Student','Tutor','Facilitator','') NOT NULL DEFAULT 'Student'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `joins`
--

INSERT INTO `joins` (`id`, `user_id`, `class_id`, `role`) VALUES
(1, 1, 1, 'Tutor'),
(2, 2, 1, 'Student'),
(3, 3, 1, 'Facilitator'),
(4, 4, 2, 'Tutor'),
(5, 5, 2, 'Facilitator'),
(6, 6, 2, 'Student'),
(7, 6, 1, 'Student'),
(8, 5, 1, 'Student'),
(9, 1, 2, 'Student'),
(10, 6, 4, 'Tutor'),
(11, 3, 4, 'Facilitator');

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `session_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`session_id`, `name`, `file`) VALUES
(1, 'Intro Fullstack', 'https://shiftacademy.id/file/fullstack/intro.pptx'),
(2, 'Basic HTML', 'https://shiftacademy.id/file/fullstack/html.pptx'),
(3, 'Basic HTML II', 'https://shiftacademy.id/file/fullstack/html-2.pptx'),
(4, 'Intro Data Science', 'https://shiftacademy.id/file/ds/intro.pptx'),
(5, 'Data Store', 'https://shiftacademy.id/file/ds/data-store.pptx'),
(6, 'Data Warehouse', 'https://shiftacademy.id/file/ds/warehouse.pptx'),
(7, 'Intro Data Engineer', 'https://shiftacademy.id/file/de/intro.pptx'),
(9, 'Database', 'https://shiftacademy.id/file/de/database.pptx');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `seq` tinyint(4) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `class_id`, `name`, `seq`, `start`, `end`) VALUES
(1, 1, 'Intro Fullstack', 1, '2021-02-01 19:00:00', '2021-02-01 21:00:00'),
(2, 1, 'Session 1', 2, '2021-02-03 19:00:00', '2021-02-03 21:00:00'),
(3, 1, 'Session 2', 3, '2021-02-05 19:00:00', '2021-02-05 21:00:00'),
(4, 2, 'Intro Data Science', 1, '2021-02-14 10:00:00', '2021-02-14 12:00:00'),
(5, 2, 'Session 1', 2, '2021-02-20 08:00:00', '2021-02-20 10:00:00'),
(6, 2, 'Session 2', 3, '2021-02-20 10:00:00', '2021-02-20 12:00:00'),
(7, 4, 'Intro Data Engineer', 1, '2021-02-13 08:00:00', '2021-02-13 10:00:00'),
(8, 3, 'Intro Digital Marketing', 1, '2021-02-13 08:00:00', '2021-02-13 10:00:00'),
(9, 4, 'Session 1', 1, '2021-02-13 10:00:00', '2021-02-13 12:00:00'),
(10, 4, 'Session 2', 3, '2021-02-14 10:00:00', '2021-02-14 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(13) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `address`) VALUES
(1, 'Ghany Abdillah Ersa', '082164028264', 'Jember'),
(2, 'Allyvio Yonim Mahardhika', NULL, 'Jember'),
(3, 'Atika Rahmawati', '081456273654', 'Ciracas'),
(4, 'Fajri Rahman', '082156735678', 'Bogor'),
(5, 'Jihadul Akbar', '083678256354', 'Bondowoso'),
(6, 'Christina Laily', '0814457786567', 'Cikarang'),
(7, 'Tsubasa Ozora', NULL, NULL),
(8, 'Eren Yeager', NULL, 'Eldian');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `joins`
--
ALTER TABLE `joins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_fk` (`user_id`),
  ADD KEY `class_fk` (`class_id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classes_fk` (`class_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `joins`
--
ALTER TABLE `joins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `joins`
--
ALTER TABLE `joins`
  ADD CONSTRAINT `class_fk` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `session_fk` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `classes_fk` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
