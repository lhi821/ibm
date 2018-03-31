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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.service.ApiService;

@Controller
@RequestMapping("/nlp")
public class NlpController {

	@Autowired
	ApiService apiService;
	
	static Logger logger = Logger.getLogger(SimpleLog.class);
	
	@PostMapping("/getKeyword")
	@ResponseBody
	@SuppressWarnings("rawtypes")
	public Map getKeyword(@RequestBody Map requestMap) throws Exception{
		return apiService.apiCallHttpPost("http://116.255.87.207:8080/nlp/getKeyword", requestMap);
	}
	
}
