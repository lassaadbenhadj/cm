package com.enda.caissemanager.database;
import java.sql.*;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import com.enda.caissemanager.connection.ConnectionBase;
import com.enda.caissemanager.connection.LienBase;
public class communicatewithDb {
	public void insertIndb(int loan, int user, int ttype, String tref,double amount,String lbl, int caisseprm) {
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
			  
			  DateFormat dateEnterdFormat = new SimpleDateFormat("HH:mm:ss");
			  String dateentered=dateEnterdFormat.format(date);
			  
			  
		      String Sqlstr="INSERT INTO cm_trace (LoanID,TransDate,UserID,TransType,TransRef,Amount,DateEntered,TimeEntered,Label,caisse) VALUES(" + loan +",'" + transdate + "'," + user + "," + ttype + ",'" + tref + "'," + amount + ",'" + transdate + "','"+dateentered+"','" + lbl + "'," + caisseprm + ")";
		      statement.executeUpdate(Sqlstr);
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
	}
	
	
	
	
	public int getcaisseID (int persoid ) {
		int caisse=0;
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
				   
			  			  		  
		      String Sqlstr="SELECT * FROM cm_caisse_users WHERE LAST_ACTIVE=1 AND DATETIME_START in (select max(DATETIME_START) as D FROM cm_caisse_users " +
		      				" WHERE USER_ID=" + persoid + ") AND USER_ID=" + persoid ;
		      rs=statement.executeQuery(Sqlstr);
		      rs.next();
		      caisse= rs.getInt("CAISSE_ID");
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
			  return caisse;
	}
	
	
	
	public Double getSoldeTheo (int caisseid, String TransDate) {
		
		Double solde=0.000;
		Statement statement = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
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
				   
			  			  		  
		      String Sqlstr=" select SUM(if(ACCOUNT_ACTION_ID=10 OR ACCOUNT_ACTION_ID=19,-AMOUNT,AMOUNT)) as SUMENTRY FROM account_trxn JOIN (select * from cm_caisse_users WHERE caisse_id="+ caisseid + " AND DATE_ID='" + TransDate + "') as D" +
		    	  		" ON (account_trxn.PERSONNEL_ID=D.USER_ID AND account_trxn.CREATED_DATE>=D.DATETIME_START" +
		    	  		" AND account_trxn.CREATED_DATE<=D.DATETIME_END) WHERE action_date='" + TransDate + "' AND " +
		    	  		"(account_action_id<>15)";
		      
		      rs=statement.executeQuery(Sqlstr);
		      if (rs.next()) {
		      solde= rs.getDouble("SUMENTRY");
		      System.out.println(solde);
		      }
		      Sqlstr="select SUM(if(account_trxn.ACCOUNT_ACTION_ID=10 OR account_trxn.ACCOUNT_ACTION_ID=19,-aadjustments.amount,aadjustments.amount)) as SUMADJ FROM account_trxn  JOIN (select * from cm_caisse_users WHERE caisse_id="+ caisseid + " AND DATE_ID='" + TransDate + "') as D" +
		      " ON (account_trxn.PERSONNEL_ID=D.USER_ID AND account_trxn.CREATED_DATE>=D.DATETIME_START AND account_trxn.CREATED_DATE<=D.DATETIME_END)" +
		      " INNER JOIN account_trxn aadjustments ON aadjustments.RELATED_TRXN_ID=account_trxn.ACCOUNT_TRXN_ID WHERE account_trxn.action_date='" + TransDate + "' " +
		      " and aadjustments.personnel_id not in (select user_id from cm_caisse_users WHERE caisse_id="+ caisseid + " AND DATE_ID='" + TransDate + "') AND (account_trxn.account_action_id<>15)";	
		      
		      rs2=statement.executeQuery(Sqlstr);
		      if (rs2.next()) {
		      solde=solde+rs2.getDouble("SUMADJ");
		      System.out.println(solde);
		      }
		      		      
		      Sqlstr="select SUM(AMOUNT*SIGN) as SUMCTRACE FROM cm_trace JOIN cm_trans_types ON " +
		      " cm_trans_types.IDType=cm_trace.transtype where caisse=" + caisseid + " AND " +
		      " Transdate='" + TransDate + "'" ;
		      
		      rs3=statement.executeQuery(Sqlstr);
		      if (rs3.next()) {
		      solde=solde+rs3.getDouble("SUMCTRACE");
		      System.out.println(solde);
		      }	      
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
			
			  
			  
			  return solde;
			  
	}

	public void dotheadjustment(int loan, int user, int ttype, String tref,double amount,String lbl, int caisseprm, int FixedTransID) {
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
				   
			  System.out.println(loan);
			  
			  DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			  Date date = new Date();
			  String transdate=dateFormat.format(date);
			  
			  DateFormat dateEnterdFormat = new SimpleDateFormat("HH:mm:ss");
			  String dateentered=dateEnterdFormat.format(date);
			  
			  
		      String Sqlstr="INSERT INTO cm_trace (LoanID,TransDate,UserID,TransType,TransRef,Amount,DateEntered,TimeEntered,isfixed,FixedTransID,Label,caisse) VALUES(" + loan +",'" + transdate + "'," + user + "," + ttype + ",'" + tref + "'," + amount + ",'" + transdate + "','"+ dateentered +"',1," + FixedTransID + ",'" + lbl + "'," + caisseprm + ")";
		      statement.executeUpdate(Sqlstr);
		      
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
			  
			  
		

			try
					  {
						   
					  
					  
				      String Sqlstr="UPDATE cm_trace set isfixed=1 where IDOperation=" +  FixedTransID ;
				      statement.executeUpdate(Sqlstr);
				      cnxal.close();
				      
					  }
					  catch(Exception e)
					  {
						  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
					   }	
	}
	
	
	public int getRoleID (int persoid ) {
		int role=0;
		Statement statement = null;
		ResultSet rs = null;
		Connection cnxal;
		ConnectionBase TestCnxAl = new ConnectionBase();
		cnxal= TestCnxAl.getCnx();
		role=this.getmaxrole();
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
				   	  
		      String Sqlstr="SELECT * FROM PERSONNEL_ROLE JOIN cm_roles on PERSONNEL_ROLE.ROLE_ID=cm_roles.MIFOS_ROLE_ID WHERE PERSONNEL_ID =" + persoid ;
		      rs=statement.executeQuery(Sqlstr);
		      // loop to get the minimum role
		      while (rs.next()){
		    	 if (rs.getInt("CM_ROLE_ID")<role) {
		    		   role= rs.getInt("CM_ROLE_ID");
		    	  }
		      }
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
			  return role;
	}
	
	public Integer getmaxrole() {
		int maxrole=1000;
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
				   	  
		      String Sqlstr="SELECT max(CM_ROLE_ID) as MROLEID FROM cm_roles" ;
		      rs=statement.executeQuery(Sqlstr);
		      if (rs.next()){
		    	  maxrole=rs.getInt("MROLEID");
		      }  
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
			  
		return maxrole;
		
	}
	public int getaccountID (String gaccountid ) {
		int accountid=0;
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
				   
			  			  		  
		      String Sqlstr="SELECT * FROM account WHERE ACCOUNT_TYPE_ID=1 AND GLOBAL_ACCOUNT_NUM ='" + gaccountid + "'";
		      rs=statement.executeQuery(Sqlstr);
		      rs.next();
		      accountid= rs.getInt("ACCOUNT_ID");
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
			  return accountid;
	}
	

	public void logIndb(int user) {
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
			  
		      String Sqlstr="INSERT INTO cm_log (USER_ID,CREATED_DATE,OPERATION_ID) VALUES(" + user +",'" + transdate + "',1)";
		      statement.executeUpdate(Sqlstr);
		      cnxal.close();
		      
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation"+ e.getMessage()); 
			   }
	}	
	
	
	
}
