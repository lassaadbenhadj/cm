package com.enda.caissemanager.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;


import com.enda.caissemanager.connection.ConnectionBase;
import com.enda.caissemanager.connection.LienBase;

public class addcaisse {

	public Integer getmaxCaisseID () {
		Statement statement = null;
		Connection cnxal;
		ResultSet rs = null;
		Integer newid=0;
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
		      String Sqlstr="SELECT (Max(ID)) as MXID FROM cm_caisses";
		      rs=statement.executeQuery(Sqlstr);
		      	if (rs.next()){
		      		newid= rs.getInt("MXID")+1;
		      	}
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
		
			  return newid;
	}
	
	
	public void insertcaisse (String cname){
		Statement statement = null;
		Connection cnxal;
		Integer cID;
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
				   
			  cID=this.getmaxCaisseID();
		      String Sqlstr="INSERT INTO cm_caisses (ID,DISPLAY_NAME) VALUES(" + cID +",'" + cname + "')";
		      statement.executeUpdate(Sqlstr);
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
	}
	
//class ends here-------------------------------------------------------------------------------------
}
