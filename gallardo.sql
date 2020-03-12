-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-03-2020 a las 17:19:07
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gallardo`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `articles_get` ()  NO SQL
BEGIN
SELECT name, quantity, sell, cost, minimum,
(sell-cost) as utility,
(quantity * sell) as exival
FROM articles; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `articles_get_simple` ()  NO SQL
BEGIN
SELECT *
FROM articles; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `article_add` (IN `v_id` INT(11), IN `v_quantity` INT(11))  NO SQL
UPDATE articles 
SET quantity = v_quantity
WHERE id_articles = v_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `article_delete` (IN `v_id` INT(11))  NO SQL
delete from articles where id_articles = v_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `article_edit` (IN `v_id` INT(11), IN `v_name` VARCHAR(200), IN `v_quantity` INT(11), IN `v_cost` INT(11), IN `v_sell` INT(11), IN `v_min` INT(11))  NO SQL
UPDATE articles SET 
name = v_name, quantity = v_quantity, cost=v_cost, sell=v_sell, minimum=v_min
WHERE id_articles= v_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `article_get_store` ()  NO SQL
SELECT name, quantity, sell, cost, minimum,
(minimum-quantity) as need,
((minimum - quantity)*cost) as invert
FROM articles 
where quantity <= minimum$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `article_insert` (IN `v_name` VARCHAR(200), IN `v_quantity` INT(11), IN `v_cost` INT(11), IN `v_sell` INT(11), IN `v_min` INT(11))  NO SQL
INSERT INTO articles (
	name,
  	quantity,
    cost,
    sell,
    minimum
) VALUES (
	v_name,
    v_quantity,
    v_cost,
    v_sell,
    v_min
)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `username_create` (IN `name` VARCHAR(200))  NO SQL
INSERT INTO USERS(username) VALUES (name)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `username_delete` (IN `var_username` VARCHAR(200))  BEGIN
DELETE from users where username = var_username;
SELECT IF(EXISTS(SELECT * FROM users WHERE username = var_username),1,0) AS result;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `username_exists` (IN `var_username` VARCHAR(500))  NO SQL
    COMMENT 'Función para verificar la existencia de un usuario.'
SELECT IF(EXISTS(SELECT * FROM users WHERE username = var_username),1,0) AS result$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles`
--

CREATE TABLE `articles` (
  `id_articles` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `cost` int(11) NOT NULL DEFAULT 0,
  `sell` int(11) NOT NULL DEFAULT 0,
  `minimum` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articles`
--

INSERT INTO `articles` (`id_articles`, `name`, `quantity`, `cost`, `sell`, `minimum`) VALUES
(7, '0', 8, 11, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `username`) VALUES
(5, 'awa');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id_articles`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articles`
--
ALTER TABLE `articles`
  MODIFY `id_articles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
