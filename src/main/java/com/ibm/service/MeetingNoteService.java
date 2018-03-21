package com.ibm.service;

import java.util.Map;

import com.ibm.domain.MeetingNoteDomain;

public interface MeetingNoteService {
	
	public void createDialogue(Map<String, Object> requestMap);
	
	public void createPlanText(MeetingNoteDomain meetingNoteDomain);

}
