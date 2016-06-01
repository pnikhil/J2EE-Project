<%@page import="java.util.*,java.text.*"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>

<%@page import="com.mfrp.beans.*"%>
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
				
				<div class="cms-element thumbnail">
					<div class="cms-heading">
						Approved Claim<font color="#447fc8"> Requests </font> <font color="#447fc8"><i class="fa fa-check"></i></font>
					</div>

					<div class="row">

						<%
						@SuppressWarnings("unchecked") 
							Map<Integer, UserClaimsBean> user_dt = (Map<Integer, UserClaimsBean>) request
									.getAttribute("approved_user_claim_details");
						%>

						<%
							Iterator<Map.Entry<Integer, UserClaimsBean>> it = user_dt.entrySet().iterator();
							int i = 0;
							if(!it.hasNext()) {
								%>
								
								<div class="alert alert-success voffset4 col-md-offset-4" style="display:inline;">No Approved Claims</div>
							
								<% 	}else
							while (it.hasNext()) {

								++i;
								Map.Entry<Integer, UserClaimsBean> myentry = it.next();
						%>
						<div class="thumbnail well">

							<div class="cms-element-name col-md-offset-2" style="padding-top: 15px;">
								<label class="col-md-3"><%=myentry.getValue().getUser_first_name()%></label>

								<button class="btn btn-info col-md-3 col-md-offset-2" data-toggle="modal"
									data-target="#com-rm-modal<%=i%>">Claim Detail <i class="fa fa-info-circle"></i></button>
								
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
	<div class="modal fade" id="com-rm-modal<%=j%>"
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

							<div style="display:none;" class="vpp-content-text" id="id<%=j%>"><%=myentry.getKey()%></div>

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
							
	<%
	@SuppressWarnings("unchecked") 	
		Map<String, UserDeathBean> udb = (Map<String, UserDeathBean>) request.getAttribute("death_claims_for_approved");	
	
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
							
							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Final Claim Amount</label>
									<div class="vpp-content-text">Rs.<%=formatter.format(myentry.getValue().getFinal_claim_amount())%></div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<%
		}
	%>


	<%@include file="adminfooter.jsp"%>