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
            <a>我的信息</a>
            <span>修改密码</span>
        </div>
        <!-- 内容 -->    
        <div class="wenxts_ke">
            <p><i>温馨提示：</i>修改密码后请牢记新密码，避免忘记密码影响工作进程</p>
        </div>  
        <!-- 下面写内容 -->
        <div class="kehubh_tj_k">
            <form onsubmit="return checkform()" id="checkformf" class="layui-form layui-form-pane" action="updateAccountPass">
            <ul> 
<!--                 <li>
                    <div class="left">公司名称:</div>
                    <div class="right"> 
                        <input type="text" name="title" required lay-verify="required" placeholder="wangid" autocomplete="off" class="layui-input">   
                    </div>
                </li> -->
                <li>
                    <div class="left">原密码：</div>
                    <div class="right"> 
                        <input type="text" name="pass" id="jPass" required lay-verify="required" placeholder="请输入原密码" autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                    <div class="left">新密码：</div>
                    
                    <div class="right"> 
                        <input type="text" name="sysAccountPass" id="newPass" required lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                    <div class="left">确认新密码：</div>
                    <div class="right"> 
                        <input type="text" name="checkPass" id="checkpass" required lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                    <div class="left"> &nbsp;</div>
                    <div class="right"> 

                        <input class="button_qr" type="submit" value="修改" >
                    </div>
                </li>
            </ul> 
            </form>
        </div>
    </div>
    
    <script>
    	function checkform(){
           var jPass = document.getElementById('jPass').value;
           var newPass = document.getElementById('newPass').value;
           var checkpass = document.getElementById('checkpass').value;

            
           if(jPass == newPass){
    
               alert('不能修改为当前密码');
               return false;
           }
           if(newPass == checkpass)
           {
              
              return true;
              
               
           }
           alert('两次密码不一致')
           
           return false;
           
           
        }

        
        
    </script>
    <!-- layui js -->
    <script src="layui/layui.js"></script>
</body>
</html>
 