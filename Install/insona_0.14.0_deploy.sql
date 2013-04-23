-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 04 月 23 日 15:59
-- 服务器版本: 5.5.25
-- PHP 版本: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `insona`
--

-- --------------------------------------------------------

--
-- 表的结构 `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  `hyperlink` varchar(100) NOT NULL,
  `hidden` tinyint(3) unsigned NOT NULL,
  `updateline` int(10) unsigned NOT NULL,
  `createline` int(10) unsigned NOT NULL,
  `customline` int(10) unsigned NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `coverpath` char(26) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_banner_cid_idx` (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `banner`
--

INSERT INTO `banner` (`id`, `cid`, `title`, `hyperlink`, `hidden`, `updateline`, `createline`, `customline`, `priority`, `coverpath`) VALUES
(1, 6, 'Slide1', 'http://www.baidu.com', 1, 1366725308, 1366724852, 1366724852, 0, '2013/17/5176915a1361c.JPG'),
(2, 6, 'slide2', 'http://www.baidu.com', 1, 1366725453, 1366725434, 1366725434, 0, '2013/17/5176934c2fa96.JPG');

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` int(10) unsigned NOT NULL,
  `name` varchar(15) NOT NULL,
  `fullname` varchar(45) NOT NULL,
  `priority` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`cid`, `fid`, `name`, `fullname`, `priority`) VALUES
(1, 0, '产品展示', '', 1),
(2, 0, '产品驱动', '', 2),
(3, 0, '三方驱动', '', 3),
(4, 0, '资料下载', '', 4),
(5, 0, 'Banner', '', 5),
(6, 5, '主页', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `company_member`
--

CREATE TABLE IF NOT EXISTS `company_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` char(40) NOT NULL,
  `hidden` tinyint(3) unsigned NOT NULL,
  `createline` int(10) unsigned NOT NULL,
  `birthday` int(10) unsigned NOT NULL,
  `phone` varchar(20) NOT NULL,
  `company` varchar(60) NOT NULL,
  `idcard` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `install_type` varchar(60) NOT NULL,
  `install_way` varchar(60) NOT NULL,
  `license_cover` char(26) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `company_member`
--

INSERT INTO `company_member` (`id`, `email`, `username`, `password`, `hidden`, `createline`, `birthday`, `phone`, `company`, `idcard`, `country`, `city`, `address`, `install_type`, `install_way`, `license_cover`) VALUES
(3, 'minowu@foxmail.com', '吴启成', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, 1366719188, 628099200, '13862531169', '米想网络', '320525198911270919', 'china', 'suzhou', '仁爱路1号高博国际中心', '轻型商用', '网络安装', '2013/17/51767cd16cd72.JPG'),
(6, 'mino.wu@methink.cn', '吴启成2', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, 1366720206, 628099200, '13862531169', '苏州市米想网络信息技术邮箱公司', '320525198911270919', 'china', 'suzhou', '17Dong', '住宅', '上门服务', '2013/17/51767ece6f48d.JPG');

-- --------------------------------------------------------

--
-- 表的结构 `download`
--

CREATE TABLE IF NOT EXISTS `download` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `link` varchar(200) NOT NULL,
  `is_vip` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT ' /* comment truncated */',
  `hidden` tinyint(3) unsigned NOT NULL,
  `createline` int(10) unsigned NOT NULL,
  `updateline` int(10) unsigned NOT NULL,
  `coverpath` char(26) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_download_cid_idx` (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `download`
--

INSERT INTO `download` (`id`, `cid`, `title`, `content`, `link`, `is_vip`, `hidden`, `createline`, `updateline`, `coverpath`) VALUES
(1, 4, '非会员1', '<p>下载吧</p>\r\n', 'https://google.com', 0, 1, 1366615995, 1366618481, '2013/17/5174e7d99e9ff.JPG'),
(2, 4, '会员1', '<p>nihao</p>\r\n', 'http://www.baidu.com', 1, 1, 1366616577, 1366618493, '2013/17/5174f17c5ad76.JPG'),
(3, 4, '未命名', '', '', 0, 1, 1366617872, 1366618501, '2013/17/5174f18497f46.JPG'),
(4, 4, '未命名', '', '', 0, 1, 1366617877, 1366618510, '2013/17/5174f18dcbc15.JPG'),
(5, 4, '未命名', '', '', 0, 1, 1366617880, 1366618517, '2013/17/5174f193e13ed.JPG'),
(6, 4, '未命名', '', '', 0, 1, 1366617884, 1366618525, '2013/17/5174f19c5b0e0.JPG');

-- --------------------------------------------------------

--
-- 表的结构 `driver`
--

CREATE TABLE IF NOT EXISTS `driver` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `driver_category_id` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  `link` varchar(100) NOT NULL,
  `hidden` tinyint(3) unsigned NOT NULL,
  `createline` int(10) unsigned NOT NULL,
  `updateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_driver_driver_id_idx` (`driver_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `driver`
--

INSERT INTO `driver` (`id`, `driver_category_id`, `title`, `link`, `hidden`, `createline`, `updateline`) VALUES
(1, 1, '系列1', 'http://www.baidu.com', 1, 1366551224, 1366552294);

-- --------------------------------------------------------

--
-- 表的结构 `driver_category`
--

CREATE TABLE IF NOT EXISTS `driver_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `hidden` tinyint(3) unsigned NOT NULL,
  `createline` int(10) unsigned NOT NULL,
  `updateline` int(10) unsigned NOT NULL,
  `coverpath` char(26) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_driver_category_cid_idx` (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `driver_category`
--

INSERT INTO `driver_category` (`id`, `cid`, `title`, `content`, `hidden`, `createline`, `updateline`, `coverpath`) VALUES
(1, 2, '产品驱动1', '', 1, 1366550926, 1366550984, '2013/16/5173e9c6b8c25.JPG'),
(2, 2, '产品驱动2', '', 1, 1366551013, 1366551023, '2013/16/5173e9ed73c2e.JPG');

-- --------------------------------------------------------

--
-- 表的结构 `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(26) NOT NULL,
  `basepath` char(16) NOT NULL,
  `typepath` char(1) NOT NULL,
  `subpath` char(8) NOT NULL,
  `savepath` char(26) NOT NULL,
  `saverule` char(13) NOT NULL,
  `originalname` varchar(100) NOT NULL,
  `type` varchar(30) NOT NULL,
  `extension` char(4) NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `thumbname` varchar(50) NOT NULL,
  `updateline` int(10) unsigned NOT NULL,
  `createline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `image`
--

INSERT INTO `image` (`id`, `name`, `basepath`, `typepath`, `subpath`, `savepath`, `saverule`, `originalname`, `type`, `extension`, `size`, `thumbname`, `updateline`, `createline`) VALUES
(1, '2013/16/516fff54a945f.jpg', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '516fff54a945f', 'banner_001.jpg', 'application/octet-stream', 'jpg', 643763, 'thumb', 1366294356, 1366294356),
(2, '2013/16/5170006a32dfd.jpg', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5170006a32dfd', 'banner_002.jpg', 'application/octet-stream', 'jpg', 419657, 'thumb', 1366294634, 1366294634),
(3, '2013/16/517001ad732eb.jpg', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '517001ad732eb', 'banner_002.jpg', 'application/octet-stream', 'jpg', 419657, '392x422', 1366294957, 1366294957),
(4, '2013/16/5170069c700ba.jpg', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5170069c700ba', 'banner_003.jpg', 'application/octet-stream', 'jpg', 543855, '392x422', 1366296220, 1366296220),
(5, '2013/16/5170073458e53.JPG', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5170073458e53', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '392x422', 1366296372, 1366296372),
(6, '2013/16/51700742a9af3.JPG', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '51700742a9af3', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '392x422', 1366296386, 1366296386),
(7, '2013/16/51700758caed9.JPG', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '51700758caed9', 'product_002.JPG', 'application/octet-stream', 'JPG', 70136, '392x422', 1366296408, 1366296408),
(8, '2013/16/5170ffd302006.JPG', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5170ffd302006', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '392x422', 1366360019, 1366360019),
(9, '2013/16/5172b55bbf7aa.JPG', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5172b55bbf7aa', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '392x422', 1366472027, 1366472027),
(10, '2013/16/5172b8b6ee681.JPG', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5172b8b6ee681', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '215x100', 1366472887, 1366472887),
(11, '2013/16/5172b8cce9cd1.JPG', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5172b8cce9cd1', 'product_002.JPG', 'application/octet-stream', 'JPG', 70136, '215x100', 1366472908, 1366472908),
(12, '2013/16/5172bc96606f5.JPG', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5172bc96606f5', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '392x422', 1366473878, 1366473878),
(13, '2013/16/5172bca4645c6.JPG', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5172bca4645c6', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '392x422', 1366473892, 1366473892),
(14, '2013/16/5172bcb507963.JPG', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5172bcb507963', 'product_002.JPG', 'application/octet-stream', 'JPG', 70136, '392x422', 1366473909, 1366473909),
(15, '2013/16/5172bddac164b.JPG', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5172bddac164b', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '215x100', 1366474202, 1366474202),
(16, '2013/16/5173ab1d28c4c.JPG', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5173ab1d28c4c', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '392x422', 1366534941, 1366534941),
(17, '2013/16/5173abd1cced5.JPG', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5173abd1cced5', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '215x100', 1366535121, 1366535121),
(18, '2013/16/5173e0d71f6af.JPG', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5173e0d71f6af', 'product_002.JPG', 'application/octet-stream', 'JPG', 70136, '215x100', 1366548695, 1366548695),
(19, '2013/16/5173e0e6acb10.JPG', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5173e0e6acb10', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '215x100', 1366548710, 1366548710),
(20, '2013/16/5173e9aab9938.JPG', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5173e9aab9938', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '150x170', 1366550954, 1366550954),
(21, '2013/16/5173e9c6b8c25.JPG', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5173e9c6b8c25', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '150x170', 1366550982, 1366550982),
(22, '2013/16/5173e9ed73c2e.JPG', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5173e9ed73c2e', 'product_002.JPG', 'application/octet-stream', 'JPG', 70136, '150x170', 1366551021, 1366551021),
(23, '2013/16/5173f2a638e95.png', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5173f2a638e95', 'three_002.png', 'application/octet-stream', 'png', 4651, 'thumb', 1366553254, 1366553254),
(24, '2013/16/5173f313ea775.png', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5173f313ea775', 'three_002.png', 'application/octet-stream', 'png', 4651, '166x60', 1366553363, 1366553363),
(25, '2013/16/5173f352ce8fb.png', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5173f352ce8fb', 'Untitled-1.png', 'application/octet-stream', 'png', 2786, '166x60', 1366553426, 1366553426),
(26, '2013/16/5173f4ad68db2.JPG', './upload/images/', 'o', '2013/16/', './upload/images/o/2013/16/', '5173f4ad68db2', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '208x193', 1366553773, 1366553773),
(27, '2013/17/51742863b4bdd.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '51742863b4bdd', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '208x193', 1366567011, 1366567011),
(28, '2013/17/51742876e2ed4.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '51742876e2ed4', 'product_002.JPG', 'application/octet-stream', 'JPG', 70136, '208x193', 1366567030, 1366567030),
(29, '2013/17/5174288540336.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5174288540336', 'product_002.JPG', 'application/octet-stream', 'JPG', 70136, '208x193', 1366567045, 1366567045),
(30, '2013/17/51742af1930af.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '51742af1930af', 'product_002.JPG', 'application/octet-stream', 'JPG', 70136, '166x60,332x120', 1366567665, 1366567665),
(31, '2013/17/51742af6931aa.png', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '51742af6931aa', 'Untitled-1.png', 'application/octet-stream', 'png', 2786, '166x60,332x120', 1366567670, 1366567670),
(32, '2013/17/51742b102cfb0.png', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '51742b102cfb0', 'Untitled-1.png', 'application/octet-stream', 'png', 2786, '166x60', 1366567696, 1366567696),
(33, '2013/17/5174e7d99e9ff.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5174e7d99e9ff', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '290x156', 1366616025, 1366616025),
(34, '2013/17/5174f17c5ad76.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5174f17c5ad76', 'product_002.JPG', 'application/octet-stream', 'JPG', 70136, '290x156', 1366618492, 1366618492),
(35, '2013/17/5174f18497f46.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5174f18497f46', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '290x156', 1366618500, 1366618500),
(36, '2013/17/5174f18dcbc15.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5174f18dcbc15', 'product_002.JPG', 'application/octet-stream', 'JPG', 70136, '290x156', 1366618509, 1366618509),
(37, '2013/17/5174f193e13ed.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5174f193e13ed', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '290x156', 1366618515, 1366618515),
(38, '2013/17/5174f19c5b0e0.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5174f19c5b0e0', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '290x156', 1366618524, 1366618524),
(39, '2013/17/51767c5caedab.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '51767c5caedab', 'product_001.JPG', 'image/jpeg', 'JPG', 80783, '', 1366719580, 1366719580),
(40, '2013/17/51767cd16cd72.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '51767cd16cd72', 'product_001.JPG', 'image/jpeg', 'JPG', 80783, '', 1366719697, 1366719697),
(41, '2013/17/51767ece6f48d.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '51767ece6f48d', 'product_001.JPG', 'image/jpeg', 'JPG', 80783, '', 1366720206, 1366720206),
(42, '2013/17/5176915a1361c.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5176915a1361c', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '1680x445', 1366724954, 1366724954),
(43, '2013/17/5176934c2fa96.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5176934c2fa96', 'product_002.JPG', 'application/octet-stream', 'JPG', 70136, '1680x445', 1366725452, 1366725452);

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_driver_id` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `price` decimal(12,2) unsigned NOT NULL,
  `link` varchar(200) NOT NULL,
  `hidden` tinyint(3) unsigned NOT NULL,
  `createline` int(10) unsigned NOT NULL,
  `updateline` int(10) unsigned NOT NULL,
  `coverpath` char(26) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_view_product_driver_id_idx` (`product_driver_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`id`, `product_driver_id`, `title`, `content`, `price`, `link`, `hidden`, `createline`, `updateline`, `coverpath`) VALUES
(1, 1, '接收器产品', '<p>北京是中华人民共和国首都、中央直辖市、中国第二大城市、中国国家中心城市，中国政治、文化、科教和国际交流中心，同时是中国经济金融的决策中心和管理中心。[1]其最早见于文献的名称为&ldquo;蓟&rdquo;。北京位于华北平原北端，东南与天津相连，其余为河北省所环绕。北京有着3000余年的建城史和778年的建都史，贞元元年，金朝皇帝海陵王完颜亮正式建都于北京，称为中都，在今北京市西南。此后元朝、明朝、清朝的都城均建立于此。[2]与西安、洛阳、南京并称中国&ldquo;四大古都&rdquo;，拥有6项世界遗产，是世界上拥有文化遗产项目数最多的城市，具有一定的国际影响力，也是世界上最大的城市之一。[3]北京交通发达，是中国最大的铁路、公路及航空交通中心，拥有完善的城市交通网。</p>\r\n', 0.00, '', 1, 1366474161, 1366538579, '2013/16/5172bddac164b.JPG'),
(2, 1, '接收器产品2', '<p>nihao</p>\r\n', 0.00, '', 1, 1366535108, 1366535123, '2013/16/5173abd1cced5.JPG'),
(15, 1, '未命名', '', 0.00, '', 1, 1366538581, 1366548711, '2013/16/5173e0e6acb10.JPG'),
(16, 1, '超级接收器4', '', 0.00, '', 1, 1366548627, 1366548697, '2013/16/5173e0d71f6af.JPG');

-- --------------------------------------------------------

--
-- 表的结构 `product_category`
--

CREATE TABLE IF NOT EXISTS `product_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `hidden` tinyint(3) unsigned NOT NULL,
  `createline` int(10) unsigned NOT NULL,
  `updateline` int(10) unsigned NOT NULL,
  `coverpath` char(26) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_driver_cid_idx` (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `product_category`
--

INSERT INTO `product_category` (`id`, `cid`, `title`, `content`, `hidden`, `createline`, `updateline`, `coverpath`) VALUES
(1, 1, '接收器', '', 1, 1366473869, 1366473880, '2013/16/5172bc96606f5.JPG'),
(2, 1, '接收器2', '', 1, 1366473884, 1366473910, '2013/16/5172bcb507963.JPG'),
(3, 1, '接收器3', '<p>你好，我是接收器3</p>\r\n', 1, 1366534920, 1366534943, '2013/16/5173ab1d28c4c.JPG');

-- --------------------------------------------------------

--
-- 表的结构 `support`
--

CREATE TABLE IF NOT EXISTS `support` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `product` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `hidden` tinyint(3) unsigned NOT NULL,
  `createline` int(10) unsigned NOT NULL,
  `updateline` int(10) unsigned NOT NULL,
  `unread` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `support`
--

INSERT INTO `support` (`id`, `title`, `product`, `content`, `hidden`, `createline`, `updateline`, `unread`) VALUES
(4, '测试一下', '接收器产品', '内容', 0, 1366724193, 1366724193, 0);

-- --------------------------------------------------------

--
-- 表的结构 `third`
--

CREATE TABLE IF NOT EXISTS `third` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `third_category_id` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `link` varchar(100) NOT NULL,
  `hidden` tinyint(3) unsigned NOT NULL,
  `createline` int(10) unsigned NOT NULL,
  `updateline` int(10) unsigned NOT NULL,
  `coverpath` char(26) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_third_third_category_id_idx` (`third_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `third`
--

INSERT INTO `third` (`id`, `third_category_id`, `title`, `content`, `link`, `hidden`, `createline`, `updateline`, `coverpath`) VALUES
(1, 1, '索尼功放', '<p><span style="color: rgb(153, 153, 153); font-family: 微软雅黑; line-height: 22px;">苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。</span></p>\r\n', 'http://www.google.com', 1, 1366553707, 1366553838, '2013/16/5173f4ad68db2.JPG'),
(2, 1, '索尼功放2', '<p>nihao</p>\r\n', 'ss', 1, 1366566992, 1366567013, '2013/17/51742863b4bdd.JPG'),
(3, 1, '索尼功放3', '<p>nihao</p>\r\n', 'nihao', 1, 1366567019, 1366567032, '2013/17/51742876e2ed4.JPG'),
(4, 1, '索尼功放4', '<p><span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px; background-color: rgb(245, 245, 245);">索尼功放</span></p>\r\n', 'sadafw', 1, 1366567035, 1366567046, '2013/17/5174288540336.JPG');

-- --------------------------------------------------------

--
-- 表的结构 `third_category`
--

CREATE TABLE IF NOT EXISTS `third_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `hidden` tinyint(3) unsigned NOT NULL,
  `createline` int(10) unsigned NOT NULL,
  `updateline` int(10) unsigned NOT NULL,
  `coverpath` char(26) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_third_category_cid_idx` (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `third_category`
--

INSERT INTO `third_category` (`id`, `cid`, `title`, `content`, `hidden`, `createline`, `updateline`, `coverpath`) VALUES
(1, 3, '索尼', '<p><span style="color: rgb(153, 153, 153); font-family: 微软雅黑; line-height: 22px;">苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员</span></p>\r\n', 1, 1366553197, 1366567699, '2013/17/51742b102cfb0.png');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` char(40) NOT NULL,
  `createline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role_user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 限制导出的表
--

--
-- 限制表 `banner`
--
ALTER TABLE `banner`
  ADD CONSTRAINT `fk_banner_cid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `download`
--
ALTER TABLE `download`
  ADD CONSTRAINT `fk_download_cid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `fk_driver_driver_category_id` FOREIGN KEY (`driver_category_id`) REFERENCES `driver_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `driver_category`
--
ALTER TABLE `driver_category`
  ADD CONSTRAINT `fk_driver_category_cid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_view_product_driver_id` FOREIGN KEY (`product_driver_id`) REFERENCES `product_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `fk_product_driver_cid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `third`
--
ALTER TABLE `third`
  ADD CONSTRAINT `fk_third_third_category_id` FOREIGN KEY (`third_category_id`) REFERENCES `third_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `third_category`
--
ALTER TABLE `third_category`
  ADD CONSTRAINT `fk_third_category_cid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `fk_user_role_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
