package com.yingyuan.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yingyuan.model.Admin;
import com.yingyuan.service.AdminService;

import utils.DateUtils;
import utils.JacksonUtils;

@Controller
public class MainController {
	@Autowired
	private AdminService adminservice;

	
	//管理员列表
	@RequestMapping("/adminlist")
	public @ResponseBody String adminlist(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String pageNum=(request.getParameter("pageNum")!= null) ? request.getParameter("pageNum") : "1";
		String pageSize=(request.getParameter("pageSize")!= null) ? request.getParameter("pageSize") : "10";
		String phone=request.getParameter("phone");
		Integer pageNo=(Integer.valueOf(pageNum)-1)*Integer.valueOf(pageSize);
		Map map=new HashMap<>();
		map.put("pageNum",pageNo.toString());
		map.put("pageSize",pageSize);
		map.put("phone",phone);
		List<Admin> list=adminservice.selectAdminByusernamepwd(map);
		Integer total=adminservice.selectAdmintotal(map);
		Map resultMap=new HashMap<>();
		int pageSizes=Integer.valueOf(pageSize);
		Integer pages=0;
		if(total<pageSizes){
			pages=1;
		}else{
			 pages=(total%pageSizes) == 0 ? (total/pageSizes) : (total/pageSizes)+1;
		}
		
		resultMap.put("list",list);
		resultMap.put("total",total.toString());
		resultMap.put("curPage",pageNum);
		resultMap.put("pages", pages.toString());
		return JacksonUtils.mapToJson(resultMap);
		
	}
	@RequestMapping("/updatestatus")
	public @ResponseBody String updatestatus(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String id=request.getParameter("id");
		Map map=new HashMap<>();
		map.put("id", id);
		List<Admin> adminlist=adminservice.selectAdminByusernamepwd(map);
		Admin admin=adminlist.get(0);
		Map resultmap=new HashMap<>();
		if(((Admin)request.getSession().getAttribute("Admin")).getQx()>admin.getQx()){
			if(admin.getIsable()==0){
				admin.setIsable(1);
			}else if(admin.getIsable()==1){
				admin.setIsable(0);
			}
			System.out.println(admin.getIsable());
			adminservice.updatePassword(admin);
			resultmap.put("error", 0);
		}else{
			resultmap.put("error", 1);
		}
		return JacksonUtils.mapToJson(resultmap);
	}
	
	@RequestMapping("/insertAdmin")
	public @ResponseBody String insertAdmin(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String username=request.getParameter("username");
		String phone=request.getParameter("phone");
		Map map=new HashMap<>();
		map.put("phone", phone);
		List<Admin> adminlist=adminservice.selectAdminByusernamepwd(map);
		Map resultMap=new HashMap<>(); 
		if(adminlist.size()==0){
		Integer qx=Integer.valueOf(request.getParameter("qx"));
		Admin admin=new Admin();
		admin.setGmtTime(DateUtils.nowDate(DateUtils.YYYY_MM_DD_HH_MM_SS));
		admin.setUptTime(DateUtils.nowDate(DateUtils.YYYY_MM_DD_HH_MM_SS));
		admin.setIsable(1);
		admin.setPassword("123456");
		admin.setQx(qx);
		admin.setPhone(phone);
		admin.setUsername(username);
		adminservice.insertAdmin(admin);
		resultMap.put("addsuccess", "1");
		}else{
			resultMap.put("addsuccess", "0");
			}
		return JacksonUtils.mapToJson(resultMap);
	}
	
	}
