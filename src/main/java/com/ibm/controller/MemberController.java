package com.ibm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.domain.BoardDomain;
import com.ibm.domain.MemberDomain;
import com.ibm.domain.MemberRoleDomain;
import com.ibm.domain.RoleDomain;
import com.ibm.service.MemberService;


@Controller
@SessionAttributes("id")
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/index")
	public ModelAndView index() throws Exception{
		
		ModelAndView mv = new ModelAndView("/member/index");
		return mv;
		
	}
	
	
	@RequestMapping(value = "/login")
	public ModelAndView login(
			@RequestParam("inputEmail") String email,
			@RequestParam("inputPassword") String password,
			HttpServletRequest request,
			Model md
			) throws Exception{

		ModelAndView model = new ModelAndView("/member/index");

//		if (error != null) {
//			model.addObject("error", "Invalid username and password!");
//			return model;
//		}
//		if (logout != null) {
//			model.addObject("msg", "You've been logged out successfully.");
//			return model;
//		}

		MemberDomain result = memberService.login(email, password);
		
		if(result == null) {
			
			return model;
		}
		
		String membernm = result.getMembernm();
		String memberid = result.getMemberid();
		
		// create session
		HttpSession session = request.getSession();
		session.setAttribute("id",memberid);
		
		md.addAttribute("id");
		
		String url = "redirect:/board/index";
		return new ModelAndView(url);


	}

	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpServletRequest request,SessionStatus sessionStatus) throws Exception{
		
		HttpSession session = request.getSession();
		session.invalidate();
		sessionStatus.setComplete();
		
		String url = "redirect:/member/index";
		return new ModelAndView(url);

	}
	
	@GetMapping("/join")
	public String join(MemberDomain memberDomain) throws Exception{
		
		MemberRoleDomain role = new MemberRoleDomain();
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//		memberDomain.setPassword(passwordEncoder.encode(memberDomain.getPassword()));
//		role.setRoleName("USER");
//		memberDomain.setRoles(role);
//		memberDomain.save(memberDomain);
		return "redirect:/";
		
	}
	
	
	@RequestMapping("/create")
	public String create(MemberDomain memberDomain,
						HttpServletRequest request,
						@RequestParam("inputEmail") String email,
						@RequestParam("inputPassword") String password,
						@RequestParam("inputMemberNm") String membernm,
						@RequestParam("inputCompany") String company,
						@RequestParam("inputDept") String dept,
						@RequestParam("inputJobs") String jobs,
						@RequestParam("inputPhone") String phone
						) throws Exception{
		
		memberDomain.setEmail(email);
		memberDomain.setPassword(password);
		memberDomain.setMembernm(membernm);
		
		// company id 수정 필요
		memberDomain.setCompanyid(company);
		memberDomain.setDept(dept);
		memberDomain.setJobs(jobs);
		memberDomain.setPhone(phone);
		memberDomain.setJoinyn("Y");
		
		// memberid 채번 로직 필요
		memberDomain.setMemberid("m"+membernm);
		
		memberService.createMember(memberDomain);
		
		return "redirect:/member/index";
	}
	
	
	private int i = 0;
	@GetMapping("/createrole")
	public String temp(/*MemberDomain memberDomain, List<RoleDomain> roleDomainList*/) throws Exception{
		
		i++;
		List<RoleDomain> roleDomainList = new ArrayList<RoleDomain>();
		RoleDomain tmpRoleDomain = new RoleDomain();
		tmpRoleDomain.setRoleNo(1);
		tmpRoleDomain.setRoleName("master");

		roleDomainList.add(tmpRoleDomain);
		
//		MemberDomain memberDomain = new MemberDomain();
//		memberDomain.setMemberNo(i);
//		memberDomain.setMemberName(String.valueOf(i));
//		memberDomain.setPhoneNumber(String.valueOf(i));
//		memberDomain.setEmailAddr(String.valueOf(i));
//		memberDomain.setPassword(String.valueOf(i));
//		

		
//		memberService.insertMember(memberDomain, roleDomainList);
		
		return "redirect:/board/index";
	}
	
	@GetMapping("/mypage")
	public ModelAndView mypage() throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/index");
		return mv;
	}
	

	@PostMapping("/search")
	@ResponseBody
	public List<MemberDomain> selectMemberByKeyword(@RequestBody Map<String, String> MemberMap) throws Exception{
		return memberService.selectMemberByKeyword(MemberMap);
	}

}
