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

public class SellerDashboard {
	
	public DatabaseResponse<Double> getSellerRevenue(User user) {
		DatabaseResponse response = new DatabaseResponse();
		List<Double> sellerRevenueList = new ArrayList<Double>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/spotlightproducts",
					"admin", "admin");
			CallableStatement cStmt = (CallableStatement) con.prepareCall("{call sp_get_Seller_Revenue(?)}");
			cStmt.setString(1, user.getEmail());
			boolean hadResults = cStmt.execute();
			double totalRevenue = 0.0;
			System.out.println("hadResults" + hadResults);
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					 totalRevenue = rs.getDouble(1);
					 sellerRevenueList.add(totalRevenue);
				}
				hadResults = cStmt.getMoreResults();
			}
			response.setStatus("Success");
			response.setMessage("Seller's Total Revenue");
			response.setData(sellerRevenueList);
			con.close();
			return response;
		} catch (Exception e) {
			System.out.println(e);
			
		}
		response.setStatus("Failure");
		response.setMessage("Technical Error");
		
		return response;

	}
	
	public DatabaseResponse<Product> getSellerLowStocks(User user) {
		DatabaseResponse response = new DatabaseResponse();
		List<Product> sellerProductList = new ArrayList<Product>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/spotlightproducts",
					"admin", "admin");
			CallableStatement cStmt = (CallableStatement) con.prepareCall("{call sp_get_All_Products_For_A_Seller_Below_Level(?)}");
			cStmt.setString(1, user.getEmail());
			boolean hadResults = cStmt.execute();
			System.out.println("hadResults" + hadResults);
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					
					Product product = new Product();
					product.setProductId(rs.getInt(1));
					product.setProductName(rs.getString(2));
					product.setModelId(rs.getString(3));
					product.setDescription(rs.getString(4));
					product.setPrice(rs.getDouble(5));
					product.setQuantity(rs.getInt(6));
					
					sellerProductList.add(product);	
				}
				hadResults = cStmt.getMoreResults();
			}
			response.setStatus("Success");
			response.setMessage("User Orders");
			response.setData(sellerProductList);
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