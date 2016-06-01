<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.mfrp.beans.UserDetailsBean"%>
<%@page import="java.util.Map"%>
<%@include file="adminheader.jsp"%>

<body>
	<div class="container cms-contentdiv col-md-9 ">
		<div class="row">

			<div class="col-sm-10 col-md-offset-3">
				<!-- start of companies div -->
				<div class="cms-element thumbnail">
					<div class="cms-heading">
						Registered User<font color="#447fc8"> Details <i class="fa fa-users"></i></font>
					</div>

					<div class="row well">
						
							<div class="cms-element-name col-md-3">

								<form method="post" action="PendingUsers">
									<input type="submit" class="btn btn-warning" value="View Pending Users">
								</form>
							</div>
							<div class="cms-element-name col-md-3 col-md-offset-1">
								<form method="post" action="AllUsers">
									<input type="submit" class="btn btn-success" value="Approved Registrations">
								</form>
							</div>
							
							<div class="cms-element-name col-md-3 col-md-offset-1">
								<form method="post" action="RejectedUsers">
									<input type="submit" class="btn btn-danger" value="Rejected Registrations">
								</form>
							</div>

						
					</div>

					<div class="cms-heading voffset3">
						User Claim<font color="#447fc8"> Details <i class="fa fa-file-text-o"></i></font>
					</div>
					<div class="row well">
						<div class="cms-element-name col-md-3">

								<form method="post" action="PendingClaimsForApproval">
									<input type="submit" class="btn btn-warning col-md-offset-3" value="Pending Claims">
								</form>
							</div>
							<div class="cms-element-name col-md-3 col-md-offset-1">
								<form method="post" action="ApprovedUserClaims">
									<input type="submit" class="btn btn-success" value="Approved Claims">
								</form>
							</div>
							
							<div class="cms-element-name col-md-3 col-md-offset-1">
								<form method="post" action="RejectedUserClaims">
									<input type="submit" class="btn btn-danger" value="Rejected Claims">
								</form>
							</div>
					</div>
					
					<div class="cms-heading voffset3">
						Final Claim<font color="#447fc8"> Options <i class="fa fa-bar-chart"></i></font>
					</div>
					<div class="row well">
						<div class="cms-element-name col-md-4 col-md-offset-2">

							<form method="post" action="FinalClaimProcess">
								<input type="submit" class="btn  btn-primary"
									value="Final Claim Process">
							</form>
						</div>
						<div class="cms-element-name col-md-4">
							<form method="post" action="FinalApprovedClaims">
								<input type="submit" class="btn  btn-info"
									value="Final Approved Claims">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<%@include file="adminfooter.jsp"%>