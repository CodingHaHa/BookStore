package com.feng.BookStore.order.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.feng.BookStore.book.domain.Book;
import com.feng.BookStore.order.domain.Order;
import com.feng.BookStore.order.domain.OrderItem;
import com.feng.BookStore.pager.Expression;
import com.feng.BookStore.pager.PageBean;
import com.feng.BookStore.pager.PageConstants;

import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;

public class OrderDao {
	private QueryRunner qr=new TxQueryRunner();
	
	
	/**
	 * 查询订单状态
	 * @param oid
	 * @return
	 * @throws SQLException 
	 */
	public int findStatus(String oid) throws SQLException{
		String sql="select status from t_order where oid=?";
		Number number=(Number)qr.query(sql, new ScalarHandler(),oid);
		return number.intValue();		
	}
	
	
	
	
	/**
	 * 修改订单状态
	 * @param oid
	 * @param status
	 * @throws SQLException
	 */
	public void updateStatus(String oid,int status) throws SQLException{
		String sql="update t_order set status=? where oid=?";
		qr.update(sql,status,oid);
	}
	
	
	
	/**
	 * 通过订单号查找
	 * 加载订单
	 * @param oid
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public Order finByOid(String oid) throws SQLException{
		String sql="select * from t_order where oid=?";
		Order order =qr.query(sql, new BeanHandler<Order>(Order.class),oid);
		loadOrderItem(order);//当前订单加载所有订单条目
		
		//为一个订单条目添加条目数目
		List<OrderItem>orderItemList=order.getOrderItemList();
		for(OrderItem o:orderItemList){
			String orderItemId=o.getOrderItemId();
			sql="select quantity from t_orderitem where orderItemId=?";
			Number number=(Number) qr.query(sql, new ScalarHandler(),orderItemId);
			int num=number.intValue();
			o.setQuantiey(num);
		}
		return order;
	}
	
	
	
	
	
	
	/**
	 * 按用户查询订单
	 * @param uid
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Order> finByUser(String uid,int pc) throws SQLException{
		List<Expression>exprList=new ArrayList<Expression>();
		exprList.add(new Expression("uid","=",uid));
		return findByCriteria(exprList, pc);
	}
	
	/**
	 * 按状态查询
	 * @param status
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Order> findByStatus(int status,int pc) throws SQLException{
		List<Expression>exprList=new ArrayList<Expression>();
		exprList.add(new Expression("status","=",status+""));
		return findByCriteria(exprList, pc);
	}
	
	
	/**
	 * 查询所有订单
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Order> finAll(int pc) throws SQLException{
		List<Expression>exprList=new ArrayList<Expression>();
		return findByCriteria(exprList, pc);
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
	private PageBean<Order> findByCriteria(List<Expression>exprList,int pc) throws SQLException{
		//1.得到ps
		int ps=PageConstants.ORDER_PAGE_SIZE;//每页记录数
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
		String sql="select count(*) from t_order "+whereSql;
		Number number=(Number) qr.query(sql, new ScalarHandler(),params.toArray());
		int tr=number.intValue();
		
		//4.得到beanList，当前页记录
		 sql="select * from t_order " + whereSql + " order by ordertime desc limit ?,?";
		
		 params.add((pc-1)*ps);//第一个问号：当前页首行记录的下标
		 params.add(ps);//第二个问号：一共查询几行，就是每页的记录数
		 List<Order> beanList=qr.query(sql, new BeanListHandler<Order>(Order.class),params.toArray());
		 
		 //虽然已经获取了所有的订单，但是每个订单中国没有订单条目
		 //遍历每一个订单，为其加载所有条目。
		 for(Order order:beanList){
			 loadOrderItem(order);
		 }
		 //5.创建PageBean,设置参数
		 PageBean<Order>pb=new PageBean<Order>();
		 pb.setBeanList(beanList);
		 pb.setPc(pc);
		 pb.setPs(ps);
		 
		 pb.setTr(tr);
		 //PageBean没有URL，这个任务交给Serivelt
		
		return pb; 
	}


	/**
	 * 为指定的order加载它的所有OrderItem
	 * @param order
	 * @throws SQLException 
	 */
	private void loadOrderItem(Order order) throws SQLException {
		//1.给sql语句，select * from t_ordertime where oid=?
		//2.执行，得到List<OrderItem>
		//3.设置Ordre对象
		String sql="select * from t_orderitem where oid=?";
		List<Map<String,Object>>mapList=qr.query(sql, new MapListHandler(),order.getOid());
		List<OrderItem>orderItemList=toOrderItemList(mapList);
		 
		order.setOrderItemList(orderItemList);
	}


	/**
	 * 把多个Map转换为多个orderItem
	 * @param mapList
	 * @return
	 */
	private List<OrderItem> toOrderItemList(List<Map<String, Object>> mapList) {
		List<OrderItem>orderItemList=new ArrayList<OrderItem>();
		for(Map<String,Object>map:mapList){
			OrderItem orderItem=toOrderItemList(map);
			
			orderItemList.add(orderItem);
		}
		return orderItemList;
	}


	/**
	 * 把一个Map转换为一个OrderItem
	 * @param map
	 * @return
	 */
	private OrderItem toOrderItemList(Map<String, Object> map) {
		OrderItem orderItem=CommonUtils.toBean(map, OrderItem.class);
		Book book=CommonUtils.toBean(map, Book.class);
		orderItem.setBook(book);
		return orderItem;
	}
	
	/**
	 * 生成订单
	 * @param order
	 * @throws SQLException
	 */
	public void add(Order order) throws SQLException {
		/*
		 * 1. 插入订单
		 */
		String sql = "insert into t_order values(?,?,?,?,?,?)";
		Object[] params = {order.getOid(), order.getOrdertime(),
				order.getTotal(),order.getStatus(),order.getAddress(),
				order.getOwner().getUid()};
		qr.update(sql, params);
		
		/*
		 * 2. 循环遍历订单的所有条目,让每个条目生成一个Object[]
		 * 多个条目就对应Object[][]
		 * 执行批处理，完成插入订单条目
		 */
		sql = "insert into t_orderitem values(?,?,?,?,?,?,?,?)";
		int len = order.getOrderItemList().size();
		Object[][] objs = new Object[len][];
		for(int i = 0; i < len; i++){
			OrderItem item = order.getOrderItemList().get(i);
			objs[i] = new Object[]{item.getOrderItemId(),item.getQuantiey(),
					item.getSubtotal(),item.getBook().getBid(),
					item.getBook().getBname(),item.getBook().getCurrPrice(),
					item.getBook().getImage_b(),order.getOid()};
		}
		qr.batch(sql, objs);
	}
}
