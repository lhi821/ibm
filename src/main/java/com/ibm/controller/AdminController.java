package com.ibm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.domain.AdminDomain;
import com.ibm.domain.BoardDomain;
import com.ibm.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;
	
	@GetMapping("/config1")
	public ModelAndView adminConfig1() throws Exception{
		ModelAndView mv = new ModelAndView("/admin/config1");
		List<AdminDomain> meetingTypeList = new ArrayList<>();
		meetingTypeList = adminService.selectMeetingTypeList();
		mv.addObject("meetingTypeList", meetingTypeList);
		return mv;
	}
	
	@PostMapping("/create")
	public String newMeetingType(AdminDomain adminDomain) throws Exception{
		adminService.insertMeetingType(adminDomain);
		return "redirect:/admin/config1";
	}
	
	@PostMapping("/delete")
	public String deleteMeetingType(AdminDomain adminDomain){
		adminService.deleteMeetingType(adminDomain.getMeetingTypeID());
		return "redirect:/admin/config1";
	}
	
	@GetMapping("/config2")
	public ModelAndView adminConfig2() throws Exception{
		ModelAndView mv = new ModelAndView("/admin/config2");
		return mv;
	}
	
	@GetMapping("/config3")
	public ModelAndView adminConfig3() throws Exception{
		ModelAndView mv = new ModelAndView("/admin/config3");
		return mv;
	}
	
	@GetMapping("/systemAdmin")
	public ModelAndView systemAdmin() throws Exception{
		ModelAndView mv = new ModelAndView("/admin/systemAdmin");
		return mv;
	}
	
}
