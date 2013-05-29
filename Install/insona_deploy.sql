-- phpMyAdmin SQL Dump
-- version 4.0.2
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 05 月 29 日 13:25
-- 服务器版本: 5.5.29-0ubuntu0.12.04.2
-- PHP 版本: 5.3.10-1ubuntu3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `insona`
--
CREATE DATABASE IF NOT EXISTS `insona` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `insona`;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `banner`
--

INSERT INTO `banner` (`id`, `cid`, `title`, `hyperlink`, `hidden`, `updateline`, `createline`, `customline`, `priority`, `coverpath`) VALUES
(4, 6, '未命名', '', 1, 1367033557, 1367033480, 1367033480, 0, '2013/17/517b46b0c6d83.jpg'),
(6, 6, '未命名', '', 1, 1367033644, 1367033597, 1367033597, 0, '2013/17/517b470babce7.jpg'),
(7, 6, '未命名', '', 1, 1367033690, 1367033648, 1367033648, 0, '2013/17/517b473f5ad18.jpg'),
(8, 6, '未命名', '', 1, 1367060096, 1367060081, 1367060081, 0, '2013/17/517bae7e36cb6.jpg');

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
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `company_member`
--

INSERT INTO `company_member` (`id`, `email`, `username`, `password`, `hidden`, `createline`, `birthday`, `phone`, `company`, `idcard`, `country`, `city`, `address`, `install_type`, `install_way`, `license_cover`) VALUES
(12, 'huajieyu002@yeah.net', 'summer', '0c556588b3ce4ee8f79ae7eabdd674adcf76a66b', 1, 1367059872, 0, '13814575252', '但纷纷', '320522199002170021', 'china', '  地方', '的房顶上', '轻型商用', '网络安装', '2013/17/517bada105cbf.jpg'),
(13, '418984481@qq.com', 'lynn', '20eabe5d64b0e216796e834f52d61fd0b70332fc', 1, 1367938597, 587660400, '15295654604', 'asdasda', 'adasdsadad', 'china', 'sf', 'sfsf', '住宅', '上门服务', ''),
(14, '15161970797@163.com', '陈彦榕', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, 1367980438, 690048000, '416545643121', '睿智嘉创', '3245365348634563', 'china', '苏州', '卫道观前', '轻型商用', '上门服务', '2013/19/5189b9962a8b9.jpg'),
(15, '18862126265@163.com', '陈刚开会', 'a19549e4bed474b8091839e4bcccae0efa73320a', 1, 1367984454, 690048000, '8824033423', '发到空间啦', '3245', 'china', '发达', '发达省份都', '轻型商用', '上门服务', '2013/19/5189c946af5ab.jpg'),
(16, 'riconing@126.com', 'riconing', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, 1368034166, 247766400, '18914045909', 'wisdom', '130702197711080310', 'china', 'suzhou', 'suzhou', '住宅', '上门服务', '2013/19/518a8b76cf142.jpg');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `download`
--

INSERT INTO `download` (`id`, `cid`, `title`, `content`, `link`, `is_vip`, `hidden`, `createline`, `updateline`, `coverpath`) VALUES
(11, 4, '驱动说明书', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。<br />\r\n公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员,在智能家居高端产品的运用和开发，有着先进的实践经验。</p>\r\n', ' http://www.baidu.com', 1, 1, 1366990742, 1367062888, '2013/17/517bb966aa788.jpg'),
(12, 4, '驱动说明书', '', 'http://www.baidu.com', 1, 1, 1367060020, 1367062930, '2013/17/517bb9919405e.jpg'),
(13, 4, '驱动说明书', '', 'http://www.baidu.com', 0, 1, 1367062941, 1367062957, '2013/17/517bb9acbb02a.jpg'),
(14, 4, '驱动说明书', '', 'http://www.baidu.com', 0, 1, 1367062959, 1367062974, '2013/17/517bb9bd411a8.jpg'),
(15, 4, '驱动说明书', '', 'http://www.baidu.com', 0, 1, 1367062996, 1367063009, '2013/17/517bb9e0c8ef4.jpg'),
(16, 4, '驱动说明书', '', 'http://www.baidu.com', 0, 1, 1367063011, 1367063029, '2013/17/517bb9f4a6b41.jpg'),
(17, 4, '未命名', '', 'http://www.baidu.com', 1, 1, 1367063052, 1367063063, '2013/17/517bba1664456.jpg'),
(18, 4, '未命名', '', '', 0, 0, 1367982837, 1367982837, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `driver`
--

INSERT INTO `driver` (`id`, `driver_category_id`, `title`, `link`, `hidden`, `createline`, `updateline`) VALUES
(1, 1, '系列1', 'http://www.baidu.com', 1, 1366551224, 1366552294),
(2, 1, '系列2', '', 1, 1366791813, 1366791817),
(3, 3, '系列1', '爱的', 1, 1366879270, 1366879284),
(4, 3, '系列2', '', 1, 1366879288, 1367061440),
(5, 3, '系列3', '', 1, 1366879500, 1367061432),
(8, 1, '系列3', '', 1, 1367061233, 1367061248),
(9, 6, '系列1', '', 1, 1367061499, 1367061503);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `driver_category`
--

INSERT INTO `driver_category` (`id`, `cid`, `title`, `content`, `hidden`, `createline`, `updateline`, `coverpath`) VALUES
(1, 2, '索尼功放-02系', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员......</p>\r\n', 1, 1366550926, 1367061204, '2013/17/517a966281e6e.JPG'),
(3, 2, '索尼功放系', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员......</p>\r\n', 1, 1366879041, 1367061401, '2013/17/517bb3983ffa7.jpg'),
(6, 2, '电机', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员......</p>\r\n', 1, 1366990698, 1367061487, '2013/17/517bb3ee258bf.jpg'),
(7, 2, '索尼功能01', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员......</p>\r\n', 1, 1367063436, 1367063476, '2013/17/517bbbb19e758.jpg'),
(8, 2, '未命名', '', 0, 1367982852, 1367982852, '');

-- --------------------------------------------------------

--
-- 表的结构 `forget`
--

CREATE TABLE IF NOT EXISTS `forget` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(32) NOT NULL,
  `email` varchar(100) NOT NULL,
  `createline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `forget`
--

INSERT INTO `forget` (`id`, `code`, `email`, `createline`) VALUES
(2, '517a9a4546e96', 'kuwangyilin@sohu.com', 1367938323),
(3, '517bc587eb01e', 'huajieyu002@yeah.net', 1368033926),
(4, '51891672b9eed', '418984481@qq.com', 1367938674),
(5, '5189c57bb2400', '15161970797@163.com', 1367983483),
(6, '518a8b890612a', 'riconing@126.com', 1368034185);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=153 ;

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
(43, '2013/17/5176934c2fa96.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5176934c2fa96', 'product_002.JPG', 'application/octet-stream', 'JPG', 70136, '1680x445', 1366725452, 1366725452),
(44, '2013/17/51779634e3687.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '51779634e3687', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '392x422', 1366791733, 1366791733),
(45, '2013/17/517796c860f53.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517796c860f53', '20300000009075132223273561435.jpg', 'application/octet-stream', 'jpg', 26688, '208x193', 1366791880, 1366791880),
(46, '2013/17/5178d5c25fc4b.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178d5c25fc4b', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '208x193', 1366873538, 1366873538),
(47, '2013/17/5178d5d2bce60.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178d5d2bce60', 'banner_001.jpg', 'application/octet-stream', 'jpg', 643763, '208x193', 1366873554, 1366873554),
(48, '2013/17/5178e0add7ded.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178e0add7ded', 'banner_001.jpg', 'application/octet-stream', 'jpg', 643763, '1680x445', 1366876333, 1366876333),
(49, '2013/17/5178e0e2255c8.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178e0e2255c8', 'banner_002.jpg', 'application/octet-stream', 'jpg', 419657, '1680x445', 1366876386, 1366876386),
(50, '2013/17/5178e11927924.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178e11927924', 'banner_001.jpg', 'application/octet-stream', 'jpg', 643763, '1680x445', 1366876441, 1366876441),
(51, '2013/17/5178e2e7a5ef7.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178e2e7a5ef7', 'product_001.jpg', 'application/octet-stream', 'jpg', 80783, '392x422', 1366876903, 1366876903),
(52, '2013/17/5178e331e660b.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178e331e660b', 'drive_001.jpg', 'application/octet-stream', 'jpg', 14740, '392x422', 1366876977, 1366876977),
(53, '2013/17/5178e3c6baeee.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178e3c6baeee', 'product_002.jpg', 'application/octet-stream', 'jpg', 70136, '392x422', 1366877126, 1366877126),
(54, '2013/17/5178e3ed44f27.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178e3ed44f27', 'drive_003.jpg', 'application/octet-stream', 'jpg', 8672, '392x422', 1366877165, 1366877165),
(55, '2013/17/5178e41082728.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178e41082728', 'product_003.jpg', 'application/octet-stream', 'jpg', 41496, '392x422', 1366877200, 1366877200),
(56, '2013/17/5178e44b4924a.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178e44b4924a', 'banner_001.jpg', 'application/octet-stream', 'jpg', 643763, '392x422', 1366877259, 1366877259),
(57, '2013/17/5178e5532d65d.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178e5532d65d', 'product1_003.jpg', 'application/octet-stream', 'jpg', 5862, '215x100', 1366877523, 1366877523),
(58, '2013/17/5178e95aa7de6.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178e95aa7de6', 'banner_002.jpg', 'application/octet-stream', 'jpg', 419657, '215x100', 1366878554, 1366878554),
(59, '2013/17/5178ea25ee828.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178ea25ee828', '9.jpg', 'image/jpeg', 'jpg', 21212, '', 1366878757, 1366878757),
(60, '2013/17/5178eb5f232a6.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178eb5f232a6', 'drive_001.jpg', 'application/octet-stream', 'jpg', 14740, '150x170', 1366879071, 1366879071),
(61, '2013/17/5178ecb2d9b7d.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178ecb2d9b7d', 'drive_002.jpg', 'application/octet-stream', 'jpg', 13103, '150x170', 1366879410, 1366879410),
(62, '2013/17/5178ecd12b68e.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178ecd12b68e', 'three_inside_003.jpg', 'application/octet-stream', 'jpg', 10668, '150x170', 1366879441, 1366879441),
(63, '2013/17/5178ee45f2b0b.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178ee45f2b0b', 'drive_001.jpg', 'application/octet-stream', 'jpg', 14740, '208x193', 1366879813, 1366879813),
(64, '2013/17/5178eed9281ae.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178eed9281ae', 'product_002.jpg', 'application/octet-stream', 'jpg', 70136, '208x193', 1366879961, 1366879961),
(65, '2013/17/5178efc59603c.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178efc59603c', 'we_004.JPG', 'application/octet-stream', 'JPG', 33421, '290x156', 1366880197, 1366880197),
(66, '2013/17/5178f0153a548.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178f0153a548', 'product_010.jpg', 'application/octet-stream', 'jpg', 4131, '290x156', 1366880277, 1366880277),
(67, '2013/17/5178f0a13aec5.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178f0a13aec5', 'product1_003.jpg', 'application/octet-stream', 'jpg', 5862, '290x156', 1366880417, 1366880417),
(68, '2013/17/5178f63d57d63.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178f63d57d63', 'banner_002.jpg', 'application/octet-stream', 'jpg', 419657, '290x156', 1366881853, 1366881853),
(69, '2013/17/5178fd5cde378.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '5178fd5cde378', 'product2_001.jpg', 'application/octet-stream', 'jpg', 50670, '215x100', 1366883676, 1366883676),
(70, '2013/17/517a468a312b6.gif', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517a468a312b6', 'page_004.gif', 'image/gif', 'gif', 1199, '', 1366967946, 1366967946),
(71, '2013/17/517a495db4881.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517a495db4881', 'product_001.jpg', 'application/octet-stream', 'jpg', 80783, '166x60', 1366968669, 1366968669),
(72, '2013/17/517a68764a770.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517a68764a770', '20300000009075132223273561435.jpg', 'application/octet-stream', 'jpg', 26688, '166x60', 1366976630, 1366976630),
(73, '2013/17/517a689222ade.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517a689222ade', 'banner_002.jpg', 'application/octet-stream', 'jpg', 419657, '166x60', 1366976658, 1366976658),
(74, '2013/17/517a68c44ace2.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517a68c44ace2', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '166x60', 1366976708, 1366976708),
(75, '2013/17/517a6f1ed7f8b.gif', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517a6f1ed7f8b', 'page_002.gif', 'image/gif', 'gif', 1208, '', 1366978334, 1366978334),
(76, '2013/17/517a960d01a15.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517a960d01a15', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '215x100', 1366988301, 1366988301),
(77, '2013/17/517a9619d9884.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517a9619d9884', 'product_012.jpg', 'application/octet-stream', 'jpg', 94924, '680width', 1366988313, 1366988313),
(78, '2013/17/517a966281e6e.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517a966281e6e', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '150x170', 1366988386, 1366988386),
(79, '2013/17/517a967a107d7.png', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517a967a107d7', 'Untitled-1.png', 'application/octet-stream', 'png', 2786, '166x60', 1366988410, 1366988410),
(80, '2013/17/517a9682bfb7a.png', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517a9682bfb7a', 'Untitled-1.png', 'application/octet-stream', 'png', 2786, '166x60', 1366988418, 1366988418),
(81, '2013/17/517a9713cc233.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517a9713cc233', '20300000009075132223273561435.jpg', 'image/jpeg', 'jpg', 26688, '', 1366988563, 1366988563),
(82, '2013/17/517a99fe65279.gif', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517a99fe65279', 'index_005.gif', 'image/gif', 'gif', 2367, '', 1366989310, 1366989310),
(83, '2013/17/517a9dc35cfb5.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517a9dc35cfb5', 'drive_001.jpg', 'application/octet-stream', 'jpg', 14740, '392x422', 1366990275, 1366990275),
(84, '2013/17/517a9dd8a147e.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517a9dd8a147e', 'product_001.jpg', 'application/octet-stream', 'jpg', 80783, '392x422', 1366990296, 1366990296),
(85, '2013/17/517a9e172fe61.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517a9e172fe61', 'index_002.jpg', 'application/octet-stream', 'jpg', 16476, '215x100', 1366990359, 1366990359),
(86, '2013/17/517a9e28a0123.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517a9e28a0123', 'product1_001.jpg', 'application/octet-stream', 'jpg', 6863, '215x100', 1366990376, 1366990376),
(87, '2013/17/517a9e36f241b.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517a9e36f241b', 'product2_001.jpg', 'application/octet-stream', 'jpg', 50670, '680width', 1366990391, 1366990391),
(88, '2013/17/517a9ed2b3c6f.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517a9ed2b3c6f', 'product_002.jpg', 'application/octet-stream', 'jpg', 70136, '392x422', 1366990546, 1366990546),
(89, '2013/17/517a9fba63f97.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517a9fba63f97', 'we_004.JPG', 'application/octet-stream', 'JPG', 33421, '290x156', 1366990778, 1366990778),
(90, '2013/17/517aa1d824cae.png', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517aa1d824cae', 'Untitled-1.png', 'application/octet-stream', 'png', 2786, '166x60', 1366991320, 1366991320),
(91, '2013/17/517aa1e4a2de9.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517aa1e4a2de9', 'banner_002.jpg', 'application/octet-stream', 'jpg', 419657, '166x60', 1366991332, 1366991332),
(92, '2013/17/517aa3614c35f.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517aa3614c35f', 'three_inside_003.jpg', 'application/octet-stream', 'jpg', 10668, '215x100', 1366991713, 1366991713),
(93, '2013/17/517aa36d4cfc0.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517aa36d4cfc0', 'product2_001.jpg', 'application/octet-stream', 'jpg', 50670, '680width', 1366991725, 1366991725),
(94, '2013/17/517b46b0c6d83.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517b46b0c6d83', 'banner_001.jpg', 'application/octet-stream', 'jpg', 643763, '1680x445', 1367033520, 1367033520),
(95, '2013/17/517b470babce7.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517b470babce7', 'banner_002.jpg', 'application/octet-stream', 'jpg', 419657, '1680x445', 1367033611, 1367033611),
(96, '2013/17/517b473f5ad18.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517b473f5ad18', 'banner_003.jpg', 'application/octet-stream', 'jpg', 543855, '1680x445', 1367033663, 1367033663),
(97, '2013/17/517b9b69dc524.JPG', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517b9b69dc524', 'product_001.JPG', 'application/octet-stream', 'JPG', 80783, '215x100,470x350', 1367055209, 1367055209),
(98, '2013/17/517b9b7c6fa5f.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517b9b7c6fa5f', 'product_012.jpg', 'application/octet-stream', 'jpg', 94924, '680width', 1367055228, 1367055228),
(99, '2013/17/517bada105cbf.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bada105cbf', '_1x.jpg', 'image/jpeg', 'jpg', 193065, '', 1367059873, 1367059873),
(100, '2013/17/517badfd47420.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517badfd47420', 'product_003.jpg', 'application/octet-stream', 'jpg', 41496, '392x422', 1367059965, 1367059965),
(101, '2013/17/517bae41ea5c0.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bae41ea5c0', '_1x.jpg', 'application/octet-stream', 'jpg', 193065, '290x156', 1367060033, 1367060033),
(102, '2013/17/517bae7e36cb6.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bae7e36cb6', '100.jpg', 'application/octet-stream', 'jpg', 356199, '1680x445', 1367060094, 1367060094),
(103, '2013/17/517bafa3c17b4.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bafa3c17b4', 'product1_002.jpg', 'application/octet-stream', 'jpg', 5527, '215x100,470x350', 1367060387, 1367060387),
(104, '2013/17/517baff930862.png', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517baff930862', 'powerpoint.png', 'application/octet-stream', 'png', 133748, '215x100,470x350', 1367060473, 1367060473),
(105, '2013/17/517bafffb1c13.png', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bafffb1c13', 'powerpoint.png', 'application/octet-stream', 'png', 133748, '680width', 1367060479, 1367060479),
(106, '2013/17/517bb0026b217.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb0026b217', 'product2_001.jpg', 'application/octet-stream', 'jpg', 50670, '215x100,470x350', 1367060482, 1367060482),
(107, '2013/17/517bb07a12289.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb07a12289', 'product_012.jpg', 'application/octet-stream', 'jpg', 94924, '680width', 1367060602, 1367060602),
(108, '2013/17/517bb0ce1da74.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb0ce1da74', 'product_012.jpg', 'application/octet-stream', 'jpg', 94924, '680width', 1367060686, 1367060686),
(109, '2013/17/517bb10537d64.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb10537d64', 'product_012.jpg', 'application/octet-stream', 'jpg', 94924, '680width', 1367060741, 1367060741),
(110, '2013/17/517bb1f7c0287.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb1f7c0287', 'product_012.jpg', 'application/octet-stream', 'jpg', 94924, '680width', 1367060983, 1367060983),
(111, '2013/17/517bb3983ffa7.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb3983ffa7', 'drive_002.jpg', 'application/octet-stream', 'jpg', 13103, '150x170', 1367061400, 1367061400),
(112, '2013/17/517bb3ee258bf.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb3ee258bf', 'product_003.jpg', 'application/octet-stream', 'jpg', 41496, '150x170', 1367061486, 1367061486),
(113, '2013/17/517bb4e312af9.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb4e312af9', 'banner_001.jpg', 'application/octet-stream', 'jpg', 643763, '166x60', 1367061731, 1367061731),
(114, '2013/17/517bb60cce349.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb60cce349', 'three_003.jpg', 'application/octet-stream', 'jpg', 3083, '166x60', 1367062028, 1367062028),
(115, '2013/17/517bb61d8a7bb.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb61d8a7bb', 'three_004.jpg', 'application/octet-stream', 'jpg', 2808, '166x60', 1367062045, 1367062045),
(116, '2013/17/517bb65541619.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb65541619', 'three_004.jpg', 'application/octet-stream', 'jpg', 2808, '166x60', 1367062101, 1367062101),
(117, '2013/17/517bb6657aaa6.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb6657aaa6', 'three_002.jpg', 'application/octet-stream', 'jpg', 3196, '166x60', 1367062117, 1367062117),
(118, '2013/17/517bb6a280d8d.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb6a280d8d', 'three_002.jpg', 'application/octet-stream', 'jpg', 3196, '166x60', 1367062178, 1367062178),
(119, '2013/17/517bb6d21d14d.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb6d21d14d', 'three_002.jpg', 'application/octet-stream', 'jpg', 3196, '166x60', 1367062226, 1367062226),
(120, '2013/17/517bb7414cee5.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb7414cee5', 'three_002.jpg', 'application/octet-stream', 'jpg', 3196, '166x60', 1367062337, 1367062337),
(121, '2013/17/517bb810b6250.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb810b6250', 'three_inside_001.jpg', 'application/octet-stream', 'jpg', 19611, '208x193', 1367062544, 1367062544),
(122, '2013/17/517bb858cd302.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb858cd302', 'banner_001.jpg', 'application/octet-stream', 'jpg', 643763, '680width', 1367062616, 1367062616),
(123, '2013/17/517bb85c3010d.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb85c3010d', 'three_inside_002.jpg', 'application/octet-stream', 'jpg', 14931, '208x193', 1367062620, 1367062620),
(124, '2013/17/517bb8bc3477d.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb8bc3477d', 'three_inside_003.jpg', 'application/octet-stream', 'jpg', 10668, '208x193', 1367062716, 1367062716),
(125, '2013/17/517bb8dd45028.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb8dd45028', 'three_inside_001.jpg', 'application/octet-stream', 'jpg', 19611, '208x193', 1367062749, 1367062749),
(126, '2013/17/517bb966aa788.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb966aa788', 'down_002.jpg', 'application/octet-stream', 'jpg', 2613, '290x156', 1367062886, 1367062886),
(127, '2013/17/517bb9919405e.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb9919405e', 'down_002.jpg', 'application/octet-stream', 'jpg', 2613, '290x156', 1367062929, 1367062929),
(128, '2013/17/517bb9acbb02a.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb9acbb02a', 'down_002.jpg', 'application/octet-stream', 'jpg', 2613, '290x156', 1367062956, 1367062956),
(129, '2013/17/517bb9bd411a8.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb9bd411a8', 'down_002.jpg', 'application/octet-stream', 'jpg', 2613, '290x156', 1367062973, 1367062973),
(130, '2013/17/517bb9e0c8ef4.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb9e0c8ef4', 'down_002.jpg', 'application/octet-stream', 'jpg', 2613, '290x156', 1367063008, 1367063008),
(131, '2013/17/517bb9f4a6b41.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bb9f4a6b41', 'down_002.jpg', 'application/octet-stream', 'jpg', 2613, '290x156', 1367063028, 1367063028),
(132, '2013/17/517bba1664456.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bba1664456', 'down_002.jpg', 'application/octet-stream', 'jpg', 2613, '290x156', 1367063062, 1367063062),
(133, '2013/17/517bbac0caa0b.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bbac0caa0b', 'drive_001.jpg', 'application/octet-stream', 'jpg', 14740, '392x422', 1367063232, 1367063232),
(134, '2013/17/517bbad66f7af.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bbad66f7af', 'product_001.jpg', 'application/octet-stream', 'jpg', 80783, '392x422', 1367063254, 1367063254),
(135, '2013/17/517bbb1df1023.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bbb1df1023', 'product1_004.jpg', 'application/octet-stream', 'jpg', 10776, '215x100,470x350', 1367063326, 1367063326),
(136, '2013/17/517bbb4675546.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bbb4675546', 'product1_005.jpg', 'application/octet-stream', 'jpg', 12517, '215x100,470x350', 1367063366, 1367063366),
(137, '2013/17/517bbb5feda59.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bbb5feda59', 'product1_001.jpg', 'application/octet-stream', 'jpg', 6863, '215x100,470x350', 1367063392, 1367063392),
(138, '2013/17/517bbb71cc6b6.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bbb71cc6b6', 'product1_003.jpg', 'application/octet-stream', 'jpg', 5862, '215x100,470x350', 1367063409, 1367063409),
(139, '2013/17/517bbbb19e758.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bbbb19e758', 'drive_001.jpg', 'application/octet-stream', 'jpg', 14740, '150x170', 1367063473, 1367063473),
(140, '2013/17/517bbbe10a5a3.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bbbe10a5a3', 'three_002.jpg', 'application/octet-stream', 'jpg', 3196, '166x60', 1367063521, 1367063521),
(141, '2013/17/517bf54628d98.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bf54628d98', '5.jpg', 'application/octet-stream', 'jpg', 8701, '166x60', 1367078214, 1367078214),
(142, '2013/17/517bf7b88fd7b.jpg', './upload/images/', 'o', '2013/17/', './upload/images/o/2013/17/', '517bf7b88fd7b', 'three_002.jpg', 'application/octet-stream', 'jpg', 3196, '166x60', 1367078840, 1367078840),
(143, '2013/19/51871f54eeb77.JPG', './upload/images/', 'o', '2013/19/', './upload/images/o/2013/19/', '51871f54eeb77', 'IMG_0011.JPG', 'application/octet-stream', 'JPG', 59861, '250x44', 1367809877, 1367809877),
(144, '2013/19/5189195331d53.jpg', './upload/images/', 'o', '2013/19/', './upload/images/o/2013/19/', '5189195331d53', 'banner_002.jpg', 'application/octet-stream', 'jpg', 419657, '166x60', 1367939411, 1367939411),
(145, '2013/19/518919916e722.jpg', './upload/images/', 'o', '2013/19/', './upload/images/o/2013/19/', '518919916e722', 'three_002.jpg', 'application/octet-stream', 'jpg', 3196, '166x60', 1367939473, 1367939473),
(146, '2013/19/5189b9962a8b9.jpg', './upload/images/', 'o', '2013/19/', './upload/images/o/2013/19/', '5189b9962a8b9', '模特.jpg', 'image/pjpeg', 'jpg', 56179, '', 1367980438, 1367980438),
(147, '2013/19/5189c946af5ab.jpg', './upload/images/', 'o', '2013/19/', './upload/images/o/2013/19/', '5189c946af5ab', '未命名.jpg', 'image/pjpeg', 'jpg', 221060, '', 1367984454, 1367984454),
(148, '2013/19/518a88f6bab95.jpg', './upload/images/', 'o', '2013/19/', './upload/images/o/2013/19/', '518a88f6bab95', 'product_012.jpg', 'application/octet-stream', 'jpg', 94924, '680width', 1368033526, 1368033526),
(149, '2013/19/518a89025aac0.jpg', './upload/images/', 'o', '2013/19/', './upload/images/o/2013/19/', '518a89025aac0', 'product1_001.jpg', 'application/octet-stream', 'jpg', 6863, '215x100,475x386', 1368033538, 1368033538),
(150, '2013/19/518a892bbb735.jpg', './upload/images/', 'o', '2013/19/', './upload/images/o/2013/19/', '518a892bbb735', 'product2_002.jpg', 'application/octet-stream', 'jpg', 48795, '215x100,475x386', 1368033579, 1368033579),
(151, '2013/19/518a895458f57.jpg', './upload/images/', 'o', '2013/19/', './upload/images/o/2013/19/', '518a895458f57', 'drive_001.jpg', 'application/octet-stream', 'jpg', 14740, '215x100,475x386', 1368033620, 1368033620),
(152, '2013/19/518a8b76cf142.jpg', './upload/images/', 'o', '2013/19/', './upload/images/o/2013/19/', '518a8b76cf142', '201003171035273568.jpg', 'image/pjpeg', 'jpg', 34621, '', 1368034166, 1368034166);

-- --------------------------------------------------------

--
-- 表的结构 `introduction`
--

CREATE TABLE IF NOT EXISTS `introduction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `hidden` tinyint(3) unsigned NOT NULL,
  `createline` int(10) unsigned NOT NULL,
  `updateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `introduction`
--

INSERT INTO `introduction` (`id`, `title`, `content`, `hidden`, `createline`, `updateline`) VALUES
(1, '公司简介', '<p><span style="line-height: 22px; font-family: 微软雅黑; color: rgb(119,119,119)">苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的,开发,销售的高科技公司。公司继承了自动化控制领域的经验,融入了当今最现金的智能控制系统的研究设计人员,在智能家居高端产品的运用和开发,有着先进的实践经验。</span><br style="line-height: 22px; font-family: 微软雅黑; color: rgb(119,119,119)" />\r\n<span style="line-height: 22px; font-family: 微软雅黑; color: rgb(119,119,119)">公司相关研发和营销人员都是在国内最早接触美国Control4智能系统的团队,经过多年的市场整合和技术整合,对Control4产品有着深入的了解,对市场的反馈的需求有着最直接的响应。&nbsp;</span><br style="line-height: 22px; font-family: 微软雅黑; color: rgb(119,119,119)" />\r\n<span style="line-height: 22px; font-family: 微软雅黑; color: rgb(119,119,119)">为全面的现场解决方案以及最完善的产品和服务。</span></p>\r\n\r\n<p><span style="line-height: 22px; font-family: 微软雅黑; color: rgb(119,119,119)">苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的,开发,销售的高科技公司。公司继承了自动化控制领域的经验,融入了当今最现金的智能控制系统的研究设计人员,在智能家居高端产品的运用和开发,有着先进的实践经验。</span><br style="line-height: 22px; font-family: 微软雅黑; color: rgb(119,119,119)" />\r\n<span style="line-height: 22px; font-family: 微软雅黑; color: rgb(119,119,119)">公司相关研发和营销人员都是在国内最早接触美国Control4智能系统的团队,经过多年的市场整合和技术整合,对Control4产品有着深入的了解,对市场的反馈的需求有着最直接的响应。&nbsp;</span><br style="line-height: 22px; font-family: 微软雅黑; color: rgb(119,119,119)" />\r\n<span style="line-height: 22px; font-family: 微软雅黑; color: rgb(119,119,119)">为全面的现场解决方案以及最完善的产品和服务。</span></p>\r\n', 1, 0, 1367076188),
(2, '产品展示', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员......</p>\r\n', 1, 0, 1368010141),
(3, '联系方式', '<p><strong>苏州英纳索智能科技有限公司111</strong></p>\r\n\r\n<p>苏州工业园区苏州大道西318号</p>\r\n\r\n<p>T 0512-87661838</p>\r\n\r\n<p>F 0512-87661839</p>\r\n\r\n<p>杭州滨江区江南星座1幢1单元101</p>\r\n\r\n<p>T 0571-87825400</p>\r\n', 1, 0, 1366964446),
(4, '产品驱动', '<p><span style="color: rgb(119, 119, 119); font-family: 微软雅黑; line-height: normal;">我们提供我公司自己研发的产品驱动，您可以通过下载并网上购买我们的驱动，来实现产品的升级等其他附属功能。</span></p>\r\n', 1, 0, 1367060799),
(5, '三方驱动', '<p><span style="color: rgb(119, 119, 119); font-family: 微软雅黑; line-height: normal;">我们提供我公司自己研发的产品驱动，您可以通过下载并网上购买我们的驱动，来实现产品的升级等其他附属功能。</span></p>\r\n', 1, 0, 1367060661),
(6, '资料下载', '<p><span style="color: rgb(119, 119, 119); font-family: 微软雅黑; line-height: 22px;">您可以在这里下载到您想下载的软件，如果是我们的会员，即可得到更专业版的软件，期待您的加入!</span></p>\r\n', 1, 0, 1367067467),
(7, '反馈与建议', '<p>关于我们关怀 投入和官方尽快的港口路发生大家赶快莲富大厦价格考虑是否大家观看了缴费的顺口溜感觉昆仑山的房间观看蓝色大房间开工率将第三方看了感觉肯定少发了感觉快乐撒地方感觉肯定发神经观看电视剧孤苦伶仃就孤苦伶仃精神分裂看过吉林省地方</p>\r\n', 1, 0, 1367067460),
(8, '公司简介（首页简短）', '<p><span style="font-size: 13px; color: rgb(119, 119, 119); font-family: 微软雅黑; line-height: 22px;">苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的,开发,销售的高科技公司。公司继承了自动化控制领域的经验,融入了当今最现金的智能控制系统的研究设计人员,在智能家居高端产品的运用和开发,有着先进的实践经验。</span><br style="font-size: 13px; color: rgb(119, 119, 119); font-family: 微软雅黑; line-height: 22px;" />\r\n<span style="font-size: 13px; color: rgb(119, 119, 119); font-family: 微软雅黑; line-height: 22px;">公司相关研发和营销人员都是在国内最早接触美国Control4智能系 ...</span></p>\r\n', 1, 0, 1368449033);

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
  `driver_id` int(10) unsigned NOT NULL,
  `cover_requirement` char(26) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_view_product_driver_id_idx` (`product_driver_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`id`, `product_driver_id`, `title`, `content`, `price`, `link`, `hidden`, `createline`, `updateline`, `coverpath`, `driver_id`, `cover_requirement`) VALUES
(1, 1, '接收器产品', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员......</p>\r\n', 5888.00, 'http://google.com', 1, 1366474161, 1367062618, '2013/17/517bafa3c17b4.jpg', 1, '2013/17/517bb858cd302.jpg'),
(2, 1, '接收器产品2', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员......</p>\r\n', 10000.00, 'http://www.baidu.com', 1, 1366535108, 1367060986, '2013/17/517bb0026b217.jpg', 1, '2013/17/517bb1f7c0287.jpg'),
(18, 4, '索尼系列1', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员......</p>\r\n', 800.00, 'www.baidu.com', 1, 1366877365, 1367063887, '2013/17/5178fd5cde378.jpg', 0, ''),
(19, 4, '索尼系列2', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员......</p>\r\n', 100000.00, '', 1, 1366878498, 1367063895, '2013/17/5178e95aa7de6.jpg', 0, ''),
(21, 7, '索尼系列3', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。<br />\r\n公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员,在智能家居高端产品的运用和开发，有着先进的实践经验。</p>\r\n\r\n<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。<br />\r\n公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员,在智能家居高端产品的运用和开发，有着先进的实践经验。</p>\r\n\r\n<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。<br />\r\n公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员,在智能家居高端产品的运用和开发，有着先进的实践经验。</p>\r\n\r\n<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。<br />\r\n公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员,在智能家居高端产品的运用和开发，有着先进的实践经验。</p>\r\n\r\n<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。<br />\r\n公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员,在智能家居高端产品的运用和开发，有着先进的实践经验。</p>\r\n', 50000.00, 'http://www.baidu.com', 1, 1366991643, 1367063909, '2013/17/517b9b69dc524.JPG', 1, '2013/17/517b9b7c6fa5f.jpg'),
(24, 1, '未命名', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员......</p>\r\n', 11100.00, '', 1, 1367063278, 1367063331, '2013/17/517bbb1df1023.jpg', 1, ''),
(25, 1, '未命名', '<p style="text-align: center">苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员......</p>\r\n', 0.00, '', 1, 1367063350, 1367063367, '2013/17/517bbb4675546.jpg', 0, ''),
(26, 1, '未命名', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员......</p>\r\n', 3223.00, '', 1, 1367063369, 1367063394, '2013/17/517bbb5feda59.jpg', 1, ''),
(27, 1, '未命名', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员......</p>\r\n', 0.00, '', 1, 1367063397, 1367063412, '2013/17/517bbb71cc6b6.jpg', 0, ''),
(28, 1, '未命名', '<p>托管费感受到给第三方</p>\r\n', 0.00, '', 1, 1368010261, 1368033623, '2013/19/518a895458f57.jpg', 0, '2013/19/518a88f6bab95.jpg');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `product_category`
--

INSERT INTO `product_category` (`id`, `cid`, `title`, `content`, `hidden`, `createline`, `updateline`, `coverpath`) VALUES
(1, 1, '接收器', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员,在智能家居高端产品的运用和开发，有着先进的实践经验。</p>\r\n', 1, 1366473869, 1367059824, '2013/17/5178e2e7a5ef7.jpg'),
(4, 1, '接收器', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。<br />\r\n公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员,在智能家居高端产品的运用和开发，有着先进的实践经验。</p>\r\n', 1, 1366791671, 1367059860, '2013/17/5178e3c6baeee.jpg'),
(7, 1, '接收器', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。<br />\r\n公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员,在智能家居高端产品的运用和开发，有着先进的实践经验。</p>\r\n', 1, 1366990237, 1367060307, '2013/17/517badfd47420.jpg'),
(9, 1, '接受器', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设... </p>\r\n', 1, 1367063188, 1367063256, '2013/17/517bbad66f7af.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `product_download`
--

CREATE TABLE IF NOT EXISTS `product_download` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `link` varchar(200) NOT NULL,
  `hidden` tinyint(3) unsigned NOT NULL,
  `createline` int(10) unsigned NOT NULL,
  `updateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_download_product_id_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `support`
--

INSERT INTO `support` (`id`, `title`, `product`, `content`, `hidden`, `createline`, `updateline`, `unread`) VALUES
(4, '测试一下', '接收器产品', '内容', 0, 1366724193, 1366724193, 0),
(5, '你好', '接收器产品', '你好', 0, 1366869230, 1366869230, 0),
(6, 'asd ', '接收器产品', 'AD ', 0, 1366881891, 1366881891, 0),
(7, '我对这个产品有意见', '接收器产品2', '太贵了', 0, 1366881944, 1366881944, 0),
(8, '发货发你', '接收器产品', '还给你', 0, 1367065511, 1367065511, 0),
(9, 'ghjghj', '接收器产品', 'jjkljlkjjkjk', 0, 1367066856, 1367066856, 0),
(10, '放假了打算将', '接收器产品', '发顺丰的', 0, 1367980654, 1367980654, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `third`
--

INSERT INTO `third` (`id`, `third_category_id`, `title`, `content`, `link`, `hidden`, `createline`, `updateline`, `coverpath`) VALUES
(1, 1, '索尼功放', '<p><span style="line-height: 22px; font-family: 微软雅黑; color: rgb(153,153,153)">苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。</span></p>\r\n', 'http://www.google.com', 1, 1366553707, 1367062546, '2013/17/517bb810b6250.jpg'),
(6, 2, '索尼功放', '<p><span class="three_span">索尼功放索尼功放索尼功放</span></p>\r\n', 'www.baidu.com', 1, 1366879761, 1366879815, '2013/17/5178ee45f2b0b.jpg'),
(7, 2, '索尼功放—01', '<p><span class="three_span">索尼功放索尼功放索尼功放索尼功放索尼功放11</span></p>\r\n', 'www.baidu.com', 1, 1366879911, 1367063961, '2013/17/5178eed9281ae.jpg'),
(8, 1, '索尼功放', '<p class="three_p">苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。</p>\r\n', '1', 1, 1367062564, 1367062638, '2013/17/517bb85c3010d.jpg'),
(9, 1, '索尼功放', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。</p>\r\n', '1', 1, 1367062678, 1367062717, '2013/17/517bb8bc3477d.jpg'),
(10, 1, '索尼功放', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。</p>\r\n', '1', 1, 1367062720, 1367062763, '2013/17/517bb8dd45028.jpg');

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
  `cover_logo` char(26) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_third_category_cid_idx` (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `third_category`
--

INSERT INTO `third_category` (`id`, `cid`, `title`, `content`, `hidden`, `createline`, `updateline`, `coverpath`, `cover_logo`) VALUES
(1, 3, '索尼', '<p><span style="color: rgb(153, 153, 153); font-family: 微软雅黑; line-height: 22px;">苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员</span></p>\r\n', 1, 1366553197, 1367809878, '2013/19/518919916e722.jpg', '2013/19/51871f54eeb77.JPG'),
(2, 3, 'LG', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员......</p>\r\n', 1, 1366879608, 1367062033, '2013/17/517bb6d21d14d.jpg', ''),
(7, 3, '西门子', '<p><span style="line-height: 22px; font-family: 微软雅黑; color: rgb(153,153,153)">苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员</span></p>\r\n', 1, 1367062082, 1367062163, '2013/17/517bb6657aaa6.jpg', ''),
(8, 3, '西门', '<p>苏州英纳索科技有限公司是一家从事嵌入式工业计算机及自动化控制设计的，开发，销售的高科技公司。公司继承了自动控制领域的经验，融入了当今最先进的智能控制系统的研究设计人员......</p>\r\n', 1, 1367063497, 1367063522, '2013/17/517bbbe10a5a3.jpg', '');

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
-- 限制表 `product_download`
--
ALTER TABLE `product_download`
  ADD CONSTRAINT `fk_product_download_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
