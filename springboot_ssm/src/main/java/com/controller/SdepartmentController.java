package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.domain.Sdepartment;
import com.service.SdepartmentService;

@Controller
@RequestMapping("/sdepartment")
public class SdepartmentController {
	
	@Autowired
	SdepartmentService sdepartmentService;
	
	
	
	@RequestMapping("/findAllSdepartment")
	public String findAllSdepartment(HttpServletRequest request,Model model){
		
		List<Sdepartment> sdepartments=sdepartmentService.findAllSdepartment();
		model.addAttribute("sdepartment",sdepartments);
		request.setAttribute("sdepartment", sdepartments);
		
		
		return "/main";
	}
}
