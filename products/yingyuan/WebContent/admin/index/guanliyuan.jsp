<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="iframe-h">
<%
String path = request.getContextPath();
String basePath = request.getScheme
()+"://"+request.getServerName()+":"+request.getServerPort
()+path+"/";
%>
	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>网站后台管理</title>
		<link rel="stylesheet" type="text/css" href="../../static/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="../../static/css/admin.css" />
		<link rel="stylesheet" type="text/css" href="../../static/css/amazeui.min.css" />
		 <link rel="stylesheet" href="../../static/css/myPagination.css">
    	<script src="../../static/js/myPagination.js"></script>
	
		
	</head>

	<body>
		<div class="page-content-wrap">
		<div>
        <div>
          <strong class="am-text-primary am-text-lg">管理员列表</strong> 
        </div>
      </div>
        <hr>
		<div class="wrap-container clearfix">
				<div class="column-content-detail">
					<form class="layui-form">
						<div class="layui-form-item">
							<div class="layui-inline tool-btn">
								<button class="layui-btn layui-btn-small layui-btn-normal addBtn" data-url="admin-add.jsp"><i class="layui-icon">添加管理员</i></button>
								</div>
						</div>
					</form>
					<div class="layui-form" id="table-list">
						<table class="layui-table" lay-even lay-skin="nob">
							<colgroup>
								<col width="50">
								<col class="hidden-xs" width="50">
								<col class="hidden-xs" width="100">
								<col>
								<col class="hidden-xs" width="150">
								<col class="hidden-xs" width="150">
								<col width="150">
								<col width="150">
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose"></th>
									<th class="hidden-xs">ID</th>
									<th class="hidden-xs">用户名</th>
									<th class="hidden-xs">电话</th>
									<th class="hidden-xs">创建时间</th>
									<th class="hidden-xs">最近一次登录时间</th>
									<th class="hidden-xs">权限</th>
									<th class="hidden-xs">状态</th>
									<th class="hidden-xs">操作</th>
								</tr>
							</thead>
							<tbody id="databox">
				
							</tbody>
						</table>
					<div id="pagination" class="pagination1"></div>
					</div>
				</div>
		</div>
		<script src="../../static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../static/js/common.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../static/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		
		<script type="text/javascript">
		var curPage;
		
		var total;

		var phone;

		var databox=$("#databox");

		

		$(function(){
		   	sendPageAjax(1,10,phone);
		
		
		
		    
		});
		
		function sendPageAjax(pageNum,pageSize,phone){
			 $.ajax({
				 contextType:"applicatin/json;charset=utf-8",
				 type:"post",
				 data:{pageNum:pageNum,pageSize:pageSize,phone:phone},
				 url:"<%=basePath %>adminlist",
				 dataType:"json",
				 success:function(data){
					total=data.total;
					curPage=data.curPage;
					 new myPagination({
					        id: 'pagination',
					        curPage:curPage, //初始页码
					        pageTotal: data.pages, //总页数
							pageAmount: 10,  //每页多少条
					        dataTotal: total, //总共多少条数据
							pageSize: 5, //可选,分页个数
					        showPageTotalFlag:true, //是否显示数据统计
					        showSkipInputFlag:true, //是否支持跳转
					        getPage: function (page) {
					        	sendPageAjax(page,10,phone);
					        }
					    })
					databox.empty();
					for(i in data.list){
						var item=data.list[i];
						var tr="<tr><td><input type='checkbox' lay-skin='primary' data-id='1'></td><td class='hidden-xs'>"+item.id+"</td>"
						+"<td class='hidden-xs'>"+item.username+"</td>"
						+"<td class='hidden-xs'>"+item.phone+"</td>"
						+"<td class='hidden-xs'>"+item.gmtTime+"</td>"
						+"<td class='hidden-xs'>"+item.uptTime+"</td>";
						if(item.qx==1){
							tr=tr+"<td class='hidden-xs'>"+"超级管理员"+"</td>";
							}else if(item.qx==0){
								tr=tr+"<td class='hidden-xs'>"+"普通管理员"+"</td>";
								}
						if(item.isable==1){
							tr=tr+"<td id='isable"+item.id+"' class='hidden-xs'>"+"正常"+"</td>";
							}else if(item.isable==0){
								tr=tr+"<td id='isable"+item.id+"' class='hidden-xs'>"+"禁用"+"</td>";
								}
						tr=tr+"<td>";
						if(item.isable==1){
							tr=tr+"<button id='button"+item.id+"' class='layui-btn layui-btn-small layui-btn-danger'  onclick='updatestatus("+item.id+")'><i class='layui-icon' id='status"+item.id+"'>禁用</i></button>";
							}else if(item.isable==0){
								tr=tr+"<button id='button"+item.id+"' class='layui-btn layui-btn-small layui-btn-normal' onclick='updatestatus("+item.id+")'><i class='layui-icon' id='status"+item.id+"'>启用</i></button>";
									}
						tr=tr+"</td></tr>";
						           databox.append(tr);
						  
						            }
					
					
						
			 }
				 
			 })
		 }
		 function updatestatus(id){
			 $.ajax({
				 contextType:"applicatin/json;charset=utf-8",
				 type:"post",
				 data:{id:id},
				 url:"<%=basePath %>updatestatus",
				 dataType:"json",
				 success:function(data){
					 if(data.error==1)
						alert("您无权操作！");
					 else{
					 document.getElementById("status"+id).innerHTML=(document.getElementById("status"+id).innerHTML=='禁用'?'启用':'禁用');
					 document.getElementById("isable"+id).innerHTML=(document.getElementById("isable"+id).innerHTML=='禁用'?'启用':'禁用');


						if($("#button"+id).hasClass("layui-btn-danger")){
							$("#button"+id).removeClass("layui-btn-danger")
							$("#button"+id).addClass("layui-btn-normal")
							
						}
					else if($("#button"+id).hasClass("layui-btn-normal")){
						$("#button"+id).removeClass("layui-btn-normal")
						$("#button"+id).addClass("layui-btn-danger")
						
						}
					
					 }
				 }
			 })
			
			 }

		</script>
	</body>

</html>