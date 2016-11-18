package com.meltum.controller;

import static com.meltum.common.WebConstant.*;

import java.io.IOException;
import java.util.List;

import javax.validation.Valid;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meltum.beans.Melt;
import com.meltum.common.WebConstant;
import com.meltum.service.IService.ICompanyService;
import com.meltum.service.IService.IMeltService;
import com.meltum.service.IService.IShopService;

@Controller
@RequestMapping("/melts")
public class MeltsController {

	@Autowired
	private IMeltService meltService = null;
	
	@Autowired
	private ICompanyService companyService = null;
	
	@Autowired
	private IShopService shopService = null;

	@RequestMapping(method = RequestMethod.GET)
	public String displayMelts(Model model, RedirectAttributes redir) {
		model.addAttribute(MELT_FORM, new Melt());
		if (companyService.getCompanyByUser() == null) {
			redir.addFlashAttribute("error", "Veuillez créer une entreprise afin de pouvoir accéder aux melts");
			return WebConstant.REDIRECT_MYCOMPANY_VIEW;
		}
		if (shopService.getShops().isEmpty()) {
			redir.addFlashAttribute("error", "Veuillez créer un shop afin de pouvoir accéder aux melts");
			return WebConstant.REDIRECT_SHOP_VIEW;
		}
		model.addAttribute(MELTS, meltService.getMelts());
		model.addAttribute(SHOPS, shopService.getShops());
		model.addAttribute(WebConstant.IMAGES_MELTS_LINK, WebConstant.API_URL + "images/melt/");
		return MELTS_VIEW;
	}
	
	@RequestMapping("/{id}")
	public String displayMeltsByShop(Model model, RedirectAttributes redir, @PathVariable String id) {
		model.addAttribute(MELT_FORM, new Melt());
		model.addAttribute("idShop", id);
		model.addAttribute(MELTS, meltService.getMeltsByShop(id));
		model.addAttribute(SHOPS, shopService.getShops());
		model.addAttribute(WebConstant.IMAGES_MELTS_LINK, WebConstant.API_URL + "images/melt/");
		return MELTS_VIEW;
	}

	@RequestMapping(path = "/add", method = RequestMethod.POST)
	public String addMelt(@Valid Melt form,  BindingResult result, Model model) {
		
		if (result.hasErrors()) {
			model.addAttribute(MELT_FORM, form);
			model.addAttribute(MELTS, meltService.getMelts());
			model.addAttribute(SHOPS, shopService.getShops());
			model.addAttribute(WebConstant.IMAGES_MELTS_LINK, WebConstant.API_URL + "images/melt/");
			return MELTS_VIEW;
        }
		
		try {
			meltService.createMelt(form);
		} catch (JSONException | IOException e) {
			e.printStackTrace();
		}
		return REDIRECT_MELT_VIEW;
	}
	
	@RequestMapping("/remove/{id}")
	public String removeMelt(@ModelAttribute Melt form, @PathVariable String id, Model model) {
		meltService.removeMelt(form);
		return REDIRECT_MELT_VIEW;
	}
	
	@RequestMapping("/edit/{id}")
	public String editMelt(@ModelAttribute Melt form, @PathVariable String id, Model model) {
		try {
			meltService.updateMelt(form);
		} catch (JSONException | IOException e) {
			e.printStackTrace();
		}
		return REDIRECT_MELT_VIEW;
	}
	
	@RequestMapping("/upload/{id}")
	public String uploadImage(@ModelAttribute Melt form, @PathVariable String id, Model model, @RequestParam List<MultipartFile> file) {
		if (!file.get(0).isEmpty()) {
			meltService.uploadImage(id, file);
		}
		return REDIRECT_MELT_VIEW;
	}
}
