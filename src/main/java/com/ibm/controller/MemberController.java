package com.ibm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibm.domain.MemberDomain;
import com.ibm.domain.RoleDomain;
import com.ibm.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	private int i = 0;
	
	@GetMapping("/create")
	public String newPost(/*MemberDomain memberDomain, List<RoleDomain> roleDomainList*/) throws Exception{
		
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
