package com.spotlightproducts.businesslibrary;

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
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/spotlightproducts",
					"admin", "admin");
			CallableStatement cStmt = (CallableStatement) con.prepareCall("{call sp_get_User_Orders(?)}");
			cStmt.setString(1, user.getEmail());
			boolean hadResults = cStmt.execute();
			System.out.println("hadResults" + hadResults);
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
			response.setStatus("Success");
			response.setMessage("User Orders");
			response.setData(userOrderList);
			con.close();
			return response;
		} catch (Exception e) {
			System.out.println(e);
		}
		response.setStatus("Failure");
		response.setMessage("Technical Error");
		return response;

	}
	
	public DatabaseResponse<Review> getUserReviews(User user) {
		DatabaseResponse response = new DatabaseResponse();
		List<Review> userReviewList = new ArrayList<Review>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/spotlightproducts",
					"admin", "admin");
			CallableStatement cStmt = (CallableStatement) con.prepareCall("{call sp_get_User_Orders(?)}");
			cStmt.setString(1, user.getEmail());
			boolean hadResults = cStmt.execute();
			System.out.println("hadResults" + hadResults);
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
			response.setStatus("Success");
			response.setMessage("User Orders");
			response.setData(userReviewList);
			con.close();
			return response;
		} catch (Exception e) {
			System.out.println(e);
		}
		response.setStatus("Failure");
		response.setMessage("Technical Error");
		return response;

	}
}