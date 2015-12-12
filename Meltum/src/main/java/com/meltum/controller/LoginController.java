package com.meltum.controller;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.meltum.beans.Quote;
import com.meltum.common.WebConstant;
import com.meltum.service.IService.IUserService;
 
@Controller
@RequestMapping(method = RequestMethod.GET)
public class LoginController { 
	
	@Autowired
	IUserService userService = null;
	
	@RequestMapping(method = RequestMethod.GET)
	public String displayHome() {
		Quote quote = userService.getTest();
		System.out.println("type = " + quote.getType());
		System.out.println("id of the code is " + quote.getValue().getId());
		System.out.println("the quote = " + quote.getValue().getQuote());
		return WebConstant.HOME_VIEW;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		return WebConstant.LOGIN_VIEW;
	}
	
	@RequestMapping(value = { "/inscription" }, method = RequestMethod.GET)
	public String inscriptionPage() {
		return WebConstant.INSCRIPTION_VIEW;
	}
}
