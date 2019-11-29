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
	<title>查看任务</title>
	
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
		<a href="task/getAllOldTaskDetails">任务管理</a>
		<span>查看任务</span>
	</div>
	<!-- 下面写内容 -->
	<form action="task/selectOldPublishedTask" >
	<table class="layui-table" lay-filter="mylist" lay-size="lg">
		<thead>
           <tr>
             <th>姓名</th>
             <th>任务编号</th>
             <th>任务内容</th>
             <th>任务状态</th>
             <th>更新时间</th>
           </tr>
         </thead>
         <tbody>
         	<c:forEach items="${oldPublishedTask }" var="oldpub" >
           	<tr>
	             <td>${oldpub.sysStaffName }</td>
	             <td>${oldpub.offId }</td>
	             <td>${oldpub.offContent }</td>
	             <td>
	             	<c:if test="${oldpub.releaseState == 1 }">未接收</c:if>
	             	<c:if test="${oldpub.releaseState == 2 }">已接收</c:if>
	             	<c:if test="${oldpub.releaseState == 3 }">已完成</c:if>
	             </td>
	             <!-- 时分秒：HHmmss -->
	             <td><fmt:formatDate value="${oldpub.operateTime }" pattern="yyyy-MM-dd" /> </td>
           	</tr>
           	</c:forEach>
        </tbody>
	</table>
	</form>
</div> 
</body>
</html>
