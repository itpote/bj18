package com.yingyuan.model;

import java.util.Date;

public class Admin {
	private Integer id;
	
	private String username;
	
	
	private String password;
	
	private String phone;
	
	private Integer qx;
	
	private Integer isable;
	
	private String gmtTime;
	
	private String uptTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	
	
	



	public Integer getIsable() {
		return isable;
	}

	public void setIsable(Integer isable) {
		this.isable = isable;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	public Integer getQx() {
		return qx;
	}

	public void setQx(Integer qx) {
		this.qx = qx;
	}

	public String getGmtTime() {
		return gmtTime;
	}

	public void setGmtTime(String gmtTime) {
		this.gmtTime = gmtTime;
	}

	public String getUptTime() {
		return uptTime;
	}

	public void setUptTime(String uptTime) {
		this.uptTime = uptTime;
	}



	
	
	
}
