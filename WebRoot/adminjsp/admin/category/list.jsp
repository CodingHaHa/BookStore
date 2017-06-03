<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>分类列表</title>

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
<link rel="stylesheet" type="text/css"
	href="<c:url value='/adminjsp/admin/css/category/list.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/css.css'/>">
</head>

<body>
	<table align="center" border="1" cellpadding="0" cellspacing="0">
		<caption class="captionAddOneLevel">
			<a class="btn btn-info btn-lg" href="<c:url value='/adminjsp/admin/category/add.jsp'/>">添加一级分类</a>
		</caption>
		<tr class="trTitle">
			<th>分类名称</th>
			<th>描述</th>
			<th width="216px">操作</th>
		</tr>
		<c:forEach items="${parents }" var="parent">

			<tr class="trOneLevel">
				<td width="200px;">${parent.cname }</td>
				<td>${parent.desc }</td>
				<td width="200px;"><a class="btn btn-danger btn-sm"
					href="<c:url value='/admin/AdminCategoryServlet?method=addChildPre&pid=${parent.cid }'/>">添加二级分类</a>
					<a class="btn btn-primary btn-sm"
					href="<c:url value='/admin/AdminCategoryServlet?method=editParentPre&cid=${parent.cid }' />">修改</a>
					<a onclick="return confirm('您是否真要删除该一级分类？')" class="btn btn-warning btn-sm"
					href="/BookStore/admin/AdminCategoryServlet?method=deleteParent&cid=${parent.cid }">删除</a>
				</td>
			</tr>

			<c:forEach items="${parent.children }" var="child">
				<tr class="trTwoLevel">
					<td>${child.cname }</td>
					<td>${child.desc }</td>
					<td width="200px;" align="right"><a
						href="<c:url value='/admin/AdminCategoryServlet?method=editChildPre&cid=${child.cid }'/>">修改</a>
						<a onclick="return confirm('您是否真要删除该二级分类？')"
						href="/BookStore/admin/AdminCategoryServlet?method=deleteChild&cid=${child.cid }">删除</a>
					</td>
			</c:forEach>
		</c:forEach>

	</table>
</body>
</html>
