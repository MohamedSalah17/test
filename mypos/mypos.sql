-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2020 at 02:09 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mypos`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin1', 'admin1@gm.com', NULL, '$2y$10$b5u.deUvroR4sBBot/X1SO7izYnnc4vcq6SnclNzMMfh60W93PlaS', NULL, '2020-09-13 21:40:10', '2020-09-13 21:40:10'),
(2, 'admin2', 'admin2@gm.com', NULL, '$2y$10$4GTiuppT6N127w/ZRft2heaI3pzI1lZrJy.odhL2nT5Q4KAscQU1C', NULL, '2020-09-13 21:56:44', '2020-09-13 21:56:44');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `email`, `password`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Doctor 1', 'D1@gmail.com', '$2y$10$Qnd/BdAl6Bz3VsmH7nfpYOb2v6/NmESP7dbzAMVHxMvPGn4MGmR4K', '[\"2452\",\"4242\"]', 'beni sufe', '2020-09-13 21:43:47', '2020-09-13 21:43:47'),
(2, 'Doctor 2', 'D2@gmail.com', '$2y$10$dOtg6z2wC2Etami1xBSrJumZMnUqjB022RlavqaIRvlGzNDT87qwa', '[\"4242\",\"2452\"]', 'beni sufe', '2020-09-13 21:45:11', '2020-09-13 21:45:11'),
(3, 'DDDD', 'DDDD@D.com', '$2y$10$1h655ExPvJllP5nHK0kZ7O4XWwgG.zAtrKah0W/WRBS5vn6XcyD1u', '[\"3131\",\"3113\"]', 'beni sufe', '2020-09-13 22:07:27', '2020-09-13 22:07:27');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_09_22_131102_laratrust_setup_tables', 1),
(4, '2020_09_09_225704_create_doctors_table', 1),
(5, '2020_09_09_230229_create_students_table', 1),
(6, '2020_09_09_230318_create_subjects_table', 1),
(7, '2020_09_11_144111_create_order_regists_table', 1),
(8, '2020_09_11_161259_create_subject_order_regist_table', 1),
(9, '2020_09_13_230954_create_admins_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_regists`
--

CREATE TABLE `order_regists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'create_doctors', 'Create Doctors', 'Create Doctors', '2020-09-13 21:37:17', '2020-09-13 21:37:17'),
(2, 'read_doctors', 'Read Doctors', 'Read Doctors', '2020-09-13 21:37:17', '2020-09-13 21:37:17'),
(3, 'update_doctors', 'Update Doctors', 'Update Doctors', '2020-09-13 21:37:17', '2020-09-13 21:37:17'),
(4, 'delete_doctors', 'Delete Doctors', 'Delete Doctors', '2020-09-13 21:37:18', '2020-09-13 21:37:18'),
(5, 'create_students', 'Create Students', 'Create Students', '2020-09-13 21:37:18', '2020-09-13 21:37:18'),
(6, 'read_students', 'Read Students', 'Read Students', '2020-09-13 21:37:18', '2020-09-13 21:37:18'),
(7, 'update_students', 'Update Students', 'Update Students', '2020-09-13 21:37:18', '2020-09-13 21:37:18'),
(8, 'delete_students', 'Delete Students', 'Delete Students', '2020-09-13 21:37:18', '2020-09-13 21:37:18'),
(9, 'create_subjects', 'Create Subjects', 'Create Subjects', '2020-09-13 21:37:18', '2020-09-13 21:37:18'),
(10, 'read_subjects', 'Read Subjects', 'Read Subjects', '2020-09-13 21:37:18', '2020-09-13 21:37:18'),
(11, 'update_subjects', 'Update Subjects', 'Update Subjects', '2020-09-13 21:37:18', '2020-09-13 21:37:18'),
(12, 'delete_subjects', 'Delete Subjects', 'Delete Subjects', '2020-09-13 21:37:18', '2020-09-13 21:37:18'),
(13, 'create_orders', 'Create Orders', 'Create Orders', '2020-09-13 21:37:18', '2020-09-13 21:37:18'),
(14, 'read_orders', 'Read Orders', 'Read Orders', '2020-09-13 21:37:18', '2020-09-13 21:37:18'),
(15, 'update_orders', 'Update Orders', 'Update Orders', '2020-09-13 21:37:18', '2020-09-13 21:37:18'),
(16, 'delete_orders', 'Delete Orders', 'Delete Orders', '2020-09-13 21:37:18', '2020-09-13 21:37:18'),
(17, 'create_admins', 'Create Admins', 'Create Admins', '2020-09-13 21:37:18', '2020-09-13 21:37:18'),
(18, 'read_admins', 'Read Admins', 'Read Admins', '2020-09-13 21:37:18', '2020-09-13 21:37:18'),
(19, 'update_admins', 'Update Admins', 'Update Admins', '2020-09-13 21:37:18', '2020-09-13 21:37:18'),
(20, 'delete_admins', 'Delete Admins', 'Delete Admins', '2020-09-13 21:37:19', '2020-09-13 21:37:19'),
(21, 'create_users', 'Create Users', 'Create Users', '2020-09-13 21:37:19', '2020-09-13 21:37:19'),
(22, 'read_users', 'Read Users', 'Read Users', '2020-09-13 21:37:19', '2020-09-13 21:37:19'),
(23, 'update_users', 'Update Users', 'Update Users', '2020-09-13 21:37:19', '2020-09-13 21:37:19'),
(24, 'delete_users', 'Delete Users', 'Delete Users', '2020-09-13 21:37:19', '2020-09-13 21:37:19');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(12, 1),
(12, 2),
(12, 3),
(12, 4),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(14, 1),
(14, 2),
(14, 3),
(14, 4),
(15, 1),
(15, 2),
(15, 3),
(15, 4),
(16, 1),
(16, 2),
(16, 3),
(16, 4),
(17, 1),
(17, 2),
(17, 3),
(17, 4),
(18, 1),
(18, 2),
(18, 3),
(18, 4),
(19, 1),
(19, 2),
(19, 3),
(19, 4),
(20, 1),
(20, 2),
(20, 3),
(20, 4),
(21, 1),
(21, 2),
(21, 3),
(21, 4),
(22, 1),
(22, 2),
(22, 3),
(22, 4),
(23, 1),
(23, 2),
(23, 3),
(23, 4),
(24, 1),
(24, 2),
(24, 3),
(24, 4);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_user`
--

INSERT INTO `permission_user` (`permission_id`, `user_id`, `user_type`) VALUES
(1, 1, 'App\\Admin'),
(2, 1, 'App\\Admin'),
(3, 1, 'App\\Admin'),
(4, 1, 'App\\Admin'),
(5, 1, 'App\\Admin'),
(6, 1, 'App\\Admin'),
(7, 1, 'App\\Admin'),
(8, 1, 'App\\Admin'),
(9, 1, 'App\\Admin'),
(10, 1, 'App\\Admin'),
(11, 1, 'App\\Admin'),
(12, 1, 'App\\Admin'),
(17, 1, 'App\\Admin'),
(18, 1, 'App\\Admin'),
(19, 1, 'App\\Admin'),
(20, 1, 'App\\Admin'),
(1, 2, 'App\\Admin'),
(1, 2, 'App\\User'),
(2, 2, 'App\\Admin'),
(2, 2, 'App\\User'),
(3, 2, 'App\\Admin'),
(3, 2, 'App\\User'),
(4, 2, 'App\\Admin'),
(4, 2, 'App\\User'),
(5, 2, 'App\\Admin'),
(5, 2, 'App\\User'),
(6, 2, 'App\\Admin'),
(6, 2, 'App\\User'),
(7, 2, 'App\\Admin'),
(7, 2, 'App\\User'),
(8, 2, 'App\\Admin'),
(8, 2, 'App\\User'),
(9, 2, 'App\\Admin'),
(9, 2, 'App\\User'),
(10, 2, 'App\\Admin'),
(10, 2, 'App\\User'),
(11, 2, 'App\\Admin'),
(11, 2, 'App\\User'),
(12, 2, 'App\\Admin'),
(12, 2, 'App\\User'),
(17, 2, 'App\\Admin'),
(17, 2, 'App\\User'),
(18, 2, 'App\\Admin'),
(18, 2, 'App\\User'),
(19, 2, 'App\\Admin'),
(19, 2, 'App\\User'),
(20, 2, 'App\\Admin'),
(20, 2, 'App\\User'),
(2, 3, 'App\\Doctor'),
(2, 3, 'App\\User'),
(6, 3, 'App\\Doctor'),
(6, 3, 'App\\User'),
(7, 3, 'App\\Doctor'),
(7, 3, 'App\\User'),
(10, 3, 'App\\Doctor'),
(10, 3, 'App\\User'),
(11, 3, 'App\\Doctor'),
(11, 3, 'App\\User'),
(18, 3, 'App\\Doctor'),
(2, 4, 'App\\User'),
(6, 4, 'App\\User'),
(7, 4, 'App\\User'),
(10, 4, 'App\\User'),
(11, 4, 'App\\User'),
(2, 5, 'App\\User'),
(6, 5, 'App\\User'),
(10, 5, 'App\\User'),
(2, 6, 'App\\User'),
(6, 6, 'App\\User'),
(10, 6, 'App\\User'),
(1, 7, 'App\\User'),
(2, 7, 'App\\User'),
(3, 7, 'App\\User'),
(4, 7, 'App\\User'),
(5, 7, 'App\\User'),
(6, 7, 'App\\User'),
(7, 7, 'App\\User'),
(8, 7, 'App\\User'),
(9, 7, 'App\\User'),
(10, 7, 'App\\User'),
(11, 7, 'App\\User'),
(12, 7, 'App\\User'),
(17, 7, 'App\\User'),
(18, 7, 'App\\User'),
(19, 7, 'App\\User'),
(20, 7, 'App\\User'),
(2, 8, 'App\\User'),
(6, 8, 'App\\User'),
(7, 8, 'App\\User'),
(10, 8, 'App\\User'),
(11, 8, 'App\\User'),
(18, 8, 'App\\User');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'Super Admin', 'Super Admin', '2020-09-13 21:37:17', '2020-09-13 21:37:17'),
(2, 'admin', 'Admin', 'Admin', '2020-09-13 21:37:21', '2020-09-13 21:37:21'),
(3, 'doctor', 'Doctor', 'Doctor', '2020-09-13 21:37:24', '2020-09-13 21:37:24'),
(4, 'student', 'Student', 'Student', '2020-09-13 21:37:25', '2020-09-13 21:37:25'),
(5, 'user', 'user', 'can do some tasks in the project', '2020-09-13 21:37:27', '2020-09-13 21:37:27');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(1, 1, 'App\\User'),
(2, 1, 'App\\Admin'),
(2, 2, 'App\\Admin'),
(5, 2, 'App\\User'),
(3, 3, 'App\\Doctor'),
(5, 3, 'App\\User'),
(5, 4, 'App\\User'),
(5, 5, 'App\\User'),
(5, 6, 'App\\User'),
(5, 7, 'App\\User'),
(5, 8, 'App\\User');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `code`, `email`, `password`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'student 1', '11123', 's1@gm.com', '$2y$10$Cjac9VCrC4LfId240MFM9.Y0XjrvB4DwIeSvFuSYIZUbw0qF6SDvW', '[\"42245\",\"2422\"]', 'beni sufe', '2020-09-13 21:54:15', '2020-09-13 21:54:15'),
(2, 'student 2', '160133', 's2@gm.com', '$2y$10$PllJInG9iCLvTMb7MeB0tec9kJYNyL8n6iqHvsCff.n2g8yg8Db2W', '[\"4222\",\"2422\"]', 'beni sufe', '2020-09-13 21:55:08', '2020-09-13 21:55:08');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doc_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sbj_num` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `doc_id`, `name`, `code`, `sbj_num`, `created_at`, `updated_at`) VALUES
(1, 1, 'GIS', 'GIS849', 1, '2020-09-13 21:45:34', '2020-09-13 21:45:34'),
(2, 2, 'DDB', 'DD43', 1, '2020-09-13 21:45:56', '2020-09-13 21:45:56');

-- --------------------------------------------------------

--
-- Table structure for table `subject_order_regist`
--

CREATE TABLE `subject_order_regist` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'super admin', 'super_admin@app.com', NULL, '$2y$10$cyeNu6NcQ2ohwuFwdLWuY.BgKPK36ahAwWrNGeZjtYSo2nmcLghDq', NULL, '2020-09-13 21:37:27', '2020-09-13 21:37:27'),
(2, 'admin1', 'admin1@gm.com', NULL, '$2y$10$AVJevFsMLFfRvAxGoU3Z8ujRPmCi5.k5pGVol1B0Gzy84VCKZukai', NULL, '2020-09-13 21:40:12', '2020-09-13 21:40:12'),
(3, 'Doctor 1', 'D1@gmail.com', NULL, '$2y$10$kf6hUM6YorzQ.DQGVlDmK..BWq5RAv.YqI2BUHp3psdlVMTaQH3B.', NULL, '2020-09-13 21:43:47', '2020-09-13 21:43:47'),
(4, 'Doctor 2', 'D2@gmail.com', NULL, '$2y$10$ItDfabkIbt3dT5yyPLY9Rud8p6QAEyCP7rfGNArg9y5p8MafYTMsS', NULL, '2020-09-13 21:45:11', '2020-09-13 21:45:11'),
(5, 'student 1', 's1@gm.com', NULL, '$2y$10$08licjr7SRdxlEbvkRnGvOcqh2nbvVWI8UlnEcQ6wpBay3YdM0Dvu', NULL, '2020-09-13 21:54:15', '2020-09-13 21:54:15'),
(6, 'student 2', 's2@gm.com', NULL, '$2y$10$9YetnXNHEx3od0XGPw0/TO5HR9KKwKPO3IiLud9lFMjCe6AUa1sxu', NULL, '2020-09-13 21:55:08', '2020-09-13 21:55:08'),
(7, 'admin2', 'admin2@gm.com', NULL, '$2y$10$daufcjH5VufOTF7fvDPwI.B.oITKrgaeUyge4B0H2PaBzb5b7gyaW', NULL, '2020-09-13 21:56:46', '2020-09-13 21:56:46'),
(8, 'DDDD', 'DDDD@D.com', NULL, '$2y$10$8TzhajF1XFKjF71XY5gtseig.QMX7Uz2aL7HbQ6u/QFOAaFVbDWQ.', NULL, '2020-09-13 22:07:27', '2020-09-13 22:07:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doctors_email_unique` (`email`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_regists`
--
ALTER TABLE `order_regists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_regists_student_id_foreign` (`student_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_email_unique` (`email`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_doc_id_foreign` (`doc_id`);

--
-- Indexes for table `subject_order_regist`
--
ALTER TABLE `subject_order_regist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_order_regist_subject_id_foreign` (`subject_id`),
  ADD KEY `subject_order_regist_order_id_foreign` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_regists`
--
ALTER TABLE `order_regists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subject_order_regist`
--
ALTER TABLE `subject_order_regist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_regists`
--
ALTER TABLE `order_regists`
  ADD CONSTRAINT `order_regists_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_doc_id_foreign` FOREIGN KEY (`doc_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_order_regist`
--
ALTER TABLE `subject_order_regist`
  ADD CONSTRAINT `subject_order_regist_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order_regists` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_order_regist_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
