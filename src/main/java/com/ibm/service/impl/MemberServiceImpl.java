package com.ibm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.domain.MemberDomain;
import com.ibm.mapper.MemberMapper;
import com.ibm.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper memberMapper;
	

	@Override
	public void insertMember(MemberDomain memberDomain) {
		memberMapper.insertMember(memberDomain);
	}
	
}
