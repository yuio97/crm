<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<style>
		.ppp{
			/* margin-bottom: 0xp !important; */
		}
	</style>
</head>

<body>
	<div class="lowin lowin-blue">
		<div class="lowin-brand">
			<img src="./images/kodinger.jpg" alt="logo">
		</div>
		<div class="lowin-wrapper">

			<div class="lowin-box lowin-register">
				<div class="lowin-box-inner">
					<form action="login" method="post" target="_top" >
						<p>Let's create your account</p>
						<div class="lowin-group">
							<label>Name</label>
							<input type="text" name="name" autocomplete="name" class="lowin-input">
						</div>
						<div class="lowin-group ppp" style="margin-bottom: 0px">
							<label>Password</label>
							<input type="password" name="password" autocomplete="current-password" class="lowin-input">
						</div>
						<c:if test="${empty sta}">
							<div class="text-foot" style="margin-top: 0px; color: rgb(248, 16, 16); opacity: 0 " >
								用户名未找到或密码错误 !
							</div>
						</c:if>
						<c:if test="${sta eq '1'}">
							<div class="text-foot" style="margin-top: 0px; color: rgb(248, 16, 16); dd" >
								用户名未找到或密码错误 !
							</div>
						</c:if>
						
						<input class="lowin-btn" type="submit" value="Sign Up">
						
					</form>
				</div>
			</div>
		</div>
	
		<footer class="lowin-footer">
			Design By <a href="http://fb.me/itskodinger">@itskodinger</a>
		</footer>
	</div>

</body>
</html>