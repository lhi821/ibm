package com.ibm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.domain.AlertDomain;
import com.ibm.domain.CompanyInfoDomain;
import com.ibm.domain.MeetingTypeCodeDomain;
import com.ibm.domain.MemberDomain;
import com.ibm.domain.ProjectDomain;
import com.ibm.mapper.AdminMapper;
import com.ibm.mapper.MemberMapper;
import com.ibm.mapper.ProjectMapper;
import com.ibm.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminMapper adminMapper;
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	ProjectMapper projectMapper;
	
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
	public boolean insertCompany(CompanyInfoDomain companyInfoDomain) {
		
		List<CompanyInfoDomain> companyList = adminMapper.selectCompanyInfoList();
		if (companyList.isEmpty()) 
			companyInfoDomain.setCompanyID("CP00001");
		else {
			for (int i = 0; i < companyList.size(); i++) {
				if (companyInfoDomain.getCompanyNM().equals(companyList.get(i).getCompanyNM())) {
					return false;
				}
			}
			String prevID = adminMapper.selectLatestCompany().get(0).getCompanyID().substring(2, 7);
			int prevID_int = Integer.parseInt(prevID) + 1;
			String postID =	"CP" + String.format("%05d", prevID_int);
			companyInfoDomain.setCompanyID(postID);
		}

		adminMapper.insertCompany(companyInfoDomain);
		return true;
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
	
	//TAB 3 [InviteMember Config]-----------------
	@Override
	public Object selectMemberByProjectAdmin(String memberid){
		
		ArrayList<ProjectDomain> AdminProjectList = (ArrayList<ProjectDomain>) projectMapper.selectProjectByAdmin(memberid);
		
		HashMap<HashMap<String,String>,List<HashMap<String, List<MemberDomain>>>> map = new HashMap<HashMap<String,String>, List<HashMap<String, List<MemberDomain>>>>();
		
		for(int i = 0; i < AdminProjectList.size(); i++) {
			
			ProjectDomain projectlist = AdminProjectList.get(i);
			
			List<MemberDomain> memberlist = new ArrayList<>();
			List<MemberDomain> nonmemberlist = new ArrayList<>();
			
			memberlist = selectMemberByProject(projectlist.getProjectid());
			nonmemberlist = selectNonMemberByProject(projectlist.getProjectid());
			
			HashMap<String, List<MemberDomain>> rightMemberList = new HashMap<>();
			HashMap<String, List<MemberDomain>> leftMemberList = new HashMap<>();
			
			rightMemberList.put("rightMemberList", memberlist);
			leftMemberList.put("leftMemberList", nonmemberlist);
			
			List<HashMap<String, List<MemberDomain>>> leftright = new ArrayList<>();
			leftright.add(leftMemberList);
			leftright.add(rightMemberList);
			
			HashMap<String,String> project = new HashMap<>();
			project.put(projectlist.getProjectid(), projectlist.getProjectnm());
			
			map.put(project, leftright);
			
		}
		
		return map;
	}
	
	@Override
	public List<MemberDomain> selectMemberByProject(String projectid){
		return memberMapper.selectMemberByProject(projectid);
	}
	
	@Override
	public List<MemberDomain> selectNonMemberByProject(String projectid){
		return memberMapper.selectNonMemberByProject(projectid);
	}

	@Override
	public boolean insertMemberInProject(String projectid, List<String> memberid) {
		
		adminMapper.deleteMemberByProject(projectid);
		
		String alertid;
		String lastAlertId;
		
		for(int i = 0; i < memberid.size(); i++) {
			
			lastAlertId = adminMapper.selectLastestAlertid();
			alertid = null;
			if (lastAlertId == null) {
				alertid = "AL00001";
			} else {
				String prevID = lastAlertId.substring(2, 7);
				int prevID_int = Integer.parseInt(prevID) + 1;
				alertid =	"AL" + String.format("%05d", prevID_int);
			}
			
			adminMapper.insertMemberInProject(projectid, memberid.get(i));
			adminMapper.insertAlartMember(alertid, projectid, memberid.get(i));
		}
		return true;
	}

}
