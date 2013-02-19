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
<center><B>Etats de la caisse</B></center><BR><BR>
  <table width="437" border="0" align="center">
    
    <tr>
      <td></td>
	</tr>
	<td>
	  <%while (rs.next()) {
			out.println("<tr>");
			out.println("<td>");
			out.println("<a href='check_caisse.jsp?wrccpage=" + rs.getInt("REPORT_ID") + "&formatId=pdf&paramType=" + rs.getInt("REPORT_PARAM_NUM") + "'>");
			out.println(rs.getString("REPORT_LABEL"));
			out.println("</td>");
			out.println("<td>");
			if (rs.getInt("REPORT_XLS")==1) {
				out.println("<a href='check_caisse.jsp?wrccpage=" + rs.getInt("REPORT_ID") + "&formatId=xls&paramType=" + rs.getInt("REPORT_PARAM_NUM") +"'>");
				out.println("Excel");
			}
			out.println("</td>");
			out.println("</tr>");

          } %>
	 </td>
		
    </tr>
    <tr>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
<%cnx.close(); %>
</body>
</html>