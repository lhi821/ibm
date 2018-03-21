package com.ibm.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibm.domain.MemberDomain;
import com.ibm.domain.RoleDomain;
import com.ibm.mapper.MemberMapper;
import com.ibm.mapper.MemberRoleMapper;
import com.ibm.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	MemberRoleMapper memberRoleMapper;

	@Override
	public void createMember(MemberDomain memberDomain) {
		memberDomain.setPassword(new BCryptPasswordEncoder().encode(memberDomain.getPassword()));
		memberMapper.createMember(memberDomain);
//		memberMapper.insertMember(memberDomain);
	}
	
	@Override
	@Transactional
	public void insertMember(MemberDomain memberDomain, List<RoleDomain> roleDomainList) {
		for (RoleDomain roleDomain : roleDomainList) {
			memberDomain.setPassword(new BCryptPasswordEncoder().encode(memberDomain.getPassword()));
			//유저 저장
			memberMapper.insertMember(memberDomain);
			//권한 저장
//			memberRoleMapper.insertMemberRole(memberDomain.getMemberNo(), roleDomain.getRoleNo());
		}
	}
	
	@Override
	public MemberDomain selectMember(MemberDomain memberDomain) {
		return memberMapper.selectMember(memberDomain);
	}
	
	@Override
	public MemberDomain selectMemberByEmail(String emailAddr) {
		return memberMapper.selectMemberByEmail(emailAddr);
	}

	@Override
	public MemberDomain login(String email, String password) {
		
		MemberDomain result = memberMapper.login(email, password);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(email.equalsIgnoreCase(result.getEmail()) && encoder.matches(password, result.getPassword())) {
			return result;
		}else{
		    return null;
		}
		
		
//		if(result == null) {
//			System.out.println("No user found.");
////			throw new UsernameNotFoundException("No user found.");
//		}
		
//		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
//		roles.add(new SimpleGrantedAuthority("ROLE_USER"));
		
	}
	
	
	
}
