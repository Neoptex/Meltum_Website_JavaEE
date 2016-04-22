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
import com.meltum.beans.Shop;
import com.meltum.service.IService.ICompanyService;
import com.meltum.service.IService.IShopService;

@Service
@Transactional
public class ShopServiceImpl implements IShopService {

	@Autowired
	private ICompanyService companyService = null;

	private ApiRequest api = new ApiRequest();
	private ObjectMapper mapper = new ObjectMapper();
	private Shop shop = new Shop();
	private String url = new String();
	private JSONObject jsonObj = new JSONObject();

	@Override
	public List<Shop> getShops() {
		List<Shop> shops = new ArrayList<Shop>();
		url = "company/" + companyService.getCompanyByUser().getId() + "/shop";
		if (companyService.getCompanyByUser() != null) {
			ResponseEntity<String> response = api.executeRequest(url, HttpMethod.GET, null);
			if (response.getBody() != null) {
				try {
					shops = mapper.readValue(response.getBody(), mapper.getTypeFactory().constructCollectionType(List.class, Shop.class));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			return shops;
		}
		return null;
	}

	@Override
	public  ResponseEntity<String> createShop(Shop form) throws JsonGenerationException, JsonMappingException, JSONException, IOException {
		url = "company/" + companyService.getCompanyByUser().getId() + "/shop";
		jsonObj = new JSONObject(mapper.writeValueAsString(form));
		return api.executeRequest(url, HttpMethod.POST, jsonObj);
	}

	@Override
	public Shop updateShop(Shop form) throws JsonGenerationException, JsonMappingException, JSONException, IOException {
		url = "shop/" + form.getId();
		jsonObj = new JSONObject(mapper.writeValueAsString(form));
		api.executeRequest(url, HttpMethod.PUT, jsonObj);
		return shop;
	}

	@Override
	public Shop removeShop(Shop form) {
		url = "shop/" + form.getId();
		api.executeRequest(url, HttpMethod.DELETE, null);
		return shop;
	}
}
