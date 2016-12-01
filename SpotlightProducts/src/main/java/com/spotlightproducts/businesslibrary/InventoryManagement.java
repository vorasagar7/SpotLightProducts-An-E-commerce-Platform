package com.spotlightproducts.businesslibrary;

import com.spotlightproducts.SpotLightConstants;
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
import com.spotlightproducts.dao.DatabaseResponse;
import com.spotlightproducts.dao.User;

public class InventoryManagement {

		public DatabaseResponse<ReferenceData> getReferenceListItems() {
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
		
		public DatabaseResponse savePaymentDetails(UserPaymentDetailsDao userDetails) {
			DatabaseResponse response = new DatabaseResponse();
			String fullName = userDetails.getFullName();
			int typeOfPayment = userDetails.getTypeOfPayment();
			String address1 = userDetails.getAddress1();
			String address2 = userDetails.getAddress2();
			String city = userDetails.getCity();
			String state = userDetails.getState();
			String country = userDetails.getCountry();
			int zipcode = userDetails.getZip_code();
			String full_address = address1+" "+address2+" "+city+" "+state+" "+country+" "+zipcode;
			try {
				
				Connection con = DatabaseConnection.getDatabaseConnection();
				CallableStatement cStmt = (CallableStatement) con.prepareCall(SpotLightConstants.SP_DO_PAYMENT_DELIVERY);
				cStmt.setInt(1, 1);
				cStmt.setInt(2, typeOfPayment);
				cStmt.setString(3, full_address);
				boolean hadResults = cStmt.execute();
				while (hadResults) {
					ResultSet rs = (ResultSet) cStmt.getResultSet();
					while (rs.next()) {
						int id = rs.getInt(1);
						if (id == 1) {
							con.close();
							response.setStatus(SpotLightConstants.CONSTANT_SUCCESS);
							response.setMessage(SpotLightConstants.CONSTANT_ORDER_SUCCESSFULLY_PLACED);
							return response;
						} else {
							con.close();
							response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
							response.setMessage(SpotLightConstants.CONSTANT_ORDER_CANNOT_PLACED);
							return response;
						}

					}
					hadResults = cStmt.getMoreResults();
				}
				con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
			response.setStatus(SpotLightConstants.CONSTANT_FAILURE);
			response.setMessage(SpotLightConstants.CONSTANT_TECHNICAL_FAILURE);
			return response;

		}
	
}
