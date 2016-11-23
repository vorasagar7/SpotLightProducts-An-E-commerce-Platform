package com.spotlightproducts.WebAPI;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spotlightproducts.dao.JSONResponse;
import com.spotlightproducts.dao.User;

@RestController
public class LoginAPIController{
	
	@RequestMapping(value = "/AuthenticateUser", method = RequestMethod.POST)
	public ResponseEntity<JSONResponse<String>> AuthenticateUser(@RequestBody User user){
		boolean isValidUser = user.validateUserDao();
		JSONResponse JsonResponse = new JSONResponse(); 
		if(isValidUser){
			JsonResponse.setStatus("Success");
		}
		else{
			JsonResponse.setStatus("Failure");
		}
		
		return new ResponseEntity<JSONResponse<String>>(JsonResponse, HttpStatus.OK);
	}
	
	@RequestMapping(value="/Test", method = RequestMethod.GET)
	public String TestData(){
		return "Test";
	}
	
}