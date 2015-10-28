package com.meltum.controller;
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.meltum.common.WebConstant;
 
@Controller
public class LoginController { 
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String display() {
		return WebConstant.HOME_VIEW;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		return WebConstant.LOGIN_VIEW;
	}
	
	@RequestMapping(value = { "/admin" }, method = RequestMethod.GET)
	public String protec() {
		return WebConstant.ADMIN_VIEW;
	}
	
}
