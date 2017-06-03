package com.feng.BookStore.web.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class Login
 */
@WebFilter(
		urlPatterns = { 
				"/Login", 
				"/jsp/cart/*", 
				"/jsp/order/*"
		}, 
		servletNames = { 
				"CartItemServlet", 
				"OrderServlet"
		})
public class Login implements Filter {

	public void destroy() {
		
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//1.获取session中的user,
		//2.判断是否为null  如果为null,保存错误信息转发到msg.jsp /如果不为空就放行
		  
		HttpServletRequest req=(HttpServletRequest)request;
		Object user=req.getSession().getAttribute("sessionUser");
		if(user==null){
			req.setAttribute("code", "error");
			req.setAttribute("msg", "亲!请登录!");
			req.getRequestDispatcher("/jsp/msg.jsp").forward(req, response);
		}else{
			
			chain.doFilter(request, response);
		}
	}

	
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}
}
