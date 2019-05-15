package com.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ch.qos.logback.core.net.LoginAuthenticator;

import com.dao.DoctorMapper;
import com.domain.Doctor;
import com.domain.Hospital;
import com.domain.Rating;
import com.domain.Score;
import com.domain.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.DoctorService;
import com.service.RatingService;
import com.service.UserService;

@Controller
@RequestMapping("/doctor")
public class DoctorController {
	@Autowired
	 DoctorService doctorService;
//    RatingService ratingService;
    @Autowired
    UserService userService;
    @Autowired
	private RatingService ratingService;
    @Autowired
    DoctorMapper doctorMapper;

    
    @RequestMapping("/login")
    public String login(){
    	return "/doctorLogin";
    }
    
    @RequestMapping("/checklogin")
    public String checkLogin(HttpSession session,HttpServletRequest req,HttpServletResponse resp) throws UnsupportedEncodingException{
 	   boolean flag=false;
 	   String page="";
 	   String name=req.getParameter("username");
 	   String password=req.getParameter("password");
 	   Doctor doctor=doctorService.selectDoctorByNameAndPassword(name,password);
 	   if(doctor!=null){
 		   flag=true;
 	   }
 	  
 	   if(flag==true){
 		   session.setAttribute("username", name);  
 		   session.setAttribute("doctor", doctor);
 		   page="/manage";
 	   }
 	   else{
 		   page="redirect:/user/loginFail";
 	   }
 	   
 	  // addCookie(name,password,resp,req);
 	   
 	   return page;
    }
    
	//根据姓名查询医生信息
	@RequestMapping("/doctor")
	public ModelAndView doctorIndex(String name) throws Exception{
		//查询到医生信息并返回页面
		ModelAndView modelAndView=new ModelAndView();
		
		Doctor doctor=doctorMapper.findIdByName(name);
		modelAndView.addObject(doctor);
		List<Rating> ratings;
		
		
		
		/*医生界面评论加载，默认排序*/
		ratings=ratingService.findByDoctorName(name,0);
		
		//有结果时
		if(ratings.size()!=0){
			modelAndView.addObject("ratings",ratings);
			modelAndView.addObject("ratingSize",ratings.size());
		}
		//平均评分
		Score score=ratingService.getAverageScore(doctor.getdId());
		modelAndView.addObject("averageScore",score);
		
		//返回医生界面
		modelAndView.setViewName("doctor");
		return modelAndView;
	}
	
	
	
	@RequestMapping("/portrait")
	public String uploadPortrait(Integer id,@RequestBody MultipartFile pic) throws Exception{
		//上传头像并保存到文件
		String path=this.getClass().getResource("/img").getPath();
		String utfPath=java.net.URLEncoder.encode(path, "utf-8");
		String fileName="doctor"+id+
				pic.getOriginalFilename().substring(pic.getOriginalFilename().lastIndexOf('.'));
		File newFile=new File(utfPath+"/"+fileName);
		pic.transferTo(newFile);
		
		Doctor doctor=new Doctor();
		doctor.setdId(id);
		//doctor.setPortrait(fileName);
		//名称存入数据库
		//doctorMapper.updateByPrimaryKeySelective(doctor);
		
		return "doctor";
	}
    
    @RequestMapping("/followDoctorByName")
    public String followDoctorByName(Model model,@Param("uName")String uName,@Param("dName")String dName){
    	
		//System.out.println("关注成功");
   // System.out.println(uName+" "+dName);
    	userService.insertDoctor(uName,dName);
    	Doctor doctor=doctorService.findByName(dName);
		  doctor.setdName(dName);
		model.addAttribute("doctor",doctor);
    	return "/doctorDetail";
    }
    
    
    
    @RequestMapping("/appointment")
    public String appointment(HttpSession session,String uName,String name,Model model){
    	System.out.println(uName);
    	session.setAttribute("username",uName);
    	  Doctor doctor=doctorService.findByName(name);
    	  doctor.setdName(name);
 		// System.out.println(doctor.getdName());
  		model.addAttribute("doctor",doctor);
    	return "/appointmentDetail";
    }
    
    @RequestMapping("/selectDoctorByMore")
    public String selectDoctorByMore(@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,HttpServletRequest request,Model model){
    	String type=request.getParameter("dtype");
    	String department=request.getParameter("department");
    	Integer rating=Integer.parseInt(request.getParameter("rating"));
    
         PageHelper.startPage(pageNo,8);
  		List<Doctor> doctor=doctorService.SelectByMore(type,department,rating);
  		  model.addAttribute("doctorList",doctor);
  		  PageInfo<Doctor> page=new PageInfo<Doctor>(doctor);
  	        model.addAttribute("page",page);
			  
    	return "/selectByDoctor";
    }
    
    @RequestMapping("/selectDoctorByRatingD")
    public String selectDoctorByRatingD(@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,Model model){
    	
		  PageHelper.startPage(pageNo,8);
	  		List<Doctor> doctor=doctorService.findByRatingD();
	  		  model.addAttribute("doctorList",doctor);
	  		  PageInfo<Doctor> page=new PageInfo<Doctor>(doctor);
	  	        model.addAttribute("page",page);
				  
	   
	   return "/selectByDoctor";
    }
    @RequestMapping("/selectDoctorByRatingA")
    public String selectDoctorByRatingA(@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,Model model){
    	
		  PageHelper.startPage(pageNo,8);
	  		List<Doctor> doctor=doctorService.findByRatingA();
	  		  model.addAttribute("doctorList",doctor);
	  		  PageInfo<Doctor> page=new PageInfo<Doctor>(doctor);
	  	        model.addAttribute("page",page);
	   
	   return "/selectByDoctor";
    }
    
    @RequestMapping("/selectDoctorByType")
    public String selectDoctorByType(@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,String type,Model model){
    	System.out.println(type);
    
		  PageHelper.startPage(pageNo,8);
	  		List<Doctor> doctor=doctorService.findByType(type);
	  		  model.addAttribute("doctorList",doctor);
	  		  PageInfo<Doctor> page=new PageInfo<Doctor>(doctor);
	  	        model.addAttribute("page",page);
	   return "/selectByDoctor";
    }
    
    @RequestMapping("/selectDoctorByInquisitionD")
    public String selectDoctorByInquisition(@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,Model model){
    	
		  PageHelper.startPage(pageNo,8);
	  		List<Doctor> doctor=doctorService.findByInquisitionD();
	  		  model.addAttribute("doctorList",doctor);
	  		  PageInfo<Doctor> page=new PageInfo<Doctor>(doctor);
	  	        model.addAttribute("page",page);  
	   
	   return "/selectByDoctor";
    }
    @RequestMapping("/selectDoctorByInquisitionA")
    public String selectDoctorByInquisitionA(@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,Model model){
    	
		  PageHelper.startPage(pageNo,8);
	  		List<Doctor> doctor=doctorService.findByInquisitionA();
	  		  model.addAttribute("doctorList",doctor);
	  		  PageInfo<Doctor> page=new PageInfo<Doctor>(doctor);
	  	        model.addAttribute("page",page);  
	   
	   return "/selectByDoctor";
    }
    @RequestMapping("/findDoctor")
    @ResponseBody
	public String findDoctor(String name,HttpServletRequest request,Model model){	
    	String str="";
		List<Doctor> doctor=doctorService.simpleSelect(name);
		
		   model.addAttribute("doctorList",doctor);
		   request.setAttribute("doctorList",doctor);
		   
		   for (Doctor item:doctor) {
	           str+=item.getdName()+",";
	        }
	 
   return str;
	 
	
	}
	
    
	@RequestMapping("/selectDoctor")
	public String selectDoctor(@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,HttpServletRequest request,Model model){
		String name=request.getParameter("name");
	
		   PageHelper.startPage(pageNo,8);
	  		List<Doctor> doctor=doctorService.simpleSelect(name);
	  		  model.addAttribute("doctorList",doctor);
	  		  PageInfo<Doctor> page=new PageInfo<Doctor>(doctor);
	  	        model.addAttribute("page",page);  
	   return "/selectByDoctor";
	}
	
	@RequestMapping("/allDoctor")
	public String allDoctor(String name,@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,HttpServletRequest request,Model model){
		
		  PageHelper.startPage(pageNo,8);
		List<Doctor> doctor=doctorService.findAll();
		List<Doctor> doctor2=doctorService.recommendAll(name);
		  model.addAttribute("doctorList",doctor);
		  model.addAttribute("doctorList2",doctor2);
		  PageInfo<Doctor> page=new PageInfo<Doctor>(doctor);
	        model.addAttribute("page",page);
	   return "/selectByDoctor";
	}
	
	@RequestMapping("/getAllRatingByName")
	public ModelAndView getRatings(String name){
		//查询到医生信息并返回页面
		ModelAndView modelAndView=new ModelAndView();
		
		Doctor doctor=doctorMapper.findIdByName(name);
		modelAndView.addObject(doctor);
		List<Rating> ratings;
		
		
		
		/*医生界面评论加载，默认排序*/
		ratings=ratingService.findByDoctorName(name,0);
		
		//有结果时
		if(ratings.size()!=0){
			modelAndView.addObject("ratings",ratings);
			modelAndView.addObject("ratingSize",ratings.size());
		}
		//System.out.println(doctor.getdId());
		//平均评分
		Score score=ratingService.getAverageScore(doctor.getdId());
		modelAndView.addObject("averageScore",score);
		
		//返回医生界面
		modelAndView.setViewName("doctor");
		return modelAndView;


	}
	@RequestMapping("/getDoctorByName")
	public String getDoctorByName(String name,HttpServletRequest request,Model model){
		
		  Doctor doctor=doctorService.findByName(name);
		  doctor.setdName(name);
		model.addAttribute("doctor",doctor);
	
	List<Rating> ratingList=doctor.getRatingList();
	/*医生界面评论加载，默认排序*/
	List<Rating> ratings=ratingService.findByDoctorName(name,0);
	
	//有结果时
			if(ratings.size()!=0){
				model.addAttribute("ratings",ratings);
				model.addAttribute("ratingSize",ratings.size());
			}
			//System.out.println(doctor.getdId());
			//平均评分
			Score score=ratingService.getAverageScore(doctor.getdId());
			model.addAttribute("averageScore",score);
			
			
	
               return "/doctorDetail";
		
	
	
	   
	}
	@RequestMapping("/getDoctorById")
	public String getDoctorById(Integer id,HttpServletRequest request,Model model){
//		System.out.println(id);
		
		  Doctor doctor=doctorService.findById(id);
		 
		model.addAttribute("doctor",doctor);
	
	List<Rating> ratingList=doctor.getRatingList();
	
//	System.out.println(ratingList.size());
	
	   return "/doctorDetail";
	}
}
