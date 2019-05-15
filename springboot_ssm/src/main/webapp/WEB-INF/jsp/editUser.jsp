s<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editUser.jsp' starting page</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="js/jquery-1.7.1.js"></script>
    <script type="text/javascript">  
        function updateUsers(){ 
            var form=document.forms[0];
            form.action="<%=basePath%>user/updateUser";
            form.method="post";  
            form.submit() ; 
        }  
    </script>
    </head>
  
  <body>
  <h1>修改用户</h1>  
    <form action="" name="userForm">  
        <input type="hidden" name="uId" value="${user.uId}"/> 
        ID：<a>${user.uId}</a> 
        账号：<input type="text" name="uName" value="${user.uName}"/>  
        密码：<input type="text" name="uPassword" value="${user.uPassword}"/>  
        <input type="button" value="编辑" onclick="updateUsers()"/>  
    </form> 
  </body>
</html>