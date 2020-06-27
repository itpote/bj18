package com.yingyuan.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yingyuan.model.Admin;


@Repository("adminDao")
public interface AdminDao {
	public List<Admin> selectAdminByusernamepwd(Map map);
	
	Integer selectAdmintotal(Map map);
	
	void updatePassword(Admin admin);
	
	void insertAdmin(Admin admin);
	
	
}
