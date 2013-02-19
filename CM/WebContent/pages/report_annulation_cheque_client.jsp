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
      String Sqlstr="SELECT * FROM cm_trace WHERE (TransType=23 OR TransType=26) AND isfixed=0  AND is_cancelled=0" +
      				" AND caisse=" + thisCaisseSentInt + " AND Transdate='" + thisDateSent + "'" ;
  
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
		if(document.form1.cancelCheque.checked) {
			if(document.form1.reportCheque.checked) {
				alert("Il faut cocher une seule case pour: " + document.form1.chequeId.value);
				return false;
			}
		}

		if (document.form1.cancelCheque.checked || document.form1.reportCheque.checked){
			atLeastOneBoxIsChecked=true;
		}

	}
	else {
	
		for(var i=0; i < document.form1.cancelCheque.length; i++){
			if(document.form1.cancelCheque[i].checked) {
				if(document.form1.reportCheque[i].checked) {
					alert("Il faut cocher une seule case pour: " + document.form1.chequeId[i].value);
					return false;
				}
			}
		
			if (document.form1.cancelCheque[i].checked || document.form1.reportCheque[i].checked){
				atLeastOneBoxIsChecked=true;
			}
		}
	}
	if (!atLeastOneBoxIsChecked) {
		alert("Choisir au moins un client");
		return false;
	}

	return true
} 
</script>
<title>Report/Annulation chèque client</title>
</head>
<body>
<form name="form1" method="post" action="commit_report_annulation_cheque.jsp" onsubmit='return validate(this)' onReset="window.location='main.jsp';">
  <label></label>
  <label><br>
  </label>
  <table width="498" border="0" align="center">
    <tr>
      <th colspan="2" scope="col">Report/Annulation chèque client</th>
    </tr>
    <tr>
      <th width="289" scope="col">&nbsp;</th>
      <th width="199" scope="col">&nbsp;</th>
    </tr>
    <% 
  while (rs.next()) {
	    out.println("<tr><td width='60%'>");
	    out.println(rs.getString("Label") + " " + rs.getDouble("Amount"));
	    out.println("</td><td width='20%'>");
	    out.println("<input type='checkbox' name='cancelCheque' value='" + rs.getInt("IDOperation") + "'> Annuler");
	    out.println("</td><td width='20%'>");
	    // out.println("<input type='checkbox' name='reportCheque' value='" + rs.getInt("IDOperation") + "'> Reporter<br>");
	    out.println("<input type='checkbox' name='reportCheque' value='" + rs.getInt("IDOperation") + "'style='display:none;'><br>");
	    out.println("<input type='checkbox' name='chequeId' value='" + rs.getString("Label") + "' style='display:none;'>");
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