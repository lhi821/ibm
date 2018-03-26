package com.ibm.service;

import java.util.List;
import java.util.Map;

import com.ibm.domain.MeetingNoteDomain;

public interface MeetingNoteService {
	
	public void createDialogue(Map<String, Object> requestMap);
	
	public void createPlanText(MeetingNoteDomain meetingNoteDomain);

	//public List<MeetingNoteDomain> selectMeetingNoteList();
	public List<Integer> countMeetingTypePerNote();
	public List<String> type_countMeetingTypePerNote();
}
