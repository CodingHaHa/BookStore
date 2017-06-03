package com.feng.BookStore.category.domain;

import java.io.Serializable;
import java.util.List;

/**
 * 分类模块实体类
 * @author FENGLIAN
 *
 */
public class Category implements Serializable{
	/**
	 * 双向自身关联
	 */
	private String cid;//主键
	private String cname;//分类名称
	private Category parent;//pid是一个外键父类的(因为要获得父分类的id主键)：自身关联
	private String desc;//分类描述
	
	private  List<Category> children;//子分类

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Category getParent() {
		return parent;
	}

	public void setParent(Category parent) {
		this.parent = parent;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public List<Category> getChildren() {
		return children;
	}

	public void setChildren(List<Category> children) {
		this.children = children;
	}
	

}
