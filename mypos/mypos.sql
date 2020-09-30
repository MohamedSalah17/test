-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2020 at 11:14 AM
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
(1, 'admin1', 'a1@gmail.com', NULL, '$2y$10$l./aQrNZsuhISh2y/ys/I.qp3EsEGB99r3QicoWmcbBQ36vZj3jpO', NULL, '2020-09-29 20:22:25', '2020-09-29 20:22:25');

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
(1, 1, 4, 4, 'DS L1 Assign', '2020-09-20', '2020-10-05', '1601418696.pdf', NULL, '2020-09-29 20:31:36', '2020-09-29 20:31:36'),
(2, 3, 3, 3, 'DC L1 Assign', '2020-09-25', '2020-09-30', '1601418976.pdf', NULL, '2020-09-29 20:36:16', '2020-09-29 20:36:16'),
(3, 6, 2, 2, 'IP L1 Assign', '2020-09-25', '2020-10-05', '1601419464.pdf', NULL, '2020-09-29 20:44:24', '2020-09-29 20:44:24'),
(4, 7, 2, 2, 'IP L2 Assign', '2020-09-15', '2020-09-28', '1601419522.pdf', NULL, '2020-09-29 20:45:22', '2020-09-29 20:45:22'),
(5, 9, 1, 1, 'Cv L1 Assign', '2020-09-25', '2020-09-29', '1601419960.pdf', NULL, '2020-09-29 20:52:40', '2020-09-29 20:52:40'),
(6, 10, 1, 1, 'CV L2 Assign', '2020-09-25', '2020-10-05', '1601420041.pdf', NULL, '2020-09-29 20:54:01', '2020-09-29 20:54:01');

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
(1, 'Kareem Ahmed', 'ka@gmail.com', '$2y$10$6xkpJ6YW5hE7AH9gC5RckOhCImC1qfu1u6QnwDDql/cx4HlAOUBnK', '[\"01157404397\"]', 'beni sufe', '2020-09-29 18:26:53', '2020-09-29 18:28:57'),
(2, 'Hossam Moftah', 'hm@gmail.com', '$2y$10$KrDf61P7C2B2Hh/MMK/khOqCFvKO9mMrWZaGqN0Ai3Kur5SdPh5gW', '[\"01157404397\"]', 'cairo', '2020-09-29 18:28:09', '2020-09-29 18:28:09'),
(3, 'Hany Elnashar', 'he@gmail.com', '$2y$10$IrQQH.TpnKAT7ULQo0.e1OMwE8WW7lj/gXqlZIOlTkcBfbySROOpe', '[\"01234561230\"]', 'beni sufe', '2020-09-29 18:45:20', '2020-09-29 18:45:20'),
(4, 'Mohamed Kayed', 'mk@gmail.com', '$2y$10$XYJjx/te/3AzHVB0XsCkiusy7q8ZuUQ3tRfoey.Bh0NgmEEfNt2Gq', '[\"01157404397\"]', 'beni sufe', '2020-09-29 20:08:18', '2020-09-30 07:04:08');

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
  `pdf_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pptx_file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `sbj_id`, `doc_id`, `name`, `date`, `pdf_file`, `pptx_file`, `youtube_link`, `created_at`, `updated_at`) VALUES
(1, 4, 4, 'DS Less1', '2020-09-15', '1601418573.pdf', '1601418573.pptx', 'https://youtu.be/0JiP8jSFT3E', '2020-09-29 20:29:33', '2020-09-29 20:29:33'),
(2, 4, 4, 'DS Less2', '2020-09-20', '1601418617.pdf', '1601418617.pptx', 'https://youtu.be/0JiP8jSFT3E', '2020-09-29 20:30:17', '2020-09-29 20:30:17'),
(3, 3, 3, 'DC Lesson1', '2020-09-20', '1601418841.pdf', '1601418841.pptx', 'https://youtu.be/0JiP8jSFT3E', '2020-09-29 20:34:01', '2020-09-29 20:34:01'),
(4, 3, 3, 'DC Lesson2', '2020-09-25', '1601418884.pdf', '1601418884.pptx', 'https://youtu.be/0JiP8jSFT3E', '2020-09-29 20:34:44', '2020-09-29 20:34:44'),
(5, 3, 3, 'DC Lesson3', '2020-09-30', '1601419057.pdf', '1601419057.pptx', 'https://youtu.be/0JiP8jSFT3E', '2020-09-29 20:37:37', '2020-09-29 20:37:37'),
(6, 2, 2, 'IP Lesson1', '2020-09-30', '1601419198.pdf', '1601419198.pptx', 'https://youtu.be/0JiP8jSFT3E', '2020-09-29 20:39:58', '2020-09-29 20:39:58'),
(7, 2, 2, 'IP Lesson2', '2020-10-05', '1601419253.pdf', '1601419253.pptx', 'https://youtu.be/0JiP8jSFT3E', '2020-09-29 20:40:53', '2020-09-29 20:40:53'),
(8, 2, 2, 'IP Lesson3', '2020-10-10', '1601419370.pdf', '1601419370.pptx', 'https://youtu.be/0JiP8jSFT3E', '2020-09-29 20:42:50', '2020-09-29 20:42:50'),
(9, 1, 1, 'CV Lesson1', '2020-09-20', '1601419637.pdf', '1601419637.pptx', 'https://youtu.be/0JiP8jSFT3E', '2020-09-29 20:47:17', '2020-09-29 20:47:17'),
(10, 1, 1, 'CV Lesson2', '2020-09-30', '1601419688.pdf', '1601419688.pptx', 'https://youtu.be/0JiP8jSFT3E', '2020-09-29 20:48:08', '2020-09-29 20:48:08'),
(11, 1, 1, 'CV Lesson3', '2020-10-05', '1601419740.pdf', '1601419740.pptx', 'https://youtu.be/0JiP8jSFT3E', '2020-09-29 20:49:00', '2020-09-29 20:49:00');

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
(1, 'create_doctors', 'Create Doctors', 'Create Doctors', '2020-09-29 18:25:06', '2020-09-29 18:25:06'),
(2, 'read_doctors', 'Read Doctors', 'Read Doctors', '2020-09-29 18:25:06', '2020-09-29 18:25:06'),
(3, 'update_doctors', 'Update Doctors', 'Update Doctors', '2020-09-29 18:25:07', '2020-09-29 18:25:07'),
(4, 'delete_doctors', 'Delete Doctors', 'Delete Doctors', '2020-09-29 18:25:07', '2020-09-29 18:25:07'),
(5, 'create_students', 'Create Students', 'Create Students', '2020-09-29 18:25:07', '2020-09-29 18:25:07'),
(6, 'read_students', 'Read Students', 'Read Students', '2020-09-29 18:25:07', '2020-09-29 18:25:07'),
(7, 'update_students', 'Update Students', 'Update Students', '2020-09-29 18:25:07', '2020-09-29 18:25:07'),
(8, 'delete_students', 'Delete Students', 'Delete Students', '2020-09-29 18:25:07', '2020-09-29 18:25:07'),
(9, 'create_subjects', 'Create Subjects', 'Create Subjects', '2020-09-29 18:25:07', '2020-09-29 18:25:07'),
(10, 'read_subjects', 'Read Subjects', 'Read Subjects', '2020-09-29 18:25:07', '2020-09-29 18:25:07'),
(11, 'update_subjects', 'Update Subjects', 'Update Subjects', '2020-09-29 18:25:07', '2020-09-29 18:25:07'),
(12, 'delete_subjects', 'Delete Subjects', 'Delete Subjects', '2020-09-29 18:25:07', '2020-09-29 18:25:07'),
(13, 'read_lessons', 'Read Lessons', 'Read Lessons', '2020-09-29 18:25:07', '2020-09-29 18:25:07'),
(14, 'read_assignments', 'Read Assignments', 'Read Assignments', '2020-09-29 18:25:07', '2020-09-29 18:25:07'),
(15, 'read_stdassign', 'Read Stdassign', 'Read Stdassign', '2020-09-29 18:25:08', '2020-09-29 18:25:08'),
(16, 'create_regist', 'Create Regist', 'Create Regist', '2020-09-29 18:25:08', '2020-09-29 18:25:08'),
(17, 'read_regist', 'Read Regist', 'Read Regist', '2020-09-29 18:25:08', '2020-09-29 18:25:08'),
(18, 'update_regist', 'Update Regist', 'Update Regist', '2020-09-29 18:25:08', '2020-09-29 18:25:08'),
(19, 'delete_regist', 'Delete Regist', 'Delete Regist', '2020-09-29 18:25:08', '2020-09-29 18:25:08'),
(20, 'create_admins', 'Create Admins', 'Create Admins', '2020-09-29 18:25:08', '2020-09-29 18:25:08'),
(21, 'read_admins', 'Read Admins', 'Read Admins', '2020-09-29 18:25:08', '2020-09-29 18:25:08'),
(22, 'update_admins', 'Update Admins', 'Update Admins', '2020-09-29 18:25:08', '2020-09-29 18:25:08'),
(23, 'delete_admins', 'Delete Admins', 'Delete Admins', '2020-09-29 18:25:09', '2020-09-29 18:25:09'),
(24, 'create_users', 'Create Users', 'Create Users', '2020-09-29 18:25:09', '2020-09-29 18:25:09'),
(25, 'read_users', 'Read Users', 'Read Users', '2020-09-29 18:25:09', '2020-09-29 18:25:09'),
(26, 'update_users', 'Update Users', 'Update Users', '2020-09-29 18:25:09', '2020-09-29 18:25:09'),
(27, 'delete_users', 'Delete Users', 'Delete Users', '2020-09-29 18:25:09', '2020-09-29 18:25:09'),
(28, 'create_lessons', 'Create Lessons', 'Create Lessons', '2020-09-29 18:25:12', '2020-09-29 18:25:12'),
(29, 'update_lessons', 'Update Lessons', 'Update Lessons', '2020-09-29 18:25:12', '2020-09-29 18:25:12'),
(30, 'delete_lessons', 'Delete Lessons', 'Delete Lessons', '2020-09-29 18:25:12', '2020-09-29 18:25:12'),
(31, 'create_assignments', 'Create Assignments', 'Create Assignments', '2020-09-29 18:25:12', '2020-09-29 18:25:12'),
(32, 'update_assignments', 'Update Assignments', 'Update Assignments', '2020-09-29 18:25:12', '2020-09-29 18:25:12'),
(33, 'delete_assignments', 'Delete Assignments', 'Delete Assignments', '2020-09-29 18:25:13', '2020-09-29 18:25:13'),
(34, 'create_stdassign', 'Create Stdassign', 'Create Stdassign', '2020-09-29 18:25:14', '2020-09-29 18:25:14');

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
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
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
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(17, 3),
(17, 4),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(21, 1),
(21, 2),
(22, 1),
(22, 2),
(23, 1),
(23, 2),
(24, 1),
(24, 2),
(25, 1),
(25, 2),
(26, 1),
(26, 2),
(27, 1),
(27, 2),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 4);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'super_admin', 'Super Admin', 'Super Admin', '2020-09-29 18:25:06', '2020-09-29 18:25:06'),
(2, 'admin', 'Admin', 'Admin', '2020-09-29 18:25:10', '2020-09-29 18:25:10'),
(3, 'doctor', 'Doctor', 'Doctor', '2020-09-29 18:25:12', '2020-09-29 18:25:12'),
(4, 'student', 'Student', 'Student', '2020-09-29 18:25:13', '2020-09-29 18:25:13'),
(5, 'user', 'user', 'can do some tasks in the project', '2020-09-29 18:25:14', '2020-09-29 18:25:14');

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
(3, 1, 'App\\Doctor'),
(4, 1, 'App\\Student'),
(3, 2, 'App\\Doctor'),
(3, 2, 'App\\User'),
(4, 2, 'App\\Student'),
(3, 3, 'App\\Doctor'),
(3, 3, 'App\\User'),
(4, 3, 'App\\Student'),
(3, 4, 'App\\Doctor'),
(4, 4, 'App\\Student'),
(4, 4, 'App\\User'),
(4, 5, 'App\\Student'),
(4, 5, 'App\\User'),
(4, 6, 'App\\User'),
(4, 7, 'App\\User'),
(3, 9, 'App\\User'),
(3, 10, 'App\\User'),
(2, 11, 'App\\User');

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
(1, 'Eslam Rabia Mahmoud', '160025', 'erb@gm.com', '$2y$10$FIh6R8Wu1OYrfqjAYerY/urXP/luu3PeYH/xJkHGrxfenEPv8tE/O', '[\"01124278160\"]', 'beni sufe', '2020-09-29 18:32:40', '2020-09-29 18:32:40'),
(2, 'Ahmed Nady Mahmoud', '160024', 'anm@gm.com', '$2y$10$rxRKKzA6Akm7D8uyhMztiucw9L04I10H90Y3dOshMQ2aKwRDnBPlm', '[\"01234561230\"]', 'beni sufe', '2020-09-29 18:33:57', '2020-09-29 18:33:57'),
(3, 'Hossam Ahmed Ali', '160026', 'haa@gm.com', '$2y$10$cjz/alBZ3Vttc9n2JbPIB.t59kTBNfe99HvbaF0Z1qWIT6hx59jve', '[\"01234561230\"]', 'beni sufe', '2020-09-29 18:35:38', '2020-09-29 18:35:38'),
(4, 'Khaled Mohamed Ali', '160027', 'kmm@gm.com', '$2y$10$Ur9EuGWTKIiHbsDIDB42xe5b9m/x1amu8l9XT5cJYrEyoLyDinXOe', '[\"01234561230\"]', 'beni sufe', '2020-09-29 18:36:27', '2020-09-29 18:36:27'),
(5, 'Mohamed Alaa', '160132', 'mae@gm.com', '$2y$10$TFTXiRW5846uftGXQzpxyuNqRu2H0gn8U/iMxCLGQ59kNJQmmF83e', '[\"01234561230\"]', 'beni sufe', '2020-09-29 18:37:42', '2020-09-30 07:11:03');

-- --------------------------------------------------------

--
-- Table structure for table `student_assignments`
--

CREATE TABLE `student_assignments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `assign_id` bigint(20) UNSIGNED NOT NULL,
  `pdf_anss` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lesson_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sbj_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doc_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_assignments`
--

INSERT INTO `student_assignments` (`id`, `student_id`, `assign_id`, `pdf_anss`, `lesson_id`, `sbj_id`, `doc_id`, `created_at`, `updated_at`) VALUES
(1, 5, 5, '1601420404.pdf', '9', '1', '1', '2020-09-29 21:00:04', '2020-09-29 21:00:04'),
(2, 5, 6, '1601420471.pdf', '10', '1', '1', '2020-09-29 21:01:11', '2020-09-29 21:01:11'),
(3, 5, 1, '1601420505.pdf', '1', '4', '4', '2020-09-29 21:01:45', '2020-09-29 21:01:45'),
(4, 4, 6, '1601420648.pdf', '10', '1', '1', '2020-09-29 21:04:08', '2020-09-29 21:04:08'),
(5, 4, 5, '1601420660.pdf', '9', '1', '1', '2020-09-29 21:04:20', '2020-09-29 21:04:20'),
(6, 4, 1, '1601420669.pdf', '1', '4', '4', '2020-09-29 21:04:29', '2020-09-29 21:04:29'),
(7, 3, 4, '1601420778.pdf', '7', '2', '2', '2020-09-29 21:06:18', '2020-09-29 21:06:18'),
(8, 3, 3, '1601420789.pdf', '6', '2', '2', '2020-09-29 21:06:29', '2020-09-29 21:06:29'),
(9, 3, 1, '1601420801.pdf', '1', '4', '4', '2020-09-29 21:06:41', '2020-09-29 21:06:41'),
(10, 2, 4, '1601420864.pdf', '7', '2', '2', '2020-09-29 21:07:44', '2020-09-29 21:07:44'),
(11, 2, 3, '1601420872.pdf', '6', '2', '2', '2020-09-29 21:07:52', '2020-09-29 21:07:52'),
(12, 2, 2, '1601420881.pdf', '3', '3', '3', '2020-09-29 21:08:01', '2020-09-29 21:08:01'),
(13, 1, 4, '1601420968.pdf', '7', '2', '2', '2020-09-29 21:09:28', '2020-09-29 21:09:28'),
(14, 1, 3, '1601420976.pdf', '6', '2', '2', '2020-09-29 21:09:36', '2020-09-29 21:09:36'),
(15, 1, 2, '1601420985.pdf', '3', '3', '3', '2020-09-28 21:09:45', '2020-09-29 21:09:45');

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
(1, 1, 2, '2020-09-29 18:38:00', '2020-09-29 18:38:00'),
(2, 2, 2, '2020-09-29 18:38:16', '2020-09-29 18:38:16'),
(3, 3, 2, '2020-09-29 18:38:28', '2020-09-29 18:38:28'),
(4, 4, 1, '2020-09-29 18:38:49', '2020-09-29 18:38:49'),
(5, 5, 1, '2020-09-29 18:39:07', '2020-09-29 18:39:07'),
(6, 1, 3, '2020-09-29 18:47:10', '2020-09-29 18:47:10'),
(7, 2, 3, '2020-09-29 18:47:20', '2020-09-29 18:47:20'),
(8, 3, 4, '2020-09-29 20:23:39', '2020-09-29 20:23:39'),
(9, 4, 4, '2020-09-29 20:24:16', '2020-09-29 20:24:16'),
(10, 5, 4, '2020-09-28 20:25:13', '2020-09-29 20:25:13'),
(11, 1, 4, '2020-09-29 20:25:56', '2020-09-29 20:25:56');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doc_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sbj_num` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `doc_id`, `name`, `code`, `description`, `sbj_num`, `created_at`, `updated_at`) VALUES
(1, 1, 'Computer Vision', 'CV123', 'description test', 1, '2020-09-29 18:29:58', '2020-09-29 20:15:16'),
(2, 2, 'Image Processing', 'IP123', 'description test', 1, '2020-09-29 18:31:05', '2020-09-29 18:31:27'),
(3, 3, 'Data comunication', 'dc123', 'description test', 1, '2020-09-29 18:46:51', '2020-09-29 20:14:47'),
(4, 4, 'Data Structure', 'DS123', 'description test', 1, '2020-09-29 20:16:05', '2020-09-29 20:16:14');

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
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `fid`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'super admin', 'super_admin@app.com', NULL, '$2y$10$w1LDZVjk46s1Kri.fNtdwuWAgRK5xAiO455eEwLDfxKSGCnmnCWa6', 'super_admin', NULL, NULL, '2020-09-29 18:25:14', '2020-09-29 18:25:14'),
(2, 'Kareem Ahmed', 'ka@gmail.com', NULL, '$2y$10$Mqu2HxOD9o5gXGwuCgjsbOir1o0U9RZ4QXxpn6yR625DzzvhpgJDC', 'doctor', '1', NULL, '2020-09-29 18:26:53', '2020-09-29 18:26:53'),
(3, 'Hossam Moftah', 'hm@gmail.com', NULL, '$2y$10$.FH5XRXu/wApWx4HsbaPceoDlFnlActSWn5TunPzckUev1wQS5j0y', 'doctor', '2', NULL, '2020-09-29 18:28:09', '2020-09-29 18:28:09'),
(4, 'Eslam Rabia Mahmoud', 'erb@gm.com', NULL, '$2y$10$b8N2QAODbThuwtLghW5zquoI6b0Xz2oEsqO.0t650QahT5Q7uiODK', 'student', '1', NULL, '2020-09-29 18:32:40', '2020-09-29 18:32:40'),
(5, 'Ahmed Nady Mahmoud', 'anm@gm.com', NULL, '$2y$10$HbWk/8ZG4VtwuOMZQcXv5OmtJ4g62SfceWPQ0NBdCtHl5rq3vTIYG', 'student', '2', NULL, '2020-09-29 18:33:58', '2020-09-29 18:33:58'),
(6, 'Hossam Ahmed Ali', 'haa@gm.com', NULL, '$2y$10$hAlFKjR7qIENxUvKG5WUoOdUwEciKXugz4UsCzuJMwbwDN4XB19I6', 'student', '3', NULL, '2020-09-29 18:35:39', '2020-09-29 18:35:39'),
(9, 'Hany Elnashar', 'he@gmail.com', NULL, '$2y$10$l4TIeQKHsqEYx0AGeT01BuUhZz3hZlPztoyaG6VBHwK0A.DEPpTqq', 'doctor', '3', NULL, '2020-09-29 18:45:21', '2020-09-29 18:45:21'),
(10, 'Mohamed Kayed', 'mk@gmail.com', NULL, '$2y$10$tZdSwrqgC5msDtIaILyJduNt9cambay4cM4/O6ivL6BQuHdIJBxpu', 'doctor', '4', NULL, '2020-09-29 20:08:18', '2020-09-30 07:04:08'),
(11, 'admin1', 'a1@gmail.com', NULL, '$2y$10$36Hng70St4d4SZJLIV16iO.jP4PPtVKoLNuZom9pugLg2WKdhKLEW', 'admin', '1', NULL, '2020-09-29 20:22:26', '2020-09-29 20:22:26'),
(14, 'Mohamed Alaa', 'mae@gm.com', NULL, '$2y$10$w1LDZVjk46s1Kri.fNtdwuWAgRK5xAiO455eEwLDfxKSGCnmnCWa6', 'student', '5', NULL, NULL, '2020-09-30 07:11:03'),
(15, 'Khaled Mohamed Ali', 'kmm@gm.com', NULL, '$2y$10$w1LDZVjk46s1Kri.fNtdwuWAgRK5xAiO455eEwLDfxKSGCnmnCWa6', 'student', '4', NULL, NULL, NULL);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student_assignments`
--
ALTER TABLE `student_assignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `student_subjects`
--
ALTER TABLE `student_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
