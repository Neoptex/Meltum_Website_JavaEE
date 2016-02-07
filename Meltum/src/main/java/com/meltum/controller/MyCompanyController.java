package com.meltum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.meltum.common.WebConstant;
import com.meltum.model.forms.MyCompanyForm;

@Controller
@RequestMapping("/mon-entreprise")
public class MyCompanyController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String displayMyCompany(Model model) {
		model.addAttribute(WebConstant.MYCOMPANY_FORM, new MyCompanyForm());
		return WebConstant.MY_COMPANY_VIEW;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String saveCompany(@ModelAttribute MyCompanyForm form, Model model) {
		return WebConstant.MY_COMPANY_VIEW;
	}
}
