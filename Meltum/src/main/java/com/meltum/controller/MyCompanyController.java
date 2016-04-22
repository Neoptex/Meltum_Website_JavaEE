package com.meltum.controller;

import java.io.IOException;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.meltum.beans.Company;
import com.meltum.common.WebConstant;
import com.meltum.model.forms.MyCompanyForm;
import com.meltum.service.IService.ICompanyService;

@Controller
@RequestMapping("/mon-entreprise")
public class MyCompanyController {
	
	@Autowired
	private ICompanyService companyService = null;
	
	@RequestMapping(method = RequestMethod.GET)
	public String displayMyCompany(Model model) {
		Company company = companyService.getCompanyByUser();
		if (company == null) {
			model.addAttribute(WebConstant.MYCOMPANY_FORM, new MyCompanyForm());
		} else {
			model.addAttribute(WebConstant.MYCOMPANY_FORM, new MyCompanyForm(company));
		}
		return WebConstant.MY_COMPANY_SHOW_VIEW;
	}
	
	@RequestMapping(value = {"/modifier", "/ajouter"}, method = RequestMethod.GET)
	public String editMyCompany(Model model) {
		Company company = companyService.getCompanyByUser();
		if (company == null) {
			model.addAttribute(WebConstant.MYCOMPANY_FORM, new MyCompanyForm());
		} else {
			model.addAttribute(WebConstant.MYCOMPANY_FORM, new MyCompanyForm(company));
		}
		return WebConstant.MY_COMPANY_EDIT_VIEW;
	}
	
	@RequestMapping(value = "/saveCompany/{id}", method = RequestMethod.POST)
	public String saveCompany(@ModelAttribute MyCompanyForm form, @PathVariable String id, Model model) {
		if (id.equals("0")) {
			try {
				companyService.createCompany(form);
			} catch (JSONException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				companyService.updateCompany(form);
			} catch (JSONException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return WebConstant.REDIRECT_MYCOMPANY_VIEW;
	}
}
