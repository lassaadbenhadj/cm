<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.enda.caissemanager.database.communicatewithDb"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
String thisDateSent=request.getParameter("datetoSend_2");
String thisCaisseSent=request.getParameter("caissesent_2");
if (amount !=null) {
	Double dblAmount = Double.parseDouble(request.getParameter("amountsent"));
	if (dblAmount<=0){
		response.sendRedirect("error_page.jsp?erreurMsg=AmountValidationError");
	}
	else {
	Integer IntTypeAl = Integer.parseInt(typeAl);
	Integer thisCaisseSentInt=caisseidi;
	if (thisCaisseSentInt==0) {
		thisCaisseSentInt=Integer.parseInt(thisCaisseSent);
	}
	if (thisDateSent==null) {
		thisDateSent="1900-01-01";
	}
	communicatewithDb cwdb = new communicatewithDb();
	//cwdb.insertIndb(0,userid,IntTypeAl,numpiece,dblAmount,dblabel,caisseidi);
	cwdb.insertIndb(0,userid,IntTypeAl,numpiece,dblAmount,dblabel,thisCaisseSentInt,thisDateSent);
	response.sendRedirect("main.jsp");
	}
}

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>