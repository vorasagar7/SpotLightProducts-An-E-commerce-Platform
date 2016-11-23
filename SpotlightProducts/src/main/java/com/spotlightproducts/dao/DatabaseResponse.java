package com.spotlightproducts.dao;

import java.util.List;

public class DatabaseResponse{
	private String status;
	private String message;
	
	public String getStatus(){
		return this.status;
	}
	public void setStatus(String status){
		this.status = status;
	}
	public String getMessage(){
		return this.message;
	}
	public void setMessage(String message){
		this.message = message;
	}
}