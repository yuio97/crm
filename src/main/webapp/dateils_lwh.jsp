<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basepath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="renderer" content="webkit"/>
	<meta name="force-rendering" content="webkit"/>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="名榜,wangid">
	<title>WangID办公管理系统</title>

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
<title>Insert title here</title>
</head>
<body>
	<div class="wangid_conbox">
	<!-- 当前位置 -->
	<div class="zy_weizhi bord_b">
		<i class="fa fa-home fa-3x"></i>
		<a>首页</a>
		<a>员工管理</a>
		<span>公司员工列表</span>
	</div>
	<!-- 筛选 --> 
	<div class="shuaix">
		<div style="margin-left:5px">客户编号:${data.customerId}</div>
		<div style="margin-left:13px">客户姓名:${data.customer.customerName}</div>
		<div style="margin-left:13px">客户邮箱:${data.customer.customerEmal}</div>
		<div style="margin-left:13px">客户电话:${data.customer.customerIphone}</div>
		<a style="padding-left:890px" href="YuanGonglist_lwh.jsp">返回</a>
	</div>
	<!-- 下面写内容 -->
	<table class="layui-table" lay-filter="mylist" lay-size="lg">
		<thead>
			<tr>
				<th lay-data="{field:'user',align:'center',width:130}">商品ID</th>
				<th lay-data="{field:'tel',align:'center',width:130}">商品名称</th>
				<th lay-data="{field:'result',align:'center',minWidth:130}">商品价格</th>
                <th lay-data="{field:'addr',align:'center',minWidth:130}">商品数量</th>
				<th lay-data="{field:'addr1',align:'center',minWidth:100}">商品总价</th> 
				
			</tr> 
		</thead>
		<tbody>
		<c:forEach items="${data.proDetaList }" var="pdl">
			<tr>
				<td>${pdl.kcgoods.kcgoodsId}</td>
				<td>${pdl.kcgoods.kgoodsName}</td>
				<td>${pdl.kcgoods.jxj}</td>
                <td>${pdl.sysAccountId}</td>
				<td>${pdl.sysAccountId * pdl.kcgoods.jxj}</td>                
			</tr> 
			</c:forEach>
		</tbody>  
	</table>
	<script type="text/html" id="barDemo">
		<a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script> 
</div> 
<script type="text/html" id="toolbarDemo">
	<div style="padding-left:550px;font-size:40px;font-weight:40px">客户订单详细信息页面</div>
</script> 
<script type="text/javascript">
	//静态表格
    layui.use('table',function(){
    	var table = layui.table;
		//转换静态表格
		table.init('mylist', {
		  height: 'full-130' //高度最大化减去差值,也可以自己设置高度值：如 height:300
		  ,count: 50 //数据总数 服务端获得
		  ,limit: 10 //每页显示条数 注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
		  ,page:true //开启分页
		  ,toolbar: '#toolbarDemo'//工具栏
		  ,defaultToolbar:['filter', 'exports']
		  ,limits:[10, 20, 30, 40, 50]//分页显示每页条目下拉选择
		  ,cellMinWidth: 60//定义全局最小单元格宽度，其余自动分配宽度
		}); 
		//监听行工具事件
		table.on('tool(mylist)', function(obj){ //注：tool 是工具条事件名，mylist 是 table 原始容器的属性 lay-filter="对应的值"
			var data = obj.data //获得当前行数据
			,layEvent = obj.event; //获得 lay-event 对应的值
			if(layEvent === 'del'){
			    layer.confirm('真的删除行么', function(index){
				    obj.del(); //删除对应行（tr）的DOM结构
				    layer.close(index);
				    //向服务端发送删除指令
			    });
			} else if(layEvent === 'edit'){
			    layer.msg('修改操作');
			}
		}); 
		 //监听头工具栏事件
		 table.on('toolbar(mylist)', function(obj){
                var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据 
                switch(obj.event){  
                case 'getCheckLength':
                    if(data.length === 0){
                    layer.msg('请选择一行');
                    } else {
                    layer.msg('删除');
                    }
                break;
                };
            }); 
	}); 
	  //  iframe层  详情信息
    function YuanG_IMG(){
        //iframe层 
        layer.open({
            type: 2,//层类型
            title: "简历图片",//标题
            closeBtn: 1, //不显示关闭按钮
            shade: [0.3],//遮罩
            skin: 'demo_class_color',//iframe皮肤
            shadeClose:Boolean,//点击遮罩关闭
            area: ['800px', '460px'],
            // offset: 'rb', //右下角弹出
            // time: 2000, //2秒后自动关闭
            anim: 5,//动画
            content: ['YuanGong_jl.html', 'no'], //iframe的url，no代表不显示滚动条 
        }); 
        
    }
</script> 
        
        
    </table>


</body>
</html>