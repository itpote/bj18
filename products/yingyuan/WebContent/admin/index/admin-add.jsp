<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%
String path = request.getContextPath();
String basePath = request.getScheme
()+"://"+request.getServerName()+":"+request.getServerPort
()+path+"/";
%>
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
	<form class="layui-form column-content-detail" action="<%=basePath %>insertAdmin">
					<div class="layui-tab">
						<ul class="layui-tab-title">
							<li class="layui-this">添加管理员</li>
						</ul>
						<div class="layui-tab-content">
							<div class="layui-tab-item layui-show">
									<div class="layui-form-item">
									<label class="layui-form-label">用户名：</label>
									<div class="layui-input-block">
										<input type="text" id="username" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
									</div>
								</div>
									<div class="layui-form-item">
									<label class="layui-form-label">电话：</label>
									<div class="layui-input-block">
										<input type="text" id="phone" required lay-verify="required" placeholder="请输入电话" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
												   <label class="layui-form-label">密码：</label>
							    <div class="layui-input-block">
							      <input type="text" id="password" disabled autocomplete="off" class="layui-input layui-disabled" value="123456">
							    </div>
							   </div>
							<div class="layui-form-item">
									<label class="layui-form-label">类别：</label>
									<div class="layui-input-block">
										<select id="qx" lay-verify="required">
											<option value="">请选择管理员分类</option>
												<option value="0">普通管理员</option>
												<option value="1">超级管理员</option>
										</select>
									</div>
								</div>
							
							</div>
						</div>
					</div>
					<div class="layui-form-item" style="padding-left: 10px;">
						<div class="layui-input-block">
							<button class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">立即提交</button>
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</form>
	<script src="../../static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="../../static/js/common.js" type="text/javascript" charset="utf-8"></script>
	<script src="../../static/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		
	<script>
	layui.use(['form','layer'], function(){
        $ = layui.jquery;
      var form = layui.form()
      ,layer = layui.layer;
    
      //自定义验证规则
      // form.verify({
      //   nikename: function(value){
      //     if(value.length < 5){
      //       return '昵称至少得5个字符啊';
      //     }
      //   }
      //   ,pass: [/(.+){6,12}$/, '密码必须6到12位']
      //   ,repass: function(value){
      //       if($('#L_pass').val()!=$('#L_repass').val()){
      //           return '两次密码不一致';
      //       }
      //   }
      // });
      //监听提交
      form.on('submit(formDemo)', function(){
    	  layer.msg('确定要保存么？', {
    			time: 0 //不自动关闭
    			,btn: ['确定', '取消']
    			,yes:function(){
 				$.ajax({
				 contextType:"applicatin/json;charset=utf-8",
				 type:"post",
				 data:{username:$("#username").val(),phone:$("#phone").val(),password:$("#password").val(),qx:$("#qx").val()},
				 url:"<%=basePath %>insertAdmin",
				 dataType:"json",
				 success:function(data){
					 if(data.addsuccess==1){
						 layer.alert("添加成功", {icon: 6},function () {
					            // 获得frame索引
					            var index = parent.layer.getFrameIndex(window.name);
					            //关闭当前frame
					            parent.layer.close(index);
					            window.parent.frames["right"].location.reload();
					        });
						 }else if(data.addsuccess==0){
							 layer.alert("该手机号已添加", {icon: 7},function () {
						            // 获得frame索引
						            var index = parent.layer.getFrameIndex(window.name);
						            //关闭当前frame
						            parent.layer.close(index);
						        });
							 }
					 }
 				});
    			}
    	  });
 				  return false;
      });
	 });
      
	</script>
	</body>
</html>