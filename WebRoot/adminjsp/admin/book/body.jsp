<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'body.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/adminjsp/admin/css/book/add.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/jquery/jquery.datepick.css'/>">

<script type="text/javascript"
	src="<c:url value='/jquery/jquery.datepick.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jquery/jquery.datepick-zh-CN.js'/>"></script>
<!--包含BootStrap的CSS文件-->
<link rel="stylesheet" href="/BookStore/bootstrap/css/bootstrap.min.css">
<!--1:首先把JQuery包含-->
<script src="/BookStore/bootstrap/js/jquery.min.js"></script>
<!--2:再包含其他js文件-->
<script  src="/BookStore/bootstrap/js/bootstrap.min.js"></script>
<script  src="/BookStore/bootstrap/js/holder.min.js"></script>
<script src="/BookStore/bootstrap/js/application.js"></script>

<style type="text/css">
 
</style>

<script type="text/javascript">
$(function () {
	$("#publishtime").datepick({dateFormat:"yy-mm-dd"});
	$("#printtime").datepick({dateFormat:"yy-mm-dd"});
	
	$("#btn").addClass("btn1");
	$("#btn").hover(
		function() {
			$("#btn").removeClass("btn1");
			$("#btn").addClass("btn2");
		},
		function() {
			$("#btn").removeClass("btn2");
			$("#btn").addClass("btn1");
		}
	);
	
	$("#btn").click(function() {
		var bname = $("#bname").val();
		var currPrice = $("#currPrice").val();
		var price = $("#price").val();
		var discount = $("#discount").val();
		var author = $("#author").val();
		var press = $("#press").val();
		var pid = $("#pid").val();
		var cid = $("#cid").val();
		var image_w = $("#image_w").val();
		var image_b = $("#image_b").val();
		
		if(!bname || !currPrice || !price || !discount || !author || !press || !pid || !cid || !image_w || !image_b) {
			alert("图名、当前价、定价、折扣、作者、出版社、1级分类、2级分类、大图、小图都不能为空！");
			return false;
		}
		
		if(isNaN(currPrice) || isNaN(price) || isNaN(discount)) {
			alert("当前价、定价、折扣必须是合法小数！");
			return false;
		}
		$("#form").submit();
	});
});


function loadChildren(){
	//1.获取pid
	//2.发出异步请求，成功-->得到一个数组-->获取cid元素(<select>)把内部的option全部删除
	//3.添加一个头<option>请选择二级分类</option>
	//4.循环数组，把数组中每一个对象转换为一个<option>添加到cid中
	var pid=$("#pid").val();
	
	$.ajax({
		async:true,
		cache:false,
		url:"/BookStore/admin/AdminBookServlet",
		data:{method:"ajaxFindChildren",pid:pid},
		type:"POST",
		dataType:"json",
		success:function(arr){
			//得到cid，删除它的内容
			$("#cid").empty();//删除元素的子元素
			$("#cid").append($("<option>===请选择2级分类===</option>"));//添加头
			//循环遍历数组，把每一个对象转换为<option>添加到cid
			for(var i=0;i<arr.length;i++){
				var option=$("<option>").val(arr[i].cid).text(arr[i].cname);
				$("#cid").append(option);
				
			}
		}
	
	});

}
 

</script>

<style type="text/css">
.container{

  width: 700px;
}
 
  .modal-dialog{
     width: 670px;
  }
</style>

</head>

<body style="background-image: url(/BookStore/images/ts.jpg)">
	<h1 align="center">书籍管理</h1>
	
	<!--container Start-->
   <div class="container">
   
      <form action="/BookStore/admin/AdminAddBookServlet"
			enctype="multipart/form-data" method="post" id="form">
	 <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#mymodel">
	    添加新书
	  </button>
	  
	  <!--fade:必须写，淡出效果-->
	  <div class="modal fade in" id="mymodel">
	      
		  <!--内容要写到modal对话框里面-->
		  <div class="modal-dialog">
		      <div class="modal-content">
			    <div class="modal-header">
				   <button class="close" data-dismiss="modal">X</button>
				   <h3 class="modal-title">添加新书</h3>  
				</div>
			  <div class="modal-body">
				<div>
		           <p style="font-weight: 900; color: red;">${msg }</p>
		
			<div>
				<ul>
					<li>书名： <input id="bname" type="text" name="bname"
						value="超级记忆术"
						style="width: 500px;" /></li>
					<li>大图： <input id="image_w" type="file" name="image_w" /></li>
					<li>小图： <input id="image_b" type="file" name="image_b" /></li>
					<li>当前价：<input id="currPrice" type="text" name="currPrice"
						value="40.7" style="width: 50px;" /></li>
					<li>定价： <input id="price" type="text" name="price"
						value="59.0" style="width: 50px;" /> 折扣：<input id="discount"
						type="text" name="discount" value="6.9" style="width: 30px;" />折
					</li>
				</ul>
				<hr style="margin-left: 50px; height: 1px; color: #dcdcdc" />
				<table>
					<tr>
						<td colspan="3">作者： <input type="text" id="author"
							name="author" value="陈玢" style="width: 150px;" />
						</td>
					</tr>
					<tr>
						<td colspan="3">出版社： <input type="text" name="press"
							id="press" value="北京联合出版社" style="width: 200px;" />
						</td>
					</tr>
					<tr>
						<td colspan="3">出版时间：<input type="text" id="publishtime"
							name="publishtime" value="2013-6-1" style="width: 100px;" /></td>
					</tr>
					<tr>
						<td>版次： <input type="text" name="edition" id="edition"
							value="1" style="width: 40px;" /></td>
						<td>页数： <input type="text" name="pageNum" id="pageNum"
							value="374" style="width: 50px;" /></td>
						<td>字数： <input type="text" name="wordNum" id="wordNum"
							value="48700" style="width: 50px;" /></td>
					</tr>
					<tr>
						<td width="250">印刷时间：<input type="text" name="printtime"
							id="printtime" value="2013-6-1" style="width: 100px;" /></td>
						<td width="250">开本： <input type="text" name="booksize"
							id="booksize" value="16" style="width: 30px;" /></td>
						<td>纸张： <input type="text" name="paper" id="paper"
							value="胶版纸" style="width: 50px;" /></td>
					</tr>
					<tr>
						<td>一级分类：<select name="pid" id="pid"
							onchange="loadChildren()">
								<option value="">===请选择1级分类===</option>
								<c:forEach items="${parents }" var="parent">
									<option value="${parent.cid }">${parent.cname }</option>
								</c:forEach>
						</select>
						</td>
						<td>二级分类：<select name="cid" id="cid">

								<option value="">===请选择2级分类===</option>

						</select>
						</td>
						<td></td>
					</tr>
					
				</table>
			</div>
		
	           </div>
			  </div>
			  <div class="modal-footer">
				<input type="submit" class="btn btn-info btn-lg"value="新书上架">
				 
				<button class="btn btn-danger btn-lg" data-dismiss="modal">取消</button>
			 </div>
			 </div>
		  </div>
	  </div>
		</form>
		
		
		<a class="btn btn-warning btn-lg" href="<c:url value='/adminjsp/admin/book/gj.jsp'/>">高级搜索</a>
		
   <!--container End-->
   </div> 
	
	
	<%-- <p align="center">
		<a href="<c:url value='/admin/AdminBookServlet?method=addPre'/>"
			style="margin: 20px; font-size: 20px;">添加图书</a> <a
			href="<c:url value='/adminjsp/admin/book/gj.jsp'/>"
			style="margin: 20px; font-size: 20px;">高级搜索</a>
	</p> --%>
</body>
</html>
