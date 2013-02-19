<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<% Integer userid=(Integer) session.getAttribute("username");
Integer caisseidi=(Integer)session.getAttribute("caisseid");
String srcUrl="main.jsp";
if(userid==null) {
	String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
}

if(caisseidi==0) {
	srcUrl="rapport.jsp";
}
%>
<frameset cols="200,*" border="0" framespacing="0">
	<frame name="menu" src="menu_1.jsp" marginheight="0" marginwidth="0" scrolling="auto" noresize>
	<frame name="maincontent" src=<%=srcUrl%> marginheight="0" marginwidth="0" scrolling="auto" noresize>
 
	 
<noframes>
<p>This section (everything between the 'noframes' tags) will only be displayed if the users' browser doesn't support frames. You can provide a link to a non-frames version of the website here. Feel free to use HTML tags within this section.</p>
</noframes>
 
</frameset>
<body>

</body>
</html>