<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>"></base>
<title>Food Share Blog</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="layout/css/BlogList.css">
<script type="text/javascript" src="layout/js/BlogList.js"></script>
<meta http-equiv="refresh" content ="5;url=index.do">
</head>
<body onload="shownum()">
<header>
        <div class="top-head left">
    <div class="container">
            <div class="row">
        <div class="col-md-6 col-lg-4">
                <h1>Food Sharing</h1> <small>Share your happiness from meal</small>
              </div>
        <div class="col-md-6 col-lg-3 ml-auto admin-bar hidden-sm-down">
                </div>
      </div>
          </div>
  </div>
</header>


<section class="top-nav">
    <nav class="navbar navbar-expand-lg py-0">
        <div class="container">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
    <div class="collapse navbar-collapse" id="exCollapsingNavbar2">
            <ul class="nav navbar-nav ">
        <li class="nav-item active"> <a class="nav-link" href="index.do">Home<span class="sr-only">(current)</span></a> </li>    
        
      </ul>
    </div>
  </div>
      </nav>
</section>

<!-- CONTENT BEGIN -->
		<!-- CONTENT BEGIN -->
<section class="banner-sec">
      <div class="container" style="clear:both;">
        <div class="span12">
             <div class="span6">
                <div class="area" style="float:left; width:500px;">
						<p class="general_title">
							<span>Register Success</span>
						</p>
						<div class="separator" style="height: 39px;"></div>
						<div class="block_registration" id="msg">
									
						</div>
						<div class="line_3" style="margin: 42px 0px 0px;"></div>
					</div>
				</div>
			</div>
		</div>
</section>
</body>
<script type="text/javascript"> 
var i = 6;
function shownum(){
	i=i-1;
	$("#msg").html("<h4>It will jump to login page after <font color='red'>"+ i +"</font> seconds</h4>");
	setTimeout('shownum()',1000); 
} 
</script>
</html>