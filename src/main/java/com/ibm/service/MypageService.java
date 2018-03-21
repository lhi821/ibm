package com.ibm.service;

import java.util.List;

import com.ibm.domain.MeetingNoteDomain;

public interface MypageService {

		public List<MeetingNoteDomain> getMeetingNoteInfo(String usrId) throws Exception;

}
