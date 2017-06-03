<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>按图名查询</title>

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
  .container{
    position: absolute;
    left: 200px;
    top:0px;
  }
</style>
</head>

<body>

  
        <!--container Start-->
   <div class="container">
     <div class="col-md-8 col-offset-4">
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
   
 
</body>
</html>
