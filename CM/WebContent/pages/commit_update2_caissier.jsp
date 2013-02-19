<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.enda.caissemanager.database.addcashier"%>
<%@ page import="com.enda.caissemanager.database.communicatewithDb"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% Integer userid=(Integer) session.getAttribute("username");
Integer caisseidi=(Integer)session.getAttribute("caisseid");
Integer cmrole=(Integer)session.getAttribute("roleid");
if(userid==null) {
	String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
}
%>
<%
Integer caissier=Integer.parseInt(request.getParameter("caissiersent"));
Integer caisse=Integer.parseInt(request.getParameter("caissesent"));
addcashier ad = new addcashier();
ad.updatecashier(caissier,caisse);
communicatewithDb cwdb = new communicatewithDb();
cwdb.logIndb(userid);

if ( cmrole == 1)
	response.sendRedirect("admin_page.jsp");
else
	response.sendRedirect("main.jsp");

%>
</body>
</html>