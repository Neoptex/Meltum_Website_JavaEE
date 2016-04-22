package com.meltum.service.ServiceImpl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meltum.api.ApiRequest;
import com.meltum.beans.Melt;
import com.meltum.service.IService.ICompanyService;
import com.meltum.service.IService.IMeltService;

@Service
@Transactional
public class MeltServiceImpl implements IMeltService {

	@Autowired
	private ICompanyService companyService = null;

	private Melt melt = new Melt();

	public List<Melt> getMelts() {
		ApiRequest api = new ApiRequest();
		ObjectMapper mapper = new ObjectMapper();
		List<Melt> melts = new ArrayList<Melt>();
		String url = "company/" + companyService.getCompanyByUser().getId() + "/melt";
		if (companyService.getCompanyByUser() != null) {
			ResponseEntity<String> response = api.executeRequest(url, HttpMethod.GET, null);
			if (response.getBody() != null) {
				try {
					melts = mapper.readValue(response.getBody(), mapper.getTypeFactory().constructCollectionType(List.class, Melt.class));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			return melts;
		}
		return null;
	}

	@Override
	public Melt createMelt(Melt form) throws JsonGenerationException, JsonMappingException, JSONException, IOException {
		ApiRequest api = new ApiRequest();
		ObjectMapper mapper = new ObjectMapper();
		String url = "company/" + companyService.getCompanyByUser().getId() + "/melt";
		JSONObject jsonObj = new JSONObject(mapper.writeValueAsString(form));
		api.executeRequest(url, HttpMethod.POST, jsonObj);
		return melt;
	}

	public Melt updateMelt(Melt form) throws JsonGenerationException, JsonMappingException, JSONException, IOException {
		ApiRequest api = new ApiRequest();
		ObjectMapper mapper = new ObjectMapper();
		String url = "melt/" + form.getId();
		JSONObject jsonObj = new JSONObject(mapper.writeValueAsString(form));
		api.executeRequest(url, HttpMethod.PUT, jsonObj);
		return melt;
	}

	public Melt removeMelt(Melt form) {
		ApiRequest api = new ApiRequest();
		String url = "melt/" + form.getId();
		api.executeRequest(url, HttpMethod.DELETE, null);
		return melt;
	}
}
