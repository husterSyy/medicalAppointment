<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>手机登录</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script src="webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet"
 href="webjars/bootstrap/3.3.5/css/bootstrap.min.css" />
<style type="text/css">
#login {
	width: 450px;
	height: 100px;
	margin: 126px auto;
}

#btn {
	margin-left: 100px;
	margin-top: -25px;
	width: 120px;
	height: 25px;
	font-size: 11px;
}

body {
	/*background-color: #ecfcf9;*/
}
</style>
</head>
<script type="text/javascript">
	var InterValObj; //timer变量，控制时间
	var count = 60; //间隔函数，1秒执行
	var curCount;//当前剩余秒数
	function sendMessage() {
		curCount = count;
		$("#btn").attr("disabled", "true");
		$("#btn").val(curCount + "秒后可重新发送");
		InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次请求后台发送验证码 TODO
	}
	//timer处理函数
	function SetRemainTime() {
		if (curCount == 0) {
			window.clearInterval(InterValObj);//停止计时器
			$("#btn").removeAttr("disabled");//启用按钮
			$("#btn").val("重新发送验证码");
		} else {
			curCount--;
			$("#btn").val(curCount + "秒后可重新发送");
		}
	}
	
	//页面初加载cookie
	$(function(){
    $.ajax({
        type:"POST",
        url: "<%=basePath%>user/getCookie", 
        dataType:"json",
        success:function(data){ 
            $("#username").val(data.loginAccount);
            $("#password").val(data.loginPassword);
            $("#isRememberUsername").attr("checked",true);
        },
        error:function() {
            alert("cookies 信息获取失败！");
        }
    });
});
	
	
</script>
<body>
<div style="width:1200px;height:600px;margin:0 auto;margin-top:200px;">
	<div class="container" style="background:#f0f0f0;width:500px;height:500px;float:left;margin-right:10px;">
		<div id="login" style="margin-top:50px;">
			<fieldset>
				
				<div class="title" >
						<strong style="padding-top:20px;">手机号登录</strong>
					</div>
				<form class="form-horizontal" role="form">
					<div class="form-group" style="margin-top:30px;">
						<label class="col-sm-2 control-label" style="width:100px;">手机号</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="phone" name="phone"
								placeholder="请输入您的手机号" required>
						</div>
					</div>
					<div class="form-group" style="margin-top:30px;">
						<label class="col-sm-2 control-label" style="width:100px;">验证码</label>
						<div class="col-sm-3">
							<input type="code" class="form-control" id="code" name="code"
								placeholder="验证码" required>
							<input class="form-control" id="btn" name="btn" value="发送验证码" style="width:120px;height:30px;"
								onclick="sendMessage()" />
						</div>
					</div>
					<div class="form-group" style="margin-top:30px;">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="btn btn-success" id="lo">手机号登录</button>
							<a href="<%=basePath%>user/register" class="btn btn-info">邮箱注册</a>
						</div>
					</div>
				</form>
			</fieldset>
		</div>
	</div>
	
	
	<div style="margin:0 auto;width:500px;height:500px;float:right;background:#f0f0f0;display:inline">
	
	
	
	<div style="margin:0 auto;margin-top:50px;width:300px;height:300px;">
					<div class="title" >
						<strong>账号登录</strong>
					</div>
					
					<form id="loginForm" action="<%=basePath%>doctor/checklogin"  method="post" >
						<table style="border-collapse:separate; border-spacing:0px 30px;">
							<tbody>
							<tr>
								<th>
										用户名&nbsp;&nbsp;
								</th>
								<td>
									<input type="text"  id="username" name="username" class="text" maxlength="15" style="width:150px;height:30px;"/>
								</td>
							</tr>
							<tr>
								<th>
									密&nbsp;&nbsp;码&nbsp;&nbsp;
								</th>
								<td>
									<input type="password" id="password" name="password" class="text"  maxlength="15"  style="width:150px;height:30px;" autocomplete="off"/>
								</td>
							</tr>
							
								
							<tr>
								<th>&nbsp;
									
								</th>
								<td>
									<label>
										<input type="checkbox" id="isRememberUsername" name="isRememberUsername" value="true">记住用户名
									</label>
									<label>
										&nbsp;&nbsp;<a href="<%=basePath%>user/findPassword">找回密码</a>
									</label>
									
								</td>
							</tr>
							
							<tr>
								<th>&nbsp;
									
								</th>
								<td>
									<input type="submit" class="submit" value="登 录">
								</td>
							</tr>
						
						
						
						</tbody>
						</table>
					</form>
					</div>
				</div>
		
	</div>
</body>
<script type="text/javascript">
	var sms = "";
	var phone;
	$("#btn").click(function() {
		 phone = $("#phone").val();
		if (phone != "") {
			$.ajax({
				url : "<%=basePath%>/user/sendSMS",  //发送请求 
				type : "post",
				data : {
					"phone" : phone
				},
				success : function(result) {
					sms = result;
				}
			});
		} else {
			alert("请输入手机号");
			return false;
		}
	});
	$("#lo").click(function() {
		var code = $("#code").val();
		if (code == "") {
			alert("请输入验证码");
		} else {
			if (sms == code) {
				window.location.href ="<%=basePath%>user/loginSuccess?mobile="+phone;
			} else {
				alert("验证码错误");
			}
			;
		}
		;
	});
</script>
</html>

