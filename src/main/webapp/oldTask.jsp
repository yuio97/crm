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
    
    <script >
    	function getData(pn)
    	{
    		//发送请求
    		if(pn == undefined)
    		{
    			pn = 1;
    		}
    		var year = $('#test2').val();
    		var month = $('#test3').val();
    		location.href = "task/selectAllOldTask?year="+year+"&month="+month+"&pn="+pn;
    	}
    </script>
</head>
<body>
<div class="wangid_conbox">
        <!-- 当前位置 -->
        <div class="zy_weizhi bord_b">
            <i class="fa fa-home fa-3x"></i>
            <a>首页</a>
            <a href="task/selectAllTask">任务管理</a>
            <span>历史任务</span>
        </div>
        <!-- 筛选 --> 
    	<div id="app" class="shuaix">
	         <div class="layui-input-inline">
	             <input type="text"  placeholder="请输入年月查询：" disabled style="border:1px solid white;width:110px"> 
	         </div>
	         <div class="layui-input-inline">
	             <input type="text"  name="year" value="${year }" class="layui-input" id="test2" placeholder="请输入年"> 
	         </div>
	         <div class="layui-input-inline">
	             <input type="text"  name="month" value="${month }" class="layui-input" id="test3" placeholder="请输入月">
	         </div>
	         <div class="selec"  style="margin-right:30px;"> 
	             <input type="button" value="查询" onclick="getData()">
	         </div>
        </div>
        <!-- 下面写内容 -->
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
            <c:forEach items="${allOldTask.list }" var="oldTask" >
                <tr> 
                	<td>
                    	${oldTask.sysDeptId }
					</td>
                    <td>
                    	${oldTask.staffName }
					</td>
                    <td>
                    	${oldTask.offContent }
                    </td>
                    <td>
                    	<fmt:formatDate value="${oldTask.offTime }" pattern="yyyy-MM-dd" />
                    </td>
                    <td>
						<c:if test="${oldTask.offReceiveStatus == 0 }">未发布</c:if>
	             		<c:if test="${oldTask.offReceiveStatus == 1 }">已发布</c:if>
					</td>
                </tr>
            </c:forEach>
            </tbody>  
            <tfoot>
            	<tr>
            		<td colspan="5">
            			<a href="javascript:getData(1)">首页</a>
            			<!-- hasPreviousPage没有上一页生效，hasNextPage没有下一页生效 -->
            			<c:if test="${allOldTask.hasPreviousPage }">
            				<a href="javascript:getData(${allOldTask.prePage })">上一页</a>
            			</c:if>
            			<c:if test="${allOldTask.hasNextPage }">
            				<a href="javascript:getData(${allOldTask.nextPage })">下一页</a>
            			</c:if>
            			<a href="javascript:getData(${allOldTask.pages })">尾页</a>
            		</td>
            	</tr>
            </tfoot>
        </table>
    </div> 
    <!-- layui js -->
    <script src="layui/layui.js"></script>
</body>
</html>

