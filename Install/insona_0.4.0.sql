SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `insona` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `insona` ;

-- -----------------------------------------------------
-- Table `insona`.`user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `insona`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(100) NOT NULL ,
  `username` VARCHAR(60) NOT NULL ,
  `password` CHAR(40) NOT NULL ,
  `createline` INT UNSIGNED NOT NULL ,
  `certificate` VARCHAR(45) NOT NULL COMMENT '证件号' ,
  `birthday` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
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



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
