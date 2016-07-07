package com.meltum.controller;

import static com.meltum.common.WebConstant.REDIRECT_SHOP_VIEW;
import static com.meltum.common.WebConstant.SHOPS;
import static com.meltum.common.WebConstant.SHOP_FORM;

import java.io.IOException;
import java.util.List;

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
import com.meltum.beans.Shop;
import com.meltum.common.WebConstant;
import com.meltum.service.IService.IShopService;

@Controller
@RequestMapping("/shops")
public class ShopController {

	@Autowired
	private IShopService shopService = null;
	
	@RequestMapping(method = RequestMethod.GET)
	public String displayShops(Model model, RedirectAttributes redir) {
		model.addAttribute(SHOP_FORM, new Shop());
		if (shopService.getShops() == null) {
			redir.addFlashAttribute("error", "Veuillez créer une entreprise afin de pouvoir accéder aux shops");
			return WebConstant.REDIRECT_MYCOMPANY_VIEW;
		}
		model.addAttribute(SHOPS, shopService.getShops());
		return null;
	}
	
	@RequestMapping("/save/{id}")
	public String editShop(@ModelAttribute Shop form, @PathVariable String id, @RequestParam String action , Model model) {
		try {
			if (action.equals("edit")) {
				shopService.updateShop(form);
			} else {
				form.setId(null);
				shopService.createShop(form);
			}
		} catch (JSONException | IOException e) {
			e.printStackTrace();
		}
		return REDIRECT_SHOP_VIEW;
	}
	
	@RequestMapping("/upload/{id}")
	public String uploadImage(@ModelAttribute Melt form, @PathVariable String id, Model model, @RequestParam List<MultipartFile> file) {
		shopService.uploadImage(id, file);
		return REDIRECT_SHOP_VIEW;
	}
	
	@RequestMapping("/remove/{id}")
	public String removeShop(@ModelAttribute Shop form, @PathVariable String id, Model model) {
		shopService.removeShop(form);
		return REDIRECT_SHOP_VIEW;
	}
}