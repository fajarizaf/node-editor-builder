-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 16, 2024 at 04:10 AM
-- Server version: 8.0.39
-- PHP Version: 8.2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `node_core_builder`
--

-- --------------------------------------------------------

--
-- Table structure for table `cms`
--

CREATE TABLE `cms` (
  `id` int NOT NULL,
  `site_id` int DEFAULT NULL,
  `instance_id` int DEFAULT NULL,
  `title` varchar(90) DEFAULT NULL,
  `login_email` varchar(30) NOT NULL,
  `login_username` varchar(30) DEFAULT NULL,
  `login_password` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cms`
--

INSERT INTO `cms` (`id`, `site_id`, `instance_id`, `title`, `login_email`, `login_username`, `login_password`, `createdAt`, `updatedAt`) VALUES
(12, 20, 2, 'Starter Website Demo', 'fajarizaf@gmail.com', 'admin', 'admin', '2024-01-17 06:03:36', '2024-01-17 06:03:36'),
(13, 21, 3, 'Starter Website Demo', 'fajarizaf@gmail.com', 'admin', 'admin', '2024-01-17 06:03:36', '2024-01-17 06:03:36');

-- --------------------------------------------------------

--
-- Table structure for table `configs`
--

CREATE TABLE `configs` (
  `id` int NOT NULL,
  `config_name` varchar(90) DEFAULT NULL,
  `config_value` varchar(90) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `configs`
--

INSERT INTO `configs` (`id`, `config_name`, `config_value`, `createdAt`, `updatedAt`) VALUES
(1, 'base_domain_id', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'base_domain_name', 'nodebuilder.id', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'base_domain_guid', '29773cee-b3da-4ba0-8e47-fef21eb53d5a', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'owner_email', 'fajarizaf@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'owner_id', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'owner_login', 'admin', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'owner_guid', 'c6611881-70e7-11ef-be80-52540021d029', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'owner_pass', 'Adayanghilang123@', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE `servers` (
  `id` int NOT NULL,
  `ip_address` varchar(90) DEFAULT NULL,
  `ipv4` varchar(100) DEFAULT NULL,
  `ipv6` varchar(100) DEFAULT NULL,
  `host_name` varchar(50) DEFAULT NULL,
  `plesk_username` varchar(30) DEFAULT NULL,
  `plesk_password` varchar(30) DEFAULT NULL,
  `ssh_host` varchar(30) DEFAULT NULL,
  `ssh_user` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ssh_password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `server_status` varchar(30) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `servers`
--

INSERT INTO `servers` (`id`, `ip_address`, `ipv4`, `ipv6`, `host_name`, `plesk_username`, `plesk_password`, `ssh_host`, `ssh_user`, `ssh_password`, `server_status`, `createdAt`, `updatedAt`) VALUES
(1, '103.217.145.155', '10.16.236.178', '2606:2800:220:1:248:1893:25c8:1946', 'https://nodebuilder.id:8443', 'admin', 'Adayanghilang123@', 'nodebuilder.id:8443/', 'landing', 'Adayanghilang123@', 'available', '2023-04-12 12:33:56', '2023-04-12 12:33:56');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int NOT NULL,
  `domain_id` int DEFAULT NULL,
  `UserCode` varchar(30) DEFAULT NULL,
  `domain_name` varchar(90) DEFAULT NULL,
  `guid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ftp_login` varchar(50) DEFAULT NULL,
  `ftp_password` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `domain_id`, `UserCode`, `domain_name`, `guid`, `ftp_login`, `ftp_password`, `createdAt`, `updatedAt`) VALUES
(20, 2, 'USR1', 'editor.nodebuilder.id', 'eb1e9eb9-4da5-431b-90ff-6f261fcea12d', 'userlogin', 'adayanghilang', '2024-01-17 03:28:15', '2024-01-17 03:28:15'),
(22, 4, 'USR1', 'pages.nodebuilder.id', '6db69e9b-ab98-4866-9a9d-eb0c84ffe177', 'ftp_sitenode', 'Adayanghilang123@', '2024-09-15 02:26:56', '2024-09-15 02:26:56'),
(31, 24, 'USR1', 'land.nodebuilder.my.id', '7cc789fc-df38-4e18-9b7f-47eb0f7dfbd9', 'land', 'Adayanghilang123@', '2024-09-15 15:30:37', '2024-09-15 15:30:37'),
(32, 25, 'USR1', 'romo.nodebuilder.my.id', 'ef8d9b2b-cdfe-4d3a-b2d9-a7fef0fc4ae3', 'romo', 'Adayanghilang123@', '2024-09-15 15:34:40', '2024-09-15 15:34:40'),
(33, 26, 'USR1', 'cena.nodebuilder.my.id', '506cf6cd-6b94-4ddf-b73e-65aa2e60d290', 'cena', 'Adayanghilang123@', '2024-09-15 16:09:14', '2024-09-15 16:09:14'),
(34, 27, 'USR1', 'gista.nodebuilder.my.id', '48702d8e-319d-447b-84c4-f847efdc61d4', 'gista', 'Adayanghilang123@', '2024-09-15 16:11:51', '2024-09-15 16:11:51'),
(35, 28, 'USR1', 'cinta.nodebuilder.id', 'f8422b08-3856-41cc-a7d5-1e2d35cae03e', 'cinta', 'Adayanghilang123@', '2024-09-15 16:14:48', '2024-09-15 16:14:48'),
(36, 29, 'USR1', 'nova.nodebuilder.id', '6648939f-7423-4334-86cc-8eb1cefcc414', 'nova', 'Adayanghilang123@', '2024-09-16 02:26:28', '2024-09-16 02:26:28');

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int NOT NULL,
  `theme_author` int NOT NULL,
  `theme_category` int NOT NULL,
  `theme_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `theme_editor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `theme_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `theme_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `theme_cover` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `theme_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `theme_link` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `theme_author`, `theme_category`, `theme_type`, `theme_editor`, `theme_name`, `theme_desc`, `theme_cover`, `createdAt`, `updatedAt`, `theme_code`, `theme_link`) VALUES
(1, 1, 1, 'free', 'beaverbuilder', 'Love Nature', 'Elegant and serene multipurpose design to build any type of website', 'ove-nature-02.jpg', '2024-02-03 18:44:01', '2024-02-03 18:44:01', '59760', 'https://websitedemos.net/love-nature-08/'),
(2, 1, 2, 'free', 'beaverbuilder', 'Outdoor Adventure', 'Multipurpose template perfect for anyone looking to build a stylish website', 'outdoor-adventure-02.jpg', '2024-02-03 18:44:01', '2024-02-03 18:44:01', '48078', 'https://websitedemos.net/outdoor-adventure-08/'),
(3, 1, 3, 'free', 'beaverbuilder', 'Planet Earth', 'The Planet Earth multipurpose template is a captivating design with minimalist appeal', 'earth-02.jpg', '2024-02-03 18:44:01', '2024-02-03 18:44:01', '69916', 'https://websitedemos.net/earth-08/'),
(4, 1, 2, 'free', 'beaverbuilder', 'Digital Agency', 'Build an agency website using our professionally designed Digital Agency template', 'digital-agency-02.jpg', '2024-02-03 18:44:01', '2024-02-03 18:44:01', '54463', 'https://websitedemos.net/digital-agency-08/'),
(5, 1, 1, 'free', 'beaverbuilder', 'Local Business', 'Professional-looking website template to promote your local business and services', 'local-business-02.jpg', '2024-02-03 18:44:01', '2024-02-03 18:44:01', '55315', 'https://websitedemos.net/local-business-08/'),
(6, 1, 2, 'free', 'beaverbuilder', 'Tech Startup', 'Well-designed flat theme with lovely colors, suitable for any type of business', 'tech-startup-02.jpg', '2024-02-03 18:44:01', '2024-02-03 18:44:01', '48671', 'https:://websitedemos.net/tech-startup-08');

-- --------------------------------------------------------

--
-- Table structure for table `theme_authors`
--

CREATE TABLE `theme_authors` (
  `id` int NOT NULL,
  `author_theme_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `author_slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `theme_authors`
--

INSERT INTO `theme_authors` (`id`, `author_theme_name`, `author_slug`, `createdAt`, `updatedAt`) VALUES
(1, 'Astra Themes', 'astra', '2024-02-03 18:44:01', '2024-02-03 18:44:01');

-- --------------------------------------------------------

--
-- Table structure for table `theme_categoris`
--

CREATE TABLE `theme_categoris` (
  `id` int NOT NULL,
  `categori_theme_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `theme_categoris`
--

INSERT INTO `theme_categoris` (`id`, `categori_theme_name`, `createdAt`, `updatedAt`) VALUES
(1, 'Bussines', '2024-02-03 18:44:01', '2024-02-03 18:44:01'),
(2, 'Nature', '2024-02-03 18:44:01', '2024-02-03 18:44:01'),
(3, 'Services', '2024-02-03 18:44:01', '2024-02-03 18:44:01');

-- --------------------------------------------------------

--
-- Table structure for table `usercredentials`
--

CREATE TABLE `usercredentials` (
  `id` int NOT NULL,
  `UserCode` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UserLogin` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PasswordLogin` text COLLATE utf8mb4_general_ci,
  `VerifyCode` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FgVerified` int DEFAULT NULL,
  `FgActive` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usercredentials`
--

INSERT INTO `usercredentials` (`id`, `UserCode`, `UserLogin`, `PasswordLogin`, `VerifyCode`, `FgVerified`, `FgActive`, `createdAt`, `updatedAt`) VALUES
(1, 'USR1', 'fajarizaf@gmail.com', '47bce5c74f589f4867dbd57e9ca9f808', 'mxT0swUFrshWFFNlFie0c45j7', 1, 'Y', '2022-04-08 19:09:08', '2024-02-07 16:36:04'),
(3, 'USR2', 'raditya@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'mxT0swUFrshWFFNlFie0c45j7', 1, 'Y', '2024-02-07 17:09:21', '2024-02-07 17:09:21'),
(5, 'USR3', 'dodit@gmail.com', '8c8d357b5e872bbacd45197626bd5759', 'itWo3tZaW62SL5MGD25UAMHDd', 1, 'Y', '2024-02-08 05:52:05', '2024-02-08 05:52:05'),
(6, 'USR4', 'dodits@gmail.com', '8c8d357b5e872bbacd45197626bd5759', 'Y36pBjg2KlpBOqJ2Xdvo4qOzx', 1, 'Y', '2024-02-08 05:56:49', '2024-02-08 05:56:49');

-- --------------------------------------------------------

--
-- Table structure for table `userlogs`
--

CREATE TABLE `userlogs` (
  `id` int NOT NULL,
  `descriptions` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UserCode` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ipaddr` varchar(170) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `useragent` longtext COLLATE utf8mb4_general_ci,
  `req` longtext COLLATE utf8mb4_general_ci,
  `res` longtext COLLATE utf8mb4_general_ci,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userlogs`
--

INSERT INTO `userlogs` (`id`, `descriptions`, `user`, `UserCode`, `ipaddr`, `useragent`, `req`, `res`, `createdAt`, `updatedAt`) VALUES
(1, 'auth/login', 'Fajar Riza Fauzi', 'USR1', '::1', 'PostmanRuntime/7.31.3', '{\"email\":\"fajarizaf@gmail.com\",\"password\":\"aaa\"}', NULL, '2023-04-12 12:33:56', '2023-04-12 12:33:56'),
(2, 'auth/login', 'Fajar Riza Fauzi', 'USR1', '::1', 'PostmanRuntime/7.31.3', '{\"email\":\"fajarizaf@gmail.com\",\"password\":\"aaa\"}', NULL, '2023-04-12 14:18:17', '2023-04-12 14:18:17'),
(3, 'auth/login', 'Fajar Riza Fauzi', 'USR1', '::1', 'PostmanRuntime/7.31.3', '{\"email\":\"fajarizaf@gmail.com\",\"password\":\"aaa\"}', NULL, '2023-04-12 16:55:35', '2023-04-12 16:55:35'),
(4, 'auth/login', 'Fajar Riza Fauzi', 'USR1', '::1', 'PostmanRuntime/7.31.3', '{\"email\":\"fajarizaf@gmail.com\",\"password\":\"aaa\"}', NULL, '2023-04-13 14:02:50', '2023-04-13 14:02:50'),
(5, 'auth/login', 'Fajar Riza Fauzi', 'USR1', '::1', 'PostmanRuntime/7.32.2', '{\"email\":\"fajarizaf@gmail.com\",\"password\":\"aaa\"}', NULL, '2023-04-14 13:40:39', '2023-04-14 13:40:39'),
(6, 'auth/login', 'Fajar Riza Fauzi', 'USR1', '::1', 'PostmanRuntime/7.32.2', '{\"email\":\"fajarizaf@gmail.com\",\"password\":\"aaa\"}', NULL, '2023-04-15 14:35:14', '2023-04-15 14:35:14'),
(7, 'auth/login', 'Fajar Riza Fauzi', 'USR1', '::1', 'PostmanRuntime/7.32.2', '{\"email\":\"fajarizaf@gmail.com\",\"password\":\"aaa\"}', NULL, '2023-04-27 01:47:09', '2023-04-27 01:47:09'),
(8, 'auth/login', 'Fajar Riza Fauzi', 'USR1', '::1', 'PostmanRuntime/7.32.2', '{\"email\":\"fajarizaf@gmail.com\",\"password\":\"aaa\"}', NULL, '2023-04-27 01:47:33', '2023-04-27 01:47:33'),
(9, 'auth/login', 'Fajar Riza Fauzi', 'USR1', '::1', 'PostmanRuntime/7.32.2', '{\"email\":\"fajarizaf@gmail.com\",\"password\":\"aaa\"}', NULL, '2023-04-27 01:49:07', '2023-04-27 01:49:07'),
(10, 'auth/login', 'Fajar Riza Fauzi', 'USR1', '::1', 'PostmanRuntime/7.33.0', '{\"email\":\"fajarizaf@gmail.com\",\"password\":\"aaa\"}', NULL, '2024-01-11 14:32:22', '2024-01-11 14:32:22'),
(11, 'auth/login', 'Fajar Riza Fauzi', 'USR1', '::1', 'PostmanRuntime/7.33.0', '{\"email\":\"fajarizaf@gmail.com\",\"password\":\"aaa\"}', NULL, '2024-01-12 14:32:17', '2024-01-12 14:32:17'),
(12, 'auth/login', 'Fajar Riza Fauzi', 'USR1', '::1', 'PostmanRuntime/7.33.0', '{\"email\":\"fajarizaf@gmail.com\",\"password\":\"aaa\"}', NULL, '2024-01-13 15:56:40', '2024-01-13 15:56:40'),
(13, 'auth/login', 'Fajar Riza Fauzi', 'USR1', '::1', 'PostmanRuntime/7.36.1', '{\"email\":\"fajarizaf@gmail.com\",\"password\":\"aaa\"}', NULL, '2024-01-16 14:08:35', '2024-01-16 14:08:35'),
(14, 'auth/login', 'Fajar Riza Fauzi', 'USR1', '::1', 'PostmanRuntime/7.36.1', '{\"email\":\"fajarizaf@gmail.com\",\"password\":\"aaa\"}', NULL, '2024-01-16 14:14:18', '2024-01-16 14:14:18'),
(15, 'auth/login', 'Fajar Riza Fauzi', 'USR1', '::1', 'PostmanRuntime/7.36.1', '{\"email\":\"fajarizaf@gmail.com\",\"password\":\"aaa\"}', NULL, '2024-01-16 14:14:28', '2024-01-16 14:14:28'),
(16, 'auth/login', 'Fajar Riza Fauzi', 'USR1', '::1', 'PostmanRuntime/7.36.1', '{\"email\":\"fajarizaf@gmail.com\",\"password\":\"aaa\"}', NULL, '2024-02-03 05:41:38', '2024-02-03 05:41:38'),
(17, 'auth/login', 'Fajar Riza Fauzi', 'USR1', '::1', 'PostmanRuntime/7.36.1', '{\"email\":\"fajarizaf@gmail.com\",\"password\":\"aaa\"}', NULL, '2024-02-06 01:48:21', '2024-02-06 01:48:21'),
(18, 'auth/login', 'Fajar Riza Fauzi', 'USR1', '::1', 'PostmanRuntime/7.36.1', '{\"email\":\"fajarizaf@gmail.com\",\"password\":\"aaa\"}', NULL, '2024-02-07 15:35:55', '2024-02-07 15:35:55'),
(19, 'auth/login', 'Fajar Riza Fauzi', 'USR1', '::1', 'PostmanRuntime/7.36.1', '{\"email\":\"fajarizaf@gmail.com\",\"password\":\"aaa\"}', NULL, '2024-02-07 16:18:31', '2024-02-07 16:18:31'),
(20, 'auth/login', 'Fajar Riza Fauzi', 'USR1', '::1', 'PostmanRuntime/7.36.1', '{\"email\":\"fajarizaf@gmail.com\",\"password\":\"aaa\"}', NULL, '2024-02-07 16:36:04', '2024-02-07 16:36:04');

-- --------------------------------------------------------

--
-- Table structure for table `userprofiles`
--

CREATE TABLE `userprofiles` (
  `UserCode` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactName` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Phone` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userprofiles`
--

INSERT INTO `userprofiles` (`UserCode`, `ContactName`, `Phone`, `Email`, `createdAt`, `updatedAt`) VALUES
('USR1', 'Fajar Riza Fauzi', '082125649665', 'fajarizaf@gmail.com', '2022-04-08 19:09:08', '2022-04-08 19:09:08'),
('USR2', 'raditya', NULL, 'raditya@gmail.com', '2024-02-07 17:09:21', '2024-02-07 17:09:21'),
('USR3', 'dodit', NULL, 'dodit@gmail.com', '2024-02-08 05:52:05', '2024-02-08 05:52:05'),
('USR4', 'dodit', NULL, 'dodits@gmail.com', '2024-02-08 05:56:49', '2024-02-08 05:56:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cms`
--
ALTER TABLE `cms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_author` (`theme_author`),
  ADD KEY `theme_category` (`theme_category`);

--
-- Indexes for table `theme_authors`
--
ALTER TABLE `theme_authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme_categoris`
--
ALTER TABLE `theme_categoris`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cms`
--
ALTER TABLE `cms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `configs`
--
ALTER TABLE `configs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `theme_authors`
--
ALTER TABLE `theme_authors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `theme_categoris`
--
ALTER TABLE `theme_categoris`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `themes`
--
ALTER TABLE `themes`
  ADD CONSTRAINT `themes_ibfk_1` FOREIGN KEY (`theme_author`) REFERENCES `theme_authors` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `themes_ibfk_2` FOREIGN KEY (`theme_category`) REFERENCES `theme_categoris` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
