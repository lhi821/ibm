package com.ibm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ibm.domain.MeetingNoteDomain;
import com.ibm.domain.NoteHeadDomain;
import com.ibm.mapper.ActionItemMapper;
import com.ibm.mapper.HashTagMapper;
import com.ibm.mapper.MeetingNoteMapper;
import com.ibm.service.MeetingNoteService;

@Service
public class MeetingNoteServiceImpl implements MeetingNoteService{
	
	@Autowired
	MeetingNoteMapper meetingNoteMapper;
	
	@Autowired
	ActionItemMapper actionItemMapper;
	
	@Autowired
	HashTagMapper hashTagMapper;
	
	@SuppressWarnings("unchecked")
	@Override
	public void createDialogue(Map<String, Object> requestMap) {
		System.out.println(requestMap.get("meetingNoteDomain"));
		System.out.println(requestMap.get("AttendantsList"));
		System.out.println(requestMap.get("ActionItemList"));
		System.out.println(requestMap.get("HashTagList"));
		System.out.println(requestMap.get("MtnContentsList"));
		
		String meetingNoteId = getMtnNextKey();
		
		//회의록 저장
		Map<String, Object> meetingNoteMap = (Map<String, Object>) requestMap.get("meetingNoteDomain");
		meetingNoteMap.put("meetingNoteId", meetingNoteId);
		meetingNoteMapper.insertMeetingNote(meetingNoteMap);
		
		//참석자 저장
		int seq = 1;
		for (String attendee : (List<String>) requestMap.get("AttendantsList")) {
			Map<String, Object> attenantsMap = new HashMap<String, Object>();
			attenantsMap.put("meetingNoteId", meetingNoteId);
			attenantsMap.put("version", meetingNoteMap.get("version"));
			attenantsMap.put("seq", seq);
			attenantsMap.put("memberId", attendee);
			meetingNoteMapper.insertMtnAtentants(attenantsMap);
			seq++;
		}
		
		//ActionItem저장
		for (Object actionItem : (List<Object>) requestMap.get("ActionItemList")) {
			Map<String, Object> actionItemMap = (Map<String, Object>) actionItem;
			actionItemMap.put("meetingNoteId", meetingNoteId);
			actionItemMapper.insertActionItem(actionItemMap);
		}
		
		//HashMap저장
		for (Object hashTag : (List<Object>) requestMap.get("HashTagList")) {
			Map<String, Object> mtnHashTagMap = (Map<String, Object>) hashTag;
			Map<String, Object> hashTagMap = new HashMap<String, Object>();
			
			String hashTagId = getHtNextKey();
			Map<String, String> lastHashTagMap = hashTagMapper.getHashTag(mtnHashTagMap);
			if (lastHashTagMap == null) {
				hashTagMap.put("hashTagId", hashTagId);
				hashTagMap.put("hashTag", mtnHashTagMap.get("hashTag"));
				hashTagMapper.insertHashTag(hashTagMap);
			}else {
				hashTagId = lastHashTagMap.get("HASHTAGID");
			}
			
			mtnHashTagMap.put("meetingNoteId", meetingNoteId);
			mtnHashTagMap.put("hashTagId", hashTagId);
			hashTagMapper.insertMtnHashTag(mtnHashTagMap);
		}
		
		//Contents 저장
		for (Object mtnContents : (List<Object>) requestMap.get("MtnContentsList")) {
			Map<String, Object> mtnContentsMap = (Map<String, Object>) mtnContents;
			mtnContentsMap.put("meetingNoteId", meetingNoteId);
			meetingNoteMapper.insertMtnContents(mtnContentsMap);
		}
		
	}
	
	//노트헤드 저장
	@SuppressWarnings("unchecked")
	@Override
	public void setNoteHead(Map<String, Object> noteHeadMap) {
		String noteHeadId = getNhNextKey();
		noteHeadMap.put("noteHeadId", noteHeadId);
		meetingNoteMapper.setNoteHead(noteHeadMap);
		
		for (Object attendee : (List<Object>) noteHeadMap.get("attendantsList")) {
			Map<String, Object> headMbrMap = new HashMap<String, Object>();
			headMbrMap.put("headmbrId", getHeadMbrId());
			headMbrMap.put("noteheadId", noteHeadId);
			headMbrMap.put("memberId", attendee);
			meetingNoteMapper.createNoteHeadMbr(headMbrMap);
		}
	}
	
	//노트헤드가져오기
	@Override
	public List<NoteHeadDomain> getNoteHead(Map<String, Object> noteHeadMap){
		List<NoteHeadDomain> outList = new ArrayList<>();
		List<String> attendantList = new ArrayList<>();
		List<String> attendantNmList = new ArrayList<>();
		for (NoteHeadDomain noteHeadDomain : meetingNoteMapper.getNoteHead(noteHeadMap)) {
			String attendant = "";
			attendantList.clear();
			attendantNmList.clear();
			for (Map<String, String> memeberMap : meetingNoteMapper.getAttendants(noteHeadDomain.getNoteHeadId())) {
				attendant = attendant + memeberMap.get("MEMBERNM") + ", ";
				attendantList.add(memeberMap.get("MEMBERID"));
				attendantNmList.add(memeberMap.get("MEMBERNM"));
			}
			
			attendant = attendant.substring(0, attendant.length()-2);
			noteHeadDomain.setAttendant(attendant);
			noteHeadDomain.setAttendantIds(attendantList);
			noteHeadDomain.setAttendantNms(attendantNmList);
			outList.add(noteHeadDomain);
		}
		return outList;
	}
	public String getMtnNextKey() {
		if (meetingNoteMapper.getLastMeetingNoteId() == null) {
			return "MTN00001";
		}else {
			String idKeyStr = "";
			int idKeyLen = (5 - String.valueOf((Integer.valueOf(meetingNoteMapper.getLastMeetingNoteId().substring(3))+1)).length());
			for (int i=0;i<idKeyLen;i++) {
				idKeyStr += "0";
			}
			return "MTN" + idKeyStr + (Integer.valueOf(meetingNoteMapper.getLastMeetingNoteId().substring(3))+1);
		}
	}
	
	public String getHtNextKey() {
		if (hashTagMapper.getLastHashTagId() == null) {
			return "HT00001";
		}else {
			String idKeyStr = "";
			int idKeyLen = (5 - String.valueOf((Integer.valueOf(hashTagMapper.getLastHashTagId().substring(2))+1)).length());
			for (int i=0;i<idKeyLen;i++) {
				idKeyStr += "0";
			}
			return "HT" + idKeyStr + (Integer.valueOf(hashTagMapper.getLastHashTagId().substring(2))+1);
		}
	}
	
	public String getNhNextKey() {
		if (meetingNoteMapper.getLastNoteHeadId() == null) {
			return "NH00001";
		}else {
			String idKeyStr = "";
			int idKeyLen = (5 - String.valueOf((Integer.valueOf(meetingNoteMapper.getLastNoteHeadId().substring(2))+1)).length());
			for (int i=0;i<idKeyLen;i++) {
				idKeyStr += "0";
			}
			return "NH" + idKeyStr + (Integer.valueOf(meetingNoteMapper.getLastNoteHeadId().substring(2))+1);
		}
	}
	
	public String getHeadMbrId() {
		if (meetingNoteMapper.getLastNoteHeadMmbId() == null) {
			return "HM00001";
		}else {
			String idKeyStr = "";
			int idKeyLen = (5 - String.valueOf((Integer.valueOf(meetingNoteMapper.getLastNoteHeadMmbId().substring(2))+1)).length());
			for (int i=0;i<idKeyLen;i++) {
				idKeyStr += "0";
			}
			return "HM" + idKeyStr + (Integer.valueOf(meetingNoteMapper.getLastNoteHeadMmbId().substring(2))+1);
		}
	}
	

}

