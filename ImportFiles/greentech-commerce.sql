-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 15, 2025 at 11:46 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `greentech-commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `alert_thresholds`
--

DROP TABLE IF EXISTS `alert_thresholds`;
CREATE TABLE IF NOT EXISTS `alert_thresholds` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `iot_device_id` bigint UNSIGNED NOT NULL,
  `metric_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_value` decimal(8,2) DEFAULT NULL,
  `max_value` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alert_thresholds_iot_device_id_metric_key_unique` (`iot_device_id`,`metric_key`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `alert_thresholds`
--

INSERT INTO `alert_thresholds` (`id`, `iot_device_id`, `metric_key`, `min_value`, `max_value`, `created_at`, `updated_at`) VALUES
(1, 2, 'temperature', 18.00, 30.00, '2025-12-11 01:41:59', '2025-12-11 01:41:59'),
(2, 2, 'humidity', 50.00, 75.00, '2025-12-11 01:41:59', '2025-12-11 01:41:59'),
(3, 3, 'light_value', 800.00, 3500.00, '2025-12-14 05:47:49', '2025-12-14 05:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `description`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'IoT Board', 'iot-board', 'categories/iot-board.jpg', 'The IoT Board category showcases compact, versatile, and power-efficient hardware platforms designed to connect, sense, and control in modern Internet of Things systems. These boards integrate essential microcontrollers or System-on-Chip (SoC) architectures, wireless communication protocols, and a range of peripherals to support rapid development of connected devices across industries such as smart home, industrial automation, healthcare, and environmental monitoring.', NULL, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(2, 'Sensor Module', 'sensor-module', 'categories/sensor-module.jpg', 'The Sensor Module category showcases compact, plug-and-play sensing solutions that empower edge devices and embedded systems with accurate, real-time data. These modules bundle high-precision sensors, signal conditioning, and sometimes microcontroller capability into a single, easy-to-integrate package, enabling rapid development of applications across IoT, robotics, industrial automation, and consumer electronics.', NULL, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(3, 'Actuator & Relay', 'actuator-relay', 'categories/actuator-relay.jpg', 'The Actuator & Relay category highlights devices that convert electrical energy into mechanical motion or switching actions, enabling controlled actuation and automation across a wide range of systems. These components are essential for translating digital commands into physical movement, force, or power routing in embedded, industrial, and consumer applications.', NULL, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(4, 'Development Kit', 'development-kit', 'categories/development-kit.jpg', 'The Development Kit category features comprehensive bundles designed to accelerate hardware and software prototyping, enabling developers to bring ideas to life quickly and efficiently. These kits provide a cohesive set of hardware boards, sensors, peripherals, documentation, and software tools that work together out-of-the-box, reducing integration effort and shortening time-to-market.', NULL, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(5, 'Gateway & Edge Device', 'gateway-edge-device', 'categories/gateway-edge-device.jpg', 'The Gateway & Edge Device category highlights compact, powerful hardware designed to bridge local environments with cloud services and remote networks. These devices perform edge computing, data aggregation, protocol translation, and secure communication, enabling efficient, low-latency processing close to the source of data while reducing bandwidth and centralized cloud load', NULL, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(6, 'Wireless Module', 'wireless-module', 'categories/wireless-module.jpg', 'The Wireless Module category features compact, production-ready radio modules that enable reliable wireless communication across diverse applications. These modules integrate radio transceivers, protocol stacks, and often microcontroller or SoC capabilities into a small, embeddable package, allowing developers to add wireless connectivity quickly and securely.', NULL, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(7, 'Battery & Power Management', 'battery-power-management', 'categories/battery-power-management.jpg', 'This category focuses on power sources, energy storage, and intelligent power management solutions that maximize runtime and reliability in embedded and IoT devices. Products include batteries (Li-ion, Li-Po, NiMH), supercapacitors, power regulators, battery management systems (BMS), DC-DC converters, energy harvesting modules, and low-power optimization accessories. Ideal for portable devices, remote sensors, wearables, and energy-conscious deployments.', NULL, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(8, 'Enclosure & Hardware Accessories', 'enclosure-hardware-accessories', 'categories/enclosure-hardware-accessories.jpg', 'A curated range of enclosures, mounting hardware, heat sinks, conformal coatings, cable assemblies, and protective seals designed to protect hardware while enabling robust field deployment. This category covers form-factor considerations, EMI shielding, thermal management accessories, and ruggedized components suitable for industrial, outdoor, and consumer environments.', NULL, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(9, 'Home Automation', 'home-automation', 'categories/home-automation.jpg', 'Components and modules that empower interconnected smart homes. Includes controllers, sensors, actuators, hubs, and connectivity solutions designed for easy integration, seamless user experiences, and energy-efficient automation across lighting, climate control, security, and convenience applications.', NULL, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(10, 'Microcontroller', 'microcontroller', 'categories/microcontroller.jpg', 'A broad range of microcontroller boards and modules that deliver simple, cost-effective processing for embedded projects. Highlights include various cores, GPIO, timers, PWM, and periphery options, with rich development ecosystems and beginner-friendly tooling.', NULL, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(11, 'LIGHT Sensor', 'light-sensor', NULL, 'Modules specialized for measuring ambient light intensity (Lux), used in smart lighting and environment monitoring applications.', 2, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(12, 'TEMPERATURE Sensor', 'temperature-sensor', NULL, 'Technical and analog sensors used to measure the temperature of the environment, liquids, or surfaces with high accuracy.', 2, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(13, 'PH Sensor', 'ph-sensor', NULL, 'Specialized probes and electronic modules to measure the pH concentration of solutions or soil, critical for hydroponics and plant nutrition management.', 2, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(14, 'NPK Sensor', 'npk-sensor', NULL, 'Industrial soil sensors designed to measure Nitrogen (N), Phosphorus (P), and Potassium (K) levels in agricultural soil.', 2, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(15, 'SOIL MOISTURE Sensor', 'soil-moisture-sensor', NULL, 'Capacitive or resistive sensors used to determine the water content (moisture level) in agricultural soil for irrigation control.', 2, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(16, 'SOUND Sensor', 'sound-sensor', NULL, 'Microphone modules and processing circuits used for detecting and measuring sound intensity in the environment.', 2, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(17, 'MAGNETIC FIELD Sensor', 'magnetic-field-sensor', NULL, 'Hall effect sensors or magnetometers used to measure magnetic fields or detect the presence of metal objects.', 2, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(18, 'IMPACT/VIBRATION Sensor', 'impact-vibration-sensor', NULL, 'Mechanical or vibration sensors used to detect physical contact, collision, or shock events in the monitoring system.', 2, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(19, 'Arduino Board', 'arduino-board', NULL, 'Popular microcontroller platforms (UNO, Mega, Nano) widely used for education, prototyping, and small-scale automation.', 10, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(20, 'Raspberry Pi Board', 'raspberry-pi-board', NULL, 'Single Board Computers (SBCs) and microcontrollers (Pico, Pico W) used for IoT applications, robotics, and edge computing.', 1, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(21, 'STM32 Board', 'stm32-board', NULL, 'High-performance development boards (Nucleo, Discovery) featuring ARM Cortex-M microcontrollers for industrial and complex embedded systems.', 1, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(22, 'ESP Board', 'esp-board', NULL, 'Boards integrated with Wi-Fi/Bluetooth (ESP32, ESP32-S3, ESP32-C3, etc.), highly favored for connected IoT solutions due to cost and performance.', 1, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(23, 'Actuator', 'actuator', NULL, 'Drive devices, including Servo and Stepper Motors, used to execute physical actions and precise positioning.', 3, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(24, 'Relay', 'relay', NULL, 'Relay modules used for switching high-power electrical circuits, typically controlling AC/DC appliances or garden equipment.', 3, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(25, 'LED & Lighting', 'led-lighting', NULL, 'Various types of LEDs, LED modules, and lighting solutions, including high-power LEDs for illumination.', 3, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(28, 'Components & Parts', 'components-parts', NULL, 'Passive electronic components, wires, and other small parts used for assembly and repair (Top Level Category).', NULL, '2025-12-14 05:09:48', '2025-12-14 05:09:48');

-- --------------------------------------------------------

--
-- Table structure for table `device_metrics`
--

DROP TABLE IF EXISTS `device_metrics`;
CREATE TABLE IF NOT EXISTS `device_metrics` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `iot_device_id` bigint UNSIGNED NOT NULL,
  `metric_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_metrics_iot_device_id_metric_key_unique` (`iot_device_id`,`metric_key`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `device_metrics`
--

INSERT INTO `device_metrics` (`id`, `iot_device_id`, `metric_key`, `description`, `unit`, `created_at`, `updated_at`) VALUES
(1, 2, 'temperature', 'Temperature', 'C', '2025-12-11 01:41:59', '2025-12-11 01:41:59'),
(2, 2, 'humidity', 'Humidity', '%', '2025-12-11 01:41:59', '2025-12-11 01:41:59'),
(3, 3, 'light_value', 'Light', 'lux', '2025-12-14 05:47:49', '2025-12-14 05:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iot_devices`
--

DROP TABLE IF EXISTS `iot_devices`;
CREATE TABLE IF NOT EXISTS `iot_devices` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint UNSIGNED NOT NULL,
  `device_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `last_seen` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iot_devices_device_id_unique` (`device_id`),
  KEY `iot_devices_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iot_devices`
--

INSERT INTO `iot_devices` (`id`, `product_id`, `device_id`, `location`, `is_active`, `last_seen`, `created_at`, `updated_at`) VALUES
(2, 2, 'ESP_SENSOR_DHT22_01', 'Smart Garden Wokwi', 1, NULL, '2025-12-11 01:41:59', '2025-12-11 01:41:59'),
(3, 11, 'light_sensor', 'Smart Garden Wokwi', 1, NULL, '2025-12-14 05:47:49', '2025-12-14 05:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE IF NOT EXISTS `manufacturers` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manufacturers_name_unique` (`name`),
  UNIQUE KEY `manufacturers_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `name`, `slug`, `logo`, `description`, `address`, `contact_phone`, `contact_email`, `created_at`, `updated_at`) VALUES
(1, 'Arduino.cc', 'arduinocc', 'manufacturers/arduinocc.png', 'Arduino.cc is the company behind the Arduino open-source electronics platform, which includes both hardware and software designed to help people easily build interactive projects.', 'Via Pila 2/6, 22077 Olgiate Comasco (CO), Italy', '39 031 98901', 'infor@arduino.com', '2025-12-12 00:54:49', '2025-12-12 00:54:49'),
(2, 'Espressif Systems', 'espressif-systems', 'manufacturers/espressif-systems.png', 'Espressif Systems is a leading fabless semiconductor company globally recognized for its development of power-efficient, highly integrated Wi-Fi and Bluetooth low-power Internet of Things (IoT) solutions. They are the creators of the popular ESP8266 and ESP32 series of microcontrollers, which have become industry standards for connecting embedded devices to the internet due to their cost-effectiveness, strong performance, and robust development environment. The company focuses on providing secure, stable, and cost-effective chip solutions for the smart home, industrial automation, and consumer electronics markets.', '101, Block 2, 690 Bibo Road, Zhang Jiang High-Tech Park, ShangHai, Chinese', '86 21 2416-0733', 'sales@espressif.com', '2025-12-12 00:54:49', '2025-12-12 00:54:49'),
(3, 'STMicroelectronics', 'stmicroelectronics', 'manufacturers/stmicroelectronics.png', 'STMicroelectronics is a global semiconductor leader that designs, develops, manufactures, and markets a broad portfolio of semiconductor solutions. The company is a key innovator in the smart driving, smart industry, smart home & city, and communications infrastructure markets. They are particularly renowned as the primary manufacturer of the highly popular 32-bit ARM Cortex-M based STM32 family of microcontrollers, widely used across educational, prototyping, and industrial applications.', '39 Chemin du Champ des Filles, 1228 Plan-les-Ouates, Geneva, Switzerland', '41 22 929 29 29', 'stmicroelectronics@gmail.com', '2025-12-12 00:54:49', '2025-12-12 00:54:49'),
(4, 'Raspberry Pi Foundation', 'raspberry-pi-foundation', 'manufacturers/raspberry-pi-foundation.png', 'UK-based charity focused on advancing computer science education through affordable, powerful single-board computers.', 'Station Road, Cambridge, CB1 2JH, UK', '+44 1223 322600', 'press@raspberrypi.org', '2025-12-12 00:54:49', '2025-12-12 00:54:49'),
(5, 'Tuya Smart', 'tuya-smart', 'manufacturers/tuya-smart.png', 'Global IoT platform providing cloud connectivity and smart device solutions for home automation and smart agriculture.', 'Building A, Huamao Center, Hangzhou, Zhejiang, China', '+86 400 8599 888', 'sales@tuya.com', '2025-12-12 00:54:49', '2025-12-12 00:54:49'),
(6, 'Adafruit', 'adafruit', 'manufacturers/adafruit.png', 'Open-source hardware company specializing in educational electronics, sensors, and components for makers and engineers.', '150 Bowery, New York, NY 10012, USA', '+1 646 681 5933', 'support@adafruit.com', '2025-12-12 00:54:49', '2025-12-12 00:54:49'),
(7, 'GreenGrowth Inc.', 'greengrowth-inc', 'manufacturers/greengrowth-inc.png', 'Dedicated to sustainable agriculture, producing premium organic fertilizers, soil amendments, and biological pest controls.', '789 Green Acres Blvd, Fresno, CA 93706, USA', '+1 559 123 4567', 'info@greengrowth.com', '2025-12-12 00:54:49', '2025-12-12 00:54:49'),
(8, 'ECO-Power Solutions', 'eco-power-solutions', 'manufacturers/eco-power-solutions.png', 'Specializing in robust solar power kits and energy storage solutions optimized for off-grid IoT deployments in harsh environments.', '101 Clean Energy Way, Phoenix, AZ 85007, USA', '+1 602 876 5432', 'solar@ecopower.com', '2025-12-12 00:54:49', '2025-12-12 00:54:49'),
(9, 'HANNA Instruments', 'hanna-instruments', 'manufacturers/hanna-instruments.png', 'Manufacturer of analytical instrumentation used worldwide for measuring pH, conductivity, temperature, and nutrient concentration.', '584 Smithfield Drive, Woonsocket, RI 02895, USA', '+1 401 765 7788', 'service@hannainst.com', '2025-12-12 00:54:49', '2025-12-12 00:54:49'),
(10, 'Seed Studio (Seeed)', 'seed-studio-seeed', 'manufacturers/seed-studio-seeed.png', 'Providing hardware components and services for IoT and open-source communities, known for the XIAO series of mini development boards.', '98 Meihua Road, Futian District, Shenzhen, China', '+86 755 8352 6969', 'sales@seeed.cc', '2025-12-12 01:35:30', '2025-12-14 18:41:00'),
(11, 'M5Stack', 'm5stack', 'manufacturers/m5stack.png', 'Famous for their modular, stackable IoT development kits built around the ESP32 platform, focusing on rapid application development.', 'Bantian High-Tech Park, Longgang District, Shenzhen, China', '+86 755 2390 0969', 'support@m5stack.com', '2025-12-12 01:35:30', '2025-12-12 01:35:30'),
(12, 'Waveshare', 'waveshare', 'manufacturers/waveshare.png', 'Manufacturer specializing in display modules, e-paper, and electronic components, often providing accessories for Raspberry Pi and Arduino.', '4/F, Bld. L4, No.2, North Zone, Haina Industrial Park, Shenzhen, China', '+86 755 8332 5532', 'contact@waveshare.com', '2025-12-12 01:35:30', '2025-12-12 01:35:30'),
(13, 'DFRobot', 'dfrobot', 'manufacturers/dfrobot.png', 'Robotics and open-source hardware provider, offering a wide array of sensors, modules (including SOUND and IMPACT), and DIY kits.', '9F, T3 Bld, Software Park, Nanshan, Shenzhen, China', '+86 21 6153 0860', 'techsupport@dfrobot.com', '2025-12-12 01:35:30', '2025-12-12 01:35:30'),
(14, 'Pololu', 'pololu', 'manufacturers/pololu.jpg', 'Leading supplier of electronic components, specializing in servo controllers, motor drivers, and small robotic parts.', '920 Pilot Rd, Las Vegas, NV 89119, USA', '+1 702 262 6648', 'info@pololu.com', '2025-12-12 01:35:30', '2025-12-14 18:43:03'),
(15, 'SparkFun Electronics', 'sparkfun-electronics', 'manufacturers/sparkfun-electronics.png', 'Open-source electronics retailer providing breakout boards, sensors, and educational resources, similar to Adafruit.', '6333 Dry Creek Pkwy, Niwot, CO 80544, USA', '+1 303 284 0979', 'contact@sparkfun.com', '2025-12-12 01:35:30', '2025-12-14 18:43:39');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_00_000000_create_roles_table', 1),
(2, '0001_01_01_000000_create_users_table', 1),
(3, '0001_01_01_000001_create_cache_table', 1),
(4, '0001_01_01_000002_create_jobs_table', 1),
(5, '2025_11_07_101644_create_categories_table', 1),
(6, '2025_11_07_101645_create_manufactures_table', 1),
(7, '2025_11_07_101646_create_products_table', 1),
(8, '2025_11_07_101648_create_product_details_table', 1),
(9, '2025_11_07_101649_create_product_images_table', 1),
(10, '2025_11_07_101651_create_order_statuses_table', 1),
(11, '2025_11_07_101652_create_orders_table', 1),
(12, '2025_11_07_101653_create_order_items_table', 1),
(13, '2025_11_07_101654_create_iot_devices_table', 1),
(14, '2025_11_07_101655_create_device_metrics_table', 1),
(15, '2025_11_07_102956_create_alert_thresholds_table', 1),
(16, '2025_12_10_084906_update_roles_column_in_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `order_status_id` bigint UNSIGNED NOT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_order_status_id_foreign` (`order_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_status_id`, `shipping_address`, `contact_phone`, `subtotal`, `tax_amount`, `shipping_fee`, `total_amount`, `payment_method`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'Can Xay , Binh Duc 4, Binh Duc, An Giang, Vietnam', '0924202149', 40.50, 0.30, 0.50, 41.30, 'COD', 'Delive me after 10 A.M', '2025-12-10 00:06:48', '2025-12-10 01:23:53'),
(2, 1, 1, 'Long Xuyen, An Giang, Vietnam', '0924202149', 40.50, 0.20, 0.60, 41.30, 'Credit Card', 'I order JPX Express delivery service', '2025-12-10 00:21:38', '2025-12-10 01:20:43'),
(3, 1, 3, 'Dong Xuyen, An Giang, Vietnam', '0924202150', 65.00, 0.40, 0.64, 66.04, 'Bank Transfer', 'Ninja Shipping delivery service', '2025-12-10 01:06:05', '2025-12-10 01:21:52'),
(4, 1, 3, 'My Xuyen, An Giang, Vietnam', '0924202149', 39.99, 0.81, 0.76, 41.56, 'E-Wallet', 'I want use Viettel delivery service', '2025-12-10 01:23:23', '2025-12-10 01:23:23'),
(13, 1, 1, 'An Giang', '0924202149', 13.00, 1.00, 0.00, 14.00, 'Cash on Delivery', NULL, '2025-12-14 15:40:24', '2025-12-14 15:40:24'),
(14, 1, 1, 'An Giang, Vietnam', '0924816462', 15.00, 2.00, 0.00, 17.00, 'Cash on Delivery', NULL, '2025-12-14 16:55:45', '2025-12-14 16:55:45'),
(15, 1, 1, 'An Giang,Vietnam', '0924202143', 15.00, 2.00, 0.00, 17.00, 'Cash on Delivery', NULL, '2025-12-14 16:56:11', '2025-12-14 16:56:11'),
(16, 1, 1, 'An Giang, Vietnam', '0924202149', 15.00, 2.00, 0.00, 17.00, 'Cash on Delivery', NULL, '2025-12-14 16:56:51', '2025-12-14 16:56:51'),
(17, 1, 1, 'An Giang, Vietnam', '0924202148', 15.00, 2.00, 0.00, 17.00, 'Cash on Delivery', NULL, '2025-12-14 16:57:51', '2025-12-14 16:57:51'),
(18, 1, 1, 'An Giang, Vietnam', '0924202149', 15.00, 2.00, 0.00, 17.00, 'Cash on Delivery', NULL, '2025-12-14 17:03:27', '2025-12-14 17:03:27'),
(19, 1, 1, 'An Giang, Vietnam', '0924202149', 15.00, 2.00, 0.00, 17.00, 'Cash on Delivery', NULL, '2025-12-14 17:09:27', '2025-12-14 17:09:27'),
(20, 1, 1, 'Long Xuyen, An Giang, Vietnam', '0924202148', 15.00, 2.00, 0.00, 17.00, 'Cash on Delivery', NULL, '2025-12-14 17:14:18', '2025-12-14 17:14:18'),
(21, 1, 1, 'An Giang', '092347564', 5.00, 1.00, 0.00, 6.00, 'Cash on Delivery', NULL, '2025-12-14 19:57:18', '2025-12-14 19:57:18'),
(22, 1, 1, 'An Giang', '028737728', 3.00, 0.00, 0.00, 3.00, 'Cash on Delivery', NULL, '2025-12-15 04:00:25', '2025-12-15 04:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `price_at_order` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price_at_order`, `created_at`, `updated_at`) VALUES
(13, 2, 9, 1, 28.00, '2025-12-10 01:20:43', '2025-12-10 01:20:43'),
(14, 2, 1, 1, 12.50, '2025-12-10 01:20:43', '2025-12-10 01:20:43'),
(15, 3, 5, 1, 65.00, '2025-12-10 01:21:52', '2025-12-10 01:21:52'),
(17, 1, 1, 1, 12.50, '2025-12-10 01:23:53', '2025-12-10 01:23:53'),
(18, 1, 9, 1, 28.00, '2025-12-10 01:23:53', '2025-12-10 01:23:53'),
(19, 4, 3, 1, 39.99, '2025-12-10 01:24:05', '2025-12-10 01:24:05'),
(28, 13, 1, 1, 12.50, '2025-12-14 15:40:24', '2025-12-14 15:40:24'),
(29, 14, 8, 1, 15.00, '2025-12-14 16:55:45', '2025-12-14 16:55:45'),
(30, 15, 8, 1, 15.00, '2025-12-14 16:56:11', '2025-12-14 16:56:11'),
(31, 16, 8, 1, 15.00, '2025-12-14 16:56:51', '2025-12-14 16:56:51'),
(32, 17, 8, 1, 15.00, '2025-12-14 16:57:51', '2025-12-14 16:57:51'),
(33, 18, 8, 1, 15.00, '2025-12-14 17:03:27', '2025-12-14 17:03:27'),
(34, 19, 8, 1, 15.00, '2025-12-14 17:09:27', '2025-12-14 17:09:27'),
(35, 20, 8, 1, 15.00, '2025-12-14 17:14:18', '2025-12-14 17:14:18'),
(36, 21, 2, 1, 4.99, '2025-12-14 19:57:18', '2025-12-14 19:57:18'),
(37, 22, 17, 1, 2.50, '2025-12-15 04:00:26', '2025-12-15 04:00:26');

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
CREATE TABLE IF NOT EXISTS `order_statuses` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_statuses_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Pending', '2025-12-09 21:47:58', '2025-12-09 21:47:58'),
(2, 'Shipping', '2025-12-09 21:48:14', '2025-12-09 21:48:14'),
(3, 'Confirmed', '2025-12-09 21:48:41', '2025-12-09 21:49:10'),
(4, 'Paid', '2025-12-09 21:49:01', '2025-12-09 21:49:25'),
(5, 'Canceled', '2025-12-09 21:49:38', '2025-12-09 21:49:38');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('huykyunh.k@gmail.com', '$2y$12$YegIzApcmqFAb6eM2G0kEOdvFvX9HZF3m9EbVtki9QzkRo4QHKu5m', '2025-12-14 10:47:44');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint UNSIGNED NOT NULL,
  `manufacturer_id` bigint UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `stock_quantity` int NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_manufacturer_id_foreign` (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `manufacturer_id`, `name`, `slug`, `price`, `stock_quantity`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'ESP32-S3 IoT Development Board', 'esp32-s3-iot-development-board', 12.50, 500, 'High-performance IoT board featuring integrated Wi-Fi, Bluetooth, and camera interface for AI vision applications.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(2, 2, 6, 'DHT22 Temperature/Humidity Module', 'dht22-temperaturehumidity-module', 4.99, 1200, 'Digital sensor providing reliable and accurate temperature and humidity readings for climate monitoring.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(3, 3, 5, 'Smart Irrigation Valve (Zigbee)', 'smart-irrigation-valve-zigbee', 39.99, 80, 'Motorized valve for automated water flow control, compatible with smart home ecosystems like Zigbee.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(4, 3, 7, 'Organic Soil Booster (10kg)', 'organic-soil-booster-10kg', 19.50, 350, 'Slow-release organic fertilizer mix designed to improve soil structure and long-term plant health.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(5, 1, 4, 'Raspberry Pi 5 (4GB RAM)', 'raspberry-pi-5-4gb-ram', 65.00, 40, 'Flagship single-board computer, ideal for complex local data processing and edge computing applications.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(6, 2, 9, 'Industrial NPK Sensor (RS485)', 'industrial-npk-sensor-rs485', 34.00, 90, 'Rugged sensor module for deep soil monitoring, communicating NPK levels via the Modbus protocol.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(7, 3, 8, 'Solar Smart Panel Kit (10W)', 'solar-smart-panel-kit-10w', 75.00, 210, 'Compact solar panel and charge controller kit designed to power remote garden sensors and devices.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(8, 3, 5, 'Peristaltic Dosing Pump (12V)', 'peristaltic-dosing-pump-12v', 15.00, 150, 'Precision pump used for accurately dosing liquid nutrients or pH modifiers into the water supply.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(9, 1, 2, 'Arduino UNO R4 WiFi', 'arduino-uno-r4-wifi', 28.00, 10, 'Easy-to-use development board with built-in Wi-Fi, combining classic simplicity with modern connectivity.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(10, 2, 6, 'I2C LCD Display (20x4)', 'i2c-lcd-display-20x4', 9.99, 600, 'Standard 20 character by 4 line display module, perfect for displaying real-time sensor data and system status.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(11, 2, 6, 'Light Sensor (BH1750)', 'light-sensor-bh1750', 4.50, 1500, 'Digital light intensity sensor providing accurate Lux readings via I2C interface.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(12, 2, 6, 'Temperature Sensor (DS18B20)', 'temperature-sensor-ds18b20', 5.50, 1200, 'Digital waterproof temperature probe utilizing the OneWire protocol.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(13, 2, 9, 'PH Sensor Probe', 'ph-sensor-probe', 25.00, 250, 'Industrial pH electrode for continuous liquid acidity monitoring.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(14, 2, 9, 'NPK Sensor Probe', 'npk-sensor-probe', 40.00, 180, 'Soil sensor for measuring NPK nutrient levels, communicates via RS485 (Modbus).', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(15, 2, 6, 'Soil Moisture Sensor (Capacitive)', 'soil-moisture-sensor-capacitive', 6.50, 1100, 'Capacitive sensor providing stable analog output, less prone to corrosion.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(16, 2, 13, 'Sound Sensor Module (KY-038)', 'sound-sensor-module-ky-038', 3.00, 900, 'Basic analog sound detection module with adjustable sensitivity.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(17, 2, 13, 'Magnetic Field Sensor (Hall Effect)', 'magnetic-field-sensor-hall-effect', 2.50, 800, 'Hall effect sensor used to detect magnetic fields or metallic objects.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(18, 2, 13, 'Impact/Vibration Sensor', 'impactvibration-sensor', 1.50, 1100, 'Simple digital switch activated by vibration or impact.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(19, 10, 1, 'Board Arduino Rev3', 'board-arduino-rev3', 22.00, 150, 'Classic ATmega328P based board, fundamental for electronics prototyping.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(20, 10, 1, 'Board Arduino Mega', 'board-arduino-mega', 45.00, 80, 'High I/O count board based on ATMega2560 for complex projects.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(21, 10, 1, 'Board Arduino Nano', 'board-arduino-nano', 9.00, 300, 'Compact, breadboard-friendly ATMega328P board.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(22, 1, 2, 'Board Franzininho-WiFi (ESP32 S2)', 'board-franzininho-wifi-esp32-s2', 18.00, 120, 'Brazilian open-source board featuring the ESP32-S2 chip.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(23, 10, 6, 'ATtiny85', 'attiny85', 3.00, 1800, 'Tiny, low-cost microcontroller for simple, small projects.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(24, 1, 4, 'Board Raspberry Pi Pico', 'board-raspberry-pi-pico', 4.00, 600, 'Low-cost, high-performance RP2040 microcontroller board.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(25, 1, 4, 'Board Raspberry Pi Pico W', 'board-raspberry-pi-pico-w', 6.00, 450, 'Raspberry Pi Pico with integrated 2.4 GHz Wi-Fi.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(26, 1, 3, 'Board STM32 Nuclear64 c031c6', 'board-stm32-nuclear64-c031c6', 15.00, 100, 'STM32 Nucleo board featuring a Cortex-M0+ core.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(27, 1, 3, 'Board STM32 Nuclear64 l031k6', 'board-stm32-nuclear64-l031k6', 16.00, 90, 'Low-power STM32 Nucleo board ideal for battery applications.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(28, 1, 2, 'Board ESP32-S2', 'board-esp32-s2', 10.00, 350, 'Basic ESP32 variant optimized for security and USB/touch applications.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(29, 1, 2, 'Board ESP32-S3', 'board-esp32-s3', 14.00, 300, 'Advanced ESP32 with AI acceleration and vector instructions.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(30, 1, 2, 'Board ESP32-C3', 'board-esp32-c3', 8.00, 400, 'RISC-V based ESP32 with Wi-Fi and Bluetooth LE.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(31, 1, 2, 'Board ESP32-C6', 'board-esp32-c6', 12.00, 280, 'First ESP32 supporting Wi-Fi 6, Zigbee, and Thread protocols.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(32, 1, 2, 'Board ESP32-H2', 'board-esp32-h2', 11.00, 220, 'ESP32 chip focused on low-power connectivity, supporting Zigbee and Thread.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(33, 1, 2, 'Board ESP32-P4', 'board-esp32-p4', 35.00, 50, 'New high-performance ESP32 designed for complex HMI and multi-media tasks.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(34, 4, 2, 'Board ESP32-S3 BOX3', 'board-esp32-s3-box3', 70.00, 30, 'Complete development kit for voice interaction and AIoT applications.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(35, 1, 11, 'M5Stack Core S3', 'm5stack-core-s3', 60.00, 45, 'Modular, stackable ESP32-S3 development kit with screen and battery.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(36, 1, 10, 'XIAO ESP32 C3', 'xiao-esp32-c3', 9.00, 200, 'Ultra-small ESP32-C3 board, suitable for space-constrained projects.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(37, 1, 10, 'XIAO ESP32 S3', 'xiao-esp32-s3', 13.00, 150, 'Ultra-small ESP32-S3 board with strong processing power.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(38, 3, 14, 'Servo PWM (SG90)', 'servo-pwm-sg90', 3.50, 1200, 'Popular micro servo motor used for precision angular control (9g).', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(39, 3, 14, 'Relay Module (1-Channel)', 'relay-module-1-channel', 2.00, 1500, 'Single-channel relay module often controlled by microcontrollers.', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(40, 3, 14, 'High Brightness LED (10-Pack)', 'high-brightness-led-10-pack', 0.99, 5000, 'Basic indicator or lighting components, sold in a pack of 10.', '2025-12-12 01:46:53', '2025-12-12 01:46:53');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
CREATE TABLE IF NOT EXISTS `product_details` (
  `product_id` bigint UNSIGNED NOT NULL,
  `memory` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpu` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `graphic` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `power_specs` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`product_id`, `memory`, `cpu`, `graphic`, `power_specs`, `created_at`, `updated_at`) VALUES
(1, '8MB SPI RAM', 'Dual-Core LX7', 'N/A', '3.3V DC', '2025-12-09 22:49:15', '2025-12-09 22:49:15'),
(2, NULL, NULL, NULL, '3.3V-5V DC', '2025-12-09 22:56:43', '2025-12-09 22:56:43'),
(3, NULL, 'ARM Cortex M0', NULL, '12V DC, 2A', '2025-12-09 22:57:55', '2025-12-12 01:46:53'),
(4, NULL, NULL, NULL, NULL, '2025-12-09 22:59:05', '2025-12-12 01:46:53'),
(5, '4GB LPDDR4X', 'Broadcom BCM2712', 'VideoCore VII', '5V DC, 5A', '2025-12-09 23:00:10', '2025-12-12 01:46:53'),
(6, NULL, 'STM32F103', NULL, '9V-24V DC', '2025-12-09 23:02:36', '2025-12-12 01:46:53'),
(7, NULL, NULL, NULL, '18V Solar Out', '2025-12-09 23:03:17', '2025-12-12 01:46:53'),
(8, NULL, NULL, NULL, '12V DC', '2025-12-09 23:04:08', '2025-12-12 01:46:53'),
(9, '32KB SRAM', 'Renesas RA4M1', NULL, '5V DC', '2025-12-09 23:05:10', '2025-12-12 01:46:53'),
(10, NULL, NULL, NULL, '5V DC', '2025-12-09 23:05:52', '2025-12-12 01:46:53'),
(11, 'N/A', 'N/A', 'N/A', '3.3V-5V DC', '2025-12-12 00:13:12', '2025-12-12 01:46:53'),
(12, 'N/A', 'N/A', 'N/A', '3.0V-5.5V DC', '2025-12-12 00:13:12', '2025-12-12 01:46:53'),
(13, 'N/A', 'N/A', 'N/A', 'N/A', '2025-12-12 00:13:12', '2025-12-12 01:46:53'),
(14, 'N/A', 'N/A', 'N/A', '9V-24V DC', '2025-12-12 00:13:12', '2025-12-12 01:46:53'),
(15, 'N/A', 'N/A', 'N/A', '3.3V-5V DC', '2025-12-12 00:13:12', '2025-12-12 01:46:53'),
(16, 'N/A', 'N/A', 'N/A', '5V DC', '2025-12-12 00:13:12', '2025-12-12 01:46:53'),
(17, 'N/A', 'N/A', 'N/A', '3.3V-5V DC', '2025-12-12 00:13:12', '2025-12-12 01:46:53'),
(18, 'N/A', 'N/A', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(19, '2KB SRAM', 'ATmega328P', 'N/A', '5V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(20, '8KB SRAM', 'ATmega2560', 'N/A', '5V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(21, '2KB SRAM', 'ATmega328P', 'N/A', '5V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(22, '4MB Flash', 'ESP32-S2', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(23, '512B SRAM', 'ATtiny85', 'N/A', '3.3V-5V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(24, '264KB SRAM', 'RP2040', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(25, '264KB SRAM', 'RP2040', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(26, '12KB SRAM', 'STM32C031C6', 'N/A', '5V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(27, '8KB SRAM', 'STM32L031K6', 'N/A', '5V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(28, '320KB SRAM', 'Dual-Core', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(29, '512KB SRAM', 'Dual-Core LX7', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(30, '400KB SRAM', 'Single-Core RISC-V', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(31, '512KB SRAM', 'Dual-Core', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(32, '256KB SRAM', 'Single-Core RISC-V', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(33, '750KB SRAM', 'Dual-Core', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(34, '512KB + 16MB PSRAM', 'Dual-Core LX7', 'N/A', '5V DC (USB-C)', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(35, '512KB + 8MB PSRAM', 'Dual-Core LX7', 'N/A', '5V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(36, '400KB SRAM', 'Single-Core RISC-V', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(37, '512KB + 4MB PSRAM', 'Dual-Core LX7', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(38, 'N/A', 'N/A', 'N/A', '4.8V-6V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(39, 'N/A', 'N/A', 'N/A', '5V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(40, 'N/A', 'N/A', 'N/A', '2V-3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_avatar` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `url`, `is_avatar`, `created_at`, `updated_at`) VALUES
(1, 10, 'products/i2c-lcd-display-20x4.jpg', 1, '2025-12-11 05:48:55', '2025-12-14 18:31:32'),
(2, 9, 'products/arduino-uno-r4-wifi.jpg', 1, '2025-12-11 05:53:31', '2025-12-14 18:30:04'),
(4, 8, 'products/peristaltic-dosing-pump-12v.jpg', 1, '2025-12-11 05:57:11', '2025-12-11 05:57:11'),
(5, 7, 'products/solar-smart-panel-kit-10w.jpg', 1, '2025-12-11 05:58:18', '2025-12-11 05:58:18'),
(8, 14, 'products/solar-smart-panel-kit-10w.jpg', 1, '2025-12-12 00:13:12', '2025-12-12 00:13:12'),
(9, 15, 'products/peristaltic-dosing-pump-12v.jpg', 1, '2025-12-12 00:13:12', '2025-12-12 00:13:12'),
(10, 16, 'products/sound-sensor-module-ky-038.jpg', 1, '2025-12-12 00:13:12', '2025-12-14 18:34:18'),
(11, 17, 'products/magnetic-field-sensor-hall-effect.jpg', 1, '2025-12-12 00:13:12', '2025-12-14 18:35:55'),
(12, 9, 'products/solar-smart-panel-kit-10w.jpg', 1, '2025-12-12 00:28:11', '2025-12-12 00:28:11'),
(13, 10, 'products/peristaltic-dosing-pump-12v.jpg', 1, '2025-12-12 00:28:11', '2025-12-12 00:28:11'),
(14, 11, 'products/light-sensor-bh1750.jpg', 1, '2025-12-12 00:28:11', '2025-12-14 18:32:48'),
(15, 12, 'products/temperature-sensor-ds18b20.jpg', 1, '2025-12-12 00:28:11', '2025-12-14 18:33:40'),
(16, 7, 'products/solar-smart-panel-kit-10w.jpg', 1, '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(17, 8, 'products/peristaltic-dosing-pump-12v.jpg', 1, '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(18, 9, 'products/arduino-uno-r4-wifi.jpg', 1, '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(19, 10, 'products/i2c-lcd-display-20x4.jpg', 1, '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(20, 2, 'products/dht22-temperaturehumidity-module.jpg', 1, '2025-12-14 18:26:12', '2025-12-14 18:26:12'),
(21, 1, 'products/esp32-s3-iot-development-board.jpg', 1, '2025-12-14 18:26:55', '2025-12-14 18:26:55'),
(22, 3, 'products/smart-irrigation-valve-zigbee.jpg', 1, '2025-12-14 18:27:33', '2025-12-14 18:27:33'),
(23, 4, 'products/organic-soil-booster-10kg.jpg', 1, '2025-12-14 18:28:06', '2025-12-14 18:28:06'),
(24, 5, 'products/raspberry-pi-5-4gb-ram.jpg', 1, '2025-12-14 18:28:41', '2025-12-14 18:28:41'),
(25, 6, 'products/industrial-npk-sensor-rs485.jpg', 1, '2025-12-14 18:29:26', '2025-12-14 18:29:26'),
(26, 13, 'products/ph-sensor-probe.jpg', 1, '2025-12-14 18:35:03', '2025-12-14 18:35:03'),
(27, 18, 'products/impactvibration-sensor.jpg', 1, '2025-12-14 18:36:53', '2025-12-14 18:36:53'),
(28, 19, 'products/board-arduino-rev3.jpg', 1, '2025-12-14 18:37:55', '2025-12-14 18:37:55'),
(29, 20, 'products/board-arduino-mega.jpg', 1, '2025-12-14 18:39:24', '2025-12-14 18:39:24'),
(30, 21, 'products/board-arduino-nano.jpg', 1, '2025-12-14 18:57:51', '2025-12-14 18:57:51');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'Full access to manage the application, including user accounts, permissions, and configuration settings.', '2025-11-08 12:01:46', '2025-12-10 07:00:43'),
(2, 'Users', 'Regular user with access to standard features and resources of the system.', '2025-11-08 12:01:46', '2025-12-10 07:00:50'),
(3, 'Saler', 'Responsible for sales-related activities, such as managing product listings, processing orders, and handling customer inquiries.', '2025-11-08 12:01:46', '2025-11-08 12:01:46'),
(4, 'Shipper', 'Handles logistics and shipping tasks, including dispatching orders and tracking shipments.', '2025-11-08 12:01:46', '2025-11-08 12:01:46');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('7f4V41X3odhgZDqU3OXeVD72sZ38w6jaJFWPlbpb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMURTNGNnSHR5Z3pYYVdNeGVUaW5JNmo0NmNUbUFyTnY2NWlCc0pDbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODA3MC9ncmVlbnRlY2gtY29tbWVyY2UiO3M6NToicm91dGUiO3M6MTM6ImZyb250ZW5kLmhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765792275),
('c3xQitX6pbvPCHEzFSYLePGLX9702ImmidQHC7tY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmRRWkk5cnYwRmhMNDI5SjN6UWIwN1BFbWFzdlpyT2dQY3kzeHEzMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODA3MC9ncmVlbnRlY2gtY29tbWVyY2UiO3M6NToicm91dGUiO3M6MTM6ImZyb250ZW5kLmhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765792275),
('itI7LWx3kc8jgmeGuXIMvp8BPGkwlTRfKfrxB9X5', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVHY0b0t3TERaVzdRZ0tLQUt1NmJNakhlaWRIWXpsdzRGSlJwY202NyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODA3MC9ncmVlbnRlY2gtY29tbWVyY2UvdXNlci9wcm9maWxlIjtzOjU6InJvdXRlIjtzOjEyOiJ1c2VyLnByb2ZpbGUiO31zOjQ6ImNhcnQiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1765796734),
('JGz3zsbcbjuFsSD8qz4cP7wYKHTvpwaNDrMHoUh7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidG1tVzBoSkN5ZEx1QkUyVnB3QnlUdkxGV1RzbGdxVHJVdzFiMXZBaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMjcuMC4wLjE6ODA3MC9ncmVlbnRlY2gtY29tbWVyY2UvcHJvZHVjdHMvYWN0dWF0b3IiO3M6NToicm91dGUiO3M6Mjg6ImZyb250ZW5kLnByb2R1Y3RzLmNhdGVnb3JpZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765792275),
('qkAjaxeJLVFIu18XkV7VHTr5JvSCkKWhoclvJuqt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZktjSmQ5Uk44M2NRSDdNRTNZbVFiaERjOUZPQVE0SnR6SWtQeXVVbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly8xMjcuMC4wLjE6ODA3MC9ncmVlbnRlY2gtY29tbWVyY2UvcmVjcnVpdG1lbnQiO3M6NToicm91dGUiO3M6MjA6ImZyb250ZW5kLnJlY3J1aXRtZW50Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1765792275),
('XhHInkrVvYbswILls4MDGrgit2khh2rAPVo5WP1W', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidUd1SmpRNFRXbGk3M2dwVXJTUGdFdU5YQ0FaYTBIUmh2dk5ydkVNWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly8xMjcuMC4wLjE6ODA3MC9ncmVlbnRlY2gtY29tbWVyY2UvcmVjcnVpdG1lbnQiO3M6NToicm91dGUiO3M6MjA6ImZyb250ZW5kLnJlY3J1aXRtZW50Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1765792275),
('YtNhqezy2Rbq6iFXZHkrgCn8IOmW2Au4d1tp3PL7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUQ1NWpHVUlGaW1lVnVQaGEwVkZzWWVoT0NHRGNKUno0WndTeWdRayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODA3MC9ncmVlbnRlY2gtY29tbWVyY2UiO3M6NToicm91dGUiO3M6MTM6ImZyb250ZW5kLmhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765792275);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_card` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jobs` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_id_card_unique` (`id_card`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `username`, `phone`, `id_card`, `is_active`, `roles`, `address`, `avatar`, `background`, `jobs`, `school`, `company`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@gmail.com', NULL, '$2y$12$5iCL/.h1SfMgfAWXTeqlsuX9eLW92WZmbcH.XN6uzwTSB7RKSjIG2', 'admin', '0924202149', '089204002620', 1, '1', 'Binh Duc, An Giang, Vietnam', NULL, NULL, 'Administrator', 'An Giang University', 'HK.Huang', '00nej78waBYjVsG4r2m5mUuh5ojtcvjFEt1XAwS8PpfZ1zlp3BNwAvjhANUW', '2025-11-08 05:06:29', '2025-12-10 02:06:36'),
(2, 'Phong Thụy Anh', 'fengshuiying07@gmail.com', NULL, '$2y$12$Yp12yiDHD0VmXxpczHLWF.lSs3/xKfUF2CDnoUvPOLYzCddFHNWsm', 'fengshuiying', '0924202150', '08920402720', 1, '3', 'Binh Duc, An Giang, Vietnam', NULL, NULL, 'Streamer', 'Dalat University', 'HK.Huang', NULL, '2025-12-10 01:39:19', '2025-12-10 01:52:03'),
(3, 'Lâm Tư Thụy', 'linsiruin07@gmail.com', NULL, '$2y$12$R6DYLZxI4I50dc/Jo0DzRuhp/fu4dKJPvWW27L7bLSd/5maVtHFge', 'linsirui', '0924202148', '08920402820', 1, '4', 'Nan Jing, China', NULL, NULL, '4th Year Student', 'Nan Jing', 'HK.Huang', NULL, '2025-12-10 02:04:29', '2025-12-10 02:05:13'),
(4, 'Vũ Trường Ưu', 'yuzhangyou07@gmail.com', NULL, '$2y$12$5Y18jxymdOIXz.kcBqBSaOzrajNaFwJKyH/FFExjJTgbQFLKBSe9G', 'yuzhangyou', '0924202147', '089204002920', 1, '2', 'Dalat, LamDong, Vietnam', NULL, NULL, 'Web Designer', 'DaLat University', 'HK.Huang', NULL, '2025-12-10 02:17:39', '2025-12-14 06:16:41'),
(5, 'Trần Tịch', 'chenji07@gmail.com', NULL, '$2y$12$VRIJA44HlFtBjiZv.5C3VepaDHopt/XuiGbKfOYEAEYhiO95ytXIC', 'chenji', '0924202146', '089204002520', 1, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-10 02:25:56', '2025-12-10 02:25:56'),
(6, 'Triệu Cẩm Đan', 'zhaojindan@gmail.com', NULL, '$2y$12$yi.PASHCZKIyGQcllWATQuHQoMk9hXBhxY4qJazsNdsMqLRgywpia', 'zhaojindan', '0924202145', '089204002420', 1, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-10 02:32:51', '2025-12-10 02:32:51'),
(7, 'Dương Ái Sa', 'yangaisha@gmail.com', NULL, '$2y$12$qvQpQcZp2O0Bkz1moPSfqe2oMymtEhPBBFs6/WhgKzLQCx2xN4Jqu', 'yangaisha', '0924202146', '089204002320', 1, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-12 06:54:19', '2025-12-12 06:54:19'),
(9, 'Huỳnh Quốc Huy', 'huykyunh.k@gmail.com', NULL, '$2y$12$DqfhZOm9/IG4Bjdq/n2J1.PaiDDbH5eUd5XscfKbTEWL6VnPOxYKi', 'huykyun', '0924202149', '089204002621', 1, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-14 10:40:11', '2025-12-14 10:40:11');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alert_thresholds`
--
ALTER TABLE `alert_thresholds`
  ADD CONSTRAINT `alert_thresholds_iot_device_id_foreign` FOREIGN KEY (`iot_device_id`) REFERENCES `iot_devices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `device_metrics`
--
ALTER TABLE `device_metrics`
  ADD CONSTRAINT `device_metrics_iot_device_id_foreign` FOREIGN KEY (`iot_device_id`) REFERENCES `iot_devices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `iot_devices`
--
ALTER TABLE `iot_devices`
  ADD CONSTRAINT `iot_devices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_manufacturer_id_foreign` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
