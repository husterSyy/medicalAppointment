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

    <style>
    *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
.section{
    margin: 100px auto;
    width: 472px;
    height: 422px;
    background-color: #39a6eb;
    padding: 8px 10px;
    font-family: "Microsoft YaHei";
}
.all{
    width: 450px;
    height: 405px;
}
.nav{
    height: 50px;
}
.nav>a{
    padding: 0 15px;
    width: 225px;
    height: 50px;
    line-height: 50px;
    display: block;
    font-size: 18px;
    font-weight: bold;
    text-align: center;
    float: left;
    cursor: pointer;
}
.nav>a[class="on-2-login"]{
    background-color: #89caf4;
    border-bottom: 1px solid #eee;
}
.login{
    background-color: #89caf4;
}
.login.on{
    background-color: #e1f2fc;
}
.contentbox{
    width: 450px;
}
.cont-1>input{
    width: 350px;
    height: 46px;
    border: 1px solid #c6cddc;
}
.email{
    background-image: url("../img/img1-coin1_03.png");
    background-repeat: no-repeat;
    background-position: 3px 0px;
}
.password{
    background-image: url("../img/img1-coin2_03.png");
    background-repeat: no-repeat;
}
.cont-1>input{
    line-height: 46px;
    padding-left: 40px;
}
.cont-1>input[name="txt"]{
    margin-top: 35px;
}
.cont-1>input[name="psd"]{
    margin-top: 17px;
}
.verify{
    margin: 0 auto;
    width: 352px;
    height: 40px;
    margin-top: 16px;
    border: 1px solid #c4cbd1;
    text-align: center;
    line-height: 40px;
    font-size: 12px;
    color: #b9bbb8;
    border-radius: 20px;
    position: relative;
    z-index: 2;
    behavior: url(PIE.htc);
}
.verify:hover{
    cursor: pointer;
}
.btn{
    width: 350px;
    height: 44px;
    background-color: #39a6eb;
    margin-top: 30px;
    font-size: 18px;
    color: #fff;
}
.btn:hover{
    background-color: rgba(121,177,212,0.9);
}
.about{
    width: 350px;
    height: 26px;
    font-size: 14px;
    margin: 0 auto;
    margin-top: 46px;
}
.about>a{
    text-decoration: none;
    color: #4e6d99;
}
.about>a>span{
    width: 1px;
    height: 12px;
    display: inline-block;
    border: 1px solid #ccd2d0;
}
/*cont:2*/
.cont-2>.text{
    margin: 0 auto;
    width: 350px;
    height: 30px;
    font-size: 15px;
    display: inline-block;
    margin-top: 30px;
}
.cont-2>.text>a{
    text-decoration: none;
    color: #4174a9;
    font-weight: bold;
}
.cont-2>img{
    margin-top: 12px;
}
.contentbox>div{
    width: 450px;
    height: 355px;
    text-align: center;
    display: none;
    background-color: #e1f2fc;
}
.cont-2>.about{
    margin-top: 54px;
}
.contentbox>div[class="box active"]{
    display: block;
}
/*这是低端浏览器下placeholder的字体颜色*/
.cont-1>input{
    color: #bfbfbf;
}
/*这是firefox下placeholder的字体颜色*/
.cont-1>input::-moz-placeholder {
    color: #bfbfbf;
}
/*这是webkit下placeholder的字体颜色*/
.cont-1>input::-webkit-input-placeholder {
    color: #bfbfbf;
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
<body style="background-image: url(../images/background1.jpg);background-size: 100%">

	<div style="width:1000px;margin:0 auto;text-align:center;margin-top:130px;color:#fff;font-size:50px;">城市医疗预约挂号平台</div>
	
	  <div class="section" style="background-color:rgba(255,255,255,0.3);margin-right:200px;margin-top:200px;">
        <div class="all">
            <div class="nav">
                <a class="login on">用户名登陆</a>
                <a class="login">手机号登陆</a>
            </div>
            <div class="contentbox">
                <div class="box active">
                    <div class="cont-1" >
                    
                     <div style="width:300px;margin:0 auto;">
                  
                     <form  class="form-horizontal" role="form"id="loginForm" action="<%=basePath%>user/checklogin"  method="post" >
					<div class="form-group" style="/*margin-top:30px;*/">
						<label class="col-sm-2 control-label" style="width:100px;margin-top:20px">用户名</label>
						<div class="col-sm-5">
							<input class="form-control"  type="text"  id="username" name="username" class="text" maxlength="15" style="width:150px;height:30px;margin-top:20px"/>
						</div>
					</div>
					<div class="form-group" style="margin-top:30px;">
						<label class="col-sm-2 control-label" style="width:100px;">密码</label>
						<div class="col-sm-3">
								<input class="form-control"  type="password" id="password" name="password" class="text"  maxlength="15"  style="width:150px;height:30px;" autocomplete="off"/>
						</div>
					</div>
					<div class="form-group" style="margin-top:30px;">
						<div class="col-sm-offset-2 col-sm-10" style="margin-left:1px;">
								<input type="checkbox" id="isRememberUsername" name="isRememberUsername" value="true">记住用户名
								<a href="<%=basePath%>user/findPassword">找回密码</a>
								<input class="btn btn-success" type="submit" value="登录"/>
									<!--  <button type="button" class="btn btn-success" id="lo1" style="/*margin-left:30px;*/">登录</button>  -->
							<a href="<%=basePath%>user/register" class="btn btn-info" style="margin-right:10px;">邮箱注册</a>
						</div>
					</div>
				</form>
				</div>
                    
                  
			
      
                   
                    </div>
                </div>
                <div class="box">
                    <div class="cont-2" >
                    <div style="width:300px;margin:0 auto;">
                    <form class="form-horizontal" role="form">
					<div class="form-group" style="/*margin-top:30px;*/">
						<label class="col-sm-2 control-label" style="width:100px;margin-top:20px">手机号</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="phone" name="phone"
							style="width:200px;margin-top:20px"	placeholder="请输入您的手机号" required>
						</div>
					</div>
					<div class="form-group" style="margin-top:30px;">
						<label class="col-sm-2 control-label" style="width:100px;">验证码</label>
						<div class="col-sm-3">
							<input type="code" class="form-control" id="code" name="code"
							style="width:100px;"	placeholder="验证码" required>
							<input class="form-control" id="btn" name="btn" value="发送验证码" style="/*margin-left:10px;*/width:120px;height:30px;"
								onclick="sendMessage()" />
						</div>
					</div>
					<div class="form-group" style="margin-top:30px;">
						<div class="col-sm-offset-2 col-sm-10" style="margin-left:1px;">
							<button type="button" class="btn btn-success" id="lo" style="/*margin-left:30px;*/">手机号登录</button>
							<a href="<%=basePath%>user/register" class="btn btn-info" style="margin-right:10px;">邮箱注册</a>
						</div>
					</div>
				</form>
				</div>
                 
                   
                   
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script>
        $().ready(function(){
            $(function(){
                $(".nav a").off("click").on("click",function(){
                    var index = $(this).index();
                    $(this).addClass("on").siblings().removeClass("on");
                    $(".contentbox .box").eq(index).addClass("active").siblings().removeClass("active");
                });
            });
        })
    </script>
	
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
	$("#lo1").click(function() {
		
				window.location.href ="<%=basePath%>user/checklogin";
			
		
	});
</script>
</html>

