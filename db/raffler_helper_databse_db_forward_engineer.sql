-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema raffler_helper_database
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema raffler_helper_database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `raffler_helper_database` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `raffler_helper_database` ;

-- -----------------------------------------------------
-- Table `raffler_helper_database`.`email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `raffler_helper_database`.`email` (
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `raffler_helper_database`.`infraction_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `raffler_helper_database`.`infraction_type` (
  `infraction_type_id` INT NOT NULL,
  `infraction_type_desc` VARCHAR(25) NULL DEFAULT NULL,
  PRIMARY KEY (`infraction_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `raffler_helper_database`.`infraction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `raffler_helper_database`.`infraction` (
  `infraction_id` INT NOT NULL,
  `time` TIMESTAMP NULL DEFAULT NULL,
  `infraction_type_id` INT NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`infraction_id`),
  INDEX `email_idx` (`email` ASC) VISIBLE,
  INDEX `infractions_idx` (`infraction_type_id` ASC) VISIBLE,
  CONSTRAINT `email`
    FOREIGN KEY (`email`)
    REFERENCES `raffler_helper_database`.`email` (`email`)
    ON UPDATE CASCADE,
  CONSTRAINT `infractions`
    FOREIGN KEY (`infraction_type_id`)
    REFERENCES `raffler_helper_database`.`infraction_type` (`infraction_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
