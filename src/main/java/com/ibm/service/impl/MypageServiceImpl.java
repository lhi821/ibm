package com.ibm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.domain.MeetingNoteDomain;
import com.ibm.mapper.MypageMapper;
import com.ibm.service.MypageService;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageMapper mypageMapper;
	
	@Override
	public List<MeetingNoteDomain> getMeetingNoteInfo(String usrId) throws Exception {
		// TODO Auto-generated method stub
		return mypageMapper.getMeetingNoteInfo(usrId);
	}

}
