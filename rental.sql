-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2024 at 08:14 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_admin`
--

CREATE TABLE `accounts_admin` (
  `id` bigint(20) NOT NULL,
  `address` longtext NOT NULL,
  `contact` varchar(10) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_admin`
--

INSERT INTO `accounts_admin` (`id`, `address`, `contact`, `image`, `area_id`, `city_id`, `state_id`, `user_id`) VALUES
(3, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', '9345735093', 'users/avatar-png-1-original_Szy3kZL_HeAEVbH.png', 1, 2, 3, 76),
(4, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', '9345735093', 'users/avatar-png-1-original_Szy3kZL_mx8CEtz.png', 3, 2, 3, 75);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_area`
--

CREATE TABLE `accounts_area` (
  `id` bigint(20) NOT NULL,
  `area_name` varchar(45) NOT NULL,
  `city_idcity` bigint(20) NOT NULL,
  `pincode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_area`
--

INSERT INTO `accounts_area` (`id`, `area_name`, `city_idcity`, `pincode`) VALUES
(1, 'Naroda', 2, 382330),
(3, 'nikol', 2, 382350),
(4, 'Narol', 2, 382405),
(5, 'Navapura', 2, 382210),
(6, 'Gujarat University', 2, 380009),
(8, 'Bhedvad', 5, 394220),
(9, 'Bortha', 5, 394370),
(10, 'Chalthan', 5, 394305),
(11, 'Itwai', 5, 39438),
(12, 'Amroli', 4, 391150),
(13, 'Choranda', 4, 391244),
(14, 'Bhoj', 4, 391445),
(15, 'itola', 4, 391240);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_areahasdeliveryboy`
--

CREATE TABLE `accounts_areahasdeliveryboy` (
  `id` bigint(20) NOT NULL,
  `area_id` bigint(20) NOT NULL,
  `deliveryboy_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_areahasdeliveryboy`
--

INSERT INTO `accounts_areahasdeliveryboy` (`id`, `area_id`, `deliveryboy_id`) VALUES
(107, 8, 6),
(108, 9, 6),
(109, 10, 6),
(110, 11, 6),
(86, 8, 7),
(87, 9, 7),
(88, 10, 7),
(89, 11, 7),
(98, 1, 8),
(99, 3, 8),
(100, 4, 8),
(101, 5, 8),
(102, 6, 8),
(73, 12, 9),
(74, 13, 9),
(75, 14, 9),
(76, 15, 9),
(90, 12, 12),
(91, 13, 12),
(92, 14, 12),
(93, 15, 12),
(103, 3, 13),
(104, 4, 13),
(105, 5, 13),
(106, 6, 13),
(115, 1, 14),
(116, 5, 14);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_authgroup`
--

CREATE TABLE `accounts_authgroup` (
  `id` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_authgrouppermissions`
--

CREATE TABLE `accounts_authgrouppermissions` (
  `id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_authpermission`
--

CREATE TABLE `accounts_authpermission` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `codename` varchar(100) NOT NULL,
  `content_type_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_authuser`
--

CREATE TABLE `accounts_authuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_authusergroups`
--

CREATE TABLE `accounts_authusergroups` (
  `id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_authuseruserpermissions`
--

CREATE TABLE `accounts_authuseruserpermissions` (
  `id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_brand`
--

CREATE TABLE `accounts_brand` (
  `id` bigint(20) NOT NULL,
  `name` varchar(15) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_brand`
--

INSERT INTO `accounts_brand` (`id`, `name`, `image`) VALUES
(1, 'dell', 'uploads/brand/photo_2022-02-17_15-11-28.jpg'),
(4, 'apple', 'uploads/brand/photo_2022-02-17_15-11-20.jpg'),
(6, 'lenovo', 'uploads/brand/photo_2022-02-17_15-11-34.jpg'),
(7, 'samsung', 'uploads/brand/photo_2022-02-17_15-11-38.jpg'),
(9, 'Philips', 'uploads/brand/Philips-Logo-500x152.png'),
(10, 'oneplus', 'uploads/brand/logo.webp'),
(11, 'hp', 'uploads/brand/hp-logo.jpg'),
(12, 'huawei', 'uploads/brand/huawei-logo-2018-1024x768.png'),
(13, 'asus', 'uploads/brand/Asus-Logo-300x113.png');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_cart`
--

CREATE TABLE `accounts_cart` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `rent_amount` int(11) NOT NULL,
  `deposit` int(11) NOT NULL,
  `delivery_pickup_charges` int(11) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_category`
--

CREATE TABLE `accounts_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(15) NOT NULL,
  `subcategory_idcategory_id` bigint(20) DEFAULT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_category`
--

INSERT INTO `accounts_category` (`id`, `name`, `subcategory_idcategory_id`, `image`) VALUES
(59, 'computers', NULL, 'category/pngaaa.com-797866.png'),
(60, 'audio visual', NULL, 'category/new_speaker.jpg'),
(61, 'apple product', 59, 'category/pinpng.com-macbook-pro-png-114492_LI94VIp.png'),
(63, 'server', 59, 'category/6.png'),
(64, 'TV', 60, 'category/product-5.jpg'),
(66, 'laptop', 59, 'category/output-onlinepngtools.png'),
(67, 'speakers', 60, 'category/51.png'),
(68, 'computer', 59, 'category/photo_2022-02-17_16-32-49_1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_city`
--

CREATE TABLE `accounts_city` (
  `id` bigint(20) NOT NULL,
  `city_name` varchar(45) NOT NULL,
  `state_idstate_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_city`
--

INSERT INTO `accounts_city` (`id`, `city_name`, `state_idstate_id`) VALUES
(2, 'ahemedabad', 3),
(4, 'vadodara', 3),
(5, 'surat', 3),
(8, 'junagadh', 3),
(9, 'jamnagar', 3),
(10, 'kesod', 3);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_customer`
--

CREATE TABLE `accounts_customer` (
  `id` bigint(20) NOT NULL,
  `company_name` varchar(45) DEFAULT NULL,
  `company_address` longtext DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `is_pending` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_customer`
--

INSERT INTO `accounts_customer` (`id`, `company_name`, `company_address`, `area_id`, `user_id`, `state_id`, `city_id`, `image`, `contact`, `is_pending`) VALUES
(39, 'rental appliances', 'A-19,Yamunagar society,near jalpa society', 1, 69, 3, 2, 'users/avatar-png-1-original_Szy3kZL_CjvoHSR.png', '9345735093', 0),
(45, 'SantokDesign', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 13, 77, 3, 4, 'users/avatar-png-1-original_Szy3kZL_ysWRWv8.png', '9398327483', 0),
(46, 'cake4you', 'sir@jpatel1234', 8, 78, 3, 5, 'users/avatar-png-1-original_Szy3kZL_3K2jrvx.png', '9398327483', 0),
(47, 'aashraya', 'sir@jpatel1234', 12, 79, 3, 4, 'users/avatar-png-1-original_Szy3kZL_MqtB8ws.png', '9398327483', 0),
(48, 'vandemataram', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 6, 80, 3, 2, 'users/avatar-png-1-original_Szy3kZL_gNpj1sW.png', '9398327483', 0),
(49, 'SwipeWire', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 12, 88, 3, 4, 'users/avatar-png-1-original_Szy3kZL_8sPi3zc.png', '9398327483', 1),
(50, 'SecureSmarter', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 4, 89, 3, 2, 'users/avatar-png-1-original_Szy3kZL_li9gbys.png', '9398327483', 1),
(51, 'Formonix', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 8, 90, 3, 5, 'users/avatar-png-1-original_Szy3kZL_tLtj8Jk.png', '9398327483', 1),
(52, 'Cloudrevel', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 13, 91, 3, 4, 'users/avatar-png-1-original_Szy3kZL_9gTe94V.png', '9398327483', 1),
(53, 'MetConnect', 'sir@jpatel1234', 5, 92, 3, 2, 'users/avatar-png-1-original_Szy3kZL.png', '9398327483', 0),
(54, 'Composey', 'sir@jpatel1234', 14, 93, 3, 4, 'users/avatar-png-1-original_Szy3kZL_dKGEbUj.png', '9398327483', 0),
(55, 'ramuthecompany', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 8, 95, 3, 5, 'users/avatar-png-1-original.png', '0934959438', 0);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_customize`
--

CREATE TABLE `accounts_customize` (
  `id` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `product_name` varchar(75) NOT NULL,
  `description` longtext NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_customize`
--

INSERT INTO `accounts_customize` (`id`, `date`, `product_name`, `description`, `customer_id`, `status`) VALUES
(3, '2022-02-05', 'Lenovo Ideapad Gaming 3', '8 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce GTX 1650/120 Hz15ACH6 Gaming Laptop  15.6 inch, Shadow Black, 2.25$$kg kg', 45, 'pending'),
(4, '2022-02-06', 'Lenovo IdeaPad', 'Core i3 10th Gen ,8 GB/1 TB HDD/Windows 10 Home ,15IML05 Thin and Light Laptop 15.6 inch, Platinum Grey, 1.7 kg, With MS Office', 47, 'declined'),
(8, '2022-02-25', 'laptop', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 48, 'pending'),
(9, '2022-02-27', 'laptop', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 55, 'declined'),
(10, '2022-02-27', 'laptop', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 47, 'declined');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_deliveryboy`
--

CREATE TABLE `accounts_deliveryboy` (
  `id` bigint(20) NOT NULL,
  `address` longtext NOT NULL,
  `contact` varchar(10) NOT NULL,
  `image` varchar(100) NOT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_deliveryboy`
--

INSERT INTO `accounts_deliveryboy` (`id`, `address`, `contact`, `image`, `area_id`, `city_id`, `state_id`, `user_id`) VALUES
(6, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', '9398327483', 'users/avatar-png-1-original_Szy3kZL_vozdGHd.png', 9, 5, 3, 82),
(7, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', '9398327483', 'users/avatar-png-1-original_Szy3kZL_HjrtbQ8.png', 11, 5, 3, 83),
(8, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', '', 'users/avatar-png-1-original_Szy3kZL_z35a8bs.png', 4, 2, 3, 84),
(9, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', '9398327483', 'users/avatar-png-1-original_Szy3kZL_C6uEiM3.png', 14, 4, 3, 85),
(12, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', '9365849896', 'users/avatar-png-1-original_Szy3kZL_MKemNlP.png', 13, 4, 3, 87),
(13, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', '9398327483', 'users/avatar-png-1-original_Szy3kZL_eBl3KZH.png', 3, 2, 3, 94),
(14, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', '', 'users/avatar-png-1-original.png', 3, 2, 3, 96);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_deliverypickup`
--

CREATE TABLE `accounts_deliverypickup` (
  `id` bigint(20) NOT NULL,
  `pickup` tinyint(1) NOT NULL,
  `deliveryboy_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `dutydate` date NOT NULL,
  `iscompleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_deliverypickup`
--

INSERT INTO `accounts_deliverypickup` (`id`, `pickup`, `deliveryboy_id`, `order_id`, `dutydate`, `iscompleted`) VALUES
(87, 0, 7, 55, '2022-02-27', 1),
(88, 0, 7, 56, '2022-02-27', 1),
(90, 1, 6, 55, '2022-03-09', 1),
(91, 1, 6, 56, '2022-03-09', 1),
(93, 0, 9, 58, '2022-02-27', 1),
(94, 0, 9, 59, '2022-02-27', 1),
(95, 1, 12, 58, '2022-03-04', 1),
(96, 1, 12, 59, '2022-03-11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_djangoadminlog`
--

CREATE TABLE `accounts_djangoadminlog` (
  `id` bigint(20) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_djangocontenttype`
--

CREATE TABLE `accounts_djangocontenttype` (
  `id` bigint(20) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_djangomigrations`
--

CREATE TABLE `accounts_djangomigrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_djangosession`
--

CREATE TABLE `accounts_djangosession` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_feedbackrating`
--

CREATE TABLE `accounts_feedbackrating` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `comment` longtext DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `publish` tinyint(1) NOT NULL,
  `orderProduct_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_feedbackrating`
--

INSERT INTO `accounts_feedbackrating` (`id`, `date`, `comment`, `rating`, `customer_id`, `product_id`, `publish`, `orderProduct_id`) VALUES
(5, '2022-02-17', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 4, 39, 54, 1, 0),
(6, '2022-01-17', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 5, 48, 55, 0, 0),
(9, '2022-02-27', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 3.4, 39, 54, 1, 0),
(10, '2022-02-24', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 4, 45, 55, 1, 0),
(11, '2022-03-27', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 3, 46, 62, 1, 0),
(12, '2022-02-23', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 4, 47, 63, 1, 0),
(13, '2022-02-27', 'sir@jpatel1234', 4.7, 48, 64, 1, 0),
(14, '2022-01-27', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 3, 49, 65, 1, 0),
(15, '2021-02-27', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 3.7, 50, 66, 1, 0),
(16, '2022-02-27', 'sir@jpatel1234', 4, 51, 68, 1, 0),
(17, '2022-02-22', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 3, 51, 69, 1, 0),
(18, '2022-02-19', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 4, 54, 69, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_image`
--

CREATE TABLE `accounts_image` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `product` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_image`
--

INSERT INTO `accounts_image` (`id`, `image`, `product`) VALUES
(58, 'product/computer_FyHir8c_fxtywQJ_PElhQgZ.png', NULL),
(59, 'product/ddd.jpeg', 54),
(60, 'product/photo_2022-02-15_10-42-55.jpg', 54),
(61, 'product/photo_2022-02-15_10-43-07.jpg', 54),
(63, 'product/ThinkBook-14-Gen-2-Intel-hero.jpeg', 54),
(65, 'product/photo_2022-02-15_10-48-54.jpg', 55),
(66, 'product/photo_2022-02-15_10-48-58.jpg', 55),
(67, 'product/photo_2022-02-15_10-49-02.jpg', 55),
(68, 'product/photo_2022-02-15_10-49-07.jpg', 55),
(69, 'product/photo_2022-02-15_10-49-07_Vh4olU4.jpg', NULL),
(72, 'product/in-uhd-4k-tv-ua55aue60aklxl-l-perspective--gray-436230136_koTjNTa.jpeg', NULL),
(76, 'product/dellemc_pet40_internal_td_kiz7de3.jpeg', NULL),
(78, 'product/delivery-boy-service-1000x1000_lPLU1zw.jpg', NULL),
(80, 'product/51_9VMHQOu.png', NULL),
(82, 'product/photo_2022-02-18_17-06-41_W49lyE5.jpg', NULL),
(84, 'product/51_Km7l6zb.png', NULL),
(85, 'product/photo_2022-02-26_11-27-19_mWhVsWy.jpg', NULL),
(86, 'product/photo_2022-02-26_11-27-12_yBNL1sQ.jpg', NULL),
(87, 'product/photo_2022-02-26_11-26-33.jpg', 62),
(88, 'product/photo_2022-02-26_11-27-12_D8nyyK0.jpg', 62),
(89, 'product/photo_2022-02-26_11-27-19.jpg', 62),
(90, 'product/photo_2022-02-26_11-55-39.jpg', 63),
(91, 'product/photo_2022-02-26_11-55-47.jpg', 63),
(92, 'product/photo_2022-02-26_11-55-56.jpg', 63),
(93, 'product/photo_2022-02-26_11-55-56_u1LE7mv.jpg', NULL),
(94, 'product/photo_2022-02-26_21-54-25.jpg', 64),
(95, 'product/photo_2022-02-26_21-54-28.jpg', 64),
(96, 'product/photo_2022-02-26_21-54-36.jpg', 64),
(97, 'product/photo_2022-02-26_21-54-36_sZq4lNU.jpg', NULL),
(98, 'product/photo_2022-02-26_21-54-04.jpg', 65),
(99, 'product/photo_2022-02-26_21-54-12.jpg', 65),
(100, 'product/photo_2022-02-26_21-54-16.jpg', 65),
(101, 'product/photo_2022-02-26_21-54-16_082V814.jpg', NULL),
(102, 'product/photo_2022-02-26_21-55-01.jpg', 66),
(103, 'product/photo_2022-02-26_21-55-04.jpg', 66),
(104, 'product/photo_2022-02-26_21-55-07.jpg', 66),
(105, 'product/photo_2022-02-26_21-55-07_hLZIs9K.jpg', NULL),
(106, 'product/photo_2022-02-26_21-55-27_tC8dBUv.jpg', NULL),
(110, 'product/photo_2022-02-26_21-55-27_UgK4Ift.jpg', NULL),
(115, 'product/in-uhd-4k-tv-ua55aue60aklxl-front--gray-436230152.jpeg', 68),
(116, 'product/in-uhd-4k-tv-ua55aue60aklxl-l-perspective--gray-436230136.jpeg', 68),
(117, 'product/in-uhd-4k-tv-ua55aue60aklxl-l-perspective--gray-436230136_quoNym6.jpeg', NULL),
(118, 'product/dellemc_pet40_above_lf_bk.jpeg', 69),
(119, 'product/dellemc_pet40_bf_bk.jpeg', 69),
(120, 'product/dellemc_pet40_internal_td.jpeg', 69),
(121, 'product/dellemc_pet40_internal_td_ckcMNkF.jpeg', NULL),
(126, 'product/photo_2022-02-27_09-58-56_GebP9sy.jpg', NULL),
(130, 'product/dellemc_pet40_internal_td_knNSa7n.jpeg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_offers`
--

CREATE TABLE `accounts_offers` (
  `id` bigint(20) NOT NULL,
  `discount_name` varchar(45) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `discount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_order`
--

CREATE TABLE `accounts_order` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `tot_amount` int(11) NOT NULL,
  `customer_idCustomer` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `returndeposite` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_order`
--

INSERT INTO `accounts_order` (`id`, `date`, `tot_amount`, `customer_idCustomer`, `customer_id`, `returndeposite`) VALUES
(61, '2022-02-27', 47698, 0, 55, 1),
(62, '2022-02-27', 32735, 0, 47, 0);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_orderstatus`
--

CREATE TABLE `accounts_orderstatus` (
  `id` bigint(20) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_orderstatus`
--

INSERT INTO `accounts_orderstatus` (`id`, `status`) VALUES
(4, 'cancelled'),
(3, 'confirmed'),
(6, 'delivered'),
(1, 'pending'),
(7, 'pickedup');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_payback`
--

CREATE TABLE `accounts_payback` (
  `id` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `description` longtext DEFAULT NULL,
  `cheque_num` int(11) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `cancellation` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_payback`
--

INSERT INTO `accounts_payback` (`id`, `date`, `amount`, `description`, `cheque_num`, `order_id`, `cancellation`) VALUES
(32, '2022-02-27', 15500, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque cum natus veniam rem odio officia libero praesentium corporis', 1234455, 61, 0);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_payment`
--

CREATE TABLE `accounts_payment` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `tot_amount` int(11) NOT NULL,
  `transaction_id` varchar(45) NOT NULL,
  `bank_ref_num` varchar(45) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `payment_method_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_paymentmethod`
--

CREATE TABLE `accounts_paymentmethod` (
  `id` bigint(20) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_paymentmethod`
--

INSERT INTO `accounts_paymentmethod` (`id`, `name`) VALUES
(1, 'paytm'),
(2, 'net banking');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_product`
--

CREATE TABLE `accounts_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `desc` longtext DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `rent_per_day` double NOT NULL,
  `rent_per_week` double NOT NULL,
  `rent_per_month` double NOT NULL,
  `deposit` int(11) NOT NULL,
  `delivery_pickup_charges` int(11) NOT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `subcategory_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_product`
--

INSERT INTO `accounts_product` (`id`, `name`, `desc`, `quantity`, `rent_per_day`, `rent_per_week`, `rent_per_month`, `deposit`, `delivery_pickup_charges`, `brand_id`, `subcategory_id`, `category_id`) VALUES
(54, 'thinkbook 14 gen 2(intel)', '2 Cores / 4 Threads, 3.00 GHz, up to 4.10 GHz with Turbo Boost, 6 MB Cache,8 GB DDR4 RAM,256 GB SSD', 0, 300, 900, 2800, 3500, 500, 6, 66, 59),
(55, 'apple macbook', '8GB RAM,258GB SSD,apple M1 GPU,33.78cm,space gray', 16, 300, 2000, 7000, 3500, 500, 4, 61, 59),
(62, 'IdeaPad Slim 5i (15, Intel)', '16GB, 512GB SSD, Windows 10/MS Office, Backlit Keyboard, Fingerprint Reader, Graphite Grey, 1.66Kg', 2, 500, 5000, 8000, 5000, 200, 6, 66, 59),
(63, 'Philips Audio SPA9070 70 W Tower Speaker', 'Optical Input and Mic, Black, Wireless, Bluetooth', 17, 400, 2500, 9000, 3000, 300, 9, 67, 60),
(64, 'OnePlus Ultra HD LED smart Tv', 'Ultra HD 4K (3840 x 2160), 3 HDMI ports (HDMI 2.1 Compatible, HDMI 1 supports eARC) & 2 USB ports', 3, 300, 2000, 7000, 500, 100, 10, 64, 60),
(65, 'HP All-in-One 22  FHD Desktop', 'AMD Ryzen 3 3250U (2.6 GHz base clock, up to 3.5 GHz,Memory: 4 GB DDR4-2400 SDRAM (1 x 4 GB),Display: 21.5 diagonal Full HD,Operating System & Preinstalled Software:Pre-loaded Windows 10 Home with lifetime validity, FREE Upgrade to Windows 11', 13, 300, 1900, 7200, 2000, 100, 11, 68, 59),
(66, 'uawei 13\" Matebook X Laptop', '2.7 GHz Intel Core i7-7500U Dual-Core 8GB LPDDR3 | 512GB PCIe SSD 13\" 2560 x 1440 QHD IPS Display Integrated Intel HD Graphics 620 802.11ac Dual-Band Wi-Fi | Bluetooth USB Type-C | Fingerprint Reader Fanless Design MateDock Included Windows 10 Home (64-Bit)', 5, 500, 3200, 12000, 3500, 300, 12, 66, 59),
(68, 'Crystal 4K UHD Smart TV', 'Crystal 4K Pro UHD (3840 x 2160) resolution | Refresh Rate : 60 Hertz ,Display: Ultra HD (4k) LED Panel | One Billion Colors | Air Slim Design | Supports HDR 10+ | PurColor | Mega Contarst | UHD Dimming | Auto Game Mode', 0, 400, 2200, 8000, 3000, 200, 7, 64, 60),
(69, 'Dell PowerEdge T40', 'SATA (HDD) Power Supplies300W Bronze FeaturesTechnical Specification Processor1 x Intel Xeon E-2224G 3.5GHz 8M Cach, SATA (HDD) Power Supplies300W Bronze FeaturesTechnical Specification Processor1 x Intel Xeon E-2224G 3.5GHz 8M Cach', 0, 600, 4000, 14000, 5000, 300, 1, 63, 59);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_producthasoffers`
--

CREATE TABLE `accounts_producthasoffers` (
  `product_idproduct` bigint(20) NOT NULL,
  `offers_id_offer` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_producthasorder`
--

CREATE TABLE `accounts_producthasorder` (
  `id` bigint(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `rent_price` int(11) NOT NULL,
  `deposit` int(11) NOT NULL,
  `delivery_pickup_charge` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cancel_date` date DEFAULT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `cancelpay` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_producthasorder`
--

INSERT INTO `accounts_producthasorder` (`id`, `start_date`, `end_date`, `rent_price`, `deposit`, `delivery_pickup_charge`, `quantity`, `cancel_date`, `order_id`, `product_id`, `status_id`, `cancelpay`) VALUES
(55, '2022-02-27', '2022-03-09', 6286, 5000, 300, 1, NULL, 61, 69, 7, 0),
(56, '2022-02-27', '2022-03-09', 15087, 10500, 900, 3, NULL, 61, 66, 7, 0),
(57, '2022-02-27', '2022-03-03', 5000, 10000, 400, 2, '2022-02-27', 61, 62, 4, 0),
(58, '2022-02-27', '2022-03-04', 6000, 10000, 400, 2, NULL, 62, 62, 7, 0),
(59, '2022-02-27', '2022-03-11', 3342, 7000, 1000, 2, NULL, 62, 54, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_state`
--

CREATE TABLE `accounts_state` (
  `id` bigint(20) NOT NULL,
  `state_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_state`
--

INSERT INTO `accounts_state` (`id`, `state_name`) VALUES
(3, 'gujrat');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(3, 'admin'),
(1, 'customer'),
(2, 'deliveryboy'),
(4, 'guest');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add area', 7, 'add_area'),
(26, 'Can change area', 7, 'change_area'),
(27, 'Can delete area', 7, 'delete_area'),
(28, 'Can view area', 7, 'view_area'),
(29, 'Can add auth group', 8, 'add_authgroup'),
(30, 'Can change auth group', 8, 'change_authgroup'),
(31, 'Can delete auth group', 8, 'delete_authgroup'),
(32, 'Can view auth group', 8, 'view_authgroup'),
(33, 'Can add auth permission', 9, 'add_authpermission'),
(34, 'Can change auth permission', 9, 'change_authpermission'),
(35, 'Can delete auth permission', 9, 'delete_authpermission'),
(36, 'Can view auth permission', 9, 'view_authpermission'),
(37, 'Can add auth user', 10, 'add_authuser'),
(38, 'Can change auth user', 10, 'change_authuser'),
(39, 'Can delete auth user', 10, 'delete_authuser'),
(40, 'Can view auth user', 10, 'view_authuser'),
(41, 'Can add brand', 11, 'add_brand'),
(42, 'Can change brand', 11, 'change_brand'),
(43, 'Can delete brand', 11, 'delete_brand'),
(44, 'Can view brand', 11, 'view_brand'),
(45, 'Can add category', 12, 'add_category'),
(46, 'Can change category', 12, 'change_category'),
(47, 'Can delete category', 12, 'delete_category'),
(48, 'Can view category', 12, 'view_category'),
(49, 'Can add customer', 13, 'add_customer'),
(50, 'Can change customer', 13, 'change_customer'),
(51, 'Can delete customer', 13, 'delete_customer'),
(52, 'Can view customer', 13, 'view_customer'),
(53, 'Can add delivery boy', 14, 'add_deliveryboy'),
(54, 'Can change delivery boy', 14, 'change_deliveryboy'),
(55, 'Can delete delivery boy', 14, 'delete_deliveryboy'),
(56, 'Can view delivery boy', 14, 'view_deliveryboy'),
(57, 'Can add django content type', 15, 'add_djangocontenttype'),
(58, 'Can change django content type', 15, 'change_djangocontenttype'),
(59, 'Can delete django content type', 15, 'delete_djangocontenttype'),
(60, 'Can view django content type', 15, 'view_djangocontenttype'),
(61, 'Can add django migrations', 16, 'add_djangomigrations'),
(62, 'Can change django migrations', 16, 'change_djangomigrations'),
(63, 'Can delete django migrations', 16, 'delete_djangomigrations'),
(64, 'Can view django migrations', 16, 'view_djangomigrations'),
(65, 'Can add django session', 17, 'add_djangosession'),
(66, 'Can change django session', 17, 'change_djangosession'),
(67, 'Can delete django session', 17, 'delete_djangosession'),
(68, 'Can view django session', 17, 'view_djangosession'),
(69, 'Can add hardwares', 18, 'add_hardwares'),
(70, 'Can change hardwares', 18, 'change_hardwares'),
(71, 'Can delete hardwares', 18, 'delete_hardwares'),
(72, 'Can view hardwares', 18, 'view_hardwares'),
(73, 'Can add offers', 19, 'add_offers'),
(74, 'Can change offers', 19, 'change_offers'),
(75, 'Can delete offers', 19, 'delete_offers'),
(76, 'Can view offers', 19, 'view_offers'),
(77, 'Can add order', 20, 'add_order'),
(78, 'Can change order', 20, 'change_order'),
(79, 'Can delete order', 20, 'delete_order'),
(80, 'Can view order', 20, 'view_order'),
(81, 'Can add payment method', 21, 'add_paymentmethod'),
(82, 'Can change payment method', 21, 'change_paymentmethod'),
(83, 'Can delete payment method', 21, 'delete_paymentmethod'),
(84, 'Can view payment method', 21, 'view_paymentmethod'),
(85, 'Can add product', 22, 'add_product'),
(86, 'Can change product', 22, 'change_product'),
(87, 'Can delete product', 22, 'delete_product'),
(88, 'Can view product', 22, 'view_product'),
(89, 'Can add return deposit', 23, 'add_returndeposit'),
(90, 'Can change return deposit', 23, 'change_returndeposit'),
(91, 'Can delete return deposit', 23, 'delete_returndeposit'),
(92, 'Can view return deposit', 23, 'view_returndeposit'),
(93, 'Can add state', 24, 'add_state'),
(94, 'Can change state', 24, 'change_state'),
(95, 'Can delete state', 24, 'delete_state'),
(96, 'Can view state', 24, 'view_state'),
(97, 'Can add product img', 25, 'add_productimg'),
(98, 'Can change product img', 25, 'change_productimg'),
(99, 'Can delete product img', 25, 'delete_productimg'),
(100, 'Can view product img', 25, 'view_productimg'),
(101, 'Can add payment', 26, 'add_payment'),
(102, 'Can change payment', 26, 'change_payment'),
(103, 'Can delete payment', 26, 'delete_payment'),
(104, 'Can view payment', 26, 'view_payment'),
(105, 'Can add hardware details', 27, 'add_hardwaredetails'),
(106, 'Can change hardware details', 27, 'change_hardwaredetails'),
(107, 'Can delete hardware details', 27, 'delete_hardwaredetails'),
(108, 'Can view hardware details', 27, 'view_hardwaredetails'),
(109, 'Can add feedback rating', 28, 'add_feedbackrating'),
(110, 'Can change feedback rating', 28, 'change_feedbackrating'),
(111, 'Can delete feedback rating', 28, 'delete_feedbackrating'),
(112, 'Can view feedback rating', 28, 'view_feedbackrating'),
(113, 'Can add django admin log', 29, 'add_djangoadminlog'),
(114, 'Can change django admin log', 29, 'change_djangoadminlog'),
(115, 'Can delete django admin log', 29, 'delete_djangoadminlog'),
(116, 'Can view django admin log', 29, 'view_djangoadminlog'),
(117, 'Can add delivery pickup', 30, 'add_deliverypickup'),
(118, 'Can change delivery pickup', 30, 'change_deliverypickup'),
(119, 'Can delete delivery pickup', 30, 'delete_deliverypickup'),
(120, 'Can view delivery pickup', 30, 'view_deliverypickup'),
(121, 'Can add customize', 31, 'add_customize'),
(122, 'Can change customize', 31, 'change_customize'),
(123, 'Can delete customize', 31, 'delete_customize'),
(124, 'Can view customize', 31, 'view_customize'),
(125, 'Can add city', 32, 'add_city'),
(126, 'Can change city', 32, 'change_city'),
(127, 'Can delete city', 32, 'delete_city'),
(128, 'Can view city', 32, 'view_city'),
(129, 'Can add auth user user permissions', 33, 'add_authuseruserpermissions'),
(130, 'Can change auth user user permissions', 33, 'change_authuseruserpermissions'),
(131, 'Can delete auth user user permissions', 33, 'delete_authuseruserpermissions'),
(132, 'Can view auth user user permissions', 33, 'view_authuseruserpermissions'),
(133, 'Can add auth user groups', 34, 'add_authusergroups'),
(134, 'Can change auth user groups', 34, 'change_authusergroups'),
(135, 'Can delete auth user groups', 34, 'delete_authusergroups'),
(136, 'Can view auth user groups', 34, 'view_authusergroups'),
(137, 'Can add auth group permissions', 35, 'add_authgrouppermissions'),
(138, 'Can change auth group permissions', 35, 'change_authgrouppermissions'),
(139, 'Can delete auth group permissions', 35, 'delete_authgrouppermissions'),
(140, 'Can view auth group permissions', 35, 'view_authgrouppermissions'),
(141, 'Can add product has order', 36, 'add_producthasorder'),
(142, 'Can change product has order', 36, 'change_producthasorder'),
(143, 'Can delete product has order', 36, 'delete_producthasorder'),
(144, 'Can view product has order', 36, 'view_producthasorder'),
(145, 'Can add product has offers', 37, 'add_producthasoffers'),
(146, 'Can change product has offers', 37, 'change_producthasoffers'),
(147, 'Can delete product has offers', 37, 'delete_producthasoffers'),
(148, 'Can view product has offers', 37, 'view_producthasoffers'),
(149, 'Can add product has hardwares', 38, 'add_producthashardwares'),
(150, 'Can change product has hardwares', 38, 'change_producthashardwares'),
(151, 'Can delete product has hardwares', 38, 'delete_producthashardwares'),
(152, 'Can view product has hardwares', 38, 'view_producthashardwares'),
(153, 'Can add customize has hardwares', 39, 'add_customizehashardwares'),
(154, 'Can change customize has hardwares', 39, 'change_customizehashardwares'),
(155, 'Can delete customize has hardwares', 39, 'delete_customizehashardwares'),
(156, 'Can view customize has hardwares', 39, 'view_customizehashardwares'),
(157, 'Can add cart', 40, 'add_cart'),
(158, 'Can change cart', 40, 'change_cart'),
(159, 'Can delete cart', 40, 'delete_cart'),
(160, 'Can view cart', 40, 'view_cart'),
(161, 'Can add area has delivery boy', 41, 'add_areahasdeliveryboy'),
(162, 'Can change area has delivery boy', 41, 'change_areahasdeliveryboy'),
(163, 'Can delete area has delivery boy', 41, 'delete_areahasdeliveryboy'),
(164, 'Can view area has delivery boy', 41, 'view_areahasdeliveryboy'),
(165, 'Can add admin', 42, 'add_admin'),
(166, 'Can change admin', 42, 'change_admin'),
(167, 'Can delete admin', 42, 'delete_admin'),
(168, 'Can view admin', 42, 'view_admin'),
(169, 'Can add image', 25, 'add_image'),
(170, 'Can change image', 25, 'change_image'),
(171, 'Can delete image', 25, 'delete_image'),
(172, 'Can view image', 25, 'view_image'),
(173, 'Can add order status', 43, 'add_orderstatus'),
(174, 'Can change order status', 43, 'change_orderstatus'),
(175, 'Can delete order status', 43, 'delete_orderstatus'),
(176, 'Can view order status', 43, 'view_orderstatus'),
(177, 'Can add pay back', 44, 'add_payback'),
(178, 'Can change pay back', 44, 'change_payback'),
(179, 'Can delete pay back', 44, 'delete_payback'),
(180, 'Can view pay back', 44, 'view_payback'),
(181, 'Can add otp', 45, 'add_otp'),
(182, 'Can change otp', 45, 'change_otp'),
(183, 'Can delete otp', 45, 'delete_otp'),
(184, 'Can view otp', 45, 'view_otp');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(69, 'pbkdf2_sha256$260000$I92Fx27lUhU1mslpN71yBJ$amN5o5xaAu5rsQkNXdCGOGRDa+BGYhe224hIXA4rCRs=', NULL, 0, 'ishanichovatiya', 'ishani', 'chovatiya', 'ishani2002@gmail.com', 0, 1, '2022-01-22 05:23:59.997150'),
(75, 'pbkdf2_sha256$260000$QW7F2RshzZTXQcoYTYMWKp$JppbvHA9zlFeLOe+FNFRodvDfPViLeKiR1gSJ6sRpac=', '2022-01-29 17:01:33.000000', 1, 'dhruvi', 'dhruvi', 'vadhvana', 'dhruvivadhvana@gmail.com', 1, 1, '2022-01-29 17:01:25.000000'),
(76, 'pbkdf2_sha256$320000$9HynVplgCQ5iNXt6xwVIhI$Z/TVp/GrwSB12wG/GtfPDWNPl1nD0Yo0DhlzXkpeCxI=', '2022-02-27 09:20:43.340673', 1, 'viraj', 'viraj', 'faldu', 'virajfaldu672002@gmail.com', 1, 1, '2022-01-29 17:02:45.000000'),
(77, 'pbkdf2_sha256$320000$SPxI5foKnM1RAukr42NZsU$55H8ZCAxpwHaEUQhj/zZyZpNdurVfDtSZnCNStpwd0c=', '2022-02-27 04:17:58.282510', 0, 'ishwarmarvadi', 'ishwar', 'marvadi', 'ishwar26122001@gmail.com', 0, 1, '2022-01-30 06:11:21.000000'),
(78, 'pbkdf2_sha256$260000$zp40NwJ67ukfdsrymTYfYs$zFKeX9+srqbAHiNlKmWh7rNzc6tWZaVw0RWtcteTmOc=', NULL, 0, 'jayvadhaiya', 'jay', 'vadhaiya', 'jayvadhaiya2002@gmail.com', 0, 1, '2022-01-30 06:12:19.731835'),
(79, 'pbkdf2_sha256$320000$8FjxmzsMRIZDVwPYueSlvX$CcWssg/Oz1byObzSBKWOIbSj28Sr/yCZnEKVpoSPBUo=', '2022-02-27 09:30:53.000000', 0, 'lavpatel', 'lav', 'patel', 'virajfaldu672002@gmail.com', 0, 1, '2022-01-30 06:12:55.000000'),
(80, 'pbkdf2_sha256$260000$1u3PllCeaoTUjZytQAxfSS$OI6UYnCe2gnIRsfg54HbceinoivouLTEWR/CXPQgP00=', '2022-02-25 10:07:55.827002', 0, 'dhruvdhanani', 'dhruv', 'dhanani', 'dhruvdhanani@gmail.com', 0, 1, '2022-01-30 06:13:53.450652'),
(82, 'pbkdf2_sha256$320000$PjDDT9wEZLaPIzwSMn016z$hkOP6uDgj3i+mrnzITppTZSiKBV6YKQGW+4ACuq8lfI=', '2022-02-27 05:53:29.275832', 0, 'AllenJones', 'Allen', 'Jones', 'AllenJones@gmail.com', 0, 1, '2022-01-30 06:20:20.173940'),
(83, 'pbkdf2_sha256$320000$E3DSqSzhHEHO9b8jIrWtxA$ivwhR3kg0YCTWqzwSfUV6isqdPR/GiL+1Nq4Sq+1geE=', '2022-02-27 05:52:25.536531', 0, 'BarkerHarris', 'Barker', 'Harris', 'BarkerHarris@gmail.com', 0, 1, '2022-01-30 06:21:22.063118'),
(84, 'pbkdf2_sha256$260000$m1kVSQvI4LdBLjFjkQQuga$suyCit/RnLfKMH/icXwr2OXvE9O+KayU6FsXQXsW0/g=', NULL, 0, 'jamesdavies', 'James', 'Davies', 'jamesdavies@gmail.com', 0, 1, '2022-02-04 10:34:08.679616'),
(85, 'pbkdf2_sha256$320000$g3PErfOcAM46vF4xKAlqST$YQlmjsSoyRtbGyqQliS15yMsmYFK7J874FsabiiJCLU=', '2022-02-27 09:48:06.605788', 0, 'Lucastaylor', 'Lucas', 'Taylor', 'Lucastaylor@gmail.com', 0, 1, '2022-02-04 10:35:54.534214'),
(87, 'pbkdf2_sha256$320000$ps4jrav725HEUwcrhV1eT8$BzoQIBB6UFhjdHc4a6Yr9saF80UqiP7JcE0iEZs2Dho=', '2022-02-27 09:49:16.443434', 0, 'johndue', 'john', 'due', 'johndue@gmail.com', 0, 1, '2022-02-13 13:17:28.163786'),
(88, 'pbkdf2_sha256$260000$TvBECuW0Sev2qJGaoaUEsL$7X66dEESutVofNLKba6VEjh6d/qhN52usqhVMvc8BEc=', NULL, 0, 'pratixachudasma', 'pratixa', 'chudasma', 'pratixachudasma@gmail.com', 0, 0, '2022-02-14 13:05:41.695723'),
(89, 'pbkdf2_sha256$260000$FDSP81sQO2sTP81Z8SMnPg$sfulzCChgdVgZsdRfgumm0emIJnUfGPAoxe55zEz5iQ=', NULL, 0, 'harshsolanki', 'harsh', 'solanki', 'harshsolanki@gmail.com', 0, 0, '2022-02-14 13:06:38.144951'),
(90, 'pbkdf2_sha256$260000$K44khQdW6LJTec0ou1FhLV$tsdsJdEmrJq8/6VpKh5MQPNyvPk/ATuAuYIdLsDWCy8=', NULL, 0, 'aayushipanchal', 'aayushi', 'panchal', 'aayushipanchal@gmail.com', 0, 0, '2022-02-14 13:08:02.393871'),
(91, 'pbkdf2_sha256$260000$Ic0p4aDS5cEWFVMk62xETA$onMQGo1octPtfc2vVUKCp/5iSeXuMUA6PZFLhzRS7MQ=', NULL, 0, 'harshsurela', 'harsh', 'surela', 'harshsurel@gmail.com', 0, 0, '2022-02-14 13:09:02.846992'),
(92, 'pbkdf2_sha256$260000$MX0ZvmzgCKg7pjZiVZ84G9$23dFj2JfnqwKiJCzOrkQmKGnLqDdE0DCWDdLbNNd2BU=', NULL, 0, 'krupaharkhani', 'krupa', 'harkhani', 'krupaharkhani@gmail.com', 0, 1, '2022-02-14 13:10:09.579136'),
(93, 'pbkdf2_sha256$260000$vOlWrFoe3Wqv4OCAFFEnP8$eubOOzgnVW1QECPmsEliuui+uJQn5Aoy/F5BCb/w8cY=', NULL, 0, 'kervivithali', 'kervi', 'vithali', 'kervivithali@gmail.com', 0, 1, '2022-02-14 13:11:49.904115'),
(94, 'pbkdf2_sha256$260000$uNi6SvwnTQpKrHRa4d6zLW$Zpx4vFVJ88d7QNAfBapEL/Jm/IXmjRR2m3Keyd7gi7w=', '2022-02-15 10:06:22.859226', 0, 'johnnypaul', 'johnny', 'paul', 'johnnypaul@gmail.com', 0, 1, '2022-02-14 13:19:21.875853'),
(95, 'pbkdf2_sha256$320000$sumfZ86QMVi5zHikPLI7XW$At/VZSEZ0XQW82lN74Z6IHO/UcV3DdZIdt6V2fBtLrU=', '2022-02-27 05:04:47.000000', 0, 'ramupatel', 'ramu', 'patel', 'ramupatel@gmail.com', 0, 1, '2022-02-27 04:52:59.000000'),
(96, 'pbkdf2_sha256$320000$6xDpBS1sfp1xcRlhGuMJBb$vUqcxVzjSnDZgyOkbOlG1dFfY6P+qNk4nYnGKHAKRfk=', NULL, 0, 'samupatel', 'samu', 'patel', 'samupatel@gmail.com', 0, 1, '2022-02-27 05:08:35.515390'),
(97, 'pbkdf2_sha256$390000$fAE74qKdL0X8g4IBFTNVP9$EXukvx9cG2jmUNC6Wp156DBRTtkLkVIOQzkmd2t3F3s=', '2024-04-01 18:13:20.235950', 1, 'superadmin', '', '', 'virajfaldu672002@gmail.com', 1, 1, '2024-04-01 18:12:48.706950');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(37, 69, 1),
(44, 75, 3),
(43, 76, 3),
(45, 77, 1),
(46, 78, 1),
(47, 79, 1),
(48, 80, 1),
(49, 82, 2),
(50, 83, 2),
(51, 84, 2),
(52, 85, 2),
(53, 87, 2),
(54, 88, 1),
(55, 89, 1),
(56, 90, 1),
(57, 91, 1),
(58, 92, 1),
(59, 93, 1),
(60, 94, 2),
(61, 95, 1),
(62, 96, 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(257, '2022-01-29 17:01:42.285742', '31', 'viraj', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 4, 75),
(258, '2022-01-29 17:02:45.524877', '76', 'viraj', 1, '[{\"added\": {}}]', 4, 75),
(259, '2022-01-29 17:03:10.624501', '76', 'viraj', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"Superuser status\", \"Groups\"]}}]', 4, 75),
(260, '2022-01-29 17:04:23.102850', '3', 'viraj', 1, '[{\"added\": {}}]', 42, 76),
(261, '2022-01-29 17:42:22.252663', '27', 'computer', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 12, 76),
(262, '2022-01-29 17:42:27.028278', '27', 'computer', 2, '[]', 12, 76),
(263, '2022-01-29 17:42:45.477641', '44', 'audio visual', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 12, 76),
(264, '2022-01-29 17:43:51.020474', '3', 'johndue', 2, '[{\"changed\": {\"fields\": [\"State\", \"City\", \"Area\"]}}]', 14, 76),
(265, '2022-01-29 17:44:37.564032', '31', 'samepaul has Naroda', 1, '[{\"added\": {}}]', 41, 76),
(266, '2022-01-30 05:22:35.403047', '1', 'OrderStatus object (1)', 1, '[{\"added\": {}}]', 43, 76),
(267, '2022-01-30 05:27:54.279070', '3', 'confirmed', 1, '[{\"added\": {}}]', 43, 76),
(268, '2022-01-30 05:28:26.093584', '4', 'cancelled', 1, '[{\"added\": {}}]', 43, 76),
(269, '2022-01-30 05:28:38.107568', '5', 'on the way', 1, '[{\"added\": {}}]', 43, 76),
(270, '2022-01-30 05:28:46.940052', '6', 'delivered', 1, '[{\"added\": {}}]', 43, 76),
(271, '2022-01-30 05:28:54.644763', '7', 'pickedup', 1, '[{\"added\": {}}]', 43, 76),
(272, '2022-01-30 05:46:59.640821', '4', 'rajsthan', 3, '', 24, 76),
(273, '2022-01-30 05:47:12.967972', '39', 'rental appliances 2', 2, '[]', 13, 76),
(274, '2022-01-30 05:47:20.414739', '3', 'viraj', 2, '[]', 42, 76),
(275, '2022-01-30 05:47:45.655808', '75', 'dhruvi', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Groups\"]}}]', 4, 76),
(276, '2022-01-30 05:48:01.477520', '75', 'dhruvi', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 76),
(277, '2022-01-30 05:48:24.332589', '73', 'johndue', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 76),
(278, '2022-01-30 05:48:59.468474', '4', 'dhruvi', 1, '[{\"added\": {}}]', 42, 76),
(279, '2022-01-30 05:49:12.379219', '3', 'johndue', 2, '[{\"changed\": {\"fields\": [\"State\", \"City\", \"Area\"]}}]', 14, 76),
(280, '2022-01-30 05:50:37.168049', '4', 'Narol', 1, '[{\"added\": {}}]', 7, 76),
(281, '2022-01-30 05:50:58.446397', '5', 'Navapura', 1, '[{\"added\": {}}]', 7, 76),
(282, '2022-01-30 05:51:54.812236', '6', 'Gujarat University', 1, '[{\"added\": {}}]', 7, 76),
(283, '2022-01-30 05:52:01.564962', '7', 'Gujarat University', 1, '[{\"added\": {}}]', 7, 76),
(284, '2022-01-30 05:52:11.447038', '7', 'Gujarat University', 3, '', 7, 76),
(285, '2022-01-30 06:06:20.268146', '4', 'vadodara', 1, '[{\"added\": {}}]', 32, 76),
(286, '2022-01-30 06:06:26.540847', '5', 'surat', 1, '[{\"added\": {}}]', 32, 76),
(287, '2022-01-30 06:07:06.059846', '8', 'Bhedvad', 1, '[{\"added\": {}}]', 7, 76),
(288, '2022-01-30 06:07:19.908493', '9', 'Bortha', 1, '[{\"added\": {}}]', 7, 76),
(289, '2022-01-30 06:07:45.175840', '10', 'Chalthan', 1, '[{\"added\": {}}]', 7, 76),
(290, '2022-01-30 06:08:14.456849', '11', 'Itwai', 1, '[{\"added\": {}}]', 7, 76),
(291, '2022-01-30 06:08:49.515102', '12', 'Amroli', 1, '[{\"added\": {}}]', 7, 76),
(292, '2022-01-30 06:09:02.722491', '13', 'Choranda', 1, '[{\"added\": {}}]', 7, 76),
(293, '2022-01-30 06:09:27.242901', '14', 'Bhoj', 1, '[{\"added\": {}}]', 7, 76),
(294, '2022-01-30 06:09:45.271133', '15', 'Itola', 1, '[{\"added\": {}}]', 7, 76),
(295, '2022-01-30 06:18:20.896258', '81', 'jemspaul', 3, '', 4, 76),
(296, '2022-01-30 06:22:04.389422', '74', 'samepaul', 3, '', 4, 76),
(297, '2022-01-31 10:31:41.839384', '3', 'rental appliances 2 ordered laptop', 1, '[{\"added\": {}}]', 36, 76),
(298, '2022-01-31 10:49:15.972873', '5', 'rental appliances 2', 2, '[{\"changed\": {\"fields\": [\"Tot amount\"]}}]', 20, 76),
(299, '2022-02-01 04:43:16.146480', '2', 'rental appliances 2 ordered computer', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(300, '2022-02-01 04:45:11.428445', '2', 'rental appliances 2 ordered computer', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(301, '2022-02-01 04:45:22.081239', '2', 'rental appliances 2 ordered computer', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(302, '2022-02-01 04:52:39.013701', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Deliveryboy\"]}}]', 36, 76),
(303, '2022-02-01 04:52:45.451071', '2', 'rental appliances 2 ordered computer', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(304, '2022-02-01 04:55:27.232726', '2', 'rental appliances 2 ordered computer', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(305, '2022-02-01 05:01:13.346335', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(306, '2022-02-01 05:01:24.994971', '2', 'rental appliances 2 ordered computer', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(307, '2022-02-01 05:01:44.199958', '5', 'rental appliances 2', 2, '[{\"changed\": {\"fields\": [\"Tot amount\"]}}]', 20, 76),
(308, '2022-02-01 05:02:03.105248', '5', 'rental appliances 2', 2, '[{\"changed\": {\"fields\": [\"Tot amount\"]}}]', 20, 76),
(309, '2022-02-01 05:02:15.499437', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(310, '2022-02-01 05:02:22.504212', '2', 'rental appliances 2 ordered computer', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(311, '2022-02-01 06:41:06.637514', '2', 'net banking', 1, '[{\"added\": {}}]', 21, 76),
(312, '2022-02-01 06:44:06.645867', '2', 'payment by rental appliances 2 for order date 2022-01-28', 1, '[{\"added\": {}}]', 26, 76),
(313, '2022-02-01 06:59:03.419808', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Cancel date\"]}}]', 36, 76),
(314, '2022-02-02 05:02:27.652425', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(315, '2022-02-02 05:04:16.606817', '2', 'DeliveryPickup object (2)', 1, '[{\"added\": {}}]', 30, 76),
(316, '2022-02-02 05:04:42.287298', '2', 'DeliveryPickup object (2)', 2, '[{\"changed\": {\"fields\": [\"Deliveryboy\"]}}]', 30, 76),
(317, '2022-02-02 05:06:32.256029', '2', 'DeliveryPickup object (2)', 3, '', 30, 76),
(318, '2022-02-02 05:07:27.501651', '3', 'DeliveryPickup object (3)', 3, '', 30, 76),
(319, '2022-02-02 05:23:45.085915', '4', 'DeliveryPickup object (4)', 2, '[{\"changed\": {\"fields\": [\"Deliveryboy\"]}}]', 30, 76),
(320, '2022-02-02 05:38:28.495955', '2', 'rental appliances 2 ordered computer', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(321, '2022-02-02 05:38:36.755673', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(322, '2022-02-02 05:39:42.997444', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(323, '2022-02-02 05:39:55.512163', '2', 'rental appliances 2 ordered computer', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(324, '2022-02-02 05:42:18.421813', '2', 'rental appliances 2 ordered computer', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(325, '2022-02-02 05:48:11.322378', '5', 'rental appliances 2', 2, '[{\"changed\": {\"fields\": [\"Tot amount\"]}}]', 20, 76),
(326, '2022-02-02 06:12:36.451547', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(327, '2022-02-02 06:17:38.641700', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(328, '2022-02-02 06:18:19.259036', '2', 'rental appliances 2 ordered computer', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(329, '2022-02-02 06:18:30.598275', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Cancel date\"]}}]', 36, 76),
(330, '2022-02-02 06:19:09.717834', '2', 'rental appliances 2 ordered computer', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(331, '2022-02-02 06:20:12.457273', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(332, '2022-02-02 06:20:53.321907', '2', 'rental appliances 2 ordered computer', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(333, '2022-02-02 06:21:50.794962', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(334, '2022-02-02 06:26:17.220022', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(335, '2022-02-02 06:26:44.068901', '2', 'rental appliances 2 ordered computer', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(336, '2022-02-02 06:27:13.871003', '5', 'rental appliances 2', 2, '[{\"changed\": {\"fields\": [\"Tot amount\"]}}]', 20, 76),
(337, '2022-02-02 06:34:29.868411', '2', 'rental appliances 2 ordered computer', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Cancel date\"]}}]', 36, 76),
(338, '2022-02-02 11:37:48.124507', '1', 'PayBack object (1)', 3, '', 44, 76),
(339, '2022-02-02 12:05:14.382242', '44', 'audio visual', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 12, 76),
(340, '2022-02-02 12:05:21.346428', '28', 'laptop', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 12, 76),
(341, '2022-02-02 12:05:27.034381', '27', 'computer', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 12, 76),
(342, '2022-02-02 12:10:56.328273', '3', 'PayBack object (3)', 3, '', 44, 76),
(343, '2022-02-02 12:11:00.854886', '2', 'PayBack object (2)', 3, '', 44, 76),
(344, '2022-02-02 12:14:07.579433', '4', 'PayBack object (4)', 3, '', 44, 76),
(345, '2022-02-02 12:15:43.872685', '5', 'PayBack object (5)', 3, '', 44, 76),
(346, '2022-02-02 12:24:30.526959', '6', 'PayBack object (6)', 3, '', 44, 76),
(347, '2022-02-03 10:47:51.297904', '7', 'PayBack object (7)', 2, '[]', 44, 76),
(348, '2022-02-03 10:49:02.574920', '7', 'PayBack object (7)', 3, '', 44, 76),
(349, '2022-02-03 10:53:31.206309', '8', 'PayBack object (8)', 3, '', 44, 76),
(350, '2022-02-03 10:53:53.627159', '9', 'PayBack object (9)', 2, '[{\"changed\": {\"fields\": [\"Cancellation\"]}}]', 44, 76),
(351, '2022-02-03 10:56:58.283280', '9', 'PayBack object (9)', 3, '', 44, 76),
(352, '2022-02-03 10:57:51.578186', '10', 'PayBack object (10)', 3, '', 44, 76),
(353, '2022-02-03 10:58:40.694638', '11', 'PayBack object (11)', 2, '[]', 44, 76),
(354, '2022-02-03 11:11:07.679647', '2', 'rental appliances 2 ordered computer', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(355, '2022-02-03 11:21:46.951287', '11', 'PayBack object (11)', 2, '[{\"changed\": {\"fields\": [\"Cancellation\"]}}]', 44, 76),
(356, '2022-02-03 11:22:27.061117', '11', 'PayBack object (11)', 2, '[]', 44, 76),
(357, '2022-02-03 11:25:51.405853', '11', 'PayBack object (11)', 2, '[{\"changed\": {\"fields\": [\"Cancellation\"]}}]', 44, 76),
(358, '2022-02-03 12:03:56.666722', '7', 'cake4you', 1, '[{\"added\": {}}]', 20, 76),
(359, '2022-02-03 12:04:30.755938', '4', 'cake4you ordered laptop', 1, '[{\"added\": {}}]', 36, 76),
(360, '2022-02-03 12:05:03.239582', '5', 'cake4you ordered computer', 1, '[{\"added\": {}}]', 36, 76),
(361, '2022-02-04 04:38:43.156050', '13', 'PayBack object (13)', 3, '', 44, 76),
(362, '2022-02-04 04:38:43.161996', '12', 'PayBack object (12)', 3, '', 44, 76),
(363, '2022-02-04 04:38:43.164245', '11', 'PayBack object (11)', 3, '', 44, 76),
(364, '2022-02-04 04:39:03.295654', '5', 'cake4you ordered computer', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Cancel date\"]}}]', 36, 76),
(365, '2022-02-04 04:39:15.922450', '4', 'cake4you ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Cancel date\"]}}]', 36, 76),
(366, '2022-02-04 04:39:25.850938', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Cancel date\"]}}]', 36, 76),
(367, '2022-02-04 04:49:13.035287', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(368, '2022-02-04 04:51:11.904498', '14', 'PayBack object (14)', 3, '', 44, 76),
(369, '2022-02-04 04:58:34.753725', '16', 'PayBack object (16)', 3, '', 44, 76),
(370, '2022-02-04 05:02:04.377330', '17', 'PayBack object (17)', 3, '', 44, 76),
(371, '2022-02-04 05:08:07.295681', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(372, '2022-02-04 05:08:35.121263', '18', 'PayBack object (18)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 44, 76),
(373, '2022-02-04 05:09:18.029648', '4', 'cake4you ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(374, '2022-02-04 05:09:47.949521', '15', 'duty aisgn to BarkerHarris for cake4you ordered laptop', 3, '', 30, 76),
(375, '2022-02-04 07:03:10.743207', '23', 'duty aisgn to BarkerHarris for cake4you ordered computer', 1, '[{\"added\": {}}]', 30, 76),
(376, '2022-02-04 07:03:41.639844', '23', 'duty aisgn to AllenJones for cake4you ordered computer', 2, '[{\"changed\": {\"fields\": [\"Deliveryboy\"]}}]', 30, 76),
(377, '2022-02-04 07:03:52.595650', '23', 'duty aisgn to AllenJones for cake4you ordered computer', 3, '', 30, 76),
(378, '2022-02-04 09:46:19.674222', '26', 'duty aisgn to BarkerHarris for cake4you ordered computer', 2, '[{\"changed\": {\"fields\": [\"Pickup\"]}}]', 30, 76),
(379, '2022-02-04 09:46:44.942593', '26', 'duty aisgn to BarkerHarris for cake4you ordered computer', 3, '', 30, 76),
(380, '2022-02-04 10:14:30.417336', '6', 'AllenJones', 2, '[{\"changed\": {\"fields\": [\"City\", \"Area\"]}}]', 14, 76),
(381, '2022-02-04 10:18:49.776492', '32', 'duty aisgn to johndue for rental appliances 2 ordered laptop', 3, '', 30, 76),
(382, '2022-02-04 10:18:49.778667', '31', 'duty aisgn to johndue for rental appliances 2 ordered computer', 3, '', 30, 76),
(383, '2022-02-05 07:15:20.946319', '3', 'ishwarmarvadi has requested forlenovo laptop Yoga 6 AMD 33.78cms - Abyss Blue', 1, '[{\"added\": {}}]', 31, 76),
(384, '2022-02-05 07:36:29.351435', '3', 'ishwarmarvadi has requested for lenovo laptop Yoga 6 AMD 33.78cms - Abyss Blue', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 31, 76),
(385, '2022-02-05 07:43:27.547963', '3', 'ishwarmarvadi has requested for lenovo laptop Yoga 6 AMD 33.78cms - Abyss Blue', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 31, 76),
(386, '2022-02-05 07:43:55.915810', '3', 'ishwarmarvadi has requested for lenovo laptop Yoga 6 AMD 33.78cms - Abyss Blue', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 31, 76),
(387, '2022-02-05 07:46:32.205624', '3', 'ishwarmarvadi has requested for Lenovo Ideapad Gaming 3 Ryzen 5 Hexa Core 5600H', 2, '[{\"changed\": {\"fields\": [\"Product name\", \"Description\"]}}]', 31, 76),
(388, '2022-02-05 10:31:49.545550', '32', 'Image object (32)', 3, '', 25, 76),
(389, '2022-02-05 11:39:45.215298', '3', 'ishwarmarvadi has requested for Lenovo Ideapad Gaming 3 Ryzen 5 Hexa Core 5600H', 2, '[{\"changed\": {\"fields\": [\"Pending\"]}}]', 31, 76),
(390, '2022-02-05 11:39:54.670623', '3', 'ishwarmarvadi has requested for Lenovo Ideapad Gaming 3 Ryzen 5 Hexa Core 5600H', 2, '[{\"changed\": {\"fields\": [\"Pending\"]}}]', 31, 76),
(391, '2022-02-05 11:41:10.973598', '3', 'ishwarmarvadi has requested for Lenovo Ideapad Gaming 3 Ryzen 5 Hexa Core 5600H', 2, '[{\"changed\": {\"fields\": [\"Pending\"]}}]', 31, 76),
(392, '2022-02-05 15:28:05.648900', '76', 'viraj', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 76),
(393, '2022-02-05 15:32:19.110371', '76', 'viraj', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 76),
(394, '2022-02-05 15:35:15.960925', '76', 'viraj', 2, '[]', 4, 76),
(395, '2022-02-05 16:17:44.890016', '77', 'ishwarmarvadi', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 76),
(396, '2022-02-05 16:19:35.882607', '3', 'ishwarmarvadi has requested for Lenovo Ideapad Gaming 3 Ryzen 5 Hexa Core 5600H', 2, '[{\"changed\": {\"fields\": [\"Pending\"]}}]', 31, 76),
(397, '2022-02-05 16:22:17.292896', '3', 'ishwarmarvadi has requested for Lenovo Ideapad Gaming 3 Ryzen 5 Hexa Core 5600H', 2, '[{\"changed\": {\"fields\": [\"Pending\"]}}]', 31, 76),
(398, '2022-02-05 16:23:13.739219', '19', 'PayBack object (19)', 3, '', 44, 76),
(399, '2022-02-05 16:23:13.741217', '18', 'PayBack object (18)', 3, '', 44, 76),
(400, '2022-02-05 16:23:13.743216', '15', 'PayBack object (15)', 3, '', 44, 76),
(401, '2022-02-05 16:28:10.014588', '3', 'ishwarmarvadi has requested for Lenovo Ideapad Gaming 3 Ryzen 5 Hexa Core 5600H', 2, '[{\"changed\": {\"fields\": [\"Pending\"]}}]', 31, 76),
(402, '2022-02-05 16:28:38.250756', '3', 'ishwarmarvadi has requested for Lenovo Ideapad Gaming 3 Ryzen 5 Hexa Core 5600H', 2, '[{\"changed\": {\"fields\": [\"Pending\"]}}]', 31, 76),
(403, '2022-02-06 04:40:59.900009', '4', 'lavpatel has requested for Lenovo IdeaPad', 1, '[{\"added\": {}}]', 31, 76),
(404, '2022-02-06 04:47:29.537686', '4', 'lavpatel has requested for Lenovo IdeaPad', 2, '[{\"changed\": {\"fields\": [\"Pending\"]}}]', 31, 76),
(405, '2022-02-06 04:49:52.184518', '3', 'ishwarmarvadi has requested for Lenovo Ideapad Gaming 3 Ryzen 5 Hexa Core 5600H', 2, '[{\"changed\": {\"fields\": [\"Pending\"]}}]', 31, 76),
(406, '2022-02-06 04:50:50.776140', '4', 'lavpatel has requested for Lenovo IdeaPad', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 31, 76),
(407, '2022-02-06 04:59:11.127242', '4', 'lavpatel has requested for Lenovo IdeaPad', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 31, 76),
(408, '2022-02-06 05:03:29.616001', '4', 'lavpatel has requested for Lenovo IdeaPad', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 31, 76),
(409, '2022-02-06 05:05:06.080093', '4', 'lavpatel has requested for Lenovo IdeaPad', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 31, 76),
(410, '2022-02-06 05:07:57.298585', '4', 'lavpatel has requested for Lenovo IdeaPad', 2, '[]', 31, 76),
(411, '2022-02-06 05:15:26.662963', '4', 'lavpatel has requested for Lenovo IdeaPad', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 31, 76),
(412, '2022-02-06 05:18:27.403430', '3', 'ishwarmarvadi has requested for Lenovo Ideapad Gaming 3 Ryzen 5 Hexa Core 5600H', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 31, 76),
(413, '2022-02-06 05:22:07.393781', '4', 'lavpatel has requested for Lenovo IdeaPad', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 31, 76),
(414, '2022-02-06 05:22:15.395715', '3', 'ishwarmarvadi has requested for Lenovo Ideapad Gaming 3 Ryzen 5 Hexa Core 5600H', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 31, 76),
(415, '2022-02-06 05:24:46.163347', '79', 'lavpatel', 2, '[{\"changed\": {\"fields\": [\"Last name\"]}}]', 4, 76),
(416, '2022-02-06 05:26:22.554270', '3', 'ishwarmarvadi has requested for Lenovo Ideapad Gaming 3 Ryzen 5 Hexa Core 5600H', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 31, 76),
(417, '2022-02-06 05:26:27.547050', '3', 'ishwarmarvadi has requested for Lenovo Ideapad Gaming 3 Ryzen 5 Hexa Core 5600H', 2, '[]', 31, 76),
(418, '2022-02-06 05:26:47.622907', '3', 'ishwarmarvadi has requested for Lenovo Ideapad Gaming 3 Ryzen 5 Hexa Core 5600H', 2, '[]', 31, 76),
(419, '2022-02-06 05:26:59.538799', '4', 'lavpatel has requested for Lenovo IdeaPad', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 31, 76),
(420, '2022-02-06 05:43:28.817696', '79', 'lavpatel', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 76),
(421, '2022-02-06 05:46:11.314639', '4', 'lavpatel has requested for Lenovo IdeaPad', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 31, 76),
(422, '2022-02-06 05:47:23.287530', '79', 'lavpatel', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 76),
(423, '2022-02-06 05:47:49.333401', '77', 'ishwarmarvadi', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 76),
(424, '2022-02-06 05:58:52.617301', '77', 'ishwarmarvadi', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 76),
(425, '2022-02-06 06:00:23.597970', '77', 'ishwarmarvadi', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 76),
(426, '2022-02-06 06:00:36.748889', '3', 'ishwarmarvadi has requested for Lenovo Ideapad Gaming 3 Ryzen 5 Hexa Core 5600H', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 31, 76),
(427, '2022-02-06 06:01:47.436314', '77', 'ishwarmarvadi', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 76),
(428, '2022-02-06 06:02:03.044525', '4', 'lavpatel has requested for Lenovo IdeaPad', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 31, 76),
(429, '2022-02-06 06:02:09.770950', '3', 'ishwarmarvadi has requested for Lenovo Ideapad Gaming 3 Ryzen 5 Hexa Core 5600H', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 31, 76),
(430, '2022-02-06 06:11:13.089951', '79', 'lavpatel', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 76),
(431, '2022-02-06 06:14:24.170183', '79', 'lavpatel', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 76),
(432, '2022-02-06 15:38:36.465187', '86', 'johndue1', 3, '', 4, 76),
(433, '2022-02-09 08:30:02.473670', '77', 'ishwarmarvadi', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 76),
(434, '2022-02-09 15:20:49.948962', '55', 'Image object (55)', 3, '', 25, 76),
(435, '2022-02-09 15:21:15.864717', '48', 'Image object (48)', 3, '', 25, 76),
(436, '2022-02-09 15:21:47.523041', '54', 'Image object (54)', 3, '', 25, 76),
(437, '2022-02-09 15:21:47.523041', '53', 'Image object (53)', 3, '', 25, 76),
(438, '2022-02-09 15:21:47.531042', '52', 'Image object (52)', 3, '', 25, 76),
(439, '2022-02-09 15:21:47.531042', '51', 'Image object (51)', 3, '', 25, 76),
(440, '2022-02-09 15:21:47.531042', '50', 'Image object (50)', 3, '', 25, 76),
(441, '2022-02-10 05:03:12.923985', '4', 'lavpatel has requested for Lenovo IdeaPad', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 31, 76),
(442, '2022-02-10 05:03:18.599905', '3', 'ishwarmarvadi has requested for Lenovo Ideapad Gaming 3 Ryzen 5 Hexa Core 5600H', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 31, 76),
(443, '2022-02-10 05:07:25.876091', '21', 'PayBack object (21)', 3, '', 44, 76),
(444, '2022-02-10 05:07:25.878420', '20', 'PayBack object (20)', 3, '', 44, 76),
(445, '2022-02-10 05:10:50.082726', '22', 'PayBack object (22)', 2, '[{\"changed\": {\"fields\": [\"Cancellation\"]}}]', 44, 76),
(446, '2022-02-10 05:11:25.658259', '22', 'PayBack object (22)', 2, '[{\"changed\": {\"fields\": [\"Cancellation\"]}}]', 44, 76),
(447, '2022-02-10 05:11:41.496426', '22', 'PayBack object (22)', 3, '', 44, 76),
(448, '2022-02-10 05:13:43.829026', '4', 'cake4you ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Cancel date\"]}}]', 36, 76),
(449, '2022-02-10 05:14:32.030461', '24', 'PayBack object (24)', 3, '', 44, 76),
(450, '2022-02-10 05:14:32.033458', '23', 'PayBack object (23)', 3, '', 44, 76),
(451, '2022-02-10 05:43:55.523259', '77', 'ishwarmarvadi', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 76),
(452, '2022-02-10 05:44:09.313878', '79', 'lavpatel', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 76),
(453, '2022-02-10 08:54:34.739099', '52', 'comjayja', 3, '', 12, 76),
(454, '2022-02-10 08:58:49.255576', '54', 'jj', 3, '', 12, 76),
(455, '2022-02-11 06:36:11.566629', '73', 'johndue', 3, '', 4, 76),
(456, '2022-02-11 06:38:07.363757', '10', 'viraj', 3, '', 14, 76),
(457, '2022-02-11 06:38:07.367756', '3', 'dhruvi', 3, '', 14, 76),
(458, '2022-02-12 05:38:33.483969', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(459, '2022-02-12 05:38:53.416967', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Cancel date\"]}}]', 36, 76),
(460, '2022-02-12 05:39:27.139614', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Cancel date\"]}}]', 36, 76),
(461, '2022-02-12 05:41:29.443692', '5', 'cake4you ordered computer', 2, '[{\"changed\": {\"fields\": [\"Cancelpay\"]}}]', 36, 76),
(462, '2022-02-12 05:41:36.986860', '4', 'cake4you ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Cancelpay\"]}}]', 36, 76),
(463, '2022-02-12 05:42:23.213324', '5', 'cake4you ordered computer', 2, '[{\"changed\": {\"fields\": [\"Cancelpay\"]}}]', 36, 76),
(464, '2022-02-12 05:44:17.561545', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Cancel date\"]}}]', 36, 76),
(465, '2022-02-12 05:44:45.066438', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Cancel date\"]}}]', 36, 76),
(466, '2022-02-12 06:21:53.699773', '4', 'cake4you ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Cancelpay\"]}}]', 36, 76),
(467, '2022-02-12 06:21:53.715766', '4', 'cake4you ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Cancelpay\"]}}]', 36, 76),
(468, '2022-02-12 06:25:50.960800', '26', 'PayBack object (26)', 3, '', 44, 76),
(469, '2022-02-12 06:25:50.963863', '25', 'PayBack object (25)', 3, '', 44, 76),
(470, '2022-02-12 06:27:42.347351', '4', 'cake4you ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Cancelpay\"]}}]', 36, 76),
(471, '2022-02-12 06:28:07.783939', '4', 'cake4you ordered laptop', 2, '[]', 36, 76),
(472, '2022-02-12 06:28:56.521413', '5', 'cake4you ordered computer', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Cancel date\"]}}]', 36, 76),
(473, '2022-02-12 06:29:05.685848', '27', 'PayBack object (27)', 3, '', 44, 76),
(474, '2022-02-12 06:29:47.642503', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Cancel date\"]}}]', 36, 76),
(475, '2022-02-12 06:30:12.781574', '4', 'cake4you ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Cancelpay\"]}}]', 36, 76),
(476, '2022-02-12 06:31:08.807766', '5', 'cake4you ordered computer', 2, '[]', 36, 76),
(477, '2022-02-12 06:31:18.859702', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Cancel date\", \"Cancelpay\"]}}]', 36, 76),
(478, '2022-02-12 06:31:40.899468', '29', 'PayBack object (29)', 3, '', 44, 76),
(479, '2022-02-12 06:31:40.901559', '28', 'PayBack object (28)', 3, '', 44, 76),
(480, '2022-02-12 06:32:48.453532', '4', 'cake4you ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Cancel date\", \"Cancelpay\"]}}]', 36, 76),
(481, '2022-02-12 06:33:17.333263', '5', 'cake4you ordered computer', 2, '[{\"changed\": {\"fields\": [\"Deposit\"]}}]', 36, 76),
(482, '2022-02-12 06:40:41.666709', '7', 'pickedup', 2, '[]', 43, 76),
(483, '2022-02-12 06:48:16.211631', '4', 'cake4you ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Cancel date\", \"Cancelpay\"]}}]', 36, 76),
(484, '2022-02-12 06:48:31.370829', '5', 'cake4you ordered computer', 2, '[{\"changed\": {\"fields\": [\"Cancel date\"]}}]', 36, 76),
(485, '2022-02-12 08:30:30.611367', '2', 'rental appliances 2 ordered computer', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Cancel date\"]}}]', 36, 76),
(486, '2022-02-12 08:30:53.859368', '2', 'rental appliances 2 ordered computer', 2, '[]', 36, 76),
(487, '2022-02-12 08:33:29.500889', '3', 'rental appliances 2 ordered laptop', 2, '[]', 36, 76),
(488, '2022-02-12 08:35:57.781483', '2', 'rental appliances 2 ordered computer', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Cancel date\"]}}]', 36, 76),
(489, '2022-02-12 08:36:46.046457', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(490, '2022-02-12 08:37:38.040617', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(491, '2022-02-12 08:37:58.987766', '3', 'rental appliances 2 ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 36, 76),
(492, '2022-02-12 14:01:10.685347', '8', 'SantokDesign', 1, '[{\"added\": {}}]', 20, 76),
(493, '2022-02-12 14:02:00.975603', '6', 'SantokDesign ordered server', 1, '[{\"added\": {}}]', 36, 76),
(494, '2022-02-12 14:02:27.772401', '7', 'SantokDesign ordered laptop', 1, '[{\"added\": {}}]', 36, 76),
(495, '2022-02-12 14:02:55.282310', '8', 'SantokDesign', 2, '[{\"changed\": {\"fields\": [\"Tot amount\"]}}]', 20, 76),
(496, '2022-02-13 04:28:17.189626', '8', 'SantokDesign ordered computer', 1, '[{\"added\": {}}]', 36, 76),
(497, '2022-02-13 04:51:28.913900', '41', 'duty aisgn to AllenJones for cake4you ordered laptop', 3, '', 30, 76),
(498, '2022-02-13 04:51:28.917403', '40', 'duty aisgn to AllenJones for cake4you ordered laptop', 3, '', 30, 76),
(499, '2022-02-13 04:51:28.919675', '36', 'duty aisgn to AllenJones for cake4you ordered computer', 3, '', 30, 76),
(500, '2022-02-13 04:51:28.921680', '35', 'duty aisgn to AllenJones for cake4you ordered computer', 3, '', 30, 76),
(501, '2022-02-13 05:56:21.254663', '48', 'duty aisgn to Lucastaylor for SantokDesign ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(502, '2022-02-13 05:56:26.775027', '46', 'duty aisgn to Lucastaylor for SantokDesign ordered computer', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(503, '2022-02-13 05:58:30.258505', '50', 'duty aisgn to Lucastaylor for SantokDesign ordered computer', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(504, '2022-02-13 06:02:42.645290', '50', 'duty aisgn to Lucastaylor for SantokDesign ordered computer', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(505, '2022-02-13 06:04:57.074436', '50', 'duty aisgn to Lucastaylor for SantokDesign ordered computer', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(506, '2022-02-13 06:06:12.131656', '50', 'duty aisgn to Lucastaylor for SantokDesign ordered computer', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(507, '2022-02-13 06:07:13.017984', '50', 'duty aisgn to Lucastaylor for SantokDesign ordered computer', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(508, '2022-02-13 06:12:04.067463', '46', 'duty aisgn to Lucastaylor for SantokDesign ordered computer', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(509, '2022-02-13 06:13:08.067094', '50', 'duty aisgn to Lucastaylor for SantokDesign ordered computer', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(510, '2022-02-13 06:13:13.635817', '46', 'duty aisgn to Lucastaylor for SantokDesign ordered computer', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(511, '2022-02-13 08:11:22.289284', '46', 'duty aisgn to Lucastaylor for SantokDesign ordered computer', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(512, '2022-02-13 08:11:28.109189', '48', 'duty aisgn to Lucastaylor for SantokDesign ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(513, '2022-02-13 08:11:33.841360', '49', 'duty aisgn to Lucastaylor for SantokDesign ordered server', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(514, '2022-02-13 08:15:10.570089', '46', 'duty aisgn to Lucastaylor for SantokDesign ordered computer', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(515, '2022-02-13 08:15:57.052934', '57', 'duty aisgn to Lucastaylor for SantokDesign ordered computer', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(516, '2022-02-13 09:28:39.723127', '48', 'duty aisgn to Lucastaylor for SantokDesign ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Dutydate\"]}}]', 30, 76),
(517, '2022-02-13 09:29:18.952758', '48', 'duty aisgn to Lucastaylor for SantokDesign ordered laptop', 2, '[{\"changed\": {\"fields\": [\"Dutydate\"]}}]', 30, 76),
(518, '2022-02-13 13:28:18.505748', '12', 'johndue', 1, '[{\"added\": {}}]', 14, 76),
(519, '2022-02-14 13:00:36.549502', '39', 'rental appliances', 2, '[{\"changed\": {\"fields\": [\"Company name\"]}}]', 13, 76),
(520, '2022-02-14 13:37:41.783931', '57', 'duty aisgn to Lucastaylor for SantokDesign ordered computer', 3, '', 30, 76),
(521, '2022-02-14 13:37:41.788528', '56', 'duty aisgn to jamesdavies for rental appliances ordered laptop', 3, '', 30, 76),
(522, '2022-02-14 13:37:41.791527', '55', 'duty aisgn to jamesdavies for rental appliances ordered computer', 3, '', 30, 76),
(523, '2022-02-14 13:37:41.793525', '54', 'duty aisgn to jamesdavies for rental appliances ordered laptop', 3, '', 30, 76),
(524, '2022-02-14 13:37:41.795525', '53', 'duty aisgn to jamesdavies for rental appliances ordered computer', 3, '', 30, 76),
(525, '2022-02-14 13:37:41.798523', '52', 'duty aisgn to Lucastaylor for SantokDesign ordered server', 3, '', 30, 76),
(526, '2022-02-14 13:37:41.801521', '51', 'duty aisgn to Lucastaylor for SantokDesign ordered laptop', 3, '', 30, 76),
(527, '2022-02-14 13:37:41.803521', '49', 'duty aisgn to Lucastaylor for SantokDesign ordered server', 3, '', 30, 76),
(528, '2022-02-14 13:37:41.805519', '48', 'duty aisgn to Lucastaylor for SantokDesign ordered laptop', 3, '', 30, 76),
(529, '2022-02-14 13:37:41.807517', '46', 'duty aisgn to Lucastaylor for SantokDesign ordered computer', 3, '', 30, 76),
(530, '2022-02-14 13:37:51.641454', '8', 'SantokDesign', 3, '', 20, 76),
(531, '2022-02-14 13:37:51.643733', '7', 'cake4you', 3, '', 20, 76),
(532, '2022-02-14 13:37:51.645472', '5', 'rental appliances', 3, '', 20, 76),
(533, '2022-02-15 05:34:51.107497', '9', 'cake4you', 1, '[{\"added\": {}}]', 20, 76),
(534, '2022-02-15 05:36:02.567103', '9', 'cake4you ordered apple macbook', 1, '[{\"added\": {}}]', 36, 76),
(535, '2022-02-15 05:36:56.267288', '10', 'cake4you ordered Dell Precision T7810 Tower Workstation', 1, '[{\"added\": {}}]', 36, 76),
(536, '2022-02-15 05:37:45.775576', '11', 'cake4you ordered thinkbook 14 gen 2(intel)', 1, '[{\"added\": {}}]', 36, 76),
(537, '2022-02-15 05:41:02.076175', '9', 'cake4you', 2, '[{\"changed\": {\"fields\": [\"Tot amount\"]}}]', 20, 76),
(538, '2022-02-15 05:41:53.132582', '10', 'SwipeWire', 1, '[{\"added\": {}}]', 20, 76),
(539, '2022-02-15 05:43:04.904680', '12', 'SwipeWire ordered thinkbook 14 gen 2(intel)', 1, '[{\"added\": {}}]', 36, 76),
(540, '2022-02-15 05:44:00.032585', '13', 'SwipeWire ordered Crystal 4K UHD Smart TV', 1, '[{\"added\": {}}]', 36, 76),
(541, '2022-02-15 05:44:53.672579', '11', 'rental appliances', 1, '[{\"added\": {}}]', 20, 76),
(542, '2022-02-15 05:46:02.201521', '14', 'rental appliances ordered Dell Precision T7810 Tower Workstation', 1, '[{\"added\": {}}]', 36, 76),
(543, '2022-02-15 05:47:18.685985', '15', 'rental appliances ordered thinkbook 14 gen 2(intel)', 1, '[{\"added\": {}}]', 36, 76),
(544, '2022-02-15 05:51:44.876324', '10', 'SwipeWire', 2, '[{\"changed\": {\"fields\": [\"Tot amount\"]}}]', 20, 76),
(545, '2022-02-15 05:52:39.750284', '15', 'rental appliances ordered thinkbook 14 gen 2(intel)', 2, '[{\"changed\": {\"fields\": [\"Start date\", \"End date\"]}}]', 36, 76),
(546, '2022-02-15 05:53:54.160307', '15', 'rental appliances ordered thinkbook 14 gen 2(intel)', 2, '[{\"changed\": {\"fields\": [\"Start date\", \"End date\"]}}]', 36, 76),
(547, '2022-02-15 05:54:37.431917', '11', 'rental appliances', 2, '[{\"changed\": {\"fields\": [\"Tot amount\"]}}]', 20, 76),
(548, '2022-02-15 05:55:33.256983', '12', 'aashraya', 1, '[{\"added\": {}}]', 20, 76),
(549, '2022-02-15 05:56:46.224477', '16', 'aashraya ordered thinkbook 14 gen 2(intel)', 1, '[{\"added\": {}}]', 36, 76),
(550, '2022-02-15 05:57:04.104240', '16', 'aashraya ordered thinkbook 14 gen 2(intel)', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Cancel date\"]}}]', 36, 76),
(551, '2022-02-15 05:58:14.057366', '17', 'aashraya ordered Crystal 4K UHD Smart TV', 1, '[{\"added\": {}}]', 36, 76),
(552, '2022-02-15 05:59:12.489731', '79', 'lavpatel', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 76),
(553, '2022-02-15 05:59:49.844082', '73', 'duty aisgn to johndue for aashraya ordered Crystal 4K UHD Smart TV', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(554, '2022-02-15 06:00:49.379934', '72', 'duty aisgn to johndue for aashraya ordered Crystal 4K UHD Smart TV', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(555, '2022-02-15 06:01:54.900066', '70', 'duty aisgn to johnnypaul for rental appliances ordered thinkbook 14 gen 2(intel)', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(556, '2022-02-15 06:02:04.120333', '69', 'duty aisgn to jamesdavies for rental appliances ordered Dell Precision T7810 Tower Workstation', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(557, '2022-02-15 06:02:10.972748', '69', 'duty aisgn to jamesdavies for rental appliances ordered Dell Precision T7810 Tower Workstation', 2, '[]', 30, 76),
(558, '2022-02-15 06:02:26.463318', '68', 'duty aisgn to jamesdavies for rental appliances ordered thinkbook 14 gen 2(intel)', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(559, '2022-02-15 06:03:08.516496', '67', 'duty aisgn to Lucastaylor for SwipeWire ordered Crystal 4K UHD Smart TV', 2, '[]', 30, 76),
(560, '2022-02-15 06:03:14.456739', '65', 'duty aisgn to Lucastaylor for SwipeWire ordered Crystal 4K UHD Smart TV', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(561, '2022-02-15 06:03:26.600416', '66', 'duty aisgn to Lucastaylor for SwipeWire ordered thinkbook 14 gen 2(intel)', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(562, '2022-02-15 06:03:35.721064', '64', 'duty aisgn to Lucastaylor for SwipeWire ordered thinkbook 14 gen 2(intel)', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(563, '2022-02-15 06:04:12.222936', '60', 'duty aisgn to AllenJones for cake4you ordered Dell Precision T7810 Tower Workstation', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(564, '2022-02-15 06:04:18.614733', '59', 'duty aisgn to AllenJones for cake4you ordered apple macbook', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(565, '2022-02-15 06:04:23.934518', '58', 'duty aisgn to AllenJones for cake4you ordered thinkbook 14 gen 2(intel)', 2, '[{\"changed\": {\"fields\": [\"Iscompleted\"]}}]', 30, 76),
(566, '2022-02-15 06:09:37.631353', '54', 'Composey', 2, '[{\"changed\": {\"fields\": [\"Contact\"]}}]', 13, 76),
(567, '2022-02-15 06:09:45.430649', '53', 'MetConnect', 2, '[{\"changed\": {\"fields\": [\"Contact\", \"Image\"]}}]', 13, 76),
(568, '2022-02-15 06:09:54.262731', '52', 'Cloudrevel', 2, '[{\"changed\": {\"fields\": [\"Contact\", \"Image\"]}}]', 13, 76),
(569, '2022-02-15 06:10:01.668896', '51', 'Formonix', 2, '[{\"changed\": {\"fields\": [\"Contact\", \"Image\"]}}]', 13, 76),
(570, '2022-02-15 06:10:09.040106', '50', 'SecureSmarter', 2, '[{\"changed\": {\"fields\": [\"Contact\", \"Image\"]}}]', 13, 76),
(571, '2022-02-15 06:10:19.759864', '49', 'SwipeWire', 2, '[{\"changed\": {\"fields\": [\"Contact\", \"Image\"]}}]', 13, 76),
(572, '2022-02-15 06:10:27.372490', '48', 'vandemataram', 2, '[{\"changed\": {\"fields\": [\"Contact\", \"Image\"]}}]', 13, 76),
(573, '2022-02-15 06:10:36.944123', '47', 'aashraya', 2, '[{\"changed\": {\"fields\": [\"Contact\"]}}]', 13, 76),
(574, '2022-02-15 06:10:44.224534', '47', 'aashraya', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 13, 76),
(575, '2022-02-15 06:10:52.671002', '46', 'cake4you', 2, '[{\"changed\": {\"fields\": [\"Contact\", \"Image\"]}}]', 13, 76),
(576, '2022-02-15 06:11:02.446460', '45', 'SantokDesign', 2, '[{\"changed\": {\"fields\": [\"Contact\", \"Image\"]}}]', 13, 76),
(577, '2022-02-15 06:11:08.849810', '39', 'rental appliances', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 13, 76),
(578, '2022-02-15 06:12:20.446739', '54', 'Composey', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 13, 76),
(579, '2022-02-15 06:13:26.803087', '13', 'johnnypaul', 2, '[{\"changed\": {\"fields\": [\"Contact\", \"Image\"]}}]', 14, 76),
(580, '2022-02-15 06:14:43.276550', '13', 'johnnypaul', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 14, 76),
(581, '2022-02-15 06:14:59.479318', '13', 'johnnypaul', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 14, 76),
(582, '2022-02-15 06:15:05.157770', '12', 'johndue', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 14, 76),
(583, '2022-02-15 06:15:12.154769', '9', 'Lucastaylor', 2, '[{\"changed\": {\"fields\": [\"Contact\", \"Image\"]}}]', 14, 76),
(584, '2022-02-15 06:15:21.329853', '8', 'jamesdavies', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 14, 76),
(585, '2022-02-15 06:15:29.265296', '7', 'BarkerHarris', 2, '[{\"changed\": {\"fields\": [\"Contact\", \"Image\"]}}]', 14, 76),
(586, '2022-02-15 06:15:35.904238', '7', 'BarkerHarris', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 14, 76),
(587, '2022-02-15 06:15:43.251382', '6', 'AllenJones', 2, '[{\"changed\": {\"fields\": [\"Contact\", \"Image\"]}}]', 14, 76),
(588, '2022-02-15 06:15:59.209184', '4', 'dhruvi', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 42, 76),
(589, '2022-02-15 06:16:06.819088', '3', 'viraj', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 42, 76),
(590, '2022-02-16 07:24:10.090702', '4', 'lavpatel has requested for Lenovo IdeaPad', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 31, 76),
(591, '2022-02-16 07:28:22.545256', '4', 'lavpatel has requested for Lenovo IdeaPad', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 31, 76),
(592, '2022-02-17 06:40:13.194735', '5', 'FeedbackRating object (5)', 1, '[{\"added\": {}}]', 28, 76),
(593, '2022-02-17 06:40:31.532417', '6', 'FeedbackRating object (6)', 1, '[{\"added\": {}}]', 28, 76),
(594, '2022-02-17 06:40:53.012005', '7', 'FeedbackRating object (7)', 1, '[{\"added\": {}}]', 28, 76),
(595, '2022-02-17 09:43:27.376996', '7', 'samsung', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 11, 76),
(596, '2022-02-17 09:43:39.080827', '6', 'lenovo', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 11, 76),
(597, '2022-02-17 09:43:47.246626', '4', 'apple', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 11, 76),
(598, '2022-02-17 09:43:55.509962', '1', 'dell', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 11, 76),
(599, '2022-02-18 17:20:41.694268', '8', 'FeedbackRating object (8)', 1, '[{\"added\": {}}]', 28, 76),
(600, '2022-02-18 18:49:08.290948', '4', 'lavpatel has requested for Lenovo IdeaPad', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 31, 76),
(601, '2022-02-19 05:36:04.753736', '3', 'ishwarmarvadi has requested for Lenovo Ideapad Gaming 3', 2, '[{\"changed\": {\"fields\": [\"Product name\"]}}]', 31, 76),
(602, '2022-02-19 07:59:43.832185', '0', 'Cart object (0)', 3, '', 40, 76),
(603, '2022-02-19 09:26:59.904660', '76', 'Cart object (76)', 3, '', 40, 76),
(604, '2022-02-19 14:31:57.406009', '4', 'Cart object (4)', 3, '', 40, 76),
(605, '2022-02-19 14:31:57.409861', '3', 'Cart object (3)', 3, '', 40, 76),
(606, '2022-02-19 14:31:57.412884', '2', 'Cart object (2)', 3, '', 40, 76),
(607, '2022-02-19 14:31:57.415892', '1', 'Cart object (1)', 3, '', 40, 76),
(608, '2022-02-20 06:09:41.582297', '55', 'apple macbook', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 22, 76),
(609, '2022-02-20 06:09:58.277029', '55', 'apple macbook', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 22, 76),
(610, '2022-02-20 06:40:19.909388', '56', 'Crystal 4K UHD Smart TV', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 22, 76),
(611, '2022-02-20 06:43:35.649967', '56', 'Crystal 4K UHD Smart TV', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 22, 76),
(612, '2022-02-20 09:40:41.568389', '56', 'Crystal 4K UHD Smart TV', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 22, 76),
(613, '2022-02-20 09:40:58.789283', '56', 'Crystal 4K UHD Smart TV', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 22, 76),
(614, '2022-02-20 13:03:59.506594', '13', 'aashraya', 3, '', 20, 76),
(615, '2022-02-20 13:08:31.193666', '15', 'aashraya', 3, '', 20, 76),
(616, '2022-02-20 13:08:31.196465', '14', 'aashraya', 3, '', 20, 76),
(617, '2022-02-20 13:08:59.952620', '17', 'aashraya', 3, '', 20, 76),
(618, '2022-02-20 13:08:59.955852', '16', 'aashraya', 3, '', 20, 76),
(619, '2022-02-20 13:10:10.183945', '19', 'aashraya', 3, '', 20, 76),
(620, '2022-02-20 13:10:10.185947', '18', 'aashraya', 3, '', 20, 76),
(621, '2022-02-20 13:10:26.995057', '20', 'aashraya', 3, '', 20, 76),
(622, '2022-02-20 13:20:00.926259', '28', 'aashraya', 3, '', 20, 76),
(623, '2022-02-20 13:20:00.930423', '27', 'aashraya', 3, '', 20, 76),
(624, '2022-02-20 13:20:00.932708', '26', 'aashraya', 3, '', 20, 76),
(625, '2022-02-20 13:20:00.934863', '25', 'aashraya', 3, '', 20, 76),
(626, '2022-02-20 13:20:00.936861', '24', 'aashraya', 3, '', 20, 76),
(627, '2022-02-20 13:20:00.938873', '23', 'aashraya', 3, '', 20, 76),
(628, '2022-02-20 13:20:00.941640', '22', 'aashraya', 3, '', 20, 76),
(629, '2022-02-20 13:20:00.946280', '21', 'aashraya', 3, '', 20, 76),
(630, '2022-02-20 13:20:00.948701', '12', 'aashraya', 3, '', 20, 76),
(631, '2022-02-20 13:20:21.763254', '29', 'aashraya', 3, '', 20, 76),
(632, '2022-02-20 13:25:16.361827', '34', 'aashraya', 3, '', 20, 76),
(633, '2022-02-20 13:25:16.364839', '33', 'aashraya', 3, '', 20, 76),
(634, '2022-02-20 13:25:16.367831', '32', 'aashraya', 3, '', 20, 76),
(635, '2022-02-20 13:25:16.370417', '31', 'aashraya', 3, '', 20, 76),
(636, '2022-02-20 13:25:16.372845', '30', 'aashraya', 3, '', 20, 76),
(637, '2022-02-20 13:26:11.385035', '35', 'aashraya', 3, '', 20, 76),
(638, '2022-02-20 13:27:32.300016', '36', 'aashraya', 3, '', 20, 76),
(639, '2022-02-20 13:35:03.381237', '37', 'aashraya', 3, '', 20, 76),
(640, '2022-02-20 13:40:34.902149', '56', 'Crystal 4K UHD Smart TV', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 22, 76),
(641, '2022-02-20 13:40:45.177684', '38', 'aashraya', 3, '', 20, 76),
(642, '2022-02-20 13:42:14.151971', '39', 'aashraya', 3, '', 20, 76),
(643, '2022-02-21 06:55:50.318585', '45', 'aashraya', 3, '', 20, 76),
(644, '2022-02-21 06:55:50.326584', '44', 'aashraya', 3, '', 20, 76),
(645, '2022-02-21 06:55:50.326584', '43', 'aashraya', 3, '', 20, 76),
(646, '2022-02-21 06:55:50.326584', '42', 'aashraya', 3, '', 20, 76),
(647, '2022-02-21 06:55:50.334581', '41', 'aashraya', 3, '', 20, 76),
(648, '2022-02-21 06:55:50.334581', '40', 'aashraya', 3, '', 20, 76),
(649, '2022-02-21 06:55:50.334581', '45', 'aashraya', 3, '', 20, 76),
(650, '2022-02-21 06:55:50.334581', '44', 'aashraya', 3, '', 20, 76),
(651, '2022-02-21 06:55:50.342578', '43', 'aashraya', 3, '', 20, 76),
(652, '2022-02-21 06:55:50.342578', '42', 'aashraya', 3, '', 20, 76),
(653, '2022-02-21 06:55:50.350579', '41', 'aashraya', 3, '', 20, 76),
(654, '2022-02-21 06:55:50.350579', '40', 'aashraya', 3, '', 20, 76),
(655, '2022-02-25 05:22:46.926966', '7', 'lavpatel has requested for product', 3, '', 31, 76),
(656, '2022-02-25 05:22:46.929964', '6', 'lavpatel has requested for product', 3, '', 31, 76),
(657, '2022-02-25 05:22:46.931963', '5', 'lavpatel has requested for product', 3, '', 31, 76),
(658, '2022-02-25 05:23:28.897732', '56', 'Crystal 4K UHD Smart TV', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 22, 76),
(659, '2022-02-26 05:45:56.850477', '49', 'SantokDesign', 3, '', 20, 76),
(660, '2022-02-26 05:45:56.854020', '48', 'SantokDesign', 3, '', 20, 76),
(661, '2022-02-26 12:27:28.171086', '64', 'Image object (64)', 3, '', 25, 76),
(662, '2022-02-26 12:27:39.771969', '62', 'Image object (62)', 3, '', 25, 76),
(663, '2022-02-26 13:21:17.791278', '55', 'SantokDesign', 3, '', 20, 76),
(664, '2022-02-26 13:21:17.793278', '54', 'SantokDesign', 3, '', 20, 76),
(665, '2022-02-26 13:21:17.795932', '53', 'SantokDesign', 3, '', 20, 76),
(666, '2022-02-26 13:21:17.798936', '52', 'SantokDesign', 3, '', 20, 76),
(667, '2022-02-26 13:21:17.801624', '51', 'SantokDesign', 3, '', 20, 76),
(668, '2022-02-26 13:21:17.803680', '50', 'SantokDesign', 3, '', 20, 76),
(669, '2022-02-26 13:21:17.805744', '47', 'SantokDesign', 3, '', 20, 76),
(670, '2022-02-26 13:32:32.912460', '46', 'aashraya', 3, '', 20, 76),
(671, '2022-02-26 13:41:16.393255', '57', 'SantokDesign', 3, '', 20, 76),
(672, '2022-02-26 13:41:16.396646', '56', 'SantokDesign', 3, '', 20, 76),
(673, '2022-02-26 13:41:16.398664', '11', 'rental appliances', 3, '', 20, 76),
(674, '2022-02-26 13:41:16.400776', '10', 'SwipeWire', 3, '', 20, 76),
(675, '2022-02-26 13:41:16.402779', '9', 'cake4you', 3, '', 20, 76),
(676, '2022-02-26 15:59:56.521003', '5', 'on the way', 3, '', 43, 76),
(677, '2022-02-26 16:53:27.317783', '58', 'SantokDesign', 3, '', 20, 76),
(678, '2022-02-27 04:32:42.928716', '9', 'FeedbackRating object (9)', 1, '[{\"added\": {}}]', 28, 76),
(679, '2022-02-27 04:32:59.712670', '10', 'FeedbackRating object (10)', 1, '[{\"added\": {}}]', 28, 76),
(680, '2022-02-27 04:33:18.734830', '11', 'FeedbackRating object (11)', 1, '[{\"added\": {}}]', 28, 76),
(681, '2022-02-27 04:33:38.153874', '12', 'FeedbackRating object (12)', 1, '[{\"added\": {}}]', 28, 76),
(682, '2022-02-27 04:33:54.807497', '13', 'FeedbackRating object (13)', 1, '[{\"added\": {}}]', 28, 76),
(683, '2022-02-27 04:34:15.065094', '14', 'FeedbackRating object (14)', 1, '[{\"added\": {}}]', 28, 76),
(684, '2022-02-27 04:34:45.752645', '15', 'FeedbackRating object (15)', 1, '[{\"added\": {}}]', 28, 76),
(685, '2022-02-27 04:35:04.437848', '16', 'FeedbackRating object (16)', 1, '[{\"added\": {}}]', 28, 76),
(686, '2022-02-27 04:35:21.301727', '17', 'FeedbackRating object (17)', 1, '[{\"added\": {}}]', 28, 76),
(687, '2022-02-27 04:35:37.881212', '18', 'FeedbackRating object (18)', 1, '[{\"added\": {}}]', 28, 76),
(688, '2022-02-27 04:35:57.438015', '19', 'FeedbackRating object (19)', 1, '[{\"added\": {}}]', 28, 76),
(689, '2022-02-27 05:43:59.583754', '60', 'ramuthecompany', 3, '', 20, 76),
(690, '2022-02-27 05:43:59.586904', '59', 'ramuthecompany', 3, '', 20, 76),
(691, '2022-02-27 09:19:05.313849', '76', 'viraj', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 76),
(692, '2022-02-27 09:21:32.271083', '95', 'ramupatel', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 4, 76),
(693, '2022-02-27 09:22:00.649619', '55', 'ramuthecompany', 2, '[{\"changed\": {\"fields\": [\"Contact\", \"Is pending\"]}}]', 13, 76),
(694, '2022-02-27 09:51:29.473271', '79', 'lavpatel', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 76);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(42, 'accounts', 'admin'),
(7, 'accounts', 'area'),
(41, 'accounts', 'areahasdeliveryboy'),
(8, 'accounts', 'authgroup'),
(35, 'accounts', 'authgrouppermissions'),
(9, 'accounts', 'authpermission'),
(10, 'accounts', 'authuser'),
(34, 'accounts', 'authusergroups'),
(33, 'accounts', 'authuseruserpermissions'),
(11, 'accounts', 'brand'),
(40, 'accounts', 'cart'),
(12, 'accounts', 'category'),
(32, 'accounts', 'city'),
(13, 'accounts', 'customer'),
(31, 'accounts', 'customize'),
(39, 'accounts', 'customizehashardwares'),
(14, 'accounts', 'deliveryboy'),
(30, 'accounts', 'deliverypickup'),
(29, 'accounts', 'djangoadminlog'),
(15, 'accounts', 'djangocontenttype'),
(16, 'accounts', 'djangomigrations'),
(17, 'accounts', 'djangosession'),
(28, 'accounts', 'feedbackrating'),
(27, 'accounts', 'hardwaredetails'),
(18, 'accounts', 'hardwares'),
(25, 'accounts', 'image'),
(19, 'accounts', 'offers'),
(20, 'accounts', 'order'),
(43, 'accounts', 'orderstatus'),
(45, 'accounts', 'otp'),
(44, 'accounts', 'payback'),
(26, 'accounts', 'payment'),
(21, 'accounts', 'paymentmethod'),
(22, 'accounts', 'product'),
(38, 'accounts', 'producthashardwares'),
(37, 'accounts', 'producthasoffers'),
(36, 'accounts', 'producthasorder'),
(23, 'accounts', 'returndeposit'),
(24, 'accounts', 'state'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'accounts', '0001_initial', '2022-01-06 12:42:36.136381'),
(2, 'contenttypes', '0001_initial', '2022-01-06 12:42:36.200052'),
(3, 'auth', '0001_initial', '2022-01-06 12:42:37.112858'),
(4, 'admin', '0001_initial', '2022-01-06 12:42:37.259208'),
(5, 'admin', '0002_logentry_remove_auto_add', '2022-01-06 12:42:37.279196'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2022-01-06 12:42:37.308255'),
(7, 'contenttypes', '0002_remove_content_type_name', '2022-01-06 12:42:37.443105'),
(8, 'auth', '0002_alter_permission_name_max_length', '2022-01-06 12:42:37.507343'),
(9, 'auth', '0003_alter_user_email_max_length', '2022-01-06 12:42:37.538323'),
(10, 'auth', '0004_alter_user_username_opts', '2022-01-06 12:42:37.558315'),
(11, 'auth', '0005_alter_user_last_login_null', '2022-01-06 12:42:37.617250'),
(12, 'auth', '0006_require_contenttypes_0002', '2022-01-06 12:42:37.627241'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2022-01-06 12:42:37.646229'),
(14, 'auth', '0008_alter_user_username_max_length', '2022-01-06 12:42:37.725390'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2022-01-06 12:42:37.754370'),
(16, 'auth', '0010_alter_group_name_max_length', '2022-01-06 12:42:37.798343'),
(17, 'auth', '0011_update_proxy_permissions', '2022-01-06 12:42:37.889290'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2022-01-06 12:42:37.937313'),
(19, 'sessions', '0001_initial', '2022-01-06 12:42:37.990279'),
(20, 'accounts', '0002_rename_user_iduser_customer_user', '2022-01-06 13:40:14.415632'),
(21, 'accounts', '0003_alter_customer_user', '2022-01-06 14:16:34.863374'),
(22, 'accounts', '0004_auto_20220106_1950', '2022-01-06 14:20:06.892191'),
(23, 'accounts', '0005_rename_user_customer_user_iduser', '2022-01-06 14:22:02.807516'),
(24, 'accounts', '0006_auto_20220106_2003', '2022-01-06 14:33:23.215169'),
(25, 'accounts', '0007_auto_20220107_2023', '2022-01-07 14:53:58.508585'),
(26, 'accounts', '0008_auto_20220107_2246', '2022-01-07 17:16:21.637874'),
(27, 'accounts', '0009_alter_customer_area', '2022-01-07 17:17:49.435498'),
(28, 'accounts', '0002_auto_20220108_1050', '2022-01-08 05:20:40.033157'),
(29, 'accounts', '0002_alter_customer_area', '2022-01-08 05:46:44.979563'),
(30, 'accounts', '0002_auto_20220108_1121', '2022-01-08 05:51:53.157441'),
(31, 'accounts', '0002_rename_state_idstate_customer_takliya', '2022-01-08 05:55:29.788584'),
(32, 'accounts', '0003_remove_customer_city_idcity', '2022-01-08 05:55:50.213188'),
(33, 'accounts', '0004_rename_takliya_customer_city_idcity', '2022-01-08 05:56:39.611336'),
(34, 'accounts', '0002_alter_customer_city_idcity', '2022-01-08 06:00:50.746205'),
(35, 'accounts', '0003_auto_20220108_1131', '2022-01-08 06:02:01.416441'),
(36, 'accounts', '0004_customer_company_addss', '2022-01-08 06:02:48.313109'),
(37, 'accounts', '0002_auto_20220108_1134', '2022-01-08 06:04:39.795828'),
(38, 'accounts', '0003_auto_20220108_1135', '2022-01-08 06:05:20.752750'),
(39, 'accounts', '0002_rename_state_idstate_customer_state', '2022-01-08 06:08:37.310676'),
(40, 'accounts', '0003_auto_20220108_1139', '2022-01-08 06:09:52.436233'),
(41, 'accounts', '0004_alter_customer_user', '2022-01-08 11:43:55.468652'),
(42, 'accounts', '0005_alter_customer_user', '2022-01-08 11:52:14.756034'),
(43, 'accounts', '0006_customer_image', '2022-01-09 12:07:56.510514'),
(44, 'accounts', '0007_auto_20220111_2102', '2022-01-11 15:32:46.736268'),
(45, 'accounts', '0008_auto_20220111_2109', '2022-01-11 15:39:28.474079'),
(46, 'accounts', '0009_alter_admin_image', '2022-01-12 16:42:47.634935'),
(47, 'accounts', '0010_customer_is_panding', '2022-01-18 04:08:40.419272'),
(48, 'accounts', '0011_auto_20220118_2254', '2022-01-18 17:24:41.626465'),
(49, 'accounts', '0012_auto_20220120_1102', '2022-01-20 05:32:26.400034'),
(50, 'accounts', '0013_rename_productimg_image', '2022-01-20 06:00:19.258897'),
(51, 'accounts', '0014_auto_20220120_1150', '2022-01-20 06:20:07.343618'),
(52, 'accounts', '0015_auto_20220122_1136', '2022-01-22 06:06:20.109790'),
(53, 'accounts', '0016_auto_20220122_1539', '2022-01-22 10:09:55.680108'),
(54, 'accounts', '0017_auto_20220122_1546', '2022-01-22 10:16:30.990576'),
(55, 'accounts', '0018_product_subcategory', '2022-01-22 10:49:08.879044'),
(56, 'accounts', '0019_auto_20220123_1726', '2022-01-23 11:56:40.052168'),
(57, 'accounts', '0020_auto_20220125_1049', '2022-01-25 05:19:52.881061'),
(58, 'accounts', '0021_auto_20220125_1053', '2022-01-25 05:23:37.341669'),
(59, 'accounts', '0022_auto_20220125_1053', '2022-01-25 05:23:37.789252'),
(60, 'accounts', '0023_auto_20220125_1057', '2022-01-25 05:27:17.801021'),
(61, 'accounts', '0024_feedbackrating_publish', '2022-01-25 06:00:28.571154'),
(62, 'accounts', '0025_alter_customer_is_pending', '2022-01-25 23:06:16.591191'),
(63, 'accounts', '0026_order_order_status', '2022-01-25 23:14:29.196678'),
(64, 'accounts', '0027_auto_20220126_0448', '2022-01-25 23:18:40.590421'),
(65, 'accounts', '0028_rename_order_date_order_date', '2022-01-25 23:27:37.236805'),
(66, 'accounts', '0029_auto_20220126_0522', '2022-01-25 23:52:52.916890'),
(67, 'accounts', '0030_auto_20220127_0601', '2022-01-27 00:31:33.123811'),
(68, 'accounts', '0002_deliveryboy_contac', '2022-01-27 08:14:08.131429'),
(69, 'accounts', '0002_remove_deliveryboy_contac', '2022-01-27 08:20:20.010991'),
(70, 'accounts', '0003_deliveryboy_area', '2022-01-27 08:20:50.286148'),
(71, 'accounts', '0004_auto_20220127_1351', '2022-01-27 08:21:50.055698'),
(72, 'accounts', '0002_alter_deliveryboy_user', '2022-01-27 08:39:25.277968'),
(73, 'accounts', '0003_rename_delivery_boy_iddelivery_boy_deliverypickup_delivery_boy', '2022-01-27 08:46:23.827702'),
(74, 'accounts', '0004_auto_20220127_1427', '2022-01-27 08:57:35.197645'),
(75, 'accounts', '0002_alter_order_deliveryboy', '2022-01-27 11:26:03.650816'),
(76, 'accounts', '0002_order_order_statu', '2022-01-27 11:39:37.611983'),
(77, 'accounts', '0003_auto_20220127_1708', '2022-01-27 11:39:37.728069'),
(78, 'accounts', '0002_order_deliveryboy', '2022-01-27 12:05:22.394691'),
(79, 'accounts', '0002_order_customer', '2022-01-27 12:22:26.666539'),
(80, 'accounts', '0003_auto_20220128_1056', '2022-01-28 05:27:02.289648'),
(81, 'accounts', '0002_remove_order_delivery_address', '2022-01-28 11:08:09.717383'),
(82, 'accounts', '0002_alter_areahasdeliveryboy_area', '2022-01-29 05:14:59.766653'),
(83, 'accounts', '0002_areahasdeliveryboy', '2022-01-29 05:17:37.210506'),
(84, 'accounts', '0003_alter_areahasdeliveryboy_area', '2022-01-29 05:19:02.019146'),
(85, 'accounts', '0002_delete_areahasdeliveryboy', '2022-01-29 05:24:28.837061'),
(86, 'accounts', '0003_areahasdeliveryboy', '2022-01-29 05:25:11.720553'),
(87, 'accounts', '0004_alter_areahasdeliveryboy_unique_together', '2022-01-29 05:35:13.322832'),
(88, 'accounts', '0005_alter_producthasorder_deliveryboy', '2022-01-29 06:27:23.448751'),
(89, 'accounts', '0006_area_pincode', '2022-01-29 10:42:37.165684'),
(90, 'accounts', '0002_auto_20220129_2217', '2022-01-29 16:47:13.731819'),
(91, 'accounts', '0002_delete_producthasorder', '2022-01-29 16:53:57.902213'),
(92, 'accounts', '0003_producthasorder', '2022-01-29 16:54:22.900309'),
(93, 'accounts', '0004_auto_20220130_1050', '2022-01-30 05:21:04.600438'),
(94, 'accounts', '0005_rename_order_status_orderstatus_status', '2022-01-30 05:26:47.842890'),
(95, 'accounts', '0006_auto_20220130_1116', '2022-01-30 05:46:40.934091'),
(96, 'accounts', '0007_auto_20220130_1122', '2022-01-30 05:52:46.304695'),
(97, 'accounts', '0008_auto_20220201_1158', '2022-02-01 06:28:58.525026'),
(98, 'accounts', '0009_auto_20220201_1650', '2022-02-01 11:20:45.188680'),
(99, 'accounts', '0010_auto_20220202_1016', '2022-02-02 04:46:55.530407'),
(100, 'accounts', '0011_alter_deliverypickup_pickup', '2022-02-02 04:47:48.454862'),
(101, 'accounts', '0012_alter_payback_date', '2022-02-02 10:56:43.108446'),
(102, 'accounts', '0013_alter_payback_order', '2022-02-02 11:36:07.308207'),
(103, 'accounts', '0014_auto_20220202_1742', '2022-02-02 12:12:38.351040'),
(104, 'accounts', '0015_alter_payback_cheque_num', '2022-02-02 12:15:35.506785'),
(105, 'accounts', '0016_payback_cancellation', '2022-02-03 10:36:07.562937'),
(106, 'accounts', '0017_alter_payback_cancellation', '2022-02-03 10:47:46.141990'),
(107, 'accounts', '0018_alter_payback_date', '2022-02-03 10:48:17.956256'),
(108, 'accounts', '0019_alter_payback_date', '2022-02-03 10:50:25.045598'),
(109, 'accounts', '0020_alter_payback_cancellation', '2022-02-03 10:56:48.966555'),
(110, 'accounts', '0021_alter_payback_cancellation', '2022-02-03 10:57:43.845207'),
(111, 'accounts', '0002_customize', '2022-02-05 06:59:38.689805'),
(112, 'accounts', '0003_alter_customize_product_name', '2022-02-05 07:12:49.321701'),
(113, 'accounts', '0004_alter_customize_user', '2022-02-05 07:14:14.819180'),
(114, 'accounts', '0005_alter_customize_user', '2022-02-05 07:14:14.903521'),
(115, 'accounts', '0006_rename_user_customize_customer', '2022-02-05 07:15:46.253992'),
(116, 'accounts', '0007_customize_pending', '2022-02-05 11:37:30.987647'),
(117, 'accounts', '0008_alter_customize_pending', '2022-02-06 04:38:07.157129'),
(118, 'accounts', '0009_alter_customize_pending', '2022-02-06 04:49:27.064809'),
(119, 'accounts', '0010_rename_pending_customize_status', '2022-02-06 04:50:20.930844'),
(120, 'accounts', '0011_otp', '2022-02-06 15:10:17.623283'),
(121, 'accounts', '0012_delete_otp', '2022-02-07 11:19:57.937860'),
(122, 'accounts', '0013_alter_deliverypickup_order', '2022-02-08 05:22:41.896247'),
(123, 'accounts', '0014_alter_producthasorder_order', '2022-02-08 11:24:20.197654'),
(124, 'accounts', '0015_alter_product_name', '2022-02-09 08:29:16.643215'),
(125, 'accounts', '0016_auto_20220209_2046', '2022-02-09 15:17:11.577166'),
(126, 'accounts', '0017_alter_customer_company_name', '2022-02-09 15:24:01.554262'),
(127, 'accounts', '0018_alter_category_name', '2022-02-09 15:33:20.117950'),
(128, 'accounts', '0019_alter_brand_name', '2022-02-10 04:19:44.874213'),
(129, 'accounts', '0020_auto_20220210_1030', '2022-02-10 05:01:37.405876'),
(130, 'accounts', '0021_auto_20220210_1430', '2022-02-10 09:01:28.879818'),
(131, 'accounts', '0022_auto_20220210_1431', '2022-02-10 09:01:29.061675'),
(132, 'accounts', '0023_alter_category_subcategory_idcategory', '2022-02-10 09:01:50.431790'),
(133, 'accounts', '0024_producthasorder_cancelpay', '2022-02-12 05:41:02.590564'),
(134, 'accounts', '0025_auto_20220212_1125', '2022-02-12 05:55:30.839811'),
(135, 'accounts', '0026_auto_20220212_1150', '2022-02-12 06:20:06.761207'),
(136, 'accounts', '0027_producthasorder_returndeposite', '2022-02-12 06:43:10.089391'),
(137, 'accounts', '0028_auto_20220212_1214', '2022-02-12 06:44:43.609203'),
(138, 'accounts', '0002_deliverypickup_dutydate', '2022-02-13 04:47:07.352418'),
(139, 'accounts', '0003_deliverypickup_iscompleted', '2022-02-13 05:46:22.315074'),
(140, 'accounts', '0004_alter_area_pincode', '2022-02-15 16:43:05.610375'),
(141, 'accounts', '0005_alter_area_pincode', '2022-02-16 05:05:27.850685'),
(142, 'accounts', '0006_alter_customize_status', '2022-02-16 07:28:40.446138'),
(143, 'accounts', '0007_remove_product_category', '2022-02-17 09:09:27.797555'),
(144, 'accounts', '0008_product_category', '2022-02-17 09:12:50.780058'),
(145, 'accounts', '0009_brand_image', '2022-02-17 09:40:59.157990'),
(146, 'accounts', '0010_auto_20220219_1328', '2022-02-19 07:58:51.137638'),
(147, 'accounts', '0011_alter_cart_unique_together', '2022-02-19 09:31:52.222629'),
(148, 'accounts', '0002_alter_cart_unique_together', '2022-02-19 09:33:52.080248'),
(149, 'accounts', '0002_cart', '2022-02-19 09:47:43.221541'),
(150, 'accounts', '0002_auto_20220226_1022', '2022-02-26 04:53:02.438794'),
(151, 'accounts', '0003_rename_user_cart_customer', '2022-02-26 04:56:19.865653'),
(152, 'accounts', '0004_rename_delivery_pickup_charges_cart_delivery_pickup_charge_and_more', '2024-04-01 18:11:17.936822'),
(153, 'accounts', '0005_rename_delivery_pickup_charges_product_delivery_pickup_charge', '2024-04-01 18:11:17.956809'),
(154, 'accounts', '0006_rename_delivery_pickup_charge_cart_delivery_pickup_charges_and_more', '2024-04-01 18:11:18.041757'),
(155, 'accounts', '0007_alter_producthasorder_unique_together', '2024-04-01 18:11:18.572773'),
(156, 'accounts', '0008_feedbackrating_orderproduct', '2024-04-01 18:11:18.677347');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0q52mrivy723ubnxnl797ko2dxsrd3wc', '.eJxVjDsOwjAUBO_iGlnxNzElfc5grZ8fOIBsKZ8KcXeIlALanZl9iYhtLXFbeI5TFmdhlDj9jgn04LqTfEe9NUmtrvOU5K7Igy5ybJmfl8P9OyhYyrfurfVaZ7BG58Cpy-ScN9SFAHZkDAjJWhqU8j0hDwEquKRgyV81Q7w_Eg44pw:1nA3Vi:GnHRjRqp2rlJBnlpsZWW6FIPuczxDIfZTGpFqjUdoFY', '2022-02-02 05:27:54.801058'),
('12u149cnm75crlxw6m8eswgwjl0bk94f', '.eJxVjMEOwiAQRP-FsyFbwQIevfcbyC67SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6Kter029JmJ5Sd8IPrPdJp6ku80h6V_RBmx4mltftcP8OCrayrTFzQC8kRnqP-QxBOAWbkutoyw6MQIdggSBbYBOMNQTGO3cJgGLV5ws7lDhg:1nLQv6:f8GNFXBdzSQC81LgWhL36_wsKb-SIiUSHpvBJqiOj7I', '2022-03-05 14:41:08.510542'),
('1k8i1t5infrolrcjdfe7wuu5u0rjnb9l', '.eJxVjMEOwiAQRP-FsyFbwQIevfcbyC67SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6Kter029JmJ5Sd8IPrPdJp6ku80h6V_RBmx4mltftcP8OCrayrTFzQC8kRnqP-QxBOAWbkutoyw6MQIdggSBbYBOMNQTGO3cJgGLV5ws7lDhg:1nLRmd:z2L9DWQSbxDfGxKgHEhS5oTgmWuZH_QXvujsWeIL-pE', '2022-03-05 15:36:27.086615'),
('1uor2dhktc2rt2ncmvz9pi6nvhjxreim', '.eJxVjDsOwjAUBO_iGlnxNzElfc5grZ8fOIBsKZ8KcXeIlALanZl9iYhtLXFbeI5TFmdhlDj9jgn04LqTfEe9NUmtrvOU5K7Igy5ybJmfl8P9OyhYyrfurfVaZ7BG58Cpy-ScN9SFAHZkDAjJWhqU8j0hDwEquKRgyV81Q7w_Eg44pw:1nA3cM:5X3Ju6QHfZnJLSmkSEBzHY_D5mOIZiaT3_s8ahe1Uyk', '2022-02-02 05:34:46.900927'),
('2bs70my75q4l1lf440bverb6u7ktml6z', '.eJxVjDkOwjAUBe_iGllOvIaSnjNYf7FxANlSnFSIu0OkFNC-mXkvEWFbS9x6WuLM4iz0IE6_IwI9Ut0J36HemqRW12VGuSvyoF1eG6fn5XD_Dgr08q2J9URgs_GEylsgMlZlCsY6x5688ciDRh1CYIfJgM8YdMpmGmHUSon3ByLCOGs:1n9KlM:iJrAc02_UEyXB-MxAvvmQbpjsqa-sm9iYxQse52wPWs', '2022-01-31 05:41:04.390939'),
('2ing6vqh09ieoultwt7qifzba5l0il9c', '.eJxVjDsOwjAQBe_iGlm7ieO1Kek5g7X-4QCypTipEHeHSCmgfTPzXsLxtha39bS4OYqzIC1Ov6Pn8Eh1J_HO9dZkaHVdZi93RR60y2uL6Xk53L-Dwr18a21Ho9PEISiM2RCw8hqJib2OlmxAiwYGggijT6BUAKaMOOBkE0AW7w__Mjdv:1nEUJu:Xzl1FV25AeChaQeR8eUrSzXIGt1_w0QpKv-ATXijKh0', '2022-02-14 10:54:02.810007'),
('37gp0kl5414n7djqwqw3m9lnv8dptn5n', '.eJxVjDsOwjAUBO_iGlnxNzElfc5grZ8fOIBsKZ8KcXeIlALanZl9iYhtLXFbeI5TFmdhlDj9jgn04LqTfEe9NUmtrvOU5K7Igy5ybJmfl8P9OyhYyrfurfVaZ7BG58Cpy-ScN9SFAHZkDAjJWhqU8j0hDwEquKRgyV81Q7w_Eg44pw:1nA5me:pQL94C2RRwxc9847NJSPEhsTZ1PrQNpUl6OBCaL5DaE', '2022-02-02 07:53:32.856261'),
('3s1m01mj4g44g5dyfh059g6geasht3d8', '.eJxVjDsOwjAUBO_iGlnxNzElfc5grZ8fOIBsKZ8KcXeIlALanZl9iYhtLXFbeI5TFmdhlDj9jgn04LqTfEe9NUmtrvOU5K7Igy5ybJmfl8P9OyhYyrfurfVaZ7BG58Cpy-ScN9SFAHZkDAjJWhqU8j0hDwEquKRgyV81Q7w_Eg44pw:1nA2of:ONERoLUPADEA0Lu_kkf35xd2ip2RHLrl3eyRBS_rU9U', '2022-02-02 04:43:25.181747'),
('40zpqmi73qkujggc0y5o36yjsg1tfgid', '.eJxVjMEOwiAQRP-FsyFbwQIevfcbyC67SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6Kter029JmJ5Sd8IPrPdJp6ku80h6V_RBmx4mltftcP8OCrayrTFzQC8kRnqP-QxBOAWbkutoyw6MQIdggSBbYBOMNQTGO3cJgGLV5ws7lDhg:1nJa8K:aopSV_GXLmcjKEYzvDosMPmBR0su2kxUf3s2tLq5E2c', '2022-02-28 12:07:08.656861'),
('4tay90nf35eeq1kijzuxdudfeavzza66', '.eJxVjDsOwjAUBO_iGlnxNzElfc5grZ8fOIBsKZ8KcXeIlALanZl9iYhtLXFbeI5TFmdhlDj9jgn04LqTfEe9NUmtrvOU5K7Igy5ybJmfl8P9OyhYyrfurfVaZ7BG58Cpy-ScN9SFAHZkDAjJWhqU8j0hDwEquKRgyV81Q7w_Eg44pw:1nA48T:oNq2ttSFwUdiS-nq0YG7tM9xjvgmCCrKdgm7vgxLesY', '2022-02-02 06:07:57.687525'),
('5g203916f0w0j181qo0kx4tv247l5hgx', '.eJxVjMEOwiAQRP-FsyFbwQIevfcbyC67SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6Kter029JmJ5Sd8IPrPdJp6ku80h6V_RBmx4mltftcP8OCrayrTFzQC8kRnqP-QxBOAWbkutoyw6MQIdggSBbYBOMNQTGO3cJgGLV5ws7lDhg:1nLQm5:azI_yVhfJOL_IhKG1Dg52HF4ysSSeqw8oFraWU_eKFw', '2022-03-05 14:31:49.475435'),
('5ltfkbxoc3j557m38q51rul87rvmun4x', '.eJxVjMsOwiAQRf-FtSHyBpfu-w1kBgapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKc2YU5xU6_I0J6UNtJvkO7dZ56W5cZ-a7wgw4-9UzP6-H-HVQY9VtrhygcWONDQiFVgSQoaSucRBIGQyYKWQIYL2xJUoEy3uPZE5JVRbP3BxpxOJc:1nH2DX:gm8jhqaNhhQdQBkSY-qAkzWUsfNjg_euUv1EFIdbyxE', '2022-02-21 11:29:59.934687'),
('5on649tfxa98slgh9ikfdh0s89f7t3y1', '.eJxVjMEOwiAQRP-FsyFbwQIevfcbyC67SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6Kter029JmJ5Sd8IPrPdJp6ku80h6V_RBmx4mltftcP8OCrayrTFzQC8kRnqP-QxBOAWbkutoyw6MQIdggSBbYBOMNQTGO3cJgGLV5ws7lDhg:1nL0Jy:xztAsnFNLU4Ba3PlU7FRpEnQn476zljDB59ODlFYzrA', '2022-03-04 10:17:02.710322'),
('772fzlefwssmccvixgec1ru130o0yyn7', '.eJxVjMEOwiAQRP-FsyFbwQIevfcbyC67SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6Kter029JmJ5Sd8IPrPdJp6ku80h6V_RBmx4mltftcP8OCrayrTFzQC8kRnqP-QxBOAWbkutoyw6MQIdggSBbYBOMNQTGO3cJgGLV5ws7lDhg:1nLKXH:_xdAOKVn00yKI4Ya0If0SicPTf6wa-W6tzTM-0GuCK4', '2022-03-05 07:52:07.967439'),
('7bj16sqn4pgs6mfvwg1c37ohuzflt3e6', '.eJxVjDsOwjAQBe_iGln-O0tJzxmsXe-GBJAj5VMh7g6RUkD7Zua9VMFtHcq2yFxGVmflrTr9joT1IW0nfMd2m3Sd2jqPpHdFH3TR14nleTncv4MBl-FbiyWfHXmXLEjOIaQOmSBL7VEQcow-dGAMMUCoKYJJVDlyR9I7YVHvDwDEOII:1n6PYC:o1n8wgw6o72UIbva3_wVEwQI294M4kC_oJZk3po9sHY', '2022-01-23 04:11:24.665154'),
('8001bjfulvefrryewu4ghcs544nynb93', '.eJxVjMEOwiAQRP-FsyFbwQIevfcbyC67SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6Kter029JmJ5Sd8IPrPdJp6ku80h6V_RBmx4mltftcP8OCrayrTFzQC8kRnqP-QxBOAWbkutoyw6MQIdggSBbYBOMNQTGO3cJgGLV5ws7lDhg:1nJb9A:b1NJP46-CgGDGMkvvxu5D17XJTaQgJBYVTNXhl8WSEo', '2022-02-28 13:12:04.322562'),
('8lcz6wfzjt3vjcwug50qsowvzk3ab6oq', '.eJxVjEEOwiAQRe_C2hAGywAu3XsGAsMgVUOT0q6Md7dNutDtf-_9twhxXWpYO89hzOIiziBOv2OK9OS2k_yI7T5Jmtoyj0nuijxol7cp8-t6uH8HNfa61R6IbClIxoN2SEqTcqAsG9KFEHzMjMQEuGHKQ3LWOE5ZuYiDQic-XwrXOA0:1nDQVQ:bTCvF8zbW0S378gdoJtfe874v7rrU08ipVsuMUAlR00', '2022-02-11 12:37:32.416975'),
('8pyzjegaa1ufgs9fl9bowpkxtqy4tqzy', 'e30:1nNzI9:Ny8GBYef-83EJ48ibE7Ellziop9839pySMMXyAwu5gg', '2022-03-12 15:47:29.486375'),
('a3aj2rr0s7joylle53l718ihgnj1m34h', '.eJxVjMEOwiAQRP-FsyG7FQJ49O43ELq7SNVAUtqT8d9tkx40mdO8N_NWMa1LiWuXOU6sLsoFdfotx0RPqTvhR6r3pqnVZZ5GvSv6oF3fGsvrerh_ByX1sq1JYEvGYCB74zMZAI-UmAJYJ3ZAy2djha1FMA6RBxHJWTJy8InU5wsU4DiZ:1nOFtF:Dvvni5SWOXeIyi8_MFRMfPYeVvl8UEes6ZK3XCAlxuw', '2022-03-13 09:30:53.067611'),
('ams3q9x158tvl276fx7upzbpxihb3wg9', '.eJxVjDsOwjAQBe_iGln-O0tJzxmsXe-GBJAj5VMh7g6RUkD7Zua9VMFtHcq2yFxGVmflrTr9joT1IW0nfMd2m3Sd2jqPpHdFH3TR14nleTncv4MBl-FbiyWfHXmXLEjOIaQOmSBL7VEQcow-dGAMMUCoKYJJVDlyR9I7YVHvDwDEOII:1n797C:Az-FDNpdx0_DlIRldQSakS5HdzKmv5N8tSFm4zJ_jho', '2022-01-25 04:50:34.531967'),
('bhxkyhn77asro0c3hp0tu5oujwh5gzd2', '.eJxVjMEOwiAQRP-FsyFbwQIevfcbyC67SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6Kter029JmJ5Sd8IPrPdJp6ku80h6V_RBmx4mltftcP8OCrayrTFzQC8kRnqP-QxBOAWbkutoyw6MQIdggSBbYBOMNQTGO3cJgGLV5ws7lDhg:1nLLDL:UzN2p_tqr88PNYbhYDKeBKHhfzdMKnbAetQhPH7a2Is', '2022-03-05 08:35:35.363764'),
('bt690p7u7w2g0vnrlgw5v92k0xjo136i', '.eJxVjEEOwiAQRe_C2hAGywAu3XsGAsMgVUOT0q6Md7dNutDtf-_9twhxXWpYO89hzOIiziBOv2OK9OS2k_yI7T5Jmtoyj0nuijxol7cp8-t6uH8HNfa61R6IbClIxoN2SEqTcqAsG9KFEHzMjMQEuGHKQ3LWOE5ZuYiDQic-XwrXOA0:1nBuKE:EmDlSfQG5RKPhvhiPJ9ff-aZxnb2wfpLsT0xYoa9L1k', '2022-02-07 08:03:42.047471'),
('bujjf60i6vns4twhy00n1xr7ze7efdw5', '.eJxVjL0OwjAQg98lM4p6bX4ubLAzMlfX3JUCVSM1rRgQ704qdYDFkv3ZfquW1mVo1yxze2d1VMGrw2_YUXzKtBF-0HRLOqZpme-d3ip6p1mfxjG9ilzLJl8Sy3jeh39vA-WhXDmOBjj2aHrjhAkc9hjAgg22bkjAVWgCe8SmOBaqESRII9a7CqxXny-EFTzI:1rrM9o:MMv661CmZ4Lf-83Ub0jV8g0NEffha7fNx_FvkgA7fgk', '2024-04-15 18:13:20.243699'),
('cc35v30lz8uj6wk6uhkcv7tiegophhll', '.eJxVjEEOwiAQRe_C2hAGywAu3XsGAsMgVUOT0q6Md7dNutDtf-_9twhxXWpYO89hzOIiziBOv2OK9OS2k_yI7T5Jmtoyj0nuijxol7cp8-t6uH8HNfa61R6IbClIxoN2SEqTcqAsG9KFEHzMjMQEuGHKQ3LWOE5ZuYiDQic-XwrXOA0:1nAxDo:U76KVH4qeHMbn2fy9qB4aFR-T2vDsnzdEEpy8X726U8', '2022-02-04 16:57:08.717700'),
('d6aasau47iwxbog21vlp8abp2k2rdysb', '.eJxVjDsOwjAUBO_iGlnxNzElfc5grZ8fOIBsKZ8KcXeIlALanZl9iYhtLXFbeI5TFmdhlDj9jgn04LqTfEe9NUmtrvOU5K7Igy5ybJmfl8P9OyhYyrfurfVaZ7BG58Cpy-ScN9SFAHZkDAjJWhqU8j0hDwEquKRgyV81Q7w_Eg44pw:1n9QvE:5cBu37QEVetAD0-JogMaPEB3viCUHN1Jag3FXy4Oqh4', '2022-01-31 12:15:40.619849'),
('dqpzoflbbpxuxcb8x5x30r1huemutf40', '.eJxVjEEOwiAQRe_C2hAGywAu3XsGAsMgVUOT0q6Md7dNutDtf-_9twhxXWpYO89hzOIiziBOv2OK9OS2k_yI7T5Jmtoyj0nuijxol7cp8-t6uH8HNfa61R6IbClIxoN2SEqTcqAsG9KFEHzMjMQEuGHKQ3LWOE5ZuYiDQic-XwrXOA0:1nAacN:7rWQtJ16A_6u2VByq1RCTIRatn3Bqp1bgIOlUyjAoRk', '2022-02-03 16:48:59.985657'),
('e2f0b2apyik9erxukhp5sdasn457vx82', '.eJxVjDsOwjAQBe_iGlkkXn9CSc8ZrPXuGgeQI8VJhbg7iZQC2jcz760irkuJa5M5jqwuyjt1-h0T0lPqTviB9T5pmuoyj0nvij5o07eJ5XU93L-Dgq1sdXKMvh_IB2MgMDJL15NLnEIGZ4EGEm9TJ8aQBydgAsimuDNYzD6rzxckNTh9:1nNS2x:N_STEHG5Cn8hc-tAx5NZvAw_slqe_4WUcsDTAJNqh0A', '2022-03-11 04:17:35.681025'),
('ekenan43be91him75ld5phq73ulfdjp9', '.eJxVjDsOwjAQBe_iGln-O0tJzxmsXe-GBJAj5VMh7g6RUkD7Zua9VMFtHcq2yFxGVmflrTr9joT1IW0nfMd2m3Sd2jqPpHdFH3TR14nleTncv4MBl-FbiyWfHXmXLEjOIaQOmSBL7VEQcow-dGAMMUCoKYJJVDlyR9I7YVHvDwDEOII:1n7BjU:DG70-iv_rakFGM4PGqdm-SWES8stmNMSa-VCL21qX34', '2022-01-25 07:38:16.393943'),
('fb9zsv16lxk5ydqvbbt8qpuehjfiu66s', '.eJxVjEEOwiAQRe_C2hAGywAu3XsGAsMgVUOT0q6Md7dNutDtf-_9twhxXWpYO89hzOIiziBOv2OK9OS2k_yI7T5Jmtoyj0nuijxol7cp8-t6uH8HNfa61R6IbClIxoN2SEqTcqAsG9KFEHzMjMQEuGHKQ3LWOE5ZuYiDQic-XwrXOA0:1nDPuq:DQdKN5V01h3bHbUePgTBQDh0ZnbhQU7lvN2o7sPeqrc', '2022-02-11 11:59:44.075639'),
('gr9b41uryx294bq5h3k4jyd4mha594sn', '.eJxVjDsOwjAQBe_iGln-xB9R0nMGa9fexQFkS3FSIe4OkVJA-2bmvUSCba1pG7SkuYizsFqcfkeE_KC2k3KHdusy97YuM8pdkQcd8toLPS-H-3dQYdRvrdh5sgGMUTpG1NEUp6yZlAJHlskFNmh8zhaBg5_Qk2ZiYItIXnvx_gDw7zhO:1n7h3A:AT2dMF8kjWbLmv08Q1FS7R1zvDt4YgAROmGHUXXCPLU', '2022-01-26 17:04:40.338942'),
('i93ul46xzhvexxebjkfbqg3rjsuf54a8', '.eJxVjMsOwiAQRf-FtSHyBpfu-w1kBgapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKc2YU5xU6_I0J6UNtJvkO7dZ56W5cZ-a7wgw4-9UzP6-H-HVQY9VtrhygcWONDQiFVgSQoaSucRBIGQyYKWQIYL2xJUoEy3uPZE5JVRbP3BxpxOJc:1nHOCV:N_fvYrsPt52qhNbhVwvni9jZXJMoGr-5Ye6bErh2am0', '2022-02-22 10:58:23.006477'),
('ioqr4ircvwxtqcq970fkcl4501p3f5rn', '.eJxVjDsOwjAQBe_iGlnxH1PS5wzWrneNA8iR4qRC3B0ipYD2zcx7iQTbWtPWeUkTiYsIXpx-R4T84LYTukO7zTLPbV0mlLsiD9rlOBM_r4f7d1Ch129tvHKxDJajpRwoE0NhrZ1Fi8F7zRGDooG9Uooxg8HsvIGizBlMIS3eHx6NOL8:1nOFjP:c5UHUyPMkwc_scxP9l6o1FFNh39_rkFC6Qr1CIc7eCs', '2022-03-13 09:20:43.348670'),
('iq4u91liak19oldwzkpl8iydkdwgmgl5', '.eJxVjDsOwjAQBe_iGlm7ieO1Kek5g7X-4QCypTipEHeHSCmgfTPzXsLxtha39bS4OYqzIC1Ov6Pn8Eh1J_HO9dZkaHVdZi93RR60y2uL6Xk53L-Dwr18a21Ho9PEISiM2RCw8hqJib2OlmxAiwYGggijT6BUAKaMOOBkE0AW7w__Mjdv:1nE3TT:mdIG6fY3U80xtl8t3So17Wj6OtLSRkyWrGvPmBanMjU', '2022-02-13 06:14:07.442349'),
('jeedklrhg38io72pt8l2gznxr3hjwyw1', '.eJxVjMsOwiAURP-FtSFggHJduvcbyH2AVA1NSrsy_rtt0oUuZ86ZeauE61LT2vOcRlEXFQd1-i0J-ZnbTuSB7T5pntoyj6R3RR-069sk-XU93L-Dir1uaxbHFmMpwcg5uOgNFLTFZGIiHjyE4MQUA-iAYYsCXgpbjg4jBVSfLyvjOOE:1nNzQs:T4u7DZEdKXoDX5JKh-pkvxiQ2tLj_KOCtu2uo5NZ_n8', '2022-03-12 15:56:30.757058'),
('jlc85rrjkzr8caqqz97tky2ll3jwoo1c', '.eJxVjMEOwiAQRP-FsyFbwQIevfcbyC67SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6Kter029JmJ5Sd8IPrPdJp6ku80h6V_RBmx4mltftcP8OCrayrTFzQC8kRnqP-QxBOAWbkutoyw6MQIdggSBbYBOMNQTGO3cJgGLV5ws7lDhg:1nLeSC:e5yTA30iayOqLgNv2ihiscr7LDCEzhj6RG3y9f4zJxU', '2022-03-06 05:08:12.430456'),
('jsrnjdbf2882sl1zzzsqzaydgphmx244', '.eJxVjDsOwjAQBe_iGlkkXn9CSc8ZrPXuGgeQI8VJhbg7iZQC2jcz760irkuJa5M5jqwuyjt1-h0T0lPqTviB9T5pmuoyj0nvij5o07eJ5XU93L-Dgq1sdXKMvh_IB2MgMDJL15NLnEIGZ4EGEm9TJ8aQBydgAsimuDNYzD6rzxckNTh9:1nNSA6:BP2j1GfofXirleiCUvS32rzllNYXgZaT3_OGQ2swu1Q', '2022-03-11 04:24:58.065950'),
('m3ukhhaiiyxwkvy6if6aedse9msfamiq', '.eJxVjDsOwjAUBO_iGlnxNzElfc5grZ8fOIBsKZ8KcXeIlALanZl9iYhtLXFbeI5TFmdhlDj9jgn04LqTfEe9NUmtrvOU5K7Igy5ybJmfl8P9OyhYyrfurfVaZ7BG58Cpy-ScN9SFAHZkDAjJWhqU8j0hDwEquKRgyV81Q7w_Eg44pw:1nAF0D:9MftmxlWEOx-YlMdRL6d0VodPR6LgJ7daLzJr07pW1Q', '2022-02-02 17:44:09.130055'),
('mojyfr6l4f1fv4hn0adb9aahvq8qkbxo', '.eJxVjMEOwiAQRP-FsyFbwQIevfcbyC67SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6Kter029JmJ5Sd8IPrPdJp6ku80h6V_RBmx4mltftcP8OCrayrTFzQC8kRnqP-QxBOAWbkutoyw6MQIdggSBbYBOMNQTGO3cJgGLV5ws7lDhg:1nJzQe:gEVG_AkYjC1uYkc-enKyOkHgTardV2c-e8o9niNIAyY', '2022-03-01 15:07:44.380875'),
('ncbanl2rd5kdpv8sais3htsqd47d6ut2', '.eJxVjDsOwjAQBe_iGln-YceU9DmDtevd4ACypTipEHeHSCmgfTPzXiLBtpa0dV7STOIirBan3xEhP7juhO5Qb03mVtdlRrkr8qBdjo34eT3cv4MCvXxrxXFCYwZCowJlbSIgRaLATN4aC0NW4DSZcwxRQ4gBkZgdepyydyTeHya_OSU:1n7gyk:7m7lhFJz-0TEqATAUfRkFYn__5QDfykym6B4WqlYJhs', '2022-01-26 17:00:06.711734'),
('nk14x6qpjjf1g11mcdf7nrsedq4atbcl', '.eJxVjMEOwiAQRP-FsyFbwQIevfcbyC67SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6Kter029JmJ5Sd8IPrPdJp6ku80h6V_RBmx4mltftcP8OCrayrTFzQC8kRnqP-QxBOAWbkutoyw6MQIdggSBbYBOMNQTGO3cJgGLV5ws7lDhg:1nJCtv:R_6MNoiNE-33IOOI6o57a1PxhGZdNZHDcbt8XRQ8Fa0', '2022-02-27 11:18:43.715722'),
('pst9qgckzeq25sbysvxvpt2gf471chlm', '.eJxVjMsOwiAQRf-FtSHyBpfu-w1kBgapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKc2YU5xU6_I0J6UNtJvkO7dZ56W5cZ-a7wgw4-9UzP6-H-HVQY9VtrhygcWONDQiFVgSQoaSucRBIGQyYKWQIYL2xJUoEy3uPZE5JVRbP3BxpxOJc:1nH2SS:peO7tDiJN3Pq3jPvm_Bd25fHP2LNKQA_tqj5bIVYUbA', '2022-02-21 11:45:24.549361'),
('qmz2i8vcsdgbt4iipt1h3gx68s3wlc18', '.eJxVjEEOwiAQRe_C2hAGywAu3XsGAsMgVUOT0q6Md7dNutDtf-_9twhxXWpYO89hzOIiziBOv2OK9OS2k_yI7T5Jmtoyj0nuijxol7cp8-t6uH8HNfa61R6IbClIxoN2SEqTcqAsG9KFEHzMjMQEuGHKQ3LWOE5ZuYiDQic-XwrXOA0:1nBJ5W:bIVWptSbZAvAYGyS_HMJz5Wmo_ACxaDVrxyeZMEMMZc', '2022-02-05 16:18:02.361747'),
('rqlpt4jnptpg14wp8r8ujeio40dctvmp', '.eJxVjMsOwiAURP-FtSFggHJduvcbyH2AVA1NSrsy_rtt0oUuZ86ZeauE61LT2vOcRlEXFQd1-i0J-ZnbTuSB7T5pntoyj6R3RR-069sk-XU93L-Dir1uaxbHFmMpwcg5uOgNFLTFZGIiHjyE4MQUA-iAYYsCXgpbjg4jBVSfLyvjOOE:1nOGB2:otKgkrvC_ci8AgM0Sr0iXF2RhhVCWRHL2fzKXE20seg', '2022-03-13 09:49:16.449430'),
('rzemobpjhwk0z7q6h77o0s9t6ktibxyq', '.eJxVjMEOwiAQRP-FsyFbwQIevfcbyC67SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6Kter029JmJ5Sd8IPrPdJp6ku80h6V_RBmx4mltftcP8OCrayrTFzQC8kRnqP-QxBOAWbkutoyw6MQIdggSBbYBOMNQTGO3cJgGLV5ws7lDhg:1nLeDt:D1mkdteatiTlRjsFdWBIgGiYE8W1xybqggMexUBmil8', '2022-03-06 04:53:25.245271'),
('slcpumzngszlm59kaumhefo9n8h4jwgi', '.eJxVjEEOwiAQRe_C2hAQCqNL956hmRkGqRpISrsy3l2bdKHb_977LzXiupRx7TKPU1JnFYM6_I6E_JC6kXTHemuaW13mifSm6J12fW1Jnpfd_Tso2Mu3BhI0loOnzBQiuCGL-IweHAwpAANbJoc5OoOZT8aJjUYAghxt9l69PzEnOKY:1nGckU:F6mrlEVelo96xK-Viz2L6LwzwykKu1NOefOKhpEe-8s', '2022-02-20 08:18:18.782552'),
('smukcomib70nt5ewwm888vp1i37mg9o7', '.eJxVjDsOwjAQBe_iGlm7ieO1Kek5g7X-4QCypTipEHeHSCmgfTPzXsLxtha39bS4OYqzIC1Ov6Pn8Eh1J_HO9dZkaHVdZi93RR60y2uL6Xk53L-Dwr18a21Ho9PEISiM2RCw8hqJib2OlmxAiwYGggijT6BUAKaMOOBkE0AW7w__Mjdv:1nFvZi:njh-hOqCSGe_EPyc6Ncky69EYOh7wmo4pE-FI29ojJM', '2022-02-18 10:12:18.503296'),
('twzxn7a0d1am1nu5gy713aliljs9y3aa', '.eJxVjMEOwiAQRP-FsyEIsiwevfcbyC5QqRpISnsy_rtt0oMe5jLvzbxFoHUpYe15DlMSV4FWnH5LpvjMdSfpQfXeZGx1mSeWuyIP2uXQUn7dDvfvoFAv2xqUBs2gMYIC9pjZjVsUxhwvhtFbz-5snLcOR2BF4KxG4x0hKVJJfL7zxDdo:1nIt3m:Nt246hq-zQnRR4sgA8B5lAyIPx4tVTFODIqJpZaKoRY', '2022-02-26 14:07:34.985598'),
('u8eaq2ss2lh8y9dcf6toe0dv1j9ieznv', '.eJxVjMEOwiAQRP-FsyFbwQIevfcbyC67SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6Kter029JmJ5Sd8IPrPdJp6ku80h6V_RBmx4mltftcP8OCrayrTFzQC8kRnqP-QxBOAWbkutoyw6MQIdggSBbYBOMNQTGO3cJgGLV5ws7lDhg:1nJb9A:b1NJP46-CgGDGMkvvxu5D17XJTaQgJBYVTNXhl8WSEo', '2022-02-28 13:12:04.211744'),
('uuil5ras8pch5a5iwqxs93yv8tbdq2vu', '.eJxVjDsOwjAUBO_iGlnxNzElfc5grZ8fOIBsKZ8KcXeIlALanZl9iYhtLXFbeI5TFmdhlDj9jgn04LqTfEe9NUmtrvOU5K7Igy5ybJmfl8P9OyhYyrfurfVaZ7BG58Cpy-ScN9SFAHZkDAjJWhqU8j0hDwEquKRgyV81Q7w_Eg44pw:1nAEnh:c-5dfznAF1FzqXNlUU_ZBgdT1BFqBzQ28_LCQnTLcoA', '2022-02-02 17:31:13.507168'),
('vrc4ndc3zfh8wvzka1p4v2ugqmgynzvl', '.eJxVjMEOwiAQRP-FsyFbwQIevfcbyC67SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6Kter029JmJ5Sd8IPrPdJp6ku80h6V_RBmx4mltftcP8OCrayrTFzQC8kRnqP-QxBOAWbkutoyw6MQIdggSBbYBOMNQTGO3cJgGLV5ws7lDhg:1nL83G:FPwnpiwZJMfjTTMY62u_-6ndF-OkpthG9LyrgpyYxGU', '2022-03-04 18:32:18.797363'),
('wh2xgvxal1ddba74w2bsym15a6ae4rh9', '.eJxVjMEOwiAQRP-FsyFbwQIevfcbyC67SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6Kter029JmJ5Sd8IPrPdJp6ku80h6V_RBmx4mltftcP8OCrayrTFzQC8kRnqP-QxBOAWbkutoyw6MQIdggSBbYBOMNQTGO3cJgGLV5ws7lDhg:1nKd9x:c0JZQd-c1ic-WjEzGT0W8kULdBatgwLiuTaYyLGyjtc', '2022-03-03 09:33:09.765085'),
('wn3ea81o3fy5yeirc357gpvwxgyg4fxk', '.eJxVjMEOwiAQRP-FsyFbwQIevfcbyC67SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6Kter029JmJ5Sd8IPrPdJp6ku80h6V_RBmx4mltftcP8OCrayrTFzQC8kRnqP-QxBOAWbkutoyw6MQIdggSBbYBOMNQTGO3cJgGLV5ws7lDhg:1nJZEo:znddrhl1Nx0gHNbQTWvXrPXNKwToCcEPNRvOwnxLcks', '2022-02-28 11:09:46.868993'),
('wu2im0tui98zt73fhtyawre8rb5tx8em', '.eJxVjMEOwiAQRP-FsyFbwQIevfcbyC67SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6Kter029JmJ5Sd8IPrPdJp6ku80h6V_RBmx4mltftcP8OCrayrTFzQC8kRnqP-QxBOAWbkutoyw6MQIdggSBbYBOMNQTGO3cJgGLV5ws7lDhg:1nLeVI:01lza3lMmKsxVt4fpQP1H2ptnk3Ri0aqssTe9xbRNx0', '2022-03-06 05:11:24.725775'),
('xj6wn24l22bern4vb4r8e6pcvreqj2ep', '.eJxVjDsOwjAUBO_iGlnxNzElfc5grZ8fOIBsKZ8KcXeIlALanZl9iYhtLXFbeI5TFmdhlDj9jgn04LqTfEe9NUmtrvOU5K7Igy5ybJmfl8P9OyhYyrfurfVaZ7BG58Cpy-ScN9SFAHZkDAjJWhqU8j0hDwEquKRgyV81Q7w_Eg44pw:1nA3RH:mvr_XMrSspdwTJ1wQziSFUaoYaGoY1jYDP29CuOPnwQ', '2022-02-02 05:23:19.348952'),
('xouc7s6v6ybp1jfl3xy0jak8gg8kyhf8', '.eJxVjDsOwjAQBe_iGlm7ieO1Kek5g7X-4QCypTipEHeHSCmgfTPzXsLxtha39bS4OYqzIC1Ov6Pn8Eh1J_HO9dZkaHVdZi93RR60y2uL6Xk53L-Dwr18a21Ho9PEISiM2RCw8hqJib2OlmxAiwYGggijT6BUAKaMOOBkE0AW7w__Mjdv:1nGIct:x73M3P-8rfrUNYQPF63mC6_s_vJh5jvT3SlCbk3uCt0', '2022-02-19 10:49:07.111374'),
('yw277d2wninalhwe3kmzwa3up8exhb2x', '.eJxVjMEOwiAQRP-FsyFbwQIevfcbyC67SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6Kter029JmJ5Sd8IPrPdJp6ku80h6V_RBmx4mltftcP8OCrayrTFzQC8kRnqP-QxBOAWbkutoyw6MQIdggSBbYBOMNQTGO3cJgGLV5ws7lDhg:1nKaAx:pcYiYQcz2HG3KLKGf5ckWn3PD0PrEkr5RXyfJd0Id0s', '2022-03-03 06:21:59.345989'),
('yw483fcpkrw5f3i4x7v2zbw7l1i986lr', '.eJxVjMsOwiAQRf-FtSEFGWBcuvcbyPCSqoGktCvjv0uTLnR7zrn3zRxta3FbT4ubI7swg-z0Cz2FZ6q7iQ-q98ZDq-sye74n_LCd31pMr-vR_h0U6mWsNWgjIgohrSYFgCSzMhBRKoGWbDBqYJRBDIGgM_kABMZPMscpn9nnC9neN1w:1nNTif:Gxxhy-Ba0K7M9gg0Ky4Qv9w792UZfKtJ2-YKGSoGOMs', '2022-03-11 06:04:45.591795');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_admin`
--
ALTER TABLE `accounts_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `accounts_admin_area_id_8aac8e1c_fk_accounts_area_id` (`area_id`),
  ADD KEY `accounts_admin_city_id_cbb8e8d7_fk_accounts_city_id` (`city_id`),
  ADD KEY `accounts_admin_state_id_75ff6b70_fk_accounts_state_id` (`state_id`);

--
-- Indexes for table `accounts_area`
--
ALTER TABLE `accounts_area`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_area_area_name_52951f37_uniq` (`area_name`),
  ADD KEY `accounts_area_city_idcity_ac71fcbe_fk_accounts_city_id` (`city_idcity`);

--
-- Indexes for table `accounts_areahasdeliveryboy`
--
ALTER TABLE `accounts_areahasdeliveryboy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_areahasdeliveryboy_deliveryboy_id_area_id_66d0009c_uniq` (`deliveryboy_id`,`area_id`),
  ADD KEY `accounts_areahasdeliveryboy_area_id_ae118ba6_fk_accounts_area_id` (`area_id`);

--
-- Indexes for table `accounts_authgroup`
--
ALTER TABLE `accounts_authgroup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `accounts_authgrouppermissions`
--
ALTER TABLE `accounts_authgrouppermissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_authgrouppe_group_id_13536d69_fk_accounts_` (`group_id`),
  ADD KEY `accounts_authgrouppe_permission_id_b6c8405e_fk_accounts_` (`permission_id`);

--
-- Indexes for table `accounts_authpermission`
--
ALTER TABLE `accounts_authpermission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_authpermiss_content_type_id_09cca559_fk_accounts_` (`content_type_id`);

--
-- Indexes for table `accounts_authuser`
--
ALTER TABLE `accounts_authuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `accounts_authusergroups`
--
ALTER TABLE `accounts_authusergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_authusergro_group_id_37f3c068_fk_accounts_` (`group_id`),
  ADD KEY `accounts_authusergroups_user_id_5197983e_fk_accounts_authuser_id` (`user_id`);

--
-- Indexes for table `accounts_authuseruserpermissions`
--
ALTER TABLE `accounts_authuseruserpermissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_authuseruse_permission_id_e534fa35_fk_accounts_` (`permission_id`),
  ADD KEY `accounts_authuseruse_user_id_273c4ba4_fk_accounts_` (`user_id`);

--
-- Indexes for table `accounts_brand`
--
ALTER TABLE `accounts_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_brand_name_15cf7dad_uniq` (`name`);

--
-- Indexes for table `accounts_cart`
--
ALTER TABLE `accounts_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_cart_product_id_53e5d9f5_fk_accounts_product_id` (`product_id`),
  ADD KEY `accounts_cart_customer_id_2e1da2b7_fk_accounts_customer_id` (`customer_id`);

--
-- Indexes for table `accounts_category`
--
ALTER TABLE `accounts_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_category_name_90d56b88_uniq` (`name`),
  ADD KEY `accounts_category_subcategory_idcatego_b682bcb4_fk_accounts_` (`subcategory_idcategory_id`);

--
-- Indexes for table `accounts_city`
--
ALTER TABLE `accounts_city`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_city_city_name_bba26d93_uniq` (`city_name`),
  ADD KEY `accounts_city_state_idstate_id_e3972739_fk_accounts_state_id` (`state_idstate_id`);

--
-- Indexes for table `accounts_customer`
--
ALTER TABLE `accounts_customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_customer_user_id_11606857_uniq` (`user_id`),
  ADD UNIQUE KEY `accounts_customer_company_name_8f191bd0_uniq` (`company_name`),
  ADD KEY `accounts_customer_area_idarea_267c071a` (`area_id`),
  ADD KEY `accounts_customer_city_id_5c0a0324_fk_accounts_city_id` (`city_id`),
  ADD KEY `accounts_customer_state_id_7ba0c51e_fk_accounts_state_id` (`state_id`);

--
-- Indexes for table `accounts_customize`
--
ALTER TABLE `accounts_customize`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_customize_customer_id_d4058755_fk_accounts_customer_id` (`customer_id`);

--
-- Indexes for table `accounts_deliveryboy`
--
ALTER TABLE `accounts_deliveryboy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `accounts_deliveryboy_state_id_3b867149_fk_accounts_state_id` (`state_id`),
  ADD KEY `accounts_deliveryboy_area_id_1be0e411_fk_accounts_area_id` (`area_id`),
  ADD KEY `accounts_deliveryboy_city_id_4f55b339_fk_accounts_city_id` (`city_id`);

--
-- Indexes for table `accounts_deliverypickup`
--
ALTER TABLE `accounts_deliverypickup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_deliverypic_deliveryboy_id_2e1d96b0_fk_accounts_` (`deliveryboy_id`),
  ADD KEY `accounts_deliverypic_order_id_de21e7c4_fk_accounts_` (`order_id`);

--
-- Indexes for table `accounts_djangoadminlog`
--
ALTER TABLE `accounts_djangoadminlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_djangoadmin_content_type_id_3a529f72_fk_accounts_` (`content_type_id`),
  ADD KEY `accounts_djangoadminlog_user_id_22f4a07c_fk_accounts_authuser_id` (`user_id`);

--
-- Indexes for table `accounts_djangocontenttype`
--
ALTER TABLE `accounts_djangocontenttype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accounts_djangomigrations`
--
ALTER TABLE `accounts_djangomigrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accounts_djangosession`
--
ALTER TABLE `accounts_djangosession`
  ADD PRIMARY KEY (`session_key`);

--
-- Indexes for table `accounts_feedbackrating`
--
ALTER TABLE `accounts_feedbackrating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_feedbackrat_customer_id_e3396916_fk_accounts_` (`customer_id`),
  ADD KEY `accounts_feedbackrat_product_id_0a34ab69_fk_accounts_` (`product_id`),
  ADD KEY `accounts_feedbackrat_orderProduct_id_f0c2bdc4_fk_accounts_` (`orderProduct_id`);

--
-- Indexes for table `accounts_image`
--
ALTER TABLE `accounts_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_image_product_74305a8d_fk_accounts_product_id` (`product`);

--
-- Indexes for table `accounts_offers`
--
ALTER TABLE `accounts_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accounts_order`
--
ALTER TABLE `accounts_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_order_customer_idCustomer_8b1e38b0_fk_accounts_` (`customer_idCustomer`),
  ADD KEY `accounts_order_customer_id_23c59287_fk_accounts_customer_id` (`customer_id`);

--
-- Indexes for table `accounts_orderstatus`
--
ALTER TABLE `accounts_orderstatus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_status` (`status`);

--
-- Indexes for table `accounts_payback`
--
ALTER TABLE `accounts_payback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_payback_order_id_effbad00_fk_accounts_order_id` (`order_id`);

--
-- Indexes for table `accounts_payment`
--
ALTER TABLE `accounts_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_payment_order_id_ba485ace_fk_accounts_order_id` (`order_id`),
  ADD KEY `accounts_payment_payment_method_id_458b1b09_fk_accounts_` (`payment_method_id`);

--
-- Indexes for table `accounts_paymentmethod`
--
ALTER TABLE `accounts_paymentmethod`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accounts_product`
--
ALTER TABLE `accounts_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_product_name_2f4317ea_uniq` (`name`),
  ADD KEY `accounts_product_brand_id_0f53dd2d_fk_accounts_brand_id` (`brand_id`),
  ADD KEY `accounts_product_subcategory_id_ea670e4c_fk_accounts_category_id` (`subcategory_id`),
  ADD KEY `accounts_product_category_id_28b7a97b_fk_accounts_category_id` (`category_id`);

--
-- Indexes for table `accounts_producthasoffers`
--
ALTER TABLE `accounts_producthasoffers`
  ADD PRIMARY KEY (`product_idproduct`),
  ADD KEY `accounts_producthaso_offers_id_offer_ceebc39f_fk_accounts_` (`offers_id_offer`);

--
-- Indexes for table `accounts_producthasorder`
--
ALTER TABLE `accounts_producthasorder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_producthaso_product_id_90dbefb4_fk_accounts_` (`product_id`),
  ADD KEY `accounts_producthaso_status_id_cd5bf039_fk_accounts_` (`status_id`),
  ADD KEY `accounts_producthasorder_order_id_abf3d7ce` (`order_id`);

--
-- Indexes for table `accounts_state`
--
ALTER TABLE `accounts_state`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_state_state_name_424543ec_uniq` (`state_name`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_admin`
--
ALTER TABLE `accounts_admin`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `accounts_area`
--
ALTER TABLE `accounts_area`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `accounts_areahasdeliveryboy`
--
ALTER TABLE `accounts_areahasdeliveryboy`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `accounts_authgroup`
--
ALTER TABLE `accounts_authgroup`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_authgrouppermissions`
--
ALTER TABLE `accounts_authgrouppermissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_authpermission`
--
ALTER TABLE `accounts_authpermission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_authuser`
--
ALTER TABLE `accounts_authuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_authusergroups`
--
ALTER TABLE `accounts_authusergroups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_authuseruserpermissions`
--
ALTER TABLE `accounts_authuseruserpermissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_brand`
--
ALTER TABLE `accounts_brand`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `accounts_cart`
--
ALTER TABLE `accounts_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `accounts_category`
--
ALTER TABLE `accounts_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `accounts_city`
--
ALTER TABLE `accounts_city`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `accounts_customer`
--
ALTER TABLE `accounts_customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `accounts_customize`
--
ALTER TABLE `accounts_customize`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `accounts_deliveryboy`
--
ALTER TABLE `accounts_deliveryboy`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `accounts_deliverypickup`
--
ALTER TABLE `accounts_deliverypickup`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `accounts_djangoadminlog`
--
ALTER TABLE `accounts_djangoadminlog`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_djangocontenttype`
--
ALTER TABLE `accounts_djangocontenttype`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_djangomigrations`
--
ALTER TABLE `accounts_djangomigrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_feedbackrating`
--
ALTER TABLE `accounts_feedbackrating`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `accounts_image`
--
ALTER TABLE `accounts_image`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `accounts_offers`
--
ALTER TABLE `accounts_offers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_order`
--
ALTER TABLE `accounts_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `accounts_orderstatus`
--
ALTER TABLE `accounts_orderstatus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `accounts_payback`
--
ALTER TABLE `accounts_payback`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `accounts_payment`
--
ALTER TABLE `accounts_payment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `accounts_paymentmethod`
--
ALTER TABLE `accounts_paymentmethod`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `accounts_product`
--
ALTER TABLE `accounts_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `accounts_producthasorder`
--
ALTER TABLE `accounts_producthasorder`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `accounts_state`
--
ALTER TABLE `accounts_state`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=695;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_admin`
--
ALTER TABLE `accounts_admin`
  ADD CONSTRAINT `accounts_admin_area_id_8aac8e1c_fk_accounts_area_id` FOREIGN KEY (`area_id`) REFERENCES `accounts_area` (`id`),
  ADD CONSTRAINT `accounts_admin_city_id_cbb8e8d7_fk_accounts_city_id` FOREIGN KEY (`city_id`) REFERENCES `accounts_city` (`id`),
  ADD CONSTRAINT `accounts_admin_state_id_75ff6b70_fk_accounts_state_id` FOREIGN KEY (`state_id`) REFERENCES `accounts_state` (`id`),
  ADD CONSTRAINT `accounts_admin_user_id_af8a3aeb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `accounts_area`
--
ALTER TABLE `accounts_area`
  ADD CONSTRAINT `accounts_area_city_idcity_ac71fcbe_fk_accounts_city_id` FOREIGN KEY (`city_idcity`) REFERENCES `accounts_city` (`id`);

--
-- Constraints for table `accounts_areahasdeliveryboy`
--
ALTER TABLE `accounts_areahasdeliveryboy`
  ADD CONSTRAINT `accounts_areahasdeli_deliveryboy_id_2fbe6c63_fk_accounts_` FOREIGN KEY (`deliveryboy_id`) REFERENCES `accounts_deliveryboy` (`id`),
  ADD CONSTRAINT `accounts_areahasdeliveryboy_area_id_ae118ba6_fk_accounts_area_id` FOREIGN KEY (`area_id`) REFERENCES `accounts_area` (`id`);

--
-- Constraints for table `accounts_authgrouppermissions`
--
ALTER TABLE `accounts_authgrouppermissions`
  ADD CONSTRAINT `accounts_authgrouppe_group_id_13536d69_fk_accounts_` FOREIGN KEY (`group_id`) REFERENCES `accounts_authgroup` (`id`),
  ADD CONSTRAINT `accounts_authgrouppe_permission_id_b6c8405e_fk_accounts_` FOREIGN KEY (`permission_id`) REFERENCES `accounts_authpermission` (`id`);

--
-- Constraints for table `accounts_authpermission`
--
ALTER TABLE `accounts_authpermission`
  ADD CONSTRAINT `accounts_authpermiss_content_type_id_09cca559_fk_accounts_` FOREIGN KEY (`content_type_id`) REFERENCES `accounts_djangocontenttype` (`id`);

--
-- Constraints for table `accounts_authusergroups`
--
ALTER TABLE `accounts_authusergroups`
  ADD CONSTRAINT `accounts_authusergro_group_id_37f3c068_fk_accounts_` FOREIGN KEY (`group_id`) REFERENCES `accounts_authgroup` (`id`),
  ADD CONSTRAINT `accounts_authusergroups_user_id_5197983e_fk_accounts_authuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_authuser` (`id`);

--
-- Constraints for table `accounts_authuseruserpermissions`
--
ALTER TABLE `accounts_authuseruserpermissions`
  ADD CONSTRAINT `accounts_authuseruse_permission_id_e534fa35_fk_accounts_` FOREIGN KEY (`permission_id`) REFERENCES `accounts_authpermission` (`id`),
  ADD CONSTRAINT `accounts_authuseruse_user_id_273c4ba4_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_authuser` (`id`);

--
-- Constraints for table `accounts_cart`
--
ALTER TABLE `accounts_cart`
  ADD CONSTRAINT `accounts_cart_customer_id_2e1da2b7_fk_accounts_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `accounts_customer` (`id`),
  ADD CONSTRAINT `accounts_cart_product_id_53e5d9f5_fk_accounts_product_id` FOREIGN KEY (`product_id`) REFERENCES `accounts_product` (`id`);

--
-- Constraints for table `accounts_category`
--
ALTER TABLE `accounts_category`
  ADD CONSTRAINT `accounts_category_subcategory_idcatego_b682bcb4_fk_accounts_` FOREIGN KEY (`subcategory_idcategory_id`) REFERENCES `accounts_category` (`id`);

--
-- Constraints for table `accounts_city`
--
ALTER TABLE `accounts_city`
  ADD CONSTRAINT `accounts_city_state_idstate_id_e3972739_fk_accounts_state_id` FOREIGN KEY (`state_idstate_id`) REFERENCES `accounts_state` (`id`);

--
-- Constraints for table `accounts_customer`
--
ALTER TABLE `accounts_customer`
  ADD CONSTRAINT `accounts_customer_city_id_5c0a0324_fk_accounts_city_id` FOREIGN KEY (`city_id`) REFERENCES `accounts_city` (`id`),
  ADD CONSTRAINT `accounts_customer_state_id_7ba0c51e_fk_accounts_state_id` FOREIGN KEY (`state_id`) REFERENCES `accounts_state` (`id`),
  ADD CONSTRAINT `accounts_customer_user_id_11606857_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `accounts_customize`
--
ALTER TABLE `accounts_customize`
  ADD CONSTRAINT `accounts_customize_customer_id_d4058755_fk_accounts_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `accounts_customer` (`id`);

--
-- Constraints for table `accounts_deliveryboy`
--
ALTER TABLE `accounts_deliveryboy`
  ADD CONSTRAINT `accounts_deliveryboy_area_id_1be0e411_fk_accounts_area_id` FOREIGN KEY (`area_id`) REFERENCES `accounts_area` (`id`),
  ADD CONSTRAINT `accounts_deliveryboy_city_id_4f55b339_fk_accounts_city_id` FOREIGN KEY (`city_id`) REFERENCES `accounts_city` (`id`),
  ADD CONSTRAINT `accounts_deliveryboy_user_id_0e3def75_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `accounts_deliverypickup`
--
ALTER TABLE `accounts_deliverypickup`
  ADD CONSTRAINT `accounts_deliverypic_deliveryboy_id_2e1d96b0_fk_accounts_` FOREIGN KEY (`deliveryboy_id`) REFERENCES `accounts_deliveryboy` (`id`),
  ADD CONSTRAINT `accounts_deliverypic_order_id_de21e7c4_fk_accounts_` FOREIGN KEY (`order_id`) REFERENCES `accounts_producthasorder` (`id`);

--
-- Constraints for table `accounts_djangoadminlog`
--
ALTER TABLE `accounts_djangoadminlog`
  ADD CONSTRAINT `accounts_djangoadmin_content_type_id_3a529f72_fk_accounts_` FOREIGN KEY (`content_type_id`) REFERENCES `accounts_djangocontenttype` (`id`),
  ADD CONSTRAINT `accounts_djangoadminlog_user_id_22f4a07c_fk_accounts_authuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_authuser` (`id`);

--
-- Constraints for table `accounts_feedbackrating`
--
ALTER TABLE `accounts_feedbackrating`
  ADD CONSTRAINT `accounts_feedbackrat_customer_id_e3396916_fk_accounts_` FOREIGN KEY (`customer_id`) REFERENCES `accounts_customer` (`id`),
  ADD CONSTRAINT `accounts_feedbackrat_orderProduct_id_f0c2bdc4_fk_accounts_` FOREIGN KEY (`orderProduct_id`) REFERENCES `accounts_producthasorder` (`id`),
  ADD CONSTRAINT `accounts_feedbackrat_product_id_0a34ab69_fk_accounts_` FOREIGN KEY (`product_id`) REFERENCES `accounts_product` (`id`);

--
-- Constraints for table `accounts_image`
--
ALTER TABLE `accounts_image`
  ADD CONSTRAINT `accounts_image_product_74305a8d_fk_accounts_product_id` FOREIGN KEY (`product`) REFERENCES `accounts_product` (`id`);

--
-- Constraints for table `accounts_payback`
--
ALTER TABLE `accounts_payback`
  ADD CONSTRAINT `accounts_payback_order_id_effbad00_fk_accounts_order_id` FOREIGN KEY (`order_id`) REFERENCES `accounts_order` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
