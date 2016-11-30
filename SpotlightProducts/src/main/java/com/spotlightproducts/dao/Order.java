package com.spotlightproducts.dao;

import java.util.Date;

import com.spotlightproducts.businesslibrary.UserDashboard;

public class Order {
	
	private int orderID;
	private int modeOfPayment;
	private int buyerId;
	private String shippingAddress;
	private Date modifiedOn;
	private String modifiedBy;
	private int productId;
	private int sellerId;
	private int quantity;
	private double price;
	
	
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	/* Getter and Setters */
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public int getModeOfPayment() {
		return modeOfPayment;
	}
	public void setModeOfPayment(int modeOfPayment) {
		this.modeOfPayment = modeOfPayment;
	}
	public int getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(int buyerId) {
		this.buyerId = buyerId;
	}
	public String getShippingAddress() {
		return shippingAddress;
	}
	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
	public Date getModifiedOn() {
		return modifiedOn;
	}
	public void setModifiedOn(Date modifiedOn) {
		this.modifiedOn = modifiedOn;
	}
	public String getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}

}
