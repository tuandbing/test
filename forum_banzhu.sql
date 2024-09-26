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

 Date: 26/09/2024 15:17:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for forum_banzhu
-- ----------------------------
DROP TABLE IF EXISTS `forum_banzhu`;
CREATE TABLE `forum_banzhu`  (
  `banzhu_id` int NOT NULL AUTO_INCREMENT,
  `main_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `creatime` datetime NOT NULL,
  `creatuser` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`banzhu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '版主版块对照表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_banzhu
-- ----------------------------
INSERT INTO `forum_banzhu` VALUES (1, 'javase', 'admin1', '2016-07-05 00:00:00', 'admin1');

-- ----------------------------
-- Table structure for forum_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `forum_dictionary`;
CREATE TABLE `forum_dictionary`  (
  `dict_id` int NOT NULL AUTO_INCREMENT,
  `dict_group` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `dict_key` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `dict_value` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `dict_parent` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `dict_order` int NULL DEFAULT NULL,
  `dict_isleaf` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_dictionary
-- ----------------------------
INSERT INTO `forum_dictionary` VALUES (1, 'dict', '0', '数据字典', '0', 0, NULL);
INSERT INTO `forum_dictionary` VALUES (2, 'forumType', 'forumType', '论坛主版块', '1', 1, 'n');
INSERT INTO `forum_dictionary` VALUES (3, 'forumType', 'forumJava', 'Java专区', '2', 2, 'n');
INSERT INTO `forum_dictionary` VALUES (4, 'forumType', 'forumDB', '数据库专区', '2', 3, 'n');
INSERT INTO `forum_dictionary` VALUES (5, 'java', 'javase', 'Java SE 专区版块', '3', 4, 'y');
INSERT INTO `forum_dictionary` VALUES (6, 'database', 'mysql', 'MySQL', '4', 5, 'y');
INSERT INTO `forum_dictionary` VALUES (7, 'java', 'php', 'PHP 专区版块', '3', 6, 'y');
INSERT INTO `forum_dictionary` VALUES (8, 'java', 'net', '.Net 专区版块', '3', 7, 'y');
INSERT INTO `forum_dictionary` VALUES (9, 'java', 'jsp', 'JSP技术专区', '3', 8, 'y');
INSERT INTO `forum_dictionary` VALUES (10, 'fenlei', 'default', '默认', '0', 1, 'y');
INSERT INTO `forum_dictionary` VALUES (11, 'fenlei', 'xinjishu', '新技术', '0', 2, 'y');
INSERT INTO `forum_dictionary` VALUES (12, 'fenlei', 'xinqingtucao', '心情吐槽', '0', 3, 'y');
INSERT INTO `forum_dictionary` VALUES (13, 'feilei', 'jishujianjie', '趋势分析', '0', 4, 'y');
INSERT INTO `forum_dictionary` VALUES (14, 'fenlei', 'jishutuijian', '技术推荐', '0', 5, 'y');

-- ----------------------------
-- Table structure for forum_info
-- ----------------------------
DROP TABLE IF EXISTS `forum_info`;
CREATE TABLE `forum_info`  (
  `info_id` int NOT NULL AUTO_INCREMENT,
  `info_reply` int NOT NULL COMMENT '回复数量',
  `info_see` int NOT NULL COMMENT '查看数',
  `info_lastuser` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '最后回复',
  `info_lastime` datetime NOT NULL COMMENT '最后回复时间',
  `main_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `info_main_id_idx`(`main_id` ASC) USING BTREE,
  CONSTRAINT `info_main_id` FOREIGN KEY (`main_id`) REFERENCES `forum_main` (`main_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '记录帖子的一些常用状态.' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_info
-- ----------------------------
INSERT INTO `forum_info` VALUES (55, 0, 0, '于国良', '2016-10-10 15:59:08', '874a3c5e-a7c1-4c40-8699-6ebf780250b3');
INSERT INTO `forum_info` VALUES (56, 1, 0, '于国良', '2016-10-10 16:10:51', '498cf08b-3fdd-4a86-898a-47fb56463aa8');
INSERT INTO `forum_info` VALUES (57, 0, 0, '于国良', '2016-10-10 16:15:23', 'c8eb9513-1ebc-4f11-baf5-556cc20ca1c4');
INSERT INTO `forum_info` VALUES (58, 1, 0, '于国良', '2016-10-10 16:17:35', 'b90d6d9e-a31c-4609-9329-455e94ac5277');
INSERT INTO `forum_info` VALUES (59, 0, 0, '于国良', '2016-10-10 16:19:57', '8d0f8371-e384-4d7e-8858-657b4cf1d88b');
INSERT INTO `forum_info` VALUES (60, 1, 0, '明日', '2016-11-17 13:39:22', '6eee1fd4-3ca6-46fb-ba4a-cda8efe450b3');
INSERT INTO `forum_info` VALUES (61, 0, 0, '于国良', '2016-10-10 16:25:05', '19eb01fc-60d4-4fbe-ba86-beef18229754');
INSERT INTO `forum_info` VALUES (62, 0, 0, '于国良', '2016-10-10 16:25:58', 'b60a407b-4c32-4472-9011-06b8f62b8fed');
INSERT INTO `forum_info` VALUES (63, 0, 0, '于国良', '2016-10-10 16:26:49', '00f8fbcc-10ae-4c03-bab8-a90a0c1253d6');
INSERT INTO `forum_info` VALUES (64, 0, 0, '于国良', '2016-10-10 16:27:48', '417bc4c6-11f7-4f8a-9352-5e0b69815c95');
INSERT INTO `forum_info` VALUES (65, 0, 0, '于国良', '2016-10-10 16:33:06', 'd32b060e-128e-420f-b33d-6fc09a1c41b9');
INSERT INTO `forum_info` VALUES (66, 0, 0, '于国良', '2016-10-10 16:34:48', 'f5645146-a783-45f4-b3a4-8ceb2676a41d');
INSERT INTO `forum_info` VALUES (67, 1, 0, '于国良', '2016-10-10 16:36:52', 'aa9eaf58-fa8c-4095-bdb3-01fadd8b83fd');
INSERT INTO `forum_info` VALUES (68, 2, 0, '明日科技', '2016-11-16 10:34:43', '8c6ba414-6c52-42f7-a2e4-7ea1a3357af1');
INSERT INTO `forum_info` VALUES (69, 3, 0, '明日科技', '2016-11-10 13:58:35', '59c5318e-06cc-4ecc-b4e1-daf27339fc07');
INSERT INTO `forum_info` VALUES (70, 0, 0, '于国良', '2016-10-10 16:41:09', 'a3b24a4e-1457-4374-b8a1-f075724f55db');
INSERT INTO `forum_info` VALUES (71, 0, 0, '于国良', '2016-10-31 09:28:23', '030c72c0-b685-4e4e-994d-2f86a456b7f5');
INSERT INTO `forum_info` VALUES (72, 0, 0, '于国良', '2016-11-08 15:21:38', '50ab643b-f7db-4c8b-8f88-0006bb290bd4');
INSERT INTO `forum_info` VALUES (73, 1, 0, '于国良', '2016-11-08 15:25:50', 'f42729ca-ebab-48db-9fe5-579de25ab8e8');
INSERT INTO `forum_info` VALUES (74, 0, 0, '于国良', '2016-11-09 13:46:14', '64e59ecb-8de4-4822-b72b-710e4945805b');
INSERT INTO `forum_info` VALUES (75, 0, 0, '于国良', '2016-11-09 13:46:24', '277d0d20-8059-4958-b19e-83736c0e70dc');
INSERT INTO `forum_info` VALUES (76, 0, 0, '明日科技', '2016-11-10 13:14:52', '026c7111-8904-4245-b9a4-d1f949a91097');
INSERT INTO `forum_info` VALUES (77, 1, 0, '明日', '2016-11-17 13:32:10', 'b61a76a9-f9e2-49d7-a0cc-86324051c8c3');
INSERT INTO `forum_info` VALUES (78, 0, 0, '明日', '2016-11-17 13:40:17', '89753acb-6cb0-42e7-a0c7-06c1e86d1781');

-- ----------------------------
-- Table structure for forum_main
-- ----------------------------
DROP TABLE IF EXISTS `forum_main`;
CREATE TABLE `forum_main`  (
  `main_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `main_title` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `main_flag` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'main_flag  这是一个标记,记录用户发布在哪个论坛区.',
  `main_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'main_type 记录用户发表在论坛区的哪个栏目下',
  `main_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '内容',
  `main_creatime` datetime NOT NULL COMMENT '创建时间',
  `main_creatuser` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `main_recommend` int NOT NULL COMMENT '精华帖,int类型,精华帖分类型.',
  `main_delete` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '是不是被删除的帖子.删除的帖子为y,正常为n',
  `main_nickname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `main_zan` int NULL DEFAULT NULL,
  PRIMARY KEY (`main_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '论坛主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_main
-- ----------------------------
INSERT INTO `forum_main` VALUES ('00f8fbcc-10ae-4c03-bab8-a90a0c1253d6', '学习路线图资源下载', 'jishutuijian', 'php', '<p>PHP项目开发案例分析视频及源码资源</p><p>http://pan.baidu.com/s/1o6kRee2</p><p>PHP经典编程265例实例及源码资源</p><p>http://pan.baidu.com/s/1dDtqTNF</p><p>PHP典型模块精解视频及源码资源</p><p>http://pan.baidu.com/s/1bnrZdAf</p><p>PHP必须知道的300个问题视频及源码</p><p>http://pan.baidu.com/s/1bnAVWCn</p><p><br/></p><p>PHP快速入门及项目实战 源码1-9章资源</p><p>http://pan.baidu.com/s/1c0ATURe</p><p>PHP快速入门及项目实战 源码10-18章资源</p><p>http://pan.baidu.com/s/1jGlFjh0</p><p>PHP快速入门及项目实战 课件资源</p><p>http://pan.baidu.com/s/1kTkrnAR</p><p><br/></p>', '2016-10-10 16:26:49', 'admin1', 1, 'n', '于国良', 0);
INSERT INTO `forum_main` VALUES ('026c7111-8904-4245-b9a4-d1f949a91097', '为什么会出现SQLServerException异常', 'jishutuijian', 'jsp', '<p>我在进行数据库连接时，为什么出现了SQLServerException异常？</p>', '2016-11-10 13:14:52', 'mrsoft', 5, 'n', '明日科技', 0);
INSERT INTO `forum_main` VALUES ('030c72c0-b685-4e4e-994d-2f86a456b7f5', 'Java', 'default', 'javase', '<pre class=\"brush:java;toolbar:false\">@Resource(name=&quot;dataSourceDDS&quot;)\r\n	DataSource&nbsp;dataSource;\r\n	\r\n\r\n	@Bean\r\n	public&nbsp;JdbcTemplate&nbsp;jdbcTemplate&nbsp;(){\r\n		\r\n		return&nbsp;new&nbsp;JdbcTemplate(dataSource);\r\n	}\r\n	\r\n	@Bean(name=&quot;simpleDateFormat&quot;)\r\n	public&nbsp;SimpleDateFormat&nbsp;simpleDateFormat(){\r\n		return&nbsp;new&nbsp;SimpleDateFormat(&quot;yyyy-MM-dd&quot;);\r\n	}</pre><pre class=\"brush:java;toolbar:false\"><br/></pre><p><br/></p>', '2016-10-31 09:28:23', 'admin1', 5, 'n', '于国良', 0);
INSERT INTO `forum_main` VALUES ('19eb01fc-60d4-4fbe-ba86-beef18229754', '图书中用到的thinkphp是什么版本的', 'default', 'php', '<p>图书中用到的thinkphp是什么版本的</p>', '2016-10-10 16:25:05', 'admin1', 1, 'n', '于国良', 0);
INSERT INTO `forum_main` VALUES ('277d0d20-8059-4958-b19e-83736c0e70dc', 'sss', 'default', 'javase', '<p>sss</p>', '2016-11-09 13:46:24', 'admin1', 1, 'n', '于国良', 0);
INSERT INTO `forum_main` VALUES ('417bc4c6-11f7-4f8a-9352-5e0b69815c95', '开发环境', 'jishutuijian', 'net', '<p>ＡＳＰ.NET开发环境下载及安装参考：http://pan.baidu.com/s/1bnwBaaz</p>', '2016-10-10 16:27:48', 'admin1', 1, 'n', '于国良', 0);
INSERT INTO `forum_main` VALUES ('498cf08b-3fdd-4a86-898a-47fb56463aa8', '用getClass()已经获得类名了，为什么还要在getClass()后面加getName()?', 'default', 'javase', '<p>class Art{</p><p>Art(){</p><p>System.out.println(getClass());</p><p>Systen.out.println(getClass().getName());</p><p>}</p><p>}</p><p>public class A{</p><p>public static void main(String[] args){</p><p>Art x=new Art();</p><p>}</p><p>}</p>', '2016-10-10 16:09:24', 'admin1', 1, 'n', '于国良', 0);
INSERT INTO `forum_main` VALUES ('50ab643b-f7db-4c8b-8f88-0006bb290bd4', '测试发帖2', 'default', 'javase', '<p>测试发帖2<br/></p>', '2016-11-08 15:21:38', 'admin1', 5, 'n', '于国良', 0);
INSERT INTO `forum_main` VALUES ('59c5318e-06cc-4ecc-b4e1-daf27339fc07', 'ECLIPSE书上用是什么版本，汉化包我该选择什么样的？', 'xinqingtucao', 'jsp', '<p>ECLIPSE书上用是什么版本，汉化包我该选择什么样的？</p>', '2016-10-10 16:36:11', 'admin1', 1, 'n', '于国良', 0);
INSERT INTO `forum_main` VALUES ('64e59ecb-8de4-4822-b72b-710e4945805b', 'sss', 'default', 'javase', '<p>sss<br/></p>', '2016-11-09 13:46:14', 'admin1', 5, 'n', '于国良', 0);
INSERT INTO `forum_main` VALUES ('6eee1fd4-3ca6-46fb-ba4a-cda8efe450b3', '资源库下载', 'jishutuijian', 'php', '<p>PHP开发资源库:http://pan.baidu.com/s/1o65Kbzk</p>', '2016-10-10 16:23:33', 'admin1', 5, 'n', '于国良', 0);
INSERT INTO `forum_main` VALUES ('874a3c5e-a7c1-4c40-8699-6ebf780250b3', 'sss', 'default', 'javase', '<p>sss<br/></p>', '2016-10-10 15:59:08', 'admin1', 5, 'n', '于国良', 0);
INSERT INTO `forum_main` VALUES ('89753acb-6cb0-42e7-a0c7-06c1e86d1781', '测试发帖', 'default', 'php', '<p>测试<br/></p>', '2016-11-17 13:40:17', 'mingrisoft', 5, 'n', '明日', 0);
INSERT INTO `forum_main` VALUES ('8c6ba414-6c52-42f7-a2e4-7ea1a3357af1', 'JDK官网和书个介绍的完全不一样，不会下载', 'xinqingtucao', 'jsp', '<p>JDK官网和书个介绍的完全不一样，不会下载</p>', '2016-10-10 16:35:55', 'admin1', 1, 'n', '于国良', 0);
INSERT INTO `forum_main` VALUES ('8d0f8371-e384-4d7e-8858-657b4cf1d88b', '要求用循环结构解决', 'default', 'javase', '<p>从控制台输入两个数，求这两个数的最大公约数和最小公倍数</p><p>例：8和12的最小公倍数是24，最大公约数是4</p>', '2016-10-10 16:19:57', 'admin1', 1, 'n', '于国良', 0);
INSERT INTO `forum_main` VALUES ('a3b24a4e-1457-4374-b8a1-f075724f55db', '请问收银台系统里面的控件是什么控件？', 'default', 'net', '<p>用picturebox贴图就可以，用tablelayoutpanel装入</p>', '2016-10-10 16:41:09', 'admin1', 1, 'n', '于国良', 0);
INSERT INTO `forum_main` VALUES ('aa9eaf58-fa8c-4095-bdb3-01fadd8b83fd', '书上用的是JDK7，官网没有了，如何处理？', 'xinqingtucao', 'jsp', '<p>书上用的是JDK7，官网没有了，如何处理？</p>', '2016-10-10 16:35:34', 'admin1', 5, 'n', '于国良', 0);
INSERT INTO `forum_main` VALUES ('b60a407b-4c32-4472-9011-06b8f62b8fed', '资源库中为什么有些资源看不了', 'xinqingtucao', 'php', '<p>需要购买正式版的词典才可以看的 &nbsp;淘宝店铺：http://mrbccd.taobao.com</p>', '2016-10-10 16:25:58', 'admin1', 1, 'n', '于国良', 0);
INSERT INTO `forum_main` VALUES ('b61a76a9-f9e2-49d7-a0cc-86324051c8c3', 'AppServ安装问题', 'default', 'php', '<p>安装AppServ之后，测试是否安装成功，然后打开这个页面之后就是IIS的页面，怎么回事？</p>', '2016-11-17 13:28:31', 'mrsoft', 1, 'n', '明日科技', 0);
INSERT INTO `forum_main` VALUES ('b90d6d9e-a31c-4609-9329-455e94ac5277', '基础问题', 'default', 'javase', '<p>a aa=new a();分解这句话的意思。。</p>', '2016-10-10 16:16:55', 'admin1', 1, 'n', '于国良', 0);
INSERT INTO `forum_main` VALUES ('c8eb9513-1ebc-4f11-baf5-556cc20ca1c4', 'Java单例模式', 'default', 'javase', '<p>登记式单例三种</p><p>单例式模式有以下特点：</p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>单例类只能有一个实例</p></li><li><p>单例类必须自己创建自己的唯一实例</p></li><li><p>单例类必须给所有其他对象提供这一实例</p></li></ol>', '2016-10-10 16:15:23', 'admin1', 1, 'n', '于国良', 0);
INSERT INTO `forum_main` VALUES ('d32b060e-128e-420f-b33d-6fc09a1c41b9', '.net正则如何过滤指定id的div标签', 'xinqingtucao', 'net', '<p>可以通过正则把id为test的div移除掉包含div的内容</p>', '2016-10-10 16:33:06', 'admin1', 1, 'n', '于国良', 0);
INSERT INTO `forum_main` VALUES ('f42729ca-ebab-48db-9fe5-579de25ab8e8', '测试发帖1', 'jishutuijian', 'javase', '<p>测试发帖</p>', '2016-11-08 15:22:48', 'admin1', 5, 'n', '于国良', 0);
INSERT INTO `forum_main` VALUES ('f5645146-a783-45f4-b3a4-8ceb2676a41d', '.net中可以引用VB生成的DLL吗？', 'default', 'net', '<p>可以的</p>', '2016-10-10 16:34:48', 'admin1', 1, 'n', '于国良', 0);

-- ----------------------------
-- Table structure for forum_minfo
-- ----------------------------
DROP TABLE IF EXISTS `forum_minfo`;
CREATE TABLE `forum_minfo`  (
  `minfo_id` int NOT NULL AUTO_INCREMENT,
  `main_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `minfo_reply` int NULL DEFAULT 0,
  `minfo_banzhu` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `minfo_creatime` datetime NULL DEFAULT NULL,
  `minfo_creatuser` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `minfo_order` int NULL DEFAULT 5,
  `minfo_see` int NULL DEFAULT 0,
  `minfo_photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '版块标志图片',
  `minfo_title` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `minfo_count` int NULL DEFAULT NULL,
  PRIMARY KEY (`minfo_id`) USING BTREE,
  UNIQUE INDEX `main_type_UNIQUE`(`main_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '主表信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_minfo
-- ----------------------------
INSERT INTO `forum_minfo` VALUES (1, 'javase', 33, 'javasebz', '2016-07-26 10:19:56', 'dd', 1, 685, '', 'Java SE专区版块', 10);
INSERT INTO `forum_minfo` VALUES (2, 'php', 2, 'phpbz', '2016-08-01 11:42:50', 'admin1', 5, 81, NULL, 'PHP 专区版块', 6);
INSERT INTO `forum_minfo` VALUES (3, 'net', 1, 'netbz', '2016-08-01 11:45:48', 'admin1', 5, 40, NULL, '.Net 专区版块', 4);
INSERT INTO `forum_minfo` VALUES (4, 'jsp', 7, 'jspbz', '2016-08-01 13:28:33', 'admin1', 5, 49, NULL, 'JSP技术专区', 4);

SET FOREIGN_KEY_CHECKS = 1;
