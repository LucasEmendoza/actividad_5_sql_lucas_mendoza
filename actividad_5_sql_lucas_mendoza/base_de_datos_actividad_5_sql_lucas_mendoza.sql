-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para heladeria_y_pizzeria_la_65
DROP DATABASE IF EXISTS `heladeria_y_pizzeria_la_65`;
CREATE DATABASE IF NOT EXISTS `heladeria_y_pizzeria_la_65` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `heladeria_y_pizzeria_la_65`;

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.customers
DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `age` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='Esta tabla relaciona todos los clientes del negocio.';

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.customers: ~7 rows (aproximadamente)
DELETE FROM `customers`;
INSERT INTO `customers` (`id`, `name`, `age`) VALUES
	(1, 'Carlos Castaneda', 24),
	(2, 'Fernando Gonzales', 19),
	(3, 'Andres Caisedo', 28),
	(4, 'Pablo Neruda', 39),
	(5, 'Diego Rivera', 34),
	(6, 'Camilo Torres', 30),
	(7, 'Martin Caparros', 25);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.discounts
DROP TABLE IF EXISTS `discounts`;
CREATE TABLE IF NOT EXISTS `discounts` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='Tabla que relaciona los decuentos realizados para dias especiales.';

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.discounts: ~5 rows (aproximadamente)
DELETE FROM `discounts`;
INSERT INTO `discounts` (`id`, `name`, `value`) VALUES
	(1, 'cumpleaños', 0.15),
	(2, 'miercoles feliz', 0.1),
	(3, 'amor y amistad', 0.05),
	(4, 'sábado feliz', 0.12),
	(5, 'elecciones ', 0.1);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='Esta tabla relaciona los productos ofrecidos.';

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.products: ~5 rows (aproximadamente)
DELETE FROM `products`;
INSERT INTO `products` (`id`, `name`, `price`) VALUES
	(1, 'pizza vegetariana', 35000),
	(2, 'pizza vegana', 46000),
	(3, 'pizza hawaina', 40000),
	(4, 'helado', 20000),
	(5, 'pollo', 38000),
	(6, 'sopa ', 15000);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.sales
DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `value` float(12,2) NOT NULL,
  `customer_id` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='Esta tabla relaciona las ventas realizadas en el negocio.';

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.sales: ~6 rows (aproximadamente)
DELETE FROM `sales`;
INSERT INTO `sales` (`id`, `date`, `value`, `customer_id`) VALUES
	(1, '2022-06-14', 80000.00, 1),
	(2, '2022-06-12', 46000.00, 2),
	(3, '2022-06-11', 60000.00, 3),
	(4, '2022-06-06', 70000.00, 4),
	(5, '2022-06-06', 76000.00, 5),
	(6, '2022-06-04', 35000.00, 6);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.sales_discounts
DROP TABLE IF EXISTS `sales_discounts`;
CREATE TABLE IF NOT EXISTS `sales_discounts` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` smallint(6) unsigned NOT NULL,
  `discount_id` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='Tabla pivot, une ventas con descuentos.';

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.sales_discounts: ~5 rows (aproximadamente)
DELETE FROM `sales_discounts`;
INSERT INTO `sales_discounts` (`id`, `sale_id`, `discount_id`) VALUES
	(1, 1, 3),
	(2, 3, 5),
	(3, 4, 1),
	(4, 2, 2),
	(5, 5, 4),
	(6, 6, 1);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.sales_products
DROP TABLE IF EXISTS `sales_products`;
CREATE TABLE IF NOT EXISTS `sales_products` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` smallint(6) unsigned NOT NULL,
  `product_id` smallint(6) unsigned NOT NULL,
  `amount` smallint(5) unsigned NOT NULL,
  `value` float(12,2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='Tabla pivot, une ventas con productos.';

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.sales_products: ~6 rows (aproximadamente)
DELETE FROM `sales_products`;
INSERT INTO `sales_products` (`id`, `sale_id`, `product_id`, `amount`, `value`) VALUES
	(1, 1, 3, 2, 40000.00),
	(2, 2, 2, 1, 46000.00),
	(3, 3, 4, 3, 20000.00),
	(4, 1, 1, 2, 35000.00),
	(5, 4, 5, 2, 38000.00),
	(6, 2, 1, 1, 35000.00);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
