-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2020 at 12:58 AM
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
(2, 'Ahmed Salah', 'asm@gm.com', NULL, '$2y$10$78/356HXmJTaJAtAw9VbOOIXz83pAd4YTpsLSa56xx3ED.Ro9uk0.', NULL, '2020-09-25 19:45:51', '2020-09-25 20:56:55');

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `sbj_id` int(11) DEFAULT NULL,
  `doc_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `pdf_quest` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pdf_anss` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `lesson_id`, `sbj_id`, `doc_id`, `name`, `start_date`, `end_date`, `pdf_quest`, `pdf_anss`, `created_at`, `updated_at`) VALUES
(4, 9, NULL, NULL, 'G L1 Assignment', '2020-09-09', '2020-09-17', '1601039423.pdf', NULL, '2020-09-25 11:10:23', '2020-09-25 11:10:23'),
(5, 16, NULL, NULL, 'SE L1 Assignment', '2020-09-10', '2020-09-20', '1601067411.pdf', NULL, '2020-09-25 18:56:51', '2020-09-25 18:56:51'),
(6, 15, NULL, NULL, 'SAD L1 Assignment', '2020-09-15', '2020-09-25', '1601069022.pdf', NULL, '2020-09-25 18:57:47', '2020-09-25 19:23:42'),
(7, 14, NULL, NULL, 'PM L1 Assignment', '2020-09-20', '2020-09-30', '1601067587.pdf', NULL, '2020-09-25 18:59:47', '2020-09-25 18:59:47'),
(8, 13, NULL, NULL, 'ISS L1 Assignment', '2020-09-25', '2020-10-05', '1601067635.pdf', NULL, '2020-09-25 19:00:35', '2020-09-25 19:00:35'),
(9, 10, NULL, NULL, 'NA L1 Assignment', '2020-09-16', '2020-10-06', '1601068735.pdf', NULL, '2020-09-25 19:02:15', '2020-09-25 19:18:55');

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
(4, 'Mahmoud Sayed', 'ms@gmail.com', '$2y$10$gTlDSPIPwceCEnfgAPT0bOn8IJAZgDfuyZ1gStNea6uv70Rfz6WJW', '[\"3414\",\"14141\"]', 'beni sufe', '2020-09-21 15:08:14', '2020-09-21 15:08:14'),
(6, 'Salah Mahmoud', 'sm@gm.com', '$2y$10$nDm9xSeeq22Lxn5pM7Wa5.zcifZ05XcMA26BheBIrP2M8eWHfT8GO', '[\"34151\",\"34115\"]', 'beni suef', '2020-09-23 09:53:29', '2020-09-23 09:53:29'),
(7, 'Ali Mahmoud', 'am@gm.com', '$2y$10$MXCTWCuYXmiFPvwtKU1k7ewQ.quPb5XU7AffKlBCRe9CjgU0ViVZ.', '[\"2542\",\"2452\"]', 'beni suef', '2020-09-23 09:55:05', '2020-09-23 09:55:05'),
(8, 'Mohamed Mahmoud', 'mm@gmail.com', '$2y$10$zbZOE6IKe5svvmBGvSwLiOO0SgJzWTfpcLjGzgt/qorR9m732T0sG', '[\"1341\",\"1141\"]', 'beni suef', '2020-09-23 09:56:41', '2020-09-23 09:56:41');

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sbj_id` bigint(20) UNSIGNED NOT NULL,
  `doc_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `pdf_file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pptx_file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `sbj_id`, `doc_id`, `name`, `date`, `pdf_file`, `pptx_file`, `youtube_link`, `created_at`, `updated_at`) VALUES
(9, 5, NULL, 'G Lesson 1', '2020-09-10', '1601037383.pdf', '1601037383.pptx', 'https://youtu.be/0JiP8jSFT3E', '2020-09-25 10:36:23', '2020-09-25 10:36:23'),
(10, 10, NULL, 'NA Lesson 1', '2020-09-09', '1601064831.pdf', '1601064831.pptx', 'https://youtu.be/0JiP8jSFT3E', '2020-09-25 18:13:51', '2020-09-25 18:13:51'),
(11, 10, NULL, 'NA Lesson 2', '2020-09-16', '1601064873.pdf', '1601064873.pptx', 'https://youtu.be/0JiP8jSFT3E', '2020-09-25 18:14:33', '2020-09-25 18:14:33'),
(12, 9, NULL, 'SA Lesson 1', '2020-09-09', '1601064949.pdf', '1601064949.pptx', 'https://youtu.be/0JiP8jSFT3E', '2020-09-25 18:15:49', '2020-09-25 18:15:49'),
(13, 8, NULL, 'ISS Lesson 1', '2020-09-11', '1601064986.pdf', '1601064986.pptx', 'https://youtu.be/0JiP8jSFT3E', '2020-09-25 18:16:26', '2020-09-25 18:16:26'),
(14, 7, NULL, 'PM Lesson 1', '2020-09-12', '1601065199.pdf', '1601065199.pptx', 'https://youtu.be/0JiP8jSFT3E', '2020-09-25 18:19:59', '2020-09-25 18:19:59'),
(15, 6, NULL, 'SAD Lesson 1', '2020-09-13', '1601068014.pdf', '1601068014.pptx', 'https://youtu.be/0JiP8jSFT3E', '2020-09-25 18:20:59', '2020-09-25 19:06:54'),
(16, 4, NULL, 'SE Lesson 1', '2020-09-14', '1601065349.pdf', '1601065349.pptx', 'https://youtu.be/0JiP8jSFT3E', '2020-09-25 18:22:29', '2020-09-25 18:22:29');

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
(7, '2020_09_13_230954_create_admins_table', 1),
(8, '2020_09_15_144505_create_lessons_table', 1),
(9, '2020_09_15_174508_create_assignments_table', 1),
(10, '2020_09_18_225044_create_student_subjects_table', 1),
(11, '2020_09_19_142149_create_student_assignments_table', 1);

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
(1, 'create_doctors', 'Create Doctors', 'Create Doctors', '2020-09-19 17:00:55', '2020-09-19 17:00:55'),
(2, 'read_doctors', 'Read Doctors', 'Read Doctors', '2020-09-19 17:00:55', '2020-09-19 17:00:55'),
(3, 'update_doctors', 'Update Doctors', 'Update Doctors', '2020-09-19 17:00:55', '2020-09-19 17:00:55'),
(4, 'delete_doctors', 'Delete Doctors', 'Delete Doctors', '2020-09-19 17:00:55', '2020-09-19 17:00:55'),
(5, 'create_students', 'Create Students', 'Create Students', '2020-09-19 17:00:55', '2020-09-19 17:00:55'),
(6, 'read_students', 'Read Students', 'Read Students', '2020-09-19 17:00:55', '2020-09-19 17:00:55'),
(7, 'update_students', 'Update Students', 'Update Students', '2020-09-19 17:00:55', '2020-09-19 17:00:55'),
(8, 'delete_students', 'Delete Students', 'Delete Students', '2020-09-19 17:00:55', '2020-09-19 17:00:55'),
(9, 'create_subjects', 'Create Subjects', 'Create Subjects', '2020-09-19 17:00:55', '2020-09-19 17:00:55'),
(10, 'read_subjects', 'Read Subjects', 'Read Subjects', '2020-09-19 17:00:55', '2020-09-19 17:00:55'),
(11, 'update_subjects', 'Update Subjects', 'Update Subjects', '2020-09-19 17:00:55', '2020-09-19 17:00:55'),
(12, 'delete_subjects', 'Delete Subjects', 'Delete Subjects', '2020-09-19 17:00:56', '2020-09-19 17:00:56'),
(13, 'create_lessons', 'Create Lessons', 'Create Lessons', '2020-09-19 17:00:56', '2020-09-19 17:00:56'),
(14, 'read_lessons', 'Read Lessons', 'Read Lessons', '2020-09-19 17:00:56', '2020-09-19 17:00:56'),
(15, 'update_lessons', 'Update Lessons', 'Update Lessons', '2020-09-19 17:00:56', '2020-09-19 17:00:56'),
(16, 'delete_lessons', 'Delete Lessons', 'Delete Lessons', '2020-09-19 17:00:56', '2020-09-19 17:00:56'),
(17, 'create_assignments', 'Create Assignments', 'Create Assignments', '2020-09-19 17:00:56', '2020-09-19 17:00:56'),
(18, 'read_assignments', 'Read Assignments', 'Read Assignments', '2020-09-19 17:00:56', '2020-09-19 17:00:56'),
(19, 'update_assignments', 'Update Assignments', 'Update Assignments', '2020-09-19 17:00:56', '2020-09-19 17:00:56'),
(20, 'delete_assignments', 'Delete Assignments', 'Delete Assignments', '2020-09-19 17:00:56', '2020-09-19 17:00:56'),
(21, 'create_stdassign', 'Create Stdassign', 'Create Stdassign', '2020-09-19 17:00:56', '2020-09-19 17:00:56'),
(22, 'read_stdassign', 'Read Stdassign', 'Read Stdassign', '2020-09-19 17:00:56', '2020-09-19 17:00:56'),
(23, 'update_stdassign', 'Update Stdassign', 'Update Stdassign', '2020-09-19 17:00:56', '2020-09-19 17:00:56'),
(24, 'delete_stdassign', 'Delete Stdassign', 'Delete Stdassign', '2020-09-19 17:00:56', '2020-09-19 17:00:56'),
(25, 'create_regist', 'Create Regist', 'Create Regist', '2020-09-19 17:00:56', '2020-09-19 17:00:56'),
(26, 'read_regist', 'Read Regist', 'Read Regist', '2020-09-19 17:00:56', '2020-09-19 17:00:56'),
(27, 'update_regist', 'Update Regist', 'Update Regist', '2020-09-19 17:00:57', '2020-09-19 17:00:57'),
(28, 'delete_regist', 'Delete Regist', 'Delete Regist', '2020-09-19 17:00:57', '2020-09-19 17:00:57'),
(29, 'create_admins', 'Create Admins', 'Create Admins', '2020-09-19 17:00:57', '2020-09-19 17:00:57'),
(30, 'read_admins', 'Read Admins', 'Read Admins', '2020-09-19 17:00:57', '2020-09-19 17:00:57'),
(31, 'update_admins', 'Update Admins', 'Update Admins', '2020-09-19 17:00:57', '2020-09-19 17:00:57'),
(32, 'delete_admins', 'Delete Admins', 'Delete Admins', '2020-09-19 17:00:57', '2020-09-19 17:00:57'),
(33, 'create_users', 'Create Users', 'Create Users', '2020-09-19 17:00:57', '2020-09-19 17:00:57'),
(34, 'read_users', 'Read Users', 'Read Users', '2020-09-19 17:00:57', '2020-09-19 17:00:57'),
(35, 'update_users', 'Update Users', 'Update Users', '2020-09-19 17:00:57', '2020-09-19 17:00:57'),
(36, 'delete_users', 'Delete Users', 'Delete Users', '2020-09-19 17:00:57', '2020-09-19 17:00:57');

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
(24, 4),
(25, 1),
(25, 2),
(25, 3),
(25, 4),
(26, 1),
(26, 2),
(26, 3),
(26, 4),
(27, 1),
(27, 2),
(27, 3),
(27, 4),
(28, 1),
(28, 2),
(28, 3),
(28, 4),
(29, 1),
(29, 2),
(29, 3),
(29, 4),
(30, 1),
(30, 2),
(30, 3),
(30, 4),
(31, 1),
(31, 2),
(31, 3),
(31, 4),
(32, 1),
(32, 2),
(32, 3),
(32, 4),
(33, 1),
(33, 2),
(33, 3),
(33, 4),
(34, 1),
(34, 2),
(34, 3),
(34, 4),
(35, 1),
(35, 2),
(35, 3),
(35, 4),
(36, 1),
(36, 2),
(36, 3),
(36, 4);

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
(2, 1, 'App\\Doctor'),
(2, 1, 'App\\Student'),
(2, 1, 'App\\User'),
(6, 1, 'App\\Doctor'),
(6, 1, 'App\\Student'),
(6, 1, 'App\\User'),
(10, 1, 'App\\Doctor'),
(10, 1, 'App\\Student'),
(10, 1, 'App\\User'),
(13, 1, 'App\\Doctor'),
(13, 1, 'App\\User'),
(14, 1, 'App\\Doctor'),
(14, 1, 'App\\Student'),
(14, 1, 'App\\User'),
(15, 1, 'App\\Doctor'),
(15, 1, 'App\\User'),
(16, 1, 'App\\Doctor'),
(16, 1, 'App\\User'),
(17, 1, 'App\\Doctor'),
(17, 1, 'App\\User'),
(18, 1, 'App\\Doctor'),
(18, 1, 'App\\Student'),
(18, 1, 'App\\User'),
(19, 1, 'App\\Doctor'),
(19, 1, 'App\\User'),
(20, 1, 'App\\Doctor'),
(20, 1, 'App\\User'),
(21, 1, 'App\\Student'),
(22, 1, 'App\\Doctor'),
(22, 1, 'App\\Student'),
(22, 1, 'App\\User'),
(23, 1, 'App\\Student'),
(26, 1, 'App\\Doctor'),
(26, 1, 'App\\User'),
(30, 1, 'App\\Student'),
(1, 2, 'App\\Admin'),
(2, 2, 'App\\Admin'),
(2, 2, 'App\\Doctor'),
(2, 2, 'App\\Student'),
(2, 2, 'App\\User'),
(3, 2, 'App\\Admin'),
(4, 2, 'App\\Admin'),
(5, 2, 'App\\Admin'),
(6, 2, 'App\\Admin'),
(6, 2, 'App\\Doctor'),
(6, 2, 'App\\Student'),
(6, 2, 'App\\User'),
(7, 2, 'App\\Admin'),
(8, 2, 'App\\Admin'),
(9, 2, 'App\\Admin'),
(10, 2, 'App\\Admin'),
(10, 2, 'App\\Doctor'),
(10, 2, 'App\\Student'),
(10, 2, 'App\\User'),
(11, 2, 'App\\Admin'),
(12, 2, 'App\\Admin'),
(13, 2, 'App\\Admin'),
(13, 2, 'App\\Doctor'),
(13, 2, 'App\\User'),
(14, 2, 'App\\Admin'),
(14, 2, 'App\\Doctor'),
(14, 2, 'App\\Student'),
(14, 2, 'App\\User'),
(15, 2, 'App\\Admin'),
(15, 2, 'App\\Doctor'),
(15, 2, 'App\\User'),
(16, 2, 'App\\Admin'),
(16, 2, 'App\\Doctor'),
(16, 2, 'App\\User'),
(17, 2, 'App\\Admin'),
(17, 2, 'App\\Doctor'),
(17, 2, 'App\\User'),
(18, 2, 'App\\Admin'),
(18, 2, 'App\\Doctor'),
(18, 2, 'App\\Student'),
(18, 2, 'App\\User'),
(19, 2, 'App\\Admin'),
(19, 2, 'App\\Doctor'),
(19, 2, 'App\\User'),
(20, 2, 'App\\Admin'),
(20, 2, 'App\\Doctor'),
(20, 2, 'App\\User'),
(21, 2, 'App\\Admin'),
(21, 2, 'App\\Student'),
(21, 2, 'App\\User'),
(22, 2, 'App\\Admin'),
(22, 2, 'App\\Doctor'),
(22, 2, 'App\\Student'),
(22, 2, 'App\\User'),
(23, 2, 'App\\Admin'),
(23, 2, 'App\\Student'),
(24, 2, 'App\\Admin'),
(25, 2, 'App\\Admin'),
(26, 2, 'App\\Admin'),
(26, 2, 'App\\Doctor'),
(27, 2, 'App\\Admin'),
(28, 2, 'App\\Admin'),
(29, 2, 'App\\Admin'),
(30, 2, 'App\\Admin'),
(30, 2, 'App\\Doctor'),
(30, 2, 'App\\Student'),
(30, 2, 'App\\User'),
(2, 3, 'App\\Doctor'),
(2, 3, 'App\\Student'),
(2, 3, 'App\\User'),
(6, 3, 'App\\Doctor'),
(6, 3, 'App\\Student'),
(6, 3, 'App\\User'),
(10, 3, 'App\\Doctor'),
(10, 3, 'App\\Student'),
(10, 3, 'App\\User'),
(13, 3, 'App\\Doctor'),
(13, 3, 'App\\User'),
(14, 3, 'App\\Doctor'),
(14, 3, 'App\\Student'),
(14, 3, 'App\\User'),
(15, 3, 'App\\Doctor'),
(15, 3, 'App\\User'),
(16, 3, 'App\\Doctor'),
(16, 3, 'App\\User'),
(17, 3, 'App\\Doctor'),
(17, 3, 'App\\User'),
(18, 3, 'App\\Doctor'),
(18, 3, 'App\\Student'),
(18, 3, 'App\\User'),
(19, 3, 'App\\Doctor'),
(19, 3, 'App\\User'),
(20, 3, 'App\\Doctor'),
(20, 3, 'App\\User'),
(21, 3, 'App\\Student'),
(22, 3, 'App\\Doctor'),
(22, 3, 'App\\User'),
(30, 3, 'App\\Doctor'),
(30, 3, 'App\\User'),
(2, 4, 'App\\Doctor'),
(2, 4, 'App\\Student'),
(2, 4, 'App\\User'),
(6, 4, 'App\\Doctor'),
(6, 4, 'App\\Student'),
(6, 4, 'App\\User'),
(10, 4, 'App\\Doctor'),
(10, 4, 'App\\Student'),
(10, 4, 'App\\User'),
(13, 4, 'App\\Doctor'),
(14, 4, 'App\\Doctor'),
(14, 4, 'App\\Student'),
(14, 4, 'App\\User'),
(15, 4, 'App\\Doctor'),
(16, 4, 'App\\Doctor'),
(17, 4, 'App\\Doctor'),
(18, 4, 'App\\Doctor'),
(18, 4, 'App\\Student'),
(18, 4, 'App\\User'),
(19, 4, 'App\\Doctor'),
(20, 4, 'App\\Doctor'),
(21, 4, 'App\\Student'),
(21, 4, 'App\\User'),
(22, 4, 'App\\Doctor'),
(22, 4, 'App\\User'),
(23, 4, 'App\\User'),
(26, 4, 'App\\Doctor'),
(26, 4, 'App\\Student'),
(30, 4, 'App\\User'),
(2, 5, 'App\\Student'),
(2, 5, 'App\\User'),
(6, 5, 'App\\Student'),
(6, 5, 'App\\User'),
(10, 5, 'App\\Student'),
(10, 5, 'App\\User'),
(14, 5, 'App\\Student'),
(14, 5, 'App\\User'),
(18, 5, 'App\\Student'),
(18, 5, 'App\\User'),
(21, 5, 'App\\Student'),
(21, 5, 'App\\User'),
(22, 5, 'App\\User'),
(23, 5, 'App\\User'),
(26, 5, 'App\\Student'),
(30, 5, 'App\\User'),
(2, 6, 'App\\Doctor'),
(2, 6, 'App\\Student'),
(2, 6, 'App\\User'),
(6, 6, 'App\\Doctor'),
(6, 6, 'App\\Student'),
(6, 6, 'App\\User'),
(10, 6, 'App\\Doctor'),
(10, 6, 'App\\Student'),
(10, 6, 'App\\User'),
(13, 6, 'App\\Doctor'),
(13, 6, 'App\\User'),
(14, 6, 'App\\Doctor'),
(14, 6, 'App\\Student'),
(14, 6, 'App\\User'),
(15, 6, 'App\\Doctor'),
(15, 6, 'App\\User'),
(16, 6, 'App\\Doctor'),
(16, 6, 'App\\User'),
(17, 6, 'App\\Doctor'),
(17, 6, 'App\\User'),
(18, 6, 'App\\Doctor'),
(18, 6, 'App\\Student'),
(18, 6, 'App\\User'),
(19, 6, 'App\\Doctor'),
(19, 6, 'App\\User'),
(20, 6, 'App\\Doctor'),
(20, 6, 'App\\User'),
(21, 6, 'App\\Student'),
(22, 6, 'App\\Doctor'),
(22, 6, 'App\\User'),
(26, 6, 'App\\Doctor'),
(26, 6, 'App\\Student'),
(30, 6, 'App\\Doctor'),
(30, 6, 'App\\User'),
(2, 7, 'App\\Doctor'),
(2, 7, 'App\\Student'),
(2, 7, 'App\\User'),
(6, 7, 'App\\Doctor'),
(6, 7, 'App\\Student'),
(6, 7, 'App\\User'),
(10, 7, 'App\\Doctor'),
(10, 7, 'App\\Student'),
(10, 7, 'App\\User'),
(13, 7, 'App\\Doctor'),
(14, 7, 'App\\Doctor'),
(14, 7, 'App\\Student'),
(14, 7, 'App\\User'),
(15, 7, 'App\\Doctor'),
(16, 7, 'App\\Doctor'),
(17, 7, 'App\\Doctor'),
(18, 7, 'App\\Doctor'),
(18, 7, 'App\\Student'),
(18, 7, 'App\\User'),
(19, 7, 'App\\Doctor'),
(20, 7, 'App\\Doctor'),
(21, 7, 'App\\Student'),
(21, 7, 'App\\User'),
(22, 7, 'App\\Doctor'),
(26, 7, 'App\\Doctor'),
(26, 7, 'App\\Student'),
(30, 7, 'App\\Doctor'),
(1, 8, 'App\\User'),
(2, 8, 'App\\Doctor'),
(2, 8, 'App\\Student'),
(2, 8, 'App\\User'),
(3, 8, 'App\\User'),
(4, 8, 'App\\User'),
(5, 8, 'App\\User'),
(6, 8, 'App\\Doctor'),
(6, 8, 'App\\Student'),
(6, 8, 'App\\User'),
(7, 8, 'App\\User'),
(8, 8, 'App\\User'),
(9, 8, 'App\\User'),
(10, 8, 'App\\Doctor'),
(10, 8, 'App\\Student'),
(10, 8, 'App\\User'),
(11, 8, 'App\\User'),
(12, 8, 'App\\User'),
(13, 8, 'App\\Doctor'),
(13, 8, 'App\\User'),
(14, 8, 'App\\Doctor'),
(14, 8, 'App\\Student'),
(14, 8, 'App\\User'),
(15, 8, 'App\\Doctor'),
(15, 8, 'App\\User'),
(16, 8, 'App\\Doctor'),
(16, 8, 'App\\User'),
(17, 8, 'App\\Doctor'),
(17, 8, 'App\\User'),
(18, 8, 'App\\Doctor'),
(18, 8, 'App\\Student'),
(18, 8, 'App\\User'),
(19, 8, 'App\\Doctor'),
(19, 8, 'App\\User'),
(20, 8, 'App\\Doctor'),
(20, 8, 'App\\User'),
(21, 8, 'App\\Student'),
(21, 8, 'App\\User'),
(22, 8, 'App\\Doctor'),
(22, 8, 'App\\User'),
(23, 8, 'App\\User'),
(24, 8, 'App\\User'),
(25, 8, 'App\\User'),
(26, 8, 'App\\Doctor'),
(26, 8, 'App\\Student'),
(26, 8, 'App\\User'),
(27, 8, 'App\\User'),
(28, 8, 'App\\User'),
(29, 8, 'App\\User'),
(30, 8, 'App\\Doctor'),
(30, 8, 'App\\User'),
(31, 8, 'App\\User'),
(32, 8, 'App\\User'),
(2, 9, 'App\\Student'),
(2, 9, 'App\\User'),
(6, 9, 'App\\Student'),
(6, 9, 'App\\User'),
(10, 9, 'App\\Student'),
(10, 9, 'App\\User'),
(13, 9, 'App\\User'),
(14, 9, 'App\\Student'),
(14, 9, 'App\\User'),
(15, 9, 'App\\User'),
(16, 9, 'App\\User'),
(17, 9, 'App\\User'),
(18, 9, 'App\\Student'),
(18, 9, 'App\\User'),
(19, 9, 'App\\User'),
(20, 9, 'App\\User'),
(21, 9, 'App\\Student'),
(22, 9, 'App\\User'),
(26, 9, 'App\\Student'),
(26, 9, 'App\\User'),
(30, 9, 'App\\User'),
(2, 10, 'App\\Student'),
(2, 10, 'App\\User'),
(6, 10, 'App\\Student'),
(6, 10, 'App\\User'),
(10, 10, 'App\\Student'),
(10, 10, 'App\\User'),
(13, 10, 'App\\User'),
(14, 10, 'App\\Student'),
(14, 10, 'App\\User'),
(15, 10, 'App\\User'),
(16, 10, 'App\\User'),
(17, 10, 'App\\User'),
(18, 10, 'App\\Student'),
(18, 10, 'App\\User'),
(19, 10, 'App\\User'),
(20, 10, 'App\\User'),
(21, 10, 'App\\Student'),
(21, 10, 'App\\User'),
(22, 10, 'App\\User'),
(26, 10, 'App\\Student'),
(26, 10, 'App\\User'),
(30, 10, 'App\\User'),
(2, 11, 'App\\Student'),
(2, 11, 'App\\User'),
(6, 11, 'App\\Student'),
(6, 11, 'App\\User'),
(10, 11, 'App\\Student'),
(10, 11, 'App\\User'),
(13, 11, 'App\\User'),
(14, 11, 'App\\Student'),
(14, 11, 'App\\User'),
(15, 11, 'App\\User'),
(16, 11, 'App\\User'),
(17, 11, 'App\\User'),
(18, 11, 'App\\Student'),
(18, 11, 'App\\User'),
(19, 11, 'App\\User'),
(20, 11, 'App\\User'),
(21, 11, 'App\\Student'),
(22, 11, 'App\\User'),
(26, 11, 'App\\Student'),
(26, 11, 'App\\User'),
(30, 11, 'App\\User'),
(2, 12, 'App\\User'),
(6, 12, 'App\\User'),
(10, 12, 'App\\User'),
(13, 12, 'App\\User'),
(14, 12, 'App\\User'),
(15, 12, 'App\\User'),
(16, 12, 'App\\User'),
(17, 12, 'App\\User'),
(18, 12, 'App\\User'),
(19, 12, 'App\\User'),
(20, 12, 'App\\User'),
(22, 12, 'App\\User'),
(26, 12, 'App\\User'),
(30, 12, 'App\\User'),
(2, 13, 'App\\User'),
(6, 13, 'App\\User'),
(10, 13, 'App\\User'),
(13, 13, 'App\\User'),
(14, 13, 'App\\User'),
(15, 13, 'App\\User'),
(16, 13, 'App\\User'),
(17, 13, 'App\\User'),
(18, 13, 'App\\User'),
(19, 13, 'App\\User'),
(20, 13, 'App\\User'),
(22, 13, 'App\\User'),
(26, 13, 'App\\User'),
(30, 13, 'App\\User'),
(2, 14, 'App\\User'),
(6, 14, 'App\\User'),
(10, 14, 'App\\User'),
(14, 14, 'App\\User'),
(18, 14, 'App\\User'),
(21, 14, 'App\\User'),
(26, 14, 'App\\User'),
(2, 15, 'App\\User'),
(6, 15, 'App\\User'),
(10, 15, 'App\\User'),
(14, 15, 'App\\User'),
(18, 15, 'App\\User'),
(21, 15, 'App\\User'),
(26, 15, 'App\\User'),
(2, 16, 'App\\User'),
(6, 16, 'App\\User'),
(10, 16, 'App\\User'),
(14, 16, 'App\\User'),
(18, 16, 'App\\User'),
(21, 16, 'App\\User'),
(26, 16, 'App\\User'),
(2, 17, 'App\\User'),
(6, 17, 'App\\User'),
(10, 17, 'App\\User'),
(14, 17, 'App\\User'),
(18, 17, 'App\\User'),
(21, 17, 'App\\User'),
(26, 17, 'App\\User'),
(2, 18, 'App\\User'),
(6, 18, 'App\\User'),
(10, 18, 'App\\User'),
(14, 18, 'App\\User'),
(18, 18, 'App\\User'),
(21, 18, 'App\\User'),
(26, 18, 'App\\User'),
(2, 19, 'App\\User'),
(6, 19, 'App\\User'),
(10, 19, 'App\\User'),
(14, 19, 'App\\User'),
(18, 19, 'App\\User'),
(21, 19, 'App\\User'),
(26, 19, 'App\\User'),
(2, 20, 'App\\User'),
(6, 20, 'App\\User'),
(10, 20, 'App\\User'),
(14, 20, 'App\\User'),
(18, 20, 'App\\User'),
(21, 20, 'App\\User'),
(26, 20, 'App\\User'),
(2, 21, 'App\\User'),
(6, 21, 'App\\User'),
(10, 21, 'App\\User'),
(14, 21, 'App\\User'),
(18, 21, 'App\\User'),
(21, 21, 'App\\User'),
(26, 21, 'App\\User'),
(1, 22, 'App\\User'),
(2, 22, 'App\\User'),
(3, 22, 'App\\User'),
(4, 22, 'App\\User'),
(5, 22, 'App\\User'),
(6, 22, 'App\\User'),
(7, 22, 'App\\User'),
(8, 22, 'App\\User'),
(9, 22, 'App\\User'),
(10, 22, 'App\\User'),
(11, 22, 'App\\User'),
(12, 22, 'App\\User'),
(13, 22, 'App\\User'),
(14, 22, 'App\\User'),
(15, 22, 'App\\User'),
(16, 22, 'App\\User'),
(17, 22, 'App\\User'),
(18, 22, 'App\\User'),
(19, 22, 'App\\User'),
(20, 22, 'App\\User'),
(21, 22, 'App\\User'),
(22, 22, 'App\\User'),
(23, 22, 'App\\User'),
(24, 22, 'App\\User'),
(25, 22, 'App\\User'),
(26, 22, 'App\\User'),
(27, 22, 'App\\User'),
(28, 22, 'App\\User'),
(29, 22, 'App\\User'),
(30, 22, 'App\\User');

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
(1, 'super_admin', 'Super Admin', 'Super Admin', '2020-09-19 17:00:54', '2020-09-19 17:00:54'),
(2, 'admin', 'Admin', 'Admin', '2020-09-19 17:00:59', '2020-09-19 17:00:59'),
(3, 'doctor', 'Doctor', 'Doctor', '2020-09-19 17:01:02', '2020-09-19 17:01:02'),
(4, 'student', 'Student', 'Student', '2020-09-19 17:01:04', '2020-09-19 17:01:04'),
(5, 'user', 'user', 'can do some tasks in the project', '2020-09-19 17:01:06', '2020-09-19 17:01:06');

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
(3, 1, 'App\\Doctor'),
(4, 1, 'App\\Student'),
(2, 2, 'App\\Admin'),
(3, 2, 'App\\Doctor'),
(4, 2, 'App\\Student'),
(5, 2, 'App\\User'),
(3, 3, 'App\\Doctor'),
(4, 3, 'App\\Student'),
(5, 3, 'App\\User'),
(3, 4, 'App\\Doctor'),
(4, 4, 'App\\Student'),
(5, 4, 'App\\User'),
(4, 5, 'App\\Student'),
(5, 5, 'App\\User'),
(3, 6, 'App\\Doctor'),
(4, 6, 'App\\Student'),
(5, 6, 'App\\User'),
(3, 7, 'App\\Doctor'),
(4, 7, 'App\\Student'),
(5, 7, 'App\\User'),
(3, 8, 'App\\Doctor'),
(4, 8, 'App\\Student'),
(5, 8, 'App\\User'),
(4, 9, 'App\\Student'),
(5, 9, 'App\\User'),
(4, 10, 'App\\Student'),
(5, 10, 'App\\User'),
(4, 11, 'App\\Student'),
(5, 11, 'App\\User'),
(5, 12, 'App\\User'),
(5, 13, 'App\\User'),
(5, 14, 'App\\User'),
(5, 15, 'App\\User'),
(5, 16, 'App\\User'),
(5, 17, 'App\\User'),
(5, 18, 'App\\User'),
(5, 19, 'App\\User'),
(5, 20, 'App\\User'),
(5, 21, 'App\\User'),
(5, 22, 'App\\User');

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
(4, 'Eslam Rabia Mahmoud', '160026', 'erb@gm.com', '$2y$10$1iGyatKRskISLZA7baqdkuIj2FWXAWZ.Pby.qbrjFbWm0AWMxbt0K', '[\"5252\",\"525\"]', 'beni sufe', '2020-09-23 09:59:26', '2020-09-23 09:59:26'),
(5, 'Ahmed Nady Mahmoud', '160025', 'anm@gm.com', '$2y$10$ftfHl1Gg5KEp5uJrnvvYvOSOi/yYIN2f8rVXILIXxwA2TSYk8ZVHa', '[\"1341\",\"3434\"]', 'beni sufe', '2020-09-23 10:01:05', '2020-09-23 10:01:05'),
(6, 'Khaled Mohamed Mohamed', '160100', 'kmm@gm.com', '$2y$10$jcYowzv6rknwDIbRQlMqCuL8IGJxr53dQo/02h8ekQSBEeTFTxPH2', '[\"5465\",\"2325\"]', 'beni sufe', '2020-09-23 10:02:45', '2020-09-23 10:02:45'),
(7, 'Mostafa Saad Ahmed', '160110', 'msa@gm.com', '$2y$10$B/dW7NtG3lnGu1mgtVpDTubO7UYJXLnETm2NV0NZSlb4xMzK9C3wG', '[\"546\",\"478\"]', 'beni sufe', '2020-09-23 10:05:30', '2020-09-23 10:05:30'),
(8, 'Hossam Mohamed Ahmed', '160099', 'hma@gm.com', '$2y$10$IP4WznJS/813xZ.W70hkqub6UV8PGpzvLRpOn3Rmlm4IMoKgEZ6aW', '[\"5456\",\"6422\"]', 'beni sufe', '2020-09-23 10:08:14', '2020-09-23 10:08:14'),
(9, 'Omar Abdelrahem Mohamed', '160105', 'oam@gm.com', '$2y$10$w6sp4ztcdMPXmF4nlzIGDupeYJx9PyvznSIDDVAlj5q0T28Q68swq', '[\"646\",\"654\"]', 'cairo', '2020-09-23 10:10:20', '2020-09-23 10:10:20'),
(10, 'Ahmed Gaber Azoz', '160024', 'aga@gm.com', '$2y$10$vR6kPCZvLM/k4XlACP/mK.ki8K7gQ8YGpKZfTWto7ewCztgSj7a7G', '[\"2324\",\"2324\"]', 'beni sufe', '2020-09-23 10:13:17', '2020-09-23 10:13:17'),
(11, 'Ahmed Kadry Ali', '160023', 'aka@gm.com', '$2y$10$Q6antrXsuMXvqxbWIpbaUuoGO3BstlGI.nwi/AxlvgAA.lP7CDtZ6', '[\"654\",\"658\"]', 'beni sufe', '2020-09-23 10:14:45', '2020-09-23 10:14:45');

-- --------------------------------------------------------

--
-- Table structure for table `student_assignments`
--

CREATE TABLE `student_assignments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `assign_id` bigint(20) UNSIGNED NOT NULL,
  `pdf_anss` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_assignments`
--

INSERT INTO `student_assignments` (`id`, `student_id`, `assign_id`, `pdf_anss`, `created_at`, `updated_at`) VALUES
(5, 5, 4, '1601041095.pdf', '2020-09-25 11:38:15', '2020-09-25 11:38:15'),
(6, 6, 4, '1601068895.pdf', '2020-09-25 19:21:35', '2020-09-25 19:21:35'),
(7, 4, 5, '1601068961.pdf', '2020-09-25 19:22:42', '2020-09-25 19:22:42'),
(8, 7, 6, '1601069076.pdf', '2020-09-25 19:24:36', '2020-09-25 19:24:36'),
(9, 9, 7, '1601069128.pdf', '2020-09-25 19:25:28', '2020-09-25 19:25:28'),
(10, 4, 8, '1601069174.pdf', '2020-09-25 19:26:14', '2020-09-25 19:26:14'),
(11, 11, 8, '1601069208.pdf', '2020-09-25 19:26:48', '2020-09-25 19:26:48'),
(12, 9, 9, '1601069261.pdf', '2020-09-25 19:27:41', '2020-09-25 19:27:41'),
(13, 10, 9, '1601069276.pdf', '2020-09-25 19:27:56', '2020-09-25 19:27:56');

-- --------------------------------------------------------

--
-- Table structure for table `student_subjects`
--

CREATE TABLE `student_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_subjects`
--

INSERT INTO `student_subjects` (`id`, `student_id`, `subject_id`, `created_at`, `updated_at`) VALUES
(4, 11, 10, '2020-09-25 09:14:13', '2020-09-25 09:14:13'),
(5, 10, 10, '2020-09-25 09:14:25', '2020-09-25 09:14:25'),
(6, 9, 10, '2020-09-25 09:14:39', '2020-09-25 09:14:39'),
(7, 8, 9, '2020-09-25 09:14:53', '2020-09-25 09:14:53'),
(8, 7, 9, '2020-09-25 09:15:05', '2020-09-25 09:15:05'),
(9, 6, 9, '2020-09-25 09:15:20', '2020-09-25 09:15:20'),
(10, 5, 8, '2020-09-25 09:15:34', '2020-09-25 09:15:34'),
(11, 4, 8, '2020-09-25 09:15:48', '2020-09-25 09:15:48'),
(12, 11, 8, '2020-09-25 09:16:03', '2020-09-25 09:16:03'),
(13, 10, 7, '2020-09-25 09:16:18', '2020-09-25 09:16:18'),
(14, 9, 7, '2020-09-25 09:16:29', '2020-09-25 09:16:29'),
(15, 8, 6, '2020-09-25 09:16:41', '2020-09-25 09:16:41'),
(16, 7, 6, '2020-09-25 09:17:13', '2020-09-25 09:17:13'),
(17, 6, 5, '2020-09-25 09:17:25', '2020-09-25 09:17:25'),
(18, 5, 5, '2020-09-25 09:17:45', '2020-09-25 09:17:45'),
(19, 4, 4, '2020-09-25 09:17:56', '2020-09-25 09:17:56'),
(20, 8, 4, '2020-09-25 09:18:12', '2020-09-25 09:18:12');

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
(3, 4, 'عربي ادب جاهلي', 'ar44', 1, '2020-09-21 15:13:57', '2020-09-21 15:13:57'),
(4, 6, 'Software Engineering', 'SE123', 1, '2020-09-23 17:24:44', '2020-09-23 17:24:44'),
(5, 7, 'Graphics', 'G123', 1, '2020-09-23 17:25:33', '2020-09-23 17:25:33'),
(6, 8, 'Systems Analysis and Design', 'SAD123', 1, '2020-09-23 17:26:05', '2020-09-23 17:26:05'),
(7, 6, 'Project Management', 'PM123', 1, '2020-09-23 17:26:51', '2020-09-23 17:26:51'),
(8, 7, 'IS Strategy', 'ISS123', 1, '2020-09-23 17:27:22', '2020-09-23 17:27:22'),
(9, 8, 'System Administration', 'SA123', 1, '2020-09-23 17:28:14', '2020-09-23 17:28:14'),
(10, 6, 'Numerical Analysis', 'NA123', 1, '2020-09-23 17:29:41', '2020-09-23 17:29:41');

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
(1, 'super admin', 'super_admin@app.com', NULL, '$2y$10$JYoLApaNTyHm806c9/kmv.EZKZzVwQXISv3Hqht1UOxjrBKQc.2zW', 'UZRZCXJmStLUiw8pEzBVzSeb36stz2Kqk0avGxWifsRVzP5dyQ6y38uDkvV0', '2020-09-19 17:01:06', '2020-09-19 17:01:06'),
(9, 'Mahmoud Sayed', 'ms@gmail.com', NULL, '$2y$10$so8K.va78HIcmL.JI9bSruMgLHlp.RaKspSxn0E8FoKl9k8w2VLcq', NULL, '2020-09-21 15:08:16', '2020-09-21 15:08:16'),
(10, 'Doctor 1', 'D1@gmail.com', NULL, '$2y$10$0OvdffAEZKyuaCm8nB2Um.hy4kij5rMgZqGbcn44AgtjIW25lUJXm', NULL, '2020-09-22 21:56:52', '2020-09-22 21:56:52'),
(11, 'Salah Mahmoud', 'sm@gm.com', NULL, '$2y$10$5kYhi77xJoo5BMnelUOC4Ou8BbBhtXfn/ylSSpQfP1dBHNB7/svjC', NULL, '2020-09-23 09:53:31', '2020-09-23 09:53:31'),
(12, 'Ali Mahmoud', 'am@gm.com', NULL, '$2y$10$gwkQac6lUeP2grydbUI/DupQNMObB95KYxJwcronPinldPk0K.8s.', NULL, '2020-09-23 09:55:06', '2020-09-23 09:55:06'),
(13, 'Mohamed Mahmoud', 'mm@gmail.com', NULL, '$2y$10$vUvg84SycqDGp1sLuWeJxuO7.lP4XjpDqMMT6HQdTyWT9XWrWgg02', NULL, '2020-09-23 09:56:42', '2020-09-23 09:56:42'),
(14, 'Eslam Rabia Mahmoud', 'erb@gm.com', NULL, '$2y$10$u3Mq/Zy2G1p6uPAi2QrlK.M2o/JGNpgFcCsWaqRJkfp3GNdTY8jyW', NULL, '2020-09-23 09:59:27', '2020-09-23 09:59:27'),
(15, 'Ahmed Nady Mahmoud', 'anm@gm.com', NULL, '$2y$10$17PjVvBj8UrFKaB4CVJpiOL/.b926zTMqpHT4plCTXGJ3QS1uTtpy', NULL, '2020-09-23 10:01:05', '2020-09-23 10:01:05'),
(16, 'Khaled Mohamed Mohamed', 'kmm@gm.com', NULL, '$2y$10$CBPi.3.ISCB5zkOtdHCVReoIIGS8t5f/j.Pwyp8Z1k.obBoH1uFG.', NULL, '2020-09-23 10:02:46', '2020-09-23 10:02:46'),
(17, 'Mostafa Saad Ahmed', 'msa@gm.com', NULL, '$2y$10$jmWz4sbO3IkmQmbAkzgJ7u8S6dnCJmr1MJzk/6bOpQ4HxV6ik.wD6', NULL, '2020-09-23 10:05:31', '2020-09-23 10:05:31'),
(18, 'Hossam Mohamed Ahmed', 'hma@gm.com', NULL, '$2y$10$nBB/rMHg8vlhhY9ytWj/fOVcwek0uNte6mqH5Imq6xD.UuXrKFkhy', NULL, '2020-09-23 10:08:15', '2020-09-23 10:08:15'),
(19, 'Omar Abdelrahem Mohamed', 'oam@gm.com', NULL, '$2y$10$ukzbBc2FoYAAspjXGR7NpuuD8qUeju7bddjxj.kxq7IQHqScodEuC', NULL, '2020-09-23 10:10:20', '2020-09-23 10:10:20'),
(20, 'Ahmed Gaber Azoz', 'aga@gm.com', NULL, '$2y$10$YAR.YjstQ5O.0b3fPi6BHudJsxM.MCUZApQmbZB1rBMjY8el472gy', NULL, '2020-09-23 10:13:17', '2020-09-23 10:13:17'),
(21, 'Ahmed Kadry Ali', 'aka@gm.com', NULL, '$2y$10$sgKKcnL8xqBtERV8Rs1w8eAKrce6bPvxG4IPgkrwNoQFSPoYwVECC', NULL, '2020-09-23 10:14:46', '2020-09-23 10:14:46'),
(22, 'Ahmed Salah', 'asm@gm.com', NULL, '$2y$10$lJDXW6CYDxSedXiGP6Ppy.f.mhRocgKeEqEswiRYZTUbOzOtelFQq', NULL, '2020-09-25 19:45:53', '2020-09-25 19:45:53');

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
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignments_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doctors_email_unique` (`email`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_sbj_id_foreign` (`sbj_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `student_assignments`
--
ALTER TABLE `student_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_assignments_student_id_foreign` (`student_id`),
  ADD KEY `student_assignments_assign_id_foreign` (`assign_id`);

--
-- Indexes for table `student_subjects`
--
ALTER TABLE `student_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_subjects_student_id_foreign` (`student_id`),
  ADD KEY `student_subjects_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_doc_id_foreign` (`doc_id`);

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
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `student_assignments`
--
ALTER TABLE `student_assignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `student_subjects`
--
ALTER TABLE `student_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_sbj_id_foreign` FOREIGN KEY (`sbj_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `student_assignments`
--
ALTER TABLE `student_assignments`
  ADD CONSTRAINT `student_assignments_assign_id_foreign` FOREIGN KEY (`assign_id`) REFERENCES `assignments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_assignments_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_subjects`
--
ALTER TABLE `student_subjects`
  ADD CONSTRAINT `student_subjects_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_subjects_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_doc_id_foreign` FOREIGN KEY (`doc_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
