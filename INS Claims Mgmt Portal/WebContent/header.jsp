<%
response.setHeader("Pragma","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Expires","0"); 
response.setDateHeader("Expires",-1);
response.setHeader("Access-Control-Allow-Origin","*");
%>

<%
if(session.getAttribute("admin_name") != null){ 
	
	response.sendRedirect("admin-panel/admin_dashboard");
}
else if(session.getAttribute("user_name") != null){
	response.sendRedirect("member-panel/user_dashboard");
}
else {}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insurance Claims Management System</title>
<link rel="shortcut icon" sizes="16x16" href="<%=request.getContextPath()%>/resources/images/favicon.ico" />	
<!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/formValidation.css" type="text/css" rel="stylesheet">
<%-- <link href="<%=request.getContextPath()%>/resources/css/bootstrap-datepicker.min.css" type="text/css" rel="stylesheet"> --%>
<!-- JQUERY -->
<script	src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<header class="container-fluid navbar navbar-fixed-top headerbar">
	<div class="row col-md-offset-1 col-md-pull-1">
		<a class="navbar-brand" rel="home" href="index.jsp" title=""> <img
			style="max-width: 185px; min-height: 48px; margin-top: -9px;"
			src="<%=request.getContextPath()%>/resources/images/logo.png">
		</a>
	</div>
</header>