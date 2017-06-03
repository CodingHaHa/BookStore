<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>订单列表</title>

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
	href="<c:url value='/jsp/pager/pager.css'/>" />
<script type="text/javascript"
	src="<c:url value='/jsp/pager/pager.js'/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/adminjsp/admin/css/order/list.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/css.css'/>" />
<!--包含BootStrap的CSS文件-->
<link rel="stylesheet" href="/BookStore/bootstrap/css/bootstrap.min.css">
<!--1:首先把JQuery包含-->
<script src="/BookStore/bootstrap/js/jquery.min.js"></script>
<!--2:再包含其他js文件-->
<script  src="/BookStore/bootstrap/js/bootstrap.min.js"></script>
<script  src="/BookStore/bootstrap/js/holder.min.js"></script>
<script src="/BookStore/bootstrap/js/application.js"></script>
<style type="text/css">
  .mes{
    height: 35px;
  }
  
</style>
</head>

<body>
   <div>
		<div class="btn-group">
		  <a class="btn btn-danger btn-lg mes" href="<c:url value='/admin/AdminOrderServlet?method=findAll'/>">订单信息</a>
		  <button type="button" class="btn btn-danger btn-lg mes dropdown-toggle" data-toggle="dropdown">
		    <span class="caret"></span>
		  </button>
		  <ul class="dropdown-menu" role="menu">
		    <li><a href="<c:url value='/admin/AdminOrderServlet?method=findByStatus&status=1'/>">未付款</a></li>
		    <li><a href="<c:url value='/admin/AdminOrderServlet?method=findByStatus&status=2'/>">已付款</a></li>
		    <li><a href="<c:url value='/admin/AdminOrderServlet?method=findByStatus&status=3'/>">已发货</a></li>
		    <li class="divider"><a href="<c:url value='/admin/AdminOrderServlet?method=findByStatus&status=4'/>">交易成功</a></li>
		    <li><a href="<c:url value='/admin/AdminOrderServlet?method=findByStatus&status=5'/>">已取消</a></li>
		  </ul>
		</div>
	</div>
	<div class="divMain">
		<div class="title">
			<div style="margin-top: 7px; background-color: orange;">
				<span style="margin-left: 150px; margin-right: 280px; height: 40">商品信息</span>
				<span style="margin-left: 40px; margin-right: 100px;">金额</span> <span
					style="margin-left: 50px; margin-right: 53px;">订单状态</span> <span
					style="margin-left: 100px;">操作</span>
			</div>
		</div>
		<br />
		<table align="center" border="0" width="100%" cellpadding="0"
			cellspacing="0">



			<c:forEach items="${pb.beanList }" var="order">

				<tr class="tt">
					<td width="320px">订单号：<a
						href="<c:url value='/admin/AdminOrderServlet?method=findByOid&oid=${order.oid }' />">${order.oid }</a></td>
					<td width="200px">下单时间：${order.ordertime }</td>
					<td width="178px">&nbsp;</td>
					<td width="205px">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr style="padding-top: 10px; padding-bottom: 10px;">
					<td colspan="2"><c:forEach items="${order.orderItemList }"
							var="orderItem">

							<img border="0" width="70"
								src="<c:url value='/${orderItem.book.image_b }'/>" />
							</a>
						</c:forEach></td>
					<td style="padding-left: 0"><span class="price_t">&yen;${order.total }</span>
					</td>

					<td><c:choose>
							<c:when test="${order.status eq 1 }">(等待付款)</c:when>
							<c:when test="${order.status eq 2 }">(准备发货)</c:when>
							<c:when test="${order.status eq 3}">(等待确认)</c:when>
							<c:when test="${order.status eq 4 }">(交易成功)</c:when>
							<c:when test="${order.status eq 5 }">(已取消)</c:when>
						</c:choose></td>
					<td><a
						href="<c:url value='/admin/AdminOrderServlet?method=findByOid&oid=${order.oid }' />">查看</a><br />
						<c:if test="${order.status eq 1 }">
							<a
								href="<c:url value='/admin/AdminOrderServlet?method=findByOid&oid=${order.oid }&btn=cancel' />">取消</a>
							<br />
						</c:if> <c:if test="${order.status eq 2 }">
							<a
								href="<c:url value='/admin/AdminOrderServlet?method=findByOid&oid=${order.oid }&btn=deliver'/>">发货</a>
							<br />
						</c:if></td>
				</tr>


			</c:forEach>
		</table>
		<br />
		<%@include file="/jsp/pager/pager.jsp"%>
	</div>
</body>
</html>
