/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 10/07/2025 10:36:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adminuser
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser`  (
  `uid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adminuser
-- ----------------------------
INSERT INTO `adminuser` VALUES (1, 'admin', 'admin');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '休闲零食');
INSERT INTO `category` VALUES (2, '饮料酒水');
INSERT INTO `category` VALUES (3, '日用百货');
INSERT INTO `category` VALUES (4, '热食快餐');
INSERT INTO `category` VALUES (5, '粮油调味');
INSERT INTO `category` VALUES (6, '乳品冰品');
INSERT INTO `category` VALUES (7, '儿童专区');
INSERT INTO `category` VALUES (8, '生活服务');

-- ----------------------------
-- Table structure for categorysecond
-- ----------------------------
DROP TABLE IF EXISTS `categorysecond`;
CREATE TABLE `categorysecond`  (
  `csid` int NOT NULL AUTO_INCREMENT,
  `csname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `cid` int NULL DEFAULT NULL,
  PRIMARY KEY (`csid`) USING BTREE,
  INDEX `FK936FCAF21DB1FD15`(`cid` ASC) USING BTREE,
  CONSTRAINT `FK936FCAF21DB1FD15` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categorysecond
-- ----------------------------
INSERT INTO `categorysecond` VALUES (1, '饼干糕点', 1);
INSERT INTO `categorysecond` VALUES (2, '膨化薯片', 1);
INSERT INTO `categorysecond` VALUES (3, '糖果巧克力', 1);
INSERT INTO `categorysecond` VALUES (4, '坚果炒货', 1);
INSERT INTO `categorysecond` VALUES (5, '肉干卤味', 1);
INSERT INTO `categorysecond` VALUES (6, '碳酸饮料', 2);
INSERT INTO `categorysecond` VALUES (7, '矿泉水纯净水', 2);
INSERT INTO `categorysecond` VALUES (8, '茶饮料', 2);
INSERT INTO `categorysecond` VALUES (9, '果汁饮品', 2);
INSERT INTO `categorysecond` VALUES (10, '功能饮料', 2);
INSERT INTO `categorysecond` VALUES (11, '乳味饮料', 2);
INSERT INTO `categorysecond` VALUES (12, '啤酒', 2);
INSERT INTO `categorysecond` VALUES (14, '咖啡', 2);
INSERT INTO `categorysecond` VALUES (15, '个人清洁', 3);
INSERT INTO `categorysecond` VALUES (16, '纸品家清', 3);
INSERT INTO `categorysecond` VALUES (17, '应急用品', 3);
INSERT INTO `categorysecond` VALUES (18, '文具用品', 3);
INSERT INTO `categorysecond` VALUES (19, '电池小电器', 3);
INSERT INTO `categorysecond` VALUES (20, '其他杂项', 3);
INSERT INTO `categorysecond` VALUES (21, '早餐', 4);
INSERT INTO `categorysecond` VALUES (25, '即食小吃', 4);
INSERT INTO `categorysecond` VALUES (26, '方便食品', 5);
INSERT INTO `categorysecond` VALUES (27, '调味品', 5);
INSERT INTO `categorysecond` VALUES (28, '米面粮油', 5);
INSERT INTO `categorysecond` VALUES (29, '下饭酱菜', 5);
INSERT INTO `categorysecond` VALUES (30, '鲜奶酸奶', 6);
INSERT INTO `categorysecond` VALUES (31, '冰激凌雪糕', 6);
INSERT INTO `categorysecond` VALUES (32, '冷藏饮品', 6);
INSERT INTO `categorysecond` VALUES (33, '儿童零食', 7);
INSERT INTO `categorysecond` VALUES (34, '儿童饮品', 7);
INSERT INTO `categorysecond` VALUES (35, '小玩具文具', 7);
INSERT INTO `categorysecond` VALUES (36, '便民服务', 8);
INSERT INTO `categorysecond` VALUES (37, '报刊杂志', 8);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `market_price` double NULL DEFAULT NULL,
  `shop_price` double NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pdesc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `is_hot` int NULL DEFAULT NULL,
  `pdate` datetime NULL DEFAULT NULL,
  `csid` int NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `FKED8DCCEFB9B74E02`(`csid` ASC) USING BTREE,
  CONSTRAINT `FKED8DCCEFB9B74E02` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '奥利奥饼干', 15, 12, 'products/1.png', '香甜可口的奥利奥夹心饼干，原味/巧克力味可选，独立包装，方便携带。', 0, '2025-07-07 10:00:00', 1);
INSERT INTO `product` VALUES (2, '旺旺雪饼', 10, 8, 'products/2.png', '松软可口的旺旺雪饼，奶香味十足，独立小包装，方便携带。', 0, '2025-07-07 11:30:00', 1);
INSERT INTO `product` VALUES (3, '康师傅3+2苏打夹心', 18, 14, 'products/3.png', '经典的苏打夹心饼干，口感松脆，夹心丰富，是办公室和课间的能量补充。', 1, '2025-07-07 13:45:00', 1);
INSERT INTO `product` VALUES (4, '达利园法式小面包', 20, 16, 'products/4.png', '软糯香甜的小面包，独立包装方便携带，是旅行和户外活动的伴侣。', 0, '2025-07-07 15:15:00', 1);
INSERT INTO `product` VALUES (5, '夹心饼干', 12, 9, 'products/5.png', '独特的夹心饼干，口感丰富，独立包装，是下午茶的美味选择。', 0, '2025-07-07 16:50:00', 1);
INSERT INTO `product` VALUES (6, '巧克力派', 16, 12, 'products/6.png', '香甜软糯的巧克力派，可可香气浓郁，让你一口接一口。', 0, '2025-07-08 09:20:00', 1);
INSERT INTO `product` VALUES (7, '乐事薯片', 14, 10, 'products/7.png', '香脆可口的乐事薯片，多种口味任选，独立小包装，方便携带。', 0, '2025-07-08 11:05:00', 2);
INSERT INTO `product` VALUES (8, '可比克薯片', 13, 10, 'products/8.png', '可比克薯片，香脆可口，多种口味可选，独立包装。', 0, '2025-07-08 12:40:00', 2);
INSERT INTO `product` VALUES (9, '上好佳鲜虾片', 12, 9, 'products/9.png', '上好佳鲜虾片，鲜美可口，香脆不油腻，营养丰富。', 0, '2025-07-08 14:10:00', 2);
INSERT INTO `product` VALUES (10, '德芙巧克力', 25, 20, 'products/10.png', '德芙巧克力，丝滑口感，醇厚奶香，浪漫礼盒装。', 0, '2025-07-08 15:55:00', 3);
INSERT INTO `product` VALUES (11, '大白兔奶糖', 16, 12, 'products/11.png', '大白兔奶糖，经典奶糖，甜蜜回忆，奶香浓郁。', 0, '2025-07-08 17:25:00', 3);
INSERT INTO `product` VALUES (12, '绿箭口香糖', 8, 6, 'products/12.png', '绿箭口香糖，清新口气，持久留香，多种口味可选。', 0, '2025-07-08 19:00:00', 3);
INSERT INTO `product` VALUES (13, '花生米', 18, 14, 'products/13.png', '五香/奶油口味的花生米，香脆可口，独立包装。', 0, '2025-07-09 10:15:00', 4);
INSERT INTO `product` VALUES (14, '开心果', 30, 24, 'products/14.png', '天然绿色的开心果，果仁饱满，口感香脆，独立包装。', 0, '2025-07-09 11:45:00', 4);
INSERT INTO `product` VALUES (15, '泡椒凤爪', 22, 18, 'products/15.png', '泡椒凤爪，精选新鲜凤爪，泡椒入味，口感爽脆。', 0, '2025-07-09 13:20:00', 5);
INSERT INTO `product` VALUES (16, '牛肉干', 35, 28, 'products/16.png', '精选优质牛肉，瘦肉精制，口感紧实，多种口味可选。', 1, '2025-07-09 14:50:00', 5);
INSERT INTO `product` VALUES (17, '卤蛋', 15, 12, 'products/17.png', '卤制入味的卤蛋，蛋白嫩滑，蛋黄沙绵，独立包装。', 0, '2025-07-09 16:10:00', 5);
INSERT INTO `product` VALUES (18, '可口可乐', 8, 6, 'products/18.png', '经典的可口可乐，畅爽解渴，是聚会和餐饮的必备饮品。', 1, '2025-07-09 17:35:00', 6);
INSERT INTO `product` VALUES (19, '美年达', 7, 5, 'products/19.png', '美年达碳酸饮料，多种水果口味，畅爽解渴。', 0, '2025-07-09 19:00:00', 6);
INSERT INTO `product` VALUES (20, 'AD钙奶', 5, 4, 'products/20.png', '娃哈哈AD钙奶，富含钙质，香甜可口，是儿童喜爱的饮品。', 0, '2025-03-20 16:38:00', 34);
INSERT INTO `product` VALUES (21, '旺旺小馒头', 12, 9, 'products/21.png', '经典旺旺小馒头，原味，独立包装，方便携带，是儿童喜爱的零食。', 0, '2025-07-07 10:00:00', 33);
INSERT INTO `product` VALUES (22, '喜之郎果冻', 8, 6, 'products/22.png', '喜之郎果冻，多种口味，Q弹爽滑，是孩子们的最爱。', 1, '2025-07-07 11:30:00', 33);
INSERT INTO `product` VALUES (23, '康师傅红烧牛肉面', 15, 12, 'products/23.png', '康师傅红烧牛肉面，经典口味，方便快捷，是忙碌时的首选。', 0, '2025-07-07 13:45:00', 26);
INSERT INTO `product` VALUES (24, '老干妈辣酱', 10, 8, 'products/24.png', '老干妈辣酱，香辣可口，开胃下饭，是家庭常备调味品。', 1, '2025-07-07 15:15:00', 27);
INSERT INTO `product` VALUES (25, '复印/打印服务', 20, 15, 'products/25.png', '便捷的复印/打印服务，支持多种文档格式，高效快速，满足您的办公需求。', 1, '2025-07-07 16:50:00', 36);
INSERT INTO `product` VALUES (26, '纯甄酸牛奶', 10, 8, 'products/26.png', '纯甄酸牛奶，营养丰富，口感酸甜，是健康饮品的选择。', 1, '2025-07-08 09:20:00', 30);
INSERT INTO `product` VALUES (27, 'ikun玩偶', 30, 25, 'products/27.png', '可爱的ikun玩偶，造型独特，是粉丝收藏和送礼的佳品。', 1, '2025-07-08 11:05:00', 35);
INSERT INTO `product` VALUES (28, '报纸服务', 15, 10, 'products/28.png', '提供各类报纸订阅和配送服务，让您随时掌握最新资讯。', 1, '2025-07-08 12:40:00', 37);
INSERT INTO `product` VALUES (29, '打火机', 15, 10, 'products/29.png', '便捷实用的打火机，小巧便携，火焰稳定，适合家庭、户外等多种场景使用。', 1, '2025-07-08 14:28:00', 20);
INSERT INTO `product` VALUES (30, '茶叶蛋', 5, 4, 'products/30.png', '卤制入味的茶叶蛋，蛋白嫩滑，蛋黄沙绵，是经典的早餐和零食选择。', 1, '2025-07-08 15:30:00', 21);
INSERT INTO `product` VALUES (31, '包子', 8, 6, 'products/31.png', '松软可口的包子，多种馅料可选，是传统的中式早餐食品。', 1, '2025-07-08 16:45:00', 21);
INSERT INTO `product` VALUES (32, '烤红薯', 10, 8, 'products/32.png', '香甜软糯的烤红薯，营养丰富，是冬季保暖和日常休闲的健康食品。', 0, '2025-07-08 18:00:00', 25);
INSERT INTO `product` VALUES (33, '冰露矿泉水', 10, 8, 'products/33.png', '冰露矿泉水，纯净清冽，采用反渗透技术，多道精滤，全程封闭式生产，品质有保障。', 1, '2025-07-07 10:00:00', 7);
INSERT INTO `product` VALUES (34, '茶饮料', 8, 6, 'products/34.png', '清爽茶饮料，多种口味可选，是夏季解暑和日常休闲的健康饮品。', 1, '2025-07-07 11:30:00', 8);
INSERT INTO `product` VALUES (35, '营养快线', 12, 10, 'products/35.png', '娃哈哈营养快线，果汁与牛奶的完美结合，提供多种营养，是早餐和休闲代餐的理想选择。', 1, '2025-07-07 13:45:00', 9);
INSERT INTO `product` VALUES (36, '功能饮料', 15, 12, 'products/36.png', '提神醒脑的功能饮料，富含多种维生素和矿物质，适合运动后补充能量。', 1, '2025-07-07 15:15:00', 10);
INSERT INTO `product` VALUES (37, '优酸乳', 8, 6, 'products/37.png', '优酸乳，是受欢迎的乳酸菌饮料。', 1, '2025-07-07 16:50:00', 11);
INSERT INTO `product` VALUES (38, '啤酒', 12, 10, 'products/38.png', '青岛啤酒，经典清爽，是聚会和餐饮的必备饮品。', 1, '2025-07-07 18:00:00', 12);
INSERT INTO `product` VALUES (39, '咖啡', 20, 15, 'products/39.png', '雀巢咖啡，醇厚香浓，提神醒脑，是工作学习的好伴侣。', 1, '2025-07-08 09:20:00', 14);
INSERT INTO `product` VALUES (40, '飘柔洗发水', 30, 25, 'products/40.png', '飘柔洗发水，发根清爽，发尾柔顺，让头发顺滑有光泽。', 1, '2025-07-08 11:05:00', 15);
INSERT INTO `product` VALUES (41, '清风纸巾', 15, 12, 'products/41.png', '清风纸巾，柔软洁净，包装精美，是家庭和办公的必备用品。', 1, '2025-07-08 12:40:00', 16);
INSERT INTO `product` VALUES (42, '急救包', 50, 40, 'products/42.png', '急救包，包含多种医疗用品，适合家庭、户外和旅行使用，是应急必备品。', 0, '2025-07-08 14:28:00', 17);
INSERT INTO `product` VALUES (43, '文具套装', 40, 30, 'products/43.png', '精美文具套装，包含多种学习用品，适合学生和办公使用，是学习和工作的得力助手。', 0, '2025-07-08 15:30:00', 18);
INSERT INTO `product` VALUES (44, '南孚电池', 25, 20, 'products/44.png', '南孚电池，持久耐用，适用于各种电子设备，是家居和办公的必备用品。', 1, '2025-07-08 16:45:00', 19);
INSERT INTO `product` VALUES (45, '味精', 10, 8, 'products/45.png', '太太乐味精，提升鲜味，适合烹饪各种美食，是厨房常备调味品。', 0, '2025-07-08 18:00:00', 27);
INSERT INTO `product` VALUES (46, '乌江榨菜', 8, 6, 'products/46.png', '乌江榨菜，多种口味可选，开胃下饭，是家庭常备小菜。', 0, '2025-07-09 10:00:00', 29);
INSERT INTO `product` VALUES (47, '钟薛高冰淇淋', 15, 12, 'products/47.png', '钟薛高冰淇淋，口感细腻，多种口味可选，是夏季解暑和休闲的美味选择。', 0, '2025-07-09 11:30:00', 31);
INSERT INTO `product` VALUES (48, '冷藏啤酒', 18, 15, 'products/48.png', '冷藏啤酒，冰爽解渴，是夏季聚会和餐饮的必备饮品。', 0, '2025-07-09 13:45:00', 32);
INSERT INTO `product` VALUES (49, '金龙鱼油', 59, 49, 'products/49.png', '金龙鱼油，市场促销活动多，性价比高，是家庭烹饪的实惠之选。', 0, '2025-07-08 15:30:00', 28);
INSERT INTO `product` VALUES (50, '鲁花油', 85, 80, 'products/50.png', '鲁花油，采用5S物理压榨工艺，香味浓郁，品质优良，是高品质烹饪的优选。', 0, '2025-07-08 16:45:00', 28);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `addr` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'aaa', 'aaa', '蔡耀杰', 'aaa@shop.com', '15726601111', '集美大学');
INSERT INTO `user` VALUES (2, 'bbb', 'bbb', '吴敬泽', 'bbb@shop.com', '18726601111', '集美大学');
INSERT INTO `user` VALUES (3, 'ccc', '1234', '石锦晟', 'ccc@shop.com', '13326601111', '集美大学');
INSERT INTO `user` VALUES (4, 'ddd', 'ddd', '范炜鋆', 'ddd@shop.com', '13986601111', '集美大学');

SET FOREIGN_KEY_CHECKS = 1;
