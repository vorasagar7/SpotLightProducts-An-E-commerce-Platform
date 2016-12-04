package com.spotlightproducts.WebAPI;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value = "/GetSellerInventoryProducts", method = RequestMethod.POST)
	public ResponseEntity<JSONResponse<Product>> getAllSellerProducts(HttpServletRequest request){
	HttpSession session = request.getSession();
	String email = (String)session.getAttribute("email");
	JSONResponse<Product> JsonResponse = new JSONResponse<Product>(); 
	InventoryManagement sellerInvManagement = new InventoryManagement();
	DatabaseResponse<Product> dbresponse = sellerInvManagement.addSellerProducts();
	JsonResponse.setStatus(dbresponse.getStatus());
	JsonResponse.setMessage(dbresponse.getMessage());
	JsonResponse.setData(dbresponse.getData());
	return new ResponseEntity<JSONResponse<Product>>(JsonResponse, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/PostAddProduct", method = RequestMethod.POST)
	public ResponseEntity<JSONResponse<Product>> AddProductDetails(List<Product> product){
	JSONResponse<Product> JsonResponse = new JSONResponse<Product>(); 
	InventoryManagement sellerInvManagement = new InventoryManagement();
	DatabaseResponse<Product> dbresponse = sellerInvManagement.addSellerProducts();
	JsonResponse.setStatus(dbresponse.getStatus());
	JsonResponse.setMessage(dbresponse.getMessage());
	JsonResponse.setData(dbresponse.getData());
	return new ResponseEntity<JSONResponse<Product>>(JsonResponse, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/POSTEditProduct", method = RequestMethod.POST)
	public ResponseEntity<JSONResponse<Product>> editProductDetails(List<Product> product){
		JSONResponse<Product> JsonResponse = new JSONResponse<Product>(); 
		InventoryManagement sellerInvManagement = new InventoryManagement();
		DatabaseResponse<Product> dbresponse = sellerInvManagement.editSellerProducts();
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		JsonResponse.setData(dbresponse.getData());
		return new ResponseEntity<JSONResponse<Product>>(JsonResponse, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/POSTRemoveProduct", method = RequestMethod.GET)
	public ResponseEntity<JSONResponse<Product>> removeProduct(Product product){
		JSONResponse<Product> JsonResponse = new JSONResponse<Product>(); 
		InventoryManagement sellerInvManagement = new InventoryManagement();
		DatabaseResponse<Product> dbresponse = sellerInvManagement.removeSellerProducts();
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		JsonResponse.setData(dbresponse.getData());
		return new ResponseEntity<JSONResponse<Product>>(JsonResponse, HttpStatus.OK);
	}

}
