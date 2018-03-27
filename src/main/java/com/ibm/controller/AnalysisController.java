package com.ibm.controller;

import org.apache.tomcat.util.security.ConcurrentMessageDigest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ibm.service.MeetingNoteService;


@Controller
@RequestMapping("/analysis")
public class AnalysisController {
	
	@Autowired
	MeetingNoteService meetingNoteService;

	@GetMapping("/index")
	public ModelAndView board() throws Exception{
		ModelAndView mv = new ModelAndView("/analysis/index");
		
		//top1 meetingtype 이름과 count
		String meetingType;
		meetingType = meetingNoteService.type_countMeetingTypePerNote().get(0);
		int meetingTypeCount;
		meetingTypeCount = meetingNoteService.countMeetingTypePerNote().get(0);
		
		mv.addObject("typeName", meetingType);
		mv.addObject("typeCount", meetingTypeCount);
		return mv;
	}

}
