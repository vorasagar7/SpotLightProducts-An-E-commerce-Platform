package com.spotlightproducts.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerSupportController{
	
	@RequestMapping(value = "/CustomerSupport", method = RequestMethod.GET)
	public String showCustomerSupportPage(HttpServletRequest request){
		String SessionVar = (String)request.getSession().getAttribute("email");	
		if(SessionVar == null)
		{
			return "LoginViews/Index";
		}
		else
		{
			return "CustomerSupportViews/Index";
		}
	}
	
}