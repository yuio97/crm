<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
            <form class="layui-form layui-form-pane" action="addStaff" method="post">
            <ul>

                <li>
                    <div class="left">员工姓名:</div>
                    <div class="right"> 
                        <input type="text"  name="sysStaffName" required lay-verify="required"  autocomplete="off" class="layui-input">   
                    </div>
                </li>
                <li>
                    <div class="left">性别:</div>
                    <div class="right">
                                    <input type="radio" name="sysStaffSex" value="男" title="男">
                                    <input type="radio" name="sysStaffSex" value="女" title="女" checked>
  
                    </div>
                </li>
                <li>
                    <div class="left">身份证号:</div>
                    <div class="right"> 
                        <input type="text"  name="sysStaffIdentity" required lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                    <div class="left">地址</div>
                    
                    <div class="right"> 
                        <input type="text"  name="sysStaffAddress" required lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                    <div class="left">学历:</div>
                    <div class="right"> 
                        <input type="text"  name="sysStaffEdu" required lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                    <div class="left">政治面貌</div>
                    <div class="right"> 
                            <input type="text"  name="sysStaffPol" required lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                    <div class="left">联系方式</div>
                    <div class="right">
                            <input type="text"  name="sysStaffTel" required lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                        <div class="left">毕业学校</div>
                        <div class="right">
                                <input type="text"  name="sysStaffSchool" required lay-verify="required"  autocomplete="off" class="layui-input">
                        </div>
                </li>

                <li>
                    <div class="left">备注:</div>
                    <div class="right"> 
                        <textarea name="sysStaffRemark"  required lay-verify="required"  class="layui-textarea"></textarea>
                    </div>
                </li>
                <li>
                    <div class="left"> &nbsp;</div>
                    <div class="right"> 
                        <!-- <button class="button_qr">确定添加保护</button> -->
                        <input class="button_qr" type="submit" value="添加">
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
        </script>
