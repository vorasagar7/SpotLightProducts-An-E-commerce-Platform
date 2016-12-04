package com.spotlightproducts.businesslibrary;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.Connection;
import com.spotlightproducts.dao.DatabaseResponse;
import com.spotlightproducts.dao.Product;
import com.spotlightproducts.dao.User;
import com.spotlightproducts.utilities.SpotLightConstants;

public class CommonUtilities {
	
	public static int getUserId(String email) {
		
		int userId = 0;
		try {
			
			Connection con = DatabaseConnection.getDatabaseConnection();
			CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_GET_USER_ID);
			cStmt.setString(1, email);
			boolean hadResults = cStmt.execute();
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					
					userId = rs.getInt(1);
					return userId;
				}
				hadResults = cStmt.getMoreResults();
			}
			con.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return userId;

	}
	
public static User getUserDataForLogin(String email) {
		
		int userId = 0;
		int roleId = 0;
		User user = new User();
		user.setUserId(userId);
	    user.setRoleId(roleId);
		try {
			
			Connection con = DatabaseConnection.getDatabaseConnection();
			CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_GET_USER_DETAILS_FOR_LOGIN);
			cStmt.setString(1, email);
			boolean hadResults = cStmt.execute();
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					
					userId = rs.getInt(1);
					roleId = rs.getInt(2);
					user.setUserId(userId);
				    user.setRoleId(roleId);
				}
				hadResults = cStmt.getMoreResults();
			}
			con.close();
			
		} 
		catch (Exception e) {
			System.out.println(e);
		}
		
		return user;

	}

}
