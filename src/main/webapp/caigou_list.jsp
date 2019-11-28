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
        <div class="zy_weizhi bord_b">
            <i class="fa fa-home fa-3x"></i>
            <a>首页</a>
            <a>采购管理</a>
            <span>采购单列表</span>
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
                    <th lay-data="{field:'company',align:'center',minWidth:160}">支付方式</th>
                    <th lay-data="{field:'user',align:'center',width:180}">采购进展</th>
                    <th lay-data="{field:'tel',align:'center',width:150}">采购时间</th>
                    <th lay-data="{field:'addr',align:'center',minWidth:120}">采购地点</th> 
  
                    <th lay-data="{field:'addr4',align:'center',minWidth:110}">备注</th>  
                    
                </tr> 
            </thead>
            <tbody id="kcl">
                <tr v-for="PurchasingOrder in POrder" > 
                    
                    <td></td>
                    <td > <a :href='"/purchasingOrder/getporderId?porderId="+PurchasingOrder.porderId' style="color:#205b9e;">修改</a>丨<a :href='"/purchasingOrder/getporderId1?porderId="+PurchasingOrder.porderId' style="color:#205b9e;" >详情</a> </td>
                    <td>{{PurchasingOrder.porderId}}</td>
                
                    <td>{{PurchasingOrder.payQk}}</td>
                    <td>{{PurchasingOrder.porderJz}}</td>
                    <td>{{PurchasingOrder.porderTime}}</td>
                    <td>{{PurchasingOrder.jhAddress}}</td>
                    <td>{{PurchasingOrder.pMassage}}</td>
                    
                   
                </tr> 
                
              
                
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
            url: "purchasingOrder/getpurchasingOrderList",
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


