package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.domain.Appoint;
import com.domain.User;
import com.service.impl.AppointService;



@Controller
@RequestMapping("/appoint")
public class AppointController {
	@Autowired
	private AppointService appointService;
	
	@ResponseBody
	@RequestMapping("/getTime")
	public Map<String,Integer> getTime(Integer aId){
		Map<String,Integer> map=new HashMap<String,Integer>();
		int time=appointService.getTimeById(aId);
		map.put("appointedtime", time);
		return map;
	}

	
	@ResponseBody
	@RequestMapping("/getAll")
	public Map<String,List<Appoint>> getFreeTimes(String dName){
		//�Ű��
		List<Appoint> appoints=appointService.getTimeByDoctor(dName);
		Map<String,List<Appoint>> map=new HashMap<String,List<Appoint>>();
		map.put("appoints", appoints);
		return map;
	}
	
	//ԤԼ�����ض���id
	@ResponseBody
	@RequestMapping("/appoint")
	public Map<String,Integer> appoint(int aId,HttpSession session){
		Map<String,Integer> map=new HashMap<String,Integer>();
		User user=(User)session.getAttribute("user");
		int oid=appointService.appointById(aId,user.getuId());
		
		map.put("oid", oid);
		return map;
	}
	
	//ȡ��
	@ResponseBody
	@RequestMapping("/cancel")
	public Map<String,String> cancel(Integer oid){
		Map<String,String> map=new HashMap<String,String>();
		appointService.cancelOrder(oid);
		map.put("result", "success");
		return map;
	}
}
