package com.meltum.service.ServiceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.meltum.beans.Quote;
import com.meltum.beans.User;
import com.meltum.service.IService.IUserService;

@Service
@Transactional
public class UserServiceImpl implements IUserService {

	/* (non-Javadoc)
	 * @see com.meltum.service.ServiceImpl.IUserService#getTest()
	 * to remove
	 */
	@Override
	public Quote getTest() {
		RestTemplate rt = new RestTemplate();
		Quote quote = rt.getForObject("http://gturnquist-quoters.cfapps.io/api/random", Quote.class);
		return quote;
	}

	@Override
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUser(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void createUser(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		
	}
	
	
}
