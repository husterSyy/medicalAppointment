package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.domain.Disease;
import com.domain.Doctor;
import com.service.DiseaseService;

@Controller
@RequestMapping("/disease")
public class DiseaseController {
	@Autowired
	DiseaseService diseaseService;
	@RequestMapping("/findDiseaseByName")	
	public String findDiseaseByName(String name,Model model){
		//System.out.println(name);
		Disease disease=diseaseService.findDiseaseByName(name);
	     disease.setsName(name);
		List<Doctor> doctors=disease.getDoctorList();
//		for(Doctor item:doctors){
//			System.out.println(item.getdName());
//		}
		model.addAttribute("disease",disease);
		return "/diseaseDetail";
	}

}
