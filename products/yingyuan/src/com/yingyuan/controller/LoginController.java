package com.yingyuan.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yingyuan.model.Admin;
import com.yingyuan.service.AdminService;


import utils.DateUtils;
import utils.JacksonUtils;

@Controller
public class LoginController {
	@Autowired
	private AdminService adminservice;

	
	
	
	
	@RequestMapping("/login")
	public void login(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String contextPath=request.getContextPath();
			Map map=new HashMap<>();
			map.put("username",username);
			map.put("password",password);
			map.put("isable",1);
			List<Admin> list=adminservice.selectAdminByusernamepwd(map);
			if(list.size()==1){
				Admin admin=list.get(0);
				admin.setUptTime(DateUtils.nowDate(DateUtils.YYYY_MM_DD_HH_MM_SS));
				adminservice.updatePassword(admin);
				request.getSession().setAttribute("Admin", admin);
				response.sendRedirect(contextPath+"/admin/index/index.jsp");
			}else{
				map.remove("isable");
				List<Admin> list2=adminservice.selectAdminByusernamepwd(map);
				if(list2.size()==1){
					request.setAttribute("loginerror", "2");
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}else{
				request.setAttribute("loginerror", "1");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
				}
			}
	
	
		
	}
	@RequestMapping("/shuaxinindex")
	public void shuaxinindex(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
			String contextPath=request.getContextPath();
			request.getSession().removeAttribute("index");
			response.sendRedirect(contextPath+"/admin/index/index.jsp");
	
		
	}
	@RequestMapping("/loginout")
	public void loginout(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
			String contextPath=request.getContextPath();
			request.getSession().removeAttribute("username");
			request.getSession().removeAttribute("index");
			response.sendRedirect(contextPath+"/login.jsp");
		
	}
	@RequestMapping("/updatePwd")
	public void updatePwd(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
			String contextPath=request.getContextPath();
			String password1=request.getParameter("password1");
			String password2=request.getParameter("password2");
			Admin admin=(Admin)request.getSession().getAttribute("Admin");
			String password=admin.getPassword();
			if(password.equals(password1)){
				admin.setPassword(password2);
				request.getSession().setAttribute("pwdSuccess", "");
				response.sendRedirect(contextPath+"/login.jsp");
				adminservice.updatePassword(admin);
			}else{
			request.getSession().setAttribute("pwdError", "");
			response.sendRedirect(contextPath+"/admin/index/admin-info.jsp");
			}
	}
	@RequestMapping("/updateziliao")
	public void updateziliao(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
			String contextPath=request.getContextPath();
			String username=request.getParameter("username");
			String phone=request.getParameter("phone");
			Admin admin=(Admin)request.getSession().getAttribute("Admin");
			admin.setPhone(phone);
			admin.setUsername(username);
			response.sendRedirect(contextPath+"/admin/index/index.jsp");
			adminservice.updatePassword(admin);	
	}
	
}
