-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 09, 2022 at 12:58 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quicklancer`
--
-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>admins`
--

DROP TABLE IF EXISTS `<<prefix>>admins`;
CREATE TABLE IF NOT EXISTS `<<prefix>>admins` (
    `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `username` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `password_hash` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_user.png',
    `permission` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>adsense`
--

DROP TABLE IF EXISTS `<<prefix>>adsense`;
CREATE TABLE IF NOT EXISTS `<<prefix>>adsense` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `slug` text DEFAULT NULL,
    `size` text DEFAULT NULL,
    `provider_name` varchar(255) DEFAULT NULL,
    `large_track_code` text DEFAULT NULL,
    `tablet_track_code` text DEFAULT NULL,
    `phone_track_code` text DEFAULT NULL,
    `status` enum('0','1') NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>balance`
--

DROP TABLE IF EXISTS `<<prefix>>balance`;
CREATE TABLE IF NOT EXISTS `<<prefix>>balance` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `current_balance` double(9,2) DEFAULT NULL,
    `total_earning` double(9,2) DEFAULT NULL,
    `total_withdrawal` double(9,2) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>bids`
--

DROP TABLE IF EXISTS `<<prefix>>bids`;
CREATE TABLE IF NOT EXISTS `<<prefix>>bids` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `user_id` int(10) DEFAULT NULL,
    `project_id` int(10) DEFAULT NULL,
    `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `amount` int(11) DEFAULT 0,
    `days` smallint(2) DEFAULT 0,
    `created_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>blog`
--

DROP TABLE IF EXISTS `<<prefix>>blog`;
CREATE TABLE IF NOT EXISTS `<<prefix>>blog` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `author` int(10) DEFAULT NULL,
    `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `status` enum('publish','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `<<prefix>>blog_categories`
--

DROP TABLE IF EXISTS `<<prefix>>blog_categories`;
CREATE TABLE IF NOT EXISTS `<<prefix>>blog_categories` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `slug` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `position` int(10) NOT NULL DEFAULT 0,
    `active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>blog_cat_relation`
--

DROP TABLE IF EXISTS `<<prefix>>blog_cat_relation`;
CREATE TABLE IF NOT EXISTS `<<prefix>>blog_cat_relation` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `blog_id` int(10) DEFAULT NULL,
    `category_id` int(10) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>blog_comment`
--

DROP TABLE IF EXISTS `<<prefix>>blog_comment`;
CREATE TABLE IF NOT EXISTS `<<prefix>>blog_comment` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `blog_id` int(10) DEFAULT NULL,
    `user_id` int(10) DEFAULT NULL,
    `is_admin` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
    `name` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` datetime DEFAULT NULL,
    `active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
    `parent` int(10) NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>catagory_main`
--

DROP TABLE IF EXISTS `<<prefix>>catagory_main`;
CREATE TABLE IF NOT EXISTS `<<prefix>>catagory_main` (
    `cat_id` int(11) NOT NULL AUTO_INCREMENT,
    `cat_order` int(10) DEFAULT NULL,
    `post_type` VARCHAR(16) NOT NULL DEFAULT 'default',
    `cat_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `slug` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `icon` varchar(300) NOT NULL DEFAULT 'fa-usd',
    `picture` varchar(300) DEFAULT NULL,
    PRIMARY KEY (`cat_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>catagory_sub`
--

DROP TABLE IF EXISTS `<<prefix>>catagory_sub`;
CREATE TABLE IF NOT EXISTS `<<prefix>>catagory_sub` (
    `sub_cat_id` int(11) NOT NULL AUTO_INCREMENT,
    `main_cat_id` int(11) DEFAULT NULL,
    `post_type` VARCHAR(16) NOT NULL DEFAULT 'default',
    `sub_cat_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `slug` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `cat_order` mediumint(8) DEFAULT NULL,
    `photo_show` enum('0','1') NOT NULL DEFAULT '1',
    `price_show` enum('0','1') NOT NULL DEFAULT '1',
    `picture` text DEFAULT NULL,
    PRIMARY KEY (`sub_cat_id`),
    UNIQUE KEY `id` (`sub_cat_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>category_translation`
--

DROP TABLE IF EXISTS `<<prefix>>category_translation`;
CREATE TABLE IF NOT EXISTS `<<prefix>>category_translation` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `translation_id` int(1) DEFAULT NULL,
    `lang_code` varchar(10) DEFAULT NULL,
    `category_type` varchar(22) DEFAULT NULL,
    `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `slug` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>cities`
--

DROP TABLE IF EXISTS `<<prefix>>cities`;
CREATE TABLE IF NOT EXISTS `<<prefix>>cities` (
    `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `country_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISO-3166 2-letter country code, 2 characters',
    `name` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'name of geographical point (utf8) varchar(200)',
    `asciiname` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'name of geographical point in plain ascii characters, varchar(200)',
    `latitude` float DEFAULT NULL COMMENT 'longitude in decimal degrees (wgs84)',
    `longitude` float DEFAULT NULL COMMENT 'latitude in decimal degrees (wgs84)',
    `feature_class` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'see http://www.geonames.org/export/codes.html, char(1)',
    `feature_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'see http://www.geonames.org/export/codes.html, varchar(10)',
    `subadmin1_code` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'fipscode (subject to change to iso code), see exceptions below, see file admin1Codes.txt for display names of this code; varchar(20)',
    `subadmin2_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'code for the second administrative division, a county in the US, see file admin2Codes.txt; varchar(80)',
    `population` bigint(20) DEFAULT NULL COMMENT 'bigint (4 byte int) ',
    `time_zone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'the timezone id (see file timeZone.txt)',
    `active` tinyint(3) UNSIGNED DEFAULT 1,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
    PRIMARY KEY (`id`),
    KEY `country_code` (`country_code`),
    KEY `name` (`name`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>companies`
--

DROP TABLE IF EXISTS `<<prefix>>companies`;
CREATE TABLE IF NOT EXISTS `<<prefix>>companies` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `user_id` int(10) NOT NULL,
    `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `reg_no` varchar(50) DEFAULT NULL,
    `location` text DEFAULT NULL,
    `city` char(50) DEFAULT NULL,
    `state` char(50) DEFAULT NULL,
    `country` char(50) DEFAULT NULL,
    `latlong` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `phone` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `fax` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `linkedin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `pinterest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `youtube` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `status` enum('0','1') NOT NULL DEFAULT '1',
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>countries`
--

DROP TABLE IF EXISTS `<<prefix>>countries`;
CREATE TABLE IF NOT EXISTS `<<prefix>>countries` (
    `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `code` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `latitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `longitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `iso3` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `iso_numeric` int(10) UNSIGNED DEFAULT NULL,
    `fips` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `asciiname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `capital` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `area` int(10) UNSIGNED DEFAULT NULL,
    `population` int(10) UNSIGNED DEFAULT NULL,
    `continent_code` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `tld` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `postal_code_format` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `postal_code_regex` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `languages` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `neighbours` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `equivalent_fips_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `active` tinyint(1) DEFAULT 1,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
    PRIMARY KEY (`id`),
    UNIQUE KEY `code` (`code`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>currencies`
--

DROP TABLE IF EXISTS `<<prefix>>currencies`;
CREATE TABLE IF NOT EXISTS `<<prefix>>currencies` (
    `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `code` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `html_entity` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'From Github : An array of currency symbols as HTML entities',
    `font_arial` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `font_code2000` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `unicode_decimal` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `unicode_hex` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `in_left` tinyint(1) DEFAULT 0,
    `decimal_places` int(10) UNSIGNED DEFAULT 2 COMMENT 'Currency Decimal Places - ISO 4217',
    `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '.',
    `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT ',',
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
    PRIMARY KEY (`id`),
    UNIQUE KEY `code` (`code`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>custom_data`
--

DROP TABLE IF EXISTS `<<prefix>>custom_data`;
CREATE TABLE IF NOT EXISTS `<<prefix>>custom_data` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `post_type` VARCHAR(16) NOT NULL DEFAULT 'default',
    `product_id` int(11) DEFAULT NULL,
    `field_id` int(11) DEFAULT NULL,
    `field_type` varchar(20) DEFAULT NULL,
    `field_data` text DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>custom_fields`
--

DROP TABLE IF EXISTS `<<prefix>>custom_fields`;
CREATE TABLE IF NOT EXISTS `<<prefix>>custom_fields` (
    `custom_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `custom_order` int(10) DEFAULT NULL,
    `post_type` VARCHAR(16) NOT NULL DEFAULT 'default',
    `translation_lang` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `translation_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `custom_anycat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `custom_catid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `custom_subcatid` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `custom_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `custom_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `custom_options` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `custom_required` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
    `custom_name` varchar(40) CHARACTER SET utf8mb4 DEFAULT NULL,
    `custom_default` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `custom_min` int(11) UNSIGNED NOT NULL DEFAULT 0,
    `custom_max` int(11) UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`custom_id`),
    KEY `custom_order` (`custom_order`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>custom_options`
--

DROP TABLE IF EXISTS `<<prefix>>custom_options`;
CREATE TABLE IF NOT EXISTS `<<prefix>>custom_options` (
    `option_id` int(11) NOT NULL AUTO_INCREMENT,
    `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`option_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `<<prefix>>emailq`
--

DROP TABLE IF EXISTS `<<prefix>>emailq`;
CREATE TABLE IF NOT EXISTS `<<prefix>>emailq` (
    `q_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `toname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `body` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`q_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Table structure for table `<<prefix>>experiences`
--

DROP TABLE IF EXISTS `<<prefix>>experiences`;
CREATE TABLE IF NOT EXISTS `<<prefix>>experiences` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `user_id` int(10) DEFAULT NULL,
    `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `company` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `description` text DEFAULT NULL,
    `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `start_date` date DEFAULT NULL,
    `end_date` date DEFAULT NULL,
    `currently_working` enum('0','1') NOT NULL DEFAULT '1',
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>faq_entries`
--

DROP TABLE IF EXISTS `<<prefix>>faq_entries`;
CREATE TABLE IF NOT EXISTS `<<prefix>>faq_entries` (
    `faq_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
    `translation_lang` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `translation_of` int(10) UNSIGNED DEFAULT NULL,
    `parent_id` int(10) UNSIGNED DEFAULT NULL,
    `faq_pid` smallint(4) NOT NULL DEFAULT 0,
    `faq_weight` mediumint(6) NOT NULL DEFAULT 0,
    `faq_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `faq_content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `active` tinyint(1) DEFAULT 1,
    PRIMARY KEY (`faq_id`),
    KEY `translation_lang` (`translation_lang`,`translation_of`,`parent_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>favads`
--

DROP TABLE IF EXISTS `<<prefix>>favads`;
CREATE TABLE IF NOT EXISTS `<<prefix>>favads` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `user_id` int(11) DEFAULT NULL,
    `product_id` int(11) DEFAULT NULL,
    `post_type` VARCHAR(16) NOT NULL DEFAULT 'default',
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>fav_users`
--

DROP TABLE IF EXISTS `<<prefix>>fav_users`;
CREATE TABLE IF NOT EXISTS `<<prefix>>fav_users` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `user_id` int(10) NOT NULL,
    `fav_user_id` int(10) NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>firebase_device_token`
--

DROP TABLE IF EXISTS `<<prefix>>firebase_device_token`;
CREATE TABLE IF NOT EXISTS `<<prefix>>firebase_device_token` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `user_id` int(11) DEFAULT NULL,
    `device_id` varchar(55) DEFAULT NULL,
    `name` varchar(255) DEFAULT NULL,
    `token` text DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `<<prefix>>languages`
--

DROP TABLE IF EXISTS `<<prefix>>languages`;
CREATE TABLE IF NOT EXISTS `<<prefix>>languages` (
    `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `direction` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `file_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `active` tinyint(1) NOT NULL DEFAULT 1,
    `default` tinyint(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>login_attempts`
--

DROP TABLE IF EXISTS `<<prefix>>login_attempts`;
CREATE TABLE IF NOT EXISTS `<<prefix>>login_attempts` (
    `user_id` int(11) DEFAULT NULL,
    `time` varchar(30) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>logs`
--

DROP TABLE IF EXISTS `<<prefix>>logs`;
CREATE TABLE IF NOT EXISTS `<<prefix>>logs` (
    `log_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `log_date` int(11) UNSIGNED NOT NULL DEFAULT 0,
    `log_summary` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `log_details` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`log_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>messages`
--

DROP TABLE IF EXISTS `<<prefix>>messages`;
CREATE TABLE IF NOT EXISTS `<<prefix>>messages` (
    `message_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `from_id` varchar(40) DEFAULT NULL,
    `to_id` varchar(50) DEFAULT NULL,
    `message_content` text CHARACTER SET utf8mb4 DEFAULT NULL,
    `message_date` datetime DEFAULT NULL,
    `recd` tinyint(1) NOT NULL DEFAULT 0,
    `seen` enum('0','1') NOT NULL DEFAULT '0',
    `message_type` varchar(255) DEFAULT NULL,
    `post_id` int(11) DEFAULT NULL,
    `post_type` varchar(15) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'project',
    PRIMARY KEY (`message_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `<<prefix>>mobile_numbers`
--
DROP TABLE IF EXISTS `<<prefix>>mobile_numbers`;
CREATE TABLE IF NOT EXISTS `<<prefix>>mobile_numbers` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `user_id` int(11) DEFAULT NULL,
    `mobile_number` varchar(20) DEFAULT NULL,
    `verification_code` varchar(20) NOT NULL,
    `verified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=Verified, 0=Not verified',
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_id` (`user_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `<<prefix>>milestone`
--

DROP TABLE IF EXISTS `<<prefix>>milestone`;
CREATE TABLE IF NOT EXISTS `<<prefix>>milestone` (
    `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `created_by` enum('employer','freelancer') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `status` enum('request','funded','paid') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `request` enum('0','1','2') COLLATE utf8mb4_unicode_ci DEFAULT '0',
    `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
    `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `project_id` int(11) UNSIGNED DEFAULT NULL,
    `project_type` int(1) DEFAULT NULL,
    `employer_id` int(11) UNSIGNED DEFAULT NULL,
    `freelancer_id` int(11) UNSIGNED DEFAULT NULL,
    `start_date` datetime DEFAULT NULL,
    `end_date` datetime DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>notification`
--

DROP TABLE IF EXISTS `<<prefix>>notification`;
CREATE TABLE IF NOT EXISTS `<<prefix>>notification` (
    `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
    `cat_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
    `user_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    KEY `cat_id` (`cat_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>options`
--

DROP TABLE IF EXISTS `<<prefix>>options`;
CREATE TABLE IF NOT EXISTS `<<prefix>>options` (
    `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `option_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `option_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`option_id`),
    UNIQUE KEY `option_name` (`option_name`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>orders`
--

DROP TABLE IF EXISTS `<<prefix>>orders`;
CREATE TABLE `<<prefix>>orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('progress','completed','cancelled') NOT NULL DEFAULT 'progress',
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `plan_id` varchar(55) DEFAULT NULL,
  `amount` double(9,2) DEFAULT NULL,
  `purchase_code` varchar(16) DEFAULT NULL,
  `cancel_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>pages`
--

DROP TABLE IF EXISTS `<<prefix>>pages`;
CREATE TABLE IF NOT EXISTS `<<prefix>>pages` (
    `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `translation_lang` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `translation_of` int(10) UNSIGNED DEFAULT NULL,
    `parent_id` int(10) UNSIGNED DEFAULT NULL,
    `type` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
    `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `active` tinyint(1) DEFAULT 1,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `translation_lang` (`translation_lang`),
    KEY `translation_of` (`translation_of`),
    KEY `parent_id` (`parent_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>payments`
--

DROP TABLE IF EXISTS `<<prefix>>payments`;
CREATE TABLE IF NOT EXISTS `<<prefix>>payments` (
    `payment_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
    `payment_install` enum('0','1') NOT NULL DEFAULT '0',
    `payment_title` varchar(255) DEFAULT NULL,
    `payment_folder` varchar(30) DEFAULT NULL,
    `payment_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`payment_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>plans`
--

DROP TABLE IF EXISTS `<<prefix>>plans`;
CREATE TABLE IF NOT EXISTS `<<prefix>>plans` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    `badge` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `monthly_price` float DEFAULT NULL,
    `annual_price` float DEFAULT NULL,
    `lifetime_price` float DEFAULT NULL,
    `recommended` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
    `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
    `taxes_ids` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `status` tinyint(4) NOT NULL,
    `date` datetime NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>plan_options`
--

DROP TABLE IF EXISTS `<<prefix>>plan_options`;
CREATE TABLE IF NOT EXISTS `<<prefix>>plan_options` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `translation_lang` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `translation_name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `position` int(10) DEFAULT NULL,
    `active` tinyint(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Table structure for table `<<prefix>>post`
--

DROP TABLE IF EXISTS `<<prefix>>post`;
CREATE TABLE `<<prefix>>post` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`user_id` int(11) DEFAULT NULL,
`post_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`slug` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`category` int(11) DEFAULT NULL,
`sub_category` int(11) DEFAULT NULL,
`price` double(9,2) DEFAULT NULL,
`tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` datetime NOT NULL DEFAULT current_timestamp(),
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `<<prefix>>post_options`
--

DROP TABLE IF EXISTS `<<prefix>>post_options`;
CREATE TABLE `<<prefix>>post_options` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`post_id` int(11) DEFAULT NULL,
`option_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`option_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `<<prefix>>product`
--

DROP TABLE IF EXISTS `<<prefix>>product`;
CREATE TABLE IF NOT EXISTS `<<prefix>>product` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `status` enum('pending','active','rejected','expire') NOT NULL DEFAULT 'pending',
    `company_id` int(10) NOT NULL,
    `user_id` int(20) DEFAULT NULL,
    `featured` enum('0','1') NOT NULL DEFAULT '0',
    `urgent` enum('0','1') NOT NULL DEFAULT '0',
    `highlight` enum('0','1') NOT NULL DEFAULT '0',
    `product_type` int(10) DEFAULT NULL,
    `product_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `slug` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `description` text CHARACTER SET utf8mb4 DEFAULT NULL,
    `category` int(11) DEFAULT NULL,
    `sub_category` int(11) DEFAULT NULL,
    `salary_min` bigint(20) NOT NULL DEFAULT 0,
    `salary_max` bigint(20) NOT NULL DEFAULT 0,
    `salary_type` int(10) DEFAULT NULL,
    `negotiable` enum('0','1') NOT NULL DEFAULT '0',
    `phone` varchar(50) DEFAULT NULL,
    `hide_phone` enum('0','1') DEFAULT NULL,
    `application_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `location` text DEFAULT NULL,
    `city` char(50) DEFAULT NULL,
    `state` char(50) DEFAULT NULL,
    `country` char(50) DEFAULT NULL,
    `latlong` varchar(255) DEFAULT NULL,
    `screen_shot` text DEFAULT NULL,
    `tag` varchar(225) CHARACTER SET utf8mb4 DEFAULT NULL,
    `view` int(11) NOT NULL DEFAULT 1,
    `custom_fields` longtext DEFAULT NULL,
    `custom_types` longtext DEFAULT NULL,
    `custom_values` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    `expire_date` int(12) NOT NULL DEFAULT 0,
    `featured_exp_date` int(11) DEFAULT NULL,
    `urgent_exp_date` int(11) DEFAULT NULL,
    `highlight_exp_date` int(11) DEFAULT NULL,
    `contact_phone` enum('0','1') NOT NULL DEFAULT '0',
    `contact_email` enum('0','1') NOT NULL DEFAULT '0',
    `contact_chat` enum('0','1') NOT NULL DEFAULT '0',
    `admin_seen` enum('0','1') NOT NULL DEFAULT '0',
    `emailed` enum('0','1') NOT NULL DEFAULT '0',
    `hide` enum('0','1') NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `id` (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>product_resubmit`
--

DROP TABLE IF EXISTS `<<prefix>>product_resubmit`;
CREATE TABLE IF NOT EXISTS `<<prefix>>product_resubmit` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `product_id` int(11) DEFAULT NULL,
    `company_id` int(10) NOT NULL,
    `user_id` int(20) DEFAULT NULL,
    `featured` enum('0','1') NOT NULL DEFAULT '0',
    `urgent` enum('0','1') NOT NULL DEFAULT '0',
    `highlight` enum('0','1') NOT NULL DEFAULT '0',
    `product_type` int(10) DEFAULT NULL,
    `product_name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
    `description` text CHARACTER SET utf8mb4 DEFAULT NULL,
    `category` int(11) DEFAULT NULL,
    `sub_category` int(11) DEFAULT NULL,
    `salary_min` bigint(20) DEFAULT 0,
    `salary_max` bigint(20) NOT NULL DEFAULT 0,
    `salary_type` int(10) DEFAULT NULL,
    `negotiable` enum('0','1') NOT NULL DEFAULT '0',
    `phone` varchar(50) DEFAULT NULL,
    `hide_phone` enum('0','1') DEFAULT NULL,
    `application_url` varchar(255) DEFAULT NULL,
    `location` text DEFAULT NULL,
    `city` char(50) DEFAULT NULL,
    `state` char(50) DEFAULT NULL,
    `country` char(50) DEFAULT NULL,
    `latlong` varchar(255) DEFAULT NULL,
    `screen_shot` text DEFAULT NULL,
    `tag` varchar(225) CHARACTER SET utf8mb4 DEFAULT NULL,
    `status` enum('pending','active','rejected','softreject') NOT NULL DEFAULT 'pending',
    `view` int(11) NOT NULL DEFAULT 1,
    `custom_fields` longtext DEFAULT NULL,
    `custom_types` longtext DEFAULT NULL,
    `custom_values` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    `featured_exp_date` int(11) DEFAULT NULL,
    `urgent_exp_date` int(11) DEFAULT NULL,
    `highlight_exp_date` int(11) DEFAULT NULL,
    `contact_phone` enum('0','1') NOT NULL DEFAULT '0',
    `contact_email` enum('0','1') NOT NULL DEFAULT '0',
    `contact_chat` enum('0','1') NOT NULL DEFAULT '0',
    `comments` text DEFAULT NULL,
    `admin_seen` enum('0','1') NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    UNIQUE KEY `product_id` (`product_id`),
    KEY `id` (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>product_type`
--

DROP TABLE IF EXISTS `<<prefix>>product_type`;
CREATE TABLE IF NOT EXISTS `<<prefix>>product_type` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `title` varchar(100) NOT NULL,
    `translation_lang` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `translation_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `position` int(10) DEFAULT NULL,
    `active` enum('0','1') NOT NULL DEFAULT '1',
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>project`
--

DROP TABLE IF EXISTS `<<prefix>>project`;
CREATE TABLE IF NOT EXISTS `<<prefix>>project` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `status` enum('open','pending_for_approval','under_development','completed','final_review_pending','closed','incomplete') NOT NULL DEFAULT 'open',
    `user_id` int(20) DEFAULT NULL,
    `freelancer_id` int(11) DEFAULT NULL,
    `featured` enum('0','1') NOT NULL DEFAULT '0',
    `urgent` enum('0','1') NOT NULL DEFAULT '0',
    `highlight` enum('0','1') NOT NULL DEFAULT '0',
    `product_type` int(10) DEFAULT NULL,
    `product_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `slug` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `description` text CHARACTER SET utf8mb4 DEFAULT NULL,
    `category` int(11) DEFAULT NULL,
    `sub_category` varchar(200) DEFAULT NULL,
    `salary_min` bigint(20) NOT NULL DEFAULT 0,
    `salary_max` bigint(20) NOT NULL DEFAULT 0,
    `salary_type` int(10) DEFAULT NULL,
    `tag` varchar(225) CHARACTER SET utf8mb4 DEFAULT NULL,
    `view` int(11) NOT NULL DEFAULT 1,
    `custom_fields` longtext DEFAULT NULL,
    `custom_types` longtext DEFAULT NULL,
    `custom_values` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    `expire_date` int(12) NOT NULL DEFAULT 0,
    `featured_exp_date` int(11) DEFAULT NULL,
    `urgent_exp_date` int(11) DEFAULT NULL,
    `highlight_exp_date` int(11) DEFAULT NULL,
    `emailed` enum('0','1') NOT NULL DEFAULT '0',
    `checkstamp` varchar(255) DEFAULT NULL,
    `on_budget` enum('yes','no') DEFAULT NULL,
    `on_time` enum('yes','no') DEFAULT NULL,
    `recommendation` enum('yes','no') DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `id` (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>push_notification`
--

DROP TABLE IF EXISTS `<<prefix>>push_notification`;
CREATE TABLE IF NOT EXISTS `<<prefix>>push_notification` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `sender_id` int(11) DEFAULT NULL,
    `sender_name` varchar(255) DEFAULT NULL,
    `owner_id` int(11) DEFAULT NULL,
    `owner_name` varchar(255) DEFAULT NULL,
    `product_id` int(11) DEFAULT NULL,
    `product_title` varchar(255) DEFAULT NULL,
    `type` varchar(255) DEFAULT NULL,
    `message` varchar(255) DEFAULT NULL,
    `recd` tinyint(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>resumes`
--

DROP TABLE IF EXISTS `<<prefix>>resumes`;
CREATE TABLE IF NOT EXISTS `<<prefix>>resumes` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `user_id` bigint(20) NOT NULL,
    `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `active` enum('0','1') NOT NULL DEFAULT '1',
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>reviews`
--

DROP TABLE IF EXISTS `<<prefix>>reviews`;
CREATE TABLE IF NOT EXISTS `<<prefix>>reviews` (
    `id` int(21) NOT NULL AUTO_INCREMENT,
    `post_type` VARCHAR(16) NOT NULL DEFAULT 'default',
    `order_id` int(11) DEFAULT NULL,
    `project_id` varchar(255) DEFAULT NULL,
    `employer_id` int(11) DEFAULT NULL,
    `freelancer_id` int(11) DEFAULT NULL,
    `rated_by` enum('employer','user') DEFAULT NULL,
    `rating` double DEFAULT NULL,
    `comments` mediumtext CHARACTER SET utf8mb4 DEFAULT NULL,
    `created_at` datetime DEFAULT current_timestamp(),
    `publish` int(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>salary_type`
--

DROP TABLE IF EXISTS `<<prefix>>salary_type`;
CREATE TABLE IF NOT EXISTS `<<prefix>>salary_type` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `translation_lang` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `translation_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `position` int(10) DEFAULT NULL,
    `active` enum('0','1') NOT NULL DEFAULT '1',
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>subadmin1`
--

DROP TABLE IF EXISTS `<<prefix>>subadmin1`;
CREATE TABLE IF NOT EXISTS `<<prefix>>subadmin1` (
    `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `country_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `asciiname` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `active` tinyint(1) UNSIGNED DEFAULT 1,
    PRIMARY KEY (`id`),
    UNIQUE KEY `code` (`code`),
    KEY `country_code` (`country_code`),
    KEY `name` (`name`),
    KEY `active` (`active`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>subadmin2`
--

DROP TABLE IF EXISTS `<<prefix>>subadmin2`;
CREATE TABLE IF NOT EXISTS `<<prefix>>subadmin2` (
    `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `country_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `subadmin1_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `asciiname` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `active` tinyint(1) UNSIGNED DEFAULT 1,
    PRIMARY KEY (`id`),
    UNIQUE KEY `code` (`code`),
    KEY `country_code` (`country_code`),
    KEY `subadmin1_code` (`subadmin1_code`),
    KEY `name` (`name`),
    KEY `active` (`active`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>subscriptions`
--

DROP TABLE IF EXISTS `<<prefix>>subscriptions`;
CREATE TABLE IF NOT EXISTS `<<prefix>>subscriptions` (
    `sub_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `sub_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `sub_term` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'MONTHLY',
    `sub_amount` double(8,2) NOT NULL DEFAULT 0.00,
    `sub_image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `group_id` smallint(10) DEFAULT NULL,
    `pay_mode` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `active` tinyint(1) NOT NULL DEFAULT 1,
    `recommended` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
    `discount_badge` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`sub_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>taxes`
--

DROP TABLE IF EXISTS `<<prefix>>taxes`;
CREATE TABLE IF NOT EXISTS `<<prefix>>taxes` (
    `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `internal_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `description` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `value` decimal(10,2) DEFAULT NULL,
    `value_type` enum('percentage','fixed') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `type` enum('inclusive','exclusive') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `billing_type` enum('personal','business','both') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `countries` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `datetime` datetime DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `<<prefix>>testimonials`
--

DROP TABLE IF EXISTS `<<prefix>>testimonials`;
CREATE TABLE IF NOT EXISTS `<<prefix>>testimonials` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `designation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
    `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>time_zones`
--

DROP TABLE IF EXISTS `<<prefix>>time_zones`;
CREATE TABLE IF NOT EXISTS `<<prefix>>time_zones` (
    `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `country_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `time_zone_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT '',
    `gmt` float DEFAULT NULL,
    `dst` float DEFAULT NULL,
    `raw` float DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `time_zone_id` (`time_zone_id`),
    KEY `country_code` (`country_code`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>transaction`
--

DROP TABLE IF EXISTS `<<prefix>>transaction`;
CREATE TABLE IF NOT EXISTS `<<prefix>>transaction` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `status` enum('pending','success','failed','cancel') DEFAULT NULL,
    `product_name` varchar(225) DEFAULT NULL,
    `product_id` int(11) DEFAULT NULL,
    `user_id` int(11) DEFAULT NULL,
    `amount` double(9,2) DEFAULT NULL,
    `base_amount` double(9,2) DEFAULT NULL,
    `currency_code` varchar(3) DEFAULT NULL,
    `featured` enum('0','1') DEFAULT '0',
    `urgent` enum('0','1') DEFAULT '0',
    `highlight` enum('0','1') DEFAULT '0',
    `transaction_time` int(11) DEFAULT NULL,
    `payment_id` varchar(64) DEFAULT NULL,
    `transaction_gatway` varchar(255) DEFAULT NULL,
    `transaction_ip` varchar(15) DEFAULT NULL,
    `transaction_description` varchar(255) DEFAULT NULL,
    `transaction_method` varchar(20) DEFAULT NULL,
    `frequency` enum('MONTHLY','YEARLY','LIFETIME') DEFAULT NULL,
    `billing` text DEFAULT NULL,
    `taxes_ids` text DEFAULT NULL,
    `details` text DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `id` (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>upgrades`
--

DROP TABLE IF EXISTS `<<prefix>>upgrades`;
CREATE TABLE IF NOT EXISTS `<<prefix>>upgrades` (
    `upgrade_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `sub_id` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
    `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
    `pay_mode` enum('one_time','recurring') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'one_time',
    `upgrade_lasttime` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
    `upgrade_expires` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
    `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `invoice_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `paypal_subscription_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `paypal_profile_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `stripe_customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `stripe_subscription_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `authorizenet_subscription_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `billing_day` int(2) DEFAULT NULL,
    `length` int(4) DEFAULT NULL,
    `interval` int(4) DEFAULT NULL,
    `trial_days` int(4) DEFAULT NULL,
    `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `featured_duration` smallint(10) DEFAULT NULL,
    `urgent_duration` smallint(10) DEFAULT NULL,
    `highlight_duration` smallint(10) DEFAULT NULL,
    `date_trial_ends` date DEFAULT NULL,
    `date_canceled` datetime DEFAULT NULL,
    `date_created` timestamp NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`upgrade_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `<<prefix>>user`
--

DROP TABLE IF EXISTS `<<prefix>>user`;
CREATE TABLE IF NOT EXISTS `<<prefix>>user` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `group_id` varchar(16) NOT NULL DEFAULT 'free',
    `username` varchar(255) DEFAULT NULL,
    `user_type` enum('user','employer') DEFAULT NULL,
    `balance` float(10,2) NOT NULL DEFAULT 0.00,
    `password_hash` varchar(255) DEFAULT NULL,
    `forgot` varchar(255) DEFAULT NULL,
    `confirm` varchar(255) DEFAULT NULL,
    `email` varchar(255) DEFAULT NULL,
    `status` enum('0','1','2') DEFAULT NULL,
    `view` int(11) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    `name` varchar(225) DEFAULT NULL,
    `tagline` varchar(255) DEFAULT NULL,
    `description` text DEFAULT NULL,
    `dob` date DEFAULT NULL,
    `salary_min` bigint(20) NOT NULL DEFAULT 0,
    `salary_max` bigint(20) NOT NULL DEFAULT 0,
    `category` int(11) DEFAULT NULL,
    `subcategory` int(11) DEFAULT NULL,
    `website` varchar(255) DEFAULT NULL,
    `sex` enum('Male','Female','Other') DEFAULT NULL,
    `phone` varchar(255) DEFAULT NULL,
    `postcode` varchar(255) DEFAULT NULL,
    `address` varchar(255) DEFAULT NULL,
    `country` varchar(50) DEFAULT NULL,
    `city` varchar(225) DEFAULT NULL,
    `city_code` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `state_code` char(50) DEFAULT NULL,
    `country_code` char(50) DEFAULT NULL,
    `image` varchar(225) NOT NULL DEFAULT 'default_user.png',
    `lastactive` datetime DEFAULT NULL,
    `facebook` varchar(255) DEFAULT NULL,
    `twitter` varchar(255) DEFAULT NULL,
    `googleplus` varchar(255) DEFAULT NULL,
    `instagram` varchar(255) DEFAULT NULL,
    `linkedin` varchar(255) DEFAULT NULL,
    `youtube` varchar(255) DEFAULT NULL,
    `oauth_provider` enum('','facebook','google','twitter') DEFAULT NULL,
    `oauth_uid` varchar(100) DEFAULT NULL,
    `oauth_link` varchar(255) DEFAULT NULL,
    `online` enum('0','1') NOT NULL DEFAULT '0',
    `notify` enum('0','1') DEFAULT '0',
    `notify_cat` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>usergroups`
--

DROP TABLE IF EXISTS `<<prefix>>usergroups`;
CREATE TABLE IF NOT EXISTS `<<prefix>>usergroups` (
    `group_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `group_removable` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
    `group_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `ad_limit` int(11) DEFAULT NULL,
    `ad_duration` smallint(10) DEFAULT NULL,
    `urgent_project_fee` double(8,2) NOT NULL DEFAULT 0.00,
    `featured_project_fee` double(8,2) NOT NULL DEFAULT 0.00,
    `highlight_project_fee` double(8,2) NOT NULL DEFAULT 0.00,
    `featured_duration` smallint(10) DEFAULT NULL,
    `urgent_duration` smallint(10) DEFAULT NULL,
    `highlight_duration` smallint(10) DEFAULT NULL,
    `top_search_result` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
    `show_on_home` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
    `show_in_home_search` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
    PRIMARY KEY (`group_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>user_applied`
--

DROP TABLE IF EXISTS `<<prefix>>user_applied`;
CREATE TABLE IF NOT EXISTS `<<prefix>>user_applied` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `user_id` int(10) DEFAULT NULL,
    `job_id` int(10) DEFAULT NULL,
    `resume_id` int(10) DEFAULT NULL,
    `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>user_options`
--

DROP TABLE IF EXISTS `<<prefix>>user_options`;
CREATE TABLE IF NOT EXISTS `<<prefix>>user_options` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `user_id` int(11) DEFAULT NULL,
    `option_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `option_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `<<prefix>>withdrawal`
--

DROP TABLE IF EXISTS `<<prefix>>withdrawal`;
CREATE TABLE IF NOT EXISTS `<<prefix>>withdrawal` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `user_id` int(11) DEFAULT NULL,
    `status` enum('success','pending','reject') NOT NULL DEFAULT 'pending',
    `amount` int(11) DEFAULT NULL,
    `payment_method_id` int(11) DEFAULT NULL,
    `account_details` text DEFAULT NULL,
    `created_at` date DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
