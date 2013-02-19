<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.io.*"%>
<%@ page import ="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.enda.caissemanager.connection.ConnectionBase"%>
<%@ page import="com.enda.caissemanager.connection.LienBase"%>
<%@ page import ="java.text.DateFormat"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page import="com.enda.caissemanager.database.getreportdata"%>
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

DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
String transdate=dateFormat.format(date);

String whichreporttoccpage=request.getParameter("wrccpage");
String formatIdToccpage=request.getParameter("formatId");
String paramTypeTocc=request.getParameter("paramType");
Integer paramTypeInt = Integer.parseInt(paramTypeTocc);
if(caisseidi!=0 && paramTypeInt==1 ) {
	
	
%>
<form name="formcc" method="post" action="jsptopdf.jsp" onReset="window.location='rapport.jsp';">
  
  <table width="372" border="0" align="center">
    <tr>
      <th colspan="2" scope="col">Date rapport</th>
    </tr>
    <tr>
     <th width="388" scope="col">aaaa-mm-jj &nbsp;&nbsp;<input type="text" name="datetoSend" value=<%=transdate%>></th>
    </tr>
    <tr>
		
     </tr>
     <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      
    </tr>
	
    <tr>
        <td><input type="hidden" name="reportId" value=<% out.println(whichreporttoccpage);%>></td>
	  <td><input type="hidden" name="formatId" value=<% out.println(formatIdToccpage);%>></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
              
              
            <div align="center"> <input type="submit" name="Submit" value="Rapport"> </div></td>
      <td><input type="reset" name="Submit2" value="Annuler"></td>
    </tr>
  </table>
</form>
<%
}
else {
	response.sendRedirect("jsptopdf.jsp?whichreportwithCaisse=" + whichreporttoccpage + "&formatIdwithCaisse=" + formatIdToccpage );
	}
%>
