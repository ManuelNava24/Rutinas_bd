DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Buscar por puesto de trabajo.`()
SELECT * FROM empleado_general 
WHERE puesto = 'Cajero'$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Buscar productos por categoría.`()
SELECT nombre_producto, precio_venta, existencia
FROM Miscelanea
WHERE categoria = 'Refrescos' 
ORDER BY precio_venta DESC$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Contar empleados por puesto.`()
SELECT puesto, COUNT(*) 
FROM empleado_general 
GROUP BY puesto$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Mostrar empleados con sueldo alto y su puesto.`()
SELECT nombre_completo, puesto, salario
FROM empleado_general
WHERE salario > 10000
ORDER BY salario DESC$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Mostrar productos ordenados por precio.`()
SELECT nombre_producto, precio_venta, existencia
FROM Miscelanea
ORDER BY precio_venta ASC$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Mostrar todos los productos.`()
SELECT codigo_barras, nombre_producto, categoria, precio_venta
FROM Miscelanea
ORDER BY nombre_producto ASC$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Productos con bajo inventario.`()
SELECT nombre_producto, existencia
FROM Miscelanea
WHERE existencia < 20  
ORDER BY existencia ASC$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Ver empleados con sus fechas de contratación.`()
SELECT nombre_completo, fecha_contratacion 
FROM empleado_general 
ORDER BY fecha_contratacion DESC$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Ver todos los empleados en orden alfabético.`()
SELECT * 
FROM empleado_general 
ORDER BY nombre_completo ASC$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Verificar existencia por código de barras.`()
SELECT nombre_producto, existencia
FROM Miscelanea
WHERE codigo_barras = '7501052420018' 
AND existencia > 0$$
DELIMITER ;

