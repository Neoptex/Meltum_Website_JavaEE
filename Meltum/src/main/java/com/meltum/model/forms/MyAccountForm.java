package com.meltum.model.forms;

import com.meltum.beans.User;

public class MyAccountForm {
	
	private String socialName;
	private String siren;
	
	public MyAccountForm() {
		super();
	}
	
	public MyAccountForm(User user) {
		this.socialName = user.getSocialName();
		this.siren = user.getSiren();
	}
	
	/**
	 * @return the socialName
	 */
	public String getSocialName() {
		return socialName;
	}
	/**
	 * @param socialName the socialName to set
	 */
	public void setSocialName(String socialName) {
		this.socialName = socialName;
	}
	/**
	 * @return the siren
	 */
	public String getSiren() {
		return siren;
	}
	/**
	 * @param siren the siren to set
	 */
	public void setSiren(String siren) {
		this.siren = siren;
	}
	
	
}
