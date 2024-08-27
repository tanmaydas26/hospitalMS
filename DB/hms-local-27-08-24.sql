-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2024 at 07:48 AM
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
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `intime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `outtime` timestamp NULL DEFAULT NULL,
  `status` enum('pending','completed') NOT NULL DEFAULT 'pending',
  `description` varchar(255) NOT NULL,
  `prescription` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beds`
--

CREATE TABLE `beds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('alloted','available') NOT NULL DEFAULT 'available',
  `alloted_time` timestamp NULL DEFAULT NULL,
  `discharge_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beds`
--

INSERT INTO `beds` (`id`, `room_id`, `patient_id`, `status`, `alloted_time`, `discharge_time`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, NULL, 'available', NULL, NULL, '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(2, 4, NULL, 'available', NULL, NULL, '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(3, 4, NULL, 'available', NULL, NULL, '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(4, 2, NULL, 'available', NULL, NULL, '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(5, 5, NULL, 'available', NULL, NULL, '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patients_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `birthreports`
--

CREATE TABLE `birthreports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `gender` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blockname` varchar(255) NOT NULL,
  `blockcode` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`id`, `blockname`, `blockcode`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Robbie Turner', 235, '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(2, 'Rosendo Glover PhD', 244, '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(3, 'Reggie Bergnaum', 249, '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(4, 'Prince McGlynn DDS', 347, '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(5, 'Logan Mayert', 245, '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(70) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(250) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `photo_path` varchar(255) NOT NULL,
  `hod_id` bigint(20) UNSIGNED NOT NULL,
  `block_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `description`, `photo_path`, `hod_id`, `block_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Mr. Beau Kassulke', 'Sit sed vel voluptates sapiente. Vel dolorum dolorem maiores iure similique commodi est. Consequuntur dolorem id alias iusto quae quibusdam.', 'https://via.placeholder.com/150', 1, 1, '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(2, 'Missouri Barton', 'Nulla quia sunt quis repellat doloremque sit eos. Itaque eum illo dolor ex. Doloremque soluta a sequi magnam consequatur quis.', 'https://via.placeholder.com/150', 2, 2, '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `employee_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 11, '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(2, 11, '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `position` enum('nurse','doctor','accountant','pharmacist','receptionist','cleaner','security','other') NOT NULL DEFAULT 'other',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `phone`, `salary`, `address`, `qualification`, `position`, `status`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Eladio Graham', 'peyton.beier@example.org', '(225) 307-0344', '1390', '22072 Considine Streets Suite 728\nNew Ford, CO 75852', 'Hic qui et.', 'nurse', 'inactive', 'https://via.placeholder.com/640x480.png/00cc22?text=ipsam', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(2, 'Hailee Turner MD', 'xstanton@example.org', '585-438-4565', '69636', '6218 Wisozk Lights Apt. 875\nMertiemouth, WV 74865-9360', 'Debitis vel est ex.', 'nurse', 'active', 'https://via.placeholder.com/640x480.png/0055cc?text=ut', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(3, 'Prof. Noelia Simonis PhD', 'gorczany.micaela@example.org', '678.553.8105', '34008', '4471 Donnelly Common\nKallieshire, NC 42981-8145', 'Et et saepe aut.', 'nurse', 'active', 'https://via.placeholder.com/640x480.png/004411?text=nostrum', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(4, 'Dr. Christian Witting', 'mary17@example.org', '641.795.3514', '43613', '49728 Paucek Squares Apt. 567\nO\'Keefebury, LA 10779-8530', 'Delectus architecto.', 'nurse', 'inactive', 'https://via.placeholder.com/640x480.png/00ccdd?text=et', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(5, 'Sheldon Beatty', 'vhahn@example.org', '+1-818-338-5574', '29241', '967 Kuhn Extension\nNew Bell, RI 90964', 'Voluptatem possimus.', 'nurse', 'active', 'https://via.placeholder.com/640x480.png/0000dd?text=ducimus', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(6, 'William Kilback', 'qkoepp@example.com', '1-423-842-6736', '95291', '14799 Paxton Heights\nEast Nicholaus, HI 41928-0098', 'Iste adipisci quia.', 'nurse', 'inactive', 'https://via.placeholder.com/640x480.png/00ffff?text=nisi', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(7, 'Dr. Oren Kub', 'matilde24@example.com', '951-872-7248', '56719', '518 Jadyn Loop Apt. 921\nPort River, TN 42159-2674', 'Et dignissimos.', 'nurse', 'inactive', 'https://via.placeholder.com/640x480.png/00eeff?text=at', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(8, 'Simone Gleason', 'zieme.theresa@example.net', '+1 (628) 999-7601', '23250', '459 Myra Ridges\nSistershire, VA 44049', 'Beatae et omnis aut.', 'nurse', 'inactive', 'https://via.placeholder.com/640x480.png/0033bb?text=voluptatum', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(9, 'Brooklyn Dare', 'randy.monahan@example.org', '(463) 892-6208', '76821', '2617 Crooks Fords Suite 196\nPort Ebonybury, VA 49402', 'Voluptas id est.', 'nurse', 'inactive', 'https://via.placeholder.com/640x480.png/006633?text=dolorum', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(10, 'Mr. Levi Dooley DDS', 'eborer@example.net', '575-534-4326', '45668', '854 Bosco Harbors Suite 960\nWest Nakiaton, MS 21343-2199', 'Nihil ea dolore.', 'nurse', 'active', 'https://via.placeholder.com/640x480.png/00ccff?text=alias', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(11, 'Vidal Will', 'renner.irving@example.net', '+1-703-415-1227', '71217', '851 Hudson Plains\nHudsonland, MN 60352-9138', 'Et sed et id nisi.', 'doctor', 'inactive', 'https://via.placeholder.com/640x480.png/004433?text=quis', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(12, 'Christian Haley', 'rfunk@example.com', '563-723-6059', '61157', '8729 Alexandria Ferry\nJacklynton, UT 53133-3039', 'Distinctio debitis.', 'doctor', 'active', 'https://via.placeholder.com/640x480.png/0000aa?text=quisquam', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(13, 'Bradly Simonis', 'pattie.pfannerstill@example.com', '+1-747-489-4611', '23549', '4358 Pearl Meadows\nMohammedmouth, MT 37678', 'Eos amet odio.', 'doctor', 'inactive', 'https://via.placeholder.com/640x480.png/00cc11?text=et', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(14, 'Douglas Batz', 'russ10@example.org', '681-628-1815', '55894', '87578 Orval Port\nEast Ricardo, TN 01938', 'Ut ea consequuntur.', 'doctor', 'inactive', 'https://via.placeholder.com/640x480.png/002277?text=et', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(15, 'Vivien Farrell', 'katelynn09@example.com', '425.546.6324', '65762', '35059 Berge Walks Suite 948\nWest Anahi, NE 46277', 'Labore quod harum.', 'doctor', 'inactive', 'https://via.placeholder.com/640x480.png/00bbaa?text=sed', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(16, 'Dr. Domingo Lebsack', 'schinner.brendan@example.org', '1-725-853-7025', '55512', '11924 Schmidt Knoll\nSchoenfurt, FL 74798-3681', 'Enim praesentium.', 'doctor', 'active', 'https://via.placeholder.com/640x480.png/004488?text=velit', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(17, 'Delilah Hane V', 'kaylie04@example.org', '949.602.1603', '95656', '785 Gudrun Streets\nJarvisborough, LA 31926', 'Cum saepe quos.', 'doctor', 'active', 'https://via.placeholder.com/640x480.png/004455?text=corrupti', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(18, 'Dr. Burley Tillman DVM', 'gavin.schuppe@example.net', '(631) 864-0332', '99994', '67893 Clement Village Apt. 577\nSouth Dasiaside, NE 19882-7909', 'Error repellendus.', 'doctor', 'inactive', 'https://via.placeholder.com/640x480.png/005500?text=consequatur', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(19, 'Dagmar Schultz V', 'gschuppe@example.org', '732.743.3426', '71795', '72387 Cronin Road Apt. 771\nNew Kurtisview, NE 35115-7033', 'Consequatur.', 'doctor', 'inactive', 'https://via.placeholder.com/640x480.png/007722?text=fugit', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(20, 'Emory Boyer III', 'schmidt.karli@example.org', '+1-321-640-0517', '13796', '9691 Funk Meadows Suite 996\nWest Pasqualechester, NM 55242-9288', 'Amet maxime.', 'doctor', 'active', 'https://via.placeholder.com/640x480.png/005500?text=laboriosam', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(21, 'Cordia Kassulke', 'sadye78@example.org', '323.985.4268', '71908', '4706 Wunsch Stream Apt. 543\nCyrilton, NY 81717-2055', 'Repellat ab omnis.', 'accountant', 'inactive', 'https://via.placeholder.com/640x480.png/00aa88?text=consequatur', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(22, 'Bridget Pollich', 'demond.klocko@example.org', '+1.469.526.3240', '84727', '34336 Alessandra Ville Apt. 853\nSummermouth, WV 56118-0719', 'Sit incidunt et.', 'accountant', 'inactive', 'https://via.placeholder.com/640x480.png/0099ff?text=ducimus', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(23, 'Ursula Stamm', 'darrin.purdy@example.org', '1-281-362-2422', '12184', '261 Johnson Villages Suite 305\nWest Viola, ND 26845-8883', 'A voluptatem aut.', 'accountant', 'active', 'https://via.placeholder.com/640x480.png/00aacc?text=quod', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(24, 'Dr. Fredrick Gulgowski', 'grippin@example.net', '(843) 774-5778', '45994', '256 Hansen Square\nLake Evan, UT 74559', 'Aut et a distinctio.', 'accountant', 'active', 'https://via.placeholder.com/640x480.png/005577?text=qui', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(25, 'Jerad Schimmel', 'knicolas@example.net', '+15856977841', '34038', '37402 Rosalia Coves Suite 212\nObiestad, AR 22704-3507', 'Autem perspiciatis.', 'accountant', 'active', 'https://via.placeholder.com/640x480.png/005544?text=rerum', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(26, 'Lexie Leuschke', 'qabbott@example.org', '406.544.2145', '99585', '2105 Wilderman Heights Apt. 218\nEast Katrina, OR 78044-5820', 'Debitis quis at et.', 'accountant', 'active', 'https://via.placeholder.com/640x480.png/003366?text=quaerat', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(27, 'Dayna Blanda', 'carroll.aglae@example.org', '+1.234.359.4694', '97619', '1572 Ebba Trail Suite 531\nBreitenbergberg, MS 92501', 'Et accusantium ea.', 'accountant', 'active', 'https://via.placeholder.com/640x480.png/00cc11?text=maiores', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(28, 'Freda Labadie II', 'price@example.org', '+1-820-458-8980', '40264', '1405 Hoppe Manor Apt. 348\nAudraland, IA 70800-1868', 'Aut eveniet aliquam.', 'accountant', 'inactive', 'https://via.placeholder.com/640x480.png/004433?text=ducimus', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(29, 'Dr. Haley Abshire', 'waufderhar@example.com', '+1-747-559-0999', '77825', '842 Kessler Locks\nWymanmouth, CO 09595-1716', 'Vero autem maiores.', 'accountant', 'inactive', 'https://via.placeholder.com/640x480.png/0066bb?text=corrupti', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(30, 'Prof. Verla Hauck I', 'delaney33@example.net', '+1-534-219-4282', '34226', '373 Kendall Shoal\nNew Ima, WY 19434-2923', 'Ut cum.', 'accountant', 'inactive', 'https://via.placeholder.com/640x480.png/00aa55?text=excepturi', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(31, 'Presley Doyle', 'rosalia.graham@example.net', '(281) 945-9289', '913', '43283 Nader Union\nDietrichfurt, ME 02200', 'Et illum nobis.', 'pharmacist', 'active', 'https://via.placeholder.com/640x480.png/009944?text=consequatur', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(32, 'Delfina Lubowitz', 'xpagac@example.org', '+12525175593', '26928', '8711 Hessel Curve Suite 824\nPort Nathanialberg, WY 59077-2756', 'Delectus nihil.', 'pharmacist', 'inactive', 'https://via.placeholder.com/640x480.png/003311?text=aperiam', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(33, 'Jimmy Bogisich', 'lexi.johnston@example.net', '1-623-353-2060', '19077', '781 Henry Shoal Apt. 505\nNew Barttown, ND 73808-7244', 'Et facilis error.', 'pharmacist', 'inactive', 'https://via.placeholder.com/640x480.png/00ee22?text=accusantium', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(34, 'Mr. Ahmad Mosciski', 'ressie68@example.com', '234-219-4027', '60582', '76685 Goldner Divide\nKihnside, KS 20889-3928', 'Architecto.', 'pharmacist', 'inactive', 'https://via.placeholder.com/640x480.png/00aaaa?text=explicabo', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(35, 'Prof. Verla Barrows', 'fredrick.west@example.net', '+1.323.888.9644', '50257', '3118 Ocie Crest\nNew Maynard, NJ 61381', 'Veniam ab aperiam.', 'pharmacist', 'active', 'https://via.placeholder.com/640x480.png/00eeee?text=minus', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(36, 'Camryn Dietrich PhD', 'braun.jamil@example.net', '859-639-0938', '63997', '2980 Kaelyn Overpass Suite 360\nNew Delmer, LA 68325-5462', 'Architecto totam.', 'pharmacist', 'inactive', 'https://via.placeholder.com/640x480.png/00ee00?text=et', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(37, 'Greyson Rath', 'stewart.rath@example.net', '(234) 909-4178', '79054', '885 Turcotte Isle Suite 414\nPort Loren, FL 99298', 'Minima adipisci.', 'pharmacist', 'active', 'https://via.placeholder.com/640x480.png/0022dd?text=ducimus', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(38, 'Kobe Feil', 'dorcas.spencer@example.com', '+1.701.538.9217', '98131', '670 Maximillian Lodge\nNorth Kelvinburgh, UT 93967-8469', 'Et ipsa non magni.', 'pharmacist', 'inactive', 'https://via.placeholder.com/640x480.png/000099?text=enim', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(39, 'Shemar Bayer', 'emmerich.juliana@example.net', '1-754-476-6001', '95312', '6588 Johnson Circles\nPort Juliethaven, OK 72886-5741', 'Accusantium beatae.', 'pharmacist', 'inactive', 'https://via.placeholder.com/640x480.png/0088dd?text=recusandae', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(40, 'Hershel Hand', 'bode.jeremie@example.net', '+1-240-544-0377', '38879', '2042 Emmanuel Extension\nLake Ewaldview, AR 14992', 'Magni sunt et sint.', 'pharmacist', 'active', 'https://via.placeholder.com/640x480.png/008822?text=error', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(41, 'Amani Quitzon', 'arvid77@example.org', '1-872-965-6019', '18551', '5608 Klein Shoals\nMicaelamouth, IL 03986-7147', 'Ut amet repellat.', 'receptionist', 'inactive', 'https://via.placeholder.com/640x480.png/008833?text=deleniti', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(42, 'Miss Tina Prohaska I', 'elta35@example.org', '+1-352-745-6303', '955', '225 Carley Brooks Apt. 347\nErickaburgh, NC 33056', 'Delectus sit.', 'receptionist', 'active', 'https://via.placeholder.com/640x480.png/00cc88?text=fuga', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(43, 'Fermin Bergstrom Jr.', 'zgulgowski@example.net', '+1-986-268-0956', '28194', '793 Turner Lock Apt. 073\nIsabelfurt, OH 51537', 'Voluptatum culpa ut.', 'receptionist', 'active', 'https://via.placeholder.com/640x480.png/004422?text=repellat', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(44, 'Wayne Schulist', 'herzog.bridie@example.net', '+17437547830', '94382', '192 Stoltenberg Ranch Suite 020\nNaomieburgh, DE 35581-2182', 'Expedita et placeat.', 'receptionist', 'inactive', 'https://via.placeholder.com/640x480.png/0099cc?text=aut', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(45, 'Vesta Von', 'tschamberger@example.net', '323-846-2371', '68075', '2487 Quinten Estate\nNorth Gregoryshire, NE 06648-7515', 'Dolorum numquam.', 'receptionist', 'inactive', 'https://via.placeholder.com/640x480.png/001144?text=non', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(46, 'Mr. Blake Weimann', 'nitzsche.dorcas@example.com', '+1.650.879.5766', '92460', '88424 Coy Ferry\nSouth Candidastad, NJ 25891-8780', 'Quae veniam.', 'receptionist', 'inactive', 'https://via.placeholder.com/640x480.png/00cccc?text=sapiente', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(47, 'Isobel Reinger', 'rodriguez.rupert@example.org', '1-951-444-6824', '18817', '398 Angie Locks\nLake Missouri, OH 81000', 'Voluptas et facere.', 'receptionist', 'active', 'https://via.placeholder.com/640x480.png/005555?text=sapiente', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(48, 'Elnora Muller', 'ulices32@example.org', '(320) 859-2367', '33316', '738 Rebecca Islands Suite 876\nJenkinsburgh, NY 66821', 'Atque qui fugiat.', 'receptionist', 'active', 'https://via.placeholder.com/640x480.png/0033ff?text=esse', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(49, 'Virgil Gorczany', 'cmarks@example.net', '909.503.8002', '97756', '5927 Schuster Greens\nSouth Jazmynmouth, MD 04661', 'Ratione.', 'receptionist', 'inactive', 'https://via.placeholder.com/640x480.png/0077dd?text=suscipit', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(50, 'Kelvin Rippin II', 'sebastian.weimann@example.com', '857-202-7776', '47654', '2484 Abshire Court Apt. 307\nNorth Xander, AK 97526-8095', 'Officia error aut.', 'receptionist', 'inactive', 'https://via.placeholder.com/640x480.png/00ccff?text=sit', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(51, 'Marilyne Sanford', 'thompson.brandyn@example.com', '947.890.6046', '29249', '52883 Jerald Bridge\nSawayntown, AZ 16355', 'Ab nihil expedita.', 'cleaner', 'active', 'https://via.placeholder.com/640x480.png/0011ee?text=dignissimos', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(52, 'Prof. Nash Toy DVM', 'moen.rahsaan@example.com', '+12402553661', '46412', '30819 Kuvalis Plains Apt. 002\nKautzerstad, MA 96063-3150', 'Debitis similique.', 'cleaner', 'active', 'https://via.placeholder.com/640x480.png/00aa44?text=eveniet', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(53, 'Gerald Daugherty', 'stokes.callie@example.com', '1-580-576-3871', '97258', '38667 Christine Pine Suite 516\nPearlinefort, KY 48581-8405', 'Necessitatibus rem.', 'cleaner', 'inactive', 'https://via.placeholder.com/640x480.png/008888?text=libero', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(54, 'Kay Yundt', 'kris.seamus@example.org', '(820) 558-8836', '3244', '21257 Franco Crossing\nBrakusstad, LA 65969', 'Optio sit.', 'cleaner', 'inactive', 'https://via.placeholder.com/640x480.png/006655?text=sunt', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(55, 'Casper Kuhic', 'vincenzo.senger@example.org', '+1.838.734.3605', '86932', '286 Verlie Crescent\nTorpfort, DC 86668-0863', 'Libero.', 'cleaner', 'inactive', 'https://via.placeholder.com/640x480.png/0088ff?text=aut', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(56, 'Ahmad Ebert', 'tanya46@example.org', '+13366171357', '94817', '4968 Litzy Estate Apt. 257\nNew Roxanneborough, RI 73499-3968', 'Ea enim accusamus.', 'cleaner', 'inactive', 'https://via.placeholder.com/640x480.png/000088?text=accusantium', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(57, 'Frances Keebler', 'pstanton@example.com', '762-716-7210', '39672', '847 Abigale Passage\nPort Kailynberg, MI 56501-3449', 'Mollitia et.', 'cleaner', 'active', 'https://via.placeholder.com/640x480.png/00bb88?text=beatae', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(58, 'Oswaldo Dibbert', 'ruby.mckenzie@example.net', '703-947-8010', '72077', '66694 Veda Tunnel\nNorth Nialand, DC 74972', 'Modi impedit.', 'cleaner', 'active', 'https://via.placeholder.com/640x480.png/007766?text=voluptatem', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(59, 'Daniella Waelchi', 'gerda.labadie@example.com', '+19205541845', '67964', '48842 Arturo Prairie\nSouth Modesto, UT 26849-3804', 'Nisi doloremque.', 'cleaner', 'active', 'https://via.placeholder.com/640x480.png/001177?text=officia', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(60, 'Prof. Tom Rowe Jr.', 'borer.rosalee@example.org', '817-529-8636', '48279', '879 Crist Roads\nNew Obieport, IA 54886', 'Aut non cumque.', 'cleaner', 'active', 'https://via.placeholder.com/640x480.png/009966?text=nostrum', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(61, 'Vida Runolfsson', 'zieme.shanny@example.net', '(409) 202-5673', '5123', '1359 Myles Manor\nRyleetown, TN 48781', 'Pariatur asperiores.', 'security', 'active', 'https://via.placeholder.com/640x480.png/0022bb?text=tempore', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(62, 'Merl Beer', 'kristoffer35@example.org', '+1.915.644.2938', '82472', '57097 Schneider Highway Apt. 976\nSouth Kevin, MN 95051-8613', 'Illo reprehenderit.', 'security', 'inactive', 'https://via.placeholder.com/640x480.png/0099aa?text=similique', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(63, 'Stella Sanford', 'collins.concepcion@example.com', '+1-361-795-9028', '43448', '88498 Brown Islands\nKristianberg, NV 17676-0223', 'Voluptate iure quam.', 'security', 'active', 'https://via.placeholder.com/640x480.png/00ccdd?text=non', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(64, 'Janelle Cormier II', 'bins.marisa@example.org', '330.286.5000', '21015', '798 Steuber Cove\nWest Sharonhaven, IA 64021-2381', 'Aliquid et sapiente.', 'security', 'active', 'https://via.placeholder.com/640x480.png/0066dd?text=laboriosam', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(65, 'Makenzie Cole', 'oweissnat@example.net', '+1.863.666.1019', '75120', '39141 Candelario Stream Suite 222\nPort Eryn, HI 42043-2681', 'Voluptas molestiae.', 'security', 'inactive', 'https://via.placeholder.com/640x480.png/006655?text=qui', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(66, 'Karina White', 'abbott.ashleigh@example.com', '1-816-484-1544', '41016', '542 Kirlin Ville Apt. 399\nVivashire, OK 36683-8488', 'Et blanditiis amet.', 'security', 'inactive', 'https://via.placeholder.com/640x480.png/005511?text=ut', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(67, 'Maurice Sanford', 'brenden68@example.com', '+1-678-372-0008', '65786', '3139 Adrian Forge\nNickfort, MT 39271-2008', 'Quasi similique.', 'security', 'inactive', 'https://via.placeholder.com/640x480.png/001122?text=vel', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(68, 'Dr. Lulu Spinka', 'maureen42@example.org', '+1 (539) 649-4644', '94247', '4272 Jena Points Suite 166\nGretamouth, IN 59849-2871', 'Nihil aut laborum.', 'security', 'inactive', 'https://via.placeholder.com/640x480.png/0088bb?text=sit', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(69, 'Dr. Jazmyne Wolf III', 'veum.geoffrey@example.net', '(646) 536-5017', '33472', '70992 Feest Port Suite 551\nJacobistad, NH 47758-3790', 'Architecto ipsum.', 'security', 'active', 'https://via.placeholder.com/640x480.png/005533?text=dicta', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(70, 'Dejon Runolfsson', 'hazel.schowalter@example.com', '+1-878-667-1401', '39996', '762 Raoul Station\nWest Jordyview, SC 69685-9301', 'Consequuntur minus.', 'security', 'inactive', 'https://via.placeholder.com/640x480.png/00dd66?text=explicabo', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(71, 'Mr. Rudolph Stoltenberg I', 'bauch.elinor@example.com', '270.290.4465', '32132', '2199 Howe Branch\nPort Daphney, OK 54094-1657', 'Quas earum deleniti.', 'other', 'inactive', 'https://via.placeholder.com/640x480.png/0077ff?text=voluptas', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(72, 'Kraig Howell', 'tristian.huel@example.com', '(540) 231-9645', '17863', '10101 Tyree Branch\nNorth Cruz, DC 77611-4995', 'Cum quia voluptatem.', 'other', 'active', 'https://via.placeholder.com/640x480.png/00dd11?text=voluptate', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(73, 'Hortense Streich', 'tressie.bradtke@example.com', '+1-283-406-1336', '35657', '1119 Waldo Glens\nMertzville, FL 54625', 'Fugiat unde nihil.', 'other', 'inactive', 'https://via.placeholder.com/640x480.png/0055ff?text=aspernatur', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(74, 'Keagan Wilkinson', 'zgoyette@example.com', '1-551-363-7976', '11676', '6477 Sherwood Tunnel\nPort Mandy, OR 92365', 'Aliquid nobis.', 'other', 'active', 'https://via.placeholder.com/640x480.png/00ddff?text=facere', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(75, 'Ms. Fabiola Crist', 'rgraham@example.net', '947-267-9160', '88306', '714 Rhoda Square Suite 686\nNew Isaias, NM 86188', 'Incidunt veniam.', 'other', 'active', 'https://via.placeholder.com/640x480.png/000033?text=porro', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(76, 'Angel O\'Kon', 'adooley@example.net', '+1.434.327.5004', '93497', '746 Arne Inlet\nJarodhaven, GA 26161', 'Ipsa ducimus esse.', 'other', 'inactive', 'https://via.placeholder.com/640x480.png/0044aa?text=quisquam', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(77, 'Mr. Darron Sauer V', 'goyette.felicita@example.org', '+15639134146', '74480', '3366 Alexandria Creek Apt. 344\nDoylebury, UT 72633', 'Eum excepturi fuga.', 'other', 'active', 'https://via.placeholder.com/640x480.png/00ee99?text=voluptas', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(78, 'Loyce Connelly II', 'gertrude81@example.net', '(770) 800-2973', '30345', '82248 Leora Hollow\nAdalbertoville, OR 93121', 'Autem ea pariatur.', 'other', 'active', 'https://via.placeholder.com/640x480.png/00ee33?text=est', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(79, 'Ottis Mills', 'huel.christiana@example.org', '862.328.6360', '78367', '4960 Jaden Cliffs\nAlainaport, NC 90701', 'Occaecati quia eum.', 'other', 'active', 'https://via.placeholder.com/640x480.png/003311?text=dolore', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(80, 'Prof. Amari Kihn I', 'maye58@example.net', '283.431.8477', '68825', '3018 Huels Knolls Suite 578\nLittelfort, KS 31378', 'Rem quo quia ut.', 'other', 'inactive', 'https://via.placeholder.com/640x480.png/00ff55?text=eius', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hods`
--

CREATE TABLE `hods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hods`
--

INSERT INTO `hods` (`id`, `doctor_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-08-27 00:09:58', '2024-08-27 00:09:58'),
(2, 1, '2024-08-27 00:09:58', '2024-08-27 00:09:58');

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `price` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`id`, `price`, `quantity`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '641.8', '70', '8545755267831', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(2, '568.5', '68', '7869892611885', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(3, '364.5', '16', '6502805538046', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(4, '359.95', '13', '6317150696767', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(5, '718.02', '84', '2392593502787', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(6, '520.73', '1', '2643493813061', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(7, '718.02', '13', '8592391705654', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(8, '349.87', '73', '1793274091520', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(9, '379.27', '30', '3838694290585', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(10, '207.2', '84', '3202732768587', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(11, '642.93', '48', '0823863199335', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(12, '951.27', '6', '1296239646419', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(13, '625.05', '59', '0867617937101', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(14, '971.07', '14', '2155504556398', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(15, '543.61', '3', '8680933451616', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(16, '33.42', '67', '3864343071229', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(17, '445.69', '63', '4339404101423', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(18, '329.73', '95', '9257983083273', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(19, '51.8', '42', '0412053235528', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(20, '632.08', '93', '5282483356996', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(21, '382.65', '2', '4709164594337', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(22, '409.64', '14', '3673143145609', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(23, '961.36', '39', '7459286207321', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(24, '253.44', '26', '3685405540404', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(25, '494.47', '2', '1356075315402', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(26, '680.86', '22', '0907425607114', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(27, '569.03', '61', '0186181591015', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(28, '877.17', '90', '2576254646519', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(29, '169.09', '54', '4872382314275', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(30, '88.96', '48', '2601568042785', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(31, '627.61', '86', '0179901595608', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(32, '318.61', '47', '6837556377294', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(33, '303.23', '44', '0485410920092', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(34, '365.06', '40', '6032960985855', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(35, '530.82', '19', '2777170114728', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(36, '875.19', '85', '0156887357987', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(37, '461.95', '41', '6115515842039', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(38, '258.21', '12', '2817303223580', '2024-08-27 00:09:59', '2024-08-27 00:09:59', NULL),
(39, '670.26', '78', '9901141288962', '2024-08-27 00:09:59', '2024-08-27 00:09:59', NULL),
(40, '722.78', '55', '0606026541994', '2024-08-27 00:09:59', '2024-08-27 00:09:59', NULL),
(41, '391.26', '84', '6591989249992', '2024-08-27 00:09:59', '2024-08-27 00:09:59', NULL),
(42, '929.46', '7', '4262260218946', '2024-08-27 00:09:59', '2024-08-27 00:09:59', NULL),
(43, '169.78', '56', '5660072405858', '2024-08-27 00:09:59', '2024-08-27 00:09:59', NULL),
(44, '532.44', '29', '1570938357129', '2024-08-27 00:09:59', '2024-08-27 00:09:59', NULL),
(45, '464.49', '59', '2518288167172', '2024-08-27 00:09:59', '2024-08-27 00:09:59', NULL),
(46, '319.28', '80', '4582143707382', '2024-08-27 00:09:59', '2024-08-27 00:09:59', NULL),
(47, '746.64', '44', '2545593446074', '2024-08-27 00:09:59', '2024-08-27 00:09:59', NULL),
(48, '97.07', '61', '4591055059397', '2024-08-27 00:09:59', '2024-08-27 00:09:59', NULL),
(49, '851.95', '53', '9821941322546', '2024-08-27 00:09:59', '2024-08-27 00:09:59', NULL),
(50, '40.74', '26', '1692736023003', '2024-08-27 00:09:59', '2024-08-27 00:09:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_11_000000_create_roles_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2021_04_15_121139_create_patients_table', 1),
(6, '2021_04_15_121316_create_departments_table', 1),
(7, '2021_04_15_121327_create_rooms_table', 1),
(8, '2021_04_15_121345_create_bills_table', 1),
(9, '2021_04_15_121814_create_beds_table', 1),
(10, '2021_04_15_121832_create_payments_table', 1),
(11, '2021_04_16_151056_create_settings_table', 1),
(12, '2021_04_19_070537_create_employees_table', 1),
(13, '2021_04_19_071309_create_medicines_table', 1),
(14, '2021_05_06_051620_create_doctors_table', 1),
(15, '2021_05_09_092124_create_patient_checkups_table', 1),
(16, '2021_05_18_170447_create_operationreports_table', 1),
(17, '2021_05_20_190212_create_birthreports_table', 1),
(18, '2021_05_28_021243_create_stays_table', 1),
(19, '2021_05_28_022310_create_blocks_table', 1),
(20, '2021_05_28_022900_create_appointments_table', 1),
(21, '2021_05_29_024419_create_requested_appointments_table', 1),
(22, '2021_05_29_063531_create_hods_table', 1),
(23, '2021_05_30_073236_create_subscribers_table', 1),
(24, '2021_05_31_092459_create_contacts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `operationreports`
--

CREATE TABLE `operationreports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','completed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `bloodgroup` varchar(255) DEFAULT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `status` enum('admitted','discharged','pending') NOT NULL DEFAULT 'pending',
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `disease` varchar(255) DEFAULT NULL,
  `doctor` varchar(255) DEFAULT NULL,
  `admit_date` varchar(255) DEFAULT NULL,
  `discharge_date` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_checkups`
--

CREATE TABLE `patient_checkups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` enum('pending','completed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` bigint(20) UNSIGNED NOT NULL,
  `amount` varchar(255) NOT NULL,
  `status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `mode` enum('cash','card','cheque','online') NOT NULL DEFAULT 'cash',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requested_appointments`
--

CREATE TABLE `requested_appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL DEFAULT 'text',
  `email` varchar(150) DEFAULT 'text',
  `phone` varchar(13) NOT NULL,
  `address` varchar(150) NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(600) NOT NULL DEFAULT 'text',
  `stime` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2024-08-27 00:09:57', '2024-08-27 00:09:57'),
(2, 'accountant', '2024-08-27 00:09:57', '2024-08-27 00:09:57');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('available','occupied','maintenance') NOT NULL DEFAULT 'available',
  `type` enum('ward','private','semi-private','general') NOT NULL DEFAULT 'general',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `department_id`, `status`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'available', 'semi-private', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(2, 2, 'maintenance', 'ward', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(3, 2, 'maintenance', 'ward', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(4, 2, 'occupied', 'private', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(5, 1, 'available', 'general', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(6, 2, 'maintenance', 'ward', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(7, 2, 'occupied', 'private', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL),
(8, 2, 'available', 'semi-private', '2024-08-27 00:09:58', '2024-08-27 00:09:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'title', 'Hospital Management System', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(2, 'business_email', 'testing@gmail.com', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(3, 'address', 'xyz, abc, 1234, Nepal', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(4, 'business_phone', '+911234567890', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(5, 'working_horse', '7:00 AM - 8:00 PM', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(6, 'description', 'lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore um.', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(7, 'logo', 'logo.png', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(8, 'icon', 'icon.png', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(9, 'facebook', '#', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(10, 'twitter', '#', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(11, 'instagram', '#', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(12, 'linkedin', '#', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(13, 'youtube', '#', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(14, 'pinterest', '#', '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stays`
--

CREATE TABLE `stays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `start_time` varchar(255) DEFAULT '1724737196',
  `end_time` varchar(255) DEFAULT '1724737196',
  `status` enum('active','completed') NOT NULL DEFAULT 'active',
  `amount` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT 'email',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `image`, `email`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'tauseed zaman', NULL, 'tauseed@test.com', NULL, '$2y$10$Q5ixE5L/M1STzpkURY2gn.N0gxcTVGCFka06G61x7FQSkuF/GnfrW', 1, NULL, '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL),
(2, 'accountant', NULL, 'accountant@gmail.com', NULL, '$2y$10$alH5N9O6v4.hWC9bfBPBjuw0cgan3FitNjUOnfT/uDnMczLExQrc6', 2, NULL, '2024-08-27 00:09:57', '2024-08-27 00:09:57', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_patient_id_foreign` (`patient_id`),
  ADD KEY `appointments_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `beds`
--
ALTER TABLE `beds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `beds_room_id_foreign` (`room_id`),
  ADD KEY `beds_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_patients_id_foreign` (`patients_id`);

--
-- Indexes for table `birthreports`
--
ALTER TABLE `birthreports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `birthreports_patient_id_foreign` (`patient_id`),
  ADD KEY `birthreports_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctors_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hods`
--
ALTER TABLE `hods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operationreports`
--
ALTER TABLE `operationreports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `operationreports_patient_id_foreign` (`patient_id`),
  ADD KEY `operationreports_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_checkups`
--
ALTER TABLE `patient_checkups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_checkups_patient_id_foreign` (`patient_id`),
  ADD KEY `patient_checkups_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_patient_id_foreign` (`patient_id`),
  ADD KEY `payments_bill_id_foreign` (`bill_id`);

--
-- Indexes for table `requested_appointments`
--
ALTER TABLE `requested_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `requested_appointments_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_department_id_foreign` (`department_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stays`
--
ALTER TABLE `stays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stays_patient_id_foreign` (`patient_id`),
  ADD KEY `stays_room_id_foreign` (`room_id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `beds`
--
ALTER TABLE `beds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `birthreports`
--
ALTER TABLE `birthreports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hods`
--
ALTER TABLE `hods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `operationreports`
--
ALTER TABLE `operationreports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_checkups`
--
ALTER TABLE `patient_checkups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requested_appointments`
--
ALTER TABLE `requested_appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `stays`
--
ALTER TABLE `stays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `appointments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`);

--
-- Constraints for table `beds`
--
ALTER TABLE `beds`
  ADD CONSTRAINT `beds_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `beds_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_patients_id_foreign` FOREIGN KEY (`patients_id`) REFERENCES `patients` (`id`);

--
-- Constraints for table `birthreports`
--
ALTER TABLE `birthreports`
  ADD CONSTRAINT `birthreports_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `birthreports_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`);

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `operationreports`
--
ALTER TABLE `operationreports`
  ADD CONSTRAINT `operationreports_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `operationreports_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `patient_checkups`
--
ALTER TABLE `patient_checkups`
  ADD CONSTRAINT `patient_checkups_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `patient_checkups_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_bill_id_foreign` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`),
  ADD CONSTRAINT `payments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`);

--
-- Constraints for table `requested_appointments`
--
ALTER TABLE `requested_appointments`
  ADD CONSTRAINT `requested_appointments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `stays`
--
ALTER TABLE `stays`
  ADD CONSTRAINT `stays_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `stays_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
