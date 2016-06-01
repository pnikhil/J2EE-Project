<%
response.setHeader("Pragma","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Expires","0"); 
response.setDateHeader("Expires",-1);
%>

<%
if(session.getAttribute("user_name") == null){	  
	  response.sendRedirect(request.getContextPath());
	  return ;
}
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Member Dashboard - Claims Management System</title>
		
       <!-- JQUERY -->
<script	src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<link rel="shortcut icon" sizes="16x16" href="<%=request.getContextPath()%>/resources/images/favicon.ico" />	
<!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/formValidation.css" type="text/css" rel="stylesheet">
<%-- <link href="<%=request.getContextPath()%>/resources/css/bootstrap-datepicker.min.css" type="text/css" rel="stylesheet"> --%>
<%-- <script	src="<%=request.getContextPath()%>/resources/js/hideforms.js"></script> --%>
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
<header class="navbar navbar-default navbar-fixed-top dashboardpageheader">
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
                    <li><a href="user_dashboard" class="cms-menutext"><i class="fa fa-dashboard"></i> My Dashboard</a></li>
                    <li><a href="UserDetails" class="cms-menutext"><i class="fa fa-user"></i> View Profile</a></li>
                    <li><a href="UserUpdateProfile" class="cms-menutext"><i class="fa fa-edit"></i> Edit Profile </a></li>
                     <li><a href="UserClaimRequest" class="cms-menutext"><i class="fa fa-money"></i> New Claim Request</a></li>
                    <li><a href="UserClaimStatus" class="cms-menutext"><i class="fa fa-check"></i> Claim Status</a></li>                   
					<li><a href="<%=request.getContextPath()%>/member-panel/user_logout" class="cms-menutext"><i class="fa fa-sign-out"></i> Logout</a></li>
                        
                    </ul>
                </nav>
            </div>
        </header> 
<script type="text/javascript">
$(function() {
    var pgurl = window.location.href.substr(window.location.href.lastIndexOf("/")+1);
    $("nav ul li a").each(function(){
         if($(this).attr("href") == pgurl || $(this).attr("href") == '/user_dashboard' )
         $(this).addClass("active");
    })
});
</script>