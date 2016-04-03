package com.meltum.controller;
 
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.meltum.common.WebConstant;
import com.meltum.model.forms.ChangePasswordForm;
import com.meltum.model.forms.MyAccountForm;
import com.meltum.service.IService.IUserService;
 
@Controller
@RequestMapping("/mon-compte")
public class MyAccountController { 
	
	@Autowired
	private IUserService userService = null;
	
	@RequestMapping(method = RequestMethod.GET)
	public String displayMyAccount(Model model) {
		model.addAttribute(WebConstant.MYACCOUNT_FORM, new MyAccountForm(userService.getUserCurrent()));
		return WebConstant.MYACCOUNT_VIEW;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String saveInformations(@ModelAttribute MyAccountForm myAccountForm, Model model) {
		return WebConstant.REDIRECT_MYACCOUNT_VIEW;
	}
	
	@RequestMapping(value = "/mot-de-passe", method = RequestMethod.GET)
	public String displayChangePassword(Model model) {
		model.addAttribute(WebConstant.CHANGE_PASSWORD_FORM, new ChangePasswordForm());
		return WebConstant.CHANGE_PASSWORD_VIEW;
	}
	
	@RequestMapping(value = "/savePassword", method = RequestMethod.POST)
	public String savePassword(@Valid ChangePasswordForm form, BindingResult bindingResult, Model model) {
		if (!form.getPassword().equals(form.getConfirmPassword())) {
			bindingResult.rejectValue("confirmPassword", "error.passwordMatching");
		}
		if (bindingResult.hasErrors()) {
			return WebConstant.CHANGE_PASSWORD_VIEW;
		}
		userService.updatePassword(form);
		return WebConstant.REDIRECT_MYACCOUNT_VIEW;
	}
}
