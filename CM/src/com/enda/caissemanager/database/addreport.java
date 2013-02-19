package com.enda.caissemanager.database;

import java.sql.Connection;
import java.sql.Statement;

import com.enda.caissemanager.connection.ConnectionBase;
import com.enda.caissemanager.connection.LienBase;

public class addreport {
	
	public String rpt_name="";
	public String rpt_label="";
	public byte rpt_param_num=0;
	public byte rpt_xls=0;
	
	public void insertreport (){
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
				  
			  
		      String Sqlstr="INSERT INTO cm_reports (REPORT_NAME,REPORT_LABEL,REPORT_PARAM_NUM,REPORT_XLS) VALUES('" + rpt_name +"','" + rpt_label + "'," + rpt_param_num + ","+ rpt_xls +")";
		      statement.executeUpdate(Sqlstr);
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
	}
	
//class end here-------------------------------------------------------------------------------------
}

