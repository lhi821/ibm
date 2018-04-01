package com.ibm.controller;

import java.util.List;
import java.util.Map;

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
		String startDate = "";
		String endDate = "";
		String withDate = "";	//날짜포함여부 확인 변수
		
		MeetingNoteDomain mtnDomain = new MeetingNoteDomain();
		
		
		
		mtnDomain.setCategory(category);
		mtnDomain.setInputVal(inputVal);
		mtnDomain.setWithDate("");
		
		ModelAndView mv = new ModelAndView("/board/index");
		List<Map<String, Object>> resultList;
		
		if("y".equals(request.getParameter("withDate").toString())){
			
			startDate = request.getParameter("selectedStartDate");
			endDate = request.getParameter("selectedEndDate");
			withDate = request.getParameter("withDate");
			
			mtnDomain.setWithDate(withDate);
			mtnDomain.setStartTm(startDate);
			mtnDomain.setEndTm(endDate);
			
		}
			
		resultList = searchService.getIntegSearchResult(mtnDomain);	
		
		mv.addObject("resultList", resultList);		
		
		mv.addObject("veiwType", veiwType);
		mv.addObject("sideBar", sideBar);
		mv.addObject("subMenu", "FFFF");
		mv.addObject("searchVal", inputVal);
		mv.addObject("categoryVal", category);
		
		return mv;
	}
	
	
}
