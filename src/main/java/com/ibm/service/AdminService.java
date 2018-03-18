package com.ibm.service;

import java.util.List;

import com.ibm.domain.CompanyInfoDomain;
import com.ibm.domain.MeetingTypeCodeDomain;

public interface AdminService {
	
	public void insertMeetingType(MeetingTypeCodeDomain meetingTypeCodeDomain);
	public List<MeetingTypeCodeDomain> selectMeetingTypeList();
	public void updateMeetingType(MeetingTypeCodeDomain meetingTypeCodeDomain);
	public void deleteMeetingType(String id);
	
	public void insertCompany(CompanyInfoDomain companyInfoDomain);
	public List<CompanyInfoDomain> selectCompanyInfoList();
	public void updateCompany(CompanyInfoDomain companyInfoDomain);
	public void deleteCompany(String id);
}

