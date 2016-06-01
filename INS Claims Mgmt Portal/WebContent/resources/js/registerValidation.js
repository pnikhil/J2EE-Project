function goBack() {
	window.history.back()
}

$(document).ready(function() {
	

	
    $('#user_firstname').on('keydown', function(event) {
        if (this.selectionStart == 0 && event.keyCode >= 65 && event.keyCode <= 90 && !(event.shiftKey) && !(event.ctrlKey) && !(event.metaKey) && !(event.altKey)) {
           var $t = $(this);
           event.preventDefault();
           var char = String.fromCharCode(event.keyCode);
           $t.val(char + $t.val().slice(this.selectionEnd));
           this.setSelectionRange(1,1);
        }
    });
    
    $('#user_lastname').on('keydown', function(event) {
        if (this.selectionStart == 0 && event.keyCode >= 65 && event.keyCode <= 90 && !(event.shiftKey) && !(event.ctrlKey) && !(event.metaKey) && !(event.altKey)) {
           var $t = $(this);
           event.preventDefault();
           var char = String.fromCharCode(event.keyCode);
           $t.val(char + $t.val().slice(this.selectionEnd));
           this.setSelectionRange(1,1);
        }
    });
});

$('#insurance_cov').hide();
$("#insurance_type").change(function() {
	var selected_option = $('#insurance_type').val();

	if (selected_option) {
		$('#insurance_cov').show();
	}
	if (selected_option == '') {
		$('#insurance_cov').hide();
		$('#insured_amount').val('');
		$('#max_claimable_amount').val('');
	}
});

$("#insurance_type").change(function() {
	$('#insured_amount').val('');
	$('#max_claimable_amount').val('');
});

$(function() {
	
        $('#user_firstname').blur(function() {
            var value = $.trim( $(this).val() );
            $(this).val( value );
        });
        
        $('#user_lastname').blur(function() {
            var value2 = $.trim( $(this).val() );
            $(this).val( value2 );
        });
	
	$('#user_contact_no').keyup(function() {
		if (this.value.match(/[^0-9]/g)) {
			this.value = this.value.replace(/[^0-9]/g, '');
		}
	});
	
	$('#insured_amount').keyup(function() {
		if (this.value.match(/[^0-9]/g)) {
			this.value = this.value.replace(/[^0-9]/g, '');
		}
	});
	
	$('#datepicker').keyup(function() {
		if (this.value.match(/[^0-9]/g)) {
			this.value = this.value.replace(/[^0-9-]/g, '');
		}
	});
	
	
	$('#user_firstname').keyup(function() {
		if (this.value.match(/[^A-z ]/g)) {
			this.value = this.value.replace(/[^A-z ]/g, '');
		}
	});
	
	$('#user_lastname').keyup(function() {
		if (this.value.match(/[^A-z ]/g)) {
			this.value = this.value.replace(/[^A-z ]/g, '');
		}
	});
	
});

$(document).ready(function() {
					$('#defaultForm')
							.formValidation(
									{
										button : {
											selector : '[type="submit"]',
											disabled : ''
										},

										fields : {
											user_firstname : {
												validators : {
													notEmpty : {
														message : 'The first name is required'
													},
													regexp : {
														regexp : /^[A-Z][a-zA-Z ]{1,20}$/,
														message : 'The name should be at least 2 characters'
													},
													different : {
														field : 'user_lastname',
														message : 'First letter should be caps. The first name and last name cannot be the same. '
													}
												}
											},
											user_lastname : {
												validators : {
													notEmpty : {
														message : 'The last name is required'
													},
													regexp : {
														regexp : /^[A-Z][a-zA-Z ]{0,20}$/,
														message : 'The last name should be at least 2 characters'
													},
													different : {
														field : 'user_firstname',
														message : 'The first name and last name cannot be the same. '
													}
												}
											},

											user_gender : {
												validators : {
													notEmpty : {
														message : 'The gender is required'
													}
												}
											},

											user_dob : {
												validators : {
													notEmpty : {
														message : 'You must be at least 18 years old. The date is required in dd-mm-yyyy format'
													}													
												}
											},

											user_contact_no : {
												validators : {
													notEmpty : {
														message : 'The contact number is required'
													},

													regexp : {
														regexp : /^[789]\d{9}$/,
														message : 'The contact number should be of 10 Digits only & a valid mobile number.'
													}
												}
											},

											user_address : {
												validators : {
													notEmpty : {
														message : 'Fill your address'
													},
													regexp : {
														regexp : /^[a-zA-Z0-9#\n()_|\\,./&: -]*$/,

														message : 'The address should have digits and alphabets.'
													},
													stringLength : {
														min : 10,
														max : 150,
														message : 'Address should be minimum 10 characters and maximum 100 characters'
													}

												}

											},

											insurance_type : {
												validators : {
													notEmpty : {
														message : 'Type of insurance is required'
													}
												}
											},

											nominee_count : {
												validators : {
													notEmpty : {
														message : 'Number of Nominees is required'
													}
												}
											},

											insured_amount : {
												validators : {
													notEmpty : {
														message : 'Insurance amount not entered'
													}
												}
											},

											user_email_address : {
												validators : {
													notEmpty : {
														message : 'The email address is required'
													},
													emailAddress : {
														message : 'The input is not a valid email address'
													},
													regexp : {
														regexp : /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/,
														message : 'The email should be of format abc@xyz.com'
													}
												}
											},

											user_password : {
												validators : {
													notEmpty : {
														message : 'The password is required'
													},
													different : {
														field : 'user_firstname',
														message : 'The password cannot be the same as firstname. '
													},
													stringLength : {
														min : 8,
														max : 20,
														message : 'The password must >6 and <12 characters. '
													},
													regexp : {
														regexp : /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[$@!*%?&]).{6,20}$/,
														message : 'The password should have a Uppercase, Lowercase, Number & Special Character,'
													}
												}
											},

											user_repassword : {
												validators : {
													notEmpty : {
														message : 'The password is required.'
													},
													identical : {
														field : 'user_password',
														message : ' The password should be same'
													}
												}
											}
										}
									});
				});

$(function() {
	var dt = new Date();
	dt.setFullYear(new Date().getFullYear() - 18);
	$('#datepicker').datepicker({
		format : 'dd-mm-yyyy',
		endDate : dt,
		autoclose : true
	})	
	.on('changeDate', function(e) {
	    // Revalidate the date when user change it
	    $('#defaultForm').bootstrapValidator('revalidateField', 'endDate');
	});
});



window.onload = function() {
	var user_pwd = document.getElementById('user_password');
	user_pwd.onpaste = function(e1) {
		e1.preventDefault();
	}

	var user_pwd2 = document.getElementById('user_repassword');
	user_pwd2.onpaste = function(e2) {
		e2.preventDefault();
	}

}