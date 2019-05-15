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
    
    <title>评价详情</title>
	
	<link rel="stylesheet" type="text/css" href="css/order.css">
	<link rel="stylesheet" type="text/css" href="css/rating.css">

	<link rel="stylesheet" type="text/css" href="css/jquery.raty.css">
	
	
	
    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="//cdn.bootcss.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
        
        <script src="//cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
        <script src="/mobile/addon/jquery.mmenu.min.all.js"></script>
        <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        
    <script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/jquery.raty.js"></script>
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
	
	<script>
	  var skillScore;
	  var serviceScore;
	  var effectScore;
	  var time,moretime,ordertime;
	  ordertime=`${order.ordertime}`;
	  //添加评论
	  function submitRating(){
	    if(skillScore==undefined){
	      alert("请对医疗水平进行评价！");
	      return false;
	    }else if(serviceScore==undefined){
	      alert("请对服务态度进行评价！");
	      return false;
	    }else{
	      //发送到后台
	      var rdetail=document.getElementById("rdetail").value;
	      var rating={
	        "dname":`${order.dname}`,
	        "oid":${order.oid},
	        "uid":${order.uid},
	        "uname":`${sessionScope.user.uName}`,
			"rdetail":rdetail,
			"rskill":skillScore,
			"rservice":serviceScore
	      };
	      //传到后台
	      $.ajax({
			type:"POST",
			url:'rating/addRating',
			data:JSON.stringify(rating),
			headers	:{'Content-Type': 'application/json'},
			success:function(data){
				alert("成功!");
				if(data.result=="success")
					window.location.href = 'order';
			},
			error:function(){
				alert("失败!");
			}
		  });
	      return true;
	    }
	  }

	</script>
	
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
 	
 	 var appointedtime;
    	  	    function getTime(){
    	  	    	$.ajax({
    	  	      	url:"appoint/getTime?aId="+`${order.appointedtime}`,
              		success:function(data){
              			
    	  	      		appointedtime=data.appointedtime;
    	  	      		console.trace(appointedtime);
    	  	      		var nowDate=new Date();
      					var year=nowDate.getYear()+1900;
      					var month=nowDate.getMonth()+1;
      					var date=nowDate.getDate();
      			
      					if(appointedtime<=5){
      						document.getElementById("appointedtime").innerHTML=year+"/"+month+"/"+(date+appointedtime)+" 上午";
      					}else{
      						document.getElementById("appointedtime").innerHTML=year+"/"+month+"/"+(date+appointedtime-5)+" 下午";
      					}
    	  	      	},
    	  	      	error:function(){
    	  	      		alert("error");
    	  	      	}
    	  	      })
    	  	  }
    	  	  
    	  	  
 		window.onload=function(){
 		getTime();
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
    
  
    <!-- 显示订单详情 -->
  <div class="order">
    <div class="orderdetail-title">
     	订单详情
    </div>
    <div class="order-inner">
 		<p><strong>订单号：</strong>&emsp;&emsp;${order.oid }</p>
 		<p><strong>用户名：</strong>&emsp;&emsp;${sessionScope.user.uName }</p>
 		<p><strong>医生姓名：</strong>&emsp;${order.dname }</p>
    	<!--  <p><strong>详情：</strong>&emsp;&emsp;&emsp;${order.detail }</p>  -->
    	<p><strong>费用：</strong>&emsp;&emsp;&emsp;${order.money }</p>
    	<p><strong>下单时间：</strong>&emsp;<label id="ordertime"></label></p>
    	<!-- <p><strong>约定时间：</strong>&emsp;${order.appointedtime }</p>   -->
    	<p><strong>约定时间：</strong>&emsp;<label id="appointedtime"></label></p>
    	<!--  <p><strong>地点：</strong>&emsp;&emsp;&emsp;${order.address }</p> -->
    	<p><strong>订单状态：</strong>&emsp;
    	
    	  <c:choose>
    	    <c:when test="${order.state==0 }">
    	  	  未付款
    	  	  &emsp;&emsp;<a href="<%=basePath%>alipay/goPay.action?orderId=${order.oid}">去付款</a>
    	 
    	  	  &emsp;&emsp;<label onclick="cancelAppoint()" style="color:#4187F1">取消订单</label><br>
    	  	  <script>
    	  	  
    	  	    function cancelAppoint(){
    	  	      $.ajax({
    	  	      	url:"appoint/cancel?oid="+`${order.oid}`,
              		success:function(data){
    	  	      		alert("取消订单成功！");
    	  	      		window.location="doctor/getDoctorByName?name="+`${order.dname }`;
    	  	      	},
    	  	      	error:function(){
    	  	      		alert("error");
    	  	      	}
    	  	      })
    	  	    }
    	  	    window.onload=getTime();
    	  	   
    	  	  </script>
    	  	  
    	  	  
    	    </c:when>
    	    <c:when test="${order.state==1 }">
    	  	  未看病
    	  	  &emsp;&emsp;<a href="">退款</a><br>
    	    </c:when>
    	    <c:otherwise>
    	  	  已完成<br>
    	    </c:otherwise>
    	  </c:choose>
    	</p>
    </div>
  </div>
  
    <script>
    	$("#ordertime").html(ordertime);
    </script>
    
    
    <!-- 评论部分 -->
    <c:if test="${order.state==2 }">
    <c:choose>
      <c:when test="${rating==null }">
      <div class="rating">
      <div class="rating-title">
      	添加评论
      </div>
      
      <div class="rating-inner">
      <div class="rating-left">
       	医疗水平：
        <div id="star-skill"></div>
		服务态度：
        <div id="star-service"></div>
      </div>
      
      <div class="rating-right">
      	详细评论：
        <textarea placeholder="详细评论" id="rdetail"></textarea><br/>
      </div>
      </div>
      <div class="rating-bottom">
        <input type="image" onclick="return submitRating()" src="images/button-submit.png" width=11%">
      </div>
      </div>
        <script type="text/javascript">
      	  $.fn.raty.defaults.half = true;
	  	  /* 点击后赋值 */
	  	  $('#star-skill').raty({
  			click: function(score, evt) {
  			  skillScore=score;
  			}
		  });
		  $('#star-service').raty({
  			click: function(score, evt) {
  			  serviceScore=score;
  			}
		  });
	    </script>
      </c:when>
      
      <c:when test="${rating.reffect==null }">
      <div class="rating">
      <div class="rating-title">
      	评论详情
      </div>
      <div class="rating-inner">
      <div class="rating-left">
      	医疗水平：
        <div id="star-skill"></div>
		服务态度：
        <div id="star-service"></div>
      </div>
      <div class="rating-right">
		详细评论：<br>${rating.rdetail }<br>
      </div>
	  </div>
	  <div class="rating-bottom">
	  	评论时间：<label id="rtime"></label><br>
	  	<input type="image" onclick="return deleteRating()" src="images/button-delete.png" width=11%">
	  </div>
      </div>
      
      <div class="ratingmore">
      <div class="ratingmore-title">
      	添加追评
      </div>
      <div class="rating-inner">
      <div class="rating-left">
      	医疗效果：
        <div id="star-effect"></div>
      </div>
      <div class="rating-right">
      	追加详评：
        <textarea placeholder="详细评论" id="rmore"></textarea><br/>
      </div>
      </div>
        <script type="text/javascript">
        
          //添加追评
	  	  function submitMoreRating(){
	    	if(effectScore==undefined){
	      		alert("请对医疗效果进行评价！");
	      		return false;
	    	}else{
	      	//发送到后台
	      		var rmore=document.getElementById("rmore").value;
	      		var rating={
	        		"rid":${rating.rid},
					"rmore":rmore,
					"reffect":effectScore
	      		};
	      		$.ajax({
					type:"POST",
					url:'rating/moreRating',
					data:JSON.stringify(rating),
					headers	:{'Content-Type': 'application/json'},
					success:function(data){
						alert("成功!");
						if(data.result=="success")
							window.location.href = 'order';
					},
					error:function(){
						alert("失败!");
					}
		  		});
	    	}
	  	  }
	  	  
	  	  //删除
	  	  function deleteRating(){
	    	if(confirm('确认要删除此条评论吗？')){
	      		location.href=`rating/deleteRating?rid=${rating.rid }`;
	    	}
	  	  }
          //评论
          $.fn.raty.defaults.half = true;
          skillScore=${rating.rskill};
          serviceScore=${rating.rservice};
          time=`${rating.rtime}`;
          $("#star-skill").raty({readOnly:true,score:skillScore});
          $("#star-service").raty({readOnly:true,score:serviceScore});
          $("#rtime").html(new Date(time).toLocaleDateString());
          
	  	  //追评
	  	  $('#star-effect').raty({
  			click: function(score, evt) {
  			effectScore=score;
  			}
		  });
	    </script>
	  <div class="rating-bottom">
        <input type="image" onclick="return submitMoreRating()" src="images/button-submit.png" width=11%">
      </div>
      </div>
      </c:when>
      
      <c:otherwise>
      <div class="rating">
      <div class="rating-title">
      	评论详情
      </div>
      <div class="rating-inner">
      <div class="rating-left">
      	医疗水平：
        <div id="star-skill"></div>
		服务态度：
        <div id="star-service"></div>
      </div>
      <div class="rating-right">
		详细评论：<br>${rating.rdetail }<br>
      </div>
	  </div>
	  <div class="rating-bottom">
	  	评论时间：<label id="rtime"></label><br>
	  	<input type="image" onclick="return deleteRating()" src="images/button-delete.png" width=11%">
	  </div>
      </div>
	  
	  <div class="ratingmore">
      <div class="ratingmore-title">
      	追评详情
      </div>
      <div class="rating-inner">
      <div class="rating-left">
      	医疗效果：
        <div id="star-effect"></div>
      </div>
      <div class="rating-right">
       	追加评论：<br>${rating.rmore }<br>
      </div>
      </div>
      <div class="rating-bottom">
      	评论时间：<label id="rmoretime"></label><br>
      </div>
      </div>
        <script type="text/javascript">
          $.fn.raty.defaults.half = true;
          skillScore=${rating.rskill};
          serviceScore=${rating.rservice};
          effectScore=${rating.reffect};
          
          time=`${rating.rtime}`;
          moretime=`${rating.rmoretime}`;
          $("#star-skill").raty({readOnly:true,score:skillScore});
          $("#star-service").raty({readOnly:true,score:serviceScore});
          $("#star-effect").raty({readOnly:true,score:skillScore});
          $("#rtime").html(new Date(time).toLocaleDateString());
          $("#rmoretime").html(new Date(moretime).toLocaleDateString());
          
          //删除
	  	  function deleteRating(){
	    	if(confirm('确认要删除此条评论吗？')){
	      		location.href=`rating/deleteRating?rid=${rating.rid }`;
	    	}
	  	  }
	    </script>
      </c:otherwise>
    </c:choose>
    </c:if>

    
  </body>
</html>
