<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>supplier</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/children.css">

    <!-- 在线图标库 地址：http://fontawesome.dashgame.com/-->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- layui css -->
    <link rel="stylesheet" href="layui/css/layui.css">
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
    
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
	<div class="wangid_conbox" id="v">
        <!-- 当前位置 -->
        <div class="zy_weizhi bord_b">
            <i class="fa fa-home fa-3x"></i>
            <a>首页</a>
            <a>供应商信息管理</a>
            <span >供应商信息列表</span>
        
        </div>
        
        <!-- 筛选 --> 
        
        <!-- 下面写内容 -->
        <table class="layui-table" lay-filter="mylist" lay-size="lg">
            <thead>
                <tr> 
                    <th lay-data="{type:'checkbox',fixed:'left'}"><button class="layui-btn layui-btn-sm" lay-event="getCheckLength">删除</button></th>
                    <th lay-data="{field:'yx', align:'center',width:280}">操作</th>
                    <th lay-data="{field:'time',align:'center', minWidth:120}">预购表编号</th>
                    <th lay-data="{field:'www',align:'center',minWidth:260}">客户公司名称</th>
                    <th lay-data="{field:'company',align:'center',minWidth:110}">客户联系人</th>
                    <th lay-data="{field:'user',align:'center',width:180}">预定时间</th>
                    <th lay-data="{field:'tel',align:'center',width:150}">截止时间</th>
                    <th lay-data="{field:'result',align:'center',minWidth:180}">订单备注</th>
                </tr> 
            </thead>
            <tbody>
                <tr v-for="(pre,j) in prelist" :key=j> 
                    <td><input type="checkbox"></td>
                    <td>
                    	<button	 :onclick="'tijiao('+pre.preorderId+')'"  type="button" style="color:#205b9e;"  >提交</button>
                    	丨<a :href="'preorder/selectXqUpdate?id='+pre.preorderId" style="color:#205b9e;">修改</a>
                    	丨<a :href="'javascript:Vip_xq('+pre.preorderId+')'" style="color:#205b9e;" >详情</a>
                    	丨<a :href="'preorder/realdel?rid='+pre.preorderId" style="color:#205b9e;" >删除</a>
                    </td>
                    <td :pid="pre.preorderId">{{pre.preorderId}}</td>
                    <td >{{pre.customer.copanyName}}</td>
                    <td>{{pre.customer.customerName}}</td>
                    <td>{{pre.preorderTme}}</td>
                    <td>{{pre.deliveryTime}}</td>
                    <td>{{pre.preorderNote}}</td>
            </tbody>  
        </table>
    </div> 
<!-- 自定义头部工具栏 -->
    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container"> 
            <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">删除预定单</button> 
			<a class="layui-btn layui-btn-sm" style="margin-left:10px;" href="vip_list_xq_lwh.jsp">添加预定单</a>
        </div>
    </script> 
    <!-- layui js -->
    <script src="layui/layui.js"></script>
	

	
	
	
	
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
                ,toolbar: '#toolbarDemo' //指向自定义工具栏模板选择器 
                ,defaultToolbar:['filter', 'exports']
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
    //  iframe层  详情信息
    function Vip_xq(id){
        //iframe层 
        layer.open({
            type: 2,//层类型
            title: "详情信息",//标题
            closeBtn: 1, //不显示关闭按钮
            shade: [0.3],//遮罩
            skin: 'demo_class_color',//iframe皮肤
            shadeClose:Boolean,//点击遮罩关闭
            area: ['800px', '460px'],
            // offset: 'rb', //右下角弹出
            // time: 2000, //2秒后自动关闭
            anim: 5,//动画
            content: ['/preorder/selectXq?id='+id, 'no'], //iframe的url，no代表不显示滚动条 
        }); 
        
    }
    //  iframe层  回访记录
    function Vip_hf(id){
        //iframe层 
        layer.open({
            type: 2,//层类型
            title: "详情信息",//标题
            closeBtn: 1, //不显示关闭按钮
            shade: [0.3],//遮罩
            skin: 'demo_class_color',//iframe皮肤
            shadeClose:Boolean,//点击遮罩关闭
            area: ['800px', '460px'],
            // offset: 'rb', //右下角弹出
            // time: 2000, //2秒后自动关闭
            anim: 5,//动画
            content: ['/preorder/selectXqUpdate?id='+id, 'no'], //iframe的url，no代表不显示滚动条 
        }); 
        
    } 
    
    
    
 
</script>
		<script>
    var s = new Vue({
        el:'#v',
        data:{
            prelist:[]
        },
        
        
        created:function(){
        	
            var _this = this
            $.ajax({
                type: "GET",
                url: "preorder/select",
                data: null,
                dataType: "json",
                success: function (response) {
                    _this.prelist = response;
                }
            });
        }
        
    });
    </script>
	
	
	<script>
	function  tijiao(id)
	{
		
		 $.ajax({
             type: "GET",
             url: "preorder/tijiao",
             data: {id:id},
             dataType: "text",
             success: function (response) {
            	 console.log(response);
            	 if(response == 'true'){
						location.href="preorder/del?id="+id;
					}else
					{
						alert("库存数量不足");
					}
             }
         });
	
	}
	
	</script>
	
	
	
</body>
</html>
