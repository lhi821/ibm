package com.ibm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.domain.BoardDomain;
import com.ibm.mapper.BoardMapper;
import com.ibm.mapper.HashTagMapper;
import com.ibm.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper boardMapper;
	
	@Autowired
	HashTagMapper hashtagMapper;
	
	@SuppressWarnings("rawtypes")
	@Override
	public Map<String, Object> selectMeetingNote(String meetingNoteId) {
		Map<String, Object> resultMap = new HashMap<>();
		Map meetingTypeMap = boardMapper.selectMeetingNote(meetingNoteId);
		resultMap.put("meetingNote", meetingTypeMap);
		resultMap.put("actionItemList", boardMapper.selectMeetingNoteActionItem(meetingNoteId));
		
		String hasTagStr = "";
		for(Object hashTag : boardMapper.selectMeetingNoteHashTag(meetingNoteId)) {
			Map hashTagMap = (Map) hashTag;
			hasTagStr = hasTagStr + "#"+hashTagMap.get("HASHTAG")+" ";
		}

		resultMap.put("hashTag", hasTagStr);
		resultMap.put("meetingType", boardMapper.selectMeetingTypeNmbyId((String)meetingTypeMap.get("MEETINGTYPEID")));
		
		String attendantStr = "";
		for(Object attendee : boardMapper.selectMeetingNoteAttendant(meetingNoteId)) {
			Map attendentMap = (Map) attendee;
			attendantStr = attendantStr + attendentMap.get("MEMBERNM")+", ";
		}
		attendantStr = attendantStr.substring(0, attendantStr.length()-2);
		resultMap.put("attendant", attendantStr);
		resultMap.put("contentsList", boardMapper.selectMeetingNoteContent(meetingNoteId));
		
		return resultMap;
	}
	
	@Override
	public void insertBoard(BoardDomain boardDomain) {
		boardMapper.insertBoard(boardDomain);
	}
	
	@Override
	public void updateBoard(BoardDomain boardDomain) {
		boardMapper.updateBoard(boardDomain);
	}
	
	@Override
	public void deleteBoard(int id) {
		boardMapper.deleteBoard(id);
	}
	
	@Override
	public List<BoardDomain> selectBoardList() {
		return boardMapper.selectBoardList();
	}
	
	@Override
	public List<Map<String, Object>> getMeetingNote(Map<String, Object> requestMap) {
		List<Map<String, Object>> resultList = new ArrayList<>();
		
		for (Map<String, Object> meetingNote : boardMapper.getMeetingNote(requestMap)) {
			String hasTagStr = "";
			List<String> hashTagList = hashtagMapper.getHashTagStr(meetingNote.get("meetingNoteId"));
			
			for(String hashTag : hashTagList) {
				hasTagStr = hasTagStr + " <font class='main-hashTag cursor'>#"+hashTag+"</font>";
			}
			if (hasTagStr == "") {
				hasTagStr = "<font class='grayscale'>No hash Tag</font>";
			}
			meetingNote.put("hashTag", hasTagStr);
			resultList.add(meetingNote);
			
		}
	 	
		return resultList;
	}
	
}
