package com.meltum.service.ServiceImpl;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
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
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.meltum.api.ApiRequest;
import com.meltum.beans.Melt;
import com.meltum.beans.Shop;
import com.meltum.beans.Statistic;
import com.meltum.common.WebConstant;
import com.meltum.service.IService.ICompanyService;
import com.meltum.service.IService.IShopService;
import com.meltum.service.IService.IUserService;
import com.meltum.utils.ImageUtils;

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
					for (Shop item : shops) {
					    url = "pro/stats/shop/" + item.getId();
			            response = api.executeRequest(url, HttpMethod.GET, null);
					    item.setMeltStatData(mapper.readValue(response.getBody(), mapper.getTypeFactory().constructCollectionType(List.class, Statistic.class)));
					}
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
	
	public void uploadImage(String id, List<MultipartFile> files) {
		RestTemplate rt = new RestTemplate();
		rt.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));
		LinkedMultiValueMap<String, List<String>> map = new LinkedMultiValueMap<>();
		List<String> filename = new ArrayList<>();
		List<String> contentType = new ArrayList<>();
		List<String> imageBase64 = new ArrayList<>();
		for (MultipartFile file : files) {
			filename.add(file.getOriginalFilename());
			contentType.add(file.getContentType());
			imageBase64.add(ImageUtils.scale(file, 865, 350));
		}
		map.add("filename", filename);
		map.add("contenttype", contentType);
		map.add("imageBase64", imageBase64);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<LinkedMultiValueMap<String, List<String>>> requestEntity = new HttpEntity<LinkedMultiValueMap<String, List<String>>>(map, headers);
		rt.exchange(WebConstant.API_URL + "images/shop/" + id + "/multiUpload", HttpMethod.POST, requestEntity, String.class);
	}
	
	public List<Statistic> getStatisticAllShops() throws JsonParseException, JsonMappingException, IOException
	{
	    url = "pro/stats/company/" + companyService.getCompanyByUser().getId() + "/shop";
        ResponseEntity<String> response = api.executeRequest(url, HttpMethod.GET, null);
        return mapper.readValue(response.getBody(), mapper.getTypeFactory().constructCollectionType(List.class, Statistic.class));
	}
}
