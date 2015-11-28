package com.meltum.controller;
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.meltum.common.WebConstant;
 
@Controller
@RequestMapping("/boutique")
public class ShopController { 
	
	@RequestMapping(method = RequestMethod.GET)
	public String displayShop() {
		return WebConstant.SHOP_VIEW;
	}
	
}