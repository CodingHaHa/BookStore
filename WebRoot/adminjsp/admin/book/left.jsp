<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript"
	src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='/adminjsp/admin/book/category/js/jquery.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/adminjsp/admin/book/category/js/menu_min.js'/>"></script>

<script type="text/javascript">
$(document).ready(function (){ 
  $(".menu ul li").menu();
}); 
$(function(){
	$(".togo").click(function(){
		parent['body'].location.href=this.href;
		return false;
	});
	
});
</script> 
<link rel="stylesheet" type="text/css"
	href="<c:url value='/adminjsp/admin/book/category/css/menu-css.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/adminjsp/admin/book/category/css/style.css'/>">


</head>
<body>
<div id="content">
<div class="menu">
<ul>
 <c:forEach items="${parents}" var="parent">
	
	<li><a class="active" href="#">${parent.cname}</a>
		<ul style="display: block;">
  <c:forEach items="${parent.children}" var="child">
			<li><a class="togo" href="/BookStore/admin/AdminBookServlet?method=findByCategory&cid=${child.cid}" target="body">${child.cname}</a></li>
	</c:forEach>
		</ul>				
	</li>
</c:forEach> 
	
</ul>
</div>
</div>
</body>
</html>