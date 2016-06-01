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
                                      
                    
		<h2 class="voffset1">Admin Login</h2>

		<form role="form" class="voffset1" id="defaultForm" action="AdminLoginValidate" method="post">
			<div class="form-group form-inline">				
					<label class="col-md-3 col-md-offset-1 voffset1" for="admin_username">Username:</label> <div class="input-prepend"><span class="add-on"><h3 style="border-bottom: 0;"><i class="fa fa-user"></i></h3></span> <input type="text" maxlength="20" style="text-transform: lowercase;" name="admin_username" id="admin_username" autofocus autocomplete="off" class="form-control"  placeholder="administrator" required>
				</div>
				</div>
				<div class="form-group form-inline">				
					<label class="col-md-3 col-md-offset-1 voffset1" for="admin_password">Password:</label> <div class="input-prepend"><span class="add-on"><h3 style="border-bottom: 0;"><i class="fa fa-lock"></i></h3></span><input type="password" maxlength="20" name="admin_password" id="admin_password" autocomplete="off" onkeypress="capLock(event)" class="form-control"  placeholder="*********" required><br>
						<div id="capsOn" class="label label-danger voffset1" style="visibility:hidden">CAPS LOCK IS ON</div>
				</div>
				</div>
			
			<div class="btn-container">
				<input type="submit" value="Login" class="btn btn-success btn-signin">
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
        	admin_username: {                
                validators: {
                    notEmpty: {
                        message: 'The username is required'
                    }
                }
            },
            admin_password: {            	
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
	var user_pwd = document.getElementById('admin_password');
	user_pwd.onpaste = function(e) {
	  e.preventDefault();
	}
	}

</script>
<%@ include file="footer.jsp" %>