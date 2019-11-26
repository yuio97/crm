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
<div class="wangid_conbox">
        <!-- 当前位置 -->
        <div class="zy_weizhi bord_b">
            <i class="fa fa-home fa-3x"></i>
            <a>首页</a>
            <a>采购管理</a>
            <span>采购单详情列表</span>
        </div>
        <!-- 筛选 --> 
        <div class="shuaix">
            <div class="left"  style="margin-right:10px;">
                <!-- <b>意向：</b> -->
                <select>   
                    <option value="按年份时间查询">按年份时间查询</option>   
                    <option value="其他">其他</option>    
                </select>
            </div>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="test2" placeholder="开始时间"> 
            </div>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="test3" placeholder="结束时间">
            </div>
            <div class="right"  style="margin-right:30px;"> 
                    <a href="#">查询</a>
                </div>
            <div class="left"   style="margin-right:10px;">
                <!-- <b>员工：</b> -->
                <select>   
                    <option value="公司名称">公司名称</option>   
                    <option value="其他">其他</option>   
                </select>
            </div>  
            <!-- <div class="center">统计：【大：20 中：30 小：60】</div> -->
            <div class="right">
                <input type="text" placeholder="贵州华盛名酒销售有限公司">
                <a href="#">查询</a>
            </div>
        </div>
        <!-- 下面写内容 -->
        <table class="layui-table" lay-filter="mylist" lay-size="lg">
            <thead>
                <tr> 
                    <th lay-data="{type:'checkbox',fixed:'left'}"></th>
                    <th lay-data="{field:'yx', align:'center',width:160}">操作</th>
                    <th lay-data="{field:'time',align:'center', minWidth:108}">采购单编号</th>
                    <th lay-data="{field:'company',align:'center',minWidth:160}">商品编号</th>
                    <th lay-data="{field:'tel',align:'center',width:150}">采购商品的数量</th>
                    <th lay-data="{field:'user',align:'center',width:180}">采购员编号</th>
                    <th lay-data="{field:'addr',align:'center',minWidth:120}">操做时间</th> 
                    <th lay-data="{field:'addr4',align:'center',minWidth:110}">备注</th>  
                    
                </tr> 
            </thead>
            <tbody id="xq">
                <tr v-for="PurchasingXq in PXq" > 
                    
                    <td></td>
                    <td > <a href="">修改</a> </td>
                    <td>{{PurchasingXq.porderId}}</td>
                
                    <td>{{PurchasingXq.goodsId}}</td>
                    <td>{{PurchasingXq.goodsNum}}</td>
                    <td>{{PurchasingXq.sysStaffId}}</td>
                    <td>{{PurchasingXq.pxLastTime}}</td>
                    <td>{{PurchasingXq.pxMassage}}</td>
                    
                   
                </tr> 
                
              
                
            </tbody>  
        </table>

    </div> 
<script type="text/javascript">
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
    
