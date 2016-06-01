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
						Approved User<font color="#447fc8"> Registrations <i class="fa fa-check"></i></font>
					
					</div>
					<% if(request.getAttribute("success_message") != null) { 
						String message = (String)request.getAttribute("user_name");                   
                   		out.print("<center><div class=\"alert alert-warning voffset2\"><h4>You have successfully updated user with ID: "+ message +"</h4></div></center>");
					
					}					
					else if (request.getAttribute("update_fail_message") != null) { 
						
						String message = (String)request.getAttribute("user_name");                   
                  		out.print("<center><div class=\"alert alert-danger voffset2\"><h4>Update failed for user: "+ message +"</h4></div></center>");

					 } %>
					<div class="row">

						<%
						@SuppressWarnings("unchecked") 
						Map<String, UserDetailsBean> approved_user_dt = (Map<String, UserDetailsBean>) request.getAttribute("approved_user_details");			
                 		
						%>

						<%
					Iterator<Map.Entry<String, UserDetailsBean>> it = approved_user_dt.entrySet().iterator();
              		 int i=0;
              		if(!it.hasNext()) {
						%>
						<center>
						<div class="alert alert-success voffset4" style="display:inline;"><i class="fa fa-info-circle"></i> No Approved Registrations</div>
					</center>
						<% 	}else
					while (it.hasNext()) {
						
						++i;
					Map.Entry<String, UserDetailsBean> myentry = it.next();
				%>
						<div class="thumbnail well">

							<div class="cms-element-name" style="padding-top: 15px;">
								<label class="col-md-3"><%=myentry.getValue().getUser_first_name()%></label>

								<button class="btn btn-info col-md-4" data-toggle="modal"
									data-target="#com-rm-modal<%out.print(i);%>">Details <i class="fa fa-info-circle"></i></button>
								<button class="btn btn-danger col-md-4 col-md-offset-1" data-toggle="modal"
									data-target="#com-rm-modal-edit<%out.print(i);%>">
									Edit User <i class="fa fa-pencil-square-o"></i></button>								
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

							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Maximum Claim Amount</label>
									<div class="vpp-content-text">Rs.<%=formatter.format(myentry.getValue().getUser_max_claim_amount())%></div>
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


	<div class="modal fade" id="com-rm-modal-edit<%out.print(j);%>"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div>
				<div class="row col-md-8 col-md-offset-2">
					<div class="registration voffset1">
						<button class="close" aria-hidden="true" data-dismiss="modal">
							<span style="margin-right: 10px; font-size: 20px;">&#10008;</span>
						</button>
						<div align="center">
							<h2>
								User
								<%=myentry.getValue().getUser_first_name()%></h2>
							<form role="form" id="defaultForm<%=j%>"
								class="voffset3 form-horizontal" name="registerPage"
								action="AdminUpdateUser" method="post">

								<div class="col-md-4 voffset1">
									<label>User ID</label>
								</div>
								<div class="form-group col-md-6">
									<input type="text" name="user_id" id="user_id"
										class="form-control" value=<%=myentry.getKey()%> readonly>
								</div>

								<div class="col-md-4 voffset1">
									<label>First Name</label>
								</div>
								<div class="form-group col-md-6">
									<input type="text" name="user_firstname" id="user_firstname"
										class="form-control"
										value="<%=myentry.getValue().getUser_first_name()%>">
								</div>
								<div class="col-md-4 voffset1">
									<label>Last Name</label>
								</div>
								<div class="form-group col-md-6">
									<input class="form-control" type="text" name="user_lastname"
										id="user_lastname"
										value="<%=myentry.getValue().getUser_last_name()%>">
								</div>

								<div class="col-md-4">
									<label>Gender</label>
								</div>
								<div class="form-group col-md-6">
									<select name="user_gender" id="user_gender<%out.print(j);%>"
										class="form-control">
										<option value=<%=myentry.getValue().getUser_gender()%>><%=myentry.getValue().getUser_gender()%></option>
										<option value="Male">Male</option>
										<option value="Female">Female</option>
										<option value="Transgender">Transgender</option>
									</select>
								</div>


								<div class="col-md-4 voffset1">
									<label>Date of Birth</label>
								</div>
								<div class="form-group col-md-6">
								<input class="form-control" type="text" name="user_dob"
										id="datepicker"
										value=<%=myentry.getValue().getUser_dob()%>>
								</div>
								
								<div class="col-md-4 voffset1">
									<label>Address</label>
								</div>
								<div class="form-group col-md-6">
									<textarea name="user_address" id="user_address"
										class="form-control"><%=myentry.getValue().getUser_address()%></textarea>
								</div>

								<div class="col-md-4 voffset4">
									<label>Contact Number</label>
								</div>
								<div class="form-group col-md-6">
									<label></label> <input type="text" maxlength="10" id="user_contact_no"
										name="user_contact_no" class="form-control"
										value=<%=myentry.getValue().getUser_contact_no()%>>
								</div>

								<div class="col-md-4 voffset1">
									<label>Email Address</label>
								</div>
								<div class="form-group col-md-6">
									<input type="email" id="user_email_address"
										name="user_email_address" class="form-control"
										value=<%=myentry.getValue().getUser_email()%>>
								</div>

								<div class="col-md-4" style="margin-top: 15px;">
									<label>Nominee Count</label>
								</div>
								<div class="form-group col-md-6">
									<select name="nominee_count" id="nominee_count<%=j%>"
										class="form-control ">
										<option value=<%=myentry.getValue().getUser_nominee_count()%>
											label=<%=myentry.getValue().getUser_nominee_count()%>><%=myentry.getValue().getUser_nominee_count()%></option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
								</div>


								<div class="col-md-4 voffset4"><label>Insurance Type</label></div>
				<div class="form-group col-md-6">
					<input name="insurance_type" type="text" id="insurance_type<%=j%>" class="form-control" value=<%=myentry.getValue().getUser_insurance_type()%> readonly>
									
				</div>

								<div class="col-md-4 voffset1">
									<label>Insured Amount</label>
								</div>
								<div class="form-group col-md-6" id="test">
									<input type="text" id="insured_amount<%=j%>"
										name="insured_amount" class="form-control"
										value=<%=myentry.getValue().getUser_insured_amount()%> readonly>
								</div>

								<div class="col-md-4 voffset1">
									<label>Max. Claimable Amt</label>
								</div>
								<div class="form-group col-md-6">
									<span id="printvalue"></span> <input type="text"
										id="max_claimable_amount<%=j%>" name="max_claimable_amount"
										class="form-control"
										value=<%=myentry.getValue().getUser_max_claimable_amount()%>>
								</div>								
								
								<div class="col-md-4 voffset1">
									<label>Max. Claim Amount</label>
								</div>
								<div class="form-group col-md-6">
									<span id="printvalue"></span> <input type="text"
										id="max_claim_amount<%=j%>" name="max_claim_amount"
										class="form-control" value=<%=myentry.getValue().getUser_max_claim_amount()%>>
								</div>

								<div class="container-fluid voffset4">
									<div class="col-md-6 col-md-offset-3">
										<input type="submit" class="btn btn-info btn-lg btn-block"
											id="submit-button" name="update" value="Update User">
									</div>
								</div>

							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<%} %>

<script type="text/javascript">

<%
Iterator<Map.Entry<String, UserDetailsBean>> it3 = approved_user_dt.entrySet().iterator();
int k=0;
while (it3.hasNext()) {
	++k;
Map.Entry<String, UserDetailsBean> myentry = it3.next();
%>

$('#user_firstname,#user_lastname').keyup(
		function(event) {
			$(this).val(
					($(this).val().substr(0, 1).toUpperCase())
							+ ($(this).val().substr(1)));
		});

var usedNames = {};
$("select[id='user_gender<%out.print(k);%>'] > option").each(function () {
    if(usedNames[this.text]) {
        $(this).remove();
    } else {
        usedNames[this.text] = this.value;
    }
});

var usedNames2 = {};
$("select[id='nominee_count<%out.print(k);%>'] > option").each(function () {
    if(usedNames2[this.text]) {
        $(this).remove();
    } else {
        usedNames2[this.text] = this.value;
    }
});
 
$(function() {
	$('#user_contact_no').keyup(function() {
		if (this.value.match(/[^0-9]/g)) {
			this.value = this.value.replace(/[^0-9]/g, '');
		}
	});
});

$(document).ready(
				function() {

					$('#defaultForm<%=k%>')
							.formValidation(
									{
										button : {
											selector : '[type="submit"]',
											disabled : ''
										},

										fields : {
											user_firstname : {
												validators : {
													notEmpty : {
														message : 'The first name is required'
													},
													regexp : {
														regexp : /^[A-Z][a-zA-Z ]{2,20}$/,
														message : 'First letter should be caps. Use only alphabets and not more than 20 characters.'
													},
													different : {
														field : 'user_lastname',
														message : 'First letter should be caps. The first name and last name cannot be the same. '
													}
												}
											},
											user_lastname : {
												validators : {
													notEmpty : {
														message : 'The last name is required'
													},
													regexp : {
														regexp : /^[A-Z][a-zA-Z ]{1,20}$/,
														message : 'First letter should be caps. Use only alphabets and not more than 20 characters.'
													},
													different : {
														field : 'user_firstname',
														message : 'The first name and last name cannot be the same. '
													}
												}
											},

											user_gender<%out.print(k);%> : {
												validators : {
													notEmpty : {
														message : 'The gender is required'
													}
												}
											},

											user_dob : {

												validators : {
													notEmpty : {
														message : 'The date is required in yyyy-mm-dd format'
													}
												}
											},

											user_contact_no : {
												validators : {
													notEmpty : {
														message : 'The contact number is required'
													},

													regexp : {
														regexp : /^[789]\d{9}$/,
														message : 'The contact number should be of 10 Digits only & a valid mobile number.'
													}
												}
											},

											user_address : {
												validators : {
													notEmpty : {
														message : 'Fill your address'
													},
													regexp : {
														regexp : /^[a-zA-Z0-9#()_|\\,./&: -]*$/,

														message : 'The address should have digits and alphabets.'
													},
													stringLength : {
														min : 10,
														max : 100,
														message : 'Address should be minimum 10 characters and maximum 100 characters'
													}

												}

											},

											insurance_type : {
												validators : {
													notEmpty : {
														message : 'Type of insurance is required'
													}
												}
											},

											nominee_count<%out.print(k);%> : {
												validators : {
													notEmpty : {
														message : 'Number of Nominees is required'
													}
												}
											},

											insured_amount : {
												validators : {
													notEmpty : {
														message : 'Insurance amount not entered'
													}
												}
											},

											user_email_address : {
												validators : {
													notEmpty : {
														message : 'The email address is required'
													},
													emailAddress : {
														message : 'The input is not a valid email address'
													},
													regexp : {
														regexp : /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/,
														message : 'The email should be of format abc@xyz.com'
													}
												}
											},

											user_password : {
												validators : {
													notEmpty : {
														message : 'The password is required'
													},
													different : {
														field : 'user_firstname',
														message : 'The password cannot be the same as username. '
													},
													stringLength : {
														min : 8,
														max : 20,
														message : 'The password must >6 and <12 characters. '
													},
													regexp : {
														regexp : /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[$@!*%?&]).{6,20}$/,
														message : 'The password should have a Uppercase, Lowercase, Number & Special Character,'
													}
												}
											},

											user_repassword : {
												validators : {
													notEmpty : {
														message : 'The password is required.'
													},
													identical : {
														field : 'user_password',
														message : ' The password should be same'
													}
												}
											}
										}
									});
				});

$(function() {
	var dt = new Date();
	dt.setFullYear(new Date().getFullYear() - 18);
	$('#datepicker').datepicker({
		format : 'yyyy-mm-dd',
		endDate : dt,
		autoclose : true
	});
});
<%}%>
 </script>
	<script
		src="<%=request.getContextPath()%>/resources/js/adminAjaxDataLoad.js"></script>
	<%@include file="adminfooter.jsp"%>