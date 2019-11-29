<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
    <!-- <link rel="stylesheet" href="layui/css/layui.css"> -->
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
    <style>
        .lll{

            height: 30px;
            width: 700px;
            border: 1px solid pink;
            text-align: center;
            line-height: 30px;
        }
        .rrr{
            height: auto;
            width: 700px;
            border: 1px solid pink;
            
        }
        .all{
            width: 700px;
            margin-bottom: 30px;
        }
        .rrr ul{
            margin: 0px;
            padding: 0px;
            overflow: hidden;
        }
        .rrr li{
            float: left;
            margin-right: 24px;
            /* overflow: hidden; */
        }
    </style>
</head>

<body>
    <div class="wangid_conbox">
        <!-- 当前位置 -->
        <div class="zy_weizhi bord_b">
            <i class="fa fa-home fa-3x"></i>
            <a>首页</a>
            <a>回访记录</a>
            <span>部门职位添加</span>
        </div>
        <!-- 内容 -->    
        <div class="wenxts_ke">
            <p><i>温馨提示：</i>按需添加部门职位，注意勾选用户权限确定无误后再添加</p>
        </div>
        <div class="kehubh_tj_k">
            <form class="layui-form layui-form-pane" action="#">
            <ul> 
                <li  style="height: 38px; overflow:initial;">
                    <div class="left">部门名称：</div>
                    <div class="right">  
                        <input type="text"  value="${deptName}">
                        <input type="hidden" id="sysRoleId" value="${role.sysRoleId}">
                    </div>
                </li>
                <li>
                    <div class="left">部门职位：</div>
                    <div class="right"> 
                        <input type="text" id="sysRoleName"  value="${role.sysRoleName}" required lay-verify="required" placeholder="请输入部门职位" autocomplete="off" class="layui-input">
                    </div>
                </li> 
                <li>
                    <div class="left">权限：</div> 
                    <div class="right" style="width: 640px; height: auto; margin-top: 20px;"> 
                            <c:forEach items="${per}" var="p">
                                <div class="all">
                                    <div class="lll">
                                        <input onclick="menu(${p.sysPermissionId})" ${p.sysPerParentids} type="checkbox" name="${p.sysPerParentid}" id="${p.sysPermissionId}"  value="${p.sysPermissionId}" >${p.sysPermissionName}
                                    </div>
                                    <div class="rrr">
                                    <ul>
                                        <c:forEach items="${p.sonPer}" var="s">
                                            <li>
                                                <input onclick="son(${s.sysPerParentid})" ${s.sysPerParentids} type="checkbox" value="${s.sysPermissionId}" name="${s.sysPerParentid}" id="${s.sysPermissionId}">${s.sysPermissionName}                                     
                                            </li>
                                        </c:forEach>
                                    </ul>
                                    </div>
                                </div>
                            </c:forEach>
                    </div>
                </li>
                <li>
                    <div class="left">职位简介：</div>
                    <div class="right"> 
                        <textarea id="sysRoleDel" required   placeholder="请输入" >${role.sysRoleDel}</textarea>
                    </div>
                </li> 
                <li>
                    <div class="left"> &nbsp;</div>
                    <div class="right"> 
                      <!--   <button class="button_qr">确定添加</button> -->
                        <button id="subt" >确认修改</button>
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
    var s = 1;
    var r = 1;
    function menu(id){
        // alert(s);
        var t = document.getElementById(id);
        if(t.checked == true){
            s = 1;
        }else{
            s = 0;
        }
        // alert(t.checked+""+s)
        
        if(s == 1){
            $("input[name="+id+"]").prop("checked",true);
            s = 0;
        }else{
            $("input[name="+id+"]").removeAttr("checked");
            s = 1;
        }    
    }
    function son(id){

        var count=0;//定义一个计数变量
        var items = document.getElementsByName(id);
        for(var j=0;j<items.length;j++){//遍历items
            if(items[j].checked==true){//如果状态为选中，count+1
                count++;
            }
            }
            if(count == 0){//如果都不选中，主菜单不选中
                $("#"+id).removeAttr("checked");
                s = 1;
            }else{
                //如果有一个选中 
                $("#"+id).prop("checked",true);
                s = 0;
            }
        
    }

    $('#subt').click(function () { 
        
        // var sysRoleOper = $('#sysRoleOper').val(); //部门编号
        var sysRoleDel = $('#sysRoleDel').val();    //职位简介
        // var sysRoleName = $('#sysRoleName').val(); //职位名称
        var sysRoleId = $('#sysRoleId').val();
        
        var chk_value =[];//定义一个数组 
        $("input[type=checkbox]:checked").each(function(){
            chk_value.push({perId:$(this).val()}) 
            // console.log($(this).val());
            
        });
        var data = {
            sysRoleId:sysRoleId,
            sysRoleDel:sysRoleDel,
            // sysRoleName:sysRoleName,
            perRoleList:chk_value
        }
        
        // console.log(JSON.stringify(data));
        $.ajax({
            type: "post",
            url: "role/update",
            contentType:'application/json',
            data: JSON.stringify(data),
            dataType: "text",
            success: function (response) {
                // console.log(response);
                
                location.href = "/roleList.jsp"
            }
        });
               
    });

</script>
<script>


</script>