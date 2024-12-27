-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2024 at 02:15 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bid`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `twofa_code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `twofa_code`) VALUES
(1, 'admin', 'admin123', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `bid_amount` decimal(10,2) NOT NULL,
  `bid_time` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`id`, `user_id`, `product_id`, `bid_amount`, `bid_time`) VALUES
(15, 7, 24, '99999999.99', '2024-12-04 15:22:43'),
(16, 8, 23, '20000009.00', '2024-12-04 15:28:11'),
(18, 10, 29, '123000.00', '2024-12-06 10:50:02'),
(19, 15, 47, '10001.00', '2024-12-06 16:40:23'),
(22, 16, 49, '1000.00', '2024-12-06 17:03:53'),
(23, 15, 49, '1000.00', '2024-12-06 17:04:26');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` text,
  `starting_bid` decimal(10,2) NOT NULL,
  `bid_end_time` datetime NOT NULL,
  `status` enum('active','expired') DEFAULT 'active',
  `image_url` varchar(255) DEFAULT NULL,
  `seller_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_bidded` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `description`, `starting_bid`, `bid_end_time`, `status`, `image_url`, `seller_id`, `created_at`, `updated_at`, `is_bidded`) VALUES
(19, 'Tawesome  Products', 'fGold Steel fGol d Steel d Steel', '300.00', '2083-02-15 14:15:00', 'active', 'uploads/Untitled (1)-Photoroom.png', 1, '2024-11-25 17:57:31', '2024-12-05 12:15:04', 1),
(21, 'Tambay Cap', 'Water proff', '400000.00', '2024-11-28 07:56:00', 'expired', 'uploads/tambaycap.jpg', 1, '2024-11-27 23:55:03', '2024-11-28 09:02:38', 1),
(23, 'Rolex GMT MASTER', 'A Flameboyant Eye', '2000000.00', '2026-02-15 14:15:00', 'active', 'uploads/gmt-master-gold.webp', 1, '2024-12-04 05:05:11', '2024-12-06 02:53:09', 1),
(24, 'Rolex DYTORA', 'A Flameboyant Eye Tiger', '3000000.00', '2026-02-17 14:02:00', 'active', 'uploads/dy.jpg', 1, '2024-12-04 05:07:29', '2024-12-04 07:52:50', 1),
(25, 'Art Baselâ€™s Biennial Fair', '.', '12000000.00', '2026-02-15 14:14:00', 'active', 'uploads/ba.webp', 1, '2024-12-04 05:16:17', '2024-12-04 05:16:17', 0),
(26, 'Tambay Cap V.2.4 1', 'Water Proff Pwede sa Upaw ', '67000.00', '2026-12-03 14:22:00', 'active', 'uploads/tambaycap.jpg', 1, '2024-12-04 07:51:36', '2024-12-06 02:40:24', 0),
(27, 'Labog Halamang Gamot', 'Good Item Barato lang rush', '5000.00', '2025-12-04 14:02:00', 'active', 'uploads/mariwana.jpg', 1, '2024-12-05 12:11:15', '2024-12-06 02:41:17', 0),
(28, 'Cocaine', '.', '1000.00', '2024-12-06 10:45:00', 'active', 'uploads/OIP.jpg', 1, '2024-12-06 02:44:26', '2024-12-06 02:44:40', 1),
(29, 'Cocaine', 'Good Item Barato lang rush', '1000.00', '2024-12-06 10:51:00', 'active', 'uploads/OIP.jpg', 1, '2024-12-06 02:49:28', '2024-12-06 02:50:02', 1),
(30, 'Delta 45', '.', '2000.00', '2029-02-15 14:22:00', 'active', 'uploads/OIP (1).jpg', 1, '2024-12-06 03:01:12', '2024-12-06 03:01:12', 0),
(31, '1903 Cion', '.', '800000.00', '2027-02-16 14:22:00', 'active', 'uploads/th.jpg', 1, '2024-12-06 03:03:31', '2024-12-06 03:51:40', 1),
(32, '1860 PH map', '.', '50000.00', '2040-02-15 01:01:00', 'active', 'uploads/5527d8fadc261fc1a80be780e1293b8f.jpg', 1, '2024-12-06 03:10:09', '2024-12-06 03:10:09', 0),
(33, 'Cocaine', '.', '8000.00', '2026-02-15 14:22:00', 'active', 'uploads/OIP.jpg', 1, '2024-12-06 03:11:03', '2024-12-06 03:11:03', 0),
(34, '1902 Calendar', '.', '90000.00', '2028-02-15 14:22:00', 'active', 'uploads/OIP (2).jpg', 1, '2024-12-06 03:12:23', '2024-12-06 03:12:23', 0),
(35, 'Golden Shoe', '.', '1000.00', '2027-02-15 14:22:00', 'active', 'uploads/OIP (3).jpg', 1, '2024-12-06 03:14:14', '2024-12-06 03:15:41', 0),
(36, 'Monalisa painting', '.', '900.00', '2027-02-15 14:22:00', 'active', 'uploads/OIP (4).jpg', 1, '2024-12-06 03:17:30', '2024-12-06 03:17:30', 0),
(37, 'Iron Sleppers ', '. ', '800.00', '2090-02-15 01:11:00', 'active', 'uploads/0l0nw0qpetp41.jpg', 1, '2024-12-06 03:19:39', '2024-12-06 03:51:22', 1),
(38, 'Gold Bulion', '.', '102000.00', '2027-02-15 14:22:00', 'active', 'uploads/download.jpg', 1, '2024-12-06 03:33:30', '2024-12-06 03:33:30', 0),
(39, 'Gold Rings', '.', '400000.00', '2029-02-15 14:22:00', 'active', 'uploads/OIP (5).jpg', 1, '2024-12-06 03:34:59', '2024-12-06 03:34:59', 0),
(40, 'Humaniod', '.', '20000.00', '2029-02-16 14:22:00', 'active', 'uploads/OIP (6).jpg', 1, '2024-12-06 03:36:22', '2024-12-06 03:36:22', 0),
(41, 'Nocler Bomb', '.', '10000.00', '2029-02-15 14:22:00', 'active', 'uploads/R (1).jpg', 1, '2024-12-06 03:39:39', '2024-12-06 03:39:39', 0),
(42, 'Robot Dog', '.', '2000.00', '2028-02-16 14:22:00', 'active', 'uploads/OIP (7).jpg', 1, '2024-12-06 03:40:49', '2024-12-06 03:40:49', 0),
(43, 'Lafirary 2013', '.', '1000090.00', '2028-02-15 14:22:00', 'active', 'uploads/download (2).jpg', 1, '2024-12-06 03:42:00', '2024-12-06 03:42:00', 0),
(44, 'Philipines', '.', '29999999.00', '2029-02-15 14:22:00', 'active', 'uploads/OIP (8).jpg', 1, '2024-12-06 03:45:09', '2024-12-06 08:49:37', 1),
(45, 'Long Coco Island', '.', '99999999.99', '2029-02-15 14:22:00', 'active', 'uploads/OIP (9).jpg', 1, '2024-12-06 03:47:46', '2024-12-06 03:47:46', 0),
(46, 'Pyramid', '.', '20000000.00', '2028-02-15 14:22:00', 'active', 'uploads/OIP (10).jpg', 1, '2024-12-06 03:49:19', '2024-12-06 03:49:19', 0),
(47, 'r', 'f', '1234.00', '2024-12-09 15:33:00', 'active', 'uploads/download (2).jpg', 1, '2024-12-06 08:39:26', '2024-12-06 08:40:23', 1),
(48, 'Cocaine', '.', '1500.00', '2024-12-09 17:55:00', 'active', 'uploads/0l0nw0qpetp41.jpg', 1, '2024-12-06 08:47:16', '2024-12-06 08:47:16', 0),
(49, 'Sports car', '.', '1000.00', '2024-12-07 03:33:00', 'active', 'uploads/download (2).jpg', 1, '2024-12-06 09:02:07', '2024-12-06 09:03:03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL,
  `user_type` enum('user','admin') NOT NULL,
  `reply_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `review_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reply` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `review_text`, `created_at`, `updated_at`, `reply`) VALUES
(3, 1, 'mga Scammer kayu walng kwenta', '2024-11-18 07:03:43', '2024-12-04 07:30:02', NULL),
(13, 5, 'Scam!!', '2024-12-01 12:04:34', '2024-12-05 11:56:18', 'Sorry!'),
(14, 5, 'Scammer Walang kenta.', '2024-12-01 12:04:51', '2024-12-01 12:04:51', NULL),
(16, 7, '100% Scam!', '2024-12-04 07:25:03', '2024-12-04 07:25:03', NULL),
(17, 8, 'Scammer', '2024-12-04 07:28:36', '2024-12-04 07:28:36', NULL),
(18, 10, 'Fake!!', '2024-12-05 02:22:39', '2024-12-05 02:22:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `gender`, `age`, `address`, `email`, `password`, `created_at`) VALUES
(1, 'Mike', 'Garde', 'male', 18, 'Banga South Cotabato', 'gardemichaeljude@gmail.com', '$2y$10$ytvq2gVzgO46Gjum2Oc3v.MsmdZHKc6EKbULs9a2Gk0oaf6JPPYLi', '2024-10-27 04:15:45'),
(4, 'Kerbys', 'Caraz', 'male', 14, 'Banga South Cotabato', 'kerby@gmail.com', '$2y$10$wmM4rVprkAYMtdrdG1tCr.AqTJCzpd.xIfjoBmWvtI42WXi6dt3n6', '2024-11-04 02:46:22'),
(5, 'Michael', 'Garde', 'male', 19, '0', 'garde@gmail.com', '$2y$10$C/iPRNM3shqAPQIw21.62.J2rKuHrl4jaUER.OC8ldglAOvVwpdxm', '2024-11-28 12:40:54'),
(6, 'Rio', 'Rodrigo', 'male', 19, '0', 'kerbys@gmail.com', '$2y$10$oeo4YDVSKskBoDHgTbe11.cxwA73x.7oahKf6WONLW.FL6oq8AYMu', '2024-12-03 23:25:10'),
(7, 'Ann', 'Curtise', 'female', 122, 'Banga South Cotabato', 'anna@gmail.com', '$2y$10$0gbHsMHliojmiac7sObax.VecHCrEZhVvMmzMZPfdk/lIzKPc3AZW', '2024-12-04 07:21:51'),
(8, 'Bea', 'Rodreguez', 'female', 20, '0', 'bea@gmail.com', '$2y$10$0v9yR1o43UTgckzcOzbbj.2k8LHsrVlKtRUbmviESJ8hUQY60GUbm', '2024-12-04 07:27:42'),
(9, 'Kerby', 'Caraz', 'male', 20, '0', 'kerby1@gmail.com', '$2y$10$IEILfCVvrfvQ7Mz3EY1N.OkHQZiZFfiwqrvj7Yvyrn1x2LyR/rHRi', '2024-12-04 07:37:49'),
(10, 'Alena', 'Gonzales', 'female', 19, '0', 'alena@gmail.com', '$2y$10$4tIAC8s.mXlJVU/tDVdzOuLp0Re7r8HBq1QpkYZfu.VKn560vxYzu', '2024-12-05 02:22:01'),
(12, 'AlanPeter', 'Cayetano', 'male', 20, 'Koronadal City', 'alan@gmail.com', '$2y$10$rFtEsnp5XEkiv45g4C1YMOCqYRNW7Ys/zDlnwyNOeBMycwAyBcZLa', '2024-12-05 10:58:16'),
(13, 'Gard', 'Gadegard', 'male', 20, 'Banga South Cotabato', 'lr130642100052@gmail.com', '$2y$10$LeXypoFJcDzHf.YBbv2j5./KAgOgNtjmD7UIBwhA.LVhOdktbTGr2', '2024-12-06 02:51:50'),
(14, 'Gard', 'Gadegard', 'male', 20, '0', 'lr1306421000523@gmail.com', '$2y$10$XD786xwMP2DGj4d0hA9RseRXbh3oygXhmNIhNxh7HDkuaLtPPQVj6', '2024-12-06 08:05:41'),
(15, 'Michael', 'Jude', 'male', 144, '0', 'meapps38@gmail.com', '$2y$10$G3AJszxT19ebv9vH7Dzes.eDvOQVkZzYZPdKhLqfbkMfBRJoLpure', '2024-12-06 08:08:00'),
(16, 'Michael', 'Jude', 'male', 144, 'fffff', 'meapps39@gmail.com', '$2y$10$XtNdU5XfHEk5FuXliPT2d.llxnYa8DKKLalvS4Hb2KcvwfSty9ED2', '2024-12-06 08:09:53'),
(17, 'Michael', 'Jude', 'male', 144, 'Koronadal City', 'meapps399@gmail.com', '$2y$10$D5LrPHtHJ0PJs2g7Q7sooOf0Kfby/Mvc9On/3qzok3IqUz89AAPZu', '2024-12-06 08:11:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `twofa_code` (`twofa_code`);

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_id` (`review_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bids`
--
ALTER TABLE `bids`
  ADD CONSTRAINT `bids_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bids_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
