<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户列表</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
  
     <script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  <script language="javascript">
  window.onload=function() {
      $("input[placeholder=请输入您要查找的医院或医生]").hover(
            function() {
                $(this).bind("focus", function() {
                    $(this).attr("placeholder","");
                });
            },    
            function() {
                $(this).bind("blur", function() {
                    $(this).attr("placeholder","请输入密码");
                });
            }
        );
      
  }

function sel(){
document.thisform.submit();
}
</script>
  </head>
  
  <body>
      <h5>
          <a href="<%=basePath%>user/getAllUser">进入用户管理页</a>
          <a href="<%=basePath%>hospital/allHospital">进入医院页</a>
          <a href="<%=basePath%>department/main">进入首页</a>
          <!--  
          <form name="thisform" method="post" action="Allindex/find">

      
         <input type="text" name="name" placeholder="请输入您要查找的医院或医生" autocomplete="off"/>
         <input type="button" value="查询" onclick="sel()">
          
     </form>
     -->
     
     
      <form name="thisform" method="post" action="hospital/selectHospitalByMore">

      <input type="text" name="name" />
      <input type="text" name="type"/>
      <input type="text" name="rating"/>
      
         <input type="button" value="查询" onclick="sel()">
          
     </form>
      </h5>
  </body>
</html>