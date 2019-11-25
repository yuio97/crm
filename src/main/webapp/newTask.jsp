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
		<a href="task/selectAllTask">任务管理</a>
		<span>最新任务</span>
	</div>
	<!-- 下面写内容 -->
	<form action="task/selectPublishedTask" >
	<table class="layui-table" lay-filter="mylist" lay-size="lg">
		<thead>
           <tr>
             <th>员工编号</th>
             <th>员工姓名</th>
             <th>任务内容</th>
             <th>任务发布时间</th>
             <th>任务接收状态</th>
           </tr>
         </thead>
         <tbody>
         	<c:forEach items="${selectAllTask }" var="task" >
           	<tr>
	             <td>${task.sysDeptId }</td>
	             <td>${task.staffName }</td>
	             <td>${task.offContent }</td>
	             <td><fmt:formatDate value="${task.offTime }" pattern="yyyy-MM-dd" /> </td>
	             <td>
	             	<c:if test="${task.offReceiveStatus == 0 }">未接收</c:if>
	             	<c:if test="${task.offReceiveStatus == 1 }">已接收</c:if>
	             </td>
	             <input type="hidden" name="sysDeptId" value="${task.sysDeptId }" >
           	</tr>
           	</c:forEach>
        </tbody>
	</table>
	</form>
</div> 
</body>
</html>
