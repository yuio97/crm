<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
	<link rel="stylesheet" href="layui/css/layui.css" media="all">
	<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script> 
	<!-- layui js -->
    <script src="layui/layui.js"></script>
    <script src="js/axios.min.js"></script>
    <script src="js/vue.min.js"></script>
    
    <style>
    	.out
		{
			width:100px;
			height: 100px;
		}
    </style>
</head>

<body style="background: #fff;">
<div class="tianjia_xx" id="staffinfo">
    <table class="if_tianjiatext layui-table" lay-size="lg"> 
    <tbody>
    	<tr>
            <td class="td_1">员工图片</td> 
            <td>
            	<div class="out">
            		<img src="${info.sysStaffPhoto }">
            	</div>
            </td>
        </tr>
         <tr>
            <td class="td_1">员工姓名</td> 
            <td>${info.sysStaffName}</td>
        </tr>
        <tr>
            <td  class="td_1">所属部门</td> 
            <td>${dept.sysDeptName}</td>
        </tr>
        <tr>
            <td  class="td_1">部门职务</td> 
            <td>${role.sysRoleName}</td>
        </tr>
        <tr>
            <td  class="td_1">性别</td> 
            <td>${info.sysStaffSex == 1?'男':'女'}</td>
        </tr>
        <tr>
            <td  class="td_1">身份证号</td> 
            <td>${info.sysStaffIdentity}</td>
        </tr>
        <tr>
            <td  class="td_1">地址</td> 
            <td>${info.sysStaffAddress}</td>
        </tr>
        <tr>
            <td  class="td_1">学历</td> 
            <td>${info.sysStaffEdu}</td>
        </tr>
        <tr>
            <td  class="td_1">政治面貌</td> 
            <td>${info.sysStaffPol}</td>
        </tr>
        <tr>
            <td  class="td_1">联系方式</td> 
            <td>${info.sysStaffTel}</td>
        </tr>
        <tr>
            <td  class="td_1">毕业学校</td> 
            <td>${info.sysStaffSchool}</td>
        </tr>

        <tr>
            <td  class="td_1">最后修改时间</td> 
            <td><fmt:formatDate value="${info.sysStaffTime}" pattern="yyyy-MM-dd" /></td>
            
        </tr>
        <tr>
            <td  class="td_1">备注</td> 
            <td>${info.sysStaffRemark}</td>
        </tr>
       
    </tbody>
    </table>
</div>
<script type="text/javascript">
	 new Vue({
        el:'#staffinfo',
        data() {
            return {
                s:{},
            }
        // },created() {
        //     var _this = this;
        //     axios.get('/getStaffInfo')
        //     .then(function(res){
        //         _this.s = res.data;
        //     })
        //     .catch(err => {
        //         console.error(err); 
        //     });
        },
     });
</script> 
</body>

</html>