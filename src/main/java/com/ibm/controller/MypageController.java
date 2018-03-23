package com.ibm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.domain.MeetingNoteDomain;
import com.ibm.domain.MemberDomain;
import com.ibm.service.MemberService;
import com.ibm.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	MypageService myPageService;
	@Autowired
	MemberService memberService;
	
	@GetMapping("/main")
	public ModelAndView mypage(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/index");
		
		String usrId = session.getAttribute("id").toString();
		
		if(!(usrId == "")) {

			mv.addObject("userId", usrId);
		}
		
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/getMeetingNoteInfo.do")
	public List<MeetingNoteDomain> getMeetingNoteInfo(@RequestParam String usrId) throws Exception{

		List<MeetingNoteDomain> meetingInfoList = myPageService.getMeetingNoteInfo(usrId);
	
		return meetingInfoList;
	}
	
	@GetMapping("/calendar")
	public ModelAndView mypageCalendar() throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/mypage_calendar");
		return mv;
	}
	
	@GetMapping("/history")
	public ModelAndView mypageHistory() throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/mypage_history");
		return mv;
	}
	
	@GetMapping("/info")
	public ModelAndView mypageInfo(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/mypage_info");
		
		mv.addObject("userId", session.getAttribute("id"));
		mv.addObject("userName", session.getAttribute("name"));
		mv.addObject("userCompany", session.getAttribute("companyid"));
		mv.addObject("userDept", session.getAttribute("dept"));
		mv.addObject("userJobs", session.getAttribute("jobs"));
		mv.addObject("userPhone", session.getAttribute("phone"));
		mv.addObject("userEmail", session.getAttribute("email"));
		
		return mv;
	}
	
	@GetMapping("/editInfo.do")
	public ModelAndView mypageEditInfo(HttpSession session, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("redirect:/mypage/info");
		MemberDomain member = new MemberDomain();
		
		//부서변경, 직책변경, 전화번호 변경, 이메일변경
		member.setMemberid(request.getParameter("memberid"));
		member.setCompanyid(request.getParameter("company"));
		member.setDept(request.getParameter("dept"));
		member.setJobs(request.getParameter("position"));
		member.setPhone(request.getParameter("phone"));
		member.setEmail(request.getParameter("email"));
		
		memberService.editMemberInfo(member);
		
		MemberDomain editedMemberInfo = memberService.selectMember_edit(member);
		session.setAttribute("id", editedMemberInfo.getMemberid());
		session.setAttribute("name", editedMemberInfo.getMembernm());
		session.setAttribute("companyid", editedMemberInfo.getCompanyid());
		session.setAttribute("dept", editedMemberInfo.getDept());
		session.setAttribute("jobs", editedMemberInfo.getJobs());
		session.setAttribute("phone", editedMemberInfo.getPhone());
		session.setAttribute("email", editedMemberInfo.getEmail());
		
			
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/editPassword.do")
	public ModelAndView mypageEditPassword(HttpSession session, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("redirect:/mypage/info");
		MemberDomain member = new MemberDomain();
		member.setMemberid(session.getAttribute("id").toString());
		member.setPassword(request.getParameter("inputNewPassword"));
		
		memberService.editMemberChange(member);
		
		return mv;	
	}

}
