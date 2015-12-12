package com.meltum.beans;

public class Type {
	
	private String id;
	private String name;
	
	/* (non-Javadoc)
	 * @see com.meltum.dao.DaoImpl.IType#getId()
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
	 * @see com.meltum.dao.DaoImpl.IType#getName()
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
	
	
}
