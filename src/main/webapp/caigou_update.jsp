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
            <form  action="update/updatePurchasingOrder"  mothed="post">
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
                                <option value="1" ${porder.porderJz=='1'?'selected':''}>待采购</option>
                                <option value="0" ${porder.porderJz=='0'?'selected':''}>已采购</option>
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
                                <option value="1" ${porder.payQk=='1'?'selected':''}>现金</option>
                                <option value="2" ${porder.payQk=='2'?'selected':''}>银行卡</option>
                                	<option value="3" ${porder.payQk=='3'?'selected':''}>支付宝</option>
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
                    <table class="layui-table"  lay-size="xs">
                     <thead>
                	<tr> 
                    
                   
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
                     <c:forEach items="${porder.purchasingXq}" var="PurchasingXq">
           			<tr >
           			 
                    <td>${PurchasingXq.goodsId}</td>
                    <td>${PurchasingXq.goods.goodsName}</td>
                    <td>${PurchasingXq.goods.goodsPrice}</td>
                    <td>${PurchasingXq.goods.goodsNum}</td>
                    <td>${PurchasingXq.goods.goodsMin}</td>
            
                     <td><input type="text"  value="${PurchasingXq.goodsNum}" placeholder="请输入需要购买的数量："  oninput="showPrice(this,${PurchasingXq.goodsId},${PurchasingXq.goods.goodsPrice})" ></td>
                     <td><input type="text" id="goodsPrice${PurchasingXq.goodsId }" value="${PurchasingXq.goodsPrice}" readonly="readonly" placeholder=""></td>
                     <td><input type="text"  value="${PurchasingXq.pxMassage}"  placeholder="备注"></td>
                     </tr>
                     </c:forEach>
                     </tbody>
                    </table>
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

 <script>
layui.use('laydate', function(){
  var laydate = layui.laydate; 
  
   laydate.render({
    elem: '#test3'
  });
});
</script>
<script>

	function showPrice(inp,id,price)
	{
		console.log(inp,id,price);
		var num = inp.value;
		if(!isNaN(num))
		{
			document.getElementById("goodsPrice"+id).value = num * price;
		}
	}

</script>
</body>
</html>
