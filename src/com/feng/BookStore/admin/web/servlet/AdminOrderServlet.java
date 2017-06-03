package com.feng.BookStore.admin.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.feng.BookStore.order.domain.Order;
import com.feng.BookStore.order.service.OrderService;
import com.feng.BookStore.pager.PageBean;

import cn.itcast.servlet.BaseServlet;

public class AdminOrderServlet extends BaseServlet {
	private OrderService orderService=new OrderService();
	
	private int getPc(HttpServletRequest req){
		int pc=1;
		String param=req.getParameter("pc");
		if(param!=null&& !param.trim().isEmpty()){
			try{
				pc=Integer.parseInt(param);
			}catch(RuntimeException e){
				
			}
		}
		return pc;	
	}
	
	/**
	 * 取消订单
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String cancel(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String oid=req.getParameter("oid");
		//校验状态
		int status=orderService.findSatus(oid);
		if(status!=1){
			req.setAttribute("code", "error");
			req.setAttribute("msg", "订单状态有误，不能取消该订单！请认真核实!");
			return "f:/adminjsp/msg.jsp";
		}
		//将订单状态设置为取消状态
		orderService.updateSatus(oid, 5);
		req.setAttribute("code", "success");
		req.setAttribute("msg", "亲!您的订单已经取消，快去看看其他商品吧!");
		return "f:/adminjsp/msg.jsp";
		
	}
	
	
	
	/**
	 * 发货
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String deliver(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String oid=req.getParameter("oid");
		//校验状态
		int status=orderService.findSatus(oid);
		if(status!=2){
			req.setAttribute("code", "error");
			req.setAttribute("msg", "订单状态有误，不能发货！请认真核实!");
			return "f:/adminjsp/msg.jsp";
		}
		//将订单状态设置为取消状态
		orderService.updateSatus(oid, 3);
		req.setAttribute("code", "success");
		req.setAttribute("msg", "您的订单已经发货，请关注物流!");
		return "f:/adminjsp/msg.jsp";
		
	}
	
	
	
	/**
	 * 获取URL，页面中的分页导航要用它作为超链接的目标。
	 * @param req
	 * @return
	 */
	private String getURL(HttpServletRequest req){
		String url=req.getRequestURI()+"?"+req.getQueryString();
		/**
		 * 如果url中存在pc参数，截取掉，如果不存在就不用截取。
		 */
		int index =url.lastIndexOf("&pc=");
		if(index!=-1){
			url=url.substring(0,index);
		}
		return url;
		
	}
	
	public String findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.得到pc,如果页面传递，使用页面，如果没传，pc=1
		int pc=getPc(request);
	 	//2.得到url
		String url=getURL(request);
		//4.使用pc和cid调用service的findByCategory得到PageBean
		PageBean<Order>pb=orderService.findAll(pc);
		
		//5.给PageBean设置url,保存PageBean，转发到/jsp/book/list.jsp
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		return "f:/adminjsp/admin/order/list.jsp";
	}
	
	/**
	 * 按状太查询
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByStatus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.得到pc,如果页面传递，使用页面，如果没传，pc=1
				int pc=getPc(request);
			 	//2.得到url
				String url=getURL(request);
				//3.获取连接参数：status
				int status=Integer.parseInt(request.getParameter("status"));
				//4.使用pc和cid调用service的findByCategory得到PageBean
				PageBean<Order>pb=orderService.findByStatus(status, pc);
				//5.给PageBean设置url,保存PageBean，转发到/jsp/book/list.jsp
				pb.setUrl(url);
				request.setAttribute("pb", pb);
				return "f:/adminjsp/admin/order/list.jsp";
		
	}
	
	/**
	 * 查看订单详细信息
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByOid(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pc=getPc(request);
		String oid=request.getParameter("oid");
		
		Order order=orderService.findByOid(oid);
		String btn=request.getParameter("btn");
		request.setAttribute("btn", btn);
		request.setAttribute("order", order);
		return "f:/adminjsp/admin/order/desc.jsp";
	}

}
