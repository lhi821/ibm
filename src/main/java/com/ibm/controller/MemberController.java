package com.ibm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.domain.BoardDomain;
import com.ibm.domain.MemberDomain;
import com.ibm.domain.RoleDomain;
import com.ibm.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/join")
	public ModelAndView join() throws Exception{
		ModelAndView mv = new ModelAndView("/member/join");
		return mv;
	}
	
	
	@PostMapping("/create")
	public String create(MemberDomain memberDomain) throws Exception{
		memberService.createMember(memberDomain);
		
		return "redirect:/board/index";
	}
	
	
	private int i = 0;
	@GetMapping("/create")
	public String temp(/*MemberDomain memberDomain, List<RoleDomain> roleDomainList*/) throws Exception{
		
		i++;
		List<RoleDomain> roleDomainList = new ArrayList<RoleDomain>();
		RoleDomain tmpRoleDomain = new RoleDomain();
		tmpRoleDomain.setRoleNo(1);
		tmpRoleDomain.setRoleName("master");

		roleDomainList.add(tmpRoleDomain);
		
		MemberDomain memberDomain = new MemberDomain();
		memberDomain.setMemberNo(i);
		memberDomain.setMemberName(String.valueOf(i));
		memberDomain.setPhoneNumber(String.valueOf(i));
		memberDomain.setEmailAddr(String.valueOf(i));
		memberDomain.setPassword(String.valueOf(i));
		

		
		memberService.insertMember(memberDomain, roleDomainList);
		
		return "redirect:/board/index";
	}

}
