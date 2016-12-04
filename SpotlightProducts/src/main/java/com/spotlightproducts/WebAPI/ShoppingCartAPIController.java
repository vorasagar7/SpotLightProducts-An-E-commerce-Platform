package com.spotlightproducts.WebAPI;

import java.util.Arrays;
import java.util.List;

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

import com.spotlightproducts.businesslibrary.ShoppingCartDetails;
import com.spotlightproducts.dao.DatabaseResponse;
import com.spotlightproducts.dao.JSONResponse;
import com.spotlightproducts.dao.ShoppingCart;
import com.spotlightproducts.dao.User;

@RestController
public class ShoppingCartAPIController{
	
	@RequestMapping(value = "/ViewShoppingCart", method = RequestMethod.GET)
	public ResponseEntity<JSONResponse<ShoppingCart>> viewShoppingCart(HttpServletRequest request){
		JSONResponse<ShoppingCart> JsonResponse = new JSONResponse<ShoppingCart>();
		HttpSession session = request.getSession();
		ShoppingCartDetails shoppingCartDetails = new ShoppingCartDetails();
		DatabaseResponse<ShoppingCart> dbresponse =	shoppingCartDetails.getUserShoppingCart((String)session.getAttribute("email"));
		//DatabaseResponse dbresponse = new DatabaseResponse();
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		JsonResponse.setData(dbresponse.getData());
		return new ResponseEntity<JSONResponse<ShoppingCart>>(JsonResponse, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/GetUserId", method = RequestMethod.GET)
	public ResponseEntity<JSONResponse<String>> getUserId(HttpServletRequest request){
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		JSONResponse<String> JsonResponse = new JSONResponse<String>();
		JsonResponse.setStatus("Success");
		List<String> emailData = Arrays.asList(email);
		JsonResponse.setData(emailData);
		return new ResponseEntity<JSONResponse<String>>(JsonResponse, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/DeleteCartItem", method = RequestMethod.POST)
	public ResponseEntity<JSONResponse<String>> deleteUserCartItem(@RequestBody ShoppingCart cart){
		JSONResponse<String> JsonResponse = new JSONResponse<String>();
		ShoppingCartDetails shoppingCartDetails = new ShoppingCartDetails();
		DatabaseResponse dbresponse =	shoppingCartDetails.deleteFromShoppingCart(cart);
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		return new ResponseEntity<JSONResponse<String>>(JsonResponse, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/ModifyUserCart", method = RequestMethod.POST)
	public ResponseEntity<JSONResponse<String>> modifyUserCartItem(@RequestBody List<ShoppingCart> cart, HttpServletRequest request){
		JSONResponse<String> JsonResponse = new JSONResponse<String>();
		ShoppingCartDetails shoppingCartDetails = new ShoppingCartDetails();
		DatabaseResponse dbresponse =	shoppingCartDetails.modifyUserShoppingCart(cart,request);
		JsonResponse.setStatus(dbresponse.getStatus());
		return new ResponseEntity<JSONResponse<String>>(JsonResponse, HttpStatus.OK);
	}
}