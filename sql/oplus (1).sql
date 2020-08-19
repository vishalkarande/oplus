-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2020 at 01:06 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oplus`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('admin','superadmin') NOT NULL DEFAULT 'admin',
  `access_token` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='only for admin' ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `user_type`, `access_token`, `email`) VALUES
(1, 'admin', 'e6e061838856bf47e1de730719fb2609', 'admin', '', 'lathe.nilesh@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `ad_sliders`
--

CREATE TABLE `ad_sliders` (
  `id` int(11) NOT NULL,
  `is_show` int(1) NOT NULL,
  `image_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ad_sliders`
--

INSERT INTO `ad_sliders` (`id`, `is_show`, `image_name`) VALUES
(10, 1, '8220200819115003.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `reference` int(10) NOT NULL DEFAULT 100,
  `is_show` int(1) NOT NULL DEFAULT 1,
  `image_name` varchar(255) DEFAULT '0',
  `is_deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `parent_id`, `level`, `reference`, `is_show`, `image_name`, `is_deleted`) VALUES
(1, 'Fruits & Vegetables', 'fruits-vegetables', 0, 1, 2, 1, '5420200707043345.jpg', 0),
(2, 'Food Grains & Oil', 'food-grains-oil', 0, 1, 1, 1, '1920200707043332.jpg', 0),
(7, 'Beauty And Hygiene', 'beauty-and-hygiene', 0, 1, 3, 1, '2920200707043308.jpg', 0),
(8, 'Organic Grocery', 'organic-grocery', 2, 2, 100, 1, '0', 0),
(9, 'Cold Pressed Oil', 'cold-pressed-oil', 2, 2, 100, 1, '0', 0),
(12, 'Exotic', 'exotic', 1, 2, 100, 1, '0', 0),
(14, 'Honey', 'honey', 27, 2, 100, 1, '0', 0),
(44, 'Nachani Food', 'nachani-food', 2, 2, 100, 1, '0', 0),
(24, 'Beverages & Bakery', 'beverages-bakery', 0, 1, 4, 1, '1520200707043239.jpg', 0),
(25, 'Fruit Drink', 'fruit-drink', 24, 2, 100, 1, '0', 0),
(26, 'Biscuit', 'biscuit', 24, 2, 100, 1, '0', 0),
(27, 'Ayurvedic', 'ayurvedic', 0, 1, 7, 1, '7520200707043216.jpg', 0),
(28, 'Churn & Powders', 'churn-powders', 27, 2, 100, 1, '0', 0),
(43, 'Indegenous', 'indegenous', 1, 2, 100, 1, '0', 0),
(29, 'Jowar/Bajari Food', 'jowar-bajari-food800', 2, 2, 100, 1, '0', 0),
(30, 'Fruits', 'fruits', 1, 2, 100, 1, '0', 0),
(31, 'Tablets and Paste', 'tablets-and-paste', 27, 2, 100, 1, '0', 0),
(32, 'Cleaning & Household', 'cleaning-household', 0, 1, 5, 1, '4420200707043156.jpg', 0),
(33, 'Herbal Cleaners', 'herbal-cleaners', 32, 2, 100, 1, '0', 0),
(34, 'Herbal & Natural', 'herbal-natural', 7, 2, 100, 1, '0', 0),
(35, 'Personal Care', 'personal-care', 7, 2, 100, 1, '0', 0),
(36, 'Dairy', 'dairy', 0, 1, 5, 1, '6120200707043140.jpg', 0),
(37, 'Milk', 'milk', 36, 2, 100, 1, '0', 0),
(38, 'Ice Cream', 'ice-cream391', 36, 2, 100, 1, '0', 0),
(39, 'Diet & Nurishment', 'diet-nurishment', 0, 1, 6, 1, '9920200707043124.jpg', 0),
(40, 'Veg Diet', 'veg-diet', 39, 2, 100, 1, '0', 0),
(41, 'Non Veg Diet', 'non-veg-diet', 39, 2, 100, 1, '0', 0),
(42, 'Eggs', 'eggs', 39, 2, 100, 1, '0', 0),
(46, 'Organic Millets & Flours', 'organic-millets-flours', 2, 2, 100, 1, '0', 0),
(47, 'Organic Pulses', 'organic-pulses', 2, 2, 100, 1, '0', 0),
(48, 'Organic Salt', 'organic-salt', 2, 2, 100, 1, '0', 0),
(49, 'Breakfast', 'breakfast', 2, 2, 100, 1, '0', 0),
(50, 'Tea Coffee', 'tea-coffee', 24, 2, 100, 1, '0', 0),
(51, 'Biscuits', 'biscuits', 24, 2, 100, 1, '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `is_show` int(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `image_name`, `is_show`, `date`) VALUES
(2, 'Gokhale Herbals', '3620200712051616.png', 1, '2020-07-12 05:16:16'),
(3, 'gud2eat', '2120200712051646.png', 1, '2020-07-12 05:16:46'),
(4, 'Kmeen Agro', '9620200712051819.png', 1, '2020-07-12 05:18:19'),
(5, 'Orgayu', '7620200712051836.png', 1, '2020-07-12 05:18:36'),
(6, 'Sahyadri farms', '7020200712051859.png', 1, '2020-07-12 05:18:59'),
(7, 'Vatsalya', '2520200712051917.png', 1, '2020-07-12 05:19:17'),
(8, 'Madhupushp', '6320200712052007.png', 1, '2020-07-12 05:20:07'),
(9, 'Shri Kamdhenu', '9520200712052129.png', 1, '2020-07-12 05:21:29'),
(10, 'Swami Ayurveda', '7020200712052149.png', 1, '2020-07-12 05:21:49'),
(11, 'Turil', '3920200712052305.png', 1, '2020-07-12 05:23:05'),
(13, 'Stepup', '5120200712052329.png', 1, '2020-07-12 05:23:29'),
(14, 'Violina', '6720200712052349.png', 1, '2020-07-12 05:23:49'),
(15, 'Chakor Bakery', '2920200712052426.png', 1, '2020-07-12 05:24:26');

-- --------------------------------------------------------

--
-- Table structure for table `contact_enquiry`
--

CREATE TABLE `contact_enquiry` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `mobile_no` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('in-process','pending','delivered','cancelled') NOT NULL DEFAULT 'in-process',
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `delivery_date` varchar(255) NOT NULL DEFAULT '0',
  `is_deleted` int(1) NOT NULL DEFAULT 0,
  `is_paid` int(1) NOT NULL DEFAULT 0,
  `delivery_charge` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `address_id`, `user_id`, `status`, `date`, `delivery_date`, `is_deleted`, `is_paid`, `delivery_charge`) VALUES
(1, 0, 2, 'in-process', '2020-06-17 08:44:10', '', 0, 0, 0),
(2, 0, 3, 'in-process', '2020-06-17 13:34:02', '', 0, 0, 0),
(3, 1, 1, 'pending', '2020-07-01 18:15:41', '2020-06-18 21:19:42', 0, 1, 0),
(4, 0, 6, 'pending', '2020-08-19 11:06:13', '', 0, 1, 0),
(5, 0, 6, 'in-process', '2020-07-05 10:24:55', '', 0, 0, 0),
(6, 0, 6, 'pending', '2020-08-19 11:15:19', '', 0, 0, 0),
(7, 0, 8, 'delivered', '2020-08-16 14:36:17', '2020-08-16 14:36:17', 0, 0, 0),
(8, 0, 15, 'pending', '2020-08-19 11:13:50', '', 0, 0, 0),
(9, 0, 15, 'pending', '2020-08-19 11:23:15', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_has_products`
--

CREATE TABLE `order_has_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `discount` float NOT NULL DEFAULT 0,
  `order_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_has_products`
--

INSERT INTO `order_has_products` (`id`, `product_id`, `qty`, `price`, `discount`, `order_id`) VALUES
(1, 3, 1, 100, 0, 1),
(2, 58, 1, 50, 0, 1),
(3, 7, 2, 25, 0, 2),
(4, 4, 1, 25, 0, 3),
(5, 6, 6, 50, 0, 3),
(6, 4, 1, 25, 0, 4),
(7, 5, 1, 120, 0, 4),
(8, 69, 1, 245, 0, 4),
(9, 73, 1, 95, 0, 4),
(10, 88, 1, 20, 0, 5),
(11, 59, 1, 250, 0, 6),
(12, 127, 1, 120, 0, 7),
(13, 2, 1, 70, 0, 8),
(14, 114, 1, 170, 0, 8),
(15, 142, 1, 270, 0, 0),
(16, 2, 1, 70, 0, 0),
(17, 133, 1, 180, 0, 9);

-- --------------------------------------------------------

--
-- Table structure for table `pageandcontents`
--

CREATE TABLE `pageandcontents` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pageandcontents`
--

INSERT INTO `pageandcontents` (`id`, `name`, `text`) VALUES
(1, 'About Us', '&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;margin-bottom:0in;margin-bottom:.0001pt;\r\ntext-align:center;line-height:normal&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size: 18.5pt; font-family: Georgia, serif; color: lime; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;Oplus - Healthy choice&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size: 14.5pt; font-family: &amp;quot;Segoe UI&amp;quot;, sans-serif;&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify;line-height:normal&quot;&gt;&lt;span style=&quot;font-size: 14.5pt; font-family: &amp;quot;Segoe UI&amp;quot;, sans-serif;&quot;&gt;Health solution at the\r\nright value..&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify;line-height:normal&quot;&gt;&lt;span style=&quot;font-size: 14.5pt; font-family: &amp;quot;Segoe UI&amp;quot;, sans-serif;&quot;&gt;In this pandemic world\r\nit is most important and critical that we provide all our buyers a solution\r\nthats meets all their requirements at an affordable price&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify;line-height:normal&quot;&gt;&lt;span style=&quot;font-size: 14.5pt; font-family: &amp;quot;Segoe UI&amp;quot;, sans-serif;&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;margin-bottom:0in;margin-bottom:.0001pt;\r\ntext-align:center;line-height:normal&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:18.5pt;\r\nfont-family:&amp;quot;Georgia&amp;quot;,&amp;quot;serif&amp;quot;;mso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Segoe UI&amp;quot;;color:lime&quot;&gt;Approach &lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size: 14.5pt; font-family: &amp;quot;Segoe UI&amp;quot;, sans-serif;&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify;line-height:normal&quot;&gt;&lt;span style=&quot;font-size: 14.5pt; font-family: &amp;quot;Segoe UI&amp;quot;, sans-serif;&quot;&gt;We target specific\r\nindividuals and businesses and learn about their particular uses and needs,\r\nthen supply exactly what is expected in committed time&lt;/span&gt;&lt;b&gt;&lt;span style=&quot;font-size: 18.5pt; font-family: Georgia, serif; color: red; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify;line-height:normal&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size: 18.5pt; font-family: Georgia, serif; color: lime; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;margin-bottom:0in;margin-bottom:.0001pt;\r\ntext-align:center;line-height:normal&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size: 18.5pt; font-family: Georgia, serif; color: lime; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;Focus&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size: 14.5pt; font-family: &amp;quot;Segoe UI&amp;quot;, sans-serif;&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify;line-height:normal&quot;&gt;&lt;span style=&quot;font-size: 14.5pt; font-family: &amp;quot;Segoe UI&amp;quot;, sans-serif;&quot;&gt;Quality, &amp;nbsp;certified, reliable and proven vendors to\r\nensure reliable quality products and services.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify;line-height:normal&quot;&gt;&lt;span style=&quot;font-size: 14.5pt; font-family: &amp;quot;Segoe UI&amp;quot;, sans-serif;&quot;&gt;Oplus is an emerging\r\nmarket leader in complete range of organic, Healthy and natural products and\r\nservices.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify;line-height:normal&quot;&gt;&lt;span style=&quot;font-size: 14.5pt; font-family: &amp;quot;Segoe UI&amp;quot;, sans-serif;&quot;&gt;Offering wide range of\r\nHealthy and safe affordable products to individual and businesses, the Brandt\r\nhas established wide network. Would you like to improve your immunity, health\r\nand environment around you, then Oplus is simple choice to make.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify;line-height:normal&quot;&gt;&lt;span style=&quot;font-size: 14.5pt; font-family: &amp;quot;Segoe UI&amp;quot;, sans-serif;&quot;&gt;You will start enjoying\r\nthe benefits immediately and effectively&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;'),
(2, 'Contact us', '&lt;h2&gt;Welcome To OplusStore !&lt;/h2&gt;\r\n          \r\n          \r\n           \r\n          	&lt;p class=&quot;peragraph-blog&quot;&gt;Oplus Shop is a premium HTML template designed and develoved from the ground up with the sole purpose of helping you create an astonishing, the beautiful and user friendly website that will boost your product&rsquo;s sales.&lt;/p&gt;\r\n                            &lt;p&gt;The theme design package provides a complete Magento theme set for your online store according to your desired theme. This includes all Magento themes that are required for your online store\'s successful implementation.&lt;/p&gt;\r\n                            &lt;p&gt;The theme design package provides a complete Magento theme set for your online store according to your desired theme.&lt;/p&gt;\r\n          \r\n          \r\n           \r\n          \r\n            &lt;div class=&quot;overview-btn mt-45&quot;&gt;\r\n              &lt;a class=&quot;btn-style-2&quot; href=&quot;#&quot;&gt;Shop Now!&lt;/a&gt;\r\n            &lt;/div&gt;'),
(3, 'Discount & Offers', '&lt;span style=&quot;font-size: 60px;&quot;&gt;Special Offers&lt;/span&gt;'),
(7, 'return policy', '&lt;p&gt;This is return policy&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 24px;&quot;&gt;&lt;b&gt;You can add any text or image here.&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;'),
(5, 'privacy policy', '&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size: 12pt; line-height: 107%; color: rgb(102, 102, 102); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;The Company respects your privacy and values\r\nthe trust you place in it. Set out below is the Company&rsquo;s &lsquo;Privacy Policy&rsquo;\r\nwhich details the manner in which information relating to you is collected,\r\nused and disclosed.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin: 0in 0in 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,sans-serif;mso-ascii-theme-font:minor-latin;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin;color:#666666&quot;&gt;Customer\r\nare advised to read and understand our Privacy Policy carefully, as by\r\naccessing the website/app you agree to be bound by the terms and conditions of\r\nthe Privacy Policy and consent to the collection, storage and use of\r\ninformation relating to you as provided herein.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin: 0in 0in 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,sans-serif;mso-ascii-theme-font:minor-latin;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin;color:#666666&quot;&gt;If\r\nyou do not agree with the terms and conditions of our Privacy Policy, including\r\nin relation to the manner of collection or use of your information, please do\r\nnot use or access the website/app.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin: 0in 0in 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,sans-serif;mso-ascii-theme-font:minor-latin;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin;color:#666666&quot;&gt;Our\r\nPrivacy Policy is incorporated into the Terms and Conditions of Use of the\r\nwebsite/app, and is subject to change from time to time without notice. It is\r\nstrongly recommended that you periodically review our Privacy Policy as posted\r\non the App/Web.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin: 0in 0in 11.25pt; text-align: justify; line-height: 200%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,sans-serif;mso-ascii-theme-font:minor-latin;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin;color:#666666&quot;&gt;Should\r\nyou have any clarifications regarding this Privacy Policy, please do not\r\nhesitate to contact us at&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,sans-serif;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:\r\nminor-latin;color:red&quot;&gt;Info@oplus.co.in&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin: 30pt 0in 7.5pt; text-align: justify; line-height: 19.2pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;\r\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;color:#403E3E&quot;&gt;The\r\ncollection, Storage and Use of Information Related to You&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\r\ncolor:#666666&quot;&gt;We may automatically track certain information about you based\r\nupon your behavior on the website. We use this information to do internal\r\nresearch on our users&rsquo; demographics, interests, and behavior to better\r\nunderstand, protect and serve our users. This information is compiled and\r\nanalyzed on an aggregated basis. This information may include the URL that you\r\njust came from (whether this URL is on the website or not), which URL you next\r\ngo to (whether this URL is on the website or not), your computer browser\r\ninformation, your IP address, and other information associated with your\r\ninteraction with the website.&amp;nbsp;&lt;b&gt;We may also share your Mobile IP/Device\r\nIP with third party(ies) and to the best of our knowledge, be-life and\r\nrepresentations given to us by these third party(ies) this information is not\r\nstored by them.&amp;nbsp;&lt;/b&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\r\ncolor:#666666&quot;&gt;We also collect and store personal information provided by you\r\nfrom time to time on the website/app. We only collect and use such information\r\nfrom you that we consider necessary for achieving a seamless, efficient and\r\nsafe experience, customized to your needs including:&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;ol style=&quot;margin-top:0in&quot; start=&quot;1&quot; type=&quot;1&quot;&gt;\r\n &lt;li class=&quot;MsoNormal&quot; style=&quot;color: rgb(102, 102, 102); margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n     &amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin&quot;&gt;To\r\n     enable the provision of services opted for by you;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/li&gt;\r\n &lt;li class=&quot;MsoNormal&quot; style=&quot;color: rgb(102, 102, 102); margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n     &amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin&quot;&gt;To\r\n     communicate necessary account and product/service related information from\r\n     time to time;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/li&gt;\r\n &lt;li class=&quot;MsoNormal&quot; style=&quot;color: rgb(102, 102, 102); margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n     &amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin&quot;&gt;To\r\n     allow you to receive quality customer care services;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/li&gt;\r\n &lt;li class=&quot;MsoNormal&quot; style=&quot;color: rgb(102, 102, 102); margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n     &amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin&quot;&gt;To\r\n     undertake necessary fraud and money laundering prevention checks, and\r\n     comply with the highest security standards;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/li&gt;\r\n &lt;li class=&quot;MsoNormal&quot; style=&quot;color: rgb(102, 102, 102); margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n     &amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin&quot;&gt;To\r\n     comply with applicable laws, rules and regulations; and&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/li&gt;\r\n &lt;li class=&quot;MsoNormal&quot; style=&quot;color: rgb(102, 102, 102); margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n     &amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin&quot;&gt;To\r\n     provide you with information and offers on products and services, on\r\n     updates, on promotions, on related, affiliated or associated service\r\n     providers and partners, that we believe would be of interest to you.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\r\ncolor:#666666&quot;&gt;Where any service requested by you involves a third party, such\r\ninformation as is reasonably necessary by the Company to carry out your service\r\nrequest may be shared with such third party.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\r\ncolor:#666666&quot;&gt;We also do use your contact information to send you offers based\r\non your interests and prior activity. The Company may also use contact\r\ninformation internally to direct its efforts for product improvement, to\r\ncontact you as a survey respondent, to notify you if you win any contest; and\r\nto send you promotional materials from its contest sponsors or advertisers.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\r\ncolor:#666666&quot;&gt;Contacts Permissions: If you allow &lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;Green\r\nSahyadri Distributors India Pvt Ltd &lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;\r\nmso-bidi-theme-font:minor-latin;color:#666666&quot;&gt;to access your contacts\r\n(including contact number, email id etc.), it enables &lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;Green\r\nSahyadri Distributors India Pvt Ltd &lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;\r\nmso-bidi-theme-font:minor-latin;color:#666666&quot;&gt;to subscribe you and your\r\ncontacts to &lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;Green Sahyadri Distributors India Pvt Ltd &lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:\r\nCalibri;mso-bidi-theme-font:minor-latin;color:#666666&quot;&gt;promotional emails,\r\nmessages, ongoing offers etc., and through this permission you and your\r\ncontacts will be able to access a variety of social features such as inviting\r\nyour friends to try our app, send across referral links to your friends, etc.\r\nWe may also use this information to make recommendations of grocery items you\r\nplaced. This information will be synced from your phone and stored on our\r\nservers.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\r\ncolor:#666666&quot;&gt;Further, you may from time to time choose to provide payment\r\nrelated financial information (credit card, debit card, bank account details,\r\nbilling address etc.) on the website. We are committed to keeping all such\r\nsensitive data/information safe at all times and ensure that such\r\ndata/information is only transacted over secure website [of approved payment\r\ngateways which are digitally encrypted], and provide the highest possible\r\ndegree of care available under the technology presently in use.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\r\ncolor:#666666&quot;&gt;The Company will not use your financial information for any\r\npurpose other than to complete a transaction with you.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\r\ncolor:#666666&quot;&gt;To the extent possible, we provide you the option of not\r\ndivulging any specific information that you wish for us not to collect, store\r\nor use. You may also choose not to use a particular service or feature on the\r\nwebsite/application, and opt out of any non-essential communications from the\r\nCompany.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\r\ncolor:#666666&quot;&gt;Further, transacting over the internet has inherent risks which\r\ncan only be avoided by you following security practices yourself, such as not\r\nrevealing account/login related information to any other person and informing\r\nour customer care team about any suspicious activity or where your account\r\nhas/may have been compromised.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\r\ncolor:#666666&quot;&gt;Company use data collection devices such as &ldquo;cookies&rdquo; on certain\r\npages of the website to help analyze our web page flow, measure promotional\r\neffectiveness, and promote trust and safety. &ldquo;Cookies&rdquo; are small files placed\r\non your hard drive that assist us in providing our services. Company offers\r\ncertain features that are only available through the use of a &ldquo;cookie&rdquo;.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\r\ncolor:#666666&quot;&gt;The Company also use cookies to allow you to enter your password\r\nless frequently during a session. Cookies can also help the Company provide\r\ninformation that is targeted to your interests. Most cookies are &ldquo;session\r\ncookies,&rdquo; meaning that they are automatically deleted from your hard drive at\r\nthe end of a session. You are always free to decline our cookies if your\r\nbrowser permits, although in that case you may not be able to use certain\r\nfeatures on the website and you may be required to re-enter your password more\r\nfrequently during a session.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\r\ncolor:#666666&quot;&gt;Additionally, you may encounter &ldquo;cookies&rdquo; or other similar\r\ndevices on certain pages of the website that are placed by third parties. The\r\nCompany does not control the use of cookies by third parties.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\r\ncolor:#666666&quot;&gt;If you send the Company personal correspondence, such as emails\r\nor letters, or if other users or third parties send us correspondence about\r\nyour activities on the website, the Company may collect such information into a\r\nfile specific to you.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\r\ncolor:#666666&quot;&gt;The Company does not retain any information collected for any\r\nlonger than is reasonably considered necessary by us, or such period as may be\r\nrequired by applicable laws. The Company may be required to disclose any\r\ninformation that is lawfully sought from it by a judicial or other competent\r\nbody pursuant to applicable laws.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 11.25pt; text-align: justify; line-height: 21.6pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:12.0pt;mso-fareast-font-family:\r\n&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\r\ncolor:#666666&quot;&gt;The website may contain links to other websites. We are not\r\nresponsible for the privacy practices of such websites which we do not manage\r\nand control.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;'),
(6, 'terms and condition', '&lt;p class=&quot;MsoNormal&quot;&gt;&lt;b&gt;&lt;span lang=&quot;EN&quot; style=&quot;font-family:&amp;quot;Arial&amp;quot;,sans-serif;\r\nmso-ansi-language:EN&quot;&gt;TERMS and CONDITIONS&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span lang=&quot;EN&quot; style=&quot;font-family:&amp;quot;Arial&amp;quot;,sans-serif;\r\nmso-ansi-language:EN&quot;&gt;The domain name &lt;a href=&quot;file:///C:/Users/Weras/Downloads/www.granostore.com&quot;&gt;&lt;span style=&quot;color: windowtext;&quot;&gt;www.oplus.co.in&lt;/span&gt;&lt;/a&gt;&amp;nbsp; is owned by Green Sahyadri Distributors India\r\nPvt Ltd.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span lang=&quot;EN&quot; style=&quot;font-family:&amp;quot;Arial&amp;quot;,sans-serif;\r\nmso-ansi-language:EN&quot;&gt;It is strongly recommended that you read and understand\r\nthese &lsquo;Terms of Use&rsquo; carefully, as by accessing this site (hereinafter the\r\n&ldquo;Marketplace&rdquo;), you agree to be bound by the same and acknowledge that it\r\nconstitutes an agreement between you and the Company (hereinafter the &ldquo;User\r\nAgreement&rdquo;). If you do not agree with this User Agreement, you should not use\r\nor access the Marketplace for any purpose whatsoever.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span lang=&quot;EN&quot; style=&quot;font-family:&amp;quot;Arial&amp;quot;,sans-serif;\r\nmso-ansi-language:EN&quot;&gt;This document is published in accordance with the\r\nprovisions of Rule 3 of the Information Technology (Intermediaries Guidelines)\r\nRules, 2011. The User Agreement may be updated from time to time by the Company\r\nwithout notice. It is therefore strongly recommended that you review the User\r\nAgreement, as available on the Marketplace, each time you access and/or use the\r\nMarketplace.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span lang=&quot;EN&quot; style=&quot;font-family:&amp;quot;Arial&amp;quot;,sans-serif;\r\nmso-ansi-language:EN&quot;&gt;The terms &lsquo;visitor(s)&rsquo;, &lsquo;user(s)&rsquo;, &lsquo;you&rsquo; hereunder refer\r\nto the person visiting, accessing, browsing through and/or using the\r\nMarketplace at any point in time.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span lang=&quot;EN&quot; style=&quot;font-family:&amp;quot;Arial&amp;quot;,sans-serif;\r\nmso-ansi-language:EN&quot;&gt;Should you have any clarifications regarding the Terms of\r\nUse, please do not hesitate to contact us at &amp;lt;info@oplus.co.in&amp;gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span lang=&quot;EN&quot; style=&quot;font-family:&amp;quot;Arial&amp;quot;,sans-serif;\r\nmso-ansi-language:EN&quot;&gt;All the text and trademarks displayed on this site are\r\nowned by Green Sahyadri Distributors India Pvt Ltd&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span lang=&quot;EN&quot; style=&quot;font-family:&amp;quot;Arial&amp;quot;,sans-serif;\r\nmso-ansi-language:EN&quot;&gt;You may print copies of the information on this site, or\r\nstore the data on your computer, for your private use. You may not distribute\r\ntext or graphics to others without the express written consent of Green\r\nSahyadri Distributors India Pvt Ltd.&amp;nbsp; Nor\r\nmay you without our permission, copy and distribute this information on any\r\nother server, or modify or reuse text or trademarks on this or any another\r\nsystem.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span lang=&quot;EN&quot; style=&quot;font-family:&amp;quot;Arial&amp;quot;,sans-serif;\r\nmso-ansi-language:EN&quot;&gt;No reproduction of any part of the site may be sold or\r\ndistributed for commercial gain, nor may it be modified or incorporated in any\r\nother work, publication or site, whether in hard copy or electronic format,\r\nincluding postings to any other site Green Sahyadri Distributors India Pvt Ltd&amp;nbsp; reserves all other rights.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span lang=&quot;EN&quot; style=&quot;font-family:&amp;quot;Arial&amp;quot;,sans-serif;\r\nmso-ansi-language:EN&quot;&gt;The information on this site has been included in good\r\nfaith and is for general purposes only. It should not be relied upon for any\r\nspecific purpose and no representation or warranty is given as regards its\r\naccuracy or completeness.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span lang=&quot;EN&quot; style=&quot;font-family:&amp;quot;Arial&amp;quot;,sans-serif;\r\nmso-ansi-language:EN&quot;&gt;No information on this site shall constitute an\r\ninvitation to invest in Green Sahyadri Distributors India Pvt Ltd or any of its\r\naffiliates. Neither Green Sahyadri Distributors India Pvt Ltd&amp;nbsp; and its affiliates, nor their officers,\r\nemployees or agents shall be liable for any loss, damage or expense arising out\r\nof any access to or use of this site or any site linked to it, including,\r\nwithout limitation, any loss of profit, indirect, incidental or consequential\r\nloss.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;'),
(8, 'Delivery Policy', '<p>this is disclaimer page</p><p><span style=\"font-size: 36px;\"><b>You Can Add Any Text Or Image Here.</b></span></p>'),
(9, 'prime', '&lt;h4 class=&quot;heading&quot; style=&quot;font-family: sans-serif; margin-right: 0px; margin-left: 0px; font-size: 22px; color: rgb(47, 51, 58);&quot;&gt;1. Oplus Prime&lt;/h4&gt;&lt;p class=&quot;btmspace-50 justified&quot; style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; line-height: 24px; color: rgb(36, 36, 36); font-family: sans-serif;&quot;&gt;Members receive benefits which include FREE fast shipping of purchase, exclusive shopping deals and selection, Health lifestyle guidance, and more.&lt;/p&gt;&lt;br style=&quot;color: rgb(36, 36, 36); font-family: sans-serif; font-size: 14px;&quot;&gt;&lt;h4 class=&quot;heading&quot; style=&quot;font-family: sans-serif; margin-right: 0px; margin-left: 0px; font-size: 22px; color: rgb(47, 51, 58);&quot;&gt;2. Shipping benefits include:&lt;/h4&gt;&lt;p class=&quot;btmspace-50 justified&quot; style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; line-height: 24px; color: rgb(36, 36, 36); font-family: sans-serif;&quot;&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;FREE&amp;nbsp;&lt;/span&gt;Shipping on eligible items to addresses in defined pin codes..&amp;nbsp;&lt;span style=&quot;font-weight: bolder;&quot;&gt;FREE&lt;/span&gt;&amp;nbsp;Same-Day Delivery in eligible zip codes&lt;br&gt;&lt;/p&gt;&lt;br style=&quot;color: rgb(36, 36, 36); font-family: sans-serif; font-size: 14px;&quot;&gt;&lt;h4 class=&quot;heading&quot; style=&quot;font-family: sans-serif; margin-right: 0px; margin-left: 0px; font-size: 22px; color: rgb(47, 51, 58);&quot;&gt;3. FREE Redeem reward points:&lt;/h4&gt;&lt;p class=&quot;btmspace-50 justified&quot; style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; line-height: 24px; color: rgb(36, 36, 36); font-family: sans-serif;&quot;&gt;On every purchase of above ₹500 earn rewards for future purchases...&lt;/p&gt;&lt;br style=&quot;color: rgb(36, 36, 36); font-family: sans-serif; font-size: 14px;&quot;&gt;&lt;h4 class=&quot;heading&quot; style=&quot;font-family: sans-serif; margin-right: 0px; margin-left: 0px; font-size: 22px; color: rgb(47, 51, 58);&quot;&gt;4. OPLUS Day:&lt;/h4&gt;&lt;p class=&quot;btmspace-50 justified&quot; style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; line-height: 24px; color: rgb(36, 36, 36); font-family: sans-serif;&quot;&gt;For Oplus prime members a weekly day with discount for the itemthey will buy throughout the day&lt;/p&gt;&lt;br style=&quot;color: rgb(36, 36, 36); font-family: sans-serif; font-size: 14px;&quot;&gt;&lt;h4 class=&quot;heading&quot; style=&quot;font-family: sans-serif; margin-right: 0px; margin-left: 0px; font-size: 22px; color: rgb(47, 51, 58);&quot;&gt;5. Monthly package for exclusively for Prime members :&lt;/h4&gt;&lt;p class=&quot;btmspace-50 justified&quot; style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; line-height: 24px; color: rgb(36, 36, 36); font-family: sans-serif;&quot;&gt;One month grocery package with discounts and offers..&lt;br&gt;FREE grocery delivery on a wide selection of certified organic groceries including pulses, spices , millets, eggs, Herbal household essentials and personal care products..&lt;/p&gt;&lt;br style=&quot;color: rgb(36, 36, 36); font-family: sans-serif; font-size: 14px;&quot;&gt;&lt;br style=&quot;color: rgb(36, 36, 36); font-family: sans-serif; font-size: 14px;&quot;&gt;&lt;h4 class=&quot;heading&quot; style=&quot;font-family: sans-serif; margin-right: 0px; margin-left: 0px; font-size: 22px; color: rgb(47, 51, 58);&quot;&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Terms and conditions:&lt;/span&gt;&lt;/h4&gt;&lt;p class=&quot;btmspace-50 justified&quot; style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; line-height: 24px; color: rgb(36, 36, 36); font-family: sans-serif;&quot;&gt;1. You have to subscribe for Oplus prime membership.. ₹499/3months for Prime members.&lt;/p&gt;&lt;p class=&quot;btmspace-50 justified&quot; style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; line-height: 24px; color: rgb(36, 36, 36); font-family: sans-serif;&quot;&gt;2. Oplus Prime isn\'t available for customers who purchase products for the purpose of resale or use Prime to ship products to their customers or potential customers.&lt;/p&gt;&lt;p class=&quot;btmspace-50 justified&quot; style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; line-height: 24px; color: rgb(36, 36, 36); font-family: sans-serif;&quot;&gt;3. We may change prime benefits occasionally as provided .. Some items are not available or certain uncontrollable scoial parameters may arise like lockdown..&lt;/p&gt;&lt;p class=&quot;btmspace-50 justified&quot; style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; line-height: 24px; color: rgb(36, 36, 36); font-family: sans-serif;&quot;&gt;4. Customers who are guests of another membership aren\'t eligible for the following benefits unless they are eligible through their Amazon Household: membership sharing allowed.&lt;/p&gt;&lt;p class=&quot;btmspace-50 justified&quot; style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; line-height: 24px; color: rgb(36, 36, 36); font-family: sans-serif;&quot;&gt;5. Prime members with certain discounted monthly Prime offers can&rsquo;t share their Prime benefits.&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`) VALUES
(1, 'home'),
(3, 'about us'),
(8, 'products'),
(11, 'contact us'),
(18, 'offers and discounts'),
(19, 'return policy'),
(20, 'privacy policy'),
(21, 'terms and conditions');

-- --------------------------------------------------------

--
-- Table structure for table `pincodes`
--

CREATE TABLE `pincodes` (
  `id` int(11) NOT NULL,
  `pincode` int(11) NOT NULL,
  `is_show` int(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pincodes`
--

INSERT INTO `pincodes` (`id`, `pincode`, `is_show`) VALUES
(1, 410201, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `is_show` int(11) NOT NULL DEFAULT 1,
  `image_name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `discount` float NOT NULL DEFAULT 0,
  `slug` varchar(255) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `trendings` int(1) NOT NULL,
  `param_value_id` varchar(200) NOT NULL,
  `is_deleted` int(1) NOT NULL DEFAULT 0,
  `qty` int(5) NOT NULL DEFAULT 10,
  `param_value` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `is_show`, `image_name`, `price`, `discount`, `slug`, `cat_id`, `meta_title`, `meta_description`, `trendings`, `param_value_id`, `is_deleted`, `qty`, `param_value`) VALUES
(1, 'Alovera', '', 1, '6220200616021257.png', 25, 0, 'alovera', 1, '', '', 1, '1', 1, 1, '250'),
(2, 'American Kale', '', 1, '2520200707051446.png', 70, 0, 'american-kale', 30, 'American Kale', 'American Kale', 1, '1', 0, 998, '200'),
(3, 'Aspragus', '', 1, '8820200707051528.png', 100, 0, 'aspragus', 12, '', '', 1, '1', 0, 1000, '100'),
(4, 'Aloevera', '', 1, '6020200707051615.png', 25, 0, 'aloevera', 12, '', '', 1, '1', 0, 1000, '250'),
(5, 'Avacado', '', 1, '2520200707051728.png', 120, 5, 'avacado', 30, '', '', 1, '1', 0, 1000, '250'),
(6, 'Baby carrot', '', 1, '3220200707052900.png', 50, 0, 'baby-carrot', 12, '', '', 1, '1', 0, 1000, '250'),
(7, 'Baby corn', '', 1, '1220200707053933.png', 25, 0, 'baby-corn', 12, '', '', 1, '1', 0, 1000, '100'),
(8, 'Baby Potato', '', 1, '6420200707054006.png', 25, 0, 'baby-potato', 12, '', '', 1, '1', 0, 1000, '250'),
(9, 'Baby Spinach', '', 1, '9020200707054043.png', 60, 0, 'baby-spinach', 12, '', '', 1, '1', 0, 1000, '100'),
(10, 'Basil Italian', '', 1, '7220200707054112.png', 20, 0, 'basil-italian', 12, '', '', 1, '1', 0, 1000, '50'),
(11, 'Beans Sprouts', '', 1, '2820200707054152.png', 30, 0, 'beans-sprouts', 12, '', '', 1, '1', 0, 1000, '100'),
(12, 'Broccoli', '', 1, '4020200707055307.png', 70, 0, 'broccoli', 12, '', '', 1, '1', 0, 1000, '250'),
(13, 'Broccoli Florets', '', 1, '7920200707055336.png', 90, 0, 'broccoli-florets', 12, '', '', 1, '1', 0, 1000, '200'),
(14, 'Capsicum Mix (Red+Yellow) Combo', '', 1, '4320200707055413.png', 60, 0, 'capsicum-mix-red-yellow-combo', 12, '', '', 1, '1', 0, 1000, '300'),
(15, 'Capsicum Red', '', 1, '1820200707055502.png', 60, 0, 'capsicum-red', 12, '', '', 1, '1', 0, 1000, '300'),
(16, 'Capsicum Yellow', '', 1, '9320200707055531.png', 60, 0, 'capsicum-yellow', 12, '', '', 1, '1', 0, 1000, '300'),
(17, 'Celery', '', 1, '4620200707055647.png', 50, 0, 'celery', 12, '', '', 1, '1', 0, 1000, '200'),
(18, 'Cherry Tomato Red', '', 1, '9220200707055739.png', 40, 0, 'cherry-tomato-red', 12, '', '', 1, '1', 0, 1000, '250'),
(19, 'Chinese Cabbage', '', 1, '8320200707055838.png', 80, 0, 'chinese-cabbage', 12, '', '', 1, '1', 0, 1000, '500'),
(20, 'Chinese Pakchoy', '', 1, '1520200707055949.png', 50, 0, 'chinese-pakchoy', 12, '', '', 1, '1', 0, 1000, '250'),
(21, 'Chives', '', 1, '4220200707060022.png', 20, 0, 'chives', 12, '', '', 1, '1', 0, 1000, '50'),
(22, 'Edible Flowers', '', 1, '8520200707060203.png', 80, 0, 'edible-flowers', 12, '', '', 1, '1', 0, 1000, '25'),
(23, 'Fennel Leaves with Bulb', '', 1, '1520200707060230.png', 60, 0, 'fennel-leaves-with-bulb', 12, '', '', 1, '1', 0, 1000, '250'),
(24, 'Galangal/ Thai Ginger', '', 1, '7120200707060309.png', 40, 0, 'galangal-thai-ginger', 12, '', '', 1, '1', 0, 1000, '100'),
(25, 'Garlic Chives', '', 1, '2420200707061125.png', 20, 0, 'garlic-chives', 12, '', '', 1, '1', 0, 1000, '50'),
(26, 'Herbs- Oregano', '', 1, '2920200707061219.png', 20, 0, 'herbs-oregano', 12, '', '', 1, '1', 0, 1000, '20'),
(27, 'Herbs- Rosemary', '', 1, '5120200707061351.png', 20, 0, 'herbs-rosemary', 12, '', '', 1, '1', 0, 1000, '20'),
(28, 'Herbs- Sage', '', 1, '3520200707061525.png', 20, 0, 'herbs-sage', 12, '', '', 1, '1', 0, 1000, '20'),
(29, 'Herbs- Sweet Marjoram', '', 1, '9720200707061605.png', 20, 0, 'herbs-sweet-marjoram', 12, '', '', 1, '1', 0, 1000, '20'),
(30, 'Herbs- Tarragon', '', 1, '2920200707061722.png', 20, 0, 'herbs-tarragon', 12, '', '', 1, '1', 0, 1000, '20'),
(31, 'Herbs- Thyme', '', 1, '3420200707061836.png', 20, 0, 'herbs-thyme', 12, '', '', 1, '1', 0, 1000, '20'),
(32, 'Herbs Mix- Rosemary+Thyme+oregano +Sage', '', 1, '3920200707061916.png', 50, 0, 'herbs-mix-rosemary-thyme-oregano-sage', 12, '', '', 1, '1', 0, 1000, '50'),
(33, 'Kafir Lime leaves', '', 1, '4720200707062007.png', 30, 0, 'kafir-lime-leaves', 12, '', '', 1, '1', 0, 1000, '20'),
(34, 'Kang Kong', '', 1, '2220200707062125.png', 50, 0, 'kang-kong', 12, '', '', 1, '1', 0, 1000, '200'),
(35, 'Leek', '', 1, '7320200707062308.png', 50, 0, 'leek', 12, '', '', 1, '1', 0, 1000, '200'),
(36, 'Lemon Grass', '', 1, '7620200707062354.png', 20, 0, 'lemon-grass', 12, '', '', 1, '1', 0, 1000, '100'),
(37, 'Lettuce Iceberg', '', 1, '6320200707062445.png', 60, 0, 'lettuce-iceberg', 12, '', '', 1, '1', 0, 1000, '250'),
(38, 'Lettuce leafy', '', 1, '3720200707062935.png', 50, 0, 'lettuce-leafy', 12, '', '', 1, '1', 0, 1000, '150'),
(39, 'Lettuce lollo Rossa', '', 1, '6720200707063037.png', 50, 0, 'lettuce-lollo-rossa', 12, '', '', 1, '1', 0, 1000, '150'),
(40, 'Lettuce Mix/ Salad', '', 1, '7820200707063138.png', 70, 0, 'lettuce-mix-salad', 12, '', '', 1, '1', 0, 1000, '150'),
(41, 'Lettuce Romaine Green', '', 1, '4220200707063221.png', 50, 0, 'lettuce-romaine-green', 12, '', '', 1, '1', 0, 1000, '150'),
(42, 'Lettuce Simpson', '', 1, '8220200707063321.png', 50, 0, 'lettuce-simpson', 12, '', '', 1, '1', 0, 1000, '150'),
(43, 'Mircrogreens Mix', '', 1, '5820200707063430.png', 80, 0, 'mircrogreens-mix', 12, '', '', 1, '1', 0, 1000, '50'),
(44, 'Mushrooms Button', '', 1, '1720200707063652.png', 45, 0, 'mushrooms-button', 12, '', '', 1, '1', 0, 1000, '200'),
(45, 'Parsley Curled', '', 1, '6520200707063729.png', 20, 0, 'parsley-curled', 12, '', '', 1, '1', 0, 1000, '50'),
(46, 'Parsley flat', '', 1, '5620200707063907.png', 30, 0, 'parsley-flat', 12, '', '', 1, '1', 0, 1000, '50'),
(47, 'American Corn fresh', '', 1, '6920200707064029.png', 25, 0, 'american-corn-fresh', 12, '', '', 1, '1', 0, 1000, '200'),
(48, 'Peeled Garlic', '', 1, '7520200707064133.png', 30, 0, 'peeled-garlic', 12, '', '', 1, '1', 0, 1000, '100'),
(49, 'Red cabbage', '', 1, '3520200707064224.png', 50, 0, 'red-cabbage', 12, '', '', 1, '1', 0, 1000, '400'),
(50, 'Red Raddish', '', 1, '1620200707064311.png', 50, 0, 'red-raddish', 12, '', '', 1, '1', 0, 1000, '250'),
(51, 'Roquette/ Arugula/ Rucula', '', 1, '5520200707064747.png', 50, 0, 'roquette-arugula-rucula', 12, '', '', 1, '1', 0, 1000, '50'),
(52, 'Thai Bird Chilly', '', 1, '6020200707064837.png', 50, 0, 'thai-bird-chilly', 12, '', '', 1, '1', 0, 1000, '100'),
(53, 'Thai Brinjol', '', 1, '7620200707064924.png', 50, 0, 'thai-brinjol', 12, '', '', 1, '1', 0, 1000, '100'),
(54, 'Thai Mix-Thai curry ingredient', '', 1, '1120200707064953.png', 70, 0, 'thai-mix-thai-curry-ingredient', 12, '', '', 1, '1', 0, 1000, '100'),
(55, 'Thai sweet basil', '', 1, '5020200707065024.png', 30, 0, 'thai-sweet-basil', 12, '', '', 1, '1', 0, 1000, '20'),
(56, 'Wheet Grass', '', 1, '4320200707065053.png', 30, 0, 'wheet-grass', 12, '', '', 1, '1', 0, 1000, '100'),
(57, 'Zucchini Yellow', '', 1, '9020200707065132.png', 50, 0, 'zucchini-yellow', 12, '', '', 1, '1', 0, 1000, '250'),
(58, 'Zucchini Green', '', 1, '4820200707065206.png', 50, 0, 'zucchini-green', 12, '', '', 1, '1', 0, 1000, '250'),
(59, 'Turmeric Powder', '&lt;p&gt;Certified Best Quality Organic Turmeric Powder&lt;/p&gt;', 1, '3420200707065334.png', 250, 0, 'turmeric-powder', 8, '', '', 1, '1', 1, 1000, '250'),
(60, 'Red Chilli Powder', '', 1, '1620200707074532.png', 48, 0, 'red-chilli-powder', 8, '', '', 1, '1', 1, 1000, '100'),
(61, 'Safflower', '', 1, '8120200707074628.jpg', 180, 0, 'safflower', 9, '', '', 1, '8', 1, 1000, '500'),
(62, 'Sunflower Oil', '', 1, '9520200707074728.jpg', 270, 0, 'sunflower-oil', 9, '', '', 1, '7', 1, 1000, '1'),
(63, 'Strawberry', '', 1, '1320200626082840.jpg', 180, 0, 'strawberry', 10, '', '', 1, '8', 1, 1000, '300'),
(64, 'Chocolate', '', 1, '7620200626082957.jpg', 180, 0, 'chocolate', 10, '', '', 1, '8', 1, 1000, '300'),
(65, 'Alovera Indegenous', '', 1, '5920200626083157.png', 25, 0, 'alovera-indegenous', 11, '', '', 1, '1', 1, 1000, '250'),
(66, 'Jowar Fleks', '', 1, '1320200707092230.jpg', 90, 0, 'jowar-fleks', 29, '', '', 1, '1', 1, 1000, '250'),
(67, 'Bajra Fleks', '', 1, '9220200626083759.jpg', 70, 0, 'bajra-fleks', 13, '', '', 1, '1', 1, 1000, '200'),
(68, 'Honey Gulkund', '', 1, '2520200626084235.jpg', 170, 0, 'honey-gulkund', 14, '', '', 1, '1', 1, 1000, '250'),
(69, 'Tulasi Honey', '', 1, '4120200626091013.jpg', 245, 0, 'tulasi-honey', 14, '', '', 1, '1', 1, 999, '250'),
(70, 'Brown Biscuits', '', 1, '2020200626091443.jpg', 35, 0, 'brown-biscuits', 16, '', '', 1, '1', 1, 1000, '180'),
(71, ' Jaggery Biscuits', '', 1, '2720200707092553.jpg', 35, 0, 'jaggery-biscuits', 26, '', '', 1, '1', 1, 1000, '180'),
(72, 'Eco Floor Cleaner', '', 1, '7420200626093022.png', 99, 0, 'eco-floor-cleaner', 18, '', '', 1, '8', 1, 1000, '500'),
(73, 'Eco Toilet Cleaner', '', 1, '7120200626093208.png', 95, 0, 'eco-toilet-cleaner', 18, '', '', 1, '8', 1, 999, '500'),
(74, 'Eco Wash', '', 1, '9920200626094155.png', 250, 0, 'eco-wash', 18, '', '', 1, '7', 1, 1000, '1'),
(75, 'Eco Dish Washing Gel', '', 1, '7020200626094300.jpeg', 100, 0, 'eco-dish-washing-gel', 18, '', '', 1, '8', 1, 1000, '500'),
(76, 'Aloevera Skin Gel', '', 1, '3920200626095348.jpg', 90, 0, 'aloevera-skin-gel', 19, '', '', 1, '1', 1, 1000, '125'),
(77, 'Mini Lipstick (Combo)', '', 1, '4620200626095641.jpg', 149, 0, 'mini-lipstick-combo', 19, '', '', 1, '1', 1, 1000, '70'),
(78, 'Ajwain honey', '', 1, '6520200707092839.jpg', 180, 0, 'ajwain-honey', 14, '', '', 1, '1', 1, 1000, ''),
(79, 'Jamun', '', 1, '2620200707093053.jpg', 235, 0, 'jamun', 14, '', '', 1, '1', 1, 1000, '250'),
(80, 'Multifloral', '', 1, '3920200708021545.jpg', 180, 0, 'multifloral', 14, '', '', 1, '1', 1, 1000, ''),
(81, 'Rose water', '', 1, '5220200708021837.jpg', 60, 0, 'rose-water', 34, '', '', 1, '8', 1, 1000, '120'),
(82, 'Face Pack MixFruit', '', 1, '9520200704044822.png', 120, 0, 'face-pack-mixfruit', 34, '', '', 1, '1', 1, 70, ''),
(83, 'Dish Washing Detergent', '', 1, '5220200707093633.jpg', 189, 0, 'dish-washing-detergent', 33, '', '', 1, '7', 1, 1, ''),
(84, 'Mini Lipstick', '', 1, '9720200704045935.png', 149, 0, 'mini-lipstick', 34, '', '', 1, '', 1, 7, ''),
(85, 'Handmade Soap', '', 1, '6720200704051213.png', 55, 0, 'handmade-soap', 35, '', '', 1, '1', 1, 100, ''),
(86, 'Guava', '', 1, '5520200704051533.png', 20, 0, 'guava', 25, '', '', 1, '8', 1, 250, '250'),
(87, 'Mango', '', 1, '3820200704051642.png', 20, 0, 'mango', 25, '', '', 1, '8', 1, 250, '250'),
(88, 'AamPana', '', 1, '4420200704051742.png', 20, 0, 'aampana', 25, '', '', 1, '8', 1, 249, '250'),
(89, 'Dhoop ', '', 1, '8920200705105059.png', 30, 0, 'dhoop', 35, '', '', 1, '', 1, 20, '1'),
(90, 'Bajara fleks', '', 1, '6520200705123122.png', 70, 0, 'bajara-fleks', 29, '', '', 1, '1', 1, 200, '200'),
(91, 'Jowar Maultigrain flour', '', 0, '5920200705124145.png', 50, 0, 'jowar-maultigrain-flour', 29, '', '', 1, '1', 1, 200, '200'),
(92, 'Jowar Idli Mix', '', 0, '2820200705124310.png', 50, 0, 'jowar-idli-mix', 29, '', '', 1, '1', 1, 200, '200'),
(93, 'Jowar Rava', '', 1, '7920200705124435.png', 50, 0, 'jowar-rava', 29, '', '', 1, '1', 1, 400, '400'),
(94, 'Multigrain Daliya', '', 0, '3720200705124651.png', 55, 0, 'multigrain-daliya', 29, '', '', 1, '1', 1, 400, '400'),
(95, 'Ragi DOSA Mix', '', 0, '1620200705125111.png', 60, 0, 'ragi-dosa-mix', 29, '', '', 1, '1', 1, 200, '200'),
(96, 'Ragi idli Mix', '', 0, '8220200705125424.png', 60, 0, 'ragi-idli-mix', 29, '', '', 1, '1', 1, 200, '200'),
(97, 'Sugarless Kanik Biscuits', '', 0, '5720200705011436.png', 55, 0, 'sugarless-kanik-biscuits', 26, '', '', 1, '1', 1, 180, '180'),
(98, 'Ghee Nankati', '', 0, '7520200705013055.png', 55, 0, 'ghee-nankati', 26, '', '', 1, '1', 1, 180, '180'),
(99, 'Liquid Laundry Detergent', '', 0, '8220200705013617.png', 150, 0, 'liquid-laundry-detergent', 33, '', '', 1, '8', 1, 500, '500'),
(100, 'Sunflower', '', 1, '4220200705044125.png', 270, 0, 'sunflower', 9, '', '', 1, '7', 1, 1, '1'),
(101, 'Mustard Oil', '', 1, '1620200705044953.png', 210, 0, 'mustard-oil', 9, '', '', 1, '8', 1, 500, '500'),
(102, 'Sesame', '', 1, '6620200705045413.png', 540, 0, 'sesame', 9, '', '', 1, '7', 1, 1, '1'),
(103, 'Fackpack', '', 1, '5820200705050243.png', 90, 0, 'fackpack', 35, '', '', 1, '1', 1, 20, '20'),
(104, 'Dantmanjan', '', 1, '2820200705050557.png', 40, 0, 'dantmanjan', 35, '', '', 1, '1', 1, 25, '25'),
(105, 'GroundNut', '', 1, '6620200705050847.png', 270, 0, 'groundnut', 9, '', '', 1, '7', 1, 1, '1'),
(106, 'Wheat(kanik) Biscuits', '', 1, '2220200706033435.png', 70, 0, 'wheat-kanik-biscuits', 26, '', '', 1, '1', 1, 280, '280'),
(107, 'Nachani Biscuits', '', 1, '2320200706033647.png', 70, 0, 'nachani-biscuits', 26, '', '', 1, '1', 1, 350, '350'),
(108, 'XL Trifold', '', 1, '3220200706034258.png', 45, 0, 'xl-trifold', 35, '', '', 1, '', 1, 7, '1'),
(109, 'XXL Trifold', '', 1, '5120200706034411.png', 69, 0, 'xxl-trifold', 35, '', '', 1, '', 1, 7, '1'),
(110, 'Srub soap', '', 1, '8620200706034636.png', 30, 0, 'srub-soap', 35, '', '', 1, '1', 1, 75, '75'),
(111, 'Ghee Rot', '', 1, '3220200706035045.png', 70, 0, 'ghee-rot', 26, '', '', 1, '1', 1, 200, '200'),
(112, 'Diet Biscuits', '', 1, '2820200706035246.png', 280, 0, 'diet-biscuits', 26, '', '', 1, '1', 1, 80, '280'),
(113, 'Dish Washing Gel', '', 1, '1920200712103303.png', 189, 0, 'dish-washing-gel', 33, '', '', 1, '8', 0, 1000, '500'),
(114, 'Honey Gulkund (Small)', '', 1, '1720200712103706.png', 170, 0, 'honey-gulkund-small', 14, '', '', 1, '1', 0, 999, '250'),
(115, 'Honey Gulkund (Large)', '', 1, '8120200712103802.png', 310, 0, 'honey-gulkund-large', 14, '', '', 1, '1', 0, 1000, '500'),
(116, 'Jamun Honey', '', 1, '6620200712104000.png', 235, 0, 'jamun-honey', 14, '', '', 1, '1', 0, 1000, '250'),
(117, 'Multifloral Honey (Small)', '', 1, '9520200712104219.png', 180, 0, 'multifloral-honey-small', 14, '', '', 1, '1', 0, 1000, '250'),
(118, 'Multifloral Honey (Large)', '', 1, '9820200712104318.png', 310, 0, 'multifloral-honey-large', 14, '', '', 1, '1', 0, 1000, '500'),
(119, 'Tulsi Honey (Small)', '', 1, '9120200712104422.png', 245, 0, 'tulsi-honey-small', 14, '', '', 1, '1', 0, 1000, '250'),
(120, 'Tulsi Honey (Large)', '', 1, '6420200712104519.png', 495, 0, 'tulsi-honey-large', 14, '', '', 1, '1', 0, 1000, '500'),
(121, 'Turil Toilet Cleaner', '', 1, '4520200713114442.png', 98, 0, 'turil-toilet-cleaner', 33, '', '', 1, '8', 1, 1000, '500'),
(122, 'Bajara Flakes', '', 1, '6120200714050616.png', 72, 0, 'bajara-flakes', 8, '', '', 1, '2', 1, 1000, 'kg'),
(123, 'Turil Toilet Cleaner & Freshner', '', 1, '5520200714052527.png', 176, 0, 'turil-toilet-cleaner-freshner', 33, '', '', 1, '7', 0, 1000, 'litre'),
(124, 'Turil Toilet Cleaner & Pure Blossom Fragrance', '', 1, '9120200714053407.png', 95, 0, 'turil-toilet-cleaner-pure-blossom-fragrance', 33, '', '', 1, '8', 0, 1000, '500'),
(125, 'Turil Floor Cleaner', '', 1, '9220200714053833.png', 149, 0, 'turil-floor-cleaner', 33, '', '', 1, '7', 0, 1000, '1000'),
(126, 'Violina Mini Lipstick', '', 1, '5420200714062240.png', 149, 0, 'violina-mini-lipstick', 34, '', '', 1, '', 0, 1000, '1'),
(127, 'Violina Face Pack- Mixfruit', '', 1, '2320200714063449.png', 120, 0, 'violina-face-pack-mixfruit', 34, '', '', 1, '1', 0, 999, '70'),
(128, 'Violina Rose Water', '', 1, '9620200714063717.png', 60, 0, 'violina-rose-water', 34, '', '', 1, '8', 0, 1000, '120'),
(129, 'Turil Toilet Cleaner and Freshner', '', 1, '5220200714064734.png', 176, 0, 'turil-toilet-cleaner-and-freshner', 33, '', '', 1, '7', 0, 1000, 'litre'),
(130, 'Jowar Flakes', '', 1, '4720200714065854.png', 90, 0, 'jowar-flakes', 29, '', '', 1, '1', 0, 1000, '250gm'),
(131, 'Jowar Multigrain Flour', '', 1, '1220200714071122.png', 50, 0, 'jowar-multigrain-flour', 29, '', '', 1, '1', 0, 1000, '200'),
(132, 'Oragayu Safflower Oil', '', 1, '6420200714074129.png', 340, 0, 'oragayu-safflower-oil', 9, '', '', 1, '7', 1, 1000, '1000'),
(133, 'Orgayu Safflower Oil', '', 1, '2920200714074258.png', 180, 0, 'orgayu-safflower-oil', 9, '', '', 1, '8', 0, 999, '500'),
(134, 'Orgayu Sunflower Oil', '', 1, '9020200714075002.png', 270, 0, 'orgayu-sunflower-oil', 9, '', '', 1, '8', 1, 1000, '1000'),
(135, 'Orgayu Safflower Oil-1litre', '', 1, '7820200714082520.png', 340, 0, 'orgayu-safflower-oil-1litre', 9, '', '', 1, '8', 1, 1000, '1000'),
(136, 'Orgayu Sunflower Oil- 500ml', '', 1, '1420200714082715.png', 145, 0, 'orgayu-sunflower-oil-500ml', 9, '', '', 1, '8', 0, 1000, '500'),
(137, 'Sahyadri Aam Pana', '', 1, '9620200714083621.png', 20, 0, 'sahyadri-aam-pana', 25, '', '', 1, '8', 0, 1000, '250'),
(138, 'Sahyadri Guava', '', 1, '8420200714083733.png', 20, 0, 'sahyadri-guava', 25, '', '', 1, '8', 0, 1000, '250'),
(139, 'Sahyadri Mango', '', 1, '5920200714083840.png', 20, 0, 'sahyadri-mango', 25, '', '', 1, '8', 0, 1000, '250'),
(140, 'Orgayu Safflower Oil-1ltr', '', 1, '1520200714085050.png', 340, 0, 'orgayu-safflower-oil-1ltr', 9, '', '', 1, '8', 0, 1000, '1000'),
(141, 'Orgayu Sunflower Oil-1ltr', '', 1, '3220200714085536.png', 270, 0, 'orgayu-sunflower-oil-1ltr', 9, '', '', 1, '8', 0, 1000, '1000'),
(142, 'Orgayu Groundnut Oil', '', 1, '9220200714085846.png', 270, 0, 'orgayu-groundnut-oil', 9, '', '', 1, '8', 0, 999, '1000'),
(143, 'Orgayu Sesame Oil', '', 1, '3820200714090009.png', 540, 0, 'orgayu-sesame-oil', 9, '', '', 1, '8', 0, 1000, '1000'),
(144, 'Orgayu Mustard Oil', '', 1, '6220200714090138.png', 400, 0, 'orgayu-mustard-oil', 9, '', '', 1, '8', 0, 1000, '1000'),
(145, 'Vatsalya Dantmanjan', '', 1, '7920200714090937.png', 40, 0, 'vatsalya-dantmanjan', 35, '', '', 1, '1', 0, 1000, '25'),
(146, 'Vatsalya Facepack', '', 1, '2520200714091127.png', 90, 0, 'vatsalya-facepack', 35, '', '', 1, '1', 0, 1000, '20'),
(147, 'Vatsalya Gomay Scrub Soap', '', 1, '4420200714091414.png', 30, 0, 'vatsalya-gomay-scrub-soap', 35, '', '', 1, '1', 0, 1000, '75'),
(148, 'Swami Ayurveda- Neem Soap', '', 1, '4120200714091848.png', 55, 0, 'swami-ayurveda-neem-soap', 35, '', '', 1, '1', 0, 1000, '100'),
(149, 'Chakor Sugarless Kanik Biscuit', '', 1, '2320200714092815.png', 55, 0, 'chakor-sugarless-kanik-biscuit', 26, '', '', 1, '1', 0, 1000, '180'),
(150, 'Chakor Wheat Kanik Biscuit', '', 1, '3120200714093630.png', 70, 0, 'chakor-wheat-kanik-biscuit', 26, '', '', 1, '1', 0, 1000, '280'),
(151, 'Sanitary Napkins XL Trifold', '', 1, '2220200714094441.png', 45, 0, 'sanitary-napkins-xl-trifold', 7, '', '', 1, '', 1, 1000, '1'),
(152, 'Sanitary Napkins XXL Trifold', '', 1, '9820200724084254.png', 69, 0, 'sanitary-napkins-xxl-trifold', 7, '', '', 1, '9', 1, 1000, '1'),
(153, 'Gokhale Liquid Laundry Detergent', '', 1, '9320200714095419.png', 250, 0, 'gokhale-liquid-laundry-detergent', 33, '', '', 1, '8', 0, 1000, '1000'),
(154, 'Bajara Flakes- Good 2 Eat', '', 1, '6420200714100408.png', 70, 0, 'bajara-flakes-good-2-eat', 29, '', '', 1, '1', 1, 1000, '200'),
(155, 'Jowar Idli Mix - Good 2 Eat', '', 1, '2520200714100755.png', 50, 0, 'jowar-idli-mix-good-2-eat', 29, '', '', 1, '1', 1, 1000, '200'),
(156, 'Jowar Rava - Good 2 Eat', '', 1, '6920200714100941.png', 50, 0, 'jowar-rava-good-2-eat', 29, '', '', 1, '', 1, 1000, '400'),
(157, 'Jowar Idli Mix - Gud 2 Eat', '', 1, '2520200714101419.png', 50, 0, 'jowar-idli-mix-gud-2-eat', 29, '', '', 1, '1', 0, 1000, '200'),
(158, 'Bajara Flakes - Gud 2 Eat', '', 1, '1520200714101527.png', 70, 0, 'bajara-flakes-gud-2-eat', 29, '', '', 1, '1', 0, 1000, '200'),
(159, 'Jowar Rava - Gud 2 Eat', '', 1, '2620200714101638.png', 50, 0, 'jowar-rava-gud-2-eat', 29, '', '', 1, '1', 0, 1000, '400'),
(160, 'Multigrain Daliya - Gud 2 Eat', '', 1, '6620200714102555.png', 55, 0, 'multigrain-daliya-gud-2-eat', 29, '', '', 1, '1', 0, 1000, '400'),
(161, 'Ragi Dosa Mix - Gud 2 Eat', '', 1, '7720200714102722.png', 60, 0, 'ragi-dosa-mix-gud-2-eat', 29, '', '', 1, '1', 0, 1000, '200'),
(162, 'Ragi Idli Mix- Gud 2 Eat', '', 1, '8120200714102847.png', 60, 0, 'ragi-idli-mix-gud-2-eat', 29, '', '', 1, '1', 0, 1000, '200'),
(163, 'Lady Finger', '', 1, '8420200722041429.png', 16, 0, 'lady-finger', 43, '', '', 1, '1', 0, 1000, '250'),
(164, 'Capsicum', '', 1, '7820200722041720.png', 16, 0, 'capsicum', 43, '', '', 1, '1', 0, 1000, '250'),
(165, 'Green Chilli', '', 1, '5920200722041832.png', 30, 0, 'green-chilli', 43, '', '', 1, '1', 0, 1000, '250'),
(166, 'Cluster Beans', '', 1, '5920200722041945.png', 25, 0, 'cluster-beans', 43, '', '', 1, '1', 0, 1000, '250'),
(167, 'Cucumber', '', 1, '8920200722042308.png', 13, 0, 'cucumber', 43, '', '', 1, '1', 0, 1000, '250'),
(168, 'Ginger', '', 1, '7720200722043039.png', 35, 0, 'ginger', 43, '', '', 1, '1', 0, 1000, '250'),
(169, 'Garlic', '', 1, '7720200722043142.png', 40, 0, 'garlic', 43, '', '', 1, '1', 0, 1000, '250'),
(170, 'Bitter Gourd', '', 1, '6520200722043407.png', 15, 0, 'bitter-gourd', 43, '', '', 1, '1', 0, 1000, '250'),
(171, 'Cauliflower', '', 1, '1320200722043617.png', 30, 0, 'cauliflower', 43, '', '', 1, '', 0, 1000, '1 Piece'),
(172, 'Cabbage', '', 1, '6420200722043723.png', 35, 0, 'cabbage', 43, '', '', 1, '', 0, 1000, '1 Piece'),
(173, 'Tondli ( Coccinia )', '', 1, '6220200722044219.png', 15, 0, 'tondli-coccinia', 43, '', '', 1, '1', 0, 1000, '250'),
(174, 'Ghosali ( Soft Gourd )', '', 1, '8220200722044447.png', 13, 0, 'ghosali-soft-gourd', 43, '', '', 1, '1', 0, 1000, '250'),
(175, 'Onion', '', 1, '5520200722044556.png', 20, 0, 'onion', 43, '', '', 1, '2', 0, 1000, '1'),
(176, 'Potato', '', 1, '4420200722044750.png', 40, 0, 'potato', 43, '', '', 1, '2', 0, 1000, '1'),
(177, 'Brinjal', '', 1, '2320200722044900.png', 30, 0, 'brinjal', 43, '', '', 1, '1', 0, 1000, '500'),
(178, 'Palak ( Spinach )', '', 1, '9320200722045009.png', 23, 0, 'palak-spinach', 43, '', '', 1, '', 0, 1000, '1'),
(179, 'Methi', '', 1, '4920200722045102.png', 30, 0, 'methi', 43, '', '', 1, '', 0, 1000, '1'),
(180, 'Tomato', '', 1, '8120200722045224.png', 76, 0, 'tomato', 43, '', '', 1, '2', 0, 1000, '1'),
(181, 'Bottle Gourd', '', 1, '3120200722045343.png', 20, 0, 'bottle-gourd', 43, '', '', 1, '', 0, 1000, '1'),
(182, 'Green Peace', '', 1, '3020200722045928.png', 40, 0, 'green-peace', 43, '', '', 1, '1', 0, 1000, '250'),
(183, 'Drum Stick', '', 1, '3920200722050125.png', 30, 0, 'drum-stick', 43, '', '', 1, '', 0, 1000, '4'),
(184, 'Shepu', '', 1, '9120200722050241.png', 30, 0, 'shepu', 43, '', '', 1, '', 0, 1000, '1'),
(185, 'Coriander', '', 1, '6920200722050348.png', 30, 0, 'coriander', 43, '', '', 1, '', 0, 1000, '1'),
(186, 'Curry Leaves', '', 1, '4520200722050455.png', 10, 0, 'curry-leaves', 43, '', '', 1, '', 0, 1000, '1 Bunch'),
(187, 'Lemon', '', 1, '9920200722050555.png', 15, 0, 'lemon', 43, '', '', 1, '', 0, 1000, '5 Piece'),
(188, 'Apple', '', 1, '9120200722051455.png', 140, 0, 'apple', 30, '', '', 1, '1', 0, 1000, '500'),
(189, 'Kiwi', '', 1, '8220200722051740.png', 120, 0, 'kiwi', 1, '', '', 1, '', 0, 1000, '1 box'),
(190, 'Orange', '', 1, '9420200722051856.png', 85, 0, 'orange', 30, '', '', 1, '1', 0, 1000, '500'),
(191, 'Pomegranate', '', 1, '9920200722052058.png', 120, 0, 'pomegranate', 30, '', '', 1, '2', 0, 1000, '1'),
(192, 'Papaya', '', 1, '6620200722052210.png', 40, 0, 'papaya', 30, '', '', 1, '', 0, 1000, '1 Piece'),
(193, 'Pears', '', 1, '1820200722052326.png', 20, 0, 'pears', 30, '', '', 1, '2', 0, 1000, '1'),
(194, 'Custard Apple', '', 1, '9520200722052449.png', 170, 0, 'custard-apple', 30, '', '', 1, '2', 0, 1000, '1'),
(195, 'Dragon Fruit Red Red', '', 1, '6320200722052556.png', 230, 0, 'dragon-fruit-red-red', 30, '', '', 1, '2', 0, 1000, '1'),
(196, 'Dragon Fruit Red White', '', 1, '3920200722052701.png', 180, 0, 'dragon-fruit-red-white', 30, '', '', 1, '2', 0, 1000, '1'),
(197, 'Carrot', '', 1, '4220200722052917.png', 10, 0, 'carrot', 43, '', '', 1, '1', 0, 1000, '250'),
(198, 'Coconut Oil', '', 1, '4420200722053148.png', 380, 0, 'coconut-oil', 9, '', '', 1, '7', 0, 1000, '1'),
(199, 'Sanitary Napkin XL Trifold', '', 1, '5220200724084650.png', 45, 0, 'sanitary-napkin-xl-trifold', 35, '', '', 1, '9', 1, 1000, '1'),
(200, 'Sanitary Pad XL Trifold', '', 1, '5620200724085300.png', 45, 0, 'sanitary-pad-xl-trifold', 7, '', '', 1, '', 1, 1000, '1'),
(201, 'Sanitary Pads XL Trifold', '', 1, '1720200724090700.png', 45, 0, 'sanitary-pads-xl-trifold', 35, '', '', 1, '10', 0, 1000, '1'),
(202, 'Sanitary Pads XXL Trifold', '', 1, '6620200724090839.png', 69, 0, 'sanitary-pads-xxl-trifold', 35, '', '', 1, '10', 0, 1000, '1'),
(203, 'Organic Kodo Millet', '', 1, '6920200725045010.png', 90, 0, 'organic-kodo-millet', 46, '', '', 1, '1', 0, 1000, '500'),
(204, 'Organic Kodo Millet Flour', '', 1, '7920200725045417.png', 95, 0, 'organic-kodo-millet-flour', 46, '', '', 1, '1', 0, 1000, '500'),
(205, 'Organic Amarnath', '', 1, '8320200725045841.png', 180, 0, 'organic-amarnath', 46, '', '', 1, '1', 0, 1000, '500'),
(206, 'Organic Amarnath Flour', '', 1, '2520200725045955.png', 185, 0, 'organic-amarnath-flour', 46, '', '', 1, '1', 0, 1000, '500'),
(207, 'Organic Multi Millet Mix - Small', '', 1, '3920200725050233.png', 85, 0, 'organic-multi-millet-mix-small', 46, '', '', 1, '1', 0, 1000, '500'),
(208, 'Organic Multi Millet Mix', '', 1, '2120200725050335.png', 160, 0, 'organic-multi-millet-mix', 46, '', '', 1, '2', 0, 1000, '1'),
(209, 'Organic Foxtail Millet Flour', '', 1, '4920200725050932.png', 95, 0, 'organic-foxtail-millet-flour', 46, '', '', 1, '1', 0, 1000, '500'),
(210, 'Organic Mixed Millet Flour', '', 1, '4920200725051100.png', 65, 0, 'organic-mixed-millet-flour', 46, '', '', 1, '1', 0, 1000, '500'),
(211, 'Organic Mixed Millet Flour - Large', '', 1, '2420200725051227.png', 120, 0, 'organic-mixed-millet-flour-large', 46, '', '', 1, '2', 0, 1000, '1'),
(212, 'Organic Idli Rice', '', 1, '6120200725051402.png', 90, 0, 'organic-idli-rice', 46, '', '', 1, '2', 0, 1000, '1'),
(213, 'Black Rice', '', 1, '1120200725051615.png', 239, 0, 'black-rice', 46, '', '', 1, '2', 0, 1000, '1'),
(214, 'Organic Kabuli Channa', '', 1, '3920200725051919.png', 186, 0, 'organic-kabuli-channa', 47, '', '', 1, '2', 0, 1000, '1'),
(215, 'Organic Moong Dal ( Green Gram Split )', '', 1, '5420200725052111.png', 142, 0, 'organic-moong-dal-green-gram-split', 47, '', '', 1, '2', 0, 1000, '1'),
(216, 'Organic Rajma - Chitra', '', 1, '2120200725052420.png', 96, 0, 'organic-rajma-chitra', 47, '', '', 1, '1', 0, 1000, '500'),
(217, 'Organic Red Rajma - Jammu', '', 1, '2420200725052546.png', 82, 0, 'organic-red-rajma-jammu', 47, '', '', 1, '1', 0, 1000, '500'),
(218, 'Himalayan Pink Salt', '', 1, '8520200725052735.png', 105, 0, 'himalayan-pink-salt', 48, '', '', 1, '2', 0, 1000, '1'),
(219, 'Organic Jaggery Granules - Small', '', 1, '2620200725053111.png', 72, 0, 'organic-jaggery-granules-small', 48, '', '', 1, '1', 0, 1000, '500'),
(220, 'Organic Jaggery Granules -Large', '', 1, '2920200725053259.png', 136, 0, 'organic-jaggery-granules-large', 48, '', '', 1, '2', 0, 1000, '1'),
(221, 'Organic Little Millet Flour', '', 1, '6720200725053719.png', 95, 0, 'organic-little-millet-flour', 46, '', '', 1, '1', 0, 1000, '500'),
(222, 'Himalayan Pink Salt Granules', '', 1, '5420200725053945.png', 60, 0, 'himalayan-pink-salt-granules', 48, '', '', 1, '1', 0, 1000, '500'),
(223, 'Oats', '', 1, '6220200725055304.png', 195, 0, 'oats', 49, '', '', 1, '2', 0, 1000, '1'),
(224, 'Organic Corn Flakes', '', 1, '4320200725060357.png', 75, 0, 'organic-corn-flakes', 49, '', '', 1, '1', 0, 1000, '150'),
(225, 'Organic Mixed Millet Flakes', '', 1, '4720200725060647.png', 235, 0, 'organic-mixed-millet-flakes', 49, '', '', 1, '1', 0, 1000, '300'),
(226, 'Organic Filter Coffee', '', 1, '4720200725061235.png', 180, 0, 'organic-filter-coffee', 50, '', '', 1, '1', 0, 1000, '150'),
(227, 'Organic Green Tea', '', 1, '6220200725061641.png', 175, 0, 'organic-green-tea', 50, '', '', 1, '1', 0, 1000, '42.5'),
(228, 'Organic Mixed Millet Biscuits - Diet', '', 1, '1220200725061850.png', 95, 0, 'organic-mixed-millet-biscuits-diet', 51, '', '', 1, '1', 0, 1000, '150'),
(229, 'Organic MIxed Millet Biscuits', '', 1, '7720200725062035.png', 95, 0, 'organic-mixed-millet-biscuits', 26, '', '', 1, '1', 0, 1000, '150');

-- --------------------------------------------------------

--
-- Table structure for table `products_has_images`
--

CREATE TABLE `products_has_images` (
  `id` int(11) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_has_images`
--

INSERT INTO `products_has_images` (`id`, `image_name`, `product_id`) VALUES
(1, '1820200616021257.png', 1),
(2, '9620200616022140.png', 2),
(3, '6520200616022439.png', 3),
(4, '1020200616030908.png', 4),
(59, '1120200626054012.png', 59),
(6, '9520200616031321.png', 6),
(7, '1920200616031523.png', 7),
(8, '7320200616031708.png', 8),
(9, '9920200616031912.png', 9),
(10, '8720200616032058.png', 10),
(11, '8120200616032216.png', 11),
(12, '7220200616032310.png', 12),
(13, '8520200616032414.png', 13),
(14, '1320200616032620.png', 14),
(15, '6720200616032709.png', 15),
(16, '4020200616032821.png', 16),
(17, '7920200616032906.png', 17),
(18, '2920200616033234.png', 18),
(19, '6420200616033331.png', 19),
(20, '3320200616033517.png', 20),
(21, '9120200616033845.png', 21),
(22, '9520200616034130.png', 22),
(23, '3720200616034208.png', 23),
(24, '4420200616034313.png', 24),
(25, '1020200616034420.png', 25),
(26, '3620200616034524.png', 26),
(27, '9220200616034604.png', 27),
(28, '5120200616034653.png', 28),
(29, '1020200616034736.png', 29),
(30, '3620200616034836.png', 30),
(31, '5820200616034922.png', 31),
(32, '8520200616035114.png', 32),
(33, '5020200616035213.png', 33),
(34, '4220200616035300.png', 34),
(35, '3020200616035342.png', 35),
(36, '3420200616035417.png', 36),
(37, '4320200616035530.png', 37),
(38, '5220200616044307.png', 38),
(39, '7620200616044400.png', 39),
(40, '7420200616044506.png', 40),
(41, '5620200616044619.png', 41),
(42, '1220200616044657.png', 42),
(43, '3420200616044811.png', 43),
(44, '7520200616044850.png', 44),
(45, '5120200616044924.png', 45),
(46, '1520200616045008.png', 46),
(47, '3120200616045216.png', 47),
(48, '4820200616045321.png', 48),
(49, '5620200616045408.png', 49),
(50, '8620200616045454.png', 50),
(51, '7520200616045654.png', 51),
(52, '7820200616045843.png', 52),
(53, '7820200616045925.png', 53),
(54, '6120200616050047.png', 54),
(55, '9120200616050154.png', 55),
(56, '8220200616050235.png', 56),
(57, '7020200616050317.png', 57),
(58, '6420200616050347.png', 58),
(60, '8420200704120350.png', 78),
(61, '8520200704040241.png', 79);

-- --------------------------------------------------------

--
-- Table structure for table `product_has_params`
--

CREATE TABLE `product_has_params` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_deleted` int(1) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_has_params`
--

INSERT INTO `product_has_params` (`id`, `name`, `is_deleted`) VALUES
(1, 'Weight', 0),
(2, 'Color', 0),
(3, 'Size', 0),
(5, 'Litre', 0),
(6, 'Packet', 0),
(7, 'Piece', 0),
(8, 'Bunch', 0),
(9, 'Box', 0),
(10, 'Dips', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_params_values`
--

CREATE TABLE `product_params_values` (
  `id` int(11) NOT NULL,
  `param_id` int(11) NOT NULL,
  `param_value` varchar(255) NOT NULL,
  `is_deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_params_values`
--

INSERT INTO `product_params_values` (`id`, `param_id`, `param_value`, `is_deleted`) VALUES
(1, 1, 'gms', 0),
(2, 1, 'kg', 0),
(3, 3, 'S', 0),
(4, 3, 'M', 0),
(5, 3, 'X', 0),
(6, 3, 'L', 0),
(7, 5, 'ltr', 0),
(8, 5, 'ml', 0),
(9, 6, 'pc', 0),
(10, 6, 'Pack', 0),
(11, 10, 'Dips', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(11) NOT NULL,
  `review` varchar(255) NOT NULL,
  `star` int(5) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `heading` varchar(100) NOT NULL,
  `is_approved` int(2) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `review`, `star`, `product_id`, `user_id`, `heading`, `is_approved`) VALUES
(1, 'Fresh and natural', 5, 6, 1, 'Awesome Product Must Buy', 1);

-- --------------------------------------------------------

--
-- Table structure for table `seo`
--

CREATE TABLE `seo` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `slider2`
--

CREATE TABLE `slider2` (
  `id` int(11) NOT NULL,
  `is_show` int(1) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `slider2`
--

INSERT INTO `slider2` (`id`, `is_show`, `text`) VALUES
(1, 1, '12 june');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `is_show` int(1) NOT NULL,
  `image_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `is_show`, `image_name`) VALUES
(12, 1, '5720200707042950.jpeg'),
(13, 1, '4320200707043003.jpeg'),
(14, 1, '6720200707043018.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `opinion` varchar(500) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `is_show` int(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `title`, `opinion`, `image_name`, `is_show`, `date`) VALUES
(1, 'Ajay Tambe', 'CEO', 'Oplus provides authentic organic products with no compromise in quality. The vegetables are exceptionally fresh and delicious. I have been buying my weekly vegetable and fruit stock from Oplus since a while now and am completely satisfied. I would recommend organic produce to anyone and Oplus is one name I can vouch for.', '4220200703041846.jpg', 1, '2020-07-03 14:17:20'),
(7, 'Abhishek Jain', 'Sr Manager - Cognizant Tech Solutions', 'Hi this is regarding sayadri farm vegetables n fruits we ordered them veggies in lockdown they were really fresh n were neatly packed n delivered? They always took care of on time delivery n hassle free transaction.Thank u you all were seviour for us in lockdown times when it was difficult to go out n buy.Highly recommend them for fresh n nicely packed veggies n fruits?☺️', '7320200724070739.jpg', 1, '2020-07-24 19:07:39'),
(8, 'Shilpa Vinay Mundhada', 'Dwarka Sai Paradise, Pimple Saudagar', 'Health has always been of prime importance but due to current circumstances we all have been more focused towards our wellness and diet. However, getting quality fruits and vegetables (an essential part of our diet) during the lockdown was bit of a challenge until we came across team Oplus who started delivering everything straight from the farms at our doorstep. \r\n\r\nThey provide wide range of fruits and vegetables with excellent quality, packed professionally at competitive prices. Barring a fe', '9920200724071134.jpg', 1, '2020-07-24 19:11:34'),
(5, 'Neha Khede', 'Dynasty society', 'I just wanted to send a thank you, Oplus offers wonderful services..Vegetables and fruits are always fresh and packaging also good...I ordered every week from Oplus and got best items...In this lockdown period its hard to find fresh veggies and fruits but Oplus made our life easy by providing fresh veggies and fruits..More range of Exotic vegetables..I have been recommending your services to all my friends. HAPPY CUSTOMER?\r\nThank u OPLUS.', '6820200715054821.jpg', 1, '2020-07-15 17:48:21'),
(6, 'Dr. Sapna Kotwaliwale', 'Eye Surgeon', 'I have been buying from Oplus since a few months now. The freshness and quality of the vegetables provided by them are exceptionally good. Especially their range of exotic vegetables are rare to find here in India. Thank you Oplus for the service you provide.', '6620200715060303.jpg', 1, '2020-07-15 18:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile_no` bigint(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `pincode` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_verified` int(1) NOT NULL DEFAULT 0,
  `access_token` varchar(255) NOT NULL,
  `user_type` enum('prime','regular') NOT NULL DEFAULT 'regular',
  `is_deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile_no`, `address`, `pincode`, `password`, `is_verified`, `access_token`, `user_type`, `is_deleted`) VALUES
(1, 'Nilesh Lathe', 'lathe.nilesh@gmail.com', 918698511512, 'Vashi, Navi Mumbai, Maharashtra, India', 400703, 'e6e061838856bf47e1de730719fb2609', 1, '', 'regular', 0),
(2, 'Ajay', 'ajaytambe54321@gmail.com', 8390172726, '20,GEETAI NIWAS,MANIK NAGAR,STATION ROAD', 423701, '3e689235a815fd9273da4644491b3788', 1, '', 'regular', 0),
(3, 'Rohit Tambe', 'rohittambe107@gmail.com', 9420612107, 'Vaijapur', 423701, 'd41d8cd98f00b204e9800998ecf8427e', 1, '', 'regular', 0),
(4, 'Gauri', 'gthorat492k@gmail.com', 8806695021, 'Pune', 1234, 'd41d8cd98f00b204e9800998ecf8427e', 1, '', 'regular', 1),
(5, 'Sandip Patil', 'check@yahoo.co.us', 1234567890, 'SAME AS PRIMARY APPLICANT', 411033, 'd41d8cd98f00b204e9800998ecf8427e', 0, 'MgPQM26Lty', 'regular', 0),
(6, 'Sandip Patil', 'srpatil12@gmail.com', 1234567890, 'SAME AS PRIMARY APPLICANT', 411033, '9dce9f957b25f8580be63a2c6900146f', 1, '', 'regular', 0),
(7, 'samir shide', 'samir@gmail.com', 7972568989, 'pune', 123, 'd41d8cd98f00b204e9800998ecf8427e', 0, 'gWD5UPUURO', 'regular', 0),
(8, 'Gauri', 'dgaurithorat@gmail.com', 8806695021, 'Barshi', 0, 'd41d8cd98f00b204e9800998ecf8427e', 1, '', 'regular', 1),
(9, 'Sheetal', 'sheetal.patil77@gmail.com', 6303230906, 'Hyd', 0, 'd41d8cd98f00b204e9800998ecf8427e', 1, '', 'regular', 0),
(10, 'Fatima', 'fatima.s3190@gmail.com', 9773498682, 'F-903, Park Royale, Rahatni, Pimple Saudagar , Pune', 0, 'd41d8cd98f00b204e9800998ecf8427e', 0, 'K0FAYOsUzB', 'regular', 0),
(11, 'Neha', 'Starneha16@gmail.com', 9893175816, 'J 701,Dynasty,wakad,pune', 0, 'd41d8cd98f00b204e9800998ecf8427e', 0, 'Jsf7hAQUyq', 'regular', 0),
(12, 'Neha', 'herambkhede@gmail.com', 9893175816, 'J 701,Dynasty,wakad,pune', 0, 'd41d8cd98f00b204e9800998ecf8427e', 0, '7mLNrQIJ6R', 'regular', 0),
(13, 'Suchitra', 'soni_suchi30@yahoo.com', 7776994261, 'A5/603, whistling palms society wakad pune 47', 0, 'd41d8cd98f00b204e9800998ecf8427e', 1, '', 'regular', 0),
(14, 'Shelly', 'shellysureshjain@gmail.com', 9423072964, 'Malad', 0, 'd41d8cd98f00b204e9800998ecf8427e', 1, '', 'regular', 0),
(15, 'joker', 'joker@gmail.com', 8793300627, 'pune', 410201, '9facbf452def2d7efc5b5c48cdb837fa', 1, '', 'regular', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile_no` bigint(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `pincode` int(11) NOT NULL,
  `is_deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `name`, `mobile_no`, `address`, `street`, `city`, `state`, `pincode`, `is_deleted`) VALUES
(1, 1, 'Nilesh Lathe', 8698511512, '303 rajlaxmi', 'murbad road', 'Karjat', 'Maharashtra', 410201, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_subscription`
--

CREATE TABLE `user_subscription` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subscription_type` enum('prime') NOT NULL DEFAULT 'prime',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `valid_upto` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_subscription_history`
--

CREATE TABLE `user_subscription_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subscription_type` enum('prime') NOT NULL DEFAULT 'prime',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `valid_upto` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ad_sliders`
--
ALTER TABLE `ad_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_enquiry`
--
ALTER TABLE `contact_enquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_has_products`
--
ALTER TABLE `order_has_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pageandcontents`
--
ALTER TABLE `pageandcontents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pincodes`
--
ALTER TABLE `pincodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_has_images`
--
ALTER TABLE `products_has_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_has_params`
--
ALTER TABLE `product_has_params`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_params_values`
--
ALTER TABLE `product_params_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo`
--
ALTER TABLE `seo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider2`
--
ALTER TABLE `slider2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_subscription`
--
ALTER TABLE `user_subscription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_subscription_history`
--
ALTER TABLE `user_subscription_history`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ad_sliders`
--
ALTER TABLE `ad_sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `contact_enquiry`
--
ALTER TABLE `contact_enquiry`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_has_products`
--
ALTER TABLE `order_has_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pageandcontents`
--
ALTER TABLE `pageandcontents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `pincodes`
--
ALTER TABLE `pincodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `products_has_images`
--
ALTER TABLE `products_has_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `product_has_params`
--
ALTER TABLE `product_has_params`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_params_values`
--
ALTER TABLE `product_params_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seo`
--
ALTER TABLE `seo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slider2`
--
ALTER TABLE `slider2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_subscription`
--
ALTER TABLE `user_subscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_subscription_history`
--
ALTER TABLE `user_subscription_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
