package com.ibm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.domain.MeetingNoteDomain;
import com.ibm.service.IntegSearchService;

@Controller
@RequestMapping("/integSearch")
public class IntegSearchController {
	
	
	@Autowired
	IntegSearchService searchService;
	
	@GetMapping("/result")
	public ModelAndView getIntegSearchResult(HttpServletRequest request,
			@RequestParam(value="veiwType", required=false, defaultValue = "G") String veiwType,
			@RequestParam(value="sideBar", required=false, defaultValue = "T") String sideBar,
			@RequestParam(value="subMenu", required=false) String subMenu) throws Throwable {
		
		String category = request.getParameter("category");
		String inputVal = request.getParameter("inputVal");
		
		MeetingNoteDomain mtnDomain = new MeetingNoteDomain();
		
		mtnDomain.setCategory(category);
		mtnDomain.setInputVal(inputVal);
		
		ModelAndView mv = new ModelAndView("/board/index");
		List<MeetingNoteDomain> resultList;
		resultList = searchService.getIntegSearchResult(mtnDomain);
		
		mv.addObject("resultList", resultList);
		
		
		mv.addObject("veiwType", veiwType);
		mv.addObject("sideBar", sideBar);
		mv.addObject("subMenu", subMenu);
		
		return mv;
	}
	
	@GetMapping("/date_result")
	public ModelAndView getIntegSearchResult_date(HttpServletRequest request,
			@RequestParam(value="veiwType", required=false, defaultValue = "G") String veiwType,
			@RequestParam(value="sideBar", required=false, defaultValue = "T") String sideBar,
			@RequestParam(value="subMenu", required=false) String subMenu) throws Throwable {
		
		
		String regDate = request.getParameter("selectedDate");
		String parseDate[] = regDate.split("/");
		String formatedDate = parseDate[2]+"-"+parseDate[0]+"-"+parseDate[1];		
		
		MeetingNoteDomain mtnDomain = new MeetingNoteDomain();
		
		mtnDomain.setRegDate(formatedDate);
		
		
		ModelAndView mv = new ModelAndView("/board/index");
		List<MeetingNoteDomain> resultList;
		resultList = searchService.getIntegSearchResult_date(mtnDomain);
		
		
		mv.addObject("resultList", resultList);
		
		
		mv.addObject("veiwType", veiwType);
		mv.addObject("sideBar", sideBar);
		mv.addObject("subMenu", subMenu);
		
		return mv;
	}
	
}
