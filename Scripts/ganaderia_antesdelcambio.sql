-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-07-2018 a las 17:01:06
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ganaderia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `cod_categoria` int(4) NOT NULL,
  `desc_categoria` varchar(30) NOT NULL,
  `baja_categoria` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`cod_categoria`, `desc_categoria`, `baja_categoria`) VALUES
(1, 'VAQUILLA', 0),
(3, 'TORO', 0),
(5, 'TORITOS', 0),
(11, 'TERNERO', 0),
(13, 'VACA', 0),
(16, 'PERROS', 0),
(18, 'NUEVA CATEGORIA', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejemplares`
--

CREATE TABLE `ejemplares` (
  `cod_ejemplar` int(11) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `carimbo` int(2) NOT NULL,
  `cod_tatuaje` int(4) NOT NULL,
  `cod_raza` int(11) NOT NULL,
  `cod_categoria` int(11) NOT NULL,
  `peso_inicial` double DEFAULT NULL,
  `observaciones` varchar(50) DEFAULT NULL,
  `baja_ejemplar` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ejemplares`
--

INSERT INTO `ejemplares` (`cod_ejemplar`, `fecha_nacimiento`, `carimbo`, `cod_tatuaje`, `cod_raza`, `cod_categoria`, `peso_inicial`, `observaciones`, `baja_ejemplar`) VALUES
(13, '2016-06-23', 16, 8, 4, 3, 56, 'ninguna', 0),
(14, '2017-07-13', 1, 0, 0, 0, 123.3, '', 0),
(32, '2017-07-14', 17, 9, 4, 5, 69, '', 0),
(33, '2017-07-06', 17, 12, 4, 5, 8, 'la la la', 1),
(34, '2017-10-18', 17, 13, 4, 16, 12, '', 0),
(35, '2017-10-18', 17, 13, 4, 16, 12, '', 0),
(36, '2017-10-17', 17, 20, 5, 5, 98, '', 0),
(37, '2017-10-11', 17, 18, 19, 16, 88, '', 0),
(38, '2017-10-11', 17, 19, 19, 16, 88, '', 0),
(39, '2017-10-09', 17, 31, 18, 17, 89, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotes`
--

CREATE TABLE `lotes` (
  `cod_lote` int(11) NOT NULL,
  `desc_lote` varchar(30) NOT NULL,
  `baja_lote` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lotes`
--

INSERT INTO `lotes` (`cod_lote`, `desc_lote`, `baja_lote`) VALUES
(1, 'NUEVO LOTE 3', 0),
(2, 'vacas preñadas', 0),
(3, 'VACAS PREÑADAS DEL SERVICIO PR', 0),
(4, 'TOROS ALZADOS A PUNTO DE EYACU', 0),
(5, 'VAQUILLONAS DE PRIMAVERA', 0),
(6, 'NUEVO LOTE', 0),
(7, 'NUEVO LOTE 2', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pesadas`
--

CREATE TABLE `pesadas` (
  `cod_pesada` int(11) NOT NULL,
  `cod_lote` int(4) NOT NULL,
  `cod_potrero` int(4) NOT NULL,
  `cod_raza` int(4) NOT NULL,
  `fecha` date NOT NULL,
  `pesador` int(8) NOT NULL,
  `observaciones` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pesadas`
--

INSERT INTO `pesadas` (`cod_pesada`, `cod_lote`, `cod_potrero`, `cod_raza`, `fecha`, `pesador`, `observaciones`) VALUES
(3, 1, 5, 3, '2017-07-04', 3, NULL),
(10, 3, 2, 4, '2017-07-21', 1, 'again'),
(11, 1, 5, 3, '2017-07-27', 1, ''),
(13, 2, 7, 5, '2017-10-21', 1, ''),
(14, 3, 2, 5, '2017-10-21', 1, ''),
(16, 1, 5, 5, '2017-10-26', 1, ''),
(18, 2, 8, 5, '2017-10-19', 1, 'se continua el pesaje'),
(19, 2, 7, 6, '2017-11-07', 1, 'guardando una modificacion'),
(21, 2, 7, 6, '2017-11-07', 1, 'todos cebus'),
(22, 2, 7, 6, '2017-11-07', 1, 'todos cebus'),
(23, 2, 7, 6, '2017-11-07', 1, 'todos cebus'),
(25, 2, 7, 6, '2017-11-07', 1, 'todos cebus'),
(26, 2, 7, 6, '2017-11-07', 1, 'todos cebus'),
(27, 7, 15, 12, '2017-11-01', 1, ''),
(28, 1, 5, 10, '2017-11-08', 1, ''),
(29, 3, 9, 5, '2017-11-09', 1, ''),
(31, 2, 8, 12, '2017-11-10', 1, ''),
(33, 3, 2, 6, '2018-07-05', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pesadores`
--

CREATE TABLE `pesadores` (
  `nro_dni` int(8) NOT NULL,
  `nom_pesador` varchar(30) NOT NULL,
  `ap_pesador` varchar(30) NOT NULL,
  `password` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `password2` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mail` varchar(50) NOT NULL,
  `rol_pesador` int(2) NOT NULL,
  `baja_pesador` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pesadores`
--

INSERT INTO `pesadores` (`nro_dni`, `nom_pesador`, `ap_pesador`, `password`, `password2`, `mail`, `rol_pesador`, `baja_pesador`) VALUES
(1, '1', '1', '1', '1', '1@1', 2, 0),
(2, '2', '2', '123456', '123456', '2@2', 1, 1),
(3, '3', '3', '3', '3', '3@3', 1, 0),
(4, '4', '4', '123456', '123456', '4@4', 2, 0),
(6, '6', '6', '6', '6', '6@6', 1, 0),
(8, '8', '8', '8', '8', '8@8', 1, 0),
(9, '9', '9', '123456', '123456', '9@9', 1, 0),
(11, '11', '11', '11', '11', '11@11', 1, 0),
(12, '12', '12', '12', '12', '12@12', 1, 0),
(13, '13', '13', '13', '13', '13@13', 1, 0),
(14, '14', '14', '14', '14', '14@14', 1, 0),
(32795750, 'CARLOS', 'ARREGIN', '123456', '123456', 'jose@leopoldo', 3, 0),
(547896321, 'enrique', 'leporatti', '$2y$10$Q7uZ5AW8', '$2y$10$malybYAr', 'enrique@leporatti', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `potreros`
--

CREATE TABLE `potreros` (
  `cod_potrero` int(11) NOT NULL,
  `cod_lote` int(11) NOT NULL,
  `desc_potrero` varchar(30) NOT NULL,
  `hectareas` int(11) DEFAULT NULL,
  `baja_potrero` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `potreros`
--

INSERT INTO `potreros` (`cod_potrero`, `cod_lote`, `desc_potrero`, `hectareas`, `baja_potrero`) VALUES
(2, 3, 'DD', 5, 0),
(5, 1, 'BLA ', 2, 0),
(6, 0, '1', 1, 0),
(7, 2, 'POTRERO', 0, 0),
(8, 2, 'SDFG', 0, 0),
(9, 3, 'FFFF', 0, 0),
(10, 0, 'SDFSDF', 0, 0),
(11, 1, 'EEEEEEEEEEE', 0, 0),
(12, 3, '111111', 34, 0),
(13, 2, 'A', 12, 0),
(14, 6, 'NUEVO POTRERO', 87, 0),
(15, 7, 'POTRERO 2', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razas`
--

CREATE TABLE `razas` (
  `cod_raza` int(11) NOT NULL,
  `desc_raza` varchar(20) NOT NULL,
  `baja_raza` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `razas`
--

INSERT INTO `razas` (`cod_raza`, `desc_raza`, `baja_raza`) VALUES
(3, 'HEREFORD', 1),
(4, 'BRAFORD', 1),
(5, 'CEBU', 0),
(6, '3/2 CEBU', 0),
(10, 'VAQUILLONA', 0),
(12, 'LEON', 0),
(13, 'MONCHO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_pesadas`
--

CREATE TABLE `registro_pesadas` (
  `id_registro` int(11) NOT NULL,
  `cod_ejemplar` int(11) NOT NULL,
  `peso_r` double NOT NULL,
  `cod_pesada_r` int(11) NOT NULL,
  `cod_lote_r` int(4) NOT NULL,
  `cod_potrero_r` int(4) NOT NULL,
  `cod_raza_r` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registro_pesadas`
--

INSERT INTO `registro_pesadas` (`id_registro`, `cod_ejemplar`, `peso_r`, `cod_pesada_r`, `cod_lote_r`, `cod_potrero_r`, `cod_raza_r`) VALUES
(3, 13, 66, 10, 3, 2, 4),
(4, 13, 13, 10, 3, 2, 4),
(5, 13, 4, 11, 1, 5, 3),
(6, 13, 78, 19, 2, 7, 6),
(7, 32, 23, 19, 2, 7, 6),
(8, 34, 12, 19, 2, 7, 6),
(9, 13, 65, 21, 2, 7, 6),
(10, 13, 43, 22, 2, 7, 6),
(11, 13, 45, 23, 2, 7, 6),
(12, 13, 78, 25, 2, 7, 6),
(13, 13, 98, 26, 2, 7, 6),
(14, 13, 98, 26, 2, 7, 6),
(15, 13, 78, 19, 2, 7, 6),
(16, 13, 56, 28, 1, 5, 10),
(17, 0, 67, 28, 1, 5, 10),
(18, 13, 98, 28, 1, 5, 10),
(19, 13, 45, 28, 1, 5, 10),
(20, 13, 33, 19, 2, 7, 6),
(25, 13, 1, 31, 2, 8, 12),
(26, 13, 78, 18, 2, 8, 5),
(27, 13, 87, 33, 3, 2, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tatuajes`
--

CREATE TABLE `tatuajes` (
  `cod_tatuaje` int(4) NOT NULL,
  `tatuaje` varchar(4) NOT NULL,
  `caravana` varchar(8) NOT NULL,
  `colocacion_caravana` date DEFAULT NULL,
  `observacion` varchar(50) DEFAULT NULL,
  `baja_tatuaje` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tatuajes`
--

INSERT INTO `tatuajes` (`cod_tatuaje`, `tatuaje`, `caravana`, `colocacion_caravana`, `observacion`, `baja_tatuaje`) VALUES
(8, 'FFFF', '2022', '2017-10-18', '', 1),
(9, '018', 'B353', '2015-06-10', '', 0),
(12, '6226', '7010', '2015-02-04', 'bla bla bla', 0),
(13, 'K595', '2022', '2017-07-07', '', 0),
(15, 'D1', 'UY', '2017-08-04', '', 0),
(18, 'RR', 'R1', '2017-08-04', '', 0),
(19, 'Y', '5', '2017-08-04', 'pan  pana', 0),
(20, 'X', '1', '2017-08-04', 'ddddd', 0),
(29, 'G', '2', '2017-08-03', '', 1),
(31, 'H', '2', '2017-08-04', '', 0),
(33, 'F', '1', '2017-08-04', '', 0),
(36, 'P', '1', '2017-08-01', 'bien ahi', 0),
(37, 'O', '5', '2017-07-06', '', 0),
(38, 'RRF', '2022', '2017-10-18', '', 0),
(39, 'SFDG', 'DFG', '2017-10-11', '', 0),
(40, 'DFG', 'DF', '2017-10-04', '', 0),
(41, 'SDFS', 'SDFSDF', '2017-10-19', '', 0),
(42, 'SDFS', 'SDFSDF', '2017-10-06', '', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`cod_categoria`),
  ADD KEY `desc_categoria` (`desc_categoria`);

--
-- Indices de la tabla `ejemplares`
--
ALTER TABLE `ejemplares`
  ADD PRIMARY KEY (`cod_ejemplar`),
  ADD KEY `cod_tatuaje` (`cod_tatuaje`),
  ADD KEY `cod_raza` (`cod_raza`),
  ADD KEY `cod_categoria` (`cod_categoria`);

--
-- Indices de la tabla `lotes`
--
ALTER TABLE `lotes`
  ADD PRIMARY KEY (`cod_lote`),
  ADD KEY `desc_lote` (`desc_lote`);

--
-- Indices de la tabla `pesadas`
--
ALTER TABLE `pesadas`
  ADD PRIMARY KEY (`cod_pesada`,`cod_lote`,`cod_potrero`,`cod_raza`),
  ADD KEY `cod_raza` (`cod_raza`),
  ADD KEY `cod_potrero` (`cod_potrero`,`cod_lote`),
  ADD KEY `pesador` (`pesador`);

--
-- Indices de la tabla `pesadores`
--
ALTER TABLE `pesadores`
  ADD PRIMARY KEY (`nro_dni`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- Indices de la tabla `potreros`
--
ALTER TABLE `potreros`
  ADD PRIMARY KEY (`cod_potrero`,`cod_lote`),
  ADD KEY `desc_potrero` (`desc_potrero`),
  ADD KEY `cod_lote` (`cod_lote`);

--
-- Indices de la tabla `razas`
--
ALTER TABLE `razas`
  ADD PRIMARY KEY (`cod_raza`),
  ADD KEY `desc_raza` (`desc_raza`);

--
-- Indices de la tabla `registro_pesadas`
--
ALTER TABLE `registro_pesadas`
  ADD PRIMARY KEY (`id_registro`),
  ADD KEY `FKpesadas` (`cod_pesada_r`,`cod_lote_r`,`cod_potrero_r`,`cod_raza_r`);

--
-- Indices de la tabla `tatuajes`
--
ALTER TABLE `tatuajes`
  ADD PRIMARY KEY (`cod_tatuaje`),
  ADD KEY `tatuaje` (`tatuaje`,`caravana`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `cod_categoria` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `ejemplares`
--
ALTER TABLE `ejemplares`
  MODIFY `cod_ejemplar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT de la tabla `lotes`
--
ALTER TABLE `lotes`
  MODIFY `cod_lote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `pesadas`
--
ALTER TABLE `pesadas`
  MODIFY `cod_pesada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT de la tabla `potreros`
--
ALTER TABLE `potreros`
  MODIFY `cod_potrero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `razas`
--
ALTER TABLE `razas`
  MODIFY `cod_raza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `registro_pesadas`
--
ALTER TABLE `registro_pesadas`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `tatuajes`
--
ALTER TABLE `tatuajes`
  MODIFY `cod_tatuaje` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pesadas`
--
ALTER TABLE `pesadas`
  ADD CONSTRAINT `pesada_ibfk_1` FOREIGN KEY (`cod_raza`) REFERENCES `razas` (`cod_raza`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pesada_ibfk_2` FOREIGN KEY (`cod_potrero`,`cod_lote`) REFERENCES `potreros` (`cod_potrero`, `cod_lote`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pesada_ibfk_3` FOREIGN KEY (`pesador`) REFERENCES `pesadores` (`nro_dni`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `registro_pesadas`
--
ALTER TABLE `registro_pesadas`
  ADD CONSTRAINT `FKpesadas` FOREIGN KEY (`cod_pesada_r`,`cod_lote_r`,`cod_potrero_r`,`cod_raza_r`) REFERENCES `pesadas` (`cod_pesada`, `cod_lote`, `cod_potrero`, `cod_raza`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
