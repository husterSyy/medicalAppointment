package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.domain.Orderitem;
import com.domain.Rating;
import com.domain.User;
import com.service.OrdersService;
import com.service.RatingService;



@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrdersService orderService;
	@Autowired
	private RatingService ratingService;
	//�鿴�û����ж���
	@RequestMapping("")
	public String allOrder(HttpSession httpSession,Model model){
		User user=(User)httpSession.getAttribute("user");
		//���û�ʱ
		if(user!=null){
			List<Orderitem> orders=orderService.getOrdersByUId(user.getuId());
			model.addAttribute("orders",orders);
			return "order";
		}
		else return "error";
	}

	//��������
	@RequestMapping("/detail")
	public String orderDetail(Integer oid,Model model){
		Orderitem order=orderService.findOrderById(oid);
		model.addAttribute("order",order);
		switch (order.getState()) {
		case 0:
			//δ����
			break;
		case 1:
			//�Ѹ���δ���������ʱ���Ƿ��ѹ�
		case 2:
			//�ѿ���
			Rating rating=ratingService.findByOrderId(oid);
			model.addAttribute("rating",rating);
		default:
			break;
		}
		return "orderDetail";
	}
}
