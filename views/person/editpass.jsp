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
        <li class="nav-item"> <a class="nav-link" href="blogList.do">Home</a> </li>
        <li class="nav-item active"> <a class="nav-link" href="index.do">Account<span class="sr-only">(current)</span></a> </li>    
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
                <div class="area" style="float:left; width:500px;">
					<form action="changePass.do" method="post" id="changeform">
							    <input type="hidden" class="req" name="id" id="id" value="${user.id }"/>
							    <input type="hidden" class="req" name="role" id="role" value="${user.role }"/>
							    <input type="hidden" class="req" name="personId" id="personId" value="${user.personId }"/>
								<div class="label">
									<p>
										Username<span>*</span>:
									</p>
								</div>
								<div class="field">
									<input type="text" class="req" name="username" id="username" value="${user.username }"/>
								</div>
								<div class="clearboth"></div>
								<div class="separator" style="height: 14px;"></div>
								
								<div class="label">
									<p>
										Password<span>*</span>:
									</p>
								</div>
								<div class="field">
									<input type="password" class="req" name="password" id="password"/>
								</div>
								<div class="clearboth"></div>
								<div class="separator" style="height: 12px;"></div>

								<div class="label">
									<p>
										Verify Password<span>*</span>:
									</p>
								</div>
								<div class="field">
									<input type="password" class="req" id="repassword"/>
								</div>
								<div class="clearboth"></div>
								<div class="separator" style="height: 32px;"></div>
								<p class="info_text">
									<input type="button" id="change" class="general_button"	value="Submit" />
								</p>
							</form>
                  </div>
            </div>
            
		</div>
</div>
</section>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<script type="text/javascript">
		$(function() {
			$("#change").click(function() {
				var password = $("#password").val();
				var repassword = $("#repassword").val();
				if(password == ""){
					alert("password is empty!");
					return;
				} 				
				if(password != repassword){
					alert("the passwords are different!");
					return;
				}
				$('#changeform').attr('action', "changePass.do");
				alert("edit password sucessfully");
				$('#changeform').submit();
			});
		});
	</script>

</body>
</html>