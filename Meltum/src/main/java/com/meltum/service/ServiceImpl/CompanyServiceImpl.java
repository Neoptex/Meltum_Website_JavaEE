package com.meltum.service.ServiceImpl;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.meltum.api.ApiRequest;
import com.meltum.beans.Company;
import com.meltum.beans.Shop;
import com.meltum.model.forms.MyCompanyForm;
import com.meltum.service.IService.ICompanyService;
import com.meltum.service.IService.IUserService;

@Service
public class CompanyServiceImpl implements ICompanyService {
	
	@Autowired
	private IUserService userService = null;
	
	private ApiRequest api = new ApiRequest();
	private ObjectMapper mapper = new ObjectMapper();
	private Company company = new Company();
	
	@Override
	public Company createCompany(MyCompanyForm companyForm) throws JsonGenerationException, JsonMappingException, JSONException, IOException {
		api = new ApiRequest(userService.getUserCurrent().getToken(), userService.getUserCurrent().getId());
		String url = "pro/" + userService.getUserCurrent().getId() + "/company";
		JSONObject jsonObj = new JSONObject(mapper.writeValueAsString(companyForm));
		ResponseEntity<String> response = api.executeRequest(url, HttpMethod.POST, jsonObj);
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
	
	@Override
	public Company updateCompany(MyCompanyForm companyForm) throws JsonGenerationException, JsonMappingException, JSONException, IOException {
		api = new ApiRequest(userService.getUserCurrent().getToken(), userService.getUserCurrent().getId());
		String url = "pro/company/" + companyForm.getId();
		JSONObject jsonObj = new JSONObject(mapper.writeValueAsString(companyForm));
		ResponseEntity<String> response = api.executeRequest(url, HttpMethod.PUT, jsonObj);
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
	
	@Override
	public Company getCompanyById(MyCompanyForm companyForm) {
		api = new ApiRequest(userService.getUserCurrent().getToken(), userService.getUserCurrent().getId());
		String url = "pro/company/" + companyForm.getId();
		ResponseEntity<String> response = api.executeRequest(url, HttpMethod.GET, null);
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
	
	@Override
	public Company getCompanyByUser() {
		api = new ApiRequest(userService.getUserCurrent().getToken(), userService.getUserCurrent().getId());
		String url = "pro/" + userService.getUserCurrent().getId() + "/company";
		ResponseEntity<String> response = api.executeRequest(url, HttpMethod.GET, null);
		if (response.getBody() != null) {
			try {
				company = mapper.readValue(response.getBody(), Company.class);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return company;
		}
		return null;
	}
	
	@Override
	public List<Shop> getShopsFromCompany() {
		api = new ApiRequest(userService.getUserCurrent().getToken(), userService.getUserCurrent().getId());
		String url = "pro/company/" + userService.getCompanyFromCurrentUser().getId() + "/shop";
		ResponseEntity<String> response = api.executeRequest(url, HttpMethod.GET, null);
		List<Shop> shops = new LinkedList<Shop>();
		if (response.getBody() != null) {
			try {
				shops = mapper.readValue(response.getBody(), new TypeReference<List<Shop>>(){});
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (shops != null) {
				return shops;
			}
		}
		return null;
	}
}
