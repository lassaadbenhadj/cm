package com.enda.caissemanager.transfer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.enda.caissemanager.connection.ConnectionBase;
import com.enda.caissemanager.connection.LienBase;

public class transferfromaccount_trxn {
	
	public void fillcm_trace (Date refdate) {
		Statement statement = null;
		Statement statement2 = null;
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
		
		LienBase TestLienA2 = new LienBase();
		statement2 = TestLienA2.getLien(cnxal);
		if (statement == null) {
			System.out.println("Communication impossible : "+ statement );
			  } 
			   try
			  {
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String transdate=dateFormat.format(refdate);
				String Sqlstr="SELECT account_trxn.ACCOUNT_TRXN_ID as OPID, account_trxn.ACCOUNT_ID, account_trxn.ACCOUNT_TRXN_ID, account_trxn.PERSONNEL_ID, " + 
				"Sum(account_trxn.AMOUNT) AS SommeDeAmount, account_trxn.ACTION_DATE, account_trxn.CREATED_DATE, " +
				"account_trxn.CUSTOMER_ID,account_trxn.RELATED_TRXN_ID , cm_trans_types.TypeName , customer.DISPLAY_NAME, personnel.DISPLAY_NAME, " +
				"(select ACCOUNT_TRXN_ID from account_trxn axt where axt.RELATED_TRXN_ID=account_trxn.ACCOUNT_TRXN_ID) as FIXEDORNOT, " +
				"account_trxn.ACCOUNT_ACTION_ID, 1 as Querynum, account.office_id, caisse_id " +
				"FROM account_trxn JOIN (select * from cm_caisse_users ) as D " +
				"ON (account_trxn.PERSONNEL_ID=D.USER_ID AND account_trxn.CREATED_DATE>=D.DATETIME_START " +
				"AND account_trxn.CREATED_DATE<=D.DATETIME_END) JOIN cm_trans_types ON account_trxn.ACCOUNT_ACTION_ID=cm_trans_types.IDType " +
				"JOIN customer ON account_trxn.CUSTOMER_ID = customer.CUSTOMER_ID " +
				"JOIN personnel ON account_trxn.PERSONNEL_ID = personnel.PERSONNEL_ID " +
				"JOIN account ON account_trxn.account_id = account.account_id " +
				"JOIN office ON account.office_id=office.office_id " +
				"WHERE action_date='" + transdate + "' AND account_action_id<>15 AND account_trxn.RELATED_TRXN_ID is null " +
				"GROUP BY cm_trans_types.TypeName, account_trxn.ACCOUNT_ID, account_trxn.PERSONNEL_ID, " +
				"account_trxn.ACTION_DATE, account_trxn.CREATED_DATE, account_trxn.CUSTOMER_ID " +
				"UNION " +
				"SELECT aadjustments.ACCOUNT_TRXN_ID as OPID, aadjustments.ACCOUNT_ID, aadjustments.ACCOUNT_TRXN_ID, aadjustments.PERSONNEL_ID, " +
				"(aadjustments.AMOUNT) AS SommeDeAmount, aadjustments.ACTION_DATE , aadjustments.CREATED_DATE, " +
				"aadjustments.CUSTOMER_ID, aadjustments.RELATED_TRXN_ID, cm_trans_types.TypeName, customer.DISPLAY_NAME, personnel.DISPLAY_NAME, 1 as FIXEDORNOT, " +
				"aadjustments.ACCOUNT_ACTION_ID,2 as Querynum, account.office_id , caisse_id " +
				"FROM account_trxn JOIN (select * from cm_caisse_users) as D " +
				"ON (account_trxn.PERSONNEL_ID=D.USER_ID AND account_trxn.CREATED_DATE>=D.DATETIME_START AND account_trxn.CREATED_DATE<=D.DATETIME_END) " +
				"INNER JOIN account_trxn aadjustments ON aadjustments.RELATED_TRXN_ID=account_trxn.ACCOUNT_TRXN_ID " +
				"JOIN cm_trans_types ON aadjustments.ACCOUNT_ACTION_ID=cm_trans_types.IDType " +
				"JOIN customer ON aadjustments.CUSTOMER_ID = customer.CUSTOMER_ID " +
				"JOIN personnel ON aadjustments.PERSONNEL_ID = personnel.PERSONNEL_ID " +
				"JOIN account ON account_trxn.account_id = account.account_id " +
				"JOIN office ON account.office_id=office.office_id " +
				"WHERE account_trxn.action_date='" + transdate + "' " +
				"AND (account_trxn.account_action_id<>15) " +
				"GROUP BY cm_trans_types.TypeName, aadjustments.ACCOUNT_ID, aadjustments.PERSONNEL_ID, " +
				"aadjustments.ACTION_DATE, aadjustments.CREATED_DATE, aadjustments.CUSTOMER_ID " ;
				
				rs=statement.executeQuery(Sqlstr);
				
				while (rs.next())  {
					
					DateFormat dateEnterdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String dateentered=dateEnterdFormat.format(rs.getTimestamp("CREATED_DATE"));
					
					DateFormat timeEnterdFormat = new SimpleDateFormat("HH:mm:ss");
					Date date = new Date();
					String timeentered=timeEnterdFormat.format(date);
					// prepare isfixed field----------------------------------------------------------------
					Integer isfixed=0;  
					if (rs.getInt("Querynum")==2) {
						if (rs.getInt("FIXEDORNOT")==1){
							isfixed=1;
						}
					}
					else  {
						if(rs.getObject("FIXEDORNOT") != null || rs.getObject("RELATED_TRXN_ID") != null){
							isfixed=1;
						}
					}
					
					//-----------------------------------------------------------------------------------------
				    String SqlstrIns="INSERT INTO cm_trace (LoanID,TransDate,UserID,TransType,TransRef,Amount,isfixed,DateEntered," +
				    "TimeEntered,CUSTOMER_ID,mifosBranch,mifosTransID,mifosRELATED_TRXN_ID,EnteredByTransfer,Label,caisse) VALUES(" + rs.getInt("ACCOUNT_ID") + ",'" + transdate + "'," + rs.getInt("PERSONNEL_ID") + "," + 
				    rs.getInt("ACCOUNT_ACTION_ID") + ",'_'," + rs.getDouble("SommeDeAmount") + "," + isfixed + ",'" + dateentered + "','" + timeentered + "'," + 
				    rs.getInt("CUSTOMER_ID") + "," + rs.getInt("office_id") + "," + rs.getInt("ACCOUNT_TRXN_ID") + "," + rs.getInt("RELATED_TRXN_ID") + ",1,'_'," + rs.getInt("caisse_id") + ")";
				    statement2.executeUpdate(SqlstrIns);
				}
			  
		      
		      
		      cnxal.close();
			  }
			  catch(Exception e)
			  {
				  System.out.println("Erreur Dans l'operation: "+ e.getMessage()); 
			   }
			  
	}
	
}
