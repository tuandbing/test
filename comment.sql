/*
 Navicat Premium Data Transfer

 Source Server         : mantou
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 26/09/2024 15:16:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NULL DEFAULT NULL,
  `comment` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 'good');

-- ----------------------------
-- Table structure for hangle
-- ----------------------------
DROP TABLE IF EXISTS `hangle`;
CREATE TABLE `hangle`  (
  `id` int NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `firm` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `consumer` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ship` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `delivery` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `logistic` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hangle
-- ----------------------------
INSERT INTO `hangle` VALUES (1, 'zhangsan', '123', '123', '123', '213', '123');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `id` int NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `zindex` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES (1, 'zhangsan', '123', '123', '123');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pid` int NULL DEFAULT NULL,
  `zindex` int NULL DEFAULT NULL,
  `istype` int NULL DEFAULT NULL,
  `descpt` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `icon` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `page` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `insert_time` date NULL DEFAULT NULL,
  `update_time` date NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'zhangsan', 123, 123, 123, '123', '213', '123', '123', '2018-11-13', '2018-11-13');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `permise` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'zhangsan', '213', 123, '2018-11-14 16:33:19', '123');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int NULL DEFAULT NULL,
  `role_name` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `descpt` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `code` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `insert_uid` int NULL DEFAULT NULL,
  `insert_time` date NULL DEFAULT NULL,
  `update_time` date NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'zhangsan', '123', '123', 123, '2018-10-31', '2018-11-14');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `last_login_time` date NULL DEFAULT NULL,
  `last_login_ip` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mobile` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'zhangsan', '123', '2018-12-01', '213', '123', '213');

-- ----------------------------
-- Table structure for wct_blog
-- ----------------------------
DROP TABLE IF EXISTS `wct_blog`;
CREATE TABLE `wct_blog`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标题',
  `note` varchar(5000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '内容',
  `ndate` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '日期',
  `btype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '大分类',
  `img` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片',
  `video` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '视频附件',
  `typeid` int NULL DEFAULT NULL COMMENT '分类id',
  `typecn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `uid` int NULL DEFAULT NULL COMMENT '发布者id',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '发布者姓名',
  `favcount` int NULL DEFAULT NULL COMMENT '收藏次数',
  `zan` int NULL DEFAULT 1 COMMENT '点赞次数',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地址',
  `cai` int NULL DEFAULT NULL COMMENT '踩次数',
  `fenxiang` int NULL DEFAULT NULL COMMENT '分享次数',
  `statecn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '状态',
  `latitude` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '纬度(备用)',
  `longitude` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '经度(备用)',
  `city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `qid` int NULL DEFAULT NULL,
  `qtitle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wct_blog
-- ----------------------------
INSERT INTO `wct_blog` VALUES (12, '测试发帖交流', '<p>详细的内容</p><p><img src=\"http://localhost:8088/upload/4ce2c53a-a076-47aa-8e70-2f2c7435c445.jpeg\" alt=\"图片\"></p>', '2024-03-15 23:20:25', '', '5d124c33-9f11-41d2-96f8-287547f838a9.jpeg', '', NULL, '', 57, 'user1', 1, 2, '', NULL, NULL, '', '', '', '', NULL, '');
INSERT INTO `wct_blog` VALUES (13, '一起走走吧', '<p><img src=\"http://localhost:8088/upload/62c7544a-1152-49fe-b690-f2fcc4f1ca58.jpeg\" alt=\"图片\"></p>', '2024-03-15 23:21:23', '', '363b7dda-7cb3-419d-9f53-b578036a703a.jpg', '', NULL, '', 51, 'ideabobo', NULL, 1, '', NULL, NULL, '', '', '', '', NULL, '');
INSERT INTO `wct_blog` VALUES (14, '可以发帖交流', '<p>详细的发帖交流信息</p>', '2024-03-20 19:37:23', '', '', '', NULL, '', 57, 'user1', NULL, 1, '', NULL, NULL, '', '', '', '', NULL, '');

-- ----------------------------
-- Table structure for wct_huihua
-- ----------------------------
DROP TABLE IF EXISTS `wct_huihua`;
CREATE TABLE `wct_huihua`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL COMMENT '发送者id',
  `fid` int NULL DEFAULT NULL COMMENT '接收者id',
  `qid` int NULL DEFAULT NULL COMMENT '群id',
  `type` int NULL DEFAULT NULL COMMENT '类型',
  `zan` int NULL DEFAULT 0,
  `note` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ndate` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '发送者名称',
  `fusername` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '接收者名称',
  `attach` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `attachname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '附件名称',
  `img` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片',
  `qtitle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `msgtype` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wct_huihua
-- ----------------------------
INSERT INTO `wct_huihua` VALUES (1, 51, 54, NULL, 1, NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">你好</div>', '2024-03-20 10:35:20', 'ideabobo', 'xiaoxiaohua', '', '', '0f5ac0e1-20e0-4f14-97d2-4168a964f2de.jpeg', '', NULL);
INSERT INTO `wct_huihua` VALUES (2, 54, 51, NULL, NULL, NULL, '你好,这个是我的,我提交扔了ing啊把', '2024-03-20 18:51:20', 'xiaoxiaohua', 'ideabobo', '', '', '3da7057c-12b0-4c28-820e-f28ebbff79a4.png', '', NULL);
INSERT INTO `wct_huihua` VALUES (3, 54, 51, NULL, 1, NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">你好</div>', '2024-03-20 10:35:20', 'xiaoxiaohua', 'ideabobo', '', '', '3da7057c-12b0-4c28-820e-f28ebbff79a4.png', '', 1);
INSERT INTO `wct_huihua` VALUES (4, 57, 54, NULL, 1, NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img width=\"32rpx\" src=\"https://zhoukaiwen.com/img/icon/emojj1/2.png\"></div>', '2024-03-20 12:38:25', 'user1', 'xiaoxiaohua', '', '', '0f5ac0e1-20e0-4f14-97d2-4168a964f2de.jpeg', '', 1);
INSERT INTO `wct_huihua` VALUES (5, 54, 57, NULL, 1, NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img width=\"32rpx\" src=\"https://zhoukaiwen.com/img/icon/emojj1/2.png\"></div>', '2024-03-20 12:38:25', 'xiaoxiaohua', 'user1', '', '', 'f5486b1a-6754-4a60-bf59-787c70721ff9.jpeg', '', 1);
INSERT INTO `wct_huihua` VALUES (6, 58, 57, NULL, 1, NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">这里可以聊天</div>', '2024-03-20 11:40:33', 'testuser', 'user1', '', '', 'f5486b1a-6754-4a60-bf59-787c70721ff9.jpeg', '', 1);
INSERT INTO `wct_huihua` VALUES (7, 57, 58, NULL, 1, NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">这里可以聊天</div>', '2024-03-20 11:40:33', 'user1', 'testuser', '', '', '59d58028-e1e7-4bfd-8e47-de1dc965c125.jpg', '', 1);
INSERT INTO `wct_huihua` VALUES (8, 52, 57, NULL, 1, NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">你好,可以聊天</div>', '2024-03-20 08:59:08', 'xiaomei', 'user1', '', '', 'f5486b1a-6754-4a60-bf59-787c70721ff9.jpeg', '', 1);
INSERT INTO `wct_huihua` VALUES (9, 57, 52, NULL, 0, NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">你好,可以聊天</div>', '2024-03-20 19:34:26', 'user1', 'xiaomei', '', '', 'f6b1a6ce-1f54-49e7-ac8a-3d9160b06b4e.jpeg', '', 1);
INSERT INTO `wct_huihua` VALUES (10, 51, 57, NULL, 1, NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">如果有啥情况还可以举报</div>', '2024-03-20 19:36:17', 'ideabobo', 'user1', '', '', 'f5486b1a-6754-4a60-bf59-787c70721ff9.jpeg', '', 1);
INSERT INTO `wct_huihua` VALUES (11, 57, 51, NULL, 1, NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">如果有啥情况还可以举报</div>', '2024-03-20 19:36:17', 'user1', 'ideabobo', '', '', '3da7057c-12b0-4c28-820e-f28ebbff79a4.png', '', 1);

-- ----------------------------
-- Table structure for wct_message
-- ----------------------------
DROP TABLE IF EXISTS `wct_message`;
CREATE TABLE `wct_message`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL COMMENT '用户id',
  `fid` int NULL DEFAULT NULL COMMENT '朋友id',
  `qid` int NULL DEFAULT NULL COMMENT '群id',
  `type` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '消息类型',
  `zan` int NULL DEFAULT 0,
  `note` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ndate` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '发送者名称',
  `fusername` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '朋友名称',
  `attach` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '附件文件',
  `attachname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `img` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片',
  `qtitle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `msgtype` int NULL DEFAULT NULL,
  `fimg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wct_message
-- ----------------------------
INSERT INTO `wct_message` VALUES (16, 54, 51, NULL, 'text', NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">你好</div>', '2024-03-20 10:35:20', 'xiaoxiaohua', 'ideabobo', '', '', '0f5ac0e1-20e0-4f14-97d2-4168a964f2de.jpeg', '', 1, '3da7057c-12b0-4c28-820e-f28ebbff79a4.png');
INSERT INTO `wct_message` VALUES (17, 57, 54, NULL, 'text', NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">您好,这个书好像是我的</div>', '2024-03-20 12:36:33', 'user1', 'xiaoxiaohua', '', '', 'f5486b1a-6754-4a60-bf59-787c70721ff9.jpeg', '', 1, '0f5ac0e1-20e0-4f14-97d2-4168a964f2de.jpeg');
INSERT INTO `wct_message` VALUES (18, 57, 54, NULL, 'text', NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">这儿可以和发布者聊天,交流确定,也可以直接在下面留言交流</div>', '2024-03-20 12:36:52', 'user1', 'xiaoxiaohua', '', '', 'f5486b1a-6754-4a60-bf59-787c70721ff9.jpeg', '', 1, '0f5ac0e1-20e0-4f14-97d2-4168a964f2de.jpeg');
INSERT INTO `wct_message` VALUES (19, 57, 54, NULL, 'text', NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img width=\"32rpx\" src=\"https://zhoukaiwen.com/img/icon/emojj1/3.png\"><img width=\"32rpx\" src=\"https://zhoukaiwen.com/img/icon/emojj1/4.png\"><img width=\"32rpx\" src=\"https://zhoukaiwen.com/img/icon/emojj1/4.png\"></div>', '2024-03-20 12:36:54', 'user1', 'xiaoxiaohua', '', '', 'f5486b1a-6754-4a60-bf59-787c70721ff9.jpeg', '', 1, '0f5ac0e1-20e0-4f14-97d2-4168a964f2de.jpeg');
INSERT INTO `wct_message` VALUES (20, 54, 57, NULL, 'text', NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">好的,以处理,来找我拿吧</div>', '2024-03-20 12:38:21', 'xiaoxiaohua', 'user1', '', '', '0f5ac0e1-20e0-4f14-97d2-4168a964f2de.jpeg', '', 1, 'f5486b1a-6754-4a60-bf59-787c70721ff9.jpeg');
INSERT INTO `wct_message` VALUES (21, 54, 57, NULL, 'text', NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img width=\"32rpx\" src=\"https://zhoukaiwen.com/img/icon/emojj1/2.png\"></div>', '2024-03-20 12:38:25', 'xiaoxiaohua', 'user1', '', '', '0f5ac0e1-20e0-4f14-97d2-4168a964f2de.jpeg', '', 1, 'f5486b1a-6754-4a60-bf59-787c70721ff9.jpeg');
INSERT INTO `wct_message` VALUES (22, 58, 57, NULL, 'text', NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">可以和发布者聊天,然后点击认领</div>', '2024-03-20 11:40:28', 'testuser', 'user1', '', '', '59d58028-e1e7-4bfd-8e47-de1dc965c125.jpg', '', 1, 'f5486b1a-6754-4a60-bf59-787c70721ff9.jpeg');
INSERT INTO `wct_message` VALUES (23, 58, 57, NULL, 'text', NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">这里可以聊天</div>', '2024-03-20 11:40:33', 'testuser', 'user1', '', '', '59d58028-e1e7-4bfd-8e47-de1dc965c125.jpg', '', 1, 'f5486b1a-6754-4a60-bf59-787c70721ff9.jpeg');
INSERT INTO `wct_message` VALUES (24, 52, 57, NULL, 'text', NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">你好,可以聊天</div>', '2024-03-20 08:59:08', 'xiaomei', 'user1', '', '', 'f6b1a6ce-1f54-49e7-ac8a-3d9160b06b4e.jpeg', '', 1, 'f5486b1a-6754-4a60-bf59-787c70721ff9.jpeg');
INSERT INTO `wct_message` VALUES (25, 51, 57, NULL, 'text', NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">可以和对方聊天沟通</div>', '2024-03-20 19:36:10', 'ideabobo', 'user1', '', '', '3da7057c-12b0-4c28-820e-f28ebbff79a4.png', '', 1, 'f5486b1a-6754-4a60-bf59-787c70721ff9.jpeg');
INSERT INTO `wct_message` VALUES (26, 51, 57, NULL, 'text', NULL, '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">如果有啥情况还可以举报</div>', '2024-03-20 19:36:17', 'ideabobo', 'user1', '', '', '3da7057c-12b0-4c28-820e-f28ebbff79a4.png', '', 1, 'f5486b1a-6754-4a60-bf59-787c70721ff9.jpeg');

-- ----------------------------
-- Table structure for wct_notice
-- ----------------------------
DROP TABLE IF EXISTS `wct_notice`;
CREATE TABLE `wct_notice`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `note` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ndate` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `img` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wct_notice
-- ----------------------------
INSERT INTO `wct_notice` VALUES (8, '测试公告', '<p>自己详细编辑公告内容</p><p><img src=\"upload/89cc0f1b-8284-4c79-be45-1dcbce087ed6.jpg\" style=\"max-width:100%;\"/><br/></p><p><img src=\"upload/f5477f65-6682-48f3-bd64-11ae4c557451.jpg\" style=\"max-width:100%;\"/><br/></p><p>自己管理公告资讯啥的</p>', '2024-03-20 12:42:58', '1', 'd884007e-638d-4ba9-8bf3-a92b9c287884.png');
INSERT INTO `wct_notice` VALUES (9, '发布一些广告资讯', '<p><br/></p><p><img src=\"upload/57151d2a-633a-453a-9778-fd2ef5d68f57.jpg\" style=\"max-width:100%;\"/><br/></p><p><img src=\"upload/f4623fc4-c503-48f5-a47c-001d29aed281.jpg\" style=\"max-width:100%;\"/><br/></p><p>配图配视频都可以,我这里演示功能图片都是随意传的</p><p><img src=\"upload/63b8d4f337fb5.jpg\" style=\"max-width:100%;\"/><br/></p>', '2024-03-20 12:31:16', '1', '3532e4cd-eda3-418e-a907-24240fe44822.jpg');

SET FOREIGN_KEY_CHECKS = 1;
