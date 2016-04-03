package com.meltum.controller;
 
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.meltum.common.WebConstant;
import com.meltum.model.forms.RegisterForm;
import com.meltum.service.IService.IUserService;
 
@Controller
public class MainController { 
	
	@Autowired
	IUserService userService = null;
	
	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String displayHome() {
		return WebConstant.NEWS_VIEW;
	}
	
	@RequestMapping(value = { "/inscription" }, method = RequestMethod.GET)
	public String inscriptionPage(Model model) {
		model.addAttribute(WebConstant.REGISTER_FORM, new RegisterForm());
		return WebConstant.INSCRIPTION_VIEW;
	}
	
	@RequestMapping(value = { "/saveUser" }, method = RequestMethod.POST)
	public String saveUser(@Valid RegisterForm registerForm, BindingResult bindingResult, Model model) {
		if (!registerForm.getConfirmPassword().isEmpty() && !registerForm.getPassword().equals(registerForm.getConfirmPassword())) {
			bindingResult.rejectValue("confirmPassword", "error.passwordMatching");
		}
		if (bindingResult.hasErrors()) {
			return WebConstant.INSCRIPTION_VIEW;
		}
		userService.createUser(registerForm);
		return WebConstant.REDIRECT_NEWS_VIEW;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error, Model model){

		if (error != null) {
			model.addAttribute("error", "Invalid username and password!");
		}
		return WebConstant.NEWS_VIEW;
	}
}
