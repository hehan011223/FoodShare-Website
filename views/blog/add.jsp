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

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="layout/css/BlogList.css">
<script type="text/javascript" src="layout/js/BlogList.js"></script>
</head>
<body>

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
        <li class="nav-item active"> <a class="nav-link" href="blogList.do">Home<span class="sr-only">(current)</span></a> </li>
        <li class="nav-item"> <a class="nav-link" href="index.do">Account</a> </li>
        <li class="nav-item"> <a class="nav-link" href="friendList.do">Friends</a> </li>
        <li class="nav-item"> <a class="nav-link" href="messageList.do">Messages</a> </li>
        <li class="nav-item"> <a class="nav-link" href="logout.do">Log Out</a> </li>
      </ul>
    </div>
  </div>
      </nav>
</section>

<!-- CONTENT BEGIN -->
<section class="banner-sec">
    <div class="container" style="clear:both;">
        <div class="span12">
             <div class="span6">
             <h3>Leave a Blog</h3>
							<p class="text">You should be cautious. Required fields are marked <span>*</span></p>
							<form action="addBlog.do" class="w_validation" id="addform"	method="post" onsubmit="return check()">
								<p>Subject<span>*</span></p>
								<div class="field">
									<input type="text" class="req" id="subject" name="subject">
									<br>
									<br>
								</div>
								<!--  
								<p>Restaurant<span>*</span></p>
								<div class="field">
									<input type="text" class="req" id="restaurant" name="restaurant">
									<br>
									<br>
								</div>
								-->
								<p>Image<span>*</span></p>
								<div>
								    <input type="file" id="imagefile" name="imagefile">
								</div>
								<div class="field">
									<input type="text" id="imageurl" name="imageurl">
								</div> 
								<br>
								<p>Body<span>*</span></p>
								<div class="textarea">
									<textarea cols="40" rows="5" id="body" name="body"></textarea>
								</div>
								<input type="submit" class="general_button" value="Post Blog" id="submit">
							</form>      
				</div>
		 </div>
	 </div>
 </section>			
 <script>	
	$("input[name=imagefile]").change(function() {
		for (var i = 0; i < $(this).get(0).files.length; ++i) {
			var filePath = $(this).val().split('\\');	
			document.getElementById('imageurl').value = "images/"+filePath[filePath.length-1];
		}
	})
</script>		
</body>

<script type="text/javascript">
	var check = function() {
		var subject = $("#subject").val();
		var body = $("#body").val();
		var imageurl = $("#imageurl").val();
		var restaurant = $("#restaurant").val();

		if (subject == "" || body == "" || imageurl == "" || restaurant == "") {
			alert("Required filed is empty!");
			return false;
		} else {
			return true;
		}
	}
	</script>
</html>