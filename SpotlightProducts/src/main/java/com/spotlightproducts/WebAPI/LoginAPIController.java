package com.spotlightproducts.WebAPI;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spotlightproducts.dao.DatabaseResponse;
import com.spotlightproducts.dao.JSONResponse;
import com.spotlightproducts.dao.User;

@RestController
//@SessionAttributes("email")	//this annotation is used for Session Handling in Spring MVC. The parameters i.e "email" will be stored in the model object till the end of the session OR till User logout OR till 30 minutes whichever happens first
public class LoginAPIController{
	
	@RequestMapping(value = "/AuthenticateUser", method = RequestMethod.POST)
	public ResponseEntity<JSONResponse<String>> AuthenticateUser(@RequestBody User user, ModelMap model, HttpServletRequest request){
		boolean isValidUser = user.validateUserDao();
		JSONResponse JsonResponse = new JSONResponse(); 
		if(isValidUser){
			HttpSession session = request.getSession();
			session.setAttribute("email", user.getEmail());
			JsonResponse.setStatus("Success");
		}
		else{
			JsonResponse.setStatus("Failure");
		}
		
		return new ResponseEntity<JSONResponse<String>>(JsonResponse, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/PostUserDetails", method = RequestMethod.POST)
	public ResponseEntity<JSONResponse<String>> RegisterUser(@RequestBody User user){
		JSONResponse<String> JsonResponse = new JSONResponse<String>();
		DatabaseResponse dbresponse = user.registerUserDao();
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		return new ResponseEntity<JSONResponse<String>>(JsonResponse, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/GetUserPassword", method = RequestMethod.POST)
	public JSONResponse<String> SendUserPassword(@RequestBody User user){
		JSONResponse<String> JsonResponse = new JSONResponse<String>();
		DatabaseResponse dbresponse = user.forgotPasswordDao();
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		return JsonResponse;
	}
	
}