package com.meltum.api;

import static com.meltum.common.WebConstant.API_URL;
import static com.meltum.common.WebConstant.EMPTY_STRING;

import java.nio.charset.Charset;

import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

public class ApiRequest {
	
	HttpHeaders headers = new HttpHeaders();
	
	public ApiRequest(String token, String id) {
		headers.set("token", token);
		headers.set("userId", id);
	}
	
	public ApiRequest() {
		super();
	}
	
	public ResponseEntity<String> executeRequest(String function, HttpMethod methodType, JSONObject jsonObj) throws HttpClientErrorException {
		RestTemplate rt = new RestTemplate();
		rt.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));
		headers.setContentType(MediaType.APPLICATION_JSON);
		String request = jsonObj == null ? EMPTY_STRING : jsonObj.toString();
		HttpEntity<String> entity = new HttpEntity<String>(request, headers);
		ResponseEntity<String> loginResponse = rt.exchange(API_URL + function, methodType, entity, String.class);
		return loginResponse;
	}
}
