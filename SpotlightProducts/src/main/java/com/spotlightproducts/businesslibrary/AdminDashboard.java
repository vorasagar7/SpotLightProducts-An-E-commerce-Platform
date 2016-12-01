package com.spotlightproducts.businesslibrary;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.Connection;
import com.spotlightproducts.SpotLightConstants;
import com.spotlightproducts.dao.DatabaseResponse;
import com.spotlightproducts.dao.Product;
import com.spotlightproducts.dao.User;

public class AdminDashboard {
	
	public DatabaseResponse<Integer> getTotalUsers() {
		DatabaseResponse<Integer> response = new DatabaseResponse<Integer>();
		List<Integer> UserTotalCountList = new ArrayList<Integer>();
		try {
			int type_Of_Role = 1;
			
			Connection con = DatabaseConnection.getDatabaseConnection();
			CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_GET_TOTAL_COUNT_OF_USER);
			cStmt.setInt(1, type_Of_Role);
			boolean hadResults = cStmt.execute();
			int userCount = 0;
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					userCount = rs.getInt(1);
					 UserTotalCountList.add(userCount);
				}
				hadResults = cStmt.getMoreResults();
			}
			type_Of_Role = 2;
			cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_GET_TOTAL_COUNT_OF_USER);
			cStmt.setInt(1, type_Of_Role);
			hadResults = cStmt.execute();
			userCount = 0;
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					userCount = rs.getInt(1);
					 UserTotalCountList.add(userCount);
				}
				hadResults = cStmt.getMoreResults();
			}
			
			response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
			response.setMessage(SpotLightConstants.CONSTANT_SELLER_TOTAL_REVENUE);
			response.setData(UserTotalCountList);
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