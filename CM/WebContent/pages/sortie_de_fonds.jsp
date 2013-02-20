<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*"%>
<%@ page import="com.enda.caissemanager.connection.ConnectionBase"%>
<%@ page import="com.enda.caissemanager.connection.LienBase"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<% Integer userid=(Integer) session.getAttribute("username");
if(userid==null) {
	String redirectURL = ("login.jsp"+"&target="+"content");
    response.sendRedirect(redirectURL);
}

String thisDateSent=request.getParameter("datetoSend");
String thisCaisseSent=request.getParameter("caissesent");
String destinationVar=request.getParameter("destvar");
Integer intDestvar = 6;
	if (destinationVar != null) {
		intDestvar = Integer.parseInt(destinationVar);
	} 
%>

<%
Statement statement = null;
ResultSet rs = null;
Connection cnx;
ConnectionBase TestCnx = new ConnectionBase();
cnx= TestCnx.getCnx();

if (cnx == null) 
{
    out.println("<font color=red>Connexion impossible : " + cnx + "</font>");
} 

LienBase TestLien = new LienBase();
statement = TestLien.getLien(cnx);
if (statement == null) {
	    out.println("<font color=red>Communication impossible : "+ statement + "</font>");
	  } 

	   try
	  {
      String Sqlstr="SELECT * FROM cm_trans_types where prevtype=4";
      rs=statement.executeQuery(Sqlstr);
	  }
	  catch(Exception e)
	  {
		   out.println("<font color=red>Erreur Dans l'operation De recherche</font>"); 
	   }
		Statement statement_caisses = null;
		ResultSet rs_caisses = null;
		LienBase TestLien_caisses = new LienBase();
		statement_caisses = TestLien_caisses.getLien(cnx);
	  	if (statement_caisses == null) {
	  	    out.println("<font color=red>Communication impossible : "+ statement_caisses + "</font>");
	  	 } 

	  	 try
	  	 {
	        String Sqlstr="SELECT * FROM cm_caisses where ISACTIVE=1";
	        rs_caisses=statement_caisses.executeQuery(Sqlstr);
	  	  }
	  	  catch(Exception e)
	  	  {
	  		   out.println("<font color=red>Erreur Dans l'operation De recherche de caisses</font>"); 
	  	   }
	  	Statement statement_banques = null;
	  	ResultSet rs_banques = null;
	  	LienBase TestLien_banques = new LienBase();
	  	statement_banques = TestLien_banques.getLien(cnx);
	  	if (statement_banques == null) {
	  		  	out.println("<font color=red>Communication impossible : "+ statement_banques + "</font>");
	  	} 

	  	try
	  		 {
	  		    String Sqlstr="SELECT * FROM cm_banks where is_active=1";
	  		    rs_banques=statement_banques.executeQuery(Sqlstr);
	  		  }
	  	catch(Exception e)
	  		  {
	  		  	out.println("<font color=red>Erreur Dans l'operation De recherche de banques</font>"); 
	  		  }
%>
<title>Sortie de fonds</title>
<script language="javascript">
	function checkfondsdecaisse() {
		if (formsortie.typesent.options[formsortie.typesent.selectedIndex].value==3) {
			formsortie.amountsent.value= 10;
			formsortie.numpiecesent.value= "_";
			formsortie.destination.value= "_";
		}
	}

	function fun_refresh(form,formVar,passedDate,passedCaisse){
		form.action="sortie_de_fonds.jsp?destvar=" + formVar + "&datetoSend=" + passedDate + "&caissesent=" + passedCaisse;
		form.submit();
	}
	
	function constructDestinationLabel (){
		var w = document.formsortie.destinationWithId.selectedIndex;
		if (w!=undefined){
			var selected_text = document.formsortie.destinationWithId.options[w].text;
			formsortie.destination.value=selected_text;
		} else {
			formsortie.destination.value=formsortie.destinationWithId.value;
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
        <select name="typesent" Onchange="fun_refresh(this.form,this.form.typesent.value,this.form.datetoSend_2.value,this.form.caissesent_2.value)">
	     <%while (rs.next()) {
	    	 if (intDestvar==rs.getInt("IDType")){
	    		 out.println("<option value=" + rs.getInt("IDType") + " selected>" + rs.getString("TypeName") + "</option>");
	    	 } else {
	    		 out.println("<option value=" + rs.getInt("IDType") + ">" + rs.getString("TypeName") + "</option>");
	    	 }
	    	 
	     }%>
	    
          <!--<option value="8">Sortie_de_fonds autre caisse</option>-->
          <!--<option value="17">Sortie_de_fonds_Si&egrave;ge</option>-->
          <!--<option value="6" selected>Versement_A_La_Banque/A la poste</option>-->
          <!-- <option value="3">Sortie_Fonds_Caisse</option>-->
          <!--<option value="24">Annulation_cheques_client</option>-->
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
      <%switch (intDestvar) {
      	case 6: 
      		out.println ("<td><select name='destinationWithId'>");
      		while (rs_banques.next()) {
   	    		out.println("<option value=" + rs_banques.getInt("bank_id") + ">" + rs_banques.getString("bank_name") + "</option>");
   	     	}
      		out.println ("</select></td>");
			break;
      	case 8: 
      		out.println ("<td><select name='destinationWithId'>");
      		while (rs_caisses.next()) {
   	    		out.println("<option value=" + rs_caisses.getInt("ID") + ">" + rs_caisses.getString("DISPLAY_NAME") + "</option>");
   	     	}
      		out.println ("</select></td>");
      		break;
      	case 17: 
      		out.println("<td><input name='destinationWithId' type='text' value='Siège'></input></td>");
      		break;
      default:
    	  	out.println("<td><input name='destinationWithId' type='text'></input></td>");
      } %>
    </tr>
    <tr>
      <td><input type="hidden" name="destination"></td>
      <td><input type="hidden" name="datetoSend_2" value=<% out.println(thisDateSent);%>></td>
      <td><input type="hidden" name="caissesent_2" value=<% out.println(thisCaisseSent);%>></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
            <div align="center">
              <input type="submit" name="Submit" onClick="constructDestinationLabel()" value="Valider">
            </div></td>
      <td><input type="reset" name="Submit2" value="Annuler"></td>
    </tr>
  </table>
  <label><br>
  </label>
  <label></label>
</form>


</body>
</html>