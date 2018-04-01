package com.ibm.service;

import java.util.List;
import java.util.Map;

import com.ibm.domain.MeetingNoteDomain;

public interface IntegSearchService {
	
	public List<Map<String, Object>> getIntegSearchResult(MeetingNoteDomain mtnDomain)throws Exception;

	
}
