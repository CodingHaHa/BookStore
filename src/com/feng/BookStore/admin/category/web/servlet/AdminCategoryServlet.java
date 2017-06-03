package com.feng.BookStore.admin.category.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.feng.BookStore.book.service.BookService;
import com.feng.BookStore.category.domain.Category;
import com.feng.BookStore.category.service.CategoryService;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;


public class AdminCategoryServlet extends BaseServlet {
	private CategoryService categoryService=new CategoryService();
	private BookService bookService=new BookService();
	
	/**
	 * 删除二级分类
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String deleteChild(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.获取cid，二级分类id
		String cid=request.getParameter("cid");
		//2.获取该分类下的图书个数
		int count=bookService.findBookCountByCategory(cid);
		//3.判断，如果大于零，保存错误信息，转发到msg.jsp，如果小于零删除，转发到list.jsp
		if(count>0){
			request.setAttribute("msg", "该分类下还有图书，不能删除!");
			return "f:/adminjsp/msg.jsp";
		}else{
			categoryService.delete(cid);
			return findAll(request, response);
		}
	}
	
	
	
	
	/**
	 * 删除一级分类
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String deleteParent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.获取连接参数cid,是一个一级分类的id
		String cid=request.getParameter("cid");
		
		//2.过个cid，查询该父分类下子分类的个数
		int count=categoryService.findChildrenCountByparent(cid);
		//3.如果大于零，说明有子分类不删除，否则删除(并且保存错误信息，转发到msg.jsp)
		if(count>0){
			
			request.setAttribute("msg", "该分类下还有子分类，不能删除");
			return "f:/adminjsp/msg.jsp";
		}else{
			categoryService.delete(cid);
			return findAll(request, response);
		}
	}
	
	/**
	 * 修改二级分类第一步
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String editChildPre(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.获取连接参数cid
		String cid=request.getParameter("cid");
		Category child=categoryService.load(cid);
		//2.查询所有一级分类保存
		request.setAttribute("child", child);
		request.setAttribute("parents", categoryService.findParents());
		//3.转发到edit2.jsp
		return "f:/adminjsp/admin/category/edit2.jsp";
		
	}
	
	/**
	 * 修改二级分类第二步
	 */
	public String editChild(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.封装表单数据到Category
		Category child=CommonUtils.toBean(request.getParameterMap(), Category.class);
		//2.把表单中的pid封装到child
		String pid=request.getParameter("pid");
		Category parent =new Category();
		parent.setCid(pid);
		child.setParent(parent);
		//3.调用service的edit()
		categoryService.edit(child);
		//4.返回到list.jsp
		return findAll(request, response);
		
	}
	
	
	/**
	 * 修改一级分类第一步
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String editParentPre(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.获取连接传过来的cid
		String cid=request.getParameter("cid");
		//2.通过cid去加载Ctegory
		Category parent=categoryService.load(cid);
		//3.保存Category
		request.setAttribute("parent", parent);
		//4.到edit.jsp页面去显示Category
		return "f:/adminjsp/admin/category/edit.jsp";
	}
	
	/**
	 * 修改一级分类第二 步
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String editParent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.封装表单数据到Category中
		
		
		Category parent =CommonUtils.toBean(request.getParameterMap(), Category.class);
		//2.调用service方法完成修改
		categoryService.edit(parent);
		//3.转发到list.jsp显示所有分类
		return findAll(request,response);
	}
	
	
	/**
	 * 添加二级分类第一步
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String addChildPre(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pid=request.getParameter("pid");
		List<Category>parents=categoryService.findParents();
		request.setAttribute("pid", pid);
		request.setAttribute("parents", parents);
		return "f:/adminjsp/admin/category/add2.jsp";
		
		
	}
	
	/**
	 * 添加子分类
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String addChild(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.封装表单数据
		//2.手动把表单数据映射到child对象
		//3.调用service的add方法
		//4.调用findAll方法，返回
		Category child=new Category();
		String cname=request.getParameter("cname");
		String desc=request.getParameter("desc");
		child.setCname(cname);
		child.setDesc(desc);
		child.setCid(CommonUtils.uuid());
		
		//手动映射pid
		String pid=request.getParameter("pid");
		Category parent=new Category();
		parent.setCid(pid);
		child.setParent(parent);
		categoryService.add(child);
		return findAll(request, response);
		
	}
	
	/**
	 * 添加一级分类
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String addParent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.封装表单数据
		//2.调用service的add方法
		//3.调用findAll方法，返回
		Category parent=new Category();
		String cname=request.getParameter("cname");
		String desc=request.getParameter("desc");
		parent.setCname(cname);
		parent.setDesc(desc);
		parent.setCid(CommonUtils.uuid());
		categoryService.add(parent);
		return findAll(request, response);
		
		
		
	}

	
	
	/**
	 * 查询所有分类
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("parents", categoryService.findAll());
		return "f:/adminjsp/admin/category/list.jsp";
	}

}
