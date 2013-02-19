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
String operationidStr = request.getParameter("opidsent");
Integer operationid = Integer.parseInt(operationidStr);
if(userid==null) {
	String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
}
String thisDateSent=request.getParameter("datetoSend_2");
String thisCaisseSent=request.getParameter("caissesent_2");
%>
<%
DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
String todayDate=dateFormat.format(date);

Statement statement = null;
ResultSet rs = null;
Connection cnx;
ConnectionBase TestCnx = new ConnectionBase();
cnx= TestCnx.getCnx();
Integer caisseidi=(Integer)session.getAttribute("caisseid");
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
      String Sqlstr="SELECT * FROM cm_trace join cm_trans_Types on cm_trace.TransType=cm_trans_Types.IDType" +
      				" WHERE IDOperation=" + operationid ;
      rs=statement.executeQuery(Sqlstr);
      rs.next();
	  }
	  catch(Exception e)
	  {
		   out.println("<font color=red>Erreur Dans l'operation De recherche</font>"); 
	   }
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Annulation-Etape 2</title>
</head>
<body>
<form name="form1" method="post" action="commit_annulation.jsp" onReset="window.location='main.jsp';">
  <label></label>
  <label><br>
  </label>
  <table width="498" border="0" align="center">
    <tr>
      <th colspan="2" scope="col">Annulation</th>
    </tr>
    <tr>
      <th width="289" scope="col">&nbsp;</th>
      <th width="199" scope="col">&nbsp;</th>
    </tr>
    <tr>
      <th colspan="2" scope="col"><div align="left">Etes vous s&ucirc;re de vouloir annuler la transaction :<% out.println(rs.getInt("IDOperation"));%> </div></th>
    	<td><input type="hidden" name="idopsent" value=<% out.println(rs.getInt("IDOperation"));%>></td>
    </tr>
    <tr>
      <td><div align="left">Type</div></td>
      <td><% out.println(rs.getString("TypeName"));%></td>
      <td><input type="hidden" name="typesent" value=<% out.println(rs.getInt("TransType"));%>></td>
    </tr>
    <tr>
      <td><div align="left">N° de pièce</div></td>
      <td><% out.println(rs.getString("TransRef"));%></td>
      <td><input type="hidden" name="numpiecesent" value=<% out.println(rs.getString("TransRef"));%>></td>
    </tr>
    <tr>
      <td><div align="left">Montant</div></td>
      <td><% out.println(rs.getDouble("Amount"));%></td>
      <td><input type="hidden" name="amountsent" value=<% out.println(rs.getDouble("Amount"));%>></td>
    </tr>
    <tr>
      <td><div align="left">Compte bancaire/Destination</div></td>
      <td><% out.println(rs.getString("Label"));%></td>
      <td><input type="hidden" name="labelsent" value=<% out.println(rs.getString("label"));%>></td>
    </tr>
    <tr>
       <td><input type="hidden" name="datetoSend_2" value=<% out.println(thisDateSent);%>></td>
       <td><input type="hidden" name="caissesent_2" value=<% out.println(thisCaisseSent);%>></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
            
              
            <div align="center">
              <input type="submit" name="Submit" value="Valider">
            </div></td>
      <td><input type="reset" name="Submit2" value="Annuler"></td>
    </tr>
  </table>
  <label><br>
  </label>
  <label></label>
</form>
<%cnx.close(); %>
</body>
</html>