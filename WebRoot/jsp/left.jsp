<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>left</title>
<base target="body" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
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
	href="<c:url value='/category/css/jquery-accordion-menu.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/category/css/font-awesome.css'/>">
<style type="text/css">
/* *{box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;} */
body{background:#f0f0f0;
   width: 190px;
}
.content{width:190px;margin:0px auto;}
.filterinput{
	background-color:rgba(249, 244, 244, 0);
	border-radius:15px;
	width:90%;
	height:30px;
	border:thin solid #FFF;
	text-indent:0.5em;
	font-weight:bold;
	color:#FFF;
}
#demo-list a{
	overflow:hidden;
	text-overflow:ellipsis;
	-o-text-overflow:ellipsis;
	white-space:nowrap;
	width:100%;
}
</style>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/category/css/demo.css'/>">
<script type="text/javascript" src="<c:url value='/category/js/jquery-1.9.1.min.js'/>"></script>
<script src="<c:url value='/category/js/jquery-accordion-menu.js'/>" type="text/javascript"></script>
<script type="text/javascript">

$(function(){	
	//顶部导航切换
	$("#demo-list li").click(function(){
		$("#demo-list li.active").removeClass("active")
		$(this).addClass("active");
	})	
})	

$(function(){
	$(".togo").click(function(){
		parent['body'].location.href=this.href;
		return false;
	});
	
});
</script>
</head>

	


<body  style="overflow-x:hidden;overflow-y:auto">
<div class="out">
<div id="main_demo">
<div class="content">

	<div id="jquery-accordion-menu" class="jquery-accordion-menu green">
		
		<ul id="demo-list">
			<c:forEach items="${parents}" var="parent">
			   <li><a href="#"><i class="fa fa-cog">${parent.cname}</i></a>
				 <c:forEach items="${parent.children}" var="child">
				  <ul class="submenu">
					<li><a class="togo"  href="/BookStore/BookServlet?method=findByCategory&cid=${child.cid}">${child.cname}</a></li>
				  </ul>
				</c:forEach>
			</li>
			</c:forEach>
		</ul>
		<div class="jquery-accordion-menu-footer">
			
		</div>
	</div>
</div>
<div class="clear"></div>
</div>
</div>
<script type="text/javascript">
(function($) {
$.expr[":"].Contains = function(a, i, m) {
	return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
};
function filterList(header, list) {
	//@header 头部元素
	//@list 无需列表
	//创建一个搜素表单
	var form = $("<form>").attr({
		"class":"filterform",
		action:"#"
	}), input = $("<input>").attr({
		"class":"filterinput",
		type:"text"
	});
	$(form).append(input).appendTo(header);
	$(input).change(function() {
		var filter = $(this).val();
		if (filter) {
			$matches = $(list).find("a:Contains(" + filter + ")").parent();
			$("li", list).not($matches).slideUp();
			$matches.slideDown();
		} else {
			$(list).find("li").slideDown();
		}
		return false;
	}).keyup(function() {
		$(this).change();
	});
}
$(function() {
	filterList($("#form"), $("#demo-list"));
});
})(jQuery);	
</script>

<script type="text/javascript">

	jQuery("#jquery-accordion-menu").jqueryAccordionMenu();
	
</script>
</body>
</html>