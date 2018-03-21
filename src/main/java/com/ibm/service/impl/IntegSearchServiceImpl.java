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

	@Override
	public List<MeetingNoteDomain> getIntegSearchResult_date(MeetingNoteDomain mtnDomain) throws Exception {
		// TODO Auto-generated method stub
		return integSearchMapper.getIntegSearchResult_date(mtnDomain);
	}
	
	
}
