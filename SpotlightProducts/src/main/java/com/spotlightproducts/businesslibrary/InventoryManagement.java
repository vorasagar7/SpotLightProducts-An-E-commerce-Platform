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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.Connection;
import com.spotlightproducts.utilities.SpotLightConstants;

public class InventoryManagement {

		public DatabaseResponse<Product> addSellerProducts(Product product, HttpServletRequest request) {
			
			DatabaseResponse response = new DatabaseResponse();
			
			try {
				
			String productName = product.getProductName();
			String modelId = product.getModelId();
			int brandId = product.getBrandId();
			int categoryId = product.getCategoryId();
			int sellerId = CommonUtilities.getUserId((String)request.getSession().getAttribute(SpotLightConstants.CONSTANT_EMAIL));
			String description = product.getDescription();
			int SpotlightProduct = product.getIsSpotlight();
			boolean isSpotlightProduct = (SpotlightProduct == 1) ? true : false;
			int quantity = product.getQuantity();
			double price = product.getPrice();
			Connection con = DatabaseConnection.getDatabaseConnection();
			CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_ADD_SELLER_PRODUCT);
				boolean hadResults = cStmt.execute();
				while (hadResults) {
					ResultSet rs = (ResultSet) cStmt.getResultSet();
					while (rs.next()) {
						response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
						response.setMessage("");		
					}
					hadResults = cStmt.getMoreResults();
				}
				con.close();
				response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
				response.setMessage("");
				return response;
			} catch (Exception e) {
				System.out.println(e);
			}
			response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
			response.setMessage(SpotLightConstants.CONSTANT_TECHNICAL_FAILURE);
			return response;

		}
		
		public DatabaseResponse<Product> editSellerProducts(List<Product> products, HttpServletRequest request) {
			DatabaseResponse response = new DatabaseResponse();
			
			int success = 0;
			String errorMessage = null;
			HttpSession session = request.getSession();
			String email = (String)session.getAttribute("email");
			int sellerId = CommonUtilities.getUserId(email);
			try {
				
				Connection con = DatabaseConnection.getDatabaseConnection();
				for(int i=0;i < products.size();i++)
				{
					
					
					int productId = products.get(i).getProductId();
					int quantity = products.get(i).getQuantity();
					double price = products.get(i).getPrice();
					
					CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_INVENTORY_MANAGEMENT_MODIFY_QUANTITY);
					cStmt.setInt(1, productId);
					cStmt.setInt(2, sellerId);
					cStmt.setInt(3, quantity);
					cStmt.setDouble(4, price);
					boolean hadResults = cStmt.execute();
					while (hadResults) 
					{
						ResultSet rs = (ResultSet) cStmt.getResultSet();
						while (rs.next()) 
						{
							success = rs.getInt(1);
							errorMessage = rs.getString(2);
						}

						hadResults = cStmt.getMoreResults();
					}
				} // End of for
				response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
				response.setMessage(errorMessage);
				con.close();
				return response;

			}

			catch (Exception e) {
				System.out.println(e);
			}
			response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
			response.setMessage(errorMessage);
			return response;

		}
			
		public DatabaseResponse<String> removeSellerProducts(Product product, HttpServletRequest request) {
			DatabaseResponse response = new DatabaseResponse();
			HttpSession session = request.getSession();
			String email = (String)session.getAttribute("email");
			int id = CommonUtilities.getUserId(email);
			
			try {
				
				Connection con = DatabaseConnection.getDatabaseConnection();
				CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_SELLER_DELETE_PRODUCT);
				System.out.println(product.getProductId());
				System.out.println(id);
				cStmt.setInt(1, product.getProductId());
				cStmt.setInt(2, id);
				boolean hadResults = cStmt.execute();
				while (hadResults) {
					ResultSet rs = (ResultSet) cStmt.getResultSet();
					while (rs.next()) {
						response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
						response.setMessage(rs.getString(2));
					}
					hadResults = cStmt.getMoreResults();
				}
				con.close();
				
				return response;
			} catch (Exception e) {
				System.out.println(e);
			}
			response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
			response.setMessage(SpotLightConstants.CONSTANT_TECHNICAL_FAILURE);
			return response;

		}
		
		public DatabaseResponse<Product> getApprovedSellerProducts(int id) {
			DatabaseResponse response = new DatabaseResponse();
			List<Product> sellerProductList = new ArrayList<Product>();
			try {
				
				Connection con = DatabaseConnection.getDatabaseConnection();
				CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_GET_SELLERAPPROVED_PRODUCT);
				cStmt.setInt(1, id);
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
						product.setBrandName(rs.getString(7));
						product.setCategoryName(rs.getString(8));
						sellerProductList.add(product);	
					}
					hadResults = cStmt.getMoreResults();
				}
				response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
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
		
		public DatabaseResponse<ReferenceData> getBrandCategoryItems() {
			DatabaseResponse response = new DatabaseResponse();
			List<ReferenceData> referenceList = new ArrayList<ReferenceData>();

			try {
				
				Connection con = DatabaseConnection.getDatabaseConnection();
				CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_BRAND_CATEGORY_REFERENCE_DATA);
				boolean hadResults = cStmt.execute();
				while (hadResults) {
					ResultSet rs = (ResultSet) cStmt.getResultSet();
					while (rs.next()) {
							ReferenceData refData = new ReferenceData();
							refData.setId(rs.getInt(1));
							refData.setObjectId(rs.getInt(2));
							refData.setName(rs.getString(3));
							referenceList.add(refData);						
					}
					hadResults = cStmt.getMoreResults();
				}
				con.close();
				response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
				response.setMessage("");
				response.setData(referenceList);
				return response;
			} catch (Exception e) {
				System.out.println(e);
			}
			response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
			response.setMessage(SpotLightConstants.CONSTANT_TECHNICAL_FAILURE);
			response.setData(referenceList);
			return response;

		}
		
	
}
