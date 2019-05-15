<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<script src="<%=request.getContextPath() %>/static/js/jquery.min.js" type="text/javascript"></script>

<html>

    <head>
        
    </head>
    
    <body>
  <div style="width:600px;height:600px;background:#f0f0f0;margin:0 auto;margin-top:100px;">
    <div style="width:300px;height:300px;margin:0 auto;margin-top:100px;">
    <form id="payForm" action="<%=request.getContextPath() %>/alipay/goAlipay.action" method="post">
    	<input type="hidden" name="orderId" value="${order.id }" />
        <table style="border-collapse:separate; border-spacing:0px 10px;">
        <th>
        <h1 style="padding-top:100px;">订单详情</h1>
        </th>
        	<tr>
        		<td>
        			订单编号: ${order.id }
        		</td>
        	</tr>
        	<tr>
        		<td>
        			医生名称: ${doctor.dName }
        		</td>
        	</tr>
        	<tr>
        		<td>
        			订单价格: ${order.orderAmount }
        		</td>
        	</tr>
        	<tr>
        		<td>
        			预约时间：周一下午
        		</td>
        	</tr>
        	<tr>
        		<td>
        			订单时间：${order.createTime }
        		</td>
        	</tr>
        <tr>
        		<td>
        		<h2>	<a style="margin-top:50px;width:80px;margin-left:120px;margin:0 auto;text-decoration:none;" href="">去评价</a> </h2>
        		</td>
        	</tr>
        </table>
    </form>
    
    	
        <input type="hidden" id="hdnContextPath" name="hdnContextPath" value="<%=request.getContextPath() %>"/>

  </div>
    </div>
    
    </body>
    
</html>




