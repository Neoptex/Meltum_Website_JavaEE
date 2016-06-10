package com.meltum.controller;
 
import java.io.IOException;

import javax.validation.Valid;

import org.json.JSONException;
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
		return WebConstant.HOME_VIEW;
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
		try {
			userService.createUser(registerForm);
		} catch (JSONException | IOException e) {
			e.printStackTrace();
		}
		return WebConstant.REDIRECT_HOME_VIEW;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error, Model model){
		if (error != null) {
			model.addAttribute("error", "Nom d'utilisateur ou mot de passe incorrect");
		}
		return WebConstant.HOME_VIEW;
	}
}
