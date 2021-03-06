<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>book_desc.jsp</title>

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
	href="<c:url value='/adminjsp/admin/css/book/desc.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/jquery/jquery.datepick.css'/>">
<script type="text/javascript"
	src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>

<!--包含BootStrap的CSS文件-->
<link rel="stylesheet" href="/BookStore/bootstrap/css/bootstrap.min.css">
<!--1:首先把JQuery包含-->
<script src="/BookStore/bootstrap/js/jquery.min.js"></script>
<!--2:再包含其他js文件-->
<script  src="/BookStore/bootstrap/js/bootstrap.min.js"></script>
<script  src="/BookStore/bootstrap/js/holder.min.js"></script>
<script src="/BookStore/bootstrap/js/application.js"></script>

<script type="text/javascript">
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
	
	function editForm(){
		$("#method").val("edit");
		
		$("#form").submit();
	
	}
	
	
	function delForm(){
		$("#method").val("delete");
		$("#form").submit();
	}
	
</script>
</head>

<body>
	<center>
		<label> <font size="50" color="red">修改或删除</font>
		</label>
	</center>
	<br />
	<br />

	<img align="top" src="<c:url value='/${book.image_w }'/>" class="tp" />

	<div id='formDiv' style="display: inline-block;">
		<div class="sm">&nbsp;</div>
		<form action="/BookStore/admin/AdminBookServlet" method="post"
			id="form">
			<input type="hidden" name="method" id="method" /> <input
				type="hidden" name="bid" value="${book.bid }" /> <input
				type="hidden" name="image_w" value="" /> <input type="hidden"
				name="image_b" value="" />
			<%-- <img align="top" src="<c:url value='/'/>" class="tp"/>--%>
			<div style="float: left;">
				<ul>
					<li>商品编号：${book.bid }</li>
					<li>书名： <input id="bname" type="text" name="bname"
						value="${book.bname }" style="width: 500px;" /></li>
					<li>当前价：<input id="currPrice" type="text" name="currPrice"
						value="${book.currPrice }" style="width: 50px;" /></li>
					<li>定价： <input id="price" type="text" name="price"
						value="${book.price }" style="width: 50px;" /> 折扣：<input
						id="discount" type="text" name="discount"
						value="${book.discount }" style="width: 30px;" />折
					</li>
				</ul>
				<hr style="margin-left: 50px; height: 1px; color: #dcdcdc" />
				<table class="tab">
					<tr>
						<td colspan="3">作者： <input id="author" type="text"
							name="author" value="${book.author }" style="width: 150px;" />
						</td>
					</tr>
					<tr>
						<td colspan="3">出版社： <input id="press" type="text"
							name="press" value="${book.press }" style="width: 200px;" />
						</td>
					</tr>
					<tr>
						<td colspan="3">出版时间：<input id="publishtime" type="text"
							name="publishtime" value="${book.publishtime }"
							style="width: 100px;" /></td>
					</tr>
					<tr>
						<td>版次： <input id="edition" type="text" name="edition"
							value="${book.edition }" style="width: 40px;" /></td>
						<td>页数： <input id="pageNum" type="text" name="pageNum"
							value="${book.pageNum }" style="width: 50px;" /></td>
						<td>字数： <input id="wordNum" type="text" name="wordNum"
							value="${book.wordNum }" style="width: 80px;" /></td>
					</tr>
					<tr>
						<td width="250px">印刷时间：<input id="printtime" type="text"
							name="printtime" value="${book.printtime }" style="width: 100px;" /></td>
						<td width="250px">开本： <input id="booksize" type="text"
							name="booksize" value="${book.booksize }" style="width: 30px;" /></td>
						<td>纸张： <input id="paper" type="text" name="paper"
							value="${book.paper }" style="width: 80px;" /></td>
					</tr>
					<tr>
						<td>一级分类：<select name="pid" id="pid" onclick="loadChildren()">
								<option value="">==请选择1级分类==</option>
								<c:forEach items="${parents }" var="parent">
									<option value="${parent.cid }"
										<c:if test="${book.category.parent.cid eq  parent.cid}"> selected="selected" </c:if>>${parent.cname }</option>
								</c:forEach>
						</select>
						</td>
						<td>二级分类：<select name="cid" id="cid">
								<option value="">==请选择2级分类==</option>
								<c:forEach items="${children }" var="child">
									<option value="${child.cid }"
										<c:if test="${book.category.cid eq  child.cid}"> selected="selected" </c:if>>${child.cname }</option>
								</c:forEach>
						</select>
						</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2"><input onclick="editForm();" type="button"
							name="method" class="btn btn-success btn-lg"
							value="修　　改"> <input onclick=" delForm() ;" type="button"
							name="method" class="btn btn-danger btn-lg"
							value="删　　除"></td>
						<td></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>
