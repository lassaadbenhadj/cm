<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Frais à problème</title>
<script language="javascript">
	function checkfondsdecaisse() {
		if (form1.typesent.options[form1.typesent.selectedIndex].value==2) {
			form1.amountsent.value=10;
			form1.numpiecesent.value="_";
			form1.bankAccount.value="_";
		}
	}
	
   function IsNumeric(strString)  {
   var strValidChars = "0123456789.-";
   var strChar;
   var blnResult = true;

   if (strString.length == 0) return false;

   //  test strString consists of valid characters listed above
   for (i = 0; i < strString.length && blnResult == true; i++)
      {
      strChar = strString.charAt(i);
      if (strValidChars.indexOf(strChar) == -1)
         {
         blnResult = false;
         }
      }
   return blnResult;
   }
   
   function checkamount() {
   if (document.form1.amountsent.value.length == 0) 
      {
      alert("Entrer une valeur svp");
      } 
   else if (IsNumeric(document.form1.amountsent.value) == false) 
      {
      alert("Entrer une valeur numérique SVP!");
	  document.form1.amountsent.value=""
      }
}

</script>
</head>
<body>
<form name="form1" method="post" action="commit_remb_fees_a_pb.jsp" onReset="window.location='main.jsp';">
  <label></label>
  <label><br>
  </label>
  <table width="372" border="0" align="center">
    <tr>
      <th colspan="2" scope="col">Frais à problème</th>
    </tr>
    <tr>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr>
      <th scope="col">&nbsp;</th>
      <th scope="col"><div align="left">
        <input type="hidden" name="typesent" value=13>
      </div></th>
    </tr>
    <tr>
      <td>Code mifos </td>
      <td><input type="text" name="codesent"></td>
    </tr>
    <tr>
      <td><div align="left">N° Re&ccedil;u </div></td>
      <td><div align="left">
        <input type="text" name="numpiecesent">
      </div></td>
    </tr>
    <tr>
      <td><div align="left">Montant</div></td>
      <td><div align="left">
        <input type="text" name="amountsent" onBlur="checkamount()">
      </div></td>
    </tr>
    <tr>
      <td><div align="left">Nom client </div></td>
      <td><input type="text" name="bankAccount"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
             
              
            <div align="center">
              <input type="submit" name="Submit" value="Valider" >
            </div></td>
      <td><div align="left">
        <label>
        <input type="reset" name="Submit2" value="Annuler">
        </label>
      </div></td>
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