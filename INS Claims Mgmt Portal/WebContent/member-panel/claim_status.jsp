<%@page import="java.util.*,java.text.*"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.mfrp.beans.*"%>

<%@page import="java.util.Map"%>
<%@include file="userheader.jsp"%>
<style type="text/css">
div:empty {
	display: none;
}

.btn-file {
    position: relative;
    overflow: hidden;
}
.btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
}
</style>

<body>
<% DecimalFormat formatter = new DecimalFormat("##,##,##0"); %>

	<div class="container cms-contentdiv col-md-12">
		<div class="row">
		 <%
				if (request.getAttribute("file_upload_success1") != null) {
					out.print(
							"<center><div class=\"alert alert-success voffset1 col-md-6 col-md-offset-3\" id=\"magicmessage\"><h4>Files Uploaded Successfully</h4></div></center>");
				} else if (request.getAttribute("file_upload_success2") != null) {
					out.print(
							"<center><div class=\"alert alert-danger voffset1 col-md-6 col-md-offset-3\" id=\"magicmessage\"><h4>File Upload Failed. Try Again</h4></div></center>");
				} else if (request.getAttribute("file_upload_success3") != null) {

					out.print(
							"<center><div class=\"alert alert-danger voffset1 col-md-6 col-md-offset-3\"><h4>Sorry, only valid file upload requests are handled</h4></div></center>");
				}
			%>
			
<script type="text/javascript">
setTimeout(fade_out, 2000);

function fade_out() {
  $("#magicmessage").fadeOut().empty();
}
</script>
			<div class="col-sm-10 col-md-offset-1">
				<!-- start of companies div -->
				<div class="cms-element thumbnail">
					<div class="cms-heading">
						Your Claim<font color="#447fc8"> Status</font>
					</div>

					<div class="row">

	<%
		@SuppressWarnings("unchecked") 
		Map<Integer, UserClaimsBean> user_dt = (Map<Integer, UserClaimsBean>) request.getAttribute("user_claim_status");
	%>
	
	<%
		Iterator<Map.Entry<Integer, UserClaimsBean>> it = user_dt.entrySet().iterator();
		int i = 0;
							
			while (it.hasNext()) {
			++i;
			Map.Entry<Integer, UserClaimsBean> myentry = it.next();
		%>
						
		<%
         		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				 String date = myentry.getValue().getRequest_date();
				 Calendar now = Calendar.getInstance();
				 Date parsedDate = sdf.parse(date);
		 		 now.setTime(parsedDate); 
		 		 now.add(Calendar.DAY_OF_MONTH, 45);
		 		 
		 		Calendar now2 = Calendar.getInstance();
		 		now2.setTime(parsedDate);
		 		 now2.add(Calendar.DAY_OF_MONTH, 10);
		 		 
		 		SimpleDateFormat sdf2 = new SimpleDateFormat("d MMMM, yyyy");
		 		String temp=sdf2.format(now.getTime());
		 		String temp2 = sdf2.format(now2.getTime());
  		%>
						<div class="thumbnail well">
				
		<% if(myentry.getValue().getStatus() == null) {} else if(myentry.getValue().getStatus().equals("Approved") && myentry.getValue().getUser_upload_flag() == 2) {%>
																	
									<div class="alert alert-success col-md-offset-4" style="display:inline; font-size: 13px; padding: 3px;"><i class="fa fa-info-circle"></i> Documents Approved. You will receive the amount by <%=temp2%></div>
									
			<% } else if(myentry.getValue().getStatus().equals("Approved") && myentry.getValue().getUser_upload_flag() == -1) {%>
						<div class="alert alert-danger col-md-offset-5" style="display:inline; font-size: 13px; padding: 3px;"><i class="fa fa-info-circle"></i> Documents Rejected. Reason: <%=myentry.getValue().getReject_reason()%></div>
									
						<% } %>
	
							<div class="cms-element-name" style="padding-top: 15px;">
								<label class="col-md-2"><%=myentry.getValue().getClaim_reason()%> Claim</label>


								<button class="btn btn-info col-md-2" data-toggle="modal"
									data-target="#com-rm-modal<%out.print(i);%>"><i class="fa fa-bars"></i> Details</button>
								<div class="label label-primary col-md-1 col-md-offset-1 voffset1" style="font-variant: small-caps; font-size: 15px;margin-top: 5px;padding: 0px;pointer-events: none;">
									Status</div>
									
			
									
									<%if(myentry.getValue().getStatus() == null) {%> 
									<button class="btn btn-warning col-md-offset-1" style="margin-right: 18px;pointer-events: none;">Pending</button>
									<div class="alert alert-warning" style="display:inline; font-size: 13px; padding: 3px;"><i class="fa fa-info-circle"></i> Check status within <%=temp%></div>
									
									<% } else if(myentry.getValue().getStatus().equalsIgnoreCase("Approved") && myentry.getValue().getUser_upload_flag() == 0) {%>
									<button class="btn btn-success col-md-offset-1" style="margin-right: 18px; pointer-events: none;">Approved <i class="fa fa-check"></i></button>									 
									 <button class="btn btn-primary" data-toggle="modal" data-target="#com-rm-modal-approve<%out.print(i);%>">
									Upload Documents <i class="fa fa-upload"></i></button>
													
									
									<% } else if(myentry.getValue().getStatus().equalsIgnoreCase("Approved") && myentry.getValue().getUser_upload_flag() == 2) {%>
									<button class="btn btn-success col-md-offset-1" style="margin-right: 18px;pointer-events: none;">Approved <i class="fa fa-check"></i></button>
									<%String link = request.getContextPath()+"/resources/"+ myentry.getValue().getUser_id().toUpperCase() +"/" + myentry.getValue().getRequest_date() + "-" + myentry.getValue().getClaim_reason() + "/" + myentry.getValue().getUser_id().toUpperCase()+".pdf";%>
						
									<a href="<%=link%>" target="_blank" class="btn btn-primary" style="margin-right: 18px;">Download Report for Claim <i class="fa fa-file-pdf-o"></i></a>									
									
									<% } else if(myentry.getValue().getStatus().equalsIgnoreCase("Approved") && myentry.getValue().getUser_upload_flag() == -1) {%>
																 
									 <button class="btn btn-primary col-md-offset-1" data-toggle="modal" data-target="#com-rm-modal-approve<%out.print(i);%>">
									Upload Docs</button>
									<div class="alert alert-info" style="display:inline; font-size: 13px; padding: 3px;"><i class="fa fa-info-circle"></i> Documents Rejected. Upload Again</div>  
									<% } else if(myentry.getValue().getUser_upload_flag() == 1 && myentry.getValue().getStatus().equalsIgnoreCase("Approved")) { %>									
									<button id="pending" style="pointer-events: none;" class="btn btn-success col-md-offset-1" style="margin-right: 18px;"><i class="fa fa-clock-o"></i> Pending</button>
									<div class="alert alert-info" style="display:inline; font-size: 13px; padding: 3px;"><i class="fa fa-info-circle"></i> Processing...Wait for admin message</div>									
									<% } %>
							</div>
							
							
						</div>
						<%
							}
						%>
											
	<%
		@SuppressWarnings("unchecked") 
		Map<Integer, RejectedUserBean> rejected = (Map<Integer, RejectedUserBean>) request.getAttribute("user_rejected_claim_status");
	%>
						
	<%
		Iterator<Map.Entry<Integer, RejectedUserBean>> it3 = rejected.entrySet().iterator();
		int n = 0;
		
		while (it3.hasNext()) {
		++n;
		Map.Entry<Integer, RejectedUserBean> myentry2 = it3.next();
		
	%>
	<div class="thumbnail well">
	<div class="cms-element-name" style="padding-top: 15px;">
						
								<label class="col-md-2"><%=myentry2.getValue().getClaim_reason()%> Claim</label>
								<button class="btn btn-info col-md-2" data-toggle="modal"
									data-target="#com-rm-modal-rejected<%out.print(n);%>"><i class="fa fa-bars"></i> Details</button>
								<div class="label label-primary col-md-1 col-md-offset-1 voffset1" style="font-variant: small-caps; pointer-events: none; font-size: 15px;margin-top: 5px;padding: 0px;">
									Status</div>
									<button class="btn btn-danger col-md-offset-1" style="pointer-events: none;margin-right: 18px;">Claim Request Rejected <i class="fa fa-info-circle"></i></button>
									 
	</div>
	<br />
	<div class="alert alert-danger col-md-offset-5" style="display:inline; font-size: 13px; padding: 3px;"><i class="fa fa-info-circle"></i> Reject Reason: <%=myentry2.getValue().getReject_reason()%></div>
	<br />
	</div>
	<%} %>
	
	<%
		Iterator<Map.Entry<Integer, RejectedUserBean>> it5 = rejected.entrySet().iterator();
		int m = 0;
		while (it5.hasNext()) {
		++m;
		Map.Entry<Integer, RejectedUserBean> myentry2 = it5.next();
	%>
	
	
	<div class="modal fade" id="com-rm-modal-rejected<%=m%>"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="cms-element-modal-container">
					<button class="close" aria-hidden="true" data-dismiss="modal">
						<span style="margin-right: 10px; font-size: 20px;">&#10008;</span>
					</button>					

					<div class="cms-modal-content">

						<div class="row">

							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">User ID</label>
									<div class="vpp-content-text"><%=myentry2.getValue().getUser_id()%></div>
								</div>
							</div>	


							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Nominee Count</label>
									<div class="vpp-content-text"><%=myentry2.getValue().getUser_nominee_count()%></div>
								</div>
							</div>
							
							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Request Date</label>
									<div class="vpp-content-text"><%=myentry2.getValue().getRequest_date()%></div>
								</div>
							</div>
							
							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Maximum Claim Amount</label>
									<div class="vpp-content-text"><%=myentry2.getValue().getMax_claim_amount()%></div>
								</div>
							</div>
							
							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Final Claim Amount</label>
									<div class="vpp-content-text"><%=myentry2.getValue().getFinal_claim_amount()%></div>
								</div>
							</div>
							
							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Reject Reason</label>
									<div class="vpp-content-text"><%=myentry2.getValue().getReject_reason()%></div>
								</div>
							</div>						

							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Claim Reason</label>
									<div class="vpp-content-text"><%=myentry2.getValue().getInsurance_type()%> - <%=myentry2.getValue().getClaim_reason()%></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
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

							<div style="display:none;" class="vpp-content-text" id="id<%out.print(j);%>"><%=myentry.getKey()%></div>

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
									<label class="vpp-labelname">Claim Reason</label>
									<div class="vpp-content-text"><%=myentry.getValue().getUser_insurance_type()%> - <%=myentry.getValue().getClaim_reason()%></div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Claim Request Date</label>
									<div class="vpp-content-text"><%=myentry.getValue().getRequest_date()%></div>
								</div>
							</div>
							
	<%
		@SuppressWarnings("unchecked") 			
		Map<String, UserDeathBean> udb = (Map<String, UserDeathBean>) request.getAttribute("user_claim_for_death");	
	
		Iterator<Map.Entry<String, UserDeathBean>> itd = udb.entrySet().iterator();	
		while (itd.hasNext()) {		
		Map.Entry<String, UserDeathBean> deathentry = itd.next();
	
	%>
	<%if(myentry.getValue().getUser_id().equalsIgnoreCase(deathentry.getValue().getUser_id()) && myentry.getValue().getClaim_reason().equalsIgnoreCase("Death")){ %>
					
					<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Death Date</label>
									<div class="vpp-content-text"><%=deathentry.getValue().getDeath_date()%></div>
								</div>
					</div>
					<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Death Reason</label>
									<div class="vpp-content-text"><%=deathentry.getValue().getDeath_reason()%></div>
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
					
					
					<% } }%>		
							<div class="col-sm-6">
								<div class="form-group">
									<label class="vpp-labelname">Final Claim Amount</label>
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


	<%
		Iterator<Map.Entry<Integer, UserClaimsBean>> it4 = user_dt.entrySet().iterator();
		int l = 0;
		
		while (it4.hasNext()) {
			++l;
			Map.Entry<Integer, UserClaimsBean> myentry = it4.next();
	%>
	
	<% if(myentry.getValue().getStatus()==null) {} else if (myentry.getValue().getStatus().equalsIgnoreCase("Approved") && (myentry.getValue().getUser_upload_flag() == 0||myentry.getValue().getUser_upload_flag() == -1)){%>

	<div class="modal fade" id="com-rm-modal-approve<%out.print(l);%>"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="cms-element-modal-container">
					
					<button class="close" aria-hidden="true" data-dismiss="modal">
						<span style="margin-right: 10px; font-size: 20px;">&#10008;</span>
					</button>

					<div class="cms-modal-name" id="approvetitle<%out.print(l);%>">
						<p>	Upload Documents for Procuring Claim</p>						
					</div>

					<div class="cms-modal-content mpp-chngepic"><div class="alert alert-danger"><i class="fa fa-info-circle"></i> Upload at least 3 documents to complete your claim process. Upload only JPEG or DOC file with file name length of 15 characters or less.</div></div>
					<div class="cms-modal-content">
					<form action="FileUploadHandler" method="post" id="defaultForm" enctype="multipart/form-data">
						
						<input type="hidden" name="user_id" value=<%=myentry.getValue().getUser_id()%>>
						<input type="hidden" name="claim_date" value=<%=myentry.getValue().getRequest_date()%>>
						<input type="hidden" name="claim_reason" value=<%=myentry.getValue().getClaim_reason()%>>
						<input type="hidden" name="claim_index" value=<%=myentry.getKey()%>>
						<span class="col-md-3 btn btn-default btn-file form-group-option" style="margin-left: 24px;"> Document 1 <input type="file" name="file1<%=l%>" onchange='$("#upload-file-info1<%=l%>").html($(this).val()); text = $("#upload-file-info1<%=l%>").html(); text = text.substring(text.lastIndexOf("\\") + 1, text.length);$("#upload-file-info1<%=l%>").html(text);$("#uploaded").show();' id="file1<%=l%>" /></span> 
						<span class="col-md-3 col-md-offset-1 btn btn-default btn-file form-group-option"> Document 2 <input type="file" name="file2<%=l%>" onchange='$("#upload-file-info2<%=l%>").html($(this).val()); text = $("#upload-file-info2<%=l%>").html(); text = text.substring(text.lastIndexOf("\\") + 1, text.length);$("#upload-file-info2<%=l%>").html(text);' id="file2<%=l%>"></span> 
						<span class="col-md-3 col-md-offset-1 btn btn-default btn-file form-group-option">Document 3 <input type="file" name="file3<%=l%>" onchange='$("#upload-file-info3<%=l%>").html($(this).val()); text = $("#upload-file-info3<%=l%>").html(); text = text.substring(text.lastIndexOf("\\") + 1, text.length);$("#upload-file-info3<%=l%>").html(text);' id="file3<%=l%>"></span>
						<h3 id="uploaded" class="col-md-6 col-md-offset-4" style="border-bottom:none;">Your Uploaded Files</h3> 
						<div class="col-md-3"><div class="label label-info" id="upload-file-info1<%=l%>"></div></div>
						<div class="col-md-3 col-md-offset-1"><div class="label label-info" id="upload-file-info2<%=l%>"></div></div>
						<div class="col-md-3 col-md-offset-1"><div class="label label-info" id="upload-file-info3<%=l%>"></div></div>
						<div id="filelength" style="margin-bottom: 10px;" class="col-md-3  col-md-offset-4 label label-danger"></div>
						<input type="submit" id="submit-button" class="btn btn-success btn-block cms-modal-btn voffset3" value="Upload Documents" />
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
	
	
	
	


<script type="text/javascript">


$('#file1<%=l%>').change(function(){
	var filename1 = $('#file1<%=l%>').val();
	console.log(filename1.length);
	if (filename1.length > 40 ) {
		 $("#filelength").html("File 1 name too long!");
		}
	else  $("#filelength").hide();
});

$('#file2<%=l%>').change(function(){
	var filename2 = $('#file2<%=l%>').val();
	console.log(filename2.length);
	if (filename2.length > 40 ) {
		$("#filelength").show();
		 $("#filelength").html("File 2 name too long!");
		}
	else  $("#filelength").hide();
});

$('#file3<%=l%>').change(function(){
	var filename3 = $('#file3<%=l%>').val();
	console.log(filename3.length);
	if (filename3.length > 40 ) {
		$("#filelength").show();
		 $("#filelength").html("File 3 name too long!");
		}
	else  $("#filelength").hide();
});


$(document).ready(function() {
	
	$("#uploaded").hide();
    $('#defaultForm').formValidation({
    	button: {            
            selector: '[type="submit"]',            
            disabled: ''
        },
        fields: {
            file1<%=l%>: {
                validators: {    
                	 file: {
                         extension: 'doc,docx,jpeg,jpg',
                         type: 'application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/rtf,image/jpeg',
                         maxSize: 2097152,   // 2048 * 1024
                         message: 'The selected file is not valid'
                     },
                    
                    notEmpty: {
                        message: 'The first file is required'
                    },
                    
                    different: {
                        field: 'file2<%=l%>',
                        message: 'The files cannot be the same. '
                    }

                }
            },
            
            file2<%=l%>: {
                validators: {
                    file: {
                        extension: 'doc,docx,jpeg,jpg',
                        type: 'application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/rtf,image/jpeg',
                        maxSize: 2097152,   // 2048 * 1024
                        message: 'The selected file is not valid'
                    },
                    
                    notEmpty: {
                        message: 'The second file is required'
                    },
                    
                    different: {
                        field: 'file1<%=l%>',
                        message: 'The files cannot be the same. '
                    }
                }
            },
            
            file3<%=l%>: {
                validators: {
                    file: {                    	
                        extension: 'doc,docx,jpeg,jpg',
                        type: 'application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/rtf,image/jpeg',
                        maxSize: 2097152,   // 2048 * 1024
                        message: 'The selected file is not valid'
                    },
                    
                    notEmpty: {                    	
                        message: 'The third file is required'
                    },
                    
                    different: {                    	
                        field: 'file2<%=l%>',
                        message:  'The files cannot be the same. '
                    }
                }
            }
        }
    });
});
 
</script>
<%
	}}
%>

	<%@include file="userfooter.jsp"%>