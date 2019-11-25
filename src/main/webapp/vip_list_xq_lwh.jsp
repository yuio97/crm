<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basepath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8">
	<meta name="renderer" content="webkit"/>
	<meta name="force-rendering" content="webkit"/>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="名榜,wangid">
	<title>CRM系统</title>

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
<body style="background: #fff;">
<div class="tianjia_xx">
    <table class="if_tianjiatext layui-table" lay-size="lg"> 
    <tbody>
        <tr>
            <td  class="td_1">客户姓名</td> 
            <td><input type="text" placeholder="请登记客户姓名"></td>
        </tr>
        <tr>
            <td  class="td_1">客户电话</td> 
            <td><input type="text" placeholder="请登记客户电话"></td>
        </tr>
        <tr>
            <td  class="td_1">客户邮箱</td> 
            <td><input type="text" placeholder="请登记客户邮箱"></td>
        </tr>
        <tr>
            <td  class="td_1">公司名称</td> 
            <td><input type="text" placeholder="请登记公司名称"></td>
        </tr>
        <tr>
            <td  class="td_1">公司地址</td> 
            <td><input type="text" placeholder="请登记公司详细地址"></td>
        </tr>
        <tr>
            <td  class="td_1">预购时间</td> 
            <td><input type="text" class="layui-input"  id="test2" placeholder="yyyy-MM-dd"></td>
        </tr>
        <tr>
            <td  class="td_1">截至时间</td> 
            <td><input type="text" class="layui-input"  id="test3" placeholder="yyyy-MM-dd"></td>
        </tr>
        <tr>
            <td  class="td_1">预购单说明</td> 
            <td><textarea rows="5" cols="45" placeholder="请输入预购单说明"></textarea></td>
        </tr>
        <tr>
            <td  class="td_1">预付定金</td> 
            <td><input type="text" placeholder="请登记预付定金(可为空)"></td>
        </tr>
        <tr>
            <td  class="td_1">商品选择</td> 
            <td>
            	<table>
            		<tr>
            			<td style="width:150px;"><input type="checkbox">测试商品</td>
            			<td><input type="text" placeholder="请输入数量"></td>
            		</tr>
            	</table>
			</td>
        </tr>
        <tr>
            <td  class="td_1">预购数量</td> 
            <td><input type="text" placeholder="请登记预购数量"></td>
        </tr>
        <tr>
            <td  class="td_1">操作人</td> 
            <td><input type="text" placeholder="请登记操作人"></td>
        </tr> 
        <tr >
        	<td colspan="2">
        	<button class="layui-btn layui-btn-sm" >确定</button>
        	<button class="layui-btn layui-btn-sm" >取消</button>
        	</td>
        </tr>
    </tbody>
    </table>
</div>

<script src="layui/layui.js"></script>



</body>
</html>
<script>
layui.use('laydate', function(){
  var laydate = layui.laydate; 
  //常规用法
  laydate.render({
    elem: '#test1'
  });
   //常规用法
   laydate.render({
    elem: '#test2'
  });
   //常规用法
   laydate.render({
    elem: '#test3'
  });
});
</script>