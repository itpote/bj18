package com.yingyuan.service;

import java.util.List;
import java.util.Map;

import com.yingyuan.model.Admin;


public interface AdminService {
	public List<Admin> selectAdminByusernamepwd(Map map);
	
	Integer selectAdmintotal(Map map);
	
	void updatePassword(Admin admin);
	
	void insertAdmin(Admin admin);
	

}
