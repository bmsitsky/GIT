-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.17-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema quanlyvanban
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ quanlyvanban;
USE quanlyvanban;

--
-- Table structure for table `quanlyvanban`.`đính kèm cv`
--

DROP TABLE IF EXISTS `đính kèm cv`;
CREATE TABLE `đính kèm cv` (
  `Mã công việc` int(11) NOT NULL,
  `Mã File` int(11) DEFAULT NULL,
  PRIMARY KEY (`Mã công việc`),
  KEY `Mã File` (`Mã File`),
  CONSTRAINT `đính kèm cv_ibfk_1` FOREIGN KEY (`Mã công việc`) REFERENCES `công việc` (`Mã công việc`),
  CONSTRAINT `đính kèm cv_ibfk_2` FOREIGN KEY (`Mã File`) REFERENCES `file đính kèm` (`Mã File`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quanlyvanban`.`đính kèm cv`
--

/*!40000 ALTER TABLE `đính kèm cv` DISABLE KEYS */;
/*!40000 ALTER TABLE `đính kèm cv` ENABLE KEYS */;


--
-- Table structure for table `quanlyvanban`.`đính kèm vb`
--

DROP TABLE IF EXISTS `đính kèm vb`;
CREATE TABLE `đính kèm vb` (
  `Mã VB` int(11) NOT NULL,
  `Mã File` int(11) NOT NULL,
  PRIMARY KEY (`Mã VB`,`Mã File`),
  KEY `Mã File` (`Mã File`),
  CONSTRAINT `đính kèm vb_ibfk_1` FOREIGN KEY (`Mã File`) REFERENCES `file đính kèm` (`Mã File`),
  CONSTRAINT `đính kèm vb_ibfk_2` FOREIGN KEY (`Mã VB`) REFERENCES `văn bản` (`Mã văn bản`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quanlyvanban`.`đính kèm vb`
--

/*!40000 ALTER TABLE `đính kèm vb` DISABLE KEYS */;
/*!40000 ALTER TABLE `đính kèm vb` ENABLE KEYS */;


--
-- Table structure for table `quanlyvanban`.`công việc`
--

DROP TABLE IF EXISTS `công việc`;
CREATE TABLE `công việc` (
  `Mã công việc` int(11) NOT NULL,
  `Tên công việc` varchar(45) DEFAULT NULL,
  `Ngày tạo` date DEFAULT NULL,
  `Nơi sản xuất` varchar(45) DEFAULT NULL,
  `Thời hạn` date DEFAULT NULL,
  `Mô tả` varchar(100) DEFAULT NULL,
  `Nơi lưu` varchar(45) DEFAULT NULL,
  `Trạng thái` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Mã công việc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quanlyvanban`.`công việc`
--

/*!40000 ALTER TABLE `công việc` DISABLE KEYS */;
/*!40000 ALTER TABLE `công việc` ENABLE KEYS */;


--
-- Table structure for table `quanlyvanban`.`chức vụ`
--

DROP TABLE IF EXISTS `chức vụ`;
CREATE TABLE `chức vụ` (
  `Mã Chức Vụ` varchar(45) NOT NULL,
  `Tên chức vụ` varchar(45) NOT NULL,
  PRIMARY KEY (`Mã Chức Vụ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quanlyvanban`.`chức vụ`
--

/*!40000 ALTER TABLE `chức vụ` DISABLE KEYS */;
INSERT INTO `chức vụ` (`Mã Chức Vụ`,`Tên chức vụ`) VALUES 
 ('01','Trưởng phòng'),
 ('02','Phó phòng'),
 ('03','Nhân viên'),
 ('04','Thư ký'),
 ('PVT','Phó viện trưởng'),
 ('VT','Viện trưởng');
/*!40000 ALTER TABLE `chức vụ` ENABLE KEYS */;


--
-- Table structure for table `quanlyvanban`.`file đính kèm`
--

DROP TABLE IF EXISTS `file đính kèm`;
CREATE TABLE `file đính kèm` (
  `Mã File` int(11) NOT NULL,
  `Tên file` varchar(45) NOT NULL,
  `Trích yếu` varchar(100) DEFAULT NULL,
  `Loại file` varchar(45) NOT NULL,
  `Nơi lưu` varchar(50) NOT NULL,
  PRIMARY KEY (`Mã File`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quanlyvanban`.`file đính kèm`
--

/*!40000 ALTER TABLE `file đính kèm` DISABLE KEYS */;
/*!40000 ALTER TABLE `file đính kèm` ENABLE KEYS */;


--
-- Table structure for table `quanlyvanban`.`gửi và nhận cv`
--

DROP TABLE IF EXISTS `gửi và nhận cv`;
CREATE TABLE `gửi và nhận cv` (
  `Mã công việc` int(11) NOT NULL,
  `Mã người gửi` varchar(15) NOT NULL,
  `Mã người duyệt` varchar(15) NOT NULL,
  `Trạng thái duyệt` varchar(45) DEFAULT NULL,
  `Thời gian gửi` datetime DEFAULT NULL,
  `Thời gian nhận` datetime DEFAULT NULL,
  PRIMARY KEY (`Mã công việc`,`Mã người gửi`,`Mã người duyệt`),
  KEY `Mã người gửi` (`Mã người gửi`),
  KEY `Mã người duyệt` (`Mã người duyệt`),
  CONSTRAINT `gửi và nhận cv_ibfk_1` FOREIGN KEY (`Mã người gửi`) REFERENCES `user` (`Mã nhân viên`),
  CONSTRAINT `gửi và nhận cv_ibfk_2` FOREIGN KEY (`Mã người duyệt`) REFERENCES `user` (`Mã nhân viên`),
  CONSTRAINT `gửi và nhận cv_ibfk_3` FOREIGN KEY (`Mã công việc`) REFERENCES `công việc` (`Mã công việc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quanlyvanban`.`gửi và nhận cv`
--

/*!40000 ALTER TABLE `gửi và nhận cv` DISABLE KEYS */;
/*!40000 ALTER TABLE `gửi và nhận cv` ENABLE KEYS */;


--
-- Table structure for table `quanlyvanban`.`gửi và nhận vb`
--

DROP TABLE IF EXISTS `gửi và nhận vb`;
CREATE TABLE `gửi và nhận vb` (
  `Mã văn bản` int(11) NOT NULL,
  `Mã người gửi` varchar(15) NOT NULL,
  `Mã người nhận` varchar(15) NOT NULL,
  `Thời gian gửi` datetime NOT NULL,
  `Thời gian nhận` datetime NOT NULL,
  `Mã phòng gửi` varchar(45) NOT NULL,
  `Mã phòng nhận` varchar(45) NOT NULL,
  PRIMARY KEY (`Mã văn bản`,`Mã người gửi`,`Mã người nhận`),
  KEY `Mã người gửi` (`Mã người gửi`),
  KEY `Mã người nhận` (`Mã người nhận`),
  CONSTRAINT `gửi và nhận vb_ibfk_1` FOREIGN KEY (`Mã văn bản`) REFERENCES `văn bản` (`Mã văn bản`),
  CONSTRAINT `gửi và nhận vb_ibfk_2` FOREIGN KEY (`Mã người gửi`) REFERENCES `user` (`Mã nhân viên`),
  CONSTRAINT `gửi và nhận vb_ibfk_3` FOREIGN KEY (`Mã người nhận`) REFERENCES `user` (`Mã nhân viên`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quanlyvanban`.`gửi và nhận vb`
--

/*!40000 ALTER TABLE `gửi và nhận vb` DISABLE KEYS */;
/*!40000 ALTER TABLE `gửi và nhận vb` ENABLE KEYS */;


--
-- Table structure for table `quanlyvanban`.`nhóm phòng`
--

DROP TABLE IF EXISTS `nhóm phòng`;
CREATE TABLE `nhóm phòng` (
  `Mã nhóm phòng` varchar(45) NOT NULL,
  `Tên nhóm phòng` varchar(45) NOT NULL,
  PRIMARY KEY (`Mã nhóm phòng`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quanlyvanban`.`nhóm phòng`
--

/*!40000 ALTER TABLE `nhóm phòng` DISABLE KEYS */;
INSERT INTO `nhóm phòng` (`Mã nhóm phòng`,`Tên nhóm phòng`) VALUES 
 ('01','Các phòng chức năng'),
 ('02','Khối đơn vị sự nghiệp'),
 ('03','Ban quản lý dự án'),
 ('04','Ban thanh tra'),
 ('05','Các hội đồng'),
 ('06','Ban lãnh đạo');
/*!40000 ALTER TABLE `nhóm phòng` ENABLE KEYS */;


--
-- Table structure for table `quanlyvanban`.`phòng ban`
--

DROP TABLE IF EXISTS `phòng ban`;
CREATE TABLE `phòng ban` (
  `Mã phòng` varchar(45) NOT NULL,
  `Mã nhóm phòng` varchar(45) NOT NULL,
  `Tên phòng` varchar(45) NOT NULL,
  PRIMARY KEY (`Mã phòng`),
  KEY `Mã nhóm phòng` (`Mã nhóm phòng`),
  CONSTRAINT `phòng ban_ibfk_1` FOREIGN KEY (`Mã nhóm phòng`) REFERENCES `nhóm phòng` (`Mã nhóm phòng`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quanlyvanban`.`phòng ban`
--

/*!40000 ALTER TABLE `phòng ban` DISABLE KEYS */;
INSERT INTO `phòng ban` (`Mã phòng`,`Mã nhóm phòng`,`Tên phòng`) VALUES 
 ('1KH','01','Kế hoạch tài chính'),
 ('1KT','01','Quản lý Kĩ thuật, hạ tầng'),
 ('1QT','01','NCPT & Hợp tác quốc tế'),
 ('1VP','01','Văn phòng'),
 ('2CN','02','Trung tâm nghiên cứu Khoa học & ứng dụng chuy'),
 ('2NC','02','Trung tâm nghiên cứ QHKT đô thị, nông thôn'),
 ('2QH1','02','Trung tâm QHKT 1'),
 ('2QH2','02','Trung tâm QHKT 2'),
 ('2QH3','02','Trung tâm QHKT 3'),
 ('3DA','03','Quản lý dự án'),
 ('4TT','04','Phòng thanh tra'),
 ('5HD1','05','Hội đồng 1'),
 ('5HD2','05','Hội đồng 2'),
 ('6LD','06','Phòng lãnh đạo');
/*!40000 ALTER TABLE `phòng ban` ENABLE KEYS */;


--
-- Table structure for table `quanlyvanban`.`quyền user`
--

DROP TABLE IF EXISTS `quyền user`;
CREATE TABLE `quyền user` (
  `rule` int(11) NOT NULL,
  `Tên quyền user` varchar(45) NOT NULL,
  PRIMARY KEY (`rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quanlyvanban`.`quyền user`
--

/*!40000 ALTER TABLE `quyền user` DISABLE KEYS */;
INSERT INTO `quyền user` (`rule`,`Tên quyền user`) VALUES 
 (0,'Admin'),
 (1,'User'),
 (2,'Văn Thư');
/*!40000 ALTER TABLE `quyền user` ENABLE KEYS */;


--
-- Table structure for table `quanlyvanban`.`user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Mã nhân viên` varchar(15) NOT NULL,
  `Họ tên` varchar(45) NOT NULL,
  `Mã phòng` varchar(45) NOT NULL,
  `Mã chức vụ` varchar(45) NOT NULL,
  `birthday` date NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `rule` int(11) DEFAULT NULL,
  PRIMARY KEY (`Mã nhân viên`),
  KEY `Mã chức vụ` (`Mã chức vụ`),
  KEY `Mã phòng` (`Mã phòng`),
  KEY `rule` (`rule`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`Mã chức vụ`) REFERENCES `chức vụ` (`Mã Chức Vụ`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`Mã phòng`) REFERENCES `phòng ban` (`Mã phòng`),
  CONSTRAINT `user_ibfk_3` FOREIGN KEY (`rule`) REFERENCES `quyền user` (`rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quanlyvanban`.`user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`Mã nhân viên`,`Họ tên`,`Mã phòng`,`Mã chức vụ`,`birthday`,`username`,`password`,`rule`) VALUES 
 ('1','Mạnh Dũng','6LD','01','1998-01-08','dung@gmail.com','12345',0),
 ('10','Tao Ten Dung','1KT','01','1997-01-01','gh@gmail.com','1234ghj',1),
 ('123','ssgdf','1KH','02','0000-00-00','dgfgd@g.k','fgdgf',0),
 ('2','Nguyễn Tiến Đạt G','6LD','PVT','1997-03-03','dat22@gmail.com','12345678',1),
 ('3','Nguyễn Đạt G','1KT','01','1998-08-09','dat33@gmail.com','12345678',1),
 ('4','ghfhf','1KT','01','1998-09-21','test66@g.d','12345',1),
 ('44k','fgdg','1KH','02','1999-07-07','ffff@g.k','f',0),
 ('65','Dung Bui','1KH','01','1998-09-09','dd@gh.com','ttret',0),
 ('8we','hfhjygjgj','1KH','01','0000-00-00','t@g.f','132132',0),
 ('er2','Test name','1KH','01','1998-08-01','a@gg.c','53533',1),
 ('ffu','gdfhf','1KT','01','0000-00-00','hjh@g.k','rtetre',1),
 ('fgffd','fgtthtgf','1KH','01','0000-00-00','hfhfh@g.k','4534534',0),
 ('nv1','Dũng BM','1KH','02','1997-12-12','test@gmail.com','12345678',1),
 ('nv12','test admin','1KH','01','1997-01-01','adminff@g.g','12345',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Table structure for table `quanlyvanban`.`văn bản`
--

DROP TABLE IF EXISTS `văn bản`;
CREATE TABLE `văn bản` (
  `Mã văn bản` int(11) NOT NULL,
  `Thời hạn` varchar(45) NOT NULL,
  `Trạng thái` varchar(45) NOT NULL,
  `Nơi lưu` varchar(45) NOT NULL,
  `Tên VB` varchar(45) NOT NULL,
  `Loại VB` varchar(45) NOT NULL,
  `Loại File` varchar(45) NOT NULL,
  `Trích yếu` varchar(100) DEFAULT NULL,
  `Ngày tạo` date NOT NULL,
  `Số hiệu` varchar(45) NOT NULL,
  `Nơi lưu bản cứng` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Mã văn bản`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quanlyvanban`.`văn bản`
--

/*!40000 ALTER TABLE `văn bản` DISABLE KEYS */;
/*!40000 ALTER TABLE `văn bản` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
