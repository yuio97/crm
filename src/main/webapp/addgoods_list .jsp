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
	<title>ycl列表</title>

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
	 
<body>
<div class="wangid_conbox">
	<!-- 当前位置 -->
	<div class="zy_weizhi bord_b">
		<i class="fa fa-home fa-3x"></i>
		<a>首页</a>
		<a>原材料管理</a>
		<span>需补货列表</span>
	</div>
	<!-- 筛选 --> 
	<div class="shuaix">
		
		<div class="right">
			<input type="text" placeholder="请输入关键词查询">
			<a href="#">查询</a>
		</div>
	</div>
	
	<table class="layui-table" lay-filter="mylist" lay-size="lg">
		<thead>
			<tr>
				<th lay-data="{type:'checkbox',fixed:'left'}"></th>
				<th lay-data="{field:'yx', align:'center',width:130}">编号</th>
				<th lay-data="{field:'time',align:'center', minWidth:170}">名称</th>
				<th lay-data="{field:'www',align:'center',minWidth:130}">图片</th>
				<th lay-data="{field:'company',align:'center',minWidth:260}">数量</th>
				<th lay-data="{field:'user',align:'center',width:130}">说明</th>
				<th lay-data="{field:'tel',align:'center',width:130}">价格</th>
				<th lay-data="{field:'result',align:'center',minWidth:260}">警告数</th>
				<th lay-data="{field:'addr',align:'center',minWidth:260}">供货商id</th>
				<th lay-data="{field:'option',align:'center',width:130,toolbar:'#barDemo',fixed: 'right'}">操作</th>
			</tr> 
		</thead>
		<tbody id="xbh">
                <tr v-for="PurchasingOrder in addgoods" > 
                    
                    <td></td>
                    <td > <a href="/purchasingOrder/getporderId?porderId=${porder.porderId}">修改</a>丨<a href="">删除</a>丨<a href="javascript:;" style="color:#205b9e;" onclick="Vip_xq()">详情</a> </td>
                    <td>{{PurchasingOrder.porderId}}</td>
                
                    <td>{{PurchasingOrder.payQk}}</td>
                    <td>{{PurchasingOrder.porderJz}}</td>
                    <td>{{PurchasingOrder.porderTime}}</td>
                    <td>{{PurchasingOrder.jhAddress}}</td>
                    <td>{{PurchasingOrder.pMassage}}</td>
                    
                   
                </tr> 
                
              
                
            </tbody>  
	</table>
	<script type="text/html" id="barDemo">
		<a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script> 
</div> 

<script >
new Vue({
	 el:"#xbh",
	data:{	
		addgoods:[]		
	},
	methods:{	 
	},
    created:function(){
        this_a=this
        $.ajax({
            type: "GET",
            url: "/xbugoods/addgoodslist",
            data: null,
            dataType: "json",
            success: function (response) {
            	this_a.addgoods=response;
            	console.log(response);
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
		  height: 'full-130' //高度最大化减去差值,也可以自己设置高度值：如 height:300
		  ,count: 50 //数据总数 服务端获得
		  ,limit: 10 //每页显示条数 注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
		  ,page:true //开启分页
		  ,
		  defaultToolbar:['filter', 'exports']
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
			case 'add': 
				//iframe窗 
				layer.open({
				type: 2,//层类型
				title: "添加信息",//标题
				closeBtn: 1, //不显示关闭按钮
				shade: [0.3],//遮罩
				skin: 'demo_class_color',//iframe皮肤
				shadeClose:Boolean,//点击遮罩关闭
				area: ['800px', '460px'],
				// offset: 'rb', //右下角弹出
				// time: 2000, //2秒后自动关闭
				anim: 5,//动画
				content: ['goods_add.jsp', 'no'], //iframe的url，no代表不显示滚动条 
				});
				// 
			break;
			case 'update':
				if(data.length === 0){
				layer.msg('请选择一行');
				} else if(data.length > 1){
				layer.msg('只能同时编辑一个');
				} else {
				layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
				}
			break;
			case 'delete':
				if(data.length === 0){
				layer.msg('请选择一行');
				} else {
				layer.msg('删除');
				}
			break;
			};
		});
	}); 
</script> 


</body>

</html>

</body>
</html>
