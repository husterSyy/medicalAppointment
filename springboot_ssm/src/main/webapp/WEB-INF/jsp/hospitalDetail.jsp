<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@page import="com.domain.Hospital" %>
<%
String path=request.getContextPath();
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
 <%@ page isELIgnored="false"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <title>医院详情</title>  
      <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <meta name="viewport" content="width=device-width, initial-scale=1">
           <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="//cdn.bootcss.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
        
    <style>
    .type{ list-style:none;width:900px;height:80px;line-height:50px;list-style:none;margin:0px auto;}
    .list{margin:20px 50px;float:left;  
    background-color: #465c71; /* 背景色 */
    border: 1px #4e667d solid; /* 边框 */
    color: #dde4ec; /* 文字颜色 */}
    a{  text-decoration: none;}
    /* 所有class为menu的div中的ul样式 */
    
/* 所有class为menu的div中的ul中的a样式(包括尚未点击的和点击过的样式) */
div.menu ul li a, div.menu ul li a:visited
{
    background-color: #465c71; /* 背景色 */
    border: 1px #4e667d solid; /* 边框 */
    color: #dde4ec; /* 文字颜色 */
    display: block; /* 此元素将显示为块级元素，此元素前后会带有换行符 */
    line-height: 1.35em; /* 行高 */
    padding: 4px 20px; /* 内部填充的距离 */
    text-decoration: none; /* 不显示超链接下划线 */
    white-space: nowrap; /* 对于文本内的空白处，不会换行，文本会在在同一行上继续，直到遇到 <br> 标签为止。 */
}
/* 所有class为menu的div中的ul中的a样式(鼠标移动到元素中的样式) */
div.menu ul li a:hover
{
    background-color: #bfcbd6; /* 背景色 */
    color: #465c71; /* 文字颜色 */
    text-decoration: none; /* 不显示超链接下划线 */
}
/* 所有class为menu的div中的ul中的a样式(鼠标点击元素时的样式) */
div.menu ul li a:active
{
    background-color: #465c71; /* 背景色 */
    color: #cfdbe6; /* 文字颜色 */
    text-decoration: none; /* 不显示超链接下划线 */
}

    
    
    </style>
    <style>
    
      #search-wrap{
        position:absolute;
        margin-top:-10px;　<!--达到覆盖图片轮播底部的作用-->　
        left:50%;　　　　　　<!--这部分是搜索框居中显示的关键。-->
        margin-left:-130px;
        width:260px;　　　　
        height:36px;　　　　
        border-radius:18px;
        box-shadow: 0 0 3px rgba(0,0,0,.14);
        background-color:#FFF;
        
      /*  float:left;*/
    }
    
    #search-wrap .search-content{
        box-shadow: none;
        
        border:0 none;
        font-family: "Hiragino Sans GB","Microsoft YaHei","WenQuanYi Micro Hei",Arial,Helvetica,sans-serif;
        margin-top:3px;
        margin-left:18px;
        width:190px;
        height:30px;
    }
    #search-wrap .search-btn{
        border:0px;
        float:right;
        margin:4px 4px 4px 0;
        width:46px;
        height:28px;
        border-radius:14px;
        background-color:#2980b9;
        color:#FFF;
        text-align:center;
        line-height:28px;
        
    }

    
    </style>
  </head>  

  <body>  
  
  <div class="title">

    <a class=" " href="#">城市预约挂号平台</a>
      <nav class="navbar navbar-default" role="navigation"> 
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
            <span class="sr-only">展开导航</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span> 
        </button>
    
    </div>
    <div class="collapse navbar-collapse" id="menu">
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
</div>

<div id="search" style="float:right;
        width:100px;　background:#000;
        height:24px;margin-right:250px;">
        <!--  

	<div class="types">
	 <select name="" id="myType" onchange="changeMyType(this)" >
	<option id="type1" value="1" selected="selected">科室</option>
	<option id="type2" value="2" >医院</option>
	<option id="type3" value="3" >医生</option>
	</select>
	</div>
-->

 <form action="<%=basePath%>hospital/selectHospital" method="post">
 
	<div id="search-wrap">
	
	    <input class="search-content"  type="text" id="text" placeholder="输入搜索内容" name="name" autocomplete="off">
	  
	    <button class="search-btn" type="submit" >搜索</button>
	</div>
		<!--
        	提示下拉框
        -->
        <div id="tips" style="display: none; 
        	margin-top:-10px;width: 300px;  border: 1px solid pink
        	z-index: 999999;">
        </div>
   
	</form>
</div>

    	
    
 	<script>
 		window.onload=function(){
 			//获取文本输入框
 			var textElment = document.getElementById("text");
 			//获取下提示框
 			var div = document.getElementById("tips");
 			textElment.onkeyup=function(){
 				//获取用户输入的值
 				var text = textElment.value;
 				//如果文本框中没有值，则下拉框被隐藏，不显示
 				if(text==""){
 					div.style.display="none";
 					return;
 				}
 				//获取XMLHttpRequest对象
 				var xhr = new XMLHttpRequest();
 				//编写回调函数
 				xhr.onreadystatechange=function(){
 					//判断回调的条件是否准备齐全
 					if(xhr.readyState==4){
 						if(xhr.status==200){
 							//取的服务器端传回的数据
 							var str = xhr.responseText;
 							
 							//判断传回的数据是否为空,若是则直接返回，不显示
 							if(str==""){
 								return;
 							}
 							//我们将会在服务器端把数据用 , 隔开，当然这里也可以使用json
 							var result = str.split(",");
 							var childs = "";
 							//遍历结果集，将结果集中的每一条数据用一个div显示，把所有的div放入到childs中
 							for(var i=0; i<result.length;i++){
 								childs += "<div onclick='Write(this)' onmouseout='recoverColorwhenMouseout(this)' onmouseover='changeColorwhenMouseover(this)'>"+result[i]+"</div>";
 							}
 							//把childs 这div集合放入到下拉提示框的父div中，上面我们以获取了
 							div.innerHTML=childs;
 							div.style.display="block";
 						
 						}
 					}
 				}
 			
 				//创建与服务器的连接
 				xhr.open("GET","<%=basePath%>hospital/findHospital?name="+text);
 			
 
 				//发送
 				xhr.send();
 			}
 		}
 		//鼠标悬停时改变div的颜色
 		function changeColorwhenMouseover(div){
 			div.style.backgroundColor="pink";
 			
 			/*div.style.margin-top:20px;*/
 		}
 		//鼠标移出时回复div颜色
 		function recoverColorwhenMouseout(div){
 			div.style.backgroundColor="";
 		}
 		//当鼠标带点击div时，将div的值赋给输入文本框
 		function Write(div){
 			//将div中的值赋给文本框
 			document.getElementById("text").value=div.innerHTML;
 			
 			//让下拉提示框消失
 			
 			div.parentNode.style.display="none";
 		}
 	</script>
  
  
  <a>医院详情页面-</a>
   <a> ${hospital.hName}  </a>
    <div class="menu">
    
    
 

           <ul class="type ">
              <li class="list"><a href="<%=basePath%>department/allDepartment">按科室查找</a> </li>
                <li class="list"><a href="<%=basePath%>hospital/allHospital">按医院查找</a> </li>
                  <li class="list"><a href="<%=basePath%>doctor/allDoctor">按医生查找</a> </li>
           </ul>
   </div>
 
    <div style="margin:0 auto;/*background:#C0C0C0;*/margin-botton:30px;width:1400px;height:400px;">
   <a href="<%=basePath%>hospital/getHospital?name=${hospital.hName}"> ${hospital.hName}</a>
               <a style="margin:0 20px;">        ${hospital.hType}</a>
   <!--    <a href="">关注医院</a>  -->
            <script type="text/javascript">
function change()
{
//window.location.href="<%=basePath%>hospital/followHospitalByName?uName=${username}&hName=${hospital.hName}";
alert("关注成功"); //弹出对话框
var btn = document.getElementById("btn");
btn.value="已关注";
btn.disabled=true;
$.ajax({url:"hospital/followHospitalByName?uName=${username}&hName=${hospital.hName}",});

}
</script>
         <input type="button" id="btn" value="关注" onclick="change()"/>

    <table  style="border-collapse:separate; border-spacing:0px 40px;">
      
               
                <tr  style="width:1300px;margin:20px 20px;">
                 
               <td>
                    <image src="${hospital.hPicture}" style="vertical-align:middle"  width="300px" height="300px" />
               
                </td>
               <td>
                 <div class="" style="margin-left:50px;font-size:20px;color:#455c73;margin-right:100px;width:800px;">
                   <p class=" ">
                       
                          医院主页: <a href="${hospital.hWeb}">${hospital.hWeb}</a>
                    </p>
       
                       <p>医院总机查号台：<a>${hospital.hMobile}</a></p>
                       
                      <p> ${hospital.hAddress}</p>
                   
          
                       <a href="<%=basePath%>hospital/guide?name=${hospital.hName}" style="float:right">导航去这里</a>
                    
                   </div> 
                 </td>
                      
                    </tr> 
                
              
         
</table>
    
    
    
    </div>
    
    <div style="margin:0 auto;/*background:#C0C0C0;*/margin-top:20px;width:1400px;height:900px;">
       <div style="margin-right:20px;width:1000px;height:900px;float:left;">
     <div style="background:#C0C0C0;width:150px;height:50px;text-align:center;"><div style="margin:10px auto;padding-top:10px;width:120px;height:40px;"><a style="font-size:20px;vertical-align:middle;">医院介绍</a></div></div>
      <div style="font-size:20px;line-height:30px;">${hospital.hDetail}</div>
       
 <!--  
  	<p>开放预约科室</p>
    <table  style="border-collapse:separate; border-spacing:0px 40px;">
      
            <c:if test="${!empty clinicList}">
          
       
                <c:forEach items="${clinicList}" var="clinic">
                <tr  style="">
                 
               <td>
                    <p>$clinic.dName</p>
               
                </td>
               <td>
               
              <p style="width=30px;">$clinic.cName</p>
                   
          
            
                 </td>
                     
               
                    </tr> 
                </c:forEach>
              
         
            </c:if>
</table>
    
       
       -->
       
       </div>
      <div style="margin-left:10px;width:350px;height:400px;float:left;">
      <div style="margin:20px 10px;">
     
        <h3>预约规则（更新时间每日8:30更新）</h3>
       
       <p>预约周期：7天</p>
       <p>放号时间：8:30</p>
       <p>停挂时间：14:00</p>
       <p>退号时间：就诊前一工作日14:00前取消</p>
       
       </div>
       
      </div>
    
    </div>
    
  </body>  
</html>  