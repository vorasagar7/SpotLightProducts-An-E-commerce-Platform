package com.spotlightproducts.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerSupportController{
	
	@RequestMapping(value = "/CustomerSupport", method = RequestMethod.GET)
	public String showCustomerSupportPage(){
		return "CustomerSupportViews/Index";
	}
	
}