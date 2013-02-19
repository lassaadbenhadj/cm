<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
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
if(userid==null) {
	String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
}
%>
<%

String amount=request.getParameter("amountsent");
String typeAl=request.getParameter("typesent");
out.println(typeAl);
if (amount !=null) {
	Double dblAmount = Double.parseDouble(request.getParameter("amountsent"));
	Integer IntTypeAl = Integer.parseInt(typeAl);
	communicatewithDb cwdb = new communicatewithDb();
	cwdb.insertIndb(0,userid,IntTypeAl,"_",dblAmount,"SPH",caisseidi);
	response.sendRedirect("main.jsp");
}

%>
</body>
</html>