-- MySQL Script generated by MySQL Workbench
-- Mon Jan 25 10:04:53 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8 ;
USE `blog` ;

-- -----------------------------------------------------
-- Table `blog`.`authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`authors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lastname` VARCHAR(45) NOT NULL,
  `firstname` VARCHAR(45) NULL,
  `nickname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `nickname_UNIQUE` ON `blog`.`authors` (`nickname` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `blog`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`posts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `text` VARCHAR(150) NOT NULL,
  `importance` INT NOT NULL DEFAULT 0,
  `publication_date_start` DATETIME NOT NULL,
  `publication_date_end` DATETIME NOT NULL,
  `authors_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_posts_authors1`
    FOREIGN KEY (`authors_id`)
    REFERENCES `blog`.`authors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_posts_authors1_idx` ON `blog`.`posts` (`authors_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `blog`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(150) NOT NULL,
  `add_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `posts_id` INT NOT NULL,
  `authors_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_comments_posts1`
    FOREIGN KEY (`posts_id`)
    REFERENCES `blog`.`posts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_authors1`
    FOREIGN KEY (`authors_id`)
    REFERENCES `blog`.`authors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_comments_posts1_idx` ON `blog`.`comments` (`posts_id` ASC) VISIBLE;

CREATE INDEX `fk_comments_authors1_idx` ON `blog`.`comments` (`authors_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `blog`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`posts_have_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`posts_have_categories` (
  `posts_id` INT NOT NULL,
  `categories_id` INT NOT NULL,
  PRIMARY KEY (`posts_id`, `categories_id`),
  CONSTRAINT `fk_posts_has_categories_posts1`
    FOREIGN KEY (`posts_id`)
    REFERENCES `blog`.`posts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posts_has_categories_categories1`
    FOREIGN KEY (`categories_id`)
    REFERENCES `blog`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_posts_has_categories_categories1_idx` ON `blog`.`posts_have_categories` (`categories_id` ASC) VISIBLE;

CREATE INDEX `fk_posts_has_categories_posts1_idx` ON `blog`.`posts_have_categories` (`posts_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
