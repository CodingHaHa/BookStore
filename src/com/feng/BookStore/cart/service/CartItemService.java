package com.feng.BookStore.cart.service;

import java.sql.SQLException;
import java.util.List;

import com.feng.BookStore.cart.dao.CartItemDao;
import com.feng.BookStore.cart.domain.CartItem;

import cn.itcast.commons.CommonUtils;


public class CartItemService {
	private CartItemDao cartDao=new CartItemDao();
	
	
	/**
	 * 批量删除
	 * @param cartItemIds
	 */
	public void batchDelete(String cartItemIds){
		try {
			cartDao.batchDelete(cartItemIds);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 添加条目
	 * 1.使用uid和bid去数据库中查询这个条目是否存在
	 * 2.修改条目数量（如果不存在就新增加条目）
	 */
	public void add(CartItem cartItem){
		try {
			CartItem _cartItem=cartDao.findByUidAndBid(
					cartItem.getUser().getUid(), cartItem.getBook().getBid());
			if(_cartItem==null){//如果原来没有这个条目，添加
				cartItem.setCartItemId(CommonUtils.uuid());
				cartDao.addCartItem(cartItem);
			}else{//如果有就增加数量
				//将原有数量与新数量之和作为新数量
				int quantity=cartItem.getQuantity()+_cartItem.getQuantity();
				cartDao.undateQuantity(_cartItem.getCartItemId(), quantity);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}

	
	
	/**
	 * 我的购物车
	 * @param uid
	 * @return
	 */
	public List<CartItem> myCart(String uid){
		try {
			return cartDao.findByUser(uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	
	
	/*
	 * 加载多个CartItem
	 */
	public List<CartItem> loadCartItems(String cartItemIds) {
		try {
			return cartDao.loadCartItems(cartItemIds);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 根据书籍的bid来更新书籍销量
	 * @param bid
	 */
	public void updateSaleNum(String bid) {
		cartDao.updateSaleNum(bid);
	}

}
