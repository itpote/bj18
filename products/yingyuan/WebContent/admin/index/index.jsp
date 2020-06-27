<%@page import="com.yingyuan.model.Admin"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>商品管理系统首页</title>
		<link rel="stylesheet" type="text/css" href="../../static/layui/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="../../static/css/admin.css"/>
		<script src="../../static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../static/js/main.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../static/js/common.js" type="text/javascript" charset="utf-8"></script>
	</head>
		<div class="main-layout" id="main-layout" style="height:690px">
			<!--侧边栏-->
			<div  class="main-layout-side" style="height:690px">
				<div class="m-logo">
				</div>
				<ul class="layui-nav layui-nav-tree layui-bg-cyan layui-inline" lay-filter="leftNav">
			
				  <li class="layui-nav-item">
				    <a href="javascript:;"><i class="iconfont">&#xe604;</i>商品管理</a>
				    <dl class="layui-nav-child">
				      <dd><a href="quanbuyingpianlist.jsp" target="right"><span class="l-line"></span>全部商品列表</a></dd>
				       <dd><a href="uploadproduct.jsp" target="right"><span class="l-line"></span>添加商品</a></dd>
				     
				    </dl>
				  </li>
				
				    <li class="layui-nav-item">
				    <a href="javascript:;"><i class="iconfont">&#xe606;</i>管理员管理</a>
				     <dl class="layui-nav-child">
				      <dd><a href="guanliyuan.jsp" target="right"><span class="l-line"></span>管理员列表</a></dd>
			    </dl>
				  </li>
				</ul>
			</div>
			<!--右侧内容-->
			<div class="main-layout-container" style="height:690px">
			<ul class="layui-nav layui-bg-cyan">
				  <li class="layui-nav-item" style="float: right"><a  href="${pageContext.request.contextPath}/loginout" >退出</a></li>
				  <li class="layui-nav-item layui-this" style="float: right">
				  <a href=""><img src="" class="layui-nav-img">当前用户：${sessionScope.Admin.username}</a>
					    <dl class="layui-nav-child">
					      <dd><a href="admin-info.jsp">修改信息</a></dd>
					    </dl>
					  </li>
					  <li class="layui-nav-item" style="float: right"><a  href="${pageContext.request.contextPath}/shuaxinindex" >主页</a></li>
					  <li class="layui-nav-item" id="hideBtn">
						<a  href="javascript:;">
							<span class="iconfont">&#xe60e;</span>
						</a>
					  </li>
					  	<!--头部-->
				
					</ul>


			
				<!--主体内容-->
			<div class="main-layout-body">
					    	<!--1-->
					    	<iframe src="welcome.jsp" width="100%" height="100%" name="right"  class="iframe" framborder="0"></iframe>
					    	<!--1end-->
			</div>
			</div>
			<!--遮罩-->
			<div class="main-mask">
				
			</div>
			
		</div>
		 <script src="../../static/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		
		<script type="text/javascript">
			<% 
				Admin admin=(Admin)request.getSession().getAttribute("Admin");
				String contextpath=request.getContextPath();
				if(admin==null){
					response.sendRedirect(contextpath+"/login.jsp");
				}
				%>
			
		</script>
	</body>
</html>
