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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spotlightproducts.businesslibrary.UserDashboard;
import com.spotlightproducts.dao.DatabaseResponse;
import com.spotlightproducts.dao.JSONResponse;
import com.spotlightproducts.dao.Order;
import com.spotlightproducts.dao.Review;
import com.spotlightproducts.dao.User;

@RestController
public class UserDashBoardAPIController{
	
	@RequestMapping(value = "/PostChangePassword", method = RequestMethod.POST)
	public ResponseEntity<JSONResponse<String>> ChangeUserPassword(@RequestBody User user, ModelMap model, HttpServletRequest request){
		JSONResponse<String> JsonResponse = new JSONResponse<String>();
		HttpSession session = request.getSession();
		user.setEmail((String)session.getAttribute("email"));
		user.setUserId(5);
		DatabaseResponse dbresponse = user.changeUserPasswordDao();
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		return new ResponseEntity<JSONResponse<String>>(JsonResponse, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/UserOrderGET", method = RequestMethod.GET)
	public ResponseEntity<JSONResponse<Order>> userOrdersGet(@RequestParam(value="userId", defaultValue="1") int userId){
		JSONResponse<Order> JsonResponse = new JSONResponse<Order>();
		UserDashboard dashboad = new UserDashboard();
		DatabaseResponse<Order> dbresponse = dashboad.getUserOrders(userId);
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		JsonResponse.setData(dbresponse.getData());
		return new ResponseEntity<JSONResponse<Order>>(JsonResponse, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/UserReviewsGET", method = RequestMethod.GET)
	public ResponseEntity<JSONResponse<Review>> userReviewsGet(@RequestParam(value="userId", defaultValue="1") int userId){
		JSONResponse<Review> JsonResponse = new JSONResponse<Review>();
		UserDashboard dashboad = new UserDashboard();
		DatabaseResponse<Review> dbresponse = dashboad.getUserReviews(userId);
		JsonResponse.setStatus(dbresponse.getStatus());
		JsonResponse.setMessage(dbresponse.getMessage());
		JsonResponse.setData(dbresponse.getData());
		return new ResponseEntity<JSONResponse<Review>>(JsonResponse, HttpStatus.OK);
	}
}