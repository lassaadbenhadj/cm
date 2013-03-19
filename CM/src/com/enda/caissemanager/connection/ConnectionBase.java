package com.enda.caissemanager.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import com.enda.caissemanager.connection.lirefichier;
public class ConnectionBase 
{
	private Connection cnx;
	// Methodes d'acces en lecture
	public Connection getCnx() 
	{
	  if (etablirConnexion()) 
	  {
	      return cnx;	
	  } 
	  else 
	  {
	   return null;
	   }
	}
	private boolean etablirConnexion() 
	{
	    boolean statusConnexion = false;
	    try {
	          Class.forName("com.mysql.jdbc.Driver").newInstance();
	        try {
	          lirefichier lr=new lirefichier();
	          String dburl="jdbc:mysql://" + lr.host + ":" + lr.port+"/"+lr.dbname+ "?user="+
	          lr.user+"&password=" + lr.password;	
	          //cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/mifos?user=root&password=mysql");
	          cnx = DriverManager.getConnection(dburl);
	          //conn.close();
	          statusConnexion = true;
	        } catch (SQLException ex) {
	          // la connection a la base de donn�es n'a pas pu etre �tabli
	          // voici les codes erreurs retourn�s 
	          System.out.println("SQLException: " + ex.getMessage()); 
	          System.out.println("SQLState: " + ex.getSQLState()); 
	          System.out.println("VendorError: " + ex.getErrorCode()); 
	          statusConnexion = false;
	        }
	    } catch (Exception ex) { 
	        // Le driver n'a pas pu �tre charg�
	        // v�rifier que la variable CLASSPATH est bien renseign�e
	        System.out.println("Echec de chargement du driver");
	        statusConnexion = false;
	    
	   }
	   return statusConnexion;
	}

}

/* db changes before commit efa05d56c77156ff04331b3a8a3cc75d40fe89cd:
	Table: cm_trace
	1/ ALTER TABLE `mifos`.`cm_trace` ADD COLUMN `solde_fixed` TINYINT(1) UNSIGNED DEFAULT 0 AFTER `caisse`;
	2/ UPDATE cm_trace set solde_fixed=0;
	3/ ALTER TABLE `mifos`.`cm_trace` ADD COLUMN `is_cancelled` TINYINT(1) UNSIGNED AFTER `solde_fixed`;
 	
 	Table: cm_reports
 	1/ ALTER TABLE `mifos`.`cm_reports` ADD COLUMN `REPORT_XLS` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 AFTER `REPORT_PARAM_NUM`;
	2/ ALTER TABLE `mifos`.`cm_reports` MODIFY COLUMN `REPORT_STATUS` INTEGER UNSIGNED NOT NULL DEFAULT 1;
	
 	db changes after commit efa05d56c77156ff04331b3a8a3cc75d40fe89cd:
	Table: cm_trans_types
	1/	Update cm_trans_types set TypeName ='Versement_A_La_Banque/A la poste' where  TypeName='Versement A la banque' and IDType=6;
	2/	Update cm_trans_types set PrevType = null where  PrevType=4;
		Update cm_trans_types set PrevType = 4 where  IDType in (6,8,17);
	Table: cm_caisses
	1/	ALTER TABLE `mifos`.`cm_caisses` ADD COLUMN `ISACTIVE` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 1 AFTER `DISPLAY_NAME`;
	Table: cm_banks
	1/ CREATE TABLE `mifos`.`cm_banks` (
			  `bank_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
			  `bank_name` VARCHAR(45) NOT NULL,
			  `is_active` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 1,
			  PRIMARY KEY (`bank_id`)
			)
			ENGINE = InnoDB;
	
	2/ 	insert into cm_banks (bank_id,bank_name) values (56001,'Poste');
		insert into cm_banks (bank_id,bank_name) values (51002,'BT');
		insert into cm_banks (bank_id,bank_name) values (51003,'UIB');
		insert into cm_banks (bank_id,bank_name) values (51005,'BH');
		insert into cm_banks (bank_id,bank_name) values (51006,'ATB');
		insert into cm_banks (bank_id,bank_name) values (51007,'BIAT');
		insert into cm_banks (bank_id,bank_name) values (51008,'ATTIJARI');
		insert into cm_banks (bank_id,bank_name) values (51009,'Amen bank');
		insert into cm_banks (bank_id,bank_name) values (51010,'UBCI');
		insert into cm_banks (bank_id,bank_name) values (51011,'STB');
		insert into cm_banks (bank_id,bank_name) values (51012,'BNA');
		insert into cm_banks (bank_id,bank_name) values (51013,'BTK');
		
	Table: cm_trace
	1/	ALTER TABLE `mifos`.`cm_trace` ADD INDEX `solde_fixed_idx`(`solde_fixed`)
		ALTER TABLE `mifos`.`cm_trace` ADD INDEX `TransType_idx`(`TransType`)

	*/
	