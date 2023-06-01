-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-09-2022 a las 03:18:52
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pizzeriaproyect`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarArticulo` (IN `IDC` INT(11), IN `IDP` INT(11))  BEGIN
DELETE FROM `comanda_has_productos` WHERE `comanda_has_productos`.`Comanda_idComanda` = IDC AND `comanda_has_productos`.`Productos_idProductos` = IDP;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarIngredientes` (IN `IDP` INT(11), IN `IDI` INT(11))  BEGIN
DELETE FROM `productos_has_insumos` WHERE `productos_has_insumos`.`Productos_idProductos` = IDP AND `productos_has_insumos`.`Insumos_idInsumos` = IDI;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarInsumos` (IN `idp` INT(11))  BEGIN
	if idp=1 then
		UPDATE `insumos` SET `CanChampiñones` = CanChampiñones-1, 
        `CanHarina` = CanHarina-1, `CanQueso` = CanQueso-1, 
        `CanAceite` = CanAceite-1,`CanTomate` = CanTomate-2,
        `CanCarne` = CanCarne-1,`CanAceituna` = CanAceituna-1 WHERE `insumos`.`idInsumos` = 1;
    end if;
    if idp=2 then
		UPDATE `insumos` SET `CanSalchicha` = CanSalchicha-1, 
        `CanHarina` = CanHarina-1, `CanQueso` = CanQueso-1, 
        `CanAceite` = CanAceite-1,`CanTomate` = CanTomate-1,
        `CanJamon` = CanJamon-1,`CanChorizo` = CanChorizo-1,`CanTocino` = CanTocino-1 WHERE `insumos`.`idInsumos` = 1;
    end if;
    if idp=3 then
		UPDATE `insumos` SET `CanChampiñones` = CanChampiñones-1, 
        `CanHarina` = CanHarina-1, `CanQueso` = CanQueso-1, 
        `CanAceite` = CanAceite-1,`CanTomate` = CanTomate-2,
        `CanAceituna` = CanAceituna-1 WHERE `insumos`.`idInsumos` = 1;
    end if;
    if idp=4 then
		UPDATE `insumos` SET  
        `CanHarina` = CanHarina-1, `CanQueso` = CanQueso-5, 
        `CanAceite` = CanAceite-1,`CanTomate` = CanTomate-1 WHERE `insumos`.`idInsumos` = 1;
    end if;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCliente` (IN `NC` VARCHAR(45), IN `TC` VARCHAR(20), IN `CC` VARCHAR(30), IN `DC` VARCHAR(30), IN `RC` VARCHAR(11))  BEGIN
	insert into cliente (NombreCli,Telefonocli,CorreoC,Dirección,RFC) values (NC,TC,CC,DC,RC);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarComandas` (IN `FE` DATE, IN `E_IDE` INT, IN `Tot` DOUBLE, IN `IC` INT(11))  BEGIN
	insert into comanda (Hora,Fecha,Empleado_idEmpleado,Total,IdClientes) values (CURRENT_TIME,FE,E_IDE,Tot,IC);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarFacturas` (IN `FF` DATE, IN `C_IDC` INT)  BEGIN
	insert into facturas (FechaFactura,Comanda_idComanda,Estatus) values (FF,C_IDC,"Pagada");
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarIngredientes` (IN `IDP` INT(11), IN `IDI` INT(11), IN `CI` DOUBLE)  BEGIN
INSERT INTO `productos_has_insumos` (`Productos_idProductos`, `Insumos_idInsumos`, `CantidadIns`) VALUES (IDP, IDI, CI);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarInsumos` ()  BEGIN
	insert into insumos () values ();
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProductos` (IN `NP` VARCHAR(45), IN `Ing` VARCHAR(45), IN `PP` DOUBLE, IN `TP` VARCHAR(10))  BEGIN
	insert into productos (NombreProducto,Ingredientes,Precio,TipoP) values (NP,Ing,PP,TP);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPuesto` (IN `noP` VARCHAR(45), IN `sal` INT)  BEGIN
	insert into puesto (NombreP,Salario) values (noP, sal);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTrabajador` (IN `nomE` VARCHAR(45), IN `CALLN` VARCHAR(20), IN `NSS` VARCHAR(11), IN `COL` VARCHAR(35), IN `fecC` DATE, IN `NombreU` VARCHAR(45), IN `contra` VARCHAR(10), IN `Id_T` INT)  BEGIN
	insert into empleado (NombreEmp,CalleNumero,NumeroSS,Colonia,FechaContrato,NombreUsuario,Password,Puesto_idPuesto) values (nomE, CALLN, NSS, COL, fecC, NombreU, contra, Id_T);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarP` (IN `pp` DOUBLE, IN `idc` INT(11))  BEGIN
UPDATE `comanda` SET `Total` = pp WHERE `comanda`.`idComanda` = idc;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarProductos` (IN `NP` VARCHAR(45), IN `IP` VARCHAR(45), IN `PP` DOUBLE, IN `TP` VARCHAR(10), IN `IDP` INT(11))  BEGIN
UPDATE `productos` SET `NombreProducto` = NP,Ingredientes=IP,Precio=PP,TipoP=TP WHERE `productos`.`idProductos` = IDP;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `NombreCli` varchar(45) DEFAULT NULL,
  `TelefonoCli` varchar(20) NOT NULL,
  `CorreoC` varchar(30) NOT NULL,
  `Dirección` varchar(30) NOT NULL,
  `RFC` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `NombreCli`, `TelefonoCli`, `CorreoC`, `Dirección`, `RFC`) VALUES
(1, 'Carlos', '68', '66', 'Ejercito Mexicano', '12SRR4'),
(2, 'Cris', '669', 'Cris@', 'Juarez', '1234'),
(3, 'Pedro', '123', 'Juan', 'Rio', '3de4'),
(4, 'Juan', '777', '34', 'dbg', '354f'),
(5, 'Spiderman', '777', 'jijija', 'villas del rey', '69sex'),
(6, 'Pancho', '989', 'jijia', 'Juarezzz', '1234'),
(7, 'Pedro', '56', 'ered', 'fdxx', '43rdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comanda`
--

CREATE TABLE `comanda` (
  `idComanda` int(11) NOT NULL,
  `Hora` time DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Empleado_idEmpleado` int(11) NOT NULL,
  `Total` double NOT NULL,
  `IdClientes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comanda`
--

INSERT INTO `comanda` (`idComanda`, `Hora`, `Fecha`, `Empleado_idEmpleado`, `Total`, `IdClientes`) VALUES
(1, '19:35:55', '2022-08-17', 1, 2560, 0),
(2, '19:56:27', '2022-08-17', 1, 1695, 0),
(3, '20:09:45', '2022-08-17', 1, 3525, 0),
(4, '20:11:27', '2022-08-17', 1, 3210, 0),
(7, '20:19:41', '2022-08-17', 1, 1540, 0),
(8, '20:30:58', '2022-08-17', 1, 870, 0),
(9, '20:34:04', '2022-08-17', 1, 1390, 0),
(10, '20:38:02', '2022-08-17', 1, 1540, 0),
(11, '19:38:59', '2022-08-25', 1, 7888, 0),
(13, '21:16:08', '2022-08-26', 1, 7888, 0),
(14, '21:20:16', '2022-08-26', 1, 7888, 0),
(15, '10:49:24', '2022-08-18', 1, 2295, 0),
(16, '10:55:36', '2022-08-18', 1, 1540, 0),
(17, '13:43:54', '2022-08-18', 2, 150, 0),
(18, '15:16:14', '2022-08-18', 1, 700, 0),
(19, '12:02:17', '2022-08-23', 1, 1540, 2),
(20, '13:36:34', '2022-08-23', 1, 2480, 2),
(21, '13:38:20', '2022-08-23', 1, 1540, 3),
(22, '16:26:34', '2022-08-23', 1, 2480, 2),
(23, '16:27:48', '2022-08-23', 1, 1790, 4),
(28, '18:52:11', '2022-08-25', 1, 99, 2),
(29, '19:08:18', '2022-08-25', 1, 1440, 2),
(30, '19:14:16', '2022-08-25', 1, 2200, 2),
(31, '21:39:25', '2022-08-31', 1, 6588, 2),
(32, '21:57:27', '2022-08-31', 1, 12400, 4),
(33, '12:26:16', '2022-09-01', 1, 780, 2),
(34, '09:33:59', '2022-09-03', 1, 8232, 2),
(35, '09:37:17', '2022-09-03', 1, 12624, 7);

--
-- Disparadores `comanda`
--
DELIMITER $$
CREATE TRIGGER `tr_factura` AFTER INSERT ON `comanda` FOR EACH ROW BEGIN
	insert into facturas set FechaFactura=current_date(),Comanda_idComanda=(select idComanda from comanda order by idComanda desc limit 1),Estatus="Pagada";
    
   


ENd
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comanda_has_productos`
--

CREATE TABLE `comanda_has_productos` (
  `Comanda_idComanda` int(11) NOT NULL,
  `Productos_idProductos` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `PrecioT` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comanda_has_productos`
--

INSERT INTO `comanda_has_productos` (`Comanda_idComanda`, `Productos_idProductos`, `Cantidad`, `PrecioT`) VALUES
(2, 2, 5, 700),
(3, 1, 3, 450),
(3, 2, 3, 600),
(3, 3, 2, 240),
(3, 4, 2, 600),
(3, 5, 3, 180),
(3, 6, 3, 390),
(3, 7, 2, 340),
(3, 8, 2, 220),
(3, 9, 5, 125),
(3, 10, 5, 200),
(3, 11, 3, 60),
(3, 12, 4, 120),
(4, 1, 3, 450),
(4, 2, 3, 600),
(4, 3, 2, 240),
(4, 4, 2, 600),
(4, 5, 2, 120),
(4, 7, 3, 510),
(4, 8, 5, 550),
(4, 11, 1, 20),
(4, 12, 4, 120),
(7, 1, 2, 300),
(7, 2, 2, 400),
(7, 3, 2, 240),
(7, 4, 2, 600),
(8, 1, 2, 300),
(8, 2, 2, 400),
(8, 3, 1, 120),
(8, 9, 2, 50),
(9, 1, 3, 450),
(9, 2, 2, 400),
(9, 3, 2, 240),
(9, 4, 1, 300),
(10, 1, 2, 300),
(10, 2, 2, 400),
(10, 3, 2, 240),
(10, 4, 2, 600),
(15, 1, 2, 300),
(15, 2, 2, 400),
(15, 3, 2, 240),
(15, 4, 2, 600),
(15, 5, 2, 120),
(15, 6, 1, 130),
(15, 7, 2, 340),
(15, 9, 1, 25),
(15, 10, 2, 80),
(15, 11, 3, 60),
(16, 1, 2, 300),
(16, 2, 2, 400),
(16, 3, 2, 240),
(16, 4, 2, 600),
(17, 1, 1, 150),
(18, 1, 2, 300),
(18, 2, 2, 400),
(19, 1, 2, 300),
(19, 2, 2, 400),
(19, 3, 2, 240),
(19, 4, 2, 600),
(20, 1, 2, 300),
(20, 2, 2, 400),
(20, 3, 2, 240),
(20, 4, 2, 600),
(20, 5, 2, 120),
(20, 6, 2, 260),
(20, 7, 2, 340),
(20, 8, 2, 220),
(21, 1, 2, 300),
(21, 2, 2, 400),
(21, 3, 2, 240),
(21, 4, 2, 600),
(22, 1, 2, 300),
(22, 2, 2, 400),
(22, 3, 2, 240),
(22, 4, 2, 600),
(22, 5, 2, 120),
(22, 6, 2, 260),
(22, 7, 2, 340),
(22, 8, 2, 220),
(22, 14, 3, 345),
(23, 1, 2, 300),
(23, 2, 2, 400),
(23, 3, 2, 240),
(23, 4, 2, 600),
(23, 9, 2, 50),
(23, 10, 2, 80),
(23, 11, 3, 60),
(23, 12, 2, 60),
(29, 3, 2, 240),
(29, 4, 4, 1200),
(30, 2, 2, 400),
(31, 3, 3, 360),
(31, 12, 8, 240),
(31, 13, 5, 1170),
(31, 15, 8, 3648),
(32, 12, 4, 120),
(32, 15, 5, 2280),
(32, 16, 5, 10000),
(33, 3, 3, 360),
(33, 12, 4, 120),
(34, 1, 4, 600),
(34, 4, 2, 600),
(34, 15, 2, 912),
(34, 16, 3, 6000),
(35, 4, 7, 2100),
(35, 13, 2, 468),
(35, 14, 4, 1824);

--
-- Disparadores `comanda_has_productos`
--
DELIMITER $$
CREATE TRIGGER `EliminarIngredientes` AFTER INSERT ON `comanda_has_productos` FOR EACH ROW BEGIN
UPDATE insumos INNER JOIN productos_has_insumos en set insumos.Cantidad= insumos.Cantidad-en.CantidadIns * NEW.Cantidad WHERE new.Productos_idProductos = en.Productos_idProductos;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `RecuperarIngredientes` AFTER DELETE ON `comanda_has_productos` FOR EACH ROW BEGIN
UPDATE insumos INNER JOIN productos_has_insumos en set insumos.Cantidad= insumos.Cantidad+ en.CantidadIns * old.Cantidad WHERE old.Productos_idProductos = en.Productos_idProductos;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correocli`
--

CREATE TABLE `correocli` (
  `CorreoCliente` varchar(45) DEFAULT NULL,
  `Cliente_idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccioncli`
--

CREATE TABLE `direccioncli` (
  `DireccionCliente` varchar(40) DEFAULT NULL,
  `Cliente_idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `NombreEmp` varchar(45) DEFAULT NULL,
  `CalleNumero` varchar(20) DEFAULT NULL,
  `NumeroSS` varchar(11) DEFAULT NULL,
  `Colonia` varchar(35) DEFAULT NULL,
  `FechaContrato` date DEFAULT NULL,
  `NombreUsuario` varchar(45) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL,
  `Puesto_idPuesto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `NombreEmp`, `CalleNumero`, `NumeroSS`, `Colonia`, `FechaContrato`, `NombreUsuario`, `Password`, `Puesto_idPuesto`) VALUES
(1, 'omar', '310', 'OMO4321', 'JUAREZ', '2022-08-15', 'Patron', 'patron1', 3),
(2, 'edwin', '82125', 'EDE1221', 'LOMAS DEL MAR', '2022-08-15', 'caja', 'caja1', 2),
(3, 'diego', '1015', 'DID1111', 'VILLAS DEL REY', '2022-08-15', 'almacenista', 'alma1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idFacturas` int(11) NOT NULL,
  `FechaFactura` date DEFAULT NULL,
  `Comanda_idComanda` int(11) NOT NULL,
  `Estatus` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idFacturas`, `FechaFactura`, `Comanda_idComanda`, `Estatus`) VALUES
(2, '2022-08-17', 10, ''),
(5, '2022-08-18', 15, ''),
(6, '2022-08-18', 16, ''),
(7, '2022-08-18', 17, ''),
(8, '2022-08-18', 18, ''),
(9, '2022-08-23', 19, ''),
(10, '2022-08-23', 20, ''),
(11, '2022-08-23', 21, ''),
(12, '2022-08-23', 22, 'Pagada'),
(13, '2022-08-23', 23, 'Pagada'),
(14, '2022-08-31', 28, 'Finalizada'),
(15, '2022-08-31', 29, 'Finalizada'),
(16, '2022-08-25', 30, 'Finalizada'),
(17, '2022-08-31', 4, 'Finalizada'),
(18, '2022-08-31', 31, 'Finalizada'),
(19, '2022-08-31', 32, 'Finalizada'),
(20, '2022-09-01', 33, 'Finalizada'),
(21, '2022-09-03', 34, 'Finalizada'),
(22, '2022-09-03', 35, 'Finalizada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE `insumos` (
  `idInsumos` int(11) NOT NULL,
  `NombreIns` varchar(20) NOT NULL,
  `Cantidad` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `insumos`
--

INSERT INTO `insumos` (`idInsumos`, `NombreIns`, `Cantidad`) VALUES
(3, 'Champiñones', 9916),
(4, 'Jamon', 3816),
(5, 'PiñaA', 11816),
(6, 'Salami', 15116),
(7, 'Salsa valentina', 3116),
(8, ' Chorizo', 2231),
(9, 'Jija', 18000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProductos` int(11) NOT NULL,
  `NombreProducto` varchar(45) DEFAULT NULL,
  `Ingredientes` varchar(45) DEFAULT NULL,
  `Precio` double NOT NULL,
  `TipoP` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProductos`, `NombreProducto`, `Ingredientes`, `Precio`, `TipoP`) VALUES
(1, 'Pizza SupremaX', 'Lorem ipsum dolor sit amet, consectetur adipi', 150, 'Pizzas'),
(2, '', 'Lorem ipsum dolor sit amet, consectetur adipi', 200, 'Pizzas'),
(3, 'Pizza Vegetariana', 'Lorem ipsum dolor sit amet, consectetur adipi', 120, 'Pizzas'),
(4, 'Pizza Quesozilla', 'Lorem ipsum dolor sit amet, consectetur adipi', 300, 'Pizzas'),
(5, 'Calzone', 'Delicioso calzone de pizza(champiñones, peppe', 60, 'Italiana'),
(6, 'Fetuccini Alfredo', 'Lorem ipsum dolor sit amet, consectetur adipi', 130, 'Italiana'),
(7, 'Ensalada coprese', 'Lorem ipsum dolor sit amet, consectetur adipi', 170, 'Italiana'),
(8, 'Lasaña a la boloñesa', 'Lorem ipsum dolor sit amet, consectetur adipi', 110, 'Italiana'),
(9, 'Coca-Cola', 'Lorem ipsum dolor sit amet, consectetur adipi', 25, 'Bebidas'),
(10, 'Fantaa', 'Lorem ipsum dolor sit amet, consectetur adipi', 40, 'Pizzas'),
(11, 'Sprite', 'Lorem ipsum dolor sit amet, consectetur adipi', 20, 'Bebidas'),
(12, 'Deleware Punch', 'Lorem ipsum dolor sit amet, consectetur adipi', 30, 'Pizzas'),
(13, 'Pizza con piña y pastor', 'Pizza', 234, 'Pizzas'),
(14, 'Jamon', 'Pizza', 456, 'Pizzas'),
(15, 'Pizza italiana', 'Rico', 456, 'Pizzas'),
(16, 'Pizza mexicana a la francesa', 'yoo0', 2000, 'Pizzas'),
(17, 'Chile italiana', 'jija', 23, 'Italiana'),
(18, 'PIKA', 'jija', 246, 'Pizzas'),
(19, 'Pizza cris', 'Crissssssz', 234, 'Pizzas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_has_insumos`
--

CREATE TABLE `productos_has_insumos` (
  `Productos_idProductos` int(11) NOT NULL,
  `Insumos_idInsumos` int(11) NOT NULL,
  `CantidadIns` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos_has_insumos`
--

INSERT INTO `productos_has_insumos` (`Productos_idProductos`, `Insumos_idInsumos`, `CantidadIns`) VALUES
(10, 6, 566),
(10, 7, 34),
(14, 3, 100),
(14, 4, 100),
(14, 5, 457),
(15, 4, 500),
(15, 5, 56),
(16, 3, 123),
(16, 4, 100),
(17, 4, 200),
(18, 4, 100),
(18, 6, 200),
(19, 3, 100),
(19, 5, 100),
(19, 7, 100),
(19, 8, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto`
--

CREATE TABLE `puesto` (
  `idPuesto` int(11) NOT NULL,
  `NombreP` varchar(45) DEFAULT NULL,
  `Salario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `puesto`
--

INSERT INTO `puesto` (`idPuesto`, `NombreP`, `Salario`) VALUES
(1, 'caja', 1500),
(2, 'almacenista', 2000),
(3, 'patron', 10000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonocli`
--

CREATE TABLE `telefonocli` (
  `TelefonoCliente` varchar(12) DEFAULT NULL,
  `Cliente_idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `comanda`
--
ALTER TABLE `comanda`
  ADD PRIMARY KEY (`idComanda`),
  ADD KEY `fk_Comanda_Empleado1_idx` (`Empleado_idEmpleado`);

--
-- Indices de la tabla `comanda_has_productos`
--
ALTER TABLE `comanda_has_productos`
  ADD PRIMARY KEY (`Comanda_idComanda`,`Productos_idProductos`),
  ADD KEY `fk_Comanda_has_Productos_Productos1_idx` (`Productos_idProductos`),
  ADD KEY `fk_Comanda_has_Productos_Comanda1_idx` (`Comanda_idComanda`);

--
-- Indices de la tabla `correocli`
--
ALTER TABLE `correocli`
  ADD KEY `fk_CorreoCli_Cliente1_idx` (`Cliente_idCliente`);

--
-- Indices de la tabla `direccioncli`
--
ALTER TABLE `direccioncli`
  ADD KEY `fk_DireccionCli_Cliente1_idx` (`Cliente_idCliente`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `fk_Empleado_Puesto1_idx` (`Puesto_idPuesto`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idFacturas`),
  ADD KEY `fk_Facturas_Comanda1_idx` (`Comanda_idComanda`);

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD PRIMARY KEY (`idInsumos`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProductos`);

--
-- Indices de la tabla `productos_has_insumos`
--
ALTER TABLE `productos_has_insumos`
  ADD PRIMARY KEY (`Productos_idProductos`,`Insumos_idInsumos`),
  ADD KEY `fk_Productos_has_Insumos_Insumos1_idx` (`Insumos_idInsumos`),
  ADD KEY `fk_Productos_has_Insumos_Productos1_idx` (`Productos_idProductos`);

--
-- Indices de la tabla `puesto`
--
ALTER TABLE `puesto`
  ADD PRIMARY KEY (`idPuesto`);

--
-- Indices de la tabla `telefonocli`
--
ALTER TABLE `telefonocli`
  ADD KEY `fk_TelefonoCli_Cliente_idx` (`Cliente_idCliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `comanda`
--
ALTER TABLE `comanda`
  MODIFY `idComanda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idFacturas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
  MODIFY `idInsumos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProductos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `puesto`
--
ALTER TABLE `puesto`
  MODIFY `idPuesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comanda`
--
ALTER TABLE `comanda`
  ADD CONSTRAINT `fk_Comanda_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comanda_has_productos`
--
ALTER TABLE `comanda_has_productos`
  ADD CONSTRAINT `fk_Comanda_has_Productos_Comanda1` FOREIGN KEY (`Comanda_idComanda`) REFERENCES `comanda` (`idComanda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Comanda_has_Productos_Productos1` FOREIGN KEY (`Productos_idProductos`) REFERENCES `productos` (`idProductos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `correocli`
--
ALTER TABLE `correocli`
  ADD CONSTRAINT `fk_CorreoCli_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `direccioncli`
--
ALTER TABLE `direccioncli`
  ADD CONSTRAINT `fk_DireccionCli_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_Empleado_Puesto1` FOREIGN KEY (`Puesto_idPuesto`) REFERENCES `puesto` (`idPuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `fk_Facturas_Comanda1` FOREIGN KEY (`Comanda_idComanda`) REFERENCES `comanda` (`idComanda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos_has_insumos`
--
ALTER TABLE `productos_has_insumos`
  ADD CONSTRAINT `fk_Productos_has_Insumos_Insumos1` FOREIGN KEY (`Insumos_idInsumos`) REFERENCES `insumos` (`idInsumos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Productos_has_Insumos_Productos1` FOREIGN KEY (`Productos_idProductos`) REFERENCES `productos` (`idProductos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `telefonocli`
--
ALTER TABLE `telefonocli`
  ADD CONSTRAINT `fk_TelefonoCli_Cliente` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
