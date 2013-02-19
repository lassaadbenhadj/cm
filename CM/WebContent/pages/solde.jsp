<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.enda.caissemanager.database.communicatewithDb"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>

<% Integer userid=(Integer) session.getAttribute("username");
Integer caisseidi=(Integer)session.getAttribute("caisseid");
if(userid==null) {
	String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
}
String thisDateSent=request.getParameter("datetoSend");
String thisCaisseSent=request.getParameter("caissesent");

%>
<%
DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
String transdate=dateFormat.format(date);
// communicatewithDb cwdb = new communicatewithDb();
// Double solde = cwdb.getSoldeTheo(caisseidi,transdate);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Solde</title>
</head>
<body>
<form name="formsortie" method="post" action="commit_solde.jsp" onReset="window.location='main.jsp';">
  <label></label>
  <label><br>
  </label>
  <table width="372" border="0" align="center">
    <tr>
      <th colspan="2" scope="col">Solde</th>
    </tr>
    <tr>
      <td width="156">&nbsp;</td>
      <td width="206">&nbsp;</td>
    </tr>
 <!--    <tr>
      <td><div align="left">Solde Th&eacute;orique </div></td>
      <td><% //out.println(solde); %></td>
    </tr>
    -->
    <tr>
      <td><div align="left">Solde Physique </div></td>
      <td><input name="amountsent" type="text"></input></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input name="typesent" type="hidden" id="typesent" value="11"></td>
    </tr>
    <tr>
      <td><input type="hidden" name="datetoSend_2" value=<% out.println(thisDateSent);%>></td>
      <td><input type="hidden" name="caissesent_2" value=<% out.println(thisCaisseSent);%>></td>
      <td>
              
            <div align="center">
              <input type="submit" name="Submit" value="Valider">
            </div></td>
      <td><div align="left">
        <input type="reset" name="Submit2" value="Annuler">
      </div></td>
    </tr>
  </table>
  <label><br>
  </label>
  <label></label>
</form>


</body>
</html>