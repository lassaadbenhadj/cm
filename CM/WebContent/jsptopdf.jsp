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
<title>Insert title here</title>
</head>
<body>
<% Integer userid=(Integer) session.getAttribute("username");
Integer caisseidi=(Integer)session.getAttribute("caisseid");
Integer caissierid=0;
if(userid==null) {
	String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
}
String datereport=request.getParameter("datetoSend");
String whichreport=request.getParameter("radiobutton");
String testcaissesent=request.getParameter("caissesent");
String testcaissiersent=request.getParameter("caissiersent");

if (whichreport==null) {
	datereport=request.getParameter("datereporttojsptopdfpage");
	whichreport=request.getParameter("whichreporttojsptopdfpage");
}

if (caisseidi==0) {
	if (testcaissesent!=null) {
	caisseidi=Integer.parseInt(request.getParameter("caissesent"));
	}
	if (testcaissiersent!=null) {
	caissierid=Integer.parseInt(request.getParameter("caissiersent"));
	}
}

if (testcaissiersent==null) {
	caissierid=userid;
}
Integer whichreportInt = Integer.parseInt(whichreport);
getreportdata grptd = new getreportdata(whichreportInt);
String whichreportstr=grptd.reportname;

//switch (whichreportInt) {
//  case 1:
//        whichreportstr="etat_general.rptdesign";
//        break;
//  case 2: 
//        whichreportstr="etat_general_caissier.rptdesign";
//        break;
//  case 3:
// 	whichreportstr="etat_detail.rptdesign";
//	break;
//  case 4:
// 	whichreportstr="etat_detail_caissier.rptdesign";
//	break;

//  default:
//        whichreportstr="etat_detail.rptdesign";
//}
%>

<%response.sendRedirect("../birt/frameset?__report=" + whichreportstr + "&OpDate=" + datereport + "&Caisse="+ caisseidi +"&caissier=" + caissierid + "&rptuser=" + userid);%>
</body>
</html>