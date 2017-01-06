package com.meltum.common;

public interface WebConstant {

	// Views
	public static final String MYACCOUNT_VIEW = "myAccount";
	public static final String CHANGE_PASSWORD_VIEW = "changePassword";
	public static final String LOGIN_VIEW = "login";
	public static final String INSCRIPTION_VIEW = "inscription";
	public static final String HOME_VIEW = "home";
	public static final String MELTS_MANAGEMENT_VIEW = "MeltsManagement";
	public static final String SHOPS_MANAGEMENT_VIEW = "ShopsManagement";
	public static final String PAYMENT_ACCOUNT_MANAGEMENT_VIEW = "PaymentAccountManagementView";
	public static final String MY_COMPANY_SHOW_VIEW = "myCompanyShow";
	public static final String MY_COMPANY_EDIT_VIEW = "myCompanyEdit";
	public static final String ZONE_VIEW = "zone";
	public static final String INDEX_STATISTICS_VIEW = "IndexStatistics";

	// Forms
	public static final String REGISTER_FORM = "registerForm";
	public static final String MYACCOUNT_FORM = "myAccountForm";
	public static final String MYCOMPANY_FORM = "myCompanyForm";
	public static final String MELT_FORM = "meltForm";
	public static final String SHOP_FORM = "shopForm";
	public static final String CHANGE_PASSWORD_FORM = "changePasswordForm";
	public static final String BANK_ACCOUNT_VIEW_MODEL = "BankAccountViewModel";
	public static final String PAYPAL_ACCOUNT_VIEW_MODEL = "PaypalAccountViewModel";
	
	// Objects
	public static final String MELTS = "melts";
	public static final String SHOPS = "shops";
	public static final String SHOP_LIST = "shopList";
	public static final String SHOP_LIST_TO_JSON_STRING = "shopListJson";
	public static final String MELT_STAT_BY_SHOP = "meltStatByShop";
	public static final String MELT_STAT_BY_COMPANY = "meltStatByCompany";
	public static final String SHOP_STAT_BY_MELT = "shopStatByMelt";
	public static final String SHOP_STAT_BY_COMPANY = "shopStatByCompany";
	public static final String STATISTICS_ALL_SHOPS = "statisticsAllShops";

	// Redirect
	public static final String REDIRECT_HOME_VIEW = "redirect:/";
	public static final String REDIRECT_MYACCOUNT_VIEW = "redirect:/mon-compte";
	public static final String REDIRECT_MYCOMPANY_VIEW = "redirect:/mon-entreprise";
	public static final String REDIRECT_MELTS_MANAGEMENT_VIEW = "redirect:/" + MELTS_MANAGEMENT_VIEW;
	public static final String REDIRECT_SHOPS_MANAGEMENT_VIEW = "redirect:/" + SHOPS_MANAGEMENT_VIEW;
	
	// Miscellaneous
	public static final String API_URL = "http://185.83.218.101:8095/";
	//public static final String API_URL = "http://localhost:8080/meltumApi/";
	public static final String EMPTY_STRING = "";
	public static final String IMAGES_SHOPS_LINK = "imagesShopsLink";
	public static final String IMAGES_MELTS_LINK = "imagesMeltsLink";
}