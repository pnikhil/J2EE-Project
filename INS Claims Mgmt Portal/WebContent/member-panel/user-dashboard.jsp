<%@ include file="userheader.jsp" %>
<%@ page import="com.mfrp.servlets.*" %>
<%-- <%
System.out.println(session.getAttribute("user_name"));
if(session.getAttribute("user_name") == null){ %> 
	  <%  String redirectURL = request.getContextPath();
	  response.sendRedirect(redirectURL);
}
%> --%>
<body>
<div class="container cms-contentdiv col-md-9 ">
          <div class="row">
              
              <div class="col-sm-10 col-md-offset-3"> <!-- start of companies div -->
                  <div class="cms-element thumbnail">
                    <div class="cms-heading" style="font-variant:small-caps";>User Registration<font color="#447fc8"> Details</font></div>
                      
                          <div class="row well">
						
							<div class="cms-element-name col-md-5 col-md-offset-1">

								<form method="post" action="UserDetails">
									<input type="submit" class="btn btn-lg btn-info"
										value="View your Details">
								</form>
							</div>
							<div class="cms-element-name col-md-5 col-md-offset-1">
								<form method="post" action="UserUpdateProfile">
									<input type="submit" class="btn btn-lg btn-danger"
										value="Update your Profile">
								</form>
							</div>
						</div>  
						<div class="cms-heading voffset3">
						User Claim<font color="#447fc8"> Details</font>
					</div>
					<div class="row well">
						<div class="cms-element-name  col-md-5 col-md-offset-1">

							<form method="post" action="UserClaimRequest">
								<input type="submit" class="btn btn-lg btn-warning"
									value="New Claim Request">
							</form>
						</div>
						<div class="cms-element-name col-md-5 col-md-offset-1">
							<form method="post" action="UserClaimStatus">
								<input type="submit" class="btn btn-lg btn-success"
									value="View Claim Status">
							</form>
						</div>
					</div>                     
                                </div>
                            </div>   
                  </div>
              </div>
</body>
<%@ include file="userfooter.jsp" %>