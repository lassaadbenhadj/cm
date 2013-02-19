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
	statementc=TestLien.getLien(cnx);
	if (statement == null) {
		    out.println("<font color=red>Communication impossible : "+ statement + "</font>");
		  }
	try  {
	      String Sqlstr="SELECT * FROM PERSONNEL JOIN PERSONNEL_ROLE USING(PERSONNEL_ID) WHERE ROLE_ID=5 AND PERSONNEL.PERSONNEL_ID NOT IN (SELECT USER_ID FROM cm_caisse_users)";
	      rs=statement.executeQuery(Sqlstr);
	      Sqlstr="SELECT * FROM cm_caisses";
	      rsc=statementc.executeQuery(Sqlstr);

%>
<form name="formcc" method="post" action="commit_add_caissier.jsp" onReset="window.location='admin_page.jsp';">
  
  <table width="372" border="0" align="center">
    <tr>
      <th colspan="2" scope="col">Choisir caisse</th>
    </tr>
    <tr>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr>
      <td><div align="left">Caissier</div></td>
      <td><div align="left">
        <select name="caissiersent">
          <% while (rs.next()) {
			out.println("<option value='"+ rs.getInt("PERSONNEL_ID") + "'>" + rs.getString("DISPLAY_NAME") + "</option>");
          } %>
        </select>
      </div></td>
    </tr>
    <tr>
      <td><div align="left">Caisse </div></td>
       <td><select name="caissesent">
          <% while (rsc.next()) {
			out.println("<option value='"+ rsc.getInt("ID") + "'>" + rsc.getString("DISPLAY_NAME") + "</option>");
          } %>
        </select></td>
    </tr>
    <tr>
      <td><div align="left">Matricule</div></td>
      <td><input type='text' name="matricule"/></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
              
              
      <div align="center"> <input type="submit" name="Submit" value="Ajouter"> </div></td>
      <td><input type="reset" name="Submit2" value="Annuler"></td>
    </tr>
  </table>
</form>
<% 		}
	catch(Exception e){
			   out.println("<font color=red>Erreur Dans le chargement de la liste des caisses</font>"); 
		}
%>