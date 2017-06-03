$(function(){
	/**
	 * 1.得到所有的错误信息，循环遍历。调用一个方法来决定是否显示错误信息
	 */
	$(".errorClass").each(function(){
		showError($(this));//遍历每一个元素，使用每个元素来调用showError方法
	});
	
	/**
	 * 2.切换注册按钮图片
	 * 
	
     $("#submintBtn").hover(
        function(){
        	$("#submintBtn").attr("src","/BookStore/images/regist2.jpg");
        	
        },
        function(){
        	$("#submintBtn").attr("src","/BookStore/images/regist1.jpg");
        }
     
     );
      */
     /**
      * 3.输入框得到焦点隐藏错误信息
      */
     $(".inputClass").focus(function(){
    	var labelId= $(this).attr("id")+"Error";//通过输入框找到对象的label的id
    	 $("#"+labelId).text("");//把label的内容清空
    	 showError( $("#"+labelId));//隐藏没有错误信息的label
    	 
     });
     
     /**
      * 4.输入框失去焦点进行校验
      */
     $(".inputClass").blur(function(){
    	 var id=$(this).attr("id");//获取当前输入框的id
    	 
    	 var funName="validate"+id.substring(0,1).toUpperCase()+id.substring(1)+"()";//得到对应的函数名
    	 eval(funName);//执行函数调用
     });
     
     /**
      * 5.表单提交时进行校验
      */
     $("#registForm").submit(function(){
    	 var flag=true;
    	 if(!validateLoginname()){
    		 flag=false;
    	 }
    	 if(!validateLoginname()){
    		 flag=false;
    	 }
    	 if(!validateLoginpass()){
    		 flag=false;
    	 }
    	 if(!validateReloginpass()){
    		 flag=false;
    	 }
    	 
    	if(! validateEmail()){
    		flag=false;
    	}
    	 if(!validateVerifyCode()){
    		 flag=false;
    	 }
    	 
    	 return flag;
     });
	
	
});


/**
 * 登录名校验
 */
function validateLoginname(){
	var id="loginname";
	
	var value=$("#"+id).val();//获取输入框内容
	/**
	 * 1.非空
	 */
	if(!value){
		/**
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#"+id+"Error").text("不能为空");
		showError($("#"+id+"Error"));
		return false;
	}
	
	/**
	 * 2.长度
	 */
	if(value.length<3||value.length>20){
		/**
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#"+id+"Error").text("长在3~20之间");
		showError($("#"+id+"Error"));
		return false;
	}
	
	/**
	 * 3.是否注册
	 */
	
	$.ajax({
		url:"/BookStore/UserServlet",//要请求的servelt
		data:{method:"ajaxValidateLoginname",loginname:value},//服务器的参数
		type:"POST",
		dataType:"json",
		async:false,//是否异步请求，如果是异步，就不会等服务器返回，这个函数就不会往下继续执行
		cache:false,
		success:function(result){
			if(!result){//如果校验失败
				$("#"+id+"Error").text("已经被注册");
				showError(	$("#"+id+"Error"));
				return false;
			}
		}
	});
	return true;
}

/**
 * 登录密码校验
 */
function validateLoginpass(){
	var id="loginpass";
	var value=$("#"+id).val();//获取输入框内容
	/**
	 * 1.非空
	 */
	if(!value){
		/**
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#"+id+"Error").text("不能为空");
		showError($("#"+id+"Error"));
		return false;
	}
	
	/**
	 * 2.长度
	 */
	if(value.length<3||value.length>20){
		/**
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#"+id+"Error").text("长度在3~20之间");
		showError($("#"+id+"Error"));
		return false;
	}
	return true;
}

/**
 * 确认密码校验
 */
function validateReloginpass(){
	var id="reloginpass";
	var value=$("#"+id).val();//获取输入框内容
	/**
	 * 1.非空
	 */
	if(!value){
		/**
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#"+id+"Error").text("不能为空");
		showError($("#"+id+"Error"));
		return false;
	}
	
	/**
	 * 2.验证两次输入是否一样
	 */
	if(value!=$("#loginpass").val()){
		/**
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#"+id+"Error").text("两次输入不一致");
		showError($("#"+id+"Error"));
		return false;
	}
	return true;
}

/**
 * Email校验
 */
function validateEmail(){
	var id="email";
	var value=$("#"+id).val();//获取输入框内容
	/**
	 * 1.非空
	 */
	if(!value){
		/**
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#"+id+"Error").text("Email不能为空");
		showError($("#"+id+"Error"));
		return false;
	}
	
	/**
	 * 2.Email格式校验
	 */
	if(!/[a-z0-9-]{1,30}@[a-z0-9-]{1,65}.[a-z]{3}/.test(value)){
		/**
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#"+id+"Error").text("Email格式不对");
		showError($("#"+id+"Error"));
		return false;
	}
	
	/**
	 * 3.是否注册
	 */
	
	$.ajax({
		url:"/BookStore/UserServlet",//要请求的servelt
		data:{method:"ajaxValidateEmail",email:value},//服务器的参数
		type:"POST",
		dataType:"json",
		async:false,//是否异步请求，如果是异步，就不会等服务器返回，这个函数就不会往下继续执行
		cache:false,
		success:function(result){
			if(!result){//如果校验失败
				$("#"+id+"Error").text("Email已被注册");
				showError(	$("#"+id+"Error"));
				return false;
			}
		}
	});
	return true;
}

/**
 * 验证码校验
 */
function validateVerifyCode(){
	var id="verifyCode";
	var value=$("#"+id).val();//获取输入框内容
	/**
	 * 1.非空
	 */
	if(!value){
		/**
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#"+id+"Error").text("不能为空");
		showError($("#"+id+"Error"));
		return false;
	}
	
	/**
	 * 2.长度校验
	 */
	if(value.length!=4){
		/**
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#"+id+"Error").text("错误的验证码");
		showError($("#"+id+"Error"));
		return false;
	}
	
	/**
	 * 3.是否正确
	 */
	$.ajax({
		url:"/BookStore/UserServlet",//要请求的servelt
		data:{method:"ajaxVaildateVerifyCode",verifyCode:value},//服务器的参数
		type:"POST",
		dataType:"json",
		async:"false",//是否异步请求，如果是异步，就不会等服务器返回，这个函数就不会往下继续执行
		cache:false,
		success:function(result){
			if(!result){//如果校验失败
				$("#"+id+"Error").text("验证码错误");
				showError(	$("#"+id+"Error"));
				return false;
			}
		}
	});
	
	return true;
}

/**
 * 判读当前元素是否存在内容，如果存在就显示，如果不存在就不显示。
 * @param ele
 */
function showError(ele){
	var text=ele.text();//获取元素的内容
	if(!text){//如果没有内容隐藏
		ele.css("display","none");
	}else{
	ele.css("display","");//显示元素
	}
}

/**
 * 验证码的变更
 * 1.得到<img>元素
 * 2.重新设置它的src
 * 3.使用毫秒来添加参数
 */
function _changeVerifyCode(){
	$("#imageVerifyCode").attr("src","/BookStore/VerifyCodeServlet?a="+new Date().getTime());
}