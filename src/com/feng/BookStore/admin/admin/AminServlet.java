package com.feng.BookStore.admin.admin;

import java.io.IOException;
import java.text.Normalizer.Form;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.feng.BookStore.admin.admin.domain.Admin;
import com.feng.BookStore.admin.admin.service.AdminService;

import cn.itcast.servlet.BaseServlet;


public class AminServlet extends BaseServlet {
	private AdminService adminService=new AdminService();
	
	/**
	 * 管理员登录
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String  login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//1.封装表单数据到Admin
		String adminname=request.getParameter("adminname");
		String adminpwd=request.getParameter("adminpwd");
		Admin fromAdmin=new Admin();
		fromAdmin.setAdminname(adminname);
		fromAdmin.setAdminpwd(adminpwd);
		//2.调用adminService的login
		Admin admin=adminService.login(fromAdmin);
		if(admin==null){
			request.setAttribute("msg", "管理员账号或密码错误！");
			return "f:/adminjsp/login.jsp";
		}
		request.getSession().setAttribute("admin",admin);
		return "f:/adminjsp/admin/main.jsp";

	}

	
	public String  exit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.删除sessionAdmin
		request.getSession().removeAttribute("admin");
		//2.转发到login.jsp
		return "f:/adminjsp/login.jsp";
		
	}
}
