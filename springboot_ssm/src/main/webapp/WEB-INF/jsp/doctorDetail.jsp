<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@ page contentType="text/html; charset=utf-8"%> 
<%@page import="com.domain.Doctor" %>
<%@page import="com.domain.Rating" %>
<%
String path=request.getContextPath();
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
 <%@ page isELIgnored="false"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
  <base href="<%=basePath%>">
    <title>医生详情</title>  
    
    <script src="<%=request.getContextPath() %>/static/js/jquery.min.js" type="text/javascript"></script>
    
      <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="//cdn.bootcss.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
    	<link href="css/doctor.css" rel="stylesheet" type="text/css"/>
	
	<!-- 分页的，先不管 -->
<!-- 	<link href="css/myPagination.css" rel="stylesheet" type="text/css"/>
	<script src="js/myPagination.js"></script> -->
	
	<!-- 评论有关css、js -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/jquery.raty.js"></script>
	<link rel="stylesheet" type="text/css" href="css/jquery.raty.css">
	<link rel="stylesheet" type="text/css" href="css/rating.css">
    
    <!--  
     <link  href = "css/bootstrap.css" rel = "stylesheet" type = "text/css"/>
        
        <script src = "js/jquery-1.9.1.js"> </script>
   
            <script src = "js/bootstrap.js"></script>
            <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="//cdn.bootcss.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
        
        <script src="//cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
        <script src="/mobile/addon/jquery.mmenu.min.all.js"></script>
        <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        
        -->
      <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        
    <style>
    .type{ list-style:none;width:900px;height:80px;line-height:50px;list-style:none;margin:0px auto;}
    .list{margin:20px 50px;float:left;  
    background-color: #465c71; /* 背景色 */
    border: 1px #4e667d solid; /* 边框 */
    color: #dde4ec; /* 文字颜色 */}
    a{  text-decoration: none;}
    .t1{width:100px;}
    .d1{aligin:center;}
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
    
    <script type="text/javascript">
	 //预约
      function appoint(aId){
          $.ajax({
              url:"<%=basePath%>appoint/appoint?aId="+aId,
              success:function(data){
              	alert("预约成功！跳转到订单界面");
              	window.open("<%=basePath%>order/detail?oid="+data.oid);
              },
              error:function(){
              	alert("error!");
              }
          })     
       }
      function getFreeTime(){
       //显示排班表
       $.ajax({
              url:"<%=basePath%>appoint/getAll?dName="+`${doctor.dName}`,
              success:function(data){
              		var appoints=data.appoints;
              		console.trace("得到排班表！"+appoints[0]);
              		var freeTimeNum;
              		for(var i=0;i<appoints.length;i++){
              			freeTimeNum=appoints[i].aTime;
              			document.getElementsByClassName("freeTime")[freeTimeNum-1].innerHTML='可预约人数<span style="color:#F93A3A">'
              			  +(10-appoints[i].aNum)+'</span><br>'
              			  +'<label style="color:#4187F1" onclick="appoint('+appoints[i].aId+')">'
              			  +'点击预约</label>';
              		}
              		
              	},
            	error:function(){
              		alert("error!");
              	}
             })
         }
	
	</script>
    
    
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
  
   
  <div>
  <a>医生详情页面-</a>
   <a>${doctor.dName}</a>
   </div>
   <div style="margin-top:20px;">
   当前用户:${username}  
    <c:if test="${username!=null}">  
        <a href="${pageContext.request.contextPath }/user/logout.action">退出</a>  
    </c:if>  
    </div>
    <div class="menu">
       
      
   
           <ul class="type ">
              <li class="list"><a href="<%=basePath%>department/allDepartment">按科室查找</a> </li>
                <li class="list"><a href="<%=basePath%>hospital/allHospital">按医院查找</a> </li>
                  <li class="list"><a href="<%=basePath%>doctor/allDoctor">按医生查找</a> </li>
           </ul>
   </div>
    
    <div style="margin:0 auto;/*background:#C0C0C0;*/margin-botton:30px;width:1400px;height:400px;">

    
     <a href="<%=basePath%>doctor/getDoctorByName?name=${doctor.dName}">${doctor.dName}</a>
               <a style="margin:0 20px;">${doctor.dType}</a>
     <!-- <a href="">关注医生</a>  -->
  <script type="text/javascript">
function change()
{
//window.location.href="<%=basePath%>doctor/followDoctorByName?uName=${username}&dName=${doctor.dName}";
alert("关注成功"); //弹出对话框
var btn = document.getElementById("btn");
btn.value="已关注";
btn.disabled=true;
$.ajax({url:"<%=basePath%>doctor/followDoctorByName?uName=${username}&dName=${doctor.dName}",});

}
</script>
 
      <input type="button" id="btn" value="关注" onclick="change()"/>
    <table  style="border-collapse:separate; border-spacing:0px 40px;">
      
               
                <tr  style="width:1300px;margin:20px 20px;">
                 
               <td>
                    <image src="${doctor.dPhoto}" style="vertical-align:middle"  width="300px" height="300px" />
               
                </td>
               <td>
                 <div class="" style="margin-left:50px;font-size:20px;color:#455c73;margin-right:100px;width:800px;">
               <div>
               <form action="<%=basePath%>consult/chat?name=${doctor.dName}" method="post">
               <input type="submit" value="点击咨询" >
               
               </form>
               
               </div>
               
               
                   <p class=" ">
                       
                          擅长：${doctor.dGoodat}
                          
                    </p>
  			      <p class=" ">
                       
                 医生信息：   ${doctor.dInfo}
                          
                    </p>
                  
                   
          
                    
                   </div> 
                 </td>
                      
                    </tr> 
                
              
         
</table>
    
    
    
    </div>
    
    <div style="margin:0 auto;/*background:#C0C0C0;*/margin-top:20px;width:1600px;height:900px;">
       <div style="margin-right:20px;width:700px;height:900px;float:left;">
     <div style="background:#C0C0C0;width:150px;height:50px;text-align:center;">
     <div style="margin:10px auto;padding-top:10px;width:120px;height:40px;"
     ><a style="font-size:20px;vertical-align:middle;">患者评论</a></div></div>
   
      <div style="font-size:20px;line-height:30px;">
     
      </div>
        <div  style="width:800px;/*height:600px;*/ margin-top:20px;margin-bottom:30px;/*background:#000;*/">
   
      <!-- 显示所有评论 -->
    <c:choose>
    <c:when test="${ratings!=null }">
    	
      <!-- <div id="pagination">分页，先不管</div> -->
      
      <table class="doctor-rating">
        <tr><th><div>累计评价<label id="num-label">${ratingSize }</label></div></th></tr>
        <tr><td>
        	<table class="doctor-rating-title">
        	  <tr>
        	  <!-- 平均评分 -->
        	  <td class="doctor-rating-average">
            	医疗水平<div class="star-skill"></div>
           		服务态度<div class="star-service"></div>
           		医疗效果<div class="star-effect"></div>
           	  </td>
           	  <td class="doctor-rating-title-select">
        	  <!-- 排序顺序 -->
            	<select onchange="changeSelect(1)" id="mode">
        	  		<option value="0">默认排序</option>
        	  		<option value="1">最新评论</option>
            	</select>
              </td>
        	  </tr>
            </table>
        </td></tr>
        
          <!-- 排序顺序 -->
          <script>
          	/* 切换排序顺序 */
            function changeSelect(isSelected){
              var value;
              if(isSelected==1){
                /* 选中时 */
                var select=document.getElementById("mode");
              	value=select.options[select.selectedIndex].value;
              }
              else{
                /* 未选中时，默认排序 */
              	value=0;
              }
              
              $.ajax({
              	url:"rating/selectMode?name=${doctor.dName}&mode="+value,
              	success:function(data){
              		var table=document.getElementById("doctor-rating-inner");
              		table.innerHTML="";
              		//获取到ratings并显示
              		var ratings=data.ratings;
              		for(var i=0;i<ratings.length;i++){
              			table.innerHTML+="<tr><td class='doctor-rating-each'>" +
						"<table width='100%'>" +
						"<tr><td class='doctor-rating-detail'>" +
							"<p>"+ratings[i].rdetail+"</p>"+
							"<label id='rtime'>"+ratings[i].rtime+"</label>" +
						"</td>" +
						"<td class='doctor-rating-info'>" +
							"用户：" +ratings[i].uname+
						"</td>" +
						"</tr></table></td></tr>";
              		}
              	},
              	error:function(){
              		alert("error!");
              	}
              })
              getFreeTime();
              
            }
            //先按默认顺序加载
            window.onload=changeSelect(0);
            
            var skillScore=`${averageScore.skill}`;
            var serviceScore=`${averageScore.service}`;
            var effectScore=`${averageScore.effect}`;
            $(".star-skill").raty({readOnly:true,score:skillScore});
            $(".star-service").raty({readOnly:true,score:serviceScore});
            $(".star-effect").raty({readOnly:true,score:serviceScore});
          </script>
        <tr><td>
        
        <table id="doctor-rating-inner" width="100%">
        </table>
        
        </td></tr>
      </table>
      
    </c:when>
    <c:otherwise>
    	<table class="doctor-rating">
        <tr><th><div>累计评价<label id="num-label">${ratingSize }</label></div></th></tr>
        <tr><td class="doctor-rating-empty">还没有评论！请完成订单后进行评论！</td></tr>
        </table>
        <script>
          window.onload=getFreeTime();
        </script>
    
    </c:otherwise>
    </c:choose>
          
          <!--  -
            <c:if test="${!empty doctor.ratingList}">
          
       
                <c:forEach items="${doctor.ratingList}" var="rating">
                <div style="margin-bottom:30px;">
                <div  style="/*width:700px;margin:20px 20px;*/">
                
                  <a >${rating.uname}</a>   
                <a style="margin-left:20px;">
                                                            医生服务态度       ${rating.rservice }</a>
                 <a style="margin-left:20px;">    医生专业水平     ${rating.rskill }</a>
                 
                  <a style="margin-left:30px;">${rating.rtime }</a>
               
               </div>  
           
              <div>
               <p>
               
                  ${rating.rdetail}
                 </p>
              </div>
              </div>
             
                </c:forEach>
              
         
            </c:if>
            
            -->
</div>
    
       
       </div>
   <!--   
        <table id="appoint-table">
      <tr>
        <th></th>
      	<th class="appointDate"></th>
      	<th class="appointDate"></th>
      	<th class="appointDate"></th>
      	<th class="appointDate"></th>
      	<th class="appointDate"></th>
      </tr>
      <tr>
        <td>上午</td>
        <td class="freeTime">暂无排班</td>
        <td class="freeTime">暂无排班</td>
        <td class="freeTime">暂无排班</td>
        <td class="freeTime">暂无排班</td>
        <td class="freeTime">暂无排班</td>
      </tr>
      <tr>
        <td class="freeTime">下午</td>
        <td class="freeTime">暂无排班</td>
        <td class="freeTime">暂无排班</td>
        <td class="freeTime">暂无排班</td>
        <td class="freeTime">暂无排班</td>
        <td class="freeTime">暂无排班</td>
      </tr>
    </table>
    
    -->
    
     <div style="margin-left:10px;width:650px;height:400px;float:right;/*background:#000;*/">
      <div style="margin:20px 10px;">
     
        <h3>排班表</h3>
     <table  style="border-collapse:separate;width:700px;/*height:200px;*/ border-spacing:0px 20px;cellspacing:10px;/*background:#000;*/">
       <thead>
      <tr>
        <th>时间段</th>
      	<th class="appointDate"></th>
      	<th class="appointDate"></th>
      	<th class="appointDate"></th>
      	<th class="appointDate"></th>
      	<th class="appointDate"></th>
      </tr>
       </thead>
        <tbody>
      <tr>
        <td>上午</td>
        <td class="freeTime">暂无排班</td>
        <td class="freeTime">暂无排班</td>
        <td class="freeTime">暂无排班</td>
        <td class="freeTime">暂无排班</td>
        <td class="freeTime">暂无排班</td>
      </tr>
      <tr>
        <td>下午</td>
        <td class="freeTime">暂无排班</td>
        <td class="freeTime">暂无排班</td>
        <td class="freeTime">暂无排班</td>
        <td class="freeTime">暂无排班</td>
        <td class="freeTime">暂无排班</td>
      </tr>
      </tbody>
     
    
    
     
     </table>  
     
       
       </div>
       
      </div>
    
    
    <script>
      var nowDate=new Date();
      var year=nowDate.getYear()+1900;
      var month=nowDate.getMonth()+1;
      var date=nowDate.getDate();
      document.getElementsByClassName("appointDate")[0].innerHTML=year+"-"+month+"-"+(date+1);
      document.getElementsByClassName("appointDate")[1].innerHTML=year+"-"+month+"-"+(date+2);
      document.getElementsByClassName("appointDate")[2].innerHTML=year+"-"+month+"-"+(date+3);
      document.getElementsByClassName("appointDate")[3].innerHTML=year+"-"+month+"-"+(date+4);
      document.getElementsByClassName("appointDate")[4].innerHTML=year+"-"+month+"-"+(date+5);
      
    </script>
       
       
       <!--  
      <div style="margin-left:10px;width:650px;height:400px;float:right;/*background:#000;*/">
      <div style="margin:20px 10px;">
     
        <h3>排班表</h3>
     <table  style="border-collapse:separate;width:600px;/*height:200px;*/ border-spacing:0px 20px;cellspacing:10px;/*background:#000;*/">
      <thead>
      <tr>
      <th class="t1">时间段
      <th class="t1">星期一
      <th class="t1">星期二
      <th class="t1">星期三
      <th class="t1"> 星期四
      <th class="t1">星期五
      </thead>
     <tbody>
     <tr>
    
     <td class="" >上午
     <td>可预约人
     <td>可预约人
     <td>可预约人
     <td>可预约人
     <td>可预约人
     
      <tr>
     
      <td class="">下午
        <td><a href="<%=basePath%>doctor/appointment?name=${doctor.dName}&uName=${username}">点击预约</a>
     <td>可预约人
     <td>可预约人
     <td>可预约人
     <td>可预约人
     
     </tbody>
     
     </table>  
     
       
       </div>
       
      </div>
    
    
    -->
    
    
    
    </div>
    
  </body>  
</html>  