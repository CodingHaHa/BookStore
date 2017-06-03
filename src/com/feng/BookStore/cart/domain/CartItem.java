package com.feng.BookStore.cart.domain;

import java.math.BigDecimal;

import com.feng.BookStore.book.domain.Book;
import com.feng.BookStore.user.domain.User;


/**
 * 购物车条目类
 * @author FENGLIAN
 *
 */
public class CartItem {
	
	private String cartItemId;//主键
	private int quantity;//数量
	private Book book;//购买书籍
	private User user;//车主
	
	/**
	 * 小计
	 * 使用BigDecimal不会有误差
	 *   要求必须使用它的String 类的构造器  可以确保准确度
	 * @return
	 */
	public double getSubtotal(){
		BigDecimal b1=new BigDecimal(book.getCurrPrice()+"");
		BigDecimal b2=new BigDecimal(quantity+"");
	    BigDecimal b3 = b1.multiply(b2);
		return b3.doubleValue();
	}
	
	public String getCartItemId() {
		return cartItemId;
	}
	public void setCartItemId(String cartItemId) {
		this.cartItemId = cartItemId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	

}
