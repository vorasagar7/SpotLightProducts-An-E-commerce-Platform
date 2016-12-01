package com.spotlightproducts.businesslibrary;

import com.spotlightproducts.dao.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.ErrorManager;

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
			CallableStatement cStmt = (CallableStatement) con.prepareCall("{call sp_User_Shopping_Cart_Get(?)}");
			cStmt.setInt(1, 1); // this needs to be replaced with user email
			boolean hadResults = cStmt.execute();
			System.out.println("hadResults" + hadResults);
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					ShoppingCart shoppingCartObj = new ShoppingCart();
					shoppingCartObj.setCartId(rs.getInt(1));
					shoppingCartObj.setProductId(rs.getInt(2));
					shoppingCartObj.setBuyerId(rs.getInt(3));
					shoppingCartObj.setSellerId(rs.getInt(4));
					shoppingCartObj.setProductName(rs.getString(5));
					shoppingCartObj.setModelId(rs.getString(6));
					shoppingCartObj.setBrandName(rs.getString(7));
					shoppingCartObj.setCategoryName(rs.getString(8));
					shoppingCartObj.setDescription(rs.getString(9));
					shoppingCartObj.setSellerName(rs.getString(10));
					shoppingCartObj.setQuantity(rs.getInt(11));
					shoppingCartObj.setPrice(rs.getDouble(12));
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

	public DatabaseResponse modifyUserShoppingCart(List<ShoppingCart> shoppingCart) {
		DatabaseResponse response = new DatabaseResponse();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = (Connection) DriverManager
					.getConnection("jdbc:mysql://localhost:3306/spotlightproducts", "admin", "admin");
			for (int i = 0; i < shoppingCart.size(); i++) {
				int success = 0;
				String errorMessage = null;
				
				int shoppingCartId = shoppingCart.get(i).getCartId();
				int userId = 1;
				int productId = shoppingCart.get(i).getProductId();
				int sellerId = shoppingCart.get(i).getSellerId();
				int quantity = shoppingCart.get(i).getQuantity();
				double price = shoppingCart.get(i).getPrice();
				CallableStatement cStmt = (CallableStatement) con
						.prepareCall("{call sp_Modify_Shopping_Cart(?,?,?,?,?,?)}");
				cStmt.setInt(1, shoppingCartId);
				cStmt.setInt(2, userId);
				cStmt.setInt(3, productId);
				cStmt.setInt(4, sellerId);
				cStmt.setInt(5, quantity);
				cStmt.setDouble(6, price);
				boolean hadResults = cStmt.execute();
				System.out.println("hadResults" + hadResults);
				while (hadResults) {
					ResultSet rs = (ResultSet) cStmt.getResultSet();
					while (rs.next()) {
						success = rs.getInt(1);
						errorMessage = rs.getString(2);
						int newShoppingCartId = rs.getInt(3);
					}

					hadResults = cStmt.getMoreResults();
				}
			}
			response.setStatus("Success");
			con.close();
			return response;

		}

		catch (Exception e) {
			System.out.println(e);
		}
		response.setStatus("Failure");
		//response.setMessage(errorMessage);
		return response;

	}

	public DatabaseResponse deleteFromShoppingCart(ShoppingCart shoppingCart) {
		int success = 0;
		String errorMessage = null;
		DatabaseResponse response = new DatabaseResponse();
		int shoppingCartId = shoppingCart.getCartId();
		int userId = shoppingCart.getBuyerId();
		int productId = shoppingCart.getProductId();
		int sellerId = shoppingCart.getSellerId();
		int quantity = shoppingCart.getQuantity();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/spotlightproducts",
					"admin", "admin");
			// ResultSet rs=stmt.executeQuery("call
			// sp_Check_For_Authentication("+userName+","+password+")");
			CallableStatement cStmt = (CallableStatement) con
					.prepareCall("{call sp_Shopping_Cart_Entry_Delete(?,?,?,?,?)}");
			cStmt.setInt(1, shoppingCartId);
			cStmt.setInt(2, userId);
			cStmt.setInt(3, productId);
			cStmt.setInt(4, sellerId);
			cStmt.setInt(5, quantity);

			// ResultSet rs = cStmt.execute();
			boolean hadResults = cStmt.execute();
			System.out.println("hadResults" + hadResults);
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					success = rs.getInt(1);
					errorMessage = rs.getString(2);
				}

				hadResults = cStmt.getMoreResults();
			}
			if (success == 1) {
				response.setStatus("Success");
				response.setMessage("Shopping Cart Data fetched successfully.....");
				// response.setData(shoppingCartList);
				con.close();
				return response;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		response.setStatus("Failure");
		response.setMessage(errorMessage);
		return response;

	}

}
