package com.spotlightproducts.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spotlightproducts.businesslibrary.CommonUtilities;
import com.spotlightproducts.dao.User;

@Controller
public class DashboardController{
	
	@RequestMapping(value = "/Dashboard", method = RequestMethod.GET)
	public String GetBuyerDashboardIndexPage(HttpServletRequest request){
		User user = new User();
		HttpSession session = request.getSession();
		user.setEmail((String)session.getAttribute("email"));
		user = CommonUtilities.getUserDataForLogin(user.getEmail());
		String SessionVar = (String)request.getSession().getAttribute("email");
		if(user.getRoleId() == 1){
			
			if(SessionVar == null)
			{
				return "LoginViews/Index";
			}
			else
			{
				return "DashboardViews/BuyerDashboard/Index";
			}
			
		}
		else if (user.getRoleId() == 2){
			if(SessionVar == null)
			{
				return "LoginViews/Index";
			}
			else
			{
				return "DashboardViews/SellerDashboard/Index";
			}
			
		}
		else {
			
			if(SessionVar == null)
			{
				return "LoginViews/Index";
			}
			else
			{
				return "DashboardViews/AdminDashboard/Index";
			}
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