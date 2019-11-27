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
            <span>部门职位添加</span>
        </div>
        <!-- 内容 -->    
        <div class="wenxts_ke">
            <p><i>温馨提示：</i>按需添加部门职位，注意勾选用户权限确定无误后再添加</p>
        </div>
        <div class="kehubh_tj_k">
            <form class="layui-form layui-form-pane" action="role/add">
            <ul> 
                <li  style="height: 38px; overflow:initial;">
                    <div class="left">部门名称：</div>
                    <div class="right">  
                        <select name="city"  lay-verify="">
                            <option value="">请选择部门</option>
                         <c:forEach items="${dept}" var="g">   
                            <option value="${g.sysDeptId}">${g.sysDeptName }</option>
                          </c:forEach>  
                        </select> 
                    </div>
                </li>
                <li>
                    <div class="left">部门职位：</div>
                    <div class="right"> 
                        <input type="text" name="title" required lay-verify="required" placeholder="请输入部门职位" autocomplete="off" class="layui-input">
                    </div>
                </li> 
                <li>
                    <div class="left">排序：</div>
                    <div class="right"> 
                        <input type="text" name="title" required lay-verify="required" placeholder="请输入部门职位" autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                    <div class="left">权限：</div> 
                    <div class="right" style="    width: 640px;"> 
                            <input type="checkbox" name="" title="特殊备注" lay-skin="primary" checked>
                            <input type="checkbox" name="" title="账户/网站状态" lay-skin="primary"> 
                            <input type="checkbox" name="" title="公司名称" lay-skin="primary" >
                            <input type="checkbox" name="" title="FTP/域名" lay-skin="primary"> 
                            <input type="checkbox" name="" title="ID号" lay-skin="primary" >
                            <input type="checkbox" name="" title="注册日期" lay-skin="primary"> 
                            <input type="checkbox" name="" title="ID号密码" lay-skin="primary" >
                            <input type="checkbox" name="" title="合同金额" lay-skin="primary"> 
                            <input type="checkbox" name="" title="充值" lay-skin="primary" >
                            <input type="checkbox" name="" title="联系人" lay-skin="primary"> 
                            <input type="checkbox" name="" title="电话" lay-skin="primary" >
                            <input type="checkbox" name="" title="QQ" lay-skin="primary"> 
                            <input type="checkbox" name="" title="电子邮箱" lay-skin="primary" >
                            <input type="checkbox" name="" title="地址" lay-skin="primary"> 
                            <input type="checkbox" name="" title="乙方" lay-skin="primary" >
                            <input type="checkbox" name="" title="合同编号" lay-skin="primary"> 
                            <input type="checkbox" name="" title="合同编号" lay-skin="primary" >
                            <input type="checkbox" name="" title="签署日期" lay-skin="primary"> 
                            <input type="checkbox" name="" title="续费时间" lay-skin="primary" >
                            <input type="checkbox" name="" title="续费金额" lay-skin="primary"> 
                            <input type="checkbox" name="" title="确认函" lay-skin="primary" >
                            <input type="checkbox" name="" title="seo词" lay-skin="primary">
                            <input type="checkbox" name="" title="权限" lay-skin="primary">
                            <input type="checkbox" name="" title="备案号" lay-skin="primary">
                            <input type="checkbox" name="" title="回访记录" lay-skin="primary">
                            <input type="checkbox" name="" title="备注" lay-skin="primary">
                            <input type="checkbox" name="" title="客服质量分" lay-skin="primary">
                            <input type="checkbox" name="" title="项目完成成绩" lay-skin="primary">  
                    </div>
                </li> 
                <li>
                    <div class="left">职位简介：</div>
                    <div class="right"> 
                        <textarea name="" required lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
                    </div>
                </li> 
                <li>
                    <div class="left"> &nbsp;</div>
                    <div class="right"> 
                      <!--   <button class="button_qr">确定添加</button> -->
                        <input type="submit" class="button_qr" value="确定添加">
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