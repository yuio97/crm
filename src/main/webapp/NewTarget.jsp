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
		<span>新建目标</span>
		<a href="AddNewTarget.jsp" style="float:right;color:white;margin-top:12px" class="layui-btn layui-btn-sm">添加目标</a>
	</div>
	<!-- 下面写内容 -->
	<table class="layui-table" lay-filter="mylist" lay-size="lg">
		<thead>
           <tr>
             <th>内容</th>
             <th>时间</th>
             <th>状态</th>
             <th>操作</th>
           </tr>
         </thead>
         <tbody>
         	<c:forEach items="${allTaskDetails }" var="task" >
           	<tr>
	             <td>${task.offContent }</td>
	             <td><fmt:formatDate value="${task.detTime }" pattern="yyyy-MM-dd" /> </td>
	             <td>
	             	<c:if test="${task.detTaskStatus == 0 }">未发布</c:if>
	             	<c:if test="${task.detTaskStatus == 1 }">已发布</c:if>
	             </td>
	             <td>
	             	<c:if test="${task.detTaskStatus == 0 }">
	             		<!-- task/updateDetTaskStatus?staskId=${task.offId } -->
	             		<a href="task/selectStaff?staskId=${task.offId }" class="btn btn-primary">
	             			<input type="hidden" name="offId" value="${task.offId }">
	             			发布
	             		</a>
	             	</c:if>
	             	<c:if test="${task.detTaskStatus == 1 }">
						<a href="" class="btn btn-primary">查看</a>
					</c:if>
	             </td>
           	</tr>
           	</c:forEach>
        </tbody>
	</table>
</div> 
</body>
</html>
