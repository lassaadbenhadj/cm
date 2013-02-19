<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.enda.caissemanager.connection.ConnectionBase"%>
<%@ page import="com.enda.caissemanager.connection.LienBase"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% Integer userid=(Integer) session.getAttribute("username");
Integer caisseidi=(Integer)session.getAttribute("caisseid");

if(userid==null) {
	String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
}
String thisDateSent=request.getParameter("datetoSend");
String thisCaisseSent=request.getParameter("caissesent");

Integer thisCaisseSentInt=caisseidi;
if (thisCaisseSentInt==0) {
	thisCaisseSentInt=Integer.parseInt(thisCaisseSent);
}
String global_account_num=request.getParameter("codetoSend");
%>
<%
/*DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
String todayDate=dateFormat.format(date);*/

Statement statement = null;
ResultSet rs = null;
Connection cnx;
ConnectionBase TestCnx = new ConnectionBase();
cnx= TestCnx.getCnx();

if (cnx == null) 
{
    out.println("<font color=red>Connexion impossible : " + cnx + "</font>");
} 

LienBase TestLien = new LienBase();
statement = TestLien.getLien(cnx);
if (statement == null) {
	    out.println("<font color=red>Communication impossible : "+ statement + "</font>");
	  } 

	   try
	  {
      String Sqlstr="SELECT GLOBAL_ACCOUNT_NUM,account_payment.amount,account_payment.payment_id, payment_date,receipt_number,payment_type_id  FROM account_payment JOIN account_trxn USING(payment_id) JOIN account" +
      				" WHERE GLOBAL_ACCOUNT_NUM='" + global_account_num + "' AND account_action_id=1";
  
      rs=statement.executeQuery(Sqlstr);
	  }
	  catch(Exception e)
	  {
		   out.println("<font color=red>Erreur Dans l'operation De recherche</font>"); 
	   }
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
function validate(form) {
	var atLeastOneBoxIsChecked=false;
	if (document.form1.cancelCheque.length==undefined) {
		//alert("length undefined");
		
		if (document.form1.cancelCheque.checked){
			atLeastOneBoxIsChecked=true;
		}

	}
	else {
	
		for(var i=0; i < document.form1.cancelCheque.length; i++){
		
			if (document.form1.cancelCheque[i].checked){
				atLeastOneBoxIsChecked=true;
			}
		}
	}
	if (!atLeastOneBoxIsChecked) {
		alert("Choisir au moins une transaction!");
		return false;
	}

	return true
} 
</script>
<title>Liste des transactions</title>
</head>
<body>
<form name="form1" method="post" action="commit_validation_remboursement.jsp" onsubmit='return validate(this)' onReset="window.location='main.jsp';">
  <label></label>
  <label><br>
  </label>
  <table width="498" border="0" align="center">
    <tr>
      <th colspan="2" scope="col">Liste des transactions</th>
    </tr>
    <tr>
      <th width="289" scope="col">&nbsp;</th>
      <th width="199" scope="col">&nbsp;</th>
    </tr>
    <% 
  while (rs.next()) {
	    out.println("<tr><td width='60%'>");
	    out.println(rs.getString("GLOBAL_ACCOUNT_NUM") + " | " + rs.getDouble("Amount") + " | " + rs.getDate("PAYMENT_DATE")+ " | " + rs.getString("receipt_number"));
	    out.println("</td><td width='40%'>");
	    out.println("<input type='checkbox' name='cancelCheque' value='" + rs.getInt("PAYMENT_ID") + "'> Sélectionner transaction");
	    out.println("</td></tr>");
    }
    %>
    
    <tr>
       <td><input type="hidden" name="datetoSend_2" value=<% out.println(thisDateSent);%>></td>
       <td><input type="hidden" name="caissesent_2" value=<% out.println(thisCaisseSent);%>></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
            
              
          <div align="center">
          <input type="submit" name="Submit" value="Valider"></div></td>
      <td><input type="reset" name="Submit2" value="Annuler"></td>
    </tr>
  </table>
  <label><br>
  </label>
</form>
<%cnx.close(); %>
</body>
</html>