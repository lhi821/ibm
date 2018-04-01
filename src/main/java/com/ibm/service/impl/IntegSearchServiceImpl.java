package com.ibm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.domain.MeetingNoteDomain;
import com.ibm.mapper.HashTagMapper;
import com.ibm.mapper.IntegSearchMapper;
import com.ibm.mapper.MemberMapper;
import com.ibm.service.IntegSearchService;

@Service
public class IntegSearchServiceImpl implements IntegSearchService{

	@Autowired
	IntegSearchMapper integSearchMapper;
	
	@Autowired
	HashTagMapper hashtagMapper;

	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public List<Map<String, Object>> getIntegSearchResult(MeetingNoteDomain mtnDomain) throws Exception {
		// TODO Auto-generated method stub
		String category = mtnDomain.getCategory();
		String inputVal = mtnDomain.getInputVal();
		String withDate = mtnDomain.getWithDate();
		
		List<Map<String, Object>> returnList;
		List<Map<String, Object>> getResult = new ArrayList<>();
		
		//날짜 있을 경우
		if(!withDate.equals("")) {
			//검색어 비어있을 때
			if(inputVal.equals("")) {
				//날짜만 조건 검색
				returnList = integSearchMapper.getIntegSearchResult_onlyDate(mtnDomain);
			}else {
				//날짜 + 카테고리/검색어 조건검색
				if(category.equals("all")) {			
					returnList = integSearchMapper.getIntegSearchResult_all_withDate(mtnDomain);
				}else if(category.equals("title")) {
					returnList = integSearchMapper.getIntegSearchResult_title_withDate(mtnDomain);
				}else if(category.equals("content")) {				
					returnList = integSearchMapper.getIntegSearchResult_content_withDate(mtnDomain);
				}else if(category.equals("regId")){
					returnList = integSearchMapper.getIntegSearchResult_regId_withDate(mtnDomain);
				} else {
					returnList = integSearchMapper.getIntegSearchResult_hashTag_wtihDate(mtnDomain);
				}
			}
			
		}
		//날짜 선택되지 않은 경우(카테고리/검색어 조건검색)
		else{
			if(category.equals("all")) {		
				returnList = integSearchMapper.getIntegSearchResult_all(mtnDomain);
			}else if(category.equals("title")) {
				returnList = integSearchMapper.getIntegSearchResult_title(mtnDomain);
			}else if(category.equals("content")) {
				returnList = integSearchMapper.getIntegSearchResult_content(mtnDomain);
			}else if(category.equals("regId")) {
				returnList = integSearchMapper.getIntegSearchResult_regId(mtnDomain);
			}else {
				returnList = integSearchMapper.getIntegSearchResult_hashTag(mtnDomain);
			
			}
		}
		
		
		//확장 for문 사용 -> 동기화문제 발생 (mapper에서 오는 list보다 for문에서 하나씩 뽑는  list의 index 값 뽑는게 더 빠를 수 있음 )--> 기존 for문으로 대체
		for(int i = 0; i < returnList.size(); ++i) {
			String hasTagStr = "";
			List<String> hashTagList = hashtagMapper.getHashTagStr(returnList.get(i).get("meetingNoteId"));
			
			for(String hashTag : hashTagList) {
				hasTagStr = hasTagStr + " <font )='main-hashTag cursor'>#"+hashTag+"</font>";
			}
			if (hasTagStr == "") {
				hasTagStr = "<font class='grayscale'>No hash Tag</font>";
			}
			
			
			returnList.get(i).put("hashTag", hasTagStr);
			
			returnList.get(i).put("meetingNoteNm", integSearchMapper.getMeetingNoteTypeNm(returnList.get(i).get("meetingTypeId").toString()));
			returnList.get(i).put("regMemberId", memberMapper.getMemberNm((String) returnList.get(i).get("modMemberId")));
		}
		
		
		
		return returnList;	
	}




	
	
}
