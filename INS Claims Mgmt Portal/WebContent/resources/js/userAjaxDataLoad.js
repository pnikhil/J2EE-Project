function loadXMLDoc() {   

    var max_claim_amount = document.getElementById("max_claim_amount").value;   
    var insurance_type = document.getElementById("insurance_type").value; 
    var claim_reason = document.getElementById("claim_reason").value; 
    
    var xhttp= new XMLHttpRequest();
   
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4) {        	
            var final_claim_amount  = xhttp.responseText;			       
            document.getElementById("final_claim_amount").value = final_claim_amount;
        }   
    };
    xhttp.open("GET", "../RetrieveFinalClaimAmount?max_claim_amount="+max_claim_amount+"&insurance_type="+insurance_type+"&claim_reason="+claim_reason+"", true);
    xhttp.send();
}