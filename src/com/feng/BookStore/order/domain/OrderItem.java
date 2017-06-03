package com.feng.BookStore.order.domain;

import com.feng.BookStore.book.domain.Book;

public class OrderItem {
	private String orderItemId;//主键
	private int quantiey;//数量
	private double subtotal;//小计
	private Book book;//相关书籍 
	public String getOrderItemId() {
		return orderItemId;
	}
	public void setOrderItemId(String orderItemId) {
		this.orderItemId = orderItemId;
	}
	public int getQuantiey() {
		
		return quantiey;
	}
	public void setQuantiey(int quantiey) {
		this.quantiey = quantiey;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	private Order order;//所属订单
	public OrderItem(String orderItemId, int quantiey, double subtotal,
			Book book, Order order) {
		super();
		this.orderItemId = orderItemId;
		this.quantiey = quantiey;
		this.subtotal = subtotal;
		this.book = book;
		this.order = order;
	}
	
	public OrderItem() {
	}
	
	

}
