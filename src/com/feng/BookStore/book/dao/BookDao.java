package com.feng.BookStore.book.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.feng.BookStore.book.domain.Book;
import com.feng.BookStore.category.domain.Category;
import com.feng.BookStore.pager.Expression;
import com.feng.BookStore.pager.PageBean;
import com.feng.BookStore.pager.PageConstants;

import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;

public class BookDao {
	private QueryRunner qr=new TxQueryRunner();
	
	/**
	 * 删除图书
	 * @throws SQLException 
	 */
	public void delete(String bid) throws SQLException{
		String sql="delete from t_book where bid=?";
		qr.update(sql,bid);
	}
	/**
	 * 编辑书籍
	 * @param book
	 * @throws SQLException
	 */
	public void edit(Book book) throws SQLException{
		String sql="update t_book set bname=?,author=? ,price=?," +
				"currPrice=?, discount=?, press=?,publishtime=?," +
				"edition=?,pageNum=?,wordNum=?,printtime=?," +
				"booksize=?,paper=?,cid=? where bid=?";
		Object[]params={book.getBname(),book.getAuthor(),
				book.getPrice(),book.getCurrPrice(),book.getDiscount(),
				book.getPress(),book.getPublishtime(),book.getEdition(),
				book.getPageNum(),book.getWordNum(),book.getPrinttime(),
				book.getBooksize(),book.getPaper(),book.getCategory().getCid(),
				book.getBid()};
		qr.update(sql,params);
	}
	
	
	/**
	 * 查询指定分类下的图书个数
	 * @param cid
	 * @return
	 * @throws SQLException
	 */
	public int findBookCountByCategory(String cid) throws SQLException{
		String sql="select count(*) from t_book where cid=?";
		Number count=(Number) qr.query(sql, new ScalarHandler(),cid);
		if(count==null){
			count=0;
		}
		return count.intValue();
	}
	
	/**
	 * 多条件组合查询
	 * @param author
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Book> finByCombination(Book criteria,int pc) throws SQLException{
		List<Expression>exprList=new ArrayList<Expression>();
		exprList.add(new Expression("bname","like","%"+criteria.getBname()+"%"));
		exprList.add(new Expression("author","like","%"+criteria.getAuthor()+"%"));
		exprList.add(new Expression("press","like","%"+criteria.getPress()+"%"));
		return findByCriteria(exprList, pc);
	}
	
	
	
	
	/**
	 * 按出版社查询
	 * @param press
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Book> finByPress(String press,int pc) throws SQLException{
		List<Expression>exprList=new ArrayList<Expression>();
		exprList.add(new Expression("press","like","%"+press+"%"));
		return findByCriteria(exprList, pc);
	}
	
	
	/**
	 * 通过作者查询
	 * @param author
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Book> finByAuthor(String author,int pc) throws SQLException{
		List<Expression>exprList=new ArrayList<Expression>();
		exprList.add(new Expression("author","like","%"+author+"%"));
		return findByCriteria(exprList, pc);
	}
	
	/**
	 * 按分类查询
	 * @param cid
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Book> finByCategory(String cid,int pc) throws SQLException{
		List<Expression>exprList=new ArrayList<Expression>();
		exprList.add(new Expression("cid","=",cid));
		return findByCriteria(exprList, pc);
	}
	
	
	/**
	 * 按书名查询
	 * @param bname
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Book> finByBname(String bname,int pc) throws SQLException{
		List<Expression>exprList=new ArrayList<Expression>();
		exprList.add(new Expression("bname","like","%"+bname+"%"));
		return findByCriteria(exprList, pc);
	}
	
	/**
	 * 按购买量查询
	 * @param bname
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Book> findRec(String bid,int pc) throws SQLException{
		List<Expression>exprList=new ArrayList<Expression>();
		exprList.add(new Expression("bid","=",bid));
		return findByCriteria(exprList, pc);
	}
	
	
	/**
	 * 按BId查询
	 * @param bname
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Book> finByBid(String bid,int pc) throws SQLException{
		List<Expression>exprList=new ArrayList<Expression>();
		exprList.add(new Expression("bid","=",bid));
		return findByCriteria(exprList, pc);
	}
	
	
	/**
	 * 按照书名查询一本书
	 * @param bid
	 * @return
	 * @throws SQLException
	 */
	public Book load(String bid) throws SQLException{
			String sql = "SELECT * FROM t_book b, t_category c WHERE b.cid=c.cid AND b.bid=?";
			// 一行记录中，包含了很多的book的属性，还有一个cid属性
			Map<String,Object> map = qr.query(sql, new MapHandler(), bid);
			// 把Map中除了cid以外的其他属性映射到Book对象中
			Book book = CommonUtils.toBean(map, Book.class);
			// 把Map中cid属性映射到Category中，即这个Category只有cid
			Category category = CommonUtils.toBean(map, Category.class);
			// 两者建立关系
			book.setCategory(category);
			
			// 把pid获取出来，创建一个Category parnet，把pid赋给它，然后再把parent赋给category
			if(map.get("pid") != null) {
				Category parent = new Category();
				parent.setCid((String)map.get("pid"));
				category.setParent(parent);
			}
			return book;
		}
	
	
	
	/**
	 * 通用的查询方法
	 *  1.得到ps
	    2.得到tr
		3.得到beanList
		4.PageBean，返回
	 * @param exprList
	 * @param pc
	 * @return
	 * @throws SQLException 
	 */
	private PageBean<Book> findByCriteria(List<Expression>exprList,int pc) throws SQLException{
		//1.得到ps
		int ps=PageConstants.BOOK_PAGE_SIZE;//每页记录数
		//2.通过expreList来生成where子句得到tr
		StringBuilder whereSql=new StringBuilder(" where 1=1");
		List<Object> params=new ArrayList<Object>();//对应sql？的值
		for(Expression  expr:exprList){
			/**
			 * 1添加一个条件，以and开头
			 * 2添条件的名称
			 * 3条件的运算符，可以是 =、！=、>、<  ... is null ,is null 没有值
			 * 4.添加不是is null，在追加问号，然后再向params中添加一个问号对应的值。
			 */
			whereSql.append(" and ").append(expr.getName())
			.append(" ").append(expr.getOperator()).append(" ");
			//where 1=1 and bid= 
			if(!expr.getOperator().equals("is null")){
				whereSql.append("?");
				params.add(expr.getValue());
			}
		}
		//3.总记录数
		String sql="select count(*) from t_book "+whereSql;
		Number number=(Number) qr.query(sql, new ScalarHandler(),params.toArray());
		int tr=number.intValue();
		
		//4.得到beanList，当前页记录
		 sql="select * from t_book " + whereSql + " order by orderBy limit ?,?";
		
		 params.add((pc-1)*ps);//第一个问号：当前页首行记录的下标
		 params.add(ps);//第二个问号：一共查询几行，就是每页的记录数
		 List<Book> beanList=qr.query(sql, new BeanListHandler<Book>(Book.class),params.toArray());
		 
		 //5.创建PageBean,设置参数
		 PageBean<Book>pb=new PageBean<Book>();
		 pb.setBeanList(beanList);
		 pb.setPc(pc);
		 pb.setPs(ps);
		 
		 pb.setTr(tr);
		 //PageBean没有URL，这个任务交给Serivelt
		
		return pb; 
	}
	
	private PageBean<Book> findByQuin(List<Expression>exprList,int pc) throws SQLException{
		//1.得到ps
		int ps=PageConstants.BOOK_PAGE_SIZE;//每页记录数
		//2.通过expreList来生成where子句得到tr
		StringBuilder whereSql=new StringBuilder(" where 1=1");
		List<Object> params=new ArrayList<Object>();//对应sql？的值
		for(Expression  expr:exprList){
			/**
			 * 1添加一个条件，以and开头
			 * 2添条件的名称
			 * 3条件的运算符，可以是 =、！=、>、<  ... is null ,is null 没有值
			 * 4.添加不是is null，在追加问号，然后再向params中添加一个问号对应的值。
			 */
			whereSql.append(" and ").append(expr.getName())
			.append(" ").append(expr.getOperator()).append(" ");
			//where 1=1 and bid= 
			if(!expr.getOperator().equals("is null")){
				whereSql.append("?");
				params.add(expr.getValue());
			}
		}
		//3.总记录数
		String sql="select count(*) from t_book "+whereSql;
		Number number=(Number) qr.query(sql, new ScalarHandler(),params.toArray());
		int tr=number.intValue();
		
		//4.得到beanList，当前页记录
		 sql="select * from t_book " + whereSql + " order by orderBy limit ?,?";
		
		 params.add((pc-1)*ps);//第一个问号：当前页首行记录的下标
		 params.add(ps);//第二个问号：一共查询几行，就是每页的记录数
		 List<Book> beanList=qr.query(sql, new BeanListHandler<Book>(Book.class),params.toArray());
		 
		 //5.创建PageBean,设置参数
		 PageBean<Book>pb=new PageBean<Book>();
		 pb.setBeanList(beanList);
		 pb.setPc(pc);
		 pb.setPs(ps);
		 
		 pb.setTr(tr);
		 //PageBean没有URL，这个任务交给Serivelt
		
		return pb; 
	}
 
	/**
	 * 添加书籍
	 * @param book
	 * @throws SQLException
	 */
	public void add(Book book) throws SQLException {
		String sql="insert into t_book (bid,bname,author,price,currPrice,discount" +
				",press,publishtime,edition,pageNum,wordNum,printtime," +
				"booksize,paper,cid,image_w,image_b) values (?,?,?,?,?,?,?,?," +
				"?,?,?,?,?,?,?,?,?)";
		Object[]params={book.getBid(),book.getBname(),book.getAuthor(),
				book.getPrice(),book.getCurrPrice(),book.getDiscount(),
				book.getPress(),book.getPublishtime(),book.getEdition(),
				book.getPageNum(),book.getWordNum(),book.getPrinttime(),
				book.getBooksize(),book.getPaper(),book.getCategory().getCid(),
				book.getImage_w(),book.getImage_b()};
		qr.update(sql,params);
	}
	
	/**
	 * 查询热销的10本书籍
	 * @return
	 * @throws SQLException 
	 */
	public List<Book> findHotBooks() throws SQLException {
		String sql = "select * from t_book order by saleNum desc limit 0,6";
		List<Book> beanList=qr.query(sql, new BeanListHandler<Book>(Book.class));
		return beanList;
	}
	
}
