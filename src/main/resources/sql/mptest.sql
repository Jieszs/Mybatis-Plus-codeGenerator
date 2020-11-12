/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : mptest

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 12/11/2020 14:15:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tag_info
-- ----------------------------
DROP TABLE IF EXISTS `tag_info`;
CREATE TABLE `tag_info`  (
  `tagId` int NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `tagName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签名称',
  `parentId` int NOT NULL COMMENT '父节点id',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态(1正常0删除)',
  `insertTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`tagId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tag_info
-- ----------------------------
INSERT INTO `tag_info` VALUES (1, 'aaa', 0, 1, '2020-07-22 18:10:25', '2020-07-23 10:17:22');
INSERT INTO `tag_info` VALUES (2, 'bbbbbbb', 0, 0, '2020-07-22 18:10:25', '2020-07-23 11:15:18');
INSERT INTO `tag_info` VALUES (3, 'aaa1', 1, 1, '2020-07-22 18:10:25', '2020-07-22 18:10:25');
INSERT INTO `tag_info` VALUES (4, 'aaa2', 1, 1, '2020-07-22 18:10:25', '2020-07-22 18:10:25');
INSERT INTO `tag_info` VALUES (5, 'bbb1', 2, 1, '2020-07-22 18:10:25', '2020-07-23 10:17:24');
INSERT INTO `tag_info` VALUES (6, 'aaa11', 3, 1, '2020-07-22 18:10:25', '2020-07-22 18:10:25');
INSERT INTO `tag_info` VALUES (7, 'aaa12', 3, 1, '2020-07-22 18:10:25', '2020-07-22 18:10:25');
INSERT INTO `tag_info` VALUES (8, 'aaa21', 4, 1, '2020-07-22 18:10:25', '2020-07-22 18:10:25');
INSERT INTO `tag_info` VALUES (9, 'aaa22', 4, 1, '2020-07-22 18:10:25', '2020-07-22 18:10:25');
INSERT INTO `tag_info` VALUES (10, 'bbb3', 2, 1, '2020-07-23 11:13:14', NULL);
INSERT INTO `tag_info` VALUES (11, 'bbb4', 2, 1, '2020-07-23 11:13:18', NULL);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `age` int NOT NULL DEFAULT -1 COMMENT '年龄',
  `depart_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `insert_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态(0删除1正常)',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, '李白', 88, '朝廷', '2020-07-21 16:29:59', '2020-07-23 11:24:04', 1);
INSERT INTO `user_info` VALUES (2, 'string', 10, 'string', '2020-07-21 17:06:56', '2020-07-23 11:24:23', 0);
INSERT INTO `user_info` VALUES (3, '012345678900', 10, 'string', '2020-07-21 17:07:22', NULL, 1);
INSERT INTO `user_info` VALUES (4, '0123456789000', 10, 'string', '2020-07-21 17:07:33', NULL, 1);
INSERT INTO `user_info` VALUES (5, 'string', 20, 'string', '2020-07-21 01:32:20', '2020-07-21 01:32:20', 1);
INSERT INTO `user_info` VALUES (6, '123123', 20, 'string', '2020-07-21 01:32:20', '2020-07-21 01:32:20', 1);
INSERT INTO `user_info` VALUES (7, '123123123', 20, 'string', '2020-07-21 01:32:20', '2020-07-21 01:32:20', 1);
INSERT INTO `user_info` VALUES (8, '1231231231', 20, 'string', '2020-07-21 01:32:20', '2020-07-22 16:47:23', 0);
INSERT INTO `user_info` VALUES (9, '123', 1, '123', '2020-07-22 15:24:37', NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
