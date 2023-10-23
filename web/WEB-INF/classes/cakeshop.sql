/*
 Navicat Premium Data Transfer

 Source Server         : wk
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : cakeshop

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 21/04/2023 22:05:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `goodsId` int(0) NOT NULL COMMENT '商品ID',
  `userId` int(0) NOT NULL COMMENT '用户ID',
  `amount` int(0) NULL DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (43, 10, 49, 2);
INSERT INTO `cart` VALUES (56, 12, 49, 1);
INSERT INTO `cart` VALUES (70, 10, 53, 3);
INSERT INTO `cart` VALUES (72, 10, 54, 1);
INSERT INTO `cart` VALUES (74, 15, 53, 3);
INSERT INTO `cart` VALUES (76, 26, 53, 1);
INSERT INTO `cart` VALUES (78, 15, 54, 1);
INSERT INTO `cart` VALUES (81, 14, 52, 1);
INSERT INTO `cart` VALUES (83, 16, 52, 7);
INSERT INTO `cart` VALUES (86, 18, 54, 1);
INSERT INTO `cart` VALUES (87, 36, 53, 1);
INSERT INTO `cart` VALUES (88, 10, 60, 1);
INSERT INTO `cart` VALUES (89, 16, 53, 3);
INSERT INTO `cart` VALUES (90, 16, 54, 1);
INSERT INTO `cart` VALUES (93, 10, 61, 1);
INSERT INTO `cart` VALUES (96, 15, 60, 1);
INSERT INTO `cart` VALUES (99, 12, 43, 1);
INSERT INTO `cart` VALUES (106, 18, 53, 1);
INSERT INTO `cart` VALUES (112, 11, 64, 1);
INSERT INTO `cart` VALUES (118, 18, 43, 2);
INSERT INTO `cart` VALUES (121, 16, 1, 4);
INSERT INTO `cart` VALUES (123, 10, 64, 1);
INSERT INTO `cart` VALUES (129, 15, 1, 2);
INSERT INTO `cart` VALUES (132, 12, 1, 2);
INSERT INTO `cart` VALUES (135, 12, 64, 1);
INSERT INTO `cart` VALUES (138, 10, 1, 85);
INSERT INTO `cart` VALUES (141, 10, 65, 1);
INSERT INTO `cart` VALUES (146, 13, 64, 1);
INSERT INTO `cart` VALUES (150, 11, 57, 1);
INSERT INTO `cart` VALUES (151, 18, 65, 1);
INSERT INTO `cart` VALUES (153, 12, 57, 1);
INSERT INTO `cart` VALUES (154, 10, 67, 1);
INSERT INTO `cart` VALUES (155, 12, 60, 2);
INSERT INTO `cart` VALUES (156, 13, 57, 1);
INSERT INTO `cart` VALUES (157, 11, 67, 1);
INSERT INTO `cart` VALUES (160, 12, 67, 1);
INSERT INTO `cart` VALUES (161, 15, 57, 2);
INSERT INTO `cart` VALUES (162, 13, 67, 1);
INSERT INTO `cart` VALUES (163, 16, 66, 1);
INSERT INTO `cart` VALUES (164, 16, 57, 1);
INSERT INTO `cart` VALUES (165, 14, 67, 1);
INSERT INTO `cart` VALUES (166, 15, 52, 1);
INSERT INTO `cart` VALUES (167, 10, 69, 2);
INSERT INTO `cart` VALUES (168, 16, 67, 1);
INSERT INTO `cart` VALUES (169, 18, 67, 1);
INSERT INTO `cart` VALUES (170, 13, 47, 1);
INSERT INTO `cart` VALUES (171, 10, 58, 1);
INSERT INTO `cart` VALUES (172, 10, 68, 1);
INSERT INTO `cart` VALUES (173, 15, 47, 1);
INSERT INTO `cart` VALUES (174, 11, 58, 1);
INSERT INTO `cart` VALUES (175, 16, 43, 1);
INSERT INTO `cart` VALUES (176, 10, 46, 1);
INSERT INTO `cart` VALUES (177, 26, 47, 1);
INSERT INTO `cart` VALUES (178, 10, 66, 1);
INSERT INTO `cart` VALUES (179, 15, 58, 1);
INSERT INTO `cart` VALUES (180, 11, 44, 1);
INSERT INTO `cart` VALUES (181, 18, 52, 1);
INSERT INTO `cart` VALUES (198, 10, 2, 8);
INSERT INTO `cart` VALUES (199, 11, 2, 1);
INSERT INTO `cart` VALUES (200, 12, 2, 1);
INSERT INTO `cart` VALUES (201, 13, 2, 1);

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `goodsId` int(0) NULL DEFAULT NULL,
  `userId` int(0) NULL DEFAULT NULL,
  `amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (7, 14, 2, '1');
INSERT INTO `collect` VALUES (8, 15, 2, '1');
INSERT INTO `collect` VALUES (10, 10, 1, '1');
INSERT INTO `collect` VALUES (11, 10, 2, NULL);
INSERT INTO `collect` VALUES (12, 11, 1, '1');
INSERT INTO `collect` VALUES (13, 11, 2, '1');
INSERT INTO `collect` VALUES (14, 12, 2, '1');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cover` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `intro` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stock` int(0) NULL DEFAULT NULL,
  `type_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_type_id_idx`(`type_id`) USING BTREE,
  CONSTRAINT `fk_type_id` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 189 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (10, '玫瑰舒芙蕾222', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 2888, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.22222', 1000, 11);
INSERT INTO `goods` VALUES (11, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 3);
INSERT INTO `goods` VALUES (12, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (13, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (14, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (15, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 299, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (16, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (18, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (19, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 4);
INSERT INTO `goods` VALUES (20, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 4);
INSERT INTO `goods` VALUES (21, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (23, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (24, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (25, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (26, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (27, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (28, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (29, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 299, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (30, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (31, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (32, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (33, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (34, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (35, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (36, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 299, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (37, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (38, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (39, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 5);
INSERT INTO `goods` VALUES (40, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 5);
INSERT INTO `goods` VALUES (41, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (42, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 8);
INSERT INTO `goods` VALUES (43, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 299, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (44, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (45, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 11);
INSERT INTO `goods` VALUES (46, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (47, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 8);
INSERT INTO `goods` VALUES (48, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (49, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 8);
INSERT INTO `goods` VALUES (50, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 299, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (51, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (52, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (53, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 11);
INSERT INTO `goods` VALUES (54, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (55, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (56, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (57, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 299, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (58, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (59, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (60, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (61, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (62, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (63, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (64, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (65, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (66, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (67, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (68, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 299, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (69, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (70, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (71, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (72, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (73, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (74, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (75, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 299, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (76, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (77, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (78, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (79, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (80, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (81, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (82, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 299, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (83, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (84, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (85, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (86, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (87, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (88, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (89, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 299, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (90, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (91, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (92, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (93, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (94, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (95, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (97, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (98, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (99, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (100, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (101, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (102, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (103, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (104, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (105, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (106, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (108, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (109, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (110, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (111, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (112, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (113, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (114, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 299, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (115, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (116, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (117, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (118, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (119, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (120, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (121, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 299, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (122, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (123, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (124, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (125, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (126, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (127, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (128, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 299, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (129, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (130, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (131, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (132, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (133, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (134, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (135, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 299, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (136, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (137, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (138, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (139, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (140, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (141, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (142, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (143, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (144, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (145, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (146, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 299, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (147, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (148, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (149, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (150, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (151, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (152, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (153, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 299, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (154, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (155, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (156, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (157, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (158, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (159, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (160, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 299, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (161, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (162, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (163, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (164, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (165, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (166, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (167, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 299, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (168, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (169, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (170, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (171, '青森芝士条', '/picture/12-1.jpg', '/picture/1-2.jpg', '/picture/12-1.jpg', 36, '青森芝士和风轻拂,,奶香浓郁,质地柔滑,口感细腻.', 10, 2);
INSERT INTO `goods` VALUES (172, '蜂蜜蛋糕', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '蛋黄与蜂蜜,淡奶油共同演绎的曼妙之旅.口感Q糯浓郁,回味绵软柔长.皱巴巴的造型,甜蜜蜜的感受.', 10, 2);
INSERT INTO `goods` VALUES (173, '意大利芝士饼干', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 39, '采用帕玛森芝士为主要原材料制作的意大利芝士饼,奶香浓郁,鲜香可口.', 10, 2);
INSERT INTO `goods` VALUES (174, '小熊乐园', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 299, '走进小熊乐园,与可爱的小熊一起准备过冬的食物吧,摘颗草莓藏放在巧克力做的房子里,好朋友一起分享劳动的果实.\r\n主口味:草莓奶油味 主要原料:乳脂奶油,纯巧克力,朗姆酒,幼砂糖,鲜草莓 甜度:二星（满五星） 最佳食用温度：5-7摄氏度', 10, 3);
INSERT INTO `goods` VALUES (175, '草莓冰淇淋', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 299, '甜郁草莓配合冰淇淋的丝滑口感,让清爽与浪漫在爱情果园激情碰撞,恋上草莓,这份心情,美妙非凡.\r\n主口味:草莓口味 主要原料:草莓果溶 草莓  甜度:三星（满五星） 最佳食用温度：-12至-15摄氏度', 10, 1);
INSERT INTO `goods` VALUES (176, '玫瑰舒芙蕾', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 28, '优选法国芝士,奶香浓郁,质地柔滑,口感细腻.法国芝士有助于提升糕点的整体口感,完美平衡酸度与甜味,制作出的糕点更加洁白纯美.', 10, 2);
INSERT INTO `goods` VALUES (177, '半熟芝士', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '为了保证芝士的香醇,半熟芝士借鉴日本温泉煮鸡蛋的做法,把芝士,牛奶,鸡蛋,天然奶油,砂糖,小麦粉拌成面糊,通过水浴蒸烤,保证芝士蛋糕细嫩,柔软,留住芝士的香醇细滑.', 10, 2);
INSERT INTO `goods` VALUES (182, '口香糖', NULL, NULL, NULL, 2, '1234', 100, 3);
INSERT INTO `goods` VALUES (185, '口香糖3', '/picture/fa62f9ea-a14c-4d0a-843f-d66b4bd017e1_.jpg', '/picture/51688399-664a-4133-a72f-4598f4b23386_.jpg', '/picture/ae327c03-0eb4-42f2-b4bd-7829b56ac83e_.jpg', 10, '真好吃', 200, 3);
INSERT INTO `goods` VALUES (186, '口香糖4', '/picture/de8bd0c0-3aa8-4e51-a4c9-cb9c91a78b55_.jpg', '/picture/113eb100-bd6d-4031-9523-aa5e62a04191_.png', '/picture/749fbc30-d223-42a6-830f-f31acc5d11b4_.jpg', 20, '真贵', 50, 11);
INSERT INTO `goods` VALUES (187, '可乐', '/picture/7aa43687-10aa-4a5d-9a20-1300fcfdbd16_.jpeg', '/picture/9e7fcb09-1b54-4931-9240-48eece5b8d38_.png', '/picture/80cd3fb6-0732-4c03-a695-77afcb3c9d64_.jpg', 3, '可口可乐', 100, 5);
INSERT INTO `goods` VALUES (188, '12345', NULL, NULL, NULL, 100, '11', 100, 1);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `total` float NULL DEFAULT NULL,
  `amount` int(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `paytype` tinyint(1) NULL DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `datetime` datetime(0) NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user_id_idx`(`user_id`) USING BTREE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (75, 28, 1, 4, 2, '管理员', '1333333333', '中华人民共和国', '2019-10-07 12:31:07', 1);
INSERT INTO `order` VALUES (76, 184, 5, 2, 2, '123456', '15211112222', '马鞍山师专', '2023-03-29 02:29:17', 37);
INSERT INTO `order` VALUES (77, 3295, 5, 2, 2, 'vili', '1344444444', '中华人民共和国', '2023-04-03 01:11:54', 2);
INSERT INTO `order` VALUES (78, 111, 3, 2, 1, 'vili', '1344444444', '中华人民共和国', '2023-04-03 01:18:15', 2);
INSERT INTO `order` VALUES (79, 299, 1, 2, 1, 'wy', '18855843383', '安徽', '2023-04-03 01:24:31', 40);
INSERT INTO `order` VALUES (80, 75, 2, 2, 2, 'lihua', '12345678952', '马鞍山', '2023-04-03 01:24:43', 41);
INSERT INTO `order` VALUES (81, 3261, 4, 2, 1, 'qweasd', '123456', 'qweasd', '2023-04-03 01:24:49', 38);
INSERT INTO `order` VALUES (82, 409, 4, 2, 1, 'yzz', '15215597943', '安徽省马鞍山市雨山区', '2023-04-03 01:25:00', 46);
INSERT INTO `order` VALUES (83, 3863, 6, 2, 1, 'yh', '18756918326', '马鞍山师专', '2023-04-03 01:25:04', 43);
INSERT INTO `order` VALUES (84, 7272, 14, 2, 1, 'wmm', '12233344556', '马鞍山师范高等学校', '2023-04-03 01:25:09', 42);
INSERT INTO `order` VALUES (85, 141, 4, 2, 2, 'lisi', '12345678999', '马鞍山师专', '2023-04-03 01:25:10', 39);
INSERT INTO `order` VALUES (86, 3261, 4, 2, 1, 'xr', '18355054191', '马鞍山', '2023-04-03 01:25:16', 45);
INSERT INTO `order` VALUES (87, 371, 3, 2, 1, '123456', '18545245895', '马鞍山', '2023-04-03 01:25:17', 48);
INSERT INTO `order` VALUES (88, 9262, 5, 2, 1, 'zhang ', '19505501095', '滁州', '2023-04-03 01:25:22', 51);
INSERT INTO `order` VALUES (89, 5886, 5, 2, 1, 'fln', '12345678987', '马鞍山', '2023-04-03 01:25:27', 44);
INSERT INTO `order` VALUES (90, 49544, 22, 2, 2, '管理员', '1333333333', '中华人民共和国', '2023-04-03 01:25:29', 1);
INSERT INTO `order` VALUES (91, 6485, 7, 2, 1, 'ctt', '15155556666', '马师专', '2023-04-03 01:25:30', 47);
INSERT INTO `order` VALUES (92, 11965, 8, 2, 1, '金硕珍', '1343401204', '果川', '2023-04-03 01:27:03', 55);
INSERT INTO `order` VALUES (93, 5888, 5, 2, 1, 'ymy', '112356', '马鞍山师专', '2023-04-03 01:27:18', 57);
INSERT INTO `order` VALUES (94, 411, 4, 2, 1, 'yzz', '15215597943', '安徽省马鞍山市雨山区', '2023-04-03 01:27:20', 46);
INSERT INTO `order` VALUES (95, 412, 4, 2, 1, 'qweasd', '123456', 'qweasd', '2023-04-03 01:27:25', 38);
INSERT INTO `order` VALUES (96, 3524, 4, 2, 2, '金硕珍', '1343401204', '果川', '2023-04-03 01:27:27', 55);
INSERT INTO `order` VALUES (97, 3261, 4, 2, 1, 'xr', '123456789', '马鞍山', '2023-04-03 01:27:27', 45);
INSERT INTO `order` VALUES (98, 74, 2, 2, 2, 'Mary', '12345678901', '安徽省', '2023-04-03 01:27:30', 58);
INSERT INTO `order` VALUES (99, 374, 3, 2, 1, 'lisi', '12345678999', '马鞍山师专', '2023-04-03 01:27:30', 39);
INSERT INTO `order` VALUES (100, 4233, 9, 2, 2, 'wmm', '12233344556', '马鞍山师范高等学校', '2023-04-03 01:27:32', 42);
INSERT INTO `order` VALUES (101, 3596, 6, 2, 1, 'fln', '12345678987', '马鞍山', '2023-04-03 01:27:34', 44);
INSERT INTO `order` VALUES (102, 411, 4, 2, 1, 'mm', '123333333', '马鞍山', '2023-04-03 01:27:34', 50);
INSERT INTO `order` VALUES (103, 8999, 5, 2, 2, 'lihua', '12345678952', '马鞍山', '2023-04-03 01:27:35', 41);
INSERT INTO `order` VALUES (104, 2926, 2, 2, 1, '陈温柔', '15858656545', '安徽省马鞍山市', '2023-04-03 01:27:35', 62);
INSERT INTO `order` VALUES (105, 66, 2, 2, 2, 'wy', '18855843383', '安徽', '2023-04-03 01:27:36', 40);
INSERT INTO `order` VALUES (106, 3038, 5, 2, 2, 'vili', '1344444444', '中华人民共和国', '2023-04-03 01:31:25', 2);
INSERT INTO `order` VALUES (107, 2888, 1, 2, 1, 'wmm', '66666666', '火星', '2023-04-03 01:31:54', 42);
INSERT INTO `order` VALUES (108, 2924, 2, 2, 1, 'liucharan', '15556281057', '马鞍山', '2023-04-03 01:31:57', 72);
INSERT INTO `order` VALUES (109, 38, 1, 2, 1, '七七', '18177061521', '马鞍山', '2023-04-03 01:32:07', 56);
INSERT INTO `order` VALUES (110, 3673, 8, 2, 1, 'liucharan', '15556281057', '马鞍山', '2023-04-03 01:32:29', 72);
INSERT INTO `order` VALUES (111, 2888, 1, 2, 1, '七七', '18177061521', '马鞍山', '2023-04-03 01:32:36', 56);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `price` float NULL DEFAULT NULL,
  `amount` int(0) NULL DEFAULT NULL,
  `goods_id` int(0) NULL DEFAULT NULL,
  `order_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_id_idx`(`order_id`) USING BTREE,
  INDEX `fk_orderitem_goods_id_idx`(`goods_id`) USING BTREE,
  CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderitem_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 205 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (78, 28, 1, 10, 75);
INSERT INTO `orderitem` VALUES (79, 38, 2, 11, 76);
INSERT INTO `orderitem` VALUES (80, 36, 3, 12, 76);
INSERT INTO `orderitem` VALUES (81, 2888, 1, 10, 77);
INSERT INTO `orderitem` VALUES (82, 299, 1, 15, 77);
INSERT INTO `orderitem` VALUES (83, 36, 3, 12, 77);
INSERT INTO `orderitem` VALUES (84, 36, 2, 12, 78);
INSERT INTO `orderitem` VALUES (85, 39, 1, 14, 78);
INSERT INTO `orderitem` VALUES (86, 299, 1, 15, 79);
INSERT INTO `orderitem` VALUES (87, 39, 1, 14, 80);
INSERT INTO `orderitem` VALUES (88, 36, 1, 26, 80);
INSERT INTO `orderitem` VALUES (89, 38, 1, 11, 81);
INSERT INTO `orderitem` VALUES (90, 299, 1, 15, 81);
INSERT INTO `orderitem` VALUES (91, 36, 1, 12, 81);
INSERT INTO `orderitem` VALUES (92, 2888, 1, 10, 81);
INSERT INTO `orderitem` VALUES (93, 36, 1, 13, 82);
INSERT INTO `orderitem` VALUES (94, 36, 1, 26, 82);
INSERT INTO `orderitem` VALUES (95, 299, 1, 16, 82);
INSERT INTO `orderitem` VALUES (96, 38, 1, 18, 82);
INSERT INTO `orderitem` VALUES (97, 2888, 1, 10, 83);
INSERT INTO `orderitem` VALUES (98, 39, 2, 14, 83);
INSERT INTO `orderitem` VALUES (99, 299, 3, 15, 83);
INSERT INTO `orderitem` VALUES (100, 36, 2, 12, 84);
INSERT INTO `orderitem` VALUES (101, 39, 2, 14, 84);
INSERT INTO `orderitem` VALUES (102, 299, 3, 15, 84);
INSERT INTO `orderitem` VALUES (103, 36, 1, 13, 84);
INSERT INTO `orderitem` VALUES (104, 38, 2, 11, 84);
INSERT INTO `orderitem` VALUES (105, 299, 1, 16, 84);
INSERT INTO `orderitem` VALUES (106, 38, 1, 18, 84);
INSERT INTO `orderitem` VALUES (107, 2888, 2, 10, 84);
INSERT INTO `orderitem` VALUES (108, 36, 1, 12, 85);
INSERT INTO `orderitem` VALUES (109, 39, 1, 21, 85);
INSERT INTO `orderitem` VALUES (110, 28, 1, 31, 85);
INSERT INTO `orderitem` VALUES (111, 38, 1, 32, 85);
INSERT INTO `orderitem` VALUES (112, 38, 1, 11, 86);
INSERT INTO `orderitem` VALUES (113, 299, 1, 16, 86);
INSERT INTO `orderitem` VALUES (114, 2888, 1, 10, 86);
INSERT INTO `orderitem` VALUES (115, 36, 1, 40, 86);
INSERT INTO `orderitem` VALUES (116, 299, 1, 15, 87);
INSERT INTO `orderitem` VALUES (117, 36, 1, 13, 87);
INSERT INTO `orderitem` VALUES (118, 36, 1, 12, 87);
INSERT INTO `orderitem` VALUES (119, 2888, 3, 10, 88);
INSERT INTO `orderitem` VALUES (120, 299, 1, 15, 88);
INSERT INTO `orderitem` VALUES (121, 299, 1, 16, 88);
INSERT INTO `orderitem` VALUES (122, 2888, 2, 10, 89);
INSERT INTO `orderitem` VALUES (123, 36, 1, 12, 89);
INSERT INTO `orderitem` VALUES (124, 38, 1, 11, 89);
INSERT INTO `orderitem` VALUES (125, 36, 1, 13, 89);
INSERT INTO `orderitem` VALUES (126, 2888, 17, 10, 90);
INSERT INTO `orderitem` VALUES (127, 39, 1, 14, 90);
INSERT INTO `orderitem` VALUES (128, 36, 1, 13, 90);
INSERT INTO `orderitem` VALUES (129, 299, 1, 16, 90);
INSERT INTO `orderitem` VALUES (130, 38, 1, 18, 90);
INSERT INTO `orderitem` VALUES (131, 36, 1, 19, 90);
INSERT INTO `orderitem` VALUES (132, 2888, 2, 10, 91);
INSERT INTO `orderitem` VALUES (133, 36, 2, 12, 91);
INSERT INTO `orderitem` VALUES (134, 39, 1, 14, 91);
INSERT INTO `orderitem` VALUES (135, 299, 2, 15, 91);
INSERT INTO `orderitem` VALUES (136, 2888, 4, 10, 92);
INSERT INTO `orderitem` VALUES (137, 38, 3, 18, 92);
INSERT INTO `orderitem` VALUES (138, 299, 1, 16, 92);
INSERT INTO `orderitem` VALUES (139, 2888, 2, 10, 93);
INSERT INTO `orderitem` VALUES (140, 38, 2, 18, 93);
INSERT INTO `orderitem` VALUES (141, 36, 1, 19, 93);
INSERT INTO `orderitem` VALUES (142, 36, 1, 13, 94);
INSERT INTO `orderitem` VALUES (143, 38, 1, 11, 94);
INSERT INTO `orderitem` VALUES (144, 299, 1, 15, 94);
INSERT INTO `orderitem` VALUES (145, 38, 1, 18, 94);
INSERT INTO `orderitem` VALUES (146, 36, 1, 12, 95);
INSERT INTO `orderitem` VALUES (147, 299, 1, 15, 95);
INSERT INTO `orderitem` VALUES (148, 38, 1, 18, 95);
INSERT INTO `orderitem` VALUES (149, 39, 1, 14, 95);
INSERT INTO `orderitem` VALUES (150, 2888, 1, 10, 96);
INSERT INTO `orderitem` VALUES (151, 38, 1, 11, 96);
INSERT INTO `orderitem` VALUES (152, 299, 1, 16, 96);
INSERT INTO `orderitem` VALUES (153, 299, 1, 15, 96);
INSERT INTO `orderitem` VALUES (154, 2888, 1, 10, 97);
INSERT INTO `orderitem` VALUES (155, 299, 1, 16, 97);
INSERT INTO `orderitem` VALUES (156, 38, 1, 18, 97);
INSERT INTO `orderitem` VALUES (157, 36, 1, 13, 97);
INSERT INTO `orderitem` VALUES (158, 38, 1, 11, 98);
INSERT INTO `orderitem` VALUES (159, 36, 1, 26, 98);
INSERT INTO `orderitem` VALUES (160, 299, 1, 15, 99);
INSERT INTO `orderitem` VALUES (161, 36, 1, 19, 99);
INSERT INTO `orderitem` VALUES (162, 39, 1, 14, 99);
INSERT INTO `orderitem` VALUES (163, 299, 1, 23, 100);
INSERT INTO `orderitem` VALUES (164, 299, 1, 30, 100);
INSERT INTO `orderitem` VALUES (165, 2888, 1, 10, 100);
INSERT INTO `orderitem` VALUES (166, 36, 1, 13, 100);
INSERT INTO `orderitem` VALUES (167, 39, 1, 14, 100);
INSERT INTO `orderitem` VALUES (168, 299, 1, 15, 100);
INSERT INTO `orderitem` VALUES (169, 299, 1, 16, 100);
INSERT INTO `orderitem` VALUES (170, 38, 1, 18, 100);
INSERT INTO `orderitem` VALUES (171, 36, 1, 19, 100);
INSERT INTO `orderitem` VALUES (172, 36, 1, 12, 101);
INSERT INTO `orderitem` VALUES (173, 299, 1, 16, 101);
INSERT INTO `orderitem` VALUES (174, 299, 1, 15, 101);
INSERT INTO `orderitem` VALUES (175, 2888, 1, 10, 101);
INSERT INTO `orderitem` VALUES (176, 38, 1, 11, 101);
INSERT INTO `orderitem` VALUES (177, 36, 1, 26, 101);
INSERT INTO `orderitem` VALUES (178, 38, 2, 11, 102);
INSERT INTO `orderitem` VALUES (179, 36, 1, 12, 102);
INSERT INTO `orderitem` VALUES (180, 299, 1, 23, 102);
INSERT INTO `orderitem` VALUES (181, 2888, 3, 10, 103);
INSERT INTO `orderitem` VALUES (182, 299, 1, 15, 103);
INSERT INTO `orderitem` VALUES (183, 36, 1, 13, 103);
INSERT INTO `orderitem` VALUES (184, 2888, 1, 10, 104);
INSERT INTO `orderitem` VALUES (185, 38, 1, 11, 104);
INSERT INTO `orderitem` VALUES (186, 38, 1, 53, 105);
INSERT INTO `orderitem` VALUES (187, 28, 1, 45, 105);
INSERT INTO `orderitem` VALUES (188, 2888, 1, 10, 106);
INSERT INTO `orderitem` VALUES (189, 36, 1, 12, 106);
INSERT INTO `orderitem` VALUES (190, 36, 1, 13, 106);
INSERT INTO `orderitem` VALUES (191, 39, 2, 14, 106);
INSERT INTO `orderitem` VALUES (192, 2888, 1, 10, 107);
INSERT INTO `orderitem` VALUES (193, 2888, 1, 10, 108);
INSERT INTO `orderitem` VALUES (194, 36, 1, 12, 108);
INSERT INTO `orderitem` VALUES (195, 38, 1, 11, 109);
INSERT INTO `orderitem` VALUES (196, 299, 1, 15, 110);
INSERT INTO `orderitem` VALUES (197, 39, 1, 14, 110);
INSERT INTO `orderitem` VALUES (198, 299, 1, 16, 110);
INSERT INTO `orderitem` VALUES (199, 38, 1, 18, 110);
INSERT INTO `orderitem` VALUES (200, 36, 1, 13, 110);
INSERT INTO `orderitem` VALUES (201, 36, 1, 12, 110);
INSERT INTO `orderitem` VALUES (202, 38, 1, 11, 110);
INSERT INTO `orderitem` VALUES (203, 2888, 1, 10, 110);
INSERT INTO `orderitem` VALUES (204, 2888, 1, 10, 111);

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NULL DEFAULT NULL,
  `goods_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_goods_id_idx`(`goods_id`) USING BTREE,
  CONSTRAINT `fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES (10, 3, 10);
INSERT INTO `recommend` VALUES (11, 3, 12);
INSERT INTO `recommend` VALUES (12, 3, 13);
INSERT INTO `recommend` VALUES (13, 3, 14);
INSERT INTO `recommend` VALUES (14, 3, 15);
INSERT INTO `recommend` VALUES (15, 3, 16);
INSERT INTO `recommend` VALUES (17, 3, 18);
INSERT INTO `recommend` VALUES (18, 3, 19);
INSERT INTO `recommend` VALUES (29, 1, 42);
INSERT INTO `recommend` VALUES (33, 2, 10);
INSERT INTO `recommend` VALUES (34, 2, 11);
INSERT INTO `recommend` VALUES (35, 2, 12);
INSERT INTO `recommend` VALUES (36, 2, 13);
INSERT INTO `recommend` VALUES (37, 2, 14);
INSERT INTO `recommend` VALUES (38, 2, 15);
INSERT INTO `recommend` VALUES (39, 2, 16);
INSERT INTO `recommend` VALUES (40, 2, 18);
INSERT INTO `recommend` VALUES (41, 2, 26);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '冰淇淋系列');
INSERT INTO `type` VALUES (2, '零食系列');
INSERT INTO `type` VALUES (3, '儿童系列');
INSERT INTO `type` VALUES (4, '法式系列');
INSERT INTO `type` VALUES (5, '经典系列');
INSERT INTO `type` VALUES (8, '节日系列');
INSERT INTO `type` VALUES (11, '买不起系列');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isadmin` bit(1) NULL DEFAULT NULL,
  `isvalidate` bit(1) NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_UNIQUE`(`username`) USING BTREE,
  UNIQUE INDEX `email_UNIQUE`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin@vilicode.com', 'admin', '管理员', '1333333333', '中华人民共和国', b'1', b'0', '/images/a6c417b4-b952-4161-a8b3-4afef1e536f8_.jpeg', '1');
INSERT INTO `user` VALUES (2, 'vili', 'vili@vilicode.com', 'vili', 'vili', '1344444444', '中华人民共和国', b'0', b'0', '/images/59cb28d0-181a-4958-88c4-6b674d8fbf8a_.jpeg', '96');
INSERT INTO `user` VALUES (37, 'zhangsan', 'zhangsan@qq.com', '123456', '123456', '15211112222', '马鞍山师专', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (38, 'qweasd', 'qweasd', 'qweasd', 'qweasd', '123456', 'qweasd', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (39, 'lisi', '25645856555@qq.com', '123456', 'lisi', '12345678999', '马鞍山师专', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (40, 'wmy', '2667160466@qq.com', '1108', 'wy', '18855843383', '安徽', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (41, 'lihua', 'lihua', 'lihua', 'lihua', '12345678952', '马鞍山', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (42, 'wmm', '3022222222@qq.com', '123456', 'wmm', '12233344556', '火星', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (43, 'yh', '2217009397@qq.com', '123456', 'yh', '18756918326', '马鞍山师专', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (44, 'fln', '123456789@qq.com', '123456', '', '', '', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (45, 'xr', '3021687979@qq.com', 'xr021029', 'xr', '123456789', '马鞍山', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (46, '叶珍琦', '2854689348@qq.com', '123456', 'yzz', '15215597943', '安徽省马鞍山市雨山区', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (47, 'ctt', '2429018950@qq.com', 'xzq172900', 'ctt', '15155556666', '马师专', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (48, 'wangwu', '2087433201@qq.com', '123456', '123456', '18545245895', '马鞍山', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (49, 'sy', '1234566789@qq', '123456', 'sss', '123456', 'sssyyy', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (50, 'leize', '3344@qq.com', '2222', 'mm', '123333333', '马鞍山', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (51, 'zhang', '3437599807@qq.com', '123456', 'zhang ', '19505501095', '滁州', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (52, 'ly', '1956734787@qq.com', '123', 'ly', '15612357894', '地球', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (53, 'haha', '1134515966@qq.com', 'hjy081213', 'haha', '18055037985', '安徽省马鞍山市', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (54, 'sxy', '1747879285@qq.com', '225318', 'sxy', '17856093999', '马鞍山', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (55, 'jin', '123456@qq.com', '123456', '金硕珍', '1343401204', '果川', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (56, '77', '1742434630@qq.com', '123456', '七七', '18177061521', '马鞍山', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (57, 'ymy123', 'ymy123', '123456', 'ymy', '112356', '马鞍山师专', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (58, 'Jackson', '1111111@qq.com', '123123123', 'Mary', '12345678901', '安徽省', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (59, 'sgfd', '128947', '12345', 'gtgg', '34598760543', 'fdregfgf', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (60, '童年', '263715563', '123456', '小童', '18098349711', '马鞍山', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (61, 'fjy', '2015385972', '123456', 'fjy', '13712345678', '安徽省马鞍山市', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (62, 'chenwenrou', '2674672586@qq.com', 'DOUDOU0329.', '陈温柔', '15858656545', '安徽省马鞍山市', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (63, '1759191933', '1759191933@qq.com', '123456', '胡锦玥', '19370163632', '马鞍山师范高等专科学校', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (64, 'wym', '198661540', '123456', 'wym', '18355682325', '马鞍山师专', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (65, '77777', '77777', '77777', '77777', '77777', '77777', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (66, 'eee', 'eee', 'eee', 'eee', 'eee', 'eee', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (67, 'xiaojiang', 'xiaojiang@qq.com', '123456', 'xiaojiang', '15105670691', '安徽亳州', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (68, 'wk', '1179238248@qq.com', '123456wk', 'wk', '12345678999', '1', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (69, 'zqd', '1171788956@qq.com', '123456', 'zqd', '110', 'wg', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (70, 'min001', '1544885465@qq.com', 'zhang', 'zhang', '13160145220', '马鞍山', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (71, 'lh', '32535425@qq.com', '123456', '阿斯达', '1349849223', '史蒂夫', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (72, 'lcr123', '1503007997@qq.com', '666666', 'liucharan', '15556281057', '马鞍山', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (73, '', '', '', '', '', '', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (74, '9999', '999999@qq.com', '9', '9', '9', '9', b'0', b'0', NULL, NULL);
INSERT INTO `user` VALUES (75, '99999', '9999999@qq.com', '96225224wk', '9', '9', '9', b'0', b'0', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
