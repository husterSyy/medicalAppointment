<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head >
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="refresh" content="2;URL=<%=basePath%>user/login">
<title>登录提醒</title>
</head>
<body style="background-image: url(../images/background1.jpg);background-size: 100%">
	

	<div style="color:#fff;font-size:30px;text-align:center;margin:0 auto;margin-top:100px;width:1000px;">您未登录，请先去<a href="<%=basePath%>user/login">登录</a></div>
	
</body>
</html>