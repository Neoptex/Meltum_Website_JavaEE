package com.meltum.beans;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class User {

	private String id;
	private String password;
	private String mail;
	private String name;
	private String siren;
	private AuthToken tokenObj;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.meltum.dao.DaoImpl.IUser#getId()
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.meltum.dao.DaoImpl.IUser#getPassword()
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.meltum.dao.DaoImpl.IUser#getEmail()
	 */
	public String getMail() {
		return mail;
	}

	/**
	 * @param email
	 *            the email to set
	 */
	public void setMail(String email) {
		this.mail = email;
	}

	/**
	 * @return the siren
	 */
	public String getSiren() {
		return siren;
	}

	/**
	 * @param siren
	 *            the siren to set
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

	/**
	 * @return the tokenObj
	 */
	public AuthToken getTokenObj() {
		return tokenObj;
	}

	/**
	 * @param tokenObj the tokenObj to set
	 */
	public void setTokenObj(AuthToken tokenObj) {
		this.tokenObj = tokenObj;
	}

}
