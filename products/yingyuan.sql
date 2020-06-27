/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : yingyuan

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 01/01/2020 12:16:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `isable` tinyint(255) DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qx` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限',
  `gmt_time` datetime(0) DEFAULT NULL,
  `upt_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 9216 kB' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, '1597908455', 'admin', 1, 'admin', '1', '2019-04-19 00:00:00', '2020-01-01 11:38:13');
INSERT INTO `admin` VALUES (2, '1411145454', 'wwk', 0, 'wwk', '0', '2019-04-20 00:00:00', '2019-04-20 00:00:00');
INSERT INTO `admin` VALUES (3, '1411145678', 'wjk', 0, '2454', '1', '2019-04-20 00:00:00', '2019-04-20 00:00:00');
INSERT INTO `admin` VALUES (4, '1434356535', '英雄联盟', 0, 'wwk', '0', '2019-04-20 00:00:00', '2019-04-20 00:00:00');
INSERT INTO `admin` VALUES (5, '1597946543', 'nnn', 1, 'wwk', '0', '2019-04-20 00:00:00', '2019-04-20 00:00:00');
INSERT INTO `admin` VALUES (6, '15979084555', '斗鱼', 1, 'admin', '0', '2019-04-19 00:00:00', '2019-04-19 00:00:00');
INSERT INTO `admin` VALUES (7, '1411145454', '日月神教', 0, 'wwk', '0', '2019-04-20 00:00:00', '2019-04-20 00:00:00');
INSERT INTO `admin` VALUES (8, '1411145678', 'wkkk', 0, '2454', '0', '2019-04-20 00:00:00', '2019-04-20 00:00:00');
INSERT INTO `admin` VALUES (9, '1434356535', 'ghj', 0, 'wwk', '0', '2019-04-20 00:00:00', '2019-04-20 00:00:00');
INSERT INTO `admin` VALUES (10, '1597946543', '笑傲江湖', 0, 'wwk', '0', '2019-04-20 00:00:00', '2019-04-20 00:00:00');
INSERT INTO `admin` VALUES (11, '15979084555', '西方失败', 1, 'admin', '0', '2019-04-19 00:00:00', '2019-04-19 00:00:00');
INSERT INTO `admin` VALUES (12, '1411145454', '东方不败', 0, 'bubai', '0', '2019-04-20 00:00:00', '2019-04-20 00:00:00');
INSERT INTO `admin` VALUES (46, '4546464', 'jjjj', 1, '123456', '0', '2020-01-01 11:32:34', '2020-01-01 11:32:34');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `mainactor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '进货单价',
  `director` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品编号',
  `video` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品状态',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品类型',
  `duration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '商品数量',
  `speak` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '售出单价',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '商品描述',
  `isable` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品图片',
  `gmttime` datetime(0) DEFAULT NULL,
  `upttime` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 9216 kB' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '矿泉水', '10', '154979464655', NULL, '0', '日用百货', '20', '20', '饮用水', '1', 'http://localhost:8080/yingyuan/static/upload/images/1577846080260_206.gif', '2020-01-01 12:08:02', '2020-01-01 12:08:02');
INSERT INTO `product` VALUES (2, '雪碧', '20', '789145313545554', NULL, '0', '日用百货', '100', '30', '一种碳酸饮料', '1', 'http://localhost:8080/yingyuan/static/upload/images/1577849600969_416.jpg', '2020-01-01 12:07:51', '2020-01-01 12:07:51');
INSERT INTO `product` VALUES (3, '天猫精灵', '99.99', '5454797651', NULL, '0', '数码类', '20', '40', '电音之王', '1', 'http://localhost:8080/yingyuan/static/upload/images/1577849736391_995.jpg', '2020-01-01 12:07:33', '2020-01-01 12:07:33');

SET FOREIGN_KEY_CHECKS = 1;
