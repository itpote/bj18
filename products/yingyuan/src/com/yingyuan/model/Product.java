package com.yingyuan.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Product {
	private Integer id;
	
	private String name;
	
	private String mainactor;
	
	private String director;
	
	private String video;
	
	private String type;
	
	private String duration;
	
	private String description;
	
	private String image;
	
	private String isable;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date gmttime;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date upttime;
	
	private String status;
	
	private String speak;
	
	
	

	public String getIsable() {
		return isable;
	}

	public void setIsable(String isable) {
		this.isable = isable;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}



	public String getMainactor() {
		return mainactor;
	}

	public void setMainactor(String mainactor) {
		this.mainactor = mainactor;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSpeak() {
		return speak;
	}

	public void setSpeak(String speak) {
		this.speak = speak;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getGmttime() {
		return gmttime;
	}

	public void setGmttime(Date gmttime) {
		this.gmttime = gmttime;
	}

	public Date getUpttime() {
		return upttime;
	}

	public void setUpttime(Date upttime) {
		this.upttime = upttime;
	}



	
	
	
	
}
