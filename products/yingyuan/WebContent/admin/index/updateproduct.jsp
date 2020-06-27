<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
		<title>修改商品信息</title>
		<link rel="stylesheet" type="text/css" href="../../static/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="../../static/css/admin.css" />
	</head>

	<body>
	 <%
  	String movieid=request.getParameter("movieid");
    
  %>
  	
<div style="text-align:center;font-size:20px">修改商品信息</div>
			<form class="layui-form" style="width: 90%;padding-top: 20px;">
					
					<div class="layui-form-item">
						<label class="layui-form-label">商品名称：</label>
						<div class="layui-input-block">
							<input type="text" id="name" required lay-verify="required" placeholder="请输入商品名称" autocomplete="off" class="layui-input">
						</div>

					</div>
					<div class="layui-form-item">
					<label class="layui-form-label">商品图片：</label>
					<div class="row">
					<span><img id="thumburlShow" src="" width="120" height="120"/></span>
					
				     <input type="hidden" name="img"  id="thumbUrl"/>
				     <input type="file" name="logoFile" id="logoFile" onchange="setImg(this);">
				      </div> </div>
					<div class="layui-form-item">
						<label class="layui-form-label">商品编号：</label>
						<div class="layui-input-block">
							<input type="text" id="daoyan" required lay-verify="required" placeholder="请输入商品编号" autocomplete="off" class="layui-input">
						</div>

					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">进货单价：</label>
						<div class="layui-input-block">
							<input type="text" id="mainactor" required lay-verify="required" placeholder="请输入单价（元）如：10" autocomplete="off" class="layui-input">
						</div>

					</div>
					
	       		  <div class="layui-form-item">
    <label class="layui-form-label">商品类型：</label>
    <div class="layui-input-block">
      <input type="checkbox" name="like" value="家用电器类" title="家用电器类">
      <input type="checkbox" name="like" value="家具类" title="家具类">
      <input type="checkbox" name="like" value="图文类" title="图文类">
      <input type="checkbox" name="like" value="体育健身类" title="体育健身类">
      <input type="checkbox" name="like" value="妇女儿童类" title="妇女儿童类">
      <input type="checkbox" name="like" value="服装类" title="服装类">
      <input type="checkbox" name="like" value="食品类" title="食品类">
      <input type="checkbox" name="like" value="日用百货" title="日用百货">
      <input type="checkbox" name="like" value="进口类" title="进口类">
      <input type="checkbox" name="like" value="数码类" title="数码类">
      <input type="checkbox" name="like" value="化妆品类" title="化妆品类">
      <input type="checkbox" name="like" value="生鲜类" title="生鲜类">
      <input type="checkbox" name="like" value="其他" title="其他">
    </div>
  </div>
	    		
					<div class="layui-form-item">
						<label class="layui-form-label">商品数量：</label>
						<div class="layui-input-block">
							<input type="text" id="shichang" required lay-verify="required" placeholder="请输入数量如：10" autocomplete="off" class="layui-input">
						</div>

					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">售出单价：</label>
						<div class="layui-input-block">
							<input type="text" id="speak" required lay-verify="required" placeholder="请输入单价（元）如：10" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">描述：</label>
						<div class="layui-input-block">
							<textarea id="jianjie" placeholder="请输入商品描述" class="layui-textarea"></textarea>
						</div>
					</div>

					<div class="layui-form-item">
						<div class="layui-input-block">
							<button  class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">立即修改</button>
								</div>
					</div>
				</form>


		<script src="../../static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script>
			//Demo
			layui.use(['form'], function() {
				var form = layui.form();
				form.render();
				//监听提交
				form.on('submit(formDemo)', function(data) {

					var name=$("#name").val();
					
					var director=$("#daoyan").val();
					var mainactor=$("#mainactor").val();
					var duration=$("#shichang").val();
					var speak=$("#speak").val();
					var jianjie=$("#jianjie").val();
				 	var arr ="";
					var img=$("#thumburlShow").attr("src");
					
				      $("input:checkbox[name='like']:checked").each(function(i){
				                arr = arr+$(this).val()+",";
				            });
					
				 $.ajax({
					 contextType:"applicatin/json;charset=utf-8",
					 type:"post",
					 data:{id:movieId,isable:isable,status:status,name:name,director:director,mainactor:mainactor,duration:duration,speak:speak,jianjie:jianjie,arr:arr,img:img},
					 url:"<%=basePath %>updatemovie",
					 dataType:"json",
					 success:function(data){
						 alert("修改成功！");
						window.location.href="quanbuyingpianlist.jsp";
					 }
				})
					return false;
				});
			});
		</script>
	</body>

</html>
 <script src="../../static/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

function setImg(obj){//用于进行图片上传，返回地址
    var f=$(obj).val();
    if(f == null || f ==undefined || f == ''){
        return false;
    }
    if(!/\.(?:png|jpg|bmp|gif|PNG|JPG|BMP|GIF)$/.test(f))
    {
        alertLayel("类型必须是图片(.png|jpg|bmp|gif|PNG|JPG|BMP|GIF)");
        $(obj).val('');
        return false;
    }
    var data = new FormData();
    $.each($(obj)[0].files,function(i,file){
        data.append('file', file);
    });
    $.ajax({
        type: "POST",
        url: "<%=basePath%>uploadimg",
        data: data,
        cache: false,
        contentType: false,    //不可缺
        processData: false,    //不可缺
        dataType:"json",
        success: function(suc) {
           
            if(suc.code==0){
                    $("#thumbUrl").val(suc.msg);//将地址存储好
                    $("#thumburlShow").attr("src",suc.msg); //显示图片                                                              
                }else{
                alertLayel("上传失败");
                $("#url").val("");
                $(obj).val('');
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            alertLayel("上传失败，请检查网络后重试");
            $("#url").val("");
            $(obj).val('');
        }
    });
}

var movieId;
var isable;
var status;
	$(function(){
		
		$.ajax({
			 contextType:"applicatin/json;charset=utf-8",
			 type:"post",
			 data:{movieid:<%= movieid%>},
			 url:"<%=basePath %>movielist6",
			 dataType:"json",
			 success:function(data){
				 $("#name").val(data.movie.name);
				 $("#daoyan").val(data.movie.director);
				 $("#mainactor").val(data.movie.mainactor);
				 $("#shichang").val(data.movie.duration);
				 $("#speak").val(data.movie.speak);
				 $("#jianjie").val(data.movie.description);
				 $("#thumburlShow").attr("src",data.movie.image);
				 movieId=data.movie.id;
				 isable=data.movie.isable;
				 status=data.movie.status;
				  $("input:checkbox[name='like']").each(function(i){
					 					if((data.movie.type).indexOf($(this).val())>=0){
						               $(this).attr('checked', true);
					 					}
						            });
				 form.render();
			 }
		})

		})
		
		
		
			
</script>
	</body>

</html>