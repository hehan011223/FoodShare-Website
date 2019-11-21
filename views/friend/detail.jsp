<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <li class="nav-item"> <a class="nav-link" href="blogList.do">Home</a> </li>
        <li class="nav-item"> <a class="nav-link" href="index.do">Account</a> </li>
        <li class="nav-item active"> <a class="nav-link" href="friendList.do">Friends<span class="sr-only">(current)</span></a> </li>
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
					<form class="form-horizontal">
                        <div class="heading">
                            <h3>
									<font color="red">${person.fname} ${person.mname} ${person.lname}</font>
								</h3>
                            <br>
                        </div>
                        <div class="article">
								<div class="text">
									<p class="text">-Name : ${person.fname} ${person.mname} ${person.lname}</p>
									 <br>
									<p class="text">-Address : ${person.addr} </p>
									 <br>
									<p class="text">-E-mail : ${person.email} </p>
									 <br>
									<p class="text">-Gender : ${person.gender}</p>
									 <br>
									<p class="text">-Bom on : ${person.dob}</p>
									 <br>
								</div>                     
							</div>
							<c:if test="${flag == 1}"><a href="editPerson.do?personId=${person.id}" class="general_button w_icon edit"><span>Edit My Info</span></a></c:if>
							<c:if test="${flag == 2}"><a href="delFriend.do?friendId=${person.id}" class="general_button w_icon remove"><span>Remove Friend</span></a></c:if>
							<c:if test="${flag == 3}"><a href="addFriend.do?friendId=${person.id}" class="general_button w_icon registration"><span>Add as Friend</span></a></c:if> 
					</form>
				</div>
            </div>
		</div>
	</div>		
</section>

</body>
</html>