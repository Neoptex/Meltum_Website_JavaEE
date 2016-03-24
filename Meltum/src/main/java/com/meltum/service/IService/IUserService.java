package com.meltum.service.IService;

import com.meltum.beans.User;
import com.meltum.model.forms.MyAccountForm;
import com.meltum.model.forms.RegisterForm;

public interface IUserService {

	User createUser(RegisterForm registerForm);
	
	User authUser(String email, String password);
	
	User getUser(String name);

	User updateUser(MyAccountForm myAccountForm);
	
	User getUserCurrent();
}