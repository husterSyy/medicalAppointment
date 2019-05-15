package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dao.DoctorMapper;
import com.domain.Doctor;




@Controller
@RequestMapping("/consult")
public class ConsultController {
	@Autowired
	private DoctorMapper doctorMapper;
	
	//��ҽ������
	@RequestMapping("/chat")
	public ModelAndView chat(String name){
		ModelAndView modelAndView=new ModelAndView();
		//���ҵ���ҽ����ǰ��
		Doctor doctor=doctorMapper.findIdByName(name);
		modelAndView.addObject("doctor", doctor);
		modelAndView.setViewName("consult");
		return modelAndView;
	}
	
	//�ϴ�ͼƬ
	@ResponseBody
	@RequestMapping("uploadImg")
	public Map<String, String> uploadImg(MultipartFile ifile,HttpSession session,String ifilename) throws IllegalStateException, IOException{
		//�浽�ļ�ϵͳ
		File file=new File("e:/medicalImg/"+ifilename);
		if(!file.exists()){
			file.createNewFile();
		}
		ifile.transferTo(file);
		
		Map<String,String> map=new HashMap<String, String>();
		map.put("result", "success");
		return map;
	}
	
}
