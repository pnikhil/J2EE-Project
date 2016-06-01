function loadXMLDoc(element,j) {   

    var insurance_type = document.getElementById("insurance_type"+j).value;   
    var insurance_value = document.getElementById("insured_amount"+j).value;
    
    var xhttp= new XMLHttpRequest();    
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4) {
        	
            var temp = xhttp.responseText;
            var a = temp.split("||");
            
            document.getElementById("max_claimable_amount"+j).value = a[0];
            document.getElementById("max_claim_amount"+j).value = a[1];
        }   
    }
    xhttp.open("GET", "../FetchDataForAdminEditUser?insurance_type="+insurance_type+"&insurance_value="+insurance_value+"", true);
    xhttp.send();
}

/*function loadXMLDoc(element,j) {
    var xmlhttp;    
    //var keys = document.getElementById("insurance_type"+j).value;
    var val = element.value;
    var urls = "../FetchFromDB.jsp?ok=" + val
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4) {
            var xmlDoc = xmlhttp.responseXML.documentElement;
            console
            document.getElementById("insured_amount"+j).value = xmlDoc.getElementsByTagName("insurance_amount")[0].childNodes[0].nodeValue;
           // element.value = xmlDoc.getElementsByTagName("insurance_amount"+j)[0].childNodes[0].nodeValue;
            
            
            var amount = document.getElementById("insured_amount"+j).value;
            var amount2;
            if (document.getElementById("insured_amount"+j).value == 2000000)
                amount2 = amount * 0.91;
            else if (document.getElementById("insured_amount"+j).value == 500000)
                amount2 = amount * 0.80;
            else if (document.getElementById("insured_amount"+j).value == 1000000)
                amount2 = amount;
            document.getElementById("max_claimable_amount"+j).value = amount2;
        }
    }
    xmlhttp.open("GET", urls, true);
    xmlhttp.send();
}
*/
