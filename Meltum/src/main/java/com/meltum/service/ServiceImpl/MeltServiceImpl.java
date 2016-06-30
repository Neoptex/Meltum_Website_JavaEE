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
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.meltum.api.ApiRequest;
import com.meltum.beans.Melt;
import com.meltum.common.WebConstant;
import com.meltum.service.IService.ICompanyService;
import com.meltum.service.IService.IMeltService;
import com.meltum.service.IService.IUserService;
import com.meltum.utils.ImageUtils;

@Service
@Transactional
public class MeltServiceImpl implements IMeltService {

	@Autowired
	private ICompanyService companyService = null;
	@Autowired
	private IUserService userService = null;

	private ApiRequest api = new ApiRequest();
	private ObjectMapper mapper = new ObjectMapper();
	private Melt melt = new Melt();
	private String url = new String();
	private JSONObject jsonObj = new JSONObject();

	public List<Melt> getMelts() {
		api = new ApiRequest(userService.getUserCurrent().getToken(), userService.getUserCurrent().getId());
		List<Melt> melts = new ArrayList<Melt>();
		if (companyService.getCompanyByUser() != null) {
			url = "pro/company/" + companyService.getCompanyByUser().getId() + "/melt";
			ResponseEntity<String> response = api.executeRequest(url, HttpMethod.GET, null);
			if (response.getBody() != null) {
				try {
					melts = mapper.readValue(response.getBody(),
							mapper.getTypeFactory().constructCollectionType(List.class, Melt.class));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			return melts;
		}
		return null;
	}

	public List<Melt> getMeltsByShop(String idShop) {
		List<Melt> melts = new ArrayList<Melt>();
		url = "pro/shop/" + idShop + "/melt";
		ResponseEntity<String> response = api.executeRequest(url, HttpMethod.GET, null);
		if (response.getBody() != null) {
			try {
				melts = mapper.readValue(response.getBody(),
						mapper.getTypeFactory().constructCollectionType(List.class, Melt.class));
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			return null;
		}
		return melts;
	}

	@Override
	public Melt createMelt(Melt form) throws JsonGenerationException, JsonMappingException, JSONException, IOException {
		api = new ApiRequest(userService.getUserCurrent().getToken(), userService.getUserCurrent().getId());
		url = "pro/company/" + companyService.getCompanyByUser().getId() + "/melt";
		jsonObj = new JSONObject(mapper.writeValueAsString(form));
		ResponseEntity<String> response = api.executeRequest(url, HttpMethod.POST, jsonObj);
		melt = mapper.readValue(response.getBody(), Melt.class);
		url = "pro/shop/" + form.getIdShopLink() + "/melt/" + melt.getId();
		api.executeRequest(url, HttpMethod.PUT, new JSONObject());
		return melt;
	}

	public Melt updateMelt(Melt form) throws JsonGenerationException, JsonMappingException, JSONException, IOException {
		api = new ApiRequest(userService.getUserCurrent().getToken(), userService.getUserCurrent().getId());
		url = "pro/melt/" + form.getId();
		jsonObj = new JSONObject(mapper.writeValueAsString(form));
		api.executeRequest(url, HttpMethod.PUT, jsonObj);
		return melt;
	}

	public Melt removeMelt(Melt form) {
		api = new ApiRequest(userService.getUserCurrent().getToken(), userService.getUserCurrent().getId());
		url = "pro/melt/" + form.getId();
		api.executeRequest(url, HttpMethod.DELETE, null);
		return melt;
	}

	public void uploadImage(String id, MultipartFile file) {
		RestTemplate rt = new RestTemplate();
		LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
		map.add("filename", file.getOriginalFilename());
		map.add("contentType", file.getContentType());
		map.add("file", ImageUtils.scale(file, 565, 150));
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);

		HttpEntity<LinkedMultiValueMap<String, Object>> requestEntity = new HttpEntity<LinkedMultiValueMap<String, Object>>(
				map, headers);
		ResponseEntity<String> result = rt.exchange(WebConstant.API_URL + "pro/melt/" + id + "/image", HttpMethod.POST, requestEntity, String.class);
	}
}
