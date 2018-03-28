package com.ibm.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.ibm.domain.MemberDomain;
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

		MemberDomain result = memberService.login(email, password);
		
		if(result == null) {
			
			String failmsg = "<script language='javascript' type='text/javascript'> alert('Fail Login'); </script>";
			
			model.addObject(failmsg);
			
			return model;

		}
		/* mypage 회원정보 수정 */
		String membernm = result.getMembernm();
		String memberid = result.getMemberid();
		String companyid = result.getCompanyid();
		String dept = result.getDept();
		String jobs = result.getJobs();
		String phone = result.getPhone();
		String mod_email = result.getEmail();
		
		
		// create session
		HttpSession session = request.getSession();
		session.setAttribute("id",memberid);
		/* mypage 회원정보 수정 */
		session.setAttribute("name", membernm);
		session.setAttribute("companyid", companyid);
		session.setAttribute("dept", dept);
		session.setAttribute("jobs", jobs);
		session.setAttribute("phone", phone);
		session.setAttribute("email", mod_email);
		
		md.addAttribute("id");
		
		String url = "redirect:/analysis/index";
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
	
	//회원가입
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
		memberDomain.setCompanyid(company);
		memberDomain.setDept(dept);
		memberDomain.setJobs(jobs);
		memberDomain.setPhone(phone);
		memberDomain.setJoinyn("Y");
		
		memberService.createMember(memberDomain);
		
		return "redirect:/member/index";
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
