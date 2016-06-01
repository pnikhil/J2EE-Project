$(function(){
	
	$('#AdminLoginBox').hide();
	$('#UserLoginBox').hide();
	
	   $('#AdminLogin').click(function(){
	            $('#OptionsPanel').hide();
	            $('#UserLoginBox').hide();
	            $('#AboutClaims').hide();
	            $('#magicmessage').hide();
	            $('#AdminLoginBox').show();
	            return false;
	        }); 	   
	  	   
	   $('#UserLogin').click(function(){
           $('#OptionsPanel').hide();
           $('#AdminLoginBox').hide();
           $('#AboutClaims').hide();
           $('#magicmessage').hide();
           $('#UserLoginBox').show();           
           return false;
       });
	   
	   $('#OptionsBox').click(function(){           
           $('#AdminLoginBox').hide();
           $('#UserLoginBox').hide();
           $('#magicmessage').hide();
           $('#AboutClaims').show();
           $('#OptionsPanel').show();
           return false;
       });
	   
	   $('#OptionsBox2').click(function(){           
           $('#AdminLoginBox').hide();
           $('#UserLoginBox').hide();
           $('#magicmessage').hide();
           $('#AboutClaims').show();
           $('#OptionsPanel').show();
           return false;
       });
	   
});

function capLock(e){
	 kc = e.keyCode?e.keyCode:e.which;
	 sk = e.shiftKey?e.shiftKey:((kc == 16)?true:false);
	 if(((kc >= 65 && kc <= 90) && !sk)||((kc >= 97 && kc <= 122) && sk))
	  document.getElementById('capsOn').style.visibility = 'visible';
	 else
	  document.getElementById('capsOn').style.visibility = 'hidden';
	}

function goBack() {
	window.history.back()
}

$("#AdminLogin").click(function(){
    $("#regonhold").hide();    
})
$("#UserLogin").click(function(){
    $("#regonhold").hide();    
})
$("#userregister").click(function(){
    $("#regonhold").hide();    
})

$("#AdminLogin").click(function(){
    $("#adminlogout").hide();    
})
$("#UserLogin").click(function(){
    $("#adminlogout").hide();    
})
$("#userregister").click(function(){
    $("#adminlogout").hide();    
})

$("#AdminLogin").click(function(){
    $("#userreg").hide();    
})
$("#UserLogin").click(function(){
    $("#userreg").hide();    
})
$("#userregister").click(function(){
    $("#userreg").hide();    
})

$("#AdminLogin").click(function(){
    $("#userexists").hide();    
})
$("#UserLogin").click(function(){
    $("#userexists").hide();    
})
$("#userregister").click(function(){
    $("#userexists").hide();    
})

$("#AdminLogin").click(function(){
    $("#regfailed").hide();    
})
$("#UserLogin").click(function(){
    $("#regfailed").hide();    
})
$("#userregister").click(function(){
    $("#regfailed").hide();    
})

$(document).ready(function() {
	
    $('#defaultForm2').formValidation({      	
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

$(document).ready(function() {

$('#defaultForm1').formValidation({      	
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
	
	var user_pwd2 = document.getElementById('user_repassword');
	user_pwd2.onpaste = function(e2) {
	  e2.preventDefault();
	}
}

