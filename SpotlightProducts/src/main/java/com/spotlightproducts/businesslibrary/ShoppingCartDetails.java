package com.spotlightproducts.businesslibrary;

import com.spotlightproducts.dao.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.ErrorManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.Connection;
import com.spotlightproducts.dao.DatabaseResponse;
import com.spotlightproducts.utilities.SpotLightConstants;

public class ShoppingCartDetails {

	public DatabaseResponse<ShoppingCart> getUserShoppingCart(String email) {
		DatabaseResponse<ShoppingCart> response = new DatabaseResponse<ShoppingCart>();
		List<ShoppingCart> shoppingCartList = new ArrayList<ShoppingCart>();
		try {
			
			Connection con = DatabaseConnection.getDatabaseConnection();
			CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_GET_USER_SHOPPING_CART);
			CommonUtilities user = new CommonUtilities();
			int userId = user.getUserId(email);
			cStmt.setInt(1, userId); // this was set 1 previously
			boolean hadResults = cStmt.execute();
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
			response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
			response.setMessage(SpotLightConstants.CONSTANT_SHOPPING_CART_DATA_FETCHED_SUCCESSFULLY);
			response.setData(shoppingCartList);
			con.close();
			return response;

		} catch (Exception e) {
			System.out.println(e);
		}
		response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
		response.setMessage(SpotLightConstants.CONSTANT_TECHNICAL_FAILURE);
		return response;

	}

	public DatabaseResponse modifyUserShoppingCart(List<ShoppingCart> shoppingCart, HttpServletRequest request) {
		DatabaseResponse response = new DatabaseResponse();
		try {
			HttpSession session = request.getSession();
			String email = (String)session.getAttribute("email");
			CommonUtilities user = new CommonUtilities();
			int uniqueUserId = user.getUserId(email);
			Connection con = DatabaseConnection.getDatabaseConnection();
			for (int i = 0; i < shoppingCart.size(); i++) {
				int success = 0;
				String errorMessage = null;
				
				int shoppingCartId = shoppingCart.get(i).getCartId();
				int userId = uniqueUserId;	//this field was set to 1 previously
				int productId = shoppingCart.get(i).getProductId();
				int sellerId = shoppingCart.get(i).getSellerId();
				int quantity = shoppingCart.get(i).getQuantity();
				double price = shoppingCart.get(i).getPrice();
				CallableStatement cStmt = (CallableStatement) con
						.prepareCall(SpotLightConstants.SP_MODIFY_SHOPPING_CART);
				cStmt.setInt(1, shoppingCartId);
				cStmt.setInt(2, userId);
				cStmt.setInt(3, productId);
				cStmt.setInt(4, sellerId);
				cStmt.setInt(5, quantity);
				cStmt.setDouble(6, price);
				boolean hadResults = cStmt.execute();
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
			response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
			con.close();
			return response;

		}

		catch (Exception e) {
			System.out.println(e);
		}
		response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
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
			
			Connection con = DatabaseConnection.getDatabaseConnection();
			CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_ENTRY_DELETE_SHOPPING_CART);
			cStmt.setInt(1, shoppingCartId);
			cStmt.setInt(2, userId);
			cStmt.setInt(3, productId);
			cStmt.setInt(4, sellerId);
			cStmt.setInt(5, quantity);
			boolean hadResults = cStmt.execute();
			
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					success = rs.getInt(1);
					errorMessage = rs.getString(2);
				}

				hadResults = cStmt.getMoreResults();
			}
			if (success == 1) {
				response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
				response.setMessage(SpotLightConstants.CONSTANT_SHOPPING_CART_DATA_FETCHED_SUCCESSFULLY);
				// response.setData(shoppingCartList);
				con.close();
				return response;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
		response.setMessage(errorMessage);
		return response;

	}

}
