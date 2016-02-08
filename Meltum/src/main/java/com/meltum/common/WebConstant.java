package com.meltum.common;

public interface WebConstant {

	//	Views
	public static final String MYACCOUNT_VIEW = "admin";
	public static final String LOGIN_VIEW = "login";
	public static final String INSCRIPTION_VIEW = "inscription";
	public static final String NEWS_VIEW = "home";
	public static final String SHOP_VIEW = "/boutique";
	public static final String MY_COMPANY_SHOW_VIEW = "myCompanyShow";
	public static final String MY_COMPANY_EDIT_VIEW = "myCompanyEdit";

	//	Objects
	public static final String REGISTER_FORM = "registerForm";
	public static final String MYACCOUNT_FORM = "myAccountForm";
	public static final String MYCOMPANY_FORM = "myCompanyForm";
	
	// Redirect
	public static final String REDIRECT_NEWS_VIEW = "redirect:/";
	public static final String REDIRECT_MYACCOUNT_VIEW = "redirect:/mon-compte";
	public static final String REDIRECT_MYCOMPANY_VIEW = "redirect:/mon-entreprise";
}