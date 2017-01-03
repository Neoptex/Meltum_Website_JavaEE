package com.meltum.beans;

import java.util.List;

public class Shop {
	private String id;
	private String name;
	private String description;
	private String phone;
	private Adresse adresse;
	private Coord loc;
	private String createdDate;
	private List<ImageObj> images;
	private List<Coord> pol;
	private int usedNumber;
	private List<MeltStatData> meltStatData;

	public Shop() {
		this.id = null;
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
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
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
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}
	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * @return the adresse
	 */
	public Adresse getAdresse() {
		return adresse;
	}
	/**
	 * @param adresse the adresse to set
	 */
	public void setAdresse(Adresse adresse) {
		this.adresse = adresse;
	}
	/**
	 * @return the createdDate
	 */
	public String getCreatedDate() {
		return createdDate;
	}
	/**
	 * @param createdDate the createdDate to set
	 */
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	/**
	 * @return the usedNumber
	 */
	public int getUsedNumber() {
		return usedNumber;
	}
	/**
	 * @param usedNumber the usedNumber to set
	 */
	public void setUsedNumber(int usedNumber) {
		this.usedNumber = usedNumber;
	}

	/**
	 * @return the loc
	 */
	public Coord getLoc() {
		return loc;
	}

	/**
	 * @param loc the loc to set
	 */
	public void setLoc(Coord loc) {
		this.loc = loc;
	}

	/**
	 * @return the pol
	 */
	public List<Coord> getPol() {
		return pol;
	}

	/**
	 * @param pol the pol to set
	 */
	public void setPol(List<Coord> pol) {
		this.pol = pol;
	}

	/**
	 * @return the images
	 */
	public List<ImageObj> getImages() {
		return images;
	}

	/**
	 * @param images the images to set
	 */
	public void setImages(List<ImageObj> images) {
		this.images = images;
	}

	/**
	 * @return the meltStatData
	 */
	public List<MeltStatData> getMeltStatData() {
		return meltStatData;
	}

	/**
	 * @param meltStatData the meltStatData to set
	 */
	public void setMeltStatData(List<MeltStatData> meltStatData) {
		this.meltStatData = meltStatData;
	}

}
