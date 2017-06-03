package com.feng.BookStore.cart.web.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.feng.BookStore.book.domain.Book;
import com.feng.BookStore.cart.domain.CartItem;
import com.feng.BookStore.cart.service.CartItemService;
import com.feng.BookStore.user.domain.User;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;


public class CartItemServlet extends BaseServlet {
	private CartItemService cartItemService=new CartItemService();
	
	
	/**
	 * 加载多个CartItem
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String loadCartItems(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 获取cartItemIds参数
		 */
		String cartItemIds = req.getParameter("cartItemIds");
		double total = Double.parseDouble(req.getParameter("total"));
		/*
		 * 2. 通过service得到List<CartItem>
		 */
		List<CartItem> cartItemList = cartItemService.loadCartItems(cartItemIds);
		/*
		 * 3. 保存，然后转发到/cart/showitem.jsp
		 */
		req.setAttribute("cartItemList", cartItemList);
		req.setAttribute("total", total);
		req.setAttribute("cartItemIds", cartItemIds);
		return "f:/jsp/cart/showitem.jsp";
	}
	
	/**
	 * 1.获取cartItemIds参数
	 * 2.调用service方法
	 * 3.回到list.jsp
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String batchDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cartItemIds=request.getParameter("cartItemIds");
		cartItemService.batchDelete(cartItemIds);
		return myCart(request, response);
		
	}

	/**
	 * 添加购物车条目
	 * 1.封装表单数据到CartItem(bid,quantity)
	 * 2.调用service完成添加
	 * 3.查询出当前用户的所有条目，转发到list.jsp显示
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map map=request.getParameterMap();
		CartItem cartItem=CommonUtils.toBean(map, CartItem.class);
		Book book=CommonUtils.toBean(map, Book.class);
		User user=(User) request.getSession().getAttribute("sessionUser");
		cartItem.setBook(book);
		cartItem.setUser(user);
		
		cartItemService.add(cartItem);
		updateSaleNum(cartItem.getBook().getBid());
		return myCart(request, response);
		
	}

	//更新书籍的销量
	private void updateSaleNum(String bid){
		//System.out.println("sssssssssssssssss");
		cartItemService.updateSaleNum(bid);
	}
	
	
	/**
	 * 我的购物车
	 * 1.得到uid
	 * 2.通过service得到当前用的所有购物车条目
	 * 3.保存起来，转发到/cart/list.jsp
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String myCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.得到uid
		User user=(User)request.getSession().getAttribute("sessionUser");
		String uid=user.getUid();
		//2.通过service得到当前用的所有购物车条目
		List<CartItem> cartItemList=cartItemService.myCart(uid);
		//3.保存起来，转发到/cart/list.jsp
		request.setAttribute("cartItemList",cartItemList);
		return "f:/jsp/cart/list.jsp";
	}
}
