package com.meltum.controller;
 
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.meltum.beans.Produit;
import com.meltum.common.WebConstant;
 
@Controller
@RequestMapping("/boutique")
public class ShopController { 
	
	public List<Produit> getListProduit() {
		
//		RestTemplate rt = new RestTemplate();
//		Produit[] tmpProduits = rt.getForObject("Lien vers API", Produit[].class);		
//		List<Produit> produits = Arrays.asList(tmpProduits);
		
		Produit peugeot = new Produit();
		peugeot.setPicture("/resources/image/peugeot.jpg");
		peugeot.setPrice(8000);
		peugeot.setTitle("Peugeot");
		peugeot.setDescription("Ceci est une petite description sur une voiture peugeot");
		peugeot.setReviews(15);
		peugeot.setRating(5);
		
		Produit renault = new Produit();
		renault.setPicture("/resources/image/renault.png");
		renault.setPrice(8000);
		renault.setTitle("Renault");
		renault.setDescription("Ceci est une petite description sur une voiture renault");
		renault.setReviews(12);
		renault.setRating(4);
		
		Produit citroen = new Produit();
		citroen.setPicture("/resources/image/citroen.jpg");
		citroen.setPrice(7400);
		citroen.setTitle("Citroen");
		citroen.setDescription("Ceci est une petite description sur une voiture Citroen");
		citroen.setReviews(31);
		citroen.setRating(2);
		
		Produit seat = new Produit();
		seat.setPicture("/resources/image/seat.jpg");
		seat.setPrice(9600);
		seat.setTitle("Seat");
		seat.setDescription("Ceci est une petite description sur une voiture Seat");
		seat.setReviews(26);
		seat.setRating(3);
		
		Produit volkswagen = new Produit();
		volkswagen.setPicture("/resources/image/volkswagen.jpg");
		volkswagen.setPrice(13280);
		volkswagen.setTitle("Volkswagen");
		volkswagen.setDescription("Ceci est une petite description sur une voiture Volkswagen");
		volkswagen.setReviews(98);
		volkswagen.setRating(1);
		
		List<Produit> produits = new ArrayList<>();
		produits.add(peugeot);
		produits.add(renault);
		produits.add(citroen);
		produits.add(seat);
		produits.add(volkswagen);
		
		return produits;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String displayShop(Model model) {
		List<Produit> produits = getListProduit();
		model.addAttribute("produits", produits);
		return WebConstant.SHOP_VIEW;
	}
	
}