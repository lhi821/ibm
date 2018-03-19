package com.ibm.controller;

import java.util.List;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.domain.MeetingNoteDomain;
import com.ibm.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	MypageService myPageService;
	
	@GetMapping("/main")
	public ModelAndView mypage() throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/index");
		
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
	public ModelAndView mypageInfo() throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/mypage_info");
		return mv;
	}

}
