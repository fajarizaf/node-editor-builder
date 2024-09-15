-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 08 Sep 2024 pada 00.05
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
-- Database: `node_core_builder`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms`
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
-- Dumping data untuk tabel `cms`
--

INSERT INTO `cms` (`id`, `site_id`, `instance_id`, `title`, `login_email`, `login_username`, `login_password`, `createdAt`, `updatedAt`) VALUES
(12, 20, 2, 'Starter Website Demo', 'fajarizaf@gmail.com', 'admin', 'Adayanghilang123@', '2024-01-17 06:03:36', '2024-01-17 06:03:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `configs`
--

CREATE TABLE `configs` (
  `id` int NOT NULL,
  `config_name` varchar(90) DEFAULT NULL,
  `config_value` varchar(90) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `configs`
--

INSERT INTO `configs` (`id`, `config_name`, `config_value`, `createdAt`, `updatedAt`) VALUES
(1, 'base_domain_id', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'base_domain_name', 'nodebuilder.my.id', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'base_domain_guid', '85fcc290-ff92-4ac9-976c-2891d57cd8da', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'owner_email', 'fajarizaf@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'owner_id', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'owner_login', 'admin', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'owner_guid', '2153ef39-b087-11ee-b3bb-525400411154', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'owner_pass', 'Adayanghilang123@', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `servers`
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
-- Dumping data untuk tabel `servers`
--

INSERT INTO `servers` (`id`, `ip_address`, `ipv4`, `ipv6`, `host_name`, `plesk_username`, `plesk_password`, `ssh_host`, `ssh_user`, `ssh_password`, `server_status`, `createdAt`, `updatedAt`) VALUES
(1, '103.171.85.155', '103.171.85.155', '2606:2800:220:1:248:1893:25c8:1946', 'https://rizabuilder.my.id:8443', 'admin', 'Adayanghilang123@', 'nodebuilder.my.id', 'user_login', 'Adayanghilang123@', 'available', '2023-04-12 12:33:56', '2023-04-12 12:33:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sites`
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
-- Dumping data untuk tabel `sites`
--

INSERT INTO `sites` (`id`, `domain_id`, `UserCode`, `domain_name`, `guid`, `ftp_login`, `ftp_password`, `createdAt`, `updatedAt`) VALUES
(20, 7, 'USR1', 'page.nodebuilder.my.id', '82e6f4ae-9ae7-4692-bbf1-82cc017e11a9', 'ftp_sitenode', 'Adayanghilang123@', '2024-01-17 03:28:15', '2024-01-17 03:28:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `themes`
--

CREATE TABLE `themes` (
  `id` int NOT NULL,
  `theme_author` int NOT NULL,
  `theme_category` int NOT NULL,
  `theme_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `theme_editor` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `theme_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `theme_desc` text COLLATE utf8mb4_general_ci,
  `theme_cover` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `theme_code` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `theme_link` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `themes`
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
-- Struktur dari tabel `theme_authors`
--

CREATE TABLE `theme_authors` (
  `id` int NOT NULL,
  `author_theme_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `author_slug` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `theme_authors`
--

INSERT INTO `theme_authors` (`id`, `author_theme_name`, `author_slug`, `createdAt`, `updatedAt`) VALUES
(1, 'Astra Themes', 'astra', '2024-02-03 18:44:01', '2024-02-03 18:44:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `theme_categoris`
--

CREATE TABLE `theme_categoris` (
  `id` int NOT NULL,
  `categori_theme_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `theme_categoris`
--

INSERT INTO `theme_categoris` (`id`, `categori_theme_name`, `createdAt`, `updatedAt`) VALUES
(1, 'Bussines', '2024-02-03 18:44:01', '2024-02-03 18:44:01'),
(2, 'Nature', '2024-02-03 18:44:01', '2024-02-03 18:44:01'),
(3, 'Services', '2024-02-03 18:44:01', '2024-02-03 18:44:01');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cms`
--
ALTER TABLE `cms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indeks untuk tabel `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_author` (`theme_author`),
  ADD KEY `theme_category` (`theme_category`);

--
-- Indeks untuk tabel `theme_authors`
--
ALTER TABLE `theme_authors`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `theme_categoris`
--
ALTER TABLE `theme_categoris`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cms`
--
ALTER TABLE `cms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `configs`
--
ALTER TABLE `configs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `theme_authors`
--
ALTER TABLE `theme_authors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `theme_categoris`
--
ALTER TABLE `theme_categoris`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `themes`
--
ALTER TABLE `themes`
  ADD CONSTRAINT `themes_ibfk_1` FOREIGN KEY (`theme_author`) REFERENCES `theme_authors` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `themes_ibfk_2` FOREIGN KEY (`theme_category`) REFERENCES `theme_categoris` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
