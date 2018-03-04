package com.ibm.service;

import java.util.List;

import com.ibm.domain.MemberDomain;
import com.ibm.domain.RoleDomain;

public interface MemberService {

	public void createMember(MemberDomain memberDomain);
	
	public void insertMember(MemberDomain memberDomain, List<RoleDomain> roleDomainList);
	
	public MemberDomain selectMember(MemberDomain memberDomain);
	
	public MemberDomain selectMemberByEmail(String emailAddr);
	
}
