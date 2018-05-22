-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: umgsm.com    Database: apimultas
-- ------------------------------------------------------
-- Server version	5.6.39-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articulo_infringido`
--

DROP TABLE IF EXISTS `articulo_infringido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulo_infringido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_articulo` int(10) unsigned NOT NULL,
  `descripcion_articulo` text NOT NULL,
  `base_legal` text NOT NULL,
  `monto_infraccion` decimal(10,0) unsigned NOT NULL,
  `datos_vehiculo_id` int(11) NOT NULL,
  `datos_infraccion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_articulo_infringido_datos_vehiculo1_idx` (`datos_vehiculo_id`),
  KEY `fk_articulo_infringido_datos_infraccion1_idx` (`datos_infraccion_id`),
  CONSTRAINT `fk_articulo_infringido_datos_infraccion1` FOREIGN KEY (`datos_infraccion_id`) REFERENCES `datos_infraccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_articulo_infringido_datos_vehiculo1` FOREIGN KEY (`datos_vehiculo_id`) REFERENCES `datos_vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo_infringido`
--

LOCK TABLES `articulo_infringido` WRITE;
/*!40000 ALTER TABLE `articulo_infringido` DISABLE KEYS */;
INSERT INTO `articulo_infringido` VALUES (5,1,'Mal estacionado','---------',500,1,3),(6,1,'Choque','Ley y reglamento',400,2,4),(7,3,'Estacion prohibido','Ley y reglamento',300,4,5),(8,43,'Estacion prohibido','Ley y reglamento',600,4,6),(9,33,'Estacion prohibido','Ley y reglamento',300,4,5),(10,23,'Estacion prohibido','Ley y reglamento',390,6,7),(20,3,'Prohibido Estacionar','Ley y reglamento',500,1,3),(21,3,'Prohibido Estacionar','Ley y reglamento',500,1,4),(22,3,'Prohibido Estacionar','Ley y reglamento',500,1,5),(23,3,'Prohibido Estacionar','Ley y reglamento',500,1,6),(24,3,'Prohibido Estacionar','Ley y reglamento',500,1,7),(25,3,'Prohibido Estacionar','Ley y reglamento',500,1,8),(26,3,'Prohibido Estacionar','Ley y reglamento',500,1,9),(27,3,'Prohibido Estacionar','Ley y reglamento',500,1,10),(28,3,'Prohibido Estacionar','Ley y reglamento',500,1,11),(29,3,'Prohibido Estacionar','Ley y reglamento',500,1,12),(30,3,'Prohibido Estacionar','Ley y reglamento',500,1,13),(31,3,'Prohibido Estacionar','Ley y reglamento',500,2,14),(32,3,'Prohibido Estacionar','Ley y reglamento',500,2,15),(33,3,'Prohibido Estacionar','Ley y reglamento',500,2,16),(34,3,'Prohibido Estacionar','Ley y reglamento',500,2,17),(35,3,'Prohibido Estacionar','Ley y reglamento',500,2,18),(36,3,'Prohibido Estacionar','Ley y reglamento',500,2,19),(37,3,'Prohibido Estacionar','Ley y reglamento',500,2,20),(38,3,'Prohibido Estacionar','Ley y reglamento',500,3,21),(39,3,'Prohibido Estacionar','Ley y reglamento',500,3,22),(40,3,'Prohibido Estacionar','Ley y reglamento',500,3,23),(41,3,'Prohibido Estacionar','Ley y reglamento',500,3,24),(42,3,'Prohibido Estacionar','Ley y reglamento',500,3,25),(43,3,'Prohibido Estacionar','Ley y reglamento',500,4,26),(44,3,'Prohibido Estacionar','Ley y reglamento',500,4,27),(45,3,'Prohibido Estacionar','Ley y reglamento',500,4,28),(46,3,'Prohibido Estacionar','Ley y reglamento',500,4,29),(47,3,'Prohibido Estacionar','Ley y reglamento',500,4,30),(48,3,'Prohibido Estacionar','Ley y reglamento',500,5,31),(49,3,'Prohibido Estacionar','Ley y reglamento',500,5,32),(50,3,'Prohibido Estacionar','Ley y reglamento',500,5,33),(51,3,'Prohibido Estacionar','Ley y reglamento',500,5,34),(52,3,'Prohibido Estacionar','Ley y reglamento',500,6,35),(53,3,'Prohibido Estacionar','Ley y reglamento',500,6,36),(54,3,'Prohibido Estacionar','Ley y reglamento',500,6,37),(55,3,'Prohibido Estacionar','Ley y reglamento',500,7,38),(56,3,'Prohibido Estacionar','Ley y reglamento',500,7,39),(57,3,'Prohibido Estacionar','Ley y reglamento',500,8,40),(58,3,'Prohibido Estacionar','Ley y reglamento',500,8,41),(59,3,'Prohibido Estacionar','Ley y reglamento',500,9,42),(60,3,'Prohibido Estacionar','Ley y reglamento',500,12,43);
/*!40000 ALTER TABLE `articulo_infringido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credenciales`
--

DROP TABLE IF EXISTS `credenciales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credenciales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `password` varchar(20) NOT NULL,
  `privilegios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  KEY `fk_credenciales_privilegios1_idx` (`privilegios_id`),
  CONSTRAINT `fk_credenciales_privilegios1` FOREIGN KEY (`privilegios_id`) REFERENCES `privilegios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credenciales`
--

LOCK TABLES `credenciales` WRITE;
/*!40000 ALTER TABLE `credenciales` DISABLE KEYS */;
INSERT INTO `credenciales` VALUES (1,'GDAVILA','GDAVILA',3),(2,'GDOMINGUEZ','GDOMINGUEZ',3),(3,'FLOPEZ','FLOPEZ',2),(4,'JSOTO','JSOTO',2),(5,'KGONZALEZ','KGONZALEZ',2),(6,'AGARCIA','AGARCIA',1),(7,'ALOPEZ','ALOPEZ',1),(8,'CGALVEZ','CGALVEZ',1),(9,'LFUENTES','LFUENTES',1),(10,'RMIRANDA','RMIRANDA',1),(11,'JPEREZ','JPEREZ',1);
/*!40000 ALTER TABLE `credenciales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_agente`
--

DROP TABLE IF EXISTS `datos_agente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_agente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_identificacion` varchar(60) NOT NULL,
  `firmo_agente` tinyint(1) NOT NULL,
  `firmo_infractor` tinyint(1) DEFAULT NULL,
  `nego_firmar_infractor` tinyint(1) DEFAULT NULL,
  `datos_vehiculo_id` int(11) NOT NULL,
  `articulo_infringido_id` int(11) NOT NULL,
  `datos_infraccion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_datos_agente_datos_vehiculo1_idx` (`datos_vehiculo_id`),
  KEY `fk_datos_agente_articulo_infringido1_idx` (`articulo_infringido_id`),
  KEY `fk_datos_agente_datos_infraccion1_idx` (`datos_infraccion_id`),
  CONSTRAINT `fk_datos_agente_articulo_infringido1` FOREIGN KEY (`articulo_infringido_id`) REFERENCES `articulo_infringido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_datos_agente_datos_infraccion1` FOREIGN KEY (`datos_infraccion_id`) REFERENCES `datos_infraccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_datos_agente_datos_vehiculo1` FOREIGN KEY (`datos_vehiculo_id`) REFERENCES `datos_vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_agente`
--

LOCK TABLES `datos_agente` WRITE;
/*!40000 ALTER TABLE `datos_agente` DISABLE KEYS */;
INSERT INTO `datos_agente` VALUES (1,'00001',1,1,0,4,7,5);
/*!40000 ALTER TABLE `datos_agente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_infraccion`
--

DROP TABLE IF EXISTS `datos_infraccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_infraccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lugar_infraccion` text NOT NULL,
  `municipio_infraccion` varchar(15) NOT NULL,
  `fecha_infraccion` date NOT NULL,
  `hora_infraccion` time NOT NULL,
  `datos_vehiculo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_datos_infraccion_datos_vehiculo1_idx` (`datos_vehiculo_id`),
  CONSTRAINT `fk_datos_infraccion_datos_vehiculo1` FOREIGN KEY (`datos_vehiculo_id`) REFERENCES `datos_vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_infraccion`
--

LOCK TABLES `datos_infraccion` WRITE;
/*!40000 ALTER TABLE `datos_infraccion` DISABLE KEYS */;
INSERT INTO `datos_infraccion` VALUES (3,'Gallo rojo, San Pedro Sac. S.M','San Pedro Sac','2018-01-23','16:30:00',3),(4,'El Mosquito, San Pedro Sac','San Pedro Sac','2018-02-15','10:30:00',4),(5,'Terminal, San Marcos','San Marcos','2018-02-26','05:45:00',5),(6,'La Calzada, San Pedro Sac. S.M','San Pedro Sac','2018-03-02','15:18:00',6),(7,'7ma. Avenida, San Pedro Sac. S.M','San Pedro Sac','2018-03-02','15:18:00',7),(8,'12va. Avenida, San Pedro Sac. S.M','San Pedro Sac','2018-03-11','20:48:00',8),(9,'Parque Central, San Pedro Sac. S.M','San Marcos','2018-03-15','15:28:00',9),(10,'Zona 3 San Marcos ','San Marcos','2018-03-15','16:28:00',10),(11,'Zona 5 San Marcos ','San Marcos','2018-03-20','11:50:00',11),(12,'Zona 3 San Marcos ','San Marcos','0000-00-00','16:28:00',10),(13,'Zona 20 San Marcos ','San Marcos','0000-00-00','10:08:00',10),(14,'El arbolon, San Pedro Sac','San Pedro Sac','2018-02-14','00:30:00',1),(15,'El Toril','San Pedro Sac','2018-02-14','18:00:00',1),(16,'Parque Central','San Pedro Sac','2018-02-22','10:00:00',1),(17,'Cementerio General','San Pedro Sac','2018-02-28','15:00:00',1),(18,'Terminal de Buses','San Marcos','2018-03-15','12:30:00',1),(19,'Terminal de Buses','San Pedro Sac','2018-03-24','09:15:00',1),(20,'Parque Central','San Marcos','2018-03-30','11:45:00',1),(21,'El Mosquito','San Pedro Sac','2018-04-05','10:20:00',1),(22,'Gallo Rojo','San Pedro Sac','2018-04-12','13:40:00',1),(23,'Zona 5','San Marcos','2018-04-15','14:50:00',1),(24,'Zona 3','San Marcos','2018-04-20','10:12:00',1),(25,'Catedral','San Marcos','2018-01-10','11:30:00',2),(26,'Hospital General','San Marcos','2018-01-14','12:35:00',2),(27,'Cementerio General','San Marcos','2018-01-25','09:45:00',2),(28,'USAC','San Marcos','2018-01-31','16:24:00',2),(29,'Terminal de Buses','San Pedro Sac','2018-02-05','11:18:00',2),(30,'Parque Central','San Pedro Sac','2018-02-10','12:03:00',2),(31,'Despensa Familiar','San Pedro Sac','2018-02-18','13:15:00',2),(32,'Escuela Delia Anzueto','San Pedro Sac','2018-02-25','14:48:00',2),(33,'Parque Central','San Pedro Sac','2018-01-10','13:35:00',3),(34,'Sanatorio Nazaret','San Pedro Sac','2018-01-17','11:20:00',3),(35,'Pollo del Campo','San Pedro Sac','2018-01-23','12:58:00',3),(36,'Cuarta Avenida','San Pedro Sac','2018-02-10','15:23:00',3),(37,'Parque Central','San Marcos','2018-02-22','17:29:00',3),(38,'Parque Central','San Marcos','2018-01-22','10:00:00',4),(39,'Hospital General','San Marcos','2018-01-28','12:00:00',4),(40,'Cementerio General','San Pedro Sac','2018-02-05','11:10:00',4),(41,'Terminal de Buses','San Pedro Sac','2018-02-12','11:25:00',4),(42,'El Mosquito','San Pedro Sac','2018-02-20','09:10:00',4),(43,'Parque Central','San Pedro Sac','2018-01-15','11:40:00',5),(44,'USAC','San Marcos','2018-01-22','13:25:00',5),(45,'El Galeron','San Marcos','2018-02-02','15:16:00',5),(46,'Sanatorio Nueva Vida','San Pedro Sac','2018-02-14','16:15:00',5),(47,'Terminal de Buses','San Pedro Sac','2018-01-12','12:36:00',6),(48,'Agencias Way','San Pedro Sac','2018-01-25','17:50:00',6),(49,'El Galeron','San Marcos','2018-01-31','16:48:00',6),(50,'Hospital General','San Marcos','2018-02-08','10:00:00',7),(51,'Adolfo V. Hall','San Marcos','2018-02-15','12:45:00',7),(52,'Parque Central','San Marcos','2018-02-03','09:09:00',8),(53,'Parque Central','San Pedro Sac','2018-02-15','13:45:00',8),(54,'Terminal de Buses','San Pedro Sac','2018-01-15','08:45:00',9),(55,'ZONA 3','San Marcos','2018-01-15','09:45:00',12);
/*!40000 ALTER TABLE `datos_infraccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_infractor`
--

DROP TABLE IF EXISTS `datos_infractor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_infractor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `conductor_ausente` varchar(120) NOT NULL,
  `genero` varchar(15) NOT NULL,
  `no_licencia` varchar(16) NOT NULL,
  `tipo_licencia` varchar(5) NOT NULL,
  `no_documento_dpi` varchar(16) NOT NULL,
  `domicilio` varchar(120) NOT NULL,
  `datos_vehiculo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_datos_infractor_datos_vehiculo_idx` (`datos_vehiculo_id`),
  CONSTRAINT `fk_datos_infractor_datos_vehiculo` FOREIGN KEY (`datos_vehiculo_id`) REFERENCES `datos_vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_infractor`
--

LOCK TABLES `datos_infractor` WRITE;
/*!40000 ALTER TABLE `datos_infractor` DISABLE KEYS */;
INSERT INTO `datos_infractor` VALUES (1,'ALEX','GARCIA','NO','M','1980958561214','B','1980958561214','SAN PEDRO SACATEPEQUEZ',1),(2,'GERARDO','DAVILA','NO','M','1980890981201','C','1980890981201','SAN MARCOS',2),(3,'GERARDO','DOMINGUEZ','NO','M','1980123451202','B','1980123451202','SAN PEDRO SACATEPEQUEZ',3),(4,'JESUS','BAMACA','NO','M','1980543211201','A','1980543211201','SAN MARCOS',4),(5,'JORGE','CARDONA','NO','M','1980678901203','B','1980678901203','SAN ANTONIO SACATEPEQUEZ',5),(6,'JOSUE','ANZUETO','NO','M','1980135791202','B','1980135791202','SAN PEDRO SACATEPEQUEZ',6),(7,'JOSEFINA','PEREZ','NO','F','1980086421201','B','1980086421201','SAN MARCOS',7),(8,'KARLA','OCHOA','NO','F','1980214351210','B','19802143561210','TEJUTLA',8),(9,'ANDREA','VASQUEZ','NO','F','1980334421215','B','1980334421215','MALACATAN',9),(10,'FERNANDO','MAZARIEGOS','NO','M','1980889971216','B','1980889971216','CATARINA',10),(11,'FAUSTINO','LOPEZ','NO','M','1980675481210','B','1980675481210','TEJUTLA',11),(12,'PABLO','ESCOBAR','NO','M','1980987051214','B','1980987051214','SAN MARCOS',12),(13,'PABLO','ESCOBAR','NO','M','1980987051214','B','1980987051214','SAN MARCOS',12);
/*!40000 ALTER TABLE `datos_infractor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_vehiculo`
--

DROP TABLE IF EXISTS `datos_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_vehiculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_multa` bigint(20) unsigned NOT NULL,
  `no_placa` varchar(20) NOT NULL,
  `no_tarjeta_cir` varchar(40) NOT NULL,
  `tipo_vehiculo` varchar(40) NOT NULL,
  `marca` varchar(40) NOT NULL,
  `color` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_placa_UNIQUE` (`no_placa`),
  UNIQUE KEY `no_multa_UNIQUE` (`no_multa`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_vehiculo`
--

LOCK TABLES `datos_vehiculo` WRITE;
/*!40000 ALTER TABLE `datos_vehiculo` DISABLE KEYS */;
INSERT INTO `datos_vehiculo` VALUES (1,2580,'P-321WCD','123456789','PICKUP','TOYOTA','ROJO'),(2,2581,'P-123WAF','987456123','SEDAN','TOYOTA','AZUL'),(3,2582,'P-66CBDC','8104858','CAMIONETA','HONDA','NEGRO'),(4,2583,'U-50F106','1306712','BUS URBANO','MERCEDEZ BENZ','BLANCO'),(5,2584,'C-11F126','7627623','CAMIONETA','MERCEDEZ BENZ','AMARILLO'),(6,2585,'P-36B87E','3866455','PICKUP','TOYOTA','ROJO'),(7,2586,'P-723FD1','5516474','SEDAN','VOLVO','NEGRO'),(8,2587,'C-5612E2','5966011','CAMIONETA','MERCEDEZ BENZ','ROJO'),(9,2588,'C-2F697B','6334992','CAMIONETA','MERCEDEZ BENZ','NARANJA'),(10,2589,'A-64BDD3','9471742','SEDAN','MITSUBISHI','BLANCO'),(11,2590,'P-987WGD','123456789','HATCHBACK','HONDA','BLANCO'),(12,2600,'P-123ABC','6578432','SEDAN','HONDA','NEGRO');
/*!40000 ALTER TABLE `datos_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observaciones`
--

DROP TABLE IF EXISTS `observaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `observacion` text,
  `datos_agente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_observaciones_datos_agente1_idx` (`datos_agente_id`),
  CONSTRAINT `fk_observaciones_datos_agente1` FOREIGN KEY (`datos_agente_id`) REFERENCES `datos_agente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observaciones`
--

LOCK TABLES `observaciones` WRITE;
/*!40000 ALTER TABLE `observaciones` DISABLE KEYS */;
INSERT INTO `observaciones` VALUES (1,'Se le instó a realizar el pago lo antes posible!!!',1);
/*!40000 ALTER TABLE `observaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `placa_usuario`
--

DROP TABLE IF EXISTS `placa_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `placa_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placa_usuario` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `credenciales_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_placa_usuario_credenciales1_idx` (`credenciales_id`),
  CONSTRAINT `fk_placa_usuario_credenciales1` FOREIGN KEY (`credenciales_id`) REFERENCES `credenciales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `placa_usuario`
--

LOCK TABLES `placa_usuario` WRITE;
/*!40000 ALTER TABLE `placa_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `placa_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilegios`
--

DROP TABLE IF EXISTS `privilegios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilegios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `privilegio` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `privilegio_UNIQUE` (`privilegio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilegios`
--

LOCK TABLES `privilegios` WRITE;
/*!40000 ALTER TABLE `privilegios` DISABLE KEYS */;
INSERT INTO `privilegios` VALUES (3,'ADMINISTRADOR'),(2,'AGENTE'),(1,'USUARIO');
/*!40000 ALTER TABLE `privilegios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'apimultas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-21 21:42:13
