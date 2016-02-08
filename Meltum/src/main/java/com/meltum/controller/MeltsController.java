package com.meltum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.meltum.common.WebConstant;
import com.meltum.model.forms.MeltForm;

@Controller
@RequestMapping("/melts")
public class MeltsController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String displayMelts(Model model) {
		model.addAttribute(WebConstant.MELT_FORM, new MeltForm());
		return WebConstant.MELTS_VIEW;
	}
	
	@RequestMapping("/add")
	public void addMelt(Model model) {
		
	}
}
