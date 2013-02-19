package com.enda.caissemanager.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.enda.caissemanager.connection.ConnectionBase;
import com.enda.caissemanager.connection.LienBase;

public class dealWithChequeClient {

	private Date TransDateVar;
	private String TransRefVar;
	private double AmountVar;
	private Integer caisseVar;
	private int customerIdVar; 
	private String lblVar;
    
	public void insertChequeClientIndb(int loan, int user, int ttype, String tref,double amount,String lbl, int caisseprm, String datePrm, int custid) {
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
	
			  DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			  Date date = new Date();
			  String transdate=dateFormat.format(date);
				   
			  transdate = datePrm;
			  //if (datePrm !="1900-01-01"){
			  //	 transdate = datePrm;
			  //}
			  
			  DateFormat dateEnterdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			  String dateentered=dateEnterdFormat.format(date);
			  
			  DateFormat timeEnterdFormat = new SimpleDateFormat("HH:mm:ss");
			  String timeentered=timeEnterdFormat.format(date);
			  
			  
		      String Sqlstr="INSERT INTO cm_trace (LoanID,TransDate,UserID,TransType,TransRef,Amount,DateEntered,TimeEntered,Label,caisse,is_cancelled,CUSTOMER_ID) VALUES(" + loan +",'" + transdate + "'," + user + "," + ttype + ",'" + tref + "'," + amount + ",'" + dateentered + "','"+timeentered+"','" + lbl + "'," + caisseprm + ",0," + custid + ")";
		      statement.executeUpdate(Sqlstr);
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
	}
	
	
	public void insertAnnulationOrReportChequeClientIndb(int ttype, int user) {
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
	
			  DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			  Date date = new Date();
			  String transdate=dateFormat.format(TransDateVar);
				   
			 
			  
			  DateFormat dateEnterdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			  String dateentered=dateEnterdFormat.format(date);
			  
			  DateFormat timeEnterdFormat = new SimpleDateFormat("HH:mm:ss");
			  String timeentered=timeEnterdFormat.format(date);
			  
			  
		      String Sqlstr="INSERT INTO cm_trace (LoanID,TransDate,UserID,TransType,TransRef,Amount,DateEntered,TimeEntered,Label,caisse,CUSTOMER_ID) VALUES(0,'" + transdate + "'," + user + "," + ttype + ",'" + TransRefVar + "'," + AmountVar + ",'" + dateentered + "','" + timeentered + "','" + lblVar + "'," + caisseVar + "," + customerIdVar + ")";
		      statement.executeUpdate(Sqlstr);																															
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
	}
	
	public void processDataReceivedFromPresentationLayer(String idOp[], int pcct,int userId){
		for (int i = 0; i < idOp.length; i++) {
	         int inIdOp = Integer.parseInt(idOp[i]);
	         retrieveDataForCaisseId(inIdOp);
	         insertAnnulationOrReportChequeClientIndb(pcct,userId);
	         updateChequeClientRecord(inIdOp);
	      }
	}
	
	private void retrieveDataForCaisseId (int idCaisse ) {
		

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
			  
		      String Sqlstr="SELECT * FROM cm_trace WHERE Idoperation=" + idCaisse;
		      rs=statement.executeQuery(Sqlstr);
		      rs.next();
		      TransDateVar=rs.getDate("TransDate");
		      TransRefVar=rs.getString("TransRef");
		      AmountVar=rs.getDouble("Amount");
		      caisseVar=rs.getInt("caisse");
		      customerIdVar=rs.getInt("CUSTOMER_ID"); 
		  	  lblVar=rs.getString("Label"); ;
		      
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
	}
	
	public int getCustomerId(String cin) {
		int customerid=0;
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
				   
			  			  		  
		      String Sqlstr="SELECT * FROM customer WHERE government_id ='" + cin + "'";
		      rs=statement.executeQuery(Sqlstr);
		      if (rs.next()) {;
		      	customerid= rs.getInt("CUSTOMER_ID");
		      }
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
			  return customerid;
	}
	
	
	private void updateChequeClientRecord(int idcaisse) {
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

			   try {
			  
			  
		      String Sqlstr="UPDATE cm_trace SET is_cancelled=1 where Idoperation=" + idcaisse;
		      statement.executeUpdate(Sqlstr);																															
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
	}
}
