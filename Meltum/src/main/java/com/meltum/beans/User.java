package com.meltum.beans;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class User {
	
	private String id;
	private String password;
	private String mail;
	private String socialName;
	private String siren;
	
	/* (non-Javadoc)
	 * @see com.meltum.dao.DaoImpl.IUser#getId()
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
	/* (non-Javadoc)
	 * @see com.meltum.dao.DaoImpl.IUser#getPassword()
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/* (non-Javadoc)
	 * @see com.meltum.dao.DaoImpl.IUser#getEmail()
	 */
	public String getMail() {
		return mail;
	}
	/**
	 * @param email the email to set
	 */
	public void setMail(String email) {
		this.mail = email;
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
