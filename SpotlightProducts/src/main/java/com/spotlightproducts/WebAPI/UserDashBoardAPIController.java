package com.spotlightproducts.WebAPI;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
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
	public ResponseEntity<JSONResponse<String>> ChangeUserPassword(@RequestBody User user, ModelMap model, HttpServletRequest request){
		JSONResponse<String> JsonResponse = new JSONResponse<String>();
		HttpSession session = request.getSession();
//		System.out.println("Reached Here************************************");
////		System.out.println("RequestEntity.getBody():"+requestEntity.getBody());
//		System.out.println("Email: " + session.getAttribute("email"));
//		System.out.println("Password: " + user.getPassword());
//		System.out.println("Retypepassword: " + user.getReTypePassword());
//		System.out.println("New Password:" + user.getNewPassword());
		
		user.setEmail((String)session.getAttribute("email"));
		
		DatabaseResponse dbresponse = user.changeUserPasswordDao();
		//DatabaseResponse dbresponse = new DatabaseResponse();
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		return new ResponseEntity<JSONResponse<String>>(JsonResponse, HttpStatus.OK);
	}
}