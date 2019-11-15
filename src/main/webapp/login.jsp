<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<base href="<%=basepath %>" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Insert title here</title>
	<link rel="stylesheet" href="./css/auth.css">
</head>

<body>
	<div class="lowin lowin-blue">
		<div class="lowin-brand">
			<img src="./images/kodinger.jpg" alt="logo">
		</div>
		<div class="lowin-wrapper">

			<div class="lowin-box lowin-register">
				<div class="lowin-box-inner">
					<form action="login" method="post">
						<p>Let's create your account</p>
						<div class="lowin-group">
							<label>Name</label>
							<input type="text" name="name" autocomplete="name" class="lowin-input">
						</div>
						<div class="lowin-group">
							<label>Password</label>
							<input type="password" name="password" autocomplete="current-password" class="lowin-input">
						</div>

						<input class="lowin-btn" type="submit" value="Sign Up">
						<div class="text-foot">
							Already have an account? <a href="" class="login-link">Login</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	
		<footer class="lowin-footer">
			Design By <a href="http://fb.me/itskodinger">@itskodinger</a>
		</footer>
	</div>

<!-- 	<script src="./js/auth.js"></script> -->
<!-- 	<script>
		Auth.init({
			login_url: '#login',
			forgot_url: '#forgot'
		});
	</script> -->
</body>
</html>