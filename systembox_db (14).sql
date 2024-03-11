-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 26-02-2024 a las 04:31:23
-- Versión del servidor: 8.2.0
-- Versión de PHP: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `systembox_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casa_envio`
--

DROP TABLE IF EXISTS `casa_envio`;
CREATE TABLE IF NOT EXISTS `casa_envio` (
  `id_casa_envio` int NOT NULL AUTO_INCREMENT,
  `nombre_casa_envio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_casa_envio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categorias` int NOT NULL AUTO_INCREMENT,
  `producto_id` int DEFAULT NULL,
  `nombre_categoria` varchar(50) NOT NULL,
  `descripcion_categoria` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_categorias`),
  KEY `fk_categorias_producto` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `afiliacion` int NOT NULL,
  `persona_ci` int DEFAULT NULL,
  `doctor_cliente` varchar(100) DEFAULT NULL,
  `estatus` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`afiliacion`),
  KEY `fk_clientes_persona` (`persona_ci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE IF NOT EXISTS `compras` (
  `id_compras` int NOT NULL AUTO_INCREMENT,
  `producto_id` int DEFAULT NULL,
  `rif_proveedor` varchar(20) DEFAULT NULL,
  `fecha_compra` date DEFAULT NULL,
  `cantidad_compra` decimal(10,2) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `precio_total` decimal(10,2) NOT NULL,
  `estatus_compra` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_juridica` int DEFAULT NULL,
  PRIMARY KEY (`id_compras`),
  KEY `fk_compras_productos` (`producto_id`),
  KEY `fk_compras_proveedor` (`rif_proveedor`),
  KEY `fk_compras_juridica` (`id_juridica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correo`
--

DROP TABLE IF EXISTS `correo`;
CREATE TABLE IF NOT EXISTS `correo` (
  `id_correo` int NOT NULL AUTO_INCREMENT,
  `persona_ci` int DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `rif_proveedor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_correo`),
  KEY `fk_correo_persona` (`persona_ci`),
  KEY `rif_proveedor` (`rif_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

DROP TABLE IF EXISTS `direccion`;
CREATE TABLE IF NOT EXISTS `direccion` (
  `id_direccion` int NOT NULL AUTO_INCREMENT,
  `persona_ci` int DEFAULT NULL,
  `direccion` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `parroquia` varchar(50) NOT NULL,
  `municipio` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `fk_direccion_persona` (`persona_ci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `carnet_empleado` int NOT NULL,
  `persona_ci` int DEFAULT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `cargo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`carnet_empleado`),
  KEY `fk_empleados_persona` (`persona_ci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

DROP TABLE IF EXISTS `envios`;
CREATE TABLE IF NOT EXISTS `envios` (
  `id_envio` int NOT NULL,
  `id_producto` int DEFAULT NULL,
  `nombre_casa_envio` varchar(255) DEFAULT NULL,
  `fecha_envio` date DEFAULT NULL,
  `cantidad_envio` int DEFAULT NULL,
  `guia` varchar(255) DEFAULT NULL,
  `estatus` varchar(255) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_envio`),
  KEY `fk_envios_producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE IF NOT EXISTS `factura` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `fecha_factura` date NOT NULL,
  `id_venta` int DEFAULT NULL,
  `descuento` int NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `estado_factura` varchar(30) DEFAULT NULL,
  `tipo_pago` varchar(50) NOT NULL,
  `id_juridica` int DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `fk_factura_cliente` (`cliente_id`),
  KEY `fk_factura_venta` (`id_venta`),
  KEY `fk_factura_persona_juridica` (`id_juridica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

DROP TABLE IF EXISTS `marcas`;
CREATE TABLE IF NOT EXISTS `marcas` (
  `id_marcas` int NOT NULL AUTO_INCREMENT,
  `pais_marca` varchar(30) DEFAULT NULL,
  `nombre_marca` varchar(30) DEFAULT NULL,
  `descripcion_marca` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_marcas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `condicion` varchar(2) NOT NULL,
  `ci_persona` int NOT NULL,
  `primer_nombre_persona` varchar(50) NOT NULL,
  `segundo_nombre_persona` varchar(50) NOT NULL,
  `primer_apellido_persona` varchar(50) NOT NULL,
  `segundo_apellido_persona` varchar(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `tipo_persona` varchar(50) NOT NULL,
  PRIMARY KEY (`ci_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_juridica`
--

DROP TABLE IF EXISTS `persona_juridica`;
CREATE TABLE IF NOT EXISTS `persona_juridica` (
  `id_juridica` int NOT NULL AUTO_INCREMENT,
  `nombre_persona_juridica` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `condicion` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_rif` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_juridica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `ref_producto` varchar(255) DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  `marca_id` int DEFAULT NULL,
  `registro_id` int DEFAULT NULL,
  `compra_id` int DEFAULT NULL,
  `nombre_producto` varchar(100) DEFAULT NULL,
  `existencia` int NOT NULL,
  `descripcion_producto` varchar(100) DEFAULT NULL,
  `precio_compra` decimal(10,2) DEFAULT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_productos_categoria` (`categoria_id`),
  KEY `fk_productos_marca` (`marca_id`),
  KEY `fk_productos_registro` (`registro_id`),
  KEY `fk_productos_compra` (`compra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `rif_proveedor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `telefono_id` int DEFAULT NULL,
  `direccion_id` int DEFAULT NULL,
  `correo_id` int DEFAULT NULL,
  `nombre_proveedor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nombre_encargado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rif_proveedor`),
  UNIQUE KEY `uq_rif_proveedor` (`rif_proveedor`),
  KEY `fk_proveedor_telefono` (`telefono_id`),
  KEY `fk_proveedor_direccion` (`direccion_id`),
  KEY `fk_proveedor_correo` (`correo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

DROP TABLE IF EXISTS `registros`;
CREATE TABLE IF NOT EXISTS `registros` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `producto_id` int DEFAULT NULL,
  `fecha_registro_producto` date NOT NULL,
  `observacion` varchar(100) DEFAULT NULL,
  `cantidad_registro` int DEFAULT NULL,
  PRIMARY KEY (`id_registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

DROP TABLE IF EXISTS `telefono`;
CREATE TABLE IF NOT EXISTS `telefono` (
  `id_telefono` int NOT NULL AUTO_INCREMENT,
  `persona_ci` int DEFAULT NULL,
  `num_telefono` int NOT NULL,
  `cod_area` int NOT NULL,
  `rif_proveedor` varchar(20) DEFAULT NULL,
  `id_juridica` int DEFAULT NULL,
  PRIMARY KEY (`id_telefono`),
  KEY `fk_telefono_persona` (`persona_ci`),
  KEY `rif_proveedor` (`rif_proveedor`),
  KEY `fk_telefono_juridica` (`id_juridica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `ci_persona` int NOT NULL,
  `empleado_carnet` int DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tipo_usuario` varchar(20) NOT NULL,
  `pregunta_seguridad1` varchar(255) NOT NULL,
  `respuesta_seguridad1` varchar(255) NOT NULL,
  `pregunta_seguridad2` varchar(255) NOT NULL,
  `respuesta_seguridad2` varchar(255) NOT NULL,
  `pregunta_seguridad3` varchar(255) NOT NULL,
  `respuesta_seguridad3` varchar(255) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_usuarios_personas` (`ci_persona`),
  KEY `fk_usuarios_empleados` (`empleado_carnet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `producto_id` int DEFAULT NULL,
  `id_factura` int DEFAULT NULL,
  `cantidad_venta` int NOT NULL,
  `fecha_venta` date NOT NULL,
  `id_juridica` int DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_ventas_producto` (`producto_id`),
  KEY `fk_ventas_usuario` (`usuario_id`),
  KEY `fk_ventas_factura` (`id_factura`),
  KEY `fk_ventas_juridica` (`id_juridica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `fk_categorias_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_juridica`) REFERENCES `persona_juridica` (`id_juridica`),
  ADD CONSTRAINT `fk_compras_proveedor` FOREIGN KEY (`rif_proveedor`) REFERENCES `proveedor` (`rif_proveedor`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_factura_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`afiliacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_factura_persona_juridica` FOREIGN KEY (`id_juridica`) REFERENCES `persona_juridica` (`id_juridica`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_factura_venta` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id_categorias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_productos_marca` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id_marcas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`persona_ci`) REFERENCES `persona` (`ci_persona`),
  ADD CONSTRAINT `telefono_ibfk_2` FOREIGN KEY (`id_juridica`) REFERENCES `persona_juridica` (`id_juridica`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_personas` FOREIGN KEY (`ci_persona`) REFERENCES `persona` (`ci_persona`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_ventas_factura` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_juridica`) REFERENCES `persona_juridica` (`id_juridica`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
