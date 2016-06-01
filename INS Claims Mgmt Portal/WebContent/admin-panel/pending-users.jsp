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
						Pending Registration<font color="#447fc8"> Approvals</font>
					</div>

					<div class="row">

				<%
				@SuppressWarnings("unchecked") 
						Map<String, UserDetailsBean> user_dt = (Map<String, UserDetailsBean>) request.getAttribute("user_details");			
                 		
				%>

		<%
					Iterator<Map.Entry<String, UserDetailsBean>> it = user_dt.entrySet().iterator();
              		 int i=0;
              		if(!it.hasNext()) {
						%>
						<center>
						<div class="alert alert-success voffset4" style="display:inline;"><i class="fa fa-info-circle"></i> No Pending Registrations</div>
					</center>
						<% 	}else
					while (it.hasNext()) {						
						++i;
					Map.Entry<String, UserDetailsBean> myentry = it.next();
				%>
						<div class="thumbnail well">

							<div class="cms-element-name" style="padding-top: 15px;">
								<label class="col-md-3"><%=myentry.getValue().getUser_first_name()%></label>


								<button class="btn btn-info col-md-2" data-toggle="modal"
									data-target="#com-rm-modal<%out.print(i);%>">Details <i class="fa fa-info-circle"></i></button>
								<button class="btn btn-danger col-md-2 col-md-offset-1" data-toggle="modal"
									data-target="#com-rm-modal-remove<%out.print(i);%>">
									Remove <i class="fa fa-times"></i></button>
								<button class="btn btn-success col-md-2 col-md-offset-1" data-toggle="modal"
									data-target="#com-rm-modal-approve<%out.print(i);%>">
									Approve <i class="fa fa-check"></i></button>
							</div>
						</div>
						<%} %>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- end of container -->
	<%
     				
					Iterator<Map.Entry<String, UserDetailsBean>> it2 = user_dt.entrySet().iterator();
      				int j=0;
					while (it2.hasNext()) {
						++j;
					Map.Entry<String, UserDetailsBean> myentry = it2.next();
	%>
	<div class="modal fade" id="com-rm-modal<%out.print(j);%>"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="cms-element-modal-container">
					<button class="close" aria-hidden="true" data-dismiss="modal">
						<span style="margin-right: 10px; font-size: 20px;"><i class="fa fa-times fa-2x"></i></span>
					</button>
					<div class="cms-modal-name ">
						<p><%=myentry.getValue().getUser_first_name()%></p>

					</div>
		<% DecimalFormat formatter = new DecimalFormat("##,##,##0"); %>
					<div class="cms-modal-content">

						<div class="row">

							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">User ID</label>
									<div class="vpp-content-text" id="id<%out.print(j);%>"><%=myentry.getKey()%></div>
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
	<% } %>

	<%
					Iterator<Map.Entry<String, UserDetailsBean>> it3 = user_dt.entrySet().iterator();
      				int k =0;
					while (it3.hasNext()) {
						++k;
					Map.Entry<String, UserDetailsBean> myentry = it3.next();
	%>
	<div class="modal fade" id="com-rm-modal-remove<%out.print(k);%>"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
<button onclick="window.location.reload()" class="pull-right btn btn-default"
						style="margin-right: 10px; font-size: 20px;"><i class="fa fa-times"></i></button>
				<div class="cms-element-modal-container">
					<center>
						<div class="alert alert-success voffset4" id="ajaxResponse1<%out.print(k);%>"
							style="width: 300px;"></div>
					</center>
					
					<div class="cms-modal-name" id="deltitle<%out.print(k);%>">
						Remove
						<%=myentry.getValue().getUser_first_name()%></div>

					<div class="cms-modal-content" id="delquestion<%out.print(k);%>">Are you Sure
						You want to remove this user?</div>
					
					<div class="cms-modal-content">

						<input type="submit" id="delbutton<%out.print(k);%>"
							class="btn btn-danger btn-block cms-modal-btn" value="Delete" />

					</div>
				</div>
			</div>
		</div>
	</div>
	<%} %>

	<%
					Iterator<Map.Entry<String, UserDetailsBean>> it4 = user_dt.entrySet().iterator();
        			int l=0;
					while (it4.hasNext()) {
					++l;
					Map.Entry<String, UserDetailsBean> myentry = it4.next();
	%>

	<div class="modal fade" id="com-rm-modal-approve<%out.print(l);%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
<button onclick="window.location.reload()" class="pull-right btn btn-default"
						style="margin-right: 10px; font-size: 20px;"><i class="fa fa-times"></i></button>
				<div class="cms-element-modal-container">
					<center>
						<div class="alert alert-success voffset4" id="ajaxResponse2<%out.print(l);%>"
							style="width: 300px;"></div>
					</center>
					

					<div class="cms-modal-name" id="approvetitle<%out.print(l);%>">
						<p>
							Approve
							<%=myentry.getValue().getUser_first_name()%></p>
						<button class="close" aria-hidden="true" data-dismiss="modal">

						</button>
					</div>

					<div class="cms-modal-content" id="approvequestion<%out.print(l);%>">Are you
						Sure You want to Approve this user?</div>
					<div class="cms-modal-content">						

						<input type="submit" id="approvebutton<%out.print(l);%>"
							class="btn btn-success btn-block cms-modal-btn" value="Approve" />

					</div>
				</div>
			</div>

		</div>
	</div>
	<%} %>  

	<script type="text/javascript">
	<%
	Iterator<Map.Entry<String, UserDetailsBean>> it5 = user_dt.entrySet().iterator();
	int m=0;
	while (it5.hasNext()) {
	++m;
	Map.Entry<String, UserDetailsBean> myentry = it5.next();
	%>

       $(document).ready(function() {
           $('#delbutton<%out.print(m);%>').click(function() {
                   var name = document.getElementById("id<%out.print(m);%>").innerHTML;                  
                   $.post('DeleteUser', {
                	   id : name
                   }, function(responseText) {
                           $('#ajaxResponse1<%out.print(m);%>').text(responseText);
                   });
           });
   })
   
   $(document).ready(function() {
           $('#approvebutton<%out.print(m);%>').click(function(event) {
                   var name = document.getElementById("id<%out.print(m);%>").innerHTML;                   
                   $.post('ApproveUser', {
                	   id : name
                   }, function(responseText) {
                           $('#ajaxResponse2<%out.print(m);%>').text(responseText);
                   });
           });
   })
   
   $("#approvebutton<%out.print(m);%>").click(function(){
    $("#approvebutton<%out.print(m);%>").hide();
    $("#approvequestion<%out.print(m);%>").hide();
    $("#approvetitle<%out.print(m);%>").hide();
});
       
       $("#delbutton<%out.print(m);%>").click(function(){
    	    $("#delbutton<%out.print(m);%>").hide();
    	    $("#delquestion<%out.print(m);%>").hide();
    	    $("#deltitle<%out.print(m);%>").hide();
    	});

       <%} %>  
     </script>

	<%@include file="adminfooter.jsp"%>