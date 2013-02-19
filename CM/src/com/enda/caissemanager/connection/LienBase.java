package com.enda.caissemanager.connection;

import java.sql.Connection;
import java.sql.Statement;
public class LienBase {
	private Statement lien = null;
	
	// Methodes d'acces en lecture
	public Statement getLien(Connection cnx) {
	   if (construireStatement(cnx)) {
		return lien;
	   } else {
		return null;
	   }
	}
	// Methodes invisibles
	private boolean construireStatement (Connection cnx) {
	  boolean statusStatement = false;
	  try {
	           lien=cnx.createStatement();
	           statusStatement = true ;
	           } catch ( Exception e ) {
	           statusStatement = false;
	           System.out.println(e);
	            }
	          return statusStatement;	
	       }
}
