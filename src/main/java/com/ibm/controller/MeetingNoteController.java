package com.ibm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.domain.BoardDomain;
import com.ibm.domain.MeetingNoteDomain;
import com.ibm.service.BoardService;
import com.ibm.service.MeetingNoteService;

@Controller
@RequestMapping("/meetingnote")
public class MeetingNoteController {
	
	@Autowired
	MeetingNoteService meetingNoteService;
	
	@PostMapping("/create/dialogue")
	public String newMtnDialouge(@RequestBody Map<String, Object> requestMap) throws Exception{
		meetingNoteService.createDialogue(requestMap);
		
		return "redirect:/board/index";
	}
	
	@PostMapping("/create/plaintext")
	public String newMtnPlainText(@RequestBody MeetingNoteDomain meetingNoteDomain) throws Exception{

		System.out.println(meetingNoteDomain.getMeetingNoteId());
		System.out.println(meetingNoteDomain);
		
		meetingNoteService.createPlanText(meetingNoteDomain);
		
		return "redirect:/board/index";
	}

}
