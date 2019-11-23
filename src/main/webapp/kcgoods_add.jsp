<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<base href="<%=basepath %>" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
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
    <link rel="stylesheet" href="layui/css/layui.css">
    <script type="text/javascript" src="js/vue.min.js"></script>
     <script src="js/jquery-1.11.0.min.js"></script>
    
</head>

<body>
    <div class="wangid_conbox">
        <!-- 当前位置 -->
        <div class="zy_weizhi bord_b">
            <i class="fa fa-home fa-3x"></i>
            <a>首页</a>
            <a>仓库管理</a>
            <span>商品信息添加</span>
        </div>
        <!-- 内容 -->    
        <div class="wenxts_ke">
           
        </div>
        <div class="kehubh_tj_k">
            <form class="layui-form layui-form-pane" action="kc/addgoods" enctype="multipart/form-data" method="post">
            <ul> 
                  
                <li>
                    <div class="left">仓库编号：</div>
                    <div class="right"> 
                        <input type="text" name="warehouseId" required lay-verify="required"  autocomplete="off" class="layui-input">   
                    </div>
                </li>
                <li>
                    <div class="left">商品名称：</div>
                    <div class="right"> 
                        <input type="text" name="kgoodsName" required lay-verify="required"  autocomplete="off" class="layui-input">   
                    </div>
                </li>
                <li>
                    <div class="left">商品说明：</div>
                    <div class="right"> 
                        <input type="text" name="kgoodsSm" required lay-verify="required"  autocomplete="off" class="layui-input">   
                    </div>
                </li>
                <li>
                    <div class="left">商品数量：</div>
                    <div class="right"> 
                        <input type="text" name="kgoodsNum" required lay-verify="required"  autocomplete="off" class="layui-input">   
                    </div>
                </li>
                <li>
                    <div class="left">单位：</div>
                    <div class="right"> 
                        <input type="text" name="danwei" required lay-verify="required"  autocomplete="off" class="layui-input">   
                    </div>
                </li>
                
                 <li>
                    <div class="left">商品价格：</div>
                    <div class="right"> 
                        <input type="text" name="jxj" required lay-verify="required"  autocomplete="off" class="layui-input">   
                    </div>
                </li>
                 
                
                <li>
                    <div class="left">备注：</div>
                    <div class="right"> 
                        <input type="text" name="kcMassage" required lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </li>
               
                <li>
                    <div class="left"> &nbsp;</div>
                    <div class="right" id="tj"> 
                        <button class="button_qr" @click="add" type="submit">  确定添加</button>
                    </div>
                </li>
            </ul> 
            </form>
        </div>
    </div>   
    <style>
     
 .layui-form-pane .layui-form-checkbox {
    margin: 12px 0 4px 10px!important;
}
    </style>
	
    <script src="layui/layui.js"></script>
     <script >
     var vm = new Vue({
    	 el:'#tj',
    	 data:{},
    	 methods:{
    		 add:function(){
    			 
    		 }
    	 }
     
    	 
     })
     </script>
</body>

</html>

<script>
        layui.use(['form', 'layedit', 'laydate'], function(){
          var form = layui.form
          ,layer = layui.layer
          ,layedit = layui.layedit
          ,laydate = layui.laydate;
          laydate.render({
        	    elem: '#test3'
        	  });
        });
        </script>
        <script>

  
   

</script>
<script>
new Vue({
    el:'#xz',
    data:{
        supplier:[]
    },
    methods:{

    },
    created:function(){
       this_a=this;
        $.ajax({
            type: "GET",
            url: "/supplier/getSupplierList",
            data: null,
            dataType: "json",
            success: function (response) {
            	this_a.supplier=response;
            	console.log(this_a.supplier);
            }
        });
    }


  })
</script>
  
</body>
</html>
