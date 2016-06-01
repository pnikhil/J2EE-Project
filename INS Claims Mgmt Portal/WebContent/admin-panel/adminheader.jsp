<%
response.setHeader("Pragma","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Expires","0"); 
response.setDateHeader("Expires",-1);
%>

<%
if(session.getAttribute("admin_name") == null){
	
	response.sendRedirect("../index");
	
}
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard - Claims Management System</title>
		

    <!-- JQUERY -->
<script	src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<link rel="shortcut icon" sizes="16x16" href="<%=request.getContextPath()%>/resources/images/favicon.ico" />	
<!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/formValidation.css" type="text/css" rel="stylesheet">
<%-- <link href="<%=request.getContextPath()%>/resources/css/bootstrap-datepicker.min.css" type="text/css" rel="stylesheet"> --%>
<%-- <script src="<%=request.getContextPath()%>/resources/js/hideforms.js"></script> --%>
<script	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>

<script	src="<%=request.getContextPath()%>/resources/js/formValidation.js"></script>
<script	src="<%=request.getContextPath()%>/resources/js/bootstrapFormValidation.js"></script>
<script	src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<style type="text/css">
body {  
   background:#333 url(../resources/bg.jpg);
   background-repeat:initial;
  -webkit-background-size: cover;
  -moz-background-size: cover;
 -o-background-size: cover;
 background-size: cover;     
}
</style>
</head>


<div class="navbar navbar-default navbar-fixed-top dashboardpageheader" role="navigation">
    <div class="container">
    <a class="navbar-brand" rel="home" href="index.jsp" title="">
        		<img style="max-width: 135px; min-height: 42px; margin-top: -9px;"
            		 src="<%=request.getContextPath()%>/resources/images/logo.png">
   			 		</a>
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">  
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <nav class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav navbar-right">
            <li><a href="admin_dashboard" class="cms-menutext"><i class="fa fa-dashboard"></i> My Dashboard</a></li>                
                <li class="menu-item dropdown">
                    <a href="#" class="dropdown-toggle cms-menutext" data-toggle="dropdown"><i class="fa fa-users"></i> Registration Details<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li class="menu-item dropdown dropdown-submenu">
                            <li><a href="PendingUsers">Pending Registrations</a></li> 
                            <li><a href="AllUsers">Approved Members</a></li> 
                              <li><a href="RejectedUsers">Rejected Members</a></li>                             
                    </ul>
               	</li>               		 
               		<li class="menu-item dropdown">
                    <a href="#" class="dropdown-toggle cms-menutext" data-toggle="dropdown"><i class="fa fa-info-circle"></i> Claim Details<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li class="menu-item dropdown dropdown-submenu">
                            <li><a href="PendingClaimsForApproval">Pending Claims</a></li>
                            <li><a href="ApprovedUserClaims">Approved Claims</a></li>
                            <li><a href="RejectedUserClaims">Rejected Claims</a></li>
                              <li><a href="SearchClaims">Search All Claims</a></li>                             
                    	</ul>
               		 </li>  
               		 
               		  <li class="menu-item dropdown">
                    <a href="#" class="dropdown-toggle cms-menutext" data-toggle="dropdown"><i class="fa fa-bar-chart"></i> Final Claim Option<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li class="menu-item dropdown dropdown-submenu">
                            <li><a href="FinalClaimProcess">Final Claim Process</a></li> 
                            <li><a href="FinalApprovedClaims">Final Approved Claims</a></li> 
                        </ul>
               		 </li>					
					<li><a href="<%=request.getContextPath()%>/admin-panel/admin_logout" class="cms-menutext"><i class="fa fa-sign-out"></i> Logout</a></li>
				</ul>
        </nav>
    </div>
</div>


<script type="text/javascript">
$(function() {
    var pgurl = window.location.href.substr(window.location.href.lastIndexOf("/")+1);
    $("nav ul li a").each(function(){
         if($(this).attr("href") == pgurl || $(this).attr("href") == '/admin_dashboard' )
         $(this).addClass("active");
    })
});
</script>