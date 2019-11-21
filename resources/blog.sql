/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2018-04-15 20:35:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(45) default NULL,
  `personId` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('30', 'admin', 'admin', 'admin', '1');
INSERT INTO `account` VALUES ('31', 'Adrian', '123', 'admin', '2');

-- ----------------------------
-- Table structure for `blog`
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL auto_increment,
  `subject` varchar(100) default NULL,
  `restaurant` varchar(100) default NULL,
  `body` varchar(500) default NULL,
  `personId` int(11) default NULL,
  `createTime` timestamp default CURRENT_TIMESTAMP,
  `imageurl` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;



CREATE DEFINER=`root`@`%` TRIGGER `blog_BEFORE_INSERT` BEFORE INSERT ON `blog` FOR EACH ROW BEGIN
set new.createTime = CURRENT_TIMESTAMP;
END


-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('9', 'Gourmet-style street food', 'The Savage Wiener','Take out (Pig-nic for 6): Great corn, exceptional sauces, good brisket, good ribs, mediocre chicken (portion was off). Decent mashed, gelatinous gravy, awesome slaw and wonderful cornbread. Not dry as others suggest.', '1', '2018-12-15 12:47:21','images/hotdog.png');
INSERT INTO `blog` VALUES ('10', 'Dieters Favourite', 'sweetgreen','Excellent little restaurant!  My friend and I split the falafel appetizer and each had a gyro. Total bill was around $24. The food was delicious-especially the homemade pita!  I think we have found our new lunch spot.', '2', '2018-12-15 12:47:57','images/salad.png');
INSERT INTO `blog` VALUES ('11', 'I like Burgers!','MOOYAH Burgers', 'Best fast burger in Dorchester, and Antonio is always courteous. My daughter loves the chicken tenders!', '2', '2018-12-15 12:47:57','images/burger.png');
INSERT INTO `blog` VALUES ('12', 'Fries Fries Fries!','Fries & Shakes', 'As many other posts here say, one of best veggie burgers you can have is at this place.', '3', '2018-12-15 12:47:57','images/fries.png');
INSERT INTO `blog` VALUES ('13', 'Best sweetmeat is pancake','The Loading Dock', 'The sandwiches here are absolutely delicious. I have never been disappointed with what I ve gotten and there s lots of good options.', '2', '2018-12-15 12:47:57','images/pancake.png');
INSERT INTO `blog` VALUES ('14', 'Pizza is not simple', 'Big Daddys Pizza','Everything is on POINT!!!!!!!!! Let me describe a slice of there pizza. The dough is thin and crunchy, the tomato sauce is juicy and flavor-able, it was made with REAL tomato.', '1', '2018-12-15 12:47:57','images/pizza.png');
INSERT INTO `blog` VALUES ('15', 'Healthy seafood, delicious shrimp', 'Loui Loui','Shaking crabs foods quality is great there. Seafood is always fresh. I recommend getting 1 lb of seafood/person. Things we always get there are snow crab legs and shrimp head on. ', '3', '2018-12-15 12:47:57','images/shrimp.png');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL auto_increment,
  `subject` varchar(100) default NULL,
  `body` varchar(500) default NULL,
  `blogId` int(11) default NULL,
  `personId` int(11) default NULL,
  `createTime` timestamp default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


CREATE DEFINER=`root`@`%` TRIGGER `blog_BEFORE_INSERT` BEFORE INSERT ON `comment` FOR EACH ROW BEGIN
set new.createTime = CURRENT_TIMESTAMP;
END

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', 'good!!', 'Without question&#65292;many of us have mastered the neurotic art of spending much of our lives worrying about a variety of things &#65293;&#65293;all at once&#65294;We allow past problems and future concerns to dominate our present moments&#65292;so much so that we end up anxious&#65292;frustrated&#65292;depressed&#65292;and hopeless&#65294;', '14', '2', '2018-04-15 12:48:43');
INSERT INTO `comment` VALUES ('2', '11', '11', '16', '2', '2018-04-15 12:49:07');
INSERT INTO `comment` VALUES ('4', 'Yes', 'Yes', '15', '1', '2018-04-15 15:37:20');
INSERT INTO `comment` VALUES ('5', 'OK', 'Being happy, once it is realized as a duty and established as a habit, opens doors into unimaginable gardens thronged with grateful friends.', '14', '2', '2018-04-15 15:38:14');

-- ----------------------------
-- Table structure for `friend`
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
  `id` int(11) NOT NULL auto_increment,
  `personId` int(11) NOT NULL,
  `friendId` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friend
-- ----------------------------
INSERT INTO `friend` VALUES ('37', '2', '1');
INSERT INTO `friend` VALUES ('38', '1', '2');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL auto_increment,
  `subject` varchar(200) default NULL,
  `body` varchar(2000) default NULL,
  `senderId` int(11) default NULL,
  `receiverId` int(11) default NULL,
  `createTime` timestamp default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('12', 'Hello', 'I like the picture you post.', '1', '2', '2018-12-12 15:29:30');
INSERT INTO `message` VALUES ('15', 'OK', 'Great, I will go to that restaurant next time.', '2', '1', '2018-12-13 15:45:11');

-- ----------------------------
-- Table structure for `person`
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11) NOT NULL auto_increment,
  `fname` varchar(45) default NULL,
  `lname` varchar(45) default NULL,
  `mname` varchar(45) default NULL,
  `gender` varchar(45) default NULL,
  `dob` varchar(15) default NULL,
  `addr` varchar(100) default NULL,
  `zip` varchar(45) default NULL,
  `city` varchar(45) default NULL,
  `state` varchar(45) default NULL,
  `country` varchar(45) default NULL,
  `email` varchar(45) default NULL,
  `status` varchar(45) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('1', 'Bruce', 'Wayne', '', 'Male', '09/12/2009', '150-08 60th Ave.', 'NY 10001', 'New York', 'New York', 'USA', 'admin@admin.com','0');
INSERT INTO `person` VALUES ('2', 'Selina', 'Kyle', '', 'Female', '20/12/2001', '910 42TH STREET 1FL  BROOKLYN NEW YORK N.Y 11219', '100081', 'Covina', 'CA', 'USA', 'www.123.com', '0');
