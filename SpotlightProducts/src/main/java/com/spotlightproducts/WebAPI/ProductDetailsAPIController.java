package com.spotlightproducts.WebAPI;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spotlightproducts.dao.DatabaseResponse;
import com.spotlightproducts.dao.JSONResponse;
import com.spotlightproducts.dao.Product;

@RestController
public class ProductDetailsAPIController{
	
	@RequestMapping(value = "/GetProductById", method = RequestMethod.GET)
	public ResponseEntity<JSONResponse<Product>> GetProductById(@RequestParam(value="id", defaultValue="1") int productId){
		JSONResponse<Product> JsonResponse = new JSONResponse<Product>();
		Product product = new Product();
		product.setProductId(productId);
		DatabaseResponse<Product> dbresponse = product.getProductById();
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		JsonResponse.setData(dbresponse.getData());
		return new ResponseEntity<JSONResponse<Product>>(JsonResponse, HttpStatus.OK);
	}
}