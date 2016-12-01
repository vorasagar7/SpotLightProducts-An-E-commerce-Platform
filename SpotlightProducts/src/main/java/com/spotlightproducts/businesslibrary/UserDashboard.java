package com.spotlightproducts.businesslibrary;

import com.spotlightproducts.SpotLightConstants;
import com.spotlightproducts.dao.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.Connection;

public class UserDashboard {
	
	public DatabaseResponse<Order> getUserOrders(User user) {
		DatabaseResponse response = new DatabaseResponse();
		List<Order> userOrderList = new ArrayList<Order>();
		try {
			
			Connection con = DatabaseConnection.getDatabaseConnection();
			CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_GET_USER_ORDERS);
			cStmt.setString(1, user.getEmail());
			boolean hadResults = cStmt.execute();
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					
					Order userOrder = new Order();
					userOrder.setBuyerId(rs.getInt(1));
					userOrder.setShippingAddress(rs.getString(2));
					userOrder.setOrderID(rs.getInt(3));
					userOrder.setProductId(rs.getInt(4));
					userOrder.setSellerId(rs.getInt(5));
					userOrder.setQuantity(rs.getInt(6));
					userOrder.setPrice(rs.getDouble(7));
					userOrder.setModeOfPayment(rs.getInt(8));
					userOrder.setModifiedOn(rs.getDate(9));
					userOrderList.add(userOrder);	
				}
				hadResults = cStmt.getMoreResults();
			}
			response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
			response.setMessage(SpotLightConstants.CONSTANT_USER_ORDER);
			response.setData(userOrderList);
			con.close();
			return response;
		} catch (Exception e) {
			System.out.println(e);
		}
		response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
		response.setMessage(SpotLightConstants.CONSTANT_TECHNICAL_FAILURE);
		return response;

	}
	
	public DatabaseResponse<Review> getUserReviews(User user) {
		DatabaseResponse response = new DatabaseResponse();
		List<Review> userReviewList = new ArrayList<Review>();
		try {
			
			Connection con = DatabaseConnection.getDatabaseConnection();
			CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_GET_USER_REVIEWS);
			cStmt.setString(1, user.getEmail());
			boolean hadResults = cStmt.execute();
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					
					Review userReview = new Review();
					userReview.setProductId(rs.getInt(2));
					userReview.setProductName(rs.getString(3));
					userReview.setModifiedOn(rs.getDate(4));
					userReview.setComment(rs.getString(5));
					userReview.setRating(rs.getInt(6));
					userReviewList.add(userReview);	
				}
				hadResults = cStmt.getMoreResults();
			}
			response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
			response.setMessage(SpotLightConstants.CONSTANT_USER_ORDER);
			response.setData(userReviewList);
			con.close();
			return response;
		} catch (Exception e) {
			System.out.println(e);
		}
		response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
		response.setMessage(SpotLightConstants.CONSTANT_TECHNICAL_FAILURE);
		return response;

	}
}