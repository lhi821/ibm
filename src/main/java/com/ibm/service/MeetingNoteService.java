package com.ibm.service;

import java.util.List;
import java.util.Map;

import com.ibm.domain.MeetingNoteDomain;
import com.ibm.domain.NoteHeadDomain;

public interface MeetingNoteService {
	
	public void createDialogue(Map<String, Object> requestMap);
	
	public void setNoteHead(Map<String, Object> noteHeadMap);
	
	public List<NoteHeadDomain> getNoteHead(Map<String, Object> noteHeadMap);

}
