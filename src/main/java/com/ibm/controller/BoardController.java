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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.domain.BoardDomain;
import com.ibm.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;

	@GetMapping("/index")
	public ModelAndView board(@RequestParam(value="veiwType", required=false, defaultValue = "G") String veiwType,
														@RequestParam(value="sideBar", required=false, defaultValue = "T") String sideBar,
														@RequestParam(value="subMenu", required=false) String subMenu) throws Exception{
		ModelAndView mv = new ModelAndView("/board/index");
		List<BoardDomain> resultList = new ArrayList<>();
		resultList = boardService.selectBoardList();
		mv.addObject("boardList", resultList);
		mv.addObject("veiwType", veiwType);
		mv.addObject("sideBar", sideBar);
		mv.addObject("subMenu", subMenu);
		return mv;
	}

	@GetMapping("/new")
	public ModelAndView newPost(@RequestParam(value="veiwType", required=false, defaultValue = "G") String veiwType,
															@RequestParam(value="sideBar", required=false, defaultValue = "T") String sideBar) throws Exception{
		ModelAndView mv = new ModelAndView("/board/create");
		mv.addObject("veiwType", veiwType);
		mv.addObject("sideBar", sideBar);
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
	public ModelAndView read(@PathVariable int id, 
													 @RequestParam(value="veiwType", required=false, defaultValue = "G") String veiwType,
													 @RequestParam(value="sideBar", required=false, defaultValue = "T") String sideBar) throws Exception{
		ModelAndView mv = new ModelAndView("/board/read");
		Map<String, Object> resultMap = new HashMap<>();
		try {
			BoardDomain result = boardService.selectBoard(id);
			resultMap.put("result", result);
			
			resultMap.put("message", "success");
		} catch(Exception E) {
			resultMap.put("message", "fail");
		}
		mv.addObject("resultMap", resultMap);
		mv.addObject("veiwType", veiwType);
		mv.addObject("sideBar", sideBar);
		return mv;
	}

}
