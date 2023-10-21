-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2023 at 03:36 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jwt-auth`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `image` varchar(55) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `hoverImage` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `name`, `description`, `image`, `hoverImage`, `created_at`, `updated_at`) VALUES
(4, 'Art', NULL, 'http://127.0.0.1:8000/images/activities/im3.png', 'http://127.0.0.1:8000/images/activities/213.png', '2023-08-03 23:09:09', NULL),
(5, 'music', NULL, 'http://127.0.0.1:8000/images/activities/im5.png', 'http://127.0.0.1:8000/images/activities/215.png', '2023-08-03 23:09:09', NULL),
(6, 'sport', NULL, 'http://127.0.0.1:8000/images/activities/112.png', 'http://127.0.0.1:8000/images/activities/212.png', '2023-08-03 23:10:01', NULL),
(7, 'cultural', NULL, 'http://127.0.0.1:8000/images/activities/Fav.png', 'http://127.0.0.1:8000/images/activities/223.png', '2023-08-03 23:10:01', NULL),
(8, 'religious', NULL, 'http://127.0.0.1:8000/images/activities/im9.png', 'http://127.0.0.1:8000/images/activities/218.png', '2023-08-03 23:10:39', NULL),
(9, 'social', NULL, 'http://127.0.0.1:8000/images/activities/jour.png', 'http://127.0.0.1:8000/images/activities/jour2.png', '2023-08-03 23:10:39', NULL),
(10, 'fashion & beauty', NULL, 'http://127.0.0.1:8000/images/activities/im1.png', 'http://127.0.0.1:8000/images/activities/211.png', '2023-08-05 19:29:03', NULL),
(11, 'Kitchen', 'zzzzzz', 'http://127.0.0.1:8000/images/activities/im4.png', 'http://127.0.0.1:8000/images/activities/214.png', '2023-08-20 14:56:19', NULL),
(12, 'spiritual & religious', 'zzzzz', 'http://127.0.0.1:8000/images/activities/im6.png', 'http://127.0.0.1:8000/images/activities/216.png', '2023-08-20 14:56:19', NULL),
(13, 'science & health', NULL, 'http://127.0.0.1:8000/images/activities/im7.png', 'http://127.0.0.1:8000/images/activities/217.png', '2023-08-20 14:56:58', NULL),
(14, 'Economy', NULL, 'http://127.0.0.1:8000/images/activities/im10.png', 'http://127.0.0.1:8000/images/activities/219.png', '2023-08-20 14:56:58', NULL),
(15, 'Policy', NULL, 'http://127.0.0.1:8000/images/activities/im11.png', 'http://127.0.0.1:8000/images/activities/220.png', '2023-08-20 14:57:16', NULL),
(16, 'Nature', NULL, 'http://127.0.0.1:8000/images/activities/im12.png', 'http://127.0.0.1:8000/images/activities/221.png', '2023-08-20 14:57:16', NULL),
(17, 'high tech', NULL, 'http://127.0.0.1:8000/images/activities/highttec.png', 'http://127.0.0.1:8000/images/activities/224.png', '2023-08-20 14:58:07', NULL),
(18, 'Home & decoration', NULL, 'http://127.0.0.1:8000/images/activities/125.png', 'http://127.0.0.1:8000/images/activities/225.png', '2023-08-20 14:58:07', NULL),
(19, 'Creativity', NULL, 'http://127.0.0.1:8000/images/activities/creativ.png', 'http://127.0.0.1:8000/images/activities/226.png', '2023-08-20 14:58:55', NULL),
(21, 'Education', NULL, 'http://127.0.0.1:8000/images/activities/ta2.png', 'http://127.0.0.1:8000/images/activities/2ta2.png', '2023-08-20 14:59:13', NULL),
(22, 'Mechanical', NULL, 'http://127.0.0.1:8000/images/activities/ta3.png', 'http://127.0.0.1:8000/images/activities/2ta3.png', '2023-08-20 14:59:13', NULL),
(23, 'Animals', '', 'http://127.0.0.1:8000/images/activities/ta4.png', 'http://127.0.0.1:8000/images/activities/2ta4.png', '2023-08-20 14:59:33', NULL),
(24, 'Humor', NULL, 'http://127.0.0.1:8000/images/activities/hum.png', 'http://127.0.0.1:8000/images/activities/hum2.png', '2023-08-20 14:59:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `body`, `created_at`, `updated_at`, `deleted_at`) VALUES
(23, 67, 37, 'aaaaaaas', '2023-09-01 17:33:23', '2023-09-01 17:33:23', NULL),
(24, 67, 37, 'aaaaaaas', '2023-09-01 17:33:49', '2023-09-01 17:33:49', NULL),
(25, 67, 38, 'aaaxxzz', '2023-09-02 08:52:06', '2023-09-02 08:52:06', NULL),
(26, 79, 38, 'hhhhhhhhhhhhhhhhhhhhhhhhhhhh', '2023-09-02 09:20:30', '2023-09-02 09:20:30', NULL),
(27, 79, 38, 'hhhhhhhhhhhhhhhhhhhlhghfgjkyihl', '2023-09-02 09:22:03', '2023-09-02 09:22:03', NULL),
(28, 79, 38, 'zxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '2023-09-02 17:52:16', '2023-09-02 17:52:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` bigint(50) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `follower_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp(5) NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hrefs`
--

CREATE TABLE `hrefs` (
  `id` bigint(50) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `hrefs`
--

INSERT INTO `hrefs` (`id`, `name`, `link`, `image`, `created_at`) VALUES
(1, 'Live Video', NULL, 'http://127.0.0.1:8000/images/sideBar/ri.png', '2023-08-08 19:53:20'),
(2, 'Answers', NULL, 'http://127.0.0.1:8000/images/sideBar/accueil.png', '2023-08-08 19:55:34'),
(3, 'Libraries', NULL, 'http://127.0.0.1:8000/images/sideBar/9.png', '2023-08-08 19:57:54'),
(4, 'Create a FootMark', NULL, 'http://127.0.0.1:8000/images/sideBar/5.png', '2023-08-09 00:46:47'),
(5, 'Workshops', NULL, 'http://127.0.0.1:8000/images/sideBar/6.png', '2023-08-09 00:57:27'),
(6, 'Create a Workshop', NULL, 'http://127.0.0.1:8000/images/sideBar/8.png', '2023-08-09 00:57:32'),
(7, 'Favorites', NULL, 'http://127.0.0.1:8000/images/sideBar/ceo.png', '2023-08-09 00:47:57'),
(8, 'My Interests', 'interests/myFav', 'http://127.0.0.1:8000/images/sideBar/7.png', '2023-08-20 13:45:04');

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE `interests` (
  `id` bigint(50) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `activity_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `interests`
--

INSERT INTO `interests` (`id`, `user_id`, `activity_id`) VALUES
(124, 37, 4),
(125, 37, 5),
(126, 37, 6),
(127, 37, 7),
(128, 37, 12),
(129, 37, 11),
(130, 37, 10),
(131, 37, 18),
(132, 37, 17),
(133, 37, 13),
(134, 37, 21),
(135, 37, 8),
(136, 47, 11),
(137, 47, 12),
(138, 47, 13),
(139, 47, 7),
(140, 47, 18),
(141, 38, 5),
(142, 38, 6),
(143, 38, 8);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(6, '2023_04_06_011050_create_posts_table', 1),
(7, '2023_04_06_011128_create_comments_table', 1),
(8, '2014_10_12_000000_create_users_table', 2),
(9, '2014_10_12_100000_create_password_reset_tokens_table', 2),
(10, '2019_08_19_000000_create_failed_jobs_table', 2),
(11, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(12, '2023_03_16_090541_create_todos_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` varchar(350) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('draft','public','private','friends') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `activity_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `status`, `user_id`, `activity_id`, `created_at`, `updated_at`, `image`, `video`) VALUES
(66, 'aaaaaa', 'dthis is a trial paragraph to checkthis is a trial paragraph to checkthis is a trial paragraph to checkthis is a trial paragraph to check', 'public', 37, 8, '2023-09-01 15:26:18', '2023-09-01 15:26:18', 'http://127.0.0.1:8000/images/1693592778.jpg', NULL),
(67, 'this is a trial paragraph to check', 'this is a trial paragraph to checkthis is a trial paragraph to check', 'public', 37, 14, '2023-09-01 15:33:34', '2023-09-01 15:33:34', NULL, 'http://127.0.0.1:8000/videos/1693593213.m4v'),
(68, 'cccc', 'vvvvvvvvvvvvvvvvvvv', 'public', 37, 16, '2023-09-01 19:51:51', '2023-09-01 19:51:51', 'http://127.0.0.1:8000/images/1693608710.jpg', NULL),
(69, 'Cristaiono Ronalodo', 'Cristiano Is a famous football player and he is the one of the best players in the world .', 'public', 37, 6, '2023-09-01 21:08:22', '2023-09-01 21:08:22', 'http://127.0.0.1:8000/images/1693613302.jpg', NULL),
(73, 'Good Movii', 'All actors In This film they more Attractive in cinma .but for me i love jashon', 'public', 47, 4, '2023-09-01 22:48:29', '2023-09-01 22:48:29', 'http://127.0.0.1:8000/images/1693619309.jpg', NULL),
(74, 'this for me', 'Use this modal component to show images, colors, cards, and text data for an existing product from the database.', 'private', 47, 13, '2023-09-02 00:20:15', '2023-09-02 00:20:15', 'http://127.0.0.1:8000/images/1693624815.jpg', NULL),
(78, 'Its me hello', 'this is for profile', 'public', 48, 9, '2023-09-02 01:29:45', '2023-09-02 01:29:45', 'http://127.0.0.1:8000/images/1693628985.jpg', NULL),
(79, 'Amir Eid', 'is An egyption rab singer', 'public', 38, 5, '2023-09-02 01:35:10', '2023-09-02 01:35:10', NULL, 'http://127.0.0.1:8000/videos/1693629310.mp4'),
(80, 'aaaaaaaaaaaaaaaaad', 'dddaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasadssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssd', 'public', 38, 10, '2023-09-02 17:53:42', '2023-09-02 17:53:42', NULL, NULL),
(81, 'aaaaaaaaaaaaaaaaad', 'dddaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasadssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssd', 'public', 38, 10, '2023-09-02 17:53:43', '2023-09-02 17:53:43', NULL, NULL),
(82, 'xxxz', 'aaaaaaaaaasdasssssssssscxqasddddddddddddddddddddddddddddddddddasdadasdasddddddddddddddddddddddddddddddddddddddddddddddddddddddddassssssssssssssssssssssssssssssssssssssssasdasddasdd', 'public', 38, 14, '2023-09-04 10:17:48', '2023-09-04 10:17:48', NULL, NULL),
(83, 'sassasasc', 'aaassss saaaaaa assssssss asssssss saaaa asssssss saaaaaaas asssss saaaaa saaaaaa  ass s aassssscsaaassss assssssssssssssc assssssssc aaaaaaaaaaaaaaaaac aaaaaaaaaaaaaaaaaaaaaasc saaaaaaaacxxacasssssss aaaaaaaaaaaaaaaaaaaacas        as', 'public', 38, 6, '2023-09-04 10:33:08', '2023-09-04 10:33:08', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rules`
--

CREATE TABLE `rules` (
  `id` bigint(5) NOT NULL,
  `name` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `rules`
--

INSERT INTO `rules` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(1, 'General', 'http://127.0.0.1:8000/images/profiles/1am.png', '2023-07-08 13:59:27', '2023-07-08 14:00:12'),
(2, 'Specialist', 'http://127.0.0.1:8000/images/profiles/2sp.png', '2023-07-08 13:59:27', '2023-07-08 14:00:12'),
(3, 'Artist', 'http://127.0.0.1:8000/images/profiles/3ar.png', '2023-07-08 14:00:48', '2023-07-08 14:00:48');

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

CREATE TABLE `todos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `todos`
--

INSERT INTO `todos` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'sssssssssssdassadsads', 'sssssadssssss', '2023-06-20 21:12:47', '2023-06-20 21:12:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `rule_id` bigint(5) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_nopad_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `rule_id`, `password`, `remember_token`, `image`, `created_at`, `updated_at`) VALUES
(37, 'abdoo', 'abdo@example.com', NULL, 1, '$2y$10$dtPUgxXe5.EX2ptFRCU/3OqE3dQLrZDF4AotLaf7Cx/mQZtLmtpHO', NULL, 'http://127.0.0.1:8000/images/profiles/1691160473.jpg', '2023-08-04 11:47:53', '2023-08-04 11:47:53'),
(38, 'demo', 'abdo2@example.com', NULL, 1, '$2y$10$dtPUgxXe5.EX2ptFRCU/3OqE3dQLrZDF4AotLaf7Cx/mQZtLmtpHO', NULL, 'http://127.0.0.1:8000/images/profiles/1691279804.png', '2023-08-05 20:56:44', '2023-08-05 20:56:44'),
(47, 'Moo', 'abdo1@example.com', NULL, 2, '$2y$10$xaoLR2r2LImlZb2.oOWwl.AXUAVrJubvqD1Hic3Dxgl96wz2YzhHW', NULL, 'http://127.0.0.1:8000/images/profiles/1693618867.png', '2023-09-01 22:41:08', '2023-09-01 22:41:08'),
(48, 'Ommda', 'abdo3@example.com', NULL, 3, '$2y$10$10eXw2wpbPvTzKZNGgswZOJeCyCUnsyNcfFWZz1oUIAJO00FWPO6G', NULL, 'http://127.0.0.1:8000/images/profiles/1693627398.jpg', '2023-09-02 01:03:19', '2023-09-02 01:03:19');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `id` bigint(20) NOT NULL,
  `gender` enum('Male','Female') COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `bio` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `mobile` varchar(30) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `countery` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `city` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `avatar` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cover` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(5) NOT NULL DEFAULT current_timestamp(5) ON UPDATE current_timestamp(5),
  `deleted_at` timestamp(5) NOT NULL DEFAULT current_timestamp(5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`id`, `gender`, `bio`, `mobile`, `date_of_birth`, `countery`, `city`, `avatar`, `cover`, `user_id`, `created_at`, `deleted_at`) VALUES
(2, 'Male', 'engerier', '01090962585', '2023-08-04', 'Egypt', 'Menofeya', 'http://127.0.0.1:8000/images/profiles/1691160473.j', 'aaaaaaaaaaa', 37, '2023-08-12 16:07:33.91409', '0000-00-00 00:00:00.00000'),
(12, 'Male', 'يييييي', '0106899585', '2023-08-09', 'aaaaaa', 'العاشر', 'xxxx', 'cccc', 38, '2023-08-17 17:11:45.03272', '2023-08-17 17:11:45.03272'),
(14, 'Male', 'lorium ipseam lorium ipseam lorium ipseam', '01090949868', '2023-09-07', 'Egypt', 'Mohandseen', 'xxxx', 'cccc', 47, '2023-09-02 01:51:18.03704', '2023-09-02 01:51:18.03704');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `follower_id` (`follower_id`);

--
-- Indexes for table `hrefs`
--
ALTER TABLE `hrefs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `activity_id` (`activity_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `activity_id` (`activity_id`);

--
-- Indexes for table `rules`
--
ALTER TABLE `rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `rule_id` (`rule_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` bigint(50) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `hrefs`
--
ALTER TABLE `hrefs`
  MODIFY `id` bigint(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `interests`
--
ALTER TABLE `interests`
  MODIFY `id` bigint(50) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `rules`
--
ALTER TABLE `rules`
  MODIFY `id` bigint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `todos`
--
ALTER TABLE `todos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `followers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `followers_ibfk_2` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `interests`
--
ALTER TABLE `interests`
  ADD CONSTRAINT `interests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `interests_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`rule_id`) REFERENCES `rules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_info`
--
ALTER TABLE `user_info`
  ADD CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
