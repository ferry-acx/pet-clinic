-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 22, 2022 at 04:55 AM
-- Server version: 5.7.40-cll-lve
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
-- Database: `accenzos_pet_clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `address`, `phone`, `email`) VALUES
(4, 'Juan de la Cruz', 'Tubigon', '091234567890', 'juan@mail.com'),
(6, 'Clara', 'Loon', '0912345678', 'clara@mail.com'),
(9, 'Dummy', 'Tubigon', '12341234', 'mydummy.2022.202@gmail.com'),
(10, 'Customer 1', 'Tubigon', '1234123', 'mydummy.2022.2021@gmail.com'),
(20, 'ferry', 'cebu', '23154', 'edpanferry@gmail.com'),
(21, 'Trial', 'Tubigon', '12345123123', 'mydummy.2022.2023@gmail.com'),
(30, 'iangabrielbasiodupa', 'Ilijan ragud', '09016537612537612537', 'iangabrielbasiodupa@gmail.com'),
(32, 'kokoy', 'cebu', '1724782365', 'ferry.edpan@bisu.edu.ph'),
(34, 'Wazzuo', 'Mananap', '4359494', 'mananap@gmail.com'),
(36, 'Mark Jerome', 'Kinabag-an, Calape, Bohol', '09052986531', 'talatagodmj@gmail.com'),
(37, 'Secret', 'secret', '091685734810', 'aquarius.pink27@gmail.com'),
(38, 'Lecde', 'Tubigon', '9636459888', 'pikablue12277@gmail.com'),
(40, 'Bullfrog', 'Tubigonians - A', '09361652609', 'kennbassist@gmail.com'),
(41, 'BullFrog Master', 'Calape', '09361652609', 'kennsecusana@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `decline_info`
--

CREATE TABLE `decline_info` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `note` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `decline_info`
--

INSERT INTO `decline_info` (`id`, `event_id`, `note`) VALUES
(9, 53, 'Not attended'),
(10, 54, 'Not attended'),
(11, 55, 'A'),
(12, 60, 'asd'),
(13, 61, 'Not attended'),
(14, 62, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `address`, `phone`, `email`) VALUES
(1, 'administrator', 'Bliss Site, San Isidro, Calape, Bohol', '09123456789', 'admin@mail.com'),
(16, 'cashier', 'tubigon', '09872635', 'cashier@mail.com'),
(17, 'dert', 'tubigon', '456789', 'pawtomz456@gmail.com'),
(18, 'clint', 'tubigon', '0909123456', 'clint@mail.com'),
(19, 'Ferry Edpan', 'Loon', '02934857', 'ferryedpan@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `appt_code` varchar(200) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `color` varchar(7) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'FOR APPROVAL',
  `isPersonal` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `appt_code`, `customer_id`, `title`, `description`, `color`, `start`, `end`, `status`, `isPersonal`) VALUES
(49, 'XQHP-6089', 4, 'Checkup', 'Shaggy Checkup', '#0071c5', '2022-10-19 00:00:00', '2022-10-20 00:00:00', 'DONE', 'false'),
(52, 'OPZL-6903', 9, 'Checkup', 'trial', '#FF8C00', '2022-11-08 16:00:00', '2022-11-08 16:00:00', 'DONE', 'false'),
(53, 'VZEI-2190', 21, 'Checkup', 'Foot Injury', '#0071c5', '2022-11-16 00:00:00', '2022-11-17 00:00:00', 'CANCELLED', 'false'),
(54, 'HLIY-3592', 30, 'Palibangon akong iro', 'naa koy iro nga si \"dugy\" di malibang', '#40E0D0', '2022-11-16 00:00:00', '2022-11-17 00:00:00', 'DECLINED', 'true'),
(55, 'AXNK-3270', 21, 'Checkup', 'Ear checkup', '#FF0000', '2022-11-17 00:00:00', '2022-11-18 00:00:00', 'CANCELLED', 'false'),
(56, 'CMZQ-6432', 21, 'asdas', 'asd', '#0071c5', '2022-11-18 00:00:00', '2022-11-19 00:00:00', 'PENDING', 'true'),
(57, 'EBSR-7648', 21, 'asd', 'aaaa', '#008000', '2022-11-18 00:00:00', '2022-11-19 00:00:00', 'PENDING', 'true'),
(58, 'FIBA-1256', 21, 'aasdsd', 'aasdas', '#40E0D0', '2022-11-21 08:00:00', '2022-11-21 10:30:00', 'PENDING', 'false'),
(59, 'JHIL-7590', 21, 'asdfasdf', 'asdfsadf', '#0071c5', '2022-11-25 00:00:00', '2022-11-26 00:00:00', 'PENDING', 'false'),
(60, 'PCVL-5269', 21, 'asdfasdf', 'asdfasdf', '#0071c5', '2022-11-18 00:00:00', '2022-11-19 00:00:00', 'CANCELLED', 'false'),
(61, 'JOQT-3824', 21, 'Checkup', 'wala ra', '#0071c5', '2022-11-20 12:00:00', '2022-11-20 12:30:00', 'DECLINED', 'false'),
(62, 'OXTW-2514', 21, 'Test', 'Test', '#0071c5', '2022-11-24 00:00:00', '2022-11-25 00:00:00', 'CANCELLED', 'false'),
(63, 'BYXR-6845', 21, 'Test', 'Test', '#0071c5', '2022-11-23 00:00:00', '2022-11-24 00:00:00', 'PENDING', 'true'),
(64, 'VMWS-8469', 20, 'ugiytb', 'ev5', '#0071c5', '2022-11-29 00:00:00', '2022-12-02 00:00:00', 'PENDING', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) NOT NULL DEFAULT 'UNPAID',
  `date_paid` datetime DEFAULT CURRENT_TIMESTAMP,
  `payment_method` varchar(200) DEFAULT 'CASH',
  `ref_num` varchar(200) DEFAULT 'N/A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `code`, `customer_id`, `date`, `status`, `date_paid`, `payment_method`, `ref_num`) VALUES
(56, 'LQWF-6480', 4, '2022-10-19 07:45:26', 'PAID', '2022-10-19 08:01:02', 'GCash', 'B87V68B90-NU8U'),
(58, 'BFUS-0157', 4, '2022-10-20 09:28:06', 'PAID', '2022-10-20 10:05:43', 'Cash', 'N/A'),
(59, 'YFCL-3046', 6, '2022-10-20 09:32:17', 'PAID', '2022-11-03 05:42:28', 'GCash', '09123456789'),
(65, 'TCWZ-8926', 4, '2022-11-04 01:35:12', 'PAID', '2022-11-04 07:58:25', 'Cash', 'N/A'),
(66, 'FJYV-7285', 9, '2022-11-08 07:19:45', 'PAID', '2022-11-08 07:20:13', 'Check', '123123'),
(67, 'ICKV-5741', 10, '2022-11-08 02:39:51', 'PAID', '2022-11-08 02:41:27', 'Cash', 'N/A'),
(73, 'AMXE-2364', 21, '2022-11-17 08:51:56', 'PAID', '2022-11-19 01:23:51', 'Cash', 'N/A'),
(74, 'ANBG-6984', 20, '2022-11-18 07:51:48', 'PAID', '2022-11-19 05:05:50', 'Cash', 'N/A'),
(75, 'XNGE-3750', 37, '2022-11-19 03:46:46', 'UNPAID', '2022-11-19 03:46:46', 'CASH', 'N/A'),
(76, 'BAHF-6752', 6, '2022-11-19 05:38:40', 'PAID', '2022-11-19 05:42:23', 'Cash', 'N/A'),
(77, 'XESM-4721', 20, '2022-11-19 05:50:57', 'UNPAID', '2022-11-19 05:50:57', 'CASH', 'N/A'),
(78, 'JOZU-5463', 21, '2022-11-20 18:15:23', 'UNPAID', '2022-11-20 18:15:23', 'CASH', 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `qty`, `total`) VALUES
(71, 56, 7, 2, 2964),
(72, 56, 9, 1, 3080),
(74, 58, 10, 4, 1000),
(75, 59, 9, 1, 3080),
(86, 65, 7, 2, 2964),
(87, 66, 12, 1, 250),
(88, 66, 10, 2, 500),
(89, 66, 7, 3, 4446),
(90, 67, 12, 2, 500),
(91, 67, 11, 2, 1978),
(103, 73, 8, 106, 29574),
(104, 74, 7, 1, 1482),
(105, 74, 11, 1, 989),
(106, 74, 12, 2, 500),
(107, 75, 7, 1, 1482),
(109, 76, 12, 2, 500),
(113, 78, 18, 2, 2000),
(114, 78, 12, 1, 250),
(118, 77, 18, 1, 1000),
(120, 77, 10, 3, 750);

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  `owner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`id`, `name`, `type`, `owner_id`) VALUES
(4, 'Shaggy', 'Dog', 4),
(5, 'Kitty', 'Cat', 5),
(6, 'Luna', 'Dog', 4),
(7, 'Coco', 'Bird', 5),
(8, 'Bogoy', 'Dinosaur', 8);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `code` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `img` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `category` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'INSTOCK'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `code`, `name`, `img`, `description`, `category`, `price`, `stock`, `status`) VALUES
(7, 'IBXW-3185', 'PEDIGREE Adult Dog Food', 'pedigree.jpg', 'Dry Dog Food in Chicken & Vegetable Flavor, 10kg. Pet Food for Complete & Balanced Nutrition', 'Pet Food', 1482, 87, 'INSTOCK'),
(8, 'HXIB-7820', 'Whiskas Adult Ocean Fish', 'whiska.png', 'Whiskas Adult Wet Food with Ocean Fish is made with a specific active ingredient and a specially designed kibble. It provides a gentle abrasive effect to help clean your cat\'s teeth and support healthy gums.', 'Pet Food', 279, 0, 'INSTOCK'),
(9, 'UXCP-8153', 'K9 Power Show Stopper', 'k9.png', 'A dog coat and skin nutritional supplement full of the key nutrients they may be missing from their diet.', 'Vitamins', 3080, 200, 'INSTOCK'),
(10, 'SHDJ-5268', 'SEPTAFINE DROPS for PET', 'septafine.jpg', 'Septafine drops for pets are an excellent remedy that reduces the pus formation in the body and heals the injury or internal wound fast.', 'Vitamins', 250, 289, 'INSTOCK'),
(11, 'VANK-1459', 'Feeder Bowl', 'picture.jpg', 'Pet feeder', 'Others', 989, 36, 'TRASH'),
(12, 'MHQC-6157', 'Dog Soap', 'OIP.jpeg', 'It happens to the best of us. Itâ€™s bath time for your dog but you forgot to buy some more dog shampoo. You think, maybe just this once, Iâ€™ll use my Herbal Essence human shampoo. If youâ€™re in a bind, you can, but it is not good for your dog. Hereâ€™s the scoop on bath time for your pet and the 10 best dog soaps to use.', 'Others', 250, 272, 'INSTOCK'),
(17, 'HKTZ-8745', 'test', 'k9.jpg', 'test', 'Pet Food', 356, 32, 'TRASH'),
(18, 'BUMY-7296', 'Feeder Bowl', 'picture.jpg', 'Feeder Bowl for dog or cat Etc', 'Others', 1000, 197, 'INSTOCK');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `bill` double NOT NULL,
  `date_paid` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) NOT NULL DEFAULT 'UNPAID',
  `ref_num` varchar(200) NOT NULL DEFAULT 'N/A',
  `payment_method` varchar(200) NOT NULL DEFAULT 'Cash'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `event_id`, `bill`, `date_paid`, `status`, `ref_num`, `payment_method`) VALUES
(6, 49, 7000, '2022-10-19 07:42:02', 'PAID', 'YCC78BB8-HTB', 'GCash'),
(7, 52, 2000, '2022-11-08 07:24:25', 'PAID', 'N/A', 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` longtext NOT NULL,
  `role` varchar(10) NOT NULL,
  `status` varchar(200) NOT NULL DEFAULT 'PENDING CONFIRMATION',
  `profile` varchar(255) NOT NULL DEFAULT 'avatar.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `status`, `profile`) VALUES
(1, 'admin@mail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'admin', 'ACTIVE', 'avatar.png'),
(3, 'juan@mail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'customer', 'ACTIVE', 'avatar.png'),
(30, 'clara@mail.com', '570408c57a52e1f085701af843affa82', 'customer', 'ACTIVE', 'avatar.png'),
(32, 'cashier@mail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'cashier', 'ACTIVE', 'avatar.png'),
(33, 'pawtomz456@gmail.com', '912ec803b2ce49e4a541068d495ab570', 'admin', 'ACTIVE', 'avatar.png'),
(37, 'ferryedpan@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'admin', 'ACTIVE', 'avatar.png'),
(38, 'mydummy.2022.202@gmail.com', '956eba5dd6e02ae9e08cc287442267e9', 'customer', 'ACTIVE', 'avatar.png'),
(39, 'mydummy.2022.2021@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'customer', 'ACTIVE', 'avatar.png'),
(49, 'edpanferry@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'customer', 'ACTIVE', 's31.jpg'),
(50, 'mydummy.2022.2023@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'customer', 'ACTIVE', 'Screenshot_20221116-220936.png'),
(59, 'iangabrielbasiodupa@gmail.com', 'a983e2409759a6246acb885a5e535b24', 'customer', 'ACTIVE', 'incursion3.jpg'),
(61, 'ferry.edpan@bisu.edu.ph', '81dc9bdb52d04dc20036dbd8313ed055', 'customer', 'ACTIVE', 'avatar.png'),
(63, 'mananap@gmail.com', '134d01d854d09c18c61c5300e4db1acc', 'customer', 'PENDING CONFIRMATION', 'avatar.png'),
(65, 'talatagodmj@gmail.com', '05e35bffcd7d658396004ff61403f641', 'customer', 'ACTIVE', 'avatar.png'),
(66, 'aquarius.pink27@gmail.com', '5d7845ac6ee7cfffafc5fe5f35cf666d', 'customer', 'ACTIVE', 'avatar.png'),
(67, 'pikablue12277@gmail.com', '42f749ade7f9e195bf475f37a44cafcb', 'customer', 'ACTIVE', 'avatar.png'),
(69, 'kennbassist@gmail.com', '963a645a0b92674ccf3c623f8302589a', 'customer', 'PENDING CONFIRMATION', 'avatar.png'),
(70, 'kennsecusana@gmail.com', '1223b8c30a347321299611f873b449ad', 'customer', 'ACTIVE', 'avatar.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `decline_info`
--
ALTER TABLE `decline_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
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
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `decline_info`
--
ALTER TABLE `decline_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
