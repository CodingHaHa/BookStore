package com.feng.BookStore.admin.web.filter;


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
 * Servlet Filter implementation class AdminLoginFilter
 */
@WebFilter({ "/AdminLoginFilter", "/adminjsp/admin/*" })
public class AdminLoginFilter  implements Filter {
       
    /**
     * @see Filter#Filter()
     */
    public AdminLoginFilter() {
        super();
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		Object admin=req.getSession().getAttribute("admin");
		if(admin==null){
			req.setAttribute("msg", "您还没哟登录，不能访问该资源！");
			req.getRequestDispatcher("/adminjsp/login.jsp").forward(req, response);
		}
		else{
		chain.doFilter(request, response);
		}
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
