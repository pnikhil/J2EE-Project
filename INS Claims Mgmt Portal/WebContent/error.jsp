<%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error!</title>
</head>
<body>

<div class="row col-md-6 col-md-offset-3 voffset2">
            <div class="signinbar">
                <div align="center">
                    <h1>${pageContext.errorData.statusCode} Error!</h1>
                    <div class="btn-container voffset1">
                    <div><h4>This page doesn't exist</h4></div>   <br />                     
                       	<div><b>Request URI:</b> ${pageContext.request.scheme}://${header.host}${pageContext.errorData.requestURI}</div>                    	
                    </div>
                    
                    <div class="btn-container voffset1">
                        <a class="btn btn-danger btn-signin" href="<%=request.getContextPath()%>">Go to Homepage</a>
                    </div>
                </div>
            </div>
        </div>

</body>
<%@ include file="footer.jsp" %>