create database Oficina;
use Oficina;  
show tables;
#criação das tabelas
#-----------------------------------------------

CREATE TABLE IF NOT EXISTS`Cliente` (
  `CPF_Cliente` varchar(11) NOT NULL,
  `Nome_Cliente` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  PRIMARY KEY (`CPF_Cliente`))
ENGINE = InnoDB;

#-------------------------------------------------

CREATE TABLE IF NOT EXISTS `Mecanicos` (
  `Cod_mecanico` INT NOT NULL,
  `Nome_Mecanico` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  `Especialidade` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod_mecanico`))
ENGINE = InnoDB;

#---------------------------------------------------

CREATE TABLE IF NOT EXISTS `Veiculos` (
  `Placa` varchar(8) NOT NULL,
  `Modelo` VARCHAR(45) NULL,
  `Ano` INT NULL,
  `Cliente_CPF_Cliente` varchar(11) NOT NULL,
  PRIMARY KEY (`Placa`, `Cliente_CPF_Cliente`),
  CONSTRAINT `fk_Veiculos_Cliente1`
    FOREIGN KEY (`Cliente_CPF_Cliente`)
    REFERENCES `Cliente` (`CPF_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

#----------- Altereção da Tabela --------------
alter table Veiculos
drop primary key,
add primary key (placa);clientecliente

#------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Equipe_Mecanico` (
  `Cod_Equipe` INT NOT NULL,
  `Nome_Mecanico` VARCHAR(45) ,
  PRIMARY KEY (`Cod_Equipe`, `Nome_Mecanico`))
ENGINE = InnoDB;

#--------------------------------------------------

CREATE TABLE IF NOT EXISTS `Ordem_de_Serviço` (
  `N°` INT NOT NULL,
  `Data_Emissão` DATE NULL,
  `Valor` DECIMAL(10,2) NULL,
  `Status` VARCHAR(45) NULL,
  `Data_Conclusão` DATE NULL,
  `Veiculos_Placa` VARCHAR(8) NOT NULL,
  `Equipe_Mecanico_Cod_Equipe` INT NOT NULL,
  PRIMARY KEY (`N°`, `Veiculos_Placa`, `Equipe_Mecanico_Cod_Equipe`),
  CONSTRAINT `fk_Ordem_de_Serviço_Veiculos1`
    FOREIGN KEY (`Veiculos_Placa`)
    REFERENCES `Veiculos` (`Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem_de_Serviço_Equipe_Mecanico1`
    FOREIGN KEY (`Equipe_Mecanico_Cod_Equipe`)
    REFERENCES `Equipe_Mecanico` (`Cod_Equipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

#-------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Tabela_serviços` (
  `Cod_Serviço` INT NOT NULL,
  `Descrição_Serviço` VARCHAR(45) NULL,
  `Valor_Mão_de_Obra` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod_Serviço`))
ENGINE = InnoDB;

# -------- alterações na tabela -------- 
alter table Tabela_serviços
modify column Valor_Mão_de_Obra decimal(10,2);

#------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Mecanicos_Tem_Equipe_Mecanico` (
  `Mecanicos_Cod` INT NOT NULL,
  `Equipe_Mecanico_Cod_Equipe` INT NOT NULL,
  PRIMARY KEY (`Mecanicos_Cod`, `Equipe_Mecanico_Cod_Equipe`),
  CONSTRAINT `fk_Mecanicos_has_Equipe_Mecanico_Mecanicos`
    FOREIGN KEY (`Mecanicos_Cod`)
    REFERENCES `Mecanicos` (`Cod_mecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mecanicos_has_Equipe_Mecanico_Equipe_Mecanico1`
    FOREIGN KEY (`Equipe_Mecanico_Cod_Equipe`)
    REFERENCES `Equipe_Mecanico` (`Cod_Equipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

#------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Ordem_de_Serviço_Tem_Valor_Serviço` (
  `Ordem_de_Serviço_N°` INT NOT NULL,
  `Valor_Serviço_Cod_Serviço` INT NOT NULL,
  PRIMARY KEY (`Ordem_de_Serviço_N°`, `Valor_Serviço_Cod_Serviço`),
  CONSTRAINT `fk_Ordem_de_Serviço_has_Valor_Serviço_Ordem_de_Serviço1`
    FOREIGN KEY (`Ordem_de_Serviço_N°`)
    REFERENCES `Ordem_de_Serviço` (`N°`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem_de_Serviço_has_Valor_Serviço_Valor_Serviço1`
    FOREIGN KEY (`Valor_Serviço_Cod_Serviço`)
    REFERENCES `Tabela_serviços` (`Cod_Serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

#------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Peças` (
  `Cod_Peça` INT NOT NULL,
  `Nome_Peça` VARCHAR(45) NULL,
  `Valor_Unitário` DECIMAL(10,2) NULL,
  PRIMARY KEY (`Cod_Peça`))
ENGINE = InnoDB;

#------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `OS_Peças` (
  `Ordem_de_Serviço_N°` INT NOT NULL,
  `Peças_Cod_Peça` INT NOT NULL,
  PRIMARY KEY (`Ordem_de_Serviço_N°`, `Peças_Cod_Peça`),
  CONSTRAINT `fk_Ordem_de_Serviço_has_Peças_Ordem_de_Serviço1`
    FOREIGN KEY (`Ordem_de_Serviço_N°`)
    REFERENCES `Ordem_de_Serviço` (`N°`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem_de_Serviço_has_Peças_Peças1`
    FOREIGN KEY (`Peças_Cod_Peça`)
    REFERENCES `Peças` (`Cod_Peça`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

#------------------------------------------------------------------


-- caso precise refazer a tabela
drop table Cliente;
drop table Mecanicos;
drop table Veiculos;
drop table Equipe_Mecanico;
drop table Ordem_de_Serviço;
drop table Tabela_de_Serviço;
drop table Mecanicos_Tem_Equipe_Mecanico;
drop table Ordem_de_Serviço_Tem_Valor_Serviço;
drop table Pecas;
drop table `OS_peças`;
