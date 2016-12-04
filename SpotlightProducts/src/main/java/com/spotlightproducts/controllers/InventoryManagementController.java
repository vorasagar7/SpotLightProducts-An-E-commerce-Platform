package com.spotlightproducts.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spotlightproducts.dao.User;

@Controller
public class InventoryManagementController{
	
	@RequestMapping(value = "/InventoryManagement", method = RequestMethod.GET)
	public String ShowInventoryManagementPage(HttpServletRequest request){
		User user = new User();
		HttpSession session = request.getSession();
		user.setEmail((String)session.getAttribute("email"));
		user.setUserId(3);
		if(user.getUserId() == 3){
			return "InventoryManagementViews/InventoryManagementSeller";
		}
		else{
			return "InventoryManagementViews/InventoryManagementAdmin";
		}
		
	}
}