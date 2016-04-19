package com.meltum.service.ServiceImpl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meltum.api.ApiRequest;
import com.meltum.beans.Melt;
import com.meltum.model.forms.MeltForm;
import com.meltum.service.IService.ICompanyService;
import com.meltum.service.IService.IMeltService;

@Service
@Transactional
public class MeltServiceImpl implements IMeltService {

	@Autowired
	private ICompanyService companyService = null;

	private Melt melt = new Melt();

	@Override
	public Melt createMelt(MeltForm form) {
		ApiRequest api = new ApiRequest();
		String url = "company/" + companyService.getCompanyByUser().getId() + "/melt";
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", form.getName());
		map.put("description", form.getDescription());
		ResponseEntity<String> response = api.executeRequest(url, HttpMethod.POST, map);
		return melt;
	}

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

	public Melt updateMelt(MeltForm form) {
		ApiRequest api = new ApiRequest();
		String url = "melt/" + form.getId();
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", form.getName());
		map.put("description", form.getDescription());
		ResponseEntity<String> response = api.executeRequest(url, HttpMethod.PUT, map);
		return melt;
	}

	public Melt removeMelt(MeltForm form) {
		ApiRequest api = new ApiRequest();
		String url = "melt/" + form.getId();
		ResponseEntity<String> response = api.executeRequest(url, HttpMethod.DELETE, null);
		return melt;
	}
}
