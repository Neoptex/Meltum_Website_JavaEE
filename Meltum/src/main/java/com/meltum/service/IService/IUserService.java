package com.meltum.service.IService;

import java.util.List;

import com.meltum.beans.Quote;
import com.meltum.beans.User;

public interface IUserService {

	//to remove
	Quote getTest();
	List<User> getAllUser();
	User getUser(String id);
	void createUser(User user);
	void updateUser(User user);
}