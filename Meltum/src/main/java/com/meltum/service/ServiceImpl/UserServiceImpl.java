package com.meltum.service.ServiceImpl;

import java.io.IOException;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.HttpClientErrorException;

import com.meltum.api.ApiRequest;
import com.meltum.beans.Company;
import com.meltum.beans.User;
import com.meltum.model.forms.ChangePasswordForm;
import com.meltum.model.forms.RegisterForm;
import com.meltum.service.IService.IUserService;

@Service
@Transactional
public class UserServiceImpl implements IUserService {

	private ObjectMapper mapper = new ObjectMapper();
	private User user = new User();
	private static ApiRequest api = new ApiRequest();
	
	@Override
	public User createUser(RegisterForm registerForm) throws JsonGenerationException, JsonMappingException, JSONException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		JSONObject jsonObj = new JSONObject(mapper.writeValueAsString(registerForm));
		ResponseEntity<String> response = api.executeRequest("pro", HttpMethod.POST, jsonObj);
		if (response != null) {
			User user = new User();
			try {
				user = mapper.readValue(response.getBody(), User.class);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return user;
		}
		return null;
	}

	@Override
	public User authUser(String email, String password) throws HttpClientErrorException {
		String url = "pro?mail=" + email + "&password=" + password;
		ResponseEntity<String> response = api.executeRequest(url, HttpMethod.GET, null);
		if (response != null) {
			try {
				this.user = mapper.readValue(response.getBody(), User.class);
				api = new ApiRequest(this.user.getToken(), this.user.getId());
			} catch (IOException e) {
				e.printStackTrace();
			}
			return this.user;
		}
		return null;
	}
	
	@Override
	public User updatePassword(ChangePasswordForm passwordForm) throws JsonGenerationException, JsonMappingException, JSONException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		String url = "pro/" + this.getUserCurrent().getId() + "/password";
		JSONObject jsonObj = new JSONObject(mapper.writeValueAsString(passwordForm));
		ResponseEntity<String> response = api.executeRequest(url, HttpMethod.PUT, jsonObj);
		if (response != null) {
			User user = new User();
			try {
				user = mapper.readValue(response.getBody(), User.class);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return user;
		}
		return null;
	}
	
	@Override
	public User getUser(String mail) {
		String url = "pro/" + this.getUserCurrent().getId();
		ResponseEntity<String> response = api.executeRequest(url, HttpMethod.GET, null);
		if (response != null) {
			try {
				this.user = mapper.readValue(response.getBody(), User.class);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return user;
		}
		return null;
	}
	
	public User getUserCurrent() {
		return (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}

	@Override
	public Company getCompanyFromCurrentUser() {
		String url = "pro/" + this.getUserCurrent().getId() + "/company";
		ResponseEntity<String> response = api.executeRequest(url, HttpMethod.GET, null);
		Company company = new Company();
		if (response != null) {
			try {
				company = mapper.readValue(response.getBody(), Company.class);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return company;
		}
		return null;
	}
}
