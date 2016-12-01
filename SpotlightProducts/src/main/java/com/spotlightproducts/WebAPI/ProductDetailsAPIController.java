package com.spotlightproducts.WebAPI;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spotlightproducts.businesslibrary.ProductDetails;
import com.spotlightproducts.dao.DatabaseResponse;
import com.spotlightproducts.dao.JSONResponse;
import com.spotlightproducts.dao.Product;
import com.spotlightproducts.dao.Review;
import com.spotlightproducts.dao.User;

@RestController
public class ProductDetailsAPIController{
	
	@RequestMapping(value = "/GetProductById", method = RequestMethod.GET)
	public ResponseEntity<JSONResponse<Product>> GetProductById(@RequestParam(value="id", defaultValue="1") int productId){
		JSONResponse<Product> JsonResponse = new JSONResponse<Product>();
		ProductDetails productDetails = new ProductDetails();
		DatabaseResponse<Product> dbresponse = productDetails.getProductById(productId);
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		JsonResponse.setData(dbresponse.getData());
		return new ResponseEntity<JSONResponse<Product>>(JsonResponse, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/PostUserReview", method = RequestMethod.POST)
	public ResponseEntity<JSONResponse<String>> RegisterUser(@RequestBody Product product, HttpServletRequest request){
		JSONResponse<String> JsonResponse = new JSONResponse<String>();
		ProductDetails productDetails = new ProductDetails();
		DatabaseResponse dbresponse = productDetails.storeUserReview(product,request);
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		return new ResponseEntity<JSONResponse<String>>(JsonResponse, HttpStatus.OK);
	}
}