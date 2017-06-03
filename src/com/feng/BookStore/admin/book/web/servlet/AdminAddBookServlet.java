package com.feng.BookStore.admin.book.web.servlet;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.feng.BookStore.book.domain.Book;
import com.feng.BookStore.book.service.BookService;
import com.feng.BookStore.category.domain.Category;
import com.feng.BookStore.category.service.CategoryService;

import cn.itcast.commons.CommonUtils;



public class AdminAddBookServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		/**
		 * 文件上传解析三步走
		 * 1.commons-fileupload上传
		 * 
		 */
		//1.创建工厂
		FileItemFactory factory=new DiskFileItemFactory();
		//2.创建解析器对象
		ServletFileUpload sfu=new ServletFileUpload(factory);
		sfu.setSizeMax(80*1024);//设置单个上传的文件上限为80kb
		//3.解析request得到List<FileItem>
		List<FileItem>fileItemList =null;
		try {
			fileItemList=sfu.parseRequest(request);
		} catch (FileUploadException e) {
			//如果出现这个异常，说明当单个上传文件超出了80kb了
			error("上传的文件超出了80kb",request,response);
			return ;
		}
		//4.1把List<FileItem>封装到book对象中,首先把一个普通表单中的内容，放到一个Map中，再把Map转换为book和Category，再见了二者的关系
		Map<String,Object>map=new HashMap<String, Object>();
		for(FileItem fileItem:fileItemList){
			if(fileItem.isFormField()){//如果是普通表单字段
			map.put(fileItem.getFieldName(), fileItem.getString("utf-8"));
			}
		}
		
		Book book=CommonUtils.toBean(map, Book.class);//把map中大部分数据封装到book中
		Category category=CommonUtils.toBean(map, Category.class);//把Map中cid封装到Category中
		book.setCategory(category);
		
		//4.2把上传的图片保存起来  *获取文件名：截取     *给文件添加前缀：使用uuid  *校验文件后缀名jsp  *校验图片尺寸  *指定图片保存路径  *删除零食文件 *保存 *将图片的保存路径给book
		//获取文件名
		FileItem fileItem=fileItemList.get(1);
		String filename=fileItem.getName();
		//截取文件名，因为部分浏览器上传的是绝对路径
		int index=filename.lastIndexOf("\\");
		if(index!=-1){
			filename=filename.substring(index+1);
		}
		//给文件添加uuid前缀，避免重名
		filename=CommonUtils.uuid()+"_"+filename;
		//校验扩展名
		if(!filename.toLowerCase().endsWith(".jpg")){
			error("上传图片扩展名必须为JPG",request,response);
			return ;
		}
		
		//校验图片的尺寸，图片相关类
		//1.保存上传的图片，把图片new成图片对象：Image/Icon/ImageIcon/BufferedImage/ImageIO
		
		/**
		 * 保存图片
		 * 1.获取真实路径
		 */
		String savepath=this.getServletContext().getRealPath("/book_img");
		//2.创建目标文件
		File destFile=new File(savepath,filename);
		//3.保存文件
		try {//它会把临时文件重定向到指定的路径，再删除临时文件
			fileItem.write(destFile);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
		//校验图片尺寸
		//1.使用文件路径创建ImageIcon
		ImageIcon icom=new ImageIcon(destFile.getAbsolutePath());
		//2.通过ImageIcon得到Image对象
		Image image=icom.getImage();
		//3.获取宽高来进行校验
		if(image.getWidth(null)>350||image.getHeight(null)>350){
			error("您上传的图片尺寸超出了350*350！",request,response);
			destFile.delete();//删除图片
			return;
		}
		
		//把图片路径设置给book对象
		book.setImage_w("book_img/"+filename);
		
		
		
		         //获取文件名
				 fileItem=fileItemList.get(2);
				 filename=fileItem.getName();
				//截取文件名，因为部分浏览器上传的是绝对路径
				 index=filename.lastIndexOf("\\");
				if(index!=-1){
					filename=filename.substring(index+1);
				}
				//给文件添加uuid前缀，避免重名
				filename=CommonUtils.uuid()+"_"+filename;
				//校验扩展名
				if(!filename.toLowerCase().endsWith(".jpg")){
					error("上传图片扩展名必须为JPG",request,response);
					return ;
				}
				
				//校验图片的尺寸，图片相关类
				//1.保存上传的图片，把图片new成图片对象：Image/Icon/ImageIcon/BufferedImage/ImageIO
				
				/**
				 * 保存图片
				 * 1.获取真实路径
				 */
				 savepath=this.getServletContext().getRealPath("/book_img");
				//2.创建目标文件
				 destFile=new File(savepath,filename);
				//3.保存文件
				try {//它会把临时文件重定向到指定的路径，再删除临时文件
					fileItem.write(destFile);
				} catch (Exception e) {
					throw new RuntimeException(e);
				}
				
				//校验图片尺寸
				//1.使用文件路径创建ImageIcon
				 icom=new ImageIcon(destFile.getAbsolutePath());
				//2.通过ImageIcon得到Image对象
				 image=icom.getImage();
				//3.获取宽高来进行校验
				if(image.getWidth(null)>350||image.getHeight(null)>350){
					error("您上传的图片尺寸超出了350*350！",request,response);
					destFile.delete();//删除图片
					return;
				}
				
				//把图片路径设置给book对象
				book.setImage_b("book_img/"+filename);
				
				//调用service完成保存
				book.setBid(CommonUtils.uuid());
				BookService bookService=new BookService();
				bookService.add(book);
				
				//保存成功信息转发到msg.jsp
				request.setAttribute("msg", "添加图书成功！");
				request.getRequestDispatcher("/adminjsp/msg.jsp").forward(request, response);
	}
	
	/**
	 * 保存错误信息，转发到add.jsp页面
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void error(String msg,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setAttribute("parents", new CategoryService().findParents());
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/adminjsp/admin/book/body.jsp").forward(request, response);
	}

}
