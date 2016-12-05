package com.spotlightproducts.WebAPI;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spotlightproducts.businesslibrary.UserPaymentDetails;
import com.spotlightproducts.dao.DatabaseResponse;
import com.spotlightproducts.dao.JSONResponse;
import com.spotlightproducts.dao.ReferenceData;
import com.spotlightproducts.dao.User;
import com.spotlightproducts.dao.UserPaymentDetailsDao;

@RestController
public class PaymentAPIController{
	
	//RESTful API to get the reference data for payment
	@RequestMapping(value = "/GetPaymentReferenceData", method = RequestMethod.GET)
	public ResponseEntity<JSONResponse<ReferenceData>> GetPaymentReferenceData(){
		JSONResponse<ReferenceData> JsonResponse = new JSONResponse<ReferenceData>(); 
		UserPaymentDetails userPayment = new UserPaymentDetails();
		DatabaseResponse<ReferenceData> dbresponse = userPayment.getReferenceListItems();
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		JsonResponse.setData(dbresponse.getData());
		return new ResponseEntity<JSONResponse<ReferenceData>>(JsonResponse, HttpStatus.OK);
	}
	
	//RESTful API to save the user order
	@RequestMapping(value = "/SaveUserOrder", method = RequestMethod.POST)
	public ResponseEntity<JSONResponse<String>> RegisterUser(@RequestBody UserPaymentDetailsDao userPaymentDetails, HttpServletRequest request){
		JSONResponse<String> JsonResponse = new JSONResponse<String>();
		DatabaseResponse dbresponse = userPaymentDetails.saveUserPaymentDetailsDao(request);
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		return new ResponseEntity<JSONResponse<String>>(JsonResponse, HttpStatus.OK);
	}
	
}