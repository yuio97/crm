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
	<title>目标列表</title>
	
	<!-- CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/children.css">

    <!-- 在线图标库 地址：http://fontawesome.dashgame.com/-->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- layui css -->
    <link rel="stylesheet" href="layui/css/layui.css">
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="js/vue.min.js"></script>
</head>
<body>
<div class="wangid_conbox">
        <!-- 当前位置 -->
        <div class="zy_weizhi bord_b">
            <i class="fa fa-home fa-3x"></i>
            <a>首页</a>
            <a>目标管理</a>
            <span>目标列表</span>
        </div>
        <!-- 筛选 --> 
        <form action="task/getMonthToDateTaskDetails" method="post">
    	<div id="app" class="shuaix">
	         <div class="layui-input-inline">
	             <input type="text" id="test2" placeholder="请输入年月查询：" disabled style="border:1px solid white;width:110px"> 
	         </div>
	         <div class="layui-input-inline">
	             <input type="text"  name="year" class="layui-input" id="test2" placeholder="请输入年"> 
	         </div>
	         <div class="layui-input-inline">
	             <input type="text"  name="month" class="layui-input" id="test3" placeholder="请输入月">
	         </div>
	         <div class="selec"  style="margin-right:30px;"> 
	             <input type="submit" value="查询">
	         </div>
        </div>
        </form>
        <!-- 下面写内容 -->
        <table class="layui-table" lay-filter="mylist" lay-size="lg">
            <thead>
                <tr> 
                    <th lay-data="{field:'yx', align:'center',width:280}">操作</th>
                    <th lay-data="{field:'time',align:'center', minWidth:120}">状态</th>
                    <th lay-data="{field:'www',align:'center',minWidth:260}">内容</th>
                    <th lay-data="{field:'company',align:'center',minWidth:110}">时间</th>
                </tr> 
            </thead>
            <tbody>
            <c:forEach items="${allOldTaskDetails.list }" var="old" >
                <tr> 
                    <td>
	                    <c:if test="${old.detTaskStatus == 0 }"></c:if>
		             	<c:if test="${old.detTaskStatus == 1 }"><a href="" class="btn btn-primary">查看</a></c:if>
					</td>
                    <td>
						<c:if test="${old.detTaskStatus == 0 }">未发布</c:if>
	             		<c:if test="${old.detTaskStatus == 1 }">已发布</c:if>
					</td>
                    <td>${old.offContent }</td>
                    <td><fmt:formatDate value="${old.detTime }" pattern="yyyy-MM-dd" /></td>
                </tr>
            </c:forEach>
            </tbody>  
            <tfoot>
            	<tr>
            		<td colspan="4">
            			<a href="task/getAllOldTaskDetails?year=${year}&month=${month}">首页</a>
            			<!-- hasPreviousPage用于判断有没有上一页，hasNextPage用于判断有没有下一页 -->
            			<c:if test="${allOldTaskDetails.hasPreviousPage }">
            				<a href="task/getAllOldTaskDetails?pn=${allOldTaskDetails.prePage }&year=${year}&month=${month}">上一页</a>
            			</c:if>
            			<c:if test="${allOldTaskDetails.hasNextPage }">
            				<a href="task/getAllOldTaskDetails?pn=${allOldTaskDetails.nextPage }&year=${year}&month=${month}">下一页</a>
            			</c:if>
            			<a href="task/getAllOldTaskDetails?pn=${allOldTaskDetails.pages }&year=${year}&month=${month}">尾页</a>
            		</td>
            	</tr>
            </tfoot>
        </table>
    </div> 
    
    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container"> 
            <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">删除</button> 
        </div>
    </script> 
    <!-- layui js -->
    <script src="layui/layui.js"></script>
</body>
</html>

