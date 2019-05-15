<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="refresh" content="2;URL=<%=basePath%>user/register">
<title>Insert title here</title>
</head>
<body style="background:url(img/background2.png);background-size:100%">
	<p style="font-size:30px;text-align:center">
	<%
	out.println("验证码输入错误！2秒后返回注册界面");
	%>
	</p>
</body>
</html>