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
            <a>采购管理</a>
            <span>采购信息添加</span>
        </div>
        <!-- 内容 -->    
        <div class="wenxts_ke">
           
        </div>
        <div class="kehubh_tj_k">
            <form class=" layui-form-pane" action="/purchasingOrder/addpo"  method="post">
            <ul> 
                  
                <li>
                    <div class="left">采购地点：</div>
                    <div class="right"> 
                        <input type="text" name="jhAddress" required lay-verify="required"  autocomplete="off" class="layui-input">   
                    </div>
                </li>
                 <li>
                    <div class="left">采购时间：</div>
                    <div class="right"> 
                       <input type="text" class="layui-input" name="porderTime" id="test3" placeholder="">   
                    </div>
                </li>
                <li>
                    <div class="left">进货时间：</div>
                    <div class="right"> 
                       <input type="text"  class="layui-input" name="jhTime" id="test2" placeholder="">   
                    </div>
                </li>
                 <li style="height: 38px; overflow:initial;">
                    <div class="left">采购进展：</div>
                    <div class="right">
                   		 <select name="porderJz" lay-verify="" style="height: 37.5px;">
                                <option value="待采购">待采购</option>
                                <option value="已采购">已采购</option>
                            </select>
                            </div> 
                </li>
               
                
                 <li style="height: 38px; overflow:initial;">
                  <div class="left">操作人员：：</div>
                  
	                 <div class="right" id="yg"> 
                            <select name="sysStaffId" lay-verify="" style="height: 37.5px;">
                              <option v-for="sys in sysStaff" >{{sys.sysStaffId}}</option>
                            </select> 
                        </div>
					 </li> 
               
                <li style="height: 38px; overflow:initial;">
                  <div class="left">支付方式：</div>
                  
	                 <div class="right"> 
                            <select name="payQk" lay-verify="" style="height: 37.5px;">
                                <option value="现金">现金</option>
                                <option value="银行">银行卡</option>
                               	<option value="支付宝">支付宝</option>
                            </select> 
                        </div>
					 </li> 
                
               <li>
                    <div class="left">备注：</div>
                    <div class="right"> 
                        <input type="text" name="pMassage" required lay-verify="required"  autocomplete="off" class="layui-input">   
                    </div>
                </li>
               
                
                <li>
                    <table class="layui-table"  lay-size="xs">
                     <thead>
                	<tr> 
                    
                   <th><input type="checkbox" ></th>
                    <th >原材料编号</th>
                    <th >原材料名称</th>
                    <th >原材料数量</th>
                    <th >原材料警告数</th>
                    <th >需采购的数量</th>
                    
       
                </tr> 
            </thead>
            <tbody id="good">
                     
           			<tr v-for="g in goods">
           			 <td><input type="checkbox" :value="g.goodsId" name="goodsIds"></td>
                     <td>{{g.goodsId}}</td>
                     <td>{{g.goodsName}}</td>
                     <td>{{g.goodsNum}}</td>
                     <td>{{g.goodsMin}}</td>
                     <td><input type="text" ></td>
                     </tr>
                     </tbody>
                    </table>
                </li>
                <li>
                    <div class="left"> &nbsp;</div>
                    <div class="right" id="tj"> 
                        <button class="button_qr"  type="submit">  确定添加</button>
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
     


<script>
        layui.use(['form', 'layedit', 'laydate'], function(){
          var form = layui.form
          ,layer = layui.layer
          ,layedit = layui.layedit
          ,laydate = layui.laydate;
          laydate.render({
        	    elem: '#test3'
        	  });
          laydate.render({
        	    elem: '#test2'
        	  });
        });
        </script>
        <script>

  
   

</script>
<script>
new Vue({
    el:'#good',
    data:{
        goods:[]
    },
    methods:{

    },
    created:function(){
    	
       this_a=this;
        $.ajax({
            type: "GET",
            url: "addgoods/GoodsList",
            data: null,
            dataType: "json",
            success: function (response) {
            	this_a.goods=response;
            	console.log(this_a.supplier);
            }
        });
    }


  })
</script>
  <script>
new Vue({
    el:'#yg',
    data:{
    	sysStaff:[]
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
            	this_a.sysStaff=response;
            	
            }
        });
    }


  })
</script>
</body>
</html>
