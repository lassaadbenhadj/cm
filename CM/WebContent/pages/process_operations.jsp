<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.io.*"%>
<%@ page import ="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.enda.caissemanager.connection.ConnectionBase"%>
<%@ page import="com.enda.caissemanager.connection.LienBase"%>
<%@ page import ="java.text.DateFormat"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page import ="com.enda.caissemanager.business.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script language="javascript">
	function aggregateDate() {
		document.formcc.datetoSend.value=document.formcc.dateOfBirthYY.value +"-"+ document.formcc.dateOfBirthMM.value +"-"+ document.formcc.dateOfBirthDD.value ;
	}



</script>
</head>
<body>
<% Integer userid=(Integer) session.getAttribute("username");
Integer caisseidi=(Integer)session.getAttribute("caisseid");
Integer cmrole=(Integer)session.getAttribute("roleid");
if(userid==null) {
	String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
}

String pageToRedirectTo=request.getParameter("pageselected") + ".jsp";
businessRules bRules= new businessRules();

if (!bRules.roles_allowed_to_enter_backdated_trxn(cmrole)&& pageToRedirectTo.equals("importer_Remboursement.jsp")){
	response.sendRedirect("main.jsp?msg=erreur_remb");
}
else {
if(caisseidi==0) {
	if (!bRules.roles_allowed_to_enter_backdated_trxn(cmrole)){
		response.sendRedirect("main.jsp?msg=erreur");
	}
	
	Statement statement = null;
	ResultSet rs = null;
	
	Connection cnx;
	ConnectionBase TestCnx = new ConnectionBase();
	cnx= TestCnx.getCnx(); 
	

	LienBase TestLien = new LienBase();
	statement = TestLien.getLien(cnx);
	
		  try  {
	      String Sqlstr="";

		  Sqlstr="SELECT * from cm_caisses ORDER BY DISPLAY_NAME";
		  rs=statement.executeQuery(Sqlstr);

		  }
		  catch(Exception e)
		  {
			   out.println("<font color=red>Erreur Dans le chargement de la liste des caisses</font>"); 
		   }
%>
	<form name="formcc" method="post" action=<%=pageToRedirectTo %> onReset="window.location='main.jsp';">
	  
	  <table width="372" border="0" align="center">
	
	    <tr>
	      <th colspan="2" scope="col">Choisir caisse</th>
	    </tr>
	    <tr>
	      <th scope="col">&nbsp;</th>
	      <th scope="col">&nbsp;</th>
	    </tr>
	    <tr>
			<%
			  out.println("<td><div align='left'>Caisse </div></td>"); 
			  out.println("<td><div align='left'>");  
	    	  	  out.println("<select name='caissesent'>");
			  while (rs.next()) {
				out.println("<option value='"+ rs.getInt("ID") + "'>" + rs.getString("DISPLAY_NAME") + "</option>");
	          } 
			  out.println("</select></div></td>");
	      	%>
	     </tr>

	    <tr>
	      <td><div align='left'>Date </div></td>
		<td>
		 <input type="text" name="dateOfBirthDD" maxlength="2" size="2" value=""/>JJ 
		 <input type="text" name="dateOfBirthMM" maxlength="2" size="2" value="" />MM 
		 <input type="text" name="dateOfBirthYY" maxlength="4" size="4" value=""/>AAAA
		</td>
	      <td><input type="hidden" name="datetoSend"></td>
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
	      <td>&nbsp;</td>
	      <td>&nbsp;</td>
	    </tr>
	    <tr>
	      <td>
	           	              
	       <div align="center"> <input type="submit" name="Submit" value="Suivant" onClick="aggregateDate()"></div></td>
	       <td><input type="reset" name="Submit2" value="Annuler"></td>
	    </tr>
	  </table>
	</form>
<%
}
else {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String todaysDate=dateFormat.format(date);
		response.sendRedirect(pageToRedirectTo + "?datetoSend=" + todaysDate);
	}
}
%>