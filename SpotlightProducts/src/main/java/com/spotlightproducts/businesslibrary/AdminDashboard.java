package com.spotlightproducts.businesslibrary;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.Connection;
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
			CallableStatement cStmt = (CallableStatement) con.prepareCall("{call sp_get_Total_Count_Of_User(?)}");
			cStmt.setInt(1, type_Of_Role);
			boolean hadResults = cStmt.execute();
			int userCount = 0;
			System.out.println("hadResults" + hadResults);
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					userCount = rs.getInt(1);
					 UserTotalCountList.add(userCount);
				}
				hadResults = cStmt.getMoreResults();
			}
			type_Of_Role = 2;
			cStmt = (CallableStatement) con.prepareCall("{call sp_get_Total_Count_Of_User(?)}");
			cStmt.setInt(1, type_Of_Role);
			hadResults = cStmt.execute();
			userCount = 0;
			System.out.println("hadResults" + hadResults);
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					userCount = rs.getInt(1);
					 UserTotalCountList.add(userCount);
				}
				hadResults = cStmt.getMoreResults();
			}
			
			response.setStatus("Success");
			response.setMessage("Seller's Total Revenue");
			response.setData(UserTotalCountList);
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