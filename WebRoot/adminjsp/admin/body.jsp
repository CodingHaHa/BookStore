<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>body.jsp</title>

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
  body{
   background: url(/BookStore/images/ttbj.jpg);
  }
  
  table {
    position:absolute;
    top:15px;
    left:70px;
	width: 500px;
	height: 400px;
}

 span{
   width: 500px;
 }

</style>
</head>

<body style="margin: 0px;">
  <div>
    
    <table >
     <caption>
       <span class="btn btn-info btn-lg">管理员注意事项</span>
  	</caption>
      
      <tr>
         <td>
           <div class="alert alert-info">
		  <a href="#" class="alert-link">1:不能够你随意删除系统内容</a>
		</div>
         </td>
      </tr>
      <tr>
         <td>
           <div class="alert alert-warning">
		  <a href="#" class="alert-link">2：遇到问题请咨询系统维护人员</a>
		</div>
         </td>
      </tr>
      <tr>
         <td>
           <div class="alert alert-danger">
		  <a href="#" class="alert-link">3：下架的书籍要及时删除</a>
		</div>
         </td>
      </tr>
      <tr>
         <td>
          <div class="alert alert-success">
		  <a href="#" class="alert-link">4：管理员密码不能随意告诉别人</a>
		</div>
         </td>
      </tr>
     
    </table>

		
		
		
		

    
  </div>

	
</body>
</html>
