package com.enda.caissemanager.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.enda.caissemanager.connection.ConnectionBase;
import com.enda.caissemanager.connection.LienBase;

public class getreportdata {
public String reportname;
public String reportlabel;
public Integer reportparam;
	public getreportdata(Integer rpt_id) {
		
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
		      String Sqlstr="SELECT * FROM cm_reports where REPORT_ID=" +  rpt_id ;
		      rs=statement.executeQuery(Sqlstr);
		      	if (rs.next()){
		      		this.reportname=rs.getString("REPORT_NAME");
		      		this.reportlabel=rs.getString("REPORT_LABEL");
		      		this.reportparam=rs.getInt("REPORT_PARAM_NUM");
		      	}
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
		
			 
	}
}
