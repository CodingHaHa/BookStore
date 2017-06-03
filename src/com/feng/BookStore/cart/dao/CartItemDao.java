package com.feng.BookStore.cart.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import com.feng.BookStore.book.domain.Book;
import com.feng.BookStore.cart.domain.CartItem;
import com.feng.BookStore.user.domain.User;

import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;


public class CartItemDao {
	private QueryRunner qr=new TxQueryRunner();
	
	
	/**
	 * 生成where子句
	 * @param len
	 * @return
	 */
	private String toWhereSql(int len){
		StringBuilder sb=new StringBuilder("cartItemId in (");
		for(int i=0;i<len;i++){
			sb.append("?");
			if(i<len-1){
				sb.append(",");
			}
		}
		sb.append(")");
		return sb.toString();
	}
	
	
	/**
	 * 加载多个CartItem
	 * @param cartItemIds
	 * @return
	 * @throws SQLException 
	 */
	public List<CartItem> loadCartItems(String cartItemIds) throws SQLException {
		/*
		 * 1. 把cartItemIds转换成数组
		 */
		Object[] cartItemIdArray = cartItemIds.split(",");
		/*
		 * 2. 生成wehre子句
		 */
		String whereSql = toWhereSql(cartItemIdArray.length);
		/*
		 * 3. 生成sql语句
		 */
		String sql = "select * from t_cartitem c, t_book b where c.bid=b.bid and " + whereSql;
		/*
		 * 4. 执行sql，返回List<CartItem>
		 */
		return toCartItemList(qr.query(sql, new MapListHandler(), cartItemIdArray));
	}
	
	/**
	 * 批量删除
	 * @param len
	 * @throws SQLException 
	 */
	public void batchDelete(String  cartItemIds) throws SQLException{
		//将cartItemIds字符串变成数组
		Object []cartItemIdArray=cartItemIds.split(",");
		//链接成where子句
		String wheresql=toWhereSql(cartItemIdArray.length);
		//真正的sql语句
		String sql="delete from t_cartitem where "+wheresql;
		qr.update(sql,cartItemIdArray);//cartItemIdArray必须为Object数组
	}
	
	/**
	 * 查询某个用户的某一本图书是否存在
	 * @return
	 * @throws SQLException 
	 */
	public CartItem findByUidAndBid(String uid,String bid) throws SQLException{
		String sql="select * from t_cartitem where uid=? and bid=?";
		Map<String ,Object>map=qr.query(sql, new MapHandler(),uid,bid);
		CartItem cartItem=toCartItem(map);
		return cartItem;
	}
	
	/**
	 * 修改指定条目的数量
	 * @param cartItemId
	 * @param quantity
	 * @throws SQLException 
	 */
	public void undateQuantity(String cartItemId ,int quantity) throws SQLException{
		String sql="update t_cartitem set quantity=? where cartItemId=?";
		qr.update(sql,quantity, cartItemId);
	}
	
	/**
	 * 添加条目
	 * @param cartItem
	 * @throws SQLException 
	 */
	public void addCartItem(CartItem cartItem) throws SQLException{
		String sql="insert into t_cartitem(cartItemId,quantity,bid,uid)" +
				" values(?,?,?,?)";
		Object [] params={
				cartItem.getCartItemId(),cartItem.getQuantity(),
				cartItem.getBook().getBid(),cartItem.getUser().getUid()
				
		};
		qr.update(sql,params);
		
	}
	
	/**
	 * 把一个map映射为一个Cartitem
	 * @param map
	 * @return
	 */
	private CartItem toCartItem(Map<String,Object> map){
		if(map==null ||map.size()==0){
			return null;
		}
		CartItem cartItem=CommonUtils.toBean(map, CartItem.class);
		Book book=CommonUtils.toBean(map, Book.class);
		User user=CommonUtils.toBean(map, User.class);
		
		cartItem.setUser(user);
		cartItem.setBook(book);
		return cartItem;
	}
	
	/**
	 * 把多个Map(<List<Map>>)映射为多个CartItem
	 * @param mapList
	 * @return
	 */
	private List<CartItem> toCartItemList(List<Map<String,Object>>mapList){
		List<CartItem>cartItemList=new ArrayList<CartItem>();
		for(Map<String,Object>map:mapList){
			CartItem cartItem=toCartItem(map);
			cartItemList.add(cartItem);
		}
		return cartItemList;
	}
	
	/**
	 * 通过用户查询购物车条目
	 * @return
	 * @throws SQLException 
	 */
	public List<CartItem> findByUser(String uid) throws SQLException{
		String sql="select * from t_cartitem c ,t_book b " +
				"where c.bid=b.bid and uid=? order by c.orderBy";
		List<Map<String,Object>>mapList=qr.query(sql, new MapListHandler(),uid);
		return toCartItemList(mapList);
	}

	/**
	 * 根据书籍的bid来更新书籍销量
	 * @param bid
	 */
	public void updateSaleNum(String bid) {
		String sql = "update t_book set saleNum=saleNum+1 where bid= ?";
		try {
			qr.update(sql, bid);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("书籍销量更新有误!");
		}
	}

}
