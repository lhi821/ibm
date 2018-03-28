package com.ibm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.service.MeetingNoteService;


@Controller
@RequestMapping("/analysis")
public class AnalysisController {
	
	@Autowired
	MeetingNoteService meetingNoteService;

	@GetMapping("/index")
	public ModelAndView board() throws Exception{
		ModelAndView mv = new ModelAndView("/analysis/index");
		
		//Chart1 : meeting type ranking
		List<String> meetingType = meetingNoteService.type_countMeetingTypePerNote();
		List<Integer> meetingTypeCount = meetingNoteService.countMeetingTypePerNote();
		
		//Chart4 : meeting note ranking per hit count
		List<String> title = meetingNoteService.title_hitRanking();
		List<Integer> hit = meetingNoteService.hitRanking();
		
		mv.addObject("typeName", meetingType);
		mv.addObject("typeCount", meetingTypeCount);
		mv.addObject("noteTitle", title);
		mv.addObject("noteHit", hit);
		return mv;
	}

}
