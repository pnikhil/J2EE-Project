<%@ include file="header.jsp" %>
<body>
    <div class="container-fluid">
        <div class="row col-md-9 col-md-offset-2 voffset2" id="AboutClaims">
         <% 
        if(request.getParameter("val")!=null){	String str=request.getParameter("val");
        response.getWriter().print("<div align=\"center\" id=\"magicmessage\" class=\"alert alert-warning voffset2\"><h3>"+str+"</h3></div>");
        }%>
            <div class="paragraph-container">
                <div align="center">
                    <h2>Insurance Claims Management System</h2>
                    <p style="text-align:justify;" class="voffset1">Claims handling is one of the most
                    complex issues for insurance companies. It involves
                    activities in order to make payment to the clients. We are providing insurance claims solution designed for 
claims management and processing support for a variety of claims types in a single system by offering a flexible solution to manage the entire claims process. </p>
  
                </div>
            </div>
        </div>
        <div class="row col-md-6 col-md-offset-3" style="margin-top:-20px;" id="OptionsPanel">
            <div class="paragraph-container" style="width:90%;">
                <div align="center">
                    <h2>Choose An Option</h2>
                    <div class="btn-container voffset1">
                        <a class="btn btn-primary btn-lg btn-block" style="width:70%;" id="AdminLogin" href="#">Admin
                        Login <i class="fa fa-sign-in"></i></a>
                    </div>
                    <div class="btn-container voffset1">
                        <a class="btn btn-danger btn-lg btn-block" style="width:70%;" id="userregister" href="<%=request.getContextPath()%>/user_registration">User Register <i class="fa fa-user-plus"></i></a> <div class="btn-container voffset1">
                        
                        </div>
                        <a class="btn btn-success btn-lg btn-block" style="width:70%;" id="UserLogin" href="#">User Login <i class="fa fa-sign-in"></i></a>
                    </div>
                </div>
            </div>
        </div>
 
        
        <div class="row col-md-6 col-md-offset-3" id="UserLoginBox">
            <div class="signinbar">
		<a href="#" class="label label-default cms-appliedusers " style="font-variant: small-caps;" id="OptionsBox">Go Back <i class="fa fa-arrow-left"></i></a> 
		<div class="text-right">
			<a class="label label-primary cms-appliedusers" href="user_register.jsp">New user? Register here <i class="fa fa-user-plus"></i></a>
		</div>
	<div align="center" style="margin-top: 13px;">
		<h2>User Login</h2>

		<form role="form" id="defaultForm1" class="voffset1" action="UserLogin" method="post">
		<div class="form-group form-inline">				
					<label class="col-md-3 col-md-offset-1 voffset1" for="firstname">Username: <span class="mandatory">*</span></label> <div class="input-prepend"><span class="add-on"><h3 style="border-bottom: 0;"><i class="fa fa-user"></i></h3></span><input type="text"
						name="username" id="username" maxlength="20" autofocus style="text-transform: uppercase;" autocomplete="off" class="form-control" rows="5" 
						placeholder="MBC-XXXXX"></div>
				</div>
				
				<div class="form-group form-inline">				
					<label class="col-md-3 col-md-offset-1 voffset1" for="firstname">Password: <span class="mandatory">*</span></label><div class="input-prepend"><span class="add-on"><h3 style="border-bottom: 0;"><i class="fa fa-lock"></i></h3></span><input type="password"
						name="userpassword" id="userpassword" maxlength="20" autocomplete="off" onkeypress="capLock(event)" class="form-control" rows="5" 
						placeholder="*********"><br /></div>
						<div id="capsOn" class="label label-danger voffset1" style="visibility:hidden">CAPS LOCK IS ON</div>
				</div>
			
			<div class="btn-container voffset1">
				<input type="submit" value="Login"
					class="btn btn-success btn-signin">
			   </div>
		    </form>
	     </div>
	  </div>
   </div>
   
   
        <div class="row col-md-6 col-md-offset-3" id="AdminLoginBox">
           <div class="signinbar">
		<a href="#" class="label label-default cms-appliedusers" id="OptionsBox2">Go Back <i class="fa fa-arrow-left"></i></a> 		
	<div align="center">
		<h2>Admin Login</h2>

		<form role="form" id="defaultForm2" class="voffset1" action="AdminLoginValidate" method="post">
			<div class="form-group form-inline">				
					<label class="col-md-3 col-md-offset-1 voffset1" for="admin_username">Username:</label> <div class="input-prepend"><span class="add-on"><h3 style="border-bottom: 0;"><i class="fa fa-user"></i></h3></span> <input type="text" style="text-transform: lowercase;" maxlength="20" name="admin_username" id="admin_username" autofocus autocomplete="off" class="form-control"  placeholder="administrator" required>
				</div>
				</div>
				<div class="form-group form-inline">				
					<label class="col-md-3 col-md-offset-1 voffset1" for="admin_password">Password:</label> <div class="input-prepend"><span class="add-on"><h3 style="border-bottom: 0;"><i class="fa fa-lock"></i></h3></span><input type="password" maxlength="20" name="admin_password" id="admin_password" onkeypress="capLock(event)" class="form-control"  autocomplete="off" placeholder="*********" required><br>
						<div id="capsOn" class="label label-danger voffset1" style="visibility:hidden">CAPS LOCK IS ON</div>
				</div>
				</div>
			
			<div class="btn-container">
				<input type="submit" value="Login" 
					class="btn btn-success btn-signin">
			   </div>
		    </form>
	     </div>
	  </div>
        </div>
        
    </div>
        
</body>

<script type=text/javascript>
setTimeout(fade_out, 6500);

function fade_out() {
  $("#magicmessage").fadeOut().empty();
}

</script>

<%@ include file="footer.jsp" %>