<%
if(session.getAttribute("user_name") == null){ %> 
	  <%  String redirectURL = request.getContextPath();
	  response.sendRedirect(redirectURL);
}
%>
<footer class="navbar navbar-default navbar-fixed-bottom">
	<div class="container" style="margin-top:-10px;">
		<p class="navbar-text pull-left">� 2016 - Insurance Claims Management System</p>
	</div>
</footer>

</html>