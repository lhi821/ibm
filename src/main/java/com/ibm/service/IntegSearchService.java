package com.ibm.service;

import java.util.List;

import com.ibm.domain.MeetingNoteDomain;

public interface IntegSearchService {
	
	public List<MeetingNoteDomain> getIntegSearchResult(MeetingNoteDomain mtnDomain)throws Exception;

	public List<MeetingNoteDomain> getIntegSearchResult_date(MeetingNoteDomain mtnDomain) throws Exception;
	
}
