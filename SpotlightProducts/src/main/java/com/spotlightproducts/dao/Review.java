package com.spotlightproducts.dao;

import java.sql.Date;

import com.spotlightproducts.businesslibrary.LoginUser;
import com.spotlightproducts.businesslibrary.ProductDetails;

public class Review {

	private int reviewId;
	private String username;
	private String comment;
	private int rating;
	private Date modifiedOn;
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public Date getModifiedOn() {
		return modifiedOn;
	}
	public void setModifiedOn(Date modifiedOn) {
		this.modifiedOn = modifiedOn;
	}
	
}
