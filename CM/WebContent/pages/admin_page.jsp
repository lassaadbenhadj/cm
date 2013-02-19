<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.enda.caissemanager.connection.lirefichier"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% Integer username=(Integer) session.getAttribute("username");

if(username==null) {
	String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
 
}

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>CM-page d'admin</title>
</head>

<body>
<table width="200" border="1" align="center">
  <tr>  </tr>
  <tr>
    <td><div align="center"><a href="add_caisse.jsp">Ajouter caisse</a></div></td>
  </tr>
  <tr>
    <td><div align="center"><a href="add_caissier.jsp">Ajouter caissier</a></div></td>
  </tr>
   <tr>
    <td><div align="center"><a href="update_caissier_0.jsp">Transférer caissier</a></div></td>
  </tr>
  <tr>
    <td><div align="center"><a href="update_caissier_1.jsp">Différer caissier</a></div></td>
  </tr>
  <tr>
    <td><div align="center"><a href="add_report.jsp">Ajouter rapport</a></div></td>
  </tr>
</table>
</body>
</html>
