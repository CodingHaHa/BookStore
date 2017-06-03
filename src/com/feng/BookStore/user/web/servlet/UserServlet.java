package com.feng.BookStore.user.web.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.feng.BookStore.user.domain.User;
import com.feng.BookStore.user.service.UserService;
import com.feng.BookStore.user.service.exception.UserException;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;


public class UserServlet extends BaseServlet {
	private UserService userService = new UserService();

	
	/**
	 * 注册功能
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String regist(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//1.封装表单数据到User对象
		User formUser =CommonUtils.toBean(req.getParameterMap(), User.class);
		//2.校验，如果校验失败，保存错误信息，返回到regist.jsp显示
		Map<String,String>errors=validateRegist(formUser, req.getSession());
		if(errors.size()>0){
			req.setAttribute("form", formUser);//将表单内容带回到注册页面
			req.setAttribute("errors", errors);
			return "f:/jsp/user/regist.jsp";
		}
		//3.使用service完成业务
		userService.regist(formUser);
		//4.保存成功信息，转发到msg.jsp显示
		req.setAttribute("code", "success");
		req.setAttribute("msg", "注册成功，请马上到邮箱激活！");
//		req.getRequestDispatcher(path)
		return "f:/jsp/messg.jsp";
	}
	
	/**
	 * 注册校验
	 * 对表单的字段进行逐个校验，如果有错误使用当前名称为key，错误信息为value保存到map中
	 * @return
	 */
	public Map<String,String> validateRegist(User formUser,HttpSession session){
		Map<String,String>errors=new HashMap<String, String>();
		//1.校验登录名
		String loginname=formUser.getLoginname();
		if(loginname==null||loginname.trim().isEmpty()){
			errors.put("loginname", "不能为空");
		}else if(loginname.length()<3||loginname.length()>20){
			errors.put("loginname", "长度在3~20之间");
		}else if(!userService.ajaxValidateLoginname(loginname)){
			errors.put("loginname", "用户名已被注册");
		}
		
		//2.校验登录密码
		String loginpass=formUser.getLoginpass();
		if(loginname==null||loginname.trim().isEmpty()){
			errors.put("loginpass", "密码不能为空");
		}else if(loginpass.length()<3||loginpass.length()>20){
			errors.put("loginpass", "长度须在3~20之间");
		}
		
		//3.确认密码校验
		String reloginpass=formUser.getReloginpass();
		if(reloginpass==null||reloginpass.trim().isEmpty()){
			errors.put("loginpass", "不能为空！");
		}else if(!reloginpass.equals(loginpass)){
			errors.put("loginpass", "输入不一致");
		}
		
		//4.Email校验
		String email=formUser.getEmail();
		if(email==null||email.trim().isEmpty()){
			errors.put("email", "不能为空");
		}else if(!email.matches("[a-z0-9-]{1,30}@[a-z0-9-]{1,65}.[a-z]{3}")){
			errors.put("email", "Email格式错误");
		}else if(!userService.ajaxValidateEmail(email)){
			errors.put("email", "已被注册");
		}
		
		//5.验证码校验
		String verifyCode=formUser.getVerifyCode();
		String vcode=(String) session.getAttribute("vCode");
		if(verifyCode==null||verifyCode.trim().isEmpty()){
			errors.put("verifyCode", "不能为空");
		}else if(!verifyCode.equalsIgnoreCase(vcode)){
			errors.put("verifyCode", "错误");
		}
		
		return errors;
	}
	
	/**
	 * 激活功能
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String activation(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/**
		 * 1.获取激活码
		 * 2.用激活码调用service方法完成激活
		 *  》service方法有可能会抛出异常，把异常信息拿出来保存到request中，转发到msg.jsp中显示
		 * 3.保存成功信息到request，转发到msg.jsp显示
		 */
		String code=req.getParameter("activationCode");
		try {
			userService.activation(code);
			req.setAttribute("code", "success");//通知msg.jsp显示对号
			req.setAttribute("msg", "恭喜，激活成功，请马上登！");
		} catch (UserException e) {
			//说明service抛出异常
			req.setAttribute("msg",e.getMessage());
			req.setAttribute("code", "error");//通知msg.jsp显示X
			
		} 
		return "f:/jsp/messg.jsp";
	}
	
	/**
	 * ajax Email是否注册校验
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String ajaxValidateEmail(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//1.获取Email
		String email=req.getParameter("email");
		//2.通过service得到校验结果
		boolean b=userService.ajaxValidateEmail(email);
		//3.发给客户端
		resp.getWriter().print(b);
		return null;
	}
	
	/**
	 * 验证码是否正确
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String ajaxVaildateVerifyCode(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//1.获取输入框中的验证码
		String verifyCode=req.getParameter("verifyCode");
		//2.获取图片上的真实验证码
		String vcode=(String) req.getSession().getAttribute("vCode");
		//3.进行比较
		boolean b=verifyCode.equalsIgnoreCase(vcode);
		//4.发送非客户端
		resp.getWriter().print(b);
		return null;
	}
	
	/**
	 * ajax 用户名是否注册校验
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String ajaxValidateLoginname(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		//1.获取用户名
		String loginname=req.getParameter("loginname");
		//2.通过service得到校验结果
		boolean b=userService.ajaxValidateLoginname(loginname);
		//3.发给客户端
		resp.getWriter().print(b);
		return null;
	}
	
	/**
	 * //1.封装表单数据到User
		//2.校验表单数据
		//3.使用service查询，得到User
		//4.查看用户是否存在，如果不存在【1.保存错误信息：用户名或密码错误】【2.保存用户数据，为了回显】【3.转发到login.jsp】
		//5.如果存在，查询用户状态，如果状态为false[1.保存错误信息：您没有激活]【2.保存用户信息，也为了回显】【3.转发到login.jsp】
		//6.登录成功【1.保存查询到的user到session中】【2.保存当前用户名称到cookie中，注意中文需要编码处理（URL）】
		
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String login(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//1.封装表单数据到User
		//2.校验表单数据
		//3.使用service查询，得到User
		//4.查看用户是否存在，如果不存在【1.保存错误信息：用户名或密码错误】【2.保存用户数据，为了回显】【3.转发到login.jsp】
		//5.如果存在，查询用户状态，如果状态为false[1.保存错误信息：您没有激活]【2.保存用户信息，也为了回显】【3.转发到login.jsp】
		//6.登录成功【1.保存查询到的user到session中】【2.保存当前用户名称到cookie中，注意中文需要编码处理（URL）】
		//1.封装表单数据到User
		User formUser=CommonUtils.toBean(req.getParameterMap(), User.class);
		
		//2.校验表单数据
		Map<String,String>errors= validateLogin(formUser, req.getSession());
		
		if(errors.size()>0){
			req.setAttribute("form", formUser);//将表单内容带回到注册页面
			req.setAttribute("errors", errors);
			return "f:/jsp/user/login.jsp";
		}
		
		//3.使用userService的login方法，得到User
		User user=userService.login(formUser);
		
		//4.开始判断
		if(user==null){
			req.setAttribute("msg", "用户名或密码错误");
			req.setAttribute("user", formUser);
			System.out.println("4");
			return "f:/jsp/user/login.jsp";
		}else{
			if(!user.isStatus()){
				req.setAttribute("msg", "您还没有激活");
				System.out.println("5");
				req.setAttribute("user", formUser);
				return "f:/jsp/user/login.jsp";
			}else{
				//将数据库中查询到的用户信息放到session中，方便下次登录时显示用户名
				req.getSession().setAttribute("sessionUser", user);
				//获取用户名保存到cookie中
				String loginname=user.getLoginname();
				loginname=URLEncoder.encode(loginname, "UTF-8");
				Cookie cookie=new Cookie("loginname",loginname);
//				System.out.println("6");
				cookie.setMaxAge(60*60*24*10);//设置cookie保存10天
				resp.addCookie(cookie);//必须使用这个方法才对将cookie回写到客户端
				return "r:/index.jsp";//重定向到index.jsp页面
			}
		}
	}
	
	/**
	 * 登录页面表单信息验证
	 * @param formUser
	 * @param session
	 * @return
	 */
	public Map<String,String> validateLogin(User formUser,HttpSession session){
		Map<String,String>errors=new HashMap<String, String>();
		//比较表单用于输入的验证码和存放到session中的验证码是否一致
		if(!(formUser.getVerifyCode().toUpperCase().trim().equals(session.getAttribute("vCode").toString().toUpperCase().trim()))){
			errors.put("verifyCodeError", "验证码错误!");
		}
		return errors;
	}
	
	/**
	 * 修改密码
	 * //1.封装表单数据到user中
		//2.从session中获取uid
		//3.使用uid和表单中的oldpass和newPass来调用service方法
		  //》》如果出现异常，保存异常信息到request中，转发到pwd.jsp
		//4.保存成功信息到request中，转发到messg.jsp
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String updatePassword(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//1.封装表单数据到user中
		User formUser=CommonUtils.toBean(req.getParameterMap(), User.class);
		//2.从session中获取uid
		User user=(User) req.getSession().getAttribute("sessionUser");
		if(null==user){
			req.setAttribute("msg","您还没有登录");
			return "f:/jsp/user/login.jsp";
		}
	
		//3.使用uid和表单中的oldpass和newPass来调用service方法
		//》》如果出现异常，保存异常信息到request中，转发到pwd.jsp
		try {
			userService.updatePassword(user.getUid(), formUser.getNewloginpass(), formUser.getLoginpass());
			//4.保存成功信息到request中，转发到messg.jsp
			req.setAttribute("msg", "修改密码成功");
			req.setAttribute("code", "success");
			return "f:/jsp/msg.jsp";
		} catch (UserException e) {
			req.setAttribute("msg", e.getMessage());//保存异常信息到request中。为了回显
			req.setAttribute("user", formUser);
			return "f:/jsp/user/pwd.jsp";
		}

	}
	
	/**
	 * 退出功能
	 *   1.销毁session
	 *   2.重定向到登录界面
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String exit(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.getSession().invalidate();//销毁session，使得该Session失效，即其内部所用的属性都是不能使用的。
		return "r:/jsp/user/login.jsp";
		
	}
	
	
}
