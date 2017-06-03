package com.feng.BookStore.admin.book.web.servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.feng.BookStore.book.domain.Book;
import com.feng.BookStore.book.service.BookService;
import com.feng.BookStore.category.domain.Category;
import com.feng.BookStore.category.service.CategoryService;
import com.feng.BookStore.pager.PageBean;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;


public class AdminBookServlet extends BaseServlet {
	private BookService bookService=new BookService();
	private CategoryService categoryService=new CategoryService();
	
	/**
	 * 修改图书
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.封装表单数据到book中
		//2.封装cid到Categor
		//3.把Category给book
		//4.调用service
		//5.保存成功信息，转发到msg.jsp
		Map map=request.getParameterMap();
		Book book=CommonUtils.toBean(map, Book.class);
		Category category=CommonUtils.toBean(map, Category.class);
		book.setCategory(category);
		bookService.edit(book);
		request.setAttribute("msg", "修改图书成功！");
		return "f:/adminjsp/msg.jsp";
	}
	
	/**
	 * 删除图书
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bid=request.getParameter("bid");
		
		
		//删除图片
		Book book=bookService.load(bid);
		String savepath= this.getServletContext().getRealPath("/");//获取真实路径
		new File(savepath,book.getImage_b()).delete();//删除文件
		new File(savepath,book.getImage_w()).delete();//删除文件
		
		bookService.delete(bid);//删除数据库记录
		request.setAttribute("msg", "删除图书成功！");
		return "f:/adminjsp/msg.jsp";
	}
	
	
	
	/**
	 * 加载图书
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String load(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.通过bid获得book对象，保存
		String bid=request.getParameter("bid");
		Book book=bookService.load(bid);
		request.setAttribute("book", book);
		//2.获取所有的一级目录，保存
		request.setAttribute("parents", categoryService.findParents());
		//3.获取当前图书所属一级分类下的所有二级分类
		String pid=book.getCategory().getParent().getCid();
		request.setAttribute("children", categoryService.findByParent(pid));
		//4.返回desc.jsp
		return "f:/adminjsp/admin/book/desc.jsp";
	}

	
	
	
	/**
	 * 添加图书第一步
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String addPre(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Category>parents= categoryService.findParents();
		request.getSession().setAttribute("parents", parents);
//		request.setAttribute("parents", parents);
		return "f:/adminjsp/admin/book/main.jsp";
		
	}
	
	/**
	 * 异步请求
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String ajaxFindChildren(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.获取pid
		String pid=request.getParameter("pid");
		//2.通过pid加载子分类
		List<Category>children=categoryService.findByParent(pid);
		//3.把List<Category>转换为JOSN输出给客户端
		String json=toJson(children);
		System.out.println(json);
		response.getWriter().print(json);
		return null;
	}
	
	private String toJson(Category category){
		StringBuilder sb=new StringBuilder("{");
		sb.append("\"cid\"").append(":").append("\"").append(category.getCid()).append("\"");
		sb.append(",");
		sb.append("\"cname\"").append(":").append("\"").append(category.getCname()).append("\"");
		sb.append("}");
		return sb.toString();
	}
	
	//[{"cid:"  "},{}]
	private String toJson(List<Category> categoryList){
		StringBuilder sb=new StringBuilder("[");
		for(int i=0;i<categoryList.size();i++){
			sb.append(toJson(categoryList.get(i)));
			if(i<categoryList.size()-1){
				sb.append(",");
			}
		}
		sb.append("]");
		return sb.toString();
	}
	
	/**
	 * 查询所有分类
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findCategoryAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//1.通过service得到所有的分类
		//2.保存到request中，转发到left.jsp
		List<Category> parents=categoryService.findAll();
		request.setAttribute("parents", parents);
		return "f:/adminjsp/admin/book/left.jsp";
	}
	
	
	
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
		return "f:/adminjsp/admin/book/list.jsp";
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
		return "f:/adminjsp/admin/book/list.jsp";
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
		return "f:/adminjsp/admin/book/list.jsp";
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
		return "f:/adminjsp/admin/book/list.jsp";
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
		return "f:/adminjsp/admin/book/desc.jsp";
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
		return "f:/adminjsp/admin/book/list.jsp";
	}
	
	
}
