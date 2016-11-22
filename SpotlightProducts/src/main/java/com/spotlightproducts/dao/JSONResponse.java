package com.spotlightproducts.dao;

import java.util.List;

public class JSONResponse<T>{
	private String status;
	private List<T> data;
	
	public String getStatus(){
		return this.status;
	}
	public void setStatus(String status){
		this.status = status;
	}
	public List<T> getData(){
		return this.data;
	}
	public void setData(List<T> data){
		this.data = data;
	}
}