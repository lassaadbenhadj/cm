<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.io.*"%>
<%@ page import ="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.enda.caissemanager.connection.ConnectionBase"%>
<%@ page import="com.enda.caissemanager.connection.LienBase"%>
<%@ page import ="java.text.DateFormat"%>
<%@ page import ="java.text.SimpleDateFormat"%>
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

	Statement statement = null;
	Statement statementc = null;
	ResultSet rs = null;
	ResultSet rsc = null;
	Connection cnx;
	ConnectionBase TestCnx = new ConnectionBase();
	cnx= TestCnx.getCnx(); 
	if (cnx == null) {
	    out.println("<font color=red>Connexion impossible : " + cnx + "</font>");
		} 

	LienBase TestLien = new LienBase();
	statement = TestLien.getLien(cnx);
	statementc= TestLien.getLien(cnx);
	if (statement == null) {
		    out.println("<font color=red>Communication impossible : "+ statement + "</font>");
		  }
	try  {
	      String Sqlstr="SELECT *  FROM cm_caisse_users join personnel on personnel.personnel_id=cm_caisse_users.USER_ID WHERE LAST_ACTIVE=1";
	      rs=statement.executeQuery(Sqlstr);
	      Sqlstr="SELECT * FROM cm_caisses";
	      rsc=statementc.executeQuery(Sqlstr);

%>
<form name="formcc" method="post" action="commit_update_caissier.jsp" onReset="window.location='admin_page.jsp';">
  
  <table width="372" border="0" align="center">
    <tr>
      <th colspan="2" scope="col">Choisir caissier</th>
    </tr>
    <tr>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr>
      <td><div align="left">Caissier</div></td>
      <td><div align="left">
        <select name="caissiersent">
          <% out.println("<option value=0>select</option>");%>
          <% while (rs.next()) {
        	  out.println("<option value='"+ rs.getInt("USER_ID") + "'>" + rs.getString("DISPLAY_NAME") + "</option>");
          } %>
        </select>
      </div></td>
    </tr>
    <tr>
      <td><div align="left">Caisse</div></td>
      <td><select name="caissesent">
      	<% out.println("<option value=0>select</option>");%>
        <% while (rsc.next()) {
        	out.println("<option value='"+ rsc.getInt("ID") + "'>" + rsc.getString("DISPLAY_NAME") + "</option>");
         } %>
      </select>      </td>
      <td><input type="hidden" name="Datestarttosend" value=12></td>
      <td><input type="hidden" name="Dateendtosend" value=12>
      <input type="hidden" name="namecaissiertosend" value=12></td>
      <td><input type="hidden" name="Dateidtosend" value=12>
      <input type="hidden" name="caissetosend" value=12></td>
    </tr>
    <tr>
      <td>Date</td>
      <td><input name="textdate" type="text" id="textdate"></td>
    </tr>
    <tr>
      <td>Heure d&eacute;but: </td>
      <td><input name="HS" type="text" id="HS" size="1">
      :
      <input name="MS" type="text" id="MS" size="1"></td>
    </tr>
    <tr>
      <td>Heure fin: </td>
      <td><input name="HE" type="text" id="HE" size="1">
      :
      <input name="ME" type="text" id="ME" size="1"></td>
    </tr>
    <tr>
      <td>
              
              
      <div align="center"> <input type="submit" name="Submit" value="Suivant"> </div></td>
      <td><input type="reset" name="Submit2" value="Annuler"></td>
    </tr>
  </table>
</form>
<% 		}
	catch(Exception e){
			   out.println("<font color=red>Erreur Dans le chargement de la liste des caissier</font>"); 
		}
%>