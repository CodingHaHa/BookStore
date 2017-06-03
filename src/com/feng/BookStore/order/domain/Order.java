package com.feng.BookStore.order.domain;

import java.util.List;

import com.feng.BookStore.user.domain.User;


/**
 * 订单类
 * @author FENGLIAN
 */
public class Order {
	private String oid;//主键
	private String ordertime;
	private double total;//总计
	private int status;//未付款：1   未付款   2：已付款未发货  3：已发货为确认收货  4：交易成功  5：已取消（只有未付款才能取消）
	private String address;//收货地址
	private User owner;//订单所属人
	
	private List<OrderItem> orderItemList;
	public List<OrderItem> getOrderItemList() {
		return orderItemList;
	}
	public void setOrderItemList(List<OrderItem> orderItemList) {
		this.orderItemList = orderItemList;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public User getOwner() {
		return owner;
	}
	public void setOwner(User owner) {
		this.owner = owner;
	}
	public Order(String oid, String ordertime, double total, int status,
			String address, User owner) {
		super();
		this.oid = oid;
		this.ordertime = ordertime;
		this.total = total;
		this.status = status;
		this.address = address;
		this.owner = owner;
	}
	
	public Order(){
		
	}
	

}
