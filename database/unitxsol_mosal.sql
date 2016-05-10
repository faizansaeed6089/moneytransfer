-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: May 10, 2016 at 12:43 AM
-- Server version: 10.0.25-MariaDB
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `unitxsol_mosal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_payment_notifications`
--

CREATE TABLE IF NOT EXISTS `admin_payment_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_date` varchar(15) NOT NULL,
  `notification_desc` text NOT NULL,
  `sub_office_admin_idFK` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `advance_salary`
--

CREATE TABLE IF NOT EXISTS `advance_salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salary_employee_idFK` int(11) NOT NULL,
  `salary_admin_idFK` int(11) NOT NULL,
  `advance_salary` double NOT NULL,
  `salary_date` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `company_logos`
--

CREATE TABLE IF NOT EXISTS `company_logos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo_image` text NOT NULL,
  `logo_company_type` int(11) NOT NULL,
  `logo_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `salary_admin`
--

CREATE TABLE IF NOT EXISTS `salary_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `user_pass` varchar(100) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_sur_name` varchar(100) NOT NULL,
  `admin_phone` varchar(15) NOT NULL,
  `admin_city_idFK` int(11) NOT NULL,
  `admin_country_idFK` int(11) NOT NULL,
  `compnay_name` varchar(100) NOT NULL,
  `admin_address` text NOT NULL,
  `super_admin_idFK` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `salary_employee`
--

CREATE TABLE IF NOT EXISTS `salary_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(20) NOT NULL,
  `employee_name` varchar(50) NOT NULL,
  `employee_sur_name` varchar(50) NOT NULL,
  `employee_tel` varchar(20) NOT NULL,
  `employee_salary` double NOT NULL,
  `employee_status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `salary_transaction`
--

CREATE TABLE IF NOT EXISTS `salary_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `advance_salary` double NOT NULL,
  `salary_admin_idFK` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `suboffice_transaction`
--

CREATE TABLE IF NOT EXISTS `suboffice_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_name` varchar(100) NOT NULL,
  `sender_sur_name` varchar(100) NOT NULL,
  `sender_file` text NOT NULL,
  `sender_phone` varchar(20) NOT NULL,
  `sender_amount` double NOT NULL,
  `sender_title` varchar(5) NOT NULL,
  `receiver_title` varchar(5) NOT NULL,
  `receiver_name` varchar(100) NOT NULL,
  `receiver_sur_name` varchar(100) NOT NULL,
  `receiver_town` varchar(100) NOT NULL,
  `receiver_phone` varchar(20) NOT NULL,
  `user_idFK` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sub_admin_pay_log`
--

CREATE TABLE IF NOT EXISTS `sub_admin_pay_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_office_admin_idFK` int(11) NOT NULL,
  `pay_date` varchar(15) NOT NULL,
  `amount` double NOT NULL,
  `super_admin_idFK` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sub_office_admin`
--

CREATE TABLE IF NOT EXISTS `sub_office_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `super_admin_idFK` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_address` text NOT NULL,
  `amount` double NOT NULL,
  `logo` text NOT NULL,
  `city_idFK` int(11) NOT NULL,
  `country_idFK` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sub_office_employee`
--

CREATE TABLE IF NOT EXISTS `sub_office_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_office_admin_idFK` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `employee_address` text NOT NULL,
  `amount` int(11) NOT NULL,
  `logo` text NOT NULL,
  `city_idFK` int(11) NOT NULL,
  `country_idFK` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sub_office_employee_pay_log`
--

CREATE TABLE IF NOT EXISTS `sub_office_employee_pay_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `super_admin_idFK` int(11) NOT NULL,
  `sub_office_admin_idFK` int(11) NOT NULL,
  `amount` double NOT NULL,
  `pay_date` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `super_admin`
--

CREATE TABLE IF NOT EXISTS `super_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tounka_app`
--

CREATE TABLE IF NOT EXISTS `tounka_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_pass` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_pass` varchar(50) NOT NULL,
  `user_type_idFK` int(11) NOT NULL,
  `user_address` text NOT NULL,
  `user_city_idFK` int(11) NOT NULL,
  `user_country_idFK` int(11) NOT NULL,
  `company_logo` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE IF NOT EXISTS `user_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
