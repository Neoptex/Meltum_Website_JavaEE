package com.meltum.model.forms;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.validator.constraints.NotEmpty;

public class RegisterForm {

	@NotEmpty
	String mail;
	
	@NotEmpty
	String password;
	
	@NotEmpty
	@JsonIgnore
	String confirmPassword;
	
	public RegisterForm() {
		super();
	}
	
	/**
	 * @return the email
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
	
}
