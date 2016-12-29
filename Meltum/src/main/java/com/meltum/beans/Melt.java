package com.meltum.beans;

import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Melt {
	String id;
	String name;
	String description;
	Float price;
	Float priceInit;
	String nbrAvailable;
	Boolean timeAvailable;
	int minTime;
	int maxTime;
	String hourMinuteMinTime;
	String hourMinuteMaxTime;
	String DateMinTime;
	String DateMaxTime;
	List<ImageObj> images;
	List<String> tags;
	Shop targetShop;
	String createdDate;
	String expiringDate;
	@JsonIgnore
	String idShopLink;

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Float getPriceInit() {
		return priceInit;
	}

	public void setPriceInit(Float priceInit) {
		this.priceInit = priceInit;
	}

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
	public List<ImageObj> getImages() {
		return images;
	}

	/**
	 * @param image
	 *            the image to set
	 */
	public void setImages(List<ImageObj> images) {
		this.images = images;
	}

	public List<String> getTags() {
		return tags;
	}

	public void setTags(List<String> tags) {
		this.tags = tags;
	}

	public String getNbrAvailable() {
		return nbrAvailable;
	}

	public void setNbrAvailable(String nbrAvailable) {
		this.nbrAvailable = nbrAvailable;
	}

	public int getMinTime() {
		return minTime;
	}

	public void setMinTime(int minTime) {
		this.minTime = minTime;
	}

	public int getMaxTime() {
		return maxTime;
	}

	public void setMaxTime(int maxTime) {
		this.maxTime = maxTime;
	}

	public String getHourMinuteMinTime() {
		return hourMinuteMinTime;
	}

	public void setHourMinuteMinTime(String hourMinuteMinTime) {
		this.hourMinuteMinTime = hourMinuteMinTime;
	}

	public String getHourMinuteMaxTime() {
		return hourMinuteMaxTime;
	}

	public void setHourMinuteMaxTime(String hourMinuteMaxTime) {
		this.hourMinuteMaxTime = hourMinuteMaxTime;
	}

	public String getDateMinTime() {
		return DateMinTime;
	}

	public void setDateMinTime(String dateMinTime) {
		DateMinTime = dateMinTime;
	}

	public String getDateMaxTime() {
		return DateMaxTime;
	}

	public void setDateMaxTime(String dateMaxTime) {
		DateMaxTime = dateMaxTime;
	}

	public Boolean getTimeAvailable() {
		return timeAvailable;
	}

	public void setTimeAvailable(Boolean timeAvailable) {
		this.timeAvailable = timeAvailable;
	}
}
