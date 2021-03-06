package com.meltum.service.IService;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.json.JSONException;
import org.springframework.web.multipart.MultipartFile;

import com.meltum.beans.Melt;

public interface IMeltService {

	Melt createMelt(Melt form) throws JsonGenerationException, JsonMappingException, JSONException, IOException;

	List<Melt> getMelts() throws ParseException;

	Melt updateMelt(Melt form) throws JsonGenerationException, JsonMappingException, JSONException, IOException;

	Melt removeMelt(Melt form);

	List<Melt> getMeltsByShop(String id);
	
	void uploadImage(String id, List<MultipartFile> file);
	
	void ChangeStatus(String id); 

}
