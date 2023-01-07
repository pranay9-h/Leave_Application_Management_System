-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2023 at 11:43 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leave_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `department_list`
--

CREATE TABLE `department_list` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department_list`
--

INSERT INTO `department_list` (`id`, `name`, `description`, `date_created`, `date_updated`) VALUES
(1, 'DSAI', 'Data Science and Artificial Engineering', '2021-08-21 10:13:45', '2022-11-27 17:51:03'),
(2, 'ECE', 'Electronics and Communication Engineering', '2021-08-21 10:16:06', '2022-11-27 17:50:11'),
(3, 'CSE', 'Computer Science and Engineering', '2021-08-21 10:18:00', '2022-11-27 17:49:32');

-- --------------------------------------------------------

--
-- Table structure for table `designation_list`
--

CREATE TABLE `designation_list` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `designation_list`
--

INSERT INTO `designation_list` (`id`, `name`, `description`, `date_created`, `date_updated`) VALUES
(2, 'Associate Professor', 'Assistant professor with national reputation as scholar', '2021-08-21 10:22:35', '2022-11-27 18:01:11'),
(3, 'Assistant Professor', 'Department level professor', '2021-08-21 10:22:52', '2022-11-27 18:02:21'),
(4, 'Instructor', 'lab instructor/examiner', '2021-08-21 10:23:18', '2022-11-27 18:06:41');

-- --------------------------------------------------------

--
-- Table structure for table `employee_meta`
--

CREATE TABLE `employee_meta` (
  `user_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_meta`
--

INSERT INTO `employee_meta` (`user_id`, `meta_field`, `meta_value`, `date_created`) VALUES
(30, 'type', '3', '2023-01-07 15:16:33'),
(30, 'employee_id', '2k2202', '2023-01-07 15:16:33'),
(30, 'firstname', 'anupama', '2023-01-07 15:16:33'),
(30, 'middlename', '', '2023-01-07 15:16:33'),
(30, 'lastname', 'munagapati', '2023-01-07 15:16:33'),
(30, 'dob', '2003-12-29', '2023-01-07 15:16:33'),
(30, 'contact', '1231231234', '2023-01-07 15:16:33'),
(30, 'address', 'Andhra Pradesh', '2023-01-07 15:16:33'),
(30, 'department_id', '1', '2023-01-07 15:16:33'),
(30, 'designation_id', '2', '2023-01-07 15:16:33'),
(30, 'username', 'anupama', '2023-01-07 15:16:33'),
(30, 'approver', 'off', '2023-01-07 15:16:33'),
(30, 'leave_type_ids', '4,8,6,12,10,7,13,5,9,11,14', '2023-01-07 15:29:44'),
(30, 'leave_type_credits', '{\"4\":\"8\",\"8\":\"15\",\"6\":\"15\",\"12\":\"280\",\"10\":\"0\",\"7\":\"0\",\"13\":\"40\",\"5\":\"15\",\"9\":\"20\",\"11\":\"30\",\"14\":\"40\"}', '2023-01-07 15:29:44'),
(35, 'type', '3', '2023-01-07 15:42:14'),
(35, 'employee_id', 'admin123', '2023-01-07 15:42:14'),
(35, 'firstname', 'Admin', '2023-01-07 15:42:14'),
(35, 'middlename', '', '2023-01-07 15:42:14'),
(35, 'lastname', 'administrator', '2023-01-07 15:42:14'),
(35, 'dob', '2002-02-02', '2023-01-07 15:42:14'),
(35, 'contact', '3453452345', '2023-01-07 15:42:14'),
(35, 'address', 'Dharwad, Karnataka', '2023-01-07 15:42:14'),
(35, 'department_id', '1', '2023-01-07 15:42:14'),
(35, 'designation_id', '4', '2023-01-07 15:42:14'),
(35, 'username', 'admin', '2023-01-07 15:42:14'),
(35, 'approver', 'off', '2023-01-07 15:42:14');

-- --------------------------------------------------------

--
-- Table structure for table `leave_applications`
--

CREATE TABLE `leave_applications` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `leave_type_id` int(30) DEFAULT NULL,
  `reason` text NOT NULL,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `type` tinyint(1) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=pending,1=approved, 2=denied,3=cancelled',
  `approved_by` int(30) DEFAULT NULL,
  `leave_days` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave_applications`
--

INSERT INTO `leave_applications` (`id`, `user_id`, `leave_type_id`, `reason`, `date_start`, `date_end`, `type`, `status`, `approved_by`, `leave_days`, `date_created`, `date_updated`) VALUES
(1, 30, 4, 'festival', '2023-01-17 00:00:00', '2023-01-17 00:00:00', 1, 3, 1, 1, '2023-01-07 15:30:19', '2023-01-07 15:33:27');

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` int(30) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `default_credit` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `code`, `name`, `description`, `default_credit`, `status`, `date_created`, `date_updated`) VALUES
(4, 'CL', 'Casual Leave', 'restricted to 8 days', 8, 1, '2022-11-27 18:13:04', NULL),
(5, 'sCL', 'Special Casual Leave', 'restricted to 15 days only, no travel support will be provided in case of academic work.', 15, 1, '2022-11-27 18:14:33', NULL),
(6, 'hpL/ComL', 'Half pay leave/ commuted leave', 'leave days are half payable in case of mandatory cases.', 15, 1, '2022-11-27 18:18:33', NULL),
(7, 'ML/PL/CCL', 'Maternity/Paternity/Child Care Leave', 'leave approved in case of any child care requirement', 0, 1, '2022-11-27 18:41:32', '2022-11-27 18:50:33'),
(8, 'EL', 'Earned Leave(15 days)', 'maximum 15 days per semester, needs proper reason for a leave more than 7 days', 15, 1, '2022-11-27 18:46:02', '2022-11-27 18:47:27'),
(9, 'sEL', 'Special Earned Leave', 'provided during vacation, 1 sEL=2 days of absence', 20, 1, '2022-11-27 18:50:18', '2022-11-27 18:51:02'),
(10, 'LoAG', 'Leave on academic grounds', 'After this leave, faculty is supposed to serve the nation as per the contract', 0, 1, '2022-11-27 18:53:24', NULL),
(11, 'SL', 'Short Leave', 'a leave that is less than 1 semester and greater than a month(prefixing or suffixing of vacation).\r\nfaculty is supposed to spent 2 semesters after returning from previous short leave or long leave.', 30, 1, '2022-11-27 19:00:05', '2022-11-27 19:25:10'),
(12, 'LL', 'Long Leave', 'leave>=two or more semesters, faculty is supposed to spent 5 years after returning from previous long leave or sabbatical leave(this time period will be 2 years for Assistant/Associate professor for availing long leave for first time)', 280, 1, '2022-11-27 19:02:05', '2022-11-27 19:22:56'),
(13, 'SaL', 'Sabbatical leave', 'leave that is maximum of 2 semesters,full paid leave,leave is entitled for those who spent 6 years already in the institute.', 40, 1, '2022-11-27 19:09:30', '2022-11-27 19:19:28'),
(14, 'sSaL', 'Subsequent Sabbatical Leave', 'sSaL will be entitled for those who spent 6 years since joining or availing last sabbatical\r\nNo.of Sabbatical leaves <=3', 40, 1, '2022-11-27 19:14:12', '2022-11-27 19:16:52');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Leave Application Management System '),
(6, 'short_name', 'IIITDWD'),
(11, 'logo', 'uploads/1669567920_logo_980.webp'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1669614600_m1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` varchar(250) DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', NULL, 'Admin', 'Director', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', '2022-11-27 17:42:01', 1, '2022-11-27 22:13:39', '2023-01-07 15:38:57'),
(30, 'anupama', '', 'munagapati', 'anupama', '4bc10fe3abdf6dc1c0eed4b083bdd32d', 'uploads/30_user.jpeg', NULL, 3, '2023-01-07 14:35:10', '2023-01-07 14:35:10'),
(31, 'Pranay', NULL, 'Soppadandi', 'pranay_s', '5a32d89a7db0403d3e710d4464949b34', 'uploads/1673085840_wateringimages.jpg', NULL, 4, '2023-01-07 15:34:28', NULL),
(32, 'josha', NULL, 'maturi', 'josh', 'faea9239f4dc03d13fca7006dd6a2b4b', 'uploads/1673085900_gardening.jpeg', NULL, 5, '2023-01-07 15:35:03', NULL),
(33, 'suvarna', NULL, 'V', 'suvarna_v', '26f962c341f488e399cf30e353ee178e', 'uploads/1673085900_cats.jpeg', NULL, 6, '2023-01-07 15:35:44', NULL),
(34, 'madhurima', NULL, 'munagapati', 'madhu', '3f3fc2915c3f69458c0a65f0cf341ca1', 'uploads/1673085960_a1.jpg', NULL, 7, '2023-01-07 15:36:38', NULL),
(35, 'Admin', '', 'administrator', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/35_user.png', NULL, 8, '2023-01-07 15:42:14', '2023-01-07 15:42:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department_list`
--
ALTER TABLE `department_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designation_list`
--
ALTER TABLE `designation_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_meta`
--
ALTER TABLE `employee_meta`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `leave_type_id` (`leave_type_id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department_list`
--
ALTER TABLE `department_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `designation_list`
--
ALTER TABLE `designation_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leave_applications`
--
ALTER TABLE `leave_applications`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee_meta`
--
ALTER TABLE `employee_meta`
  ADD CONSTRAINT `employee_meta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD CONSTRAINT `leave_applications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `leave_applications_ibfk_2` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
