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
String cmmsg=request.getParameter("msg");
if (cmmsg!=null){
if (cmmsg.equals("erreur")) {
	out.println("<font color=red ><B>Vous n'avez pas la permission pour saisir des transactions de caisse </B></font>"); 

}
if (cmmsg.equals("erreur_remb")) {
	out.println("<font color=red ><B>Vous n'avez pas la permission pour saisir pour importer des remboursements </B></font>"); 

}
}
%>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>CM-page d'acceuil</title>
</head>

<body>
<center><B>Opérations de la caisse</B></center><BR><BR>
<table width="400" border="0" align="center">
  <tr>  </tr>
  <tr>
    <td><div align="left"><a href="process_operations.jsp?pageselected=alimentation">Saisie Alimentation</a></div></td>
  </tr>
  <tr>
    <td><div align="left"><a href="process_operations.jsp?pageselected=sortie_de_fonds">Saisie Sortie de fonds</a></div></td>
  </tr>
  <tr>
    <td><div align="left"><a href="process_operations.jsp?pageselected=alimentation_cheque_client">Alimentation Ch&egrave;que client</a></div></td>
  </tr>
  <tr>
    <td><div align="left"><a href="process_operations.jsp?pageselected=report_annulation_cheque_client">Report/Annulation Ch&egrave;que client</a></div></td>
  </tr>
  <tr>
    <td><div align="left"><a href="process_operations.jsp?pageselected=commissions">Commissions sur retrait/versement</a></div></td>
  </tr>
  <tr>
    <td><div align="left"><a href="process_operations.jsp?pageselected=remb_a_probleme">Remboursement &agrave; probl&egrave;me </a></div></td>
  </tr>
  <tr>
    <td><div align="left"><a href="process_operations.jsp?pageselected=frais_a_probleme">Frais &agrave; probl&egrave;me </a></div></td>
  </tr>
  <tr>
    <td><div align="left"><a href="process_operations.jsp?pageselected=pertes">Pertes collect&eacute;es </a></div></td>
  </tr>
  <tr>
    <td><div align="left"><a href="process_operations.jsp?pageselected=frais_huissier">Frais de Huissier Notaire</a></div></td>
  </tr>
  <tr>
    <td><div align="left"><a href="process_operations.jsp?pageselected=def_excedent">Régularisiation déficit/exc&eacute;dent</a></div></td>
  </tr>
  <tr>
    <td><div align="left"><a href="process_operations.jsp?pageselected=solde">Saisie Solde </a></div></td>
  </tr>
  <tr>
    <td><div align="left"><a href="process_operations.jsp?pageselected=annulation_1_select_id">Annulation</a></div></td>
  </tr>
  <!--
  <tr>
    <td><div align="left"><a href="process_operations.jsp?pageselected=valider_Remboursement">Valider remboursement</a></div></td>
  </tr>
  -->
</table>
</body>
</html>