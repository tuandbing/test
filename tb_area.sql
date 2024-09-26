/*
 Navicat Premium Data Transfer

 Source Server         : mantou
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : goods_manager

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 26/09/2024 15:17:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_area
-- ----------------------------
DROP TABLE IF EXISTS `tb_area`;
CREATE TABLE `tb_area`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `area_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_area
-- ----------------------------
INSERT INTO `tb_area` VALUES (1, '江西省萍乡市');
INSERT INTO `tb_area` VALUES (2, '江苏省镇江市');
INSERT INTO `tb_area` VALUES (3, '湖南省长沙市');
INSERT INTO `tb_area` VALUES (4, '北京市');
INSERT INTO `tb_area` VALUES (5, '江西省赣州');
INSERT INTO `tb_area` VALUES (6, '江苏省南京市');
INSERT INTO `tb_area` VALUES (7, '江苏省连云港');

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `feature` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `areaid` int NULL DEFAULT NULL,
  `roleid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES (1, '苹果', '2004-05-02', 20, '又大又甜', 7, 1);
INSERT INTO `tb_goods` VALUES (3, '梨子', '2002-04-02', 30, '光滑多汁', 1, 1);
INSERT INTO `tb_goods` VALUES (4, '柑橘', '2009-05-21', 15, '酸甜', 1, 2);
INSERT INTO `tb_goods` VALUES (5, '西瓜', '2006-11-12', 20, '甘甜可口', 1, 2);

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `power` int NULL DEFAULT NULL COMMENT '设置权限,1为普通商家,2为超级管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES (1, '馒头', 'pyw040212', '17305285876', '1873656423@qq.com', 1);
INSERT INTO `tb_role` VALUES (2, '佩奇', 'sbpq040816', '19825828653', '19825828653@163.com', 2);
INSERT INTO `tb_role` VALUES (3, '花生', '17305285876', '', '1873656423@qq.com', 1);

SET FOREIGN_KEY_CHECKS = 1;
