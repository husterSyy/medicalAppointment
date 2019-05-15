<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<scriptlanguage="javascript" type="text/javascript"src="./javascript/anychatsdk.js"charset="GB2312"></script>
<scriptlanguage="javascript" type="text/javascript"src="./javascript/anychatevent.js"charset="GB2312"></script>
<script>
var mDefaultServerAddr ="demo.anychat.cn";                 // 默认服务器地址
var mDefaultServerPort = 8906;                                       // 默认服务器端口号
var mSelfUserId = -1;                                                // 本地用户ID
var mTargetUserId = -1;                                    // 目标用户ID（请求了对方的音视频）


// 页面加载完成 初始化
function LogicInit(){    // 初始化  
    varNEED_ANYCHAT_APILEVEL = "0";
    varerrorcode = BRAC_InitSDK(NEED_ANYCHAT_APILEVEL);
    if(errorcode == GV_ERR_SUCCESS)    // 初始化插件成功  
       document.getElementById("login_div").style.display ="block";  // 显示登录界面  
   else    // 没有安装插件，或是插件版本太旧，显示插件下载界面  
       document.getElementById("prompt_div").style.display ="block";    // 显示提示层  
}
// 登录系统
function LoginToHall() {
   BRAC_Connect(mDefaultServerAddr, mDefaultServerPort);  // 连接服务器  
   BRAC_Login(document.getElementById("username").value, "",0);    // 登录系统，密码为空也可登录  
}
调用登录函数后首先会触发连接服务器函数
// 客户端连接服务器，bSuccess表示是否连接成功，errorcode表示出错代码
functionOnAnyChatConnect(bSuccess, errorcode) {
    if(errorcode == 0) { }    // 连接服务器成功      
     elsealert("连接服务器失败");     //连接失败作提示，此时系统不会触发登录系统函数
}
连接服务器成功后会触发登录系统回调函数
// 客户端登录系统，dwUserId表示自己的用户ID号，errorcode表示登录结果：0 成功，否则为出错代码，参考出错代码定义
functionOnAnyChatLoginSystem(dwUserId, errorcode) {
    if(errorcode == 0) {    // 登录成功，显示大厅界面，隐藏登录界面。失败的话什么也不做，维持原状  
       mSelfUserId = dwUserId;
       document.getElementById("login_div").style.display ="none";   //隐藏登录界面  
       document.getElementById("hall_div").style.display ="block";   //显示大厅界面  
    }
}

</script>
</head>
<body>

</body>
</html>