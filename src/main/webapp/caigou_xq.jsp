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
    <meta charset="utf-8">
    <meta name="renderer" content="webkit"/>
    <meta name="force-rendering" content="webkit"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="名榜,wangid">
    <title>cgl</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/children.css">

    <!-- 在线图标库 地址：http://fontawesome.dashgame.com/-->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- layui css -->
    <link rel="stylesheet" href="layui/css/layui.css">
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
    <script  type="text/javascript" src="js/vue.min.js"></script>
    
</head>

<body>
    <div class="wangid_conbox">
        <!-- 当前位置 -->
        
        
        <!-- 下面写内容 -->
        <table class="layui-table" lay-filter="mylist" lay-size="lg">
            <thead>
                <tr> 
                   
                    <th lay-data="{field:'time',align:'center', minWidth:80}">采购详情编号</th>
                    <th lay-data="{field:'company',align:'center',minWidth:80}">原材料名称</th>
                    <th lay-data="{field:'num',align:'center',width:180}">原材料的数量</th>
                    <th lay-data="{field:'price',align:'center',width:180}">原材料的单价</th>
                    <th lay-data="{field:'gnum',align:'center',width:180}">采购商品的数量</th>
                    <th lay-data="{field:'user',align:'center',width:180}">采购金额</th>
                    <th lay-data="{field:'name',align:'center',width:180}">供货商名称</th>
                    <th lay-data="{field:'tel5',align:'center',width:180}">供货商电话</th>
              
                    
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
<!-- 自定义头部工具栏 -->
   <!-- <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container"> 
            <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">删除</button> 
        </div>
    </script> 
    -->
    <script src="layui/layui.js"></script>
    
</body>

</html>
<script>
 var vue = new Vue({
    el:'#kcl',
    data:{
    	POrder:[]
    },
    methods:{

    },
    created:function(){
    	
       this_a=this;
        $.ajax({
            type: "GET",
            url: "purchasingOrder/getpurchasingOrderList?state=1",
            data: null,
            dataType: "json",
            success: function (response) {
            	this_a.POrder=response.purchasingOrderList;
            	console.log(response.purchasingOrderList);
            }
        });
    }


  })
</script>
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


