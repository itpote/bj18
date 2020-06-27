<%@page import="com.yingyuan.model.Admin"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>网站后台管理</title>
		<link rel="stylesheet" type="text/css" href="../../static/layui/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="../../static/css/admin.css"/>
	</head>

	<body>
		<div class="layui-tab page-content-wrap">
		  <ul class="layui-tab-title">
		    <li class="layui-this">修改资料</li>
		    <li>修改密码</li>
		  </ul>
		  <div class="layui-tab-content">
		    <div class="layui-tab-item layui-show">
		    	<form action="${pageContext.request.contextPath}/updateziliao" class="layui-form"  style="width: 90%;padding-top: 20px;">
				  <div class="layui-form-item">
				    <label class="layui-form-label">ID：</label>
				    <div class="layui-input-block">
				      <input type="text" name="id" disabled autocomplete="off" class="layui-input layui-disabled" value="${sessionScope.Admin.id}">
				    </div>
				  </div>
				   <div class="layui-form-item">
				    <label class="layui-form-label">用户名：</label>
				    <div class="layui-input-block">
				      <input type="text" name="username" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" value="${sessionScope.Admin.username}">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">电话：</label>
				    <div class="layui-input-block">
				      <input type="text" name="phone" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" value="${sessionScope.Admin.phone}">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button id="submit1" onClick="updateziliao()" class="layui-btn layui-btn-normal" lay-submit lay-filter="adminInfo">立即提交</button>
				    </div>
				  </div>
				</form>
		    </div>
		    <div class="layui-tab-item">
		    	<form  action="${pageContext.request.contextPath}/updatePwd" class="layui-form" v style="width: 90%;padding-top: 20px;">
				  <div class="layui-form-item">
				    <label class="layui-form-label">用户名：</label>
				    <div class="layui-input-block">
				      <input type="text" name="username" disabled autocomplete="off" class="layui-input layui-disabled" value="${sessionScope.Admin.username}">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">旧密码：</label>
				    <div class="layui-input-block">
				      <input type="password" name="password1" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">新密码：</label>
				    <div class="layui-input-block">
				      <input type="password" name="password2" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">重复密码：</label>
				    <div class="layui-input-block">
				      <input type="password" name="password3" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button   class="layui-btn layui-btn-normal" lay-submit lay-filter="adminPassword">立即提交</button>
				    </div>
				  </div>
				</form>
		    </div>
		  </div>
		</div>
	<script src="../../static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
	<%
	String uPwdError=(String)request.getSession().getAttribute("pwdError");
	if(uPwdError!=null)
	{
	 %>
	 alert("原密码错误！");
	 <%
	 request.getSession().removeAttribute("pwdError");
	 }%>

	 function updateziliao(){
			alert("修改成功");
		 }
	 layui.use(['form','element'], function(){
		  var form = layui.form();
		  var element = layui.element();
		  form.render();})
		  
		  
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