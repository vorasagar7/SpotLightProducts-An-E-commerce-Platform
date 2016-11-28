package com.spotlightproducts.dao;

import java.sql.Date;
import java.util.List;

import javax.print.attribute.standard.DateTimeAtCompleted;

import com.spotlightproducts.businesslibrary.ProductDetails;

public class Product {
	private int productId;
	private int selledId;
	private String productName;
	private String modelId;
	private int brandId;
	private int categoryId;
	private String description;
	private int isApproved;
	private int isSpotlight;
	private int isDeleted;
	private String sellerName;
	private String searchQuery;
	private String brandName;
	private String categoryName;
	private double price;
	private int quantity;
	private List<Review> productReviews;
	private Date modifiedOn;

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getSelledId() {
		return selledId;
	}

	public void setSelledId(int selledId) {
		this.selledId = selledId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getModelId() {
		return modelId;
	}

	public void setModelId(String modelId) {
		this.modelId = modelId;
	}

	public int getBrandId() {
		return brandId;
	}

	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getIsApproved() {
		return isApproved;
	}

	public void setIsApproved(int isApproved) {
		this.isApproved = isApproved;
	}

	public int getIsSpotlight() {
		return isSpotlight;
	}

	public void setIsSpotlight(int isSpotlight) {
		this.isSpotlight = isSpotlight;
	}

	public int getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public String getSearchQuery() {
		return searchQuery;
	}

	public void setSearchQuery(String searchQuery) {
		this.searchQuery = searchQuery;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public Date getModifiedOn() {
		return modifiedOn;
	}

	public void setModifiedOn(Date modifiedOn) {
		this.modifiedOn = modifiedOn;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public List<Review> getProductReviews() {
		return productReviews;
	}

	public void setProductReviews(List<Review> productReviews) {
		this.productReviews = productReviews;
	}

}
