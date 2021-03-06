<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<body>
	<body style="background: #fff;">
<div class="tianjia_xx" id="cc">
<c:forEach items="${date }" var="i">
    <table class="if_tianjiatext layui-table" lay-size="lg"> 
    <tbody>
        <tr>
            <td  class="td_1">客户姓名</td> 
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
            <td><fmt:formatDate value="${i.deliveryTime }" pattern="yyyy-MM-dd" /></td>
        </tr>
        <tr>
            <td  class="td_1">预购单说明</td> 
            <td>${i.preorderNote }</td>
        </tr>
        <tr>
            <td  class="td_1">预付定金</td> 
            <td>${i.payCase }</td>
        </tr>
        <tr>
            <td  class="td_1">商品选择</td> 
            <td>
            	<table>
            		<tr>
            			<td>商品</td>
            			<td>价格</td>
            			<td>预购数量</td>
            			<td>当前库存量</td>
            		</tr>
            		<c:forEach items="${i.proDetaList }" var="j">
            		<tr>
            			<td>${j.kcgoods.kgoodsName }</td>
            			<td>${j.kcgoods.jxj }</td>
            			<td>${j.kcNumSell }</td>
            			<td>${j.kcgoods.kcNum }</td>
            		</tr>
            		</c:forEach>
            	</table>
            	</c:forEach>
			</td>
        </tr>
       
       
    </tbody>
    </table>
</div>

<script src="layui/layui.js"></script>


</body>
</html>