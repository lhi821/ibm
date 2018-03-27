package com.ibm.service.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ibm.service.ApiService;

@Service
public class ApiServiceImpl implements ApiService{

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	@SuppressWarnings("rawtypes")
	public Map apiCallHttpPost(String url, Map param) throws Exception{
		logger.info("URL ::: " + url);
		Map resultMap = null;
		try {
			JSONObject json = new JSONObject();
			for (Object key : param.keySet()) {
				json.put(key.toString(), param.get(key));
			}
			String body = json.toString();
			logger.info("input ::: " + body);
			URL postUrl = new URL(url);
			HttpURLConnection connection = (HttpURLConnection) postUrl.openConnection();
			connection.setDoOutput(true);
			connection.setInstanceFollowRedirects(false);
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-Type", "application/json");
			OutputStream os =connection.getOutputStream();
			os.write(body.getBytes());
			BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String line = "";
			String output = "";
			while ((line = br.readLine()) != null) {
				output = output + line;
			}
			logger.info("output ::: " + output);
			resultMap = new ObjectMapper().readValue(output, Map.class) ;
			connection.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
		
}
