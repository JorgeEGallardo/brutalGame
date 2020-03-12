-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-03-2020 a las 17:19:22
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
-- Base de datos: `vic`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_12_20_161445_worker', 1),
(4, '2019_12_20_161542_types', 1),
(5, '2019_12_20_162949_sales', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `worker_id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`id`, `worker_id`, `type_id`, `created_at`, `updated_at`) VALUES
(1, 9, 4, '2020-01-03 17:24:47', '2020-01-03 17:24:47'),
(3, 9, 4, '2020-01-01 17:24:53', '2020-01-03 17:24:53'),
(5, 10, 4, '2020-01-02 17:24:59', '2020-01-03 17:24:59'),
(6, 9, 5, '2020-01-03 19:27:47', '2020-01-03 19:27:47'),
(7, 10, 5, '2020-01-03 19:30:23', '2020-01-03 19:30:23'),
(8, 9, 4, '2020-01-03 19:30:29', '2020-01-03 19:30:29'),
(9, 9, 4, '2020-01-03 19:34:14', '2020-01-03 19:34:14'),
(10, 9, 5, '2020-01-03 19:34:19', '2020-01-03 19:34:19'),
(11, 9, 4, '2020-01-06 15:21:18', '2020-01-06 15:21:18'),
(12, 9, 5, '2020-01-06 15:21:27', '2020-01-06 15:21:27'),
(13, 10, 4, '2020-01-06 15:24:35', '2020-01-06 15:24:35'),
(14, 10, 5, '2020-01-06 15:24:39', '2020-01-06 15:24:39'),
(15, 9, 5, '2020-01-06 15:25:45', '2020-01-06 15:25:45'),
(20, 10, 5, '2020-01-02 06:00:00', '2020-01-02 06:00:00'),
(21, 10, 5, '2020-01-02 06:00:00', '2020-01-02 06:00:00'),
(22, 10, 5, '2020-01-04 06:00:00', '2020-01-11 06:00:00'),
(23, 9, 4, NULL, NULL),
(24, 9, 5, '2020-03-06 16:18:56', '2020-03-06 16:18:56'),
(25, 10, 5, '2020-03-06 16:22:54', '2020-03-06 16:22:54'),
(26, 9, 5, '2020-03-06 16:31:56', '2020-03-06 16:31:56'),
(27, 9, 4, '2020-03-06 16:32:32', '2020-03-06 16:32:32'),
(28, 9, 5, '2020-03-06 16:34:05', '2020-03-06 16:34:05');

--
-- Disparadores `sales`
--
DELIMITER $$
CREATE TRIGGER `AVERAGE` AFTER INSERT ON `sales` FOR EACH ROW UPDATE workers SET PRICEA = (SELECT AVG(A.PRICE) FROM types A JOIN workers B JOIN sales C WHERE C.type_id = A.id AND C.worker_id =B.id AND C.worker_id = 9) WHERE workers.id = NEW.worker_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `types`
--

INSERT INTO `types` (`id`, `name`, `price`, `photo`, `created_at`, `updated_at`) VALUES
(4, 'Corte dama', 100, '1578071203.jpg', '2020-01-03 17:06:43', '2020-01-03 17:06:43'),
(5, 'Corte caballero', 80, '1578079649.jpg', '2020-01-03 19:27:29', '2020-01-03 19:27:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '123', '123@gmail.com', NULL, '$2y$10$dxwI8IR/qWHlFdBV1TppEu25lFa4wOQzEOh73QBTjU1cSVC4iKAoW', NULL, '2019-12-25 00:49:08', '2019-12-25 00:49:08'),
(2, '123', '123@123.com', NULL, '$2y$10$tUrtD1bJOcHpEHSsZjc0e.0YZAop.2bz2T8UkALFmZsPvVi/G.3z6', NULL, '2019-12-25 01:43:33', '2019-12-25 01:43:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `workers`
--

CREATE TABLE `workers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `PRICEA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `workers`
--

INSERT INTO `workers` (`id`, `name`, `username`, `photo`, `created_at`, `updated_at`, `PRICEA`) VALUES
(9, 'Juan Francisco Galvan de Santiago', 'Paco', '1578071025.jpg', '2020-01-03 17:03:45', '2020-01-03 17:03:45', 90),
(10, 'Ana Karen Silva Montiel', 'Karen', '1578071054.jpg', '2020-01-03 17:04:14', '2020-01-03 17:04:14', 91);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_worker_id_foreign` (`worker_id`),
  ADD KEY `sales_type_id_foreign` (`type_id`);

--
-- Indices de la tabla `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `workers`
--
ALTER TABLE `workers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_worker_id_foreign` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
