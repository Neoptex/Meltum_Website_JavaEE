package com.meltum.controller;
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.meltum.common.WebConstant;
 
@Controller
@RequestMapping("/")
public class NewsController { 
	
	@RequestMapping(method = RequestMethod.GET)
	public String displayNews() {
		return WebConstant.NEWS_VIEW;
	}
	
}