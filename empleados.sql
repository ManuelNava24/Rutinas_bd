-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 29-03-2025 a las 22:16:01
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empleados`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `Buscar por puesto de trabajo.`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Buscar por puesto de trabajo.` ()   SELECT * FROM empleado_general 
WHERE puesto = 'Cajero'$$

DROP PROCEDURE IF EXISTS `Buscar productos por categoría.`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Buscar productos por categoría.` ()   SELECT nombre_producto, precio_venta, existencia
FROM Miscelanea
WHERE categoria = 'Refrescos' 
ORDER BY precio_venta DESC$$

DROP PROCEDURE IF EXISTS `Contar empleados por puesto.`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Contar empleados por puesto.` ()   SELECT puesto, COUNT(*) 
FROM empleado_general 
GROUP BY puesto$$

DROP PROCEDURE IF EXISTS `Mostrar empleados con sueldo alto y su puesto.`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Mostrar empleados con sueldo alto y su puesto.` ()   SELECT nombre_completo, puesto, salario
FROM empleado_general
WHERE salario > 10000
ORDER BY salario DESC$$

DROP PROCEDURE IF EXISTS `Mostrar productos ordenados por precio.`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Mostrar productos ordenados por precio.` ()   SELECT nombre_producto, precio_venta, existencia
FROM Miscelanea
ORDER BY precio_venta ASC$$

DROP PROCEDURE IF EXISTS `Mostrar todos los productos.`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Mostrar todos los productos.` ()   SELECT codigo_barras, nombre_producto, categoria, precio_venta
FROM Miscelanea
ORDER BY nombre_producto ASC$$

DROP PROCEDURE IF EXISTS `Productos con bajo inventario.`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Productos con bajo inventario.` ()   SELECT nombre_producto, existencia
FROM Miscelanea
WHERE existencia < 20  
ORDER BY existencia ASC$$

DROP PROCEDURE IF EXISTS `Ver empleados con sus fechas de contratación.`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Ver empleados con sus fechas de contratación.` ()   SELECT nombre_completo, fecha_contratacion 
FROM empleado_general 
ORDER BY fecha_contratacion DESC$$

DROP PROCEDURE IF EXISTS `Ver todos los empleados en orden alfabético.`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Ver todos los empleados en orden alfabético.` ()   SELECT * 
FROM empleado_general 
ORDER BY nombre_completo ASC$$

DROP PROCEDURE IF EXISTS `Verificar existencia por código de barras.`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Verificar existencia por código de barras.` ()   SELECT nombre_producto, existencia
FROM Miscelanea
WHERE codigo_barras = '7501052420018' 
AND existencia > 0$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_general`
--

DROP TABLE IF EXISTS `empleado_general`;
CREATE TABLE IF NOT EXISTS `empleado_general` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(80) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `puesto` varchar(80) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `fecha_contratacion` date NOT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `empleado_general`
--

INSERT INTO `empleado_general` (`id_empleado`, `nombre_completo`, `puesto`, `salario`, `fecha_contratacion`) VALUES
(1, 'Roberto Sánchez', 'Cajero', 8900.00, '2022-01-15'),
(2, 'Luisa Martínez', 'Reponedora', 8500.00, '2025-03-10'),
(3, 'Jorge Hernández', 'Gerente', 15000.00, '2022-05-20'),
(4, 'Ana López', 'Cajera', 8900.00, '2024-02-01'),
(5, 'Carlos Ramírez', 'Almacenista', 9500.00, '2021-11-15'),
(6, 'María García', 'Atención a clientes', 8800.00, '2022-04-05'),
(7, 'Pedro Vargas', 'Limpieza', 8400.00, '2019-06-10'),
(8, 'Sofía Castro', 'Cajera', 8900.00, '2024-01-25'),
(9, 'Daniel Flores', 'Seguridad', 9500.00, '2025-03-02'),
(10, 'Laura Méndez', 'Subgerente', 12000.00, '2023-09-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miscelanea`
--

DROP TABLE IF EXISTS `miscelanea`;
CREATE TABLE IF NOT EXISTS `miscelanea` (
  `codigo_barras` varchar(20) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `nombre_producto` varchar(50) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `categoria` varchar(30) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `precio_venta` decimal(6,2) NOT NULL,
  `existencia` int NOT NULL,
  `fecha_ingreso` date NOT NULL,
  PRIMARY KEY (`codigo_barras`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `miscelanea`
--

INSERT INTO `miscelanea` (`codigo_barras`, `nombre_producto`, `categoria`, `precio_venta`, `existencia`, `fecha_ingreso`) VALUES
('7501055301019', 'Sabritas Original', 'Botanas', 18.50, 45, '2025-03-01'),
('7501055301026', 'Sabritas Adobadas', 'Botanas', 18.50, 32, '2025-03-05'),
('7501033911300', 'Coca-Cola 600ml', 'Refrescos', 20.00, 60, '2025-03-10'),
('7501033911201', 'Sprite 600ml', 'Refrescos', 18.00, 55, '2025-03-08'),
('7501052420018', 'Jugo Boing Mango', 'Jugos', 15.00, 40, '2025-03-12'),
('7501001163512', 'Leche Lala 1L', 'Lácteos', 25.00, 30, '2024-03-15'),
('7501011113047', 'Huevo San Juan 18pz', 'Abarrotes', 48.00, 25, '2025-03-02'),
('7501065401702', 'Pan Bimbo Blanco', 'Panadería', 42.00, 20, '2025-03-14'),
('7501084101510', 'Aceite Capullo', 'Abarrotes', 55.00, 18, '2025-03-07'),
('7501055304010', 'Ruffles Queso', 'Botanas', 22.00, 38, '2025-03-03'),
('7501055305017', 'Doritos Nacho', 'Botanas', 22.00, 42, '2025-03-04'),
('7501033911409', 'Fanta 600ml', 'Refrescos', 18.00, 50, '2025-03-09'),
('7501003123456', 'Arroz SOS 1kg', 'Abarrotes', 30.00, 28, '2025-03-11'),
('7501069200504', 'Atún Dolores', 'Enlatados', 28.00, 35, '2025-03-06'),
('7501043901010', 'Café Nescafé', 'Bebidas', 95.00, 15, '2025-03-13');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
