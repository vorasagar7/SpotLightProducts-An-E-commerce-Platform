package com.spotlightproducts.businesslibrary;

import com.spotlightproducts.dao.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.Connection;
import com.spotlightproducts.dao.DatabaseResponse;

public class ShoppingCartDetails {

			
		public DatabaseResponse<ShoppingCart> getUserShoppingCart(String email) {
			DatabaseResponse<ShoppingCart> response = new DatabaseResponse<ShoppingCart>();
			List<ShoppingCart> shoppingCartList = new ArrayList<ShoppingCart>();
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/spotlightproducts",
						"admin", "admin");
				// ResultSet rs=stmt.executeQuery("call
				// sp_Check_For_Authentication("+userName+","+password+")");
				CallableStatement cStmt = (CallableStatement) con.prepareCall("{call sp_User_Shopping_Cart_Get(?)}");
				cStmt.setInt(1, 1); // this needs to be replaced with user email
				// ResultSet rs = cStmt.execute();
				boolean hadResults = cStmt.execute();
				System.out.println("hadResults" + hadResults);
				while (hadResults) {
					ResultSet rs = (ResultSet) cStmt.getResultSet();
					while (rs.next()) {
							ShoppingCart shoppingCartObj = new ShoppingCart();
							shoppingCartObj.setCartId(rs.getInt(1));
							shoppingCartObj.setProductId(rs.getInt(2));
							shoppingCartObj.setProductName(rs.getString(2));
							shoppingCartObj.setModelId(rs.getString(3));
							shoppingCartObj.setBrandName(rs.getString(4));
							shoppingCartObj.setCategoryName(rs.getString(5));
							shoppingCartObj.setDescription(rs.getString(6));
							shoppingCartObj.setSellerName(rs.getString(7));
							shoppingCartObj.setDescription(rs.getString(8));
							shoppingCartObj.setPrice(rs.getDouble(9));
							shoppingCartList.add(shoppingCartObj);
						}

					hadResults = cStmt.getMoreResults();
				}
				response.setStatus("Success");
				response.setMessage("Shopping Cart Data fetched successfully.....");
				response.setData(shoppingCartList);
				con.close();
				return response;
				
			} catch (Exception e) {
				System.out.println(e);
			}
			response.setStatus("Failure");
			response.setMessage("Technical Error. Sorry... Try Again...");
			return response;

		}
	
}

