<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
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
		<title>全部商品列表</title>
		<link rel="stylesheet" type="text/css" href="../../static/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="../../static/css/admin.css" />
		<link rel="stylesheet" type="text/css" href="../../static/css/amazeui.min.css" />
		<link rel="stylesheet" href="../../static/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/font-awesome/4.6.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="../../static/css/daterangepicker.css">
		<link rel="stylesheet" href="../../static/css/myPagination.css">
    	<script src="../../static/js/myPagination.js"></script>
	
		
	</head>

	<body>
		<div class="page-content-wrap">
		 <div>
        <div>
          <strong class="am-text-primary am-text-lg">全部商品列表</strong> 
        </div>
      </div>
        <hr>
				<form  action="">
			<input id="phone1" style="width: 150px;height:30px;display:none" type="text" name="title" required  lay-verify="required" placeholder="请输入电话" autocomplete="off">
			
    		<label style="height: 30px;">商品名称：</label>
      		<input id="name1" style="width: 150px;height:30px;" type="text" name="title"  placeholder="请输入商品名称" autocomplete="off">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<label style="height: 35px;text-align: center">录入时间：<button type="button" style="margin-top:-8px" class="btn btn-default pull-right" id="daterange-btn">
				<span>
				  <i class="fa fa-calendar"></i> 日期选择
				</span>
				<i class="fa fa-caret-down"></i>
			  </button>	</label>
			  
      			&nbsp;&nbsp;&nbsp;&nbsp;
      			<label style="height: 30px;">商品类型：</label>
      			<select id="type" style="width: 150px;height:30px;">
      				<option value="">全部</option>
      				<option value="家用电器类">家用电器类</option>
      				<option value="家具类">家具类</option>
      				<option value="图文类">图文类</option>
      				<option value="体育健身类">体育健身类</option>
      				<option value="妇女儿童类">妇女儿童类</option>
      				<option value="服装类">服装类</option>
      				<option value="食品类">食品类</option>
      				<option value="日用百货">日用百货</option>
      				<option value="进口类">进口类</option>
      				<option value="数码类">数码类</option>
      				<option value="化妆品类">化妆品类</option>
      				<option value="生鲜类">生鲜类</option>
      				<option value="其他">其他</option>
      			</select>
      		<!--  <input id="type" style="width: 150px;height:30px;" type="text" name="title"  placeholder="请输入影片类型" autocomplete="off">-->
			&nbsp;&nbsp;&nbsp;&nbsp;
      			<label style="height: 30px;">状态：</label>
      			<select id="status" style="width: 150px;height:30px;">
      				<option value="">全部</option>
      				<option value="0">正在热卖</option>
      				<option value="1">优惠商品</option>
      				<option value="2">已下架</option>
      			</select>
			  <div class="layui-inline tool-btn">
							<button id="search" class="layui-btn layui-btn-normal" lay-submit="search">搜索</button></div>
						</div>
				</form>
				<div class="layui-form" id="table-list">
					<table class="layui-table" lay-even lay-skin="nob">
						<colgroup>
							<col width="50">
							<col class="hidden-xs" width="100">
							<col class="hidden-xs" width="160">
							<col width="100">
							<col width="180">
							<col class="hidden-xs" width="170">
							<col width="180">
							<col width="150">
							<col class="hidden-xs" width="140">
							<col class="hidden-xs" width="200">
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose"></th>
								<th class="hidden-xs">ID</th>
								<th>商品名称</th>
								<th>商品编号</th>
								<th>进货单价</th>
								<th>类型</th>
								<th>售出单价</th>
								<th>商品数量</th>
								<th>商品状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="databox">
							
						</tbody>
					</table>
					<div id="pagination" class="pagination1"></div>
				</div>
		</div>
		<script src="../../static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../static/js/common.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../static/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script>
		var lurutime=$('#daterange-btn span').html();
		var name1=$('#name1').val();
		var type=$('#type').val();
		var status=$('#status').val();
		var databox=$("#databox");
		$(function(){
		
		   	sendPageAjax(1,10,name1,status,lurutime,type);
		
		
		
		    
		});

		$("#search").off().on('click',function(){
		
			var lurutime=$('#daterange-btn span').html();
			var name1=$('#name1').val();
			var type=$('#type').val();
			var status=$('#status').val();
			sendPageAjax(1,10,name1,status,lurutime,type);
			
		})
		function sendPageAjax(pageNum,pageSize,name1,status,lurutime,type){
			 $.ajax({
				 contextType:"applicatin/json;charset=utf-8",
				 type:"post",
				 data:{pageNum:pageNum,pageSize:pageSize,name:name1,status:status,lurutime:lurutime,type:type},
				 url:"<%=basePath %>quanbumovielist",
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
					        	sendPageAjax(page,10,name1,status,lurutime,type);
					        }
					    })
					databox.empty();
					for(i in data.list){
						var item=data.list[i];
						var tr="<tr><td><input type='checkbox' lay-skin='primary' data-id='1'></td><td class='hidden-xs'>"+item.id+"</td>"
						+"<td class='hidden-xs'>"+item.name+"</td>"
						+"<td class='hidden-xs'>"+item.director+"</td>"
						+"<td class='hidden-xs'>"+item.mainactor+"元</td>"
						+"<td class='hidden-xs'>"+item.type+"</td>"
						+"<td class='hidden-xs'>"+item.speak+"元</td>"
						+"<td class='hidden-xs'>"+item.duration+"</td>";
						if(item.status==0){
							tr=tr+"<td id='status"+item.id+"' class='hidden-xs'>"+"正在热卖"+"</td>";
							}else if(item.status==1){
								tr=tr+"<td id='status"+item.id+"' class='hidden-xs'>"+"优惠商品"+"</td>";
								}else if(item.status==2){
								tr=tr+"<td id='status"+item.id+"' class='hidden-xs'>"+"已下架"+"</td>";
								}
						if(item.status==0){
							tr=tr+"<td class='hidden-xs' id='i"+item.id+"'><button onclick='update("+item.id+")'>修改</button>&nbsp;<button onclick='deletemovie("+item.id+")'>删除</button>&nbsp;<button onclick='updatestatusmovie("+item.id+")'>打折</button></td></tr>";
								}else if(item.status==1){
									tr=tr+"<td class='hidden-xs' id='i"+item.id+"'><button onclick='update("+item.id+")'>修改</button>&nbsp;<button onclick='deletemovie("+item.id+")'>删除</button>&nbsp;<button onclick='updatestatusmovie("+item.id+")'>下架</button></td></tr>";
										}else if(item.status==2){
											tr=tr+"<td class='hidden-xs' id='i"+item.id+"'><button onclick='update("+item.id+")'>修改</button>&nbsp;<button onclick='deletemovie("+item.id+")'>删除</button></td></tr>";
											}
						
	
						           databox.append(tr);
						  
						            }
					
					
						
			 }
				 
			 })
		 }
		function update(movieid){
			window.location.href="updateproduct.jsp?movieid="+movieid;

			}
		function updatestatusmovie(movieid){
			 $.ajax({
				 contextType:"applicatin/json;charset=utf-8",
				 type:"post",
				 data:{movieid:movieid},
				 url:"<%=basePath %>updatestatusmovie",
				 dataType:"json",
				 success:function(data){
					 window.parent.frames["right"].location.reload();
			}
			 })
			}
		function deletemovie(movieid){
			var question=confirm("确认删除？");
			if(question==true){
				 $.ajax({
					 contextType:"applicatin/json;charset=utf-8",
					 type:"post",
					 data:{movieid:movieid},
					 url:"<%=basePath %>deletemovie",
					 dataType:"json",
					 success:function(data){
						 window.parent.frames["right"].location.reload();
				}
				 })

			} 
		}
		</script>
	
<script type="text/javascript" src="../../static/js/moment.js"></script>
<script type="text/javascript" src="../../static/js/daterangepicker.js"></script>
<script type="text/javascript">
	$('#daterange-btn').daterangepicker({
			ranges: {
				'今天': [moment(), moment()],
				'本周': [moment().startOf('week'), moment().endOf('week')],
				'本月': [moment().startOf('month'), moment().endOf('month')],
				'今年': [moment().startOf('year'), moment().endOf('year')]
			},
			startDate: moment(),
			endDate: moment().endOf('month')
		},
		function(start, end) {
			$('#daterange-btn span').html(start.format('YYYY-MM-DD') + ' - ' + end.format('YYYY-MM-DD'));
			}
	);

	//Date picker
	$('#datepicker').datepicker({
		autoclose: true
	});
</script>
		
	</body>

</html>