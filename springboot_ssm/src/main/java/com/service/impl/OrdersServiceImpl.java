package com.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.FlowMapper;
import com.dao.OrderitemMapper;
import com.dao.OrdersMapper;
import com.domain.Flow;
import com.domain.Orderitem;
import com.domain.OrderitemExample;
import com.domain.Orders;
import com.org.n3r.idworker.Sid;
import com.service.OrdersService;
import com.util.OrderStatusEnum;



@Service
public class OrdersServiceImpl implements OrdersService {

	@Autowired
	private OrdersMapper ordersMapper;
	
	@Autowired
	private FlowMapper flowMapper;
	
	@Autowired
	private Sid sid;
	
	@Autowired
	private OrderitemMapper orderMapper;
	
	//根据用户id查找订单
	public List<Orderitem> getOrdersByUId(int uid){
		OrderitemExample orderExample = new OrderitemExample();
		OrderitemExample.Criteria c=orderExample.createCriteria();
		c.andUidEqualTo(uid);
		List<Orderitem> orders=orderMapper.selectByExample(orderExample);
		return orders;
	}
	
	//根据主键查找
	public Orderitem findOrderById(int oid){
		return orderMapper.selectByPrimaryKey(oid);
	}
	
	
	
	
	@Override
	public void saveOrder(Orders order) {
		ordersMapper.insert(order);
	}

	@Override
	public Orders getOrderById(String orderId) {
		return ordersMapper.selectByPrimaryKey(orderId);
	}

	@Override
	public void updateOrderStatus(String orderId, String alpayFlowNum, String paidAmount) {
		
		Orders order = getOrderById(orderId);
		if (order.getOrderStatus().equals(OrderStatusEnum.WAIT_PAY.key)) {
			order = new Orders();
			order.setId(orderId);
			order.setOrderStatus(OrderStatusEnum.PAID.key);
			order.setPaidTime(new Date());
			order.setPaidAmount(paidAmount);
			
			ordersMapper.updateByPrimaryKeySelective(order);
			
			order = getOrderById(orderId);
			
			String flowId = sid.nextShort();
			Flow flow = new Flow();
			flow.setId(flowId);
			flow.setFlowNum(alpayFlowNum);
			flow.setBuyCounts(order.getBuyCounts());
			flow.setCreateTime(new Date());
			flow.setOrderNum(orderId);
			flow.setPaidAmount(paidAmount);
			flow.setPaidMethod(1);
			flow.setProductId(order.getProductId());
			
			flowMapper.insertSelective(flow);
			
		
		}
		
		
		
	}

}
