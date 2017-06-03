<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>top</title>
<base target="body">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!--包含BootStrap的CSS文件-->
<link rel="stylesheet" href="/BookStore/bootstrap/css/bootstrap.min.css">
<!--1:首先把JQuery包含-->
<script src="/BookStore/bootstrap/js/jquery.min.js"></script>
<!--2:再包含其他js文件-->
<script  src="/BookStore/bootstrap/js/bootstrap.min.js"></script>
<script  src="/BookStore/bootstrap/js/holder.min.js"></script>
<script src="/BookStore/bootstrap/js/application.js"></script>
<style type="text/css">


body {
			margin: 0;
			padding: 0;
			font-family: '微软雅黑';
			background-color: #FFFFCC;
		}
		
		.nav {
			margin-top: 10px;
			text-align: center;
			list-style: none;
		}

		li {
			width: 140px;
			height: 35px;
			text-align: center;
			line-height: 35px;
			float: left;
			position: relative;
			transform-style: preserve-3d;
			transition: all 0.5s;
		}

		li span {
			position: absolute;
			left: 0;
			top: 0;
			width: 100%;
			height: 100%;
		}

		li span:nth-child(1) {
			background-color: yellow;
			transform: rotateX(90deg) translateZ(20px);
		}

		li span:nth-child(2) {
			background-color: green;
			color: #FFF;
			transform: translateZ(20px);
		}

		li:hover {
			transform: rotateX(-90deg);
		}
   .col-md-2{
     margin-top:10px;
	 font-size:11pt;
   }
    .col-md-3{
      position: absolute;
      right: 40px;
      top:50px;
    }
</style>
</head>

<body >
	
	<!--container Start-->
   <div class="container">
      <div class="col-md-12">
       <h1 style="text-align: center; line-height: 25px; font-size: 20px;">基于J2EE的在线书籍销售系统后台</h1>
      </div>
	<div class="row">
	       <div class="col-md-2 pull-left">
		      欢迎管理员：<span style="font-weight: 2px;color: fuchsia;">${sessionScope.admin.adminname }</span>&nbsp;&nbsp;登陆
		   </div>
		   <div class="col-md-7">
			<ul class="nav">
				<li>
					<span><a href="<c:url value='/admin/AdminCategoryServlet?method=findAll'/>">分类管理</a></span>
					<span>后台管理</span>
				</li>
				<li>
					<span><a href="<c:url value='/admin/AdminBookServlet?method=addPre'/>">图书管理</a></span>
					<span>后台管理</span>
				</li>
				<li>
					<span>
					<a href="<c:url value='/admin/AdminOrderServlet?method=findAll'/>">订单管理</a></span>
					<span>后台管理</span>
				</li>
				<li>
					<span><a target="_blank" href="<c:url value='/AminServlet?method=exit'/>">退出系统</a></span>
					<span>后台管理</span>
				</li>
			</ul>
		   </div>
		   <div class="col col-md-3">
				<form action="<c:url value='/admin/AdminBookServlet'/>" method="get"  class="navbar-form navbar-center">
					<input type="hidden" name="method" value="findByBname" />
			      <div class="form-group">
			        <input type="text" name="bname" class="form-control" placeholder="书名">
			      </div>
			      <button type="submit" class="btn btn-default">快速搜索</button>
			    </form>
		   </div>
	     </div>
		
   <!--container End-->
   </div> 
</body>
</html>
