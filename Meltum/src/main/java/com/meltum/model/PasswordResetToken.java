package com.meltum.model;

import java.util.Date;

//@Entity
public class PasswordResetToken {
 
    //private static final int EXPIRATION = 60 * 24;
 
//    @Id
//    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
 
    private String token;
 
//    @OneToOne(targetEntity = User.class, fetch = FetchType.EAGER)
//    @JoinColumn(nullable = false, name = "user_id")
    private User user;
 
    private Date expiryDate;

	/* (non-Javadoc)
	 * @see com.meltum.dao.DaoImpl.IPasswordResetToken#getId()
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/* (non-Javadoc)
	 * @see com.meltum.dao.DaoImpl.IPasswordResetToken#getToken()
	 */
	public String getToken() {
		return token;
	}

	/**
	 * @param token the token to set
	 */
	public void setToken(String token) {
		this.token = token;
	}

	/* (non-Javadoc)
	 * @see com.meltum.dao.DaoImpl.IPasswordResetToken#getUser()
	 */
	public User getUser() {
		return user;
	}

	/**
	 * @param user the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}

	/* (non-Javadoc)
	 * @see com.meltum.dao.DaoImpl.IPasswordResetToken#getExpiryDate()
	 */
	public Date getExpiryDate() {
		return expiryDate;
	}

	/**
	 * @param expiryDate the expiryDate to set
	 */
	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}
    
    
}