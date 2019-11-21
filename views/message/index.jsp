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
        <li class="nav-item"> <a class="nav-link" href="friendList.do">Friends</a> </li>
        <li class="nav-item active"> <a class="nav-link" href="messageList.do">Messages<span class="sr-only">(current)</span></a> </li>
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
             
             <c:forEach items="${msgs}" var="msg">
								<article class="block_topic_post" style="width: 600px">
									<p class="title">
										<h3>${msg.subject }</h3>
									</p>
									<br>
									<p class="text">${msg.body }</p>
									<br>
									<br>
									<div class="info">
										<div class="date">
											<p><small class="text-time">${msg.createTime }</small></p>
										</div>
										<div class="r_part">
											<div class="category">
												<p>by  ${msg.person }
												 	&nbsp;| &nbsp;
												    <a href="getMsg.do?id=${msg.id }">view</a> 
													<c:if test="${msg.candel}">
														&nbsp;| &nbsp;
														<a href="delMsg.do?id=${msg.id }" onclick="javascript:if(confirm('delete it?')==true) return true; else return false">
															delete
														</a>
														<hr style="height:1px;border:none;border-top:1px solid #555555;" />
													</c:if>
												</p>
											</div>
										</div>
									</div>
								</article>
							</c:forEach>
             </div>
        </div>
     </div>
</section>

   <section class="action-sec">
          <div class="container">
              <div class="action-box text-center"><h2>You can write  messages to your friends by clicking on the link below </h2><a class="btn btn-success" href="toaddMsg.do" >Write Message</a></div>
          </div>
      </section>
</body>
</html>