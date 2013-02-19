<%@ page language="java" %>
<HTml>
<HEAD><TITLE>Display file upload form to the user</TITLE></HEAD>  
<% //  for uploading the file we used Encrypt type of multipart/form-data and input of file type to browse and submit the file %>
  <BODY> <FORM  ENCTYPE="multipart/form-data" ACTION="commit_add_report.jsp" METHOD=POST>
		<br><br><br>
	  <center><table border="0" >
                    <tr><center><td colspan="2"><p align="center"><B>Ajouter rapport</B><center></td></tr>
                    <tr><td><b>Choisissez un fichier:</b></td>
                    <td><INPUT NAME="F1" TYPE="file"></td></tr>
                    <tr><td><b>Libellé du rapport:</b></td>
                    <td><INPUT NAME="F2" TYPE="text"></td></tr>
                    <tr><td><b>Activer export excel:</b></td>
                    <td><INPUT NAME="F3" TYPE="CHECKBOX"></td></tr>
                    <tr><td><b>Activer traitement paramètres:</b></td>
                    <td><INPUT NAME="F4" TYPE="CHECKBOX"></td></tr>
					<tr><td colspan="2"><p align="right"><INPUT TYPE="submit" VALUE="Envoyer Fichier" ></p></td></tr>
             <table>
     </center>      
     </FORM>
</BODY>
</HTML>