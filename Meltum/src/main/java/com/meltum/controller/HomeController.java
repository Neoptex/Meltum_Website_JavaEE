package com.meltum.controller;
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.meltum.common.WebConstant;
 
@Controller
@RequestMapping("/home")
public class HomeController { 
	
	@RequestMapping(value = { "" }, method = RequestMethod.GET)
	public String display() {
		return WebConstant.HOME_VIEW;
	}
	
	@RequestMapping(value = { "/admin" }, method = RequestMethod.GET)
	public String protec() {
		return WebConstant.ADMIN_VIEW;
	}
	
}
