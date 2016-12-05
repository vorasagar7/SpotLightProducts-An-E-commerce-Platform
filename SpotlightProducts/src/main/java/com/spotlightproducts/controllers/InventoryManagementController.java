package com.spotlightproducts.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spotlightproducts.businesslibrary.CommonUtilities;
import com.spotlightproducts.dao.User;

@Controller
public class InventoryManagementController{
	
	@RequestMapping(value = "/InventoryManagement", method = RequestMethod.GET)
	public String ShowInventoryManagementPage(HttpServletRequest request){
		User user = new User();
		HttpSession session = request.getSession();
		String SessionVar = (String)session.getAttribute("email");
		user.setEmail(SessionVar);
		user = CommonUtilities.getUserDataForLogin(user.getEmail());
		if(SessionVar == null)
		{
			return "LoginViews/Index";
		}
		else if (user.getRoleId() == 2){
			return "InventoryManagementViews/Seller/InventoryManagementSeller";
		}
		else if (user.getRoleId() == 3){
			return "InventoryManagementViews/Admin/InventoryManagementAdmin";
		}
		else{
			return "welcome";
		}
		
	}
}