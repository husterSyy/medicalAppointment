package com.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.Session;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.domain.Doctor;
import com.domain.Hospital;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.DepartmentService;
import com.service.DoctorService;
import com.service.HospitalService;
import com.service.UserService;

@Controller
@RequestMapping("/hospital")
public class HospitalController {
	@Autowired
	private HospitalService hospitalService;
	@Autowired
	 DepartmentService departmentService;
	@Autowired
	  DoctorService doctorService;
	@Autowired
	UserService userService;
	  
	  
	    @RequestMapping("/followHospitalByName")
	    public String followHospitalByName(Model model,@Param("uName")String uName,@Param("hName")String hName){
	    	
		
			//System.out.println("关注成功");
	   // System.out.println(uName+" "+dName);
	    	hospitalService.insertHospital(uName,hName);
	    	Hospital hospital=hospitalService.findByName(hName);
			  hospital.sethName(hName);
			model.addAttribute("hospital",hospital);
	    	return "/hospitalDetail";
	    }
	  
	@RequestMapping("/selectHospitalByRating1")
	public String selectHospitalByRating1(@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,Model model){
		 PageHelper.startPage(pageNo,5);
		List<Hospital> hospital=hospitalService.findAllByRating1();
		   model.addAttribute("hospitalList",hospital);
		   PageInfo<Hospital> page=new PageInfo<Hospital>(hospital);
	        model.addAttribute("page",page);
		   return "/selectByHospital";
	}
	@RequestMapping("/selectHospitalByRating2")
	public String selectHospitalByRating2(@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,Model model){
		 PageHelper.startPage(pageNo,5);
			List<Hospital> hospital=hospitalService.findAllByRating2();
			   model.addAttribute("hospitalList",hospital);
			   PageInfo<Hospital> page=new PageInfo<Hospital>(hospital);
		        model.addAttribute("page",page);
	  
		   return "/selectByHospital";
	}
	
	@RequestMapping("/selectHospitalByType")
	public String selectHospitalByType(@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,String type,Model model){
	
	   PageHelper.startPage(pageNo,5);
		List<Hospital> hospital=hospitalService.findAllByType(type);
		   model.addAttribute("hospitalList",hospital);
		   PageInfo<Hospital> page=new PageInfo<Hospital>(hospital);
	        model.addAttribute("page",page);
 
		  
	   return "/selectByHospital";
		
	}
	@RequestMapping("/selectHospitalByCategory")
	public String selectHospitalByCategory(@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,String category,Model model){
	
	   PageHelper.startPage(pageNo,5);
		List<Hospital> hospital=hospitalService.findAllByCategory(category);
		   model.addAttribute("hospitalList",hospital);
		   PageInfo<Hospital> page=new PageInfo<Hospital>(hospital);
	        model.addAttribute("page",page);
		  
	   return "/selectByHospital";
		
	}
	@RequestMapping("/selectHospitalByDistance")
	public String selectHospitalByDistance(@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,Model model){
		
		   PageHelper.startPage(pageNo,5);
			List<Hospital> hospital=hospitalService.findAllByDistance();
			   model.addAttribute("hospitalList",hospital);
			   PageInfo<Hospital> page=new PageInfo<Hospital>(hospital);
		        model.addAttribute("page",page);
			  
			  
		   return "/selectByHospital";
	}
	@RequestMapping("/selectHospitalByConcreteDistance")
	public String selectHospitalByConcreteDistance(@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,Model model,HttpServletRequest request){
		  String lat =request.getParameter("test1"); // test为隐藏控件名
		 String lng =request.getParameter("test2"); 
		
		 System.out.println(lat+" "+lng);
		 
		 //先计算查询点的经纬度范围
//	        double r = 6371;//地球半径千米
//	        double dis = 0.5;//0.5千米距离
//	        double dlng =  2*Math.asin(Math.sin(dis/(2*r))/Math.cos(lat*Math.PI/180));
//	        dlng = dlng*180/Math.PI;//角度转为弧度
//	        double dlat = dis/r;
//	        dlat = dlat*180/Math.PI;        
//	        double minlat =lat-dlat;
//	        double maxlat = lat+dlat;
//	        double minlng = lng -dlng;
//	        double maxlng = lng + dlng;

	
		   PageHelper.startPage(pageNo,5);
		//	List<Hospital> hospital=hospitalService.findAllByConcreteDistance(minlat,maxlat,minlng,maxlng);
			List<Hospital> hospital=hospitalService.findAllByDistance();
			   model.addAttribute("hospitalList",hospital);
			   PageInfo<Hospital> page=new PageInfo<Hospital>(hospital);
		        model.addAttribute("page",page);
			  
			  
		   return "/selectByHospital";
	}
	 
		@RequestMapping("/selectHospitalByMore")
		public String selectHospitalByMore(@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,HttpServletRequest request,Model model){
			String name=request.getParameter("pname");
			String category=request.getParameter("category");
			String type=request.getParameter("type");
			Integer rating=Integer.parseInt(request.getParameter("rating"));
		
			Map<String,Object>  map=new HashMap<>();
			map.put("name", name);
			map.put("category", category);
			map.put("type", type);
			map.put("rating", rating);
         
 
/*for (Map.Entry<String,Object> entry : map.entrySet()) {
 
    System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
 
}
*/
			   PageHelper.startPage(pageNo,5);
				List<Hospital> hospital=hospitalService.SelectByMore(name,category,type,rating);
				   model.addAttribute("hospitalList",hospital);
				   PageInfo<Hospital> page=new PageInfo<Hospital>(hospital);
			        model.addAttribute("page",page);
				  
			  
		   return "/selectByHospital";
		}

	 @RequestMapping("/HospitalByDepartment")
	 public String findByDepartment(@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,String name,Model model){
		
		   PageHelper.startPage(pageNo,5);
			List<Hospital> hospital=hospitalService.findByDepartment(name);
			   model.addAttribute("hospitalList",hospital);
			   PageInfo<Hospital> page=new PageInfo<Hospital>(hospital);
		        model.addAttribute("page",page);
		 
		 return "/selectByHospital";
	 }
	 
	 
	 @RequestMapping("/guide")
	 public String guide(String name,HttpServletRequest request,Model model){
		//System.out.println(name);
		 Hospital hospital=hospitalService.findByName(name);
		 System.out.println(hospital.getpName());
		 model.addAttribute("hospital",hospital);		
		 request.setAttribute("hospital",hospital);
		 
		 return "/guide";
	 }
	 
	@RequestMapping("/allHospital")
	   public String getAllHospital(String name,@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,Model model)
	 {
		   
		
//		   model.addAttribute("hospitalList",hospital);
		   Integer pageSize=5;//每页显示记录数
	        //分页查询
	      
	        PageHelper.startPage(pageNo,5);
	        List<Hospital> hospitalList=hospitalService.findAll();
	        List<Hospital> hospitalList2=hospitalService.recommendAll(name);
	        PageInfo<Hospital> page=new PageInfo<Hospital>(hospitalList);
	        model.addAttribute("hospitalList",hospitalList);
	        model.addAttribute("hospitalList2",hospitalList2);
	        model.addAttribute("page",page);
//		   for (Hospital item:hospital) {
//	            System.out.println("----------"+item.gethName()+item.gethType()+item.gethRating());
//	        }
		   return "/selectByHospital";
	   }
	
	@RequestMapping("/getHospital")
	public String getHospital(String name,HttpServletRequest request,Model model){
		System.out.println(name);
		model.addAttribute("hospital",hospitalService.findByName(name));
		
	   request.setAttribute("hospital",hospitalService.findByName(name));
	   // return "/allHospital";
	  
	   Hospital hospital=hospitalService.findByName(name);

            System.out.println("----------"+hospital.gethMobile()+hospital.gethWeb());
        
	  
//	model.addAttribute("clinicList",departmentService.findClinic(name));
//	request.setAttribute("clinicList",departmentService.findClinic(name));
	   
	   return "/hospitalDetail";
	}
	

	//搜索框
	@RequestMapping("/selectHospital")
	public String selectHospital(@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,HttpServletRequest request,Model model){
		String name=request.getParameter("name");
	   
		   PageHelper.startPage(pageNo,5);
			List<Hospital> hospital=hospitalService.simpleSelect(name);
			   model.addAttribute("hospitalList",hospital);
			   PageInfo<Hospital> page=new PageInfo<Hospital>(hospital);
		        model.addAttribute("page",page);
		
	   return "/selectByHospital";
		 
	}
	//ajax搜索框
	
		@RequestMapping("/findHospital")
		@ResponseBody
		public String findHospital(String name,HttpServletRequest request,Model model){
			//String name=request.getParameter("name");
			//String name = request.getParameter("text");
		//	System.out.println(name);
			String str="";
			
			List<Hospital> hospital=hospitalService.simpleSelect(name);
			  model.addAttribute("hospitalList",hospital);
			   request.setAttribute("hospitalList",hospital);
			   for (Hospital item:hospital) {
		           str+=item.gethName()+",";
		        }
		
		   return str;
			 
		}
	
       
}
