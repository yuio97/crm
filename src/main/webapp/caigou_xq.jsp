<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
    String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<base href="<%=basepath %>" />

	<meta charset="utf-8">
	<meta name="renderer" content="webkit"/>
	<meta name="force-rendering" content="webkit"/>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="名榜,wangid">
	<title>xq</title>

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
	<script  type="text/javascript" src="js/vue.min.js"></script>
</head>

<body style="background: #fff;">
<div class="tianjia_xx">
    <table class="if_tianjiatext layui-table" lay-size="lg"> 
    <tbody>
        <tr>
            <td class="td_1">原材料名称</td>
            <td  class="td_1">购买的数量</td>  
            <td  class="td_1">原材料的价格</td>
            <td  class="td_1">供货商名称</td>
           
        </tr>
        <tr id="xs">
	   		 <td> </td>
	       	 <td> </td>
	       	 <td> </td>
        </tr>
       
    </tbody>
    </table>
</div>
<script type="text/javascript">
	 new Vue({
		 el:"#xs",
	 	data:{
	 		
	 		
	 			
	 	},
	 methods:{
		 
	 },
	 
		    created:function(){
		    	console.log("sdfsd");
		       this_a=this
		        $.ajax({
		            type: "GET",
		            url: "/purchasingOrder/getpurchasingxqList",
		            data: null,
		            dataType: "json",
		            success: function (response) {
		            	this_a.supplier=response;
		            	console.log(response);
		            }
		        });
		    }


		  })
</script> 
</body>

</html>
    
