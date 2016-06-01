<%@ include file="header.jsp"%>
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
						<p>Maximum Claimable Amount Rule</p>

					</div>

					<div class="cms-modal-content">

						<div class="row">

							<ul class="col-md-offset-1">
								<li><p>For Vehicle Insurance, Maximum Claimable Amount
										is 80% of Total Insurance Coverage</p></li>
								<li><p>For Home Insurance, Maximum Claimable Amount is
										91% of Total Insurance Coverage</p></li>
								<li><p>For Life Insurance, Maximum Claimable Amount is
										100% of Total Insurance Coverage</p></li>
							</ul>

						</div>
					</div>

					<div class="cms-modal-content">
						<button aria-hidden="true" data-dismiss="modal"
							class="btn btn-primary btn-block cms-modal-btn">
							Close <i class="fa fa-times fa-2x"></i>
						</button>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid bottom-margin">
		<div class="row col-md-8 col-md-offset-2 voffset2">
			<div class="registration">
				<a href="#" class="label label-default cms-appliedusers"
					onclick="goBack()" style="font-variant: small-caps;"
					id="OptionsBox">Go Back <i class="fa fa-arrow-left"></i></a>
				<div align="center">
					<h2>User Registration</h2>
					<form role="form" id="defaultForm" class="voffset3 form-horizontal"
						name="registerPage" action="UserRegistration" method="post">
						<div class="col-md-4 voffset1">
							<label>First Name <span class="mandatory">*</span></label>
						</div>
						<div class="form-group col-md-6">
							<input type="text" name="user_firstname" maxlength="20"
								autocomplete="off" id="user_firstname" class="form-control"
								autofocus placeholder="First Name">
						</div>
						<div class="col-md-4 voffset1">
							<label>Last Name <span class="mandatory">*</span></label>
						</div>
						<div class="form-group col-md-6">
							<input class="form-control" maxlength="20" autocomplete="off"
								type="text" name="user_lastname" id="user_lastname"
								placeholder="Last Name">
						</div>

						<div class="col-md-4" style="margin-top: 10px;">
							<label>Gender <span class="mandatory">*</span></label>
						</div>
						<div class="form-group col-md-6">
							<select name="user_gender" id="user_gender" class="form-control ">
								<option value="" label="Select Gender"></option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
								<option value="transgender">Transgender</option>
							</select>
						</div>


						<div class="col-md-4 voffset1">
							<label>Date of Birth <span class="mandatory">*</span></label>
						</div>
						<div class="form-group col-md-6">
							<input type="text" name="user_dob" autocomplete="off"
								class="form-control" placeholder="DD-MM-YYYY" id=datepicker>

						</div>



						<div class="col-md-4 voffset1">
							<label>Address <span class="mandatory">*</span></label>
						</div>
						<div class="form-group col-md-6">
							<textarea style="resize: none;" name="user_address" maxlength="100" id="user_address"
								class="form-control" rows="3" placeholder="Enter Address"></textarea>
						</div>

						<div class="col-md-4 voffset4">
							<label>Mobile Number <span class="mandatory">*</span></label>
						</div>
						<div class="form-group col-md-6">
							<label></label> <input type="text" autocomplete="off"
								id="user_contact_no" maxlength="10" name="user_contact_no"
								class="form-control" placeholder="Enter Mobile Number">
						</div>

						<div class="col-md-4 voffset1">
							<label>Email Address <span class="mandatory">*</span></label>
						</div>
						<div class="form-group col-md-6">
							<input type="email" id="user_email_address" maxlength="25"
								onchange="emailexists()" autocomplete="off"
								name="user_email_address" class="form-control"
								placeholder="Enter Email Address"> <span
								id="emailexists" class="mandatory"></span>
						</div>



						<div class="col-md-4" style="margin-top: 15px;">
							<label>Nominee Count<span class="mandatory">*</span></label>
						</div>
						<div class="form-group col-md-6">
							<select name="nominee_count" id="nominee_count"
								class="form-control ">
								<option value="" label="Select Count">Nominee Count</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
						</div>


						<div class="col-md-4 voffset4" style="margin-top: 30px;">
							<label>Insurance Type <span class="mandatory">*</span></label>
						</div>
						<div class="form-group col-md-6">
							<label></label> <select name="insurance_type" id="insurance_type"
								class="form-control ">
								<option value="" label="Select Insurance"></option>
								<option value="Vehicle">Vehicle</option>
								<option value="Home">Home</option>
								<option value="Life">Life</option>
							</select>
						</div>
						<div id="insurance_cov">
							<div class="col-md-4 voffset1">
								<label>Insurance Coverage</label>
							</div>
							<div class="form-group col-md-6" id="test">
								<input type="text" id="insured_amount" autocomplete="off" name="insured_amount"
									class="form-control" placeholder="Insured Amount">
							</div>
						</div>
						<div class="col-md-4 voffset1">
							<label>Maximum Claimable Amount</label>
						</div>
						<div class="form-group col-md-6">
							<span id="printvalue"></span> <input type="text"
								id="max_claimable_amount" name="max_claimable_amount"
								class="form-control" placeholder="Max. Claimable Amt" readonly>
						</div>
						<h3>
							<span class="mandatory"><i data-toggle="modal" data-target="#com-rm-modal"
								class="col-md-1 fa fa-info-circle voffset1"></i></span>
						</h3>

						<div class="col-md-4 voffset1">
							<label>Password <span class="mandatory">*</span></label>
						</div>
						<div class="form-group col-md-6">
							<input type="password" name="user_password"
								onkeypress="capLock(event)" autocomplete="off"
								id="user_password" class="form-control"
								placeholder="*********">
							<div id="capsOn" class="label label-danger voffset1"
								style="visibility: hidden">CAPS LOCK IS ON</div>
						</div>

						<div class="col-md-4 voffset1">
							<label>Re-enter Password <span class="mandatory">*</span></label>
						</div>
						<div class="form-group col-md-6">
							<input type="password" name="user_repassword"
								onkeypress="capLock(event)" autocomplete="off"
								id="user_repassword" class="form-control"
								placeholder="*********">

						</div>
						<div class="container-fluid voffset4">
							<div class="col-md-6">
								<input type="submit" class="btn btn-warning btn-block"
									id="submit-button" name="signup" value="Sign up">
							</div>

							<div class="col-md-6">
								<input type="reset" value="Reset"
									class="btn btn-success btn-block">
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>

	</div>

	<script
		src="<%=request.getContextPath()%>/resources/js/registerValidation.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/ajaxDataLoad.js"></script>
</body>
<%@ include file="footer.jsp"%>