/*
 Navicat Premium Data Transfer

 Source Server         : lokal
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : latihan

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 26/01/2022 19:42:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `parent_id` int(0) NOT NULL DEFAULT 0,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stat` int(0) NOT NULL DEFAULT 1 COMMENT '1. aktif 0. non-aktif',
  `syscreateuser` int(0) NULL DEFAULT NULL,
  `syscreatedate` datetime(0) NULL DEFAULT NULL,
  `sysupdateuser` int(0) NULL DEFAULT NULL,
  `sysupdatedate` datetime(0) NULL DEFAULT NULL,
  `sysdeleteuser` int(0) NULL DEFAULT NULL,
  `sysdeletedate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_roles
-- ----------------------------
INSERT INTO `sys_roles` VALUES (1, 0, 'Super User', 'Super administrators', 1, 1, '2021-02-25 02:27:34', 1, '2021-03-08 08:29:08', 1, '2021-06-08 23:51:23');

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `role_id` int(0) NULL DEFAULT NULL,
  `pict` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stat` int(0) NULL DEFAULT NULL,
  `last_login` datetime(0) NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `login_attempt` int(0) NULL DEFAULT 0,
  `syscreateuser` int(0) NULL DEFAULT NULL,
  `syscreatedate` datetime(0) NULL DEFAULT NULL,
  `sysupdateuser` int(0) NULL DEFAULT NULL,
  `sysupdatedate` datetime(0) NULL DEFAULT NULL,
  `sysdeleteuser` int(0) NULL DEFAULT NULL,
  `sysdeletedate` datetime(0) NULL DEFAULT NULL,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `uname`(`uname`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `sys_users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES (1, 'bod', '$2y$10$BE6bAPmNz0Hh1g5yL3Tk6Ov4j1HYs55ngBwSH8FHpyUY4Go7zVx6i', 1, 'users12_055933.jpg', 1, '2022-01-25 10:51:45', '127.0.0.1', 0, 1, '2021-03-07 23:06:13', 1, '2021-09-12 05:59:33', 0, '2021-07-08 00:09:25');

SET FOREIGN_KEY_CHECKS = 1;
