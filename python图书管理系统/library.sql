/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 06/05/2023 16:31:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `bookId` int(0) NOT NULL,
  `bookName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `author` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ISBN` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category` int(0) NOT NULL,
  `quantity` int(0) NOT NULL,
  PRIMARY KEY (`bookId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '卖女柴的小火孩', '杨斯宇', 'ISBN-1564', 3, 10);
INSERT INTO `book` VALUES (2, '离散数学', '费洪晓', 'ISBN-1654', 5, 20);
INSERT INTO `book` VALUES (3, '母猪的产后护理', 'clearlove', 'ISBN-5663', 5, 30);
INSERT INTO `book` VALUES (4, '正方形打野', '芜湖大司马', 'ISBN-5623', 1, 40);
INSERT INTO `book` VALUES (5, '三句话，让我说了三句话', '精通人性的♂讲师', 'ISBN-4563', 1, 50);
INSERT INTO `book` VALUES (6, '可是雪豹已失联', '珍珠顶针', 'ISBN-6516', 4, 60);
INSERT INTO `book` VALUES (7, '重生之我是卷王杨斯宇', '杨斯宇', 'ISBN-1378', 2, 15);
INSERT INTO `book` VALUES (8, '骑驴找马', '姜文', '9787535452368', 3, 1);
INSERT INTO `book` VALUES (9, '说的道理', 'otto', 'ISBN-1658', 1, 12);

-- ----------------------------
-- Table structure for borrowinfo
-- ----------------------------
DROP TABLE IF EXISTS `borrowinfo`;
CREATE TABLE `borrowinfo`  (
  `borrowId` int(0) NOT NULL,
  `userId` int(0) NOT NULL,
  `bookId` int(0) NOT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bookName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`borrowId`) USING BTREE,
  INDEX `bookId`(`bookId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrowinfo
-- ----------------------------
INSERT INTO `borrowinfo` VALUES (1, 2, 1, '杨斯宇', '3', '卖女柴的小火孩');
INSERT INTO `borrowinfo` VALUES (2, 3, 2, '周硕', '4', '离散数学');
INSERT INTO `borrowinfo` VALUES (3, 1, 1, 'test', '2', '卖火柴的小女孩');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `admin` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '8209210315', '欧阳鎔嘉', '123456', 1);
INSERT INTO `user` VALUES (2, '8209210316', '杨斯宇', '123456', 1);
INSERT INTO `user` VALUES (3, '8209210313', '周硕', '123456', 1);
INSERT INTO `user` VALUES (4, '123', 'test', '123', 1);
INSERT INTO `user` VALUES (10, 'test123', '张三', 'test123', 0);

SET FOREIGN_KEY_CHECKS = 1;
