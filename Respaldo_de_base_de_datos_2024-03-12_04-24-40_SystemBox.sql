-- MySQL dump 10.13  Distrib 8.2.0, for Win64 (x86_64)
--
-- Host: localhost    Database: systembox_db
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `casa_envio`
--

DROP TABLE IF EXISTS `casa_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casa_envio` (
  `id_casa_envio` int NOT NULL AUTO_INCREMENT,
  `nombre_casa_envio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_casa_envio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casa_envio`
--

LOCK TABLES `casa_envio` WRITE;
/*!40000 ALTER TABLE `casa_envio` DISABLE KEYS */;
INSERT INTO `casa_envio` VALUES (1,'Zoom'),(2,'MRW'),(3,'Tealca'),(4,'Otro');
/*!40000 ALTER TABLE `casa_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categorias` int NOT NULL AUTO_INCREMENT,
  `producto_id` int DEFAULT NULL,
  `nombre_categoria` varchar(50) NOT NULL,
  `descripcion_categoria` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_categorias`),
  KEY `fk_categorias_producto` (`producto_id`),
  CONSTRAINT `fk_categorias_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,NULL,'implantes',''),(2,NULL,'instrumentales',''),(3,NULL,'servicios','');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `afiliacion` int NOT NULL,
  `persona_ci` int DEFAULT NULL,
  `doctor_cliente` varchar(100) DEFAULT NULL,
  `estatus` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`afiliacion`),
  KEY `fk_clientes_persona` (`persona_ci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (59563,30363422,'Marcano','');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
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
  KEY `fk_compras_juridica` (`id_juridica`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_juridica`) REFERENCES `persona_juridica` (`id_juridica`),
  CONSTRAINT `fk_compras_proveedor` FOREIGN KEY (`rif_proveedor`) REFERENCES `proveedor` (`rif_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,1,'45871689','2024-02-26',5.00,12.00,60.00,'Producto recibido',NULL),(2,1,'45871689','2024-03-11',2.00,12.00,24.00,'Producto recibido',NULL),(3,4,'45871689','2024-03-11',1.00,23.00,23.00,'Producto recibido',NULL);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correo`
--

DROP TABLE IF EXISTS `correo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `correo` (
  `id_correo` int NOT NULL AUTO_INCREMENT,
  `persona_ci` int DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `rif_proveedor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_correo`),
  KEY `fk_correo_persona` (`persona_ci`),
  KEY `rif_proveedor` (`rif_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correo`
--

LOCK TABLES `correo` WRITE;
/*!40000 ALTER TABLE `correo` DISABLE KEYS */;
INSERT INTO `correo` VALUES (1,10064784,'paolajuliette2002@gmail.com',NULL),(2,NULL,'nnas@gmail.com','45871689');
/*!40000 ALTER TABLE `correo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_direccion` int NOT NULL AUTO_INCREMENT,
  `persona_ci` int DEFAULT NULL,
  `direccion` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `parroquia` varchar(50) NOT NULL,
  `municipio` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `fk_direccion_persona` (`persona_ci`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,10064784,'urb Rahme','El TIgre','edmundo barrios','simon rodrigues','Anzoategui');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `carnet_empleado` int NOT NULL,
  `persona_ci` int DEFAULT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `cargo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`carnet_empleado`),
  KEY `fk_empleados_persona` (`persona_ci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (45403,10064784,'2024-02-26','1949-06-14','empleado');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envios` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envios`
--

LOCK TABLES `envios` WRITE;
/*!40000 ALTER TABLE `envios` DISABLE KEYS */;
INSERT INTO `envios` VALUES (1,1,'Zoom','2024-02-26',5,'1254','En Camino',12.00);
/*!40000 ALTER TABLE `envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
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
  KEY `fk_factura_persona_juridica` (`id_juridica`),
  CONSTRAINT `fk_factura_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`afiliacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_factura_persona_juridica` FOREIGN KEY (`id_juridica`) REFERENCES `persona_juridica` (`id_juridica`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_factura_venta` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=94194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (51824,59563,'2024-03-11',2,10,100.00,'Pendiente','',NULL),(62252,59563,'2024-03-12',4,0,56.00,'Pendiente','',NULL),(65960,NULL,'2024-02-26',1,0,102.00,'Pendiente','',1),(94193,NULL,'2024-03-12',3,0,36.00,'Pendiente','',1);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `id_marcas` int NOT NULL AUTO_INCREMENT,
  `pais_marca` varchar(30) DEFAULT NULL,
  `nombre_marca` varchar(30) DEFAULT NULL,
  `descripcion_marca` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_marcas`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'suiza','synthes','');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES ('',10064784,'Juan','Rafael','Medina','Jimenez','1949-06-14','usuario'),('',30363422,'paola','','cede','','0000-00-00','cliente');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_juridica`
--

DROP TABLE IF EXISTS `persona_juridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona_juridica` (
  `id_juridica` int NOT NULL AUTO_INCREMENT,
  `nombre_persona_juridica` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `condicion` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_rif` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_juridica`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_juridica`
--

LOCK TABLES `persona_juridica` WRITE;
/*!40000 ALTER TABLE `persona_juridica` DISABLE KEYS */;
INSERT INTO `persona_juridica` VALUES (1,'calvend medical','J','2541036'),(2,'','J','');
/*!40000 ALTER TABLE `persona_juridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
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
  KEY `fk_productos_compra` (`compra_id`),
  CONSTRAINT `fk_productos_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id_categorias`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_productos_marca` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id_marcas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (3,'204.010',1,1,NULL,NULL,'3.5 Tornillo cortical L',12,'tornillo',13.00,36.00),(4,'PT038',1,1,NULL,NULL,'Protesis de thomson 38mm',21,'38MM',23.00,56.00);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES ('45871689',NULL,NULL,NULL,'Calved Medical','Alejandro');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros`
--

DROP TABLE IF EXISTS `registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `producto_id` int DEFAULT NULL,
  `fecha_registro_producto` date NOT NULL,
  `observacion` varchar(100) DEFAULT NULL,
  `cantidad_registro` int DEFAULT NULL,
  PRIMARY KEY (`id_registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros`
--

LOCK TABLES `registros` WRITE;
/*!40000 ALTER TABLE `registros` DISABLE KEYS */;
/*!40000 ALTER TABLE `registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono` (
  `id_telefono` int NOT NULL AUTO_INCREMENT,
  `persona_ci` int DEFAULT NULL,
  `num_telefono` int NOT NULL,
  `cod_area` int NOT NULL,
  `rif_proveedor` varchar(20) DEFAULT NULL,
  `id_juridica` int DEFAULT NULL,
  PRIMARY KEY (`id_telefono`),
  KEY `fk_telefono_persona` (`persona_ci`),
  KEY `rif_proveedor` (`rif_proveedor`),
  KEY `fk_telefono_juridica` (`id_juridica`),
  CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`persona_ci`) REFERENCES `persona` (`ci_persona`),
  CONSTRAINT `telefono_ibfk_2` FOREIGN KEY (`id_juridica`) REFERENCES `persona_juridica` (`id_juridica`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
INSERT INTO `telefono` VALUES (1,10064784,2147483647,0,NULL,NULL),(2,NULL,2147483647,58,'45871689',NULL),(3,NULL,41485462,0,NULL,1),(4,NULL,0,0,NULL,2),(5,30363422,123755930,0,NULL,NULL);
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
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
  KEY `fk_usuarios_empleados` (`empleado_carnet`),
  CONSTRAINT `fk_usuarios_personas` FOREIGN KEY (`ci_persona`) REFERENCES `persona` (`ci_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,10064784,NULL,'JuanM','$2y$10$Fap6iNaiF.n1fBJTu/YyJOEoYqFl.dFEQO9l4TCEcBVzhRyph46A2','admin','¿Lugar de nacimiento de tu madre?','atapirire','¿Nombre del primer coche que tuviste?','toyota','¿Cuál es tu película favorita?','titanic');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
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
  KEY `fk_ventas_juridica` (`id_juridica`),
  CONSTRAINT `fk_ventas_factura` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_juridica`) REFERENCES `persona_juridica` (`id_juridica`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,1,65960,3,'2024-02-26',NULL),(2,1,4,51824,2,'2024-03-11',NULL),(3,1,3,94193,1,'2024-03-12',NULL),(4,1,4,62252,1,'2024-03-12',NULL);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-12  0:24:41
