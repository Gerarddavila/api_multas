-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tiempo de generación: 17-04-2018 a las 00:10:48
-- Versión del servidor: 5.6.35
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `apimult_as`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo_infringido`
--

CREATE TABLE IF NOT EXISTS `articulo_infringido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_articulo` int(10) unsigned NOT NULL,
  `descripcion_articulo` text NOT NULL,
  `base_legal` text NOT NULL,
  `monto_infraccion` decimal(10,0) unsigned NOT NULL,
  `datos_vehiculo_id` int(11) NOT NULL,
  `datos_infraccion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_articulo_infringido_datos_vehiculo1_idx` (`datos_vehiculo_id`),
  KEY `fk_articulo_infringido_datos_infraccion1_idx` (`datos_infraccion_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `articulo_infringido`
--

INSERT INTO `articulo_infringido` (`id`, `no_articulo`, `descripcion_articulo`, `base_legal`, `monto_infraccion`, `datos_vehiculo_id`, `datos_infraccion_id`) VALUES
(1, 1, 'Mal estacionado', '---------', '500', 1, 1),
(2, 1, 'Choque', 'Ley y reglamento', '400', 2, 3),
(3, 3, 'Estacion prohibido', 'Ley y reglamento', '300', 4, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credenciales`
--

CREATE TABLE IF NOT EXISTS `credenciales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `password` varchar(20) NOT NULL,
  `privilegios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  KEY `fk_credenciales_privilegios1_idx` (`privilegios_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `credenciales`
--

INSERT INTO `credenciales` (`id`, `usuario`, `password`, `privilegios_id`) VALUES
(1, 'GDAVILA', 'GDAVILA', 3),
(2, 'GDOMINGUEZ', 'GDOMINGUEZ', 3),
(3, 'FLOPEZ', 'FLOPEZ', 2),
(4, 'JSOTO', 'JSOTO', 2),
(5, 'KGONZALEZ', 'KGONZALEZ', 2),
(6, 'AGARCIA', 'AGARCIA', 1),
(7, 'ALOPEZ', 'ALOPEZ', 1),
(8, 'CGALVEZ', 'CGALVEZ', 1),
(9, 'LFUENTES', 'LFUENTES', 1),
(10, 'RMIRANDA', 'RMIRANDA', 1),
(11, 'JPEREZ', 'JPEREZ', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_agente`
--

CREATE TABLE IF NOT EXISTS `datos_agente` (
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
  KEY `fk_datos_agente_datos_infraccion1_idx` (`datos_infraccion_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `datos_agente`
--

INSERT INTO `datos_agente` (`id`, `no_identificacion`, `firmo_agente`, `firmo_infractor`, `nego_firmar_infractor`, `datos_vehiculo_id`, `articulo_infringido_id`, `datos_infraccion_id`) VALUES
(1, '00001', 1, 1, 0, 1, 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_infraccion`
--

CREATE TABLE IF NOT EXISTS `datos_infraccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lugar_infraccion` text NOT NULL,
  `fecha_infraccion` date NOT NULL,
  `hora_infraccion` time NOT NULL,
  `datos_vehiculo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_datos_infraccion_datos_vehiculo1_idx` (`datos_vehiculo_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `datos_infraccion`
--

INSERT INTO `datos_infraccion` (`id`, `lugar_infraccion`, `fecha_infraccion`, `hora_infraccion`, `datos_vehiculo_id`) VALUES
(14, 'El arbolon, San Pedro Sac', '2018-02-14', '00:30:00', 1),
(3, 'Gallo rojo, San Pedro Sac. S.M', '2018-01-23', '16:30:00', 3),
(4, 'El Mosquito, San Pedro Sac', '2018-02-15', '10:30:00', 4),
(5, 'Terminal, San Marcos', '2018-02-26', '05:45:00', 5),
(6, 'La Calzada, San Pedro Sac. S.M', '2018-03-02', '15:18:00', 6),
(7, '7ma. Avenida, San Pedro Sac. S.M', '2018-03-02', '15:18:00', 7),
(8, '12va. Avenida, San Pedro Sac. S.M', '2018-03-11', '20:48:00', 8),
(9, 'Parque Central, San Pedro Sac. S.M', '2018-03-15', '15:28:00', 9),
(10, 'Zona 3 San Marcos ', '2018-03-15', '16:28:00', 10),
(11, 'Zona 5 San Marcos ', '2018-03-20', '11:50:00', 11),
(12, 'Zona 3 San Marcos ', '0000-00-00', '16:28:00', 10),
(13, 'Zona 20 San Marcos ', '0000-00-00', '10:08:00', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_infractor`
--

CREATE TABLE IF NOT EXISTS `datos_infractor` (
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
  KEY `fk_datos_infractor_datos_vehiculo_idx` (`datos_vehiculo_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `datos_infractor`
--

INSERT INTO `datos_infractor` (`id`, `nombres`, `apellidos`, `conductor_ausente`, `genero`, `no_licencia`, `tipo_licencia`, `no_documento_dpi`, `domicilio`, `datos_vehiculo_id`) VALUES
(1, 'ALEX', 'GARCIA', 'NO', 'M', '1980958561214', 'B', '1980958561214', 'SAN PEDRO SACATEPEQUEZ', 1),
(2, 'GERARDO', 'DAVILA', 'NO', 'M', '1980890981201', 'C', '1980890981201', 'SAN MARCOS', 2),
(3, 'GERARDO', 'DOMINGUEZ', 'NO', 'M', '1980123451202', 'B', '1980123451202', 'SAN PEDRO SACATEPEQUEZ', 3),
(4, 'JESUS', 'BAMACA', 'NO', 'M', '1980543211201', 'A', '1980543211201', 'SAN MARCOS', 4),
(5, 'JORGE', 'CARDONA', 'NO', 'M', '1980678901203', 'B', '1980678901203', 'SAN ANTONIO SACATEPEQUEZ', 5),
(6, 'JOSUE', 'ANZUETO', 'NO', 'M', '1980135791202', 'B', '1980135791202', 'SAN PEDRO SACATEPEQUEZ', 6),
(7, 'JOSEFINA', 'PEREZ', 'NO', 'F', '1980086421201', 'B', '1980086421201', 'SAN MARCOS', 7),
(8, 'KARLA', 'OCHOA', 'NO', 'F', '1980214351210', 'B', '19802143561210', 'TEJUTLA', 8),
(9, 'ANDREA', 'VASQUEZ', 'NO', 'F', '1980334421215', 'B', '1980334421215', 'MALACATAN', 9),
(10, 'FERNANDO', 'MAZARIEGOS', 'NO', 'M', '1980889971216', 'B', '1980889971216', 'CATARINA', 10),
(11, 'FAUSTINO', 'LOPEZ', 'NO', 'M', '1980675481210', 'B', '1980675481210', 'TEJUTLA', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_vehiculo`
--

CREATE TABLE IF NOT EXISTS `datos_vehiculo` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `datos_vehiculo`
--

INSERT INTO `datos_vehiculo` (`id`, `no_multa`, `no_placa`, `no_tarjeta_cir`, `tipo_vehiculo`, `marca`, `color`) VALUES
(1, 2580, 'P-321WCD', '123456789', 'Pickup', 'Toyota', 'Rojo'),
(2, 2581, 'P-123WAF', '987456123', 'Sedan', 'Toyota', 'Azul'),
(3, 2582, 'P-66CBDC', '8104858', 'CAMIONETA', 'HONDA', 'NEGRO'),
(4, 2583, 'U-50F106', '1306712', 'BUS URBANO', 'MERCEDEZ BENZ', 'BLANCO'),
(5, 2584, 'C-11F126', '7627623', 'CAMIONETA', 'MERCEDEZ BENZ', 'AMARILLO'),
(6, 2585, 'P-36B87E', '3866455', 'PICKUP', 'TOYOTA', 'ROJO'),
(7, 2586, 'P-723FD1', '5516474', 'SEDAN', 'VOLVO', 'NEGRO'),
(8, 2587, 'C-5612E2', '5966011', 'CAMIONETA', 'MERCEDEZ BENZ', 'ROJO'),
(9, 2588, 'C-2F697B', '6334992', 'CAMIONETA', 'MERCEDEZ BENZ', 'NARANJA'),
(10, 2589, 'A-64BDD3', '9471742', 'SEDAN', 'MITSUBISHI', 'BLANCO'),
(13, 2595, 'P-987WGD', '123456789', 'HATCHBACK', 'HONDA', 'BLANCO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observaciones`
--

CREATE TABLE IF NOT EXISTS `observaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `observacion` text,
  `datos_agente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_observaciones_datos_agente1_idx` (`datos_agente_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `observaciones`
--

INSERT INTO `observaciones` (`id`, `observacion`, `datos_agente_id`) VALUES
(1, 'Se le instó a realizar el pago lo antes posible!!!', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegios`
--

CREATE TABLE IF NOT EXISTS `privilegios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `privilegio` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `privilegio_UNIQUE` (`privilegio`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `privilegios`
--

INSERT INTO `privilegios` (`id`, `privilegio`) VALUES
(1, 'USUARIO'),
(2, 'AGENTE'),
(3, 'ADMINISTRADOR');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
