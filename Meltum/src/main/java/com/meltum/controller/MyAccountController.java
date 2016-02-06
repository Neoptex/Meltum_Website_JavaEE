package com.meltum.controller;
 
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.meltum.common.WebConstant;
import com.meltum.model.forms.MyAccountForm;
import com.meltum.service.IService.IUserService;
 
@Controller
@RequestMapping("/mon-compte")
public class MyAccountController { 
	
	@Autowired
	private IUserService userService = null;
	
	@RequestMapping(method = RequestMethod.GET)
	public String displayMyAccount(Model model, Principal principal) {
		model.addAttribute(WebConstant.MYACCOUNT_FORM, new MyAccountForm(userService.getUser(principal.getName())));
		return WebConstant.MYACCOUNT_VIEW;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String saveInformations(@ModelAttribute MyAccountForm myAccountForm, Model model, Principal principal) {
		userService.updateUser(myAccountForm, principal.getName());
		return WebConstant.REDIRECT_MYACCOUNT_VIEW;
	}
	
}
