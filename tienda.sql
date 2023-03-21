-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 21-03-2023 a las 22:42:44
-- Versión del servidor: 8.0.32
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_general`
--

DROP TABLE IF EXISTS `catalogo_general`;
CREATE TABLE IF NOT EXISTS `catalogo_general` (
  `codigo_producto` int NOT NULL,
  `nombre_producto` varchar(40) NOT NULL,
  `costo` float NOT NULL,
  `precio` float NOT NULL,
  `existencias` int NOT NULL,
  PRIMARY KEY (`codigo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `catalogo_general`
--

INSERT INTO `catalogo_general` (`codigo_producto`, `nombre_producto`, `costo`, `precio`, `existencias`) VALUES
(123, 'Producto 1', 13.44, 18.5, 380),
(124, 'Producto 2', 5.2, 7.5, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_tienda`
--

DROP TABLE IF EXISTS `catalogo_tienda`;
CREATE TABLE IF NOT EXISTS `catalogo_tienda` (
  `codigo_tienda` int NOT NULL,
  `codigo_producto` int NOT NULL,
  `existencias` int NOT NULL,
  KEY `codigo_producto` (`codigo_producto`),
  KEY `codigo_tienda` (`codigo_tienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `catalogo_tienda`
--

INSERT INTO `catalogo_tienda` (`codigo_tienda`, `codigo_producto`, `existencias`) VALUES
(11, 123, 20),
(11, 124, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

DROP TABLE IF EXISTS `devoluciones`;
CREATE TABLE IF NOT EXISTS `devoluciones` (
  `id_devolucion` int NOT NULL,
  `id_envio` int DEFAULT NULL,
  `codigo_tienda` int NOT NULL,
  `codigo_ut` int NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `total_devolucion` float NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id_devolucion`),
  KEY `codigo_tienda_2` (`codigo_tienda`),
  KEY `codigo_ut_2` (`codigo_ut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `devoluciones`
--

INSERT INTO `devoluciones` (`id_devolucion`, `id_envio`, `codigo_tienda`, `codigo_ut`, `fecha_devolucion`, `total_devolucion`, `estado`) VALUES
(100, 1, 11, 123, '2023-03-20', 0, 'Activo'),
(250, NULL, 11, 123, '2023-03-16', 0, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

DROP TABLE IF EXISTS `envios`;
CREATE TABLE IF NOT EXISTS `envios` (
  `id_envio` int NOT NULL,
  `id_pedido` int DEFAULT NULL,
  `codigo_tienda` int NOT NULL,
  `codigo_usuario` int NOT NULL,
  `fecha_salida` date NOT NULL,
  `fecha_recibido` date NOT NULL,
  `total_envio` float NOT NULL,
  `estado` varchar(15) NOT NULL,
  PRIMARY KEY (`id_envio`),
  UNIQUE KEY `codigo_usuario` (`codigo_usuario`),
  KEY `codigo_tienda` (`codigo_tienda`),
  KEY `id_pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `envios`
--

INSERT INTO `envios` (`id_envio`, `id_pedido`, `codigo_tienda`, `codigo_usuario`, `fecha_salida`, `fecha_recibido`, `total_envio`, `estado`) VALUES
(15, 1, 11, 123, '2023-03-02', '2023-03-17', 240, 'Despachado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencias`
--

DROP TABLE IF EXISTS `incidencias`;
CREATE TABLE IF NOT EXISTS `incidencias` (
  `id_incidencia` int NOT NULL,
  `id_envio` int DEFAULT NULL,
  `codigo_tienda` int NOT NULL,
  `codigo_ut` int NOT NULL,
  `fecha_incidencia` date NOT NULL,
  `estado` varchar(15) NOT NULL,
  `Solucion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_incidencia`),
  KEY `codigo_tienda` (`codigo_tienda`),
  KEY `codigo_ut` (`codigo_ut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `incidencias`
--

INSERT INTO `incidencias` (`id_incidencia`, `id_envio`, `codigo_tienda`, `codigo_ut`, `fecha_incidencia`, `estado`, `Solucion`) VALUES
(100, 1, 11, 123, '2023-03-20', 'Activo', NULL),
(200, NULL, 11, 123, '2023-03-16', 'Activo', NULL),
(350, NULL, 11, 123, '2023-03-16', 'Activo', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listado_devolciones`
--

DROP TABLE IF EXISTS `listado_devolciones`;
CREATE TABLE IF NOT EXISTS `listado_devolciones` (
  `id_devolucion` int NOT NULL,
  `codigo_producto` int NOT NULL,
  `costo_unitario` float NOT NULL,
  `cantidad` int NOT NULL,
  `costo_total` float NOT NULL,
  `motivo` varchar(100) NOT NULL,
  KEY `codigo_producto_2` (`codigo_producto`),
  KEY `id_devolucion_2` (`id_devolucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `listado_devolciones`
--

INSERT INTO `listado_devolciones` (`id_devolucion`, `codigo_producto`, `costo_unitario`, `cantidad`, `costo_total`, `motivo`) VALUES
(250, 123, 13.44, 5, 67.2, 'dañooo'),
(100, 123, 13.44, 25, 336, 'esta dañado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listado_envios`
--

DROP TABLE IF EXISTS `listado_envios`;
CREATE TABLE IF NOT EXISTS `listado_envios` (
  `id_envio` int NOT NULL,
  `codigo_producto` int NOT NULL,
  `nombre_producto` varchar(40) NOT NULL,
  `costo_unitario` float NOT NULL,
  `cantidad` int NOT NULL,
  `costo_total` float NOT NULL,
  KEY `id_envio_2` (`id_envio`),
  KEY `codigo_producto_2` (`codigo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `listado_envios`
--

INSERT INTO `listado_envios` (`id_envio`, `codigo_producto`, `nombre_producto`, `costo_unitario`, `cantidad`, `costo_total`) VALUES
(15, 123, 'Producto 1', 13.44, 30, 403.2),
(15, 124, 'Producto 2', 5.2, 50, 260);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listado_pedido`
--

DROP TABLE IF EXISTS `listado_pedido`;
CREATE TABLE IF NOT EXISTS `listado_pedido` (
  `id_pedido` int NOT NULL,
  `codigo_producto` int NOT NULL,
  `nombre_producto` varchar(40) NOT NULL,
  `costo_unitario` float NOT NULL,
  `cantidad` int NOT NULL,
  `costo_total` float NOT NULL,
  KEY `id_pedido` (`id_pedido`),
  KEY `codigo_producto` (`codigo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `listado_pedido`
--

INSERT INTO `listado_pedido` (`id_pedido`, `codigo_producto`, `nombre_producto`, `costo_unitario`, `cantidad`, `costo_total`) VALUES
(500, 123, 'Producto 1', 13.44, 20, 268.8),
(500, 124, 'Producto 2', 5.2, 50, 260),
(1000, 123, 'Producto 1', 8465, 46548, 65165100),
(1, 123, 'Producto 1', 13.44, 4, 53.76),
(1, 124, 'Producto 2', 5.2, 3, 15.6),
(5, 123, 'Producto 1', 13.44, 1, 13.44),
(5, 124, 'Producto 2', 5.2, 1, 5.2),
(58, 123, 'Producto 1', 13.44, 20, 268.8),
(58, 124, 'Producto 2', 5.2, 58, 301.6),
(25, 123, 'Producto 1', 13.44, 10, 134.4),
(25, 124, 'Producto 2', 5.2, 25, 130),
(55, 124, 'Producto 2', 5.2, 25, 130);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_incidencias`
--

DROP TABLE IF EXISTS `lista_incidencias`;
CREATE TABLE IF NOT EXISTS `lista_incidencias` (
  `id_incidencia` int NOT NULL,
  `codigo_producto` int NOT NULL,
  `nombre_producto` varchar(40) NOT NULL,
  `cantidad` int NOT NULL,
  `motivo` varchar(150) NOT NULL,
  `costo_total` float NOT NULL,
  KEY `id_incidencia` (`id_incidencia`),
  KEY `codigo_producto` (`codigo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `lista_incidencias`
--

INSERT INTO `lista_incidencias` (`id_incidencia`, `codigo_producto`, `nombre_producto`, `cantidad`, `motivo`, `costo_total`) VALUES
(200, 124, 'Producto 2', 20, 'daño', 104),
(350, 123, 'Producto 1', 5, 'dañoo', 67.2),
(100, 124, 'Producto 2', 45, 'esta dañado', 234);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id_pedido` int NOT NULL,
  `codigo_tienda` int NOT NULL,
  `codigo_ut` int NOT NULL,
  `fecha_pedido` date NOT NULL,
  `total_pedido` float NOT NULL,
  `estado` varchar(15) NOT NULL,
  `motivo_rechazo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `codigo_tienda` (`codigo_tienda`),
  KEY `codigo_ut` (`codigo_ut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `codigo_tienda`, `codigo_ut`, `fecha_pedido`, `total_pedido`, `estado`, `motivo_rechazo`) VALUES
(1, 11, 123, '2023-02-03', 41, 'SOLICITADO', NULL),
(5, 11, 123, '2023-03-21', 0, 'Pendiente', NULL),
(25, 11, 123, '2023-03-14', 0, 'Solicitado', NULL),
(55, 11, 123, '2023-03-14', 0, 'Solicitado', NULL),
(58, 11, 123, '2023-03-16', 0, 'Rechazado', 'No cumple'),
(100, 11, 123, '2023-03-14', 10, 'Solicitado', NULL),
(202, 11, 123, '2023-03-14', 0, 'Solicitado', NULL),
(500, 11, 123, '2023-03-14', 0, 'Enviado', NULL),
(1000, 11, 123, '2023-03-14', 0, 'Rechazado', 'No tiene productos'),
(2022, 11, 123, '2023-03-14', 0, 'Solicitado', NULL),
(5321, 200, 100, '2023-02-03', 5251, 'Enviado', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

DROP TABLE IF EXISTS `tienda`;
CREATE TABLE IF NOT EXISTS `tienda` (
  `codigo_tienda` int NOT NULL,
  `nombre_tienda` varchar(40) NOT NULL,
  `direccion_tienda` varchar(50) NOT NULL,
  `tipo_tienda` varchar(20) NOT NULL,
  PRIMARY KEY (`codigo_tienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`codigo_tienda`, `nombre_tienda`, `direccion_tienda`, `tipo_tienda`) VALUES
(11, 'tienda11', 'direccion1', 'supervisada'),
(200, 'tienda200', 'direccion200', 'normal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda_a_cargo`
--

DROP TABLE IF EXISTS `tienda_a_cargo`;
CREATE TABLE IF NOT EXISTS `tienda_a_cargo` (
  `codigo_tienda` int NOT NULL,
  `codigo_ub` int NOT NULL,
  KEY `codigo_tienda_2` (`codigo_tienda`),
  KEY `codigo_ub_2` (`codigo_ub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tienda_a_cargo`
--

INSERT INTO `tienda_a_cargo` (`codigo_tienda`, `codigo_ub`) VALUES
(200, 100),
(11, 123),
(200, 123),
(11, 950),
(200, 950);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_administrador`
--

DROP TABLE IF EXISTS `usuario_administrador`;
CREATE TABLE IF NOT EXISTS `usuario_administrador` (
  `codigo_ua` int NOT NULL,
  `nombre_ua` varchar(40) NOT NULL,
  `usuario_ua` varchar(30) NOT NULL,
  `contrasena_ud` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo_ua`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario_administrador`
--

INSERT INTO `usuario_administrador` (`codigo_ua`, `nombre_ua`, `usuario_ua`, `contrasena_ud`) VALUES
(123, 'Administrador 1', 'admin1', 'password1'),
(849545, 'sdasdas', 'sdadas', 'sadasda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_bodega`
--

DROP TABLE IF EXISTS `usuario_bodega`;
CREATE TABLE IF NOT EXISTS `usuario_bodega` (
  `codigo_ub` int NOT NULL,
  `nombre_ub` varchar(40) NOT NULL,
  `usuario_ub` varchar(30) NOT NULL,
  `contrasena_ub` varchar(30) NOT NULL,
  `correo_ub` varchar(40) NOT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo_ub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario_bodega`
--

INSERT INTO `usuario_bodega` (`codigo_ub`, `nombre_ub`, `usuario_ub`, `contrasena_ub`, `correo_ub`, `estado`) VALUES
(100, 'Bodeguero2', 'bodegas2', 'contra123', 'aabb@bb.ccc', 'Activo'),
(123, 'Encargado bodega 1', 'bodega1', 'password1', 'aaa@bbb.ccc', 'Activo'),
(950, 'Angel', 'AngelB1', 'contra12', 'angel@gmail.com', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_supervisor`
--

DROP TABLE IF EXISTS `usuario_supervisor`;
CREATE TABLE IF NOT EXISTS `usuario_supervisor` (
  `codigo_us` int NOT NULL,
  `nombre_us` varchar(40) NOT NULL,
  `usuario_us` varchar(30) NOT NULL,
  `contrasena_us` varchar(30) NOT NULL,
  `correo_us` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo_us`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario_supervisor`
--

INSERT INTO `usuario_supervisor` (`codigo_us`, `nombre_us`, `usuario_us`, `contrasena_us`, `correo_us`, `estado`) VALUES
(123, 'Supervisor 1', 'super1', 'password1', 'aaa@bbb.ccc', 'Activo'),
(385, 'Angel', 'Angel600', 'contra12', 'angel@gmail.com', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_tienda`
--

DROP TABLE IF EXISTS `usuario_tienda`;
CREATE TABLE IF NOT EXISTS `usuario_tienda` (
  `codigo_ut` int NOT NULL,
  `nombre_ut` varchar(40) NOT NULL,
  `codigo_tienda` int NOT NULL,
  `usuario_ut` varchar(30) NOT NULL,
  `contrasena_ut` varchar(30) NOT NULL,
  `correo_ut` varchar(40) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo_ut`),
  KEY `codigo_tienda` (`codigo_tienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario_tienda`
--

INSERT INTO `usuario_tienda` (`codigo_ut`, `nombre_ut`, `codigo_tienda`, `usuario_ut`, `contrasena_ut`, `correo_ut`, `estado`) VALUES
(100, 'Angel', 200, 'Angel100', 'contra1', 'angel@gmail.com', 'Activo'),
(123, 'Usuario Tienda 1 ', 11, 'uTienda1', 'password1', 'aabb@bbb.ccc', 'Activo'),
(250, 'Angel', 200, 'Angel200', 'contra12', 'angel@gmail.com', 'Activo'),
(985, 'Angel', 11, 'Angel10000', 'password11', 'dsadas@correo.com', 'Activo');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `catalogo_tienda`
--
ALTER TABLE `catalogo_tienda`
  ADD CONSTRAINT `catalogo_tienda_ibfk_1` FOREIGN KEY (`codigo_producto`) REFERENCES `catalogo_general` (`codigo_producto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `catalogo_tienda_ibfk_2` FOREIGN KEY (`codigo_tienda`) REFERENCES `tienda` (`codigo_tienda`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD CONSTRAINT `devoluciones_ibfk_1` FOREIGN KEY (`codigo_ut`) REFERENCES `usuario_tienda` (`codigo_ut`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `devoluciones_ibfk_2` FOREIGN KEY (`codigo_tienda`) REFERENCES `tienda` (`codigo_tienda`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `envios`
--
ALTER TABLE `envios`
  ADD CONSTRAINT `envios_ibfk_1` FOREIGN KEY (`codigo_tienda`) REFERENCES `tienda` (`codigo_tienda`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `envios_ibfk_2` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuario_tienda` (`codigo_ut`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `envios_ibfk_3` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `incidencias`
--
ALTER TABLE `incidencias`
  ADD CONSTRAINT `incidencias_ibfk_1` FOREIGN KEY (`codigo_ut`) REFERENCES `usuario_tienda` (`codigo_ut`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `incidencias_ibfk_2` FOREIGN KEY (`codigo_tienda`) REFERENCES `tienda` (`codigo_tienda`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `listado_devolciones`
--
ALTER TABLE `listado_devolciones`
  ADD CONSTRAINT `listado_devolciones_ibfk_1` FOREIGN KEY (`id_devolucion`) REFERENCES `devoluciones` (`id_devolucion`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `listado_devolciones_ibfk_2` FOREIGN KEY (`codigo_producto`) REFERENCES `catalogo_general` (`codigo_producto`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `listado_envios`
--
ALTER TABLE `listado_envios`
  ADD CONSTRAINT `listado_envios_ibfk_1` FOREIGN KEY (`id_envio`) REFERENCES `envios` (`id_envio`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `listado_envios_ibfk_2` FOREIGN KEY (`codigo_producto`) REFERENCES `catalogo_general` (`codigo_producto`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `listado_pedido`
--
ALTER TABLE `listado_pedido`
  ADD CONSTRAINT `listado_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `listado_pedido_ibfk_2` FOREIGN KEY (`codigo_producto`) REFERENCES `catalogo_general` (`codigo_producto`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `lista_incidencias`
--
ALTER TABLE `lista_incidencias`
  ADD CONSTRAINT `lista_incidencias_ibfk_1` FOREIGN KEY (`id_incidencia`) REFERENCES `incidencias` (`id_incidencia`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `lista_incidencias_ibfk_2` FOREIGN KEY (`codigo_producto`) REFERENCES `catalogo_general` (`codigo_producto`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`codigo_ut`) REFERENCES `usuario_tienda` (`codigo_ut`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`codigo_tienda`) REFERENCES `tienda` (`codigo_tienda`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `tienda_a_cargo`
--
ALTER TABLE `tienda_a_cargo`
  ADD CONSTRAINT `tienda_a_cargo_ibfk_1` FOREIGN KEY (`codigo_tienda`) REFERENCES `tienda` (`codigo_tienda`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `tienda_a_cargo_ibfk_2` FOREIGN KEY (`codigo_ub`) REFERENCES `usuario_bodega` (`codigo_ub`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_tienda`
--
ALTER TABLE `usuario_tienda`
  ADD CONSTRAINT `usuario_tienda_ibfk_1` FOREIGN KEY (`codigo_tienda`) REFERENCES `tienda` (`codigo_tienda`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
