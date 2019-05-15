package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.domain.Department;
import com.domain.Doctor;
import com.domain.Hospital;
import com.service.DepartmentService;
import com.service.DoctorService;
import com.service.HospitalService;

@Controller
@RequestMapping("/Allindex")
public class FindController {
	@Autowired
	DepartmentService departmentService;
	private HospitalService hospitalService;
	 DoctorService doctorService;
	 
	//@ResponseBody
	@RequestMapping("/find")
	public String find(HttpServletRequest request,Model model){
		
		String name=request.getParameter("name");
		System.out.println(name);
		Department department=departmentService.selectDepartment(name);
		List<Hospital> hospital=hospitalService.simpleSelect(name);
		if(department!=null){
			model.addAttribute("department",department);
			request.setAttribute("department", department);
			return "/departmentDetail";
		}
		else{
		//	List<Hospital> hospital=hospitalService.simpleSelect(name);
			if(hospital!=null){
				 model.addAttribute("hospitalList",hospital);
				   request.setAttribute("hospitalList",hospital);
				   return "/partHospital";
			}
			 
			else{
				List<Doctor> doctor=doctorService.simpleSelect(name);
				if(doctor!=null){
					 model.addAttribute("doctorList",doctor);
					   request.setAttribute("doctorList",doctor);
				   
				   return "/partDoctor";
				}
				 
				else{
					return "/notFind";
					
				//	return "hello";
				}
			}
			
			
			
		}
		
		
	
	
	}
}
