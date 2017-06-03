<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>pwd.jsp</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/css.css'/>">


<!--包含BootStrap的CSS文件-->
<link rel="stylesheet" href="/BookStore/bootstrap/css/bootstrap.min.css">
<!--1:首先把JQuery包含-->
<script src="/BookStore/bootstrap/js/jquery.min.js"></script>
<!--2:再包含其他js文件-->
<script  src="/BookStore/bootstrap/js/bootstrap.min.js"></script>
<script  src="/BookStore/bootstrap/js/holder.min.js"></script>
<script src="/BookStore/bootstrap/js/application.js"></script>
	
<script src="<c:url value='/js/common.js'/>"></script>
<script src="<c:url value='/jsp/js/user/pwd.js'/>"></script>

<style type="text/css">
   body{
    background:#FFFF66;
  }
  .well{
     height:70px;
  }
  
  .tt{
    width:90px;
  }
  
  .tderror{
    width:105px;
  }
  
  .table{
	left:300px;
	background:#FFFFFF;
	opacity:0.9;
	
	height:350px;
  }
  
  
  .bt{
    width:80px;
  }
   .reg{
    
     left:150px;
   }
  
</style>

</head>

<body>
	
   <!--container Start-->
   <div class="container">

      <div class="col-md-6 col-md-offset-3">
	   <div class="btn btn-danger disabled" style="width:100%;height:45px;">
		<h4><strong>密码修改</strong></h4>
	  </div>
	  
	  <form action="<c:url value='/UserServlet'/>" method="post"
			target="body">
	    <input type="hidden" name="method" value="updatePassword" />
		<table class="table  text-left">
		  <tr class="tr">
		    <td class="tt"><span class="bt btn btn-warning disabled">原密码:</span></td> 
			<td class="tc"><input type="password"  id="loginpass" value=" ${user.loginpass} " name="loginpass" class="input form-control" placeholder="老密码"></td>
			<td class="tderror"><label class="error"
							id="loginpassError" style="font-size: 12px;color: red;"></label></td>
		  </tr>
		
		  
		  <tr class="tr">
		    <td class="tt"><span class="bt btn btn-warning disabled">新密码:</span></td>
			<td class="tc"><input type="password" id="newpass" name="newloginpass" value=" ${user.newloginpass }" class="input form-control" placeholder="新密码"></td>
			<td class="tderror"><label id="newpassError" class="error"  style="font-size: 12px;color: red;"></label></td>
		  </tr>
		 
		  <tr class="tr">
		    <td class="tt"><span class="bt btn btn-warning disabled">确认密码:</span></td>
			<td class="tc"><input type="password" id="reloginpass" name="reloginpass" class="input form-control" value=" ${user.reloginpass} "  placeholder="确认密码"></td>
			<td class="tderror"><label class="error" id="reloginpassError" style="font-size: 12px;color: red;"></label></td>
		  </tr>
	
		  
		  <tr class="tr">
		    <td class="tt"><span class="bt btn btn-warning disabled"><strong class="strong">验证码:</strong></span></td>
			<td class="tc"><input type="text" id="verifyCode" name="verifyCode" class="input form-control" placeholder="验证码"></td>
			<td class="tderror"><label class="error" id="verifyCodeError" style="font-size: 12px;color: red;"></label></td>
		  </tr>
		  <tr class="tr">
		    <td class="tt"></td>
			<td class="tc"><img id="vCode" src="<c:url value='/VerifyCodeServlet'/>"
						border="1" /></td>
			<td class="tderror" ><label><a href="javascript:_change();">换一张</a></label></td>
		  </tr>
		  <tr>
		     <td></td>
		     <td>
		      <div class="bs">
		        <input type="submit" id="submit" class="reg btn btn-danger btn-lg pull-right" value="修改密码" style="width:150px;"></input>
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
