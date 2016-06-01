<%
if(session.getAttribute("user_name") != null)
{
	request.getSession().invalidate();
	request.getRequestDispatcher("../index?val=Successfully Logged out").forward(request, response);
}
else 
{
response.sendRedirect("../index");	
}
%>
