package com.enda.caissemanager.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.enda.caissemanager.connection.ConnectionBase;
import com.enda.caissemanager.connection.LienBase;

public class datapresentation {

	public String getpersoname(Integer persoid) {
		String return_value="";
		Statement statement = null;
		ResultSet rs = null;
		Connection cnxal;
		ConnectionBase TestCnxAl = new ConnectionBase();
		cnxal= TestCnxAl.getCnx();
		
		if (cnxal == null) 
		{
		    System.out.println("Connexion impossible : " + cnxal );
		} 
		
		LienBase TestLienAl = new LienBase();
		statement = TestLienAl.getLien(cnxal);
		if (statement == null) {
			System.out.println("Communication impossible : "+ statement );
		} 

		try
		{
		String Sqlstr="SELECT * FROM personnel where personnel_id=" + persoid ;
		 rs=statement.executeQuery(Sqlstr);
		      if (rs.next()){
		    	  return_value=rs.getString("DISPLAY_NAME");
		      }  
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
			  return return_value;
			  
	}
	
	public String getrolename(Integer rid) {
		String return_value="";
		Statement statement = null;
		ResultSet rs = null;
		Connection cnxal;
		ConnectionBase TestCnxAl = new ConnectionBase();
		cnxal= TestCnxAl.getCnx();
		
		if (cnxal == null) 
		{
		    System.out.println("Connexion impossible : " + cnxal );
		} 
		
		LienBase TestLienAl = new LienBase();
		statement = TestLienAl.getLien(cnxal);
		if (statement == null) {
			System.out.println("Communication impossible : "+ statement );
		} 

		try
		{
		String Sqlstr="SELECT * FROM cm_roles where CM_ROLE_ID=" + rid ;
		 rs=statement.executeQuery(Sqlstr);
		      if (rs.next()){
		    	  return_value=rs.getString("DISPLAY_NAME");
		      }  
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
			  return return_value;
			  
	}
	
	public String getcaissename(Integer persoid) {
		String return_value="";
		Statement statement = null;
		ResultSet rs = null;
		Connection cnxal;
		ConnectionBase TestCnxAl = new ConnectionBase();
		cnxal= TestCnxAl.getCnx();
		
		if (cnxal == null) 
		{
		    System.out.println("Connexion impossible : " + cnxal );
		} 
		
		LienBase TestLienAl = new LienBase();
		statement = TestLienAl.getLien(cnxal);
		if (statement == null) {
			System.out.println("Communication impossible : "+ statement );
		} 

		try
		{
		String Sqlstr=" SELECT * FROM cm_caisses JOIN cm_caisse_users ON cm_caisses.ID=cm_caisse_users.CAISSE_ID " +
		" where LAST_ACTIVE=1 AND user_id=" + persoid ;
		 rs=statement.executeQuery(Sqlstr);
		      if (rs.next()){
		    	  return_value=rs.getString("DISPLAY_NAME");
		      }  
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
			  return return_value;
			  
	}
}
