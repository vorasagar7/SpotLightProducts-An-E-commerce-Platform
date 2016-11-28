package com.spotlightproducts.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InventoryManagementController{
	
	@RequestMapping(value = "/InventoryManagement", method = RequestMethod.GET)
	public String ShowInventoryManagementPage(){
		return "InventoryManagementViews/InventoryManagementSeller";
	}
}