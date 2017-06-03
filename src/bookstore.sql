/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : bookstore

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2017-02-04 12:48:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `adminId` char(32) NOT NULL,
  `adminname` varchar(50) DEFAULT NULL,
  `adminpwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'feng', '123');

-- ----------------------------
-- Table structure for t_book
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book` (
  `bid` char(32) NOT NULL,
  `bname` varchar(200) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `currPrice` decimal(8,2) DEFAULT NULL,
  `discount` decimal(3,1) DEFAULT NULL,
  `press` varchar(100) DEFAULT NULL,
  `publishtime` char(10) DEFAULT NULL,
  `edition` int(11) DEFAULT NULL,
  `pageNum` int(11) DEFAULT NULL,
  `wordNum` int(11) DEFAULT NULL,
  `printtime` char(10) DEFAULT NULL,
  `booksize` int(11) DEFAULT NULL,
  `paper` varchar(50) DEFAULT NULL,
  `cid` char(32) DEFAULT NULL,
  `image_w` varchar(100) DEFAULT NULL,
  `image_b` varchar(100) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  `saleNum` int(11) DEFAULT '1',
  PRIMARY KEY (`bid`),
  KEY `orderBy` (`orderBy`),
  KEY `FK_t_book_t_category` (`cid`),
  CONSTRAINT `FK_t_book_t_category` FOREIGN KEY (`cid`) REFERENCES `t_category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES ('0BE0707984014E66BD9F34F534FCE0F7', 'OSGi实战【OSGi规范制定者亲自撰写 汇集Apache项目技术实战经验】', 'Richard', '99.00', '68.30', '6.9', '人民邮电出版社', '2013-1-1', '1', '468', '721000', '2013-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22938396-1_w.jpg', 'book_img/22938396-1_b.jpg', '58', '19');
INSERT INTO `t_book` VALUES ('0EE8A0AE69154287A378FB110FF2C780', 'Java核心技术：卷Ⅰ基础知识（原书第8版）', '昊斯特曼', '98.00', '67.60', '6.9', '机械工业出版社', '2008-6-1', '1', '694', '0', '2008-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20285763-1_w.jpg', 'book_img/20285763-1_b.jpg', '12', '12');
INSERT INTO `t_book` VALUES ('113D0D1BB9174DD19A7DE7E2B37F677F', 'Java7入门经典（跟编程导师Ivor Horton学Java 预计到货日期9月初）', '霍尔顿', '118.00', '81.40', '6.9', '清华大学出版社', '2012-8-1', '1', '1124', '1918000', '2012-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22813026-1_w.jpg', 'book_img/22813026-1_b.jpg', '94', '14');
INSERT INTO `t_book` VALUES ('1286B13F0EA54E4CB75434762121486A', 'Java核心技术 卷I：基础知识(第9版·英文版)(上、下册)', '霍斯特曼', '109.00', '75.20', '6.9', '人民邮电出版社', '2013-7-1', '1', '0', '1197000', '2013-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23280479-1_w.jpg', 'book_img/23280479-1_b.jpg', '65', '92');
INSERT INTO `t_book` VALUES ('13EBF9B1FDE346A683A1C45BD6773ECB', 'Java开发实战1200例（第Ⅱ卷）（史上最全的“编程实例”类图书，代码分析、实例速查、练习巩固的绝好帮手）', '无', '99.00', '68.30', '6.9', '清华大学出版社', '0', '1', '0', '1754000', '2011-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21110930-1_w_1.jpg', 'book_img/21110930-1_b.jpg', '83', '6');
INSERT INTO `t_book` VALUES ('1A0001D8F982465CB4BB5CBE2E382A53', 'Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）', 'Craig Walls', '59.00', '40.70', '6.9', '人民邮电出版社', '2013-6-1', '1', '374', '48700', '2013-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/659F759278444451A9D8B1FDFBDB737A_20285763-1_w.jpg', 'book_img/210101362A2A413BA085E8BE5AEAAC22_20285763-1_b.jpg', '98', '6');
INSERT INTO `t_book` VALUES ('1A15DC5E8A014A58862ED741D579B530', 'Java深入解析——透析Java本质的36个话题', '梁勇', '49.00', '33.80', '6.9', '电子工业出版社', '2013-11-1', '1', '298', '424000', '2013-11-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23363997-1_w_1.jpg', 'book_img/23363997-1_b.jpg', '86', '93');
INSERT INTO `t_book` VALUES ('1B95CC0FBBAB4B7691D959EA5E1C811F', 'Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）', 'Craig Walls', '59.00', '40.70', '6.9', '人民邮电出版社', '2013-6-1', '1', '374', '488', '2013-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/9D139B2A5FAA46D4AB5F5E232CCD46E8_2.jpg', 'book_img/ADFAEF4E31894E1DAFECC36337B878AE_2.jpg', '102', '908');
INSERT INTO `t_book` VALUES ('210A3DCA429049C78B623C3986BEB136', 'JavaScript经典教程套装：JavaScript高级程序设计(第3版)+JavaScript DOM编程艺术(第2版)(套装共2册)(超值附赠《码农》光盘1张)', 'Nicholas C. Zakas', '148.00', '88.80', '6.0', '人民邮电出版社', '2013-4-1', '1', '1048', '0', '2013-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23224089-1_w.jpg', 'book_img/23224089-1_b.jpg', '93', '892');
INSERT INTO `t_book` VALUES ('22234CECF15F4ECB813F0B433DDA5365', 'JavaScript从入门到精通（附光盘1张）（连续8月JavaScript类全国零售排行前2名，13小时视频，400个经典实例、369项面试真题、138项测试史上最全资源库）', '明日科技', '69.80', '48.20', '6.9', '清华大学出版社', '2012-9-1', '1', '532', '939000', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22862057-1_w.jpg', 'book_img/22862057-1_b.jpg', '20', '0');
INSERT INTO `t_book` VALUES ('230A00EC22BF4A1DBA87C64800B54C8D', 'Struts2技术内幕：深入解析Struts架构设计与实现原理', '陆舟', '69.00', '47.60', '6.9', '机械工业出版社', '2012-1-1', '1', '379', '0', '2012-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22577578-1_w.jpg', 'book_img/22577578-1_b.jpg', '56', null);
INSERT INTO `t_book` VALUES ('260F8A3594F741C1B0EB69616F65045B', 'Tomcat与Java Web开发技术详解（第2版）(含光盘1张)', '孙卫琴', '79.50', '54.90', '6.9', '电子工业出版社', '2009-1-1', '1', '734', '1216000', '2009-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20420983-1_w.jpg', 'book_img/20420983-1_b.jpg', '74', null);
INSERT INTO `t_book` VALUES ('28A03D28BAD449659A77330BE35FCD65', 'JAVA核心技术卷II：高级特性（原书第8版）', '霍斯特曼', '118.00', '81.40', '6.9', '机械工业出版社', '2008-12-1', '1', '852', '0', '2008-12-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20446562-1_w.jpg', 'book_img/20446562-1_b.jpg', '18', null);
INSERT INTO `t_book` VALUES ('2EC4E6A869D54A368B86BC9F836D04DD', 'Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）', 'Craig Walls', '59.00', '40.70', '6.9', '人民邮电出版社', '2013-6-1', '1', '374', '48700', '2013-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/57D5812BE3FA414C9C8519E019C22D4B_20285763-1_w.jpg', 'book_img/7A80DE1F6B0940B48187156D379AE532_20285763-1_b.jpg', '97', '0');
INSERT INTO `t_book` VALUES ('2EE1A20A6AF742E387E18619D7E3BB94', 'Java虚拟机并发编程(Java并发编程领域的里程碑之作，资深Java技术专家、并发编程专家、敏捷开发专家和Jolt大奖得主撰写，Amazon五星畅销书)', 'Venkat Subramaniam', '59.00', '40.70', '6.9', '机械工业出版社', '2013-5-1', '1', '215', '0', '2013-5-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23239786-1_w.jpg', 'book_img/23239786-1_b.jpg', '54', null);
INSERT INTO `t_book` VALUES ('33ACF97A9A374352AE9F5E89BB791262', '基于MVC的JavaScript Web富应用开发', '麦卡劳', '59.00', '40.70', '6.9', '电子工业出版社', '2012-5-1', '1', '282', '462000', '2012-5-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22757564-1_w.jpg', 'book_img/22757564-1_b.jpg', '34', null);
INSERT INTO `t_book` VALUES ('37F75BEAE1FE46F2B14674923F1E7987', '数据结构与算法分析Java语言描述 第2版', '韦斯', '55.00', '38.00', '6.9', '机械工业出版社', '2009-1-1', '2', '440', '0', '2009-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20417467-1_w.jpg', 'book_img/20417467-1_b.jpg', '32', null);
INSERT INTO `t_book` VALUES ('39F1D0803E8F4592AE1245CACE683214', 'Java程序员修炼之道', '埃文斯', '89.00', '61.40', '6.9', '人民邮电出版社', '2013-8-1', '1', '395', '658000', '2013-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23301847-1_w_1.jpg', 'book_img/23301847-1_b.jpg', '36', null);
INSERT INTO `t_book` VALUES ('3AE5C8B976B6448A9D3A155C1BDE12BC', '深入理解Java虚拟机:JVM高级特性与最佳实践（超级畅销书，6个月5次印刷，从实践角度解析JVM工作原理，Java程序员必备）', '周志明', '69.00', '47.60', '6.9', '机械工业出版社', '0', '1', '0', '0', '2011-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21108671-1_w_1.jpg', 'book_img/21108671-1_b.jpg', '66', null);
INSERT INTO `t_book` VALUES ('3DD187217BF44A99B86DD18A4DC628BA', 'Java核心技术 卷1 基础知识（原书第9版）', '霍斯特曼，科内尔', '119.00', '82.10', '6.9', '机械工业出版社', '2014-1-1', '1', '704', '0', '2014-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23362142-1_w_1.jpg', 'book_img/23362142-1_b.jpg', '9', null);
INSERT INTO `t_book` VALUES ('3E1990E19989422E9DA735978CB1E4CE', 'Effective Java中文版(第2版)', '布洛克', '52.00', '35.90', '6.9', '机械工业出版社', '2009-1-1', '2', '287', '0', '2009-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20459091-1_w.jpg', 'book_img/20459091-1_b.jpg', '25', null);
INSERT INTO `t_book` VALUES ('400D94DE5A0742B3A618FC76DF107183', 'JavaScript宝典（第7版）（配光盘）', '古德曼', '128.00', '88.30', '6.9', '清华大学出版社', '2013-1-1', '1', '1012', '1657000', '2013-1-1', '32', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23169892-1_w.jpg', 'book_img/23169892-1_b.jpg', '88', null);
INSERT INTO `t_book` VALUES ('40BAAA9A37ED4B67BD8B46B8FEE1810A', 'Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）', 'Craig Walls', '59.00', '40.70', '6.9', '人民邮电出版社', '2013-6-1', '1', '374', '48700', '2013-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/093FEB120C144F50830BA9F040BABA12_20285763-1_w.jpg', 'book_img/AD4CDF7A76FB4E5A9F8F0D3FE7AE331A_20285763-1_b.jpg', '99', null);
INSERT INTO `t_book` VALUES ('4491EA4832E04B8B94F334B71E871983', 'Java语言程序设计：进阶篇（原书第8版）', '梁勇', '79.00', '54.50', '6.9', '机械工业出版社', '2011-6-1', '1', '507', '0', '2011-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21117631-1_w_1.jpg', 'book_img/21117631-1_b.jpg', '48', null);
INSERT INTO `t_book` VALUES ('49D98E7916B94232862F7DCD1B0BAB66', 'HTML5+JavaScript动画基础', '兰贝塔', '69.00', '47.60', '6.9', '人民邮电出版社', '2013-6-1', '1', '393', '553000', '2013-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23266633-1_w.jpg', 'book_img/23266633-1_b.jpg', '51', null);
INSERT INTO `t_book` VALUES ('4BF6D97DD18A4B77B8DED9B057577F8F', 'Java Web从入门到精通（附光盘1张）（连续8月Java类全国零售排行前2名，27小时视频，951个经典实例、369项面试真题、596项测试史上最全资源库）', '明日科技', '69.80', '48.20', '6.9', '清华大学出版社', '2012-9-1', '1', '547', '979000', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22862056-1_w.jpg', 'book_img/22862056-1_b.jpg', '23', null);
INSERT INTO `t_book` VALUES ('4C3331CAD5A5453787A94B8D7CCEAA29', 'Java Web整合开发王者归来（JSP+Servlet+Struts+Hibernate+Spring）（配光盘', '刘京华', '99.80', '68.90', '6.9', '清华大学出版社', '2010-1-1', '1', '1010', '1368000', '2010-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20756351-1_w_1.jpg', 'book_img/20756351-1_b_1.jpg', '17', null);
INSERT INTO `t_book` VALUES ('4D20D2450B084113A331D909FF4975EB', 'jQuery实战(第2版)(畅销书升级版，掌握Web开发利器必修宝典)', 'Bear Bibeault　Yehuda Katz ', '69.00', '47.60', '6.9', '人民邮电出版社', '2012-3-1', '1', '394', '617000', '2012-3-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22638286-1_w.jpg', 'book_img/22638286-1_b.jpg', '79', null);
INSERT INTO `t_book` VALUES ('4E44405DAFB7413E8A13BBFFBEE73AC7', 'JavaScript经典实例', '鲍尔斯', '78.00', '53.80', '6.9', '中国电力出版社', '2012-3-1', '1', '512', '625000', '2012-3-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22692811-1_w.jpg', 'book_img/22692811-1_b.jpg', '68', null);
INSERT INTO `t_book` VALUES ('504FB999B0444B339907090927FDBE8A', '深入浅出Ext JS(第3版)', '徐会生', '69.00', '47.60', '6.9', '人民邮电出版社', '2013-10-1', '3', '413', '642000', '2013-10-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23351049-1_w_1.jpg', 'book_img/23351049-1_b.jpg', '71', null);
INSERT INTO `t_book` VALUES ('52077C8423B645A9BADA96A5E0B14422', 'Spring源码深度解析', '郝佳', '69.00', '47.60', '6.9', '人民邮电出版社', '2013-9-1', '1', '386', '545000', '2013-8-30', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23329703-1_w_1.jpg', 'book_img/23329703-1_b.jpg', '52', null);
INSERT INTO `t_book` VALUES ('52B0EDFF966E4A058BDA5B18EEC698C4', '亮剑Java Web项目开发案例导航(含DVD光盘1张)', '朱雪琴', '69.00', '41.40', '6.0', '电子工业出版社', '2012-3-1', '1', '526', '875000', '2012-3-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22623766-1_w.jpg', 'book_img/22623766-1_b.jpg', '81', null);
INSERT INTO `t_book` VALUES ('5315DA60D24042889400AD4C93A37501', 'Spring 3.x企业应用开发实战(含CD光盘1张)', '陈雄华', '90.00', '62.10', '6.9', '电子工业出版社', '2012-2-1', '1', '710', '1158000', '2012-2-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22605701-1_w.jpg', 'book_img/22605701-1_b.jpg', '24', null);
INSERT INTO `t_book` VALUES ('56B1B7D8CD8740B098677C7216A673C4', '疯狂 Java 程序员的基本修养（《疯狂Java讲义》最佳拍档，扫清知识死角，夯实基本功）', '李刚', '59.00', '40.70', '6.9', '电子工业出版社', '2013-1-1', '1', '484', '7710000', '2013-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23042420-1_w.jpg', 'book_img/23042420-1_b.jpg', '89', null);
INSERT INTO `t_book` VALUES ('57B6FF1B89C843C38BA39C717FA557D6', '了不起的Node.js: 将JavaScript进行到底（Web开发首选实时 跨多服务器 高并发）', 'Guillermo Rauch', '79.00', '54.50', '6.9', '电子工业出版社', '2014-1-1', '1', '292', '436000', '2014-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23368351-1_w_2.jpg', 'book_img/23368351-1_b.jpg', '8', null);
INSERT INTO `t_book` VALUES ('5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '明日科技', '59.80', '41.30', '6.9', '清华大学出版社', '2012-9-1', '3', '564', '1013000', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22862060-1_w.jpg', 'book_img/22862060-1_b.jpg', '1', null);
INSERT INTO `t_book` VALUES ('5EDB981339C342ED8DB17D5A198D50DC', 'Java程序性能优化', '葛一鸣', '59.00', '40.70', '6.9', '清华大学出版社', '2012-10-1', '1', '400', '649000', '2012-10-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22881618-1_w.jpg', 'book_img/22881618-1_b.jpg', '27', null);
INSERT INTO `t_book` VALUES ('6398A7BA400D40258796BCBB2B256068', 'JavaScript设计模式', 'Addy Osmani', '49.00', '33.80', '6.9', '人民邮电出版社', '2013-6-1', '1', '241', '301000', '2013-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23266635-1_w.jpg', 'book_img/23266635-1_b.jpg', '40', null);
INSERT INTO `t_book` VALUES ('676B56A612AF4E968CF0F6FFE289269D', 'JavaScript和jQuery实战手册（原书第2版）', '麦克法兰', '99.00', '68.30', '6.9', '机械工业出版社', '2013-3-11', '1', '504', '0', '2013-3-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23201813-1_w.jpg', 'book_img/23201813-1_b.jpg', '42', null);
INSERT INTO `t_book` VALUES ('7917F5B19A0948FD9551932909328E4E', 'Java项目开发案例全程实录（第2版）（配光盘）（软件项目开发全程实录丛书）', '明日科技', '69.80', '48.20', '6.9', '清华大学出版社', '2011-1-1', '2', '605', '1037000', '2011-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20991549-1_w_1.jpg', 'book_img/20991549-1_b.jpg', '64', null);
INSERT INTO `t_book` VALUES ('7C0C785FFBEC4DEC802FA36E8B0BC87E', '深入分析Java Web技术内幕', '许令波', '69.00', '47.60', '6.9', '电子工业出版社', '2012-9-1', '1', '442', '746000', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22881803-1_w.jpg', 'book_img/22881803-1_b.jpg', '50', null);
INSERT INTO `t_book` VALUES ('7CD79C20258F477AB841518D9312E843', 'Java程序员面试宝典（第三版）', '欧立奇', '49.00', '33.80', '6.9', '电子工业出版社', '2013-9-1', '1', '359', '446400', '2013-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23348683-1_w_1.jpg', 'book_img/23348683-1_b.jpg', '44', null);
INSERT INTO `t_book` VALUES ('7D7FE81293124793BDB2C6FF1F1C943D', '21天学通Java(第6版)（中文版累计销量超30000册）', 'Rogers Cadenhead', '55.00', '38.00', '6.9', '人民邮电出版社', '2013-4-1', '1', '410', '781000', '2013-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23219731-1_w.jpg', 'book_img/23219731-1_b.jpg', '46', null);
INSERT INTO `t_book` VALUES ('7FD7F50B15F74248AA769798909F8653', 'Java网络编程（第3版）——O’Reilly Java系列', '哈诺德', '85.00', '51.00', '6.0', '中国电力出版社', '2005-11-1', '1', '718', '668000', '2005-11-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/9062293-1_w.jpg', 'book_img/9062293-1_b.jpg', '35', null);
INSERT INTO `t_book` VALUES ('819FF56E4423462394E6F83882F78975', '学通Java Web的24堂课（配光盘）（软件开发羊皮卷）', '陈丹丹', '79.80', '55.10', '6.9', '清华大学出版社', '2011-6-1', '1', '718', '1488000', '2011-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21118835-1_w_1.jpg', 'book_img/21118835-1_b.jpg', '91', null);
INSERT INTO `t_book` VALUES ('81FADA99309342F4978D5C680B0C6E8C', 'Java入门很简单（配光盘）（入门很简单丛书）（打开Java编程之门 Java技术网推荐）', '李世民', '59.80', '41.30', '6.9', '清华大学出版社', '2012-8-1', '1', '459', '745000', '2012-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22839309-1_w.jpg', 'book_img/22839309-1_b.jpg', '85', null);
INSERT INTO `t_book` VALUES ('89A57D099EA14026A5C3D10CFC10C22C', 'Java 2实用教程（第4版）（21世纪高等学校计算机基础实用规划教材）', '耿祥义', '39.50', '31.60', '8.0', '清华大学出版社', '2012-8-1', '4', '479', '782000', '2012-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22844118-1_w.jpg', 'book_img/22844118-1_b.jpg', '73', null);
INSERT INTO `t_book` VALUES ('8A5B4042D5B14D6B87A34DABF327387F', 'Java核心技术 卷II：高级特性(第9版·英文版)(上、下册)', '霍斯特曼', '119.00', '82.10', '6.9', '人民邮电出版社', '2013-7-1', '1', '1118', '1370000', '2013-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23280478-1_w.jpg', 'book_img/23280478-1_b.jpg', '57', null);
INSERT INTO `t_book` VALUES ('8DD0ADF2665B40899E09ED2983DC3F7B', 'jQuery权威指南（被公认的权威的、易学的jQuery实战教程，多次重印，热销中）', '陶国荣', '59.00', '40.70', '6.9', '机械工业出版社', '2011-1-1', '1', '385', '0', '2011-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21006995-1_w_1.jpg', 'book_img/21006995-1_b.jpg', '75', null);
INSERT INTO `t_book` VALUES ('8F1520F2CED94C679433B9C109E791CB', 'Java从入门到精通（实例版）（附光盘1张）（连续8月Java类全国零售排行前2名，14小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '明日科技', '69.80', '47.60', '6.9', '清华大学出版社', '2012-9-1', '1', '548', '986000', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22862061-1_w.jpg', 'book_img/22862061-1_b.jpg', '49', null);
INSERT INTO `t_book` VALUES ('90E423DBE56042838806673DB3E86BD3', '《Spring技术内幕（第2版）》（畅销书全新升级，Spring类图书销量桂冠，从宏观和微观两个角度解析Spring架构设计和实现原理）', '计文柯', '69.00', '47.60', '6.9', '机械工业出版社', '2012-2-1', '2', '399', '0', '2012-2-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22606836-1_w.jpg', 'book_img/22606836-1_b.jpg', '45', null);
INSERT INTO `t_book` VALUES ('926B8F31C5D04F61A72F66679A0CCFFD', 'JavaScript编程精解（华章程序员书库）（JavaScript之父高度评价并强力推荐，系统学习JS首选！）', '哈弗贝克', '49.00', '33.80', '6.9', '械工业出版社', '2012-9-1', '1', '162', '0', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22873894-1_w.jpg', 'book_img/22873894-1_b.jpg', '70', null);
INSERT INTO `t_book` VALUES ('95AACC68D64D4D67B1E33E9EAC22B885', 'Head First Java（中文版）（JAVA经典畅销书 生动有趣 轻松学好JAVA）', '塞若', '79.00', '47.40', '6.0', '中国电力出版社', '2007-2-1', '1', '689', '983000', '2001-7-2', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/9265169-1_w.jpg', 'book_img/9265169-1_b.jpg', '13', null);
INSERT INTO `t_book` VALUES ('9923901FBF124623BC707920D8936BC8', 'JavaScript DOM编程艺术(第2版)', '基思', '49.00', '33.80', '6.9', '人民邮电出版社', '2011-4-1', '1', '286', '443000', '2011-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21049601-1_w_1.jpg', 'book_img/21049601-1_b.jpg', '28', null);
INSERT INTO `t_book` VALUES ('99BF63AC12AD48FCB673F1820888964E', 'Java Web开发实战1200例（第Ⅱ卷）（史上最全的“编程实例”类图书，代码分析、实例速查、练习巩固的绝好帮手）', '无', '99.00', '67.40', '6.8', '清华大学出版社', '0', '0', '0', '1746000', '2011-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21110929-1_w_1.jpg', 'book_img/21110929-1_b.jpg', '78', null);
INSERT INTO `t_book` VALUES ('9D257176A6934CB79427CEC37E69249F', '疯狂Ajax讲义（第3版）--jQuery/Ext JS/Prototype/DWR企业应用前端开发实战(含CD光盘1张)（畅销书升级版，企业应用前端开发实战指南）', '李刚', '79.00', '54.50', '6.9', '电子工业出版社', '2013-2-1', '1', '624', '997000', '2013-2-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23184673-1_w.jpg', 'book_img/23184673-1_b.jpg', '53', null);
INSERT INTO `t_book` VALUES ('9FBD51A7C02D4F5B9862CD2EBBF5CA04', 'Flash ActionScript 3.0全站互动设计', '刘欢 ', '69.80', '48.20', '6.9', '人民邮电出版社', '2012-10-1', '1', '488', '760000', '2012-10-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22886581-1_w.jpg', 'book_img/22886581-1_b.jpg', '96', null);
INSERT INTO `t_book` VALUES ('9FF423101836438F874035A48498CF45', 'Java编程思想（英文版·第4版）', '埃克尔 ', '79.00', '54.50', '6.9', '机械工业出版社', '2007-4-1', '1', '1482', '0', '2007-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/9288920-1_w.jpg', 'book_img/9288920-1_b.jpg', '31', null);
INSERT INTO `t_book` VALUES ('A12A1612B4E54F8C8FEDBDF954B62435', '【正版童书】小熊宝宝绘本(全15册)佐佐木洋子著 0-3岁亲子共读图画书 儿童幼儿读物套装系列', '佐佐木洋子', '59.00', '45.70', '6.9', '连环画出版社', '2013-6-1', '1', '374', '48700', '2013-6-1', '16', '铜版纸', 'E3020621E91440FDA08B10C635713F08', 'book_img/364BDF55F77244799887DD7D0B9FBB8E_big.jpg', 'book_img/213758B2D6ED400E903C46D57D0EBB46_small.jpg', '103', null);
INSERT INTO `t_book` VALUES ('A3D464D1D1344ED5983920B472826730', 'Java Web开发详解：XML+DTD+XML Schema+XSLT+Servlet 3 0+JSP 2 2深入剖析与实例应用(含CD光盘1张)', '孙鑫', '119.00', '61.30', '5.2', '电子工业出版社', '2012-5-1', '1', '889', '1760000', '2012-5-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22788412-1_w.jpg', 'book_img/22788412-1_b.jpg', '60', null);
INSERT INTO `t_book` VALUES ('A46A0F48A4F649AE9008B38EA48FAEBA', 'Java编程全能词典(含DVD光盘2张)', '明日科技', '98.00', '65.70', '6.7', '电子工业出版社', '2010-3-1', '1', '486', '496000', '2010-3-1', '32', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20813806-1_w_1.jpg', 'book_img/20813806-1_b.jpg', '90', null);
INSERT INTO `t_book` VALUES ('A5A6F27DCD174614850B26633A0B4605', 'JavaScript模式', '斯特凡洛夫', '38.00', '22.80', '6.0', '中国电力出版社', '2012-7-1', '1', '208', '253000', '2012-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22819430-1_w.jpg', 'book_img/22819430-1_b.jpg', '61', null);
INSERT INTO `t_book` VALUES ('A7220EF174704012830E066FDFAAD4AD', 'Spring 3.0就这么简单（国内原创的Java敏捷开发图书，展现作者Spring原创开源项目ROP开发的全过程，所有项目工程均以Maven组织）', '陈雄华', '59.00', '40.70', '6.9', '人民邮电出版社', '2013-1-1', '1', '380', '530000', '2013-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22938474-1_w.jpg', 'book_img/22938474-1_b.jpg', '77', null);
INSERT INTO `t_book` VALUES ('A7EFD99367C9434682A790635D3C5FDF', 'Java Web技术整合应用与项目实战（JSP+Servlet+Struts2+Hibernate+Spring3）', '张志锋', '98.00', '67.60', '6.9', '清华大学出版社', '2013-6-1', '1', '878', '0', '2013-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23266270-1_w.jpg', 'book_img/23266270-1_b.jpg', '92', null);
INSERT INTO `t_book` VALUES ('A8EF76FD21A645109538614DEA85F3F7', 'Java语言程序设计：基础篇（原书第8版）', '梁勇', '75.00', '51.80', '6.9', '机械工业出版社', '2011-6-1', '1', '586', '0', '2011-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21122188-1_w_1.jpg', 'book_img/21122188-1_b.jpg', '30', null);
INSERT INTO `t_book` VALUES ('AD6EA79CCB8240AAAF5B292AD7E5DCAA', 'jQuery Mobile权威指南（根据jQuery Mobile最新版本撰写的权威参考书！全面讲解jQuery Mobile的所有功能、特性、使用方法和开发技巧）', '陶国荣', '59.00', '40.70', '6.9', '机械工业出版社', '2012-8-1', '1', '249', '0', '2012-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22847009-1_w.jpg', 'book_img/22847009-1_b.jpg', '38', null);
INSERT INTO `t_book` VALUES ('AE0935F13A214436B8599DE285A86220', 'JavaScript基础教程(第8版)(经典JavaScript入门书 涵盖Ajax和jQuery)', 'Tom Negrino　Dori Smith', '69.00', '47.60', '6.9', '人民邮电出版社', '2012-4-1', '1', '392', '694000', '2012-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22717349-1_w.jpg', 'book_img/22717349-1_b.jpg', '37', null);
INSERT INTO `t_book` VALUES ('AF28ED8F692C4288B32CF411CBDBFC23', '经典Java EE企业应用实战——基于WebLogic/JBoss的JSF+EJB 3+JPA整合开发(含CD光盘1张)', '无', '79.00', '54.50', '6.9', '电子工业出版社', '2010-8-1', '1', '0', '0', '2010-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20928547-1_w_1.jpg', 'book_img/20928547-1_b.jpg', '55', null);
INSERT INTO `t_book` VALUES ('B329A14DDEF8455F82B3FDF25821D2BB', '名师讲坛——Java Web开发实战经典基础篇（JSP、Servlet、Struts、Ajax）（32小时全真课堂培训，视频超级给力！390项实例及分析，北京魔乐科技培训中心Java Web全部精华）', '李兴华', '69.80', '48.20', '6.9', '清华大学出版社', '2010-8-1', '1', '554', '819000', '2010-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20915948-1_w_3.jpg', 'book_img/20915948-1_b.jpg', '22', null);
INSERT INTO `t_book` VALUES ('B7A7DA7A94E54054841EED1F70C3027C', '锋利的jQuery(第2版)(畅销书升级版，增加jQuery Mobile和性能优化)', '单东林', '49.00', '33.80', '6.9', '人民邮电出版社', '2012-7-1', '2', '380', '598000', '2012-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22786088-1_w.jpg', 'book_img/22786088-1_b.jpg', '10', null);
INSERT INTO `t_book` VALUES ('BD1CB005E4A04DCA881DA8689E21D4D0', 'jQuery UI开发指南', 'Eric Sarrion', '39.00', '26.90', '6.9', '人民邮电出版社', '2012-12-1', '1', '212', '286000', '2012-12-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22910975-1_w.jpg', 'book_img/22910975-1_b.jpg', '63', null);
INSERT INTO `t_book` VALUES ('C23E6E8A6DB94E27B6E2ABD39DC21AF5', 'JavaScript:The Good Parts(影印版）', '克罗克福特', '28.00', '19.30', '6.9', '东南大学出版社', '2009-1-1', '1', '153', '181000', '2009-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20412979-1_w.jpg', 'book_img/20412979-1_b.jpg', '95', null);
INSERT INTO `t_book` VALUES ('C3CF52B3ED2D4187A16754551488D733', 'Java从入门到精通（附光盘）', '魔乐科技', '59.00', '35.40', '6.0', '人民邮电出版社', '2010-4-1', '1', '519', '884000', '2010-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20810282-1_w_1.jpg', 'book_img/20810282-1_b.jpg', '29', null);
INSERT INTO `t_book` VALUES ('C86D3F6FACB449BEBD940D9307ED4A47', '编写高质量代码：改善Java程序的151个建议(从语法、程序设计和架构、工具和框架、编码风格、编程思想5个方面探讨编写高质量Java代码的技巧、禁忌和最佳实践)', '秦小波', '59.00', '40.70', '6.9', '机械工业出版社', '2012-1-1', '1', '303', '0', '2012-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22579686-1_w.jpg', 'book_img/22579686-1_b.jpg', '84', null);
INSERT INTO `t_book` VALUES ('CB0AB3654945411EA69F368D0EA91A00', 'JavaScript语言精粹（修订版）', '道格拉斯·克罗克福德', '49.00', '39.20', '8.0', '电子工业出版社', '2012-9-1', '1', '155', '258000', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22872884-1_w.jpg', 'book_img/22872884-1_b.jpg', '33', null);
INSERT INTO `t_book` VALUES ('CD913617EE964D0DBAF20C60076D32FB', '名师讲坛——Java开发实战经典（配光盘）（60小时全真课堂培训，视频超级给力！790项实例及分析，北京魔乐科技培训中心Java全部精华）', '李兴华', '79.80', '55.10', '6.9', '清华大学出版社', '2009-8-1', '1', '831', '1222000', '2012-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20637368-1_w_2.jpg', 'book_img/20637368-1_b_2.jpg', '19', null);
INSERT INTO `t_book` VALUES ('CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '布鲁斯.艾克尔', '108.00', '74.50', '6.9', '机械工业出版社', '2007-6-1', '1', '880', '1000', '2007-6-1', '0', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/9317290-1_w.jpg', 'book_img/9317290-1_b.jpg', '2', null);
INSERT INTO `t_book` VALUES ('CF5546769F2842DABB2EF7A00D51F255', 'jQuery开发从入门到精通（配套视频327节，中小实例232个，实战案例7个商品详情手册11部，网页模版83类）（附1DVD）', '袁江', '79.80', '55.10', '6.9', '清华大学出版社', '2013-6-1', '1', '619', '1109000', '2013-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23263012-1_w.jpg', 'book_img/23263012-1_b.jpg', '43', null);
INSERT INTO `t_book` VALUES ('D0DA36CEE42549FFB299B7C7129761D5', 'Java应用架构设计：模块化模式与OSGi(全球资深Java技术专家的力作，系统、全面地讲解如何将模块化设计思想引入开发中，涵盖18个有助于实现模块化软件架构的模式)', '克内恩席尔德', '69.00', '47.60', '6.9', '机械工业出版社', '2013-9-1', '1', '251', '0', '2013-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23339643-1_w.jpg', 'book_img/23339643-1_b.jpg', '26', null);
INSERT INTO `t_book` VALUES ('D0E69F85ACAB4C15BB40966E5AA545F1', 'Java并发编程实战（第16届Jolt大奖提名图书，Java并发编程必读佳作', 'Brian Goetz', '69.00', '47.60', '6.9', '机械工业出版社', '2012-2-1', '1', '290', '0', '2012-2-1', '32', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22606835-1_w.jpg', 'book_img/22606835-1_b.jpg', '15', null);
INSERT INTO `t_book` VALUES ('D2ABA8B06C524632846F27C34568F3CE', 'Java 经典实例', '达尔文', '98.00', '67.60', '6.9', '中国电力出版社', '2009-2-1', '1', '784', '805000', '2009-2-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20500255-1_w.jpg', 'book_img/20500255-1_b.jpg', '62', null);
INSERT INTO `t_book` VALUES ('D8723405BA054C13B52357B8F6AEEC24', '深入理解Java虚拟机：JVM高级特性与最佳实践（第2版）', '周志明', '79.00', '54.50', '6.9', '机械工业出版社', '2013-6-1', '2', '433', '0', '2013-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23259731-1_w.jpg', 'book_img/23259731-1_b.jpg', '14', null);
INSERT INTO `t_book` VALUES ('DC36FD53A1514312A0A9ADD53A583886', 'JavaScript异步编程：设计快速响应的网络应用【掌握JavaScript异步编程必杀技，让代码更具响应度！ 】', 'Trevor Burnham ', '32.00', '22.10', '6.9', '人民邮电出版社', '2013-6-1', '1', '118', '98000', '2013-5-23', '32', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23252196-1_w.jpg', 'book_img/23252196-1_b.jpg', '72', null);
INSERT INTO `t_book` VALUES ('DCB64DF0084E486EBF173F729A3A630A', 'Java设计模式(第2版)', 'Steven John Metsker', '75.00', '51.80', '6.9', '电子工业出版社', '2012-9-1', '1', '0', '0', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22868759-1_w.jpg', 'book_img/22868759-1_b.jpg', '76', null);
INSERT INTO `t_book` VALUES ('DEE7BDC7E0E343149E3C3601D2658171', '疯狂HTML 5/CSS 3/JavaScript讲义(含CD光盘1张)', '李刚', '69.00', '47.60', '6.9', '电子工业出版社', '2012-5-1', '1', '500', '819000', '2012-5-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22783904-1_w.jpg', 'book_img/22783904-1_b.jpg', '21', null);
INSERT INTO `t_book` VALUES ('DF4E74EEE89B43229BB8212F0B858C38', '精通Hibernate：Java对象持久化技术详解（第2版）(含光盘1张)', '孙卫琴', '75.00', '51.80', '6.9', '电子工业出版社', '2010-2-1', '1', '695', '1148800', '2010-2-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20773347-1_w_1.jpg', 'book_img/20773347-1_b.jpg', '39', null);
INSERT INTO `t_book` VALUES ('E4F184188C8B4C7BB32D4E76603426AC', '疯狂Java讲义（第2版，附光盘）', '李刚', '109.00', '75.20', '6.9', '电子工业出版社', '2012-1-1', '1', '844', '1747000', '2012-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22588603-1_w.jpg', 'book_img/22588603-1_b.jpg', '7', null);
INSERT INTO `t_book` VALUES ('EA695342393C4BE48B831FA5E6B0E5C4', '编写可维护的JavaScript《JavaScript高级程序设计》作者Nicholas Zakas最新力作，构建编码风格手册，帮助开发团队从“游击队”走向“正规军”）', 'Nicholas C. Zakas', '55.00', '38.00', '6.9', '人民邮电出版社', '2013-4-1', '1', '227', '400000', '2013-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23200995-1_w.jpg', 'book_img/23200995-1_b.jpg', '59', null);
INSERT INTO `t_book` VALUES ('F0E34313BF304CCEBF198BD4E05307B8', 'jQuery Cookbook中文版（jQuery之父鼎力推荐，社区数十位专家倾情力作', 'jQuery社区专家组', '69.00', '47.60', '6.9', '人民邮电出版社', '2013-5-1', '1', '425', '573000', '2013-5-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23219358-1_w.jpg', 'book_img/23219358-1_b.jpg', '87', null);
INSERT INTO `t_book` VALUES ('F6162799E913423EA5CB57BEC65AB1E9', 'JUnit实战(第2版)', '塔凯文', '79.00', '54.50', '6.9', '人民邮电出版社', '2012-4-1', '1', '442', '640000', '2012-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22633574-1_w.jpg', 'book_img/22633574-1_b.jpg', '80', null);
INSERT INTO `t_book` VALUES ('F693239BC3B3444C8538ABE7411BB38E', 'Java Web典型模块与项目实战大全（配光盘）', '常建功', '99.50', '68.70', '6.9', '清华大学出版社', '2011-1-1', '1', '922', '1473000', '2011-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20988080-1_w_1.jpg', 'book_img/20988080-1_b.jpg', '41', null);
INSERT INTO `t_book` VALUES ('F78C94641DB4475BBA1E72A07DF9B3AE', 'JAVA面向对象编程', '孙卫琴 ', '65.80', '45.40', '6.9', '电子工业出版社', '2006-7-1', '1', '625', '1030400', '2006-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/9186890-1_w.jpg', 'book_img/9186890-1_b.jpg', '69', null);
INSERT INTO `t_book` VALUES ('FC232CD9B6E6411BBBB1A5B781D2C3C9', 'Java与模式(含盘)（超多实例和习题，详解设计原则与设计模式）', '阎宏', '88.00', '60.70', '6.9', '电子工业出版社', '2002-10-1', '1', '1024', '16704000', '2002-10-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/696673-1_w.jpg', 'book_img/696673-1_b.jpg', '67', null);
INSERT INTO `t_book` VALUES ('FEC3740CF30E442A94021911A25EF0D7', 'Spring攻略(第2版)(Spring攻略(第2版))', 'Gary Mak　Josh Long　Daniel Rubio', '128.00', '88.30', '6.9', '人民邮电出版社', '2012-3-1', '1', '938', '1322000', '2012-3-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22623020-1_w.jpg', 'book_img/22623020-1_b.jpg', '82', null);
INSERT INTO `t_book` VALUES ('FFABBED1E5254BC0B2726EC4ED8ACCDA', '深入理解OSGi：Equinox原理、应用与最佳实践（《深入理解Java虚拟机》作者新作！全面解读最新OSGi R5.0规范，深入讲解OSGi原理和服务，以及Equinox框架的用法和原理）', '周志明', '79.00', '54.50', '6.9', '机械工业出版社', '2013-2-1', '1', '414', '0', '2013-2-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23179003-1_w.jpg', 'book_img/23179003-1_b.jpg', '47', '1');

-- ----------------------------
-- Table structure for t_cartitem
-- ----------------------------
DROP TABLE IF EXISTS `t_cartitem`;
CREATE TABLE `t_cartitem` (
  `cartItemId` char(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `bid` char(32) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cartItemId`),
  KEY `orderBy` (`orderBy`),
  KEY `FK_t_cartitem_t_user` (`uid`),
  KEY `FK_t_cartitem_t_book` (`bid`),
  CONSTRAINT `FK_t_cartitem_t_book` FOREIGN KEY (`bid`) REFERENCES `t_book` (`bid`),
  CONSTRAINT `FK_t_cartitem_t_user` FOREIGN KEY (`uid`) REFERENCES `t_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cartitem
-- ----------------------------
INSERT INTO `t_cartitem` VALUES ('69DE885E87FE4D33995C41A92E1F74AF', '1', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', '79D5085673194E608C640E7866A56BB4', '17');
INSERT INTO `t_cartitem` VALUES ('B8939FC55131469CAB11E3924D40185B', '1', 'CE01F15D435A4C51B0AD8202A318DCA7', 'xxx', '11');
INSERT INTO `t_cartitem` VALUES ('CB16853848284C108088987B69864FB3', '1', '57B6FF1B89C843C38BA39C717FA557D6', '1562860ABBC540C795A8071B7E1C3691', '20');
INSERT INTO `t_cartitem` VALUES ('D3E767D695CA4207999854BCD217B89A', '1', 'CE01F15D435A4C51B0AD8202A318DCA7', '79D5085673194E608C640E7866A56BB4', '16');
INSERT INTO `t_cartitem` VALUES ('D806EA2A15934ABC9735C1F7070F2AFE', '1', '4C3331CAD5A5453787A94B8D7CCEAA29', '1562860ABBC540C795A8071B7E1C3691', '19');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `cid` char(32) NOT NULL,
  `cname` varchar(50) DEFAULT NULL,
  `pid` char(32) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cname` (`cname`),
  KEY `FK_t_category_t_category` (`pid`),
  KEY `orderBy` (`orderBy`),
  CONSTRAINT `FK_t_category_t_category` FOREIGN KEY (`pid`) REFERENCES `t_category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', '程序设计', null, '程序设计类', '1');
INSERT INTO `t_category` VALUES ('2', '办公室常用', null, '办公室常用书籍', '2');
INSERT INTO `t_category` VALUES ('5', '数据库技术', null, '数据库类', '5');
INSERT INTO `t_category` VALUES ('5F79D0D246AD4216AC04E9C5FAB3199E', 'Java Javascript', '1', 'Java Javascript分类', '10');
INSERT INTO `t_category` VALUES ('84ECE401C2904DBEA560D04A581A66D9', 'HTML XML', '1', 'HTML XML分类', '13');
INSERT INTO `t_category` VALUES ('96F209F79DB242E9B99CC1B98FAB01DB', '数据库理论', '5', '数据库理论分类', '33');
INSERT INTO `t_category` VALUES ('9AE25C6932F14B7BB2EF49E8AEA23322', '儿童读物', null, '各种各样的儿童读取', '34');
INSERT INTO `t_category` VALUES ('BBC086EFA3A8499490594329D5479DDE', '小说', null, '各种小说', '36');
INSERT INTO `t_category` VALUES ('BC72B68D5C294091BBA5BD02D1D8ED51', '玄幻小说', 'BBC086EFA3A8499490594329D5479DDE', '好看的玄幻小说', '37');
INSERT INTO `t_category` VALUES ('C3F9FAAF4EA64857ACFAB0D9C8D0E446', 'PHP', '1', 'PHP分类', '14');
INSERT INTO `t_category` VALUES ('C4DD8CA232864B31A367EE135D86382C', '计算机初级入门', '2', '计算机初级入门分类', '17');
INSERT INTO `t_category` VALUES ('C8E274EE5C99499080A98E24F0BD2E03', '.NET', '1', '.NET分类', '15');
INSERT INTO `t_category` VALUES ('CA22C26D2B18455A9D0219885FE7AEFB', '都市言情', 'BBC086EFA3A8499490594329D5479DDE', '各种都市言情小说', '38');
INSERT INTO `t_category` VALUES ('D45D96DA359A4FEAB3AB4DCF2157FC06', 'JSP', '1', 'JSP分类', '11');
INSERT INTO `t_category` VALUES ('E3020621E91440FDA08B10C635713F08', '儿童智力', '9AE25C6932F14B7BB2EF49E8AEA23322', '轻松提升儿童智力', '35');
INSERT INTO `t_category` VALUES ('F4FBD087EB054CA1896093F172AC33D9', '数据仓库与数据挖掘', '5', '数据仓库与数据挖掘分类', '30');
INSERT INTO `t_category` VALUES ('F5C091B3967442A2B35EFEFC4EF8746F', '微软Office', '2', '微软Office分类', '16');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `oid` char(32) NOT NULL,
  `ordertime` char(19) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FK_t_order_t_user` (`uid`),
  CONSTRAINT `FK_t_order_t_user` FOREIGN KEY (`uid`) REFERENCES `t_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('00A56499C37245F98F8D62467049C4C9', '2016-12-07 15:52:23', '75.20', '1', '四川 达州 南坝 文理', '79D5085673194E608C640E7866A56BB4');
INSERT INTO `t_order` VALUES ('01099F828197463D8E75C4CE980BB34E', '2016-12-21 21:30:43', '122.10', '5', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('02010AF2F0CC48D6BBC4E20B062748AE', '2016-11-24 08:51:37', '33.80', '3', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('07B84FF192DD40E098BA15A066E84AC5', '2016-12-07 12:48:01', '231.90', '3', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('08C85BE8C3664F1B9E83DDF3F5B50F03', '2016-12-21 22:16:33', '54.50', '5', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('0B3AC6ED6DCC4901B08D0865CE6B1EB6', '2016-11-15 18:15:57', '40.70', '5', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('120B1DAE07A941C2877A17912879C113', '2016-11-24 08:24:13', '257.30', '3', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('1517769276AD4EC38AB0F72E93323092', '2017-01-22 14:11:05', '41.30', '1', '四川 wenli', '26397A37C00044E4BC1FF37B1C7638AF');
INSERT INTO `t_order` VALUES ('17F24798A7014820A3F1E566438EBF9C', '2016-11-24 08:31:09', '32.90', '2', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('1E1C1D06F18A4D88B641FB9B255F5000', '2017-01-22 17:08:34', '109.60', '2', '四川 成都', 'B05AD16C585E40E181FE78AD272BA030');
INSERT INTO `t_order` VALUES ('2D6B450B23F8450794450442C62C5CB8', '2016-11-15 18:15:17', '136.60', '2', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('2DC0ECA8FDC14838937B559800702FA4', '2017-01-21 16:36:30', '122.80', '5', '四川 达州 南huhuhuh', 'xx');
INSERT INTO `t_order` VALUES ('2DF1773C17BD423397CFDE30437D17CC', '2016-12-07 15:30:34', '68.30', '1', '四川 达州 南坝 文理', '79D5085673194E608C640E7866A56BB4');
INSERT INTO `t_order` VALUES ('382B1094FCED44AA92CF6C1CCF5FC2B8', '2016-11-15 12:52:19', '67.60', '2', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('384EED143AAE443BB622DB40D555D925', '2016-12-21 22:05:42', '123.90', '5', '四川 ', 'xx');
INSERT INTO `t_order` VALUES ('38555C8D35EF480BB6ABF063EB60ECE2', '2016-12-03 20:35:09', '108.30', '3', 'njknjkn', 'xx');
INSERT INTO `t_order` VALUES ('3A385FFE4E844038A52ABE260A644FD3', '2017-01-22 11:17:21', '68.90', '1', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('3B664920D2F44BD7B77D78310D77CD73', '2016-11-15 12:11:51', '74.50', '2', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('3BC3ECB143934482A63BF54323272AEE', '2017-01-22 14:15:57', '68.90', '1', '四川 达州 南坝 文理', '26397A37C00044E4BC1FF37B1C7638AF');
INSERT INTO `t_order` VALUES ('4F42B64D13004161B2C17614493FE1D6', '2016-12-23 11:30:51', '143.50', '1', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('5A8AA6CBFE9447D9A00A2FCE8FF83B18', '2017-02-04 12:34:09', '41.30', '2', '四sdfsadfa', 'xx');
INSERT INTO `t_order` VALUES ('60BCAD7BD5284B7A98E5CCA879248C81', '2016-12-23 09:28:29', '55.10', '5', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('60D38607707F47CC9F5587686666239F', '2016-11-15 18:14:21', '149.70', '3', '四川 文理', 'xx');
INSERT INTO `t_order` VALUES ('626D53331F204234BF51A435E6879614', '2016-11-24 20:39:04', '47.60', '2', '定大幅胶片', 'xx');
INSERT INTO `t_order` VALUES ('6568813028544ACDB49C2BABBADCE4E3', '2017-01-02 23:36:19', '45.70', '1', '四川达州', 'xx');
INSERT INTO `t_order` VALUES ('7F50BF07FC4F4A0A810E7C1D50B189CC', '2016-12-21 22:04:54', '47.60', '5', '四川 ', 'xx');
INSERT INTO `t_order` VALUES ('83B6D1C6F6B8452EAA8504C8427C029C', '2017-01-21 16:28:26', '114.00', '5', '四川 达州 南坝 jijij', 'xx');
INSERT INTO `t_order` VALUES ('977CBAE07B1A47DF9569A48417DA72A2', '2016-12-07 15:29:09', '41.30', '1', '四川 达州 南坝 文理', '79D5085673194E608C640E7866A56BB4');
INSERT INTO `t_order` VALUES ('9A121DCC77BE4FB0A779CF8C69AF7923', '2017-01-02 15:49:20', '55.10', '1', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('9C57D11A651C4D98A1FFF99486764651', '2017-01-22 11:43:32', '273.20', '1', '四川java', 'xx');
INSERT INTO `t_order` VALUES ('9D5A362FF41B4FAAAD64F670E421D7E8', '2017-01-22 17:30:12', '54.50', '2', '四川 达州 南坝 文理', 'B05AD16C585E40E181FE78AD272BA030');
INSERT INTO `t_order` VALUES ('A6353BBD7D2948BB84978B7E79F1E0E6', '2016-11-24 13:56:58', '68.30', '3', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('A6EB1F4576784C6FA83488848E00E30D', '2016-11-15 18:49:43', '33.80', '2', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('AA13FC8F8965496AB34FF5840E65DF52', '2016-12-07 15:01:28', '47.60', '5', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('B3FF72E6458D4046807575279C24BDA4', '2017-01-22 10:52:11', '135.90', '1', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('B7A888AE915E45A79D81FC6F88369256', '2017-01-22 16:37:19', '40.70', '2', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('B8430AD9CB0849B0BC1C235B4D6C4355', '2016-11-24 08:37:44', '74.50', '5', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('BD757B7A1D5D4B43AB4C81D854A248F4', '2016-11-15 19:09:47', '33.80', '3', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('C01D16A102C945E8BB409F80A174C541', '2016-12-29 12:17:36', '170.50', '1', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('C38B97603EFF48218F26161B388D6D58', '2016-11-15 15:03:38', '345.60', '2', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('C63A66A9A79D4E5DBA28EC1B223E6134', '2016-12-09 09:13:48', '68.30', '3', '四川 达州 南坝 文理', '79D5085673194E608C640E7866A56BB4');
INSERT INTO `t_order` VALUES ('CB896BDBAACD4949ACD68CDBF96511C7', '2017-01-02 15:39:26', '40.70', '1', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('CF549F608BBD48129690E90CF04BF606', '2016-12-07 15:37:21', '68.30', '1', '四川 达州 南坝 文理', '79D5085673194E608C640E7866A56BB4');
INSERT INTO `t_order` VALUES ('D1FE239279FE4C01AC9A4ABB338471D8', '2016-12-09 08:55:17', '62.10', '1', '四川 达州 南坝 文理', '79D5085673194E608C640E7866A56BB4');
INSERT INTO `t_order` VALUES ('D5BE1E3ED7E641008C01537DDA89E3D3', '2016-12-21 21:32:39', '74.50', '5', '四川 成都', 'xx');
INSERT INTO `t_order` VALUES ('D964A1B9E5444C0DAE7CDA59ECF0FE99', '2017-01-22 16:31:46', '311.80', '1', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('DB31080A6FB34E949B425D9967B4D6C8', '2016-11-15 19:15:06', '33.80', '5', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('E89F758A59654BFB8B682D7B26EB719F', '2016-12-23 09:38:20', '54.50', '5', '四川 达州 南坝 文理', 'xx');
INSERT INTO `t_order` VALUES ('F4CD902384FC469F9A9E470324B99F34', '2016-12-09 09:05:03', '74.50', '1', '四川 达州 南坝 文理', '79D5085673194E608C640E7866A56BB4');
INSERT INTO `t_order` VALUES ('FBE5F0D850E04BE19866D7FC42E7DFE7', '2016-11-24 08:38:35', '33.80', '1', '四川 达州 jiojio', 'xx');

-- ----------------------------
-- Table structure for t_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitem`;
CREATE TABLE `t_orderitem` (
  `orderItemId` char(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `bid` char(32) DEFAULT NULL,
  `bname` varchar(200) DEFAULT NULL,
  `currPrice` decimal(8,2) DEFAULT NULL,
  `image_b` varchar(100) DEFAULT NULL,
  `oid` char(32) DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `FK_t_orderitem_t_order` (`oid`),
  CONSTRAINT `FK_t_orderitem_t_order` FOREIGN KEY (`oid`) REFERENCES `t_order` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderitem
-- ----------------------------
INSERT INTO `t_orderitem` VALUES ('05AB4889F5004514A8614C112165F7E1', '1', '54.50', 'D8723405BA054C13B52357B8F6AEEC24', '深入理解Java虚拟机：JVM高级特性与最佳实践（第2版）', '54.50', 'book_img/23259731-1_b.jpg', 'E89F758A59654BFB8B682D7B26EB719F');
INSERT INTO `t_orderitem` VALUES ('0755B459020B4122A249C614793CE214', '1', '55.10', 'CD913617EE964D0DBAF20C60076D32FB', '名师讲坛——Java开发实战经典（配光盘）（60小时全真课堂培训，视频超级给力！790项实例及分析，北京魔乐科技培训中心Java全部精华）', '55.10', 'book_img/20637368-1_b_2.jpg', '1E1C1D06F18A4D88B641FB9B255F5000');
INSERT INTO `t_orderitem` VALUES ('0C6F9FD090A94786A98BD72A83F7E954', '1', '33.80', 'B7A7DA7A94E54054841EED1F70C3027C', '锋利的jQuery(第2版)(畅销书升级版，增加jQuery Mobile和性能优化)', '33.80', 'book_img/22786088-1_b.jpg', '120B1DAE07A941C2877A17912879C113');
INSERT INTO `t_orderitem` VALUES ('0D5DE36D9D7A430FABB2A1AEC7ED938E', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', 'D5BE1E3ED7E641008C01537DDA89E3D3');
INSERT INTO `t_orderitem` VALUES ('0FBEFC6138394B7FB357DBDE4203F147', '1', '68.30', '5C68141786B84A4CB8929A2415040739', 'JavaScript高级程序设计(第3版)(JavaScript技术名著，国内JavasScript第一书，销量超过8万册)', '68.30', 'book_img/22628333-1_b.jpg', '4F42B64D13004161B2C17614493FE1D6');
INSERT INTO `t_orderitem` VALUES ('10A28EDE4FD54675B25DBB7EE0ABB2A7', '1', '67.60', 'A7EFD99367C9434682A790635D3C5FDF', 'Java Web技术整合应用与项目实战（JSP+Servlet+Struts2+Hibernate+Spring3）', '67.60', 'book_img/23266270-1_b.jpg', 'D964A1B9E5444C0DAE7CDA59ECF0FE99');
INSERT INTO `t_orderitem` VALUES ('190F9A40694E43F69309B84E9DE57DEE', '1', '75.20', 'E4F184188C8B4C7BB32D4E76603426AC', '疯狂Java讲义（第2版，附光盘）', '75.20', 'book_img/22588603-1_b.jpg', 'C01D16A102C945E8BB409F80A174C541');
INSERT INTO `t_orderitem` VALUES ('27A7DE1FDB264788B3A7A8E249533C5F', '3', '122.10', '4A9574F03A6B40C1B2A437237C17DEEC', 'Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）', '40.70', 'book_img/23254532-1_b.jpg', 'C38B97603EFF48218F26161B388D6D58');
INSERT INTO `t_orderitem` VALUES ('2FBC6FE99CDF42AB8899818AE7901BD9', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '01099F828197463D8E75C4CE980BB34E');
INSERT INTO `t_orderitem` VALUES ('3452E026B69349AD8FD232D8EE20DC1F', '1', '75.20', 'E4F184188C8B4C7BB32D4E76603426AC', '疯狂Java讲义（第2版，附光盘）', '75.20', 'book_img/22588603-1_b.jpg', '00A56499C37245F98F8D62467049C4C9');
INSERT INTO `t_orderitem` VALUES ('39E7E971226F43A59AE13329DA64D949', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', 'F4CD902384FC469F9A9E470324B99F34');
INSERT INTO `t_orderitem` VALUES ('3B5437BBF26645F486D32051B38096A0', '1', '62.10', '5315DA60D24042889400AD4C93A37501', 'Spring 3.x企业应用开发实战(含CD光盘1张)', '62.10', 'book_img/22605701-1_b.jpg', 'D1FE239279FE4C01AC9A4ABB338471D8');
INSERT INTO `t_orderitem` VALUES ('402EBDD4CD274F2C90ED0F403F5D30A7', '1', '68.30', '5C68141786B84A4CB8929A2415040739', 'JavaScript高级程序设计(第3版)(JavaScript技术名著，国内JavasScript第一书，销量超过8万册)', '68.30', 'book_img/22628333-1_b.jpg', 'A6353BBD7D2948BB84978B7E79F1E0E6');
INSERT INTO `t_orderitem` VALUES ('46D68044AD7F4D349A2B1BFD7DA4A952', '1', '68.30', '5C68141786B84A4CB8929A2415040739', 'JavaScript高级程序设计(第3版)(JavaScript技术名著，国内JavasScript第一书，销量超过8万册)', '68.30', 'book_img/22628333-1_b.jpg', '2DF1773C17BD423397CFDE30437D17CC');
INSERT INTO `t_orderitem` VALUES ('4BBD5A2B2D22497EB4118CDAFDC5B99A', '1', '82.10', '3DD187217BF44A99B86DD18A4DC628BA', 'Java核心技术 卷1 基础知识（原书第9版）', '82.10', 'book_img/23362142-1_b.jpg', '60D38607707F47CC9F5587686666239F');
INSERT INTO `t_orderitem` VALUES ('4D8CE412A81C4E41A8FFAE616ADC9A94', '6', '244.20', '1B95CC0FBBAB4B7691D959EA5E1C811F', 'Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）', '40.70', 'book_img/ADFAEF4E31894E1DAFECC36337B878AE_2.jpg', 'D964A1B9E5444C0DAE7CDA59ECF0FE99');
INSERT INTO `t_orderitem` VALUES ('4EDA113E4D204E10B44678623DF678EB', '1', '33.80', 'B7A7DA7A94E54054841EED1F70C3027C', '锋利的jQuery(第2版)(畅销书升级版，增加jQuery Mobile和性能优化)', '33.80', 'book_img/22786088-1_b.jpg', '02010AF2F0CC48D6BBC4E20B062748AE');
INSERT INTO `t_orderitem` VALUES ('4FAE4D63582D45BEA38A6CBBE7FA1186', '2', '190.60', '48BBFBFC07074ADE8CC906A45BE5D9A6', 'JavaScript权威指南（第6版）（淘宝前端团队倾情翻译！经典权威的JavaScript犀牛书！第6版特别涵盖了HTML5和ECMAScript5！）（经典巨著，当当独家首发）', '95.30', 'book_img/22722790-1_b.jpg', '07B84FF192DD40E098BA15A066E84AC5');
INSERT INTO `t_orderitem` VALUES ('4FCF006A47ED484EA548F4CA663ADEDE', '1', '67.60', '0EE8A0AE69154287A378FB110FF2C780', 'Java核心技术：卷Ⅰ基础知识（原书第8版）', '67.60', 'book_img/20285763-1_b.jpg', '382B1094FCED44AA92CF6C1CCF5FC2B8');
INSERT INTO `t_orderitem` VALUES ('54897AF3BE00477CB8114FB51B507C65', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', 'B8430AD9CB0849B0BC1C235B4D6C4355');
INSERT INTO `t_orderitem` VALUES ('584530EFC6344B13ABD60E4E3E5E3D65', '1', '55.10', '000A18FDB38F470DBE9CD0972BADB23F', 'Java Web整合开发实战--基于Struts 2+Hibernate+Spring（99个应用实例，4个项目开发案例，15.5小时配套教学视频，超值DVD光盘含大量开发资源。一本书搞定SSH框架整合开发！）', '55.10', 'book_img/23268958-1_b.jpg', '9A121DCC77BE4FB0A779CF8C69AF7923');
INSERT INTO `t_orderitem` VALUES ('5ABE37E587FA41DFB8E4B70206867A0D', '1', '68.30', '0BE0707984014E66BD9F34F534FCE0F7', 'OSGi实战【OSGi规范制定者亲自撰写 汇集Apache项目技术实战经验】', '68.30', 'book_img/22938396-1_b.jpg', '2DC0ECA8FDC14838937B559800702FA4');
INSERT INTO `t_orderitem` VALUES ('5D30859D1E5D47FABE448A032E8B9923', '1', '33.80', 'B7A7DA7A94E54054841EED1F70C3027C', '锋利的jQuery(第2版)(畅销书升级版，增加jQuery Mobile和性能优化)', '33.80', 'book_img/22786088-1_b.jpg', 'A6EB1F4576784C6FA83488848E00E30D');
INSERT INTO `t_orderitem` VALUES ('63DD6CE6F5DF4C42B0396C0C43B99A3C', '1', '32.90', '97437DAD03FA456AA7D6154614A43B55', 'HTML、CSS、JavaScript网页制作从入门到精通（两万读者的选择，经久不衰的超级畅销书最新升级版！网页制作学习者入门必读经典！）', '32.90', 'book_img/22928649-1_b.jpg', '17F24798A7014820A3F1E566438EBF9C');
INSERT INTO `t_orderitem` VALUES ('68ACBFB2C2A54BFBAB278260ACDD390E', '3', '223.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', 'C38B97603EFF48218F26161B388D6D58');
INSERT INTO `t_orderitem` VALUES ('68DC1423A2024827A6E4F98A002DDB22', '1', '33.80', 'B7A7DA7A94E54054841EED1F70C3027C', '锋利的jQuery(第2版)(畅销书升级版，增加jQuery Mobile和性能优化)', '33.80', 'book_img/22786088-1_b.jpg', 'DB31080A6FB34E949B425D9967B4D6C8');
INSERT INTO `t_orderitem` VALUES ('6D1B970BADDF4FE9B0A7A39A22117F5A', '3', '223.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '120B1DAE07A941C2877A17912879C113');
INSERT INTO `t_orderitem` VALUES ('7598F5B67CCA46D6964E1DD0295F9A3D', '1', '81.40', '113D0D1BB9174DD19A7DE7E2B37F677F', 'Java7入门经典（跟编程导师Ivor Horton学Java 预计到货日期9月初）', '81.40', 'book_img/22813026-1_b.jpg', 'B3FF72E6458D4046807575279C24BDA4');
INSERT INTO `t_orderitem` VALUES ('7D460CA4CF7747909EB44DDABC0DAFAD', '1', '33.80', 'B7A7DA7A94E54054841EED1F70C3027C', '锋利的jQuery(第2版)(畅销书升级版，增加jQuery Mobile和性能优化)', '33.80', 'book_img/22786088-1_b.jpg', 'FBE5F0D850E04BE19866D7FC42E7DFE7');
INSERT INTO `t_orderitem` VALUES ('7FBE4E261F8C426B8BD4BE55A895B65E', '1', '55.10', '000A18FDB38F470DBE9CD0972BADB23F', 'Java Web整合开发实战--基于Struts 2+Hibernate+Spring（99个应用实例，4个项目开发案例，15.5小时配套教学视频，超值DVD光盘含大量开发资源。一本书搞定SSH框架整合开发！）', '55.10', 'book_img/23268958-1_b.jpg', '60BCAD7BD5284B7A98E5CCA879248C81');
INSERT INTO `t_orderitem` VALUES ('854CA49B92BD4A3390173BB4E198DA19', '1', '54.50', '57B6FF1B89C843C38BA39C717FA557D6', '了不起的Node.js: 将JavaScript进行到底（Web开发首选实时 跨多服务器 高并发）', '54.50', 'book_img/23368351-1_b.jpg', '9D5A362FF41B4FAAAD64F670E421D7E8');
INSERT INTO `t_orderitem` VALUES ('8C5089A64D3A4F099ACEB317FCBF51A5', '1', '68.30', '0BE0707984014E66BD9F34F534FCE0F7', 'OSGi实战【OSGi规范制定者亲自撰写 汇集Apache项目技术实战经验】', '68.30', 'book_img/22938396-1_b.jpg', '83B6D1C6F6B8452EAA8504C8427C029C');
INSERT INTO `t_orderitem` VALUES ('93019B26432D4FC08D6F06E21FEBBEB0', '1', '68.90', '4C3331CAD5A5453787A94B8D7CCEAA29', 'Java Web整合开发王者归来（JSP+Servlet+Struts+Hibernate+Spring）（配光盘', '68.90', 'book_img/20756351-1_b_1.jpg', '3A385FFE4E844038A52ABE260A644FD3');
INSERT INTO `t_orderitem` VALUES ('9A8D008BA8694138A1CE3824EB5B9899', '1', '40.70', '1B95CC0FBBAB4B7691D959EA5E1C811F', 'Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）', '40.70', 'book_img/ADFAEF4E31894E1DAFECC36337B878AE_2.jpg', 'CB896BDBAACD4949ACD68CDBF96511C7');
INSERT INTO `t_orderitem` VALUES ('9CFCFC74E3844B3E89624A109688FE42', '1', '45.70', 'A12A1612B4E54F8C8FEDBDF954B62435', '【正版童书】小熊宝宝绘本(全15册)佐佐木洋子著 0-3岁亲子共读图画书 儿童幼儿读物套装系列', '45.70', 'book_img/213758B2D6ED400E903C46D57D0EBB46_small.jpg', '83B6D1C6F6B8452EAA8504C8427C029C');
INSERT INTO `t_orderitem` VALUES ('9DDAFA95FF1B43D1AA0BABA0EF63A786', '1', '40.70', '4A9574F03A6B40C1B2A437237C17DEEC', 'Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）', '40.70', 'book_img/23254532-1_b.jpg', '0B3AC6ED6DCC4901B08D0865CE6B1EB6');
INSERT INTO `t_orderitem` VALUES ('A25A9A885E5B4F5FBC3743DB10247E2E', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '1517769276AD4EC38AB0F72E93323092');
INSERT INTO `t_orderitem` VALUES ('A590E74DCEA0441F875918384692A36E', '1', '40.70', '1B95CC0FBBAB4B7691D959EA5E1C811F', 'Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）', '40.70', 'book_img/ADFAEF4E31894E1DAFECC36337B878AE_2.jpg', 'B7A888AE915E45A79D81FC6F88369256');
INSERT INTO `t_orderitem` VALUES ('AE519F5B318F45E991B10A9A240FE43A', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '3B664920D2F44BD7B77D78310D77CD73');
INSERT INTO `t_orderitem` VALUES ('B1256211CA7148A5A284171C1816B4F4', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '2D6B450B23F8450794450442C62C5CB8');
INSERT INTO `t_orderitem` VALUES ('B32846F29F7044099A6AF45664474FF3', '1', '33.80', 'B7A7DA7A94E54054841EED1F70C3027C', '锋利的jQuery(第2版)(畅销书升级版，增加jQuery Mobile和性能优化)', '33.80', 'book_img/22786088-1_b.jpg', '38555C8D35EF480BB6ABF063EB60ECE2');
INSERT INTO `t_orderitem` VALUES ('B378B9F4805449ADB4E7EEF8906AE04B', '1', '54.50', 'D8723405BA054C13B52357B8F6AEEC24', '深入理解Java虚拟机：JVM高级特性与最佳实践（第2版）', '54.50', 'book_img/23259731-1_b.jpg', '08C85BE8C3664F1B9E83DDF3F5B50F03');
INSERT INTO `t_orderitem` VALUES ('B4A200F8308D43F7A3569D335E0E5F64', '1', '95.30', '48BBFBFC07074ADE8CC906A45BE5D9A6', 'JavaScript权威指南（第6版）（淘宝前端团队倾情翻译！经典权威的JavaScript犀牛书！第6版特别涵盖了HTML5和ECMAScript5！）（经典巨著，当当独家首发）', '95.30', 'book_img/22722790-1_b.jpg', 'C01D16A102C945E8BB409F80A174C541');
INSERT INTO `t_orderitem` VALUES ('B776A48864664FE792CCC0D40097C9D1', '1', '33.80', 'B7A7DA7A94E54054841EED1F70C3027C', '锋利的jQuery(第2版)(畅销书升级版，增加jQuery Mobile和性能优化)', '33.80', 'book_img/22786088-1_b.jpg', 'BD757B7A1D5D4B43AB4C81D854A248F4');
INSERT INTO `t_orderitem` VALUES ('BD1E8EE1DAE14F8EB6A5390687F9A514', '1', '47.60', 'D0E69F85ACAB4C15BB40966E5AA545F1', 'Java并发编程实战（第16届Jolt大奖提名图书，Java并发编程必读佳作', '47.60', 'book_img/22606835-1_b.jpg', '626D53331F204234BF51A435E6879614');
INSERT INTO `t_orderitem` VALUES ('BF3CE8FC03A04347A87E760503A8C015', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '38555C8D35EF480BB6ABF063EB60ECE2');
INSERT INTO `t_orderitem` VALUES ('BF50389C204040309E88923B6C979485', '1', '75.20', '1286B13F0EA54E4CB75434762121486A', 'Java核心技术 卷I：基础知识(第9版·英文版)(上、下册)', '75.20', 'book_img/23280479-1_b.jpg', '4F42B64D13004161B2C17614493FE1D6');
INSERT INTO `t_orderitem` VALUES ('C50D4E8596DB42E69136605BA9A309A3', '1', '95.30', '48BBFBFC07074ADE8CC906A45BE5D9A6', 'JavaScript权威指南（第6版）（淘宝前端团队倾情翻译！经典权威的JavaScript犀牛书！第6版特别涵盖了HTML5和ECMAScript5！）（经典巨著，当当独家首发）', '95.30', 'book_img/22722790-1_b.jpg', '2D6B450B23F8450794450442C62C5CB8');
INSERT INTO `t_orderitem` VALUES ('C7BAA7C45AFA44D8A632447962117BE3', '1', '68.30', '5C68141786B84A4CB8929A2415040739', 'JavaScript高级程序设计(第3版)(JavaScript技术名著，国内JavasScript第一书，销量超过8万册)', '68.30', 'book_img/22628333-1_b.jpg', 'C63A66A9A79D4E5DBA28EC1B223E6134');
INSERT INTO `t_orderitem` VALUES ('CB09AF6335C74269840170440AD095D2', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '07B84FF192DD40E098BA15A066E84AC5');
INSERT INTO `t_orderitem` VALUES ('CCC210BB52C34A50A26E97809ABBB0E1', '1', '54.50', 'D8723405BA054C13B52357B8F6AEEC24', '深入理解Java虚拟机：JVM高级特性与最佳实践（第2版）', '54.50', 'book_img/23259731-1_b.jpg', '2DC0ECA8FDC14838937B559800702FA4');
INSERT INTO `t_orderitem` VALUES ('D2517ADA8A96461BB7C009E25E0BD781', '1', '67.60', '0EE8A0AE69154287A378FB110FF2C780', 'Java核心技术：卷Ⅰ基础知识（原书第8版）', '67.60', 'book_img/20285763-1_b.jpg', '60D38607707F47CC9F5587686666239F');
INSERT INTO `t_orderitem` VALUES ('D2E45C1C0BD14FAB949E339DA1AD5899', '1', '54.50', 'D8723405BA054C13B52357B8F6AEEC24', '深入理解Java虚拟机：JVM高级特性与最佳实践（第2版）', '54.50', 'book_img/23259731-1_b.jpg', 'B3FF72E6458D4046807575279C24BDA4');
INSERT INTO `t_orderitem` VALUES ('D849BE0104B34A059C4DC1DA8435926C', '1', '47.60', 'D0E69F85ACAB4C15BB40966E5AA545F1', 'Java并发编程实战（第16届Jolt大奖提名图书，Java并发编程必读佳作', '47.60', 'book_img/22606835-1_b.jpg', '01099F828197463D8E75C4CE980BB34E');
INSERT INTO `t_orderitem` VALUES ('D899670B0CB54664BAEC69CAC71CC060', '1', '47.60', 'D0E69F85ACAB4C15BB40966E5AA545F1', 'Java并发编程实战（第16届Jolt大奖提名图书，Java并发编程必读佳作', '47.60', 'book_img/22606835-1_b.jpg', 'AA13FC8F8965496AB34FF5840E65DF52');
INSERT INTO `t_orderitem` VALUES ('E164C2A3E2EC4B668FD0FEB385478470', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '977CBAE07B1A47DF9569A48417DA72A2');
INSERT INTO `t_orderitem` VALUES ('E450EB92027C45D494E4711DDD5F9990', '1', '68.30', '5C68141786B84A4CB8929A2415040739', 'JavaScript高级程序设计(第3版)(JavaScript技术名著，国内JavasScript第一书，销量超过8万册)', '68.30', 'book_img/22628333-1_b.jpg', 'CF549F608BBD48129690E90CF04BF606');
INSERT INTO `t_orderitem` VALUES ('E72C7BCEA594428F81B01C38A60C3172', '4', '273.20', '0BE0707984014E66BD9F34F534FCE0F7', 'OSGi实战【OSGi规范制定者亲自撰写 汇集Apache项目技术实战经验】', '68.30', 'book_img/22938396-1_b.jpg', '9C57D11A651C4D98A1FFF99486764651');
INSERT INTO `t_orderitem` VALUES ('E77CC67DFC644D0E8069FF9E3010FE55', '1', '47.60', 'D0E69F85ACAB4C15BB40966E5AA545F1', 'Java并发编程实战（第16届Jolt大奖提名图书，Java并发编程必读佳作', '47.60', 'book_img/22606835-1_b.jpg', '7F50BF07FC4F4A0A810E7C1D50B189CC');
INSERT INTO `t_orderitem` VALUES ('E90E4054AA2149A4A122F63F1DFDB889', '1', '45.70', 'A12A1612B4E54F8C8FEDBDF954B62435', '【正版童书】小熊宝宝绘本(全15册)佐佐木洋子著 0-3岁亲子共读图画书 儿童幼儿读物套装系列', '45.70', 'book_img/213758B2D6ED400E903C46D57D0EBB46_small.jpg', '6568813028544ACDB49C2BABBADCE4E3');
INSERT INTO `t_orderitem` VALUES ('F2F8C2B3ECE14A29A87D7C0037E723CC', '1', '54.50', '57B6FF1B89C843C38BA39C717FA557D6', '了不起的Node.js: 将JavaScript进行到底（Web开发首选实时 跨多服务器 高并发）', '54.50', 'book_img/23368351-1_b.jpg', '1E1C1D06F18A4D88B641FB9B255F5000');
INSERT INTO `t_orderitem` VALUES ('F311905302304973980BD37CDC662E83', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '5A8AA6CBFE9447D9A00A2FCE8FF83B18');
INSERT INTO `t_orderitem` VALUES ('FC304D5C73614269A30639ACF3F713DF', '1', '68.90', '4C3331CAD5A5453787A94B8D7CCEAA29', 'Java Web整合开发王者归来（JSP+Servlet+Struts+Hibernate+Spring）（配光盘', '68.90', 'book_img/20756351-1_b_1.jpg', '3BC3ECB143934482A63BF54323272AEE');
INSERT INTO `t_orderitem` VALUES ('FD6020976CB8449581689C7204BC5D28', '3', '123.90', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '384EED143AAE443BB622DB40D555D925');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` char(32) NOT NULL,
  `loginname` varchar(50) DEFAULT NULL,
  `loginpass` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `activationCode` char(64) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `loginname` (`loginname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1562860ABBC540C795A8071B7E1C3691', '老大哥', '123', '1845787830@qq.com', '1', '49C60E7B4870444CA1C59BC42B2BF031C557E8993D094AFDA30250D7255452E1');
INSERT INTO `t_user` VALUES ('26397A37C00044E4BC1FF37B1C7638AF', '18457878350@qq.com', '123', '1845755870@qq.com', '1', '2DEE4F9B1BBC406796A08E3D6C59569B6BF2B0E14392407982754461CC92DC7A');
INSERT INTO `t_user` VALUES ('79D5085673194E608C640E7866A56BB4', 'xxx', 'xxxx', '645528331@qq.com', '1', 'BA137550AAEF4584833D6AFB493D51565F4D4CCB1A914F6D932957D3EA4B34FE');
INSERT INTO `t_user` VALUES ('B05AD16C585E40E181FE78AD272BA030', '关云长', '123', '184578830@qq.com', '1', 'DE569F9D93774D7583C31E3E814FE8AD5F3426A5677D4DD0876907F40220E47E');
INSERT INTO `t_user` VALUES ('feng', '刘备', '123', 'liuBei@163.com', '1', 'x');
INSERT INTO `t_user` VALUES ('xx', 'feng', '123', 'guanYu@163.com', '1', 'xx');
INSERT INTO `t_user` VALUES ('xxx', '张三', '123', 'zhangFei@163.com', '1', 'xxx');
