<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% 	
Integer username=(Integer) session.getAttribute("username");
if(username!=null) {
session.invalidate();
}	
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CM</title>
</head>
<body>

<form  name="Getpass" action="checkpassword.jsp" method=POST>

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="480" align="left" valign="top" bgcolor="#ffffff">
			<table width="50%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td align="center">&nbsp;</td>
				</tr>
			</table>
 
			<table width="50%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="bluetableborder">
				<tr>
					<td colspan="2" align="left" valign="top"
						><span  id="login.label.heading"> Se connecter</span></td>
				</tr>
				<tr>
					<td width="45%" align="left" valign="top"
						style="BORDER-RIGHT: #d7deee 1px solid; PADDING-RIGHT: 10px; PADDING-LEFT: 10px;
					PADDING-BOTTOM: 10px; PADDING-TOP: 10px" bgcolor="#ffffff"><span
						 id="login.label.welcome">Bienvenue dans le gestionnaire caisse <br>
					<br>
					</span><br>
					</td>
 
					<td width="55%" align="left" valign="top"
						style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px">
					<table width="100%" border="0" cellpadding="3" cellspacing="0">
					   <tr><td colspan="2">
						<font ><span id="login.error.message"></span></font></td></tr>
						<tr class="fontnormal">
							<td width="33%" align="right"><span id="login.label.username">Nom d'utilisateur</span>:</td>
							<td width="67%"><input type="text" name="userName" value="" id="login.input.username"></td>
						</tr>
 
						<tr class="fontnormal">
							<td align="right">
                        <span id="login.label.password">Mot de passe</span>:</td>
							<td><input type="password" name="password" value="" id="login.input.password"></td>
						</tr>
						<tr class="fontnormal">
							<td align="right"></td>
 
							<td><br>
							<input type="submit" value="Se connecter" id="login.button.login" >
							<input type="hidden" name="method" value="login">
						</tr>
					</table>
					<br>
					</td>
				</tr>
			</table>
			<br>
			</td>
		</tr>
	</table>
		
</form>
</body>
</html>