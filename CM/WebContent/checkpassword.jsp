<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.enda.caissemanager.encryptionfunc.PasswordHashing"%>
<%@ page import="com.enda.caissemanager.connection.ConnectionBase"%>
<%@ page import="com.enda.caissemanager.connection.LienBase"%>
<%@ page import="com.enda.caissemanager.database.communicatewithDb"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>verification mot de passe</title>
</head>
<body>
<% 
Statement statement = null;
ResultSet rs = null;
Connection cnx;
ConnectionBase TestCnx = new ConnectionBase();
cnx= TestCnx.getCnx();
String UserName=request.getParameter("userName"); 
String PassWordy=request.getParameter("password"); 
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
      String Sqlstr="SELECT * FROM PERSONNEL LEFT JOIN PERSONNEL_ROLE USING(PERSONNEL_ID) WHERE LOGIN_NAME='" + UserName + "'";
      rs=statement.executeQuery(Sqlstr);
	  }
	  catch(Exception e)
	  {
		   out.println("<font color=red>Erreur Dans l'operation De recherche de mot de passe</font>"); 
	   }
	 
PasswordHashing PH = new PasswordHashing();

if (rs.next()==false) {
	out.println("<font color=blue>le nom d'utilisateur: " + UserName + " n'existe pas dans la base mifos</font><BR>");
	out.println("<BR><a href='login.jsp'> Retour � la page de connexion </>");
}
else {
	Boolean testresult= PH.verifyPassword(PassWordy,rs.getBytes("password"));
	//out.println("<font color=blue>le mot de passe est:" + testresult + "</font>");
	
	if (testresult) {
		
		communicatewithDb cdb= new communicatewithDb();
		int caisse = cdb.getcaisseID(rs.getInt("PERSONNEL_ID"));
		int cm_role = cdb.getRoleID(rs.getInt("PERSONNEL_ID"));
			//if ((caisse != 0) || (caisse==0 && rs.getInt("ROLE_ID")==1)) {
				session.setAttribute("username",rs.getInt("PERSONNEL_ID"));
				session.setAttribute("caisseid",caisse);
				session.setAttribute("roleid",cm_role);
				out.println("redirecting to operation page");
				String redirectURL = "main_frame.jsp";
	    		response.sendRedirect(redirectURL);
			//}
		//else {
			//out.println("<BR>caissier non configur�");
			//out.println("<BR>" + caisse );
			//out.println(rs.getInt("ROLE_ID"));
			//out.println("<BR><a href='login.jsp'> Retour � la page de connexion </>");
		//}
	}
	else {
		out.println("<BR> le mot de passe est faux");
		out.println("<BR><a href='login.jsp'> Retour � la page de connexion </>");
	}
}

%>

</body>
</html>