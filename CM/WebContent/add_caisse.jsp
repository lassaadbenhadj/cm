<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.io.*"%>

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
<form name="formcc" method="post" action="commit_add_caisse.jsp" onReset="window.location='admin_page.jsp';">
  
  <table width="372" border="0" align="center">
    <tr>
      <th colspan="2" scope="col">Saisir nom caisse</th>
    </tr>
    <tr>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr>
      <td><div align="left">Caisse </div></td>
       <td><input type="text" name="caissesent"></input></td>
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
