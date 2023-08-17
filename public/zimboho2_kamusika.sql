-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 14, 2022 at 07:38 AM
-- Server version: 10.3.36-MariaDB-cll-lve
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zimboho2_kamusika`
--

-- --------------------------------------------------------

--
-- Table structure for table `adverts`
--

CREATE TABLE `adverts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frontend_type` smallint(6) DEFAULT NULL,
  `is_filterable` tinyint(1) NOT NULL DEFAULT 0,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `code`, `name`, `frontend_type`, `is_filterable`, `is_required`, `created_at`, `updated_at`) VALUES
(1, '1', 'Color', 1, 0, 0, NULL, NULL),
(2, '2', 'Size', 1, 0, 0, NULL, NULL),
(3, '3', 'Weight', 1, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `menu` tinyint(1) NOT NULL DEFAULT 0,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `parent_id`, `featured`, `menu`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Clothing', NULL, 'Silence', NULL, 1, 1, NULL, NULL, NULL),
(2, 'Personal Gadjets', NULL, 'Silence', NULL, 0, 1, NULL, NULL, NULL),
(3, 'Cosmetics', NULL, 'Silence', NULL, 0, 1, NULL, NULL, NULL),
(4, 'Cars', NULL, 'Silence', NULL, 0, 1, NULL, NULL, NULL),
(5, 'Stationery', NULL, 'Silence', NULL, 0, 1, NULL, NULL, NULL),
(6, 'Hardware & Electronics', NULL, 'Silence', NULL, 0, 1, NULL, NULL, NULL),
(7, 'Home Furniture & Tools', NULL, 'Silence', NULL, 0, 1, NULL, NULL, NULL),
(8, 'Shoes', NULL, 'Silence', 1, 1, 1, NULL, NULL, NULL),
(9, 'Baby Wear', NULL, 'Silence', 1, 0, 1, NULL, NULL, NULL),
(10, 'Clothing ', NULL, 'Silence', 1, 1, 1, NULL, NULL, NULL),
(11, 'Phones', NULL, 'Silence', 2, 0, 1, NULL, NULL, NULL),
(12, 'Laptops', NULL, 'Silence', 2, 0, 1, NULL, NULL, NULL),
(13, 'Accessories', NULL, 'Silence', 2, 1, 1, NULL, NULL, NULL),
(14, 'Hair Products', NULL, 'Silence', 3, 0, 1, NULL, NULL, NULL),
(15, 'Toiletries', NULL, 'Silence', 3, 0, 1, NULL, NULL, NULL),
(20, 'Stationery', NULL, 'Silence', 5, 0, 1, NULL, NULL, NULL),
(22, 'Tools', NULL, 'Silence', 6, 0, 0, NULL, NULL, NULL),
(23, 'Components', NULL, 'Silence', 6, 0, 0, NULL, NULL, NULL),
(24, 'Parts', NULL, 'Silence', 6, 0, 0, NULL, NULL, NULL),
(25, 'Safety Wear', NULL, 'Silence', 6, 0, 0, NULL, NULL, NULL),
(26, 'Gardening', NULL, 'Silence', 7, 0, 0, NULL, NULL, NULL),
(27, 'Furniture', NULL, 'Silence', 7, 0, 0, NULL, NULL, NULL),
(28, 'Appliances', NULL, 'Silence', 7, 0, 0, NULL, NULL, NULL),
(29, 'Other', NULL, 'Silence', NULL, 0, 0, NULL, NULL, NULL),
(30, 'Other', NULL, 'Silence', 1, 0, 1, NULL, NULL, NULL),
(31, 'Kitchenware', 'kitchenware', 'Pots, pans and everything nice.', NULL, 0, 1, NULL, NULL, NULL),
(32, 'Pots & Pans', 'pots&pans', NULL, 31, 0, 1, NULL, NULL, NULL),
(33, 'Plates', 'plates', NULL, NULL, 0, 1, NULL, NULL, NULL),
(34, 'Kitchen Essentials', 'kitchen-essentials', NULL, 31, 0, 1, NULL, NULL, NULL),
(35, 'Plasticware', 'plasticware', NULL, 31, 0, 1, NULL, NULL, NULL),
(36, 'Knives', 'knives', NULL, 31, 0, 1, NULL, NULL, NULL),
(37, 'Baking Equipment', 'baking-equipment', NULL, 31, 0, 1, NULL, NULL, NULL),
(38, 'Cups', 'cups', NULL, 31, 0, 1, NULL, NULL, NULL),
(39, 'Bowls', 'bowls', NULL, 31, 0, 1, NULL, NULL, NULL),
(40, 'Bags', 'bags', NULL, 1, 1, 1, NULL, NULL, NULL),
(41, 'Jeans', 'jeans', NULL, 2, 0, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` tinyint(1) NOT NULL DEFAULT 0,
  `reply_to` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `product_id`, `post_id`, `comment`, `reply`, `reply_to`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 2, 'May we have this', 0, NULL, '2021-04-13 21:03:28', '2021-04-13 21:03:28'),
(2, 7, NULL, 2, '🤣🤣🤣who is commenting', 0, NULL, '2021-04-17 18:13:44', '2021-04-17 18:13:44'),
(3, 1, 2, NULL, '1', 0, NULL, '2021-05-10 17:12:45', '2021-05-10 17:12:45'),
(4, 1, 45, NULL, 'What are th available sizes.', 0, NULL, '2021-05-28 13:18:28', '2021-05-28 13:18:28'),
(5, 66, NULL, 9, 'Need 1', 0, NULL, '2021-06-24 12:59:48', '2021-06-24 12:59:48'),
(6, 1, NULL, 15, 'Hi', 0, NULL, '2022-09-29 14:58:51', '2022-09-29 14:58:51');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_id` bigint(20) NOT NULL,
  `contact_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `owner_id`, `contact_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, NULL, NULL),
(2, 1, 3, NULL, NULL),
(3, 1, 8, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 1, 1, NULL, NULL),
(6, 14, 8, NULL, NULL),
(7, 5, 1, NULL, NULL),
(8, 19, 19, NULL, NULL),
(9, 19, 21, NULL, NULL),
(10, 2, 21, NULL, NULL),
(11, 19, 19, NULL, NULL),
(12, 19, 19, NULL, NULL),
(13, 5, 22, NULL, NULL),
(14, 19, 19, NULL, NULL),
(15, 22, 21, NULL, NULL),
(16, 29, 2, NULL, NULL),
(17, 29, 29, NULL, NULL),
(18, 29, 29, NULL, NULL),
(19, 27, 3, NULL, NULL),
(20, 27, 3, NULL, NULL),
(21, 34, 19, NULL, NULL),
(23, 36, 34, NULL, NULL),
(24, 1, 2, NULL, NULL),
(25, 1, 21, NULL, NULL),
(26, 1, 22, NULL, NULL),
(27, 1, 25, NULL, NULL),
(28, 45, 3, NULL, NULL),
(29, 45, 43, NULL, NULL),
(30, 46, 2, NULL, NULL),
(31, 46, 21, NULL, NULL),
(32, 46, 3, NULL, NULL),
(33, 46, 19, NULL, NULL),
(34, 46, 37, NULL, NULL),
(35, 1, 44, NULL, NULL),
(36, 63, 33, NULL, NULL),
(37, 47, 47, NULL, NULL),
(38, 47, 50, NULL, NULL),
(39, 25, 25, NULL, NULL),
(41, 43, 2, NULL, NULL),
(42, 69, 33, NULL, NULL),
(43, 25, 52, NULL, NULL),
(44, 1, 43, NULL, NULL),
(45, 1, 19, NULL, NULL);

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
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `reply` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `body`, `is_read`, `reply`, `created_at`, `updated_at`) VALUES
(1, 1, 'Baw', 1, 0, '2021-04-13 22:20:16', '2021-05-15 19:59:48'),
(2, 1, 'Baw', 0, 1, '2021-04-13 22:20:16', '2021-04-13 22:20:16'),
(3, 1, 'Good day 90swerve. I would like to make an order for 3 Big Boobed Females', 1, 0, '2021-04-15 16:36:48', '2021-04-23 05:59:50'),
(4, 3, 'Good day 90swerve. I would like to make an order for 3 Big Boobed Females', 0, 1, '2021-04-15 16:36:48', '2021-04-15 16:36:48'),
(5, 1, 'I have placed a new order. Thank you. ', 0, 1, '2021-04-17 18:27:30', '2021-04-17 18:27:30'),
(6, 1, 'I have placed a new order. Thank you. ', 1, 0, '2021-04-17 18:27:33', '2021-05-15 19:59:48'),
(7, 1, 'I have placed a new order. Thank you. ', 0, 1, '2021-04-17 18:27:57', '2021-04-17 18:27:57'),
(8, 1, 'I have placed a new order. Thank you. ', 1, 0, '2021-04-17 18:27:58', '2021-05-15 19:59:48'),
(9, 1, 'I have placed a new order. Thank you. ', 0, 1, '2021-04-17 18:28:17', '2021-04-17 18:28:17'),
(10, 1, 'I have placed a new order. Thank you. ', 1, 0, '2021-04-17 18:28:18', '2021-05-15 19:59:48'),
(11, 5, 'Punungwe 😂😂😂', 1, 0, '2021-04-18 11:53:33', '2021-05-09 12:21:19'),
(12, 1, 'Punungwe 😂😂😂', 0, 1, '2021-04-18 11:53:33', '2021-04-18 11:53:33'),
(13, 5, 'Gift tha boy 🥶🥶', 1, 0, '2021-04-18 11:54:08', '2021-05-09 12:21:19'),
(14, 1, 'Gift tha boy 🥶🥶', 0, 1, '2021-04-18 11:54:08', '2021-04-18 11:54:08'),
(15, 3, '😍😍😍😍 sorry we dont have those', 0, 0, '2021-04-18 11:55:28', '2021-04-18 11:55:28'),
(16, 1, '😍😍😍😍 sorry we dont have those', 0, 1, '2021-04-18 11:55:28', '2021-04-18 11:55:28'),
(17, 5, 'You are sauce mukuru.', 1, 0, '2021-04-23 05:28:46', '2021-05-09 12:21:19'),
(18, 1, 'You are sauce mukuru.', 0, 1, '2021-04-23 05:28:50', '2021-04-23 05:28:50'),
(19, 1, 'I have placed a new order. Thank you. ', 0, 1, '2021-05-09 10:53:51', '2021-05-09 10:53:51'),
(20, 1, 'I have placed a new order. Thank you. ', 1, 0, '2021-05-09 10:53:54', '2021-05-15 19:59:48'),
(21, 1, 'What\'s good bro?', 1, 0, '2021-05-09 12:20:55', '2021-05-15 19:58:58'),
(22, 5, 'What\'s good bro?', 0, 1, '2021-05-09 12:20:55', '2021-05-09 12:20:55'),
(23, 1, 'Haisi kuvhunika zveshuwa', 1, 0, '2021-05-09 12:21:18', '2021-05-15 19:58:58'),
(24, 5, 'Haisi kuvhunika zveshuwa', 0, 1, '2021-05-09 12:21:18', '2021-05-09 12:21:18'),
(25, 18, 'I have placed a new order. Thank you. ', 0, 1, '2021-05-10 12:24:22', '2021-05-10 12:24:22'),
(26, 1, 'I have placed a new order. Thank you. ', 0, 0, '2021-05-10 12:24:23', '2021-05-10 12:24:23'),
(27, 5, 'I have placed a new order. Thank you. ', 0, 1, '2021-05-11 19:00:42', '2021-05-11 19:00:42'),
(28, 1, 'I have placed a new order. Thank you. ', 1, 0, '2021-05-11 19:00:44', '2021-05-15 19:58:58'),
(29, 1, 'Maya', 0, 0, '2021-05-15 19:59:58', '2021-05-15 19:59:58'),
(30, 1, 'Maya', 0, 1, '2021-05-15 20:00:03', '2021-05-15 20:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `message_user`
--

CREATE TABLE `message_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `message_user`
--

INSERT INTO `message_user` (`id`, `message_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 3, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 5, 1, NULL, NULL),
(6, 6, 1, NULL, NULL),
(7, 7, 1, NULL, NULL),
(8, 8, 1, NULL, NULL),
(9, 9, 1, NULL, NULL),
(10, 10, 1, NULL, NULL),
(11, 11, 1, NULL, NULL),
(12, 12, 5, NULL, NULL),
(13, 13, 1, NULL, NULL),
(14, 14, 5, NULL, NULL),
(15, 15, 1, NULL, NULL),
(16, 16, 3, NULL, NULL),
(17, 17, 1, NULL, NULL),
(18, 18, 5, NULL, NULL),
(19, 19, 1, NULL, NULL),
(20, 20, 1, NULL, NULL),
(21, 21, 5, NULL, NULL),
(22, 22, 1, NULL, NULL),
(23, 23, 5, NULL, NULL),
(24, 24, 1, NULL, NULL),
(25, 25, 18, NULL, NULL),
(26, 26, 18, NULL, NULL),
(27, 27, 5, NULL, NULL),
(28, 28, 5, NULL, NULL),
(29, 29, 1, NULL, NULL),
(30, 30, 1, NULL, NULL),
(31, 1, 1, NULL, NULL),
(32, 2, 19, NULL, NULL),
(33, 3, 1, NULL, NULL),
(34, 4, 2, NULL, NULL),
(35, 5, 1, NULL, NULL),
(36, 6, 2, NULL, NULL),
(37, 7, 1, NULL, NULL),
(38, 8, 2, NULL, NULL),
(39, 9, 1, NULL, NULL),
(40, 10, 2, NULL, NULL),
(41, 11, 1, NULL, NULL),
(42, 12, 2, NULL, NULL),
(43, 13, 1, NULL, NULL),
(44, 14, 1, NULL, NULL),
(45, 15, 2, NULL, NULL),
(46, 16, 1, NULL, NULL),
(47, 17, 2, NULL, NULL),
(48, 18, 2, NULL, NULL),
(49, 19, 1, NULL, NULL),
(50, 20, 1, NULL, NULL),
(51, 21, 2, NULL, NULL),
(52, 22, 1, NULL, NULL),
(53, 23, 2, NULL, NULL),
(54, 24, 1, NULL, NULL),
(55, 25, 2, NULL, NULL),
(56, 26, 1, NULL, NULL),
(57, 27, 2, NULL, NULL),
(58, 28, 1, NULL, NULL),
(59, 29, 2, NULL, NULL),
(60, 30, 1, NULL, NULL),
(61, 31, 1, NULL, NULL),
(62, 32, 2, NULL, NULL),
(63, 33, 1, NULL, NULL),
(64, 34, 1, NULL, NULL),
(65, 35, 2, NULL, NULL),
(66, 36, 1, NULL, NULL),
(67, 37, 2, NULL, NULL),
(68, 38, 1, NULL, NULL),
(69, 39, 2, NULL, NULL),
(70, 40, 1, NULL, NULL),
(71, 41, 2, NULL, NULL),
(72, 42, 1, NULL, NULL),
(73, 43, 2, NULL, NULL),
(74, 44, 1, NULL, NULL),
(75, 45, 2, NULL, NULL),
(76, 46, 1, NULL, NULL),
(77, 47, 2, NULL, NULL),
(78, 48, 1, NULL, NULL),
(79, 49, 2, NULL, NULL),
(80, 50, 1, NULL, NULL),
(81, 51, 2, NULL, NULL),
(82, 52, 1, NULL, NULL),
(83, 53, 2, NULL, NULL),
(84, 54, 1, NULL, NULL),
(85, 55, 2, NULL, NULL),
(86, 56, 38, NULL, NULL),
(87, 57, 2, NULL, NULL),
(88, 58, 1, NULL, NULL),
(89, 61, 2, NULL, NULL),
(90, 63, 2, NULL, NULL),
(91, 65, 27, NULL, NULL),
(92, 67, 1, NULL, NULL),
(93, 68, 1, NULL, NULL),
(94, 69, 1, NULL, NULL),
(95, 71, 1, NULL, NULL),
(96, 73, 44, NULL, NULL),
(97, 75, 25, NULL, NULL),
(98, 78, 7, NULL, NULL);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2018_12_23_120000_create_shoppingcart_table', 1),
(5, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '2020_05_21_100000_create_teams_table', 1),
(8, '2020_05_21_200000_create_team_user_table', 1),
(9, '2020_05_21_300000_create_team_invitations_table', 1),
(10, '2021_02_05_080208_create_sessions_table', 1),
(11, '2021_02_18_120140_add_role_column_to_user_table', 1),
(12, '2021_02_18_122357_create_shops_table', 1),
(13, '2021_03_05_083003_create_products_table', 1),
(14, '2021_03_21_140711_create_categories_table', 1),
(15, '2021_03_21_142217_create_product_categories_table', 1),
(16, '2021_03_22_143138_create_posts_table', 1),
(17, '2021_03_22_155752_create_comments_table', 1),
(18, '2021_03_22_155937_create_ratings_table', 1),
(19, '2021_03_22_160014_create_messages_table', 1),
(20, '2021_03_22_163341_create_likes_table', 1),
(21, '2021_03_28_120315_create_message_user_table', 1),
(22, '2021_03_29_122033_create_orders_table', 1),
(23, '2021_03_29_131209_create_order_items_table', 1),
(24, '2021_03_29_132445_create_contacts_table', 1),
(25, '2021_03_29_133433_create_notifications_table', 1),
(26, '2021_04_01_072441_create_tags_table', 1),
(27, '2021_04_01_072857_create_product_tag_table', 1),
(28, '2021_04_02_132344_create_order_shop_table', 1),
(29, '2021_04_02_133817_create_order_product_table', 1),
(30, '2021_04_06_143424_create_subscriptions_table', 1),
(31, '2021_04_07_103831_create_adverts_table', 1),
(32, '2021_04_08_160224_create_wishlists_table', 1),
(33, '2021_04_12_164309_create_attributes_table', 1),
(34, '2021_04_12_164345_create_attribute_values_table', 1),
(35, '2021_04_12_164445_create_product_attribute_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `created_at`, `updated_at`, `user_id`, `title`, `description`) VALUES
(1, '2021-05-21 16:08:04', '2021-05-21 16:08:04', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(2, '2021-05-21 16:08:13', '2021-05-21 16:08:13', 19, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a7e8f4d8b8e'),
(3, '2021-05-21 17:53:43', '2021-05-21 17:53:43', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(4, '2021-05-21 17:53:49', '2021-05-21 17:53:49', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a801b7ce2f5'),
(5, '2021-05-21 18:08:20', '2021-05-21 18:08:20', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(6, '2021-05-21 18:08:23', '2021-05-21 18:08:23', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a80524edfdd'),
(7, '2021-05-21 18:16:02', '2021-05-21 18:16:02', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(8, '2021-05-21 18:16:05', '2021-05-21 18:16:05', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a806f2aaae1'),
(9, '2021-05-21 18:19:26', '2021-05-21 18:19:26', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(10, '2021-05-21 18:19:29', '2021-05-21 18:19:29', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a807beeb941'),
(11, '2021-05-21 22:33:51', '2021-05-21 22:33:51', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(12, '2021-05-21 22:33:57', '2021-05-21 22:33:57', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a8435f7c9b6'),
(13, '2021-05-21 22:36:02', '2021-05-21 22:36:02', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(14, '2021-05-21 22:36:04', '2021-05-21 22:36:04', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(15, '2021-05-21 22:36:06', '2021-05-21 22:36:06', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a843e29a759'),
(16, '2021-05-21 22:36:07', '2021-05-21 22:36:07', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(17, '2021-05-21 22:36:08', '2021-05-21 22:36:08', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a843e4bc46c'),
(18, '2021-05-21 22:36:10', '2021-05-21 22:36:10', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a843e7d93ee'),
(19, '2021-05-21 22:36:13', '2021-05-21 22:36:13', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(20, '2021-05-21 22:44:11', '2021-05-21 22:44:11', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(21, '2021-05-21 22:44:14', '2021-05-21 22:44:14', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a845cba82db'),
(22, '2021-05-21 23:52:14', '2021-05-21 23:52:14', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(23, '2021-05-21 23:52:20', '2021-05-21 23:52:20', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a855be5348a'),
(24, '2021-05-21 23:58:10', '2021-05-21 23:58:10', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(25, '2021-05-21 23:58:14', '2021-05-21 23:58:14', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a8572273a4e'),
(26, '2021-05-22 00:00:17', '2021-05-22 00:00:17', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(27, '2021-05-22 00:00:20', '2021-05-22 00:00:20', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a857a1bfc77'),
(28, '2021-05-22 00:03:10', '2021-05-22 00:03:10', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(29, '2021-05-22 00:03:13', '2021-05-22 00:03:13', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a8584ee5fea'),
(30, '2021-05-22 04:57:25', '2021-05-22 04:57:25', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(31, '2021-05-22 05:02:07', '2021-05-22 05:02:07', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(32, '2021-05-22 05:02:09', '2021-05-22 05:02:09', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a89e5f6b252'),
(33, '2021-05-22 05:33:01', '2021-05-22 05:33:01', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(34, '2021-05-22 05:33:18', '2021-05-22 05:33:18', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(35, '2021-05-22 05:33:22', '2021-05-22 05:33:22', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a8a5ac2bafa'),
(36, '2021-05-22 05:54:30', '2021-05-22 05:54:30', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(37, '2021-05-22 05:54:30', '2021-05-22 05:54:30', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a8aaa6d4ce0'),
(38, '2021-05-22 06:03:58', '2021-05-22 06:03:58', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(39, '2021-05-22 06:03:58', '2021-05-22 06:03:58', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a8acde82d49'),
(40, '2021-05-22 06:53:18', '2021-05-22 06:53:18', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(41, '2021-05-22 06:53:18', '2021-05-22 06:53:18', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a8b86e1e145'),
(42, '2021-05-22 06:54:42', '2021-05-22 06:54:42', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(43, '2021-05-22 06:54:42', '2021-05-22 06:54:42', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a8b8c219fbe'),
(44, '2021-05-22 06:56:31', '2021-05-22 06:56:31', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(45, '2021-05-22 06:56:31', '2021-05-22 06:56:31', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a8b92f74b1d'),
(46, '2021-05-22 07:11:12', '2021-05-22 07:11:12', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(47, '2021-05-22 07:11:12', '2021-05-22 07:11:12', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a8bca06bb74'),
(48, '2021-05-22 07:12:06', '2021-05-22 07:12:06', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(49, '2021-05-22 07:12:06', '2021-05-22 07:12:06', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a8bcd64e3b2'),
(50, '2021-05-22 07:19:25', '2021-05-22 07:19:25', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(51, '2021-05-22 07:19:25', '2021-05-22 07:19:25', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a8be8de9ac7'),
(52, '2021-05-22 07:42:04', '2021-05-22 07:42:04', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(53, '2021-05-22 07:42:04', '2021-05-22 07:42:04', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a8c3dc40f40'),
(54, '2021-05-22 07:54:40', '2021-05-22 07:54:40', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(55, '2021-05-22 07:54:40', '2021-05-22 07:54:40', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60a8c6d0c9941'),
(56, '2021-05-23 14:44:46', '2021-05-23 14:44:46', 38, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(57, '2021-05-23 14:44:46', '2021-05-23 14:44:46', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60aa786e994dc'),
(58, '2021-05-28 13:14:50', '2021-05-28 13:14:50', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(59, '2021-05-28 13:14:55', '2021-05-28 13:14:55', 1, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60b0fadacd4b3'),
(60, '2021-05-28 13:34:36', '2021-05-28 13:34:36', 27, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(61, '2021-05-29 15:24:11', '2021-05-29 15:24:11', 2, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(62, '2021-05-29 15:24:14', '2021-05-29 15:24:14', 37, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60b26aab117e0'),
(63, '2021-05-29 15:24:54', '2021-05-29 15:24:54', 2, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(64, '2021-05-29 15:24:55', '2021-05-29 15:24:55', 37, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60b26ad63b735'),
(65, '2021-05-30 06:51:01', '2021-05-30 06:51:01', 27, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(66, '2021-05-30 06:51:06', '2021-05-30 06:51:06', 44, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60b343e58c4cf'),
(67, '2021-05-31 11:23:55', '2021-05-31 11:23:55', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(68, '2021-05-31 11:24:41', '2021-05-31 11:24:41', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(69, '2021-05-31 11:29:24', '2021-05-31 11:29:24', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(70, '2021-05-31 11:29:33', '2021-05-31 11:29:33', 37, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60b4d6a43a86a'),
(71, '2021-05-31 11:34:16', '2021-05-31 11:34:16', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(72, '2021-05-31 11:34:29', '2021-05-31 11:34:29', 37, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60b4d7c8f0a83'),
(73, '2021-05-31 16:59:34', '2021-05-31 16:59:34', 44, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(74, '2021-05-31 16:59:36', '2021-05-31 16:59:36', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60b52406430a8'),
(75, '2021-06-01 08:36:47', '2021-06-01 08:36:47', 25, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(76, '2021-06-01 08:36:53', '2021-06-01 08:36:53', 48, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60b5ffaf4f3b6'),
(77, '2021-06-01 08:37:19', '2021-06-01 08:37:19', 25, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(78, '2021-06-02 11:33:11', '2021-06-02 11:33:11', 7, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(79, '2021-06-02 11:33:18', '2021-06-02 11:33:18', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60b77a8778493'),
(80, '2021-06-09 06:46:56', '2021-06-09 06:46:56', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(81, '2021-06-09 06:47:03', '2021-06-09 06:47:03', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60c071f0b319c'),
(82, '2021-06-09 06:47:05', '2021-06-09 06:47:05', 37, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60c071f0b319c'),
(83, '2021-06-11 13:41:11', '2021-06-11 13:41:11', 7, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(84, '2021-06-11 13:41:18', '2021-06-11 13:41:18', 2, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60c37607890b6'),
(85, '2021-06-12 11:54:50', '2021-06-12 11:54:50', 44, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(86, '2021-06-12 11:54:53', '2021-06-12 11:54:53', 44, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60c4ae9a5a10a'),
(87, '2021-06-12 11:54:54', '2021-06-12 11:54:54', 25, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60c4ae9a5a10a'),
(88, '2021-06-12 11:55:55', '2021-06-12 11:55:55', 44, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(89, '2021-06-12 11:55:57', '2021-06-12 11:55:57', 44, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60c4aedb6a85c'),
(90, '2021-06-12 11:55:58', '2021-06-12 11:55:58', 25, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60c4aedb6a85c'),
(91, '2021-06-24 07:16:17', '2021-06-24 07:16:17', 7, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(92, '2021-06-24 07:16:23', '2021-06-24 07:16:23', 37, '<a href=\"/owner\"> New Order </a>', 'You have a new order. Order number  60d43f510c5e0'),
(93, '2021-06-24 07:21:18', '2021-06-24 07:21:18', 7, ' <a href=\"/profile\">Order Completed</a>', 'Your order was successsfuly picked up. Order number 60d43f510c5e0. Thank you for shopping with Kamusika.'),
(94, '2021-06-24 07:21:18', '2021-06-24 07:21:18', 37, ' <a href=\"/profile\">Order Completed</a>', 'Order was successfuly picked up. Order number 60d43f510c5e0. We will be processing your transaction soon.'),
(95, '2021-11-10 06:07:41', '2021-11-10 06:07:41', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(96, '2021-11-10 06:08:14', '2021-11-10 06:08:14', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(97, '2022-03-04 04:35:32', '2022-03-04 04:35:32', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(98, '2022-04-18 19:05:20', '2022-04-18 19:05:20', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(99, '2022-09-29 14:59:35', '2022-09-29 14:59:35', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. '),
(100, '2022-09-29 15:03:19', '2022-09-29 15:03:19', 1, ' <a href=\"/profile\">Order Placed</a>', 'You have placed an order. Order will be ready in 2-4 days. ');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` smallint(6) NOT NULL,
  `item_count` int(11) NOT NULL,
  `grand_total` double(8,2) NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `payment_method` smallint(6) NOT NULL,
  `shipping_fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_type` smallint(6) NOT NULL,
  `billing_zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `status`, `item_count`, `grand_total`, `is_paid`, `payment_method`, `shipping_fullname`, `shipping_adress`, `shipping_city`, `shipping_state`, `shipping_zipcode`, `shipping_phone`, `notes`, `billing_fullname`, `billing_adress`, `billing_city`, `billing_state`, `shipping_type`, `billing_zipcode`, `billing_phone`, `created_at`, `updated_at`) VALUES
(57, '60b4d7c8f0a83', 1, 1, 1, 18.00, 0, 1, 'Tinashe Kundai', 'Corner Robert Mugabe and Third Street, City Centre, Central Business District, Harare', 'Harare', 'Zimbabwe', '1', '1', 'Default', 'Tinashe Kundai', '43', '34', '43', 1, '1', '1', '2021-05-31 11:34:16', '2021-06-04 15:36:26'),
(58, '60b52406430a8', 44, 0, 1, 12.00, 0, 1, 'Kamusika Accesories', 'Corner Robert Mugabe and Third Street, City Centre, Central Business District, Harare', 'Harare', 'Zimbabwe', '1', '1', 'werr', 'Kamusika Accesories', 'gjdi', '67t7p', 'jh57 d5', 1, '1', '1', '2021-05-31 16:59:34', '2021-05-31 16:59:34'),
(59, '60b5ffaf4f3b6', 25, 0, 1, 20.00, 0, 1, 'Rufaro Brenda', 'Corner Robert Mugabe and Third Street, City Centre, Central Business District, Harare', 'Harare', 'Zimbabwe', '1', '1', 'Default', 'Rufaro Brenda', '2193 Glen Norah A', 'Harare', 'Zimbabwe', 1, '1', '1', '2021-06-01 08:36:47', '2021-06-01 08:36:47'),
(60, '60b5ffcf2ab6d', 25, 0, 1, 500.00, 0, 1, 'Add Funds', 'virtual', 'virtual', 'virtual', '1', '0', 'Default', 'virtual', 'virtual', 'virtual', 'virtual', 2, '1', '1', '2021-06-01 08:37:19', '2021-06-01 08:37:19'),
(61, '60b77a8778493', 7, 1, 1, 12.00, 0, 1, 'Tatenda', 'Corner Robert Mugabe and Third Street, City Centre, Central Business District, Harare', 'Harare', 'Zimbabwe', '1', '1', 'Default', 'Tatenda', '76  Henley Drive Waterfalls', 'Harare', 'Zimbabwe', 1, '1', '1', '2021-06-02 11:33:11', '2021-06-04 15:37:50'),
(62, '60c071f0b319c', 1, 0, 2, 76.00, 0, 1, 'Tinashe Kundai', 'Corner Robert Mugabe and Third Street, City Centre, Central Business District, Harare', 'Harare', 'Zimbabwe', '1', '1', 'Default', 'Tinashe Kundai', '43', '34', '43', 1, '1', '1', '2021-06-09 06:46:56', '2021-06-09 06:46:56'),
(63, '60c37607890b6', 7, 2, 1, 12.00, 0, 1, 'Tatenda', 'Corner Robert Mugabe and Third Street, City Centre, Central Business District, Harare', 'Harare', 'Zimbabwe', '1', '1', 'Default', 'Tatenda', '76  Henley Drive Waterfalls', 'Harare', 'Zimbabwe', 1, '1', '1', '2021-06-11 13:41:11', '2021-06-11 13:41:20'),
(64, '60c4ae9a5a10a', 44, 0, 2, 50.00, 0, 1, 'Kamusika Accesories', 'Corner Robert Mugabe and Third Street, City Centre, Central Business District, Harare', 'Harare', 'Zimbabwe', '1', '1', 'Default', 'Kamusika Accesories', 'gjdi', '67t7p', 'jh57 d5', 1, '1', '1', '2021-06-12 11:54:50', '2021-06-12 11:54:50'),
(65, '60c4aedb6a85c', 44, 0, 2, 50.00, 0, 1, 'Kamusika Accesories', 'Corner Robert Mugabe and Third Street, City Centre, Central Business District, Harare', 'Harare', 'Zimbabwe', '1', '1', 'Default', 'Kamusika Accesories', 'gjdi', '67t7p', 'jh57 d5', 1, '1', '1', '2021-06-12 11:55:55', '2021-06-12 11:55:55'),
(66, '60d43f510c5e0', 7, 1, 1, 18.00, 0, 1, 'Tatenda', 'Corner Robert Mugabe and Third Street, City Centre, Central Business District, Harare', 'Harare', 'Zimbabwe', '1', '1', 'Default', 'Tatenda', '76  Henley Drive Waterfalls', 'Harare', 'Zimbabwe', 1, '1', '1', '2021-06-24 07:16:17', '2021-06-24 07:21:16'),
(67, '618b61ad6796e', 1, 0, 2, 25.00, 0, 1, 'Tinashe Kundai', 'Corner Robert Mugabe and Third Street, City Centre, Central Business District, Harare', 'Harare', 'Zimbabwe', '1', '1', 'Default', 'Tinashe Kundai', '43', '34', '43', 1, '1', '1', '2021-11-10 06:07:41', '2021-11-10 06:07:41'),
(68, '618b61ce005b6', 1, 0, 2, 25.00, 0, 1, 'Tinashe Kundai', 'Corner Robert Mugabe and Third Street, City Centre, Central Business District, Harare', 'Harare', 'Zimbabwe', '1', '1', 'Default', 'Tinashe Kundai', '43', '34', '43', 1, '1', '1', '2021-11-10 06:08:14', '2021-11-10 06:08:14'),
(69, '622197145cb44', 1, 0, 1, 7888.00, 0, 1, 'Add Funds', 'virtual', 'virtual', 'virtual', '1', '0', 'Default', 'virtual', 'virtual', 'virtual', 'virtual', 2, '1', '1', '2022-03-04 04:35:32', '2022-03-04 04:35:32'),
(70, '625dc480173e3', 1, 0, 1, 30.00, 0, 1, 'Tinashe Kundai', 'Corner Robert Mugabe and Third Street, City Centre, Central Business District, Harare', 'Harare', 'Zimbabwe', '1', '1', 'Default', 'Tinashe Kundai', '43', '34', '43', 1, '1', '1', '2022-04-18 19:05:20', '2022-04-18 19:05:20'),
(71, '6335c0e73746f', 1, 0, 1, 800.00, 0, 1, 'Add Funds', 'virtual', 'virtual', 'virtual', '1', '0', 'Default', 'virtual', 'virtual', 'virtual', 'virtual', 2, '1', '1', '2022-09-29 14:59:35', '2022-09-29 14:59:35'),
(72, '6335c1c7ddcd7', 1, 0, 1, 6.00, 0, 1, 'Tinashe Kundai', 'Corner Robert Mugabe and Third Street, City Centre, Central Business District, Harare', 'Harare', 'Zimbabwe', '1', '1', 'Default', 'Tinashe Kundai', '43', '34', '43', 1, '1', '1', '2022-09-29 15:03:19', '2022-09-29 15:03:19');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` double(8,2) NOT NULL DEFAULT 1.00,
  `attributes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `quantity`, `price`, `attributes`, `created_at`, `updated_at`) VALUES
(1, 12, 5, 1, 1.00, '', NULL, NULL),
(2, 13, 5, 1, 1.00, '', NULL, NULL),
(3, 14, 5, 1, 1.00, '', NULL, NULL),
(4, 15, 7, 1, 1.00, '', NULL, NULL),
(5, 16, 12, 1, 1.00, '', NULL, NULL),
(6, 18, 12, 1, 1.00, '', NULL, NULL),
(7, 19, 20, 1, 10.00, '', NULL, NULL),
(8, 20, 19, 1, 12.00, '', NULL, NULL),
(9, 20, 18, 2, 24.00, '', NULL, NULL),
(10, 21, 19, 1, 12.00, '', NULL, NULL),
(11, 21, 18, 1, 12.00, '', NULL, NULL),
(12, 22, 19, 1, 12.00, '', NULL, NULL),
(13, 23, 19, 1, 12.00, '', NULL, NULL),
(14, 23, 18, 1, 12.00, '', NULL, NULL),
(15, 24, 19, 1, 12.00, '', NULL, NULL),
(16, 25, 19, 1, 12.00, '', NULL, NULL),
(17, 26, 19, 1, 12.00, '', NULL, NULL),
(18, 27, 19, 1, 12.00, '', NULL, NULL),
(19, 29, 19, 1, 12.00, '', NULL, NULL),
(20, 30, 19, 1, 12.00, '', NULL, NULL),
(21, 31, 19, 1, 12.00, '', NULL, NULL),
(22, 32, 19, 1, 12.00, '', NULL, NULL),
(23, 33, 19, 2, 24.00, '', NULL, NULL),
(24, 35, 19, 1, 12.00, '', NULL, NULL),
(25, 37, 19, 1, 12.00, '', NULL, NULL),
(26, 38, 19, 1, 12.00, '', NULL, NULL),
(27, 39, 19, 1, 12.00, '', NULL, NULL),
(28, 40, 19, 1, 12.00, '', NULL, NULL),
(29, 41, 19, 1, 12.00, '', NULL, NULL),
(30, 42, 19, 1, 12.00, '', NULL, NULL),
(31, 43, 19, 1, 12.00, '', NULL, NULL),
(32, 43, 18, 1, 12.00, '', NULL, NULL),
(33, 44, 19, 1, 12.00, '', NULL, NULL),
(34, 45, 19, 1, 12.00, '', NULL, NULL),
(35, 46, 19, 1, 12.00, '', NULL, NULL),
(36, 47, 19, 1, 12.00, '', NULL, NULL),
(37, 48, 27, 1, 12.00, '', NULL, NULL),
(38, 49, 161, 1, 500.00, '{\"color\":\"#377EC4\",\"size\":\"l\"}', NULL, NULL),
(39, 51, 74, 1, 24.00, '[]', NULL, NULL),
(40, 52, 74, 1, 24.00, '[]', NULL, NULL),
(41, 53, 128, 1, 25.00, '[]', NULL, NULL),
(42, 56, 195, 1, 190.00, '', NULL, NULL),
(43, 57, 79, 1, 18.00, '{\"color\":\"white\"}', NULL, NULL),
(44, 58, 213, 1, 12.00, '{\"color\":\"#ffffff00\"}', NULL, NULL),
(45, 59, 170, 2, 20.00, '{\"color\":\"#ffffff00\"}', NULL, NULL),
(46, 61, 212, 1, 12.00, '{\"color\":\"#ffffff00\"}', NULL, NULL),
(47, 62, 303, 1, 4.00, '{\"color\":\"#ffffff00\"}', NULL, NULL),
(48, 62, 79, 4, 72.00, '{\"color\":\"#ffffff00\"}', NULL, NULL),
(49, 63, 27, 1, 12.00, '{\"color\":\"#ffffff00\"}', NULL, NULL),
(50, 64, 80, 1, 25.00, '{\"color\":\"#ffffff00\"}', NULL, NULL),
(51, 64, 293, 1, 25.00, '{\"color\":\"#ffffff00\"}', NULL, NULL),
(52, 65, 80, 1, 25.00, '{\"color\":\"#ffffff00\"}', NULL, NULL),
(53, 65, 293, 1, 25.00, '{\"color\":\"#ffffff00\"}', NULL, NULL),
(54, 66, 79, 1, 18.00, '{\"color\":\"#ffffff00\"}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_shop`
--

CREATE TABLE `order_shop` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `shop_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_shop`
--

INSERT INTO `order_shop` (`id`, `order_id`, `shop_id`, `created_at`, `updated_at`) VALUES
(1, 12, 4, NULL, NULL),
(2, 13, 4, NULL, NULL),
(3, 14, 4, NULL, NULL),
(4, 15, 4, NULL, NULL),
(5, 16, 4, NULL, NULL),
(6, 18, 4, NULL, NULL),
(7, 19, 12, NULL, NULL),
(8, 20, 9, NULL, NULL),
(9, 21, 9, NULL, NULL),
(10, 22, 9, NULL, NULL),
(11, 23, 9, NULL, NULL),
(12, 24, 9, NULL, NULL),
(13, 25, 9, NULL, NULL),
(14, 26, 9, NULL, NULL),
(15, 27, 9, NULL, NULL),
(16, 29, 9, NULL, NULL),
(17, 30, 9, NULL, NULL),
(18, 31, 9, NULL, NULL),
(19, 32, 9, NULL, NULL),
(20, 33, 9, NULL, NULL),
(21, 35, 9, NULL, NULL),
(22, 37, 9, NULL, NULL),
(23, 38, 9, NULL, NULL),
(24, 39, 9, NULL, NULL),
(25, 40, 9, NULL, NULL),
(26, 41, 9, NULL, NULL),
(27, 42, 9, NULL, NULL),
(28, 43, 9, NULL, NULL),
(29, 44, 9, NULL, NULL),
(30, 45, 9, NULL, NULL),
(31, 46, 9, NULL, NULL),
(32, 47, 9, NULL, NULL),
(33, 48, 9, NULL, NULL),
(34, 49, 42, NULL, NULL),
(35, 51, 43, NULL, NULL),
(36, 52, 43, NULL, NULL),
(37, 53, 48, NULL, NULL),
(38, 56, 43, NULL, NULL),
(39, 57, 43, NULL, NULL),
(40, 58, 9, NULL, NULL),
(41, 59, 49, NULL, NULL),
(42, 61, 9, NULL, NULL),
(43, 62, 9, NULL, NULL),
(44, 62, 43, NULL, NULL),
(45, 63, 9, NULL, NULL),
(46, 64, 48, NULL, NULL),
(47, 64, 27, NULL, NULL),
(48, 65, 48, NULL, NULL),
(49, 65, 27, NULL, NULL),
(50, 66, 43, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` bigint(20) NOT NULL,
  `ref` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `poll_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `amount` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `ref`, `poll_url`, `status`, `amount`) VALUES
(1, '60a8b92f74b1d', 'https://www.paynow.co.zw/Interface/CheckPayment/?guid=d53ab704-bd41-4c04-abf3-64957c50a43b', 0, NULL),
(2, '60a8bca06bb74', 'https://www.paynow.co.zw/Interface/CheckPayment/?guid=4b74ddc4-df1e-4188-ac50-7fe81dc362ef', 0, NULL),
(3, '60a8bcd64e3b2', 'https://www.paynow.co.zw/Interface/CheckPayment/?guid=5f673e2f-b3ba-4207-ae80-a9fe19ef40f1', 0, NULL),
(4, '60a8be8de9ac7', 'https://www.paynow.co.zw/Interface/CheckPayment/?guid=eb7e1e5d-27ed-47f4-a728-665be184827b', 0, NULL),
(5, '60a8c3dc40f40', 'https://www.paynow.co.zw/Interface/CheckPayment/?guid=17d007c8-c3dc-4905-bf04-1740adf5d155', 0, NULL),
(6, '60a8c6d0c9941', 'https://www.paynow.co.zw/Interface/CheckPayment/?guid=884cee0c-cfe3-40b1-91da-fbe291f5dbb4', 0, NULL),
(7, '60aa786e994dc', 'https://www.paynow.co.zw/Interface/CheckPayment/?guid=b1e3fc07-b150-45cb-8e07-f6a4595b30c7', 0, NULL),
(8, '60b0ff7cb8a30', 'https://www.paynow.co.zw/Interface/CheckPayment/?guid=ce1a3fff-208b-401c-b47d-87ddbb4f11da', 0, NULL),
(9, '60b26aab117e0', 'https://www.paynow.co.zw/Interface/CheckPayment/?guid=4842a31d-c693-4d0f-a654-ad70bbe42a3f', 0, NULL),
(10, '60b52406430a8', 'https://www.paynow.co.zw/Interface/CheckPayment/?guid=5c54a5c7-aada-492a-b6dd-f606844b499a', 0, NULL),
(11, '60b5ffcf2ab6d', 'https://www.paynow.co.zw/Interface/CheckPayment/?guid=b20c171f-7d38-4802-b8b2-27a837244119', 0, NULL),
(12, '60c071f0b319c', 'https://www.paynow.co.zw/Interface/CheckPayment/?guid=66092a43-ac36-419b-a065-a1913d6f691e', 0, NULL),
(13, '60c4ae9a5a10a', 'https://www.paynow.co.zw/Interface/CheckPayment/?guid=d0f3b665-bb3e-46b2-8619-589cb808bb41', 0, NULL),
(14, '60c4aedb6a85c', 'https://www.paynow.co.zw/Interface/CheckPayment/?guid=510e0a10-fa6c-49a1-821f-aede1adbaec6', 0, NULL),
(15, '622197145cb44', 'https://www.paynow.co.zw/Interface/CheckPayment/?guid=fe0991dc-50be-43ab-a172-4b49547ca3bf', 0, NULL),
(16, '6335c0e73746f', 'https://www.paynow.co.zw/Interface/CheckPayment/?guid=b118dcdc-9c3c-42c6-a3bf-78a64af20c98', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('recturryqu@gmail.com', '$2y$10$ne/0lpaPKGNvyyim5531lOKYH6K1fvAOfxxJ3F07j9qEHV4bQIPuu', '2021-07-23 15:54:30'),
('josephbarker2283@gmail.com', '$2y$10$RPFpNjdrAe.ldZtrnFz2fOJ5dqUCgFBC4z7HIJf3.ie1EwLPueOrK', '2021-11-22 11:25:22'),
('brendafashionglamour@gmail.com', '$2y$10$pX9JWaBFUbz52xe7AjbrcOqNpXn77YGI0lthrsVz6DwppseGxz7SS', '2022-03-10 11:57:05'),
('kimishafu39402@outlook.com', '$2y$10$h0/NIzLdQHPcsfIXsiHQAuC9a6ykOr8DUgzPYekZMCcRsk7m/pFCe', '2022-07-26 09:22:19'),
('katie1hg6u36@outlook.com', '$2y$10$XqTb7bKLoiwcm2ifHsfu3ekpl3QQEXnhvLqFEX1m95y4OoDH.Qd8u', '2022-09-01 13:52:31'),
('chelsi7udu563w1@outlook.com', '$2y$10$73aWlG3fDx0QqXbNqGOATOJ4APrpEeZgGasolartvdEgiHr8b4e6G', '2022-09-05 18:32:43'),
('tmahyar016u4t5e9y0@outlook.com', '$2y$10$KLZF2SaWe7JcuvnsJFT6FeSANe8rP34/m4.1zp3YaSyS.L0573Xmq', '2022-09-30 23:31:09');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pickups`
--

CREATE TABLE `pickups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pickups`
--

INSERT INTO `pickups` (`id`, `name`, `address`, `region_name`, `country`, `longitude`, `latitude`, `created_at`, `updated_at`) VALUES
(1, 'Eastgate Shopping Center Shop 5', 'Corner Robert Mugabe and Third Street, City Centre, Central Business District, Harare', 'Harare', 'Zimbabwe', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `placeholders`
--

CREATE TABLE `placeholders` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `placeholders`
--

INSERT INTO `placeholders` (`id`, `name`) VALUES
(1, 'Disabled');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `media_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `caption`, `shop_id`, `media_link`, `location`, `product_id`, `created_at`, `updated_at`) VALUES
(7, 'Cool Breeze Perfume Spray- $3-00 US each', 'Body Spray', 12, '[\"11dfb7baf8f7a676bcf029410d53daefjpg\"]', 'Kamusika', NULL, '2021-05-13 20:47:21', '2021-05-13 20:47:21'),
(8, 'WOOL HAT 2 PIECE SET - $2.00 US', 'Warm winter wear', 12, '[\"23f9748ad9bd76b8cf25c6eda828f942jpg\"]', 'Kamusika', NULL, '2021-05-13 20:49:21', '2021-05-13 20:49:21'),
(9, 'Necklace- $0.80 US', 'Gold and silver necklaces for ladies and men.', 12, '[\"4beeb9828fedfdacbe03e81b22998cccjpg\"]', 'Kamusika', NULL, '2021-05-15 09:49:42', '2021-05-15 09:49:42'),
(11, 'Small casual sling bag $10', '#becreative#macramebags', 25, '[\"bf6767102e70995b48c15d9f8b06700djpg\"]', 'Kamusika', NULL, '2021-05-15 17:35:54', '2021-05-15 17:35:54'),
(13, 'Hp Probook 450 G@', 'Loking For A Home', 35, '[\"75ae8675ab51b8214c6e746062429062jpg\"]', 'Kamusika', NULL, '2021-05-16 09:10:48', '2021-05-16 09:10:48'),
(14, 'Short bridemaids dress', 'Hiring $15...0777584802', 46, '[\"a5a26cc1b9c1bd886d4d6a7a0cdde1bcjpg\"]', 'Kamusika', NULL, '2021-06-25 10:45:04', '2021-06-25 10:45:04'),
(15, 'Maroro dresses', 'We design to shape you', 46, '[\"e7e305bede6ddc70d5abf24a5c0df8f1jpg\"]', 'Kamusika', NULL, '2021-06-25 10:46:56', '2021-06-25 10:46:56');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `weight` double(8,2) DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_specs` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `sale_price` double(8,2) DEFAULT NULL,
  `rating` decimal(10,0) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 10,
  `featured` tinyint(1) NOT NULL DEFAULT 1,
  `cover_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `more_imgs` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `brand`, `sku`, `slug`, `quantity`, `weight`, `shop_id`, `description`, `full_specs`, `price`, `sale_price`, `rating`, `status`, `featured`, `cover_img`, `more_imgs`, `created_at`, `updated_at`) VALUES
(13, 'Hp', NULL, NULL, NULL, NULL, NULL, 35, 'Probook 450 G@', '<h1>Core i5, 8GB ram, 650GB HDD, 15.5\" display, Fingerprint unlock, HD Webcam, 3USB 3.0 ports, 2 USB 2.0 ports. Brand new battery and charger. Refurbished <br></h1>', 400.00, NULL, '5', 1, 1, '[\"d85c099efb8611ddec60b3ddcbbbd33a.webp\"]', '0', '2021-05-16 08:48:27', '2022-09-29 15:00:46'),
(14, 'Play Station 4', NULL, NULL, NULL, NULL, NULL, 35, 'sony gaming console', '<h1><ul class=\"i8Z77e\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px;\"><li class=\"TrT0Xe\" style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">Brand New</li><li class=\"TrT0Xe\" style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">GPU: AMD next-generation Radeon based graphics engine</li><li class=\"TrT0Xe\" style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">Memory: 8GB GDDR5</li><li class=\"TrT0Xe\" style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">Storage size: 500GB, 5200 RPM, hard disk drive, user removable*</li><li class=\"TrT0Xe\" style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">External dimensions: Approximately 275 x 53 x 305 mm.</li><li class=\"TrT0Xe\" style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">BD/DVD drive (read only): BD x 6 CAV, DVD x 8 CAV, Blu-ray and DVD playback</li><li class=\"TrT0Xe\" style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">Comes with pre-loaded games: FIFA 18 - 21, Call of Duty, Mortal Kombat etc</li><li class=\"TrT0Xe\" style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">2 Wireless Controllers&nbsp;</li><li class=\"TrT0Xe\" style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\"><span style=\"color: rgb(31, 31, 31); font-family: sst, Arial, sans-serif; background-color: rgb(245, 245, 245);\">Super-Speed USB (USB 3.1 Gen1) port × 2&nbsp;</span><br style=\"-webkit-font-smoothing: antialiased; line-height: 1.5em; margin-block: 0px; color: rgb(31, 31, 31); font-family: sst, Arial, sans-serif; background-color: rgb(245, 245, 245);\"><span style=\"color: rgb(31, 31, 31); font-family: sst, Arial, sans-serif; background-color: rgb(245, 245, 245);\">AUX port × 1</span></li><li class=\"TrT0Xe\" style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\"><span style=\"color: rgb(31, 31, 31); font-family: sst, Arial, sans-serif; background-color: rgb(245, 245, 245);\"><p style=\"line-height: 1.5em; font-family: sst, Arial, sans-serif; font-size: calc(1rem); margin-block: 0px 1rem; background-color: rgb(255, 255, 255);\">Ethernet（10BASE-T, 100BASE-TX, 1000BASE-T）×1&nbsp;&nbsp;</p><p style=\"line-height: 1.5em; font-family: sst, Arial, sans-serif; font-size: calc(1rem); margin-block: 0px 1rem; background-color: rgb(255, 255, 255);\"><span style=\"font-size: calc(1rem);\">IEEE 802.11 a/b/g/n/ac</span></p><p style=\"line-height: 1.5em; font-family: sst, Arial, sans-serif; font-size: calc(1rem); margin-block: 0px 1rem; background-color: rgb(255, 255, 255);\"><span style=\"font-size: calc(1rem);\">Bluetooth®v4.0</span></p></span><br></li></ul></h1>', 350.00, NULL, NULL, 1, 1, '[\"8593cec30bcb87100fc0e9f8c93faba2.webp\"]', '0', '2021-05-16 09:05:09', '2021-05-16 09:05:09'),
(16, 'Bottom Tights', NULL, NULL, NULL, NULL, NULL, 12, 'One size fit all tights', 'Description', 5.00, NULL, NULL, 1, 1, '[\"1483b36d93b0a985b7303d79a87f500d.webp\"]', '0', '2021-05-16 13:41:26', '2021-05-16 13:41:26'),
(17, 'Deco Balls', NULL, NULL, NULL, NULL, NULL, 12, 'Decoration Balls', 'Description', 3.00, NULL, NULL, 1, 1, '[\"4ab14fdacc4d0d247642e4877f9aba92.webp\"]', '0', '2021-05-16 13:47:20', '2021-05-16 13:47:20'),
(18, 'MEN JEEP JEANS', NULL, NULL, NULL, NULL, NULL, 9, 'ALL SIZES JEEP LABEL', 'Description', 12.00, NULL, NULL, 1, 1, '[\"15eae012582b0789838d5291c38f9c45.webp\"]', '0', '2021-05-16 13:49:31', '2021-05-16 13:49:31'),
(19, 'MEN CHINOS', NULL, NULL, NULL, NULL, NULL, 9, 'ALL SIZES AVAILABLE IN BROWN AND WHITE', 'Description', 12.00, NULL, NULL, 1, 1, '[\"e892e3402e1fdc9f37b37426b81ac32d.webp\"]', '0', '2021-05-16 13:52:08', '2021-05-16 13:52:08'),
(20, 'Ladies Dresses one size fit all', NULL, NULL, NULL, NULL, NULL, 12, 'One size fit all and in different colors', 'Description', 10.00, NULL, NULL, 1, 1, '[\"4676062da2c174272f2f69f95a883b75.webp\"]', '0', '2021-05-16 13:54:59', '2021-05-16 13:54:59'),
(21, 'Macramebag', NULL, NULL, NULL, NULL, NULL, 25, 'Let\'s go out 😁', 'Description', 15.00, NULL, '1', 1, 1, '[\"78abf3f1a9bb346b02c08c1f844425a3.webp\"]', '0', '2021-05-16 15:44:04', '2021-05-28 19:54:15'),
(22, '100%_handmade_bags', NULL, NULL, NULL, NULL, NULL, 25, 'Perfect for you day to day use', 'Description', 12.00, NULL, NULL, 1, 1, '[\"0fe111040c0ac9a6b69340ed7f24948d.webp\"]', '0', '2021-05-16 16:24:47', '2021-05-16 16:24:47'),
(26, 'Jeans', NULL, NULL, NULL, NULL, NULL, 9, 'Good quality new jeans', '<p>Product Description</p>', 12.00, NULL, NULL, 1, 0, '[\"a2973c0c64c31ff2c170c8060a0478d4.webp\"]', '0', '2021-05-23 14:08:34', '2021-05-23 14:08:34'),
(27, 'Jeans', NULL, NULL, NULL, NULL, NULL, 9, 'Good quality new jeans', '<p>Product Description</p>', 12.00, NULL, NULL, 1, 0, '[\"fd166e63fc372d9501143a017af9d168.webp\"]', '0', '2021-05-23 14:09:16', '2021-05-23 14:09:16'),
(28, 'Jeans', NULL, NULL, NULL, NULL, NULL, 9, 'Good quality new jeans', '<p>Product Description</p>', 12.00, NULL, NULL, 1, 0, '[\"bf8099feb0099e0e11234e4606a36e00.webp\"]', '0', '2021-05-23 14:09:51', '2021-05-23 14:09:51'),
(29, 'Jeans', NULL, NULL, NULL, NULL, NULL, 9, 'Good quality new jeans', '<p>Product Description</p>', 12.00, NULL, NULL, 1, 0, '[\"bb3be1f5e6329134667d385e5f58168b.webp\"]', '0', '2021-05-23 14:10:28', '2021-05-23 14:10:28'),
(30, 'Jeans', NULL, NULL, NULL, NULL, NULL, 9, 'Good quality new jeans', '<p>Product Description</p>', 12.00, NULL, NULL, 1, 0, '[\"ea2dafbfeff7fc2f2fbd3738ae5faa0a.webp\"]', '0', '2021-05-23 14:12:13', '2021-05-23 14:12:13'),
(31, 'Denim Jackets', NULL, NULL, NULL, NULL, NULL, 9, 'Variable colors and all sizes. Good quality jackets', '<p>Product Description</p>', 20.00, NULL, NULL, 1, 0, '[\"40e4d9af6089b39a202066f0a45fe4d3.webp\"]', '0', '2021-05-23 19:32:08', '2021-05-23 19:32:08'),
(32, 'Denim Jackets', NULL, NULL, NULL, NULL, NULL, 9, 'Variable colors and all sizes. Good quality jackets', '<p>Product Description</p>', 20.00, NULL, NULL, 1, 0, '[\"6a45cb2da670767e39de56224658f76e.webp\"]', '0', '2021-05-23 19:33:02', '2021-05-23 19:33:02'),
(33, 'Denim Jackets', NULL, NULL, NULL, NULL, NULL, 9, 'Variable colors and all sizes. Good quality jackets', '<p>Product Description</p>', 20.00, NULL, NULL, 1, 0, '[\"e8692719d55f8afe8e71a36ce96a8ca0.webp\"]', '0', '2021-05-23 19:33:52', '2021-05-23 19:33:52'),
(34, 'Versace Original Slides', NULL, NULL, NULL, NULL, NULL, 9, 'Brand New Original Slides', '<p>Product Description</p>', 50.00, NULL, NULL, 1, 0, '[\"fbaabbcd3d99c6c337a22072d7da4bfc.webp\"]', '0', '2021-05-23 19:35:13', '2021-05-31 17:17:43'),
(35, 'Block Heels', NULL, NULL, NULL, NULL, NULL, 9, 'Fashion Block Heels 👠', '<p>Product Description</p>', 12.00, NULL, NULL, 1, 0, '[\"1786d491d443737fcf2631d1a4756c76.webp\"]', '0', '2021-05-23 19:36:24', '2021-05-23 19:36:24'),
(36, 'Block Heels', NULL, NULL, NULL, NULL, NULL, 9, 'All colors available and all sizes', '<p>Product Description</p>', 18.00, NULL, NULL, 1, 0, '[\"d52008a68005371a1468f47210928464.webp\"]', '0', '2021-05-23 19:38:04', '2021-05-23 19:38:04'),
(37, 'String Bags', NULL, NULL, NULL, NULL, NULL, 9, 'Draw String bags brand new. All colors available', '<p>Product Description</p>', 8.00, NULL, NULL, 1, 0, '[\"58c0ed825c1f7ca7720bbf57aa3ec581.webp\"]', '0', '2021-05-23 19:44:02', '2021-05-23 19:44:02'),
(38, 'Fleece Blanket.', NULL, NULL, NULL, NULL, NULL, 12, 'Warm cotton fleece blanket and good quality', '<p>Product Description</p>', 12.00, NULL, '4', 1, 0, '[\"ce097e525b0e9fed3b5a8088cf5dc5a8.webp\"]', '0', '2021-05-24 03:54:45', '2021-05-28 13:13:41'),
(39, '2 ply blanket 4 KGs', NULL, NULL, NULL, NULL, NULL, 12, 'High quality 2 ply blankets available in various colors', '<p>Product Description</p>', 35.00, NULL, NULL, 1, 0, '[\"f4475d1e0d71df813aa753a217f1251d.webp\"]', '0', '2021-05-24 03:57:37', '2021-05-24 03:57:37'),
(41, 'Rugs', NULL, NULL, NULL, NULL, NULL, 12, 'Fluffy cotton rugs. All colors available', '<p>Product Description</p>', 20.00, NULL, NULL, 1, 0, '[\"9f0f5176f4a3e00d24be1c4f1e1ddfca.webp\"]', '0', '2021-05-24 03:59:24', '2021-05-24 03:59:24'),
(43, 'Cushions', NULL, NULL, NULL, NULL, NULL, 12, 'Fluffy Cushions available in all colors', '<p>Product Description</p>', 5.00, NULL, NULL, 1, 1, '[\"23e5b897b93d0a91f34ef3ddaaa5517d.webp\",\"f0314f0e1e5eeb7f944ab13284ab7628.webp\"]', '0', '2021-05-24 04:02:06', '2021-05-24 04:02:06'),
(44, 'Red Rose Perfumes', NULL, NULL, NULL, NULL, NULL, 12, 'Scented small perfumes', '<p>Product Description</p>', 0.50, NULL, NULL, 1, 0, '[\"126db6f537b969accca8bad3ca9d3a5b.webp\"]', '0', '2021-05-24 04:07:22', '2021-05-24 04:07:22'),
(45, 'Sweaters', NULL, NULL, NULL, NULL, NULL, 21, 'A light sweater for a chilly day', '<p>Product Description</p>', 20.00, NULL, '4', 1, 0, '[\"46a26a1487482f930c6bbd1d47b8e37d.webp\"]', '0', '2021-05-24 18:12:49', '2021-05-28 13:17:55'),
(46, 'Floral dress', NULL, NULL, NULL, NULL, NULL, 21, 'A Light dress for a colorful mood', '<p><br></p>', 25.00, NULL, NULL, 1, 0, '[\"8f037035e5f089d160daafe1ece7608a.webp\"]', '0', '2021-05-24 18:26:33', '2021-05-24 18:26:33'),
(47, 'Winter boots', NULL, NULL, NULL, NULL, NULL, 21, 'Don\'t get those toes cold', '<p>Product Description</p>', 15.00, NULL, NULL, 1, 0, '[\"d268e74d0a9f19d74c89479872edaa73.webp\"]', '0', '2021-05-24 18:29:52', '2021-05-24 18:29:52'),
(48, 'Formal boots', NULL, NULL, NULL, NULL, NULL, 21, 'An elegant option for the formal Miss', '<p>Product Description</p>', 25.00, NULL, NULL, 1, 0, '[\"e354a36075ed696eaaa016cf0d3ec8f3.webp\"]', '0', '2021-05-24 18:32:17', '2021-05-24 18:32:17'),
(49, 'Women\'s boots', NULL, NULL, NULL, NULL, NULL, 21, 'Affordable elegance', '<p>Product Description</p>', 25.00, NULL, NULL, 1, 0, '[\"98ccfc955028a26bf2828b0da4531218.webp\"]', '0', '2021-05-24 18:33:44', '2021-05-24 18:33:44'),
(50, 'Zip boots', NULL, NULL, NULL, NULL, NULL, 21, 'You can never have enough boots', '<p><br></p>', 30.00, NULL, NULL, 1, 0, '[\"c113fdf912b41a92a07053e29bb453d6.webp\"]', '0', '2021-05-24 18:35:20', '2021-05-24 19:42:08'),
(51, 'Classic Boots', NULL, NULL, NULL, NULL, NULL, 21, 'Let\'s be classy', '<p><br></p>', 30.00, NULL, NULL, 1, 0, '[\"92b24c5234cea64280905f4440606e11.webp\"]', '0', '2021-05-24 18:37:16', '2021-05-24 18:37:16'),
(53, 'Crop Top', NULL, NULL, NULL, NULL, NULL, 21, 'Time to be a bit daring', '<p><br></p>', 15.00, NULL, NULL, 1, 0, '[\"dd5d4cfa8ac7e574734a1f5418fa4752.webp\"]', '0', '2021-05-24 18:43:36', '2021-05-24 18:43:36'),
(54, 'Vibrant jacket', NULL, NULL, NULL, NULL, NULL, 21, 'Don\'t be afraid to be daring', '<p>Available in various sizes<br></p>', 30.00, NULL, NULL, 1, 0, '[\"0c73b2724fc19bd111ab127d51a58e4b.webp\"]', '0', '2021-05-24 18:48:37', '2021-05-24 18:48:37'),
(55, 'Long summer dress', NULL, NULL, NULL, NULL, NULL, 21, 'Beauty has no limits', '<p>Available in various sizes<br></p>', 30.00, NULL, NULL, 1, 0, '[\"cec08279a75ad97b948a71144c6fd84f.webp\"]', '0', '2021-05-24 19:08:19', '2021-05-24 19:08:19'),
(57, 'Floral long dress', NULL, NULL, NULL, NULL, NULL, 21, 'Flowers and dresses', '<p>Available in various colors and sizes<br></p>', 30.00, NULL, NULL, 1, 0, '[\"eedee2bc8c893b4bbb9686a5c55af52f.webp\"]', '0', '2021-05-24 19:12:00', '2021-05-24 19:12:00'),
(58, 'Men\'s sweaters', NULL, NULL, NULL, NULL, NULL, 21, 'For the elegant Mr', '<p>Available in vairous colors and sizes <br></p>', 15.00, NULL, NULL, 1, 0, '[\"8b01d3720c0eca37168c77ffe8ef335f.webp\"]', '0', '2021-05-24 19:18:09', '2021-05-24 19:18:09'),
(59, 'Men\'s jacket', NULL, NULL, NULL, NULL, NULL, 21, 'For the classy men', '<p>Available in various sizes<br></p>', 15.00, NULL, NULL, 1, 0, '[\"be42e7d0e6a7ac2d27cff12bc02e4092.webp\"]', '0', '2021-05-24 19:22:27', '2021-05-24 19:22:27'),
(60, 'Bedding', NULL, NULL, NULL, NULL, NULL, 21, 'A bed fit for a king/queen', '<p>Double Queen, King<br></p>', 30.00, NULL, NULL, 1, 0, '[\"cde9c58c11834045b7a3056346a748af.webp\"]', '0', '2021-05-24 19:24:47', '2021-05-24 19:28:24'),
(61, 'Queen sized covers', NULL, NULL, NULL, NULL, NULL, 21, 'A bed fit for a king/queen', '<p>Double Queen , King<br></p>', 30.00, NULL, NULL, 1, 0, '[\"1716c300c3a37ecb8f275a05bb608f86.webp\"]', '0', '2021-05-24 19:25:58', '2021-05-24 19:38:29'),
(62, 'Bed Covers', NULL, NULL, NULL, NULL, NULL, 21, 'A bed fit for a king/queen', '<p>Double Queen , King<br></p>', 30.00, NULL, NULL, 1, 0, '[\"31f2f58737458c84d43a71d7f556f321.webp\"]', '0', '2021-05-24 19:27:11', '2021-05-24 19:27:11'),
(63, 'Men\'s soft Jacket', NULL, NULL, NULL, NULL, NULL, 21, 'For the daring guy', '<p>Available in various colors and sizes<br></p>', 15.00, NULL, NULL, 1, 0, '[\"3a006bd779e264eb2fae5e3570623b6c.webp\"]', '0', '2021-05-24 19:31:40', '2021-05-24 19:31:40'),
(64, 'Floral mini-dress', NULL, NULL, NULL, NULL, NULL, 21, 'A dress fit for a Queen', '<p>Available in various sizes and colours<br></p>', 25.00, NULL, NULL, 1, 0, '[\"fa5e631a8cb252185c0db9755179a208.webp\"]', '0', '2021-05-24 19:34:45', '2021-05-24 19:34:45'),
(65, 'Long vibrant dresses', NULL, NULL, NULL, NULL, NULL, 21, 'Comfy and stylish', '<p>Available in various sizes<br></p>', 30.00, NULL, NULL, 1, 0, '[\"76e2ce765cf174bf081fad4896587b0b.webp\"]', '0', '2021-05-24 19:36:37', '2021-05-24 19:36:37'),
(66, 'Time Keeper Set', NULL, NULL, NULL, NULL, NULL, 43, 'High quality Tupperware, lunchbox style, time keeper storage. Ideal for pasta and all grains with custom time keeper knobs on the seal. No need to memorise cooking times on all your pasta and grains. Save up to 60% on this product.', '<p>Product Description</p>', 27.00, NULL, NULL, 1, 0, '[\"4371a57368657ee2a1f13c5c027bf7c2.webp\"]', '0', '2021-05-26 08:05:25', '2021-05-26 08:05:25'),
(67, '3L Tupperware bowls', NULL, NULL, NULL, NULL, NULL, 43, '3 litre Tupperware bowl with glossy finish. 1 for $13 with special offering 2 for $21.', '<p>Product Description</p>', 13.00, NULL, NULL, 1, 0, '[\"ea2f553f77742afd86c799a8ffdb3f31.webp\"]', '0', '2021-05-26 08:07:20', '2021-05-26 08:07:20'),
(68, 'Eco Bottle', NULL, NULL, NULL, NULL, NULL, 43, '500 ml drinking bottle with easy twist bottle cap. Comes in Emberglow and Tropical Water colours. Thick, durable polymer based build. Special offering, 2 for $9.', '<p>Product Description</p>', 6.00, NULL, NULL, 1, 0, '[\"2f7c4812b8cf06efffea0a0e6d74546e.webp\"]', '0', '2021-05-26 08:11:59', '2021-05-26 08:11:59'),
(69, 'Outdoor Dining Bowl', NULL, NULL, NULL, NULL, NULL, 43, '1.5 litre outdoor Tupperware dining bowl. Suitable for picnics with any food of your choice. Sturdy build and easy to clean. Special offering 2 for $15.', '<p>Product Description</p>', 10.00, NULL, NULL, 1, 0, '[\"f2f4f25bd8687906ef716dd07c3c62b8.webp\"]', '0', '2021-05-26 08:16:44', '2021-05-26 08:16:44'),
(70, 'Big 5 Buffalo Set', NULL, NULL, NULL, NULL, NULL, 43, 'Big 5 Buffalo drinking bottle and Big 5 Buffalo sandwich keeper. Suitable for children. Ensures your little one stays fed and hydrated.', '<p>Product Description</p>', 10.00, NULL, NULL, 1, 0, '[\"6501ae41f0672cc2b1c28e75370cfc99.webp\"]', '0', '2021-05-26 08:25:45', '2021-05-26 08:25:45'),
(71, 'Mega Lunchbox', NULL, NULL, NULL, NULL, NULL, 43, 'Large lunchbox to take care of those greater appetites. Comes with 3 compartments for 3 different foods all at once. Dimensions  are 28.5cm x 13 x 4.5 cm high. Save up to 50% on this product.', '<p>Product Description</p>', 10.00, NULL, NULL, 1, 0, '[\"effac7ebb88d7d55b9f35807f701b1b3.webp\"]', '0', '2021-05-26 08:31:49', '2021-05-26 08:31:49'),
(73, 'One Touch Canisters (940ml)', NULL, NULL, NULL, NULL, NULL, 43, 'Two Tupperware storage canisters, large enough to hold treats for everyone! Suitable for coffee and picnics. Comes in purple and blue, both with stylish floral patterns. Save more than 40% on this product.', '<p>Product Description</p>', 18.00, NULL, NULL, 1, 0, '[\"8661d121b2e41b75ac64ec33437ad09d.webp\"]', '0', '2021-05-27 16:26:29', '2021-05-27 16:26:29'),
(74, 'Baker\'s Delight', NULL, NULL, NULL, NULL, NULL, 43, 'Large storage bowl suitable for the baking enthusiast. With all the space for your baked goods.', '<p>Product Description</p>', 24.00, NULL, NULL, 1, 0, '[\"7095768c37c48ff3c3f12644c8b973fc.webp\"]', '0', '2021-05-27 16:29:20', '2021-05-27 16:29:20'),
(75, 'Legacy Bowls', NULL, NULL, NULL, NULL, NULL, 43, '4 Polymer Tupperware  bowls suitable for treats and salads. Save 25% on this product', '<p>Product Description</p>', 12.00, NULL, NULL, 1, 0, '[\"d1729fe0544bcfce4511c53ebf28b9aa.webp\"]', '0', '2021-05-27 16:32:50', '2021-05-27 16:32:50'),
(76, 'Legacy Plates', NULL, NULL, NULL, NULL, NULL, 43, '4 Polymer Tupperware durable plates. Save up to 25% on this product.', '<p>Product Description</p>', 18.00, NULL, NULL, 1, 0, '[\"8fc289234503312f0ca86e4f1e705a54.webp\"]', '0', '2021-05-27 16:36:57', '2021-05-27 16:36:57'),
(77, 'Hang on spoons', NULL, NULL, NULL, NULL, NULL, 43, 'Durable polymer spoons carefully crafted for toddlers with smooth edges to ensure safety. They come in vibrant purple color.', '<p>Product Description</p>', 5.00, NULL, NULL, 1, 0, '[\"e9cc313ba30c72624853150fa51b78fa.webp\"]', '0', '2021-05-27 16:44:51', '2021-05-27 16:44:51'),
(78, 'Handy Mugs', NULL, NULL, NULL, NULL, NULL, 43, '4 Tupperware, easy grip handy mugs. Save up to 13% on this product', '<p>Product Description</p>', 13.00, NULL, '4', 1, 0, '[\"110e48f5712769a48a0b94e0c1a97bd6.webp\"]', '0', '2021-05-27 16:49:23', '2021-05-29 04:48:15'),
(79, 'Legacy Soup Server', NULL, NULL, NULL, NULL, NULL, 43, '1.8 litre Tupperware soup server. Save up to 30% on this product.', '<p>Product Description</p>', 18.00, NULL, NULL, 1, 0, '[\"95845df1f352d214b111f67d85535a24.webp\"]', '0', '2021-05-27 16:51:50', '2021-05-27 16:51:50'),
(80, 'JBL M10W Buds', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Buds', '<p>Bluetooth Version: V5.1<br>Model: M10W<br>Battery: Polymer 3.7&gt;50mA<br>Charging time: 1 - 2hrs<br>Frequency Range: 2.402GHz~2.480GHz<br>Profiles: Supports&nbsp; HFP 1.7, HSP 1.2, A2DP 1, AVRCP 1.6, SPP 1.2 and PBAP1.0<br>*Charging box*<br>Input: 5V Above 600mA<br>Output: 5V 1A</p>', 25.00, NULL, NULL, 1, 0, '[\"5f9912f8a35683fe9f122e9feb150623.webp\"]', '0', '2021-05-27 19:52:24', '2021-05-27 19:52:24'),
(81, 'Nesty GR22 Junior', NULL, NULL, NULL, NULL, NULL, 48, 'Bluetooth Speaker', '<p>&nbsp;Up to 6 Hours of play time(with max Vol)<br>• Bluetooth Version: 2.1<br>• Bluetooth range up to 10 meters<br>• Speakers: Horn Size: 2.1 inch, <br>• Output:.&nbsp;&nbsp;&nbsp; 6W<br>Connections: USB disk, Micro SD card, Aux in 3.5mm jack connection<br>• Power supply: Built-in rechargeable lithium battery 1500mAh<br>Recharge Power: DC 5V 1A (USB-to-micro USB charging cable included)<br>Product size: 79.3(W)*86.3(H)*201.3(L)mm</p>', 18.00, NULL, NULL, 1, 0, '[\"a95b3f05fc576d0852e4d91bba19a308.webp\"]', '0', '2021-05-27 19:54:02', '2021-05-27 19:54:02'),
(82, 'Oraimo Wireless Soundbar OBS91-D', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless sound bar', '<p>Brand:&nbsp; Oraimo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Model: OBS-91D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bluetooth Version: 5.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bluetooth range: 10m&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Battery capacity: 2000mAh&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Charging time: Approximately 2.5hrs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Charging current: DC 5V=1000mA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Frequency response: 80Hz-18KHz&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Playtime: 10 to 12hrs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Speaker output: 16W&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *Full-Room Sound*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16w full-range driver fills the whole room with stunning sound for an immersive at-home music or movie experience.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *Premium Design*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A metallic grill, a robust build, and clean lines give the soundbar a refined finish. At just 2.4 inches tall, the soundbar fits comfortably under the TV without obstructing the view.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *Long-Lasting Battery*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A 2000mAh lithium-ion battery keeps your tunes playing for up to 12.5 hrs on a single charge.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *Easy Controls*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Elegantly rotate the delicated vacuum coating switch to turn on your soundFull. Then play, pause, skip tracks and control your phone calls with the simple tap of top controls&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *Versatile Input Options*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Connect wirelessly using advanced BT to play music, answer calls, and more. An aux or a card slot allows you to plug and play.</p>', 49.00, NULL, NULL, 1, 0, '[\"455fa91bba633ed63698d671b62e40e2.webp\"]', '0', '2021-05-27 19:57:09', '2021-05-27 19:57:09'),
(83, 'Oraimo SoundPro OBS-52D', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Bluetooth Speaker', '<p>Brand:&nbsp; Oraimo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Model: OBS-52D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bluetooth Version: 5.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bluetooth range: 15m&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Battery capacity: 2000mAh 3.7V&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Charging time: Approximately 2.5hrs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Charging current: DC 5V=1A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Frequency response: 20Hz-20KHz&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Playtime: 6 to 8hrs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Speaker output: 5W*2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Size: 213*80*80.6mm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *Superior Sound Quality*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Whenever life takes you, experience your music with powerful stereo sound and crisp,tight bass from upgraded 2x 5W drivers.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *Uncompromised&nbsp; Portability*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The Speaker has a rugged enclosure with a silicone handle for easy carrying anywhere.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *Enhanced connectivity*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The speaker uses very latest wireless technology for easy connection. A built-in*FM* radio with real metal antenna enables stronger signal for stable connection.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *Play further*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; An inbuilt microphone makes handsfree calling a breeze No BT? No problem, an aux or USB drive port allows you to plug in and play and a Memory card slot enables you to easily store and play more of your favourite songs.</p>', 40.00, NULL, NULL, 1, 0, '[\"e06e0fd701b37719ed686fc7f7b14aa6.webp\"]', '0', '2021-05-27 19:58:52', '2021-05-27 19:58:52'),
(84, 'INTEX Laptop Cooling Pad', NULL, NULL, NULL, NULL, NULL, 48, 'Cooling Pad', '<p>Slim and Smart design of the cooling pad system with large high- performance and extra quite 3 fans built-in which absolutely helps to dissipate th heat-air way from under</p>', 5.00, NULL, NULL, 1, 0, '[\"ec262829624e0cca7fb63ba9f8425596.webp\"]', '0', '2021-05-27 20:00:00', '2021-05-27 20:00:00'),
(85, 'Nesty MH200 SODO SERIES Speaker and Headphone (2in 1)', NULL, NULL, NULL, NULL, NULL, 48, 'Speaker and Headphone (2in 1)', '<p>*An over-ear headphone designed to operate as a speaker also, simply twist the ear-cups out to switch to speaker mode*.<br>*Product Specifications:*<br>•Headphone with Speaker<br>• Bluetooth (Version: 5.0) <br>• Supports Hands-free phone calls<br>• Supports FM Radio, TF Card, NFC<br>• Supports audio line-in for non-Bluetooth <br>• Supports Long press - Dial back the last call, Caller ID reader when incoming call<br>• High quality stereo sound <br>• Battery meter on iOS system<br>• Speaker: 3W*2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; •Input power: DC5V 500mA<br>• Battery: 350mA<br>• Battery type: Lithium-polymer rechargeable battery<br>• Music Playback time:<br>&nbsp;&nbsp; • Headphone mode: Up to 7 Hours<br>&nbsp;&nbsp; • Speaker mode: Up to 3 Hours<br>• Bluetooth profiles: HFP/HSP.A2DP/AVRCP<br>•Signal to noise ratio: -75db~-95db&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; •Frequency response: 20-20KHz<br>•Charging time: Around 2 hours<br>MH200</p>', 45.00, NULL, NULL, 1, 0, '[\"18ef0af3445908a3365bc867ce95e537.webp\"]', '0', '2021-05-27 20:01:34', '2021-05-27 20:01:34'),
(86, 'Nesty GR33 KitKat', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless speaker', '<p>Model: GR33 Kit Kat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Wireless range: 10m&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Up to 5 Hours of Playtime&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rechargeable 3.7V 1200mAh&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Charging time: Approximately 1.5 hrs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supports: TF Card/ USB Input&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Torch Function: Yes<br>GR33 Kit Kat</p>', 10.00, NULL, NULL, 1, 0, '[\"afce71f01ba2c230fbbccae41c6561a3.webp\"]', '0', '2021-05-27 20:03:09', '2021-05-27 20:03:09'),
(87, 'K1 Wired Gaming Headsets', NULL, NULL, NULL, NULL, NULL, 48, 'Gaming Headsets', '<p>•USB Wired 7.1 Channel<br>•Super Bass E- sports Gaming headsets<br>•Colourful lighting effect<br>•360° rotating microphone<br>•Skin friendly earmuffs<br>•Mic Dimensions: 4.0*1.5mm<br>•Sensitivity: -38db +/- 3db<br>•Directivity: Omnidirectional<br>•Impedance: 2.2 K<br>•Speaker Diameter: 50.00mm<br>•Frequency response: 20~20000Hz<br>•Max Input Power: 20mW<br>•Cord length: 2.2 meters<br>•3.5mm Stereo connector, you can enjoy the beautiful music everywhere<br>•50mm Speaker- high magnetic horn to provide fidelity sound quality, treble pure beauty<br>K1</p>', 28.00, NULL, NULL, 1, 0, '[\"c6d58cfe4cd57a44b99a55816a2da18a.webp\"]', '0', '2021-05-27 20:04:16', '2021-05-27 20:04:16'),
(88, 'K3 Wired Gaming Headsets', NULL, NULL, NULL, NULL, NULL, 48, 'Gaming Headsets', '<p>•USB Wired 7.1 Channel<br>•Super Bass E- sports Gaming headsets<br>•Colourful lighting effect<br>•360° rotating microphone<br>•Skin friendly earmuffs<br>•Mic Dimensions: 4.0*1.5mm<br>•Sensitivity: -38db +/- 3db<br>•Directivity: Omnidirectional<br>•Impedance: 2.2 K<br>•Speaker Diameter: 50.00mm<br>•Frequency response: 20~20000Hz<br>•Max Input Power: 20mW<br>•Cord length: 2.2 meters<br>•3.5mm Stereo connector, you can enjoy the beautiful music&nbsp;&nbsp;&nbsp; everywhere<br>•50mm Speaker- high magnetic horn to provide fidelity sound quality, treble pure beauty<br>K3</p>', 34.00, NULL, NULL, 1, 0, '[\"958e0e27d9f62c4b87c298bd13213635.webp\"]', '0', '2021-05-27 20:05:14', '2021-05-27 20:05:14'),
(89, 'BOOMS BASS L18 Portable wireless Speaker', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Bluetooth Speaker', '<p>•Model L18<br>•Bluetooth version 5.0<br>•Bluetooth range upto 10m<br>•Playtime&nbsp; 2 to 5 hours<br>•Battery Capacity: 1500mAh<br>•Built-in voltage: 3.7V<br>•Horn Specification: 78mm<br>•Speaker Power:&nbsp; 8W+8W<br>•Frequency response: 200HZ-20KHZ<br>•Product Size: 330*130*202mm<br>•Charging Voltage: DV 5V<br>•Charging time: about 2hrs<br><br>*Product Feature*<br>•Line IN Input Interface, 3.5 Audio Head Outside Input<br>•The tone is soft, clear and dynamic, with distinct layers<br>•Direct reading TF and U Disk</p>', 35.00, NULL, NULL, 1, 0, '[\"4c5f92774b67d16059c8863e0b419803.webp\"]', '0', '2021-05-27 20:06:19', '2021-05-27 20:06:19'),
(90, 'Sound Audio Controller', NULL, NULL, NULL, NULL, NULL, 48, 'Audio Controller', '<p>•Support 3D (Ac-3) and Virtual 5.1 Sound Track&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; •Lead 3D Sound Track&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; •Real USB Plug and Play&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; •Drive 2CH speakers Directly and Support 3D positional sound&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; •Use USB port power Directly&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; •No need for External power adapter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; •Digital class B Power Amplifier inside&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; •Enhanced 5.1 Home Theater</p>', 3.00, NULL, NULL, 1, 0, '[\"7f8ee7fa305ce7002b6641d93322776c.webp\"]', '0', '2021-05-27 20:07:51', '2021-05-27 20:07:51'),
(91, 'BOOMS BASS L9 Portable Wireless Speaker', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Bluetooth Speaker', '<p>•Model L9<br>•Bluetooth version 5.0<br>•Bluetooth range upto 10m<br>•Play time&nbsp; 2 to 5 hours<br>•Battery Capacity: 1500mAh<br>•Built-in voltage: 3.7V<br>•Horn Specification: 78mm<br>•Speaker Power:&nbsp; 8W+8W<br>•Frequency response: 200HZ-20KHZ<br>•Product Size: 300*140*145mm<br>•Charging Voltage: DV 5V<br>•Charging time: about 2hrs<br>•Bare weight: 1270g<br><br>*Product Feature*<br>•Line IN Input Interface, 3.5 Audio Head Outside Input<br>•The tone is soft, clear and dynamic, with distinct layers<br>•Direct reading TF and U Disk<br>L9</p>', 35.00, NULL, NULL, 1, 0, '[\"d1ebf6a40b62037457e63940a1176f8b.webp\"]', '0', '2021-05-27 20:09:01', '2021-05-27 20:09:01'),
(92, 'TWS-4 JBL In-ear Headphones', NULL, NULL, NULL, NULL, NULL, 48, 'Bluetooth Earbuds', '<p>Wireless version: V5.0+EDR (both sides), ultra low consumption<br>Wireless mode: A2DP1.3/HFP1.6/HSP1.2/AVRCP1.6/D11.3<br>Wireless frequency: 2.4GHz<br>Wireless range: 10 -15 meters<br>Battery Capacity: Earbud: 55 mAh rechargeable Li-on battery<br>Standby time: Both earbuds can stand for 60 hours<br>Play time: 3-4 hours<br>Talk time:. 4-5 hours<br>Charging time: 60 minutes<br>The charging box can charge the earbuds for about 3 to 4 times<br>When the earphone is charging, *the red* light is always on and when its full the light switches off.<br>When the charging box is charging the earphone the blue light is always on<br>*Headphones use steps and instructions*<br>1.Turn on the charging box switch (blue or red light becomes on)<br>2. Open the top cover of the charging box and take out the earbuds <br>3. Pair with other devices, open the phone or other device wireless settings, search for the wireless and click to connect.<br>4. When the headset is placed in the charging box to charge, it automatically switches off<br>5. Wireless headphones both left and right can be connected separately to other wireless devices<br>6. The headset automatically switches off when not connected for 5 minutes<br>*Touch Controls*<br>• Touch to answer calls, also touch to hang up<br>• Tap twice in a row to redial the last number<br>• Touch for 2 seconds to select the next song<br>• Long touch for 3 seconds to call siri<br>• The earphones have sound for the left and right earsof the two- channel conversation</p>', 20.00, NULL, NULL, 1, 0, '[\"292d8365e2eceec089635a8771b4cb84.webp\"]', '0', '2021-05-27 20:10:39', '2021-05-27 20:10:39'),
(93, 'JBL Charge 4 Wireless Speaker', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Bluetooth Speaker', '<p>•Up to 6 hours of Playtime<br>•Bluetooth range: up to 10meters <br>•Auxillary cable: Yes<br>•USB port: Yes<br>•Speakerphone: Yes<br>•Memory card slot: Yes<br>•3600 mAH battery with dual USB Charge out<br>•Output power: 2*20W<br>•Frequency response: 70 Hz-20kHz<br>•Signal to noise ratio: 80db<br>•Colors: Red, Gold, Blue, Black, Grey</p>', 20.00, NULL, NULL, 1, 0, '[\"419a272c85341bf5a9777689b094f053.webp\"]', '0', '2021-05-27 20:11:50', '2021-05-27 20:11:50'),
(94, 'NESTY GR55 Bluetooth Portable Speaker', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Bluetooth Speaker', '<p>Up to 6 hours of play time<br>Very balanced sound output<br>Speakerphone (for hands free calls)<br>Dimensions 185*285mm<br>Bluetooth Version 2.1 - (wireless range upto 10 meters)<br>Battery type 1500mAH Lithium-ion<br>Battery charge time: 3.5hrs<br>Single USB charge out: DC 5V 1A (can charge phone)<br>Connections: USB disk, TF card slot, Aux-in 3.5mm jack connection<br>Sub Woofer size 4 inch<br>Subwoofer output: 12w<br>Tweeter size: 2 inch<br>Tweeter output 3w*2,4<br>Rated power 2* 20w Bi-amps (AC mode)<br>Frequency response: 70- 20kHz</p>', 55.00, NULL, NULL, 1, 0, '[\"86262053fed456817abfeee30bf5bedf.webp\"]', '0', '2021-05-27 20:13:07', '2021-05-27 20:13:07');
INSERT INTO `products` (`id`, `name`, `brand`, `sku`, `slug`, `quantity`, `weight`, `shop_id`, `description`, `full_specs`, `price`, `sale_price`, `rating`, `status`, `featured`, `cover_img`, `more_imgs`, `created_at`, `updated_at`) VALUES
(95, 'P47 Wireless Headphones', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless headphones', '<p>• Up to 6 hours of playtime<br>• Standby time: up to 15 hours<br>• Bluetooth range: 10 meters<br>• Operating frequency: 2.4GHz~2.4835GHz<br>• Noise reduction technology:DPS digital signal processor<br>•USB charging cable: AC input 110~240VDC input 5V<br>• Supports automatic switchover to incoming call function<br>• With the end number redial function<br>• Memory card: Supported</p>', 12.00, NULL, NULL, 1, 0, '[\"f3feef6d876461d294289014258fc436.webp\"]', '0', '2021-05-27 20:14:22', '2021-05-27 20:14:22'),
(96, 'Oraimo 3.5mm Plug in Earphones', NULL, NULL, NULL, NULL, NULL, 48, 'Earphones', '<p>Earphone Type: In ear<br>Cable length: 1.2<br><br>*Pure Bass*<br>•Employing oraimo premium drivers, Conch earphone generates pure bass that is deep and powerful.<br>*HD Sound*<br>•The central diaphragm delivers clear and natural sound with rich details, so you can immerse yourself completely in your music.<br>*Single Button control*<br>The single button remote and mic allows for easy music control and hands-free calls<br>*Comfortable Eartips*<br>Sleek ergonomic design Eartips add unprecedented comfort to the listener\'s experience-allowing a longer more enjoyable experience.</p>', 5.00, NULL, NULL, 1, 0, '[\"80cb94ee77e72d8fcbd7a63b0390cf28.webp\"]', '0', '2021-05-27 20:15:29', '2021-05-27 20:15:29'),
(97, 'Lighting to Headphone Jack Adapter for Iphone', NULL, NULL, NULL, NULL, NULL, 48, 'Jack Adapter', '<p>Lighting to 3.5mm Headphone Jack Adapter</p>', 6.00, NULL, NULL, 1, 0, '[\"b9aa34041703b0107c435b655e54b00c.webp\"]', '0', '2021-05-27 20:17:07', '2021-05-27 20:17:07'),
(98, 'LENOVO QT81 WIRELESS EARPODS', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Pods', '<p>*Product Parameters*<br>•Model Number : QT81<br>•Bluetooth version: V5.1<br>•Playtime:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4 to 5 hours<br>•Standby Time:&nbsp;&nbsp;&nbsp; 110 hours<br>•Speaker Diameter: 13mm<br>•Can answer calls, reject calls<br>•LED Display to show battery percentage<br>•TYPE C Charging<br>•Power case Battery capacity: 1200mAh<br>•Earpods battery capacity: 40mAh</p>', 30.00, NULL, NULL, 1, 0, '[\"33cebd433be51c8e69b59e532d7f7bc2.webp\"]', '0', '2021-05-27 20:18:28', '2021-05-27 20:18:28'),
(99, 'Tws-5 Earpods', NULL, NULL, NULL, NULL, NULL, 48, 'Earpods', '<p>Wireless<br></p>', 15.00, NULL, NULL, 1, 0, '[\"1966248fc95fab719268bc16af3033ef.webp\"]', '0', '2021-05-27 20:19:38', '2021-05-27 20:19:38'),
(100, 'Neck Chain Type wireless earphones', NULL, NULL, NULL, NULL, NULL, 48, 'Earphones', '<p><br></p>', 15.00, NULL, NULL, 1, 0, '[\"29395f23b4ad8b9c3397352edcc35aeb.webp\"]', '0', '2021-05-27 20:20:38', '2021-05-27 20:20:38'),
(101, 'Nesty MH-250 Earbuds', NULL, NULL, NULL, NULL, NULL, 48, 'Bluetooth Earbuds', '<p>Pure Wireless Earphones, Hands free with microphone<br>BT Version: V5.0+BR+ EDR<br>R. Frequency: 20Hz-18.5KHz<br>S/N Ratio.&nbsp; &gt;70db<br>Earphones battery capacity:&nbsp; 40mAh<br>Type-C USB Charging import:&nbsp; 5V 1A<br>Power Case battery capacity: 400mAh<br>For each fully charge from power case: 5 times<br>Music Play Time: upto 4.5 hours<br>Talk Time:&nbsp; Upto 3.5 hours<br>Power Case dimensions 49*23*59.2mm<br>Earphone speaker Diameter:&nbsp; 13mm</p>', 35.00, NULL, NULL, 1, 0, '[\"b20edf19d07f9f7ed8b948479ad7e2ed.webp\"]', '0', '2021-05-27 20:21:42', '2021-05-27 20:21:42'),
(102, 'MI True Wireless Earbuds', NULL, NULL, NULL, NULL, NULL, 48, 'Bluetooth Earbuds', '<p>Bluetooth version 5.0<br>Playtime about 4hrs<br>Talk time about 4hrs</p>', 18.00, NULL, NULL, 1, 0, '[\"36504b96efc8d7de20c644e64e85bdec.webp\"]', '0', '2021-05-27 20:23:18', '2021-05-27 20:23:18'),
(103, 'Flexible Portable Keyboard', NULL, NULL, NULL, NULL, NULL, 48, 'Wired keyboard', '<p><br></p>', 10.00, NULL, NULL, 1, 0, '[\"0ac0a751ff0261656ca26a7f010235d5.webp\"]', '0', '2021-05-27 20:25:18', '2021-05-27 20:25:18'),
(104, 'HAYSENSER External Hard drive casing', NULL, NULL, NULL, NULL, NULL, 48, 'Hard-drive casing', '<p>Trendy case design for 2.5\" SATA<br>Compatible with USB 2.0, plug and play<br>Speed storage can reach 480Mbps<br>Compatible with Windows ME/Xp/ Microsoft Windows 8/10, Mac iOS 8.6 and above<br>Mirror finish, aluminium case</p>', 6.00, NULL, NULL, 1, 0, '[\"cd5a36e2ba9db91bfb8da8d91a591ba6.webp\"]', '0', '2021-05-27 20:26:29', '2021-05-27 20:26:29'),
(105, 'Xtreme MiNi Portable Wireless Speaker', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Bluetooth Speaker', '<p>Up to 8 hours of Playtime<br>*Connect +* function (connect compatible speakers together)<br>Wirelessly links multiple speakers<br>Bluetooth range: up to 10meters <br>Splash proof: Yes<br>FM Tuner:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Yes<br>Auxillary cable: Yes<br>USB port: Yes<br>Speakerphone: Yes<br>Memory card slot: Yes<br>Detachable strap for easy carrying<br>3600 mAH battery with dual USB Charge out<br>Output power: 2*20W<br>Frequency response: 70 Hz-20kHz<br>Signal to noise ratio: 80db<br>Colours: Black, Camouflage,Red, Blue<br>Size: length 21cm* height 8cm* width 8cm</p>', 20.00, NULL, NULL, 1, 0, '[\"c6b9ae8bab1f3b196b30e1770d585bd3.webp\"]', '0', '2021-05-27 20:27:43', '2021-05-27 20:27:43'),
(106, '650 BT Wireless Headphones', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless headphones', '<p>Up to 5 hours of Playtime<br>Bluetooth range: 10meters<br>Battery Charge time: 2 hours<br>Battery rechargeable polymer lithium-on battery<br>Speakerphone: Yes<br>Line in/ Auxillary port: Yes (but cable not provided)<br>Memory card slot: Yes<br>Colours, white, black, blue, red</p>', 15.00, NULL, NULL, 1, 0, '[\"2973116230489672fa24faeb858ba21e.webp\"]', '0', '2021-05-27 20:28:37', '2021-05-27 20:28:37'),
(107, 'Nesty MH200-X Wireless Headphones', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless headphones', '<p>Upto 6 hours of playtime<br>Wireless distance: 10meters<br>Wireless frequency: 2.401-2.480GHz<br>USB Charge: DC5VIN<br>SNR: 88Db<br>Output Power: 35mW<br>Charging time: 2hours<br>Standby time :. 18 hours<br>Inbuilt microphone: yes</p>', 25.00, NULL, NULL, 1, 0, '[\"51334dabca6c30db12f48d32c59ae05f.webp\"]', '0', '2021-05-27 20:29:30', '2021-05-27 20:29:30'),
(108, 'Nesty GRPB-L20x Powerbank', NULL, NULL, NULL, NULL, NULL, 48, 'Powerbank', '<p>•Model: GRPB- L20x<br>Capacity: 10000mAh(36Wh)<br>Input 5V=2.0A<br>Size: 140mm*68mm*17.4mm<br>Weight: 222g</p>', 18.00, NULL, NULL, 1, 0, '[\"ad39986b4c8b94e42ebd33da51566bd2.webp\"]', '0', '2021-05-27 20:31:11', '2021-05-27 20:31:11'),
(109, 'LV 11 Portable Multi-function Speaker', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Bluetooth Speaker', '<p><br></p>', 15.00, NULL, NULL, 1, 0, '[\"aad177a4be0474a582d1c0c05a9323f0.webp\"]', '0', '2021-05-27 20:31:51', '2021-05-27 20:31:51'),
(110, 'JBL TG 125 Portable Wireless Speaker', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Bluetooth Speaker', '<p>•Model. TG-125<br>•Bluetooth range: 10meters<br>•Support: L2CAP/A2DP(AVCTP/AVDTP/AVRCP),, can receive audio signal and control the audio device<br>•Frequency response: 80Hz-20KHZ<br>•Unit Size: 94.8*98.7x220mm<br>•Power output: 10w<br>•Charging: 5V/0.5A<br>•Approximately 6 hours Playtime<br><br>*Product Feature*<br>•International advanced BT chip and circuit design techniques<br>•With FM function, can search radio station broadcast automatically<br>•With HI-FI speaker, to make sure the sound is clear and bright<br>•Support Micro SD card and USB card, play mp3 format audio<br>•With Auxillary line in, can directly connect the out side devices, for example, tablet,PC,TV, cellphones e.t.c</p>', 20.00, NULL, NULL, 1, 0, '[\"0dff1c9eb1c21637562d88106c806afd.webp\"]', '0', '2021-05-27 20:32:51', '2021-05-27 20:32:51'),
(111, 'Nesty GR33 Canary BOOMBOX', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Bluetooth Boombox Speaker', '<p>•Tremendous sound with RGB Light effects to make you feel like flying<br>•Nesty\'s signature Sound- Enjoy legendary sound delivered through high performace drivers which provides deep bass to your music<br>•Wireless Bluetooth Streaming with •Karaoke function, With classic handle and strap, which makes it easy to carry and take out<br><br>•Model: GR55 Canary<br>•Output: 51Watts<br>•Playtime: 5-7 hrs<br>•Battery Capacity: 4400mAh<br>•Color:&nbsp;&nbsp;&nbsp; Black<br>•Function: FM/USB Disk/ Aux-in state/•Display/Handsfree calling/Party Speaker.</p>', 170.00, NULL, NULL, 1, 0, '[\"afbaa78f3652c4e5d1b5ab6d0ce8b8e6.webp\"]', '0', '2021-05-27 20:34:16', '2021-05-27 20:34:16'),
(112, 'AEK Cyber Portable Wireless Speaker', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Bluetooth Speaker', '<p>Model number: S-10801<br>Output power: 25w<br>Driver unit size: 8 inch<br>Impedance: 3 Ohm<br>Frequency response: 100Hz-20KHz<br>Bluetooth version: V4.2+EDR<br>Bluetooth range: 10 meters<br>USB &amp; TF max memory supported: 32GB<br>FM Radio: 87.5 - 108.0 MHz<br>Battery capacity: Built-in 1800mAh<br>Battery type: Li-on<br>Playback time about 2hrs in Max Volume<br>Charging indicator: Yes<br>Charge Voltage: DC 5v<br>Speaker size* height 35cm</p>', 40.00, NULL, NULL, 1, 0, '[\"a8f693020dc5060c4e033e8e3e4815e8.webp\"]', '0', '2021-05-27 20:35:09', '2021-05-27 20:35:09'),
(113, 'Bone conductor Bluetooth headset', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Headset', '<p>• Regular earphones isolate you from the world around you <br>• Bone conductors: You\'re AWARE of the world around you <br>• Doesn’t block out surrounding noise; you hear everything <br>• Play music and pay attention to outside world sounds<br>• Protects the eardrum and reduces in-ear bacteria build-up <br>• Transmits sound through mini bone vibrations<br>• Music playback time: 5+ hours <br>• Dual microphones guarantee clear phone calls <br>• Charging time: 90 minutes <br>• Google and Siri voice assistants supported <br>• Ergonomic ear hooks provide comfort and won\'t fall off <br>• Flexible titanium alloy memory frame maintains shape <br>• BT 5.0: Stable connection and low power consumption <br>• Bluetooth distance: Up to 10m <br>• 3.7V 145mAh rechargeable polymer battery <br>• Material: PC + ABS and it is IP55 waterproof <br>• Weight: Approximately 22g &nbsp;<br>• Package: Headset; USB Charging Cable; User Manual</p>', 25.00, NULL, NULL, 1, 0, '[\"a3a2fe62effe092ba8c9ff3d0abaac6c.webp\"]', '0', '2021-05-27 20:36:12', '2021-05-27 20:36:12'),
(114, 'JBL XB340BT Wireless Headphones', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless headphones', '<p>• Original Appearance: Simple, Elegant, stylish<br>•User-friendly: ergonomic design, comfortable wearing<br>•Perfect Sound: Independent cavity design, pure sound<br>•Wireless 5.0<br>• Bluetooth range: 10m<br>• Rechargeable polymer lithium-on battery<br>•Up to 8 hours of Play time<br><br>*Enjoy life and Enjoy Music*</p>', 25.00, NULL, NULL, 1, 0, '[\"c7dc8bde2de3bc2c7738b284c852c079.webp\"]', '0', '2021-05-27 20:37:30', '2021-05-27 20:37:30'),
(115, 'BOSE Wireless Headphones', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless headphones', '<p>•Provides an acoustically-tight seal for superior sound isolation, deep bass sound and tight bass response<br>•Comfortable head cushion: ideal fitting for various head size with long metal headband<br>•One touch connection with Near Field Communication (NFC)* SBC/AAC<br>•Approximately 8hrs of playtime<br>•Rechargeable polymer lithium-on battery</p>', 25.00, NULL, NULL, 1, 0, '[\"cf2f7ef54125b9eaedf3627c04785d77.webp\"]', '0', '2021-05-27 20:38:33', '2021-05-27 20:38:33'),
(116, 'HD Wi-Fi Sports Action Camera', NULL, NULL, NULL, NULL, NULL, 48, 'Camera', '<p>*This is NOT the GoPro brand. It\'s a GENERIC brand*<br>• FREE Extra battery provided<br>• FULL mount kit: To mount on car, bike, helmet, drone etc.<br>• A must-have accessory for adrenaline junkies<br>• Capture \"in-action\" videos and photos, hands-free<br>• 170° Wide angle fish eye lens<br>• 2.0 inch TFT LCD screen<br>• Has P2P Wi-Fi: Sync the camera to your phone <br>• IP68 Waterproof casing, waterproof up to a depth of 30m<br>• Videos: 30FPS HD 1080P and 720P<br>• Images: JPEG up to 4608*3456<br>• Highly sensitive microphone for VideoAudio recording<br>• Supports up to 64GB TF cards (Sold separately)<br>• Wrist-worn remote control to control the camera <br>• Rechargeable 900mA, 3.7V battery</p>', 65.00, NULL, NULL, 1, 0, '[\"7faa812f3ed1e44bdba433aca1d4cb10.webp\"]', '0', '2021-05-27 20:39:56', '2021-05-27 20:39:56'),
(117, 'Plastic Phone Tripod Stand', NULL, NULL, NULL, NULL, NULL, 48, 'Tripod Stand', '<p>• Mini phone and camera TABLE tripod stand<br>• FREE phone holder to mount your phone onto the tripod<br>• Mounted tripod length: 16cm<br>• Folded Length: 20cm<br>• Ideal for indoors and timer shoots<br>• Load Capacity: 0.5kg<br>• Built-in bubble level for proper leveling<br>• 360° horizontal and 90° vertical swivel <br>• Can be used as a selfie holder<br>• Non-slip rubber feet<br>• Lightweight and portable<br>• Material: Aluminum + ABS<br>• Weight: 166 grams</p>', 20.00, NULL, NULL, 1, 0, '[\"bcc570b6a10c736c65f654ec04617943.webp\"]', '0', '2021-05-27 20:41:23', '2021-05-27 20:41:23'),
(118, 'Aluminium Phone Tripod Stand', NULL, NULL, NULL, NULL, NULL, 48, 'Tripod Stand', '<p>• FREE phone holder to mount your phone onto the tripod<br>• 4 leg sections; extended Length: 1m<br>• Folded Length: 33.5cm<br>• Ideal for outdoors, travel and timer shoots<br>• Load Capacity: 1.5kg<br>• Built-in bubble level for proper leveling<br>• 360° horizontal and 90° vertical swivel with 3-way head <br>• Grip for adjusting head position<br>• Quick release leg lock<br>• Non-slip rubber feet<br>• Lightweight and portable<br>• Quick release head; easy connecting to camera or camcorder<br>• Compatible with most cameras and camcorders<br>• Material: Aluminum<br>• Weight: 560 grams<br>• Comes with carrying bag</p>', 20.00, NULL, NULL, 1, 0, '[\"42159ff20c6630ed466cc49b44667907.webp\"]', '0', '2021-05-27 20:47:35', '2021-05-27 20:47:35'),
(119, 'Boxing Reflex Balls', NULL, NULL, NULL, NULL, NULL, 48, 'Reflex Balls', '<p>• Fun way to improve your reaction timing and agility <br>• Set of 3 balls, each has a different level of difficulty<br>• 3 levels of dificulty: Newbie, Veteran, Boxer<br>• Perfect on-the-go workout pack<br>• Perfect your concentration and hand-eye coordination<br>• Soft foam boxing reflex balls<br>• Speed reaction and accuracy training<br>• Elastic string makes the ball return after every punch<br>• Ideal for indoor and outdoor workouts<br>• Ideal for both adults and children<br>• Cardio, shoulder + hand workout, intense calories burner<br>• Portable: you can practice your skills anywhere, anytime<br>• Material: PU Foam, Silicone, elastic rope<br>• Ball weight: PU ball 25g, Rubber ball 65g, Tennis ball 85g</p>', 15.00, NULL, NULL, 1, 0, '[\"d250e984ea8b8846b977d6c000632a8a.webp\"]', '0', '2021-05-27 20:48:52', '2021-05-27 20:48:52'),
(120, '*Exercise resistance bands*', NULL, NULL, NULL, NULL, NULL, 48, 'Resistance bands', '<p><br></p>', 15.00, NULL, NULL, 1, 0, '[\"0d68174a7ea4a46154769f98b2bf5e95.webp\"]', '0', '2021-05-27 20:49:48', '2021-05-27 20:49:48'),
(121, 'STARMAX Wireless Mouse', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless mouse', '<p><br></p>', 8.00, NULL, NULL, 1, 0, '[\"e86a43d2cd551530d696ef88fa3b44d3.webp\"]', '0', '2021-05-27 20:50:45', '2021-05-27 20:50:45'),
(122, 'Portable Wireless Speakers', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Bluetooth Speaker', '<p>Up to 6 hrs of playtime<br>Speakerphone (for hands-Free calls)<br>Dimensions: 10cm *15cm<br>Total RMS power: 10watts<br>Bluetooth Version 2.1 +EDR<br>Battery charge time: 2.5 hrs<br>SD Memory card slot<br>Auxillary/ Line input<br>Frequency response: 150hz-20kHz</p>', 12.00, NULL, NULL, 1, 0, '[\"6284d7ea8050f6ef68ea63f139ed0f8f.webp\"]', '0', '2021-05-27 20:51:39', '2021-05-27 20:51:39'),
(123, 'HDMI Cable (5M)', NULL, NULL, NULL, NULL, NULL, 48, '5m', '<p><br></p>', 6.00, NULL, NULL, 1, 0, '[\"730eac5634578c9794a311acd8a03aea.webp\"]', '0', '2021-05-27 20:52:41', '2021-05-27 20:52:41'),
(124, 'Oraimo 2A Fast Charging kit', NULL, NULL, NULL, NULL, NULL, 48, 'Charging kit', '<p>Offers efficient and stable charging at home, in the office, or on the go<br>Plug type: UK type<br>Input: 100-240V~50/60Hz 400mA<br>Output: 5.0V--2.0A<br>Cable length: 1m<br>The adapter is compatible with any USB enabled device<br>Manufactures warranty: 6 months</p>', 7.00, NULL, NULL, 1, 0, '[\"f71a06ea95862a8051ef03d4de5207ad.webp\"]', '0', '2021-05-27 20:53:41', '2021-05-27 20:53:41'),
(125, 'Sports wireless headset', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Headset', '<p>• Perfect for people who love music and sports<br>• Superb, crystal clear stereo sound quality with good bass<br>• Ergonomic ear-hook design, won\'t drop during workouts<br>• Take calls on-the-go, hands free: In the gym or on the road<br>• Answer/End/Reject/Redial | Play/Pause/Last/Next/Vol +/-<br>• Mic with noise cancellation for calls in noisy environments<br>• Compatible with almost all Bluetooth devices<br>• Advanced CSR chip allows for easy pairing with devices<br>• Sweat Proof: Get drenched in sweat, it won\'t be damaged<br>• In-ear ear plug, for good noise isolation<br>• Battery capacity: 70mAH<br>• Music playback time: About 3+ hours<br>• Call talk time: 4+ hours <br>• Bluetooth distance: Without obstacles 10m <br>• Charging time: 1-2 hours</p>', 20.00, NULL, NULL, 1, 0, '[\"861390282fe73cf4c8c1a83f829cae9b.webp\"]', '0', '2021-05-27 20:55:11', '2021-05-27 20:55:11'),
(126, 'Mini Digital Camera for Kids', NULL, NULL, NULL, NULL, NULL, 48, 'Camera', '<p>• The world through your kid\'s eyes<br>• Takes photos as well as videos<br>• 5 built-in kids games (kid can play games on the camera)<br>• 5 control buttons, easy for kids to operate<br>• Special effects, frames, filters<br>• Kids will edit photos with built-in cartoon stickers<br>• Durable high-quality plastic shell + Neck strap<br>• 2.0 inch LCD Screen, Resolution: 720*320<br>• Image sensor: 0.3MP sensor with a maximum of 12MP<br>• Images: JPEG and Videos: 720P and 1080P at 30fps<br>• Self-timer and Automatic shutdown<br>• Battery: 400mAh 3.7V Rechargeable Polymer <br>• Neck strap minimizes drops &amp; odds of misplacing it<br>• Ideal for 2 to 10-year-olds<br>• Colors: YellowPink, YellowBlue<br>• PC Interface: USB 2.0 for charging and data transfer<br>• Size: 8.3 * 4.6 * 4.5cm<br>• Weight: 52 grams</p>', 30.00, NULL, NULL, 1, 0, '[\"cbd66f2c36e8441eea7bf8a81962c3c5.webp\"]', '0', '2021-05-27 20:56:30', '2021-05-27 20:56:30'),
(127, 'JB950 Bluetooth Headphones', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless headphones', '<p>Model: 950BT<br>Bluetooth range upto 10meters<br>Up to 6 hours playtime <br>Micro SD/TF card support upto 32 gig<br>Battery type: Lithium-ion<br>Battery Capacity: 400mAH <br>Microphone support frequency:30-16k Hz</p>', 18.00, NULL, NULL, 1, 0, '[\"5f3571cf45d6c88e832b63c58b51d0ad.webp\"]', '0', '2021-05-27 20:57:29', '2021-05-27 20:57:29'),
(128, 'Intelligent Fitness Bracelet', NULL, NULL, NULL, NULL, NULL, 48, 'Fitness Bracelet', '<p>SIM &amp; Memory Card: NOT SUPPORTED <br>• 0.96 Inch OLED Color screen with touch sensor<br>• Time; Date; Alarm &amp; Stop watch<br>• Multi-Mode: Running, swimming, basketball, badminton<br>• Real-time Systolic &amp; Diastolic Blood Pressure monitoring<br>• Real-time dynamic Heart Rate monitoring<br>• Real-time dynamic Blood Oxygen monitoring <br>• Pedometer- Steps; Distance &amp; Calories counter<br>• Alerts for Calls; Texts; WhatsApp; Facebook; Twitter etc.<br>• Sedentary alert- Fatigue &amp; Sleep monitoring<br>• Phone App-based fitness management<br>• Remote Camera Shoot; Anti lost &amp; Phone finder<br>• Screen turns on when wrist is raised <br>• IP68 Waterproof, ideal for swimming &amp; diving<br>• USB Plug-in charging, from 0 to 100% in 90 minutes<br>• 4 - 7 days on a single charge &amp; 7-Day data storage<br>• For Android 4.4/ iOS 8.0 &amp; above<br><br>Disclaimer: <br>For reference use only. Do not use for self-diagnosis or in place of professional medical equipment.</p>', 25.00, NULL, NULL, 1, 0, '[\"74e72973cd69a6d1e25f44a54a972c0b.webp\"]', '0', '2021-05-27 20:59:00', '2021-05-27 20:59:00'),
(129, 'Tactical Hiking Water Carrier', NULL, NULL, NULL, NULL, NULL, 48, 'Water Carrier', '<p>• Size: 43*18cm<br>• Capacity: 3 Litres of water (Beer, well, don\'t drink &amp; walk :)<br>• Weight: 0.5kg<br>• Material: Oxford 420D Nylon<br>• Attached water pipe serves as drinking straw<br>• Super strong &amp; durable army standard material<br>• Ergonomic design: Comfortable to carry around for hours<br>• Also has a compartment for storing your other accessories<br>• Heat shield: Your back is heat-shielded from water bag<br>• Adjustable chest buckle<br>• Colors: Army green, Khaki</p>', 29.00, NULL, NULL, 1, 0, '[\"b0dbd4e10a576f1c5b5e17dfe9caf020.webp\"]', '0', '2021-05-27 21:00:08', '2021-05-27 21:00:08'),
(130, 'MOLLE- Tactical Trekking Water-resistant Duffel Bag', NULL, NULL, NULL, NULL, NULL, 48, 'Duffel bag', '<p>• Size: 20*20*40cm<br>• Capacity: 15 Litres<br>• Weight: 1.3kg<br>• Material: Oxford 1000D Nylon<br>• Super strong &amp; durable military-grade material<br>• Ergonomic design: Comfortable to carry around for hours<br>• Can serve as a gym bag as well as a travel bag<br>• Enough room for clothes, toiletries, shoes etc.<br>• Colors: Black, Army green, Khaki<br></p>', 30.00, NULL, NULL, 1, 0, '[\"f22941acd87c851d5d4dcc77e9051827.webp\"]', '0', '2021-05-27 21:01:28', '2021-05-27 21:01:28'),
(131, 'Universal 3-in-1 Camera Clip-on Lenses', NULL, NULL, NULL, NULL, NULL, 48, 'Clip on Lense', '<p>• 0.63x Super Wide Angle + 198° Fisheye + 15x Macro Lenses <br>• Be creative, get more out of your smartphone\'s camera<br>• Works on most mobile phones, tablet PCs &amp; laptops<br>• Gives you an array of shooting options:<br>• 15x Macro lens helps to focus at very close distances. Ideal for a close-up image of an insect, flower etc.<br>• Fish-eye lens has a 198° field of view &amp; creates round images. For interiors, panoramas, artistic photography etc.<br>• 0.63x Wide-angle lens increases your field of view, from panoramic landscapes to group portrait photography etc.<br>• Screw the lens of your choice onto the clip &amp; simply place it over your device\'s camera.<br>• Material: Optical Glass + Plastic + Aluminum Alloy<br>• Package Includes:&nbsp;&nbsp; &nbsp;Fish-eye Lens, Wide Angle Lens, Micro Lens, Lens Covers</p>', 8.00, NULL, NULL, 1, 0, '[\"ba1c0500645fed21acbbca2a9d92a801.webp\"]', '0', '2021-05-27 21:03:32', '2021-05-27 21:03:32'),
(132, 'Universal Clip-on 12x Telephoto Phone Lens', NULL, NULL, NULL, NULL, NULL, 48, 'Phone Lens', '<p>• Explore, get more out of your smartphone\'s camera<br>• Works on most mobile phones, tablet PCs &amp; laptops<br>• Use your phone\'s camera to capture distant objects<br>• Can be used as a monocular, ideal for seeing far off objects like animals, birds, people, scenery etc.<br>• Magnification: 12x<br>• Range: 50m - 1.2km<br>• Length: 9cm<br>• Diameter: 3cm<br>• Objective Lens Diameter: 2.5cm<br>• Eyepiece Lens Diameter: 1.5cm<br>• Field of view: 70°<br>• Adjustable manual focus<br>• Screw lens onto the clip &amp; clip it over your device\'s camera<br>• Material: Optical Glass + Plastic <br>• Package Includes:&nbsp;&nbsp; &nbsp;Telephoto Lens, Lens Covers, Lens Cleaner</p>', 10.00, NULL, NULL, 1, 0, '[\"5879da33338c9c70f80445c0e3a22c50.webp\"]', '0', '2021-05-27 21:06:33', '2021-05-27 21:06:33'),
(133, '*Universal Clip-on 8x Telephoto Phone Lens*', NULL, NULL, NULL, NULL, NULL, 48, 'Superzoom phone lens', '<p>• Explore, get more out of your smartphone\'s camera<br>• Works on most mobile phones, tablet PCs &amp; laptops<br>• Use your phone\'s camera to capture distant objects<br>• Can also be used as a monocular/ telescope, best for seeing far off objects like animals, birds, people, scenery etc.<br>• Magnification: 8x<br>• Best range: 50 to 800m<br>• Length: 7cm<br>• Diameter: 3cm<br>• Objective Lens Diameter: 2.5cm<br>• Eyepiece Lens diameter: 1.5cm<br>• Field of view: 60°<br>• Screw lens onto the clip &amp; clip it over your device\'s camera<br>• Adjustable manual focus<br>• Material: Optical Glass + Plastic <br>• Package Includes: Telephoto Lens, Lens Covers, Lens Cleaner</p>', 8.00, NULL, NULL, 1, 0, '[\"7ea7c9da3f4e6bf1893950b8b273b56c.webp\"]', '0', '2021-05-27 21:08:28', '2021-05-27 21:08:28'),
(134, 'JBL Tune 268 tws Wireless Earpods', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless earpods', '<p>Bluetooth connection name: L3<br>Bluetooth version: 5.0<br>Power Input DC 5v<br>Headset battery Capacity: 3.7V/50mAh<br>Call/ play time: about 4 hours<br>Charging time: about. 1 hour<br>Charging box capacity: 3.7V/350mAh<br>Support agreement HSP/HFP/A2DP/AVRCP<br>Sensitivity: 120+ 5dB<br>Frequency response range: 20-20000Hz<br>*Easy pairing connect*</p>', 25.00, NULL, NULL, 1, 0, '[\"393fc7e38e010c2102be1f48455fdf0d.webp\"]', '0', '2021-05-27 21:10:03', '2021-05-27 21:10:03'),
(135, 'TWS JBL Wireless Earpods', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Headset', '<p>*Specifications*<br>• Bluetooth version 5.0<br>• Bluetooth range: 10m<br>• Headphone usage time: 3hrs<br>• Headphone Charging time:1 hour<br>• Battery size 50mAh/3.7 v<br>• Battery compartment battery: 2000mAh<br>*Headphones pairing Steps*<br>1. Prompt tone operation: The charging compartment comes out with automatic start-up pairing, the default English prompt tone, When the mobile phone is not connect after&nbsp; booting and the pairing is successful, double click on any of the headset switch between Chinese and English mode<br>2. Song up and down operations: Double-click the R-side function key for next song, double-click the L-side function key for the previous song<br>3. Volume+- Operation: Press and hold the R side function key for 2 seconds to increase volume and press and hold the L side function button for 2 seconds to decrease Volume<br>4. Song Pause operation: clickon either side of the headset<br>5. Call answering operation: Incoming phone calls automatically pause playing music, single click on any of the earbuds to answer, do the same to hang up.<br>6. Start the mobile phone Siri function or voice control function: long press on any of the earbuds for 1 second, let go after the beep , the phone Siri function would have been activated, press the key to end this function<br>7. Switch on/off: Long press any side of the headset for 3 seconds to turn on or take it from the charging compartment automatically turn on when its out, and the indicator status is red and blue lights flashing alternatively. Long press the Earbuds for 5 seconds or directly put them into the charging compartment, headphones automatically turns off when the red light is on<br>8. When the headset is charging, it lights up in red and full blue light when full and will automatically turn off after 30 second s</p>', 25.00, NULL, NULL, 1, 0, '[\"fc28c7989a28a4990475a0174268ae3d.webp\"]', '0', '2021-05-27 21:11:41', '2021-05-27 21:11:41'),
(136, 'OKCY/T&G portable wireless Speaker', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Bluetooth Speaker', '<p>*Technical Specifications*<br>• Bluetooth range upto 10m<br>• Up to&nbsp; 5 hours of playtime<br>• Input DC-5V<br>• Frequency response 150-18000Hz<br>• Power output RMS 3 W= THD10%<br>• FM Tuner MHz-108MHz<br>• Very loud and portable<br>• Charging time 1 hour to 1h 30mins<br>• Colors; Black, Green, red, blue and Grey<br>&nbsp;*Function*<br>1. Play USB/TF card in the mp3 audio file<br>2. External audio input<br>3. External power charging Interface<br>4. FM Auto scan radio</p>', 10.00, NULL, NULL, 1, 0, '[\"4a4c80e56dac3b33cd5af73e80d7605f.webp\"]', '0', '2021-05-27 21:12:41', '2021-05-27 21:12:41'),
(137, '*Siri - Google Assistant Wireless Earpods*', NULL, NULL, NULL, NULL, NULL, 48, 'Earpods', '<p><br></p>', 18.00, NULL, NULL, 1, 0, '[\"1c2f6c4e09f837cbe4d9f3d28c704ba6.webp\"]', '0', '2021-05-27 21:13:34', '2021-05-27 21:13:34'),
(138, '16 gig Toshiba flash drive', NULL, NULL, NULL, NULL, NULL, 48, 'USB flashdrive', '<p><br></p>', 8.00, NULL, NULL, 1, 0, '[\"ed59a46cf123631a663c06f5d8086b65.webp\"]', '0', '2021-05-27 21:14:37', '2021-05-27 21:14:37'),
(139, '8 gig Toshiba flash drive', NULL, NULL, NULL, NULL, NULL, 48, 'USB flashdrive', '<p><br></p>', 6.00, NULL, NULL, 1, 0, '[\"5117259a0f3f4d3f62aa487da43f454f.webp\"]', '0', '2021-05-27 21:15:28', '2021-05-27 21:15:28'),
(140, 'Nesty BM108mini Portable Bluetooth speaker', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Bluetooth Speaker', '<p>Up to 5 hours of playtime<br>Power output: 5W<br>Speaker Size: 52(2\")*5<br>Power Supply: USB DC 5V/500 mAH<br>Charging Interface: Micro USB<br>Battery Charging DC-5V<br>Battery Capacity: 3 7V/1200mah<br>Aux and radio Antenna:Yes<br>FM/BT/USB/Micro SD/Auxiliary compatible</p>', 22.00, NULL, NULL, 1, 0, '[\"e6da610b5b355554544c516f4bfc0f3e.webp\"]', '0', '2021-05-27 21:16:29', '2021-05-27 21:16:29'),
(141, 'S760 Bluetooth Headphones', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless headphones', '<p><br></p>', 15.00, NULL, NULL, 1, 0, '[\"7dcc70ffd835f57a30aa051d93b48079.webp\"]', '0', '2021-05-27 21:17:35', '2021-05-27 21:17:35'),
(142, 'Oraimo Headphones (The sound of Studio)', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless headphones', '<p>Brand: Oraimo<br>Model: OEB-H66D<br>Up to 15 hours of playtime<br>Standby time: 200 hrs<br>Bluetooth range: 10 meters<br>Bluetooth version: 4:2<br>Two in one Design<br>Powerful sound<br>Battery Capacity: 500mAh<br>Battery cell composition: Lithium Ion<br>Material: Metal+ABS+PC<br>*Comfort Fit: Oraimo exclusive features round ear design and comfort-cushion ear cups, allowing you to enjoy long listening sessions in total luxury*</p>', 45.00, NULL, NULL, 1, 0, '[\"f2f031050628abd693772ea4bd9c6388.webp\"]', '0', '2021-05-27 21:18:48', '2021-05-27 21:18:48'),
(143, '450 BT Wireless Headphones', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless headphones', '<p>Up to 5 hours of Playtime<br>Bluetooth range: 10meters<br>Battery Charge time: 2 hours<br>Battery rechargeable polymer lithium-on battery<br>Speakerphone: Yes<br>Line in/ Auxillary port: Yes (but cable not provided)<br>Memory card slot: Yes<br>Colours, white, black, blue, red</p>', 15.00, NULL, NULL, 1, 0, '[\"684e26567cfae3b914e2b1b56f0aa724.webp\"]', '0', '2021-05-27 21:19:48', '2021-05-27 21:19:48'),
(144, 'Bluetooth Stereo Headset', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Headset', '<p>• Perfect for people who love their music on-the-go<br>• Good stereo sound quality<br>• Ergonomic hanging ear design: fits perfectly, won\'t fall off<br>• Take calls on-the-go, hands free<br>• Answer/End/Calls | Music: Play/Pause/Last/Next/Vol +/-<br>• Mic with noise cancellation for calls in noisy environments<br>• Compatible with basically all Bluetooth devices<br>• Anti-winding, high strength cable<br>• Magnets attaches the pieces together when not in use <br>• Can connect to 2 Bluetooth devices at the same time<br>• In-ear ear plug, for good noise isolation<br>• Battery capacity: 55mAH lithium battery <br>• Music playback time: About 2+ hours<br>• Call talk time: 3+ hours <br>• English voice prompts<br>• Bluetooth distance: Without obstacles 10m <br>• Charging time: Up to 90 minutes</p>', 7.00, NULL, NULL, 1, 0, '[\"0bca0febc967e4f40319c801afca14a0.webp\"]', '0', '2021-05-27 21:20:51', '2021-05-27 21:20:51'),
(145, 'USB 2.0 HUB', NULL, NULL, NULL, NULL, NULL, 48, 'USB extension', '<p>•1 Upstream and 4 downstream USB port included<br>•Fully compliant with USB specification version 2.0<br>•Hot Plug &amp; play USB Device<br>•Half-transparent design with blue LED for power<br>•Interface: USB 2.0<br>•Compatible with USB 1.1<br>•Data Transfer rate: 1.5Mbps/ 12Mbps/ upto 480Mbps<br>•Bus-Power Limit current protection:500mA</p>', 7.00, NULL, NULL, 1, 0, '[\"96858e5ddf1268a25c1078368f96897a.webp\"]', '0', '2021-05-27 21:22:02', '2021-05-27 21:22:02'),
(146, 'Lighting Splitter for Iphone', NULL, NULL, NULL, NULL, NULL, 48, 'Lighting splitter', '<p>• Charge and Music at the same time<br>• Smart chips plug and play<br>•&nbsp; Excellent sound performance: Supports upto 48 khz and 24-bit audio output<br>•&nbsp; keeps original ap lighting earphones sound quality<br>• Suitable for Iphone 7/7plus/8/8plus/X</p>', 5.00, NULL, NULL, 1, 0, '[\"f87fa96c426da2cfbcf016d48662fff3.webp\"]', '0', '2021-05-27 21:23:27', '2021-05-27 21:23:27'),
(147, '5A iPhone charging cable', NULL, NULL, NULL, NULL, NULL, 48, 'Charging cable', '<p>• Fast data cable, Fast Charge, Fast Sync<br>• Super purity copper conductor, ensuring a high quality<br>• Combine the function of data transmission and charging.<br>• Resist high pressure with excellent design<br>• Compatible with any USB edition, anti-interference</p>', 4.00, NULL, NULL, 1, 0, '[\"15ea78b2bf744c42f4f03d4e1a5cfa1c.webp\"]', '0', '2021-05-27 21:24:46', '2021-05-27 21:24:46'),
(148, '5A C Type super charger', NULL, NULL, NULL, NULL, NULL, 48, 'Charging cable', '<p>• Fast data cable, Fast Charge, Fast Sync<br>• Super purity copper conductor, ensuring a high quality<br>• Combine the function of data transmission and charging.<br>• Resist high pressure with excellent design<br>• Compatible with any USB edition, anti-interference</p>', 3.00, NULL, NULL, 1, 0, '[\"0c6dae8661adc8fd324270a87352c98c.webp\"]', '0', '2021-05-27 21:26:31', '2021-05-27 21:26:31'),
(149, 'JBL BOOMBOX', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Bluetooth Boombox Speaker', '<p>• Up to 10 hours of Playtime<br>• Bluetooth range: 10 meters<br>• Power Source: battery🔋<br>• Bluetooth version: 4.2<br>• 10000mAH battery with dual USB Charge out<br>• Speakerphone: Yes<br>• Splash proof:.&nbsp;&nbsp; Yes<br>• Memory card slot: Yes<br>• Line- in (Auxillary cable provided)<br>• *Connect +* function (Wirelessly connect compatible speakers)<br>• Battery Charge time: 4 hours<br>• Output power: 4π5w*2<br>• Frequency effect: 100Hz~18KHz<br>• Input Power: DC5V 2A<br>• Maximum current consumption: 2A<br>• Battery type: Polymer Li-ion 13.2-16.8V/4000mA<br>• Audio signal input interface: Standard 3.5mm jack (stereo)</p>', 130.00, NULL, NULL, 1, 0, '[\"25e4514b41991ee8dcaa4d7457d8694a.webp\"]', '0', '2021-05-27 21:27:46', '2021-05-27 21:27:46'),
(150, 'NESTY BM104 Portable Wireless Speaker', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless Bluetooth Boombox Speaker', '<p>• Up to 4 hours of play time<br>• Up to 10 meters Bluetooth operating range<br>• With A2DP/AVRCP Wireless, wireless stream music from wireless enabled devices ie mobile phone, laptop, iphone, ipad, etc<br>• Frequency response: 80Hz-18KHz<br>• With micro USB charging port: DC5V/1A or DC5V/2A<br>• Fast charging by micro USB charging cable (included)<br>• With USB and TF card supporting<br>• With AUX-in socket (aux cable included)<br>• Very clear sound and dynamic sound effect<br>*Easy operate control panel*<br>• EQ function: Bass &amp; Treble adjustment<br>• Built-in Lithium Battery inside 7.4V&nbsp;&nbsp;&nbsp; 2000mAh<br>• Portable speaker with strap easy to take out<br>• Remote control: Yes<br>• Mic: Yes</p>', 100.00, NULL, NULL, 1, 0, '[\"ec66fdc55eb6d52d2ce2a8d55307020e.webp\"]', '0', '2021-05-27 21:28:52', '2021-05-27 21:28:52'),
(151, 'Ucom PC Dual Shock Joypads', NULL, NULL, NULL, NULL, NULL, 48, 'Gaming joypads', '<p><br></p>', 10.00, NULL, NULL, 1, 0, '[\"0cccca9f359678aa36d0a2faa136874a.webp\"]', '0', '2021-05-27 21:30:01', '2021-05-27 21:30:01'),
(152, '2.4GHZ WIRELESS MOUSE', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless mouse', '<p>USB interface<br>2.4 operational Frequency<br>4-key Optical mouse<br>Compact, Ergonomic and comfortable design<br>With 800, 1600 dpi resolution by click<br>Low current with power ON and OFF<br>Wireless with USB receiver</p>', 5.00, NULL, NULL, 1, 0, '[\"61df6b5bb9176152136a69f73fb90516.webp\"]', '0', '2021-05-27 21:31:12', '2021-05-27 21:31:12'),
(153, 'Universal Car Phone holder', NULL, NULL, NULL, NULL, NULL, 48, 'Phone holder', '<p>360° Rotating Support Holder<br>Cupule and fast release button<br>Button to regulate width:<br>&gt;Maximum width-120mm<br>&gt;Minimum width- 40mm<br></p>', 5.00, NULL, NULL, 1, 0, '[\"d478b5d0e697dc9007aa873e5c9a21dd.webp\"]', '0', '2021-05-27 21:32:37', '2021-05-27 21:32:37'),
(154, 'Magic Suction Phone Stand', NULL, NULL, NULL, NULL, NULL, 48, 'Phone stand', '<p>Material: Plastic/Rubber/Metal<br>Size:.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.9*4.9*7.2cm<br>Weight:.&nbsp; 21.9g<br>Small and Exquisite to carry with you<br>Super Suction<br>Double-sided suction cup design<br>Multi-angle adjustment ie 360 degrees rotation design<br>Can be used for office, home, driving etc</p>', 2.00, NULL, NULL, 1, 0, '[\"8516146aa53439343f1de31d639a78da.webp\"]', '0', '2021-05-27 21:33:26', '2021-05-27 21:33:26'),
(155, 'AKG Earphones', NULL, NULL, NULL, NULL, NULL, 48, 'Wired earphones', '<p>Earphones:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Form FactorIn-ear<br>Sound Output:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mode stereo<br>Frequency Response: 20 Hz<br>Sensitivity:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 93.2 dB<br>Impedance:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32 Ohm<br>Audio Controls:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; play/pause, volume<br>Controls:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Volume, play/pause<br>Type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Earphones<br>Connector Type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mini-phone stereo 3.5 mm<br>Included Accessories:&nbsp; 3 pairs of ear tips (small, medium, large)<br>Model:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EO-IG955 Tuned by AKG</p>', 3.00, NULL, NULL, 1, 0, '[\"d54eb378e595e44274babeb347c38d88.webp\"]', '0', '2021-05-27 21:34:33', '2021-05-27 21:34:33'),
(156, 'Allison Multi-Function Car Charger', NULL, NULL, NULL, NULL, NULL, 48, 'Car charger', '<p>◦ Bluetooth Version: V4.0 + EDR<br>◦ Charging Type: dual USB<br>◦ Bluetooth sound processing: A2DP<br>◦ Bluetooth microphone effective distance: 10 M<br>◦ Display screen: LED screen<br>◦ TF&amp;USB: 128G<br>◦ Music format: MP3/WMA<br>◦ FM emission frequency: 87.5MHz<br>◦ AUX: Output/input<br>◦USB charging: 5V/3.4A</p>', 7.00, NULL, NULL, 1, 0, '[\"427f9afec316cf37d36e8f78474135ff.webp\"]', '0', '2021-05-27 21:35:50', '2021-05-27 21:35:50'),
(157, 'Portable Wireless Neckband SoundGear', NULL, NULL, NULL, NULL, NULL, 48, 'Wireless neckband speaker', '<p>Use: Computer, Mobile Phone, Portable Audio Player<br>•Bluetooth version: 5.0<br>•Transmission Range:&nbsp; 10m<br>•Output power: 3W*2<br>•Charging time: 3hours<br>•Material: ABS,Fabric<br>•Product size: 190*187*29mm<br>•Color: Blue,Red,Black,CamouFlage,Gray<br>•Power Source: Battery<br>•Battery: Yes, 3.7V 1200mAh<br>•Number of Loudspeaker Enclosure: 1<br>•Speaker Type: Portable<br>•Cabinet Material: Plastic<br>•T/Flash:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Compatible<br>•USB Flash: Compatible<br>•Aux Cable : Compatible<br>2 Shares</p>', 15.00, NULL, NULL, 1, 0, '[\"432d859d99024107c596f71fc32cd40c.webp\"]', '0', '2021-05-27 21:37:09', '2021-05-27 21:37:09'),
(158, 'Acrylic Ring Phone Holder', NULL, NULL, NULL, NULL, NULL, 48, 'Phone holder', '<p>Size: 35*40mm<br>Weight:. 15g<br>Usage :. Souvenirs, Promotion,&nbsp;&nbsp;&nbsp; Advertising, Gift, Party<br>Feature: high quality material, Strong attachment, Universal size, Multifunction<br>360 degrees rotation left and right</p>', 2.00, NULL, NULL, 1, 0, '[\"cd926051cb8f0b735f4f4c91e0c6b420.webp\"]', '0', '2021-05-27 21:38:23', '2021-05-27 21:38:23'),
(159, 'Oraimo 2A Fast Charging USB data cable', NULL, NULL, NULL, NULL, NULL, 48, 'Charging cable', '<p>Brand: Oraimo<br>Model. OCD-M201<br>Weight: 81.6g<br>Compatible Devices: All Micro USB<br>Length.&nbsp; 1 meter <br>Fast charging, fast syncing, Reinforced cable, longer life span<br>Warranty: 180 days<br></p>', 3.00, NULL, NULL, 1, 0, '[\"2bf0599730bc2c99440dcc02a0e138e7.webp\"]', '0', '2021-05-27 21:39:22', '2021-05-27 21:39:22'),
(160, 'Insulated Server (2.5 litre)', NULL, NULL, NULL, NULL, NULL, 43, 'Ideal for very cold or very cold foods to maintain temperature whilst serving your meal. Ideal for family gatherings to ensure that first served and last served have the same experience. Save up to 30% on this product.', '<p><br></p><p>Product Description</p>', 25.00, NULL, NULL, 1, 0, '[\"1f2f68a125493f658392122bb0da94b6.webp\"]', '0', '2021-05-28 07:40:37', '2021-05-28 07:40:37'),
(162, 'Navy Blue Nike Air Max', NULL, NULL, NULL, NULL, NULL, 49, 'Navy blue Nike Air max in all sizes', '<p>Full product specifications here.</p>', 50.00, NULL, NULL, 1, 0, '[\"d6bcb6e8d88ad80b4128a33fc4a59758.webp\"]', '0', '2021-05-28 13:13:07', '2021-05-28 13:13:07'),
(163, 'White Nike Air Max', NULL, NULL, NULL, NULL, NULL, 49, 'White Nike Air Max in all sizes', '<p>Full product specifications here.</p>', 50.00, NULL, NULL, 20, 0, '[\"f620c38ddf0f39cdbac4227bc1e0e3f7.webp\"]', '0', '2021-05-28 13:18:43', '2021-05-28 13:18:43'),
(164, 'Nike Air Max', NULL, NULL, NULL, NULL, NULL, 49, 'Rainbow edition Nike logo Air Max available in all sizes.', '<p>Full product specifications here.</p>', 50.00, NULL, NULL, 20, 0, '[\"694fc3f062a9ed8d70e2c2e2b9692f7b.webp\"]', '0', '2021-05-28 13:20:37', '2021-05-28 13:20:37'),
(166, 'Black Nike Slippers', NULL, NULL, NULL, NULL, NULL, 49, 'Nike Slippers available in all sizes. Black color.', '<p>Full product specifications here.</p>', 10.00, NULL, NULL, 20, 0, '[\"e88da52affcb7d691c60ec0624556f53.webp\"]', '0', '2021-05-28 13:22:41', '2021-05-28 13:22:41'),
(167, 'Brown Nike Slippers', NULL, NULL, NULL, NULL, NULL, 49, 'Nike Slippers available all sizes.  Brown color', '<p>Full product specifications here.</p>', 10.00, NULL, NULL, 20, 0, '[\"76cb6f4030f7ab283fea89052a021e82.webp\"]', '0', '2021-05-28 13:24:18', '2021-05-28 13:24:18'),
(168, 'Timbaland Boots', NULL, NULL, NULL, NULL, NULL, 49, 'Quality boots available in all sizes.', '<p>Full product specifications here.</p>', 35.00, NULL, NULL, 20, 0, '[\"08410fec3722c3ba1b3a6d774908923a.webp\"]', '0', '2021-05-28 13:25:26', '2021-05-28 13:25:26'),
(169, 'Air Jordan High Cut Sneakers', NULL, NULL, NULL, NULL, NULL, 49, '2 tone black and white high cut sneakers available in all sizes.', '<p>Full product specifications here.</p>', 35.00, NULL, NULL, 20, 0, '[\"0c8179cb6b7b22ccecc6b72cafd47375.webp\"]', '0', '2021-05-28 13:26:30', '2021-05-28 13:26:30'),
(170, 'Light brown Nike Slippers', NULL, NULL, NULL, NULL, NULL, 49, 'Nike Slippers available in all sizes. Light brown color.', '<p>Full product specifications here.</p>', 10.00, NULL, NULL, 15, 0, '[\"eb676fce9cb80a147297c07693103040.webp\"]', '0', '2021-05-28 13:28:02', '2021-05-28 13:28:02'),
(171, 'Nike Air Zoom', NULL, NULL, NULL, NULL, NULL, 49, 'Two tone red and white Nike shoes available in all sizes.', '<p>Full product specifications here.</p>', 35.00, NULL, NULL, 16, 0, '[\"effa448dbd2f26a52ab98524cfdd5479.webp\"]', '0', '2021-05-28 13:31:43', '2021-05-28 13:31:43'),
(172, 'Low Cut Nike Air Jordans', NULL, NULL, NULL, NULL, NULL, 49, 'White air Jordan Nike sneakers available all sizes', '<p>Full product specifications here.</p>', 35.00, NULL, NULL, 17, 0, '[\"4b8ea922cf862b58109461a365d107a7.webp\"]', '0', '2021-05-28 13:35:51', '2021-05-28 13:35:51'),
(173, '2 tone Air Jordan Nike', NULL, NULL, NULL, NULL, NULL, 49, 'Grey and white Nike Air Jordans in grey and white color. Available in all sizes.', '<p>Full product specifications here.</p>', 35.00, NULL, NULL, 18, 0, '[\"43ab3126b25174997bf2cc927ce30e2f.webp\"]', '0', '2021-05-28 13:37:24', '2021-05-28 13:37:24'),
(174, 'Navy Blue Men\'s  Boots', NULL, NULL, NULL, NULL, NULL, 49, 'Navy Blue boots for men suitable for formal and smart casual. Available in all sizes.', '<p>Full product specifications here.</p>', 35.00, NULL, NULL, 19, 0, '[\"1330fa5e7071bc0fd5dcb0a8fb29baeb.webp\"]', '0', '2021-05-28 13:39:11', '2021-05-28 13:39:11'),
(175, 'High Cut Nike Air Jordans', NULL, NULL, NULL, NULL, NULL, 49, 'Customized White  High cut Nike Air Jordans with green and yellow sole and blue lace. Available in multiple sizes.', '<p>Full product specifications here.</p>', 35.00, NULL, NULL, 17, 0, '[\"3cb80052ee109fc601251a9e25348453.webp\"]', '0', '2021-05-28 13:41:17', '2021-05-28 13:41:17'),
(176, 'Versace Loafers', NULL, NULL, NULL, NULL, NULL, 49, 'Versace formal open heel loafers available in multiple sizes.', '<p>Full product specifications here.</p>', 35.00, NULL, NULL, 14, 0, '[\"44589b84fa86f92d1f58fb3a5f677e85.webp\"]', '0', '2021-05-28 13:42:51', '2021-05-28 13:59:15'),
(177, 'Black men\'s boots', NULL, NULL, NULL, NULL, NULL, 49, 'Black boots suitable for formal and smart casual.  Available in multiple sizes.', '<p>Full product specifications here.</p>', 35.00, NULL, NULL, 13, 0, '[\"76898b6dbd8d46750bc055b2d1ef16d9.webp\"]', '0', '2021-05-28 13:44:10', '2021-05-28 13:44:10'),
(179, 'SHOES', NULL, NULL, NULL, NULL, NULL, 45, 'WINTER BOOTS', 'WINTER BOOTS', 10.00, NULL, NULL, 2, 0, '[\"76d745ab2fb28bb20aa871a6c8336bb2.webp\"]', '0', '2021-05-28 13:45:10', '2021-05-28 13:45:10'),
(180, 'Nike Air Ultra', NULL, NULL, NULL, NULL, NULL, 49, 'Grey Nike Air ultra with strong, durable sole. Available in multiple sizes.', '<p>Full product specifications here.</p>', 35.00, NULL, NULL, 12, 0, '[\"fce1d65d0d629185dcb97b985c0f2040.webp\"]', '0', '2021-05-28 13:45:29', '2021-05-28 13:45:29'),
(181, 'Black Champion Slippers', NULL, NULL, NULL, NULL, NULL, 49, 'Champion slippers available in multiple sizes in black color.', '<p>Full product specifications here.</p>', 35.00, NULL, NULL, 12, 0, '[\"1acd0c8c6348c664f12c6d2bed02f11f.webp\"]', '0', '2021-05-28 13:48:26', '2021-05-28 13:48:26'),
(182, 'MICRO BAGS', NULL, NULL, NULL, NULL, NULL, 45, 'MICRO BAGS', 'MICRO BAGS', 6.00, NULL, NULL, 5, 0, '[\"7fa3ef956d733dcf64cea1514b52286f.webp\"]', '0', '2021-05-28 13:50:13', '2021-05-28 13:50:13'),
(183, 'MICRO BAGS', NULL, NULL, NULL, NULL, NULL, 45, 'MICRO BAGS', 'MICRO BAGS', 6.00, NULL, NULL, 5, 0, '[\"f707ae386a8ebd5506dea60545571285.webp\"]', '0', '2021-05-28 13:50:14', '2021-05-28 13:50:14'),
(184, 'Nike Slippers', NULL, NULL, NULL, NULL, NULL, 49, 'Grey Nike Slippers available in multiple sizes.', '<p>Full product specifications here.</p>', 10.00, NULL, NULL, 13, 0, '[\"01c4ee4cf69b87c7fdfdef22e33102c1.webp\"]', '0', '2021-05-28 13:52:43', '2021-05-28 13:52:43'),
(185, 'Nike Air', NULL, NULL, NULL, NULL, NULL, 49, 'Grey Nike Air sneakers. Available in multiple sizes.', '<p>Full product specifications here.</p>', 35.00, NULL, NULL, 17, 0, '[\"218330ab8675ecffdac43610c9744d59.webp\"]', '0', '2021-05-28 13:55:55', '2021-05-28 13:55:55'),
(186, 'Brown Air Boots', NULL, NULL, NULL, NULL, NULL, 49, 'Brown boots suitable for formal or smart casual. Available in multiple sizes.', '<p>Full product specifications here.</p>', 35.00, NULL, NULL, 15, 0, '[\"6d12d5decb4e9921e332c6a2306c7d54.webp\"]', '0', '2021-05-28 13:58:17', '2021-05-28 13:58:17'),
(187, 'Large decorating bag', NULL, NULL, NULL, NULL, NULL, 43, 'Large reusable bag for decoration. Suitable with pastries.', '<p>Full product specifications here.</p>', 24.00, NULL, NULL, 50, 0, '[\"b32972b02a46df8373d24b558f40d59e.webp\"]', '0', '2021-05-28 14:29:11', '2021-05-28 14:29:11'),
(188, 'Cake Taker', NULL, NULL, NULL, NULL, NULL, 43, 'Large Tupperware storage for serving full cake. Get 2 free cake servers along with it', '<p>Full product specifications here.</p>', 25.00, NULL, '5', 50, 0, '[\"d680c1ce78438e4f0fa30dac8041024c.webp\"]', '0', '2021-05-28 14:31:34', '2021-05-28 19:56:47'),
(189, 'Eazi Speedy (1.25litre)', NULL, NULL, NULL, NULL, NULL, 43, 'Manual blender for all mixed desserts among other foods.', '<p>Full product specifications here.</p>', 88.00, NULL, NULL, 50, 0, '[\"d4f70d3315caf23f90d82a754db0ed2a.webp\"]', '0', '2021-05-28 14:34:00', '2021-05-28 14:34:00'),
(190, 'Eco Bottle (2 litre)', NULL, NULL, NULL, NULL, NULL, 43, '2 litre durable, Tupperware bottle.', '<p>Full product specifications here.</p>', 20.00, NULL, NULL, 50, 0, '[\"65b9c63ee2afea3d41528629bd871e67.webp\"]', '0', '2021-05-28 14:36:39', '2021-05-28 14:36:39'),
(191, 'Snack set', NULL, NULL, NULL, NULL, NULL, 43, '2 snack size lunchboxes. Save', '<p>Full product specifications here.</p>', 18.00, NULL, NULL, 50, 0, '[\"e392ec3ff3bca3ca9582d587e95aa268.webp\"]', '0', '2021-05-28 14:37:56', '2021-05-28 14:37:56'),
(192, 'Large Microwave Rice Maker (3litre)', NULL, NULL, NULL, NULL, NULL, 43, 'Fully cooked rice and sadza in the microwave. Quick and convenient with no mess and no worries.', '<p>Full product specifications here.</p>', 24.00, NULL, NULL, 50, 0, '[\"2038b24f6fe5155c6cb0f9097a2971fb.webp\"]', '0', '2021-05-28 14:39:45', '2021-05-28 14:39:45'),
(193, 'Herb Chopper (300ml)', NULL, NULL, NULL, NULL, NULL, 43, 'Herb chopper ideal for vegetables and fruits. Makes slicing and dicing easy and convenient in the kitchen.', '<p>Full product specifications here.</p>', 39.00, NULL, NULL, 50, 0, '[\"71ef3f6df253d4145bde129f61919533.webp\"]', '0', '2021-05-28 14:41:28', '2021-05-28 14:41:28'),
(194, 'Extra Chef with pull cord', NULL, NULL, NULL, NULL, NULL, 43, '1.35litre blender and slicer combo.', '<p>Full product specifications here.</p>', 95.00, NULL, NULL, 50, 0, '[\"29f143f0da0e6cc0e91546d79b373ada.webp\"]', '0', '2021-05-28 14:43:43', '2021-05-28 14:43:43');
INSERT INTO `products` (`id`, `name`, `brand`, `sku`, `slug`, `quantity`, `weight`, `shop_id`, `description`, `full_specs`, `price`, `sale_price`, `rating`, `status`, `featured`, `cover_img`, `more_imgs`, `created_at`, `updated_at`) VALUES
(195, 'Chef series water kettle', NULL, NULL, NULL, NULL, NULL, 43, 'Stainless steel 2.2 litre kettle.', '<p>Full product specifications here.</p>', 190.00, NULL, NULL, 50, 0, '[\"3625947b35d6301b72aadd068018b24a.webp\"]', '0', '2021-05-28 14:45:14', '2021-05-28 14:45:14'),
(196, 'Chef Series Frying Pan', NULL, NULL, NULL, NULL, NULL, 43, 'Stainless steel pan', '<p>Full product specifications here.</p>', 255.00, NULL, NULL, 50, 0, '[\"aaf9fa614c7a87cd0303e0eb3d139046.webp\"]', '0', '2021-05-28 14:46:24', '2021-05-28 14:46:24'),
(197, 'Chef series 2 stockpot', NULL, NULL, NULL, NULL, NULL, 43, '7 litre stainless steel pot', '<p>Full product specifications here.</p>', 350.00, NULL, NULL, 50, 0, '[\"318b382ab475bee63bf2fd160e9ac037.webp\"]', '0', '2021-05-28 14:47:41', '2021-05-28 14:47:41'),
(198, 'Chef series Sauteuse', NULL, NULL, NULL, NULL, NULL, 43, '4 litre stainless steel pot.', '<p>Full product specifications here.</p>', 280.00, NULL, NULL, 50, 0, '[\"30acd605cf4c3969f020106080eaf758.webp\"]', '0', '2021-05-28 14:48:47', '2021-05-28 14:48:47'),
(199, 'Micro delight', NULL, NULL, NULL, NULL, NULL, 43, '430 ml storage suitable for salads.', '<p>Full product specifications here.</p>', 12.00, NULL, NULL, 50, 0, '[\"83d4fc7a0b7470de0d62874589ccd668.webp\"]', '0', '2021-05-28 14:50:09', '2021-05-28 14:50:09'),
(200, 'Fridge mate', NULL, NULL, NULL, NULL, NULL, 43, '650 ml storage suitable for salads or leftovers in the fridge', '<p>Full product specifications here.</p>', 10.00, NULL, NULL, 50, 0, '[\"980e0872e9dd2c2921cdace3f1631189.webp\"]', '0', '2021-05-28 14:51:36', '2021-05-28 14:51:36'),
(201, 'Fridge mate', NULL, NULL, NULL, NULL, NULL, 43, '1.5 litre storage for foods in the fridge.', '<p>Full product specifications here.</p>', 8.00, NULL, NULL, 50, 0, '[\"b72f9867daeb095d946306d63e80433b.webp\"]', '0', '2021-05-28 14:53:17', '2021-05-28 14:53:17'),
(202, 'Fridge mate', NULL, NULL, NULL, NULL, NULL, 43, '3.1 litre storage for foods in the fridge', '<p>Full product specifications here.</p>', 16.00, NULL, NULL, 50, 0, '[\"3c4bcc5fa3a87f36c88cbc004d21a42d.webp\"]', '0', '2021-05-28 14:54:28', '2021-05-28 14:54:28'),
(203, 'White leather handbag', NULL, NULL, NULL, NULL, NULL, 51, 'Women\'s handbag', '<p><br></p>', 20.00, NULL, NULL, 2, 0, '[\"0c679b619064637e159bb112cd6f50aa.webp\"]', '0', '2021-05-28 19:39:00', '2021-05-28 19:39:00'),
(204, 'Embroidered handbag', NULL, NULL, NULL, NULL, NULL, 51, 'Women\'s handbag', '<p><br></p>', 8.00, NULL, NULL, 2, 0, '[\"ff20418c506d84eee35784c407dc31e2.webp\"]', '0', '2021-05-28 19:40:08', '2021-05-28 19:40:08'),
(205, 'Brown handbag', NULL, NULL, NULL, NULL, NULL, 51, 'Women\'s handbag', '<p><br></p>', 8.00, NULL, NULL, 2, 0, '[\"1f06ec8fc9d7fe3bcfd1b8cd8ae02950.webp\"]', '0', '2021-05-28 19:43:02', '2021-05-28 19:43:02'),
(206, 'Floral theme handbag', NULL, NULL, NULL, NULL, NULL, 51, 'Women\'s handbag', '<p><br></p>', 8.00, NULL, NULL, 2, 0, '[\"1bd0a97a572d564cfaf5b9d880663d60.webp\"]', '0', '2021-05-28 19:43:50', '2021-05-28 19:43:50'),
(207, 'Black handbag', NULL, NULL, NULL, NULL, NULL, 51, 'Women\'s handbag', '<p><br></p>', 8.00, NULL, NULL, 2, 0, '[\"22f5b411033215bd994c924c564a8728.webp\"]', '0', '2021-05-28 19:45:15', '2021-05-28 19:45:15'),
(208, 'White designer handbag', NULL, NULL, NULL, NULL, NULL, 51, 'Women\'s handbag', '<p><br></p>', 8.00, NULL, NULL, 2, 0, '[\"d3c2a1e06697ede3b9b54da6c9704af8.webp\"]', '0', '2021-05-28 19:46:32', '2021-05-28 19:46:32'),
(209, 'Pink floral handbag', NULL, NULL, NULL, NULL, NULL, 51, 'Women\'s handbag', '<p><br></p>', 8.00, NULL, NULL, 2, 0, '[\"f9013bbdf5db191b6cd38226a32ffbcc.webp\"]', '0', '2021-05-28 19:47:24', '2021-05-28 19:47:24'),
(210, 'Black designer handbag', NULL, NULL, NULL, NULL, NULL, 51, 'Women\'s handbag', '<p><br></p>', 8.00, NULL, NULL, 2, 0, '[\"11a879d12ea33dd067c0386e8781ccbe.webp\"]', '0', '2021-05-28 19:48:17', '2021-05-28 19:48:17'),
(211, 'Jeans', NULL, NULL, NULL, NULL, NULL, 9, 'All sizes available from 30-36', '<p>Full product specifications here.</p>', 12.00, NULL, NULL, 40, 0, '[\"8df6746b2e84d3239305850caf3351e1.webp\"]', '0', '2021-05-29 16:03:15', '2021-05-29 16:03:15'),
(212, 'Jeans', NULL, NULL, NULL, NULL, NULL, 9, 'All sizes available from 30-36', '<p>Full product specifications here.</p>', 12.00, NULL, NULL, 45, 0, '[\"1b5eaee09090195e7b05430ea9f04448.webp\"]', '0', '2021-05-29 16:03:53', '2021-05-29 16:03:53'),
(213, 'Jeans', NULL, NULL, NULL, NULL, NULL, 9, 'All sizes available from 30-36', '<p>Full product specifications here.</p>', 12.00, NULL, NULL, 30, 0, '[\"40b91ebf77b61cb3f61967e9129f0a33.webp\"]', '0', '2021-05-29 16:04:35', '2021-05-29 16:04:35'),
(214, 'Ladies Wallets', NULL, NULL, NULL, NULL, NULL, 9, 'Portable ladies wallets all colors in pictures available.', '<p>Full product specifications here.</p>', 3.00, NULL, NULL, 30, 0, '[\"e8c3a7d02873f70fc241f24ccd1f995c.webp\"]', '0', '2021-05-29 16:47:11', '2021-05-29 16:47:11'),
(215, 'Adidas Sneakers', NULL, NULL, NULL, NULL, NULL, 9, '3 leaf adidas sneakers. All sizes and colors available for all sneakers in pictures.', '<p>Full product specifications here.</p>', 12.00, NULL, NULL, 20, 0, '[\"78d3807267795e609213e282938e781e.webp\"]', '0', '2021-05-29 16:48:30', '2021-05-29 16:48:30'),
(216, 'Winter Boots', NULL, NULL, NULL, NULL, NULL, 9, 'All sizes available for ladies winter boots 👢.', '<p>Full product specifications here.</p>', 10.00, NULL, NULL, 20, 0, '[\"33e6f9cc0bc95761e43da66576f72e9f.webp\"]', '0', '2021-05-29 16:49:55', '2021-05-29 16:49:55'),
(217, 'Ladies Tracksuits', NULL, NULL, NULL, NULL, NULL, 9, 'All sizes available for all colors in pictures.', '<p>Full product specifications here.</p>', 14.00, NULL, NULL, 15, 0, '[\"bab84f86b6c9f0659b8b11e5492c5952.webp\"]', '0', '2021-05-29 16:51:01', '2021-05-29 16:51:01'),
(218, 'Kid Winter Shoes', NULL, NULL, NULL, NULL, NULL, 9, 'All baby sizes available.', '<p>Full product specifications here.</p>', 7.00, NULL, NULL, 20, 0, '[\"a891690bae1ddc31c2e58c9c3f7011ff.webp\"]', '0', '2021-05-29 16:52:20', '2021-05-29 16:52:20'),
(219, 'Men Winter Boots 🥾', NULL, NULL, NULL, NULL, NULL, 9, 'All sizes available for men winter boots.', '<p>Full product specifications here.</p>', 10.00, NULL, NULL, 15, 0, '[\"2b13c63196cd4fb4b1f30346ba1dbf1b.webp\"]', '0', '2021-05-29 16:53:41', '2021-05-29 16:53:41'),
(220, 'Girls Shoes', NULL, NULL, NULL, NULL, NULL, 9, 'All sizes and colors available', '<p>Full product specifications here.</p>', 8.00, NULL, NULL, 14, 0, '[\"6b6fe4e69610652f4eb2f899ff8758f2.webp\"]', '0', '2021-05-29 16:55:02', '2021-05-29 16:55:02'),
(221, 'Ladies Shoes', NULL, NULL, NULL, NULL, NULL, 9, 'All sizes and colors available', '<p>Full product specifications here.</p>', 7.00, NULL, NULL, 30, 0, '[\"90fa8e7169cf1ba2dc146c8fa72f21ad.webp\"]', '0', '2021-05-29 16:56:11', '2021-05-29 16:56:11'),
(222, 'Ladies Tight Tracksuits', NULL, NULL, NULL, NULL, NULL, 9, 'One size  fit all', '<p>Full product specifications here.</p>', 4.00, NULL, NULL, 15, 0, '[\"f97423d9b8e15157affa6e80baae27ee.webp\"]', '0', '2021-05-29 16:57:25', '2021-05-29 16:57:25'),
(223, 'Winter Socks', NULL, NULL, NULL, NULL, NULL, 9, 'All sizes available in all colors', '<p>Full product specifications here.</p>', 3.00, NULL, NULL, 50, 0, '[\"c2c9567c9744d897eebd7e8835701e83.webp\"]', '0', '2021-05-29 16:58:51', '2021-05-29 16:58:51'),
(224, 'Full Tracksuit', NULL, NULL, NULL, NULL, NULL, 9, 'Ladies Full tracksuit kit', '<p>Full product specifications here.</p>', 14.00, NULL, NULL, 10, 0, '[\"a238df4daeae3ec77f71594a04368a78.webp\"]', '0', '2021-05-29 16:59:54', '2021-05-29 16:59:54'),
(225, 'Polo neck', NULL, NULL, NULL, NULL, NULL, 9, 'All sizes and colors available for Polo-necks', '<p>Full product specifications here.</p>', 6.00, NULL, NULL, 20, 0, '[\"2ef1cdeaba99886009685f06bb2f4224.webp\"]', '0', '2021-05-29 17:01:26', '2021-05-29 17:01:26'),
(227, 'Rope Sling Bag', NULL, NULL, NULL, NULL, NULL, 37, 'High quality designer Rope Bags', '<p>Full product specifications here.</p>', 15.00, NULL, NULL, 5, 0, '[\"37ba76ba4901eb973b9ffe13dc0599e5.webp\"]', '0', '2021-05-30 17:42:44', '2021-05-31 07:53:59'),
(228, 'Colored Rope Bags', NULL, NULL, NULL, NULL, NULL, 37, 'Beautifully colored Stylish Rope Bags', '<p>Full product specifications here.</p>', 20.00, NULL, NULL, 5, 0, '[\"3ced4708d48d743056fb06a7bf7862c4.webp\"]', '0', '2021-05-30 17:44:29', '2021-05-30 17:44:29'),
(229, 'Polyester Rope makeup 💄 organizer', NULL, NULL, NULL, NULL, NULL, 37, 'Polyester Rope Makeup organized Bag.', '<p>Full product specifications here.</p>', 10.00, NULL, NULL, 5, 0, '[\"37c346a4cc2f909523ec415b2b81be35.webp\"]', '0', '2021-05-30 17:52:22', '2021-05-30 17:52:22'),
(230, 'Fruit Basket', NULL, NULL, NULL, NULL, NULL, 37, 'Fruit Basket', '<p>Full product specifications here.</p>', 10.00, NULL, NULL, 3, 0, '[\"244677ab07bb5c119d9ac51531a801d2.webp\"]', '0', '2021-05-30 17:55:47', '2021-05-30 17:55:47'),
(231, 'Wall Basket Collage. Set of 4', NULL, NULL, NULL, NULL, NULL, 37, 'Set of 4 wall basket collage', '<p>Full product specifications here.</p>', 15.00, NULL, NULL, 10, 0, '[\"e5c22bda9a84efa72f3547709f943779.webp\"]', '0', '2021-05-30 17:57:41', '2021-05-30 17:57:41'),
(232, 'Polyester Rope Coasters and Basket', NULL, NULL, NULL, NULL, NULL, 37, 'Polyester Rope Coasters and Basket', '<p>Full product specifications here.</p>', 25.00, NULL, NULL, 5, 0, '[\"0ffac8843f7d00ac53381dacb1eff2f8.webp\"]', '0', '2021-05-30 17:59:08', '2021-05-30 17:59:08'),
(233, 'Rope Tray and Basket set', NULL, NULL, NULL, NULL, NULL, 37, 'Rope Tray and Basket Set. Beautifully crafted by hands', '<p>Full product specifications here.</p>', 25.00, NULL, NULL, 5, 0, '[\"c077532aa124c8ce01618d2aee260d36.webp\"]', '0', '2021-05-30 18:00:53', '2021-05-30 18:00:53'),
(234, 'Flower Girl Basket', NULL, NULL, NULL, NULL, NULL, 37, 'Flower Girl Events Basket', '<p>Full product specifications here.</p>', 7.00, NULL, NULL, 10, 0, '[\"70715027754e0b454539a608a2068582.webp\"]', '0', '2021-05-30 18:02:48', '2021-05-30 18:50:48'),
(235, 'Large Baby Moses Basket', NULL, NULL, NULL, NULL, NULL, 37, 'Large Baby Moses Basket', '<p>Full product specifications here.</p>', 80.00, NULL, NULL, 2, 0, '[\"5f2ad10ad04982e3bd73aa0d97d01d8e.webp\"]', '0', '2021-05-30 18:10:26', '2021-05-30 18:10:26'),
(236, 'Flower Girl Basket', NULL, NULL, NULL, NULL, NULL, 37, 'Flower Girl Events Basket', '<p>Full product specifications here.</p>', 7.00, NULL, NULL, 10, 0, '[\"8b836283df6a35afeb3662742106d0b0.webp\"]', '0', '2021-05-30 18:11:42', '2021-05-30 18:11:42'),
(237, 'Rope Coaster/Place Mates', NULL, NULL, NULL, NULL, NULL, 37, 'Rope Coaster/Place Mates', '<p>Full product specifications here.</p>', 5.00, NULL, NULL, 3, 0, '[\"a74efa790ad02d4e12c3f2ed2fc227dc.webp\"]', '0', '2021-05-30 18:14:42', '2021-05-30 18:14:42'),
(238, 'Baby Moses Basket', NULL, NULL, NULL, NULL, NULL, 37, 'Large Baby Moses Basket', '<p>Full product specifications here.</p>', 80.00, NULL, NULL, 2, 0, '[\"b0a1c1fbbe98553656da472cf80d9049.webp\"]', '0', '2021-05-30 18:15:48', '2021-05-30 18:15:48'),
(239, 'Rope Basket', NULL, NULL, NULL, NULL, NULL, 37, 'Rope Basket', '<p>Full product specifications here.</p>', 10.00, NULL, NULL, 5, 0, '[\"c7a27f7d2d4f85c65e952b80e66de359.webp\"]', '0', '2021-05-30 18:17:02', '2021-05-30 18:17:02'),
(240, 'Napkin Holders', NULL, NULL, NULL, NULL, NULL, 37, 'Napkin Holders', '<p>Full product specifications here.</p>', 1.00, NULL, NULL, 10, 0, '[\"4f3cab19bf862011fab9892e4731e286.webp\"]', '0', '2021-05-30 18:19:23', '2021-05-30 18:19:23'),
(241, 'Rope Coaster/Place Mates', NULL, NULL, NULL, NULL, NULL, 37, 'Rope Coaster/Place Mates. Platter Sizes', '<p>Full product specifications here.</p>', 8.00, NULL, NULL, 10, 0, '[\"a4f7f8281bb85104352cae371e9802ca.webp\"]', '0', '2021-05-30 18:21:00', '2021-05-30 18:21:00'),
(242, 'Rope Basket Tray/ Organizer', NULL, NULL, NULL, NULL, NULL, 37, 'Rope Basket Tray/ Organizer', '<p>Full product specifications here.</p>', 15.00, NULL, NULL, 5, 0, '[\"5e5892be7b0aa8da61ca09abada66a33.webp\"]', '0', '2021-05-30 18:22:11', '2021-05-30 18:22:11'),
(243, 'Rope Jewelry Basket', NULL, NULL, NULL, NULL, NULL, 37, 'Rope Jewelry Basket', '<p>Full product specifications here.</p>', 5.00, NULL, NULL, 10, 0, '[\"03d627828e93ee7e466cb5696eeb2afe.webp\"]', '0', '2021-05-30 18:23:24', '2021-05-30 18:23:24'),
(244, 'Black Button Storage Container', NULL, NULL, NULL, NULL, NULL, 37, 'Decor Black Button Storage container', '<p>Full product specifications here.</p>', 10.00, NULL, NULL, 5, 0, '[\"00506ce6348e729fe5d7b26ba234dff5.webp\"]', '0', '2021-05-30 18:24:47', '2021-05-30 18:24:47'),
(245, 'Ocean Blue Storage Containers', NULL, NULL, NULL, NULL, NULL, 37, 'Decor Ocean Blue storage containers', '<p>Full product specifications here.</p>', 10.00, NULL, NULL, 4, 0, '[\"4d1a143fb1801119aceea3188979b9ab.webp\"]', '0', '2021-05-30 18:26:41', '2021-05-30 18:26:41'),
(246, 'Rope Tray Medium Size', NULL, NULL, NULL, NULL, NULL, 37, 'Rope Tray medium Size', '<p>Full product specifications here.</p>', 15.00, NULL, NULL, 5, 0, '[\"cf0e8a2b56ee8bc7bc10bd674ae50391.webp\"]', '0', '2021-05-30 18:27:58', '2021-05-30 18:27:58'),
(247, 'Rope Storage Basket', NULL, NULL, NULL, NULL, NULL, 37, 'Rope Storage Basket', '<p>Full product specifications here.</p>', 15.00, NULL, NULL, 5, 0, '[\"4128357ef5b35bd4f71af9ae973579b4.webp\"]', '0', '2021-05-30 18:29:29', '2021-05-30 18:29:29'),
(248, 'Twisted Rope Mirror', NULL, NULL, NULL, NULL, NULL, 37, 'Twisted Rope Mirror', '<p>Full product specifications here.</p>', 25.00, NULL, NULL, 5, 0, '[\"b2780505bc0d5e576af4f03292eb751f.webp\"]', '0', '2021-05-30 18:30:57', '2021-05-30 18:30:57'),
(249, 'Purple Jewel Storage Containers', NULL, NULL, NULL, NULL, NULL, 37, 'Purple Jewel Storage Containers', '<p>Full product specifications here.</p>', 10.00, NULL, NULL, 10, 0, '[\"9f5430ebeacc6dce390e6ebe14ecf95c.webp\"]', '0', '2021-05-30 18:32:22', '2021-05-30 18:32:22'),
(250, 'Gold Bead Jewel Storage Container', NULL, NULL, NULL, NULL, NULL, 37, 'Gold Bead Jewel Storage Container', '<p>Full product specifications here.</p>', 10.00, NULL, NULL, 5, 0, '[\"97af2e7d3effe55be35f5527345e82bf.webp\"]', '0', '2021-05-30 18:34:01', '2021-05-30 18:34:01'),
(251, 'Rustic Rope Mirror', NULL, NULL, NULL, NULL, NULL, 37, 'Rustic Rope Mirror', '<p>Full product specifications here.</p>', 20.00, NULL, NULL, 2, 0, '[\"c54b3b471a95a16407f2cb0f7b7d0e68.webp\"]', '0', '2021-05-30 18:35:22', '2021-05-30 18:35:22'),
(252, 'Gold and Black Center piece', NULL, NULL, NULL, NULL, NULL, 37, 'Gold and black center piece', '<p>Full product specifications here.</p>', 15.00, NULL, '5', 3, 0, '[\"d0b1a4969b1852c786467be82ee66a2e.webp\"]', '0', '2021-05-30 18:36:54', '2021-06-06 11:42:06'),
(253, 'Emerald Green Bottle Center Piece', NULL, NULL, NULL, NULL, NULL, 37, 'Emerald Green Bottle Center Piece', '<p>Full product specifications here.</p>', 15.00, NULL, '5', 2, 0, '[\"3bddcb664cc5d39ed7d5d7433cc6d8bb.webp\"]', '0', '2021-05-30 18:38:47', '2021-05-30 21:47:16'),
(254, 'Bottle and Vase Center piece', NULL, NULL, NULL, NULL, NULL, 37, 'Decor Bottle and Vase Center piece', '<p>Full product specifications here.</p>', 15.00, NULL, NULL, 2, 0, '[\"3f711a508a44a128f7d2305429224923.webp\"]', '0', '2021-05-30 18:40:11', '2021-05-30 18:40:11'),
(255, 'Plant Pot Hanger', NULL, NULL, NULL, NULL, NULL, 37, 'Plant Pot Hanger', '<p>Full product specifications here.</p>', 10.00, NULL, NULL, 5, 0, '[\"00b49f4f915d17849ca6527cc21d0593.webp\"]', '0', '2021-05-30 18:41:29', '2021-05-30 18:41:29'),
(256, 'Reversible Mask and Hat set', NULL, NULL, NULL, NULL, NULL, 37, 'Reversible mask and hat', '<p>Full product specifications here.</p>', 10.00, NULL, NULL, 5, 0, '[\"80ccfefc48601c25ea7cb3b4ef4728e1.webp\"]', '0', '2021-05-30 18:42:43', '2021-05-30 18:42:43'),
(257, 'Hats', NULL, NULL, NULL, NULL, NULL, 37, 'Woolen Quality Hats', '<p>Full product specifications here.</p>', 5.00, NULL, NULL, 10, 0, '[\"f655ed72390d3bbf1ee0904cf3efee90.webp\"]', '0', '2021-05-30 18:43:58', '2021-05-30 18:43:58'),
(258, 'Bow Hair Bands', NULL, NULL, NULL, NULL, NULL, 37, 'Bow hair bands', '<p>Full product specifications here.</p>', 1.00, NULL, NULL, 20, 0, '[\"b00b55316416ee2e58b150ea2c3dc7d3.webp\"]', '0', '2021-05-30 18:45:19', '2021-05-30 18:45:19'),
(259, 'Baby Diaper Cover', NULL, NULL, NULL, NULL, NULL, 37, 'Baby Diaper cover. Quality woolen material', '<p>Full product specifications here.</p>', 5.00, NULL, NULL, 25, 0, '[\"e3bfe04f6a0b7257b659d8f8b0629880.webp\"]', '0', '2021-05-30 18:47:25', '2021-05-30 18:47:25'),
(260, 'Headband and Booties Set', NULL, NULL, NULL, NULL, NULL, 37, 'Headband and Booties Set', '<p>Full product specifications here.</p>', 10.00, NULL, NULL, 12, 0, '[\"11fc75c1e4f4903a51271c8b18f5c91b.webp\"]', '0', '2021-05-30 18:48:26', '2021-05-30 18:48:26'),
(261, 'Cotton Rope Bag', NULL, NULL, NULL, NULL, NULL, 37, 'Handmade Fashion Rope Bag', '<p>Full product specifications here.</p>', 20.00, NULL, NULL, 5, 0, '[\"6e8a24de66359e792901586ab5480240.webp\"]', '0', '2021-05-31 07:57:15', '2021-05-31 07:57:15'),
(262, 'Polonecks', NULL, NULL, NULL, NULL, NULL, 53, 'Warm poloneck jerseys suitable for the winter time and any night time events. Goes well with formal and smart casual.', '<p>Full product specifications here.</p>', 8.00, NULL, NULL, 20, 0, '[\"aa90ff658574906b959522811c44dc6b.webp\"]', '0', '2021-05-31 11:10:49', '2021-05-31 11:10:49'),
(263, '3D house shoes', NULL, NULL, NULL, NULL, NULL, 53, 'Warm indoor shoes with comfy cotton fitting on the inside. Suitable for winter', '<p>Full product specifications here.</p>', 4.00, NULL, NULL, 20, 0, '[\"b8f9b6ed1841925300ef85a8dbbf6395.webp\"]', '0', '2021-05-31 11:15:52', '2021-05-31 11:15:52'),
(264, 'Hot Water Bottles', NULL, NULL, NULL, NULL, NULL, 53, 'Rubber bottles with cotton sleeves to keep warm in the winter time. Fill with hot water. Do not use boiling water.', '<p>Full product specifications here.</p>', 4.00, NULL, NULL, 20, 0, '[\"176be1ae480fa8d3abac68588e376a70.webp\"]', '0', '2021-05-31 11:20:49', '2021-05-31 11:20:49'),
(265, 'Kids morning shoes', NULL, NULL, NULL, NULL, NULL, 53, 'Indoor morning shoes for your toddlers to keep warm.', '<p>Full product specifications here.</p>', 3.00, NULL, NULL, 20, 0, '[\"4d10c2dd101e9233a4a1e273d527dcc1.webp\"]', '0', '2021-05-31 11:22:47', '2021-05-31 11:22:47'),
(266, 'Adidas Socks', NULL, NULL, NULL, NULL, NULL, 53, 'All your Adidas socks sold in 3 pairs.', '<p>Full product specifications here.</p>', 5.00, NULL, NULL, 30, 0, '[\"b46dbe173c9cb824746e42c6ebdedde0.webp\"]', '0', '2021-05-31 11:24:40', '2021-05-31 11:24:40'),
(267, 'Fanny Packs', NULL, NULL, NULL, NULL, NULL, 53, 'All your fanny packs available in multiple colors', '<p>Full product specifications here.</p>', 6.00, NULL, NULL, 25, 0, '[\"346ef585db7683ba29ef15ba80383cfb.webp\"]', '0', '2021-05-31 11:27:21', '2021-05-31 11:27:21'),
(268, 'Signature Line Square 1.2Litre', NULL, NULL, NULL, NULL, NULL, 43, 'Lunchbox style storage for cupboard storage of ingredients you use often.', '<p>Full product specifications here.</p>', 26.00, NULL, NULL, 50, 1, '[\"c6611733c021fc115eb2eb3be23bc300.webp\"]', '0', '2021-06-01 10:34:01', '2021-06-01 10:34:01'),
(269, 'Signature Line Square 2.6Litre', NULL, NULL, NULL, NULL, NULL, 43, 'Lunchbox style storage for cupboard storage of ingredients you use often.', '<p>Full product specifications here.</p>', 33.00, NULL, NULL, 50, 1, '[\"f89e3350fd28c70553f923c7ab450117.webp\"]', '0', '2021-06-01 10:35:27', '2021-06-01 10:35:27'),
(271, 'Military Cargo pants', NULL, NULL, NULL, NULL, NULL, 27, 'For Women available in various sizes', '<p><br></p>', 15.00, NULL, NULL, 2, 1, '[\"e60fed04e192441155595adee2a364ef.webp\"]', '0', '2021-06-01 17:18:39', '2021-06-01 17:18:39'),
(272, 'Women\'s block heels', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various sizes', '<p><br></p>', 15.00, NULL, NULL, 2, 1, '[\"d299f63c8524b9aab7478e7534ab984b.webp\"]', '0', '2021-06-01 17:21:08', '2021-06-01 17:21:08'),
(273, 'Women\'s Boots', NULL, NULL, NULL, NULL, NULL, 27, 'All colours and sizes from 3-8 available', '<p><br></p>', 18.00, NULL, NULL, 6, 1, '[\"bfb979b4069a5308c50876801e10007e.webp\"]', '0', '2021-06-01 17:25:19', '2021-06-01 17:25:19'),
(274, 'Nails', NULL, NULL, NULL, NULL, NULL, 27, 'All colours (plain) 100 pieces', '<p><br></p>', 3.00, NULL, NULL, 10, 1, '[\"e9e29e1609acfc38fd2957e5852fd707.webp\"]', '0', '2021-06-01 17:27:17', '2021-06-01 17:27:17'),
(275, 'off-white sneakers', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various sizes and colours', '<p>Available on order<br></p>', 28.00, NULL, NULL, 10, 1, '[\"1f38bb5e50ad89a9d2d0c9be3fb9737b.webp\"]', '0', '2021-06-01 17:29:11', '2021-06-01 17:29:11'),
(276, 'Ice watches', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various colours', '<p><br></p>', 12.00, NULL, NULL, 2, 1, '[\"5203db46c98f6b43cab9ed0c1d4bfba9.webp\"]', '0', '2021-06-01 17:31:06', '2021-06-01 17:31:06'),
(277, 'Cargo pants', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various colors', '<p><br></p>', 12.00, NULL, NULL, 4, 1, '[\"8a27bbe86313ea42790faedcbdd85b9c.webp\"]', '0', '2021-06-01 17:32:19', '2021-06-01 17:32:19'),
(278, 'High heels', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various sizes and colours', '<p>Take 7 days to deliver<br></p>', 15.00, NULL, NULL, 2, 1, '[\"540314c435267df5d7193079a3d7d47b.webp\"]', '0', '2021-06-01 17:34:15', '2021-06-01 17:34:15'),
(279, 'Glossy stiletto heels', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various sizes and colours', '<p>7days to deliver<br></p>', 15.00, NULL, NULL, 2, 1, '[\"b289fe3d9c94f31efec8058547ef3a72.webp\"]', '0', '2021-06-01 17:42:11', '2021-06-01 17:42:11'),
(280, 'White designer handbags', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various colours', '<p>Available on order<br></p>', 6.00, NULL, NULL, 5, 1, '[\"aab1595ff79ceead834fee5703062309.webp\"]', '0', '2021-06-01 17:44:06', '2021-06-01 17:44:06'),
(281, 'White designer handbags', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various colours', '<p>available on order<br></p>', 6.00, NULL, NULL, 5, 1, '[\"add9ab30c7b57a765f59e59677bea48d.webp\"]', '0', '2021-06-01 17:45:15', '2021-06-01 17:45:15'),
(282, 'White designer handbag', NULL, NULL, NULL, NULL, NULL, 27, 'Available on order', '<p><br></p>', 6.00, NULL, NULL, 5, 1, '[\"c5e280bf0495574e2ce47c797ffa3af4.webp\"]', '0', '2021-06-01 17:46:21', '2021-06-01 17:46:21'),
(283, 'Women\'s handbags', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various colours', '<p><br></p>', 6.00, NULL, NULL, 5, 1, '[\"135b69a4cf33ed4d67dfb20c6945c6af.webp\"]', '0', '2021-06-01 17:48:29', '2021-06-24 00:27:38'),
(284, 'Women\'s handbags', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various colours', '<p><br></p>', 6.00, NULL, NULL, 5, 1, '[\"2366fba00f61572fb1cef41a6a78c898.webp\"]', '0', '2021-06-01 17:49:53', '2021-06-01 17:49:53'),
(285, 'Lip bags', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various colours', '<p><br></p>', 8.00, NULL, NULL, 5, 1, '[\"78812a1eb00e0e5ec230541e9d13583f.webp\"]', '0', '2021-06-01 17:51:32', '2021-06-01 17:51:32'),
(286, 'Transparent Floral bags', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various colours', '<p><br></p>', 8.00, NULL, NULL, 5, 1, '[\"4d459487299b30a23764b4466599ecde.webp\"]', '0', '2021-06-01 17:52:52', '2021-06-01 17:52:52'),
(287, 'Ribbon bags', NULL, NULL, NULL, NULL, NULL, 27, 'Available in black, turqouise, brown', '<p><br></p>', 18.00, NULL, NULL, 5, 1, '[\"e25d4c52867f430ad5dc9e3838d493d1.webp\"]', '0', '2021-06-01 17:54:23', '2021-06-01 17:54:23'),
(288, 'Airforce 1', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various sizes', '<p><br></p>', 28.00, NULL, NULL, 5, 1, '[\"580da4b4af90d133dd6e86fcc81ed455.webp\"]', '0', '2021-06-01 17:55:24', '2021-06-01 17:55:24'),
(289, 'Airforce 1', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various sizes', '<p><br></p>', 28.00, NULL, NULL, 5, 1, '[\"b89ead29f551e86d9846b4a0bf717beb.webp\"]', '0', '2021-06-01 17:56:31', '2021-06-01 17:56:31'),
(290, 'Airforce 1', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various sizes', '<p><br></p>', 28.00, NULL, NULL, 5, 1, '[\"ec31ba2b5e79a95b1d2d595b76610150.webp\"]', '0', '2021-06-01 17:57:30', '2021-06-01 17:57:30'),
(291, 'Airforce 1', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various sizes', '<p><br></p>', 28.00, NULL, NULL, 5, 1, '[\"64aec9e72f314ad037412b5454b9717c.webp\"]', '0', '2021-06-01 17:58:15', '2021-06-01 17:58:15'),
(292, 'Sneakers', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various sizes', '<p><br></p>', 25.00, NULL, NULL, 5, 1, '[\"e4d30f0e36f59bf60da2ec73ef5d2e62.webp\"]', '0', '2021-06-01 18:00:59', '2021-06-01 18:00:59'),
(293, 'McQueen sneakers', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various sizes', '<p><br></p>', 25.00, NULL, NULL, 5, 1, '[\"3f63895c6a86e29425197cc0e5d6a04a.webp\"]', '0', '2021-06-01 18:02:05', '2021-06-01 18:02:05'),
(294, 'Men\'s formal shoes', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various sizes', '<p>Available on order in 5-7 days<br></p>', 26.00, NULL, NULL, 2, 1, '[\"e40c18b21a066ec77e5de63e71de748d.webp\"]', '0', '2021-06-01 18:03:34', '2021-06-01 18:03:34'),
(295, 'Men\'s formal shoes', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various sizes', '<p>Available on order in 5-7 days<br></p>', 26.00, NULL, '4', 2, 1, '[\"19095ea58fffbbbc23efda1b6b42b502.webp\"]', '0', '2021-06-01 18:04:41', '2021-06-03 16:04:45'),
(296, 'Men\'s formal shoes', NULL, NULL, NULL, NULL, NULL, 27, 'Available in various sizes', '<p>Available on order in 5-7 days</p>', 26.00, NULL, NULL, 2, 1, '[\"76f02baa3c2be366fabd7f30fb792c91.webp\"]', '0', '2021-06-01 18:05:16', '2021-06-01 18:05:16'),
(297, 'Tops', NULL, NULL, NULL, NULL, NULL, 27, 'Available in black , maroon and yellow', '<p>One size fits all<br></p>', 7.00, NULL, NULL, 2, 1, '[\"89b1ac7cc8ac1a8f6632b21ad40406ac.webp\"]', '0', '2021-06-01 18:07:08', '2021-06-01 18:07:08'),
(298, 'Glow in the dark watches', NULL, NULL, NULL, NULL, NULL, 27, 'Available in black or white', '<p><br></p>', 6.00, NULL, NULL, 2, 1, '[\"271be67d3e3f56847b40ac6df988e5fa.webp\"]', '0', '2021-06-01 18:08:21', '2021-06-01 18:08:21'),
(299, 'POLO-NECKS', NULL, NULL, NULL, NULL, NULL, 9, 'ALL SIZES AND COLORS IN PICTURE AVAILABLE', '<p>Full product specifications here.</p>', 6.00, NULL, NULL, 10, 1, '[\"c84c30c4578dffc9ecd9c0292a44ba95.webp\"]', '0', '2021-06-02 05:33:59', '2021-06-02 05:33:59'),
(300, 'LADIES JEANS', NULL, NULL, NULL, NULL, NULL, 9, 'ALL SIZES AND COLORS IN PICTURE AVAILABLE. HIGH QUALITY LADIES JEANS.', '<p>Full product specifications here.</p>', 12.00, NULL, NULL, 40, 1, '[\"40291f4062af264ad8ca3a1e7bdce02d.webp\"]', '0', '2021-06-02 06:28:35', '2021-06-02 06:28:35'),
(301, 'Colored Rope Bag Blue', NULL, NULL, NULL, NULL, NULL, 37, 'Handmade Fashion Rope Bag', '<p>Full product specifications here.</p>', 20.00, NULL, NULL, 10, 1, '[\"8384249732bff7adc4a870755d4bbadf.webp\",\"35933383f1da314b1d18d5d9217b4d8d.webp\"]', '0', '2021-06-03 11:25:35', '2021-06-03 11:25:35'),
(302, 'Colored Rope Bag Pink', NULL, NULL, NULL, NULL, NULL, 37, 'Handmade Fashion Rope Bag', '<p>Full product specifications here.</p>', 20.00, NULL, NULL, 10, 1, '[\"a0a613d481064062b18295b86856f024.webp\",\"37bbea28ed9cd42c57c314193a24cc30.webp\"]', '0', '2021-06-03 11:29:11', '2021-06-03 11:29:11'),
(303, 'Oh So Heavenly Body Spritzer 200 ml', NULL, NULL, NULL, NULL, NULL, 9, 'Body Spritzer with a nice fragrance . Oh so heavenly products!!!', '<p>Full product specifications here.</p>', 4.00, NULL, NULL, 100, 1, '[\"3199ddf3b4a378f6d85abe761476c4f4.webp\"]', 'null', '2021-06-06 10:00:33', '2021-06-06 10:00:33'),
(304, 'Ladies Sneakers', NULL, NULL, NULL, NULL, NULL, 9, 'Good quality and durable black sneakers.', '<p>Full product specifications here.</p>', 12.00, NULL, NULL, 25, 1, '[\"69c098600d371f8943389df1d8142c43.webp\"]', 'null', '2021-06-06 10:01:41', '2021-06-06 10:01:41'),
(305, 'Ladies Heels', NULL, NULL, NULL, NULL, NULL, 9, 'All colors in picture available for all sizes.', '<p>Full product specifications here.</p>', 12.00, NULL, NULL, 50, 1, '[\"849d8540043ceba7d4fa80ba9679ec44.webp\"]', 'null', '2021-06-06 10:03:28', '2021-06-06 10:03:28'),
(306, 'Fan', NULL, NULL, NULL, NULL, NULL, 56, 'Breeze', '<p>Full product specifications here.</p>', 200.00, NULL, '4', 17, 1, '[\"0139324a970c1ca96b20a9a814a5f3ea.webp\"]', '[\"56d3992fa3c5cf5e5054dfa9486f3138.webp\"]', '2021-06-06 10:18:42', '2022-04-18 19:09:02'),
(307, 'Winter Boots', NULL, NULL, NULL, NULL, NULL, 9, 'Ladies winter boots . Good quality and all sizes and colors in pictures are available.', '<p>Full product specifications here.</p>', 20.00, NULL, NULL, 50, 1, '[\"e99a4a7344d1c538a10e49edb520ff77.webp\"]', 'null', '2021-06-06 18:49:18', '2021-06-06 18:49:18'),
(308, 'Jerseys', NULL, NULL, NULL, NULL, NULL, 9, 'Men Jerseys. All sizes available for all colors in pictures.', '<p>Full product specifications here.</p>', 12.00, NULL, NULL, 40, 1, '[\"bd3891a5509414bd0e220a3251a32c8f.webp\"]', 'null', '2021-06-06 18:50:57', '2021-06-06 18:50:57'),
(309, 'KidsJacket', NULL, NULL, NULL, NULL, NULL, 9, 'Warm winter Kids Jackets . Sizes available for all kids.', '<p>Full product specifications here.</p>', 12.00, NULL, NULL, 10, 1, '[\"be819340ee5a78afea8d5fc30041d4cb.webp\"]', 'null', '2021-06-06 18:51:45', '2021-06-06 18:51:45'),
(310, 'Kid’s Bunny Shoes', NULL, NULL, NULL, NULL, NULL, 9, 'Kids Bunny shoes available in all sizes for all colors in pictures', '<p>Full product specifications here.</p>', 6.00, NULL, NULL, 20, 1, '[\"5d562316c2d7c928f205acffc0b599b7.webp\"]', 'null', '2021-06-06 18:54:03', '2021-06-06 18:54:03'),
(311, 'Kids Tracksuit', NULL, NULL, NULL, NULL, NULL, 9, 'Full kit. All sizes mentioned in picture are available.', '<p>Full product specifications here.</p>', 12.00, NULL, NULL, 20, 1, '[\"9d52e54aba7fcc280a5d4b158fd9a787.webp\"]', 'null', '2021-06-06 19:01:02', '2021-06-06 19:01:02'),
(312, 'Watch +bracelet', NULL, NULL, NULL, NULL, NULL, 27, 'All colours available', '<p>Full product specifications here.</p>', 7.00, NULL, NULL, 100, 1, '[\"e336c393fa1ba2d7901af4367c653ad6.webp\"]', 'null', '2021-06-24 00:15:58', '2021-06-24 00:15:58'),
(313, 'Poloneck dresses', NULL, NULL, NULL, NULL, NULL, 27, 'All colours one size fits all', '<p>Full product specifications here.</p>', 12.00, NULL, NULL, 50, 1, '[\"72ef103f422d89079b2593e8f0238067.webp\"]', '[\"56cc7afc630c41c1efcb120fff34db7c.webp\"]', '2021-06-24 00:22:25', '2021-06-24 00:22:25'),
(314, 'Curtains', NULL, NULL, NULL, NULL, NULL, 27, '1.4x2.6m', '<p>Full product specifications here.</p>', 20.00, NULL, NULL, 30, 1, '[\"b4ab038d6a021b3ee80bb54da42283e2.webp\"]', '[\"ef49578c46427890274cd0d52e7abf4a.webp\"]', '2021-06-24 00:25:39', '2021-06-24 00:25:39'),
(315, 'Hoodie Jackets', NULL, NULL, NULL, NULL, NULL, 9, 'Warm winter quality hoodie. All colors in picture available and all sizes', '<p>Full product specifications here.</p>', 8.00, NULL, NULL, 20, 1, '[\"5ebf1c598d7de57569f5b98256c0ae6b.webp\"]', 'null', '2021-06-25 06:11:19', '2021-06-25 06:11:19'),
(316, 'Ladies Shoes', NULL, NULL, NULL, NULL, NULL, 9, 'All sizes available in Black', '<p>Full product specifications here.</p>', 12.00, NULL, NULL, 10, 1, '[\"812a53650cca72cfabde581fb16059df.webp\"]', 'null', '2021-06-25 06:14:09', '2021-06-25 06:14:09'),
(317, 'Ladies Full Tracksuit', NULL, NULL, NULL, NULL, NULL, 9, 'All sizes available', '<p>Full product specifications here.</p>', 15.00, NULL, NULL, 20, 1, '[\"51cecd9c341382fe6aa038de67e2986e.webp\"]', 'null', '2021-06-25 06:14:49', '2021-06-25 06:14:49'),
(318, 'Satches', NULL, NULL, NULL, NULL, NULL, 9, 'Available in black,maroon, grey and white', '<p>Full product specifications here.</p>', 10.00, NULL, NULL, 50, 1, '[\"8227fc4bf994f2bacbbe1707035ce935.webp\"]', 'null', '2021-06-25 06:16:09', '2021-06-25 06:16:09'),
(319, 'Kids Full Tracksuit', NULL, NULL, NULL, NULL, NULL, 9, 'Warm cotton tracksuits and all sizes available for colors in picture.', '<p>Full product specifications here.</p>', 12.00, NULL, NULL, 20, 1, '[\"9228d3a615b3d6c2180720d0619902f7.webp\"]', 'null', '2021-06-25 06:17:42', '2021-06-25 06:17:42'),
(320, 'Fluffy Floor Carpet Rugs', NULL, NULL, NULL, NULL, NULL, 9, 'Good quality floor rugs. All colors in pictures are available', '<p>Full product specifications here.</p>', 18.00, NULL, NULL, 50, 1, '[\"5abd2007af12f315aeb4feb6fafd51fe.webp\"]', 'null', '2021-06-25 06:22:48', '2021-06-25 06:22:48'),
(321, 'Ladies Heels', NULL, NULL, NULL, NULL, NULL, 9, 'Very nice and affordable ,comfortable ladies shoes.', '<p>Full product specifications here.</p>', 12.00, NULL, NULL, 20, 1, '[\"41355495de62534149c5ff3884e7f3ef.webp\"]', 'null', '2021-06-25 06:24:09', '2021-06-25 06:24:09'),
(322, 'Dinner dresses', NULL, NULL, NULL, NULL, NULL, 46, 'Hiring', '<p>Full product specifications here.</p>', 50.00, NULL, NULL, 1, 1, '[\"abd982ffde82aa282ea147d9fd15d46c.webp\"]', '[\"98a0f670aa5e84d106ac9b3345b36187.webp\"]', '2021-06-25 10:01:08', '2021-06-25 10:01:08'),
(323, 'Gown', NULL, NULL, NULL, NULL, NULL, 46, 'Hiring', '<p>Full product specifications here.</p>', 150.00, NULL, NULL, 1, 1, '[\"bd5a6b48f76d65bb2c8356af49a9d1e3.webp\"]', 'null', '2021-06-25 10:03:20', '2021-06-25 10:03:20'),
(324, 'Grooms suit', NULL, NULL, NULL, NULL, NULL, 46, 'For sell', '<p>Full product specifications here.</p>', 150.00, NULL, NULL, 10, 1, '[\"fe9a38cab5d826d22cdca210d7439a1a.webp\"]', 'null', '2021-06-25 10:13:03', '2021-06-25 10:13:03'),
(325, 'Gown', NULL, NULL, NULL, NULL, NULL, 46, 'For sell', '<p>Full product specifications here.</p>', 600.00, NULL, NULL, 1, 1, '[\"d11ae8380e923e0915eebbec5f64b310.webp\"]', 'null', '2021-06-25 10:55:33', '2021-06-25 10:55:33'),
(326, 'Second dress for bride', NULL, NULL, NULL, NULL, NULL, 46, 'We sell and hire out', '<p>Full product specifications here.</p>', 50.00, NULL, NULL, 1, 1, '[\"3d364def0949ee6e6ecdfbc390693292.webp\"]', 'null', '2021-06-26 08:51:56', '2021-06-26 08:51:56'),
(327, 'Second dress for bride', NULL, NULL, NULL, NULL, NULL, 46, 'We sell and hire out', '<p>Full product specifications here.</p>', 50.00, NULL, NULL, 1, 0, '[\"a6e9e06b893d9ef762f7d70f0cf3bb09.webp\"]', 'null', '2021-06-26 08:51:59', '2021-06-26 08:53:34'),
(328, 'Men\'s highcut boots', NULL, NULL, NULL, NULL, NULL, 36, 'Military boot, comfortable to wear and stylish', '<p>Full product specifications here.</p>', 30.00, NULL, NULL, 5, 1, '[\"20462d32ac61f8ca374b2a31a9889ab4.webp\"]', '[\"1389f4a3740df5055c67fe0b9c7c1adb.webp\"]', '2021-08-10 10:00:50', '2021-08-10 10:00:50'),
(329, 'Victoria\'s secrets', NULL, NULL, NULL, NULL, NULL, 36, 'Body mists and lotions', 'Set consist of a body mist and lotion', 15.00, NULL, NULL, 5, 1, '[\"23f678bb0fffc702ed21f7edc75efbb4.webp\"]', 'null', '2021-08-10 10:04:03', '2021-08-10 10:04:03'),
(337, 'Zibah Creations Belts', NULL, NULL, NULL, NULL, NULL, 58, 'Handwoven, unisex belts that come in solid or mixed colours', '<p>Width 3cm, length 1.25m (can be customised)&nbsp;</p>', 10.00, NULL, NULL, 10, 1, '[\"7f2257dba92e3343ce0f55ef55525244.webp\"]', '[\"8da4902d3dc69ced84f644baab53c6a7.webp\",\"90d08b25a2edc158873b6994c95a4104.webp\"]', '2021-09-08 18:08:16', '2021-09-08 18:08:16'),
(338, 'Zibah Creations Sling and Laptop Bags', NULL, NULL, NULL, NULL, NULL, 58, 'Woven sling and laptop bags that are handmade to an individual\'s taste. Come in solid or mixed colours and a touch of leather and personalisation can be added at a minimal extra cost. The bags are unisex and can be suitable for a casual or office look', 'Length * Width  * Height  of 40cm * 5cm * 30cm.  Come with a unique leather design to suit an individual\'s taste.  Sling belt is 75cm long and adjustable into a silver or brass buckle.  Suitable for office or casual wear.  Can be used as a luggage bag for the short 2 to 3 days trip as they are quite spacious', 70.00, NULL, NULL, 1, 1, '[\"4795f73f093d142cea4ee344501d2f7e.webp\"]', '[\"d89be708e2834b5075a066db3e1d2c3b.webp\",\"32220b8b4c1fecc4bdeea68b8bbe5b23.webp\"]', '2021-09-08 18:13:19', '2021-09-08 18:39:29'),
(339, 'Zibah Creations Sling Bags', NULL, NULL, NULL, NULL, NULL, 58, 'Woven sling bags that are handmade to an individual\'s taste. Come in solid or mixed colours and a touch of leather and personalisation can be added at a minimal extra cost. The bags are unisex and can be suitable for a casual or office look', '<p>Length * Width * Height specifications are 30*5*30 (cm).  Sling belt length is 75cm  adjustable into a silver or brass buckle.  </p>', 45.00, NULL, NULL, 1, 1, '[\"349c477bdff6cd12f9b34170237315ef.webp\"]', 'null', '2021-09-08 18:23:07', '2021-09-08 18:24:15'),
(340, 'Zibah Creations Yarn Bottles', NULL, NULL, NULL, NULL, NULL, 58, 'Decorative yarn bottles for indoor and outdoor uses.', 'Recycled bottles decorated by yarn.&nbsp; Comes in a set of three bottles', 15.00, NULL, NULL, 10, 1, '[\"8bd7e1edb357161624cd09fa5b909e1a.webp\"]', '[\"b3c9fab465775eb68a704036960087dd.webp\",\"a49ed9b5277b31f79629218e032698c8.webp\",\"42fbc887e2a6c3e06b1276003ac6c55f.webp\"]', '2021-09-08 18:33:10', '2021-09-08 18:33:10'),
(341, 'Zibah Creations Ladies Bags', NULL, NULL, NULL, NULL, NULL, 58, 'Woven ladies that are handmade to an individual\'s taste.', '40*5* 30 cm bag that comes with a removable schiffon.&nbsp; Leather bottom and leather handles', 50.00, NULL, NULL, 1, 1, '[\"bcef4cc1480bfe35fa903864799fcde1.webp\"]', '[\"5bb2cb003e96d440f8f31055f5a02bf9.webp\"]', '2021-09-08 18:38:14', '2021-09-08 18:38:14'),
(342, 'Zibah Creations Sling and Laptop Bags', NULL, NULL, NULL, NULL, NULL, 58, 'Woven sling and laptop bags that are handmade to an individual\'s taste. Come in solid or mixed colours and a touch of leather and personalisation can be added at a minimal extra cost. The bags are unisex and can be suitable for a casual or office look', '<p>40*5*30cm in length*widthe*height with a 75cm adjustable sling handle attached to a brass or silver buckle</p>', 70.00, NULL, NULL, 1, 1, '[\"1f453e2c28334d451cd7e77e94835343.webp\"]', '[\"7bb82890a17d1f95ca80503409d407bb.webp\",\"acc304e7ca561dd8f5d71da10a9ff3be.webp\",\"5a71369ad84eb69e676d8bbfc5eee2c8.webp\"]', '2021-09-09 04:39:21', '2021-09-09 04:39:21'),
(343, 'Zibah Creations Sling and Laptop Bags', NULL, NULL, NULL, NULL, NULL, 58, 'Woven sling bags that are handmade to an individual\'s taste. Come in solid or mixed colours and a touch of leather and personalisation can be added at a minimal extra cost. The bags are unisex and can be suitable for a casual or office look', '<p>L*W*H is 30*5*30 cm.&nbsp; Blue box sling bag with a leather touch, mix of blue and grey.</p>', 50.00, NULL, NULL, 1, 1, '[\"a60ecbf83caf21b513e946f6c31d2c82.webp\"]', 'null', '2021-09-09 18:15:07', '2021-09-09 18:15:07'),
(344, 'Zibah Creations Ladies Bags', NULL, NULL, NULL, NULL, NULL, 58, 'Woven ladies bag with a beaded touch for that african touch.  Suitable for any occassion', '<p>L*W*H is 40*5*30 cm</p>', 50.00, NULL, NULL, 3, 1, '[\"f9fec2ef4ac2698e9365221e57e6814c.webp\"]', '[\"adc2ae5528b036f6eb9f850757b7e636.webp\"]', '2021-09-09 18:26:16', '2021-09-09 18:30:37'),
(345, 'Zibah Creations Ladies Bags', NULL, NULL, NULL, NULL, NULL, 58, 'Woven ladies bag that can be used to carry a laptop as well.', '<p>L*W*H is 50*6*30cm.&nbsp;&nbsp;</p>', 60.00, NULL, NULL, 1, 1, '[\"55b45d64cdd54c0cb8972b6a7874e1f7.webp\"]', 'null', '2021-09-09 18:33:41', '2021-09-09 18:33:41'),
(346, 'Zibah Creations Ladies Bags', NULL, NULL, NULL, NULL, NULL, 58, 'Mixed colors woven ladies bags with leather handles for style and strength.  Can carry laptop among other accessories', '<p>L*W*H is 50*6*30</p>', 60.00, NULL, NULL, 1, 1, '[\"6e44741bbd0cc2ecfc4409fc9c0eefaa.webp\"]', 'null', '2021-09-09 18:37:07', '2021-09-09 18:37:07'),
(347, 'Zibah Creations Ladies Bags', NULL, NULL, NULL, NULL, NULL, 58, 'Purple and grey mix ladies bag', 'L*W*H is 40*5*25', 60.00, NULL, NULL, 1, 1, '[\"e33757cf906d0f18325fa17ffa50d432.webp\"]', 'null', '2021-09-09 18:39:26', '2021-09-09 18:39:26'),
(348, 'Zibah Creations Ladies Bags', NULL, NULL, NULL, NULL, NULL, 58, 'Blue sling bag with a diamond design close to the bottom', '<p>L*W*H is 35*5*25cm</p>', 40.00, NULL, NULL, 1, 1, '[\"f470358f4cb761fd04d62be6aaba7489.webp\"]', 'null', '2021-09-09 18:47:11', '2021-09-09 18:47:11'),
(349, 'Zibah Creations Yarn Bottles', NULL, NULL, NULL, NULL, NULL, 58, 'Decorative yarn bottles for indoor and outdoor uses.', '<p>Yarn bottles made from recycled bottles</p>', 5.00, NULL, NULL, 7, 1, '[\"42d184df73b6ddbe21e8c19dbbd1e53d.webp\"]', 'null', '2021-09-09 18:52:50', '2021-09-09 18:52:50'),
(350, 'Zibah Creations Yarn Bottles', NULL, NULL, NULL, NULL, NULL, 58, 'Decorative yarn bottles for indoor and outdoor uses.', '<p>Yarn bottles made from recycled bottles</p>', 5.00, NULL, NULL, 7, 1, '[\"639f6bcec446c73ffe9853773cc2faf4.webp\"]', 'null', '2021-09-09 18:52:53', '2021-09-09 18:52:53'),
(351, 'Zibah Creations Belts', NULL, NULL, NULL, NULL, NULL, 58, 'Handwoven, unisex belts that come in solid or mixed colours', '<p>Width of 5cm and length of 1.25m.&nbsp; Come with a silver or brass buckle</p>', 15.00, NULL, NULL, 7, 1, '[\"eec52f4188c585732d9273eab4fb9b94.webp\"]', '[\"ed03126496b89bd27cb3bb65e3754aed.webp\",\"f098b636de9b2c59309fcca37ae5965f.webp\",\"abeb372b389ef5ab3a985a3503a7c3cc.webp\"]', '2021-09-09 18:58:02', '2021-09-09 18:58:02'),
(352, 'Zibah Creations Pot Hangers', NULL, NULL, NULL, NULL, NULL, 58, 'Handcrafted plant pot hangers that come in different colours.  Beaded for an ethnic feel', '<p>3m long plant pot hangers/holders for your indoor or outdoor setting.&nbsp;</p>', 8.00, NULL, NULL, 20, 1, '[\"0b6fd57752f1fb4dac7cbf6741882ba6.webp\"]', '[\"5e429a6b9142c7938d9ae13f4a538902.webp\",\"55aa0c610e8332304474d889580f1b26.webp\",\"137407f316ff428fcc81883d3e2e00a3.webp\",\"202c6552e9649fba1c90faa78dcf8796.webp\"]', '2021-09-10 12:33:29', '2021-09-10 12:33:29'),
(353, 'Zibah Creations Ladies Bags', NULL, NULL, NULL, NULL, NULL, 58, 'Sky Blue and Red Sling Bag fit for any occassion', '<p>L*W*H is 35*5*25 cm</p>', 40.00, NULL, NULL, 1, 1, '[\"4c7f20a64be47a4b5fe490b679e69740.webp\"]', 'null', '2021-09-10 13:00:57', '2021-09-10 13:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute`
--

CREATE TABLE `product_attribute` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attribute`
--

INSERT INTO `product_attribute` (`id`, `attribute_id`, `value`, `quantity`, `price`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, 1, NULL, NULL),
(2, 1, NULL, NULL, NULL, 2, NULL, NULL),
(3, 2, NULL, NULL, NULL, 2, NULL, NULL),
(4, 3, NULL, NULL, NULL, 2, NULL, NULL),
(5, 1, NULL, NULL, NULL, 2, NULL, NULL),
(6, 2, NULL, NULL, NULL, 2, NULL, NULL),
(7, 3, NULL, NULL, NULL, 2, NULL, NULL),
(8, 1, NULL, NULL, NULL, 2, NULL, NULL),
(9, 2, NULL, NULL, NULL, 2, NULL, NULL),
(10, 3, NULL, NULL, NULL, 2, NULL, NULL),
(11, 1, NULL, NULL, NULL, 2, NULL, NULL),
(12, 2, NULL, NULL, NULL, 2, NULL, NULL),
(13, 3, NULL, NULL, NULL, 2, NULL, NULL),
(14, 1, NULL, NULL, NULL, 2, NULL, NULL),
(15, 2, NULL, NULL, NULL, 2, NULL, NULL),
(16, 3, NULL, NULL, NULL, 2, NULL, NULL),
(17, 1, NULL, NULL, NULL, 2, NULL, NULL),
(18, 2, NULL, NULL, NULL, 2, NULL, NULL),
(19, 3, NULL, NULL, NULL, 2, NULL, NULL),
(20, 1, NULL, NULL, NULL, 2, NULL, NULL),
(21, 2, NULL, NULL, NULL, 2, NULL, NULL),
(22, 3, NULL, NULL, NULL, 2, NULL, NULL),
(23, 1, NULL, NULL, NULL, 13, NULL, NULL),
(24, 2, NULL, NULL, NULL, 13, NULL, NULL),
(25, 3, NULL, NULL, NULL, 13, NULL, NULL),
(26, 1, NULL, NULL, NULL, 37, NULL, NULL),
(27, 2, NULL, NULL, NULL, 37, NULL, NULL),
(28, 1, NULL, NULL, NULL, 19, NULL, NULL),
(29, 2, NULL, NULL, NULL, 19, NULL, NULL),
(30, 1, NULL, NULL, NULL, 36, NULL, NULL),
(31, 2, NULL, NULL, NULL, 36, NULL, NULL),
(32, 1, NULL, NULL, NULL, 16, NULL, NULL),
(33, 2, NULL, NULL, NULL, 16, NULL, NULL),
(34, 1, NULL, NULL, NULL, 20, NULL, NULL),
(35, 2, NULL, NULL, NULL, 20, NULL, NULL),
(36, 1, NULL, NULL, NULL, 38, NULL, NULL),
(37, 1, NULL, NULL, NULL, 40, NULL, NULL),
(38, 3, NULL, NULL, NULL, 40, NULL, NULL),
(39, 1, NULL, NULL, NULL, 41, NULL, NULL),
(40, 1, NULL, NULL, NULL, 43, NULL, NULL),
(41, 1, NULL, NULL, NULL, 43, NULL, NULL),
(42, 1, NULL, NULL, NULL, 161, NULL, NULL),
(43, 2, NULL, NULL, NULL, 161, NULL, NULL),
(44, 1, NULL, NULL, NULL, 20, NULL, NULL),
(45, 2, NULL, NULL, NULL, 20, NULL, NULL),
(46, 2, NULL, NULL, NULL, 306, NULL, NULL),
(47, 1, NULL, NULL, NULL, 306, NULL, NULL),
(48, 2, NULL, NULL, NULL, 306, NULL, NULL),
(49, 3, NULL, NULL, NULL, 306, NULL, NULL),
(50, 1, NULL, NULL, NULL, 306, NULL, NULL),
(51, 2, NULL, NULL, NULL, 306, NULL, NULL),
(52, 3, NULL, NULL, NULL, 306, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `category_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 18, 1, NULL, NULL),
(2, 9, 1, NULL, NULL),
(3, 9, 1, NULL, NULL),
(4, 9, 1, NULL, NULL),
(11, 9, 3, NULL, NULL),
(13, 9, 4, NULL, NULL),
(15, 11, 6, NULL, NULL),
(16, 11, 7, NULL, NULL),
(17, 11, 8, NULL, NULL),
(18, 9, 9, NULL, NULL),
(19, 8, 10, NULL, NULL),
(20, 13, 11, NULL, NULL),
(22, 11, 12, NULL, NULL),
(23, 11, 5, NULL, NULL),
(25, 11, 2, NULL, NULL),
(27, 12, 13, NULL, NULL),
(28, 13, 14, NULL, NULL),
(29, 13, 15, NULL, NULL),
(31, 30, 17, NULL, NULL),
(32, 10, 18, NULL, NULL),
(35, 13, 21, NULL, NULL),
(36, 13, 22, NULL, NULL),
(37, 30, 23, NULL, NULL),
(38, 14, 24, NULL, NULL),
(39, 10, 25, NULL, NULL),
(40, 10, 26, NULL, NULL),
(41, 10, 27, NULL, NULL),
(42, 10, 28, NULL, NULL),
(43, 10, 29, NULL, NULL),
(44, 10, 30, NULL, NULL),
(45, 10, 31, NULL, NULL),
(46, 10, 32, NULL, NULL),
(47, 10, 33, NULL, NULL),
(49, 8, 35, NULL, NULL),
(52, 13, 37, NULL, NULL),
(53, 10, 19, NULL, NULL),
(54, 8, 36, NULL, NULL),
(55, 10, 16, NULL, NULL),
(58, 30, 38, NULL, NULL),
(59, 30, 39, NULL, NULL),
(61, 30, 40, NULL, NULL),
(63, 30, 41, NULL, NULL),
(64, 30, 42, NULL, NULL),
(67, 30, 43, NULL, NULL),
(68, 13, 44, NULL, NULL),
(69, 10, 45, NULL, NULL),
(70, 10, 46, NULL, NULL),
(71, 8, 47, NULL, NULL),
(72, 8, 48, NULL, NULL),
(73, 8, 49, NULL, NULL),
(75, 8, 51, NULL, NULL),
(77, 10, 53, NULL, NULL),
(78, 10, 54, NULL, NULL),
(79, 10, 55, NULL, NULL),
(80, 30, 56, NULL, NULL),
(81, 10, 57, NULL, NULL),
(82, 10, 58, NULL, NULL),
(83, 10, 59, NULL, NULL),
(86, 30, 62, NULL, NULL),
(88, 30, 60, NULL, NULL),
(89, 10, 63, NULL, NULL),
(90, 10, 64, NULL, NULL),
(91, 10, 65, NULL, NULL),
(92, 30, 61, NULL, NULL),
(93, 8, 50, NULL, NULL),
(94, 40, 21, NULL, NULL),
(95, 40, 22, NULL, NULL),
(96, 40, 37, NULL, NULL),
(97, 30, 52, NULL, NULL),
(98, 34, 66, NULL, NULL),
(99, 35, 67, NULL, NULL),
(100, 35, 68, NULL, NULL),
(101, 35, 69, NULL, NULL),
(102, 35, 70, NULL, NULL),
(103, 35, 71, NULL, NULL),
(104, 13, 72, NULL, NULL),
(106, 35, 73, NULL, NULL),
(107, 34, 74, NULL, NULL),
(108, 35, 75, NULL, NULL),
(109, 35, 76, NULL, NULL),
(110, 35, 77, NULL, NULL),
(111, 35, 78, NULL, NULL),
(112, 34, 79, NULL, NULL),
(113, 13, 80, NULL, NULL),
(114, 13, 81, NULL, NULL),
(115, 13, 82, NULL, NULL),
(116, 13, 83, NULL, NULL),
(117, 13, 84, NULL, NULL),
(118, 13, 85, NULL, NULL),
(119, 13, 86, NULL, NULL),
(120, 13, 87, NULL, NULL),
(121, 13, 88, NULL, NULL),
(122, 13, 89, NULL, NULL),
(123, 13, 90, NULL, NULL),
(124, 13, 91, NULL, NULL),
(125, 13, 92, NULL, NULL),
(126, 13, 93, NULL, NULL),
(127, 13, 94, NULL, NULL),
(128, 13, 95, NULL, NULL),
(129, 13, 96, NULL, NULL),
(130, 13, 97, NULL, NULL),
(131, 13, 98, NULL, NULL),
(132, 13, 99, NULL, NULL),
(133, 13, 100, NULL, NULL),
(134, 13, 101, NULL, NULL),
(135, 13, 102, NULL, NULL),
(136, 13, 103, NULL, NULL),
(137, 13, 104, NULL, NULL),
(138, 13, 105, NULL, NULL),
(139, 13, 106, NULL, NULL),
(140, 13, 107, NULL, NULL),
(141, 13, 108, NULL, NULL),
(142, 13, 109, NULL, NULL),
(143, 13, 110, NULL, NULL),
(144, 13, 111, NULL, NULL),
(145, 13, 112, NULL, NULL),
(146, 13, 113, NULL, NULL),
(147, 13, 114, NULL, NULL),
(148, 13, 115, NULL, NULL),
(149, 13, 116, NULL, NULL),
(150, 13, 117, NULL, NULL),
(151, 13, 118, NULL, NULL),
(152, 13, 119, NULL, NULL),
(153, 13, 120, NULL, NULL),
(154, 13, 121, NULL, NULL),
(155, 13, 122, NULL, NULL),
(156, 13, 123, NULL, NULL),
(157, 13, 124, NULL, NULL),
(158, 13, 125, NULL, NULL),
(159, 13, 126, NULL, NULL),
(160, 13, 127, NULL, NULL),
(161, 13, 128, NULL, NULL),
(162, 13, 129, NULL, NULL),
(163, 13, 130, NULL, NULL),
(164, 13, 131, NULL, NULL),
(165, 13, 132, NULL, NULL),
(166, 13, 133, NULL, NULL),
(167, 13, 134, NULL, NULL),
(168, 13, 135, NULL, NULL),
(169, 13, 136, NULL, NULL),
(170, 13, 137, NULL, NULL),
(171, 13, 138, NULL, NULL),
(172, 13, 139, NULL, NULL),
(173, 13, 140, NULL, NULL),
(174, 13, 141, NULL, NULL),
(175, 13, 142, NULL, NULL),
(176, 13, 143, NULL, NULL),
(177, 13, 144, NULL, NULL),
(178, 13, 145, NULL, NULL),
(179, 13, 146, NULL, NULL),
(180, 13, 147, NULL, NULL),
(181, 13, 148, NULL, NULL),
(182, 13, 149, NULL, NULL),
(183, 13, 150, NULL, NULL),
(184, 13, 151, NULL, NULL),
(185, 13, 152, NULL, NULL),
(186, 13, 153, NULL, NULL),
(187, 13, 154, NULL, NULL),
(188, 13, 155, NULL, NULL),
(189, 13, 156, NULL, NULL),
(190, 13, 157, NULL, NULL),
(191, 13, 158, NULL, NULL),
(192, 13, 159, NULL, NULL),
(193, 34, 160, NULL, NULL),
(195, 30, 161, NULL, NULL),
(196, 13, 161, NULL, NULL),
(197, 22, 161, NULL, NULL),
(198, 8, 162, NULL, NULL),
(199, 8, 163, NULL, NULL),
(200, 8, 164, NULL, NULL),
(201, 13, 165, NULL, NULL),
(202, 8, 166, NULL, NULL),
(203, 8, 167, NULL, NULL),
(204, 8, 168, NULL, NULL),
(205, 8, 169, NULL, NULL),
(206, 8, 170, NULL, NULL),
(207, 8, 171, NULL, NULL),
(208, 8, 172, NULL, NULL),
(209, 8, 173, NULL, NULL),
(210, 8, 174, NULL, NULL),
(211, 8, 175, NULL, NULL),
(213, 8, 177, NULL, NULL),
(214, 8, 178, NULL, NULL),
(215, 8, 179, NULL, NULL),
(216, 8, 180, NULL, NULL),
(217, 8, 181, NULL, NULL),
(218, 40, 182, NULL, NULL),
(219, 40, 183, NULL, NULL),
(220, 8, 184, NULL, NULL),
(221, 8, 185, NULL, NULL),
(222, 8, 186, NULL, NULL),
(223, 8, 176, NULL, NULL),
(224, 34, 187, NULL, NULL),
(225, 34, 188, NULL, NULL),
(226, 35, 189, NULL, NULL),
(227, 35, 190, NULL, NULL),
(228, 35, 191, NULL, NULL),
(229, 34, 192, NULL, NULL),
(230, 34, 193, NULL, NULL),
(231, 34, 194, NULL, NULL),
(232, 34, 195, NULL, NULL),
(233, 34, 196, NULL, NULL),
(234, 34, 197, NULL, NULL),
(235, 34, 198, NULL, NULL),
(236, 35, 199, NULL, NULL),
(237, 34, 200, NULL, NULL),
(238, 35, 201, NULL, NULL),
(239, 35, 202, NULL, NULL),
(240, 40, 203, NULL, NULL),
(241, 40, 204, NULL, NULL),
(242, 40, 205, NULL, NULL),
(243, 40, 206, NULL, NULL),
(244, 40, 207, NULL, NULL),
(245, 40, 208, NULL, NULL),
(246, 40, 209, NULL, NULL),
(247, 40, 210, NULL, NULL),
(248, 10, 211, NULL, NULL),
(249, 10, 212, NULL, NULL),
(250, 10, 213, NULL, NULL),
(251, 13, 214, NULL, NULL),
(252, 8, 215, NULL, NULL),
(253, 8, 216, NULL, NULL),
(254, 8, 217, NULL, NULL),
(255, 8, 218, NULL, NULL),
(256, 8, 219, NULL, NULL),
(257, 8, 220, NULL, NULL),
(258, 8, 221, NULL, NULL),
(259, 10, 222, NULL, NULL),
(260, 10, 223, NULL, NULL),
(261, 10, 224, NULL, NULL),
(262, 10, 225, NULL, NULL),
(263, 10, 20, NULL, NULL),
(266, 13, 228, NULL, NULL),
(267, 13, 229, NULL, NULL),
(268, 13, 230, NULL, NULL),
(269, 13, 231, NULL, NULL),
(270, 13, 232, NULL, NULL),
(271, 13, 233, NULL, NULL),
(273, 9, 235, NULL, NULL),
(274, 13, 236, NULL, NULL),
(275, 13, 237, NULL, NULL),
(276, 9, 238, NULL, NULL),
(277, 13, 239, NULL, NULL),
(278, 13, 240, NULL, NULL),
(279, 13, 241, NULL, NULL),
(280, 13, 242, NULL, NULL),
(281, 13, 243, NULL, NULL),
(282, 13, 244, NULL, NULL),
(283, 13, 245, NULL, NULL),
(284, 13, 246, NULL, NULL),
(285, 13, 247, NULL, NULL),
(286, 13, 248, NULL, NULL),
(287, 13, 249, NULL, NULL),
(288, 13, 250, NULL, NULL),
(289, 13, 251, NULL, NULL),
(290, 13, 252, NULL, NULL),
(291, 13, 253, NULL, NULL),
(292, 13, 254, NULL, NULL),
(293, 13, 255, NULL, NULL),
(294, 10, 256, NULL, NULL),
(295, 10, 257, NULL, NULL),
(296, 9, 258, NULL, NULL),
(297, 9, 259, NULL, NULL),
(298, 9, 260, NULL, NULL),
(300, 13, 234, NULL, NULL),
(302, 13, 226, NULL, NULL),
(304, 13, 227, NULL, NULL),
(305, 40, 261, NULL, NULL),
(306, 10, 262, NULL, NULL),
(307, 8, 263, NULL, NULL),
(308, 30, 264, NULL, NULL),
(309, 8, 265, NULL, NULL),
(310, 10, 266, NULL, NULL),
(311, 40, 267, NULL, NULL),
(313, 8, 34, NULL, NULL),
(314, 35, 268, NULL, NULL),
(315, 35, 269, NULL, NULL),
(317, 8, 270, NULL, NULL),
(318, 10, 271, NULL, NULL),
(319, 8, 272, NULL, NULL),
(320, 8, 273, NULL, NULL),
(321, 30, 274, NULL, NULL),
(322, 8, 275, NULL, NULL),
(323, 13, 276, NULL, NULL),
(324, 10, 277, NULL, NULL),
(325, 8, 278, NULL, NULL),
(326, 8, 279, NULL, NULL),
(327, 40, 280, NULL, NULL),
(328, 40, 281, NULL, NULL),
(329, 40, 282, NULL, NULL),
(330, 40, 283, NULL, NULL),
(331, 40, 284, NULL, NULL),
(332, 40, 285, NULL, NULL),
(333, 40, 286, NULL, NULL),
(334, 40, 287, NULL, NULL),
(335, 8, 288, NULL, NULL),
(336, 8, 289, NULL, NULL),
(337, 8, 290, NULL, NULL),
(338, 8, 291, NULL, NULL),
(339, 8, 292, NULL, NULL),
(340, 8, 293, NULL, NULL),
(341, 8, 294, NULL, NULL),
(342, 8, 295, NULL, NULL),
(343, 8, 296, NULL, NULL),
(344, 10, 297, NULL, NULL),
(345, 13, 298, NULL, NULL),
(346, 10, 299, NULL, NULL),
(347, 10, 300, NULL, NULL),
(348, 40, 301, NULL, NULL),
(349, 40, 302, NULL, NULL),
(350, 30, 303, NULL, NULL),
(351, 8, 304, NULL, NULL),
(352, 8, 305, NULL, NULL),
(354, 8, 307, NULL, NULL),
(355, 10, 308, NULL, NULL),
(356, 10, 309, NULL, NULL),
(357, 9, 310, NULL, NULL),
(358, 9, 311, NULL, NULL),
(359, 13, 312, NULL, NULL),
(360, 10, 313, NULL, NULL),
(361, 30, 314, NULL, NULL),
(362, 10, 315, NULL, NULL),
(363, 8, 316, NULL, NULL),
(364, 10, 317, NULL, NULL),
(365, 40, 318, NULL, NULL),
(366, 9, 319, NULL, NULL),
(367, 30, 320, NULL, NULL),
(368, 8, 321, NULL, NULL),
(369, 30, 322, NULL, NULL),
(370, 10, 323, NULL, NULL),
(371, 10, 324, NULL, NULL),
(372, 30, 325, NULL, NULL),
(373, 30, 326, NULL, NULL),
(374, 30, 327, NULL, NULL),
(375, 8, 328, NULL, NULL),
(377, 15, 329, NULL, NULL),
(378, 13, 330, NULL, NULL),
(379, 13, 331, NULL, NULL),
(380, 40, 332, NULL, NULL),
(381, 40, 333, NULL, NULL),
(382, 40, 334, NULL, NULL),
(383, 13, 335, NULL, NULL),
(384, 13, 336, NULL, NULL),
(385, 13, 337, NULL, NULL),
(392, 40, 339, NULL, NULL),
(393, 13, 339, NULL, NULL),
(394, 30, 340, NULL, NULL),
(395, 40, 341, NULL, NULL),
(396, 13, 338, NULL, NULL),
(397, 10, 338, NULL, NULL),
(398, 40, 342, NULL, NULL),
(399, 40, 343, NULL, NULL),
(401, 40, 344, NULL, NULL),
(402, 13, 344, NULL, NULL),
(403, 40, 345, NULL, NULL),
(404, 40, 346, NULL, NULL),
(405, 40, 347, NULL, NULL),
(406, 40, 348, NULL, NULL),
(407, 13, 349, NULL, NULL),
(408, 13, 350, NULL, NULL),
(409, 13, 351, NULL, NULL),
(410, 13, 352, NULL, NULL),
(411, 40, 353, NULL, NULL),
(415, 12, 306, NULL, NULL),
(416, 11, 306, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_tag`
--

INSERT INTO `product_tag` (`id`, `product_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 161, 1, NULL, NULL),
(2, 161, 2, NULL, NULL),
(3, 161, 3, NULL, NULL),
(4, 176, 2, NULL, NULL),
(5, 20, 2, NULL, NULL),
(7, 234, 2, NULL, NULL),
(9, 226, 2, NULL, NULL),
(11, 227, 2, NULL, NULL),
(13, 34, 2, NULL, NULL),
(14, 270, 2, NULL, NULL),
(15, 329, 2, NULL, NULL),
(18, 339, 2, NULL, NULL),
(19, 338, 2, NULL, NULL),
(20, 344, 2, NULL, NULL),
(23, 306, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `user_id`, `product_id`, `rating`, `created_at`, `updated_at`) VALUES
(1, 19, 13, 5, '2021-05-16 09:04:19', '2021-05-16 09:04:19'),
(2, 2, 62, 5, '2021-05-26 22:05:22', '2021-05-26 22:05:22'),
(3, 1, 38, 4, '2021-05-28 13:13:41', '2021-05-28 13:13:41'),
(4, 1, 45, 5, '2021-05-28 13:17:45', '2021-05-28 13:17:45'),
(5, 1, 45, 3, '2021-05-28 13:17:55', '2021-05-28 13:17:55'),
(6, 47, 21, 1, '2021-05-28 19:54:15', '2021-05-28 19:54:15'),
(7, 1, 188, 5, '2021-05-28 19:56:47', '2021-05-28 19:56:47'),
(8, 1, 78, 4, '2021-05-29 04:48:15', '2021-05-29 04:48:15'),
(9, 1, 253, 5, '2021-05-30 21:47:16', '2021-05-30 21:47:16'),
(10, 1, 295, 4, '2021-06-03 16:04:45', '2021-06-03 16:04:45'),
(11, 1, 306, 4, '2021-06-06 10:35:13', '2021-06-06 10:35:13'),
(12, 2, 252, 5, '2021-06-06 11:42:06', '2021-06-06 11:42:06'),
(14, 1, 13, 5, '2022-09-29 15:00:46', '2022-09-29 15:00:46');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0BvTSuVjzet2IUwE2illho3IphQDG9rjtzTQidkU', NULL, '114.119.140.99', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZ2dZUWVWVUs4VG10SWRHOXREWkZleFRRSjB5aEFYMWhzTFBCQUN3RSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MDoiaHR0cHM6Ly9rYW11c2lrYS5jb20vYWRkLXRvLXdpc2hsaXN0LzIyMiI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI2OiJodHRwczovL2thbXVzaWthLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1665723380),
('2i4IKQkGDvsYsTMxXkZHYcvHQvS6S6MN7dq2juYh', NULL, '114.119.130.111', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVjNDdlV6Z3hjMUM0b0F0VGlrMmZZelZ1bktHRjBVM29wbEJ0WHFLYSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0NDoiaHR0cHM6Ly93d3cua2FtdXNpa2EuY29tL2FkZC10by13aXNobGlzdC8yODIiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMDoiaHR0cHM6Ly93d3cua2FtdXNpa2EuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1665726407),
('3QUZkX2bcCwdgTf6fHRRTkrXyaCbzufinzSujbqF', NULL, '51.15.195.246', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3VQRkxUbnBEWVppbmZTSUNuZ0RuSEFjYzVGTlc4VEJTekR4YWV4UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8va2FtdXNpa2EuemltYm9ob3N0LmNvLnp3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1665718066),
('9XaRm4RwVRHjUW17CIslHkJpfz6GV95rJDY7sgkq', NULL, '114.119.140.87', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQ2diZW1OdEVpUHhsWDVsejFSdlhCdExZV3JpTjY5U0duZTRGZWE0ZCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MDoiaHR0cHM6Ly9rYW11c2lrYS5jb20vYWRkLXRvLXdpc2hsaXN0LzM0MCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI2OiJodHRwczovL2thbXVzaWthLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1665723051),
('AGYmxUiLUIqF80DZ5d6aKG7tr2AIrdtfiacUqTJK', NULL, '114.119.141.100', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWEpVZ2hBTlpUOXFHVmVaY21GbUdqdTdYaFQwTTlVckZ5ZXU3dWRpTSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MDoiaHR0cHM6Ly9rYW11c2lrYS5jb20vYWRkLXRvLXdpc2hsaXN0LzI5NyI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI2OiJodHRwczovL2thbXVzaWthLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1665721047),
('AKGLxbCh86Rqv1eWfg7YG4C04Y82zZs4Ar4gvVtQ', NULL, '114.119.141.100', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWm1tem5idzJkYWRmRTVmZXVzMUYwaG9JczdBSGN5MVhlcE1CUnZkOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8va2FtdXNpa2EuY29tL3Byb2R1Y3QvNjUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1665722382),
('AmwHzqHgNu2K8Bn9o0KJ5uPPKKqX0PRpcFs6BNZQ', NULL, '114.119.140.99', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiN0lJZ2ZUeWtNd3dmZ0Q3Z3lPZUV4MXFZN2Z6NmQ4QUhWUjZiRkpKZiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MDoiaHR0cHM6Ly9rYW11c2lrYS5jb20vYWRkLXRvLXdpc2hsaXN0LzIxNiI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI2OiJodHRwczovL2thbXVzaWthLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1665725064),
('aOhdJnFZOKDBZS7XHiC7ANISI41tnpsJAikqzJSd', NULL, '114.119.140.99', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicnZmb2dRcHgxdzdiakVkV2lUcEhnUW9JNjR2a0tzSmNCTnhJMmkzMiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNjoiaHR0cHM6Ly9rYW11c2lrYS5jb20vYWRkLXRvLWNhcnQvMTExIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8va2FtdXNpa2EuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1665724053),
('AtaI1AaLKU8DD1fRbbfGF4yyMY3BYrJiKVDp7F3M', NULL, '114.119.141.100', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUTFnY2lFcWdGS1JXeWQ2Y2hjazJPQnRxSEoxaXRMTU1MaU1DMnJzUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8va2FtdXNpa2EuY29tL3JlZ2lzdGVyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1665729452),
('aueTAODejM4fBnPweHor2U5JwfpAqLyUDShaeamA', NULL, '114.119.140.99', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYjZMc2V4RXpqUjlrYm9RbTdmRkhFbGszRGhseEJPVFJjd0tVTkFZOCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MDoiaHR0cHM6Ly93d3cua2FtdXNpa2EuY29tL2FkZC10by1jYXJ0LzI3MSI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMwOiJodHRwczovL3d3dy5rYW11c2lrYS5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1665719716),
('DQ445LLqiaH6AR9uTGiaedfqTOz07TcxYfwXM1Cy', NULL, '114.119.130.111', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGhQQXJBRWRYeVFzTk5UaUZod2llU0FIakRzV0sxM3d2S014Ukd5UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8va2FtdXNpa2EuY29tL3Byb2R1Y3QvMjA1Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1665717719),
('DwNcLG4zDmn6G8Hvd5i4BbqaxayRyEL3QvzSicgX', NULL, '114.119.140.99', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZTI1YWh2bXl1RHprNlVyZ25FRVc2a2ZCU0V2UzZCRWR0eEozRzdYbCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNjoiaHR0cHM6Ly9rYW11c2lrYS5jb20vYWRkLXRvLWNhcnQvMTkxIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8va2FtdXNpa2EuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1665726738),
('f2EueDpdlNe8kY5gtvIYuChMKKuXYzWlgASnKbpa', NULL, '114.119.140.99', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWVnVjgwQlpFYmlpZGxaNDh5eDRvTnluN2htYUh3dUpZM2VDeFkwZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3LmthbXVzaWthLmNvbS9zaG9wLzQ4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1665718057),
('hLDIQrHtw1IxPrxjQoIwcJ3bVNnVUuZggR4iEFmi', NULL, '114.119.130.111', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMGhtOGpPY1E3MEdTYzFmandHZ1dDVTY4aGlsUTJheHk4NkNnSFZqbSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNToiaHR0cHM6Ly9rYW11c2lrYS5jb20vYWRkLXRvLWNhcnQvNjgiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNjoiaHR0cHM6Ly9rYW11c2lrYS5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1665718719),
('HWI9RDpnSkI59BxhzhMWVgVsrdzeavuOW2TcGEHL', NULL, '114.119.141.100', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRTI3R3pEZU5wOWtCTnVPOVRRMlpuTXk0SEZFRmtLTjVNMmFQQ2ZWWCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNjoiaHR0cHM6Ly9rYW11c2lrYS5jb20vYWRkLXRvLWNhcnQvMTQ5Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8va2FtdXNpa2EuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1665725737),
('HynYhmOIgFN8aY76kaUtf52C2Ihv4fRJpfqJLLAQ', NULL, '114.119.140.87', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiY2FuR0EzdE1KUTRFSUJ0VWZ1U0lQU0hJQ0F2UTN6NkpRMEpDRkh0ViI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNToiaHR0cHM6Ly9rYW11c2lrYS5jb20vYWRkLXRvLWNhcnQvNzUiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNjoiaHR0cHM6Ly9rYW11c2lrYS5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1665723715),
('iP4Na6PL3VHOlq9kXC3btxeddJhYs7hBDzbmJxE0', NULL, '114.119.140.99', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNFZWbEpBcDlLYkJHa1dYY2dGam1qckdMZDNPbW9tV0FZYkJLeW12MiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MDoiaHR0cHM6Ly9rYW11c2lrYS5jb20vYWRkLXRvLXdpc2hsaXN0LzI5OSI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI2OiJodHRwczovL2thbXVzaWthLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1665728782),
('jE22KFEdxGbMBBB6v67l0xxKOyZm9My5mNbKpSMY', NULL, '114.119.140.87', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiN2doWWNHdDlmM2pqNWx3MTBrMEtWbDdsd3lOWlpDZDdUSUJtOXNrRyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MDoiaHR0cHM6Ly93d3cua2FtdXNpa2EuY29tL2FkZC10by1jYXJ0LzMzOCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMwOiJodHRwczovL3d3dy5rYW11c2lrYS5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1665727758),
('ld5JNeMGytlScR7KdX6ZhsoeuSQXC4DERjncPokX', NULL, '114.119.140.99', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQ3p6ZEZIWUk3WDN4S2FrSDhUa1h2SHhIMVNWSkJnNnRUWlgzNEgyUSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0NDoiaHR0cHM6Ly93d3cua2FtdXNpa2EuY29tL2FkZC10by13aXNobGlzdC8yNTIiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMDoiaHR0cHM6Ly93d3cua2FtdXNpa2EuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1665721717),
('MfGKZo6PSFIkbXwDhL6umBGzBmkcVk4Cl3s4tZXq', NULL, '114.119.130.111', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUhHRlh3b3BySGdZOHhDRkx3S1hSbWJTVWV0eWtZSzRPeDZpTm1OMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3LmthbXVzaWthLmNvbS9zaG9wLzU0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1665722716),
('MKBZk4Xbt6evlRPm0caWNd5SIfMNhqbhBEeFNCA7', NULL, '114.119.140.99', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidXlBdlhDcjc5TFFTdklWZFRROHg1MXlueURWa2NNUHEzeElwUGZOSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8va2FtdXNpa2EuY29tL3Byb2R1Y3QvMTk1Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1665721379),
('nEJUmCACASZMbj3lTte04ToEOUrAkZBHMEyWmbC9', NULL, '114.119.130.111', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZmhkRkVUZDByWTZUUlp0cmVXbktmaW9mTTB0ZkdlYzZNV1ROVWx5NCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNjoiaHR0cHM6Ly9rYW11c2lrYS5jb20vYWRkLXRvLWNhcnQvMjU5Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8va2FtdXNpa2EuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1665728104),
('Nsw3ogScCp3lnykfidROa7bWQb8zYunA5oab7TSq', NULL, '114.119.141.100', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMk13TVRoUG84ZTc4VkRGRk1HazFmSU9rZzBsc2F2Z1F0R1ZLMzEzUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vd3d3LmthbXVzaWthLmNvbS9wcm9kdWN0LzIwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1665719049),
('O3oBwmGDWW0iidKNlwvqFu8ESECHdLujSQDD5kpe', NULL, '114.119.141.100', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU3lIc2Fsb1VzM1RralNtZFlNOHZnM3FnT3RtdTVFaVNtM1FWSjNhOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8va2FtdXNpa2EuY29tLz9DPU4lM0JPJTNERCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1665727078),
('O5FkRFDtVpxs9aBboYHHNJmOuN5vLoxTkMSHxAHz', NULL, '114.119.141.100', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOVFjaHVuY3FBcjBTQmNWWllHOGhsV1JJdGRpN2dKUFVtRVl1b0JPVCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MDoiaHR0cHM6Ly93d3cua2FtdXNpa2EuY29tL2FkZC10by1jYXJ0LzI2MCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMwOiJodHRwczovL3d3dy5rYW11c2lrYS5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1665722055),
('p0dUBIe4Gcz6Hmp8A9prmirEqRs8r1A3jYzHxXgk', NULL, '114.119.140.99', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFVOajFTNkJwVm81Nm40cXZzTWI1YTJVeTQxUnF1SnFQbjZ3dVA3eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8va2FtdXNpa2EuY29tL3Byb2R1Y3QvMjk3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1665724723),
('puyUo64TIagjpvIsoqA4JUMAB4VMYxR87liZoBOy', NULL, '54.36.149.30', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUJjZm9Md3V3RkpIcGZMN1BDNHBTMkpRbTFmNmpMYzEzMUVzQUIwYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8va2FtdXNpa2EuY29tL3Byb2R1Y3QvNDEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1665719961),
('qnDCPcf01Fp7A2rBZViNZy5sD107xhVDee1yxTQC', NULL, '114.119.140.87', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0gzNEpjRVJBWjZUcWh0Y3Q0cHc1R3RnWGtiYmdzaVg5Y2pXRjFxUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8va2FtdXNpa2EuY29tL3Byb2R1Y3QvMzA5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1665725391),
('rSXlXfehnzSWds7fFpRMOaZyQrcnA7ERa1GCiAvT', NULL, '114.119.140.99', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTgzTVNQdVNuN3B3ZVRaazl3ZmtJUnN1UDdaYXRzMVVsazJCbm55NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vd3d3LmthbXVzaWthLmNvbS9wcm9kdWN0Lzk2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1665720382),
('SQ7EU2jrdCWRiQmdbf9S5u2JofoNc8FFlQajKdC1', NULL, '114.119.141.100', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTUlSZmgxczl3Q0tIdzdpYWwwRG1PTDVzZnByMkJNa1htQkxIUFc4SiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MDoiaHR0cHM6Ly9rYW11c2lrYS5jb20vYWRkLXRvLXdpc2hsaXN0LzEzMiI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI2OiJodHRwczovL2thbXVzaWthLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1665719383),
('tB8wjQGJ2FDOOm6DJFr9J43nRSZf7nDKa05iWnxw', NULL, '114.119.140.99', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidUM0VmNnejBZSnREY3BobWpUUXlSV2prUFpid05nZFRMcDBxTXhyaCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozOToiaHR0cHM6Ly9rYW11c2lrYS5jb20vYWRkLXRvLXdpc2hsaXN0LzM5Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8va2FtdXNpa2EuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1665727420),
('tbXf7n7P8n0FK1F9fkuq68yO2b3ggV4GdQFbbpkE', NULL, '54.36.148.47', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaFV5V2dEZERlUHdabkpzbHM0Rmd4bUYwRVZiQ3QwakdtcVd3d3NDTCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MzoiaHR0cHM6Ly93d3cua2FtdXNpa2EuY29tL2FkZC10by13aXNobGlzdC83MyI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQzOiJodHRwczovL3d3dy5rYW11c2lrYS5jb20vYWRkLXRvLXdpc2hsaXN0LzczIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1665724532),
('tdwmzyhcrJFL8xS6E6rZ3POAQdMXG5tNKIayb7c7', NULL, '114.119.140.87', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEk2Wk5YYnMzaUFOZ1lybEV0NExya3VDR3NYRTNmcHB4bzZ1dUlndyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8va2FtdXNpa2EuY29tL2NhdGVnb3J5LzM1Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1665720052),
('V2su5ult0SuWlecv9ug4iBPztJyueUTsbUU2qekO', NULL, '114.119.140.99', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYzFZUnFQaDJhNUV5MlQwWEtrU0s0cFp6MkpBamw0VGZyeHBRR0ZiMiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MDoiaHR0cHM6Ly9rYW11c2lrYS5jb20vYWRkLXRvLXdpc2hsaXN0LzIxMSI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI2OiJodHRwczovL2thbXVzaWthLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1665729120),
('vekgTtxyXAjV0hCereE4shGZZ8lnzxFEO5zhZN3H', NULL, '114.119.141.100', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoic0NucGZZR3ZYekNCREhPS1FpOENIeUduRWJMdDBXbVZzNVMxUnA0NiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNzoiaHR0cHM6Ly93d3cua2FtdXNpa2EuY29tL3N1YnNjcmliZS8zNSI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMwOiJodHRwczovL3d3dy5rYW11c2lrYS5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1665724388),
('wrQmsF0R63cJgySZL8f6IMT6CuPwIxbblo0B3NJT', NULL, '114.119.140.87', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiM0lWYllORFhGdDVGQWlBbHkzU0p0TlhDdjhiYmlCTmlwUm1mZ08wciI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNjoiaHR0cHM6Ly9rYW11c2lrYS5jb20vYWRkLXRvLWNhcnQvMzE4Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8va2FtdXNpa2EuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1665718384),
('XCoOPXVfyniDU14v9e0lomor1nUMOD8bAULISIvC', NULL, '114.119.140.99', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEVUNDFzSzdEU0FSbXM0OGlFT09aTzFNN0JHYXJoN0lKQkRFOVJRZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vd3d3LmthbXVzaWthLmNvbS9mb3Jnb3QtcGFzc3dvcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1665726068),
('Y6WjSbbf3EOhvEPYKTenU2QGEKpMn6yp0ZevHbkK', NULL, '114.119.130.111', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicVJUOHFkenpWY2N4UElyWVAyeGtVM0Y1S3dCeXYxa1M0Rm1najNPRCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cHM6Ly9rYW11c2lrYS5jb20vbWVzc2FnZS8xOSI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI2OiJodHRwczovL2thbXVzaWthLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1665720716),
('yaxv5oFvtVZ6chbvPdnSZjIOsb23drF3K0y3tI2Q', NULL, '114.119.140.87', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiU0duM2ZLYkpUU3RoWmVhVmtsR0JhRnA5Z2lwSzlEWVFSMzI0YUkyRSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MDoiaHR0cHM6Ly93d3cua2FtdXNpa2EuY29tL2FkZC10by1jYXJ0LzM0NyI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMwOiJodHRwczovL3d3dy5rYW11c2lrYS5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1665728437);

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `name`, `user_id`, `is_active`, `description`, `phone`, `address`, `longitude`, `latitude`, `cover_image`, `shop_image`, `rating`, `created_at`, `updated_at`) VALUES
(5, 'Slim Enterprises', 3, 0, 'Chicken Sales', '', NULL, NULL, NULL, NULL, '[\"40039fd892fbe1749dc6c9af2882937bjpg\"]', NULL, '2021-04-14 17:51:50', '2021-04-14 17:51:50'),
(8, 'Zimcore Cycles', 8, 0, 'We sell bicycles.', '', NULL, NULL, NULL, '[\"7b6feac828585ab90dbe8c938581b5ebjpg\"]', '[\"eea8debb1b494a1dde15bd1c1b7b5a85jpg\"]', NULL, '2021-04-17 19:41:03', '2021-04-17 19:41:03'),
(9, 'Fashion-Style', 2, 1, 'Sells Men and Women Clothing', '', 'corner Leopold Takawira and Jason Moyo.', NULL, NULL, '[\"1703b286c7b9c29f14f43fb025f07487jpg\"]', '[\"7880da3dbbe628dd3d15a24373a33cecjpg\"]', NULL, NULL, '2021-05-16 13:25:17'),
(12, 'PERFUMES TIN', 19, 1, 'SELLING THE BEST PERFUMES AT THE CHEAPEST PRICE ONE COULD EVER WISH FOR !!!', '', NULL, NULL, NULL, '[\"9161ba715b6080ef411359d475e5d1c1jpg\"]', '[\"aabb9e8ca66f2a80a9a7811f5550e610jpg\"]', NULL, '2021-05-13 18:03:34', '2021-05-13 18:03:34'),
(21, 'Classy Missy', 21, 1, 'Clothing,Shoes, bedding & Fashion', '', 'Shop 41 Homegate Mall', '5200', '3600', '[\"e4ebcfaa42187381625bdb7c8d1ab780jpg\"]', '[\"6d246e7d25dac5dff5e4e92c6485b59ejpg\"]', NULL, '2021-05-14 09:20:56', '2021-05-14 09:43:11'),
(25, '100%_handmade_bags_and_accessories', 22, 1, 'Female owned small business sells handmade handbags and accessories', '', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-15 05:52:27', '2021-05-15 05:52:27'),
(26, 'Aaron’s Organic', 18, 1, 'Number one store for all your organic fruit and vegetable needs', '', '2905 Hayhill Park, Glen Lorne', '123', '123', '[\"4be75e2f0f210195e53c0c2015a155c4jpg\"]', '[\"1f98e66dcf07ef737cfae49040273c21jpg\"]', NULL, '2021-05-15 08:54:35', '2021-05-15 09:29:37'),
(27, 'Brenda\'s Fashion Glamour', 25, 1, 'Shopping and retail Appreal and clothing', '', 'Equity house corner Jason moyo and rezende 2nd floor room 214', NULL, NULL, NULL, '[\"3046b26183dbbfffea7b253abe9d039fjpg\"]', NULL, '2021-05-15 09:33:45', '2021-06-24 00:10:11'),
(33, 'Honey Accessories Zimbabwe', 26, 1, 'We offer a wide range of styles and designs from classic to contemporary fashion for men, women and children. Our range is very affordable and meets a wide range of customer preferences and needs.', '', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-15 11:31:57', '2021-05-15 11:31:57'),
(35, 'O & L Tech', 29, 1, 'We sell laptops and accessories', '', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-16 08:28:10', '2021-05-16 08:28:10'),
(36, 'The Style Capsule', 30, 1, 'It is an online shop, we are mobile. We sell different good quality fashion products from China.', '', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-16 13:09:26', '2021-05-16 13:09:26'),
(37, 'KnitsnKraftsbySue', 33, 1, 'Handmade Crafts Shop', '', '146 Rekayi Tangwena Dr Greenside', '-18.97521', '32.69305', '[\"123885b29ae4b3021d9695a4ab8ec6a5jpg\"]', '[\"12033551041933309b912fa8d327ffffjpg\"]', NULL, '2021-05-20 15:31:48', '2021-05-31 07:36:50'),
(38, 'Yummy Delights', 34, 1, 'Expressing love through baking.....', '', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-20 16:17:26', '2021-05-20 16:17:26'),
(41, 'DaShan', 35, 1, 'Sells preloved stuff', '', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-21 06:21:45', '2021-05-21 06:21:45'),
(43, 'Kamusika Kitchen Essentials', 37, 1, 'High quality, durable Tupperware for all your home use. Outstanding quality and build. Ideal for the premium consumer.', '', 'Harare CBD', '14.00', '14.00', '[\"2bea1b70762a69832666c695c458dd37jpg\"]', '[\"327d07da129fa9ced8a5d159f4621de3jpg\"]', NULL, '2021-05-24 12:16:41', '2021-05-30 20:34:50'),
(45, 'MOLLY\'S', 42, 1, 'WE OFFER  A WIDE RANGE OF PRODUCTS', '', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-26 10:46:14', '2021-05-26 10:46:14'),
(46, 'ceebridals', 43, 1, 'Bridal wear and African attear', '', 'Shop 125 Ceebridals Joina City Harare', NULL, NULL, '[\"9cc94539de65d848b7ee43a3adc97f97jpg\"]', '[\"8bf779ee835199eb934adfbb71e4701cjpg\"]', NULL, '2021-05-27 16:22:53', '2021-06-25 10:38:58'),
(47, '#Ackermams&PEP Fellaz for your baby essentials', 45, 1, 'We sell baby clothes from SA and many other countries.....order today and receive your items within 5days maximum', '', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-27 19:08:15', '2021-05-27 19:08:15'),
(48, 'Evas Accessories', 44, 1, 'Retailers in mobile phone and home accessories', '', 'Batanai Mall Harare', '-17.8308525', '31.0490999', '[\"60af0eab2df8fb95b9a3c4a800e4128fjpg\"]', '[\"3beb6565a9a6927e43ef6e4010c1080ajpg\"]', NULL, '2021-05-27 19:47:40', '2021-05-31 16:54:23'),
(49, 'Footwear Plug ZW', 48, 1, 'All your quality footwear from slippers to boots to sneakers.', '', 'Harare CBD', '14', '14', '[\"98d2cc4dce39181bf3e6abce2cf86b02jpg\"]', '[\"767c5572dc323ed35839a2da81afddc9jpg\"]', NULL, '2021-05-28 11:14:56', '2021-05-28 13:09:53'),
(51, 'CeeCee\'s Classic Boutique', 47, 1, 'A boutique store you can brag about', '0784582351', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-28 19:30:14', '2021-05-28 19:30:14'),
(52, 'TecHub', 50, 1, 'One stop shop for all your mobile devices & accessories', '0771712374', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-31 07:31:56', '2021-05-31 07:31:56'),
(53, 'Quick Mart', 52, 1, 'Cheap, quality clothing', '263772864157', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-31 08:55:47', '2021-05-31 08:55:47'),
(54, 'Nathi dreams', 53, 1, 'For fashion and your lovely jewellery', '263778836498', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-31 19:57:28', '2021-05-31 19:57:28'),
(55, 'Vibosa', 54, 1, 'Selling bathing and showering liquid , petroleum jelly  and dilutable drinks', '263788384014', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-01 15:09:52', '2021-06-01 15:09:52'),
(56, '90swerve', 1, 1, 'We go far.', '286', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-03 13:28:00', '2021-06-03 13:28:00'),
(57, 'Fashion corber', 67, 1, 'Clothing and Accessories', '263737554372', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-25 18:14:16', '2021-06-25 18:14:16'),
(58, 'Zibah Creations', 69, 1, 'Zibah Creations is a crafts shop for bags, belts, purses and home decor (plant pot hangers and yarn bottles) items using macrame weaving.  Bags are done on order and can be personalised at an extra minimal cost.', '263777802867', '913 14 crescent Glen View 1', NULL, NULL, '[\"ebfe56aca5892523aaf7af1b9279fd23jpg\"]', '[\"4eacc45ed4f5483fcb61c742d0afbec2jpg\"]', NULL, '2021-07-05 16:31:40', '2021-09-08 18:19:13');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `shop_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `shop_id`, `created_at`, `updated_at`) VALUES
(1, 3, 4, NULL, NULL),
(2, 1, 5, NULL, NULL),
(3, 1, 8, NULL, NULL),
(4, 1, 6, NULL, NULL),
(5, 1, 4, NULL, NULL),
(6, 14, 8, NULL, NULL),
(7, 5, 4, NULL, NULL),
(8, 19, 12, NULL, NULL),
(9, 19, 21, NULL, NULL),
(10, 2, 21, NULL, NULL),
(11, 19, 12, NULL, NULL),
(12, 19, 12, NULL, NULL),
(13, 5, 25, NULL, NULL),
(14, 19, 12, NULL, NULL),
(15, 22, 21, NULL, NULL),
(16, 29, 9, NULL, NULL),
(17, 29, 35, NULL, NULL),
(18, 29, 35, NULL, NULL),
(19, 27, 5, NULL, NULL),
(20, 27, 5, NULL, NULL),
(21, 34, 12, NULL, NULL),
(23, 36, 40, NULL, NULL),
(24, 1, 9, NULL, NULL),
(25, 1, 21, NULL, NULL),
(26, 1, 25, NULL, NULL),
(27, 1, 27, NULL, NULL),
(28, 45, 5, NULL, NULL),
(29, 45, 46, NULL, NULL),
(30, 46, 9, NULL, NULL),
(31, 46, 21, NULL, NULL),
(32, 46, 5, NULL, NULL),
(33, 46, 12, NULL, NULL),
(34, 46, 43, NULL, NULL),
(35, 1, 48, NULL, NULL),
(36, 63, 37, NULL, NULL),
(37, 47, 51, NULL, NULL),
(38, 47, 52, NULL, NULL),
(39, 25, 27, NULL, NULL),
(41, 43, 9, NULL, NULL),
(42, 69, 37, NULL, NULL),
(43, 25, 53, NULL, NULL),
(44, 1, 46, NULL, NULL),
(45, 1, 12, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Fan', '2021-05-28 13:06:22', '2021-05-28 13:06:22'),
(2, '', '2021-05-28 13:06:22', '2021-05-28 13:06:22'),
(3, 'Hope', '2021-05-28 13:06:22', '2021-05-28 13:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `user_id`, `name`, `personal_team`, `created_at`, `updated_at`) VALUES
(1, 1, 'Tinashe\'s Team', 1, '2021-04-12 16:05:03', '2021-04-12 16:05:03'),
(2, 2, 'Tinashe\'s Team', 1, '2021-04-14 17:39:33', '2021-04-14 17:39:33'),
(3, 3, 'nyasha\'s Team', 1, '2021-04-14 17:46:07', '2021-04-14 17:46:07'),
(4, 4, 'tatenda\'s Team', 1, '2021-04-15 14:29:02', '2021-04-15 14:29:02'),
(5, 5, 'Isheanesu\'s Team', 1, '2021-04-17 17:58:46', '2021-04-17 17:58:46'),
(6, 6, 'Varaidzo\'s Team', 1, '2021-04-17 18:00:17', '2021-04-17 18:00:17'),
(7, 7, 'Tatenda\'s Team', 1, '2021-04-17 18:10:17', '2021-04-17 18:10:17'),
(8, 8, 'Takuranenhamo\'s Team', 1, '2021-04-17 19:32:51', '2021-04-17 19:32:51'),
(9, 9, 'Amandlaenkosi\'s Team', 1, '2021-04-17 20:44:43', '2021-04-17 20:44:43'),
(10, 10, 'Lee\'s Team', 1, '2021-04-17 23:08:06', '2021-04-17 23:08:06'),
(11, 11, 'Annie\'s Team', 1, '2021-04-18 04:30:01', '2021-04-18 04:30:01'),
(12, 12, 'Priscah\'s Team', 1, '2021-04-18 06:11:52', '2021-04-18 06:11:52'),
(13, 13, 'Anderson\'s Team', 1, '2021-04-23 16:50:55', '2021-04-23 16:50:55'),
(14, 14, 'samard\'s Team', 1, '2021-04-28 08:54:43', '2021-04-28 08:54:43'),
(15, 15, 'Victor\'s Team', 1, '2021-04-28 09:04:28', '2021-04-28 09:04:28'),
(16, 16, 'fEazeswmKAvp\'s Team', 1, '2021-04-29 13:30:24', '2021-04-29 13:30:24'),
(17, 17, 'Hazel\'s Team', 1, '2021-05-01 08:14:06', '2021-05-01 08:14:06'),
(18, 18, 'Anesuishe\'s Team', 1, '2021-05-10 12:14:04', '2021-05-10 12:14:04'),
(19, 19, 'Betty\'s Team', 1, '2021-05-13 13:43:02', '2021-05-13 13:43:02'),
(20, 21, 'Kupara\'s Team', 1, '2021-05-13 17:41:05', '2021-05-13 17:41:05'),
(21, 22, 'Rutendo\'s Team', 1, '2021-05-14 16:47:51', '2021-05-14 16:47:51'),
(22, 23, 'Sithokozile\'s Team', 1, '2021-05-15 08:03:03', '2021-05-15 08:03:03'),
(23, 24, 'Mudiwa\'s Team', 1, '2021-05-15 09:06:44', '2021-05-15 09:06:44'),
(24, 25, 'Rufaro\'s Team', 1, '2021-05-15 09:24:32', '2021-05-15 09:24:32'),
(25, 26, 'Ruth\'s Team', 1, '2021-05-15 10:07:50', '2021-05-15 10:07:50'),
(26, 27, 'Stanford\'s Team', 1, '2021-05-15 20:43:09', '2021-05-15 20:43:09'),
(27, 28, 'Tjacobs\'s Team', 1, '2021-05-16 03:17:53', '2021-05-16 03:17:53'),
(28, 29, 'Lawrenzo\'s Team', 1, '2021-05-16 08:25:07', '2021-05-16 08:25:07'),
(29, 30, 'Blessings\'s Team', 1, '2021-05-16 12:37:10', '2021-05-16 12:37:10'),
(30, 31, 'vagTrybFxMDGIZi\'s Team', 1, '2021-05-17 18:36:06', '2021-05-17 18:36:06'),
(31, 32, 'Omega\'s Team', 1, '2021-05-19 07:44:54', '2021-05-19 07:44:54'),
(32, 33, 'Sue\'s Team', 1, '2021-05-20 15:29:37', '2021-05-20 15:29:37'),
(33, 34, 'Delight\'s Team', 1, '2021-05-20 15:29:42', '2021-05-20 15:29:42'),
(34, 35, 'Simon\'s Team', 1, '2021-05-21 06:14:19', '2021-05-21 06:14:19'),
(35, 36, 'Tatenda\'s Team', 1, '2021-05-21 06:17:09', '2021-05-21 06:17:09'),
(36, 37, 'Ishe\'s Team', 1, '2021-05-22 18:03:28', '2021-05-22 18:03:28'),
(37, 39, 'Oliver\'s Team', 1, '2021-05-23 17:50:56', '2021-05-23 17:50:56'),
(38, 40, 'Maria\'s Team', 1, '2021-05-24 13:03:29', '2021-05-24 13:03:29'),
(39, 42, 'MOLEEN\'s Team', 1, '2021-05-26 09:31:11', '2021-05-26 09:31:11'),
(40, 43, 'Ian\'s Team', 1, '2021-05-27 05:13:46', '2021-05-27 05:13:46'),
(41, 44, 'Evas\'s Team', 1, '2021-05-27 16:46:50', '2021-05-27 16:46:50'),
(42, 45, 'Daphne\'s Team', 1, '2021-05-27 18:55:15', '2021-05-27 18:55:15'),
(43, 46, 'Pardon\'s Team', 1, '2021-05-28 00:57:20', '2021-05-28 00:57:20'),
(44, 47, 'CeeCee\'s\'s Team', 1, '2021-05-28 06:07:19', '2021-05-28 06:07:19'),
(45, 48, 'Anesu\'s Team', 1, '2021-05-28 11:05:09', '2021-05-28 11:05:09'),
(46, 49, 'Tate@hip.com\'s Team', 1, '2021-05-30 15:56:13', '2021-05-30 15:56:13'),
(47, 50, 'Gladstone\'s Team', 1, '2021-05-31 07:12:22', '2021-05-31 07:12:22'),
(48, 51, 'Jackson\'s Team', 1, '2021-05-31 08:49:39', '2021-05-31 08:49:39'),
(49, 52, 'Ishe\'s Team', 1, '2021-05-31 08:50:39', '2021-05-31 08:50:39'),
(50, 53, 'Anesu\'s Team', 1, '2021-05-31 19:52:10', '2021-05-31 19:52:10'),
(51, 54, 'Vibosa\'s Team', 1, '2021-06-01 15:04:09', '2021-06-01 15:04:09'),
(52, 58, 'Delta\'s Team', 1, '2021-06-03 11:12:31', '2021-06-03 11:12:31'),
(53, 64, 'Dellan\'s Team', 1, '2021-06-24 08:10:37', '2021-06-24 08:10:37'),
(54, 65, 'Craig\'s Team', 1, '2021-06-24 12:03:27', '2021-06-24 12:03:27'),
(55, 66, 'Reuben\'s Team', 1, '2021-06-24 12:56:17', '2021-06-24 12:56:17'),
(56, 67, 'Faffy\'s Team', 1, '2021-06-24 15:01:55', '2021-06-24 15:01:55'),
(57, 68, 'Sibusiso\'s Team', 1, '2021-06-30 16:24:53', '2021-06-30 16:24:53'),
(58, 69, 'Ruth\'s Team', 1, '2021-07-05 16:25:59', '2021-07-05 16:25:59'),
(59, 71, 'XrzWjixJVkMI\'s Team', 1, '2021-07-23 15:53:48', '2021-07-23 15:53:48'),
(60, 72, 'Alfred\'s Team', 1, '2021-07-28 08:08:22', '2021-07-28 08:08:22'),
(61, 73, 'tzGJuYRbIc\'s Team', 1, '2021-11-22 11:24:58', '2021-11-22 11:24:58'),
(62, 74, 'SfXwkMiWHF\'s Team', 1, '2021-12-04 14:13:49', '2021-12-04 14:13:49'),
(63, 75, 'MIqgaQCjHNztsn\'s Team', 1, '2021-12-22 10:33:35', '2021-12-22 10:33:35'),
(64, 76, 'hjtrydjhcgj5t6djtyghjtydhgkjtdhkjglgu\'s Team', 1, '2021-12-28 21:38:03', '2021-12-28 21:38:03'),
(65, 77, 'PBolAKneRZjQJY\'s Team', 1, '2022-03-07 22:18:32', '2022-03-07 22:18:32'),
(66, 78, 'GzurbOkDKvhVI\'s Team', 1, '2022-03-15 06:26:10', '2022-03-15 06:26:10'),
(67, 79, 'dQOwyBkKPLbArcDf\'s Team', 1, '2022-04-03 04:03:27', '2022-04-03 04:03:27'),
(68, 80, 'pzEhPbeaVcq\'s Team', 1, '2022-04-16 08:34:07', '2022-04-16 08:34:07'),
(69, 81, 'gROeXuCDdWc\'s Team', 1, '2022-04-30 17:05:23', '2022-04-30 17:05:23'),
(70, 82, 'sneha\'s Team', 1, '2022-05-06 10:14:12', '2022-05-06 10:14:12'),
(71, 83, 'sneha7@gmail.com\'s Team', 1, '2022-05-06 10:17:01', '2022-05-06 10:17:01'),
(72, 84, 'ZxqOIQTYLfuRsNG\'s Team', 1, '2022-05-25 19:58:53', '2022-05-25 19:58:53'),
(73, 85, 'UQOvncrNLytG\'s Team', 1, '2022-06-22 16:17:46', '2022-06-22 16:17:46'),
(74, 86, 'Rptaruwona@outlook.com\'s Team', 1, '2022-07-04 09:21:32', '2022-07-04 09:21:32'),
(75, 87, 'Reynold\'s Team', 1, '2022-07-04 09:22:42', '2022-07-04 09:22:42'),
(76, 88, 'IgYHDNkwaALc\'s Team', 1, '2022-07-20 21:22:11', '2022-07-20 21:22:11'),
(77, 89, 'nNADLJyhQcOoK\'s Team', 1, '2022-07-26 09:21:42', '2022-07-26 09:21:42'),
(78, 90, 'VpfXsgtCa\'s Team', 1, '2022-08-06 13:35:57', '2022-08-06 13:35:57'),
(79, 91, 'fwEbAFhKsNHWk\'s Team', 1, '2022-09-01 13:51:57', '2022-09-01 13:51:57'),
(80, 92, 'IwJKACPQLyrfe\'s Team', 1, '2022-09-05 18:32:19', '2022-09-05 18:32:19'),
(81, 93, 'eDdpwMiShuX\'s Team', 1, '2022-09-30 23:30:46', '2022-09-30 23:30:46');

-- --------------------------------------------------------

--
-- Table structure for table `team_invitations`
--

CREATE TABLE `team_invitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payable_id` bigint(20) UNSIGNED NOT NULL,
  `wallet_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('deposit','withdraw') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(64,0) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `payable_type`, `payable_id`, `wallet_id`, `type`, `amount`, `confirmed`, `meta`, `uuid`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 6, 'withdraw', '-99', 1, NULL, 'dac53b11-6e41-4902-822c-027e3b6b99de', '2021-05-29 15:24:57', '2021-05-29 15:24:57'),
(2, 'App\\Models\\User', 27, 3, 'withdraw', '-99', 1, NULL, 'f8e0b41e-5057-4c0f-9953-12a0dd29eb73', '2021-05-30 06:51:07', '2021-05-30 06:51:07'),
(3, 'App\\Models\\User', 49, 10, 'deposit', '105', 1, NULL, 'e7dafaaf-cb6e-49e1-bd90-38b8b06ce24c', '2021-05-30 15:56:14', '2021-05-30 15:56:14'),
(4, 'App\\Models\\User', 50, 11, 'deposit', '105', 1, NULL, 'eae23808-a39f-469d-89a4-5e7a205201a2', '2021-05-31 07:12:23', '2021-05-31 07:12:23'),
(5, 'App\\Models\\User', 51, 12, 'deposit', '105', 1, NULL, '2a585f8f-144e-47cc-923f-00e61384d1bc', '2021-05-31 08:49:41', '2021-05-31 08:49:41'),
(6, 'App\\Models\\User', 52, 13, 'deposit', '105', 1, NULL, 'af3c1ddb-bad0-4d5c-992a-3dc5d68e8774', '2021-05-31 08:50:39', '2021-05-31 08:50:39'),
(7, 'App\\Models\\User', 1, 1, 'withdraw', '-99', 1, NULL, '2d51866b-32cf-425b-99a2-3fadce6fabb7', '2021-05-31 11:29:37', '2021-05-31 11:29:37'),
(8, 'App\\Models\\User', 1, 1, 'withdraw', '-99', 1, NULL, 'b4cc4fd3-df62-42c4-852c-087b823c5278', '2021-05-31 11:34:30', '2021-05-31 11:34:30'),
(9, 'App\\Models\\User', 53, 18, 'deposit', '105', 1, NULL, 'cb88c334-ed0c-45cb-94b9-f0bc87925fb9', '2021-05-31 19:52:11', '2021-05-31 19:52:11'),
(10, 'App\\Models\\User', 54, 19, 'deposit', '105', 1, NULL, '344e03a0-a6ee-4c55-9ada-18c153ade85a', '2021-06-01 15:04:11', '2021-06-01 15:04:11'),
(11, 'App\\Models\\User', 7, 9, 'withdraw', '-99', 1, NULL, '640e7dba-c5f9-4363-a64c-0df689a0b23b', '2021-06-02 11:33:24', '2021-06-02 11:33:24'),
(12, 'App\\Models\\User', 58, 21, 'deposit', '105', 1, NULL, '5691ba38-fee8-4811-8b91-a58528a4c563', '2021-06-03 11:12:32', '2021-06-03 11:12:32'),
(13, 'App\\Models\\User', 7, 9, 'withdraw', '-99', 1, NULL, 'c41b7ecf-0d45-4a4c-8845-32bf5b38eb9f', '2021-06-11 13:41:20', '2021-06-11 13:41:20'),
(14, 'App\\Models\\User', 7, 9, 'withdraw', '-99', 1, NULL, '8d0e7348-e280-469a-ae0a-29d9c8c74f43', '2021-06-24 07:16:24', '2021-06-24 07:16:24'),
(15, 'App\\Models\\User', 64, 26, 'deposit', '105', 1, NULL, '831e2edf-dbf8-4bc0-be73-cbbe417e0f99', '2021-06-24 08:10:39', '2021-06-24 08:10:39'),
(16, 'App\\Models\\User', 65, 27, 'deposit', '105', 1, NULL, 'b4fb9e4e-55b4-4b35-b87a-61952eb2299f', '2021-06-24 12:03:29', '2021-06-24 12:03:29'),
(17, 'App\\Models\\User', 66, 28, 'deposit', '105', 1, NULL, 'aecd2127-7c82-4ba6-8804-20b7991d8b72', '2021-06-24 12:56:18', '2021-06-24 12:56:18'),
(18, 'App\\Models\\User', 67, 29, 'deposit', '105', 1, NULL, '5714d595-48b1-404a-a9e1-9f6499dcde29', '2021-06-24 15:01:56', '2021-06-24 15:01:56'),
(19, 'App\\Models\\User', 68, 30, 'deposit', '105', 1, NULL, 'b0bbce1e-1dc3-44d3-863e-8f8925f17119', '2021-06-30 16:24:53', '2021-06-30 16:24:53'),
(20, 'App\\Models\\User', 69, 31, 'deposit', '105', 1, NULL, '73118a23-b7d0-4b53-b625-a2f162d31a1c', '2021-07-05 16:26:00', '2021-07-05 16:26:00'),
(21, 'App\\Models\\User', 71, 34, 'deposit', '105', 1, NULL, '36794746-1f09-471d-a156-a779b2e74e1f', '2021-07-23 15:53:49', '2021-07-23 15:53:49'),
(22, 'App\\Models\\User', 72, 35, 'deposit', '105', 1, NULL, 'd7b9c8b3-fa07-42f2-ad17-8ad94ed616fd', '2021-07-28 08:08:23', '2021-07-28 08:08:23'),
(23, 'App\\Models\\User', 73, 37, 'deposit', '105', 1, NULL, 'a076a8fc-de76-492e-9066-6f98097e0bf8', '2021-11-22 11:25:00', '2021-11-22 11:25:00'),
(24, 'App\\Models\\User', 74, 38, 'deposit', '105', 1, NULL, '273e4509-737f-4645-9f53-4d2a35c19850', '2021-12-04 14:13:49', '2021-12-04 14:13:49'),
(25, 'App\\Models\\User', 75, 39, 'deposit', '105', 1, NULL, '9b07fa67-8b51-45f4-86ab-f257df0bd557', '2021-12-22 10:33:35', '2021-12-22 10:33:35'),
(26, 'App\\Models\\User', 76, 40, 'deposit', '105', 1, NULL, '6820dbe7-affe-42e0-97d2-97e28ca1d621', '2021-12-28 21:38:03', '2021-12-28 21:38:03'),
(27, 'App\\Models\\User', 77, 41, 'deposit', '105', 1, NULL, 'a11f0b8a-03d5-4e02-9f1c-ed2e26706950', '2022-03-07 22:18:33', '2022-03-07 22:18:33'),
(28, 'App\\Models\\User', 78, 42, 'deposit', '105', 1, NULL, '12f768be-218c-4b74-a7fe-2ef77e29cc06', '2022-03-15 06:26:12', '2022-03-15 06:26:12'),
(29, 'App\\Models\\User', 79, 43, 'deposit', '105', 1, NULL, '26e5be98-5db5-4155-827a-8ae04535449c', '2022-04-03 04:03:27', '2022-04-03 04:03:27'),
(30, 'App\\Models\\User', 80, 44, 'deposit', '105', 1, NULL, '70a1802c-f3e4-4680-9baa-d055cf42f3c0', '2022-04-16 08:34:09', '2022-04-16 08:34:09'),
(31, 'App\\Models\\User', 81, 45, 'deposit', '105', 1, NULL, 'eb1c09b3-d55f-4982-9886-57b578d0f421', '2022-04-30 17:05:25', '2022-04-30 17:05:25'),
(32, 'App\\Models\\User', 82, 46, 'deposit', '105', 1, NULL, 'fd93e23c-e6a8-4849-b747-4ec71fa1a977', '2022-05-06 10:14:14', '2022-05-06 10:14:14'),
(33, 'App\\Models\\User', 83, 47, 'deposit', '105', 1, NULL, 'e82b959a-d91b-46f4-913c-4c6e670262c3', '2022-05-06 10:17:01', '2022-05-06 10:17:01'),
(34, 'App\\Models\\User', 84, 48, 'deposit', '105', 1, NULL, 'bed00a21-94d0-4fa6-bc3d-6ce53fdd34d4', '2022-05-25 19:58:54', '2022-05-25 19:58:54'),
(35, 'App\\Models\\User', 85, 49, 'deposit', '105', 1, NULL, '9e3ed71a-744e-4e34-b57d-1fae0c937c86', '2022-06-22 16:17:48', '2022-06-22 16:17:48'),
(36, 'App\\Models\\User', 86, 50, 'deposit', '105', 1, NULL, 'bd30a88f-fa8e-44d6-8cc9-70751294e89c', '2022-07-04 09:21:33', '2022-07-04 09:21:33'),
(37, 'App\\Models\\User', 87, 51, 'deposit', '105', 1, NULL, '62d2da37-d5c5-4a37-8460-44a226c51bd1', '2022-07-04 09:22:42', '2022-07-04 09:22:42'),
(38, 'App\\Models\\User', 88, 52, 'deposit', '105', 1, NULL, 'fe3e1478-a18b-4f30-af0d-932bab185cf6', '2022-07-20 21:22:13', '2022-07-20 21:22:13'),
(39, 'App\\Models\\User', 89, 53, 'deposit', '105', 1, NULL, '01fb163c-e8b0-4929-878f-ecf1ce47ee25', '2022-07-26 09:21:44', '2022-07-26 09:21:44'),
(40, 'App\\Models\\User', 90, 54, 'deposit', '105', 1, NULL, '9244ab79-8fee-4bd2-ae2c-9c72368b65b7', '2022-08-06 13:35:58', '2022-08-06 13:35:58'),
(41, 'App\\Models\\User', 91, 55, 'deposit', '105', 1, NULL, '8e3e9d28-ce69-4be4-b1d8-dc52c87dd77f', '2022-09-01 13:51:59', '2022-09-01 13:51:59'),
(42, 'App\\Models\\User', 92, 56, 'deposit', '105', 1, NULL, 'd42b3bc0-e4c6-40f8-80fa-9fff6b30227d', '2022-09-05 18:32:23', '2022-09-05 18:32:23'),
(43, 'App\\Models\\User', 93, 57, 'deposit', '105', 1, NULL, '0b6cb9ae-cbd5-4470-a886-e535bafd890e', '2022-09-30 23:30:48', '2022-09-30 23:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) UNSIGNED NOT NULL,
  `to_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('exchange','transfer','paid','refund','gift') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'transfer',
  `status_last` enum('exchange','transfer','paid','refund','gift') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_id` bigint(20) UNSIGNED NOT NULL,
  `withdraw_id` bigint(20) UNSIGNED NOT NULL,
  `discount` decimal(64,0) NOT NULL DEFAULT 0,
  `fee` decimal(64,0) NOT NULL DEFAULT 0,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 1,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `role`, `gender`, `last_name`, `address`, `phone`, `city`, `state`, `country`, `avatar`, `provider`, `provider_id`, `access_token`) VALUES
(1, 'Tinashe Kundai', 'tinashekmakarudze@gmail.com', '2021-04-23 07:00:52', '$2y$10$ezPjlmn/Kw.zaMjIbr8/7Ov2RXA3DSdGZMar6NCz0CaeiADYpY9ii', NULL, NULL, 'mw3QSFW5kJzpi2SOU8DcucdzD4PzbuBOk8aqgzqSA1sa9XMbQ8UvSw9DbUlO', NULL, 'profile-photos/EY7z6hKNWuDCVYB88Dd8HpMmEzIX12anvrKv7XPO.jpg', '2021-04-12 16:05:03', '2022-04-18 19:02:43', 3, NULL, 'Makarudze', '43', -10, '34', NULL, '43', 'https://lh3.googleusercontent.com/a-/AOh14GiA5x5bZUyKMKhwbXAY51hicp7D84mcNrtlOvkeFw=s96-c', 'google', '104192332917801469177', 'ya29.A0ARrdaM9VV1y8PtDcG6QNxX65g7TMujXm0aELfT0c21zCjjRsMy2lk6ucnrcAKzJG3XuqfkAdyAzub-4YzF0LkIaGId1n2pHJbT09TrEogGM1PHzJpYZ3tEwzDbA4dELtV3whjnHTb9TIB_uRsmn9gCt9QfxU9NA'),
(2, 'Tinashe', 'tinashekupara6@gmail.com', '2021-05-09 13:02:51', '$2y$10$nruIy/Dr7chwGJzWEtBRae7m44rN8Aqzd3I5n/mU2rEQsDT78Lmii', NULL, NULL, 'nvTDrx5vVKURsR2YYiXNpMyG6BYgRT1hPsKxr5wFRw4HeGKW38ReE06bTBk4', NULL, NULL, '2021-04-14 17:39:33', '2021-06-25 10:32:49', 3, NULL, 'Kupara', '456 The Grange, Chisipite', 784582351, 'Harare', NULL, 'ZW', 'https://lh3.googleusercontent.com/a/AATXAJyHIPtoOle6mP0kyk0Sh7h13lH6qGNGv2huQfuo=s96-c', 'google', '107848348764013110273', 'ya29.a0AfH6SMA6USNiOgkXOU4R9rG7Ir7o8yPkqa4LN8_HDHeGEJecMzhzKu_gerS-z9I-L8-2odDQILPnrCqfhpNjtu_s_elcgYASA06gbKlZikFmLKFNQZGj4weg_4ongPS-kuMsZhV9sWwLN6HdzqkA9vUG3cdzxx4'),
(3, 'nyasha', 'nyashatmusasa@gmail.com', NULL, '$2y$10$CWY0csjHq2ftExvY8MhZteaLuwEn0npVAnquWnvrs6cr/1ZnFpUL.', NULL, NULL, NULL, NULL, NULL, '2021-04-14 17:46:07', '2021-04-14 17:46:07', 1, NULL, 'musasa', '78 Unna rd', 774615156, 'Harare', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(4, 'tatenda', 'tatendamakarudze41@gmail.com', '2021-06-24 07:24:34', '$2y$10$eLYIYRJVaOnzwVJ9nVjoOeJB1FRlVI4XBx7CbQXLsylDVPzlvuqJu', NULL, NULL, 'RGN9xKqt0LRTLBI4TaVgZAWOPnydH8zT9sUIuJjJju5BSNze2Lvvz3AJeIWq', NULL, NULL, '2021-04-15 14:29:02', '2021-06-24 07:24:34', 1, NULL, 'makarudze', '31 Northwearld Road,Bluffhill', 263773971806, 'Harare', NULL, 'Zimbabwe', 'https://lh3.googleusercontent.com/a/AATXAJyodwSiPfcnRBjZtr1TyBt1mwA2fJp22btvMFZG=s96-c', 'google', '115544729038115528005', 'ya29.a0AfH6SMCRnkVxDUgeh0PT7-9PAW9rwJ1IOHzMbexM6CG3HWkFUL8bXIHsskuttDzBwFzoTyq6Vxu4IX-Hwrsy6Hq5kZ_TCRrNz70vtl4mt3WoUvGj-Je3LxaFQgXG_BNlq4BapfkRbE4TuOp3jSmLbanbFwvH'),
(5, 'Isheanesu Gift', 'punungweanesu@gmail.com', '2021-05-09 12:11:48', '$2y$10$umMFR3xQHmyznAFF9lmaOOt4.EhbIxe799OjGNj4LZeDXMC.DSYMG', NULL, NULL, '8eHs82nf2iv4rke8CalrrVKaoMJgdRLGUbGcW9bNEx97vfzO0wF5Lx1Q824e', NULL, 'profile-photos/EY7z6hKNWuDCVYB88Dd8HpMmEzIX12vrKv7XPO.jpg', '2021-04-17 17:58:46', '2021-05-09 12:11:48', 3, NULL, 'Punungwe', '2195 Masotsha Ndlovu, Ruwa', 263777255987, 'Harare', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(6, 'Varaidzo', 'variesamie@gmail.com', NULL, '$2y$10$2OxqlKQ7Z54YBGtvflGfgO3LVDA.X684FyClWf3mfuavncO1JTDhC', NULL, NULL, NULL, NULL, NULL, '2021-04-17 18:00:17', '2021-04-17 18:00:17', 1, NULL, 'Samantha', '61', 777881051, 'Harare', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(7, 'Tatenda', 'tatendak60@gmail.com', '2021-05-15 19:24:05', '$2y$10$8BccTcOhvFPladLRNNN5duwV0uNJJYWNMQQzoTZIYeN0NzNTZIYXu', NULL, NULL, '869oZHhOqeEO2ykWd8ACoLEPYt8mB7CnH6P9hLrUyU7qzVcehr8PXyKuZgPH', NULL, NULL, '2021-04-17 18:10:17', '2021-06-02 11:32:04', 3, NULL, 'Kwaramba', '76  Henley Drive Waterfalls', 785281614, 'Harare', NULL, 'Zimbabwe', 'https://lh3.googleusercontent.com/a/AATXAJxCujxjrvNa0TsUr64y3byM46qXwul8YYnjS9tL=s96-c', 'google', '114792447540468818820', 'ya29.a0AfH6SMAxE5qev-5QP8dM4eUFmeKYW-MT-V7CX3yRpqOhjtpjuxXwuY2ntXDLwgzc6OVXQH7rt2Hlmy6fuSnkcraOmYDoOW_SYVFGzSl3mWEVxtXSsfPpI-epjpTaFvw20RhKTN1UGyvS1rslT95tzepi8fS_'),
(8, 'Takuranenhamo', 'boyrocket388@gmail.com', NULL, '$2y$10$o.kJhR6lwaX72/ZROGgjYu99MTwsxMuCsTshuh5onkZzAxHvbZvKi', NULL, NULL, NULL, NULL, NULL, '2021-04-17 19:32:51', '2021-04-17 19:32:51', 1, NULL, 'Musadamari', '66 Kingsway Avenue, Auckland Park', 636307348, 'Johannesburg', NULL, 'South Africa', NULL, NULL, NULL, NULL),
(9, 'Amandlaenkosi', 'samandlaenkosi@gmail.com', NULL, '$2y$10$aEiUcL6EZA.n9.WLLPvjROG9QQYz5oXH5KfUCWXIOeEBlHoeE/1uK', NULL, NULL, NULL, NULL, NULL, '2021-04-17 20:44:43', '2021-04-17 20:44:43', 1, NULL, 'Sitotombe', '151 Brooke Crescent', 738392805, 'Harare', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(10, 'Lee', 'lnyadenga@gmail.com', NULL, '$2y$10$Bpbd819n9TVqzKDHKvuDTOH4MB7thhbV60NhBYNE0txi0ividxGEC', NULL, NULL, NULL, NULL, NULL, '2021-04-17 23:08:06', '2021-04-17 23:08:06', 1, NULL, 'NYADENGA', '7648 Glen Norah C', 713148569, 'Harare', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(11, 'Annie Tinashe', 'nashedzvinah@gmail.com', NULL, '$2y$10$gpVrFOc6aKXZcgFUmPbgxu0rb1ALUzefob/K8n6Yoxvp7x11mBr0C', NULL, NULL, NULL, NULL, NULL, '2021-04-18 04:30:01', '2021-04-18 04:30:01', 1, NULL, 'Dzvinamurungu', '24287 unit P, Seke', 777904297, 'Chitungwiza', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(12, 'Priscah', 'priscamususa@gmail.com', NULL, '$2y$10$0CuGHc4HzqlZnS64ZUSuPOWzjqlVvTrVCdijkhIENKPpRrzMrjTxy', NULL, NULL, NULL, NULL, NULL, '2021-04-18 06:11:52', '2021-04-18 06:11:52', 1, NULL, 'Mususa', '4wisteria ave', 772783732, 'Harare', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(13, 'Anderson', 'mupambwaanderson@gmail.com', '2021-04-23 16:51:38', '$2y$10$krEmZYp8CsrwPNNc4V0Lz.qBN/0ceGstkP.Kzcj4uPQScaD/NEFwe', NULL, NULL, NULL, NULL, NULL, '2021-04-23 16:50:55', '2021-04-23 16:51:38', 1, NULL, 'Mupambwa', '1 main road', 27641484406, 'Cape town', NULL, 'South Africa', NULL, NULL, NULL, NULL),
(14, 'samard', 'smchikodza@gmail.com', '2021-04-28 08:55:18', '$2y$10$6FnigANnMC9C9.wKh10XzelrerMmD7i4gdX6fDO7MWwSryoW0pAqu', NULL, NULL, NULL, NULL, NULL, '2021-04-28 08:54:43', '2021-04-28 08:55:18', 1, NULL, 'Chikodza', 'gv', 773239135, 'glen view', NULL, 'ZW', NULL, NULL, NULL, NULL),
(15, 'Victor', 'victormunya@gmail.com', NULL, '$2y$10$6XJZD0czyOvayCA9EGcaFedn8k1BIASMDWOAg9.suMKQWiZw3MBxu', NULL, NULL, NULL, NULL, NULL, '2021-04-28 09:04:28', '2021-04-28 09:04:28', 1, NULL, 'Mulolo', '18352 Kingsdale, Norton', 774037984, 'Harare', NULL, 'ZW', NULL, NULL, NULL, NULL),
(16, 'fEazeswmKAvp', 'safcommercialthreat@gmail.com', NULL, '$2y$10$4KsX03Fz5Fkw3yNG0QJEGu6q2PemCT6/w7cxdPP234PSIKrSLIPbe', NULL, NULL, NULL, NULL, NULL, '2021-04-29 13:30:24', '2021-04-29 13:30:24', 1, NULL, 'UXhdrCauV', 'BaoqdYsGNFVvTtHm', 4195140974, 'PqbEFzhfUVOCcIM', NULL, 'UQFPRaGzXMshiJ', NULL, NULL, NULL, NULL),
(17, 'Hazel', 'hazelchamz@gmail.com', '2021-05-01 08:17:19', '$2y$10$k37.9tggA2iCTbrzmRenNuWyId/SNF0KK3nK/FNkrabfEj2leSNBG', NULL, NULL, NULL, NULL, NULL, '2021-05-01 08:14:06', '2021-05-01 08:17:19', 1, NULL, 'Chaminuka', 'Glenlorne', 784319337, 'Harare', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(18, 'Anesuishe', 'anesuishe34@gmail.com', '2021-05-10 12:14:29', '$2y$10$rzHB1WzAOd4BygQh.6ehf.uV/NvRl4XWaEWSqD0ZfXuQSjAfEONSa', NULL, NULL, '2groaI5PMqBG1AUc2xBSkwMpRRQQRtT7hIVsmx2DkIWVSdwQ2xNdYXQkvHRQ', NULL, NULL, '2021-05-10 12:14:04', '2021-05-10 12:14:29', 1, NULL, 'Murapa', '2905 Hayhill park, Glen Lorne', 784624206, 'Harare', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(19, 'Betty', 'beemadhoro@gmail.com', '2021-05-13 17:45:12', '$2y$10$j5Vxz.CQLRsTf4x92Fk1s.ywQNXDPQyD1tVIYRVbblfepzRSt7tyK', NULL, NULL, 'KqmniJ0GAbw2fBFMfJRUnSLvV7LqlIruIKTQehjiTPcJm6ybH4fZhtY4vGrA', NULL, 'profile-photos/aHDr30Ybg9kY96ClxJqVR9EdB6ynHazOpls6ujTE.jpg', '2021-05-13 13:43:02', '2021-05-15 06:18:20', 1, NULL, 'Madhoro', 'corner Leopold Takawira and Jason Moyo. PaCareer Management Center', 773550779, 'HARARE', NULL, 'ZIMBABWE', NULL, NULL, NULL, NULL),
(21, 'Kupara', 'joelkupara@gmail.com', '2021-05-13 17:42:53', '$2y$10$nruIy/Dr7chwGJzWEtBRae7m44rN8Aqzd3I5n/mU2rEQsDT78Lmii', NULL, NULL, 'KQkH5dkjyTVDseaRrNbKvKbn9ol1mhtwYUPOctuZjaKh3ZJsDwXp5odXxSHW', NULL, NULL, '2021-05-13 17:41:05', '2021-05-13 17:42:53', 1, NULL, 'Joel', '9994 Kuwadzana', 779968129, 'Harare', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(22, '100%_handmade_bags_and_accessories', 'ruemadanhi@gmail.com', '2021-05-14 16:49:12', '$2y$10$ygoSplYD0/oE8qiD/9wu4uBU3pyTgqjSeXU/N53M0hH3fc6CNTnv.', NULL, NULL, 'z8wXeG9eEAOEJABBkHJo3OmF0z3NKRFJJhc96TXZSRDDNU6Xx3mC4OKjFyDO', NULL, NULL, '2021-05-14 16:47:50', '2021-05-17 17:11:30', 1, NULL, 'Madanhi', '23572 C Dauramanzi Zimre Park Ruwa', 719415739, 'Harare', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(23, 'Sithokozile', 'sithokozilemasuku0@gmail.com', '2021-05-15 08:03:47', '$2y$10$o3IjrbUnZ32I.rQ0mefEfOFI8gQ/NPXbZzvx8dKdSSq5MeaibXVBm', NULL, NULL, NULL, NULL, NULL, '2021-05-15 08:03:03', '2021-05-15 08:03:47', 1, NULL, 'Masuku', '3808 Old Windsor', 772556901, 'Harare', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(24, 'Mudiwa Anthony', 'mudiwachax@gmail.com', '2021-05-15 09:08:42', '$2y$10$sJ9EbclRKmO9j3tIoenCKONBlNwDAYnDw.hD7TKc82zxjRGc6XxQi', NULL, NULL, 'W7i4iOCBHIW5AJxWna51K0veuoiVEeiU3V8TcvzfZG7ThefMpcC0Yv20nyhc', NULL, NULL, '2021-05-15 09:06:43', '2021-05-15 09:08:42', 1, NULL, 'Chakumhara', '2 Kenny hill 7', 1133654731, 'Kuching', NULL, 'Malaysia', NULL, NULL, NULL, NULL),
(25, 'Brenda', 'brendafashionglamour@gmail.com', '2021-05-15 09:31:04', '$2y$10$ezPjlmn/Kw.zaMjIbr8/7Ov2RXA3DSdGZMar6NCz0CaeiADYpY9ii', NULL, NULL, 'eO0WXGnfjOwGpTUljYnRApsXMRaz2MnhOMdDsxUtKSyM4ytT4Cai2PpLKM6z', NULL, NULL, '2021-05-15 09:24:32', '2021-06-24 00:00:44', 1, NULL, 'Choto', '2193 Glen Norah A', 771120430, 'Harare', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(26, 'Ruth', 'mangwayanars@gmail.com', '2021-05-15 10:08:42', '$2y$10$a.I.UmXsjBD/Gs.UWYG/X.FV/IPkz17zhzQ2x3gEoeJth84srGcTm', NULL, NULL, 'l2rccT0o728LOec4uM3OTbFFWqPw9gDLSHB8D9RmElUubgHs0cW3yBpFvxcw', NULL, NULL, '2021-05-15 10:07:50', '2021-05-15 10:08:42', 1, NULL, 'Mangwayana', 'Harare', 774823567, 'Harare', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(27, 'Stanford Junior Takura', 'sjnrzhuwao@gmail.com', '2021-05-15 20:43:57', '$2y$10$yFQgVm4xsUCkuvM4pcc/BORVyZPl2LalXSZJMGyPgNzmKgDFDxJnG', NULL, NULL, 'FjKdY1YfCzzd9WPGi3xWcj9JKYsaxZIYtZvqf9JUzjT27bIA91zfqkAapXE0', NULL, 'profile-photos/U08bNIkAd5KFfmCdRai7IFZa3qGly8KutYGHH3QC.png', '2021-05-15 20:43:09', '2021-05-30 18:56:59', 3, NULL, 'Zhuwao', '36-21st Cresent Warren Prak 1', 772209437, 'harare', NULL, 'Zimbabwe', 'https://lh3.googleusercontent.com/a-/AOh14GgoZIJx1VVz_krMIL7jOsf_rEncoBKrXbvLkaFtHA=s96-c', 'google', '102985601084019283069', 'ya29.a0AfH6SMB2gA8jXUJodsb6InHKGVBRVpGXziEYfpgXE9Ro52JJr3VcET3Aj0-VDv61gs8G2NAlTPzJNffNN0D-VurtAa5kgMy2sjnSwVO5YtZVYBHU1C-DbOxDeJgieJDuPrviT10gt8ehluFf0XXj-EaFEu8i'),
(28, 'Tjacobs', 'mushangwetj@gmail.com', '2021-05-16 03:19:30', '$2y$10$16jwiuSiGkioapPQNfUNmebhJo8CS6Wq.f3ALKoj1unBXFjdbBbs2', NULL, NULL, 'q47XNukOcelj0eXex2vcMfqgDhNjV13xv6qbdF1w749XlKSWWxLAbiHWO3IY', NULL, NULL, '2021-05-16 03:17:53', '2021-05-16 03:19:30', 1, NULL, 'Mushangwe', '144 seke road', 719953620, 'Harare', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(29, 'Lawrenzo', 'nlchikuvadze1620@gmail.com', '2021-05-16 08:26:46', '$2y$10$1116Ni8SL6JpVqe9ICwdPuQks/0bNi6ptzQcNIoA/ADFgm9ZtJQVK', NULL, NULL, 'eHKrFj82REOlEPDOTuD12AViYLhz9OIyzskqlsTrROHBxtIqZmDExf0B1LpR', NULL, NULL, '2021-05-16 08:25:05', '2021-05-16 08:26:46', 1, NULL, 'Chikuvadze', '7149 Zimre Park', 783969040, 'Harare', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(30, 'Blessings', 'beemadz7@gmail.com', '2021-05-16 12:37:53', '$2y$10$krpFX1.K3uLob6bWvB4ZMeivQEznLiFcjTNkbtAWattnypdI3zsry', NULL, NULL, '4uyM6SOAoOUl7eeucWhXBHK8EA3WTCztGRS2zby5BtWnFy90hDzaS2xjolC9', NULL, NULL, '2021-05-16 12:37:10', '2021-05-16 12:37:53', 1, NULL, 'Madzivadondo', '2705 Mahogany Circle, Marlborough', 777615068, 'Harare', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(31, 'vagTrybFxMDGIZi', 'adlestunlyxn@gmail.com', NULL, '$2y$10$j7BQTi4Zb4GGfvpOvsDr1OJGVslyfPgCFSiX30BLDRHd0JGemjMwy', NULL, NULL, NULL, NULL, NULL, '2021-05-17 18:36:06', '2021-05-17 18:36:06', 1, NULL, 'orHOzPJKga', 'EONJUQFft', 9518710455, 'tVYnHONqmerQad', NULL, 'PRInmACHutiBLQSo', NULL, NULL, NULL, NULL),
(32, 'Omega', 'omegaejaricha@gmail.com', '2021-05-19 07:46:42', '$2y$10$qHA4pmF4pGDnizC2jQJmZOkACeRTq3GzD.m.b/QZlpUw03l1lOzmu', NULL, NULL, NULL, NULL, NULL, '2021-05-19 07:44:54', '2021-05-19 07:46:42', 1, NULL, 'Eben', '1227-83 Harare Drive Hatfield', 732376337, 'Harare', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(33, 'Sue', 'sue.chaduka@gmail.com', '2021-05-20 15:30:06', '$2y$10$K0g/y6xoe.Jya8S/t3X57O7vkeTdMbyhcXxzyDTqLnRakWGLhmkNW', NULL, NULL, 'pnhFFBVh08J9GQku4zqn45JfqxTR6KP97fHL9Qs1yPn7BDgQoyTENtCUmAmi', NULL, NULL, '2021-05-20 15:29:37', '2021-05-20 15:30:06', 1, NULL, 'Chigorimbo', '146 Rekayi Tangwena Drive, Greenside', 263773972003, 'Mutare', NULL, 'ZW', NULL, NULL, NULL, NULL),
(34, 'Delight', 'delightich05@gmail.com', '2021-05-20 15:43:07', '$2y$10$uUKBNiT5nvqILgLs1qlbxuP1yrMi/7562wFgu2w4UcDmJbmVzwnMK', NULL, NULL, 'iQdv8WZ33wpIrSfU3lrLdbeaRPwo2OhZm1zhLgo0dSCe5vyDaBX8jzGlPSab', NULL, NULL, '2021-05-20 15:29:42', '2021-05-20 15:43:07', 1, NULL, 'Tichaona', '14726 Phase 1 Damofalls Park Ruwa', 774219182, 'Harare', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(35, 'Simon', 'simonn900@gmail.com', '2021-05-21 06:16:04', '$2y$10$nHgydE2QRdV3K.I6VEBM7uyyEvPcw1ayd29gFw8MN.9yRcxGctNJi', NULL, NULL, NULL, NULL, NULL, '2021-05-21 06:14:19', '2021-05-21 06:16:04', 1, NULL, 'Muradzikwa', '44 Kilwinning Hatfield', 263773463981, 'Harare', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(36, 'Tatenda', 'tchaks94@gmail.com', '2021-05-21 06:18:26', '$2y$10$7obs24BvecKWIC2/8ZsdDe1jY4c9s8BtKdw81lCwH/lhzCQ0c1W96', NULL, NULL, 'hluZkU9jRNDOKFmc1WlrQHyQ1jZHA0gVCJxXbH4DZM2wuugzuSgxbfSVRDyY', NULL, NULL, '2021-05-21 06:17:09', '2021-07-16 18:12:46', 1, NULL, 'Chakanetsa', '15', 779448254, 'Mufakose harare', NULL, 'Zimbabwe', NULL, NULL, NULL, NULL),
(37, 'Ishe', 'ishe@kamusika.com', '2021-05-22 18:06:01', '$2y$10$dWXxAmNtsj0XKxcNfOk2SusfNxEQ9PSqLeON3UJ9YQnCHsNSOdzuy', NULL, NULL, 'KWrUjpRKXqqlneSsonYnppCL9l4wUyFRKXWyzxltm7qrTkdcRIeuTIl3dM4Z', NULL, NULL, '2021-05-22 18:03:28', '2021-05-22 18:06:01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'Nashe machende', 'nashemachende@gmail.com', '2021-05-23 14:40:56', '', NULL, NULL, 'VtKBTNEsUnB0Gq7B8C5rgMdUGtA6PQ4HWsWVBOLoTAzkpCWrjftZzfhmkusx', NULL, NULL, '2021-05-23 14:39:46', '2021-05-23 14:44:46', 1, NULL, NULL, 'harae', 263784582351, 'harare', NULL, 'Zimbabwe', 'https://lh3.googleusercontent.com/a-/AOh14GhFwsm1pNhZ1YMvFy9iwx2SK4Y2kB4-EcDHk5l_ag=s96-c', 'google', '116166479967165304106', 'ya29.a0AfH6SMAeEl1gqgWAzsnQirMPfUW0TDSSKdQVXGfPzzc6q4cncVISdNduIt9E4hdrnb8CpxWCnUi5MbzeTFcWsFPYRrRYTEDuE74khADhqsLMoauVd3fzpzFpGseBEwa_LX8h96MBApZp_2hdHUTo41dIq11a'),
(39, 'Oliver Chivende', 'oliverchivende@yahoo.com', NULL, '$2y$10$9kOgGgSD7DEzU9BKXISCruLmb9fcRNOH3XgTPPT9.Ok6BKhOiQu4W', NULL, NULL, NULL, NULL, NULL, '2021-05-23 17:50:56', '2021-05-23 17:50:56', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'Maria', 'mariamchipanera@gmail.com', NULL, '$2y$10$jTjyMasx/u/KUv2tH/pZdew6MeTQqoPjhfncHfFk7jmf6Cdm2udAe', NULL, NULL, NULL, NULL, NULL, '2021-05-24 13:03:29', '2021-05-24 13:03:29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'Sol', 'ronymberi@gmail.com', '2021-05-24 17:18:10', '', NULL, NULL, 'iFk9834yhzS2rvVa26nuTLqGrUlsvrVJ1L1aKoVU8l9OpqxAqaPEYqmQt46q', NULL, NULL, '2021-05-24 17:12:54', '2021-05-27 12:21:58', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a/AATXAJzOsHkSetVH1-77usDbcftFs2MQXfFTfVPEsKKS=s96-c', 'google', '103872087241572529464', 'ya29.a0AfH6SMBjzRHgRRaL-l2zAxLpnoJr-M4eWQIzKXN5U7YjwLW5aV7UiIOilvLOzHyvSGyh8b5Zn7UN8D3-kOarmIVsdyN2cCBoc1IzdTlfZAQiNNwiPaQl3HTTrCMEwbVrrBF6E4rTMTA-AS5pPa64ahAokrsiwg'),
(42, 'MOLEEN ZHUGA', 'moleenzhuga6@gmail.com', '2021-05-26 09:32:55', '$2y$10$kgO4r8BXMeFFNyrHvtzHgey2Sz5kIVwYTb5.GIdNo.kZT81dHs6zG', NULL, NULL, '861BkxrGLLsILdIVvqm8K5fZ67hcct1SkknWX1b6EPO8YoBe0ptb08yZ79O7', NULL, NULL, '2021-05-26 09:31:11', '2021-05-26 09:32:55', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'Ian Magwada', 'ianmagwada@gmail.com', '2021-05-27 05:18:26', '$2y$10$8zrOO6v8bdZip/YjHEEhpetOdKO16yJR7RTV0oKnquvaFCX5dFFuu', NULL, NULL, 'Q62QBGTNZibdIpJZNBeQt3dZzDwRVeNOSrXZfaVvqpOIlgdFkTzpieEs7upe', NULL, NULL, '2021-05-27 05:13:46', '2021-06-25 09:44:55', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a-/AOh14Ghnzy9UeuhdVm7OY0vU7f4DOopsfm1pdWLz4gk=s96-c', 'google', '101774407400828103635', 'ya29.a0AfH6SMCG9fNI0CilaXQptaZXlB_UlQ9DmYVtwkouD906tT8YNG7tiN16udLL9MA-UQ8BUfqe9mwGle5FDNRPZ83cNE5JrupRA2Wc7RHNvxnXckyT_hToOsqa6Nnuq9reHnY3n0lXRJ4iBDpIlWbD_SI3JRYctVo'),
(44, 'Kamusika Accesories', 'shop7@kamusika.com', '2021-05-27 19:43:22', '$2y$10$CwfQZO6Qw4fEMZncuqcaeuXl78ZXukZdzVHXfuq8EixsqA1yhN/O2', NULL, NULL, 'jdgnsV13JR5u9Rly09VdvZJMCU7Z8VID6mUfQ5qxNORmkxkellRnXUun7TUE', NULL, 'profile-photos/ifIXmm3xEKBqdH5OLGEWeDkQBfBXECDjsltKQhaA.jpg', '2021-05-27 16:46:50', '2021-05-31 16:59:34', 1, NULL, NULL, 'gjdi', 88678965, '67t7p', NULL, 'jh57 d5', NULL, NULL, NULL, NULL),
(45, 'Daphne', 'daphnemuzenda@gmail.com', '2021-05-27 18:56:06', '$2y$10$lsqe3qbdWgaiE1h7LfIl9Opz1cJrZlUE4lZVFsNg13TyamkUuhtcq', NULL, NULL, NULL, NULL, NULL, '2021-05-27 18:55:15', '2021-05-27 18:59:43', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'Pardon', 'tavarwisapardy@gmail.com', '2021-05-28 00:59:39', '$2y$10$6Vhy0Q/HTdcyWhRxU0pofe1N5/joqDn7j6/qw7yCfM/5lOXEstvTe', NULL, NULL, 'AxlLnoOF1OytpEi4OQ52GMwozE64HCoAA0S1wyMF6vEa6PIQEExzL2QatoWx', NULL, NULL, '2021-05-28 00:57:20', '2021-05-28 00:59:39', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a-/AOh14Gh9qmPiPKdMxCYZlddEMGeqZcVZQaCDBfHtioH04g=s96-c', 'google', '110215688191049602800', 'ya29.a0AfH6SMD_9WTSpGtuAFSv5xU8k76JKHA64vWXdneWM0tyKwzeRm8effOZ8hBuGMvakEtxMCGa8IVuCGOsz67nA-QOIQvwDT3HQK9jxxklpGAw-XJdSasFv_5otXmNCJm7KhjfU8iyydU8WdPWSO5ph_Rm26eP'),
(47, 'CeeCee\'s Boutique', 'shop6@kamusika.com', '2021-05-28 18:28:01', '$2y$10$Mmm89BpukNX.xn3mPLc/F.9g2tIwCJ3/4YBom7lAkWB6Y7PC3mS7W', NULL, NULL, 'EQGcpe3gwuCTcoAhj3eVtDWZuckXVwT8fRFrpqQlaVL027IGcVrQXSDyznVv', NULL, NULL, '2021-05-28 06:07:19', '2021-05-28 18:28:01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'Anesu', 'shop1@kamusika.com', '2021-05-28 11:10:40', '$2y$10$ovZtRa7rQet6pxTEE2qJTutZPs1jXDtiEsmNaZwh5kfi8dtXIH2KC', NULL, NULL, NULL, NULL, NULL, '2021-05-28 11:05:09', '2021-05-28 11:10:40', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'Tate@hip.com', 'tate@hip.com', NULL, '$2y$10$K0g/y6xoe.Jya8S/t3X57O7vkeTdMbyhcXxzyDTqLnRakWGLhmkNW', NULL, NULL, NULL, NULL, NULL, '2021-05-30 15:56:13', '2021-05-30 15:56:13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'Gladstone Zvarevashe', 'gladstonezvarevashe@gmail.com', '2021-05-31 07:26:15', '$2y$10$LttNi4zg90ZUEAd4FG1WNud8UDbQjGtpccoqr2f/pDFhhLma1QF.y', NULL, NULL, 'thKI3dc7J0NfGFqNbebd4CKXDYXfcJ4hWat0fFmnVsZGC0VBEUjafkdO3Nfu', NULL, NULL, '2021-05-31 07:12:22', '2021-05-31 07:26:15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 'Jackson  Taivavashe', 'Jacktaiv@gmail.com', '2021-05-31 08:52:00', '$2y$10$.Xyii5WJlTzueIzvwvQksuu4Ne1cvMzbEyuxudcmArPms76n4k7du', NULL, NULL, 'FlzGazCD6hCTNG8XwInziDGYnyUjYtYhogLgFW0X2B5KicXuwID0lvmJh9DR', NULL, NULL, '2021-05-31 08:49:39', '2021-05-31 08:52:00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 'Ishe', 'shop2@kamusika.com', '2021-05-31 08:51:10', '$2y$10$pzcnzOCbEOe63/L0Nq24QeR3.cp3arvi7jBS68qu6Pg6FVJGH2z6y', NULL, NULL, NULL, NULL, NULL, '2021-05-31 08:50:39', '2021-05-31 08:51:10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'Anesu', 'anesunebarwe@gmail.com', '2021-05-31 19:55:05', '$2y$10$gU9Dubz7D5g24HaX9jNTy.81oaApCoYMeOu44lT.MtPy58w9.q7ny', NULL, NULL, 'WsbAThG3lrQIMe64GVmrv69zOFmSbTC1P6U05oOucErfa376fqISxp3khaus', NULL, NULL, '2021-05-31 19:52:10', '2021-05-31 19:55:05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'Vibosa', 'vibosa2019@gmail.com', '2021-06-01 15:05:39', '$2y$10$dBB5we4uwDu5Pw.pwNTnIuuN7g1P2BPZbZW1WWU0qCSvBM1TimrZK', NULL, NULL, NULL, NULL, NULL, '2021-06-01 15:04:09', '2021-06-01 15:05:39', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 'Noel Chad', 'noelchadjrno9@gmail.com', NULL, '', NULL, NULL, '6WSrwHRxgnj1oIaoVe4gdogqQk5LrLpWVdrennQCqQmMrqv2DT4S2WAGfOFf', NULL, NULL, '2021-06-02 16:53:54', '2021-06-02 16:53:54', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a-/AOh14Gij-F9LVofjKagEaJ84D8ph-sqB35uXoNT6FXGVfA=s96-c', 'google', '111277879980833684838', 'ya29.a0AfH6SMASaiQ3H6Rt-d0K6Fn_cif1Kco20GGairVBqTYmMc3uzmqEnkH7Bk9gGhVzHFaR8w4Wl2PraNNCjCWK35CqE-kvdvzYtGjNQoa9XN8C1lW535IZeZbCqGMhgTdT8t4FLYRKbRXSL7q3l22RLJ2DJH4W'),
(56, 'Obert Junior', '11junior27@gmail.com', NULL, '', NULL, NULL, 'nVap0DSIojh8rwNbfcSVa002HXliTltTHJIsI1JWdTx0AqaGBeeqPNR2xllJ', NULL, NULL, '2021-06-02 17:05:59', '2021-06-02 17:05:59', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a/AATXAJx2IQyr1zUZ6WrGqpambXUcGOle3HHxwjc-o1fe=s96-c', 'google', '110085633566373434316', 'ya29.a0AfH6SMANZ_HgAlCJuybq172wm3e0Ael2J9gLE5HsRmsZ9EDaOv-OgL5edYf3a8gZQe6k-nIpJYnpWNi2dACBNbefeiT0bv4XOwy5fnb7ia9cesHTorPs7EIZwyCXPwZxC3p7xeXHtUi5eG7Uek16yPkUcjg2'),
(57, 'Charity Ruchiyo', 'lumbzone@gmail.com', '2021-06-02 23:09:27', '', NULL, NULL, 'WpNsN9WnTsA2OrkF44cORPZIk717hrLTConoOIb4mwxe1eltTdVFDiGHtbZB', NULL, NULL, '2021-06-02 23:00:45', '2021-06-02 23:09:27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a-/AOh14GieGhP67vOKAfcyeUYtkA4TKt9IyFrKcJeLZIcNQg=s96-c', 'google', '107563187173214917757', 'ya29.a0AfH6SMDSue29--c4VrK1pL5rDV9Q39e33kvP-p77pk9cWFTxE8fsyCJVSu0HHAQmBo0c_UD0zib7UnVfe3rbqHhSJoXcqySlPG6R7W44gNJSRaMEFNcbVU6h09feQQ17RWj_Ymsofk7XFUxQWjsYz9hmvKRI'),
(58, 'Delta', 'mdaragora@gmail.com', '2021-06-03 11:26:24', '$2y$10$FqMATI4QhSZIYv.v6tj8xeOqHThRxC1hOgBektwvqqLBtKqMHK72S', NULL, NULL, NULL, NULL, NULL, '2021-06-03 11:12:31', '2021-06-03 11:26:24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'Erasmus Mhizha', 'mhizhaerasmus@gmail.com', NULL, '', NULL, NULL, 'WXLy5NcCQLSJ3xV30J5uJJysFVaCj5uJRd5flQFpKhz2e9EujN8qcBidWqCY', NULL, NULL, '2021-06-04 07:36:45', '2021-06-04 07:36:45', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a/AATXAJyW1CvaRk_iV2ZQDqcNCkUAOzqt0p_9qbabFsFb=s96-c', 'google', '102239882038800841356', 'ya29.a0AfH6SMBHXk9cmUHz62TkNdvNT-VJaMI0Kr-tj62CoswLY6hopxdqSFkvcmqAWBfu6TsFqhdiD0vvGxATBMZ10OWKAW8mkYcrV0DYl96xMBO0uaaj3NFDrAYC8_kJiJAaUZ1c5wvaNjeXVVVbc99s-_Mo5j7P'),
(60, 'raphael murimigwa', 'ralph0211@gmail.com', NULL, '', NULL, NULL, 'IsKmz0qcDP60Noh6UIO52j1kUVPYfntdy54ha3JqixjnzuZMC7YzkT7u5bhn', NULL, NULL, '2021-06-04 10:54:50', '2021-06-04 10:54:50', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a-/AOh14Gjvs7b3vXzGdgyWgxtFa6TgRij5TAq0gG7M6cvD=s96-c', 'google', '104526452703006338841', 'ya29.a0AfH6SMDhKOgKI-0OWLIik_sG9o-P0CHwF27DwuDcC91Wssb6jlxRpatLekzhp7k_kgZ-ACZ1JuSP0ly5EEH772_TRlCANWgc__mMM__aTzKN7Bt69304iSsfGOJ53DHb2dT_tabLZxAgVKfdtK53dd_MwZp-'),
(61, 'Paidamoyo Dziwa', 'dziwap@gmail.com', '2021-06-04 11:49:54', '', NULL, NULL, '2eEIhcmbBtkpaFvwoCRZNg2pDJrZ1J3etJX3K7wqxa0OLJ93cpnuhEyApqaH', NULL, NULL, '2021-06-04 11:47:40', '2021-06-04 11:49:54', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a/AATXAJxpM96qQlLZK44i83YGT4n70ZPs7UWsgRpLOjxj-w=s96-c', 'google', '104796434048624519268', 'ya29.a0AfH6SMBXCf7cGHGZJKjCosodcmJYcgBvhdPTo4sRbAgyN50tozHDYLUIEMlHAvDdmCLeuDXwCWpXk1eY60sa5hfenmJONpJKCyQpQtbFnI9PolRce_JNJrPkN-lk-ctxaHsN_tFKDBelsvV4630tYFIDlm1E'),
(62, 'lawrence ngwenya', 'lawrencengwenya9@gmail.com', NULL, '', NULL, NULL, 'ncU181KZnLMbMZkBkNNVK9JaBQG9GlvlSWD1CjHzJJome52n7dfMvHGSJJxQ', NULL, NULL, '2021-06-04 18:42:12', '2021-06-04 18:42:12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a/AATXAJzNlgmdhBlizAU1xMVlYtDg2dZgslva6JEWJAta=s96-c', 'google', '108521837697563037169', 'ya29.a0AfH6SMA8oQE7l01vTwI76V9st1x3LdSMNgMfL3jdZ44nu6Y714zld7gdfRMiy1JeJgS1KYrAG9sNGTcMrH1FwYTXObJGPQsq_TqONk5kvOvfRGWVCQewAaz4cvWn-jeZkkjbHHkxE9zWhdN1zVWEpb6U0MtZ'),
(63, 'Kudzanai Chimhanda', 'kudzanaicy@gmail.com', '2021-06-05 20:08:32', '', NULL, NULL, '07JAghcnU34wZu5yXBKDceLSG9P2ioOpKzYipJPJUKqnrAr1EmrrkH1ReLes', NULL, NULL, '2021-06-05 20:06:53', '2021-06-05 20:08:32', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a-/AOh14GgQbGG9tNzT4lUGGXBO2004_j3--jtLy4cf_oNBkg=s96-c', 'google', '107589664450416300747', 'ya29.a0AfH6SMA2S9hJxW_7_S6WSFdrcE1R3Sq0BsBMkd0Xd36Rt5bqUVl-9KBb7aM3slVgWr8TLyOwmxITBXvkLm_-f_KJjPGWgHIZ8ZjgvTHtf1w3R6_GSAEKo-dIik3eVv9FBLRu1XNx084vHm29YdM1GkS9z1Lq'),
(64, 'Dellan', 'dtangawabaiwa@gmail.com', '2021-06-24 08:11:33', '$2y$10$1N9b.0J4wJ5MVage3/naP.3T/OMMzcm.EhOi.NRvWgLVDf3EK8nGK', NULL, NULL, NULL, NULL, NULL, '2021-06-24 08:10:36', '2021-06-24 08:11:33', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 'Craig Chibaya', 'cchibaya.chibaya@gmail.com', '2021-06-24 12:04:30', '$2y$10$raC5H1/WHUTYzWLAf1K1NeQsCrUkMfz9FUSo.FveeWDbVTsrMoEbO', NULL, NULL, NULL, NULL, NULL, '2021-06-24 12:03:27', '2021-06-24 12:04:30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 'Reuben', 'tashinga98moyo@gmail.com', '2021-06-24 12:57:20', '$2y$10$apaSlVoljgtKbnARJf98A.Kb/3YWPXJTKCnz0otrBnVhg7jpn1P1a', NULL, NULL, NULL, NULL, NULL, '2021-06-24 12:56:17', '2021-06-24 12:57:20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 'Faffy', 'fadzythelmah@gmail.com', '2021-06-24 15:03:08', '$2y$10$uiNWgIe580E/ub9CoRLC9.92GXQLoGVmB2C4xCApsczp/98Xj7uTe', NULL, NULL, 'wVN6SF8w85Dff6ODniYzDS68otaUXLEMQ6M0Pkxv3qZ0GoTdshcnMKcrekti', NULL, NULL, '2021-06-24 15:01:55', '2021-06-24 15:03:08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 'Sibusiso Ncube', 'sibusisomunyaradzi28@gmail.com', '2021-06-30 16:28:06', '$2y$10$Xkx61d9icAswr6.xOrA6be26JZJ9/ti7f7p1wCicDwqYgdqwKJkjS', NULL, NULL, NULL, NULL, NULL, '2021-06-30 16:24:52', '2021-06-30 16:28:06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 'Ruth Nyandoro', 'rnyandoro@gmail.com', '2021-07-05 16:27:38', '$2y$10$gyu7W2wqs2E6zVZHNrmi0OPci0ibq24TLS8mDbmK4zG6AP68RAz6C', NULL, NULL, 'o1wsrwaLvke1odK6U4lJLETk8JCS9nq6QBgQIEYEcGQWZDvGWq0UgpssoAb7', NULL, NULL, '2021-07-05 16:25:59', '2021-07-05 16:27:38', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 'Alwin Manjengwa', 'alwinmanjengwa@gmail.com', '2021-07-21 14:08:57', '', NULL, NULL, 'qWovS6YOyXbtjk6z9ZRvHLM3Fnggs9q0kwPaHGxIJQlue2xyWxgXZC7sr6Xd', NULL, NULL, '2021-07-21 14:02:38', '2021-07-21 14:08:57', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a-/AOh14GjLl6wWfQZdNb8MwKaoyxBvsy3q8zNQMrXtpeUHAA=s96-c', 'google', '106427580023206343173', 'ya29.a0ARrdaM-iatbI6tw6eLOqgu0r8JdiouWKAPeP6_g0_oDxZf2oVlVW02eO6nBCMmiLkBs_DuHIEXU5tgT1KIyVFWcb3E3UAZsTIv5kqGDC_9EuXNHWDTjqk8psI2oToMBVkHNcM3dSjGGVkK1PTIDjXWyBRdsg'),
(71, 'XrzWjixJVkMI', 'recturryqu@gmail.com', NULL, '$2y$10$ySv.vz4PJS/IT5qXe5Ux/u3WqCRfik/6K1I/ulJwKyNiaY0UzvJ9e', NULL, NULL, NULL, NULL, NULL, '2021-07-23 15:53:48', '2021-07-23 15:53:48', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 'Alfred', 'gmfelvis@gmail.com', NULL, '$2y$10$NZU4KiBz0DGB.iXAjL/NU.CR35BFtv9f7xulhGgTcsydAnoNyFw2q', NULL, NULL, NULL, NULL, NULL, '2021-07-28 08:08:22', '2021-07-28 08:08:22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 'tzGJuYRbIc', 'josephbarker2283@gmail.com', NULL, '$2y$10$QhJ109NYlgBttlKyi3dlz.HxsqiyA9drGL31ASh7ZnaVvoLwl70oa', NULL, NULL, NULL, NULL, NULL, '2021-11-22 11:24:58', '2021-11-22 11:24:58', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 'SfXwkMiWHF', 'antonianguyen60767@gmail.com', NULL, '$2y$10$8IXCJmrWkBwcTjXhi9zMa.hlzBMy/84JQ5pfCqz2eYjouh0vKsk3G', NULL, NULL, NULL, NULL, NULL, '2021-12-04 14:13:49', '2021-12-04 14:13:49', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 'MIqgaQCjHNztsn', 'fochtmanrhan23166@gmail.com', NULL, '$2y$10$yl2L3xOtLrkFBxodzuYraup4xbV5xVoSraKsmflhaJAXWKDvVEMri', NULL, NULL, NULL, NULL, NULL, '2021-12-22 10:33:35', '2021-12-22 10:33:35', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 'hjtrydjhcgj5t6djtyghjtydhgkjtdhkjglgu https://forms.yandex.ru/u/61c8a43aae26a69a698a0421 Bom', 'komarovadaniela72459@mail.ru', NULL, '$2y$10$R79aQCfXJ93aAAevR6ibiuBLyfOyXHvkskPK.x1azYLp8OSKNPEKq', NULL, NULL, NULL, NULL, NULL, '2021-12-28 21:38:03', '2021-12-28 21:38:03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 'PBolAKneRZjQJY', 'adnanudani893@gmail.com', NULL, '$2y$10$ICng/BuXiqGGYdvF3i2Lk.ddASG5YOjyieohsChlbWnRyZ7jpX/hO', NULL, NULL, NULL, NULL, NULL, '2022-03-07 22:18:32', '2022-03-07 22:18:32', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 'GzurbOkDKvhVI', 'jdhhdjdhdgdkdidh58@gmail.com', NULL, '$2y$10$QOVlgwdjK9T8laQqxghebeKdisRfSSO6Tosdfph3bFvmt0l04qV4e', NULL, NULL, NULL, NULL, NULL, '2022-03-15 06:26:10', '2022-03-15 06:26:10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 'dQOwyBkKPLbArcDf', 'scottvsvj@gmail.com', NULL, '$2y$10$oqY4Vv8zlynsnxOsS3i0.eHzJGy4sPkMkcw6MOgrg6V8AVf5YFq.q', NULL, NULL, NULL, NULL, NULL, '2022-04-03 04:03:27', '2022-04-03 04:03:27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 'pzEhPbeaVcq', 'Sharonntjennifereb9057@gmail.com', NULL, '$2y$10$mpGFzOT2hyxIDf.BGSy2w.Rc3/V5wRQkAjsHAT4ohHK6RmE3zyjOO', NULL, NULL, NULL, NULL, NULL, '2022-04-16 08:34:07', '2022-04-16 08:34:07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 'gROeXuCDdWc', 'zzfooxz@gmail.com', NULL, '$2y$10$7pmH4tv4KImYRrNmJ.lF6.Ah10OBWDZOPk4W/cDC/3QVWhbd0heCG', NULL, NULL, NULL, NULL, NULL, '2022-04-30 17:05:23', '2022-04-30 17:05:23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 'sneha', 'sneha8@gmail.com', NULL, '$2y$10$jRLaE9haWh6s9mf9ydxjkOMpHk/xAFnwL2VqdnIOASpgeGtIw/xdC', NULL, NULL, NULL, NULL, NULL, '2022-05-06 10:14:12', '2022-05-06 10:14:12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 'sneha7@gmail.com', 'sneha7@gmail.com', NULL, '$2y$10$9ejxLMdRYSthygVPVqmDr.UVyFD4fo3Kh4XYT7t.S5gf83ilmXixq', NULL, NULL, NULL, NULL, NULL, '2022-05-06 10:17:01', '2022-05-06 10:17:01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 'ZxqOIQTYLfuRsNG', 'lichisdelbertx7@gmail.com', NULL, '$2y$10$TWQU711l8Z24CleJ3XDDa.XrOpKoSDhdTDS/h2Y6udRFC.KeGMYKO', NULL, NULL, NULL, NULL, NULL, '2022-05-25 19:58:53', '2022-05-25 19:58:53', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 'UQOvncrNLytG', 'deontayze8y57yu62bo@outlook.com', NULL, '$2y$10$fMR6gLlpTOTLjM.bNv5fgu7Hrs9yBXYLh6rea93w6iZ3BAnO5mOl2', NULL, NULL, NULL, NULL, NULL, '2022-06-22 16:17:46', '2022-06-22 16:17:46', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 'Rptaruwona@outlook.com', 'rptaruwona@outlook.com', NULL, '$2y$10$BIwZPHK3Uf6P6vKoOZz3EeaZdwkWtLM8jqX25TWJXespAPEpYREEW', NULL, NULL, NULL, NULL, NULL, '2022-07-04 09:21:31', '2022-07-04 09:21:31', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 'Reynold Panashe Taruwona', 'r.p.taruwona@gmail.com', NULL, '$2y$10$9RMtMyHmjDU.ysC.7sA5o.m11nCbPpezep2uR0bMlfK9fCDMzFhze', NULL, NULL, NULL, NULL, NULL, '2022-07-04 09:22:42', '2022-07-04 09:22:42', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 'IgYHDNkwaALc', 'mmoneka58ym2pa0@outlook.com', NULL, '$2y$10$hewzEQoq7CUDC8/nhsePc.bGK4j4QbeI7rlqNyQna8f3It020673K', NULL, NULL, NULL, NULL, NULL, '2022-07-20 21:22:10', '2022-07-20 21:22:10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 'nNADLJyhQcOoK', 'kimishafu39402@outlook.com', NULL, '$2y$10$FFbIxDTro/cihX53nv3s6.dEyKOOQcAxk0F4i35dngqgk.z3.UYXq', NULL, NULL, NULL, NULL, NULL, '2022-07-26 09:21:42', '2022-07-26 09:21:42', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 'VpfXsgtCa', 'umarti8iaua381j5ye@outlook.com', NULL, '$2y$10$PYbEpGTWJx6CUE9duUp4U.QOfuEwLtUWcDVCvYasPhPEtEz.82kha', NULL, NULL, NULL, NULL, NULL, '2022-08-06 13:35:57', '2022-08-06 13:35:57', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 'fwEbAFhKsNHWk', 'katie1hg6u36@outlook.com', NULL, '$2y$10$g66bg8eId32Eq8vHqa2WUOIuHpw.0QI0ObDB2vYMWIx8OjyyV/W4y', NULL, NULL, NULL, NULL, NULL, '2022-09-01 13:51:57', '2022-09-01 13:51:57', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 'IwJKACPQLyrfe', 'chelsi7udu563w1@outlook.com', NULL, '$2y$10$ACxFlzHW3LfRRPr4fKwG5ePPppLFVLOPwtE.Xbx6EdaSU3fwZFvWG', NULL, NULL, NULL, NULL, NULL, '2022-09-05 18:32:18', '2022-09-05 18:32:18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 'eDdpwMiShuX', 'tmahyar016u4t5e9y0@outlook.com', NULL, '$2y$10$A3B2K8FVAo8aISNmD0hVHuWR3vbRLeX3yrBqpaYAU6h7IxmfFhHAe', NULL, NULL, NULL, NULL, NULL, '2022-09-30 23:30:46', '2022-09-30 23:30:46', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `values`
--

CREATE TABLE `values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `values`
--

INSERT INTO `values` (`id`, `attribute_id`, `value`, `price`, `created_at`, `updated_at`, `product_id`) VALUES
(1, 1, '#823838,#3EB280,#377EC4', NULL, '2021-05-28 13:06:22', '2021-05-28 13:06:22', 161),
(2, 2, 'm,l', NULL, '2021-05-28 13:06:22', '2021-05-28 13:06:22', 161),
(5, 1, '#C01313,#1AB66C', NULL, '2022-04-18 19:09:02', '2022-04-18 19:09:02', 306),
(6, 2, 'm,xl', NULL, '2022-04-18 19:09:02', '2022-04-18 19:09:02', 306);

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `holder_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `holder_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `balance` decimal(64,0) NOT NULL DEFAULT 105,
  `decimal_places` smallint(6) NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `holder_type`, `holder_id`, `name`, `slug`, `description`, `meta`, `balance`, `decimal_places`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'Default Wallet', 'default', NULL, '[]', '4802', 2, '2021-05-28 12:34:16', '2021-05-31 11:34:30'),
(2, 'App\\Models\\User', 48, 'Default Wallet', 'default', NULL, '[]', '0', 2, '2021-05-28 13:07:43', '2021-05-28 13:07:43'),
(3, 'App\\Models\\User', 27, 'Default Wallet', 'default', NULL, '[]', '4901', 2, '2021-05-28 13:22:30', '2021-05-30 06:51:07'),
(4, 'App\\Models\\User', 37, 'Default Wallet', 'default', NULL, '[]', '0', 2, '2021-05-28 14:25:43', '2021-05-28 14:25:43'),
(5, 'App\\Models\\User', 47, 'Default Wallet', 'default', NULL, '[]', '0', 2, '2021-05-28 18:26:52', '2021-05-28 18:26:52'),
(6, 'App\\Models\\User', 2, 'Default Wallet', 'default', NULL, '[]', '4901', 2, '2021-05-28 18:38:01', '2021-05-29 15:24:57'),
(7, 'App\\Models\\User', 19, 'Default Wallet', 'default', NULL, '[]', '0', 2, '2021-05-29 17:02:43', '2021-05-29 17:02:43'),
(8, 'App\\Models\\User', 33, 'Default Wallet', 'default', NULL, '[]', '0', 2, '2021-05-30 01:59:38', '2021-05-30 01:59:38'),
(9, 'App\\Models\\User', 7, 'Default Wallet', 'default', NULL, '[]', '4703', 2, '2021-05-30 08:03:16', '2021-06-24 07:16:24'),
(10, 'App\\Models\\User', 49, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2021-05-30 15:56:13', '2021-05-30 15:56:14'),
(11, 'App\\Models\\User', 50, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2021-05-31 07:12:22', '2021-05-31 07:12:23'),
(12, 'App\\Models\\User', 51, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2021-05-31 08:49:40', '2021-05-31 08:49:41'),
(13, 'App\\Models\\User', 52, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2021-05-31 08:50:39', '2021-05-31 08:50:39'),
(14, 'App\\Models\\User', 43, 'Default Wallet', 'default', NULL, '[]', '0', 2, '2021-05-31 10:13:20', '2021-05-31 10:13:20'),
(15, 'App\\Models\\User', 42, 'Default Wallet', 'default', NULL, '[]', '0', 2, '2021-05-31 10:39:26', '2021-05-31 10:39:26'),
(16, 'App\\Models\\User', 44, 'Default Wallet', 'default', NULL, '[]', '0', 2, '2021-05-31 16:53:16', '2021-05-31 16:53:16'),
(17, 'App\\Models\\User', 25, 'Default Wallet', 'default', NULL, '[]', '0', 2, '2021-05-31 18:20:44', '2021-05-31 18:20:44'),
(18, 'App\\Models\\User', 53, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2021-05-31 19:52:10', '2021-05-31 19:52:11'),
(19, 'App\\Models\\User', 54, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2021-06-01 15:04:10', '2021-06-01 15:04:14'),
(20, 'App\\Models\\User', 57, 'Default Wallet', 'default', NULL, '[]', '0', 2, '2021-06-02 23:09:28', '2021-06-02 23:09:28'),
(21, 'App\\Models\\User', 58, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2021-06-03 11:12:31', '2021-06-03 11:12:32'),
(22, 'App\\Models\\User', 61, 'Default Wallet', 'default', NULL, '[]', '0', 2, '2021-06-04 11:50:08', '2021-06-04 11:50:08'),
(23, 'App\\Models\\User', 63, 'Default Wallet', 'default', NULL, '[]', '0', 2, '2021-06-05 20:08:34', '2021-06-05 20:08:34'),
(24, 'App\\Models\\User', 26, 'Default Wallet', 'default', NULL, '[]', '0', 2, '2021-06-24 07:04:46', '2021-06-24 07:04:46'),
(25, 'App\\Models\\User', 4, 'Default Wallet', 'default', NULL, '[]', '0', 2, '2021-06-24 07:24:34', '2021-06-24 07:24:34'),
(26, 'App\\Models\\User', 64, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2021-06-24 08:10:38', '2021-06-24 08:10:39'),
(27, 'App\\Models\\User', 65, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2021-06-24 12:03:28', '2021-06-24 12:03:29'),
(28, 'App\\Models\\User', 66, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2021-06-24 12:56:17', '2021-06-24 12:56:18'),
(29, 'App\\Models\\User', 67, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2021-06-24 15:01:55', '2021-06-24 15:01:56'),
(30, 'App\\Models\\User', 68, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2021-06-30 16:24:53', '2021-06-30 16:24:53'),
(31, 'App\\Models\\User', 69, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2021-07-05 16:25:59', '2021-07-05 16:26:00'),
(32, 'App\\Models\\User', 36, 'Default Wallet', 'default', NULL, '[]', '0', 2, '2021-07-16 18:13:01', '2021-07-16 18:13:01'),
(33, 'App\\Models\\User', 70, 'Default Wallet', 'default', NULL, '[]', '0', 2, '2021-07-21 14:08:57', '2021-07-21 14:08:57'),
(34, 'App\\Models\\User', 71, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2021-07-23 15:53:48', '2021-07-23 15:53:49'),
(35, 'App\\Models\\User', 72, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2021-07-28 08:08:23', '2021-07-28 08:08:24'),
(36, 'App\\Models\\User', 30, 'Default Wallet', 'default', NULL, '[]', '0', 2, '2021-08-10 09:55:07', '2021-08-10 09:55:07'),
(37, 'App\\Models\\User', 73, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2021-11-22 11:24:59', '2021-11-22 11:25:00'),
(38, 'App\\Models\\User', 74, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2021-12-04 14:13:49', '2021-12-04 14:13:49'),
(39, 'App\\Models\\User', 75, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2021-12-22 10:33:35', '2021-12-22 10:33:35'),
(40, 'App\\Models\\User', 76, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2021-12-28 21:38:03', '2021-12-28 21:38:05'),
(41, 'App\\Models\\User', 77, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2022-03-07 22:18:32', '2022-03-07 22:18:33'),
(42, 'App\\Models\\User', 78, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2022-03-15 06:26:11', '2022-03-15 06:26:12'),
(43, 'App\\Models\\User', 79, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2022-04-03 04:03:27', '2022-04-03 04:03:27'),
(44, 'App\\Models\\User', 80, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2022-04-16 08:34:08', '2022-04-16 08:34:09'),
(45, 'App\\Models\\User', 81, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2022-04-30 17:05:24', '2022-04-30 17:05:25'),
(46, 'App\\Models\\User', 82, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2022-05-06 10:14:13', '2022-05-06 10:14:15'),
(47, 'App\\Models\\User', 83, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2022-05-06 10:17:01', '2022-05-06 10:17:01'),
(48, 'App\\Models\\User', 84, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2022-05-25 19:58:53', '2022-05-25 19:58:54'),
(49, 'App\\Models\\User', 85, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2022-06-22 16:17:46', '2022-06-22 16:17:48'),
(50, 'App\\Models\\User', 86, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2022-07-04 09:21:32', '2022-07-04 09:21:33'),
(51, 'App\\Models\\User', 87, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2022-07-04 09:22:42', '2022-07-04 09:22:42'),
(52, 'App\\Models\\User', 88, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2022-07-20 21:22:12', '2022-07-20 21:22:13'),
(53, 'App\\Models\\User', 89, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2022-07-26 09:21:43', '2022-07-26 09:21:44'),
(54, 'App\\Models\\User', 90, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2022-08-06 13:35:57', '2022-08-06 13:35:58'),
(55, 'App\\Models\\User', 91, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2022-09-01 13:51:58', '2022-09-01 13:51:59'),
(56, 'App\\Models\\User', 92, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2022-09-05 18:32:22', '2022-09-05 18:32:23'),
(57, 'App\\Models\\User', 93, 'Default Wallet', 'default', NULL, '[]', '105', 2, '2022-09-30 23:30:47', '2022-09-30 23:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 228, 63, NULL, NULL),
(2, 49, 69, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adverts`
--
ALTER TABLE `adverts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_user_id_foreign` (`user_id`),
  ADD KEY `likes_product_id_foreign` (`product_id`),
  ADD KEY `likes_post_id_foreign` (`post_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_user_id_foreign` (`user_id`);

--
-- Indexes for table `message_user`
--
ALTER TABLE `message_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_shop`
--
ALTER TABLE `order_shop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pickups`
--
ALTER TABLE `pickups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_user_id_foreign` (`user_id`),
  ADD KEY `ratings_product_id_foreign` (`product_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shops_user_id_foreign` (`user_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_user_id_index` (`user_id`);

--
-- Indexes for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`);

--
-- Indexes for table `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactions_uuid_unique` (`uuid`),
  ADD KEY `transactions_payable_type_payable_id_index` (`payable_type`,`payable_id`),
  ADD KEY `payable_type_ind` (`payable_type`,`payable_id`,`type`),
  ADD KEY `payable_confirmed_ind` (`payable_type`,`payable_id`,`confirmed`),
  ADD KEY `payable_type_confirmed_ind` (`payable_type`,`payable_id`,`type`,`confirmed`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_wallet_id_foreign` (`wallet_id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transfers_uuid_unique` (`uuid`),
  ADD KEY `transfers_from_type_from_id_index` (`from_type`,`from_id`),
  ADD KEY `transfers_to_type_to_id_index` (`to_type`,`to_id`),
  ADD KEY `transfers_deposit_id_foreign` (`deposit_id`),
  ADD KEY `transfers_withdraw_id_foreign` (`withdraw_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `values`
--
ALTER TABLE `values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wallets_holder_type_holder_id_slug_unique` (`holder_type`,`holder_id`,`slug`),
  ADD KEY `wallets_holder_type_holder_id_index` (`holder_type`,`holder_id`),
  ADD KEY `wallets_slug_index` (`slug`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adverts`
--
ALTER TABLE `adverts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `message_user`
--
ALTER TABLE `message_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `order_shop`
--
ALTER TABLE `order_shop`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pickups`
--
ALTER TABLE `pickups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=354;

--
-- AUTO_INCREMENT for table `product_attribute`
--
ALTER TABLE `product_attribute`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=417;

--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `team_invitations`
--
ALTER TABLE `team_invitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `values`
--
ALTER TABLE `values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_deposit_id_foreign` FOREIGN KEY (`deposit_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transfers_withdraw_id_foreign` FOREIGN KEY (`withdraw_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
