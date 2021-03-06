<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basepath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
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
<div class="tianjia_xx" id="uu">
	<c:forEach items="${date }" var="i">
    <table class="if_tianjiatext layui-table" lay-size="lg"> 
    <tbody>
        <tr>
        	
            <td  class="td_1">客户姓名<input type="hidden" id="tt" value="${i.preorderId }"></td> 
            <td>
            	${i.customer.customerName }
            </td>
        </tr>
        <tr>
            <td  class="td_1">客户电话</td> 
            <td>${i.customer.customerIphone }</td>
        </tr>
        <tr>
            <td  class="td_1">客户邮箱</td> 
            <td>${i.customer.customerEmal }</td>
        </tr>
        <tr>
            <td  class="td_1">公司名称</td> 
            <td>${i.customer.copanyName }</td>
        </tr>
        <tr>
            <td  class="td_1">公司地址</td> 
            <td>${i.customer.copanyAdress }</td>
        </tr>
        <tr>
            <td  class="td_1">预购时间</td> 
            <td><fmt:formatDate value="${i.preorderTme }" pattern="yyyy-MM-dd" /></td>
        </tr>
        <tr>
            <td  class="td_1">截至时间</td> 
            <td><input type="text" class="layui-input"  id="test3"  placeholder="请输入截止时间"  value="<fmt:formatDate value="${i.deliveryTime }" pattern="yyyy-MM-dd" />"></td>
        </tr>
        <tr>
            <td  class="td_1">预购单说明</td> 
            <td><textarea rows="5" cols="45"  placeholder="请输入预购单说明" id="sm"  value="${i.preorderNote }">${i.preorderNote }</textarea></td>
        </tr>
        <tr>
            <td  class="td_1">预付定金</td> 
            <td><input type="text" placeholder="请登记预付定金(可为空)"  id="yf" value="${i.payCase }"></td>
        </tr>
        <tr>
            <td  class="td_1">商品选择</td> 
            <td>
            	<table>
            		<tr>
            			<td>商品</td>
            			<td>价格</td>
            			<td>预购数量</td>
            			<td>库存数量</td>
            		</tr>
            		<c:forEach items="${i.proDetaList }" var="d">
            		<tr >
            			<td>${d.kcgoods.kgoodsName }</td>
            			<td>${d.kcgoods.jxj }</td>
            			<td>
            			<input type="text" value="${d.kcNumSell }" id="${d.kcgoods.kcgoodsId }" name="sell">
            			</td>
            			<td>${d.kcgoods.kcNum }</td>
            		</tr>
            		</c:forEach>
            	</table>
            	
			</td>
        </tr>
       
        <tr >
        	<td colspan="2">
        	<button class="layui-btn layui-btn-sm" @click="queding()">确定</button>
        	<a class="layui-btn layui-btn-sm" href="vip_list_lwh.jsp">取消</a>
        	</td>
        </tr>
    </tbody>
    </table>
    </c:forEach>
</div>

<script src="layui/layui.js"></script>

<script>

var v = new Vue({
	el:'#uu',
	data:{
		preupdate:{
			preorderId:'',
			deliveryTime:'',
			preorderNote:'',
			payCase:'',
			proDetaList:[]
		}
	},
	methods:{
		queding:function(){
			
			var preorderId = document.getElementById("tt").value;
			var deliveryTime = document.getElementById("test3").value;
			var preorderNote = document.getElementById("sm").value;
			var payCase = document.getElementById("yf").value;
			
			this.preupdate.preorderId = preorderId;
			this.preupdate.deliveryTime = deliveryTime;
			this.preupdate.preorderNote = preorderNote;
			this.preupdate.payCase = payCase;
			
			this.preupdate.proDetaList = [];
			var sells = document.getElementsByName("sell");
			for(var i = 0; i < sells.length; i++)
			{
				var goodNUm = sells[i].value;
				var goodData = {kgoodsId:sells[i].id,kcNumSell:goodNUm};
				this.preupdate.proDetaList.push(goodData);
			}
			
			var _this = this;
			$.ajax({
	            type: "POST",
	            url: "preorder/updateOrder",
	            data: JSON.stringify(_this.preupdate),
	            contentType:'application/json',
	            dataType: "json",
	            success: function (response) {
					location.href="vip_list_lwh.jsp";
	            }
	            })
		}
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