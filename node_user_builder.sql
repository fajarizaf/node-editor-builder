-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 08 Sep 2024 pada 00.06
-- Versi server: 8.0.31
-- Versi PHP: 7.4.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `node_user_builder`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `usercredentials`
--

CREATE TABLE `usercredentials` (
  `id` int NOT NULL,
  `UserCode` varchar(30) NOT NULL,
  `UserLogin` varchar(50) NOT NULL,
  `PasswordLogin` text,
  `VerifyCode` varchar(45) DEFAULT NULL,
  `FgVerified` int DEFAULT NULL,
  `FgActive` char(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `usercredentials`
--

INSERT INTO `usercredentials` (`id`, `UserCode`, `UserLogin`, `PasswordLogin`, `VerifyCode`, `FgVerified`, `FgActive`, `createdAt`, `updatedAt`) VALUES
(1, 'USR1', 'fajarizaf@gmail.com', '47bce5c74f589f4867dbd57e9ca9f808', 'mxT0swUFrshWFFNlFie0c45j7', 1, 'Y', '2022-04-08 19:09:08', '2024-02-07 16:36:04'),
(3, 'USR2', 'raditya@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'mxT0swUFrshWFFNlFie0c45j7', 1, 'Y', '2024-02-07 17:09:21', '2024-02-07 17:09:21'),
(5, 'USR3', 'dodit@gmail.com', '8c8d357b5e872bbacd45197626bd5759', 'itWo3tZaW62SL5MGD25UAMHDd', 1, 'Y', '2024-02-08 05:52:05', '2024-02-08 05:52:05'),
(6, 'USR4', 'dodits@gmail.com', '8c8d357b5e872bbacd45197626bd5759', 'Y36pBjg2KlpBOqJ2Xdvo4qOzx', 1, 'Y', '2024-02-08 05:56:49', '2024-02-08 05:56:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `userlogs`
--

CREATE TABLE `userlogs` (
  `id` int NOT NULL,
  `descriptions` varchar(100) NOT NULL,
  `user` varchar(50) DEFAULT NULL,
  `UserCode` varchar(30) DEFAULT NULL,
  `ipaddr` varchar(170) DEFAULT NULL,
  `useragent` longtext,
  `req` longtext,
  `res` longtext,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `userlogs`
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
-- Struktur dari tabel `userprofiles`
--

CREATE TABLE `userprofiles` (
  `UserCode` varchar(30) NOT NULL,
  `ContactName` varchar(100) NOT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `userprofiles`
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
-- Indeks untuk tabel `usercredentials`
--
ALTER TABLE `usercredentials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserCode` (`UserCode`);

--
-- Indeks untuk tabel `userlogs`
--
ALTER TABLE `userlogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserCode` (`UserCode`);

--
-- Indeks untuk tabel `userprofiles`
--
ALTER TABLE `userprofiles`
  ADD PRIMARY KEY (`UserCode`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `usercredentials`
--
ALTER TABLE `usercredentials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `userlogs`
--
ALTER TABLE `userlogs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `usercredentials`
--
ALTER TABLE `usercredentials`
  ADD CONSTRAINT `usercredentials_ibfk_1` FOREIGN KEY (`UserCode`) REFERENCES `userprofiles` (`UserCode`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `userlogs`
--
ALTER TABLE `userlogs`
  ADD CONSTRAINT `userlogs_ibfk_1` FOREIGN KEY (`UserCode`) REFERENCES `userprofiles` (`UserCode`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
