package com.spotlightproducts.businesslibrary;

import com.spotlightproducts.dao.*;
import com.spotlightproducts.utilities.SpotLightConstants;

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
			
			Connection con = DatabaseConnection.getDatabaseConnection();
			CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_GET_SELLER_REVENUE);
			cStmt.setString(1, user.getEmail());
			boolean hadResults = cStmt.execute();
			double totalRevenue = 0.0;
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					 totalRevenue = rs.getDouble(1);
					 sellerRevenueList.add(totalRevenue);
				}
				hadResults = cStmt.getMoreResults();
			}
			response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
			response.setMessage(SpotLightConstants.CONSTANT_SELLER_TOTAL_REVENUE);
			response.setData(sellerRevenueList);
			con.close();
			return response;
		} catch (Exception e) {
			System.out.println(e);
			
		}
		response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
		response.setMessage(SpotLightConstants.CONSTANT_TECHNICAL_FAILURE);
		
		return response;

	}
	
	public DatabaseResponse<Product> getSellerLowStocks(User user) {
		DatabaseResponse response = new DatabaseResponse();
		List<Product> sellerProductList = new ArrayList<Product>();
		try {
			
			Connection con = DatabaseConnection.getDatabaseConnection();
			CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_GET_ALL_PRODUCT_FOR_A_SELLER_BELOW_LEVEL);
			cStmt.setString(1, user.getEmail());
			boolean hadResults = cStmt.execute();
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
			response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
			response.setMessage(SpotLightConstants.CONSTANT_USER_ORDER);
			response.setData(sellerProductList);
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