package com.ibm.service;

import java.util.List;
import java.util.Map;

import com.ibm.domain.MemberDomain;
import com.ibm.domain.RoleDomain;

public interface MemberService {

	public void createMember(MemberDomain memberDomain);
	
	public void insertMember(MemberDomain memberDomain, List<RoleDomain> roleDomainList);
	
	public void editMemberInfo(MemberDomain memberDomain);
	
	public MemberDomain selectMember(MemberDomain memberDomain);
	
	public MemberDomain selectMemberByEmail(String emailAddr);
	
//	public MemberDomain login(MemberDomain memberDomain);

	public MemberDomain login(String email,String password);
	
	public List<MemberDomain> selectMemberByKeyword(Map<String, String> MemberMap);
	
	public MemberDomain selectMember_edit(MemberDomain memberDomain);

	public void editMemberChange(MemberDomain memberDomain);

	public List<String> selectInvitedProjectList(String memberid);

	public void updateAlertStatus(String memberid);
	
}
