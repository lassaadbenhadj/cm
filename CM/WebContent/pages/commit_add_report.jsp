<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="com.enda.caissemanager.database.addreport"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%
	//to get other parameters
	String rpt_name="";
	String rpt_lbl="";
	String rpt_F3="";
	String rpt_F4="";
	byte rpt_param = 0;
	byte rpt_xls =0;
	DiskFileUpload fileub=new DiskFileUpload();
	List items =fileub.parseRequest(request);
	
	Iterator itr = items.iterator();

	while(itr.hasNext()) {
		FileItem item = (FileItem) itr.next();
	    
		// check if the current item is a form field or an uploaded file
		if(item.isFormField()) {
	            
		// get the name of the field
		String fieldName = item.getFieldName();
		out.println(fieldName);
			if(fieldName.equals("F2")){
				rpt_lbl=item.getString();
		
			} 
			if(fieldName.equals("F3")){
				rpt_F3=item.getString();
		
			} 
			
			if(fieldName.equals("F4")){
				rpt_F4=item.getString();
		
			} 

		}
		else {

		File fullFile  = new File(item.getName());  
		out.println(item.getName()); 
		rpt_name=item.getName();
		File savedFile = new File(getServletContext().getRealPath("/report"),fullFile.getName());
		item.write(savedFile);
	}
		}
	
		out.println(rpt_F3);
		if (rpt_F3!="") {
			rpt_xls = 1;
		}
		if (rpt_F4!="") {
			rpt_param = 1;
		}

	
	
		//persisting in the DB
		addreport adr = new addreport();
		adr.rpt_name=rpt_name;
		adr.rpt_label=rpt_lbl;
		adr.rpt_param_num=rpt_param;
		adr.rpt_xls=rpt_xls;
		adr.insertreport();
		//showing the susses message
		%><Br><table border="2"><tr><td><b>You have successfully ---upload the file by the name of:</b>
		<% out.println("d"); %></td></tr></table> <%
		
%>
