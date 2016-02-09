package com.meltum.controller;

import static com.meltum.common.WebConstant.MELTS;
import static com.meltum.common.WebConstant.MELTS_VIEW;
import static com.meltum.common.WebConstant.MELT_FORM;
import static com.meltum.common.WebConstant.REDIRECT_MELT_VIEW;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.meltum.model.forms.MeltForm;
import com.meltum.service.IService.IMeltService;

@Controller
@RequestMapping("/melts")
public class MeltsController {

	@Autowired
	private IMeltService meltService = null;

	@RequestMapping(method = RequestMethod.GET)
	public String displayMelts(Model model) {
		model.addAttribute(MELT_FORM, new MeltForm());
		model.addAttribute(MELTS, meltService.getMelts());
		return MELTS_VIEW;
	}

	@RequestMapping("/add")
	public String addMelt(@ModelAttribute MeltForm form, Model model) {
		meltService.createMelt(form);
		return REDIRECT_MELT_VIEW;
	}
	
	@RequestMapping("/remove")
	public String removeMelt(@ModelAttribute MeltForm form, Model model) {
		return REDIRECT_MELT_VIEW;
	}
	
	@RequestMapping("/edit")
	public String editMelt(@ModelAttribute MeltForm form, Model model) {
		return REDIRECT_MELT_VIEW;
	}
}
