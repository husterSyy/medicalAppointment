<%@ page contentType="text/html; charset=utf-8"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
       
        <meta name="viewport" content="width=device-width, initial-scale=1">

　       <link  href = "css/bootstrap.css" rel = "stylesheet" type = "text/css"/>
        <!-- bootstrap.js -->        
        <script src = "js/jquery-1.9.1.js"> </script>
        <!-- bootstrap.js -->
            <script src = "js/bootstrap.js"></script>

  <script>
  function changeMyType(scope){
var myType=$(scope).val();
if(myType==1){
$(".search-content").attr("placeHolder","请输入您要查找的科室");

}else if(myType==2){
$(".search-content").attr("placeHolder","请输入您要查找的医院");

document.forms[0].action="<%=basePath%>hospital/selectHospital";

}else if(myType==3){
$(".search-content").attr("placeHolder","请输入您要查找的医生");
document.forms[0].action="<%=basePath%>doctor/selectDoctor";

}else{
}
}
  </script>
  
 
        <title>城市医疗预约平台首页</title>
        
        <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="//cdn.bootcss.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
        
        <script src="//cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
        <script src="/mobile/addon/jquery.mmenu.min.all.js"></script>
        <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        
 <style type="text/css">
        
	@charset "utf-8";
* {
    margin: 0;
    padding: 0;
    list-style-type: none;
    /*background:#9f9;*/
}

a,
img {
    border: 0;
}

body {
    line-height: 2em;
    background-color: #ffffff;
    font-family: arial, helvetica, sans-serif;
    color: #666666;
    font-size: 12px
}



a {
    color: #666666;
    text-decoration: none;
    -webkit-transition-property: color;
    -moz-transition-property: color;
    -o-transition-property: color;
    transition-property: color;
    -webkit-transition-duration: .2s;
    -webkit-transition-timing-function: ease-in;
    -moz-transition-duration: .2s;
    -moz-transition-timing-function: ease-in;
    -o-transition-duration: .2s;
    -o-transition-timing-function: ease-in;
    transition-duration: .2s;
    transition-timing-function: ease-in
}

a:hover {
    color: #cd0606;
    text-decoration: underline
}


/* hc_lnav */

.hc_lnav {
    z-index: 9999;
    position: relative;
    width: 190px;
    margin: 40px 0 0 120px;
}

.hc_lnav .allbtn {
    z-index: 99999;
    position: relative
}

.hc_lnav .allbtn h2 {
    font-size: 14px;
    box-shadow: 2px 0px 6px -3px #428000;
    -webkit-box-shadow: 2px 0px 6px -3px #428000;
    -moz-box-shadow: 2px 0px 6px -3px #428000
}

.hc_lnav .allbtn h2 a {
    line-height: 36px;
    background-color: #358000;
    padding-left: 10px;
    width: 180px;
    display: block;
    font-family: 微软雅黑, 黑体;
    height: 36px;
    color: #ffffff;
    font-size: 14px;
    font-weight: normal
}

.hc_lnav .allbtn h2 a:hover {
    background-color: #358000;
    text-decoration: none;
    }

.hc_lnav .allbtn h2 i {}

.hc_lnav .allbtn h2 strong {}

.hc_lnav .allbtn ul {
    z-index: 99999;
    position: absolute;
    background-color: #60a411;
    width: 190px;
    display: block;/*可以设置菜单是显示还是隐藏   display：none；为隐藏*/
    height: /*486px;*/640px;
    top: 36px;
    left: 0px
}

body.hc_home .hc_lnav .allbtn ul {
    display: block
}

body.hc_list .hc_lnav .allbtn ul {
    display: block
}

.hc_lnav .allbtn ul li {
    padding-bottom: 7px;
    zoom: 1;
    clear: both;
    cursor: default
}

.hc_lnav .allbtn ul li .tx {
    background-image: url(../images/header/header_bg1.png);
    line-height: 35px;
    background-color: #559b0d;
    padding-left: 10px;
    background-repeat: no-repeat;
    background-position: right center;
    height: 35px;
    _background-image: none
}

.hc_lnav .allbtn ul li .tx a {
    font-family: 微软雅黑, 黑体;
    color: #ffffff;
    font-size: 14px;
    -webkit-transition: color 0.1s ease-out 0s;
    -moz-transition: color 0.1s ease-out 0s;
    -ms-transition: color 0.1s ease-out 0s;
    -o-transition: color 0.1s ease-out 0s;
    transition: color 0.1s ease-out 0s
}

.hc_lnav .allbtn ul li .tx a i {
    line-height: 25px;
    margin-top: 5px;
    width: 25px;
    background-position: 0px 0px;
    float: left;
    height: 25px;
    margin-right: 10px;
    text-decoration: none
}

.hc_lnav .allbtn ul li.a1 .tx a i {
    background-image: url(../images/header_ico1.png)
}

.hc_lnav .allbtn ul li.a2 .tx a i {
    background-image: url(../images/header_ico2.png)
}

.hc_lnav .allbtn ul li.a3 .tx a i {
    background-image: url(../images/header_ico3.png)
}

.hc_lnav .allbtn ul li.a4 .tx a i {
    background-image: url(../images/header_ico4.png)
}

.hc_lnav .allbtn ul li dl {
    zoom: 1;
    color: #ffffff;
    clear: both;
    overflow: auto;
    padding-top: 4px
}

.hc_lnav .allbtn ul li dl a {
    line-height: 22px;
    white-space: nowrap;
    float: left;
    color: #d9e7ce;
    margin-left: 6px;
    margin-right: 6px;
    -webkit-transition: color 0.1s ease-out 0s;
    -moz-transition: color 0.1s ease-out 0s;
    -ms-transition: color 0.1s ease-out 0s;
    -o-transition: color 0.1s ease-out 0s;
    transition: color 0.1s ease-out 0s
}

.hc_lnav .allbtn ul li dt {
    padding-left: 10px;
    width: 30px;
    float: left;
    padding-top: 1px
}

.hc_lnav .allbtn ul li dd {
    line-height: 22px;
    width: 150px;
    float: left;
    padding-top: 2px
}

.hc_lnav .allbtn ul li .pop {
    border-bottom: #599900 2px solid;
    position: absolute;
    border-left: medium none;
    padding-bottom: 10px;
    background-color: #fcfcfc;
    min-height: 466px;
    padding-left: 30px;
    width: 640px;
    padding-right: 30px;
    display: none;
    height: 464px;
    border-top: medium none;
    top: 0px;
    border-right: #599900 2px solid;
    padding-top: 10px;
    left: 190px;
    box-shadow: 4px 4px 5px -1px #999999;
    -webkit-box-shadow: 4px 4px 5px -1px #999999;
    -moz-box-shadow: 4px 4px 5px -1px #999999
}

.hc_lnav .allbtn ul li .pop h3 {
    display: none;
    font-size: 15px
}

.hc_lnav .allbtn ul li .pop dl {
    padding-bottom: 6px;
    color: #666666;
    padding-top: 6px
}

.hc_lnav .allbtn ul li .pop dl:hover {
    background-color: #f3f3f3
}

.hc_lnav .allbtn ul li .pop dl a {
    color: #666666;
    margin-left: 12px;
    margin-right: 12px
}

.hc_lnav .allbtn ul li .pop dl a.un {
    color: #a5a5a5
}

.hc_lnav .allbtn ul li .pop dt {
    padding-left: 0px;
    width: 72px
}

.hc_lnav .allbtn ul li .pop dd {
    width: 565px;
    margin-left: -12px
}

.hc_lnav .allbtn ul li .pop .act {
    width: 640px;
    height: 80px;
    overflow: hidden;
    padding-top: 10px
}

.hc_lnav .allbtn:hover ul {
    display: block
}

.hc_lnav .allbtn ul li:hover {
    background-color: #fcfcfc
}

.hc_lnav .allbtn ul li:hover .tx {
    background-color: #f5f5f5
}

.hc_lnav .allbtn ul li:hover .tx a {
    color: #333333
}

.hc_lnav .allbtn ul li:hover .tx a i {
    background-position: 0px -25px
}

.hc_lnav .allbtn ul li:hover .pop {
    display: block;
    top: 0px;
    left: 190px
}

.hc_lnav .allbtn ul li:hover .pop dl a.un {
    color: #a5a5a5;
    text-decoration: none
}

.hc_lnav .allbtn ul li:hover dl {
    color: #6e6e6e
}

.hc_lnav .allbtn ul li:hover a {
    color: #666666
}

.hc_lnav .allbtn ul li:hover a:hover {
    color: #cd0606
}
</style>
      
<style type="text/css">
    *{
        margin:0px;
        padding:0px;
    
    }
    .title{margin:0px;
     positoin:fixed;
     top:0;
    }
    #carousel-example-generic{
        width:1000px;
        height:480px;
    margin:0 auto;
    }
  
  
    #search-wrap{
     /*   position:absolute;*/
        margin-top:-10px;　<!--达到覆盖图片轮播底部的作用-->　
        left:50%;　　　　　　<!--这部分是搜索框居中显示的关键。-->
     /*   margin-left:-130px;*/
        width:260px;　　　　
        height:36px;　　　　
        border-radius:18px;
        box-shadow: 0 0 3px rgba(0,0,0,.14);
        background-color:#FFF;
        
        float:right;
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
}

	#menu{width:700px;}

    .type{width:900px;height:80px;line-height:50px;padding:10px 25px;list-style:none;margin:0px auto;}
    .list{margin:20px 50px;float:left;}
    
    .main{margin:0 auto;}
     .types{float:left;}
     
</style>        
</head>


<body style="background-image: url(../images/background1.jpg);background-size: 100%">
<div style="background-color:rgba(255,255,255,0.3);">
<div class="title">


      <nav class="navbar navbar-default" role="navigation"> 
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
            <span class="sr-only">展开导航</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span> 
        </button>
        <a class="navbar-brand" href="#">城市预约挂号平台</a>
    </div>
    <div class="collapse navbar-collapse" id="menu" style="background-color:rgba(255,255,255,0.3);">
        <ul class="nav navbar-nav" style="background-color:rgba(255,255,255,0.3);">
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

当前用户:${username}  
    <c:if test="${username!=null}">  
        <a href="${pageContext.request.contextPath }/user/logout.action">退出</a>  
    </c:if>  
    
</div>


<form method="post"  action="<%=basePath%>hospital/selectHospital">
<div id="search" style="float:right;
        width:400px;height:100px;margin-right:50px;">
<!-- 搜索框 -->

<div style="width:380px;height:36px;/*background:#000;*/">
	<div style="width:120px;height:36px;display:inline;margin-right:5px;">
	 <select style="width:100px;height:36px;" name="" id="myType" onchange="changeMyType(this)" >
	<!--  <option id="type1" value="1" >科室</option> -->
	<option id="type2" value="2" selected="selected">医院</option>
	<option id="type3" value="3" >医生</option>
	</select>
	</div>

<div id="search-wrap" style="display:inline;   margin-top:-2px;　margin-left:0px;
       left:50%;　　　　
        width:200px;　　　　
        height:40px;　　　　
        border-radius:18px;
        box-shadow: 0 0 3px rgba(0,0,0,.14);
        background-color:#FFF;
        
       float:right;">
	
	    <input class="search-content"  type="text" id="text" placeholder="请输入您要查找的医院" name="name" autocomplete="off">
	  
	    <button class="search-btn" type="submit">搜索</button>
	</div>
	
	<div id="tips" style="display: none; 
        	margin-top:-10px;width: 171px;  border: 1px solid pink
        	z-index: 999999;">
        </div>
        


	</div>
	
</div>
        
</form>



<div class="main" >
       
        
        <div  class="collapse navbar-collapse" id="menu">
           <ul class="type ">
              <li class="list"><a href="<%=basePath%>department/allDepartment">按科室查找</a> </li>
               <li class="list"><a href="<%=basePath%>hospital/allHospital?name=${username}">按医院查找</a> </li>
               <li class="list"><a href="<%=basePath%>doctor/allDoctor?name=${username}">按医生查找</a> </li>
           </ul>
        </div>
     
     <div style="float:left;">   
        <div style="margin:0 auto;width:1000px;height:900px;/*background:#000;*/margin-left:180px;float:left;">
        
	<div class="hc_lnav jslist" style="margin-left:20px;">
	    <div class="allbtn">
	        <h2><a href="#"><strong>&nbsp;</strong>全部科室<i>&nbsp;</i></a></h2>
	        
	        
	           <ul style="width:190px" class="jspop box">
	                
            
            <c:if test="${!empty departmentList}">
    
        
                <c:forEach items="${departmentList}" var="department">
                   <li class="a2">
	               <!--   <div class="tx"><a href="#"><i>&nbsp;</i> </a> </div> -->
	                <dl>
	                    <dt  style="margin-bottom:5px;"><a style="margin-top:15px;margin-left:30px;font-size:20px;text-align:center;">${department.dName}</a></dt>
	                    <dd style="margin-left:12px;margin-top:20px;">
	                    <!--  
	                        <a href="<%=basePath%>disease/findDiseaseByName?name=胃炎">胃炎</a>
	                        <a href="<%=basePath%>disease/findDiseaseByName?name=哮喘">哮喘</a>
	                        <a href="<%=basePath%>disease/findDiseaseByName?name=甲亢">甲亢</a>
	                     	 <a href="<%=basePath%>disease/findDiseaseByName?name=风湿病">风湿病</a>
	                     	 -->
	                    </dd>
	                </dl>
	                
	                <div class="pop">
	                    <h3><a href="#">${department.dName}</a></h3>
	                
	                        <dl>
	                            <dt style="width:200px;">${department.dName}</dt>
	                            <dd>
	                            
	                            
	                              <c:if test="${!empty department.sDepartmentList}">
           
        
                <c:forEach items="${department.sDepartmentList}" var="sdepartment">
               
                  <a class="ui-link"  href="<%=basePath%>disease/findDiseaseByName?name=${sdepartment.sdName}">${sdepartment.sdName}</a>   
            
                </c:forEach>
           
            </c:if>
	                              
	                               
	                            </dd>
	                        </dl>
	                      
	                      
	                        <dl>
	                            <dt style="width:200px;">${department.dName}常见疾病</dt>
	                            <dd>
	                            
	                            
	                              <c:if test="${!empty department.diseaseList}">
           
        
                <c:forEach items="${department.diseaseList}" var="disease">
               
                  <a class="ui-link" href="<%=basePath%>disease/findDiseaseByName?name=${disease.sName}">${disease.sName}</a>   
            
                </c:forEach>
           
            </c:if>
	                              
	                               
	                            </dd>
	                        </dl>
	                      
	                     
	                </div>
	            </li>
            
            
                </c:forEach>
     
            </c:if>
	  </ul>       
	       
	            
	    
	    </div>
	    
  
    
    <div class="content">


<!-- bootstrap  轮播-->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      </ol>
    
      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox">
        <div class="item active" style="width:800px;height:480px;">
       <div style="margin-left:190px;">   <img src="/static//image/1.png" style="width:800px;height:480px; "alt="first"></div> <!--自行添加图片 -->
          
        </div>
        <div class="item">
          <div style="margin-left:190px;">  
          <img src="/static//image/2.png" alt="second" style="width:800px;height:480px; "> <!--自行添加图片 -->
          </div>
       
        </div>
        <div class="item">
          <div style="margin-left:190px;">  
          <img src="/static//image/3.png" alt="third" style="width:800px;height:480px; "> <!--自行添加图片 -->
          </div>
        
        </div>
      </div>
    
     
       
       
      <!-- Controls -->
      <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
</div>
  
    </div>
    
    
    </div>

  </div>      
     
     <div style="width:600px;height:400px;/*background:#000;*/float:left;margin-left:100px;">
     
     <form action="<%=basePath%>hospital/selectHospitalByMore">
     <div style="width:600px;height:350px;background-color:rgba(255,255,255,0.3);margin-right:30px;">
    <div style="margin:0 auto;width:200px;height:20px;margin-top:15px;"> <h3 style="padding-top:20px;">医院高级搜索</h3></div>
   
       
     <div style="margin:0 auto;margin-top:50px;;width:300px;height:50px;">
       <div style="width:120px; height:50px;display:inline">
       <select name="pname" id="areaid" onChange="setTown('areaid','townid')" style="width:80px,;height:50px">
          <option value="">请选省市</option>
          <option value="湖北">湖北</option>
    <option value="上海">上海</option>
    <option value="北京">北京</option>
   </select>
       </div>
 <div style="margin-left:20px;margin-bottom:20px;width:120px;height:50px;display:inline">
 <select name="townid" id="townid" style="width:100px,;height:50px">
    <option value="">请选地区</option>
   </select>
 </div>     
    </div>
   
 <!-- 
      <input type="text" name="name" />
      <input type="text" name="rank"/>
      <input type="text" name="rating"/>
-->

<div style="width:580px;height:300px;margin:0 auto;margin-top:20px;">
<div style="display:inline;margin-top:10px;">
医院等级<select  class="easyui-combobox" name="type" style="width:80px;height:50px;data-options:width:220px,height:30px,editable:false,panelHeight:'auto'">
  <option value="三级甲等">三甲</option>
  <option value="三级乙等">三乙</option>
  <option value="二级甲等">二甲</option>
  <option value="二级乙等">二乙</option>
</select>
</div>
<div style="display:inline;margin-left:8px;">
医院类型<select  name="category" style="width:120px;height:50px;">
  <option value="儿童医院">儿童医院</option>
  <option value="口腔医院">口腔医院</option>
  <option value="肿瘤医院">肿瘤医院</option>
  <option value="人民医院">人民医院</option>
  <option value="综合医院">综合医院</option>
</select>
</div>
<div style="display:inline;margin-left:8px;">
医院评分<select name="rating" style="width:120px;height:50px;">
  <option value="10">10分</option>
  <option value="9">9分以上</option>
  <option value="8">8分以上</option>
  <option value="7">7分以上</option>
</select>
</div>
       <div style="margin:0 auto;margin-top:50px;width:100px;height:100px;">
         <input type="submit" value="查询"  style="width:100px;height:60px;"/>
         </div>
         
         
</div>
         
     </div>
     
  
         </form>
         
         
           <form action="<%=basePath%>doctor/selectDoctorByMore">
     <div style="width:600px;height:300px;background-color:rgba(255,255,255,0.3);margin-right:30px;margin-top:50px;">
    <div style="margin:0 auto;width:200px;height:20px;margin-top:15px;"> <h3 style="padding-top:20px;">医生高级搜索</h3></div>
   
       


<div style="width:580px;height:300px;margin:0 auto;margin-top:50px;">
<div style="display:inline;margin-top:20px;">
医生职称<select  class="easyui-combobox" name="dtype" style="width:100px;height:50px;data-options:width:220px,height:30px,editable:false,panelHeight:'auto'">
  <option value="主任医师">主任医师</option>
  <option value="副主任医师">副主任医师</option>
  <option value="主治医师">主治医师</option>
</select>
</div>
<div style="display:inline;margin-left:10px;">
所在科室<select  name="department" style="width:80px;height:50px;">
  <option value="内科">内科</option>
  <option value="外科">外科</option>
   <option value="儿科">儿科</option>
  <option value="皮肤科">皮肤科</option>
  <option value="口腔科">口腔科</option>
  <option value="眼科">眼科</option>
  
</select>
</div>
<div style="display:inline;margin-left:10px;">
医生评分<select name="rating" style="width:120px;height:50px;">
  <option value="10">10分</option>
  <option value="9">9分以上</option>
  <option value="8">8分以上</option>
  <option value="7">7分以上</option>
</select>
</div>
       <div style="margin:0 auto;margin-top:50px;width:100px;height:100px;">
         <input type="submit" value="查询"  style="width:100px;height:60px;"/>
         </div>
         
         
</div>
         
     </div>
     
     
         </form>
         
         
     </div>
     
     </div>     
  </div>
  </div>
<script language="javascript">
 var areaArray = new Array();
  areaArray[areaArray.length]=new Array("1","湖北");
  areaArray[areaArray.length]=new Array("2","上海");
  areaArray[areaArray.length]=new Array("3","北京");
 var townArray = new Array();
  townArray[townArray.length]=new Array("1","1","武汉");
  townArray[townArray.length]=new Array("1","2","汉口");
  townArray[townArray.length]=new Array("2","3","浦东");
  townArray[townArray.length]=new Array("2","4","徐汇");
  townArray[townArray.length]=new Array("3","5","东城");
  townArray[townArray.length]=new Array("3","6","西城"); 
 function setTown(obj1ID,obj2ID){
        var objArea = document.getElementById(obj1ID);
        var objTown = document.getElementById(obj2ID);
        var i;
        var itemArray = null;
        if(objArea.value.length > 0){
             itemArray = new Array();
             for(i=0;i<townArray.length;i++){
                if(townArray[i][0]==objArea.value){
                    itemArray[itemArray.length]=new 
Array(townArray[i][1],townArray[i][2]);
                }
             }
        }
        for(i = objTown.options.length ; i >= 0 ; i--){
                objTown.options[i] = null;
        }
        objTown.options[0] = new Option("请选地区");
        objTown.options[0].value = "";
  
        if(itemArray != null){
                for(i = 0 ; i < itemArray.length; i++){
                        objTown.options[i+1] = new 
Option(itemArray[i][1]);
                        if(itemArray[i][0] != null){
                           objTown.options[i].value = itemArray[i][0];
                        }
                }
        }
   } 
  
</script>  
    </body>
</html>