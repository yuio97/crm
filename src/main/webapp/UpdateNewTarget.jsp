<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<base href="<%=basepath %>" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>新建目标</title>
	
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
</head>
<body>
<div class="wangid_conbox">
	<!-- 当前位置 -->
	<div class="zy_weizhi bord_b">
		<i class="fa fa-home fa-3x"></i>
		<a>首页</a>
		<a>目标管理</a>
		<a>新建目标</a>
		<span>发布任务</span>
	</div>
	<!-- 下面写内容 -->
	<form action="task/selectByPrimaryKey" >
		<table class="layui-table" lay-filter="mylist" lay-size="lg">
			<thead>
				<tr>
					<th lay-data="{type:'checkbox',fixed:'left'}"></th>
					<th lay-data="{field:'tel',align:'center',width:130}">员工编号</th>
					<th lay-data="{field:'user',align:'center',width:130}">姓名</th>
					<th lay-data="{field:'yx', align:'center',width:70}">性别</th>
					<th lay-data="{field:'addr',align:'center',width:140}">职务编号</th>
					<th lay-data="{field:'www',align:'center',width:200}">联系电话</th>
					<th lay-data="{field:'time',align:'center', minWidth:170}">其它联系方式</th>
				</tr> 
			</thead>
			<tbody>
				<c:forEach items="${staffList }" var="s" >
					<tr>
						<td><input name="sysStaffId" value="${s.sysStaffId }" type="checkbox"></td>
						<td>${s.sysStaffId }</td>
						<td>${s.sysStaffName }</td>
						<td>${s.sysStaffSex }</td>
						<td>${s.sysDutyId }</td>
						<td>${s.sysStaffTel }</td>
						<td>${s.sysStaffOntel }</td>
					</tr>
				</c:forEach>
			</tbody>  
		</table>
		<input type="hidden" name="staskId" value="${staskId}"/>
		<button style="background-color:#205B9E;width:200px;height:50px;color:white;border-radius:5px">确定发布</button>
	</form>
</div> 

</body>
</html>
