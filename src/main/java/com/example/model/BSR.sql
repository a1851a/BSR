-- MySQL Script generated by MySQL Workbench
-- Sun Jan 28 19:18:02 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bsr
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bsr
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bsr` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `bsr` ;

-- -----------------------------------------------------
-- Table `bsr`.`USER`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bsr`.`USER` ;

CREATE TABLE IF NOT EXISTS `bsr`.`USER` (
  `userId` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NULL,
  `name` VARCHAR(200) NULL,
  `gender` VARCHAR(5) NULL,
  `birth` VARCHAR(10) NULL,
  `age` INT UNSIGNED NULL,
  PRIMARY KEY (`userId`),
  UNIQUE INDEX `user_id_UNIQUE` (`userId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bsr`.`BP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bsr`.`BP` ;

CREATE TABLE IF NOT EXISTS `bsr`.`BP` (
  `BPId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` VARCHAR(100) NOT NULL,
  `SBP` INT UNSIGNED NOT NULL,
  `DBP` INT UNSIGNED NOT NULL,
  `pulse` INT UNSIGNED NOT NULL,
  `record_day` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`BPId`),
  UNIQUE INDEX `BP__UNIQUE` (`BPId` ASC) VISIBLE,
  INDEX `fk_user_id_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_user_id2`
    FOREIGN KEY (`userId`)
    REFERENCES `bsr`.`USER` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bsr`.`BG`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bsr`.`BG` ;

CREATE TABLE IF NOT EXISTS `bsr`.`BG` (
  `BGId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` VARCHAR(100) NOT NULL,
  `AC` INT UNSIGNED NOT NULL,
  `PC` INT UNSIGNED NULL,
  `HbA1c` DOUBLE UNSIGNED NULL,
  `Amylase` INT UNSIGNED NULL,
  `record_day` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`BGId`),
  UNIQUE INDEX `BG_id_UNIQUE` (`BGId` ASC) VISIBLE,
  INDEX `fk_user_id_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_user_id3`
    FOREIGN KEY (`userId`)
    REFERENCES `bsr`.`USER` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bsr`.`Hyperlipidemia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bsr`.`Hyperlipidemia` ;

CREATE TABLE IF NOT EXISTS `bsr`.`Hyperlipidemia` (
  `hyperlipidemiaId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` VARCHAR(100) NOT NULL,
  `TG` INT UNSIGNED NOT NULL,
  `TC` INT UNSIGNED NOT NULL,
  `HDL` INT UNSIGNED NOT NULL,
  `LDL` INT UNSIGNED NOT NULL,
  `vldl` INT UNSIGNED NULL,
  `angiosclerosis` DOUBLE UNSIGNED NOT NULL,
  `stroke` DOUBLE UNSIGNED NOT NULL,
  `record_day` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`hyperlipidemiaId`),
  UNIQUE INDEX `hyperlipidemia_id_UNIQUE` (`hyperlipidemiaId` ASC) VISIBLE,
  INDEX `fk_user_id_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_user_id4`
    FOREIGN KEY (`userId`)
    REFERENCES `bsr`.`USER` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bsr`.`RenalFunction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bsr`.`RenalFunction` ;

CREATE TABLE IF NOT EXISTS `bsr`.`RenalFunction` (
  `renalFunctionId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` VARCHAR(100) NOT NULL,
  `BUN` DOUBLE UNSIGNED NOT NULL,
  `Cr` DOUBLE UNSIGNED NOT NULL,
  `UA` DOUBLE UNSIGNED NOT NULL,
  `mAlb` DOUBLE UNSIGNED NOT NULL,
  `record_day` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`renalFunctionId`),
  UNIQUE INDEX `RenalFunction_id_UNIQUE` (`renalFunctionId` ASC) VISIBLE,
  INDEX `fk_user_id_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_user_id5`
    FOREIGN KEY (`userId`)
    REFERENCES `bsr`.`USER` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bsr`.`LiverFunction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bsr`.`LiverFunction` ;

CREATE TABLE IF NOT EXISTS `bsr`.`LiverFunction` (
  `liverFunctionId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` VARCHAR(100) NOT NULL,
  `dbit` DOUBLE UNSIGNED NULL,
  `dbil` DOUBLE UNSIGNED NULL,
  `TP` DOUBLE UNSIGNED NOT NULL,
  `Alb` DOUBLE UNSIGNED NOT NULL,
  `Glo` DOUBLE UNSIGNED NOT NULL,
  `sGOT` INT UNSIGNED NOT NULL,
  `sGPT` INT UNSIGNED NOT NULL,
  `alkp` INT UNSIGNED NULL,
  `ald` INT UNSIGNED NULL,
  `record_day` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`liverFunctionId`),
  UNIQUE INDEX `liver_function_id_UNIQUE` (`liverFunctionId` ASC) VISIBLE,
  INDEX `fk_user_id_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_user_id6`
    FOREIGN KEY (`userId`)
    REFERENCES `bsr`.`USER` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bsr`.`Electrolyte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bsr`.`Electrolyte` ;

CREATE TABLE IF NOT EXISTS `bsr`.`Electrolyte` (
  `electrolyteId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` VARCHAR(100) NOT NULL,
  `na` INT UNSIGNED NULL,
  `k` DOUBLE UNSIGNED NULL,
  `cl` INT UNSIGNED NULL,
  `Ca` DOUBLE UNSIGNED NOT NULL,
  `P` DOUBLE UNSIGNED NOT NULL,
  `record_day` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`electrolyteId`),
  UNIQUE INDEX `electrolyte_id_UNIQUE` (`electrolyteId` ASC) VISIBLE,
  INDEX `fk_user_id_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_user_id7`
    FOREIGN KEY (`userId`)
    REFERENCES `bsr`.`USER` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bsr`.`Blood`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bsr`.`Blood` ;

CREATE TABLE IF NOT EXISTS `bsr`.`Blood` (
  `bloodId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` VARCHAR(100) NOT NULL,
  `WBC` INT UNSIGNED NOT NULL,
  `RBC` DOUBLE UNSIGNED NOT NULL,
  `Hgb` DOUBLE UNSIGNED NOT NULL,
  `Hct` DOUBLE UNSIGNED NOT NULL,
  `MCV` DOUBLE UNSIGNED NOT NULL,
  `MCH` DOUBLE UNSIGNED NOT NULL,
  `MCHC` DOUBLE UNSIGNED NOT NULL,
  `PLT` INT UNSIGNED NOT NULL,
  `record_day` DATE NOT NULL,
  PRIMARY KEY (`bloodId`),
  UNIQUE INDEX `blood_id_UNIQUE` (`bloodId` ASC) VISIBLE,
  INDEX `fk_user_id_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_user_id8`
    FOREIGN KEY (`userId`)
    REFERENCES `bsr`.`USER` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bsr`.`Urine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bsr`.`Urine` ;

CREATE TABLE IF NOT EXISTS `bsr`.`Urine` (
  `urineId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` VARCHAR(100) NOT NULL,
  `appearance` VARCHAR(5) NOT NULL,
  `PH` DOUBLE UNSIGNED NOT NULL,
  `leukocytes` VARCHAR(5) NOT NULL,
  `glucose` VARCHAR(5) NOT NULL,
  `protein` VARCHAR(5) NOT NULL,
  `bilirubin` VARCHAR(5) NOT NULL,
  `urobilirubin` VARCHAR(5) NOT NULL,
  `ketones` VARCHAR(5) NOT NULL,
  `occult_blood` VARCHAR(5) NOT NULL,
  `specific_gravity` DOUBLE UNSIGNED NOT NULL,
  `nitrite` VARCHAR(5) NOT NULL,
  `record_day` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`urineId`),
  UNIQUE INDEX `urine_id_UNIQUE` (`urineId` ASC) VISIBLE,
  INDEX `fk_user_id_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_user_id9`
    FOREIGN KEY (`userId`)
    REFERENCES `bsr`.`USER` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bsr`.`Sediment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bsr`.`Sediment` ;

CREATE TABLE IF NOT EXISTS `bsr`.`Sediment` (
  `sedimentId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` VARCHAR(100) NOT NULL,
  `RBC` INT UNSIGNED NOT NULL,
  `WBC` INT UNSIGNED NOT NULL,
  `epithelium` INT UNSIGNED NOT NULL,
  `crystal` VARCHAR(2) NOT NULL,
  `cast` VARCHAR(2) NOT NULL,
  `bacteria` VARCHAR(2) NOT NULL,
  `other` VARCHAR(2) NOT NULL,
  `record_day` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`sedimentId`),
  UNIQUE INDEX `sediment_id_UNIQUE` (`sedimentId` ASC) VISIBLE,
  INDEX `fk_user_id_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_user_id10`
    FOREIGN KEY (`userId`)
    REFERENCES `bsr`.`USER` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bsr`.`Health_information`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bsr`.`Health_information` ;

CREATE TABLE IF NOT EXISTS `bsr`.`Health_information` (
  `healthInformationId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(100) NOT NULL,
  `title` VARCHAR(200) NOT NULL,
  `web_url` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`healthInformationId`),
  UNIQUE INDEX `health_information_id_UNIQUE` (`healthInformationId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bsr`.`OUTCOME`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bsr`.`OUTCOME` ;

CREATE TABLE IF NOT EXISTS `bsr`.`OUTCOME` (
  `outcomeId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` VARCHAR(100) NOT NULL,
  `Disease` VARCHAR(100) NOT NULL,
  `record_day` VARCHAR(10) NOT NULL,
  UNIQUE INDEX `outcomeId_UNIQUE` (`outcomeId` ASC) VISIBLE,
  PRIMARY KEY (`outcomeId`),
  INDEX `fk_usertable_id1_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_usertable_id1`
    FOREIGN KEY (`userId`)
    REFERENCES `bsr`.`USER` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bsr`.`Basic_information`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bsr`.`Basic_information` ;

CREATE TABLE IF NOT EXISTS `bsr`.`Basic_information` (
  `basicInformationId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` VARCHAR(100) NOT NULL,
  `height` DECIMAL UNSIGNED NOT NULL,
  `weight` DOUBLE UNSIGNED NOT NULL,
  `BMI` DOUBLE UNSIGNED NOT NULL,
  `BMR` DOUBLE UNSIGNED NULL,
  `record_day` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`basicInformationId`),
  UNIQUE INDEX `basicInformationId_UNIQUE` (`basicInformationId` ASC) VISIBLE,
  INDEX `fk_user_Id1_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_user_Id1`
    FOREIGN KEY (`userId`)
    REFERENCES `bsr`.`USER` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
