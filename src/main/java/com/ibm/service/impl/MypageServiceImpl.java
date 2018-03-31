package com.ibm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.domain.HitHistoryDomain;
import com.ibm.domain.MeetingNoteDomain;
import com.ibm.mapper.MypageMapper;
import com.ibm.service.MypageService;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageMapper mypageMapper;
	
	@Override
	public List<MeetingNoteDomain> getMeetingNoteInfo(String usrId) throws Exception {
		return mypageMapper.getMeetingNoteInfo(usrId);
	}

	@Override
	public void insertHistory(HitHistoryDomain hitHistoryDomain) throws Exception {
		mypageMapper.insertHistory(hitHistoryDomain);
		
	}

	@Override
	public List<MeetingNoteDomain> getViewHistory(HitHistoryDomain hitHistoryDomain) throws Exception {
		return mypageMapper.getViewHistory(hitHistoryDomain);
		
	}

	@Override
	public List<MeetingNoteDomain> getUploadHistory(MeetingNoteDomain mtnDomain) throws Exception {
		// TODO Auto-generated method stub
		return mypageMapper.getUploadHistory(mtnDomain);
	}

	@Override
	public List<MeetingNoteDomain> getEditHistory(MeetingNoteDomain mtnDomain) throws Exception {
		// TODO Auto-generated method stub
		return mypageMapper.getEditHistory(mtnDomain);
	}

}
