package com.ibm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@GetMapping("/main")
	public ModelAndView mypage() throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/index");
		return mv;
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
