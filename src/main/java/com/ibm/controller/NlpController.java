package com.ibm.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.logging.impl.SimpleLog;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.service.NlpService;

@Controller
@RequestMapping("/nlp")
public class NlpController {

	@Autowired
	NlpService nlpService;
	
	static Logger logger = Logger.getLogger(SimpleLog.class);
	
	@PostMapping("/getKeyword")
	@ResponseBody
	public Map<String, Object> getKeyword(String text) throws Exception{

		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<String> keyWordList = new ArrayList<>();
		try {
			keyWordList = nlpService.FindKeyWordList(text);
			resultMap.put("message", "success");
			resultMap.put("keyWordList", keyWordList);
		} catch (Exception e) {
			logger.debug(e);
			resultMap.put("message", "fail");
			resultMap.put("keyWordList", null);
		}
		
		return resultMap;
	}
	
}
