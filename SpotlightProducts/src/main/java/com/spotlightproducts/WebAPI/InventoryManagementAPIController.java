package com.spotlightproducts.WebAPI;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spotlightproducts.businesslibrary.InventoryManagement;
import com.spotlightproducts.businesslibrary.UserPaymentDetails;
import com.spotlightproducts.dao.DatabaseResponse;
import com.spotlightproducts.dao.JSONResponse;
import com.spotlightproducts.dao.Product;
import com.spotlightproducts.dao.ReferenceData;

@RestController
public class InventoryManagementAPIController {
	
	
	@RequestMapping(value = "/PostAddProduct", method = RequestMethod.POST)
	public ResponseEntity<JSONResponse<Product>> AddNewProducts(Product product){
		JSONResponse<Product> JsonResponse = new JSONResponse<Product>(); 
		InventoryManagement inventory = new InventoryManagement();
		//DatabaseResponse<Product> dbresponse = product.getSearchedProductDao();
		//JsonResponse.setStatus(dbresponse.getStatus());
		//JsonResponse.setMessage(dbresponse.getMessage());
		//JsonResponse.setData(dbresponse.getData());
		return new ResponseEntity<JSONResponse<Product>>(JsonResponse, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/POSTEditProduct", method = RequestMethod.GET)
	public ResponseEntity<JSONResponse<Product>> editProductDetails(Product product){
		JSONResponse<Product> JsonResponse = new JSONResponse<Product>();
		/*DatabaseResponse<Product> dbresponse = product.getProductById();
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		JsonResponse.setData(dbresponse.getData());*/
		return new ResponseEntity<JSONResponse<Product>>(JsonResponse, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/POSTRemoveProduct", method = RequestMethod.GET)
	public ResponseEntity<JSONResponse<Product>> removeProduct(Product product){
		JSONResponse<Product> JsonResponse = new JSONResponse<Product>();
		/*DatabaseResponse<Product> dbresponse = product.getProductById();
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		JsonResponse.setData(dbresponse.getData());*/
		return new ResponseEntity<JSONResponse<Product>>(JsonResponse, HttpStatus.OK);
	}

}
