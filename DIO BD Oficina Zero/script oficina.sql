-- MySQL Workbench Forward Engineering
drop database Oficina;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Mecanicos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Mecanicos` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Mecanicos` (
  `Cod_mecanico` INT NOT NULL,
  `Nome_Mecanico` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  `Especialidade` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod_mecanico`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Cliente` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `CPF_Cliente` INT NOT NULL,
  `Nome_Cliente` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  PRIMARY KEY (`CPF_Cliente`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Veiculos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Veiculos` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Veiculos` (
  `Placa` INT NOT NULL,
  `Modelo` VARCHAR(45) NULL,
  `Ano` INT NULL,
  `Cliente_CPF_Cliente` INT NOT NULL,
  PRIMARY KEY (`Placa`, `Cliente_CPF_Cliente`),
  CONSTRAINT `fk_Veiculos_Cliente1`
    FOREIGN KEY (`Cliente_CPF_Cliente`)
    REFERENCES `mydb`.`Cliente` (`CPF_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Veiculos_Cliente1_idx` ON `mydb`.`Veiculos` (`Cliente_CPF_Cliente` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Equipe_Mecanico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Equipe_Mecanico` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Equipe_Mecanico` (
  `Cod_Equpe` INT NOT NULL,
  `Nome_Mecanico` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod_Equpe`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Ordem_de_Serviço`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Ordem_de_Serviço` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Ordem_de_Serviço` (
  `N°` INT NOT NULL,
  `Data_Emissão` DATE NULL,
  `Valor` VARCHAR(45) NULL,
  `Status` VARCHAR(45) NULL,
  `Data_Conclusão` DATE NULL,
  `Veiculos_Placa` INT NOT NULL,
  `Equipe_Mecanico_Cod_Equpe` INT NOT NULL,
  PRIMARY KEY (`N°`, `Veiculos_Placa`, `Equipe_Mecanico_Cod_Equpe`),
  CONSTRAINT `fk_Ordem_de_Serviço_Veiculos1`
    FOREIGN KEY (`Veiculos_Placa`)
    REFERENCES `mydb`.`Veiculos` (`Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem_de_Serviço_Equipe_Mecanico1`
    FOREIGN KEY (`Equipe_Mecanico_Cod_Equpe`)
    REFERENCES `mydb`.`Equipe_Mecanico` (`Cod_Equpe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Ordem_de_Serviço_Veiculos1_idx` ON `mydb`.`Ordem_de_Serviço` (`Veiculos_Placa` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_Ordem_de_Serviço_Equipe_Mecanico1_idx` ON `mydb`.`Ordem_de_Serviço` (`Equipe_Mecanico_Cod_Equpe` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Tabela_serviços`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Tabela_serviços` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Tabela_serviços` (
  `Cod_Serviço` INT NOT NULL,
  `Descrição_Serviço` VARCHAR(45) NULL,
  `Valor_Mão_de_Obra` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod_Serviço`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Mecanicos_has_Equipe_Mecanico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Mecanicos_has_Equipe_Mecanico` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Mecanicos_has_Equipe_Mecanico` (
  `Mecanicos_Cod` INT NOT NULL,
  `Equipe_Mecanico_Cod_Equipe` INT NOT NULL,
  PRIMARY KEY (`Mecanicos_Cod`, `Equipe_Mecanico_Cod_Equipe`),
  CONSTRAINT `fk_Mecanicos_has_Equipe_Mecanico_Mecanicos`
    FOREIGN KEY (`Mecanicos_Cod`)
    REFERENCES `mydb`.`Mecanicos` (`Cod_mecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mecanicos_has_Equipe_Mecanico_Equipe_Mecanico1`
    FOREIGN KEY (`Equipe_Mecanico_Cod_Equipe`)
    REFERENCES `mydb`.`Equipe_Mecanico` (`Cod_Equpe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Mecanicos_has_Equipe_Mecanico_Equipe_Mecanico1_idx` ON `mydb`.`Mecanicos_has_Equipe_Mecanico` (`Equipe_Mecanico_Cod_Equipe` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_Mecanicos_has_Equipe_Mecanico_Mecanicos_idx` ON `mydb`.`Mecanicos_has_Equipe_Mecanico` (`Mecanicos_Cod` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Ordem_de_Serviço_has_Valor_Serviço`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Ordem_de_Serviço_has_Valor_Serviço` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Ordem_de_Serviço_has_Valor_Serviço` (
  `Ordem_de_Serviço_N°` INT NOT NULL,
  `Valor_Serviço_Cod_Serviço` INT NOT NULL,
  PRIMARY KEY (`Ordem_de_Serviço_N°`, `Valor_Serviço_Cod_Serviço`),
  CONSTRAINT `fk_Ordem_de_Serviço_has_Valor_Serviço_Ordem_de_Serviço1`
    FOREIGN KEY (`Ordem_de_Serviço_N°`)
    REFERENCES `mydb`.`Ordem_de_Serviço` (`N°`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem_de_Serviço_has_Valor_Serviço_Valor_Serviço1`
    FOREIGN KEY (`Valor_Serviço_Cod_Serviço`)
    REFERENCES `mydb`.`Tabela_serviços` (`Cod_Serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Ordem_de_Serviço_has_Valor_Serviço_Valor_Serviço1_idx` ON `mydb`.`Ordem_de_Serviço_has_Valor_Serviço` (`Valor_Serviço_Cod_Serviço` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_Ordem_de_Serviço_has_Valor_Serviço_Ordem_de_Serviço1_idx` ON `mydb`.`Ordem_de_Serviço_has_Valor_Serviço` (`Ordem_de_Serviço_N°` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Peças`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Peças` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Peças` (
  `Cod_Peça` INT NOT NULL,
  `Nome_Peça` VARCHAR(45) NULL,
  `Valor_Unitário` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod_Peça`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`OS_Peças`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`OS_Peças` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`OS_Peças` (
  `Ordem_de_Serviço_N°` INT NOT NULL,
  `Peças_Cod_Peça` INT NOT NULL,
  PRIMARY KEY (`Ordem_de_Serviço_N°`, `Peças_Cod_Peça`),
  CONSTRAINT `fk_Ordem_de_Serviço_has_Peças_Ordem_de_Serviço1`
    FOREIGN KEY (`Ordem_de_Serviço_N°`)
    REFERENCES `mydb`.`Ordem_de_Serviço` (`N°`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem_de_Serviço_has_Peças_Peças1`
    FOREIGN KEY (`Peças_Cod_Peça`)
    REFERENCES `mydb`.`Peças` (`Cod_Peça`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Ordem_de_Serviço_has_Peças_Peças1_idx` ON `mydb`.`OS_Peças` (`Peças_Cod_Peça` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_Ordem_de_Serviço_has_Peças_Ordem_de_Serviço1_idx` ON `mydb`.`OS_Peças` (`Ordem_de_Serviço_N°` ASC) VISIBLE;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
