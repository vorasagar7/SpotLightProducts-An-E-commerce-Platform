package com.spotlightproducts.WebAPI;

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

import com.spotlightproducts.businesslibrary.AdminDashboard;
import com.spotlightproducts.businesslibrary.SellerDashboard;
import com.spotlightproducts.businesslibrary.UserDashboard;
import com.spotlightproducts.dao.DatabaseResponse;
import com.spotlightproducts.dao.JSONResponse;
import com.spotlightproducts.dao.Order;
import com.spotlightproducts.dao.Product;
import com.spotlightproducts.dao.Review;
import com.spotlightproducts.dao.User;

@RestController
public class AdminDashBoardAPIController{
	
	@RequestMapping(value = "/AdminStatisticsGet", method = RequestMethod.GET)
	public ResponseEntity<JSONResponse<Integer>> getAdminStatistics(@RequestBody User user, HttpServletRequest request){
		JSONResponse<Integer> JsonResponse = new JSONResponse<Integer>();
		HttpSession session = request.getSession();
		user.setEmail((String)session.getAttribute("email"));
		AdminDashboard sdashboad = new AdminDashboard();
		DatabaseResponse<Integer> dbresponse = sdashboad.getTotalUsers();
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		JsonResponse.setData(dbresponse.getData());
		return new ResponseEntity<JSONResponse<Integer>>(JsonResponse, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/ApproveSeller", method = RequestMethod.POST)
	public ResponseEntity<JSONResponse<Product>> approveSeller(@RequestBody User user, HttpServletRequest request){
		JSONResponse<Product> JsonResponse = new JSONResponse<Product>();
		HttpSession session = request.getSession();
		user.setEmail((String)session.getAttribute("email"));
		AdminDashboard dashboad = new AdminDashboard();
		//DatabaseResponse<Product> dbresponse = dashboad.getSellerLowStocks(user);
		//JsonResponse.setStatus(dbresponse.getStatus());
		//JsonResponse.setMessage(dbresponse.getMessage());
		//JsonResponse.setData(dbresponse.getData());
		return new ResponseEntity<JSONResponse<Product>>(JsonResponse, HttpStatus.OK);
	}
	@RequestMapping(value = "/RemoveSeller", method = RequestMethod.POST)
	public ResponseEntity<JSONResponse<Product>> removeSeller(@RequestBody User user, HttpServletRequest request){
		JSONResponse<Product> JsonResponse = new JSONResponse<Product>();
		HttpSession session = request.getSession();
		user.setEmail((String)session.getAttribute("email"));
		AdminDashboard dashboad = new AdminDashboard();
		//DatabaseResponse<Product> dbresponse = dashboad.getSellerLowStocks(user);
		//JsonResponse.setStatus(dbresponse.getStatus());
		//JsonResponse.setMessage(dbresponse.getMessage());
		//JsonResponse.setData(dbresponse.getData());
		return new ResponseEntity<JSONResponse<Product>>(JsonResponse, HttpStatus.OK);
	}
}