package com.spotlightproducts.businesslibrary;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.Connection;
import com.spotlightproducts.dao.DatabaseResponse;
import com.spotlightproducts.dao.Product;
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
					
					userId = rs.getInt(0);
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

}
