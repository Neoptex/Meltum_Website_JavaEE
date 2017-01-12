package com.meltum.service.ServiceImpl;

import java.io.IOException;
import java.nio.charset.Charset;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
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
import org.springframework.http.converter.StringHttpMessageConverter;
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
	
	private static final Logger logger = Logger.getLogger(MeltServiceImpl.class);

	@Autowired
	private ICompanyService companyService = null;
	@Autowired
	private IUserService userService = null;

	private ApiRequest api = new ApiRequest();
	
	private ObjectMapper mapper = new ObjectMapper();
	
	private Melt melt = new Melt();
	
	private String url;
	
	private JSONObject jsonObj = new JSONObject();

	public List<Melt> getMelts() throws ParseException {
		api = new ApiRequest(userService.getUserCurrent().getToken(), userService.getUserCurrent().getId());
		List<Melt> melts = new ArrayList<>();
		if (companyService.getCompanyByUser() != null) {
			url = "pro/company/" + companyService.getCompanyByUser().getId() + "/melt";
			ResponseEntity<String> response = api.executeRequest(url, HttpMethod.GET, null);
			if (response.getBody() != null) {
				try {
					melts = mapper.readValue(response.getBody(), mapper.getTypeFactory().constructCollectionType(List.class, Melt.class));
					for (Melt item : melts) {
						LocalTime minTimeTmp = LocalTime.of(item.getMinTime() / 60, item.getMinTime() % 60);
						LocalTime maxTimeTmp = LocalTime.of(item.getMaxTime() / 60, item.getMaxTime() % 60);
						SimpleDateFormat format = new SimpleDateFormat("HH:mm");
						Date parsedMin = format.parse(minTimeTmp.getHour() + ":" + minTimeTmp.getMinute());
						Date parsedMax = format.parse(maxTimeTmp.getHour() + ":" + maxTimeTmp.getMinute());
						item.setHourMinuteMinTime(DateFormat.getTimeInstance(DateFormat.SHORT).format(parsedMin));
						item.setHourMinuteMaxTime(DateFormat.getTimeInstance(DateFormat.SHORT).format(parsedMax));
					}
				} catch (IOException e) {
					logger.error("Error in getMelts", e);
				}
			}
			return melts;
		}
		return melts;
	}

	public List<Melt> getMeltsByShop(String idShop) {
		List<Melt> melts = new ArrayList<>();
		url = "pro/shop/" + idShop + "/melt";
		ResponseEntity<String> response = api.executeRequest(url, HttpMethod.GET, null);
		if (response.getBody() != null) {
			try {
				melts = mapper.readValue(response.getBody(), mapper.getTypeFactory().constructCollectionType(List.class, Melt.class));
			} catch (IOException e) {
				logger.error("Error in getMeltsByShop", e);
			}
		}
		return melts;
	}

	@Override
	public Melt createMelt(Melt form) throws JsonGenerationException, JsonMappingException, JSONException, IOException {
		form.setMinTime(Integer.parseInt(form.getDateMinTime().split(" : ")[0]) * 60 + Integer.parseInt(form.getDateMinTime().split(" : ")[1]));
		form.setMaxTime(Integer.parseInt(form.getDateMaxTime().split(" : ")[0]) * 60 + Integer.parseInt(form.getDateMaxTime().split(" : ")[1]));
		form.setTimeAvailable(true);
		form.setStatus(false);
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
		form.setMinTime(Integer.parseInt(form.getDateMinTime().split(" : ")[0]) * 60 + Integer.parseInt(form.getDateMinTime().split(" : ")[1]));
		form.setMaxTime(Integer.parseInt(form.getDateMaxTime().split(" : ")[0]) * 60 + Integer.parseInt(form.getDateMaxTime().split(" : ")[1]));
		form.setTimeAvailable(true);
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
			imageBase64.add(ImageUtils.scale(file, 565, 150));
		}
		map.add("filename", filename);
		map.add("contenttype", contentType);
		map.add("imageBase64", imageBase64);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		HttpEntity<LinkedMultiValueMap<String, List<String>>> requestEntity = new HttpEntity<>(map, headers);
		rt.exchange(WebConstant.API_URL + "images/melt/" + id + "/multiUpload", HttpMethod.POST, requestEntity, String.class);
	}
	
	public void ChangeStatus(String id) {
	    api = new ApiRequest(userService.getUserCurrent().getToken(), userService.getUserCurrent().getId());
        url = "/pro/melt/" + id + "/status";
        api.executeRequest(url, HttpMethod.PUT, null);
	}
}
