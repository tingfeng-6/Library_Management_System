/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.7.33 : Database - db_library
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_library` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_library`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` varchar(17) COLLATE utf8_bin NOT NULL COMMENT '管理员id',
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '名',
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '密',
  `gender` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '男' COMMENT '性',
  `telephone` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '电',
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '邮',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `admin` */

insert  into `admin`(`id`,`name`,`password`,`gender`,`telephone`,`email`) values 
('m001','刘鹏','123456','女','15182764622','111@gmail.com'),
('m002','张三','123456','男','18834356465','11@qq.com'),
('m003','admin2','123456','男','18856254120','0@qq.com'),
('m111','admin','123456','男','23432345','1@qq.com'),
('mm','admin1','123456','男',NULL,NULL);

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `bookID` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '书籍ID',
  `bookName` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '书名',
  `bookAuthor` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '书籍作者',
  `bookPublisher` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '出版社',
  `publishTime` datetime DEFAULT NULL COMMENT '出版日期',
  `bookPrice` float(5,2) DEFAULT NULL COMMENT '单价',
  `bookSum` int(5) DEFAULT NULL COMMENT '总数',
  `bookLend` int(255) DEFAULT NULL COMMENT '借出数量',
  `tag` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '书籍类型',
  `isbn` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'isbn编号',
  PRIMARY KEY (`bookID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `book` */

insert  into `book`(`bookID`,`bookName`,`bookAuthor`,`bookPublisher`,`publishTime`,`bookPrice`,`bookSum`,`bookLend`,`tag`,`isbn`) values 
('b001','冬与狮','兰晓龙','人民文学出版社','2021-10-01 10:11:01',39.00,4,0,'小说','9787020142422'),
('b002','技术与文明：我们的时代和未来','张笑宇','广西师范大学出版社','2021-03-10 10:12:23',78.00,5,1,'历史','9787559832870'),
('b003','细胞生物学（第4版）','翟中和','高等教育出版社','2011-06-01 10:14:38',78.00,2,0,'生物','9787040321753'),
('b004','计算机网络（第7版）','谢希仁','电子工业出版社','2017-01-01 10:15:39',45.00,1,1,'计算机','9787121302954'),
('b005','左宗棠全传','秦翰才','中华书局','2016-06-01 10:17:50',68.00,3,1,'历史','9787101115079'),
('b006','活着','余华','作家出版社','2012-08-01 10:19:35',20.00,2,1,'文学','9787506365437'),
('b007','鲁迅','鲁迅','北京日报出版社（原同心出版社）','2014-05-25 10:21:10',380.00,1,1,'文学','9787547711101'),
('b008','杭州古旧地图集','杭州市档案馆','浙江古籍出版社','2007-01-25 10:23:17',680.00,1,1,'地理','9787807151753'),
('b009','孙子兵法','[春秋]孙武','蓝天出版社','2006-04-25 10:24:41',29.80,1,0,'军事','9787801587466'),
('b010','福尔摩斯探案全集（套装共4册）','[英]阿瑟·柯南·道尔','译林出版社','2017-04-01 10:27:14',168.00,1,0,'小说','9787544766432');

/*Table structure for table `borrow` */

DROP TABLE IF EXISTS `borrow`;

CREATE TABLE `borrow` (
  `readerID` varchar(17) COLLATE utf8_bin NOT NULL COMMENT '读者id',
  `bookID` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '书籍id',
  `borrowTime` datetime NOT NULL COMMENT '借出时间',
  `returnTime` datetime DEFAULT NULL COMMENT '归还时间',
  PRIMARY KEY (`readerID`,`bookID`,`borrowTime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `borrow` */

insert  into `borrow`(`readerID`,`bookID`,`borrowTime`,`returnTime`) values 
('r001','b001','2024-03-03 07:30:14',NULL),
('r002','b003','2021-10-11 10:30:24','2023-03-03 07:29:27'),
('r110','b001','2021-10-03 10:30:07','2023-03-03 07:29:35'),
('r110','b002','2021-10-06 10:30:37','2023-03-03 07:29:55'),
('r110','b003','2021-10-17 10:30:52',NULL),
('r110','b004','2021-10-03 10:31:06','2021-10-03 10:32:13'),
('r110','b004','2021-10-25 10:31:49',NULL),
('r110','b005','2021-09-26 10:31:25',NULL),
('r110','b006','2021-10-10 10:31:35',NULL),
('r110','b007','2021-10-12 10:32:31',NULL),
('r110','b008','2021-10-06 10:32:08',NULL),
('r111','b010','2021-10-29 22:12:27','2021-10-29 22:23:02'),
('r111','b111','2021-10-29 11:27:33',NULL);

/*Table structure for table `reader` */

DROP TABLE IF EXISTS `reader`;

CREATE TABLE `reader` (
  `id` varchar(17) COLLATE utf8_bin NOT NULL COMMENT '读者id',
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `gender` varchar(255) COLLATE utf8_bin DEFAULT '男' COMMENT '性别',
  `telephone` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `reader` */

insert  into `reader`(`id`,`name`,`password`,`gender`,`telephone`,`email`) values 
('r001','张刚','123456','男','13615930165 ','jiaping@hotmail.com'),
('r002','黄金凤','123456','女','15630925514 ','guiying31@gmail.com'),
('r003','宋淑兰','123456','女','15144529242 ','zhuming@yahoo.com'),
('r004','陈凯','123456','男','18659586449 ','yfan@yahoo.com'),
('r005','草三','123456','男','15526854123','2132@qq.com'),
('r00511','test2','123456','男','17330000000','1@qq.co'),
('r110','test3','123456','女','17885544754','1@qq.co'),
('r111','test1','123456','男','17885544754','1@qq.co'),
('r114','test4','123456','男','17338453201','1@qq.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
