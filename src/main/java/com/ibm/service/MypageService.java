package com.ibm.service;

import java.util.List;

import com.ibm.domain.HitHistoryDomain;
import com.ibm.domain.MeetingNoteDomain;

public interface MypageService {

	public List<MeetingNoteDomain> getMeetingNoteInfo(String usrId) throws Exception;
	
	public void insertHistory(HitHistoryDomain hitHistoryDomain) throws Exception;
	
	public List<MeetingNoteDomain> getViewHistory(HitHistoryDomain hitHistoryDomain) throws Exception;

	public List<MeetingNoteDomain> getUploadHistory(MeetingNoteDomain mtnDomain) throws Exception;

	public List<MeetingNoteDomain> getEditHistory(MeetingNoteDomain mtnDomain) throws Exception;
			
}
