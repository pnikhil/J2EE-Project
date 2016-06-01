<%@page import="java.util.*,java.text.*"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.mfrp.beans.UserClaimsBean"%>
<%@page import="com.mfrp.beans.UserDeathBean"%>
<%@page import="java.util.Map"%>
<%@include file="adminheader.jsp"%>
<style type="text/css">
div:empty {
	display: none;
}
</style>

<body>
<% DecimalFormat formatter = new DecimalFormat("##,##,##0"); %>
	<div class="container cms-contentdiv col-md-9 ">
		<div class="row">

			<div class="col-sm-10 col-md-offset-3">
				<!-- start of companies div -->
				<div class="cms-element thumbnail">
					<div class="cms-heading">
						Pending Claim<font color="#447fc8"> Approvals </font>
					</div>

					<div class="row">

						<%
						@SuppressWarnings("unchecked") 
							Map<Integer, UserClaimsBean> user_dt = (Map<Integer, UserClaimsBean>) request.getAttribute("user_claim_details");
						%>

						<%
							Iterator<Map.Entry<Integer, UserClaimsBean>> it = user_dt.entrySet().iterator();
							int i = 0;
							if(!it.hasNext()) {
								%>
								
								<div class="alert alert-success voffset4 col-md-offset-4" style="display:inline;"><i class="fa fa-info-circle"></i> No Pending Claim Requests</div>
							
								<% 	}else
							while (it.hasNext()) {

								++i;
								Map.Entry<Integer, UserClaimsBean> myentry = it.next();
						%>
						<div class="thumbnail well">

							<div class="cms-element-name" style="padding-top: 15px;">
								<label class="col-md-3"><%=myentry.getValue().getUser_first_name()%></label>

								<button class="btn btn-info col-md-2" data-toggle="modal"
									data-target="#com-rm-modal<%out.print(i);%>">Claim Detail <i class="fa fa-info-circle"></i></button>
								<button class="btn btn-danger col-md-2 col-md-offset-1" data-toggle="modal"
									data-target="#com-rm-modal-remove<%out.print(i);%>">
									Reject <i class="fa fa-times"></i></button>
								<button class="btn btn-success col-md-2 col-md-offset-1" data-toggle="modal"
									data-target="#com-rm-modal-approve<%out.print(i);%>">
									Approve <i class="fa fa-check"></i></button>
							</div>
						</div>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- end of container -->
	<%
		Iterator<Map.Entry<Integer, UserClaimsBean>> it2 = user_dt.entrySet().iterator();
		int j = 0;
		while (it2.hasNext()) {
			++j;
			Map.Entry<Integer, UserClaimsBean> myentry = it2.next();
	%>
	
	
	
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
									<div class="vpp-content-text"><%=myentry.getValue().getUser_id()%></div>
								</div>
							</div>

							<div hidden class="vpp-content-text" id="id<%out.print(j);%>"><%=myentry.getKey()%></div>

							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Full Name</label>
									<div class="vpp-content-text"><%=myentry.getValue().getUser_first_name()%>
										<%=myentry.getValue().getUser_last_name()%></div>
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
									<label class="vpp-labelname">Request Date</label>
									<div class="vpp-content-text"><%=myentry.getValue().getRequest_date()%></div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Claim Reason</label>
									<div class="vpp-content-text"><%=myentry.getValue().getClaim_reason()%></div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Final Claim Amount</label>
									<div class="vpp-content-text">Rs.<%=formatter.format(myentry.getValue().getFinal_claim_amount())%></div>
								</div>
							</div>
							
	<%
	@SuppressWarnings("unchecked") 	
		Map<String, UserDeathBean> udb = (Map<String, UserDeathBean>) request.getAttribute("user_death_details");	
	
		Iterator<Map.Entry<String, UserDeathBean>> itd = udb.entrySet().iterator();	
		while (itd.hasNext()) {		
		Map.Entry<String, UserDeathBean> deathentry = itd.next();
	
	%>
	<%if(myentry.getValue().getUser_id().equalsIgnoreCase(deathentry.getValue().getUser_id())){ %>
	
					<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Death Date</label>
									<div class="vpp-content-text"><%=deathentry.getValue().getDeath_date()%></div>
								</div>
					</div>
					<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Death Reason</label>
									<div class="vpp-content-text"><%if(myentry.getValue().getUser_id().equals(myentry.getValue().getUser_id()))%><%=deathentry.getValue().getDeath_reason()%></div>
								</div>
					</div>
					<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Nominee 1</label>
									<div class="vpp-content-text"><%=deathentry.getValue().getNominee_1()%></div>
								</div>
					</div>
					<%if(deathentry.getValue().getNominee_2() == null) {} else if(deathentry.getValue().getNominee_2() != null && myentry.getValue().getUser_id().equalsIgnoreCase(myentry.getValue().getUser_id())) {%>
					
					<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Nominee 2</label>
									<div class="vpp-content-text"><%=deathentry.getValue().getNominee_2()%></div>
								</div>
					</div>
					<%} %>
					<%if(deathentry.getValue().getNominee_3() == null) {} else if(deathentry.getValue().getNominee_3() != null && myentry.getValue().getUser_id().equalsIgnoreCase(myentry.getValue().getUser_id())) {%>
					<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Nominee 3</label>
									<div class="vpp-content-text"><%=deathentry.getValue().getNominee_3()%></div>
								</div>
					</div>
					<%} %>
						<%}} %>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<%
		}
	%>

	<%
		Iterator<Map.Entry<Integer, UserClaimsBean>> it3 = user_dt.entrySet().iterator();
		int k = 0;
		while (it3.hasNext()) {
			++k;
			Map.Entry<Integer, UserClaimsBean> myentry = it3.next();
	%>
	<div class="modal fade" id="com-rm-modal-remove<%out.print(k);%>"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
<button onclick="window.location.reload()" class="pull-right btn btn-default"
						style="margin-right: 10px; font-size: 20px;"><i class="fa fa-times"></i></button>
				<div class="cms-element-modal-container">
					
						<div class="alert alert-success voffset4 col-md-offset-4"
							id="ajaxResponse1<%out.print(k);%>" style="width: 300px;"></div>
					
					
					<div class="cms-modal-name" id="deltitle<%out.print(k);%>">
						Reject 
						<%=myentry.getValue().getUser_first_name()%>'s Claim</div>

					<div class="cms-modal-content" id="delquestion<%out.print(k);%>">Are
						you Sure you want to reject this claim?</div>
						<div class="cms-modal-content" id="rejreason<%out.print(k);%>">
						<div><strong>Reason for rejection <span class="mandatory">*</span>:</strong></div>
						<div><textarea style="height: 94px;" name="reject_reason" class="form-control" rows="3" maxlength="180" autocomplete="off" required id="rejectreason<%out.print(k);%>" placeholder="Enter the rejection reason"></textarea></div>						
						</div>	
					
					<div class="cms-modal-content">
						
						<input type="submit" id="delbutton<%out.print(k);%>"
							class="btn btn-danger btn-block cms-modal-btn" value="Delete" />

					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		}
	%>

	<%
		Iterator<Map.Entry<Integer, UserClaimsBean>> it4 = user_dt.entrySet().iterator();
		int l = 0;
		while (it4.hasNext()) {
			++l;
			Map.Entry<Integer, UserClaimsBean> myentry = it4.next();
	%>

	<div class="modal fade" id="com-rm-modal-approve<%out.print(l);%>"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
	<button onclick="window.location.reload()" class="pull-right btn btn-default"
						style="margin-right: 10px; font-size: 20px;"><i class="fa fa-times"></i></button>
				<div class="cms-element-modal-container">
					
						<div class="alert alert-success voffset4 col-md-offset-4"
							id="ajaxResponse2<%out.print(l);%>" style="width: 300px;"></div>
					
					

					<div class="cms-modal-name" id="approvetitle<%out.print(l);%>">
						<p>
							Approve
							<%=myentry.getValue().getUser_first_name()%></p>
						<button class="close" aria-hidden="true" data-dismiss="modal">

						</button>
					</div>

					<div class="cms-modal-content"
						id="approvequestion<%out.print(l);%>">Are you Sure You want
						to Approve this user?</div>
					<div class="cms-modal-content">
						<%-- <form action="ApproveUser" method="post"> <input type="hidden" name="id"
value="<%=myentry.getKey()%>" /> <input
type="submit" class="btn btn-success btn-block cms-modal-btn" value="Approve User" /></form> --%>

						<input type="submit" id="approvebutton<%out.print(l);%>"
							class="btn btn-success btn-block cms-modal-btn" value="Approve" />

					</div>
				</div>
			</div>

		</div>
	</div>
	<%
		}
	%>

	<script type="text/javascript">
<%Iterator<Map.Entry<Integer, UserClaimsBean>> it5 = user_dt.entrySet().iterator();
			int m = 0;
			while (it5.hasNext()) {
				++m;
				Map.Entry<Integer, UserClaimsBean> myentry = it5.next();%>
				
				$(document).ready(function() {
					$("#rejectreason<%=m%>").focusin(function(){
					if ($("#rejectreason<%=m%>").val() == "")
					$(this).css({
						"border":"2px solid red"
					});

					$("#rejectreason<%=m%>").focusout(function(){

					if ($("#rejectreason<%=m%>").val() != "")
					$(this).css({
					"border": "",
					});


					});
					});
					})

       $(document).ready(function() {
           $('#delbutton<%out.print(m);%>').click(function() {
          $("#delbutton<%out.print(m);%>").hide();
           $("#delquestion<%out.print(m);%>").hide();
           $("#deltitle<%out.print(m);%>").hide();
           $("#rejreason<%=m%>").hide();
           var getid = document.getElementById("id<%=m%>").innerHTML;
       <%-- var getreason = $("textarea#rejectreason<%=m%>").val(); --%>
            var getreason = document.getElementById("rejectreason<%=m%>").value;
            console.log(document.getElementById("rejectreason<%=m%>").value);
                   $.post('DeleteClaim', {
                  	id : getid, id2: getreason
                   }, function(responseText) {
                           $('#ajaxResponse1<%out.print(m);%>').text(responseText);
                   });
           });
   })
   
   $(document).ready(function() {
           $('#approvebutton<%out.print(m);%>').click(function(event) {          
          	$("#approvebutton<%out.print(m);%>").hide();
           $("#approvequestion<%out.print(m);%>").hide();
           $("#approvetitle<%out.print(m);%>").hide();
                   var name = document.getElementById("id<%out.print(m);%>").innerHTML;                   
                   $.post('ApproveClaim', {
                  id : name
                   }, function(responseText) {
                           $('#ajaxResponse2<%out.print(m);%>').text(responseText);
                   });
           });
   })
   
<%--    $("#approvebutton<%out.print(m);%>").click(function(){
       
       $("#delbutton<%out.print(m);%>").click(function(){
      
    }); --%>

       <%}%>  
     </script>

	<%@include file="adminfooter.jsp"%>