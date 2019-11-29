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
	<script src="js/vue.min.js"></script>
	<script src="js/axios.min.js"></script>
</head>

<body class="layui-layout-body control_box">
	<!-- 背景 -->
	<div class="bg_box" style="background: url(images/20190415.jpg) no-repeat center center; background-size: cover;"></div>
	<!-- content box-->
	<div class="layui-layout layui-layout-admin" id="menuList">
		<!-- top -->
		<div class="layui-header">
			<div class="top_box">
		        <div class="logo">
		        	<img src="images/logo_touming.gif">
		        	<span></span>
		        	<b><img src="images/word.png" /></b>
		        </div>

				<div class="top_user">
					<span><img src="images/head.jpg" /></span>
					<dl>
						<dt>{{user.sysAccountName}}（{{role.sysRoleName}}）</dt>
						<dd>部门：{{dept.sysDeptName}} 上次登录时间：{{user.sysLastlogin}}</dd>
					</dl>
				</div>

		        <div class="top_icon">
		        	<a href="index.html" title="首页"><img src="images/top_home.png"></a>
		        	<a href="#" title="个人设置"><img src="images/top_person.png"></a>
		        	<a href="logou" title="退出"><img src="images/top_exit.png"></a>
		        </div>
		    </div>
		</div> 
	    <!-- side menu -->
		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree"  lay-filter="test">
					<li class="layui-nav-item" v-for="m in menuList">
							<a class="" href="javascript:;"><i class="fa fa-clipboard fa-fw"></i>{{m.sysPermissionName}}</a>
							<dl class="layui-nav-child">
								<dd v-for="l in m.sonPer"><a :href="l.sysPermissionUrl" target="main_self_frame">{{l.sysPermissionName}}</a></dd>
							
							</dl>
					</li>

				</ul>
			</div>
		</div>
	  
	  
	  
		<div class="layui-body">
			<!-- 展开收起按钮 -->
			<div class="open_shrink open" title="展开/收起">
				<span></span>
			</div>
			<script type="text/javascript">
				$(function(){
					$(".open_shrink").click(function(){
						if ($(this).hasClass("open")) {
							$(this).removeClass("open");
							$(".layui-side").stop().animate({left:-220},300);
							$(".layui-body").stop().animate({left:0},300);
						}else{
							$(this).addClass("open");
							$(".layui-side").stop().animate({left:0},300);
							$(".layui-body").stop().animate({left:220},300);
						}
					})
				})
			</script>
			<!-- iframe -->
			<iframe src="daily_mykh.html" name="main_self_frame" frameborder="0" class="layadmin-iframe" scrolling="yes"></iframe>
		</div>
	
	<script>
	
		new Vue({
			el:'#menuList',
			data:
			{
				menuList:[],
				user:{},
				dept:{},
				role:{}
			},
			created() {
				//获取外部Vue对象
				var _this = this;
				//发get请求 请求路径
				axios.get('/getList')
				//请求成功后会走的方法
				.then(function(res){
					console.log(res.data);
					
					_this.menuList = res.data.perList;
					_this.user = res.data.user;
					_this.role = res.data.role;
					_this.dept = res.data.dept;
				})
				//请求失败会走的方法
				.catch(err => {
					console.error(err); 
				});
			},
		});
	
</script>
	</script>
	  
	</div>
	<!-- layui js -->
	<script src="layui/layui.js"></script>
	<script>
		//JavaScript代码区域
		layui.use('element', function(){
		  var element = layui.element;
		  
		});
		
	</script>

</body>

</html>

