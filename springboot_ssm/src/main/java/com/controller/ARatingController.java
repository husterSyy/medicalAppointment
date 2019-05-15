package com.controller;

import java.io.InputStream;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/arating")
public class ARatingController {
    
	@RequestMapping("findAllAratingById")
	public String findAllById(Model model,Integer id){
		
		return "/";
		
	}
}
