package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.domain.Artical;
import com.domain.Doctor;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.ArticalService;

@Controller
@RequestMapping("/artical")
public class ArticalController {
	@Autowired
	ArticalService articalService;
	
	@RequestMapping("/ArticalByType")
	public String ArticalByType(@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,String type,Model model){
	
		  PageHelper.startPage(pageNo,8);
		List<Artical> articalList=articalService.ArticalByType(type);
		model.addAttribute("articalList",articalList);
	  	 PageInfo<Artical> page=new PageInfo<Artical>(articalList);
	  	   model.addAttribute("page",page);
		return "/articalMain";
	}
	
	
	@RequestMapping("/allArtical")
	public String allArtical(String name,@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,Model model){
		  PageHelper.startPage(pageNo,8);
			List<Artical> articalList=articalService.findAll();
			List<Artical> articalList2=articalService.recommendAll(name);
			model.addAttribute("articalList",articalList);
			model.addAttribute("articalList2",articalList2);
	  		  PageInfo<Artical> page=new PageInfo<Artical>(articalList);
	  	      model.addAttribute("page",page);
				  
		return "/articalMain";
	}
	
	
	@RequestMapping("/readContentById")
	public String readContentById(Integer id,Model model){
		Artical artical=articalService.findById(id);
		model.addAttribute("artical",artical);
		
		return "/articalDetail";
	}

}
