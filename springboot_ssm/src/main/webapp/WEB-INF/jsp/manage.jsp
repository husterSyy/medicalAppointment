<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    
    <title>管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/consult.css" rel="stylesheet" type="text/css"/>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
  </head>
  
  <body>
        医生：<c:out value="${sessionScope.doctor.dName }"></c:out>
        
        <!-- 医生与用户聊天界面 -->
        <div class="chat">
        <!-- 对话列表 -->
        <div class="chat-info" id="chat-info"></div>
        
        <div class="chat-window">
          <div class="chat-title"><span id="userInfo"></span></div>
          <textarea id="historyText" readonly="readonly"></textarea>
          
          <div class="seperate">
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
        
          
          /* 当前登录用户 */
          var user1="doctor"+`${sessionScope.doctor.dId}`;
          /* 与此医生聊天的用户 */
          var user2;
          var user2s = new Array();
          var username1=`${sessionScope.doctor.dName}`;
          var flag="doctor";
	    </script>
        <script src="js/webSocket.js"></script>
        <script>
        window.onload=dbObject.init();
        </script>
  </body>
</html>
