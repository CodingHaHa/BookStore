<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>cartlist.jsp</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<script src="<c:url value='/js/round.js'/>"></script>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/jsp/css/cart/list.css'/>">
<script type="text/javascript">
	
	$(function(){//文件加载完就显示总计
		showTotal();
	
		//给全选按钮添加click事件
		$("#selectAll").click(function (){
		//1.获取全选按钮状态
		var bool=$("#selectAll").attr("checked");
		//2.让所有的条目的状态与全选按钮一样
		 setItemCheckBox(bool);
		 //3让结算按钮的状态与全选按钮一样
		 setJieSuan(bool);
		 //4.重新计算总计
		 showTotal();
		});
		
			//给所有条目的复选框添加click事件
		$(":checkbox[name=checkboxBtn]").click(function(){
			var all=$(":checkbox[name=checkboxBtn]").length;//得到所有按钮数量
			var select=$(":checkbox[name=checkboxBtn][checked=true]").length;//得到选中按钮数量
			if(all==select){
				$("#selectAll").attr("checked",true);
				setJieSuan(true);//让结算按钮有效
			}else if(select==0){
				$("#selectAll").attr("checked",false);//取消全选
				setJieSuan(false);//让结算失效
			}else{
					$("#selectAll").attr("checked",false);//取消全选
				    setJieSuan(true);//让结算失效
			}
				showTotal();//从新结算总计
		});
	});
		//计算总计
		function showTotal(){
			//1.获取所有被勾选的条目的复选框,然后循环遍历
			var total=0;
			$(":checkbox[name=checkboxBtn][checked=true]").each(function(){
			      //2.获取复选框的值,就是其他元素的前缀
			      var id=$(this).val();
			      //再通过前缀找到小计，最后得到文本内容。
			      var text=$("#"+id+"Subtotal").text();
			      //4.累加
			      total +=Number(text);
			    
			});
			  //5.把总计放在
			      $("#total").text(round(total,2));//将totalb保留两位小数
		}
		
		//统一设置所有条目的复选按钮
		function setItemCheckBox(bool){
			
			$(":checkbox[name=checkboxBtn]").attr("checked",bool);
		}
		
		//设置结算按钮样式
		function setJieSuan(bool){
			if(bool){
			$("#jiesuan").removeClass("kill").addClass("jiesuan");
			$("#jiesuan").unbind("click");//取消该元素上面的所有click事件
			}else{
			$("#jiesuan").removeClass("jiesuan").addClass("kill");
			$("#jiesuan").click(function(){return false;});
			}
		}
		
		
		//批量删除
		function batchDelete(){
			//1.获取被选中条目的复选框
			//2.创建一个数组，把所有被选中的值，添加到数组
				var cartItemIdArray=new Array();
			$(":checkbox[name=checkboxBtn][checked=true]").each(function(){
					cartItemIdArray.push($(this).val());//把复选框的Id值添加到数组中
				});
			//3.指定location为CartItemServlet,参数为：method=batchDelete&cartItemIds=数组的.toString()
			location="/BookStore/CartItemServlet?method=batchDelete&cartItemIds="+cartItemIdArray;//这里不同调用toString方法，因为和字符串一连接自动调用。
		}
		
		
		/*
 * 结算
 */
function jiesuan() {
	// 1. 获取所有被选择的条目的id，放到数组中
	var cartItemIdArray = new Array();
	$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
		cartItemIdArray.push($(this).val());//把复选框的值添加到数组中
	});	
	// 2. 把数组的值toString()，然后赋给表单的cartItemIds这个hidden
	$("#cartItemIds").val(cartItemIdArray.toString());
	// 把总计的值，也保存到表单中
	$("#hiddenTotal").val($("#total").text());
	// 3. 提交这个表单
	$("#jieSuanForm").submit();
}

	</script>
</head>
<body>

	<c:choose>
		<c:when test="${empty  cartItemList }">


			<table width="95%" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td align="right"><img align="top"
						src="/BookStore/images/icon_empty.png" /></td>
					<td><span class="spanEmpty">您的购物车中暂时没有商品</span></td>
				</tr>
			</table>
		</c:when>
		<c:otherwise>

			<table width="95%" align="center" cellpadding="0" cellspacing="0">
				<tr align="center" bgcolor="#efeae5">
					<td align="left" width="50px"><input type="checkbox"
						id="selectAll" checked="checked" /><label for="selectAll">全选</label>
					</td>
					<td colspan="2">商品名称</td>
					<td>单价</td>
					<td>数量</td>
					<td>小计</td>
					<td>操作</td>
				</tr>

				<c:forEach items="${cartItemList }" var="cartItem">


					<tr align="center">
						<td align="left"><input value="${cartItem.cartItemId }"
							type="checkbox" name="checkboxBtn" checked="checked" /></td>
						<td align="left" width="70px"><a class="linkImage"
							href="<c:url value='/jsp/book/desc.jsp'/>"><img border="0"
								width="54" align="top"
								src="<c:url value='/${cartItem.book.image_b }'/>" /></a></td>
						<td align="left" width="400px"><a
							href="/BookStore/BookServlet?method=findByBid&bid=${cartItem.book.bid}"><span>${cartItem.book.bname}</span></a>
						</td>
						<td><span>&yen;<span class="currPrice">${cartItem.book.currPrice}</span></span></td>
						<td><%-- <a class="jian" id="${cartItem.cartItemId }Jian"></a> --%><input
							class="quantity" readonly="readonly" id="12346Quantity"
							type="text" value="${cartItem.quantity }" /><%-- <a class="jia"
							id="${cartItem.cartItemId }Jia"></a> --%></td>
						<td width="100px"><span class="price_n">&yen;<span
								class="subTotal" id="${cartItem.cartItemId }Subtotal">${cartItem.subtotal}</span></span>
						</td>
						<td><a
							href="<c:url value='/CartItemServlet?method=batchDelete&cartItemIds=${cartItem.cartItemId } '/>">删除</a>
						</td>
					</tr>
				</c:forEach>



				<tr>
					<td colspan="4" class="tdBatchDelete"><a
						href="javascript:batchDelete();">批量删除</a></td>
					<td colspan="3" align="right" class="tdTotal"><span>总计：</span><span
						class="price_t">&yen;<span id="total"></span></span></td>
				</tr>
				<tr>
					<td colspan="7" align="right"><a href="javascript:jiesuan();"
						id="jiesuan" class="jiesuan"></a></td>
				</tr>
			</table>
			<form id="jieSuanForm" action="<c:url value='/CartItemServlet'/>"
				method="post">
				<input type="hidden" name="cartItemIds" id="cartItemIds" /> <input
					type="hidden" name="total" id="hiddenTotal" /> <input type="hidden"
					name="method" value="loadCartItems" />
			</form>

		</c:otherwise>
	</c:choose>

</body>
</html>
