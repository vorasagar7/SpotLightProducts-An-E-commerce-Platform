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
	private String productName;
	private int productId;
	private String modelID;
	private String brandName;
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
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
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getModelID() {
		return modelID;
	}
	public void setModelID(String modelID) {
		this.modelID = modelID;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
}
