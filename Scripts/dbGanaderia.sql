--
-- Base de datos: `ganaderia`
--
CREATE DATABASE ganaderia;
USE ganaderia;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `cod_categoria` int(4) NOT NULL AUTO_INCREMENT,
  `desc_categoria` varchar(30) NOT NULL,
  `estado_categoria` int(1) NOT NULL,
  PRIMARY KEY (`cod_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotes`
--

CREATE TABLE `lotes` (
  `cod_lote` int(11) NOT NULL AUTO_INCREMENT,
  `desc_lote` varchar(30) NOT NULL,
  `estado_lote` int(1) NOT NULL,
PRIMARY KEY (`cod_lote`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `potreros`
--

CREATE TABLE `potreros` (
  `cod_potrero` int(11) NOT NULL AUTO_INCREMENT,
  `desc_potrero` varchar(30) NOT NULL,
  `hectareas` int(11) DEFAULT NULL,
  `estado_potrero` int(1) NOT NULL,
  PRIMARY KEY (`cod_potrero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razas`
--

CREATE TABLE `razas` (
  `cod_raza` int(11) NOT NULL AUTO_INCREMENT,
  `desc_raza` varchar(20) NOT NULL,
  `estado_raza` int(1) NOT NULL,
 PRIMARY KEY (`cod_raza`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--
DROP TABLE estados;
CREATE TABLE `estados` (
  `cod_estado` int(1) NOT NULL AUTO_INCREMENT,
  `desc_estado` varchar(8) NOT NULL,
  PRIMARY KEY (`cod_estado`)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol de pesadores`
--

CREATE TABLE `rol_usuarios` (
  `cod_rol` int(1) NOT NULL AUTO_INCREMENT,
  `desc_rol` varchar(15) NOT NULL,
  PRIMARY KEY(`cod_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pesadores`
--
DROP TABLE USUARIOS;
CREATE TABLE `pesadores` (
-- --------------------------------------------------------
  `nro_dni` int(8) NOT NULL,
  `nom_pesador` varchar(30) NOT NULL,
  `ap_pesador` varchar(30) NOT NULL,
  `contrasenia` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `correo` varchar(50) NOT NULL,
  `cod_rol` int(1) NOT NULL,
  `estado_pesador` int(1) NOT NULL,
  PRIMARY KEY(`nro_dni`),
  FOREIGN KEY (`cod_rol`) REFERENCES `rol_usuarios` (`cod_rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Estructura de tabla para la tabla `tatuajes`
--

CREATE TABLE `tatuajes` (
  `cod_tatuaje` int(4) NOT NULL AUTO_INCREMENT,
  `desc_tatuaje` varchar(4) NOT NULL,
  `caravana` varchar(8) NOT NULL,
  `colocacion_caravana` date DEFAULT NULL,
  `observacion` varchar(50) DEFAULT NULL,
  `estado_tatuaje` int(1) NOT NULL,
  PRIMARY KEY(`cod_tatuaje`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejemplares`
--

CREATE TABLE `ejemplares` (
  `cod_ejemplar` int(11) NOT NULL AUTO_INCREMENT,
  `carimbo` int(2) NOT NULL,
  `cod_raza` int(11) NOT NULL,
  `cod_tatuaje` int(4) NOT NULL,  
  `cod_categoria` int(11) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `peso_inicial` double DEFAULT NULL,
  `observaciones` varchar(50) DEFAULT NULL,
  `estado_ejemplar` int(1) NOT NULL,
  PRIMARY KEY(`cod_ejemplar`,`carimbo`,`cod_raza`,`cod_tatuaje`),
  FOREIGN KEY (`cod_raza`) REFERENCES `razas` (`cod_raza`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`cod_tatuaje`) REFERENCES `tatuajes` (`cod_tatuaje`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pesadas`
--

CREATE TABLE `pesadas` (
  `cod_pesada` int(11) NOT NULL AUTO_INCREMENT,
  `cod_lote` int(4) NOT NULL,
  `cod_potrero` int(4) NOT NULL,
  `cod_raza` int(4) NOT NULL,
  `fecha` date NOT NULL,
  `pesador` int(8) NOT NULL,
  `observaciones` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_pesada`),
  FOREIGN KEY (`cod_lote`) REFERENCES `lotes` (`cod_lote`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`cod_potrero`) REFERENCES `potreros` (`cod_potrero`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`cod_raza`) REFERENCES `razas` (`cod_raza`) ON DELETE CASCADE ON UPDATE CASCADE,
  INDEX (`cod_lote`,`cod_potrero`,`cod_raza`),
  INDEX (`pesador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_pesadas`
--

CREATE TABLE `registro_pesadas` (
  `id_registro` int(11) NOT NULL AUTO_INCREMENT,
  `cod_pesada` int(11) NOT NULL,
  `cod_ejemplar` int(11) NOT NULL,
  `carimbo` int(2) NOT NULL,
  `cod_raza` int(11) NOT NULL,
  `cod_tatuaje` int(4) NOT NULL, 
  `caravana` varchar(8), 
  `peso_r` double NOT NULL,
  PRIMARY KEY(`id_registro`,`cod_pesada`),
  FOREIGN KEY (`cod_pesada`) REFERENCES `pesadas` (`cod_pesada`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`cod_ejemplar`,`carimbo`,`cod_raza`,`cod_tatuaje`) REFERENCES `ejemplares` (`cod_ejemplar`,`carimbo`,`cod_raza`,`cod_tatuaje`) ON DELETE CASCADE ON UPDATE CASCADE
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
