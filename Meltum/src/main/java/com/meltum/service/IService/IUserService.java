package com.meltum.service.IService;

import java.io.IOException;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.json.JSONException;

import com.meltum.beans.Company;
import com.meltum.beans.User;
import com.meltum.model.forms.ChangePasswordForm;
import com.meltum.model.forms.RegisterForm;

public interface IUserService {

	User createUser(RegisterForm registerForm) throws JsonGenerationException, JsonMappingException, JSONException, IOException;
	
	User authUser(String email, String password);
	
	User getUser(String name);
	
	User getUserCurrent();

	User updatePassword(ChangePasswordForm passwordForm) throws JsonGenerationException, JsonMappingException, JSONException, IOException;

	Company getCompanyFromCurrentUser();
}