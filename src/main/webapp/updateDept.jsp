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
  <title>WangID办公管理系统</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/children.css">

    <!-- 在线图标库 地址：http://fontawesome.dashgame.com/-->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- layui css -->
    <link rel="stylesheet" href="layui/css/layui.css">
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
    
</head>

<body>
    <div class="wangid_conbox">
        <!-- 当前位置 -->
        <div class="zy_weizhi bord_b">
            <i class="fa fa-home fa-3x"></i>
            <a>首页</a>
            <a>回访记录</a>
            <span>公司部门添加</span>
        </div>
        <!-- 内容 -->    
        <div class="wenxts_ke">
            <p><i>温馨提示：</i>按需添加公司部门，注意数字值越小，部门就越靠前排</p>
        </div>
        <div class="kehubh_tj_k">
            <form class="layui-form layui-form-pane" action="dept/add">
            <ul>  
                <li>
                    <div class="left">部门名称：</div>
                    <div class="right"> 
                        <input type="text" name="sysDeptName" value="${dept.sysDeptName}" required lay-verify="required" placeholder="请输入部门名称" autocomplete="off" class="layui-input">
                    </div>
                </li> 
                <li>
                    <div class="left">部门简介：</div>
                    <div class="right"> 
                        <textarea name="sysDeptRemark" required lay-verify="required" placeholder="请输入部门简介" class="layui-textarea">${dept.sysDeptRemark }</textarea>
                    </div>
                </li> 
                <li>
                    <div class="left"> &nbsp;</div>
                    <div class="right"> 
                        <button class="button_qr">确定添加</button>
                        <input class="button_qr" type="submit" value="确定添加">
                    </div>
                </li>
            </ul> 
            </form>
        </div>
    </div>   
    
	<!-- houl --> 
	<!-- 结束 -->
    <!-- layui js -->
    <script src="layui/layui.js"></script>
    
</body>

</html>
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
    var form = layui.form
    ,layer = layui.layer
    ,layedit = layui.layedit
    ,laydate = layui.laydate;
});
layui.use('laydate', function(){
  var laydate = layui.laydate; 
  //年选择器 
  laydate.render({
    elem: '#test2'
  });
   //时间选择器
   laydate.render({
    elem: '#test2_r'
    ,type: 'time'
  });
});


</script>
