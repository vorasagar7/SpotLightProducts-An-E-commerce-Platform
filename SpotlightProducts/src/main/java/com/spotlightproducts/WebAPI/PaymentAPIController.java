package com.spotlightproducts.WebAPI;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spotlightproducts.dao.JSONResponse;
import com.spotlightproducts.dao.User;

@RestController
public class PaymentAPIController{
	
	@RequestMapping(value = "/GetPaymentReferenceData", method = RequestMethod.GET)
	public ResponseEntity<JSONResponse<String>> AuthenticateUser(){
		JSONResponse JsonResponse = new JSONResponse(); 
		
		return new ResponseEntity<JSONResponse<String>>(JsonResponse, HttpStatus.OK);
	}
}