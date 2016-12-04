package com.spotlightproducts.WebAPI;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spotlightproducts.businesslibrary.CommonUtilities;
import com.spotlightproducts.businesslibrary.InventoryManagement;
import com.spotlightproducts.businesslibrary.UserPaymentDetails;
import com.spotlightproducts.dao.DatabaseResponse;
import com.spotlightproducts.dao.JSONResponse;
import com.spotlightproducts.dao.Product;
import com.spotlightproducts.dao.ReferenceData;

@RestController
public class InventoryManagementAPIController {
	
	@RequestMapping(value = "/GetSellerInventoryProducts", method = RequestMethod.GET)
	public ResponseEntity<JSONResponse<Product>> getAllSellerProducts(HttpServletRequest request){
	HttpSession session = request.getSession();
	String email = (String)session.getAttribute("email");
	System.out.println(email);
	int id = CommonUtilities.getUserId(email);
	JSONResponse<Product> JsonResponse = new JSONResponse<Product>(); 
	InventoryManagement sellerInvManagement = new InventoryManagement();
	System.out.println(id);
	DatabaseResponse<Product> dbresponse = sellerInvManagement.getApprovedSellerProducts(id);
	JsonResponse.setStatus(dbresponse.getStatus());
	JsonResponse.setMessage(dbresponse.getMessage());
	JsonResponse.setData(dbresponse.getData());
	return new ResponseEntity<JSONResponse<Product>>(JsonResponse, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/PostAddProduct", method = RequestMethod.POST)
	public ResponseEntity<JSONResponse<Product>> AddProductDetails(Product product, HttpServletRequest request){
	JSONResponse<Product> JsonResponse = new JSONResponse<Product>(); 
	InventoryManagement sellerInvManagement = new InventoryManagement();
	DatabaseResponse<Product> dbresponse = sellerInvManagement.addSellerProducts(product, request);
	JsonResponse.setStatus(dbresponse.getStatus());
	JsonResponse.setMessage(dbresponse.getMessage());
	JsonResponse.setData(dbresponse.getData());
	return new ResponseEntity<JSONResponse<Product>>(JsonResponse, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/ProductSellerModify", method = RequestMethod.POST)
	public ResponseEntity<JSONResponse<Product>> editProductDetails(@RequestBody List<Product> products, HttpServletRequest request){
		JSONResponse<Product> JsonResponse = new JSONResponse<Product>(); 
		InventoryManagement sellerInvManagement = new InventoryManagement();
		DatabaseResponse<Product> dbresponse = sellerInvManagement.editSellerProducts(products, request);
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		JsonResponse.setData(dbresponse.getData());
		return new ResponseEntity<JSONResponse<Product>>(JsonResponse, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/POSTRemoveProduct", method = RequestMethod.POST)
	public ResponseEntity<JSONResponse<String>> removeProduct(@RequestBody Product product, HttpServletRequest request){
		JSONResponse<String> JsonResponse = new JSONResponse<String>(); 
		InventoryManagement sellerInvManagement = new InventoryManagement();
		DatabaseResponse<String> dbresponse = sellerInvManagement.removeSellerProducts(product,request);
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		return new ResponseEntity<JSONResponse<String>>(JsonResponse, HttpStatus.OK);
	}

	@RequestMapping(value = "/GetInventoryManagementReferenceList", method = RequestMethod.GET)
	public ResponseEntity<JSONResponse<ReferenceData>> GetBrandCategoryReferenceData(){
		JSONResponse<ReferenceData> JsonResponse = new JSONResponse<ReferenceData>(); 
		InventoryManagement sellerInvManagement = new InventoryManagement();
		DatabaseResponse<ReferenceData> dbresponse = sellerInvManagement.getBrandCategoryItems();
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		JsonResponse.setData(dbresponse.getData());
		return new ResponseEntity<JSONResponse<ReferenceData>>(JsonResponse, HttpStatus.OK);
	}
}
