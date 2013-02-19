-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.23-rc-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema mifossmall
--

CREATE DATABASE IF NOT EXISTS mifossmall;
USE mifossmall;

--
-- Definition of table `cm_caisse_users`
--

DROP TABLE IF EXISTS `cm_caisse_users`;
CREATE TABLE `cm_caisse_users` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CAISSE_ID` int(10) unsigned NOT NULL,
  `USER_ID` int(10) unsigned NOT NULL,
  `DATE_ID` date NOT NULL,
  `DATETIME_START` datetime DEFAULT NULL,
  `DATETIME_END` datetime DEFAULT NULL,
  `MAIN_CAISSE_ID` int(10) unsigned NOT NULL,
  `CREATED_BY` int(10) unsigned NOT NULL,
  `CREATED_DATE` date NOT NULL,
  `PAYROLL_ID` varchar(5) DEFAULT NULL,
  `LAST_ACTIVE` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cm_caisse_users`
--

/*!40000 ALTER TABLE `cm_caisse_users` DISABLE KEYS */;
INSERT INTO `cm_caisse_users` (`ID`,`CAISSE_ID`,`USER_ID`,`DATE_ID`,`DATETIME_START`,`DATETIME_END`,`MAIN_CAISSE_ID`,`CREATED_BY`,`CREATED_DATE`,`PAYROLL_ID`,`LAST_ACTIVE`) VALUES 
 (1,1,1,'2012-04-01','2012-04-01 00:00:00','2012-04-01 23:59:59',1,1,'2010-09-20','',1),
 (2,1,417,'2010-09-19','2010-09-19 00:00:00','2010-09-19 23:59:59',1,1,'2010-09-19','',0),
 (3,1,422,'2010-09-27','2010-09-27 00:00:00','2010-09-27 22:59:59',1,1,'2010-09-27','',0),
 (4,3,412,'2010-09-27','2010-09-27 12:14:00','2010-09-27 00:00:59',3,1,'2010-09-27','',0),
 (5,4,421,'2010-09-19','2010-09-19 00:00:00','2010-09-19 23:59:59',4,1,'2010-09-19','',0),
 (6,5,1,'2010-09-25','2010-09-25 00:00:00','2010-09-25 23:59:00',5,0,'0000-00-00','P0065',0),
 (7,5,5,'2010-09-05','2010-09-05 00:00:00','2010-09-05 23:59:00',5,0,'0000-00-00','',0),
 (8,5,426,'2010-09-20','2010-09-20 00:00:00','2010-09-20 23:59:59',5,1,'2010-09-20','',0),
 (9,412,3,'2010-09-19','2010-09-19 00:00:00','2010-09-19 23:59:59',3,1,'2010-09-19','',0),
 (10,2,412,'2010-09-27','2010-09-27 12:00:00','2010-09-27 15:00:59',2,1,'2010-09-27','',0);
/*!40000 ALTER TABLE `cm_caisse_users` ENABLE KEYS */;


--
-- Definition of table `cm_caisses`
--

DROP TABLE IF EXISTS `cm_caisses`;
CREATE TABLE `cm_caisses` (
  `ID` int(10) unsigned NOT NULL,
  `DISPLAY_NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cm_caisses`
--

/*!40000 ALTER TABLE `cm_caisses` DISABLE KEYS */;
INSERT INTO `cm_caisses` (`ID`,`DISPLAY_NAME`) VALUES 
 (1,'Tadhamen'),
 (2,'Omrane'),
 (3,'Douar Hicher'),
 (4,'Oued Ellil'),
 (5,'Hrairia');
/*!40000 ALTER TABLE `cm_caisses` ENABLE KEYS */;


--
-- Definition of table `cm_log`
--

DROP TABLE IF EXISTS `cm_log`;
CREATE TABLE `cm_log` (
  `USER_ID` int(10) unsigned NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `OPERATION_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cm_log`
--

/*!40000 ALTER TABLE `cm_log` DISABLE KEYS */;
INSERT INTO `cm_log` (`USER_ID`,`CREATED_DATE`,`OPERATION_ID`) VALUES 
 (1,'2012-04-16 14:06:26',1);
/*!40000 ALTER TABLE `cm_log` ENABLE KEYS */;


--
-- Definition of table `cm_reports`
--

DROP TABLE IF EXISTS `cm_reports`;
CREATE TABLE `cm_reports` (
  `REPORT_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `REPORT_NAME` varchar(45) NOT NULL,
  `REPORT_LABEL` varchar(45) NOT NULL,
  `REPORT_STATUS` int(10) unsigned NOT NULL DEFAULT '1',
  `REPORT_PARAM_NUM` int(10) unsigned NOT NULL DEFAULT '0',
  `REPORT_XLS` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`REPORT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cm_reports`
--

/*!40000 ALTER TABLE `cm_reports` DISABLE KEYS */;
INSERT INTO `cm_reports` (`REPORT_ID`,`REPORT_NAME`,`REPORT_LABEL`,`REPORT_STATUS`,`REPORT_PARAM_NUM`,`REPORT_XLS`) VALUES 
 (1,'etat_general_V3.rptdesign','Etat general',1,1,0),
 (2,'etat_antennes.rptdesign','Etat antennes',1,0,1),
 (3,'Abandons.rptdesign','ab',1,1,0),
 (4,'Abandons.rptdesign','AB',1,1,0),
 (5,'CAZone.rptdesign','Cactifs par zone',1,0,1),
 (6,'CAAgent.rptdesign','Cactifs par agent',1,1,1),
 (7,'Days_Late_Report.rptdesign','lassaad',1,0,0),
 (8,'etat_detail.rptdesign','Etat détaillé',1,1,1),
 (9,'etat_detail_caissier.rptdesign','detail caissier',1,1,1),
 (10,'cm_ds_lib.rptlibrary','1',1,0,0);
/*!40000 ALTER TABLE `cm_reports` ENABLE KEYS */;


--
-- Definition of table `cm_roles`
--

DROP TABLE IF EXISTS `cm_roles`;
CREATE TABLE `cm_roles` (
  `CM_ROLE_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `MIFOS_ROLE_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `DISPLAY_NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CM_ROLE_ID`,`MIFOS_ROLE_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cm_roles`
--

/*!40000 ALTER TABLE `cm_roles` DISABLE KEYS */;
INSERT INTO `cm_roles` (`CM_ROLE_ID`,`MIFOS_ROLE_ID`,`DISPLAY_NAME`) VALUES 
 (1,1,'Admin'),
 (1,9,NULL),
 (2,5,NULL),
 (3,2,NULL),
 (3,3,NULL),
 (3,4,NULL),
 (3,6,NULL),
 (3,7,NULL),
 (3,8,NULL);
/*!40000 ALTER TABLE `cm_roles` ENABLE KEYS */;


--
-- Definition of table `cm_trace`
--

DROP TABLE IF EXISTS `cm_trace`;
CREATE TABLE `cm_trace` (
  `IDOperation` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `LoanId` int(10) unsigned DEFAULT NULL,
  `TransDate` date DEFAULT NULL,
  `ComputerName` varchar(50) DEFAULT NULL,
  `UserId` smallint(5) DEFAULT NULL,
  `TransType` smallint(5) DEFAULT NULL,
  `TransRef` varchar(50) DEFAULT NULL,
  `Amount` decimal(10,3) DEFAULT NULL,
  `IsFixed` tinyint(1) DEFAULT '0',
  `DateEntered` datetime DEFAULT NULL,
  `TimeEntered` time DEFAULT NULL,
  `CanBeReversed` tinyint(1) DEFAULT '1',
  `CUSTOMER_ID` int(10) unsigned DEFAULT NULL,
  `FixedTransID` varchar(50) DEFAULT NULL,
  `CaisseBalance` decimal(10,3) DEFAULT NULL,
  `ReverseReason` smallint(5) DEFAULT NULL,
  `DisMode` smallint(5) DEFAULT '1',
  `mifosBranch` int(10) DEFAULT NULL,
  `mifosTransID` int(10) DEFAULT NULL,
  `mifosRELATED_TRXN_ID` int(10) DEFAULT NULL,
  `EnteredByTransfer` tinyint(3) unsigned DEFAULT '0',
  `Label` varchar(45) DEFAULT NULL,
  `caisse` int(10) unsigned NOT NULL,
  `solde_fixed` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`IDOperation`),
  KEY `CMTraceLoanID` (`LoanId`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cm_trace`
--

/*!40000 ALTER TABLE `cm_trace` DISABLE KEYS */;
INSERT INTO `cm_trace` (`IDOperation`,`LoanId`,`TransDate`,`ComputerName`,`UserId`,`TransType`,`TransRef`,`Amount`,`IsFixed`,`DateEntered`,`TimeEntered`,`CanBeReversed`,`CUSTOMER_ID`,`FixedTransID`,`CaisseBalance`,`ReverseReason`,`DisMode`,`mifosBranch`,`mifosTransID`,`mifosRELATED_TRXN_ID`,`EnteredByTransfer`,`Label`,`caisse`,`solde_fixed`) VALUES 
 (36,0,'2010-08-16',NULL,1,7,'TT','2000.000',0,'2010-08-16 00:00:00','11:24:48',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'null',5,0),
 (37,0,'2010-08-16',NULL,1,14,'FF','200.000',0,'2010-08-16 00:00:00','11:24:59',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'null',5,0),
 (38,0,'2010-08-16',NULL,1,18,'_','10.000',0,'2010-08-16 00:00:00','11:25:15',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'null',5,0),
 (39,0,'2010-08-16',NULL,1,8,'EE','-74111.000',0,'2010-08-16 00:00:00','11:25:37',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'TADHAMEN',5,0),
 (40,0,'2010-08-16',NULL,1,17,'0085-000023415','-200.000',0,'2010-08-16 00:00:00','11:25:57',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'siège',5,0),
 (41,0,'2010-08-16',NULL,1,9,'SD','-6000.000',0,'2010-08-16 00:00:00','11:26:07',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'0085-000023415',5,0);
INSERT INTO `cm_trace` (`IDOperation`,`LoanId`,`TransDate`,`ComputerName`,`UserId`,`TransType`,`TransRef`,`Amount`,`IsFixed`,`DateEntered`,`TimeEntered`,`CanBeReversed`,`CUSTOMER_ID`,`FixedTransID`,`CaisseBalance`,`ReverseReason`,`DisMode`,`mifosBranch`,`mifosTransID`,`mifosRELATED_TRXN_ID`,`EnteredByTransfer`,`Label`,`caisse`,`solde_fixed`) VALUES 
 (42,0,'2010-08-16',NULL,1,19,'_','-10.000',0,'2010-08-16 00:00:00','11:27:18',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'_',5,0),
 (43,0,'2010-08-16',NULL,1,9,'_','200.000',0,'2010-08-16 00:00:00','11:35:50',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'_',5,0),
 (44,0,'2010-08-17',NULL,1,11,'_','500.000',0,'2010-08-17 00:00:00','16:28:04',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'SPH',0,0),
 (45,0,'2010-08-17',NULL,1,11,'_','200.000',0,'2010-08-17 00:00:00','17:48:57',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'SPH',0,0),
 (46,0,'2010-08-17',NULL,1,11,'_','80.000',0,'2010-08-17 00:00:00','17:55:40',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'SPH',5,0),
 (47,0,'2010-08-18',NULL,1,7,'44','200.000',0,'2010-08-18 00:00:00','13:10:20',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'null',5,0);
INSERT INTO `cm_trace` (`IDOperation`,`LoanId`,`TransDate`,`ComputerName`,`UserId`,`TransType`,`TransRef`,`Amount`,`IsFixed`,`DateEntered`,`TimeEntered`,`CanBeReversed`,`CUSTOMER_ID`,`FixedTransID`,`CaisseBalance`,`ReverseReason`,`DisMode`,`mifosBranch`,`mifosTransID`,`mifosRELATED_TRXN_ID`,`EnteredByTransfer`,`Label`,`caisse`,`solde_fixed`) VALUES 
 (48,0,'2010-08-18',NULL,1,14,'45','20000.000',0,'2010-08-18 00:00:00','13:11:28',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'null',5,0),
 (49,0,'2010-08-18',NULL,1,7,'dfgdf','2000.000',0,'2010-08-18 00:00:00','15:54:23',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'null',5,0),
 (50,0,'2010-08-18',NULL,1,8,'d','-400.000',0,'2010-08-18 00:00:00','17:33:02',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'d',5,0),
 (51,0,'2010-08-19',NULL,1,7,'DF','2000.000',1,'2010-08-19 00:00:00','12:12:23',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'null',5,0),
 (52,0,'2010-08-19',NULL,1,7,'A','2000.000',1,'2010-08-19 00:00:00','13:21:24',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'null',5,0),
 (53,0,'2010-08-19',NULL,1,7,'787','20000.000',1,'2010-08-19 00:00:00','13:37:55',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'null',5,0);
INSERT INTO `cm_trace` (`IDOperation`,`LoanId`,`TransDate`,`ComputerName`,`UserId`,`TransType`,`TransRef`,`Amount`,`IsFixed`,`DateEntered`,`TimeEntered`,`CanBeReversed`,`CUSTOMER_ID`,`FixedTransID`,`CaisseBalance`,`ReverseReason`,`DisMode`,`mifosBranch`,`mifosTransID`,`mifosRELATED_TRXN_ID`,`EnteredByTransfer`,`Label`,`caisse`,`solde_fixed`) VALUES 
 (54,0,'2010-08-19',NULL,1,8,'ll','-20000.000',1,'2010-08-19 00:00:00','13:38:48',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'iii',5,0),
 (55,0,'2010-08-19',NULL,1,9,'ll\r\n','20000.000',1,'2010-08-19 00:00:00','14:44:03',1,NULL,'54',NULL,NULL,1,NULL,NULL,NULL,0,'Annulation',5,0),
 (56,0,'2010-08-19',NULL,1,9,'787\r\n','-20000.000',1,'2010-08-19 00:00:00','14:54:45',1,NULL,'53',NULL,NULL,1,NULL,NULL,NULL,0,'Annulation',5,0),
 (57,0,'2010-08-19',NULL,1,9,'A\r\n','-2000.000',1,'2010-08-19 00:00:00','14:54:54',1,NULL,'52',NULL,NULL,1,NULL,NULL,NULL,0,'Annulation',5,0),
 (58,0,'2010-08-19',NULL,1,7,'er','2000.000',1,'2010-08-19 00:00:00','14:55:03',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'E',5,0),
 (59,0,'2010-08-19',NULL,1,9,'er\r\n','-2000.000',1,'2010-08-19 00:00:00','14:55:10',1,NULL,'58',NULL,NULL,1,NULL,NULL,NULL,0,'Annulation',5,0);
INSERT INTO `cm_trace` (`IDOperation`,`LoanId`,`TransDate`,`ComputerName`,`UserId`,`TransType`,`TransRef`,`Amount`,`IsFixed`,`DateEntered`,`TimeEntered`,`CanBeReversed`,`CUSTOMER_ID`,`FixedTransID`,`CaisseBalance`,`ReverseReason`,`DisMode`,`mifosBranch`,`mifosTransID`,`mifosRELATED_TRXN_ID`,`EnteredByTransfer`,`Label`,`caisse`,`solde_fixed`) VALUES 
 (60,0,'2010-08-19',NULL,1,7,'k','100.000',1,'2010-08-19 00:00:00','15:37:06',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2000',5,0),
 (61,0,'2010-08-19',NULL,1,8,'lkl','-2000.000',1,'2010-08-19 00:00:00','15:37:22',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'klk',5,0),
 (62,0,'2010-08-19',NULL,1,9,'k\r\n','-100.000',1,'2010-08-19 00:00:00','15:45:39',1,NULL,'60',NULL,NULL,1,NULL,NULL,NULL,0,'Annulation',5,0),
 (63,0,'2010-08-19',NULL,1,7,'RT','200.000',1,'2010-08-19 00:00:00','17:21:50',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'E',5,0),
 (64,0,'2010-08-19',NULL,1,11,'_','200.000',1,'2010-08-19 00:00:00','17:22:08',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'SPH',5,0),
 (65,0,'2010-08-19',NULL,1,9,'_\r\n','-200.000',1,'2010-08-19 00:00:00','17:23:28',1,NULL,'64',NULL,NULL,1,NULL,NULL,NULL,0,'Annulation',5,0);
INSERT INTO `cm_trace` (`IDOperation`,`LoanId`,`TransDate`,`ComputerName`,`UserId`,`TransType`,`TransRef`,`Amount`,`IsFixed`,`DateEntered`,`TimeEntered`,`CanBeReversed`,`CUSTOMER_ID`,`FixedTransID`,`CaisseBalance`,`ReverseReason`,`DisMode`,`mifosBranch`,`mifosTransID`,`mifosRELATED_TRXN_ID`,`EnteredByTransfer`,`Label`,`caisse`,`solde_fixed`) VALUES 
 (66,0,'2010-08-19',NULL,1,9,'RT\r\n','-200.000',1,'2010-08-19 00:00:00','17:23:43',1,NULL,'63',NULL,NULL,1,NULL,NULL,NULL,0,'Annulation',5,0),
 (67,0,'2010-08-19',NULL,1,9,'lkl\r\n','2000.000',1,'2010-08-19 00:00:00','17:23:56',1,NULL,'61',NULL,NULL,1,NULL,NULL,NULL,0,'Annulation',5,0),
 (68,0,'2010-08-19',NULL,1,9,'DF\r\n','-2000.000',1,'2010-08-19 00:00:00','17:24:12',1,NULL,'51',NULL,NULL,1,NULL,NULL,NULL,0,'Annulation',5,0),
 (69,0,'2010-08-21',NULL,1,14,'e','200.000',0,'2010-08-21 00:00:00','17:19:59',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'1',5,0),
 (70,0,'2010-08-22',NULL,1,7,'rr','460.000',1,'2010-08-22 00:00:00','11:50:34',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'r',5,0),
 (71,0,'2010-08-22',NULL,1,16,'rr\r\n','-460.000',1,'2010-08-22 00:00:00','11:52:16',1,NULL,'70',NULL,NULL,1,NULL,NULL,NULL,0,'Annulation',5,0);
INSERT INTO `cm_trace` (`IDOperation`,`LoanId`,`TransDate`,`ComputerName`,`UserId`,`TransType`,`TransRef`,`Amount`,`IsFixed`,`DateEntered`,`TimeEntered`,`CanBeReversed`,`CUSTOMER_ID`,`FixedTransID`,`CaisseBalance`,`ReverseReason`,`DisMode`,`mifosBranch`,`mifosTransID`,`mifosRELATED_TRXN_ID`,`EnteredByTransfer`,`Label`,`caisse`,`solde_fixed`) VALUES 
 (72,0,'2010-08-22',NULL,1,7,'s','200.000',1,'2010-08-22 00:00:00','16:42:17',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'D',5,0),
 (73,0,'2010-08-22',NULL,1,9,'_','-200.000',1,'2010-08-22 00:00:00','16:48:30',1,NULL,'72',NULL,NULL,1,NULL,NULL,NULL,0,'Annulation',5,0),
 (74,0,'2010-08-23',NULL,1,7,'s','4000.000',0,'2010-08-23 00:00:00','09:56:11',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'skk',5,0),
 (75,0,'2010-08-23',NULL,1,8,'skk','-200.000',0,'2010-08-23 00:00:00','09:56:21',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'skks',5,0),
 (76,0,'2010-08-23',NULL,1,8,'_','-10.000',0,'2010-08-23 00:00:00','13:17:30',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'_',5,0),
 (77,0,'2010-08-23',NULL,1,3,'-','-10.000',0,'2010-08-23 00:00:00','13:18:23',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'-',5,0);
INSERT INTO `cm_trace` (`IDOperation`,`LoanId`,`TransDate`,`ComputerName`,`UserId`,`TransType`,`TransRef`,`Amount`,`IsFixed`,`DateEntered`,`TimeEntered`,`CanBeReversed`,`CUSTOMER_ID`,`FixedTransID`,`CaisseBalance`,`ReverseReason`,`DisMode`,`mifosBranch`,`mifosTransID`,`mifosRELATED_TRXN_ID`,`EnteredByTransfer`,`Label`,`caisse`,`solde_fixed`) VALUES 
 (78,0,'2010-08-23',NULL,1,2,'-','10.000',0,'2010-08-23 00:00:00','13:24:33',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'-',5,0),
 (79,0,'2010-08-23',NULL,1,14,'-','700.000',0,'2010-08-23 00:00:00','13:54:46',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'DD',5,0),
 (80,0,'2010-08-23',NULL,1,17,'-','-4000.000',0,'2010-08-23 00:00:00','14:14:44',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'d',5,0),
 (81,0,'2010-08-23',NULL,1,6,'-','-200.000',0,'2010-08-23 00:00:00','14:48:48',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'-',5,0),
 (82,0,'2010-08-23',NULL,1,7,'-','252.900',0,'2010-08-23 00:00:00','14:49:21',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'D',5,0),
 (83,0,'2010-08-23',NULL,1,8,'-','-505.800',0,'2010-08-23 00:00:00','14:49:58',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'-',5,0);
INSERT INTO `cm_trace` (`IDOperation`,`LoanId`,`TransDate`,`ComputerName`,`UserId`,`TransType`,`TransRef`,`Amount`,`IsFixed`,`DateEntered`,`TimeEntered`,`CanBeReversed`,`CUSTOMER_ID`,`FixedTransID`,`CaisseBalance`,`ReverseReason`,`DisMode`,`mifosBranch`,`mifosTransID`,`mifosRELATED_TRXN_ID`,`EnteredByTransfer`,`Label`,`caisse`,`solde_fixed`) VALUES 
 (84,0,'2010-08-23',NULL,1,11,'_','5.000',0,'2010-08-23 00:00:00','14:03:08',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'SPH',5,0),
 (85,0,'2010-08-24',NULL,1,7,'-','2000.000',0,'2010-08-24 00:00:00','14:27:08',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'RT',5,0),
 (86,0,'2010-08-25',NULL,1,11,'_','2.000',0,'2010-08-25 00:00:00','13:39:14',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'SPH',5,0),
 (87,0,'2010-08-25',NULL,1,7,'-','2000.000',0,'2010-08-25 00:00:00','14:11:14',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'-',5,0),
 (88,0,'2010-08-30',NULL,1,7,'005','5000.000',0,'2010-08-30 00:00:00','12:45:42',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'0001',5,0),
 (89,0,'2010-08-30',NULL,1,8,'200','-300.000',0,'2010-08-30 00:00:00','12:46:01',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'zh',5,0);
INSERT INTO `cm_trace` (`IDOperation`,`LoanId`,`TransDate`,`ComputerName`,`UserId`,`TransType`,`TransRef`,`Amount`,`IsFixed`,`DateEntered`,`TimeEntered`,`CanBeReversed`,`CUSTOMER_ID`,`FixedTransID`,`CaisseBalance`,`ReverseReason`,`DisMode`,`mifosBranch`,`mifosTransID`,`mifosRELATED_TRXN_ID`,`EnteredByTransfer`,`Label`,`caisse`,`solde_fixed`) VALUES 
 (90,0,'2010-08-30',NULL,1,11,'_','4000.000',0,'2010-08-30 00:00:00','12:46:12',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'SPH',5,0),
 (91,0,'2010-09-03',NULL,1,2,'-','10.000',0,'2010-09-03 00:00:00','15:54:19',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'-',5,0),
 (92,0,'2010-09-03',NULL,1,2,'_','10.000',0,'2010-09-03 00:00:00','15:59:47',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'_',5,0),
 (93,0,'2010-09-05',NULL,1,2,'_','10.000',1,'2010-09-05 00:00:00','11:45:25',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'_',5,0),
 (94,0,'2010-09-05',NULL,1,2,'_','10.000',0,'2010-09-05 11:50:57','11:50:57',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'_',5,0),
 (95,0,'2010-09-05',NULL,1,16,'_','-10.000',1,'2010-09-05 12:17:14','12:17:14',1,NULL,'93',NULL,NULL,1,NULL,NULL,NULL,0,'Annulation',5,0),
 (96,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 00:00:00','21:04:19',1,434,NULL,NULL,NULL,1,53,NULL,NULL,0,'_',5,0);
INSERT INTO `cm_trace` (`IDOperation`,`LoanId`,`TransDate`,`ComputerName`,`UserId`,`TransType`,`TransRef`,`Amount`,`IsFixed`,`DateEntered`,`TimeEntered`,`CanBeReversed`,`CUSTOMER_ID`,`FixedTransID`,`CaisseBalance`,`ReverseReason`,`DisMode`,`mifosBranch`,`mifosTransID`,`mifosRELATED_TRXN_ID`,`EnteredByTransfer`,`Label`,`caisse`,`solde_fixed`) VALUES 
 (97,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 00:00:00','21:05:17',1,434,NULL,NULL,NULL,1,53,NULL,NULL,0,'_',5,0),
 (98,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 21:25:20','21:25:22',1,434,NULL,NULL,NULL,1,53,NULL,NULL,0,'_',5,0),
 (99,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 21:25:22','21:25:22',1,434,NULL,NULL,NULL,1,53,NULL,NULL,0,'_',5,0),
 (100,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 21:25:55','21:25:55',1,434,NULL,NULL,NULL,1,53,NULL,NULL,0,'_',5,0),
 (101,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 21:25:55','21:25:55',1,434,NULL,NULL,NULL,1,53,NULL,NULL,0,'_',5,0),
 (102,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 00:00:00','21:28:04',1,434,NULL,NULL,NULL,1,53,NULL,NULL,0,'_',5,0),
 (103,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 00:00:00','21:30:07',1,434,NULL,NULL,NULL,1,53,NULL,NULL,0,'_',5,0);
INSERT INTO `cm_trace` (`IDOperation`,`LoanId`,`TransDate`,`ComputerName`,`UserId`,`TransType`,`TransRef`,`Amount`,`IsFixed`,`DateEntered`,`TimeEntered`,`CanBeReversed`,`CUSTOMER_ID`,`FixedTransID`,`CaisseBalance`,`ReverseReason`,`DisMode`,`mifosBranch`,`mifosTransID`,`mifosRELATED_TRXN_ID`,`EnteredByTransfer`,`Label`,`caisse`,`solde_fixed`) VALUES 
 (104,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 10:40:39','21:32:21',1,434,NULL,NULL,NULL,1,53,NULL,NULL,0,'_',5,0),
 (105,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 10:40:39','21:34:26',1,434,NULL,NULL,NULL,1,53,NULL,NULL,0,'_',5,0),
 (106,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 10:40:39','21:36:17',1,434,NULL,NULL,NULL,1,53,NULL,NULL,0,'_',5,0),
 (107,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 10:40:39','21:37:13',1,434,NULL,NULL,NULL,1,53,NULL,NULL,0,'_',5,0),
 (108,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 10:40:39','21:40:03',1,434,NULL,NULL,NULL,1,53,NULL,NULL,0,'_',5,0),
 (109,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 10:40:39','21:42:08',1,434,NULL,NULL,NULL,1,53,NULL,NULL,0,'_',5,0);
INSERT INTO `cm_trace` (`IDOperation`,`LoanId`,`TransDate`,`ComputerName`,`UserId`,`TransType`,`TransRef`,`Amount`,`IsFixed`,`DateEntered`,`TimeEntered`,`CanBeReversed`,`CUSTOMER_ID`,`FixedTransID`,`CaisseBalance`,`ReverseReason`,`DisMode`,`mifosBranch`,`mifosTransID`,`mifosRELATED_TRXN_ID`,`EnteredByTransfer`,`Label`,`caisse`,`solde_fixed`) VALUES 
 (110,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 10:40:39','21:43:15',1,434,NULL,NULL,NULL,1,53,NULL,NULL,0,'_',5,0),
 (111,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 10:40:39','21:43:25',1,434,NULL,NULL,NULL,1,53,NULL,NULL,0,'_',5,0),
 (112,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 10:40:39','21:43:32',1,434,NULL,NULL,NULL,1,53,NULL,NULL,0,'_',5,0),
 (113,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 10:40:39','21:48:15',1,434,NULL,NULL,NULL,1,53,4421,0,1,'_',5,0),
 (114,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 10:40:39','21:48:47',1,434,NULL,NULL,NULL,1,53,4421,0,1,'_',5,0),
 (115,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 10:40:39','21:55:47',1,434,NULL,NULL,NULL,1,53,4421,0,1,'_',5,0),
 (116,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 10:40:39','22:00:45',1,434,NULL,NULL,NULL,1,53,4421,0,1,'_',5,0);
INSERT INTO `cm_trace` (`IDOperation`,`LoanId`,`TransDate`,`ComputerName`,`UserId`,`TransType`,`TransRef`,`Amount`,`IsFixed`,`DateEntered`,`TimeEntered`,`CanBeReversed`,`CUSTOMER_ID`,`FixedTransID`,`CaisseBalance`,`ReverseReason`,`DisMode`,`mifosBranch`,`mifosTransID`,`mifosRELATED_TRXN_ID`,`EnteredByTransfer`,`Label`,`caisse`,`solde_fixed`) VALUES 
 (117,1231,'2010-09-05',NULL,1,9,'_','-166.500',1,'2010-09-05 10:50:24','22:00:45',1,434,NULL,NULL,NULL,1,53,4426,4423,1,'_',5,0),
 (118,1231,'2010-09-05',NULL,1,1,'_','830.400',1,'2010-09-05 10:40:39','22:04:26',1,434,NULL,NULL,NULL,1,53,4421,0,1,'_',5,0),
 (119,1231,'2010-09-05',NULL,1,9,'_','-166.500',1,'2010-09-05 10:50:24','22:04:26',1,434,NULL,NULL,NULL,1,53,4426,4423,1,'_',5,0),
 (120,0,'2010-09-18',NULL,1,12,'o','20.000',0,'2010-09-18 21:06:10','21:06:10',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'Ali',5,0),
 (121,0,'2010-09-18',NULL,1,12,'o','200.000',0,'2010-09-18 21:10:17','21:10:17',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'Lai',5,0),
 (122,0,'2010-09-18',NULL,1,12,'o','200.000',0,'2010-09-18 21:12:18','21:12:18',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'Lai',5,0);
INSERT INTO `cm_trace` (`IDOperation`,`LoanId`,`TransDate`,`ComputerName`,`UserId`,`TransType`,`TransRef`,`Amount`,`IsFixed`,`DateEntered`,`TimeEntered`,`CanBeReversed`,`CUSTOMER_ID`,`FixedTransID`,`CaisseBalance`,`ReverseReason`,`DisMode`,`mifosBranch`,`mifosTransID`,`mifosRELATED_TRXN_ID`,`EnteredByTransfer`,`Label`,`caisse`,`solde_fixed`) VALUES 
 (123,0,'2010-09-18',NULL,1,12,'p','40.000',0,'2010-09-18 21:14:29','21:14:29',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'zebra',5,0),
 (124,559,'2010-09-18',NULL,1,12,'y','50.000',0,'2010-09-18 21:16:46','21:16:46',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'tyyy',5,0),
 (125,559,'2010-09-18',NULL,1,13,'yu','200.000',0,'2010-09-18 21:18:18','21:18:18',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'jjj',5,0),
 (126,0,'2010-09-26',NULL,1,7,'-','200.000',0,'2010-09-26 20:14:51','20:14:51',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'7',5,0),
 (127,0,'2010-09-26',NULL,1,8,'-','5.000',0,'2010-09-26 20:15:03','20:15:03',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'4',5,0),
 (128,0,'2010-09-26',NULL,1,3,'_','10.000',0,'2010-09-26 20:16:01','20:16:01',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'_',5,0);
INSERT INTO `cm_trace` (`IDOperation`,`LoanId`,`TransDate`,`ComputerName`,`UserId`,`TransType`,`TransRef`,`Amount`,`IsFixed`,`DateEntered`,`TimeEntered`,`CanBeReversed`,`CUSTOMER_ID`,`FixedTransID`,`CaisseBalance`,`ReverseReason`,`DisMode`,`mifosBranch`,`mifosTransID`,`mifosRELATED_TRXN_ID`,`EnteredByTransfer`,`Label`,`caisse`,`solde_fixed`) VALUES 
 (129,0,'2010-09-26',NULL,1,21,'4','4.000',0,'2010-09-26 20:18:26','20:18:26',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'4',5,0),
 (130,0,'2010-09-26',NULL,1,22,'4','6.000',0,'2010-09-26 20:18:50','20:18:50',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'û',5,0),
 (131,0,'2010-09-26',NULL,1,20,'kk','200.000',0,'2010-09-26 20:19:17','20:19:17',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'',5,0),
 (132,0,'2010-09-27',NULL,1,7,'-','200.000',0,'2010-09-27 18:18:19','18:18:19',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'***',5,0),
 (133,0,'2012-04-01',NULL,1,23,'222','500.000',0,'2012-04-01 03:05:15','03:05:15',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'4',1,0),
 (134,0,'2012-04-01',NULL,1,6,'fs','20.000',0,'2012-04-01 03:58:19','03:58:19',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'d',1,0);
INSERT INTO `cm_trace` (`IDOperation`,`LoanId`,`TransDate`,`ComputerName`,`UserId`,`TransType`,`TransRef`,`Amount`,`IsFixed`,`DateEntered`,`TimeEntered`,`CanBeReversed`,`CUSTOMER_ID`,`FixedTransID`,`CaisseBalance`,`ReverseReason`,`DisMode`,`mifosBranch`,`mifosTransID`,`mifosRELATED_TRXN_ID`,`EnteredByTransfer`,`Label`,`caisse`,`solde_fixed`) VALUES 
 (135,0,'2012-04-01',NULL,1,7,'df','200.000',0,'2012-04-01 03:59:18','03:59:18',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'sf',1,0),
 (136,0,'2012-04-10',NULL,1,11,'_','550.000',0,'2012-04-11 15:34:17','15:34:17',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'SPH',1,1),
 (137,0,'2012-04-11',NULL,1,14,'_','550.000',1,'2012-04-11 15:35:48','15:35:48',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'Report automatique de la caisse',1,0),
 (138,0,'2012-04-11',NULL,1,14,'_','550.000',1,'2012-04-11 16:25:16','16:25:16',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'Report automatique de la caisse',1,0),
 (139,0,'2012-04-11',NULL,1,16,'_','-550.000',1,'2012-04-11 16:39:26','16:39:26',1,NULL,'138',NULL,NULL,1,NULL,NULL,NULL,0,'Annulation',1,0),
 (140,0,'2012-04-11',NULL,1,16,'_','-550.000',1,'2012-04-11 16:42:52','16:42:52',1,NULL,'137',NULL,NULL,1,NULL,NULL,NULL,0,'Annulation',1,0);
/*!40000 ALTER TABLE `cm_trace` ENABLE KEYS */;


--
-- Definition of table `cm_trans_types`
--

DROP TABLE IF EXISTS `cm_trans_types`;
CREATE TABLE `cm_trans_types` (
  `IDType` smallint(5) NOT NULL,
  `TypeName` varchar(50) DEFAULT NULL,
  `TypeAlias` varchar(50) DEFAULT NULL,
  `PrevType` smallint(5) DEFAULT NULL,
  `SIGN` float DEFAULT '1',
  PRIMARY KEY (`IDType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cm_trans_types`
--

/*!40000 ALTER TABLE `cm_trans_types` DISABLE KEYS */;
INSERT INTO `cm_trans_types` (`IDType`,`TypeName`,`TypeAlias`,`PrevType`,`SIGN`) VALUES 
 (1,'Remboursement','RCP',1,1),
 (2,'Entree_Fonds_Caisse','RAC',1,1),
 (3,'Sortie_Fonds_Caisse','RAN',1,-1),
 (4,'Frais_Inscription','FI',2,1),
 (5,'-','Oc',2,-1),
 (6,'Versement A la banque','RRC',7,-1),
 (7,'Chèque_alimentation','ALC',3,1),
 (8,'Sortie_de_fonds','SF',4,-1),
 (9,'Annulation remboursement','VB',4,-1),
 (10,'Octroi','REV',0,-1),
 (11,'Solde_Physique','SPH',5,-1),
 (12,'Remb_A_Problème','RAP',6,1),
 (13,'Frais_A_Problème','FAP',6,1),
 (14,'Report_caisse','ALR',3,1),
 (15,'Alimentation_autre_caisse','ALA',3,1),
 (16,'Annulation caisse','RVS',0,1),
 (17,'Sortie_de_fonds_Siège','SFG',4,-1),
 (18,'Annulation Frais','EFC',3,-1),
 (19,'Annulation Octroi','SFC',4,1),
 (20,'Pertes Collectées','PEC',NULL,1),
 (21,'Restitution excédent','REX',NULL,-1),
 (22,'Régularisation déficit','RDF',NULL,1),
 (23,'Alimentation Cheque client','ACC',3,1);
/*!40000 ALTER TABLE `cm_trans_types` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
