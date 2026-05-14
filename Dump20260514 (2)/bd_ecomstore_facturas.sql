CREATE DATABASE  IF NOT EXISTS `bd_ecomstore` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_ecomstore`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bd_ecomstore
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `fecha_emision` date NOT NULL DEFAULT (curdate()),
  `monto_total` decimal(12,2) NOT NULL,
  `igv` decimal(12,2) GENERATED ALWAYS AS ((`monto_total` * 0.18)) STORED,
  `monto_con_igv` decimal(12,2) GENERATED ALWAYS AS ((`monto_total` * 1.18)) STORED,
  `metodo_pago` enum('tarjeta','transferencia','yape','efectivo') NOT NULL,
  `estado_pago` enum('pendiente','pagado','anulado') NOT NULL DEFAULT 'pendiente',
  PRIMARY KEY (`id_factura`),
  UNIQUE KEY `uq_fac_pedido` (`id_pedido`),
  CONSTRAINT `fk_fac_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` (`id_factura`, `id_pedido`, `fecha_emision`, `monto_total`, `metodo_pago`, `estado_pago`) VALUES (1,1,'2025-01-15',2199.90,'tarjeta','pagado'),(2,2,'2025-01-20',4298.00,'transferencia','pagado'),(3,3,'2025-02-02',1298.00,'tarjeta','pendiente'),(4,4,'2025-02-10',3999.00,'yape','pendiente'),(5,5,'2025-02-18',688.00,'efectivo','pendiente'),(6,6,'2025-03-01',1299.00,'tarjeta','pagado'),(7,8,'2025-03-25',2098.90,'transferencia','anulado'),(8,9,'2025-04-05',399.00,'yape','pendiente'),(9,10,'2025-04-18',5798.00,'tarjeta','pendiente');
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-14  1:28:35
