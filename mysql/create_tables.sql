-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- Schema can_ecommerce_db
CREATE SCHEMA IF NOT EXISTS `can_ecommerce_db` DEFAULT CHARACTER SET utf8;
USE `can_ecommerce_db`;

-- Table `users`
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `registration_date` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`)
)
ENGINE = InnoDB;

-- Table `orders`
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `order_date` DATETIME NOT NULL,
  `total_amount` DECIMAL(10,2) NOT NULL,
  `order_status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_orders_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

-- Table `order_items`
CREATE TABLE IF NOT EXISTS `order_items` (
  `item_id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `product_id` VARCHAR(50) NOT NULL,
  `item_count` INT NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`item_id`),
  INDEX `fk_items_order_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_items_order`
    FOREIGN KEY (`order_id`)
    REFERENCES `orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

-- Restore SQL mode and checks
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
