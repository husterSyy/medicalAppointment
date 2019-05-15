package com.service;

import java.util.List;

import com.domain.Orderitem;
import com.domain.Orders;



/**
 * 订单操作 service
 *
 */
public interface OrdersService {
	
	
	
	public List<Orderitem> getOrdersByUId(int uid);
	public Orderitem findOrderById(int oid);

	/**
	 * 新增订单
	 * @param order
	 */
	public void saveOrder(Orders order);
	
	/**
	 * 
	 * @Title: OrdersService.java
	 * @Package com.sihai.service
	 * @Description: 修改叮当状态，改为 支付成功，已付款; 同时新增支付流水
	 * Copyright: Copyright (c) 2017
	 * Company:FURUIBOKE.SCIENCE.AND.TECHNOLOGY
	 * 

	 */
	public void updateOrderStatus(String orderId, String alpayFlowNum, String paidAmount);
	
	/**
	 * 获取订单
	 * @param orderId
	 * @return
	 */
	public Orders getOrderById(String orderId);
	
}
