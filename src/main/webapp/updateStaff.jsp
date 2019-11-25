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
    <title>WangID办公管理系统</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/children.css">

    <!-- 在线图标库 地址：http://fontawesome.dashgame.com/-->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- layui css -->
    <link rel="stylesheet" href="layui/css/layui.css">
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
    <style>
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
        <!-- 当前位置 -->
        <div class="zy_weizhi bord_b">
            <i class="fa fa-home fa-3x"></i>
            <a>首页</a>
            <a>客户保护</a>
            <span>添加保护系统</span>
        </div>
        <!-- 内容 -->    
        <div class="wenxts_ke">
            <p><i>温馨提示：</i>添加客户保护后，如果在保护期内没能搞定客户，保护期结束后就不在受保护</p>
        </div>
        
        <div class="kehubh_tj_k">
            <form class="layui-form layui-form-pane" enctype="multipart/form-data" action="updateStaff" method="post">
            <ul>

                <li>
                    <div class="left">员工姓名:</div>
                    <div class="right"> 
                        <input type="text" value="${info.sysStaffName}" name="sysStaffName" required lay-verify="required"  autocomplete="off" class="layui-input">   
                        <input type="hidden" name="sysStaffId" value="${info.sysStaffId}">
                    </div>
                </li>
                <li>
                    <div class="left">性别:</div>
                    <div class="right">
                        <c:choose>
                            <c:when test="${info.sysStaffSex == 1} ">
                                    <input type="radio" name="sysStaffSex" value="1" title="男" checked>
                                    <input type="radio" name="sysStaffSex" value="0" title="女" >
                            </c:when>
                            <c:otherwise> 
                                    <input type="radio" name="sysStaffSex" value="1" title="男">
                                    <input type="radio" name="sysStaffSex" value="0" title="女" checked>
                            </c:otherwise>
                        </c:choose>
                            
                    </div>
                </li>
                <li>
                    <div class="left">身份证号:</div>
                    <div class="right"> 
                        <input type="text" value="${info.sysStaffIdentity}" name="sysStaffIdentity" required lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                    <div class="left">地址:</div>
                    
                    <div class="right"> 
                        <input type="text" value="${info.sysStaffAddress}" name="sysStaffAddress" required lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                    <div class="left">学历:</div>
                    <div class="right"> 
                        <input type="text" value="${info.sysStaffEdu}" name="sysStaffEdu" required lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                    <div class="left">政治面貌:</div>
                    <div class="right"> 
                            <input type="text" value="${info.sysStaffPol}" name="sysStaffPol" required lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                    <div class="left">联系方式:</div>
                    <div class="right">
                            <input type="text" value="${info.sysStaffTel}" name="sysStaffTel" required lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                        <div class="left">毕业学校:</div>
                        <div class="right">
                                <input type="text" value="${info.sysStaffSchool}" name="sysStaffSchool" required lay-verify="required"  autocomplete="off" class="layui-input">
                        </div>
                </li>
                <li>
                        <div class="left">最后修改时间:</div>
                        <div class="right">
                        
                            <h2 style="margin-left:10px" class="text"><fmt:formatDate value="${info.sysStaffTime}" pattern="yyyy-MM-dd" /></h2>
                        </div>
                </li>
                <li>
                        <div class="left">照片:</div>
                        <div class="right out">
                           	<img id="img" src="${info.sysStaffPhoto}" >
							<input type="file" onchange="showImg(this)" name="img">
                        </div>
                </li>
                
                <li>
                    <div class="left">备注:</div>
                    <div class="right"> 
                        <textarea name="sysStaffRemark"  required lay-verify="required"  class="layui-textarea">${info.sysStaffRemark}</textarea>
                    </div>
                </li>
                <li>
                    <div class="left"> &nbsp;</div>
                    <div class="right"> 
                        <!-- <button class="button_qr">确定添加保护</button> -->
                        <input class="button_qr" type="submit" value="修改">
                    </div>
                </li>
            </ul> 
            </form>
        </div>
    </div>   
    
	<!-- houl --> 
	<!-- 结束 -->
    <!-- layui js -->
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
