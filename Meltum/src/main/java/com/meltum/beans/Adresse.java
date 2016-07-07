package com.meltum.beans;

public class Adresse {
	
	private String fullAdress;
	private String street_number;
	private String street;
	private String city;
	private String postalcode;
	private String state;
	private String country;

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getPostalcode() {
		return postalcode;
	}

	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}

	/**
	 * @return the street_number
	 */
	public String getStreet_number() {
		return street_number;
	}

	/**
	 * @param street_number the street_number to set
	 */
	public void setStreet_number(String street_number) {
		this.street_number = street_number;
	}

	/**
	 * @return the country
	 */
	public String getCountry() {
		return country;
	}

	/**
	 * @param country the country to set
	 */
	public void setCountry(String country) {
		this.country = country;
	}

	/**
	 * @return the fullAdress
	 */
	public String getFullAdress() {
		return fullAdress;
	}

	/**
	 * @param fullAdress the fullAdress to set
	 */
	public void setFullAdress(String fullAdress) {
		this.fullAdress = fullAdress;
	}
	
	
}
