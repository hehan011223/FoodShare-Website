<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="com.myblog.entity.Blog" %>
<%@ page import="java.util.List" %>
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


<section class="banner-sec">
<c:set var="length" value= "${fn:length(blogs) }"></c:set>
        <div class="container">
   <!--  <div class="row">
            <div class="col-md-3">
        <div class="card"> <img class="img-fluid" src=${blogs[length-1].imageurl } alt="">
                <div class="card-img-overlay"> <span class="badge badge-pill badge-danger">FastFood</span> </div>
                <div class="card-body">
            <div class="news-title">
                    <h2 class=" title-small"><a href="getBlog.do?id=${blogs[length-1].id }">${blogs[length-1].subject }</a></h2>
                  </div>
            <p class="card-text"><small class="text-time"><em>${blogs[length-1].createTime }    by  ${blogs[length-1].person }
				<c:if test="${blogs[length-1].candel}">
				<a href="delBlog.do?id=${blogs[length-1].id }" onclick="javascript:if(confirm('delete it?')==true) return true; else return false">
				delete</a>
				</c:if></em></small></p>
          </div>
              </div>
        <div class="card"> <img class="img-fluid" src=${blogs[length-2].imageurl } alt="">
                <div class="card-img-overlay"> <span class="badge badge-pill badge-danger">Pizza</span> </div>
                <div class="card-body">
            <div class="news-title">
                    <h2 class=" title-small"><a href="getBlog.do?id=${blogs[length-2].id }">${blogs[length-2].subject }</a></h2>
                  </div>
            <p class="card-text"><small class="text-time"><em>${blogs[length-2].createTime }    by  ${blogs[length-2].person }
				<c:if test="${blogs[length-2].candel}">
				<a href="delBlog.do?id=${blogs[length-2].id }" onclick="javascript:if(confirm('delete it?')==true) return true; else return false">
				delete</a>
				</c:if></em></small></p>
          </div>
              </div>
      </div>
            <div class="col-md-3">
        <div class="card"> <img class="img-fluid" src=${blogs[length-3].imageurl } alt="">
                <div class="card-img-overlay"> <span class="badge badge-pill badge-danger">Sweet</span> </div>
                <div class="card-body">
            <div class="news-title">
                    <h2 class=" title-small"><a href="getBlog.do?id=${blogs[length-3].id }">${blogs[length-3].subject }</a></h2>
                  </div>
            <p class="card-text"><small class="text-time"><em>${blogs[length-3].createTime }    by  ${blogs[length-3].person }
				<c:if test="${blogs[length-3].candel}">
				<a href="delBlog.do?id=${blogs[length-3].id }" onclick="javascript:if(confirm('delete it?')==true) return true; else return false">
				delete</a>
				</c:if></em></small></p>
          </div>
              </div>
        <div class="card"> <img class="img-fluid" src=${blogs[length-4].imageurl } alt="">
                <div class="card-img-overlay"> <span class="badge badge-pill badge-danger">FastFood</span> </div>
                <div class="card-body">
            <div class="news-title">
                    <h2 class=" title-small"><a href="getBlog.do?id=${blogs[length-4].id }">${blogs[length-4].subject }</a></h2>
                  </div>
            <p class="card-text"><small class="text-time"><em>${blogs[length-4].createTime }    by  ${blogs[length-4].person }
				<c:if test="${blogs[length-4].candel}">
				<a href="delBlog.do?id=${blogs[length-4].id }" onclick="javascript:if(confirm('delete it?')==true) return true; else return false">
				delete</a>
				</c:if></em></small></p>            
          </div>
              </div>
      </div>
            <div class="col-md-6 top-slider">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel"> 
                 
                <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
          </ol>
                
                <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
                    <div class="news-block">
                <div class="news-media"><img class="img-fluid" src=${blogs[length-5].imageurl } alt="" style="width:550px;height:450px"></div>
                <div class="news-title">
                        <h2 class=" title-large"><a href="getBlog.do?id=${blogs[length-5].id }">${blogs[length-5].subject }</a></h2>
                      </div>
                <div class="news-des">${blogs[length-5].body }</div>
                <div class="time-text"><strong>${blogs[length-5].createTime }</strong></div>
                <div></div>
              </div>
                  </div>
            <div class="carousel-item">
                    <div class="news-block">
                <div class="news-media"><img class="img-fluid" src=${blogs[length-6].imageurl } alt="" style="width:550px;height:450px"></div>
                <div class="news-title">
                        <h2 class=" title-large"><a href="getBlog.do?id=${blogs[length-6].id }">${blogs[length-6].subject }</a></h2>
                      </div>
                <div class="news-des">${blogs[length-6].body }</div>
                <div class="time-text"><strong>${blogs[length-6].createTime }</strong></div>                
                <div></div>
              </div>
                  </div>
            <div class="carousel-item">
                    <div class="news-block">
                <div class="news-media"><img class="img-fluid" src=${blogs[length-7].imageurl } alt="" style="width:550px;height:450px"></div>
                <div class="news-title">
                        <h2 class=" title-large"><a href="getBlog.do?id=${blogs[length-7].id }">${blogs[length-7].subject }</a></h2>
                      </div>
                <div class="news-des">${blogs[length-7].body }</div>
                <div class="time-text"><strong>${blogs[length-7].createTime }</strong></div>                
                <div></div>
              </div>
                  </div>
          </div>
              </div>
      </div>
          </div>
  </div>
      </section>
       -->
       
       <c:forEach items="${blogs}" var="blog">
								<article class="block_topic_post" style="width: 600px">
									<p class="title">
										<a href="javascript:void(0)">${blog.subject }</a>
									</p>
									<p class="image" style="width:600px">
									<a href="javascript:void(0)">
	                		        <img src= ${blog.imageurl } alt="Foodimage" title="Foodimage" style="width:550px;height:300px"/> 
	                		        </a></p>
									<p class="text">${blog.body }</p>
									<div class="info">
										<div class="date">
											<p>${blog.createTime }</p>
										</div>
										<div class="r_part">
											<div class="category">
												<p>by  ${blog.person }
												 	&nbsp;| &nbsp;
												    <a href="getBlog.do?id=${blog.id }">view</a> 
													<c:if test="${blog.candel}">
														&nbsp;| &nbsp;
														<a href="delBlog.do?id=${blog.id }" onclick="javascript:if(confirm('delete it?')==true) return true; else return false">
															delete
														</a>
													</c:if>
												</p>
											</div>
										</div>
									</div>
								</article>
							</c:forEach>
      
       <section class="action-sec">
          <div class="container">
              <div class="action-box text-center"><h2>You can write a blog yourself by clicking on the link below </h2><a class="btn btn-success" href="toaddBlog.do" >Write Blog</a></div>
          </div>
      </section>
      
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>