<%@page import="java.util.*,java.text.*"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.mfrp.beans.UserDetailsBean"%>
<%@page import="java.util.Map"%>

<%@ include file="userheader.jsp"%>
<%@ page import="com.mfrp.servlets.*"%>

<body>

	<div class="modal fade" id="com-rm-modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="cms-element-modal-container">
					<button class="close" aria-hidden="true" data-dismiss="modal">
						<span style="margin-right: 10px; font-size: 20px;"><i
							class="fa fa-times fa-2x"></i></span>
					</button>
					<div class="cms-modal-name ">
						<p>Maximum Claim Amount Rule</p>

					</div>

					<div class="cms-modal-content">

						<div class="row">
							<p class="col-md-offset-1">The Maximum claim amount is
								calculated by taking the user total Insured amount as reference.</p>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>Age Category</th>
										<th>Life Insurance (%)</th>
										<th>Home Insurance (%)</th>
										<th>Vehicle Insurance (%)</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td>18-35 Years</td>
										<td>90 %</td>
										<td>84 %</td>
										<td>73 %</td>
									</tr>

									<tr>
										<td>35-60 Years</td>
										<td>95 %</td>
										<td>88 %</td>
										<td>77 %</td>
									</tr>

									<tr>
										<td>>60 Years</td>
										<td>100 %</td>
										<td>91 %</td>
										<td>80 %</td>
									</tr>

								</tbody>

							</table>

						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="container cms-contentdiv col-md-9 ">
		<div class="row">
			<% @SuppressWarnings("unchecked") 
			Map<String, UserDetailsBean> user_dt = (Map<String, UserDetailsBean>) request.getAttribute("user_details");			
       		%>

			<%
     				Iterator<Map.Entry<String, UserDetailsBean>> it2 = user_dt.entrySet().iterator();      				
					while (it2.hasNext()) {
					Map.Entry<String, UserDetailsBean> myentry = it2.next();
			%>

			<div class="col-sm-10 col-md-offset-3">
				<!-- start of companies div -->
				<div class="cms-element thumbnail">
					<div class="cms-heading"><%=myentry.getValue().getUser_first_name()%>
						<font color="#447fc8"> Details</font>
					</div>

					<div class="row">

						<div class="col-sm-6">
							<div class="form-group">
								<label class="vpp-labelname">User ID</label>
								<div class="vpp-content-text" id="id"><%=myentry.getKey()%></div>
							</div>
						</div>

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
								<label class="vpp-labelname">Email Address</label>
								<div class="vpp-content-text"><%=myentry.getValue().getUser_email()%></div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="vpp-labelname">Nominee Count</label>
								<div class="vpp-content-text"><%=myentry.getValue().getUser_nominee_count()%></div>
							</div>
						</div>


						<% DecimalFormat formatter = new DecimalFormat("##,##,##0"); %>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="vpp-labelname">Maximum Claim Amount <i
									style="color: red;" data-toggle="modal"
									data-target="#com-rm-modal" class="fa fa-info-circle"></i></label>
								<div class="vpp-content-text"><%=formatter.format(myentry.getValue().getUser_max_claim_amount())%></div>
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
								<div class="vpp-content-text"><%=formatter.format(myentry.getValue().getUser_insured_amount())%></div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="vpp-labelname">Maximum Claimable Amount</label>
								<div class="vpp-content-text"><%=formatter.format(myentry.getValue().getUser_max_claimable_amount())%></div>
							</div>
						</div>
						<div class="container-fluid voffset4">
							<div class="col-md-6 col-md-offset-3">
								<a href="UserUpdateProfile"
									class="btn btn-info btn-lg btn-block">Update/Edit Profile</a>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<%} %>
	</div>
</body>
<%@ include file="userfooter.jsp"%>