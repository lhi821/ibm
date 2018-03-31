package com.ibm.service;

import java.util.List;

import com.ibm.domain.CompanyInfoDomain;
import com.ibm.domain.MeetingTypeCodeDomain;
import com.ibm.domain.MemberDomain;
import com.ibm.domain.ProjectDomain;

public interface AdminService {
	
	public boolean insertMeetingType(MeetingTypeCodeDomain meetingTypeCodeDomain);
	public List<MeetingTypeCodeDomain> selectMeetingTypeList();
	public void updateMeetingType(MeetingTypeCodeDomain meetingTypeCodeDomain);
	public void deleteMeetingType(String id);
	
	public boolean insertCompany(CompanyInfoDomain companyInfoDomain);
	public List<CompanyInfoDomain> selectCompanyInfoList();
	public void updateCompany(CompanyInfoDomain companyInfoDomain);
	public void deleteCompany(String id);
	
	public Object selectMemberByProjectAdmin(String memberid);
	public List<MemberDomain> selectMemberByProject(String projectid);
	public List<MemberDomain> selectNonMemberByProject(String projectid);
}

