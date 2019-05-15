package com.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.domain.Rating;
import com.service.RatingService;




@Controller
@RequestMapping("/rating")
public class RatingController {
	
	@Autowired
	private RatingService ratingService;

	//添加评论
	@RequestMapping("/addRating")
	@ResponseBody
	public Map<String,String> addRating(@RequestBody Rating rating){
		Date date=new Date();
		rating.setRtime(date);
		
		Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        
		rating.setWeight(rating.getRdetail().length()+(cal.get(Calendar.YEAR)-2000)*10);
		ratingService.insertRating(rating);
		
		Map<String,String> map=new HashMap<String, String>();
		map.put("result", "success");
		return map;
	}
	
	//添加追评
	@RequestMapping("/moreRating")
	@ResponseBody
	public Map<String, String> moreRating(@RequestBody Rating rating){
		Date date=new Date();
		rating.setRmoretime(date);
		Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        
		int weight=ratingService.getWeightById(rating.getRid());
		rating.setWeight(weight+rating.getRmore().length()+(cal.get(Calendar.YEAR)-2000)*10);
		ratingService.insertMoreRating(rating);
		
		Map<String,String> map=new HashMap<String, String>();
		map.put("result", "success");
		return map;
	}
	
	//删除评论
	@RequestMapping("/deleteRating")
	public String deleteRating(Integer rid){
		if(rid!=null){
			ratingService.deleteRatingById(rid);
			return "redirect:/order";
		}else return "error";
	}
	
	//查看评论，选择顺序
	@ResponseBody
	@RequestMapping("selectMode")
	public Map<String, List<Rating>> selectMode(String name,Integer mode){
		Map<String,List<Rating>> map=new HashMap<String, List<Rating>>();
		List<Rating> ratings=ratingService.findByDoctorName(name, mode);
		map.put("ratings", ratings);
		
		return map;
	}
	

}
