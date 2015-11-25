package com.meltum.controller;
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.meltum.common.WebConstant;
import com.meltum.model.forms.MyAccountForm;
 
@Controller
@RequestMapping("/mon-compte")
public class MyAccountController { 
	
	@RequestMapping(method = RequestMethod.GET)
	public String displayMyAccount() {
		return WebConstant.MYACCOUNT_VIEW;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String saveInformations(MyAccountForm form, Model model) {
		//put error message or success message here
		//all fields should be filled, email should be verified and also the password
		return WebConstant.MYACCOUNT_VIEW;
	}
	
}
