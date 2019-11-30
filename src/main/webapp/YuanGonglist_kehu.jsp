<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basepath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit"/>
	<meta name="force-rendering" content="webkit"/>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="名榜,wangid">
	<title>WangID办公管理系统</title>

	<!-- CSS -->
	<link rel="stylesheet" href="css/style.css">
	 <link rel="stylesheet" href="css/children.css">

	<!-- 在线图标库 地址：http://fontawesome.dashgame.com/-->
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

	<!-- layui css -->
	<link rel="stylesheet" href="layui/css/layui.css" media="all">
	<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script> 
	<!-- layui js -->
	<script src="layui/layui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
<div class="wangid_conbox" id="hh">
	<!-- 当前位置 -->
	<div class="zy_weizhi bord_b">
		<i class="fa fa-home fa-3x"></i>
		<a>首页</a>
		<a>员工管理</a>
		<span>公司员工列表</span>
	</div>
	<!-- 筛选 --> 
	<div class="shuaix">
		<div class="left" style="margin-right:10px;"> 
			<button class="layui-btn layui-btn-sm" lay-event="getCheckLength">失联客户</button>
			<a class="layui-btn layui-btn-sm" lay-event="getCheckLength" href="YuanGong_tj_lwh.jsp">增加客户</a> 
		</div> 
		<div class="right">
			<input type="text" placeholder="请输入关键词查询">
			<a href="#">查询</a>
		</div>
	</div>
	<!-- 下面写内容 -->
	<table class="layui-table" lay-filter="mylist" lay-size="lg">
		<thead>
			<tr>
				<th lay-data="{field:'time',align:'center', minWidth:170}">客户编号</th>
				<th lay-data="{field:'company',align:'center',minWidth:130}">客户姓名</th>
				<th lay-data="{field:'user',align:'center',width:130}">客户邮箱</th>
				<th lay-data="{field:'tel',align:'center',width:130}">客户电话</th>
				<th lay-data="{field:'result',align:'center',minWidth:130}">公司地址</th>
                <th lay-data="{field:'addr',align:'center',minWidth:130}">公司代码</th> 
				<th lay-data="{field:'addr1',align:'center',minWidth:100}">客户状态</th> 
				<th lay-data="{field:'option',align:'center',width:130,toolbar:'#barDemo',fixed: 'right'}">操作</th>
			</tr> 
		</thead>
		<tbody>
			<tr v-for="(customer,i) in customerlist">
				<td >{{customer.customerId}}</td>
				<td>{{customer.customerName}}</td>
				<td>{{customer.customerEmal}}</td>
				<td>{{customer.customerIphone}}</td>
				<td>{{customer.copanyAdress}}</td>
				<td>{{customer.copanyCode}}</td>
                <td>{{customer.customerState}}</td>
				<td><a style="font-size:15px" :href='"cus/del?id="+customer.customerId' >删除</a></td>                
			</tr> 
		</tbody>  
	</table>
	<script type="text/html" id="barDemo">
		<a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script> 
</div> 
<script type="text/html" id="toolbarDemo">
	
</script>  

<script>
var v = new Vue({
	el: '#hh',
	data:{
		customerlist:[]
	},
	methods:{
		
	},
	created:function(){
		var	_this = this
        $.ajax({
			 type: "GET",
			 url: "cus/selectcus",
			 data: null,
			 dataType: "json",
			 success: function (response) {
				 console.log(response);
				_this.customerlist = response;
				
			 }
		 });
	}
});
</script>

</body>
</html>