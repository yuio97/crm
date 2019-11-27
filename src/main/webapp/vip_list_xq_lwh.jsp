<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
	<title>CRM系统</title>

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
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body style="background: #fff;">
<div class="tianjia_xx" id="cc">
    <table class="if_tianjiatext layui-table" lay-size="lg"> 
    <tbody>
        <tr>
            <td  class="td_1">选择客户</td> 
            <td>
            <select @change="changecustomer()" v-model="predata.customerId" >
            	<option value="-1">请选择</option>
            	<option :value="customer.customerId" v-for="(customer,i) in cus" :key="i">{{customer.customerName}}</option>
            </select>
            </td>
        </tr>
        <tr>
            <td  class="td_1">客户电话</td> 
            <td>{{cur.customerIphone}}</td>
        </tr>
        <tr>
            <td  class="td_1">客户邮箱</td> 
            <td>{{cur.customerEmal}}</td>
        </tr>
        <tr>
            <td  class="td_1">公司名称</td> 
            <td>{{cur.copanyName}}</td>
        </tr>
        <tr>
            <td  class="td_1">公司地址</td> 
            <td>{{cur.copanyAdress}}</td>
        </tr>
        <tr>
            <td  class="td_1">预购时间</td> 
            <td><input type="text" class="layui-input"  id="test2"  placeholder="yyyy-MM-dd"></td>
        </tr>
        <tr>
            <td  class="td_1">截至时间</td> 
            <td><input type="text" class="layui-input"  id="test3"  placeholder="yyyy-MM-dd"></td>
        </tr>
        <tr>
            <td  class="td_1">预购单说明</td> 
            <td><textarea rows="5" cols="45" v-model="predata.preorderNote" placeholder="请输入预购单说明"></textarea></td>
        </tr>
        <tr>
            <td  class="td_1">预付定金</td> 
            <td><input type="text" placeholder="请登记预付定金(可为空)" v-model="predata.payCase"></td>
        </tr>
        <tr>
            <td  class="td_1">商品选择</td> 
            <td>
            	<table>
            		<tr>
            			<td><input type="checkbox"></td>
            			<td>商品</td>
            			<td>价格</td>
            			<td>请输入预购数量</td>
            		</tr>
            		
            		<tr v-for="(good,j) in goods" :key=j>
            			<td><input type="checkbox" v-model="goodsId" :value="good.kcgoodsId"></td>
            			<td>{{good.kgoodsName}}</td>
            			<td>{{good.jxj}}</td>
            			<td><input type="text" :id="'kcNum'+good.kcgoodsId" :placeholder="'当前库存数量：'+good.kcNum"></td>
            		</tr>
            	</table>
			</td>
        </tr>
       
        <tr >
        	<td colspan="2">
        	<button class="layui-btn layui-btn-sm" @click="queding()">确定</button>
        	<button class="layui-btn layui-btn-sm" >取消</button>
        	</td>
        </tr>
    </tbody>
    </table>
</div>

<script src="layui/layui.js"></script>

<script>
var v = new Vue({
    el:'#cc',
    data:{
		cus:[],
		cur:{},
		goods:[],
		goodsId:[],
		predata:{
			customerId:'-1',
			preorderTme:'',
			deliveryTime:'',
			preorderNote:'',
			payCase:'',
			proDetaList:[]
			
		}
    },
    methods:{
    	changecustomer:function(){
			for (var i = 0; i < this.cus.length; i++) {
				if(this.cus[i].customerId == this.predata.customerId)
					{
						this.cur = this.cus[i];
					}
			}
			
		},
		
		queding:function(){
			this.predata.proDetaList = [];
			for(var i = 0; i < this.goodsId.length; i++)
			{
				var goodNUm = document.getElementById('kcNum'+this.goodsId[i]).value;
				var goodData = {kgoodsId:this.goodsId[i],kcNumSell:goodNUm};
				this.predata.proDetaList.push(goodData);
			}
			var _this = this;
			$.ajax({
	            type: "POST",
	            url: "preorder/addPreOrder",
	            data: JSON.stringify(_this.predata),
	            contentType:'application/json',
	            dataType: "json",
	            success: function (response) {
	            	location.href="/vip_list_lwh.jsp";
	            }
	        });
			
		}
		
    },
    created:function(){
    	var _this = this
        $.ajax({
            type: "POST",
            url: "preorder/selectadd",
            data: null,
            dataType: "json",
            success: function (response) {
            	_this.cus = response.cus;
            	_this.goods = response.goodsNum;
            }
        });
    }

});
</script>

</body>
</html>
<script>
layui.use('laydate', function(){
  var laydate = layui.laydate; 
  //常规用法
  laydate.render({
    elem: '#test1'
  });
   //常规用法
   laydate.render({
    elem: '#test2',
    done: function(value, date, endDate){
       v.predata.preorderTme = value;
     }
  });
   //常规用法
   laydate.render({
    elem: '#test3',
    done: function(value, date, endDate){
        v.predata.deliveryTime = value;
      }
  });
});
</script>