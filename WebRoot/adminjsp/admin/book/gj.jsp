<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>组合查询</title>

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
<style>
  body{
    background:#cc99cc;
  }
  
  .container{
    position: absolute;;
    left: 230px;
    top:20px;
  
  }

 .table{
   width:370px;
   height:300px;
   background:#FFcc99;
   opacity:0.8;
 
 }
 .disabled{
   width:75px;
   font-size:13pt;
   
 }
</style>
</head>

<body>
	<!--container Start-->
   <div class="container">
     <div>
	    <form action="<c:url value='/admin/AdminBookServlet'/>" method="get">
		<input type="hidden" name="method" value="findByCombination" />
			<table class="table table-hover">
			  <tr>
				<td><div class="btn btn-info disabled">书名：</div></td>
				<td><input type="text" name="bname" class="form-control" placeholder="书名"/></td>
			</tr>
			<tr>
				<td><div class="btn btn-info disabled">作者：</div></td>
				<td><input type="text" name="author" class="form-control" placeholder="作者"/></td>
			</tr>
			<tr>
				<td><div class="btn btn-info disabled">出版社：</div></td>
				<td><input type="text" name="press" class="form-control" placeholder="出版社"/></td>
			</tr>
			   <tr>
			    <td></td>
				<td><input type="submit" class="btn btn-info btn-lg" value="提交">
				<input type="reset"  class="btn btn-danger btn-lg pull-right" value="重置"></td>
			  </tr>
			</table>		
			 
	   </form>
 
	</div>
   <!--container End-->
   </div>  
	
	
	<%-- <form action="<c:url value='/BookServlet'/>" method="get">
		<input type="hidden" name="method" value="findByCombination" />
		<table align="center">
			<tr>
				<td>书名：</td>
				<td><input type="text" name="bname" /></td>
			</tr>
			<tr>
				<td>作者：</td>
				<td><input type="text" name="author" /></td>
			</tr>
			<tr>
				<td>出版社：</td>
				<td><input type="text" name="press" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" value="搜　　索" /> <input type="reset"
					value="重新填写" /></td>
			</tr>
		</table>
	</form> --%>
</body>
</html>
