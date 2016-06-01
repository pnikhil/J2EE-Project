<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.mfrp.beans.UserDetailsBean"%>
<%@page import="java.util.Map"%>

<%@ include file="userheader.jsp" %>
<%@ page import="com.mfrp.servlets.*" %>

<body>


 <div class="container cms-contentdiv col-md-9 ">
          <div class="row">
            <% 
            @SuppressWarnings("unchecked")
            Map<String, UserDetailsBean> user_dt = (Map<String, UserDetailsBean>) request.getAttribute("user_details");			
       		%>
                    
         	<%
     				Iterator<Map.Entry<String, UserDetailsBean>> it2 = user_dt.entrySet().iterator();      				
					while (it2.hasNext()) {
					Map.Entry<String, UserDetailsBean> myentry = it2.next();
			%>
              
              <div class="col-sm-10 col-md-offset-3"> <!-- start of companies div -->
                  <div class="cms-element thumbnail">
                    <div class="cms-heading" style="font-variant: small-caps;"><%=myentry.getValue().getUser_first_name()%> <font color="#447fc8"> Details Update</font></div>
                      <% if(request.getAttribute("success_message") != null) {                   
                  			 out.print("<center><div class=\"alert alert-warning voffset2\"><h4>You have successfully updated your Profile</h4></div></center>");  
                      }
                  			 else if(request.getAttribute("user_update_fail") != null){
                  				out.print("<center><div class=\"alert alert-danger voffset2\"><h4>Profile Update failed</h4></div></center>");                     
                  			 
                       } %> 
                          
                          <div class="row">
    
    <!-- <div class="registration voffset1"> -->
						
			<div align="center">
			
		<form role="form" id="defaultForm" class="voffset4 form-horizontal" name="userupdateprofile" action="UserProfileUpdateToDB" method="post">			
				
				<div class="col-md-4 voffset1"><label>User ID</label></div>
				<div class="form-group col-md-6">				
					<input type="text"
						name="user_id" id="user_id" class="form-control" 
						value=<%=myentry.getKey()%> readonly>
				</div>
				
				<div class="col-md-4 voffset1"><label>First Name</label></div>
				<div class="form-group col-md-6">				
					<input type="text"
						name="user_firstname" autocomplete="off" autofocus id="user_firstname" class="form-control" 
						value="<%=myentry.getValue().getUser_first_name()%>">
				</div>
				<div class="col-md-4 voffset1"><label>Last Name</label></div>
				<div class="form-group col-md-6">
					<input class="form-control" type="text" autocomplete="off" name="user_lastname" id="user_lastname" value="<%=myentry.getValue().getUser_last_name()%>">
				</div>				
				
				<div class="col-md-4"><label>Gender</label></div>
				<div class="form-group col-md-6">
					<select name="user_gender" id="user_gender" class="form-control ">
						<option value=<%=myentry.getValue().getUser_gender()%>><%=myentry.getValue().getUser_gender()%></option>					
						<option value="Male">Male</option>
						<option value="Female">Female</option>
						<option value="Transgender">Transgender</option>						
					</select>
				</div>
				
				
				<div class="col-md-4 voffset1"><label>Date of Birth</label></div>
								<div class="form-group col-md-6">													
						<input type="text" autocomplete="off" name="user_dob" class="form-control" value=<%=myentry.getValue().getUser_dob()%> id=datepicker >
						</div>
								
				
				<div class="col-md-4 voffset1"><label>Address</label></div>
				<div class="form-group col-md-6">					
					<textarea name="user_address" id="user_address" class="form-control"><%=myentry.getValue().getUser_address()%></textarea>						
				</div>
				
				<div class="col-md-4 voffset4"><label>Contact Number</label></div>
				<div class="form-group col-md-6">
					 <input type="text" maxlength="10" autocomplete="off" id="user_contact_no" name="user_contact_no"
						class="form-control" value=<%=myentry.getValue().getUser_contact_no()%>>
				</div>
				
				<div class="col-md-4 voffset1"><label>Email Address</label></div>
				<div class="form-group col-md-6">
					<input type="email" id="user_email_address" autocomplete="off" name="user_email_address" class="form-control" value=<%=myentry.getValue().getUser_email()%>>
				</div>
				
				<div class="col-md-4"  style="margin-top:15px;"><label>Nominee Count</label></div>
				<div class="form-group col-md-6">
					<select name="nominee_count" id="nominee_count" class="form-control ">
						<option value=<%=myentry.getValue().getUser_nominee_count()%> label=<%=myentry.getValue().getUser_nominee_count()%>><%=myentry.getValue().getUser_nominee_count()%></option>					
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>						
					</select>
				</div>	
						
				 <div class="col-md-4 voffset4"><label>Insurance Type</label></div>
				<div class="form-group col-md-6">
					 <input name="insurance_type" type="text" id="insurance_type" class="form-control" value=<%=myentry.getValue().getUser_insurance_type()%> readonly>
									
				</div>
				
				<div class="col-md-4 voffset1"><label>Insured Amount</label></div>
				<div class="form-group col-md-6" id="test">
					<input type="text" id="insured_amount" autocomplete="off" onchange="loadXMLDoc()" name="insured_amount"
						class="form-control" value=<%=myentry.getValue().getUser_insured_amount()%> readonly>
				</div>
				
				<div class="col-md-4 voffset1"><label>Max. Claimable Amt</label></div>
				<div class="form-group col-md-6"><span id="printvalue"></span>
					<input type="text" id="max_claimable_amount" name="max_claimable_amount"
						class="form-control" value=<%=myentry.getValue().getUser_max_claimable_amount()%> readonly>
				</div>
				
				<div class="col-md-4 voffset1"><label>Max. Claim Amount</label></div>
				<div class="form-group col-md-6"><span id="printvalue"></span>
					<input type="text" id="max_claim_amount" name="max_claim_amount"
						class="form-control" value=<%=myentry.getValue().getUser_max_claim_amount()%> readonly>
				</div>
				
				<!-- <div class="col-md-4 voffset1"><label>Password</label></div>
				<div class="form-group col-md-6">
					 <input type="password"
						 name="user_password" id="user_password"
						class="form-control" 
						placeholder="Enter Password">
				</div>

				<div class="col-md-4"><label>Re-enter Password</label></div>
				<div class="form-group col-md-6">
					<input type="password"
						 name="user_repassword" id="user_repassword"
						class="form-control" 
						placeholder="Re-Enter Password">
				</div> -->
				
				<div class="container-fluid voffset4">
					<div class="col-md-6 col-md-offset-3">						
							<input type="submit" class="btn btn-success btn-lg btn-block" id="submit-button" name="update" value="Update My Details">
					</div>
				</div>
			
			</form>
	</div>
<!-- </div> -->     
                              </div>
                        </div>   
                  </div>
             </div>
       <%} %>
       </div>
</body>
<script type="text/javascript">
$('#user_firstname,#user_lastname').keyup(
		function(event) {
			$(this).val(
					($(this).val().substr(0, 1).toUpperCase())
							+ ($(this).val().substr(1)));
		});

var found = [];
$("select option").each(function() {
  if($.inArray(this.value, found) != -1) $(this).remove();
  found.push(this.value);
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

					$('#defaultForm')
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

											user_gender : {
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

											nominee_count : {
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
 
 </script>
 	
<%@ include file="userfooter.jsp" %>