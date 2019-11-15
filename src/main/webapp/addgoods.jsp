<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <meta name="description" content="名榜,wangid"><title>Insert title here</title>
	 <title>添加原材料</title>
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
            <a>原材料信息管理</a>
            <span>添加原材料信息</span>
        </div>
        <!-- 内容 -->    
		<div class="tianjia_xx vip_luru">
			<table class="if_tianjiatext layui-table"   lay-size="lg"> 
				<tbody>
					<tr>
						<td class="td_1" style="width: 50px;">原材料名称</td> 
						<td colspan="2"><input type="text" name="goodsName" id="goodsName"></td>
                        <td class="td_1 td_border" >原材料图片</td> 
						<td colspan="2"><input type="file" name="goodsImg" id="goodsImg "></td>
						
                    </tr> 
                        <td class="td_1 td_border">原材料价格</td> 
                        <td colspan="2"><input type="text" name="goodsPrice" id="goodsPrice"></td>
                        <td class="td_1 td_border" style="width: 50px;">原材料数量</td> 
						<td colspan="2"><input type="text" name="goodsNum" id="goodsNum"></td>
                    <tr>
                        
                    </tr>
					<tr>
						<td class="td_1 td_border">原材料禁戒线</td> 
						<td colspan="2"><input type="text" name="goodsMin" id="goodsMin"></td>
                        <td class="td_1 td_border">供应商类型</td> 
						<td colspan="2">
							<div class="layui-input-inline">
								<select name="quiz1">
									<option value="请选择产品类型">请选择供应商类型</option>
									<option value="型">类型1</option>
									<option value="类型1">类型1</option>  
									<option value="类型2">类型2</option> 
								</select>
							</div>
						</td>
					<tr>
						<td class="td_1 td_border">生产日期</td> 
						<td colspan="2"> 
							<input type="text" class="layui-input"  id="test1" placeholder="yyyy-MM-dd">
						</td>
						
						<td class="td_1 td_border">规格说明</td> 
						<td colspan="2"><input type="text" name="goodsSm" id="goodsSm"></td>
					</tr> 
					
					<tr class="tianjie_button">
						<td colspan="4" style="border-right:1px solid #e6e6e6;">
							<button id="save" >保存</button>
							<button>取消</button>
						</td>  
					</tr>
				</tbody>
			</table>
		</div>
	</div>  
	
	
    <script src="layui/layui.js"></script>
    
</body>

</html>


<script>
 $(document).ready(function () {
    
   

    
    $('#save').click(function () { 
            
        var goods = {
            goodsName:$('#goodsName').val(),
            goodsImg:$('#goodsImg').val(),
            goodsPrice:$('#goodsPrice').val(),
            goodsNum:$('#goodsNum').val(),
            goodsMin:$('# goodsMin').val(),
            goodsSm:$('#goodsSm').val(),
            
        };  
        $.ajax({
            type: "post",
            url: "/crm_project/goods/addgoods",
            data: goods,
            dataType: "json",
            success: function (response) {
                if(response.state)
                {
                    alert('操作成功');
                   
                }
            }
        });
    });

  
});  

layui.use('laydate', function(){
  var laydate = layui.laydate; 
  //常规用法
  laydate.render({
    elem: '#test1'
  });
   //常规用法
   laydate.render({
    elem: '#test2'
  });
   //常规用法
   laydate.render({
    elem: '#test3'
  });
});
</script>


</body>
</html>
