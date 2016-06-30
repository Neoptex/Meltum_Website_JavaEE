package com.meltum.beans;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Melt {
	String id;
	String name;
	String description;
	ImageObj image;
	Shop targetShop;
	String createdDate;
	String expiringDate;

	@JsonIgnore
	String idShopLink;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getExpiringDate() {
		return expiringDate;
	}

	public void setExpiringDate(String expiringDate) {
		this.expiringDate = expiringDate;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getIdShopLink() {
		return idShopLink;
	}

	public void setIdShopLink(String idShopLink) {
		this.idShopLink = idShopLink;
	}

	public Shop getTargetShop() {
		return targetShop;
	}

	public void setTargetShop(Shop targetShop) {
		this.targetShop = targetShop;
	}

	/**
	 * @return the image
	 */
	public ImageObj getImage() {
		return image;
	}

	/**
	 * @param image the image to set
	 */
	public void setImage(ImageObj image) {
		this.image = image;
	}


}
