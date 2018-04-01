package com.ibm.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

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
		
		//MemberId 채번
		memberDomain.setMemberid(getMemNextKey());
		
		//비밀번호 암호화
		memberDomain.setPassword(new BCryptPasswordEncoder().encode(memberDomain.getPassword()));
		memberMapper.createMember(memberDomain);
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
		
	}
	
	public String getMemNextKey() {
		if(memberMapper.getLastMemberId() == null){
			return "M00001";
		}else {
			String idKeyStr = "";
			int idKeyNum = Integer.valueOf(memberMapper.getLastMemberId().substring(1))+1;
			int idKeyLen = (5 - String.valueOf(idKeyNum).length());
			for (int i=0;i<idKeyLen;i++) {
				idKeyStr += "0";
			}
			return "M" + idKeyStr + idKeyNum;
		}
	}

	@Override
	public void editMemberInfo(MemberDomain memberDomain) {
		// TODO Auto-generated method stub
		memberMapper.editMember(memberDomain);
	}

	@Override
	public List<MemberDomain> selectMemberByKeyword(Map<String, String> MemberMap) {
		// TODO Auto-generated method stub
		return memberMapper.selectMemberByKeyword(MemberMap);
	}

	@Override
	public MemberDomain selectMember_edit(MemberDomain memberDomain) {
		// TODO Auto-generated method stub
		return memberMapper.selectMember_edit(memberDomain);
	}

	@Override
	public void editMemberChange(MemberDomain memberDomain) {
		// TODO Auto-generated method stub
		memberDomain.setPassword(new BCryptPasswordEncoder().encode(memberDomain.getPassword()));
		memberMapper.editPassword(memberDomain);
	}
	
	public List<String> selectInvitedProjectList(String memberid){
		return memberMapper.selectInvitedProjectList(memberid);
	}

	@Override
	public void updateAlertStatus(String memberid) {
		memberMapper.updateAlertStatus(memberid);
	}
	
	
}
