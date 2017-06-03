<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>注册页面</title>

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
<script type="text/javascript" src="/BookStore/jsp/js/user/regist.js"></script>

<style type="text/css">
   body{
    background:#00cccc;
  }
  .well{
     height:70px;
  }
  
  .tt{
    width:90px;
  }
  
  .tderror{
    width:100px;
  }
  
  .table{
	left:300px;
	background:#FFFFFF;
	opacity:0.9;
	
	height:470px;
  }
  
  
  .bt{
    width:80px;
  }
   .reg{
     position:absolute;
     left:150px;
   }
</style>
</head>

<body id="body">

	<!--container Start-->
   <div class="container">

      <div class="col-md-5 col-md-offset-3">
	   <div class="btn btn-primary disabled" style="width:100%;height:45px;">
		<h4><strong>亲，赶紧注册个</strong></h4>
	  </div>
	  
	   
	  <form action="UserServlet" method="post" id="registForm">
	    <input type="hidden" name="method" value="regist" />
		<table class="table  text-left">
		  <tr class="tr">
		    <td class="tt"><span class="bt btn btn-warning disabled">用户名:</span></td>
			<td class="tc"><input type="text" id="loginname" name="loginname" class="inputClass form-control" placeholder="用户名"></td>
			<td class="tderror"><label class="errorClass"
							id="loginnameError" style="font-size: 12px;color: red;">${errors.loginname}</label></td>
		  </tr>
		  <tr class="tr">
		    <td class="tt"><span class="bt btn btn-warning disabled">密码：</span></td>
			<td class="tc"><input type="text" id="loginpass" name="loginpass" class="inputClass form-control" placeholder="密码"></td>
			<td class="tderror"><label class="errorClass" id="loginpassError" style="font-size: 12px;color: red;">${errors.loginpass}</label></td>
		  </tr>
		  <tr class="tr">
		    <td class="tt"><span class="bt btn btn-warning disabled">确认密码:</span></td>
			<td class="tc"><input type="text" id="reloginpass" name="reloginpass" class="inputClass form-control" placeholder="确认密码"></td>
			<td class="tderror"><label class="errorClass" id="reloginpassError" style="font-size: 12px;color: red;">${errors.reloginpass}</label></td>
		  </tr>
		  <tr class="tr">
		    <td class="tt"><span class="bt btn btn-warning disabled">Email地址:</span></td>
			<td class="tc"><input type="text" id="email" name="email" class="inputClass form-control" placeholder="Email地址"></td>
			<td class="tderror"><label class="errorClass" id="emailError" style="font-size: 12px;color: red;">${errors.email}</label></td>
		  </tr>
		  <tr class="tr">
		    <td class="tt"><span class="bt btn btn-warning disabled"><strong class="strong">验证码:</strong></span></td>
			<td class="tc"><input type="text" id="verifyCode" name="verifyCode" class="inputClass form-control" placeholder="验证码"></td>
			<td class="tderror"><label class="errorClass" id="verifyCodeError" style="font-size: 12px;color: red;">${errors.verifyCode}</label></td>
		  </tr>
		  <tr class="tr">
		    <td class="tt"></td>
			<td class="tc"><img id="imageVerifyCode" src="VerifyCodeServlet" /></td>
			<td class="tderror" ><label><a href="javascript:_changeVerifyCode()">换一张</a></label></td>
		  </tr>
		  
	    </table>
		
		 <div>
		    <input type="submit" id="submintBtn" class="reg btn btn-danger btn-lg pull-center" value="立即注册" style="width:150px;"></input>
		
		 </div>
	  </form>
      </div>
   <!--container End-->
   </div>    
</body>
</html>
