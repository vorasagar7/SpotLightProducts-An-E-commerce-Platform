package com.spotlightproducts.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spotlightproducts.login.LoginService;

@Controller
@SessionAttributes("email")	//this annotation is used for Session Handling in Spring MVC. The parameters i.e "email" will be stored in the model object till the end of the session OR till User logout OR till 30 minutes whichever happens first
public class LoginController {

	@Autowired
	LoginService service;

	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	// @ResponseBody
	public String showLoginIndexPage() {
		return "LoginViews/Index";
	}
	
	@RequestMapping(value = "/LoginPage", method = RequestMethod.GET)
	// @ResponseBody
	public String showLoginMainPage() {
		return "LoginViews/Login";
	}

		
	@RequestMapping(value = "/NewUserRegister", method = RequestMethod.GET)
	public String showRegisterPage() {
		return "LoginViews/NewUserRegister";
	}
	
	@RequestMapping(value = "/ForgotPassword", method = RequestMethod.GET)
	public String showForgotPasswordPage() {
		return "LoginViews/ForgotPassword";
	}
	
	@RequestMapping(value = "/homepage", method = RequestMethod.GET)
	public String showHomePage() {
		return "welcome";
	}
	

}
