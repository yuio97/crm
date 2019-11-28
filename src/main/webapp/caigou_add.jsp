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
            <form class=" layui-form-pane" >
            <ul  id="caigougood" > 
                  
                <li>
                    <div class="left">采购地点：</div>
                    <div class="right"> 
                        <input type="text" v-model="caigougood.jhAddress"  required lay-verify="required"  autocomplete="off" class="layui-input">   
                    </div>
                </li>
                 <li>
                    <div class="left">采购时间：</div>
                    <div class="right"> 
                       <input type="text" class="layui-input" v-model="caigougood.porderTime"   id="test3" placeholder="">   
                    </div>
                </li>
                <li>
                    <div class="left">进货时间：</div>
                    <div class="right"> 
                       <input type="text" v-model="caigougood.jhTime" class="layui-input"  id="test2" placeholder="">   
                    </div>
                </li>
                 <li style="height: 38px; overflow:initial;">
                    <div class="left">采购进展：</div>
                    <div  class="right">
                   		 <select v-model="caigougood.porderJz"    id="porderJz" style="height: 37.5px;">
                                <option  value="1" selected>待采购</option>
                                <option value="0">已采购</option>
                                
                            </select>
                     </div>
 
                </li>
               
                
                 <!-- <li style="height: 38px; overflow:initial;">
                  <div class="left">操作人员：</div>
                  
	                 <div class="right" id="yg"> 
                            <select name="sysStaffId" lay-verify="" style="height: 37.5px;">
                              <option v-for="sys in sysStaff" >{{sys.sysStaffId}}</option>
                            </select> 
                        </div>
					 </li> --> 
               
                <li style="height: 38px; overflow:initial;">
                  <div class="left">支付方式：</div>
                  
	                 <div class="right"> 
                            <select v-model="caigougood.payQk"   style="height: 37.5px;">
                                <option value="现金" >现金</option>
                                <option value="银行">银行卡</option>
                               	<option value="支付宝">支付宝</option>
                            </select> 
                        </div>
					 </li> 
                
               <li>
                    <div class="left">备注：</div>
                    <div class="right"> 
                        <input type="text" v-model="caigougood.pMassage"name="pMassage" required lay-verify="required"  autocomplete="off" class="layui-input">   
                    </div>
                </li>
               
                
                <li>
                    <table class="layui-table"  lay-size="xs">
                     <thead>
                	<tr> 
                    
                   <th><input type="checkbox" ></th>
                    <th >原材料编号</th>
                    <th >原材料名称</th>
                    <th >原材料单价</th>
                    <th >原材料数量</th>
                    <th >原材料警告数</th>
                    <th >需采购的数量</th>
                     <th >采购金额</th>
                     <th >采购的备注</th>
                    
       
                </tr> 
            </thead>
            <tbody >
                     
           			<tr v-for="g in goods">
           			 <td><input type="checkbox" :value="g.goodsId" name="goodsIds"></td>
                     <td>{{g.goodsId}}</td>
                     <td>{{g.goodsName}}</td>
                      <td>{{g.goodsPrice}}</td>
                     <td>{{g.goodsNum}}</td>
                     <td>{{g.goodsMin}}</td>
                     <td><input type="text" :id="'goodsNum'+g.goodsId" value="0" placeholder="请输入需要购买的数量："  :oninput="'showPrice(this,'+g.goodsId+','+g.goodsPrice+')'" ></td>
                     <td><input type="text" :id="'goodsPrice'+g.goodsId" value="0" readonly="readonly" placeholder=""></td>
                     <td><input type="text" :id="'pxMassage'+g.goodsId" placeholder="备注"></td>
                     </tr>
                     </tbody>
                    </table>
                </li>
                <li>
                    <div class="left"> &nbsp;</div>
                    <div class="right" id="tj"> 
                        <button class="button_qr"  type="button" @click="add">  确定添加</button>
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
    /*     layui.use(['laydate'], function(){
          var laydate = layui.laydate;
          laydate.render({
        	    elem: '#test3'
        	  });
          laydate.render({
        	    elem: '#test2'
        	  });
        }); */
        </script>

<script>
new Vue({
    el:'#caigougood',
    data:{
    	caigougood:{
    		jhAddress:'',
    		porderTime:'',
    		jhTime:'',
    		porderJz:'',
    		payQk:'',
    		pMassage:'',
    		purchasingXq:[]
    		
    	},
        goods:[],
       
    },
    methods:{
		
    	add:function(){
			this.caigougood.purchasingXq = [];
			var goodsIds = document.getElementsByName("goodsIds");
			for(var i = 0; i < goodsIds.length; i++)
			{
				var g = goodsIds[i];
				if(g.checked)
				{
					var num = document.getElementById('goodsNum'+g.value).value;
					var price = document.getElementById('goodsPrice'+g.value).value;
					var massage = document.getElementById('pxMassage'+g.value).value;
					var data = {goodsId:g.value,goodsNum:num ,goodsPrice:price,pxMassage:massage};
					this.caigougood.purchasingXq.push(data);
					
					
				}
			}
			
			var _this = this;
			console.log(this.caigougood);
			$.ajax({
	            type: "POST",
	            url: "purchasingOrder/addpo",
	            data: JSON.stringify(_this.caigougood),
	            contentType:'application/json',
	            dataType: "json",
	            success: function (response) {
	            	location.href="/caigou_add.jsp";
	            }
	        });
			
		}
		
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
            	console.log(this_a.goods);
            }
        });
    }


  })
  
	function showPrice(inp,id,price)
	{
		var num = inp.value;
		if(!isNaN(num))
		{
			document.getElementById("goodsPrice"+id).value = num * price;
		}
	}


</script>

</body>
</html>
