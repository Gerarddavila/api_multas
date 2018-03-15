-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db_api_multas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_api_multas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_api_multas` DEFAULT CHARACTER SET utf8 ;
USE `db_api_multas` ;

-- -----------------------------------------------------
-- Table `db_api_multas`.`datos_vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_api_multas`.`datos_vehiculo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `no_multa` INT UNSIGNED NOT NULL,
  `no_placa` VARCHAR(45) NOT NULL,
  `no_tarjeta_cir` VARCHAR(45) NOT NULL,
  `tipo_vehiculo` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `no_placa_UNIQUE` (`no_placa` ASC),
  UNIQUE INDEX `no_multa_UNIQUE` (`no_multa` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_api_multas`.`datos_infractor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_api_multas`.`datos_infractor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `conductor_ausente` VARCHAR(45) NOT NULL,
  `genero` VARCHAR(45) NOT NULL,
  `no_licencia` VARCHAR(45) NOT NULL,
  `tipo_licencia` VARCHAR(45) NOT NULL,
  `no_documento` VARCHAR(45) NOT NULL,
  `domicilio` VARCHAR(45) NOT NULL,
  `datos_vehiculo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_datos_infractor_datos_vehiculo_idx` (`datos_vehiculo_id` ASC),
  CONSTRAINT `fk_datos_infractor_datos_vehiculo`
    FOREIGN KEY (`datos_vehiculo_id`)
    REFERENCES `db_api_multas`.`datos_vehiculo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_api_multas`.`datos_infraccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_api_multas`.`datos_infraccion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lugar_infraccion` VARCHAR(250) NOT NULL,
  `fecha_infraccion` DATE NOT NULL,
  `hora_infraccion` TIME NOT NULL,
  `datos_vehiculo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_datos_infraccion_datos_vehiculo1_idx` (`datos_vehiculo_id` ASC),
  CONSTRAINT `fk_datos_infraccion_datos_vehiculo1`
    FOREIGN KEY (`datos_vehiculo_id`)
    REFERENCES `db_api_multas`.`datos_vehiculo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_api_multas`.`articulo_infringido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_api_multas`.`articulo_infringido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `no_articulo` VARCHAR(45) NOT NULL,
  `descripcion_articulo` VARCHAR(45) NOT NULL,
  `base_legal` VARCHAR(45) NOT NULL,
  `monto_infraccion` VARCHAR(45) NOT NULL,
  `datos_vehiculo_id` INT NOT NULL,
  `datos_infraccion_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_articulo_infringido_datos_vehiculo1_idx` (`datos_vehiculo_id` ASC),
  INDEX `fk_articulo_infringido_datos_infraccion1_idx` (`datos_infraccion_id` ASC),
  CONSTRAINT `fk_articulo_infringido_datos_vehiculo1`
    FOREIGN KEY (`datos_vehiculo_id`)
    REFERENCES `db_api_multas`.`datos_vehiculo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_articulo_infringido_datos_infraccion1`
    FOREIGN KEY (`datos_infraccion_id`)
    REFERENCES `db_api_multas`.`datos_infraccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_api_multas`.`datos_agente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_api_multas`.`datos_agente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `no_identificacion` VARCHAR(60) NOT NULL,
  `firmo_agente` TINYINT(1) NOT NULL,
  `firmo_infractor` TINYINT(1) NULL,
  `nego_firmar_infractor` TINYINT(1) NULL,
  `datos_vehiculo_id` INT NOT NULL,
  `articulo_infringido_id` INT NOT NULL,
  `datos_infraccion_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_datos_agente_datos_vehiculo1_idx` (`datos_vehiculo_id` ASC),
  INDEX `fk_datos_agente_articulo_infringido1_idx` (`articulo_infringido_id` ASC),
  INDEX `fk_datos_agente_datos_infraccion1_idx` (`datos_infraccion_id` ASC),
  CONSTRAINT `fk_datos_agente_datos_vehiculo1`
    FOREIGN KEY (`datos_vehiculo_id`)
    REFERENCES `db_api_multas`.`datos_vehiculo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_datos_agente_articulo_infringido1`
    FOREIGN KEY (`articulo_infringido_id`)
    REFERENCES `db_api_multas`.`articulo_infringido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_datos_agente_datos_infraccion1`
    FOREIGN KEY (`datos_infraccion_id`)
    REFERENCES `db_api_multas`.`datos_infraccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_api_multas`.`observaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_api_multas`.`observaciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `observacion` TEXT NULL,
  `datos_agente_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_observaciones_datos_agente1_idx` (`datos_agente_id` ASC),
  CONSTRAINT `fk_observaciones_datos_agente1`
    FOREIGN KEY (`datos_agente_id`)
    REFERENCES `db_api_multas`.`datos_agente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_api_multas`.`privilegios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_api_multas`.`privilegios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `privilegio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `privilegio_UNIQUE` (`privilegio` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_api_multas`.`credenciales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_api_multas`.`credenciales` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `privilegios_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_credenciales_privilegios1_idx` (`privilegios_id` ASC),
  CONSTRAINT `fk_credenciales_privilegios1`
    FOREIGN KEY (`privilegios_id`)
    REFERENCES `db_api_multas`.`privilegios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;