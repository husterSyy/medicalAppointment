<%@page import="com.domain.Doctor"%>
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
 
  <script>
  function changeMyType(scope){
var myType=$(scope).val();
if(myType==1){
$("#queryKey").attr("placeHolder","请输入您要查找的科室");
}else if(myType==2){
$("#queryKey").attr("placeHolder","请输入您要查找的医院");
}else if(myType==3){
$("#queryKey").attr("placeHolder","请输入您要查找的医生");
}else{
}
}
  </script>

  
        <title>城市医疗预约平台首页</title>
        
        <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="//cdn.bootcss.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
        
        <script src="//cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
        <script src="/mobile/addon/jquery.mmenu.min.all.js"></script>
        <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        
<style type="text/css">      
	@charset "utf-8";
* {
    margin: 0;
    padding: 0;
    list-style-type: none;
}

a,
img {
    border: 0;
}

body {
    line-height: 2em;
    background-color: #ffffff;
    font-family: arial, helvetica, sans-serif;
    color: #666666;
    font-size: 12px
}

a {
    color: #666666;
    text-decoration: none;
    -webkit-transition-property: color;
    -moz-transition-property: color;
    -o-transition-property: color;
    transition-property: color;
    -webkit-transition-duration: .2s;
    -webkit-transition-timing-function: ease-in;
    -moz-transition-duration: .2s;
    -moz-transition-timing-function: ease-in;
    -o-transition-duration: .2s;
    -o-transition-timing-function: ease-in;
    transition-duration: .2s;
    transition-timing-function: ease-in
}

a:hover {
    color: #cd0606;
    text-decoration: underline
}


</style>

<style type="text/css">
    *{
        margin:0px;
        padding:0px;
    
    }
   .title a{margin:0px auto;
    position:fixed;
    top:0;
    }
    #carousel-example-generic{
        width:1000px;
        height:480px;
    margin:0 auto;
    }


    .type{width:900px;height:80px;line-height:50px;list-style:none;margin:0px auto;}
    .list{margin:20px 50px;float:left;}
    
   
    .type1{width:1000px;height:60px;margin:5px 10px;list-style:none;display:block;}
    .list1{margin:10px 20px;display:inline-block;}
     
   .type1 a{margin:0px auto;width:30px;}
     
     .detail{width:1400px;height:900px;margin:0 auto;}
     
     .d1{width:1300px;margin:20px;}
   
   .appoint{float:right;}
   .name{margin:20px;float:right;}
  
     /* ul li以横排显示 */

/* 所有class为menu的div中的ul样式 */
div.menu ul
{
    list-style:none; /* 去掉ul前面的符号 */
    margin: 0px; /* 与外界元素的距离为0 */
    padding: 0px; /* 与内部元素的距离为0 */
    width: auto; /* 宽度根据元素内容调整 */
}
/* 所有class为menu的div中的ul中的li样式 */
div.menu ul li
{
    /*float:left;  向左漂移，将竖排变为横排 */
}
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


<body style="">

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
当前用户:${username}  
  <!--  <c:if test="${username!=null}">  
        <a href="${pageContext.request.contextPath }/user/logout.action">退出</a>  
    </c:if>  
-->

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

 <form action="<%=basePath%>doctor/selectDoctor" method="post">
 
	<div id="search-wrap">
	    <input class="search-content"  type="text" id="text" placeholder="输入搜索内容" name="name" autocomplete="off">
	    <button class="search-btn" type="submit" >搜索</button>
	</div>
		<!--
        	提示下拉框
        -->
        <div id="tips" style="display: none; 
        	margin-top:10px;width:300px;border: 1px solid pink;
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
 				xhr.open("GET","<%=basePath%>doctor/findDoctor?name="+text);
 			
 
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

		
		
	

        

<div class=" " style="margin:0 auto;width:1400px;height:100px;">
       
        
   
           <ul class="type">
              <li class="list"><a href="<%=basePath%>department/allDepartment">按科室查找</a> </li>
                <li class="list"><a href="<%=basePath%>hospital/allHospital?name=${username}">按医院查找</a> </li>
                  <li class="list"><a href="<%=basePath%>doctor/allDoctor?name=${username}">按医生查找</a> </li>
           </ul>
   </div>


      
 
<div style="margin:0 auto;width:1400px;height:300px;background:#f0f0f0;">
	
	  
         
            <ul class="type1" style="">
           
                 <li class="list1"><a href="">医生评分</a> </li>
                <li class="list1"><a href="<%=basePath%>doctor/selectDoctorByRatingD">从高到低</a> </li>
                  <li class="list1"><a href="<%=basePath%>doctor/selectDoctorByRatingA">从低到高</a> </li>
            </ul>      
          
                    <ul class="type1">
           
                 <li class="list1" style=""><a href="">医生职称</a> </li>
                <li class="list1"><a href="<%=basePath%>doctor/selectDoctorByType?type=主任医师">主任医师</a> </li>
                  <li class="list1"><a href="<%=basePath%>doctor/selectDoctorByType?type=副主任医师">副主任医师</a> </li>
            </ul>    
            
                        <ul class="type1">
           
                 <li class="list1"><a href="">可预约</a> </li>
                <li class="list1"><a href="<%=basePath%>hospital/allHospital">一周之内</a> </li>
                  <li class="list1"><a href="<%=basePath%>doctor/allDoctor">明天</a> </li>
            </ul>    
       
            <ul class="type1">
           
                 <li class="list1"><a href="">医生预约量</a> </li>
                <li class="list1"><a href="<%=basePath%>doctor/selectDoctorByInquisitionD">由高到低</a> </li>
               
                <li class="list1"><a href="<%=basePath%>doctor/selectDoctorByInquisitionA">由低到高</a> </li>
            
            </ul>    
    </div>
    


    
<!--      
    <div class="detail" style="margin:0 auto;width:1400px;/*background:#000;*/">
    
    
    <table  style="border-collapse:separate; border-spacing:0px 40px;">
      
            <c:if test="${!empty doctorList}">
          
       
                <c:forEach items="${doctorList}" var="doctor">
                <tr  style="width:1300px;margin:20px 20px;">
                 
               <td>
                    <image src="${doctor.dPhoto}" style="vertical-align:middle"  width="300px" height="300px" />
               
                </td>
               <td>
                 <div class="appoint" style="margin-left:50px;font-size:20px;color:#455c73;margin-right:100px;width:800px;">
                   <p class=" ">
                        <a href="<%=basePath%>doctor/getDoctorByName?name=${doctor.dName}"> ${doctor.dName}</a>
                                                   
                    <a style="margin-left:30px;">  医生职称： ${doctor.dType}  </a>
                        <a style="margin-left:30px;">评分：${doctor.dRating}</a>
                    </p>
             <p>预约量:${doctor.dInquisition}</p>
                       <a href="" style="float:right">现在预约</a>
                    
                   </div> 
                 </td>
                     
               
                    </tr> 
                </c:forEach>
              
         
            </c:if>
</table>
-->
    <div style="width:1600px;margin:0 auto;heigh:1000px;margin-top:50px;/*background:#f0f0f0;*/">
	 <div style="width:350px;margin-left:100px;"><h2>所有医生</h2></div> 
	 <c:if test="${!empty doctorList}">
          
       <div style="width:1600px;height:400px;">
                <c:forEach items="${doctorList}" var="doctor">
                <div  style="border:1px solid #f0f0f0;width:350px;height:400px;float:left;margin-left:30px;/*background:#000;*/">
                
               <div style="padding-top:30px; width:150px; height:150px;margin:0 auto;">
                    <image src="${doctor.dPhoto}" style="margin-top:50px; width:150px; height:150px;margin:0 auto;" />
               
                </div>
               
                 <div class="appoint" style="padding-top:50px;margin:0 atuo;font-size:20px;color:#455c73;height:200px;width:350px;/*background:#000;*/">
                   <p class=" " style="margin-left:20px;width:300px;">
                        <a style="margin-left:30px;" href="<%=basePath%>doctor/getDoctorByName?name=${doctor.dName}">${doctor.dName}</a>
                        <a style="margin-left:30px;">${doctor.dType}</a>
                   </p>
                      <p>
                        <a style="margin-left:30px;">评分：${doctor.dRating}</a>
                    <a style="mrgin-left:100px;">访问量：   ${doctor.dInquisition}   </a>     
                      </p>
                       <p style="width:350px;margin-left:10px;"><a style="margin-left:10px;">图文问诊：￥${doctor.dPriceImg}</a><a style="margin-left:10px;">视频问诊：￥${doctor.dPriceVideo}</a></p>
                 <!--       <p>电话： ${doctor.dGoodat}</p>  --> 
                   <div style="margin-left:100px;margin-bottom:10px;">   <a href="<%=basePath%>doctor/appointment?name=${doctor.dName}&uName=${username}" style="">现在预约</a> </div>
                    
                   </div> 
                 </div>        
                </c:forEach>            
        </div> 
            </c:if>

	</div>
   
   
    <div style="width:1600px;margin:0 auto;margin-top:400px;/*background:#f0f0f0;*/">
	 <div style="width:350px;margin-left:100px;"><h2 style="padding-top:50px;">推荐医生</h2></div> 
	 <c:if test="${!empty doctorList2}">
          
       <div style="width:1600px;height:400px;">
                <c:forEach items="${doctorList2}" var="doctor">
                <div  style="border:1px solid #f0f0f0;width:350px;height:400px;float:left;margin-left:30px;/*background:#000;*/">
                
               <div style="padding-top:30px; width:150px; height:150px;margin:0 auto;">
                    <image src="${doctor.dPhoto}" style="margin-top:50px; width:150px; height:150px;margin:0 auto;" />
               
                </div>
               
                 <div class="appoint" style="padding-top:50px;margin:0 atuo;font-size:20px;color:#455c73;height:200px;width:350px;/*background:#000;*/">
                   <p class=" " style="margin-left:20px;width:300px;">
                        <a style="margin-left:30px;" href="<%=basePath%>doctor/getDoctorByName?name=${doctor.dName}">${doctor.dName}</a>
                        <a style="margin-left:30px;">${doctor.dType}</a>
                   </p>
                      <p>
                        <a style="margin-left:30px;">评分：${doctor.dRating}</a>
                    <a style="mrgin-left:100px;">访问量：   ${doctor.dInquisition}   </a>     
                      </p>
                       <p style="width:350px;margin-left:10px;"><a style="margin-left:10px;">图文问诊：￥${doctor.dPriceImg}</a><a style="margin-left:10px;">视频问诊：￥${doctor.dPriceVideo}</a></p>
                 <!--       <p>电话： ${doctor.dGoodat}</p>  --> 
                   <div style="margin-left:100px;margin-bottom:10px;">   <a href="<%=basePath%>doctor/appointment?name=${doctor.dName}&uName=${username}" style="">现在预约</a> </div>
                    
                   </div> 
                 </div>        
                </c:forEach>            
        </div> 
            </c:if>

	</div>
   
   
   
   
   
   
   
       <div style="margin:0 auto;width:1000px;clear:both;">
<nav aria-label="Page navigation" style="margin-left:300px;">
   
  <ul class="pagination">
    <li>
      <a href="<%=basePath%>/doctor/allDoctor?pageNo=1" aria-label="Next">第一页 </a>
    </li>
    <li>
      <a href="<%=basePath%>/doctor/allDoctor?pageNo=${page.pageNum-1}" aria-label="Previous">
        <span aria-hidden="true">«</span>
      </a>
    </li>
    <c:forEach var="s" begin="1" end="5">
    <li><a href="<%=basePath%>/doctor/allDoctor?pageNo=${s}">${s}</a></li>
   </c:forEach>
      <li>
      <a href="<%=basePath%>/doctor/allDoctor?pageNo=${page.pageNum+1}" aria-label="Next">
        <span aria-hidden="true">»</span>
      </a>
    </li>
    <li>
      <a href="<%=basePath%>/doctor/allDoctor?pageNo=${page.pages}" aria-label="Next">
        <span aria-hidden="true">最后一页</span>
      </a>
    </li>
  </ul>
  <div style="margin-top:-15px">当前 ${page.pageNum }页,总${page.pages }页,总 ${page.total } 条记录</div>
</nav>
</div>
		
    
    </div>
 
 
   
  

        
           
    </body>
</html>