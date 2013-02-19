<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.io.*"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.DateFormat"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page import="com.enda.caissemanager.database.getreportdata"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Report Page</title>
</head>
<body>
<% Integer userid=(Integer) session.getAttribute("username");
Integer caisseidi=(Integer)session.getAttribute("caisseid");
Integer caissierid=0;
String link_str="";

if(userid==null) {
    String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
}
String datereport=request.getParameter("datetoSend");
String whichreport=request.getParameter("reportId");
String report_format=request.getParameter("formatId");


if (whichreport==null) {
	report_format=request.getParameter("formatIdwithCaisse");
	whichreport=request.getParameter("whichreportwithCaisse");
}

Integer whichreportInt = Integer.parseInt(whichreport);
getreportdata grptd = new getreportdata(whichreportInt);
String whichreportstr=grptd.reportname;

if (caisseidi!=0) { //traitement si caissier
	caissierid=userid;
	link_str="../preview?__report=report/" + whichreportstr + "&OpDate=" + datereport + "&Caisse="+ caisseidi +"&caissier=" + caissierid + "&rptuser=" + userid +"&__format=" + report_format;
}
	else { //traitement si non caissier
		link_str="../preview?__report=report/" + whichreportstr + "&rptuser=" + userid +"&__format=" + report_format;
	}


%>

<center>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td align="left" valign="top" bgcolor="#FFFFFF" class="paddingleftmain" height="500" >
	<iframe style="border:none; padding:0px;" width="1024px" height="100%" frameborder=0 src=<%=link_str%>></iframe>
 </td>
</tr>
</table>
</center>
</body>
</html>

</body>
</html>