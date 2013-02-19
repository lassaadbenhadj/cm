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
