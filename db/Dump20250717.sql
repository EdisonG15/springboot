CREATE DATABASE  IF NOT EXISTS `db2025v2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db2025v2`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: db2025v2
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abonos_compra_credito`
--

DROP TABLE IF EXISTS `abonos_compra_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abonos_compra_credito` (
  `id_abono` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_compra_credito` int DEFAULT NULL,
  `id_movimiento_caja` int NOT NULL,
  `monto_abonado` decimal(10,2) DEFAULT NULL,
  `fecha_abono` datetime DEFAULT CURRENT_TIMESTAMP,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `observacion` text,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`id_abono`),
  KEY `id_compra_credito` (`id_compra_credito`),
  KEY `id_movimiento_caja` (`id_movimiento_caja`),
  CONSTRAINT `abonos_compra_credito_ibfk_1` FOREIGN KEY (`id_compra_credito`) REFERENCES `compras_credito` (`id_compra_credito`),
  CONSTRAINT `abonos_compra_credito_ibfk_2` FOREIGN KEY (`id_movimiento_caja`) REFERENCES `movimiento_caja` (`id_movimiento_caja`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abonos_compra_credito`
--

LOCK TABLES `abonos_compra_credito` WRITE;
/*!40000 ALTER TABLE `abonos_compra_credito` DISABLE KEYS */;
INSERT INTO `abonos_compra_credito` VALUES (6,NULL,6,17,4.00,'2025-07-13 21:11:04','1',NULL,'1'),(7,NULL,7,17,1.00,'2025-07-13 21:21:50','1',NULL,'1'),(8,NULL,7,17,0.30,'2025-07-13 21:30:12','1',NULL,'1'),(9,NULL,8,17,3.00,'2025-07-14 16:17:16','1','pGO EN VIENES','1');
/*!40000 ALTER TABLE `abonos_compra_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abonos_credito`
--

DROP TABLE IF EXISTS `abonos_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abonos_credito` (
  `id_abono` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_venta_credito` int DEFAULT NULL,
  `id_movimiento_caja` int NOT NULL,
  `monto_abonado` decimal(10,2) DEFAULT NULL,
  `fecha_abono` datetime DEFAULT CURRENT_TIMESTAMP,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `observacion` text,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`id_abono`),
  KEY `id_venta_credito` (`id_venta_credito`),
  KEY `id_movimiento_caja` (`id_movimiento_caja`),
  CONSTRAINT `abonos_credito_ibfk_1` FOREIGN KEY (`id_venta_credito`) REFERENCES `ventas_credito` (`id_venta_credito`),
  CONSTRAINT `abonos_credito_ibfk_2` FOREIGN KEY (`id_movimiento_caja`) REFERENCES `movimiento_caja` (`id_movimiento_caja`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abonos_credito`
--

LOCK TABLES `abonos_credito` WRITE;
/*!40000 ALTER TABLE `abonos_credito` DISABLE KEYS */;
INSERT INTO `abonos_credito` VALUES (8,1,7,16,5.50,'2025-07-15 17:34:43','1',NULL,'1'),(9,1,7,16,2.00,'2025-07-15 17:48:36','1',NULL,'1');
/*!40000 ALTER TABLE `abonos_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ajuste_lote`
--

DROP TABLE IF EXISTS `ajuste_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ajuste_lote` (
  `id_ajuste` int NOT NULL AUTO_INCREMENT,
  `id_lote` int NOT NULL,
  `cantidad` int NOT NULL,
  `motivo` varchar(100) NOT NULL,
  `fecha_ajuste` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `observacion` text,
  `id_usuario` int DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_ajuste`),
  KEY `id_lote` (`id_lote`),
  CONSTRAINT `ajuste_lote_ibfk_1` FOREIGN KEY (`id_lote`) REFERENCES `lote_producto` (`id_lote`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ajuste_lote`
--

LOCK TABLES `ajuste_lote` WRITE;
/*!40000 ALTER TABLE `ajuste_lote` DISABLE KEYS */;
INSERT INTO `ajuste_lote` VALUES (18,117,3,'DEVOLUCION','2025-07-13 16:03:08','debolu',1,'2025-07-13 16:03:08'),(19,113,7,'PERDIDA','2025-07-13 16:05:46','por perdida',1,'2025-07-13 16:05:46');
/*!40000 ALTER TABLE `ajuste_lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ambiente`
--

DROP TABLE IF EXISTS `ambiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ambiente` (
  `id_ambiente` tinyint NOT NULL,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id_ambiente`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambiente`
--

LOCK TABLES `ambiente` WRITE;
/*!40000 ALTER TABLE `ambiente` DISABLE KEYS */;
INSERT INTO `ambiente` VALUES (2,'PRODUCCION'),(1,'PRUEBAS');
/*!40000 ALTER TABLE `ambiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arqueo_caja`
--

DROP TABLE IF EXISTS `arqueo_caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arqueo_caja` (
  `id_arqueo_caja` int NOT NULL AUTO_INCREMENT,
  `id_caja` int NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha_inicio` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_fin` datetime DEFAULT NULL,
  `monto_inicial` decimal(10,2) NOT NULL,
  `total_ingresos` decimal(10,2) DEFAULT '0.00',
  `total_egresos` decimal(10,2) DEFAULT '0.00',
  `saldo_final` decimal(10,2) DEFAULT '0.00',
  `monto_usuario` decimal(10,2) DEFAULT '0.00',
  `sobrante_caja` decimal(10,2) DEFAULT '0.00',
  `faltantes_caja` decimal(10,2) DEFAULT '0.00',
  `ObservacionApertura` text,
  `ObservacionCierre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`id_arqueo_caja`),
  KEY `id_caja` (`id_caja`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `arqueo_caja_ibfk_1` FOREIGN KEY (`id_caja`) REFERENCES `cajas` (`id_caja`),
  CONSTRAINT `arqueo_caja_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arqueo_caja`
--

LOCK TABLES `arqueo_caja` WRITE;
/*!40000 ALTER TABLE `arqueo_caja` DISABLE KEYS */;
INSERT INTO `arqueo_caja` VALUES (7,1,1,'2025-07-13 20:55:19',NULL,50.00,0.00,0.00,0.00,0.00,0.00,0.00,'0',NULL,'1');
/*!40000 ALTER TABLE `arqueo_caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asiento_contable`
--

DROP TABLE IF EXISTS `asiento_contable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asiento_contable` (
  `id_asiento` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `descripcion` text,
  `tipo_asiento` enum('VENTA','COMPRA','ABONO','AJUSTE','MANUAL','INVENTARIO_INICIAL') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_referencia` int DEFAULT NULL,
  `modulo_origen` varchar(50) DEFAULT NULL,
  `total_debe` decimal(10,2) DEFAULT '0.00',
  `total_haber` decimal(10,2) DEFAULT '0.00',
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `tipo_referencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_asiento`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiento_contable`
--

LOCK TABLES `asiento_contable` WRITE;
/*!40000 ALTER TABLE `asiento_contable` DISABLE KEYS */;
INSERT INTO `asiento_contable` VALUES (1,'2025-05-25','Inventario inicial del producto sdsssssdd','INVENTARIO_INICIAL',11,'PRODUCTO',10.00,10.00,'2025-05-25 17:42:46','producto'),(2,'2025-05-25','Ingreso de producto 7501033210778 - por pro','COMPRA',NULL,'INVENTARIO',5.00,5.00,'2025-05-25 20:13:23','KARDEX'),(3,'2025-05-25','Ingreso de producto 525452312 - fdddffdfd','COMPRA',NULL,'INVENTARIO',5.00,5.00,'2025-05-25 20:13:49','KARDEX'),(4,'2025-05-26','Ingreso de producto 7501033210778 - por olvedeo','COMPRA',NULL,'INVENTARIO',1.00,1.00,'2025-05-26 17:31:53','KARDEX'),(5,'2025-05-26','Ingreso de producto 7501033210778 - gratis','COMPRA',NULL,'INVENTARIO',0.00,0.00,'2025-05-26 17:32:08','KARDEX'),(6,'2025-05-26','Ingreso de producto 525452312 - 1','COMPRA',NULL,'INVENTARIO',1.00,1.00,'2025-05-26 22:08:57','KARDEX'),(7,'2025-05-26','Ingreso de producto 7501033210778 - 1','COMPRA',NULL,'INVENTARIO',1.00,1.00,'2025-05-26 22:09:08','KARDEX'),(8,'2025-05-27','Ingreso de producto 00004 - ffdddddd','COMPRA',NULL,'INVENTARIO',1.00,1.00,'2025-05-27 09:36:51','KARDEX'),(9,'2025-05-27','Ingreso de producto 00004 - fd','COMPRA',NULL,'INVENTARIO',3.00,3.00,'2025-05-27 09:39:48','KARDEX'),(10,'2025-05-27','Ingreso de producto 00004 - ddsss','COMPRA',NULL,'INVENTARIO',1.00,1.00,'2025-05-27 09:40:06','KARDEX'),(11,'2025-05-27','Ajuste de stock por DEVOLUCION: debolucion','AJUSTE',4,'INVENTARIO',0.00,0.00,'2025-05-27 10:24:25','PRODUCTO'),(12,'2025-05-27','Inventario inicial del producto Producod','INVENTARIO_INICIAL',12,'PRODUCTO',10.00,10.00,'2025-05-27 11:25:32','producto'),(13,'2025-05-27','Ingreso de producto 0000089 - dddddddd','COMPRA',NULL,'INVENTARIO',2.00,2.00,'2025-05-27 11:27:40','KARDEX'),(14,'2025-05-27','Ingreso de producto 0000089 - eeeee','COMPRA',NULL,'INVENTARIO',0.00,0.00,'2025-05-27 11:28:00','KARDEX'),(15,'2025-05-27','Ajuste de stock por PERDIDA: fsffffffffd','AJUSTE',12,'INVENTARIO',10.00,10.00,'2025-05-27 11:37:44','PRODUCTO'),(16,'2025-05-27','Ajuste de stock por DEVOLUCION: ffdfdffdfdfffdfd','AJUSTE',9,'INVENTARIO',0.00,0.00,'2025-05-27 11:42:22','PRODUCTO'),(17,'2025-05-27','Ajuste de stock por PERDIDA: hhhjhjhj','AJUSTE',9,'INVENTARIO',5.00,5.00,'2025-05-27 11:42:52','PRODUCTO'),(18,'2025-05-27','Ajuste de stock por DEVOLUCION: dddd','AJUSTE',9,'INVENTARIO',0.00,0.00,'2025-05-27 11:46:36','PRODUCTO'),(19,'2025-05-27','Ajuste de stock por PERDIDA: eee','AJUSTE',12,'INVENTARIO',1.00,1.00,'2025-05-27 11:47:02','PRODUCTO'),(20,'2025-05-27','Ajuste de stock por DEVOLUCION: dddd','AJUSTE',9,'INVENTARIO',0.00,0.00,'2025-05-27 11:47:27','PRODUCTO'),(21,'2025-05-27','Inventario inicial del producto gfrrrrfrfrrfrf','INVENTARIO_INICIAL',13,'PRODUCTO',40.00,40.00,'2025-05-27 12:19:52','producto'),(22,'2025-05-27','Inventario inicial del producto 4404404','INVENTARIO_INICIAL',14,'PRODUCTO',20.00,20.00,'2025-05-27 12:26:47','producto'),(23,'2025-06-07','Inventario inicial del producto ffdffddffddfffff','INVENTARIO_INICIAL',15,'PRODUCTO',65.00,65.00,'2025-06-07 23:00:16','producto'),(24,'2025-06-07','Inventario inicial del producto pruenabbsbssasa','INVENTARIO_INICIAL',16,'PRODUCTO',60.00,60.00,'2025-06-07 23:01:55','producto'),(25,'2025-06-08','Inventario inicial del producto Dell 14 ispiro','INVENTARIO_INICIAL',17,'PRODUCTO',20.00,20.00,'2025-06-08 21:15:43','producto'),(26,'2025-06-08','Inventario inicial del producto modelo 13 dd','INVENTARIO_INICIAL',18,'PRODUCTO',20.00,20.00,'2025-06-08 23:24:17','producto'),(27,'2025-06-09','Inventario inicial del producto Canande fuente de vida','INVENTARIO_INICIAL',19,'PRODUCTO',5.00,5.00,'2025-06-09 16:54:29','producto'),(28,'2025-06-09','Inventario inicial del producto aMSLMSLSLAMSALALS','INVENTARIO_INICIAL',20,'PRODUCTO',20.00,20.00,'2025-06-09 17:14:25','producto'),(29,'2025-06-13','Inventario inicial del producto dcckscdkcdmdcmdkds','INVENTARIO_INICIAL',21,'PRODUCTO',12.00,12.00,'2025-06-13 16:08:54','producto'),(30,'2025-06-13','Inventario inicial del producto dsssfdssdfsdfsdfssfsfd','INVENTARIO_INICIAL',22,'PRODUCTO',1.00,1.00,'2025-06-13 18:09:32','producto'),(31,'2025-06-13','Inventario inicial del producto wedewewew','INVENTARIO_INICIAL',23,'PRODUCTO',1.00,1.00,'2025-06-13 18:15:16','producto'),(32,'2025-06-13','Ingreso de producto 012115 - por compra','COMPRA',NULL,'INVENTARIO',10.00,10.00,'2025-06-13 20:54:41','KARDEX'),(33,'2025-06-13','Ingreso de producto 031512 - fmfmfdf','COMPRA',NULL,'INVENTARIO',4.00,4.00,'2025-06-13 20:55:15','KARDEX'),(34,'2025-06-14','Inventario inicial del producto Glyphosate Isopropylamine salt (480 g/l)','INVENTARIO_INICIAL',24,'PRODUCTO',24.00,24.00,'2025-06-14 18:46:23','producto'),(35,'2025-06-14','Inventario inicial del producto SDDSDSDSDSD','INVENTARIO_INICIAL',25,'PRODUCTO',12.00,12.00,'2025-06-14 18:47:40','producto'),(36,'2025-06-15','Inventario inicial del producto bbjugugugugugugugu','INVENTARIO_INICIAL',26,'PRODUCTO',1.00,1.00,'2025-06-15 08:38:15','producto'),(37,'2025-06-16','Ingreso de producto 34464646 - nmnn','COMPRA',NULL,'INVENTARIO',5.00,5.00,'2025-06-16 18:19:32','KARDEX'),(38,'2025-07-13','Inventario inicial del producto BATHUTIC - 1L','INVENTARIO_INICIAL',27,'PRODUCTO',13.00,13.00,'2025-07-13 14:31:26','producto'),(39,'2025-07-13','Inventario inicial del producto Solfoxidante fungicida - Acaricida','INVENTARIO_INICIAL',28,'PRODUCTO',20.00,20.00,'2025-07-13 14:50:21','producto'),(40,'2025-07-13','Inventario inicial del producto SPARKO - 100 G','INVENTARIO_INICIAL',29,'PRODUCTO',12.00,12.00,'2025-07-13 15:06:02','producto'),(41,'2025-07-13','Inventario inicial del producto aFEPASA','INVENTARIO_INICIAL',30,'PRODUCTO',24.00,24.00,'2025-07-13 15:08:23','producto'),(42,'2025-07-13','Inventario inicial del producto Adame','INVENTARIO_INICIAL',31,'PRODUCTO',21.00,21.00,'2025-07-13 15:13:46','producto'),(43,'2025-07-13','Ingreso de producto 09088 - ingrese por mercaderia','COMPRA',NULL,'INVENTARIO',15.00,15.00,'2025-07-13 15:23:46','KARDEX'),(44,'2025-07-13','Ingreso de producto 09088 - promocion','COMPRA',NULL,'INVENTARIO',0.00,0.00,'2025-07-13 15:25:41','KARDEX'),(45,'2025-07-13','Ingreso de producto 09088 - por ganacia','COMPRA',NULL,'INVENTARIO',0.00,0.00,'2025-07-13 15:58:45','KARDEX'),(46,'2025-07-13','Ajuste de stock por DEVOLUCION: debolu','AJUSTE',30,'INVENTARIO',0.00,0.00,'2025-07-13 16:03:08','PRODUCTO'),(47,'2025-07-13','Ajuste de stock por PERDIDA: por perdida','AJUSTE',30,'INVENTARIO',10.50,10.50,'2025-07-13 16:05:46','PRODUCTO');
/*!40000 ALTER TABLE `asiento_contable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cajas`
--

DROP TABLE IF EXISTS `cajas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cajas` (
  `id_caja` int NOT NULL AUTO_INCREMENT,
  `numero_caja` varchar(20) NOT NULL,
  `nombre_caja` varchar(20) NOT NULL,
  `folio` varchar(20) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fecha_eliminacion` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`id_caja`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajas`
--

LOCK TABLES `cajas` WRITE;
/*!40000 ALTER TABLE `cajas` DISABLE KEYS */;
INSERT INTO `cajas` VALUES (1,'1','Gener','01','2025-04-28 16:23:09','2025-05-09 11:39:18',NULL,'1'),(2,'3323','23323','22332','2025-04-30 07:10:26','2025-04-30 19:52:07','2025-04-30 07:52:07','0'),(3,'22222','2222','222222','2025-04-30 19:18:42','2025-04-30 19:20:48','2025-04-30 07:20:48','0');
/*!40000 ALTER TABLE `cajas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `aplica_peso` int DEFAULT NULL,
  `id_usuario_creacion` int DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_actualizacion` int DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `id_usuario_eliminacion` int DEFAULT NULL,
  `fecha_eliminacion` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (30,'Galletas',NULL,1,'2025-07-13 14:17:54',1,'2025-07-13 14:18:22',NULL,NULL,'1'),(31,'Agricola',NULL,1,'2025-07-13 14:18:54',NULL,NULL,NULL,NULL,'1'),(32,'Figuizda',NULL,1,'2025-07-13 14:27:17',NULL,NULL,NULL,NULL,'1');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `tipo_identificacion` char(2) DEFAULT NULL,
  `numeroDocumento` varchar(13) DEFAULT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_usuario_creacion` int DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_actualizacion` int DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `id_usuario_eliminacion` int DEFAULT NULL,
  `fecha_eliminacion` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `idx_cliente_numeroDocumento` (`numeroDocumento`),
  KEY `fk_cliente_tipo_identificacion` (`tipo_identificacion`),
  CONSTRAINT `fk_cliente_tipo_identificacion` FOREIGN KEY (`tipo_identificacion`) REFERENCES `tipo_identificacion` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (10,'05','0804610814','Momo Di','Diviluke','kjkkk','09090978788','edisongarofalo88@gmail.com',1,'2025-07-13 16:19:27',1,'2025-07-16 20:50:14',NULL,NULL,'1');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `IdCompra` int NOT NULL AUTO_INCREMENT,
  `IdProveedor` int DEFAULT NULL,
  `IdTienda` int DEFAULT NULL,
  `nro_boletacompras` varchar(20) DEFAULT NULL,
  `subtotalcosto` decimal(10,2) DEFAULT NULL,
  `iva` decimal(10,2) DEFAULT NULL,
  `TotalCosto` decimal(10,2) DEFAULT NULL,
  `TipoComprobante` enum('TICKET','FACTURA','NOTA_CREDITO','NOTA_DEBITO','GUIA_REMISION','RETENCION') NOT NULL,
  `NumeroSerie` varchar(15) DEFAULT NULL,
  `NumeroFactura` varchar(15) DEFAULT NULL,
  `fecha_factura` date DEFAULT NULL,
  `id_usuario_creacion` int DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_actualizacion` int DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `id_usuario_anulacion` int DEFAULT NULL,
  `fecha_anulacion` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  `tipo_pago` enum('EFECTIVO','CREDITO','TARJETA') DEFAULT NULL,
  PRIMARY KEY (`IdCompra`),
  KEY `fk_compra_IdUsuario` (`id_usuario_creacion`),
  CONSTRAINT `fk_compra_IdUsuario` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (36,8,NULL,'00000027',12.60,2.00,14.60,'FACTURA',NULL,'00012','2025-08-24',1,'2025-07-13 20:57:14',NULL,'2025-07-13 21:01:20',NULL,NULL,'2','EFECTIVO'),(37,8,NULL,'00000028',3.39,0.60,4.00,'FACTURA',NULL,'0009','2025-07-12',1,'2025-07-13 21:08:50',NULL,NULL,NULL,NULL,'1','CREDITO'),(38,8,NULL,'00000029',1.10,0.20,1.30,'FACTURA',NULL,'009','2025-09-20',1,'2025-07-13 21:21:36',NULL,NULL,NULL,NULL,'1','CREDITO'),(39,8,NULL,'00000030',7.60,0.20,7.80,'FACTURA',NULL,'099','2025-08-01',1,'2025-07-14 14:44:11',NULL,NULL,NULL,NULL,'1','CREDITO');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_credito`
--

DROP TABLE IF EXISTS `compras_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras_credito` (
  `id_compra_credito` int NOT NULL AUTO_INCREMENT,
  `id_compra` int DEFAULT NULL,
  `nroCreditoCompra` varchar(15) DEFAULT NULL,
  `monto_total` decimal(10,2) DEFAULT NULL,
  `monto_abonado` decimal(10,2) DEFAULT NULL,
  `saldo_pendiente` decimal(10,2) DEFAULT NULL,
  `fecha_compra` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('Pendiente','Pagado','Vencido','Otros','Inactivo') DEFAULT 'Pendiente',
  PRIMARY KEY (`id_compra_credito`),
  KEY `id_compra` (`id_compra`),
  CONSTRAINT `compras_credito_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`IdCompra`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_credito`
--

LOCK TABLES `compras_credito` WRITE;
/*!40000 ALTER TABLE `compras_credito` DISABLE KEYS */;
INSERT INTO `compras_credito` VALUES (6,37,'00000001',4.00,4.00,0.00,'2025-07-12','2026-01-24','2025-07-13 21:08:50','Pagado'),(7,38,'00000001',1.30,1.30,0.00,'2025-09-20','2025-10-18','2025-07-13 21:21:36','Pagado'),(8,39,'00000001',7.80,3.00,4.80,'2025-08-01','2025-09-28','2025-07-14 14:44:11','Pendiente');
/*!40000 ALTER TABLE `compras_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobantes_electronicos`
--

DROP TABLE IF EXISTS `comprobantes_electronicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprobantes_electronicos` (
  `id_comprobante` int NOT NULL AUTO_INCREMENT,
  `tipo_documento` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_venta` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `numero_autorizacion` varchar(49) DEFAULT NULL,
  `clave_acceso` varchar(49) NOT NULL,
  `numero_documento` varchar(17) NOT NULL,
  `id_ambiente` tinyint DEFAULT NULL,
  `id_estado_emision` tinyint DEFAULT NULL,
  `fecha_emision` datetime DEFAULT NULL,
  `fecha_autorizacion` datetime DEFAULT NULL,
  `id_tipo_emision` tinyint DEFAULT '1',
  `mensaje_respuesta` text,
  `ruta_xml_generado` text,
  `ruta_xml_firmado` text,
  `ruta_xml_autorizado` text,
  `pdf_generado` text,
  `id_enviado_cliente` tinyint DEFAULT '2',
  `fecha_envio_cliente` datetime DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_comprobante`),
  UNIQUE KEY `uk_clave_acceso` (`clave_acceso`),
  KEY `idx_numero_documento` (`numero_documento`),
  KEY `idx_id_venta` (`id_venta`),
  KEY `idx_id_cliente` (`id_cliente`),
  KEY `codigo_sri` (`tipo_documento`),
  KEY `id_ambiente` (`id_ambiente`),
  KEY `id_estado_emision` (`id_estado_emision`),
  KEY `id_tipo_emision` (`id_tipo_emision`),
  KEY `id_enviado_cliente` (`id_enviado_cliente`),
  CONSTRAINT `comprobantes_electronicos_ibfk_1` FOREIGN KEY (`tipo_documento`) REFERENCES `tipo_comprobante` (`codigo_sri`),
  CONSTRAINT `comprobantes_electronicos_ibfk_2` FOREIGN KEY (`id_ambiente`) REFERENCES `ambiente` (`id_ambiente`),
  CONSTRAINT `comprobantes_electronicos_ibfk_3` FOREIGN KEY (`id_estado_emision`) REFERENCES `estado_emision` (`id_estado`),
  CONSTRAINT `comprobantes_electronicos_ibfk_4` FOREIGN KEY (`id_tipo_emision`) REFERENCES `tipo_emision` (`id_tipo_emision`),
  CONSTRAINT `comprobantes_electronicos_ibfk_5` FOREIGN KEY (`id_enviado_cliente`) REFERENCES `enviado_cliente` (`id_enviado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobantes_electronicos`
--

LOCK TABLES `comprobantes_electronicos` WRITE;
/*!40000 ALTER TABLE `comprobantes_electronicos` DISABLE KEYS */;
INSERT INTO `comprobantes_electronicos` VALUES (1,'01',38,10,'1507202501080461081400110010010000000071407851116','1507202501080461081400110010010000000071407851116','001001000000007',1,4,'2025-07-15 00:00:00','2025-07-16 15:38:17',1,'AUTORIZADO',NULL,'C:\\DocumentosApp\\2025\\07\\FACTURA_001-001-000000007_15-07-2025_comprobante.xml','C:\\DocumentosApp\\2025\\07\\FACTURA_001-001-000000007_15-07-2025_autorizacion.xml','C:\\DocumentosApp\\2025\\07\\FACTURA_001-001-000000007_15-07-2025.pdf',1,'2025-07-16 21:09:55','2025-07-16 15:35:17');
/*!40000 ALTER TABLE `comprobantes_electronicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credito_estado_historial`
--

DROP TABLE IF EXISTS `credito_estado_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credito_estado_historial` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `id_credito` int NOT NULL,
  `estado_anterior` varchar(20) DEFAULT NULL,
  `estado_nuevo` varchar(20) DEFAULT NULL,
  `fecha_cambio` datetime DEFAULT CURRENT_TIMESTAMP,
  `usuario_cambio` int DEFAULT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `id_credito` (`id_credito`),
  KEY `usuario_cambio` (`usuario_cambio`),
  CONSTRAINT `credito_estado_historial_ibfk_1` FOREIGN KEY (`id_credito`) REFERENCES `ventas_credito` (`id_venta_credito`),
  CONSTRAINT `credito_estado_historial_ibfk_2` FOREIGN KEY (`usuario_cambio`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credito_estado_historial`
--

LOCK TABLES `credito_estado_historial` WRITE;
/*!40000 ALTER TABLE `credito_estado_historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `credito_estado_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta_contable`
--

DROP TABLE IF EXISTS `cuenta_contable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta_contable` (
  `id_cuenta` int NOT NULL AUTO_INCREMENT,
  `codigo_cuenta` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo` enum('ACTIVO','PASIVO','PATRIMONIO','INGRESO','GASTO') NOT NULL,
  `nivel` int DEFAULT '1',
  `padre_id` int DEFAULT NULL,
  PRIMARY KEY (`id_cuenta`),
  UNIQUE KEY `codigo_cuenta` (`codigo_cuenta`),
  KEY `padre_id` (`padre_id`),
  CONSTRAINT `cuenta_contable_ibfk_1` FOREIGN KEY (`padre_id`) REFERENCES `cuenta_contable` (`id_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta_contable`
--

LOCK TABLES `cuenta_contable` WRITE;
/*!40000 ALTER TABLE `cuenta_contable` DISABLE KEYS */;
INSERT INTO `cuenta_contable` VALUES (1,'100','ACTIVO','ACTIVO',1,NULL),(2,'200','PASIVO','PASIVO',1,NULL),(3,'300','PATRIMONIO','PATRIMONIO',1,NULL),(4,'400','INGRESO','INGRESO',1,NULL),(5,'500','GASTO','GASTO',1,NULL),(6,'101','Caja','ACTIVO',2,1),(7,'102','Banco','ACTIVO',2,1),(8,'103','Cuentas por cobrar','ACTIVO',2,1),(9,'104','Inventario','ACTIVO',2,1),(10,'201','Cuentas por pagar','PASIVO',2,2),(11,'401','Ventas','INGRESO',2,4),(12,'402','Ingresos varios','INGRESO',2,4),(13,'403','Ingresos por ajustes de inventario','INGRESO',2,4),(14,'501','Gasto de servicios (ej. luz, agua)','GASTO',2,5),(15,'502','Pérdida por inventario','GASTO',2,5),(16,'600','Productos Bonificados','GASTO',2,5);
/*!40000 ALTER TABLE `cuenta_contable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuotas_compra_credito`
--

DROP TABLE IF EXISTS `cuotas_compra_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuotas_compra_credito` (
  `id_cuota` int NOT NULL AUTO_INCREMENT,
  `id_compra_credito` int DEFAULT NULL,
  `monto_cuota` decimal(10,2) DEFAULT NULL,
  `fecha_vencimiento` datetime DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'Pendiente',
  PRIMARY KEY (`id_cuota`),
  KEY `id_compra_credito` (`id_compra_credito`),
  CONSTRAINT `cuotas_compra_credito_ibfk_1` FOREIGN KEY (`id_compra_credito`) REFERENCES `compras_credito` (`id_compra_credito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuotas_compra_credito`
--

LOCK TABLES `cuotas_compra_credito` WRITE;
/*!40000 ALTER TABLE `cuotas_compra_credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuotas_compra_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuotas_credito`
--

DROP TABLE IF EXISTS `cuotas_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuotas_credito` (
  `id_cuota` int NOT NULL AUTO_INCREMENT,
  `id_venta_credito` int DEFAULT NULL,
  `monto_cuota` decimal(10,2) DEFAULT NULL,
  `fecha_vencimiento` datetime DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'Pendiente',
  PRIMARY KEY (`id_cuota`),
  KEY `id_venta_credito` (`id_venta_credito`),
  CONSTRAINT `cuotas_credito_ibfk_1` FOREIGN KEY (`id_venta_credito`) REFERENCES `ventas_credito` (`id_venta_credito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuotas_credito`
--

LOCK TABLES `cuotas_credito` WRITE;
/*!40000 ALTER TABLE `cuotas_credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuotas_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `det_compra`
--

DROP TABLE IF EXISTS `det_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `det_compra` (
  `IdDetCompra` int NOT NULL AUTO_INCREMENT,
  `nro_boleta` varchar(20) DEFAULT NULL,
  `IdCompra` int DEFAULT NULL,
  `IdProducto` int DEFAULT NULL,
  `codigo_barra` varchar(20) DEFAULT NULL,
  `Cantidad` float NOT NULL,
  `PrecioUnitarioCompra` decimal(10,2) DEFAULT NULL,
  `PrecioUnitarioVenta` decimal(10,2) DEFAULT NULL,
  `subtotalcosto` decimal(10,2) NOT NULL,
  `iva` decimal(10,2) NOT NULL,
  `TotalCosto` decimal(10,2) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fecha_eliminacion` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`IdDetCompra`),
  KEY `fk_det_compra_IdCompra` (`IdCompra`),
  KEY `fk_det_compra_IdProducto` (`IdProducto`),
  CONSTRAINT `fk_det_compra_IdCompra` FOREIGN KEY (`IdCompra`) REFERENCES `compras` (`IdCompra`),
  CONSTRAINT `fk_det_compra_IdProducto` FOREIGN KEY (`IdProducto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `det_compra`
--

LOCK TABLES `det_compra` WRITE;
/*!40000 ALTER TABLE `det_compra` DISABLE KEYS */;
INSERT INTO `det_compra` VALUES (60,'00000027',36,28,'00002',1,1.30,NULL,1.30,0.00,1.30,'2025-07-13 20:57:14','2025-07-13 21:01:20',NULL,'2'),(61,'00000027',36,27,'00001',1,1.30,NULL,1.10,0.20,1.30,'2025-07-13 20:57:14','2025-07-13 21:01:20',NULL,'2'),(62,'00000027',36,31,'000010',8,1.50,NULL,10.20,1.80,12.00,'2025-07-13 20:57:14','2025-07-13 21:01:20',NULL,'2'),(63,'00000028',37,29,'00009',1,1.20,NULL,1.02,0.18,1.20,'2025-07-13 21:08:50',NULL,NULL,'1'),(64,'00000028',37,27,'00001',1,1.30,NULL,1.10,0.20,1.30,'2025-07-13 21:08:50',NULL,NULL,'1'),(65,'00000028',37,30,'09088',1,1.50,NULL,1.27,0.22,1.50,'2025-07-13 21:08:50',NULL,NULL,'1'),(66,'00000029',38,27,'00001',1,1.30,NULL,1.10,0.20,1.30,'2025-07-13 21:21:36',NULL,NULL,'1'),(67,'00000030',39,27,'00001',1,1.30,NULL,1.10,0.20,1.30,'2025-07-14 14:44:11',NULL,NULL,'1'),(68,'00000030',39,28,'00002',5,1.30,NULL,6.50,0.00,6.50,'2025-07-14 14:44:11',NULL,NULL,'1');
/*!40000 ALTER TABLE `det_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `det_venta`
--

DROP TABLE IF EXISTS `det_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `det_venta` (
  `IdDetalleVenta` int NOT NULL AUTO_INCREMENT,
  `nro_boleta` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `IdVenta` int DEFAULT NULL,
  `IdProducto` int DEFAULT NULL,
  `codigo_barra` varchar(25) DEFAULT NULL,
  `descripcion_producto` varchar(55) DEFAULT NULL,
  `cantidad` float DEFAULT NULL,
  `cantidad_fracion` decimal(10,2) DEFAULT NULL,
  `PrecioUnidad` decimal(10,2) DEFAULT NULL,
  `iva` decimal(10,2) DEFAULT NULL,
  `Sub_total` decimal(10,2) DEFAULT NULL,
  `total_venta` decimal(10,2) DEFAULT NULL,
  `estado_fracion_producto` char(1) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fecha_eliminacion` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`IdDetalleVenta`),
  KEY `fk_det_venta_id_venta` (`IdVenta`),
  KEY `fk_det_venta_id_producto` (`IdProducto`),
  CONSTRAINT `fk_det_venta_id_venta` FOREIGN KEY (`IdVenta`) REFERENCES `ventas` (`IdVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `det_venta`
--

LOCK TABLES `det_venta` WRITE;
/*!40000 ALTER TABLE `det_venta` DISABLE KEYS */;
INSERT INTO `det_venta` VALUES (84,'00000033',37,31,'000010','Adame 1',1,NULL,1.90,0.28,1.61,1.90,NULL,'2025-07-15 06:51:16','2025-07-15 06:54:48',NULL,'2'),(85,'00000033',37,29,'00009','SPARKO - 100 G',1,NULL,1.50,0.22,1.27,1.50,NULL,'2025-07-15 06:51:16','2025-07-15 06:54:48',NULL,'2'),(86,'00000033',37,28,'00002','Solfoxidante fungicida - Acaricida',1,NULL,2.50,0.00,2.50,2.50,NULL,'2025-07-15 06:51:16','2025-07-15 06:54:48',NULL,'2'),(87,'00000033',37,27,'00001','BATHUTIC - 1L',1,NULL,1.40,0.21,1.19,1.40,NULL,'2025-07-15 06:51:16','2025-07-15 06:54:48',NULL,'2'),(88,'00000034',38,31,'000010','Adame 1',1,NULL,1.90,0.28,1.61,1.90,NULL,'2025-07-15 07:19:38',NULL,NULL,'1'),(89,'00000034',38,29,'00009','SPARKO - 100 G',1,NULL,1.50,0.22,1.27,1.50,NULL,'2025-07-15 07:19:38',NULL,NULL,'1'),(90,'00000034',38,28,'00002','Solfoxidante fungicida - Acaricida',1,NULL,2.50,0.00,2.50,2.50,NULL,'2025-07-15 07:19:38',NULL,NULL,'1'),(91,'00000034',38,27,'00001','BATHUTIC - 1L',1,NULL,1.60,0.24,1.36,1.60,NULL,'2025-07-15 07:19:38',NULL,NULL,'1');
/*!40000 ALTER TABLE `det_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `det_venta_lote`
--

DROP TABLE IF EXISTS `det_venta_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `det_venta_lote` (
  `id_detalle_venta_stock` int NOT NULL AUTO_INCREMENT,
  `id_det_venta` int NOT NULL,
  `id_lote` int NOT NULL,
  `cantidad_vendida` int NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `costo_unitario` decimal(10,2) NOT NULL,
  `ganancia_unitaria` decimal(10,2) GENERATED ALWAYS AS ((`precio_venta` - `costo_unitario`)) STORED,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`id_detalle_venta_stock`),
  KEY `id_det_venta` (`id_det_venta`),
  KEY `id_lote` (`id_lote`),
  CONSTRAINT `det_venta_lote_ibfk_1` FOREIGN KEY (`id_det_venta`) REFERENCES `det_venta` (`IdDetalleVenta`),
  CONSTRAINT `det_venta_lote_ibfk_2` FOREIGN KEY (`id_lote`) REFERENCES `lote_producto` (`id_lote`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `det_venta_lote`
--

LOCK TABLES `det_venta_lote` WRITE;
/*!40000 ALTER TABLE `det_venta_lote` DISABLE KEYS */;
INSERT INTO `det_venta_lote` (`id_detalle_venta_stock`, `id_det_venta`, `id_lote`, `cantidad_vendida`, `precio_venta`, `costo_unitario`, `estado`) VALUES (86,84,114,1,1.90,1.50,'2'),(87,85,121,1,1.50,1.20,'2'),(88,86,126,1,2.50,1.30,'2'),(89,87,125,1,1.40,1.30,'2'),(90,88,114,1,1.90,1.50,'1'),(91,89,112,1,1.50,1.20,'1'),(92,90,126,1,2.50,1.30,'1'),(93,91,124,1,1.60,1.30,'1');
/*!40000 ALTER TABLE `det_venta_lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_asiento`
--

DROP TABLE IF EXISTS `detalle_asiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_asiento` (
  `id_detalle_asiento` int NOT NULL AUTO_INCREMENT,
  `id_asiento` int NOT NULL,
  `id_cuenta` int NOT NULL,
  `debe` decimal(10,2) DEFAULT '0.00',
  `haber` decimal(10,2) DEFAULT '0.00',
  `descripcion` text,
  `orden` int DEFAULT '0',
  PRIMARY KEY (`id_detalle_asiento`),
  KEY `id_asiento` (`id_asiento`),
  KEY `id_cuenta` (`id_cuenta`),
  CONSTRAINT `detalle_asiento_ibfk_1` FOREIGN KEY (`id_asiento`) REFERENCES `asiento_contable` (`id_asiento`),
  CONSTRAINT `detalle_asiento_ibfk_2` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta_contable` (`id_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_asiento`
--

LOCK TABLES `detalle_asiento` WRITE;
/*!40000 ALTER TABLE `detalle_asiento` DISABLE KEYS */;
INSERT INTO `detalle_asiento` VALUES (1,1,9,10.00,0.00,'Registro de inventario inicialsdsssssdd',1),(2,1,13,0.00,10.00,'Contrapartida por ajuste de producto sdsssssdd',2),(3,2,9,5.00,0.00,'Ingreso inventario por compra',1),(4,2,6,5.00,0.00,'Caja efectivo  por compra',2),(5,3,9,5.00,0.00,'Ingreso inventario por compra',1),(6,3,6,5.00,0.00,'Caja efectivo  por compra',2),(7,4,9,1.00,0.00,'Ingreso inventario por compra',1),(8,4,6,1.00,0.00,'Caja efectivo  por compra',2),(9,5,9,0.00,0.00,'Ingreso producto bonificado',1),(10,5,16,0.00,0.00,'Bonificación proveedor',2),(11,6,9,1.00,0.00,'Ingreso inventario por compra',1),(12,6,6,1.00,0.00,'Caja efectivo  por compra',2),(13,7,9,1.00,0.00,'Ingreso inventario por compra',1),(14,7,6,1.00,0.00,'Caja efectivo  por compra',2),(15,8,9,1.00,0.00,'Ingreso inventario por compra',1),(16,8,6,1.00,0.00,'Caja efectivo  por compra',2),(17,9,9,3.00,0.00,'Ingreso inventario por compra',1),(18,9,6,3.00,0.00,'Caja efectivo  por compra',2),(19,10,9,1.00,0.00,'Ingreso inventario por compra',1),(20,10,6,1.00,0.00,'Caja efectivo  por compra',2),(21,11,9,0.00,0.00,'Reposición por devolución',1),(22,11,11,0.00,0.00,'Reversión de ingreso por devolución',2),(23,12,9,10.00,0.00,'Registro de inventario inicialProducod',1),(24,12,13,0.00,10.00,'Contrapartida por ajuste de producto Producod',2),(25,13,9,2.00,0.00,'Ingreso inventario por compra',1),(26,13,6,2.00,0.00,'Caja efectivo  por compra',2),(27,14,9,0.00,0.00,'Ingreso producto bonificado',1),(28,14,16,0.00,0.00,'Bonificación proveedor',2),(29,15,15,10.00,0.00,'Pérdida por ajuste de inventario',1),(30,15,9,0.00,10.00,'Disminución de inventario',2),(31,16,9,0.00,0.00,'Reposición por devolución',1),(32,16,11,0.00,0.00,'Reversión de ingreso por devolución',2),(33,17,15,5.00,0.00,'Pérdida por ajuste de inventario',1),(34,17,9,0.00,5.00,'Disminución de inventario',2),(35,18,9,0.00,0.00,'Reposición por devolución',1),(36,18,11,0.00,0.00,'Reversión de ingreso por devolución',2),(37,19,15,1.00,0.00,'Pérdida por ajuste de inventario',1),(38,19,9,0.00,1.00,'Disminución de inventario',2),(39,20,9,0.00,0.00,'Reposición por devolución',1),(40,20,11,0.00,0.00,'Reversión de ingreso por devolución',2),(41,21,9,40.00,0.00,'Registro de inventario inicialgfrrrrfrfrrfrf',1),(42,21,13,0.00,40.00,'Contrapartida por ajuste de producto gfrrrrfrfrrfrf',2),(43,22,9,20.00,0.00,'Registro de inventario inicial4404404',1),(44,22,13,0.00,20.00,'Contrapartida por ajuste de producto 4404404',2),(45,23,9,65.00,0.00,'Registro de inventario inicialffdffddffddfffff',1),(46,23,13,0.00,65.00,'Contrapartida por ajuste de producto ffdffddffddfffff',2),(47,24,9,60.00,0.00,'Registro de inventario inicialpruenabbsbssasa',1),(48,24,13,0.00,60.00,'Contrapartida por ajuste de producto pruenabbsbssasa',2),(49,25,9,20.00,0.00,'Registro de inventario inicialDell 14 ispiro',1),(50,25,13,0.00,20.00,'Contrapartida por ajuste de producto Dell 14 ispiro',2),(51,26,9,20.00,0.00,'Registro de inventario inicialmodelo 13 dd',1),(52,26,13,0.00,20.00,'Contrapartida por ajuste de producto modelo 13 dd',2),(53,27,9,5.00,0.00,'Registro de inventario inicialCanande fuente de vida',1),(54,27,13,0.00,5.00,'Contrapartida por ajuste de producto Canande fuente de vida',2),(55,28,9,20.00,0.00,'Registro de inventario inicialaMSLMSLSLAMSALALS',1),(56,28,13,0.00,20.00,'Contrapartida por ajuste de producto aMSLMSLSLAMSALALS',2),(57,29,9,12.00,0.00,'Registro de inventario inicialdcckscdkcdmdcmdkds',1),(58,29,13,0.00,12.00,'Contrapartida por ajuste de producto dcckscdkcdmdcmdkds',2),(59,30,9,1.00,0.00,'Registro de inventario inicialdsssfdssdfsdfsdfssfsfd',1),(60,30,13,0.00,1.00,'Contrapartida por ajuste de producto dsssfdssdfsdfsdfssfsfd',2),(61,31,9,1.00,0.00,'Registro de inventario inicialwedewewew',1),(62,31,13,0.00,1.00,'Contrapartida por ajuste de producto wedewewew',2),(63,32,9,10.00,0.00,'Ingreso inventario por compra',1),(64,32,6,10.00,0.00,'Caja efectivo  por compra',2),(65,33,9,4.00,0.00,'Ingreso inventario por compra',1),(66,33,6,4.00,0.00,'Caja efectivo  por compra',2),(67,34,9,24.00,0.00,'Registro de inventario inicialGlyphosate Isopropylamine salt (480 g/l)',1),(68,34,13,0.00,24.00,'Contrapartida por ajuste de producto Glyphosate Isopropylamine salt (480 g/l)',2),(69,35,9,12.00,0.00,'Registro de inventario inicialSDDSDSDSDSD',1),(70,35,13,0.00,12.00,'Contrapartida por ajuste de producto SDDSDSDSDSD',2),(71,36,9,1.00,0.00,'Registro de inventario inicialbbjugugugugugugugu',1),(72,36,13,0.00,1.00,'Contrapartida por ajuste de producto bbjugugugugugugugu',2),(73,37,9,5.00,0.00,'Ingreso inventario por compra',1),(74,37,6,5.00,0.00,'Caja efectivo  por compra',2),(75,38,9,13.00,0.00,'Registro de inventario inicialBATHUTIC - 1L',1),(76,38,13,0.00,13.00,'Contrapartida por ajuste de producto BATHUTIC - 1L',2),(77,39,9,20.00,0.00,'Registro de inventario inicialSolfoxidante fungicida - Acaricida',1),(78,39,13,0.00,20.00,'Contrapartida por ajuste de producto Solfoxidante fungicida - Acaricida',2),(79,40,9,12.00,0.00,'Registro de inventario inicialSPARKO - 100 G',1),(80,40,13,0.00,12.00,'Contrapartida por ajuste de producto SPARKO - 100 G',2),(81,41,9,24.00,0.00,'Registro de inventario inicialaFEPASA',1),(82,41,13,0.00,24.00,'Contrapartida por ajuste de producto aFEPASA',2),(83,42,9,21.00,0.00,'Registro de inventario inicialAdame',1),(84,42,13,0.00,21.00,'Contrapartida por ajuste de producto Adame',2),(85,43,9,15.00,0.00,'Ingreso inventario por compra',1),(86,43,6,15.00,0.00,'Caja efectivo  por compra',2),(87,44,9,0.00,0.00,'Ingreso producto bonificado',1),(88,44,16,0.00,0.00,'Bonificación proveedor',2),(89,45,9,0.00,0.00,'Ingreso producto bonificado',1),(90,45,16,0.00,0.00,'Bonificación proveedor',2),(91,46,9,0.00,0.00,'Reposición por devolución',1),(92,46,11,0.00,0.00,'Reversión de ingreso por devolución',2),(93,47,15,10.50,0.00,'Pérdida por ajuste de inventario',1),(94,47,9,0.00,10.50,'Disminución de inventario',2);
/*!40000 ALTER TABLE `detalle_asiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_devoluciones`
--

DROP TABLE IF EXISTS `detalle_devoluciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_devoluciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_movimiento_caja` int NOT NULL,
  `afectarCaja` int DEFAULT '0',
  `id_ventas` int DEFAULT NULL,
  `tipo_devolucion` enum('Venta','Compra') NOT NULL,
  `nro_ventas` varchar(20) DEFAULT NULL,
  `id_compras` int DEFAULT NULL,
  `nro_compras` varchar(20) DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL,
  `descripcion` text,
  `estado` char(1) DEFAULT '1',
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fecha_eliminacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_movimiento_caja` (`id_movimiento_caja`),
  CONSTRAINT `detalle_devoluciones_ibfk_1` FOREIGN KEY (`id_movimiento_caja`) REFERENCES `movimiento_caja` (`id_movimiento_caja`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_devoluciones`
--

LOCK TABLES `detalle_devoluciones` WRITE;
/*!40000 ALTER TABLE `detalle_devoluciones` DISABLE KEYS */;
INSERT INTO `detalle_devoluciones` VALUES (6,18,0,NULL,'Compra',NULL,36,'00000027',14.60,'Eliminación de compra Id: 36','1','2025-07-13 21:01:20',NULL,NULL),(7,18,0,37,'Venta','00000033',NULL,NULL,7.30,'Devolucion de Venta Id: 37','1','2025-07-15 06:54:48',NULL,NULL);
/*!40000 ALTER TABLE `detalle_devoluciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_gastos`
--

DROP TABLE IF EXISTS `detalle_gastos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_gastos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_movimiento_caja` int NOT NULL,
  `afectarCaja` int DEFAULT '0',
  `tipo_gastos` enum('Compras','Creditos','Otros') NOT NULL,
  `tipo_pago` int DEFAULT NULL,
  `id_compras` int DEFAULT NULL,
  `id_abono` int DEFAULT NULL,
  `nro_factura` varchar(25) DEFAULT NULL,
  `nro_compras` varchar(20) DEFAULT NULL,
  `nro_credito_compras` varchar(20) DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL,
  `descripcion` text,
  `estado` char(1) DEFAULT '1',
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fecha_eliminacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_movimiento_caja` (`id_movimiento_caja`),
  CONSTRAINT `detalle_gastos_ibfk_1` FOREIGN KEY (`id_movimiento_caja`) REFERENCES `movimiento_caja` (`id_movimiento_caja`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_gastos`
--

LOCK TABLES `detalle_gastos` WRITE;
/*!40000 ALTER TABLE `detalle_gastos` DISABLE KEYS */;
INSERT INTO `detalle_gastos` VALUES (39,17,1,'Compras',1,36,NULL,'00012','00000027','00000001',14.60,'Compra de mercaderia','2','2025-07-13 20:57:14','2025-07-13 21:01:20',NULL),(40,17,0,'Compras',2,37,NULL,'0009','00000028','00000001',0.00,'Compra de mercaderia','1','2025-07-13 21:08:50',NULL,NULL),(41,17,1,'Creditos',1,37,NULL,NULL,NULL,NULL,4.00,'pago','1','2025-07-13 21:11:04',NULL,NULL),(42,17,0,'Compras',2,38,NULL,'009','00000029','00000001',0.00,'Compra de mercaderia','1','2025-07-13 21:21:36',NULL,NULL),(43,17,1,'Creditos',1,38,NULL,NULL,NULL,NULL,1.00,'ee','1','2025-07-13 21:21:50',NULL,NULL),(44,17,1,'Creditos',1,38,NULL,NULL,NULL,NULL,0.30,'faddd','1','2025-07-13 21:30:12',NULL,NULL),(45,17,0,'Compras',2,39,NULL,'099','00000030','00000001',0.00,'Compra de mercaderia','1','2025-07-14 14:44:11',NULL,NULL),(46,17,1,'Creditos',1,39,NULL,NULL,NULL,NULL,3.00,'pGO EN VIENES','1','2025-07-14 16:17:16',NULL,NULL),(47,17,1,'Otros',1,NULL,NULL,NULL,NULL,NULL,20.50,'pago de luz','2','2025-07-15 09:55:22','2025-07-15 14:30:35',NULL);
/*!40000 ALTER TABLE `detalle_gastos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ingresos`
--

DROP TABLE IF EXISTS `detalle_ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ingresos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_movimiento_caja` int NOT NULL,
  `tipo_ingresos` enum('Ventas','Creditos','Otros') NOT NULL,
  `tipo_pago` int DEFAULT NULL,
  `id_ventas` int DEFAULT NULL,
  `id_abono` int DEFAULT NULL,
  `nro_ventas` varchar(20) DEFAULT NULL,
  `nro_credito_ventas` varchar(20) DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL,
  `descripcion` text,
  `estado` char(1) DEFAULT '1',
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fecha_eliminacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_movimiento_caja` (`id_movimiento_caja`),
  CONSTRAINT `detalle_ingresos_ibfk_1` FOREIGN KEY (`id_movimiento_caja`) REFERENCES `movimiento_caja` (`id_movimiento_caja`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ingresos`
--

LOCK TABLES `detalle_ingresos` WRITE;
/*!40000 ALTER TABLE `detalle_ingresos` DISABLE KEYS */;
INSERT INTO `detalle_ingresos` VALUES (40,16,'Ventas',1,37,NULL,'00000033',NULL,10.00,'Venta de producto','2','2025-07-15 06:51:16','2025-07-15 06:54:48',NULL),(41,16,'Ventas',2,38,NULL,'00000034',NULL,0.00,'Venta de producto','1','2025-07-15 07:19:38',NULL,NULL),(42,16,'Otros',1,NULL,NULL,NULL,NULL,100.00,'venta de  de mi bisicletad','1','2025-07-15 09:52:50','2025-07-15 11:19:47',NULL),(43,16,'Otros',1,NULL,NULL,NULL,NULL,50.00,'Salddd','2','2025-07-15 09:55:04','2025-07-15 14:30:16',NULL),(44,16,'Otros',1,NULL,NULL,NULL,NULL,649.80,'venta de moto al contado','1','2025-07-15 11:08:37','2025-07-15 13:56:24',NULL),(45,16,'Creditos',1,38,8,NULL,NULL,5.50,'pago de','1','2025-07-15 17:34:43',NULL,NULL),(46,16,'Creditos',1,38,9,NULL,NULL,2.00,'pago total','1','2025-07-15 17:48:36',NULL,NULL);
/*!40000 ALTER TABLE `detalle_ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dinero`
--

DROP TABLE IF EXISTS `dinero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dinero` (
  `id_dinero` int NOT NULL AUTO_INCREMENT,
  `id_arqueo` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `id_caja` int DEFAULT NULL,
  `billete_100` decimal(10,2) DEFAULT NULL,
  `billete_50` decimal(10,2) DEFAULT NULL,
  `billete_20` decimal(10,2) DEFAULT NULL,
  `billete_10` decimal(10,2) DEFAULT NULL,
  `billete_5` decimal(10,2) DEFAULT NULL,
  `billete_2` decimal(10,2) DEFAULT NULL,
  `billete_1` decimal(10,2) DEFAULT NULL,
  `moneda_1` decimal(10,2) DEFAULT NULL,
  `moneda_50` decimal(10,2) DEFAULT NULL,
  `moneda_25` decimal(10,2) DEFAULT NULL,
  `moneda_10` decimal(10,2) DEFAULT NULL,
  `moneda_5` decimal(10,2) DEFAULT NULL,
  `moneda_001` decimal(10,2) DEFAULT NULL,
  `total_moneda` decimal(10,2) DEFAULT NULL,
  `total_billeta` decimal(10,2) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`id_dinero`),
  KEY `fk_dinero_id_arqueo` (`id_arqueo`),
  KEY `fk_dinero_id_usuario` (`id_usuario`),
  CONSTRAINT `fk_dinero_id_arqueo` FOREIGN KEY (`id_arqueo`) REFERENCES `arqueo_caja` (`id_arqueo_caja`),
  CONSTRAINT `fk_dinero_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dinero`
--

LOCK TABLES `dinero` WRITE;
/*!40000 ALTER TABLE `dinero` DISABLE KEYS */;
/*!40000 ALTER TABLE `dinero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `id_Empresa` int NOT NULL AUTO_INCREMENT,
  `id_firma` int DEFAULT NULL,
  `razon_social` varchar(200) DEFAULT NULL,
  `nombre_comercial` varchar(200) DEFAULT NULL,
  `ruc` varchar(13) DEFAULT NULL,
  `direccion_matriz` varchar(300) DEFAULT NULL,
  `direccion_sucursal` varchar(300) DEFAULT NULL,
  `contribuyente_especial` varchar(50) DEFAULT NULL,
  `obligado_contabilidad` enum('SI','NO') DEFAULT NULL,
  `ambiente` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tipo_emision` char(1) DEFAULT NULL,
  `establecimiento_codigo` varchar(3) DEFAULT NULL,
  `punto_emision_codigo` varchar(3) DEFAULT NULL,
  `secuencial` int DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `serie_boleta` varchar(20) DEFAULT NULL,
  `nro_correlativo_ventas` varchar(20) DEFAULT NULL,
  `nro_credito_ventas` varchar(20) DEFAULT NULL,
  `nro_correlativo_compras` varchar(20) DEFAULT NULL,
  `nro_credito_compras` varchar(20) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `mensaje` varchar(100) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fecha_eliminacion` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  `codigo_iva` int DEFAULT NULL,
  `logo_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TipoDocumento` varchar(5) DEFAULT NULL,
  `nro_boletaSri` varchar(15) DEFAULT NULL,
  `mensaje_correo_cliente` varchar(255) DEFAULT NULL,
  `asunto_correo_cliente` varchar(100) DEFAULT NULL,
  `mensaje_correo_sri` varchar(255) DEFAULT NULL,
  `nombre_contacto` varchar(100) DEFAULT NULL,
  `correo_soporte` varchar(100) DEFAULT NULL,
  `forma_pago_codigo` char(2) DEFAULT NULL,
  `cod_impuesto` char(2) DEFAULT NULL,
  PRIMARY KEY (`id_Empresa`),
  KEY `fk_empresa_iva` (`codigo_iva`),
  KEY `fk_tipo_documento` (`TipoDocumento`),
  KEY `fk_empresa_forma_pago` (`forma_pago_codigo`),
  KEY `fk_empresa_cod_impuesto` (`cod_impuesto`),
  CONSTRAINT `fk_empresa_cod_impuesto` FOREIGN KEY (`cod_impuesto`) REFERENCES `impuesto` (`codigo`),
  CONSTRAINT `fk_empresa_forma_pago` FOREIGN KEY (`forma_pago_codigo`) REFERENCES `forma_pago` (`codigo`),
  CONSTRAINT `fk_empresa_iva` FOREIGN KEY (`codigo_iva`) REFERENCES `porcentaje_iva` (`codigo`),
  CONSTRAINT `fk_tipo_documento` FOREIGN KEY (`TipoDocumento`) REFERENCES `tipo_comprobante` (`codigo_sri`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,NULL,'Ventas de Producto Agricola','El Agricultor','0804610814001','Esmeralda','AV Las Golondrinas',NULL,'NO','1','1','001','001',1,NULL,NULL,'00000034','00000007','00000030','0','garofaloedison8@gmail.com','0992335080',NULL,'2025-05-03 19:57:34','2025-07-17 17:32:16',NULL,'1',4,NULL,'01','6',NULL,NULL,NULL,NULL,NULL,'20','2'),(2,1,'ffffffdff','2','1234678995','barrio entre rios','das','si','SI','1','1','001','001',1,'dwww',NULL,NULL,NULL,NULL,NULL,'edisongarofalo88@gmail.com','5555555','ddddddddddd','2025-06-12 14:34:45','2025-06-19 14:50:54',NULL,'2',0,'Views/assets/imagenes/logo/logo_684b2bd5447c5.PNG','01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,2,'Proveedor anime ','Mundo del aime ','0804610014001','barrio entre rios1','Guayauqii 1','SI','NO','2','2','001','002',2,'Bleacjha ',NULL,NULL,NULL,NULL,NULL,'edisongarofalo881@gmail.com','55555551','gracias por su comras1','2025-06-12 14:41:08','2025-06-19 14:50:54',NULL,'1',2,'Views/assets/imagenes/logo/logo_684b2d54d9e4a.PNG','01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,1,'ffffffdff','Mundo del aime 1','0804610814','barrio entre rios','ffffffff','SI','SI','1','2','090','090',2,'Bleacjha 1',NULL,NULL,NULL,NULL,NULL,'edisongarofalo88@gmail.com','5555555','dffdfffffff','2025-06-12 22:09:36','2025-06-13 00:11:47',NULL,'2',4,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enviado_cliente`
--

DROP TABLE IF EXISTS `enviado_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enviado_cliente` (
  `id_enviado` tinyint NOT NULL,
  `nombre` varchar(3) NOT NULL,
  PRIMARY KEY (`id_enviado`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enviado_cliente`
--

LOCK TABLES `enviado_cliente` WRITE;
/*!40000 ALTER TABLE `enviado_cliente` DISABLE KEYS */;
INSERT INTO `enviado_cliente` VALUES (2,'NO'),(1,'SI');
/*!40000 ALTER TABLE `enviado_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_emision`
--

DROP TABLE IF EXISTS `estado_emision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_emision` (
  `id_estado` tinyint NOT NULL,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id_estado`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_emision`
--

LOCK TABLES `estado_emision` WRITE;
/*!40000 ALTER TABLE `estado_emision` DISABLE KEYS */;
INSERT INTO `estado_emision` VALUES (4,'AUTORIZADO'),(3,'DEVUELTA'),(5,'EN_PROCESO'),(99,'ERROR_CONSULTA_SRI'),(1,'GENERADO'),(6,'NO_AUTORIZADO'),(7,'OTRO / DESCONOCIDO'),(2,'RECIBIDA');
/*!40000 ALTER TABLE `estado_emision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firma_electronica`
--

DROP TABLE IF EXISTS `firma_electronica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `firma_electronica` (
  `id_firma` int NOT NULL,
  `nombre_archivo` varchar(100) DEFAULT NULL,
  `certificado_digital` text,
  `clave_certificado` varchar(255) DEFAULT NULL,
  `fecha_inicio_vigencia` date DEFAULT NULL,
  `fecha_fin_vigencia` date DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_firma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firma_electronica`
--

LOCK TABLES `firma_electronica` WRITE;
/*!40000 ALTER TABLE `firma_electronica` DISABLE KEYS */;
/*!40000 ALTER TABLE `firma_electronica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pago`
--

DROP TABLE IF EXISTS `forma_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pago` (
  `codigo` char(2) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pago`
--

LOCK TABLES `forma_pago` WRITE;
/*!40000 ALTER TABLE `forma_pago` DISABLE KEYS */;
INSERT INTO `forma_pago` VALUES ('01','SIN UTILIZACION DEL SISTEMA FINANCIERO'),('15','COMPENSACIÓN DE DEUDAS'),('16','TARJETA DE DÉBITO'),('17','DINERO ELECTRÓNICO'),('18','TARJETA PREPAGO'),('19','TARJETA DE CRÉDITO'),('20','OTROS CON UTILIZACIÓN DEL SISTEMA FINANCIERO'),('21','ENDOSO DE TÍTULOS');
/*!40000 ALTER TABLE `forma_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impuesto`
--

DROP TABLE IF EXISTS `impuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `impuesto` (
  `codigo` char(2) NOT NULL,
  `impuesto` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impuesto`
--

LOCK TABLES `impuesto` WRITE;
/*!40000 ALTER TABLE `impuesto` DISABLE KEYS */;
INSERT INTO `impuesto` VALUES ('2','IVA'),('3','ICE'),('5','IRBPNR');
/*!40000 ALTER TABLE `impuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kardex`
--

DROP TABLE IF EXISTS `kardex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kardex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario_creacion` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `codigo_producto` varchar(20) DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `concepto` text,
  `comprobante` varchar(50) DEFAULT NULL,
  `entrada_unidades` float DEFAULT NULL,
  `entrada_costo_unitario` decimal(10,2) DEFAULT NULL,
  `entrada_costo_total` decimal(10,2) DEFAULT NULL,
  `salidad_unidades` float DEFAULT NULL,
  `salidad_costo_unitario` decimal(10,2) DEFAULT NULL,
  `salidad_costo_total` decimal(10,2) DEFAULT NULL,
  `existencia_unidades` float DEFAULT NULL,
  `existencia_costo_unitario` decimal(10,2) DEFAULT NULL,
  `existencia_costo_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_kardex_id_producto` (`id_producto`),
  CONSTRAINT `fk_kardex_id_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kardex`
--

LOCK TABLES `kardex` WRITE;
/*!40000 ALTER TABLE `kardex` DISABLE KEYS */;
INSERT INTO `kardex` VALUES (218,1,27,'00001','2025-07-13 14:31:26','INVENTARIO INICIAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,1.30,13.00),(219,1,28,'00002','2025-07-13 14:50:21','INVENTARIO INICIAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,1.30,20.00),(220,1,29,'00009','2025-07-13 15:06:02','INVENTARIO INICIAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,1.20,12.00),(221,1,30,'09088','2025-07-13 15:08:23','INVENTARIO INICIAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,1.50,24.00),(222,1,31,'000010','2025-07-13 15:13:46','INVENTARIO INICIAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,1.50,21.00),(223,1,30,'09088','2025-07-13 15:23:46','ingrese por mercaderia',NULL,10,1.50,15.00,NULL,NULL,NULL,26,1.50,39.00),(224,1,30,'09088','2025-07-13 15:25:41','promocion',NULL,2,0.00,0.00,NULL,NULL,NULL,28,1.39,39.00),(225,1,30,'09088','2025-07-13 15:58:45','por ganacia',NULL,3,0.00,0.00,NULL,NULL,NULL,31,1.26,39.00),(226,1,30,'09088','2025-07-13 16:03:08','debolu',NULL,NULL,NULL,NULL,3,0.00,0.00,28,1.39,39.00),(227,1,30,'09088','2025-07-13 16:05:46','por perdida',NULL,NULL,NULL,NULL,7,1.50,10.50,21,1.36,28.50),(228,1,28,'00002','2025-07-13 20:57:14','Compra de productos','00000027',1,1.30,1.30,NULL,NULL,NULL,16,1.30,22.10),(229,1,27,'00001','2025-07-13 20:57:14','Compra de productos','00000027',1,1.30,1.30,NULL,NULL,NULL,11,1.30,15.60),(230,1,31,'000010','2025-07-13 20:57:14','Compra de productos','00000027',8,1.50,12.00,NULL,NULL,NULL,22,1.50,45.00),(231,1,28,'00002','2025-07-13 21:01:20','Eliminación de compra Id:36','00000027',NULL,NULL,NULL,1,1.30,1.30,15,1.30,19.50),(232,1,27,'00001','2025-07-13 21:01:20','Eliminación de compra Id:36','00000027',NULL,NULL,NULL,1,1.30,1.30,10,1.30,13.00),(233,1,31,'000010','2025-07-13 21:01:20','Eliminación de compra Id:36','00000027',NULL,NULL,NULL,8,1.50,12.00,14,1.50,21.00),(234,1,29,'00009','2025-07-13 21:08:50','Compra de productos','00000028',1,1.20,1.20,NULL,NULL,NULL,11,1.20,14.40),(235,1,27,'00001','2025-07-13 21:08:50','Compra de productos','00000028',1,1.30,1.30,NULL,NULL,NULL,11,1.30,15.60),(236,1,30,'09088','2025-07-13 21:08:50','Compra de productos','00000028',1,1.50,1.50,NULL,NULL,NULL,22,1.50,34.50),(237,1,27,'00001','2025-07-13 21:21:36','Compra de productos','00000029',1,1.30,1.30,NULL,NULL,NULL,12,1.30,16.90),(238,1,27,'00001','2025-07-14 14:44:11','Compra de productos','00000030',1,1.30,1.30,NULL,NULL,NULL,13,1.30,18.20),(239,1,28,'00002','2025-07-14 14:44:11','Compra de productos','00000030',5,1.30,6.50,NULL,NULL,NULL,20,1.30,32.50),(241,1,31,'000010','2025-07-15 06:51:16','Venta de producto','00000033',NULL,NULL,NULL,1,1.50,1.50,13,1.50,19.50),(242,1,29,'00009','2025-07-15 06:51:16','Venta de producto','00000033',NULL,NULL,NULL,1,1.20,1.20,10,1.20,12.00),(243,1,28,'00002','2025-07-15 06:51:16','Venta de producto','00000033',NULL,NULL,NULL,1,1.30,1.30,19,1.30,24.70),(244,1,27,'00001','2025-07-15 06:51:16','Venta de producto','00000033',NULL,NULL,NULL,1,1.30,1.30,12,1.30,15.60),(245,1,31,'000010','2025-07-15 06:54:48','Devolucion de Venta: Id37','00000033',1,1.50,1.50,NULL,NULL,NULL,14,1.50,21.00),(246,1,29,'00009','2025-07-15 06:54:48','Devolucion de Venta: Id37','00000033',1,1.20,1.20,NULL,NULL,NULL,11,1.20,13.20),(247,1,28,'00002','2025-07-15 06:54:48','Devolucion de Venta: Id37','00000033',1,1.30,1.30,NULL,NULL,NULL,20,1.30,26.00),(248,1,27,'00001','2025-07-15 06:54:48','Devolucion de Venta: Id37','00000033',1,1.30,1.30,NULL,NULL,NULL,13,1.30,16.90),(249,1,31,'000010','2025-07-15 07:19:38','Venta de producto','00000034',NULL,NULL,NULL,1,1.50,1.50,13,1.50,19.50),(250,1,29,'00009','2025-07-15 07:19:38','Venta de producto','00000034',NULL,NULL,NULL,1,1.20,1.20,10,1.20,12.00),(251,1,28,'00002','2025-07-15 07:19:38','Venta de producto','00000034',NULL,NULL,NULL,1,1.30,1.30,19,1.30,24.70),(252,1,27,'00001','2025-07-15 07:19:38','Venta de producto','00000034',NULL,NULL,NULL,1,1.30,1.30,12,1.30,15.60);
/*!40000 ALTER TABLE `kardex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licencia`
--

DROP TABLE IF EXISTS `licencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licencia` (
  `id_licencia` int NOT NULL AUTO_INCREMENT,
  `licencia` varchar(45) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_licencia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licencia`
--

LOCK TABLES `licencia` WRITE;
/*!40000 ALTER TABLE `licencia` DISABLE KEYS */;
INSERT INTO `licencia` VALUES (1,' DESKTOP-6M3H8KN','1');
/*!40000 ALTER TABLE `licencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licencia_alquirida`
--

DROP TABLE IF EXISTS `licencia_alquirida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licencia_alquirida` (
  `id_licencia_alquirida` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_licencia` int DEFAULT NULL,
  `activacion` char(1) DEFAULT NULL,
  `direccion_mac` varchar(45) DEFAULT NULL,
  `fecha_compra` datetime DEFAULT NULL,
  `fecha_vigente` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_licencia_alquirida`),
  KEY `fk_licencia_alquirida_id_licencia` (`id_licencia`),
  KEY `fk_licencia_alquirida_id_usuario` (`id_usuario`),
  CONSTRAINT `fk_licencia_alquirida_id_licencia` FOREIGN KEY (`id_licencia`) REFERENCES `licencia` (`id_licencia`),
  CONSTRAINT `fk_licencia_alquirida_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licencia_alquirida`
--

LOCK TABLES `licencia_alquirida` WRITE;
/*!40000 ALTER TABLE `licencia_alquirida` DISABLE KEYS */;
INSERT INTO `licencia_alquirida` VALUES (2,1,1,'1',' DESKTOP-6M3H8KN','2025-03-28 17:04:42','2028-04-28 17:04:42','1');
/*!40000 ALTER TABLE `licencia_alquirida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_auditoria`
--

DROP TABLE IF EXISTS `log_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_auditoria` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `tabla` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `accion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `detalle` text,
  `id_registro_afectado` int DEFAULT NULL,
  `modulo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_auditoria`
--

LOCK TABLES `log_auditoria` WRITE;
/*!40000 ALTER TABLE `log_auditoria` DISABLE KEYS */;
INSERT INTO `log_auditoria` VALUES (1,'medidas','registrar',1,'2025-04-29 17:35:16','Registrar una Medidas',NULL,NULL),(2,'medidas','Actualizar',1,'2025-04-29 17:36:54','Actualizar una Medidas con el id:9',NULL,NULL),(3,'medidas','Eliminar',1,'2025-04-29 17:54:12','Eliminar una Medidas con el id:5',NULL,NULL),(4,'medidas','registrar',1,'2025-04-29 17:54:59','Registrar una Medidas',NULL,NULL),(5,'medidas','Actualizar',1,'2025-04-29 17:55:12','Actualizar una Medidas con el id:10',NULL,NULL),(6,'medidas','registrar',1,'2025-04-29 18:04:28','Registrar una Medidas',NULL,NULL),(7,'medidas','Actualizar',1,'2025-04-29 18:05:16','Actualizar una Medidas con el id: 11',NULL,NULL),(8,'medidas','Eliminar',1,'2025-04-29 18:08:26','Eliminar una Medidas con el id: 11',NULL,NULL),(9,'categorias','registrar',1,'2025-04-29 19:24:51','Registrar una Categoria',NULL,NULL),(10,'categorias','registrar',1,'2025-04-29 19:31:07','Registrar una Categoria',NULL,NULL),(11,'categorias','registrar',1,'2025-04-29 20:04:52','Registrar una Categoria',NULL,NULL),(12,'categorias','Actualizar',1,'2025-04-29 20:05:12','Actualizar una Categoria con el id: 5',NULL,NULL),(13,'categorias','Actualizar',1,'2025-04-29 20:30:49','Actualizar una Categoria con el id: 5',NULL,NULL),(14,'categorias','registrar',1,'2025-04-29 20:31:03','Registrar una Categoria',NULL,NULL),(15,'categorias','Eliminar',1,'2025-04-29 20:31:17','Eliminar una categoria con el id: 6',NULL,NULL),(16,'producto','registrar',1,'2025-04-30 10:49:35','Registrar una Producto',NULL,NULL),(17,'producto','registrar',1,'2025-04-30 10:53:12','Registrar una Producto',NULL,NULL),(18,'producto','registrar',1,'2025-04-30 11:05:11','Registrar una Producto',NULL,NULL),(19,'producto','registrar',1,'2025-04-30 11:24:26','Registrar una Producto',NULL,NULL),(20,'producto','registrar',1,'2025-04-30 11:27:38','Registrar una Producto',NULL,NULL),(21,'producto','registrar',1,'2025-04-30 11:38:06','Registrar una Producto',NULL,NULL),(22,'producto','registrar',1,'2025-04-30 11:42:01','Registrar una Producto',NULL,NULL),(23,'producto','registrar',1,'2025-04-30 11:42:13','Registrar una Producto',NULL,NULL),(24,'producto','registrar',1,'2025-04-30 11:42:27','Registrar una Producto',NULL,NULL),(25,'producto','registrar',1,'2025-04-30 11:44:22','Registrar una Producto',NULL,NULL),(26,'producto','registrar',1,'2025-04-30 11:48:32','Registrar una Producto',NULL,NULL),(27,'producto','registrar',1,'2025-04-30 11:49:20','Registrar una Producto',NULL,NULL),(28,'producto','registrar',1,'2025-04-30 11:51:16','Registrar una Producto',NULL,NULL),(29,'producto','registrar',1,'2025-04-30 11:57:29','Registrar una Producto',NULL,NULL),(30,'producto','registrar',1,'2025-04-30 12:05:11','Registrar una Producto',NULL,NULL),(31,'producto','Actualizar',1,'2025-04-30 13:43:04','Actualizar un Producto con el id: 1',NULL,NULL),(32,'producto','registrar',1,'2025-04-30 13:46:44','Registrar una Producto',NULL,NULL),(33,'producto','Actualizar',1,'2025-04-30 13:49:31','Actualizar un Producto con el id: 2',NULL,NULL),(34,'producto','Actualizar',1,'2025-04-30 13:51:40','Actualizar un Producto con el id: 2',NULL,NULL),(35,'producto','registrar',1,'2025-04-30 15:00:31','Registrar una Producto',NULL,NULL),(36,'producto','Actualizar',1,'2025-04-30 15:01:05','Actualizar un Producto con el id: 3',NULL,NULL),(37,'proveedor','registrar',1,'2025-04-30 16:33:47','Registrar un Proveedor',NULL,NULL),(38,'proveedor','Actualizar',1,'2025-04-30 16:34:53','Actualizar un Proveedor con el id: 1',NULL,NULL),(39,'medidas','Eliminar',1,'2025-04-30 16:43:48','Eliminar una Medidas con el id: 10',NULL,NULL),(40,'medidas','Eliminar',1,'2025-04-30 16:52:31','Eliminar una Medidas con el id: 11',NULL,NULL),(41,'categorias','Eliminar',1,'2025-04-30 16:52:55','Eliminar una categoria con el id: 6',NULL,NULL),(42,'proveedor','Actualizar',1,'2025-04-30 17:04:03','Actualizar un Proveedor con el id: 1',NULL,NULL),(43,'proveedor','Eliminar',1,'2025-04-30 17:09:54','Eliminar un Proveedor con el id: 1',NULL,NULL),(44,'cliente','registrar',1,'2025-04-30 18:35:50','Registrar un Cliente',NULL,NULL),(45,'cliente','Actualizar',1,'2025-04-30 18:43:34','Actualizar un Cliente con el id: 1',NULL,NULL),(46,'cliente','Eliminar',1,'2025-04-30 19:08:07','Eliminar un Cliente con el id: 1',NULL,NULL),(47,'cliente','registrar',1,'2025-04-30 19:54:01','Registrar un Cliente',NULL,NULL),(48,'producto','Actualizar',1,'2025-05-03 10:23:23','Actualizar un Producto con el id: 1',NULL,NULL),(49,'producto','registrar',1,'2025-05-05 16:20:59','Registrar una Producto',NULL,NULL),(50,'producto','registrar',1,'2025-05-05 16:21:22','Registrar una Producto',NULL,NULL),(51,'producto','Actualizar',1,'2025-05-06 14:07:13','Actualizar un Producto con el id: 4',NULL,NULL),(52,'medidas','registrar',1,'2025-05-09 08:51:36','Registrar una Medidas',NULL,NULL),(53,'medidas','Actualizar',1,'2025-05-09 08:52:07','Actualizar una Medidas con el id: 12',NULL,NULL),(54,'categorias','registrar',1,'2025-05-09 09:23:13','Registrar una Categoria',NULL,NULL),(55,'categorias','Actualizar',1,'2025-05-09 09:30:45','Actualizar una Categoria con el id: 7',NULL,NULL),(56,'categorias','registrar',1,'2025-05-09 09:30:53','Registrar una Categoria',NULL,NULL),(57,'categorias','Actualizar',1,'2025-05-09 09:31:02','Actualizar una Categoria con el id: 8',NULL,NULL),(58,'cliente','registrar',1,'2025-05-09 10:58:07','Registrar un Cliente',NULL,NULL),(59,'cliente','Actualizar',1,'2025-05-09 10:59:39','Actualizar un Cliente con el id: 3',NULL,NULL),(60,'proveedor','registrar',1,'2025-05-09 11:04:38','Registrar un Proveedor',NULL,NULL),(61,'proveedor','Actualizar',1,'2025-05-09 11:05:19','Actualizar un Proveedor con el id: 2',NULL,NULL),(62,'compras/det_compra/producto/kardex/Movimiento en caja/gasto','INSERT/UPDATE',1,'2025-05-15 14:51:40','Compra registrada completa con ID: 18',18,'Compra'),(63,'compras/det_compra/producto/kardex/Movimiento en caja/gasto/compras a credito','INSERT/UPDATE',1,'2025-05-15 15:10:06','Compra registrada completa con ID: 1',1,'Compra'),(64,'compras/det_compra/producto/kardex/Movimiento en caja/gasto/compras a credito','INSERT/UPDATE',1,'2025-05-15 15:10:08','Compra registrada completa con ID: 1',1,'Compra'),(65,'compras/det_compra/producto/kardex/Movimiento en caja/gasto/compras a credito','INSERT/UPDATE',1,'2025-05-15 15:10:09','Compra registrada completa con ID: 1',1,'Compra'),(66,'compras/det_compra/producto/kardex/Movimiento en caja/gasto/compras a credito','INSERT/UPDATE',1,'2025-05-15 15:10:09','Compra registrada completa con ID: 1',1,'Compra'),(67,'compras/det_compra/producto/kardex/Movimiento en caja/gasto/compras a credito','INSERT/UPDATE',1,'2025-05-15 15:10:10','Compra registrada completa con ID: 1',1,'Compra'),(68,'compras/det_compra/producto/kardex/Movimiento en caja/gasto/compras a credito','INSERT/UPDATE',1,'2025-05-15 15:10:10','Compra registrada completa con ID: 1',1,'Compra'),(69,'compras/det_compra/producto/kardex/Movimiento en caja/gasto','INSERT/UPDATE',1,'2025-05-15 15:11:51','Compra registrada completa con ID: 21',21,'Compra'),(70,'compras/det_compra/producto/kardex/Movimiento en caja/gasto','INSERT/UPDATE',1,'2025-05-15 15:13:18','Compra registrada completa con ID: 23',23,'Compra'),(71,'compras/det_compra/producto/kardex/Movimiento en caja/gasto/compra a credito','INSERT/UPDATE',1,'2025-05-15 15:14:25','Compra registrada completa con ID: 24',24,'Compra'),(72,'compras/det_compra/producto/kardex/Movimiento en caja/gasto/compra a credito','INSERT/UPDATE',1,'2025-05-15 15:58:50','Compra registrada completa con ID: 25',25,'Compra'),(73,'compras/det_compra/producto/kardex/Movimiento en caja/gasto','INSERT/UPDATE',1,'2025-05-15 16:51:55','Compra registrada completa con ID: 26',26,'Compra'),(74,'compras/det_compra/producto/kardex/Movimiento en caja/gasto','INSERT/UPDATE',1,'2025-05-16 13:31:31','Compra registrada completa con ID: 28',28,'Compra'),(75,'compras/det_compra/producto/kardex/Movimiento en caja/gasto','INSERT/UPDATE',1,'2025-05-16 17:43:02','Compra registrada completa con ID: 29',29,'Compra'),(76,'compras/det_compra/producto/kardex/Movimiento en caja/gasto','INSERT/UPDATE',1,'2025-05-16 18:17:24','Compra registrada completa con ID: 30',30,'Compra'),(77,'compras/det_compra/producto/kardex/Movimiento en caja/gasto','INSERT/UPDATE',1,'2025-05-16 18:44:15','Compra registrada completa con ID: 31',31,'Compra'),(78,'compras/det_compra/producto/kardex/Movimiento en caja/gasto/compra a credito','INSERT/UPDATE',1,'2025-05-16 18:48:01','Compra registrada completa con ID: 32',32,'Compra'),(79,'compras/det_compra/producto/kardex/Movimiento en caja/gasto/compra a credito','INSERT/UPDATE',1,'2025-05-16 18:52:49','Compra registrada completa con ID: 33',33,'Compra'),(80,'medidas','Registrar',1,'2025-05-24 14:03:13','Registrar una Medidas',NULL,NULL),(81,'medidas','Actualizar',1,'2025-05-24 14:03:36','Actualizar una Medidas con el id: 13',NULL,NULL),(82,'medidas','Eliminar',1,'2025-05-24 14:34:20','Eliminar una Medidas con el id: 13',NULL,NULL),(83,'medidas','Eliminar',1,'2025-05-24 14:35:00','Eliminar una Medidas con el id: 12',NULL,NULL),(84,'medidas','Eliminar',1,'2025-05-24 15:09:15','Eliminar una Medidas con el id: 10',NULL,NULL),(85,'medidas','Actualizar',1,'2025-05-24 17:08:01','Actualizar una Medidas con el id: 9',NULL,NULL),(86,'medidas','Actualizar',1,'2025-05-24 17:10:55','Actualizar una Medidas con el id: 9',NULL,NULL),(87,'medidas','Registrar',1,'2025-05-24 17:11:07','Registrar una Medidas',NULL,NULL),(88,'medidas','Actualizar',1,'2025-05-24 17:11:20','Actualizar una Medidas con el id: 14',NULL,NULL),(89,'medidas','Actualizar',1,'2025-05-24 17:48:57','Actualizar una Medidas con el id: 1',NULL,NULL),(90,'medidas','Registrar',1,'2025-05-24 17:51:57','Registrar una Medidas',NULL,NULL),(91,'medidas','Actualizar',1,'2025-05-24 17:52:19','Actualizar una Medidas con el id: 15',NULL,NULL),(92,'medidas','Eliminar',1,'2025-05-24 17:53:11','Eliminar una Medidas con el id: 13',NULL,NULL),(93,'cliente','Actualizar',1,'2025-05-24 20:36:07','Registrar un Cliente con el id: 7',7,'Cliente'),(94,'cliente','Actualizar',1,'2025-05-24 20:36:44','Actualizar un Cliente con el id: 7',7,'Cliente'),(95,'cliente','Eliminar',1,'2025-05-24 20:37:02','Eliminar un Cliente con el id: 7',7,'Cliente'),(96,'proveedor','Actualizar',1,'2025-05-24 21:41:11','Registrar un Proveedor con el id: 3',3,'Proveedor'),(97,'proveedor','Actualizar',1,'2025-05-24 21:46:44','Registrar un Proveedor con el id: 4',4,'Proveedor'),(98,'proveedor','Actualizar',1,'2025-05-24 21:49:09','Actualizar un Proveedor con el id: 3',3,'Proveedor'),(99,'proveedor','Actualizar',1,'2025-05-24 21:51:16','Actualizar un Proveedor con el id: 3',3,'Proveedor'),(100,'proveedor','Actualizar',1,'2025-05-24 21:51:37','Actualizar un Proveedor con el id: 4',4,'Proveedor'),(101,'proveedor','Actualizar',1,'2025-05-24 21:54:12','Registrar un Proveedor con el id: 5',5,'Proveedor'),(102,'proveedor','Actualizar',1,'2025-05-24 21:54:31','Actualizar un Proveedor con el id: 5',5,'Proveedor'),(103,'proveedor','Eliminar',1,'2025-05-24 21:54:48','Eliminar un Proveedor con el ID: 5',5,'Proveedor'),(105,'producto / lote_producto / kardex','INSERT',1,'2025-05-25 17:42:46','Registro de producto nuevo. Código: 05151515151, Descripción: sdsssssdd',11,'PRODUCTO'),(106,'producto / lote_producto / kardex','REGISTRO_INGRESO',1,'2025-05-25 20:13:23','Ingreso de producto ID: 9, código: 7501033210778, tipo ingreso: COMPRA, cantidad: 5',9,'INVENTARIO'),(107,'producto / lote_producto / kardex','REGISTRO_INGRESO',1,'2025-05-25 20:13:49','Ingreso de producto ID: 7, código: 525452312, tipo ingreso: COMPRA, cantidad: 5',7,'INVENTARIO'),(108,'producto / lote_producto / kardex','REGISTRO_INGRESO',1,'2025-05-26 17:31:53','Ingreso de producto ID: 9, código: 7501033210778, tipo ingreso: COMPRA, cantidad: 1',9,'INVENTARIO'),(109,'producto / lote_producto / kardex','REGISTRO_INGRESO',1,'2025-05-26 17:32:08','Ingreso de producto ID: 9, código: 7501033210778, tipo ingreso: PROMOCION, cantidad: 1',9,'INVENTARIO'),(110,'producto / lote_producto / kardex','REGISTRO_INGRESO',1,'2025-05-26 22:08:57','Ingreso de producto ID: 7, código: 525452312, tipo ingreso: COMPRA, cantidad: 1',7,'INVENTARIO'),(111,'producto / lote_producto / kardex','REGISTRO_INGRESO',1,'2025-05-26 22:09:08','Ingreso de producto ID: 9, código: 7501033210778, tipo ingreso: COMPRA, cantidad: 1',9,'INVENTARIO'),(112,'producto / lote_producto / kardex','REGISTRO_INGRESO',1,'2025-05-27 09:36:51','Ingreso de producto ID: 4, código: 00004, tipo ingreso: COMPRA, cantidad: 1',4,'INVENTARIO'),(113,'producto / lote_producto / kardex','REGISTRO_INGRESO',1,'2025-05-27 09:39:48','Ingreso de producto ID: 4, código: 00004, tipo ingreso: COMPRA, cantidad: 3',4,'INVENTARIO'),(114,'producto / lote_producto / kardex','REGISTRO_INGRESO',1,'2025-05-27 09:40:06','Ingreso de producto ID: 4, código: 00004, tipo ingreso: COMPRA, cantidad: 1',4,'INVENTARIO'),(115,'producto / lote_producto / kardex','Ajuste de stock - DEVOLUCION',1,'2025-05-27 10:24:25','Ajuste realizado al producto ID 4 con cantidad 4. Observación: debolucion. Fecha vencimiento: 2025-05-27. Nuevo stock: 24',4,'INVENTARIO'),(116,'producto / lote_producto / kardex','INSERT',1,'2025-05-27 11:25:32','Registro de producto nuevo. Código: 0000089, Descripción: Producod',12,'PRODUCTO'),(117,'producto / lote_producto / kardex','REGISTRO_INGRESO',1,'2025-05-27 11:27:40','Ingreso de producto ID: 12, código: 0000089, tipo ingreso: COMPRA, cantidad: 2',12,'INVENTARIO'),(118,'producto / lote_producto / kardex','REGISTRO_INGRESO',1,'2025-05-27 11:28:00','Ingreso de producto ID: 12, código: 0000089, tipo ingreso: PROMOCION, cantidad: 2',12,'INVENTARIO'),(119,'producto / lote_producto / kardex','Ajuste de stock - PERDIDA',1,'2025-05-27 11:37:44','Ajuste realizado al producto ID 12 con cantidad 10. Observación: fsffffffffd. Nuevo stock: 4',12,'INVENTARIO'),(120,'producto / lote_producto / kardex','Ajuste de stock - DEVOLUCION',1,'2025-05-27 11:42:22','Ajuste realizado al producto ID 9 con cantidad 10. Observación: ffdfdffdfdfffdfd. Nuevo stock: 11',9,'INVENTARIO'),(121,'producto / lote_producto / kardex','Ajuste de stock - PERDIDA',1,'2025-05-27 11:42:52','Ajuste realizado al producto ID 9 con cantidad 5. Observación: hhhjhjhj. Nuevo stock: 6',9,'INVENTARIO'),(122,'producto / lote_producto / kardex','Ajuste de stock - DEVOLUCION',1,'2025-05-27 11:46:36','Ajuste realizado al producto ID 9 con cantidad 2. Observación: dddd. Nuevo stock: 4',9,'INVENTARIO'),(123,'producto / lote_producto / kardex','Ajuste de stock - PERDIDA',1,'2025-05-27 11:47:02','Ajuste realizado al producto ID 12 con cantidad 1. Observación: eee. Nuevo stock: 3',12,'INVENTARIO'),(124,'producto / lote_producto / kardex','Ajuste de stock - DEVOLUCION',1,'2025-05-27 11:47:27','Ajuste realizado al producto ID 9 con cantidad 3. Observación: dddd. Nuevo stock: 1',9,'INVENTARIO'),(125,'producto / lote_producto / kardex','INSERT',1,'2025-05-27 12:19:52','Registro de producto nuevo. Código: 051516461002, Descripción: gfrrrrfrfrrfrf',13,'PRODUCTO'),(126,'producto / lote_producto / kardex','INSERT',1,'2025-05-27 12:26:47','Registro de producto nuevo. Código: 0100444, Descripción: 4404404',14,'PRODUCTO'),(127,'producto','UPDATE',1,'2025-05-27 12:27:13','Actualización del producto. ID: 9, Descripción: SPEED STICK',9,'PRODUCTO'),(128,'proveedor','Actualizar',1,'2025-05-30 18:27:49','Registrar un Proveedor con el id: 6',6,'Proveedor'),(129,'proveedor','Actualizar',1,'2025-05-30 18:33:55','Registrar un Proveedor con el id: 7',7,'Proveedor'),(130,'compras/det_compra/producto/kardex/Movimiento en caja/gasto','INSERT/UPDATE',1,'2025-05-30 22:46:10','Compra registrada completa con ID: 34',34,'Compra'),(131,'compras/det_compra/producto/kardex/Movimiento en caja/gasto/compra a credito','INSERT/UPDATE',1,'2025-05-30 23:18:35','Compra registrada completa con ID: 35',35,'Compra'),(132,'cliente','Actualizar',1,'2025-05-31 20:00:55','Registrar un Cliente con el id: 8',8,'Cliente'),(133,'producto / lote_producto / kardex','INSERT',1,'2025-06-07 23:00:16','Registro de producto nuevo. Código: 211662626, Descripción: ffdffddffddfffff',15,'PRODUCTO'),(134,'producto / lote_producto / kardex','INSERT',1,'2025-06-07 23:01:55','Registro de producto nuevo. Código: 00000888, Descripción: pruenabbsbssasa',16,'PRODUCTO'),(135,'medidas','Registrar',1,'2025-06-08 17:13:29','Registrar una Medidas',NULL,NULL),(136,'medidas','Actualizar',1,'2025-06-08 17:13:47','Actualizar una Medidas con el id: 16',NULL,NULL),(137,'medidas','Actualizar',1,'2025-06-08 17:14:03','Actualizar una Medidas con el id: 16',NULL,NULL),(138,'medidas','Registrar',1,'2025-06-08 17:16:46','Registrar una Medidas',NULL,NULL),(139,'medidas','Registrar',1,'2025-06-08 17:18:05','Registrar una Medidas',NULL,NULL),(140,'medidas','Registrar',1,'2025-06-08 17:53:37','Registrar una Medidas',NULL,NULL),(141,'medidas','Registrar',1,'2025-06-08 18:14:13','Registrar una Medidas',NULL,NULL),(142,'medidas','Registrar',1,'2025-06-08 18:34:15','Registrar una Medidas',NULL,NULL),(143,'producto / lote_producto / kardex','INSERT',1,'2025-06-08 21:15:43','Registro de producto nuevo. Código: 02502555, Descripción: Dell 14 ispiro',17,'PRODUCTO'),(144,'producto','UPDATE',1,'2025-06-08 21:27:34','Actualización del producto. ID: 17, Descripción: Dell 14 ispiro',17,'PRODUCTO'),(145,'producto / lote_producto / kardex','INSERT',1,'2025-06-08 23:24:17','Registro de producto nuevo. Código: 0599999, Descripción: modelo 13 dd',18,'PRODUCTO'),(146,'producto','UPDATE',1,'2025-06-08 23:25:22','Actualización del producto. ID: 18, Descripción: modelo 13 dd',18,'PRODUCTO'),(147,'producto','UPDATE',1,'2025-06-08 23:25:40','Actualización del producto. ID: 18, Descripción: modelo 13 dd',18,'PRODUCTO'),(148,'producto / lote_producto / kardex','INSERT',1,'2025-06-09 16:54:29','Registro de producto nuevo. Código: 054844558844, Descripción: Canande fuente de vida',19,'PRODUCTO'),(149,'producto','UPDATE',1,'2025-06-09 16:55:02','Actualización del producto. ID: 19, Descripción: Canande fuente de vida',19,'PRODUCTO'),(150,'producto','UPDATE',1,'2025-06-09 16:55:19','Actualización del producto. ID: 19, Descripción: Canande fuente de vida',19,'PRODUCTO'),(151,'producto','UPDATE',1,'2025-06-09 16:57:19','Actualización del producto. ID: 19, Descripción: Canande fuente de vida',19,'PRODUCTO'),(152,'producto','UPDATE',1,'2025-06-09 16:58:33','Actualización del producto. ID: 19, Descripción: Canande fuente de vida',19,'PRODUCTO'),(153,'producto','UPDATE',1,'2025-06-09 16:59:03','Actualización del producto. ID: 19, Descripción: Canande fuente de vida',19,'PRODUCTO'),(154,'producto / lote_producto / kardex','INSERT',1,'2025-06-09 17:14:25','Registro de producto nuevo. Código: 00331316114, Descripción: aMSLMSLSLAMSALALS',20,'PRODUCTO'),(155,'producto','UPDATE',1,'2025-06-09 17:14:45','Actualización del producto. ID: 20, Descripción: aMSLMSLSLAMSALALS',20,'PRODUCTO'),(156,'producto','UPDATE',1,'2025-06-09 17:15:01','Actualización del producto. ID: 20, Descripción: aMSLMSLSLAMSALALS',20,'PRODUCTO'),(157,'producto','UPDATE',1,'2025-06-11 16:47:24','Actualización del producto. ID: 1, Descripción: Dell 14p',1,'PRODUCTO'),(158,'producto / lote_producto / kardex','INSERT',1,'2025-06-13 16:08:54','Registro de producto nuevo. Código: 264646, Descripción: dcckscdkcdmdcmdkds',21,'PRODUCTO'),(159,'producto / lote_producto / kardex','INSERT',1,'2025-06-13 18:09:32','Registro de producto nuevo. Código: 012115, Descripción: dsssfdssdfsdfsdfssfsfd',22,'PRODUCTO'),(160,'producto / lote_producto / kardex','INSERT',1,'2025-06-13 18:15:16','Registro de producto nuevo. Código: 031512, Descripción: wedewewew',23,'PRODUCTO'),(161,'producto','UPDATE',1,'2025-06-13 18:47:06','Actualización del producto. ID: 23, Descripción: 1113',23,'PRODUCTO'),(162,'producto','UPDATE',1,'2025-06-13 19:58:43','Actualización del producto. ID: 21, Descripción: dcckscdkcdmdcmdkds',21,'PRODUCTO'),(163,'producto','UPDATE',1,'2025-06-13 20:52:28','Actualización del producto. ID: 23, Descripción: 1113',23,'PRODUCTO'),(164,'producto','UPDATE',1,'2025-06-13 20:52:45','Actualización del producto. ID: 22, Descripción: dsssfdssdfsdfsdfssfsfd',22,'PRODUCTO'),(165,'producto','UPDATE',1,'2025-06-13 20:52:56','Actualización del producto. ID: 23, Descripción: 1113',23,'PRODUCTO'),(166,'producto / lote_producto / kardex','REGISTRO_INGRESO',1,'2025-06-13 20:54:41','Ingreso de producto ID: 22, código: 012115, tipo ingreso: COMPRA, cantidad: 10',22,'INVENTARIO'),(167,'producto / lote_producto / kardex','REGISTRO_INGRESO',1,'2025-06-13 20:55:15','Ingreso de producto ID: 23, código: 031512, tipo ingreso: COMPRA, cantidad: 4',23,'INVENTARIO'),(168,'producto','UPDATE',1,'2025-06-13 22:23:35','Actualización del producto. ID: 21, Descripción: dcckscdkcdmdcmdkds',21,'PRODUCTO'),(169,'medidas','Registrar',1,'2025-06-14 09:58:56','Registrar una Medidas',NULL,NULL),(170,'medidas','Registrar',1,'2025-06-14 10:12:12','Registrar una Medidas',NULL,NULL),(171,'producto','UPDATE',1,'2025-06-14 10:41:44','Actualización del producto. ID: 23, Descripción: 1113',23,'PRODUCTO'),(172,'producto','UPDATE',1,'2025-06-14 10:44:07','Actualización del producto. ID: 22, Descripción: dsssfdssdfsdfsdfssfsfd',22,'PRODUCTO'),(173,'medidas','Registrar',1,'2025-06-14 18:42:19','Registrar una Medidas',NULL,NULL),(174,'producto / lote_producto / kardex','INSERT',1,'2025-06-14 18:46:23','Registro de producto nuevo. Código: 0032655655, Descripción: Glyphosate Isopropylamine salt (480 g/l)',24,'PRODUCTO'),(175,'producto / lote_producto / kardex','INSERT',1,'2025-06-14 18:47:40','Registro de producto nuevo. Código: 00321, Descripción: SDDSDSDSDSD',25,'PRODUCTO'),(176,'medidas','Registrar',1,'2025-06-15 08:37:01','Registrar una Medidas',NULL,NULL),(177,'producto / lote_producto / kardex','INSERT',1,'2025-06-15 08:38:15','Registro de producto nuevo. Código: 34464646, Descripción: bbjugugugugugugugu',26,'PRODUCTO'),(178,'producto / lote_producto / kardex','REGISTRO_INGRESO',1,'2025-06-16 18:19:32','Ingreso de producto ID: 26, código: 34464646, tipo ingreso: COMPRA, cantidad: 5',26,'INVENTARIO'),(179,'cliente','Actualizar',1,'2025-06-16 18:20:27','Registrar un Cliente con el id: 9',9,'Cliente'),(180,'medidas','Registrar',1,'2025-07-13 14:10:35','Registrar una Medidas',NULL,NULL),(181,'medidas','Registrar',1,'2025-07-13 14:15:38','Registrar una Medidas',NULL,NULL),(182,'medidas','Registrar',1,'2025-07-13 14:26:36','Registrar una Medidas',NULL,NULL),(183,'producto / lote_producto / kardex','INSERT',1,'2025-07-13 14:31:26','Registro de producto nuevo. Código: 00001, Descripción: BATHUTIC - 1L',27,'PRODUCTO'),(184,'producto / lote_producto / kardex','INSERT',1,'2025-07-13 14:50:21','Registro de producto nuevo. Código: 00002, Descripción: Solfoxidante fungicida - Acaricida',28,'PRODUCTO'),(185,'producto / lote_producto / kardex','INSERT',1,'2025-07-13 15:06:02','Registro de producto nuevo. Código: 00009, Descripción: SPARKO - 100 G',29,'PRODUCTO'),(186,'producto / lote_producto / kardex','INSERT',1,'2025-07-13 15:08:23','Registro de producto nuevo. Código: 09088, Descripción: aFEPASA',30,'PRODUCTO'),(187,'producto / lote_producto / kardex','INSERT',1,'2025-07-13 15:13:46','Registro de producto nuevo. Código: 000010, Descripción: Adame',31,'PRODUCTO'),(188,'producto','UPDATE',1,'2025-07-13 15:20:12','Actualización del producto. ID: 31, Descripción: Adame 1',31,'PRODUCTO'),(189,'producto','UPDATE',1,'2025-07-13 15:20:48','Actualización del producto. ID: 30, Descripción: Afepasa',30,'PRODUCTO'),(190,'producto / lote_producto / kardex','REGISTRO_INGRESO',1,'2025-07-13 15:23:46','Ingreso de producto ID: 30, código: 09088, tipo ingreso: COMPRA, cantidad: 10',30,'INVENTARIO'),(191,'producto / lote_producto / kardex','REGISTRO_INGRESO',1,'2025-07-13 15:25:41','Ingreso de producto ID: 30, código: 09088, tipo ingreso: PROMOCION, cantidad: 2',30,'INVENTARIO'),(192,'producto / lote_producto / kardex','REGISTRO_INGRESO',1,'2025-07-13 15:58:45','Ingreso de producto ID: 30, código: 09088, tipo ingreso: PROMOCION, cantidad: 3',30,'INVENTARIO'),(193,'producto / lote_producto / kardex','Ajuste de stock - DEVOLUCION',1,'2025-07-13 16:03:08','Ajuste realizado al producto ID 30 con cantidad 3. Observación: debolu. Fecha vencimiento: 2025-10-25. Nuevo stock: 28',30,'INVENTARIO'),(194,'producto / lote_producto / kardex','Ajuste de stock - PERDIDA',1,'2025-07-13 16:05:46','Ajuste realizado al producto ID 30 con cantidad 7. Observación: por perdida. Nuevo stock: 21',30,'INVENTARIO'),(195,'proveedor','Actualizar',1,'2025-07-13 16:17:27','Registrar un Proveedor con el id: 8',8,'Proveedor'),(196,'proveedor','Actualizar',1,'2025-07-13 16:17:41','Actualizar un Proveedor con el id: 8',8,'Proveedor'),(197,'proveedor','Actualizar',1,'2025-07-13 16:18:03','Actualizar un Proveedor con el id: 8',8,'Proveedor'),(198,'cliente','Actualizar',1,'2025-07-13 16:19:27','Registrar un Cliente con el id: 10',10,'Cliente'),(199,'cliente','Actualizar',1,'2025-07-13 16:20:00','Actualizar un Cliente con el id: 10',10,'Cliente'),(200,'compras/det_compra/producto/kardex/Movimiento en caja/gasto','INSERT/UPDATE',1,'2025-07-13 20:57:14','Compra registrada completa con ID: 36',36,'Compra'),(201,'compras/det_compra/producto/kardex/Movimiento en caja/gasto/compra a credito','INSERT/UPDATE',1,'2025-07-13 21:08:50','Compra registrada completa con ID: 37',37,'Compra'),(202,'compras/det_compra/producto/kardex/Movimiento en caja/gasto/compra a credito','INSERT/UPDATE',1,'2025-07-13 21:21:36','Compra registrada completa con ID: 38',38,'Compra'),(203,'compras/det_compra/producto/kardex/Movimiento en caja/gasto/compra a credito','INSERT/UPDATE',1,'2025-07-14 14:44:11','Compra registrada completa con ID: 39',39,'Compra');
/*!40000 ALTER TABLE `log_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lote_producto`
--

DROP TABLE IF EXISTS `lote_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lote_producto` (
  `id_lote` int NOT NULL AUTO_INCREMENT,
  `id_usuario_creacion` int DEFAULT NULL,
  `id_det_compra` int DEFAULT NULL,
  `id_producto` int NOT NULL,
  `cantidad_comprada` int DEFAULT NULL,
  `cantidad_bonificada` int NOT NULL DEFAULT '0',
  `stock_disponible` int NOT NULL,
  `costo_unitario` decimal(10,2) NOT NULL,
  `precio_compra` decimal(10,2) GENERATED ALWAYS AS ((`costo_unitario` * `cantidad_comprada`)) STORED,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_vencimiento` date DEFAULT NULL,
  `estado` int DEFAULT '1',
  `id_usuario_actualizacion` int DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_lote`),
  KEY `id_producto` (`id_producto`),
  KEY `idx_vencimiento` (`fecha_vencimiento`),
  CONSTRAINT `lote_producto_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote_producto`
--

LOCK TABLES `lote_producto` WRITE;
/*!40000 ALTER TABLE `lote_producto` DISABLE KEYS */;
INSERT INTO `lote_producto` (`id_lote`, `id_usuario_creacion`, `id_det_compra`, `id_producto`, `cantidad_comprada`, `cantidad_bonificada`, `stock_disponible`, `costo_unitario`, `fecha_registro`, `fecha_vencimiento`, `estado`, `id_usuario_actualizacion`, `fecha_actualizacion`) VALUES (110,1,NULL,27,10,0,10,1.30,'2025-07-13 14:31:26','2025-10-26',1,NULL,NULL),(111,1,NULL,28,15,0,15,1.30,'2025-07-13 14:50:21','2026-01-31',1,NULL,NULL),(112,1,NULL,29,10,0,9,1.20,'2025-07-13 15:06:02','2026-03-07',1,NULL,'2025-07-15 07:19:38'),(113,1,NULL,30,16,0,9,1.50,'2025-07-13 15:08:23','2025-08-03',1,1,'2025-07-13 16:05:46'),(114,1,NULL,31,14,0,13,1.50,'2025-07-13 15:13:46','2025-11-30',1,NULL,'2025-07-15 07:19:38'),(115,1,NULL,30,10,0,10,1.50,'2025-07-13 15:23:46','2026-02-01',1,NULL,NULL),(116,1,NULL,30,0,2,2,1.50,'2025-07-13 15:25:41','2025-10-19',1,NULL,NULL),(117,1,NULL,30,0,3,0,0.00,'2025-07-13 15:58:45','2025-10-25',0,1,'2025-07-13 16:03:08'),(118,1,60,28,0,0,0,1.30,'2025-07-13 20:57:14','2025-11-29',2,NULL,'2025-07-13 21:01:20'),(119,1,61,27,0,0,0,1.30,'2025-07-13 20:57:14','2026-01-02',2,NULL,'2025-07-13 21:01:20'),(120,1,62,31,0,0,0,1.50,'2025-07-13 20:57:14','2025-11-02',2,NULL,'2025-07-13 21:01:20'),(121,1,63,29,1,0,0,1.20,'2025-07-13 21:08:50','2025-10-25',0,NULL,'2025-07-15 06:51:16'),(122,1,64,27,1,0,1,1.30,'2025-07-13 21:08:50','2025-10-26',1,NULL,'2025-07-13 21:08:50'),(123,1,65,30,1,0,1,1.50,'2025-07-13 21:08:50','2025-11-01',1,NULL,'2025-07-13 21:08:50'),(124,1,66,27,1,0,0,1.30,'2025-07-13 21:21:36','2025-07-26',0,NULL,'2025-07-15 07:19:38'),(125,1,67,27,1,0,0,1.30,'2025-07-14 14:44:11','2025-07-26',0,NULL,'2025-07-15 06:51:16'),(126,1,68,28,5,0,4,1.30,'2025-07-14 14:44:11','2025-09-21',1,NULL,'2025-07-15 07:19:38');
/*!40000 ALTER TABLE `lote_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `id_usuario_creacion` int DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_actualizacion` int DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `id_usuario_eliminacion` int DEFAULT NULL,
  `fecha_eliminacion` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Dell S',1,'2025-07-13 12:28:28',1,'2025-07-13 14:05:24',NULL,NULL,'1'),(2,'Figuesida',1,'2025-07-13 14:26:52',NULL,NULL,NULL,NULL,'1');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medidas`
--

DROP TABLE IF EXISTS `medidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medidas` (
  `id_medida` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nombre_corto` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fecha_eliminacion` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`id_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medidas`
--

LOCK TABLES `medidas` WRITE;
/*!40000 ALTER TABLE `medidas` DISABLE KEYS */;
INSERT INTO `medidas` VALUES (26,'UNIDAD','UND','2025-07-13 14:10:35',NULL,NULL,'1'),(27,'CAJA','CJ','2025-07-13 14:15:38',NULL,NULL,'1'),(28,'KILOGRAMO','KG','2025-07-13 14:26:36',NULL,NULL,'1');
/*!40000 ALTER TABLE `medidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulos`
--

DROP TABLE IF EXISTS `modulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `modulo` varchar(100) DEFAULT NULL,
  `padre_id` int DEFAULT NULL,
  `vista` varchar(100) DEFAULT NULL,
  `icon_menu` varchar(45) DEFAULT NULL,
  `orden` int DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos`
--

LOCK TABLES `modulos` WRITE;
/*!40000 ALTER TABLE `modulos` DISABLE KEYS */;
INSERT INTO `modulos` VALUES (1,'Tablero Principal',0,'dashboard.php','fas fa-tachometer-alt',0,NULL,NULL),(2,'Roles y Perfiles',0,'Administracion/ModulosyPerfiles/modulos_perfiles.php','fas fa-tablet-alt',1,NULL,NULL),(3,'Producto',4,'Gestion/Producto/productos.php','far fa-circle',7,'2023-01-06 12:48:37',NULL),(4,'Mantenedor',0,'','fas fa-tachometer-alt',2,'2023-01-06 13:02:08',NULL),(5,'Medidas',4,'Gestion/Medidas/medidas.php','far fa-circle',10,'2023-01-08 13:12:05',NULL),(6,'Categorias',4,'Gestion/Categorias/categorias.php','far fa-circle',9,'2023-01-09 12:34:34',NULL),(7,'Proveedor',4,'Gestion/Proveedor/proveedor.php','	far fa-circle',6,'2023-01-15 07:33:34',NULL),(8,'Clientes',4,'Gestion/Clientes/clientes.php','	far fa-circle',5,'2023-01-15 07:34:53',NULL),(9,'Perecederos',4,'Gestion/Perecederos/perecederos.php','	far fa-circle',8,'2023-01-15 07:35:46',NULL),(10,'prueva',0,'Gestion/Producto/productos.php','',11,'2023-01-15 07:38:28',NULL),(11,'Administrar Caja',0,'','fas fa-cash-register',12,'2023-01-15 09:43:53',NULL),(12,'ArqueoCaja',11,'AdministrarCaja/ArqueoCaja/arqueo_caja.php','	far fa-circle',14,'2023-01-15 09:54:10',NULL),(13,'Caja',11,'AdministrarCaja/Caja/caja.php','	far fa-circle',13,'2023-01-15 09:54:43',NULL),(14,'Rol',0,'Administracion/Rol/rol.php','fas fa-cash-register',16,'2023-01-15 11:33:00',NULL),(15,'Usuarios',0,'Administracion/Usuario/usuario.php','fas fa-users',17,'2023-01-15 14:07:39',NULL),(16,'VentasCreditos',0,'','fas fa-credit-card',28,'2023-01-16 12:44:30',NULL),(17,'AdministrarCreditos',16,'VentasCreditos/AdministrarCreditos/administrar_creditos.php','far fa-circle',30,'2023-01-16 12:46:05',NULL),(18,'Compras',0,'','fas fa-dolly',18,'2023-01-16 17:45:49',NULL),(19,'Ventas',0,'','fas fa-cart-plus',24,'2023-01-16 17:46:04',NULL),(20,'Realizar Compras',18,'Compras/RealizarCompras/compras.php','far fa-circle',20,'2023-01-16 17:47:23',NULL),(21,'Ventas',19,'Ventas/RealizarVentas/realizar_ventas.php','far fa-circle',27,'2023-01-16 17:49:11',NULL),(22,'HistorialAbonos',16,'VentasCreditos/HistorialAbonos/historial_abonos.php','far fa-circle',31,'2023-01-17 10:16:03',NULL),(23,'Empresa',0,'Administracion/Configuracion/empresa.php','fas fa-store-alt',32,'2023-01-18 11:18:48',NULL),(24,'Movimiento',11,'AdministrarCaja/MovimientoCaja/movimiento_cajas.php','far fa-circle',15,'2023-01-20 11:16:21',NULL),(25,'Administra Ventas',19,'Ventas/Administrar_ventas/administrar_ventas.php','far fa-circle',26,'2023-01-25 16:14:23',NULL),(26,'Compras al Credito',0,'','fas fa-credit-card',21,'2023-03-11 12:03:44',NULL),(27,'Administrar Creditos',26,'ComprasCredito/AdministrarCreditos/administrar_credito.php','far fa-circle',23,'2023-03-11 12:07:07',NULL),(28,'Administrar Creditos',16,'VentasCreditos/AdministrarCreditos/administrar_credito.php','far fa-circle',29,'2023-03-11 12:24:39',NULL),(29,'Historial Credito',26,'ComprasCredito/HistorialAbonos/historial_abono.php','far fa-circle',22,'2023-03-19 12:34:53',NULL),(30,'Administra Compras',18,'Compras/Administrar_compras/historial_de_compras.php','far fa-circle',19,'2023-03-23 17:36:57',NULL),(31,'kardex',0,'kardex/kardex_promedial_ponderado/kardex.php','fas fa-snowflake',33,'2023-03-29 11:15:26',NULL),(32,'Administrar Factura',19,'Ventas/Administrar_ventas/administrar_factura.php','far fa-circle',25,'2023-04-21 17:13:56',NULL),(33,'Reportes',0,'','fas fa-file',34,'2023-10-21 20:10:31',NULL),(34,'Producto Poco Stock',33,'Reportes/poco_stock.php','far fa-circle',37,'2023-10-21 20:12:44',NULL),(35,'Ganacias',33,'Reportes/ganacias.php','far fa-circle',38,'2023-10-21 20:13:31',NULL),(36,'Producto mas Vendidos',33,'Reportes/reporte_producto_mas_vendidos.php','far fa-circle',36,'2023-10-21 22:31:23',NULL),(37,'Ventas Hoy',33,'Reportes/ventas_hoy.php','far fa-circle',35,'2023-10-23 17:49:39',NULL),(38,'lote',4,'Gestion/Perecederos/lote_producto.php','far fa-circle',4,'2025-05-13 20:04:32',NULL),(39,'Marca',4,'Gestion/Marcas/marcas.php','far fa-circle',3,'2025-06-08 23:31:15',NULL),(40,'FacturacionElectronica',0,'FacturacionElectronica/facturacionElectronica.php','fas fa-file-invoice-dollar',39,'2025-07-16 06:03:27',NULL);
/*!40000 ALTER TABLE `modulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento_caja`
--

DROP TABLE IF EXISTS `movimiento_caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento_caja` (
  `id_movimiento_caja` int NOT NULL AUTO_INCREMENT,
  `id_arqueo` int NOT NULL,
  `tipo_movimiento` enum('Ingreso','Egreso','Devolucion','Préstamo','Ajuste') NOT NULL,
  `tipo_referencia` enum('Ingreso','Gasto','Préstamo','Devolucion') DEFAULT NULL,
  `id_usuario` int NOT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`id_movimiento_caja`),
  KEY `id_arqueo` (`id_arqueo`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `movimiento_caja_ibfk_1` FOREIGN KEY (`id_arqueo`) REFERENCES `arqueo_caja` (`id_arqueo_caja`),
  CONSTRAINT `movimiento_caja_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento_caja`
--

LOCK TABLES `movimiento_caja` WRITE;
/*!40000 ALTER TABLE `movimiento_caja` DISABLE KEYS */;
INSERT INTO `movimiento_caja` VALUES (16,7,'Ingreso','Ingreso',1,'2025-07-13 20:55:19',NULL,'1'),(17,7,'Egreso','Gasto',1,'2025-07-13 20:55:19',NULL,'1'),(18,7,'Devolucion','Devolucion',1,'2025-07-13 21:01:20',NULL,'1');
/*!40000 ALTER TABLE `movimiento_caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_compra_credito`
--

DROP TABLE IF EXISTS `movimientos_compra_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos_compra_credito` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `id_compra_credito` int DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `tipo_movimiento` varchar(20) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_movimiento` datetime DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `id_compra_credito` (`id_compra_credito`),
  CONSTRAINT `movimientos_compra_credito_ibfk_1` FOREIGN KEY (`id_compra_credito`) REFERENCES `compras_credito` (`id_compra_credito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_compra_credito`
--

LOCK TABLES `movimientos_compra_credito` WRITE;
/*!40000 ALTER TABLE `movimientos_compra_credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos_compra_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_credito`
--

DROP TABLE IF EXISTS `movimientos_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos_credito` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `id_venta_credito` int DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `tipo_movimiento` varchar(20) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_movimiento` datetime DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `id_venta_credito` (`id_venta_credito`),
  CONSTRAINT `movimientos_credito_ibfk_1` FOREIGN KEY (`id_venta_credito`) REFERENCES `ventas_credito` (`id_venta_credito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_credito`
--

LOCK TABLES `movimientos_credito` WRITE;
/*!40000 ALTER TABLE `movimientos_credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_modulo`
--

DROP TABLE IF EXISTS `perfil_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil_modulo` (
  `idperfil_modulo` int NOT NULL AUTO_INCREMENT,
  `id_perfil` int DEFAULT NULL,
  `id_modulo` int DEFAULT NULL,
  `vista_inicio` tinyint DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`idperfil_modulo`)
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_modulo`
--

LOCK TABLES `perfil_modulo` WRITE;
/*!40000 ALTER TABLE `perfil_modulo` DISABLE KEYS */;
INSERT INTO `perfil_modulo` VALUES (299,1,1,1,'1'),(300,1,2,0,'1'),(301,1,38,0,'1'),(302,1,4,0,'1'),(303,1,8,0,'1'),(304,1,7,0,'1'),(305,1,3,0,'1'),(306,1,6,0,'1'),(307,1,5,0,'1'),(308,1,15,0,'1'),(309,1,30,0,'1'),(310,1,18,0,'1'),(311,1,20,0,'1'),(312,1,29,0,'1'),(313,1,26,0,'1'),(314,1,27,0,'1'),(315,1,25,0,'1'),(316,1,19,0,'1'),(317,1,21,0,'1'),(318,1,28,0,'1'),(319,1,16,0,'1'),(320,1,22,0,'1'),(321,1,23,0,'1'),(322,1,31,0,'1'),(323,1,37,0,'1'),(324,1,33,0,'1'),(325,1,36,0,'1'),(326,1,34,0,'1'),(327,1,35,0,'1'),(328,1,39,0,'1'),(329,2,1,1,'1'),(330,2,2,0,'1'),(331,2,39,0,'1'),(332,2,4,0,'1'),(333,2,38,0,'1'),(334,2,8,0,'1'),(335,2,7,0,'1'),(336,2,3,0,'1'),(337,2,9,0,'1'),(338,2,6,0,'1'),(339,2,5,0,'1'),(340,2,13,0,'1'),(341,2,11,0,'1'),(342,2,12,0,'1'),(343,2,24,0,'1'),(344,2,14,0,'1'),(345,2,15,0,'1'),(346,2,30,0,'1'),(347,2,18,0,'1'),(348,2,20,0,'1'),(349,2,29,0,'1'),(350,2,26,0,'1'),(351,2,27,0,'1'),(352,2,32,0,'1'),(353,2,19,0,'1'),(354,2,25,0,'1'),(355,2,21,0,'1'),(356,2,28,0,'1'),(357,2,16,0,'1'),(358,2,17,0,'1'),(359,2,22,0,'1'),(360,2,23,0,'1'),(361,2,31,0,'1'),(362,2,37,0,'1'),(363,2,33,0,'1'),(364,2,36,0,'1'),(365,2,34,0,'1'),(366,2,35,0,'1'),(367,2,40,0,'1');
/*!40000 ALTER TABLE `perfil_modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfiles` (
  `id_perfil` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fecha_eliminacion` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` VALUES (1,'administrador','2025-04-28 16:45:27',NULL,NULL,'1'),(2,'Programador','2025-04-28 16:45:27',NULL,NULL,'1'),(3,'Vendedor','2025-04-28 16:45:27',NULL,NULL,'1');
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `porcentaje_iva`
--

DROP TABLE IF EXISTS `porcentaje_iva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `porcentaje_iva` (
  `codigo` int NOT NULL,
  `porcentaje` decimal(5,2) NOT NULL,
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `porcentaje_iva`
--

LOCK TABLES `porcentaje_iva` WRITE;
/*!40000 ALTER TABLE `porcentaje_iva` DISABLE KEYS */;
INSERT INTO `porcentaje_iva` VALUES (0,0.00),(2,12.00),(3,14.00),(4,15.00),(5,5.00);
/*!40000 ALTER TABLE `porcentaje_iva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `codigo_barra` varchar(13) DEFAULT NULL,
  `id_categoria_producto` int DEFAULT NULL,
  `id_marca` int DEFAULT NULL,
  `id_unidades` int DEFAULT NULL,
  `descripcion_producto` varchar(50) DEFAULT NULL,
  `img_producto` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `precio_compra_producto` decimal(10,2) DEFAULT NULL,
  `precio_venta_producto` decimal(10,2) DEFAULT NULL,
  `precio_1_producto` decimal(10,2) DEFAULT NULL,
  `precio_2_producto` decimal(10,2) DEFAULT NULL,
  `precio_fraccion` decimal(10,2) DEFAULT NULL,
  `precio_fraccion_1` decimal(10,2) DEFAULT NULL,
  `precio_fraccion_2` decimal(10,2) DEFAULT NULL,
  `lleva_iva_producto` char(1) DEFAULT NULL,
  `costo_total_producto` decimal(10,2) DEFAULT NULL,
  `stock_producto` float DEFAULT NULL,
  `unidades` float DEFAULT NULL,
  `stock_fraccion` decimal(10,2) DEFAULT NULL,
  `minimo_stock_producto` float DEFAULT NULL,
  `inventariable_producto` char(1) DEFAULT NULL,
  `perecedero_producto` char(1) DEFAULT NULL,
  `ventas_producto` decimal(10,2) DEFAULT NULL,
  `compra_producto` decimal(10,2) DEFAULT NULL,
  `utilidad` decimal(10,2) DEFAULT NULL,
  `ventas_fracion_producto` char(1) DEFAULT NULL,
  `id_usuario_creacion` int DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_actualizacion` int DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `id_usuario_eliminacion` int DEFAULT NULL,
  `fecha_eliminacion` datetime DEFAULT NULL,
  `producto_venta_cantida` decimal(10,2) DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`id_producto`),
  KEY `fk_producto_id_categoria_producto` (`id_categoria_producto`),
  KEY `fk_producto_id_unidades` (`id_unidades`),
  CONSTRAINT `fk_producto_id_categoria_producto` FOREIGN KEY (`id_categoria_producto`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `fk_producto_id_unidades` FOREIGN KEY (`id_unidades`) REFERENCES `medidas` (`id_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (27,'00001',30,2,26,'BATHUTIC - 1L','Views/assets/imagenes/productos/logo_6874098e432bd.jpg',1.30,1.60,1.40,1.55,NULL,NULL,NULL,'1',NULL,12,NULL,NULL,3,NULL,'1',NULL,NULL,NULL,NULL,1,'2025-07-13 14:31:26',NULL,'2025-07-15 07:19:38',NULL,NULL,NULL,'1'),(28,'00002',32,2,26,'Solfoxidante fungicida - Acaricida','Views/assets/imagenes/productos/logo_68740dfd45e97.jpg',1.30,2.50,1.20,1.90,NULL,NULL,NULL,'0',NULL,19,NULL,NULL,4,NULL,'1',NULL,NULL,NULL,NULL,1,'2025-07-13 14:50:21',NULL,'2025-07-15 07:19:38',NULL,NULL,NULL,'1'),(29,'00009',32,2,26,'SPARKO - 100 G','Views/assets/imagenes/productos/logo_687411aa80926.png',1.20,1.50,1.40,1.40,NULL,NULL,NULL,'1',NULL,10,NULL,NULL,4,NULL,'1',NULL,NULL,NULL,NULL,1,'2025-07-13 15:06:02',NULL,'2025-07-15 07:19:38',NULL,NULL,NULL,'1'),(30,'09088',32,2,28,'Afepasa','Views/assets/imagenes/productos/logo_687412377eba0.jpg',1.50,1.90,1.80,14.00,NULL,NULL,NULL,'1',NULL,22,NULL,NULL,2,NULL,'1',NULL,NULL,NULL,NULL,1,'2025-07-13 15:08:23',1,'2025-07-13 21:08:50',NULL,NULL,NULL,'1'),(31,'000010',32,2,26,'Adame 1','Views/assets/imagenes/productos/logo_6874137a1e19c.png',1.50,1.90,1.50,1.50,NULL,NULL,NULL,'1',NULL,13,NULL,NULL,4,NULL,'1',NULL,NULL,NULL,NULL,1,'2025-07-13 15:13:46',1,'2025-07-15 07:19:38',NULL,NULL,NULL,'1');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `ruc` varchar(13) DEFAULT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `razon_social` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telefono` varchar(13) DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_usuario_creacion` int DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_actualizacion` int DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `id_usuario_eliminacion` int DEFAULT NULL,
  `fecha_eliminacion` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (8,'0804610814001','Juan Peres','Proveedor de colar','fffff','090909','dddd@gmail.com',1,'2025-07-13 16:17:27',1,'2025-07-13 16:18:03',NULL,NULL,'1');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sri_logs`
--

DROP TABLE IF EXISTS `sri_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sri_logs` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_comprobante` int DEFAULT NULL,
  `etapa` enum('GENERACION','FIRMA','ENVIO_SRI','AUTORIZACION','ENVIO_CLIENTE') DEFAULT NULL,
  `estado_envio` varchar(50) DEFAULT NULL,
  `codigo_error` varchar(10) DEFAULT NULL,
  `mensaje` text,
  `tipo` enum('INFO','ERROR','ADVERTENCIA') DEFAULT 'INFO',
  `origen` varchar(50) DEFAULT 'SISTEMA',
  `fecha_log` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log`),
  KEY `id_comprobante` (`id_comprobante`),
  CONSTRAINT `sri_logs_ibfk_1` FOREIGN KEY (`id_comprobante`) REFERENCES `comprobantes_electronicos` (`id_comprobante`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sri_logs`
--

LOCK TABLES `sri_logs` WRITE;
/*!40000 ALTER TABLE `sri_logs` DISABLE KEYS */;
INSERT INTO `sri_logs` VALUES (1,1,'GENERACION','EXITOSO',NULL,'Factura XML generada y firmada. Clave de Acceso: 1507202501080461081400110010010000000071407851116','INFO',NULL,'2025-07-16 15:37:15'),(2,1,'ENVIO_SRI','INTENTO_ENVIO',NULL,'Intentando enviar XML al SRI.','INFO',NULL,'2025-07-16 15:37:25'),(3,1,'ENVIO_SRI','RECIBIDA',NULL,'Factura RECIBIDA por el SRI.','INFO',NULL,'2025-07-16 15:39:28'),(4,1,'AUTORIZACION','INICIADO',NULL,'Iniciando consulta de autorización al SRI.','INFO',NULL,'2025-07-16 17:46:24'),(5,1,'AUTORIZACION','AUTORIZADO',NULL,'Factura AUTORIZADA por el SRI. Número de autorización: 1507202501080461081400110010010000000071407851116','INFO',NULL,'2025-07-16 17:50:25'),(6,1,'ENVIO_CLIENTE','EXITOSO',NULL,'Comprobante enviado por correo exitosamente al cliente: edisongarofalo88@gmail.com','INFO',NULL,'2025-07-16 21:10:10');
/*!40000 ALTER TABLE `sri_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_comprobante`
--

DROP TABLE IF EXISTS `tipo_comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_comprobante` (
  `codigo_sri` varchar(5) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo_sri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_comprobante`
--

LOCK TABLES `tipo_comprobante` WRITE;
/*!40000 ALTER TABLE `tipo_comprobante` DISABLE KEYS */;
INSERT INTO `tipo_comprobante` VALUES ('01','FACTURA'),('03','TICKET'),('04','NOTA_CREDITO'),('05','NOTA_DEBITO'),('06','GUIA_REMISION'),('07','RETENCION');
/*!40000 ALTER TABLE `tipo_comprobante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_emision`
--

DROP TABLE IF EXISTS `tipo_emision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_emision` (
  `id_tipo_emision` tinyint NOT NULL,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id_tipo_emision`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_emision`
--

LOCK TABLES `tipo_emision` WRITE;
/*!40000 ALTER TABLE `tipo_emision` DISABLE KEYS */;
INSERT INTO `tipo_emision` VALUES (2,'CONTINGENCIA'),(1,'NORMAL');
/*!40000 ALTER TABLE `tipo_emision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_identificacion`
--

DROP TABLE IF EXISTS `tipo_identificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_identificacion` (
  `codigo` char(2) NOT NULL,
  `tipo_identificacion` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_identificacion`
--

LOCK TABLES `tipo_identificacion` WRITE;
/*!40000 ALTER TABLE `tipo_identificacion` DISABLE KEYS */;
INSERT INTO `tipo_identificacion` VALUES ('04','RUC'),('05','CÉDULA'),('06','PASAPORTE'),('07','VENTA A CONSUMIDOR FINAL'),('08','IDENTIFICACIÓN DEL EXTERIOR');
/*!40000 ALTER TABLE `tipo_identificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnos`
--

DROP TABLE IF EXISTS `turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turnos` (
  `id_turno` int NOT NULL AUTO_INCREMENT,
  `nombre` enum('Mañana','Tarde','Noche') NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  PRIMARY KEY (`id_turno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnos`
--

LOCK TABLES `turnos` WRITE;
/*!40000 ALTER TABLE `turnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `turnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_turno`
--

DROP TABLE IF EXISTS `usuario_turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_turno` (
  `id_usuario_turno` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_turno` int NOT NULL,
  PRIMARY KEY (`id_usuario_turno`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_turno` (`id_turno`),
  CONSTRAINT `usuario_turno_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `usuario_turno_ibfk_2` FOREIGN KEY (`id_turno`) REFERENCES `turnos` (`id_turno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_turno`
--

LOCK TABLES `usuario_turno` WRITE;
/*!40000 ALTER TABLE `usuario_turno` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `cedula` varchar(45) DEFAULT NULL,
  `nombre_usuario` varchar(100) DEFAULT NULL,
  `apellido_usuario` varchar(100) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `clave` text,
  `id_perfil_usuario` int DEFAULT NULL,
  `id_caja` int NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `landmarks` varchar(200) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fecha_eliminacion` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  `img` varchar(600) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_usuarios_id_caja` (`id_caja`),
  CONSTRAINT `fk_usuarios_id_caja` FOREIGN KEY (`id_caja`) REFERENCES `cajas` (`id_caja`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'080214555','Edison','Garofalo','Jeily','123456',2,1,NULL,NULL,NULL,NULL,'2025-04-28 17:04:42','2025-04-28 18:48:24',NULL,'1',NULL,NULL),(2,'087666622','Susanw777','777','Susan7','3c2a6eb64cc629de76c419308830c53bbe63b874f6a526f7cd784182b33a2f5f3daaab47b5bde5868b82e4dd3b521d147a7542292b689acdf60122b97e99523f',3,1,'garofalo@gmail.com','sssddssddssdddsdsds','55555557777',NULL,'2025-04-30 07:25:09','2025-06-13 00:11:02',NULL,'1',NULL,NULL),(3,'0804610814','0','Garofalo','Edison','123',3,1,'edisongarofalo88@gmail.com','sssddssdd','202 555 0111','','2025-06-12 22:11:32','2025-06-13 23:10:45',NULL,'1','Views/assets/imagenes/imgUsuario/logo_684cf64563f39.PNG','Esmeralda'),(4,'0804610814','Susan','Gomez','Edison','123',2,1,'edisongarofalo88@gmail.com','barrio entre rios','202 555 0111','Via la T','2025-06-12 22:15:18','2025-06-13 00:19:06',NULL,'2','Views/assets/imagenes/imgUsuario/logo_684b97c69e16c.PNG','Esmeraldas');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `IdVenta` int NOT NULL AUTO_INCREMENT,
  `IdTienda` int DEFAULT '1',
  `Id_caja` int DEFAULT NULL,
  `IdCliente` int DEFAULT NULL,
  `serie` varchar(45) DEFAULT NULL,
  `nro_boleta` varchar(25) DEFAULT NULL,
  `tipo_pago` enum('EFECTIVO','CREDITO','TARJETA') NOT NULL,
  `TipoDocumento` varchar(5) NOT NULL,
  `descripcion` text,
  `CantidadProducto` decimal(10,2) DEFAULT NULL,
  `CantidadTotal` decimal(10,2) DEFAULT NULL,
  `iva` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `total_venta` decimal(10,2) DEFAULT NULL,
  `ImporteRecibido` decimal(10,2) DEFAULT NULL,
  `ImporteCambio` decimal(10,2) DEFAULT NULL,
  `abono_credito` decimal(10,2) DEFAULT NULL,
  `id_usuario_creacion` int DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_actualizacion` int DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `id_usuario_anulacion` int DEFAULT NULL,
  `fecha_anulacion` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  `clave_acceso` varchar(50) DEFAULT NULL,
  `estado_factura` varchar(20) DEFAULT NULL,
  `fecha_autorizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`IdVenta`),
  KEY `fk_venta_cabecera_IdUsuario` (`id_usuario_creacion`),
  KEY `fk_venta_cabecera_IdCliente` (`IdCliente`),
  KEY `fk_ventas_tipo_documento` (`TipoDocumento`),
  CONSTRAINT `fk_venta_cabecera_IdCliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_venta_cabecera_IdUsuario` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `fk_ventas_tipo_documento` FOREIGN KEY (`TipoDocumento`) REFERENCES `tipo_comprobante` (`codigo_sri`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (37,1,1,10,NULL,'00000033','EFECTIVO','03',NULL,NULL,4.00,0.71,6.59,7.30,10.00,2.70,0.00,1,'2025-07-15 06:51:16',NULL,'2025-07-15 06:54:48',NULL,NULL,'2',NULL,NULL,NULL),(38,1,1,10,NULL,'00000034','CREDITO','03',NULL,NULL,4.00,0.74,6.76,7.50,0.00,7.50,0.00,1,'2025-07-15 07:19:38',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_credito`
--

DROP TABLE IF EXISTS `ventas_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_credito` (
  `id_venta_credito` int NOT NULL AUTO_INCREMENT,
  `id_venta` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `nroCreditoVentas` varchar(15) DEFAULT NULL,
  `monto_total` decimal(10,2) DEFAULT NULL,
  `monto_abonado` decimal(10,2) DEFAULT NULL,
  `saldo_pendiente` decimal(10,2) DEFAULT NULL,
  `fecha_venta` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_vencimiento` date DEFAULT NULL,
  `estado` enum('Pendiente','Pagado','Vencido','Otros','Inactivo') DEFAULT 'Pendiente',
  PRIMARY KEY (`id_venta_credito`),
  KEY `id_venta` (`id_venta`),
  CONSTRAINT `ventas_credito_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`IdVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_credito`
--

LOCK TABLES `ventas_credito` WRITE;
/*!40000 ALTER TABLE `ventas_credito` DISABLE KEYS */;
INSERT INTO `ventas_credito` VALUES (7,38,10,'00000007',7.50,7.50,0.00,'2025-07-15 07:19:38','2025-11-15','Pagado');
/*!40000 ALTER TABLE `ventas_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db2025v2'
--

--
-- Dumping routines for database 'db2025v2'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_iniciar_seccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_iniciar_seccion`(in p_usuario varchar(20), in p_password varchar(20), in p_ip varchar(20),in p_opcion char(1))
begin
	

declare J_id_usuario int;
declare J_fecha datetime;

set J_fecha = (select now());
if (p_opcion=1) then

 set J_id_usuario=( select u.id_usuario
                                                from usuarios u 
                                                inner join perfiles p
                                                on u.id_perfil_usuario = p.id_perfil
                                                inner join perfil_modulo pm
                                                on pm.id_perfil = u.id_perfil_usuario
                                                inner join modulos m
                                                on m.id = pm.id_modulo
                                                where u.usuario = p_usuario
                                                and u.clave = p_password
                                                and vista_inicio = 1);
                                                
                                                
select * from licencia_alquirida li_ar inner join licencia li on
li_ar.id_licencia=li.id_licencia and li_ar.estado=1 
where  li_ar.direccion_mac=p_ip  and li_ar.id_usuario= J_id_usuario and li_ar.fecha_vigente >= J_fecha;


elseif(p_opcion=2) then
select * 
                                                from usuarios u 
                                                inner join perfiles p
                                                on u.id_perfil_usuario = p.id_perfil
                                                inner join perfil_modulo pm
                                                on pm.id_perfil = u.id_perfil_usuario
                                                inner join modulos m
                                                on m.id = pm.id_modulo
                                                where u.usuario = p_usuario
                                                and u.clave = p_password
                                                and vista_inicio = 1;
                                                
                                                end if;	
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_validar_licencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validar_licencia`(in p_usuario varchar(20), in p_password text, in p_ip varchar(30) , in p_opcion char(1))
BEGIN

declare J_id_usuario int;
declare J_fecha datetime;

set J_fecha = (select now());
if (p_opcion=1) then
 set J_id_usuario=( select u.id_usuario
                                                from usuarios u 
                                                inner join perfiles p
                                                on u.id_perfil_usuario = p.id_perfil
                                                inner join perfil_modulo pm
                                                on pm.id_perfil = u.id_perfil_usuario
                                                inner join modulos m
                                                on m.id = pm.id_modulo
                                                where u.usuario = p_usuario
                                                and u.clave = p_password
                                                and vista_inicio = 1);
                                                
                                                
select * from licencia_alquirida li_ar inner join licencia li on
li_ar.id_licencia=li.id_licencia and li_ar.estado=1 
where  li_ar.direccion_mac=p_ip  and li_ar.id_usuario= J_id_usuario and li_ar.fecha_vigente >= J_fecha;

elseif(p_opcion=2) then

select * 
                                                from usuarios u 
                                                inner join perfiles p
                                                on u.id_perfil_usuario = p.id_perfil
                                                inner join perfil_modulo pm
                                                on pm.id_perfil = u.id_perfil_usuario
                                                inner join modulos m
                                                on m.id = pm.id_modulo
                                                where u.usuario = p_usuario
                                                and u.clave = p_password
                                                and vista_inicio = 1;
                                                
                                                end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ups_AbrirCaja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ups_AbrirCaja`(

    IN p_IdUsuario INT,

    IN p_IdCaja INT,
    IN p_montoInicial DECIMAL(10,2),
    in p_observacion TEXT 
)
BEGIN

     DECLARE v_id_arqueo INT;
    DECLARE v_fecha_registro DATETIME DEFAULT NOW();
    DECLARE mensaje VARCHAR(255);
    DECLARE caja_abierta_por_usuario BOOLEAN DEFAULT FALSE;
    DECLARE caja_ya_abierta BOOLEAN DEFAULT FALSE;

    -- Paso 1: Validar si el usuario ya tiene una caja abierta
    -- Buscamos si existe algún registro de arqueo_caja para este usuario
    -- donde la fecha_fin es NULL (indicando que la caja está abierta).
    SELECT EXISTS (
        SELECT 1
        FROM arqueo_caja
        WHERE id_usuario = p_IdUsuario AND fecha_fin IS NULL
    ) INTO caja_abierta_por_usuario;

    IF caja_abierta_por_usuario THEN
        -- Si el usuario ya tiene una caja abierta, retornamos un mensaje de error.
        SET mensaje = 'Error: El usuario ya tiene una caja abierta. Por favor, cierre la caja actual antes de intentar abrir una nueva.';
        SELECT mensaje AS resultado;
    ELSE
        -- Paso 2: Si el usuario no tiene una caja abierta, validamos si la caja seleccionada ya está abierta por cualquier usuario.
        -- Buscamos si existe algún registro de arqueo_caja para esta caja
        -- donde la fecha_fin es NULL (indicando que la caja está abierta).
        SELECT EXISTS (
            SELECT 1
            FROM arqueo_caja
            WHERE id_caja = p_IdCaja AND fecha_fin IS NULL
        ) INTO caja_ya_abierta;

        IF caja_ya_abierta THEN
            -- Si la caja ya está abierta por otro usuario, retornamos un mensaje de error.
            SET mensaje = 'Error: La caja seleccionada ya se encuentra abierta por otro usuario. Por favor, seleccione otra caja o espere a que la caja actual sea cerrada.';
            SELECT mensaje AS resultado;
        ELSE
            -- Paso 3: Si ambas validaciones pasan, proceder con la apertura de caja.
            -- Insertar el nuevo registro en la tabla arqueo_caja.
            INSERT INTO arqueo_caja(id_caja,
                                    id_usuario,
                                    monto_inicial,
                                    ObservacionApertura,
                                    fecha_inicio
                                   )
            VALUES (p_IdCaja,
                    p_IdUsuario,
                    p_montoInicial,
                    p_observacion,
                    v_fecha_registro
                   );

            -- Obtener el ID del último registro insertado para los movimientos.
            SET v_id_arqueo = LAST_INSERT_ID();

            -- Insertar movimientos iniciales (Ingreso y Gasto) asociados a este arqueo.
            -- Estos son movimientos predeterminados al abrir la caja.
            INSERT INTO movimiento_caja (id_arqueo, tipo_movimiento, tipo_referencia, id_usuario)
            VALUES (v_id_arqueo, 'Ingreso', 'Ingreso', p_IdUsuario);

            INSERT INTO movimiento_caja (id_arqueo, tipo_movimiento, tipo_referencia, id_usuario)
            VALUES (v_id_arqueo, 'Egreso', 'Gasto', p_IdUsuario);

            -- Si todo fue exitoso, establecer el mensaje de éxito.
            SET mensaje = 'Caja abierta con éxito.';
            SELECT mensaje AS resultado;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ups_ListarHistorialAbonoCreditoCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ups_ListarHistorialAbonoCreditoCliente`(

IN p_id_credito  INT)
BEGIN

 IF p_id_credito IS NOT NULL THEN

	SELECT ac.id_abono AS id_abono,

                 ac.fecha_abono AS fecha_abono,

                 ac.monto_abonado AS monto_abono,

                 ac.metodo_pago  AS forma_pago,

                 ac.observacion AS comentario_referencia

                 FROM  abonos_credito ac 

          WHERE ac.id_venta_credito=p_id_credito AND ac.estado=1;

     ELSE

        SELECT 'ID de crédito no válido' AS mensaje_error;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ups_ListarHistorialAbonoCreditoCompras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ups_ListarHistorialAbonoCreditoCompras`(IN p_id_credito  INT)
BEGIN



  IF p_id_credito IS NOT NULL THEN

        SELECT 

            acc.id_abono AS id_abono,

            acc.fecha_abono AS fecha_abono,

            acc.monto_abonado AS monto_abono,

            acc.metodo_pago as forma_pago,

            acc.observacion AS comentario_referencia

        FROM abonos_compra_credito acc 

        WHERE acc.id_compra_credito = p_id_credito

          AND acc.estado = 1;

    ELSE

        SELECT 'ID de crédito no válido' AS mensaje_error;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ajustar_stock_disminuir` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ajustar_stock_disminuir`(
     IN p_id_producto INT,
    IN p_codigo_producto VARCHAR(20),
    IN p_observacion TEXT,
    IN p_nuevo_stock INT,
    IN p_cantidad INT,
    IN p_precio_compra DECIMAL(10,2),
    IN p_tipo_ajuste VARCHAR(50), -- ('PERDIDA', 'DEVOLUCION', 'CAMBIO')
    IN p_fecha_vencimiento DATE,   -- puede ser NULL para productos no perecibles
    IN p_id_usuario INT
)
main_block: BEGIN
    DECLARE v_total_disponible INT DEFAULT 0;
    DECLARE v_resto INT DEFAULT p_cantidad;
    DECLARE done INT DEFAULT FALSE;

    DECLARE v_id_lote INT;
    DECLARE v_stock INT;

    DECLARE v_unidades_ex FLOAT;
    DECLARE v_costo_unitario_ex FLOAT;
    DECLARE v_costo_total_ex FLOAT;

    DECLARE v_unidades_salida FLOAT;
    DECLARE v_costo_unitario_salida FLOAT;
    DECLARE v_costo_total_salida FLOAT;

    DECLARE v_costo_final DECIMAL(10,2);
    DECLARE v_count_fecha INT;
    -- Variables para el asiento contable
    DECLARE v_id_asiento INT;
    


    
    -- Cursor para recorrer lotes FIFO
    DECLARE cur_lotes CURSOR FOR
        SELECT id_lote, stock_disponible
        FROM lote_producto
        WHERE id_producto = p_id_producto
          AND (p_precio_compra IS NULL OR costo_unitario = p_precio_compra)
          AND (p_fecha_vencimiento IS NULL OR fecha_vencimiento = p_fecha_vencimiento)
          AND estado = 1
          AND stock_disponible > 0
        ORDER BY id_lote;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

     	-- Eliminar espacios al inicio y fin
   SET p_codigo_producto = LTRIM(RTRIM(p_codigo_producto));
   SET p_observacion = LTRIM(RTRIM(p_observacion));
 	   SET p_tipo_ajuste = LTRIM(RTRIM(p_tipo_ajuste));
     	
    -- Validar stock disponible
    SELECT SUM(stock_disponible) INTO v_total_disponible
    FROM lote_producto
    WHERE id_producto = p_id_producto
       AND (p_precio_compra IS NULL OR costo_unitario = p_precio_compra)
      AND (p_fecha_vencimiento IS NULL OR fecha_vencimiento = p_fecha_vencimiento)
      AND estado = 1
      AND stock_disponible > 0;

     -- Validar existencia de lotes con fecha de vencimiento específica (si se envió)
 
        
    IF v_total_disponible IS NULL OR v_total_disponible < p_cantidad THEN
     
     SELECT CONCAT('Warning: Stock insuficiente en lotes disponibles. Stock actual: ', 
                  IFNULL(v_total_disponible, 0)) AS resultado;
         LEAVE main_block; -- Usamos la etiqueta correctamente
    END IF;


    -- Procesar lotes
    OPEN cur_lotes;
    read_loop: LOOP
        FETCH cur_lotes INTO v_id_lote, v_stock;
        IF done THEN
            LEAVE read_loop;
        END IF;

        IF v_resto <= 0 THEN
            LEAVE read_loop;
        END IF;

        IF v_resto >= v_stock THEN
            -- Usar todo el lote
            UPDATE lote_producto
            SET stock_disponible = 0, estado = 0,
                id_usuario_actualizacion = p_id_usuario
            WHERE id_lote = v_id_lote;

            INSERT INTO ajuste_lote (id_usuario, id_lote, cantidad, motivo, observacion)
            VALUES (p_id_usuario, v_id_lote, v_stock, p_tipo_ajuste, p_observacion);

            SET v_resto = v_resto - v_stock;
        ELSE
            -- Usar parte del lote
            UPDATE lote_producto
            SET stock_disponible = stock_disponible - v_resto,
                id_usuario_actualizacion = p_id_usuario
            WHERE id_lote = v_id_lote;

            UPDATE lote_producto
            SET estado = 0
            WHERE id_lote = v_id_lote AND stock_disponible = 0;

            INSERT INTO ajuste_lote (id_usuario, id_lote, cantidad, motivo, observacion)
            VALUES (p_id_usuario, v_id_lote, v_resto, p_tipo_ajuste, p_observacion);

            SET v_resto = 0;
        END IF;
    END LOOP;
    CLOSE cur_lotes;

    -- Determinar costo de salida
    IF p_tipo_ajuste = 'PERDIDA' THEN
        SET v_costo_final = p_precio_compra;
    ELSEIF p_tipo_ajuste = 'DEVOLUCION' THEN
        SET v_costo_final = 0.00; -- no se descuenta costo
    ELSE
        SET v_costo_final = p_precio_compra;
    END IF;

    -- Obtener últimas existencias del producto
    SELECT k.existencia_costo_unitario, k.existencia_unidades, k.existencia_costo_total
    INTO v_costo_unitario_ex, v_unidades_ex, v_costo_total_ex
    FROM kardex k
    WHERE k.id_producto = p_id_producto
    ORDER BY id DESC
    LIMIT 1;

    -- Calcular salida
    SET v_unidades_salida = (v_unidades_ex - p_nuevo_stock);
    SET v_costo_unitario_salida = v_costo_final;
    SET v_costo_total_salida = v_unidades_salida * v_costo_unitario_salida;

    -- Calcular nuevas existencias
    SET v_unidades_ex = ROUND(p_nuevo_stock, 2);
    SET v_costo_total_ex = ROUND(v_costo_total_ex - v_costo_total_salida, 2);

    IF v_costo_total_ex > 0 THEN
        SET v_costo_unitario_ex = ROUND(v_costo_total_ex / v_unidades_ex, 2);
    ELSE
        SET v_costo_unitario_ex = 0.00;
    END IF;

    -- Registrar en kardex
    INSERT INTO kardex(
        id_usuario_creacion,
        id_producto,
        codigo_producto,
        concepto,
        salidad_unidades,
        salidad_costo_unitario,
        salidad_costo_total,
        existencia_unidades,
        existencia_costo_unitario,
        existencia_costo_total
    )
    VALUES (
        p_id_usuario,
        p_id_producto,
        p_codigo_producto,
        p_observacion,
        v_unidades_salida,
        v_costo_unitario_salida,
        v_costo_total_salida,
        v_unidades_ex,
        v_costo_unitario_ex,
        v_costo_total_ex
    );

    -- Actualizar stock en producto
    UPDATE producto
    SET stock_producto = stock_producto - p_cantidad,
        id_usuario_actualizacion = p_id_usuario
    WHERE id_producto = p_id_producto;
    
    
-- Registrar asiento contable solo para PERDIDA o DEVOLUCION
IF p_tipo_ajuste IN ('PERDIDA', 'DEVOLUCION') THEN

    -- Insertar cabecera de asiento contable
    INSERT INTO asiento_contable (
        fecha,
        descripcion,
        tipo_asiento,
        id_referencia,
        modulo_origen,
        total_debe,
        total_haber,
        tipo_referencia
    ) VALUES (
        CURRENT_DATE,
        CONCAT('Ajuste de stock por ', p_tipo_ajuste, ': ', p_observacion),
        'AJUSTE',
        p_id_producto,
        'INVENTARIO',
        v_costo_total_salida,
        v_costo_total_salida,
        'PRODUCTO'
    );
    
    SET v_id_asiento = LAST_INSERT_ID();

    -- Insertar detalle contable
    IF p_tipo_ajuste = 'PERDIDA' THEN
        -- DEBE: Pérdida por inventario (502)
        INSERT INTO detalle_asiento (id_asiento, id_cuenta, debe, descripcion, orden)
        VALUES (v_id_asiento, 15, v_costo_total_salida, 'Pérdida por ajuste de inventario', 1);

        -- HABER: Inventario (104)
        INSERT INTO detalle_asiento (id_asiento, id_cuenta, haber, descripcion, orden)
        VALUES (v_id_asiento, 9, v_costo_total_salida, 'Disminución de inventario', 2);

    ELSEIF p_tipo_ajuste = 'DEVOLUCION' THEN
        -- DEBE: Inventario (104)
        INSERT INTO detalle_asiento (id_asiento, id_cuenta, debe, descripcion, orden)
        VALUES (v_id_asiento, 9, v_costo_total_salida, 'Reposición por devolución', 1);

        -- HABER: Ventas (401) o cliente según el caso
        INSERT INTO detalle_asiento (id_asiento, id_cuenta, haber, descripcion, orden)
        VALUES (v_id_asiento, 11, v_costo_total_salida, 'Reversión de ingreso por devolución', 2);
        END IF;
     END IF;
        
            -- Registrar log de auditoría
    INSERT INTO log_auditoria (
        tabla,
        accion,
        usuario_id,
        fecha,
        detalle,
        id_registro_afectado,
        modulo
    ) VALUES (
        'producto / lote_producto / kardex',
        CONCAT('Ajuste de stock - ', p_tipo_ajuste),
        p_id_usuario,
        NOW(),
        CONCAT('Ajuste realizado al producto ID ', p_id_producto, 
               ' con cantidad ', p_cantidad,
               '. Observación: ', p_observacion,
               IF(p_fecha_vencimiento IS NOT NULL, 
                  CONCAT('. Fecha vencimiento: ', p_fecha_vencimiento), 
                  ''),
               '. Nuevo stock: ', p_nuevo_stock),
        p_id_producto,
        'INVENTARIO'
    );


    -- Retornar mensaje de éxito
    SELECT 'Ajuste realizado con éxito.' AS resultado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_cerrar_caja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_cerrar_caja`(
   IN p_id_usuario INT,
    IN p_id_caja INT,
    IN p_id_arqueo_caja INT,
    IN p_inpuBillete100 FLOAT,
    IN p_inpuBillete50 FLOAT,
    IN p_inpuBillete20 FLOAT,
    IN p_inpuBillete10 FLOAT,
    IN p_inpuBillete5 FLOAT,
    IN p_inpuBillete1 FLOAT,
    IN p_inputMoneda1 FLOAT,
    IN p_inputMoneda50 FLOAT,
    IN p_inputMoneda25 FLOAT,
    IN p_inputMoneda10 FLOAT,
    IN p_inputMoneda5 FLOAT,
    IN p_inputMoneda001 FLOAT,
    IN p_total_efectivo DECIMAL(10,2),
    IN p_inpuTotalMoneda DECIMAL(10,2),
    IN p_inpuTotalBilletes DECIMAL(10,2),
    IN p_Comentario VARCHAR(550)
)
BEGIN
    DECLARE mensaje VARCHAR(255);
    DECLARE v_total_ingresos DECIMAL(10,2) DEFAULT 0.00;
    DECLARE v_total_egresos DECIMAL(10,2) DEFAULT 0.00;
    DECLARE v_monto_inicial DECIMAL(10,2);
    DECLARE v_saldo_final DECIMAL(10,2);
    DECLARE v_diferencia DECIMAL(10,2);

    -- Manejo de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Si ocurre un error, hacemos rollback y establecemos el mensaje de error
        ROLLBACK;
        SET mensaje = 'Ocurrió un error al cerrar la caja. No se realizaron cambios.';
        SELECT mensaje AS resultado;
    END;

    START TRANSACTION;

    -- Verificar si el arqueo está abierto
    IF EXISTS (
        SELECT 1 FROM arqueo_caja 
        WHERE id_arqueo_caja = p_id_arqueo_caja AND fecha_fin IS NULL AND estado = '1'
    ) THEN

        -- Obtener monto inicial
        SELECT monto_inicial INTO v_monto_inicial 
        FROM arqueo_caja WHERE id_arqueo_caja = p_id_arqueo_caja;

        -- Calcular total ingresos
        SELECT IFNULL(SUM(monto), 0) INTO v_total_ingresos
        FROM detalle_ingresos di
        INNER JOIN movimiento_caja mc ON di.id_movimiento_caja = mc.id_movimiento_caja
        WHERE mc.id_arqueo = p_id_arqueo_caja AND mc.estado = '1' AND di.estado = '1';

        -- Calcular total egresos
        SELECT IFNULL(SUM(monto), 0) INTO v_total_egresos
        FROM detalle_gastos dg
        INNER JOIN movimiento_caja mc ON dg.id_movimiento_caja = mc.id_movimiento_caja
        WHERE mc.id_arqueo = p_id_arqueo_caja AND mc.estado = '1' AND dg.estado = '1' AND afectarCaja = 1;

        -- Calcular saldo final
        SET v_saldo_final = v_monto_inicial + v_total_ingresos - v_total_egresos;

        -- Calcular diferencia
        SET v_diferencia = p_total_efectivo - v_saldo_final;

        -- Actualizar arqueo_caja
        UPDATE arqueo_caja
        SET 
            total_ingresos = v_total_ingresos,
            total_egresos = v_total_egresos,
            saldo_final = v_saldo_final,
            monto_usuario = p_total_efectivo,
            sobrante_caja = IF(v_diferencia > 0, v_diferencia, 0),
            faltantes_caja = IF(v_diferencia < 0, ABS(v_diferencia), 0),
            fecha_fin = NOW(),
            concepto = p_Comentario,
            estado = '0'
        WHERE id_arqueo_caja = p_id_arqueo_caja;

        -- Insertar conteo de dinero
        INSERT INTO dinero (
            id_arqueo, id_usuario, id_caja,
            billete_100, billete_50, billete_20, billete_10,
            billete_5, billete_2, billete_1,
            moneda_1, moneda_50, moneda_25, moneda_10, moneda_5, moneda_001,
            total_moneda, total_billeta
        )
        VALUES (
            p_id_arqueo_caja, p_id_usuario, p_id_caja,
            p_inpuBillete100, p_inpuBillete50, p_inpuBillete20, p_inpuBillete10,
            p_inpuBillete5, 0, p_inpuBillete1,
            p_inputMoneda1, p_inputMoneda50, p_inputMoneda25, p_inputMoneda10, p_inputMoneda5, p_inputMoneda001,
            p_inpuTotalMoneda, p_inpuTotalBilletes
        );

        COMMIT;
        SET mensaje = 'Arqueo realizado con éxito.';

    ELSE
        ROLLBACK;
        SET mensaje = 'No existe un arqueo abierto.';
    END IF;

    SELECT mensaje AS resultado;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_CierreCaja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_CierreCaja`(

     IN `p_IdUsuario` INT,

     IN `p_IdCaja` INT

)
begin
	
/* tabla*/


         /* Ingresos */

	declare v_total_fectivo_ventas Decimal(10,2);

	declare v_total_fectivo_credito Decimal(10,2);   

	declare v_total_ventas_credito Decimal(10,2);

    declare v_total_otros_ingresos Decimal(10,2);

    declare v_total_ingresos Decimal(10,2);

          /* Gastos */

    declare v_total_efectivo_compras Decimal(10,2);

    declare v_total_prestamos Decimal(10,2);

    declare v_total_pagos_compras_credito Decimal(10,2);

    declare v_total_otros_gastos Decimal(10,2);

    declare v_total_credito_compras Decimal(10,2);

    declare v_total_egresos Decimal(10,2);

             /* Ingresos */

    
    select sum(di.monto) into v_total_fectivo_ventas from detalle_ingresos di inner join movimiento_caja mc on

    di.id_movimiento_caja = mc.id_movimiento_caja and di.estado =1 and di.tipo_ingresos='Ventas' and mc.tipo_movimiento='Ingreso'

    and mc.tipo_referencia='Ingreso' inner join 

    arqueo_caja ac on ac.id_arqueo_caja = mc.id_arqueo 

    where ac.id_usuario=p_IdUsuario  and ac.id_caja=p_IdCaja  and ac.estado =1;


    select sum(di.monto) into v_total_fectivo_credito from detalle_ingresos di inner join movimiento_caja mc on

    di.id_movimiento_caja = mc.id_movimiento_caja and di.estado =1 and di.tipo_ingresos='Creditos' and mc.tipo_movimiento='Ingreso'

    and mc.tipo_referencia='Ingreso' inner join 

    arqueo_caja ac on ac.id_arqueo_caja = mc.id_arqueo 

    where ac.id_usuario=p_IdUsuario  and ac.id_caja=p_IdCaja  and ac.estado =1;


    select sum(di.monto) into  v_total_otros_ingresos from detalle_ingresos di inner join movimiento_caja mc on

    di.id_movimiento_caja = mc.id_movimiento_caja and di.estado =1 and di.tipo_ingresos='Otros' and mc.tipo_movimiento='Ingreso'

    and mc.tipo_referencia='Ingreso' inner join 

    arqueo_caja ac on ac.id_arqueo_caja = mc.id_arqueo 

    where ac.id_usuario=p_IdUsuario  and ac.id_caja=p_IdCaja  and ac.estado =1;

         

 select sum(vc.saldo_pendiente) into v_total_ventas_credito from ventas_credito vc 

 inner  join detalle_ingresos di on di.id_ventas= vc.id_venta 

 inner join movimiento_caja mc  on di.id_movimiento_caja = mc.id_movimiento_caja  and di.estado =1

 and  mc.tipo_movimiento='Ingreso' and mc.tipo_referencia='Ingreso' inner join 

 arqueo_caja ac on ac.id_arqueo_caja = mc.id_arqueo 

 where ac.id_usuario=p_IdUsuario  and ac.id_caja=p_IdCaja  and ac.estado =1;

   



            /* Gastos */


select sum(dg.monto) into v_total_efectivo_compras

from detalle_gastos dg inner join movimiento_caja mc on dg.afectarCaja=1 and dg.tipo_gastos='Compras'

and dg.id_movimiento_caja =mc.id_movimiento_caja and dg.estado=1 and mc.tipo_movimiento='Egreso'

and mc.tipo_referencia='Gasto'  

inner join arqueo_caja ac on ac.id_arqueo_caja =mc.id_arqueo 

where ac.id_usuario=p_IdUsuario  and ac.id_caja=p_IdCaja  and ac.estado =1;



  SET v_total_prestamos  = (0);

  SET v_total_pagos_compras_credito = (0);


select sum(dg.monto) into v_total_otros_gastos

from detalle_gastos dg inner join movimiento_caja mc on dg.afectarCaja=1 and dg.tipo_gastos='Otros'

and dg.id_movimiento_caja =mc.id_movimiento_caja and dg.estado=1 and mc.tipo_movimiento='Egreso'

and mc.tipo_referencia='Gasto'  

inner join arqueo_caja ac on ac.id_arqueo_caja =mc.id_arqueo 

where ac.id_usuario=p_IdUsuario  and ac.id_caja=p_IdCaja  and ac.estado =1;


      SET v_total_credito_compras = (0);

 SET v_total_ingresos=(v_total_fectivo_ventas+v_total_fectivo_credito+v_total_otros_ingresos);

 SET v_total_egresos=(

v_total_efectivo_compras+

v_total_prestamos+

v_total_pagos_compras_credito+

v_total_otros_gastos);

 
  SELECT

    IFNULL(v_total_fectivo_ventas, 0) AS total_fectivo_ventas,

    IFNULL(v_total_fectivo_credito, 0) AS total_fectivo_credito,

    IFNULL(v_total_ventas_credito, 0) AS total_ventas_credito, 

    IFNULL(v_total_otros_ingresos, 0) AS total_otros_ingresos,

    IFNULL(v_total_efectivo_compras, 0) AS total_efectivo_compras, 

    IFNULL(v_total_prestamos, 0) AS total_prestamos, 

    IFNULL( v_total_pagos_compras_credito , 0) AS  total_pagos_compras_credito , 

    IFNULL(v_total_otros_gastos, 0) AS total_otros_gastos,

    IFNULL(v_total_credito_compras, 0) AS total_credito_compras,   

    IFNULL(v_total_ingresos, 0) AS total_ingresos,

    IFNULL(v_total_egresos, 0) AS total_egresos;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ConsultarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ConsultarProducto`()
BEGIN

	select
	'' as opcion ,
	id_producto,
	codigo_barra,
	descripcion_producto,
	precio_compra_producto,
	precio_venta_producto,
	lleva_iva_producto
from
	producto
where
	estado = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ConsultarProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ConsultarProveedor`()
BEGIN

	select
	'' as opcion,
	id_proveedor,
	ruc,
	nombre,
	razon_social,
	direccion
from
	proveedor
where
	estado = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_consultar_lotes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_consultar_lotes`(
   in p_estado INT ,
   in p_fecha_inicio DATE ,
   in p_fecha_fin DATE ,
   in p_codigo_barra VARCHAR(50) 
)
BEGIN
     -- Eliminar espacios al inicio y fin
    SET p_codigo_barra = LTRIM(RTRIM(p_codigo_barra));
	SELECT
        '' AS detalles,
        lp.id_lote AS `# Lote`,
        p.codigo_barra,
        p.perecedero_producto,
        p.descripcion_producto AS Producto,
        lp.cantidad_comprada AS `Cant. Comprada`,
        lp.cantidad_bonificada AS Bonificación,
        lp.stock_disponible AS `Stock Disponible`,
        lp.costo_unitario AS `Costo Unitario`,
        lp.precio_compra AS `Precio Total`,
        lp.fecha_registro AS `F. Compra`,
        lp.fecha_vencimiento AS `F. Vencimiento`,
        CASE 
            WHEN lp.estado = 1 THEN 'Activo'
            WHEN lp.estado = 0 THEN 'Inactivo'
        END AS Estado,
        '' AS Opciones
    FROM lote_producto lp
    INNER JOIN producto p ON lp.id_producto = p.id_producto
    WHERE 
        (p_estado = -1 OR lp.estado = p_estado)
        AND (
            (p_fecha_inicio IS NULL OR p_fecha_fin IS NULL)
            OR (
                lp.fecha_registro >= CAST(p_fecha_inicio AS DATETIME)
                AND lp.fecha_registro < DATE_ADD(CAST(p_fecha_fin AS DATETIME), INTERVAL 1 DAY)
            )
        )
        AND (p_codigo_barra = '' OR p.codigo_barra = p_codigo_barra)
      --   AND lp.stock_disponible > 0
    ORDER BY lp.fecha_registro DESC;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_consultar_lotes_agrupados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_consultar_lotes_agrupados`(
   in p_estado INT ,
   in p_fecha_inicio DATE ,
   in p_fecha_fin DATE ,
   in p_codigo_barra VARCHAR(50) 

)
begin
	
	SELECT
    '' AS detalles,
    MIN(lp.id_lote) AS `# Lote`,
    p.codigo_barra,
    p.perecedero_producto,
    p.descripcion_producto AS Producto,
    SUM(lp.cantidad_comprada) AS `Cant. Comprada`,
    SUM(lp.cantidad_bonificada) AS Bonificación,
    SUM(lp.stock_disponible) AS `Stock Disponible`,
    -- AVG(lp.costo_unitario) AS `Costo Unitario`,
    ROUND(AVG(lp.costo_unitario), 2) AS `Costo Unitario`,

    SUM(lp.precio_compra) AS `Precio Total`,
    MIN(lp.fecha_registro) AS `F. Compra`,
    CASE 
        WHEN p.perecedero_producto = 1 THEN lp.fecha_vencimiento
        ELSE NULL
    END AS `F. Vencimiento`,
    CASE 
        WHEN lp.estado = 1 THEN 'Activo'
        WHEN lp.estado = 0 THEN 'Inactivo'
    END AS Estado,
    '' AS Opciones
FROM lote_producto lp
INNER JOIN producto p ON lp.id_producto = p.id_producto
WHERE 
    (p_estado = -1 OR lp.estado = p_estado)
    AND (
        (p_fecha_inicio IS NULL OR p_fecha_fin IS NULL)
        OR (
            lp.fecha_registro >= CAST(p_fecha_inicio AS DATETIME)
            AND lp.fecha_registro < DATE_ADD(CAST(p_fecha_fin AS DATETIME), INTERVAL 1 DAY)
        )
    )
    AND (p_codigo_barra = '' OR p.codigo_barra = p_codigo_barra)
 --     AND lp.stock_disponible > 0
GROUP BY 
    p.codigo_barra,
    p.perecedero_producto,
    p.descripcion_producto,
    CASE 
        WHEN p.perecedero_producto = 1 THEN lp.fecha_vencimiento
        ELSE NULL
    END,
    CASE 
        WHEN lp.estado = 1 THEN 'Activo'
        WHEN lp.estado = 0 THEN 'Inactivo'
    END
ORDER BY `F. Compra` DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_EditarVentaCreditos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_EditarVentaCreditos`(
 IN p_IdVenta INT,
    IN p_IdCliente INT,
    IN p_nro_boleta VARCHAR(25),
    IN p_TipoDocumento VARCHAR(25),
    IN p_total_venta DECIMAL(10,2),
    IN p_abono DECIMAL(10,2),
    IN p_fechaVence DATE,
    IN p_detalle JSON
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SELECT 'Error: No se pudo editar la venta' AS resultado;
    END;

    START TRANSACTION;

    -- Paso 1: Validar existencia
    IF EXISTS (SELECT 1 FROM ventas WHERE id_venta = p_IdVenta AND tipo_pago = 'CREDITO') THEN

        -- Paso 2: Revertir stock y kardex
        CALL usp_RevertirStockYkardex(p_IdVenta); -- Puedes crear un procedimiento aparte para esto

        -- Paso 3: Eliminar detalles anteriores
        DELETE FROM det_venta_lote WHERE id_det_venta IN (SELECT id FROM det_venta WHERE IdVenta = p_IdVenta);
        DELETE FROM kardex WHERE comprobante = (SELECT nro_boleta FROM ventas WHERE id_venta = p_IdVenta);
        DELETE FROM det_venta WHERE IdVenta = p_IdVenta;
        DELETE FROM ventas_credito WHERE id_venta = p_IdVenta;

        -- Paso 4: Actualizar cabecera
        UPDATE ventas SET 
            IdCliente = p_IdCliente,
            nro_boleta = p_nro_boleta,
            TipoDocumento = p_TipoDocumento,
            total_venta = p_total_venta,
            abono_credito = p_abono
        WHERE id_venta = p_IdVenta;

        -- Paso 5: Reinsertar nuevos detalles (usa la lógica de insertar del `usp_GuardarVentaCreditos`)
        CALL usp_InsertarDetalleVenta(p_IdVenta, p_nro_boleta, p_detalle);

        -- Paso 6: Insertar nueva info de crédito
        INSERT INTO ventas_credito (id_venta, id_cliente, nroCreditoVentas, monto_total, monto_abonado, saldo_pendiente, fecha_vencimiento)
        VALUES (
            p_IdVenta, p_IdCliente, p_nro_boleta, p_total_venta, p_abono, p_total_venta - p_abono, p_fechaVence
        );

        COMMIT;
        SELECT 'Venta actualizada correctamente' AS resultado;

    ELSE
        ROLLBACK;
        SELECT 'Error: Venta no encontrada o no es de tipo crédito' AS resultado;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_EliminarCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_EliminarCategoria`(
 in p_id_categoria int ,
 in p_id_usuario int
)
begin
DECLARE mensaje VARCHAR(255);

    -- Manejo de errores inesperados
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET mensaje = 'Error inesperado al eliminar la categoría.';
        SELECT mensaje AS resultado;
    END;

    -- Verificar existencia y estado activo
    IF EXISTS (SELECT 1 FROM categorias WHERE id_categoria = p_id_categoria AND estado = 1) THEN

        -- Eliminación lógica
        UPDATE categorias
        SET 
            id_usuario_eliminacion = p_id_usuario,
            fecha_eliminacion = NOW(),
            estado = 2
        WHERE id_categoria = p_id_categoria;

        -- Auditoría (descomenta si la usas)
        -- INSERT INTO log_auditoria (tabla, accion, usuario_id, detalle)
        -- VALUES ('categorias', 'Eliminar', p_id_usuario, CONCAT('Eliminar categoría con ID: ', p_id_categoria));

        SET mensaje = 'Categoría eliminada con éxito.';
    ELSE
        SET mensaje = 'Warning: La categoría no existe o ya está eliminada.';
    END IF;

    SELECT mensaje AS resultado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_EliminarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_EliminarCliente`(
  IN p_id_cliente INT,
    IN p_id_usuario INT
)
BEGIN
    DECLARE tablas VARCHAR(30) DEFAULT 'cliente';
    DECLARE mensaje VARCHAR(255);
    DECLARE existe_cliente INT DEFAULT 0;

    -- Verificar si existe el cliente activo
    SELECT COUNT(1)
    INTO existe_cliente
    FROM cliente
    WHERE id_cliente = p_id_cliente AND estado = 1;

    IF p_id_cliente <= 0 THEN
        SET mensaje = 'Warning: Cliente inválido.';
        
    ELSEIF existe_cliente = 0 THEN
        SET mensaje = 'Warning: El Cliente no existe o ya está eliminado.';
        
    ELSE
        -- Marcar cliente como eliminado (borrado lógico)
        UPDATE cliente
        SET
            estado = 2,
            id_usuario_eliminacion = p_id_usuario,
            fecha_eliminacion = NOW()
        WHERE id_cliente = p_id_cliente;

        INSERT INTO log_auditoria (tabla, accion, usuario_id, detalle,id_registro_afectado,modulo)
            VALUES (tablas, 'Eliminar', p_id_usuario, 
                CONCAT('Eliminar un Cliente con el id: ', p_id_cliente),p_id_cliente,'Cliente');

        SET mensaje = 'Cliente eliminado con éxito.';
    END IF;

    -- Retornar resultado
    SELECT mensaje AS resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_EliminarCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_EliminarCompra`(
                                                     IN p_IdCompra varchar(20),
                                                    IN p_id_usuario INT)
BEGIN

	 DECLARE v_venta_existente INT DEFAULT 0;
     DECLARE mensaje VARCHAR(255);
     declare  v_TOTAL decimal(10,2);
     DECLARE v_id_arqueo INT;
     DECLARE v_id_movimiento INT;
	 DECLARE v_numeroBoleta varchar(50);
	DECLARE v_tipoPago varchar(50);
   
   -- Manejo de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        SET mensaje = 'Error: Ocurrió un error al intentar eliminar la compra.';
        SELECT mensaje AS resultado;
    END;
      -- Obtener el arqueo de caja abierto

    SELECT id_arqueo_caja INTO v_id_arqueo
    FROM arqueo_caja
    WHERE id_usuario = p_id_usuario AND estado = 1
    ORDER BY fecha_inicio DESC

    LIMIT 1;

    IF v_id_arqueo IS NOT NULL then

      select c.TotalCosto, c.nro_boletacompras,c.tipo_pago
         INTO v_TOTAL ,v_numeroBoleta,v_tipoPago
         from compras c 
        where c.IdCompra=p_IdCompra 
       and c.estado=1;

    -- Marcar la compra como inactiva

    UPDATE compras 
    SET estado = 2 
    WHERE IdCompra = p_IdCompra;

    -- Marcar los detalles de compra como inactivos

    UPDATE det_compra 
    SET estado = 2 
    WHERE IdCompra = p_IdCompra;

       -- Marcar el detalle_gastos como inactiva

    UPDATE detalle_gastos 
    SET estado = 2 
    WHERE id_compras = p_IdCompra;


    -- Insertar en el kardex como salida

        INSERT INTO kardex (
            id_usuario_creacion,
            id_producto,
            codigo_producto, 
            fecha, 
            concepto, 
            comprobante, 
            salidad_unidades, 
            salidad_costo_unitario, 
            salidad_costo_total, 
            existencia_unidades, 
            existencia_costo_unitario, 
            existencia_costo_total

        )

          SELECT 
             p_id_usuario,
            p.id_producto, 
            p.codigo_barra, 
            NOW(), 
            CONCAT('Eliminación de compra Id:', p_IdCompra), 
            dc.nro_boleta, 
            dc.Cantidad, 
            p.precio_compra_producto, 
            (dc.Cantidad * p.precio_compra_producto), 
            p.stock_producto - dc.Cantidad, 
            p.precio_compra_producto, 
            (p.stock_producto - dc.Cantidad) * p.precio_compra_producto
        FROM det_compra dc
        JOIN producto p ON p.id_producto = dc.IdProducto
        WHERE dc.IdCompra = p_IdCompra
        AND p.stock_producto >= dc.Cantidad;

    -- Devolver el stock de los productos al estado anterior

    UPDATE producto p

    JOIN (

        SELECT IdProducto, SUM(Cantidad) AS cantidad_comprada
        FROM det_compra
        WHERE IdCompra = p_IdCompra

        GROUP BY IdProducto

    ) AS detalles_compra

    ON p.id_producto = detalles_compra.IdProducto

    SET p.stock_producto = p.stock_producto - detalles_compra.cantidad_comprada;
    
    -- Ajustar el stock en stock_producto

UPDATE lote_producto lp

JOIN det_compra dc ON lp.id_producto = dc.IdProducto AND lp.costo_unitario = dc.PrecioUnitarioCompra
AND lp.id_det_compra=dc.IdDetCompra

SET lp.stock_disponible = lp.stock_disponible - dc.Cantidad,

    lp.cantidad_comprada = lp.cantidad_comprada - dc.Cantidad,
    lp.estado=2

WHERE dc.IdCompra = p_IdCompra;

     -- Obtener movimiento

    SELECT id_movimiento_caja INTO v_id_movimiento

    FROM movimiento_caja

    WHERE id_arqueo= v_id_arqueo and id_usuario = p_id_usuario AND estado = 1 and tipo_movimiento='Devolucion'

    and tipo_referencia='Devolucion'

    ORDER BY fecha_registro DESC

    LIMIT 1;

         if v_id_movimiento is null then
      -- Insertar movimiento en caja
        INSERT INTO movimiento_caja (id_arqueo, tipo_movimiento, tipo_referencia, id_usuario)
        VALUES (v_id_arqueo, 'Devolucion', 'Devolucion', p_id_usuario);

        SET v_id_movimiento = LAST_INSERT_ID();

         end if;

    -- Insertar en detalle_devoluciones
        INSERT INTO detalle_devoluciones (id_movimiento_caja, tipo_devolucion, id_compras, nro_compras,monto,descripcion)
        VALUES (v_id_movimiento, 'Compra',p_IdCompra,v_numeroBoleta, v_TOTAL, CONCAT('Eliminación de compra Id: ', p_IdCompra));
  IF v_tipoPago = 'CREDITO' THEN
       UPDATE compras_credito 
       SET estado = 'Inactivo'
        WHERE id_compra = p_IdCompra;
   END IF;

  END IF;
    SET mensaje = 'Compra eliminada correctamente.';
     SELECT mensaje AS resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_EliminarDetalleGasto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_EliminarDetalleGasto`(

   IN p_id INT

)
BEGIN

    DECLARE mensaje VARCHAR(255);

	UPDATE detalle_gastos

    SET estado = 2

    WHERE id = p_id;



 SET mensaje = 'Gasto eliminado con éxito.';

   SELECT mensaje AS resultado;

 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_EliminarDetalleIngreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_EliminarDetalleIngreso`(

IN p_id INT

)
BEGIN

   DECLARE mensaje VARCHAR(255);



	UPDATE detalle_ingresos

    SET estado = 2

    WHERE id = p_id;

 SET mensaje = 'Ingreso eliminado con éxito.';

   SELECT mensaje AS resultado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_EliminarIngresoCaja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_EliminarIngresoCaja`(
                          in p_id_ingresos int,

                          in p_abono Decimal(10,2))
begin

	

	     DECLARE v_id_abono INT;

	     DECLARE v_id_ventas INT;

	     

	SELECT id_abono,id_ventas 

	INTO v_id_abono,v_id_ventas

    FROM detalle_ingresos

    WHERE id = p_id_ingresos   AND estado = 1

    ORDER BY fecha_registro DESC

    LIMIT 1;

	

	

     IF v_id_abono IS NOT NULL then

        

        UPDATE abonos_credito

        SET estado = 2

        WHERE id_abono  = v_id_abono  AND estado = 1;

      

        UPDATE ventas_credito 

        SET estado = 'Activo',

        monto_abonado =monto_abonado - p_abono,

        saldo_pendiente=saldo_pendiente + p_abono

        WHERE id_venta   = v_id_ventas ;

        

     END IF;

    

     UPDATE detalle_ingresos

        SET estado = 2

        WHERE id = p_id_ingresos  AND estado = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_EliminarMedida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_EliminarMedida`(
 in p_id_medidas int ,
 in p_id_usuario int
)
begin
    DECLARE v_fecha_eliminacion DATETIME;
    DECLARE tablas VARCHAR(30);
    DECLARE mensaje VARCHAR(255);
    DECLARE existe INT DEFAULT 0;

    SET tablas = 'medidas';
    SET v_fecha_eliminacion = NOW();

    -- Validar si la medida existe y está activa
    SELECT COUNT(*) INTO existe
    FROM medidas
    WHERE id_medida = p_id_medidas AND estado = 1;

    IF existe = 0 THEN
        SET mensaje = 'Warning: La medida no existe o ya ha sido eliminada.';
    ELSE
        -- Eliminar lógicamente la medida
        UPDATE medidas
        SET fecha_eliminacion = v_fecha_eliminacion,
            estado = 2
        WHERE id_medida = p_id_medidas;

        -- Registrar auditoría
        INSERT INTO log_auditoria (
            tabla, accion, usuario_id, detalle
        ) VALUES (
            tablas, 'Eliminar', p_id_usuario,
            CONCAT('Eliminar una Medidas con el id: ', p_id_medidas)
        );

        SET mensaje = 'Medida eliminada con éxito.';
    END IF;

    -- Devolver mensaje
    SELECT mensaje AS resultado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_EliminarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_EliminarProducto`(
 in p_id_poducto int ,
 in p_id_usuario int
)
BEGIN
    DECLARE mensaje VARCHAR(255);
    DECLARE tablas VARCHAR(30) DEFAULT 'producto';
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET mensaje = 'Error: Se produjo un problema al intentar eliminar el producto.';
        SELECT mensaje AS resultado;
    END;

    -- Validación de ID de producto
    IF p_id_producto IS NULL OR p_id_producto <= 0 THEN
        SET mensaje = 'Warning: Producto inválido.';

    -- Verificación de existencia del producto y su estado
    ELSEIF NOT EXISTS (
        SELECT 1 FROM producto 
        WHERE id_producto = p_id_producto AND estado = 1
    ) THEN
        SET mensaje = 'Warning: El producto no existe o ya está eliminado.';

    -- Procedimiento de eliminación lógica
    ELSE
        UPDATE producto
        SET 
            id_usuario_eliminacion = p_id_usuario,
            fecha_eliminacion = NOW(),
            estado = 2
        WHERE id_producto = p_id_producto;

        -- Insertar en log de auditoría
        INSERT INTO log_auditoria (
            tabla,
            accion,
            usuario_id,
            fecha,
            detalle,
            id_registro_afectado,
            modulo
        )
        VALUES (
            tablas,
            'ELIMINACION_LOGICA',
            p_id_usuario,
            NOW(),
            CONCAT('El producto con ID ', p_id_producto, ' fue eliminado lógicamente.'),
            p_id_producto,
            'Producto'
        );

        SET mensaje = 'Producto eliminado con éxito.';
    END IF;

    -- Devolver resultado
    SELECT mensaje AS resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_EliminarProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_EliminarProveedor`(
 in p_id_proveedor int ,
 in p_id_usuario int
)
BEGIN

 DECLARE tablas VARCHAR(30) DEFAULT 'proveedor';
    DECLARE mensaje VARCHAR(255);
    DECLARE v_existe INT DEFAULT 0;

    -- Verificar si el proveedor existe y está activo
    SELECT COUNT(*) INTO v_existe
    FROM proveedor
    WHERE id_proveedor = p_id_proveedor AND estado = 1;

    IF p_id_proveedor <= 0 THEN
        SET mensaje = 'Warning: Proveedor inválido.';
    ELSEIF v_existe = 0 THEN
        SET mensaje = 'Warning: El Proveedor no existe o ya está eliminado.';
    ELSE
        -- Realizar borrado lógico
        UPDATE proveedor
        SET
            id_usuario_eliminacion = p_id_usuario,
            fecha_eliminacion = NOW(),
            estado = 2
        WHERE id_proveedor = p_id_proveedor;

        -- Registrar en log de auditoría
        INSERT INTO log_auditoria (
            tabla, accion, usuario_id, detalle, id_registro_afectado, modulo
        )
        VALUES (
            tablas,
            'Eliminar',
            p_id_usuario,
            CONCAT('Eliminar un Proveedor con el ID: ', p_id_proveedor),
            p_id_proveedor,
            'Proveedor'
        );

        SET mensaje = 'Proveedor eliminado con éxito.';
    END IF;

    -- Devolver mensaje
    SELECT mensaje AS resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_EliminarVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_EliminarVenta`(
        IN p_IdVenta INT,
        IN p_id_usuario INT

)
BEGIN
    DECLARE mensaje VARCHAR(255);
    DECLARE v_nro_boleta VARCHAR(25);
    DECLARE v_id_arqueo INT;
    DECLARE v_id_movimiento INT;
    DECLARE v_id_detalle INT;
    DECLARE v_id_stock INT;
    DECLARE v_id_producto INT;
    DECLARE v_cantidad_vendida INT;
    DECLARE v_precio_venta DECIMAL(10,2);
    DECLARE v_costo_unitario DECIMAL(10,2);
    DECLARE v_codigo_barra VARCHAR(20);
    DECLARE v_total_venta DECIMAL(10,2);


      -- Kardex

    DECLARE v_stock_actual INT;
    DECLARE v_existencia_costo_total DECIMAL(10,2);

    DECLARE done INT DEFAULT FALSE;

   -- Cursor para recorrer los productos vendidos

    DECLARE cur CURSOR FOR 

     SELECT dvl.id_detalle_venta_stock, dvl.id_lote, dv.IdProducto, dvl.cantidad_vendida, dvl.precio_venta, dvl.costo_unitario, dv.codigo_barra
         FROM det_venta_lote dvl
        INNER JOIN det_venta dv ON dvl.id_det_venta = dv.IdDetalleVenta
        WHERE dv.estado = 1 AND dv.IdVenta = p_IdVenta;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;


  -- Obtener la venta y su total

    SELECT total_venta ,nro_boleta 
    INTO  v_total_venta,v_nro_boleta 
    FROM ventas  
    WHERE IdVenta = p_IdVenta
    AND estado = 1;

    -- Verificar si la venta existe y está activa

    IF EXISTS (SELECT 1 FROM ventas WHERE IdVenta = p_IdVenta AND estado = '1') THEN

   
         -- Obtener el arqueo de caja activo del usuario

        SELECT id_arqueo_caja 
        INTO v_id_arqueo
        FROM arqueo_caja
        WHERE id_usuario = p_id_usuario AND estado = 1
        ORDER BY fecha_inicio DESC

        LIMIT 1;

         IF v_id_arqueo IS NOT NULL then

     -- Obtener el movimiento de caja para devoluciones

            SELECT id_movimiento_caja 
            INTO v_id_movimiento
            FROM movimiento_caja
            WHERE id_arqueo = v_id_arqueo AND tipo_movimiento = 'Devolucion' 
            AND tipo_referencia = 'Devolucion'
            ORDER BY fecha_registro DESC

            LIMIT 1;

           
         if v_id_movimiento is null then
       
       -- Insertar movimiento en caja si no existe
          INSERT INTO movimiento_caja (id_arqueo, tipo_movimiento, tipo_referencia, id_usuario)
          VALUES (v_id_arqueo, 'Devolucion', 'Devolucion', p_id_usuario);
       
          SET v_id_movimiento = LAST_INSERT_ID();
         end if;

        -- Revertir el stock de los productos vendidos

        OPEN cur;


        read_loop: LOOP

           FETCH cur INTO v_id_detalle, v_id_stock, v_id_producto, v_cantidad_vendida, v_precio_venta, v_costo_unitario, v_codigo_barra;


            IF done THEN 

                LEAVE read_loop;

            END IF;

            IF v_id_producto IS NOT NULL THEN

        -- Restaurar stock en stock_producto

                UPDATE lote_producto 
                SET stock_disponible = stock_disponible + v_cantidad_vendida
                WHERE id_lote = v_id_stock and estado=1;

                -- Restaurar stock en stock_producto

            UPDATE producto 
            SET stock_producto = stock_producto + v_cantidad_vendida
            WHERE id_producto = v_id_producto and estado=1;

               -- Obtener el stock actual después de la reversión

                SELECT stock_producto INTO v_stock_actual FROM producto WHERE id_producto = v_id_producto;
                
                -- Calcular existencia en Kardex

                SET v_existencia_costo_total = v_stock_actual * v_costo_unitario;


                -- Registrar entrada en Kardex

                INSERT INTO kardex (
                   id_usuario_creacion, id_producto, codigo_producto, concepto, comprobante, 
                    entrada_unidades, entrada_costo_unitario, entrada_costo_total, 
                    existencia_unidades, existencia_costo_unitario, existencia_costo_total

                ) VALUES (
                   p_id_usuario, v_id_producto, v_codigo_barra,  concat('Devolucion de Venta: Id', p_IdVenta), v_nro_boleta, 
                    v_cantidad_vendida, v_costo_unitario, v_cantidad_vendida * v_costo_unitario, 
                    v_stock_actual, v_costo_unitario, v_existencia_costo_total

                );

                -- Marcar detalle de venta stock como inactivo

                UPDATE det_venta_lote 
                SET estado = 2 
                WHERE id_detalle_venta_stock = v_id_detalle AND estado = 1;
                 END IF;


        END LOOP;
        CLOSE cur;

              -- Insertar en detalle_devoluciones

        INSERT INTO detalle_devoluciones (id_movimiento_caja, tipo_devolucion, id_ventas, nro_ventas,monto,descripcion)
        VALUES (v_id_movimiento, 'Venta',p_IdVenta,v_nro_boleta, v_total_venta, concat('Devolucion de Venta Id: ', p_IdVenta));


         -- Eliminar el detalle de venta

          UPDATE det_venta 
          SET estado = 2 
          WHERE IdVenta = p_IdVenta and estado=1;

          -- Marcar la venta como anulada

        UPDATE ventas 
        SET estado = '2'
        WHERE IdVenta = p_IdVenta and estado = '1';

      
        UPDATE detalle_ingresos 
        SET estado = 2
        WHERE id_ventas = p_IdVenta and estado = 1;

        UPDATE ventas_credito 
        SET estado = 'Inactivo'
        WHERE id_venta = p_IdVenta and estado = 'Activo';


    END IF;

    END IF;

    
      SET mensaje = 'Venta eliminada correctamente.';
     SELECT mensaje AS resultado;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_EliminarVentaValidacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_EliminarVentaValidacion`(

                           IN p_nroBoleta VARCHAR(20),

                           IN p_concepto VARCHAR(50),

                           IN p_IdUsuario INT

)
BEGIN

    DECLARE v_IdVenta INT;

    DECLARE v_IdVentaCredito INT;

    DECLARE v_id_arqueo INT;

    DECLARE v_id_stock INT;

    DECLARE v_id_producto INT;

    DECLARE v_cantidad_vendida INT;

    DECLARE v_stock_actual INT;

   

   

    -- Obtener ID de la venta

    SELECT IdVenta INTO v_IdVenta FROM ventas 

    WHERE CAST(nro_boleta AS CHAR) = CAST(p_nroBoleta AS CHAR) 

    AND Activo = 1;

   

       -- Obtener ID de la venta

    SELECT id_venta_credito INTO v_IdVentaCredito FROM ventas_credito 

    where id_venta= v_IdVenta

    AND estado = 'Activo' or estado='Pagado';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ExisteCreditoVigente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ExisteCreditoVigente`(

in p_id_cliente int
)
BEGIN


select

	c.numeroDocumento,

	c.nombre,

	vc.saldo_pendiente as restante

from

	ventas_credito vc

inner join cliente c 

on

	vc.id_cliente = c.id_cliente

	and vc.estado = 'Activo'

	and c.estado = 1

	where vc.id_cliente =p_id_cliente;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_FlitradoListadoHistorialClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_FlitradoListadoHistorialClientes`(
     IN p_fechaDesde date,

      IN p_fechaHasta date, 

     IN  p_id_cliente int)
BEGIN
IF  (p_id_cliente > 0 )then 

select  Concat('Credito Nro: ',vc.nroCreditoVentas,' - Nombre del Cliente: ',c.nombre) as nro_credito_ventas

 ,Concat(u.nombre_usuario, u.apellido_usuario)as usuario ,

  c2.nombre_caja

 ,c.telefono,ac.monto_abonado ,ac.fecha_abono 

        from abonos_credito ac  inner join ventas_credito vc on 

ac.id_venta_credito = vc.id_venta_credito inner join cliente c 

on vc.id_cliente = c.id_cliente   inner join movimiento_caja mc on mc.id_movimiento_caja =ac.id_movimiento_caja 

inner join usuarios u  on u.id_usuario =mc.id_usuario inner join arqueo_caja ac2 on ac2.id_arqueo_caja =mc.id_arqueo 

inner join cajas c2 on ac2.id_caja = c2.id_caja

where vc.id_cliente=p_id_cliente and  ac.fecha_abono between p_fechaDesde and p_fechaHasta

order by ac.id_abono ,ac.fecha_abono  desc;
else 
select  Concat('Credito Nro: ',vc.nroCreditoVentas,' - Nombre del Cliente: ',c.nombre) as nro_credito_ventas

 ,Concat(u.nombre_usuario, u.apellido_usuario)as usuario ,

  c2.nombre_caja

 ,c.telefono,ac.monto_abonado ,ac.fecha_abono 

        from abonos_credito ac  inner join ventas_credito vc on 

ac.id_venta_credito = vc.id_venta_credito inner join cliente c 

on vc.id_cliente = c.id_cliente   inner join movimiento_caja mc on mc.id_movimiento_caja =ac.id_movimiento_caja 

inner join usuarios u  on u.id_usuario =mc.id_usuario inner join arqueo_caja ac2 on ac2.id_arqueo_caja =mc.id_arqueo 

inner join cajas c2 on ac2.id_caja = c2.id_caja

where ac.fecha_abono between p_fechaDesde and p_fechaHasta

order by ac.id_abono ,ac.fecha_abono  desc;
end if ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_GetDatosProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_GetDatosProducto`(
in p_codigo_producto  varchar(30)
)
BEGIN
    -- Eliminar espacios al inicio y fin
    SET p_codigo_producto = LTRIM(RTRIM(p_codigo_producto));
SELECT '' as vacio,  id_producto ,
                                                        codigo_barra,
                                                        c.id_categoria,
                                                        c.nombre_categoria,
                                                        descripcion_producto,
                                                        u.nombre_corto as unidad,
                                                        lleva_iva_producto,
                                                          '1' as cantidad,
                                                        CONCAT('$./ ',CONVERT(ROUND(precio_venta_producto,2), CHAR)) as precio_venta,
                                                        CONCAT('$./ ',CONVERT(ROUND(1*precio_venta_producto,2), CHAR)) as total,
                                                        '' as acciones,
                                                        p.precio_1_producto,
													    p.precio_2_producto
                                                FROM producto p inner join categorias c on p.id_categoria_producto = c.id_categoria
                                            inner join medidas u on u.id_medida = p.id_unidades
                                            WHERE p.codigo_barra = p_codigo_producto
                                                AND p.stock_producto > 0 and p.estado=1;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_GetDatosProductoCompras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_GetDatosProductoCompras`(

 in p_codigo_producto  varchar(30))
BEGIN
        -- Eliminar espacios al inicio y fin
    SET p_codigo_producto = LTRIM(RTRIM(p_codigo_producto));

select

	p.id_producto ,
	p.codigo_barra,
	p.descripcion_producto,
	'1' as cantidad,
	CONCAT('$./ ', convert(ROUND(p.precio_compra_producto, 2), CHAR)) as precio_compra_producto,
	CONCAT('$./ ', convert(ROUND(p.precio_venta_producto, 2), CHAR)) as precio_venta_producto

from
	producto p
inner join categorias c on
	p.id_categoria_producto = c.id_categoria
inner join medidas u on
	u.id = p.id_unidades

                                            WHERE p.codigo_barra = p_codigo_producto

                                                and activo=1;





END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_GuardarCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_GuardarCategoria`(
 in p_id_categoria int ,
 in p_nombre VARCHAR(50),
 in p_id_usuario int,
 in p_estado char(1))
BEGIN

    DECLARE existe_nombre INT DEFAULT 0;
    DECLARE mensaje VARCHAR(255);

    -- Eliminar espacios al inicio y fin
    SET p_nombre = LTRIM(RTRIM(p_nombre));

    -- Verifica si el nombre ya existe (excluyendo el mismo ID en caso de actualización)
    IF p_id_categoria > 0 THEN
        SELECT COUNT(*) INTO existe_nombre
        FROM categorias
        WHERE nombre_categoria = p_nombre
          AND id_categoria <> p_id_categoria;
    ELSE
        SELECT COUNT(*) INTO existe_nombre
        FROM categorias
        WHERE nombre_categoria = p_nombre;
    END IF;

    IF existe_nombre > 0 THEN
        SET mensaje = 'Warning: Ya existe una Categoria con el mismo nombre.';
    ELSE
        IF p_id_categoria > 0 THEN
            -- Actualización
            UPDATE categorias
            SET nombre_categoria = p_nombre,
                id_usuario_actualizacion=p_id_usuario,
                fecha_actualizacion=NOW(),
                estado = p_estado
            WHERE id_categoria = p_id_categoria;
                       
      --      INSERT INTO log_auditoria (tabla, accion, usuario_id, detalle)
      --      VALUES (tablas, 'Actualizar', p_id_usuario,
       --             CONCAT('Actualizar una Categoria con el id: ', p_id_categoria));

            SET mensaje = 'Categoría actualizada con éxito.';
        ELSE
            -- Inserción
            INSERT INTO categorias (nombre_categoria,id_usuario_creacion , estado)
            VALUES (p_nombre,p_id_usuario, p_estado);

        --    INSERT INTO log_auditoria (tabla, accion, usuario_id, detalle)
         --   VALUES (tablas, 'Registrar', p_id_usuario, 'Registrar una Categoria');

            SET mensaje = 'Categoría registrada con éxito.';
         
        END IF;
    END IF;

    -- Devuelve el mensaje final
    SELECT mensaje AS resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_guardarcliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_guardarcliente`(
    IN p_id_cliente INT,
    IN p_tipo_identificacion CHAR(2),
    IN p_numeroDocumento VARCHAR(13),
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_direccion VARCHAR(100),
    IN p_telefono VARCHAR(13),
    IN p_email VARCHAR(100),
    IN p_id_usuario INT
)
BEGIN
    DECLARE mensaje VARCHAR(255);
    DECLARE existe INT DEFAULT 0;
    DECLARE existe_nombre_apellido INT DEFAULT 0;
    DECLARE tablas VARCHAR(30) DEFAULT 'cliente';
    DECLARE v_IdCliente INT  DEFAULT 0;

	-- Eliminar espacios al inicio y fin
   SET p_tipo_identificacion = LTRIM(RTRIM(p_tipo_identificacion));
   SET p_numeroDocumento = LTRIM(RTRIM(p_numeroDocumento));
   SET p_nombre = LTRIM(RTRIM(p_nombre));
   SET p_apellido = LTRIM(RTRIM(p_apellido));
   SET p_direccion = LTRIM(RTRIM(p_direccion));
   SET p_telefono = LTRIM(RTRIM(p_telefono));
   SET p_email = LTRIM(RTRIM(p_email));

    -- Validar que no exista otro cliente con mismo documento
    IF (p_id_cliente > 0) THEN
        SELECT COUNT(*) INTO existe
        FROM cliente
        WHERE numeroDocumento = p_numeroDocumento
          AND id_cliente <> p_id_cliente;
    ELSE
        SELECT COUNT(*) INTO existe
        FROM cliente
        WHERE numeroDocumento = p_numeroDocumento;
    END IF;

    -- Validación adicional por nombre y apellido
  --  SELECT COUNT(*) INTO existe_nombre_apellido
  --  FROM cliente
  --  WHERE nombre = p_nombre
  --    AND apellido = p_apellido
  --    AND id_cliente <> p_id_cliente;

    IF (existe > 0) THEN
        SET mensaje = 'Warning: El número de documento ya está registrado en otro cliente.';
     --   SET codigo = 1;
  --  ELSEIF (existe_nombre_apellido > 0) THEN
  --      SET mensaje = 'Warning: Ya existe un cliente con el mismo nombre y apellido.';
  --      SET codigo = 2;
    ELSE
        IF (p_id_cliente > 0) THEN
            UPDATE cliente
            SET
                tipo_identificacion = p_tipo_identificacion,
                numeroDocumento = p_numeroDocumento,
                nombre = p_nombre,
                apellido = p_apellido,
                direccion = p_direccion,
                telefono = p_telefono,
                email = p_email,
                id_usuario_actualizacion = p_id_usuario,
                fecha_actualizacion = NOW()
            WHERE id_cliente = p_id_cliente;

            INSERT INTO log_auditoria (tabla, accion, usuario_id, detalle,id_registro_afectado,modulo)
            VALUES (tablas, 'Actualizar', p_id_usuario, 
                CONCAT('Actualizar un Cliente con el id: ', p_id_cliente),p_id_cliente,'Cliente');
            
            SET mensaje = 'Cliente actualizado con éxito.';
        ELSE
            INSERT INTO cliente (
                tipo_identificacion,
                numeroDocumento,
                nombre,
                apellido,
                direccion,
                telefono,
                email,
                id_usuario_creacion
            ) VALUES (
                p_tipo_identificacion,
                p_numeroDocumento,
                p_nombre,
                p_apellido,
                p_direccion,
                p_telefono,
                p_email,
                p_id_usuario
            );
                        
                SET v_IdCliente = LAST_INSERT_ID();
     
            INSERT INTO log_auditoria (tabla, accion, usuario_id, detalle,id_registro_afectado,modulo)
            VALUES (tablas, 'Actualizar', p_id_usuario, 
                CONCAT('Registrar un Cliente con el id: ', v_IdCliente),v_IdCliente,'Cliente');
            
            SET mensaje = 'Cliente registrado con éxito.';
        END IF;
    END IF;

    -- Retornar mensaje y código
    SELECT mensaje AS resultado;
    
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_GuardarCompraCreditos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_GuardarCompraCreditos`(
           in p_IdUsuario int,
            in p_IdCaja int,
            in p_afectarCaja int,
            in p_IdProveedor int,
            in p_abono float,
            in p_restante float,
            in p_tipo_pago int,
            in p_TipoDocumento int,
            in p_fechaCompra date,
            in p_fechaVence date,
            in p_NumeroFactura varchar(20),
            in p_iva float,
            in p_subtotal float, 
            in p_total_compra float, 
            in p_Nro_compras varchar(20),
            in p_Nro_credito_compras varchar(20),
            IN p_detalle JSON)
begin

	
	DECLARE v_id_arqueo INT;
    DECLARE v_id_movimiento INT;
    DECLARE v_IdCompra INT;


        -- Manejador de excepciones para hacer rollback si hay un error

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 

    BEGIN

        -- Realizar ROLLBACK para deshacer cualquier cambio si ocurre un error

        ROLLBACK;

                SELECT 'Error: Error al procesar la Compra.' AS resultado;

    END;
  
    -- 4️⃣ Iniciar Transacción

    START TRANSACTION;

    -- Obtener el arqueo de caja abierto

    SELECT id_arqueo_caja INTO v_id_arqueo
    FROM arqueo_caja
    WHERE id_usuario = p_IdUsuario  and id_caja=p_IdCaja AND estado = 1
    ORDER BY fecha_inicio DESC

    LIMIT 1;

 

    -- 1️⃣ Insertar en compras (cabecera)

    INSERT INTO compras(
       tipo_pago, id_usuario_creacion, IdProveedor, subtotalcosto, iva, TotalCosto, TipoComprobante,  
        NumeroFactura, nro_boletacompras,fecha_factura

    ) VALUES (

       'CREDITO', p_IdUsuario, p_IdProveedor, p_subtotal, p_iva, p_total_compra, p_TipoDocumento,
        p_NumeroFactura, p_Nro_compras,p_fechaCompra

    );
-- Obtener el ID de la compra recién insertada

    SET v_IdCompra = LAST_INSERT_ID();
    
    -- Actualizar correlativo de compras

    UPDATE empresa 

    SET nro_correlativo_compras = LPAD(nro_correlativo_compras + 1, 8, '0');
    
    

      IF v_id_arqueo IS NOT NULL then
  
         -- Obtener movimiento
    SELECT id_movimiento_caja INTO v_id_movimiento
    FROM movimiento_caja
    WHERE id_arqueo= v_id_arqueo and id_usuario = p_IdUsuario AND estado = 1 and tipo_movimiento='Egreso'
    and tipo_referencia='Gasto'
    ORDER BY fecha_registro DESC

    LIMIT 1;

      if v_id_movimiento is null then

        -- Insertar movimiento en caja

        INSERT INTO movimiento_caja (id_arqueo, tipo_movimiento, tipo_referencia, id_usuario)

        VALUES (v_id_arqueo, 'Egreso', 'Gasto', p_IdUsuario);
        
        SET v_id_movimiento = LAST_INSERT_ID();

        END IF;

        -- Insertar en detalle_gastos

        INSERT INTO detalle_gastos (afectarCaja,id_movimiento_caja,tipo_gastos, tipo_pago, id_compras, nro_factura, nro_compras, nro_credito_compras,monto,descripcion)

        VALUES (p_afectarCaja,v_id_movimiento,'Compras', p_tipo_pago, v_IdCompra, p_NumeroFactura, p_Nro_compras, p_Nro_credito_compras,p_abono, 'Compra de mercaderia');
     
       END IF;

    -- 2️⃣ Insertar en detalle de compra

    INSERT INTO det_compra (

        IdCompra, IdProducto, Cantidad, PrecioUnitarioCompra,
         subtotalcosto, iva, TotalCosto,
        codigo_barra, nro_boleta
    )

    SELECT 

        v_IdCompra, 
        j.IdProducto,
        j.cantidad,
        j.PrecioUnitarioCompra,
        j.subtotalcosto,
        j.iva,
        j.TotalCosto,
        j.codigo_barra,
        p_Nro_compras        

    FROM JSON_TABLE(p_detalle, '$[*]' 

        COLUMNS (

            IdProducto INT PATH '$.id_producto',
            cantidad DECIMAL(10,2) PATH '$.cantidad',
            PrecioUnitarioCompra DECIMAL(10,2) PATH '$.precio_compra_producto',
            subtotalcosto DECIMAL(10,2) PATH '$.sub_total',
            iva DECIMAL(10,2) PATH '$.iva',
            TotalCosto DECIMAL(10,2) PATH '$.total',
            codigo_barra VARCHAR(25) PATH '$.codigo_producto'
        )

    ) AS j;

    -- 3️⃣ Actualizar stock en la tabla `producto`

    UPDATE producto p

    JOIN (

        SELECT 

            IdProducto,
            SUM(cantidad) AS cantidad_comprada

        FROM JSON_TABLE(p_detalle, '$[*]' 

            COLUMNS (

                IdProducto INT PATH '$.id_producto',
                cantidad DECIMAL(10,2) PATH '$.cantidad'
            )

        ) AS j

        GROUP BY IdProducto

    ) AS detalles_compra

    ON p.id_producto = detalles_compra.IdProducto
    SET p.stock_producto = p.stock_producto + detalles_compra.cantidad_comprada;

    -- 4️⃣ Insertar o actualizar en stock_producto

    INSERT INTO lote_producto (
        id_usuario_creacion,id_producto, cantidad_comprada, cantidad_bonificada, stock_disponible, 
        costo_unitario, fecha_vencimiento
    )

    SELECT 
        p_IdUsuario,
        j.IdProducto,
        j.cantidad,
        0, -- Ajustar cantidad bonificada si aplica
        j.cantidad,
        j.PrecioUnitarioCompra,
        j.vence -- Modificar si manejas fecha de vencimiento
    FROM JSON_TABLE(p_detalle, '$[*]' 

        COLUMNS (

            IdProducto INT PATH '$.id_producto',
            cantidad DECIMAL(10,2) PATH '$.cantidad',
            PrecioUnitarioCompra DECIMAL(10,2) PATH '$.precio_compra_producto',
            vence DATE PATH '$.vence'

        )

    ) AS j;

       UPDATE lote_producto lp
                 JOIN det_compra dc ON 
                   lp.id_producto = dc.IdProducto AND
                   lp.costo_unitario = dc.PrecioUnitarioCompra AND
                   lp.cantidad_comprada = dc.Cantidad AND
                   dc.IdCompra = v_IdCompra
                  SET lp.id_det_compra = dc.IdDetCompra
                  WHERE lp.id_det_compra IS NULL;
   -- ON DUPLICATE KEY UPDATE 

     --   cantidad_comprada = cantidad_comprada + VALUES(cantidad_comprada),
     --   stock_disponible = stock_disponible + VALUES(stock_disponible);

    -- 5️⃣ Registrar en `kardex`

INSERT INTO kardex (
    id_usuario_creacion,id_producto, codigo_producto, concepto, comprobante, 
    entrada_unidades, entrada_costo_unitario, entrada_costo_total, 
    existencia_unidades, existencia_costo_unitario, existencia_costo_total
)

SELECT 
    p_IdUsuario,
    j.IdProducto,
    j.codigo_barra,
    'Compra de productos',
    p_Nro_compras,
    j.cantidad,
    j.PrecioUnitarioCompra,
    j.TotalCosto,

    (SELECT stock_producto FROM producto WHERE id_producto = j.IdProducto),  -- Existencia antes de la compra

    j.PrecioUnitarioCompra, 

    ((SELECT stock_producto FROM producto WHERE id_producto = j.IdProducto) + j.cantidad) * j.PrecioUnitarioCompra -- Nuevo costo total

FROM JSON_TABLE(p_detalle, '$[*]' 

    COLUMNS (

        IdProducto INT PATH '$.id_producto',
        cantidad DECIMAL(10,2) PATH '$.cantidad',
        PrecioUnitarioCompra DECIMAL(10,2) PATH '$.precio_compra_producto',
        TotalCosto DECIMAL(10,2) PATH '$.total',
        codigo_barra VARCHAR(25) PATH '$.codigo_producto'

    )

) AS j

JOIN producto p ON p.id_producto = j.IdProducto;

 --  Insertar en ventas_credito

    INSERT INTO compras_credito (

        id_compra ,nroCreditoCompra, monto_total ,monto_abonado, saldo_pendiente ,fecha_compra,fecha_vencimiento

    ) VALUES (

        v_IdCompra,p_Nro_credito_compras, p_total_compra, p_abono,p_restante,p_fechaCompra,p_fechaVence

    );

INSERT INTO log_auditoria (tabla, accion, usuario_id, detalle, id_registro_afectado, modulo)
VALUES (
  'compras/det_compra/producto/kardex/Movimiento en caja/gasto/compra a credito', 
  'INSERT/UPDATE', 
  p_IdUsuario, 
  CONCAT('Compra registrada completa con ID: ', v_IdCompra), 
  v_IdCompra, 
  'Compra'
);

       -- Confirmar transacción

    COMMIT;
         SELECT 'Se realizado con éxito la Compra.' AS resultado; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_GuardarCompraEfectivo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_GuardarCompraEfectivo`(
            in p_IdUsuario int,
            in p_IdCaja int,
            in p_afectarCaja int,
            in p_IdProveedor int,
            in p_abono float,
            in p_restante float,
            in p_tipo_pago int,
            in p_TipoDocumento int,
            in p_fechaCompra date,
            in p_fechaVence date,
            in p_NumeroFactura varchar(20),
            in p_iva float,
            in p_subtotal float, 
            in p_total_compra float, 
            in p_Nro_compras varchar(20),
            in p_Nro_credito_compras varchar(20),
            IN p_detalle JSON)
begin

	
	DECLARE v_id_arqueo INT;
    DECLARE v_id_movimiento INT;
    DECLARE v_IdCompra INT;


        -- Manejador de excepciones para hacer rollback si hay un error

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 

    BEGIN

        -- Realizar ROLLBACK para deshacer cualquier cambio si ocurre un error

        ROLLBACK;

              SELECT 'Error: Error al procesar la Compra.' AS resultado;

    END;
  
    -- 4️⃣ Iniciar Transacción

    START TRANSACTION;

    -- Obtener el arqueo de caja abierto

    SELECT id_arqueo_caja INTO v_id_arqueo
    FROM arqueo_caja
    WHERE id_usuario = p_IdUsuario  and id_caja=p_IdCaja AND estado = 1
    ORDER BY fecha_inicio DESC

    LIMIT 1;

 

    -- 1️⃣ Insertar en compras (cabecera)

    INSERT INTO compras(
        tipo_pago,id_usuario_creacion, IdProveedor, subtotalcosto, iva, TotalCosto, TipoComprobante,  
        NumeroFactura, nro_boletacompras,fecha_factura

    ) VALUES (

       'EFECTIVO', p_IdUsuario, p_IdProveedor, p_subtotal, p_iva, p_total_compra, p_TipoDocumento,
        p_NumeroFactura, p_Nro_compras,p_fechaCompra

    );
-- Obtener el ID de la compra recién insertada

    SET v_IdCompra = LAST_INSERT_ID();
    
    -- Actualizar correlativo de compras

    UPDATE empresa 

    SET nro_correlativo_compras = LPAD(nro_correlativo_compras + 1, 8, '0');
    
    

      IF v_id_arqueo IS NOT NULL then
  
         -- Obtener movimiento
    SELECT id_movimiento_caja INTO v_id_movimiento
    FROM movimiento_caja
    WHERE id_arqueo= v_id_arqueo and id_usuario = p_IdUsuario AND estado = 1 and tipo_movimiento='Egreso'
    and tipo_referencia='Gasto'
    ORDER BY fecha_registro DESC

    LIMIT 1;

      if v_id_movimiento is null then

        -- Insertar movimiento en caja

        INSERT INTO movimiento_caja (id_arqueo, tipo_movimiento, tipo_referencia, id_usuario)

        VALUES (v_id_arqueo, 'Egreso', 'Gasto', p_IdUsuario);
        
        SET v_id_movimiento = LAST_INSERT_ID();

        END IF;

        -- Insertar en detalle_gastos

        INSERT INTO detalle_gastos (afectarCaja,id_movimiento_caja,tipo_gastos, tipo_pago, id_compras, nro_factura, nro_compras, nro_credito_compras,monto,descripcion)

        VALUES (p_afectarCaja,v_id_movimiento,'Compras', p_tipo_pago, v_IdCompra, p_NumeroFactura, p_Nro_compras, p_Nro_credito_compras,p_total_compra, 'Compra de mercaderia');
     
       END IF;

    -- 2️⃣ Insertar en detalle de compra

    INSERT INTO det_compra (

        IdCompra, IdProducto, Cantidad, PrecioUnitarioCompra,
         subtotalcosto, iva, TotalCosto,
        codigo_barra, nro_boleta
    )

    SELECT 

        v_IdCompra, 
        j.IdProducto,
        j.cantidad,
        j.PrecioUnitarioCompra,
        j.subtotalcosto,
        j.iva,
        j.TotalCosto,
        j.codigo_barra,
        p_Nro_compras        

    FROM JSON_TABLE(p_detalle, '$[*]' 

        COLUMNS (

            IdProducto INT PATH '$.id_producto',
            cantidad DECIMAL(10,2) PATH '$.cantidad',
            PrecioUnitarioCompra DECIMAL(10,2) PATH '$.precio_compra_producto',
            subtotalcosto DECIMAL(10,2) PATH '$.sub_total',
            iva DECIMAL(10,2) PATH '$.iva',
            TotalCosto DECIMAL(10,2) PATH '$.total',
            codigo_barra VARCHAR(25) PATH '$.codigo_producto'
        )

    ) AS j;

    -- 3️⃣ Actualizar stock en la tabla `producto`

    UPDATE producto p

    JOIN (

        SELECT 

            IdProducto,
            SUM(cantidad) AS cantidad_comprada

        FROM JSON_TABLE(p_detalle, '$[*]' 

            COLUMNS (

                IdProducto INT PATH '$.id_producto',
                cantidad DECIMAL(10,2) PATH '$.cantidad'
            )

        ) AS j

        GROUP BY IdProducto

    ) AS detalles_compra

    ON p.id_producto = detalles_compra.IdProducto
    SET p.stock_producto = p.stock_producto + detalles_compra.cantidad_comprada;

    -- 4️⃣ Insertar o actualizar en stock_producto

    INSERT INTO lote_producto (
        id_usuario_creacion,id_producto, cantidad_comprada, cantidad_bonificada, stock_disponible, 
        costo_unitario, fecha_vencimiento
    )

    SELECT 
        p_IdUsuario,
        j.IdProducto,
        j.cantidad,
        0, -- Ajustar cantidad bonificada si aplica
        j.cantidad,
        j.PrecioUnitarioCompra,
        j.vence -- Modificar si manejas fecha de vencimiento
    FROM JSON_TABLE(p_detalle, '$[*]' 

        COLUMNS (

            IdProducto INT PATH '$.id_producto',
            cantidad DECIMAL(10,2) PATH '$.cantidad',
            PrecioUnitarioCompra DECIMAL(10,2) PATH '$.precio_compra_producto',
            vence DATE PATH '$.vence'

        )

    ) AS j;

       UPDATE lote_producto lp
                 JOIN det_compra dc ON 
                   lp.id_producto = dc.IdProducto AND
                   lp.costo_unitario = dc.PrecioUnitarioCompra AND
                   lp.cantidad_comprada = dc.Cantidad AND
                   dc.IdCompra = v_IdCompra
                  SET lp.id_det_compra = dc.IdDetCompra
                  WHERE lp.id_det_compra IS NULL;
   -- ON DUPLICATE KEY UPDATE 

     --   cantidad_comprada = cantidad_comprada + VALUES(cantidad_comprada),
     --   stock_disponible = stock_disponible + VALUES(stock_disponible);

    -- 5️⃣ Registrar en `kardex`

INSERT INTO kardex (
    id_usuario_creacion,id_producto, codigo_producto, concepto, comprobante, 
    entrada_unidades, entrada_costo_unitario, entrada_costo_total, 
    existencia_unidades, existencia_costo_unitario, existencia_costo_total
)

SELECT 
    p_IdUsuario,
    j.IdProducto,
    j.codigo_barra,
    'Compra de productos',
    p_Nro_compras,
    j.cantidad,
    j.PrecioUnitarioCompra,
    j.TotalCosto,

    (SELECT stock_producto FROM producto WHERE id_producto = j.IdProducto),  -- Existencia antes de la compra

    j.PrecioUnitarioCompra, 

    ((SELECT stock_producto FROM producto WHERE id_producto = j.IdProducto) + j.cantidad) * j.PrecioUnitarioCompra -- Nuevo costo total

FROM JSON_TABLE(p_detalle, '$[*]' 

    COLUMNS (

        IdProducto INT PATH '$.id_producto',
        cantidad DECIMAL(10,2) PATH '$.cantidad',
        PrecioUnitarioCompra DECIMAL(10,2) PATH '$.precio_compra_producto',
        TotalCosto DECIMAL(10,2) PATH '$.total',
        codigo_barra VARCHAR(25) PATH '$.codigo_producto'

    )

) AS j

JOIN producto p ON p.id_producto = j.IdProducto;

INSERT INTO log_auditoria (tabla, accion, usuario_id, detalle, id_registro_afectado, modulo)
VALUES (
  'compras/det_compra/producto/kardex/Movimiento en caja/gasto', 
  'INSERT/UPDATE', 
  p_IdUsuario, 
  CONCAT('Compra registrada completa con ID: ', v_IdCompra), 
  v_IdCompra, 
  'Compra'
);

       -- Confirmar transacción

    COMMIT;

     SELECT 'Se realizado con éxito la Compra.' AS resultado; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_GuardarMarca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_GuardarMarca`(
 in p_id_marca int ,
 in p_nombre VARCHAR(50),
 in p_id_usuario int)
BEGIN

    DECLARE existe_nombre INT DEFAULT 0;
    DECLARE mensaje VARCHAR(255);
         

     -- Eliminar espacios al inicio y fin
    SET p_nombre = LTRIM(RTRIM(p_nombre));

    -- Verifica si el nombre ya existe (excluyendo el mismo ID en caso de actualización)
    IF p_id_marca > 0 THEN
        SELECT COUNT(*) INTO existe_nombre
        FROM marca
        WHERE nombre = p_nombre
          AND id_marca <> p_id_marca;
    ELSE
        SELECT COUNT(*) INTO existe_nombre
        FROM marca
        WHERE nombre = p_nombre;
    END IF;

    IF existe_nombre > 0 THEN
        SET mensaje = 'Warning: Ya existe una Marca con el mismo nombre.';
    ELSE
        IF p_id_marca > 0 THEN
            -- Actualización
            UPDATE marca
            SET nombre = p_nombre,
                id_usuario_actualizacion=p_id_usuario
            WHERE id_marca = p_id_marca;
                       
      --      INSERT INTO log_auditoria (tabla, accion, usuario_id, detalle)
      --      VALUES (tablas, 'Actualizar', p_id_usuario,
       --             CONCAT('Actualizar una Categoria con el id: ', p_id_categoria));

            SET mensaje = 'Marca actualizada con éxito.';
        ELSE
            -- Inserción
            INSERT INTO marca (nombre,id_usuario_creacion )
            VALUES (p_nombre,p_id_usuario);

        --    INSERT INTO log_auditoria (tabla, accion, usuario_id, detalle)
         --   VALUES (tablas, 'Registrar', p_id_usuario, 'Registrar una Categoria');

            SET mensaje = 'Marca registrada con éxito.';
         
        END IF;
    END IF;

    -- Devuelve el mensaje final
    SELECT mensaje AS resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_GuardarMedidas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_GuardarMedidas`( 
    IN p_id_medidas INT,
    IN p_nombre VARCHAR(200),
    IN p_nombre_corto VARCHAR(20),
    IN p_id_usuario INT
)
BEGIN
  DECLARE tablas VARCHAR(30);
    DECLARE v_count_nombre INT;
    DECLARE v_count_nombre_corto INT;
    DECLARE mensaje VARCHAR(255);

    SET tablas = 'medidas';

        -- Eliminar espacios al inicio y fin
    SET p_nombre = LTRIM(RTRIM(p_nombre));
    SET p_nombre_corto = LTRIM(RTRIM(p_nombre_corto));
        
    -- Verificar si el nombre ya existe
    IF (p_id_medidas > 0) THEN
        SELECT COUNT(*) INTO v_count_nombre
        FROM medidas
        WHERE nombre = p_nombre AND id_medida <> p_id_medidas;

        SELECT COUNT(*) INTO v_count_nombre_corto
        FROM medidas
        WHERE nombre_corto = p_nombre_corto AND id_medida <> p_id_medidas;
    ELSE
        SELECT COUNT(*) INTO v_count_nombre
        FROM medidas
        WHERE nombre = p_nombre;

        SELECT COUNT(*) INTO v_count_nombre_corto
        FROM medidas
        WHERE nombre_corto = p_nombre_corto;
    END IF;

    -- Validaciones
    IF v_count_nombre > 0 THEN
        SET mensaje = 'Warning: Ya existe una medida con el mismo nombre.';
    ELSEIF v_count_nombre_corto > 0 THEN
        SET mensaje = 'Warning: Ya existe una medida con el mismo nombre corto.';
    ELSE
        IF (p_id_medidas > 0) THEN
            UPDATE medidas
            SET nombre = p_nombre,
                nombre_corto = p_nombre_corto
            WHERE id_medida = p_id_medidas;

            INSERT INTO log_auditoria (
                tabla, accion, usuario_id, detalle
            ) VALUES (
                tablas, 'Actualizar', p_id_usuario,
                CONCAT('Actualizar una Medidas con el id: ', p_id_medidas)
            );

            SET mensaje = 'Medidas actualizada con éxito.';
        ELSE
            INSERT INTO medidas(nombre, nombre_corto)
            VALUES (p_nombre, p_nombre_corto);

            INSERT INTO log_auditoria (
                tabla, accion, usuario_id, detalle
            ) VALUES (
                tablas, 'Registrar', p_id_usuario,
                'Registrar una Medidas'
            );

            SET mensaje = 'Medidas registrada con éxito.';
        END IF;
    END IF;

    SELECT mensaje AS resultado;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_GuardarMovimientoEntrada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_GuardarMovimientoEntrada`(
    IN p_id INT,
    IN p_IdUsuario INT,
    IN p_IdCaja INT,
    IN p_tipo_pago INT,
    IN p_Monto DECIMAL(10,2),
    IN p_descripcion VARCHAR(200)
)
BEGIN
    DECLARE v_id_arqueo INT;
    DECLARE v_id_movimiento INT;
    DECLARE mensaje VARCHAR(255);

    -- Obtener el arqueo de caja abierto
    SELECT id_arqueo_caja INTO v_id_arqueo
    FROM arqueo_caja
    WHERE id_usuario = p_IdUsuario AND id_caja = p_IdCaja AND estado = 1
    ORDER BY fecha_inicio DESC
    LIMIT 1;

    IF v_id_arqueo IS NOT NULL THEN

        -- Obtener movimiento
        SELECT id_movimiento_caja INTO v_id_movimiento
        FROM movimiento_caja
        WHERE id_arqueo = v_id_arqueo AND id_usuario = p_IdUsuario AND estado = 1 
              AND tipo_movimiento = 'Ingreso' AND tipo_referencia = 'Ingreso'
        ORDER BY fecha_registro DESC
        LIMIT 1;

        IF v_id_movimiento IS NULL THEN
            -- Insertar movimiento en caja
            INSERT INTO movimiento_caja (id_arqueo, tipo_movimiento, tipo_referencia, id_usuario)
            VALUES (v_id_arqueo, 'Ingreso', 'Ingreso', p_IdUsuario);

            SET v_id_movimiento = LAST_INSERT_ID();
        END IF;

        IF p_id IS NOT NULL AND p_id > 0 THEN
            -- Actualizar ingreso existente
            UPDATE detalle_ingresos
            SET tipo_pago = p_tipo_pago,
                monto = p_Monto,
                descripcion = p_descripcion
            WHERE id = p_id;
            
            SET mensaje = 'El ingreso se actualizó con éxito.';
        ELSE
            -- Insertar nuevo ingreso
            INSERT INTO detalle_ingresos (id_movimiento_caja, tipo_ingresos, tipo_pago, monto, descripcion)
            VALUES (v_id_movimiento, 'Otros', p_tipo_pago, p_Monto, p_descripcion);
            
            SET mensaje = 'El ingreso se registró con éxito.';
        END IF;
    ELSE
        SET mensaje = 'No existe un arqueo de caja abierto para este usuario y caja.';
    END IF;

    -- Devolver el mensaje final
    SELECT mensaje AS resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_GuardarMovimientoSalida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_GuardarMovimientoSalida`(
    IN p_id INT,
    IN p_IdUsuario INT,
    IN p_IdCaja INT,
    IN p_tipo_pago INT,
    IN p_monto DECIMAL(10,2),
    IN p_descripcion VARCHAR(200)
)
BEGIN
    DECLARE v_id_arqueo INT;
    DECLARE v_id_movimiento INT;
    DECLARE mensaje VARCHAR(255);

    -- Obtener el arqueo de caja abierto
    SELECT id_arqueo_caja INTO v_id_arqueo
    FROM arqueo_caja
    WHERE id_usuario = p_IdUsuario AND id_caja = p_IdCaja AND estado = 1
    ORDER BY fecha_inicio DESC
    LIMIT 1;

    IF v_id_arqueo IS NOT NULL THEN

        -- Obtener movimiento de egreso/gasto
        SELECT id_movimiento_caja INTO v_id_movimiento
        FROM movimiento_caja
        WHERE id_arqueo = v_id_arqueo AND id_usuario = p_IdUsuario AND estado = 1 
              AND tipo_movimiento = 'Egreso' AND tipo_referencia = 'Gasto'
        ORDER BY fecha_registro DESC
        LIMIT 1;

        IF v_id_movimiento IS NULL THEN
            -- Insertar movimiento en caja
            INSERT INTO movimiento_caja (id_arqueo, tipo_movimiento, tipo_referencia, id_usuario)
            VALUES (v_id_arqueo, 'Egreso', 'Gasto', p_IdUsuario);

            SET v_id_movimiento = LAST_INSERT_ID();
        END IF;

        IF p_id IS NOT NULL AND p_id > 0 THEN
            -- Actualizar gasto existente
            UPDATE detalle_gastos
            SET tipo_pago = p_tipo_pago,
                monto = p_monto,
                descripcion = p_descripcion
            WHERE id = p_id;

            SET mensaje = 'El gasto se actualizó con éxito.';
        ELSE
            -- Insertar nuevo gasto
            INSERT INTO detalle_gastos (id_movimiento_caja, afectarCaja, tipo_gastos, tipo_pago, monto, descripcion)
            VALUES (v_id_movimiento, 1, 'Otros', p_tipo_pago, p_monto, p_descripcion);

            SET mensaje = 'El gasto se registró con éxito.';
        END IF;
    ELSE
        SET mensaje = 'No existe un arqueo de caja abierto para este usuario y caja.';
    END IF;

    -- Devuelve el mensaje final
    SELECT mensaje AS resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_GuardarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_GuardarProducto`(
    IN p_id_producto INT,
    IN p_codigo_barra VARCHAR(20),
    IN p_id_categoria_producto INT,
    IN p_id_marca_producto INT,
    IN p_id_unidades INT,
    IN p_descripcion_producto VARCHAR(40),
    IN p_img_producto VARCHAR(100),
    IN p_precio_compra_producto DECIMAL(10,2),
    IN p_precio_venta_producto DECIMAL(10,2),
    IN p_precio_1_producto DECIMAL(10,2),
    IN p_precio_2_producto DECIMAL(10,2),
    IN p_lleva_iva_producto INT,
    IN p_stock_producto FLOAT,
    IN p_minimo_stock_producto FLOAT,    
    IN p_perecedero_producto INT,
    IN p_id_usuario INT,
    IN p_fecha_vencimiento DATE
)
BEGIN
    DECLARE mensaje VARCHAR(255);
    DECLARE J_concepto VARCHAR(600);
    DECLARE J_IdProducto INT;
    DECLARE existe INT;
    DECLARE asiento_id INT;
    DECLARE  costo_total_producto DECIMAL(10.2);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SELECT 'Error: interno en la base de datos.' AS resultado;
    END;

    START TRANSACTION;

    main: BEGIN
       
	        -- Eliminar espacios al inicio y fin
    SET p_codigo_barra = LTRIM(RTRIM(p_codigo_barra));
	SET p_descripcion_producto = LTRIM(RTRIM(p_descripcion_producto));
	SET costo_total_producto=p_stock_producto*p_precio_compra_producto;
	    -- Validación de código de barra duplicado
        IF p_id_producto > 0 THEN
            SELECT COUNT(*) INTO existe 
            FROM producto 
            WHERE codigo_barra = p_codigo_barra AND id_producto != p_id_producto;
        ELSE
            SELECT COUNT(*) INTO existe 
            FROM producto 
            WHERE codigo_barra = p_codigo_barra;
        END IF;

        IF existe > 0 THEN
            SET mensaje = 'Warning: El código de barra ya está registrado para otro producto.';
            SELECT mensaje AS resultado;
            LEAVE main;
        END IF;

        -- Actualización
        IF p_id_producto > 0 THEN
            UPDATE producto SET
                id_categoria_producto = p_id_categoria_producto,
                id_marca=p_id_marca_producto,
                id_unidades = p_id_unidades,
                descripcion_producto = p_descripcion_producto,
                precio_venta_producto = p_precio_venta_producto,
                precio_1_producto = p_precio_1_producto,
                precio_2_producto = p_precio_2_producto,
                lleva_iva_producto = p_lleva_iva_producto,
                minimo_stock_producto = p_minimo_stock_producto,
                perecedero_producto = p_perecedero_producto,
                id_usuario_actualizacion = p_id_usuario,
                 img_producto = p_img_producto
            WHERE id_producto = p_id_producto;

            -- Log auditoría
            INSERT INTO log_auditoria (
                tabla, accion, usuario_id, detalle, id_registro_afectado, modulo
            ) VALUES (
                'producto', 'UPDATE', p_id_usuario,
                CONCAT('Actualización del producto. ID: ', p_id_producto, ', Descripción: ', p_descripcion_producto),
                p_id_producto, 'PRODUCTO'
            );

            SET mensaje = 'Producto actualizado con éxito.';

        -- Inserción
        ELSE
            INSERT INTO producto (
                codigo_barra, id_categoria_producto,id_marca, id_unidades,
                descripcion_producto, img_producto, precio_compra_producto,
                precio_venta_producto, precio_1_producto, precio_2_producto,
                lleva_iva_producto, stock_producto,
                minimo_stock_producto, perecedero_producto,
                id_usuario_creacion
            ) VALUES (
                p_codigo_barra, p_id_categoria_producto, p_id_marca_producto,p_id_unidades,
                p_descripcion_producto, p_img_producto, p_precio_compra_producto,
                p_precio_venta_producto, p_precio_1_producto, p_precio_2_producto,
                p_lleva_iva_producto, p_stock_producto,
                p_minimo_stock_producto, p_perecedero_producto,
                p_id_usuario
            );

            SET J_IdProducto = LAST_INSERT_ID();

            -- Log auditoría
            INSERT INTO log_auditoria (
                tabla, accion, usuario_id, detalle, id_registro_afectado, modulo
            ) VALUES (
                'producto / lote_producto / kardex', 'INSERT', p_id_usuario,
                CONCAT('Registro de producto nuevo. Código: ', p_codigo_barra, ', Descripción: ', p_descripcion_producto),
                J_IdProducto, 'PRODUCTO'
            );

            -- Insertar lote
            IF p_perecedero_producto = 1 THEN
                INSERT INTO lote_producto (
                    id_usuario_creacion, id_producto,
                    cantidad_comprada, stock_disponible,
                    costo_unitario, fecha_vencimiento
                ) VALUES (
                    p_id_usuario, J_IdProducto,
                    p_stock_producto, p_stock_producto,
                    p_precio_compra_producto, p_fecha_vencimiento
                );
            ELSE
                INSERT INTO lote_producto (
                    id_usuario_creacion, id_producto,
                    cantidad_comprada, stock_disponible,
                    costo_unitario
                ) VALUES (
                    p_id_usuario, J_IdProducto,
                    p_stock_producto, p_stock_producto,
                    p_precio_compra_producto
                );
            END IF;

            -- Insertar en Kardex
            SET J_concepto = 'INVENTARIO INICIAL';
            INSERT INTO KARDEX (
                id_usuario_creacion, id_producto, codigo_producto,
                concepto, existencia_unidades, existencia_costo_unitario,
                existencia_costo_total
            ) VALUES (
                p_id_usuario, J_IdProducto, p_codigo_barra,
                J_concepto, p_stock_producto, p_precio_compra_producto,
                costo_total_producto
            );

            -- Asiento contable
            INSERT INTO asiento_contable (
                fecha, descripcion, tipo_asiento, id_referencia,
                modulo_origen, total_debe, total_haber, tipo_referencia
            ) VALUES (
                CURDATE(), CONCAT('Inventario inicial del producto ', p_descripcion_producto),
                'INVENTARIO_INICIAL', J_IdProducto,
                'PRODUCTO', costo_total_producto, costo_total_producto,
                'producto'
            );

            SET asiento_id = LAST_INSERT_ID();

            -- Detalle asiento - Debe
            INSERT INTO detalle_asiento (
                id_asiento, id_cuenta, debe, descripcion, orden
            ) VALUES (
                asiento_id, 9, costo_total_producto,CONCAT( 'Registro de inventario inicial', p_descripcion_producto), 1
            );

            -- Detalle asiento - Haber
            INSERT INTO detalle_asiento (
                id_asiento, id_cuenta, haber, descripcion, orden
            ) VALUES (
                asiento_id, 13, costo_total_producto, CONCAT('Contrapartida por ajuste de producto ', p_descripcion_producto), 2
            );

            SET mensaje = 'Producto registrado con éxito.';
        END IF;

        COMMIT;
        SELECT mensaje AS resultado;

    END main;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_GuardarProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_GuardarProveedor`(
    IN p_id_proveedor INT,
    IN p_ruc VARCHAR(15), 
    IN p_nombre VARCHAR(100),
    IN p_razon_social VARCHAR(100),
    IN p_telefono VARCHAR(13),
    IN p_email VARCHAR(100),
    IN p_direccion VARCHAR(100), 
    IN p_id_usuario INT
)
BEGIN
    DECLARE v_existe INT DEFAULT 0;
    DECLARE mensaje VARCHAR(255);
    DECLARE tablas VARCHAR(30) DEFAULT 'proveedor';
    DECLARE v_IdProveedor  INT DEFAULT 0;

	-- Eliminar espacios al inicio y fin
    SET p_ruc = LTRIM(RTRIM(p_ruc));
	SET p_nombre = LTRIM(RTRIM(p_nombre));
	SET p_razon_social = LTRIM(RTRIM(p_razon_social));
	SET p_telefono = LTRIM(RTRIM(p_telefono));
    SET p_email = LTRIM(RTRIM(p_email));
	SET p_direccion = LTRIM(RTRIM(p_direccion));
    -- Verificar si el RUC ya existe en otro proveedor
    IF p_id_proveedor > 0 THEN
        SELECT COUNT(*) INTO v_existe
        FROM proveedor
        WHERE ruc = p_ruc AND id_proveedor <> p_id_proveedor;
    ELSE
        SELECT COUNT(*) INTO v_existe
        FROM proveedor
        WHERE ruc = p_ruc;
    END IF;

    IF v_existe > 0 THEN
        SET mensaje = 'Warning: El RUC ingresado ya está registrado.';
    ELSEIF p_id_proveedor > 0 THEN
        -- Actualizar proveedor existente
        UPDATE proveedor
        SET
            ruc = p_ruc, 
            nombre = p_nombre,
            razon_social = p_razon_social,
            telefono = p_telefono,
            email = p_email,
            direccion = p_direccion,
            id_usuario_actualizacion = p_id_usuario,
            fecha_actualizacion = NOW()
        WHERE id_proveedor = p_id_proveedor;
    
        INSERT INTO log_auditoria (tabla, accion, usuario_id, detalle,id_registro_afectado,modulo)
            VALUES (tablas, 'Actualizar', p_id_usuario, 
                CONCAT('Actualizar un Proveedor con el id: ', p_id_proveedor),p_id_proveedor,'Proveedor');

        SET mensaje = 'Proveedor actualizado con éxito.';
    ELSE
        -- Insertar nuevo proveedor
        INSERT INTO proveedor (
            ruc, nombre, razon_social, telefono,
            email, direccion, id_usuario_creacion
        ) VALUES (
            p_ruc, p_nombre, p_razon_social, p_telefono,
            p_email, p_direccion, p_id_usuario
        );
         SET v_IdProveedor = LAST_INSERT_ID();
     
            INSERT INTO log_auditoria (tabla, accion, usuario_id, detalle,id_registro_afectado,modulo)
            VALUES (tablas, 'Actualizar', p_id_usuario, 
                CONCAT('Registrar un Proveedor con el id: ', v_IdProveedor),v_IdProveedor,'Proveedor');
        SET mensaje = 'Proveedor registrado con éxito.';
    END IF;

    -- Devolver resultado
    SELECT mensaje AS resultado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_GuardarVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_GuardarVenta`(
 IN p_IdUsuario INT,

    IN p_IdCaja INT,

    IN p_IdCliente INT,

    IN p_nro_boleta VARCHAR(25),

    IN p_tipo_pago INT,

    IN p_TipoDocumento INT,

    IN p_CantidadTotal DECIMAL(10,2),

    IN p_iva DECIMAL(10,2),

    IN p_subtotal DECIMAL(10,2),

    IN p_total_venta DECIMAL(10,2),

    IN p_ImporteRecibido DECIMAL(10,2),

    IN p_ImporteCambio DECIMAL(10,2),

    IN p_nro_credito_venta VARCHAR(25),

    IN p_detalle JSON -- Se recibe un JSON con los productos vendidos

)
BEGIN

    DECLARE v_IdVenta INT;

    DECLARE v_fecha_registro DATETIME DEFAULT NOW();

    DECLARE v_id_arqueo INT;

    DECLARE v_id_producto INT;

    DECLARE v_cantidad_vender INT;

    -- 1️⃣ Insertar en venta_cabecera

    INSERT INTO ventas (

        IdUsuario, Id_caja, IdCliente, nro_boleta, tipo_pago, 

        TipoDocumento, CantidadTotal, iva, subtotal, total_venta, 

        ImporteRecibido, ImporteCambio, abono_credito, fecha_venta, Activo

    ) VALUES (

        p_IdUsuario, p_IdCaja, p_IdCliente, p_nro_boleta, p_tipo_pago, 

        p_TipoDocumento, p_CantidadTotal, p_iva, p_subtotal, p_total_venta, 

        p_ImporteRecibido, p_ImporteCambio, p_nro_credito_venta, v_fecha_registro, '1'

    );



    SET v_IdVenta = LAST_INSERT_ID();



    -- 2️⃣ Insertar en det_venta

    INSERT INTO det_venta (

        IdVenta, IdProducto, codigo_barra, descripcion_producto, cantidad, 

        PrecioUnidad, iva, Sub_total, total_venta, fecha_venta, Activo

    )

        SELECT 

        v_IdVenta, 

        j.IdProducto,

        j.codigo_barra,

        j.descripcion_producto,

        j.cantidad,

        j.PrecioUnidad,

        j.iva,

        j.Sub_total,

        j.total_venta,

        v_fecha_registro,

        '1'

    FROM JSON_TABLE(p_detalle, '$[*]' 

        COLUMNS (

            IdProducto INT PATH '$.id_producto',

            codigo_barra VARCHAR(25) PATH '$.codigo_barra',

            descripcion_producto VARCHAR(25) PATH '$.descripcion_producto',

            cantidad DECIMAL(10,2) PATH '$.cantidad',

            PrecioUnidad DECIMAL(10,2) PATH '$.precio_venta',

            iva DECIMAL(10,2) PATH '$.iva',

            Sub_total DECIMAL(10,2) PATH '$.subtotal',

            total_venta DECIMAL(10,2) PATH '$.total'

            

        )

    ) AS j;

  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_GuardarVentaCreditos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_GuardarVentaCreditos`(
 IN p_IdUsuario INT,
    IN p_IdCaja INT,
    IN p_IdCliente INT,
    IN p_nro_boleta VARCHAR(25),
    IN p_tipo_pago CHAR(30),
    IN p_TipoDocumento VARCHAR(25),
    IN p_CantidadTotal DECIMAL(10,2),
    IN p_iva DECIMAL(10,2),
    IN p_subtotal DECIMAL(10,2),
    IN p_total_venta DECIMAL(10,2),
    IN p_ImporteRecibido DECIMAL(10,2),
    IN p_ImporteCambio DECIMAL(10,2),
    IN p_nro_credito_venta VARCHAR(25),
    in p_fechaVence DATE,
    IN p_detalle JSON 
)
begin
	
	 DECLARE v_IdVenta INT;
    DECLARE v_id_detalle INT;
    DECLARE v_id_stock INT;
    DECLARE v_cantidad_disponible INT;
   
    
    DECLARE v_cantidad_restante INT;
    DECLARE v_cantidad_bonificada INT;
   
  
    DECLARE v_costo_unitario DECIMAL(10,2);
   -- Kardex
    DECLARE v_stock_actual INT;
    DECLARE v_existencia_costo_total DECIMAL(10,2);
   
    DECLARE v_id_arqueo INT;
    DECLARE v_id_movimiento INT;
   
     -- Variables para recorrer JSON
   DECLARE v_id_producto INT;
   DECLARE v_codigo_barra VARCHAR(25);
   DECLARE v_descripcion_producto VARCHAR(100);
   DECLARE v_cantidad_vender INT;
   DECLARE v_precio_unitario DECIMAL(10,2);
   DECLARE v_iva_item  DECIMAL(10,2);
   DECLARE v_subtotal_item  DECIMAL(10,2);
   DECLARE v_total_venta_item  DECIMAL(10,2);

    DECLARE done INT DEFAULT FALSE;
    
    DECLARE cur CURSOR FOR 
        SELECT 
            IdProducto, codigo_barra, descripcion_producto, cantidad, 
            PrecioUnidad, iva, Sub_total, total_venta
        FROM JSON_TABLE(p_detalle, '$[*]' 
            COLUMNS (
                IdProducto INT PATH '$.id_producto',
                codigo_barra VARCHAR(25) PATH '$.codigo_barra',
                descripcion_producto VARCHAR(100) PATH '$.descripcion_producto',
                cantidad INT PATH '$.cantidad',
                PrecioUnidad DECIMAL(10,2) PATH '$.precio_venta',
                iva DECIMAL(10,2) PATH '$.iva',
                Sub_total DECIMAL(10,2) PATH '$.subtotal',
                total_venta DECIMAL(10,2) PATH '$.total'
            )
        )AS jt;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    -- Manejador de excepciones para hacer rollback si hay un error
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        -- Realizar ROLLBACK para deshacer cualquier cambio si ocurre un error
        ROLLBACK;
      
      SELECT 'Error: Error al procesar la venta.' AS resultado;
    END;

   
    -- 4️⃣ Iniciar Transacción
    START TRANSACTION;
       -- Obtener el arqueo de caja abierto
    SELECT id_arqueo_caja INTO v_id_arqueo
    FROM arqueo_caja
    WHERE id_usuario = p_IdUsuario  and id_caja=p_IdCaja AND estado = 1
    ORDER BY fecha_inicio DESC
    LIMIT 1;
    
     IF v_id_arqueo IS NOT NULL then
      
         -- Obtener movimiento
    SELECT id_movimiento_caja INTO v_id_movimiento
    FROM movimiento_caja
    WHERE id_arqueo= v_id_arqueo and id_usuario = p_IdUsuario AND estado = 1 and tipo_movimiento='Ingreso'
    and tipo_referencia='Ingreso'
    ORDER BY fecha_registro DESC
    LIMIT 1;
    
      if v_id_movimiento is null then
        -- Insertar movimiento en caja
        INSERT INTO movimiento_caja (id_arqueo, tipo_movimiento, tipo_referencia, id_usuario)
        VALUES (v_id_arqueo, 'Ingreso', 'Ingreso', p_IdUsuario);
        
        SET v_id_movimiento = LAST_INSERT_ID();
        END IF;

      
   
    -- 1️⃣ Insertar en ventas (cabecera)
    INSERT INTO ventas (
        id_usuario_creacion, Id_caja, IdCliente, nro_boleta, tipo_pago, 
        TipoDocumento, CantidadTotal, iva, subtotal, total_venta, 
        ImporteRecibido, ImporteCambio, abono_credito
    ) VALUES (
        p_IdUsuario, p_IdCaja, p_IdCliente, p_nro_boleta, 'CREDITO', 
        p_TipoDocumento, p_CantidadTotal, p_iva, p_subtotal, p_total_venta, 
        p_ImporteRecibido, p_ImporteCambio, p_ImporteRecibido
    );

    SET v_IdVenta = LAST_INSERT_ID();
   
           -- Insertar en detalle_ingresos
      
 INSERT INTO detalle_ingresos (id_movimiento_caja, tipo_ingresos, tipo_pago,id_ventas,nro_ventas, monto,descripcion)
        VALUES (v_id_movimiento, 'Ventas', 2, v_IdVenta,p_nro_boleta,p_ImporteRecibido,'Venta de producto');

 --  Insertar en ventas_credito

    INSERT INTO ventas_credito (

        id_venta , id_cliente ,nroCreditoVentas, monto_total ,monto_abonado ,saldo_pendiente ,fecha_vencimiento

    ) VALUES (

        v_IdVenta, p_IdCliente, p_nro_credito_venta,p_total_venta, p_ImporteRecibido, p_ImporteCambio,p_fechaVence

    );


      UPDATE empresa SET 	nro_correlativo_ventas = LPAD(nro_correlativo_ventas + 1,8,'0'),nro_credito_ventas = LPAD(nro_credito_ventas + 1,8,'0')

                  where id_Empresa=1;

   
   -- 2️⃣ Recorrer los productos vendidos
    OPEN cur;
    read_loop: LOOP
      FETCH cur INTO v_id_producto, v_codigo_barra, v_descripcion_producto, v_cantidad_vender, 
              v_precio_unitario, v_iva_item , v_subtotal_item , v_total_venta_item ;

        IF done THEN 
            LEAVE read_loop;
        END IF;
    IF v_id_producto IS NOT NULL THEN
        -- Insertar en det_venta
        INSERT INTO det_venta (
            IdVenta,nro_boleta, IdProducto, codigo_barra, descripcion_producto, cantidad, 
            PrecioUnidad, iva, Sub_total, total_venta
        ) VALUES (
            v_IdVenta,p_nro_boleta, v_id_producto, v_codigo_barra,v_descripcion_producto,v_cantidad_vender,
            v_precio_unitario, v_iva_item  , v_subtotal_item , v_total_venta_item 
        );

        SET v_id_detalle = LAST_INSERT_ID();
        SET v_cantidad_restante = v_cantidad_vender;

        -- 3️⃣ Descontar stock en FIFO
        WHILE v_cantidad_restante > 0 DO
            -- Obtener el stock más antiguo disponible para el producto
            SELECT id_lote, stock_disponible, cantidad_bonificada, costo_unitario
            INTO v_id_stock, v_cantidad_disponible, v_cantidad_bonificada, v_costo_unitario
            FROM lote_producto 
            WHERE id_producto = v_id_producto 
            AND stock_disponible > 0
            ORDER BY fecha_vencimiento ASC
            LIMIT 1;
            
       
            -- Verificar si hay bonificación disponible
      --      IF v_cantidad_bonificada > 0 THEN
      --          IF v_cantidad_restante <= v_cantidad_bonificada THEN
      --              UPDATE lote_producto
      --              SET cantidad_bonificada = cantidad_bonificada - v_cantidad_restante
      --              WHERE id_lote = v_id_stock;
      --              SET v_cantidad_restante = 0;
      --          ELSE
      --              SET v_cantidad_restante = v_cantidad_restante - v_cantidad_bonificada;
      --              UPDATE lote_producto
      --              SET cantidad_bonificada = 0
      --              WHERE id_lote = v_id_stock;
      --          END IF;
      --      END IF;

            -- Descontar del stock normal si aún hay unidades por vender
            IF v_cantidad_restante > 0 THEN
                IF v_cantidad_restante <= v_cantidad_disponible THEN
                    UPDATE lote_producto
                    SET stock_disponible = stock_disponible - v_cantidad_restante
                    WHERE id_lote = v_id_stock;
            
               UPDATE lote_producto
                    SET estado = 0
                   WHERE id_lote = v_id_stock AND stock_disponible = 0;
                    
                    -- Registrar en detalle_venta_stock
                    INSERT INTO det_venta_lote (
                       id_det_venta, id_lote , cantidad_vendida, precio_venta, costo_unitario
                    ) VALUES (
                        v_id_detalle, v_id_stock, v_cantidad_restante, v_precio_unitario, v_costo_unitario
                    );

                    SET v_cantidad_restante = 0;
                ELSE
                    UPDATE lote_producto
                    SET stock_disponible = 0
                    WHERE id_lote = v_id_stock;
                    
                     UPDATE lote_producto
                    SET estado = 0
                   WHERE id_lote = v_id_stock AND stock_disponible = 0;
                    
                    -- Registrar en detalle_venta_stock
                    INSERT INTO det_venta_lote (
                        id_det_venta, id_lote , cantidad_vendida, precio_venta, costo_unitario
                    ) VALUES (
                        v_id_detalle, v_id_stock, v_cantidad_disponible, v_precio_unitario, v_costo_unitario
                    );

                    SET v_cantidad_restante = v_cantidad_restante - v_cantidad_disponible;
                END IF;
            END IF;
        END WHILE;
       
       
       
       -- 4️⃣ Registrar salida en `kardex`
        SELECT stock_producto INTO v_stock_actual FROM producto WHERE id_producto = v_id_producto;
        SET v_stock_actual = v_stock_actual - v_cantidad_vender;
        SET v_existencia_costo_total = v_stock_actual * v_costo_unitario;

        INSERT INTO kardex (
            id_usuario_creacion,id_producto, codigo_producto, concepto, comprobante, 
            salidad_unidades, salidad_costo_unitario, salidad_costo_total, 
            existencia_unidades, existencia_costo_unitario, existencia_costo_total
        ) VALUES (
           p_IdUsuario, v_id_producto, v_codigo_barra, 'Venta de producto', p_nro_boleta, 
            v_cantidad_vender, v_costo_unitario, v_cantidad_vender * v_costo_unitario, 
            v_stock_actual, v_costo_unitario, v_existencia_costo_total
        );

        -- 5️⃣ Actualizar stock en `producto`
        UPDATE producto SET stock_producto = v_stock_actual WHERE id_producto = v_id_producto;
 
       
       ELSE
         
            -- Si el producto no existe, solo insertar en det_venta sin stock
        INSERT INTO det_venta (
            IdVenta, nro_boleta, IdProducto, codigo_barra, descripcion_producto, cantidad, 
            PrecioUnidad, iva, Sub_total, total_venta
        ) VALUES (
            v_IdVenta, p_nro_boleta, NULL, v_codigo_barra, v_descripcion_producto, v_cantidad_vender,
            v_precio_unitario, v_iva_item  , v_subtotal_item , v_total_venta_item     
        );
       END IF;
       
    END LOOP;

    CLOSE cur;
 
       END IF;
       -- Confirmar transacción
    COMMIT;
     
        SELECT 'Se realizado con éxito la venta.' AS resultado; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_GuardarVentaEfectivo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_GuardarVentaEfectivo`(
    IN p_IdUsuario INT,
    IN p_IdCaja INT,
    IN p_IdCliente INT,
    IN p_nro_boleta VARCHAR(25),
    IN p_tipo_pago CHAR(30),
    IN p_TipoDocumento VARCHAR(25),
    IN p_CantidadTotal DECIMAL(10,2),
    IN p_iva DECIMAL(10,2),
    IN p_subtotal DECIMAL(10,2),
    IN p_total_venta DECIMAL(10,2),
    IN p_ImporteRecibido DECIMAL(10,2),
    IN p_ImporteCambio DECIMAL(10,2),
    IN p_nro_credito_venta VARCHAR(25),
    in p_fechaVence DATE,
    IN p_detalle JSON 
)
begin
	
	 DECLARE v_IdVenta INT;
    DECLARE v_id_detalle INT;
    DECLARE v_id_stock INT;
    DECLARE v_cantidad_disponible INT;
   
    
    DECLARE v_cantidad_restante INT;
    DECLARE v_cantidad_bonificada INT;
   
  
    DECLARE v_costo_unitario DECIMAL(10,2);
   -- Kardex
    DECLARE v_stock_actual INT;
    DECLARE v_existencia_costo_total DECIMAL(10,2);
   
    DECLARE v_id_arqueo INT;
    DECLARE v_id_movimiento INT;
   
     -- Variables para recorrer JSON
   DECLARE v_id_producto INT;
   DECLARE v_codigo_barra VARCHAR(25);
   DECLARE v_descripcion_producto VARCHAR(100);
   DECLARE v_cantidad_vender INT;
   DECLARE v_precio_unitario DECIMAL(10,2);
   DECLARE v_iva_item  DECIMAL(10,2);
   DECLARE v_subtotal_item  DECIMAL(10,2);
   DECLARE v_total_venta_item  DECIMAL(10,2);

    DECLARE done INT DEFAULT FALSE;
    
    DECLARE cur CURSOR FOR 
        SELECT 
            IdProducto, codigo_barra, descripcion_producto, cantidad, 
            PrecioUnidad, iva, Sub_total, total_venta
        FROM JSON_TABLE(p_detalle, '$[*]' 
            COLUMNS (
                IdProducto INT PATH '$.id_producto',
                codigo_barra VARCHAR(25) PATH '$.codigo_barra',
                descripcion_producto VARCHAR(100) PATH '$.descripcion_producto',
                cantidad INT PATH '$.cantidad',
                PrecioUnidad DECIMAL(10,2) PATH '$.precio_venta',
                iva DECIMAL(10,2) PATH '$.iva',
                Sub_total DECIMAL(10,2) PATH '$.subtotal',
                total_venta DECIMAL(10,2) PATH '$.total'
            )
        )AS jt;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    -- Manejador de excepciones para hacer rollback si hay un error
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        -- Realizar ROLLBACK para deshacer cualquier cambio si ocurre un error
        ROLLBACK;
      
      SELECT 'Error: Error al procesar la venta.' AS resultado;
    END;

   
    -- 4️⃣ Iniciar Transacción
    START TRANSACTION;
       -- Obtener el arqueo de caja abierto
    SELECT id_arqueo_caja INTO v_id_arqueo
    FROM arqueo_caja
    WHERE id_usuario = p_IdUsuario  and id_caja=p_IdCaja AND estado = 1
    ORDER BY fecha_inicio DESC
    LIMIT 1;
    
     IF v_id_arqueo IS NOT NULL then
      
         -- Obtener movimiento
    SELECT id_movimiento_caja INTO v_id_movimiento
    FROM movimiento_caja
    WHERE id_arqueo= v_id_arqueo and id_usuario = p_IdUsuario AND estado = 1 and tipo_movimiento='Ingreso'
    and tipo_referencia='Ingreso'
    ORDER BY fecha_registro DESC
    LIMIT 1;
    
      if v_id_movimiento is null then
        -- Insertar movimiento en caja
        INSERT INTO movimiento_caja (id_arqueo, tipo_movimiento, tipo_referencia, id_usuario)
        VALUES (v_id_arqueo, 'Ingreso', 'Ingreso', p_IdUsuario);
        
        SET v_id_movimiento = LAST_INSERT_ID();
        END IF;

      
   
    -- 1️⃣ Insertar en ventas (cabecera)
    INSERT INTO ventas (
        id_usuario_creacion, Id_caja, IdCliente, nro_boleta, tipo_pago, 
        TipoDocumento, CantidadTotal, iva, subtotal, total_venta, 
        ImporteRecibido, ImporteCambio, abono_credito
    ) VALUES (
        p_IdUsuario, p_IdCaja, p_IdCliente, p_nro_boleta, 'EFECTIVO', 
        p_TipoDocumento, p_CantidadTotal, p_iva, p_subtotal, p_total_venta, 
        p_ImporteRecibido, p_ImporteCambio, 0
    );

    SET v_IdVenta = LAST_INSERT_ID();
   
           -- Insertar en detalle_ingresos
      
 INSERT INTO detalle_ingresos (id_movimiento_caja, tipo_ingresos, tipo_pago,id_ventas,nro_ventas, monto,descripcion)
        VALUES (v_id_movimiento, 'Ventas', 1, v_IdVenta,p_nro_boleta,p_ImporteRecibido,'Venta de producto');

    UPDATE empresa SET 	nro_correlativo_ventas = LPAD(nro_correlativo_ventas + 1,8,'0');
   
   -- 2️⃣ Recorrer los productos vendidos
    OPEN cur;
    read_loop: LOOP
      FETCH cur INTO v_id_producto, v_codigo_barra, v_descripcion_producto, v_cantidad_vender, 
              v_precio_unitario, v_iva_item , v_subtotal_item , v_total_venta_item ;

        IF done THEN 
            LEAVE read_loop;
        END IF;
    IF v_id_producto IS NOT NULL THEN
        -- Insertar en det_venta
        INSERT INTO det_venta (
            IdVenta,nro_boleta, IdProducto, codigo_barra, descripcion_producto, cantidad, 
            PrecioUnidad, iva, Sub_total, total_venta
        ) VALUES (
            v_IdVenta,p_nro_boleta, v_id_producto, v_codigo_barra,v_descripcion_producto,v_cantidad_vender,
            v_precio_unitario, v_iva_item  , v_subtotal_item , v_total_venta_item 
        );

        SET v_id_detalle = LAST_INSERT_ID();
        SET v_cantidad_restante = v_cantidad_vender;

        -- 3️⃣ Descontar stock en FIFO
        WHILE v_cantidad_restante > 0 DO
            -- Obtener el stock más antiguo disponible para el producto
            SELECT id_lote, stock_disponible, cantidad_bonificada, costo_unitario
            INTO v_id_stock, v_cantidad_disponible, v_cantidad_bonificada, v_costo_unitario
            FROM lote_producto 
            WHERE id_producto = v_id_producto 
            AND stock_disponible > 0
            ORDER BY fecha_vencimiento ASC
            LIMIT 1;
            
       
            -- Verificar si hay bonificación disponible
         --   IF v_cantidad_bonificada > 0 THEN
          --      IF v_cantidad_restante <= v_cantidad_bonificada THEN
         --           UPDATE lote_producto
         --           SET cantidad_bonificada = cantidad_bonificada - v_cantidad_restante
         --           WHERE id_lote = v_id_stock;
         --           SET v_cantidad_restante = 0;
         --       ELSE
         --           SET v_cantidad_restante = v_cantidad_restante - v_cantidad_bonificada;
         --           UPDATE lote_producto
         --           SET cantidad_bonificada = 0
         --           WHERE id_lote = v_id_stock;
        --        END IF;
        --    END IF;

            -- Descontar del stock normal si aún hay unidades por vender
            IF v_cantidad_restante > 0 THEN
                IF v_cantidad_restante <= v_cantidad_disponible THEN
                    UPDATE lote_producto
                    SET stock_disponible = stock_disponible - v_cantidad_restante
                    WHERE id_lote = v_id_stock;
            
                   UPDATE lote_producto
                    SET estado = 0
                   WHERE id_lote = v_id_stock AND stock_disponible = 0;
                    
                    -- Registrar en detalle_venta_stock
                    INSERT INTO det_venta_lote (
                       id_det_venta, id_lote , cantidad_vendida, precio_venta, costo_unitario
                    ) VALUES (
                        v_id_detalle, v_id_stock, v_cantidad_restante, v_precio_unitario, v_costo_unitario
                    );

                    SET v_cantidad_restante = 0;
                ELSE
                    UPDATE lote_producto
                    SET stock_disponible = 0
                    WHERE id_lote = v_id_stock;
                    
                    UPDATE lote_producto
                    SET estado = 0
                   WHERE id_lote = v_id_stock AND stock_disponible = 0;
                    
                    -- Registrar en detalle_venta_stock
                    INSERT INTO det_venta_lote (
                        id_det_venta, id_lote , cantidad_vendida, precio_venta, costo_unitario
                    ) VALUES (
                        v_id_detalle, v_id_stock, v_cantidad_disponible, v_precio_unitario, v_costo_unitario
                    );

                    SET v_cantidad_restante = v_cantidad_restante - v_cantidad_disponible;
                END IF;
            END IF;
        END WHILE;
       
       
       
       -- 4️⃣ Registrar salida en `kardex`
        SELECT stock_producto INTO v_stock_actual FROM producto WHERE id_producto = v_id_producto;
        SET v_stock_actual = v_stock_actual - v_cantidad_vender;
        SET v_existencia_costo_total = v_stock_actual * v_costo_unitario;

        INSERT INTO kardex (
            id_usuario_creacion,id_producto, codigo_producto, concepto, comprobante, 
            salidad_unidades, salidad_costo_unitario, salidad_costo_total, 
            existencia_unidades, existencia_costo_unitario, existencia_costo_total
        ) VALUES (
           p_IdUsuario, v_id_producto, v_codigo_barra, 'Venta de producto', p_nro_boleta, 
            v_cantidad_vender, v_costo_unitario, v_cantidad_vender * v_costo_unitario, 
            v_stock_actual, v_costo_unitario, v_existencia_costo_total
        );

        -- 5️⃣ Actualizar stock en `producto`
        UPDATE producto SET stock_producto = v_stock_actual WHERE id_producto = v_id_producto;
 
       
       ELSE
         
            -- Si el producto no existe, solo insertar en det_venta sin stock
        INSERT INTO det_venta (
            IdVenta, nro_boleta, IdProducto, codigo_barra, descripcion_producto, cantidad, 
            PrecioUnidad, iva, Sub_total, total_venta
        ) VALUES (
            v_IdVenta, p_nro_boleta, NULL, v_codigo_barra, v_descripcion_producto, v_cantidad_vender,
            v_precio_unitario, v_iva_item  , v_subtotal_item , v_total_venta_item     
        );
       END IF;
       
    END LOOP;

    CLOSE cur;
 
       END IF;
       -- Confirmar transacción
    COMMIT;
     
        SELECT 'Se realizado con éxito la venta.' AS resultado; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_guardar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_guardar_usuario`(
    IN p_id_usuario_logeado INT,
    IN p_id_usuario INT,
    IN p_cedula VARCHAR(45),
    IN p_nombre_usuario VARCHAR(100),
    IN p_apellido_usuario VARCHAR(100),
    IN p_usuario VARCHAR(100),
    IN p_clave TEXT,
    IN p_id_perfil_usuario INT,
    IN p_id_caja INT,
    IN p_email VARCHAR(45),
    IN p_direccion VARCHAR(45),
    IN p_telefono VARCHAR(45),
    IN p_landmarks VARCHAR(200),
    IN p_img VARCHAR(600),
    IN p_ciudad VARCHAR(100)
)
BEGIN
     DECLARE mensaje VARCHAR(255);
	IF p_id_usuario IS NULL OR p_id_usuario = 0 THEN
        -- Insertar nuevo usuario
        INSERT INTO usuarios (
            cedula,
            nombre_usuario,
            apellido_usuario,
            usuario,
            clave,
            id_perfil_usuario,
            id_caja,
            email,
            direccion,
            telefono,
            landmarks,
            img,
            ciudad
        ) VALUES (
            p_cedula,
            p_nombre_usuario,
            p_apellido_usuario,
            p_usuario,
            p_clave,
            p_id_perfil_usuario,
            p_id_caja,
            p_email,
            p_direccion,
            p_telefono,
            p_landmarks,
            p_img,
            p_ciudad
        );
 SET mensaje = 'Usuario registrada con éxito.';
    ELSE
        -- Actualizar usuario existente
        UPDATE usuarios
        SET
            cedula = p_cedula,
            nombre_usuario = p_nombre_usuario,
            apellido_usuario = p_apellido_usuario,
            usuario = p_usuario,
            clave = p_clave,
            id_perfil_usuario = p_id_perfil_usuario,
            id_caja = p_id_caja,
            email = p_email,
            direccion = p_direccion,
            telefono = p_telefono,
            landmarks = p_landmarks,
            img = p_img,
            ciudad=p_ciudad
        WHERE id_usuario = p_id_usuario;
  SET mensaje = 'Usuario actualizada con éxito';
    END IF;

SELECT mensaje AS resultado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_InsertarDetalleVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_InsertarDetalleVenta`(
IN p_IdVenta INT,
    IN p_IdProducto INT,
    IN p_Cantidad INT,
    IN p_PrecioUnitario DECIMAL(10,2),
    IN p_Descuento DECIMAL(10,2),
    IN p_Total DECIMAL(10,2)
)
BEGIN
    DECLARE v_Subtotal DECIMAL(10,2);
    DECLARE v_NroBoleta VARCHAR(50);

    -- 1️⃣ Calcular subtotal
    SET v_Subtotal = (p_Cantidad * p_PrecioUnitario) - p_Descuento;

    -- 2️⃣ Insertar detalle de venta
    INSERT INTO det_venta (
        IdVenta, IdProducto, Cantidad, PrecioUnitario, Descuento, Subtotal
    ) VALUES (
        p_IdVenta, p_IdProducto, p_Cantidad, p_PrecioUnitario, p_Descuento, v_Subtotal
    );

    -- 3️⃣ Actualizar stock del producto
    UPDATE producto
    SET stock_producto = stock_producto - p_Cantidad
    WHERE id_producto = p_IdProducto;

    -- 4️⃣ Obtener número de boleta de la venta
    SELECT nro_boleta INTO v_NroBoleta
    FROM ventas
    WHERE id_venta = p_IdVenta;

    -- 5️⃣ Insertar movimiento en kardex (si aplica)
    INSERT INTO kardex (
         tipo_movimiento, id_producto, cantidad, precio_unitario, total, comprobante
    ) VALUES (
        'SALIDA', p_IdProducto, p_Cantidad, p_PrecioUnitario, p_Total, v_NroBoleta
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_KardexMetodoPromedioPonderado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_KardexMetodoPromedioPonderado`(


in p_fecha_desde date, in p_fecha_hasta date, in p_codigo_barra  varchar(13) )
BEGIN



if (p_codigo_barra = '')  then 

SELECT 

    k.id,

    k.id_producto,

    k.codigo_producto,

    p.descripcion_producto,

    k.fecha,

    k.concepto,

    k.comprobante,

    k.entrada_unidades,

    k.salidad_unidades,

    k.existencia_unidades

   

FROM

    kardex  k inner join  producto p on

    k.id_producto=p.id_producto and k.codigo_producto=p.codigo_barra

   where  date( fecha) BETWEEN  p_fecha_desde and  p_fecha_hasta

   order by k.id;

 else  

 

SELECT 

    k.id,

    k.id_producto,

    k.codigo_producto,

    p.descripcion_producto,

    k.fecha,

    k.concepto,

    k.comprobante,

    k.entrada_unidades,

    k.salidad_unidades,

    k.existencia_unidades

   

FROM

    kardex  k inner join  producto p on

    k.id_producto=p.id_producto and k.codigo_producto=p.codigo_barra

   where  date( fecha) BETWEEN  p_fecha_desde and  p_fecha_hasta  and codigo_producto=p_codigo_barra

   order by k.id;



end if ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarArqueoCaja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarArqueoCaja`(
IN p_fecha_inicio DATE,
IN p_fecha_fin DATE
)
BEGIN
SELECT
	'' AS detalles,
	ac.id_arqueo_caja,
	c.nombre_caja AS cajas,
	CONCAT(u.nombre_usuario, ' ', u.apellido_usuario) AS usuario,
	ac.fecha_inicio,
	ac.monto_inicial,
	ac.total_ingresos,
	ac.total_egresos,
	ac.saldo_final,
	ac.monto_usuario,
	ac.sobrante_caja,
	ac.faltantes_caja,
	ac.fecha_fin,
	ac.estado,
	'' AS opciones
FROM
	arqueo_caja ac
INNER JOIN usuarios u ON ac.id_usuario = u.id_usuario
INNER JOIN cajas c ON ac.id_caja = c.id_caja
WHERE
	DATE(ac.fecha_inicio) BETWEEN p_fecha_inicio AND p_fecha_fin
ORDER BY
	ac.id_arqueo_caja DESC;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarCaja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarCaja`()
BEGIN
select '' as detalles, id_caja,numero_caja,nombre_caja,folio,

fecha_registro,fecha_actualizacion,estado,''as opcion from cajas 

where estado=1 or estado=2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarCategorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarCategorias`()
BEGIN
select
	'' as detalles,
	id_categoria,
	nombre_categoria,
	fecha_registro,
	fecha_actualizacion ,
	estado,
	'' as opciones
from
	categorias
where
	estado = 1
	or estado = 2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarClientes`()
BEGIN
select ''as detalles, id_cliente, numeroDocumento,

concat(nombre,' ',apellido) as nombres, nombre,apellido ,direccion,telefono,email,fecha_registro,fecha_actualizacion, estado , '' as opciones from  cliente

 where  estado= 1 or  estado=2 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarCompras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarCompras`(
    IN fechaDesde DATE,
    IN fechaHasta DATE
)
BEGIN
 SELECT 
        '' AS detalle,
        c.IdCompra,
        c.nro_boletacompras,
        c.TipoComprobante,
        CONCAT('B', c.NumeroFactura) AS Factura,
        p.nombre AS proveedor,
        p.razon_social,
        u.nombre_usuario AS Usuario,
        c.subtotalcosto,
        c.iva,
        c.TotalCosto,
        c.fecha_factura,
        c.fecha_registro,
        c.estado,
        '' AS opciones
    FROM compras c
    LEFT JOIN proveedor p ON c.IdProveedor = p.id_proveedor
    LEFT JOIN usuarios u ON c.id_usuario_creacion = u.id_usuario
    WHERE 
        (fechaDesde IS NULL OR c.fecha_registro >= fechaDesde)
        AND (fechaHasta IS NULL OR c.fecha_registro <= fechaHasta)
        AND  c.estado=1
    ORDER BY c.fecha_registro DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarComprasCredito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarComprasCredito`()
BEGIN
SELECT 
       ''as detalles,
         cc.id_compra_credito,
         c.IdCompra ,
		 cc.nroCreditoCompra,
         c.NumeroFactura,
         p.ruc,
         p.nombre ,
         p.razon_social,
         cc.monto_total,
		 cc.monto_abonado as abono,
		 cc.saldo_pendiente,
		 c.fecha_factura ,
         c.fecha_registro  as FechaRegistro,
         cc.fecha_vencimiento,
         cc.estado,
         '' as Opciones 
    FROM compras_credito cc
    JOIN compras c ON cc.id_compra = c.IdCompra 
    inner join proveedor p  on p.id_proveedor = c.IdProveedor 
    WHERE cc.estado = 'Pendiente' AND cc.saldo_pendiente > 0
    ORDER BY cc.fecha_compra;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarComprasCreditoFiltrado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarComprasCreditoFiltrado`(
     IN p_filtro VARCHAR(20),          -- 'Todos', 'Con abonos', 'Sin abonos'
    IN p_filtro_estado VARCHAR(20),   -- 'Cobrables', 'Finalizado','Todos', 'Pendiente', 'Vencido', 'Pagado', 'Inactivo'
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    -- Eliminar espacios al inicio y fin
    SET p_filtro = LTRIM(RTRIM(p_filtro));
    SET p_filtro_estado = LTRIM(RTRIM(p_filtro_estado));

    SELECT 
        '' AS vacio,
        c.IdCompra,
        cc.id_compra_credito as IdCompraCreditos,
        p.id_proveedor,
        p.nombre,
        p.razon_social,
        cc.nroCreditoCompra,
        cc.monto_total,
        cc.monto_abonado,
        cc.saldo_pendiente,
        cc.fecha_compra,
        cc.fecha_vencimiento,
        cc.estado,
        '' AS acciones
    FROM 
        compras_credito cc 
    INNER JOIN 
        compras c ON cc.id_compra = c.IdCompra
    INNER JOIN 
        proveedor p ON c.IdProveedor = p.id_proveedor 
    WHERE 
        (
            (p_filtro_estado = 'Cobrables' AND cc.estado IN ('Pendiente', 'Vencido'))
            OR (p_filtro_estado = 'Finalizado' AND cc.estado IN ('Pagado', 'Inactivo'))
            OR (p_filtro_estado = 'Pagado' AND cc.estado = 'Pagado')
            OR (p_filtro_estado = 'Inactivo' AND cc.estado = 'Inactivo')
            OR (p_filtro_estado = 'Pendiente' AND cc.estado = 'Pendiente')
            OR (p_filtro_estado = 'Vencido' AND cc.estado = 'Vencido')
            OR (p_filtro_estado = 'Todos')
        )
        AND (
            (p_filtro = 'Con abonos' AND cc.monto_abonado > 0)
            OR (p_filtro = 'Sin abonos' AND cc.monto_abonado = 0)
            OR (p_filtro = 'Todos')
        )
        AND (p_fecha_inicio IS NULL OR cc.fecha_compra >= p_fecha_inicio)
        AND (p_fecha_fin IS NULL OR cc.fecha_compra <= p_fecha_fin)
        
        -- Aplicar filtro de saldo solo si el estado lo requiere
        AND (
            (p_filtro_estado IN ('Cobrables', 'Pendiente', 'Vencido') AND cc.saldo_pendiente > 0)
            OR (p_filtro_estado IN ('Pagado', 'Inactivo', 'Finalizado', 'Todos'))
        )

    ORDER BY 
        cc.fecha_compra ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarDevoluciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarDevoluciones`(
                                                in p_IdUsuario INT,
                                                in p_IdCaja INT,
                                                in p_tipo_devolucion varchar(20))
BEGIN


	if (p_tipo_devolucion = 'todo')then

	select

	dd.id as idDevolucion,

	dd.id_movimiento_caja,

	dd.tipo_devolucion,

	dd.afectarCaja,

	dd.descripcion,

	dd.monto,

	'' as acciones

from

	detalle_devoluciones dd

inner join movimiento_caja mc on

	dd.id_movimiento_caja = mc.id_movimiento_caja

	and dd.estado = 1

	and mc.tipo_movimiento = 'Devolucion'

	and mc.tipo_referencia = 'Devolucion'

inner join arqueo_caja ac on

	ac.id_arqueo_caja = mc.id_arqueo

where

	ac.id_usuario = p_IdUsuario

	and ac.id_caja = p_IdCaja

	and ac.estado = 1 ;
else 

	select

	dd.id as idDevolucion,

	dd.id_movimiento_caja,

	dd.tipo_devolucion,

	dd.afectarCaja,

	dd.descripcion,

	dd.monto,

	'' as acciones

from

	detalle_devoluciones dd

inner join movimiento_caja mc on

	dd.id_movimiento_caja = mc.id_movimiento_caja

	and dd.estado = 1

	and mc.tipo_movimiento = 'Devolucion'

	and mc.tipo_referencia = 'Devolucion'

inner join arqueo_caja ac on

	ac.id_arqueo_caja = mc.id_arqueo

where

	ac.id_usuario = p_IdUsuario

	and ac.id_caja = p_IdCaja

	and ac.estado = 1

	and dd.tipo_devolucion = p_tipo_devolucion ;

end if;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarEmpresa`()
BEGIN

    SELECT 
            '' as detalles,
            id_Empresa,
            razon_social,
            nombre_comercial,
            ruc,
            marca,
            id_firma,
            direccion_matriz,
            direccion_sucursal,
            email,
            telefono,
            mensaje,
            contribuyente_especial,
            obligado_contabilidad,
            ambiente,
            tipo_emision,
            establecimiento_codigo,
            punto_emision_codigo,
            secuencial,
            codigo_iva, 
            logo_path,
            serie_boleta,
            nro_correlativo_ventas,
            nro_correlativo_compras,
            estado,
            ''as opciones from empresa where estado=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarGastos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarGastos`( IN p_IdUsuario INT,

                                                IN p_IdCaja INT)
BEGIN
select dg.id as IdGasto, dg.id_movimiento_caja ,dg.tipo_gastos,dg.tipo_pago,dg.descripcion,dg.monto ,'' as acciones

from detalle_gastos dg inner join movimiento_caja mc on dg.afectarCaja=1 and

dg.id_movimiento_caja =mc.id_movimiento_caja and dg.estado=1 and mc.tipo_movimiento='Egreso' and mc.tipo_referencia='Gasto'  

inner join arqueo_caja ac on ac.id_arqueo_caja =mc.id_arqueo 

where ac.id_usuario=p_IdUsuario  and ac.id_caja=p_IdCaja  and ac.estado =1;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarHistorialCredito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarHistorialCredito`()
BEGIN
select  Concat('Credito Nro: ',vc.nroCreditoVentas,' - Nombre del Cliente: ',c.nombre) as nro_credito_ventas

 ,Concat(u.nombre_usuario, u.apellido_usuario)as usuario ,

  c2.nombre_caja

 ,c.telefono,ac.monto_abonado ,ac.fecha_abono 

        from abonos_credito ac  inner join ventas_credito vc on 

ac.id_venta_credito = vc.id_venta_credito inner join cliente c 

on vc.id_cliente = c.id_cliente   inner join movimiento_caja mc on mc.id_movimiento_caja =ac.id_movimiento_caja 

inner join usuarios u  on u.id_usuario =mc.id_usuario inner join arqueo_caja ac2 on ac2.id_arqueo_caja =mc.id_arqueo 

inner join cajas c2 on ac2.id_caja = c2.id_caja

order by ac.id_abono ,ac.fecha_abono  desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarIngresos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarIngresos`(
                                              IN p_IdUsuario INT,

                                                IN p_IdCaja INT)
BEGIN
select

	di.id as idIngresos,

	di.id_movimiento_caja,

	di.tipo_ingresos,

	di.tipo_pago ,

	di.descripcion ,

	di.monto ,

	'' as acciones

from

	detalle_ingresos di

inner join movimiento_caja mc on

	di.id_movimiento_caja = mc.id_movimiento_caja

	and di.estado = 1

	and mc.tipo_movimiento = 'Ingreso'

	and mc.tipo_referencia = 'Ingreso'

inner join 

arqueo_caja ac on

	ac.id_arqueo_caja = mc.id_arqueo

where

	ac.id_usuario = p_IdUsuario

	and ac.id_caja = p_IdCaja

	and ac.estado = 1;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_listarmarca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_listarmarca`()
BEGIN
select
	'' as detalles,
	id_marca,
	nombre,
	fecha_registro,
	fecha_actualizacion ,
	estado,
	'' as opciones
from
	marca
where
	estado = 1
	or estado = 2;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarPerfiles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarPerfiles`()
BEGIN
select
	id_perfil,
	descripcion,
	fecha_registro as fecha_creacion ,
	fecha_actualizacion,
	estado,
	'' as opciones
from
	perfiles
where
	estado = 1
	or estado = 2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarProductos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarProductos`()
BEGIN
select 
        '' as detalles,
        id_producto,
		codigo_barra,
		id_categoria_producto,
		nombre_categoria,
        mar.id_marca,
        mar.nombre,
		descripcion_producto,
        id_unidades,
        m.nombre ,
		ROUND(precio_compra_producto,2) as precio_compra_producto,
		ROUND(precio_venta_producto,2) as precio_venta_producto,
        ROUND(precio_1_producto,2) as precio_1_producto,
        ROUND(precio_2_producto,2) as precio_2_producto,
		lleva_iva_producto,
        perecedero_producto,
	    stock_producto,
        minimo_stock_producto,
		ROUND(costo_total_producto,2) as costo_total_producto,
		p.fecha_registro as fecha_creacion_producto,
		p.fecha_actualizacion as fecha_actualizacion_producto,
		p.img_producto,
		'' as acciones
 from producto  p inner join categorias c on p.id_categoria_producto=c.id_categoria 
 inner join  medidas m on p.id_unidades=m.id_medida 
 inner join  marca mar on p.id_marca=mar.id_marca
 where p.estado=1
 	order by p.id_producto desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarProductosMasVendidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarProductosMasVendidos`()
BEGIN
select  p.codigo_barra,

		p.descripcion_producto,

        sum(vd.cantidad) as cantidad,

        sum(Round(vd.total_venta,2)) as total_venta

from det_venta vd inner join producto p on vd.codigo_barra = p.codigo_barra

where vd.estado=1

group by p.codigo_barra,

		p.descripcion_producto

order by  sum(Round(vd.total_venta,2)) DESC

limit 10;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarProductosPocoStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarProductosPocoStock`()
BEGIN
select p.codigo_barra,

		p.descripcion_producto,

        p.stock_producto,

        p.minimo_stock_producto

from producto p

where p.estado=1 and p.stock_producto <= p.minimo_stock_producto

order by p.stock_producto asc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarProveedor`()
BEGIN
	select ''as detalles, id_proveedor,ruc,nombre,

razon_social,direccion,telefono,

email,fecha_registro,fecha_actualizacion,estado,''as opcion 

from proveedor where estado=1 or estado=2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarUnidades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarUnidades`()
BEGIN
select

	'' as vacio ,

	m.id_medida,

	m.nombre,

	m.nombre_corto,

	m.fecha_registro,

	m.fecha_actualizacion,

	m.estado,

	'' as acciones

from

	medidas m

where

	m.estado = 1

	or m.estado = 2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarUsuario`()
BEGIN

	SELECT
	'' as detalles,
	        id_usuario,
	        cedula,
            nombre_usuario,
            apellido_usuario,
            usuario,
            clave,
            id_perfil_usuario,
            id_caja,
            email,
            direccion,
            telefono,
            landmarks,
            img,
            ciudad,
	       estado,
	'' as opciones
FROM
	usuarios
WHERE
	estado = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarVentas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarVentas`(
                                            in fechaDesde date,
                                           in fechaHasta date)
BEGIN

SELECT
  '' AS detalle,
  v.IdVenta,
  v.nro_boleta,
  v.tipo_pago,
  v.TipoDocumento,
  v.iva,
  v.subtotal,
  v.total_venta,
  CONCAT(u.nombre_usuario, ' ', u.apellido_usuario) AS usuario,
  v.fecha_registro,
  v.estado,
  '' AS opciones
FROM ventas v
JOIN usuarios u ON v.id_usuario_creacion = u.id_usuario
JOIN cliente c ON v.IdCliente = c.id_cliente
WHERE v.fecha_registro BETWEEN fechaDesde AND fechaHasta
  AND v.estado = '1'
ORDER BY v.fecha_registro DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarVentasCredito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarVentasCredito`()
BEGIN

SELECT 

        vc.id_venta_credito ,

         v.IdVenta AS IdVenta ,

         c.id_cliente ,

        c.nombre ,

        vc.monto_total ,

        (  vc.monto_total- vc.saldo_pendiente)as abono,

        vc.saldo_pendiente ,

        vc.fecha_venta ,

        vc.Estado,
         v.nro_boleta,

        ''as Opciones

    FROM ventas_credito vc

    JOIN ventas v ON vc.id_venta = v.IdVenta inner join 

     cliente c on c.id_cliente =v.IdCliente 

    WHERE vc.estado = '1' AND vc.saldo_pendiente > 0

    ORDER BY vc.fecha_venta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarVentasCreditoFiltrado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarVentasCreditoFiltrado`(
     IN p_filtro VARCHAR(20) , -- 'Todos', 'Con abonos', 'Sin abonos'
     IN p_filtro_estado VARCHAR(20),   -- 'Cobrables', 'Finalizado','Todos', 'Pendiente', 'Vencido', 'Pagado', 'Inactivo'
     IN p_fecha_inicio DATE,
     IN p_fecha_fin DATE
   )
BEGIN
 SELECT 
       '' AS vacio,
       vc.id_venta_credito,
       cl.id_cliente,
       concat(cl.nombre,' ',cl.apellido) AS nombre_cliente,
       vc.nroCreditoVentas,
       vc.monto_total,
       vc.monto_abonado,
       vc.saldo_pendiente,
       vc.fecha_venta,
       vc.fecha_vencimiento,
       vc.estado,
       '' AS acciones
  FROM 
       ventas_credito vc
  INNER JOIN 
       ventas v ON vc.id_venta = v.IdVenta
  INNER JOIN 
       cliente cl ON v.IdCliente = cl.id_cliente
  WHERE 
       (
           (p_filtro_estado = 'Cobrables' AND vc.estado IN ('Pendiente', 'Vencido'))
           OR (p_filtro_estado = 'Finalizado' AND vc.estado IN ('Pagado', 'Inactivo'))
           OR (p_filtro_estado = 'Pagado' AND vc.estado = 'Pagado')
           OR (p_filtro_estado = 'Inactivo' AND vc.estado = 'Inactivo')
           OR (p_filtro_estado = 'Pendiente' AND vc.estado = 'Pendiente')
           OR (p_filtro_estado = 'Vencido' AND vc.estado = 'Vencido')
           OR (p_filtro_estado = 'Todos')
       )
       AND (
           (p_filtro = 'Con abonos' AND vc.monto_abonado > 0)
           OR (p_filtro = 'Sin abonos' AND vc.monto_abonado = 0)
           OR (p_filtro = 'Todos')
       )
       AND (p_fecha_inicio IS NULL OR vc.fecha_venta >= p_fecha_inicio)
       AND (p_fecha_fin IS NULL OR vc.fecha_venta <= p_fecha_fin)
  ORDER BY 
       vc.fecha_venta ASC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ListarVentasCreditoFinalizado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListarVentasCreditoFinalizado`()
BEGIN


SELECT 

        vc.id_venta_credito ,

         v.IdVenta,

            c.id_cliente ,

        c.nombre ,

        vc.monto_total ,

        (  vc.monto_total- vc.saldo_pendiente)as abono,

        vc.saldo_pendiente ,

        vc.fecha_venta ,

        vc.Estado,

        ''as Opciones

    FROM ventas_credito vc

    JOIN ventas v ON vc.id_venta = v.IdVenta inner join 

     cliente c on c.id_cliente =v.IdCliente 

    WHERE vc.estado = 'Pagado'

    ORDER BY vc.fecha_venta;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_listar_lotes_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_listar_lotes_producto`()
BEGIN

   select
         ''as detalles,
        lp.id_lote AS `# Lote`,
        p.descripcion_producto AS `Producto`,
        lp.cantidad_comprada AS `Cant. Comprada`,
        lp.cantidad_bonificada AS `Bonificación`,
        lp.stock_disponible AS `Stock Disponible`,
        lp.costo_unitario AS `Costo Unitario`,
        lp.precio_compra AS `Precio Total`,
        lp.fecha_registro AS `F. Compra`,
        lp.fecha_vencimiento AS `F. Vencimiento`,
        CASE 
            WHEN lp.estado = 1 THEN 'Activo'
            WHEN lp.estado = 0 THEN 'Inactivo'
            ELSE 'Desconocido'
        END AS `Estado`,
         '' as Opciones 
    FROM lote_producto lp
    INNER JOIN producto p ON lp.id_producto = p.id_producto
    ORDER BY lp.fecha_registro DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_MovimientosCaja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_MovimientosCaja`(
   IN p_id_usuario INT,
   IN p_id_caja INT
)
BEGIN
SELECT
  ac.id_arqueo_caja,
  COALESCE(ac.monto_inicial, 0) AS monto_inicial,

  -- Ingresos por ventas
  SUM(CASE 
      WHEN mc.tipo_movimiento = 'Ingreso' AND di.tipo_ingresos = 'Ventas' THEN di.monto
      ELSE 0 
  END) AS total_ingresos_ventas,

  -- Ventas a crédito
  SUM(CASE 
      WHEN mc.tipo_movimiento = 'Ingreso' AND di.tipo_ingresos = 'Creditos' THEN di.monto
      ELSE 0 
  END) AS total_abono_credito_venta,
  
   SUM(CASE 
      WHEN mc.tipo_movimiento = 'Ingreso' AND di.tipo_ingresos = 'Otros' THEN di.monto
      ELSE 0 
  END) AS total_otros_ingresos,
  
  
(
  SELECT COALESCE(SUM(vc.saldo_pendiente), 0)
  FROM ventas_credito vc
  JOIN ventas v ON v.IdVenta = vc.id_venta
  JOIN detalle_ingresos di ON di.id_ventas = v.IdVenta and  di.tipo_ingresos='Ventas' 
    AND (di.id_abono IS NULL OR di.id_abono = '')
  JOIN movimiento_caja mc2 ON mc2.id_movimiento_caja = di.id_movimiento_caja
  WHERE vc.estado='Pendiente'
    AND mc2.id_arqueo = ac.id_arqueo_caja
    AND mc2.estado = '1'
    AND di.estado = '1'
) AS total_credito_pendiente_venta,

  -- Devoluciones de ventas (solo si afectan caja)
  SUM(CASE 
      WHEN mc.tipo_movimiento = 'Devolucion' AND dd.tipo_devolucion = 'Venta' AND dd.afectarCaja = 1 THEN dd.monto
      ELSE 0 
  END) AS total_devolucion_ventas,

  -- Devoluciones de compras (solo si afectan caja)
  SUM(CASE 
      WHEN mc.tipo_movimiento = 'Devolucion' AND dd.tipo_devolucion = 'Compra' AND dd.afectarCaja = 1 THEN dd.monto
      ELSE 0 
  END) AS total_devolucion_compras,

  -- Compras normales (solo si afectan caja)
  SUM(CASE 
      WHEN mc.tipo_movimiento = 'Egreso' AND dg.tipo_gastos = 'Compras' AND dg.afectarCaja = 1 THEN dg.monto
      ELSE 0 
  END) AS total_compras,

  -- Compras a crédito (solo si afectan caja)
  SUM(CASE 
      WHEN mc.tipo_movimiento = 'Egreso' AND dg.tipo_gastos = 'Creditos' AND dg.afectarCaja = 1 THEN dg.monto
      ELSE 0 
  END) AS total_abono_credito_compras,

  -- Otros gastos (solo si afectan caja)
  SUM(CASE 
      WHEN mc.tipo_movimiento = 'Egreso' AND dg.tipo_gastos = 'Otros' AND dg.afectarCaja = 1 THEN dg.monto
      ELSE 0 
  END) AS total_gastos_otros,
  (
  SELECT COALESCE(SUM(cc.saldo_pendiente), 0)
  FROM compras_credito cc
  JOIN compras c ON c.IdCompra = cc.id_compra
  JOIN detalle_gastos dg ON dg.id_compras = c.IdCompra and  dg.tipo_gastos='Compras' 
    AND (dg.id_abono IS NULL OR dg.id_abono = '')
  JOIN movimiento_caja mc2 ON mc2.id_movimiento_caja = dg.id_movimiento_caja
  WHERE cc.estado='Pendiente'
    AND mc2.id_arqueo = ac.id_arqueo_caja
    AND mc2.estado = '1'
    AND dg.estado = '1'
) AS total_credito_pendiente_compras

FROM arqueo_caja ac
JOIN movimiento_caja mc 
  ON mc.id_arqueo = ac.id_arqueo_caja AND mc.estado = '1'

LEFT JOIN detalle_ingresos di 
  ON di.id_movimiento_caja = mc.id_movimiento_caja AND di.estado = '1'

LEFT JOIN detalle_gastos dg 
  ON dg.id_movimiento_caja = mc.id_movimiento_caja AND dg.estado = '1'

LEFT JOIN detalle_devoluciones dd 
  ON dd.id_movimiento_caja = mc.id_movimiento_caja AND dd.estado = '1'

WHERE ac.fecha_fin IS NULL
  AND ac.id_caja = p_id_caja -- ID de la caja
  AND ac.id_usuario = p_id_usuario -- ID del usuario
  AND ac.estado = '1'

GROUP BY ac.id_arqueo_caja;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_MovimientosDeCaja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_MovimientosDeCaja`(

                                            IN `p_IdUsuario` INT, 

                                            IN `p_IdCaja` INT)
begin

	declare v_MontoInicial Decimal(10,2);

	declare v_Ingresos Decimal(10,2);

    declare v_Gastos Decimal(10,2);

	declare v_IngresosCreditosXCobrar Decimal(10,2);

    declare v_GastoCreditosXPagar Decimal(10,2);

    declare v_DevolucionVenta Decimal(10,2);

    declare v_DevolucionCompra Decimal(10,2);
    
    declare ingresos_totales Decimal(10,2);

    declare egresos_totales Decimal(10,2);

    declare total_saldo Decimal(10,2);

    declare monto_inicial_mas_saldo Decimal(10,2);


	select sum(di.monto) INTO v_Ingresos from detalle_ingresos di inner join movimiento_caja mc on

    di.id_movimiento_caja = mc.id_movimiento_caja and di.estado =1 and mc.tipo_movimiento='Ingreso'

    and mc.tipo_referencia='Ingreso' inner join 

    arqueo_caja ac on ac.id_arqueo_caja = mc.id_arqueo 

   where ac.id_usuario=p_IdUsuario  and ac.id_caja=p_IdCaja  and ac.estado =1;

  

   select sum(vc.saldo_pendiente) INTO v_IngresosCreditosXCobrar from ventas_credito vc 

   inner join  detalle_ingresos di  on  

   vc.id_venta =di.id_ventas  and vc.estado=1 inner join movimiento_caja mc on

   mc.id_movimiento_caja =di.id_movimiento_caja and mc.tipo_movimiento='Ingreso' 

   and mc.tipo_referencia='Ingreso' inner join 

   arqueo_caja ac on ac.id_arqueo_caja = mc.id_arqueo 

   where ac.id_usuario=p_IdUsuario  and ac.id_caja=p_IdCaja  and ac.estado =1;

  

  select sum(cc.saldo_pendiente) INTO v_GastoCreditosXPagar from compras_credito cc inner join detalle_gastos dg on

  cc.id_compra = dg.id_compras and dg.estado=1 inner join movimiento_caja mc on

  mc.id_movimiento_caja =dg.id_movimiento_caja and mc.tipo_movimiento='Egreso' and mc.tipo_referencia='Gasto'

  inner join 

  arqueo_caja ac on ac.id_arqueo_caja = mc.id_arqueo 

  where ac.id_usuario=p_IdUsuario  and ac.id_caja=p_IdCaja  and ac.estado =1;

  

  select

	sum(dd.monto) into v_DevolucionVenta

	

  from

	detalle_devoluciones dd

  inner join movimiento_caja mc on

	dd.id_movimiento_caja = mc.id_movimiento_caja and 

	dd.tipo_devolucion='Venta'

	and dd.estado = 1

	and mc.tipo_movimiento = 'Devolucion'

	and mc.tipo_referencia = 'Devolucion'

inner join arqueo_caja ac on

	ac.id_arqueo_caja = mc.id_arqueo

where

	ac.id_usuario = p_IdUsuario

	and ac.id_caja = p_IdCaja

	and ac.estado = 1;



 select

	sum(dd.monto) into v_DevolucionCompra

	

from

	detalle_devoluciones dd

inner join movimiento_caja mc on

	dd.id_movimiento_caja = mc.id_movimiento_caja and 

	dd.tipo_devolucion='Compra'

	and dd.estado = 1

	and mc.tipo_movimiento = 'Devolucion'

	and mc.tipo_referencia = 'Devolucion'

inner join arqueo_caja ac on

	ac.id_arqueo_caja = mc.id_arqueo

where

	ac.id_usuario = p_IdUsuario

	and ac.id_caja = p_IdCaja

	and ac.estado = 1;

	

    select sum(dg.monto) into v_Gastos

from detalle_gastos dg inner join movimiento_caja mc on dg.afectarCaja=1 and

dg.id_movimiento_caja =mc.id_movimiento_caja and dg.estado=1 and mc.tipo_movimiento='Egreso' and mc.tipo_referencia='Gasto'  

inner join arqueo_caja ac on ac.id_arqueo_caja =mc.id_arqueo 

where ac.id_usuario=p_IdUsuario  and ac.id_caja=p_IdCaja  and ac.estado =1;



select

	sum(ar.monto_inicial) into v_MontoInicial

from

	arqueo_caja ar

where

	ar.estado = 1

	and ar.id_usuario = p_IdUsuario

	and ar.id_caja = p_IdCaja;



SET ingresos_totales = (IFNULL(v_Ingresos,0));

-- SET egresos_totales =(IFNULL(total_prestamos,0) + IFNULL(gastos,0) );

SET egresos_totales =(IFNULL(v_Gastos,0) );

SET total_saldo =(IFNULL(ingresos_totales,0) -IFNULL( egresos_totales,0));

SET monto_inicial_mas_saldo =(IFNULL(total_saldo,0) + IFNULL(v_MontoInicial,0));


   SELECT IFNULL(CONCAT('$./ ', FORMAT(v_MontoInicial,2)), 0) AS monto_inicial,
 
   IFNULL(CONCAT('$./ ', FORMAT(v_GastoCreditosXPagar,2)) , 0) AS total_egresos_creditos_x_pagar ,

   IFNULL(CONCAT('$./ ', FORMAT(v_IngresosCreditosXCobrar,2)) , 0) AS total_ingresos_creditos_x_cobrar ,

  
   IFNULL(CONCAT('$./ ', FORMAT(v_Ingresos ,2)), 0) AS ingresos , 


   IFNULL( CONCAT('$./ ', FORMAT(v_DevolucionCompra,2)), 0) AS total_devoluciones_compras,

   IFNULL( CONCAT('$./ ', FORMAT(v_DevolucionVenta,2)), 0) AS total_devoluciones_Ventas,

   IFNULL(CONCAT('$./ ', FORMAT(0,2)), 0) AS total_prestamos, 

   IFNULL(CONCAT('$./ ', FORMAT(v_Gastos,2)), 0) AS gastos , 

   IFNULL(CONCAT('$./ ', FORMAT(0,2)) , 0) AS  total_gasto_creditos , 


    IFNULL(CONCAT('$./ ', FORMAT(ingresos_totales,2)), 0) AS ingresos_totales,   

    IFNULL(CONCAT('$./ ', FORMAT(egresos_totales,2)), 0) AS egresos_totales,

     
        IFNULL(CONCAT('$./ ', FORMAT(total_saldo,2)), 0) AS total_saldo,

         IFNULL(CONCAT('$./ ', FORMAT(monto_inicial_mas_saldo,2)), 0) AS monto_inicial_mas_saldo

;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ObtenerDatosDashboard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ObtenerDatosDashboard`()
BEGIN

 DECLARE v_totalProductos int;

   DECLARE v_totalComprasInventario float;

   DECLARE v_totalVentas float;

   DECLARE v_totalCompras float;

   DECLARE v_ganancias float;

   DECLARE v_productosPocoStock int;

   DECLARE v_ventasHoy float;

  

   SET v_totalProductos = (SELECT

      COUNT(*)

    FROM producto p where  p.activo=1);

   

     SET v_totalComprasInventario = (SELECT

      SUM(p.stock_producto*precio_compra_producto)

    FROM producto  p where p.activo=1 );

   

     SET v_totalVentas = (  SELECT

      SUM(v.total_venta)

    FROM ventas v  where v.Activo=1);

   

     set v_totalCompras=( SELECT

      SUM(c.TotalCosto)

    FROM compras c  where c.Activo=1

    );

   

     SET v_ganancias = (  select sum(cantidad_vendida * ganancia_unitaria)  
    from detalle_venta_stock where estado=1);

 

   

  SET v_productosPocoStock = (SELECT

      COUNT(1)

    FROM producto p

    WHERE p.stock_producto <= p.minimo_stock_producto);

   

     SET v_ventasHoy = ( SELECT

      SUM(v.total_venta)

    FROM ventas v 

    WHERE  v.Activo=1 and  DATE(v.fecha_venta) = CURDATE());

   

   

     SELECT

    IFNULL(v_totalProductos, 0) AS totalProductos,

    IFNULL(CONCAT('$./ ', FORMAT(v_totalComprasInventario, 2)), 0) AS totalComprasInventario,

    IFNULL(CONCAT('$./ ', FORMAT(v_totalVentas, 2)), 0) AS totalVentas,

	IFNULL(CONCAT('$./ ', FORMAT(v_totalCompras, 2)), 0) AS totalCompraRealizada,

    

    IFNULL(CONCAT('$./ ', FORMAT(v_ganancias, 2)), 0) AS ganancias,

    IFNULL(v_productosPocoStock, 0) AS productosPocoStock,

    IFNULL(CONCAT('$./ ', FORMAT(v_ventasHoy, 2)), 0) AS ventasHoy;
	
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_obtenerNroBoleta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_obtenerNroBoleta`()
BEGIN

SELECT 
  c.serie_boleta,
  LPAD(IFNULL(c.nro_correlativo_ventas + 1, 1), 8, '0') AS nro_venta,
  LPAD(IFNULL(c.nro_credito_ventas + 1, 1), 8, '0') AS nro_credito_ventas,
  LPAD(IFNULL(c.nro_correlativo_compras + 1, 1), 8, '0') AS nro_correlativo_compras,
  LPAD(IFNULL(c.nro_credito_compras + 1, 1), 8, '0') AS nro_credito_compras,
  c.razon_social,
  c.ruc,
  c.mensaje,
  c.direccion_sucursal AS direccion,
  c.marca,
  c.email,
  pi.porcentaje AS impuesto
FROM empresa c
INNER JOIN porcentaje_iva pi ON pi.codigo = c.codigo_iva
WHERE c.estado = 1
LIMIT 1;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ObtenerVentasMesActual` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ObtenerVentasMesActual`()
BEGIN

SELECT date(v.fecha_venta) as fecha_venta,

		sum(round(v.total_venta,2)) as total_venta,

       IFNULL( (SELECT sum(round(v2.total_venta,2))

			FROM ventas v2 

		where date(v2.fecha_venta) >= date(last_day(now() - INTERVAL 2 month) + INTERVAL 1 day)

		and date(v2.fecha_venta) <= last_day(last_day(now() - INTERVAL 2 month) + INTERVAL 1 day)

        and date(v2.fecha_venta) = DATE_ADD(v.fecha_venta, INTERVAL -1 MONTH)

		group by date(v2.fecha_venta)),0 )as total_venta_ant

FROM ventas v 

where v.Activo=1 and date(v.fecha_venta) >= date(last_day(now() - INTERVAL 1 month) + INTERVAL 1 day)

and date(v.fecha_venta) <= last_day(date(CURRENT_DATE))

group by date(v.fecha_venta) ,total_venta_ant;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_obtener_factura_electronica_cabecera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_obtener_factura_electronica_cabecera`(
  in p_Id_Venta int
)
BEGIN

SELECT 
    -- Datos de la empresa
    e.razon_social as razon_social_empresa ,
    e.nombre_comercial,
    e.ruc,
    e.direccion_matriz,
    e.direccion_sucursal AS direccion_establecimiento,
    e.establecimiento_codigo,
    e.punto_emision_codigo AS pto_emision,
    e.secuencial,
    e.ambiente,
    e.tipo_emision,
    e.codigo_iva AS codigoPorcentaje,
    e.contribuyente_especial,
    e.obligado_contabilidad,
    pi.porcentaje AS tarifa,

    -- Datos del cliente
    c.tipo_identificacion,
    c.numeroDocumento AS identificacion,
    c.nombre AS razon_social,
    c.email AS correo,

    -- Datos de la venta
    v.TipoDocumento,
    v.nro_boleta,
    v.fecha_registro AS fecha_emision,
    v.subtotal AS total_sin_impuestos,
    (v.subtotal * 0.00) AS total_descuento, -- puedes calcular descuentos si tienes
    v.subtotal AS base_imponible,
    v.iva AS valor_iva,
    v.total_venta AS importe_total,
    v.clave_acceso

FROM ventas v
INNER JOIN cliente c ON v.IdCliente = c.id_cliente
INNER JOIN empresa e ON e.estado = '1'
    AND v.estado = '1'
INNER JOIN porcentaje_iva pi ON pi.codigo = e.codigo_iva
WHERE v.IdVenta = p_Id_Venta;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_obtener_factura_electronica_detalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_obtener_factura_electronica_detalle`(
  in p_Id_Venta int
)
BEGIN

	SELECT 
    dv.codigo_barra AS codigo,
    dv.descripcion_producto AS descripcion,
    dv.cantidad,
    dv.PrecioUnidad AS precio_unitario,
    0.00 AS descuento, -- Si manejas descuentos, cámbialo
    dv.Sub_total AS subtotal,
    dv.iva AS iva
FROM det_venta dv
WHERE dv.estado='1' AND dv.IdVenta = p_Id_Venta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_RealizarArqueoCaja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_RealizarArqueoCaja`(
in p_id_arqueo_caja int ,
in p_IdCaja int,
in p_IdUsuario int ,
in p_inpuBillete100 float,
in p_inpuBillete50 float,
in p_inpuBillete20 float,
in p_inpuBillete10 float,
in p_inpuBillete5 float,
in p_inpuBillete2 float,
in p_inpuBillete1 float,
in p_inputMoneda1 float,
in p_inputMoneda50 float,
in p_inputMoneda25 float,
in p_inputMoneda10 float,
in p_inputMoneda5 float,
in p_inputMoneda001 float,
in p_total_efectivo float, 
in p_inpuTotalMoneda float,
in p_inpuTotalBilletes float,
in p_Comentario varchar(550))
BEGIN

declare v_fecha datetime;

    declare v_MontoInicial float;
    declare v_numero_venta float;
    declare v_Ingresos float;
    declare v_sobrante_cja float;
    declare v_faltantes_cja float;

    declare v_total_devoluciones float;
    declare v_total_prestamos float;
    declare v_Gastos float;

	declare v_ingresos_totales float;
    declare v_egresos_totales float;
    declare v_total_saldo float;
    declare v_monto_inicial_mas_saldo float;
     
 set v_fecha = (select now());

select
	sum(ar.monto_inicial) into v_MontoInicial
from
	arqueo_caja ar
where
	ar.estado = 1
	and ar.id_usuario = p_IdUsuario
	and ar.id_caja = p_IdCaja;


	select sum(di.monto) INTO v_Ingresos from detalle_ingresos di inner join movimiento_caja mc on
    di.id_movimiento_caja = mc.id_movimiento_caja and di.estado =1 and mc.tipo_movimiento='Ingreso'
    and mc.tipo_referencia='Ingreso' inner join 
    arqueo_caja ac on ac.id_arqueo_caja = mc.id_arqueo 
   where ac.id_usuario=p_IdUsuario  and ac.id_caja=p_IdCaja  and ac.estado =1;
   
 select sum(dg.monto) into v_Gastos
from detalle_gastos dg inner join movimiento_caja mc on dg.afectarCaja=1 and
dg.id_movimiento_caja =mc.id_movimiento_caja and dg.estado=1 and mc.tipo_movimiento='Egreso' and mc.tipo_referencia='Gasto'  
inner join arqueo_caja ac on ac.id_arqueo_caja =mc.id_arqueo 
where ac.id_usuario=p_IdUsuario  and ac.id_caja=p_IdCaja  and ac.estado =1;

set v_total_prestamos=(0);

select  count(di.id_ventas) INTO v_numero_venta from detalle_ingresos di inner join movimiento_caja mc on
    di.id_movimiento_caja = mc.id_movimiento_caja and di.estado =1 and mc.tipo_movimiento='Ingreso'
    and mc.tipo_referencia='Ingreso' inner join 
    arqueo_caja ac on ac.id_arqueo_caja = mc.id_arqueo 
   where ac.id_usuario=p_IdUsuario  and ac.id_caja=p_IdCaja  and ac.estado =1;
   
   SET v_egresos_totales =(IFNULL(v_total_prestamos,0) + IFNULL(v_Gastos,0) );
   
SET v_total_saldo =(IFNULL(v_Ingresos,0) -IFNULL( v_egresos_totales,0));
SET v_monto_inicial_mas_saldo =(IFNULL(v_total_saldo,0) + IFNULL(v_MontoInicial,2));


 
if (v_monto_inicial_mas_saldo > p_total_efectivo) then 
SET v_faltantes_cja=( IFNULL(v_monto_inicial_mas_saldo,2) - IFNULL(p_total_efectivo,0));
SET v_sobrante_cja=0;
elseif (v_monto_inicial_mas_saldo < p_total_efectivo) then
SET v_sobrante_cja=( IFNULL(p_total_efectivo,2) - IFNULL(v_monto_inicial_mas_saldo,0));
SET v_faltantes_cja=0;
else  
SET v_sobrante_cja=0;
SET v_faltantes_cja=0;
end if ;


  
UPDATE arqueo_caja 
	SET fecha_fin = v_fecha, 
        total_ingresos = v_Ingresos,
        total_egresos = v_egresos_totales,
        sobrante_caja = v_sobrante_cja,
        faltantes_caja = v_faltantes_cja,
        saldo_final = v_monto_inicial_mas_saldo,
          monto_usuario = p_total_efectivo,
          concepto = p_Comentario,
            estado = 0
	WHERE id_arqueo_caja = p_id_arqueo_caja ; 
    
    


INSERT INTO dinero(id_arqueo,id_usuario,id_caja,billete_100,billete_50,billete_20,billete_10
,billete_5,billete_2,billete_1,moneda_1,moneda_50,moneda_25,moneda_10,moneda_5,moneda_001,
total_moneda,total_billeta,activo,fecha_registro) 
                                                VALUES (p_id_arqueo_caja,
                                                        p_IdUsuario, 
                                                        p_IdCaja,
                                                        p_inpuBillete100 , 
                                                        p_inpuBillete50 ,
                                                        p_inpuBillete20 ,
                                                        p_inpuBillete10 , 
                                                        p_inpuBillete5 , 
                                                        p_inpuBillete2 , 
                                                        p_inpuBillete1 , 
                                                        p_inputMoneda1 ,
														p_inputMoneda50 , 
                                                        p_inputMoneda25 , 
                                                        p_inputMoneda10 , 
                                                        p_inputMoneda5 , 
                                                        p_inputMoneda001 ,
                                                        p_inpuTotalMoneda , 
                                                        p_inpuTotalBilletes,
                                                        1,
                                                        v_fecha
                                                       
                                                       );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_RecuperarValorCaja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_RecuperarValorCaja`(
in p_id_usuario int , in  p_id_caja int)
BEGIN

SELECT 

  monto_usuario as  usuario

FROM

    arqueo_caja

WHERE

    id_caja = p_id_caja 

	AND estado = 0 and fecha_fin=(SELECT 

   max(fecha_fin)

FROM

    arqueo_caja

WHERE

    id_caja = p_id_caja 

	AND estado = 0);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_RegistrarAbonoCompraCredito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_RegistrarAbonoCompraCredito`(
    IN p_IdUsuario INT,
    IN p_IdCaja INT,
    IN p_IdCompra INT,
    IN p_IdCompraCredito INT,
    IN p_MontoAbonado DECIMAL(10, 2),
    IN p_Observacion VARCHAR(150),
    IN p_MetodoPago VARCHAR(50)
    )
BEGIN
     DECLARE v_SaldoPendiente DECIMAL(10, 2);
    DECLARE v_id_arqueo INT;
    DECLARE v_id_movimiento INT;
    DECLARE v_id_abono INT;

    DECLARE mensaje VARCHAR(255);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Si ocurre algún error, revierte la transacción
        ROLLBACK;
        SET mensaje = 'Error: No se pudo registrar el abono.';
        SELECT mensaje AS resultado;
    END;

    
    START TRANSACTION;

          -- Eliminar espacios al inicio y fin
    SET p_Observacion = LTRIM(RTRIM(p_Observacion));
     SET p_MetodoPago = LTRIM(RTRIM(p_MetodoPago));
          
    -- Obtener el arqueo de caja abierto
    SELECT id_arqueo_caja INTO v_id_arqueo
    FROM arqueo_caja
    WHERE id_usuario = p_IdUsuario AND id_caja = p_IdCaja AND estado = 1
    ORDER BY fecha_inicio DESC
    LIMIT 1;

    IF v_id_arqueo IS NOT NULL THEN

        -- Obtener movimiento existente
        SELECT id_movimiento_caja INTO v_id_movimiento
        FROM movimiento_caja
       WHERE id_arqueo= v_id_arqueo and id_usuario = p_IdUsuario AND estado = 1 and tipo_movimiento='Egreso'
         and tipo_referencia='Gasto'
        ORDER BY fecha_registro DESC
        LIMIT 1;

        IF v_id_movimiento IS NULL THEN
            -- Insertar nuevo movimiento
             INSERT INTO movimiento_caja (id_arqueo, tipo_movimiento, tipo_referencia, id_usuario)
                 VALUES (v_id_arqueo, 'Egreso', 'Gasto', p_IdUsuario);
        
        SET v_id_movimiento = LAST_INSERT_ID();
        END IF;

        -- Obtener el saldo pendiente y el id_venta
        SELECT saldo_pendiente INTO v_SaldoPendiente
        FROM compras_credito
        WHERE id_compra_credito = p_IdCompraCredito;

        -- Verificar que el abono no exceda el saldo pendiente
        IF p_MontoAbonado > v_SaldoPendiente THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El abono no puede ser mayor al saldo pendiente';
        END IF;

           -- Insertar el abono en la tabla de abonos    

    INSERT INTO abonos_compra_credito  (id_compra_credito , id_movimiento_caja , monto_abonado , metodo_pago,observacion )

    VALUES (p_IdCompraCredito, v_id_movimiento,p_MontoAbonado, p_MetodoPago,p_Observacion);
    
    
     SET v_id_abono = LAST_INSERT_ID();

        -- Insertar en detalle_gastos
    INSERT INTO detalle_gastos (afectarCaja,id_movimiento_caja,tipo_gastos, tipo_pago, id_compras ,monto,descripcion)

    VALUES (1,v_id_movimiento,'Creditos', p_MetodoPago, p_IdCompra,p_MontoAbonado, p_Observacion);
    
    
        -- Actualizar el saldo pendiente de la compra a crédito   

    UPDATE compras_credito

    SET saldo_pendiente =  saldo_pendiente - p_MontoAbonado,

           monto_abonado= monto_abonado + p_MontoAbonado

    WHERE id_compra_credito = p_IdCompraCredito;

        -- Si ya no hay saldo pendiente, marcar como pagado
         IF  (v_SaldoPendiente - p_MontoAbonado) = 0 THEN

        UPDATE compras_credito

        SET estado = 'Pagado'

        WHERE id_compra_credito = p_IdCompraCredito;

    END IF;

    END IF;

    COMMIT;

    SET mensaje = 'Abono registrado con éxito.';
    SELECT mensaje AS resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_RegistrarAbonoMultipleVentaCredito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_RegistrarAbonoMultipleVentaCredito`(
   IN p_IdUsuario INT,
    IN p_IdCaja INT,
    IN p_IdCliente INT,
    IN p_MontoAbonado DECIMAL(10, 2),
    IN p_Observacion  TEXT,
    IN p_MetodoPago VARCHAR(50)
)
BEGIN
    DECLARE v_SaldoPendiente DECIMAL(10, 2);
    DECLARE v_id_arqueo INT;
    DECLARE v_id_movimiento INT;
    DECLARE v_id_abono INT;
    DECLARE v_IdVenta INT;
    DECLARE v_IdVentaCredito INT;
    DECLARE v_MontoRestante DECIMAL(10,2);
    DECLARE v_AbonoAplicado DECIMAL(10,2);
    DECLARE mensaje VARCHAR(255);
    DECLARE done INT DEFAULT 0;

    -- Cursor para recorrer los créditos pendientes
    DECLARE cur CURSOR FOR 
        SELECT id_venta_credito, saldo_pendiente, id_venta
        FROM ventas_credito
        WHERE id_cliente = p_IdCliente AND saldo_pendiente > 0
        ORDER BY fecha_venta ASC;

    -- Handler para el cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Handler para excepciones SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET mensaje = 'Ocurrió un error al registrar el abono. La transacción ha sido revertida.';
        SELECT mensaje AS resultado;
    END;

    -- Inicia la transacción
    START TRANSACTION;

              -- Eliminar espacios al inicio y fin
     SET p_MetodoPago = LTRIM(RTRIM(p_MetodoPago));
              
    -- Obtener el arqueo de caja abierto
    SELECT id_arqueo_caja INTO v_id_arqueo
    FROM arqueo_caja
    WHERE id_usuario = p_IdUsuario AND id_caja = p_IdCaja AND estado = 1
    ORDER BY fecha_inicio DESC
    LIMIT 1;

    IF v_id_arqueo IS NOT NULL THEN

        -- Obtener o crear movimiento en caja
        SELECT id_movimiento_caja INTO v_id_movimiento
        FROM movimiento_caja
        WHERE id_arqueo = v_id_arqueo AND id_usuario = p_IdUsuario AND estado = 1 
              AND tipo_movimiento = 'Ingreso' AND tipo_referencia = 'Ingreso'
        ORDER BY fecha_registro DESC
        LIMIT 1;

        IF v_id_movimiento IS NULL THEN
            INSERT INTO movimiento_caja (id_arqueo, tipo_movimiento, tipo_referencia, id_usuario)
            VALUES (v_id_arqueo, 'Ingreso', 'Ingreso', p_IdUsuario);
            SET v_id_movimiento = LAST_INSERT_ID();
        END IF;

        SET v_MontoRestante = p_MontoAbonado;

        OPEN cur;

        read_loop: LOOP
            FETCH cur INTO v_IdVentaCredito, v_SaldoPendiente, v_IdVenta;

            IF done = 1 OR v_MontoRestante <= 0 THEN
                LEAVE read_loop;
            END IF;

            IF v_MontoRestante >= v_SaldoPendiente THEN
                SET v_AbonoAplicado = v_SaldoPendiente;
            ELSE
                SET v_AbonoAplicado = v_MontoRestante;
            END IF;

            -- Insertar abono
            INSERT INTO abonos_credito (id_venta_credito, id_movimiento_caja, monto_abonado, metodo_pago,observacion)
            VALUES (v_IdVentaCredito, v_id_movimiento, v_AbonoAplicado, p_MetodoPago,p_Observacion);

            SET v_id_abono = LAST_INSERT_ID();

            -- Insertar detalle de ingreso
            INSERT INTO detalle_ingresos (id_movimiento_caja, tipo_ingresos, tipo_pago, id_ventas, id_abono, monto, descripcion)
            VALUES (v_id_movimiento, 'Creditos', p_MetodoPago, v_IdVenta, v_id_abono, v_AbonoAplicado, p_Observacion);

            -- Actualizar el crédito
            UPDATE ventas_credito
            SET saldo_pendiente = saldo_pendiente - v_AbonoAplicado,
                monto_abonado = monto_abonado + v_AbonoAplicado
            WHERE id_venta_credito = v_IdVentaCredito;

            IF v_SaldoPendiente - v_AbonoAplicado = 0 THEN
                UPDATE ventas_credito
                SET estado = 'Pagado'
                WHERE id_venta_credito = v_IdVentaCredito;
            END IF;

            SET v_MontoRestante = v_MontoRestante - v_AbonoAplicado;
        END LOOP;

        CLOSE cur;

        IF v_MontoRestante > 0 THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'El monto abonado excede el total de la deuda del cliente';
        END IF;

        COMMIT;
        SET mensaje = 'Abono registrado con éxito.';
        SELECT mensaje AS resultado;

    ELSE
        ROLLBACK;
        SET mensaje = 'No se encontró arqueo de caja abierto para el usuario.';
        SELECT mensaje AS resultado;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_RegistrarAbonoVentaCredito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_RegistrarAbonoVentaCredito`(
 IN p_IdUsuario INT,
    IN p_IdCaja INT,
    IN p_IdVentaCredito INT,
    IN p_Abono DECIMAL(10, 2),
    IN p_Observacion TEXT,
    IN p_MetodoPago VARCHAR(50)
)
BEGIN
    DECLARE v_SaldoPendiente DECIMAL(10, 2);
    DECLARE v_id_arqueo INT;
    DECLARE v_id_movimiento INT;
    DECLARE v_id_abono INT;
    DECLARE v_IdVenta INT;

    DECLARE mensaje VARCHAR(255);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Si ocurre algún error, revierte la transacción
        ROLLBACK;
        SET mensaje = 'Error: No se pudo registrar el abono.';
        SELECT mensaje AS resultado;
    END;

    
    START TRANSACTION;

          -- Eliminar espacios al inicio y fin
    SET p_Observacion = LTRIM(RTRIM(p_Observacion));
     SET p_MetodoPago = LTRIM(RTRIM(p_MetodoPago));
          
    -- Obtener el arqueo de caja abierto
    SELECT id_arqueo_caja INTO v_id_arqueo
    FROM arqueo_caja
    WHERE id_usuario = p_IdUsuario AND id_caja = p_IdCaja AND estado = 1
    ORDER BY fecha_inicio DESC
    LIMIT 1;

    IF v_id_arqueo IS NOT NULL THEN

        -- Obtener movimiento existente
        SELECT id_movimiento_caja INTO v_id_movimiento
        FROM movimiento_caja
        WHERE id_arqueo = v_id_arqueo AND id_usuario = p_IdUsuario
            AND estado = 1 AND tipo_movimiento = 'Ingreso' AND tipo_referencia = 'Ingreso'
        ORDER BY fecha_registro DESC
        LIMIT 1;

        IF v_id_movimiento IS NULL THEN
            -- Insertar nuevo movimiento
            INSERT INTO movimiento_caja (id_arqueo, tipo_movimiento, tipo_referencia, id_usuario)
            VALUES (v_id_arqueo, 'Ingreso', 'Ingreso', p_IdUsuario);

            SET v_id_movimiento = LAST_INSERT_ID();
        END IF;

        -- Obtener el saldo pendiente y el id_venta
        SELECT saldo_pendiente, id_venta INTO v_SaldoPendiente, v_IdVenta
        FROM ventas_credito
        WHERE id_venta_credito = p_IdVentaCredito;

        -- Verificar que el abono no exceda el saldo pendiente
        IF p_Abono > v_SaldoPendiente THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El abono no puede ser mayor al saldo pendiente';
        END IF;

        -- Insertar abono
        INSERT INTO abonos_credito (id_usuario, id_venta_credito, id_movimiento_caja, monto_abonado, metodo_pago,observacion)
        VALUES (p_IdUsuario, p_IdVentaCredito, v_id_movimiento, p_Abono, p_MetodoPago,p_Observacion);

        SET v_id_abono = LAST_INSERT_ID();

        -- Insertar detalle de ingreso
        INSERT INTO detalle_ingresos (id_movimiento_caja, tipo_ingresos, tipo_pago, id_ventas, id_abono, monto, descripcion)
        VALUES (v_id_movimiento, 'Creditos', p_MetodoPago, v_IdVenta, v_id_abono, p_Abono, p_Observacion);

        -- Actualizar la venta a crédito
        UPDATE ventas_credito
        SET saldo_pendiente = saldo_pendiente - p_Abono,
            monto_abonado = monto_abonado + p_Abono
        WHERE id_venta_credito = p_IdVentaCredito;

        -- Si ya no hay saldo pendiente, marcar como pagado
        IF v_SaldoPendiente - p_Abono = 0 THEN
            UPDATE ventas_credito
            SET estado = 'Pagado'
            WHERE id_venta_credito = p_IdVentaCredito;
        END IF;

    END IF;

    COMMIT;

    SET mensaje = 'Abono registrado con éxito.';
    SELECT mensaje AS resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_registrarIngresoKardex` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_registrarIngresoKardex`(
  IN p_id_producto INT, 
  IN p_codigo_producto VARCHAR(20), 
  IN p_concepto VARCHAR(100), 
  IN p_nuevo_stock INT,
  IN p_cantidad INT, 
  IN p_precio_compra DECIMAL(10,2), 
  IN p_tipo_ingreso VARCHAR(20), -- valores posibles: 'COMPRA', 'PROMOCION'
  IN p_fecha_vencimiento DATE,
  IN p_id_usuario INT
)
BEGIN
    DECLARE mensaje VARCHAR(255);
    DECLARE v_unidades_ex FLOAT;
    DECLARE v_costo_unitario_ex FLOAT;    
    DECLARE v_costo_total_ex FLOAT;
    DECLARE v_perecedero_producto INT;

    DECLARE v_unidades_entrada FLOAT;
    DECLARE v_costo_unitario_entrada FLOAT;    
    DECLARE v_costo_total_entrada FLOAT;

    DECLARE v_cantidad_comprada INT DEFAULT 0;
    DECLARE v_cantidad_bonificada INT DEFAULT 0;
    DECLARE v_costo_final DECIMAL(10,2);

    DECLARE v_id_asiento INT;
    
  

    -- Manejo de errores SQL
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        SET mensaje = 'Error al registrar ingreso de producto.';
        SELECT mensaje AS resultado;
        ROLLBACK;
    END;
    
      	-- Eliminar espacios al inicio y fin
   SET p_codigo_producto = LTRIM(RTRIM(p_codigo_producto));
   SET p_concepto = LTRIM(RTRIM(p_concepto));
   SET p_tipo_ingreso = LTRIM(RTRIM(p_tipo_ingreso));

    START TRANSACTION;

    -- Obtener existencias actuales (último registro de kardex)
    SELECT k.existencia_costo_unitario, k.existencia_unidades, k.existencia_costo_total
    INTO v_costo_unitario_ex, v_unidades_ex, v_costo_total_ex
    FROM kardex K
    WHERE K.id_producto = p_id_producto
    ORDER BY id DESC
    LIMIT 1;

    IF p_tipo_ingreso = 'COMPRA' THEN
        SET v_cantidad_comprada = p_cantidad;
        SET v_costo_final = p_precio_compra;
    ELSEIF p_tipo_ingreso = 'PROMOCION' THEN
        SET v_cantidad_bonificada = p_cantidad;
        SET v_costo_final = 0.00;
    END IF;

    SET v_unidades_entrada = (p_nuevo_stock - v_unidades_ex);
    SET v_costo_unitario_entrada = v_costo_final;
    SET v_costo_total_entrada = v_unidades_entrada * v_costo_unitario_entrada;

    SET v_unidades_ex = ROUND(p_nuevo_stock, 2);
    SET v_costo_total_ex = ROUND(v_costo_total_ex + v_costo_total_entrada, 2);

    IF v_costo_total_ex > 0 THEN
        SET v_costo_unitario_ex = ROUND(v_costo_total_ex / v_unidades_ex, 2);
    ELSE
        SET v_costo_unitario_ex = 0.00;
    END IF;

    -- Registrar en Kardex
    INSERT INTO kardex(
        id_usuario_creacion,
        id_producto,
        codigo_producto,
        concepto,
        entrada_unidades,
        entrada_costo_unitario,
        entrada_costo_total,
        existencia_unidades,
        existencia_costo_unitario,
        existencia_costo_total
    ) VALUES (
        p_id_usuario,
        p_id_producto,
        p_codigo_producto,
        p_concepto,
        v_unidades_entrada,
        v_costo_unitario_entrada,
        v_costo_total_entrada,
        v_unidades_ex,
        v_costo_unitario_ex,
        v_costo_total_ex
    );

    -- Consultar si el producto es perecedero
    SELECT perecedero_producto INTO v_perecedero_producto 
    FROM producto 
    WHERE codigo_barra = p_codigo_producto AND id_producto = p_id_producto;

    -- Insertar en lote_producto si es perecedero o no
    IF v_perecedero_producto = 1 THEN
        INSERT INTO lote_producto(
            id_usuario_creacion,
            id_producto,
            cantidad_comprada,
            cantidad_bonificada,
            stock_disponible,
            costo_unitario,
            fecha_vencimiento
        ) VALUES (
            p_id_usuario,
            p_id_producto,
            v_cantidad_comprada,
            v_cantidad_bonificada,
            p_cantidad,
            v_costo_final,
            p_fecha_vencimiento
        );
    ELSE
        INSERT INTO lote_producto(
            id_usuario_creacion,
            id_producto,
            cantidad_comprada,
            cantidad_bonificada,
            stock_disponible,
            costo_unitario
        ) VALUES (
            p_id_usuario,
            p_id_producto,
            v_cantidad_comprada,
            v_cantidad_bonificada,
            p_cantidad,
            v_costo_final
        );
    END IF;

    -- Actualizar stock del producto
    UPDATE producto 
    SET stock_producto = stock_producto + p_cantidad,
        id_usuario_actualizacion = p_id_usuario
    WHERE id_producto = p_id_producto;

    -- Registrar asiento contable
    INSERT INTO asiento_contable(
        fecha,
        descripcion,
        tipo_asiento,
        id_referencia,
        modulo_origen,
        total_debe,
        total_haber,
        fecha_creacion,
        tipo_referencia
    ) VALUES (
        CURDATE(),
        CONCAT('Ingreso de producto ', p_codigo_producto, ' - ', p_concepto),
        'COMPRA',
        NULL,
        'INVENTARIO',
        v_costo_total_entrada,
        v_costo_total_entrada,
        NOW(),
        'KARDEX'
    );

    SET v_id_asiento = LAST_INSERT_ID();

    -- Detalles del asiento según tipo ingreso
    IF p_tipo_ingreso = 'COMPRA' THEN
        -- Debe: Inventario (104)
        INSERT INTO detalle_asiento(
            id_asiento,
            id_cuenta,
            debe,
            descripcion,
            orden
        ) VALUES (
            v_id_asiento,
            9, -- cuenta inventario (ajustar según tu plan de cuentas)
            v_costo_total_entrada,
            'Ingreso inventario por compra',
            1
        );

        -- Haber: Proveedores o cuentas por pagar (ejemplo id_cuenta=201)
        INSERT INTO detalle_asiento(
            id_asiento,
            id_cuenta,
            debe,
            descripcion,
            orden
        ) VALUES (
            v_id_asiento,
            6, -- cuenta pasivo compra
            v_costo_total_entrada,
            'Caja efectivo  por compra',
            2
        );
    ELSEIF p_tipo_ingreso = 'PROMOCION' THEN
    
        -- Debe: Inventario (104)
        INSERT INTO detalle_asiento(
            id_asiento,
            id_cuenta,
            debe,
            descripcion,
            orden
        ) VALUES (
            v_id_asiento,
            9, -- cuenta productos bonificados (gasto)
            v_costo_total_entrada,
            'Ingreso producto bonificado',
            1
        );

         -- Haber: Productos bonificados (600)
        INSERT INTO detalle_asiento(
            id_asiento,
            id_cuenta,
            haber,
            descripcion,
            orden
        ) VALUES (
            v_id_asiento,
            16, -- cuenta inventario
            v_costo_total_entrada,
            'Bonificación proveedor',
            2
        );
    END IF;

    -- Registrar auditoría
    INSERT INTO log_auditoria (
        tabla,
        accion,
        usuario_id,
        fecha,
        detalle,
        id_registro_afectado,
        modulo
    ) VALUES (
        'producto / lote_producto / kardex',
        'REGISTRO_INGRESO',
        p_id_usuario,
        NOW(),
        CONCAT('Ingreso de producto ID: ', p_id_producto, 
               ', código: ', p_codigo_producto, 
               ', tipo ingreso: ', p_tipo_ingreso, 
               ', cantidad: ', p_cantidad),
        p_id_producto,
        'INVENTARIO'
    );

    COMMIT;

    SET mensaje = 'Ingreso registrado con éxito.';
    SELECT mensaje AS resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_RegistrarKardexVencido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_RegistrarKardexVencido`(
     IN p_id_producto INT,
     in p_codigo_producto VARCHAR(20),
     IN p_observacion TEXT ,
     in p_nuevo_stock INT,
     IN p_cantidad INT,
     in p_precio_compra decimal(10,2), 
     IN p_tipo_ajuste varchar(50),-- ('PERDIDA', 'DEVOLUCION', 'CAMBIO'),
     IN p_fecha_vencimiento DATE
     )
BEGIN
    DECLARE v_total_disponible INT DEFAULT 0;
    DECLARE v_resto INT DEFAULT p_cantidad;
    DECLARE done INT DEFAULT FALSE;
                          
  -- Variables para cursor
    DECLARE v_id_lote INT;
    DECLARE v_stock INT;
  
  -- para kardex
    declare v_unidades_ex float;
	declare v_costo_unitario_ex float;    
	declare v_costo_total_ex float;

    declare v_unidades_salida float;
	declare v_costo_unitario_salida float;    
	declare v_costo_total_salida float;
    
        
  DECLARE v_cantidad_comprada INT DEFAULT 0;
  DECLARE v_cantidad_bonificada INT DEFAULT 0;
  DECLARE v_costo_final DECIMAL(10,2);
    -- Cursor para recorrer los lotes ordenados por id_lote (FIFO)
    DECLARE cur_lotes CURSOR for
    
        SELECT id_lote, stock_disponible
        FROM lote_producto
        WHERE id_producto = p_id_producto
          AND fecha_vencimiento = p_fecha_vencimiento
          AND estado = 1
          AND stock_disponible > 0
        ORDER BY id_lote;
        
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;  
  
   -- Calcular total disponible
    SELECT SUM(stock_disponible) INTO v_total_disponible
    FROM lote_producto
    WHERE id_producto = p_id_producto
      AND fecha_vencimiento = p_fecha_vencimiento
      AND estado = 1
      AND stock_disponible > 0;
    
     IF v_total_disponible IS NULL OR v_total_disponible < p_cantidad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock insuficiente en lotes con esa fecha de vencimiento';
    END IF;
 
 
   
    -- Abrimos cursor
    OPEN cur_lotes;
     
     read_loop: LOOP
        FETCH cur_lotes INTO v_id_lote, v_stock;
        IF done THEN
            LEAVE read_loop;
        END IF;

        IF v_resto <= 0 THEN
            LEAVE read_loop;
        END IF;

        -- Cuánto restar en este lote
        IF v_resto >= v_stock THEN
            -- Usar todo el lote
            UPDATE lote_producto
            SET stock_disponible = 0,
                estado=0
            WHERE id_lote = v_id_lote;

            INSERT INTO ajuste_lote (id_lote, cantidad, motivo, observacion)
            VALUES (v_id_lote, v_stock, p_tipo_ajuste, p_observacion);

            SET v_resto = v_resto - v_stock;
        ELSE
            -- Usar parte del lote
            UPDATE lote_producto
            SET stock_disponible = stock_disponible - v_resto
            WHERE id_lote = v_id_lote;
            
              UPDATE lote_producto
            SET  estado=0
            WHERE id_lote = v_id_lote and stock_disponible=0;


            INSERT INTO ajuste_lote (id_lote, cantidad, motivo, observacion)
            VALUES (v_id_lote, v_resto, p_tipo_ajuste, p_observacion);

            SET v_resto = 0;
        END IF;

    END LOOP;

    CLOSE cur_lotes;   
   
     
    
        -- Lógica de separación de tipo de ingreso
  IF p_tipo_ajuste = 'PERDIDA' THEN
 --   SET v_cantidad_comprada = p_cantidad;
    SET v_costo_final = p_precio_compra;
  ELSEIF p_tipo_ajuste = 'DEVOLUCION' THEN
  --  SET v_cantidad_bonificada = p_cantidad;
    SET v_costo_final = 0.00; -- productos gratis no tienen costo
  END IF;

	/*OBTENEMOS LAS ULTIMAS EXISTENCIAS DEL PRODUCTO*/    

    SELECT k.existencia_costo_unitario , k.existencia_unidades, k.existencia_costo_total
    into v_costo_unitario_ex, v_unidades_ex, v_costo_total_ex
    FROM kardex K
    WHERE K.id_producto = p_id_producto
    ORDER BY ID DESC
    LIMIT 1;
    
    
      /*SETEAMOS LOS VALORES PARA EL REGISTRO DE SALIDA*/

    SET v_unidades_salida = (v_unidades_ex - p_nuevo_stock);
    SET v_costo_unitario_salida = v_costo_final;
    SET v_costo_total_salida = v_unidades_salida * v_costo_unitario_salida;

    
    /*SETEAMOS LAS EXISTENCIAS ACTUALES*/

    SET v_unidades_ex = ROUND(p_nuevo_stock,2);    
    SET v_costo_total_ex = ROUND(v_costo_total_ex - v_costo_total_salida,2);
    
    IF(v_costo_total_ex > 0) THEN
		SET v_costo_unitario_ex = ROUND(v_costo_total_ex/v_unidades_ex,2);
	else
		SET v_costo_unitario_ex = ROUND(0,2);

    END IF;
    
        	INSERT INTO KARDEX(id_producto,
                        codigo_producto,
                        concepto,
                        salidad_unidades,
                        salidad_costo_unitario,
                        salidad_costo_total,
                        existencia_unidades,
                        existencia_costo_unitario,
                        existencia_costo_total)

				VALUES(p_id_producto,
                         p_codigo_producto,
                        p_observacion,
                        v_unidades_salida,
                        v_costo_unitario_salida,
                        v_costo_total_salida,
                        v_unidades_ex,
                        v_costo_unitario_ex,
                        v_costo_total_ex);

            
     UPDATE producto 

	SET stock_producto = stock_producto-p_cantidad

	WHERE id_producto = p_id_producto ; 
    
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_registrar_o_actualizar_empresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_registrar_o_actualizar_empresa`(
    IN p_id_empresa INT, -- Nuevo parámetro, NULL para INSERT
    IN p_razon_social VARCHAR(255),
    IN p_nombre_comercial VARCHAR(255),
    IN p_ruc VARCHAR(13),
    IN p_marca VARCHAR(255),
    IN p_id_firma INT,
    IN p_direccion_matriz TEXT,
    IN p_direccion_sucursal TEXT,
    IN p_email VARCHAR(255),
    IN p_telefono VARCHAR(20),
    IN p_mensaje TEXT,
    IN p_contribuyente_especial VARCHAR(50),
    IN p_obligado_contabilidad VARCHAR(2),
    IN p_ambiente VARCHAR(1),
    IN p_tipo_emision VARCHAR(1),
    IN p_establecimiento_codigo VARCHAR(3),
    IN p_punto_emision_codigo VARCHAR(3),
    IN p_secuencial INT,
    IN p_codigo_iva INT,
    IN p_logo_path VARCHAR(255),
    IN p_id_usuario INT
)
BEGIN
  DECLARE mensaje VARCHAR(255);
	IF p_id_empresa IS NULL OR p_id_empresa = 0 THEN
        -- INSERT (Nuevo Registro)
        INSERT INTO empresa ( -- Reemplaza 'empresas' con el nombre real de tu tabla
            razon_social,
            nombre_comercial,
            ruc,
            marca,
            id_firma,
            direccion_matriz,
            direccion_sucursal,
            email,
            telefono,
            mensaje,
            contribuyente_especial,
            obligado_contabilidad,
            ambiente,
            tipo_emision,
            establecimiento_codigo,
            punto_emision_codigo,
            secuencial,
            codigo_iva,
            logo_path
        ) VALUES (
            p_razon_social,
            p_nombre_comercial,
            p_ruc,
            p_marca,
            p_id_firma,
            p_direccion_matriz,
            p_direccion_sucursal,
            p_email,
            p_telefono,
            p_mensaje,
            p_contribuyente_especial,
            p_obligado_contabilidad,
            p_ambiente,
            p_tipo_emision,
            p_establecimiento_codigo,
            p_punto_emision_codigo,
            p_secuencial,
            p_codigo_iva,
            p_logo_path
        );
 
         SET mensaje = 'Empresa registrada con éxito.';
    ELSE
        -- UPDATE (Actualización de Registro Existente)
        UPDATE empresa SET -- Reemplaza 'empresas'
            razon_social = p_razon_social,
            nombre_comercial = p_nombre_comercial,
            ruc = p_ruc,
            marca = p_marca,
            id_firma = p_id_firma,
            direccion_matriz = p_direccion_matriz,
            direccion_sucursal = p_direccion_sucursal,
            email = p_email,
            telefono = p_telefono,
            mensaje = p_mensaje,
            contribuyente_especial = p_contribuyente_especial,
            obligado_contabilidad = p_obligado_contabilidad,
            ambiente = p_ambiente,
            tipo_emision = p_tipo_emision,
            establecimiento_codigo = p_establecimiento_codigo,
            punto_emision_codigo = p_punto_emision_codigo,
            secuencial = p_secuencial,
            codigo_iva = p_codigo_iva,
            logo_path = p_logo_path -- Actualiza la ruta del logo
        WHERE id_empresa = p_id_empresa; -- Asegúrate de que 'id_empresa' sea tu clave primaria

          SET mensaje = 'Empresa actualizada con éxito';
    END IF;
             SELECT mensaje AS resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_RegistroMovimientoEntrada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_RegistroMovimientoEntrada`(

in p_IdUsuario int,



                                                   in p_IdCaja int,



                                                   in p_tipo_pago int,



                                                   in p_Monto decimal(10,2),



                                                   in p_descripcion varchar(200) )
begin



	 



	 DECLARE v_id_arqueo INT;



     DECLARE v_id_movimiento INT;



 



   



	   -- Obtener el arqueo de caja abierto



    SELECT id_arqueo_caja INTO v_id_arqueo



    FROM arqueo_caja



    WHERE id_usuario = p_IdUsuario  and id_caja=p_IdCaja AND estado = 1



    ORDER BY fecha_inicio DESC



    LIMIT 1;



   



    IF v_id_arqueo IS NOT NULL then



    



          -- Obtener movimiento



    SELECT id_movimiento_caja INTO v_id_movimiento



    FROM movimiento_caja



    WHERE id_arqueo= v_id_arqueo and id_usuario = p_IdUsuario AND estado = 1 and tipo_movimiento='Ingreso'



    and tipo_referencia='Ingreso'



    ORDER BY fecha_registro DESC



    LIMIT 1;



    



      if v_id_movimiento is null then



        -- Insertar movimiento en caja



        INSERT INTO movimiento_caja (id_arqueo, tipo_movimiento, tipo_referencia, id_usuario)



        VALUES (v_id_arqueo, 'Ingreso', 'Ingreso', p_IdUsuario);



        



        SET v_id_movimiento = LAST_INSERT_ID();



        END IF;



     



       INSERT INTO detalle_ingresos (id_movimiento_caja, tipo_ingresos, tipo_pago, monto,descripcion)



        VALUES (v_id_movimiento, 'Otros', p_tipo_pago, p_Monto,p_descripcion);



       



       



    END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_RegistroMovimientoSalida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_RegistroMovimientoSalida`(

                                                   in p_IdUsuario int,



                                                   in p_IdCaja int,



                                                   in p_tipo_pago int,



                                                   in p_monto decimal(10,2),



                                                   in p_descripcion varchar(200) )
begin



	 



	 DECLARE v_id_arqueo INT;



     DECLARE v_id_movimiento INT;



   



   



	   -- Obtener el arqueo de caja abierto



    SELECT id_arqueo_caja INTO v_id_arqueo



    FROM arqueo_caja



    WHERE id_usuario = p_IdUsuario  and id_caja=p_IdCaja AND estado = 1



    ORDER BY fecha_inicio DESC



    LIMIT 1;



   



    IF v_id_arqueo IS NOT NULL then



    



          -- Obtener movimiento



    SELECT id_movimiento_caja INTO v_id_movimiento



    FROM movimiento_caja



    WHERE id_arqueo= v_id_arqueo and id_usuario = p_IdUsuario AND estado = 1 and tipo_movimiento='Egreso'



    and tipo_referencia='Gasto'



    ORDER BY fecha_registro DESC



    LIMIT 1;



    



      if v_id_movimiento is null then



        -- Insertar movimiento en caja



        INSERT INTO movimiento_caja (id_arqueo, tipo_movimiento, tipo_referencia, id_usuario)



        VALUES (v_id_arqueo, 'Egreso', 'Gasto', p_IdUsuario);



        



        SET v_id_movimiento = LAST_INSERT_ID();



        END IF;



     



    -- Insertar en detalle_gastos



        INSERT INTO detalle_gastos (id_movimiento_caja,afectarCaja,tipo_gastos, tipo_pago,monto,descripcion)



        VALUES (v_id_movimiento,1,'Otros', p_tipo_pago, p_monto,p_descripcion);



   



       



    END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_RegistroProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_RegistroProducto`(
 in p_codigo_barra varchar(20),

                                                               in p_id_categoria_producto int,

                                                               in p_id_unidades int,

                                                               in p_descripcion_producto varchar(40),

                                                               in p_img_producto varchar(50),

                                                               in p_precio_compra_producto decimal(10,2),

                                                               in p_precio_venta_producto decimal(10,2),

                                                               in p_precio_1_producto decimal(10,2),

                                                               in p_precio_2_producto decimal(10,2),

                                                               in p_precio_fraccion decimal(10,2),

                                                               in p_precio_fraccion1 decimal(10,2),

                                                               in p_precio_fraccion2 decimal(10,2),

                                                               in p_unidades float,

                                                               in p_stock_fraccion float,

                                                               in p_lleva_iva_producto int,

                                                               in p_costo_total_producto decimal(10,2),

                                                               in p_stock_producto float,

                                                               in p_minimo_stock_producto float,    

                                                               in p_perecedero_producto int,

                                                               in p_ventas_producto float,

                                                               in p_ventas_fracion_producto float

                                                                 )
begin

	

	DECLARE J_fecha_registro datetime;

    declare J_concepto varchar(600);

	DECLARE J_IdProducto int;

	set J_fecha_registro = (select now());



insert

	into

	producto(codigo_barra,

	id_categoria_producto,

	id_unidades,

	descripcion_producto,

	img_producto,

	precio_compra_producto,

	precio_venta_producto,

	precio_1_producto,

	precio_2_producto,

	preccio_fraccion,

	precio_fraccion_1,

	precio_fraccion_2,

	unidades,

	stock_fraccion,

	lleva_iva_producto,

	costo_total_producto,

	stock_producto,

	minimo_stock_producto,

	perecedero_producto,

	ventas_producto,

	ventas_fracion_producto,

	fecha_creacion_producto

                           )



values (p_codigo_barra,

        p_id_categoria_producto,

        p_id_unidades,

        p_descripcion_producto,

        p_img_producto,

        p_precio_compra_producto,

        p_precio_venta_producto,

        p_precio_1_producto,

        p_precio_2_producto,

        p_precio_fraccion,

        p_precio_fraccion1,

        p_precio_fraccion2,

        p_unidades,

        p_stock_fraccion,

        p_lleva_iva_producto,

        p_costo_total_producto,

        p_stock_producto,

        p_minimo_stock_producto,    

        p_perecedero_producto,

        p_ventas_producto,

        p_ventas_fracion_producto,

        J_fecha_registro

              );

              

 SET J_IdProducto = LAST_INSERT_ID();



insert

	into

	stock_producto(

    id_producto,

	cantidad_comprada,

	stock_disponible,

	costo_unitario)

values(J_IdProducto,

       p_stock_producto,

       p_stock_producto,

       p_precio_compra_producto);

      

      set J_concepto='INVENTARIO INICIAL';

     

   INSERT INTO KARDEX (id_producto,

                       codigo_producto,

                       fecha,

                       concepto,

                       existencia_unidades,

                       existencia_costo_unitario,

                       existencia_costo_total)

               VALUES (J_IdProducto,

                       p_codigo_barra,

                       J_fecha_registro, 

                       J_concepto, 

                       p_stock_producto, 

                       p_precio_compra_producto, 

                       p_costo_total_producto);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_RegistroRol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_RegistroRol`(
in p_descripcion varchar(100) )
BEGIN



declare fecha datetime;

set fecha = (select now());



INSERT INTO perfiles(descripcion, 

                                                                        estado, 

                                                                       

                                                                        fecha_creacion) 

                                                VALUES (p_descripcion, 

                                                        1, 

                                                      

                                                        fecha);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_reportes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_reportes`(
 in p_opcion int,
                                                    in p_fechaDesde date,
                                                    in p_fechaHasta date
                                                   )
BEGIN

-- poco stock

if (p_opcion =1)then



select "" as vacio,p.codigo_barra,

		p.descripcion_producto,

        p.stock_producto,

        p.minimo_stock_producto

from producto p

where p.stock_producto <= p.minimo_stock_producto

order by p.stock_producto asc;


-- producto mas vendidos

elseif(p_opcion =2) then

select  '' as vacio ,p.codigo_barra,

		p.descripcion_producto,

        sum(vd.cantidad) as cantidad,

        sum(Round(vd.total_venta,2)) as total_venta

from det_venta vd inner join producto p on vd.codigo_barra = p.codigo_barra and vd.Activo='1'

group by p.codigo_barra,

		p.descripcion_producto

order by  sum(Round(vd.total_venta,2)) DESC;

-- ganacias por producto

elseif(p_opcion =3) then 


 if p_fechaDesde is null then
 SELECT 
   '' as vacio,
     dv.codigo_barra ,
     dv.descripcion_producto ,
    SUM(dvs.cantidad_vendida) AS total_cantidad_vendida, 
    dvs.precio_venta, 
    dvs.costo_unitario, 
    dvs.ganancia_unitaria, 
    SUM(dvs.cantidad_vendida * dvs.precio_venta) AS total_ventas,
    SUM(dvs.cantidad_vendida * dvs.costo_unitario) AS total_compras,
    SUM(dvs.cantidad_vendida * dvs.ganancia_unitaria) AS total_ganancia
FROM detalle_venta_stock dvs
INNER JOIN stock_producto sp ON dvs.id_stock = sp.id_stock
INNER JOIN det_venta dv ON dvs.id_det_venta = dv.IdDetalleVenta and dv.Activo=1 AND dvs.estado=1
GROUP BY dvs.precio_venta, dvs.costo_unitario, dv.codigo_barra,dv.descripcion_producto;

  else 
  SELECT 
   '' as vacio,
     dv.codigo_barra ,
     dv.descripcion_producto ,
    SUM(dvs.cantidad_vendida) AS total_cantidad_vendida, 
    dvs.precio_venta, 
    dvs.costo_unitario, 
    dvs.ganancia_unitaria, 
    SUM(dvs.cantidad_vendida * dvs.precio_venta) AS total_ventas,
    SUM(dvs.cantidad_vendida * dvs.costo_unitario) AS total_compras,
    SUM(dvs.cantidad_vendida * dvs.ganancia_unitaria) AS total_ganancia
FROM detalle_venta_stock dvs
INNER JOIN stock_producto sp ON dvs.id_stock = sp.id_stock
INNER JOIN det_venta dv ON dvs.id_det_venta = dv.IdDetalleVenta and dv.Activo=1 AND dvs.estado=1
where dv.fecha_venta between p_fechaDesde and p_fechaHasta
GROUP BY dvs.precio_venta, dvs.costo_unitario, dv.codigo_barra,dv.descripcion_producto;
 
   END IF;



-- ventas  del dia de hoy 

elseif(p_opcion = 4) THEN

SELECT Concat('Boleta Nro: ',v.nro_boleta,' - Total Venta: $./ ',Round(dv.total_venta,2)) as nro_boleta,
                                                                dv.codigo_barra,
                                                                c.nombre_categoria,
                                                                p.descripcion_producto,
                                                                concat(dv.cantidad, ' ', m.nombre_corto) as cantidad,
                                                                concat('$./ ',round(dv.total_venta,2)) as total_venta,
                                                                dv.fecha_venta
                                                                -- v.nro_boleta
                                                                FROM det_venta dv  inner join producto p on dv.codigo_barra = p.codigo_barra
                                                                                    inner join ventas v  on v.nro_boleta  = dv.nro_boleta
                                                                                    and v.IdVenta = dv.IdVenta 
                                                                                 
                                                                                    and v.Activo = 1 and v.Activo=1 
                                                                                    inner join categorias c on c.id_categoria = p.id_categoria_producto 
                                                                                    inner join medidas m on m.id=p.id_unidades
                                              WHERE DATE(v.fecha_venta) = CURDATE()
                                                        order by v.nro_boleta desc;

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_RevertirStockYkardex` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_RevertirStockYkardex`(
  IN p_IdVenta INT
)
BEGIN
    DECLARE v_IdProducto INT;
    DECLARE v_Cantidad INT;
    DECLARE v_IdDetVenta INT;
    DECLARE done INT DEFAULT FALSE;

    -- Cursor para recorrer los productos vendidos en esta venta
    DECLARE cur CURSOR FOR
        SELECT dv.IdProducto, dv.Cantidad, dv.id
        FROM det_venta dv
        WHERE dv.IdVenta = p_IdVenta;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Abrimos cursor
    OPEN cur;

    leer_loop: LOOP
        FETCH cur INTO v_IdProducto, v_Cantidad, v_IdDetVenta;
        IF done THEN
            LEAVE leer_loop;
        END IF;

        -- 1️⃣ Reponer el stock al producto
        UPDATE producto
        SET stock_producto = stock_producto + v_Cantidad
        WHERE id_producto = v_IdProducto;

        -- 2️⃣ Reponer stock en los lotes (si manejas lotes puedes reinsertar stock en base a det_venta_lote)
        UPDATE producto_lote pl
        JOIN det_venta_lote dvl ON pl.id = dvl.id_lote
        SET pl.stock = pl.stock + dvl.cantidad
        WHERE dvl.id_det_venta = v_IdDetVenta;

    END LOOP;

    CLOSE cur;

    -- 3️⃣ Eliminar registros del kardex de esta venta
    DELETE FROM kardex
    WHERE comprobante IN (
        SELECT nro_boleta FROM ventas WHERE id_venta = p_IdVenta
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_TopVentasCategorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_TopVentasCategorias`()
BEGIN

	select cast(sum(vd.total_venta)  AS DECIMAL(8,2)) as y, c.nombre_categoria as label

    from det_venta vd inner join producto p on vd.codigo_barra = p.codigo_barra

                        inner join categorias c on c.id_categoria = p.id_categoria_producto

                        where vd.Activo=1

    group by c.nombre_categoria



    LIMIT 10;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_top_ventas_categorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_top_ventas_categorias`()
BEGIN

select cast(sum(vd.total_venta)  AS DECIMAL(8,2)) as y, c.nombre_categoria as label

    from det_venta vd inner join producto p on vd.codigo_barra = p.codigo_barra

                        inner join categorias c on c.id_categoria = p.id_categoria_producto

                        where vd.Activo=1

    group by c.nombre_categoria



    LIMIT 10;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ValidarEliminarCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ValidarEliminarCompra`(
IN p_nroBoleta VARCHAR(20),

    IN p_IdUsuario INT

)
begin

    DECLARE v_stock_insuficiente INT DEFAULT 0;

    DECLARE v_IdCompra INT;

    DECLARE v_id_arqueo INT;

    DECLARE v_mensaje VARCHAR(255) DEFAULT '';
  

    -- 1️ Verificar que la compra exista y esté activa

    SELECT IdCompra INTO v_IdCompra

    FROM compras

    WHERE  CAST(nro_boletacompras AS CHAR) = CAST(p_nroBoleta AS CHAR)  AND Activo = 1;

    
    IF v_IdCompra IS NULL THEN

        SET v_mensaje = CONCAT(v_mensaje, 'Error: La compra no existe o ya fue eliminada. ');

    END IF;


    -- 2 Validar que el usuario tenga un arqueo de caja activo

    SELECT id_arqueo_caja INTO v_id_arqueo 

    FROM arqueo_caja 

    WHERE id_usuario = p_IdUsuario AND estado = 1 

    ORDER BY fecha_inicio DESC 

    LIMIT 1;


    IF v_id_arqueo IS NULL THEN

        SET v_mensaje = CONCAT(v_mensaje, 'Error: No hay un arqueo de caja activo para el usuario. ');

    END IF;



    --  Verificar que haya suficiente stock antes de descontarlo

    select  COUNT(*) INTO v_stock_insuficiente

    from stock_producto sp 

    inner join det_compra dc  on  sp.id_producto = dc.IdProducto 

    where dc.IdCompra= v_IdCompra  and sp.stock_disponible  < dc.Cantidad ;

    
    IF v_stock_insuficiente > 0 THEN    

        SET v_mensaje = CONCAT(v_mensaje, 'Error: No hay suficiente stock para eliminar esta compra. ');  

    END IF;

   

       -- Si hay mensajes de error, los devolvemos

    IF v_mensaje <> '' THEN

        SELECT v_mensaje AS mensaje_error;

    ELSE

        SELECT 'OK' AS mensaje_error;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ValidarEliminarVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ValidarEliminarVenta`(

IN p_nroBoleta VARCHAR(20),

    IN p_IdUsuario INT

)
BEGIN

    DECLARE v_IdVenta INT;

    DECLARE v_id_arqueo INT;

    DECLARE v_mensaje VARCHAR(255) DEFAULT '';



    -- Obtener ID de la venta

    SELECT IdVenta INTO v_IdVenta FROM ventas 

    WHERE CAST(nro_boleta AS CHAR) = CAST(p_nroBoleta AS CHAR) 

    AND Activo = 1;



    --  Validar que la venta exista

    IF v_IdVenta IS NULL THEN

        SET v_mensaje = CONCAT(v_mensaje, 'Error: La venta no existe o ya fue anulada. ');

    END IF;



    --  Validar que la venta no tenga devoluciones previas

    IF EXISTS (SELECT 1 FROM detalle_devoluciones WHERE id_ventas = v_IdVenta) THEN

        SET v_mensaje = CONCAT(v_mensaje, 'Error: Esta venta ya tiene una devolución registrada. ');

    END IF;



    --  Validar que el usuario tenga un arqueo de caja activo

    SELECT id_arqueo_caja INTO v_id_arqueo 

    FROM arqueo_caja 

    WHERE id_usuario = p_IdUsuario AND estado = 1 

    ORDER BY fecha_inicio DESC 

    LIMIT 1;



    IF v_id_arqueo IS NULL THEN

        SET v_mensaje = CONCAT(v_mensaje, 'Error: No hay un arqueo de caja activo para el usuario. ');

    END IF;



    --  Validar que la venta tenga productos en detalle_venta_stock

    IF NOT EXISTS (

        SELECT 1 FROM detalle_venta_stock dvs 

        INNER JOIN det_venta dv ON dvs.id_det_venta = dv.IdDetalleVenta

        WHERE dv.IdVenta = v_IdVenta

    ) THEN

        SET v_mensaje = CONCAT(v_mensaje, 'Error: No se encontraron productos en detalle_venta_stock para esta venta. ');

    END IF;



    --  Validar que la venta no tenga pagos pendientes a crédito

    IF EXISTS (

        SELECT 1 FROM abonos_credito ac  

        INNER JOIN ventas_credito vc ON ac.id_venta_credito = vc.id_venta_credito  

        WHERE ac.estado = 1 AND vc.id_venta = v_IdVenta

    ) THEN

        SET v_mensaje = CONCAT(v_mensaje, 'Error: La venta tiene pagos a crédito pendientes. ');

    END IF;



    -- Si hay mensajes de error, los devolvemos

    IF v_mensaje <> '' THEN

        SELECT v_mensaje AS mensaje_error;

    ELSE

        SELECT 'OK' AS mensaje_error;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ValidarLicencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ValidarLicencia`(

in p_usuario varchar(20),

in p_password text, 

in p_ip varchar(30) ,

in p_opcion char(1))
BEGIN



declare J_id_usuario int;

declare J_fecha datetime;



set J_fecha = (select now());

if (p_opcion=1) then

 set J_id_usuario=( select u.id_usuario

                                                from usuarios u 

                                                inner join perfiles p

                                                on u.id_perfil_usuario = p.id_perfil

                                                inner join perfil_modulo pm

                                                on pm.id_perfil = u.id_perfil_usuario

                                                inner join modulos m

                                                on m.id = pm.id_modulo

                                                where u.usuario = p_usuario

                                                and u.clave = p_password

                                                and vista_inicio = 1);

                                                

                                                

select * from licencia_alquirida li_ar inner join licencia li on

li_ar.id_licencia=li.id_licencia and li_ar.estado=1 

where  li_ar.direccion_mac=p_ip  and li_ar.id_usuario= J_id_usuario and li_ar.fecha_vigente >= J_fecha;



elseif(p_opcion=2) then



select * 

                                                from usuarios u 

                                                inner join perfiles p

                                                on u.id_perfil_usuario = p.id_perfil

                                                inner join perfil_modulo pm

                                                on pm.id_perfil = u.id_perfil_usuario

                                                inner join modulos m

                                                on m.id = pm.id_modulo

                                                where u.usuario = p_usuario

                                                and u.clave = p_password

                                                and vista_inicio = 1;

                                                

                                                end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_VentasCreditoAbonar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_VentasCreditoAbonar`(
IN p_id_Cliente int
)
BEGIN

SELECT 
    '' AS vacio,
    cl.id_cliente,
    CONCAT(cl.nombre, ' ', cl.apellido) AS nombre_cliente,
    SUM(vc.monto_total) AS monto_total,
    SUM(vc.monto_abonado) AS monto_abonado,
    SUM(vc.saldo_pendiente) AS saldo_pendiente,
    vc.estado
FROM 
    ventas_credito vc
INNER JOIN 
    ventas v ON vc.id_venta = v.IdVenta
INNER JOIN 
    cliente cl ON v.IdCliente = cl.id_cliente
    where vc.id_cliente= p_id_Cliente AND vc.estado='Pendiente' 
GROUP BY 
    cl.id_cliente, cl.nombre, cl.apellido, vc.estado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_VerificaStockProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_VerificaStockProducto`(

in p_codigo_producto varchar(50), 
in p_cantidad_a_vender float 

)
BEGIN

	        -- Eliminar espacios al inicio y fin
    SET p_codigo_producto = LTRIM(RTRIM(p_codigo_producto));
SELECT   count(*) as existe

                                                    FROM producto p

                                                   WHERE p.codigo_barra = p_codigo_producto

                                                     AND p.stock_producto >= p_cantidad_a_vender

                                                     AND p.estado = 1 ;

	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-17 18:34:14
