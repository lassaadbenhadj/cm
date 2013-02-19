<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.enda.caissemanager.database.addcashier"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% Integer userid=(Integer) session.getAttribute("username");
Integer caisseidi=(Integer)session.getAttribute("caisseid");
if(userid==null) {
	String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
}
%>
<%
Integer caissier=Integer.parseInt(request.getParameter("caissiersent"));
Integer caisse=Integer.parseInt(request.getParameter("caissesent"));
String matricule=request.getParameter("matricule");

addcashier cwdb = new addcashier();
cwdb.insertcashier(caissier,caisse,userid,"00","00","23","59",0,matricule);

response.sendRedirect("admin_page.jsp");

%>
</body>
</html>