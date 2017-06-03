<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>top</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
   <link rel="stylesheet" href="cbdb-btn.css"/>
	-->
	<!--包含BootStrap的CSS文件-->
<link rel="stylesheet" href="/BookStore/bootstrap/css/bootstrap.min.css">
<!--1:首先把JQuery包含-->
<script src="/BookStore/bootstrap/js/jquery.min.js"></script>
<!--2:再包含其他js文件-->
<script  src="/BookStore/bootstrap/js/bootstrap.min.js"></script>
<script  src="/BookStore/bootstrap/js/holder.min.js"></script>
<script src="/BookStore/bootstrap/js/application.js"></script>
<link rel="stylesheet" href="<c:url value='/jsp/css/cbdb-btn.css'/>" />
<script type="text/javascript"></script>
<style type="text/css">
  .sea{
    position: absolute;
    left: 500px;
  }
</style>
	
</head>

<body id="body" style="overflow-x: hidden; overflow-y: hidden;">
	<h2 style="text-align: center; margin-top: 0px">基于J2EE的在线书籍销售系统</h2>


		<div style="font-size: 9pt; line-height: 10px;">
	<ul class="cbdb-menu" style="margin-right: 5px; margin-top: 2px">

			<!-- 根据用户是否登录，显示不同的信息 -->
			<c:choose>
				<c:when test="${empty sessionScope.sessionUser}">
					<li><a href="<c:url value='/jsp/user/login.jsp'/>"
						target="_parent" class="green dark">会员登录</a></li>
					<li><a href="<c:url value='/jsp/user/regist.jsp'/>"
						target="_parent" class="yellow dark">注册会员</a></li>
						
					<div class="container">
				     <div class="sea col-md-8 col-offset-7">
					    <form class="navbar-form navbar-center" action="<c:url value='/BookServlet'/>" method="get" target="body"
						id="form1">
						           <input type="hidden" name="method" value="findByBname"/> 
							  <div class="form-group">
									<input type="text" name="bname" class="form-control" placeholder="搜索">
							  </div>
							  <a href="javascript:document.getElementById('form1').submit();" type="submit" class="btn btn-default">搜索</a>
							  <a href="<c:url value='/jsp/gj.jsp'/>" class="btn btn-danger" target="body">高级搜索</a>
					   </form>
					   
					</div>
				   <!--container End-->
				   </div>

				</c:when>
				<c:otherwise>
					<li>会员：<font size="5" style="display: inline-block;"
						color="blank">${sessionScope.sessionUser.loginname} </font>&nbsp;欢迎登录！
					</li>
					<li><a href="<c:url value='/CartItemServlet?method=myCart'/>"
						target="body" class="green dark">我的购物车</a></li>
					<li><a href="<c:url value='/OrderServlet?method=myOrders'/>"
						target="body" class="red">我的订单</a></li>
					<li><a href="<c:url value='/jsp/user/pwd.jsp'/>" target="body"
						class="yellow dark">修改密码</a></li>
					<li><a href="<c:url value='/UserServlet?method=exit'/>"
						target="parent" class="yellow red cyan">退出系统</a></li>
					<%-- <li><a href="<c:url value='/jsp/adivce.jsp'/>" target="body"
						class="yellow dark">建议与反馈</a></li> --%>
					<li><a href="<c:url value='/adminjsp/login.jsp'/>"
						target="body" class="dark">后台管理</a></li>
				</c:otherwise>
			</c:choose>
	</ul>
	<div style="position: fixed;top: 5px;right: 35px;">
	  <img alt="" src="../images/dtbook01.jpg">
	</div>
	</div>
</body>
</html>
