package com.yingyuan.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yingyuan.model.Admin;
import com.yingyuan.model.Product;
import com.yingyuan.service.AdminService;
import com.yingyuan.service.ProductService;

import utils.DateUtils;
import utils.JacksonUtils;

@Controller
public class ProductController {
	@Autowired
	private AdminService adminservice;
	@Autowired
	private ProductService movieservice;
	
	
	@RequestMapping("/movielist")
	public @ResponseBody String movielist(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		Map map=new HashMap<>();
		map.put("isable","1");
		List<Product> list=movieservice.selectMovie(map);
		Map resultMap=new HashMap<>();
		resultMap.put("list",list);
		return JacksonUtils.mapToJson(resultMap);
		
	}
	@RequestMapping("/movielist2")
	public @ResponseBody String movielist2(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		Map map=new HashMap<>();
		map.put("isable","1");
		map.put("status","0");
		List<Product> list1=movieservice.selectMovie(map);
		map.remove("status");
		map.put("status","1");
		List<Product> list2=movieservice.selectMovie(map);
		Map resultMap=new HashMap<>();
		resultMap.put("listwei",list1);
		resultMap.put("listing",list2);
		return JacksonUtils.mapToJson(resultMap);
		
	}

	@RequestMapping("/movielist4")
	public @ResponseBody String movielist4(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String movieid=request.getParameter("movieid");
		Map resultMap=new HashMap<>();
		resultMap.put("movieid",movieid);
		return JacksonUtils.mapToJson(resultMap);
		
	}
	
	
	
	@RequestMapping("/uploadimg")
    public @ResponseBody String uploadPicture(@RequestParam(value="file",required=false)MultipartFile file,
    HttpServletRequest request){
	    File targetFile=null;
        String msg="";//返回存储路径

        Map resultMap=new HashMap<>();
        String fileName=file.getOriginalFilename();//获取文件名加后缀
        if(fileName!=null&&fileName!=""){   
            String returnUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() +"/static/upload/images";//存储路径
            String path = request.getSession().getServletContext().getRealPath("static/upload/images"); //文件存储位置
            String fileF = fileName.substring(fileName.lastIndexOf("."), fileName.length());//文件后缀
            fileName=new Date().getTime()+"_"+new Random().nextInt(1000)+fileF;//新的文件名

         
            File file1 =new File(path); 
            //如果文件夹不存在则创建    
            if(!file1 .exists()  && !file1 .isDirectory()){       
                file1 .mkdir();  
            }
            targetFile = new File(file1, fileName);
//          targetFile = new File(path, fileName);
        
            try {
            
                file.transferTo(targetFile);
//              msg=returnUrl+fileName;
                msg=returnUrl+"/"+fileName;
               resultMap.put("code","0");
               resultMap.put("msg", msg);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return JacksonUtils.mapToJson(resultMap);
    }

	
	@RequestMapping("/quanbumovielist")
	public @ResponseBody String quanbumovielist(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String name=request.getParameter("name");
		String status=request.getParameter("status");
		String lurutime=request.getParameter("lurutime");
		String type=request.getParameter("type");
		Map map=new HashMap<>();
		map.put("name", name);
		map.put("status", status);
		map.put("type", type);
		map.put("isable",1);
		if(lurutime.length()>25){
			
		}else{
		String gmttime1=lurutime.substring(0,10);
		String gmttime2=lurutime.substring(13,lurutime.length());
		map.put("gmttime1", gmttime1);
		map.put("gmttime2", gmttime2);
		}
		String pageNum=(request.getParameter("pageNum")!= null) ? request.getParameter("pageNum") : "1";
		String pageSize=(request.getParameter("pageSize")!= null) ? request.getParameter("pageSize") : "10";
		Integer pageNo=(Integer.valueOf(pageNum)-1)*Integer.valueOf(pageSize);
		map.put("pageNum",pageNo.toString());
		map.put("pageSize",pageSize);
		List<Product> list=movieservice.selectMovie(map);
		Integer total=movieservice.selectMovietotal(map);
		Map resultMap=new HashMap<>();
		Integer pages=0;
		int pageSizes=Integer.valueOf(pageSize);
		if(total<pageSizes){
			pages=1;
		}else{
			 pages=(total%pageSizes) == 0 ? (total/pageSizes) : (total/pageSizes)+1;
		}
		resultMap.put("list",list);
		resultMap.put("total",total.toString());
		resultMap.put("curPage",pageNum);
		resultMap.put("pages",pages);
		return JacksonUtils.mapToJson(resultMap);
		
	}
	@RequestMapping("/deletemovie")
	public @ResponseBody String deletemovie(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String movieid=request.getParameter("movieid");
		Map map=new HashMap<>();
		map.put("id", movieid);
		List<Product> list=movieservice.selectMovie(map);
		Product movie=list.get(0);
		//执行逻辑删除
		movie.setIsable("0");
		movieservice.updatemovie(movie);
		Map resultMap=new HashMap<>();
		resultMap.put("movie", movie);
		return JacksonUtils.mapToJson(resultMap);
		
	}
	
	@RequestMapping("/movielist6")
	public @ResponseBody String movielist6(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String movieid=request.getParameter("movieid");
		Map map=new HashMap<>();
		map.put("id", movieid);
		List<Product> list=movieservice.selectMovie(map);
		Map resultMap=new HashMap<>();
		resultMap.put("movie",list.get(0));
		return JacksonUtils.mapToJson(resultMap);
		
	}
	@RequestMapping("/insertmovie")
	public @ResponseBody String insertmovie(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String name=request.getParameter("name");
		String director=request.getParameter("director");
		String mainactor=request.getParameter("mainactor");
		String duration=request.getParameter("duration");
		String speak=request.getParameter("speak");
		String jianjie=request.getParameter("jianjie");
		String arr=request.getParameter("arr");
		String img=request.getParameter("img");
		Product movie=new Product();
		movie.setDescription(jianjie);
		if(!"".equals(arr)){
			arr=arr.substring(0, arr.length()-1);
		}
		movie.setDirector(director);
		movie.setDuration(duration);
		movie.setGmttime(new Date());
		movie.setImage(img);
		movie.setIsable("1");
		movie.setName(name);
		movie.setMainactor(mainactor);
		movie.setSpeak(speak);
		movie.setStatus("0");
		movie.setType(arr);
		movie.setUpttime(new Date());
		movieservice.insertmovie(movie);
		Map resultMap=new HashMap<>();
		resultMap.put("success", 1);
		return JacksonUtils.mapToJson(resultMap);
		
	}
	@RequestMapping("/updatemovie")
	public @ResponseBody String updatemovie(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String director=request.getParameter("director");
		String mainactor=request.getParameter("mainactor");
		String duration=request.getParameter("duration");
		String speak=request.getParameter("speak");
		String jianjie=request.getParameter("jianjie");
		String arr=request.getParameter("arr");
		String img=request.getParameter("img");
		String isable=request.getParameter("isable");
		String status=request.getParameter("status");
		Product movie=new Product();
		movie.setDescription(jianjie);
		if(!"".equals(arr)){
			arr=arr.substring(0, arr.length()-1);
		}
		movie.setId(Integer.valueOf(id));
		movie.setDirector(director);
		movie.setDuration(duration);
		movie.setGmttime(new Date());
		movie.setImage(img);
		movie.setIsable(isable);
		movie.setName(name);
		movie.setMainactor(mainactor);
		movie.setSpeak(speak);
		movie.setStatus(status);
		movie.setType(arr);
		movie.setUpttime(new Date());
		movieservice.updatemovie(movie);
		Map resultMap=new HashMap<>();
		resultMap.put("success", 1);
		return JacksonUtils.mapToJson(resultMap);
		
	}
	@RequestMapping("/updatestatusmovie")
	public @ResponseBody String updatestatusmovie(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String movieid=request.getParameter("movieid");
		Map map=new HashMap<>();
		map.put("id", movieid);
		List<Product> list=movieservice.selectMovie(map);
		Product movie=list.get(0);
		if("0".equals(movie.getStatus())){
			movie.setStatus("1");
		}else if("1".equals(movie.getStatus())){
			movie.setStatus("2");
		}
		movieservice.updatemovie(movie);
		Map resultMap=new HashMap<>();
		resultMap.put("movie", movie);
		return JacksonUtils.mapToJson(resultMap);
		
	}
	
	}
