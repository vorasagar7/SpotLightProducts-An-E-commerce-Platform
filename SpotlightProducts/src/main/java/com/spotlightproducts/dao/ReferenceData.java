package com.spotlightproducts.dao;

import com.spotlightproducts.businesslibrary.UserPaymentDetails;

public class ReferenceData {

	private int id;
	private int objectId;
	private String name;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public int getObjectId() {
		return objectId;
	}
	public void setObjectId(int objectId) {
		this.objectId = objectId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	/*public DatabaseResponse<ReferenceData> getReferenceListItemsDao(){
		UserPaymentDetails userPayment = new UserPaymentDetails();
		return userPayment.getReferenceListItems();
		
	}*/
	
}
