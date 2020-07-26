-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-07-2020 a las 15:49:03
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `web_pedidos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `idBitacora` int(11) NOT NULL,
  `usuario` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `detalle` varchar(2000) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `idEmpresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `idCarrito` bigint(20) NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `idItem` bigint(20) NOT NULL,
  `idMoneda` int(11) NOT NULL,
  `cantidad` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2020-07-21 19:11:27', '2020-07-21 19:11:27'),
(2, NULL, 1, 'Category 2', 'category-2', '2020-07-21 19:11:27', '2020-07-21 19:11:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `idCompra` bigint(20) NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `idMoneda` int(11) NOT NULL,
  `idUbicacion` bigint(20) NOT NULL,
  `idTipoTransaccion` int(11) NOT NULL,
  `idPersonaProveedor` bigint(20) NOT NULL,
  `documento` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `montoItem` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoImpuesto` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `gravable` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `exento` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `descuento` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoRetencion` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoTotal` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `observacion` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechaCompra` datetime NOT NULL,
  `fechaOperacion` datetime NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_impuesto`
--

CREATE TABLE `compra_impuesto` (
  `idCompraImpuesto` bigint(20) NOT NULL,
  `idCompra` bigint(20) NOT NULL,
  `idImpuesto` int(11) NOT NULL,
  `monto` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoTasa` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoTotal` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_impuesto_item`
--

CREATE TABLE `compra_impuesto_item` (
  `idCompraImpuesto` bigint(20) NOT NULL,
  `idCompraItem` bigint(20) NOT NULL,
  `idImpuesto` int(11) NOT NULL,
  `numeroLinea` int(11) NOT NULL,
  `monto` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoTasa` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoTotal` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_item`
--

CREATE TABLE `compra_item` (
  `idCompraItem` bigint(20) NOT NULL,
  `idCompra` bigint(20) NOT NULL,
  `idItem` bigint(20) NOT NULL,
  `numeroLinea` int(11) NOT NULL,
  `descripcionItem` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `cantidad` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `costo` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `precio` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `impuesto` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `descuento` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoTotal` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `esExento` bit(1) NOT NULL DEFAULT b'0',
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_por_cobrar`
--

CREATE TABLE `cuentas_por_cobrar` (
  `idCxc` bigint(20) NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `idMoneda` int(11) NOT NULL,
  `idTipoTransaccion` int(11) NOT NULL,
  `idUbicacion` bigint(20) NOT NULL,
  `idEstatusTransaccion` int(11) NOT NULL,
  `idPersonaCliente` bigint(20) NOT NULL,
  `descripcionCliente` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `documentoRelacionado` decimal(18,0) NOT NULL,
  `montoItem` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoImpuesto` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `gravable` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `exento` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `descuento` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoRetencion` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoTotal` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `observacion` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechaOperacion` datetime NOT NULL,
  `ruta` varchar(500) COLLATE latin1_spanish_ci NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_por_pagar`
--

CREATE TABLE `cuentas_por_pagar` (
  `idCxc` bigint(20) NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `idMoneda` int(11) NOT NULL,
  `idTipoTransaccion` int(11) NOT NULL,
  `idUbicacion` bigint(20) NOT NULL,
  `idEstatusTransaccion` int(11) NOT NULL,
  `idPersonaProveedor` bigint(20) NOT NULL,
  `descripcionProveedor` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `documentoRelacionado` decimal(18,0) NOT NULL,
  `montoItem` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoImpuesto` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `gravable` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `exento` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `descuento` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoRetencion` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoTotal` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `observacion` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechaOperacion` datetime NOT NULL,
  `ruta` varchar(500) COLLATE latin1_spanish_ci NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(114, 16, 'idMarca', 'hidden', 'IdMarca', 1, 0, 0, 0, 0, 0, '{}', 1),
(115, 16, 'descripcion', 'text', 'Descripcion', 1, 1, 1, 1, 1, 1, '{}', 2),
(116, 16, 'fechaCreacion', 'hidden', 'FechaCreacion', 1, 1, 1, 1, 1, 1, '{}', 3),
(117, 16, 'idEmpresa', 'hidden', 'IdEmpresa', 1, 1, 1, 1, 1, 1, '{}', 4),
(118, 16, 'estado', 'hidden', 'Estado', 1, 1, 1, 1, 1, 1, '{}', 5),
(119, 16, 'activo', 'checkbox', 'Activo', 1, 1, 1, 1, 1, 1, '{}', 6),
(120, 1, 'user_hasone_empresa_relationship', 'relationship', 'empresa', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Empresa\",\"table\":\"empresa\",\"type\":\"hasOne\",\"column\":\"idempresa\",\"key\":\"idempresa\",\"label\":\"idempresa\",\"pivot_table\":\"bitacora\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(121, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
(122, 1, 'idEmpresa', 'select_dropdown', 'IdEmpresa', 0, 1, 1, 1, 1, 1, '{}', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-07-21 19:10:59', '2020-07-23 02:09:30'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-07-21 19:10:59', '2020-07-21 19:10:59'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-07-21 19:10:59', '2020-07-21 19:10:59'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2020-07-21 19:11:25', '2020-07-21 19:11:25'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2020-07-21 19:11:28', '2020-07-21 19:11:28'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2020-07-21 19:11:32', '2020-07-21 19:11:32'),
(16, 'marca', 'marca', 'Marca', 'Marcas', 'voyager-check', 'App\\Models\\Marca', NULL, '\\App\\Http\\Controllers\\MarcaController', NULL, 1, 0, '{\"order_column\":\"idMarca\",\"order_display_column\":\"descripcion\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-22 07:50:17', '2020-07-22 08:19:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `idEmpresa` int(11) NOT NULL,
  `rif` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `razonSocial` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `representante` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `direccion` varchar(400) COLLATE latin1_spanish_ci NOT NULL,
  `correo` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `fechaLicencia` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `concatenado` varchar(500) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`idEmpresa`, `rif`, `razonSocial`, `representante`, `direccion`, `correo`, `fechaLicencia`, `fechaCreacion`, `activo`, `concatenado`) VALUES
(0, 'V165091422', 'Hilger Leon', 'Hilger Leon', 'Cabudare', 'sirit20@gmail.com', '2025-10-19 00:00:00', '2020-07-19 00:57:58', b'1', '436b92bed2a073881dbe9bd5901ba628');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `idEstado` int(11) NOT NULL,
  `descripcion` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `idPais` int(11) NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus_transaccion`
--

CREATE TABLE `estatus_transaccion` (
  `idEstatusTransaccion` int(11) NOT NULL,
  `descripcion` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `color` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `nivel` int(11) DEFAULT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuesto`
--

CREATE TABLE `impuesto` (
  `idImpuesto` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `monto` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `esRetencion` bit(1) NOT NULL,
  `esCompra` bit(1) NOT NULL,
  `esVenta` bit(1) NOT NULL,
  `esPorcentaje` bit(1) NOT NULL,
  `esLibroImpuesto` bit(1) NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instancia`
--

CREATE TABLE `instancia` (
  `idInstancia` int(11) NOT NULL,
  `idPadre` int(11) NOT NULL,
  `descripcion` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `esServicio` bit(1) DEFAULT NULL,
  `esCompuesto` bit(1) DEFAULT NULL,
  `orden` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idInventario` bigint(20) NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `idMoneda` int(11) NOT NULL,
  `idTipoTransaccion` int(11) NOT NULL,
  `idUbicacion` bigint(20) NOT NULL,
  `idUbicacion2` int(11) NOT NULL,
  `documentoRelacionado` decimal(18,0) NOT NULL,
  `autorizadoPersona` int(11) DEFAULT NULL,
  `observacion` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechaInventario` datetime NOT NULL,
  `fechaOperacion` datetime NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `numero` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `cerrado` bit(1) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_item`
--

CREATE TABLE `inventario_item` (
  `idInventario` bigint(20) NOT NULL,
  `idItem` bigint(20) NOT NULL,
  `numeroLinea` int(11) NOT NULL,
  `descripcionItem` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `cantidad` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `costo` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `precio` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `impuesto` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `descuento` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoTotal` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `esExento` bit(1) NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item`
--

CREATE TABLE `item` (
  `idItem` bigint(20) NOT NULL,
  `codigo` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `idInstancia` int(11) NOT NULL,
  `idMarca` int(11) NOT NULL,
  `idUnidadMedida` int(11) NOT NULL,
  `costo` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `existencia` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `minimo` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `maximo` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `esExento` bit(1) NOT NULL,
  `esServicio` bit(1) DEFAULT NULL,
  `ruta` varchar(500) COLLATE latin1_spanish_ci NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_existencia`
--

CREATE TABLE `item_existencia` (
  `idItemExistencia` bigint(20) NOT NULL,
  `idUbicacion` bigint(20) NOT NULL,
  `idItem` bigint(20) NOT NULL,
  `existencia` decimal(20,4) DEFAULT NULL,
  `cantidadPendiente` decimal(20,4) DEFAULT NULL,
  `cantidadComprometida` decimal(20,4) DEFAULT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_impuesto`
--

CREATE TABLE `item_impuesto` (
  `idItem` bigint(20) NOT NULL,
  `idImpuesto` int(11) NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_precio`
--

CREATE TABLE `item_precio` (
  `idPrecio` bigint(20) NOT NULL,
  `idItem` bigint(20) NOT NULL,
  `precio` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `idMoneda` int(11) DEFAULT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_tipo_caracteristica`
--

CREATE TABLE `item_tipo_caracteristica` (
  `idItem` bigint(20) NOT NULL,
  `idTipoCaracteristica` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `longitud` varchar(100) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL,
  `descripcion` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`idMarca`, `descripcion`, `fechaCreacion`, `idEmpresa`, `estado`, `activo`) VALUES
(2, 'Samsung', '2020-07-21 23:35:57', 1, b'1', b'1'),
(3, 'HP', '2020-07-21 23:35:57', 2, b'1', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-07-21 19:11:03', '2020-07-21 19:11:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-07-21 19:11:03', '2020-07-21 19:11:03', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, 19, 4, '2020-07-21 19:11:04', '2020-07-22 06:54:51', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, 19, 7, '2020-07-21 19:11:04', '2020-07-22 06:54:52', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 19, 5, '2020-07-21 19:11:04', '2020-07-22 06:54:51', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 3, '2020-07-21 19:11:05', '2020-07-22 07:24:41', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2020-07-21 19:11:05', '2020-07-22 06:52:58', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2020-07-21 19:11:05', '2020-07-22 06:52:58', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-07-21 19:11:05', '2020-07-22 06:52:58', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-07-21 19:11:05', '2020-07-22 06:52:58', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, 19, 6, '2020-07-21 19:11:05', '2020-07-22 06:54:52', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, 19, 3, '2020-07-21 19:11:26', '2020-07-22 06:54:51', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, 19, 1, '2020-07-21 19:11:30', '2020-07-22 06:54:51', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, 19, 2, '2020-07-21 19:11:33', '2020-07-22 06:54:51', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2020-07-21 19:11:41', '2020-07-22 06:52:58', 'voyager.hooks', NULL),
(19, 1, 'Configuración', '', '_self', 'voyager-params', '#000000', NULL, 2, '2020-07-22 06:53:35', '2020-07-22 07:24:34', NULL, ''),
(20, 1, 'Maestras', '', '_self', 'voyager-file-text', '#000000', NULL, 4, '2020-07-22 06:57:16', '2020-07-22 07:24:41', NULL, ''),
(25, 1, 'Marcas', '', '_self', 'voyager-check', NULL, NULL, 5, '2020-07-22 07:50:17', '2020-07-22 07:50:17', 'voyager.marca.index', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2016_01_01_000000_add_voyager_user_fields', 1),
(3, '2016_01_01_000000_create_data_types_table', 1),
(4, '2016_05_19_173453_create_menu_table', 1),
(5, '2016_10_21_190000_create_roles_table', 1),
(6, '2016_10_21_190000_create_settings_table', 1),
(7, '2016_11_30_135954_create_permission_table', 1),
(8, '2016_11_30_141208_create_permission_role_table', 1),
(9, '2016_12_26_201236_data_types__add__server_side', 1),
(10, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(11, '2017_01_14_005015_create_translations_table', 1),
(12, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(13, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(14, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(15, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(16, '2017_08_05_000000_add_group_to_settings_table', 1),
(17, '2017_11_26_013050_add_user_role_relationship', 1),
(18, '2017_11_26_015000_create_user_roles_table', 1),
(19, '2018_03_11_000000_add_user_settings', 1),
(20, '2018_03_14_000000_add_details_to_data_types_table', 1),
(21, '2018_03_16_000000_make_settings_value_nullable', 1),
(22, '2019_08_19_000000_create_failed_jobs_table', 1),
(23, '2016_01_01_000000_create_pages_table', 2),
(24, '2016_01_01_000000_create_posts_table', 2),
(25, '2016_02_15_204651_create_categories_table', 2),
(26, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda`
--

CREATE TABLE `moneda` (
  `idMoneda` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `simbolo` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `principal` bit(1) NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `idMunicipio` int(11) NOT NULL,
  `descripcion` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `idEstado` int(11) NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2020-07-21 19:11:34', '2020-07-21 19:11:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `idPais` int(11) NOT NULL,
  `descripcion` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`idPais`, `descripcion`, `fechaCreacion`, `estado`, `activo`) VALUES
(1, 'Venezuela', '0000-00-00 00:00:00', b'1', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-07-21 19:11:06', '2020-07-21 19:11:06'),
(2, 'browse_bread', NULL, '2020-07-21 19:11:06', '2020-07-21 19:11:06'),
(3, 'browse_database', NULL, '2020-07-21 19:11:07', '2020-07-21 19:11:07'),
(4, 'browse_media', NULL, '2020-07-21 19:11:07', '2020-07-21 19:11:07'),
(5, 'browse_compass', NULL, '2020-07-21 19:11:08', '2020-07-21 19:11:08'),
(6, 'browse_menus', 'menus', '2020-07-21 19:11:08', '2020-07-21 19:11:08'),
(7, 'read_menus', 'menus', '2020-07-21 19:11:08', '2020-07-21 19:11:08'),
(8, 'edit_menus', 'menus', '2020-07-21 19:11:09', '2020-07-21 19:11:09'),
(9, 'add_menus', 'menus', '2020-07-21 19:11:09', '2020-07-21 19:11:09'),
(10, 'delete_menus', 'menus', '2020-07-21 19:11:09', '2020-07-21 19:11:09'),
(11, 'browse_roles', 'roles', '2020-07-21 19:11:09', '2020-07-21 19:11:09'),
(12, 'read_roles', 'roles', '2020-07-21 19:11:09', '2020-07-21 19:11:09'),
(13, 'edit_roles', 'roles', '2020-07-21 19:11:09', '2020-07-21 19:11:09'),
(14, 'add_roles', 'roles', '2020-07-21 19:11:09', '2020-07-21 19:11:09'),
(15, 'delete_roles', 'roles', '2020-07-21 19:11:09', '2020-07-21 19:11:09'),
(16, 'browse_users', 'users', '2020-07-21 19:11:10', '2020-07-21 19:11:10'),
(17, 'read_users', 'users', '2020-07-21 19:11:10', '2020-07-21 19:11:10'),
(18, 'edit_users', 'users', '2020-07-21 19:11:10', '2020-07-21 19:11:10'),
(19, 'add_users', 'users', '2020-07-21 19:11:10', '2020-07-21 19:11:10'),
(20, 'delete_users', 'users', '2020-07-21 19:11:10', '2020-07-21 19:11:10'),
(21, 'browse_settings', 'settings', '2020-07-21 19:11:10', '2020-07-21 19:11:10'),
(22, 'read_settings', 'settings', '2020-07-21 19:11:10', '2020-07-21 19:11:10'),
(23, 'edit_settings', 'settings', '2020-07-21 19:11:10', '2020-07-21 19:11:10'),
(24, 'add_settings', 'settings', '2020-07-21 19:11:11', '2020-07-21 19:11:11'),
(25, 'delete_settings', 'settings', '2020-07-21 19:11:11', '2020-07-21 19:11:11'),
(26, 'browse_categories', 'categories', '2020-07-21 19:11:26', '2020-07-21 19:11:26'),
(27, 'read_categories', 'categories', '2020-07-21 19:11:26', '2020-07-21 19:11:26'),
(28, 'edit_categories', 'categories', '2020-07-21 19:11:26', '2020-07-21 19:11:26'),
(29, 'add_categories', 'categories', '2020-07-21 19:11:26', '2020-07-21 19:11:26'),
(30, 'delete_categories', 'categories', '2020-07-21 19:11:27', '2020-07-21 19:11:27'),
(31, 'browse_posts', 'posts', '2020-07-21 19:11:30', '2020-07-21 19:11:30'),
(32, 'read_posts', 'posts', '2020-07-21 19:11:30', '2020-07-21 19:11:30'),
(33, 'edit_posts', 'posts', '2020-07-21 19:11:30', '2020-07-21 19:11:30'),
(34, 'add_posts', 'posts', '2020-07-21 19:11:31', '2020-07-21 19:11:31'),
(35, 'delete_posts', 'posts', '2020-07-21 19:11:31', '2020-07-21 19:11:31'),
(36, 'browse_pages', 'pages', '2020-07-21 19:11:33', '2020-07-21 19:11:33'),
(37, 'read_pages', 'pages', '2020-07-21 19:11:34', '2020-07-21 19:11:34'),
(38, 'edit_pages', 'pages', '2020-07-21 19:11:34', '2020-07-21 19:11:34'),
(39, 'add_pages', 'pages', '2020-07-21 19:11:34', '2020-07-21 19:11:34'),
(40, 'delete_pages', 'pages', '2020-07-21 19:11:34', '2020-07-21 19:11:34'),
(41, 'browse_hooks', NULL, '2020-07-21 19:11:41', '2020-07-21 19:11:41'),
(82, 'browse_marca', 'marca', '2020-07-22 07:50:17', '2020-07-22 07:50:17'),
(83, 'read_marca', 'marca', '2020-07-22 07:50:17', '2020-07-22 07:50:17'),
(84, 'edit_marca', 'marca', '2020-07-22 07:50:17', '2020-07-22 07:50:17'),
(85, 'add_marca', 'marca', '2020-07-22 07:50:17', '2020-07-22 07:50:17'),
(86, 'delete_marca', 'marca', '2020-07-22 07:50:17', '2020-07-22 07:50:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idPersona` bigint(20) NOT NULL,
  `descripcion` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `telefonoLocal` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `telefonoCelular` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `observacion` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idTipoPersona` int(11) NOT NULL,
  `documento` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `correo` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `sexo` smallint(6) NOT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `direccion` varchar(500) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idMunicipio` int(11) DEFAULT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_cliente`
--

CREATE TABLE `persona_cliente` (
  `idPersonaCliente` bigint(20) NOT NULL,
  `idPersona` bigint(20) NOT NULL,
  `representante` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idAlterno` int(11) DEFAULT NULL,
  `codiZip` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idTipoSeniat` int(11) NOT NULL,
  `esCredito` bit(1) NOT NULL,
  `limiteCredito` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `esTolerancia` bit(1) NOT NULL,
  `diasTolerancia` int(11) NOT NULL,
  `esDescuento` bit(1) NOT NULL,
  `esPorcentaje` bit(1) NOT NULL,
  `descuento` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `esAgenteRetencion` bit(1) NOT NULL,
  `idTipoRetencion` int(11) DEFAULT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_proveedor`
--

CREATE TABLE `persona_proveedor` (
  `idPersonaProveedor` bigint(20) NOT NULL,
  `idPersona` bigint(20) NOT NULL,
  `representante` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idAlterno` int(11) DEFAULT NULL,
  `codiZip` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idTipoSeniat` int(11) NOT NULL,
  `idTipoRetencion` int(11) NOT NULL,
  `porcentajeRetencionIVA` decimal(5,2) DEFAULT NULL,
  `esRetencionIVA` bit(1) DEFAULT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_vendedor`
--

CREATE TABLE `persona_vendedor` (
  `idPersonaVendedor` bigint(20) NOT NULL,
  `idPersona` bigint(20) NOT NULL,
  `descripcion` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `esComisionVenta` bit(1) NOT NULL,
  `esComisionCobro` bit(1) NOT NULL,
  `esComisionTabuladorVenta` bit(1) NOT NULL,
  `esComisionTabuladorCobro` bit(1) NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-07-21 19:11:31', '2020-07-21 19:11:31'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-07-21 19:11:31', '2020-07-21 19:11:31'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-07-21 19:11:31', '2020-07-21 19:11:31'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-07-21 19:11:31', '2020-07-21 19:11:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'sa', 'Super Admin', '2020-07-21 19:11:06', '2020-07-23 02:19:35'),
(2, 'administrador', 'Administrador', '2020-07-21 19:11:06', '2020-07-23 02:19:53'),
(3, 'cliente', 'Cliente', '2020-07-23 02:20:03', '2020-07-23 02:20:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Pedidos Web', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Admin Pedidos', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Administración de pedidos', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings\\July2020\\T0qcqaJiokbQfl99Cots.gif', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_caracteristica`
--

CREATE TABLE `tipo_caracteristica` (
  `idTipoCaracteristica` bigint(20) NOT NULL,
  `descripcion` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `esBit` bit(1) DEFAULT NULL,
  `esNumber` bit(1) DEFAULT NULL,
  `esString` bit(1) DEFAULT NULL,
  `esFecha` bit(1) DEFAULT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento_persona`
--

CREATE TABLE `tipo_documento_persona` (
  `idTipoDocumentoPersona` int(11) NOT NULL,
  `descripcion` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `abreviado` char(2) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_persona`
--

CREATE TABLE `tipo_persona` (
  `idTipoPersona` int(11) NOT NULL,
  `descripcion` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nombreTabla` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_retencion`
--

CREATE TABLE `tipo_retencion` (
  `idTipoRetencion` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `aProveedor` bit(1) DEFAULT NULL,
  `aCliente` bit(1) DEFAULT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_seniat`
--

CREATE TABLE `tipo_seniat` (
  `idTipoSeniat` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_transaccion`
--

CREATE TABLE `tipo_transaccion` (
  `idTipoTransaccion` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `nivel` int(11) NOT NULL,
  `esCompra` bit(1) DEFAULT NULL,
  `esVenta` bit(1) DEFAULT NULL,
  `esInventario` bit(1) DEFAULT NULL,
  `correlativo` int(11) DEFAULT NULL,
  `signo` bit(1) DEFAULT NULL,
  `prefijo` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2020-07-21 19:11:34', '2020-07-21 19:11:34'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2020-07-21 19:11:34', '2020-07-21 19:11:34'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2020-07-21 19:11:35', '2020-07-21 19:11:35'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2020-07-21 19:11:35', '2020-07-21 19:11:35'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2020-07-21 19:11:35', '2020-07-21 19:11:35'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2020-07-21 19:11:35', '2020-07-21 19:11:35'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2020-07-21 19:11:35', '2020-07-21 19:11:35'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2020-07-21 19:11:35', '2020-07-21 19:11:35'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2020-07-21 19:11:35', '2020-07-21 19:11:35'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2020-07-21 19:11:35', '2020-07-21 19:11:35'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2020-07-21 19:11:36', '2020-07-21 19:11:36'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2020-07-21 19:11:36', '2020-07-21 19:11:36'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2020-07-21 19:11:36', '2020-07-21 19:11:36'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2020-07-21 19:11:36', '2020-07-21 19:11:36'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2020-07-21 19:11:36', '2020-07-21 19:11:36'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2020-07-21 19:11:36', '2020-07-21 19:11:36'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2020-07-21 19:11:36', '2020-07-21 19:11:36'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2020-07-21 19:11:37', '2020-07-21 19:11:37'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-07-21 19:11:37', '2020-07-21 19:11:37'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2020-07-21 19:11:37', '2020-07-21 19:11:37'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2020-07-21 19:11:37', '2020-07-21 19:11:37'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2020-07-21 19:11:37', '2020-07-21 19:11:37'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2020-07-21 19:11:37', '2020-07-21 19:11:37'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2020-07-21 19:11:38', '2020-07-21 19:11:38'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2020-07-21 19:11:38', '2020-07-21 19:11:38'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2020-07-21 19:11:38', '2020-07-21 19:11:38'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2020-07-21 19:11:38', '2020-07-21 19:11:38'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2020-07-21 19:11:38', '2020-07-21 19:11:38'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2020-07-21 19:11:38', '2020-07-21 19:11:38'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2020-07-21 19:11:38', '2020-07-21 19:11:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `idUbicacion` bigint(20) NOT NULL,
  `idMunicipio` int(11) DEFAULT NULL,
  `descripcion` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `direccion` varchar(500) COLLATE latin1_spanish_ci NOT NULL,
  `telefono` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

CREATE TABLE `unidad_medida` (
  `idUnidadMedida` int(11) NOT NULL,
  `descripcion` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `abreviatura` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `idEmpresa` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `idEmpresa`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$LME5Mv2v5McPHHlMTCamFO52Nha1oLPkBlEu1QqmugTEILds6Vu.2', 'y2wvY71zUNHu6Lk3jjna3ucrVCYGgkt4VSbHksNokiqzGQVCPIN8yuaPQKiT', '{\"locale\":\"es\"}', '2020-07-21 19:11:27', '2020-07-22 06:18:05', 0),
(2, 2, 'usuario', 'sirit20@gmail.com', 'users/default.png', NULL, '$2y$10$rt08JLQGSh8xa.MjJfVfm.lOqCTlrn5nEMN9GWYXHoxH7XmecKgb6', NULL, '{\"locale\":\"es\"}', '2020-07-22 06:04:50', '2020-07-22 06:04:50', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idVenta` bigint(20) NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `idMoneda` int(11) NOT NULL,
  `idTipoTransaccion` int(11) NOT NULL,
  `idUbicacion` bigint(20) NOT NULL,
  `idPersonaCliente` bigint(20) NOT NULL,
  `idTipoDocumento` int(11) NOT NULL,
  `documento` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionCliente` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `direccionCliente` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `idPersonaVendedor` bigint(20) NOT NULL,
  `documentoRelacionado` decimal(18,0) NOT NULL,
  `numeroControl` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `montoItem` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoImpuesto` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `gravable` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `exento` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `descuento` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoTotal` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `observacion` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechaVenta` datetime NOT NULL,
  `fechaOperacion` datetime NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_impuesto`
--

CREATE TABLE `venta_impuesto` (
  `idVentaImpuesto` bigint(20) NOT NULL,
  `idVenta` bigint(20) NOT NULL,
  `idImpuesto` int(11) NOT NULL,
  `monto` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoTasa` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoTotal` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_impuesto_item`
--

CREATE TABLE `venta_impuesto_item` (
  `idVentaImpuesto` bigint(20) NOT NULL,
  `idVentaItem` bigint(20) NOT NULL,
  `idImpuesto` int(11) NOT NULL,
  `numeroLinea` int(11) NOT NULL,
  `monto` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoTasa` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoTotal` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_item`
--

CREATE TABLE `venta_item` (
  `idVentaItem` bigint(20) NOT NULL,
  `idVenta` bigint(20) NOT NULL,
  `idItem` bigint(20) NOT NULL,
  `numeroLinea` int(11) NOT NULL,
  `descripcionItem` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `cantidad` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `costo` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `precio` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `impuesto` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `descuento` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `montoTotal` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `esExento` bit(1) NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`idBitacora`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`idCarrito`),
  ADD KEY `fk_carrito_Moneda` (`idMoneda`),
  ADD KEY `fk_carrito_Item` (`idItem`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`idCompra`),
  ADD KEY `fk_Compra_Moneda` (`idMoneda`),
  ADD KEY `fk_Compra_persona_proveedor` (`idPersonaProveedor`),
  ADD KEY `fk_Compra_tipo_transaccion` (`idTipoTransaccion`),
  ADD KEY `fk_Compra_Ubicacion` (`idUbicacion`);

--
-- Indices de la tabla `compra_impuesto`
--
ALTER TABLE `compra_impuesto`
  ADD PRIMARY KEY (`idCompraImpuesto`),
  ADD KEY `fk_compra_impuesto_Compra` (`idCompra`),
  ADD KEY `fk_compra_impuesto_Impuesto` (`idImpuesto`);

--
-- Indices de la tabla `compra_impuesto_item`
--
ALTER TABLE `compra_impuesto_item`
  ADD PRIMARY KEY (`idCompraImpuesto`),
  ADD KEY `fk_compra_impuestoItem_compra_item` (`idCompraItem`),
  ADD KEY `fk_compra_impuestoItem_Impuesto` (`idImpuesto`);

--
-- Indices de la tabla `compra_item`
--
ALTER TABLE `compra_item`
  ADD PRIMARY KEY (`idCompraItem`),
  ADD KEY `fk_compra_item_Compra` (`idCompra`),
  ADD KEY `fk_compra_item_Item` (`idItem`);

--
-- Indices de la tabla `cuentas_por_cobrar`
--
ALTER TABLE `cuentas_por_cobrar`
  ADD PRIMARY KEY (`idCxc`),
  ADD KEY `fk_cuentas_por_cobrar_estatus_transaccion` (`idEstatusTransaccion`),
  ADD KEY `fk_cuentas_por_cobrar_Moneda` (`idMoneda`),
  ADD KEY `fk_cuentas_por_cobrar_persona_cliente` (`idPersonaCliente`),
  ADD KEY `fk_cuentas_por_cobrar_tipo_transaccion` (`idTipoTransaccion`),
  ADD KEY `fk_cuentas_por_cobrar_Ubicacion` (`idUbicacion`);

--
-- Indices de la tabla `cuentas_por_pagar`
--
ALTER TABLE `cuentas_por_pagar`
  ADD PRIMARY KEY (`idCxc`),
  ADD KEY `fk_cuentas_por_pagar_estatus_transaccion` (`idEstatusTransaccion`),
  ADD KEY `fk_cuentas_por_pagar_Moneda` (`idMoneda`),
  ADD KEY `fk_cuentas_por_pagar_persona_proveedor` (`idPersonaProveedor`),
  ADD KEY `fk_cuentas_por_pagar_tipo_transaccion` (`idTipoTransaccion`),
  ADD KEY `fk_cuentas_por_pagar_Ubicacion` (`idUbicacion`);

--
-- Indices de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indices de la tabla `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`idEmpresa`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idEstado`),
  ADD KEY `fk_estado_pais` (`idPais`);

--
-- Indices de la tabla `estatus_transaccion`
--
ALTER TABLE `estatus_transaccion`
  ADD PRIMARY KEY (`idEstatusTransaccion`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `impuesto`
--
ALTER TABLE `impuesto`
  ADD PRIMARY KEY (`idImpuesto`);

--
-- Indices de la tabla `instancia`
--
ALTER TABLE `instancia`
  ADD PRIMARY KEY (`idInstancia`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idInventario`),
  ADD KEY `fk_Inventario_Moneda` (`idMoneda`),
  ADD KEY `fk_Inventario_tipo_transaccion` (`idTipoTransaccion`),
  ADD KEY `fk_Inventario_Ubicacion` (`idUbicacion`);

--
-- Indices de la tabla `inventario_item`
--
ALTER TABLE `inventario_item`
  ADD PRIMARY KEY (`idInventario`,`idItem`),
  ADD KEY `fk_inventario_item_Item` (`idItem`);

--
-- Indices de la tabla `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`idItem`),
  ADD KEY `fk_item_instancia` (`idInstancia`),
  ADD KEY `fk_item_marca` (`idMarca`),
  ADD KEY `fk_item_unidad_medida` (`idUnidadMedida`);

--
-- Indices de la tabla `item_existencia`
--
ALTER TABLE `item_existencia`
  ADD PRIMARY KEY (`idItemExistencia`),
  ADD KEY `fk_item_existencia_idItem` (`idItem`),
  ADD KEY `fk_item_existencia_idUbicacion` (`idUbicacion`);

--
-- Indices de la tabla `item_impuesto`
--
ALTER TABLE `item_impuesto`
  ADD PRIMARY KEY (`idItem`,`idImpuesto`);

--
-- Indices de la tabla `item_precio`
--
ALTER TABLE `item_precio`
  ADD PRIMARY KEY (`idPrecio`),
  ADD KEY `fk_item_precio_item` (`idItem`),
  ADD KEY `fk_item_precio_moneda` (`idMoneda`);

--
-- Indices de la tabla `item_tipo_caracteristica`
--
ALTER TABLE `item_tipo_caracteristica`
  ADD PRIMARY KEY (`idItem`,`idTipoCaracteristica`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idMarca`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indices de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `moneda`
--
ALTER TABLE `moneda`
  ADD PRIMARY KEY (`idMoneda`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`idMunicipio`),
  ADD KEY `fk_municipio_estado` (`idEstado`);

--
-- Indices de la tabla `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`idPais`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idPersona`),
  ADD KEY `fk_persona_tipo_persona` (`idTipoPersona`);

--
-- Indices de la tabla `persona_cliente`
--
ALTER TABLE `persona_cliente`
  ADD PRIMARY KEY (`idPersonaCliente`),
  ADD KEY `fk_persona_cliente_Persona` (`idPersona`),
  ADD KEY `fk_persona_cliente_tipo_seniat` (`idTipoSeniat`),
  ADD KEY `fk_tipo_retencion_persona_cliente` (`idTipoRetencion`);

--
-- Indices de la tabla `persona_proveedor`
--
ALTER TABLE `persona_proveedor`
  ADD PRIMARY KEY (`idPersonaProveedor`),
  ADD KEY `fk_persona_proveedor_Persona` (`idPersona`),
  ADD KEY `fk_persona_proveedor_tipo_retencion` (`idTipoRetencion`),
  ADD KEY `fk_persona_proveedor_tipo_seniat` (`idTipoSeniat`);

--
-- Indices de la tabla `persona_vendedor`
--
ALTER TABLE `persona_vendedor`
  ADD PRIMARY KEY (`idPersonaVendedor`),
  ADD KEY `fk_PersonaVendedor_Persona` (`idPersona`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indices de la tabla `tipo_caracteristica`
--
ALTER TABLE `tipo_caracteristica`
  ADD PRIMARY KEY (`idTipoCaracteristica`);

--
-- Indices de la tabla `tipo_documento_persona`
--
ALTER TABLE `tipo_documento_persona`
  ADD PRIMARY KEY (`idTipoDocumentoPersona`);

--
-- Indices de la tabla `tipo_persona`
--
ALTER TABLE `tipo_persona`
  ADD PRIMARY KEY (`idTipoPersona`);

--
-- Indices de la tabla `tipo_retencion`
--
ALTER TABLE `tipo_retencion`
  ADD PRIMARY KEY (`idTipoRetencion`);

--
-- Indices de la tabla `tipo_seniat`
--
ALTER TABLE `tipo_seniat`
  ADD PRIMARY KEY (`idTipoSeniat`);

--
-- Indices de la tabla `tipo_transaccion`
--
ALTER TABLE `tipo_transaccion`
  ADD PRIMARY KEY (`idTipoTransaccion`);

--
-- Indices de la tabla `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`idUbicacion`),
  ADD KEY `fk_ubicacion_municipio` (`idMunicipio`);

--
-- Indices de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  ADD PRIMARY KEY (`idUnidadMedida`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idVenta`),
  ADD KEY `fk_Venta_Moneda` (`idMoneda`),
  ADD KEY `fk_Venta_persona_cliente` (`idPersonaCliente`),
  ADD KEY `fk_Venta_PersonaVendedor` (`idPersonaVendedor`),
  ADD KEY `fk_Venta_tipo_transaccion` (`idTipoTransaccion`),
  ADD KEY `fk_Venta_Ubicacion` (`idUbicacion`);

--
-- Indices de la tabla `venta_impuesto`
--
ALTER TABLE `venta_impuesto`
  ADD PRIMARY KEY (`idVentaImpuesto`),
  ADD KEY `fk_VentaImpuesto_Impuesto` (`idImpuesto`),
  ADD KEY `fk_VentaImpuesto_Venta` (`idVenta`);

--
-- Indices de la tabla `venta_impuesto_item`
--
ALTER TABLE `venta_impuesto_item`
  ADD PRIMARY KEY (`idVentaImpuesto`),
  ADD KEY `fk_venta_impuesto_item_Impuesto` (`idImpuesto`),
  ADD KEY `fk_venta_impuesto_item_VentaItem` (`idVentaItem`);

--
-- Indices de la tabla `venta_item`
--
ALTER TABLE `venta_item`
  ADD PRIMARY KEY (`idVentaItem`),
  ADD KEY `fk_venta_item_Item` (`idItem`),
  ADD KEY `fk_venta_item_Venta` (`idVenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `idBitacora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `idCarrito` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `idCompra` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra_impuesto`
--
ALTER TABLE `compra_impuesto`
  MODIFY `idCompraImpuesto` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra_impuesto_item`
--
ALTER TABLE `compra_impuesto_item`
  MODIFY `idCompraImpuesto` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra_item`
--
ALTER TABLE `compra_item`
  MODIFY `idCompraItem` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuentas_por_cobrar`
--
ALTER TABLE `cuentas_por_cobrar`
  MODIFY `idCxc` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuentas_por_pagar`
--
ALTER TABLE `cuentas_por_pagar`
  MODIFY `idCxc` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `idEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estatus_transaccion`
--
ALTER TABLE `estatus_transaccion`
  MODIFY `idEstatusTransaccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `impuesto`
--
ALTER TABLE `impuesto`
  MODIFY `idImpuesto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `instancia`
--
ALTER TABLE `instancia`
  MODIFY `idInstancia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `idInventario` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `item`
--
ALTER TABLE `item`
  MODIFY `idItem` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `item_existencia`
--
ALTER TABLE `item_existencia`
  MODIFY `idItemExistencia` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `item_precio`
--
ALTER TABLE `item_precio`
  MODIFY `idPrecio` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `moneda`
--
ALTER TABLE `moneda`
  MODIFY `idMoneda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `idMunicipio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `idPais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idPersona` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona_cliente`
--
ALTER TABLE `persona_cliente`
  MODIFY `idPersonaCliente` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona_proveedor`
--
ALTER TABLE `persona_proveedor`
  MODIFY `idPersonaProveedor` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona_vendedor`
--
ALTER TABLE `persona_vendedor`
  MODIFY `idPersonaVendedor` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tipo_caracteristica`
--
ALTER TABLE `tipo_caracteristica`
  MODIFY `idTipoCaracteristica` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_documento_persona`
--
ALTER TABLE `tipo_documento_persona`
  MODIFY `idTipoDocumentoPersona` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_persona`
--
ALTER TABLE `tipo_persona`
  MODIFY `idTipoPersona` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_retencion`
--
ALTER TABLE `tipo_retencion`
  MODIFY `idTipoRetencion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_seniat`
--
ALTER TABLE `tipo_seniat`
  MODIFY `idTipoSeniat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_transaccion`
--
ALTER TABLE `tipo_transaccion`
  MODIFY `idTipoTransaccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `idUbicacion` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  MODIFY `idUnidadMedida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idVenta` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta_impuesto`
--
ALTER TABLE `venta_impuesto`
  MODIFY `idVentaImpuesto` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta_impuesto_item`
--
ALTER TABLE `venta_impuesto_item`
  MODIFY `idVentaImpuesto` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta_item`
--
ALTER TABLE `venta_item`
  MODIFY `idVentaItem` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `fk_carrito_Item` FOREIGN KEY (`idItem`) REFERENCES `item` (`idItem`),
  ADD CONSTRAINT `fk_carrito_Moneda` FOREIGN KEY (`idMoneda`) REFERENCES `moneda` (`idMoneda`);

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fk_Compra_Moneda` FOREIGN KEY (`idMoneda`) REFERENCES `moneda` (`idMoneda`),
  ADD CONSTRAINT `fk_Compra_Ubicacion` FOREIGN KEY (`idUbicacion`) REFERENCES `ubicacion` (`idUbicacion`),
  ADD CONSTRAINT `fk_Compra_persona_proveedor` FOREIGN KEY (`idPersonaProveedor`) REFERENCES `persona_proveedor` (`idPersonaProveedor`),
  ADD CONSTRAINT `fk_Compra_tipo_transaccion` FOREIGN KEY (`idTipoTransaccion`) REFERENCES `tipo_transaccion` (`idTipoTransaccion`);

--
-- Filtros para la tabla `compra_impuesto`
--
ALTER TABLE `compra_impuesto`
  ADD CONSTRAINT `fk_compra_impuesto_Compra` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`idCompra`),
  ADD CONSTRAINT `fk_compra_impuesto_Impuesto` FOREIGN KEY (`idImpuesto`) REFERENCES `impuesto` (`idImpuesto`);

--
-- Filtros para la tabla `compra_impuesto_item`
--
ALTER TABLE `compra_impuesto_item`
  ADD CONSTRAINT `fk_compra_impuestoItem_Impuesto` FOREIGN KEY (`idImpuesto`) REFERENCES `impuesto` (`idImpuesto`),
  ADD CONSTRAINT `fk_compra_impuestoItem_compra_item` FOREIGN KEY (`idCompraItem`) REFERENCES `compra_item` (`idCompraItem`);

--
-- Filtros para la tabla `compra_item`
--
ALTER TABLE `compra_item`
  ADD CONSTRAINT `fk_compra_item_Compra` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`idCompra`),
  ADD CONSTRAINT `fk_compra_item_Item` FOREIGN KEY (`idItem`) REFERENCES `item` (`idItem`);

--
-- Filtros para la tabla `cuentas_por_cobrar`
--
ALTER TABLE `cuentas_por_cobrar`
  ADD CONSTRAINT `fk_cuentas_por_cobrar_Moneda` FOREIGN KEY (`idMoneda`) REFERENCES `moneda` (`idMoneda`),
  ADD CONSTRAINT `fk_cuentas_por_cobrar_Ubicacion` FOREIGN KEY (`idUbicacion`) REFERENCES `ubicacion` (`idUbicacion`),
  ADD CONSTRAINT `fk_cuentas_por_cobrar_estatus_transaccion` FOREIGN KEY (`idEstatusTransaccion`) REFERENCES `estatus_transaccion` (`idEstatusTransaccion`),
  ADD CONSTRAINT `fk_cuentas_por_cobrar_persona_cliente` FOREIGN KEY (`idPersonaCliente`) REFERENCES `persona_cliente` (`idPersonaCliente`),
  ADD CONSTRAINT `fk_cuentas_por_cobrar_tipo_transaccion` FOREIGN KEY (`idTipoTransaccion`) REFERENCES `tipo_transaccion` (`idTipoTransaccion`);

--
-- Filtros para la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
