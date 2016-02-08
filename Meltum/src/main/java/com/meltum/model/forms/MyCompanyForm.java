package com.meltum.model.forms;

import com.meltum.beans.Company;

public class MyCompanyForm {

	private String id;
	private String socialName;
	private String description;
	
	public MyCompanyForm() {
		this.id = "0";
	}
	
	public MyCompanyForm(Company company) {
		this.id = company.getId();
		this.socialName = company.getName();
		this.description = company.getDescription();
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
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	
	
}
