package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.eclipse.jdt.internal.compiler.batch.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.domain.Department;
import com.domain.Disease;
import com.domain.Sdepartment;
import com.service.DepartmentService;

@Controller
@RequestMapping("/department")
public class DepartmentController {

	@Autowired
	DepartmentService departmentService;
	
	
	@RequestMapping("/main")
	public String main(Model model){
		List<Department> department=departmentService.allDepartment();
	//	System.out.println(department);
		model.addAttribute("departmentList",department);
		     
				
		/*		for(Department d:department){
					System.out.println(d.getdName());
					for(Sdepartment s:d.getsDepartmentList()){
						System.out.println(s.getSdName());
					}
					for(Disease s:d.getDiseaseList()){
						System.out.println(s.getsName());
					}
				}
			*/
				

		    return "/main";
	}
	
	
	
	@RequestMapping("/allDepartment")
	public String allDepartment(HttpServletRequest request,Model model)
	{
		
		List<Department> department=departmentService.allDepartment();
		model.addAttribute("departmentList",department);
     
		
	/*	for(Department d:department){
			System.out.println(d.getdName());
			for(Sdepartment s:d.getsDepartmentList()){
				System.out.println(s.getSdName());
			}
		}
		
		*/
		
		
		return "/selectByDepartment";
		}
}
