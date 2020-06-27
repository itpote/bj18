<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>商品管理系统</title>

<%
String path = request.getContextPath();
String basePath = request.getScheme
()+"://"+request.getServerName()+":"+request.getServerPort
()+path+"/";
%>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/style2.0.css">
<style type="text/css">
	#change:link{
	color:#2ec0f6;
	
	}
	#change:visited{
	color:#2ec0f6;
	}
	ul li{font-size: 30px;color:#2ec0f6;}
	.tyg-div{z-index:-1000;float:left;position:absolute;left:5%;top:20%;}
	.tyg-p{
		font-size: 14px;
	    font-family: 'microsoft yahei';
	    position: absolute;
	    top: 135px;
	    left: 60px;
	}
	.tyg-div-denglv{
		z-index:1000;float:right;position:absolute;right:6%;top:10%;
	}
	.tyg-div-form{
		background-color: #23305a;
		width:290px;
		height:auto;
		margin:120px auto 0 auto;
		color:#2ec0f6;
	}
	.tyg-div-form form {padding:15px;}
	.tyg-div-form form input[type="text"]{
		width: 220px;
	    height: 30px;
	    margin: 25px 10px 10px 0px;
	}
	.tyg-div-form form input[type="password"]{
		width: 220px;
	    height: 30px;
	    margin: 25px 10px 10px 0px;
	}
	.tyg-div-form form button {
	    cursor: pointer;
	    width: 260px;
	    height: 44px;
	    margin-top: 25px;
	    padding: 10px;
	    background: #2ec0f6;
	    -moz-border-radius: 6px;
	    -webkit-border-radius: 6px;
	    border-radius: 6px;
	    border: 1px solid #2ec0f6;
	    -moz-box-shadow:
	        0 15px 30px 0 rgba(255,255,255,.25) inset,
	        0 2px 7px 0 rgba(0,0,0,.2);
	    -webkit-box-shadow:
	        0 15px 30px 0 rgba(255,255,255,.25) inset,
	        0 2px 7px 0 rgba(0,0,0,.2);
	    box-shadow:
	        0 15px 30px 0 rgba(255,255,255,.25) inset,
	        0 2px 7px 0 rgba(0,0,0,.2);
	    font-family: 'PT Sans', Helvetica, Arial, sans-serif;
	    font-size: 14px;
	    font-weight: 700;
	    color: #fff;
	    text-shadow: 0 1px 2px rgba(0,0,0,.1);
	    -o-transition: all .2s;
	    -moz-transition: all .2s;
	    -webkit-transition: all .2s;
	    -ms-transition: all .2s;
}
#zhuce{
color:#fff;
}
</style>
<body>
<div class="tyg-div">
	<ul>
    	<li>让</li>
    	<li><div style="margin-left:20px;">购</div></li>
    	<li><div style="margin-left:40px;">物</div></li>
    	<li><div style="margin-left:60px;">给</div></li>
    	<li><div style="margin-left:80px;">你</div></li>
    	<li><div style="margin-left:100px;">快</div></li>
    	<li><div style="margin-left:120px;">乐</div></li>
    </ul>
</div> 
<div id="contPar" class="contPar">
	<div id="page1"  style="z-index:1;">
		<div class="title0">商品管理系统</div>
		<div class="imgGroug">
			<ul>
				<img alt="" class="img0 png" src="./static/img/page1_0.png">
				<img alt="" class="img1 png" src="./static/img/page1_1.png">
				<img alt="" class="img2 png" src="./static/img/page1_2.png">
			</ul>
		</div>
		<img alt="" class="img3 png" src="./static/img/page1_3.jpg">
	</div>
</div>
<div class="tyg-div-denglv">
	<div class="tyg-div-form">
		<form action="login">
			<h2>登录</h2>
			<div style="margin:5px 10px;">
				<input type="text" name="username" placeholder="请输入用户名..."/>
			</div>
			<div style="margin:5px 10px;">
				<input type="password" name="password" placeholder="请输入密码..."/>
			</div>

	
			<button type="submit" >登<span style="width:20px;"></span>录</button>
			<!--  <a href="<%=basePath %>admin/index/customerzhuce.jsp" id="zhuce">未有账号？点此注册</a>-->
		</form>
	</div>
</div>

<script type="text/javascript">

<%
String loginerror = (String)request.getAttribute("loginerror"); 
if("1".equals(loginerror))
{
 %>
 alert("用户名或密码错误");
 <%}else if("2".equals(loginerror)){%>
 alert("用户状态异常");
 <%}%>
 
 

 <%
	String zhuceSuccess=(String)request.getSession().getAttribute("zhuceSuccess");
	if("1".equals(zhuceSuccess))
	{
	 %>
	 alert("注册成功，请登录");
	 <%
	 request.getSession().removeAttribute("zhuceSuccess");
	 }%>
 <%
	String pwdSuccess=(String)request.getSession().getAttribute("pwdSuccess");
	if(pwdSuccess!=null)
	{
	 %>
	 alert("修改成功，请重新登录");
	 <%
	 request.getSession().removeAttribute("pwdSuccess");
	 }%>

	</script>
<script type="text/javascript" src="./static/js/jquery-1.8.0.min.js">


</script>
<script type="text/javascript" src="./static/js/com.js"></script>
<!--[if IE 6]>
<script language="javascript" type="text/javascript" src="./script/ie6_png.js"></script>
<script language="javascript" type="text/javascript">
DD_belatedPNG.fix(".png");
</script>
<![endif]-->


</body>
</html>