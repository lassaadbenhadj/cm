package com.enda.caissemanager.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.enda.caissemanager.connection.ConnectionBase;
import com.enda.caissemanager.connection.LienBase;

public class insertSolde {
	public double sAmount=0;
	public int sOpid=0;
	
	public  void fetchSolde(int caisseid) {
		
		Statement statement = null;
		Connection cnxal;
		ResultSet rs = null;
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
		      String Sqlstr="SELECT * FROM cm_trace where caisse=" +  caisseid + " AND solde_fixed=0 AND TransType=11 AND isfixed=0 AND datediff (curdate(),transdate)>0";
		      rs=statement.executeQuery(Sqlstr);
		      	if (rs.next()){
		      		sOpid=rs.getInt("IDOperation");
		      		sAmount=rs.getDouble("Amount");
		      	}
		      cnxal.close();
		      
			  }
			  catch(Exception e) {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
			  
			 
	}
	
	public void updateSoldeFixedField(int opid) {
		Statement statement = null;
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
				   
		      String Sqlstr="UPDATE cm_trace SET solde_fixed=1 WHERE IDOperation=" + opid ;
		      statement.executeUpdate(Sqlstr);
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
	}
	

}
