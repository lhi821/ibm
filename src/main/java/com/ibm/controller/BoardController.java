package com.ibm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.domain.BoardDomain;
import com.ibm.domain.HitHistoryDomain;
import com.ibm.service.AdminService;
import com.ibm.service.BoardService;
import com.ibm.service.MypageService;

@Controller
@SessionAttributes("id")
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;

	@Autowired
	AdminService adminService;
	
	@Autowired
	MypageService myPageService;

	@GetMapping("/index")
	public ModelAndView board(@RequestParam(value="veiwType", required=false, defaultValue = "G") String veiwType,
														@RequestParam(value="sideBar", required=false, defaultValue = "T") String sideBar,
														@RequestParam(value="subMenu", required=false) String subMenu,
														HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/board/index");
		List<Map<String,Object>> resultList = new ArrayList<>();
		Map<String, Object> requestMap = new HashMap<String,Object>();
		resultList = boardService.getMeetingNote(requestMap);
		mv.addObject("resultList", resultList);
		mv.addObject("veiwType", veiwType);
		mv.addObject("sideBar", sideBar);
		mv.addObject("subMenu", subMenu);
		
		// get session
		HttpSession session = request.getSession();
		if(session.getAttribute("id")==null) { 
			session.invalidate();
			return new ModelAndView("redirect:/member/index");
		}
		
		return mv;
	}

	@GetMapping("/new")
	public ModelAndView newPost(@RequestParam(value="veiwType", required=false, defaultValue = "G") String veiwType,
															@RequestParam(value="sideBar", required=false, defaultValue = "T") String sideBar,
															@RequestParam(value="subMenu", required=false) String subMenu,
															HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/board/create");
		String usrId = session.getAttribute("id").toString();
		
		mv.addObject("veiwType", veiwType);
		mv.addObject("sideBar", sideBar);
		mv.addObject("subMenu", subMenu);
		mv.addObject("meetingTypes", adminService.selectMeetingTypeList());
		mv.addObject("usrId", usrId);
		return mv;
	}
	
	@PostMapping("/create")
	public String newPost(BoardDomain boardDomain) throws Exception{

		boardService.insertBoard(boardDomain);
		
		return "redirect:/board/index";
	}
	
	@PostMapping("/update")
	public String updatePost(BoardDomain boardDomain) throws Exception{
		Map<String, Object> resultMap = new HashMap<>();
		try {
			boardService.updateBoard(boardDomain);
			resultMap.put("message", "success");
		} catch(Exception E) {
			System.out.print(E);
			resultMap.put("message", "fail");
		}
		
		return "redirect:/board/index";
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public Map<String, Object> deletePost(BoardDomain boardDomain) throws Exception{
		Map<String, Object> resultMap = new HashMap<>();
		try {
			boardService.deleteBoard(boardDomain.getId());
			resultMap.put("message", "success");
		} catch(Exception E) {
			resultMap.put("message", "fail");
		}
		return resultMap;
	}

	@GetMapping("/{id}")
	public ModelAndView read(@PathVariable String id, HttpSession session,
													 @RequestParam(value="veiwType", required=false, defaultValue = "G") String veiwType,
													 @RequestParam(value="sideBar", required=false, defaultValue = "T") String sideBar,
														@RequestParam(value="subMenu", required=false) String subMenu) throws Exception{
		ModelAndView mv = new ModelAndView("/board/read");
		Map<String, Object> resultMap = new HashMap<>();
		try {
			Map<String, Object> result = boardService.selectMeetingNote(id);
			resultMap.put("result", result);
			
			resultMap.put("message", "success");
			
			HitHistoryDomain hitHistoryDomain = new HitHistoryDomain();
			hitHistoryDomain.setMeetingNoteId(id);;
			hitHistoryDomain.setMemberId(session.getAttribute("id").toString());
			hitHistoryDomain.setHitHistoryDiv("VIEW");
			myPageService.insertHistory(hitHistoryDomain);
			
		} catch(Exception E) {
			resultMap.put("message", "fail");
		}
		mv.addObject("meetingTypes", adminService.selectMeetingTypeList());
		mv.addObject("resultMap", resultMap);
		mv.addObject("veiwType", veiwType);
		mv.addObject("sideBar", sideBar);
		mv.addObject("subMenu", subMenu);
		return mv;
	}

}
