<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.mfrp.beans.UserDetailsBean"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.*,java.text.*"%>
<%@ include file="userheader.jsp" %>
<%@ page import="com.mfrp.servlets.*" %>

<body>

<div class="modal fade" id="com-rm-modal"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="cms-element-modal-container">
					<button class="close" aria-hidden="true" data-dismiss="modal">
						<span style="margin-right: 10px; font-size: 20px;"><i class="fa fa-times fa-2x"></i></span>
					</button>
					<div class="cms-modal-name ">
						<p>Final Claim Amount Rule</p>

					</div>

					<div class="cms-modal-content">

						<div class="row">
						
						
  					<h4 class="col-md-offset-5">For Vehicle Insurance</h4>
  					
  		<table class = "table table-striped">
	<thead>
      <tr>
         <th class="col-md-1">Claim Reason</th>
         <th class="col-md-1">Claim Amount (of Maximum Claim Amount)</th>         
      </tr>
   </thead>   
   <tbody>
      <tr>
         <td class="col-md-1">Repair</td>
         <td class="col-md-1">40%</td>
         
      </tr>      
      <tr>
         <td class="col-md-1">Stolen</td>
         <td class="col-md-1">70%</td>         
      </tr>      
   </tbody>   
</table>
  					
  					
  					
  					<h4 class="col-md-offset-5">For Home Insurance</h4>
  					
  							<table class = "table table-striped">
	<thead>
      <tr>
         <th class="col-md-1">Claim Reason</th>
         <th class="col-md-1">Claim Amount (of Maximum Claim Amount)</th>         
      </tr>
   </thead>   
   <tbody>
      <tr>
         <td class="col-md-1">Renovate</td>
         <td class="col-md-1">50%</td>
         
      </tr>      
      <tr>
         <td class="col-md-1">Destroyed</td>
         <td class="col-md-1">70%</td>         
      </tr>      
   </tbody>   
</table>
  					<h4 class="col-md-offset-5">For Life Insurance</h4>
  					
  							<table class = "table table-striped">
	<thead>
      <tr>
         <th class="col-md-1">Claim Reason</th>
         <th class="col-md-1">Claim Amount (of Maximum Claim Amount)</th>         
      </tr>
   </thead>   
   <tbody>
      <tr>
         <td class="col-md-1">Treatment</td>
         <td class="col-md-1">Full amount with 5% tax deduction</td>
         
      </tr>      
      <tr>
         <td class="col-md-1">Death</td>
         <td class="col-md-1">100%</td>         
      </tr>      
   </tbody>   
</table>
  					
							

						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	
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
                    <div class="cms-heading" style="font-variant: small-caps;">Submit a <font color="#447fc8">New Claim</font></div>
             <%
         		SimpleDateFormat sdf1 = new SimpleDateFormat("MMMM d, YYYY");
                Calendar c = Calendar.getInstance();
                c.setTime(new Date()); 
                c.add(Calendar.DATE, 45); 
                String output = sdf1.format(c.getTime());
            %>  
                       <% if(request.getAttribute("claim_rejected") != null) {                   
                    	   out.print("<center><div class=\"alert alert-danger voffset2\"><h3>Claim Request On Hold. Check Your Claim Status Later.</h3></div></center>");
                       }
                      		else if(request.getAttribute("claim_added") != null) {   %> 
                      <%                
                  			 out.print("<center><div class=\"alert alert-success voffset2\"><h4>You Have Successfully Requested For A Claim. <br /> Your Claim Will Be Processed Before " + output +"</h4></div></center>");%>
                      
                       <% } %> 
                      
                       
                     <%--  <% if(session.getAttribute("success_message") != null) {                   
                  			 out.print("<center><div class=\"alert alert-warning voffset2\"><h4>You have successfully updated your Profile</h4></div></center>");%>
                      
                       <% } %>  --%>
                          <div class="row">
    
    <!-- <div class="registration voffset1"> -->
						
			<div align="center">
			
		<form role="form" id="defaultForm" class="voffset4 form-horizontal" name="UserNewClaimRequest" action="UserNewClaimRequest" method="post">			
				
				<div class="col-md-4 voffset1"><label>User ID</label></div>
				<div class="form-group col-md-6">				
					<input type="text"
						name="user_id" id="user_id" class="form-control" 
						value="<%=myentry.getKey()%>" readonly>
				</div>
				
				<div class="col-md-4 voffset1"><label>First Name</label></div>
				<div class="form-group col-md-6">				
					<input type="text"
						name="user_firstname" readonly id="user_firstname" class="form-control" 
						value="<%=myentry.getValue().getUser_first_name()%>">
				</div>
				<div class="col-md-4 voffset1"><label>Last Name</label></div>
				<div class="form-group col-md-6">
					<input class="form-control" readonly type="text" name="user_lastname" id="user_lastname" value="<%=myentry.getValue().getUser_last_name()%>">
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
				
				<div class="col-md-4 voffset1"><label>Max. Claim Amount</label></div>
				<div class="form-group col-md-6"><span id="printvalue"></span>
					<input type="text" id="max_claim_amount" name="max_claim_amount"
						class="form-control" value=<%=myentry.getValue().getUser_max_claim_amount()%> readonly>
				</div>
				
				<div class="col-md-4 voffset4" style="margin-top:10px;"><label>Insurance Type</label></div>
				<div class="form-group col-md-6">
					<input type="text" name="insurance_type" id="insurance_type" class="form-control" value= <%=myentry.getValue().getUser_insurance_type()%> readonly>
				</div> 
				
				<div class="col-md-4 voffset1"><label>Claim Request Date</label></div>
				<div class="form-group col-md-6">
					<input type="text" name="request_date" id="datepicker1" class="form-control" readonly>
				</div>
				<%if(myentry.getValue().getUser_insurance_type().matches("Vehicle")) {%>
						
				 <div class="col-md-4 voffset4" style="margin-top:30px;"><label>Claim Reason <span class="mandatory">*</span></label></div>
				<div class="form-group col-md-6">
					<label></label> <select name="claim_reason" onchange="loadXMLDoc()"  id="claim_reason" class="form-control">						
						<option value="" label="Select Your Choice" >Select Your Choice</option>
						<option value="Repair">Repair Claim</option>
						<option value="Stolen">Stolen Claim</option>						
					</select>
				</div> 
				<%} else if(myentry.getValue().getUser_insurance_type().matches("Home")) { %>				
				
				
				 <div class="col-md-4 voffset4" style="margin-top:30px;"><label>Claim Reason <span class="mandatory">*</span></label></div>
				<div class="form-group col-md-6">
					<label></label> <select name="claim_reason" onchange="loadXMLDoc()"  id="claim_reason" class="form-control ">
						<option value=""  label="Select Your Choice">Select Your Choice</option>
						<option value="Renovate">Renovate Claim</option>
						<option value="Destroyed">Destroy Claim</option>						
					</select>
				</div> 
				<%} else if(myentry.getValue().getUser_insurance_type().matches("Life")) { %>
				
				
				 <div class="col-md-4 voffset4" style="margin-top:30px;"><label>Claim Reason <span class="mandatory">*</span></label></div>
				<div class="form-group col-md-6">
					<label></label> <select name="claim_reason" onchange="loadXMLDoc()" id="claim_reason" class="form-control ">
						<option value="" label="Select Your Choice">Select Your Choice</option>
						<option value="Treatment">Treatment Claim</option>
						<option value="Death">Death Claim</option>						
					</select>
				</div>	
				
				<%} %>
				
				
				<div id="deathclaim">
				<div class="col-md-4 voffset1">
							<label>Death Reason <span class="mandatory">*</span></label>
						</div>
						<div class="form-group col-md-6">
							<textarea name="death_reason" maxlength="100" id="death_reason"
								class="form-control" rows="3" placeholder="Enter Death Reason"></textarea>
						</div>
				
						<div class="col-md-4 voffset1">
							<label>Date of Death<span class="mandatory">*</span></label>
						</div>
						<div class="form-group col-md-6">
							<input type="text" name="death_date" autocomplete="off"
								class="form-control" placeholder="YYYY-MM-DD" id=datepicker>
						</div>
						<div id="nom1">
						<div class="col-md-4 voffset1">
							<label>Nominee Name 1<span class="mandatory">*</span></label>
						</div>
						<div class="form-group col-md-6">
							<input type="text" maxlength="25" autocomplete="off"
								name="nominee_1" id="nominee_1" class="form-control"
								placeholder="Enter Nominee Name"> 
						</div>
						</div>
						<div id="nom2">
						<div class="col-md-4 voffset1">
							<label>Nominee Name 2<span class="mandatory">*</span></label>
						</div>
						<div class="form-group col-md-6">
							<input type="text" maxlength="25" autocomplete="off"
								name="nominee_2" id="nominee_2" class="form-control"
								placeholder="Enter Nominee Name"> 
						</div>
						</div>
						<div id="nom3">
						<div class="col-md-4 voffset1">
							<label>Nominee Name 3<span class="mandatory">*</span></label>
						</div>
						<div class="form-group col-md-6">
							<input type="text" maxlength="25" autocomplete="off"
								name="nominee_3" id="nominee_3" class="form-control"
								placeholder="Enter Nominee Name"> 
						</div>
						</div>
				</div>
				
				
				<div class="col-md-4 voffset1"><label>Final Claim Amount</label></div>
				<div class="form-group col-md-6"><span id="printvalue"></span>
					<input type="text" id="final_claim_amount" name="final_claim_amount"
						class="form-control" readonly>
				</div>
				<h3><i data-toggle="modal" data-target="#com-rm-modal" class="col-md-1 fa fa-info-circle voffset1"></i></h3>
					<input type="hidden" type="text" id="current_date" name="current_date"
						class="form-control" readonly>			
				
				<div class="container-fluid voffset4">
					<div class="col-md-6 col-md-offset-3">						
							<input type="submit" class="btn btn-success btn-lg btn-block" id="submit-button" name="update" value="Request for Claim">
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

$('#deathclaim').hide();

$('#nom1').hide();
$('#nom2').hide();
$('#nom3').hide();

$('#claim_reason').change(function(){
	var target = $('#claim_reason option:selected').val();
	if(target == ("Death"))	{
		$('#deathclaim').show();	
	}
	else $('#deathclaim').hide();
	
	var target2 = $('#nominee_count option:selected').val();
	if(target2 == 1){
		$('#nom1').show();
		$('#nom2').hide();
		$('#nom3').hide();
	}
	else if(target2 == 2){
		$('#nom1').show();
		$('#nom2').show();
		$('#nom3').hide();
	}
	else if(target2 == 3){
		$('#nom1').show();
		$('#nom2').show();
		$('#nom3').show();
	}
});

$('#nominee_count').change(function(){
	
	var target3 = $('#nominee_count option:selected').val();
	if(target3 == 1){
		$('#nom1').show();
		$('#nom2').hide();
		$('#nom3').hide();
	}
	else if(target3 == 2){
		$('#nom1').show();
		$('#nom2').show();
		$('#nom3').hide();
	}
	else if(target3 == 3){
		$('#nom1').show();
		$('#nom2').show();
		$('#nom3').show();
	}
});


 $(document).ready(function() {
	 
	 var found = [];
	 $("select option").each(function() {
	   if($.inArray(this.value, found) != -1) $(this).remove();
	   found.push(this.value);
	 });
		
	    $('#defaultForm').formValidation({      	
	    	button: {            
	            selector: '[type="submit"]',            
	            disabled: ''
	        },
	        
	        fields: {        	
	        	user_firstname: {                
	                validators: {
	                    notEmpty: {
	                        message: 'The first name is required'
	                    },
	                    regexp: {
	                        regexp: /^(?=.*?[A-z]).{3,20}$/,
	                        message: 'The firstname should be only alphabets and not above 20 characters.'
	                    },
	                    different: {
	                        field: 'user_lastname',
	                        message: 'The first name and last name cannot be the same. '
	                    }
	                }
	            },
	            user_lastname: {               
	                validators: {
	                    notEmpty: {
	                        message: 'The last name is required'
	                    },
	                    regexp: {
	                        regexp: /^(?=.*?[A-z]).{3,20}$/,
	                        message: 'The lastname should be only alphabets and not more than 20 char.'
	                    },
	                    different: {
	                        field: 'user_firstname',
	                        message: 'The first name and last name cannot be the same. '
	                    }
	                }
	            },
	            
	            
	            insurance_type: {            	
	                validators: {
	                    notEmpty: {
	                        message: 'Type of insurance is required'
	                    }
	                }
	            },
	            
	            death_reason : {
					validators : {
						notEmpty : {
							message : 'Fill death Reason'
						}
					}
				},
				
				death_date : {
					validators : {
						notEmpty : {
							message : 'Date of Death Required'
						}
					}
				},
				
				nominee_1 : {
					validators : {
						notEmpty : {
							message : 'Nominee 1 Name required'
						},
	                    different: {
	                        field: 'nominee_2',
	                        message: 'The nominee names cannot be the same. '
	                    }
					}
				},
				
				nominee_2 : {
					validators : {	
						notEmpty : {
							message : 'Nominee 2 Name required'
						},
	                    different: {
	                        field: 'nominee_1',
	                        message: 'The nominee names cannot be the same. '
	                    }
					}
				},
				
				nominee_3 : {
					validators : {	
						notEmpty : {
							message : 'Nominee 3 Name required'
						},
                		different: {
                    		field: 'nominee_1',
                    		message: 'The nominee names cannot be the same. '
               					 }
						}
				},
	            
	            claim_reason: {            	
	                validators: {
	                    notEmpty: {
	                        message: 'Claim Reason is required'
	                    }
	                }
	            },
	            
	            nominee_count: {            	
	                validators: {
	                    notEmpty: {
	                        message: 'Number of Nominees is required'
	                    }
	                }
	            },
	          
	            max_claim_amount: {            	
	                validators: {
	                    notEmpty: {
	                        message: 'Maximum claim amount not retrieved'
	                    }
	                }
	            }
	            
	        }
	    });
	});
 
 $(function() {
		var dt = new Date();		
		$('#datepicker').datepicker({
			format : 'yyyy-mm-dd',
			endDate : dt,
			autoclose : true
		});
	});

 
 var today = new Date();
 var dd = today.getDate();
 var mm = today.getMonth()+1; 

 var yyyy = today.getFullYear();
 if(dd<10){
     dd='0'+dd
 } 
 if(mm<10){
     mm='0'+mm
 } 
 var today = yyyy + '-' + mm + '-' + dd;
 document.getElementById("datepicker1").value = today; 

 </script>
  <script src="<%=request.getContextPath()%>/resources/js/userAjaxDataLoad.js"></script>	
<%@ include file="userfooter.jsp" %>