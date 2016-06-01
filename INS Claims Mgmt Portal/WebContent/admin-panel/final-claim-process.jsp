<%@page import="java.util.*,java.text.*"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.mfrp.beans.UserClaimsBean"%>
<%@page import="java.util.Map"%>
<%@include file="adminheader.jsp"%>
<style type="text/css">
div:empty {
	display: none;
}
</style>

<body>
	<div class="container cms-contentdiv">
		<div class="row col-md-11">
<% DecimalFormat formatter = new DecimalFormat("##,##,##0"); %>
			<div class="col-sm-12 col-md-offset-1">
				<!-- start of companies div -->
				<div class="cms-element thumbnail">
					<div class="cms-heading">
						Final Claim<font color="#447fc8"> Approvals </font>
					</div>
					
					<div class="row">					
						<%
							Map<Integer, UserClaimsBean> user_dt = (Map<Integer, UserClaimsBean>) request.getAttribute("final_claim_details");
						%>

						<%
							Iterator<Map.Entry<Integer, UserClaimsBean>> it = user_dt.entrySet().iterator();
							int i = 0;
							if(!it.hasNext()) {
						%>
						<center>
						<div class="alert alert-success voffset4" style="display:inline;"><i class="fa fa-info-circle"></i> No Pending Approvals</div>
					</center>
						<% 	}else	
							while (it.hasNext()) {

								++i;
								Map.Entry<Integer, UserClaimsBean> myentry = it.next();
						%>
						
						<div id="iter<%=i%>" class="thumbnail well">
						
							<div class="cms-element-name" style="padding-top: 15px;">
								<label class="col-md-2"><%=myentry.getValue().getUser_first_name()%></label>
								<div class="label label-primary col-md-2"
									style="font-variant: small-caps; font-size: 15px; margin-top: 5px; padding: 0px;">
									Documents</div>
								<button class="btn btn-info col-md-1 col-md-offset-1"
									data-toggle="modal"
									data-target="#com-rm-modal-view<%out.print(i);%>">View</button>

								<button class="btn btn-danger col-md-2 col-md-offset-1"
									data-toggle="modal"
									data-target="#com-rm-modal-remove<%out.print(i);%>">
									Reject <i class="fa fa-times"></i></button>
								<button class="btn btn-success col-md-2 col-md-offset-1"
									data-toggle="modal"
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



	<%
		Iterator<Map.Entry<Integer, UserClaimsBean>> it2 = user_dt.entrySet().iterator();
		int j = 0;
		while (it2.hasNext()) {
			++j;
			Map.Entry<Integer, UserClaimsBean> myentry = it2.next();
	%>
	<div class="modal fade" id="com-rm-modal-view<%out.print(j);%>"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="cms-element-modal-container">					
					<button class="close" aria-hidden="true" data-dismiss="modal">
						<span style="margin-right: 10px; font-size: 20px;"><i class="fa fa-times fa-2x"></i></span>
					</button>
					<div class="cms-modal-name">
						View
						<%=myentry.getValue().getUser_first_name()%>'s documents for
						<%=myentry.getValue().getClaim_reason()%>
						Claim
					</div>

					<%
						StringTokenizer sb = new StringTokenizer(myentry.getValue().getClaim_documents(), ",");
							String doc1 = "", doc2 = "", doc3 = "";

							while (sb.hasMoreTokens()) {
								doc1 = sb.nextToken();
								doc2 = sb.nextToken();
								doc3 = sb.nextToken();
							}
							String stdoc11="", stdoc22="", stdoc33="";
							StringTokenizer stdoc1 = new StringTokenizer(doc1,".");
							StringTokenizer stdoc2 = new StringTokenizer(doc2,".");
							StringTokenizer stdoc3 = new StringTokenizer(doc3,".");
							while(stdoc1.hasMoreTokens()&&stdoc2.hasMoreTokens()&&stdoc3.hasMoreTokens()){
								stdoc11 = stdoc1.nextToken();
								stdoc22 = stdoc2.nextToken();
								stdoc33 = stdoc3.nextToken();
							}
					%>

					<div class="cms-modal-content">
						
						<div class="voffset3 col-md-12">
							<span class="col-md-2 col-md-offset-1"><p>Document 1</p></span>
							<div class="col-md-3 col-md-offset-1">
								<span class="label label-success ">File Name:</span><span
									class="col-md-offset-1"><%=doc1%></span>
							</div>
							<% if(stdoc11.equals("jpg")) {%>
							<form action="view-document.jsp" id="defaultForm" method="get" target="_blank">
								<input type="hidden" name="document_name" value="<%=doc1%>">
								<input type="hidden" name="user_id"
									value="<%=myentry.getValue().getUser_id()%>"> <input
									type="hidden" name="request_date"
									value="<%=myentry.getValue().getRequest_date()%>"> <input
									type="hidden" name="claim_reason"
									value="<%=myentry.getValue().getClaim_reason()%>"> <input
									type="submit" id="submit-btn" class="btn btn-info col-md-2 col-md-offset-2"
									value="View File">
							</form>
							<%} else{ %>
							<a class="btn btn-info col-md-2 col-md-offset-2" href = "<%=request.getContextPath()%>/resources/<%=myentry.getValue().getUser_id().toUpperCase()%>/<%=myentry.getValue().getRequest_date()%>-<%=myentry.getValue().getClaim_reason()%>/<%=doc1%>">Download Doc</a>
							<%} %>
						</div>
						<div class="voffset3 col-md-12">
							<span class="col-md-2 col-md-offset-1"><p>Document 2</p></span>
							<div class="col-md-3 col-md-offset-1">
								<span class="label label-success ">File Name:</span><span
									class="col-md-offset-1"><%=doc2%></span>
							</div>
							<% if(stdoc22.equals("jpg")) {%>
							<form action="view-document.jsp" method="get" target="_blank">
								<input type="hidden" name="document_name" value="<%=doc2%>">
								<input type="hidden" name="user_id"
									value="<%=myentry.getValue().getUser_id()%>"> <input
									type="hidden" name="request_date"
									value="<%=myentry.getValue().getRequest_date()%>"> <input
									type="hidden" name="claim_reason"
									value="<%=myentry.getValue().getClaim_reason()%>"> <input
									type="submit" class="btn btn-info col-md-2 col-md-offset-2"
									value="View File">
							</form>
							<%} else{ %>
							<a class="btn btn-info col-md-2 col-md-offset-2" href = "<%=request.getContextPath()%>/resources/<%=myentry.getValue().getUser_id().toUpperCase()%>/<%=myentry.getValue().getRequest_date()%>-<%=myentry.getValue().getClaim_reason()%>/<%=doc2%>">Download Doc</a>
							<%} %>
						</div>
						<div class="voffset3 col-md-12">
							<span class="col-md-2 col-md-offset-1"><p>Document 3</p></span>
							<div class="col-md-3 col-md-offset-1">
								<span class="label label-success ">File Name:</span><span
									class="col-md-offset-1"><%=doc3%></span>
							</div>
							<% if(stdoc33.equals("jpg")) {%>
							<form action="view-document.jsp" method="get" target="_blank">
								<input type="hidden" name="document_name" value="<%=doc3%>">
								<input type="hidden" name="user_id"
									value="<%=myentry.getValue().getUser_id()%>"> <input
									type="hidden" name="request_date"
									value="<%=myentry.getValue().getRequest_date()%>"> <input
									type="hidden" name="claim_reason"
									value="<%=myentry.getValue().getClaim_reason()%>"> <input
									type="submit" class="btn btn-info col-md-2 col-md-offset-2"
									value="View File">
							</form>
							<%} else{ %>
							<a class="btn btn-info col-md-2 col-md-offset-2" href = "<%=request.getContextPath()%>/resources/<%=myentry.getValue().getUser_id().toUpperCase()%>/<%=myentry.getValue().getRequest_date()%>-<%=myentry.getValue().getClaim_reason()%>/<%=doc3%>">Download Doc</a>
							<%} %>
						</div>


					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="com-rm-modal-remove<%out.print(j);%>"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<button onclick="window.location.reload()" id="rejectclose<%=j%>" class="pull-right btn btn-default"
						style="margin-right: 10px; font-size: 20px;"><i class="fa fa-times"></i></button>
				<div class="cms-element-modal-container">
					<center>
						<div class="alert alert-success voffset4" id="ajaxResponse1<%out.print(j);%>" style="width: 300px;"></div>
					</center>					
					<div class="cms-modal-name" id="deltitle<%out.print(j);%>">
						Reject
						<%=myentry.getValue().getUser_first_name()%>'s documents for
						<%=myentry.getValue().getClaim_reason()%>
						Claim
					</div>

					<div class="cms-modal-content" id="delquestion<%out.print(j);%>">
						<div style="margin-bottom: 14px;">
						<center><div class="alert alert-danger" style="display: inline;">Are
							you Sure You want to reject documents for this user?</div></center>
							<h3>Claim Details:</h3>
							<div>
								User ID:
								<%=myentry.getValue().getUser_id()%></div>
							<div>
								Full name:
								<%=myentry.getValue().getUser_first_name()%>
								<%=myentry.getValue().getUser_last_name()%></div>
							<div>
								Insurance Type:
								<%=myentry.getValue().getUser_insurance_type()%></div>
							<div>
								Claim Reason:
								<%=myentry.getValue().getClaim_reason()%></div>
							<div>
								Final Claim Amount:
								<%=formatter.format(myentry.getValue().getFinal_claim_amount())%></div>
						</div>
						<div><strong>Reason for rejection <span class="mandatory">*</span>:</strong></div>
						<div><textarea style="height: 94px;" name="reject_Reason" class="form-control" rows="3" maxlength="180" autocomplete="off" required id="reject_reason<%out.print(j);%>" placeholder="Enter the rejection reason"></textarea></div>						
							
					</div>					
					<div class="cms-modal-content">
						<input type="submit" id="delbutton<%out.print(j);%>"
							class="btn btn-danger btn-block cms-modal-btn" value="Reject" />
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="com-rm-modal-approve<%out.print(j);%>"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
			<button onclick="window.location.reload()" id="approveclose<%=j%>" class="pull-right btn btn-default"
						style="margin-right: 10px; font-size: 20px;"><i class="fa fa-times"></i></button>
				<div class="cms-element-modal-container">
					<center>
						<div class="alert alert-success voffset4" id="ajaxResponse2<%out.print(j);%>" style="width: 300px;"></div>
					</center>

					<div class="cms-modal-name" id="approvetitle<%out.print(j);%>">
						<p>
							Approve
							<%=myentry.getValue().getUser_first_name()%>'s documents for
							<%=myentry.getValue().getClaim_reason()%>
							Claim
						</p>
					 <button class="close" aria-hidden="true" data-dismiss="modal"></button> 
					</div>

					<div class="cms-modal-content" id="approvequestion<%out.print(j);%>">
						<div style="margin-bottom: 14px;">
							<h3>Claim Details:</h3>
							<div>
								User ID:
								<%=myentry.getValue().getUser_id()%></div>
							<div>
								Full name:
								<%=myentry.getValue().getUser_first_name()%>
								<%=myentry.getValue().getUser_last_name()%></div>
							<div>
								Insurance Type:
								<%=myentry.getValue().getUser_insurance_type()%></div>
							<div>
								Claim Reason:
								<%=myentry.getValue().getClaim_reason()%></div>
							<div>
								Final Claim Amount:
								<%=formatter.format(myentry.getValue().getFinal_claim_amount())%></div>							
							<div hidden id="id<%=j%>"><%=myentry.getKey()%></div>
						</div>
						<div class="alert alert-success voffset2" style="display: inline;">Are
							you sure You want to approve documents for this user?</div>
					</div>
					<div class="cms-modal-content">
						<input type="submit" id="approvebutton<%=j%>"
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
           $('#approvebutton<%out.print(m);%>').click(function() {
                   var name = document.getElementById("id<%=m%>").innerHTML;                  
                   $.post('ApproveDocuments', {
                  id : name
                   }, function(responseText) {
                           $('#ajaxResponse2<%=m%>').text(responseText);
                   });
           });
   })

   
$(document).ready(function() {
$("#reject_reason<%=m%>").focusin(function(){
if ($("#reject_reason<%=m%>").val() == "")
$(this).css({
	"border":"2px solid red"
});

$("#reject_reason<%=m%>").focusout(function(){

if ($("#reject_reason<%=m%>").val() != "")
$(this).css({
"border": "",
});


});
});
})
   
   $(document).ready(function() {
           $('#delbutton<%out.print(m);%>').click(function(event) {
                   var name = document.getElementById("id<%=m%>").innerHTML;
                   var reject_reason = document.getElementById("reject_reason<%=m%>").value;
                   $.post('RejectDocuments', {
                  id : name+"||"+reject_reason
                   },  function(responseText){
                         $('#ajaxResponse1<%=m%>').text(responseText);                           
                   });
           });
   })
   
  $("#approvebutton<%=m%>").click(function(){
    $("#approvebutton<%=m%>").hide();
    $("#approvequestion<%=m%>").hide();
    $("#approvetitle<%=m%>").hide();
   
});
       
       $("#delbutton<%=m%>").click(function(){       
       $("#delquestion<%=m%>").hide();
       $("#deltitle<%=m%>").hide();
       $("#delbutton<%=m%>").hide();
	});
      
	<%} %>
       
     </script>

<%@include file="adminfooter.jsp"%>