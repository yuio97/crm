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
	<title>添加目标</title>
	
	<!-- CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/children.css">

    <!-- 在线图标库 地址：http://fontawesome.dashgame.com/-->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- layui css -->
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
	<div class="wangid_conbox">
        <!-- 当前位置 -->
        <div class="zy_weizhi bord_b">
            <i class="fa fa-home fa-3x"></i>
            <a>首页</a>
            <a href="task/getAllTaskDetails">目标管理</a>
			<a href="task/getAllTaskDetails">新建目标</a>
			<span>添加目标</span>
        </div>
        <!-- 内容 -->    
        <div class="wenxts_ke">
            <p><i>温馨提示：</i>按需添加公司部门，注意数字值越小，部门就越靠前排</p>
        </div>
        <div class="kehubh_tj_k">
            <form action="task/addTarget" class="layui-form layui-form-pane" >
            <ul>   
                <li>
                    <div class="left">添加目标：</div>
                    <div class="right"> 
                        <textarea name="detTaskStatus" required lay-verify="required" placeholder="请输入内容" class="layui-textarea"></textarea>
                    </div>
                </li> 
                <li>
                    <div class="left"> &nbsp;</div>
                    <div class="right"> 
                        <button class="button_qr">确定添加</button>
                    </div>
                </li>
            </ul> 
            </form>
        </div>
    </div>   
    
    <script src="layui/layui.js"></script>
</body>
</html>
