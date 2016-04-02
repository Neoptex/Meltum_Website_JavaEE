package com.meltum.service.ServiceImpl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
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
	public Company createCompany(MyCompanyForm companyForm) {
		ApiRequest api = new ApiRequest();
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", companyForm.getSocialName());
		map.put("description", companyForm.getDescription());
		ResponseEntity<String> response = api.executeRequest("company/create/" + userService.getUserCurrent().getId(), HttpMethod.POST, map);
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
	public Company updateCompany(MyCompanyForm companyForm) {
		ApiRequest api = new ApiRequest();
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", companyForm.getSocialName());
		map.put("description", companyForm.getDescription());
		ResponseEntity<String> response = api.executeRequest("company/update/info/" + companyForm.getId(), HttpMethod.PUT, map);
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
		Map<String, String> map = new HashMap<String, String>();
		ResponseEntity<String> response = api.executeRequest("company/get/byId/" + companyForm.getId(), HttpMethod.GET, map);
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
		Map<String, String> map = new HashMap<String, String>();
		ResponseEntity<String> response = api.executeRequest("company/get/byUserId/" + userService.getUserCurrent().getId(), HttpMethod.GET, map);
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
