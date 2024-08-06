-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2024 at 10:50 AM
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
-- Database: `wedding_jewepe`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_catalogues`
--

CREATE TABLE `tb_catalogues` (
  `catalogue_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` int(15) NOT NULL,
  `status_publish` enum('Y','N') NOT NULL,
  `user_id` int(5) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_catalogues`
--

INSERT INTO `tb_catalogues` (`catalogue_id`, `image`, `package_name`, `description`, `price`, `status_publish`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '20240701_937310052.jpg', 'A', '\"Lorem Ipsum\" adalah teks placeholder yang sering digunakan dalam industri percetakan dan desain grafis. Teks ini berasal dari karya klasik Latin yang berjudul \"de Finibus Bonorum et Malorum\" oleh Cicero, yang ditulis pada tahun 45 SM. Teks ini digunakan sebagai teks contoh atau dummy untuk mengisi ruang dalam desain agar klien dapat melihat tata letak tanpa terganggu oleh konten yang sebenarnya.', 12300000, 'Y', 1, '2024-07-01 14:07:47', NULL),
(2, '20240701_333298659.jpg', 'heuu', '\"Lorem Ipsum\" adalah teks placeholder yang sering digunakan dalam industri percetakan dan desain grafis. Teks ini berasal dari karya klasik Latin yang berjudul \"de Finibus Bonorum et Malorum\" oleh Cicero, yang ditulis pada tahun 45 SM. Teks ini digunakan sebagai teks contoh atau dummy untuk mengisi ruang dalam desain agar klien dapat melihat tata letak tanpa terganggu oleh konten yang sebenarnya.', 200000000, 'Y', 1, '2024-07-01 14:08:16', NULL),
(4, '20240701_1629153563.jpg', 'Paket Ahay', '<p>yah coba ya</p>', 12300000, 'Y', 1, '2024-07-24 05:17:58', NULL),
(5, '20240706_771778238.png', 'pake d', '<p>ahahaha</p>', 1111000, 'Y', 1, '2024-07-06 09:08:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_order`
--

CREATE TABLE `tb_order` (
  `order_id` int(11) NOT NULL,
  `catalogue_id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `wedding_date` date NOT NULL,
  `status` enum('requested','approved','rejected','cancelled') NOT NULL,
  `user_id` int(5) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_order`
--

INSERT INTO `tb_order` (`order_id`, `catalogue_id`, `name`, `email`, `phone_number`, `wedding_date`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 2, 'As Syifa Nurul Fitri Ubaidillah', 'syifanurulfitri@gmail.com', '089609211312', '2024-07-26', 'approved', 1, '2024-07-04 05:17:11', '2024-07-29 10:33:15'),
(3, 2, 'As Syifa Nurul Fitri Ubaidillah', 'syifanurulfitri@gmail.com', '089609211312', '2024-07-17', 'requested', 1, '2024-07-04 05:24:12', '2024-07-29 08:48:26'),
(5, 2, 'As Syifa Nurul Fitri Ubaidillah', 'syifanurulfitri@gmail.com', '089609211312', '2024-08-06', 'requested', 1, '2024-07-04 05:35:17', '2024-07-29 08:51:38'),
(6, 1, 'Asipa', 'asipa@gmail.com', '089609211312', '2024-07-22', 'requested', 1, '2024-07-04 07:42:43', '2024-07-29 08:47:24'),
(7, 1, 'As Syifa Nurul Fitri Ubaidillah', 'assyifa1212@gmail.com', '089609211312', '2024-07-08', 'requested', 1, '2024-07-24 05:40:40', '2024-07-29 08:47:25');

-- --------------------------------------------------------

--
-- Table structure for table `tb_settings`
--

CREATE TABLE `tb_settings` (
  `id` int(2) NOT NULL,
  `website_name` varchar(255) NOT NULL,
  `phone_number1` varchar(15) NOT NULL,
  `phone_number2` varchar(15) NOT NULL,
  `email1` varchar(80) NOT NULL,
  `email2` varchar(80) NOT NULL,
  `address` text NOT NULL,
  `maps` text NOT NULL,
  `logo` varchar(80) NOT NULL,
  `facebook_url` varchar(255) NOT NULL,
  `instagram_url` varchar(255) NOT NULL,
  `youtube_url` varchar(255) NOT NULL,
  `header_bussines_hour` varchar(160) NOT NULL,
  `time_bussines_hour` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_settings`
--

INSERT INTO `tb_settings` (`id`, `website_name`, `phone_number1`, `phone_number2`, `email1`, `email2`, `address`, `maps`, `logo`, `facebook_url`, `instagram_url`, `youtube_url`, `header_bussines_hour`, `time_bussines_hour`, `created_at`, `updated_at`) VALUES
(1, 'JeWePe Wedding', '089609211312', '085185739546', 'assyifa1212@gmail.com', 'asipa@gmail.com', 'Jl. Mawar I no. 29 Pondok Cina Depok', '<iframe class=\"w-100 rounded\"\r\n                    src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3001156.4288297426!2d-78.01371936852176!3d42.72876761954724!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4ccc4bf0f123a5a9%3A0xddcfc6c1de189567!2sNew%20York%2C%20USA!5e0!3m2!1sen!2sbd!4v1603794290143!5m2!1sen!2sbd\"\r\n                    frameborder=\"0\" style=\"height: 100%; min-height: 300px; border:0;\" allowfullscreen=\"\" aria-hidden=\"false\"\r\n                    tabindex=\"0\"></iframe>', '11zon_cropped.png', 'https://www.facebook.com/', 'https://www.instagram.com/', 'https://www.youtube.com/', 'Senin-Minggu', '00.00-23.59', '2024-07-01 08:59:26', '2024-07-29 08:58:38');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `user_id` int(5) NOT NULL,
  `name` varchar(80) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`user_id`, `name`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Admin Syifa', 'asipa@gmail.com', '$2y$10$5N.YjGwEz9TIBMvXIwmtZeOOhEOVfnkR4s1SrNGMPBKJ/xNbP6xqu', '2024-06-29 14:10:02', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_catalogues`
--
ALTER TABLE `tb_catalogues`
  ADD PRIMARY KEY (`catalogue_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `catalogue_id` (`catalogue_id`);

--
-- Indexes for table `tb_settings`
--
ALTER TABLE `tb_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_catalogues`
--
ALTER TABLE `tb_catalogues`
  MODIFY `catalogue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_settings`
--
ALTER TABLE `tb_settings`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `user_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_catalogues`
--
ALTER TABLE `tb_catalogues`
  ADD CONSTRAINT `user_id_catalogue_idx` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD CONSTRAINT `catalogue_id_order_idx` FOREIGN KEY (`catalogue_id`) REFERENCES `tb_catalogues` (`catalogue_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
