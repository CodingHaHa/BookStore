package com.feng.BookStore.order.service;

import java.sql.SQLException;

import com.feng.BookStore.order.dao.OrderDao;
import com.feng.BookStore.order.domain.Order;
import com.feng.BookStore.pager.PageBean;

import cn.itcast.jdbc.JdbcUtils;


public class OrderService {
	private OrderDao orderDao=new OrderDao();
	
	
	/**
	 * 查询订单状态 
	 * @param oid
	 * @return
	 */
	public int findSatus(String oid){
		try {
			return orderDao.findStatus(oid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 修改订单状态 
	 * @param oid
	 * @return
	 */
	public void updateSatus(String oid,int status){
		try {
			 orderDao.updateStatus(oid, status);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 生成订单
	 * @param order
	 */
	public void createOrder(Order order) {
		try {
			JdbcUtils.beginTransaction();
			orderDao.add(order);
			JdbcUtils.commitTransaction();
		} catch (SQLException e) {
			try {
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {}
			throw new RuntimeException(e);
		}
	}
	/**
	 * 我的订单
	 * @param uid
	 * @param pc
	 * @return
	 */
	public PageBean<Order> myOrders(String uid,int pc){
		try {//进行事务处理
			JdbcUtils.beginTransaction();
			PageBean<Order>pb=orderDao.finByUser(uid, pc);
			JdbcUtils.commitTransaction();
			return pb;
		} catch (SQLException e) {
			try {
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {
				
			}
			throw new RuntimeException(e);
		}
		
		
	}
	
	
	/**
	 * 查询所有订单
	 * @param pc
	 * @return
	 */
	public PageBean<Order> findAll(int pc){
		try {//进行事务处理
			JdbcUtils.beginTransaction();
			PageBean<Order>pb=orderDao.finAll(pc);
			JdbcUtils.commitTransaction();
			return pb;
		} catch (SQLException e) {
			try {
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {
				
			}
			throw new RuntimeException(e);
		}
		
		
	}
	
	/**
	 * 按状态查询
	 * @param status
	 * @param pc
	 * @return
	 */
	public PageBean<Order> findByStatus(int status,int pc){
		try {//进行事务处理
			JdbcUtils.beginTransaction();
			PageBean<Order>pb=orderDao.findByStatus(status, pc);
			JdbcUtils.commitTransaction();
			return pb;
		} catch (SQLException e) {
			try {
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {
				
			}
			throw new RuntimeException(e);
		}
		
		
	}
	
	
	
	
	/**
	 * 按订单号查询
	 * 加载订单
	 * @param oid
	 * @param pc
	 * @return
	 */
	public Order findByOid(String oid){
		try {//进行事务处理
			JdbcUtils.beginTransaction();
			Order order=orderDao.finByOid(oid);
			JdbcUtils.commitTransaction();
			return order;
		} catch (SQLException e) {
			try {
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {
				
			}
			throw new RuntimeException(e);
		}
		
	}
	
}
