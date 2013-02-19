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

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>CM-page d'acceuil</title>
</head>

<body>
<table width="200" border="1" align="center">
  <tr>  </tr>
  <tr>
    <td><div align="center"><a href="alimentation.jsp">Saisie Alimentation</a></div></td>
  </tr>
  <tr>
    <td><div align="center"><a href="sortie_de_fonds.jsp">Saisie Sortie de fonds </a></div></td>
  </tr>
  <tr>
    <td><div align="center"><a href="remb_a_probleme.jsp">Remboursement &agrave; probl&egrave;me </a></div></td>
  </tr>
  <tr>
    <td><div align="center"><a href="frais_a_probleme.jsp">Frais &agrave; probl&egrave;me </a></div></td>
  </tr>
  <tr>
    <td><div align="center"><a href="pertes.jsp">Pertes collect&eacute;es </a></div></td>
  </tr>
  <!--
  <tr>
    <td><div align="center"><a href="def_excedent.jsp">Régularisiation déficit/exc&eacute;dent</a></div></td>
  </tr>
  -->
  <tr>
    <td><div align="center"><a href="solde.jsp">Saisie Solde </a></div></td>
  </tr>
  <tr>
    <td><div align="center"><a href="annulation_1_select_id.jsp">Annulation</a></div></td>
  </tr>
</table>
</body>
</html>


