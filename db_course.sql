-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 10, 2025 at 12:10 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_course`
--

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE IF NOT EXISTS `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add course', 6, 'add_course'),
(22, 'Can change course', 6, 'change_course'),
(23, 'Can delete course', 6, 'delete_course'),
(24, 'Can view course', 6, 'view_course'),
(25, 'Can add user', 7, 'add_customuser'),
(26, 'Can change user', 7, 'change_customuser'),
(27, 'Can delete user', 7, 'delete_customuser'),
(28, 'Can view user', 7, 'view_customuser'),
(29, 'Can add review', 8, 'add_review'),
(30, 'Can change review', 8, 'change_review'),
(31, 'Can delete review', 8, 'delete_review'),
(32, 'Can view review', 8, 'view_review'),
(33, 'Can add user reg', 9, 'add_userreg'),
(34, 'Can change user reg', 9, 'change_userreg'),
(35, 'Can delete user reg', 9, 'delete_userreg'),
(36, 'Can view user reg', 9, 'view_userreg'),
(37, 'Can add Token', 10, 'add_token'),
(38, 'Can change Token', 10, 'change_token'),
(39, 'Can delete Token', 10, 'delete_token'),
(40, 'Can view Token', 10, 'view_token'),
(41, 'Can add Token', 11, 'add_tokenproxy'),
(42, 'Can change Token', 11, 'change_tokenproxy'),
(43, 'Can delete Token', 11, 'delete_tokenproxy'),
(44, 'Can view Token', 11, 'view_tokenproxy'),
(45, 'Can add semester', 12, 'add_semester'),
(46, 'Can change semester', 12, 'change_semester'),
(47, 'Can delete semester', 12, 'delete_semester'),
(48, 'Can view semester', 12, 'view_semester'),
(49, 'Can add subject', 13, 'add_subject'),
(50, 'Can change subject', 13, 'change_subject'),
(51, 'Can delete subject', 13, 'delete_subject'),
(52, 'Can view subject', 13, 'view_subject'),
(53, 'Can add module', 14, 'add_module'),
(54, 'Can change module', 14, 'change_module'),
(55, 'Can delete module', 14, 'delete_module'),
(56, 'Can view module', 14, 'view_module');

-- --------------------------------------------------------

--
-- Table structure for table `course_app_course`
--

DROP TABLE IF EXISTS `course_app_course`;
CREATE TABLE IF NOT EXISTS `course_app_course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) NOT NULL,
  `university` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` varchar(600) NOT NULL,
  `published_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course_app_course`
--

INSERT INTO `course_app_course` (`id`, `course_name`, `university`, `image`, `description`, `published_at`) VALUES
(4, 'Computer Science', 'Calicut University', 'course_image/cs.jpeg', 'The Department of Computer Science was formed in 2010 to provide facilities for  teaching, and research in Computer Science.', '2025-01-09 10:00:15.010427'),
(6, 'Computer Science', 'Calicut University', 'course_image/R1.jpeg', 'The Department of Computer Science was formed in 2010 to provide facilities for  teaching, and research in Computer Science.', '2025-01-10 06:27:38.112499');

-- --------------------------------------------------------

--
-- Table structure for table `course_app_customuser`
--

DROP TABLE IF EXISTS `course_app_customuser`;
CREATE TABLE IF NOT EXISTS `course_app_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course_app_customuser`
--

INSERT INTO `course_app_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `phone_number`) VALUES
(2, 'pbkdf2_sha256$870000$JIw8Suvf7xTep7LNjlqVnR$KRKqWcF61H0u71fzjaQuFB6qSACLCgs+YTA1mQBH/w4=', '2025-01-07 07:07:12.987027', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2024-12-05 07:36:49.762285', NULL),
(31, 'pbkdf2_sha256$870000$PlzruojZNM5r14cJjlzPPp$5paKO3qH9DCLw5qYTjYhsiFBHcduEiXL1p355Scr3j0=', NULL, 0, 'pranav', '', '', 'pranav@gmail.com', 0, 1, '2025-01-10 12:04:08.011952', '8024569214'),
(30, 'pbkdf2_sha256$870000$VyNQuoQ7UuDOwIATnMvvsf$ANI+3zP8PH84yT6/Qz3CdZefm4nPam2oZl5FuL4h1gI=', NULL, 0, 'kishan', '', '', 'kishan@gmail.com', 0, 1, '2025-01-10 12:01:43.017844', '9061395055');

-- --------------------------------------------------------

--
-- Table structure for table `course_app_customuser_groups`
--

DROP TABLE IF EXISTS `course_app_customuser_groups`;
CREATE TABLE IF NOT EXISTS `course_app_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_app_customuser_gr_customuser_id_group_id_c40d6504_uniq` (`customuser_id`,`group_id`),
  KEY `course_app_customuser_groups_customuser_id_84461648` (`customuser_id`),
  KEY `course_app_customuser_groups_group_id_f80b584d` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_app_customuser_user_permissions`
--

DROP TABLE IF EXISTS `course_app_customuser_user_permissions`;
CREATE TABLE IF NOT EXISTS `course_app_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_app_customuser_us_customuser_id_permission_c9b103d8_uniq` (`customuser_id`,`permission_id`),
  KEY `course_app_customuser_user_permissions_customuser_id_221faeac` (`customuser_id`),
  KEY `course_app_customuser_user_permissions_permission_id_a8b04ce3` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_app_module`
--

DROP TABLE IF EXISTS `course_app_module`;
CREATE TABLE IF NOT EXISTS `course_app_module` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `content` varchar(100) NOT NULL,
  `subject_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_app_module_subject_id_a1754176` (`subject_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course_app_module`
--

INSERT INTO `course_app_module` (`id`, `name`, `content`, `subject_id`) VALUES
(2, 'Module 1: Familiar with fundamental concepts of Computer hardware and software', 'subject_content/module-1_RC6HQ6N.pdf', 3),
(3, 'Module 2: Have a knowledge of different Number system, Digital codes and Boolean Algebra', 'subject_content/module-2_WzsxDUY.pdf', 3),
(4, 'Module 3: Understand the problem-solving aspec', 'subject_content/module-3_ixwXmla.pdf', 3),
(5, 'Module 4: Demonstrate the algorithm and flow chart for the given problem.', 'subject_content/module-4_gqEI9Kv.pdf', 3),
(6, 'Module 5: Design a Webpage with CSS', 'subject_content/module-5_37J8Y2C.pdf', 3);

-- --------------------------------------------------------

--
-- Table structure for table `course_app_review`
--

DROP TABLE IF EXISTS `course_app_review`;
CREATE TABLE IF NOT EXISTS `course_app_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `review_text` longtext NOT NULL,
  `rating` int UNSIGNED NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `course_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_app_review_course_id_f17a5137` (`course_id`),
  KEY `course_app_review_user_id_f2a16958` (`user_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `course_app_semester`
--

DROP TABLE IF EXISTS `course_app_semester`;
CREATE TABLE IF NOT EXISTS `course_app_semester` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `course_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_app_semester_course_id_783d289a` (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course_app_semester`
--

INSERT INTO `course_app_semester` (`id`, `name`, `course_id`) VALUES
(4, 'semester2', 4),
(3, 'semester1', 4),
(5, 'semester3', 4),
(6, 'semester4', 4),
(7, 'semester5', 4),
(8, 'semester6', 4);

-- --------------------------------------------------------

--
-- Table structure for table `course_app_subject`
--

DROP TABLE IF EXISTS `course_app_subject`;
CREATE TABLE IF NOT EXISTS `course_app_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `course_id` bigint NOT NULL,
  `semester_id` int NOT NULL,
  `description` varchar(600) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_app_subject_course_id_38f87831` (`course_id`),
  KEY `course_app_subject_semester_id_8ba6da3e` (`semester_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course_app_subject`
--

INSERT INTO `course_app_subject` (`id`, `name`, `course_id`, `semester_id`, `description`) VALUES
(3, 'Computer Fundamentals and HTML', 4, 3, 'This subject introduces students to the fundamental concepts of computer hardware, software, and organization. It explores number systems, Boolean algebra, and problem-solving techniques. Students will learn algorithm design, flowchart development, and basic web technologies, including HTML and CSS. By the end of the course, students will be able to design webpages, solve problems using algorithms, and demonstrate knowledge of computer systems and digital logic.');

-- --------------------------------------------------------

--
-- Table structure for table `course_app_userreg`
--

DROP TABLE IF EXISTS `course_app_userreg`;
CREATE TABLE IF NOT EXISTS `course_app_userreg` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course_app_userreg`
--

INSERT INTO `course_app_userreg` (`id`, `name`, `user_id`) VALUES
(1, 'nami', 15),
(2, 'robin', 16),
(4, 'Melwin Sudheesh', 18),
(5, 'Anitta Baiju', 19),
(6, 'levi', 20),
(7, 'sasuke', 21),
(8, 'sreekanth', 22),
(9, 'test', 23),
(10, 'test', 24),
(11, 'testt', 25),
(12, 'testt', 26),
(13, 'testt', 27),
(14, 'testt', 28),
(15, 'testt', 29),
(16, 'kishan', 30),
(17, 'pranav', 31);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-01-07 06:59:40.083323', '3', 'Course object (3)', 1, '[{\"added\": {}}]', 6, 2),
(2, '2025-01-07 07:18:58.402135', '2', 'Subject object (2)', 1, '[{\"added\": {}}]', 13, 2),
(3, '2025-01-07 07:21:15.210183', '1', 'Module object (1)', 1, '[{\"added\": {}}]', 14, 2),
(4, '2025-01-07 07:28:22.570031', '1', 'Review object (1)', 1, '[{\"added\": {}}]', 8, 2),
(5, '2025-01-07 09:46:24.110254', '3', 'Course object (3)', 2, '[{\"changed\": {\"fields\": [\"University\"]}}]', 6, 2),
(6, '2025-01-08 04:44:08.628449', '2', 'Course object (2)', 3, '', 6, 2),
(7, '2025-01-09 09:53:36.742066', '3', 'Course object (3)', 3, '', 6, 2),
(8, '2025-01-09 09:53:42.018222', '1', 'Course object (1)', 3, '', 6, 2),
(9, '2025-01-09 10:00:15.010427', '4', 'Course object (4)', 1, '[{\"added\": {}}]', 6, 2),
(10, '2025-01-09 10:00:51.352595', '3', 'Semester object (3)', 1, '[{\"added\": {}}]', 12, 2),
(11, '2025-01-09 10:01:08.758507', '4', 'Semester object (4)', 1, '[{\"added\": {}}]', 12, 2),
(12, '2025-01-09 10:01:25.336677', '5', 'Semester object (5)', 1, '[{\"added\": {}}]', 12, 2),
(13, '2025-01-09 10:01:52.969932', '6', 'Semester object (6)', 1, '[{\"added\": {}}]', 12, 2),
(14, '2025-01-09 10:02:08.926880', '7', 'Semester object (7)', 1, '[{\"added\": {}}]', 12, 2),
(15, '2025-01-09 10:02:54.343150', '7', 'Semester object (7)', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 12, 2),
(16, '2025-01-09 10:03:08.294752', '8', 'Semester object (8)', 1, '[{\"added\": {}}]', 12, 2),
(17, '2025-01-09 10:10:02.164828', '3', 'Subject object (3)', 1, '[{\"added\": {}}]', 13, 2),
(18, '2025-01-09 10:21:26.989504', '2', 'Module object (2)', 1, '[{\"added\": {}}]', 14, 2),
(19, '2025-01-09 10:22:47.885634', '3', 'Module object (3)', 1, '[{\"added\": {}}]', 14, 2),
(20, '2025-01-09 10:23:39.208703', '4', 'Module object (4)', 1, '[{\"added\": {}}]', 14, 2),
(21, '2025-01-09 10:24:10.074405', '5', 'Module object (5)', 1, '[{\"added\": {}}]', 14, 2),
(22, '2025-01-09 10:25:05.480069', '6', 'Module object (6)', 1, '[{\"added\": {}}]', 14, 2),
(23, '2025-01-09 11:18:27.582879', '5', 'Course object (5)', 1, '[{\"added\": {}}]', 6, 2),
(24, '2025-01-10 06:27:38.117494', '6', 'Course object (6)', 1, '[{\"added\": {}}]', 6, 2),
(25, '2025-01-10 07:36:50.621109', '2', 'Module object (2)', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 14, 2),
(26, '2025-01-10 07:37:23.458494', '3', 'Module object (3)', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 14, 2),
(27, '2025-01-10 07:37:34.459664', '4', 'Module object (4)', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 14, 2),
(28, '2025-01-10 07:37:43.257042', '5', 'Module object (5)', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 14, 2),
(29, '2025-01-10 07:37:57.512041', '6', 'Module object (6)', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 14, 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(6, 'course_app', 'course'),
(7, 'course_app', 'customuser'),
(8, 'course_app', 'review'),
(9, 'course_app', 'userreg'),
(10, 'authtoken', 'token'),
(11, 'authtoken', 'tokenproxy'),
(12, 'course_app', 'semester'),
(13, 'course_app', 'subject'),
(14, 'course_app', 'module');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-12-05 07:15:33.993350'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-12-05 07:15:34.084317'),
(3, 'auth', '0001_initial', '2024-12-05 07:15:34.683901'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-12-05 07:15:34.741280'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-12-05 07:15:34.745274'),
(6, 'auth', '0004_alter_user_username_opts', '2024-12-05 07:15:34.749276'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-12-05 07:15:34.752265'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-12-05 07:15:34.753267'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-12-05 07:15:34.758266'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-12-05 07:15:34.761176'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-12-05 07:15:34.764181'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-12-05 07:15:34.858075'),
(13, 'auth', '0011_update_proxy_permissions', '2024-12-05 07:15:34.864068'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-12-05 07:15:34.868066'),
(15, 'course_app', '0001_initial', '2024-12-05 07:15:36.103667'),
(16, 'admin', '0001_initial', '2024-12-05 07:15:36.474243'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-12-05 07:15:36.480967'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-12-05 07:15:36.487046'),
(19, 'authtoken', '0001_initial', '2024-12-05 07:15:36.566045'),
(20, 'authtoken', '0002_auto_20160226_1747', '2024-12-05 07:15:36.588973'),
(21, 'authtoken', '0003_tokenproxy', '2024-12-05 07:15:36.590968'),
(22, 'authtoken', '0004_alter_tokenproxy_options', '2024-12-05 07:15:36.592973'),
(23, 'sessions', '0001_initial', '2024-12-05 07:15:36.626667'),
(24, 'course_app', '0002_alter_course_image', '2024-12-05 08:14:24.179939'),
(25, 'course_app', '0003_alter_course_image', '2024-12-06 05:30:40.940205'),
(26, 'course_app', '0004_remove_course_course_description_and_more', '2024-12-09 05:37:19.914940'),
(27, 'course_app', '0005_semester', '2024-12-09 05:42:25.411193'),
(28, 'course_app', '0006_subject', '2024-12-09 05:52:00.559440'),
(29, 'course_app', '0007_subject_course', '2024-12-09 08:49:17.941862'),
(30, 'course_app', '0008_rename_course_semester_course', '2024-12-09 09:23:07.775966'),
(31, 'course_app', '0002_remove_course_description_remove_course_image_and_more', '2024-12-30 08:20:05.872292'),
(32, 'course_app', '0003_course_published_at', '2024-12-30 08:20:05.879194'),
(33, 'course_app', '0004_course_description_course_image_course_university', '2024-12-30 08:20:05.879194'),
(34, 'course_app', '0005_remove_semester_course_remove_review_course_and_more', '2024-12-30 08:50:06.311333'),
(35, 'course_app', '0006_course_review_semester_subject_userreg', '2024-12-30 08:51:12.640782'),
(36, 'course_app', '0007_rename_content_subject_module_subject_description_and_more', '2024-12-31 05:55:12.824283'),
(37, 'course_app', '0008_subject_summary', '2024-12-31 06:53:49.999598'),
(38, 'course_app', '0009_rename_module_subject_content', '2024-12-31 09:23:47.521920'),
(39, 'course_app', '0010_remove_subject_content_remove_subject_summary_module', '2025-01-07 05:49:46.622959'),
(40, 'course_app', '0011_remove_module_summary', '2025-01-09 09:50:42.412535'),
(41, 'course_app', '0012_alter_module_description', '2025-01-09 10:06:41.171568'),
(42, 'course_app', '0013_alter_course_description_alter_module_description_and_more', '2025-01-09 10:08:45.683601'),
(43, 'course_app', '0014_remove_module_description', '2025-01-09 10:21:12.072391'),
(44, 'course_app', '0015_alter_semester_id', '2025-01-09 10:43:15.431532'),
(45, 'course_app', '0016_alter_subject_course', '2025-01-10 08:32:56.323306'),
(46, 'course_app', '0017_alter_module_subject_alter_subject_course', '2025-01-10 09:05:24.215208');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('irww1gor58osx0rqms1q50zph9jp4sf6', '.eJxVjEEOgjAQRe_StWnAttPi0j1nIPNniqAGEgor492VhIVu_3vvv0zH2zp0W8lLN6q5mLM5_W5geeRpB3rn6TZbmad1GWF3xR602HbW_Lwe7t_BwGX41oKGIZBetHKRXGoygkQSRhTpPXGjBB9ADiqkKdU9oQpwtfcQb94fLdI5Tw:1tV2jp:Eazmxaz7bVa6B7pXlcDKzzFm1_AOjShu7WibGqO4ztc', '2025-01-21 06:06:49.089682'),
('it72b31ltdmpeercom6ybnfzcown4yg4', '.eJxVjEEOgjAQRe_StWnAttPi0j1nIPNniqAGEgor492VhIVu_3vvv0zH2zp0W8lLN6q5mLM5_W5geeRpB3rn6TZbmad1GWF3xR602HbW_Lwe7t_BwGX41oKGIZBetHKRXGoygkQSRhTpPXGjBB9ADiqkKdU9oQpwtfcQb94fLdI5Tw:1tV3Yl:6miT1WxVgjK3uSAV35yLPyzVmydJ09v1VaX8sLO14UM', '2025-01-21 06:59:27.529189'),
('e46e7rfhgatzysxd1nccxgpix9sgyjjb', '.eJxVjEEOgjAQRe_StWnAttPi0j1nIPNniqAGEgor492VhIVu_3vvv0zH2zp0W8lLN6q5mLM5_W5geeRpB3rn6TZbmad1GWF3xR602HbW_Lwe7t_BwGX41oKGIZBetHKRXGoygkQSRhTpPXGjBB9ADiqkKdU9oQpwtfcQb94fLdI5Tw:1tV3gG:HOMJdRNaDGsf8hS-COIxnH4o7iNPo3H2xo-HFd5Vsts', '2025-01-21 07:07:12.987027');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
