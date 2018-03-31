package com.ibm.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.domain.CompanyInfoDomain;
import com.ibm.domain.MeetingTypeCodeDomain;
import com.ibm.domain.MemberDomain;
import com.ibm.domain.MemberProjectDivisionDomain;
import com.ibm.domain.ProjectDomain;
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
	public ModelAndView newMeetingType(MeetingTypeCodeDomain meetingTypeCodeDomain) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/meetingTypeCode");
		List<MeetingTypeCodeDomain> meetingTypeList = new ArrayList<>();
		if (adminService.insertMeetingType(meetingTypeCodeDomain)) {	//duplicate:N
			meetingTypeList = adminService.selectMeetingTypeList();
			mv.addObject("meetingTypeList", meetingTypeList);
			mv.addObject("resultmsg", "success");
			return mv; 
		}else {															//duplicate:Y
			meetingTypeList = adminService.selectMeetingTypeList();
			mv.addObject("meetingTypeList", meetingTypeList);
			mv.addObject("resultmsg", "fail");
			return mv;
		}
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
	public ModelAndView newCompany(CompanyInfoDomain companyInfoDomain) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/companyInfo");
		List<CompanyInfoDomain> companyInfoList = new ArrayList<>();
		if (adminService.insertCompany(companyInfoDomain)) {
			companyInfoList = adminService.selectCompanyInfoList();
			mv.addObject("companyInfoList",companyInfoList);
			mv.addObject("resultmsg", "success");
			return mv; 
		}else {
			companyInfoList = adminService.selectCompanyInfoList();
			mv.addObject("companyInfoList",companyInfoList);
			mv.addObject("resultmsg", "fail");
			return mv;
		}
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
	public ModelAndView inviteMember(HttpServletRequest request, MemberDomain memberDomain) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/inviteMember");
		
		HttpSession session = request.getSession();
		String memberid = session.getAttribute("id").toString();
		
		HashMap<String,List<HashMap<String, List<MemberDomain>>>> map = (HashMap<String, List<HashMap<String, List<MemberDomain>>>>) adminService.selectMemberByProjectAdmin(memberid);
		mv.addObject("projectlist",map);
		return mv;
	}
	
	@GetMapping("/systemAdmin")
	public ModelAndView systemAdmin() throws Exception{
		ModelAndView mv = new ModelAndView("/admin/systemAdmin");
		return mv;
	}
	
	@PostMapping("/applyMember")
	@ResponseBody
	public boolean insertMemberInProject(@RequestParam(value="memberid") List<String> memberid,
			@RequestParam(value="projectid") String projectid) throws Exception{
		return adminService.insertMemberInProject(projectid, memberid);
	}
}
