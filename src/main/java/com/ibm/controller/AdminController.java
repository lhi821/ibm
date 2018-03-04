package com.ibm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.domain.BoardDomain;
import com.ibm.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;
	
	@GetMapping("/index")
	public ModelAndView admin() throws Exception{
		ModelAndView mv = new ModelAndView("/admin/index");
		List<BoardDomain> resultList = new ArrayList<>();
		//resultList = adminService.selectBoardList();
		//mv.addObject("boardList", resultList);
		return mv;
	}
}
