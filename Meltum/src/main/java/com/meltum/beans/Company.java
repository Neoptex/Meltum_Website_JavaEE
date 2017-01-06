package com.meltum.beans;

import java.util.Date;

public class Company {

	private String id;
	private String name;
	private String description;
	private Date createdDate;
	private ImageObj image;
	int usedNumber;
	float earnAmount;
	int usedAmount;

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the name to set
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
	 * @param description
	 *            the description to set
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
	 * @param id
	 *            the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the createdDate
	 */
	public Date getCreatedDate() {
		return createdDate;
	}

	/**
	 * @param createdDate
	 *            the createdDate to set
	 */
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
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

    public float getEarnAmount()
    {
        return earnAmount;
    }

    public void setEarnAmount(float earnAmount)
    {
        this.earnAmount = earnAmount;
    }

    public int getUsedAmount()
    {
        return usedAmount;
    }

    public void setUsedAmount(int usedAmount)
    {
        this.usedAmount = usedAmount;
    }
	
	
}
