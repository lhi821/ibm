package com.ibm.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.domain.MeetingNoteDomain;
import com.ibm.mapper.MeetingNoteMapper;
import com.ibm.service.MeetingNoteService;

@Service
public class MeetingNoteServiceImpl implements MeetingNoteService{
	
	@Autowired
	MeetingNoteMapper meetingNoteMapper;
	@Override
	public void createDialogue(Map<String, Object> requestMap) {
		MeetingNoteDomain meetingNoteDomain = (MeetingNoteDomain) requestMap.get("meetingNoteDomain");
		meetingNoteMapper.insertMeetingNote(meetingNoteDomain);
	}
	
	@Override
	public void createPlanText(MeetingNoteDomain meetingNoteDomain) {
		
		meetingNoteMapper.insertMeetingNote(meetingNoteDomain);
	}


}
