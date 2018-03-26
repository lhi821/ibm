package com.ibm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.domain.CompanyInfoDomain;
import com.ibm.domain.MeetingTypeCodeDomain;
import com.ibm.mapper.AdminMapper;
import com.ibm.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminMapper adminMapper;
	
	//TAB 1 [MeetingTypeCode Config]-----------------
	@Override
	public boolean insertMeetingType(MeetingTypeCodeDomain meetingTypeCodeDomain) {
		
		List<MeetingTypeCodeDomain> typeList = adminMapper.selectMeetingTypeList();
		if (typeList.isEmpty()) 
			meetingTypeCodeDomain.setMeetingTypeID("MT00001");
		else {
			for (int i = 0; i < typeList.size(); i++) {
				if (meetingTypeCodeDomain.getMeetingTypeNM().equals(typeList.get(i).getMeetingTypeNM())) {
					return false;
				}
			}
			String prevID = adminMapper.selectLatestMeetingType().get(0).getMeetingTypeID().substring(2, 7);
			int prevID_int = Integer.parseInt(prevID) + 1;
			String postID = "MT" + String.format("%05d", prevID_int);
			meetingTypeCodeDomain.setMeetingTypeID(postID);
		}
		adminMapper.insertMeetingType(meetingTypeCodeDomain);
		return true;
	}
	
	@Override
	public List<MeetingTypeCodeDomain> selectMeetingTypeList() {
		return adminMapper.selectMeetingTypeList();
	}
	
	@Override
	public void updateMeetingType(MeetingTypeCodeDomain meetingTypeCodeDomain) {
		adminMapper.updateMeetingType(meetingTypeCodeDomain);
	}
	
	@Override
	public void deleteMeetingType(String id) {
		adminMapper.deleteMeetingType(id);
	}
	
	//TAB 2 [CompanyInfo Config]-----------------
	@Override
	public void insertCompany(CompanyInfoDomain companyInfoDomain) {
		String prevID = adminMapper.selectLatestCompany().get(0).getCompanyID().substring(2, 7);
		int prevID_int = Integer.parseInt(prevID) + 1;
		String postID =	"CP" + String.format("%05d", prevID_int);
		companyInfoDomain.setCompanyID(postID);
		adminMapper.insertCompany(companyInfoDomain);
	}
	
	public List<CompanyInfoDomain> selectCompanyInfoList(){
		return adminMapper.selectCompanyInfoList();
	}
	
	@Override
	public void updateCompany(CompanyInfoDomain companyInfoDomain) {
		adminMapper.updateCompany(companyInfoDomain);
	}
	
	@Override
	public void deleteCompany(String id) {
		adminMapper.deleteCompany(id);
	}
}
