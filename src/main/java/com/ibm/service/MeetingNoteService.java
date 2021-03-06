package com.ibm.service;

import java.util.List;
import java.util.Map;

import com.ibm.domain.NoteHeadDomain;

public interface MeetingNoteService {
	
	public void createDialogue(Map<String, Object> requestMap);
	
	public void deleteMtn(Map<String, Object> requestMap);
	
	public void setNoteHead(Map<String, Object> noteHeadMap);
	
	public List<NoteHeadDomain> getNoteHead(Map<String, Object> noteHeadMap);

	/*public List<MeetingNoteDomain> selectMeetingNoteList();*/
	public List<Integer> countMeetingTypePerNote();
	public List<String> type_countMeetingTypePerNote();
	public List<Integer> hitRanking();
	public List<String> title_hitRanking();
	public int countMeetingNote();
	public List<String> companyRanking();
	public List<Integer> countCompanyRanking();
	
	public void favorite(Map<String, Object> requestMap);
}
