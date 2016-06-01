$(document).ready(function() {
$("#insured_amount").change(function() {
	 var insurance_type = $("#insurance_type").val();
	 var insurance_value = $("#insured_amount").val();	 
            $.post('FetchData', {
           	id : insurance_type, id2: insurance_value
            }, function(responseText) {            	
            	$('#max_claimable_amount').val(JSON.parse(responseText).max_claim_amt);
            });
    });
});


function emailexists(){	
	
	var user_email_address = document.getElementById("user_email_address").value;	
    var xhttp= new XMLHttpRequest();    
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4) {        	
            var email_exists  = xhttp.responseText;			       
            document.getElementById("emailexists").innerHTML = email_exists;
            if(email_exists!="")
            	{
            		document.getElementById("user_email_address").value = "";
            		$('#user_email_address').css('border', 'solid 1px red');
            		
            		$("#user_email_address").change(function() {
            			$('#user_email_address').css('border', 'solid 1px #3c763d');
            		});           		
            		
            	}
          }   
    };
    xhttp.open("GET", "EmailExists?user_email_address="+user_email_address+"", true);
    xhttp.send();
}




/*function loadXMLDoc()  //XML OBJECT
        {
        	   var xmlHttp = false;
        	   try {
        	     xmlHttp = new ActiveXObject("Msxml2.XMLHTTP")  // For Old Microsoft Browsers
        	   }
        	   catch (e) {
        	     try {
        	       xmlHttp = new ActiveXObject("Microsoft.XMLHTTP")  // For Microsoft IE 6.0+
        	     }
        	     catch (e2) {
        	       xmlHttp = false   // No Browser accepts the XMLHTTP Object then false
        	     }
        	   }
        	   if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
        	     xmlHttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
        	   }
        	   return xmlHttp;  // Mandatory Statement returning the ajax object created
        	}
        	 
        	var xmlhttp = new loadXMLDoc();	//xmlhttp holds the ajax object
        	 
        	function ajaxFunction() {
        	  if(xmlhttp) {
        		var insurance_type = document.getElementById("insurance_type").value;      			
              // var insurance_value = document.getElementById("insured_amount").value;
               console.log(insurance_type);
        	    xmlhttp.open("POST","Testing",true); //getname will be the servlet name
        	    xmlhttp.onreadystatechange  = handleServerResponse;
        	    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        	    xmlhttp.send("insurance_type=" + insurance_type.value); 
        	   // xmlhttp.send("insured_amount=" + insured_amount.value); 
        	  }
        	}
        	 
        	function handleServerResponse() {
        	   if (xmlhttp.readyState == 4) {
        	     if(xmlhttp.status == 200) {
        	    	 document.getElementById("max_claimable_amount").value=xmlhttp.responseText;
        	     }
        	     else {
        	    	 document.getElementById("max_claimable_amount").value = "Error in retrieving"
        	     }
        	   }
        	}
    }
    xmlhttp.open("GET", urls, true);
    xmlhttp.send();
}




function loadXMLDoc() {
    
			var insurance_type = document.getElementById("insurance_type").value;			
            var insurance_value = document.getElementById("insured_amount").value;
            
            var maximum_claimable_amount;
            if(insurance_type == "Home")
            	maximum_claimable_amount = insurance_value* 0.91;
            else if(insurance_type == "Vehicle")
            	maximum_claimable_amount = insurance_value * 0.80;
            else if(insurance_type == "Life")
            	maximum_claimable_amount = insurance_value;            
            document.getElementById("max_claimable_amount").value = maximum_claimable_amount;
        }
   */