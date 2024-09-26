/*
 Navicat Premium Data Transfer

 Source Server         : mantou
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : forum

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 26/09/2024 15:17:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_login_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_role`;
CREATE TABLE `sys_login_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `login_id` int NOT NULL,
  `role_id` int NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户较色对照表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_role
-- ----------------------------
INSERT INTO `sys_login_role` VALUES (1, 1, 1, 'admin1');
INSERT INTO `sys_login_role` VALUES (2, 21, 2, 'administrator');
INSERT INTO `sys_login_role` VALUES (3, 22, 3, 'adminyuguo21');
INSERT INTO `sys_login_role` VALUES (4, 23, 3, 'aa123456aa');
INSERT INTO `sys_login_role` VALUES (5, 24, 3, 'aaxxss');
INSERT INTO `sys_login_role` VALUES (6, 25, 3, 'aa789456');
INSERT INTO `sys_login_role` VALUES (7, 26, 3, '请叫我大王');
INSERT INTO `sys_login_role` VALUES (8, 27, 3, '111111');
INSERT INTO `sys_login_role` VALUES (9, 28, 3, 'qqqqqqq');
INSERT INTO `sys_login_role` VALUES (10, 29, 3, 'admingogo');
INSERT INTO `sys_login_role` VALUES (11, 30, 3, 'aaaaaa');
INSERT INTO `sys_login_role` VALUES (12, 31, 3, 'adminis124');
INSERT INTO `sys_login_role` VALUES (13, 32, 3, 'adminis11');
INSERT INTO `sys_login_role` VALUES (14, 33, 3, 'mr');
INSERT INTO `sys_login_role` VALUES (15, 34, 3, 'mingrisoft');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `permission_id` int NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `permission_menu_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `permission_menu_pid` int NULL DEFAULT NULL,
  PRIMARY KEY (`permission_id`) USING BTREE,
  UNIQUE INDEX `permission_name_UNIQUE`(`permission_name` ASC) USING BTREE,
  UNIQUE INDEX `permission_menu_name_UNIQUE`(`permission_menu_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, 'xinwgl', '新闻管理1', 0);
INSERT INTO `sys_permission` VALUES (2, 'yonggxx', '用工信息', 0);
INSERT INTO `sys_permission` VALUES (3, 'zhaopxx', '招聘信息', 0);
INSERT INTO `sys_permission` VALUES (4, 'qiywh', '企业文化', 0);
INSERT INTO `sys_permission` VALUES (6, 'zengj', '增加', 1);
INSERT INTO `sys_permission` VALUES (7, 'maic', '卖场', 0);
INSERT INTO `sys_permission` VALUES (8, 'quanxian', '权限设置', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `role_des` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `role_pid` int NOT NULL,
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `role_des_UNIQUE`(`role_des` ASC) USING BTREE,
  UNIQUE INDEX `role_name_UNIQUE`(`role_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'admin', '管理员', 0);
INSERT INTO `sys_role` VALUES (2, 'guest', '嘉宾', 0);
INSERT INTO `sys_role` VALUES (3, 'vip', '会员', 0);
INSERT INTO `sys_role` VALUES (4, 'role', '权限分配', -1);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `role_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色，权限对照表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (13, 1, 1, 'admin');
INSERT INTO `sys_role_permission` VALUES (14, 1, 6, 'admin');
INSERT INTO `sys_role_permission` VALUES (15, 1, 2, 'admin');
INSERT INTO `sys_role_permission` VALUES (16, 1, 3, 'admin');
INSERT INTO `sys_role_permission` VALUES (17, 1, 4, 'admin');
INSERT INTO `sys_role_permission` VALUES (18, 1, 7, 'admin');

SET FOREIGN_KEY_CHECKS = 1;
