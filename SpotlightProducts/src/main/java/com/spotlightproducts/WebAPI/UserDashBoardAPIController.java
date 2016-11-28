package com.spotlightproducts.WebAPI;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spotlightproducts.dao.DatabaseResponse;
import com.spotlightproducts.dao.JSONResponse;
import com.spotlightproducts.dao.User;

@RestController
public class UserDashBoardAPIController{
	
	@RequestMapping(value = "/PostChangePassword", method = RequestMethod.POST)
	public ResponseEntity<JSONResponse<String>> ChangeUserPassword(RequestEntity requestEntity){
		JSONResponse<String> JsonResponse = new JSONResponse<String>();
		System.out.println("Reached Here************************************");
		System.out.println("RequestEntity.getBody():"+requestEntity.getBody());
		//DatabaseResponse dbresponse = user.ChangeUserPasswordDao();
		DatabaseResponse dbresponse = new DatabaseResponse();
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		return new ResponseEntity<JSONResponse<String>>(JsonResponse, HttpStatus.OK);
	}
}