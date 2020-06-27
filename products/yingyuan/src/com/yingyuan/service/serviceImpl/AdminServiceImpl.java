package com.yingyuan.service.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yingyuan.dao.AdminDao;
import com.yingyuan.model.Admin;
import com.yingyuan.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao adminDao;

	@Override
	public List<Admin> selectAdminByusernamepwd(Map map) {
		// TODO Auto-generated method stub
		return adminDao.selectAdminByusernamepwd(map);
	}

	@Override
	public void updatePassword(Admin admin) {
		// TODO Auto-generated method stub
		 adminDao.updatePassword(admin);
	}

	@Override
	public Integer selectAdmintotal(Map map) {
		// TODO Auto-generated method stub
		return adminDao.selectAdmintotal(map);
	}

	@Override
	public void insertAdmin(Admin admin) {
		// TODO Auto-generated method stub
		 adminDao.insertAdmin(admin);
		
	}

	
	

}
