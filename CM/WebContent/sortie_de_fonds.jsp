<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sortie de fonds</title>
<script language="javascript">
	function checkfondsdecaisse() {
		if (formsortie.typesent.options[formsortie.typesent.selectedIndex].value==3) {
			formsortie.amountsent.value= 10;
			formsortie.numpiecesent.value= "_";
			formsortie.destination.value= "_";
		}
	}
</script>
</head>
<body>
<form name="formsortie" method="post" action="commit_sortie_de_fonds.jsp" onReset="window.location='main.jsp';">
  <label></label>
  <label><br>
  </label>
  <table width="372" border="0" align="center">
    <tr>
      <th colspan="2" scope="col">Sortie de fonds </th>
    </tr>
    <tr>
      <th width="156" scope="col">&nbsp;</th>
      <th width="206" scope="col">&nbsp;</th>
    </tr>
    <tr>
      <th scope="col">
        <div align="left">Type</div></th>
      <th scope="col"><div align="left">
        <select name="typesent" Onchange="checkfondsdecaisse()">
          <option value="8">Sortie_de_fonds autre caisse</option>
          <option value="17">Sortie_de_fonds_Si&egrave;ge</option>
          <option value="6">Versement_A_La_Banque/A la poste</option>
          <option value="3">Sortie_Fonds_Caisse</option>
        </select>
      </div></th>
    </tr>
    <tr>
      <td><div align="left">N° de pièce</div></td>
      <td><div align="left">
        <input type="text" name="numpiecesent">
      </div></td>
    </tr>
    <tr>
      <td><div align="left">Montant</div></td>
      <td><div align="left">
        <input type="text" name="amountsent">
      </div></td>
    </tr>
    <tr>
      <td><div align="left">Destination</div></td>
      <td><input name="destination" type="text"></input></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
            <div align="center">
              <input type="submit" name="Submit" value="Valider">
            </div></td>
      <td><input type="reset" name="Submit2" value="Annuler"></td>
    </tr>
  </table>
  <label><br>
  </label>
  <label></label>
</form>
<% Integer userid=(Integer) session.getAttribute("username");
if(userid==null) {
	String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
}
%>

</body>
</html>