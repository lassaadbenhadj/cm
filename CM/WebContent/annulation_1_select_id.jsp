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
if(userid==null) {
	String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
}
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
      String Sqlstr="SELECT IdOperation FROM cm_trace WHERE caisse=" + caisseidi + " AND Date(DateEntered)='" + todayDate + "' AND isfixed=0";
      rs=statement.executeQuery(Sqlstr);
	  }
	  catch(Exception e)
	  {
		   out.println("<font color=red>Erreur Dans l'operation De recherche</font>"); 
	   }
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Annulation-Etape 1</title>
</head>
<body>
<form name="form1" method="post" action="annulation_2_view_data.jsp" onReset="window.location='main.jsp';">
  <label></label>
  <label><br>
  </label>
  <table width="372" border="0" align="center">
    <tr>
      <th colspan="2" scope="col">Annulation</th>
    </tr>
    <tr>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr>
      <td><div align="left">Identifiant transaction </div></td>
      <td><div align="left">
        <select name="opidsent">
          <%while (rs.next()) {
			out.println("<option value='"+ rs.getInt("IDOperation") + "' selected>c" + rs.getInt("IDOperation") + "</option>");
          } %>
        </select>
      </div></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
              
              
            <div align="center"> <input type="submit" name="Submit" value="Aperçu"> </div></td>
      <td><input type="reset" name="Submit2" value="Retour"></td>
    </tr>
  </table>
  <label><br>
  </label>
  <label></label>
</form>

<%cnx.close(); %>
</body>
</html>