<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>找回密码-预约挂号平台</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body  style="background-image: url(../images/background1.jpg);background-size: 100%">
<div style="width:1000px;margin:0 auto;text-align:center;margin-top:130px;color:#fff;font-size:50px;">找回密码</div>
	
	<div style="background-color:rgba(255,255,255,0.3);margin:0 auto;margin-top:100px;width:500px; height:400px">
	
	<div style="margin:0 auto;width:300px;">
		<form action="<%=basePath%>user/sendfindPassword" method="post">
 
 
			<input type="email" name="email" id="email" width="100px"
				height="60px" style="margin-top: 100px" placeholder="请输入您的邮箱地址"
				required> <br>
			<br>
 
			<button type="submit" class="btn btn-success" id="button"
				width="100px" height="60px">找回密码</button>
 
		</form>
		<br>
		<br>
 
		<button type="button" class="btn btn-primary" id="button"
			onclick="backLogin()" width="100px" height="60px">返回登录页面</button>
			</div>
	</div>
	<script type="text/javascript">
		function backLogin() {
			window.location.href = "<%=basePath%>user/login";
		}
	</script>
</body>
</html>
