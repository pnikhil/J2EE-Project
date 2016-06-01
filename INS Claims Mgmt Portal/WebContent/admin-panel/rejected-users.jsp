<%@page import="java.util.*,java.text.*"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.mfrp.beans.UserDetailsBean"%>
<%@page import="java.util.Map"%>
<%@include file="adminheader.jsp"%>
<style type="text/css">
div:empty {
	display: none;
}
</style>

<body>
	<div class="container cms-contentdiv col-md-9 ">
		<div class="row">

			<div class="col-sm-10 col-md-offset-3">
				<!-- start of companies div -->
				<div class="cms-element thumbnail">
					<div class="cms-heading">					
						<font color=red> Rejected </font>User Details <i class="fa fa-times"></i>
					
					</div>
					<% if(request.getAttribute("success_message") != null) { String message = (String)request.getAttribute("user_name");
                   
                   out.print("<center><div class=\"alert alert-warning voffset2\"><h4>You have successfully updated user with ID: "+ message +"</h4></div></center>");%>

					<% } %>
					<div class="row">

						<%
						@SuppressWarnings("unchecked") 
						Map<String, UserDetailsBean> approved_user_dt = (Map<String, UserDetailsBean>) request.getAttribute("rejected_user_details");			
                 		
				%>

						<%
							Iterator<Map.Entry<String, UserDetailsBean>> it = approved_user_dt.entrySet().iterator();
              				int i=0;
              				if(!it.hasNext()) {
						%>
						<center>
							<div class="alert alert-success voffset4" style="display:inline;"><i class="fa fa-info-circle"></i> No Rejected Users</div>
						</center>
						<% 	} else while (it.hasNext()) {						
															++i;
															Map.Entry<String, UserDetailsBean> myentry = it.next();
						%>
						<div class="thumbnail well">

							<div class="cms-element-name" style="padding-top: 15px;">
								<label class="col-md-3 col-md-offset-2"><%=myentry.getValue().getUser_first_name()%></label>

								<button class="btn btn-info col-md-4 col-md-offset-1" data-toggle="modal"
									data-target="#com-rm-modal<%out.print(i);%>">Details <i class="fa fa-info-circle"></i></button>																
							</div>
						</div>
						<%} %>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%
     				Iterator<Map.Entry<String, UserDetailsBean>> it2 = approved_user_dt.entrySet().iterator();
      				int j=0;
					while (it2.hasNext()) {
						++j;
					Map.Entry<String, UserDetailsBean> myentry = it2.next();
		%>
		
		<% DecimalFormat formatter = new DecimalFormat("##,##,##0"); %>
	<div class="modal fade" id="com-rm-modal<%out.print(j);%>"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="cms-element-modal-container">
					<button class="close" aria-hidden="true" data-dismiss="modal">
						<span style="margin-right: 10px; font-size: 20px;">&#10008;</span>
					</button>
					<div class="cms-modal-name ">
						<p><%=myentry.getValue().getUser_first_name()%></p>

					</div>

					<div class="cms-modal-content">

						<div class="row">


							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Gender</label>
									<div class="vpp-content-text"><%=myentry.getValue().getUser_gender()%></div>
								</div>
							</div>

							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Full Name</label>
									<div class="vpp-content-text"><%=myentry.getValue().getUser_first_name()%>
										<%=myentry.getValue().getUser_last_name()%></div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Email Address</label>
									<div class="vpp-content-text"><%=myentry.getValue().getUser_email()%></div>
								</div>
							</div>

							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Date of Birth</label>
									<div class="vpp-content-text"><%=myentry.getValue().getUser_dob()%></div>
								</div>
							</div>

							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Address</label>
									<div class="vpp-content-text"><%=myentry.getValue().getUser_address()%></div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Contact Number</label>
									<div class="vpp-content-text"><%=myentry.getValue().getUser_contact_no()%></div>
								</div>
							</div>
							
							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Nominee Count</label>
									<div class="vpp-content-text"><%=myentry.getValue().getUser_nominee_count()%></div>
								</div>
							</div>

							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Insurance Type</label>
									<div class="vpp-content-text"><%=myentry.getValue().getUser_insurance_type()%></div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Insured Amount</label>
									<div class="vpp-content-text">Rs.<%=formatter.format(myentry.getValue().getUser_insured_amount())%></div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Maximum Claimable Amount</label>
									<div class="vpp-content-text">Rs.<%=formatter.format(myentry.getValue().getUser_max_claimable_amount())%></div>
								</div>
							</div>

						</div>
					</div>

				</div>
			</div>
		</div>
	</div>


		<%} %>
	<%@include file="adminfooter.jsp"%>