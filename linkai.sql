/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : rm-2ze08bh0zi3p3z246oo.mysql.rds.aliyuncs.com:3306
 Source Schema         : linkai

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 16/11/2020 20:31:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `cat_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `pro_id` int(11) NULL DEFAULT NULL COMMENT '产品id，外键',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `cat_partent_id` int(11) NULL DEFAULT NULL COMMENT '自引用分类id，主分类',
  PRIMARY KEY (`cat_id`) USING BTREE,
  INDEX `pro_id`(`pro_id`) USING BTREE,
  INDEX `cat_partent_id`(`cat_partent_id`) USING BTREE,
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `category_ibfk_2` FOREIGN KEY (`cat_partent_id`) REFERENCES `category` (`cat_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '牛仔套装', NULL, NULL, NULL, 1, NULL);
INSERT INTO `category` VALUES (2, '牛仔套装', '2020-09-05 18:10:03', '2020-09-05 18:10:03', NULL, 1, NULL);
INSERT INTO `category` VALUES (3, '商品', '2020-09-05 18:11:55', '2020-09-05 18:11:55', NULL, 1, NULL);
INSERT INTO `category` VALUES (4, '商品', '2020-09-05 18:12:52', '2020-09-05 18:12:52', NULL, 1, NULL);
INSERT INTO `category` VALUES (5, '涤卡', '2020-09-05 18:43:45', '2020-09-05 18:43:45', NULL, 1, NULL);
INSERT INTO `category` VALUES (6, '棉服', '2020-09-05 20:01:03', '2020-09-05 20:01:03', NULL, 1, NULL);
INSERT INTO `category` VALUES (7, '商品', '2020-09-05 20:02:58', '2020-09-05 20:02:58', NULL, 1, NULL);
INSERT INTO `category` VALUES (8, '', '2020-09-06 08:41:13', '2020-09-06 08:41:13', NULL, 1, NULL);
INSERT INTO `category` VALUES (9, '商品111', '2020-09-06 08:42:10', '2020-09-06 09:05:00', NULL, 1, NULL);
INSERT INTO `category` VALUES (10, '商品', '2020-09-06 08:42:59', '2020-09-06 08:42:59', NULL, 1, NULL);
INSERT INTO `category` VALUES (11, '商品222', '2020-09-06 09:26:50', '2020-09-06 09:26:50', NULL, 1, NULL);
INSERT INTO `category` VALUES (12, '涤卡', '2020-09-11 16:07:49', '2020-09-11 16:07:49', NULL, 1, NULL);
INSERT INTO `category` VALUES (13, '商品', '2020-09-11 16:09:38', '2020-09-11 16:09:38', NULL, 1, NULL);
INSERT INTO `category` VALUES (14, '棉服', '2020-09-11 16:10:42', '2020-09-11 16:10:42', NULL, 1, NULL);
INSERT INTO `category` VALUES (15, '商品222', '2020-09-11 16:11:55', '2020-09-11 16:11:55', NULL, 1, NULL);
INSERT INTO `category` VALUES (16, '涤卡', '2020-09-11 16:13:38', '2020-09-11 16:13:38', NULL, 1, NULL);
INSERT INTO `category` VALUES (17, 'shangpin', '2020-09-11 16:14:51', '2020-09-11 16:14:51', NULL, 1, NULL);
INSERT INTO `category` VALUES (18, 'shangpin222', '2020-09-11 16:19:21', '2020-09-11 16:19:21', NULL, 1, NULL);
INSERT INTO `category` VALUES (19, '牛仔工作服套装', '2020-09-17 19:46:57', '2020-09-17 19:46:57', NULL, 0, NULL);
INSERT INTO `category` VALUES (20, '牛仔工作服裤子', '2020-09-17 19:47:19', '2020-09-17 19:47:19', NULL, 0, NULL);
INSERT INTO `category` VALUES (21, '牛仔单上衣', '2020-09-17 19:47:36', '2020-09-17 19:47:36', NULL, 0, NULL);
INSERT INTO `category` VALUES (22, '夏季牛仔工作服', '2020-09-17 19:47:55', '2020-09-17 19:47:55', NULL, 0, NULL);
INSERT INTO `category` VALUES (23, '涤卡套装', '2020-09-17 19:48:18', '2020-09-17 19:48:18', NULL, 0, NULL);
INSERT INTO `category` VALUES (24, '冬季棉服', '2020-09-17 19:48:28', '2020-09-17 19:48:28', NULL, 0, NULL);

-- ----------------------------
-- Table structure for color
-- ----------------------------
DROP TABLE IF EXISTS `color`;
CREATE TABLE `color`  (
  `col_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '颜色id',
  `col_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '颜色描述',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `deleted` int(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`col_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of color
-- ----------------------------
INSERT INTO `color` VALUES (1, 'heise', '2020-09-09 21:13:39', '2020-09-10 09:08:40', 0);
INSERT INTO `color` VALUES (2, '白色', '2020-09-10 08:28:11', '2020-09-10 08:28:11', 0);
INSERT INTO `color` VALUES (3, '蓝色', '2020-09-11 15:51:06', '2020-09-11 15:51:06', 0);
INSERT INTO `color` VALUES (4, '天蓝色', '2020-09-11 15:51:49', '2020-09-11 15:51:49', 0);

-- ----------------------------
-- Table structure for img
-- ----------------------------
DROP TABLE IF EXISTS `img`;
CREATE TABLE `img`  (
  `img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图像id',
  `img_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片名称',
  `img_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片后缀名',
  `img_size` double NULL DEFAULT NULL COMMENT '图片大小',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片保存路径',
  `img_download_count` int(11) NULL DEFAULT NULL COMMENT '图片下载次数',
  `pro_id` int(11) NULL DEFAULT NULL COMMENT '产品id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `img_local_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务器地址',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`img_id`) USING BTREE,
  INDEX `pro_id`(`pro_id`) USING BTREE,
  CONSTRAINT `img_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of img
-- ----------------------------
INSERT INTO `img` VALUES (1, 'modal1.jpg', 'image/jpeg', 114215, NULL, NULL, NULL, '2020-09-12 19:41:34', '2020-09-12 19:41:34', NULL, 0);
INSERT INTO `img` VALUES (2, 'modal1.jpg', 'image/jpeg', 114215, NULL, NULL, NULL, '2020-09-12 19:45:26', '2020-09-12 19:45:26', NULL, 0);
INSERT INTO `img` VALUES (3, 'logo.png', 'image/png', 4531, NULL, NULL, NULL, '2020-09-12 19:59:40', '2020-09-12 19:59:40', NULL, 0);
INSERT INTO `img` VALUES (4, 'modal1.jpg', 'image/jpeg', 114215, NULL, NULL, NULL, '2020-09-12 20:01:18', '2020-09-12 20:01:18', NULL, 0);
INSERT INTO `img` VALUES (5, 'logo.png', 'image/png', 4531, NULL, NULL, 89, '2020-09-14 20:03:25', '2020-09-14 20:03:25', NULL, 0);
INSERT INTO `img` VALUES (6, 'logo.png', 'image/png', 4531, '2020/09/16/e6b91ca2-5932-4064-a766-3bedfd57600f.png', NULL, 90, '2020-09-16 14:07:03', '2020-09-16 14:07:03', '/profile//2020/09/16/e6b91ca2-5932-4064-a766-3bedfd57600f.png', 0);
INSERT INTO `img` VALUES (7, 'modal1.jpg', 'image/jpeg', 114215, '2020/09/16/883ecf58-f5bb-4f45-ba42-029e7e6bcc99.jpg', NULL, 90, '2020-09-16 14:09:58', '2020-09-16 14:09:58', '//profile//2020/09/16/883ecf58-f5bb-4f45-ba42-029e7e6bcc99.jpg', 0);
INSERT INTO `img` VALUES (8, 'QQ图片20200910200145.jpg', 'image/jpeg', 104336, '2020/09/16/7cbc51bd-fff5-4d45-b1d5-de4000ce473e.jpg', NULL, 90, '2020-09-16 14:11:07', '2020-09-16 14:11:07', '/D:\\linkai\\uploadPath\\2020\\09\\16\\7cbc51bd-fff5-4d45-b1d5-de4000ce473e.jpg', 0);
INSERT INTO `img` VALUES (9, 'modal1.jpg', 'image/jpeg', 114215, '/2020/09/16/6a667252-b36b-4912-be4b-6773246c9a9c.jpg', NULL, 91, '2020-09-16 14:17:13', '2020-09-16 14:17:13', 'D:\\linkai\\uploadPath\\2020\\09\\16\\6a667252-b36b-4912-be4b-6773246c9a9c.jpg', 0);
INSERT INTO `img` VALUES (10, 'sucai.jpg', 'image/jpeg', 117891, '/2020/09/16/80f0c008-3a3a-4c49-8453-8419757ba861.jpg', NULL, 91, '2020-09-16 14:17:13', '2020-09-16 14:17:13', 'D:\\linkai\\uploadPath\\2020\\09\\16\\80f0c008-3a3a-4c49-8453-8419757ba861.jpg', 0);
INSERT INTO `img` VALUES (11, 'Workdt20191101111144.jpg', 'image/jpeg', 77899, '/2020/09/16/a2ad5d21-0a6a-46f9-9f47-016bd129304d.jpg', NULL, 92, '2020-09-16 18:44:09', '2020-09-16 18:44:09', 'D:\\linkai\\uploadPath\\2020\\09\\16\\a2ad5d21-0a6a-46f9-9f47-016bd129304d.jpg', 1);
INSERT INTO `img` VALUES (12, 'logo.png', 'image/png', 4531, '/2020/09/16/5b0a7f34-3c5b-463b-af29-d565431b6f0e.png', NULL, 92, '2020-09-16 18:44:09', '2020-09-16 18:44:09', 'D:\\linkai\\uploadPath\\2020\\09\\16\\5b0a7f34-3c5b-463b-af29-d565431b6f0e.png', 1);
INSERT INTO `img` VALUES (13, 'logo.png', 'image/png', 4531, '/2020/09/16/8fa48d1e-b590-469c-b09a-808dec43b9dd.png', NULL, 93, '2020-09-16 19:40:25', '2020-09-16 19:40:25', 'D:\\linkai\\uploadPath\\2020\\09\\16\\8fa48d1e-b590-469c-b09a-808dec43b9dd.png', 1);
INSERT INTO `img` VALUES (14, 'sucai.jpg', 'image/jpeg', 117891, '/2020/09/16/2f2b0070-6cba-415d-a165-c12bca35667d.jpg', NULL, 93, '2020-09-16 19:40:25', '2020-09-16 19:40:25', 'D:\\linkai\\uploadPath\\2020\\09\\16\\2f2b0070-6cba-415d-a165-c12bca35667d.jpg', 1);
INSERT INTO `img` VALUES (15, 'logo.png', 'image/png', 4531, '/2020/09/17/d59cbcce-7dad-451a-abfc-5e546858f6a1.png', NULL, 94, '2020-09-17 19:02:19', '2020-09-17 19:02:19', 'D:\\linkai\\uploadPath\\2020\\09\\17\\d59cbcce-7dad-451a-abfc-5e546858f6a1.png', 0);
INSERT INTO `img` VALUES (16, 'logo.png', 'image/png', 4531, '/2020/09/17/9016c55f-3cf3-49d4-ae8a-48882c6a121f.png', NULL, 93, '2020-09-17 19:17:18', '2020-09-17 19:17:18', 'D:\\linkai\\uploadPath\\2020\\09\\17\\9016c55f-3cf3-49d4-ae8a-48882c6a121f.png', 1);
INSERT INTO `img` VALUES (17, 'logo.png', 'image/png', 4531, '/2020/09/17/2dcd6fe9-3810-4437-be88-e8b85e49bf9b.png', NULL, 93, '2020-09-17 19:17:45', '2020-09-17 19:17:45', 'D:\\linkai\\uploadPath\\2020\\09\\17\\2dcd6fe9-3810-4437-be88-e8b85e49bf9b.png', 0);
INSERT INTO `img` VALUES (18, 'Workdt20191101111144.jpg', 'image/jpeg', 77899, '/2020/09/17/c7916b82-f499-4472-a969-a3c80e881820.jpg', NULL, 93, '2020-09-17 19:17:45', '2020-09-17 19:17:45', 'D:\\linkai\\uploadPath\\2020\\09\\17\\c7916b82-f499-4472-a969-a3c80e881820.jpg', 0);
INSERT INTO `img` VALUES (19, 'sucai.jpg', 'image/jpeg', 117891, '/2020/09/17/b58618e6-4eac-45dc-b8d4-ae57917bc075.jpg', NULL, 93, '2020-09-17 19:17:45', '2020-09-17 19:17:45', 'D:\\linkai\\uploadPath\\2020\\09\\17\\b58618e6-4eac-45dc-b8d4-ae57917bc075.jpg', 0);
INSERT INTO `img` VALUES (20, 'logo.png', 'image/png', 4531, '/2020/09/17/48377b37-270b-45a3-b80d-90595b7a0b3c.png', NULL, 95, '2020-09-17 19:18:43', '2020-09-17 19:18:43', 'D:\\linkai\\uploadPath\\2020\\09\\17\\48377b37-270b-45a3-b80d-90595b7a0b3c.png', 1);
INSERT INTO `img` VALUES (21, 'Workdt20191101111144.jpg', 'image/jpeg', 77899, '/2020/09/17/b745b872-fefa-46a9-9bd2-1ae4ecd7d15f.jpg', NULL, 95, '2020-09-17 19:18:43', '2020-09-17 19:18:43', 'D:\\linkai\\uploadPath\\2020\\09\\17\\b745b872-fefa-46a9-9bd2-1ae4ecd7d15f.jpg', 1);
INSERT INTO `img` VALUES (22, 'modal1.jpg', 'image/jpeg', 114215, '/2020/09/17/cfd67d49-a49d-4899-8254-aba6bf0190d1.jpg', NULL, 95, '2020-09-17 19:20:39', '2020-09-17 19:20:39', 'D:\\linkai\\uploadPath\\2020\\09\\17\\cfd67d49-a49d-4899-8254-aba6bf0190d1.jpg', 1);
INSERT INTO `img` VALUES (23, 'sucai.jpg', 'image/jpeg', 117891, '/2020/09/17/0ecc5066-03f3-4f3e-a0d7-5b65aaac1e44.jpg', NULL, 95, '2020-09-17 19:28:55', '2020-09-17 19:28:55', 'D:\\linkai\\uploadPath\\2020\\09\\17\\0ecc5066-03f3-4f3e-a0d7-5b65aaac1e44.jpg', 1);
INSERT INTO `img` VALUES (24, 'modal1.jpg', 'image/jpeg', 114215, '/2020/09/17/f27dcb70-d60e-4403-aae5-84fe51b6d611.jpg', NULL, 95, '2020-09-17 19:30:50', '2020-09-17 19:30:50', 'D:\\linkai\\uploadPath\\2020\\09\\17\\f27dcb70-d60e-4403-aae5-84fe51b6d611.jpg', 1);
INSERT INTO `img` VALUES (25, 'sucai.jpg', 'image/jpeg', 117891, '/2020/09/17/4346aa1d-e1c4-48b7-b9fb-2b42ad57da44.jpg', NULL, 95, '2020-09-17 19:31:20', '2020-09-17 19:31:20', 'D:\\linkai\\uploadPath\\2020\\09\\17\\4346aa1d-e1c4-48b7-b9fb-2b42ad57da44.jpg', 1);
INSERT INTO `img` VALUES (26, 'sucai.jpg', 'image/jpeg', 117891, '/2020/09/17/fd34c1a9-e541-4f97-a8be-27d5bc8d26d9.jpg', NULL, 95, '2020-09-17 19:32:42', '2020-09-17 19:32:42', 'D:\\linkai\\uploadPath\\2020\\09\\17\\fd34c1a9-e541-4f97-a8be-27d5bc8d26d9.jpg', 1);
INSERT INTO `img` VALUES (27, 'QQ图片20200910200145.jpg', 'image/jpeg', 104336, '/2020/09/17/67fccaef-9788-4a6f-8e53-fcb7195e9604.jpg', NULL, 95, '2020-09-17 19:34:44', '2020-09-17 19:34:44', 'D:\\linkai\\uploadPath\\2020\\09\\17\\67fccaef-9788-4a6f-8e53-fcb7195e9604.jpg', 0);
INSERT INTO `img` VALUES (28, 'modal1.jpg', 'image/jpeg', 114215, '/2020/09/17/e83ed195-0a0f-4590-8a47-7bf96042c6e3.jpg', NULL, 96, '2020-09-17 19:51:33', '2020-09-17 19:51:33', 'D:\\linkai\\uploadPath\\2020\\09\\17\\e83ed195-0a0f-4590-8a47-7bf96042c6e3.jpg', 0);
INSERT INTO `img` VALUES (29, 'modal1.jpg', 'image/jpeg', 114215, '/2020/09/17/e83ed195-022f-4590-8a47-7bf96042c6e3.jpg', NULL, 96, '2020-09-17 19:51:33', '2020-09-17 19:51:33', 'D:\\linkai\\uploadPath\\2020\\09\\17\\e83ed195-0a0f-4590-8a47-7bf96042c6e3.jpg', 0);
INSERT INTO `img` VALUES (30, '449c036f2510407c8fffdea6822c4523.png', 'image/png', 6232, '/2020/09/18/54777b8f-daa6-4cbf-97df-225f4bb89f4c.png', NULL, 97, '2020-09-18 20:06:49', '2020-09-18 20:06:49', 'D:\\linkai\\uploadPath\\2020\\09\\18\\54777b8f-daa6-4cbf-97df-225f4bb89f4c.png', 0);
INSERT INTO `img` VALUES (31, '679483749638470eacb207ce609c57da.png', 'image/png', 6232, '/2020/09/18/f2fe07fc-f898-4ff1-a7fe-bb5ec19da5fc.png', NULL, 97, '2020-09-18 20:06:49', '2020-09-18 20:06:49', 'D:\\linkai\\uploadPath\\2020\\09\\18\\f2fe07fc-f898-4ff1-a7fe-bb5ec19da5fc.png', 0);
INSERT INTO `img` VALUES (32, '679483749638470eacb207ce609c57da.png', 'image/png', 6232, '/2020/09/18/5d4caf77-c9de-4f2a-b277-7ec264d53259.png', NULL, 98, '2020-09-18 20:07:31', '2020-09-18 20:07:31', 'D:\\linkai\\uploadPath\\2020\\09\\18\\5d4caf77-c9de-4f2a-b277-7ec264d53259.png', 0);
INSERT INTO `img` VALUES (33, 'ikc接口.png', 'image/png', 140163, '/2020/09/18/37baec5a-2868-4e98-b3e7-ac3b41b91318.png', NULL, 98, '2020-09-18 20:07:31', '2020-09-18 20:07:31', 'D:\\linkai\\uploadPath\\2020\\09\\18\\37baec5a-2868-4e98-b3e7-ac3b41b91318.png', 0);
INSERT INTO `img` VALUES (34, '679483749638470eacb207ce609c57da.png', 'image/png', 6232, '/2020/09/18/4545c41f-b071-4d2f-9092-3af1ba538f00.png', NULL, 99, '2020-09-18 20:07:59', '2020-09-18 20:07:59', 'D:\\linkai\\uploadPath\\2020\\09\\18\\4545c41f-b071-4d2f-9092-3af1ba538f00.png', 0);
INSERT INTO `img` VALUES (35, '5-13050GS109.gif', 'image/gif', 6693, '/2020/09/18/228ae6b6-1975-4941-8ceb-0ebf3c72ff36.gif', NULL, 99, '2020-09-18 20:07:59', '2020-09-18 20:07:59', 'D:\\linkai\\uploadPath\\2020\\09\\18\\228ae6b6-1975-4941-8ceb-0ebf3c72ff36.gif', 0);
INSERT INTO `img` VALUES (36, '5-13050GS109.gif', 'image/gif', 6693, '/2020/09/18/7eb04b67-0428-4415-be39-0e7a2a3f03f8.gif', NULL, 100, '2020-09-18 20:08:27', '2020-09-18 20:08:27', 'D:\\linkai\\uploadPath\\2020\\09\\18\\7eb04b67-0428-4415-be39-0e7a2a3f03f8.gif', 0);
INSERT INTO `img` VALUES (37, '449c036f2510407c8fffdea6822c4523.png', 'image/png', 6232, '/2020/09/18/aaa68b36-f2ed-47c4-8bb6-5470c7b9a965.png', NULL, 100, '2020-09-18 20:08:27', '2020-09-18 20:08:27', 'D:\\linkai\\uploadPath\\2020\\09\\18\\aaa68b36-f2ed-47c4-8bb6-5470c7b9a965.png', 0);
INSERT INTO `img` VALUES (38, '449c036f2510407c8fffdea6822c4523.png', 'image/png', 6232, '/2020/09/18/48084296-014f-4b5b-8953-fb2f0daa4399.png', NULL, 101, '2020-09-18 20:08:52', '2020-09-18 20:08:52', 'D:\\linkai\\uploadPath\\2020\\09\\18\\48084296-014f-4b5b-8953-fb2f0daa4399.png', 0);
INSERT INTO `img` VALUES (39, '449c036f2510407c8fffdea6822c4523.png', 'image/png', 6232, '/2020/09/18/fec13f56-d8b7-4f07-a71e-7ec2892929a3.png', NULL, 103, '2020-09-18 20:09:34', '2020-09-18 20:09:34', 'D:\\linkai\\uploadPath\\2020\\09\\18\\fec13f56-d8b7-4f07-a71e-7ec2892929a3.png', 0);
INSERT INTO `img` VALUES (40, '22.png', 'image/png', 2828880, '/2020/09/28/6cd15577-4c8c-49c6-996f-a6b97eae090a.png', NULL, 104, '2020-09-28 18:53:55', '2020-09-28 18:53:55', 'D:\\linkai\\uploadPath\\2020\\09\\28\\6cd15577-4c8c-49c6-996f-a6b97eae090a.png', 0);
INSERT INTO `img` VALUES (41, '14.png', 'image/png', 656030, '/2020/09/28/b5786a2e-e590-40de-a710-e19b38bfbe99.png', NULL, 104, '2020-09-28 18:53:55', '2020-09-28 18:53:55', 'D:\\linkai\\uploadPath\\2020\\09\\28\\b5786a2e-e590-40de-a710-e19b38bfbe99.png', 0);
INSERT INTO `img` VALUES (42, '27.png', 'image/png', 865685, '/2020/09/29/8d44ca85-5bfc-4f4f-9be2-d911388d3b29.png', NULL, 105, '2020-09-29 18:48:34', '2020-09-29 18:48:34', 'D:\\linkai\\uploadPath\\2020\\09\\29\\8d44ca85-5bfc-4f4f-9be2-d911388d3b29.png', 0);
INSERT INTO `img` VALUES (43, '31.png', 'image/png', 718785, '/2020/09/29/fe08b2ae-3608-4e4a-960a-bb6dd8e9c8ef.png', NULL, 105, '2020-09-29 18:48:34', '2020-09-29 18:48:34', 'D:\\linkai\\uploadPath\\2020\\09\\29\\fe08b2ae-3608-4e4a-960a-bb6dd8e9c8ef.png', 0);
INSERT INTO `img` VALUES (44, '24.png', 'image/png', 509149, '/2020/09/29/d94d4d3d-b4f9-4e49-8bb9-7463c51887df.png', NULL, 106, '2020-09-29 18:52:27', '2020-09-29 18:52:27', 'D:\\linkai\\uploadPath\\2020\\09\\29\\d94d4d3d-b4f9-4e49-8bb9-7463c51887df.png', 0);
INSERT INTO `img` VALUES (45, '36.png', 'image/png', 1171969, '/2020/09/29/d402af68-4532-438e-9bdc-3aa05852d880.png', NULL, 106, '2020-09-29 18:52:27', '2020-09-29 18:52:27', 'D:\\linkai\\uploadPath\\2020\\09\\29\\d402af68-4532-438e-9bdc-3aa05852d880.png', 0);
INSERT INTO `img` VALUES (46, '35.png', 'image/png', 438698, '/2020/09/29/b27c822f-4384-4ee1-88fe-3b659d4fd0ca.png', NULL, 107, '2020-09-29 18:58:56', '2020-09-29 18:58:56', 'D:\\linkai\\uploadPath\\2020\\09\\29\\b27c822f-4384-4ee1-88fe-3b659d4fd0ca.png', 0);
INSERT INTO `img` VALUES (47, '39.png', 'image/png', 159206, '/2020/09/29/d93c76d1-cd57-4d8c-bffa-c83bb7c0c134.png', NULL, 107, '2020-09-29 18:58:56', '2020-09-29 18:58:56', 'D:\\linkai\\uploadPath\\2020\\09\\29\\d93c76d1-cd57-4d8c-bffa-c83bb7c0c134.png', 0);
INSERT INTO `img` VALUES (48, '微信图片_20200726194417.jpg', 'image/jpeg', 135817, '/2020/10/11/bde69283-fcc7-44a0-9983-333a20de170e.jpg', NULL, 108, '2020-10-11 11:16:24', '2020-10-11 11:16:24', 'D:\\linkai\\uploadPath\\2020\\10\\11\\bde69283-fcc7-44a0-9983-333a20de170e.jpg', 0);
INSERT INTO `img` VALUES (49, '数据库设计.png', 'image/png', 57009, '/2020/10/11/c20f93fa-7b94-4790-afb0-7cd2982dc94e.png', NULL, 108, '2020-10-11 11:16:24', '2020-10-11 11:16:24', 'D:\\linkai\\uploadPath\\2020\\10\\11\\c20f93fa-7b94-4790-afb0-7cd2982dc94e.png', 0);
INSERT INTO `img` VALUES (50, '微信图片_20200726194421.jpg', 'image/jpeg', 202553, '/2020/10/31/e8f50a56-e846-4e80-bf73-bce79b079290.jpg', NULL, 26, '2020-10-31 15:47:06', '2020-10-31 15:47:06', 'D:\\linkai\\uploadPath\\2020\\10\\31\\e8f50a56-e846-4e80-bf73-bce79b079290.jpg', 0);
INSERT INTO `img` VALUES (51, '微信图片_20200726194421.jpg', 'image/jpeg', 202553, '/2020/10/31/964864bf-20e0-473e-9acc-dae1ce5a7460.jpg', NULL, 26, '2020-10-31 15:56:47', '2020-10-31 15:56:47', 'D:\\linkai\\uploadPath\\2020\\10\\31\\964864bf-20e0-473e-9acc-dae1ce5a7460.jpg', 0);
INSERT INTO `img` VALUES (52, '微信图片_20200726194307.jpg', 'image/jpeg', 176292, '/2020/11/01/2eaaf32e-1ec4-430c-99e2-20a461f1ba07.jpg', NULL, 27, '2020-11-01 09:15:06', '2020-11-01 09:15:06', 'D:\\linkai\\uploadPath\\2020\\11\\01\\2eaaf32e-1ec4-430c-99e2-20a461f1ba07.jpg', 1);
INSERT INTO `img` VALUES (53, '微信图片_20200726194417.jpg', 'image/jpeg', 135817, '/2020/11/01/8eaa18e6-0617-47ca-927f-64471d995366.jpg', NULL, 27, '2020-11-01 09:15:06', '2020-11-01 09:15:06', 'D:\\linkai\\uploadPath\\2020\\11\\01\\8eaa18e6-0617-47ca-927f-64471d995366.jpg', 1);
INSERT INTO `img` VALUES (54, '微信图片_20200726194421.jpg', 'image/jpeg', 202553, '/2020/11/01/ba8dcc69-ca78-453a-b941-125f489c8afd.jpg', NULL, 27, '2020-11-01 09:15:06', '2020-11-01 09:15:06', 'D:\\linkai\\uploadPath\\2020\\11\\01\\ba8dcc69-ca78-453a-b941-125f489c8afd.jpg', 1);
INSERT INTO `img` VALUES (55, '数据库设计.png', 'image/png', 57009, '/2020/11/01/9b9741da-b797-43c8-91f5-f82014a93e9a.png', NULL, 27, '2020-11-01 09:37:53', '2020-11-01 09:37:53', 'D:\\linkai\\uploadPath\\2020\\11\\01\\9b9741da-b797-43c8-91f5-f82014a93e9a.png', 0);
INSERT INTO `img` VALUES (56, '微信图片_20200726194307.jpg', 'image/jpeg', 176292, '/2020/11/01/13691cad-d3ee-4273-89e1-d6ada2f28cc6.jpg', NULL, 27, '2020-11-01 09:37:53', '2020-11-01 09:37:53', 'D:\\linkai\\uploadPath\\2020\\11\\01\\13691cad-d3ee-4273-89e1-d6ada2f28cc6.jpg', 0);
INSERT INTO `img` VALUES (57, '数据库设计.png', 'image/png', 57009, '/2020/11/01/c28a7639-2b98-4f4f-b711-55f96f8c589a.png', NULL, 28, '2020-11-01 09:42:30', '2020-11-01 09:42:30', 'D:\\linkai\\uploadPath\\2020\\11\\01\\c28a7639-2b98-4f4f-b711-55f96f8c589a.png', 1);
INSERT INTO `img` VALUES (58, '微信图片_20200726194421.jpg', 'image/jpeg', 202553, '/2020/11/01/64cd3168-accd-47a2-9e25-e1d8a8b62bc3.jpg', NULL, 28, '2020-11-01 09:42:30', '2020-11-01 09:42:30', 'D:\\linkai\\uploadPath\\2020\\11\\01\\64cd3168-accd-47a2-9e25-e1d8a8b62bc3.jpg', 1);
INSERT INTO `img` VALUES (59, '微信图片_20200726194417.jpg', 'image/jpeg', 135817, '/2020/11/01/88c143cb-078a-47d0-971f-9b420a5d83df.jpg', NULL, 28, '2020-11-01 09:42:53', '2020-11-01 09:42:53', 'D:\\linkai\\uploadPath\\2020\\11\\01\\88c143cb-078a-47d0-971f-9b420a5d83df.jpg', 0);
INSERT INTO `img` VALUES (60, '微信图片_20200726194421.jpg', 'image/jpeg', 202553, '/2020/11/01/0a508cda-cbec-43c7-8dc1-155347f7cd24.jpg', NULL, 28, '2020-11-01 09:42:53', '2020-11-01 09:42:53', 'D:\\linkai\\uploadPath\\2020\\11\\01\\0a508cda-cbec-43c7-8dc1-155347f7cd24.jpg', 0);
INSERT INTO `img` VALUES (61, '微信图片_20200726194417.jpg', 'image/jpeg', 135817, '/2020/11/01/dee3d76d-6e63-412f-9680-eafec0464c48.jpg', NULL, 29, '2020-11-01 09:46:52', '2020-11-01 09:46:52', 'D:\\linkai\\uploadPath\\2020\\11\\01\\dee3d76d-6e63-412f-9680-eafec0464c48.jpg', 0);
INSERT INTO `img` VALUES (62, '微信图片_20200726194421.jpg', 'image/jpeg', 202553, '/2020/11/01/46df2473-171e-479b-bf27-bc2a3df7388f.jpg', NULL, 29, '2020-11-01 09:46:52', '2020-11-01 09:46:52', 'D:\\linkai\\uploadPath\\2020\\11\\01\\46df2473-171e-479b-bf27-bc2a3df7388f.jpg', 0);
INSERT INTO `img` VALUES (63, '数据库设计.png', 'image/png', 57009, '/2020/11/01/5b53dbb1-83c3-4064-adcf-c0c7b7b3ad44.png', NULL, 29, '2020-11-01 09:47:13', '2020-11-01 09:47:13', 'D:\\linkai\\uploadPath\\2020\\11\\01\\5b53dbb1-83c3-4064-adcf-c0c7b7b3ad44.png', 1);
INSERT INTO `img` VALUES (64, '微信图片_20200726194307.jpg', 'image/jpeg', 176292, '/2020/11/01/5269afc7-a3fe-41cd-9209-6318f46bc1ba.jpg', NULL, 29, '2020-11-01 09:47:13', '2020-11-01 09:47:13', 'D:\\linkai\\uploadPath\\2020\\11\\01\\5269afc7-a3fe-41cd-9209-6318f46bc1ba.jpg', 0);
INSERT INTO `img` VALUES (65, '微信图片_20200726194421.jpg', 'image/jpeg', 202553, '/2020/11/01/bf7abcdc-1062-4d2a-b425-b52af2dcb190.jpg', NULL, 30, '2020-11-01 09:54:04', '2020-11-01 09:54:04', 'D:\\linkai\\uploadPath\\2020\\11\\01\\bf7abcdc-1062-4d2a-b425-b52af2dcb190.jpg', 0);
INSERT INTO `img` VALUES (66, '微信图片_20200726194417.jpg', 'image/jpeg', 135817, '/2020/11/01/d62f9255-5087-492b-b806-0e403345647f.jpg', NULL, 30, '2020-11-01 09:54:04', '2020-11-01 09:54:04', 'D:\\linkai\\uploadPath\\2020\\11\\01\\d62f9255-5087-492b-b806-0e403345647f.jpg', 0);
INSERT INTO `img` VALUES (67, '微信图片_20200726194421.jpg', 'image/jpeg', 202553, '/2020/11/01/dc4fca2e-a8e0-4af4-9ef5-1f09afa349f3.jpg', NULL, 30, '2020-11-01 09:55:41', '2020-11-01 09:55:41', 'D:\\linkai\\uploadPath\\2020\\11\\01\\dc4fca2e-a8e0-4af4-9ef5-1f09afa349f3.jpg', 1);
INSERT INTO `img` VALUES (68, '微信图片_20200726194417.jpg', 'image/jpeg', 135817, '/2020/11/01/25724ac0-aa08-4ce1-8921-5bbbfcd8f5ff.jpg', NULL, 30, '2020-11-01 09:58:02', '2020-11-01 09:58:02', 'D:\\linkai\\uploadPath\\2020\\11\\01\\25724ac0-aa08-4ce1-8921-5bbbfcd8f5ff.jpg', 1);
INSERT INTO `img` VALUES (69, '数据库设计.png', 'image/png', 57009, '/2020/11/01/6e159976-1cb9-4406-8544-bd3879ec5e30.png', NULL, 30, '2020-11-01 10:01:08', '2020-11-01 10:01:08', 'D:\\linkai\\uploadPath\\2020\\11\\01\\6e159976-1cb9-4406-8544-bd3879ec5e30.png', 0);
INSERT INTO `img` VALUES (70, '微信图片_20200726194421.jpg', 'image/jpeg', 202553, '/2020/11/01/e2402569-137c-4133-9a32-326d3f59a53a.jpg', NULL, 30, '2020-11-01 10:01:08', '2020-11-01 10:01:08', 'D:\\linkai\\uploadPath\\2020\\11\\01\\e2402569-137c-4133-9a32-326d3f59a53a.jpg', 0);
INSERT INTO `img` VALUES (71, '微信图片_20200726194307.jpg', 'image/jpeg', 176292, '/2020/11/01/97435904-44db-45b5-8570-f542770792e8.jpg', NULL, 31, '2020-11-01 10:01:58', '2020-11-01 10:01:58', 'D:\\linkai\\uploadPath\\2020\\11\\01\\97435904-44db-45b5-8570-f542770792e8.jpg', 0);
INSERT INTO `img` VALUES (72, '微信图片_20200726194307.jpg', 'image/jpeg', 176292, '/2020/11/01/74b82402-65f2-479a-b5f9-e6a970cf4258.jpg', NULL, 32, '2020-11-01 10:04:01', '2020-11-01 10:04:01', 'D:\\linkai\\uploadPath\\2020\\11\\01\\74b82402-65f2-479a-b5f9-e6a970cf4258.jpg', 0);
INSERT INTO `img` VALUES (73, '微信图片_20200726194307.jpg', 'image/jpeg', 176292, '/2020/11/01/5d343e40-4db9-4809-86ff-bc48b28e6039.jpg', NULL, 33, '2020-11-01 10:07:20', '2020-11-01 10:07:20', 'D:\\linkai\\uploadPath\\2020\\11\\01\\5d343e40-4db9-4809-86ff-bc48b28e6039.jpg', 1);
INSERT INTO `img` VALUES (74, '微信图片_20200726194417.jpg', 'image/jpeg', 135817, '/2020/11/01/e6c47f1a-ec4f-4715-abee-7f5775569efd.jpg', NULL, 33, '2020-11-01 10:07:20', '2020-11-01 10:07:20', 'D:\\linkai\\uploadPath\\2020\\11\\01\\e6c47f1a-ec4f-4715-abee-7f5775569efd.jpg', 1);
INSERT INTO `img` VALUES (75, '微信图片_20200726194421.jpg', 'image/jpeg', 202553, '/2020/11/01/cea7d701-a1fa-4398-b88c-44510cf2c851.jpg', NULL, 33, '2020-11-01 10:07:20', '2020-11-01 10:07:20', 'D:\\linkai\\uploadPath\\2020\\11\\01\\cea7d701-a1fa-4398-b88c-44510cf2c851.jpg', 1);
INSERT INTO `img` VALUES (76, '数据库设计.png', 'image/png', 57009, '/2020/11/01/482c194d-433d-4dfe-8e6f-d1385a6c1ab0.png', NULL, 33, '2020-11-01 10:08:54', '2020-11-01 10:08:54', 'D:\\linkai\\uploadPath\\2020\\11\\01\\482c194d-433d-4dfe-8e6f-d1385a6c1ab0.png', 1);
INSERT INTO `img` VALUES (77, '数据库设计.png', 'image/png', 57009, '/2020/11/01/18daff7c-4eff-4638-b35f-8f1c179472b7.png', NULL, 33, '2020-11-01 10:09:11', '2020-11-01 10:09:11', 'D:\\linkai\\uploadPath\\2020\\11\\01\\18daff7c-4eff-4638-b35f-8f1c179472b7.png', 1);
INSERT INTO `img` VALUES (78, '微信图片_20200726194417.jpg', 'image/jpeg', 135817, '/2020/11/01/e15c1272-6403-437a-ae4e-23ba41594d97.jpg', NULL, 33, '2020-11-01 10:09:20', '2020-11-01 10:09:20', 'D:\\linkai\\uploadPath\\2020\\11\\01\\e15c1272-6403-437a-ae4e-23ba41594d97.jpg', 1);
INSERT INTO `img` VALUES (79, '数据库设计.png', 'image/png', 57009, '/2020/11/01/00f1e516-362e-46c5-9cb7-bd5d8eca7661.png', NULL, 33, '2020-11-01 10:13:21', '2020-11-01 10:13:21', 'D:\\linkai\\uploadPath\\2020\\11\\01\\00f1e516-362e-46c5-9cb7-bd5d8eca7661.png', 0);
INSERT INTO `img` VALUES (80, '微信图片_20200726194421.jpg', 'image/jpeg', 202553, '/2020/11/01/4c440d72-447a-40c2-a618-ae456d3b347c.jpg', NULL, 34, '2020-11-01 10:19:04', '2020-11-01 10:19:04', 'D:\\linkai\\uploadPath\\2020\\11\\01\\4c440d72-447a-40c2-a618-ae456d3b347c.jpg', 1);
INSERT INTO `img` VALUES (81, '微信图片_20200726194307.jpg', 'image/jpeg', 176292, '/2020/11/01/cbc9338e-27b5-4539-9e8a-ec817b249647.jpg', NULL, 34, '2020-11-01 10:19:04', '2020-11-01 10:19:04', 'D:\\linkai\\uploadPath\\2020\\11\\01\\cbc9338e-27b5-4539-9e8a-ec817b249647.jpg', 1);
INSERT INTO `img` VALUES (82, '微信图片_20200726194417.jpg', 'image/jpeg', 135817, '/2020/11/01/36d8eebc-96da-4e12-bdba-a71ecc4db548.jpg', NULL, 34, '2020-11-01 10:19:04', '2020-11-01 10:19:04', 'D:\\linkai\\uploadPath\\2020\\11\\01\\36d8eebc-96da-4e12-bdba-a71ecc4db548.jpg', 1);
INSERT INTO `img` VALUES (83, '数据库设计.png', 'image/png', 57009, '/2020/11/01/4c768331-5840-4a0b-9416-1a08cbd1673b.png', NULL, 34, '2020-11-01 10:19:25', '2020-11-01 10:19:25', 'D:\\linkai\\uploadPath\\2020\\11\\01\\4c768331-5840-4a0b-9416-1a08cbd1673b.png', 1);
INSERT INTO `img` VALUES (84, '数据库设计.png', 'image/png', 57009, '/2020/11/01/127ad299-0a5b-4f0d-9da2-7ab86bd9e662.png', NULL, 34, '2020-11-01 10:20:26', '2020-11-01 10:20:26', 'D:\\linkai\\uploadPath\\2020\\11\\01\\127ad299-0a5b-4f0d-9da2-7ab86bd9e662.png', 1);
INSERT INTO `img` VALUES (85, '微信图片_20200726194421.jpg', 'image/jpeg', 202553, '/2020/11/01/01d57cb4-2716-48ca-a9d1-a1573539e639.jpg', NULL, 34, '2020-11-01 10:20:26', '2020-11-01 10:20:26', 'D:\\linkai\\uploadPath\\2020\\11\\01\\01d57cb4-2716-48ca-a9d1-a1573539e639.jpg', 1);
INSERT INTO `img` VALUES (86, '微信图片_20200726194421.jpg', 'image/jpeg', 202553, '/2020/11/01/23d23966-587d-440f-aef8-0423226d44af.jpg', NULL, 34, '2020-11-01 10:20:41', '2020-11-01 10:20:41', 'D:\\linkai\\uploadPath\\2020\\11\\01\\23d23966-587d-440f-aef8-0423226d44af.jpg', 1);
INSERT INTO `img` VALUES (87, '数据库设计.png', 'image/png', 57009, '/2020/11/01/b27fdeb4-419b-4f7e-a6f3-1de9207e205e.png', NULL, 34, '2020-11-01 10:20:45', '2020-11-01 10:20:45', 'D:\\linkai\\uploadPath\\2020\\11\\01\\b27fdeb4-419b-4f7e-a6f3-1de9207e205e.png', 1);
INSERT INTO `img` VALUES (88, '微信图片_20200726194417.jpg', 'image/jpeg', 135817, '/2020/11/01/dd8ec4a5-73ba-4e05-b773-bbb5c5ceabdc.jpg', NULL, 34, '2020-11-01 10:21:04', '2020-11-01 10:21:04', 'D:\\linkai\\uploadPath\\2020\\11\\01\\dd8ec4a5-73ba-4e05-b773-bbb5c5ceabdc.jpg', 1);
INSERT INTO `img` VALUES (89, '微信图片_20200726194421.jpg', 'image/jpeg', 202553, '/2020/11/01/d8ee42e9-1613-4d32-8030-af54aa5c3424.jpg', NULL, 34, '2020-11-01 10:21:04', '2020-11-01 10:21:04', 'D:\\linkai\\uploadPath\\2020\\11\\01\\d8ee42e9-1613-4d32-8030-af54aa5c3424.jpg', 1);
INSERT INTO `img` VALUES (90, '微信图片_20200726194307.jpg', 'image/jpeg', 176292, '/2020/11/01/35d1b025-01fa-4926-a906-fd18f50cdd48.jpg', NULL, 34, '2020-11-01 10:21:04', '2020-11-01 10:21:04', 'D:\\linkai\\uploadPath\\2020\\11\\01\\35d1b025-01fa-4926-a906-fd18f50cdd48.jpg', 1);
INSERT INTO `img` VALUES (91, '数据库设计.png', 'image/png', 57009, '/2020/11/01/3659da7c-4a44-4e5a-8f31-4d75ef052f77.png', NULL, 34, '2020-11-01 10:21:34', '2020-11-01 10:21:34', 'D:\\linkai\\uploadPath\\2020\\11\\01\\3659da7c-4a44-4e5a-8f31-4d75ef052f77.png', 1);
INSERT INTO `img` VALUES (92, '微信图片_20200726194307.jpg', 'image/jpeg', 176292, '/2020/11/01/6123a19b-ae76-4b85-9c3e-c00c80e15db7.jpg', NULL, 34, '2020-11-01 10:23:15', '2020-11-01 10:23:15', 'D:\\linkai\\uploadPath\\2020\\11\\01\\6123a19b-ae76-4b85-9c3e-c00c80e15db7.jpg', 1);
INSERT INTO `img` VALUES (93, '数据库设计.png', 'image/png', 57009, '/2020/11/01/141d6c25-3996-4cd0-a357-142e1e25512c.png', NULL, 34, '2020-11-01 10:24:27', '2020-11-01 10:24:27', 'D:\\linkai\\uploadPath\\2020\\11\\01\\141d6c25-3996-4cd0-a357-142e1e25512c.png', 1);
INSERT INTO `img` VALUES (94, '数据库设计.png', 'image/png', 57009, '/2020/11/01/4a895443-dc83-432e-abe3-9a5807944166.png', NULL, 34, '2020-11-01 10:25:20', '2020-11-01 10:25:20', 'D:\\linkai\\uploadPath\\2020\\11\\01\\4a895443-dc83-432e-abe3-9a5807944166.png', 0);
INSERT INTO `img` VALUES (95, '微信图片_20200726194417.jpg', 'image/jpeg', 135817, '/2020/11/01/064d12e8-4edd-4b8e-b478-cab30651f920.jpg', NULL, 34, '2020-11-01 10:25:20', '2020-11-01 10:25:20', 'D:\\linkai\\uploadPath\\2020\\11\\01\\064d12e8-4edd-4b8e-b478-cab30651f920.jpg', 0);
INSERT INTO `img` VALUES (96, '微信图片_20200726194421.jpg', 'image/jpeg', 202553, '/2020/11/01/82bc67f2-9047-4555-b3c6-e0f7fc434910.jpg', NULL, 34, '2020-11-01 10:25:20', '2020-11-01 10:25:20', 'D:\\linkai\\uploadPath\\2020\\11\\01\\82bc67f2-9047-4555-b3c6-e0f7fc434910.jpg', 0);
INSERT INTO `img` VALUES (97, '数据库设计.png', 'image/png', 57009, '/2020/11/01/77a94a85-d04a-4046-b4f5-e984bbe0009f.png', NULL, 35, '2020-11-01 10:25:56', '2020-11-01 10:25:56', 'D:\\linkai\\uploadPath\\2020\\11\\01\\77a94a85-d04a-4046-b4f5-e984bbe0009f.png', 1);
INSERT INTO `img` VALUES (98, '微信图片_20200726194421.jpg', 'image/jpeg', 202553, '/2020/11/01/43d961bf-ef83-4aec-bb85-b25ae15d85a1.jpg', NULL, 35, '2020-11-01 10:25:56', '2020-11-01 10:25:56', 'D:\\linkai\\uploadPath\\2020\\11\\01\\43d961bf-ef83-4aec-bb85-b25ae15d85a1.jpg', 1);
INSERT INTO `img` VALUES (99, '微信图片_20200726194417.jpg', 'image/jpeg', 135817, '/2020/11/01/cf3e3412-3a44-477e-a02e-21bd8265c39d.jpg', NULL, 35, '2020-11-01 10:26:19', '2020-11-01 10:26:19', 'D:\\linkai\\uploadPath\\2020\\11\\01\\cf3e3412-3a44-477e-a02e-21bd8265c39d.jpg', 0);
INSERT INTO `img` VALUES (100, '微信图片_20200726194307.jpg', 'image/jpeg', 176292, '/2020/11/01/a33068a1-3d83-4102-80c8-628646a2cb03.jpg', NULL, 35, '2020-11-01 10:26:19', '2020-11-01 10:26:19', 'D:\\linkai\\uploadPath\\2020\\11\\01\\a33068a1-3d83-4102-80c8-628646a2cb03.jpg', 1);
INSERT INTO `img` VALUES (101, '微信图片_20200726194421.jpg', 'image/jpeg', 202553, '/2020/11/01/ea9a82f7-6b9d-4b31-9e75-a5aa41532221.jpg', NULL, 35, '2020-11-01 10:26:19', '2020-11-01 10:26:19', 'D:\\linkai\\uploadPath\\2020\\11\\01\\ea9a82f7-6b9d-4b31-9e75-a5aa41532221.jpg', 1);
INSERT INTO `img` VALUES (102, '微信图片_20200726194417.jpg', 'image/jpeg', 135817, '/2020/11/01/0271ce67-98ff-4f7d-b1fb-dc6aca4165a3.jpg', NULL, 35, '2020-11-01 10:26:37', '2020-11-01 10:26:37', 'D:\\linkai\\uploadPath\\2020\\11\\01\\0271ce67-98ff-4f7d-b1fb-dc6aca4165a3.jpg', 0);
INSERT INTO `img` VALUES (103, '微信图片_20200726194421.jpg', 'image/jpeg', 202553, '/2020/11/01/2f4253fa-738c-4999-b550-f0a3504ecf39.jpg', NULL, 35, '2020-11-01 10:26:37', '2020-11-01 10:26:37', 'D:\\linkai\\uploadPath\\2020\\11\\01\\2f4253fa-738c-4999-b550-f0a3504ecf39.jpg', 0);
INSERT INTO `img` VALUES (104, '微信图片_20200726194307.jpg', 'image/jpeg', 176292, '/2020/11/01/0afe505e-1b31-4c4a-b1bd-350046703056.jpg', NULL, 35, '2020-11-01 10:26:38', '2020-11-01 10:26:38', 'D:\\linkai\\uploadPath\\2020\\11\\01\\0afe505e-1b31-4c4a-b1bd-350046703056.jpg', 1);
INSERT INTO `img` VALUES (105, '微信图片_20200726194421.jpg', 'image/jpeg', 202553, '/2020/11/01/d6b57711-a19c-41cc-92c4-c538652d0134.jpg', NULL, 35, '2020-11-01 10:27:02', '2020-11-01 10:27:02', 'D:\\linkai\\uploadPath\\2020\\11\\01\\d6b57711-a19c-41cc-92c4-c538652d0134.jpg', 1);
INSERT INTO `img` VALUES (106, '微信图片_20200726194417.jpg', 'image/jpeg', 135817, '/2020/11/01/37e4f176-9dfd-41c9-8dc3-259fffcb75d7.jpg', NULL, 35, '2020-11-01 10:27:02', '2020-11-01 10:27:02', 'D:\\linkai\\uploadPath\\2020\\11\\01\\37e4f176-9dfd-41c9-8dc3-259fffcb75d7.jpg', 1);
INSERT INTO `img` VALUES (107, '微信图片_20200726194307.jpg', 'image/jpeg', 176292, '/2020/11/01/cb3b198d-cb5a-4254-b59c-539531f672f5.jpg', NULL, 35, '2020-11-01 10:27:02', '2020-11-01 10:27:02', 'D:\\linkai\\uploadPath\\2020\\11\\01\\cb3b198d-cb5a-4254-b59c-539531f672f5.jpg', 1);
INSERT INTO `img` VALUES (108, '微信图片_20200726194307.jpg', 'image/jpeg', 176292, '/2020/11/01/650be8f7-91b8-4758-84bf-f9181ae6fcb0.jpg', NULL, 35, '2020-11-01 10:27:16', '2020-11-01 10:27:16', 'D:\\linkai\\uploadPath\\2020\\11\\01\\650be8f7-91b8-4758-84bf-f9181ae6fcb0.jpg', 1);
INSERT INTO `img` VALUES (109, '微信图片_20200726194421.jpg', 'image/jpeg', 202553, '/2020/11/01/1f115b1f-5841-4fb4-848d-3b83b2c307d5.jpg', NULL, 35, '2020-11-01 10:27:16', '2020-11-01 10:27:16', 'D:\\linkai\\uploadPath\\2020\\11\\01\\1f115b1f-5841-4fb4-848d-3b83b2c307d5.jpg', 1);
INSERT INTO `img` VALUES (110, '数据库设计.png', 'image/png', 57009, '/2020/11/01/5589b3d7-b17c-44d7-b877-793573c7930e.png', NULL, 35, '2020-11-01 10:27:16', '2020-11-01 10:27:16', 'D:\\linkai\\uploadPath\\2020\\11\\01\\5589b3d7-b17c-44d7-b877-793573c7930e.png', 1);
INSERT INTO `img` VALUES (111, '28.png', 'image/png', 2945603, '/2020/11/01/603a9f85-5808-460a-b8e7-cd958e106b77.png', NULL, 35, '2020-11-01 10:28:23', '2020-11-01 10:28:23', 'D:\\linkai\\uploadPath\\2020\\11\\01\\603a9f85-5808-460a-b8e7-cd958e106b77.png', 0);
INSERT INTO `img` VALUES (112, '24.png', 'image/png', 509149, '/2020/11/01/adec9621-e35a-426e-86cf-4ed426c554e0.png', NULL, 35, '2020-11-01 10:28:23', '2020-11-01 10:28:23', 'D:\\linkai\\uploadPath\\2020\\11\\01\\adec9621-e35a-426e-86cf-4ed426c554e0.png', 0);
INSERT INTO `img` VALUES (113, '23.png', 'image/png', 718383, '/2020/11/01/ca43c4bc-6e44-429f-b0c4-f140b3dd73b7.png', NULL, 35, '2020-11-01 10:28:23', '2020-11-01 10:28:23', 'D:\\linkai\\uploadPath\\2020\\11\\01\\ca43c4bc-6e44-429f-b0c4-f140b3dd73b7.png', 0);
INSERT INTO `img` VALUES (114, '10.png', 'image/png', 593360, '/2020/11/01/aade5b85-ff31-4a28-a78d-6782f76f539e.png', NULL, 36, '2020-11-01 10:29:12', '2020-11-01 10:29:12', 'D:\\linkai\\uploadPath\\2020\\11\\01\\aade5b85-ff31-4a28-a78d-6782f76f539e.png', 0);
INSERT INTO `img` VALUES (115, '11.png', 'image/png', 446682, '/2020/11/01/1debcd97-b4d4-45bf-b093-c6ed580f504c.png', NULL, 36, '2020-11-01 10:29:12', '2020-11-01 10:29:12', 'D:\\linkai\\uploadPath\\2020\\11\\01\\1debcd97-b4d4-45bf-b093-c6ed580f504c.png', 0);
INSERT INTO `img` VALUES (116, '12.png', 'image/png', 412963, '/2020/11/01/6ba898f9-f9d6-4e90-953d-491efd6cab8c.png', NULL, 36, '2020-11-01 10:29:12', '2020-11-01 10:29:12', 'D:\\linkai\\uploadPath\\2020\\11\\01\\6ba898f9-f9d6-4e90-953d-491efd6cab8c.png', 0);
INSERT INTO `img` VALUES (117, '13.png', 'image/png', 947665, '/2020/11/04/ea362ad4-ba38-4eea-bce7-0ea4d61e1e75.png', NULL, NULL, '2020-11-04 20:31:08', '2020-11-04 20:31:08', 'D:\\linkai\\uploadPath\\2020\\11\\04\\ea362ad4-ba38-4eea-bce7-0ea4d61e1e75.png', 0);
INSERT INTO `img` VALUES (118, '14.png', 'image/png', 656030, '/2020/11/04/7c1462a9-b67e-468e-ad77-fff2423582ee.png', NULL, NULL, '2020-11-04 20:31:08', '2020-11-04 20:31:08', 'D:\\linkai\\uploadPath\\2020\\11\\04\\7c1462a9-b67e-468e-ad77-fff2423582ee.png', 0);
INSERT INTO `img` VALUES (119, '12.png', 'image/png', 412963, '/2020/11/04/61cbb56d-5960-4bdc-9a0c-0642bbbe55de.png', NULL, NULL, '2020-11-04 20:31:08', '2020-11-04 20:31:08', 'D:\\linkai\\uploadPath\\2020\\11\\04\\61cbb56d-5960-4bdc-9a0c-0642bbbe55de.png', 0);
INSERT INTO `img` VALUES (120, '8.png', 'image/png', 1689370, '/2020/11/16/89140c39-562f-4272-b8b8-2717de14152e.png', NULL, 109, '2020-11-16 20:09:48', '2020-11-16 20:09:48', 'D:\\linkai\\uploadPath\\2020\\11\\16\\89140c39-562f-4272-b8b8-2717de14152e.png', 1);
INSERT INTO `img` VALUES (121, '7.png', 'image/png', 756645, '/2020/11/16/4413e697-2edf-465d-8ebc-7b83aade273f.png', NULL, 109, '2020-11-16 20:09:48', '2020-11-16 20:09:48', 'D:\\linkai\\uploadPath\\2020\\11\\16\\4413e697-2edf-465d-8ebc-7b83aade273f.png', 1);
INSERT INTO `img` VALUES (122, '7.png', 'image/png', 756645, '/2020/11/16/93b69fcc-5845-4b4e-94ef-5b81f13a2402.png', NULL, 109, '2020-11-16 20:10:18', '2020-11-16 20:10:18', 'D:\\linkai\\uploadPath\\2020\\11\\16\\93b69fcc-5845-4b4e-94ef-5b81f13a2402.png', 1);
INSERT INTO `img` VALUES (123, '6.png', 'image/png', 643903, '/2020/11/16/2f17d5cd-ea95-41d1-8bf9-8763ff2ce4a2.png', NULL, 109, '2020-11-16 20:10:18', '2020-11-16 20:10:18', 'D:\\linkai\\uploadPath\\2020\\11\\16\\2f17d5cd-ea95-41d1-8bf9-8763ff2ce4a2.png', 1);
INSERT INTO `img` VALUES (124, '14.png', 'image/png', 656030, '/2020/11/16/21bf2dca-215a-4636-8e22-44452ad67a7d.png', NULL, 109, '2020-11-16 20:10:27', '2020-11-16 20:10:27', 'D:\\linkai\\uploadPath\\2020\\11\\16\\21bf2dca-215a-4636-8e22-44452ad67a7d.png', 1);
INSERT INTO `img` VALUES (125, '13.png', 'image/png', 947665, '/2020/11/16/48d71cd9-f085-44ab-88d2-52225d00c216.png', NULL, 109, '2020-11-16 20:10:27', '2020-11-16 20:10:27', 'D:\\linkai\\uploadPath\\2020\\11\\16\\48d71cd9-f085-44ab-88d2-52225d00c216.png', 1);
INSERT INTO `img` VALUES (126, '8.png', 'image/png', 1689370, '/2020/11/16/3c2cf324-8fb6-4d8c-82ce-f075b12c8fc1.png', NULL, 109, '2020-11-16 20:10:37', '2020-11-16 20:10:37', 'D:\\linkai\\uploadPath\\2020\\11\\16\\3c2cf324-8fb6-4d8c-82ce-f075b12c8fc1.png', 0);
INSERT INTO `img` VALUES (127, '9.png', 'image/png', 1906056, '/2020/11/16/22f9e4dd-b4c5-4279-ab3e-447121b4ad84.png', NULL, 109, '2020-11-16 20:10:38', '2020-11-16 20:10:38', 'D:\\linkai\\uploadPath\\2020\\11\\16\\22f9e4dd-b4c5-4279-ab3e-447121b4ad84.png', 0);
INSERT INTO `img` VALUES (128, '6.png', 'image/png', 643903, '/2020/11/16/40e85195-4179-4a77-a005-4028b4a440e2.png', NULL, 110, '2020-11-16 20:12:54', '2020-11-16 20:12:54', 'D:\\linkai\\uploadPath\\2020\\11\\16\\40e85195-4179-4a77-a005-4028b4a440e2.png', 0);
INSERT INTO `img` VALUES (129, '13.png', 'image/png', 947665, '/2020/11/16/14ad7360-636a-40c9-8e1f-00263d4e2e37.png', NULL, 110, '2020-11-16 20:12:54', '2020-11-16 20:12:54', 'D:\\linkai\\uploadPath\\2020\\11\\16\\14ad7360-636a-40c9-8e1f-00263d4e2e37.png', 0);

-- ----------------------------
-- Table structure for platform
-- ----------------------------
DROP TABLE IF EXISTS `platform`;
CREATE TABLE `platform`  (
  `plat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品服务平台',
  `plat_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务平台名称',
  `plat_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务平台简介',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `deleted` int(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `plat_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网站url',
  PRIMARY KEY (`plat_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of platform
-- ----------------------------
INSERT INTO `platform` VALUES (1, '淘宝', '淘宝平台', '2020-09-06 10:27:48', '2020-09-06 10:27:48', 0, 'https://www.baidu.com/');
INSERT INTO `platform` VALUES (2, '拼多多', '拼多多平台', '2020-09-06 10:32:06', '2020-09-06 10:32:06', 0, 'www.baidu。com');
INSERT INTO `platform` VALUES (3, '京东', '京东平台', '2020-09-08 17:17:46', '2020-09-08 17:17:46', 0, 'goudong.com');

-- ----------------------------
-- Table structure for pro_color
-- ----------------------------
DROP TABLE IF EXISTS `pro_color`;
CREATE TABLE `pro_color`  (
  `pro_color_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `color_id` int(11) NULL DEFAULT NULL COMMENT '颜色id',
  `pro_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`pro_color_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_color
-- ----------------------------
INSERT INTO `pro_color` VALUES (1, 1, 82, 0);
INSERT INTO `pro_color` VALUES (2, 1, 82, 0);
INSERT INTO `pro_color` VALUES (3, 1, 83, 0);
INSERT INTO `pro_color` VALUES (4, 1, 83, 0);
INSERT INTO `pro_color` VALUES (5, 1, 84, 0);
INSERT INTO `pro_color` VALUES (6, 1, 84, 0);
INSERT INTO `pro_color` VALUES (7, 3, 85, 0);
INSERT INTO `pro_color` VALUES (8, 3, 85, 0);
INSERT INTO `pro_color` VALUES (9, 1, 86, 0);
INSERT INTO `pro_color` VALUES (10, 2, 86, 0);
INSERT INTO `pro_color` VALUES (11, 2, 87, 0);
INSERT INTO `pro_color` VALUES (12, 3, 87, 0);
INSERT INTO `pro_color` VALUES (13, 1, 88, 0);
INSERT INTO `pro_color` VALUES (14, 2, 88, 0);
INSERT INTO `pro_color` VALUES (15, 1, 89, 0);
INSERT INTO `pro_color` VALUES (16, 2, 89, 0);
INSERT INTO `pro_color` VALUES (17, 1, 90, 0);
INSERT INTO `pro_color` VALUES (18, 2, 90, 0);
INSERT INTO `pro_color` VALUES (19, 2, 91, 0);
INSERT INTO `pro_color` VALUES (20, 3, 91, 0);
INSERT INTO `pro_color` VALUES (21, 2, 92, 0);
INSERT INTO `pro_color` VALUES (22, 3, 92, 0);
INSERT INTO `pro_color` VALUES (23, 1, 93, 0);
INSERT INTO `pro_color` VALUES (24, 2, 93, 0);
INSERT INTO `pro_color` VALUES (25, 1, 94, 0);
INSERT INTO `pro_color` VALUES (26, 2, 94, 0);
INSERT INTO `pro_color` VALUES (27, 1, 95, 0);
INSERT INTO `pro_color` VALUES (28, 2, 95, 0);
INSERT INTO `pro_color` VALUES (29, 2, 96, 0);
INSERT INTO `pro_color` VALUES (30, 3, 96, 0);
INSERT INTO `pro_color` VALUES (31, 2, 97, 0);
INSERT INTO `pro_color` VALUES (32, 3, 97, 0);
INSERT INTO `pro_color` VALUES (33, 1, 98, 0);
INSERT INTO `pro_color` VALUES (34, 2, 98, 0);
INSERT INTO `pro_color` VALUES (35, 3, 99, 0);
INSERT INTO `pro_color` VALUES (36, 4, 99, 0);
INSERT INTO `pro_color` VALUES (37, 1, 100, 0);
INSERT INTO `pro_color` VALUES (38, 2, 100, 0);
INSERT INTO `pro_color` VALUES (39, 1, 101, 0);
INSERT INTO `pro_color` VALUES (40, 2, 102, 0);
INSERT INTO `pro_color` VALUES (41, 2, 103, 0);
INSERT INTO `pro_color` VALUES (42, 3, 103, 0);
INSERT INTO `pro_color` VALUES (43, 1, 104, 0);
INSERT INTO `pro_color` VALUES (44, 2, 104, 0);
INSERT INTO `pro_color` VALUES (45, 1, 105, 0);
INSERT INTO `pro_color` VALUES (46, 2, 105, 0);
INSERT INTO `pro_color` VALUES (47, 2, 106, 0);
INSERT INTO `pro_color` VALUES (48, 3, 106, 0);
INSERT INTO `pro_color` VALUES (49, 3, 107, 0);
INSERT INTO `pro_color` VALUES (50, 4, 107, 0);
INSERT INTO `pro_color` VALUES (51, 2, 108, 0);
INSERT INTO `pro_color` VALUES (52, 3, 108, 0);
INSERT INTO `pro_color` VALUES (53, 2, 109, 0);
INSERT INTO `pro_color` VALUES (54, 3, 109, 0);
INSERT INTO `pro_color` VALUES (55, 1, 110, 0);
INSERT INTO `pro_color` VALUES (56, 2, 110, 0);

-- ----------------------------
-- Table structure for pro_size
-- ----------------------------
DROP TABLE IF EXISTS `pro_size`;
CREATE TABLE `pro_size`  (
  `pro_size_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `size_id` int(11) NOT NULL COMMENT '尺寸id',
  `pro_id` int(11) NOT NULL COMMENT '产品id',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`pro_size_id`) USING BTREE,
  INDEX `size_id`(`size_id`) USING BTREE,
  INDEX `pro_id`(`pro_id`) USING BTREE,
  CONSTRAINT `pro_size_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_size
-- ----------------------------
INSERT INTO `pro_size` VALUES (1, 7, 25, 0);
INSERT INTO `pro_size` VALUES (2, 3, 39, 0);
INSERT INTO `pro_size` VALUES (3, 3, 39, 0);
INSERT INTO `pro_size` VALUES (4, 3, 39, 0);
INSERT INTO `pro_size` VALUES (5, 4, 40, 0);
INSERT INTO `pro_size` VALUES (6, 4, 40, 0);
INSERT INTO `pro_size` VALUES (7, 4, 40, 0);
INSERT INTO `pro_size` VALUES (8, 4, 40, 0);
INSERT INTO `pro_size` VALUES (9, 2, 41, 1);
INSERT INTO `pro_size` VALUES (10, 3, 41, 0);
INSERT INTO `pro_size` VALUES (11, 8, 55, 0);
INSERT INTO `pro_size` VALUES (12, 3, 56, 0);
INSERT INTO `pro_size` VALUES (13, 4, 56, 0);
INSERT INTO `pro_size` VALUES (14, 5, 57, 0);
INSERT INTO `pro_size` VALUES (15, 6, 57, 0);
INSERT INTO `pro_size` VALUES (16, 3, 58, 0);
INSERT INTO `pro_size` VALUES (17, 4, 58, 0);
INSERT INTO `pro_size` VALUES (18, 3, 59, 0);
INSERT INTO `pro_size` VALUES (19, 4, 59, 0);
INSERT INTO `pro_size` VALUES (20, 3, 60, 0);
INSERT INTO `pro_size` VALUES (21, 4, 60, 0);
INSERT INTO `pro_size` VALUES (22, 4, 61, 0);
INSERT INTO `pro_size` VALUES (23, 5, 61, 0);
INSERT INTO `pro_size` VALUES (24, 4, 62, 0);
INSERT INTO `pro_size` VALUES (25, 5, 62, 0);
INSERT INTO `pro_size` VALUES (26, 3, 63, 0);
INSERT INTO `pro_size` VALUES (27, 6, 63, 0);
INSERT INTO `pro_size` VALUES (28, 3, 64, 0);
INSERT INTO `pro_size` VALUES (29, 4, 64, 0);
INSERT INTO `pro_size` VALUES (30, 4, 65, 0);
INSERT INTO `pro_size` VALUES (31, 5, 65, 0);
INSERT INTO `pro_size` VALUES (32, 4, 66, 0);
INSERT INTO `pro_size` VALUES (33, 3, 67, 0);
INSERT INTO `pro_size` VALUES (34, 4, 67, 0);
INSERT INTO `pro_size` VALUES (35, 6, 68, 0);
INSERT INTO `pro_size` VALUES (36, 7, 68, 0);
INSERT INTO `pro_size` VALUES (37, 3, 69, 0);
INSERT INTO `pro_size` VALUES (38, 4, 69, 0);
INSERT INTO `pro_size` VALUES (39, 3, 69, 0);
INSERT INTO `pro_size` VALUES (40, 4, 69, 0);
INSERT INTO `pro_size` VALUES (41, 4, 70, 0);
INSERT INTO `pro_size` VALUES (42, 5, 70, 0);
INSERT INTO `pro_size` VALUES (43, 5, 71, 0);
INSERT INTO `pro_size` VALUES (44, 4, 72, 0);
INSERT INTO `pro_size` VALUES (45, 5, 72, 0);
INSERT INTO `pro_size` VALUES (46, 4, 73, 0);
INSERT INTO `pro_size` VALUES (47, 5, 74, 0);
INSERT INTO `pro_size` VALUES (48, 6, 74, 0);
INSERT INTO `pro_size` VALUES (49, 5, 75, 0);
INSERT INTO `pro_size` VALUES (50, 3, 76, 0);
INSERT INTO `pro_size` VALUES (51, 4, 76, 0);
INSERT INTO `pro_size` VALUES (52, 5, 77, 0);
INSERT INTO `pro_size` VALUES (53, 5, 78, 0);
INSERT INTO `pro_size` VALUES (54, 6, 78, 0);
INSERT INTO `pro_size` VALUES (55, 3, 79, 0);
INSERT INTO `pro_size` VALUES (56, 4, 79, 0);
INSERT INTO `pro_size` VALUES (57, 1, 79, 0);
INSERT INTO `pro_size` VALUES (58, 1, 80, 0);
INSERT INTO `pro_size` VALUES (59, 2, 80, 0);
INSERT INTO `pro_size` VALUES (60, 1, 82, 0);
INSERT INTO `pro_size` VALUES (61, 1, 82, 0);
INSERT INTO `pro_size` VALUES (62, 1, 83, 0);
INSERT INTO `pro_size` VALUES (63, 1, 83, 0);
INSERT INTO `pro_size` VALUES (64, 1, 84, 0);
INSERT INTO `pro_size` VALUES (65, 1, 84, 0);
INSERT INTO `pro_size` VALUES (66, 5, 85, 0);
INSERT INTO `pro_size` VALUES (67, 5, 85, 0);
INSERT INTO `pro_size` VALUES (68, 3, 86, 0);
INSERT INTO `pro_size` VALUES (69, 5, 86, 0);
INSERT INTO `pro_size` VALUES (70, 3, 87, 0);
INSERT INTO `pro_size` VALUES (71, 5, 87, 0);
INSERT INTO `pro_size` VALUES (72, 3, 88, 0);
INSERT INTO `pro_size` VALUES (73, 5, 88, 0);
INSERT INTO `pro_size` VALUES (74, 3, 89, 0);
INSERT INTO `pro_size` VALUES (75, 5, 89, 0);
INSERT INTO `pro_size` VALUES (76, 3, 90, 0);
INSERT INTO `pro_size` VALUES (77, 4, 90, 0);
INSERT INTO `pro_size` VALUES (78, 3, 91, 0);
INSERT INTO `pro_size` VALUES (79, 5, 91, 0);
INSERT INTO `pro_size` VALUES (80, 8, 91, 0);
INSERT INTO `pro_size` VALUES (81, 3, 92, 0);
INSERT INTO `pro_size` VALUES (82, 5, 92, 0);
INSERT INTO `pro_size` VALUES (83, 8, 92, 0);
INSERT INTO `pro_size` VALUES (84, 3, 93, 0);
INSERT INTO `pro_size` VALUES (85, 5, 93, 0);
INSERT INTO `pro_size` VALUES (86, 3, 94, 0);
INSERT INTO `pro_size` VALUES (87, 4, 94, 0);
INSERT INTO `pro_size` VALUES (88, 3, 95, 0);
INSERT INTO `pro_size` VALUES (89, 5, 95, 0);
INSERT INTO `pro_size` VALUES (90, 3, 96, 0);
INSERT INTO `pro_size` VALUES (91, 5, 96, 0);
INSERT INTO `pro_size` VALUES (92, 3, 97, 0);
INSERT INTO `pro_size` VALUES (93, 5, 97, 0);
INSERT INTO `pro_size` VALUES (94, 5, 98, 0);
INSERT INTO `pro_size` VALUES (95, 8, 98, 0);
INSERT INTO `pro_size` VALUES (96, 3, 99, 0);
INSERT INTO `pro_size` VALUES (97, 8, 99, 0);
INSERT INTO `pro_size` VALUES (98, 5, 100, 0);
INSERT INTO `pro_size` VALUES (99, 3, 101, 0);
INSERT INTO `pro_size` VALUES (100, 5, 101, 0);
INSERT INTO `pro_size` VALUES (101, 3, 102, 0);
INSERT INTO `pro_size` VALUES (102, 5, 103, 0);
INSERT INTO `pro_size` VALUES (103, 3, 104, 0);
INSERT INTO `pro_size` VALUES (104, 5, 104, 0);
INSERT INTO `pro_size` VALUES (105, 3, 105, 0);
INSERT INTO `pro_size` VALUES (106, 5, 105, 0);
INSERT INTO `pro_size` VALUES (107, 3, 106, 0);
INSERT INTO `pro_size` VALUES (108, 5, 106, 0);
INSERT INTO `pro_size` VALUES (109, 5, 107, 0);
INSERT INTO `pro_size` VALUES (110, 8, 107, 0);
INSERT INTO `pro_size` VALUES (111, 3, 108, 0);
INSERT INTO `pro_size` VALUES (112, 5, 108, 0);
INSERT INTO `pro_size` VALUES (113, 3, 109, 0);
INSERT INTO `pro_size` VALUES (114, 5, 109, 0);
INSERT INTO `pro_size` VALUES (115, 3, 110, 0);
INSERT INTO `pro_size` VALUES (116, 5, 110, 0);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品id，主键',
  `pro_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `pro_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品价格',
  `pro_number` int(11) NULL DEFAULT NULL COMMENT '库存量',
  `cat_id` int(11) NULL DEFAULT NULL COMMENT '产品分类',
  `pro_is_hot` tinyint(1) NULL DEFAULT NULL COMMENT '是否热门',
  `pro_count` int(11) NULL DEFAULT 0 COMMENT '点击量',
  `pro_is_new` tinyint(1) NULL DEFAULT NULL COMMENT '是否新品',
  `pro_is_on_sale` tinyint(1) NULL DEFAULT 0 COMMENT '商品是否打折',
  `pro_sale_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销价',
  `pro_index_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '首页展示图',
  `pro_brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '林楷服饰' COMMENT '商品品牌',
  `pro_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  `pro_sale_percent` int(11) NULL DEFAULT NULL COMMENT '打折折率',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '产品更新时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '产品创建时间',
  `pro_is_index` tinyint(4) NULL DEFAULT 0 COMMENT '是否是首页商品',
  `pro_is_index_img_update_time` datetime(0) NULL DEFAULT NULL COMMENT '首图更新时间',
  PRIMARY KEY (`pro_id`) USING BTREE,
  INDEX `cat_id`(`cat_id`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (25, '商品111', 111.00, 11, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 19:14:52', '2020-09-08 19:14:52', 0, NULL);
INSERT INTO `product` VALUES (26, '213', 1321.00, 312, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 19:17:19', '2020-09-08 19:17:19', 0, NULL);
INSERT INTO `product` VALUES (27, '1321', 3132.00, 1321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 19:22:43', '2020-09-08 19:22:43', 0, NULL);
INSERT INTO `product` VALUES (28, '2131', 312321.00, 313, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 19:23:48', '2020-09-08 19:23:48', 0, NULL);
INSERT INTO `product` VALUES (29, '1321', 31.00, 132, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 19:24:49', '2020-09-08 19:24:49', 0, NULL);
INSERT INTO `product` VALUES (30, '', NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 19:32:49', '2020-09-08 19:32:49', 0, NULL);
INSERT INTO `product` VALUES (31, '213', 1321.00, 312, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 19:34:50', '2020-09-08 19:34:50', 0, NULL);
INSERT INTO `product` VALUES (32, '1321', 1321.00, 321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 19:47:52', '2020-09-08 19:47:52', 0, NULL);
INSERT INTO `product` VALUES (33, '13', 21318.00, 31, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 19:50:18', '2020-09-08 19:50:18', 0, NULL);
INSERT INTO `product` VALUES (34, '321', 321.00, 312, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 19:53:11', '2020-09-08 19:53:11', 0, NULL);
INSERT INTO `product` VALUES (35, '3123', 1321.00, 321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 19:54:58', '2020-09-08 19:54:58', 0, NULL);
INSERT INTO `product` VALUES (36, '321', 321.00, 31, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 19:56:14', '2020-09-08 19:56:14', 0, NULL);
INSERT INTO `product` VALUES (37, '231', 312.00, 321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 19:58:26', '2020-09-08 19:58:26', 0, NULL);
INSERT INTO `product` VALUES (38, '213', 132.00, 132, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 20:02:05', '2020-09-08 20:02:05', 0, NULL);
INSERT INTO `product` VALUES (39, '321', 312.00, 31, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 20:06:01', '2020-09-08 20:06:01', 0, NULL);
INSERT INTO `product` VALUES (40, '1321', 321.00, 321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 20:06:52', '2020-09-08 20:06:52', 0, NULL);
INSERT INTO `product` VALUES (41, '213', 213.00, 312, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 20:08:08', '2020-09-08 20:08:08', 0, NULL);
INSERT INTO `product` VALUES (42, '213', 213.00, 123, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 20:21:01', '2020-09-08 20:21:01', 0, NULL);
INSERT INTO `product` VALUES (43, '213', 213.00, 2131, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 20:21:45', '2020-09-08 20:21:45', 0, NULL);
INSERT INTO `product` VALUES (44, '312', 321.00, 132, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 20:21:57', '2020-09-08 20:21:57', 0, NULL);
INSERT INTO `product` VALUES (45, '213', 321.00, 321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 20:23:26', '2020-09-08 20:23:26', 0, NULL);
INSERT INTO `product` VALUES (46, '3213', 1321.00, 321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 20:30:01', '2020-09-08 20:30:01', 0, NULL);
INSERT INTO `product` VALUES (47, '1321', 321.00, 321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 20:37:50', '2020-09-08 20:37:50', 0, NULL);
INSERT INTO `product` VALUES (48, '213', 1321.00, 321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-08 20:43:05', '2020-09-08 20:43:05', 0, NULL);
INSERT INTO `product` VALUES (49, '213', 213.00, 1321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-09 18:31:21', '2020-09-09 18:31:21', 0, NULL);
INSERT INTO `product` VALUES (50, 'shangpon222', 222.00, 222, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-09 18:58:48', '2020-09-09 18:58:48', 0, NULL);
INSERT INTO `product` VALUES (51, '13', 21321.00, 31, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-09 19:00:51', '2020-09-09 19:00:51', 0, NULL);
INSERT INTO `product` VALUES (52, '1321', 321.00, 321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-09 19:02:15', '2020-09-09 19:02:15', 0, NULL);
INSERT INTO `product` VALUES (53, '213', 21321.00, 312, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-09 19:07:41', '2020-09-09 19:07:41', 0, NULL);
INSERT INTO `product` VALUES (54, '213', 2130.00, 312, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-09 19:09:26', '2020-09-09 19:09:26', 0, NULL);
INSERT INTO `product` VALUES (55, '213', 1321.00, 321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-09 19:24:48', '2020-09-09 19:24:48', 0, NULL);
INSERT INTO `product` VALUES (56, '31', 3213.00, 1321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-09 19:31:48', '2020-09-09 19:31:48', 0, NULL);
INSERT INTO `product` VALUES (57, '213', 132.00, 131, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-09 19:35:09', '2020-09-09 19:35:09', 0, NULL);
INSERT INTO `product` VALUES (58, '13', 21321.00, 312, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-09 19:51:42', '2020-09-09 19:51:42', 0, NULL);
INSERT INTO `product` VALUES (59, '31', 321.00, 312, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-09 19:52:22', '2020-09-09 19:52:22', 0, NULL);
INSERT INTO `product` VALUES (60, '213', 1231.00, 312, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-09 19:54:17', '2020-09-09 19:54:17', 0, NULL);
INSERT INTO `product` VALUES (61, '213', 1321.00, 321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-09 19:55:50', '2020-09-09 19:55:50', 0, NULL);
INSERT INTO `product` VALUES (62, '321', 321.00, 321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-09 19:57:46', '2020-09-09 19:57:46', 0, NULL);
INSERT INTO `product` VALUES (63, '3123', 132.00, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-09 20:00:42', '2020-09-09 20:00:42', 0, NULL);
INSERT INTO `product` VALUES (64, '213', 1321.00, 312, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-09 21:10:31', '2020-09-09 21:10:31', 0, NULL);
INSERT INTO `product` VALUES (65, '213', 213.00, 21, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-10 08:25:10', '2020-09-10 08:25:10', 0, NULL);
INSERT INTO `product` VALUES (66, '213', 321.00, 312, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-10 08:27:55', '2020-09-10 08:27:55', 0, NULL);
INSERT INTO `product` VALUES (67, '321', 312.00, 3123, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-10 08:30:33', '2020-09-10 08:30:33', 0, NULL);
INSERT INTO `product` VALUES (68, '321', 310.00, 3123, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-10 08:31:38', '2020-09-10 08:31:38', 0, NULL);
INSERT INTO `product` VALUES (69, '321', 321.00, 321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-10 08:34:01', '2020-09-10 08:34:01', 0, NULL);
INSERT INTO `product` VALUES (70, '213', 3213.00, 21321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-10 08:39:12', '2020-09-10 08:39:12', 0, NULL);
INSERT INTO `product` VALUES (71, '321', 321.00, 321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-10 08:40:20', '2020-09-10 08:40:20', 0, NULL);
INSERT INTO `product` VALUES (72, '231', 321.00, 321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-10 08:42:34', '2020-09-10 08:42:34', 0, NULL);
INSERT INTO `product` VALUES (73, '312', 321.00, 31, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-10 08:59:48', '2020-09-10 08:59:48', 0, NULL);
INSERT INTO `product` VALUES (74, '312', 319.00, 321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-10 09:00:43', '2020-09-10 09:00:43', 0, NULL);
INSERT INTO `product` VALUES (75, '231', 32.00, 123, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-10 09:01:32', '2020-09-10 09:01:32', 0, NULL);
INSERT INTO `product` VALUES (76, '312', 321.00, 321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-10 09:05:39', '2020-09-10 09:05:39', 0, NULL);
INSERT INTO `product` VALUES (77, '321', 321.00, 321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-10 09:07:18', '2020-09-10 09:07:18', 0, NULL);
INSERT INTO `product` VALUES (78, '31', 2312.00, 3, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-10 09:08:21', '2020-09-10 09:08:21', 0, NULL);
INSERT INTO `product` VALUES (79, '213', 123.00, 132, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-10 09:14:52', '2020-09-10 09:14:52', 0, NULL);
INSERT INTO `product` VALUES (80, '312', 321.00, 321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-10 09:23:20', '2020-09-10 09:23:20', 0, NULL);
INSERT INTO `product` VALUES (81, '厄齐尔', 213.00, 1321, NULL, NULL, 0, NULL, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-10 20:03:11', '2020-09-10 20:03:11', 0, NULL);
INSERT INTO `product` VALUES (82, '商品1', 22.00, 111, NULL, 1, 0, 1, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-11 19:08:42', '2020-09-11 19:08:42', 0, NULL);
INSERT INTO `product` VALUES (83, '冬装111', 123.00, 123, NULL, 1, 0, 1, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-11 19:10:47', '2020-09-11 19:10:47', 0, NULL);
INSERT INTO `product` VALUES (84, '商品2', 122.00, 122, NULL, 1, 0, 1, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-11 19:16:29', '2020-09-11 19:16:29', 0, NULL);
INSERT INTO `product` VALUES (85, '陈亚萌', 111.00, 111, NULL, 1, 0, 1, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-11 19:18:22', '2020-09-11 19:18:22', 0, NULL);
INSERT INTO `product` VALUES (86, '商品2', 111.00, 11, NULL, 1, 0, 1, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-11 19:28:35', '2020-09-11 19:28:35', 0, NULL);
INSERT INTO `product` VALUES (87, '测试商品1', 111.00, 111, NULL, 1, 0, 1, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-14 19:43:04', '2020-09-14 19:43:04', 0, NULL);
INSERT INTO `product` VALUES (88, '测试商品33', 222.00, 222, NULL, 1, 0, 1, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-14 19:44:05', '2020-09-14 19:44:05', 0, NULL);
INSERT INTO `product` VALUES (89, '测试商品333', 333.00, 333, NULL, 1, 0, 1, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-14 19:45:44', '2020-09-14 19:45:44', 0, NULL);
INSERT INTO `product` VALUES (90, '商品333', 33.00, 22, NULL, 1, 0, 1, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-16 14:06:53', '2020-09-16 14:06:53', 0, NULL);
INSERT INTO `product` VALUES (91, '秋冬牛仔电焊工作服套装男长袖加厚耐磨防烫反光电力焊工劳保服', 89.00, 100, NULL, 1, 0, 1, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-16 14:17:01', '2020-09-16 14:17:01', 0, NULL);
INSERT INTO `product` VALUES (92, '秋冬工作服套装男牛仔定制耐磨电焊防烫纯棉电工焊工劳保服工装', 111.00, 100, NULL, 1, 0, 1, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-16 18:43:59', '2020-09-16 18:43:59', 0, NULL);
INSERT INTO `product` VALUES (93, '555555', 5555.00, 5555, 14, 0, 0, 0, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-17 09:27:42', '2020-09-16 19:40:14', 0, NULL);
INSERT INTO `product` VALUES (94, '秋冬牛仔电焊工作服套装男长袖加厚耐磨防烫反光电力焊工劳保服', 4444.00, 100, 15, 0, 0, 0, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-17 09:43:00', '2020-09-17 09:40:25', 0, NULL);
INSERT INTO `product` VALUES (95, '秋冬工作服套装男牛仔定制耐磨电焊防烫纯棉电工焊工劳保服工装', 333.00, 100, 14, 0, 0, 0, 0, NULL, NULL, '林楷服饰', NULL, NULL, 1, '2020-09-17 19:18:31', '2020-09-17 19:18:31', 0, NULL);
INSERT INTO `product` VALUES (96, '秋冬工作服套装男牛仔定制耐磨电焊防烫纯棉电工焊工劳保服工装', 44.50, 100, 19, 0, 11, 0, 1, NULL, '/2020/09/17/e83ed195-0a0f-4590-8a47-7bf96042c6e3.jpg', '林楷服饰', '商品描述啊啊啊', 50, 0, '2020-11-14 20:16:59', '2020-09-17 19:51:19', 1, '2020-10-01 20:27:26');
INSERT INTO `product` VALUES (97, '秋冬牛仔电焊工作服套装男长袖加厚耐磨防烫反光电力焊工劳保服', 98.00, 200, 19, 1, 13, 1, 0, NULL, '/2020/09/18/54777b8f-daa6-4cbf-97df-225f4bb89f4c.png', '林楷服饰', NULL, NULL, 0, '2020-10-01 20:14:18', '2020-09-18 20:06:08', 1, '2020-10-13 19:47:15');
INSERT INTO `product` VALUES (98, '测试商品3', 100.00, 100, 19, 1, 12, 1, 0, NULL, NULL, '林楷服饰', NULL, NULL, 0, '2020-09-18 20:07:22', '2020-09-18 20:07:22', 0, NULL);
INSERT INTO `product` VALUES (99, '测试商品444', 222.00, 222, 19, 1, 15, 1, 0, NULL, NULL, '林楷服饰', NULL, NULL, 0, '2020-09-18 20:07:50', '2020-09-18 20:07:50', 0, NULL);
INSERT INTO `product` VALUES (100, '测试商品5555', 27.50, 555, 19, 1, 17, 1, 0, NULL, NULL, '林楷服饰', NULL, 50, 0, '2020-10-06 20:39:21', '2020-09-18 20:08:17', 0, NULL);
INSERT INTO `product` VALUES (101, '测试商品4556', 666.00, 666, 19, 1, 13, 1, 0, NULL, NULL, '林楷服饰', NULL, NULL, 0, '2020-09-18 20:08:44', '2020-09-18 20:08:44', 0, NULL);
INSERT INTO `product` VALUES (102, '测试商品777', 115660.50, 32132, 19, 1, 0, 1, 0, NULL, NULL, '林楷服饰', NULL, NULL, 0, '2020-10-06 20:38:18', '2020-09-18 20:09:11', 0, NULL);
INSERT INTO `product` VALUES (103, '测试商品888', 444.00, 888, 19, 1, 0, 1, 0, NULL, NULL, '林楷服饰', NULL, 50, 0, '2020-10-06 20:41:27', '2020-09-18 20:09:29', 0, NULL);
INSERT INTO `product` VALUES (104, '测试商品', 61.50, 111, 24, 1, 0, 1, 0, NULL, NULL, '', '', 50, 0, '2020-10-06 20:41:15', '2020-09-28 18:45:42', 0, NULL);
INSERT INTO `product` VALUES (105, '秋冬牛仔电焊工作服套装男长袖加厚耐磨防烫反光电力焊工劳保服', 333.00, 100, 23, 1, 0, 1, 0, NULL, NULL, '林楷服饰', '秋冬牛仔电焊工作服套装男长袖加厚耐磨防烫反光电力焊工劳保服', NULL, 0, '2020-09-29 18:48:20', '2020-09-29 18:48:20', 0, NULL);
INSERT INTO `product` VALUES (106, '秋冬工作服套装男牛仔定制耐磨电焊防烫纯棉电工焊工劳保服工装', 111.00, 100, 22, 1, 0, 1, 0, NULL, NULL, '林楷服饰', '秋冬工作服套装男牛仔定制耐磨电焊防烫纯棉电工焊工劳保服工装', NULL, 0, '2020-09-29 18:52:15', '2020-09-29 18:52:15', 0, NULL);
INSERT INTO `product` VALUES (107, '测试商品333', 111.00, 100, 21, 0, 0, 0, 1, 55.50, NULL, '林楷服饰', '333', 50, 0, '2020-10-10 20:19:06', '2020-09-29 18:58:45', 0, NULL);
INSERT INTO `product` VALUES (108, '最新测试商品2020年10月11日', 130.00, 200, 23, 1, 0, 1, 1, 117.00, NULL, '林楷服饰', '最新测试商品2020年10月11日', 90, 0, '2020-10-11 11:17:23', '2020-10-11 11:16:00', 0, NULL);
INSERT INTO `product` VALUES (109, '秋天到了，球衣', 100.00, 100, 23, 1, 0, 1, 0, NULL, NULL, '林凯', '球衣', NULL, 0, '2020-11-15 20:13:08', '2020-11-15 20:13:08', 0, NULL);
INSERT INTO `product` VALUES (110, '测试商品上传图片个数', 111.00, 123, 21, 1, 0, 1, 0, NULL, NULL, 'brand', '测试', NULL, 0, '2020-11-16 20:12:38', '2020-11-16 20:12:38', 0, NULL);

-- ----------------------------
-- Table structure for push_img
-- ----------------------------
DROP TABLE IF EXISTS `push_img`;
CREATE TABLE `push_img`  (
  `push_img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `push_id` int(11) NOT NULL COMMENT '推新历史主键',
  `img_id` int(11) NOT NULL COMMENT '图片id',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '逻辑删除\r\n',
  PRIMARY KEY (`push_img_id`) USING BTREE,
  INDEX `push_id`(`push_id`) USING BTREE,
  INDEX `img_id`(`img_id`) USING BTREE,
  CONSTRAINT `push_img_ibfk_1` FOREIGN KEY (`push_id`) REFERENCES `push_new` (`push_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `push_img_ibfk_2` FOREIGN KEY (`img_id`) REFERENCES `img` (`img_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of push_img
-- ----------------------------
INSERT INTO `push_img` VALUES (1, 26, 50, 0);
INSERT INTO `push_img` VALUES (2, 26, 51, 0);
INSERT INTO `push_img` VALUES (3, 27, 52, 0);
INSERT INTO `push_img` VALUES (4, 27, 53, 0);
INSERT INTO `push_img` VALUES (5, 27, 54, 0);
INSERT INTO `push_img` VALUES (6, 27, 55, 0);
INSERT INTO `push_img` VALUES (7, 27, 56, 0);
INSERT INTO `push_img` VALUES (8, 28, 57, 0);
INSERT INTO `push_img` VALUES (9, 28, 58, 0);
INSERT INTO `push_img` VALUES (10, 28, 59, 0);
INSERT INTO `push_img` VALUES (11, 28, 60, 0);
INSERT INTO `push_img` VALUES (12, 29, 61, 1);
INSERT INTO `push_img` VALUES (13, 29, 62, 1);
INSERT INTO `push_img` VALUES (14, 29, 63, 0);
INSERT INTO `push_img` VALUES (15, 29, 64, 0);
INSERT INTO `push_img` VALUES (16, 30, 65, 1);
INSERT INTO `push_img` VALUES (17, 30, 66, 1);
INSERT INTO `push_img` VALUES (18, 30, 67, 1);
INSERT INTO `push_img` VALUES (19, 30, 68, 1);
INSERT INTO `push_img` VALUES (20, 30, 70, 0);
INSERT INTO `push_img` VALUES (21, 30, 69, 0);
INSERT INTO `push_img` VALUES (22, 31, 71, 0);
INSERT INTO `push_img` VALUES (23, 32, 72, 0);
INSERT INTO `push_img` VALUES (24, 33, 73, 1);
INSERT INTO `push_img` VALUES (25, 33, 74, 1);
INSERT INTO `push_img` VALUES (26, 33, 75, 1);
INSERT INTO `push_img` VALUES (27, 33, 76, 1);
INSERT INTO `push_img` VALUES (28, 33, 77, 1);
INSERT INTO `push_img` VALUES (29, 33, 78, 1);
INSERT INTO `push_img` VALUES (30, 33, 79, 0);
INSERT INTO `push_img` VALUES (31, 34, 80, 1);
INSERT INTO `push_img` VALUES (32, 34, 81, 1);
INSERT INTO `push_img` VALUES (33, 34, 82, 1);
INSERT INTO `push_img` VALUES (34, 34, 83, 1);
INSERT INTO `push_img` VALUES (35, 34, 85, 1);
INSERT INTO `push_img` VALUES (36, 34, 84, 1);
INSERT INTO `push_img` VALUES (37, 34, 86, 1);
INSERT INTO `push_img` VALUES (38, 34, 87, 1);
INSERT INTO `push_img` VALUES (39, 34, 88, 1);
INSERT INTO `push_img` VALUES (40, 34, 89, 1);
INSERT INTO `push_img` VALUES (41, 34, 90, 1);
INSERT INTO `push_img` VALUES (42, 34, 91, 1);
INSERT INTO `push_img` VALUES (43, 34, 92, 1);
INSERT INTO `push_img` VALUES (44, 34, 93, 1);
INSERT INTO `push_img` VALUES (45, 34, 94, 0);
INSERT INTO `push_img` VALUES (46, 34, 95, 0);
INSERT INTO `push_img` VALUES (47, 34, 96, 0);
INSERT INTO `push_img` VALUES (48, 35, 98, 1);
INSERT INTO `push_img` VALUES (49, 35, 97, 1);
INSERT INTO `push_img` VALUES (50, 35, 99, 1);
INSERT INTO `push_img` VALUES (51, 35, 101, 1);
INSERT INTO `push_img` VALUES (52, 35, 100, 1);
INSERT INTO `push_img` VALUES (53, 35, 102, 1);
INSERT INTO `push_img` VALUES (54, 35, 103, 1);
INSERT INTO `push_img` VALUES (55, 35, 104, 1);
INSERT INTO `push_img` VALUES (56, 35, 106, 1);
INSERT INTO `push_img` VALUES (57, 35, 107, 1);
INSERT INTO `push_img` VALUES (58, 35, 105, 1);
INSERT INTO `push_img` VALUES (59, 35, 108, 1);
INSERT INTO `push_img` VALUES (60, 35, 109, 1);
INSERT INTO `push_img` VALUES (61, 35, 110, 1);
INSERT INTO `push_img` VALUES (62, 35, 111, 1);
INSERT INTO `push_img` VALUES (63, 35, 112, 0);
INSERT INTO `push_img` VALUES (64, 35, 113, 0);
INSERT INTO `push_img` VALUES (65, 36, 114, 0);
INSERT INTO `push_img` VALUES (66, 36, 115, 0);
INSERT INTO `push_img` VALUES (67, 36, 116, 0);
INSERT INTO `push_img` VALUES (68, 37, 117, 0);
INSERT INTO `push_img` VALUES (69, 37, 118, 0);
INSERT INTO `push_img` VALUES (70, 37, 119, 0);

-- ----------------------------
-- Table structure for push_new
-- ----------------------------
DROP TABLE IF EXISTS `push_new`;
CREATE TABLE `push_new`  (
  `push_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '推新历史主键',
  `push_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推新历史标题',
  `push_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推新历史描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`push_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of push_new
-- ----------------------------
INSERT INTO `push_new` VALUES (8, '测试推新记录', '简要描述', '2020-10-28 20:33:17', '2020-10-28 20:33:17', 1);
INSERT INTO `push_new` VALUES (9, '测试最新推新记录', '简要描述', '2020-10-28 20:34:05', '2020-10-28 20:34:05', 1);
INSERT INTO `push_new` VALUES (10, '测试推新记录', '简要描述', '2020-10-28 20:35:22', '2020-10-28 20:35:22', 1);
INSERT INTO `push_new` VALUES (11, '测试最新推新记录', '32132', '2020-10-28 20:35:54', '2020-10-28 20:35:54', 1);
INSERT INTO `push_new` VALUES (12, '测试最新推新记录', '简要描述', '2020-10-30 19:59:45', '2020-10-30 19:59:45', 1);
INSERT INTO `push_new` VALUES (13, '123123', '231', '2020-10-30 20:00:26', '2020-10-30 20:00:26', 1);
INSERT INTO `push_new` VALUES (14, '213', '3213', '2020-10-30 20:01:05', '2020-10-30 20:01:05', 1);
INSERT INTO `push_new` VALUES (15, '21321', '1321321', '2020-10-30 20:02:45', '2020-10-30 20:02:45', 1);
INSERT INTO `push_new` VALUES (16, '2131321', '31231', '2020-10-30 20:04:00', '2020-10-30 20:04:00', 1);
INSERT INTO `push_new` VALUES (17, '测试推新记录123', '简要描述123', '2020-10-30 20:13:26', '2020-10-31 20:17:22', 1);
INSERT INTO `push_new` VALUES (18, '测试推新记录', '简要描述', '2020-10-30 20:14:36', '2020-10-30 20:14:36', 1);
INSERT INTO `push_new` VALUES (19, '测试推新记录', '简要描述', '2020-10-30 20:14:41', '2020-10-30 20:14:41', 1);
INSERT INTO `push_new` VALUES (20, '测试最新推新记录', '简要描述', '2020-10-30 20:15:50', '2020-10-30 20:15:50', 1);
INSERT INTO `push_new` VALUES (21, '测试最新推新记录', '简要描述', '2020-10-30 20:16:27', '2020-10-30 20:16:27', 0);
INSERT INTO `push_new` VALUES (22, '测试最新推新记录', '描述', '2020-10-30 20:17:03', '2020-10-30 20:17:03', 0);
INSERT INTO `push_new` VALUES (23, '测试推新记录', '描述', '2020-10-30 20:18:45', '2020-10-30 20:18:45', 0);
INSERT INTO `push_new` VALUES (24, '测试最新推新记录', '简要描述', '2020-10-30 20:19:14', '2020-10-30 20:19:14', 0);
INSERT INTO `push_new` VALUES (25, '', '', '2020-10-31 14:36:24', '2020-10-31 14:36:24', 0);
INSERT INTO `push_new` VALUES (26, '测试最新推新记录', '简要描述', '2020-10-31 14:37:23', '2020-10-31 14:37:23', 0);
INSERT INTO `push_new` VALUES (27, '最新最热的商品没有之一', '最新最热', '2020-11-01 09:14:53', '2020-11-01 09:14:53', 0);
INSERT INTO `push_new` VALUES (28, '测试最新2020年11月1日', '简要描述', '2020-11-01 09:42:11', '2020-11-01 09:42:11', 0);
INSERT INTO `push_new` VALUES (29, '测试i最新的推新记录09点46分', '描述', '2020-11-01 09:46:43', '2020-11-01 09:46:43', 0);
INSERT INTO `push_new` VALUES (30, '测试推新记录1233', '1231321', '2020-11-01 09:53:48', '2020-11-01 09:53:48', 0);
INSERT INTO `push_new` VALUES (31, '最后一遍测试问题', '测试问题', '2020-11-01 10:01:49', '2020-11-01 10:01:49', 0);
INSERT INTO `push_new` VALUES (32, '三个图片测试', '测试', '2020-11-01 10:03:54', '2020-11-01 10:03:54', 0);
INSERT INTO `push_new` VALUES (33, '10点06分测试推新记录2', '简要描述2', '2020-11-01 10:07:09', '2020-11-01 10:08:38', 0);
INSERT INTO `push_new` VALUES (34, '最后一遍测试了', '测试', '2020-11-01 10:18:54', '2020-11-01 10:18:54', 0);
INSERT INTO `push_new` VALUES (35, '2020年11月1日10点25分最后一遍测试', '测试问题', '2020-11-01 10:25:46', '2020-11-01 10:25:46', 0);
INSERT INTO `push_new` VALUES (36, '测试新增吗', '测序', '2020-11-01 10:29:04', '2020-11-01 10:29:04', 0);
INSERT INTO `push_new` VALUES (37, '测试最新推新记录2020年11月4日', '简要描述', '2020-11-04 20:30:53', '2020-11-04 20:30:53', 0);

-- ----------------------------
-- Table structure for push_pro
-- ----------------------------
DROP TABLE IF EXISTS `push_pro`;
CREATE TABLE `push_pro`  (
  `push_pro_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `push_id` int(11) NOT NULL COMMENT '推新id',
  `pro_id` int(11) NOT NULL COMMENT '关联商品id',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`push_pro_id`) USING BTREE,
  INDEX `push_id`(`push_id`) USING BTREE,
  INDEX `pro_id`(`pro_id`) USING BTREE,
  CONSTRAINT `push_pro_ibfk_1` FOREIGN KEY (`push_id`) REFERENCES `push_new` (`push_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `push_pro_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of push_pro
-- ----------------------------
INSERT INTO `push_pro` VALUES (15, 17, 98, 1);
INSERT INTO `push_pro` VALUES (16, 17, 99, 1);
INSERT INTO `push_pro` VALUES (17, 27, 96, 0);
INSERT INTO `push_pro` VALUES (18, 27, 97, 0);
INSERT INTO `push_pro` VALUES (19, 28, 98, 0);
INSERT INTO `push_pro` VALUES (20, 28, 99, 0);
INSERT INTO `push_pro` VALUES (21, 29, 100, 0);
INSERT INTO `push_pro` VALUES (22, 29, 101, 0);
INSERT INTO `push_pro` VALUES (23, 30, 102, 0);
INSERT INTO `push_pro` VALUES (24, 30, 103, 0);
INSERT INTO `push_pro` VALUES (25, 31, 101, 0);
INSERT INTO `push_pro` VALUES (26, 31, 102, 0);
INSERT INTO `push_pro` VALUES (27, 32, 100, 0);
INSERT INTO `push_pro` VALUES (28, 32, 101, 0);
INSERT INTO `push_pro` VALUES (29, 33, 103, 0);
INSERT INTO `push_pro` VALUES (30, 33, 104, 0);
INSERT INTO `push_pro` VALUES (31, 34, 96, 0);
INSERT INTO `push_pro` VALUES (32, 34, 97, 0);
INSERT INTO `push_pro` VALUES (33, 35, 99, 0);
INSERT INTO `push_pro` VALUES (34, 35, 100, 0);
INSERT INTO `push_pro` VALUES (35, 36, 96, 0);
INSERT INTO `push_pro` VALUES (36, 36, 97, 0);
INSERT INTO `push_pro` VALUES (37, 37, 96, 0);
INSERT INTO `push_pro` VALUES (38, 37, 97, 0);

-- ----------------------------
-- Table structure for size
-- ----------------------------
DROP TABLE IF EXISTS `size`;
CREATE TABLE `size`  (
  `size_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '尺寸主键id',
  `size_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '尺寸描述',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `deleted` int(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`size_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of size
-- ----------------------------
INSERT INTO `size` VALUES (3, '190/100A', '2020-09-07 20:07:23', '2020-09-07 20:07:23', 0);
INSERT INTO `size` VALUES (5, '180/100A', '2020-09-08 18:53:06', '2020-09-08 18:53:06', 0);
INSERT INTO `size` VALUES (8, '190/18A', '2020-09-09 19:25:20', '2020-09-09 19:25:20', 0);

SET FOREIGN_KEY_CHECKS = 1;
