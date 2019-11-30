<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
    <title>WangID办公管理系统</title>
    
     <!-- CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/children.css">

    <!-- 在线图标库 地址：http://fontawesome.dashgame.com/-->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- layui css -->
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
</head>
<body>
<div class="wangid_conbox" id="cc">
        <!-- 当前位置 -->
        <div class="zy_weizhi bord_b">
            <i class="fa fa-home fa-3x"></i>
            <a>首页</a>
            <a>员工管理</a>
            <span>客户添加</span>
        </div>
        <!-- 内容 -->    
        <div class="wenxts_ke">
            <p><i>用笑服务客户：</i>欢迎来到客户添加界面</p>
        </div>
        <div class="kehubh_tj_k">
            <form class="layui-form layui-form-pane" action="">
            <ul> 
                
                
                <li>
                    <div class="left">客户姓名：</div>
                    
                    <div class="right"> 
                        <input type="text" name="title" required lay-verify="required" v-model="cuslist.customerName" id="customerName" placeholder="请输入客户姓名" autocomplete="off" class="layui-input">
                    </div>
                </li>
                
                <li>
                    <div class="left">客户公司：</div>
                    <div class="right"> 
                        <input type="text" name="title" required lay-verify="required" v-model="cuslist.copanyName" id="copanyName" placeholder="请输入客户公司的名称" autocomplete="off" class="layui-input">
                    </div>
                </li>
                
                <li>
                    <div class="left">公司地址：</div>
                    <div class="right">
                            <input type="text" name="title" required lay-verify="required" v-model="cuslist.copanyAdress" id="copanyAdress" placeholder="请填写客户公司所在地址" autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                    <div class="left">公司代码：</div>
                    <div class="right">
                            <input type="text" name="title" required lay-verify="required" v-model="cuslist.copanyCode" id="copanyCode" placeholder="请填客户公司的公司代码" autocomplete="off" class="layui-input">
                    </div>
                </li>
               
                <li>
                    <div class="left">联系电话：</div>
                    <div class="right">
                            <input type="text" name="title" required lay-verify="required" v-model="cuslist.customerIphone" id="customerIphone" placeholder="请填写客户的联系电话" autocomplete="off" class="layui-input">
                    </div>
                </li>
                
                <li>
                    <div class="left">电子邮件：</div>
                    <div class="right">
                            <input type="text" name="title" required lay-verify="required" v-model="cuslist.customerEmal" id="customerEmal" placeholder="请填写客户的电子邮件" autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                    <div class="left"> &nbsp;</div>
                    <div class="right"> 
                        <button type="button" class="button_qr" @click="tianjia">确定添加</button>
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
	<!-- houl --> 
	<!-- 结束 -->
    <!-- layui js -->
    <script src="layui/layui.js"></script>
    
    
    
    
    <script>
    var v = new Vue({
    	el:'#cc',
    	data:{
    		cuslist:{
    			customerName:'',
    			copanyName:'',
    			copanyAdress:'',
    			copanyCode:'',
    			customerIphone:'',
    			customerEmal:'',
    			customerState:''
    		}
    	},
    	methods:{
    		tianjia:function(){
    			var _this = this;
    			
                $.ajax({
    				type: "POST",
    				url: "cus/addcus",
    				data: _this.cuslist,
    				dataType: "json",
    				success: function (response) {
							location.href="YuanGonglist_kehu.jsp"
    				}
    			});
    		}
    		
    		
    	}
    });
    
    </script>
    
    
    
    
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