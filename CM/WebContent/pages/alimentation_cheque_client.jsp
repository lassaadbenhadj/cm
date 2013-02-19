<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% Integer userid=(Integer) session.getAttribute("username");
if(userid == null) {
	String redirectURL = ("login.jsp"+"&target="+"content");
    response.sendRedirect(redirectURL);
}

String thisDateSent=request.getParameter("datetoSend");
String thisCaisseSent=request.getParameter("caissesent");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>alimentation</title>
<script language="javascript">
		 
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
	  document.form1.amountsent.value="";
      }
}

</script>
</head>
<body>
<form name="form1" method="post" action="commit_alimentation_cheque_client.jsp" onReset="window.location='main.jsp';">
  <label></label>
  <label><br>
  </label>
  <table width="372" border="0" align="center">
    <tr>
      <th colspan="2" scope="col">Alimentation chèque client</th>
    </tr>
    <tr>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr>
      <td><div align="left">Type alimentation chèque</div></td>
      <td><div align="left">
      	 <select name="typesent">
          	<option value="23">Alimentation chèque client</option>
          	<option value="26">Report chèque client</option>
        </select>
      </div></td>
    </tr>
    <tr>
      <td><div align="left">N° de chèque</div></td>
      <td><div align="left">
        <input type="text" name="numpiecesent">
      </div></td>
    </tr>
    <tr>
      <td><div align="left">Montant</div></td>
      <td><div align="left">
        <input type="text" name="amountsent" onblur="checkamount()">
      </div></td>
 
    </tr>
    <tr>
      <td><div align="left">Nom du client</div></td>
      <td><input type="text" name="bankAccount"></td>
    </tr>
    <tr>
      <td><div align="left">CIN</div></td>
      <td><input type="text" name="cinsent"></td>
    </tr>
    <tr>
      <td><input type="hidden" name="datetoSend_2" value=<% out.println(thisDateSent);%>></td>
      <td><input type="hidden" name="caissesent_2" value=<% out.println(thisCaisseSent);%>></td>
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

</body>
</html>