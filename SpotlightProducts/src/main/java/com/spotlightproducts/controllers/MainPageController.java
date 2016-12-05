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
public class MainPageController {

	
	@RequestMapping(value = "/ChangePassword", method = RequestMethod.GET)
	// @ResponseBody
	public String showUserPassword() {
		return "PasswordChange/Index";
	}
}