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
import com.meltum.beans.Coord;
import com.meltum.beans.Shop;
import com.meltum.service.IService.ICompanyService;
import com.meltum.service.IService.IShopService;
import com.meltum.service.IService.IUserService;

@Service
@Transactional
public class ShopServiceImpl implements IShopService {

	@Autowired
	private ICompanyService companyService = null;
	@Autowired
	private IUserService userService = null;

	private ApiRequest api = new ApiRequest();
	private ObjectMapper mapper = new ObjectMapper();
	private Shop shop = new Shop();
	private String url = new String();
	private JSONObject jsonObj = new JSONObject();

	@Override
	public List<Shop> getShops() {
		api = new ApiRequest(userService.getUserCurrent().getToken(), userService.getUserCurrent().getId());
		List<Shop> shops = new ArrayList<Shop>();
		if (companyService.getCompanyByUser() != null) {
			url = "pro/company/" + companyService.getCompanyByUser().getId() + "/shop";
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
		api = new ApiRequest(userService.getUserCurrent().getToken(), userService.getUserCurrent().getId());
		url = "pro/company/" + companyService.getCompanyByUser().getId() + "/shop";
		jsonObj = new JSONObject(mapper.writeValueAsString(form));
		return api.executeRequest(url, HttpMethod.POST, jsonObj);
	}

	@Override
	public Shop updateShop(Shop shop) throws JsonGenerationException, JsonMappingException, JSONException, IOException {
		api = new ApiRequest(userService.getUserCurrent().getToken(), userService.getUserCurrent().getId());
		url = "pro/shop/" + shop.getId();
		Coord coord = new Coord();
		coord.setY(2.247266);
		coord.setX(48.917968);
		shop.setLoc(coord);
		jsonObj = new JSONObject(mapper.writeValueAsString(shop));
		api.executeRequest(url, HttpMethod.PUT, jsonObj);
		return shop;
	}

	@Override
	public Shop removeShop(Shop shop) {
		api = new ApiRequest(userService.getUserCurrent().getToken(), userService.getUserCurrent().getId());
		url = "pro/shop/" + shop.getId();
		api.executeRequest(url, HttpMethod.DELETE, null);
		return shop;
	}

	@Override
	public Shop getShopById(String id) {
		api = new ApiRequest(userService.getUserCurrent().getToken(), userService.getUserCurrent().getId());
		url = "pro/shop/" + id;
		ResponseEntity<String> response = api.executeRequest(url, HttpMethod.GET, null);
		if (response.getBody() != null) {
			try {
				shop = mapper.readValue(response.getBody(), Shop.class);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return shop;
	}
}
