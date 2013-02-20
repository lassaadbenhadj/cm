<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.enda.caissemanager.connection.lirefichier"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% Integer username=(Integer) session.getAttribute("username");

if(username==null) {
	String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
  /*=session.getId()*/ 
}
String cmmsg=request.getParameter("erreurMsg");
if (cmmsg.equals("custidError")) {
	out.println("<font color=red ><B>Le client introduit n'existe pas dans la base mifos, prière de vérifier le CIN </B></font>"); 

}

if (cmmsg.equals("AmountValidationError")) {
	out.println("<font color=red ><B>Le montant saisi est invalide </B></font>"); 

}

if (cmmsg.equals("CNameValidationError")) {
	out.println("<font color=red ><B>Prière de saisir le nom du client </B></font>"); 

}
%>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>CM-Erreur</title>
</head>

<body>

</body>
</html>