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

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	// @ResponseBody
	public String showLoginPage() {
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	// @ResponseBody
	public String handleLoginRequest(@RequestParam String email, @RequestParam String password, ModelMap model) {

		if (!service.validateUser(email, password)) {
			model.put("errorMessage", "Invalid Login Credentials");
			return "login";
		}
		model.put("email", email);
		model.put("password", password);
		// System.out.println(name);
		return "welcome";

	}

}
