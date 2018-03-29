package com.ibm.service;

import java.util.List;
import java.util.Map;

import com.ibm.domain.BoardDomain;

public interface BoardService {

	public Map<String, Object> selectMeetingNote(String meetingNoteId);
	
	public void insertBoard(BoardDomain boardDomain);
	
	public void updateBoard(BoardDomain boardDomain);
	
	public void deleteBoard(int id);
	
	public List<BoardDomain> selectBoardList();
	
	public List<Map<String, Object>> getMeetingNote(Map<String, Object> requestMap);
	
}
