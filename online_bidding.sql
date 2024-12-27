-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 24, 2024 at 10:28 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_bidding`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '827ccb0eea8a706c4c34a16891f84e7b');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `age` int(11) NOT NULL CHECK (`age` > 0),
  `gender` enum('Male','Female') NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `valid_id_front` varchar(255) NOT NULL,
  `valid_id_back` varchar(255) NOT NULL,
  `status` enum('Pending','Approved') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `address`, `age`, `gender`, `email`, `password`, `photo`, `valid_id_front`, `valid_id_back`, `status`, `created_at`) VALUES
(1, 'df', 'dfd', 'faaf', 223, 'Male', 'a@g.com', '1234', 'uploads/Screenshot_2024-12-23_18_49_34.png', 'uploads/Screenshot_2024-12-23_18_49_34.png', 'uploads/Screenshot_2024-12-23_18_49_34.png', 'Approved', '2024-12-24 03:10:47'),
(2, 'fsfs fds', 'fdsf', 'sfsd', 234, 'Male', '0', '23421434', 'uploads/Screenshot_2024-12-23_18_49_34.png', 'uploads/Screenshot_2024-12-23_18_49_29.png', 'uploads/Screenshot_2024-12-23_18_25_05.png', 'Pending', '2024-12-24 03:11:58'),
(4, 'fsf', 'dsf', 'dsfsd', 34, 'Female', 'a@gamil.com', 'YPgW^@q5x5%p@;]', 'uploads/Screenshot_2024-12-23_18_49_34.png', 'uploads/Screenshot_2024-12-23_22_04_45.png', 'uploads/Screenshot_2024-12-23_18_49_34.png', 'Pending', '2024-12-24 03:13:32'),
(5, 'Mike', 'ffa', 'dfas', 22, 'Male', 'aas@huj.com', 'YPgW^@q5x5%p@;]', 'uploads/Screenshot_2024-12-23_18_49_34.png', 'uploads/Screenshot_2024-12-23_18_49_34.png', 'uploads/Screenshot_2024-12-23_18_49_34.png', 'Pending', '2024-12-24 03:16:28'),
(6, 'fsf', 'sfs', 'sa', 22, 'Male', 'a@g.g', 'ffff', 'uploads/Screenshot_2024-12-23_18_49_29.png', 'uploads/Screenshot_2024-12-23_18_49_29.png', 'uploads/Screenshot_2024-12-23_18_49_29.png', 'Pending', '2024-12-24 03:17:29'),
(7, 'dsd', 'ds', 'fsfgs', 22, 'Male', 'a@g.gf', 'YPgW^@q5x5%p@;]', 'uploads/Screenshot_2024-12-23_18_49_29.png', 'uploads/Screenshot_2024-12-23_18_49_29.png', 'uploads/Screenshot_2024-12-23_18_49_29.png', 'Pending', '2024-12-24 03:18:07'),
(8, 'aaa', 'aa', 'ad', 112, 'Female', 'a@gggg.c', '11111', 'uploads/Screenshot_2024-12-23_18_49_34.png', 'uploads/Screenshot_2024-12-23_18_49_34.png', 'uploads/Screenshot_2024-12-23_18_49_34.png', 'Pending', '2024-12-24 09:18:06'),
(9, 'ff', 'ff', 'zz', 99, 'Male', 'a@g.bb', 'YPgW^@q5x5%p@;]1', 'uploads/Screenshot_2024-12-23_18_49_29.png', 'uploads/Screenshot_2024-12-23_18_49_29.png', 'uploads/Screenshot_2024-12-23_18_49_29.png', 'Pending', '2024-12-24 09:20:45'),
(10, 'ffdffdfdfd', 'dffdfdfdf', 'bs', 2222, 'Male', 'a@ffffrfff.c', 'YPgW^@q5x5%p@;]', 'uploads/Screenshot_2024-12-23_18_49_29.png', 'uploads/Screenshot_2024-12-23_18_49_29.png', 'uploads/Screenshot_2024-12-23_18_49_29.png', 'Pending', '2024-12-24 09:22:18'),
(11, 'gfdgdgdgf', 'gfdgdgd', 'xgdg', 22, 'Male', 'a@g.ghdgfhdh', 'YPgW^@q5x5%p@;]', 'uploads/Screenshot_2024-12-23_18_25_05.png', 'uploads/Screenshot_2024-12-23_18_25_05.png', 'uploads/Screenshot_2024-12-23_18_49_29.png', 'Pending', '2024-12-24 09:25:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
