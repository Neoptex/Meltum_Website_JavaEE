package com.meltum.controller;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.meltum.beans.User;
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
	public String saveUser(@ModelAttribute RegisterForm registerForm, Model model) {
		if (!registerForm.getPassword().equals(registerForm.getConfirmPassword())) {
			model.addAttribute("wrongPwd", "wrongPassword");
			return WebConstant.INSCRIPTION_VIEW;
		}
		User user = userService.createUser(registerForm);
		if (user == null) {
			System.out.println("cest null");
		} else {
			System.out.println(user.getPassword());
		}
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
