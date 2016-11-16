package com.spotlightproducts.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spotlightproducts.login.LoginService;

@Controller
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
			model.put("errorMessage", "Invlaid Login Credentials");
			return "login";
		}
		model.put("email", email);
		model.put("password", password);
		// System.out.println(name);
		return "welcome";

	}

}
