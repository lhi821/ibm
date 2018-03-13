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
	public List<AdminDomain> selectMeetingTypeList() {
		return adminMapper.selectMeetingTypeList();
	}
}
