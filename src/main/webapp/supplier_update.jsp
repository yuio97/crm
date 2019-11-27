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
    <title>supplier</title>

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
            <a>供应商信息管理</a>
            <span>供应商信息修改</span>
        </div>
        <!-- 筛选 --> 
        <div class="shuaix">
           
        </div>
        <!-- 下面写内容 -->
       <div class="kehubh_tj_k">
            <form class="layui-form layui-form-pane" action="/update/updateSupplier"  method="get">
            <ul> 
                  <input type="hidden" name="supplierId" value="${supplierList.supplierId}">
                <li>
                    <div class="left">供应商名称：</div>
                    <div class="right"> 
                        <input type="text" name="supplierName" value="${supplierList.supplierName}" required lay-verify="required"  autocomplete="off" class="layui-input">   
                    </div>
                </li>
                
                 <li>
                    <div class="left">联系人：</div>
                    <div class="right"> 
                        <input type="text" name="supeople" value="${supplierList.supeople}" required lay-verify="required"  autocomplete="off" class="layui-input">   
                    </div>
                </li>
                 
                <li>
                    <div class="left">联系电话：</div>
                    <div class="right"> 
                        <input type="text" name="supplierTel" value="${supplierList.supplierTel}" required lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                    <div class="left">地址：</div>
                    <div class="right"> 
                        <input type="text" name="supplierAddress" value="${supplierList.supplierAddress}" required lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </li>
               
               
                <li>
                     <div class="left">邮箱：</div>
                     <div class="right"> 
                         <input type="text" name="supplierEmail" value="${supplierList.supplierEmail}" required lay-verify="required"  autocomplete="off" class="layui-input">
                     </div>
                </li>
                <li>
                    <div class="left"> &nbsp;</div>
                    <div class="right" id="tj"> 
                        <button class="button_qr" @click="add" type="submit">  确定修改</button>
                    </div>
                </li>
            </ul> 
            </form>
        </div>

    </div> 
<!-- 自定义头部工具栏 -->
    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container"> 
            <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">删除</button> 
        </div>
    </script> 
    <!-- layui js -->
    <script src="layui/layui.js"></script>
    
</body>

</html>
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
    function Vip_xq(){
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
            content: ['vip_list_xq.html', 'no'], //iframe的url，no代表不显示滚动条 
        }); 
        
    }
    //  iframe层  回访记录
    function Vip_hf(){
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
            content: ['vip_list_hf.html', 'no'], //iframe的url，no代表不显示滚动条 
        }); 
        
    }
 
</script> 



</body>
</html>