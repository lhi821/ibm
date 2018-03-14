package com.ibm.service;

import java.util.List;

import com.ibm.domain.AdminDomain;
import com.ibm.domain.BoardDomain;

public interface AdminService {
	public List<AdminDomain> selectMeetingTypeList();
	public void insertMeetingType(AdminDomain adminDomain);
//	public void deleteMeetingType(String id);
}

