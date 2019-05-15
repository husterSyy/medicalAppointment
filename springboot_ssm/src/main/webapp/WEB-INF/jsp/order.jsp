<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户订单界面</title>
    
    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="//cdn.bootcss.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
        
        <script src="//cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
        <script src="/mobile/addon/jquery.mmenu.min.all.js"></script>
        <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        
    
	<link rel="stylesheet" type="text/css" href="css/order.css">
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
 
<div>
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

		    

当前用户:${username}  
    <c:if test="${username!=null}">  
        <a href="${pageContext.request.contextPath }/user/logout.action">退出</a>  
    </c:if>  
    
</div>

    <table class="table-title">
    	<tr>
    	  <td>用户</td>
      	  <td>医生</td>
      	  <td>金额</td>
     <!-- 	  <td>预约时间</td>  -->
     	  <td>订单状态</td>
      	  <td>操作</td>
      	</tr>
    </table>
    
    <!-- 用户所有订单 -->
    <c:forEach items="${orders }"  var="order">
     <script>
    	  	    function cancelAppoint(){
    	  	      $.ajax({
    	  	      	url:"appoint/cancel?oid="+`${order.oid}`,
              		success:function(data){
    	  	      		alert("取消订单成功！");
    	  	      		window.location="order";
    	  	      	},
    	  	      	error:function(){
    	  	      		alert("error");
    	  	      	}
    	  	      })
    	  	    }
    	  	    </script>
    	  	
	  <table class="order-table">
    	<tr>
    	  <td>
    	  	<c:out value="${sessionScope.user.uName }"></c:out>
    	  </td>
      	  <td>
      	  	<c:out value="${order.dname }"></c:out>
      	  </td>
      	  <td>
      	  	<c:out value="${order.money }"></c:out>
      	  </td>
     <!--  -  <td>
      	  	
          <label id="appointedtime"></label>
      	  
      	  
      	  
      	  
      	  </td>
      	  -->
      	  <!-- 判断订单状态，进行不同操作 -->
      	  <c:choose>
      	    <c:when test="${order.state==0 }">
      	      <td>
      	  		<c:out value="未付款"></c:out>
      	  	  </td>
      	  	  <td>
      	  		<a href="<%=basePath%>alipay/goPay.action?orderId=${order.oid }">去付款</a><br>
      	  		<label  style="color:#0066ff;" onclick="cancelAppoint()">取消订单</label><br>
      	  		<a href="order/detail?oid=${order.oid }">订单详情</a>
      	  	  </td>
      	    </c:when>
      	 
      	    <c:when test="${order.state==1 }">
      	      <td>
      	  		<c:out value="未看病"></c:out>
      	  	  </td>
      	  	  <td>
      	  		<a href="">退款</a>
      	  		<a href="order/detail?oid=${order.oid }">订单详情</a>
      	  	  </td>
      	    </c:when>
      	    
      	    <c:otherwise>
      	      <td>
      	  		<c:out value="已完成"></c:out>
      	  	  </td>
      	  	  <td>
      	  		<a href="order/detail?oid=${order.oid }">去评价</a>
      	  	  </td>
      	    </c:otherwise>
      	  </c:choose>
      	</tr>
      </table>
      
      
    </c:forEach>
          	  <script>
    	  	  
    	  	    var nowDate=new Date();
      			var year=nowDate.getYear()+1900;
      			var month=nowDate.getMonth()+1;
      			var date=nowDate.getDate();
      			var appointedtime=${order.appointedtime};
      			if(appointedtime<=5){
      				document.getElementById("appointedtime").innerHTML=year+"/"+month+"/"+(date+appointedtime)+" 上午";
      			}else{
      				document.getElementById("appointedtime").innerHTML=year+"/"+month+"/"+(date+appointedtime-5)+" 下午";
      			}
    	  	    
    	  	  
    	  	  </script>
    
    
  </body>
</html>
