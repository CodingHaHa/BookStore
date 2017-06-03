package com.feng.BookStore.category.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.feng.BookStore.category.domain.Category;

import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;

/**
 * 分类持久层
 * @author FENGLIAN
 *
 */
public class CategoryDao {
	//要使用该类的查询功能
	private QueryRunner qr=new TxQueryRunner();
	
	
	/**
	 * 查询指定分类下子分类的个数
	 * @return
	 * @throws SQLException 
	 */
	public int findChildrenCountByParent(String pid) throws SQLException{
		String sql="select count(*) from t_category where pid=?";
		Number count=(Number) qr.query(sql, new ScalarHandler(),pid);
		if(count==null){
			count=0;
		}
		return count.intValue();
	}
	
	/**
	 * 删除分类
	 * @throws SQLException 
	 */
	public void delect(String cid) throws SQLException{
		String sql="delete from t_category where cid=?";
		qr.update(sql,cid);
	}
	
	/**
	 * 把一个Map中的数据映射到Category中
	 * @param map
	 * @return
	 */
	private Category toCategory(Map<String,Object>map){
		Category category=CommonUtils.toBean(map, Category.class);
		String pid=(String) map.get("pid");//如果是一级分类那么pid为null
		if(pid!=null){//如果父分类id不为空使用一个父分类对象来转载pid，再把父分类给category
			Category parent=new Category();
			parent.setCid(pid);
			category.setParent(parent);
		}
		return category;
	}
	
	/**
	 * 可以报多个Map<List<Map>>映射成多个Category(List<Category>)
	 * @param map
	 * @return
	 */
	private List<Category> toCategoryList(List<Map<String,Object>>mapList){
		List<Category>categoryList=new ArrayList<Category>();
		for(Map<String,Object>map:mapList){
			Category c=toCategory(map);
			categoryList.add(c);
		}
		return categoryList;
	}
	
	/**
	 * 返回所有分类
	 * @return
	 * @throws SQLException 
	 */
	public List<Category> findAll() throws SQLException{
		//1.返回所有一级分类      
		String sql="select * from t_category where pid is null order by orderBy";
		List<Map<String,Object>>mapList=qr.query(sql, new MapListHandler());
		
		List<Category> parents= toCategoryList(mapList) ;
		//2.循环遍历所有的一级分类，为每一个一级分类加载它的二级分类
		for(Category parent:parents){
			//查询当前分类的所有子分类
			List<Category> children =findByParent(parent.getCid());
			parent.setChildren(children);
		}
		return parents;
	}
	
	/**
	 * 通过父分类查询子分类
	 * @return
	 * @throws SQLException 
	 */
	public List<Category>findByParent(String pid) throws SQLException{
		String sql="select * from t_category where pid=? order by orderBy";
		List<Map<String,Object>>mapList=qr.query(sql, new MapListHandler(),pid);
		return toCategoryList(mapList); 
	}
	
	/**
	 * 添加分类（一级分类和二级分类都可以添加）
	 * @param category
	 * @throws SQLException 
	 */
	public void add(Category category) throws SQLException{
		String sql="insert into t_category(cid,cname,pid,`desc`) value(?,?,?,?)";
		//一级分类没有parent而二级分类有，我们想要兼容俩种分类所以要进行判断
		String pid=null;//一级分类
		if(category.getParent()!=null){
			pid=category.getParent().getCid();
		}
		
		Object []params={category.getCid(),category.getCname(),pid,category.getDesc()};
		qr.update(sql,params);
		
	}
	
	
	/**
	 * 加载分类
	 * 一级、二级分类都可以加载
	 * @param cid
	 * @return
	 * @throws SQLException 
	 */
	public Category load(String cid) throws SQLException{
		String sql="select * from t_category where cid=?";
		return toCategory(qr.query(sql, new MapHandler(),cid));
	}
	
	
	/**
	 * 修改分类
	 * 两种分类都可以修改
	 * @param category
	 * @throws SQLException 
	 */
	public void edit(Category category) throws SQLException{
		String sql="update t_category set cname=?,pid=?, `desc`=? where cid=?";
		String pid=null;
		if(category.getParent()!=null){
			pid=category.getParent().getCid();
		}
		Object[] params={category.getCname(),pid,category.getDesc(),category.getCid()};
		qr.update(sql,params);
	}
	
	
	
	/**
	 * 返回所有的父分类不带子分类
	 * @return
	 * @throws SQLException
	 */
	public List<Category> findParents() throws SQLException{
		//1.返回所有一级分类      
		String sql="select * from t_category where pid is null order by orderBy";
		List<Map<String,Object>>mapList=qr.query(sql, new MapListHandler());
		return  toCategoryList(mapList) ;
	}
	

}
