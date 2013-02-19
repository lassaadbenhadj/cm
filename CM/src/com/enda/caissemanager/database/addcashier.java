package com.enda.caissemanager.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.enda.caissemanager.connection.ConnectionBase;
import com.enda.caissemanager.connection.LienBase;

public class addcashier {
	public void insertcashier(int cashier, int caisse, int cashier_maker, String HStart, String MStart, String HEnd, String MEnd, Integer UI) {
		Statement statement = null;
		Connection cnxal;
		ConnectionBase TestCnxAl = new ConnectionBase();
		cnxal= TestCnxAl.getCnx();
		if (UI==1) {
			Integer traitMStart=Integer.parseInt(MStart);
			Integer traitHStart=Integer.parseInt(HStart);
			traitMStart=traitMStart-1;
			if (traitMStart==-1) {
				traitMStart=59;
				traitHStart=traitHStart-1;
				if (traitHStart==-1) {
					traitHStart=23;
				}
			}
			String MStartT=Integer.toString(traitMStart);
			String HStartT=Integer.toString(traitHStart);
			this.updateendtime(cashier, HStartT, MStartT);
		}
			
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
				   
			  
			  DateFormat datestartFormat = new SimpleDateFormat("yyyy-MM-dd " + HStart + ":" + MStart +":00");
			  Date date = new Date();
			  String date_start=datestartFormat.format(date);
			  
			  DateFormat dateendFormat = new SimpleDateFormat("yyyy-MM-dd " + HEnd + ":" + MEnd +":59");
			  String date_end=dateendFormat.format(date);
			  
			  DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			  String date_id=dateFormat.format(date);
			  
		      String Sqlstr="INSERT INTO cm_caisse_users (CAISSE_ID,USER_ID,DATE_ID,DATETIME_START,DATETIME_END,CREATED_BY,CREATED_DATE) VALUES(" + caisse +"," + cashier + ",'" + date_id + "','" + date_start + "','" + date_end + "'," + cashier_maker + ",'" + date_id + "')";
		      statement.executeUpdate(Sqlstr);
		      cnxal.close();
		      //check and move tansactions already entered in cm_trace
		      this.updatecashiertransIncmtrace(cashier, caisse, HStart + ":" + MStart +":00");
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
	}
	
	
	
	
	
	public void updateendtime(Integer wcash,String HEnd, String MEnd) {
		Statement statement = null;
		Connection cnxal;
		Integer wID;
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
			  DateFormat dateendFormat = new SimpleDateFormat("yyyy-MM-dd " + HEnd + ":" + MEnd +":59");
			  DateFormat shortdateformat= new SimpleDateFormat("yyyy-MM-dd");
			  Date date = new Date();
			  String date_end=dateendFormat.format(date);
			  String date_short=shortdateformat.format(date);
			  wID=this.getIDOpcashier(wcash,date_short);
		      String Sqlstr="UPDATE cm_caisse_users SET LAST_ACTIVE=0 , DATETIME_END='" + date_end + "' WHERE ID=" + wID ;
		      statement.executeUpdate(Sqlstr);
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
		
	}
	
	public Integer getIDOpcashier(Integer cashier,String dateop) {
		Statement statement = null;
		Connection cnxal;
		ResultSet rs = null;
		Integer rowid=0;
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
		      String Sqlstr="SELECT * FROM cm_caisse_users where LAST_ACTIVE=1 AND DATE_ID='" + dateop + "' AND USER_ID=" + cashier;
		      rs=statement.executeQuery(Sqlstr);
		      	if (rs.next()){
		      		rowid= rs.getInt("ID");
		      	}
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
		
		return rowid;
	}
	
	public void updatecashier(Integer cashier,Integer newcaisse) {
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
			
		      String Sqlstr="UPDATE cm_caisse_users SET CAISSE_ID=" + newcaisse + " WHERE LAST_ACTIVE=1 AND USER_ID=" + cashier ;
		      statement.executeUpdate(Sqlstr);
		      cnxal.close();
		      //check and move tansactions already entered in cm_trace
		      this.updatecashiertransIncmtrace(cashier, newcaisse, "00:00:00");
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
		
	}
	
	
	public void updatecashiertransIncmtrace(Integer cashier1,Integer newcaisse1, String timeOp) {
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
			
		      String Sqlstr="UPDATE cm_trace SET caisse=" + newcaisse1 + " WHERE TransDate=curdate() AND userid=" + cashier1 + " AND TimeEntered>='" + timeOp + "'" ;
		      statement.executeUpdate(Sqlstr);
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
		
	}
}
