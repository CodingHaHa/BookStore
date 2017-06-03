<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>body</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">

<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link rel="stylesheet" type="text/css"
	href="/BookStore/jsp/css/body.css">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/jsp/css/book/list.css'/>">
<script type="text/javascript"
	src="<c:url value='/jsp/js/book/list.js'/>"></script>
<!--包含BootStrap的CSS文件-->
<link rel="stylesheet" href="/BookStore/bootstrap/css/bootstrap.min.css">
<!--1:首先把JQuery包含-->
<script src="/BookStore/bootstrap/js/jquery.min.js"></script>
<!--2:再包含其他js文件-->
<script  src="/BookStore/bootstrap/js/bootstrap.min.js"></script>
<script  src="/BookStore/bootstrap/js/holder.min.js"></script>
<script src="/BookStore/bootstrap/js/application.js"></script>
<style type="text/css">


 body{
    padding-top:20px;
  }
  .container{
    position: absolute;
    left: 75px;
  }
  
 .carousel{
  width:782px;
  
  }
  .carousel-indicators{
    position:absolute;
    width:130px;
	top:10px;
	left:500px;
  }
  .carousel-inner{
    width:782px;
  
  }
  .carousel-caption{
    position:absolute;
	left:0px;
	bottom:0px;
    width:782px;
	background:#272522;
	opacity:0.6;
  }
  .items{
    height: 368px;
  }

 
</style>
<script type="text/javascript">
$(function() {
	$(".inner").hover(function() {
		$(this).css("border", "3px solid #FFCFB1");
	}, function() {
		$(this).css("border", "3px solid #ffffff");
	});
});
</script>
</head>

<body style="overflow-x:hidden;overflow-y:auto">
	 <!--container Start-->
   <div class="container">
     
	 
      <div class="carousel slide pull-center" id="mycarousel" data-ride="carousel">
	     <!--指示灯-->
	     <ul class="carousel-indicators">
			<li data-target="#mycarousel" data-slide-to="0" class="active"></li>
			<li data-target="#mycarousel" data-slide-to="1"></li>
			<li data-target="#mycarousel" data-slide-to="2"></li>
			<li data-target="#mycarousel" data-slide-to="3"></li>
			<li data-target="#mycarousel" data-slide-to="4"></li>
		</ul>
		
		<div class="carousel-inner">
		    <!--active:激活第几个-->
			<div class="item active">
			  <img src="/BookStore/headImages/x1.jpg" alt="...">
			  <!--图片的注释-->
			  <div class="carousel-caption">
			     <p>
				    
				 </p>
			  </div>
			</div>
			
			<div class="item ">
			  <img src="/BookStore/headImages/x2.jpg" alt="...">
			  <!--图片的注释-->
			  <div class="carousel-caption">
			     <p>
				    
				 </p>
			  </div>
			</div>
			
			<div class="item ">
			  <img src="/BookStore/headImages/x3.jpg" alt="...">
			  <!--图片的注释-->
			  <div class="carousel-caption">
			     <p>
				    
				 </p>
			  </div>
			</div>
			
			<div class="item ">
			  <img src="/BookStore/headImages/x5.jpg" alt="...">
			  <!--图片的注释-->
			  <div class="carousel-caption">
			     <p>
				    
				 </p>
			  </div>
			</div>
			
			<div class="item ">
			  <img src="/BookStore/headImages/x5.jpg" alt="...">
			  <!--图片的注释-->
			  <div class="carousel-caption">
			     <p>
				    
				 </p>
			  </div>
			</div>
        </div>
		
		<a class="left carousel-control" href="#mycarousel" data-slide="prev">
			<span class="glyphicon "></span>
		</a>
		<a class="right carousel-control" href="#mycarousel" data-slide="next">
			<span class="glyphicon "></span>
		</a>
	  </div>
	  
	  <div class="col-md-12">
	     <h2 ><span style="font: oblique;pause: ms;">热销书籍</span></h2>
	     <hr style="color: navy;">
	  </div>

            <ul>
         <c:forEach items="${pbh}" var="book">
			<li class="items">
				<div class="inner">
					<c:url value="/BookServlet" var="idUrl">
						<c:param name="method" value="findByBid" />
						<c:param name="bid" value="${book.bid }" />
					</c:url>
					<a class="pic" href="${idUrl }"><img
						src="<c:url value='/${book.image_b} '/>" border="0" /></a>
					<p class="price">
						<span class="price_n">&yen;${book.currPrice }</span> <span
							class="price_r">&yen;${book.price }</span> (<span class="price_s">${book.discount }折</span>)
					</p>
					<c:url value="/BookServlet" var="bnameUrl">
						<c:param name="method" value="findByBname" />
						<c:param name="bname" value="${book.bname }" />
					</c:url>

					<p>
						<a id="bookname" title="${book.bname }" href="${bnameUrl }">${book.bname }</a>
					</p>
					<%--url标签会自动对url进行编码 --%>
					<c:url value="/BookServlet" var="authorUrl">
						<c:param name="method" value="findByAuthor" />
						<c:param name="author" value="${book.author }" />
					</c:url>

					<c:url value="/BookServlet" var="pressUrl">
						<c:param name="method" value="findByPress" />
						<c:param name="press" value="${book.press }" />
					</c:url>
					<p>
						<a href="${authorUrl }" title='${book.author }'>${book.author}</a>
					</p>
					<p class="publishing">
						<span>出 版 社：</span><a href="${pressUrl }">${book.press }</a>
					</p>
					<p class="publishing_time">
						<span>出版时间：</span>${book.publishtime }</p>
				</div>
			</li>
		</c:forEach>
			</ul>
            <!-- </div> -->
            
        <!--清除浮动-->
         <div class="clearfix"></div> 
       
      
	  
	
   <!--container End-->
   </div>     
</body>
</html>
