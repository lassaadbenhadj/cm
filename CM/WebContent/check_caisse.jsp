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

String datereporttoccpage=request.getParameter("datetoSend");
String whichreporttoccpage=request.getParameter("radiobutton");

if(caisseidi==0) {
	
	getreportdata grptd = new getreportdata(Integer.parseInt(whichreporttoccpage));
	Integer rptparam=grptd.reportparam;
	
	Statement statement = null;
	Statement statement2 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	Connection cnx;
	ConnectionBase TestCnx = new ConnectionBase();
	cnx= TestCnx.getCnx(); 
	

	LienBase TestLien = new LienBase();
	statement = TestLien.getLien(cnx);
	statement2 = TestLien.getLien(cnx);
		  try  {
	      String Sqlstr="";
		  if (rptparam==0) {
			Sqlstr="SELECT * from cm_caisses";
			rs=statement.executeQuery(Sqlstr);
		  }
	      if (rptparam==1) {
			Sqlstr="SELECT DISTINCT personnel_id, DISPLAY_NAME FROM cm_caisse_users join personnel on personnel.personnel_id=cm_caisse_users.USER_ID";
			rs2=statement2.executeQuery(Sqlstr);
		  }
		  
		  }
		  catch(Exception e)
		  {
			   out.println("<font color=red>Erreur Dans le chargement de la liste des caisses</font>"); 
		   }
%>
<form name="formcc" method="post" action="jsptopdf.jsp" onReset="window.location='rapport.jsp';">
  
  <table width="372" border="0" align="center">
    <tr>
      <th colspan="2" scope="col">Choisir caisse</th>
    </tr>
    <tr>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr>
		<%if (rptparam==0) {
		  out.println("<td><div align='left'>Caisse </div></td>"); 
		  out.println("<td><div align='left'>"); 
    	  out.println("<select name='caissesent'>");
		  while (rs.next()) {
			out.println("<option value='"+ rs.getInt("ID") + "' selected>" + rs.getString("DISPLAY_NAME") + "</option>");
          } 
		  out.println("</select></div></td>");
      }
      %>
     </tr>
     <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <%if (rptparam==1) {
		  out.println("<td><div align='left'>Caissier </div></td>"); 
		  out.println("<td><div align='left'>"); 
    	  out.println("<select name='caissiersent'>");
		  while (rs2.next()) {
			out.println("<option value='"+ rs2.getInt("personnel_id") + "' selected>" + rs2.getString("DISPLAY_NAME") + "</option>");
          } 
		  out.println("</select></div></td>");
      }
      %>
    </tr>
	<%if (rptparam==2) {
		response.sendRedirect("jsptopdf.jsp?datereporttojsptopdfpage="+datereporttoccpage+"&whichreporttojsptopdfpage=" + whichreporttoccpage);
	}
      %>
    <tr>
      <td><input type="hidden" name="datetoSend" value=<% out.println(datereporttoccpage);%>></td>
      <td><input type="hidden" name="radiobutton" value=<% out.println(whichreporttoccpage);%>></td>
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
	response.sendRedirect("jsptopdf.jsp?datereporttojsptopdfpage="+datereporttoccpage+"&whichreporttojsptopdfpage=" + whichreporttoccpage);
	}
%>
