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
String numpiece=request.getParameter("numpiecesent");
String amount=request.getParameter("amountsent");
String dblabel="_";
String globalaccountid=request.getParameter("codesent");

if(userid==null) {
	String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
}
%>
<% 
String[] cancelCheque; 

cancelCheque = request.getParameterValues("cancelCheque");
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
	Integer account_id=0;
	communicatewithDb cwdb = new communicatewithDb();
	account_id=cwdb.getaccountID(globalaccountid);
	if (amount !=null) {
		if (account_id!=0) {
			Double dblAmount = Double.parseDouble(request.getParameter("amountsent"));
			cwdb.insertIndb(account_id,userid,1,numpiece,dblAmount,dblabel,thisCaisseSentInt,thisDateSent);
			response.sendRedirect("main.jsp");
		}
		else {
			out.println("le code: " + globalaccountid + " est faux, prière de le vérifier");
		}
	}
	
	
	response.sendRedirect("main.jsp");

%>
</body>
</html>