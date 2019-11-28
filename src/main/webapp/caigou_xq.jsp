<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>

	<base href="<%=basepath %>" />

	<meta charset="utf-8">
	<meta name="renderer" content="webkit"/>
	<meta name="force-rendering" content="webkit"/>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="名榜,wangid">
	<title>xq</title>

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
	<script  type="text/javascript" src="js/vue.min.js"></script>
</head>

<body style="background: #fff;">
<div class="tianjia_xx">
    <table class="if_tianjiatext layui-table" lay-size="lg"> 
     <table class="layui-table" lay-filter="mylist" lay-size="lg">
            <thead>
                <tr> 
                   
                    <th lay-data="{field:'time',align:'center', minWidth:80}">采购详情编号</th>
                    <th lay-data="{field:'company',align:'center',minWidth:80}">原材料名称</th>
                    <th lay-data="{field:'tel3',align:'center',width:80}">原材料的数量</th>
                    <th lay-data="{field:'tel1',align:'center',width:80}">原材料的单价</th>
                    <th lay-data="{field:'tel4',align:'center',width:80}">采购商品的数量</th>
                    <th lay-data="{field:'user',align:'center',width:80}">采购金额</th>
                    <th lay-data="{field:'tel2',align:'center',width:80}">供货商名称</th>
                    <th lay-data="{field:'tel5',align:'center',width:80}">供货商电话</th>
              
                    
                </tr> 
            </thead>
            <tbody >
            
            <c:forEach items="${purchasingXqList1}" var="PurchasingXq">
                <tr  > 
                    
                   
                    <td>${PurchasingXq.pxId}</td>
                    <td>${PurchasingXq.goods.goodsName}</td>
                    <td>${PurchasingXq.goods.goodsNum}</td>
                    <td>${PurchasingXq.goodsNum}</td>
                    <td>${PurchasingXq.goods.goodsPrice}</td>
                     <td>${PurchasingXq.goodsPrice}</td>
                    <td>${PurchasingXq.goods.supplier.supplierName}</td>
                     <td>${PurchasingXq.goods.supplier.supplierTel}</td>
                   
                    
                   
                </tr> 
                </c:forEach>
            </tbody>  
        </table>
</div>
 
</body>

</html>
    <script type="text/javascript"> 
	//静态表格
    layui.use('table',function(){
            var table = layui.table;
            //转换静态表格
            table.init('mylist', {
                height: 'full-130', //高度最大化减去差值,也可以自己设置高度值：如 height:300
                count: 50 //数据总数 服务端获得
                ,limit: 10 //每页显示条数 注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
                ,page:true //开启分页 
                ,
                defaultToolbar:['filter', 'exports']
                ,limits:[10, 20, 30, 40, 50]//分页显示每页条目下拉选择
                ,cellMinWidth: 60//定义全局最小单元格宽度，其余自动分配宽度
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
        layui.use('laydate', function(){
        var laydate = layui.laydate; 
        //年选择器
        laydate.render({
            elem: '#test2'
            ,type: 'month'
        });
        
        //年月选择器
        laydate.render({
            elem: '#test3'
            ,type: 'month'
        });
    });
  
    
 
</script> 
