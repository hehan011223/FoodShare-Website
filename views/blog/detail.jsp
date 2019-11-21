<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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
             <article class="block_single_post" style="width: 600px">
             <div style="background-color:#FFFFFF">
                          	<h2 class="title"><a>${blog.subject }</a></h2>
                            <div class="info">
                                <div class="date"><small class="text-time"><p>${blog.createTime }</p></small></div>
                                <div class="author"><p>By: <a href="#"> ${blog.person }</a></p></div>
                            </div>
                            <div class="content">
                                <img src= ${blog.imageurl } alt="Foodimage" title="Foodimage" style="width:600px;height:550px"/>
                                 <br>
                            	<h2 class=" title-small"><a>${blog.body }</a></h2>
                            	<br>
                            	</div>
                            </div>
                            <div class="line_3" style="margin:4px 0px 23px;"></div>
                        </article>
                        
                        <c:if test="${fn:length(comments) > 0}">
	                        <div class="block_comments">
	                        	<h2>${fn:length(comments)} Comments</h2>
	                        	<c:forEach items="${comments}" var="comment">
		                            <div class="comment"style="background-color:#FFFFFF">
		                                <div class="content">
		                                	<h3 class="name"><a>${comment.subject}</a></h3>
		                                    <p class="info"><small class="text-time"><span class="date">${comment.createTime} by  ${comment.person}</span></small>
		                                    	<c:if test="${comment.candel}"><a href="delComment.do?commentid=${comment.id}&blogid=${blog.id }" class="control">Delete</a></c:if>
		                                    </p>
		                                    <p class="text">${comment.body}</p>
		                                </div>
		                                <div class="line_3"></div>
		                            </div>
		                         </c:forEach>
	                        </div>
	                    </c:if>
                        <div class="separator" style="height:30px;"></div>
                        <div class="block_leave_reply">
                        	<h3>Leave a Reply</h3>
                        	<p class="text">You should be cautious. Required fields are marked <span>*</span></p>
                        	<form class="w_validation" action="addComment.do" method="post" onsubmit="return check()"/>
                            	<input type="hidden" value="${blog.id}" name="blogId"/>
                            	<p>Subject<span>*</span></p>
                            	<div class="field"><input type="text" class="req" id="subject" name="subject" /></div>
                                <p>body</p>
                                <div class="textarea"><textarea cols="40" rows="5" name="body" id="body"></textarea></div>
                                <input type="submit" class="general_button" value="Post comment" />
                            </form>
                        </div>
                        
                    </div>
             </div>
        </div>
    </div>
</section>
</body>
</html>