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
String numpiece=request.getParameter("numpiecesent");
String amount=request.getParameter("amountsent");
String typeAl=request.getParameter("typesent");
String dblabel=request.getParameter("bankAccount");
String globalaccountid=request.getParameter("codesent");
Integer account_id=0;
out.println(typeAl);
communicatewithDb cwdb = new communicatewithDb();
account_id=cwdb.getaccountID(globalaccountid);
if (amount !=null) {
	if (account_id!=0) {
		Double dblAmount = Double.parseDouble(request.getParameter("amountsent"));
		Integer IntTypeAl = Integer.parseInt(typeAl);
		cwdb.insertIndb(account_id,userid,IntTypeAl,numpiece,dblAmount,dblabel,caisseidi);
		response.sendRedirect("main.jsp");
	}
	else {
		out.println("le code: " + globalaccountid + " est faux, pri�re de le v�rifier");
	}
}

%>
</body>
</html>