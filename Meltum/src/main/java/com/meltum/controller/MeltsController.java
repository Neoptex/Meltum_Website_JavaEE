package com.meltum.controller;

import static com.meltum.common.WebConstant.*;

import java.io.IOException;
import java.util.List;

import javax.validation.Valid;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meltum.beans.Melt;
import com.meltum.service.IService.ICompanyService;
import com.meltum.service.IService.IMeltService;
import com.meltum.service.IService.IShopService;

@Controller
@RequestMapping("/MeltsManagement")
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
			return REDIRECT_MYCOMPANY_VIEW;
		}
		if (shopService.getShops().isEmpty()) {
			redir.addFlashAttribute("error", "Veuillez créer un shop afin de pouvoir accéder aux melts");
			return REDIRECT_SHOPS_MANAGEMENT_VIEW;
		}
		model.addAttribute(MELTS, meltService.getMelts());
		model.addAttribute(SHOPS, shopService.getShops());
		model.addAttribute(IMAGES_MELTS_LINK, API_URL + "images/melt/");
		return MELTS_MANAGEMENT_VIEW;
	}
	
	@RequestMapping("/{id}")
	public String displayMeltsByShop(Model model, RedirectAttributes redir, @PathVariable String id) {
		model.addAttribute(MELT_FORM, new Melt());
		model.addAttribute("idShop", id);
		model.addAttribute(MELTS, meltService.getMeltsByShop(id));
		model.addAttribute(SHOPS, shopService.getShops());
		model.addAttribute(IMAGES_MELTS_LINK, API_URL + "images/melt/");
		return MELTS_MANAGEMENT_VIEW;
	}

	/**
	 * Add a melt
	 * @param form
	 * @param model
	 * @return
	 */
	@RequestMapping(path = "/AddMelt", method = RequestMethod.POST)
	public String AddMelt(@Valid Melt form, Model model) {
		try {
			meltService.createMelt(form);
		} catch (JSONException | IOException e) {
			e.printStackTrace();
		}
		return REDIRECT_MELTS_MANAGEMENT_VIEW;
	}
	
	/**
	 * Edit a melt
	 * @param form
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/EditMelt/{id}")
	public String EditMelt(@ModelAttribute Melt form, @PathVariable String id, Model model) {
		try {
			meltService.updateMelt(form);
		} catch (JSONException | IOException e) {
			e.printStackTrace();
		}
		return REDIRECT_MELTS_MANAGEMENT_VIEW;
	}
	
	/**
	 * Remove a melt
	 * @param form
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/RemoveMelt/{id}")
	public String RemoveMelt(@ModelAttribute Melt form, @PathVariable String id, Model model) {
		meltService.removeMelt(form);
		return REDIRECT_MELTS_MANAGEMENT_VIEW;
	}
	
	/**
	 * Upload a image in melt
	 * @param form
	 * @param id
	 * @param model
	 * @param file
	 * @return
	 */
	@RequestMapping("/UploadMeltImage/{id}")
	public String UploadMeltImage(@ModelAttribute Melt form, @PathVariable String id, Model model, @RequestParam List<MultipartFile> file) {
		if (!file.get(0).isEmpty()) {
			meltService.uploadImage(id, file);
		}
		return REDIRECT_MELTS_MANAGEMENT_VIEW;
	}
}
