<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" deferredSyntaxAllowedAsLiteral="true" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!-- 用户与医生交流，用户界面 -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>在线咨询</title>
    <link href="css/consult.css" rel="stylesheet" type="text/css"/>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    
      <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="//cdn.bootcss.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
        
        <script src="//cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
        <!-- <script src="/mobile/addon/jquery.mmenu.min.all.js"></script> -->
        <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        
    
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
  
  
    <!-- 页首登录链接 -->
   <!--      用户:	<c:out value="${sessionScope.user.uName }"></c:out>  -->
        
        <div class="chat">
        
        <div class="chat-info">
        <div class="chat-info-portrait">
          <img alt="医生头像" src="${doctor.dPhoto}" ><br>
        </div>
        <div class="chat-info-text">
        	医生：${doctor.dName }<br>
         
          	职务：${doctor.dType }<br>
        </div>
        </div>
        
        <div class="chat-window">
          <div class="chat-title">${doctor.dName }</div>
          <textarea id="historyText" readonly="readonly"></textarea>
          
          <div class="seperate" height="100px">
            <label class="button1" for="ifile">上传图片</label>
			<form id="uploadForm" enctype="multipart/form-data">
            <input type="file" id="ifile" name="ifile" accept="image/png,image/jpeg,image/jpg"  style="position:absolute;clip:rect(0 0 0 0);">
            <input type="hidden" id="ifilename" name="ifilename">
            </form>
            <span>支持后缀为.png、.jpg、.jpeg格式的图片</span>
            <div id="show-img-upload">
            </div>
          </div>
          
          <textarea id="inputText"></textarea>
          <div id="button-area">
            <input type="image" onclick="sendText()" src="images/button-send.png" width="13%">
          </div>
        </div>
        </div>
        
        <!-- 显示传来的图片 -->
        <table id="img-table">
        
        </table>
        
        <script type="text/javascript">
          var inputText=document.getElementById("inputText");
          var show=document.getElementById("show-img-upload");
          var imgUpload=document.getElementById("ifile");
          var file;
          /* 取消图片发送 */
		  function cancelImg(){
			show.innerHTML="";
			imgUpload.value=null;
		  }
		  
		  
          /* 上传图片后显示在页面 */
          function checkFile(files){
			file = files[0];
			var reader = new FileReader();
			
			reader.onload = function(e){
			show.innerHTML = '<div id="show-img-upload-inner"><p>要发送的图片：</p><img src="'+e.target.result+
			  '" alt="img" width="90px"><p class="button1" onclick="sendImg()">发送</p>'+
			  '<p class="button2" onclick="cancelImg()">取消</p></div>';
			}
			reader.readAsDataURL(file);
		  }
          
          /* 上传图片 */
          imgUpload.addEventListener('change', function(e) {
          	var files = this.files;
    		if(files.length){
    		  //如果有文件被选中
        	  checkFile(this.files); 
        	}
          });

          /* 聊天 */
          var user1="user"+`${sessionScope.user.uId}`;
          var user2="doctor"+`${doctor.dId}`;
          var username1=`${sessionScope.user.uName}`;
          var username2=`${doctor.dName}`;
          var flag="user";
	    </script>
        <script src="js/webSocket.js"></script>
        <script>
        window.onload=dbObject.init();
        </script>

  </body>
</html>
