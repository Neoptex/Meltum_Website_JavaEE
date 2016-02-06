package com.meltum.model.forms;

import com.meltum.beans.User;

public class RegisterForm {

	String email;
	String password;
	String confirmPassword;
	String socialName;
	String siren;
	
	public RegisterForm() {
		super();
	}
	
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the password
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
	/**
	 * @return the confirmPassword
	 */
	public String getConfirmPassword() {
		return confirmPassword;
	}
	/**
	 * @param confirmPassword the confirmPassword to set
	 */
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
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
