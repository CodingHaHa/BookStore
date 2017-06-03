<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'adivce.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--包含BootStrap的CSS文件-->
<link rel="stylesheet" href="/BookStore/bootstrap/css/bootstrap.min.css">
<!--1:首先把JQuery包含-->
<script src="/BookStore/bootstrap/js/jquery.min.js"></script>
<!--2:再包含其他js文件-->
<script  src="/BookStore/bootstrap/js/bootstrap.min.js"></script>
<script  src="/BookStore/bootstrap/js/holder.min.js"></script>
<script src="/BookStore/bootstrap/js/application.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<style type="text/css">
  body{
    background:#CC6633;
  }
  
 .container{
   position: relative;
   top:5px;
   left: 200px;
 }
 .table{
   width:570px;
   height:200px;
    position: absolute;;
   background:#FFcc99;
 }
 
 .advhe{
 width:570px;
 font-size: 25pt;
 }
 

</style>

</head>

<body>
	<!--container Start-->
   <div class="container">
     <div>
	    <form>
			<div>
				<span class="btn btn-info btn-lg advhe disabled">您的建议与反馈，是我们前进的动力</span>			      
			 </div>	
		 <table class="table">
		    <tr>
			  <td>
			    <div class="">
					<textarea class="form-control advice" rows="12"></textarea>
				</div>
			  </td>
			</tr>
			<tr>
			  <td>
					<div class="form-group ">
						<input type="submit" class="btn btn-info btn-lg pull-right" value="提交"></input>
					</div>
			  </td>
			</tr>
			
		 </table>
	   </form>
	</div>
   <!--container End-->
   </div>     
</body>
</html>
