package com.meltum.service.ServiceImpl;

import java.io.IOException;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.HttpClientErrorException;

import com.meltum.api.ApiRequest;
import com.meltum.beans.Company;
import com.meltum.beans.User;
import com.meltum.model.forms.BankAccountForm;
import com.meltum.model.forms.ChangePasswordForm;
import com.meltum.model.forms.RegisterForm;
import com.meltum.service.IService.IUserService;

@Service
@Transactional
public class UserServiceImpl implements IUserService {

	private static final Logger logger = Logger.getLogger(UserServiceImpl.class);
	
	private ObjectMapper mapper = new ObjectMapper();
	
	private User user = new User();
	
	private static ApiRequest api = new ApiRequest();
	
	@Override
	public User createUser(RegisterForm registerForm) throws JsonGenerationException, JsonMappingException, JSONException, IOException {
		JSONObject jsonObj = new JSONObject(mapper.writeValueAsString(registerForm));
		ResponseEntity<String> response = api.executeRequest("pro", HttpMethod.POST, jsonObj);
		if (response != null) {
			try {
				this.user = mapper.readValue(response.getBody(), User.class);
			} catch (IOException e) {
				logger.error("Error in createUser", e);
			}
			return this.user;
		}
		return null;
	}

	@Override
	public User authUser(String email, String password) throws HttpClientErrorException {
		String url = "auth?mail=" + email + "&password=" + password;
		ResponseEntity<String> response = api.executeRequest(url, HttpMethod.GET, null);
		if (response != null) {
			try {
				this.user = mapper.readValue(response.getBody(), User.class);
				api = new ApiRequest(this.user.getToken(), this.user.getId());
			} catch (IOException e) {
				logger.error("Error in authUser", e);
			}
			return this.user;
		}
		return null;
	}
	
	@Override
	public User updatePassword(ChangePasswordForm passwordForm) throws JsonGenerationException, JsonMappingException, JSONException, IOException {
		String url = "pro/" + this.getUserCurrent().getId() + "/password";
		JSONObject jsonObj = new JSONObject(mapper.writeValueAsString(passwordForm));
		ResponseEntity<String> response = api.executeRequest(url, HttpMethod.PUT, jsonObj);
		if (response != null) {
			try {
				this.user = mapper.readValue(response.getBody(), User.class);
			} catch (IOException e) {
				logger.error("Error in updatePassword", e);
			}
			return this.user;
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
				logger.error("Error in getUser", e);
			}
			return user;
		}
		return null;
	}
	
	public User getUserCurrent() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			return (User) auth.getPrincipal();
		}
		return this.user;
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
				logger.error("Error in getCompanyFromCurrentUser", e);
			}
			return company;
		}
		return null;
	}

	@Override
	public ResponseEntity<String> addNewPaymentSource(BankAccountForm form) {
		String url = "/customer/payment/addSource";
		try {
			return api.executeRequest(url, HttpMethod.POST, new JSONObject(mapper.writeValueAsString(form)));
		} catch (HttpClientErrorException | JSONException | IOException e) {
			logger.error("Error in addNewPaymentSource", e);
		}
		return null;
	}
}
