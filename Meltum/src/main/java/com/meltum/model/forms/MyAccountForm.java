package com.meltum.model.forms;

import com.meltum.beans.User;

public class MyAccountForm {
	
	private String name;
	private String siren;
	
	public MyAccountForm() {
		super();
	}
	
	public MyAccountForm(User user) {
		this.name = user.getName();
		this.siren = user.getSiren();
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
