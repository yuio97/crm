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
    <style type="text/css">
    	.out
		{
			width:100px;
			height: 100px;
			position: relative;
		}
		
		.out img,.out input
		{
			width:100px;
			height: 100px;
			position: absolute;
		}
		
		.out input
		{
			opacity:0;
		}
		
    </style>
    
</head>

<body>
    <div class="wangid_conbox">
         <div class="zy_weizhi bord_b">
            <i class="fa fa-home fa-3x"></i>
            <a>首页</a>
            <a>原材料管理</a>
            <span>原材料信息修改</span>
        </div> 
        <div class="wenxts_ke">
           
        </div>
        <div class="kehubh_tj_k">
            <form class="layui-form layui-form-pane" action="goods1/updategoods" enctype="multipart/from-data" mothed="post">
            <ul> 
                  <input type="hidden" name="goodsId" value="${goodslist.goodsId}">
                <li>
                    <div class="left">原材料名称：</div>
                    <div class="right"> 
                        <input type="text" name="goodsName" value="${goodslist.goodsName}" required lay-verify="required"  autocomplete="off" class="layui-input">   
                    </div>
                </li>
                 <li>
                    <div class="left">生产日期：</div>
                    <div class="right"> 
                       <input type="text" class="layui-input"  id="test3" value="${goodslist.goodsDate}" name="goodsDate">   
                    </div>
                </li>
                 <li>
                    <div class="left">原材料说明：</div>
                    <div class="right"> 
                        <input type="text" name="goodsSm" value="${goodslist.goodsSm}" required lay-verify="required"  autocomplete="off" class="layui-input">   
                    </div>
                </li>
                 
                <li>
                        <div class="left">图片：</div>
                        <div class="right out">
                                <img id="img" src="${goodslist.goodsImg}" >
                                <input type="file" onchange="showImg(this)" style="margin-top: 8px;" type="file" id="img" name="gImg" value="">
                        </div>
                    </li> 
                <li>
                    <div class="left">数量：</div>
                    <div class="right"> 
                        <input type="text" name="goodsNum" value="${goodslist.goodsNum}" required lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                    <div class="left">价格：</div>
                    
                    <div class="right"> 
                        <input type="text" name="goodsPrice" value="${goodslist.goodsPrice}" required lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </li>
               
                <li style="height: 38px; overflow:initial;">
                    <div class="left">状态：</div>
                     <div class="right"> 
                            <select lay-verify="" name="goodsState" >
                                <option value="1" ${goodslist.goodsState=='1'?'selected':''} >可用</option>
                                <option value="0" ${goodslist.goodsState=='0'?'selected':''} >不可用</option>
                               
                            </select> 
                        </div>
                   
                </li>
               
                
                <li>
                        <div class="left">警告数：</div>
                        <div class="right"> 
                            <input type="text" name="goodsMin" value="${goodslist.goodsMin}" required lay-verify="required"  autocomplete="off" class="layui-input">
                        </div>
                    </li>
               
               
                
                   <li style="height: 38px; overflow:initial;">
                        <div class="left">选择供应商</div>                    
                           <div class="right" id="xz"> 
                            <select name="supplier" lay-verify="">
                            <c:forEach items="${supplierList}" var="s">
                            	<option value="${s.supplierId }" ${ s.supplierId  == goodslist.supplierId ? 'selected':''} >${s.supplierId }</option>
                            </c:forEach>
                            </select> 
                        </div>
                    </li>  
                <li> 
                    <div class="left"> &nbsp;</div>
                    <div class="right"> 
                        <button class="button_qr">  确定修改</button>
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
        
    	function showImg(obj)
    	{
    		var file = obj.files[0];
    		var reader = new FileReader();
    		reader.readAsDataURL(file);
    		reader.onload = function()
    		{
    			var result =  reader.result;
    			document.getElementById('img').src = result;
    		}
    		
    	}
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
<!-- Function showImg(obj) //传过来的参数
{
  Var file=obj.files[ 0 ];   // 判断input标签 file 是否存在。
  Var reader=new FileReader( ); // 实例化一个FieReader（）接口
		Reader.readAsDataURL(file );   // 通过readAsDataURL（）方法读取文件，将图片镶嵌在网页中。
		Reader.onload =function() // 调用FileReader的Onload事件读取成功将result属性赋给他，实现图片的预览
		{
		  Var result =reader.result;
		  Document.getElementByid("img").src=result;

}



} -->

</scirpt>
</body>
</html>
