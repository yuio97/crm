<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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
                    <th lay-data="{field:'tel',align:'center',width:80}">采购商品的数量</th>
                    <th lay-data="{field:'tel1',align:'center',width:80}">原材料的单价</th>
                    <th lay-data="{field:'tel2',align:'center',width:80}">供货商名称</th>
                    <th lay-data="{field:'user',align:'center',width:80}">采购员编号</th>
                    <th lay-data="{field:'addr',align:'center',minWidth:80}">操做时间</th> 
                    <th lay-data="{field:'addr4',align:'center',minWidth:80}">备注</th>  
                    
                </tr> 
            </thead>
            <tbody id="xq">
                <tr v-for="PurchasingXq in PXq" > 
                    
                   
                    <td>{{PurchasingXq.pxId}}</td>
                    <td>{{PurchasingXq.goods.goodsName}}</td>
                    <td>{{PurchasingXq.goodsNum}}</td>
                    <td>{{PurchasingXq.goods.goodsPrice}}</td>
                    <td>{{PurchasingXq.goods.supplier.supplierName}}</td>
                    <td>{{PurchasingXq.sysStaffId}}</td>
                    <td>{{PurchasingXq.pxLastTime}}</td>
                    <td>{{PurchasingXq.pxMassage}}</td>
                    
                   
                </tr> 
                
              
                
            </tbody>  
        </table>
</div>
<script >
new Vue({
	 el:"#xq",
	data:{
		
		PXq:[]
			
	},
methods:{
	 
},

	    created:function(){
	    	
	        this_a=this
	        $.ajax({
	            type: "GET",
	            url: "/purchasingXq/purchasingXqlist",
	            data: null,
	            dataType: "json",
	            success: function (response) {
	            	this_a.PXq=response;
	            	console.log(response);
	            }
	        });
	    }


	  })
</script> 
</body>

</html>
    
