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
                        <a class="btn btn-primary btn-lg btn-block" style="width:70%;"  href="<%=request.getContextPath()%>/admin_login">Admin
                        Login <i class="fa fa-sign-in"></i></a>
                    </div>
                    <div class="btn-container voffset1">
                        <a class="btn btn-danger btn-lg btn-block" style="width:70%;"  href="<%=request.getContextPath()%>/user_registration">User Register <i class="fa fa-user-plus"></i></a> <div class="btn-container voffset1">
                        
                        </div>
                        <a class="btn btn-success btn-lg btn-block" style="width:70%;" href="<%=request.getContextPath()%>/member_login">User Login <i class="fa fa-sign-in"></i></a>
                    </div>
                </div>
            </div>
        </div>
        
        
       
    </div>
</body>
<script type=text/javascript>
setTimeout(fade_out, 1000);

function fade_out() {
  $("#magicmessage").fadeOut().empty();
}

</script>
<%@ include file="footer.jsp" %>