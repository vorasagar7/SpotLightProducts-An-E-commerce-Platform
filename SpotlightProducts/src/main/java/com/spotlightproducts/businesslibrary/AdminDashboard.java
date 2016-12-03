package com.spotlightproducts.businesslibrary;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.Connection;
import com.spotlightproducts.dao.DatabaseResponse;
import com.spotlightproducts.dao.Product;
import com.spotlightproducts.dao.SpotLightProductsGraph;
import com.spotlightproducts.dao.User;
import com.spotlightproducts.utilities.SpotLightConstants;

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
	
	public DatabaseResponse<SpotLightProductsGraph> getUsersGraph() {
		DatabaseResponse<SpotLightProductsGraph> response = new DatabaseResponse<SpotLightProductsGraph>();
		List<SpotLightProductsGraph> userRegisterListByMonth = new ArrayList<SpotLightProductsGraph>();
		try {
			
			Connection con = DatabaseConnection.getDatabaseConnection();
			CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_GET_USER_COUNT_BY_MONTH);
			boolean hadResults = cStmt.execute();
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					
					SpotLightProductsGraph graphObject = new SpotLightProductsGraph();
					graphObject.setTotalValue(rs.getInt(1));
					graphObject.setMonth(rs.getString(2));
					graphObject.setYear(rs.getInt(3));
					userRegisterListByMonth.add(graphObject);	
				}
				hadResults = cStmt.getMoreResults();
			}
			response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
			response.setMessage(SpotLightConstants.CONSTANT_USER_ORDER);
			response.setData(userRegisterListByMonth);
			con.close();
			return response;
		} catch (Exception e) {
			System.out.println(e);
		}
		response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
		response.setMessage(SpotLightConstants.CONSTANT_TECHNICAL_FAILURE);
		return response;
	}

	public DatabaseResponse<Product> getPendingProductsList() {
		DatabaseResponse response = new DatabaseResponse();
		List<Product> productList = new ArrayList<Product>();
		try {
			Connection con = DatabaseConnection.getDatabaseConnection();
			CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_GET_PENDING_PRODUCTS);
			boolean hadResults = cStmt.execute();
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					Product productObj = new Product();
					productObj.setProductId(rs.getInt(1));
					productObj.setProductName(rs.getString(2));
					productObj.setModelId(rs.getString(3));
					productObj.setBrandName(rs.getString(4));
					productObj.setCategoryName(rs.getString(5));
					productObj.setSellerName(rs.getString(6));
					productObj.setPrice(rs.getDouble(7));
					productObj.setQuantity(rs.getInt(8));
					productObj.setIsSpotlight(rs.getInt(8));
					productList.add(productObj);

				}
				hadResults = cStmt.getMoreResults();
			}
			con.close();
			response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
			response.setMessage((hadResults) ? SpotLightConstants.CONSTANT_PENDING_PRODUCT_LIST : SpotLightConstants.CONSTANT_NO_PENDING_PRODUCT_LIST );
			response.setData(productList);
			return response;
		} catch (Exception e) {
			System.out.println(e);
		}
		response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
		response.setMessage(SpotLightConstants.CONSTANT_TECHNICAL_FAILURE);
		response.setData(productList);
		return response;
	}
	
	public DatabaseResponse<Product> getAllProductsList() {
		DatabaseResponse response = new DatabaseResponse();
		List<Product> productList = new ArrayList<Product>();
		try {
			Connection con = DatabaseConnection.getDatabaseConnection();
			CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_GET_ALL_PRODUCTS);
			boolean hadResults = cStmt.execute();
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					Product productObj = new Product();
					productObj.setProductId(rs.getInt(1));
					productObj.setProductName(rs.getString(2));
					productObj.setModelId(rs.getString(3));
					productObj.setBrandName(rs.getString(4));
					productObj.setCategoryName(rs.getString(5));
					productObj.setSellerName(rs.getString(6));
					productObj.setPrice(rs.getDouble(7));
					productObj.setQuantity(rs.getInt(8));
					productObj.setIsSpotlight(rs.getInt(8));
					productList.add(productObj);

				}
				hadResults = cStmt.getMoreResults();
			}
			con.close();
			response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
			response.setMessage((hadResults) ? SpotLightConstants.CONSTANT_PENDING_PRODUCT_LIST : SpotLightConstants.CONSTANT_NO_PENDING_PRODUCT_LIST );
			response.setData(productList);
			return response;
		} catch (Exception e) {
			System.out.println(e);
		}
		response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
		response.setMessage(SpotLightConstants.CONSTANT_TECHNICAL_FAILURE);
		response.setData(productList);
		return response;
	}

	public DatabaseResponse<Product> approvePendingProducts(Product product, HttpServletRequest request) {
		DatabaseResponse<Product> response = new DatabaseResponse<Product>();
		List<Product> productList = new ArrayList<Product>();
		try {
			Connection con = DatabaseConnection.getDatabaseConnection();
			CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_APPROVE_PENDING_PRODUCT);
			cStmt.setInt(1, product.getProductId());
			cStmt.setString(2, (String)request.getSession().getAttribute(SpotLightConstants.CONSTANT_EMAIL));
			boolean hadResults = cStmt.execute();
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					int success = rs.getInt(1);
					if(success == 1)
					{
						response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
						response.setMessage(rs.getString(2));
						response.setData(productList);
						return response;
					}
					else
					{
						response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
						response.setMessage(rs.getString(2));
						response.setData(productList);
						return response;
					}

				}
				hadResults = cStmt.getMoreResults();
			}
			con.close();
			response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
			response.setMessage(SpotLightConstants.CONSTANT_TECHNICAL_FAILURE);
			response.setData(productList);
			return response;
		} catch (Exception e) {
			System.out.println(e);
		}
		response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
		response.setMessage(SpotLightConstants.CONSTANT_TECHNICAL_FAILURE);
		response.setData(productList);
		return response;
	}

	public DatabaseResponse<Product> rejectPendingProduct(Product product, HttpServletRequest request) {
		DatabaseResponse<Product> response = new DatabaseResponse<Product>();
		List<Product> productList = new ArrayList<Product>();
		try {
			Connection con = DatabaseConnection.getDatabaseConnection();
			CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_REJECT_PENDING_PRODUCT);
			cStmt.setInt(1, product.getProductId());
			cStmt.setString(2, (String)request.getSession().getAttribute(SpotLightConstants.CONSTANT_EMAIL));
			boolean hadResults = cStmt.execute();
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					int success = rs.getInt(1);
					if(success == 1)
					{
						response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
						response.setMessage(rs.getString(2));
						response.setData(productList);
						return response;
					}
					else
					{
						response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
						response.setMessage(rs.getString(2));
						response.setData(productList);
						return response;
					}

				}
				hadResults = cStmt.getMoreResults();
			}
			con.close();
			response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
			response.setMessage(SpotLightConstants.CONSTANT_TECHNICAL_FAILURE);
			response.setData(productList);
			return response;
		} catch (Exception e) {
			System.out.println(e);
		}
		response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
		response.setMessage(SpotLightConstants.CONSTANT_TECHNICAL_FAILURE);
		response.setData(productList);
		return response;
	}

	public DatabaseResponse<Product> removeAnyProduct(Product product, HttpServletRequest request) {
		DatabaseResponse<Product> response = new DatabaseResponse<Product>();
		List<Product> productList = new ArrayList<Product>();
		try {
			Connection con = DatabaseConnection.getDatabaseConnection();
			CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_DELETE_PRODUCT);
			cStmt.setInt(1, product.getProductId());
			cStmt.setString(2, (String)request.getSession().getAttribute(SpotLightConstants.CONSTANT_EMAIL));
			boolean hadResults = cStmt.execute();
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					int success = rs.getInt(1);
					if(success == 1)
					{
						response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
						response.setMessage(rs.getString(2));
						response.setData(productList);
						return response;
					}
					else
					{
						response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
						response.setMessage(rs.getString(2));
						response.setData(productList);
						return response;
					}

				}
				hadResults = cStmt.getMoreResults();
			}
			con.close();
			response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
			response.setMessage(SpotLightConstants.CONSTANT_TECHNICAL_FAILURE);
			response.setData(productList);
			return response;
		} catch (Exception e) {
			System.out.println(e);
		}
		response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
		response.setMessage(SpotLightConstants.CONSTANT_TECHNICAL_FAILURE);
		response.setData(productList);
		return response;
	}
}