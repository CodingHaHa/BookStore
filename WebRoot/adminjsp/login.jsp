<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>管理员登录页面</title>

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

<script type="text/javascript">
		function checkForm() {
			if(!$("#adminname").val()) {
				alert("管理员名称不能为空！");
				return false;
			}else if(!$("#adminpwd").val()) {
				alert("管理员密码不能为空！");
				return false;
			}else{
				$.ajax({
					cache: false,
					async: false,
					type: "POST",
					dataType: "json",
					data: {method: "login"},
					url: "/BookStore/AminServlet",
					success: function(flag) {
						if(!flag) {
							alert(message)
							return false;
							$(".btn").attr("disabled", true);
						}
					}
				});
				
			}
			return true;
		}
	</script>
<style type="text/css">
 body{
    background:#FFFF99;
  }
  .container{
    position: relative;
    left:200px;
    top: 10px;
  }
 .table{
   width:400px;
   height:300px;
   background:#cc99cc;
   text-align:left;
 }
 .info{
   font-size:15pt;
 }
 .form-control{
   width:200px;
 }
 .gly{
   width: 400px;
 }
</style>
</head>

<body>
   <!--container Start-->
   <div class="container">
     <div>
        <div class="btn btn-primary btn-lg disabled gly">管理员后台登陆</div></div>
	    <form action="<c:url value='/AminServlet'/>" method="post"
		onsubmit="return checkForm();" target="_top">
		<input type="hidden" name="method" value="login" />
			
		 <table class="table">
		   <tr>
		      <td><span class="info">管理员:</span></td>
			  <td><input  type="text" class="form-control" name="adminname" value="" id="adminname"></input></td>
		   </tr>
		   <tr>
		      <td><span class="info">密　码：</span></td>
			  <td><input  type="password"  name="adminpwd" id="adminpwd" class="form-control"></input></td>
		   </tr>
		   <tr>
		      <td></td>
			  <td><input type="submit" class="btn btn-warning btn-lg" value="管理后台"></input></td>
		   </tr>
		   
		 </table>
	   </form>
	</div>
   <!--container End-->
    
</body>
</html>
