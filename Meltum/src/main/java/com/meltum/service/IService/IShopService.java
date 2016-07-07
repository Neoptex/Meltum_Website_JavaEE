package com.meltum.service.IService;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.json.JSONException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.meltum.beans.Shop;

public interface IShopService {

	List<Shop> getShops();

	ResponseEntity<String> createShop(Shop form) throws JsonGenerationException, JsonMappingException, JSONException, IOException;

	Shop updateShop(Shop form) throws JsonGenerationException, JsonMappingException, JSONException, IOException;

	Shop removeShop(Shop form);

	Shop getShopById(String id);

	void uploadImage(String id, List<MultipartFile> file);

}
