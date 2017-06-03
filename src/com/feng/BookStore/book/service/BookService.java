package com.feng.BookStore.book.service;

import java.sql.SQLException;
import java.util.List;

import com.feng.BookStore.book.dao.BookDao;
import com.feng.BookStore.book.domain.Book;
import com.feng.BookStore.pager.PageBean;


public class BookService {
	private BookDao bookDao=new BookDao();
	
	
	/**
	 * 删除图书
	 * @param bid
	 */
	public void delete(String bid){
		try {
			bookDao.delete(bid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 返回指定分类下的书籍个数
	 * @param cid
	 * @return
	 */
	public int findBookCountByCategory(String cid){
		try {
			int count=bookDao.findBookCountByCategory(cid);
			return count;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	/**
	 * 分类查询
	 * @param cid
	 * @param pc
	 * @return
	 */
	public PageBean<Book>findByCategory(String cid,int pc){
		try {
			return bookDao.finByCategory(cid, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	
	/**
	 * 按id查
	 * @param bname
	 * @param pc
	 * @return
	 */
	public PageBean<Book>findByBid(String bid,int pc){
		try {
			return bookDao.finByBid(bid, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 按照bid加载一本书
	 * @param bid
	 * @return
	 */
	public Book load(String bid){
		try {
			return bookDao.load(bid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	public void edit(Book book){
		try {
			bookDao.edit(book);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 按书名查
	 * @param bname
	 * @param pc
	 * @return
	 */
	public PageBean<Book>findByBname(String bname,int pc){
		try {
			return bookDao.finByBname(bname, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 按作者查询
	 * @param cid
	 * @param pc
	 * @return
	 */
	public PageBean<Book>findByAuthor(String author,int pc){
		try {
			return bookDao.finByAuthor(author, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 按出版社查询
	 * @param press
	 * @param pc
	 * @return
	 */
	public PageBean<Book>findByPress(String press,int pc){
		try {
			return bookDao.finByPress(press, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 组合查询
	 * @param cid
	 * @param pc
	 * @return
	 */
	public PageBean<Book>findByCombination(Book criteria,int pc){
		try {
			return bookDao.finByCombination(criteria, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}


	/**
	 * 添加图书
	 * @param book
	 */
	public void add(Book book) {
		try {
			bookDao.add(book);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	
	/**
	 * 获取热销的10本书
	 * @return
	 */
	public List<Book> findHotBooks() {
		try {
			return bookDao.findHotBooks();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 获取最近浏览的60本书
	 * @return
	 */
	public PageBean<Book> getRecentBooks() {
		return null;
	}
}
