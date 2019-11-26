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
    <title>ck</title>

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
            <a>仓库管理</a>
            <span>仓库信息修改</span>
        </div>
        <!-- 筛选 --> 
        <div class="shuaix">
            <!-- <div class="left"  style="margin-right:10px;">
               
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
               
                <select>   
                    <option value="公司名称">公司名称</option>   
                    <option value="其他">其他</option>   
                </select>
            </div>   -->
            <!-- <div class="center">统计：【大：20 中：30 小：60】</div> -->
            <!-- <div class="right">
                <input type="text" placeholder="请输入供应商的名称">
                <a href="#">查询</a>
            </div> -->
        </div>
        <!-- 下面写内容 -->
      <div class="kehubh_tj_k">
            <form class="layui-form layui-form-pane" action="update/updateWarehouse" enctype="multipart/form-data" method="post">
            <ul> 
             <input type="hidden" name="warehouseId" value="${selectById.warehouseId}">
                 
                <li>
                    <div class="left">仓库名称：</div>
                    <div class="right"> 
                        <input type="text" value="${selectById.warehouseName}" name="warehouseName"  required lay-verify="required"  autocomplete="off" class="layui-input">   
                    </div>
                </li>
               
                 <li>
                    <div class="left">仓库类型：</div>
                    <div class="right"> 
                        <input type="text" name="warehouseType" value="${selectById.warehouseType}" required lay-verify="required"  autocomplete="off" class="layui-input">   
                    </div>
                </li>
                 
               
                <li>
                    <div class="left"> &nbsp;</div>
                    <div class="right" > 
                        <button class="button_qr" type="submit">  确定修改</button>
                        
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