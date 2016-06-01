<%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>404 Error!</title>
</head>
<body>

<div class="row col-md-6 col-md-offset-3 voffset2">

            <div class="signinbar">
            <a href="<%=request.getContextPath()%>" class="btn btn-warning">Go To Home <i class="fa fa-home"></i></a> 
                <div align="center">   
                
                    
		<h2 class="voffset1">User Login</h2>

		<form role="form" class="voffset1" id="defaultForm" action="UserLogin" method="post">
			<div class="form-group form-inline">				
					<label class="col-md-3 col-md-offset-1 voffset1" for="firstname">Username: <span class="mandatory">*</span></label> <div class="input-prepend"><span class="add-on"><h3 style="border-bottom: 0;"><i class="fa fa-user"></i></h3></span><input type="text"
						name="username" id="username" style="text-transform: uppercase;" maxlength="20" autofocus autocomplete="off" class="form-control" rows="5" 
						placeholder="MBC-XXXXX"></div>
				</div>
				
				<div class="form-group form-inline">				
					<label class="col-md-3 col-md-offset-1 voffset1" for="firstname">Password: <span class="mandatory">*</span></label><div class="input-prepend"><span class="add-on"><h3 style="border-bottom: 0;"><i class="fa fa-lock"></i></h3></span><input type="password"
						name="userpassword" id="userpassword" maxlength="20" autocomplete="off" onkeypress="capLock(event)" class="form-control" rows="5" 
						placeholder="*********"><br /></div>
						<div id="capsOn" class="label label-danger voffset1" style="visibility:hidden">CAPS LOCK IS ON</div>
				</div>
			<div class="btn-container">
				<input type="submit" value="Login"
					class="btn btn-success btn-signin">
			   </div>
		    </form>
	     </div>
         </div>
       </div>
</body>
<script type="text/javascript">

$(document).ready(function() {
	
    $('#defaultForm').formValidation({      	
    	button: {            
            selector: '[type="submit"]',            
            disabled: ''
        },
        
        fields: {        	
        	username: {                
                validators: {
                    notEmpty: {
                        message: 'The username is required'
                    }
                }
            },
            
            
            userpassword: {            	
                validators: {
                    notEmpty: {
                        message: 'The password is required'
                    }
                }
            }
        }
    });
});

window.onload = function() {
	var user_pwd = document.getElementById('user_password');
	user_pwd.onpaste = function(e) {
	  e.preventDefault();
	}
	}

</script>
<%@ include file="footer.jsp" %>