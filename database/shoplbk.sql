-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2025 at 05:39 AM
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
-- Database: `cbpos_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `image_path`, `status`, `delete_flag`, `date_created`) VALUES
(1, 'L’Oreal', 'L’Oreal  manufactures and markets a wide range of skincare, makeup, fragrance, and hair care products', 'uploads/brands/1.jpg?v=1645066502', 1, 1, '2022-02-17 10:55:02'),
(2, 'test', 'test', NULL, 1, 1, '2022-02-17 10:57:41'),
(3, 'Nivea', 'Nivea manufactures and markets skin, sun, lip and deodorant products', 'uploads/brands/3.jpg?v=1645066772', 1, 1, '2022-02-17 10:59:32'),
(4, 'Olay', 'Olay manufactures and markets face and skin care products', 'uploads/brands/4.jpg?v=1645066818', 1, 1, '2022-02-17 11:00:18'),
(5, 'LUX', 'A global personal care brand by Unilever, Lux product categories include soaps, shower gels, bath products, shampoos, and conditioners. Lux is a strong advocate of sustainable causes and is sold in more than 100 countries worldwide.', 'uploads/brands/5.jpg?v=1645066872', 1, 1, '2022-02-17 11:01:12'),
(6, 'AVON', 'Avon is a direct sales company operating in the skin, body, fragrance, make-up, sun care and fashion markets. A leading company within the direct sales market, Avon has millions of beauty advisors worldwide and recently moved its headquarters from the U.S. to the UK.', 'uploads/brands/6.jpg?v=1645066909', 1, 1, '2022-02-17 11:01:49'),
(7, 'DGsdgsdg', 'ádrhwrthrthjtryj', NULL, 0, 1, '2025-03-19 11:10:16'),
(8, 'BBIA', '', NULL, 1, 0, '2025-03-19 11:23:07');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `delete_flag`, `date_created`) VALUES
(1, 'Skin Care', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi congue interdum pellentesque. Praesent bibendum vehicula libero a congue. In molestie rhoncus finibus.', 1, 1, '2022-02-17 11:27:11'),
(2, 'Oral Care', 'n interdum quis urna sed auctor. Vivamus a ligula ut dui aliquam efficitur ut eu ante. Phasellus pretium ut risus vitae euismod. Cras ac velit mollis, sodales urna vitae, pharetra dui. Mauris et sem vel est interdum lobortis sit amet quis felis.', 1, 1, '2022-02-17 11:27:24'),
(3, 'Body Care', 'n interdum quis urna sed auctor. Vivamus a ligula ut dui aliquam efficitur ut eu ante. Phasellus pretium ut risus vitae euismod. Cras ac velit mollis, sodales urna vitae, pharetra dui. Mauris et sem vel est interdum lobortis sit amet quis felis.', 0, 1, '2022-02-17 11:27:45'),
(4, 'Perfumes', 'Donec sit amet consectetur leo, eu lacinia risus. Donec dignissim magna lectus, vitae viverra lacus blandit vitae.', 1, 1, '2022-02-17 11:27:55'),
(5, 'Hair Care', 'Proin sit amet elit in massa posuere ullamcorper quis quis sem. Phasellus accumsan augue vitae varius rhoncus. Proin vitae leo ante. Praesent a lorem justo.', 1, 1, '2022-02-17 11:28:38'),
(6, 'Sun Care', 'Nam nisl ex, condimentum nec malesuada cursus, ullamcorper in velit. Quisque lobortis diam nunc, at auctor felis placerat eu. Nullam egestas rhoncus lacinia.', 1, 1, '2022-02-17 11:29:00'),
(7, 'Decorative', 'Donec imperdiet viverra eros eu elementum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean in nulla nec ex cursus consequat nec vel ipsum. Phasellus tristique erat sit amet neque venenatis volutpat. Maecenas varius venenatis sagittis.', 1, 1, '2022-02-17 11:29:19'),
(8, 'Lipsticks', 'Nullam quis gravida purus, quis sagittis nibh. Ut eget maximus nisl. Nam elementum diam libero, et scelerisque nisi molestie quis. Duis accumsan, neque nec laoreet malesuada, est ex pretium urna, at pellentesque arcu mauris a est. Proin et sollicitudin dui. Integer consectetur pulvinar tellus in fermentum.', 1, 1, '2022-02-17 11:29:38'),
(9, 'Lip Tint', 'Donec eu porttitor quam. Etiam mollis consequat risus quis maximus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', 1, 1, '2022-02-17 11:29:59'),
(10, 'test', 'test', 0, 1, '2022-02-17 11:31:18'),
(11, 'Trang điểm', '', 1, 0, '2025-03-19 11:21:45'),
(12, 'Chăm sóc da', '', 1, 0, '2025-03-19 11:21:55'),
(13, 'Chăm sóc cơ thể', '', 1, 0, '2025-03-19 11:22:00'),
(14, 'Chăm sóc tóc', '', 1, 0, '2025-03-19 11:22:05');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `status`, `delete_flag`, `date_created`) VALUES
(2, 'Samantha Jane', 'Miller', 'Nữ', '09123456789', 'sam23@sample.com', '45bff2a14658fc9b21c6e5e9bf75186b', 'Sample Address', 1, 0, '2022-02-17 14:24:00'),
(3, 'Mai Lê Bảo', 'Khánh', 'Nam', '0886771610', 'mailebaokhanh8888@gmail.com', '9a482ce2224cb0684c9cf14fedde0779', 'Khu Bộ tư lệnh thủ đô, Hà Đông, Hà Nội', 1, 0, '2025-03-19 10:42:55');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `variant` text NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `variant`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
(1, 'Variant 1', 1, 10, 155, '2022-02-17 11:57:52', NULL),
(2, 'Variant 2', 1, 5, 200, '2022-02-17 12:01:15', NULL),
(3, 'Variant 3', 1, 10, 1055.58, '2022-02-17 12:04:15', NULL),
(4, 'Variant 1', 3, 25, 250, '2022-02-17 13:22:54', NULL),
(5, 'Variant 2', 3, 25, 300, '2022-02-17 13:23:05', NULL),
(6, 'Variant 1', 4, 100, 350, '2022-02-17 16:28:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `ref_code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0 = pending,\r\n1= Packed,\r\n2 = Out for Delivery,\r\n3=Delivered,\r\n4=cancelled',
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `ref_code`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(3, '20220200001', 2, 'Sample Address', 'cod', 0, 900, 4, 0, '2022-02-17 14:51:58', '2022-02-17 15:04:38'),
(4, '20220200002', 2, 'Sample Address', 'Online Payment', 0, 1800, 3, 1, '2022-02-17 15:26:17', '2022-02-17 15:35:45'),
(5, '20220200003', 2, 'Sample Address', 'cod', 0, 500, 3, 1, '2022-02-17 15:32:52', '2025-03-18 22:25:51'),
(6, '20250300001', 3, 'Khu Bộ tư lệnh thủ đô, Hà Đông, Hà Nội', 'cod', 0, 1050, 3, 1, '2025-03-19 10:54:34', '2025-03-19 11:17:29');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `inventory_id`, `quantity`, `price`, `total`) VALUES
(4, 3, 3, 3, 300, 900),
(5, 4, 3, 4, 300, 1200),
(6, 4, 1, 3, 200, 600),
(7, 5, 3, 2, 250, 500),
(8, 6, 4, 3, 350, 1050);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `brand_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `specs` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `name`, `specs`, `status`, `delete_flag`, `date_created`) VALUES
(1, 6, 8, 'Sản phẩm 101', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;orem ipsum dolor sit amet, consectetur adipiscing elit. Morbi congue interdum pellentesque. Praesent bibendum vehicula libero a congue. In molestie rhoncus finibus. In interdum quis urna sed auctor. Vivamus a ligula ut dui aliquam efficitur ut eu ante. Phasellus pretium ut risus vitae euismod. Cras ac velit mollis, sodales urna vitae, pharetra dui. Mauris et sem vel est interdum lobortis sit amet quis felis. Donec sit amet consectetur leo, eu lacinia risus. Donec dignissim magna lectus, vitae viverra lacus blandit vitae.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;Proin sit amet elit in massa posuere ullamcorper quis quis sem. Phasellus accumsan augue vitae varius rhoncus. Proin vitae leo ante. Praesent a lorem justo. Nam nisl ex, condimentum nec malesuada cursus, ullamcorper in velit. Quisque lobortis diam nunc, at auctor felis placerat eu. Nullam egestas rhoncus lacinia.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;Donec imperdiet viverra eros eu elementum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean in nulla nec ex cursus consequat nec vel ipsum. Phasellus tristique erat sit amet neque venenatis volutpat. Maecenas varius venenatis sagittis. Nullam quis gravida purus, quis sagittis nibh. Ut eget maximus nisl. Nam elementum diam libero, et scelerisque nisi molestie quis. Duis accumsan, neque nec laoreet malesuada, est ex pretium urna, at pellentesque arcu mauris a est. Proin et sollicitudin dui. Integer consectetur pulvinar tellus in fermentum.&lt;/p&gt;', 1, 1, '2022-02-17 11:50:19'),
(2, 5, 7, 'test', '&lt;p&gt;test&lt;/p&gt;', 0, 1, '2022-02-17 11:54:02'),
(3, 1, 1, 'Sample 102', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;Donec eu porttitor quam. Etiam mollis consequat risus quis maximus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam pretium et mi vel fringilla. Phasellus facilisis porttitor purus, a egestas magna rutrum ac. Donec in augue lorem. Donec varius elit ante, eget convallis leo ornare faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed finibus purus eget porta malesuada. Phasellus eu cursus urna.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;Vestibulum quis velit ipsum. Sed placerat nisi leo, et aliquam massa laoreet at. Aenean fringilla nibh sit amet enim posuere, vitae vulputate turpis elementum. Mauris venenatis augue sed tincidunt efficitur. Praesent interdum odio sit amet lacus tincidunt vulputate. Sed pretium metus augue. Vivamus sed nisl ut metus accumsan interdum ac vel ante. Mauris ac placerat felis.&lt;/p&gt;', 1, 1, '2022-02-17 13:22:33'),
(4, 4, 8, 'Sample 103', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;Suspendisse vel justo tempus, dignissim augue vel, tempor ipsum. Sed at porta nisi. Aliquam dui neque, gravida id massa sed, aliquam tincidunt libero. Nunc dictum tristique luctus. Pellentesque id urna vitae orci imperdiet hendrerit ut ac ipsum. Integer convallis non nisi a aliquet. Aenean consequat, mauris non rhoncus molestie, nibh tortor gravida turpis, a finibus ante turpis non turpis. Proin varius condimentum ultricies. Sed vestibulum commodo elit, vitae fermentum ligula accumsan a. In lobortis turpis ut faucibus lobortis. Pellentesque quis vestibulum nibh. Integer eget metus quis nibh varius fringilla. Praesent ac eleifend ligula, vitae suscipit felis. Nulla facilisi. Nullam ligula enim, interdum et lobortis dignissim, auctor quis mi. Cras ut odio porta, iaculis est nec, maximus dui.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;Aenean eleifend arcu eu risus rutrum, at sollicitudin velit ultrices. Phasellus vulputate dictum lectus, eu cursus purus feugiat vel. In venenatis diam sem, sit amet congue lorem porttitor quis. Maecenas sit amet ante hendrerit, fermentum arcu sed, mollis dolor. Integer finibus ipsum eu libero tristique, eu venenatis mi fermentum. Nulla non nisl imperdiet, cursus ligula eu, feugiat mi. Integer ut porta leo, eu imperdiet nunc. Nullam maximus neque quis orci porttitor, ac commodo nibh convallis. Cras ac hendrerit lacus, ut maximus purus. Praesent hendrerit magna mi, vel consequat erat pulvinar id. Nam pharetra fringilla nunc. Proin aliquet justo sed massa pellentesque, in interdum arcu vulputate. Aliquam sed tempor libero, sit amet ultrices arcu. Nam sit amet lacinia risus. Etiam tellus purus, cursus a facilisis sed, pharetra id eros.&lt;/p&gt;', 1, 1, '2022-02-17 16:27:41'),
(5, 5, 3, 'Testadfadf', '&lt;p&gt;dfhsdfh&lt;/p&gt;', 1, 1, '2025-03-15 17:10:10'),
(6, 6, 3, 'sdfhsfdhsfghsfghfgykdfg', '&lt;p&gt;srthsh&lt;/p&gt;', 1, 1, '2025-03-15 17:10:22'),
(7, 8, 11, 'BBIA Son kem Last Velvet Lip Tint', '&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Son kem&amp;nbsp;BBIA Last Velvet Lip Tint&amp;nbsp;&lt;/span&gt;với&amp;nbsp;chất son đậm, b&aacute;m chặt như nam ch&acirc;m. Chỉ cần thoa 1 lớp l&agrave; m&agrave;u sẽ l&ecirc;n r&otilde; v&agrave; sống động C&aacute;c ph&acirc;n tử nhỏ li&ecirc;n kết chặt chẽ như phấn gi&uacute;p che đi những khuyết điểm cho bờ m&ocirc;i tươi tắn v&agrave; khỏe mạnh. Độ b&aacute;m m&agrave;u khủng, kh&ocirc;ng lo tr&ocirc;i son sau nhiều tiếng liền.&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Bảng m&agrave;u:&lt;/span&gt;&lt;/p&gt;&lt;ul style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Bbia Last Velvet Lip Tint Version 3:&amp;nbsp;&lt;/span&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;#11&lt;/span&gt;&amp;nbsp;Calm Boss&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;#12&amp;nbsp;&lt;/span&gt;Sweet Boss&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;#13&amp;nbsp;&lt;/span&gt;Serious Boss&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;#14&lt;/span&gt;&amp;nbsp;Chill Boss&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;#15&lt;/span&gt;&amp;nbsp;Egde Boss&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px; text-align: center;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px; text-align: center;&quot;&gt;&lt;img width=&quot;1&quot; height=&quot;1&quot; alt=&quot;&quot; nosrc=&quot;//file.hstatic.net/200000551679/file/-bbia-last-velvet-lip-tint-version-3-serious-boss-13-mau-cam-hong-dat3_d0db3a9a2b624d4ab016222cfc0998d8_grande.jpg&quot; src=&quot;https://file.hstatic.net/200000551679/file/-bbia-last-velvet-lip-tint-version-3-serious-boss-13-mau-cam-hong-dat3_d0db3a9a2b624d4ab016222cfc0998d8_grande.jpg&quot; style=&quot;max-width: 100%; width: auto; height: auto !important;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;/p&gt;&lt;ul style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Bbia Last Velvet Lip Tint Version 4&lt;/span&gt;:&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;#17&amp;nbsp;&lt;/span&gt;More Pleasan&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;#18&lt;/span&gt;&amp;nbsp;More Cheerful&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;#19&amp;nbsp;&lt;/span&gt;More Dazzling&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;#20&amp;nbsp;&lt;/span&gt;More Mature&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px; text-align: center;&quot;&gt;&lt;img width=&quot;1&quot; height=&quot;1&quot; alt=&quot;&quot; nosrc=&quot;//file.hstatic.net/200000551679/file/e04be3f022ef12cf07d1555c76649424_f8511cab94bb4ffc8ea3a438051a4b75_grande.jpg&quot; src=&quot;https://file.hstatic.net/200000551679/file/e04be3f022ef12cf07d1555c76649424_f8511cab94bb4ffc8ea3a438051a4b75_grande.jpg&quot; style=&quot;max-width: 100%; width: auto; height: auto !important;&quot;&gt;&lt;/p&gt;&lt;ul style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Bbia Last Velvet Lip Tint Version 5&lt;/span&gt;:&amp;nbsp;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;#21&amp;nbsp;&lt;/span&gt;Real Note&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;#22&amp;nbsp;&lt;/span&gt;Mellow Note&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;#23&amp;nbsp;&lt;/span&gt;Romantic Note&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;#24&amp;nbsp;&lt;/span&gt;Trendy Note&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;#25&amp;nbsp;&lt;/span&gt;Final Note&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img width=&quot;1&quot; height=&quot;1&quot; alt=&quot;&quot; nosrc=&quot;//file.hstatic.net/200000551679/file/322e76961886a521a867e7457d2c9067_070ee7df4b284a008b99cec5e18f57ea_grande.jpg&quot; src=&quot;https://file.hstatic.net/200000551679/file/322e76961886a521a867e7457d2c9067_070ee7df4b284a008b99cec5e18f57ea_grande.jpg&quot; style=&quot;max-width: 100%; width: auto; height: auto !important;&quot;&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Bbia Last Velvet Lip Tint Version 8&lt;/span&gt;:&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;#35&lt;/span&gt;&amp;nbsp;Feign Joy: Cam Nude&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;#36&lt;/span&gt;&amp;nbsp;Feign Cool: Hồng N&acirc;u&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;#38&lt;/span&gt;&amp;nbsp;Feign Fine: N&acirc;u Chocolate&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;#39&lt;/span&gt;&amp;nbsp;Feign Longing: Đỏ ớt&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px; text-align: center;&quot;&gt;&lt;img alt=&quot;BBIA Son kem Last Velvet Lip Tint 8&quot; width=&quot;1&quot; height=&quot;1&quot; nosrc=&quot;//file.hstatic.net/200000551679/file/son_bbia_last_velvet_tint_version_8_7f6e78339b0d44fb9521d57043ac5d80_grande.png&quot; src=&quot;https://file.hstatic.net/200000551679/file/son_bbia_last_velvet_tint_version_8_7f6e78339b0d44fb9521d57043ac5d80_grande.png&quot; style=&quot;max-width: 100%; width: auto; height: auto !important;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;/p&gt;&lt;ul style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Bbia Lip&amp;nbsp;Last Velvet Lip Tint Dusk Edition:&lt;/span&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;#45&lt;/span&gt;&amp;nbsp;So Good Brick: Đỏ N&acirc;u Gạch&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;#46&amp;nbsp;&lt;/span&gt;So Good Chili: Đỏ Ch&aacute;y&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px; text-align: center;&quot;&gt;&lt;img width=&quot;1&quot; height=&quot;1&quot; alt=&quot;&quot; nosrc=&quot;//file.hstatic.net/200000551679/file/untitled_design_5c4f09add9874ab6a314039dde209705_grande.png&quot; src=&quot;https://file.hstatic.net/200000551679/file/untitled_design_5c4f09add9874ab6a314039dde209705_grande.png&quot; style=&quot;max-width: 100%; width: auto; height: auto !important;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;C&ocirc;ng dụng:&lt;/span&gt;&lt;/p&gt;&lt;ul style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;li&gt;Th&acirc;n son bằng nhựa mờ cực kỳ tinh tế, sang chảnh.&lt;/li&gt;&lt;li&gt;M&ugrave;i thơm kẹo ngọt dễ chịu v&agrave; nữ t&iacute;nh, tạo cảm gi&aacute;c thoải m&aacute;i khi apply l&ecirc;n m&ocirc;i.&lt;/li&gt;&lt;li&gt;Chất son dạng mousse c&oacute; một ch&uacute;t b&oacute;ng nhẹ khi mới thoa nhưng sẽ để lại lớp finish l&igrave; tuyệt đẹp.&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Th&agrave;nh phần chi tiết:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;Dimethicone, Dimethicone/Vinyl Dimethicone Crosspolymer, Synthetic Fluorphlogopite, Polyglyceryl-2 Isostearate, Water, Isododecane, Polymethylsilsesquioxane, Cetyl Peg/Ppg-10/1 Dimethicone, Polymethyl Methacrylate, Cyclopentasiloxane, Trimethylsiloxysilicate, Vp/Hexadecene Copolymer, Sorbitan Sesquioleate, 1,2-Hexanediol, Peg-60 Hydrogenated Castor Oil, Disteardimonium Hectorite, Silica Dimethyl Silylate, Palmitic Acid, Stearic Acid, Propylene Carbonate, Ethylhexylglycerin, Phenoxyethanol, Ci 19140, Ci 16255, Ci 77491, Ci 77499, Ci 15850, Fragrance.&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Hướng dẫn sử dụng:&lt;/span&gt;&lt;/p&gt;&lt;ul style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;li&gt;Sử dụng kết hợp với c&aacute;c bước/ c&aacute;c sản phẩm trang điểm.&lt;/li&gt;&lt;li&gt;Tiến h&agrave;nh thoa son v&agrave;o l&ograve;ng m&ocirc;i v&agrave; d&ugrave;ng tay, cọ hoặc bặm m&ocirc;i để son được t&aacute;n đều tr&ecirc;n m&ocirc;i.&lt;/li&gt;&lt;li&gt;Thường xuy&ecirc;n tẩy tế b&agrave;o chết 2 lần mỗi tuần v&agrave; sử dụng son dưỡng trước khi thoa son m&ocirc;i.&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Bảo quản:&lt;/span&gt;&lt;/p&gt;&lt;ul style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;li&gt;Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t.&lt;/li&gt;&lt;li&gt;Tr&aacute;nh &aacute;nh nắng trực tiếp.&lt;/li&gt;&lt;li&gt;Đ&oacute;ng nắp sau khi sử dụng.&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Th&ocirc;ng số sản phẩm:&lt;/span&gt;&lt;/p&gt;&lt;ul style=&quot;color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 16px;&quot;&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Thương hiệu:&amp;nbsp;&lt;/span&gt;BBIA&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Xuất xứ:&amp;nbsp;&lt;/span&gt;H&agrave;n Quốc&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Nơi sản xuất:&amp;nbsp;&lt;/span&gt;H&agrave;n Quốc&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Khối lượng:&amp;nbsp;&lt;/span&gt;5g&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Hạn sử dụng:&lt;/span&gt;&amp;nbsp;2&amp;nbsp;năm kể từ ng&agrave;y sản xuất.&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Ng&agrave;y sản xuất:&amp;nbsp;&lt;/span&gt;Xem tr&ecirc;n bao b&igrave; sản phẩm.&lt;/li&gt;&lt;/ul&gt;', 1, 0, '2025-03-19 11:24:45');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(3, 3, 900, '2022-02-17 14:51:58'),
(4, 4, 1800, '2022-02-17 15:26:17'),
(5, 5, 500, '2022-02-17 15:32:52'),
(6, 6, 1050, '2025-03-19 10:54:34');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Cửa hàng mỹ phẩm LBK'),
(6, 'short_name', 'LBK Store'),
(11, 'logo', 'uploads/logo-1645065716.jpg?v=1645065716'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1645065725.jpg?v=1645065725');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'A', 'Quản trị viên', 'admin', '4297f44b13955235245b2497399d7a93', 'uploads/avatars/1.png?v=1645064505', NULL, 1, '2021-01-20 14:02:37', '2025-03-15 16:47:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_id` (`inventory_id`),
  ADD KEY `client_id` (`client_id`);

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
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_id` (`inventory_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
