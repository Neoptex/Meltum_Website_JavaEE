package com.meltum.service.ServiceImpl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meltum.api.ApiRequest;
import com.meltum.beans.User;
import com.meltum.model.forms.MyAccountForm;
import com.meltum.model.forms.RegisterForm;
import com.meltum.service.IService.IUserService;

@Service
@Transactional
public class UserServiceImpl implements IUserService {

	private ObjectMapper mapper = new ObjectMapper();
	private static User user = new User();
	
	@Override
	public User createUser(RegisterForm registerForm) {
		ApiRequest api = new ApiRequest();
		Map<String, String> map = new HashMap<String, String>();
		map.put("mail", registerForm.getEmail());
		map.put("password", registerForm.getPassword());
		String response = api.executeRequest("user/create", HttpMethod.POST, map);
		if (response != null) {
			User user = new User();
			try {
				user = mapper.readValue(response, User.class);
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
		Map<String, String> map = new HashMap<String, String>();
		map.put("mail", email);
		map.put("password", password);
		String response = api.executeRequest("user/auth", HttpMethod.POST, map);
		if (response != null) {
			try {
				UserServiceImpl.user = mapper.readValue(response, User.class);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return UserServiceImpl.user;
		}
		return null;
	}

	@Override
	public User updateUser(MyAccountForm myAccountForm, String email) {
		ApiRequest api = new ApiRequest();
		Map<String, String> map = new HashMap<String, String>();
		map.put("socialName", myAccountForm.getSocialName());
		map.put("siren", myAccountForm.getSiren());
		String response = api.executeRequest("user/update/info/" + user.getId(), HttpMethod.POST, map);
		if (response != null) {
			User user = new User();
			try {
				user = mapper.readValue(response, User.class);
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
		Map<String, String> map = new HashMap<String, String>();
		String response = api.executeRequest("user/get/" + user.getId(), HttpMethod.GET, map);
		if (response != null) {
			try {
				UserServiceImpl.user = mapper.readValue(response, User.class);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return user;
		}
		return null;
	}
	
	
}
