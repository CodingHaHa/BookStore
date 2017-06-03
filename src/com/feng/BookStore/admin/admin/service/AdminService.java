package com.feng.BookStore.admin.admin.service;

import java.sql.SQLException;

import javax.management.RuntimeErrorException;

import com.feng.BookStore.admin.admin.dao.AdminDao;
import com.feng.BookStore.admin.admin.domain.Admin;


public class AdminService {
	private AdminDao adminDao=new AdminDao();
	
	/**
	 * 管理员登录
	 * @param admin
	 * @return
	 */
	public Admin login(Admin admin){
		try {
			return adminDao.find(admin.getAdminname(), admin.getAdminpwd());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
