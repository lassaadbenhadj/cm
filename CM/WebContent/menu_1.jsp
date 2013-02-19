<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%>
<%@ page import ="java.io.*"%>
<%@ page import="com.enda.caissemanager.database.datapresentation"%>

<html>
<head>
<title>HTML Frames Example - Menu 1</title>
<style type="text/css"> 
body {
	font-family:verdana,arial,sans-serif;
	font-size:10pt;
	margin:10px;
	background-color:#BAD11E;
	}
</style>

</head>
<body>

<% Integer userid=(Integer) session.getAttribute("username");
Integer caisseidi=(Integer)session.getAttribute("caisseid");
Integer role_id=(Integer)session.getAttribute("roleid");
String srcUrl="main.jsp";
if(userid==null) {
	String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
    
}
datapresentation dpt = new datapresentation();
String nameuser=dpt.getpersoname(userid);
String rolename=dpt.getrolename(role_id);
String caissename=dpt.getcaissename(userid);
out.println("Bienvenue: " + nameuser);
out.println("<BR>Votre rôle est : " + rolename);
if (caissename!="") {
	out.println("<BR>Vous êtes affecté à la caisse: " + caissename);
}
out.println("<h3>Menu</h3>");
if(caisseidi!=0) {
	out.println("<a href='main.jsp' target='maincontent'>Operations</a><br />");
	out.println("<a href='rapport.jsp' target='maincontent'>Rapports</a><br />");
	out.println("<a href='update_caissier_2.jsp' target='maincontent'>Changer caisse</a><br/>");
	if (role_id==1) {
		out.println("<a href='admin_page.jsp' target='maincontent'>Admin</a><br />");
	}
	
}
else {
	out.println("<a href='rapport.jsp' target='maincontent'>Rapports</a><br />");
	if (role_id==1) {
		out.println("<a href='admin_page.jsp' target='maincontent'>Admin</a><br />");
		}
	}
out.println("<a href='login.jsp' target='content'>se déconnecter</a><br />");
%>
</body>
</html>