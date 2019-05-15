<%@ page contentType="text/html; charset=utf-8"%> 
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link rel="stylesheet" href="css/login.css">
    <title>Login</title>
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
<body>
    <div class="section">
        <div class="all">
            <div class="nav">
                <a class="login on">普通登陆</a>
                <a class="login">二维码登陆</a>
            </div>
            <div class="contentbox">
                <div class="box active">
                    <div class="cont-1">
                        <input class="icon email" name="txt" type="text" placeholder="邮箱">
                        <input class="icon password" name="psd" type="password" placeholder="密码">
                        <div class="verify">
                            >>>请依次点击"敏"，"享"，"昔"完成验证>>>
                        </div>
                        <button class="btn">登&nbsp;&nbsp;陆</button>
                        <div class="about"><a href="#">忘记密码?&nbsp;&nbsp;<span></span>&nbsp;&nbsp;注册&nbsp;&nbsp;<span></span>&nbsp;&nbsp;关于网易邮箱帐号</a></div>
                    </div>
                </div>
                <div class="box">
                    <div class="cont-2">
                        <span class="text">使用&nbsp;<a href="#">网易帐号管家</a>&nbsp;或&nbsp;<a href="#">邮箱大师</a>&nbsp;扫一扫快速登陆</span>
                        <img src="img/img2_01.png" width="190" height="190">
                        <div class="about"><a href="#">忘记密码?&nbsp;&nbsp;<span></span>&nbsp;&nbsp;注册&nbsp;&nbsp;<span></span>&nbsp;&nbsp;关于网易邮箱帐号</a></div>
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
    <!--[if lte IE 9]>
     <script src="https://cdn.bootcss.com/jquery-placeholder/2.3.1/jquery.placeholder.min.js"></script>
     <script>
        $(function(){
            $('input[placeholder]').placeholder();
            $('.password').css({"margin-top":"17px"})
        });
     </script>
    <![endif]-->
</body>
</html>
