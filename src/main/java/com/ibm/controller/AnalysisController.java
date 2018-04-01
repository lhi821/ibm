package com.ibm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.domain.DivisionDomain;
import com.ibm.service.MeetingNoteService;
import com.ibm.service.ProjectService;


@Controller
@RequestMapping("/analysis")
public class AnalysisController {
	
	@Autowired
	MeetingNoteService meetingNoteService;
	
	@Autowired
	ProjectService projectService;

	@GetMapping("/index")
	public ModelAndView board() throws Exception{
		ModelAndView mv = new ModelAndView("/analysis/index");
		
		//Chart1 : meeting type ranking
		List<String> meetingType = meetingNoteService.type_countMeetingTypePerNote();
		List<Integer> meetingTypeCount = meetingNoteService.countMeetingTypePerNote();
		
		//Chart3 : attendee company ranking
		List<String> company = meetingNoteService.companyRanking();	//company nm
		List<Integer> companyCount = meetingNoteService.countCompanyRanking();	//company nm count
		int meetingNoteCount = meetingNoteService.countMeetingNote();
		
		//Chart4 : meeting note ranking per hit count
		List<String> title = meetingNoteService.title_hitRanking();
		List<Integer> hit = meetingNoteService.hitRanking();
		
		mv.addObject("projects", projectService.selectProjectList());
		
		mv.addObject("typeName", meetingType);
		mv.addObject("typeCount", meetingTypeCount);
		mv.addObject("companyName", company);
		mv.addObject("companyCount", companyCount);
		mv.addObject("meetingNoteCount",meetingNoteCount);
		mv.addObject("noteTitle", title);
		mv.addObject("noteHit", hit);
		
		return mv;
	}
	
	@PostMapping("/getSubtProject")
	@ResponseBody
	public List<DivisionDomain> getSubtProject(String projectId) throws Exception{
		return projectService.selectDivisionList(projectId);
	}

}
