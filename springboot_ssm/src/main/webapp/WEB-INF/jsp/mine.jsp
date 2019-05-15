<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<%@ page contentType="text/html; charset=utf-8"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

　       <link  href = "css/bootstrap.css" rel = "stylesheet" type = "text/css"/>
        <!-- bootstrap.js -->        
        <script src = "js/jquery-1.9.1.js"> </script>
        <!-- bootstrap.js -->
            <script src = "js/bootstrap.js"></script>
 
<script src="webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet"
 href="webjars/bootstrap/3.3.5/css/bootstrap.min.css" />
 
 　       <link  href = "css/bootstrap.css" rel = "stylesheet" type = "text/css"/>
      <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="//cdn.bootcss.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
        
</head>
<style>
a{text-decoration:none;}
</style>

<body style="background-image: url(../images/background1.jpg);background-size: 100%">

<div class="title" style="background-color:rgba(255,255,255,0.3);">


      <nav class="navbar navbar-default" role="navigation"> 
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
            <span class="sr-only">展开导航</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span> 
        </button>
        <a class="navbar-brand" href="#">城市预约挂号平台</a>
    </div>
    <div class="collapse navbar-collapse" id="menu" style="background-color:rgba(255,255,255,0.3);">
        <ul class="nav navbar-nav">
          <li class="active"><a href="<%=basePath%>user/main">首页</a></li>
            <li><a href="<%=basePath%>doctor/allDoctor?name=${username}">预约挂号</a></li>
            <li><a href="<%=basePath%>doctor/allDoctor?name=${username}">在线咨询</a></li>
             <li><a href="<%=basePath%>artical/allArtical?name=${username}">医护知识</a></li>

                    <li><a href="<%=basePath%>hospital/allHospital?name=${username}">推荐查找</a></li>
                    <li><a href="<%=basePath%>user/mine?name=${username}">个人中心</a></li>
                    
         
                    
            <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">游客 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="<%=basePath%>user/login">登录</a></li>
                    <li class="divider"></li>
                    <li><a href="<%=basePath%>user/register">注册</a></li>
                    <li class="divider"></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>

当前用户:${username}  
    <c:if test="${username!=null}">  
        <a href="${pageContext.request.contextPath }/user/logout.action">退出</a>  
    </c:if>  
    
</div>

<div style="width:1400px;margin-top:80px;margin:0 auto;">
<h1>个人中心</h1>
<div style="width:400px;height:600px;float:left;margin-left:30px;background-color:rgba(255,255,255,0.5);">
<div style="width:300px;height:400px;margin:0 auto;">
<div style="margin-top:30px;">我的信息</div>
<div style="margin-top:30px;">用户名:${user.uName}</div>
<form action="<%=basePath%>user/changeEmail?name=${user.uName}" method="post">
<div style="margin-top:30px;">邮箱:${user.uEmail}<div style="margin-top:20px;"><input type="text" name="email" placeholder="请输入更改后的邮箱" /></div></div>
<div style="margin-top:30px;"><input type="submit" class="submit" value="修改绑定邮箱"></div>
</form>
<div style="margin-top:30px;"><a href="">修改密码</a></div>
<form action="<%=basePath%>user/changePassword?name=${user.uName}" method="post">
<div style="margin-top:20px;"><input type="text" name="password" placeholder="请输入原密码" /></div>
<div style="margin-top:20px;"><input type="text" name="npassword" placeholder="请输入更改后的密码" /></div>
<div style="margin-top:30px;"><input type="submit" class="submit" value="修改密码"></div>
</form>
</div>
</div>
<div style="width:400px;height:600px;float:left;margin-left:30px;background-color:rgba(255,255,255,0.3);">
<div style="margin-left:30px;margin-top:30px;">我的关注</div>
<div style="width:300px;height:200px;margin:0 auto;margin-top:30px;">
<div>关注医生</div>
<div>
	 <c:if test="${!empty user.doctorList}">
          
    <div style="margin-top:30px;">
                <c:forEach items="${user.doctorList}" var="doctor">
          
             <a style="margin-left:30px;" href="<%=basePath%>doctor/getDoctorByName?name=${doctor.dName}">${doctor.dName}</a>
              
                </c:forEach>            
        </div> 
            </c:if>
</div>

</div>
<div style="width:300px;height:300px;margin:0 auto;margin-top:30px;">
<div>关注医院</div>
<div>
	 <c:if test="${!empty user.hospitalList}">
          
    <div style="margin-top:30px;">
                <c:forEach items="${user.hospitalList}" var="hospital">
          
          <div style="margin-top:30px;">   <a style="margin-left:30px;" href="<%=basePath%>hospital/getHospital?name=${hospital.hName}">${hospital.hName}</a>
             </div> 
                </c:forEach>            
        </div> 
            </c:if>
</div>

</div>
</div>
<div style="width:400px;height:600px;float:left;margin-left:30px;background-color:rgba(255,255,255,0.3);">

<div style="margin-left:30px;margin-top:30px;">我的订单     <a href="<%=basePath%>order">查看订单详情</a></div>

<div>
	 <c:if test="${!empty user.orderList}">
          
    <div style="margin-top:30px;">
                <c:forEach items="${user.orderList}" var="order">
          
          <div style="margin-top:30px;">   <a style="margin-left:30px;" href="<%=basePath%>alipay/orderDetail?orderId=${order.id}">${order.id}</a>
             </div> 
                </c:forEach>            
        </div> 
            </c:if>
</div>

</div>

</div>



</div>

  
    </body>
</html>