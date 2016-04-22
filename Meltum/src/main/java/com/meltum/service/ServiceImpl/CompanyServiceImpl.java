package com.meltum.service.ServiceImpl;

import java.io.IOException;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.meltum.api.ApiRequest;
import com.meltum.beans.Company;
import com.meltum.model.forms.MyCompanyForm;
import com.meltum.service.IService.ICompanyService;
import com.meltum.service.IService.IUserService;

@Service
public class CompanyServiceImpl implements ICompanyService {
	
	@Autowired
	private IUserService userService = null;
	
	private ObjectMapper mapper = new ObjectMapper();
	private Company company = new Company();
	
	@Override
	public Company createCompany(MyCompanyForm companyForm) throws JsonGenerationException, JsonMappingException, JSONException, IOException {
		ApiRequest api = new ApiRequest();
		ObjectMapper mapper = new ObjectMapper();
		String url = "user/" + userService.getUserCurrent().getId() + "/company";
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
		ApiRequest api = new ApiRequest();
		ObjectMapper mapper = new ObjectMapper();
		String url = "company/" + companyForm.getId();
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
		ApiRequest api = new ApiRequest();
		String url = "company/" + companyForm.getId();
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
		ApiRequest api = new ApiRequest();
		String url = "user/" + userService.getUserCurrent().getId() + "/company";
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
}
