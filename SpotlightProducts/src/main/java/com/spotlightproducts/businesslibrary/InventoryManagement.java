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

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.Connection;
import com.spotlightproducts.utilities.SpotLightConstants;

public class InventoryManagement {

		public DatabaseResponse<Product> addSellerProducts() {
			DatabaseResponse response = new DatabaseResponse();
			List<ReferenceData> referenceList = new ArrayList<ReferenceData>();

			try {
				
				Connection con = DatabaseConnection.getDatabaseConnection();
				CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_GET_REFERENCE_DATA);
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
		
		public DatabaseResponse<Product> editSellerProducts() {
			DatabaseResponse response = new DatabaseResponse();
			List<ReferenceData> referenceList = new ArrayList<ReferenceData>();

			try {
				
				Connection con = DatabaseConnection.getDatabaseConnection();
				CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_GET_REFERENCE_DATA);
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
		
		
		public DatabaseResponse<Product> removeSellerProducts() {
			DatabaseResponse response = new DatabaseResponse();
			List<ReferenceData> referenceList = new ArrayList<ReferenceData>();

			try {
				
				Connection con = DatabaseConnection.getDatabaseConnection();
				CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_GET_REFERENCE_DATA);
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
		
		public DatabaseResponse<Product> getApprovedSellerProducts(int id) {
			DatabaseResponse response = new DatabaseResponse();
			List<Product> sellerProductList = new ArrayList<Product>();
			try {
				
				Connection con = DatabaseConnection.getDatabaseConnection();
				CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_GET_SELLER_APPROVED_PRODUCT);
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
		
		
	
}
