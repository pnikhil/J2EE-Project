<%@page import="java.util.*,java.text.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.mfrp.beans.*"%>
<%@page import="java.util.Map"%>
<%@include file="adminheader.jsp"%>

<script
	src="<%=request.getContextPath()%>/resources/js/jquery.dataTables.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/jquery.dataTables.css">
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
						Search<font color="#447fc8"> Claims <i class="fa fa-search"></i></font>
					</div>

					<div class="row">

						<%
						@SuppressWarnings("unchecked") 
							Map<Integer, UserClaimsBean> user_dt = (Map<Integer, UserClaimsBean>) request.getAttribute("user_claim_details");
						%>
						<div class="col-md-12" style="margin-bottom:42px;">
						
						<div class="col-md-offset-4"><h2>Filter by Dates <i class="fa fa-calendar"></i></h2></div>
						
							<div class="col-md-6 voffset3">
								<label class="col-md-4 voffset1">Date 1: </label><input type="text"
									autocomplete="off" class="form-control"
									placeholder="YYYY-MM-DD" id=min
									style="width: 10em; height: 2em" />
							</div>
							<div class="col-md-6 voffset3">
								<label class="col-md-4 voffset1">Date 2: </label><input type="text"
									autocomplete="off" class="form-control"
									placeholder="YYYY-MM-DD" id=max
									style="width: 10em; height: 2em" />
							</div>
						</div>
						</div>
						
					<div class="row">
					<div class="col-md-offset-4"><h3>
								Search by Name or Member ID
						</h3></div>
						<table id="tb" class="display voffset3" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>First Name</th>
									<th>User id</th>
									<th>Request Date</th>
									<th>Full Details <i class="fa fa-info-circle"></i></th>
								</tr>
							</thead>
							<tbody>
								<%
									Iterator<Map.Entry<Integer, UserClaimsBean>> it = user_dt.entrySet().iterator();
									int i = 0;
									if(!it.hasNext()) {
										%>
										
										<div class="alert alert-success voffset4 col-md-offset-4" style="display:inline;"><i class="fa fa-info-circle"></i> No Claims to search</div>
									
										<% 	} else
									while (it.hasNext()) {
										++i;
										Map.Entry<Integer, UserClaimsBean> myentry = it.next();
								%>

								<tr>
									<td><%=myentry.getValue().getUser_first_name()%></td>
									<td><%=myentry.getValue().getUser_id()%></td>
									<td>
										<%
											String d = myentry.getValue().getRequest_date();
												SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
												Date myd = sdf.parse(d);	
												d = sdf.format(myd);
										%> <%=d%></td>
									<td>
										<button class="btn btn-info company-btn" data-toggle="modal"
											data-target="#com-rm-modal<%out.print(i);%>">Full
											Detail <i class="fa fa-info-circle"></i></button> <% if (myentry.getValue().getStatus() == null){ %><div class="label label-primary" style="pointer-events: none;">Status: Pending</div> <% } else if(myentry.getValue().getStatus().equalsIgnoreCase("Approved")) {%><div class="label label-success" style="pointer-events: none;">Status: <%=myentry.getValue().getStatus()%></div><%}else if (myentry.getValue().getStatus().equalsIgnoreCase("Rejected")){ %><div class="label label-danger"><%=myentry.getValue().getStatus()%></div><%} %>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>

						</table>

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
									<label class="vpp-labelname">Rs.Final Claim Amount</label>
									<div class="vpp-content-text"><%=formatter.format(myentry.getValue().getFinal_claim_amount())%></div>
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

	<!-- <script type="text/javascript" src="../resources/js/range.js"></script> -->
	<script type="text/javascript">
		$(function() {
			var dt1 = new Date();

			$('#min').datepicker({
				format : 'yyyy-mm-dd',
				endDate : dt1,
				autoclose : true
			});
		});

		$(function() {
			var dt2 = new Date();
			$('#max').datepicker({
				format : 'yyyy-mm-dd',
				endDate : dt2,
				autoclose : true
			});
		});

		$.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
			var min = $('#min').val();
			var max = $('#max').val();
			if (min == "" || max == "") {
				return true;
			}
			var date = new Date(data[2]).getTime();

			if (new Date(min).getTime() <= date	&& new Date(max).getTime() >= date) {
				return true;
			} else
				return false;
		});

		$(document).ready(function() {
			var table = $('#tb').DataTable();
			table.draw();
			$('#min, #max').keyup(function() {

				table.draw();
			});
			$('#min, #max').change(function() {

				table.draw();
			});
		});
	</script>

</body>

<%@include file="adminfooter.jsp"%>