SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `insona` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `insona` ;

-- -----------------------------------------------------
-- Table `insona`.`company_member`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `insona`.`company_member` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(100) NOT NULL ,
  `username` VARCHAR(60) NOT NULL ,
  `password` CHAR(40) NOT NULL ,
  `hidden` TINYINT UNSIGNED NOT NULL ,
  `createline` INT UNSIGNED NOT NULL ,
  `birthday` INT UNSIGNED NOT NULL ,
  `phone` VARCHAR(20) NOT NULL ,
  `company` VARCHAR(60) NOT NULL ,
  `idcard` VARCHAR(20) NOT NULL ,
  `country` VARCHAR(20) NOT NULL ,
  `city` VARCHAR(20) NOT NULL ,
  `address` VARCHAR(100) NOT NULL ,
  `install_type` VARCHAR(60) NOT NULL ,
  `install_way` VARCHAR(60) NOT NULL ,
  `license_cover` CHAR(26) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `insona`.`user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `insona`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(100) NOT NULL ,
  `username` VARCHAR(20) NOT NULL ,
  `password` CHAR(40) NOT NULL ,
  `createline` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) ,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `insona`.`user_role`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `insona`.`user_role` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `user_id` INT UNSIGNED NOT NULL ,
  `role_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_user_role_user_id_idx` (`user_id` ASC) ,
  CONSTRAINT `fk_user_role_user_id`
    FOREIGN KEY (`user_id` )
    REFERENCES `insona`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `insona`.`category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `insona`.`category` (
  `cid` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `fid` INT UNSIGNED NOT NULL ,
  `name` VARCHAR(15) NOT NULL ,
  `fullname` VARCHAR(45) NOT NULL ,
  `priority` TINYINT UNSIGNED NOT NULL ,
  PRIMARY KEY (`cid`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `insona`.`product_category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `insona`.`product_category` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `cid` INT UNSIGNED NOT NULL ,
  `title` VARCHAR(45) NOT NULL ,
  `content` TEXT NOT NULL ,
  `hidden` TINYINT UNSIGNED NOT NULL ,
  `createline` INT UNSIGNED NOT NULL ,
  `updateline` INT UNSIGNED NOT NULL ,
  `coverpath` CHAR(26) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_product_driver_cid_idx` (`cid` ASC) ,
  CONSTRAINT `fk_product_driver_cid`
    FOREIGN KEY (`cid` )
    REFERENCES `insona`.`category` (`cid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `insona`.`image`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `insona`.`image` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` CHAR(26) NOT NULL ,
  `basepath` CHAR(16) NOT NULL ,
  `typepath` CHAR(1) NOT NULL ,
  `subpath` CHAR(8) NOT NULL ,
  `savepath` CHAR(26) NOT NULL ,
  `saverule` CHAR(13) NOT NULL ,
  `originalname` VARCHAR(100) NOT NULL ,
  `type` VARCHAR(30) NOT NULL ,
  `extension` CHAR(4) NOT NULL ,
  `size` INT UNSIGNED NOT NULL ,
  `thumbname` VARCHAR(50) NOT NULL ,
  `updateline` INT UNSIGNED NOT NULL ,
  `createline` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `insona`.`product`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `insona`.`product` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `product_driver_id` INT UNSIGNED NOT NULL ,
  `title` VARCHAR(45) NOT NULL ,
  `content` TEXT NOT NULL ,
  `price` DECIMAL(12,2) UNSIGNED NOT NULL ,
  `link` VARCHAR(200) NOT NULL ,
  `hidden` TINYINT UNSIGNED NOT NULL ,
  `createline` INT UNSIGNED NOT NULL ,
  `updateline` INT UNSIGNED NOT NULL ,
  `coverpath` CHAR(26) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_product_view_product_driver_id_idx` (`product_driver_id` ASC) ,
  CONSTRAINT `fk_product_view_product_driver_id`
    FOREIGN KEY (`product_driver_id` )
    REFERENCES `insona`.`product_category` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `insona`.`driver_category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `insona`.`driver_category` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `cid` INT UNSIGNED NOT NULL ,
  `title` VARCHAR(45) NOT NULL ,
  `content` TEXT NOT NULL ,
  `hidden` TINYINT UNSIGNED NOT NULL ,
  `createline` INT UNSIGNED NOT NULL ,
  `updateline` INT UNSIGNED NOT NULL ,
  `coverpath` CHAR(26) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_driver_category_cid_idx` (`cid` ASC) ,
  CONSTRAINT `fk_driver_category_cid`
    FOREIGN KEY (`cid` )
    REFERENCES `insona`.`category` (`cid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `insona`.`driver`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `insona`.`driver` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `driver_category_id` INT UNSIGNED NOT NULL ,
  `title` VARCHAR(45) NOT NULL ,
  `link` VARCHAR(100) NOT NULL ,
  `hidden` TINYINT UNSIGNED NOT NULL ,
  `createline` INT UNSIGNED NOT NULL ,
  `updateline` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_driver_driver_id_idx` (`driver_category_id` ASC) ,
  CONSTRAINT `fk_driver_driver_category_id`
    FOREIGN KEY (`driver_category_id` )
    REFERENCES `insona`.`driver_category` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `insona`.`third_category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `insona`.`third_category` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `cid` INT UNSIGNED NOT NULL ,
  `title` VARCHAR(45) NOT NULL ,
  `content` TEXT NOT NULL ,
  `hidden` TINYINT UNSIGNED NOT NULL ,
  `createline` INT UNSIGNED NOT NULL ,
  `updateline` INT UNSIGNED NOT NULL ,
  `coverpath` CHAR(26) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_third_category_cid_idx` (`cid` ASC) ,
  CONSTRAINT `fk_third_category_cid`
    FOREIGN KEY (`cid` )
    REFERENCES `insona`.`category` (`cid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `insona`.`third`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `insona`.`third` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `third_category_id` INT UNSIGNED NOT NULL ,
  `title` VARCHAR(45) NOT NULL ,
  `content` TEXT NOT NULL ,
  `link` VARCHAR(100) NOT NULL ,
  `hidden` TINYINT UNSIGNED NOT NULL ,
  `createline` INT UNSIGNED NOT NULL ,
  `updateline` INT UNSIGNED NOT NULL ,
  `coverpath` CHAR(26) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_third_third_category_id_idx` (`third_category_id` ASC) ,
  CONSTRAINT `fk_third_third_category_id`
    FOREIGN KEY (`third_category_id` )
    REFERENCES `insona`.`third_category` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `insona`.`download`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `insona`.`download` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `cid` INT UNSIGNED NOT NULL ,
  `title` VARCHAR(45) NOT NULL ,
  `content` TEXT NOT NULL ,
  `link` VARCHAR(200) NOT NULL ,
  `is_vip` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 => 表示所有用户都可以下载\\n1 => 表示必须登录用户才可以下载' ,
  `hidden` TINYINT UNSIGNED NOT NULL ,
  `createline` INT UNSIGNED NOT NULL ,
  `updateline` INT UNSIGNED NOT NULL ,
  `coverpath` CHAR(26) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_download_cid_idx` (`cid` ASC) ,
  CONSTRAINT `fk_download_cid`
    FOREIGN KEY (`cid` )
    REFERENCES `insona`.`category` (`cid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `insona`.`support`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `insona`.`support` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(45) NOT NULL ,
  `product` VARCHAR(100) NOT NULL ,
  `content` TEXT NOT NULL ,
  `hidden` TINYINT UNSIGNED NOT NULL ,
  `createline` INT UNSIGNED NOT NULL ,
  `updateline` INT UNSIGNED NOT NULL ,
  `unread` TINYINT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `insona`.`banner`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `insona`.`banner` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `cid` INT UNSIGNED NOT NULL ,
  `title` VARCHAR(45) NOT NULL ,
  `hyperlink` VARCHAR(100) NOT NULL ,
  `hidden` TINYINT UNSIGNED NOT NULL ,
  `updateline` INT UNSIGNED NOT NULL ,
  `createline` INT UNSIGNED NOT NULL ,
  `customline` INT UNSIGNED NOT NULL ,
  `priority` INT UNSIGNED NOT NULL ,
  `coverpath` CHAR(26) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_banner_cid_idx` (`cid` ASC) ,
  CONSTRAINT `fk_banner_cid`
    FOREIGN KEY (`cid` )
    REFERENCES `insona`.`category` (`cid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
