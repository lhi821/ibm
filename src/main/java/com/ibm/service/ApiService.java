package com.ibm.service;

import java.util.Map;

public interface ApiService {
	
	@SuppressWarnings("rawtypes")
	public Map apiCallHttpPost(String url, Map param) throws Exception;

}
