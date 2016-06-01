<%@page import="java.util.*,java.text.*,java.io.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Claim Document</title>
</head>
<body>
<% String filename = request.getParameter("document_name"); 
	String user_id = request.getParameter("user_id");
	String request_date = request.getParameter("request_date"); 
	String claim_reason = request.getParameter("claim_reason");
	String format = "";
	StringTokenizer st = new StringTokenizer(filename,".");
	/* ServletOutputStream stream = null;
	BufferedInputStream buf = null; */
	while(st.hasMoreTokens())
	{
		format = st.nextToken();
	}
	String file_link = request.getContextPath()+"/resources/"+ user_id.toUpperCase() +"/" + request_date + "-" + claim_reason + "/" + filename;
	
	if(format.equals("jpg") || format.equals("jpeg")){
	%>
		<img src =<%=file_link%> />
	
	<% } %>
		
	
</body>
</html>