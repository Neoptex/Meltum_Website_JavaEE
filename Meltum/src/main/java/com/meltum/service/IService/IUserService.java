package com.meltum.service.IService;

import java.util.List;

import com.meltum.model.Quote;
import com.meltum.model.User;

public interface IUserService {

	//to remove
	Quote getTest();
	List<User> getAllUser();
	User getUser(String id);
	void createUser(User user);
	void updateUser(User user);
}