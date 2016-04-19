package com.meltum.service.ServiceImpl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meltum.api.ApiRequest;
import com.meltum.beans.User;
import com.meltum.model.forms.ChangePasswordForm;
import com.meltum.model.forms.RegisterForm;
import com.meltum.service.IService.IUserService;

@Service
@Transactional
public class UserServiceImpl implements IUserService {

	private ObjectMapper mapper = new ObjectMapper();
	private User user = new User();
	
	@Override
	public User createUser(RegisterForm registerForm) {
		ApiRequest api = new ApiRequest();
		Map<String, String> map = new HashMap<String, String>();
		map.put("mail", registerForm.getEmail());
		map.put("password", registerForm.getPassword());
		ResponseEntity<String> response = api.executeRequest("user", HttpMethod.POST, map);
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
	public User authUser(String email, String password) {
		ApiRequest api = new ApiRequest();
		String url = "user?mail=" + email + "&password=" + password;
		ResponseEntity<String> response = api.executeRequest(url, HttpMethod.GET, null);
		if (response != null) {
			try {
				this.user = mapper.readValue(response.getBody(), User.class);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return this.user;
		}
		return null;
	}
	
	@Override
	public User updatePassword(ChangePasswordForm passwordForm) {
		ApiRequest api = new ApiRequest();
		String url = "user/" + this.getUserCurrent().getId() + "/password";
		Map<String, String> map = new HashMap<String, String>();
		map.put("oldPassword", passwordForm.getOldPassword());
		map.put("password", passwordForm.getPassword());
		ResponseEntity<String> response = api.executeRequest(url, HttpMethod.PUT, map);
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
		ApiRequest api = new ApiRequest();
		String url = "user/" + this.getUserCurrent().getId();
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
}
