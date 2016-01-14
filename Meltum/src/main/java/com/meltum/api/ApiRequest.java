package com.meltum.api;

import java.util.Map;

import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

public class ApiRequest {

	public String executeRequest(String function, Map<String, String> map) {
		RestTemplate rt = new RestTemplate();
		JSONObject request = new JSONObject();
		for (Map.Entry<String, String> entry : map.entrySet()) {
			request.put(entry.getKey(), entry.getValue());
		}
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> entity = new HttpEntity<String>(request.toString(), headers);
		
		ResponseEntity<String> loginResponse = rt
		  .exchange("http://185.83.218.101:8080/" + function, HttpMethod.POST, entity, String.class);
		if (loginResponse.getStatusCode() == HttpStatus.OK) {
			return loginResponse.getBody();
		} else if (loginResponse.getStatusCode() == HttpStatus.BAD_REQUEST) {
			return null;
		}
		return null;
	}
	
}
