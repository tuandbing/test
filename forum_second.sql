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

 Date: 26/09/2024 15:17:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for forum_second
-- ----------------------------
DROP TABLE IF EXISTS `forum_second`;
CREATE TABLE `forum_second`  (
  `sec_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `main_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sec_sequence` int NOT NULL,
  `sec_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sec_creatuser` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sec_creatime` datetime NOT NULL,
  `sec_nickname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sec_resequence` int NOT NULL COMMENT '回复多少楼,默认回复主贴0,如果该值大于0那么会生成一个索引',
  `sec_delete` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '是否删除默认n未删除,删除是y,如果该值是y那么显示该楼层已被删除',
  `sec_reid` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '回复ID',
  `username` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sec_id`) USING BTREE,
  INDEX `sec_main_id_idx`(`main_id` ASC) USING BTREE,
  CONSTRAINT `sec_main_id` FOREIGN KEY (`main_id`) REFERENCES `forum_main` (`main_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_second
-- ----------------------------
INSERT INTO `forum_second` VALUES ('1b1afbad-6bc7-494d-a8bc-d21115caed84', 'f42729ca-ebab-48db-9fe5-579de25ab8e8', 0, '<p>的地方地方地方</p>', 'admin1', '2016-11-08 15:25:50', '于国良', 0, 'n', 'f42729ca-ebab-48db-9fe5-579de25ab8e8', 'admin1');
INSERT INTO `forum_second` VALUES ('27bc66f0-43a1-4982-823a-e4903aa55191', '8c6ba414-6c52-42f7-a2e4-7ea1a3357af1', 0, '<p>你好，官网页面更新变化快，有需要我们会协助大家远行下协及安装</p>', 'admin1', '2016-10-10 16:37:17', '于国良', 0, 'n', '8c6ba414-6c52-42f7-a2e4-7ea1a3357af1', 'admin1');
INSERT INTO `forum_second` VALUES ('36f3e568-00bd-488a-ad6e-50030a38d7a0', 'aa9eaf58-fa8c-4095-bdb3-01fadd8b83fd', 0, '<p>你好，读者，JDK官网更新速度快，你下载最新版就完全可以，没有任何问题。</p>', 'admin1', '2016-10-10 16:36:52', '于国良', 0, 'n', 'aa9eaf58-fa8c-4095-bdb3-01fadd8b83fd', 'admin1');
INSERT INTO `forum_second` VALUES ('3c9b2260-72c6-47b6-a404-7297620f6c57', '59c5318e-06cc-4ecc-b4e1-daf27339fc07', 2, '<p>选择对应于您下载的Eclipse版本的汉化包就可以。</p>', 'mrsoft', '2016-11-10 13:58:35', '明日科技', 0, 'n', '59c5318e-06cc-4ecc-b4e1-daf27339fc07', 'mrsoft');
INSERT INTO `forum_second` VALUES ('69056f30-cae3-4868-866f-281ccc8e1765', 'b61a76a9-f9e2-49d7-a0cc-86324051c8c3', 0, '<p>IIS和Apache都是使用的80端口，所以您可以先关闭IIS服务，再启动Apache服务。</p>', 'mingrisoft', '2016-11-17 13:32:10', '明日', 0, 'n', 'b61a76a9-f9e2-49d7-a0cc-86324051c8c3', 'mingrisoft');
INSERT INTO `forum_second` VALUES ('7deb01f8-a1a7-4037-8354-65672427e333', '59c5318e-06cc-4ecc-b4e1-daf27339fc07', 0, '<p>你好，书上用的是INDIGO版本，目前已没有书上的版本及对应的汉化包了，都需要下载官网的最新版就可以</p>', 'admin1', '2016-10-10 16:36:31', '于国良', 0, 'n', '59c5318e-06cc-4ecc-b4e1-daf27339fc07', 'admin1');
INSERT INTO `forum_second` VALUES ('8633f6dd-1586-4606-826c-7702e7e05bb3', '498cf08b-3fdd-4a86-898a-47fb56463aa8', 0, '<p>注意看返回值，返回的是一个class,这里得到的是一个对象，不是String</p>', 'admin1', '2016-10-10 16:10:51', '于国良', 0, 'n', '498cf08b-3fdd-4a86-898a-47fb56463aa8', 'admin1');
INSERT INTO `forum_second` VALUES ('a111b7e2-e7c3-4c7f-9118-e0835c8c2b85', '6eee1fd4-3ca6-46fb-ba4a-cda8efe450b3', 0, '<p>您需要购买</p>', 'mingrisoft', '2016-11-17 13:39:22', '明日', 0, 'n', '6eee1fd4-3ca6-46fb-ba4a-cda8efe450b3', 'mingrisoft');
INSERT INTO `forum_second` VALUES ('cb0aa97c-29c3-4427-8d8e-d8ec36045cd2', 'b90d6d9e-a31c-4609-9329-455e94ac5277', 0, '<p>aa是引用，指向内存实例对象</p>', 'admin1', '2016-10-10 16:17:35', '于国良', 0, 'n', 'b90d6d9e-a31c-4609-9329-455e94ac5277', 'admin1');
INSERT INTO `forum_second` VALUES ('d4a4e7ad-addb-4040-bc15-1aa48a8354a8', '8c6ba414-6c52-42f7-a2e4-7ea1a3357af1', 1, '<p>下载步骤相差不会太多，按提示一步一步操作就行。</p>', 'mrsoft', '2016-11-16 10:34:43', '明日科技', 0, 'n', '8c6ba414-6c52-42f7-a2e4-7ea1a3357af1', 'mrsoft');
INSERT INTO `forum_second` VALUES ('fccc3b7c-d479-4000-b408-69c6318680ac', '59c5318e-06cc-4ecc-b4e1-daf27339fc07', 1, '顶', 'mrsoft', '2016-11-10 13:46:21', '明日科技', 0, 'n', '59c5318e-06cc-4ecc-b4e1-daf27339fc07', 'mrsoft');

-- ----------------------------
-- Table structure for my_info
-- ----------------------------
DROP TABLE IF EXISTS `my_info`;
CREATE TABLE `my_info`  (
  `info_id` int NOT NULL AUTO_INCREMENT,
  `main_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `info_reply` int NOT NULL,
  `info_see` int NOT NULL,
  `info_lastuser` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `info_lastime` datetime NOT NULL,
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_info
-- ----------------------------
INSERT INTO `my_info` VALUES (112, 'd38e0ef6-017c-4f82-8014-cba76047e784', 0, 0, '127.0.0.1', '2016-09-02 02:57:59');
INSERT INTO `my_info` VALUES (113, 'e34b0b1e-d365-4663-a465-c854b3886fb0', 0, 0, '127.0.0.1', '2016-09-02 04:09:48');
INSERT INTO `my_info` VALUES (114, 'f7b0b6cb-d5d2-4eea-8efe-8eb364bb65ac', 0, 0, '127.0.0.1', '2016-09-07 04:16:03');
INSERT INTO `my_info` VALUES (116, 'fbfd5732-2f31-4aa0-970c-fadee7ab7fae', 0, 0, '127.0.0.1', '2016-09-07 04:19:15');
INSERT INTO `my_info` VALUES (117, '5746094f-acb0-428e-9afd-0ea0e48aa0dd', 0, 0, '127.0.0.1', '2016-09-20 01:05:36');
INSERT INTO `my_info` VALUES (119, '6c68a60f-45b9-4b32-b2b0-f38d8b7ffcf3', 0, 0, '127.0.0.1', '2016-10-18 04:14:47');
INSERT INTO `my_info` VALUES (120, '184ced3b-4c55-4d60-b87a-1105e1224ed3', 0, 0, '127.0.0.1', '2016-10-20 01:29:13');
INSERT INTO `my_info` VALUES (121, '72171787-7d7d-4ff2-b611-025830fe552a', 0, 0, '127.0.0.1', '2016-10-20 01:31:05');
INSERT INTO `my_info` VALUES (122, '3272f989-6523-49df-928a-f6214433f399', 0, 0, '127.0.0.1', '2016-10-20 01:32:03');
INSERT INTO `my_info` VALUES (123, '1471ed28-887d-461f-a161-7086b2502a08', 0, 0, '127.0.0.1', '2016-10-20 01:32:41');
INSERT INTO `my_info` VALUES (124, '3c25c6ea-ab72-4bfc-84c1-f005ac299a28', 0, 0, '127.0.0.1', '2016-11-04 03:52:34');
INSERT INTO `my_info` VALUES (125, 'e724407f-eef2-4e5f-ad47-e09398fbf8ba', 0, 0, '127.0.0.1', '2016-11-04 03:53:32');
INSERT INTO `my_info` VALUES (128, '6bba9a86-8738-4d7c-9442-3028a4dd1cca', 0, 0, '0:0:0:0:0:0:0:1', '2016-11-11 02:48:54');
INSERT INTO `my_info` VALUES (129, '6a2c9941-05cd-41a4-899f-69323a28c333', 0, 0, '0:0:0:0:0:0:0:1', '2016-11-18 04:10:26');

-- ----------------------------
-- Table structure for my_main
-- ----------------------------
DROP TABLE IF EXISTS `my_main`;
CREATE TABLE `my_main`  (
  `main_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `main_title` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `main_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `main_creatime` datetime NOT NULL,
  `main_creatuser` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `main_commend` int NOT NULL,
  PRIMARY KEY (`main_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_main
-- ----------------------------
INSERT INTO `my_main` VALUES ('1471ed28-887d-461f-a161-7086b2502a08', 'cc', '<p>ccc</p>', '2016-10-20 01:32:41', '127.0.0.1', 0);
INSERT INTO `my_main` VALUES ('184ced3b-4c55-4d60-b87a-1105e1224ed3', 'ccxx', '<p>ccxx</p>', '2016-10-20 01:29:13', '127.0.0.1', 0);
INSERT INTO `my_main` VALUES ('3272f989-6523-49df-928a-f6214433f399', 'ss', '<p>ss</p>', '2016-10-20 01:32:03', '127.0.0.1', 0);
INSERT INTO `my_main` VALUES ('3c25c6ea-ab72-4bfc-84c1-f005ac299a28', '简单的Java语句', '<pre class=\"brush:java;toolbar:false\"></pre>@Resource(name=&quot;dataSourceDDS&quot;)<br/>	DataSource dataSource;<br/>	<br/><br/>	@Bean<br/>	public JdbcTemplate jdbcTemplate (){<br/>		<br/>		return new JdbcTemplate(dataSource);<br/>	}<br/>	<br/>	@Bean(name=&quot;simpleDateFormat&quot;)<br/>	public SimpleDateFormat simpleDateFormat(){<br/>		return new SimpleDateFormat(&quot;yyyy-MM-dd&quot;);<br/>	}<br/>	<p><br/></p>', '2016-11-04 03:52:34', '127.0.0.1', 0);
INSERT INTO `my_main` VALUES ('5746094f-acb0-428e-9afd-0ea0e48aa0dd', '测试主贴Test02', '<p>dddddddddd</p>', '2016-09-20 01:05:36', '127.0.0.1', 0);
INSERT INTO `my_main` VALUES ('6a2c9941-05cd-41a4-899f-69323a28c333', '测试2016-11-18', '<p>测试内容2016-11-18</p>', '2016-11-18 04:10:26', '0:0:0:0:0:0:0:1', 0);
INSERT INTO `my_main` VALUES ('6bba9a86-8738-4d7c-9442-3028a4dd1cca', '关于JDK的问题', '<p>测试一个发帖</p>', '2016-11-11 02:48:54', '0:0:0:0:0:0:0:1', 0);
INSERT INTO `my_main` VALUES ('6c68a60f-45b9-4b32-b2b0-f38d8b7ffcf3', 'ss', '<p>ss<br/></p>', '2016-10-18 04:14:47', '127.0.0.1', 0);
INSERT INTO `my_main` VALUES ('72171787-7d7d-4ff2-b611-025830fe552a', 'dd', '<p>ddd</p>', '2016-10-20 01:31:05', '127.0.0.1', 0);
INSERT INTO `my_main` VALUES ('e09ff834-1f49-4ccb-a947-248c72ee5219', '', '<p><img src=\"http://127.0.0.1:8080/mrbbs_test/ueditor/jsp/upload/image/20161111/1478834376243002792.png\" title=\"1478834376243002792.png\" alt=\"ico_144_144a.png\"/>ghghgh</p>', '2016-11-11 11:19:38', '0:0:0:0:0:0:0:1', 0);
INSERT INTO `my_main` VALUES ('e724407f-eef2-4e5f-ad47-e09398fbf8ba', 'Spring 编程范式配置', '<pre class=\"brush:java;toolbar:false\">@Resource(name=&quot;dataSourceDDS&quot;)\r\n	DataSource&nbsp;dataSource;\r\n	\r\n\r\n	@Bean\r\n	public&nbsp;JdbcTemplate&nbsp;jdbcTemplate&nbsp;(){\r\n		\r\n		return&nbsp;new&nbsp;JdbcTemplate(dataSource);\r\n	}\r\n	\r\n	@Bean(name=&quot;simpleDateFormat&quot;)\r\n	public&nbsp;SimpleDateFormat&nbsp;simpleDateFormat(){\r\n		return&nbsp;new&nbsp;SimpleDateFormat(&quot;yyyy-MM-dd&quot;);\r\n	}\r\n	</pre><p><br/></p>', '2016-11-04 03:53:32', '127.0.0.1', 0);
INSERT INTO `my_main` VALUES ('f7b0b6cb-d5d2-4eea-8efe-8eb364bb65ac', '测试主贴Test01', '<pre class=\"brush:java;toolbar:false\">public&nbsp;void&nbsp;main&nbsp;(String&nbsp;args[]){\r\n&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(&quot;Hello&nbsp;BBS&quot;);\r\n}</pre><p><br/></p>', '2016-09-07 04:16:03', '127.0.0.1', 0);

-- ----------------------------
-- Table structure for my_second
-- ----------------------------
DROP TABLE IF EXISTS `my_second`;
CREATE TABLE `my_second`  (
  `sec_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `main_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sec_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sec_creatime` datetime NOT NULL,
  `sec_creatuser` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sec_sequence` int NOT NULL,
  PRIMARY KEY (`sec_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_second
-- ----------------------------
INSERT INTO `my_second` VALUES ('020af5e7-d979-4a54-b635-b59c28dc3ed9', 'e724407f-eef2-4e5f-ad47-e09398fbf8ba', '<p>楼主好棒！！！！顶顶顶！！！<br/></p>', '2016-11-04 15:55:47', '127.0.0.1', 1);
INSERT INTO `my_second` VALUES ('050faf5c-a369-4c4a-a854-9692f3a5ba7d', '184ced3b-4c55-4d60-b87a-1105e1224ed3', '<p>三十三岁是是是试试</p>', '2016-11-11 16:24:06', '0:0:0:0:0:0:0:1', 1);
INSERT INTO `my_second` VALUES ('0efed73b-469e-44dc-98cd-59d135eb0177', '5746094f-acb0-428e-9afd-0ea0e48aa0dd', '<p>44444</p>', '2016-11-19 13:09:49', '0:0:0:0:0:0:0:1', 1);
INSERT INTO `my_second` VALUES ('0fb9f086-decf-4b40-8267-9ed6a5754dbd', '1471ed28-887d-461f-a161-7086b2502a08', '<p>cccccccc</p>', '2016-10-20 13:32:47', '127.0.0.1', 1);
INSERT INTO `my_second` VALUES ('2d9db840-f231-4822-bc47-c4097912f2f6', '5746094f-acb0-428e-9afd-0ea0e48aa0dd', '<p>33333</p>', '2016-11-19 13:09:43', '0:0:0:0:0:0:0:1', 1);
INSERT INTO `my_second` VALUES ('4b860a59-4e5c-4002-9acd-4b9b74565b9b', '', '<p>三十三岁试试试试试试试试</p>', '2016-11-11 16:22:28', '0:0:0:0:0:0:0:1', 1);
INSERT INTO `my_second` VALUES ('5bd21be4-2021-4342-a67a-ee5008b5c5ca', 'f7b0b6cb-d5d2-4eea-8efe-8eb364bb65ac', '<p>测试跟帖test001<br/></p>', '2016-09-07 18:44:30', '127.0.0.1', 1);
INSERT INTO `my_second` VALUES ('8e8f11dc-3f9e-41d6-999b-f4699a29c06c', '', '<p>赳赳武夫一</p>', '2016-11-11 16:13:11', '0:0:0:0:0:0:0:1', 1);
INSERT INTO `my_second` VALUES ('9934d7ea-f5b8-4f9b-a3cb-2b4c58b8bff1', '5746094f-acb0-428e-9afd-0ea0e48aa0dd', '<p>dddddddddddddddddddddddd</p>', '2016-10-18 16:18:19', '127.0.0.1', 1);
INSERT INTO `my_second` VALUES ('99dd59ba-4a61-441f-b3dc-8b5900016f30', '5746094f-acb0-428e-9afd-0ea0e48aa0dd', '<p>22222</p>', '2016-11-19 13:09:37', '0:0:0:0:0:0:0:1', 1);
INSERT INTO `my_second` VALUES ('a2cce586-a965-422e-8765-e7294ec4fcac', '6a2c9941-05cd-41a4-899f-69323a28c333', '<p>回复帖子2016-11-18</p>', '2016-11-18 16:11:15', '0:0:0:0:0:0:0:1', 1);
INSERT INTO `my_second` VALUES ('abc942f9-7ba6-4fd0-a9d9-9aefa00b4ab1', '', '<p>jk</p>', '2016-11-11 16:19:54', '0:0:0:0:0:0:0:1', 1);
INSERT INTO `my_second` VALUES ('f7da7cc0-d98c-411b-abf4-adca38847349', '', '<p>旧旧jk</p>', '2016-11-11 16:19:31', '0:0:0:0:0:0:0:1', 1);

-- ----------------------------
-- Table structure for sys_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_login`;
CREATE TABLE `sys_login`  (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `wxname` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`login_id`) USING BTREE,
  UNIQUE INDEX `username_UNIQUE`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '登录信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login
-- ----------------------------
INSERT INTO `sys_login` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '1', '于国良');
INSERT INTO `sys_login` VALUES (4, 'admin1', '21232f297a57a5a743894a0e4a801fc3', NULL, '于国良');
INSERT INTO `sys_login` VALUES (5, 'admin2', '21232f297a57a5a743894a0e4a801fc3', NULL, '于国良');
INSERT INTO `sys_login` VALUES (6, 'admin3', '21232f297a57a5a743894a0e4a801fc3', NULL, '于国良');
INSERT INTO `sys_login` VALUES (9, 'wowowowo1', 'wowowowo1', 'ww.d.com', '于国良');
INSERT INTO `sys_login` VALUES (10, 'admin1111111111111', 'a4cd5336c221f502d58db914176803de', '80303857@qq.com', '于国良');
INSERT INTO `sys_login` VALUES (11, 'admin123456', '4aa40bbb89a90e0596efe94492bb75d9', '80303857@qq.com', '于国良');
INSERT INTO `sys_login` VALUES (12, 'eeeeeeeeeeeeeeeeeee', 'fa979dc5558ca5c885015a28cde96934', 'eee@qq.com', '于国良');
INSERT INTO `sys_login` VALUES (13, 'ssssssssssssssss', '16fcb1091f8a0cc70c96e2ff97fdd213', 'ssssssss@qq.com', '于国良');
INSERT INTO `sys_login` VALUES (14, 'dd4d54d64d56', 'aa104ca5cac492b9590eadc61434c96f', '80303857@qq.com', '于国良');
INSERT INTO `sys_login` VALUES (15, 'ddxxccc111', '6161ca39d753103c23c785ad98be1b4d', 'dd@qq.com', '于国良');
INSERT INTO `sys_login` VALUES (16, 'ddddd3333', '54ee1aad7dacbd6f09600edc582061c0', '80303857@qq.com', '于国良');
INSERT INTO `sys_login` VALUES (17, '444eee', 'cd87cd5ef753a06ee79fc75dc7cfe66c', 'eee@qq.com', '于国良');
INSERT INTO `sys_login` VALUES (18, 'ttxn74567', '79f0dfe4577224a01852eeab6d430ebd', 'ttxn7456@sina.com', '于国良');
INSERT INTO `sys_login` VALUES (19, 'adminss0123', '1eea36fbd4f4919251e3192dce2da380', '80303857@qq.com', '于国良');
INSERT INTO `sys_login` VALUES (21, 'administrator', '200ceb26807d6bf99fd6f4f0d1ca54d4', '80303857@qq.com', '于国良');
INSERT INTO `sys_login` VALUES (22, 'adminyuguo21', '21232f297a57a5a743894a0e4a801fc3', '80303857@qq.com', '于国良');
INSERT INTO `sys_login` VALUES (23, 'aa123456aa', '8a6f2805b4515ac12058e79e66539be9', '80303857@qq.com', 'aa123456');
INSERT INTO `sys_login` VALUES (24, 'aaxxss', 'e10adc3949ba59abbe56e057f20f883e', 'aa123456@qq.com', 'ss');
INSERT INTO `sys_login` VALUES (25, 'aa789456', '21232f297a57a5a743894a0e4a801fc3', 'aaa@qq.com', 'aa123456');
INSERT INTO `sys_login` VALUES (26, '请叫我大王', 'e10adc3949ba59abbe56e057f20f883e', '893808512@qq.com', '请叫我大王');
INSERT INTO `sys_login` VALUES (27, '111111', '96e79218965eb72c92a549dd5a330112', '111111@111.com', '111111');
INSERT INTO `sys_login` VALUES (28, 'qqqqqqq', '02a05c6e278d3e19afaca4f3f7cf47d9', 'aaaaa@qq.com', 'aaa');
INSERT INTO `sys_login` VALUES (29, 'admingogo', '21232f297a57a5a743894a0e4a801fc3', '80303857@qq.com', '小白');
INSERT INTO `sys_login` VALUES (30, 'aaaaaa', '343b1c4a3ea721b2d640fc8700db0f36', '59898@qq.com', 'aqaqaqa');
INSERT INTO `sys_login` VALUES (31, 'adminis124', 'e00cf25ad42683b3df678c61f42c6bda', '8080@qq.com', '123123');
INSERT INTO `sys_login` VALUES (32, 'adminis11', 'e00cf25ad42683b3df678c61f42c6bda', '80303857@qq.com', '123');
INSERT INTO `sys_login` VALUES (33, 'mr', 'fdb390e945559e74475ed8c8bbb48ca5', 'mingrisoft@mingrisoft.com', '明日科技');
INSERT INTO `sys_login` VALUES (34, 'mingrisoft', 'fdb390e945559e74475ed8c8bbb48ca5', 'mingrisoft@mingrisoft.com', '明日');

SET FOREIGN_KEY_CHECKS = 1;
