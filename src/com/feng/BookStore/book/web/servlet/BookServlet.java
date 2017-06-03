package com.feng.BookStore.book.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.feng.BookStore.book.domain.Book;
import com.feng.BookStore.book.service.BookService;
import com.feng.BookStore.pager.PageBean;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;


public class BookServlet extends BaseServlet {
	
	private BookService bookService=new BookService();
	/**
	 * 获取当前页码
	 * @param req
	 * @return
	 */
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
	 * 按照分类来查询
	 * 1.得到pc,如果页面传递，使用页面，如果没传，pc=1
	 * 2.得到url
	 * 3.获取查询条件，本方法就是cid，即分类的id
	 * 4.使用pc和cid调用service的findByCategory得到PageBean
	 * 5.给PageBean设置url,保存PageBean，转发到/jsp/book/list.jsp
	 * 
	 */
	public String findByCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.得到pc,如果页面传递，使用页面，如果没传，pc=1
		int pc=getPc(request);
		//2.得到url
		String url=getURL(request);
		//3.获取查询条件，本方法就是cid，即分类的id
		String cid=request.getParameter("cid");
		//4.4.使用pc和cid调用service的findByCategory得到PageBean
		PageBean<Book>pb=bookService.findByCategory(cid, pc);
		
		//5.给PageBean设置url,保存PageBean，转发到/jsp/book/list.jsp
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		return "f:/jsp/book/list.jsp";
	}
	
	
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
	
	/**
	 * 按照作者查询
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByAuthor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.得到pc,如果页面传递，使用页面，如果没传，pc=1
		int pc=getPc(request);
		//2.得到url
		String url=getURL(request);
		//3.获取查询条件，本方法就是cid，即分类的id
		String author=request.getParameter("author");
		//4.4.使用pc和cid调用service的findByCategory得到PageBean
		PageBean<Book>pb=bookService.findByAuthor(author, pc);
		
		//5.给PageBean设置url,保存PageBean，转发到/jsp/book/list.jsp
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		return "f:/jsp/book/list.jsp";
	}
	
	/**
	 * 按出版社查询
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByPress(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.得到pc,如果页面传递，使用页面，如果没传，pc=1
		int pc=getPc(request);
		//2.得到url
		String url=getURL(request);
		//3.获取查询条件，本方法就是cid，即分类的id
		String press=request.getParameter("press");
		//4.4.使用pc和cid调用service的findByCategory得到PageBean
		PageBean<Book>pb=bookService.findByPress(press, pc);
		
		//5.给PageBean设置url,保存PageBean，转发到/jsp/book/list.jsp
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		return "f:/jsp/book/list.jsp";
	}
	
	/**
	 * 按书名查询
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByBname(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.得到pc,如果页面传递，使用页面，如果没传，pc=1
		int pc=getPc(request);
		//2.得到url
		String url=getURL(request);
		//3.获取查询条件，本方法就是cid，即分类的id
		String bname=request.getParameter("bname");
		//4.4.使用pc和cid调用service的findByCategory得到PageBean
		PageBean<Book>pb=bookService.findByBname(bname, pc);
		
		//5.给PageBean设置url,保存PageBean，转发到/jsp/book/list.jsp
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		return "f:/jsp/book/list.jsp";
	}
	
	
	
	
	
	/**
	 * 按id查询
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByBid(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.得到pc,如果页面传递，使用页面，如果没传，pc=1
		int pc=getPc(request);
		//2.得到url
		String url=getURL(request);
		//3.获取查询条件，本方法就是cid，即分类的id
		String bid=request.getParameter("bid");
		//4.4.使用pc和cid调用service的findByCategory得到PageBean
		PageBean<Book>pb=bookService.findByBid(bid, pc);
		
		//5.给PageBean设置url,保存PageBean，转发到/jsp/book/list.jsp
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		return "f:/jsp/book/desc.jsp";
	}
	
	
	/**
	 * 组合查询
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByCombination(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.得到pc,如果页面传递，使用页面，如果没传，pc=1
		int pc=getPc(request);
		//2.得到url
		String url=getURL(request);
		//3.获取查询条件，本方法就是cid，即分类的id
		Book criteria=CommonUtils.toBean(request.getParameterMap(), Book.class);
		//4.4.使用pc和cid调用service的findByCategory得到PageBean
		PageBean<Book>pb=bookService.findByCombination(criteria, pc);
		
		//5.给PageBean设置url,保存PageBean，转发到/jsp/book/list.jsp
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		return "f:/jsp/book/list.jsp";
	}
	
	 
	public String findHotAndRecentBooks(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Book> pbh =  bookService.findHotBooks();
		PageBean<Book> pbr = bookService.getRecentBooks();
		
		request.setAttribute("pbh", pbh);
		
		return "f:/jsp/body.jsp";
	}
	
	
	
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		findByCategory(request, response);
		
		findByAuthor(request, response);
		
		findByBname(request, response);
		
		findByCombination(request, response);
		
		findByPress(request, response);
		
		findByBid(request, response);
		
		findHotAndRecentBooks(request, response);
	}
	
	
	

}
