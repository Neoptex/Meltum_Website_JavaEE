package com.meltum.service.ServiceImpl;

import static com.meltum.common.WebConstant.URL_CREATE_MELT;
import static com.meltum.common.WebConstant.URL_DELETE_MELT;
import static com.meltum.common.WebConstant.URL_EDIT_MELT;
import static com.meltum.common.WebConstant.URL_GET_MELT;

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
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", form.getName());
		map.put("description", form.getDescription());
		ResponseEntity<String> response = api.executeRequest(URL_CREATE_MELT + companyService.getCompanyByUser().getId(), HttpMethod.POST, map);
		return melt;
	}

	public List<Melt> getMelts() {
		ApiRequest api = new ApiRequest();
		ObjectMapper mapper = new ObjectMapper();
		List<Melt> melts = new ArrayList<Melt>();
		Map<String, String> map = new HashMap<String, String>();
		ResponseEntity<String> response = api.executeRequest(URL_GET_MELT + companyService.getCompanyByUser().getId(), HttpMethod.GET, map);
		if (response != null) {
			try {
				melts = mapper.readValue(response.getBody(), mapper.getTypeFactory().constructCollectionType(List.class, Melt.class));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return melts;
	}

	public Melt updateMelt(MeltForm form) {
		ApiRequest api = new ApiRequest();
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", form.getName());
		map.put("description", form.getDescription());
		ResponseEntity<String> response = api.executeRequest(URL_EDIT_MELT + form.getId(), HttpMethod.PUT, map);
		return melt;
	}

	public Melt removeMelt(MeltForm form) {
		ApiRequest api = new ApiRequest();
		Map<String, String> map = new HashMap<String, String>();
		ResponseEntity<String> response = api.executeRequest(URL_DELETE_MELT + form.getId(), HttpMethod.DELETE, map);
		return melt;
	}
}
