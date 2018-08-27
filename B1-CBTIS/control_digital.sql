-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2015 a las 02:49:26
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `control_digital`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `num_cliente` int(11) NOT NULL,
  `nombre_cte` varchar(30) DEFAULT NULL,
  `ape_cte` varchar(30) DEFAULT NULL,
  `tel_cte` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`num_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`num_cliente`, `nombre_cte`, `ape_cte`, `tel_cte`) VALUES
(11, 'ramon', 'de la cruz', '8341567889'),
(12, 'armando', 'zuñiga', '8341254512'),
(13, 'oscar', 'martinez', '8321452536');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE IF NOT EXISTS `compras` (
  `folio2` int(11) NOT NULL,
  `cod_prov` int(11) NOT NULL,
  `fecha2` date DEFAULT NULL,
  `cant` int(11) DEFAULT NULL,
  PRIMARY KEY (`folio2`),
  KEY `cod_prov` (`cod_prov`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`folio2`, `cod_prov`, `fecha2`, `cant`) VALUES
(101, 101, '2015-01-15', 100),
(102, 102, '2001-02-15', 95),
(103, 103, '2002-02-15', 90);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computadoras`
--

CREATE TABLE IF NOT EXISTS `computadoras` (
  `cod_comp` int(11) NOT NULL,
  `caracteristicas` varchar(30) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `marca` varchar(15) DEFAULT NULL,
  `stock` bit(1) DEFAULT NULL,
  `tamaño` varchar(5) DEFAULT NULL,
  `cod_prov` int(11) NOT NULL,
  PRIMARY KEY (`cod_comp`),
  KEY `cod_prov` (`cod_prov`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `computadoras`
--

INSERT INTO `computadoras` (`cod_comp`, `caracteristicas`, `precio`, `marca`, `stock`, `tamaño`, `cod_prov`) VALUES
(11, 'computadora personal', 9000, 'Hp', b'1', 'grand', 101),
(12, 'computadora portatil', 8500, 'Acer', b'1', 'media', 102),
(13, 'PC', 800, 'Canonn210', b'1', 'short', 103);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE IF NOT EXISTS `empleados` (
  `num_emp` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `rfc2` varchar(10) DEFAULT NULL,
  `tel` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`num_emp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`num_emp`, `nombre`, `apellidos`, `rfc2`, `tel`) VALUES
(11, 'Aldahir Joe', 'Vargas Moreno', 'VAMO060274', '8341562346'),
(12, 'Samuel Osvaldo', 'Cano Walle', 'CAWA151289', '8331234568'),
(13, 'Gabriela Juanita', 'Castillo Martinez', 'CAMA250469', '8111245241');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE IF NOT EXISTS `proveedores` (
  `cod_prov` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `domcilio` varchar(35) DEFAULT NULL,
  `rfc` varchar(10) DEFAULT NULL,
  `tel` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cod_prov`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`cod_prov`, `nombre`, `apellido`, `domcilio`, `rfc`, `tel`) VALUES
(101, 'Jorge Alberto', 'Reyes De la Cruz', 'Cd Victoria,Tamps', 'RECO060189', '8112534512'),
(102, 'Graciela', 'De la Rosa Zuñiga', 'Matamoros,Tamps', 'DEZU050275', '8321523421'),
(103, 'Luis Alonso', 'Garcia Vazquez', 'Reynosa,Tamps', 'GAVA250673', '8341562536');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE IF NOT EXISTS `ventas` (
  `folio` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `cod_comp` int(11) NOT NULL,
  `num_cliente` int(11) NOT NULL,
  `suma` float DEFAULT NULL,
  `num_emp` int(11) NOT NULL,
  PRIMARY KEY (`folio`),
  KEY `num_cliente` (`num_cliente`),
  KEY `num_emp` (`num_emp`),
  KEY `ventas_ibfk_1` (`cod_comp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`folio`, `fecha`, `cod_comp`, `num_cliente`, `suma`, `num_emp`) VALUES
(11, '2008-02-12', 11, 11, 10000, 11),
(12, '2009-02-09', 12, 12, 99999, 12),
(13, '2012-12-12', 13, 13, 88888, 13);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`cod_prov`) REFERENCES `proveedores` (`cod_prov`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `computadoras`
--
ALTER TABLE `computadoras`
  ADD CONSTRAINT `cod_prov` FOREIGN KEY (`cod_prov`) REFERENCES `proveedores` (`cod_prov`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`cod_comp`) REFERENCES `computadoras` (`cod_comp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`num_cliente`) REFERENCES `clientes` (`num_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`num_emp`) REFERENCES `empleados` (`num_emp`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
