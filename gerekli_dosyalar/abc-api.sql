/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100410
 Source Host           : localhost:3306
 Source Schema         : abc-api

 Target Server Type    : MySQL
 Target Server Version : 100410
 File Encoding         : 65001

 Date: 27/11/2020 11:03:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES (1, 'A Müşteri', 'amusteri', '123', 'a@müşteri.com');
INSERT INTO `customers` VALUES (2, 'B Müşteri', 'bmusteri', '123', 'b@müşteri.com');
INSERT INTO `customers` VALUES (3, 'C Müşteri', 'cmusteri', '123', 'c@müşteri.com');

-- ----------------------------
-- Table structure for doctrine_migration_versions
-- ----------------------------
DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE `doctrine_migration_versions`  (
  `version` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime(0) NULL DEFAULT NULL,
  `execution_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctrine_migration_versions
-- ----------------------------
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20201126085428', '2020-11-26 08:55:53', 92);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20201126160014', '2020-11-26 16:00:24', 101);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20201126160417', '2020-11-26 16:04:30', 76);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20201126161348', '2020-11-26 16:13:59', 68);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20201126161539', '2020-11-26 16:15:52', 92);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20201126162219', '2020-11-26 16:22:25', 63);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20201126162258', '2020-11-26 16:23:03', 78);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20201126202034', '2020-11-26 20:22:23', 59);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20201126202631', '2020-11-26 20:26:43', 78);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `produt_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 1, '4319112', 1, 5, 'Adres', '2020-11-26 19:30:24');
INSERT INTO `orders` VALUES (9, 1, '1984523630', 5, 6, 'adres', '2020-11-26 22:19:53');
INSERT INTO `orders` VALUES (10, 1, '122081272', 3, 4, 'adres', '2020-11-26 22:21:22');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Kalem', 100);
INSERT INTO `products` VALUES (2, 'Kitap', 75);
INSERT INTO `products` VALUES (3, 'Çanta', 50);
INSERT INTO `products` VALUES (4, 'Silgi', 60);
INSERT INTO `products` VALUES (5, 'Defter', 200);

SET FOREIGN_KEY_CHECKS = 1;
