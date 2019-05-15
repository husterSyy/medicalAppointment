<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>邮箱注册</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script src="webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet"
 href="webjars/bootstrap/3.3.5/css/bootstrap.min.css" />
<style type="text/css">
#register {
	width: 450px;
	height: 100px;
	margin: 50px auto;
}

#btn {
	margin-left: 197px;
	margin-top: -24px;
	width: 120px;
	height: 25px;
	font-size: 14px;
	color: #7904c9
}

body {
	/*background-color: #ecfcf9;*/
}
</style>


<script type="text/javascript">

$(function(){
	$("#btn").click(function(){
		if($("#email").val()){
			$.ajax({
				type:"POST",
				url :"<%=basePath%>user/sendEmail?random"+Math.random(),
				data:{
					email:$("#email").val(),
				},
				success:function(data){
					alert("验证码发送成功，请注意查收。");
				},
			})
		}else{
			alert("邮箱发送失败");
			$("#notice").html("请填写邮箱");
			setTimeout(function(){
				$("#notice").hide();
			},1000);
		}
	}
	);
		//  判断用户是否可以注册
		$("#submit").click(function() {
			if ($("#email").val()) {
				$("#RegistForm").submit();
			} else { //  如果没有值
				$("#notice").html("请填写完整信息");
				setTimeout(function() {
					$("#notice").hide();
				}, 1000);
			}
		});
	});
</script>
<script type="text/javascript">
	function checkForm(){
		// 校验用户名:
		var username = document.getElementById("username").value;
		if(username == ''){
			alert("用户名不能为空!");
			return false;
		}
		
		// 校验密码:
		var password = document.getElementById("password").value;
		if(password == ''){
			alert("密码不能为空!");
			return false;
		}
		
		// 校验确认密码
		var repassword = document.getElementById("repassword").value;
		if(password != repassword){
			alert("两次密码不一致!");
			return false;
		}
	}
	
	function checkUserName(){
		var username = $("#username").val();
		$("#span1").load("<%=basePath%>user/checkUserName?"+new Date().getTime(),{'username':username});
	}
	
	function change(){
		var img = document.getElementById("checkImg");
		img.src="<%=basePath%>user/checkImg?"+new Date().getTime();
	}
	
	/*
	function checkUserName(){
		// 获得用户名的值:
		var username = document.getElementById("username").value;
		// 1.创建异步加载对象:
		var xhr = createXMLHttpRequest();
		// 2.设置监听
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					var data = xhr.responseText;
					document.getElementById("span1").innerHTML = data;
				}
			}
		}
		// 3.打开连接:
		xhr.open("GET","${pageContext.request.contextPath}/user_checkUserName.action?"+new Date().getTime()+"&username="+username,true);
		// 4.发送
		xhr.send(null);
	}
	
	function createXMLHttpRequest() {
		var xmlHttp;
		try { // Firefox, Opera 8.0+, Safari
			xmlHttp = new XMLHttpRequest();
		} catch (e) {
			try {// Internet Explorer
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
				}
			}
		}

		return xmlHttp;
	}
	*/
</script>
</head>
<body style="background-image: url(../images/background1.jpg);background-size: 100%">
	<div class="container" style="width:1000px;height:600px;margin:0 auto;margin-top:100px;background-color:rgba(255,255,255,0.3);">
		<div id="register">
			<form class="form-horizontal" id="RegistForm" method="post"
				action="<%=basePath%>user/registerServlet"  onsubmit="return checkForm();">
				<fieldset>
					<div id="legend" class="">
						<legend class="">用户注册</legend>
					</div>
					<div class="form-group">
						<!-- Text input-->
						<label class="col-sm-2 control-label" style="width:100px;">账号</label>
						<div class="col-sm-5">
							<input type="text" placeholder="请输入6位数账号..." class="form-control"
						onblur="checkUserName()"	id="username"	required name="username">
						<span id="span1">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" style="width:100px;">密码</label>
						<div class="col-sm-5">
							<input type="password" placeholder="请输入6位数密码..." required
							id="password"	class="form-control" name="password">
						</div>
					</div>
									<div class="form-group">
						<label class="col-sm-2 control-label" style="width:100px;">密码</label>
						<div class="col-sm-5">
							<input type="password" placeholder="请再次输入密码..." required
							id="repassword"	class="form-control" name="password">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" style="width:100px;">邮箱</label>
						<div class="col-sm-5">
							<input type="email" placeholder="请填写邮箱地址..." class="form-control"
								id="email" name="email" required>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" style="width:100px">验证码</label>
						<div class="col-sm-5">
							<input type="text" name="code" id="code" placeholder="请输入邮箱的验证码"
								class="form-control" required> 
								<input type="button" name="btn" style="height:30px;"
								class="form-control" id="btn" value="发送验证码" required />
						</div>
					</div>
					<span id="notice" class="hide">请先完成邮箱验证</span><br />
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<a href="<%=basePath%>user/login" class="btn btn-success">返回登录</a> <input
								class="btn btn-info" type="submit" id="submit" value="邮箱注册" />
						</div>
					</div>
					<!--  -
					<input type="text"
											id="checkcode" name="checkcode" class="text captcha"
											maxlength="4" autocomplete="off"/>
										<img
												id="checkImg" class="captchaImage"
												src="<%=basePath%>user/checkImg"
												title="点击更换验证码" onclick="change()"/>
												
												-->
					
				</fieldset>
			</form>
		</div>
	</div>
</body>
</html>
