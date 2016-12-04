package com.spotlightproducts.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spotlightproducts.dao.User;

@Controller
public class DashboardController{
	
	@RequestMapping(value = "/Dashboard", method = RequestMethod.GET)
	public String GetBuyerDashboardIndexPage(HttpServletRequest request){
		User user = new User();
		HttpSession session = request.getSession();
		user.setEmail((String)session.getAttribute("email"));
		user.setUserId(2);
		if(user.getUserId() == 1){
			System.out.println(user.getUserId());
			return "DashboardViews/BuyerDashboard/Index";
		}
		else if (user.getUserId() == 3){
			return "DashboardViews/SellerDashboard/Index";
		}
		else {
			return "DashboardViews/AdminDashboard/Index";
		}
	}
	
	@RequestMapping(value = "/BuyerHomePage", method = RequestMethod.GET)
	public String GetBuyerDashboardHomePage(){
		return "DashboardViews/BuyerDashboard/BuyerHomePage";
	}
	
	@RequestMapping(value = "/OrderHistoryPage", method = RequestMethod.GET)
	public String GetUserOrderHistory(){
		return "DashboardViews/BuyerDashboard/OrderHistoryPage";
	}
	
	@RequestMapping(value = "/UserReviewHistory", method = RequestMethod.GET)
	public String GetUserReviewHistory(){
		return "DashboardViews/BuyerDashboard/ReviewHistoryPage";
	}
	
	@RequestMapping(value = "SellerHomePage", method = RequestMethod.GET)
	public String GetSellerDashboardHomePage(){
		return "DashboardViews/SellerDashboard/SellerHomePage";
	}
	
	@RequestMapping(value = "AdminHomePage", method = RequestMethod.GET)
	public String GetAdminDashboardHomePage(){
		return "DashboardViews/AdminDashboard/AdminHomePage";
	}
	
	@RequestMapping(value = "AdminStatisticsPage", method = RequestMethod.GET)
	public String GetAdminStatisticsPage(){
		return "DashboardViews/AdminDashboard/AdminStatisticsPage";
	}
}