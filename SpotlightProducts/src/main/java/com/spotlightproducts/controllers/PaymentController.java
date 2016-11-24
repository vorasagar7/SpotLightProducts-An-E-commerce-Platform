package com.spotlightproducts.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spotlightproducts.login.LoginService;

//Controller for Handling Payment Page
@Controller
public class PaymentController {

	@RequestMapping(value = "/PaymentPage", method = RequestMethod.GET)
	// @ResponseBody
	public String showPaymentIndexPage() {
		return "PaymentViews/Index";
	}
	
	@RequestMapping(value = "/PaymentAddressPage", method = RequestMethod.GET)
	// @ResponseBody
	public String showPaymentAddressPage() {
		return "PaymentViews/PaymentAddressPage";
	}
	
	@RequestMapping(value = "/PaymentCardPage", method = RequestMethod.GET)
	// @ResponseBody
	public String showPaymentCardPage() {
		return "PaymentViews/CardDetails";
	}
	
	@RequestMapping(value = "/ConfirmationPage", method = RequestMethod.GET)
	// @ResponseBody
	public String showConfirmationPage() {
		return "PaymentViews/ThankYouPage";
	}

}
