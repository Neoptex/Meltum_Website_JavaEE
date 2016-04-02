package com.meltum.model.forms;

import org.hibernate.validator.constraints.NotEmpty;

public class ChangePasswordForm {

	@NotEmpty(message = "Empty field not allowed")
	private String oldPassword;
	
	@NotEmpty(message = "Empty field not allowed")
	private String password;
	
	@NotEmpty(message = "Empty field not allowed")
	private String confirmPassword;
	
	public ChangePasswordForm() {
		super();
	}
	
	public ChangePasswordForm(ChangePasswordForm form) {
		this.oldPassword = form.oldPassword;
		this.password = form.password;
		this.confirmPassword = form.confirmPassword;
	}
	
	/**
	 * @return the oldPassword
	 */
	public String getOldPassword() {
		return oldPassword;
	}
	/**
	 * @param oldPassword the oldPassword to set
	 */
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
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
