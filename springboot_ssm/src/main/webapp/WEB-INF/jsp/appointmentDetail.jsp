<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<script src="<%=request.getContextPath() %>/static/js/jquery.min.js" type="text/javascript"></script>

<html>
  <head>
  
 
  </head>
  
  <body style="background-image: url(../images/background1.jpg);background-size: 100%">
  <div style="width:600px;height:600px;margin:0 auto;margin-top:100px;background-color:rgba(255,255,255,0.3);">
  <div style="width:300px;margin:0 auto;margin-top:100px;height:300px;">
    <h1 style="padding-top:100px;">预约详情</h1>  
    <form action="<%=request.getContextPath() %>/alipay/createOrder.action" method="post">  
    	<input type="hidden" id="productId" name="productId" value="${doctor.dId }" />
       <div style="height:70px;">医生：<input type="text" name="uId"  placeholder="" value="${doctor.dName}" style="margin-left:30px;width:150px;height:50px;"/></div>
      
 <div style="height:70px;"> 咨询方式：<select  class="easyui-combobox" id="type" name="type" style="width:150px;height:50px;data-options:width:220px,height:30px,editable:false,panelHeight:'auto'">
  <option value="${doctor.dPriceImg}">图文问诊￥${doctor.dPriceImg}</option>
  <option value="${doctor.dPriceVideo}">视频问诊￥${doctor.dPriceVideo}</option>
  </select>
  </div>
  <div style="height:70px;">
 咨询时间：<select  class="easyui-combobox" name="time" style="width:150px;height:50px;data-options:width:220px,height:30px,editable:false,panelHeight:'auto'">
  <option value="周一">周一</option>
  <option value="周一">周二</option>
</select>
</div>
<div>
 
      <!--  <button type="submit" >  预约</button>  -->
        <input type="button" value="生成订单" onclick="createOrder()" style="margin-left:20px;wdith:80px;height:40px;"/>
           <input type="hidden" id="hdnContextPath" name="hdnContextPath" value="<%=request.getContextPath() %>"/>
  
        </div>
    </form> 
    </div>
    </div>

    
  </body>
</html>
      <script type="text/javascript">

		
	var hdnContextPath = $("#hdnContextPath").val();
	
	function createOrder() {
		$.ajax({
	    	url:hdnContextPath + "/alipay/createOrder.action?name=${username}",
	    	type: "POST",
	    	data: {"productId": $("#productId").val(), "buyCounts":1,"price":$("#type").val()},
	    	dataType: "json",
	    	success: function(data) {
	            if(data.status == 200 && data.msg == "OK") {
	            	debugger;
	            	// 提交订单成功后, 进入购买页面
	            	window.location.href = hdnContextPath + "/alipay/goPay.action?orderId=" + data.data;
	            } else {
	            	alert(data.msg);
	            	console.log(JSON.stringify(data));
	            }
	    	}
	    });
	}

</script>
