<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.enda.caissemanager.database.dealWithChequeClient"%>
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
String[] cancelCheque; 
String[] reportCheque;

cancelCheque = request.getParameterValues("cancelCheque");
reportCheque = request.getParameterValues("reportCheque");
%>
<%

String thisDateSent=request.getParameter("datetoSend_2");
String thisCaisseSent=request.getParameter("caissesent_2");
	//Double dblAmount = Double.parseDouble(request.getParameter("amountsent"));
	//Integer IntTypeAl = Integer.parseInt(typeAl);
	Integer thisCaisseSentInt=caisseidi;
	if (thisCaisseSentInt==0) {
		thisCaisseSentInt=Integer.parseInt(thisCaisseSent);
	}
	if (thisDateSent==null) {
		thisDateSent="1900-01-01";
	}
	
	dealWithChequeClient dwcc = new dealWithChequeClient();
	
	if (cancelCheque != null) {
		dwcc.processDataReceivedFromPresentationLayer(cancelCheque,24,userid);
	}
	
	if (reportCheque != null) {
		dwcc.processDataReceivedFromPresentationLayer(reportCheque,25,userid);
	}
	
	response.sendRedirect("main.jsp");

%>
</body>
</html>