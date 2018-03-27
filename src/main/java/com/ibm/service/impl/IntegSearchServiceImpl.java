package com.ibm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.domain.MeetingNoteDomain;
import com.ibm.mapper.IntegSearchMapper;
import com.ibm.service.IntegSearchService;

@Service
public class IntegSearchServiceImpl implements IntegSearchService{

	@Autowired
	IntegSearchMapper integSearchMapper;
	
	@Override
	public List<MeetingNoteDomain> getIntegSearchResult(MeetingNoteDomain mtnDomain) throws Exception {
		// TODO Auto-generated method stub
		String category = mtnDomain.getCategory();
		String inputVal = mtnDomain.getInputVal();
		String withDate = mtnDomain.getWithDate();
		
		//날짜 있을 경우
		if(!withDate.equals("")) {
			//검색어 비어있을 때
			if(inputVal.equals("")) {
				//날짜만 조건 검색
				return integSearchMapper.getIntegSearchResult_onlyDate(mtnDomain);
			}else {
				//날짜 + 카테고리/검색어 조건검색
				if(category.equals("all")) {			
					return integSearchMapper.getIntegSearchResult_all_withDate(mtnDomain);
				}else if(category.equals("title")) {
					return integSearchMapper.getIntegSearchResult_title_withDate(mtnDomain);
				}else if(category.equals("content")) {				
					return integSearchMapper.getIntegSearchResult_content_withDate(mtnDomain);
				}else {
					return integSearchMapper.getIntegSearchResult_regId_withDate(mtnDomain);
				}
			}	
		}
		//날짜 선택되지 않은 경우(카테고리/검색어 조건검색)
		else{
			if(category.equals("all")) {		
				return integSearchMapper.getIntegSearchResult_all(mtnDomain);
			}else if(category.equals("title")) {
				return integSearchMapper.getIntegSearchResult_title(mtnDomain);
			}else if(category.equals("content")) {
				return integSearchMapper.getIntegSearchResult_content(mtnDomain);
			}else {
				return integSearchMapper.getIntegSearchResult_regId(mtnDomain);
			}
		}
		
	}

	@Override
	public List<MeetingNoteDomain> getIntegSearchResult_date(MeetingNoteDomain mtnDomain) throws Exception {
		// TODO Auto-generated method stub
		return integSearchMapper.getIntegSearchResult_date(mtnDomain);
	}

	
	
}
