SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE  TABLE IF NOT EXISTS `insona`.`third_category` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `cid` INT(10) UNSIGNED NOT NULL ,
  `title` VARCHAR(45) NOT NULL ,
  `content` TEXT NOT NULL ,
  `hidden` TINYINT(3) UNSIGNED NOT NULL ,
  `createline` INT(10) UNSIGNED NOT NULL ,
  `updateline` INT(10) UNSIGNED NOT NULL ,
  `coverpath` CHAR(26) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_third_category_cid_idx` (`cid` ASC) ,
  CONSTRAINT `fk_third_category_cid`
    FOREIGN KEY (`cid` )
    REFERENCES `insona`.`category` (`cid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE  TABLE IF NOT EXISTS `insona`.`third` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `third_category_id` INT(10) UNSIGNED NOT NULL ,
  `title` VARCHAR(45) NOT NULL ,
  `content` TEXT NOT NULL ,
  `link` VARCHAR(100) NOT NULL ,
  `hidden` TINYINT(3) UNSIGNED NOT NULL ,
  `createline` INT(10) UNSIGNED NOT NULL ,
  `updateline` INT(10) UNSIGNED NOT NULL ,
  `coverpath` CHAR(26) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_third_third_category_id_idx` (`third_category_id` ASC) ,
  CONSTRAINT `fk_third_third_category_id`
    FOREIGN KEY (`third_category_id` )
    REFERENCES `insona`.`third_category` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
