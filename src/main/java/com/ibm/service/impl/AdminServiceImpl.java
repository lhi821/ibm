package com.ibm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.domain.AdminDomain;
import com.ibm.mapper.AdminMapper;
import com.ibm.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminMapper adminMapper;
	
	@Override
	public void insertMeetingType(AdminDomain adminDomain) {
		String prevID = adminMapper.selectLatestMeetingType().get(0).getMeetingTypeID().substring(2, 7);
		int prevID_int = Integer.parseInt(prevID) + 1;
		String postID =	"MT" + String.format("%05d", prevID_int);
		adminDomain.setMeetingTypeID(postID);
		adminMapper.insertMeetingType(adminDomain);
	}
	
	@Override
	public List<AdminDomain> selectMeetingTypeList() {
		return adminMapper.selectMeetingTypeList();
	}
	
//	@Override
//	public void deleteMeetingType(String id) {
//		adminMapper.deleteMeetingType(id);
//	}
}
