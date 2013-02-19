<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.DateFormat"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page import ="java.sql.*"%>
<%@ page import="com.enda.caissemanager.connection.ConnectionBase"%>
<%@ page import="com.enda.caissemanager.connection.LienBase"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rapport</title>
</head>
<% Integer userid=(Integer) session.getAttribute("username");
if(userid==null) {
	String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
}
%>
<body>
<%DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
String transdate=dateFormat.format(date); %>
<%
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
      String Sqlstr="SELECT * FROM cm_reports WHERE REPORT_STATUS=1";
      rs=statement.executeQuery(Sqlstr);
	  }
	  catch(Exception e)
	  {
		   out.println("<font color=red>Erreur Dans l'operation De recherche</font>"); 
	   }
%>

<form id="form1" name="form1" method="post" action="check_caisse.jsp" onReset="window.location='main.jsp';">
  <p>&nbsp;</p>
  <table width="437" border="1" align="center">
    <tr>
      <th width="200" scope="col">Date rapport&nbsp;&nbsp;</th>
      <th width="388" scope="col">aaaa-mm-jj &nbsp;&nbsp;<input type="text" name="datetoSend" value=<%=transdate%>></th>
    </tr>
    <tr>
      <td>Sélectionner un état:</td>
      <td>
	  <%while (rs.next()) {
			out.println("<input name='radiobutton' type='radio' value='" + rs.getInt("REPORT_ID") + "'");
			if (rs.getInt("REPORT_ID")==1) {
				out.println("checked>" + rs.getString("REPORT_LABEL") + "<BR>");
			}
			else {
				out.println(">" + rs.getString("REPORT_LABEL") + "<BR>");
			}
          } %>
	  </td>
		
    </tr>
    <tr>
      <td><input type="submit" name="Submit" value="Ok     " /></td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
<%cnx.close(); %>
</body>
</html>