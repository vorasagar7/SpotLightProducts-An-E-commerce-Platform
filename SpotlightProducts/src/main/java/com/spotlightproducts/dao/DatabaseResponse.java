package com.spotlightproducts.dao;

import java.util.List;

public class DatabaseResponse<T>{
	private String status;
	private String message;
	private List<T> data;

	
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
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
}