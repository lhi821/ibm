package com.ibm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.domain.CompanyInfoDomain;
import com.ibm.domain.MeetingTypeCodeDomain;
import com.ibm.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;
	
	// TAB 1 [MeetingTypeCode Config] -----------------------------------
	@GetMapping("/meetingTypeCode")
	public ModelAndView adminConfig1() throws Exception{
		ModelAndView mv = new ModelAndView("/admin/meetingTypeCode");
		List<MeetingTypeCodeDomain> meetingTypeList = new ArrayList<>();
		meetingTypeList = adminService.selectMeetingTypeList();
		mv.addObject("meetingTypeList", meetingTypeList);
		return mv;
	}
	
	@PostMapping("/create")
	public String newMeetingType(MeetingTypeCodeDomain meetingTypeCodeDomain) throws Exception{
		adminService.insertMeetingType(meetingTypeCodeDomain);
		return "redirect:/admin/meetingTypeCode";
	}

	@PostMapping("/update")
	public String updateMeetingType(MeetingTypeCodeDomain meetingTypeCodeDomain) throws Exception{
		adminService.updateMeetingType(meetingTypeCodeDomain);
		return "redirect:/admin/meetingTypeCode";
	}
	
	@PostMapping("/delete")
	public String deleteMeetingType(MeetingTypeCodeDomain meetingTypeCodeDomain) throws Exception{
		adminService.deleteMeetingType(meetingTypeCodeDomain.getMeetingTypeID());
		return "redirect:/admin/meetingTypeCode";
	}
	
	// TAB 2 [CompanyInfo Config] -----------------------------------
	@GetMapping("/companyInfo")
	public ModelAndView adminConfig2() throws Exception{
		ModelAndView mv = new ModelAndView("/admin/companyInfo");
		List<CompanyInfoDomain> companyInfoList = new ArrayList<>();
		companyInfoList = adminService.selectCompanyInfoList();
		mv.addObject("companyInfoList",companyInfoList);
		return mv;
	}
	

	@PostMapping("/createCompany")
	public String newCompany(CompanyInfoDomain companyInfoDomain) throws Exception{
		adminService.insertCompany(companyInfoDomain);
		return "redirect:/admin/companyInfo";
	}

	@PostMapping("/updateCompany")
	public String updateCompany(CompanyInfoDomain companyInfoDomain) throws Exception{
		adminService.updateCompany(companyInfoDomain);
		return "redirect:/admin/companyInfo";
	}
	
	@PostMapping("/deleteCompany")
	public String deleteCompany(CompanyInfoDomain companyInfoDomain) throws Exception{
		adminService.deleteCompany(companyInfoDomain.getCompanyID());
		return "redirect:/admin/companyInfo";
	}
	
	// TAB 3 -----------------------------------
	@GetMapping("/inviteMember")
	public ModelAndView adminConfig3() throws Exception{
		ModelAndView mv = new ModelAndView("/admin/inviteMember");
		return mv;
	}
	
	@GetMapping("/systemAdmin")
	public ModelAndView systemAdmin() throws Exception{
		ModelAndView mv = new ModelAndView("/admin/systemAdmin");
		return mv;
	}
	
}
