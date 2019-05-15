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
    
    <title>MedicalAppointment</title>
	<link href="css/doctor.css" rel="stylesheet" type="text/css"/>
	
	<!-- 分页的，先不管 -->
<!-- 	<link href="css/myPagination.css" rel="stylesheet" type="text/css"/>
	<script src="js/myPagination.js"></script> -->
	
	<!-- 评论有关css、js -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/jquery.raty.js"></script>
	<link rel="stylesheet" type="text/css" href="css/jquery.raty.css">
	<link rel="stylesheet" type="text/css" href="css/rating.css">
	
  </head>
  
  <body>
  
  
    <!-- 页首登录链接 -->
         用户:	<c:out value="${sessionScope.user.uName }"></c:out>
    
    
    <!-- 医生信息 -->
    <c:out value="${doctor.dName }"></c:out>
    <c:out value="${doctor.dType }"></c:out>

    <form action="consult/chat?drid=${doctor.dId }" method="post">
      <input type="submit" value="点击咨询医生">
    </form>
    
    
    
    
    <!-- 显示所有评论 -->
    <c:choose>
    <c:when test="${ratings!=null }">
    	
      <!-- <div id="pagination">分页，先不管</div> -->
      
      <table class="doctor-rating">
        <tr><th><div>累计评价<label id="num-label">${ratingSize }</label></div></th></tr>
        <tr><td>
        	<table class="doctor-rating-title">
        	  <tr>
        	  <!-- 平均评分 -->
        	  <td class="doctor-rating-average">
            	医疗水平<div class="star-skill"></div>
           		服务态度<div class="star-service"></div>
           		医疗效果<div class="star-effect"></div>
           	  </td>
           	  <td class="doctor-rating-title-select">
        	  <!-- 排序顺序 -->
            	<select onchange="changeSelect(1)" id="mode">
        	  		<option value="0">默认排序</option>
        	  		<option value="1">最新评论</option>
            	</select>
              </td>
        	  </tr>
            </table>
        </td></tr>
        
          <!-- 排序顺序 -->
          <script>
          	/* 切换排序顺序 */
            function changeSelect(isSelected){
              var value;
              if(isSelected==1){
                /* 选中时 */
                var select=document.getElementById("mode");
              	value=select.options[select.selectedIndex].value;
              }
              else{
                /* 未选中时，默认排序 */
              	value=0;
              }
              
              $.ajax({
              	url:"rating/selectMode?name=${doctor.dName}&mode="+value,
              	success:function(data){
              		var table=document.getElementById("doctor-rating-inner");
              		table.innerHTML="";
              		//获取到ratings并显示
              		var ratings=data.ratings;
              		for(var i=0;i<ratings.length;i++){
              			table.innerHTML+="<tr><td class='doctor-rating-each'>" +
						"<table width='100%'>" +
						"<tr><td class='doctor-rating-detail'>" +
							"<p>"+ratings[i].rdetail+"</p>"+
							"<label id='rtime'>"+ratings[i].rtime+"</label>" +
						"</td>" +
						"<td class='doctor-rating-info'>" +
							"用户：" +ratings[i].uname+
						"</td>" +
						"</tr></table></td></tr>";
              		}
              	},
              	error:function(){
              		alert("error!");
              	}
              })
            }
            //先按默认顺序加载
            window.onload=changeSelect(0);
            
            var skillScore=`${averageScore.skill}`;
            var serviceScore=`${averageScore.service}`;
            var effectScore=`${averageScore.effect}`;
            $(".star-skill").raty({readOnly:true,score:skillScore});
            $(".star-service").raty({readOnly:true,score:serviceScore});
            $(".star-effect").raty({readOnly:true,score:serviceScore});
          </script>
        <tr><td>
        
        <table id="doctor-rating-inner" width="100%">
        </table>
        
        </td></tr>
      </table>
      
    </c:when>
    <c:otherwise>
    	<table class="doctor-rating">
        <tr><th><div>累计评价<label id="num-label">${ratingSize }</label></div></th></tr>
        <tr><td class="doctor-rating-empty">还没有评论！请完成订单后进行评论！</td></tr>
        </table>
        
    
    </c:otherwise>
    </c:choose>
    
  </body>
</html>
