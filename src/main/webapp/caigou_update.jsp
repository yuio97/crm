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
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="js/vue.min.js"></script>
    
</head>

<body>
    <div class="wangid_conbox">
          <div class="zy_weizhi bord_b">
            <i class="fa fa-home fa-3x"></i>
            <a>首页</a>
            <a>采购管理</a>
            <span>采购信息修改</span>
        </div>
        <div class="wenxts_ke">
           
        </div>
        <div class="kehubh_tj_k">
            <form class="layui-form layui-form-pane" action="update/updatePurchasingOrder" enctype="multipart/from-data" mothed="post">
            <ul> 
                  <input type="hidden" name="porderId" value="${porder.porderId}">
                   <li>
                    <div class="left">采购地点：</div>
                    <div class="right"> 
                        <input type="text" name="jhAddress"  value="${porder.jhAddress}"required lay-verify="required"  autocomplete="off" class="layui-input">   
                    </div>
                </li>
                 <li>
                    <div class="left">采购时间：</div>
                    <div class="right"> 
                       <input type="text" class="layui-input" value="${porder.porderTime}"name="porderTime"  id="test3" placeholder="yyyy-MM-dd">   
                    </div>
                </li>
                <li>
                    <div class="left">进货时间：</div>
                    <div class="right"> 
                       <input type="text"  class="layui-input" name="jhTime"  value="${porder.jhTime}"id="test2" placeholder="yyyy-MM-dd">   
                    </div>
                </li>
                 <li style="height: 38px; overflow:initial;">
                    <div class="left">采购进展：</div>
                    <div class="right">
                   		 <select name="porderJz"  value="${porder.porderJz}"lay-verify="">
                                <option value="1">待采购</option>
                                <option value="2">已采购</option>
                            </select>
                            </div> 
                </li>
               
                
                <li>
                    <div class="left">操作人员：</div>
                    
                    <div class="right"> 
                        <input type="text" name="sysStaffId" value="${porder.sysStaffId}" required lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </li>
               
                <li style="height: 38px; overflow:initial;">
                  <div class="left">支付方式：</div>
                  
	                 <div class="right"> 
                            <select name="payQk" lay-verify="" value="${porder.payQk}">
                                <option value="1">现金</option>
                                <option value="2">银行卡</option>
                               	<option value="3">支付宝</option>
                            </select> 
                        </div>
					 </li> 
                
               <li>
                    <div class="left">备注：</div>
                    <div class="right"> 
                        <input type="text" name="pMassage" value="${porder.pMassage}" required lay-verify="required"  autocomplete="off" class="layui-input">   
                    </div>
                </li>
               
                <li>
                    <div class="left"> &nbsp;</div>
                    <div class="right" id="tj"> 
                        <button class="button_qr"  type="submit">  确定修改</button>
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
    
</body>

</html>
<script>
        layui.use(['form', 'layedit', 'laydate'], function(){
          var form = layui.form
          ,layer = layui.layer
          ,layedit = layui.layedit
          ,laydate = layui.laydate;
        });
        </script>

<script type="text/javascript">
new Vue({
    el:'#xz',
    data:{
        supplier:[]
    },
    methods:{

    },
    created:function(){
       this_a=this
        $.ajax({
            type: "GET",
            url: "/supplier/getSupplierList",
            data: null,
            dataType: "json",
            success: function (response) {
            	this_a.suppiler=response;
            }
        });
    }


  })
 
</script>
 <script>
layui.use('laydate', function(){
  var laydate = layui.laydate; 
  
   laydate.render({
    elem: '#test3'
  });
});
</script>
<scirpt>


</scirpt>
</body>
</html>
